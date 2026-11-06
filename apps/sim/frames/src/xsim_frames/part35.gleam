import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh30, type Uh37, type Uh50, type Us112, type Us113, Uh30Cons, Uh30Nil, Uh3Cons, Uh3Nil, Uh50Cons, Uh50Nil, Us111OAuth1User, Us112ClientBasic, Us113Unauthenticated, Us2None, Us2Some}
import xsim_frames/part1.{closure1, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_crypto_mac, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part12.{items_from_303, method302}
import xsim_frames/part2.{delimited_21}
import xsim_frames/part25.{first_value_467}
import xsim_frames/part27.{header_value_531, logged_535}
import xsim_frames/part3.{method58, method59}
import xsim_frames/part34.{answer_667, issued_next_670, reply_as_654}

pub fn renewed_669(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, _v13: String, _v14: String, _v15: String, _v16: String, v17: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    let v18 = "\r\n\r\n"
    let v19 = option.from_result(result.map(string.split_once(v17, v18), pair.first))
    let v20 = closure1(Nil)
    let v21 = v19 |> option.map(v20)
    let v23 = v21 |> option.unwrap(Us2None)
    let v27 =
        case v23  {
            Us2None -> -1
            Us2Some(v24) -> {
                bit_array.byte_size(bit_array.from_string(v24))
            }
        }
    let v28 = spiral_wrap_signed(v27 + 4, 32)
    let v29 = option.from_result(result.map(string.split_once(v17, v18), pair.first))
    let v30 = v29 |> option.map(v20)
    let v32 = v30 |> option.unwrap(Us2None)
    let v36 =
        case v32  {
            Us2None -> -1
            Us2Some(v33) -> {
                bit_array.byte_size(bit_array.from_string(v33))
            }
        }
    let v37 = v36 < 0
    let v44 =
        case v37 {
            True -> {
                ""
            }
            False -> {
                let v39 = spiral_string_length(v17)
                let v40 = spiral_wrap_signed(v39 - v28, 32)
                let v41 = spiral_wrap_signed(v28 + v40, 32)
                let v42 = spiral_wrap_signed(v41 - 1, 32)
                spiral_string_slice(v17, v28, v42)
            }
        }
    let v46 = v44 == ""
    let v50 =
        case v46 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v44)
            }
        }
    let v51 = first_value_467("grant_type", v50)
    let v52 = v51 == ""
    let v54 =
        case v52 {
            True -> {
                ""
            }
            False -> v51
        }
    let v55 = v54 == "refresh_token"
    let v71 =
        case v55 {
            True -> {
                let v60 =
                    case v46 {
                        True -> Uh3Nil
                        False -> {
                            split_list_2("&", v44)
                        }
                    }
                let v61 = first_value_467("refresh_token", v60)
                let v62 = v61 == ""
                let v64 =
                    case v62 {
                        True -> {
                            ""
                        }
                        False -> v61
                    }
                let v69 =
                    case v8  {
                        Uh3Cons(v65, v66) -> v65
                        Uh3Nil -> {
                            ""
                        }
                    }
                v64 == v69
            }
            False -> False
        }
    case v71 {
        True -> issued_next_670(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
        False -> {
            let v87 = erlang_term_coerce("invalid_request")
            let v89 = erlang_term_coerce("Value passed for the token was invalid.")
            let v91 = atom.create("error_description")
            let v92 = erlang_term_coerce(v91)
            let v93 = []
            let v94 = [v89, ..v93]
            let v95 = [v92, ..v94]
            let v96 = erlang_term_tuple(v95)
            let v98 = atom.create("error")
            let v99 = erlang_term_coerce(v98)
            let v100 = []
            let v101 = [v87, ..v100]
            let v102 = [v99, ..v101]
            let v103 = erlang_term_tuple(v102)
            let v104 = []
            let v105 = [v96, ..v104]
            let v106 = [v103, ..v105]
            let v107 = erlang_term_coerce(v106)
            let v109 = atom.create("maps")
            let v111 = atom.create("from_list")
            let v112 = []
            let v113 = [v107, ..v112]
            let v114 = erlang_term_apply(v109, v111, v113)
            let v116 = atom.create("json")
            let v118 = atom.create("encode")
            let v119 = []
            let v120 = [v114, ..v119]
            let v121 = erlang_term_apply(v116, v118, v120)
            let v122 = "erlang"
            let v123 = atom.create(v122)
            let v125 = atom.create("iolist_to_binary")
            let v126 = []
            let v127 = [v121, ..v126]
            let v128 = erlang_term_apply(v123, v125, v127)
            let v129 = erlang_term_coerce(v128)
            let v130 = int.to_string(400)
            let v131 = { "HTTP/1.1 " } <> { v130 }
            let v132 = { v131 } <> { " " }
            let v133 = { v132 } <> { "Bad Request" }
            let v134 = erlang_term_coerce(v129)
            let v135 = atom.create(v122)
            let v137 = atom.create("byte_size")
            let v138 = []
            let v139 = [v134, ..v138]
            let v140 = erlang_term_apply(v135, v137, v139)
            let v141 = erlang_term_coerce(v140)
            let v142 = int.to_string(v141)
            let v143 = { "\r\nContent-Length: " } <> { v142 }
            let v144 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v143 }
            let v145 = { v144 } <> { "\r\nConnection: close\r\n\r\n" }
            let v146 = { v133 } <> { v145 }
            let v147 = { v146 } <> { v129 }
            #(v147, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
        }
    }
}

