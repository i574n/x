import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/string
import xsim_frames/types.{type Uh3, type Us2, type Uh29, Uh29Cons, Uh29Nil, Uh39Cons, Uh39Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us72None, Us72Some, Us94Error, Us94Ok}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_slice}
import xsim_frames/part26.{method444}
import xsim_frames/part28.{method471, method472}

pub fn timeline_fault_485(v0: Dynamic) -> Us2 {
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
            let v13 = atom.create(v3)
            let v14 = "get"
            let v15 = atom.create(v14)
            let v16 = []
            let v17 = [v0, ..v16]
            let v18 = [v12, ..v17]
            let v19 = erlang_term_apply(v13, v15, v18)
            let v20 = erlang_term_coerce(v19)
            let v21 = "plain_body"
            let v22 = erlang_term_coerce(v21)
            let v23 = ""
            let v24 = erlang_term_coerce(v23)
            let v25 = atom.create(v3)
            let v26 = atom.create(v14)
            let v27 = []
            let v28 = [v24, ..v27]
            let v29 = [v0, ..v28]
            let v30 = [v22, ..v29]
            let v31 = erlang_term_apply(v25, v26, v30)
            let v32 = erlang_term_coerce(v31)
            let v33 = string.inspect(v20)
            let v34 = "HTTP/1.1 "
            let v35 = v34 <> v33 
            let v36 = " "
            let v37 = v35 <> v36 
            let v38 = 503 == v20
            let v43 =
                case v38 {
                    True -> {
                        let v39 = "Service Unavailable"
                        let v40 = Uh39Nil
                        Uh39Cons(503, v39, v40)
                    }
                    False -> Uh39Nil
                }
            let v44 = 502 == v20
            let v47 =
                case v44 {
                    True -> {
                        let v45 = "Bad Gateway"
                        Uh39Cons(502, v45, v43)
                    }
                    False -> v43
                }
            let v48 = 500 == v20
            let v51 =
                case v48 {
                    True -> {
                        let v49 = "Internal Server Error"
                        Uh39Cons(500, v49, v47)
                    }
                    False -> v47
                }
            let v52 = 429 == v20
            let v55 =
                case v52 {
                    True -> {
                        let v53 = "Too Many Requests"
                        Uh39Cons(429, v53, v51)
                    }
                    False -> v51
                }
            let v56 = 422 == v20
            let v59 =
                case v56 {
                    True -> {
                        let v57 = "Unprocessable Entity"
                        Uh39Cons(422, v57, v55)
                    }
                    False -> v55
                }
            let v60 = 404 == v20
            let v63 =
                case v60 {
                    True -> {
                        let v61 = "Not Found"
                        Uh39Cons(404, v61, v59)
                    }
                    False -> v59
                }
            let v64 = 403 == v20
            let v67 =
                case v64 {
                    True -> {
                        let v65 = "Forbidden"
                        Uh39Cons(403, v65, v63)
                    }
                    False -> v63
                }
            let v68 = 402 == v20
            let v71 =
                case v68 {
                    True -> {
                        let v69 = "Payment Required"
                        Uh39Cons(402, v69, v67)
                    }
                    False -> v67
                }
            let v72 = 401 == v20
            let v75 =
                case v72 {
                    True -> {
                        let v73 = "Unauthorized"
                        Uh39Cons(401, v73, v71)
                    }
                    False -> v71
                }
            let v76 = 400 == v20
            let v79 =
                case v76 {
                    True -> {
                        let v77 = "Bad Request"
                        Uh39Cons(400, v77, v75)
                    }
                    False -> v75
                }
            let v80 = 201 == v20
            let v83 =
                case v80 {
                    True -> {
                        let v81 = "Created"
                        Uh39Cons(201, v81, v79)
                    }
                    False -> v79
                }
            let v84 = 200 == v20
            let v87 =
                case v84 {
                    True -> {
                        let v85 = "OK"
                        Uh39Cons(200, v85, v83)
                    }
                    False -> v83
                }
            let v93 =
                case v87  {
                    Uh39Cons(v88, v89, v90) -> v89
                    Uh39Nil -> {
                        let v91 = "Status"
                        v91
                    }
                }
            let v94 = v37 <> v93 
            let v95 = erlang_term_coerce(v32)
            let v96 = "erlang"
            let v97 = atom.create(v96)
            let v98 = "byte_size"
            let v99 = atom.create(v98)
            let v100 = []
            let v101 = [v95, ..v100]
            let v102 = erlang_term_apply(v97, v99, v101)
            let v103 = erlang_term_coerce(v102)
            let v104 = string.inspect(v103)
            let v105 = "\r\nContent-Length: "
            let v106 = v105 <> v104 
            let v107 = "\r\nContent-Type: application/json; charset=utf-8"
            let v108 = v107 <> v106 
            let v109 = "\r\nConnection: close\r\n\r\n"
            let v110 = v108 <> v109 
            let v111 = v94 <> v110 
            let v112 = v111 <> v32 
            Us2Some(v112)
        }
        False -> {
            let v114 = "status"
            let v115 = erlang_term_coerce(v114)
            let v116 = atom.create(v3)
            let v117 = atom.create(v5)
            let v118 = []
            let v119 = [v0, ..v118]
            let v120 = [v115, ..v119]
            let v121 = erlang_term_apply(v116, v117, v120)
            let v122 = erlang_term_coerce(v121)
            case v122 {
                True -> {
                    let v123 = erlang_term_coerce(v114)
                    let v124 = atom.create(v3)
                    let v125 = "get"
                    let v126 = atom.create(v125)
                    let v127 = []
                    let v128 = [v0, ..v127]
                    let v129 = [v123, ..v128]
                    let v130 = erlang_term_apply(v124, v126, v129)
                    let v131 = erlang_term_coerce(v130)
                    let v132 = erlang_term_coerce(v114)
                    let v133 = atom.create(v3)
                    let v134 = atom.create(v125)
                    let v135 = []
                    let v136 = [v0, ..v135]
                    let v137 = [v132, ..v136]
                    let v138 = erlang_term_apply(v133, v134, v137)
                    let v139 = erlang_term_coerce(v138)
                    let v140 = "problem_title"
                    let v141 = erlang_term_coerce(v140)
                    let v142 = ""
                    let v143 = erlang_term_coerce(v142)
                    let v144 = atom.create(v3)
                    let v145 = atom.create(v125)
                    let v146 = []
                    let v147 = [v143, ..v146]
                    let v148 = [v0, ..v147]
                    let v149 = [v141, ..v148]
                    let v150 = erlang_term_apply(v144, v145, v149)
                    let v151 = erlang_term_coerce(v150)
                    let v152 = "problem_detail"
                    let v153 = erlang_term_coerce(v152)
                    let v154 = erlang_term_coerce(v142)
                    let v155 = atom.create(v3)
                    let v156 = atom.create(v125)
                    let v157 = []
                    let v158 = [v154, ..v157]
                    let v159 = [v0, ..v158]
                    let v160 = [v153, ..v159]
                    let v161 = erlang_term_apply(v155, v156, v160)
                    let v162 = erlang_term_coerce(v161)
                    let v163 = erlang_term_coerce(v151)
                    let v164 = erlang_term_coerce(v162)
                    let v165 = "about:blank"
                    let v166 = erlang_term_coerce(v165)
                    let v167 = erlang_term_coerce(v139)
                    let v168 = atom.create(v114)
                    let v169 = erlang_term_coerce(v168)
                    let v170 = []
                    let v171 = [v167, ..v170]
                    let v172 = [v169, ..v171]
                    let v173 = erlang_term_tuple(v172)
                    let v174 = "type"
                    let v175 = atom.create(v174)
                    let v176 = erlang_term_coerce(v175)
                    let v177 = []
                    let v178 = [v166, ..v177]
                    let v179 = [v176, ..v178]
                    let v180 = erlang_term_tuple(v179)
                    let v181 = "detail"
                    let v182 = atom.create(v181)
                    let v183 = erlang_term_coerce(v182)
                    let v184 = []
                    let v185 = [v164, ..v184]
                    let v186 = [v183, ..v185]
                    let v187 = erlang_term_tuple(v186)
                    let v188 = "title"
                    let v189 = atom.create(v188)
                    let v190 = erlang_term_coerce(v189)
                    let v191 = []
                    let v192 = [v163, ..v191]
                    let v193 = [v190, ..v192]
                    let v194 = erlang_term_tuple(v193)
                    let v195 = []
                    let v196 = [v173, ..v195]
                    let v197 = [v180, ..v196]
                    let v198 = [v187, ..v197]
                    let v199 = [v194, ..v198]
                    let v200 = erlang_term_coerce(v199)
                    let v201 = atom.create(v3)
                    let v202 = "from_list"
                    let v203 = atom.create(v202)
                    let v204 = []
                    let v205 = [v200, ..v204]
                    let v206 = erlang_term_apply(v201, v203, v205)
                    let v207 = "json"
                    let v208 = atom.create(v207)
                    let v209 = "encode"
                    let v210 = atom.create(v209)
                    let v211 = []
                    let v212 = [v206, ..v211]
                    let v213 = erlang_term_apply(v208, v210, v212)
                    let v214 = "erlang"
                    let v215 = atom.create(v214)
                    let v216 = "iolist_to_binary"
                    let v217 = atom.create(v216)
                    let v218 = []
                    let v219 = [v213, ..v218]
                    let v220 = erlang_term_apply(v215, v217, v219)
                    let v221 = erlang_term_coerce(v220)
                    let v222 = string.inspect(v131)
                    let v223 = "HTTP/1.1 "
                    let v224 = v223 <> v222 
                    let v225 = " "
                    let v226 = v224 <> v225 
                    let v227 = 503 == v131
                    let v232 =
                        case v227 {
                            True -> {
                                let v228 = "Service Unavailable"
                                let v229 = Uh39Nil
                                Uh39Cons(503, v228, v229)
                            }
                            False -> Uh39Nil
                        }
                    let v233 = 502 == v131
                    let v236 =
                        case v233 {
                            True -> {
                                let v234 = "Bad Gateway"
                                Uh39Cons(502, v234, v232)
                            }
                            False -> v232
                        }
                    let v237 = 500 == v131
                    let v240 =
                        case v237 {
                            True -> {
                                let v238 = "Internal Server Error"
                                Uh39Cons(500, v238, v236)
                            }
                            False -> v236
                        }
                    let v241 = 429 == v131
                    let v244 =
                        case v241 {
                            True -> {
                                let v242 = "Too Many Requests"
                                Uh39Cons(429, v242, v240)
                            }
                            False -> v240
                        }
                    let v245 = 422 == v131
                    let v248 =
                        case v245 {
                            True -> {
                                let v246 = "Unprocessable Entity"
                                Uh39Cons(422, v246, v244)
                            }
                            False -> v244
                        }
                    let v249 = 404 == v131
                    let v252 =
                        case v249 {
                            True -> {
                                let v250 = "Not Found"
                                Uh39Cons(404, v250, v248)
                            }
                            False -> v248
                        }
                    let v253 = 403 == v131
                    let v256 =
                        case v253 {
                            True -> {
                                let v254 = "Forbidden"
                                Uh39Cons(403, v254, v252)
                            }
                            False -> v252
                        }
                    let v257 = 402 == v131
                    let v260 =
                        case v257 {
                            True -> {
                                let v258 = "Payment Required"
                                Uh39Cons(402, v258, v256)
                            }
                            False -> v256
                        }
                    let v261 = 401 == v131
                    let v264 =
                        case v261 {
                            True -> {
                                let v262 = "Unauthorized"
                                Uh39Cons(401, v262, v260)
                            }
                            False -> v260
                        }
                    let v265 = 400 == v131
                    let v268 =
                        case v265 {
                            True -> {
                                let v266 = "Bad Request"
                                Uh39Cons(400, v266, v264)
                            }
                            False -> v264
                        }
                    let v269 = 201 == v131
                    let v272 =
                        case v269 {
                            True -> {
                                let v270 = "Created"
                                Uh39Cons(201, v270, v268)
                            }
                            False -> v268
                        }
                    let v273 = 200 == v131
                    let v276 =
                        case v273 {
                            True -> {
                                let v274 = "OK"
                                Uh39Cons(200, v274, v272)
                            }
                            False -> v272
                        }
                    let v282 =
                        case v276  {
                            Uh39Cons(v277, v278, v279) -> v278
                            Uh39Nil -> {
                                let v280 = "Status"
                                v280
                            }
                        }
                    let v283 = v226 <> v282 
                    let v284 = erlang_term_coerce(v221)
                    let v285 = atom.create(v214)
                    let v286 = "byte_size"
                    let v287 = atom.create(v286)
                    let v288 = []
                    let v289 = [v284, ..v288]
                    let v290 = erlang_term_apply(v285, v287, v289)
                    let v291 = erlang_term_coerce(v290)
                    let v292 = string.inspect(v291)
                    let v293 = "\r\nContent-Length: "
                    let v294 = v293 <> v292 
                    let v295 = "\r\nContent-Type: application/json; charset=utf-8"
                    let v296 = v295 <> v294 
                    let v297 = "\r\nConnection: close\r\n\r\n"
                    let v298 = v296 <> v297 
                    let v299 = v283 <> v298 
                    let v300 = v299 <> v221 
                    Us2Some(v300)
                }
                False -> {
                    let v302 = erlang_term_coerce(False)
                    let v303 = "protected"
                    let v304 = erlang_term_coerce(v303)
                    let v305 = atom.create(v3)
                    let v306 = "get"
                    let v307 = atom.create(v306)
                    let v308 = []
                    let v309 = [v302, ..v308]
                    let v310 = [v0, ..v309]
                    let v311 = [v304, ..v310]
                    let v312 = erlang_term_apply(v305, v307, v311)
                    let v313 = erlang_term_coerce(v312)
                    case v313 {
                        True -> {
                            let v314 = "https://api.x.com/2/problems/not-authorized-for-resource"
                            let v315 = erlang_term_coerce(v314)
                            let v316 = "Authorization Error"
                            let v317 = erlang_term_coerce(v316)
                            let v318 = "username"
                            let v319 = erlang_term_coerce(v318)
                            let v320 = ""
                            let v321 = erlang_term_coerce(v320)
                            let v322 = atom.create(v3)
                            let v323 = atom.create(v306)
                            let v324 = []
                            let v325 = [v321, ..v324]
                            let v326 = [v0, ..v325]
                            let v327 = [v319, ..v326]
                            let v328 = erlang_term_apply(v322, v323, v327)
                            let v329 = erlang_term_coerce(v328)
                            let v330 = "Sorry, you are not authorized to see the posts of @"
                            let v331 = v330 <> v329 
                            let v332 = "."
                            let v333 = v331 <> v332 
                            let v334 = erlang_term_coerce(v333)
                            let v335 = "type"
                            let v336 = atom.create(v335)
                            let v337 = erlang_term_coerce(v336)
                            let v338 = []
                            let v339 = [v315, ..v338]
                            let v340 = [v337, ..v339]
                            let v341 = erlang_term_tuple(v340)
                            let v342 = "detail"
                            let v343 = atom.create(v342)
                            let v344 = erlang_term_coerce(v343)
                            let v345 = []
                            let v346 = [v334, ..v345]
                            let v347 = [v344, ..v346]
                            let v348 = erlang_term_tuple(v347)
                            let v349 = "title"
                            let v350 = atom.create(v349)
                            let v351 = erlang_term_coerce(v350)
                            let v352 = []
                            let v353 = [v317, ..v352]
                            let v354 = [v351, ..v353]
                            let v355 = erlang_term_tuple(v354)
                            let v356 = []
                            let v357 = [v341, ..v356]
                            let v358 = [v348, ..v357]
                            let v359 = [v355, ..v358]
                            let v360 = erlang_term_coerce(v359)
                            let v361 = atom.create(v3)
                            let v362 = "from_list"
                            let v363 = atom.create(v362)
                            let v364 = []
                            let v365 = [v360, ..v364]
                            let v366 = erlang_term_apply(v361, v363, v365)
                            let v367 = []
                            let v368 = [v366, ..v367]
                            let v369 = erlang_term_coerce(v368)
                            let v370 = "errors"
                            let v371 = atom.create(v370)
                            let v372 = erlang_term_coerce(v371)
                            let v373 = []
                            let v374 = [v369, ..v373]
                            let v375 = [v372, ..v374]
                            let v376 = erlang_term_tuple(v375)
                            let v377 = []
                            let v378 = [v376, ..v377]
                            let v379 = erlang_term_coerce(v378)
                            let v380 = atom.create(v3)
                            let v381 = atom.create(v362)
                            let v382 = []
                            let v383 = [v379, ..v382]
                            let v384 = erlang_term_apply(v380, v381, v383)
                            let v385 = "json"
                            let v386 = atom.create(v385)
                            let v387 = "encode"
                            let v388 = atom.create(v387)
                            let v389 = []
                            let v390 = [v384, ..v389]
                            let v391 = erlang_term_apply(v386, v388, v390)
                            let v392 = "erlang"
                            let v393 = atom.create(v392)
                            let v394 = "iolist_to_binary"
                            let v395 = atom.create(v394)
                            let v396 = []
                            let v397 = [v391, ..v396]
                            let v398 = erlang_term_apply(v393, v395, v397)
                            let v399 = erlang_term_coerce(v398)
                            let v400 = string.inspect(200)
                            let v401 = "HTTP/1.1 "
                            let v402 = v401 <> v400 
                            let v403 = " "
                            let v404 = v402 <> v403 
                            let v405 = "OK"
                            let v406 = v404 <> v405 
                            let v407 = erlang_term_coerce(v399)
                            let v408 = atom.create(v392)
                            let v409 = "byte_size"
                            let v410 = atom.create(v409)
                            let v411 = []
                            let v412 = [v407, ..v411]
                            let v413 = erlang_term_apply(v408, v410, v412)
                            let v414 = erlang_term_coerce(v413)
                            let v415 = string.inspect(v414)
                            let v416 = "\r\nContent-Length: "
                            let v417 = v416 <> v415 
                            let v418 = "\r\nContent-Type: application/json; charset=utf-8"
                            let v419 = v418 <> v417 
                            let v420 = "\r\nConnection: close\r\n\r\n"
                            let v421 = v419 <> v420 
                            let v422 = v406 <> v421 
                            let v423 = v422 <> v399 
                            Us2Some(v423)
                        }
                        False -> Us2None
                    }
                }
            }
        }
    }
}

