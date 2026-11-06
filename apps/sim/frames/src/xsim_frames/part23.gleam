import gleam/bit_array
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Us97, type Us98, Uh30Nil, Uh3Cons, Uh3Nil, Us3None, Us3Some, Us56Error, Us56Ok, Us80Error, Us80Ok, Us96Error, Us96Ok, Us97None, Us98Error, Us98Ok}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_fs_read_file, split_list_2}
import xsim_frames/part12.{items_from_303}
import xsim_frames/part16.{method372, method373}
import xsim_frames/part18.{method398, method402, method403}
import xsim_frames/part19.{method411, method412}
import xsim_frames/part2.{delimited_21, method20}
import xsim_frames/part22.{closure131, closure133, flags_parsed_439, method443, paired_rows_445}
import xsim_frames/part9.{method260, method261}

pub fn closure130(capt: Nil) -> fn(String) -> Int {
    fn (v0) {
        let v2 = atom.create("crypto")
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
        let v39 =
            case v23 {
                True -> True
                False -> {
                    let v24 = string.inspect(v10)
                    let v25 = { "xsim / crypto did not start: " } <> { v24 }
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
                    False
                }
            }
        let _v74 =
            case v39 {
                True -> {
                    let v41 = atom.create("spiral_cells")
                    let v42 = erlang_term_coerce(v41)
                    let v43 = atom.create(v4)
                    let v44 = atom.create(v6)
                    let v45 = []
                    let v46 = [v42, ..v45]
                    let v47 = erlang_term_apply(v43, v44, v46)
                    let v48 = erlang_term_coerce(1)
                    let v49 = atom.create(v12)
                    let v50 = atom.create(v14)
                    let v51 = []
                    let v52 = [v47, ..v51]
                    let v53 = [v48, ..v52]
                    let v54 = erlang_term_apply(v49, v50, v53)
                    let v55 = atom.create(v20)
                    let v56 = erlang_term_coerce(v55)
                    let v57 = v54 == v56
                    case v57 {
                        True -> True
                        False -> {
                            let v58 = string.inspect(v47)
                            let v59 = { "xsim / spiral_cells did not start: " } <> { v58 }
                            let v60 = { v59 } <> { "\n" }
                            let v62 = atom.create("standard_error")
                            let v63 = erlang_term_coerce(v62)
                            let v64 = erlang_term_coerce(v60)
                            let v66 = atom.create("io")
                            let v68 = atom.create("put_chars")
                            let v69 = []
                            let v70 = [v64, ..v69]
                            let v71 = [v63, ..v70]
                            let _v72 = erlang_term_apply(v66, v68, v71)
                            False
                        }
                    }
                }
                False -> False
            }
        let v76 = atom.create("init")
        let v78 = atom.create("get_plain_arguments")
        let v79 = []
        let v80 = erlang_term_apply(v76, v78, v79)
        let v81 = "lists"
        let v82 = atom.create(v81)
        let v83 = "reverse"
        let v84 = atom.create(v83)
        let v85 = []
        let v86 = [v80, ..v85]
        let v87 = erlang_term_apply(v82, v84, v86)
        let v89 = items_from_303(v87, Uh30Nil)
        let v91 = method398(v89, Uh3Nil)
        let v96 =
            case v91  {
                Uh3Cons(v92, v93) -> v93
                Uh3Nil -> Uh3Nil
            }
        let v97 = closure131(Nil)
        let v98 = closure133(Nil)
        let v99 = ""
        let v100 = flags_parsed_439(v97, v98, v99, v99, v99, v96)
        let v122 =
            case v100  {
                Us96Ok(v101, v102, v103) -> {
                    let v104 = v101 == ""
                    let v111 =
                        case v104 {
                            True -> {
                                "missing --file"
                            }
                            False -> {
                                let v106 = v102 == ""
                                let v108 =
                                    case v106 {
                                        True -> {
                                            v103 == ""
                                        }
                                        False -> False
                                    }
                                case v108 {
                                    True -> {
                                        "missing --program (xc thread output) or --expected (a thread-*.expected.json)"
                                    }
                                    False -> v99
                                }
                            }
                        }
                    let v112 = v111 != ""
                    case v112 {
                        True -> {
                            let v119 =
                                case v104 {
                                    True -> {
                                        "missing --file"
                                    }
                                    False -> {
                                        let v114 = v102 == ""
                                        let v116 =
                                            case v114 {
                                                True -> {
                                                    v103 == ""
                                                }
                                                False -> False
                                            }
                                        case v116 {
                                            True -> {
                                                "missing --program (xc thread output) or --expected (a thread-*.expected.json)"
                                            }
                                            False -> v99
                                        }
                                    }
                                }
                            Us96Error(v119)
                        }
                        False -> v100
                    }
                }
                _ -> v100
            }
        let v767 =
            case v122  {
                Us96Error(v764) -> {
                    let v765 = { "XSIM rejected thread_run: " } <> { v764 }
                    v765
                }
                Us96Ok(v123, v124, v125) -> {
                    let v126 = erlang_term_coerce(v123)
                    let v127 = "filename"
                    let v128 = atom.create(v127)
                    let v129 = "absname"
                    let v130 = atom.create(v129)
                    let v131 = []
                    let v132 = [v126, ..v131]
                    let v133 = erlang_term_apply(v128, v130, v132)
                    let v134 = "unicode"
                    let v135 = atom.create(v134)
                    let v136 = "characters_to_binary"
                    let v137 = atom.create(v136)
                    let v138 = []
                    let v139 = [v133, ..v138]
                    let v140 = erlang_term_apply(v135, v137, v139)
                    let v141 = erlang_term_coerce(v140)
                    let v142 = v124 != ""
                    let v217 =
                        case v142 {
                            True -> {
                                let v143 = spiral_fs_read_file(v124)
                                let v144 = method372()
                                let v145 = method373()
                                let v146 = case v143 { Ok(x) -> v144(x) Error(x) -> v145(x) }
                                case v146  {
                                    Us80Error(v156) -> panic as "file_system.read_all_text: file:read_file failed"
                                    Us80Ok(v147) -> {
                                        let v148 = bit_array.to_string(v147)
                                        let v149 = method260()
                                        let v150 = method261()
                                        let v151 = case v148 { Ok(x) -> v149(x) Error(x) -> v150(x) }
                                        case v151  {
                                            Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                            Us56Ok(v152) -> v152
                                        }
                                    }
                                }
                            }
                            False -> {
                                let v161 = erlang_term_coerce("\n")
                                let v162 = spiral_fs_read_file(v125)
                                let v163 = method372()
                                let v164 = method373()
                                let v165 = case v162 { Ok(x) -> v163(x) Error(x) -> v164(x) }
                                let v178 =
                                    case v165  {
                                        Us80Error(v175) -> panic as "file_system.read_all_text: file:read_file failed"
                                        Us80Ok(v166) -> {
                                            let v167 = bit_array.to_string(v166)
                                            let v168 = method260()
                                            let v169 = method261()
                                            let v170 = case v167 { Ok(x) -> v168(x) Error(x) -> v169(x) }
                                            case v170  {
                                                Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                                Us56Ok(v171) -> v171
                                            }
                                        }
                                    }
                                let v179 = erlang_term_coerce(v178)
                                let v181 = atom.create("json")
                                let v183 = atom.create("decode")
                                let v184 = []
                                let v185 = [v179, ..v184]
                                let v186 = erlang_term_apply(v181, v183, v185)
                                let v187 = []
                                let v188 = erlang_term_coerce(v187)
                                let v190 = erlang_term_coerce("program")
                                let v191 = erlang_term_coerce(v188)
                                let v193 = atom.create("maps")
                                let v195 = atom.create("get")
                                let v196 = []
                                let v197 = [v191, ..v196]
                                let v198 = [v186, ..v197]
                                let v199 = [v190, ..v198]
                                let v200 = erlang_term_apply(v193, v195, v199)
                                let v201 = erlang_term_coerce(v200)
                                let v202 = atom.create(v81)
                                let v204 = atom.create("join")
                                let v205 = []
                                let v206 = [v201, ..v205]
                                let v207 = [v161, ..v206]
                                let v208 = erlang_term_apply(v202, v204, v207)
                                let v209 = atom.create(v12)
                                let v211 = atom.create("iolist_to_binary")
                                let v212 = []
                                let v213 = [v208, ..v212]
                                let v214 = erlang_term_apply(v209, v211, v213)
                                let v215 = erlang_term_coerce(v214)
                                let v216 = { v215 } <> { "\n" }
                                v216
                            }
                        }
                    let v218 = "\n"
                    let v219 = erlang_term_coerce(v217)
                    let v220 = erlang_term_coerce(v99)
                    let v221 = "Elixir.Spiral.Cells.Document"
                    let v222 = atom.create(v221)
                    let v223 = "parse_spi"
                    let v224 = atom.create(v223)
                    let v225 = []
                    let v226 = [v220, ..v225]
                    let v227 = [v219, ..v226]
                    let v228 = erlang_term_apply(v222, v224, v227)
                    let v229 = []
                    let v230 = erlang_term_coerce(v229)
                    let v231 = "cells"
                    let v232 = atom.create(v231)
                    let v233 = erlang_term_coerce(v232)
                    let v234 = erlang_term_coerce(v233)
                    let v235 = erlang_term_coerce(v230)
                    let v236 = "maps"
                    let v237 = atom.create(v236)
                    let v238 = "get"
                    let v239 = atom.create(v238)
                    let v240 = []
                    let v241 = [v235, ..v240]
                    let v242 = [v228, ..v241]
                    let v243 = [v234, ..v242]
                    let v244 = erlang_term_apply(v237, v239, v243)
                    let v245 = erlang_term_coerce(v244)
                    let v246 = atom.create(v81)
                    let v247 = atom.create(v83)
                    let v248 = []
                    let v249 = [v245, ..v248]
                    let v250 = erlang_term_apply(v246, v247, v249)
                    let v252 = items_from_303(v250, Uh30Nil)
                    let v254 = method402(v252, Uh30Nil)
                    let v256 = method403(v254, Uh3Nil)
                    let v257 = delimited_21(v218, v256)
                    let v258 = spiral_fs_read_file(v141)
                    let v259 = method372()
                    let v260 = method373()
                    let v261 = case v258 { Ok(x) -> v259(x) Error(x) -> v260(x) }
                    let v274 =
                        case v261  {
                            Us80Error(v271) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us80Ok(v262) -> {
                                let v263 = bit_array.to_string(v262)
                                let v264 = method260()
                                let v265 = method261()
                                let v266 = case v263 { Ok(x) -> v264(x) Error(x) -> v265(x) }
                                case v266  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v267) -> v267
                                }
                            }
                        }
                    let v275 = erlang_term_coerce(v274)
                    let v276 = erlang_term_coerce(v99)
                    let v277 = atom.create(v221)
                    let v278 = atom.create(v223)
                    let v279 = []
                    let v280 = [v276, ..v279]
                    let v281 = [v275, ..v280]
                    let v282 = erlang_term_apply(v277, v278, v281)
                    let v283 = []
                    let v284 = erlang_term_coerce(v283)
                    let v285 = atom.create(v231)
                    let v286 = erlang_term_coerce(v285)
                    let v287 = erlang_term_coerce(v286)
                    let v288 = erlang_term_coerce(v284)
                    let v289 = atom.create(v236)
                    let v290 = atom.create(v238)
                    let v291 = []
                    let v292 = [v288, ..v291]
                    let v293 = [v282, ..v292]
                    let v294 = [v287, ..v293]
                    let v295 = erlang_term_apply(v289, v290, v294)
                    let v296 = erlang_term_coerce(v295)
                    let v297 = atom.create(v81)
                    let v298 = atom.create(v83)
                    let v299 = []
                    let v300 = [v296, ..v299]
                    let v301 = erlang_term_apply(v297, v298, v300)
                    let v303 = items_from_303(v301, Uh30Nil)
                    let v305 = method402(v303, Uh30Nil)
                    let v307 = method403(v305, Uh3Nil)
                    let v308 = delimited_21(v218, v307)
                    let v309 = v257 == v308
                    let v310 = spiral_fs_read_file(v141)
                    let v311 = method372()
                    let v312 = method373()
                    let v313 = case v310 { Ok(x) -> v311(x) Error(x) -> v312(x) }
                    let v326 =
                        case v313  {
                            Us80Error(v323) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us80Ok(v314) -> {
                                let v315 = bit_array.to_string(v314)
                                let v316 = method260()
                                let v317 = method261()
                                let v318 = case v315 { Ok(x) -> v316(x) Error(x) -> v317(x) }
                                case v318  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v319) -> v319
                                }
                            }
                        }
                    let v327 = erlang_term_coerce(v326)
                    let v328 = erlang_term_coerce(v99)
                    let v329 = atom.create(v221)
                    let v330 = atom.create(v223)
                    let v331 = []
                    let v332 = [v328, ..v331]
                    let v333 = [v327, ..v332]
                    let v334 = erlang_term_apply(v329, v330, v333)
                    let v335 = erlang_term_coerce(v141)
                    let v336 = atom.create(v127)
                    let v337 = atom.create(v129)
                    let v338 = []
                    let v339 = [v335, ..v338]
                    let v340 = erlang_term_apply(v336, v337, v339)
                    let v341 = atom.create(v134)
                    let v342 = atom.create(v136)
                    let v343 = []
                    let v344 = [v340, ..v343]
                    let v345 = erlang_term_apply(v341, v342, v344)
                    let v346 = erlang_term_coerce(v345)
                    let v347 = erlang_term_coerce(v346)
                    let v348 = atom.create(v127)
                    let v349 = "dirname"
                    let v350 = atom.create(v349)
                    let v351 = []
                    let v352 = [v347, ..v351]
                    let v353 = erlang_term_apply(v348, v350, v352)
                    let v354 = atom.create(v134)
                    let v355 = atom.create(v136)
                    let v356 = []
                    let v357 = [v353, ..v356]
                    let v358 = erlang_term_apply(v354, v355, v357)
                    let v359 = erlang_term_coerce(v358)
                    let v360 = erlang_term_coerce(v141)
                    let v361 = "path"
                    let v362 = atom.create(v361)
                    let v363 = erlang_term_coerce(v362)
                    let v364 = []
                    let v365 = [v360, ..v364]
                    let v366 = [v363, ..v365]
                    let v367 = erlang_term_tuple(v366)
                    let v368 = erlang_term_coerce(v359)
                    let v369 = "root"
                    let v370 = atom.create(v369)
                    let v371 = erlang_term_coerce(v370)
                    let v372 = []
                    let v373 = [v368, ..v372]
                    let v374 = [v371, ..v373]
                    let v375 = erlang_term_tuple(v374)
                    let v376 = "tests"
                    let v377 = atom.create(v376)
                    let v378 = erlang_term_coerce(v377)
                    let v379 = "plan"
                    let v380 = atom.create(v379)
                    let v381 = erlang_term_coerce(v380)
                    let v382 = []
                    let v383 = [v378, ..v382]
                    let v384 = [v381, ..v383]
                    let v385 = erlang_term_tuple(v384)
                    let v386 = erlang_term_coerce(False)
                    let v387 = "spi"
                    let v388 = atom.create(v387)
                    let v389 = erlang_term_coerce(v388)
                    let v390 = []
                    let v391 = [v386, ..v390]
                    let v392 = [v389, ..v391]
                    let v393 = erlang_term_tuple(v392)
                    let v394 = erlang_term_coerce(False)
                    let v395 = "memo"
                    let v396 = atom.create(v395)
                    let v397 = erlang_term_coerce(v396)
                    let v398 = []
                    let v399 = [v394, ..v398]
                    let v400 = [v397, ..v399]
                    let v401 = erlang_term_tuple(v400)
                    let v402 = []
                    let v403 = [v401, ..v402]
                    let v404 = [v393, ..v403]
                    let v405 = [v385, ..v404]
                    let v406 = [v375, ..v405]
                    let v407 = [v367, ..v406]
                    let v408 = erlang_term_coerce(v407)
                    let v409 = "Elixir.Spiral.Cells.Notebook"
                    let v410 = atom.create(v409)
                    let v411 = "evaluate"
                    let v412 = atom.create(v411)
                    let v413 = []
                    let v414 = [v408, ..v413]
                    let v415 = [v334, ..v414]
                    let v416 = erlang_term_apply(v410, v412, v415)
                    let v417 = "none"
                    let v418 = atom.create(v417)
                    let v419 = erlang_term_coerce(v418)
                    let v420 = "status"
                    let v421 = atom.create(v420)
                    let v422 = erlang_term_coerce(v421)
                    let v423 = erlang_term_coerce(v422)
                    let v424 = erlang_term_coerce(v419)
                    let v425 = atom.create(v236)
                    let v426 = atom.create(v238)
                    let v427 = []
                    let v428 = [v424, ..v427]
                    let v429 = [v416, ..v428]
                    let v430 = [v423, ..v429]
                    let v431 = erlang_term_apply(v425, v426, v430)
                    let v432 = erlang_term_coerce(v431)
                    let v433 = atom.create(v20)
                    let v434 = erlang_term_coerce(v433)
                    let v435 = v432 == v434
                    case v435 {
                        True -> Nil
                        False -> {
                            let v436 = atom.create(v417)
                            let v437 = erlang_term_coerce(v436)
                            let v438 = atom.create(v420)
                            let v439 = erlang_term_coerce(v438)
                            let v440 = erlang_term_coerce(v439)
                            let v441 = erlang_term_coerce(v437)
                            let v442 = atom.create(v236)
                            let v443 = atom.create(v238)
                            let v444 = []
                            let v445 = [v441, ..v444]
                            let v446 = [v416, ..v445]
                            let v447 = [v440, ..v446]
                            let v448 = erlang_term_apply(v442, v443, v447)
                            let v449 = erlang_term_coerce(v448)
                            let v450 = string.inspect(v449)
                            let v451 = { "xsim thread_run / evaluate status " } <> { v450 }
                            let v452 = { v451 } <> { "\n" }
                            let v454 = atom.create("standard_error")
                            let v455 = erlang_term_coerce(v454)
                            let v456 = erlang_term_coerce(v452)
                            let v458 = atom.create("io")
                            let v460 = atom.create("put_chars")
                            let v461 = []
                            let v462 = [v456, ..v461]
                            let v463 = [v455, ..v462]
                            let _v464 = erlang_term_apply(v458, v460, v463)
                            Nil
                        }
                    }
                    let v465 = []
                    let v466 = erlang_term_coerce(v465)
                    let v467 = atom.create(v236)
                    let v468 = "from_list"
                    let v469 = atom.create(v468)
                    let v470 = []
                    let v471 = [v466, ..v470]
                    let v472 = erlang_term_apply(v467, v469, v471)
                    let v473 = "report"
                    let v474 = atom.create(v473)
                    let v475 = erlang_term_coerce(v474)
                    let v476 = erlang_term_coerce(v475)
                    let v477 = erlang_term_coerce(v472)
                    let v478 = atom.create(v236)
                    let v479 = atom.create(v238)
                    let v480 = []
                    let v481 = [v477, ..v480]
                    let v482 = [v416, ..v481]
                    let v483 = [v476, ..v482]
                    let v484 = erlang_term_apply(v478, v479, v483)
                    let v485 = erlang_term_coerce(v484)
                    let v486 = []
                    let v487 = erlang_term_coerce(v486)
                    let v488 = erlang_term_coerce(v376)
                    let v489 = erlang_term_coerce(v487)
                    let v490 = atom.create(v236)
                    let v491 = atom.create(v238)
                    let v492 = []
                    let v493 = [v489, ..v492]
                    let v494 = [v485, ..v493]
                    let v495 = [v488, ..v494]
                    let v496 = erlang_term_apply(v490, v491, v495)
                    let v497 = erlang_term_coerce(v496)
                    let v498 = atom.create(v81)
                    let v499 = atom.create(v83)
                    let v500 = []
                    let v501 = [v497, ..v500]
                    let v502 = erlang_term_apply(v498, v499, v501)
                    let v504 = items_from_303(v502, Uh30Nil)
                    let v506 = method443(v504, Uh3Nil)
                    let v507 = erlang_term_coerce(v217)
                    let v508 = erlang_term_coerce(v99)
                    let v509 = atom.create(v221)
                    let v510 = atom.create(v223)
                    let v511 = []
                    let v512 = [v508, ..v511]
                    let v513 = [v507, ..v512]
                    let v514 = erlang_term_apply(v509, v510, v513)
                    let v515 = erlang_term_coerce(v141)
                    let v516 = atom.create(v127)
                    let v517 = atom.create(v129)
                    let v518 = []
                    let v519 = [v515, ..v518]
                    let v520 = erlang_term_apply(v516, v517, v519)
                    let v521 = atom.create(v134)
                    let v522 = atom.create(v136)
                    let v523 = []
                    let v524 = [v520, ..v523]
                    let v525 = erlang_term_apply(v521, v522, v524)
                    let v526 = erlang_term_coerce(v525)
                    let v527 = erlang_term_coerce(v526)
                    let v528 = atom.create(v127)
                    let v529 = atom.create(v349)
                    let v530 = []
                    let v531 = [v527, ..v530]
                    let v532 = erlang_term_apply(v528, v529, v531)
                    let v533 = atom.create(v134)
                    let v534 = atom.create(v136)
                    let v535 = []
                    let v536 = [v532, ..v535]
                    let v537 = erlang_term_apply(v533, v534, v536)
                    let v538 = erlang_term_coerce(v537)
                    let v539 = erlang_term_coerce(v141)
                    let v540 = atom.create(v361)
                    let v541 = erlang_term_coerce(v540)
                    let v542 = []
                    let v543 = [v539, ..v542]
                    let v544 = [v541, ..v543]
                    let v545 = erlang_term_tuple(v544)
                    let v546 = erlang_term_coerce(v538)
                    let v547 = atom.create(v369)
                    let v548 = erlang_term_coerce(v547)
                    let v549 = []
                    let v550 = [v546, ..v549]
                    let v551 = [v548, ..v550]
                    let v552 = erlang_term_tuple(v551)
                    let v553 = atom.create(v376)
                    let v554 = erlang_term_coerce(v553)
                    let v555 = atom.create(v379)
                    let v556 = erlang_term_coerce(v555)
                    let v557 = []
                    let v558 = [v554, ..v557]
                    let v559 = [v556, ..v558]
                    let v560 = erlang_term_tuple(v559)
                    let v561 = erlang_term_coerce(False)
                    let v562 = atom.create(v387)
                    let v563 = erlang_term_coerce(v562)
                    let v564 = []
                    let v565 = [v561, ..v564]
                    let v566 = [v563, ..v565]
                    let v567 = erlang_term_tuple(v566)
                    let v568 = erlang_term_coerce(False)
                    let v569 = atom.create(v395)
                    let v570 = erlang_term_coerce(v569)
                    let v571 = []
                    let v572 = [v568, ..v571]
                    let v573 = [v570, ..v572]
                    let v574 = erlang_term_tuple(v573)
                    let v575 = []
                    let v576 = [v574, ..v575]
                    let v577 = [v567, ..v576]
                    let v578 = [v560, ..v577]
                    let v579 = [v552, ..v578]
                    let v580 = [v545, ..v579]
                    let v581 = erlang_term_coerce(v580)
                    let v582 = atom.create(v409)
                    let v583 = atom.create(v411)
                    let v584 = []
                    let v585 = [v581, ..v584]
                    let v586 = [v514, ..v585]
                    let v587 = erlang_term_apply(v582, v583, v586)
                    let v588 = atom.create(v417)
                    let v589 = erlang_term_coerce(v588)
                    let v590 = atom.create(v420)
                    let v591 = erlang_term_coerce(v590)
                    let v592 = erlang_term_coerce(v591)
                    let v593 = erlang_term_coerce(v589)
                    let v594 = atom.create(v236)
                    let v595 = atom.create(v238)
                    let v596 = []
                    let v597 = [v593, ..v596]
                    let v598 = [v587, ..v597]
                    let v599 = [v592, ..v598]
                    let v600 = erlang_term_apply(v594, v595, v599)
                    let v601 = erlang_term_coerce(v600)
                    let v602 = atom.create(v20)
                    let v603 = erlang_term_coerce(v602)
                    let v604 = v601 == v603
                    case v604 {
                        True -> Nil
                        False -> {
                            let v605 = atom.create(v417)
                            let v606 = erlang_term_coerce(v605)
                            let v607 = atom.create(v420)
                            let v608 = erlang_term_coerce(v607)
                            let v609 = erlang_term_coerce(v608)
                            let v610 = erlang_term_coerce(v606)
                            let v611 = atom.create(v236)
                            let v612 = atom.create(v238)
                            let v613 = []
                            let v614 = [v610, ..v613]
                            let v615 = [v587, ..v614]
                            let v616 = [v609, ..v615]
                            let v617 = erlang_term_apply(v611, v612, v616)
                            let v618 = erlang_term_coerce(v617)
                            let v619 = string.inspect(v618)
                            let v620 = { "xsim thread_run / evaluate status " } <> { v619 }
                            let v621 = { v620 } <> { "\n" }
                            let v623 = atom.create("standard_error")
                            let v624 = erlang_term_coerce(v623)
                            let v625 = erlang_term_coerce(v621)
                            let v627 = atom.create("io")
                            let v629 = atom.create("put_chars")
                            let v630 = []
                            let v631 = [v625, ..v630]
                            let v632 = [v624, ..v631]
                            let _v633 = erlang_term_apply(v627, v629, v632)
                            Nil
                        }
                    }
                    let v634 = []
                    let v635 = erlang_term_coerce(v634)
                    let v636 = atom.create(v236)
                    let v637 = atom.create(v468)
                    let v638 = []
                    let v639 = [v635, ..v638]
                    let v640 = erlang_term_apply(v636, v637, v639)
                    let v641 = atom.create(v473)
                    let v642 = erlang_term_coerce(v641)
                    let v643 = erlang_term_coerce(v642)
                    let v644 = erlang_term_coerce(v640)
                    let v645 = atom.create(v236)
                    let v646 = atom.create(v238)
                    let v647 = []
                    let v648 = [v644, ..v647]
                    let v649 = [v587, ..v648]
                    let v650 = [v643, ..v649]
                    let v651 = erlang_term_apply(v645, v646, v650)
                    let v652 = erlang_term_coerce(v651)
                    let v653 = []
                    let v654 = erlang_term_coerce(v653)
                    let v655 = erlang_term_coerce(v376)
                    let v656 = erlang_term_coerce(v654)
                    let v657 = atom.create(v236)
                    let v658 = atom.create(v238)
                    let v659 = []
                    let v660 = [v656, ..v659]
                    let v661 = [v652, ..v660]
                    let v662 = [v655, ..v661]
                    let v663 = erlang_term_apply(v657, v658, v662)
                    let v664 = erlang_term_coerce(v663)
                    let v665 = atom.create(v81)
                    let v666 = atom.create(v83)
                    let v667 = []
                    let v668 = [v664, ..v667]
                    let v669 = erlang_term_apply(v665, v666, v668)
                    let v671 = items_from_303(v669, Uh30Nil)
                    let v673 = method443(v671, Uh3Nil)
                    let v674 = erlang_term_coerce(v217)
                    let v675 = erlang_term_coerce(v99)
                    let v676 = atom.create(v221)
                    let v677 = atom.create(v223)
                    let v678 = []
                    let v679 = [v675, ..v678]
                    let v680 = [v674, ..v679]
                    let v681 = erlang_term_apply(v676, v677, v680)
                    let v682 = []
                    let v683 = erlang_term_coerce(v682)
                    let v684 = atom.create(v231)
                    let v685 = erlang_term_coerce(v684)
                    let v686 = erlang_term_coerce(v685)
                    let v687 = erlang_term_coerce(v683)
                    let v688 = atom.create(v236)
                    let v689 = atom.create(v238)
                    let v690 = []
                    let v691 = [v687, ..v690]
                    let v692 = [v681, ..v691]
                    let v693 = [v686, ..v692]
                    let v694 = erlang_term_apply(v688, v689, v693)
                    let v695 = erlang_term_coerce(v694)
                    let v696 = atom.create(v81)
                    let v697 = atom.create(v83)
                    let v698 = []
                    let v699 = [v695, ..v698]
                    let v700 = erlang_term_apply(v696, v697, v699)
                    let v702 = items_from_303(v700, Uh30Nil)
                    let v704 = method402(v702, Uh30Nil)
                    let v706 = method403(v704, Uh3Nil)
                    let v708 = method20(v706, 0)
                    let v710 = method20(v673, 0)
                    let v711 = int.to_string(v708)
                    let v712 = { " cells=" } <> { v711 }
                    let v713 = { v712 } <> { " tests=" }
                    let v714 = int.to_string(v710)
                    let v715 = { v713 } <> { v714 }
                    let v716 = erlang_term_coerce(v141)
                    let v717 = atom.create(v127)
                    let v719 = atom.create("basename")
                    let v720 = []
                    let v721 = [v716, ..v720]
                    let v722 = erlang_term_apply(v717, v719, v721)
                    let v723 = atom.create(v134)
                    let v724 = atom.create(v136)
                    let v725 = []
                    let v726 = [v722, ..v725]
                    let v727 = erlang_term_apply(v723, v724, v726)
                    let v728 = erlang_term_coerce(v727)
                    let v729 = { "XSIM thread_run file=" } <> { v728 }
                    let v730 = { v729 } <> { v715 }
                    let v731 = { v730 } <> { " same_cells=" }
                    let v734 =
                        case v309 {
                            True -> {
                                "true"
                            }
                            False -> {
                                "false"
                            }
                        }
                    let v735 = { v731 } <> { v734 }
                    let v737 =
                        case v309 {
                            True -> {
                                v435 == v604
                            }
                            False -> False
                        }
                    let v741 =
                        case v737 {
                            True -> {
                                let v738 = delimited_21(v218, v506)
                                let v739 = delimited_21(v218, v673)
                                v738 == v739
                            }
                            False -> False
                        }
                    let v746 =
                        case v741 {
                            True -> {
                                case v506  {
                                    Uh3Cons(v742, v743) -> True
                                    Uh3Nil -> False
                                }
                            }
                            False -> False
                        }
                    let v747 = v746 && v435
                    let v749 =
                        case v604 {
                            True -> v20
                            False -> {
                                "error"
                            }
                        }
                    let v750 = { " status=" } <> { v749 }
                    let v751 = { v750 } <> { "/" }
                    let v753 =
                        case v435 {
                            True -> v20
                            False -> {
                                "error"
                            }
                        }
                    let v754 = { v751 } <> { v753 }
                    let v755 = { v754 } <> { " result=" }
                    let v758 =
                        case v747 {
                            True -> {
                                "pass"
                            }
                            False -> {
                                "fail"
                            }
                        }
                    let v759 = { v755 } <> { v758 }
                    let v760 = { v735 } <> { v759 }
                    let v761 = paired_rows_445(v506, v673)
                    let v762 = Uh3Cons(v760, v761)
                    delimited_21(v218, v762)
                }
            }
        let v768 = { v767 } <> { "\n" }
        let v769 = erlang_term_coerce(v768)
        let v771 = atom.create("io")
        let v773 = atom.create("put_chars")
        let v774 = []
        let v775 = [v769, ..v774]
        let _v776 = erlang_term_apply(v771, v773, v775)
        let v777 = v767 == ""
        let v781 =
            case v777 {
                True -> Uh3Nil
                False -> {
                    split_list_2("\n", v767)
                }
            }
        let v782 = method411()
        let v783 = method412(v782, v781)
        case v783 {
            True -> 1
            False -> 0
        }
    }
}

