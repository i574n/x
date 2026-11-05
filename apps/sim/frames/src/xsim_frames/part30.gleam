import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import xsim_frames/types.{type Uh3, type Us2, type Uh29, Uh29Cons, Uh29Nil, Uh39Cons, Uh39Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us96Error, Us96Ok, Us97None, Us97Some}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple}
import xsim_frames/part13.{items_from_301}
import xsim_frames/part27.{method455, method456}

pub fn timeline_fault_489(v0: Dynamic) -> Us2 {
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
            let v23 = ""
            let v24 = erlang_term_coerce(v23)
            let v25 = "plain_body"
            let v26 = erlang_term_coerce(v25)
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
            let v38 = "HTTP/1.1 "
            let v39 = v38 <> v37 
            let v40 = " "
            let v41 = v39 <> v40 
            let v42 = 503 == v22
            let v47 =
                case v42 {
                    True -> {
                        let v43 = "Service Unavailable"
                        let v44 = Uh39Nil
                        Uh39Cons(503, v43, v44)
                    }
                    False -> Uh39Nil
                }
            let v48 = 502 == v22
            let v51 =
                case v48 {
                    True -> {
                        let v49 = "Bad Gateway"
                        Uh39Cons(502, v49, v47)
                    }
                    False -> v47
                }
            let v52 = 500 == v22
            let v55 =
                case v52 {
                    True -> {
                        let v53 = "Internal Server Error"
                        Uh39Cons(500, v53, v51)
                    }
                    False -> v51
                }
            let v56 = 429 == v22
            let v59 =
                case v56 {
                    True -> {
                        let v57 = "Too Many Requests"
                        Uh39Cons(429, v57, v55)
                    }
                    False -> v55
                }
            let v60 = 422 == v22
            let v63 =
                case v60 {
                    True -> {
                        let v61 = "Unprocessable Entity"
                        Uh39Cons(422, v61, v59)
                    }
                    False -> v59
                }
            let v64 = 404 == v22
            let v67 =
                case v64 {
                    True -> {
                        let v65 = "Not Found"
                        Uh39Cons(404, v65, v63)
                    }
                    False -> v63
                }
            let v68 = 403 == v22
            let v71 =
                case v68 {
                    True -> {
                        let v69 = "Forbidden"
                        Uh39Cons(403, v69, v67)
                    }
                    False -> v67
                }
            let v72 = 402 == v22
            let v75 =
                case v72 {
                    True -> {
                        let v73 = "Payment Required"
                        Uh39Cons(402, v73, v71)
                    }
                    False -> v71
                }
            let v76 = 401 == v22
            let v79 =
                case v76 {
                    True -> {
                        let v77 = "Unauthorized"
                        Uh39Cons(401, v77, v75)
                    }
                    False -> v75
                }
            let v80 = 400 == v22
            let v83 =
                case v80 {
                    True -> {
                        let v81 = "Bad Request"
                        Uh39Cons(400, v81, v79)
                    }
                    False -> v79
                }
            let v84 = 201 == v22
            let v87 =
                case v84 {
                    True -> {
                        let v85 = "Created"
                        Uh39Cons(201, v85, v83)
                    }
                    False -> v83
                }
            let v88 = 200 == v22
            let v91 =
                case v88 {
                    True -> {
                        let v89 = "OK"
                        Uh39Cons(200, v89, v87)
                    }
                    False -> v87
                }
            let v97 =
                case v91  {
                    Uh39Cons(v92, v93, v94) -> v93
                    Uh39Nil -> {
                        let v95 = "Status"
                        v95
                    }
                }
            let v98 = v41 <> v97 
            let v99 = erlang_term_coerce(v36)
            let v100 = "erlang"
            let v101 = atom.create(v100)
            let v102 = "byte_size"
            let v103 = atom.create(v102)
            let v104 = []
            let v105 = [v99, ..v104]
            let v106 = erlang_term_apply(v101, v103, v105)
            let v107 = erlang_term_coerce(v106)
            let v108 = int.to_string(v107)
            let v109 = "\r\nContent-Length: "
            let v110 = v109 <> v108 
            let v111 = "\r\nContent-Type: application/json; charset=utf-8"
            let v112 = v111 <> v110 
            let v113 = "\r\nConnection: close\r\n\r\n"
            let v114 = v112 <> v113 
            let v115 = v98 <> v114 
            let v116 = v115 <> v36 
            Us2Some(v116)
        }
        False -> {
            let v118 = "status"
            let v119 = erlang_term_coerce(v118)
            let v120 = atom.create(v3)
            let v121 = atom.create(v5)
            let v122 = []
            let v123 = [v0, ..v122]
            let v124 = [v119, ..v123]
            let v125 = erlang_term_apply(v120, v121, v124)
            let v126 = erlang_term_coerce(v125)
            case v126 {
                True -> {
                    let v127 = erlang_term_coerce(v118)
                    let v128 = erlang_term_coerce(0)
                    let v129 = atom.create(v3)
                    let v130 = "get"
                    let v131 = atom.create(v130)
                    let v132 = []
                    let v133 = [v128, ..v132]
                    let v134 = [v0, ..v133]
                    let v135 = [v127, ..v134]
                    let v136 = erlang_term_apply(v129, v131, v135)
                    let v137 = erlang_term_coerce(v136)
                    let v138 = erlang_term_coerce(v118)
                    let v139 = erlang_term_coerce(0)
                    let v140 = atom.create(v3)
                    let v141 = atom.create(v130)
                    let v142 = []
                    let v143 = [v139, ..v142]
                    let v144 = [v0, ..v143]
                    let v145 = [v138, ..v144]
                    let v146 = erlang_term_apply(v140, v141, v145)
                    let v147 = erlang_term_coerce(v146)
                    let v148 = ""
                    let v149 = erlang_term_coerce(v148)
                    let v150 = "problem_title"
                    let v151 = erlang_term_coerce(v150)
                    let v152 = erlang_term_coerce(v149)
                    let v153 = atom.create(v3)
                    let v154 = atom.create(v130)
                    let v155 = []
                    let v156 = [v152, ..v155]
                    let v157 = [v0, ..v156]
                    let v158 = [v151, ..v157]
                    let v159 = erlang_term_apply(v153, v154, v158)
                    let v160 = erlang_term_coerce(v159)
                    let v161 = erlang_term_coerce(v160)
                    let v162 = erlang_term_coerce(v148)
                    let v163 = "problem_detail"
                    let v164 = erlang_term_coerce(v163)
                    let v165 = erlang_term_coerce(v162)
                    let v166 = atom.create(v3)
                    let v167 = atom.create(v130)
                    let v168 = []
                    let v169 = [v165, ..v168]
                    let v170 = [v0, ..v169]
                    let v171 = [v164, ..v170]
                    let v172 = erlang_term_apply(v166, v167, v171)
                    let v173 = erlang_term_coerce(v172)
                    let v174 = erlang_term_coerce(v173)
                    let v175 = erlang_term_coerce(v161)
                    let v176 = erlang_term_coerce(v174)
                    let v177 = "about:blank"
                    let v178 = erlang_term_coerce(v177)
                    let v179 = erlang_term_coerce(v147)
                    let v180 = atom.create(v118)
                    let v181 = erlang_term_coerce(v180)
                    let v182 = []
                    let v183 = [v179, ..v182]
                    let v184 = [v181, ..v183]
                    let v185 = erlang_term_tuple(v184)
                    let v186 = "type"
                    let v187 = atom.create(v186)
                    let v188 = erlang_term_coerce(v187)
                    let v189 = []
                    let v190 = [v178, ..v189]
                    let v191 = [v188, ..v190]
                    let v192 = erlang_term_tuple(v191)
                    let v193 = "detail"
                    let v194 = atom.create(v193)
                    let v195 = erlang_term_coerce(v194)
                    let v196 = []
                    let v197 = [v176, ..v196]
                    let v198 = [v195, ..v197]
                    let v199 = erlang_term_tuple(v198)
                    let v200 = "title"
                    let v201 = atom.create(v200)
                    let v202 = erlang_term_coerce(v201)
                    let v203 = []
                    let v204 = [v175, ..v203]
                    let v205 = [v202, ..v204]
                    let v206 = erlang_term_tuple(v205)
                    let v207 = []
                    let v208 = [v185, ..v207]
                    let v209 = [v192, ..v208]
                    let v210 = [v199, ..v209]
                    let v211 = [v206, ..v210]
                    let v212 = erlang_term_coerce(v211)
                    let v213 = atom.create(v3)
                    let v214 = "from_list"
                    let v215 = atom.create(v214)
                    let v216 = []
                    let v217 = [v212, ..v216]
                    let v218 = erlang_term_apply(v213, v215, v217)
                    let v219 = "json"
                    let v220 = atom.create(v219)
                    let v221 = "encode"
                    let v222 = atom.create(v221)
                    let v223 = []
                    let v224 = [v218, ..v223]
                    let v225 = erlang_term_apply(v220, v222, v224)
                    let v226 = "erlang"
                    let v227 = atom.create(v226)
                    let v228 = "iolist_to_binary"
                    let v229 = atom.create(v228)
                    let v230 = []
                    let v231 = [v225, ..v230]
                    let v232 = erlang_term_apply(v227, v229, v231)
                    let v233 = erlang_term_coerce(v232)
                    let v234 = int.to_string(v137)
                    let v235 = "HTTP/1.1 "
                    let v236 = v235 <> v234 
                    let v237 = " "
                    let v238 = v236 <> v237 
                    let v239 = 503 == v137
                    let v244 =
                        case v239 {
                            True -> {
                                let v240 = "Service Unavailable"
                                let v241 = Uh39Nil
                                Uh39Cons(503, v240, v241)
                            }
                            False -> Uh39Nil
                        }
                    let v245 = 502 == v137
                    let v248 =
                        case v245 {
                            True -> {
                                let v246 = "Bad Gateway"
                                Uh39Cons(502, v246, v244)
                            }
                            False -> v244
                        }
                    let v249 = 500 == v137
                    let v252 =
                        case v249 {
                            True -> {
                                let v250 = "Internal Server Error"
                                Uh39Cons(500, v250, v248)
                            }
                            False -> v248
                        }
                    let v253 = 429 == v137
                    let v256 =
                        case v253 {
                            True -> {
                                let v254 = "Too Many Requests"
                                Uh39Cons(429, v254, v252)
                            }
                            False -> v252
                        }
                    let v257 = 422 == v137
                    let v260 =
                        case v257 {
                            True -> {
                                let v258 = "Unprocessable Entity"
                                Uh39Cons(422, v258, v256)
                            }
                            False -> v256
                        }
                    let v261 = 404 == v137
                    let v264 =
                        case v261 {
                            True -> {
                                let v262 = "Not Found"
                                Uh39Cons(404, v262, v260)
                            }
                            False -> v260
                        }
                    let v265 = 403 == v137
                    let v268 =
                        case v265 {
                            True -> {
                                let v266 = "Forbidden"
                                Uh39Cons(403, v266, v264)
                            }
                            False -> v264
                        }
                    let v269 = 402 == v137
                    let v272 =
                        case v269 {
                            True -> {
                                let v270 = "Payment Required"
                                Uh39Cons(402, v270, v268)
                            }
                            False -> v268
                        }
                    let v273 = 401 == v137
                    let v276 =
                        case v273 {
                            True -> {
                                let v274 = "Unauthorized"
                                Uh39Cons(401, v274, v272)
                            }
                            False -> v272
                        }
                    let v277 = 400 == v137
                    let v280 =
                        case v277 {
                            True -> {
                                let v278 = "Bad Request"
                                Uh39Cons(400, v278, v276)
                            }
                            False -> v276
                        }
                    let v281 = 201 == v137
                    let v284 =
                        case v281 {
                            True -> {
                                let v282 = "Created"
                                Uh39Cons(201, v282, v280)
                            }
                            False -> v280
                        }
                    let v285 = 200 == v137
                    let v288 =
                        case v285 {
                            True -> {
                                let v286 = "OK"
                                Uh39Cons(200, v286, v284)
                            }
                            False -> v284
                        }
                    let v294 =
                        case v288  {
                            Uh39Cons(v289, v290, v291) -> v290
                            Uh39Nil -> {
                                let v292 = "Status"
                                v292
                            }
                        }
                    let v295 = v238 <> v294 
                    let v296 = erlang_term_coerce(v233)
                    let v297 = atom.create(v226)
                    let v298 = "byte_size"
                    let v299 = atom.create(v298)
                    let v300 = []
                    let v301 = [v296, ..v300]
                    let v302 = erlang_term_apply(v297, v299, v301)
                    let v303 = erlang_term_coerce(v302)
                    let v304 = int.to_string(v303)
                    let v305 = "\r\nContent-Length: "
                    let v306 = v305 <> v304 
                    let v307 = "\r\nContent-Type: application/json; charset=utf-8"
                    let v308 = v307 <> v306 
                    let v309 = "\r\nConnection: close\r\n\r\n"
                    let v310 = v308 <> v309 
                    let v311 = v295 <> v310 
                    let v312 = v311 <> v233 
                    Us2Some(v312)
                }
                False -> {
                    let v314 = erlang_term_coerce(False)
                    let v315 = "protected"
                    let v316 = erlang_term_coerce(v315)
                    let v317 = erlang_term_coerce(v314)
                    let v318 = atom.create(v3)
                    let v319 = "get"
                    let v320 = atom.create(v319)
                    let v321 = []
                    let v322 = [v317, ..v321]
                    let v323 = [v0, ..v322]
                    let v324 = [v316, ..v323]
                    let v325 = erlang_term_apply(v318, v320, v324)
                    let v326 = erlang_term_coerce(v325)
                    let v327 = erlang_term_coerce(v326)
                    case v327 {
                        True -> {
                            let v328 = "https://api.x.com/2/problems/not-authorized-for-resource"
                            let v329 = erlang_term_coerce(v328)
                            let v330 = "Authorization Error"
                            let v331 = erlang_term_coerce(v330)
                            let v332 = ""
                            let v333 = erlang_term_coerce(v332)
                            let v334 = "username"
                            let v335 = erlang_term_coerce(v334)
                            let v336 = erlang_term_coerce(v333)
                            let v337 = atom.create(v3)
                            let v338 = atom.create(v319)
                            let v339 = []
                            let v340 = [v336, ..v339]
                            let v341 = [v0, ..v340]
                            let v342 = [v335, ..v341]
                            let v343 = erlang_term_apply(v337, v338, v342)
                            let v344 = erlang_term_coerce(v343)
                            let v345 = erlang_term_coerce(v344)
                            let v346 = "Sorry, you are not authorized to see the posts of @"
                            let v347 = v346 <> v345 
                            let v348 = "."
                            let v349 = v347 <> v348 
                            let v350 = erlang_term_coerce(v349)
                            let v351 = "type"
                            let v352 = atom.create(v351)
                            let v353 = erlang_term_coerce(v352)
                            let v354 = []
                            let v355 = [v329, ..v354]
                            let v356 = [v353, ..v355]
                            let v357 = erlang_term_tuple(v356)
                            let v358 = "detail"
                            let v359 = atom.create(v358)
                            let v360 = erlang_term_coerce(v359)
                            let v361 = []
                            let v362 = [v350, ..v361]
                            let v363 = [v360, ..v362]
                            let v364 = erlang_term_tuple(v363)
                            let v365 = "title"
                            let v366 = atom.create(v365)
                            let v367 = erlang_term_coerce(v366)
                            let v368 = []
                            let v369 = [v331, ..v368]
                            let v370 = [v367, ..v369]
                            let v371 = erlang_term_tuple(v370)
                            let v372 = []
                            let v373 = [v357, ..v372]
                            let v374 = [v364, ..v373]
                            let v375 = [v371, ..v374]
                            let v376 = erlang_term_coerce(v375)
                            let v377 = atom.create(v3)
                            let v378 = "from_list"
                            let v379 = atom.create(v378)
                            let v380 = []
                            let v381 = [v376, ..v380]
                            let v382 = erlang_term_apply(v377, v379, v381)
                            let v383 = []
                            let v384 = [v382, ..v383]
                            let v385 = erlang_term_coerce(v384)
                            let v386 = "errors"
                            let v387 = atom.create(v386)
                            let v388 = erlang_term_coerce(v387)
                            let v389 = []
                            let v390 = [v385, ..v389]
                            let v391 = [v388, ..v390]
                            let v392 = erlang_term_tuple(v391)
                            let v393 = []
                            let v394 = [v392, ..v393]
                            let v395 = erlang_term_coerce(v394)
                            let v396 = atom.create(v3)
                            let v397 = atom.create(v378)
                            let v398 = []
                            let v399 = [v395, ..v398]
                            let v400 = erlang_term_apply(v396, v397, v399)
                            let v401 = "json"
                            let v402 = atom.create(v401)
                            let v403 = "encode"
                            let v404 = atom.create(v403)
                            let v405 = []
                            let v406 = [v400, ..v405]
                            let v407 = erlang_term_apply(v402, v404, v406)
                            let v408 = "erlang"
                            let v409 = atom.create(v408)
                            let v410 = "iolist_to_binary"
                            let v411 = atom.create(v410)
                            let v412 = []
                            let v413 = [v407, ..v412]
                            let v414 = erlang_term_apply(v409, v411, v413)
                            let v415 = erlang_term_coerce(v414)
                            let v416 = int.to_string(200)
                            let v417 = "HTTP/1.1 "
                            let v418 = v417 <> v416 
                            let v419 = " "
                            let v420 = v418 <> v419 
                            let v421 = "OK"
                            let v422 = v420 <> v421 
                            let v423 = erlang_term_coerce(v415)
                            let v424 = atom.create(v408)
                            let v425 = "byte_size"
                            let v426 = atom.create(v425)
                            let v427 = []
                            let v428 = [v423, ..v427]
                            let v429 = erlang_term_apply(v424, v426, v428)
                            let v430 = erlang_term_coerce(v429)
                            let v431 = int.to_string(v430)
                            let v432 = "\r\nContent-Length: "
                            let v433 = v432 <> v431 
                            let v434 = "\r\nContent-Type: application/json; charset=utf-8"
                            let v435 = v434 <> v433 
                            let v436 = "\r\nConnection: close\r\n\r\n"
                            let v437 = v435 <> v436 
                            let v438 = v422 <> v437 
                            let v439 = v438 <> v415 
                            Us2Some(v439)
                        }
                        False -> Us2None
                    }
                }
            }
        }
    }
}

