import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/string
import xsim_frames/types.{type Uh3, type Uh31, type Us92, type Us93, type Us95, Uh29Cons, Uh29Nil, Uh31Cons, Uh31Nil, Uh39Cons, Uh39Nil, Us72None, Us72Some, Us75OnX, Us92AppBearer, Us93Elsewhere, Us93Following, Us93Lookup, Us93SearchAll, Us93Single, Us93Timeline, Us93UsersBy, Us93UsersByIds, Us94Error, Us94Ok}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_slice, spiral_wrap_signed}
import xsim_frames/part13.{method301}
import xsim_frames/part17.{units_on_348}
import xsim_frames/part28.{following_473, logged_464, method471, method472, route_of_470}
import xsim_frames/part32.{lookup_560, single_563, timeline_483, users_reply_549}
import xsim_frames/part33.{search_564}

pub fn post_reply_559(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, _v12: String, _v13: String, v14: String, _v15: String, _v16: String, v17: Us93) -> String {
    case v17  {
        Us93Lookup -> {
            let v59 = lookup_560(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v14)
            let v60 = "json"
            let v61 = atom.create(v60)
            let v62 = "encode"
            let v63 = atom.create(v62)
            let v64 = []
            let v65 = [v59, ..v64]
            let v66 = erlang_term_apply(v61, v63, v65)
            let v67 = "erlang"
            let v68 = atom.create(v67)
            let v69 = "iolist_to_binary"
            let v70 = atom.create(v69)
            let v71 = []
            let v72 = [v66, ..v71]
            let v73 = erlang_term_apply(v68, v70, v72)
            let v74 = erlang_term_coerce(v73)
            let v75 = string.inspect(200)
            let v76 = "HTTP/1.1 "
            let v77 = v76 <> v75 
            let v78 = " "
            let v79 = v77 <> v78 
            let v80 = "OK"
            let v81 = v79 <> v80 
            let v82 = erlang_term_coerce(v74)
            let v83 = atom.create(v67)
            let v84 = "byte_size"
            let v85 = atom.create(v84)
            let v86 = []
            let v87 = [v82, ..v86]
            let v88 = erlang_term_apply(v83, v85, v87)
            let v89 = erlang_term_coerce(v88)
            let v90 = string.inspect(v89)
            let v91 = "\r\nContent-Length: "
            let v92 = v91 <> v90 
            let v93 = "\r\nContent-Type: application/json; charset=utf-8"
            let v94 = v93 <> v92 
            let v95 = "\r\nConnection: close\r\n\r\n"
            let v96 = v94 <> v95 
            let v97 = v81 <> v96 
            let v98 = v97 <> v74 
            v98
        }
        Us93Single(v18) -> {
            let v19 = single_563(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v18, v14)
            let v20 = "json"
            let v21 = atom.create(v20)
            let v22 = "encode"
            let v23 = atom.create(v22)
            let v24 = []
            let v25 = [v19, ..v24]
            let v26 = erlang_term_apply(v21, v23, v25)
            let v27 = "erlang"
            let v28 = atom.create(v27)
            let v29 = "iolist_to_binary"
            let v30 = atom.create(v29)
            let v31 = []
            let v32 = [v26, ..v31]
            let v33 = erlang_term_apply(v28, v30, v32)
            let v34 = erlang_term_coerce(v33)
            let v35 = string.inspect(200)
            let v36 = "HTTP/1.1 "
            let v37 = v36 <> v35 
            let v38 = " "
            let v39 = v37 <> v38 
            let v40 = "OK"
            let v41 = v39 <> v40 
            let v42 = erlang_term_coerce(v34)
            let v43 = atom.create(v27)
            let v44 = "byte_size"
            let v45 = atom.create(v44)
            let v46 = []
            let v47 = [v42, ..v46]
            let v48 = erlang_term_apply(v43, v45, v47)
            let v49 = erlang_term_coerce(v48)
            let v50 = string.inspect(v49)
            let v51 = "\r\nContent-Length: "
            let v52 = v51 <> v50 
            let v53 = "\r\nContent-Type: application/json; charset=utf-8"
            let v54 = v53 <> v52 
            let v55 = "\r\nConnection: close\r\n\r\n"
            let v56 = v54 <> v55 
            let v57 = v41 <> v56 
            let v58 = v57 <> v34 
            v58
        }
        _ -> {
            let v99 =
                case v17  {
                    Us93SearchAll -> True
                    _ -> False
                }
            let v100 = search_564(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v99, v14)
            let v101 = "json"
            let v102 = atom.create(v101)
            let v103 = "encode"
            let v104 = atom.create(v103)
            let v105 = []
            let v106 = [v100, ..v105]
            let v107 = erlang_term_apply(v102, v104, v106)
            let v108 = "erlang"
            let v109 = atom.create(v108)
            let v110 = "iolist_to_binary"
            let v111 = atom.create(v110)
            let v112 = []
            let v113 = [v107, ..v112]
            let v114 = erlang_term_apply(v109, v111, v113)
            let v115 = erlang_term_coerce(v114)
            let v116 = string.inspect(200)
            let v117 = "HTTP/1.1 "
            let v118 = v117 <> v116 
            let v119 = " "
            let v120 = v118 <> v119 
            let v121 = "OK"
            let v122 = v120 <> v121 
            let v123 = erlang_term_coerce(v115)
            let v124 = atom.create(v108)
            let v125 = "byte_size"
            let v126 = atom.create(v125)
            let v127 = []
            let v128 = [v123, ..v127]
            let v129 = erlang_term_apply(v124, v126, v128)
            let v130 = erlang_term_coerce(v129)
            let v131 = string.inspect(v130)
            let v132 = "\r\nContent-Length: "
            let v133 = v132 <> v131 
            let v134 = "\r\nContent-Type: application/json; charset=utf-8"
            let v135 = v134 <> v133 
            let v136 = "\r\nConnection: close\r\n\r\n"
            let v137 = v135 <> v136 
            let v138 = v122 <> v137 
            let v139 = v138 <> v115 
            v139
        }
    }
}