pub fn user_write_671(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, _v13: String, _v14: String, _v15: String, _v16: String, _v17: String, _v18: Us112) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    let v20 = erlang_term_coerce("Unsupported Authentication")
    let v22 = erlang_term_coerce("Authenticating with OAuth 2.0 Application-Only is forbidden for this endpoint.  Supported authentication types are [OAuth 1.0a User Context, OAuth 2.0 User Context].")
    let v24 = erlang_term_coerce("https://api.x.com/2/problems/unsupported-authentication")
    let v25 = erlang_term_coerce(403)
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
    let v51 = [v20, ..v50]
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
    let v82 = int.to_string(403)
    let v83 = { "HTTP/1.1 " } <> { v82 }
    let v84 = { v83 } <> { " " }
    let v85 = { v84 } <> { "Forbidden" }
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
    #(v99, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
}

pub fn change_reply_668(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String, v15: String, v16: String, v17: String, v18: Us112) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    case v18  {
        Us112ClientBasic -> {
            let v19 = v13 == "POST"
            case v19 {
                True -> renewed_669(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
                False -> user_write_671(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
            }
        }
    }
}

pub fn reply_as_666(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: Us112) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    let v21 =
        case v19  {
            Us112ClientBasic -> {
                "client"
            }
        }
    logged_535(v13, v14, v15, v16, v17, v18, v21)
    let v22 = { "xsim serve / answered " } <> { v14 }
    let v23 = { v22 } <> { " " }
    let v24 = { v23 } <> { v15 }
    let v25 = { v24 } <> { "\n" }
    let v27 = atom.create("standard_error")
    let v28 = erlang_term_coerce(v27)
    let v29 = erlang_term_coerce(v25)
    let v31 = atom.create("io")
    let v33 = atom.create("put_chars")
    let v34 = []
    let v35 = [v29, ..v34]
    let v36 = [v28, ..v35]
    let _v37 = erlang_term_apply(v31, v33, v36)
    let v38 = v14 == "GET"
    case v38 {
        True -> {
            let v39 = answer_667(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v14, v15, v16, v17, v18, v19)
            #(v39, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
        }
        False -> change_reply_668(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v14, v15, v16, v17, v18, v19)
    }
}

pub fn method674(v0: Uh3, v1: Uh50) -> Uh50 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method674(v3, v1)
            let v5 = spiral_string_length(v2)
            let v7 = method58(v2, v5, 0)
            let v8 = spiral_wrap_signed(v5 - 1, 32)
            let v9 = spiral_string_slice(v2, v7, v8)
            let v10 = spiral_string_length(v9)
            let v11 = method59(v9, v10)
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

