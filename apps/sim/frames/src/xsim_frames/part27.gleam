import gleam/bit_array
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Uh36, type Uh37, type Us96, Uh13Nil, Uh29Cons, Uh29Nil, Uh36Cons, Uh36Nil, Uh37Cons, Uh37Nil, Uh3Cons, Uh3Nil, Us56Error, Us56Ok, Us80Error, Us80Ok, Us95Error, Us95Ok, Us96Error, Us96Ok}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_crypto_mac, spiral_fs_read_file, spiral_wrap_signed, split_list_2}
import xsim_frames/part10.{method258, method259}
import xsim_frames/part13.{items_from_301, method299, method300}
import xsim_frames/part18.{method370, method371}
import xsim_frames/part2.{delimited_21, method18, method20, taken_31}
import xsim_frames/part20.{method396, method400, method401, method402, method403}
import xsim_frames/part26.{closure137, closure139, flags_parsed_437, method441, method442}
import xsim_frames/part3.{method77}

pub fn closure136(capt: Nil) -> fn(String) -> Int {
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
        let v107 = closure137(Nil)
        let v108 = closure139(Nil)
        let v109 = ""
        let v110 = 5
        let v111 = flags_parsed_437(v107, v108, v109, v110, v106)
        let v118 =
            case v111  {
                Us95Ok(v112, v113) -> {
                    let v114 = v112 == ""
                    case v114 {
                        True -> {
                            let v115 = "missing --spi"
                            Us95Error(v115)
                        }
                        False -> v111
                    }
                }
                _ -> v111
            }
        let v520 =
            case v118  {
                Us95Error(v516) -> {
                    let v517 = "XSIM rejected diff: "
                    let v518 = v517 <> v516 
                    v518
                }
                Us95Ok(v119, v120) -> {
                    let v121 = spiral_fs_read_file(v119)
                    let v122 = method370()
                    let v123 = method371()
                    let v124 = case v121 { Ok(x) -> v122(x) Error(x) -> v123(x) }
                    let v137 =
                        case v124  {
                            Us80Error(v134) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us80Ok(v125) -> {
                                let v126 = bit_array.to_string(v125)
                                let v127 = method258()
                                let v128 = method259()
                                let v129 = case v126 { Ok(x) -> v127(x) Error(x) -> v128(x) }
                                case v129  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v130) -> v130
                                }
                            }
                        }
                    let v138 = erlang_term_coerce(v137)
                    let v139 = erlang_term_coerce(v109)
                    let v140 = "Elixir.Spiral.Cells.Document"
                    let v141 = atom.create(v140)
                    let v142 = "parse_spi"
                    let v143 = atom.create(v142)
                    let v144 = []
                    let v145 = [v139, ..v144]
                    let v146 = [v138, ..v145]
                    let v147 = erlang_term_apply(v141, v143, v146)
                    let v148 = []
                    let v149 = erlang_term_coerce(v148)
                    let v150 = "cells"
                    let v151 = atom.create(v150)
                    let v152 = erlang_term_coerce(v151)
                    let v153 = erlang_term_coerce(v152)
                    let v154 = erlang_term_coerce(v149)
                    let v155 = "maps"
                    let v156 = atom.create(v155)
                    let v157 = "get"
                    let v158 = atom.create(v157)
                    let v159 = []
                    let v160 = [v154, ..v159]
                    let v161 = [v147, ..v160]
                    let v162 = [v153, ..v161]
                    let v163 = erlang_term_apply(v156, v158, v162)
                    let v164 = erlang_term_coerce(v163)
                    let v165 = atom.create(v91)
                    let v166 = atom.create(v93)
                    let v167 = []
                    let v168 = [v164, ..v167]
                    let v169 = erlang_term_apply(v165, v166, v168)
                    let v170 = Uh29Nil
                    let v171 = items_from_301(v169, v170)
                    let v172 = Uh29Nil
                    let v173 = method400(v171, v172)
                    let v174 = Uh3Nil
                    let v175 = method401(v173, v174)
                    let v176 = v120 < 0
                    let v178 =
                        case v176 {
                            True -> v175
                            False -> taken_31(v120, v175)
                        }
                    let v179 = erlang_term_coerce(v119)
                    let v180 = "filename"
                    let v181 = atom.create(v180)
                    let v182 = "absname"
                    let v183 = atom.create(v182)
                    let v184 = []
                    let v185 = [v179, ..v184]
                    let v186 = erlang_term_apply(v181, v183, v185)
                    let v187 = "unicode"
                    let v188 = atom.create(v187)
                    let v189 = "characters_to_binary"
                    let v190 = atom.create(v189)
                    let v191 = []
                    let v192 = [v186, ..v191]
                    let v193 = erlang_term_apply(v188, v190, v192)
                    let v194 = erlang_term_coerce(v193)
                    let v195 = erlang_term_coerce(v194)
                    let v196 = atom.create(v180)
                    let v197 = "dirname"
                    let v198 = atom.create(v197)
                    let v199 = []
                    let v200 = [v195, ..v199]
                    let v201 = erlang_term_apply(v196, v198, v200)
                    let v202 = atom.create(v187)
                    let v203 = atom.create(v189)
                    let v204 = []
                    let v205 = [v201, ..v204]
                    let v206 = erlang_term_apply(v202, v203, v205)
                    let v207 = erlang_term_coerce(v206)
                    let v208 = Uh29Nil
                    let v209 = method299(v178, v208)
                    let v210 = []
                    let v211 = method300(v209, v210)
                    let v212 = erlang_term_coerce(v211)
                    let v213 = atom.create(v150)
                    let v214 = erlang_term_coerce(v213)
                    let v215 = erlang_term_coerce(v214)
                    let v216 = erlang_term_coerce(v212)
                    let v217 = []
                    let v218 = [v216, ..v217]
                    let v219 = [v215, ..v218]
                    let v220 = erlang_term_tuple(v219)
                    let v221 = []
                    let v222 = [v220, ..v221]
                    let v223 = erlang_term_coerce(v222)
                    let v224 = atom.create(v155)
                    let v225 = "from_list"
                    let v226 = atom.create(v225)
                    let v227 = []
                    let v228 = [v223, ..v227]
                    let v229 = erlang_term_apply(v224, v226, v228)
                    let v230 = erlang_term_coerce(v207)
                    let v231 = "root"
                    let v232 = atom.create(v231)
                    let v233 = erlang_term_coerce(v232)
                    let v234 = []
                    let v235 = [v230, ..v234]
                    let v236 = [v233, ..v235]
                    let v237 = erlang_term_tuple(v236)
                    let v238 = "spiral_lib"
                    let v239 = atom.create(v238)
                    let v240 = erlang_term_coerce(v239)
                    let v241 = []
                    let v242 = [v230, ..v241]
                    let v243 = [v240, ..v242]
                    let v244 = erlang_term_tuple(v243)
                    let v245 = []
                    let v246 = [v244, ..v245]
                    let v247 = [v237, ..v246]
                    let v248 = erlang_term_coerce(v247)
                    let v249 = "Elixir.Spiral.Cells.Notebook"
                    let v250 = atom.create(v249)
                    let v251 = "evaluate"
                    let v252 = atom.create(v251)
                    let v253 = []
                    let v254 = [v248, ..v253]
                    let v255 = [v229, ..v254]
                    let v256 = erlang_term_apply(v250, v252, v255)
                    let v257 = erlang_term_coerce(v119)
                    let v258 = atom.create(v180)
                    let v259 = atom.create(v182)
                    let v260 = []
                    let v261 = [v257, ..v260]
                    let v262 = erlang_term_apply(v258, v259, v261)
                    let v263 = atom.create(v187)
                    let v264 = atom.create(v189)
                    let v265 = []
                    let v266 = [v262, ..v265]
                    let v267 = erlang_term_apply(v263, v264, v266)
                    let v268 = erlang_term_coerce(v267)
                    let v269 = erlang_term_coerce(v268)
                    let v270 = atom.create(v180)
                    let v271 = atom.create(v197)
                    let v272 = []
                    let v273 = [v269, ..v272]
                    let v274 = erlang_term_apply(v270, v271, v273)
                    let v275 = atom.create(v187)
                    let v276 = atom.create(v189)
                    let v277 = []
                    let v278 = [v274, ..v277]
                    let v279 = erlang_term_apply(v275, v276, v278)
                    let v280 = erlang_term_coerce(v279)
                    let v281 = Uh29Nil
                    let v282 = method299(v178, v281)
                    let v283 = []
                    let v284 = method300(v282, v283)
                    let v285 = erlang_term_coerce(v284)
                    let v286 = atom.create(v150)
                    let v287 = erlang_term_coerce(v286)
                    let v288 = erlang_term_coerce(v287)
                    let v289 = erlang_term_coerce(v285)
                    let v290 = []
                    let v291 = [v289, ..v290]
                    let v292 = [v288, ..v291]
                    let v293 = erlang_term_tuple(v292)
                    let v294 = []
                    let v295 = [v293, ..v294]
                    let v296 = erlang_term_coerce(v295)
                    let v297 = atom.create(v155)
                    let v298 = atom.create(v225)
                    let v299 = []
                    let v300 = [v296, ..v299]
                    let v301 = erlang_term_apply(v297, v298, v300)
                    let v302 = erlang_term_coerce(v280)
                    let v303 = atom.create(v231)
                    let v304 = erlang_term_coerce(v303)
                    let v305 = []
                    let v306 = [v302, ..v305]
                    let v307 = [v304, ..v306]
                    let v308 = erlang_term_tuple(v307)
                    let v309 = atom.create(v238)
                    let v310 = erlang_term_coerce(v309)
                    let v311 = []
                    let v312 = [v302, ..v311]
                    let v313 = [v310, ..v312]
                    let v314 = erlang_term_tuple(v313)
                    let v315 = []
                    let v316 = [v314, ..v315]
                    let v317 = [v308, ..v316]
                    let v318 = erlang_term_coerce(v317)
                    let v319 = atom.create(v249)
                    let v320 = atom.create(v251)
                    let v321 = []
                    let v322 = [v318, ..v321]
                    let v323 = [v301, ..v322]
                    let v324 = erlang_term_apply(v319, v320, v323)
                    let v325 = 0
                    let v326 = method20(v178, v325)
                    let v327 = "\n"
                    let v328 = spiral_wrap_signed(v326 - 1, 32)
                    let v329 = "nil"
                    let v330 = atom.create(v329)
                    let v331 = erlang_term_coerce(v330)
                    let v332 = "status"
                    let v333 = atom.create(v332)
                    let v334 = erlang_term_coerce(v333)
                    let v335 = erlang_term_coerce(v334)
                    let v336 = erlang_term_coerce(v331)
                    let v337 = atom.create(v155)
                    let v338 = atom.create(v157)
                    let v339 = []
                    let v340 = [v336, ..v339]
                    let v341 = [v256, ..v340]
                    let v342 = [v335, ..v341]
                    let v343 = erlang_term_apply(v337, v338, v342)
                    let v344 = erlang_term_coerce(v343)
                    let v345 = []
                    let v346 = erlang_term_coerce(v345)
                    let v347 = "Elixir.Kernel"
                    let v348 = atom.create(v347)
                    let v349 = "inspect"
                    let v350 = atom.create(v349)
                    let v351 = []
                    let v352 = [v346, ..v351]
                    let v353 = [v344, ..v352]
                    let v354 = erlang_term_apply(v348, v350, v353)
                    let v355 = erlang_term_coerce(v354)
                    let v356 = "XDIFF status a="
                    let v357 = v356 <> v355 
                    let v358 = " b="
                    let v359 = v357 <> v358 
                    let v360 = atom.create(v329)
                    let v361 = erlang_term_coerce(v360)
                    let v362 = atom.create(v332)
                    let v363 = erlang_term_coerce(v362)
                    let v364 = erlang_term_coerce(v363)
                    let v365 = erlang_term_coerce(v361)
                    let v366 = atom.create(v155)
                    let v367 = atom.create(v157)
                    let v368 = []
                    let v369 = [v365, ..v368]
                    let v370 = [v324, ..v369]
                    let v371 = [v364, ..v370]
                    let v372 = erlang_term_apply(v366, v367, v371)
                    let v373 = erlang_term_coerce(v372)
                    let v374 = []
                    let v375 = erlang_term_coerce(v374)
                    let v376 = atom.create(v347)
                    let v377 = atom.create(v349)
                    let v378 = []
                    let v379 = [v375, ..v378]
                    let v380 = [v373, ..v379]
                    let v381 = erlang_term_apply(v376, v377, v380)
                    let v382 = erlang_term_coerce(v381)
                    let v383 = v359 <> v382 
                    let v384 = " verdict a="
                    let v385 = v383 <> v384 
                    let v386 = []
                    let v387 = erlang_term_coerce(v386)
                    let v388 = atom.create(v155)
                    let v389 = atom.create(v225)
                    let v390 = []
                    let v391 = [v387, ..v390]
                    let v392 = erlang_term_apply(v388, v389, v391)
                    let v393 = "verdicts"
                    let v394 = atom.create(v393)
                    let v395 = erlang_term_coerce(v394)
                    let v396 = erlang_term_coerce(v395)
                    let v397 = erlang_term_coerce(v392)
                    let v398 = atom.create(v155)
                    let v399 = atom.create(v157)
                    let v400 = []
                    let v401 = [v397, ..v400]
                    let v402 = [v256, ..v401]
                    let v403 = [v396, ..v402]
                    let v404 = erlang_term_apply(v398, v399, v403)
                    let v405 = erlang_term_coerce(v404)
                    let v406 = atom.create(v329)
                    let v407 = erlang_term_coerce(v406)
                    let v408 = erlang_term_coerce(v328)
                    let v409 = erlang_term_coerce(v407)
                    let v410 = atom.create(v155)
                    let v411 = atom.create(v157)
                    let v412 = []
                    let v413 = [v409, ..v412]
                    let v414 = [v405, ..v413]
                    let v415 = [v408, ..v414]
                    let v416 = erlang_term_apply(v410, v411, v415)
                    let v417 = erlang_term_coerce(v416)
                    let v418 = []
                    let v419 = erlang_term_coerce(v418)
                    let v420 = atom.create(v347)
                    let v421 = atom.create(v349)
                    let v422 = []
                    let v423 = [v419, ..v422]
                    let v424 = [v417, ..v423]
                    let v425 = erlang_term_apply(v420, v421, v424)
                    let v426 = erlang_term_coerce(v425)
                    let v427 = v385 <> v426 
                    let v428 = v427 <> v358 
                    let v429 = []
                    let v430 = erlang_term_coerce(v429)
                    let v431 = atom.create(v155)
                    let v432 = atom.create(v225)
                    let v433 = []
                    let v434 = [v430, ..v433]
                    let v435 = erlang_term_apply(v431, v432, v434)
                    let v436 = atom.create(v393)
                    let v437 = erlang_term_coerce(v436)
                    let v438 = erlang_term_coerce(v437)
                    let v439 = erlang_term_coerce(v435)
                    let v440 = atom.create(v155)
                    let v441 = atom.create(v157)
                    let v442 = []
                    let v443 = [v439, ..v442]
                    let v444 = [v324, ..v443]
                    let v445 = [v438, ..v444]
                    let v446 = erlang_term_apply(v440, v441, v445)
                    let v447 = erlang_term_coerce(v446)
                    let v448 = atom.create(v329)
                    let v449 = erlang_term_coerce(v448)
                    let v450 = erlang_term_coerce(v328)
                    let v451 = erlang_term_coerce(v449)
                    let v452 = atom.create(v155)
                    let v453 = atom.create(v157)
                    let v454 = []
                    let v455 = [v451, ..v454]
                    let v456 = [v447, ..v455]
                    let v457 = [v450, ..v456]
                    let v458 = erlang_term_apply(v452, v453, v457)
                    let v459 = erlang_term_coerce(v458)
                    let v460 = []
                    let v461 = erlang_term_coerce(v460)
                    let v462 = atom.create(v347)
                    let v463 = atom.create(v349)
                    let v464 = []
                    let v465 = [v461, ..v464]
                    let v466 = [v459, ..v465]
                    let v467 = erlang_term_apply(v462, v463, v466)
                    let v468 = erlang_term_coerce(v467)
                    let v469 = v428 <> v468 
                    let v470 = 0
                    let v471 = method77(v326, v470)
                    let v472 = Uh13Nil
                    let v473 = method441(v256, v324, v471, v472)
                    let v474 = Uh3Nil
                    let v475 = method442(v256, v324, v473, v474)
                    let v476 = atom.create(v329)
                    let v477 = erlang_term_coerce(v476)
                    let v478 = "outputs"
                    let v479 = atom.create(v478)
                    let v480 = erlang_term_coerce(v479)
                    let v481 = erlang_term_coerce(v480)
                    let v482 = erlang_term_coerce(v477)
                    let v483 = atom.create(v155)
                    let v484 = atom.create(v157)
                    let v485 = []
                    let v486 = [v482, ..v485]
                    let v487 = [v256, ..v486]
                    let v488 = [v481, ..v487]
                    let v489 = erlang_term_apply(v483, v484, v488)
                    let v490 = erlang_term_coerce(v489)
                    let v491 = atom.create(v329)
                    let v492 = erlang_term_coerce(v491)
                    let v493 = atom.create(v478)
                    let v494 = erlang_term_coerce(v493)
                    let v495 = erlang_term_coerce(v494)
                    let v496 = erlang_term_coerce(v492)
                    let v497 = atom.create(v155)
                    let v498 = atom.create(v157)
                    let v499 = []
                    let v500 = [v496, ..v499]
                    let v501 = [v324, ..v500]
                    let v502 = [v495, ..v501]
                    let v503 = erlang_term_apply(v497, v498, v502)
                    let v504 = erlang_term_coerce(v503)
                    let v505 = v490 == v504
                    let v508 =
                        case v505 {
                            True -> {
                                let v506 = "true"
                                v506
                            }
                            False -> {
                                let v507 = "false"
                                v507
                            }
                        }
                    let v509 = "XDIFF done identical="
                    let v510 = v509 <> v508 
                    let v511 = Uh3Nil
                    let v512 = Uh3Cons(v510, v511)
                    let v513 = method18(v475, v512)
                    let v514 = Uh3Cons(v469, v513)
                    delimited_21(v327, v514)
                }
            }
        let v521 = "\n"
        let v522 = v520 <> v521 
        let v523 = erlang_term_coerce(v522)
        let v524 = "io"
        let v525 = atom.create(v524)
        let v526 = "put_chars"
        let v527 = atom.create(v526)
        let v528 = []
        let v529 = [v523, ..v528]
        let _v530 = erlang_term_apply(v525, v527, v529)
        let v531 = v520 == ""
        let v534 =
            case v531 {
                True -> Uh3Nil
                False -> split_list_2(v521, v520)
            }
        let v535 = method402()
        let v536 = method403(v535, v534)
        case v536 {
            True -> 1
            False -> 0
        }
    }
}