pub fn method492(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method492(v3, v1)
            let v5 = v2 != ""
            case v5 {
                True -> Uh3Cons(v2, v4)
                False -> v4
            }
        }
        Uh3Nil -> v1
    }
}

pub fn method493(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method493(v3, v1)
            let v5 = ""
            let v6 = erlang_term_coerce(v5)
            let v7 = "id"
            let v8 = erlang_term_coerce(v7)
            let v9 = erlang_term_coerce(v6)
            let v10 = "maps"
            let v11 = atom.create(v10)
            let v12 = "get"
            let v13 = atom.create(v12)
            let v14 = []
            let v15 = [v9, ..v14]
            let v16 = [v2, ..v15]
            let v17 = [v8, ..v16]
            let v18 = erlang_term_apply(v11, v13, v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = "erlang"
            let v21 = atom.create(v20)
            let v22 = "is_binary"
            let v23 = atom.create(v22)
            let v24 = []
            let v25 = [v19, ..v24]
            let v26 = erlang_term_apply(v21, v23, v25)
            let v27 = erlang_term_coerce(v26)
            let v36 =
                case v27 {
                    True -> {
                        let v28 = erlang_term_coerce(v19)
                        v28
                    }
                    False -> {
                        let v29 = atom.create(v20)
                        let v30 = "integer_to_binary"
                        let v31 = atom.create(v30)
                        let v32 = []
                        let v33 = [v19, ..v32]
                        let v34 = erlang_term_apply(v29, v31, v33)
                        let v35 = erlang_term_coerce(v34)
                        v35
                    }
                }
            Uh3Cons(v36, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method494(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh3) -> Uh3 {
    case v12  {
        Uh3Cons(v14, v15) -> {
            let v16 = method494(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v15, v13)
            let v17 = dict.has_key(v5, v14)
            case v17 {
                True -> Uh3Cons(v14, v16)
                False -> v16
            }
        }
        Uh3Nil -> v13
    }
}

pub fn method495(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh29) -> Uh29 {
    case v12  {
        Uh3Cons(v14, v15) -> {
            let v16 = method495(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v15, v13)
            let v17 = dict.get(v5, v14)
            let v18 = method455()
            let v19 = method456()
            let v20 = case v17 { Ok(x) -> v18(x) Error(x) -> v19(x) }
            let v25 =
                case v20  {
                    Us96Error -> Us97None
                    Us96Ok(v21) -> Us97Some(v21)
                }
            let v29 =
                case v25  {
                    Us97None -> panic as "dict.present: the key is not in the dict"
                    Us97Some(v26) -> v26
                }
            Uh29Cons(v29, v16)
        }
        Uh3Nil -> v13
    }
}

pub fn method496(v0: Uh29, v1: Uh29) -> Uh29 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method496(v3, v1)
            let v5 = ""
            let v6 = erlang_term_coerce(v5)
            let v7 = "lost"
            let v8 = erlang_term_coerce(v7)
            let v9 = erlang_term_coerce(v6)
            let v10 = "maps"
            let v11 = atom.create(v10)
            let v12 = "get"
            let v13 = atom.create(v12)
            let v14 = []
            let v15 = [v9, ..v14]
            let v16 = [v2, ..v15]
            let v17 = [v8, ..v16]
            let v18 = erlang_term_apply(v11, v13, v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = "true"
            let v21 = atom.create(v20)
            let v22 = erlang_term_coerce(v21)
            let v23 = v19 == v22
            let v24 = v23 == False
            case v24 {
                True -> Uh29Cons(v2, v4)
                False -> v4
            }
        }
        Uh29Nil -> v1
    }
}

pub fn closure145(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "replies"
        v1
    }
}

