import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh37, type Us111, type Us112, Uh3Cons, Uh3Nil, Us111OAuth1User, Us111UserBearer, Us2None, Us2Some}
import xsim_frames/part1.{closure1, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part2.{method20}
import xsim_frames/part27.{logged_535}
import xsim_frames/part33.{answer_655, method661, posted_662, routed_540, units_of_660}

pub fn new_post_659(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, _v13: String, _v14: String, _v15: String, _v16: String, v17: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
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
    let v45 = v44 == ""
    let v85 =
        case v45 {
            True -> {
                let v47 = atom.create("maps")
                let v49 = atom.create("new")
                let v50 = []
                erlang_term_apply(v47, v49, v50)
            }
            False -> {
                let v52 = option.from_result(result.map(string.split_once(v17, v18), pair.first))
                let v53 = v52 |> option.map(v20)
                let v55 = v53 |> option.unwrap(Us2None)
                let v59 =
                    case v55  {
                        Us2None -> -1
                        Us2Some(v56) -> {
                            bit_array.byte_size(bit_array.from_string(v56))
                        }
                    }
                let v60 = spiral_wrap_signed(v59 + 4, 32)
                let v61 = option.from_result(result.map(string.split_once(v17, v18), pair.first))
                let v62 = v61 |> option.map(v20)
                let v64 = v62 |> option.unwrap(Us2None)
                let v68 =
                    case v64  {
                        Us2None -> -1
                        Us2Some(v65) -> {
                            bit_array.byte_size(bit_array.from_string(v65))
                        }
                    }
                let v69 = v68 < 0
                let v76 =
                    case v69 {
                        True -> {
                            ""
                        }
                        False -> {
                            let v71 = spiral_string_length(v17)
                            let v72 = spiral_wrap_signed(v71 - v60, 32)
                            let v73 = spiral_wrap_signed(v60 + v72, 32)
                            let v74 = spiral_wrap_signed(v73 - 1, 32)
                            spiral_string_slice(v17, v60, v74)
                        }
                    }
                let v77 = erlang_term_coerce(v76)
                let v79 = atom.create("json")
                let v81 = atom.create("decode")
                let v82 = []
                let v83 = [v77, ..v82]
                erlang_term_apply(v79, v81, v83)
            }
        }
    let v86 = ""
    let v87 = erlang_term_coerce(v86)
    let v89 = erlang_term_coerce("text")
    let v90 = erlang_term_coerce(v87)
    let v91 = "maps"
    let v92 = atom.create(v91)
    let v93 = "get"
    let v94 = atom.create(v93)
    let v95 = []
    let v96 = [v90, ..v95]
    let v97 = [v85, ..v96]
    let v98 = [v89, ..v97]
    let v99 = erlang_term_apply(v92, v94, v98)
    let v100 = erlang_term_coerce(v99)
    let v101 = erlang_term_coerce(v100)
    let v102 = erlang_term_coerce(v101)
    let v104 = atom.create("trailing")
    let v105 = erlang_term_coerce(v104)
    let v107 = atom.create("string")
    let v109 = atom.create("trim")
    let v110 = []
    let v111 = [v105, ..v110]
    let v112 = [v102, ..v111]
    let v113 = erlang_term_apply(v107, v109, v112)
    let v114 = erlang_term_coerce(v113)
    let v115 = atom.create(v91)
    let v117 = atom.create("new")
    let v118 = []
    let v119 = erlang_term_apply(v115, v117, v118)
    let v121 = erlang_term_coerce("reply")
    let v122 = erlang_term_coerce(v119)
    let v123 = atom.create(v91)
    let v124 = atom.create(v93)
    let v125 = []
    let v126 = [v122, ..v125]
    let v127 = [v85, ..v126]
    let v128 = [v121, ..v127]
    let v129 = erlang_term_apply(v123, v124, v128)
    let v130 = erlang_term_coerce(v129)
    let v131 = "in_reply_to_tweet_id"
    let v132 = erlang_term_coerce(v131)
    let v133 = atom.create(v91)
    let v135 = atom.create("is_key")
    let v136 = []
    let v137 = [v130, ..v136]
    let v138 = [v132, ..v137]
    let v139 = erlang_term_apply(v133, v135, v138)
    let v140 = erlang_term_coerce(v139)
    let v169 =
        case v140 {
            True -> {
                let v141 = erlang_term_coerce(v86)
                let v142 = erlang_term_coerce(v131)
                let v143 = erlang_term_coerce(v141)
                let v144 = atom.create(v91)
                let v145 = atom.create(v93)
                let v146 = []
                let v147 = [v143, ..v146]
                let v148 = [v130, ..v147]
                let v149 = [v142, ..v148]
                let v150 = erlang_term_apply(v144, v145, v149)
                let v151 = erlang_term_coerce(v150)
                let v152 = "erlang"
                let v153 = atom.create(v152)
                let v155 = atom.create("is_binary")
                let v156 = []
                let v157 = [v151, ..v156]
                let v158 = erlang_term_apply(v153, v155, v157)
                let v159 = erlang_term_coerce(v158)
                case v159 {
                    True -> {
                        erlang_term_coerce(v151)
                    }
                    False -> {
                        let v161 = atom.create(v152)
                        let v163 = atom.create("integer_to_binary")
                        let v164 = []
                        let v165 = [v151, ..v164]
                        let v166 = erlang_term_apply(v161, v163, v165)
                        erlang_term_coerce(v166)
                    }
                }
            }
            False -> v86
        }
    let v170 = v114 == ""
    let v175 =
        case v170 {
            True -> True
            False -> {
                let v171 = units_of_660(v114)
                let v173 = method661(v171, 0)
                v173 > 280
            }
        }
    case v175 {
        True -> {
            let v177 = erlang_term_coerce("Invalid Request")
            let v179 = erlang_term_coerce("text must be 1 to 280 characters")
            let v181 = erlang_term_coerce("about:blank")
            let v182 = erlang_term_coerce(400)
            let v184 = atom.create("status")
            let v185 = erlang_term_coerce(v184)
            let v186 = []
            let v187 = [v182, ..v186]
            let v188 = [v185, ..v187]
            let v189 = erlang_term_tuple(v188)
            let v191 = atom.create("type")
            let v192 = erlang_term_coerce(v191)
            let v193 = []
            let v194 = [v181, ..v193]
            let v195 = [v192, ..v194]
            let v196 = erlang_term_tuple(v195)
            let v198 = atom.create("detail")
            let v199 = erlang_term_coerce(v198)
            let v200 = []
            let v201 = [v179, ..v200]
            let v202 = [v199, ..v201]
            let v203 = erlang_term_tuple(v202)
            let v205 = atom.create("title")
            let v206 = erlang_term_coerce(v205)
            let v207 = []
            let v208 = [v177, ..v207]
            let v209 = [v206, ..v208]
            let v210 = erlang_term_tuple(v209)
            let v211 = []
            let v212 = [v189, ..v211]
            let v213 = [v196, ..v212]
            let v214 = [v203, ..v213]
            let v215 = [v210, ..v214]
            let v216 = erlang_term_coerce(v215)
            let v217 = atom.create(v91)
            let v219 = atom.create("from_list")
            let v220 = []
            let v221 = [v216, ..v220]
            let v222 = erlang_term_apply(v217, v219, v221)
            let v224 = atom.create("json")
            let v226 = atom.create("encode")
            let v227 = []
            let v228 = [v222, ..v227]
            let v229 = erlang_term_apply(v224, v226, v228)
            let v230 = "erlang"
            let v231 = atom.create(v230)
            let v233 = atom.create("iolist_to_binary")
            let v234 = []
            let v235 = [v229, ..v234]
            let v236 = erlang_term_apply(v231, v233, v235)
            let v237 = erlang_term_coerce(v236)
            let v238 = int.to_string(400)
            let v239 = { "HTTP/1.1 " } <> { v238 }
            let v240 = { v239 } <> { " " }
            let v241 = { v240 } <> { "Bad Request" }
            let v242 = erlang_term_coerce(v237)
            let v243 = atom.create(v230)
            let v245 = atom.create("byte_size")
            let v246 = []
            let v247 = [v242, ..v246]
            let v248 = erlang_term_apply(v243, v245, v247)
            let v249 = erlang_term_coerce(v248)
            let v250 = int.to_string(v249)
            let v251 = { "\r\nContent-Length: " } <> { v250 }
            let v252 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v251 }
            let v253 = { v252 } <> { "\r\nConnection: close\r\n\r\n" }
            let v254 = { v241 } <> { v253 }
            let v255 = { v254 } <> { v237 }
            #(v255, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
        }
        False -> {
            let v256 = v169 != ""
            let v259 =
                case v256 {
                    True -> {
                        let v257 = dict.has_key(v5, v169)
                        v257 == False
                    }
                    False -> False
                }
            case v259 {
                True -> {
                    let v260 = { "in_reply_to_tweet_id " } <> { v169 }
                    let v261 = { v260 } <> { " does not exist" }
                    let v263 = erlang_term_coerce("Invalid Request")
                    let v264 = erlang_term_coerce(v261)
                    let v266 = erlang_term_coerce("about:blank")
                    let v267 = erlang_term_coerce(400)
                    let v269 = atom.create("status")
                    let v270 = erlang_term_coerce(v269)
                    let v271 = []
                    let v272 = [v267, ..v271]
                    let v273 = [v270, ..v272]
                    let v274 = erlang_term_tuple(v273)
                    let v276 = atom.create("type")
                    let v277 = erlang_term_coerce(v276)
                    let v278 = []
                    let v279 = [v266, ..v278]
                    let v280 = [v277, ..v279]
                    let v281 = erlang_term_tuple(v280)
                    let v283 = atom.create("detail")
                    let v284 = erlang_term_coerce(v283)
                    let v285 = []
                    let v286 = [v264, ..v285]
                    let v287 = [v284, ..v286]
                    let v288 = erlang_term_tuple(v287)
                    let v290 = atom.create("title")
                    let v291 = erlang_term_coerce(v290)
                    let v292 = []
                    let v293 = [v263, ..v292]
                    let v294 = [v291, ..v293]
                    let v295 = erlang_term_tuple(v294)
                    let v296 = []
                    let v297 = [v274, ..v296]
                    let v298 = [v281, ..v297]
                    let v299 = [v288, ..v298]
                    let v300 = [v295, ..v299]
                    let v301 = erlang_term_coerce(v300)
                    let v302 = atom.create(v91)
                    let v304 = atom.create("from_list")
                    let v305 = []
                    let v306 = [v301, ..v305]
                    let v307 = erlang_term_apply(v302, v304, v306)
                    let v309 = atom.create("json")
                    let v311 = atom.create("encode")
                    let v312 = []
                    let v313 = [v307, ..v312]
                    let v314 = erlang_term_apply(v309, v311, v313)
                    let v315 = "erlang"
                    let v316 = atom.create(v315)
                    let v318 = atom.create("iolist_to_binary")
                    let v319 = []
                    let v320 = [v314, ..v319]
                    let v321 = erlang_term_apply(v316, v318, v320)
                    let v322 = erlang_term_coerce(v321)
                    let v323 = int.to_string(400)
                    let v324 = { "HTTP/1.1 " } <> { v323 }
                    let v325 = { v324 } <> { " " }
                    let v326 = { v325 } <> { "Bad Request" }
                    let v327 = erlang_term_coerce(v322)
                    let v328 = atom.create(v315)
                    let v330 = atom.create("byte_size")
                    let v331 = []
                    let v332 = [v327, ..v331]
                    let v333 = erlang_term_apply(v328, v330, v332)
                    let v334 = erlang_term_coerce(v333)
                    let v335 = int.to_string(v334)
                    let v336 = { "\r\nContent-Length: " } <> { v335 }
                    let v337 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v336 }
                    let v338 = { v337 } <> { "\r\nConnection: close\r\n\r\n" }
                    let v339 = { v326 } <> { v338 }
                    let v340 = { v339 } <> { v322 }
                    #(v340, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                }
                False -> posted_662(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v114, v169)
            }
        }
    }
}

