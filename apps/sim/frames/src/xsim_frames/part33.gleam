import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Uh32, type Uh37, type Us107, type Us108, type Us111, Uh30Cons, Uh30Nil, Uh32Cons, Uh32Nil, Uh52Cons, Uh52Nil, Us107AppBearer, Us108Elsewhere, Us108Following, Us108Lookup, Us108SearchAll, Us108Single, Us108Timeline, Us108UsersBy, Us108UsersByIds, Us109Error, Us109Ok, Us110None, Us110Some, Us79OnX}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_slice, spiral_wrap_signed}
import xsim_frames/part12.{method302}
import xsim_frames/part15.{units_on_353}
import xsim_frames/part27.{logged_535, method542, method543, route_of_541}
import xsim_frames/part28.{following_544}
import xsim_frames/part31.{lookup_636, timeline_553, users_reply_625}
import xsim_frames/part32.{search_640, single_639}

pub fn post_reply_635(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, _v13: String, _v14: String, v15: String, _v16: String, _v17: String, v18: Us108) -> String {
    case v18  {
        Us108Lookup -> {
            let v54 = lookup_636(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v15)
            let v56 = atom.create("json")
            let v58 = atom.create("encode")
            let v59 = []
            let v60 = [v54, ..v59]
            let v61 = erlang_term_apply(v56, v58, v60)
            let v62 = "erlang"
            let v63 = atom.create(v62)
            let v65 = atom.create("iolist_to_binary")
            let v66 = []
            let v67 = [v61, ..v66]
            let v68 = erlang_term_apply(v63, v65, v67)
            let v69 = erlang_term_coerce(v68)
            let v70 = int.to_string(200)
            let v71 = { "HTTP/1.1 " } <> { v70 }
            let v72 = { v71 } <> { " " }
            let v73 = { v72 } <> { "OK" }
            let v74 = erlang_term_coerce(v69)
            let v75 = atom.create(v62)
            let v77 = atom.create("byte_size")
            let v78 = []
            let v79 = [v74, ..v78]
            let v80 = erlang_term_apply(v75, v77, v79)
            let v81 = erlang_term_coerce(v80)
            let v82 = int.to_string(v81)
            let v83 = { "\r\nContent-Length: " } <> { v82 }
            let v84 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v83 }
            let v85 = { v84 } <> { "\r\nConnection: close\r\n\r\n" }
            let v86 = { v73 } <> { v85 }
            let v87 = { v86 } <> { v69 }
            v87
        }
        Us108Single(v19) -> {
            let v20 = single_639(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v19, v15)
            let v22 = atom.create("json")
            let v24 = atom.create("encode")
            let v25 = []
            let v26 = [v20, ..v25]
            let v27 = erlang_term_apply(v22, v24, v26)
            let v28 = "erlang"
            let v29 = atom.create(v28)
            let v31 = atom.create("iolist_to_binary")
            let v32 = []
            let v33 = [v27, ..v32]
            let v34 = erlang_term_apply(v29, v31, v33)
            let v35 = erlang_term_coerce(v34)
            let v36 = int.to_string(200)
            let v37 = { "HTTP/1.1 " } <> { v36 }
            let v38 = { v37 } <> { " " }
            let v39 = { v38 } <> { "OK" }
            let v40 = erlang_term_coerce(v35)
            let v41 = atom.create(v28)
            let v43 = atom.create("byte_size")
            let v44 = []
            let v45 = [v40, ..v44]
            let v46 = erlang_term_apply(v41, v43, v45)
            let v47 = erlang_term_coerce(v46)
            let v48 = int.to_string(v47)
            let v49 = { "\r\nContent-Length: " } <> { v48 }
            let v50 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v49 }
            let v51 = { v50 } <> { "\r\nConnection: close\r\n\r\n" }
            let v52 = { v39 } <> { v51 }
            let v53 = { v52 } <> { v35 }
            v53
        }
        _ -> {
            let v88 =
                case v18  {
                    Us108SearchAll -> True
                    _ -> False
                }
            let v89 = search_640(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v88, v15)
            let v91 = atom.create("json")
            let v93 = atom.create("encode")
            let v94 = []
            let v95 = [v89, ..v94]
            let v96 = erlang_term_apply(v91, v93, v95)
            let v97 = "erlang"
            let v98 = atom.create(v97)
            let v100 = atom.create("iolist_to_binary")
            let v101 = []
            let v102 = [v96, ..v101]
            let v103 = erlang_term_apply(v98, v100, v102)
            let v104 = erlang_term_coerce(v103)
            let v105 = int.to_string(200)
            let v106 = { "HTTP/1.1 " } <> { v105 }
            let v107 = { v106 } <> { " " }
            let v108 = { v107 } <> { "OK" }
            let v109 = erlang_term_coerce(v104)
            let v110 = atom.create(v97)
            let v112 = atom.create("byte_size")
            let v113 = []
            let v114 = [v109, ..v113]
            let v115 = erlang_term_apply(v110, v112, v114)
            let v116 = erlang_term_coerce(v115)
            let v117 = int.to_string(v116)
            let v118 = { "\r\nContent-Length: " } <> { v117 }
            let v119 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v118 }
            let v120 = { v119 } <> { "\r\nConnection: close\r\n\r\n" }
            let v121 = { v108 } <> { v120 }
            let v122 = { v121 } <> { v104 }
            v122
        }
    }
}

