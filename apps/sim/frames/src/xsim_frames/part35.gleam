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
import xsim_frames/part28.{logged_540}
import xsim_frames/part34.{answer_660, method666, posted_667, routed_545, units_of_665}

pub fn new_post_664(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, _v14: String, _v15: String, _v16: String, _v17: String, v18: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
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
    let v46 = v45 == ""
    let v86 =
        case v46 {
            True -> {
                let v48 = atom.create("maps")
                let v50 = atom.create("new")
                let v51 = []
                erlang_term_apply(v48, v50, v51)
            }
            False -> {
                let v53 = option.from_result(result.map(string.split_once(v18, v19), pair.first))
                let v54 = v53 |> option.map(v21)
                let v56 = v54 |> option.unwrap(Us2None)
                let v60 =
                    case v56  {
                        Us2None -> -1
                        Us2Some(v57) -> {
                            bit_array.byte_size(bit_array.from_string(v57))
                        }
                    }
                let v61 = spiral_wrap_signed(v60 + 4, 32)
                let v62 = option.from_result(result.map(string.split_once(v18, v19), pair.first))
                let v63 = v62 |> option.map(v21)
                let v65 = v63 |> option.unwrap(Us2None)
                let v69 =
                    case v65  {
                        Us2None -> -1
                        Us2Some(v66) -> {
                            bit_array.byte_size(bit_array.from_string(v66))
                        }
                    }
                let v70 = v69 < 0
                let v77 =
                    case v70 {
                        True -> {
                            ""
                        }
                        False -> {
                            let v72 = spiral_string_length(v18)
                            let v73 = spiral_wrap_signed(v72 - v61, 32)
                            let v74 = spiral_wrap_signed(v61 + v73, 32)
                            let v75 = spiral_wrap_signed(v74 - 1, 32)
                            spiral_string_slice(v18, v61, v75)
                        }
                    }
                let v78 = erlang_term_coerce(v77)
                let v80 = atom.create("json")
                let v82 = atom.create("decode")
                let v83 = []
                let v84 = [v78, ..v83]
                erlang_term_apply(v80, v82, v84)
            }
        }
    let v87 = ""
    let v88 = erlang_term_coerce(v87)
    let v90 = erlang_term_coerce("text")
    let v91 = erlang_term_coerce(v88)
    let v92 = "maps"
    let v93 = atom.create(v92)
    let v94 = "get"
    let v95 = atom.create(v94)
    let v96 = []
    let v97 = [v91, ..v96]
    let v98 = [v86, ..v97]
    let v99 = [v90, ..v98]
    let v100 = erlang_term_apply(v93, v95, v99)
    let v101 = erlang_term_coerce(v100)
    let v102 = erlang_term_coerce(v101)
    let v103 = erlang_term_coerce(v102)
    let v105 = atom.create("trailing")
    let v106 = erlang_term_coerce(v105)
    let v108 = atom.create("string")
    let v110 = atom.create("trim")
    let v111 = []
    let v112 = [v106, ..v111]
    let v113 = [v103, ..v112]
    let v114 = erlang_term_apply(v108, v110, v113)
    let v115 = erlang_term_coerce(v114)
    let v116 = atom.create(v92)
    let v118 = atom.create("new")
    let v119 = []
    let v120 = erlang_term_apply(v116, v118, v119)
    let v122 = erlang_term_coerce("reply")
    let v123 = erlang_term_coerce(v120)
    let v124 = atom.create(v92)
    let v125 = atom.create(v94)
    let v126 = []
    let v127 = [v123, ..v126]
    let v128 = [v86, ..v127]
    let v129 = [v122, ..v128]
    let v130 = erlang_term_apply(v124, v125, v129)
    let v131 = erlang_term_coerce(v130)
    let v132 = "in_reply_to_tweet_id"
    let v133 = erlang_term_coerce(v132)
    let v134 = atom.create(v92)
    let v136 = atom.create("is_key")
    let v137 = []
    let v138 = [v131, ..v137]
    let v139 = [v133, ..v138]
    let v140 = erlang_term_apply(v134, v136, v139)
    let v141 = erlang_term_coerce(v140)
    let v170 =
        case v141 {
            True -> {
                let v142 = erlang_term_coerce(v87)
                let v143 = erlang_term_coerce(v132)
                let v144 = erlang_term_coerce(v142)
                let v145 = atom.create(v92)
                let v146 = atom.create(v94)
                let v147 = []
                let v148 = [v144, ..v147]
                let v149 = [v131, ..v148]
                let v150 = [v143, ..v149]
                let v151 = erlang_term_apply(v145, v146, v150)
                let v152 = erlang_term_coerce(v151)
                let v153 = "erlang"
                let v154 = atom.create(v153)
                let v156 = atom.create("is_binary")
                let v157 = []
                let v158 = [v152, ..v157]
                let v159 = erlang_term_apply(v154, v156, v158)
                let v160 = erlang_term_coerce(v159)
                case v160 {
                    True -> {
                        erlang_term_coerce(v152)
                    }
                    False -> {
                        let v162 = atom.create(v153)
                        let v164 = atom.create("integer_to_binary")
                        let v165 = []
                        let v166 = [v152, ..v165]
                        let v167 = erlang_term_apply(v162, v164, v166)
                        erlang_term_coerce(v167)
                    }
                }
            }
            False -> v87
        }
    let v171 = v115 == ""
    let v176 =
        case v171 {
            True -> True
            False -> {
                let v172 = units_of_665(v115)
                let v174 = method666(v172, 0)
                v174 > 280
            }
        }
    case v176 {
        True -> {
            let v178 = erlang_term_coerce("Invalid Request")
            let v180 = erlang_term_coerce("text must be 1 to 280 characters")
            let v182 = erlang_term_coerce("about:blank")
            let v183 = erlang_term_coerce(400)
            let v185 = atom.create("status")
            let v186 = erlang_term_coerce(v185)
            let v187 = []
            let v188 = [v183, ..v187]
            let v189 = [v186, ..v188]
            let v190 = erlang_term_tuple(v189)
            let v192 = atom.create("type")
            let v193 = erlang_term_coerce(v192)
            let v194 = []
            let v195 = [v182, ..v194]
            let v196 = [v193, ..v195]
            let v197 = erlang_term_tuple(v196)
            let v199 = atom.create("detail")
            let v200 = erlang_term_coerce(v199)
            let v201 = []
            let v202 = [v180, ..v201]
            let v203 = [v200, ..v202]
            let v204 = erlang_term_tuple(v203)
            let v206 = atom.create("title")
            let v207 = erlang_term_coerce(v206)
            let v208 = []
            let v209 = [v178, ..v208]
            let v210 = [v207, ..v209]
            let v211 = erlang_term_tuple(v210)
            let v212 = []
            let v213 = [v190, ..v212]
            let v214 = [v197, ..v213]
            let v215 = [v204, ..v214]
            let v216 = [v211, ..v215]
            let v217 = erlang_term_coerce(v216)
            let v218 = atom.create(v92)
            let v220 = atom.create("from_list")
            let v221 = []
            let v222 = [v217, ..v221]
            let v223 = erlang_term_apply(v218, v220, v222)
            let v225 = atom.create("json")
            let v227 = atom.create("encode")
            let v228 = []
            let v229 = [v223, ..v228]
            let v230 = erlang_term_apply(v225, v227, v229)
            let v231 = "erlang"
            let v232 = atom.create(v231)
            let v234 = atom.create("iolist_to_binary")
            let v235 = []
            let v236 = [v230, ..v235]
            let v237 = erlang_term_apply(v232, v234, v236)
            let v238 = erlang_term_coerce(v237)
            let v239 = int.to_string(400)
            let v240 = { "HTTP/1.1 " } <> { v239 }
            let v241 = { v240 } <> { " " }
            let v242 = { v241 } <> { "Bad Request" }
            let v243 = erlang_term_coerce(v238)
            let v244 = atom.create(v231)
            let v246 = atom.create("byte_size")
            let v247 = []
            let v248 = [v243, ..v247]
            let v249 = erlang_term_apply(v244, v246, v248)
            let v250 = erlang_term_coerce(v249)
            let v251 = int.to_string(v250)
            let v252 = { "\r\nContent-Length: " } <> { v251 }
            let v253 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v252 }
            let v254 = { v253 } <> { "\r\nConnection: close\r\n\r\n" }
            let v255 = { v242 } <> { v254 }
            let v256 = { v255 } <> { v238 }
            #(v256, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
        }
        False -> {
            let v257 = v170 != ""
            let v260 =
                case v257 {
                    True -> {
                        let v258 = dict.has_key(v5, v170)
                        v258 == False
                    }
                    False -> False
                }
            case v260 {
                True -> {
                    let v261 = { "in_reply_to_tweet_id " } <> { v170 }
                    let v262 = { v261 } <> { " does not exist" }
                    let v264 = erlang_term_coerce("Invalid Request")
                    let v265 = erlang_term_coerce(v262)
                    let v267 = erlang_term_coerce("about:blank")
                    let v268 = erlang_term_coerce(400)
                    let v270 = atom.create("status")
                    let v271 = erlang_term_coerce(v270)
                    let v272 = []
                    let v273 = [v268, ..v272]
                    let v274 = [v271, ..v273]
                    let v275 = erlang_term_tuple(v274)
                    let v277 = atom.create("type")
                    let v278 = erlang_term_coerce(v277)
                    let v279 = []
                    let v280 = [v267, ..v279]
                    let v281 = [v278, ..v280]
                    let v282 = erlang_term_tuple(v281)
                    let v284 = atom.create("detail")
                    let v285 = erlang_term_coerce(v284)
                    let v286 = []
                    let v287 = [v265, ..v286]
                    let v288 = [v285, ..v287]
                    let v289 = erlang_term_tuple(v288)
                    let v291 = atom.create("title")
                    let v292 = erlang_term_coerce(v291)
                    let v293 = []
                    let v294 = [v264, ..v293]
                    let v295 = [v292, ..v294]
                    let v296 = erlang_term_tuple(v295)
                    let v297 = []
                    let v298 = [v275, ..v297]
                    let v299 = [v282, ..v298]
                    let v300 = [v289, ..v299]
                    let v301 = [v296, ..v300]
                    let v302 = erlang_term_coerce(v301)
                    let v303 = atom.create(v92)
                    let v305 = atom.create("from_list")
                    let v306 = []
                    let v307 = [v302, ..v306]
                    let v308 = erlang_term_apply(v303, v305, v307)
                    let v310 = atom.create("json")
                    let v312 = atom.create("encode")
                    let v313 = []
                    let v314 = [v308, ..v313]
                    let v315 = erlang_term_apply(v310, v312, v314)
                    let v316 = "erlang"
                    let v317 = atom.create(v316)
                    let v319 = atom.create("iolist_to_binary")
                    let v320 = []
                    let v321 = [v315, ..v320]
                    let v322 = erlang_term_apply(v317, v319, v321)
                    let v323 = erlang_term_coerce(v322)
                    let v324 = int.to_string(400)
                    let v325 = { "HTTP/1.1 " } <> { v324 }
                    let v326 = { v325 } <> { " " }
                    let v327 = { v326 } <> { "Bad Request" }
                    let v328 = erlang_term_coerce(v323)
                    let v329 = atom.create(v316)
                    let v331 = atom.create("byte_size")
                    let v332 = []
                    let v333 = [v328, ..v332]
                    let v334 = erlang_term_apply(v329, v331, v333)
                    let v335 = erlang_term_coerce(v334)
                    let v336 = int.to_string(v335)
                    let v337 = { "\r\nContent-Length: " } <> { v336 }
                    let v338 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v337 }
                    let v339 = { v338 } <> { "\r\nConnection: close\r\n\r\n" }
                    let v340 = { v327 } <> { v339 }
                    let v341 = { v340 } <> { v323 }
                    #(v341, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
                }
                False -> posted_667(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v115, v170)
            }
        }
    }
}