pub fn method675(v0: Uh50, v1: Uh50) -> Uh50 {
    case v0  {
        Uh50Cons(v2, v3, v4) -> {
            let v5 = method675(v4, v1)
            let v6 = v2 == "oauth_consumer_key"
            case v6 {
                True -> Uh50Cons(v2, v3, v5)
                False -> v5
            }
        }
        Uh50Nil -> v1
    }
}

pub fn method676(v0: Uh50, v1: Uh50) -> Uh50 {
    case v0  {
        Uh50Cons(v2, v3, v4) -> {
            let v5 = method676(v4, v1)
            let v6 = v2 == "oauth_token"
            case v6 {
                True -> Uh50Cons(v2, v3, v5)
                False -> v5
            }
        }
        Uh50Nil -> v1
    }
}

pub fn method677(v0: Uh50, v1: Uh50) -> Uh50 {
    case v0  {
        Uh50Cons(v2, v3, v4) -> {
            let v5 = method677(v4, v1)
            let v6 = v2 == "oauth_signature"
            case v6 {
                True -> Uh50Cons(v2, v3, v5)
                False -> v5
            }
        }
        Uh50Nil -> v1
    }
}

pub fn method678(v0: Uh50, v1: Uh50) -> Uh50 {
    case v0  {
        Uh50Cons(v2, v3, v4) -> {
            let v5 = method678(v4, v1)
            let v6 = v2 != "oauth_signature"
            case v6 {
                True -> Uh50Cons(v2, v3, v5)
                False -> v5
            }
        }
        Uh50Nil -> v1
    }
}

pub fn method681(v0: Uh50, v1: Uh30) -> Uh30 {
    case v0  {
        Uh50Cons(v2, v3, v4) -> {
            let v5 = method681(v4, v1)
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
            Uh30Cons(v44, v5)
        }
        Uh50Nil -> v1
    }
}