pub fn other_reply_548(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: Us93) -> String {
    case v17  {
        Us93UsersBy -> users_reply_549(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
        Us93UsersByIds -> users_reply_549(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
        _ -> post_reply_559(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
    }
}

pub fn routed_469(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String) -> String {
    let v17 = route_of_470(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13)
    case v17  {
        Us93Elsewhere -> {
            let v117 = "no route "
            let v118 = v117 <> v13 
            let v119 = "Not Found Error"
            let v120 = erlang_term_coerce(v119)
            let v121 = erlang_term_coerce(v118)
            let v122 = "about:blank"
            let v123 = erlang_term_coerce(v122)
            let v124 = erlang_term_coerce(404)
            let v125 = "status"
            let v126 = atom.create(v125)
            let v127 = erlang_term_coerce(v126)
            let v128 = []
            let v129 = [v124, ..v128]
            let v130 = [v127, ..v129]
            let v131 = erlang_term_tuple(v130)
            let v132 = "type"
            let v133 = atom.create(v132)
            let v134 = erlang_term_coerce(v133)
            let v135 = []
            let v136 = [v123, ..v135]
            let v137 = [v134, ..v136]
            let v138 = erlang_term_tuple(v137)
            let v139 = "detail"
            let v140 = atom.create(v139)
            let v141 = erlang_term_coerce(v140)
            let v142 = []
            let v143 = [v121, ..v142]
            let v144 = [v141, ..v143]
            let v145 = erlang_term_tuple(v144)
            let v146 = "title"
            let v147 = atom.create(v146)
            let v148 = erlang_term_coerce(v147)
            let v149 = []
            let v150 = [v120, ..v149]
            let v151 = [v148, ..v150]
            let v152 = erlang_term_tuple(v151)
            let v153 = []
            let v154 = [v131, ..v153]
            let v155 = [v138, ..v154]
            let v156 = [v145, ..v155]
            let v157 = [v152, ..v156]
            let v158 = erlang_term_coerce(v157)
            let v159 = "maps"
            let v160 = atom.create(v159)
            let v161 = "from_list"
            let v162 = atom.create(v161)
            let v163 = []
            let v164 = [v158, ..v163]
            let v165 = erlang_term_apply(v160, v162, v164)
            let v166 = "json"
            let v167 = atom.create(v166)
            let v168 = "encode"
            let v169 = atom.create(v168)
            let v170 = []
            let v171 = [v165, ..v170]
            let v172 = erlang_term_apply(v167, v169, v171)
            let v173 = "erlang"
            let v174 = atom.create(v173)
            let v175 = "iolist_to_binary"
            let v176 = atom.create(v175)
            let v177 = []
            let v178 = [v172, ..v177]
            let v179 = erlang_term_apply(v174, v176, v178)
            let v180 = erlang_term_coerce(v179)
            let v181 = string.inspect(404)
            let v182 = "HTTP/1.1 "
            let v183 = v182 <> v181 
            let v184 = " "
            let v185 = v183 <> v184 
            let v186 = "Not Found"
            let v187 = v185 <> v186 
            let v188 = erlang_term_coerce(v180)
            let v189 = atom.create(v173)
            let v190 = "byte_size"
            let v191 = atom.create(v190)
            let v192 = []
            let v193 = [v188, ..v192]
            let v194 = erlang_term_apply(v189, v191, v193)
            let v195 = erlang_term_coerce(v194)
            let v196 = string.inspect(v195)
            let v197 = "\r\nContent-Length: "
            let v198 = v197 <> v196 
            let v199 = "\r\nContent-Type: application/json; charset=utf-8"
            let v200 = v199 <> v198 
            let v201 = "\r\nConnection: close\r\n\r\n"
            let v202 = v200 <> v201 
            let v203 = v187 <> v202 
            let v204 = v203 <> v180 
            v204
        }
        Us93Following(v18) -> {
            let #(v19, v20) = following_473(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v18, v14)
            let v21 = "json"
            let v22 = atom.create(v21)
            let v23 = "encode"
            let v24 = atom.create(v23)
            let v25 = []
            let v26 = [v20, ..v25]
            let v27 = erlang_term_apply(v22, v24, v26)
            let v28 = "erlang"
            let v29 = atom.create(v28)
            let v30 = "iolist_to_binary"
            let v31 = atom.create(v30)
            let v32 = []
            let v33 = [v27, ..v32]
            let v34 = erlang_term_apply(v29, v31, v33)
            let v35 = erlang_term_coerce(v34)
            let v36 = string.inspect(v19)
            let v37 = "HTTP/1.1 "
            let v38 = v37 <> v36 
            let v39 = " "
            let v40 = v38 <> v39 
            let v41 = 503 == v19
            let v46 =
                case v41 {
                    True -> {
                        let v42 = "Service Unavailable"
                        let v43 = Uh39Nil
                        Uh39Cons(503, v42, v43)
                    }
                    False -> Uh39Nil
                }
            let v47 = 502 == v19
            let v50 =
                case v47 {
                    True -> {
                        let v48 = "Bad Gateway"
                        Uh39Cons(502, v48, v46)
                    }
                    False -> v46
                }
            let v51 = 500 == v19
            let v54 =
                case v51 {
                    True -> {
                        let v52 = "Internal Server Error"
                        Uh39Cons(500, v52, v50)
                    }
                    False -> v50
                }
            let v55 = 429 == v19
            let v58 =
                case v55 {
                    True -> {
                        let v56 = "Too Many Requests"
                        Uh39Cons(429, v56, v54)
                    }
                    False -> v54
                }
            let v59 = 422 == v19
            let v62 =
                case v59 {
                    True -> {
                        let v60 = "Unprocessable Entity"
                        Uh39Cons(422, v60, v58)
                    }
                    False -> v58
                }
            let v63 = 404 == v19
            let v66 =
                case v63 {
                    True -> {
                        let v64 = "Not Found"
                        Uh39Cons(404, v64, v62)
                    }
                    False -> v62
                }
            let v67 = 403 == v19
            let v70 =
                case v67 {
                    True -> {
                        let v68 = "Forbidden"
                        Uh39Cons(403, v68, v66)
                    }
                    False -> v66
                }
            let v71 = 402 == v19
            let v74 =
                case v71 {
                    True -> {
                        let v72 = "Payment Required"
                        Uh39Cons(402, v72, v70)
                    }
                    False -> v70
                }
            let v75 = 401 == v19
            let v78 =
                case v75 {
                    True -> {
                        let v76 = "Unauthorized"
                        Uh39Cons(401, v76, v74)
                    }
                    False -> v74
                }
            let v79 = 400 == v19
            let v82 =
                case v79 {
                    True -> {
                        let v80 = "Bad Request"
                        Uh39Cons(400, v80, v78)
                    }
                    False -> v78
                }
            let v83 = 201 == v19
            let v86 =
                case v83 {
                    True -> {
                        let v84 = "Created"
                        Uh39Cons(201, v84, v82)
                    }
                    False -> v82
                }
            let v87 = 200 == v19
            let v90 =
                case v87 {
                    True -> {
                        let v88 = "OK"
                        Uh39Cons(200, v88, v86)
                    }
                    False -> v86
                }
            let v96 =
                case v90  {
                    Uh39Cons(v91, v92, v93) -> v92
                    Uh39Nil -> {
                        let v94 = "Status"
                        v94
                    }
                }
            let v97 = v40 <> v96 
            let v98 = erlang_term_coerce(v35)
            let v99 = atom.create(v28)
            let v100 = "byte_size"
            let v101 = atom.create(v100)
            let v102 = []
            let v103 = [v98, ..v102]
            let v104 = erlang_term_apply(v99, v101, v103)
            let v105 = erlang_term_coerce(v104)
            let v106 = string.inspect(v105)
            let v107 = "\r\nContent-Length: "
            let v108 = v107 <> v106 
            let v109 = "\r\nContent-Type: application/json; charset=utf-8"
            let v110 = v109 <> v108 
            let v111 = "\r\nConnection: close\r\n\r\n"
            let v112 = v110 <> v111 
            let v113 = v97 <> v112 
            let v114 = v113 <> v35 
            v114
        }
        Us93Timeline(v115) -> timeline_483(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v115, v14)
        _ -> other_reply_548(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
    }
}

pub fn answer_468(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, _v17: Us92) -> String {
    routed_469(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
}

pub fn user_write_579(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, _v12: String, _v13: String, _v14: String, _v15: String, _v16: String, _v17: Us92) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
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

pub fn change_reply_578(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: Us92) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    user_write_579(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
}

pub fn reply_as_463(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: String, v18: Us92) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v20 =
        case v18  {
            Us92AppBearer -> {
                let v19 = "app"
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
            let v41 = answer_468(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
            #(v41, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
        }
        False -> change_reply_578(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
    }
}

pub fn answer_581(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, _v17: Us95) -> String {
    routed_469(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
}

pub fn units_of_586(v0: String) -> Uh31 {
    let v1 = Us75OnX
    units_on_348(v1, v0)
}

pub fn method587(v0: Uh31, v1: Int) -> Int {
    case v0  {
        Uh31Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + v3, 32)
            method587(v4, v5)
        }
        Uh31Nil -> v1
    }
}

pub fn created_post_589(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, v5: dict.Dict(String, Dynamic), v6: String, _v7: Dynamic, _v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), _v11: Int, v12: String, v13: String, v14: String) -> Dynamic {
    let v15 = v14 == ""
    let v42 =
        case v15 {
            True -> {
                let v16 = erlang_term_coerce(v12)
                v16
            }
            False -> {
                let v17 = erlang_term_coerce(v14)
                let v18 = dict.get(v5, v14)
                let v19 = method471()
                let v20 = method472()
                let v21 = case v18 { Ok(x) -> v19(x) Error(x) -> v20(x) }
                let v26 =
                    case v21  {
                        Us94Error -> Us72None
                        Us94Ok(v22) -> Us72Some(v22)
                    }
                let v30 =
                    case v26  {
                        Us72None -> panic as "dictm.present: the key is not in the dict"
                        Us72Some(v27) -> v27
                    }
                let v31 = "conversation_id"
                let v32 = erlang_term_coerce(v31)
                let v33 = "maps"
                let v34 = atom.create(v33)
                let v35 = "get"
                let v36 = atom.create(v35)
                let v37 = []
                let v38 = [v17, ..v37]
                let v39 = [v30, ..v38]
                let v40 = [v32, ..v39]
                let v41 = erlang_term_apply(v34, v36, v40)
                v41
            }
        }
    let v72 =
        case v15 {
            True -> Uh29Nil
            False -> {
                let v44 = "replied_to"
                let v45 = erlang_term_coerce(v44)
                let v46 = erlang_term_coerce(v14)
                let v47 = "id"
                let v48 = erlang_term_coerce(v47)
                let v49 = []
                let v50 = [v46, ..v49]
                let v51 = [v48, ..v50]
                let v52 = erlang_term_tuple(v51)
                let v53 = "type"
                let v54 = erlang_term_coerce(v53)
                let v55 = []
                let v56 = [v45, ..v55]
                let v57 = [v54, ..v56]
                let v58 = erlang_term_tuple(v57)
                let v59 = []
                let v60 = [v52, ..v59]
                let v61 = [v58, ..v60]
                let v62 = erlang_term_coerce(v61)
                let v63 = "maps"
                let v64 = atom.create(v63)
                let v65 = "from_list"
                let v66 = atom.create(v65)
                let v67 = []
                let v68 = [v62, ..v67]
                let v69 = erlang_term_apply(v64, v66, v68)
                let v70 = Uh29Nil
                Uh29Cons(v69, v70)
            }
        }
    let v73 = []
    let v74 = method301(v72, v73)
    let v75 = erlang_term_coerce(v74)
    let v76 = dict.size(v10)
    let v77 = erlang_term_coerce(v6)
    let v78 = "unicode"
    let v79 = atom.create(v78)
    let v80 = "characters_to_list"
    let v81 = atom.create(v80)
    let v82 = []
    let v83 = [v77, ..v82]
    let v84 = erlang_term_apply(v79, v81, v83)
    let v85 = "calendar"
    let v86 = atom.create(v85)
    let v87 = "rfc3339_to_system_time"
    let v88 = atom.create(v87)
    let v89 = []
    let v90 = [v84, ..v89]
    let v91 = erlang_term_apply(v86, v88, v90)
    let v92 = erlang_term_coerce(v76)
    let v93 = "erlang"
    let v94 = atom.create(v93)
    let v95 = "+"
    let v96 = atom.create(v95)
    let v97 = []
    let v98 = [v92, ..v97]
    let v99 = [v91, ..v98]
    let v100 = erlang_term_apply(v94, v96, v99)
    let v101 = "Z"
    let v102 = erlang_term_coerce(v101)
    let v103 = atom.create(v78)
    let v104 = atom.create(v80)
    let v105 = []
    let v106 = [v102, ..v105]
    let v107 = erlang_term_apply(v103, v104, v106)
    let v108 = "offset"
    let v109 = atom.create(v108)
    let v110 = erlang_term_coerce(v109)
    let v111 = []
    let v112 = [v107, ..v111]
    let v113 = [v110, ..v112]
    let v114 = erlang_term_tuple(v113)
    let v115 = []
    let v116 = [v114, ..v115]
    let v117 = erlang_term_coerce(v116)
    let v118 = atom.create(v85)
    let v119 = "system_time_to_rfc3339"
    let v120 = atom.create(v119)
    let v121 = []
    let v122 = [v117, ..v121]
    let v123 = [v100, ..v122]
    let v124 = erlang_term_apply(v118, v120, v123)
    let v125 = atom.create(v78)
    let v126 = "characters_to_binary"
    let v127 = atom.create(v126)
    let v128 = []
    let v129 = [v124, ..v128]
    let v130 = erlang_term_apply(v125, v127, v129)
    let v131 = erlang_term_coerce(v130)
    let v132 = spiral_string_slice(v131, 0, 18)
    let v133 = ".000Z"
    let v134 = v132 <> v133 
    let v135 = erlang_term_coerce(v134)
    let v136 = erlang_term_coerce(v12)
    let v137 = erlang_term_coerce(v13)
    let v138 = "refs"
    let v139 = erlang_term_coerce(v138)
    let v140 = []
    let v141 = [v75, ..v140]
    let v142 = [v139, ..v141]
    let v143 = erlang_term_tuple(v142)
    let v144 = "conversation_id"
    let v145 = erlang_term_coerce(v144)
    let v146 = []
    let v147 = [v42, ..v146]
    let v148 = [v145, ..v147]
    let v149 = erlang_term_tuple(v148)
    let v150 = "created_at"
    let v151 = erlang_term_coerce(v150)
    let v152 = []
    let v153 = [v135, ..v152]
    let v154 = [v151, ..v153]
    let v155 = erlang_term_tuple(v154)
    let v156 = "author_id"
    let v157 = erlang_term_coerce(v156)
    let v158 = []
    let v159 = [v9, ..v158]
    let v160 = [v157, ..v159]
    let v161 = erlang_term_tuple(v160)
    let v162 = "text"
    let v163 = erlang_term_coerce(v162)
    let v164 = []
    let v165 = [v137, ..v164]
    let v166 = [v163, ..v165]
    let v167 = erlang_term_tuple(v166)
    let v168 = "id"
    let v169 = erlang_term_coerce(v168)
    let v170 = []
    let v171 = [v136, ..v170]
    let v172 = [v169, ..v171]
    let v173 = erlang_term_tuple(v172)
    let v174 = []
    let v175 = [v143, ..v174]
    let v176 = [v149, ..v175]
    let v177 = [v155, ..v176]
    let v178 = [v161, ..v177]
    let v179 = [v167, ..v178]
    let v180 = [v173, ..v179]
    let v181 = erlang_term_coerce(v180)
    let v182 = "maps"
    let v183 = atom.create(v182)
    let v184 = "from_list"
    let v185 = atom.create(v184)
    let v186 = []
    let v187 = [v181, ..v186]
    let v188 = erlang_term_apply(v183, v185, v187)
    v188
}

pub fn posted_588(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v14 = string.inspect(v11)
    let v15 = erlang_term_coerce(v14)
    let v16 = "&"
    let v17 = "&amp;"
    let v18 = v12 |> string.replace(v16, v17)
    let v19 = "<"
    let v20 = "&lt;"
    let v21 = v18 |> string.replace(v19, v20)
    let v22 = ">"
    let v23 = "&gt;"
    let v24 = v21 |> string.replace(v22, v23)
    let v25 = erlang_term_coerce(v24)
    let v26 = erlang_term_coerce(v14)
    let v27 = []
    let v28 = [v26, ..v27]
    let v29 = erlang_term_coerce(v28)
    let v30 = "edit_history_post_ids"
    let v31 = atom.create(v30)
    let v32 = erlang_term_coerce(v31)
    let v33 = []
    let v34 = [v29, ..v33]
    let v35 = [v32, ..v34]
    let v36 = erlang_term_tuple(v35)
    let v37 = "text"
    let v38 = atom.create(v37)
    let v39 = erlang_term_coerce(v38)
    let v40 = []
    let v41 = [v25, ..v40]
    let v42 = [v39, ..v41]
    let v43 = erlang_term_tuple(v42)
    let v44 = "id"
    let v45 = atom.create(v44)
    let v46 = erlang_term_coerce(v45)
    let v47 = []
    let v48 = [v15, ..v47]
    let v49 = [v46, ..v48]
    let v50 = erlang_term_tuple(v49)
    let v51 = []
    let v52 = [v36, ..v51]
    let v53 = [v43, ..v52]
    let v54 = [v50, ..v53]
    let v55 = erlang_term_coerce(v54)
    let v56 = "maps"
    let v57 = atom.create(v56)
    let v58 = "from_list"
    let v59 = atom.create(v58)
    let v60 = []
    let v61 = [v55, ..v60]
    let v62 = erlang_term_apply(v57, v59, v61)
    let v63 = "data"
    let v64 = atom.create(v63)
    let v65 = erlang_term_coerce(v64)
    let v66 = []
    let v67 = [v62, ..v66]
    let v68 = [v65, ..v67]
    let v69 = erlang_term_tuple(v68)
    let v70 = []
    let v71 = [v69, ..v70]
    let v72 = erlang_term_coerce(v71)
    let v73 = atom.create(v56)
    let v74 = atom.create(v58)
    let v75 = []
    let v76 = [v72, ..v75]
    let v77 = erlang_term_apply(v73, v74, v76)
    let v78 = "json"
    let v79 = atom.create(v78)
    let v80 = "encode"
    let v81 = atom.create(v80)
    let v82 = []
    let v83 = [v77, ..v82]
    let v84 = erlang_term_apply(v79, v81, v83)
    let v85 = "erlang"
    let v86 = atom.create(v85)
    let v87 = "iolist_to_binary"
    let v88 = atom.create(v87)
    let v89 = []
    let v90 = [v84, ..v89]
    let v91 = erlang_term_apply(v86, v88, v90)
    let v92 = erlang_term_coerce(v91)
    let v93 = string.inspect(201)
    let v94 = "HTTP/1.1 "
    let v95 = v94 <> v93 
    let v96 = " "
    let v97 = v95 <> v96 
    let v98 = "Created"
    let v99 = v97 <> v98 
    let v100 = erlang_term_coerce(v92)
    let v101 = atom.create(v85)
    let v102 = "byte_size"
    let v103 = atom.create(v102)
    let v104 = []
    let v105 = [v100, ..v104]
    let v106 = erlang_term_apply(v101, v103, v105)
    let v107 = erlang_term_coerce(v106)
    let v108 = string.inspect(v107)
    let v109 = "\r\nContent-Length: "
    let v110 = v109 <> v108 
    let v111 = "\r\nContent-Type: application/json; charset=utf-8"
    let v112 = v111 <> v110 
    let v113 = "\r\nConnection: close\r\n\r\n"
    let v114 = v112 <> v113 
    let v115 = v99 <> v114 
    let v116 = v115 <> v92 
    let v117 = dict.insert(v10, v14, Nil)
    let v118 = spiral_wrap_signed(v11 + 1, 32)
    let v119 = created_post_589(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v117, v118, v14, v12, v13)
    let v120 = dict.insert(v5, v14, v119)
    #(v116, v0, v1, v2, v3, v4, v120, v6, v7, v8, v9, v117, v118)
}
