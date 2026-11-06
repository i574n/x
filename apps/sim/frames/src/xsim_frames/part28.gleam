import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import xsim_frames/types.{type Uh3, type Us2, type Uh30, type Uh37, Uh30Cons, Uh30Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil, Uh52Cons, Uh52Nil, Us2None, Us2Some, Us3None, Us3Some}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part12.{method302}
import xsim_frames/part25.{first_value_467}
import xsim_frames/part27.{followed_546, method537, method538, method551, method552, sliced_550}

pub fn following_body_545(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: Dynamic, v14: Int, v15: Int) -> Dynamic {
    let v16 = followed_546(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
    let v17 = sliced_550(v14, v15, v16)
    let v19 = method551(v17, 0)
    let v20 = spiral_wrap_signed(v14 + v15, 32)
    let v22 = method551(v16, 0)
    let v23 = v20 < v22
    let v31 =
        case v23 {
            True -> {
                let v24 = int.to_string(v20)
                let v25 = { "p" } <> { v24 }
                let v26 = erlang_term_coerce(v25)
                Uh38Cons("next_token", v26, Uh38Nil)
            }
            False -> Uh38Nil
        }
    let v32 = erlang_term_coerce(v19)
    let v34 = method538(v31, Uh30Nil)
    let v36 = atom.create("result_count")
    let v37 = erlang_term_coerce(v36)
    let v38 = []
    let v39 = [v32, ..v38]
    let v40 = [v37, ..v39]
    let v41 = erlang_term_tuple(v40)
    let v42 = []
    let v43 = method302(v34, v42)
    let v44 = [v41, ..v43]
    let v45 = erlang_term_coerce(v44)
    let v46 = "maps"
    let v47 = atom.create(v46)
    let v48 = "from_list"
    let v49 = atom.create(v48)
    let v50 = []
    let v51 = [v45, ..v50]
    let v52 = erlang_term_apply(v47, v49, v51)
    let v54 = method552(v17, Uh30Nil)
    let v62 =
        case v54  {
            Uh30Nil -> Uh38Nil
            _ -> {
                let v56 = []
                let v57 = method302(v54, v56)
                let v58 = erlang_term_coerce(v57)
                Uh38Cons("data", v58, Uh38Nil)
            }
        }
    let v65 = Uh38Cons("meta", v52, Uh38Nil)
    let v66 = method537(v62, v65)
    let v68 = method538(v66, Uh30Nil)
    let v69 = []
    let v70 = method302(v68, v69)
    let v71 = erlang_term_coerce(v70)
    let v72 = atom.create(v46)
    let v73 = atom.create(v48)
    let v74 = []
    let v75 = [v71, ..v74]
    erlang_term_apply(v72, v73, v75)
}

pub fn following_544(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: Dynamic, v14: String) -> #(Int, Dynamic) {
    let v16 = v14 == ""
    let v20 =
        case v16 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v14)
            }
        }
    let v21 = first_value_467("max_results", v20)
    let v22 = v21 == ""
    let v24 =
        case v22 {
            True -> {
                "100"
            }
            False -> v21
        }
    let v25 = count_of_text_10(v24)
    let v31 =
        case v25  {
            Us3None -> False
            Us3Some(v26) -> {
                let v27 = v26 >= 1
                case v27 {
                    True -> {
                        v26 <= 1000
                    }
                    False -> False
                }
            }
        }
    case v31 {
        True -> {
            let v36 =
                case v16 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2("&", v14)
                    }
                }
            let v37 = first_value_467("pagination_token", v36)
            let v38 = v37 == ""
            let v40 =
                case v38 {
                    True -> {
                        "p0"
                    }
                    False -> v37
                }
            let v41 = spiral_string_length(v40)
            let v42 = spiral_wrap_signed(v41 - 1, 32)
            let v43 = spiral_wrap_signed(1 + v42, 32)
            let v44 = spiral_wrap_signed(v43 - 1, 32)
            let v45 = spiral_string_slice(v40, 1, v44)
            let v46 = count_of_text_10(v45)
            let v49 =
                case v46  {
                    Us3None -> 0
                    Us3Some(v47) -> v47
                }
            let v50 = count_of_text_10(v24)
            let v53 =
                case v50  {
                    Us3None -> 0
                    Us3Some(v51) -> v51
                }
            let v54 = v53 < v4
            let v55 =
                case v54 {
                    True -> v53
                    False -> v4
                }
            let v56 = following_body_545(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v49, v55)
            #(200, v56)
        }
        False -> {
            let v57 = { "max_results must be 1..1000, got " } <> { v24 }
            let v59 = erlang_term_coerce("Invalid Request")
            let v60 = erlang_term_coerce(v57)
            let v62 = erlang_term_coerce("about:blank")
            let v63 = erlang_term_coerce(400)
            let v65 = atom.create("status")
            let v66 = erlang_term_coerce(v65)
            let v67 = []
            let v68 = [v63, ..v67]
            let v69 = [v66, ..v68]
            let v70 = erlang_term_tuple(v69)
            let v72 = atom.create("type")
            let v73 = erlang_term_coerce(v72)
            let v74 = []
            let v75 = [v62, ..v74]
            let v76 = [v73, ..v75]
            let v77 = erlang_term_tuple(v76)
            let v79 = atom.create("detail")
            let v80 = erlang_term_coerce(v79)
            let v81 = []
            let v82 = [v60, ..v81]
            let v83 = [v80, ..v82]
            let v84 = erlang_term_tuple(v83)
            let v86 = atom.create("title")
            let v87 = erlang_term_coerce(v86)
            let v88 = []
            let v89 = [v59, ..v88]
            let v90 = [v87, ..v89]
            let v91 = erlang_term_tuple(v90)
            let v92 = []
            let v93 = [v70, ..v92]
            let v94 = [v77, ..v93]
            let v95 = [v84, ..v94]
            let v96 = [v91, ..v95]
            let v97 = erlang_term_coerce(v96)
            let v99 = atom.create("maps")
            let v101 = atom.create("from_list")
            let v102 = []
            let v103 = [v97, ..v102]
            let v104 = erlang_term_apply(v99, v101, v103)
            #(400, v104)
        }
    }
}