pub fn method682(v0: Uh30, v1: Uh3) -> Uh3 {
    case v0  {
        Uh30Cons(v2, v3) -> {
            let v4 = method682(v3, v1)
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
        Uh30Nil -> v1
    }
}

pub fn signed_params_680(v0: Uh50) -> String {
    let v2 = method681(v0, Uh30Nil)
    let v3 = []
    let v4 = method302(v2, v3)
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
    let v20 = items_from_303(v18, Uh30Nil)
    let v22 = method682(v20, Uh3Nil)
    delimited_21("&", v22)
}

pub fn oauth1_signature_679(v0: String, v1: String, v2: Uh50, v3: String, v4: String) -> String {
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
    let v27 = signed_params_680(v2)
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

pub fn oauth1_valid_673(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, _v12: Uh37, v13: String, v14: String, _v15: String, v16: String, _v17: String, v18: String) -> Bool {
    let v19 = spiral_string_length(v18)
    let v20 = spiral_wrap_signed(v19 - 6, 32)
    let v21 = spiral_wrap_signed(6 + v20, 32)
    let v22 = spiral_wrap_signed(v21 - 1, 32)
    let v23 = spiral_string_slice(v18, 6, v22)
    let v24 = v23 == ""
    let v28 =
        case v24 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v23)
            }
        }
    let v30 = method674(v28, Uh50Nil)
    let v32 = method675(v30, Uh50Nil)
    let v38 =
        case v32  {
            Uh50Cons(v33, v34, v35) -> v34
            Uh50Nil -> {
                ""
            }
        }
    let v39 = ""
    let v40 = erlang_term_coerce(v39)
    let v41 = "oauth1"
    let v42 = erlang_term_coerce(v41)
    let v43 = erlang_term_coerce(v40)
    let v44 = "maps"
    let v45 = atom.create(v44)
    let v46 = "get"
    let v47 = atom.create(v46)
    let v48 = []
    let v49 = [v43, ..v48]
    let v50 = [v7, ..v49]
    let v51 = [v42, ..v50]
    let v52 = erlang_term_apply(v45, v47, v51)
    let v53 = erlang_term_coerce(v52)
    let v54 = erlang_term_coerce(v39)
    let v56 = erlang_term_coerce("consumer_key")
    let v57 = erlang_term_coerce(v54)
    let v58 = atom.create(v44)
    let v59 = atom.create(v46)
    let v60 = []
    let v61 = [v57, ..v60]
    let v62 = [v53, ..v61]
    let v63 = [v56, ..v62]
    let v64 = erlang_term_apply(v58, v59, v63)
    let v65 = erlang_term_coerce(v64)
    let v66 = erlang_term_coerce(v65)
    let v67 = v38 == v66
    let v100 =
        case v67 {
            True -> {
                let v69 = method676(v30, Uh50Nil)
                let v74 =
                    case v69  {
                        Uh50Cons(v70, v71, v72) -> v71
                        Uh50Nil -> v39
                    }
                let v75 = erlang_term_coerce(v39)
                let v76 = erlang_term_coerce(v41)
                let v77 = erlang_term_coerce(v75)
                let v78 = atom.create(v44)
                let v79 = atom.create(v46)
                let v80 = []
                let v81 = [v77, ..v80]
                let v82 = [v7, ..v81]
                let v83 = [v76, ..v82]
                let v84 = erlang_term_apply(v78, v79, v83)
                let v85 = erlang_term_coerce(v84)
                let v86 = erlang_term_coerce(v39)
                let v88 = erlang_term_coerce("token")
                let v89 = erlang_term_coerce(v86)
                let v90 = atom.create(v44)
                let v91 = atom.create(v46)
                let v92 = []
                let v93 = [v89, ..v92]
                let v94 = [v85, ..v93]
                let v95 = [v88, ..v94]
                let v96 = erlang_term_apply(v90, v91, v95)
                let v97 = erlang_term_coerce(v96)
                let v98 = erlang_term_coerce(v97)
                v74 == v98
            }
            False -> False
        }
    case v100 {
        True -> {
            let v102 = method677(v30, Uh50Nil)
            let v107 =
                case v102  {
                    Uh50Cons(v103, v104, v105) -> v104
                    Uh50Nil -> v39
                }
            let v108 = erlang_term_coerce(v39)
            let v109 = erlang_term_coerce(v41)
            let v110 = erlang_term_coerce(v108)
            let v111 = atom.create(v44)
            let v112 = atom.create(v46)
            let v113 = []
            let v114 = [v110, ..v113]
            let v115 = [v7, ..v114]
            let v116 = [v109, ..v115]
            let v117 = erlang_term_apply(v111, v112, v116)
            let v118 = erlang_term_coerce(v117)
            let v119 = erlang_term_coerce(v39)
            let v121 = erlang_term_coerce("consumer_secret")
            let v122 = erlang_term_coerce(v119)
            let v123 = atom.create(v44)
            let v124 = atom.create(v46)
            let v125 = []
            let v126 = [v122, ..v125]
            let v127 = [v118, ..v126]
            let v128 = [v121, ..v127]
            let v129 = erlang_term_apply(v123, v124, v128)
            let v130 = erlang_term_coerce(v129)
            let v131 = erlang_term_coerce(v130)
            let v132 = erlang_term_coerce(v39)
            let v133 = erlang_term_coerce(v41)
            let v134 = erlang_term_coerce(v132)
            let v135 = atom.create(v44)
            let v136 = atom.create(v46)
            let v137 = []
            let v138 = [v134, ..v137]
            let v139 = [v7, ..v138]
            let v140 = [v133, ..v139]
            let v141 = erlang_term_apply(v135, v136, v140)
            let v142 = erlang_term_coerce(v141)
            let v143 = erlang_term_coerce(v39)
            let v145 = erlang_term_coerce("token_secret")
            let v146 = erlang_term_coerce(v143)
            let v147 = atom.create(v44)
            let v148 = atom.create(v46)
            let v149 = []
            let v150 = [v146, ..v149]
            let v151 = [v142, ..v150]
            let v152 = [v145, ..v151]
            let v153 = erlang_term_apply(v147, v148, v152)
            let v154 = erlang_term_coerce(v153)
            let v155 = erlang_term_coerce(v154)
            let v157 = header_value_531("host", v16)
            let v158 = { "http://" } <> { v157 }
            let v159 = { v158 } <> { v14 }
            let v161 = method678(v30, Uh50Nil)
            let v162 = oauth1_signature_679(v13, v159, v161, v131, v155)
            v107 == v162
        }
        False -> False
    }
}

