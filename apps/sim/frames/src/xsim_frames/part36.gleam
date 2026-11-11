import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Uh36, type Uh50, type Us113, type Us114, Uh29Cons, Uh29Nil, Uh3Cons, Uh3Nil, Uh50Cons, Uh50Nil, Us112OAuth1User, Us113ClientBasic, Us114Unauthenticated, Us2None, Us2Some}
import xsim_frames/part1.{closure1, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_crypto_mac, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part12.{items_from_301, method300}
import xsim_frames/part2.{delimited_21}
import xsim_frames/part25.{first_value_465}
import xsim_frames/part28.{header_value_537, logged_542}
import xsim_frames/part3.{method56, method57}
import xsim_frames/part35.{answer_674, issued_next_677, reply_as_661}

pub fn renewed_676(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, _v15: String, _v16: String, _v17: String, _v18: String, v19: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    let v20 = "\r\n\r\n"
    let v21 = option.from_result(result.map(string.split_once(v19, v20), pair.first))
    let v22 = closure1(Nil)
    let v23 = v21 |> option.map(v22)
    let v25 = v23 |> option.unwrap(Us2None)
    let v29 =
        case v25  {
            Us2None -> -1
            Us2Some(v26) -> {
                bit_array.byte_size(bit_array.from_string(v26))
            }
        }
    let v30 = spiral_wrap_signed(v29 + 4, 32)
    let v31 = option.from_result(result.map(string.split_once(v19, v20), pair.first))
    let v32 = v31 |> option.map(v22)
    let v34 = v32 |> option.unwrap(Us2None)
    let v38 =
        case v34  {
            Us2None -> -1
            Us2Some(v35) -> {
                bit_array.byte_size(bit_array.from_string(v35))
            }
        }
    let v39 = v38 < 0
    let v46 =
        case v39 {
            True -> {
                ""
            }
            False -> {
                let v41 = spiral_string_length(v19)
                let v42 = spiral_wrap_signed(v41 - v30, 32)
                let v43 = spiral_wrap_signed(v30 + v42, 32)
                let v44 = spiral_wrap_signed(v43 - 1, 32)
                spiral_string_slice(v19, v30, v44)
            }
        }
    let v48 = v46 == ""
    let v52 =
        case v48 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v46)
            }
        }
    let v53 = first_value_465("grant_type", v52)
    let v54 = v53 == ""
    let v56 =
        case v54 {
            True -> {
                ""
            }
            False -> v53
        }
    let v57 = v56 == "refresh_token"
    let v73 =
        case v57 {
            True -> {
                let v62 =
                    case v48 {
                        True -> Uh3Nil
                        False -> {
                            split_list_2("&", v46)
                        }
                    }
                let v63 = first_value_465("refresh_token", v62)
                let v64 = v63 == ""
                let v66 =
                    case v64 {
                        True -> {
                            ""
                        }
                        False -> v63
                    }
                let v71 =
                    case v8  {
                        Uh3Cons(v67, v68) -> v67
                        Uh3Nil -> {
                            ""
                        }
                    }
                v66 == v71
            }
            False -> False
        }
    case v73 {
        True -> issued_next_677(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
        False -> {
            let v91 = erlang_term_coerce("invalid_request")
            let v93 = erlang_term_coerce("Value passed for the token was invalid.")
            let v95 = atom.create("error_description")
            let v96 = erlang_term_coerce(v95)
            let v97 = []
            let v98 = [v93, ..v97]
            let v99 = [v96, ..v98]
            let v100 = erlang_term_tuple(v99)
            let v102 = atom.create("error")
            let v103 = erlang_term_coerce(v102)
            let v104 = []
            let v105 = [v91, ..v104]
            let v106 = [v103, ..v105]
            let v107 = erlang_term_tuple(v106)
            let v108 = []
            let v109 = [v100, ..v108]
            let v110 = [v107, ..v109]
            let v111 = erlang_term_coerce(v110)
            let v113 = atom.create("maps")
            let v115 = atom.create("from_list")
            let v116 = []
            let v117 = [v111, ..v116]
            let v118 = erlang_term_apply(v113, v115, v117)
            let v120 = atom.create("json")
            let v122 = atom.create("encode")
            let v123 = []
            let v124 = [v118, ..v123]
            let v125 = erlang_term_apply(v120, v122, v124)
            let v126 = "erlang"
            let v127 = atom.create(v126)
            let v129 = atom.create("iolist_to_binary")
            let v130 = []
            let v131 = [v125, ..v130]
            let v132 = erlang_term_apply(v127, v129, v131)
            let v133 = erlang_term_coerce(v132)
            let v134 = int.to_string(400)
            let v135 = { "HTTP/1.1 " } <> { v134 }
            let v136 = { v135 } <> { " " }
            let v137 = { v136 } <> { "Bad Request" }
            let v138 = erlang_term_coerce(v133)
            let v139 = atom.create(v126)
            let v141 = atom.create("byte_size")
            let v142 = []
            let v143 = [v138, ..v142]
            let v144 = erlang_term_apply(v139, v141, v143)
            let v145 = erlang_term_coerce(v144)
            let v146 = int.to_string(v145)
            let v147 = { "\r\nContent-Length: " } <> { v146 }
            let v148 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v147 }
            let v149 = { v148 } <> { "\r\nConnection: close\r\n\r\n" }
            let v150 = { v137 } <> { v149 }
            let v151 = { v150 } <> { v133 }
            #(v151, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
        }
    }
}

