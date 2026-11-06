import gleam/erlang/atom
import xsim_frames/types.{Uh29Nil, Uh36Cons, Uh36Nil, Uh3Cons, Uh3Nil}
import xsim_frames/part1.{erlang_term_apply}
import xsim_frames/part13.{items_from_301}
import xsim_frames/part20.{closure29, method396}
import xsim_frames/part22.{closure108}
import xsim_frames/part23.{closure110}
import xsim_frames/part24.{closure116}
import xsim_frames/part25.{closure122}
import xsim_frames/part26.{closure130}
import xsim_frames/part28.{closure136, oauth1_signature_451}
import xsim_frames/part3.{closure0, closure5, closure7, closure9}
import xsim_frames/part39.{listening_455}
import xsim_frames/part5.{closure10, closure12}
import xsim_frames/part6.{closure13, closure14, closure15}
import xsim_frames/part9.{closure19, closure27, closure28}

pub fn started_450(v0: String, v1: String, v2: String) -> Int {
    let v3 = "POST"
    let v4 = "https://api.x.com/1.1/statuses/update.json"
    let v5 = "include_entities"
    let v6 = "true"
    let v7 = "status"
    let v8 = "Hello Ladies + Gentlemen, a signed OAuth request!"
    let v9 = "oauth_token"
    let v10 = "370773112-GmHxMAgYyLbNEtIKZeRNFsMKPR9EyMZeS9weJAEb"
    let v11 = "oauth_version"
    let v12 = "1.0"
    let v13 = "oauth_consumer_key"
    let v14 = "xvz1evFS4wEEPTGEFPHBog"
    let v15 = "oauth_nonce"
    let v16 = "kYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cg"
    let v17 = "oauth_signature_method"
    let v18 = "HMAC-SHA1"
    let v19 = "oauth_timestamp"
    let v20 = "1318622958"
    let v21 = Uh36Nil
    let v22 = Uh36Cons(v19, v20, v21)
    let v23 = Uh36Cons(v17, v18, v22)
    let v24 = Uh36Cons(v15, v16, v23)
    let v25 = Uh36Cons(v13, v14, v24)
    let v26 = Uh36Cons(v11, v12, v25)
    let v27 = Uh36Cons(v9, v10, v26)
    let v28 = Uh36Cons(v7, v8, v27)
    let v29 = Uh36Cons(v5, v6, v28)
    let v30 = "kAcSOqF21Fu85e7zjz7ZN2U4ZRhfV3WpwPAoE3Z7kBw"
    let v31 = "LswwdoUaIvS8ltyTt5jkRh4J50vUPVVHtR2YPi5kE"
    let v32 = oauth1_signature_451(v3, v4, v29, v30, v31)
    let v33 = v32 == "Ls93hJiZbQ3akF3HF3x1Bz8/zU4="
    case v33 {
        True -> listening_455(v0, v1, v2)
        False -> 3
    }
}

pub fn closure142(capt: Nil) -> fn(String) -> Int {
    fn (v0) {
        let v1 = "init"
        let v2 = atom.create(v1)
        let v3 = "get_plain_arguments"
        let v4 = atom.create(v3)
        let v5 = []
        let v6 = erlang_term_apply(v2, v4, v5)
        let v7 = "lists"
        let v8 = atom.create(v7)
        let v9 = "reverse"
        let v10 = atom.create(v9)
        let v11 = []
        let v12 = [v6, ..v11]
        let v13 = erlang_term_apply(v8, v10, v12)
        let v14 = Uh29Nil
        let v15 = items_from_301(v13, v14)
        let v16 = Uh3Nil
        let v17 = method396(v15, v16)
        let v22 =
            case v17  {
                Uh3Cons(v18, v19) -> v19
                Uh3Nil -> Uh3Nil
            }
        case v22  {
            Uh3Cons(v23, v24) -> {
                case v24  {
                    Uh3Cons(v25, v26) -> {
                        case v26  {
                            Uh3Cons(v27, v28) -> started_450(v23, v25, v27)
                            _ -> 2
                        }
                    }
                    _ -> 2
                }
            }
            _ -> 2
        }
    }
}

pub fn main() {
    let _v0 = closure0(Nil)
    let _ = Nil
    let _v1 = closure5(Nil)
    let _ = Nil
    let _v2 = closure7(Nil)
    let _ = Nil
    let _v3 = closure9(Nil)
    let _ = Nil
    let _v4 = closure10(Nil)
    let _ = Nil
    let _v5 = closure12(Nil)
    let _ = Nil
    let _v6 = closure13(Nil)
    let _ = Nil
    let _v7 = closure14(Nil)
    let _ = Nil
    let _v8 = closure15(Nil)
    let _ = Nil
    let _v9 = closure19(Nil)
    let _ = Nil
    let _v10 = closure27(Nil)
    let _ = Nil
    let _v11 = closure28(Nil)
    let _ = Nil
    let _v12 = closure29(Nil)
    let _ = Nil
    let _v13 = closure108(Nil)
    let _ = Nil
    let _v14 = closure110(Nil)
    let _ = Nil
    let _v15 = closure116(Nil)
    let _ = Nil
    let _v16 = closure122(Nil)
    let _ = Nil
    let _v17 = closure130(Nil)
    let _ = Nil
    let _v18 = closure136(Nil)
    let _ = Nil
    let _v19 = closure142(Nil)
    let _ = Nil
    0
}