pub fn other_reply_624(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String, v15: String, v16: String, v17: String, v18: Us108) -> String {
    case v18  {
        Us108UsersBy -> users_reply_625(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
        Us108UsersByIds -> users_reply_625(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
        _ -> post_reply_635(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
    }
}

pub fn routed_540(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String, v15: String, v16: String, v17: String) -> String {
    let v18 = route_of_541(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v14)
    case v18  {
        Us108Elsewhere -> {
            let v113 = { "no route " } <> { v14 }
            let v115 = erlang_term_coerce("Not Found Error")
            let v116 = erlang_term_coerce(v113)
            let v118 = erlang_term_coerce("about:blank")
            let v119 = erlang_term_coerce(404)
            let v121 = atom.create("status")
            let v122 = erlang_term_coerce(v121)
            let v123 = []
            let v124 = [v119, ..v123]
            let v125 = [v122, ..v124]
            let v126 = erlang_term_tuple(v125)
            let v128 = atom.create("type")
            let v129 = erlang_term_coerce(v128)
            let v130 = []
            let v131 = [v118, ..v130]
            let v132 = [v129, ..v131]
            let v133 = erlang_term_tuple(v132)
            let v135 = atom.create("detail")
            let v136 = erlang_term_coerce(v135)
            let v137 = []
            let v138 = [v116, ..v137]
            let v139 = [v136, ..v138]
            let v140 = erlang_term_tuple(v139)
            let v142 = atom.create("title")
            let v143 = erlang_term_coerce(v142)
            let v144 = []
            let v145 = [v115, ..v144]
            let v146 = [v143, ..v145]
            let v147 = erlang_term_tuple(v146)
            let v148 = []
            let v149 = [v126, ..v148]
            let v150 = [v133, ..v149]
            let v151 = [v140, ..v150]
            let v152 = [v147, ..v151]
            let v153 = erlang_term_coerce(v152)
            let v155 = atom.create("maps")
            let v157 = atom.create("from_list")
            let v158 = []
            let v159 = [v153, ..v158]
            let v160 = erlang_term_apply(v155, v157, v159)
            let v162 = atom.create("json")
            let v164 = atom.create("encode")
            let v165 = []
            let v166 = [v160, ..v165]
            let v167 = erlang_term_apply(v162, v164, v166)
            let v168 = "erlang"
            let v169 = atom.create(v168)
            let v171 = atom.create("iolist_to_binary")
            let v172 = []
            let v173 = [v167, ..v172]
            let v174 = erlang_term_apply(v169, v171, v173)
            let v175 = erlang_term_coerce(v174)
            let v176 = int.to_string(404)
            let v177 = { "HTTP/1.1 " } <> { v176 }
            let v178 = { v177 } <> { " " }
            let v179 = { v178 } <> { "Not Found" }
            let v180 = erlang_term_coerce(v175)
            let v181 = atom.create(v168)
            let v183 = atom.create("byte_size")
            let v184 = []
            let v185 = [v180, ..v184]
            let v186 = erlang_term_apply(v181, v183, v185)
            let v187 = erlang_term_coerce(v186)
            let v188 = int.to_string(v187)
            let v189 = { "\r\nContent-Length: " } <> { v188 }
            let v190 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v189 }
            let v191 = { v190 } <> { "\r\nConnection: close\r\n\r\n" }
            let v192 = { v179 } <> { v191 }
            let v193 = { v192 } <> { v175 }
            v193
        }
        Us108Following(v19) -> {
            let #(v20, v21) = following_544(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v19, v15)
            let v23 = atom.create("json")
            let v25 = atom.create("encode")
            let v26 = []
            let v27 = [v21, ..v26]
            let v28 = erlang_term_apply(v23, v25, v27)
            let v29 = "erlang"
            let v30 = atom.create(v29)
            let v32 = atom.create("iolist_to_binary")
            let v33 = []
            let v34 = [v28, ..v33]
            let v35 = erlang_term_apply(v30, v32, v34)
            let v36 = erlang_term_coerce(v35)
            let v37 = int.to_string(v20)
            let v38 = { "HTTP/1.1 " } <> { v37 }
            let v39 = { v38 } <> { " " }
            let v40 = 503 == v20
            let v45 =
                case v40 {
                    True -> {
                        Uh52Cons(503, "Service Unavailable", Uh52Nil)
                    }
                    False -> Uh52Nil
                }
            let v46 = 502 == v20
            let v49 =
                case v46 {
                    True -> {
                        Uh52Cons(502, "Bad Gateway", v45)
                    }
                    False -> v45
                }
            let v50 = 500 == v20
            let v53 =
                case v50 {
                    True -> {
                        Uh52Cons(500, "Internal Server Error", v49)
                    }
                    False -> v49
                }
            let v54 = 429 == v20
            let v57 =
                case v54 {
                    True -> {
                        Uh52Cons(429, "Too Many Requests", v53)
                    }
                    False -> v53
                }
            let v58 = 422 == v20
            let v61 =
                case v58 {
                    True -> {
                        Uh52Cons(422, "Unprocessable Entity", v57)
                    }
                    False -> v57
                }
            let v62 = 404 == v20
            let v65 =
                case v62 {
                    True -> {
                        Uh52Cons(404, "Not Found", v61)
                    }
                    False -> v61
                }
            let v66 = 403 == v20
            let v69 =
                case v66 {
                    True -> {
                        Uh52Cons(403, "Forbidden", v65)
                    }
                    False -> v65
                }
            let v70 = 402 == v20
            let v73 =
                case v70 {
                    True -> {
                        Uh52Cons(402, "Payment Required", v69)
                    }
                    False -> v69
                }
            let v74 = 401 == v20
            let v77 =
                case v74 {
                    True -> {
                        Uh52Cons(401, "Unauthorized", v73)
                    }
                    False -> v73
                }
            let v78 = 400 == v20
            let v81 =
                case v78 {
                    True -> {
                        Uh52Cons(400, "Bad Request", v77)
                    }
                    False -> v77
                }
            let v82 = 201 == v20
            let v85 =
                case v82 {
                    True -> {
                        Uh52Cons(201, "Created", v81)
                    }
                    False -> v81
                }
            let v86 = 200 == v20
            let v89 =
                case v86 {
                    True -> {
                        Uh52Cons(200, "OK", v85)
                    }
                    False -> v85
                }
            let v95 =
                case v89  {
                    Uh52Cons(v90, v91, v92) -> v91
                    Uh52Nil -> {
                        "Status"
                    }
                }
            let v96 = { v39 } <> { v95 }
            let v97 = erlang_term_coerce(v36)
            let v98 = atom.create(v29)
            let v100 = atom.create("byte_size")
            let v101 = []
            let v102 = [v97, ..v101]
            let v103 = erlang_term_apply(v98, v100, v102)
            let v104 = erlang_term_coerce(v103)
            let v105 = int.to_string(v104)
            let v106 = { "\r\nContent-Length: " } <> { v105 }
            let v107 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v106 }
            let v108 = { v107 } <> { "\r\nConnection: close\r\n\r\n" }
            let v109 = { v96 } <> { v108 }
            let v110 = { v109 } <> { v36 }
            v110
        }
        Us108Timeline(v111) -> timeline_553(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v111, v15)
        _ -> other_reply_624(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
    }
}

pub fn answer_539(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String, v15: String, v16: String, v17: String, _v18: Us107) -> String {
    routed_540(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
}

pub fn user_write_653(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, _v13: String, _v14: String, _v15: String, _v16: String, _v17: String, _v18: Us107) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
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

pub fn change_reply_652(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String, v15: String, v16: String, v17: String, v18: Us107) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    user_write_653(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
}

pub fn reply_as_534(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: Us107) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    let v21 =
        case v19  {
            Us107AppBearer -> {
                "app"
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
            let v39 = answer_539(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v14, v15, v16, v17, v18, v19)
            #(v39, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
        }
        False -> change_reply_652(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v14, v15, v16, v17, v18, v19)
    }
}

pub fn answer_655(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String, v15: String, v16: String, v17: String, _v18: Us111) -> String {
    routed_540(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
}

pub fn units_of_660(v0: String) -> Uh32 {
    units_on_353(Us79OnX, v0)
}

pub fn method661(v0: Uh32, v1: Int) -> Int {
    case v0  {
        Uh32Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + v3, 32)
            method661(v4, v5)
        }
        Uh32Nil -> v1
    }
}

pub fn created_post_663(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, v5: dict.Dict(String, Dynamic), v6: String, _v7: Dynamic, _v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), _v11: Int, _v12: Uh37, v13: String, v14: String, v15: String) -> Dynamic {
    let v16 = v15 == ""
    let v45 =
        case v16 {
            True -> {
                erlang_term_coerce(v13)
            }
            False -> {
                let v18 = erlang_term_coerce(v15)
                let v19 = dict.get(v5, v15)
                let v20 = method542()
                let v21 = method543()
                let v22 = case v19 { Ok(x) -> v20(x) Error(x) -> v21(x) }
                let v27 =
                    case v22  {
                        Us109Error -> Us110None
                        Us109Ok(v23) -> Us110Some(v23)
                    }
                let v31 =
                    case v27  {
                        Us110None -> panic as "dict.present: the key is not in the dict"
                        Us110Some(v28) -> v28
                    }
                let v33 = erlang_term_coerce("conversation_id")
                let v34 = erlang_term_coerce(v18)
                let v36 = atom.create("maps")
                let v38 = atom.create("get")
                let v39 = []
                let v40 = [v34, ..v39]
                let v41 = [v31, ..v40]
                let v42 = [v33, ..v41]
                let v43 = erlang_term_apply(v36, v38, v42)
                erlang_term_coerce(v43)
            }
        }
    let v77 =
        case v16 {
            True -> Uh30Nil
            False -> {
                let v48 = erlang_term_coerce("replied_to")
                let v49 = erlang_term_coerce(v15)
                let v51 = erlang_term_coerce("id")
                let v52 = erlang_term_coerce(v49)
                let v53 = []
                let v54 = [v52, ..v53]
                let v55 = [v51, ..v54]
                let v56 = erlang_term_tuple(v55)
                let v58 = erlang_term_coerce("type")
                let v59 = erlang_term_coerce(v48)
                let v60 = []
                let v61 = [v59, ..v60]
                let v62 = [v58, ..v61]
                let v63 = erlang_term_tuple(v62)
                let v64 = []
                let v65 = [v56, ..v64]
                let v66 = [v63, ..v65]
                let v67 = erlang_term_coerce(v66)
                let v69 = atom.create("maps")
                let v71 = atom.create("from_list")
                let v72 = []
                let v73 = [v67, ..v72]
                let v74 = erlang_term_apply(v69, v71, v73)
                Uh30Cons(v74, Uh30Nil)
            }
        }
    let v78 = []
    let v79 = method302(v77, v78)
    let v80 = erlang_term_coerce(v79)
    let v81 = dict.size(v10)
    let v82 = erlang_term_coerce(v6)
    let v83 = "unicode"
    let v84 = atom.create(v83)
    let v85 = "characters_to_list"
    let v86 = atom.create(v85)
    let v87 = []
    let v88 = [v82, ..v87]
    let v89 = erlang_term_apply(v84, v86, v88)
    let v90 = "calendar"
    let v91 = atom.create(v90)
    let v93 = atom.create("rfc3339_to_system_time")
    let v94 = []
    let v95 = [v89, ..v94]
    let v96 = erlang_term_apply(v91, v93, v95)
    let v97 = erlang_term_coerce(v96)
    let v98 = spiral_wrap_signed(v81, 64)
    let v99 = spiral_wrap_signed(v97 + v98, 64)
    let v100 = erlang_term_coerce(v99)
    let v102 = atom.create("offset")
    let v103 = erlang_term_coerce(v102)
    let v105 = erlang_term_coerce("Z")
    let v106 = atom.create(v83)
    let v107 = atom.create(v85)
    let v108 = []
    let v109 = [v105, ..v108]
    let v110 = erlang_term_apply(v106, v107, v109)
    let v111 = []
    let v112 = [v110, ..v111]
    let v113 = [v103, ..v112]
    let v114 = erlang_term_tuple(v113)
    let v115 = []
    let v116 = [v114, ..v115]
    let v117 = erlang_term_coerce(v116)
    let v118 = atom.create(v90)
    let v120 = atom.create("system_time_to_rfc3339")
    let v121 = []
    let v122 = [v117, ..v121]
    let v123 = [v100, ..v122]
    let v124 = erlang_term_apply(v118, v120, v123)
    let v125 = atom.create(v83)
    let v127 = atom.create("characters_to_binary")
    let v128 = []
    let v129 = [v124, ..v128]
    let v130 = erlang_term_apply(v125, v127, v129)
    let v131 = erlang_term_coerce(v130)
    let v132 = spiral_string_slice(v131, 0, 18)
    let v133 = { v132 } <> { ".000Z" }
    let v134 = erlang_term_coerce(v133)
    let v135 = erlang_term_coerce(v13)
    let v136 = erlang_term_coerce(v14)
    let v138 = erlang_term_coerce("refs")
    let v139 = erlang_term_coerce(v80)
    let v140 = []
    let v141 = [v139, ..v140]
    let v142 = [v138, ..v141]
    let v143 = erlang_term_tuple(v142)
    let v145 = erlang_term_coerce("conversation_id")
    let v146 = erlang_term_coerce(v45)
    let v147 = []
    let v148 = [v146, ..v147]
    let v149 = [v145, ..v148]
    let v150 = erlang_term_tuple(v149)
    let v152 = erlang_term_coerce("created_at")
    let v153 = erlang_term_coerce(v134)
    let v154 = []
    let v155 = [v153, ..v154]
    let v156 = [v152, ..v155]
    let v157 = erlang_term_tuple(v156)
    let v159 = erlang_term_coerce("author_id")
    let v160 = erlang_term_coerce(v9)
    let v161 = []
    let v162 = [v160, ..v161]
    let v163 = [v159, ..v162]
    let v164 = erlang_term_tuple(v163)
    let v166 = erlang_term_coerce("text")
    let v167 = erlang_term_coerce(v136)
    let v168 = []
    let v169 = [v167, ..v168]
    let v170 = [v166, ..v169]
    let v171 = erlang_term_tuple(v170)
    let v173 = erlang_term_coerce("id")
    let v174 = erlang_term_coerce(v135)
    let v175 = []
    let v176 = [v174, ..v175]
    let v177 = [v173, ..v176]
    let v178 = erlang_term_tuple(v177)
    let v179 = []
    let v180 = [v143, ..v179]
    let v181 = [v150, ..v180]
    let v182 = [v157, ..v181]
    let v183 = [v164, ..v182]
    let v184 = [v171, ..v183]
    let v185 = [v178, ..v184]
    let v186 = erlang_term_coerce(v185)
    let v188 = atom.create("maps")
    let v190 = atom.create("from_list")
    let v191 = []
    let v192 = [v186, ..v191]
    erlang_term_apply(v188, v190, v192)
}

