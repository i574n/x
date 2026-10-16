import base64
import hashlib
import hmac
import json
import sys
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from urllib.parse import parse_qs, quote, unquote, urlsplit

world_path, port_path, log_path = sys.argv[1:4]
with open(world_path, encoding="utf-8") as f:
    world = json.load(f)
users_by_handle = {u["username"].lower(): u for u in world["users"]}
users_by_id = {u["id"]: u for u in world["users"]}
posts_by_id = {p["id"]: dict(p, author_id=u["id"]) for u in world["users"] for p in u.get("posts", [])}
created = {}


def percent(s):
    return quote(s, safe="-._~")


def oauth1_signature(method, url, params, consumer_secret, token_secret):
    pairs = sorted((percent(k), percent(v)) for k, v in params)
    base = "&".join([method, percent(url), percent("&".join(f"{k}={v}" for k, v in pairs))])
    key = f"{percent(consumer_secret)}&{percent(token_secret)}".encode()
    return base64.b64encode(hmac.new(key, base.encode(), hashlib.sha1).digest()).decode()


DOC_PARAMS = [
    ("include_entities", "true"), ("status", "Hello Ladies + Gentlemen, a signed OAuth request!"),
    ("oauth_consumer_key", "xvz1evFS4wEEPTGEFPHBog"), ("oauth_nonce", "kYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cg"),
    ("oauth_signature_method", "HMAC-SHA1"), ("oauth_timestamp", "1318622958"),
    ("oauth_token", "370773112-GmHxMAgYyLbNEtIKZeRNFsMKPR9EyMZeS9weJAEb"), ("oauth_version", "1.0"),
]
assert oauth1_signature("POST", "https://api.x.com/1.1/statuses/update.json", DOC_PARAMS,
                        "kAcSOqF21Fu85e7zjz7ZN2U4ZRhfV3WpwPAoE3Z7kBw", "LswwdoUaIvS8ltyTt5jkRh4J50vUPVVHtR2YPi5kE") == "Ls93hJiZbQ3akF3HF3x1Bz8/zU4=", "the OAuth 1.0a verifier does not reproduce the published example"


def oauth1_valid(header, method, url):
    fields = {}
    for part in header[len("OAuth "):].split(","):
        k, _, v = part.strip().partition("=")
        fields[unquote(k)] = unquote(v.strip('"'))
    o = world["oauth1"]
    if fields.get("oauth_consumer_key") != o["consumer_key"] or fields.get("oauth_token") != o["token"]:
        return False
    params = [(k, v) for k, v in fields.items() if k != "oauth_signature"]
    return fields.get("oauth_signature") == oauth1_signature(method, url, params, o["consumer_secret"], o["token_secret"])
next_id = [9001]


def public(user):
    return {"id": user["id"], "name": user["name"], "username": user["username"]}


def problem(status, title, detail):
    return status, {"title": title, "detail": detail, "type": "about:blank", "status": status}


def in_range(text, low, high):
    return text.isdigit() and low <= int(text) <= high


def listed(query, name):
    return [v for v in query.get(name, [""])[0].split(",") if v]


def kinds(post):
    return {r["type"] for r in post.get("refs", [])}


def rendered(post, fields):
    out = {"id": post["id"], "text": post["text"], "edit_history_post_ids": [post["id"]]}
    if "created_at" in fields:
        out["created_at"] = post["created_at"]
    if "author_id" in fields:
        out["author_id"] = post["author_id"]
    if "entities" in fields and post.get("urls"):
        out["entities"] = {"urls": post["urls"]}
    if "attachments" in fields and post.get("media"):
        out["attachments"] = {"media_keys": [m["media_key"] for m in post["media"]]}
    return out


