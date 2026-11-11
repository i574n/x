import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Uh31, type Uh36, type Us109, type Us110, type Us112, Uh29Cons, Uh29Nil, Uh31Cons, Uh31Nil, Uh52Cons, Uh52Nil, Us108None, Us108Some, Us109AppBearer, Us110Elsewhere, Us110Following, Us110Lookup, Us110SearchAll, Us110Single, Us110Timeline, Us110UsersBy, Us110UsersByIds, Us111Error, Us111Ok, Us79OnX}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_slice, spiral_wrap_signed}
import xsim_frames/part12.{method300}
import xsim_frames/part15.{units_on_351}
import xsim_frames/part28.{logged_542, method549, method550, route_of_548}
import xsim_frames/part29.{following_551}
import xsim_frames/part32.{lookup_643, timeline_560, users_reply_632}
import xsim_frames/part33.{search_647, single_646}

pub fn post_reply_642(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, _v15: String, _v16: String, v17: String, _v18: String, _v19: String, v20: Us110) -> String {
    case v20  {
        Us110Lookup -> {
            let v56 = lookup_643(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v17)
            let v58 = atom.create("json")
            let v60 = atom.create("encode")
            let v61 = []
            let v62 = [v56, ..v61]
            let v63 = erlang_term_apply(v58, v60, v62)
            let v64 = "erlang"
            let v65 = atom.create(v64)
            let v67 = atom.create("iolist_to_binary")
            let v68 = []
            let v69 = [v63, ..v68]
            let v70 = erlang_term_apply(v65, v67, v69)
            let v71 = erlang_term_coerce(v70)
            let v72 = int.to_string(200)
            let v73 = { "HTTP/1.1 " } <> { v72 }
            let v74 = { v73 } <> { " " }
            let v75 = { v74 } <> { "OK" }
            let v76 = erlang_term_coerce(v71)
            let v77 = atom.create(v64)
            let v79 = atom.create("byte_size")
            let v80 = []
            let v81 = [v76, ..v80]
            let v82 = erlang_term_apply(v77, v79, v81)
            let v83 = erlang_term_coerce(v82)
            let v84 = int.to_string(v83)
            let v85 = { "\r\nContent-Length: " } <> { v84 }
            let v86 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v85 }
            let v87 = { v86 } <> { "\r\nConnection: close\r\n\r\n" }
            let v88 = { v75 } <> { v87 }
            let v89 = { v88 } <> { v71 }
            v89
        }
        Us110Single(v21) -> {
            let v22 = single_646(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v21, v17)
            let v24 = atom.create("json")
            let v26 = atom.create("encode")
            let v27 = []
            let v28 = [v22, ..v27]
            let v29 = erlang_term_apply(v24, v26, v28)
            let v30 = "erlang"
            let v31 = atom.create(v30)
            let v33 = atom.create("iolist_to_binary")
            let v34 = []
            let v35 = [v29, ..v34]
            let v36 = erlang_term_apply(v31, v33, v35)
            let v37 = erlang_term_coerce(v36)
            let v38 = int.to_string(200)
            let v39 = { "HTTP/1.1 " } <> { v38 }
            let v40 = { v39 } <> { " " }
            let v41 = { v40 } <> { "OK" }
            let v42 = erlang_term_coerce(v37)
            let v43 = atom.create(v30)
            let v45 = atom.create("byte_size")
            let v46 = []
            let v47 = [v42, ..v46]
            let v48 = erlang_term_apply(v43, v45, v47)
            let v49 = erlang_term_coerce(v48)
            let v50 = int.to_string(v49)
            let v51 = { "\r\nContent-Length: " } <> { v50 }
            let v52 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v51 }
            let v53 = { v52 } <> { "\r\nConnection: close\r\n\r\n" }
            let v54 = { v41 } <> { v53 }
            let v55 = { v54 } <> { v37 }
            v55
        }
        _ -> {
            let v90 =
                case v20  {
                    Us110SearchAll -> True
                    _ -> False
                }
            let v91 = search_647(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v90, v17)
            let v93 = atom.create("json")
            let v95 = atom.create("encode")
            let v96 = []
            let v97 = [v91, ..v96]
            let v98 = erlang_term_apply(v93, v95, v97)
            let v99 = "erlang"
            let v100 = atom.create(v99)
            let v102 = atom.create("iolist_to_binary")
            let v103 = []
            let v104 = [v98, ..v103]
            let v105 = erlang_term_apply(v100, v102, v104)
            let v106 = erlang_term_coerce(v105)
            let v107 = int.to_string(200)
            let v108 = { "HTTP/1.1 " } <> { v107 }
            let v109 = { v108 } <> { " " }
            let v110 = { v109 } <> { "OK" }
            let v111 = erlang_term_coerce(v106)
            let v112 = atom.create(v99)
            let v114 = atom.create("byte_size")
            let v115 = []
            let v116 = [v111, ..v115]
            let v117 = erlang_term_apply(v112, v114, v116)
            let v118 = erlang_term_coerce(v117)
            let v119 = int.to_string(v118)
            let v120 = { "\r\nContent-Length: " } <> { v119 }
            let v121 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v120 }
            let v122 = { v121 } <> { "\r\nConnection: close\r\n\r\n" }
            let v123 = { v110 } <> { v122 }
            let v124 = { v123 } <> { v106 }
            v124
        }
    }
}