pub fn removed_669(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let v15 = dict.has_key(v10, v14)
    case v15 {
        True -> {
            let v16 = erlang_term_coerce(True)
            let v18 = atom.create("deleted")
            let v19 = erlang_term_coerce(v18)
            let v20 = []
            let v21 = [v16, ..v20]
            let v22 = [v19, ..v21]
            let v23 = erlang_term_tuple(v22)
            let v24 = []
            let v25 = [v23, ..v24]
            let v26 = erlang_term_coerce(v25)
            let v27 = "maps"
            let v28 = atom.create(v27)
            let v29 = "from_list"
            let v30 = atom.create(v29)
            let v31 = []
            let v32 = [v26, ..v31]
            let v33 = erlang_term_apply(v28, v30, v32)
            let v35 = atom.create("data")
            let v36 = erlang_term_coerce(v35)
            let v37 = []
            let v38 = [v33, ..v37]
            let v39 = [v36, ..v38]
            let v40 = erlang_term_tuple(v39)
            let v41 = []
            let v42 = [v40, ..v41]
            let v43 = erlang_term_coerce(v42)
            let v44 = atom.create(v27)
            let v45 = atom.create(v29)
            let v46 = []
            let v47 = [v43, ..v46]
            let v48 = erlang_term_apply(v44, v45, v47)
            let v50 = atom.create("json")
            let v52 = atom.create("encode")
            let v53 = []
            let v54 = [v48, ..v53]
            let v55 = erlang_term_apply(v50, v52, v54)
            let v56 = "erlang"
            let v57 = atom.create(v56)
            let v59 = atom.create("iolist_to_binary")
            let v60 = []
            let v61 = [v55, ..v60]
            let v62 = erlang_term_apply(v57, v59, v61)
            let v63 = erlang_term_coerce(v62)
            let v64 = int.to_string(200)
            let v65 = { "HTTP/1.1 " } <> { v64 }
            let v66 = { v65 } <> { " " }
            let v67 = { v66 } <> { "OK" }
            let v68 = erlang_term_coerce(v63)
            let v69 = atom.create(v56)
            let v71 = atom.create("byte_size")
            let v72 = []
            let v73 = [v68, ..v72]
            let v74 = erlang_term_apply(v69, v71, v73)
            let v75 = erlang_term_coerce(v74)
            let v76 = int.to_string(v75)
            let v77 = { "\r\nContent-Length: " } <> { v76 }
            let v78 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v77 }
            let v79 = { v78 } <> { "\r\nConnection: close\r\n\r\n" }
            let v80 = { v67 } <> { v79 }
            let v81 = { v80 } <> { v63 }
            let v82 = dict.delete(v10, v14)
            let v83 = dict.delete(v5, v14)
            #(v81, v0, v1, v2, v3, v4, v83, v6, v7, v8, v9, v82, v11, v12, v13)
        }
        False -> {
            let v84 = { "Could not find post with id: [" } <> { v14 }
            let v85 = { v84 } <> { "]." }
            let v87 = erlang_term_coerce("Not Found Error")
            let v88 = erlang_term_coerce(v85)
            let v90 = erlang_term_coerce("about:blank")
            let v91 = erlang_term_coerce(404)
            let v93 = atom.create("status")
            let v94 = erlang_term_coerce(v93)
            let v95 = []
            let v96 = [v91, ..v95]
            let v97 = [v94, ..v96]
            let v98 = erlang_term_tuple(v97)
            let v100 = atom.create("type")
            let v101 = erlang_term_coerce(v100)
            let v102 = []
            let v103 = [v90, ..v102]
            let v104 = [v101, ..v103]
            let v105 = erlang_term_tuple(v104)
            let v107 = atom.create("detail")
            let v108 = erlang_term_coerce(v107)
            let v109 = []
            let v110 = [v88, ..v109]
            let v111 = [v108, ..v110]
            let v112 = erlang_term_tuple(v111)
            let v114 = atom.create("title")
            let v115 = erlang_term_coerce(v114)
            let v116 = []
            let v117 = [v87, ..v116]
            let v118 = [v115, ..v117]
            let v119 = erlang_term_tuple(v118)
            let v120 = []
            let v121 = [v98, ..v120]
            let v122 = [v105, ..v121]
            let v123 = [v112, ..v122]
            let v124 = [v119, ..v123]
            let v125 = erlang_term_coerce(v124)
            let v127 = atom.create("maps")
            let v129 = atom.create("from_list")
            let v130 = []
            let v131 = [v125, ..v130]
            let v132 = erlang_term_apply(v127, v129, v131)
            let v134 = atom.create("json")
            let v136 = atom.create("encode")
            let v137 = []
            let v138 = [v132, ..v137]
            let v139 = erlang_term_apply(v134, v136, v138)
            let v140 = "erlang"
            let v141 = atom.create(v140)
            let v143 = atom.create("iolist_to_binary")
            let v144 = []
            let v145 = [v139, ..v144]
            let v146 = erlang_term_apply(v141, v143, v145)
            let v147 = erlang_term_coerce(v146)
            let v148 = int.to_string(404)
            let v149 = { "HTTP/1.1 " } <> { v148 }
            let v150 = { v149 } <> { " " }
            let v151 = { v150 } <> { "Not Found" }
            let v152 = erlang_term_coerce(v147)
            let v153 = atom.create(v140)
            let v155 = atom.create("byte_size")
            let v156 = []
            let v157 = [v152, ..v156]
            let v158 = erlang_term_apply(v153, v155, v157)
            let v159 = erlang_term_coerce(v158)
            let v160 = int.to_string(v159)
            let v161 = { "\r\nContent-Length: " } <> { v160 }
            let v162 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v161 }
            let v163 = { v162 } <> { "\r\nConnection: close\r\n\r\n" }
            let v164 = { v151 } <> { v163 }
            let v165 = { v164 } <> { v147 }
            #(v165, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
        }
    }
}