pub fn user_write_678(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, _v15: String, _v16: String, _v17: String, _v18: String, _v19: String, _v20: Us113) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    let v22 = erlang_term_coerce("Unsupported Authentication")
    let v24 = erlang_term_coerce("Authenticating with OAuth 2.0 Application-Only is forbidden for this endpoint.  Supported authentication types are [OAuth 1.0a User Context, OAuth 2.0 User Context].")
    let v26 = erlang_term_coerce("https://api.x.com/2/problems/unsupported-authentication")
    let v27 = erlang_term_coerce(403)
    let v29 = atom.create("status")
    let v30 = erlang_term_coerce(v29)
    let v31 = []
    let v32 = [v27, ..v31]
    let v33 = [v30, ..v32]
    let v34 = erlang_term_tuple(v33)
    let v36 = atom.create("type")
    let v37 = erlang_term_coerce(v36)
    let v38 = []
    let v39 = [v26, ..v38]
    let v40 = [v37, ..v39]
    let v41 = erlang_term_tuple(v40)
    let v43 = atom.create("detail")
    let v44 = erlang_term_coerce(v43)
    let v45 = []
    let v46 = [v24, ..v45]
    let v47 = [v44, ..v46]
    let v48 = erlang_term_tuple(v47)
    let v50 = atom.create("title")
    let v51 = erlang_term_coerce(v50)
    let v52 = []
    let v53 = [v22, ..v52]
    let v54 = [v51, ..v53]
    let v55 = erlang_term_tuple(v54)
    let v56 = []
    let v57 = [v34, ..v56]
    let v58 = [v41, ..v57]
    let v59 = [v48, ..v58]
    let v60 = [v55, ..v59]
    let v61 = erlang_term_coerce(v60)
    let v63 = atom.create("maps")
    let v65 = atom.create("from_list")
    let v66 = []
    let v67 = [v61, ..v66]
    let v68 = erlang_term_apply(v63, v65, v67)
    let v70 = atom.create("json")
    let v72 = atom.create("encode")
    let v73 = []
    let v74 = [v68, ..v73]
    let v75 = erlang_term_apply(v70, v72, v74)
    let v76 = "erlang"
    let v77 = atom.create(v76)
    let v79 = atom.create("iolist_to_binary")
    let v80 = []
    let v81 = [v75, ..v80]
    let v82 = erlang_term_apply(v77, v79, v81)
    let v83 = erlang_term_coerce(v82)
    let v84 = int.to_string(403)
    let v85 = { "HTTP/1.1 " } <> { v84 }
    let v86 = { v85 } <> { " " }
    let v87 = { v86 } <> { "Forbidden" }
    let v88 = erlang_term_coerce(v83)
    let v89 = atom.create(v76)
    let v91 = atom.create("byte_size")
    let v92 = []
    let v93 = [v88, ..v92]
    let v94 = erlang_term_apply(v89, v91, v93)
    let v95 = erlang_term_coerce(v94)
    let v96 = int.to_string(v95)
    let v97 = { "\r\nContent-Length: " } <> { v96 }
    let v98 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v97 }
    let v99 = { v98 } <> { "\r\nConnection: close\r\n\r\n" }
    let v100 = { v87 } <> { v99 }
    let v101 = { v100 } <> { v83 }
    #(v101, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
}