pub fn other_reply_631(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: Us110) -> String {
    case v20  {
        Us110UsersBy -> users_reply_632(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
        Us110UsersByIds -> users_reply_632(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
        _ -> post_reply_642(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20)
    }
}

pub fn routed_547(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String) -> String {
    let v20 = route_of_548(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v16)
    case v20  {
        Us110Elsewhere -> {
            let v115 = { "no route " } <> { v16 }
            let v117 = erlang_term_coerce("Not Found Error")
            let v118 = erlang_term_coerce(v115)
            let v120 = erlang_term_coerce("about:blank")
            let v121 = erlang_term_coerce(404)
            let v123 = atom.create("status")
            let v124 = erlang_term_coerce(v123)
            let v125 = []
            let v126 = [v121, ..v125]
            let v127 = [v124, ..v126]
            let v128 = erlang_term_tuple(v127)
            let v130 = atom.create("type")
            let v131 = erlang_term_coerce(v130)
            let v132 = []
            let v133 = [v120, ..v132]
            let v134 = [v131, ..v133]
            let v135 = erlang_term_tuple(v134)
            let v137 = atom.create("detail")
            let v138 = erlang_term_coerce(v137)
            let v139 = []
            let v140 = [v118, ..v139]
            let v141 = [v138, ..v140]
            let v142 = erlang_term_tuple(v141)
            let v144 = atom.create("title")
            let v145 = erlang_term_coerce(v144)
            let v146 = []
            let v147 = [v117, ..v146]
            let v148 = [v145, ..v147]
            let v149 = erlang_term_tuple(v148)
            let v150 = []
            let v151 = [v128, ..v150]
            let v152 = [v135, ..v151]
            let v153 = [v142, ..v152]
            let v154 = [v149, ..v153]
            let v155 = erlang_term_coerce(v154)
            let v157 = atom.create("maps")
            let v159 = atom.create("from_list")
            let v160 = []
            let v161 = [v155, ..v160]
            let v162 = erlang_term_apply(v157, v159, v161)
            let v164 = atom.create("json")
            let v166 = atom.create("encode")
            let v167 = []
            let v168 = [v162, ..v167]
            let v169 = erlang_term_apply(v164, v166, v168)
            let v170 = "erlang"
            let v171 = atom.create(v170)
            let v173 = atom.create("iolist_to_binary")
            let v174 = []
            let v175 = [v169, ..v174]
            let v176 = erlang_term_apply(v171, v173, v175)
            let v177 = erlang_term_coerce(v176)
            let v178 = int.to_string(404)
            let v179 = { "HTTP/1.1 " } <> { v178 }
            let v180 = { v179 } <> { " " }
            let v181 = { v180 } <> { "Not Found" }
            let v182 = erlang_term_coerce(v177)
            let v183 = atom.create(v170)
            let v185 = atom.create("byte_size")
            let v186 = []
            let v187 = [v182, ..v186]
            let v188 = erlang_term_apply(v183, v185, v187)
            let v189 = erlang_term_coerce(v188)
            let v190 = int.to_string(v189)
            let v191 = { "\r\nContent-Length: " } <> { v190 }
            let v192 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v191 }
            let v193 = { v192 } <> { "\r\nConnection: close\r\n\r\n" }
            let v194 = { v181 } <> { v193 }
            let v195 = { v194 } <> { v177 }
            v195
        }
        Us110Following(v21) -> {
            let #(v22, v23) = following_551(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v21, v17)
            let v25 = atom.create("json")
            let v27 = atom.create("encode")
            let v28 = []
            let v29 = [v23, ..v28]
            let v30 = erlang_term_apply(v25, v27, v29)
            let v31 = "erlang"
            let v32 = atom.create(v31)
            let v34 = atom.create("iolist_to_binary")
            let v35 = []
            let v36 = [v30, ..v35]
            let v37 = erlang_term_apply(v32, v34, v36)
            let v38 = erlang_term_coerce(v37)
            let v39 = int.to_string(v22)
            let v40 = { "HTTP/1.1 " } <> { v39 }
            let v41 = { v40 } <> { " " }
            let v42 = 503 == v22
            let v47 =
                case v42 {
                    True -> {
                        Uh52Cons(503, "Service Unavailable", Uh52Nil)
                    }
                    False -> Uh52Nil
                }
            let v48 = 502 == v22
            let v51 =
                case v48 {
                    True -> {
                        Uh52Cons(502, "Bad Gateway", v47)
                    }
                    False -> v47
                }
            let v52 = 500 == v22
            let v55 =
                case v52 {
                    True -> {
                        Uh52Cons(500, "Internal Server Error", v51)
                    }
                    False -> v51
                }
            let v56 = 429 == v22
            let v59 =
                case v56 {
                    True -> {
                        Uh52Cons(429, "Too Many Requests", v55)
                    }
                    False -> v55
                }
            let v60 = 422 == v22
            let v63 =
                case v60 {
                    True -> {
                        Uh52Cons(422, "Unprocessable Entity", v59)
                    }
                    False -> v59
                }
            let v64 = 404 == v22
            let v67 =
                case v64 {
                    True -> {
                        Uh52Cons(404, "Not Found", v63)
                    }
                    False -> v63
                }
            let v68 = 403 == v22
            let v71 =
                case v68 {
                    True -> {
                        Uh52Cons(403, "Forbidden", v67)
                    }
                    False -> v67
                }
            let v72 = 402 == v22
            let v75 =
                case v72 {
                    True -> {
                        Uh52Cons(402, "Payment Required", v71)
                    }
                    False -> v71
                }
            let v76 = 401 == v22
            let v79 =
                case v76 {
                    True -> {
                        Uh52Cons(401, "Unauthorized", v75)
                    }
                    False -> v75
                }
            let v80 = 400 == v22
            let v83 =
                case v80 {
                    True -> {
                        Uh52Cons(400, "Bad Request", v79)
                    }
                    False -> v79
                }
            let v84 = 201 == v22
            let v87 =
                case v84 {
                    True -> {
                        Uh52Cons(201, "Created", v83)
                    }
                    False -> v83
                }
            let v88 = 200 == v22
            let v91 =
                case v88 {
                    True -> {
                        Uh52Cons(200, "OK", v87)
                    }
                    False -> v87
                }
            let v97 =
                case v91  {
                    Uh52Cons(v92, v93, v94) -> v93
                    Uh52Nil -> {
                        "Status"
                    }
                }
            let v98 = { v41 } <> { v97 }
            let v99 = erlang_term_coerce(v38)
            let v100 = atom.create(v31)
            let v102 = atom.create("byte_size")
            let v103 = []
            let v104 = [v99, ..v103]
            let v105 = erlang_term_apply(v100, v102, v104)
            let v106 = erlang_term_coerce(v105)
            let v107 = int.to_string(v106)
            let v108 = { "\r\nContent-Length: " } <> { v107 }
            let v109 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v108 }
            let v110 = { v109 } <> { "\r\nConnection: close\r\n\r\n" }
            let v111 = { v98 } <> { v110 }
            let v112 = { v111 } <> { v38 }
            v112
        }
        Us110Timeline(v113) -> timeline_560(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v113, v17)
        _ -> other_reply_631(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20)
    }
}