pub fn removed_664(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    let v14 = dict.has_key(v10, v13)
    case v14 {
        True -> {
            let v15 = erlang_term_coerce(True)
            let v17 = atom.create("deleted")
            let v18 = erlang_term_coerce(v17)
            let v19 = []
            let v20 = [v15, ..v19]
            let v21 = [v18, ..v20]
            let v22 = erlang_term_tuple(v21)
            let v23 = []
            let v24 = [v22, ..v23]
            let v25 = erlang_term_coerce(v24)
            let v26 = "maps"
            let v27 = atom.create(v26)
            let v28 = "from_list"
            let v29 = atom.create(v28)
            let v30 = []
            let v31 = [v25, ..v30]
            let v32 = erlang_term_apply(v27, v29, v31)
            let v34 = atom.create("data")
            let v35 = erlang_term_coerce(v34)
            let v36 = []
            let v37 = [v32, ..v36]
            let v38 = [v35, ..v37]
            let v39 = erlang_term_tuple(v38)
            let v40 = []
            let v41 = [v39, ..v40]
            let v42 = erlang_term_coerce(v41)
            let v43 = atom.create(v26)
            let v44 = atom.create(v28)
            let v45 = []
            let v46 = [v42, ..v45]
            let v47 = erlang_term_apply(v43, v44, v46)
            let v49 = atom.create("json")
            let v51 = atom.create("encode")
            let v52 = []
            let v53 = [v47, ..v52]
            let v54 = erlang_term_apply(v49, v51, v53)
            let v55 = "erlang"
            let v56 = atom.create(v55)
            let v58 = atom.create("iolist_to_binary")
            let v59 = []
            let v60 = [v54, ..v59]
            let v61 = erlang_term_apply(v56, v58, v60)
            let v62 = erlang_term_coerce(v61)
            let v63 = int.to_string(200)
            let v64 = { "HTTP/1.1 " } <> { v63 }
            let v65 = { v64 } <> { " " }
            let v66 = { v65 } <> { "OK" }
            let v67 = erlang_term_coerce(v62)
            let v68 = atom.create(v55)
            let v70 = atom.create("byte_size")
            let v71 = []
            let v72 = [v67, ..v71]
            let v73 = erlang_term_apply(v68, v70, v72)
            let v74 = erlang_term_coerce(v73)
            let v75 = int.to_string(v74)
            let v76 = { "\r\nContent-Length: " } <> { v75 }
            let v77 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v76 }
            let v78 = { v77 } <> { "\r\nConnection: close\r\n\r\n" }
            let v79 = { v66 } <> { v78 }
            let v80 = { v79 } <> { v62 }
            let v81 = dict.delete(v10, v13)
            let v82 = dict.delete(v5, v13)
            #(v80, v0, v1, v2, v3, v4, v82, v6, v7, v8, v9, v81, v11, v12)
        }
        False -> {
            let v83 = { "Could not find post with id: [" } <> { v13 }
            let v84 = { v83 } <> { "]." }
            let v86 = erlang_term_coerce("Not Found Error")
            let v87 = erlang_term_coerce(v84)
            let v89 = erlang_term_coerce("about:blank")
            let v90 = erlang_term_coerce(404)
            let v92 = atom.create("status")
            let v93 = erlang_term_coerce(v92)
            let v94 = []
            let v95 = [v90, ..v94]
            let v96 = [v93, ..v95]
            let v97 = erlang_term_tuple(v96)
            let v99 = atom.create("type")
            let v100 = erlang_term_coerce(v99)
            let v101 = []
            let v102 = [v89, ..v101]
            let v103 = [v100, ..v102]
            let v104 = erlang_term_tuple(v103)
            let v106 = atom.create("detail")
            let v107 = erlang_term_coerce(v106)
            let v108 = []
            let v109 = [v87, ..v108]
            let v110 = [v107, ..v109]
            let v111 = erlang_term_tuple(v110)
            let v113 = atom.create("title")
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
            let v126 = atom.create("maps")
            let v128 = atom.create("from_list")
            let v129 = []
            let v130 = [v124, ..v129]
            let v131 = erlang_term_apply(v126, v128, v130)
            let v133 = atom.create("json")
            let v135 = atom.create("encode")
            let v136 = []
            let v137 = [v131, ..v136]
            let v138 = erlang_term_apply(v133, v135, v137)
            let v139 = "erlang"
            let v140 = atom.create(v139)
            let v142 = atom.create("iolist_to_binary")
            let v143 = []
            let v144 = [v138, ..v143]
            let v145 = erlang_term_apply(v140, v142, v144)
            let v146 = erlang_term_coerce(v145)
            let v147 = int.to_string(404)
            let v148 = { "HTTP/1.1 " } <> { v147 }
            let v149 = { v148 } <> { " " }
            let v150 = { v149 } <> { "Not Found" }
            let v151 = erlang_term_coerce(v146)
            let v152 = atom.create(v139)
            let v154 = atom.create("byte_size")
            let v155 = []
            let v156 = [v151, ..v155]
            let v157 = erlang_term_apply(v152, v154, v156)
            let v158 = erlang_term_coerce(v157)
            let v159 = int.to_string(v158)
            let v160 = { "\r\nContent-Length: " } <> { v159 }
            let v161 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v160 }
            let v162 = { v161 } <> { "\r\nConnection: close\r\n\r\n" }
            let v163 = { v150 } <> { v162 }
            let v164 = { v163 } <> { v146 }
            #(v164, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
        }
    }
}

