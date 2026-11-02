import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh36, type Us95, type Us96, Uh36Cons, Uh36Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us95OAuth1User, Us95UserBearer, Us96ClientBasic}
import xsim_frames/part1.{closure1, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part2.{method20}
import xsim_frames/part28.{first_value_474, logged_464}
import xsim_frames/part3.{method56, method57}
import xsim_frames/part34.{answer_581, routed_469}
import xsim_frames/part35.{new_post_585, removed_590}

pub fn post_or_delete_584(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v17 = v12 == "POST"
    let v19 =
        case v17 {
            True -> {
                let v18 = v13 == "/2/tweets"
                v18
            }
            False -> False
        }
    case v19 {
        True -> new_post_585(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
        False -> {
            let v33 = v13 == ""
            let v37 =
                case v33 {
                    True -> Uh3Nil
                    False -> {
                        let v35 = "/"
                        split_list_2(v35, v13)
                    }
                }
            let v68 =
                case v37  {
                    Uh3Cons(v38, v39) -> {
                        let v40 = "" == v38
                        case v40 {
                            True -> {
                                case v39  {
                                    Uh3Cons(v41, v42) -> {
                                        let v43 = "2" == v41
                                        case v43 {
                                            True -> {
                                                case v42  {
                                                    Uh3Cons(v44, v45) -> {
                                                        let v46 = "tweets" == v44
                                                        case v46 {
                                                            True -> {
                                                                case v45  {
                                                                    Uh3Cons(v47, v48) -> {
                                                                        case v48  {
                                                                            Uh3Nil -> {
                                                                                let v49 = v12 == "DELETE"
                                                                                case v49 {
                                                                                    True -> Us2Some(v47)
                                                                                    False -> Us2None
                                                                                }
                                                                            }
                                                                            _ -> Us2None
                                                                        }
                                                                    }
                                                                    _ -> Us2None
                                                                }
                                                            }
                                                            False -> Us2None
                                                        }
                                                    }
                                                    _ -> Us2None
                                                }
                                            }
                                            False -> Us2None
                                        }
                                    }
                                    _ -> Us2None
                                }
                            }
                            False -> Us2None
                        }
                    }
                    _ -> Us2None
                }
            case v68  {
                Us2None -> {
                    let v83 = "no route "
                    let v84 = v83 <> v13 
                    let v85 = "Not Found Error"
                    let v86 = erlang_term_coerce(v85)
                    let v87 = erlang_term_coerce(v84)
                    let v88 = "about:blank"
                    let v89 = erlang_term_coerce(v88)
                    let v90 = erlang_term_coerce(404)
                    let v91 = "status"
                    let v92 = atom.create(v91)
                    let v93 = erlang_term_coerce(v92)
                    let v94 = []
                    let v95 = [v90, ..v94]
                    let v96 = [v93, ..v95]
                    let v97 = erlang_term_tuple(v96)
                    let v98 = "type"
                    let v99 = atom.create(v98)
                    let v100 = erlang_term_coerce(v99)
                    let v101 = []
                    let v102 = [v89, ..v101]
                    let v103 = [v100, ..v102]
                    let v104 = erlang_term_tuple(v103)
                    let v105 = "detail"
                    let v106 = atom.create(v105)
                    let v107 = erlang_term_coerce(v106)
                    let v108 = []
                    let v109 = [v87, ..v108]
                    let v110 = [v107, ..v109]
                    let v111 = erlang_term_tuple(v110)
                    let v112 = "title"
                    let v113 = atom.create(v112)
                    let v114 = erlang_term_coerce(v113)
                    let v115 = []
                    let v116 = [v86, ..v115]
                    let v117 = [v114, ..v116]
                    let v118 = erlang_term_tuple(v117)
                    let v119 = []
                    let v120 = [v97, ..v119]
                    let v121 = [v104, ..v120]
                    let v122 = [v111, ..v121]
                    let v123 = [v118, ..v122]
                    let v124 = erlang_term_coerce(v123)
                    let v125 = "maps"
                    let v126 = atom.create(v125)
                    let v127 = "from_list"
                    let v128 = atom.create(v127)
                    let v129 = []
                    let v130 = [v124, ..v129]
                    let v131 = erlang_term_apply(v126, v128, v130)
                    let v132 = "json"
                    let v133 = atom.create(v132)
                    let v134 = "encode"
                    let v135 = atom.create(v134)
                    let v136 = []
                    let v137 = [v131, ..v136]
                    let v138 = erlang_term_apply(v133, v135, v137)
                    let v139 = "erlang"
                    let v140 = atom.create(v139)
                    let v141 = "iolist_to_binary"
                    let v142 = atom.create(v141)
                    let v143 = []
                    let v144 = [v138, ..v143]
                    let v145 = erlang_term_apply(v140, v142, v144)
                    let v146 = erlang_term_coerce(v145)
                    let v147 = string.inspect(404)
                    let v148 = "HTTP/1.1 "
                    let v149 = v148 <> v147 
                    let v150 = " "
                    let v151 = v149 <> v150 
                    let v152 = "Not Found"
                    let v153 = v151 <> v152 
                    let v154 = erlang_term_coerce(v146)
                    let v155 = atom.create(v139)
                    let v156 = "byte_size"
                    let v157 = atom.create(v156)
                    let v158 = []
                    let v159 = [v154, ..v158]
                    let v160 = erlang_term_apply(v155, v157, v159)
                    let v161 = erlang_term_coerce(v160)
                    let v162 = string.inspect(v161)
                    let v163 = "\r\nContent-Length: "
                    let v164 = v163 <> v162 
                    let v165 = "\r\nContent-Type: application/json; charset=utf-8"
                    let v166 = v165 <> v164 
                    let v167 = "\r\nConnection: close\r\n\r\n"
                    let v168 = v166 <> v167 
                    let v169 = v153 <> v168 
                    let v170 = v169 <> v146 
                    #(v170, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
                }
                Us2Some(v69) -> removed_590(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v69)
            }
        }
    }
}

pub fn user_write_583(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: Us95) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    case v17  {
        Us95OAuth1User -> post_or_delete_584(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
        Us95UserBearer -> post_or_delete_584(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
    }
}

pub fn change_reply_582(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: Us95) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    user_write_583(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
}

pub fn reply_as_580(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: String, v18: Us95) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v22 =
        case v18  {
            Us95OAuth1User -> {
                let v20 = "oauth1"
                v20
            }
            Us95UserBearer -> {
                let v19 = "user"
                v19
            }
        }
    logged_464(v12, v13, v14, v15, v16, v17, v22)
    let v23 = "xsim serve / answered "
    let v24 = v23 <> v13 
    let v25 = " "
    let v26 = v24 <> v25 
    let v27 = v26 <> v14 
    let v28 = "\n"
    let v29 = v27 <> v28 
    let v30 = "standard_error"
    let v31 = atom.create(v30)
    let v32 = erlang_term_coerce(v31)
    let v33 = erlang_term_coerce(v29)
    let v34 = "io"
    let v35 = atom.create(v34)
    let v36 = "put_chars"
    let v37 = atom.create(v36)
    let v38 = []
    let v39 = [v33, ..v38]
    let v40 = [v32, ..v39]
    let _v41 = erlang_term_apply(v35, v37, v40)
    let v42 = v13 == "GET"
    case v42 {
        True -> {
            let v43 = answer_581(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
            #(v43, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
        }
        False -> change_reply_582(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
    }
}

pub fn answer_593(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, _v17: Us96) -> String {
    routed_469(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
}

pub fn issued_next_596(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v12 = ""
    let v13 = erlang_term_coerce(v12)
    let v14 = "oauth2"
    let v15 = erlang_term_coerce(v14)
    let v16 = erlang_term_coerce(v13)
    let v17 = "maps"
    let v18 = atom.create(v17)
    let v19 = "get"
    let v20 = atom.create(v19)
    let v21 = []
    let v22 = [v16, ..v21]
    let v23 = [v7, ..v22]
    let v24 = [v15, ..v23]
    let v25 = erlang_term_apply(v18, v20, v24)
    let v26 = erlang_term_coerce(v25)
    let v27 = erlang_term_coerce(v12)
    let v28 = "refresh_token"
    let v29 = erlang_term_coerce(v28)
    let v30 = erlang_term_coerce(v27)
    let v31 = atom.create(v17)
    let v32 = atom.create(v19)
    let v33 = []
    let v34 = [v30, ..v33]
    let v35 = [v26, ..v34]
    let v36 = [v29, ..v35]
    let v37 = erlang_term_apply(v31, v32, v36)
    let v38 = erlang_term_coerce(v37)
    let v39 = erlang_term_coerce(v38)
    let v40 = "-"
    let v41 = v39 <> v40 
    let v42 = 0
    let v43 = method20(v8, v42)
    let v44 = string.inspect(v43)
    let v45 = v41 <> v44 
    let v46 = erlang_term_coerce(v12)
    let v47 = erlang_term_coerce(v14)
    let v48 = erlang_term_coerce(v46)
    let v49 = atom.create(v17)
    let v50 = atom.create(v19)
    let v51 = []
    let v52 = [v48, ..v51]
    let v53 = [v7, ..v52]
    let v54 = [v47, ..v53]
    let v55 = erlang_term_apply(v49, v50, v54)
    let v56 = erlang_term_coerce(v55)
    let v57 = erlang_term_coerce(v12)
    let v58 = "access_token"
    let v59 = erlang_term_coerce(v58)
    let v60 = erlang_term_coerce(v57)
    let v61 = atom.create(v17)
    let v62 = atom.create(v19)
    let v63 = []
    let v64 = [v60, ..v63]
    let v65 = [v56, ..v64]
    let v66 = [v59, ..v65]
    let v67 = erlang_term_apply(v61, v62, v66)
    let v68 = erlang_term_coerce(v67)
    let v69 = erlang_term_coerce(v68)
    let v70 = v69 <> v40 
    let v71 = 0
    let v72 = method20(v8, v71)
    let v73 = string.inspect(v72)
    let v74 = v70 <> v73 
    let v75 = "tweet.read tweet.write users.read offline.access"
    let v76 = erlang_term_coerce(v75)
    let v77 = erlang_term_coerce(v45)
    let v78 = "bearer"
    let v79 = erlang_term_coerce(v78)
    let v80 = erlang_term_coerce(7200)
    let v81 = erlang_term_coerce(v74)
    let v82 = atom.create(v28)
    let v83 = erlang_term_coerce(v82)
    let v84 = []
    let v85 = [v77, ..v84]
    let v86 = [v83, ..v85]
    let v87 = erlang_term_tuple(v86)
    let v88 = "scope"
    let v89 = atom.create(v88)
    let v90 = erlang_term_coerce(v89)
    let v91 = []
    let v92 = [v76, ..v91]
    let v93 = [v90, ..v92]
    let v94 = erlang_term_tuple(v93)
    let v95 = atom.create(v58)
    let v96 = erlang_term_coerce(v95)
    let v97 = []
    let v98 = [v81, ..v97]
    let v99 = [v96, ..v98]
    let v100 = erlang_term_tuple(v99)
    let v101 = "expires_in"
    let v102 = atom.create(v101)
    let v103 = erlang_term_coerce(v102)
    let v104 = []
    let v105 = [v80, ..v104]
    let v106 = [v103, ..v105]
    let v107 = erlang_term_tuple(v106)
    let v108 = "token_type"
    let v109 = atom.create(v108)
    let v110 = erlang_term_coerce(v109)
    let v111 = []
    let v112 = [v79, ..v111]
    let v113 = [v110, ..v112]
    let v114 = erlang_term_tuple(v113)
    let v115 = []
    let v116 = [v87, ..v115]
    let v117 = [v94, ..v116]
    let v118 = [v100, ..v117]
    let v119 = [v107, ..v118]
    let v120 = [v114, ..v119]
    let v121 = erlang_term_coerce(v120)
    let v122 = atom.create(v17)
    let v123 = "from_list"
    let v124 = atom.create(v123)
    let v125 = []
    let v126 = [v121, ..v125]
    let v127 = erlang_term_apply(v122, v124, v126)
    let v128 = "json"
    let v129 = atom.create(v128)
    let v130 = "encode"
    let v131 = atom.create(v130)
    let v132 = []
    let v133 = [v127, ..v132]
    let v134 = erlang_term_apply(v129, v131, v133)
    let v135 = "erlang"
    let v136 = atom.create(v135)
    let v137 = "iolist_to_binary"
    let v138 = atom.create(v137)
    let v139 = []
    let v140 = [v134, ..v139]
    let v141 = erlang_term_apply(v136, v138, v140)
    let v142 = erlang_term_coerce(v141)
    let v143 = string.inspect(200)
    let v144 = "HTTP/1.1 "
    let v145 = v144 <> v143 
    let v146 = " "
    let v147 = v145 <> v146 
    let v148 = "OK"
    let v149 = v147 <> v148 
    let v150 = erlang_term_coerce(v142)
    let v151 = atom.create(v135)
    let v152 = "byte_size"
    let v153 = atom.create(v152)
    let v154 = []
    let v155 = [v150, ..v154]
    let v156 = erlang_term_apply(v151, v153, v155)
    let v157 = erlang_term_coerce(v156)
    let v158 = string.inspect(v157)
    let v159 = "\r\nContent-Length: "
    let v160 = v159 <> v158 
    let v161 = "\r\nContent-Type: application/json; charset=utf-8"
    let v162 = v161 <> v160 
    let v163 = "\r\nConnection: close\r\n\r\n"
    let v164 = v162 <> v163 
    let v165 = v149 <> v164 
    let v166 = v165 <> v142 
    let v167 = Uh3Cons(v45, v8)
    #(v166, v0, v1, v2, v3, v4, v5, v6, v7, v167, v9, v10, v11)
}

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
    let v28 = "standard_error"
    let v29 = atom.create(v28)
    let v30 = erlang_term_coerce(v29)
    let v31 = erlang_term_coerce(v27)
    let v32 = "io"
    let v33 = atom.create(v32)
    let v34 = "put_chars"
    let v35 = atom.create(v34)
    let v36 = []
    let v37 = [v31, ..v36]
    let v38 = [v30, ..v37]
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