pub fn posted_662(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    let v15 = int.to_string(v11)
    let v16 = erlang_term_coerce(v15)
    let v19 = v13 |> string.replace("&", "&amp;")
    let v22 = v19 |> string.replace("<", "&lt;")
    let v25 = v22 |> string.replace(">", "&gt;")
    let v26 = erlang_term_coerce(v25)
    let v27 = erlang_term_coerce(v15)
    let v28 = []
    let v29 = [v27, ..v28]
    let v30 = erlang_term_coerce(v29)
    let v32 = atom.create("edit_history_post_ids")
    let v33 = erlang_term_coerce(v32)
    let v34 = []
    let v35 = [v30, ..v34]
    let v36 = [v33, ..v35]
    let v37 = erlang_term_tuple(v36)
    let v39 = atom.create("text")
    let v40 = erlang_term_coerce(v39)
    let v41 = []
    let v42 = [v26, ..v41]
    let v43 = [v40, ..v42]
    let v44 = erlang_term_tuple(v43)
    let v46 = atom.create("id")
    let v47 = erlang_term_coerce(v46)
    let v48 = []
    let v49 = [v16, ..v48]
    let v50 = [v47, ..v49]
    let v51 = erlang_term_tuple(v50)
    let v52 = []
    let v53 = [v37, ..v52]
    let v54 = [v44, ..v53]
    let v55 = [v51, ..v54]
    let v56 = erlang_term_coerce(v55)
    let v57 = "maps"
    let v58 = atom.create(v57)
    let v59 = "from_list"
    let v60 = atom.create(v59)
    let v61 = []
    let v62 = [v56, ..v61]
    let v63 = erlang_term_apply(v58, v60, v62)
    let v65 = atom.create("data")
    let v66 = erlang_term_coerce(v65)
    let v67 = []
    let v68 = [v63, ..v67]
    let v69 = [v66, ..v68]
    let v70 = erlang_term_tuple(v69)
    let v71 = []
    let v72 = [v70, ..v71]
    let v73 = erlang_term_coerce(v72)
    let v74 = atom.create(v57)
    let v75 = atom.create(v59)
    let v76 = []
    let v77 = [v73, ..v76]
    let v78 = erlang_term_apply(v74, v75, v77)
    let v80 = atom.create("json")
    let v82 = atom.create("encode")
    let v83 = []
    let v84 = [v78, ..v83]
    let v85 = erlang_term_apply(v80, v82, v84)
    let v86 = "erlang"
    let v87 = atom.create(v86)
    let v89 = atom.create("iolist_to_binary")
    let v90 = []
    let v91 = [v85, ..v90]
    let v92 = erlang_term_apply(v87, v89, v91)
    let v93 = erlang_term_coerce(v92)
    let v94 = int.to_string(201)
    let v95 = { "HTTP/1.1 " } <> { v94 }
    let v96 = { v95 } <> { " " }
    let v97 = { v96 } <> { "Created" }
    let v98 = erlang_term_coerce(v93)
    let v99 = atom.create(v86)
    let v101 = atom.create("byte_size")
    let v102 = []
    let v103 = [v98, ..v102]
    let v104 = erlang_term_apply(v99, v101, v103)
    let v105 = erlang_term_coerce(v104)
    let v106 = int.to_string(v105)
    let v107 = { "\r\nContent-Length: " } <> { v106 }
    let v108 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v107 }
    let v109 = { v108 } <> { "\r\nConnection: close\r\n\r\n" }
    let v110 = { v97 } <> { v109 }
    let v111 = { v110 } <> { v93 }
    let v112 = dict.insert(v10, v15, Nil)
    let v113 = spiral_wrap_signed(v11 + 1, 32)
    let v114 = created_post_663(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v112, v113, v12, v15, v13, v14)
    let v115 = dict.insert(v5, v15, v114)
    #(v111, v0, v1, v2, v3, v4, v115, v6, v7, v8, v9, v112, v113, v12)
}