pub fn post_or_delete_658(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String, v15: String, v16: String, v17: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    let v18 = v13 == "POST"
    let v20 =
        case v18 {
            True -> {
                v14 == "/2/tweets"
            }
            False -> False
        }
    case v20 {
        True -> new_post_659(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
        False -> {
            let v35 = v14 == ""
            let v39 =
                case v35 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2("/", v14)
                    }
                }
            let v70 =
                case v39  {
                    Uh3Cons(v40, v41) -> {
                        let v42 = "" == v40
                        case v42 {
                            True -> {
                                case v41  {
                                    Uh3Cons(v43, v44) -> {
                                        let v45 = "2" == v43
                                        case v45 {
                                            True -> {
                                                case v44  {
                                                    Uh3Cons(v46, v47) -> {
                                                        let v48 = "tweets" == v46
                                                        case v48 {
                                                            True -> {
                                                                case v47  {
                                                                    Uh3Cons(v49, v50) -> {
                                                                        case v50  {
                                                                            Uh3Nil -> {
                                                                                let v51 = v13 == "DELETE"
                                                                                case v51 {
                                                                                    True -> Us2Some(v49)
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
            case v70  {
                Us2None -> {
                    let v86 = { "no route " } <> { v14 }
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
                    #(v166, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                }
                Us2Some(v71) -> removed_664(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v71)
            }
        }
    }
}

pub fn user_write_657(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String, v15: String, v16: String, v17: String, v18: Us111) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    case v18  {
        Us111OAuth1User -> post_or_delete_658(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
        Us111UserBearer -> post_or_delete_658(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
    }
}

pub fn change_reply_656(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String, v15: String, v16: String, v17: String, v18: Us111) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    user_write_657(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
}

pub fn reply_as_654(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: Us111) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    let v23 =
        case v19  {
            Us111OAuth1User -> {
                "oauth1"
            }
            Us111UserBearer -> {
                "user"
            }
        }
    logged_535(v13, v14, v15, v16, v17, v18, v23)
    let v24 = { "xsim serve / answered " } <> { v14 }
    let v25 = { v24 } <> { " " }
    let v26 = { v25 } <> { v15 }
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
    let v40 = v14 == "GET"
    case v40 {
        True -> {
            let v41 = answer_655(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v14, v15, v16, v17, v18, v19)
            #(v41, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
        }
        False -> change_reply_656(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v14, v15, v16, v17, v18, v19)
    }
}

pub fn answer_667(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String, v15: String, v16: String, v17: String, _v18: Us112) -> String {
    routed_540(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
}

pub fn issued_next_670(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    let v13 = ""
    let v14 = erlang_term_coerce(v13)
    let v15 = "oauth2"
    let v16 = erlang_term_coerce(v15)
    let v17 = erlang_term_coerce(v14)
    let v18 = "maps"
    let v19 = atom.create(v18)
    let v20 = "get"
    let v21 = atom.create(v20)
    let v22 = []
    let v23 = [v17, ..v22]
    let v24 = [v7, ..v23]
    let v25 = [v16, ..v24]
    let v26 = erlang_term_apply(v19, v21, v25)
    let v27 = erlang_term_coerce(v26)
    let v28 = erlang_term_coerce(v13)
    let v29 = "refresh_token"
    let v30 = erlang_term_coerce(v29)
    let v31 = erlang_term_coerce(v28)
    let v32 = atom.create(v18)
    let v33 = atom.create(v20)
    let v34 = []
    let v35 = [v31, ..v34]
    let v36 = [v27, ..v35]
    let v37 = [v30, ..v36]
    let v38 = erlang_term_apply(v32, v33, v37)
    let v39 = erlang_term_coerce(v38)
    let v40 = erlang_term_coerce(v39)
    let v41 = { v40 } <> { "-" }
    let v43 = method20(v8, 0)
    let v44 = int.to_string(v43)
    let v45 = { v41 } <> { v44 }
    let v46 = erlang_term_coerce(v13)
    let v47 = erlang_term_coerce(v15)
    let v48 = erlang_term_coerce(v46)
    let v49 = atom.create(v18)
    let v50 = atom.create(v20)
    let v51 = []
    let v52 = [v48, ..v51]
    let v53 = [v7, ..v52]
    let v54 = [v47, ..v53]
    let v55 = erlang_term_apply(v49, v50, v54)
    let v56 = erlang_term_coerce(v55)
    let v57 = erlang_term_coerce(v13)
    let v58 = "access_token"
    let v59 = erlang_term_coerce(v58)
    let v60 = erlang_term_coerce(v57)
    let v61 = atom.create(v18)
    let v62 = atom.create(v20)
    let v63 = []
    let v64 = [v60, ..v63]
    let v65 = [v56, ..v64]
    let v66 = [v59, ..v65]
    let v67 = erlang_term_apply(v61, v62, v66)
    let v68 = erlang_term_coerce(v67)
    let v69 = erlang_term_coerce(v68)
    let v70 = { v69 } <> { "-" }
    let v72 = method20(v8, 0)
    let v73 = int.to_string(v72)
    let v74 = { v70 } <> { v73 }
    let v76 = erlang_term_coerce("tweet.read tweet.write users.read offline.access")
    let v77 = erlang_term_coerce(v45)
    let v79 = erlang_term_coerce("bearer")
    let v80 = erlang_term_coerce(7200)
    let v81 = erlang_term_coerce(v74)
    let v82 = atom.create(v29)
    let v83 = erlang_term_coerce(v82)
    let v84 = []
    let v85 = [v77, ..v84]
    let v86 = [v83, ..v85]
    let v87 = erlang_term_tuple(v86)
    let v89 = atom.create("scope")
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
    let v102 = atom.create("expires_in")
    let v103 = erlang_term_coerce(v102)
    let v104 = []
    let v105 = [v80, ..v104]
    let v106 = [v103, ..v105]
    let v107 = erlang_term_tuple(v106)
    let v109 = atom.create("token_type")
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
    let v122 = atom.create(v18)
    let v124 = atom.create("from_list")
    let v125 = []
    let v126 = [v121, ..v125]
    let v127 = erlang_term_apply(v122, v124, v126)
    let v129 = atom.create("json")
    let v131 = atom.create("encode")
    let v132 = []
    let v133 = [v127, ..v132]
    let v134 = erlang_term_apply(v129, v131, v133)
    let v135 = "erlang"
    let v136 = atom.create(v135)
    let v138 = atom.create("iolist_to_binary")
    let v139 = []
    let v140 = [v134, ..v139]
    let v141 = erlang_term_apply(v136, v138, v140)
    let v142 = erlang_term_coerce(v141)
    let v143 = int.to_string(200)
    let v144 = { "HTTP/1.1 " } <> { v143 }
    let v145 = { v144 } <> { " " }
    let v146 = { v145 } <> { "OK" }
    let v147 = erlang_term_coerce(v142)
    let v148 = atom.create(v135)
    let v150 = atom.create("byte_size")
    let v151 = []
    let v152 = [v147, ..v151]
    let v153 = erlang_term_apply(v148, v150, v152)
    let v154 = erlang_term_coerce(v153)
    let v155 = int.to_string(v154)
    let v156 = { "\r\nContent-Length: " } <> { v155 }
    let v157 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v156 }
    let v158 = { v157 } <> { "\r\nConnection: close\r\n\r\n" }
    let v159 = { v146 } <> { v158 }
    let v160 = { v159 } <> { v142 }
    let v161 = Uh3Cons(v45, v8)
    #(v160, v0, v1, v2, v3, v4, v5, v6, v7, v161, v9, v10, v11, v12)
}