pub fn method498() -> fn(String) -> Bool {
    closure145(Nil)
}

pub fn method499(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method498()
                    method499(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn method500(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method500(v3, v1)
            let v5 = ""
            let v6 = erlang_term_coerce(v5)
            let v7 = "type"
            let v8 = erlang_term_coerce(v7)
            let v9 = erlang_term_coerce(v6)
            let v10 = "maps"
            let v11 = atom.create(v10)
            let v12 = "get"
            let v13 = atom.create(v12)
            let v14 = []
            let v15 = [v9, ..v14]
            let v16 = [v2, ..v15]
            let v17 = [v8, ..v16]
            let v18 = erlang_term_apply(v11, v13, v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = erlang_term_coerce(v19)
            Uh3Cons(v20, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn closure146(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "replied_to"
        v1
    }
}

pub fn method501() -> fn(String) -> Bool {
    closure146(Nil)
}

pub fn method502(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method501()
                    method502(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn closure147(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "retweets"
        v1
    }
}

pub fn method503() -> fn(String) -> Bool {
    closure147(Nil)
}

pub fn method504(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method503()
                    method504(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn closure148(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "reposted"
        v1
    }
}

pub fn method505() -> fn(String) -> Bool {
    closure148(Nil)
}

pub fn method506(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method505()
                    method506(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn method497(v0: Uh3, v1: Uh29, v2: Uh29) -> Uh29 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method497(v0, v4, v2)
            let v6 = method498()
            let v7 = method499(v6, v0)
            let v36 =
                case v7 {
                    True -> {
                        let v8 = []
                        let v9 = erlang_term_coerce(v8)
                        let v10 = "refs"
                        let v11 = erlang_term_coerce(v10)
                        let v12 = erlang_term_coerce(v9)
                        let v13 = "maps"
                        let v14 = atom.create(v13)
                        let v15 = "get"
                        let v16 = atom.create(v15)
                        let v17 = []
                        let v18 = [v12, ..v17]
                        let v19 = [v3, ..v18]
                        let v20 = [v11, ..v19]
                        let v21 = erlang_term_apply(v14, v16, v20)
                        let v22 = erlang_term_coerce(v21)
                        let v23 = "lists"
                        let v24 = atom.create(v23)
                        let v25 = "reverse"
                        let v26 = atom.create(v25)
                        let v27 = []
                        let v28 = [v22, ..v27]
                        let v29 = erlang_term_apply(v24, v26, v28)
                        let v30 = Uh29Nil
                        let v31 = items_from_301(v29, v30)
                        let v32 = Uh3Nil
                        let v33 = method500(v31, v32)
                        let v34 = method501()
                        method502(v34, v33)
                    }
                    False -> False
                }
            let v68 =
                case v36 {
                    True -> True
                    False -> {
                        let v37 = method503()
                        let v38 = method504(v37, v0)
                        case v38 {
                            True -> {
                                let v39 = []
                                let v40 = erlang_term_coerce(v39)
                                let v41 = "refs"
                                let v42 = erlang_term_coerce(v41)
                                let v43 = erlang_term_coerce(v40)
                                let v44 = "maps"
                                let v45 = atom.create(v44)
                                let v46 = "get"
                                let v47 = atom.create(v46)
                                let v48 = []
                                let v49 = [v43, ..v48]
                                let v50 = [v3, ..v49]
                                let v51 = [v42, ..v50]
                                let v52 = erlang_term_apply(v45, v47, v51)
                                let v53 = erlang_term_coerce(v52)
                                let v54 = "lists"
                                let v55 = atom.create(v54)
                                let v56 = "reverse"
                                let v57 = atom.create(v56)
                                let v58 = []
                                let v59 = [v53, ..v58]
                                let v60 = erlang_term_apply(v55, v57, v59)
                                let v61 = Uh29Nil
                                let v62 = items_from_301(v60, v61)
                                let v63 = Uh3Nil
                                let v64 = method500(v62, v63)
                                let v65 = method505()
                                method506(v65, v64)
                            }
                            False -> False
                        }
                    }
                }
            let v69 = v68 == False
            case v69 {
                True -> Uh29Cons(v3, v5)
                False -> v5
            }
        }
        Uh29Nil -> v2
    }
}