pub fn answer_546(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, _v20: Us109) -> String {
    routed_547(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
}

pub fn user_write_660(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, _v15: String, _v16: String, _v17: String, _v18: String, _v19: String, _v20: Us109) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
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

pub fn change_reply_659(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: Us109) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    user_write_660(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20)
}

pub fn reply_as_541(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: String, v21: Us109) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    let v23 =
        case v21  {
            Us109AppBearer -> {
                "app"
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
            let v41 = answer_546(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v16, v17, v18, v19, v20, v21)
            #(v41, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
        }
        False -> change_reply_659(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v16, v17, v18, v19, v20, v21)
    }
}

pub fn answer_662(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, _v20: Us112) -> String {
    routed_547(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
}

pub fn units_of_667(v0: String) -> Uh31 {
    units_on_351(Us79OnX, v0)
}

pub fn method668(v0: Uh31, v1: Int) -> Int {
    case v0  {
        Uh31Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + v3, 32)
            method668(v4, v5)
        }
        Uh31Nil -> v1
    }
}

pub fn created_post_670(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, v5: dict.Dict(String, Dynamic), v6: String, _v7: Dynamic, _v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), _v11: Int, _v12: Uh36, _v13: String, _v14: String, v15: String, v16: String, v17: String) -> Dynamic {
    let v18 = v17 == ""
    let v47 =
        case v18 {
            True -> {
                erlang_term_coerce(v15)
            }
            False -> {
                let v20 = erlang_term_coerce(v17)
                let v21 = dict.get(v5, v17)
                let v22 = method549()
                let v23 = method550()
                let v24 = case v21 { Ok(x) -> v22(x) Error(x) -> v23(x) }
                let v29 =
                    case v24  {
                        Us111Error -> Us108None
                        Us111Ok(v25) -> Us108Some(v25)
                    }
                let v33 =
                    case v29  {
                        Us108None -> panic as "dict.present: the key is not in the dict"
                        Us108Some(v30) -> v30
                    }
                let v35 = erlang_term_coerce("conversation_id")
                let v36 = erlang_term_coerce(v20)
                let v38 = atom.create("maps")
                let v40 = atom.create("get")
                let v41 = []
                let v42 = [v36, ..v41]
                let v43 = [v33, ..v42]
                let v44 = [v35, ..v43]
                let v45 = erlang_term_apply(v38, v40, v44)
                erlang_term_coerce(v45)
            }
        }
    let v79 =
        case v18 {
            True -> Uh29Nil
            False -> {
                let v50 = erlang_term_coerce("replied_to")
                let v51 = erlang_term_coerce(v17)
                let v53 = erlang_term_coerce("id")
                let v54 = erlang_term_coerce(v51)
                let v55 = []
                let v56 = [v54, ..v55]
                let v57 = [v53, ..v56]
                let v58 = erlang_term_tuple(v57)
                let v60 = erlang_term_coerce("type")
                let v61 = erlang_term_coerce(v50)
                let v62 = []
                let v63 = [v61, ..v62]
                let v64 = [v60, ..v63]
                let v65 = erlang_term_tuple(v64)
                let v66 = []
                let v67 = [v58, ..v66]
                let v68 = [v65, ..v67]
                let v69 = erlang_term_coerce(v68)
                let v71 = atom.create("maps")
                let v73 = atom.create("from_list")
                let v74 = []
                let v75 = [v69, ..v74]
                let v76 = erlang_term_apply(v71, v73, v75)
                Uh29Cons(v76, Uh29Nil)
            }
        }
    let v80 = []
    let v81 = method300(v79, v80)
    let v82 = erlang_term_coerce(v81)
    let v83 = dict.size(v10)
    let v84 = erlang_term_coerce(v6)
    let v85 = "unicode"
    let v86 = atom.create(v85)
    let v87 = "characters_to_list"
    let v88 = atom.create(v87)
    let v89 = []
    let v90 = [v84, ..v89]
    let v91 = erlang_term_apply(v86, v88, v90)
    let v92 = "calendar"
    let v93 = atom.create(v92)
    let v95 = atom.create("rfc3339_to_system_time")
    let v96 = []
    let v97 = [v91, ..v96]
    let v98 = erlang_term_apply(v93, v95, v97)
    let v99 = erlang_term_coerce(v98)
    let v100 = spiral_wrap_signed(v83, 64)
    let v101 = spiral_wrap_signed(v99 + v100, 64)
    let v102 = erlang_term_coerce(v101)
    let v104 = atom.create("offset")
    let v105 = erlang_term_coerce(v104)
    let v107 = erlang_term_coerce("Z")
    let v108 = atom.create(v85)
    let v109 = atom.create(v87)
    let v110 = []
    let v111 = [v107, ..v110]
    let v112 = erlang_term_apply(v108, v109, v111)
    let v113 = []
    let v114 = [v112, ..v113]
    let v115 = [v105, ..v114]
    let v116 = erlang_term_tuple(v115)
    let v117 = []
    let v118 = [v116, ..v117]
    let v119 = erlang_term_coerce(v118)
    let v120 = atom.create(v92)
    let v122 = atom.create("system_time_to_rfc3339")
    let v123 = []
    let v124 = [v119, ..v123]
    let v125 = [v102, ..v124]
    let v126 = erlang_term_apply(v120, v122, v125)
    let v127 = atom.create(v85)
    let v129 = atom.create("characters_to_binary")
    let v130 = []
    let v131 = [v126, ..v130]
    let v132 = erlang_term_apply(v127, v129, v131)
    let v133 = erlang_term_coerce(v132)
    let v134 = spiral_string_slice(v133, 0, 18)
    let v135 = { v134 } <> { ".000Z" }
    let v136 = erlang_term_coerce(v135)
    let v137 = erlang_term_coerce(v15)
    let v138 = erlang_term_coerce(v16)
    let v140 = erlang_term_coerce("refs")
    let v141 = erlang_term_coerce(v82)
    let v142 = []
    let v143 = [v141, ..v142]
    let v144 = [v140, ..v143]
    let v145 = erlang_term_tuple(v144)
    let v147 = erlang_term_coerce("conversation_id")
    let v148 = erlang_term_coerce(v47)
    let v149 = []
    let v150 = [v148, ..v149]
    let v151 = [v147, ..v150]
    let v152 = erlang_term_tuple(v151)
    let v154 = erlang_term_coerce("created_at")
    let v155 = erlang_term_coerce(v136)
    let v156 = []
    let v157 = [v155, ..v156]
    let v158 = [v154, ..v157]
    let v159 = erlang_term_tuple(v158)
    let v161 = erlang_term_coerce("author_id")
    let v162 = erlang_term_coerce(v9)
    let v163 = []
    let v164 = [v162, ..v163]
    let v165 = [v161, ..v164]
    let v166 = erlang_term_tuple(v165)
    let v168 = erlang_term_coerce("text")
    let v169 = erlang_term_coerce(v138)
    let v170 = []
    let v171 = [v169, ..v170]
    let v172 = [v168, ..v171]
    let v173 = erlang_term_tuple(v172)
    let v175 = erlang_term_coerce("id")
    let v176 = erlang_term_coerce(v137)
    let v177 = []
    let v178 = [v176, ..v177]
    let v179 = [v175, ..v178]
    let v180 = erlang_term_tuple(v179)
    let v181 = []
    let v182 = [v145, ..v181]
    let v183 = [v152, ..v182]
    let v184 = [v159, ..v183]
    let v185 = [v166, ..v184]
    let v186 = [v173, ..v185]
    let v187 = [v180, ..v186]
    let v188 = erlang_term_coerce(v187)
    let v190 = atom.create("maps")
    let v192 = atom.create("from_list")
    let v193 = []
    let v194 = [v188, ..v193]
    erlang_term_apply(v190, v192, v194)
}

