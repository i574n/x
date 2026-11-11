import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh36, type Us112, type Us113, Uh3Cons, Uh3Nil, Us112OAuth1User, Us112UserBearer, Us2None, Us2Some}
import xsim_frames/part1.{closure1, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part2.{method20}
import xsim_frames/part28.{logged_542}
import xsim_frames/part34.{answer_662, method668, posted_669, routed_547, units_of_667}

pub fn new_post_666(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, _v15: String, _v16: String, _v17: String, _v18: String, v19: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
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
    let v47 = v46 == ""
    let v87 =
        case v47 {
            True -> {
                let v49 = atom.create("maps")
                let v51 = atom.create("new")
                let v52 = []
                erlang_term_apply(v49, v51, v52)
            }
            False -> {
                let v54 = option.from_result(result.map(string.split_once(v19, v20), pair.first))
                let v55 = v54 |> option.map(v22)
                let v57 = v55 |> option.unwrap(Us2None)
                let v61 =
                    case v57  {
                        Us2None -> -1
                        Us2Some(v58) -> {
                            bit_array.byte_size(bit_array.from_string(v58))
                        }
                    }
                let v62 = spiral_wrap_signed(v61 + 4, 32)
                let v63 = option.from_result(result.map(string.split_once(v19, v20), pair.first))
                let v64 = v63 |> option.map(v22)
                let v66 = v64 |> option.unwrap(Us2None)
                let v70 =
                    case v66  {
                        Us2None -> -1
                        Us2Some(v67) -> {
                            bit_array.byte_size(bit_array.from_string(v67))
                        }
                    }
                let v71 = v70 < 0
                let v78 =
                    case v71 {
                        True -> {
                            ""
                        }
                        False -> {
                            let v73 = spiral_string_length(v19)
                            let v74 = spiral_wrap_signed(v73 - v62, 32)
                            let v75 = spiral_wrap_signed(v62 + v74, 32)
                            let v76 = spiral_wrap_signed(v75 - 1, 32)
                            spiral_string_slice(v19, v62, v76)
                        }
                    }
                let v79 = erlang_term_coerce(v78)
                let v81 = atom.create("json")
                let v83 = atom.create("decode")
                let v84 = []
                let v85 = [v79, ..v84]
                erlang_term_apply(v81, v83, v85)
            }
        }
    let v88 = ""
    let v89 = erlang_term_coerce(v88)
    let v91 = erlang_term_coerce("text")
    let v92 = erlang_term_coerce(v89)
    let v93 = "maps"
    let v94 = atom.create(v93)
    let v95 = "get"
    let v96 = atom.create(v95)
    let v97 = []
    let v98 = [v92, ..v97]
    let v99 = [v87, ..v98]
    let v100 = [v91, ..v99]
    let v101 = erlang_term_apply(v94, v96, v100)
    let v102 = erlang_term_coerce(v101)
    let v103 = erlang_term_coerce(v102)
    let v104 = erlang_term_coerce(v103)
    let v106 = atom.create("trailing")
    let v107 = erlang_term_coerce(v106)
    let v109 = atom.create("string")
    let v111 = atom.create("trim")
    let v112 = []
    let v113 = [v107, ..v112]
    let v114 = [v104, ..v113]
    let v115 = erlang_term_apply(v109, v111, v114)
    let v116 = erlang_term_coerce(v115)
    let v117 = atom.create(v93)
    let v119 = atom.create("new")
    let v120 = []
    let v121 = erlang_term_apply(v117, v119, v120)
    let v123 = erlang_term_coerce("reply")
    let v124 = erlang_term_coerce(v121)
    let v125 = atom.create(v93)
    let v126 = atom.create(v95)
    let v127 = []
    let v128 = [v124, ..v127]
    let v129 = [v87, ..v128]
    let v130 = [v123, ..v129]
    let v131 = erlang_term_apply(v125, v126, v130)
    let v132 = erlang_term_coerce(v131)
    let v133 = "in_reply_to_tweet_id"
    let v134 = erlang_term_coerce(v133)
    let v135 = atom.create(v93)
    let v137 = atom.create("is_key")
    let v138 = []
    let v139 = [v132, ..v138]
    let v140 = [v134, ..v139]
    let v141 = erlang_term_apply(v135, v137, v140)
    let v142 = erlang_term_coerce(v141)
    let v171 =
        case v142 {
            True -> {
                let v143 = erlang_term_coerce(v88)
                let v144 = erlang_term_coerce(v133)
                let v145 = erlang_term_coerce(v143)
                let v146 = atom.create(v93)
                let v147 = atom.create(v95)
                let v148 = []
                let v149 = [v145, ..v148]
                let v150 = [v132, ..v149]
                let v151 = [v144, ..v150]
                let v152 = erlang_term_apply(v146, v147, v151)
                let v153 = erlang_term_coerce(v152)
                let v154 = "erlang"
                let v155 = atom.create(v154)
                let v157 = atom.create("is_binary")
                let v158 = []
                let v159 = [v153, ..v158]
                let v160 = erlang_term_apply(v155, v157, v159)
                let v161 = erlang_term_coerce(v160)
                case v161 {
                    True -> {
                        erlang_term_coerce(v153)
                    }
                    False -> {
                        let v163 = atom.create(v154)
                        let v165 = atom.create("integer_to_binary")
                        let v166 = []
                        let v167 = [v153, ..v166]
                        let v168 = erlang_term_apply(v163, v165, v167)
                        erlang_term_coerce(v168)
                    }
                }
            }
            False -> v88
        }
    let v172 = v116 == ""
    let v177 =
        case v172 {
            True -> True
            False -> {
                let v173 = units_of_667(v116)
                let v175 = method668(v173, 0)
                v175 > 280
            }
        }
    case v177 {
        True -> {
            let v179 = erlang_term_coerce("Invalid Request")
            let v181 = erlang_term_coerce("text must be 1 to 280 characters")
            let v183 = erlang_term_coerce("about:blank")
            let v184 = erlang_term_coerce(400)
            let v186 = atom.create("status")
            let v187 = erlang_term_coerce(v186)
            let v188 = []
            let v189 = [v184, ..v188]
            let v190 = [v187, ..v189]
            let v191 = erlang_term_tuple(v190)
            let v193 = atom.create("type")
            let v194 = erlang_term_coerce(v193)
            let v195 = []
            let v196 = [v183, ..v195]
            let v197 = [v194, ..v196]
            let v198 = erlang_term_tuple(v197)
            let v200 = atom.create("detail")
            let v201 = erlang_term_coerce(v200)
            let v202 = []
            let v203 = [v181, ..v202]
            let v204 = [v201, ..v203]
            let v205 = erlang_term_tuple(v204)
            let v207 = atom.create("title")
            let v208 = erlang_term_coerce(v207)
            let v209 = []
            let v210 = [v179, ..v209]
            let v211 = [v208, ..v210]
            let v212 = erlang_term_tuple(v211)
            let v213 = []
            let v214 = [v191, ..v213]
            let v215 = [v198, ..v214]
            let v216 = [v205, ..v215]
            let v217 = [v212, ..v216]
            let v218 = erlang_term_coerce(v217)
            let v219 = atom.create(v93)
            let v221 = atom.create("from_list")
            let v222 = []
            let v223 = [v218, ..v222]
            let v224 = erlang_term_apply(v219, v221, v223)
            let v226 = atom.create("json")
            let v228 = atom.create("encode")
            let v229 = []
            let v230 = [v224, ..v229]
            let v231 = erlang_term_apply(v226, v228, v230)
            let v232 = "erlang"
            let v233 = atom.create(v232)
            let v235 = atom.create("iolist_to_binary")
            let v236 = []
            let v237 = [v231, ..v236]
            let v238 = erlang_term_apply(v233, v235, v237)
            let v239 = erlang_term_coerce(v238)
            let v240 = int.to_string(400)
            let v241 = { "HTTP/1.1 " } <> { v240 }
            let v242 = { v241 } <> { " " }
            let v243 = { v242 } <> { "Bad Request" }
            let v244 = erlang_term_coerce(v239)
            let v245 = atom.create(v232)
            let v247 = atom.create("byte_size")
            let v248 = []
            let v249 = [v244, ..v248]
            let v250 = erlang_term_apply(v245, v247, v249)
            let v251 = erlang_term_coerce(v250)
            let v252 = int.to_string(v251)
            let v253 = { "\r\nContent-Length: " } <> { v252 }
            let v254 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v253 }
            let v255 = { v254 } <> { "\r\nConnection: close\r\n\r\n" }
            let v256 = { v243 } <> { v255 }
            let v257 = { v256 } <> { v239 }
            #(v257, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
        }
        False -> {
            let v258 = v171 != ""
            let v261 =
                case v258 {
                    True -> {
                        let v259 = dict.has_key(v5, v171)
                        v259 == False
                    }
                    False -> False
                }
            case v261 {
                True -> {
                    let v262 = { "in_reply_to_tweet_id " } <> { v171 }
                    let v263 = { v262 } <> { " does not exist" }
                    let v265 = erlang_term_coerce("Invalid Request")
                    let v266 = erlang_term_coerce(v263)
                    let v268 = erlang_term_coerce("about:blank")
                    let v269 = erlang_term_coerce(400)
                    let v271 = atom.create("status")
                    let v272 = erlang_term_coerce(v271)
                    let v273 = []
                    let v274 = [v269, ..v273]
                    let v275 = [v272, ..v274]
                    let v276 = erlang_term_tuple(v275)
                    let v278 = atom.create("type")
                    let v279 = erlang_term_coerce(v278)
                    let v280 = []
                    let v281 = [v268, ..v280]
                    let v282 = [v279, ..v281]
                    let v283 = erlang_term_tuple(v282)
                    let v285 = atom.create("detail")
                    let v286 = erlang_term_coerce(v285)
                    let v287 = []
                    let v288 = [v266, ..v287]
                    let v289 = [v286, ..v288]
                    let v290 = erlang_term_tuple(v289)
                    let v292 = atom.create("title")
                    let v293 = erlang_term_coerce(v292)
                    let v294 = []
                    let v295 = [v265, ..v294]
                    let v296 = [v293, ..v295]
                    let v297 = erlang_term_tuple(v296)
                    let v298 = []
                    let v299 = [v276, ..v298]
                    let v300 = [v283, ..v299]
                    let v301 = [v290, ..v300]
                    let v302 = [v297, ..v301]
                    let v303 = erlang_term_coerce(v302)
                    let v304 = atom.create(v93)
                    let v306 = atom.create("from_list")
                    let v307 = []
                    let v308 = [v303, ..v307]
                    let v309 = erlang_term_apply(v304, v306, v308)
                    let v311 = atom.create("json")
                    let v313 = atom.create("encode")
                    let v314 = []
                    let v315 = [v309, ..v314]
                    let v316 = erlang_term_apply(v311, v313, v315)
                    let v317 = "erlang"
                    let v318 = atom.create(v317)
                    let v320 = atom.create("iolist_to_binary")
                    let v321 = []
                    let v322 = [v316, ..v321]
                    let v323 = erlang_term_apply(v318, v320, v322)
                    let v324 = erlang_term_coerce(v323)
                    let v325 = int.to_string(400)
                    let v326 = { "HTTP/1.1 " } <> { v325 }
                    let v327 = { v326 } <> { " " }
                    let v328 = { v327 } <> { "Bad Request" }
                    let v329 = erlang_term_coerce(v324)
                    let v330 = atom.create(v317)
                    let v332 = atom.create("byte_size")
                    let v333 = []
                    let v334 = [v329, ..v333]
                    let v335 = erlang_term_apply(v330, v332, v334)
                    let v336 = erlang_term_coerce(v335)
                    let v337 = int.to_string(v336)
                    let v338 = { "\r\nContent-Length: " } <> { v337 }
                    let v339 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v338 }
                    let v340 = { v339 } <> { "\r\nConnection: close\r\n\r\n" }
                    let v341 = { v328 } <> { v340 }
                    let v342 = { v341 } <> { v324 }
                    #(v342, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
                }
                False -> posted_669(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v116, v171)
            }
        }
    }
}