pub fn change_reply_675(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: Us113) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    case v20  {
        Us113ClientBasic -> {
            let v21 = v15 == "POST"
            case v21 {
                True -> renewed_676(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
                False -> user_write_678(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20)
            }
        }
    }
}

pub fn reply_as_673(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: String, v21: Us113) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    let v23 =
        case v21  {
            Us113ClientBasic -> {
                "client"
            }
        }
    logged_542(v15, v16, v17, v18, v19, v20, v23)
    let v24 = { "xsim serve / answered " } <> { v16 }
    let v25 = { v24 } <> { " " }
    let v26 = { v25 } <> { v17 }
    let v27 = { v26 } <> { "\n" }
    let v29 = atom.create("standard_error")
    let v30 = erlang_term_coerce(v29)
    let v31 = erlang_term_coerce(v27)
    let v33 = atom.create("io")
    let v35 = atom.create("put_chars")
    let v36 = []
    let v37 = [v31, ..v36]
    let v38 = [v30, ..v37]
    let _v39 = erlang_term_apply(v33, v35, v38)
    let v40 = v16 == "GET"
    case v40 {
        True -> {
            let v41 = answer_674(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v16, v17, v18, v19, v20, v21)
            #(v41, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
        }
        False -> change_reply_675(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v16, v17, v18, v19, v20, v21)
    }
}