def with_expansions(posts, query):
    fields = listed(query, "post.fields")
    expansions = listed(query, "expansions")
    data = []
    included, users, media = {}, {}, {}
    for post in posts:
        item = rendered(post, fields)
        if "referenced_posts" in expansions and post.get("refs"):
            item["referenced_posts"] = post["refs"]
            for r in post["refs"]:
                target = posts_by_id.get(r["id"])
                if target:
                    included[target["id"]] = rendered(target, fields)
                    if "referenced_posts.author_id" in expansions:
                        users[target["author_id"]] = {"id": target["author_id"]}
        if "attachments.media_keys" in expansions:
            for m in post.get("media", []):
                media[m["media_key"]] = {k: v for k, v in m.items() if k == "media_key" or k in listed(query, "media.fields")}
        data.append(item)
    body = {"data": data} if data else {}
    includes = {k: list(v.values()) for k, v in (("posts", included), ("users", users), ("media", media)) if v}
    if includes:
        body["includes"] = includes
    return body


def users_by(query):
    handles = listed(query, "usernames")
    found = [public(users_by_handle[h.lower()]) for h in handles if h.lower() in users_by_handle]
    missing = [h for h in handles if h.lower() not in users_by_handle]
    body = {"data": found} if found else {}
    if missing:
        body["errors"] = [{"value": h, "detail": f"Could not find user with usernames: [{h}].", "title": "Not Found Error", "resource_type": "user", "parameter": "usernames", "type": "https://api.x.com/2/problems/resource-not-found"} for h in missing]
    return 200, body


def users_by_ids(query):
    ids = listed(query, "ids")
    return 200, {"data": [public(users_by_id[i]) for i in ids if i in users_by_id]}


def following(user, query):
    size = query.get("max_results", ["100"])[0]
    if not in_range(size, 1, 1000):
        return problem(400, "Invalid Request", f"max_results must be 1..1000, got {size}")
    start = int(query.get("pagination_token", ["p0"])[0][1:])
    count = min(int(size), world["following_page_size"])
    followed = [users_by_id[i] for i in user.get("following", [])]
    page = followed[start : start + count]
    meta = {"result_count": len(page)}
    if start + count < len(followed):
        meta["next_token"] = f"p{start + count}"
    return 200, {"data": [public(u) for u in page], "meta": meta} if page else {"meta": meta}


def timeline(user, query):
    size = query.get("max_results", ["10"])[0]
    if not in_range(size, 5, 100):
        return problem(400, "Invalid Request", f"max_results must be 5..100, got {size}")
    if "plain_status" in user:
        return user["plain_status"], user["plain_body"]
    if "status" in user:
        return problem(user["status"], user["problem_title"], user["problem_detail"])
    if user.get("protected"):
        return 200, {"errors": [{"title": "Authorization Error", "detail": f"Sorry, you are not authorized to see the posts of @{user['username']}.", "type": "https://api.x.com/2/problems/not-authorized-for-resource"}]}
    excluded = set(listed(query, "exclude"))
    since = query.get("start_time", [""])[0]
    until = query.get("end_time", [""])[0]
    posts = [posts_by_id[p["id"]] for p in user.get("posts", [])]
    posts = [p for p in posts if not ("replies" in excluded and "replied_to" in kinds(p)) and not ("retweets" in excluded and "reposted" in kinds(p))]
    posts = [p for p in posts if (not since or p["created_at"][:19] >= since[:19]) and (not until or p["created_at"][:19] < until[:19])]
    newest = sorted(posts, key=lambda p: p["created_at"], reverse=True)[: int(size)]
    body = with_expansions(newest, query)
    body["meta"] = {"result_count": len(newest)}
    return 200, body


def lookup(query):
    ids = listed(query, "ids")
    found = [posts_by_id[i] for i in ids if i in posts_by_id]
    body = with_expansions(found, query)
    missing = [i for i in ids if i not in posts_by_id]
    if missing:
        body["errors"] = [{"value": i, "detail": f"Could not find post with ids: [{i}].", "title": "Not Found Error"} for i in missing]
    return 200, body


