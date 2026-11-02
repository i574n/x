import gleam/bit_array
import gleam/erlang/atom
import gleam/string
import xsim_frames/types.{type Us90, Uh29Nil, Uh3Cons, Uh3Nil, Us56Error, Us56Ok, Us76Error, Us76Ok, Us89Error, Us89Ok, Us90None}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_fs_read_file, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part10.{method258, method259}
import xsim_frames/part17.{method366, method367}
import xsim_frames/part2.{delimited_21, method20}
import xsim_frames/part20.{method395, method396, method397, method398, method399}
import xsim_frames/part24.{closure133, closure135, flags_parsed_426, method430, paired_rows_432}

pub fn closure132(capt: Nil) -> fn(String) -> Int {
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
        let v91 = erlang_term_coerce(0)
        let v92 = []
        let v93 = [v91, ..v92]
        let v94 = erlang_term_coerce(v93)
        let v95 = "lists"
        let v96 = atom.create(v95)
        let v97 = "join"
        let v98 = atom.create(v97)
        let v99 = []
        let v100 = [v90, ..v99]
        let v101 = [v94, ..v100]
        let v102 = erlang_term_apply(v96, v98, v101)
        let v103 = "unicode"
        let v104 = atom.create(v103)
        let v105 = "characters_to_binary"
        let v106 = atom.create(v105)
        let v107 = []
        let v108 = [v102, ..v107]
        let v109 = erlang_term_apply(v104, v106, v108)
        let v110 = erlang_term_coerce(v109)
        let v111 = unicode_erlang_characters_to_binary([0])
        let v112 = v110 == ""
        let v115 =
            case v112 {
                True -> Uh3Nil
                False -> split_list_2(v111, v110)
            }
        let v120 =
            case v115  {
                Uh3Cons(v116, v117) -> v117
                Uh3Nil -> Uh3Nil
            }
        let v121 = closure133(Nil)
        let v122 = closure135(Nil)
        let v123 = ""
        let v124 = flags_parsed_426(v121, v122, v123, v123, v123, v120)
        let v146 =
            case v124  {
                Us89Ok(v125, v126, v127) -> {
                    let v128 = v125 == ""
                    let v135 =
                        case v128 {
                            True -> {
                                let v129 = "missing --file"
                                v129
                            }
                            False -> {
                                let v130 = v126 == ""
                                let v132 =
                                    case v130 {
                                        True -> {
                                            let v131 = v127 == ""
                                            v131
                                        }
                                        False -> False
                                    }
                                case v132 {
                                    True -> {
                                        let v133 = "missing --program (xc thread output) or --expected (a thread-*.expected.json)"
                                        v133
                                    }
                                    False -> v123
                                }
                            }
                        }
                    let v136 = v135 != ""
                    case v136 {
                        True -> {
                            let v143 =
                                case v128 {
                                    True -> {
                                        let v137 = "missing --file"
                                        v137
                                    }
                                    False -> {
                                        let v138 = v126 == ""
                                        let v140 =
                                            case v138 {
                                                True -> {
                                                    let v139 = v127 == ""
                                                    v139
                                                }
                                                False -> False
                                            }
                                        case v140 {
                                            True -> {
                                                let v141 = "missing --program (xc thread output) or --expected (a thread-*.expected.json)"
                                                v141
                                            }
                                            False -> v123
                                        }
                                    }
                                }
                            Us89Error(v143)
                        }
                        False -> v124
                    }
                }
                _ -> v124
            }
        let v768 =
            case v146  {
                Us89Error(v764) -> {
                    let v765 = "XSIM rejected thread_run: "
                    let v766 = v765 <> v764 
                    v766
                }
                Us89Ok(v147, v148, v149) -> {
                    let v150 = erlang_term_coerce(v147)
                    let v151 = "filename"
                    let v152 = atom.create(v151)
                    let v153 = "absname"
                    let v154 = atom.create(v153)
                    let v155 = []
                    let v156 = [v150, ..v155]
                    let v157 = erlang_term_apply(v152, v154, v156)
                    let v158 = atom.create(v103)
                    let v159 = atom.create(v105)
                    let v160 = []
                    let v161 = [v157, ..v160]
                    let v162 = erlang_term_apply(v158, v159, v161)
                    let v163 = erlang_term_coerce(v162)
                    let v164 = v148 != ""
                    let v233 =
                        case v164 {
                            True -> {
                                let v165 = spiral_fs_read_file(v148)
                                let v166 = method366()
                                let v167 = method367()
                                let v168 = case v165 { Ok(x) -> v166(x) Error(x) -> v167(x) }
                                case v168  {
                                    Us76Error(v178) -> panic as "file_system.read_all_text: file:read_file failed"
                                    Us76Ok(v169) -> {
                                        let v170 = bit_array.to_string(v169)
                                        let v171 = method258()
                                        let v172 = method259()
                                        let v173 = case v170 { Ok(x) -> v171(x) Error(x) -> v172(x) }
                                        case v173  {
                                            Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                            Us56Ok(v174) -> v174
                                        }
                                    }
                                }
                            }
                            False -> {
                                let v182 = "\n"
                                let v183 = erlang_term_coerce(v182)
                                let v184 = spiral_fs_read_file(v149)
                                let v185 = method366()
                                let v186 = method367()
                                let v187 = case v184 { Ok(x) -> v185(x) Error(x) -> v186(x) }
                                let v200 =
                                    case v187  {
                                        Us76Error(v197) -> panic as "file_system.read_all_text: file:read_file failed"
                                        Us76Ok(v188) -> {
                                            let v189 = bit_array.to_string(v188)
                                            let v190 = method258()
                                            let v191 = method259()
                                            let v192 = case v189 { Ok(x) -> v190(x) Error(x) -> v191(x) }
                                            case v192  {
                                                Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                                Us56Ok(v193) -> v193
                                            }
                                        }
                                    }
                                let v201 = erlang_term_coerce(v200)
                                let v202 = "json"
                                let v203 = atom.create(v202)
                                let v204 = "decode"
                                let v205 = atom.create(v204)
                                let v206 = []
                                let v207 = [v201, ..v206]
                                let v208 = erlang_term_apply(v203, v205, v207)
                                let v209 = "program"
                                let v210 = erlang_term_coerce(v209)
                                let v211 = "maps"
                                let v212 = atom.create(v211)
                                let v213 = "get"
                                let v214 = atom.create(v213)
                                let v215 = []
                                let v216 = [v208, ..v215]
                                let v217 = [v210, ..v216]
                                let v218 = erlang_term_apply(v212, v214, v217)
                                let v219 = atom.create(v95)
                                let v220 = atom.create(v97)
                                let v221 = []
                                let v222 = [v218, ..v221]
                                let v223 = [v183, ..v222]
                                let v224 = erlang_term_apply(v219, v220, v223)
                                let v225 = atom.create(v12)
                                let v226 = "iolist_to_binary"
                                let v227 = atom.create(v226)
                                let v228 = []
                                let v229 = [v224, ..v228]
                                let v230 = erlang_term_apply(v225, v227, v229)
                                let v231 = erlang_term_coerce(v230)
                                let v232 = v231 <> v182 
                                v232
                            }
                        }
                    let v234 = "\n"
                    let v235 = erlang_term_coerce(v233)
                    let v236 = erlang_term_coerce(v123)
                    let v237 = "Elixir.Spiral.Cells.Document"
                    let v238 = atom.create(v237)
                    let v239 = "parse_spi"
                    let v240 = atom.create(v239)
                    let v241 = []
                    let v242 = [v236, ..v241]
                    let v243 = [v235, ..v242]
                    let v244 = erlang_term_apply(v238, v240, v243)
                    let v245 = []
                    let v246 = erlang_term_coerce(v245)
                    let v247 = "cells"
                    let v248 = atom.create(v247)
                    let v249 = erlang_term_coerce(v248)
                    let v250 = "maps"
                    let v251 = atom.create(v250)
                    let v252 = "get"
                    let v253 = atom.create(v252)
                    let v254 = []
                    let v255 = [v246, ..v254]
                    let v256 = [v244, ..v255]
                    let v257 = [v249, ..v256]
                    let v258 = erlang_term_apply(v251, v253, v257)
                    let v259 = atom.create(v12)
                    let v260 = "length"
                    let v261 = atom.create(v260)
                    let v262 = []
                    let v263 = [v258, ..v262]
                    let v264 = erlang_term_apply(v259, v261, v263)
                    let v265 = erlang_term_coerce(v264)
                    let v266 = 0
                    let v267 = method395(v265, v258, v266)
                    let v268 = Uh29Nil
                    let v269 = method396(v267, v268)
                    let v270 = Uh3Nil
                    let v271 = method397(v269, v270)
                    let v272 = delimited_21(v234, v271)
                    let v273 = spiral_fs_read_file(v163)
                    let v274 = method366()
                    let v275 = method367()
                    let v276 = case v273 { Ok(x) -> v274(x) Error(x) -> v275(x) }
                    let v289 =
                        case v276  {
                            Us76Error(v286) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us76Ok(v277) -> {
                                let v278 = bit_array.to_string(v277)
                                let v279 = method258()
                                let v280 = method259()
                                let v281 = case v278 { Ok(x) -> v279(x) Error(x) -> v280(x) }
                                case v281  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v282) -> v282
                                }
                            }
                        }
                    let v290 = erlang_term_coerce(v289)
                    let v291 = erlang_term_coerce(v123)
                    let v292 = atom.create(v237)
                    let v293 = atom.create(v239)
                    let v294 = []
                    let v295 = [v291, ..v294]
                    let v296 = [v290, ..v295]
                    let v297 = erlang_term_apply(v292, v293, v296)
                    let v298 = []
                    let v299 = erlang_term_coerce(v298)
                    let v300 = atom.create(v247)
                    let v301 = erlang_term_coerce(v300)
                    let v302 = atom.create(v250)
                    let v303 = atom.create(v252)
                    let v304 = []
                    let v305 = [v299, ..v304]
                    let v306 = [v297, ..v305]
                    let v307 = [v301, ..v306]
                    let v308 = erlang_term_apply(v302, v303, v307)
                    let v309 = atom.create(v12)
                    let v310 = atom.create(v260)
                    let v311 = []
                    let v312 = [v308, ..v311]
                    let v313 = erlang_term_apply(v309, v310, v312)
                    let v314 = erlang_term_coerce(v313)
                    let v315 = 0
                    let v316 = method395(v314, v308, v315)
                    let v317 = Uh29Nil
                    let v318 = method396(v316, v317)
                    let v319 = Uh3Nil
                    let v320 = method397(v318, v319)
                    let v321 = delimited_21(v234, v320)
                    let v322 = v272 == v321
                    let v323 = spiral_fs_read_file(v163)
                    let v324 = method366()
                    let v325 = method367()
                    let v326 = case v323 { Ok(x) -> v324(x) Error(x) -> v325(x) }
                    let v339 =
                        case v326  {
                            Us76Error(v336) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us76Ok(v327) -> {
                                let v328 = bit_array.to_string(v327)
                                let v329 = method258()
                                let v330 = method259()
                                let v331 = case v328 { Ok(x) -> v329(x) Error(x) -> v330(x) }
                                case v331  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v332) -> v332
                                }
                            }
                        }
                    let v340 = erlang_term_coerce(v339)
                    let v341 = erlang_term_coerce(v123)
                    let v342 = atom.create(v237)
                    let v343 = atom.create(v239)
                    let v344 = []
                    let v345 = [v341, ..v344]
                    let v346 = [v340, ..v345]
                    let v347 = erlang_term_apply(v342, v343, v346)
                    let v348 = erlang_term_coerce(v163)
                    let v349 = atom.create(v151)
                    let v350 = atom.create(v153)
                    let v351 = []
                    let v352 = [v348, ..v351]
                    let v353 = erlang_term_apply(v349, v350, v352)
                    let v354 = atom.create(v103)
                    let v355 = atom.create(v105)
                    let v356 = []
                    let v357 = [v353, ..v356]
                    let v358 = erlang_term_apply(v354, v355, v357)
                    let v359 = erlang_term_coerce(v358)
                    let v360 = erlang_term_coerce(v359)
                    let v361 = atom.create(v151)
                    let v362 = "dirname"
                    let v363 = atom.create(v362)
                    let v364 = []
                    let v365 = [v360, ..v364]
                    let v366 = erlang_term_apply(v361, v363, v365)
                    let v367 = atom.create(v103)
                    let v368 = atom.create(v105)
                    let v369 = []
                    let v370 = [v366, ..v369]
                    let v371 = erlang_term_apply(v367, v368, v370)
                    let v372 = erlang_term_coerce(v371)
                    let v373 = erlang_term_coerce(v163)
                    let v374 = "path"
                    let v375 = atom.create(v374)
                    let v376 = erlang_term_coerce(v375)
                    let v377 = []
                    let v378 = [v373, ..v377]
                    let v379 = [v376, ..v378]
                    let v380 = erlang_term_tuple(v379)
                    let v381 = erlang_term_coerce(v372)
                    let v382 = "root"
                    let v383 = atom.create(v382)
                    let v384 = erlang_term_coerce(v383)
                    let v385 = []
                    let v386 = [v381, ..v385]
                    let v387 = [v384, ..v386]
                    let v388 = erlang_term_tuple(v387)
                    let v389 = "tests"
                    let v390 = atom.create(v389)
                    let v391 = erlang_term_coerce(v390)
                    let v392 = "plan"
                    let v393 = atom.create(v392)
                    let v394 = erlang_term_coerce(v393)
                    let v395 = []
                    let v396 = [v391, ..v395]
                    let v397 = [v394, ..v396]
                    let v398 = erlang_term_tuple(v397)
                    let v399 = erlang_term_coerce(False)
                    let v400 = "spi"
                    let v401 = atom.create(v400)
                    let v402 = erlang_term_coerce(v401)
                    let v403 = []
                    let v404 = [v399, ..v403]
                    let v405 = [v402, ..v404]
                    let v406 = erlang_term_tuple(v405)
                    let v407 = erlang_term_coerce(False)
                    let v408 = "memo"
                    let v409 = atom.create(v408)
                    let v410 = erlang_term_coerce(v409)
                    let v411 = []
                    let v412 = [v407, ..v411]
                    let v413 = [v410, ..v412]
                    let v414 = erlang_term_tuple(v413)
                    let v415 = []
                    let v416 = [v414, ..v415]
                    let v417 = [v406, ..v416]
                    let v418 = [v398, ..v417]
                    let v419 = [v388, ..v418]
                    let v420 = [v380, ..v419]
                    let v421 = erlang_term_coerce(v420)
                    let v422 = "Elixir.Spiral.Cells.Notebook"
                    let v423 = atom.create(v422)
                    let v424 = "evaluate"
                    let v425 = atom.create(v424)
                    let v426 = []
                    let v427 = [v421, ..v426]
                    let v428 = [v347, ..v427]
                    let v429 = erlang_term_apply(v423, v425, v428)
                    let v430 = "none"
                    let v431 = atom.create(v430)
                    let v432 = erlang_term_coerce(v431)
                    let v433 = "status"
                    let v434 = atom.create(v433)
                    let v435 = erlang_term_coerce(v434)
                    let v436 = atom.create(v250)
                    let v437 = atom.create(v252)
                    let v438 = []
                    let v439 = [v432, ..v438]
                    let v440 = [v429, ..v439]
                    let v441 = [v435, ..v440]
                    let v442 = erlang_term_apply(v436, v437, v441)
                    let v443 = atom.create(v20)
                    let v444 = erlang_term_coerce(v443)
                    let v445 = v442 == v444
                    case v445 {
                        True -> Nil
                        False -> {
                            let v446 = atom.create(v430)
                            let v447 = erlang_term_coerce(v446)
                            let v448 = atom.create(v433)
                            let v449 = erlang_term_coerce(v448)
                            let v450 = atom.create(v250)
                            let v451 = atom.create(v252)
                            let v452 = []
                            let v453 = [v447, ..v452]
                            let v454 = [v429, ..v453]
                            let v455 = [v449, ..v454]
                            let v456 = erlang_term_apply(v450, v451, v455)
                            let v457 = string.inspect(v456)
                            let v458 = "xsim thread_run / evaluate status "
                            let v459 = v458 <> v457 
                            let v460 = v459 <> v234 
                            let v461 = "standard_error"
                            let v462 = atom.create(v461)
                            let v463 = erlang_term_coerce(v462)
                            let v464 = erlang_term_coerce(v460)
                            let v465 = "io"
                            let v466 = atom.create(v465)
                            let v467 = "put_chars"
                            let v468 = atom.create(v467)
                            let v469 = []
                            let v470 = [v464, ..v469]
                            let v471 = [v463, ..v470]
                            let _v472 = erlang_term_apply(v466, v468, v471)
                            Nil
                        }
                    }
                    let v473 = []
                    let v474 = erlang_term_coerce(v473)
                    let v475 = atom.create(v250)
                    let v476 = "from_list"
                    let v477 = atom.create(v476)
                    let v478 = []
                    let v479 = [v474, ..v478]
                    let v480 = erlang_term_apply(v475, v477, v479)
                    let v481 = "report"
                    let v482 = atom.create(v481)
                    let v483 = erlang_term_coerce(v482)
                    let v484 = atom.create(v250)
                    let v485 = atom.create(v252)
                    let v486 = []
                    let v487 = [v480, ..v486]
                    let v488 = [v429, ..v487]
                    let v489 = [v483, ..v488]
                    let v490 = erlang_term_apply(v484, v485, v489)
                    let v491 = erlang_term_coerce(v389)
                    let v492 = []
                    let v493 = erlang_term_coerce(v492)
                    let v494 = atom.create(v250)
                    let v495 = atom.create(v252)
                    let v496 = []
                    let v497 = [v493, ..v496]
                    let v498 = [v490, ..v497]
                    let v499 = [v491, ..v498]
                    let v500 = erlang_term_apply(v494, v495, v499)
                    let v501 = atom.create(v12)
                    let v502 = atom.create(v260)
                    let v503 = []
                    let v504 = [v500, ..v503]
                    let v505 = erlang_term_apply(v501, v502, v504)
                    let v506 = erlang_term_coerce(v505)
                    let v507 = 0
                    let v508 = method395(v506, v500, v507)
                    let v509 = Uh3Nil
                    let v510 = method430(v508, v509)
                    let v511 = erlang_term_coerce(v233)
                    let v512 = erlang_term_coerce(v123)
                    let v513 = atom.create(v237)
                    let v514 = atom.create(v239)
                    let v515 = []
                    let v516 = [v512, ..v515]
                    let v517 = [v511, ..v516]
                    let v518 = erlang_term_apply(v513, v514, v517)
                    let v519 = erlang_term_coerce(v163)
                    let v520 = atom.create(v151)
                    let v521 = atom.create(v153)
                    let v522 = []
                    let v523 = [v519, ..v522]
                    let v524 = erlang_term_apply(v520, v521, v523)
                    let v525 = atom.create(v103)
                    let v526 = atom.create(v105)
                    let v527 = []
                    let v528 = [v524, ..v527]
                    let v529 = erlang_term_apply(v525, v526, v528)
                    let v530 = erlang_term_coerce(v529)
                    let v531 = erlang_term_coerce(v530)
                    let v532 = atom.create(v151)
                    let v533 = atom.create(v362)
                    let v534 = []
                    let v535 = [v531, ..v534]
                    let v536 = erlang_term_apply(v532, v533, v535)
                    let v537 = atom.create(v103)
                    let v538 = atom.create(v105)
                    let v539 = []
                    let v540 = [v536, ..v539]
                    let v541 = erlang_term_apply(v537, v538, v540)
                    let v542 = erlang_term_coerce(v541)
                    let v543 = erlang_term_coerce(v163)
                    let v544 = atom.create(v374)
                    let v545 = erlang_term_coerce(v544)
                    let v546 = []
                    let v547 = [v543, ..v546]
                    let v548 = [v545, ..v547]
                    let v549 = erlang_term_tuple(v548)
                    let v550 = erlang_term_coerce(v542)
                    let v551 = atom.create(v382)
                    let v552 = erlang_term_coerce(v551)
                    let v553 = []
                    let v554 = [v550, ..v553]
                    let v555 = [v552, ..v554]
                    let v556 = erlang_term_tuple(v555)
                    let v557 = atom.create(v389)
                    let v558 = erlang_term_coerce(v557)
                    let v559 = atom.create(v392)
                    let v560 = erlang_term_coerce(v559)
                    let v561 = []
                    let v562 = [v558, ..v561]
                    let v563 = [v560, ..v562]
                    let v564 = erlang_term_tuple(v563)
                    let v565 = erlang_term_coerce(False)
                    let v566 = atom.create(v400)
                    let v567 = erlang_term_coerce(v566)
                    let v568 = []
                    let v569 = [v565, ..v568]
                    let v570 = [v567, ..v569]
                    let v571 = erlang_term_tuple(v570)
                    let v572 = erlang_term_coerce(False)
                    let v573 = atom.create(v408)
                    let v574 = erlang_term_coerce(v573)
                    let v575 = []
                    let v576 = [v572, ..v575]
                    let v577 = [v574, ..v576]
                    let v578 = erlang_term_tuple(v577)
                    let v579 = []
                    let v580 = [v578, ..v579]
                    let v581 = [v571, ..v580]
                    let v582 = [v564, ..v581]
                    let v583 = [v556, ..v582]
                    let v584 = [v549, ..v583]
                    let v585 = erlang_term_coerce(v584)
                    let v586 = atom.create(v422)
                    let v587 = atom.create(v424)
                    let v588 = []
                    let v589 = [v585, ..v588]
                    let v590 = [v518, ..v589]
                    let v591 = erlang_term_apply(v586, v587, v590)
                    let v592 = atom.create(v430)
                    let v593 = erlang_term_coerce(v592)
                    let v594 = atom.create(v433)
                    let v595 = erlang_term_coerce(v594)
                    let v596 = atom.create(v250)
                    let v597 = atom.create(v252)
                    let v598 = []
                    let v599 = [v593, ..v598]
                    let v600 = [v591, ..v599]
                    let v601 = [v595, ..v600]
                    let v602 = erlang_term_apply(v596, v597, v601)
                    let v603 = atom.create(v20)
                    let v604 = erlang_term_coerce(v603)
                    let v605 = v602 == v604
                    case v605 {
                        True -> Nil
                        False -> {
                            let v606 = atom.create(v430)
                            let v607 = erlang_term_coerce(v606)
                            let v608 = atom.create(v433)
                            let v609 = erlang_term_coerce(v608)
                            let v610 = atom.create(v250)
                            let v611 = atom.create(v252)
                            let v612 = []
                            let v613 = [v607, ..v612]
                            let v614 = [v591, ..v613]
                            let v615 = [v609, ..v614]
                            let v616 = erlang_term_apply(v610, v611, v615)
                            let v617 = string.inspect(v616)
                            let v618 = "xsim thread_run / evaluate status "
                            let v619 = v618 <> v617 
                            let v620 = v619 <> v234 
                            let v621 = "standard_error"
                            let v622 = atom.create(v621)
                            let v623 = erlang_term_coerce(v622)
                            let v624 = erlang_term_coerce(v620)
                            let v625 = "io"
                            let v626 = atom.create(v625)
                            let v627 = "put_chars"
                            let v628 = atom.create(v627)
                            let v629 = []
                            let v630 = [v624, ..v629]
                            let v631 = [v623, ..v630]
                            let _v632 = erlang_term_apply(v626, v628, v631)
                            Nil
                        }
                    }
                    let v633 = []
                    let v634 = erlang_term_coerce(v633)
                    let v635 = atom.create(v250)
                    let v636 = atom.create(v476)
                    let v637 = []
                    let v638 = [v634, ..v637]
                    let v639 = erlang_term_apply(v635, v636, v638)
                    let v640 = atom.create(v481)
                    let v641 = erlang_term_coerce(v640)
                    let v642 = atom.create(v250)
                    let v643 = atom.create(v252)
                    let v644 = []
                    let v645 = [v639, ..v644]
                    let v646 = [v591, ..v645]
                    let v647 = [v641, ..v646]
                    let v648 = erlang_term_apply(v642, v643, v647)
                    let v649 = erlang_term_coerce(v389)
                    let v650 = []
                    let v651 = erlang_term_coerce(v650)
                    let v652 = atom.create(v250)
                    let v653 = atom.create(v252)
                    let v654 = []
                    let v655 = [v651, ..v654]
                    let v656 = [v648, ..v655]
                    let v657 = [v649, ..v656]
                    let v658 = erlang_term_apply(v652, v653, v657)
                    let v659 = atom.create(v12)
                    let v660 = atom.create(v260)
                    let v661 = []
                    let v662 = [v658, ..v661]
                    let v663 = erlang_term_apply(v659, v660, v662)
                    let v664 = erlang_term_coerce(v663)
                    let v665 = 0
                    let v666 = method395(v664, v658, v665)
                    let v667 = Uh3Nil
                    let v668 = method430(v666, v667)
                    let v669 = erlang_term_coerce(v233)
                    let v670 = erlang_term_coerce(v123)
                    let v671 = atom.create(v237)
                    let v672 = atom.create(v239)
                    let v673 = []
                    let v674 = [v670, ..v673]
                    let v675 = [v669, ..v674]
                    let v676 = erlang_term_apply(v671, v672, v675)
                    let v677 = []
                    let v678 = erlang_term_coerce(v677)
                    let v679 = atom.create(v247)
                    let v680 = erlang_term_coerce(v679)
                    let v681 = atom.create(v250)
                    let v682 = atom.create(v252)
                    let v683 = []
                    let v684 = [v678, ..v683]
                    let v685 = [v676, ..v684]
                    let v686 = [v680, ..v685]
                    let v687 = erlang_term_apply(v681, v682, v686)
                    let v688 = atom.create(v12)
                    let v689 = atom.create(v260)
                    let v690 = []
                    let v691 = [v687, ..v690]
                    let v692 = erlang_term_apply(v688, v689, v691)
                    let v693 = erlang_term_coerce(v692)
                    let v694 = 0
                    let v695 = method395(v693, v687, v694)
                    let v696 = Uh29Nil
                    let v697 = method396(v695, v696)
                    let v698 = Uh3Nil
                    let v699 = method397(v697, v698)
                    let v700 = 0
                    let v701 = method20(v699, v700)
                    let v702 = 0
                    let v703 = method20(v668, v702)
                    let v704 = string.inspect(v701)
                    let v705 = " cells="
                    let v706 = v705 <> v704 
                    let v707 = " tests="
                    let v708 = v706 <> v707 
                    let v709 = string.inspect(v703)
                    let v710 = v708 <> v709 
                    let v711 = erlang_term_coerce(v163)
                    let v712 = atom.create(v151)
                    let v713 = "basename"
                    let v714 = atom.create(v713)
                    let v715 = []
                    let v716 = [v711, ..v715]
                    let v717 = erlang_term_apply(v712, v714, v716)
                    let v718 = atom.create(v103)
                    let v719 = atom.create(v105)
                    let v720 = []
                    let v721 = [v717, ..v720]
                    let v722 = erlang_term_apply(v718, v719, v721)
                    let v723 = erlang_term_coerce(v722)
                    let v724 = "XSIM thread_run file="
                    let v725 = v724 <> v723 
                    let v726 = v725 <> v710 
                    let v727 = " same_cells="
                    let v728 = v726 <> v727 
                    let v731 =
                        case v322 {
                            True -> {
                                let v729 = "true"
                                v729
                            }
                            False -> {
                                let v730 = "false"
                                v730
                            }
                        }
                    let v732 = v728 <> v731 
                    let v734 =
                        case v322 {
                            True -> {
                                let v733 = v445 == v605
                                v733
                            }
                            False -> False
                        }
                    let v738 =
                        case v734 {
                            True -> {
                                let v735 = delimited_21(v234, v510)
                                let v736 = delimited_21(v234, v668)
                                let v737 = v735 == v736
                                v737
                            }
                            False -> False
                        }
                    let v743 =
                        case v738 {
                            True -> {
                                case v510  {
                                    Uh3Cons(v739, v740) -> True
                                    Uh3Nil -> False
                                }
                            }
                            False -> False
                        }
                    let v744 = v743 && v445
                    let v746 =
                        case v605 {
                            True -> v20
                            False -> {
                                let v745 = "error"
                                v745
                            }
                        }
                    let v747 = " status="
                    let v748 = v747 <> v746 
                    let v749 = "/"
                    let v750 = v748 <> v749 
                    let v752 =
                        case v445 {
                            True -> v20
                            False -> {
                                let v751 = "error"
                                v751
                            }
                        }
                    let v753 = v750 <> v752 
                    let v754 = " result="
                    let v755 = v753 <> v754 
                    let v758 =
                        case v744 {
                            True -> {
                                let v756 = "pass"
                                v756
                            }
                            False -> {
                                let v757 = "fail"
                                v757
                            }
                        }
                    let v759 = v755 <> v758 
                    let v760 = v732 <> v759 
                    let v761 = paired_rows_432(v510, v668)
                    let v762 = Uh3Cons(v760, v761)
                    delimited_21(v234, v762)
                }
            }
        let v769 = "\n"
        let v770 = v768 <> v769 
        let v771 = erlang_term_coerce(v770)
        let v772 = "io"
        let v773 = atom.create(v772)
        let v774 = "put_chars"
        let v775 = atom.create(v774)
        let v776 = []
        let v777 = [v771, ..v776]
        let _v778 = erlang_term_apply(v773, v775, v777)
        let v779 = v768 == ""
        let v782 =
            case v779 {
                True -> Uh3Nil
                False -> split_list_2(v769, v768)
            }
        let v783 = method398()
        let v784 = method399(v783, v782)
        case v784 {
            True -> 1
            False -> 0
        }
    }
}

pub fn closure140(capt: Nil) -> fn(String) -> Us90 {
    fn (v0) {
        Us90None
    }
}

pub fn closure139(capt: Nil) -> fn(#(String, Int)) -> fn(String) -> Us90 {
    fn (dom) {
        let #(_v0, _v1) = dom
        closure140(Nil)
    }
}