pub fn method488(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method488(v3, v1)
            let v5 = v2 != ""
            case v5 {
                True -> Uh3Cons(v2, v4)
                False -> v4
            }
        }
        Uh3Nil -> v1
    }
}

pub fn method489(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method489(v3, v1)
            let v5 = "id"
            let v6 = erlang_term_coerce(v5)
            let v7 = ""
            let v8 = erlang_term_coerce(v7)
            let v9 = "maps"
            let v10 = atom.create(v9)
            let v11 = "get"
            let v12 = atom.create(v11)
            let v13 = []
            let v14 = [v8, ..v13]
            let v15 = [v2, ..v14]
            let v16 = [v6, ..v15]
            let v17 = erlang_term_apply(v10, v12, v16)
            let v18 = "erlang"
            let v19 = atom.create(v18)
            let v20 = "is_binary"
            let v21 = atom.create(v20)
            let v22 = []
            let v23 = [v17, ..v22]
            let v24 = erlang_term_apply(v19, v21, v23)
            let v25 = erlang_term_coerce(v24)
            let v34 =
                case v25 {
                    True -> {
                        let v26 = erlang_term_coerce(v17)
                        v26
                    }
                    False -> {
                        let v27 = atom.create(v18)
                        let v28 = "integer_to_binary"
                        let v29 = atom.create(v28)
                        let v30 = []
                        let v31 = [v17, ..v30]
                        let v32 = erlang_term_apply(v27, v29, v31)
                        let v33 = erlang_term_coerce(v32)
                        v33
                    }
                }
            Uh3Cons(v34, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method490(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh3) -> Uh3 {
    case v12  {
        Uh3Cons(v14, v15) -> {
            let v16 = method490(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v15, v13)
            let v17 = dict.has_key(v5, v14)
            case v17 {
                True -> Uh3Cons(v14, v16)
                False -> v16
            }
        }
        Uh3Nil -> v13
    }
}

pub fn method491(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh29) -> Uh29 {
    case v12  {
        Uh3Cons(v14, v15) -> {
            let v16 = method491(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v15, v13)
            let v17 = dict.get(v5, v14)
            let v18 = method471()
            let v19 = method472()
            let v20 = case v17 { Ok(x) -> v18(x) Error(x) -> v19(x) }
            let v25 =
                case v20  {
                    Us94Error -> Us72None
                    Us94Ok(v21) -> Us72Some(v21)
                }
            let v29 =
                case v25  {
                    Us72None -> panic as "dictm.present: the key is not in the dict"
                    Us72Some(v26) -> v26
                }
            Uh29Cons(v29, v16)
        }
        Uh3Nil -> v13
    }
}

pub fn closure147(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "replies"
        v1
    }
}

pub fn method493() -> fn(String) -> Bool {
    closure147(Nil)
}

pub fn method494(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method493()
                    method494(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn method495(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method495(v3, v1)
            let v5 = "type"
            let v6 = erlang_term_coerce(v5)
            let v7 = ""
            let v8 = erlang_term_coerce(v7)
            let v9 = "maps"
            let v10 = atom.create(v9)
            let v11 = "get"
            let v12 = atom.create(v11)
            let v13 = []
            let v14 = [v8, ..v13]
            let v15 = [v2, ..v14]
            let v16 = [v6, ..v15]
            let v17 = erlang_term_apply(v10, v12, v16)
            let v18 = erlang_term_coerce(v17)
            Uh3Cons(v18, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn closure148(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "replied_to"
        v1
    }
}

pub fn method496() -> fn(String) -> Bool {
    closure148(Nil)
}

pub fn method497(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method496()
                    method497(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn closure149(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "retweets"
        v1
    }
}

pub fn method498() -> fn(String) -> Bool {
    closure149(Nil)
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

pub fn closure150(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "reposted"
        v1
    }
}

pub fn method500() -> fn(String) -> Bool {
    closure150(Nil)
}

pub fn method501(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method500()
                    method501(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn method492(v0: Uh3, v1: Uh29, v2: Uh29) -> Uh29 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method492(v0, v4, v2)
            let v6 = method493()
            let v7 = method494(v6, v0)
            let v35 =
                case v7 {
                    True -> {
                        let v8 = "refs"
                        let v9 = erlang_term_coerce(v8)
                        let v10 = []
                        let v11 = erlang_term_coerce(v10)
                        let v12 = "maps"
                        let v13 = atom.create(v12)
                        let v14 = "get"
                        let v15 = atom.create(v14)
                        let v16 = []
                        let v17 = [v11, ..v16]
                        let v18 = [v3, ..v17]
                        let v19 = [v9, ..v18]
                        let v20 = erlang_term_apply(v13, v15, v19)
                        let v21 = "erlang"
                        let v22 = atom.create(v21)
                        let v23 = "length"
                        let v24 = atom.create(v23)
                        let v25 = []
                        let v26 = [v20, ..v25]
                        let v27 = erlang_term_apply(v22, v24, v26)
                        let v28 = erlang_term_coerce(v27)
                        let v29 = 0
                        let v30 = method444(v28, v20, v29)
                        let v31 = Uh3Nil
                        let v32 = method495(v30, v31)
                        let v33 = method496()
                        method497(v33, v32)
                    }
                    False -> False
                }
            let v66 =
                case v35 {
                    True -> True
                    False -> {
                        let v36 = method498()
                        let v37 = method499(v36, v0)
                        case v37 {
                            True -> {
                                let v38 = "refs"
                                let v39 = erlang_term_coerce(v38)
                                let v40 = []
                                let v41 = erlang_term_coerce(v40)
                                let v42 = "maps"
                                let v43 = atom.create(v42)
                                let v44 = "get"
                                let v45 = atom.create(v44)
                                let v46 = []
                                let v47 = [v41, ..v46]
                                let v48 = [v3, ..v47]
                                let v49 = [v39, ..v48]
                                let v50 = erlang_term_apply(v43, v45, v49)
                                let v51 = "erlang"
                                let v52 = atom.create(v51)
                                let v53 = "length"
                                let v54 = atom.create(v53)
                                let v55 = []
                                let v56 = [v50, ..v55]
                                let v57 = erlang_term_apply(v52, v54, v56)
                                let v58 = erlang_term_coerce(v57)
                                let v59 = 0
                                let v60 = method444(v58, v50, v59)
                                let v61 = Uh3Nil
                                let v62 = method495(v60, v61)
                                let v63 = method500()
                                method501(v63, v62)
                            }
                            False -> False
                        }
                    }
                }
            let v67 = v66 == False
            case v67 {
                True -> Uh29Cons(v3, v5)
                False -> v5
            }
        }
        Uh29Nil -> v2
    }
}

pub fn method502(v0: String, v1: Uh29, v2: Uh29) -> Uh29 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method502(v0, v4, v2)
            let v6 = v0 == ""
            let v34 =
                case v6 {
                    True -> True
                    False -> {
                        let v7 = "created_at"
                        let v8 = erlang_term_coerce(v7)
                        let v9 = ""
                        let v10 = erlang_term_coerce(v9)
                        let v11 = "maps"
                        let v12 = atom.create(v11)
                        let v13 = "get"
                        let v14 = atom.create(v13)
                        let v15 = []
                        let v16 = [v10, ..v15]
                        let v17 = [v3, ..v16]
                        let v18 = [v8, ..v17]
                        let v19 = erlang_term_apply(v12, v14, v18)
                        let v20 = erlang_term_coerce(v19)
                        let v21 = spiral_string_slice(v20, 0, 18)
                        let v22 = spiral_string_slice(v0, 0, 18)
                        let v23 = erlang_term_coerce(v21)
                        let v24 = erlang_term_coerce(v22)
                        let v25 = "erlang"
                        let v26 = atom.create(v25)
                        let v27 = ">="
                        let v28 = atom.create(v27)
                        let v29 = []
                        let v30 = [v24, ..v29]
                        let v31 = [v23, ..v30]
                        let v32 = erlang_term_apply(v26, v28, v31)
                        let v33 = erlang_term_coerce(v32)
                        v33
                    }
                }
            case v34 {
                True -> Uh29Cons(v3, v5)
                False -> v5
            }
        }
        Uh29Nil -> v2
    }
}