pub fn closure138(capt: Nil) -> fn(String) -> Us97 {
    fn (v0) {
        Us97None
    }
}

pub fn closure137(capt: Nil) -> fn(#(String, Int)) -> fn(String) -> Us97 {
    fn (dom) {
        let #(_v0, _v1) = dom
        closure138(Nil)
    }
}

pub fn closure141(capt: #(String, Int, String)) -> fn(String) -> Us98 {
    fn (v3) {
        let #(v0, v1, v2) = capt
        let v4 = v2 == "spi"
        case v4 {
            True -> Us98Ok(v3, v1)
            False -> {
                let v6 = v2 == "cells"
                case v6 {
                    True -> {
                        let v7 = count_of_text_10(v3)
                        case v7  {
                            Us3None -> {
                                let v10 = { "--cells takes a whole number, got '" } <> { v3 }
                                let v11 = { v10 } <> { "'" }
                                Us98Error(v11)
                            }
                            Us3Some(v8) -> Us98Ok(v0, v8)
                        }
                    }
                    False -> {
                        let v15 = { "unknown option --" } <> { v2 }
                        Us98Error(v15)
                    }
                }
            }
        }
    }
}

pub fn closure140(capt: #(String, Int)) -> fn(String) -> fn(String) -> Us98 {
    fn (v2) {
        let #(v0, v1) = capt
        closure141(#(v0, v1, v2))
    }
}

pub fn closure139(capt: Nil) -> fn(#(String, Int)) -> fn(String) -> fn(String) -> Us98 {
    fn (dom) {
        let #(v0, v1) = dom
        closure140(#(v0, v1))
    }
}
