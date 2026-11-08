import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Uh31, type Uh36, type Us109, type Us110, type Us112, Uh29Cons, Uh29Nil, Uh31Cons, Uh31Nil, Uh52Cons, Uh52Nil, Us108None, Us108Some, Us109AppBearer, Us110Elsewhere, Us110Following, Us110Lookup, Us110SearchAll, Us110Single, Us110Timeline, Us110UsersBy, Us110UsersByIds, Us111Error, Us111Ok, Us79OnX}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_slice, spiral_wrap_signed}
import xsim_frames/part12.{method300}
import xsim_frames/part15.{units_on_351}
import xsim_frames/part28.{logged_540, method547, method548, route_of_546}
import xsim_frames/part29.{following_549}
import xsim_frames/part32.{lookup_641, timeline_558, users_reply_630}
import xsim_frames/part33.{search_645, single_644}

pub fn post_reply_640(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, _v14: String, _v15: String, v16: String, _v17: String, _v18: String, v19: Us110) -> String {
    case v19  {
        Us110Lookup -> {
            let v55 = lookup_641(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v16)
            let v57 = atom.create("json")
            let v59 = atom.create("encode")
            let v60 = []
            let v61 = [v55, ..v60]
            let v62 = erlang_term_apply(v57, v59, v61)
            let v63 = "erlang"
            let v64 = atom.create(v63)
            let v66 = atom.create("iolist_to_binary")
            let v67 = []
            let v68 = [v62, ..v67]
            let v69 = erlang_term_apply(v64, v66, v68)
            let v70 = erlang_term_coerce(v69)
            let v71 = int.to_string(200)
            let v72 = { "HTTP/1.1 " } <> { v71 }
            let v73 = { v72 } <> { " " }
            let v74 = { v73 } <> { "OK" }
            let v75 = erlang_term_coerce(v70)
            let v76 = atom.create(v63)
            let v78 = atom.create("byte_size")
            let v79 = []
            let v80 = [v75, ..v79]
            let v81 = erlang_term_apply(v76, v78, v80)
            let v82 = erlang_term_coerce(v81)
            let v83 = int.to_string(v82)
            let v84 = { "\r\nContent-Length: " } <> { v83 }
            let v85 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v84 }
            let v86 = { v85 } <> { "\r\nConnection: close\r\n\r\n" }
            let v87 = { v74 } <> { v86 }
            let v88 = { v87 } <> { v70 }
            v88
        }
        Us110Single(v20) -> {
            let v21 = single_644(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v20, v16)
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
            let v37 = int.to_string(200)
            let v38 = { "HTTP/1.1 " } <> { v37 }
            let v39 = { v38 } <> { " " }
            let v40 = { v39 } <> { "OK" }
            let v41 = erlang_term_coerce(v36)
            let v42 = atom.create(v29)
            let v44 = atom.create("byte_size")
            let v45 = []
            let v46 = [v41, ..v45]
            let v47 = erlang_term_apply(v42, v44, v46)
            let v48 = erlang_term_coerce(v47)
            let v49 = int.to_string(v48)
            let v50 = { "\r\nContent-Length: " } <> { v49 }
            let v51 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v50 }
            let v52 = { v51 } <> { "\r\nConnection: close\r\n\r\n" }
            let v53 = { v40 } <> { v52 }
            let v54 = { v53 } <> { v36 }
            v54
        }
        _ -> {
            let v89 =
                case v19  {
                    Us110SearchAll -> True
                    _ -> False
                }
            let v90 = search_645(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v89, v16)
            let v92 = atom.create("json")
            let v94 = atom.create("encode")
            let v95 = []
            let v96 = [v90, ..v95]
            let v97 = erlang_term_apply(v92, v94, v96)
            let v98 = "erlang"
            let v99 = atom.create(v98)
            let v101 = atom.create("iolist_to_binary")
            let v102 = []
            let v103 = [v97, ..v102]
            let v104 = erlang_term_apply(v99, v101, v103)
            let v105 = erlang_term_coerce(v104)
            let v106 = int.to_string(200)
            let v107 = { "HTTP/1.1 " } <> { v106 }
            let v108 = { v107 } <> { " " }
            let v109 = { v108 } <> { "OK" }
            let v110 = erlang_term_coerce(v105)
            let v111 = atom.create(v98)
            let v113 = atom.create("byte_size")
            let v114 = []
            let v115 = [v110, ..v114]
            let v116 = erlang_term_apply(v111, v113, v115)
            let v117 = erlang_term_coerce(v116)
            let v118 = int.to_string(v117)
            let v119 = { "\r\nContent-Length: " } <> { v118 }
            let v120 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v119 }
            let v121 = { v120 } <> { "\r\nConnection: close\r\n\r\n" }
            let v122 = { v109 } <> { v121 }
            let v123 = { v122 } <> { v105 }
            v123
        }
    }
}