pub fn answer_684(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, _v12: Uh37, _v13: String, _v14: String, _v15: String, _v16: String, _v17: String, v18: Us113) -> String {
    case v18  {
        Us113Unauthenticated -> {
            let v19 = "Unauthorized"
            let v20 = erlang_term_coerce(v19)
            let v21 = erlang_term_coerce(v19)
            let v23 = erlang_term_coerce("about:blank")
            let v24 = erlang_term_coerce(401)
            let v26 = atom.create("status")
            let v27 = erlang_term_coerce(v26)
            let v28 = []
            let v29 = [v24, ..v28]
            let v30 = [v27, ..v29]
            let v31 = erlang_term_tuple(v30)
            let v33 = atom.create("type")
            let v34 = erlang_term_coerce(v33)
            let v35 = []
            let v36 = [v23, ..v35]
            let v37 = [v34, ..v36]
            let v38 = erlang_term_tuple(v37)
            let v40 = atom.create("detail")
            let v41 = erlang_term_coerce(v40)
            let v42 = []
            let v43 = [v21, ..v42]
            let v44 = [v41, ..v43]
            let v45 = erlang_term_tuple(v44)
            let v47 = atom.create("title")
            let v48 = erlang_term_coerce(v47)
            let v49 = []
            let v50 = [v20, ..v49]
            let v51 = [v48, ..v50]
            let v52 = erlang_term_tuple(v51)
            let v53 = []
            let v54 = [v31, ..v53]
            let v55 = [v38, ..v54]
            let v56 = [v45, ..v55]
            let v57 = [v52, ..v56]
            let v58 = erlang_term_coerce(v57)
            let v60 = atom.create("maps")
            let v62 = atom.create("from_list")
            let v63 = []
            let v64 = [v58, ..v63]
            let v65 = erlang_term_apply(v60, v62, v64)
            let v67 = atom.create("json")
            let v69 = atom.create("encode")
            let v70 = []
            let v71 = [v65, ..v70]
            let v72 = erlang_term_apply(v67, v69, v71)
            let v73 = "erlang"
            let v74 = atom.create(v73)
            let v76 = atom.create("iolist_to_binary")
            let v77 = []
            let v78 = [v72, ..v77]
            let v79 = erlang_term_apply(v74, v76, v78)
            let v80 = erlang_term_coerce(v79)
            let v81 = int.to_string(401)
            let v82 = { "HTTP/1.1 " } <> { v81 }
            let v83 = { v82 } <> { " " }
            let v84 = { v83 } <> { "Unauthorized" }
            let v85 = erlang_term_coerce(v80)
            let v86 = atom.create(v73)
            let v88 = atom.create("byte_size")
            let v89 = []
            let v90 = [v85, ..v89]
            let v91 = erlang_term_apply(v86, v88, v90)
            let v92 = erlang_term_coerce(v91)
            let v93 = int.to_string(v92)
            let v94 = { "\r\nContent-Length: " } <> { v93 }
            let v95 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v94 }
            let v96 = { v95 } <> { "\r\nConnection: close\r\n\r\n" }
            let v97 = { v84 } <> { v96 }
            let v98 = { v97 } <> { v80 }
            v98
        }
    }
}

