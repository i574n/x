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
import xsim_frames/part28.{header_value_535, logged_540}
import xsim_frames/part3.{method56, method57}
import xsim_frames/part35.{answer_672, issued_next_675, reply_as_659}

pub fn renewed_674(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, _v14: String, _v15: String, _v16: String, _v17: String, v18: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let v19 = "\r\n\r\n"
    let v20 = option.from_result(result.map(string.split_once(v18, v19), pair.first))
    let v21 = closure1(Nil)
    let v22 = v20 |> option.map(v21)
    let v24 = v22 |> option.unwrap(Us2None)
    let v28 =
        case v24  {
            Us2None -> -1
            Us2Some(v25) -> {
                bit_array.byte_size(bit_array.from_string(v25))
            }
        }
    let v29 = spiral_wrap_signed(v28 + 4, 32)
    let v30 = option.from_result(result.map(string.split_once(v18, v19), pair.first))
    let v31 = v30 |> option.map(v21)
    let v33 = v31 |> option.unwrap(Us2None)
    let v37 =
        case v33  {
            Us2None -> -1
            Us2Some(v34) -> {
                bit_array.byte_size(bit_array.from_string(v34))
            }
        }
    let v38 = v37 < 0
    let v45 =
        case v38 {
            True -> {
                ""
            }
            False -> {
                let v40 = spiral_string_length(v18)
                let v41 = spiral_wrap_signed(v40 - v29, 32)
                let v42 = spiral_wrap_signed(v29 + v41, 32)
                let v43 = spiral_wrap_signed(v42 - 1, 32)
                spiral_string_slice(v18, v29, v43)
            }
        }
    let v47 = v45 == ""
    let v51 =
        case v47 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v45)
            }
        }
    let v52 = first_value_465("grant_type", v51)
    let v53 = v52 == ""
    let v55 =
        case v53 {
            True -> {
                ""
            }
            False -> v52
        }
    let v56 = v55 == "refresh_token"
    let v72 =
        case v56 {
            True -> {
                let v61 =
                    case v47 {
                        True -> Uh3Nil
                        False -> {
                            split_list_2("&", v45)
                        }
                    }
                let v62 = first_value_465("refresh_token", v61)
                let v63 = v62 == ""
                let v65 =
                    case v63 {
                        True -> {
                            ""
                        }
                        False -> v62
                    }
                let v70 =
                    case v8  {
                        Uh3Cons(v66, v67) -> v66
                        Uh3Nil -> {
                            ""
                        }
                    }
                v65 == v70
            }
            False -> False
        }
    case v72 {
        True -> issued_next_675(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
        False -> {
            let v89 = erlang_term_coerce("invalid_request")
            let v91 = erlang_term_coerce("Value passed for the token was invalid.")
            let v93 = atom.create("error_description")
            let v94 = erlang_term_coerce(v93)
            let v95 = []
            let v96 = [v91, ..v95]
            let v97 = [v94, ..v96]
            let v98 = erlang_term_tuple(v97)
            let v100 = atom.create("error")
            let v101 = erlang_term_coerce(v100)
            let v102 = []
            let v103 = [v89, ..v102]
            let v104 = [v101, ..v103]
            let v105 = erlang_term_tuple(v104)
            let v106 = []
            let v107 = [v98, ..v106]
            let v108 = [v105, ..v107]
            let v109 = erlang_term_coerce(v108)
            let v111 = atom.create("maps")
            let v113 = atom.create("from_list")
            let v114 = []
            let v115 = [v109, ..v114]
            let v116 = erlang_term_apply(v111, v113, v115)
            let v118 = atom.create("json")
            let v120 = atom.create("encode")
            let v121 = []
            let v122 = [v116, ..v121]
            let v123 = erlang_term_apply(v118, v120, v122)
            let v124 = "erlang"
            let v125 = atom.create(v124)
            let v127 = atom.create("iolist_to_binary")
            let v128 = []
            let v129 = [v123, ..v128]
            let v130 = erlang_term_apply(v125, v127, v129)
            let v131 = erlang_term_coerce(v130)
            let v132 = int.to_string(400)
            let v133 = { "HTTP/1.1 " } <> { v132 }
            let v134 = { v133 } <> { " " }
            let v135 = { v134 } <> { "Bad Request" }
            let v136 = erlang_term_coerce(v131)
            let v137 = atom.create(v124)
            let v139 = atom.create("byte_size")
            let v140 = []
            let v141 = [v136, ..v140]
            let v142 = erlang_term_apply(v137, v139, v141)
            let v143 = erlang_term_coerce(v142)
            let v144 = int.to_string(v143)
            let v145 = { "\r\nContent-Length: " } <> { v144 }
            let v146 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v145 }
            let v147 = { v146 } <> { "\r\nConnection: close\r\n\r\n" }
            let v148 = { v135 } <> { v147 }
            let v149 = { v148 } <> { v131 }
            #(v149, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
        }
    }
}