pub fn method681(v0: Uh3, v1: Uh50) -> Uh50 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method681(v3, v1)
            let v5 = spiral_string_length(v2)
            let v7 = method56(v2, v5, 0)
            let v8 = spiral_wrap_signed(v5 - 1, 32)
            let v9 = spiral_string_slice(v2, v7, v8)
            let v10 = spiral_string_length(v9)
            let v11 = method57(v9, v10)
            let v12 = spiral_string_slice(v9, 0, v11)
            let v14 = option.from_result(result.map(string.split_once(v12, "="), pair.first))
            let v15 = closure1(Nil)
            let v16 = v14 |> option.map(v15)
            let v18 = v16 |> option.unwrap(Us2None)
            let v22 =
                case v18  {
                    Us2None -> -1
                    Us2Some(v19) -> {
                        bit_array.byte_size(bit_array.from_string(v19))
                    }
                }
            let v23 = spiral_wrap_signed(v22 + 1, 32)
            let v24 = v22 < 0
            let #(v33, v34) =
                case v24 {
                    True -> {
                        #(v12, "")
                    }
                    False -> {
                        let v26 = spiral_wrap_signed(v22 - 1, 32)
                        let v27 = spiral_string_slice(v12, 0, v26)
                        let v28 = spiral_string_length(v12)
                        let v29 = spiral_wrap_signed(v28 - v23, 32)
                        let v30 = spiral_wrap_signed(v23 + v29, 32)
                        let v31 = spiral_wrap_signed(v30 - 1, 32)
                        let v32 = spiral_string_slice(v12, v23, v31)
                        #(v27, v32)
                    }
                }
            let v35 = erlang_term_coerce(v33)
            let v36 = "uri_string"
            let v37 = atom.create(v36)
            let v38 = "percent_decode"
            let v39 = atom.create(v38)
            let v40 = []
            let v41 = [v35, ..v40]
            let v42 = erlang_term_apply(v37, v39, v41)
            let v43 = erlang_term_coerce(v42)
            let v46 = v34 |> string.replace("\"", "")
            let v47 = erlang_term_coerce(v46)
            let v48 = atom.create(v36)
            let v49 = atom.create(v38)
            let v50 = []
            let v51 = [v47, ..v50]
            let v52 = erlang_term_apply(v48, v49, v51)
            let v53 = erlang_term_coerce(v52)
            Uh50Cons(v43, v53, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method682(v0: Uh50, v1: Uh50) -> Uh50 {
    case v0  {
        Uh50Cons(v2, v3, v4) -> {
            let v5 = method682(v4, v1)
            let v6 = v2 == "oauth_consumer_key"
            case v6 {
                True -> Uh50Cons(v2, v3, v5)
                False -> v5
            }
        }
        Uh50Nil -> v1
    }
}

pub fn method683(v0: Uh50, v1: Uh50) -> Uh50 {
    case v0  {
        Uh50Cons(v2, v3, v4) -> {
            let v5 = method683(v4, v1)
            let v6 = v2 == "oauth_token"
            case v6 {
                True -> Uh50Cons(v2, v3, v5)
                False -> v5
            }
        }
        Uh50Nil -> v1
    }
}

pub fn method684(v0: Uh50, v1: Uh50) -> Uh50 {
    case v0  {
        Uh50Cons(v2, v3, v4) -> {
            let v5 = method684(v4, v1)
            let v6 = v2 == "oauth_signature"
            case v6 {
                True -> Uh50Cons(v2, v3, v5)
                False -> v5
            }
        }
        Uh50Nil -> v1
    }
}

pub fn method685(v0: Uh50, v1: Uh50) -> Uh50 {
    case v0  {
        Uh50Cons(v2, v3, v4) -> {
            let v5 = method685(v4, v1)
            let v6 = v2 != "oauth_signature"
            case v6 {
                True -> Uh50Cons(v2, v3, v5)
                False -> v5
            }
        }
        Uh50Nil -> v1
    }
}

pub fn method688(v0: Uh50, v1: Uh29) -> Uh29 {
    case v0  {
        Uh50Cons(v2, v3, v4) -> {
            let v5 = method688(v4, v1)
            let v6 = erlang_term_coerce(v2)
            let v7 = ""
            let v8 = erlang_term_coerce(v7)
            let v9 = "unicode"
            let v10 = atom.create(v9)
            let v11 = "characters_to_list"
            let v12 = atom.create(v11)
            let v13 = []
            let v14 = [v8, ..v13]
            let v15 = erlang_term_apply(v10, v12, v14)
            let v16 = "uri_string"
            let v17 = atom.create(v16)
            let v18 = "quote"
            let v19 = atom.create(v18)
            let v20 = []
            let v21 = [v15, ..v20]
            let v22 = [v6, ..v21]
            let v23 = erlang_term_apply(v17, v19, v22)
            let v24 = erlang_term_coerce(v23)
            let v25 = erlang_term_coerce(v24)
            let v26 = erlang_term_coerce(v3)
            let v27 = erlang_term_coerce(v7)
            let v28 = atom.create(v9)
            let v29 = atom.create(v11)
            let v30 = []
            let v31 = [v27, ..v30]
            let v32 = erlang_term_apply(v28, v29, v31)
            let v33 = atom.create(v16)
            let v34 = atom.create(v18)
            let v35 = []
            let v36 = [v32, ..v35]
            let v37 = [v26, ..v36]
            let v38 = erlang_term_apply(v33, v34, v37)
            let v39 = erlang_term_coerce(v38)
            let v40 = erlang_term_coerce(v39)
            let v41 = []
            let v42 = [v40, ..v41]
            let v43 = [v25, ..v42]
            let v44 = erlang_term_tuple(v43)
            Uh29Cons(v44, v5)
        }
        Uh50Nil -> v1
    }
}

pub fn method689(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method689(v3, v1)
            let v5 = erlang_term_coerce(1)
            let v6 = "erlang"
            let v7 = atom.create(v6)
            let v8 = "element"
            let v9 = atom.create(v8)
            let v10 = []
            let v11 = [v2, ..v10]
            let v12 = [v5, ..v11]
            let v13 = erlang_term_apply(v7, v9, v12)
            let v14 = erlang_term_coerce(v13)
            let v15 = { v14 } <> { "=" }
            let v16 = erlang_term_coerce(2)
            let v17 = atom.create(v6)
            let v18 = atom.create(v8)
            let v19 = []
            let v20 = [v2, ..v19]
            let v21 = [v16, ..v20]
            let v22 = erlang_term_apply(v17, v18, v21)
            let v23 = erlang_term_coerce(v22)
            let v24 = { v15 } <> { v23 }
            Uh3Cons(v24, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn signed_params_687(v0: Uh50) -> String {
    let v2 = method688(v0, Uh29Nil)
    let v3 = []
    let v4 = method300(v2, v3)
    let v5 = erlang_term_coerce(v4)
    let v6 = "lists"
    let v7 = atom.create(v6)
    let v9 = atom.create("sort")
    let v10 = []
    let v11 = [v5, ..v10]
    let v12 = erlang_term_apply(v7, v9, v11)
    let v13 = atom.create(v6)
    let v15 = atom.create("reverse")
    let v16 = []
    let v17 = [v12, ..v16]
    let v18 = erlang_term_apply(v13, v15, v17)
    let v20 = items_from_301(v18, Uh29Nil)
    let v22 = method689(v20, Uh3Nil)
    delimited_21("&", v22)
}

pub fn oauth1_signature_686(v0: String, v1: String, v2: Uh50, v3: String, v4: String) -> String {
    let v5 = { v0 } <> { "&" }
    let v6 = erlang_term_coerce(v1)
    let v7 = ""
    let v8 = erlang_term_coerce(v7)
    let v9 = "unicode"
    let v10 = atom.create(v9)
    let v11 = "characters_to_list"
    let v12 = atom.create(v11)
    let v13 = []
    let v14 = [v8, ..v13]
    let v15 = erlang_term_apply(v10, v12, v14)
    let v16 = "uri_string"
    let v17 = atom.create(v16)
    let v18 = "quote"
    let v19 = atom.create(v18)
    let v20 = []
    let v21 = [v15, ..v20]
    let v22 = [v6, ..v21]
    let v23 = erlang_term_apply(v17, v19, v22)
    let v24 = erlang_term_coerce(v23)
    let v25 = { v5 } <> { v24 }
    let v26 = { v25 } <> { "&" }
    let v27 = signed_params_687(v2)
    let v28 = erlang_term_coerce(v27)
    let v29 = erlang_term_coerce(v7)
    let v30 = atom.create(v9)
    let v31 = atom.create(v11)
    let v32 = []
    let v33 = [v29, ..v32]
    let v34 = erlang_term_apply(v30, v31, v33)
    let v35 = atom.create(v16)
    let v36 = atom.create(v18)
    let v37 = []
    let v38 = [v34, ..v37]
    let v39 = [v28, ..v38]
    let v40 = erlang_term_apply(v35, v36, v39)
    let v41 = erlang_term_coerce(v40)
    let v42 = { v26 } <> { v41 }
    let v43 = erlang_term_coerce(v3)
    let v44 = erlang_term_coerce(v7)
    let v45 = atom.create(v9)
    let v46 = atom.create(v11)
    let v47 = []
    let v48 = [v44, ..v47]
    let v49 = erlang_term_apply(v45, v46, v48)
    let v50 = atom.create(v16)
    let v51 = atom.create(v18)
    let v52 = []
    let v53 = [v49, ..v52]
    let v54 = [v43, ..v53]
    let v55 = erlang_term_apply(v50, v51, v54)
    let v56 = erlang_term_coerce(v55)
    let v57 = { v56 } <> { "&" }
    let v58 = erlang_term_coerce(v4)
    let v59 = erlang_term_coerce(v7)
    let v60 = atom.create(v9)
    let v61 = atom.create(v11)
    let v62 = []
    let v63 = [v59, ..v62]
    let v64 = erlang_term_apply(v60, v61, v63)
    let v65 = atom.create(v16)
    let v66 = atom.create(v18)
    let v67 = []
    let v68 = [v64, ..v67]
    let v69 = [v58, ..v68]
    let v70 = erlang_term_apply(v65, v66, v69)
    let v71 = erlang_term_coerce(v70)
    let v72 = { v57 } <> { v71 }
    bit_array.base64_encode(spiral_crypto_mac(atom.create("hmac"), atom.create("sha"), v72, v42), True)
}

pub fn oauth1_valid_680(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, _v12: Uh36, _v13: String, _v14: String, v15: String, v16: String, _v17: String, v18: String, _v19: String, v20: String) -> Bool {
    let v21 = spiral_string_length(v20)
    let v22 = spiral_wrap_signed(v21 - 6, 32)
    let v23 = spiral_wrap_signed(6 + v22, 32)
    let v24 = spiral_wrap_signed(v23 - 1, 32)
    let v25 = spiral_string_slice(v20, 6, v24)
    let v26 = v25 == ""
    let v30 =
        case v26 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v25)
            }
        }
    let v32 = method681(v30, Uh50Nil)
    let v34 = method682(v32, Uh50Nil)
    let v40 =
        case v34  {
            Uh50Cons(v35, v36, v37) -> v36
            Uh50Nil -> {
                ""
            }
        }
    let v41 = ""
    let v42 = erlang_term_coerce(v41)
    let v43 = "oauth1"
    let v44 = erlang_term_coerce(v43)
    let v45 = erlang_term_coerce(v42)
    let v46 = "maps"
    let v47 = atom.create(v46)
    let v48 = "get"
    let v49 = atom.create(v48)
    let v50 = []
    let v51 = [v45, ..v50]
    let v52 = [v7, ..v51]
    let v53 = [v44, ..v52]
    let v54 = erlang_term_apply(v47, v49, v53)
    let v55 = erlang_term_coerce(v54)
    let v56 = erlang_term_coerce(v41)
    let v58 = erlang_term_coerce("consumer_key")
    let v59 = erlang_term_coerce(v56)
    let v60 = atom.create(v46)
    let v61 = atom.create(v48)
    let v62 = []
    let v63 = [v59, ..v62]
    let v64 = [v55, ..v63]
    let v65 = [v58, ..v64]
    let v66 = erlang_term_apply(v60, v61, v65)
    let v67 = erlang_term_coerce(v66)
    let v68 = erlang_term_coerce(v67)
    let v69 = v40 == v68
    let v102 =
        case v69 {
            True -> {
                let v71 = method683(v32, Uh50Nil)
                let v76 =
                    case v71  {
                        Uh50Cons(v72, v73, v74) -> v73
                        Uh50Nil -> v41
                    }
                let v77 = erlang_term_coerce(v41)
                let v78 = erlang_term_coerce(v43)
                let v79 = erlang_term_coerce(v77)
                let v80 = atom.create(v46)
                let v81 = atom.create(v48)
                let v82 = []
                let v83 = [v79, ..v82]
                let v84 = [v7, ..v83]
                let v85 = [v78, ..v84]
                let v86 = erlang_term_apply(v80, v81, v85)
                let v87 = erlang_term_coerce(v86)
                let v88 = erlang_term_coerce(v41)
                let v90 = erlang_term_coerce("token")
                let v91 = erlang_term_coerce(v88)
                let v92 = atom.create(v46)
                let v93 = atom.create(v48)
                let v94 = []
                let v95 = [v91, ..v94]
                let v96 = [v87, ..v95]
                let v97 = [v90, ..v96]
                let v98 = erlang_term_apply(v92, v93, v97)
                let v99 = erlang_term_coerce(v98)
                let v100 = erlang_term_coerce(v99)
                v76 == v100
            }
            False -> False
        }
    case v102 {
        True -> {
            let v104 = method684(v32, Uh50Nil)
            let v109 =
                case v104  {
                    Uh50Cons(v105, v106, v107) -> v106
                    Uh50Nil -> v41
                }
            let v110 = erlang_term_coerce(v41)
            let v111 = erlang_term_coerce(v43)
            let v112 = erlang_term_coerce(v110)
            let v113 = atom.create(v46)
            let v114 = atom.create(v48)
            let v115 = []
            let v116 = [v112, ..v115]
            let v117 = [v7, ..v116]
            let v118 = [v111, ..v117]
            let v119 = erlang_term_apply(v113, v114, v118)
            let v120 = erlang_term_coerce(v119)
            let v121 = erlang_term_coerce(v41)
            let v123 = erlang_term_coerce("consumer_secret")
            let v124 = erlang_term_coerce(v121)
            let v125 = atom.create(v46)
            let v126 = atom.create(v48)
            let v127 = []
            let v128 = [v124, ..v127]
            let v129 = [v120, ..v128]
            let v130 = [v123, ..v129]
            let v131 = erlang_term_apply(v125, v126, v130)
            let v132 = erlang_term_coerce(v131)
            let v133 = erlang_term_coerce(v132)
            let v134 = erlang_term_coerce(v41)
            let v135 = erlang_term_coerce(v43)
            let v136 = erlang_term_coerce(v134)
            let v137 = atom.create(v46)
            let v138 = atom.create(v48)
            let v139 = []
            let v140 = [v136, ..v139]
            let v141 = [v7, ..v140]
            let v142 = [v135, ..v141]
            let v143 = erlang_term_apply(v137, v138, v142)
            let v144 = erlang_term_coerce(v143)
            let v145 = erlang_term_coerce(v41)
            let v147 = erlang_term_coerce("token_secret")
            let v148 = erlang_term_coerce(v145)
            let v149 = atom.create(v46)
            let v150 = atom.create(v48)
            let v151 = []
            let v152 = [v148, ..v151]
            let v153 = [v144, ..v152]
            let v154 = [v147, ..v153]
            let v155 = erlang_term_apply(v149, v150, v154)
            let v156 = erlang_term_coerce(v155)
            let v157 = erlang_term_coerce(v156)
            let v159 = header_value_537("host", v18)
            let v160 = { "http://" } <> { v159 }
            let v161 = { v160 } <> { v16 }
            let v163 = method685(v32, Uh50Nil)
            let v164 = oauth1_signature_686(v15, v161, v163, v133, v157)
            v109 == v164
        }
        False -> False
    }
}

