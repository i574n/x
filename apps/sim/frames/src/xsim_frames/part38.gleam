import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Uh36, Uh13Nil, Uh29Nil, Uh36Nil, Uh39Nil, Uh3Cons, Uh3Nil, Uh41Nil, Uh44Text, Uh45Cons, Uh45Nil, Uh49Cons, Uh49Nil, Uh50Cons, Uh50Nil, Uh51Cons, Uh51Nil, Us103H1, Us104Heading, Us107None, Us107Some, Us108None, Us108Some, Us2None, Us2Some, Us3None, Us3Some}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, method4, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part12.{items_from_301}
import xsim_frames/part25.{first_value_465, method452, method464, method466, method467, method468, request_of_451}
import xsim_frames/part26.{closure148, closure150, method469, method471, method478, method479, page_from_475, resumed_from_473}
import xsim_frames/part27.{blocks_html_485, consumed_483, element_499, escape_493, joined_508, markup_text_502, method480, trusted_488}
import xsim_frames/part28.{concat_533, header_value_537, method531, method534, method535, method536}
import xsim_frames/part37.{replied_539}

pub fn feed_or_api_450(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    let #(_v17, v18, v19, v20, _v21) = request_of_451(v16)
    let v22 = v18 == "/timeline"
    case v22 {
        True -> {
            let v23 = v19 == ""
            let v25 =
                case v23 {
                    True -> {
                        v14 != ""
                    }
                    False -> False
                }
            let v26 = "millisecond"
            let v27 = atom.create(v26)
            let v28 = erlang_term_coerce(v27)
            let v29 = "erlang"
            let v30 = atom.create(v29)
            let v31 = "monotonic_time"
            let v32 = atom.create(v31)
            let v33 = []
            let v34 = [v28, ..v33]
            let v35 = erlang_term_apply(v30, v32, v34)
            let v36 = erlang_term_coerce(v35)
            let v38 =
                case v23 {
                    True -> {
                        v14 != ""
                    }
                    False -> False
                }
            let #(v343, v344, v345, v346, v347, v348, v349, v350, v351, v352, v353, v354, v355, v356, v357, v358) =
                case v38 {
                    True -> #(v14, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
                    False -> {
                        let #(v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79) =
                            case v12  {
                                Uh36Nil -> {
                                    let v39 = []
                                    let v40 = erlang_term_coerce(v39)
                                    let v42 = erlang_term_coerce("users")
                                    let v43 = erlang_term_coerce(v40)
                                    let v45 = atom.create("maps")
                                    let v47 = atom.create("get")
                                    let v48 = []
                                    let v49 = [v43, ..v48]
                                    let v50 = [v7, ..v49]
                                    let v51 = [v42, ..v50]
                                    let v52 = erlang_term_apply(v45, v47, v51)
                                    let v53 = erlang_term_coerce(v52)
                                    let v55 = atom.create("lists")
                                    let v57 = atom.create("reverse")
                                    let v58 = []
                                    let v59 = [v53, ..v58]
                                    let v60 = erlang_term_apply(v55, v57, v59)
                                    let v62 = items_from_301(v60, Uh29Nil)
                                    let v64 = method452(v62, v62, Uh36Nil)
                                    #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v64, v13, v14)
                                }
                                _ -> #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
                            }
                        let v80 = []
                        let v81 = erlang_term_coerce(v80)
                        let v83 = erlang_term_coerce("users")
                        let v84 = erlang_term_coerce(v81)
                        let v86 = atom.create("maps")
                        let v87 = "get"
                        let v88 = atom.create(v87)
                        let v89 = []
                        let v90 = [v84, ..v89]
                        let v91 = [v72, ..v90]
                        let v92 = [v83, ..v91]
                        let v93 = erlang_term_apply(v86, v88, v92)
                        let v94 = erlang_term_coerce(v93)
                        let v96 = atom.create("lists")
                        let v98 = atom.create("reverse")
                        let v99 = []
                        let v100 = [v94, ..v99]
                        let v101 = erlang_term_apply(v96, v98, v100)
                        let v103 = items_from_301(v101, Uh29Nil)
                        let v105 = method464(v103, Uh3Nil)
                        let v110 =
                            case v23 {
                                True -> Uh3Nil
                                False -> {
                                    split_list_2("&", v19)
                                }
                            }
                        let v111 = first_value_465("d", v110)
                        let v112 = v111 == ""
                        let v114 =
                            case v112 {
                                True -> {
                                    ""
                                }
                                False -> v111
                            }
                        let v115 = v114 == ""
                        let v119 =
                            case v115 {
                                True -> Uh3Nil
                                False -> {
                                    split_list_2(".", v114)
                                }
                            }
                        let v121 = method466(v119, Uh3Nil)
                        let v126 =
                            case v121  {
                                Uh3Cons(v122, v123) -> v122
                                Uh3Nil -> {
                                    "down"
                                }
                            }
                        let v131 =
                            case v23 {
                                True -> Uh3Nil
                                False -> {
                                    split_list_2("&", v19)
                                }
                            }
                        let v132 = first_value_465("f", v131)
                        let v133 = v132 == ""
                        let v135 =
                            case v133 {
                                True -> {
                                    ""
                                }
                                False -> v132
                            }
                        let v136 = v135 == ""
                        let v140 =
                            case v136 {
                                True -> Uh3Nil
                                False -> {
                                    split_list_2(".", v135)
                                }
                            }
                        let v142 = method466(v140, Uh3Nil)
                        let v147 =
                            case v23 {
                                True -> Uh3Nil
                                False -> {
                                    split_list_2("&", v19)
                                }
                            }
                        let v148 = first_value_465("c", v147)
                        let v149 = v148 == ""
                        let v151 =
                            case v149 {
                                True -> {
                                    ""
                                }
                                False -> v148
                            }
                        let v152 = v151 == ""
                        let v156 =
                            case v152 {
                                True -> Uh3Nil
                                False -> {
                                    split_list_2(".", v151)
                                }
                            }
                        let v158 = method466(v156, Uh3Nil)
                        let v160 = method467(v158, Uh13Nil)
                        let v161 = method468(v105, v142)
                        let #(v163, v164) =
                            case v161 {
                                True -> #(v142, v160)
                                False -> {
                                    #(v105, Uh13Nil)
                                }
                            }
                        let v165 = "from"
                        let v169 =
                            case v23 {
                                True -> Uh3Nil
                                False -> {
                                    split_list_2("&", v19)
                                }
                            }
                        let v170 = first_value_465(v165, v169)
                        let v171 = v170 == ""
                        let v173 =
                            case v171 {
                                True -> {
                                    ""
                                }
                                False -> v170
                            }
                        let v174 = v173 == ""
                        let v178 =
                            case v174 {
                                True -> Uh3Nil
                                False -> {
                                    split_list_2(".", v173)
                                }
                            }
                        let v180 = method466(v178, Uh3Nil)
                        let v185 =
                            case v180  {
                                Uh3Cons(v181, v182) -> v181
                                Uh3Nil -> {
                                    ""
                                }
                            }
                        let #(_v194, v195) =
                            case v164  {
                                Uh13Nil -> {
                                    let v186 = v185 == ""
                                    let v188 =
                                        case v186 {
                                            True -> True
                                            False -> {
                                                v126 == "up"
                                            }
                                        }
                                    case v188 {
                                        True -> #(v163, v164)
                                        False -> {
                                            let v189 = { v185 } <> { "T9" }
                                            let v191 = method469(v189, v77, Uh13Nil)
                                            #(v163, v191)
                                        }
                                    }
                                }
                                _ -> #(v163, v164)
                            }
                        let v196 = v126 == "up"
                        let v199 =
                            case v196 {
                                True -> {
                                    method471(v77, Uh36Nil)
                                }
                                False -> v77
                            }
                        let v202 =
                            case v196 {
                                True -> closure148(Nil)
                                False -> closure150(Nil)
                            }
                        let v203 = resumed_from_473(v199, v195)
                        let #(v205, v206) = page_from_475(v202, 50, v203)
                        let v208 = method478(v205, Uh39Nil)
                        let v210 = method479(v208, Uh39Nil)
                        let v212 = method480(v210, Uh41Nil)
                        let v213 = consumed_483(v199, v206)
                        let v216 = Uh44Text("Following")
                        let v218 = Uh45Cons(v216, Uh45Nil)
                        let v219 = Us104Heading(Us103H1, v218)
                        let v221 = Uh49Cons(v219, Uh49Nil)
                        let v222 = blocks_html_485(v221)
                        let v226 = trusted_488("@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700;800&display=swap');@font-face{font-family:'XSans';src:url(/media/fonts/sans.woff2) format('woff2'),url(/media/fonts/sans.ttf) format('truetype');font-display:swap}body{background:#000;color:rgb(231,233,234);-webkit-font-smoothing:antialiased;font-family:'XSans','Inter',-apple-system,BlinkMacSystemFont,'Segoe UI',Roboto,Helvetica,Arial,sans-serif;font-size:15px;line-height:20px;max-width:600px;margin:0 auto;padding:0}img,video{max-width:100%;height:auto;border-radius:16px;margin:8px 0;display:block}video.vid{width:100%;max-height:600px;background:#000;object-fit:contain}article{border-bottom:1px solid rgb(47,51,54)}article:hover{background:rgba(255,255,255,.03)}.row{display:flex;gap:12px;padding:12px 16px}.avatar{width:40px;height:40px;border-radius:9999px;background:rgb(47,51,54);flex:0 0 40px}.content{flex:1 1 auto;min-width:0}article p{margin:2px 0;white-space:pre-wrap;overflow-wrap:anywhere}.content>p:first-child{color:rgb(113,118,123);font-size:14px}article strong{color:rgb(231,233,234);font-weight:700;font-size:15px}p.counts{color:rgb(113,118,123);font-size:13px;margin:4px 0 0}blockquote.quoted{color:rgb(139,152,165);font-size:14px}.repost{opacity:.6;border-left:3px solid #999;padding-left:.6em}.quoted{border-left:3px solid #48c;margin:.3em 0 .3em .6em;padding-left:.6em}.nav{position:sticky;top:0;z-index:9;background:rgba(0,0,0,.85);backdrop-filter:blur(12px);padding:10px 16px;border-bottom:1px solid rgb(47,51,54);font-size:14px}h1{font-size:20px;font-weight:800;padding:8px 16px;margin:0}a.dir{color:rgb(29,155,240);text-decoration:none;margin-right:1em}")
                        let v227 = element_499("style", Uh50Nil, v226)
                        let v229 = "class"
                        let v230 = "nav"
                        let v233 = "/timeline"
                        let v235 = Uh50Cons("action", v233, Uh50Nil)
                        let v236 = Uh50Cons("method", v87, v235)
                        let v237 = Uh50Cons(v229, v230, v236)
                        let v239 = "type"
                        let v243 = Uh50Cons("name", v165, Uh50Nil)
                        let v244 = Uh50Cons(v239, "date", v243)
                        let v245 = ""
                        let v246 = trusted_488(v245)
                        let v247 = element_499("input", v244, v246)
                        let v251 = Uh50Cons(v239, "submit", Uh50Nil)
                        let v253 = escape_493("Go to date")
                        let v254 = element_499("button", v251, v253)
                        let v255 = joined_508(v247, v254)
                        let v256 = element_499("form", v237, v255)
                        let v258 = Uh50Cons(v229, v230, Uh50Nil)
                        let v259 = "a"
                        let v260 = "dir"
                        let v261 = "href"
                        let v263 = Uh50Cons(v261, v233, Uh50Nil)
                        let v264 = Uh50Cons(v229, v260, v263)
                        let v266 = escape_493("Newest first")
                        let v267 = element_499(v259, v264, v266)
                        let v270 = Uh50Cons(v261, "/timeline?d=up", Uh50Nil)
                        let v271 = Uh50Cons(v229, v260, v270)
                        let v273 = escape_493("Oldest first")
                        let v274 = element_499(v259, v271, v273)
                        let v275 = joined_508(v267, v274)
                        let v276 = element_499(v230, v258, v275)
                        let v278 = method531(v212, Uh51Nil)
                        let v282 = trusted_488("(function(){var io=new IntersectionObserver(function(es){es.forEach(function(e){var v=e.target;if(e.isIntersecting&&e.intersectionRatio>=.5){v.play().catch(function(){})}else{v.pause()}})},{threshold:[0,.5,1]});function scan(){document.querySelectorAll('video.vid').forEach(function(v){if(!v.dataset.io){v.dataset.io='1';io.observe(v)}})}scan();new MutationObserver(scan).observe(document.body,{childList:!0,subtree:!0})})()")
                        let v283 = element_499("script", Uh50Nil, v282)
                        let v285 = Uh51Cons(v283, Uh51Nil)
                        let v286 = method534(v278, v285)
                        let v287 = Uh51Cons(v222, v286)
                        let v288 = Uh51Cons(v276, v287)
                        let v289 = Uh51Cons(v256, v288)
                        let v290 = Uh51Cons(v227, v289)
                        let v291 = concat_533(v290)
                        let v292 = markup_text_502(v291)
                        let v293 = method535(v105, v245)
                        let v294 = { "f=" } <> { v293 }
                        let v295 = { v294 } <> { "&c=" }
                        let v297 = method536(v213, Uh3Nil)
                        let v298 = method535(v297, v245)
                        let v299 = { v295 } <> { v298 }
                        let v300 = v126 == "down"
                        let v302 =
                            case v300 {
                                True -> v245
                                False -> {
                                    let v301 = { "&d=" } <> { v126 }
                                    v301
                                }
                            }
                        let v306 =
                            case v212  {
                                Uh41Nil -> v245
                                _ -> {
                                    let v303 = { "\n<a class=\"more\" href=\"/timeline?" } <> { v299 }
                                    let v304 = { v303 } <> { v302 }
                                    let v305 = { v304 } <> { "\">next</a>" }
                                    v305
                                }
                            }
                        let v307 = { v292 } <> { v306 }
                        let v308 = { v307 } <> { "\n<script>(function(){var busy=!1;function last(){var a=document.querySelectorAll('a.more');return a.length?a[a.length-1]:null}function more(){var a=last();if(!a||busy)return;busy=!0;fetch(a.getAttribute('href')).then(function(r){return r.text()}).then(function(h){var d=new DOMParser().parseFromString(h,'text/html');var fa=1;d.querySelectorAll('article.post').forEach(function(x){var y=document.importNode(x,!0);if(fa){y.dataset.c=a.getAttribute('href');fa=0}a.parentNode.insertBefore(y,a)});var n=d.querySelector('a.more');if(n){a.setAttribute('href',n.getAttribute('href'));busy=!1;check()}else a.remove()}).catch(function(){busy=!1})}var base=location.pathname+location.search;function track(){var q=document.querySelectorAll('article.post[data-c]'),c=base;for(var i=0;i<q.length;i++){if(q[i].getBoundingClientRect().top>80)break;c=q[i].dataset.c}if(c!==location.pathname+location.search)history.replaceState(null,'',c)}function check(){var a=last();if(a&&a.getBoundingClientRect().top<innerHeight*2)more()}addEventListener('scroll',function(){check();track()},{passive:!0});check()})()</script>" }
                        let v309 = int.to_string(200)
                        let v310 = { "HTTP/1.1 " } <> { v309 }
                        let v311 = { v310 } <> { " " }
                        let v312 = { v311 } <> { "OK" }
                        let v313 = erlang_term_coerce(v308)
                        let v314 = atom.create(v29)
                        let v316 = atom.create("byte_size")
                        let v317 = []
                        let v318 = [v313, ..v317]
                        let v319 = erlang_term_apply(v314, v316, v318)
                        let v320 = erlang_term_coerce(v319)
                        let v321 = int.to_string(v320)
                        let v322 = { "\r\nContent-Length: " } <> { v321 }
                        let v323 = { "\r\nContent-Type: text/html; charset=utf-8" } <> { v322 }
                        let v324 = { v323 } <> { "\r\nConnection: close\r\n\r\n" }
                        let v325 = { v312 } <> { v324 }
                        let v326 = { v325 } <> { v308 }
                        case v23 {
                            True -> #(v326, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v326)
                            False -> #(v326, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79)
                        }
                    }
                }
            let v359 = atom.create(v26)
            let v360 = erlang_term_coerce(v359)
            let v361 = atom.create(v29)
            let v362 = atom.create(v31)
            let v363 = []
            let v364 = [v360, ..v363]
            let v365 = erlang_term_apply(v361, v362, v364)
            let v366 = erlang_term_coerce(v365)
            let v367 = spiral_wrap_signed(v366 - v36, 64)
            let v370 =
                case v25 {
                    True -> {
                        "cached"
                    }
                    False -> {
                        "rendered"
                    }
                }
            let v371 = { "timeline " } <> { v370 }
            let v372 = { v371 } <> { " " }
            let v373 = erlang_term_coerce(v367)
            let v374 = atom.create(v29)
            let v376 = atom.create("integer_to_binary")
            let v377 = []
            let v378 = [v373, ..v377]
            let v379 = erlang_term_apply(v374, v376, v378)
            let v380 = erlang_term_coerce(v379)
            let v381 = { v372 } <> { v380 }
            let v382 = { v381 } <> { "\n" }
            let v383 = erlang_term_coerce(v15)
            let v384 = erlang_term_coerce(v382)
            let v386 = atom.create("append")
            let v387 = erlang_term_coerce(v386)
            let v388 = []
            let v389 = [v387, ..v388]
            let v390 = erlang_term_coerce(v389)
            let v392 = atom.create("file")
            let v394 = atom.create("write_file")
            let v395 = []
            let v396 = [v390, ..v395]
            let v397 = [v384, ..v396]
            let v398 = [v383, ..v397]
            let v399 = erlang_term_apply(v392, v394, v398)
            let v401 = atom.create("ok")
            let v402 = erlang_term_coerce(v401)
            let _v403 = v399 == v402
            #(v343, v344, v345, v346, v347, v348, v349, v350, v351, v352, v353, v354, v355, v356, v357, v358)
        }
        False -> {
            let v405 = v18 |> string.starts_with("/media/")
            case v405 {
                True -> {
                    let v407 = header_value_537("range", v20)
                    let v408 = spiral_string_length(v18)
                    let v409 = spiral_wrap_signed(v408 - 7, 32)
                    let v410 = spiral_wrap_signed(7 + v409, 32)
                    let v411 = spiral_wrap_signed(v410 - 1, 32)
                    let v412 = spiral_string_slice(v18, 7, v411)
                    let v413 = v412 != ""
                    let v417 =
                        case v413 {
                            True -> {
                                let v415 = v412 |> string.contains("..")
                                v415 == False
                            }
                            False -> False
                        }
                    let v421 =
                        case v417 {
                            True -> {
                                let v419 = v412 |> string.starts_with("/")
                                v419 == False
                            }
                            False -> False
                        }
                    let v425 =
                        case v421 {
                            True -> {
                                let v423 = v412 |> string.starts_with("\\")
                                v423 == False
                            }
                            False -> False
                        }
                    let v429 =
                        case v425 {
                            True -> {
                                let v427 = v412 |> string.contains(":")
                                v427 == False
                            }
                            False -> False
                        }
                    let v847 =
                        case v429 {
                            True -> {
                                let v430 = v412 == ""
                                let v434 =
                                    case v430 {
                                        True -> Uh3Nil
                                        False -> {
                                            split_list_2(".", v412)
                                        }
                                    }
                                let v436 = method4(v434, Uh3Nil)
                                let v442 =
                                    case v436  {
                                        Uh3Cons(v437, v438) -> {
                                            v437 |> string.lowercase
                                        }
                                        Uh3Nil -> {
                                            ""
                                        }
                                    }
                                let v443 = v442 == "jpg"
                                let v445 =
                                    case v443 {
                                        True -> True
                                        False -> {
                                            v442 == "jpeg"
                                        }
                                    }
                                let v466 =
                                    case v445 {
                                        True -> {
                                            "image/jpeg"
                                        }
                                        False -> {
                                            let v447 = v442 == "png"
                                            case v447 {
                                                True -> {
                                                    "image/png"
                                                }
                                                False -> {
                                                    let v449 = v442 == "gif"
                                                    case v449 {
                                                        True -> {
                                                            "image/gif"
                                                        }
                                                        False -> {
                                                            let v451 = v442 == "webp"
                                                            case v451 {
                                                                True -> {
                                                                    "image/webp"
                                                                }
                                                                False -> {
                                                                    let v453 = v442 == "mp4"
                                                                    case v453 {
                                                                        True -> {
                                                                            "video/mp4"
                                                                        }
                                                                        False -> {
                                                                            let v455 = v442 == "webm"
                                                                            case v455 {
                                                                                True -> {
                                                                                    "video/webm"
                                                                                }
                                                                                False -> {
                                                                                    let v457 = v442 == "woff2"
                                                                                    case v457 {
                                                                                        True -> {
                                                                                            "font/woff2"
                                                                                        }
                                                                                        False -> {
                                                                                            "application/octet-stream"
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                let v467 = { v13 } <> { "/" }
                                let v468 = { v467 } <> { v412 }
                                let v469 = erlang_term_coerce(v468)
                                let v470 = "unicode"
                                let v471 = atom.create(v470)
                                let v472 = "characters_to_list"
                                let v473 = atom.create(v472)
                                let v474 = []
                                let v475 = [v469, ..v474]
                                let v476 = erlang_term_apply(v471, v473, v475)
                                let v478 = atom.create("filelib")
                                let v480 = atom.create("file_size")
                                let v481 = []
                                let v482 = [v476, ..v481]
                                let v483 = erlang_term_apply(v478, v480, v482)
                                let v484 = "erlang"
                                let v485 = atom.create(v484)
                                let v487 = atom.create("is_binary")
                                let v488 = []
                                let v489 = [v483, ..v488]
                                let v490 = erlang_term_apply(v485, v487, v489)
                                let v491 = erlang_term_coerce(v490)
                                let v500 =
                                    case v491 {
                                        True -> {
                                            erlang_term_coerce(v483)
                                        }
                                        False -> {
                                            let v493 = atom.create(v484)
                                            let v495 = atom.create("integer_to_binary")
                                            let v496 = []
                                            let v497 = [v483, ..v496]
                                            let v498 = erlang_term_apply(v493, v495, v497)
                                            erlang_term_coerce(v498)
                                        }
                                    }
                                let v501 = count_of_text_10(v500)
                                let v504 =
                                    case v501  {
                                        Us3None -> 0
                                        Us3Some(v502) -> v502
                                    }
                                let v505 = v504 <= 0
                                case v505 {
                                    True -> {
                                        let v506 = int.to_string(404)
                                        let v507 = { "HTTP/1.1 " } <> { v506 }
                                        let v508 = { v507 } <> { " " }
                                        let v509 = { v508 } <> { "Not Found" }
                                        let v511 = erlang_term_coerce("not found")
                                        let v512 = atom.create(v484)
                                        let v514 = atom.create("byte_size")
                                        let v515 = []
                                        let v516 = [v511, ..v515]
                                        let v517 = erlang_term_apply(v512, v514, v516)
                                        let v518 = erlang_term_coerce(v517)
                                        let v519 = int.to_string(v518)
                                        let v520 = { "\r\nContent-Length: " } <> { v519 }
                                        let v521 = { "\r\nContent-Type: text/plain; charset=utf-8" } <> { v520 }
                                        let v522 = { v521 } <> { "\r\nConnection: close\r\n\r\n" }
                                        let v523 = { v509 } <> { v522 }
                                        let v524 = { v523 } <> { "not found" }
                                        v524
                                    }
                                    False -> {
                                        let v525 = v407 == ""
                                        let v600 =
                                            case v525 {
                                                True -> Us107None
                                                False -> {
                                                    let v528 = v407 |> string.starts_with("bytes=")
                                                    let v529 = v528 == False
                                                    case v529 {
                                                        True -> Us107None
                                                        False -> {
                                                            let v531 = spiral_string_length(v407)
                                                            let v532 = spiral_wrap_signed(v531 - 6, 32)
                                                            let v533 = spiral_wrap_signed(6 + v532, 32)
                                                            let v534 = spiral_wrap_signed(v533 - 1, 32)
                                                            let v535 = spiral_string_slice(v407, 6, v534)
                                                            let v537 = v535 |> string.contains(",")
                                                            case v537 {
                                                                True -> Us107None
                                                                False -> {
                                                                    let v539 = v535 == ""
                                                                    let v543 =
                                                                        case v539 {
                                                                            True -> Uh3Nil
                                                                            False -> {
                                                                                split_list_2("-", v535)
                                                                            }
                                                                        }
                                                                    case v543  {
                                                                        Uh3Cons(v544, v545) -> {
                                                                            case v545  {
                                                                                Uh3Cons(v546, v547) -> {
                                                                                    case v547  {
                                                                                        Uh3Nil -> {
                                                                                            let v548 = v544 == ""
                                                                                            let v550 =
                                                                                                case v548 {
                                                                                                    True -> {
                                                                                                        v546 == ""
                                                                                                    }
                                                                                                    False -> False
                                                                                                }
                                                                                            case v550 {
                                                                                                True -> Us107None
                                                                                                False -> {
                                                                                                    case v548 {
                                                                                                        True -> {
                                                                                                            let v552 = count_of_text_10(v546)
                                                                                                            case v552  {
                                                                                                                Us3None -> Us107None
                                                                                                                Us3Some(v553) -> {
                                                                                                                    let v554 = spiral_wrap_signed(v504 - v553, 32)
                                                                                                                    let v555 = v554 < 0
                                                                                                                    let v556 =
                                                                                                                        case v555 {
                                                                                                                            True -> 0
                                                                                                                            False -> v554
                                                                                                                        }
                                                                                                                    let v557 = spiral_wrap_signed(v504 - 1, 32)
                                                                                                                    Us107Some(v556, v557)
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                        False -> {
                                                                                                            let v562 = v546 == ""
                                                                                                            case v562 {
                                                                                                                True -> {
                                                                                                                    let v563 = count_of_text_10(v544)
                                                                                                                    case v563  {
                                                                                                                        Us3None -> Us107None
                                                                                                                        Us3Some(v564) -> {
                                                                                                                            let v565 = v564 < v504
                                                                                                                            case v565 {
                                                                                                                                True -> {
                                                                                                                                    let v566 = spiral_wrap_signed(v504 - 1, 32)
                                                                                                                                    Us107Some(v564, v566)
                                                                                                                                }
                                                                                                                                False -> Us107None
                                                                                                                            }
                                                                                                                        }
                                                                                                                    }
                                                                                                                }
                                                                                                                False -> {
                                                                                                                    let v573 = count_of_text_10(v544)
                                                                                                                    case v573  {
                                                                                                                        Us3None -> Us107None
                                                                                                                        Us3Some(v575) -> {
                                                                                                                            let v576 = count_of_text_10(v546)
                                                                                                                            case v576  {
                                                                                                                                Us3None -> Us107None
                                                                                                                                Us3Some(v577) -> {
                                                                                                                                    let v578 = v575 <= v577
                                                                                                                                    let v580 =
                                                                                                                                        case v578 {
                                                                                                                                            True -> {
                                                                                                                                                v577 < v504
                                                                                                                                            }
                                                                                                                                            False -> False
                                                                                                                                        }
                                                                                                                                    case v580 {
                                                                                                                                        True -> Us107Some(v575, v577)
                                                                                                                                        False -> Us107None
                                                                                                                                    }
                                                                                                                                }
                                                                                                                            }
                                                                                                                        }
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                        _ -> Us107None
                                                                                    }
                                                                                }
                                                                                _ -> Us107None
                                                                            }
                                                                        }
                                                                        _ -> Us107None
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        case v600  {
                                            Us107None -> {
                                                let v601 = erlang_term_coerce(v468)
                                                let v602 = atom.create(v470)
                                                let v603 = atom.create(v472)
                                                let v604 = []
                                                let v605 = [v601, ..v604]
                                                let v606 = erlang_term_apply(v602, v603, v605)
                                                let v608 = atom.create("file")
                                                let v610 = atom.create("read_file")
                                                let v611 = []
                                                let v612 = [v606, ..v611]
                                                let v613 = erlang_term_apply(v608, v610, v612)
                                                let v614 = erlang_term_coerce(1)
                                                let v615 = atom.create(v484)
                                                let v616 = "element"
                                                let v617 = atom.create(v616)
                                                let v618 = []
                                                let v619 = [v613, ..v618]
                                                let v620 = [v614, ..v619]
                                                let v621 = erlang_term_apply(v615, v617, v620)
                                                let v623 = atom.create("ok")
                                                let v624 = erlang_term_coerce(v623)
                                                let v625 = v621 == v624
                                                let v636 =
                                                    case v625 {
                                                        True -> {
                                                            let v626 = erlang_term_coerce(2)
                                                            let v627 = atom.create(v484)
                                                            let v628 = atom.create(v616)
                                                            let v629 = []
                                                            let v630 = [v613, ..v629]
                                                            let v631 = [v626, ..v630]
                                                            let v632 = erlang_term_apply(v627, v628, v631)
                                                            let v633 = erlang_term_coerce(v632)
                                                            Us2Some(v633)
                                                        }
                                                        False -> Us2None
                                                    }
                                                case v636  {
                                                    Us2None -> {
                                                        let v658 = int.to_string(404)
                                                        let v659 = { "HTTP/1.1 " } <> { v658 }
                                                        let v660 = { v659 } <> { " " }
                                                        let v661 = { v660 } <> { "Not Found" }
                                                        let v663 = erlang_term_coerce("not found")
                                                        let v664 = atom.create(v484)
                                                        let v666 = atom.create("byte_size")
                                                        let v667 = []
                                                        let v668 = [v663, ..v667]
                                                        let v669 = erlang_term_apply(v664, v666, v668)
                                                        let v670 = erlang_term_coerce(v669)
                                                        let v671 = int.to_string(v670)
                                                        let v672 = { "\r\nContent-Length: " } <> { v671 }
                                                        let v673 = { "\r\nContent-Type: text/plain; charset=utf-8" } <> { v672 }
                                                        let v674 = { v673 } <> { "\r\nConnection: close\r\n\r\n" }
                                                        let v675 = { v661 } <> { v674 }
                                                        let v676 = { v675 } <> { "not found" }
                                                        v676
                                                    }
                                                    Us2Some(v637) -> {
                                                        let v638 = int.to_string(200)
                                                        let v639 = { "HTTP/1.1 " } <> { v638 }
                                                        let v640 = { v639 } <> { " " }
                                                        let v641 = { v640 } <> { "OK" }
                                                        let v642 = { "\r\nContent-Type: " } <> { v466 }
                                                        let v643 = { v642 } <> { "\r\nContent-Length: " }
                                                        let v644 = erlang_term_coerce(v637)
                                                        let v645 = atom.create(v484)
                                                        let v647 = atom.create("byte_size")
                                                        let v648 = []
                                                        let v649 = [v644, ..v648]
                                                        let v650 = erlang_term_apply(v645, v647, v649)
                                                        let v651 = erlang_term_coerce(v650)
                                                        let v652 = int.to_string(v651)
                                                        let v653 = { v643 } <> { v652 }
                                                        let v654 = { v653 } <> { "\r\nAccept-Ranges: bytes" }
                                                        let v655 = { v654 } <> { "\r\nConnection: close\r\n\r\n" }
                                                        let v656 = { v641 } <> { v655 }
                                                        let v657 = { v656 } <> { v637 }
                                                        v657
                                                    }
                                                }
                                            }
                                            Us107Some(v679, v680) -> {
                                                let v681 = spiral_wrap_signed(v680 - v679, 32)
                                                let v682 = spiral_wrap_signed(v681 + 1, 32)
                                                let v683 = erlang_term_coerce(v468)
                                                let v684 = atom.create(v470)
                                                let v685 = atom.create(v472)
                                                let v686 = []
                                                let v687 = [v683, ..v686]
                                                let v688 = erlang_term_apply(v684, v685, v687)
                                                let v690 = atom.create("read")
                                                let v691 = erlang_term_coerce(v690)
                                                let v693 = atom.create("binary")
                                                let v694 = erlang_term_coerce(v693)
                                                let v696 = atom.create("raw")
                                                let v697 = erlang_term_coerce(v696)
                                                let v698 = []
                                                let v699 = [v697, ..v698]
                                                let v700 = [v694, ..v699]
                                                let v701 = [v691, ..v700]
                                                let v702 = erlang_term_coerce(v701)
                                                let v703 = "file"
                                                let v704 = atom.create(v703)
                                                let v706 = atom.create("open")
                                                let v707 = []
                                                let v708 = [v702, ..v707]
                                                let v709 = [v688, ..v708]
                                                let v710 = erlang_term_apply(v704, v706, v709)
                                                let v711 = erlang_term_coerce(1)
                                                let v712 = atom.create(v484)
                                                let v713 = "element"
                                                let v714 = atom.create(v713)
                                                let v715 = []
                                                let v716 = [v710, ..v715]
                                                let v717 = [v711, ..v716]
                                                let v718 = erlang_term_apply(v712, v714, v717)
                                                let v719 = "ok"
                                                let v720 = atom.create(v719)
                                                let v721 = erlang_term_coerce(v720)
                                                let v722 = v718 == v721
                                                let v732 =
                                                    case v722 {
                                                        True -> {
                                                            let v723 = erlang_term_coerce(2)
                                                            let v724 = atom.create(v484)
                                                            let v725 = atom.create(v713)
                                                            let v726 = []
                                                            let v727 = [v710, ..v726]
                                                            let v728 = [v723, ..v727]
                                                            let v729 = erlang_term_apply(v724, v725, v728)
                                                            Us108Some(v729)
                                                        }
                                                        False -> Us108None
                                                    }
                                                let v773 =
                                                    case v732  {
                                                        Us108None -> Us2None
                                                        Us108Some(v733) -> {
                                                            let v734 = erlang_term_coerce(v679)
                                                            let v735 = erlang_term_coerce(v682)
                                                            let v736 = atom.create(v703)
                                                            let v738 = atom.create("pread")
                                                            let v739 = []
                                                            let v740 = [v735, ..v739]
                                                            let v741 = [v734, ..v740]
                                                            let v742 = [v733, ..v741]
                                                            let v743 = erlang_term_apply(v736, v738, v742)
                                                            let v744 = atom.create(v703)
                                                            let v746 = atom.create("close")
                                                            let v747 = []
                                                            let v748 = [v733, ..v747]
                                                            let _v749 = erlang_term_apply(v744, v746, v748)
                                                            let v750 = erlang_term_coerce(1)
                                                            let v751 = atom.create(v484)
                                                            let v752 = atom.create(v713)
                                                            let v753 = []
                                                            let v754 = [v743, ..v753]
                                                            let v755 = [v750, ..v754]
                                                            let v756 = erlang_term_apply(v751, v752, v755)
                                                            let v757 = atom.create(v719)
                                                            let v758 = erlang_term_coerce(v757)
                                                            let v759 = v756 == v758
                                                            case v759 {
                                                                True -> {
                                                                    let v760 = erlang_term_coerce(2)
                                                                    let v761 = atom.create(v484)
                                                                    let v762 = atom.create(v713)
                                                                    let v763 = []
                                                                    let v764 = [v743, ..v763]
                                                                    let v765 = [v760, ..v764]
                                                                    let v766 = erlang_term_apply(v761, v762, v765)
                                                                    let v767 = erlang_term_coerce(v766)
                                                                    Us2Some(v767)
                                                                }
                                                                False -> Us2None
                                                            }
                                                        }
                                                    }
                                                case v773  {
                                                    Us2None -> {
                                                        let v803 = int.to_string(404)
                                                        let v804 = { "HTTP/1.1 " } <> { v803 }
                                                        let v805 = { v804 } <> { " " }
                                                        let v806 = { v805 } <> { "Not Found" }
                                                        let v808 = erlang_term_coerce("not found")
                                                        let v809 = atom.create(v484)
                                                        let v811 = atom.create("byte_size")
                                                        let v812 = []
                                                        let v813 = [v808, ..v812]
                                                        let v814 = erlang_term_apply(v809, v811, v813)
                                                        let v815 = erlang_term_coerce(v814)
                                                        let v816 = int.to_string(v815)
                                                        let v817 = { "\r\nContent-Length: " } <> { v816 }
                                                        let v818 = { "\r\nContent-Type: text/plain; charset=utf-8" } <> { v817 }
                                                        let v819 = { v818 } <> { "\r\nConnection: close\r\n\r\n" }
                                                        let v820 = { v806 } <> { v819 }
                                                        let v821 = { v820 } <> { "not found" }
                                                        v821
                                                    }
                                                    Us2Some(v774) -> {
                                                        let v775 = int.to_string(v679)
                                                        let v776 = { "\r\nAccept-Ranges: bytes\r\nContent-Range: bytes " } <> { v775 }
                                                        let v777 = { v776 } <> { "-" }
                                                        let v778 = int.to_string(v680)
                                                        let v779 = { v777 } <> { v778 }
                                                        let v780 = { v779 } <> { "/" }
                                                        let v781 = int.to_string(v504)
                                                        let v782 = { v780 } <> { v781 }
                                                        let v783 = int.to_string(206)
                                                        let v784 = { "HTTP/1.1 " } <> { v783 }
                                                        let v785 = { v784 } <> { " " }
                                                        let v786 = { v785 } <> { "Status" }
                                                        let v787 = { "\r\nContent-Type: " } <> { v466 }
                                                        let v788 = { v787 } <> { "\r\nContent-Length: " }
                                                        let v789 = erlang_term_coerce(v774)
                                                        let v790 = atom.create(v484)
                                                        let v792 = atom.create("byte_size")
                                                        let v793 = []
                                                        let v794 = [v789, ..v793]
                                                        let v795 = erlang_term_apply(v790, v792, v794)
                                                        let v796 = erlang_term_coerce(v795)
                                                        let v797 = int.to_string(v796)
                                                        let v798 = { v788 } <> { v797 }
                                                        let v799 = { v798 } <> { v782 }
                                                        let v800 = { v799 } <> { "\r\nConnection: close\r\n\r\n" }
                                                        let v801 = { v786 } <> { v800 }
                                                        let v802 = { v801 } <> { v774 }
                                                        v802
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            False -> {
                                let v827 = int.to_string(404)
                                let v828 = { "HTTP/1.1 " } <> { v827 }
                                let v829 = { v828 } <> { " " }
                                let v830 = { v829 } <> { "Not Found" }
                                let v832 = erlang_term_coerce("not found")
                                let v834 = atom.create("erlang")
                                let v836 = atom.create("byte_size")
                                let v837 = []
                                let v838 = [v832, ..v837]
                                let v839 = erlang_term_apply(v834, v836, v838)
                                let v840 = erlang_term_coerce(v839)
                                let v841 = int.to_string(v840)
                                let v842 = { "\r\nContent-Length: " } <> { v841 }
                                let v843 = { "\r\nContent-Type: text/plain; charset=utf-8" } <> { v842 }
                                let v844 = { v843 } <> { "\r\nConnection: close\r\n\r\n" }
                                let v845 = { v830 } <> { v844 }
                                let v846 = { v845 } <> { "not found" }
                                v846
                            }
                        }
                    #(v847, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
                }
                False -> replied_539(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
            }
        }
    }
}