def route_get(path, query):
    parts = path.strip("/").split("/")
    if parts == ["2", "users", "by"]:
        return users_by(query)
    if parts == ["2", "users"]:
        return users_by_ids(query)
    if parts == ["2", "tweets"]:
        return lookup(query)
    if len(parts) == 4 and parts[:2] == ["2", "users"] and parts[2] in users_by_id:
        user = users_by_id[parts[2]]
        if parts[3] == "following":
            return following(user, query)
        if parts[3] == "tweets":
            return timeline(user, query)
    return problem(404, "Not Found Error", f"no route {path}")


def user_context_only():
    return 403, {"title": "Unsupported Authentication", "detail": "Authenticating with OAuth 2.0 Application-Only is forbidden for this endpoint.  Supported authentication types are [OAuth 1.0a User Context, OAuth 2.0 User Context].", "type": "https://api.x.com/2/problems/unsupported-authentication", "status": 403}


def create(body):
    text = json.loads(body or "{}").get("text", "")
    if not text or len(text) > 280:
        return problem(400, "Invalid Request", "text must be 1 to 280 characters")
    post_id = str(next_id[0])
    next_id[0] += 1
    created[post_id] = text
    return 201, {"data": {"id": post_id, "text": text, "edit_history_post_ids": [post_id]}}


def delete(post_id):
    if post_id not in created:
        return problem(404, "Not Found Error", f"Could not find post with id: [{post_id}].")
    del created[post_id]
    return 200, {"data": {"deleted": True}}


class Handler(BaseHTTPRequestHandler):
    def authorization(self):
        auth = self.headers.get("Authorization", "")
        if auth == "Bearer " + world["token"]:
            return "app"
        if auth == "Bearer " + world["user_token"]:
            return "user"
        if auth.startswith("OAuth ") and oauth1_valid(auth, self.command, "http://" + self.headers.get("Host", "") + urlsplit(self.path).path):
            return "oauth1"
        return None

    def respond(self, status, body):
        payload = (body if isinstance(body, str) else json.dumps(body)).encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(payload)))
        self.end_headers()
        self.wfile.write(payload)

    def logged(self, method, extra=None):
        url = urlsplit(self.path)
        kind = self.authorization()
        entry = {"method": method, "path": url.path, "query": url.query, "authorized": kind is not None, "context": kind}
        if extra:
            entry.update(extra)
        with open(log_path, "a", encoding="utf-8") as log:
            log.write(json.dumps(entry) + "\n")
        return url, kind

    def do_GET(self):
        url, kind = self.logged("GET")
        status, body = problem(401, "Unauthorized", "Unauthorized") if kind is None else route_get(url.path, parse_qs(url.query))
        self.respond(status, body)

    def do_POST(self):
        raw = self.rfile.read(int(self.headers.get("Content-Length", "0"))).decode("utf-8")
        url, kind = self.logged("POST", {"body": raw})
        if kind is None:
            status, body = problem(401, "Unauthorized", "Unauthorized")
        elif kind not in ("user", "oauth1"):
            status, body = user_context_only()
        elif url.path == "/2/tweets":
            status, body = create(raw)
        else:
            status, body = problem(404, "Not Found Error", f"no route {url.path}")
        self.respond(status, body)

    def do_DELETE(self):
        url, kind = self.logged("DELETE")
        parts = url.path.strip("/").split("/")
        if kind is None:
            status, body = problem(401, "Unauthorized", "Unauthorized")
        elif kind not in ("user", "oauth1"):
            status, body = user_context_only()
        elif len(parts) == 3 and parts[:2] == ["2", "tweets"]:
            status, body = delete(parts[2])
        else:
            status, body = problem(404, "Not Found Error", f"no route {url.path}")
        self.respond(status, body)

    def log_message(self, *args):
        pass


server = ThreadingHTTPServer(("127.0.0.1", 0), Handler)
with open(port_path, "w", encoding="utf-8") as f:
    f.write(str(server.server_address[1]))
server.serve_forever()