pub fn posted_669(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    let v17 = int.to_string(v11)
    let v18 = erlang_term_coerce(v17)
    let v21 = v15 |> string.replace("&", "&amp;")
    let v24 = v21 |> string.replace("<", "&lt;")
    let v27 = v24 |> string.replace(">", "&gt;")
    let v28 = erlang_term_coerce(v27)
    let v29 = erlang_term_coerce(v17)
    let v30 = []
    let v31 = [v29, ..v30]
    let v32 = erlang_term_coerce(v31)
    let v34 = atom.create("edit_history_post_ids")
    let v35 = erlang_term_coerce(v34)
    let v36 = []
    let v37 = [v32, ..v36]
    let v38 = [v35, ..v37]
    let v39 = erlang_term_tuple(v38)
    let v41 = atom.create("text")
    let v42 = erlang_term_coerce(v41)
    let v43 = []
    let v44 = [v28, ..v43]
    let v45 = [v42, ..v44]
    let v46 = erlang_term_tuple(v45)
    let v48 = atom.create("id")
    let v49 = erlang_term_coerce(v48)
    let v50 = []
    let v51 = [v18, ..v50]
    let v52 = [v49, ..v51]
    let v53 = erlang_term_tuple(v52)
    let v54 = []
    let v55 = [v39, ..v54]
    let v56 = [v46, ..v55]
    let v57 = [v53, ..v56]
    let v58 = erlang_term_coerce(v57)
    let v59 = "maps"
    let v60 = atom.create(v59)
    let v61 = "from_list"
    let v62 = atom.create(v61)
    let v63 = []
    let v64 = [v58, ..v63]
    let v65 = erlang_term_apply(v60, v62, v64)
    let v67 = atom.create("data")
    let v68 = erlang_term_coerce(v67)
    let v69 = []
    let v70 = [v65, ..v69]
    let v71 = [v68, ..v70]
    let v72 = erlang_term_tuple(v71)
    let v73 = []
    let v74 = [v72, ..v73]
    let v75 = erlang_term_coerce(v74)
    let v76 = atom.create(v59)
    let v77 = atom.create(v61)
    let v78 = []
    let v79 = [v75, ..v78]
    let v80 = erlang_term_apply(v76, v77, v79)
    let v82 = atom.create("json")
    let v84 = atom.create("encode")
    let v85 = []
    let v86 = [v80, ..v85]
    let v87 = erlang_term_apply(v82, v84, v86)
    let v88 = "erlang"
    let v89 = atom.create(v88)
    let v91 = atom.create("iolist_to_binary")
    let v92 = []
    let v93 = [v87, ..v92]
    let v94 = erlang_term_apply(v89, v91, v93)
    let v95 = erlang_term_coerce(v94)
    let v96 = int.to_string(201)
    let v97 = { "HTTP/1.1 " } <> { v96 }
    let v98 = { v97 } <> { " " }
    let v99 = { v98 } <> { "Created" }
    let v100 = erlang_term_coerce(v95)
    let v101 = atom.create(v88)
    let v103 = atom.create("byte_size")
    let v104 = []
    let v105 = [v100, ..v104]
    let v106 = erlang_term_apply(v101, v103, v105)
    let v107 = erlang_term_coerce(v106)
    let v108 = int.to_string(v107)
    let v109 = { "\r\nContent-Length: " } <> { v108 }
    let v110 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v109 }
    let v111 = { v110 } <> { "\r\nConnection: close\r\n\r\n" }
    let v112 = { v99 } <> { v111 }
    let v113 = { v112 } <> { v95 }
    let v114 = dict.insert(v10, v17, Nil)
    let v115 = spiral_wrap_signed(v11 + 1, 32)
    let v116 = created_post_670(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v114, v115, v12, v13, v14, v17, v15, v16)
    let v117 = dict.insert(v5, v17, v116)
    #(v113, v0, v1, v2, v3, v4, v117, v6, v7, v8, v9, v114, v115, v12, v13, v14)
}
