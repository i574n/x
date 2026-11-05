import gleam/bit_array
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{Uh29Nil, Uh3Cons, Uh3Nil, Us56Error, Us56Ok, Us80Error, Us80Ok, Us93Error, Us93Ok}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_fs_read_file, split_list_2}
import xsim_frames/part10.{method258, method259}
import xsim_frames/part13.{items_from_301}
import xsim_frames/part18.{method370, method371}
import xsim_frames/part2.{delimited_21, method20}
import xsim_frames/part20.{method396, method400, method401, method402, method403}
import xsim_frames/part24.{closure131, closure133, flags_parsed_430, method434, paired_rows_436}

pub fn closure130(capt: Nil) -> fn(String) -> Int {
    fn (v0) {
        let v1 = "crypto"
        let v2 = atom.create(v1)
        let v3 = erlang_term_coerce(v2)
        let v4 = "application"
        let v5 = atom.create(v4)
        let v6 = "ensure_all_started"
        let v7 = atom.create(v6)
        let v8 = []
        let v9 = [v3, ..v8]
        let v10 = erlang_term_apply(v5, v7, v9)
        let v11 = erlang_term_coerce(1)
        let v12 = "erlang"
        let v13 = atom.create(v12)
        let v14 = "element"
        let v15 = atom.create(v14)
        let v16 = []
        let v17 = [v10, ..v16]
        let v18 = [v11, ..v17]
        let v19 = erlang_term_apply(v13, v15, v18)
        let v20 = "ok"
        let v21 = atom.create(v20)
        let v22 = erlang_term_coerce(v21)
        let v23 = v19 == v22
        let v44 =
            case v23 {
                True -> True
                False -> {
                    let v24 = "xsim / "
                    let v25 = v24 <> v1 
                    let v26 = " did not start: "
                    let v27 = v25 <> v26 
                    let v28 = string.inspect(v10)
                    let v29 = v27 <> v28 
                    let v30 = "\n"
                    let v31 = v29 <> v30 
                    let v32 = "standard_error"
                    let v33 = atom.create(v32)
                    let v34 = erlang_term_coerce(v33)
                    let v35 = erlang_term_coerce(v31)
                    let v36 = "io"
                    let v37 = atom.create(v36)
                    let v38 = "put_chars"
                    let v39 = atom.create(v38)
                    let v40 = []
                    let v41 = [v35, ..v40]
                    let v42 = [v34, ..v41]
                    let _v43 = erlang_term_apply(v37, v39, v42)
                    False
                }
            }
        let _v84 =
            case v44 {
                True -> {
                    let v45 = "spiral_cells"
                    let v46 = atom.create(v45)
                    let v47 = erlang_term_coerce(v46)
                    let v48 = atom.create(v4)
                    let v49 = atom.create(v6)
                    let v50 = []
                    let v51 = [v47, ..v50]
                    let v52 = erlang_term_apply(v48, v49, v51)
                    let v53 = erlang_term_coerce(1)
                    let v54 = atom.create(v12)
                    let v55 = atom.create(v14)
                    let v56 = []
                    let v57 = [v52, ..v56]
                    let v58 = [v53, ..v57]
                    let v59 = erlang_term_apply(v54, v55, v58)
                    let v60 = atom.create(v20)
                    let v61 = erlang_term_coerce(v60)
                    let v62 = v59 == v61
                    case v62 {
                        True -> True
                        False -> {
                            let v63 = "xsim / "
                            let v64 = v63 <> v45 
                            let v65 = " did not start: "
                            let v66 = v64 <> v65 
                            let v67 = string.inspect(v52)
                            let v68 = v66 <> v67 
                            let v69 = "\n"
                            let v70 = v68 <> v69 
                            let v71 = "standard_error"
                            let v72 = atom.create(v71)
                            let v73 = erlang_term_coerce(v72)
                            let v74 = erlang_term_coerce(v70)
                            let v75 = "io"
                            let v76 = atom.create(v75)
                            let v77 = "put_chars"
                            let v78 = atom.create(v77)
                            let v79 = []
                            let v80 = [v74, ..v79]
                            let v81 = [v73, ..v80]
                            let _v82 = erlang_term_apply(v76, v78, v81)
                            False
                        }
                    }
                }
                False -> False
            }
        let v85 = "init"
        let v86 = atom.create(v85)
        let v87 = "get_plain_arguments"
        let v88 = atom.create(v87)
        let v89 = []
        let v90 = erlang_term_apply(v86, v88, v89)
        let v91 = "lists"
        let v92 = atom.create(v91)
        let v93 = "reverse"
        let v94 = atom.create(v93)
        let v95 = []
        let v96 = [v90, ..v95]
        let v97 = erlang_term_apply(v92, v94, v96)
        let v98 = Uh29Nil
        let v99 = items_from_301(v97, v98)
        let v100 = Uh3Nil
        let v101 = method396(v99, v100)
        let v106 =
            case v101  {
                Uh3Cons(v102, v103) -> v103
                Uh3Nil -> Uh3Nil
            }
        let v107 = closure131(Nil)
        let v108 = closure133(Nil)
        let v109 = ""
        let v110 = flags_parsed_430(v107, v108, v109, v109, v109, v106)
        let v132 =
            case v110  {
                Us93Ok(v111, v112, v113) -> {
                    let v114 = v111 == ""
                    let v121 =
                        case v114 {
                            True -> {
                                let v115 = "missing --file"
                                v115
                            }
                            False -> {
                                let v116 = v112 == ""
                                let v118 =
                                    case v116 {
                                        True -> {
                                            let v117 = v113 == ""
                                            v117
                                        }
                                        False -> False
                                    }
                                case v118 {
                                    True -> {
                                        let v119 = "missing --program (xc thread output) or --expected (a thread-*.expected.json)"
                                        v119
                                    }
                                    False -> v109
                                }
                            }
                        }
                    let v122 = v121 != ""
                    case v122 {
                        True -> {
                            let v129 =
                                case v114 {
                                    True -> {
                                        let v123 = "missing --file"
                                        v123
                                    }
                                    False -> {
                                        let v124 = v112 == ""
                                        let v126 =
                                            case v124 {
                                                True -> {
                                                    let v125 = v113 == ""
                                                    v125
                                                }
                                                False -> False
                                            }
                                        case v126 {
                                            True -> {
                                                let v127 = "missing --program (xc thread output) or --expected (a thread-*.expected.json)"
                                                v127
                                            }
                                            False -> v109
                                        }
                                    }
                                }
                            Us93Error(v129)
                        }
                        False -> v110
                    }
                }
                _ -> v110
            }
        let v787 =
            case v132  {
                Us93Error(v783) -> {
                    let v784 = "XSIM rejected thread_run: "
                    let v785 = v784 <> v783 
                    v785
                }
                Us93Ok(v133, v134, v135) -> {
                    let v136 = erlang_term_coerce(v133)
                    let v137 = "filename"
                    let v138 = atom.create(v137)
                    let v139 = "absname"
                    let v140 = atom.create(v139)
                    let v141 = []
                    let v142 = [v136, ..v141]
                    let v143 = erlang_term_apply(v138, v140, v142)
                    let v144 = "unicode"
                    let v145 = atom.create(v144)
                    let v146 = "characters_to_binary"
                    let v147 = atom.create(v146)
                    let v148 = []
                    let v149 = [v143, ..v148]
                    let v150 = erlang_term_apply(v145, v147, v149)
                    let v151 = erlang_term_coerce(v150)
                    let v152 = v134 != ""
                    let v227 =
                        case v152 {
                            True -> {
                                let v153 = spiral_fs_read_file(v134)
                                let v154 = method370()
                                let v155 = method371()
                                let v156 = case v153 { Ok(x) -> v154(x) Error(x) -> v155(x) }
                                case v156  {
                                    Us80Error(v166) -> panic as "file_system.read_all_text: file:read_file failed"
                                    Us80Ok(v157) -> {
                                        let v158 = bit_array.to_string(v157)
                                        let v159 = method258()
                                        let v160 = method259()
                                        let v161 = case v158 { Ok(x) -> v159(x) Error(x) -> v160(x) }
                                        case v161  {
                                            Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                            Us56Ok(v162) -> v162
                                        }
                                    }
                                }
                            }
                            False -> {
                                let v170 = "\n"
                                let v171 = erlang_term_coerce(v170)
                                let v172 = spiral_fs_read_file(v135)
                                let v173 = method370()
                                let v174 = method371()
                                let v175 = case v172 { Ok(x) -> v173(x) Error(x) -> v174(x) }
                                let v188 =
                                    case v175  {
                                        Us80Error(v185) -> panic as "file_system.read_all_text: file:read_file failed"
                                        Us80Ok(v176) -> {
                                            let v177 = bit_array.to_string(v176)
                                            let v178 = method258()
                                            let v179 = method259()
                                            let v180 = case v177 { Ok(x) -> v178(x) Error(x) -> v179(x) }
                                            case v180  {
                                                Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                                Us56Ok(v181) -> v181
                                            }
                                        }
                                    }
                                let v189 = erlang_term_coerce(v188)
                                let v190 = "json"
                                let v191 = atom.create(v190)
                                let v192 = "decode"
                                let v193 = atom.create(v192)
                                let v194 = []
                                let v195 = [v189, ..v194]
                                let v196 = erlang_term_apply(v191, v193, v195)
                                let v197 = []
                                let v198 = erlang_term_coerce(v197)
                                let v199 = "program"
                                let v200 = erlang_term_coerce(v199)
                                let v201 = erlang_term_coerce(v198)
                                let v202 = "maps"
                                let v203 = atom.create(v202)
                                let v204 = "get"
                                let v205 = atom.create(v204)
                                let v206 = []
                                let v207 = [v201, ..v206]
                                let v208 = [v196, ..v207]
                                let v209 = [v200, ..v208]
                                let v210 = erlang_term_apply(v203, v205, v209)
                                let v211 = erlang_term_coerce(v210)
                                let v212 = atom.create(v91)
                                let v213 = "join"
                                let v214 = atom.create(v213)
                                let v215 = []
                                let v216 = [v211, ..v215]
                                let v217 = [v171, ..v216]
                                let v218 = erlang_term_apply(v212, v214, v217)
                                let v219 = atom.create(v12)
                                let v220 = "iolist_to_binary"
                                let v221 = atom.create(v220)
                                let v222 = []
                                let v223 = [v218, ..v222]
                                let v224 = erlang_term_apply(v219, v221, v223)
                                let v225 = erlang_term_coerce(v224)
                                let v226 = v225 <> v170 
                                v226
                            }
                        }
                    let v228 = "\n"
                    let v229 = erlang_term_coerce(v227)
                    let v230 = erlang_term_coerce(v109)
                    let v231 = "Elixir.Spiral.Cells.Document"
                    let v232 = atom.create(v231)
                    let v233 = "parse_spi"
                    let v234 = atom.create(v233)
                    let v235 = []
                    let v236 = [v230, ..v235]
                    let v237 = [v229, ..v236]
                    let v238 = erlang_term_apply(v232, v234, v237)
                    let v239 = []
                    let v240 = erlang_term_coerce(v239)
                    let v241 = "cells"
                    let v242 = atom.create(v241)
                    let v243 = erlang_term_coerce(v242)
                    let v244 = erlang_term_coerce(v243)
                    let v245 = erlang_term_coerce(v240)
                    let v246 = "maps"
                    let v247 = atom.create(v246)
                    let v248 = "get"
                    let v249 = atom.create(v248)
                    let v250 = []
                    let v251 = [v245, ..v250]
                    let v252 = [v238, ..v251]
                    let v253 = [v244, ..v252]
                    let v254 = erlang_term_apply(v247, v249, v253)
                    let v255 = erlang_term_coerce(v254)
                    let v256 = atom.create(v91)
                    let v257 = atom.create(v93)
                    let v258 = []
                    let v259 = [v255, ..v258]
                    let v260 = erlang_term_apply(v256, v257, v259)
                    let v261 = Uh29Nil
                    let v262 = items_from_301(v260, v261)
                    let v263 = Uh29Nil
                    let v264 = method400(v262, v263)
                    let v265 = Uh3Nil
                    let v266 = method401(v264, v265)
                    let v267 = delimited_21(v228, v266)
                    let v268 = spiral_fs_read_file(v151)
                    let v269 = method370()
                    let v270 = method371()
                    let v271 = case v268 { Ok(x) -> v269(x) Error(x) -> v270(x) }
                    let v284 =
                        case v271  {
                            Us80Error(v281) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us80Ok(v272) -> {
                                let v273 = bit_array.to_string(v272)
                                let v274 = method258()
                                let v275 = method259()
                                let v276 = case v273 { Ok(x) -> v274(x) Error(x) -> v275(x) }
                                case v276  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v277) -> v277
                                }
                            }
                        }
                    let v285 = erlang_term_coerce(v284)
                    let v286 = erlang_term_coerce(v109)
                    let v287 = atom.create(v231)
                    let v288 = atom.create(v233)
                    let v289 = []
                    let v290 = [v286, ..v289]
                    let v291 = [v285, ..v290]
                    let v292 = erlang_term_apply(v287, v288, v291)
                    let v293 = []
                    let v294 = erlang_term_coerce(v293)
                    let v295 = atom.create(v241)
                    let v296 = erlang_term_coerce(v295)
                    let v297 = erlang_term_coerce(v296)
                    let v298 = erlang_term_coerce(v294)
                    let v299 = atom.create(v246)
                    let v300 = atom.create(v248)
                    let v301 = []
                    let v302 = [v298, ..v301]
                    let v303 = [v292, ..v302]
                    let v304 = [v297, ..v303]
                    let v305 = erlang_term_apply(v299, v300, v304)
                    let v306 = erlang_term_coerce(v305)
                    let v307 = atom.create(v91)
                    let v308 = atom.create(v93)
                    let v309 = []
                    let v310 = [v306, ..v309]
                    let v311 = erlang_term_apply(v307, v308, v310)
                    let v312 = Uh29Nil
                    let v313 = items_from_301(v311, v312)
                    let v314 = Uh29Nil
                    let v315 = method400(v313, v314)
                    let v316 = Uh3Nil
                    let v317 = method401(v315, v316)
                    let v318 = delimited_21(v228, v317)
                    let v319 = v267 == v318
                    let v320 = spiral_fs_read_file(v151)
                    let v321 = method370()
                    let v322 = method371()
                    let v323 = case v320 { Ok(x) -> v321(x) Error(x) -> v322(x) }
                    let v336 =
                        case v323  {
                            Us80Error(v333) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us80Ok(v324) -> {
                                let v325 = bit_array.to_string(v324)
                                let v326 = method258()
                                let v327 = method259()
                                let v328 = case v325 { Ok(x) -> v326(x) Error(x) -> v327(x) }
                                case v328  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v329) -> v329
                                }
                            }
                        }
                    let v337 = erlang_term_coerce(v336)
                    let v338 = erlang_term_coerce(v109)
                    let v339 = atom.create(v231)
                    let v340 = atom.create(v233)
                    let v341 = []
                    let v342 = [v338, ..v341]
                    let v343 = [v337, ..v342]
                    let v344 = erlang_term_apply(v339, v340, v343)
                    let v345 = erlang_term_coerce(v151)
                    let v346 = atom.create(v137)
                    let v347 = atom.create(v139)
                    let v348 = []
                    let v349 = [v345, ..v348]
                    let v350 = erlang_term_apply(v346, v347, v349)
                    let v351 = atom.create(v144)
                    let v352 = atom.create(v146)
                    let v353 = []
                    let v354 = [v350, ..v353]
                    let v355 = erlang_term_apply(v351, v352, v354)
                    let v356 = erlang_term_coerce(v355)
                    let v357 = erlang_term_coerce(v356)
                    let v358 = atom.create(v137)
                    let v359 = "dirname"
                    let v360 = atom.create(v359)
                    let v361 = []
                    let v362 = [v357, ..v361]
                    let v363 = erlang_term_apply(v358, v360, v362)
                    let v364 = atom.create(v144)
                    let v365 = atom.create(v146)
                    let v366 = []
                    let v367 = [v363, ..v366]
                    let v368 = erlang_term_apply(v364, v365, v367)
                    let v369 = erlang_term_coerce(v368)
                    let v370 = erlang_term_coerce(v151)
                    let v371 = "path"
                    let v372 = atom.create(v371)
                    let v373 = erlang_term_coerce(v372)
                    let v374 = []
                    let v375 = [v370, ..v374]
                    let v376 = [v373, ..v375]
                    let v377 = erlang_term_tuple(v376)
                    let v378 = erlang_term_coerce(v369)
                    let v379 = "root"
                    let v380 = atom.create(v379)
                    let v381 = erlang_term_coerce(v380)
                    let v382 = []
                    let v383 = [v378, ..v382]
                    let v384 = [v381, ..v383]
                    let v385 = erlang_term_tuple(v384)
                    let v386 = "tests"
                    let v387 = atom.create(v386)
                    let v388 = erlang_term_coerce(v387)
                    let v389 = "plan"
                    let v390 = atom.create(v389)
                    let v391 = erlang_term_coerce(v390)
                    let v392 = []
                    let v393 = [v388, ..v392]
                    let v394 = [v391, ..v393]
                    let v395 = erlang_term_tuple(v394)
                    let v396 = erlang_term_coerce(False)
                    let v397 = "spi"
                    let v398 = atom.create(v397)
                    let v399 = erlang_term_coerce(v398)
                    let v400 = []
                    let v401 = [v396, ..v400]
                    let v402 = [v399, ..v401]
                    let v403 = erlang_term_tuple(v402)
                    let v404 = erlang_term_coerce(False)
                    let v405 = "memo"
                    let v406 = atom.create(v405)
                    let v407 = erlang_term_coerce(v406)
                    let v408 = []
                    let v409 = [v404, ..v408]
                    let v410 = [v407, ..v409]
                    let v411 = erlang_term_tuple(v410)
                    let v412 = []
                    let v413 = [v411, ..v412]
                    let v414 = [v403, ..v413]
                    let v415 = [v395, ..v414]
                    let v416 = [v385, ..v415]
                    let v417 = [v377, ..v416]
                    let v418 = erlang_term_coerce(v417)
                    let v419 = "Elixir.Spiral.Cells.Notebook"
                    let v420 = atom.create(v419)
                    let v421 = "evaluate"
                    let v422 = atom.create(v421)
                    let v423 = []
                    let v424 = [v418, ..v423]
                    let v425 = [v344, ..v424]
                    let v426 = erlang_term_apply(v420, v422, v425)
                    let v427 = "none"
                    let v428 = atom.create(v427)
                    let v429 = erlang_term_coerce(v428)
                    let v430 = "status"
                    let v431 = atom.create(v430)
                    let v432 = erlang_term_coerce(v431)
                    let v433 = erlang_term_coerce(v432)
                    let v434 = erlang_term_coerce(v429)
                    let v435 = atom.create(v246)
                    let v436 = atom.create(v248)
                    let v437 = []
                    let v438 = [v434, ..v437]
                    let v439 = [v426, ..v438]
                    let v440 = [v433, ..v439]
                    let v441 = erlang_term_apply(v435, v436, v440)
                    let v442 = erlang_term_coerce(v441)
                    let v443 = atom.create(v20)
                    let v444 = erlang_term_coerce(v443)
                    let v445 = v442 == v444
                    case v445 {
                        True -> Nil
                        False -> {
                            let v446 = atom.create(v427)
                            let v447 = erlang_term_coerce(v446)
                            let v448 = atom.create(v430)
                            let v449 = erlang_term_coerce(v448)
                            let v450 = erlang_term_coerce(v449)
                            let v451 = erlang_term_coerce(v447)
                            let v452 = atom.create(v246)
                            let v453 = atom.create(v248)
                            let v454 = []
                            let v455 = [v451, ..v454]
                            let v456 = [v426, ..v455]
                            let v457 = [v450, ..v456]
                            let v458 = erlang_term_apply(v452, v453, v457)
                            let v459 = erlang_term_coerce(v458)
                            let v460 = string.inspect(v459)
                            let v461 = "xsim thread_run / evaluate status "
                            let v462 = v461 <> v460 
                            let v463 = v462 <> v228 
                            let v464 = "standard_error"
                            let v465 = atom.create(v464)
                            let v466 = erlang_term_coerce(v465)
                            let v467 = erlang_term_coerce(v463)
                            let v468 = "io"
                            let v469 = atom.create(v468)
                            let v470 = "put_chars"
                            let v471 = atom.create(v470)
                            let v472 = []
                            let v473 = [v467, ..v472]
                            let v474 = [v466, ..v473]
                            let _v475 = erlang_term_apply(v469, v471, v474)
                            Nil
                        }
                    }
                    let v476 = []
                    let v477 = erlang_term_coerce(v476)
                    let v478 = atom.create(v246)
                    let v479 = "from_list"
                    let v480 = atom.create(v479)
                    let v481 = []
                    let v482 = [v477, ..v481]
                    let v483 = erlang_term_apply(v478, v480, v482)
                    let v484 = "report"
                    let v485 = atom.create(v484)
                    let v486 = erlang_term_coerce(v485)
                    let v487 = erlang_term_coerce(v486)
                    let v488 = erlang_term_coerce(v483)
                    let v489 = atom.create(v246)
                    let v490 = atom.create(v248)
                    let v491 = []
                    let v492 = [v488, ..v491]
                    let v493 = [v426, ..v492]
                    let v494 = [v487, ..v493]
                    let v495 = erlang_term_apply(v489, v490, v494)
                    let v496 = erlang_term_coerce(v495)
                    let v497 = []
                    let v498 = erlang_term_coerce(v497)
                    let v499 = erlang_term_coerce(v386)
                    let v500 = erlang_term_coerce(v498)
                    let v501 = atom.create(v246)
                    let v502 = atom.create(v248)
                    let v503 = []
                    let v504 = [v500, ..v503]
                    let v505 = [v496, ..v504]
                    let v506 = [v499, ..v505]
                    let v507 = erlang_term_apply(v501, v502, v506)
                    let v508 = erlang_term_coerce(v507)
                    let v509 = atom.create(v91)
                    let v510 = atom.create(v93)
                    let v511 = []
                    let v512 = [v508, ..v511]
                    let v513 = erlang_term_apply(v509, v510, v512)
                    let v514 = Uh29Nil
                    let v515 = items_from_301(v513, v514)
                    let v516 = Uh3Nil
                    let v517 = method434(v515, v516)
                    let v518 = erlang_term_coerce(v227)
                    let v519 = erlang_term_coerce(v109)
                    let v520 = atom.create(v231)
                    let v521 = atom.create(v233)
                    let v522 = []
                    let v523 = [v519, ..v522]
                    let v524 = [v518, ..v523]
                    let v525 = erlang_term_apply(v520, v521, v524)
                    let v526 = erlang_term_coerce(v151)
                    let v527 = atom.create(v137)
                    let v528 = atom.create(v139)
                    let v529 = []
                    let v530 = [v526, ..v529]
                    let v531 = erlang_term_apply(v527, v528, v530)
                    let v532 = atom.create(v144)
                    let v533 = atom.create(v146)
                    let v534 = []
                    let v535 = [v531, ..v534]
                    let v536 = erlang_term_apply(v532, v533, v535)
                    let v537 = erlang_term_coerce(v536)
                    let v538 = erlang_term_coerce(v537)
                    let v539 = atom.create(v137)
                    let v540 = atom.create(v359)
                    let v541 = []
                    let v542 = [v538, ..v541]
                    let v543 = erlang_term_apply(v539, v540, v542)
                    let v544 = atom.create(v144)
                    let v545 = atom.create(v146)
                    let v546 = []
                    let v547 = [v543, ..v546]
                    let v548 = erlang_term_apply(v544, v545, v547)
                    let v549 = erlang_term_coerce(v548)
                    let v550 = erlang_term_coerce(v151)
                    let v551 = atom.create(v371)
                    let v552 = erlang_term_coerce(v551)
                    let v553 = []
                    let v554 = [v550, ..v553]
                    let v555 = [v552, ..v554]
                    let v556 = erlang_term_tuple(v555)
                    let v557 = erlang_term_coerce(v549)
                    let v558 = atom.create(v379)
                    let v559 = erlang_term_coerce(v558)
                    let v560 = []
                    let v561 = [v557, ..v560]
                    let v562 = [v559, ..v561]
                    let v563 = erlang_term_tuple(v562)
                    let v564 = atom.create(v386)
                    let v565 = erlang_term_coerce(v564)
                    let v566 = atom.create(v389)
                    let v567 = erlang_term_coerce(v566)
                    let v568 = []
                    let v569 = [v565, ..v568]
                    let v570 = [v567, ..v569]
                    let v571 = erlang_term_tuple(v570)
                    let v572 = erlang_term_coerce(False)
                    let v573 = atom.create(v397)
                    let v574 = erlang_term_coerce(v573)
                    let v575 = []
                    let v576 = [v572, ..v575]
                    let v577 = [v574, ..v576]
                    let v578 = erlang_term_tuple(v577)
                    let v579 = erlang_term_coerce(False)
                    let v580 = atom.create(v405)
                    let v581 = erlang_term_coerce(v580)
                    let v582 = []
                    let v583 = [v579, ..v582]
                    let v584 = [v581, ..v583]
                    let v585 = erlang_term_tuple(v584)
                    let v586 = []
                    let v587 = [v585, ..v586]
                    let v588 = [v578, ..v587]
                    let v589 = [v571, ..v588]
                    let v590 = [v563, ..v589]
                    let v591 = [v556, ..v590]
                    let v592 = erlang_term_coerce(v591)
                    let v593 = atom.create(v419)
                    let v594 = atom.create(v421)
                    let v595 = []
                    let v596 = [v592, ..v595]
                    let v597 = [v525, ..v596]
                    let v598 = erlang_term_apply(v593, v594, v597)
                    let v599 = atom.create(v427)
                    let v600 = erlang_term_coerce(v599)
                    let v601 = atom.create(v430)
                    let v602 = erlang_term_coerce(v601)
                    let v603 = erlang_term_coerce(v602)
                    let v604 = erlang_term_coerce(v600)
                    let v605 = atom.create(v246)
                    let v606 = atom.create(v248)
                    let v607 = []
                    let v608 = [v604, ..v607]
                    let v609 = [v598, ..v608]
                    let v610 = [v603, ..v609]
                    let v611 = erlang_term_apply(v605, v606, v610)
                    let v612 = erlang_term_coerce(v611)
                    let v613 = atom.create(v20)
                    let v614 = erlang_term_coerce(v613)
                    let v615 = v612 == v614
                    case v615 {
                        True -> Nil
                        False -> {
                            let v616 = atom.create(v427)
                            let v617 = erlang_term_coerce(v616)
                            let v618 = atom.create(v430)
                            let v619 = erlang_term_coerce(v618)
                            let v620 = erlang_term_coerce(v619)
                            let v621 = erlang_term_coerce(v617)
                            let v622 = atom.create(v246)
                            let v623 = atom.create(v248)
                            let v624 = []
                            let v625 = [v621, ..v624]
                            let v626 = [v598, ..v625]
                            let v627 = [v620, ..v626]
                            let v628 = erlang_term_apply(v622, v623, v627)
                            let v629 = erlang_term_coerce(v628)
                            let v630 = string.inspect(v629)
                            let v631 = "xsim thread_run / evaluate status "
                            let v632 = v631 <> v630 
                            let v633 = v632 <> v228 
                            let v634 = "standard_error"
                            let v635 = atom.create(v634)
                            let v636 = erlang_term_coerce(v635)
                            let v637 = erlang_term_coerce(v633)
                            let v638 = "io"
                            let v639 = atom.create(v638)
                            let v640 = "put_chars"
                            let v641 = atom.create(v640)
                            let v642 = []
                            let v643 = [v637, ..v642]
                            let v644 = [v636, ..v643]
                            let _v645 = erlang_term_apply(v639, v641, v644)
                            Nil
                        }
                    }
                    let v646 = []
                    let v647 = erlang_term_coerce(v646)
                    let v648 = atom.create(v246)
                    let v649 = atom.create(v479)
                    let v650 = []
                    let v651 = [v647, ..v650]
                    let v652 = erlang_term_apply(v648, v649, v651)
                    let v653 = atom.create(v484)
                    let v654 = erlang_term_coerce(v653)
                    let v655 = erlang_term_coerce(v654)
                    let v656 = erlang_term_coerce(v652)
                    let v657 = atom.create(v246)
                    let v658 = atom.create(v248)
                    let v659 = []
                    let v660 = [v656, ..v659]
                    let v661 = [v598, ..v660]
                    let v662 = [v655, ..v661]
                    let v663 = erlang_term_apply(v657, v658, v662)
                    let v664 = erlang_term_coerce(v663)
                    let v665 = []
                    let v666 = erlang_term_coerce(v665)
                    let v667 = erlang_term_coerce(v386)
                    let v668 = erlang_term_coerce(v666)
                    let v669 = atom.create(v246)
                    let v670 = atom.create(v248)
                    let v671 = []
                    let v672 = [v668, ..v671]
                    let v673 = [v664, ..v672]
                    let v674 = [v667, ..v673]
                    let v675 = erlang_term_apply(v669, v670, v674)
                    let v676 = erlang_term_coerce(v675)
                    let v677 = atom.create(v91)
                    let v678 = atom.create(v93)
                    let v679 = []
                    let v680 = [v676, ..v679]
                    let v681 = erlang_term_apply(v677, v678, v680)
                    let v682 = Uh29Nil
                    let v683 = items_from_301(v681, v682)
                    let v684 = Uh3Nil
                    let v685 = method434(v683, v684)
                    let v686 = erlang_term_coerce(v227)
                    let v687 = erlang_term_coerce(v109)
                    let v688 = atom.create(v231)
                    let v689 = atom.create(v233)
                    let v690 = []
                    let v691 = [v687, ..v690]
                    let v692 = [v686, ..v691]
                    let v693 = erlang_term_apply(v688, v689, v692)
                    let v694 = []
                    let v695 = erlang_term_coerce(v694)
                    let v696 = atom.create(v241)
                    let v697 = erlang_term_coerce(v696)
                    let v698 = erlang_term_coerce(v697)
                    let v699 = erlang_term_coerce(v695)
                    let v700 = atom.create(v246)
                    let v701 = atom.create(v248)
                    let v702 = []
                    let v703 = [v699, ..v702]
                    let v704 = [v693, ..v703]
                    let v705 = [v698, ..v704]
                    let v706 = erlang_term_apply(v700, v701, v705)
                    let v707 = erlang_term_coerce(v706)
                    let v708 = atom.create(v91)
                    let v709 = atom.create(v93)
                    let v710 = []
                    let v711 = [v707, ..v710]
                    let v712 = erlang_term_apply(v708, v709, v711)
                    let v713 = Uh29Nil
                    let v714 = items_from_301(v712, v713)
                    let v715 = Uh29Nil
                    let v716 = method400(v714, v715)
                    let v717 = Uh3Nil
                    let v718 = method401(v716, v717)
                    let v719 = 0
                    let v720 = method20(v718, v719)
                    let v721 = 0
                    let v722 = method20(v685, v721)
                    let v723 = int.to_string(v720)
                    let v724 = " cells="
                    let v725 = v724 <> v723 
                    let v726 = " tests="
                    let v727 = v725 <> v726 
                    let v728 = int.to_string(v722)
                    let v729 = v727 <> v728 
                    let v730 = erlang_term_coerce(v151)
                    let v731 = atom.create(v137)
                    let v732 = "basename"
                    let v733 = atom.create(v732)
                    let v734 = []
                    let v735 = [v730, ..v734]
                    let v736 = erlang_term_apply(v731, v733, v735)
                    let v737 = atom.create(v144)
                    let v738 = atom.create(v146)
                    let v739 = []
                    let v740 = [v736, ..v739]
                    let v741 = erlang_term_apply(v737, v738, v740)
                    let v742 = erlang_term_coerce(v741)
                    let v743 = "XSIM thread_run file="
                    let v744 = v743 <> v742 
                    let v745 = v744 <> v729 
                    let v746 = " same_cells="
                    let v747 = v745 <> v746 
                    let v750 =
                        case v319 {
                            True -> {
                                let v748 = "true"
                                v748
                            }
                            False -> {
                                let v749 = "false"
                                v749
                            }
                        }
                    let v751 = v747 <> v750 
                    let v753 =
                        case v319 {
                            True -> {
                                let v752 = v445 == v615
                                v752
                            }
                            False -> False
                        }
                    let v757 =
                        case v753 {
                            True -> {
                                let v754 = delimited_21(v228, v517)
                                let v755 = delimited_21(v228, v685)
                                let v756 = v754 == v755
                                v756
                            }
                            False -> False
                        }
                    let v762 =
                        case v757 {
                            True -> {
                                case v517  {
                                    Uh3Cons(v758, v759) -> True
                                    Uh3Nil -> False
                                }
                            }
                            False -> False
                        }
                    let v763 = v762 && v445
                    let v765 =
                        case v615 {
                            True -> v20
                            False -> {
                                let v764 = "error"
                                v764
                            }
                        }
                    let v766 = " status="
                    let v767 = v766 <> v765 
                    let v768 = "/"
                    let v769 = v767 <> v768 
                    let v771 =
                        case v445 {
                            True -> v20
                            False -> {
                                let v770 = "error"
                                v770
                            }
                        }
                    let v772 = v769 <> v771 
                    let v773 = " result="
                    let v774 = v772 <> v773 
                    let v777 =
                        case v763 {
                            True -> {
                                let v775 = "pass"
                                v775
                            }
                            False -> {
                                let v776 = "fail"
                                v776
                            }
                        }
                    let v778 = v774 <> v777 
                    let v779 = v751 <> v778 
                    let v780 = paired_rows_436(v517, v685)
                    let v781 = Uh3Cons(v779, v780)
                    delimited_21(v228, v781)
                }
            }
        let v788 = "\n"
        let v789 = v787 <> v788 
        let v790 = erlang_term_coerce(v789)
        let v791 = "io"
        let v792 = atom.create(v791)
        let v793 = "put_chars"
        let v794 = atom.create(v793)
        let v795 = []
        let v796 = [v790, ..v795]
        let _v797 = erlang_term_apply(v792, v794, v796)
        let v798 = v787 == ""
        let v801 =
            case v798 {
                True -> Uh3Nil
                False -> split_list_2(v788, v787)
            }
        let v802 = method402()
        let v803 = method403(v802, v801)
        case v803 {
            True -> 1
            False -> 0
        }
    }
}