pub fn answer_691(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, _v12: Uh36, _v13: String, _v14: String, _v15: String, _v16: String, _v17: String, _v18: String, _v19: String, v20: Us114) -> String {
    case v20  {
        Us114Unauthenticated -> {
            let v21 = "Unauthorized"
            let v22 = erlang_term_coerce(v21)
            let v23 = erlang_term_coerce(v21)
            let v25 = erlang_term_coerce("about:blank")
            let v26 = erlang_term_coerce(401)
            let v28 = atom.create("status")
            let v29 = erlang_term_coerce(v28)
            let v30 = []
            let v31 = [v26, ..v30]
            let v32 = [v29, ..v31]
            let v33 = erlang_term_tuple(v32)
            let v35 = atom.create("type")
            let v36 = erlang_term_coerce(v35)
            let v37 = []
            let v38 = [v25, ..v37]
            let v39 = [v36, ..v38]
            let v40 = erlang_term_tuple(v39)
            let v42 = atom.create("detail")
            let v43 = erlang_term_coerce(v42)
            let v44 = []
            let v45 = [v23, ..v44]
            let v46 = [v43, ..v45]
            let v47 = erlang_term_tuple(v46)
            let v49 = atom.create("title")
            let v50 = erlang_term_coerce(v49)
            let v51 = []
            let v52 = [v22, ..v51]
            let v53 = [v50, ..v52]
            let v54 = erlang_term_tuple(v53)
            let v55 = []
            let v56 = [v33, ..v55]
            let v57 = [v40, ..v56]
            let v58 = [v47, ..v57]
            let v59 = [v54, ..v58]
            let v60 = erlang_term_coerce(v59)
            let v62 = atom.create("maps")
            let v64 = atom.create("from_list")
            let v65 = []
            let v66 = [v60, ..v65]
            let v67 = erlang_term_apply(v62, v64, v66)
            let v69 = atom.create("json")
            let v71 = atom.create("encode")
            let v72 = []
            let v73 = [v67, ..v72]
            let v74 = erlang_term_apply(v69, v71, v73)
            let v75 = "erlang"
            let v76 = atom.create(v75)
            let v78 = atom.create("iolist_to_binary")
            let v79 = []
            let v80 = [v74, ..v79]
            let v81 = erlang_term_apply(v76, v78, v80)
            let v82 = erlang_term_coerce(v81)
            let v83 = int.to_string(401)
            let v84 = { "HTTP/1.1 " } <> { v83 }
            let v85 = { v84 } <> { " " }
            let v86 = { v85 } <> { "Unauthorized" }
            let v87 = erlang_term_coerce(v82)
            let v88 = atom.create(v75)
            let v90 = atom.create("byte_size")
            let v91 = []
            let v92 = [v87, ..v91]
            let v93 = erlang_term_apply(v88, v90, v92)
            let v94 = erlang_term_coerce(v93)
            let v95 = int.to_string(v94)
            let v96 = { "\r\nContent-Length: " } <> { v95 }
            let v97 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v96 }
            let v98 = { v97 } <> { "\r\nConnection: close\r\n\r\n" }
            let v99 = { v86 } <> { v98 }
            let v100 = { v99 } <> { v82 }
            v100
        }
    }
}