pub fn user_write_676(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, _v14: String, _v15: String, _v16: String, _v17: String, _v18: String, _v19: Us113) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let v21 = erlang_term_coerce("Unsupported Authentication")
    let v23 = erlang_term_coerce("Authenticating with OAuth 2.0 Application-Only is forbidden for this endpoint.  Supported authentication types are [OAuth 1.0a User Context, OAuth 2.0 User Context].")
    let v25 = erlang_term_coerce("https://api.x.com/2/problems/unsupported-authentication")
    let v26 = erlang_term_coerce(403)
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
    let v52 = [v21, ..v51]
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
    let v83 = int.to_string(403)
    let v84 = { "HTTP/1.1 " } <> { v83 }
    let v85 = { v84 } <> { " " }
    let v86 = { v85 } <> { "Forbidden" }
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
    #(v100, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
}

pub fn change_reply_673(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: Us113) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    case v19  {
        Us113ClientBasic -> {
            let v20 = v14 == "POST"
            case v20 {
                True -> renewed_674(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
                False -> user_write_676(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
            }
        }
    }
}

pub fn reply_as_671(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: Us113) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let v22 =
        case v20  {
            Us113ClientBasic -> {
                "client"
            }
        }
    logged_540(v14, v15, v16, v17, v18, v19, v22)
    let v23 = { "xsim serve / answered " } <> { v15 }
    let v24 = { v23 } <> { " " }
    let v25 = { v24 } <> { v16 }
    let v26 = { v25 } <> { "\n" }
    let v28 = atom.create("standard_error")
    let v29 = erlang_term_coerce(v28)
    let v30 = erlang_term_coerce(v26)
    let v32 = atom.create("io")
    let v34 = atom.create("put_chars")
    let v35 = []
    let v36 = [v30, ..v35]
    let v37 = [v29, ..v36]
    let _v38 = erlang_term_apply(v32, v34, v37)
    let v39 = v15 == "GET"
    case v39 {
        True -> {
            let v40 = answer_672(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v15, v16, v17, v18, v19, v20)
            #(v40, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
        }
        False -> change_reply_673(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v15, v16, v17, v18, v19, v20)
    }
}

pub fn method679(v0: Uh3, v1: Uh50) -> Uh50 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method679(v3, v1)
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

pub fn method680(v0: Uh50, v1: Uh50) -> Uh50 {
    case v0  {
        Uh50Cons(v2, v3, v4) -> {
            let v5 = method680(v4, v1)
            let v6 = v2 == "oauth_consumer_key"
            case v6 {
                True -> Uh50Cons(v2, v3, v5)
                False -> v5
            }
        }
        Uh50Nil -> v1
    }
}

pub fn method681(v0: Uh50, v1: Uh50) -> Uh50 {
    case v0  {
        Uh50Cons(v2, v3, v4) -> {
            let v5 = method681(v4, v1)
            let v6 = v2 == "oauth_token"
            case v6 {
                True -> Uh50Cons(v2, v3, v5)
                False -> v5
            }
        }
        Uh50Nil -> v1
    }
}

pub fn method682(v0: Uh50, v1: Uh50) -> Uh50 {
    case v0  {
        Uh50Cons(v2, v3, v4) -> {
            let v5 = method682(v4, v1)
            let v6 = v2 == "oauth_signature"
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
            let v6 = v2 != "oauth_signature"
            case v6 {
                True -> Uh50Cons(v2, v3, v5)
                False -> v5
            }
        }
        Uh50Nil -> v1
    }
}