pub fn method446(v0: Uh36, v1: Uh29) -> Uh29 {
    case v0  {
        Uh36Cons(v2, v3, v4) -> {
            let v5 = method446(v4, v1)
            let v6 = erlang_term_coerce(v2)
            let v7 = ""
            let v8 = erlang_term_coerce(v7)
            let v9 = "unicode"
            let v10 = atom.create(v9)
            let v11 = "characters_to_list"
            let v12 = atom.create(v11)
            let v13 = []
            let v14 = [v8, ..v13]
            let v15 = erlang_term_apply(v10, v12, v14)
            let v16 = "uri_string"
            let v17 = atom.create(v16)
            let v18 = "quote"
            let v19 = atom.create(v18)
            let v20 = []
            let v21 = [v15, ..v20]
            let v22 = [v6, ..v21]
            let v23 = erlang_term_apply(v17, v19, v22)
            let v24 = erlang_term_coerce(v23)
            let v25 = erlang_term_coerce(v24)
            let v26 = erlang_term_coerce(v3)
            let v27 = erlang_term_coerce(v7)
            let v28 = atom.create(v9)
            let v29 = atom.create(v11)
            let v30 = []
            let v31 = [v27, ..v30]
            let v32 = erlang_term_apply(v28, v29, v31)
            let v33 = atom.create(v16)
            let v34 = atom.create(v18)
            let v35 = []
            let v36 = [v32, ..v35]
            let v37 = [v26, ..v36]
            let v38 = erlang_term_apply(v33, v34, v37)
            let v39 = erlang_term_coerce(v38)
            let v40 = erlang_term_coerce(v39)
            let v41 = []
            let v42 = [v40, ..v41]
            let v43 = [v25, ..v42]
            let v44 = erlang_term_tuple(v43)
            Uh29Cons(v44, v5)
        }
        Uh36Nil -> v1
    }
}