pub fn removed_671(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    let v16 = dict.has_key(v10, v15)
    case v16 {
        True -> {
            let v17 = erlang_term_coerce(True)
            let v19 = atom.create("deleted")
            let v20 = erlang_term_coerce(v19)
            let v21 = []
            let v22 = [v17, ..v21]
            let v23 = [v20, ..v22]
            let v24 = erlang_term_tuple(v23)
            let v25 = []
            let v26 = [v24, ..v25]
            let v27 = erlang_term_coerce(v26)
            let v28 = "maps"
            let v29 = atom.create(v28)
            let v30 = "from_list"
            let v31 = atom.create(v30)
            let v32 = []
            let v33 = [v27, ..v32]
            let v34 = erlang_term_apply(v29, v31, v33)
            let v36 = atom.create("data")
            let v37 = erlang_term_coerce(v36)
            let v38 = []
            let v39 = [v34, ..v38]
            let v40 = [v37, ..v39]
            let v41 = erlang_term_tuple(v40)
            let v42 = []
            let v43 = [v41, ..v42]
            let v44 = erlang_term_coerce(v43)
            let v45 = atom.create(v28)
            let v46 = atom.create(v30)
            let v47 = []
            let v48 = [v44, ..v47]
            let v49 = erlang_term_apply(v45, v46, v48)
            let v51 = atom.create("json")
            let v53 = atom.create("encode")
            let v54 = []
            let v55 = [v49, ..v54]
            let v56 = erlang_term_apply(v51, v53, v55)
            let v57 = "erlang"
            let v58 = atom.create(v57)
            let v60 = atom.create("iolist_to_binary")
            let v61 = []
            let v62 = [v56, ..v61]
            let v63 = erlang_term_apply(v58, v60, v62)
            let v64 = erlang_term_coerce(v63)
            let v65 = int.to_string(200)
            let v66 = { "HTTP/1.1 " } <> { v65 }
            let v67 = { v66 } <> { " " }
            let v68 = { v67 } <> { "OK" }
            let v69 = erlang_term_coerce(v64)
            let v70 = atom.create(v57)
            let v72 = atom.create("byte_size")
            let v73 = []
            let v74 = [v69, ..v73]
            let v75 = erlang_term_apply(v70, v72, v74)
            let v76 = erlang_term_coerce(v75)
            let v77 = int.to_string(v76)
            let v78 = { "\r\nContent-Length: " } <> { v77 }
            let v79 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v78 }
            let v80 = { v79 } <> { "\r\nConnection: close\r\n\r\n" }
            let v81 = { v68 } <> { v80 }
            let v82 = { v81 } <> { v64 }
            let v83 = dict.delete(v10, v15)
            let v84 = dict.delete(v5, v15)
            #(v82, v0, v1, v2, v3, v4, v84, v6, v7, v8, v9, v83, v11, v12, v13, v14)
        }
        False -> {
            let v85 = { "Could not find post with id: [" } <> { v15 }
            let v86 = { v85 } <> { "]." }
            let v88 = erlang_term_coerce("Not Found Error")
            let v89 = erlang_term_coerce(v86)
            let v91 = erlang_term_coerce("about:blank")
            let v92 = erlang_term_coerce(404)
            let v94 = atom.create("status")
            let v95 = erlang_term_coerce(v94)
            let v96 = []
            let v97 = [v92, ..v96]
            let v98 = [v95, ..v97]
            let v99 = erlang_term_tuple(v98)
            let v101 = atom.create("type")
            let v102 = erlang_term_coerce(v101)
            let v103 = []
            let v104 = [v91, ..v103]
            let v105 = [v102, ..v104]
            let v106 = erlang_term_tuple(v105)
            let v108 = atom.create("detail")
            let v109 = erlang_term_coerce(v108)
            let v110 = []
            let v111 = [v89, ..v110]
            let v112 = [v109, ..v111]
            let v113 = erlang_term_tuple(v112)
            let v115 = atom.create("title")
            let v116 = erlang_term_coerce(v115)
            let v117 = []
            let v118 = [v88, ..v117]
            let v119 = [v116, ..v118]
            let v120 = erlang_term_tuple(v119)
            let v121 = []
            let v122 = [v99, ..v121]
            let v123 = [v106, ..v122]
            let v124 = [v113, ..v123]
            let v125 = [v120, ..v124]
            let v126 = erlang_term_coerce(v125)
            let v128 = atom.create("maps")
            let v130 = atom.create("from_list")
            let v131 = []
            let v132 = [v126, ..v131]
            let v133 = erlang_term_apply(v128, v130, v132)
            let v135 = atom.create("json")
            let v137 = atom.create("encode")
            let v138 = []
            let v139 = [v133, ..v138]
            let v140 = erlang_term_apply(v135, v137, v139)
            let v141 = "erlang"
            let v142 = atom.create(v141)
            let v144 = atom.create("iolist_to_binary")
            let v145 = []
            let v146 = [v140, ..v145]
            let v147 = erlang_term_apply(v142, v144, v146)
            let v148 = erlang_term_coerce(v147)
            let v149 = int.to_string(404)
            let v150 = { "HTTP/1.1 " } <> { v149 }
            let v151 = { v150 } <> { " " }
            let v152 = { v151 } <> { "Not Found" }
            let v153 = erlang_term_coerce(v148)
            let v154 = atom.create(v141)
            let v156 = atom.create("byte_size")
            let v157 = []
            let v158 = [v153, ..v157]
            let v159 = erlang_term_apply(v154, v156, v158)
            let v160 = erlang_term_coerce(v159)
            let v161 = int.to_string(v160)
            let v162 = { "\r\nContent-Length: " } <> { v161 }
            let v163 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v162 }
            let v164 = { v163 } <> { "\r\nConnection: close\r\n\r\n" }
            let v165 = { v152 } <> { v164 }
            let v166 = { v165 } <> { v148 }
            #(v166, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
        }
    }
}