pub fn change_reply_685(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, _v13: String, _v14: String, _v15: String, _v16: String, _v17: String, v18: Us113) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    case v18  {
        Us113Unauthenticated -> {
            let v19 = "Unauthorized"
            let v20 = erlang_term_coerce(v19)
            let v21 = erlang_term_coerce(v19)
            let v23 = erlang_term_coerce("about:blank")
            let v24 = erlang_term_coerce(401)
            let v26 = atom.create("status")
            let v27 = erlang_term_coerce(v26)
            let v28 = []
            let v29 = [v24, ..v28]
            let v30 = [v27, ..v29]
            let v31 = erlang_term_tuple(v30)
            let v33 = atom.create("type")
            let v34 = erlang_term_coerce(v33)
            let v35 = []
            let v36 = [v23, ..v35]
            let v37 = [v34, ..v36]
            let v38 = erlang_term_tuple(v37)
            let v40 = atom.create("detail")
            let v41 = erlang_term_coerce(v40)
            let v42 = []
            let v43 = [v21, ..v42]
            let v44 = [v41, ..v43]
            let v45 = erlang_term_tuple(v44)
            let v47 = atom.create("title")
            let v48 = erlang_term_coerce(v47)
            let v49 = []
            let v50 = [v20, ..v49]
            let v51 = [v48, ..v50]
            let v52 = erlang_term_tuple(v51)
            let v53 = []
            let v54 = [v31, ..v53]
            let v55 = [v38, ..v54]
            let v56 = [v45, ..v55]
            let v57 = [v52, ..v56]
            let v58 = erlang_term_coerce(v57)
            let v60 = atom.create("maps")
            let v62 = atom.create("from_list")
            let v63 = []
            let v64 = [v58, ..v63]
            let v65 = erlang_term_apply(v60, v62, v64)
            let v67 = atom.create("json")
            let v69 = atom.create("encode")
            let v70 = []
            let v71 = [v65, ..v70]
            let v72 = erlang_term_apply(v67, v69, v71)
            let v73 = "erlang"
            let v74 = atom.create(v73)
            let v76 = atom.create("iolist_to_binary")
            let v77 = []
            let v78 = [v72, ..v77]
            let v79 = erlang_term_apply(v74, v76, v78)
            let v80 = erlang_term_coerce(v79)
            let v81 = int.to_string(401)
            let v82 = { "HTTP/1.1 " } <> { v81 }
            let v83 = { v82 } <> { " " }
            let v84 = { v83 } <> { "Unauthorized" }
            let v85 = erlang_term_coerce(v80)
            let v86 = atom.create(v73)
            let v88 = atom.create("byte_size")
            let v89 = []
            let v90 = [v85, ..v89]
            let v91 = erlang_term_apply(v86, v88, v90)
            let v92 = erlang_term_coerce(v91)
            let v93 = int.to_string(v92)
            let v94 = { "\r\nContent-Length: " } <> { v93 }
            let v95 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v94 }
            let v96 = { v95 } <> { "\r\nConnection: close\r\n\r\n" }
            let v97 = { v84 } <> { v96 }
            let v98 = { v97 } <> { v80 }
            #(v98, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
        }
    }
}

pub fn reply_as_683(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: Us113) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    let v21 =
        case v19  {
            Us113Unauthenticated -> {
                ""
            }
        }
    logged_535(v13, v14, v15, v16, v17, v18, v21)
    let v22 = { "xsim serve / answered " } <> { v14 }
    let v23 = { v22 } <> { " " }
    let v24 = { v23 } <> { v15 }
    let v25 = { v24 } <> { "\n" }
    let v27 = atom.create("standard_error")
    let v28 = erlang_term_coerce(v27)
    let v29 = erlang_term_coerce(v25)
    let v31 = atom.create("io")
    let v33 = atom.create("put_chars")
    let v34 = []
    let v35 = [v29, ..v34]
    let v36 = [v28, ..v35]
    let _v37 = erlang_term_apply(v31, v33, v36)
    let v38 = v14 == "GET"
    case v38 {
        True -> {
            let v39 = answer_684(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v14, v15, v16, v17, v18, v19)
            #(v39, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
        }
        False -> change_reply_685(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v14, v15, v16, v17, v18, v19)
    }
}

pub fn signed_reply_672(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    let v21 = v19 |> string.starts_with("OAuth ")
    let v23 =
        case v21 {
            True -> oauth1_valid_673(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v14, v15, v16, v17, v18, v19)
            False -> False
        }
    case v23 {
        True -> {
            reply_as_654(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, Us111OAuth1User)
        }
        False -> {
            reply_as_683(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, Us113Unauthenticated)
        }
    }
}