pub fn method686(v0: Uh50, v1: Uh29) -> Uh29 {
    case v0  {
        Uh50Cons(v2, v3, v4) -> {
            let v5 = method686(v4, v1)
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

pub fn method687(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method687(v3, v1)
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

pub fn signed_params_685(v0: Uh50) -> String {
    let v2 = method686(v0, Uh29Nil)
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
    let v22 = method687(v20, Uh3Nil)
    delimited_21("&", v22)
}

pub fn oauth1_signature_684(v0: String, v1: String, v2: Uh50, v3: String, v4: String) -> String {
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
    let v27 = signed_params_685(v2)
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

pub fn oauth1_valid_678(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, _v12: Uh36, _v13: String, v14: String, v15: String, _v16: String, v17: String, _v18: String, v19: String) -> Bool {
    let v20 = spiral_string_length(v19)
    let v21 = spiral_wrap_signed(v20 - 6, 32)
    let v22 = spiral_wrap_signed(6 + v21, 32)
    let v23 = spiral_wrap_signed(v22 - 1, 32)
    let v24 = spiral_string_slice(v19, 6, v23)
    let v25 = v24 == ""
    let v29 =
        case v25 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v24)
            }
        }
    let v31 = method679(v29, Uh50Nil)
    let v33 = method680(v31, Uh50Nil)
    let v39 =
        case v33  {
            Uh50Cons(v34, v35, v36) -> v35
            Uh50Nil -> {
                ""
            }
        }
    let v40 = ""
    let v41 = erlang_term_coerce(v40)
    let v42 = "oauth1"
    let v43 = erlang_term_coerce(v42)
    let v44 = erlang_term_coerce(v41)
    let v45 = "maps"
    let v46 = atom.create(v45)
    let v47 = "get"
    let v48 = atom.create(v47)
    let v49 = []
    let v50 = [v44, ..v49]
    let v51 = [v7, ..v50]
    let v52 = [v43, ..v51]
    let v53 = erlang_term_apply(v46, v48, v52)
    let v54 = erlang_term_coerce(v53)
    let v55 = erlang_term_coerce(v40)
    let v57 = erlang_term_coerce("consumer_key")
    let v58 = erlang_term_coerce(v55)
    let v59 = atom.create(v45)
    let v60 = atom.create(v47)
    let v61 = []
    let v62 = [v58, ..v61]
    let v63 = [v54, ..v62]
    let v64 = [v57, ..v63]
    let v65 = erlang_term_apply(v59, v60, v64)
    let v66 = erlang_term_coerce(v65)
    let v67 = erlang_term_coerce(v66)
    let v68 = v39 == v67
    let v101 =
        case v68 {
            True -> {
                let v70 = method681(v31, Uh50Nil)
                let v75 =
                    case v70  {
                        Uh50Cons(v71, v72, v73) -> v72
                        Uh50Nil -> v40
                    }
                let v76 = erlang_term_coerce(v40)
                let v77 = erlang_term_coerce(v42)
                let v78 = erlang_term_coerce(v76)
                let v79 = atom.create(v45)
                let v80 = atom.create(v47)
                let v81 = []
                let v82 = [v78, ..v81]
                let v83 = [v7, ..v82]
                let v84 = [v77, ..v83]
                let v85 = erlang_term_apply(v79, v80, v84)
                let v86 = erlang_term_coerce(v85)
                let v87 = erlang_term_coerce(v40)
                let v89 = erlang_term_coerce("token")
                let v90 = erlang_term_coerce(v87)
                let v91 = atom.create(v45)
                let v92 = atom.create(v47)
                let v93 = []
                let v94 = [v90, ..v93]
                let v95 = [v86, ..v94]
                let v96 = [v89, ..v95]
                let v97 = erlang_term_apply(v91, v92, v96)
                let v98 = erlang_term_coerce(v97)
                let v99 = erlang_term_coerce(v98)
                v75 == v99
            }
            False -> False
        }
    case v101 {
        True -> {
            let v103 = method682(v31, Uh50Nil)
            let v108 =
                case v103  {
                    Uh50Cons(v104, v105, v106) -> v105
                    Uh50Nil -> v40
                }
            let v109 = erlang_term_coerce(v40)
            let v110 = erlang_term_coerce(v42)
            let v111 = erlang_term_coerce(v109)
            let v112 = atom.create(v45)
            let v113 = atom.create(v47)
            let v114 = []
            let v115 = [v111, ..v114]
            let v116 = [v7, ..v115]
            let v117 = [v110, ..v116]
            let v118 = erlang_term_apply(v112, v113, v117)
            let v119 = erlang_term_coerce(v118)
            let v120 = erlang_term_coerce(v40)
            let v122 = erlang_term_coerce("consumer_secret")
            let v123 = erlang_term_coerce(v120)
            let v124 = atom.create(v45)
            let v125 = atom.create(v47)
            let v126 = []
            let v127 = [v123, ..v126]
            let v128 = [v119, ..v127]
            let v129 = [v122, ..v128]
            let v130 = erlang_term_apply(v124, v125, v129)
            let v131 = erlang_term_coerce(v130)
            let v132 = erlang_term_coerce(v131)
            let v133 = erlang_term_coerce(v40)
            let v134 = erlang_term_coerce(v42)
            let v135 = erlang_term_coerce(v133)
            let v136 = atom.create(v45)
            let v137 = atom.create(v47)
            let v138 = []
            let v139 = [v135, ..v138]
            let v140 = [v7, ..v139]
            let v141 = [v134, ..v140]
            let v142 = erlang_term_apply(v136, v137, v141)
            let v143 = erlang_term_coerce(v142)
            let v144 = erlang_term_coerce(v40)
            let v146 = erlang_term_coerce("token_secret")
            let v147 = erlang_term_coerce(v144)
            let v148 = atom.create(v45)
            let v149 = atom.create(v47)
            let v150 = []
            let v151 = [v147, ..v150]
            let v152 = [v143, ..v151]
            let v153 = [v146, ..v152]
            let v154 = erlang_term_apply(v148, v149, v153)
            let v155 = erlang_term_coerce(v154)
            let v156 = erlang_term_coerce(v155)
            let v158 = header_value_535("host", v17)
            let v159 = { "http://" } <> { v158 }
            let v160 = { v159 } <> { v15 }
            let v162 = method683(v31, Uh50Nil)
            let v163 = oauth1_signature_684(v14, v160, v162, v132, v156)
            v108 == v163
        }
        False -> False
    }
}

pub fn answer_689(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, _v12: Uh36, _v13: String, _v14: String, _v15: String, _v16: String, _v17: String, _v18: String, v19: Us114) -> String {
    case v19  {
        Us114Unauthenticated -> {
            let v20 = "Unauthorized"
            let v21 = erlang_term_coerce(v20)
            let v22 = erlang_term_coerce(v20)
            let v24 = erlang_term_coerce("about:blank")
            let v25 = erlang_term_coerce(401)
            let v27 = atom.create("status")
            let v28 = erlang_term_coerce(v27)
            let v29 = []
            let v30 = [v25, ..v29]
            let v31 = [v28, ..v30]
            let v32 = erlang_term_tuple(v31)
            let v34 = atom.create("type")
            let v35 = erlang_term_coerce(v34)
            let v36 = []
            let v37 = [v24, ..v36]
            let v38 = [v35, ..v37]
            let v39 = erlang_term_tuple(v38)
            let v41 = atom.create("detail")
            let v42 = erlang_term_coerce(v41)
            let v43 = []
            let v44 = [v22, ..v43]
            let v45 = [v42, ..v44]
            let v46 = erlang_term_tuple(v45)
            let v48 = atom.create("title")
            let v49 = erlang_term_coerce(v48)
            let v50 = []
            let v51 = [v21, ..v50]
            let v52 = [v49, ..v51]
            let v53 = erlang_term_tuple(v52)
            let v54 = []
            let v55 = [v32, ..v54]
            let v56 = [v39, ..v55]
            let v57 = [v46, ..v56]
            let v58 = [v53, ..v57]
            let v59 = erlang_term_coerce(v58)
            let v61 = atom.create("maps")
            let v63 = atom.create("from_list")
            let v64 = []
            let v65 = [v59, ..v64]
            let v66 = erlang_term_apply(v61, v63, v65)
            let v68 = atom.create("json")
            let v70 = atom.create("encode")
            let v71 = []
            let v72 = [v66, ..v71]
            let v73 = erlang_term_apply(v68, v70, v72)
            let v74 = "erlang"
            let v75 = atom.create(v74)
            let v77 = atom.create("iolist_to_binary")
            let v78 = []
            let v79 = [v73, ..v78]
            let v80 = erlang_term_apply(v75, v77, v79)
            let v81 = erlang_term_coerce(v80)
            let v82 = int.to_string(401)
            let v83 = { "HTTP/1.1 " } <> { v82 }
            let v84 = { v83 } <> { " " }
            let v85 = { v84 } <> { "Unauthorized" }
            let v86 = erlang_term_coerce(v81)
            let v87 = atom.create(v74)
            let v89 = atom.create("byte_size")
            let v90 = []
            let v91 = [v86, ..v90]
            let v92 = erlang_term_apply(v87, v89, v91)
            let v93 = erlang_term_coerce(v92)
            let v94 = int.to_string(v93)
            let v95 = { "\r\nContent-Length: " } <> { v94 }
            let v96 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v95 }
            let v97 = { v96 } <> { "\r\nConnection: close\r\n\r\n" }
            let v98 = { v85 } <> { v97 }
            let v99 = { v98 } <> { v81 }
            v99
        }
    }
}

pub fn change_reply_690(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, _v14: String, _v15: String, _v16: String, _v17: String, _v18: String, v19: Us114) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    case v19  {
        Us114Unauthenticated -> {
            let v20 = "Unauthorized"
            let v21 = erlang_term_coerce(v20)
            let v22 = erlang_term_coerce(v20)
            let v24 = erlang_term_coerce("about:blank")
            let v25 = erlang_term_coerce(401)
            let v27 = atom.create("status")
            let v28 = erlang_term_coerce(v27)
            let v29 = []
            let v30 = [v25, ..v29]
            let v31 = [v28, ..v30]
            let v32 = erlang_term_tuple(v31)
            let v34 = atom.create("type")
            let v35 = erlang_term_coerce(v34)
            let v36 = []
            let v37 = [v24, ..v36]
            let v38 = [v35, ..v37]
            let v39 = erlang_term_tuple(v38)
            let v41 = atom.create("detail")
            let v42 = erlang_term_coerce(v41)
            let v43 = []
            let v44 = [v22, ..v43]
            let v45 = [v42, ..v44]
            let v46 = erlang_term_tuple(v45)
            let v48 = atom.create("title")
            let v49 = erlang_term_coerce(v48)
            let v50 = []
            let v51 = [v21, ..v50]
            let v52 = [v49, ..v51]
            let v53 = erlang_term_tuple(v52)
            let v54 = []
            let v55 = [v32, ..v54]
            let v56 = [v39, ..v55]
            let v57 = [v46, ..v56]
            let v58 = [v53, ..v57]
            let v59 = erlang_term_coerce(v58)
            let v61 = atom.create("maps")
            let v63 = atom.create("from_list")
            let v64 = []
            let v65 = [v59, ..v64]
            let v66 = erlang_term_apply(v61, v63, v65)
            let v68 = atom.create("json")
            let v70 = atom.create("encode")
            let v71 = []
            let v72 = [v66, ..v71]
            let v73 = erlang_term_apply(v68, v70, v72)
            let v74 = "erlang"
            let v75 = atom.create(v74)
            let v77 = atom.create("iolist_to_binary")
            let v78 = []
            let v79 = [v73, ..v78]
            let v80 = erlang_term_apply(v75, v77, v79)
            let v81 = erlang_term_coerce(v80)
            let v82 = int.to_string(401)
            let v83 = { "HTTP/1.1 " } <> { v82 }
            let v84 = { v83 } <> { " " }
            let v85 = { v84 } <> { "Unauthorized" }
            let v86 = erlang_term_coerce(v81)
            let v87 = atom.create(v74)
            let v89 = atom.create("byte_size")
            let v90 = []
            let v91 = [v86, ..v90]
            let v92 = erlang_term_apply(v87, v89, v91)
            let v93 = erlang_term_coerce(v92)
            let v94 = int.to_string(v93)
            let v95 = { "\r\nContent-Length: " } <> { v94 }
            let v96 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v95 }
            let v97 = { v96 } <> { "\r\nConnection: close\r\n\r\n" }
            let v98 = { v85 } <> { v97 }
            let v99 = { v98 } <> { v81 }
            #(v99, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
        }
    }
}

