import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import xsim_frames/types.{type Uh3, type Uh36, Us109AppBearer, Us112UserBearer, Us113ClientBasic}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce}
import xsim_frames/part25.{request_of_451}
import xsim_frames/part28.{header_value_537}
import xsim_frames/part34.{reply_as_541}
import xsim_frames/part35.{reply_as_661}
import xsim_frames/part36.{reply_as_673, signed_reply_679}

pub fn keyed_reply_672(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: String, v21: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    let v22 = ""
    let v23 = erlang_term_coerce(v22)
    let v25 = erlang_term_coerce("oauth2")
    let v26 = erlang_term_coerce(v23)
    let v27 = "maps"
    let v28 = atom.create(v27)
    let v29 = "get"
    let v30 = atom.create(v29)
    let v31 = []
    let v32 = [v26, ..v31]
    let v33 = [v7, ..v32]
    let v34 = [v25, ..v33]
    let v35 = erlang_term_apply(v28, v30, v34)
    let v36 = erlang_term_coerce(v35)
    let v37 = erlang_term_coerce(v22)
    let v39 = erlang_term_coerce("client_id")
    let v40 = erlang_term_coerce(v37)
    let v41 = atom.create(v27)
    let v42 = atom.create(v29)
    let v43 = []
    let v44 = [v40, ..v43]
    let v45 = [v36, ..v44]
    let v46 = [v39, ..v45]
    let v47 = erlang_term_apply(v41, v42, v46)
    let v48 = erlang_term_coerce(v47)
    let v49 = erlang_term_coerce(v48)
    let v50 = { v49 } <> { ":" }
    let v51 = erlang_term_coerce(v22)
    let v53 = erlang_term_coerce("client_secret")
    let v54 = erlang_term_coerce(v51)
    let v55 = atom.create(v27)
    let v56 = atom.create(v29)
    let v57 = []
    let v58 = [v54, ..v57]
    let v59 = [v36, ..v58]
    let v60 = [v53, ..v59]
    let v61 = erlang_term_apply(v55, v56, v60)
    let v62 = erlang_term_coerce(v61)
    let v63 = erlang_term_coerce(v62)
    let v64 = { v50 } <> { v63 }
    let v65 = erlang_term_coerce(v64)
    let v67 = atom.create("base64")
    let v69 = atom.create("encode")
    let v70 = []
    let v71 = [v65, ..v70]
    let v72 = erlang_term_apply(v67, v69, v71)
    let v73 = erlang_term_coerce(v72)
    let v74 = { "Basic " } <> { v73 }
    let v75 = v21 == v74
    let v77 =
        case v75 {
            True -> {
                v17 == "/2/oauth2/token"
            }
            False -> False
        }
    case v77 {
        True -> {
            reply_as_673(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, Us113ClientBasic)
        }
        False -> signed_reply_679(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21)
    }
}

pub fn bearer_reply_540(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: String, v21: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    let v22 = { "Bearer " } <> { v0 }
    let v23 = v21 == v22
    case v23 {
        True -> {
            reply_as_541(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, Us109AppBearer)
        }
        False -> {
            let v41 = { "Bearer " } <> { v1 }
            let v42 = v21 == v41
            case v42 {
                True -> {
                    reply_as_661(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, Us112UserBearer)
                }
                False -> keyed_reply_672(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21)
            }
        }
    }
}

pub fn replied_539(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    let #(v17, v18, v19, v20, v21) = request_of_451(v16)
    let v23 = header_value_537("authorization", v20)
    bearer_reply_540(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v17, v18, v19, v20, v21, v23)
}