pub fn method447(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method447(v3, v1)
            let v5 = erlang_term_coerce(1)
            let v6 = "erlang"
            let v7 = atom.create(v6)
            let v8 = "element"
            let v9 = atom.create(v8)
            let v10 = []
            let v11 = [v2, ..v10]
            let v12 = [v5, ..v11]
            let v13 = erlang_term_apply(v7, v9, v12)
            let v14 = erlang_term_coerce(v13)
            let v15 = "="
            let v16 = v14 <> v15 
            let v17 = erlang_term_coerce(2)
            let v18 = atom.create(v6)
            let v19 = atom.create(v8)
            let v20 = []
            let v21 = [v2, ..v20]
            let v22 = [v17, ..v21]
            let v23 = erlang_term_apply(v18, v19, v22)
            let v24 = erlang_term_coerce(v23)
            let v25 = v16 <> v24 
            Uh3Cons(v25, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn signed_params_445(v0: Uh36) -> String {
    let v1 = Uh29Nil
    let v2 = method446(v0, v1)
    let v3 = []
    let v4 = method300(v2, v3)
    let v5 = erlang_term_coerce(v4)
    let v6 = "lists"
    let v7 = atom.create(v6)
    let v8 = "sort"
    let v9 = atom.create(v8)
    let v10 = []
    let v11 = [v5, ..v10]
    let v12 = erlang_term_apply(v7, v9, v11)
    let v13 = atom.create(v6)
    let v14 = "reverse"
    let v15 = atom.create(v14)
    let v16 = []
    let v17 = [v12, ..v16]
    let v18 = erlang_term_apply(v13, v15, v17)
    let v19 = Uh29Nil
    let v20 = items_from_301(v18, v19)
    let v21 = Uh3Nil
    let v22 = method447(v20, v21)
    let v23 = "&"
    delimited_21(v23, v22)
}

pub fn oauth1_signature_444(v0: String, v1: String, v2: Uh36, v3: String, v4: String) -> String {
    let v5 = "&"
    let v6 = v0 <> v5 
    let v7 = erlang_term_coerce(v1)
    let v8 = ""
    let v9 = erlang_term_coerce(v8)
    let v10 = "unicode"
    let v11 = atom.create(v10)
    let v12 = "characters_to_list"
    let v13 = atom.create(v12)
    let v14 = []
    let v15 = [v9, ..v14]
    let v16 = erlang_term_apply(v11, v13, v15)
    let v17 = "uri_string"
    let v18 = atom.create(v17)
    let v19 = "quote"
    let v20 = atom.create(v19)
    let v21 = []
    let v22 = [v16, ..v21]
    let v23 = [v7, ..v22]
    let v24 = erlang_term_apply(v18, v20, v23)
    let v25 = erlang_term_coerce(v24)
    let v26 = v6 <> v25 
    let v27 = v26 <> v5 
    let v28 = signed_params_445(v2)
    let v29 = erlang_term_coerce(v28)
    let v30 = erlang_term_coerce(v8)
    let v31 = atom.create(v10)
    let v32 = atom.create(v12)
    let v33 = []
    let v34 = [v30, ..v33]
    let v35 = erlang_term_apply(v31, v32, v34)
    let v36 = atom.create(v17)
    let v37 = atom.create(v19)
    let v38 = []
    let v39 = [v35, ..v38]
    let v40 = [v29, ..v39]
    let v41 = erlang_term_apply(v36, v37, v40)
    let v42 = erlang_term_coerce(v41)
    let v43 = v27 <> v42 
    let v44 = erlang_term_coerce(v3)
    let v45 = erlang_term_coerce(v8)
    let v46 = atom.create(v10)
    let v47 = atom.create(v12)
    let v48 = []
    let v49 = [v45, ..v48]
    let v50 = erlang_term_apply(v46, v47, v49)
    let v51 = atom.create(v17)
    let v52 = atom.create(v19)
    let v53 = []
    let v54 = [v50, ..v53]
    let v55 = [v44, ..v54]
    let v56 = erlang_term_apply(v51, v52, v55)
    let v57 = erlang_term_coerce(v56)
    let v58 = v57 <> v5 
    let v59 = erlang_term_coerce(v4)
    let v60 = erlang_term_coerce(v8)
    let v61 = atom.create(v10)
    let v62 = atom.create(v12)
    let v63 = []
    let v64 = [v60, ..v63]
    let v65 = erlang_term_apply(v61, v62, v64)
    let v66 = atom.create(v17)
    let v67 = atom.create(v19)
    let v68 = []
    let v69 = [v65, ..v68]
    let v70 = [v59, ..v69]
    let v71 = erlang_term_apply(v66, v67, v70)
    let v72 = erlang_term_coerce(v71)
    let v73 = v58 <> v72 
    let v74 = bit_array.base64_encode(spiral_crypto_mac(atom.create("hmac"), atom.create("sha"), v73, v43), True)
    v74
}

pub fn method451(v0: String, v1: Uh29, v2: Uh37) -> Uh37 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method451(v0, v4, v2)
            let v6 = erlang_term_coerce(v0)
            let v7 = "filename"
            let v8 = atom.create(v7)
            let v9 = "dirname"
            let v10 = atom.create(v9)
            let v11 = []
            let v12 = [v6, ..v11]
            let v13 = erlang_term_apply(v8, v10, v12)
            let v14 = "unicode"
            let v15 = atom.create(v14)
            let v16 = "characters_to_binary"
            let v17 = atom.create(v16)
            let v18 = []
            let v19 = [v13, ..v18]
            let v20 = erlang_term_apply(v15, v17, v19)
            let v21 = erlang_term_coerce(v20)
            let v22 = "/"
            let v23 = v21 <> v22 
            let v24 = erlang_term_coerce(v3)
            let v25 = v23 <> v24 
            let v26 = spiral_fs_read_file(v25)
            let v27 = method370()
            let v28 = method371()
            let v29 = case v26 { Ok(x) -> v27(x) Error(x) -> v28(x) }
            let v42 =
                case v29  {
                    Us80Error(v39) -> panic as "file_system.read_all_text: file:read_file failed"
                    Us80Ok(v30) -> {
                        let v31 = bit_array.to_string(v30)
                        let v32 = method258()
                        let v33 = method259()
                        let v34 = case v31 { Ok(x) -> v32(x) Error(x) -> v33(x) }
                        case v34  {
                            Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                            Us56Ok(v35) -> v35
                        }
                    }
                }
            let v43 = erlang_term_coerce(v42)
            let v44 = "json"
            let v45 = atom.create(v44)
            let v46 = "decode"
            let v47 = atom.create(v46)
            let v48 = []
            let v49 = [v43, ..v48]
            let v50 = erlang_term_apply(v45, v47, v49)
            let v51 = []
            let v52 = erlang_term_coerce(v51)
            let v53 = "users"
            let v54 = erlang_term_coerce(v53)
            let v55 = erlang_term_coerce(v52)
            let v56 = "maps"
            let v57 = atom.create(v56)
            let v58 = "get"
            let v59 = atom.create(v58)
            let v60 = []
            let v61 = [v55, ..v60]
            let v62 = [v50, ..v61]
            let v63 = [v54, ..v62]
            let v64 = erlang_term_apply(v57, v59, v63)
            let v65 = erlang_term_coerce(v64)
            let v66 = "lists"
            let v67 = atom.create(v66)
            let v68 = "reverse"
            let v69 = atom.create(v68)
            let v70 = []
            let v71 = [v65, ..v70]
            let v72 = erlang_term_apply(v67, v69, v71)
            let v73 = Uh29Nil
            let v74 = items_from_301(v72, v73)
            Uh37Cons(v74, v5)
        }
        Uh29Nil -> v2
    }
}