pub fn other_reply_629(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: Us110) -> String {
    case v19  {
        Us110UsersBy -> users_reply_630(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
        Us110UsersByIds -> users_reply_630(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
        _ -> post_reply_640(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
    }
}

pub fn routed_545(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String) -> String {
    let v19 = route_of_546(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v15)
    case v19  {
        Us110Elsewhere -> {
            let v114 = { "no route " } <> { v15 }
            let v116 = erlang_term_coerce("Not Found Error")
            let v117 = erlang_term_coerce(v114)
            let v119 = erlang_term_coerce("about:blank")
            let v120 = erlang_term_coerce(404)
            let v122 = atom.create("status")
            let v123 = erlang_term_coerce(v122)
            let v124 = []
            let v125 = [v120, ..v124]
            let v126 = [v123, ..v125]
            let v127 = erlang_term_tuple(v126)
            let v129 = atom.create("type")
            let v130 = erlang_term_coerce(v129)
            let v131 = []
            let v132 = [v119, ..v131]
            let v133 = [v130, ..v132]
            let v134 = erlang_term_tuple(v133)
            let v136 = atom.create("detail")
            let v137 = erlang_term_coerce(v136)
            let v138 = []
            let v139 = [v117, ..v138]
            let v140 = [v137, ..v139]
            let v141 = erlang_term_tuple(v140)
            let v143 = atom.create("title")
            let v144 = erlang_term_coerce(v143)
            let v145 = []
            let v146 = [v116, ..v145]
            let v147 = [v144, ..v146]
            let v148 = erlang_term_tuple(v147)
            let v149 = []
            let v150 = [v127, ..v149]
            let v151 = [v134, ..v150]
            let v152 = [v141, ..v151]
            let v153 = [v148, ..v152]
            let v154 = erlang_term_coerce(v153)
            let v156 = atom.create("maps")
            let v158 = atom.create("from_list")
            let v159 = []
            let v160 = [v154, ..v159]
            let v161 = erlang_term_apply(v156, v158, v160)
            let v163 = atom.create("json")
            let v165 = atom.create("encode")
            let v166 = []
            let v167 = [v161, ..v166]
            let v168 = erlang_term_apply(v163, v165, v167)
            let v169 = "erlang"
            let v170 = atom.create(v169)
            let v172 = atom.create("iolist_to_binary")
            let v173 = []
            let v174 = [v168, ..v173]
            let v175 = erlang_term_apply(v170, v172, v174)
            let v176 = erlang_term_coerce(v175)
            let v177 = int.to_string(404)
            let v178 = { "HTTP/1.1 " } <> { v177 }
            let v179 = { v178 } <> { " " }
            let v180 = { v179 } <> { "Not Found" }
            let v181 = erlang_term_coerce(v176)
            let v182 = atom.create(v169)
            let v184 = atom.create("byte_size")
            let v185 = []
            let v186 = [v181, ..v185]
            let v187 = erlang_term_apply(v182, v184, v186)
            let v188 = erlang_term_coerce(v187)
            let v189 = int.to_string(v188)
            let v190 = { "\r\nContent-Length: " } <> { v189 }
            let v191 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v190 }
            let v192 = { v191 } <> { "\r\nConnection: close\r\n\r\n" }
            let v193 = { v180 } <> { v192 }
            let v194 = { v193 } <> { v176 }
            v194
        }
        Us110Following(v20) -> {
            let #(v21, v22) = following_549(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v20, v16)
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
            let v38 = int.to_string(v21)
            let v39 = { "HTTP/1.1 " } <> { v38 }
            let v40 = { v39 } <> { " " }
            let v41 = 503 == v21
            let v46 =
                case v41 {
                    True -> {
                        Uh52Cons(503, "Service Unavailable", Uh52Nil)
                    }
                    False -> Uh52Nil
                }
            let v47 = 502 == v21
            let v50 =
                case v47 {
                    True -> {
                        Uh52Cons(502, "Bad Gateway", v46)
                    }
                    False -> v46
                }
            let v51 = 500 == v21
            let v54 =
                case v51 {
                    True -> {
                        Uh52Cons(500, "Internal Server Error", v50)
                    }
                    False -> v50
                }
            let v55 = 429 == v21
            let v58 =
                case v55 {
                    True -> {
                        Uh52Cons(429, "Too Many Requests", v54)
                    }
                    False -> v54
                }
            let v59 = 422 == v21
            let v62 =
                case v59 {
                    True -> {
                        Uh52Cons(422, "Unprocessable Entity", v58)
                    }
                    False -> v58
                }
            let v63 = 404 == v21
            let v66 =
                case v63 {
                    True -> {
                        Uh52Cons(404, "Not Found", v62)
                    }
                    False -> v62
                }
            let v67 = 403 == v21
            let v70 =
                case v67 {
                    True -> {
                        Uh52Cons(403, "Forbidden", v66)
                    }
                    False -> v66
                }
            let v71 = 402 == v21
            let v74 =
                case v71 {
                    True -> {
                        Uh52Cons(402, "Payment Required", v70)
                    }
                    False -> v70
                }
            let v75 = 401 == v21
            let v78 =
                case v75 {
                    True -> {
                        Uh52Cons(401, "Unauthorized", v74)
                    }
                    False -> v74
                }
            let v79 = 400 == v21
            let v82 =
                case v79 {
                    True -> {
                        Uh52Cons(400, "Bad Request", v78)
                    }
                    False -> v78
                }
            let v83 = 201 == v21
            let v86 =
                case v83 {
                    True -> {
                        Uh52Cons(201, "Created", v82)
                    }
                    False -> v82
                }
            let v87 = 200 == v21
            let v90 =
                case v87 {
                    True -> {
                        Uh52Cons(200, "OK", v86)
                    }
                    False -> v86
                }
            let v96 =
                case v90  {
                    Uh52Cons(v91, v92, v93) -> v92
                    Uh52Nil -> {
                        "Status"
                    }
                }
            let v97 = { v40 } <> { v96 }
            let v98 = erlang_term_coerce(v37)
            let v99 = atom.create(v30)
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
            let v111 = { v110 } <> { v37 }
            v111
        }
        Us110Timeline(v112) -> timeline_558(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v112, v16)
        _ -> other_reply_629(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
    }
}

pub fn answer_544(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, _v19: Us109) -> String {
    routed_545(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
}

pub fn user_write_658(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, _v14: String, _v15: String, _v16: String, _v17: String, _v18: String, _v19: Us109) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
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

pub fn change_reply_657(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: Us109) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    user_write_658(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
}

pub fn reply_as_539(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: Us109) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let v22 =
        case v20  {
            Us109AppBearer -> {
                "app"
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
            let v40 = answer_544(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v15, v16, v17, v18, v19, v20)
            #(v40, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
        }
        False -> change_reply_657(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v15, v16, v17, v18, v19, v20)
    }
}

pub fn answer_660(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, _v19: Us112) -> String {
    routed_545(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
}

pub fn units_of_665(v0: String) -> Uh31 {
    units_on_351(Us79OnX, v0)
}

pub fn method666(v0: Uh31, v1: Int) -> Int {
    case v0  {
        Uh31Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + v3, 32)
            method666(v4, v5)
        }
        Uh31Nil -> v1
    }
}

pub fn created_post_668(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, v5: dict.Dict(String, Dynamic), v6: String, _v7: Dynamic, _v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), _v11: Int, _v12: Uh36, _v13: String, v14: String, v15: String, v16: String) -> Dynamic {
    let v17 = v16 == ""
    let v46 =
        case v17 {
            True -> {
                erlang_term_coerce(v14)
            }
            False -> {
                let v19 = erlang_term_coerce(v16)
                let v20 = dict.get(v5, v16)
                let v21 = method547()
                let v22 = method548()
                let v23 = case v20 { Ok(x) -> v21(x) Error(x) -> v22(x) }
                let v28 =
                    case v23  {
                        Us111Error -> Us108None
                        Us111Ok(v24) -> Us108Some(v24)
                    }
                let v32 =
                    case v28  {
                        Us108None -> panic as "dict.present: the key is not in the dict"
                        Us108Some(v29) -> v29
                    }
                let v34 = erlang_term_coerce("conversation_id")
                let v35 = erlang_term_coerce(v19)
                let v37 = atom.create("maps")
                let v39 = atom.create("get")
                let v40 = []
                let v41 = [v35, ..v40]
                let v42 = [v32, ..v41]
                let v43 = [v34, ..v42]
                let v44 = erlang_term_apply(v37, v39, v43)
                erlang_term_coerce(v44)
            }
        }
    let v78 =
        case v17 {
            True -> Uh29Nil
            False -> {
                let v49 = erlang_term_coerce("replied_to")
                let v50 = erlang_term_coerce(v16)
                let v52 = erlang_term_coerce("id")
                let v53 = erlang_term_coerce(v50)
                let v54 = []
                let v55 = [v53, ..v54]
                let v56 = [v52, ..v55]
                let v57 = erlang_term_tuple(v56)
                let v59 = erlang_term_coerce("type")
                let v60 = erlang_term_coerce(v49)
                let v61 = []
                let v62 = [v60, ..v61]
                let v63 = [v59, ..v62]
                let v64 = erlang_term_tuple(v63)
                let v65 = []
                let v66 = [v57, ..v65]
                let v67 = [v64, ..v66]
                let v68 = erlang_term_coerce(v67)
                let v70 = atom.create("maps")
                let v72 = atom.create("from_list")
                let v73 = []
                let v74 = [v68, ..v73]
                let v75 = erlang_term_apply(v70, v72, v74)
                Uh29Cons(v75, Uh29Nil)
            }
        }
    let v79 = []
    let v80 = method300(v78, v79)
    let v81 = erlang_term_coerce(v80)
    let v82 = dict.size(v10)
    let v83 = erlang_term_coerce(v6)
    let v84 = "unicode"
    let v85 = atom.create(v84)
    let v86 = "characters_to_list"
    let v87 = atom.create(v86)
    let v88 = []
    let v89 = [v83, ..v88]
    let v90 = erlang_term_apply(v85, v87, v89)
    let v91 = "calendar"
    let v92 = atom.create(v91)
    let v94 = atom.create("rfc3339_to_system_time")
    let v95 = []
    let v96 = [v90, ..v95]
    let v97 = erlang_term_apply(v92, v94, v96)
    let v98 = erlang_term_coerce(v97)
    let v99 = spiral_wrap_signed(v82, 64)
    let v100 = spiral_wrap_signed(v98 + v99, 64)
    let v101 = erlang_term_coerce(v100)
    let v103 = atom.create("offset")
    let v104 = erlang_term_coerce(v103)
    let v106 = erlang_term_coerce("Z")
    let v107 = atom.create(v84)
    let v108 = atom.create(v86)
    let v109 = []
    let v110 = [v106, ..v109]
    let v111 = erlang_term_apply(v107, v108, v110)
    let v112 = []
    let v113 = [v111, ..v112]
    let v114 = [v104, ..v113]
    let v115 = erlang_term_tuple(v114)
    let v116 = []
    let v117 = [v115, ..v116]
    let v118 = erlang_term_coerce(v117)
    let v119 = atom.create(v91)
    let v121 = atom.create("system_time_to_rfc3339")
    let v122 = []
    let v123 = [v118, ..v122]
    let v124 = [v101, ..v123]
    let v125 = erlang_term_apply(v119, v121, v124)
    let v126 = atom.create(v84)
    let v128 = atom.create("characters_to_binary")
    let v129 = []
    let v130 = [v125, ..v129]
    let v131 = erlang_term_apply(v126, v128, v130)
    let v132 = erlang_term_coerce(v131)
    let v133 = spiral_string_slice(v132, 0, 18)
    let v134 = { v133 } <> { ".000Z" }
    let v135 = erlang_term_coerce(v134)
    let v136 = erlang_term_coerce(v14)
    let v137 = erlang_term_coerce(v15)
    let v139 = erlang_term_coerce("refs")
    let v140 = erlang_term_coerce(v81)
    let v141 = []
    let v142 = [v140, ..v141]
    let v143 = [v139, ..v142]
    let v144 = erlang_term_tuple(v143)
    let v146 = erlang_term_coerce("conversation_id")
    let v147 = erlang_term_coerce(v46)
    let v148 = []
    let v149 = [v147, ..v148]
    let v150 = [v146, ..v149]
    let v151 = erlang_term_tuple(v150)
    let v153 = erlang_term_coerce("created_at")
    let v154 = erlang_term_coerce(v135)
    let v155 = []
    let v156 = [v154, ..v155]
    let v157 = [v153, ..v156]
    let v158 = erlang_term_tuple(v157)
    let v160 = erlang_term_coerce("author_id")
    let v161 = erlang_term_coerce(v9)
    let v162 = []
    let v163 = [v161, ..v162]
    let v164 = [v160, ..v163]
    let v165 = erlang_term_tuple(v164)
    let v167 = erlang_term_coerce("text")
    let v168 = erlang_term_coerce(v137)
    let v169 = []
    let v170 = [v168, ..v169]
    let v171 = [v167, ..v170]
    let v172 = erlang_term_tuple(v171)
    let v174 = erlang_term_coerce("id")
    let v175 = erlang_term_coerce(v136)
    let v176 = []
    let v177 = [v175, ..v176]
    let v178 = [v174, ..v177]
    let v179 = erlang_term_tuple(v178)
    let v180 = []
    let v181 = [v144, ..v180]
    let v182 = [v151, ..v181]
    let v183 = [v158, ..v182]
    let v184 = [v165, ..v183]
    let v185 = [v172, ..v184]
    let v186 = [v179, ..v185]
    let v187 = erlang_term_coerce(v186)
    let v189 = atom.create("maps")
    let v191 = atom.create("from_list")
    let v192 = []
    let v193 = [v187, ..v192]
    erlang_term_apply(v189, v191, v193)
}

pub fn posted_667(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let v16 = int.to_string(v11)
    let v17 = erlang_term_coerce(v16)
    let v20 = v14 |> string.replace("&", "&amp;")
    let v23 = v20 |> string.replace("<", "&lt;")
    let v26 = v23 |> string.replace(">", "&gt;")
    let v27 = erlang_term_coerce(v26)
    let v28 = erlang_term_coerce(v16)
    let v29 = []
    let v30 = [v28, ..v29]
    let v31 = erlang_term_coerce(v30)
    let v33 = atom.create("edit_history_post_ids")
    let v34 = erlang_term_coerce(v33)
    let v35 = []
    let v36 = [v31, ..v35]
    let v37 = [v34, ..v36]
    let v38 = erlang_term_tuple(v37)
    let v40 = atom.create("text")
    let v41 = erlang_term_coerce(v40)
    let v42 = []
    let v43 = [v27, ..v42]
    let v44 = [v41, ..v43]
    let v45 = erlang_term_tuple(v44)
    let v47 = atom.create("id")
    let v48 = erlang_term_coerce(v47)
    let v49 = []
    let v50 = [v17, ..v49]
    let v51 = [v48, ..v50]
    let v52 = erlang_term_tuple(v51)
    let v53 = []
    let v54 = [v38, ..v53]
    let v55 = [v45, ..v54]
    let v56 = [v52, ..v55]
    let v57 = erlang_term_coerce(v56)
    let v58 = "maps"
    let v59 = atom.create(v58)
    let v60 = "from_list"
    let v61 = atom.create(v60)
    let v62 = []
    let v63 = [v57, ..v62]
    let v64 = erlang_term_apply(v59, v61, v63)
    let v66 = atom.create("data")
    let v67 = erlang_term_coerce(v66)
    let v68 = []
    let v69 = [v64, ..v68]
    let v70 = [v67, ..v69]
    let v71 = erlang_term_tuple(v70)
    let v72 = []
    let v73 = [v71, ..v72]
    let v74 = erlang_term_coerce(v73)
    let v75 = atom.create(v58)
    let v76 = atom.create(v60)
    let v77 = []
    let v78 = [v74, ..v77]
    let v79 = erlang_term_apply(v75, v76, v78)
    let v81 = atom.create("json")
    let v83 = atom.create("encode")
    let v84 = []
    let v85 = [v79, ..v84]
    let v86 = erlang_term_apply(v81, v83, v85)
    let v87 = "erlang"
    let v88 = atom.create(v87)
    let v90 = atom.create("iolist_to_binary")
    let v91 = []
    let v92 = [v86, ..v91]
    let v93 = erlang_term_apply(v88, v90, v92)
    let v94 = erlang_term_coerce(v93)
    let v95 = int.to_string(201)
    let v96 = { "HTTP/1.1 " } <> { v95 }
    let v97 = { v96 } <> { " " }
    let v98 = { v97 } <> { "Created" }
    let v99 = erlang_term_coerce(v94)
    let v100 = atom.create(v87)
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
    let v112 = { v111 } <> { v94 }
    let v113 = dict.insert(v10, v16, Nil)
    let v114 = spiral_wrap_signed(v11 + 1, 32)
    let v115 = created_post_668(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v113, v114, v12, v13, v16, v14, v15)
    let v116 = dict.insert(v5, v16, v115)
    #(v112, v0, v1, v2, v3, v4, v116, v6, v7, v8, v9, v113, v114, v12, v13)
}