pub fn change_reply_692(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, _v15: String, _v16: String, _v17: String, _v18: String, _v19: String, v20: Us114) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    case v20  {
        Us114Unauthenticated -> {
            let v21 = "Unauthorized"
            let v22 = erlang_term_coerce(v21)
            let v23 = erlang_term_coerce(v21)
            let v25 = erlang_term_coerce("about:blank")
            let v26 = erlang_term_coerce(401)
            let v28 = atom.create("status")
            let v29 = erlang_term_coerce(v28)
            let v30 = []
            let v31 = [v26, ..v30]
            let v32 = [v29, ..v31]
            let v33 = erlang_term_tuple(v32)
            let v35 = atom.create("type")
            let v36 = erlang_term_coerce(v35)
            let v37 = []
            let v38 = [v25, ..v37]
            let v39 = [v36, ..v38]
            let v40 = erlang_term_tuple(v39)
            let v42 = atom.create("detail")
            let v43 = erlang_term_coerce(v42)
            let v44 = []
            let v45 = [v23, ..v44]
            let v46 = [v43, ..v45]
            let v47 = erlang_term_tuple(v46)
            let v49 = atom.create("title")
            let v50 = erlang_term_coerce(v49)
            let v51 = []
            let v52 = [v22, ..v51]
            let v53 = [v50, ..v52]
            let v54 = erlang_term_tuple(v53)
            let v55 = []
            let v56 = [v33, ..v55]
            let v57 = [v40, ..v56]
            let v58 = [v47, ..v57]
            let v59 = [v54, ..v58]
            let v60 = erlang_term_coerce(v59)
            let v62 = atom.create("maps")
            let v64 = atom.create("from_list")
            let v65 = []
            let v66 = [v60, ..v65]
            let v67 = erlang_term_apply(v62, v64, v66)
            let v69 = atom.create("json")
            let v71 = atom.create("encode")
            let v72 = []
            let v73 = [v67, ..v72]
            let v74 = erlang_term_apply(v69, v71, v73)
            let v75 = "erlang"
            let v76 = atom.create(v75)
            let v78 = atom.create("iolist_to_binary")
            let v79 = []
            let v80 = [v74, ..v79]
            let v81 = erlang_term_apply(v76, v78, v80)
            let v82 = erlang_term_coerce(v81)
            let v83 = int.to_string(401)
            let v84 = { "HTTP/1.1 " } <> { v83 }
            let v85 = { v84 } <> { " " }
            let v86 = { v85 } <> { "Unauthorized" }
            let v87 = erlang_term_coerce(v82)
            let v88 = atom.create(v75)
            let v90 = atom.create("byte_size")
            let v91 = []
            let v92 = [v87, ..v91]
            let v93 = erlang_term_apply(v88, v90, v92)
            let v94 = erlang_term_coerce(v93)
            let v95 = int.to_string(v94)
            let v96 = { "\r\nContent-Length: " } <> { v95 }
            let v97 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v96 }
            let v98 = { v97 } <> { "\r\nConnection: close\r\n\r\n" }
            let v99 = { v86 } <> { v98 }
            let v100 = { v99 } <> { v82 }
            #(v100, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
        }
    }
}