pub fn method453(v0: Uh29, v1: Uh29) -> Uh29 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method453(v3, v1)
            Uh29Cons(v2, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method452(v0: Uh37, v1: Uh29) -> Uh29 {
    case v0  {
        Uh37Cons(v2, v3) -> {
            let v4 = method452(v3, v1)
            method453(v2, v4)
        }
        Uh37Nil -> v1
    }
}

pub fn included_users_450(v0: String, v1: Dynamic) -> Uh29 {
    let v2 = []
    let v3 = erlang_term_coerce(v2)
    let v4 = "include"
    let v5 = erlang_term_coerce(v4)
    let v6 = erlang_term_coerce(v3)
    let v7 = "maps"
    let v8 = atom.create(v7)
    let v9 = "get"
    let v10 = atom.create(v9)
    let v11 = []
    let v12 = [v6, ..v11]
    let v13 = [v1, ..v12]
    let v14 = [v5, ..v13]
    let v15 = erlang_term_apply(v8, v10, v14)
    let v16 = erlang_term_coerce(v15)
    let v17 = "lists"
    let v18 = atom.create(v17)
    let v19 = "reverse"
    let v20 = atom.create(v19)
    let v21 = []
    let v22 = [v16, ..v21]
    let v23 = erlang_term_apply(v18, v20, v22)
    let v24 = Uh29Nil
    let v25 = items_from_301(v23, v24)
    let v26 = Uh37Nil
    let v27 = method451(v0, v25, v26)
    let v28 = []
    let v29 = erlang_term_coerce(v28)
    let v30 = "users"
    let v31 = erlang_term_coerce(v30)
    let v32 = erlang_term_coerce(v29)
    let v33 = atom.create(v7)
    let v34 = atom.create(v9)
    let v35 = []
    let v36 = [v32, ..v35]
    let v37 = [v1, ..v36]
    let v38 = [v31, ..v37]
    let v39 = erlang_term_apply(v33, v34, v38)
    let v40 = erlang_term_coerce(v39)
    let v41 = atom.create(v17)
    let v42 = atom.create(v19)
    let v43 = []
    let v44 = [v40, ..v43]
    let v45 = erlang_term_apply(v41, v42, v44)
    let v46 = Uh29Nil
    let v47 = items_from_301(v45, v46)
    let v48 = Uh29Nil
    let v49 = method452(v27, v48)
    method453(v47, v49)
}

pub fn ok_c143(capt: Nil) -> fn(Dynamic) -> Us96 {
    fn (v0) {
        Us96Ok(v0)
    }
}

pub fn method455() -> fn(Dynamic) -> Us96 {
    ok_c143(Nil)
}

pub fn error_c144(capt: Nil) -> fn(Nil) -> Us96 {
    fn (dom) {
        Us96Error
    }
}

pub fn method456() -> fn(Nil) -> Us96 {
    error_c144(Nil)
}