pub fn reply_as_688(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: Us114) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let v22 =
        case v20  {
            Us114Unauthenticated -> {
                ""
            }
        }
    logged_540(v14, v15, v16, v17, v18, v19, v22)
    let v23 = { "xsim serve / answered " } <> { v15 }
    let v24 = { v23 } <> { " " }
    let v25 = { v24 } <> { v16 }
    let v26 = { v25 } <> { "\n" }
    let v28 = atom.create("standard_error")
    let v29 = erlang_term_coerce(v28)
    let v30 = erlang_term_coerce(v26)
    let v32 = atom.create("io")
    let v34 = atom.create("put_chars")
    let v35 = []
    let v36 = [v30, ..v35]
    let v37 = [v29, ..v36]
    let _v38 = erlang_term_apply(v32, v34, v37)
    let v39 = v15 == "GET"
    case v39 {
        True -> {
            let v40 = answer_689(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v15, v16, v17, v18, v19, v20)
            #(v40, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
        }
        False -> change_reply_690(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v15, v16, v17, v18, v19, v20)
    }
}

pub fn signed_reply_677(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let v22 = v20 |> string.starts_with("OAuth ")
    let v24 =
        case v22 {
            True -> oauth1_valid_678(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v15, v16, v17, v18, v19, v20)
            False -> False
        }
    case v24 {
        True -> {
            reply_as_659(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, Us112OAuth1User)
        }
        False -> {
            reply_as_688(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, Us114Unauthenticated)
        }
    }
}