pub fn post_or_delete_665(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    let v20 = v15 == "POST"
    let v22 =
        case v20 {
            True -> {
                v16 == "/2/tweets"
            }
            False -> False
        }
    case v22 {
        True -> new_post_666(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
        False -> {
            let v39 = v16 == ""
            let v43 =
                case v39 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2("/", v16)
                    }
                }
            let v74 =
                case v43  {
                    Uh3Cons(v44, v45) -> {
                        let v46 = "" == v44
                        case v46 {
                            True -> {
                                case v45  {
                                    Uh3Cons(v47, v48) -> {
                                        let v49 = "2" == v47
                                        case v49 {
                                            True -> {
                                                case v48  {
                                                    Uh3Cons(v50, v51) -> {
                                                        let v52 = "tweets" == v50
                                                        case v52 {
                                                            True -> {
                                                                case v51  {
                                                                    Uh3Cons(v53, v54) -> {
                                                                        case v54  {
                                                                            Uh3Nil -> {
                                                                                let v55 = v15 == "DELETE"
                                                                                case v55 {
                                                                                    True -> Us2Some(v53)
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
            case v74  {
                Us2None -> {
                    let v92 = { "no route " } <> { v16 }
                    let v94 = erlang_term_coerce("Not Found Error")
                    let v95 = erlang_term_coerce(v92)
                    let v97 = erlang_term_coerce("about:blank")
                    let v98 = erlang_term_coerce(404)
                    let v100 = atom.create("status")
                    let v101 = erlang_term_coerce(v100)
                    let v102 = []
                    let v103 = [v98, ..v102]
                    let v104 = [v101, ..v103]
                    let v105 = erlang_term_tuple(v104)
                    let v107 = atom.create("type")
                    let v108 = erlang_term_coerce(v107)
                    let v109 = []
                    let v110 = [v97, ..v109]
                    let v111 = [v108, ..v110]
                    let v112 = erlang_term_tuple(v111)
                    let v114 = atom.create("detail")
                    let v115 = erlang_term_coerce(v114)
                    let v116 = []
                    let v117 = [v95, ..v116]
                    let v118 = [v115, ..v117]
                    let v119 = erlang_term_tuple(v118)
                    let v121 = atom.create("title")
                    let v122 = erlang_term_coerce(v121)
                    let v123 = []
                    let v124 = [v94, ..v123]
                    let v125 = [v122, ..v124]
                    let v126 = erlang_term_tuple(v125)
                    let v127 = []
                    let v128 = [v105, ..v127]
                    let v129 = [v112, ..v128]
                    let v130 = [v119, ..v129]
                    let v131 = [v126, ..v130]
                    let v132 = erlang_term_coerce(v131)
                    let v134 = atom.create("maps")
                    let v136 = atom.create("from_list")
                    let v137 = []
                    let v138 = [v132, ..v137]
                    let v139 = erlang_term_apply(v134, v136, v138)
                    let v141 = atom.create("json")
                    let v143 = atom.create("encode")
                    let v144 = []
                    let v145 = [v139, ..v144]
                    let v146 = erlang_term_apply(v141, v143, v145)
                    let v147 = "erlang"
                    let v148 = atom.create(v147)
                    let v150 = atom.create("iolist_to_binary")
                    let v151 = []
                    let v152 = [v146, ..v151]
                    let v153 = erlang_term_apply(v148, v150, v152)
                    let v154 = erlang_term_coerce(v153)
                    let v155 = int.to_string(404)
                    let v156 = { "HTTP/1.1 " } <> { v155 }
                    let v157 = { v156 } <> { " " }
                    let v158 = { v157 } <> { "Not Found" }
                    let v159 = erlang_term_coerce(v154)
                    let v160 = atom.create(v147)
                    let v162 = atom.create("byte_size")
                    let v163 = []
                    let v164 = [v159, ..v163]
                    let v165 = erlang_term_apply(v160, v162, v164)
                    let v166 = erlang_term_coerce(v165)
                    let v167 = int.to_string(v166)
                    let v168 = { "\r\nContent-Length: " } <> { v167 }
                    let v169 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v168 }
                    let v170 = { v169 } <> { "\r\nConnection: close\r\n\r\n" }
                    let v171 = { v158 } <> { v170 }
                    let v172 = { v171 } <> { v154 }
                    #(v172, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
                }
                Us2Some(v75) -> removed_671(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v75)
            }
        }
    }
}

pub fn user_write_664(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: Us112) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    case v20  {
        Us112OAuth1User -> post_or_delete_665(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
        Us112UserBearer -> post_or_delete_665(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
    }
}

pub fn change_reply_663(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: Us112) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    user_write_664(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20)
}

pub fn reply_as_661(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: String, v21: Us112) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    let v25 =
        case v21  {
            Us112OAuth1User -> {
                "oauth1"
            }
            Us112UserBearer -> {
                "user"
            }
        }
    logged_542(v15, v16, v17, v18, v19, v20, v25)
    let v26 = { "xsim serve / answered " } <> { v16 }
    let v27 = { v26 } <> { " " }
    let v28 = { v27 } <> { v17 }
    let v29 = { v28 } <> { "\n" }
    let v31 = atom.create("standard_error")
    let v32 = erlang_term_coerce(v31)
    let v33 = erlang_term_coerce(v29)
    let v35 = atom.create("io")
    let v37 = atom.create("put_chars")
    let v38 = []
    let v39 = [v33, ..v38]
    let v40 = [v32, ..v39]
    let _v41 = erlang_term_apply(v35, v37, v40)
    let v42 = v16 == "GET"
    case v42 {
        True -> {
            let v43 = answer_662(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v16, v17, v18, v19, v20, v21)
            #(v43, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
        }
        False -> change_reply_663(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v16, v17, v18, v19, v20, v21)
    }
}

pub fn answer_674(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, _v20: Us113) -> String {
    routed_547(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
}

pub fn issued_next_677(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    let v15 = ""
    let v16 = erlang_term_coerce(v15)
    let v17 = "oauth2"
    let v18 = erlang_term_coerce(v17)
    let v19 = erlang_term_coerce(v16)
    let v20 = "maps"
    let v21 = atom.create(v20)
    let v22 = "get"
    let v23 = atom.create(v22)
    let v24 = []
    let v25 = [v19, ..v24]
    let v26 = [v7, ..v25]
    let v27 = [v18, ..v26]
    let v28 = erlang_term_apply(v21, v23, v27)
    let v29 = erlang_term_coerce(v28)
    let v30 = erlang_term_coerce(v15)
    let v31 = "refresh_token"
    let v32 = erlang_term_coerce(v31)
    let v33 = erlang_term_coerce(v30)
    let v34 = atom.create(v20)
    let v35 = atom.create(v22)
    let v36 = []
    let v37 = [v33, ..v36]
    let v38 = [v29, ..v37]
    let v39 = [v32, ..v38]
    let v40 = erlang_term_apply(v34, v35, v39)
    let v41 = erlang_term_coerce(v40)
    let v42 = erlang_term_coerce(v41)
    let v43 = { v42 } <> { "-" }
    let v45 = method20(v8, 0)
    let v46 = int.to_string(v45)
    let v47 = { v43 } <> { v46 }
    let v48 = erlang_term_coerce(v15)
    let v49 = erlang_term_coerce(v17)
    let v50 = erlang_term_coerce(v48)
    let v51 = atom.create(v20)
    let v52 = atom.create(v22)
    let v53 = []
    let v54 = [v50, ..v53]
    let v55 = [v7, ..v54]
    let v56 = [v49, ..v55]
    let v57 = erlang_term_apply(v51, v52, v56)
    let v58 = erlang_term_coerce(v57)
    let v59 = erlang_term_coerce(v15)
    let v60 = "access_token"
    let v61 = erlang_term_coerce(v60)
    let v62 = erlang_term_coerce(v59)
    let v63 = atom.create(v20)
    let v64 = atom.create(v22)
    let v65 = []
    let v66 = [v62, ..v65]
    let v67 = [v58, ..v66]
    let v68 = [v61, ..v67]
    let v69 = erlang_term_apply(v63, v64, v68)
    let v70 = erlang_term_coerce(v69)
    let v71 = erlang_term_coerce(v70)
    let v72 = { v71 } <> { "-" }
    let v74 = method20(v8, 0)
    let v75 = int.to_string(v74)
    let v76 = { v72 } <> { v75 }
    let v78 = erlang_term_coerce("tweet.read tweet.write users.read offline.access")
    let v79 = erlang_term_coerce(v47)
    let v81 = erlang_term_coerce("bearer")
    let v82 = erlang_term_coerce(7200)
    let v83 = erlang_term_coerce(v76)
    let v84 = atom.create(v31)
    let v85 = erlang_term_coerce(v84)
    let v86 = []
    let v87 = [v79, ..v86]
    let v88 = [v85, ..v87]
    let v89 = erlang_term_tuple(v88)
    let v91 = atom.create("scope")
    let v92 = erlang_term_coerce(v91)
    let v93 = []
    let v94 = [v78, ..v93]
    let v95 = [v92, ..v94]
    let v96 = erlang_term_tuple(v95)
    let v97 = atom.create(v60)
    let v98 = erlang_term_coerce(v97)
    let v99 = []
    let v100 = [v83, ..v99]
    let v101 = [v98, ..v100]
    let v102 = erlang_term_tuple(v101)
    let v104 = atom.create("expires_in")
    let v105 = erlang_term_coerce(v104)
    let v106 = []
    let v107 = [v82, ..v106]
    let v108 = [v105, ..v107]
    let v109 = erlang_term_tuple(v108)
    let v111 = atom.create("token_type")
    let v112 = erlang_term_coerce(v111)
    let v113 = []
    let v114 = [v81, ..v113]
    let v115 = [v112, ..v114]
    let v116 = erlang_term_tuple(v115)
    let v117 = []
    let v118 = [v89, ..v117]
    let v119 = [v96, ..v118]
    let v120 = [v102, ..v119]
    let v121 = [v109, ..v120]
    let v122 = [v116, ..v121]
    let v123 = erlang_term_coerce(v122)
    let v124 = atom.create(v20)
    let v126 = atom.create("from_list")
    let v127 = []
    let v128 = [v123, ..v127]
    let v129 = erlang_term_apply(v124, v126, v128)
    let v131 = atom.create("json")
    let v133 = atom.create("encode")
    let v134 = []
    let v135 = [v129, ..v134]
    let v136 = erlang_term_apply(v131, v133, v135)
    let v137 = "erlang"
    let v138 = atom.create(v137)
    let v140 = atom.create("iolist_to_binary")
    let v141 = []
    let v142 = [v136, ..v141]
    let v143 = erlang_term_apply(v138, v140, v142)
    let v144 = erlang_term_coerce(v143)
    let v145 = int.to_string(200)
    let v146 = { "HTTP/1.1 " } <> { v145 }
    let v147 = { v146 } <> { " " }
    let v148 = { v147 } <> { "OK" }
    let v149 = erlang_term_coerce(v144)
    let v150 = atom.create(v137)
    let v152 = atom.create("byte_size")
    let v153 = []
    let v154 = [v149, ..v153]
    let v155 = erlang_term_apply(v150, v152, v154)
    let v156 = erlang_term_coerce(v155)
    let v157 = int.to_string(v156)
    let v158 = { "\r\nContent-Length: " } <> { v157 }
    let v159 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v158 }
    let v160 = { v159 } <> { "\r\nConnection: close\r\n\r\n" }
    let v161 = { v148 } <> { v160 }
    let v162 = { v161 } <> { v144 }
    let v163 = Uh3Cons(v47, v8)
    #(v162, v0, v1, v2, v3, v4, v5, v6, v7, v163, v9, v10, v11, v12, v13, v14)
}