pub fn post_or_delete_663(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let v19 = v14 == "POST"
    let v21 =
        case v19 {
            True -> {
                v15 == "/2/tweets"
            }
            False -> False
        }
    case v21 {
        True -> new_post_664(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
        False -> {
            let v37 = v15 == ""
            let v41 =
                case v37 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2("/", v15)
                    }
                }
            let v72 =
                case v41  {
                    Uh3Cons(v42, v43) -> {
                        let v44 = "" == v42
                        case v44 {
                            True -> {
                                case v43  {
                                    Uh3Cons(v45, v46) -> {
                                        let v47 = "2" == v45
                                        case v47 {
                                            True -> {
                                                case v46  {
                                                    Uh3Cons(v48, v49) -> {
                                                        let v50 = "tweets" == v48
                                                        case v50 {
                                                            True -> {
                                                                case v49  {
                                                                    Uh3Cons(v51, v52) -> {
                                                                        case v52  {
                                                                            Uh3Nil -> {
                                                                                let v53 = v14 == "DELETE"
                                                                                case v53 {
                                                                                    True -> Us2Some(v51)
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
            case v72  {
                Us2None -> {
                    let v89 = { "no route " } <> { v15 }
                    let v91 = erlang_term_coerce("Not Found Error")
                    let v92 = erlang_term_coerce(v89)
                    let v94 = erlang_term_coerce("about:blank")
                    let v95 = erlang_term_coerce(404)
                    let v97 = atom.create("status")
                    let v98 = erlang_term_coerce(v97)
                    let v99 = []
                    let v100 = [v95, ..v99]
                    let v101 = [v98, ..v100]
                    let v102 = erlang_term_tuple(v101)
                    let v104 = atom.create("type")
                    let v105 = erlang_term_coerce(v104)
                    let v106 = []
                    let v107 = [v94, ..v106]
                    let v108 = [v105, ..v107]
                    let v109 = erlang_term_tuple(v108)
                    let v111 = atom.create("detail")
                    let v112 = erlang_term_coerce(v111)
                    let v113 = []
                    let v114 = [v92, ..v113]
                    let v115 = [v112, ..v114]
                    let v116 = erlang_term_tuple(v115)
                    let v118 = atom.create("title")
                    let v119 = erlang_term_coerce(v118)
                    let v120 = []
                    let v121 = [v91, ..v120]
                    let v122 = [v119, ..v121]
                    let v123 = erlang_term_tuple(v122)
                    let v124 = []
                    let v125 = [v102, ..v124]
                    let v126 = [v109, ..v125]
                    let v127 = [v116, ..v126]
                    let v128 = [v123, ..v127]
                    let v129 = erlang_term_coerce(v128)
                    let v131 = atom.create("maps")
                    let v133 = atom.create("from_list")
                    let v134 = []
                    let v135 = [v129, ..v134]
                    let v136 = erlang_term_apply(v131, v133, v135)
                    let v138 = atom.create("json")
                    let v140 = atom.create("encode")
                    let v141 = []
                    let v142 = [v136, ..v141]
                    let v143 = erlang_term_apply(v138, v140, v142)
                    let v144 = "erlang"
                    let v145 = atom.create(v144)
                    let v147 = atom.create("iolist_to_binary")
                    let v148 = []
                    let v149 = [v143, ..v148]
                    let v150 = erlang_term_apply(v145, v147, v149)
                    let v151 = erlang_term_coerce(v150)
                    let v152 = int.to_string(404)
                    let v153 = { "HTTP/1.1 " } <> { v152 }
                    let v154 = { v153 } <> { " " }
                    let v155 = { v154 } <> { "Not Found" }
                    let v156 = erlang_term_coerce(v151)
                    let v157 = atom.create(v144)
                    let v159 = atom.create("byte_size")
                    let v160 = []
                    let v161 = [v156, ..v160]
                    let v162 = erlang_term_apply(v157, v159, v161)
                    let v163 = erlang_term_coerce(v162)
                    let v164 = int.to_string(v163)
                    let v165 = { "\r\nContent-Length: " } <> { v164 }
                    let v166 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v165 }
                    let v167 = { v166 } <> { "\r\nConnection: close\r\n\r\n" }
                    let v168 = { v155 } <> { v167 }
                    let v169 = { v168 } <> { v151 }
                    #(v169, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
                }
                Us2Some(v73) -> removed_669(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v73)
            }
        }
    }
}

pub fn user_write_662(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: Us112) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    case v19  {
        Us112OAuth1User -> post_or_delete_663(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
        Us112UserBearer -> post_or_delete_663(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
    }
}

pub fn change_reply_661(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: Us112) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    user_write_662(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
}

pub fn reply_as_659(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: Us112) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let v24 =
        case v20  {
            Us112OAuth1User -> {
                "oauth1"
            }
            Us112UserBearer -> {
                "user"
            }
        }
    logged_540(v14, v15, v16, v17, v18, v19, v24)
    let v25 = { "xsim serve / answered " } <> { v15 }
    let v26 = { v25 } <> { " " }
    let v27 = { v26 } <> { v16 }
    let v28 = { v27 } <> { "\n" }
    let v30 = atom.create("standard_error")
    let v31 = erlang_term_coerce(v30)
    let v32 = erlang_term_coerce(v28)
    let v34 = atom.create("io")
    let v36 = atom.create("put_chars")
    let v37 = []
    let v38 = [v32, ..v37]
    let v39 = [v31, ..v38]
    let _v40 = erlang_term_apply(v34, v36, v39)
    let v41 = v15 == "GET"
    case v41 {
        True -> {
            let v42 = answer_660(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v15, v16, v17, v18, v19, v20)
            #(v42, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
        }
        False -> change_reply_661(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v15, v16, v17, v18, v19, v20)
    }
}

pub fn answer_672(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, _v19: Us113) -> String {
    routed_545(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
}

pub fn issued_next_675(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let v14 = ""
    let v15 = erlang_term_coerce(v14)
    let v16 = "oauth2"
    let v17 = erlang_term_coerce(v16)
    let v18 = erlang_term_coerce(v15)
    let v19 = "maps"
    let v20 = atom.create(v19)
    let v21 = "get"
    let v22 = atom.create(v21)
    let v23 = []
    let v24 = [v18, ..v23]
    let v25 = [v7, ..v24]
    let v26 = [v17, ..v25]
    let v27 = erlang_term_apply(v20, v22, v26)
    let v28 = erlang_term_coerce(v27)
    let v29 = erlang_term_coerce(v14)
    let v30 = "refresh_token"
    let v31 = erlang_term_coerce(v30)
    let v32 = erlang_term_coerce(v29)
    let v33 = atom.create(v19)
    let v34 = atom.create(v21)
    let v35 = []
    let v36 = [v32, ..v35]
    let v37 = [v28, ..v36]
    let v38 = [v31, ..v37]
    let v39 = erlang_term_apply(v33, v34, v38)
    let v40 = erlang_term_coerce(v39)
    let v41 = erlang_term_coerce(v40)
    let v42 = { v41 } <> { "-" }
    let v44 = method20(v8, 0)
    let v45 = int.to_string(v44)
    let v46 = { v42 } <> { v45 }
    let v47 = erlang_term_coerce(v14)
    let v48 = erlang_term_coerce(v16)
    let v49 = erlang_term_coerce(v47)
    let v50 = atom.create(v19)
    let v51 = atom.create(v21)
    let v52 = []
    let v53 = [v49, ..v52]
    let v54 = [v7, ..v53]
    let v55 = [v48, ..v54]
    let v56 = erlang_term_apply(v50, v51, v55)
    let v57 = erlang_term_coerce(v56)
    let v58 = erlang_term_coerce(v14)
    let v59 = "access_token"
    let v60 = erlang_term_coerce(v59)
    let v61 = erlang_term_coerce(v58)
    let v62 = atom.create(v19)
    let v63 = atom.create(v21)
    let v64 = []
    let v65 = [v61, ..v64]
    let v66 = [v57, ..v65]
    let v67 = [v60, ..v66]
    let v68 = erlang_term_apply(v62, v63, v67)
    let v69 = erlang_term_coerce(v68)
    let v70 = erlang_term_coerce(v69)
    let v71 = { v70 } <> { "-" }
    let v73 = method20(v8, 0)
    let v74 = int.to_string(v73)
    let v75 = { v71 } <> { v74 }
    let v77 = erlang_term_coerce("tweet.read tweet.write users.read offline.access")
    let v78 = erlang_term_coerce(v46)
    let v80 = erlang_term_coerce("bearer")
    let v81 = erlang_term_coerce(7200)
    let v82 = erlang_term_coerce(v75)
    let v83 = atom.create(v30)
    let v84 = erlang_term_coerce(v83)
    let v85 = []
    let v86 = [v78, ..v85]
    let v87 = [v84, ..v86]
    let v88 = erlang_term_tuple(v87)
    let v90 = atom.create("scope")
    let v91 = erlang_term_coerce(v90)
    let v92 = []
    let v93 = [v77, ..v92]
    let v94 = [v91, ..v93]
    let v95 = erlang_term_tuple(v94)
    let v96 = atom.create(v59)
    let v97 = erlang_term_coerce(v96)
    let v98 = []
    let v99 = [v82, ..v98]
    let v100 = [v97, ..v99]
    let v101 = erlang_term_tuple(v100)
    let v103 = atom.create("expires_in")
    let v104 = erlang_term_coerce(v103)
    let v105 = []
    let v106 = [v81, ..v105]
    let v107 = [v104, ..v106]
    let v108 = erlang_term_tuple(v107)
    let v110 = atom.create("token_type")
    let v111 = erlang_term_coerce(v110)
    let v112 = []
    let v113 = [v80, ..v112]
    let v114 = [v111, ..v113]
    let v115 = erlang_term_tuple(v114)
    let v116 = []
    let v117 = [v88, ..v116]
    let v118 = [v95, ..v117]
    let v119 = [v101, ..v118]
    let v120 = [v108, ..v119]
    let v121 = [v115, ..v120]
    let v122 = erlang_term_coerce(v121)
    let v123 = atom.create(v19)
    let v125 = atom.create("from_list")
    let v126 = []
    let v127 = [v122, ..v126]
    let v128 = erlang_term_apply(v123, v125, v127)
    let v130 = atom.create("json")
    let v132 = atom.create("encode")
    let v133 = []
    let v134 = [v128, ..v133]
    let v135 = erlang_term_apply(v130, v132, v134)
    let v136 = "erlang"
    let v137 = atom.create(v136)
    let v139 = atom.create("iolist_to_binary")
    let v140 = []
    let v141 = [v135, ..v140]
    let v142 = erlang_term_apply(v137, v139, v141)
    let v143 = erlang_term_coerce(v142)
    let v144 = int.to_string(200)
    let v145 = { "HTTP/1.1 " } <> { v144 }
    let v146 = { v145 } <> { " " }
    let v147 = { v146 } <> { "OK" }
    let v148 = erlang_term_coerce(v143)
    let v149 = atom.create(v136)
    let v151 = atom.create("byte_size")
    let v152 = []
    let v153 = [v148, ..v152]
    let v154 = erlang_term_apply(v149, v151, v153)
    let v155 = erlang_term_coerce(v154)
    let v156 = int.to_string(v155)
    let v157 = { "\r\nContent-Length: " } <> { v156 }
    let v158 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v157 }
    let v159 = { v158 } <> { "\r\nConnection: close\r\n\r\n" }
    let v160 = { v147 } <> { v159 }
    let v161 = { v160 } <> { v143 }
    let v162 = Uh3Cons(v46, v8)
    #(v161, v0, v1, v2, v3, v4, v5, v6, v7, v162, v9, v10, v11, v12, v13)
}
