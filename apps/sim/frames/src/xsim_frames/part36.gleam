import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh36, type Us96, type Us97, Uh36Cons, Uh36Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us92AppBearer, Us95OAuth1User, Us95UserBearer, Us96ClientBasic, Us97Unauthenticated}
import xsim_frames/part1.{closure1, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part27.{header_value_458, oauth1_signature_441, received_457, request_of_461}
import xsim_frames/part28.{first_value_474, logged_464}
import xsim_frames/part3.{method56, method57}
import xsim_frames/part34.{reply_as_463}
import xsim_frames/part35.{answer_593, issued_next_596, reply_as_580}

pub fn renewed_595(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, _v12: String, _v13: String, _v14: String, _v15: String, v16: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v17 = "\r\n\r\n"
    let v18 = option.from_result(result.map(string.split_once(v16, v17), pair.first))
    let v19 = closure1(Nil)
    let v20 = v18 |> option.map(v19)
    let v21 = Us2None
    let v22 = v20 |> option.unwrap(v21)
    let v26 =
        case v22  {
            Us2None -> -1
            Us2Some(v23) -> {
                let v24 = bit_array.byte_size(bit_array.from_string(v23))
                v24
            }
        }
    let v27 = spiral_wrap_signed(v26 + 4, 32)
    let v28 = spiral_string_length(v16)
    let v29 = spiral_wrap_signed(v28 - v27, 32)
    let v30 = spiral_wrap_signed(v27 + v29, 32)
    let v31 = spiral_wrap_signed(v30 - 1, 32)
    let v32 = spiral_string_slice(v16, v27, v31)
    let v33 = "grant_type"
    let v34 = v32 == ""
    let v38 =
        case v34 {
            True -> Uh3Nil
            False -> {
                let v36 = "&"
                split_list_2(v36, v32)
            }
        }
    let v39 = first_value_474(v33, v38)
    let v40 = v39 == ""
    let v42 =
        case v40 {
            True -> {
                let v41 = ""
                v41
            }
            False -> v39
        }
    let v43 = v42 == "refresh_token"
    let v59 =
        case v43 {
            True -> {
                let v44 = "refresh_token"
                let v48 =
                    case v34 {
                        True -> Uh3Nil
                        False -> {
                            let v46 = "&"
                            split_list_2(v46, v32)
                        }
                    }
                let v49 = first_value_474(v44, v48)
                let v50 = v49 == ""
                let v52 =
                    case v50 {
                        True -> {
                            let v51 = ""
                            v51
                        }
                        False -> v49
                    }
                let v57 =
                    case v8  {
                        Uh3Cons(v53, v54) -> v53
                        Uh3Nil -> {
                            let v55 = ""
                            v55
                        }
                    }
                let v58 = v52 == v57
                v58
            }
            False -> False
        }
    case v59 {
        True -> issued_next_596(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
        False -> {
            let v73 = "invalid_request"
            let v74 = erlang_term_coerce(v73)
            let v75 = "Value passed for the token was invalid."
            let v76 = erlang_term_coerce(v75)
            let v77 = "error_description"
            let v78 = atom.create(v77)
            let v79 = erlang_term_coerce(v78)
            let v80 = []
            let v81 = [v76, ..v80]
            let v82 = [v79, ..v81]
            let v83 = erlang_term_tuple(v82)
            let v84 = "error"
            let v85 = atom.create(v84)
            let v86 = erlang_term_coerce(v85)
            let v87 = []
            let v88 = [v74, ..v87]
            let v89 = [v86, ..v88]
            let v90 = erlang_term_tuple(v89)
            let v91 = []
            let v92 = [v83, ..v91]
            let v93 = [v90, ..v92]
            let v94 = erlang_term_coerce(v93)
            let v95 = "maps"
            let v96 = atom.create(v95)
            let v97 = "from_list"
            let v98 = atom.create(v97)
            let v99 = []
            let v100 = [v94, ..v99]
            let v101 = erlang_term_apply(v96, v98, v100)
            let v102 = "json"
            let v103 = atom.create(v102)
            let v104 = "encode"
            let v105 = atom.create(v104)
            let v106 = []
            let v107 = [v101, ..v106]
            let v108 = erlang_term_apply(v103, v105, v107)
            let v109 = "erlang"
            let v110 = atom.create(v109)
            let v111 = "iolist_to_binary"
            let v112 = atom.create(v111)
            let v113 = []
            let v114 = [v108, ..v113]
            let v115 = erlang_term_apply(v110, v112, v114)
            let v116 = erlang_term_coerce(v115)
            let v117 = string.inspect(400)
            let v118 = "HTTP/1.1 "
            let v119 = v118 <> v117 
            let v120 = " "
            let v121 = v119 <> v120 
            let v122 = "Bad Request"
            let v123 = v121 <> v122 
            let v124 = erlang_term_coerce(v116)
            let v125 = atom.create(v109)
            let v126 = "byte_size"
            let v127 = atom.create(v126)
            let v128 = []
            let v129 = [v124, ..v128]
            let v130 = erlang_term_apply(v125, v127, v129)
            let v131 = erlang_term_coerce(v130)
            let v132 = string.inspect(v131)
            let v133 = "\r\nContent-Length: "
            let v134 = v133 <> v132 
            let v135 = "\r\nContent-Type: application/json; charset=utf-8"
            let v136 = v135 <> v134 
            let v137 = "\r\nConnection: close\r\n\r\n"
            let v138 = v136 <> v137 
            let v139 = v123 <> v138 
            let v140 = v139 <> v116 
            #(v140, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
        }
    }
}

pub fn user_write_597(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, _v12: String, _v13: String, _v14: String, _v15: String, _v16: String, _v17: Us96) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v18 = "Unsupported Authentication"
    let v19 = erlang_term_coerce(v18)
    let v20 = "Authenticating with OAuth 2.0 Application-Only is forbidden for this endpoint.  "
    let v21 = "Supported authentication types are [OAuth 1.0a User Context, OAuth 2.0 User Context]."
    let v22 = v20 <> v21 
    let v23 = erlang_term_coerce(v22)
    let v24 = "https://api.x.com/2/problems/unsupported-authentication"
    let v25 = erlang_term_coerce(v24)
    let v26 = erlang_term_coerce(403)
    let v27 = "status"
    let v28 = atom.create(v27)
    let v29 = erlang_term_coerce(v28)
    let v30 = []
    let v31 = [v26, ..v30]
    let v32 = [v29, ..v31]
    let v33 = erlang_term_tuple(v32)
    let v34 = "type"
    let v35 = atom.create(v34)
    let v36 = erlang_term_coerce(v35)
    let v37 = []
    let v38 = [v25, ..v37]
    let v39 = [v36, ..v38]
    let v40 = erlang_term_tuple(v39)
    let v41 = "detail"
    let v42 = atom.create(v41)
    let v43 = erlang_term_coerce(v42)
    let v44 = []
    let v45 = [v23, ..v44]
    let v46 = [v43, ..v45]
    let v47 = erlang_term_tuple(v46)
    let v48 = "title"
    let v49 = atom.create(v48)
    let v50 = erlang_term_coerce(v49)
    let v51 = []
    let v52 = [v19, ..v51]
    let v53 = [v50, ..v52]
    let v54 = erlang_term_tuple(v53)
    let v55 = []
    let v56 = [v33, ..v55]
    let v57 = [v40, ..v56]
    let v58 = [v47, ..v57]
    let v59 = [v54, ..v58]
    let v60 = erlang_term_coerce(v59)
    let v61 = "maps"
    let v62 = atom.create(v61)
    let v63 = "from_list"
    let v64 = atom.create(v63)
    let v65 = []
    let v66 = [v60, ..v65]
    let v67 = erlang_term_apply(v62, v64, v66)
    let v68 = "json"
    let v69 = atom.create(v68)
    let v70 = "encode"
    let v71 = atom.create(v70)
    let v72 = []
    let v73 = [v67, ..v72]
    let v74 = erlang_term_apply(v69, v71, v73)
    let v75 = "erlang"
    let v76 = atom.create(v75)
    let v77 = "iolist_to_binary"
    let v78 = atom.create(v77)
    let v79 = []
    let v80 = [v74, ..v79]
    let v81 = erlang_term_apply(v76, v78, v80)
    let v82 = erlang_term_coerce(v81)
    let v83 = string.inspect(403)
    let v84 = "HTTP/1.1 "
    let v85 = v84 <> v83 
    let v86 = " "
    let v87 = v85 <> v86 
    let v88 = "Forbidden"
    let v89 = v87 <> v88 
    let v90 = erlang_term_coerce(v82)
    let v91 = atom.create(v75)
    let v92 = "byte_size"
    let v93 = atom.create(v92)
    let v94 = []
    let v95 = [v90, ..v94]
    let v96 = erlang_term_apply(v91, v93, v95)
    let v97 = erlang_term_coerce(v96)
    let v98 = string.inspect(v97)
    let v99 = "\r\nContent-Length: "
    let v100 = v99 <> v98 
    let v101 = "\r\nContent-Type: application/json; charset=utf-8"
    let v102 = v101 <> v100 
    let v103 = "\r\nConnection: close\r\n\r\n"
    let v104 = v102 <> v103 
    let v105 = v89 <> v104 
    let v106 = v105 <> v82 
    #(v106, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
}

pub fn change_reply_594(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: Us96) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    case v17  {
        Us96ClientBasic -> {
            let v18 = v12 == "POST"
            case v18 {
                True -> renewed_595(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
                False -> user_write_597(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
            }
        }
    }
}

pub fn reply_as_592(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: String, v18: Us96) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v20 =
        case v18  {
            Us96ClientBasic -> {
                let v19 = "client"
                v19
            }
        }
    logged_464(v12, v13, v14, v15, v16, v17, v20)
    let v21 = "xsim serve / answered "
    let v22 = v21 <> v13 
    let v23 = " "
    let v24 = v22 <> v23 
    let v25 = v24 <> v14 
    let v26 = "\n"
    let v27 = v25 <> v26 
    let v28 = erlang_term_coerce(v27)
    let v29 = "standard_error"
    let v30 = atom.create(v29)
    let v31 = erlang_term_coerce(v30)
    let v32 = "io"
    let v33 = atom.create(v32)
    let v34 = "put_chars"
    let v35 = atom.create(v34)
    let v36 = []
    let v37 = [v28, ..v36]
    let v38 = [v31, ..v37]
    let _v39 = erlang_term_apply(v33, v35, v38)
    let v40 = v13 == "GET"
    case v40 {
        True -> {
            let v41 = answer_593(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
            #(v41, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
        }
        False -> change_reply_594(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
    }
}

pub fn method600(v0: Uh3, v1: Uh36) -> Uh36 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method600(v3, v1)
            let v5 = spiral_string_length(v2)
            let v6 = 0
            let v7 = method56(v2, v5, v6)
            let v8 = spiral_wrap_signed(v5 - 1, 32)
            let v9 = spiral_string_slice(v2, v7, v8)
            let v10 = spiral_string_length(v9)
            let v11 = method57(v9, v10)
            let v12 = spiral_string_slice(v9, 0, v11)
            let v13 = "="
            let v14 = option.from_result(result.map(string.split_once(v12, v13), pair.first))
            let v15 = closure1(Nil)
            let v16 = v14 |> option.map(v15)
            let v17 = Us2None
            let v18 = v16 |> option.unwrap(v17)
            let v22 =
                case v18  {
                    Us2None -> -1
                    Us2Some(v19) -> {
                        let v20 = bit_array.byte_size(bit_array.from_string(v19))
                        v20
                    }
                }
            let v23 = spiral_wrap_signed(v22 + 1, 32)
            let v24 = v22 < 0
            let #(v33, v34) =
                case v24 {
                    True -> {
                        let v25 = ""
                        #(v12, v25)
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
            let v44 = "\""
            let v45 = ""
            let v46 = v34 |> string.replace(v44, v45)
            let v47 = erlang_term_coerce(v46)
            let v48 = atom.create(v36)
            let v49 = atom.create(v38)
            let v50 = []
            let v51 = [v47, ..v50]
            let v52 = erlang_term_apply(v48, v49, v51)
            let v53 = erlang_term_coerce(v52)
            Uh36Cons(v43, v53, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method601(v0: Uh36, v1: Uh36) -> Uh36 {
    case v0  {
        Uh36Cons(v2, v3, v4) -> {
            let v5 = method601(v4, v1)
            let v6 = v2 == "oauth_consumer_key"
            case v6 {
                True -> Uh36Cons(v2, v3, v5)
                False -> v5
            }
        }
        Uh36Nil -> v1
    }
}

pub fn method602(v0: Uh36, v1: Uh36) -> Uh36 {
    case v0  {
        Uh36Cons(v2, v3, v4) -> {
            let v5 = method602(v4, v1)
            let v6 = v2 == "oauth_token"
            case v6 {
                True -> Uh36Cons(v2, v3, v5)
                False -> v5
            }
        }
        Uh36Nil -> v1
    }
}

pub fn method603(v0: Uh36, v1: Uh36) -> Uh36 {
    case v0  {
        Uh36Cons(v2, v3, v4) -> {
            let v5 = method603(v4, v1)
            let v6 = v2 == "oauth_signature"
            case v6 {
                True -> Uh36Cons(v2, v3, v5)
                False -> v5
            }
        }
        Uh36Nil -> v1
    }
}

pub fn method604(v0: Uh36, v1: Uh36) -> Uh36 {
    case v0  {
        Uh36Cons(v2, v3, v4) -> {
            let v5 = method604(v4, v1)
            let v6 = v2 != "oauth_signature"
            case v6 {
                True -> Uh36Cons(v2, v3, v5)
                False -> v5
            }
        }
        Uh36Nil -> v1
    }
}

pub fn oauth1_valid_599(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, v12: String, v13: String, _v14: String, v15: String, _v16: String, v17: String) -> Bool {
    let v18 = spiral_string_length(v17)
    let v19 = spiral_wrap_signed(v18 - 6, 32)
    let v20 = spiral_wrap_signed(6 + v19, 32)
    let v21 = spiral_wrap_signed(v20 - 1, 32)
    let v22 = spiral_string_slice(v17, 6, v21)
    let v23 = v22 == ""
    let v27 =
        case v23 {
            True -> Uh3Nil
            False -> {
                let v25 = ","
                split_list_2(v25, v22)
            }
        }
    let v28 = Uh36Nil
    let v29 = method600(v27, v28)
    let v30 = Uh36Nil
    let v31 = method601(v29, v30)
    let v37 =
        case v31  {
            Uh36Cons(v32, v33, v34) -> v33
            Uh36Nil -> {
                let v35 = ""
                v35
            }
        }
    let v38 = "oauth1"
    let v39 = erlang_term_coerce(v38)
    let v40 = ""
    let v41 = erlang_term_coerce(v40)
    let v42 = "maps"
    let v43 = atom.create(v42)
    let v44 = "get"
    let v45 = atom.create(v44)
    let v46 = []
    let v47 = [v41, ..v46]
    let v48 = [v7, ..v47]
    let v49 = [v39, ..v48]
    let v50 = erlang_term_apply(v43, v45, v49)
    let v51 = "consumer_key"
    let v52 = erlang_term_coerce(v51)
    let v53 = erlang_term_coerce(v40)
    let v54 = atom.create(v42)
    let v55 = atom.create(v44)
    let v56 = []
    let v57 = [v53, ..v56]
    let v58 = [v50, ..v57]
    let v59 = [v52, ..v58]
    let v60 = erlang_term_apply(v54, v55, v59)
    let v61 = erlang_term_coerce(v60)
    let v62 = v37 == v61
    let v91 =
        case v62 {
            True -> {
                let v63 = Uh36Nil
                let v64 = method602(v29, v63)
                let v69 =
                    case v64  {
                        Uh36Cons(v65, v66, v67) -> v66
                        Uh36Nil -> v40
                    }
                let v70 = erlang_term_coerce(v38)
                let v71 = erlang_term_coerce(v40)
                let v72 = atom.create(v42)
                let v73 = atom.create(v44)
                let v74 = []
                let v75 = [v71, ..v74]
                let v76 = [v7, ..v75]
                let v77 = [v70, ..v76]
                let v78 = erlang_term_apply(v72, v73, v77)
                let v79 = "token"
                let v80 = erlang_term_coerce(v79)
                let v81 = erlang_term_coerce(v40)
                let v82 = atom.create(v42)
                let v83 = atom.create(v44)
                let v84 = []
                let v85 = [v81, ..v84]
                let v86 = [v78, ..v85]
                let v87 = [v80, ..v86]
                let v88 = erlang_term_apply(v82, v83, v87)
                let v89 = erlang_term_coerce(v88)
                let v90 = v69 == v89
                v90
            }
            False -> False
        }
    case v91 {
        True -> {
            let v92 = Uh36Nil
            let v93 = method603(v29, v92)
            let v98 =
                case v93  {
                    Uh36Cons(v94, v95, v96) -> v95
                    Uh36Nil -> v40
                }
            let v99 = erlang_term_coerce(v38)
            let v100 = erlang_term_coerce(v40)
            let v101 = atom.create(v42)
            let v102 = atom.create(v44)
            let v103 = []
            let v104 = [v100, ..v103]
            let v105 = [v7, ..v104]
            let v106 = [v99, ..v105]
            let v107 = erlang_term_apply(v101, v102, v106)
            let v108 = "consumer_secret"
            let v109 = erlang_term_coerce(v108)
            let v110 = erlang_term_coerce(v40)
            let v111 = atom.create(v42)
            let v112 = atom.create(v44)
            let v113 = []
            let v114 = [v110, ..v113]
            let v115 = [v107, ..v114]
            let v116 = [v109, ..v115]
            let v117 = erlang_term_apply(v111, v112, v116)
            let v118 = erlang_term_coerce(v117)
            let v119 = erlang_term_coerce(v38)
            let v120 = erlang_term_coerce(v40)
            let v121 = atom.create(v42)
            let v122 = atom.create(v44)
            let v123 = []
            let v124 = [v120, ..v123]
            let v125 = [v7, ..v124]
            let v126 = [v119, ..v125]
            let v127 = erlang_term_apply(v121, v122, v126)
            let v128 = "token_secret"
            let v129 = erlang_term_coerce(v128)
            let v130 = erlang_term_coerce(v40)
            let v131 = atom.create(v42)
            let v132 = atom.create(v44)
            let v133 = []
            let v134 = [v130, ..v133]
            let v135 = [v127, ..v134]
            let v136 = [v129, ..v135]
            let v137 = erlang_term_apply(v131, v132, v136)
            let v138 = erlang_term_coerce(v137)
            let v139 = "host"
            let v140 = header_value_458(v139, v15)
            let v141 = "http://"
            let v142 = v141 <> v140 
            let v143 = v142 <> v13 
            let v144 = Uh36Nil
            let v145 = method604(v29, v144)
            let v146 = oauth1_signature_441(v12, v143, v145, v118, v138)
            let v147 = v98 == v146
            v147
        }
        False -> False
    }
}

pub fn answer_606(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, _v12: String, _v13: String, _v14: String, _v15: String, _v16: String, v17: Us97) -> String {
    case v17  {
        Us97Unauthenticated -> {
            let v18 = "Unauthorized"
            let v19 = erlang_term_coerce(v18)
            let v20 = erlang_term_coerce(v18)
            let v21 = "about:blank"
            let v22 = erlang_term_coerce(v21)
            let v23 = erlang_term_coerce(401)
            let v24 = "status"
            let v25 = atom.create(v24)
            let v26 = erlang_term_coerce(v25)
            let v27 = []
            let v28 = [v23, ..v27]
            let v29 = [v26, ..v28]
            let v30 = erlang_term_tuple(v29)
            let v31 = "type"
            let v32 = atom.create(v31)
            let v33 = erlang_term_coerce(v32)
            let v34 = []
            let v35 = [v22, ..v34]
            let v36 = [v33, ..v35]
            let v37 = erlang_term_tuple(v36)
            let v38 = "detail"
            let v39 = atom.create(v38)
            let v40 = erlang_term_coerce(v39)
            let v41 = []
            let v42 = [v20, ..v41]
            let v43 = [v40, ..v42]
            let v44 = erlang_term_tuple(v43)
            let v45 = "title"
            let v46 = atom.create(v45)
            let v47 = erlang_term_coerce(v46)
            let v48 = []
            let v49 = [v19, ..v48]
            let v50 = [v47, ..v49]
            let v51 = erlang_term_tuple(v50)
            let v52 = []
            let v53 = [v30, ..v52]
            let v54 = [v37, ..v53]
            let v55 = [v44, ..v54]
            let v56 = [v51, ..v55]
            let v57 = erlang_term_coerce(v56)
            let v58 = "maps"
            let v59 = atom.create(v58)
            let v60 = "from_list"
            let v61 = atom.create(v60)
            let v62 = []
            let v63 = [v57, ..v62]
            let v64 = erlang_term_apply(v59, v61, v63)
            let v65 = "json"
            let v66 = atom.create(v65)
            let v67 = "encode"
            let v68 = atom.create(v67)
            let v69 = []
            let v70 = [v64, ..v69]
            let v71 = erlang_term_apply(v66, v68, v70)
            let v72 = "erlang"
            let v73 = atom.create(v72)
            let v74 = "iolist_to_binary"
            let v75 = atom.create(v74)
            let v76 = []
            let v77 = [v71, ..v76]
            let v78 = erlang_term_apply(v73, v75, v77)
            let v79 = erlang_term_coerce(v78)
            let v80 = string.inspect(401)
            let v81 = "HTTP/1.1 "
            let v82 = v81 <> v80 
            let v83 = " "
            let v84 = v82 <> v83 
            let v85 = v84 <> v18 
            let v86 = erlang_term_coerce(v79)
            let v87 = atom.create(v72)
            let v88 = "byte_size"
            let v89 = atom.create(v88)
            let v90 = []
            let v91 = [v86, ..v90]
            let v92 = erlang_term_apply(v87, v89, v91)
            let v93 = erlang_term_coerce(v92)
            let v94 = string.inspect(v93)
            let v95 = "\r\nContent-Length: "
            let v96 = v95 <> v94 
            let v97 = "\r\nContent-Type: application/json; charset=utf-8"
            let v98 = v97 <> v96 
            let v99 = "\r\nConnection: close\r\n\r\n"
            let v100 = v98 <> v99 
            let v101 = v85 <> v100 
            let v102 = v101 <> v79 
            v102
        }
    }
}

pub fn change_reply_607(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, _v12: String, _v13: String, _v14: String, _v15: String, _v16: String, v17: Us97) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    case v17  {
        Us97Unauthenticated -> {
            let v18 = "Unauthorized"
            let v19 = erlang_term_coerce(v18)
            let v20 = erlang_term_coerce(v18)
            let v21 = "about:blank"
            let v22 = erlang_term_coerce(v21)
            let v23 = erlang_term_coerce(401)
            let v24 = "status"
            let v25 = atom.create(v24)
            let v26 = erlang_term_coerce(v25)
            let v27 = []
            let v28 = [v23, ..v27]
            let v29 = [v26, ..v28]
            let v30 = erlang_term_tuple(v29)
            let v31 = "type"
            let v32 = atom.create(v31)
            let v33 = erlang_term_coerce(v32)
            let v34 = []
            let v35 = [v22, ..v34]
            let v36 = [v33, ..v35]
            let v37 = erlang_term_tuple(v36)
            let v38 = "detail"
            let v39 = atom.create(v38)
            let v40 = erlang_term_coerce(v39)
            let v41 = []
            let v42 = [v20, ..v41]
            let v43 = [v40, ..v42]
            let v44 = erlang_term_tuple(v43)
            let v45 = "title"
            let v46 = atom.create(v45)
            let v47 = erlang_term_coerce(v46)
            let v48 = []
            let v49 = [v19, ..v48]
            let v50 = [v47, ..v49]
            let v51 = erlang_term_tuple(v50)
            let v52 = []
            let v53 = [v30, ..v52]
            let v54 = [v37, ..v53]
            let v55 = [v44, ..v54]
            let v56 = [v51, ..v55]
            let v57 = erlang_term_coerce(v56)
            let v58 = "maps"
            let v59 = atom.create(v58)
            let v60 = "from_list"
            let v61 = atom.create(v60)
            let v62 = []
            let v63 = [v57, ..v62]
            let v64 = erlang_term_apply(v59, v61, v63)
            let v65 = "json"
            let v66 = atom.create(v65)
            let v67 = "encode"
            let v68 = atom.create(v67)
            let v69 = []
            let v70 = [v64, ..v69]
            let v71 = erlang_term_apply(v66, v68, v70)
            let v72 = "erlang"
            let v73 = atom.create(v72)
            let v74 = "iolist_to_binary"
            let v75 = atom.create(v74)
            let v76 = []
            let v77 = [v71, ..v76]
            let v78 = erlang_term_apply(v73, v75, v77)
            let v79 = erlang_term_coerce(v78)
            let v80 = string.inspect(401)
            let v81 = "HTTP/1.1 "
            let v82 = v81 <> v80 
            let v83 = " "
            let v84 = v82 <> v83 
            let v85 = v84 <> v18 
            let v86 = erlang_term_coerce(v79)
            let v87 = atom.create(v72)
            let v88 = "byte_size"
            let v89 = atom.create(v88)
            let v90 = []
            let v91 = [v86, ..v90]
            let v92 = erlang_term_apply(v87, v89, v91)
            let v93 = erlang_term_coerce(v92)
            let v94 = string.inspect(v93)
            let v95 = "\r\nContent-Length: "
            let v96 = v95 <> v94 
            let v97 = "\r\nContent-Type: application/json; charset=utf-8"
            let v98 = v97 <> v96 
            let v99 = "\r\nConnection: close\r\n\r\n"
            let v100 = v98 <> v99 
            let v101 = v85 <> v100 
            let v102 = v101 <> v79 
            #(v102, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
        }
    }
}

pub fn reply_as_605(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: String, v18: Us97) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v20 =
        case v18  {
            Us97Unauthenticated -> {
                let v19 = ""
                v19
            }
        }
    logged_464(v12, v13, v14, v15, v16, v17, v20)
    let v21 = "xsim serve / answered "
    let v22 = v21 <> v13 
    let v23 = " "
    let v24 = v22 <> v23 
    let v25 = v24 <> v14 
    let v26 = "\n"
    let v27 = v25 <> v26 
    let v28 = erlang_term_coerce(v27)
    let v29 = "standard_error"
    let v30 = atom.create(v29)
    let v31 = erlang_term_coerce(v30)
    let v32 = "io"
    let v33 = atom.create(v32)
    let v34 = "put_chars"
    let v35 = atom.create(v34)
    let v36 = []
    let v37 = [v28, ..v36]
    let v38 = [v31, ..v37]
    let _v39 = erlang_term_apply(v33, v35, v38)
    let v40 = v13 == "GET"
    case v40 {
        True -> {
            let v41 = answer_606(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
            #(v41, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
        }
        False -> change_reply_607(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
    }
}

pub fn signed_reply_598(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v19 = "OAuth "
    let v20 = v18 |> string.starts_with(v19)
    let v22 =
        case v20 {
            True -> oauth1_valid_599(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
            False -> False
        }
    case v22 {
        True -> {
            let v23 = Us95OAuth1User
            reply_as_580(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v23)
        }
        False -> {
            let v37 = Us97Unauthenticated
            reply_as_605(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v37)
        }
    }
}

pub fn keyed_reply_591(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v19 = "oauth2"
    let v20 = erlang_term_coerce(v19)
    let v21 = ""
    let v22 = erlang_term_coerce(v21)
    let v23 = "maps"
    let v24 = atom.create(v23)
    let v25 = "get"
    let v26 = atom.create(v25)
    let v27 = []
    let v28 = [v22, ..v27]
    let v29 = [v7, ..v28]
    let v30 = [v20, ..v29]
    let v31 = erlang_term_apply(v24, v26, v30)
    let v32 = "client_id"
    let v33 = erlang_term_coerce(v32)
    let v34 = erlang_term_coerce(v21)
    let v35 = atom.create(v23)
    let v36 = atom.create(v25)
    let v37 = []
    let v38 = [v34, ..v37]
    let v39 = [v31, ..v38]
    let v40 = [v33, ..v39]
    let v41 = erlang_term_apply(v35, v36, v40)
    let v42 = erlang_term_coerce(v41)
    let v43 = ":"
    let v44 = v42 <> v43 
    let v45 = "client_secret"
    let v46 = erlang_term_coerce(v45)
    let v47 = erlang_term_coerce(v21)
    let v48 = atom.create(v23)
    let v49 = atom.create(v25)
    let v50 = []
    let v51 = [v47, ..v50]
    let v52 = [v31, ..v51]
    let v53 = [v46, ..v52]
    let v54 = erlang_term_apply(v48, v49, v53)
    let v55 = erlang_term_coerce(v54)
    let v56 = v44 <> v55 
    let v57 = erlang_term_coerce(v56)
    let v58 = "base64"
    let v59 = atom.create(v58)
    let v60 = "encode"
    let v61 = atom.create(v60)
    let v62 = []
    let v63 = [v57, ..v62]
    let v64 = erlang_term_apply(v59, v61, v63)
    let v65 = erlang_term_coerce(v64)
    let v66 = "Basic "
    let v67 = v66 <> v65 
    let v68 = v18 == v67
    let v70 =
        case v68 {
            True -> {
                let v69 = v14 == "/2/oauth2/token"
                v69
            }
            False -> False
        }
    case v70 {
        True -> {
            let v71 = Us96ClientBasic
            reply_as_592(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v71)
        }
        False -> signed_reply_598(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
    }
}

pub fn bearer_reply_462(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v19 = "Bearer "
    let v20 = v19 <> v0 
    let v21 = v18 == v20
    case v21 {
        True -> {
            let v22 = Us92AppBearer
            reply_as_463(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v22)
        }
        False -> {
            let v36 = v19 <> v1 
            let v37 = v18 == v36
            case v37 {
                True -> {
                    let v38 = Us95UserBearer
                    reply_as_580(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v38)
                }
                False -> keyed_reply_591(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
            }
        }
    }
}

pub fn replied_460(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let #(v14, v15, v16, v17, v18) = request_of_461(v13)
    let v19 = "authorization"
    let v20 = header_value_458(v19, v17)
    bearer_reply_462(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v14, v15, v16, v17, v18, v20)
}

pub fn handled_456(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: Dynamic) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v14 = ""
    let v15 = received_457(v13, v14)
    let #(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28) = replied_460(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v15)
    let v29 = erlang_term_coerce(v16)
    let v30 = "gen_tcp"
    let v31 = atom.create(v30)
    let v32 = "send"
    let v33 = atom.create(v32)
    let v34 = []
    let v35 = [v29, ..v34]
    let v36 = [v13, ..v35]
    let _v37 = erlang_term_apply(v31, v33, v36)
    let v38 = atom.create(v30)
    let v39 = "close"
    let v40 = atom.create(v39)
    let v41 = []
    let v42 = [v13, ..v41]
    let _v43 = erlang_term_apply(v38, v40, v42)
    #(v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28)
}