pub fn timeline_fault_555(v0: Dynamic) -> Us2 {
    let v1 = "plain_status"
    let v2 = erlang_term_coerce(v1)
    let v3 = "maps"
    let v4 = atom.create(v3)
    let v5 = "is_key"
    let v6 = atom.create(v5)
    let v7 = []
    let v8 = [v0, ..v7]
    let v9 = [v2, ..v8]
    let v10 = erlang_term_apply(v4, v6, v9)
    let v11 = erlang_term_coerce(v10)
    case v11 {
        True -> {
            let v12 = erlang_term_coerce(v1)
            let v13 = erlang_term_coerce(0)
            let v14 = atom.create(v3)
            let v15 = "get"
            let v16 = atom.create(v15)
            let v17 = []
            let v18 = [v13, ..v17]
            let v19 = [v0, ..v18]
            let v20 = [v12, ..v19]
            let v21 = erlang_term_apply(v14, v16, v20)
            let v22 = erlang_term_coerce(v21)
            let v24 = erlang_term_coerce("")
            let v26 = erlang_term_coerce("plain_body")
            let v27 = erlang_term_coerce(v24)
            let v28 = atom.create(v3)
            let v29 = atom.create(v15)
            let v30 = []
            let v31 = [v27, ..v30]
            let v32 = [v0, ..v31]
            let v33 = [v26, ..v32]
            let v34 = erlang_term_apply(v28, v29, v33)
            let v35 = erlang_term_coerce(v34)
            let v36 = erlang_term_coerce(v35)
            let v37 = int.to_string(v22)
            let v38 = { "HTTP/1.1 " } <> { v37 }
            let v39 = { v38 } <> { " " }
            let v40 = 503 == v22
            let v45 =
                case v40 {
                    True -> {
                        Uh52Cons(503, "Service Unavailable", Uh52Nil)
                    }
                    False -> Uh52Nil
                }
            let v46 = 502 == v22
            let v49 =
                case v46 {
                    True -> {
                        Uh52Cons(502, "Bad Gateway", v45)
                    }
                    False -> v45
                }
            let v50 = 500 == v22
            let v53 =
                case v50 {
                    True -> {
                        Uh52Cons(500, "Internal Server Error", v49)
                    }
                    False -> v49
                }
            let v54 = 429 == v22
            let v57 =
                case v54 {
                    True -> {
                        Uh52Cons(429, "Too Many Requests", v53)
                    }
                    False -> v53
                }
            let v58 = 422 == v22
            let v61 =
                case v58 {
                    True -> {
                        Uh52Cons(422, "Unprocessable Entity", v57)
                    }
                    False -> v57
                }
            let v62 = 404 == v22
            let v65 =
                case v62 {
                    True -> {
                        Uh52Cons(404, "Not Found", v61)
                    }
                    False -> v61
                }
            let v66 = 403 == v22
            let v69 =
                case v66 {
                    True -> {
                        Uh52Cons(403, "Forbidden", v65)
                    }
                    False -> v65
                }
            let v70 = 402 == v22
            let v73 =
                case v70 {
                    True -> {
                        Uh52Cons(402, "Payment Required", v69)
                    }
                    False -> v69
                }
            let v74 = 401 == v22
            let v77 =
                case v74 {
                    True -> {
                        Uh52Cons(401, "Unauthorized", v73)
                    }
                    False -> v73
                }
            let v78 = 400 == v22
            let v81 =
                case v78 {
                    True -> {
                        Uh52Cons(400, "Bad Request", v77)
                    }
                    False -> v77
                }
            let v82 = 201 == v22
            let v85 =
                case v82 {
                    True -> {
                        Uh52Cons(201, "Created", v81)
                    }
                    False -> v81
                }
            let v86 = 200 == v22
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
            let v99 = atom.create("erlang")
            let v101 = atom.create("byte_size")
            let v102 = []
            let v103 = [v97, ..v102]
            let v104 = erlang_term_apply(v99, v101, v103)
            let v105 = erlang_term_coerce(v104)
            let v106 = int.to_string(v105)
            let v107 = { "\r\nContent-Length: " } <> { v106 }
            let v108 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v107 }
            let v109 = { v108 } <> { "\r\nConnection: close\r\n\r\n" }
            let v110 = { v96 } <> { v109 }
            let v111 = { v110 } <> { v36 }
            Us2Some(v111)
        }
        False -> {
            let v113 = "status"
            let v114 = erlang_term_coerce(v113)
            let v115 = atom.create(v3)
            let v116 = atom.create(v5)
            let v117 = []
            let v118 = [v0, ..v117]
            let v119 = [v114, ..v118]
            let v120 = erlang_term_apply(v115, v116, v119)
            let v121 = erlang_term_coerce(v120)
            case v121 {
                True -> {
                    let v122 = erlang_term_coerce(v113)
                    let v123 = erlang_term_coerce(0)
                    let v124 = atom.create(v3)
                    let v125 = "get"
                    let v126 = atom.create(v125)
                    let v127 = []
                    let v128 = [v123, ..v127]
                    let v129 = [v0, ..v128]
                    let v130 = [v122, ..v129]
                    let v131 = erlang_term_apply(v124, v126, v130)
                    let v132 = erlang_term_coerce(v131)
                    let v133 = erlang_term_coerce(v113)
                    let v134 = erlang_term_coerce(0)
                    let v135 = atom.create(v3)
                    let v136 = atom.create(v125)
                    let v137 = []
                    let v138 = [v134, ..v137]
                    let v139 = [v0, ..v138]
                    let v140 = [v133, ..v139]
                    let v141 = erlang_term_apply(v135, v136, v140)
                    let v142 = erlang_term_coerce(v141)
                    let v143 = ""
                    let v144 = erlang_term_coerce(v143)
                    let v146 = erlang_term_coerce("problem_title")
                    let v147 = erlang_term_coerce(v144)
                    let v148 = atom.create(v3)
                    let v149 = atom.create(v125)
                    let v150 = []
                    let v151 = [v147, ..v150]
                    let v152 = [v0, ..v151]
                    let v153 = [v146, ..v152]
                    let v154 = erlang_term_apply(v148, v149, v153)
                    let v155 = erlang_term_coerce(v154)
                    let v156 = erlang_term_coerce(v155)
                    let v157 = erlang_term_coerce(v143)
                    let v159 = erlang_term_coerce("problem_detail")
                    let v160 = erlang_term_coerce(v157)
                    let v161 = atom.create(v3)
                    let v162 = atom.create(v125)
                    let v163 = []
                    let v164 = [v160, ..v163]
                    let v165 = [v0, ..v164]
                    let v166 = [v159, ..v165]
                    let v167 = erlang_term_apply(v161, v162, v166)
                    let v168 = erlang_term_coerce(v167)
                    let v169 = erlang_term_coerce(v168)
                    let v170 = erlang_term_coerce(v156)
                    let v171 = erlang_term_coerce(v169)
                    let v173 = erlang_term_coerce("about:blank")
                    let v174 = erlang_term_coerce(v142)
                    let v175 = atom.create(v113)
                    let v176 = erlang_term_coerce(v175)
                    let v177 = []
                    let v178 = [v174, ..v177]
                    let v179 = [v176, ..v178]
                    let v180 = erlang_term_tuple(v179)
                    let v182 = atom.create("type")
                    let v183 = erlang_term_coerce(v182)
                    let v184 = []
                    let v185 = [v173, ..v184]
                    let v186 = [v183, ..v185]
                    let v187 = erlang_term_tuple(v186)
                    let v189 = atom.create("detail")
                    let v190 = erlang_term_coerce(v189)
                    let v191 = []
                    let v192 = [v171, ..v191]
                    let v193 = [v190, ..v192]
                    let v194 = erlang_term_tuple(v193)
                    let v196 = atom.create("title")
                    let v197 = erlang_term_coerce(v196)
                    let v198 = []
                    let v199 = [v170, ..v198]
                    let v200 = [v197, ..v199]
                    let v201 = erlang_term_tuple(v200)
                    let v202 = []
                    let v203 = [v180, ..v202]
                    let v204 = [v187, ..v203]
                    let v205 = [v194, ..v204]
                    let v206 = [v201, ..v205]
                    let v207 = erlang_term_coerce(v206)
                    let v208 = atom.create(v3)
                    let v210 = atom.create("from_list")
                    let v211 = []
                    let v212 = [v207, ..v211]
                    let v213 = erlang_term_apply(v208, v210, v212)
                    let v215 = atom.create("json")
                    let v217 = atom.create("encode")
                    let v218 = []
                    let v219 = [v213, ..v218]
                    let v220 = erlang_term_apply(v215, v217, v219)
                    let v221 = "erlang"
                    let v222 = atom.create(v221)
                    let v224 = atom.create("iolist_to_binary")
                    let v225 = []
                    let v226 = [v220, ..v225]
                    let v227 = erlang_term_apply(v222, v224, v226)
                    let v228 = erlang_term_coerce(v227)
                    let v229 = int.to_string(v132)
                    let v230 = { "HTTP/1.1 " } <> { v229 }
                    let v231 = { v230 } <> { " " }
                    let v232 = 503 == v132
                    let v237 =
                        case v232 {
                            True -> {
                                Uh52Cons(503, "Service Unavailable", Uh52Nil)
                            }
                            False -> Uh52Nil
                        }
                    let v238 = 502 == v132
                    let v241 =
                        case v238 {
                            True -> {
                                Uh52Cons(502, "Bad Gateway", v237)
                            }
                            False -> v237
                        }
                    let v242 = 500 == v132
                    let v245 =
                        case v242 {
                            True -> {
                                Uh52Cons(500, "Internal Server Error", v241)
                            }
                            False -> v241
                        }
                    let v246 = 429 == v132
                    let v249 =
                        case v246 {
                            True -> {
                                Uh52Cons(429, "Too Many Requests", v245)
                            }
                            False -> v245
                        }
                    let v250 = 422 == v132
                    let v253 =
                        case v250 {
                            True -> {
                                Uh52Cons(422, "Unprocessable Entity", v249)
                            }
                            False -> v249
                        }
                    let v254 = 404 == v132
                    let v257 =
                        case v254 {
                            True -> {
                                Uh52Cons(404, "Not Found", v253)
                            }
                            False -> v253
                        }
                    let v258 = 403 == v132
                    let v261 =
                        case v258 {
                            True -> {
                                Uh52Cons(403, "Forbidden", v257)
                            }
                            False -> v257
                        }
                    let v262 = 402 == v132
                    let v265 =
                        case v262 {
                            True -> {
                                Uh52Cons(402, "Payment Required", v261)
                            }
                            False -> v261
                        }
                    let v266 = 401 == v132
                    let v269 =
                        case v266 {
                            True -> {
                                Uh52Cons(401, "Unauthorized", v265)
                            }
                            False -> v265
                        }
                    let v270 = 400 == v132
                    let v273 =
                        case v270 {
                            True -> {
                                Uh52Cons(400, "Bad Request", v269)
                            }
                            False -> v269
                        }
                    let v274 = 201 == v132
                    let v277 =
                        case v274 {
                            True -> {
                                Uh52Cons(201, "Created", v273)
                            }
                            False -> v273
                        }
                    let v278 = 200 == v132
                    let v281 =
                        case v278 {
                            True -> {
                                Uh52Cons(200, "OK", v277)
                            }
                            False -> v277
                        }
                    let v287 =
                        case v281  {
                            Uh52Cons(v282, v283, v284) -> v283
                            Uh52Nil -> {
                                "Status"
                            }
                        }
                    let v288 = { v231 } <> { v287 }
                    let v289 = erlang_term_coerce(v228)
                    let v290 = atom.create(v221)
                    let v292 = atom.create("byte_size")
                    let v293 = []
                    let v294 = [v289, ..v293]
                    let v295 = erlang_term_apply(v290, v292, v294)
                    let v296 = erlang_term_coerce(v295)
                    let v297 = int.to_string(v296)
                    let v298 = { "\r\nContent-Length: " } <> { v297 }
                    let v299 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v298 }
                    let v300 = { v299 } <> { "\r\nConnection: close\r\n\r\n" }
                    let v301 = { v288 } <> { v300 }
                    let v302 = { v301 } <> { v228 }
                    Us2Some(v302)
                }
                False -> {
                    let v304 = erlang_term_coerce(False)
                    let v306 = erlang_term_coerce("protected")
                    let v307 = erlang_term_coerce(v304)
                    let v308 = atom.create(v3)
                    let v309 = "get"
                    let v310 = atom.create(v309)
                    let v311 = []
                    let v312 = [v307, ..v311]
                    let v313 = [v0, ..v312]
                    let v314 = [v306, ..v313]
                    let v315 = erlang_term_apply(v308, v310, v314)
                    let v316 = erlang_term_coerce(v315)
                    let v317 = erlang_term_coerce(v316)
                    case v317 {
                        True -> {
                            let v319 = erlang_term_coerce("https://api.x.com/2/problems/not-authorized-for-resource")
                            let v321 = erlang_term_coerce("Authorization Error")
                            let v323 = erlang_term_coerce("")
                            let v325 = erlang_term_coerce("username")
                            let v326 = erlang_term_coerce(v323)
                            let v327 = atom.create(v3)
                            let v328 = atom.create(v309)
                            let v329 = []
                            let v330 = [v326, ..v329]
                            let v331 = [v0, ..v330]
                            let v332 = [v325, ..v331]
                            let v333 = erlang_term_apply(v327, v328, v332)
                            let v334 = erlang_term_coerce(v333)
                            let v335 = erlang_term_coerce(v334)
                            let v336 = { "Sorry, you are not authorized to see the posts of @" } <> { v335 }
                            let v337 = { v336 } <> { "." }
                            let v338 = erlang_term_coerce(v337)
                            let v340 = atom.create("type")
                            let v341 = erlang_term_coerce(v340)
                            let v342 = []
                            let v343 = [v319, ..v342]
                            let v344 = [v341, ..v343]
                            let v345 = erlang_term_tuple(v344)
                            let v347 = atom.create("detail")
                            let v348 = erlang_term_coerce(v347)
                            let v349 = []
                            let v350 = [v338, ..v349]
                            let v351 = [v348, ..v350]
                            let v352 = erlang_term_tuple(v351)
                            let v354 = atom.create("title")
                            let v355 = erlang_term_coerce(v354)
                            let v356 = []
                            let v357 = [v321, ..v356]
                            let v358 = [v355, ..v357]
                            let v359 = erlang_term_tuple(v358)
                            let v360 = []
                            let v361 = [v345, ..v360]
                            let v362 = [v352, ..v361]
                            let v363 = [v359, ..v362]
                            let v364 = erlang_term_coerce(v363)
                            let v365 = atom.create(v3)
                            let v366 = "from_list"
                            let v367 = atom.create(v366)
                            let v368 = []
                            let v369 = [v364, ..v368]
                            let v370 = erlang_term_apply(v365, v367, v369)
                            let v371 = []
                            let v372 = [v370, ..v371]
                            let v373 = erlang_term_coerce(v372)
                            let v375 = atom.create("errors")
                            let v376 = erlang_term_coerce(v375)
                            let v377 = []
                            let v378 = [v373, ..v377]
                            let v379 = [v376, ..v378]
                            let v380 = erlang_term_tuple(v379)
                            let v381 = []
                            let v382 = [v380, ..v381]
                            let v383 = erlang_term_coerce(v382)
                            let v384 = atom.create(v3)
                            let v385 = atom.create(v366)
                            let v386 = []
                            let v387 = [v383, ..v386]
                            let v388 = erlang_term_apply(v384, v385, v387)
                            let v390 = atom.create("json")
                            let v392 = atom.create("encode")
                            let v393 = []
                            let v394 = [v388, ..v393]
                            let v395 = erlang_term_apply(v390, v392, v394)
                            let v396 = "erlang"
                            let v397 = atom.create(v396)
                            let v399 = atom.create("iolist_to_binary")
                            let v400 = []
                            let v401 = [v395, ..v400]
                            let v402 = erlang_term_apply(v397, v399, v401)
                            let v403 = erlang_term_coerce(v402)
                            let v404 = int.to_string(200)
                            let v405 = { "HTTP/1.1 " } <> { v404 }
                            let v406 = { v405 } <> { " " }
                            let v407 = { v406 } <> { "OK" }
                            let v408 = erlang_term_coerce(v403)
                            let v409 = atom.create(v396)
                            let v411 = atom.create("byte_size")
                            let v412 = []
                            let v413 = [v408, ..v412]
                            let v414 = erlang_term_apply(v409, v411, v413)
                            let v415 = erlang_term_coerce(v414)
                            let v416 = int.to_string(v415)
                            let v417 = { "\r\nContent-Length: " } <> { v416 }
                            let v418 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v417 }
                            let v419 = { v418 } <> { "\r\nConnection: close\r\n\r\n" }
                            let v420 = { v407 } <> { v419 }
                            let v421 = { v420 } <> { v403 }
                            Us2Some(v421)
                        }
                        False -> Us2None
                    }
                }
            }
        }
    }
}

