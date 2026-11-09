import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import xsim_frames/types.{type Uh3, type Uh36, Us109AppBearer, Us112UserBearer, Us113ClientBasic}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce}
import xsim_frames/part25.{request_of_451}
import xsim_frames/part28.{header_value_535}
import xsim_frames/part34.{reply_as_539}
import xsim_frames/part35.{reply_as_659}
import xsim_frames/part36.{reply_as_671, signed_reply_677}

pub fn keyed_reply_670(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let v21 = ""
    let v22 = erlang_term_coerce(v21)
    let v24 = erlang_term_coerce("oauth2")
    let v25 = erlang_term_coerce(v22)
    let v26 = "maps"
    let v27 = atom.create(v26)
    let v28 = "get"
    let v29 = atom.create(v28)
    let v30 = []
    let v31 = [v25, ..v30]
    let v32 = [v7, ..v31]
    let v33 = [v24, ..v32]
    let v34 = erlang_term_apply(v27, v29, v33)
    let v35 = erlang_term_coerce(v34)
    let v36 = erlang_term_coerce(v21)
    let v38 = erlang_term_coerce("client_id")
    let v39 = erlang_term_coerce(v36)
    let v40 = atom.create(v26)
    let v41 = atom.create(v28)
    let v42 = []
    let v43 = [v39, ..v42]
    let v44 = [v35, ..v43]
    let v45 = [v38, ..v44]
    let v46 = erlang_term_apply(v40, v41, v45)
    let v47 = erlang_term_coerce(v46)
    let v48 = erlang_term_coerce(v47)
    let v49 = { v48 } <> { ":" }
    let v50 = erlang_term_coerce(v21)
    let v52 = erlang_term_coerce("client_secret")
    let v53 = erlang_term_coerce(v50)
    let v54 = atom.create(v26)
    let v55 = atom.create(v28)
    let v56 = []
    let v57 = [v53, ..v56]
    let v58 = [v35, ..v57]
    let v59 = [v52, ..v58]
    let v60 = erlang_term_apply(v54, v55, v59)
    let v61 = erlang_term_coerce(v60)
    let v62 = erlang_term_coerce(v61)
    let v63 = { v49 } <> { v62 }
    let v64 = erlang_term_coerce(v63)
    let v66 = atom.create("base64")
    let v68 = atom.create("encode")
    let v69 = []
    let v70 = [v64, ..v69]
    let v71 = erlang_term_apply(v66, v68, v70)
    let v72 = erlang_term_coerce(v71)
    let v73 = { "Basic " } <> { v72 }
    let v74 = v20 == v73
    let v76 =
        case v74 {
            True -> {
                v16 == "/2/oauth2/token"
            }
            False -> False
        }
    case v76 {
        True -> {
            reply_as_671(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, Us113ClientBasic)
        }
        False -> signed_reply_677(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20)
    }
}

pub fn bearer_reply_538(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let v21 = { "Bearer " } <> { v0 }
    let v22 = v20 == v21
    case v22 {
        True -> {
            reply_as_539(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, Us109AppBearer)
        }
        False -> {
            let v39 = { "Bearer " } <> { v1 }
            let v40 = v20 == v39
            case v40 {
                True -> {
                    reply_as_659(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, Us112UserBearer)
                }
                False -> keyed_reply_670(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20)
            }
        }
    }
}

pub fn replied_537(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let #(v16, v17, v18, v19, v20) = request_of_451(v15)
    let v22 = header_value_535("authorization", v19)
    bearer_reply_538(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v16, v17, v18, v19, v20, v22)
}
