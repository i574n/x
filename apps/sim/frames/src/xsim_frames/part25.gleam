import gleam/bit_array
import gleam/erlang/atom
import gleam/string
import xsim_frames/types.{type Us90, type Us91, Uh29Nil, Uh3Cons, Uh3Nil, Us3None, Us3Some, Us56Error, Us56Ok, Us76Error, Us76Ok, Us89Error, Us89Ok, Us90None, Us91Error, Us91Ok}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_fs_read_file, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part10.{method259, method260}
import xsim_frames/part17.{method367, method368}
import xsim_frames/part2.{delimited_21, method20}
import xsim_frames/part20.{method396, method397, method398, method399, method400}
import xsim_frames/part24.{closure133, closure135, flags_parsed_427, method431, paired_rows_433}

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
        let v124 = flags_parsed_427(v121, v122, v123, v123, v123, v120)
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
        let v734 =
            case v146  {
                Us89Error(v730) -> {
                    let v731 = "XSIM rejected thread_run: "
                    let v732 = v731 <> v730 
                    v732
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
                    let v158 = erlang_term_coerce(v157)
                    let v159 = v148 != ""
                    let v228 =
                        case v159 {
                            True -> {
                                let v160 = spiral_fs_read_file(v148)
                                let v161 = method367()
                                let v162 = method368()
                                let v163 = case v160 { Ok(x) -> v161(x) Error(x) -> v162(x) }
                                case v163  {
                                    Us76Error(v173) -> panic as "file_system.read_all_text: file:read_file failed"
                                    Us76Ok(v164) -> {
                                        let v165 = bit_array.to_string(v164)
                                        let v166 = method259()
                                        let v167 = method260()
                                        let v168 = case v165 { Ok(x) -> v166(x) Error(x) -> v167(x) }
                                        case v168  {
                                            Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                            Us56Ok(v169) -> v169
                                        }
                                    }
                                }
                            }
                            False -> {
                                let v177 = "\n"
                                let v178 = erlang_term_coerce(v177)
                                let v179 = spiral_fs_read_file(v149)
                                let v180 = method367()
                                let v181 = method368()
                                let v182 = case v179 { Ok(x) -> v180(x) Error(x) -> v181(x) }
                                let v195 =
                                    case v182  {
                                        Us76Error(v192) -> panic as "file_system.read_all_text: file:read_file failed"
                                        Us76Ok(v183) -> {
                                            let v184 = bit_array.to_string(v183)
                                            let v185 = method259()
                                            let v186 = method260()
                                            let v187 = case v184 { Ok(x) -> v185(x) Error(x) -> v186(x) }
                                            case v187  {
                                                Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                                Us56Ok(v188) -> v188
                                            }
                                        }
                                    }
                                let v196 = erlang_term_coerce(v195)
                                let v197 = "json"
                                let v198 = atom.create(v197)
                                let v199 = "decode"
                                let v200 = atom.create(v199)
                                let v201 = []
                                let v202 = [v196, ..v201]
                                let v203 = erlang_term_apply(v198, v200, v202)
                                let v204 = "program"
                                let v205 = erlang_term_coerce(v204)
                                let v206 = "maps"
                                let v207 = atom.create(v206)
                                let v208 = "get"
                                let v209 = atom.create(v208)
                                let v210 = []
                                let v211 = [v203, ..v210]
                                let v212 = [v205, ..v211]
                                let v213 = erlang_term_apply(v207, v209, v212)
                                let v214 = atom.create(v95)
                                let v215 = atom.create(v97)
                                let v216 = []
                                let v217 = [v213, ..v216]
                                let v218 = [v178, ..v217]
                                let v219 = erlang_term_apply(v214, v215, v218)
                                let v220 = atom.create(v12)
                                let v221 = "iolist_to_binary"
                                let v222 = atom.create(v221)
                                let v223 = []
                                let v224 = [v219, ..v223]
                                let v225 = erlang_term_apply(v220, v222, v224)
                                let v226 = erlang_term_coerce(v225)
                                let v227 = v226 <> v177 
                                v227
                            }
                        }
                    let v229 = "\n"
                    let v230 = erlang_term_coerce(v228)
                    let v231 = erlang_term_coerce(v123)
                    let v232 = "Elixir.Spiral.Cells.Document"
                    let v233 = atom.create(v232)
                    let v234 = "parse_spi"
                    let v235 = atom.create(v234)
                    let v236 = []
                    let v237 = [v231, ..v236]
                    let v238 = [v230, ..v237]
                    let v239 = erlang_term_apply(v233, v235, v238)
                    let v240 = []
                    let v241 = erlang_term_coerce(v240)
                    let v242 = "cells"
                    let v243 = atom.create(v242)
                    let v244 = erlang_term_coerce(v243)
                    let v245 = "maps"
                    let v246 = atom.create(v245)
                    let v247 = "get"
                    let v248 = atom.create(v247)
                    let v249 = []
                    let v250 = [v241, ..v249]
                    let v251 = [v239, ..v250]
                    let v252 = [v244, ..v251]
                    let v253 = erlang_term_apply(v246, v248, v252)
                    let v254 = atom.create(v12)
                    let v255 = "length"
                    let v256 = atom.create(v255)
                    let v257 = []
                    let v258 = [v253, ..v257]
                    let v259 = erlang_term_apply(v254, v256, v258)
                    let v260 = erlang_term_coerce(v259)
                    let v261 = 0
                    let v262 = method396(v260, v253, v261)
                    let v263 = Uh29Nil
                    let v264 = method397(v262, v263)
                    let v265 = Uh3Nil
                    let v266 = method398(v264, v265)
                    let v267 = delimited_21(v229, v266)
                    let v268 = spiral_fs_read_file(v158)
                    let v269 = method367()
                    let v270 = method368()
                    let v271 = case v268 { Ok(x) -> v269(x) Error(x) -> v270(x) }
                    let v284 =
                        case v271  {
                            Us76Error(v281) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us76Ok(v272) -> {
                                let v273 = bit_array.to_string(v272)
                                let v274 = method259()
                                let v275 = method260()
                                let v276 = case v273 { Ok(x) -> v274(x) Error(x) -> v275(x) }
                                case v276  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v277) -> v277
                                }
                            }
                        }
                    let v285 = erlang_term_coerce(v284)
                    let v286 = erlang_term_coerce(v123)
                    let v287 = atom.create(v232)
                    let v288 = atom.create(v234)
                    let v289 = []
                    let v290 = [v286, ..v289]
                    let v291 = [v285, ..v290]
                    let v292 = erlang_term_apply(v287, v288, v291)
                    let v293 = []
                    let v294 = erlang_term_coerce(v293)
                    let v295 = atom.create(v242)
                    let v296 = erlang_term_coerce(v295)
                    let v297 = atom.create(v245)
                    let v298 = atom.create(v247)
                    let v299 = []
                    let v300 = [v294, ..v299]
                    let v301 = [v292, ..v300]
                    let v302 = [v296, ..v301]
                    let v303 = erlang_term_apply(v297, v298, v302)
                    let v304 = atom.create(v12)
                    let v305 = atom.create(v255)
                    let v306 = []
                    let v307 = [v303, ..v306]
                    let v308 = erlang_term_apply(v304, v305, v307)
                    let v309 = erlang_term_coerce(v308)
                    let v310 = 0
                    let v311 = method396(v309, v303, v310)
                    let v312 = Uh29Nil
                    let v313 = method397(v311, v312)
                    let v314 = Uh3Nil
                    let v315 = method398(v313, v314)
                    let v316 = delimited_21(v229, v315)
                    let v317 = v267 == v316
                    let v318 = spiral_fs_read_file(v158)
                    let v319 = method367()
                    let v320 = method368()
                    let v321 = case v318 { Ok(x) -> v319(x) Error(x) -> v320(x) }
                    let v334 =
                        case v321  {
                            Us76Error(v331) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us76Ok(v322) -> {
                                let v323 = bit_array.to_string(v322)
                                let v324 = method259()
                                let v325 = method260()
                                let v326 = case v323 { Ok(x) -> v324(x) Error(x) -> v325(x) }
                                case v326  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v327) -> v327
                                }
                            }
                        }
                    let v335 = erlang_term_coerce(v334)
                    let v336 = erlang_term_coerce(v123)
                    let v337 = atom.create(v232)
                    let v338 = atom.create(v234)
                    let v339 = []
                    let v340 = [v336, ..v339]
                    let v341 = [v335, ..v340]
                    let v342 = erlang_term_apply(v337, v338, v341)
                    let v343 = erlang_term_coerce(v158)
                    let v344 = atom.create(v151)
                    let v345 = atom.create(v153)
                    let v346 = []
                    let v347 = [v343, ..v346]
                    let v348 = erlang_term_apply(v344, v345, v347)
                    let v349 = atom.create(v151)
                    let v350 = "dirname"
                    let v351 = atom.create(v350)
                    let v352 = []
                    let v353 = [v348, ..v352]
                    let v354 = erlang_term_apply(v349, v351, v353)
                    let v355 = erlang_term_coerce(v354)
                    let v356 = erlang_term_coerce(v158)
                    let v357 = "path"
                    let v358 = atom.create(v357)
                    let v359 = erlang_term_coerce(v358)
                    let v360 = []
                    let v361 = [v356, ..v360]
                    let v362 = [v359, ..v361]
                    let v363 = erlang_term_tuple(v362)
                    let v364 = erlang_term_coerce(v355)
                    let v365 = "root"
                    let v366 = atom.create(v365)
                    let v367 = erlang_term_coerce(v366)
                    let v368 = []
                    let v369 = [v364, ..v368]
                    let v370 = [v367, ..v369]
                    let v371 = erlang_term_tuple(v370)
                    let v372 = "tests"
                    let v373 = atom.create(v372)
                    let v374 = erlang_term_coerce(v373)
                    let v375 = "plan"
                    let v376 = atom.create(v375)
                    let v377 = erlang_term_coerce(v376)
                    let v378 = []
                    let v379 = [v374, ..v378]
                    let v380 = [v377, ..v379]
                    let v381 = erlang_term_tuple(v380)
                    let v382 = erlang_term_coerce(False)
                    let v383 = "spi"
                    let v384 = atom.create(v383)
                    let v385 = erlang_term_coerce(v384)
                    let v386 = []
                    let v387 = [v382, ..v386]
                    let v388 = [v385, ..v387]
                    let v389 = erlang_term_tuple(v388)
                    let v390 = erlang_term_coerce(False)
                    let v391 = "memo"
                    let v392 = atom.create(v391)
                    let v393 = erlang_term_coerce(v392)
                    let v394 = []
                    let v395 = [v390, ..v394]
                    let v396 = [v393, ..v395]
                    let v397 = erlang_term_tuple(v396)
                    let v398 = []
                    let v399 = [v397, ..v398]
                    let v400 = [v389, ..v399]
                    let v401 = [v381, ..v400]
                    let v402 = [v371, ..v401]
                    let v403 = [v363, ..v402]
                    let v404 = erlang_term_coerce(v403)
                    let v405 = "Elixir.Spiral.Cells.Notebook"
                    let v406 = atom.create(v405)
                    let v407 = "evaluate"
                    let v408 = atom.create(v407)
                    let v409 = []
                    let v410 = [v404, ..v409]
                    let v411 = [v342, ..v410]
                    let v412 = erlang_term_apply(v406, v408, v411)
                    let v413 = "none"
                    let v414 = atom.create(v413)
                    let v415 = erlang_term_coerce(v414)
                    let v416 = "status"
                    let v417 = atom.create(v416)
                    let v418 = erlang_term_coerce(v417)
                    let v419 = atom.create(v245)
                    let v420 = atom.create(v247)
                    let v421 = []
                    let v422 = [v415, ..v421]
                    let v423 = [v412, ..v422]
                    let v424 = [v418, ..v423]
                    let v425 = erlang_term_apply(v419, v420, v424)
                    let v426 = atom.create(v20)
                    let v427 = erlang_term_coerce(v426)
                    let v428 = v425 == v427
                    case v428 {
                        True -> Nil
                        False -> {
                            let v429 = atom.create(v413)
                            let v430 = erlang_term_coerce(v429)
                            let v431 = atom.create(v416)
                            let v432 = erlang_term_coerce(v431)
                            let v433 = atom.create(v245)
                            let v434 = atom.create(v247)
                            let v435 = []
                            let v436 = [v430, ..v435]
                            let v437 = [v412, ..v436]
                            let v438 = [v432, ..v437]
                            let v439 = erlang_term_apply(v433, v434, v438)
                            let v440 = string.inspect(v439)
                            let v441 = "xsim thread_run / evaluate status "
                            let v442 = v441 <> v440 
                            let v443 = v442 <> v229 
                            let v444 = erlang_term_coerce(v443)
                            let v445 = "standard_error"
                            let v446 = atom.create(v445)
                            let v447 = erlang_term_coerce(v446)
                            let v448 = "io"
                            let v449 = atom.create(v448)
                            let v450 = "put_chars"
                            let v451 = atom.create(v450)
                            let v452 = []
                            let v453 = [v444, ..v452]
                            let v454 = [v447, ..v453]
                            let _v455 = erlang_term_apply(v449, v451, v454)
                            Nil
                        }
                    }
                    let v456 = []
                    let v457 = erlang_term_coerce(v456)
                    let v458 = atom.create(v245)
                    let v459 = "from_list"
                    let v460 = atom.create(v459)
                    let v461 = []
                    let v462 = [v457, ..v461]
                    let v463 = erlang_term_apply(v458, v460, v462)
                    let v464 = "report"
                    let v465 = atom.create(v464)
                    let v466 = erlang_term_coerce(v465)
                    let v467 = atom.create(v245)
                    let v468 = atom.create(v247)
                    let v469 = []
                    let v470 = [v463, ..v469]
                    let v471 = [v412, ..v470]
                    let v472 = [v466, ..v471]
                    let v473 = erlang_term_apply(v467, v468, v472)
                    let v474 = erlang_term_coerce(v372)
                    let v475 = []
                    let v476 = erlang_term_coerce(v475)
                    let v477 = atom.create(v245)
                    let v478 = atom.create(v247)
                    let v479 = []
                    let v480 = [v476, ..v479]
                    let v481 = [v473, ..v480]
                    let v482 = [v474, ..v481]
                    let v483 = erlang_term_apply(v477, v478, v482)
                    let v484 = atom.create(v12)
                    let v485 = atom.create(v255)
                    let v486 = []
                    let v487 = [v483, ..v486]
                    let v488 = erlang_term_apply(v484, v485, v487)
                    let v489 = erlang_term_coerce(v488)
                    let v490 = 0
                    let v491 = method396(v489, v483, v490)
                    let v492 = Uh3Nil
                    let v493 = method431(v491, v492)
                    let v494 = erlang_term_coerce(v228)
                    let v495 = erlang_term_coerce(v123)
                    let v496 = atom.create(v232)
                    let v497 = atom.create(v234)
                    let v498 = []
                    let v499 = [v495, ..v498]
                    let v500 = [v494, ..v499]
                    let v501 = erlang_term_apply(v496, v497, v500)
                    let v502 = erlang_term_coerce(v158)
                    let v503 = atom.create(v151)
                    let v504 = atom.create(v153)
                    let v505 = []
                    let v506 = [v502, ..v505]
                    let v507 = erlang_term_apply(v503, v504, v506)
                    let v508 = atom.create(v151)
                    let v509 = atom.create(v350)
                    let v510 = []
                    let v511 = [v507, ..v510]
                    let v512 = erlang_term_apply(v508, v509, v511)
                    let v513 = erlang_term_coerce(v512)
                    let v514 = erlang_term_coerce(v158)
                    let v515 = atom.create(v357)
                    let v516 = erlang_term_coerce(v515)
                    let v517 = []
                    let v518 = [v514, ..v517]
                    let v519 = [v516, ..v518]
                    let v520 = erlang_term_tuple(v519)
                    let v521 = erlang_term_coerce(v513)
                    let v522 = atom.create(v365)
                    let v523 = erlang_term_coerce(v522)
                    let v524 = []
                    let v525 = [v521, ..v524]
                    let v526 = [v523, ..v525]
                    let v527 = erlang_term_tuple(v526)
                    let v528 = atom.create(v372)
                    let v529 = erlang_term_coerce(v528)
                    let v530 = atom.create(v375)
                    let v531 = erlang_term_coerce(v530)
                    let v532 = []
                    let v533 = [v529, ..v532]
                    let v534 = [v531, ..v533]
                    let v535 = erlang_term_tuple(v534)
                    let v536 = erlang_term_coerce(False)
                    let v537 = atom.create(v383)
                    let v538 = erlang_term_coerce(v537)
                    let v539 = []
                    let v540 = [v536, ..v539]
                    let v541 = [v538, ..v540]
                    let v542 = erlang_term_tuple(v541)
                    let v543 = erlang_term_coerce(False)
                    let v544 = atom.create(v391)
                    let v545 = erlang_term_coerce(v544)
                    let v546 = []
                    let v547 = [v543, ..v546]
                    let v548 = [v545, ..v547]
                    let v549 = erlang_term_tuple(v548)
                    let v550 = []
                    let v551 = [v549, ..v550]
                    let v552 = [v542, ..v551]
                    let v553 = [v535, ..v552]
                    let v554 = [v527, ..v553]
                    let v555 = [v520, ..v554]
                    let v556 = erlang_term_coerce(v555)
                    let v557 = atom.create(v405)
                    let v558 = atom.create(v407)
                    let v559 = []
                    let v560 = [v556, ..v559]
                    let v561 = [v501, ..v560]
                    let v562 = erlang_term_apply(v557, v558, v561)
                    let v563 = atom.create(v413)
                    let v564 = erlang_term_coerce(v563)
                    let v565 = atom.create(v416)
                    let v566 = erlang_term_coerce(v565)
                    let v567 = atom.create(v245)
                    let v568 = atom.create(v247)
                    let v569 = []
                    let v570 = [v564, ..v569]
                    let v571 = [v562, ..v570]
                    let v572 = [v566, ..v571]
                    let v573 = erlang_term_apply(v567, v568, v572)
                    let v574 = atom.create(v20)
                    let v575 = erlang_term_coerce(v574)
                    let v576 = v573 == v575
                    case v576 {
                        True -> Nil
                        False -> {
                            let v577 = atom.create(v413)
                            let v578 = erlang_term_coerce(v577)
                            let v579 = atom.create(v416)
                            let v580 = erlang_term_coerce(v579)
                            let v581 = atom.create(v245)
                            let v582 = atom.create(v247)
                            let v583 = []
                            let v584 = [v578, ..v583]
                            let v585 = [v562, ..v584]
                            let v586 = [v580, ..v585]
                            let v587 = erlang_term_apply(v581, v582, v586)
                            let v588 = string.inspect(v587)
                            let v589 = "xsim thread_run / evaluate status "
                            let v590 = v589 <> v588 
                            let v591 = v590 <> v229 
                            let v592 = erlang_term_coerce(v591)
                            let v593 = "standard_error"
                            let v594 = atom.create(v593)
                            let v595 = erlang_term_coerce(v594)
                            let v596 = "io"
                            let v597 = atom.create(v596)
                            let v598 = "put_chars"
                            let v599 = atom.create(v598)
                            let v600 = []
                            let v601 = [v592, ..v600]
                            let v602 = [v595, ..v601]
                            let _v603 = erlang_term_apply(v597, v599, v602)
                            Nil
                        }
                    }
                    let v604 = []
                    let v605 = erlang_term_coerce(v604)
                    let v606 = atom.create(v245)
                    let v607 = atom.create(v459)
                    let v608 = []
                    let v609 = [v605, ..v608]
                    let v610 = erlang_term_apply(v606, v607, v609)
                    let v611 = atom.create(v464)
                    let v612 = erlang_term_coerce(v611)
                    let v613 = atom.create(v245)
                    let v614 = atom.create(v247)
                    let v615 = []
                    let v616 = [v610, ..v615]
                    let v617 = [v562, ..v616]
                    let v618 = [v612, ..v617]
                    let v619 = erlang_term_apply(v613, v614, v618)
                    let v620 = erlang_term_coerce(v372)
                    let v621 = []
                    let v622 = erlang_term_coerce(v621)
                    let v623 = atom.create(v245)
                    let v624 = atom.create(v247)
                    let v625 = []
                    let v626 = [v622, ..v625]
                    let v627 = [v619, ..v626]
                    let v628 = [v620, ..v627]
                    let v629 = erlang_term_apply(v623, v624, v628)
                    let v630 = atom.create(v12)
                    let v631 = atom.create(v255)
                    let v632 = []
                    let v633 = [v629, ..v632]
                    let v634 = erlang_term_apply(v630, v631, v633)
                    let v635 = erlang_term_coerce(v634)
                    let v636 = 0
                    let v637 = method396(v635, v629, v636)
                    let v638 = Uh3Nil
                    let v639 = method431(v637, v638)
                    let v640 = erlang_term_coerce(v228)
                    let v641 = erlang_term_coerce(v123)
                    let v642 = atom.create(v232)
                    let v643 = atom.create(v234)
                    let v644 = []
                    let v645 = [v641, ..v644]
                    let v646 = [v640, ..v645]
                    let v647 = erlang_term_apply(v642, v643, v646)
                    let v648 = []
                    let v649 = erlang_term_coerce(v648)
                    let v650 = atom.create(v242)
                    let v651 = erlang_term_coerce(v650)
                    let v652 = atom.create(v245)
                    let v653 = atom.create(v247)
                    let v654 = []
                    let v655 = [v649, ..v654]
                    let v656 = [v647, ..v655]
                    let v657 = [v651, ..v656]
                    let v658 = erlang_term_apply(v652, v653, v657)
                    let v659 = atom.create(v12)
                    let v660 = atom.create(v255)
                    let v661 = []
                    let v662 = [v658, ..v661]
                    let v663 = erlang_term_apply(v659, v660, v662)
                    let v664 = erlang_term_coerce(v663)
                    let v665 = 0
                    let v666 = method396(v664, v658, v665)
                    let v667 = Uh29Nil
                    let v668 = method397(v666, v667)
                    let v669 = Uh3Nil
                    let v670 = method398(v668, v669)
                    let v671 = 0
                    let v672 = method20(v670, v671)
                    let v673 = 0
                    let v674 = method20(v639, v673)
                    let v675 = string.inspect(v672)
                    let v676 = " cells="
                    let v677 = v676 <> v675 
                    let v678 = " tests="
                    let v679 = v677 <> v678 
                    let v680 = string.inspect(v674)
                    let v681 = v679 <> v680 
                    let v682 = erlang_term_coerce(v158)
                    let v683 = atom.create(v151)
                    let v684 = "basename"
                    let v685 = atom.create(v684)
                    let v686 = []
                    let v687 = [v682, ..v686]
                    let v688 = erlang_term_apply(v683, v685, v687)
                    let v689 = erlang_term_coerce(v688)
                    let v690 = "XSIM thread_run file="
                    let v691 = v690 <> v689 
                    let v692 = v691 <> v681 
                    let v693 = " same_cells="
                    let v694 = v692 <> v693 
                    let v697 =
                        case v317 {
                            True -> {
                                let v695 = "true"
                                v695
                            }
                            False -> {
                                let v696 = "false"
                                v696
                            }
                        }
                    let v698 = v694 <> v697 
                    let v700 =
                        case v317 {
                            True -> {
                                let v699 = v428 == v576
                                v699
                            }
                            False -> False
                        }
                    let v704 =
                        case v700 {
                            True -> {
                                let v701 = delimited_21(v229, v493)
                                let v702 = delimited_21(v229, v639)
                                let v703 = v701 == v702
                                v703
                            }
                            False -> False
                        }
                    let v709 =
                        case v704 {
                            True -> {
                                case v493  {
                                    Uh3Cons(v705, v706) -> True
                                    Uh3Nil -> False
                                }
                            }
                            False -> False
                        }
                    let v710 = v709 && v428
                    let v712 =
                        case v576 {
                            True -> v20
                            False -> {
                                let v711 = "error"
                                v711
                            }
                        }
                    let v713 = " status="
                    let v714 = v713 <> v712 
                    let v715 = "/"
                    let v716 = v714 <> v715 
                    let v718 =
                        case v428 {
                            True -> v20
                            False -> {
                                let v717 = "error"
                                v717
                            }
                        }
                    let v719 = v716 <> v718 
                    let v720 = " result="
                    let v721 = v719 <> v720 
                    let v724 =
                        case v710 {
                            True -> {
                                let v722 = "pass"
                                v722
                            }
                            False -> {
                                let v723 = "fail"
                                v723
                            }
                        }
                    let v725 = v721 <> v724 
                    let v726 = v698 <> v725 
                    let v727 = paired_rows_433(v493, v639)
                    let v728 = Uh3Cons(v726, v727)
                    delimited_21(v229, v728)
                }
            }
        let v735 = "\n"
        let v736 = v734 <> v735 
        let v737 = erlang_term_coerce(v736)
        let v738 = "io"
        let v739 = atom.create(v738)
        let v740 = "put_chars"
        let v741 = atom.create(v740)
        let v742 = []
        let v743 = [v737, ..v742]
        let _v744 = erlang_term_apply(v739, v741, v743)
        let v745 = v734 == ""
        let v748 =
            case v745 {
                True -> Uh3Nil
                False -> split_list_2(v735, v734)
            }
        let v749 = method399()
        let v750 = method400(v749, v748)
        case v750 {
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

pub fn closure143(capt: #(String, Int, String)) -> fn(String) -> Us91 {
    fn (v3) {
        let #(v0, v1, v2) = capt
        let v4 = v2 == "spi"
        case v4 {
            True -> Us91Ok(v3, v1)
            False -> {
                let v6 = v2 == "cells"
                case v6 {
                    True -> {
                        let v7 = count_of_text_10(v3)
                        case v7  {
                            Us3None -> {
                                let v10 = "--cells takes a whole number, got '"
                                let v11 = v10 <> v3 
                                let v12 = "'"
                                let v13 = v11 <> v12 
                                Us91Error(v13)
                            }
                            Us3Some(v8) -> Us91Ok(v0, v8)
                        }
                    }
                    False -> {
                        let v17 = "unknown option --"
                        let v18 = v17 <> v2 
                        Us91Error(v18)
                    }
                }
            }
        }
    }
}

pub fn closure142(capt: #(String, Int)) -> fn(String) -> fn(String) -> Us91 {
    fn (v2) {
        let #(v0, v1) = capt
        closure143(#(v0, v1, v2))
    }
}