pub fn method558(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method558(v3, v1)
            let v5 = v2 != ""
            case v5 {
                True -> Uh3Cons(v2, v4)
                False -> v4
            }
        }
        Uh3Nil -> v1
    }
}

pub fn method559(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: Uh30, v14: Uh30) -> Uh30 {
    case v13  {
        Uh30Cons(v15, v16) -> {
            let v17 = method559(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v16, v14)
            let v18 = ""
            let v19 = erlang_term_coerce(v18)
            let v21 = erlang_term_coerce("id")
            let v22 = erlang_term_coerce(v19)
            let v23 = "maps"
            let v24 = atom.create(v23)
            let v25 = "get"
            let v26 = atom.create(v25)
            let v27 = []
            let v28 = [v22, ..v27]
            let v29 = [v15, ..v28]
            let v30 = [v21, ..v29]
            let v31 = erlang_term_apply(v24, v26, v30)
            let v32 = erlang_term_coerce(v31)
            let v33 = "erlang"
            let v34 = atom.create(v33)
            let v36 = atom.create("is_binary")
            let v37 = []
            let v38 = [v32, ..v37]
            let v39 = erlang_term_apply(v34, v36, v38)
            let v40 = erlang_term_coerce(v39)
            let v49 =
                case v40 {
                    True -> {
                        erlang_term_coerce(v32)
                    }
                    False -> {
                        let v42 = atom.create(v33)
                        let v44 = atom.create("integer_to_binary")
                        let v45 = []
                        let v46 = [v32, ..v45]
                        let v47 = erlang_term_apply(v42, v44, v46)
                        erlang_term_coerce(v47)
                    }
                }
            let v50 = dict.has_key(v5, v49)
            let v68 =
                case v50 {
                    True -> {
                        let v51 = erlang_term_coerce(v18)
                        let v53 = erlang_term_coerce("lost")
                        let v54 = erlang_term_coerce(v51)
                        let v55 = atom.create(v23)
                        let v56 = atom.create(v25)
                        let v57 = []
                        let v58 = [v54, ..v57]
                        let v59 = [v15, ..v58]
                        let v60 = [v53, ..v59]
                        let v61 = erlang_term_apply(v55, v56, v60)
                        let v62 = erlang_term_coerce(v61)
                        let v64 = atom.create("true")
                        let v65 = erlang_term_coerce(v64)
                        let v66 = v62 == v65
                        v66 == False
                    }
                    False -> False
                }
            case v68 {
                True -> Uh30Cons(v15, v17)
                False -> v17
            }
        }
        Uh30Nil -> v14
    }
}