pub fn reply_as_690(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: String, v21: Us114) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    let v23 =
        case v21  {
            Us114Unauthenticated -> {
                ""
            }
        }
    logged_542(v15, v16, v17, v18, v19, v20, v23)
    let v24 = { "xsim serve / answered " } <> { v16 }
    let v25 = { v24 } <> { " " }
    let v26 = { v25 } <> { v17 }
    let v27 = { v26 } <> { "\n" }
    let v29 = atom.create("standard_error")
    let v30 = erlang_term_coerce(v29)
    let v31 = erlang_term_coerce(v27)
    let v33 = atom.create("io")
    let v35 = atom.create("put_chars")
    let v36 = []
    let v37 = [v31, ..v36]
    let v38 = [v30, ..v37]
    let _v39 = erlang_term_apply(v33, v35, v38)
    let v40 = v16 == "GET"
    case v40 {
        True -> {
            let v41 = answer_691(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v16, v17, v18, v19, v20, v21)
            #(v41, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
        }
        False -> change_reply_692(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v16, v17, v18, v19, v20, v21)
    }
}

pub fn signed_reply_679(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: String, v21: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    let v23 = v21 |> string.starts_with("OAuth ")
    let v25 =
        case v23 {
            True -> oauth1_valid_680(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v16, v17, v18, v19, v20, v21)
            False -> False
        }
    case v25 {
        True -> {
            reply_as_661(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, Us112OAuth1User)
        }
        False -> {
            reply_as_690(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, Us114Unauthenticated)
        }
    }
}