pub fn closure153(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        v0 == "replies"
    }
}

pub fn method561() -> fn(String) -> Bool {
    closure153(Nil)
}

pub fn method562(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method561()
                    method562(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn method563(v0: Uh30, v1: Uh3) -> Uh3 {
    case v0  {
        Uh30Cons(v2, v3) -> {
            let v4 = method563(v3, v1)
            let v6 = erlang_term_coerce("")
            let v8 = erlang_term_coerce("type")
            let v9 = erlang_term_coerce(v6)
            let v11 = atom.create("maps")
            let v13 = atom.create("get")
            let v14 = []
            let v15 = [v9, ..v14]
            let v16 = [v2, ..v15]
            let v17 = [v8, ..v16]
            let v18 = erlang_term_apply(v11, v13, v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = erlang_term_coerce(v19)
            Uh3Cons(v20, v4)
        }
        Uh30Nil -> v1
    }
}

pub fn closure154(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        v0 == "replied_to"
    }
}

pub fn method564() -> fn(String) -> Bool {
    closure154(Nil)
}

pub fn method565(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method564()
                    method565(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn closure155(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        v0 == "retweets"
    }
}

pub fn method566() -> fn(String) -> Bool {
    closure155(Nil)
}

pub fn method567(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method566()
                    method567(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn closure156(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        v0 == "reposted"
    }
}

pub fn method568() -> fn(String) -> Bool {
    closure156(Nil)
}

pub fn method569(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method568()
                    method569(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}
