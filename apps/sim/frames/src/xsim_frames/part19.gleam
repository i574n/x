import gleam/bit_array
import gleam/dict
import gleam/erlang/atom
import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Us2, type Uh9, type Uh10, type Uh15, type Us29, type Us30, type Us45, type Uh28, type Uh32, type Uh34, type Uh35, Uh0Nil, Uh1Nil, Uh2Nil, Uh32Cons, Uh32Nil, Uh33Nil, Uh34Cons, Uh35Cons, Uh3Cons, Uh3Nil, Uh6Cons, Uh6Nil, Us12Broken, Us12Held, Us13BreakingEditsFail, Us13NoStaleResults, Us13OneCompilePerPrefix, Us13SequentialEquivalence, Us13UnwantedResultsFreed, Us13WithdrawnDemandHidden, Us21Error, Us21Ok, Us2Some, Us30NoEviction, Us45Crashed, Us45Done, Us45Erred, Us56Error, Us56Ok, Us76Error, Us76Ok, Us77Error, Us77Ok, Us78None, Us78Some}
import xsim_frames/part1.{dictm_term_sorted, method4, spiral_fs_coerce, spiral_fs_read_file, spiral_fs_write_file, spiral_wrap_signed}
import xsim_frames/part10.{method259, method260}
import xsim_frames/part12.{chain_sources_284}
import xsim_frames/part13.{method296}
import xsim_frames/part17.{method366, method367, method368, method369, method370, method371, method372, method374, method375, method376, method377}
import xsim_frames/part18.{method378, method380, method381, method382, method383, method384}
import xsim_frames/part2.{delimited_21, method20, method30, method32, method33, method36, method37, method40, taken_31}
import xsim_frames/part3.{method43, method79}
import xsim_frames/part4.{method96}
import xsim_frames/part5.{stream_115}
import xsim_frames/part6.{decoded_stream_123, deliveries_130}

pub fn outcomes_from_365(v0: fn(Uh3) -> #(Us45, String), v1: fn(Uh3) -> #(Us45, String), v2: Bool, v3: fn(Int) -> Uh3, v4: fn(Nil) -> Int, v5: fn(Nil) -> Int, v6: fn(Int) -> fn(fn(Uh3) -> #(Us45, String)) -> fn(#(Bool, Bool, Us30, Bool, Int)) -> fn(Uh15) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, Int), v7: Uh3, v8: String, v9: Int, v10: Int, v11: Int, v12: String, v13: Bool, v14: Int, v15: Int, v16: Int, v17: Int, v18: Int, v19: String, v20: String, v21: Us29, v22: Int, v23: Us30, v24: Int, v25: Bool, v26: Bool, v27: Uh9, v28: Uh10, v29: Uh3, v30: Uh10, v31: Int, v32: Uh32) -> Uh32 {
    let v33 = v31 > v17
    case v33 {
        True -> {
            let v34 = Uh32Nil
            method366(v32, v34)
        }
        False -> {
            let v36 = spiral_wrap_signed(v31 + 1, 32)
            let v37 = v19 != ""
            let v68 =
                case v37 {
                    True -> {
                        let v38 = spiral_fs_read_file(v19)
                        let v39 = method367()
                        let v40 = method368()
                        let v41 = case v38 { Ok(x) -> v39(x) Error(x) -> v40(x) }
                        let v54 =
                            case v41  {
                                Us76Error(v51) -> panic as "file_system.read_all_text: file:read_file failed"
                                Us76Ok(v42) -> {
                                    let v43 = bit_array.to_string(v42)
                                    let v44 = method259()
                                    let v45 = method260()
                                    let v46 = case v43 { Ok(x) -> v44(x) Error(x) -> v45(x) }
                                    case v46  {
                                        Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                        Us56Ok(v47) -> v47
                                    }
                                }
                            }
                        let v55 = decoded_stream_123(v54)
                        case v55  {
                            Us21Error(v57) -> {
                                let v58 = "xsim: --replay "
                                let v59 = v58 <> v19 
                                let v60 = ": "
                                let v61 = v59 <> v60 
                                let v62 = v61 <> v57 
                                panic as v62
                            }
                            Us21Ok(v56) -> v56
                        }
                    }
                    False -> {
                        let v66 = 6
                        deliveries_130(v30, v31, v18, v66)
                    }
                }
            let v69 = v20 != ""
            case v69 {
                True -> {
                    let v70 = string.inspect(v31)
                    let v71 = "{schedule}"
                    let v72 = v20 |> string.replace(v71, v70)
                    let v73 = stream_115(v68)
                    let v74 = spiral_fs_write_file(v72, v73)
                    let v75 = spiral_fs_coerce(v74)
                    let v76 = "ok"
                    let v77 = atom.create(v76)
                    let v78 = v75 == v77
                    let v79 = v78 == False
                    case v79 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                }
                False -> Nil
            }
            let v80 = v4(Nil)
            let v81 = v5(Nil)
            let v82 = v6(v24)
            let v83 = v82(v0)
            let v84 = v83(#(True, False, v23, False, v22))
            let #(v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, v121) = v84(v68)
            let v122 = v5(Nil)
            let v123 = spiral_wrap_signed(v122 - v81, 32)
            let v124 = v121 > v80
            let v125 =
                case v124 {
                    True -> v121
                    False -> v80
                }
            let v126 = v4(Nil)
            let v127 = v126 > v125
            let v128 =
                case v127 {
                    True -> v126
                    False -> v125
                }
            let v129 = 0
            let v130 = method79(v27, v129)
            let v131 = 0
            let v132 = method96(v30, v131)
            let v133 = 0
            let v134 = method369(v68, v133)
            let v135 = dict.keys(v114)
            let v136 = dictm_term_sorted(v135)
            let v137 = Uh3Nil
            let listm_fold = v136 |> list.fold (v137, fn (acc, x) {
            let v138 = x
            let v139 = acc
            let v140 = Uh3Cons(v138, v139)
            v140
            })
            let v141 = listm_fold
            let v142 = Uh3Nil
            let v143 = method4(v141, v142)
            let v144 = Uh0Nil
            let v145 = method370(v114, v143, v144)
            let v146 = dict.new()
            let v147 = dict.keys(v91)
            let v148 = dictm_term_sorted(v147)
            let v149 = Uh3Nil
            let listm_fold = v148 |> list.fold (v149, fn (acc, x) {
            let v150 = x
            let v151 = acc
            let v152 = Uh3Cons(v150, v151)
            v152
            })
            let v153 = listm_fold
            let v154 = Uh3Nil
            let v155 = method4(v153, v154)
            let v156 = method296(v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v91, v155, v146)
            let v157 = dict.keys(v156)
            let v158 = dictm_term_sorted(v157)
            let v159 = Uh3Nil
            let listm_fold = v158 |> list.fold (v159, fn (acc, x) {
            let v160 = x
            let v161 = acc
            let v162 = Uh3Cons(v160, v161)
            v162
            })
            let v163 = listm_fold
            let v164 = Uh3Nil
            let v165 = method4(v163, v164)
            let v166 = Uh1Nil
            let v167 = method374(v156, v165, v166)
            let v168 = dict.keys(v106)
            let v169 = dictm_term_sorted(v168)
            let v170 = Uh3Nil
            let listm_fold = v169 |> list.fold (v170, fn (acc, x) {
            let v171 = x
            let v172 = acc
            let v173 = Uh3Cons(v171, v172)
            v173
            })
            let v174 = listm_fold
            let v175 = Uh3Nil
            let v176 = method4(v174, v175)
            let v177 = Uh2Nil
            let v178 = method375(v106, v176, v177)
            let v179 = dict.keys(v107)
            let v180 = dictm_term_sorted(v179)
            let v181 = Uh3Nil
            let listm_fold = v180 |> list.fold (v181, fn (acc, x) {
            let v182 = x
            let v183 = acc
            let v184 = Uh3Cons(v182, v183)
            v184
            })
            let v185 = listm_fold
            let v186 = Uh3Nil
            let v187 = method4(v185, v186)
            let v188 = Uh2Nil
            let v189 = method375(v107, v187, v188)
            let v190 = dict.keys(v108)
            let v191 = dictm_term_sorted(v190)
            let v192 = Uh3Nil
            let listm_fold = v191 |> list.fold (v192, fn (acc, x) {
            let v193 = x
            let v194 = acc
            let v195 = Uh3Cons(v193, v194)
            v195
            })
            let v196 = listm_fold
            let v197 = Uh3Nil
            let v198 = method4(v196, v197)
            let v199 = Uh2Nil
            let v200 = method375(v108, v198, v199)
            let v201 = dict.keys(v100)
            let v202 = dictm_term_sorted(v201)
            let v203 = Uh3Nil
            let listm_fold = v202 |> list.fold (v203, fn (acc, x) {
            let v204 = x
            let v205 = acc
            let v206 = Uh3Cons(v204, v205)
            v206
            })
            let v207 = listm_fold
            let v208 =
                case v117  {
                    Us30NoEviction -> False
                    _ -> True
                }
            let v209 = Uh0Nil
            let v210 = method376(v145, v167, v178, v189, v200, v207, v208, v145, v209)
            let v211 = Uh33Nil
            let v212 = method377(v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, v1, v210, v211)
            let v213 = dict.keys(v114)
            let v214 = dictm_term_sorted(v213)
            let v215 = Uh3Nil
            let listm_fold = v214 |> list.fold (v215, fn (acc, x) {
            let v216 = x
            let v217 = acc
            let v218 = Uh3Cons(v216, v217)
            v218
            })
            let v219 = listm_fold
            let v220 = Uh3Nil
            let v221 = method4(v219, v220)
            let v222 = Uh0Nil
            let v223 = method370(v114, v221, v222)
            let v224 = dict.new()
            let v225 = dict.keys(v91)
            let v226 = dictm_term_sorted(v225)
            let v227 = Uh3Nil
            let listm_fold = v226 |> list.fold (v227, fn (acc, x) {
            let v228 = x
            let v229 = acc
            let v230 = Uh3Cons(v228, v229)
            v230
            })
            let v231 = listm_fold
            let v232 = Uh3Nil
            let v233 = method4(v231, v232)
            let v234 = method296(v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v91, v233, v224)
            let v235 = dict.keys(v234)
            let v236 = dictm_term_sorted(v235)
            let v237 = Uh3Nil
            let listm_fold = v236 |> list.fold (v237, fn (acc, x) {
            let v238 = x
            let v239 = acc
            let v240 = Uh3Cons(v238, v239)
            v240
            })
            let v241 = listm_fold
            let v242 = Uh3Nil
            let v243 = method4(v241, v242)
            let v244 = Uh1Nil
            let v245 = method374(v234, v243, v244)
            let v246 = dict.keys(v106)
            let v247 = dictm_term_sorted(v246)
            let v248 = Uh3Nil
            let listm_fold = v247 |> list.fold (v248, fn (acc, x) {
            let v249 = x
            let v250 = acc
            let v251 = Uh3Cons(v249, v250)
            v251
            })
            let v252 = listm_fold
            let v253 = Uh3Nil
            let v254 = method4(v252, v253)
            let v255 = Uh2Nil
            let v256 = method375(v106, v254, v255)
            let v257 = dict.keys(v107)
            let v258 = dictm_term_sorted(v257)
            let v259 = Uh3Nil
            let listm_fold = v258 |> list.fold (v259, fn (acc, x) {
            let v260 = x
            let v261 = acc
            let v262 = Uh3Cons(v260, v261)
            v262
            })
            let v263 = listm_fold
            let v264 = Uh3Nil
            let v265 = method4(v263, v264)
            let v266 = Uh2Nil
            let v267 = method375(v107, v265, v266)
            let v268 = dict.keys(v108)
            let v269 = dictm_term_sorted(v268)
            let v270 = Uh3Nil
            let listm_fold = v269 |> list.fold (v270, fn (acc, x) {
            let v271 = x
            let v272 = acc
            let v273 = Uh3Cons(v271, v272)
            v273
            })
            let v274 = listm_fold
            let v275 = Uh3Nil
            let v276 = method4(v274, v275)
            let v277 = Uh2Nil
            let v278 = method375(v108, v276, v277)
            let v279 = dict.keys(v100)
            let v280 = dictm_term_sorted(v279)
            let v281 = Uh3Nil
            let listm_fold = v280 |> list.fold (v281, fn (acc, x) {
            let v282 = x
            let v283 = acc
            let v284 = Uh3Cons(v282, v283)
            v284
            })
            let v285 = listm_fold
            let v286 =
                case v117  {
                    Us30NoEviction -> False
                    _ -> True
                }
            let v287 = Uh0Nil
            let v288 = method378(v223, v245, v256, v267, v278, v285, v286, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, v212, v1, v223, v287)
            let v289 = Uh3Nil
            let v290 = method30(v288, v289)
            let v295 =
                case v290  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v292 = 5
                        let v293 = taken_31(v292, v290)
                        Us12Broken(v293)
                    }
                }
            let v296 = Uh0Nil
            let v297 = method32(v223, v245, v256, v267, v278, v285, v286, v223, v296)
            let v298 = Uh3Nil
            let v299 = method30(v297, v298)
            let v304 =
                case v299  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v301 = 5
                        let v302 = taken_31(v301, v299)
                        Us12Broken(v302)
                    }
                }
            let v305 = Uh2Nil
            let v306 = method33(v223, v245, v256, v267, v278, v285, v286, v256, v305)
            let v307 = Uh3Nil
            let v308 = method36(v306, v307)
            let v313 =
                case v308  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v310 = 5
                        let v311 = taken_31(v310, v308)
                        Us12Broken(v311)
                    }
                }
            let v314 = Uh0Nil
            let v315 = method37(v223, v245, v256, v267, v278, v285, v286, v223, v314)
            let v316 = Uh3Nil
            let v317 = method30(v315, v316)
            let v322 =
                case v317  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v319 = 5
                        let v320 = taken_31(v319, v317)
                        Us12Broken(v320)
                    }
                }
            let v350 =
                case v286 {
                    True -> {
                        let v323 = Uh3Nil
                        let v324 = method40(v223, v245, v256, v267, v278, v285, v286, v285, v323)
                        let v329 =
                            case v324  {
                                Uh3Nil -> Us12Held
                                _ -> {
                                    let v326 = 5
                                    let v327 = taken_31(v326, v324)
                                    Us12Broken(v327)
                                }
                            }
                        let v330 = Us13SequentialEquivalence
                        let v331 = Us13NoStaleResults
                        let v332 = Us13OneCompilePerPrefix
                        let v333 = Us13WithdrawnDemandHidden
                        let v334 = Us13UnwantedResultsFreed
                        let v335 = Uh6Nil
                        let v336 = Uh6Cons(v334, v329, v335)
                        let v337 = Uh6Cons(v333, v322, v336)
                        let v338 = Uh6Cons(v332, v313, v337)
                        let v339 = Uh6Cons(v331, v304, v338)
                        Uh6Cons(v330, v295, v339)
                    }
                    False -> {
                        let v341 = Us13SequentialEquivalence
                        let v342 = Us13NoStaleResults
                        let v343 = Us13OneCompilePerPrefix
                        let v344 = Us13WithdrawnDemandHidden
                        let v345 = Uh6Nil
                        let v346 = Uh6Cons(v344, v322, v345)
                        let v347 = Uh6Cons(v343, v313, v346)
                        let v348 = Uh6Cons(v342, v304, v347)
                        Uh6Cons(v341, v295, v348)
                    }
                }
            let v440 =
                case v2 {
                    True -> {
                        let v351 = dict.new()
                        let v352 = method380(v29, v351)
                        let v353 = dict.keys(v114)
                        let v354 = dictm_term_sorted(v353)
                        let v355 = Uh3Nil
                        let listm_fold = v354 |> list.fold (v355, fn (acc, x) {
                        let v356 = x
                        let v357 = acc
                        let v358 = Uh3Cons(v356, v357)
                        v358
                        })
                        let v359 = listm_fold
                        let v360 = Uh3Nil
                        let v361 = method4(v359, v360)
                        let v362 = Uh0Nil
                        let v363 = method370(v114, v361, v362)
                        let v364 = dict.new()
                        let v365 = dict.keys(v91)
                        let v366 = dictm_term_sorted(v365)
                        let v367 = Uh3Nil
                        let listm_fold = v366 |> list.fold (v367, fn (acc, x) {
                        let v368 = x
                        let v369 = acc
                        let v370 = Uh3Cons(v368, v369)
                        v370
                        })
                        let v371 = listm_fold
                        let v372 = Uh3Nil
                        let v373 = method4(v371, v372)
                        let v374 = method296(v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v91, v373, v364)
                        let v375 = dict.keys(v374)
                        let v376 = dictm_term_sorted(v375)
                        let v377 = Uh3Nil
                        let listm_fold = v376 |> list.fold (v377, fn (acc, x) {
                        let v378 = x
                        let v379 = acc
                        let v380 = Uh3Cons(v378, v379)
                        v380
                        })
                        let v381 = listm_fold
                        let v382 = Uh3Nil
                        let v383 = method4(v381, v382)
                        let v384 = Uh1Nil
                        let _v385 = method374(v374, v383, v384)
                        let v386 = dict.keys(v106)
                        let v387 = dictm_term_sorted(v386)
                        let v388 = Uh3Nil
                        let listm_fold = v387 |> list.fold (v388, fn (acc, x) {
                        let v389 = x
                        let v390 = acc
                        let v391 = Uh3Cons(v389, v390)
                        v391
                        })
                        let v392 = listm_fold
                        let v393 = Uh3Nil
                        let v394 = method4(v392, v393)
                        let v395 = Uh2Nil
                        let _v396 = method375(v106, v394, v395)
                        let v397 = dict.keys(v107)
                        let v398 = dictm_term_sorted(v397)
                        let v399 = Uh3Nil
                        let listm_fold = v398 |> list.fold (v399, fn (acc, x) {
                        let v400 = x
                        let v401 = acc
                        let v402 = Uh3Cons(v400, v401)
                        v402
                        })
                        let v403 = listm_fold
                        let v404 = Uh3Nil
                        let v405 = method4(v403, v404)
                        let v406 = Uh2Nil
                        let _v407 = method375(v107, v405, v406)
                        let v408 = dict.keys(v108)
                        let v409 = dictm_term_sorted(v408)
                        let v410 = Uh3Nil
                        let listm_fold = v409 |> list.fold (v410, fn (acc, x) {
                        let v411 = x
                        let v412 = acc
                        let v413 = Uh3Cons(v411, v412)
                        v413
                        })
                        let v414 = listm_fold
                        let v415 = Uh3Nil
                        let v416 = method4(v414, v415)
                        let v417 = Uh2Nil
                        let _v418 = method375(v108, v416, v417)
                        let v419 = dict.keys(v100)
                        let v420 = dictm_term_sorted(v419)
                        let v421 = Uh3Nil
                        let listm_fold = v420 |> list.fold (v421, fn (acc, x) {
                        let v422 = x
                        let v423 = acc
                        let v424 = Uh3Cons(v422, v423)
                        v424
                        })
                        let _v425 = listm_fold
                        let v427 = Uh0Nil
                        let v428 = method381(v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, v352, v363, v427)
                        let v429 = Uh3Nil
                        let v430 = method30(v428, v429)
                        let v435 =
                            case v430  {
                                Uh3Nil -> Us12Held
                                _ -> {
                                    let v432 = 5
                                    let v433 = taken_31(v432, v430)
                                    Us12Broken(v433)
                                }
                            }
                        let v436 = Us13BreakingEditsFail
                        let v437 = Uh6Nil
                        let v438 = Uh6Cons(v436, v435, v437)
                        method382(v350, v438)
                    }
                    False -> v350
                }
            let v441 = " "
            let v442 = dict.keys(v106)
            let v443 = dictm_term_sorted(v442)
            let v444 = Uh3Nil
            let listm_fold = v443 |> list.fold (v444, fn (acc, x) {
            let v445 = x
            let v446 = acc
            let v447 = Uh3Cons(v445, v446)
            v447
            })
            let v448 = listm_fold
            let v449 = Uh3Nil
            let v450 = method4(v448, v449)
            let v451 = 0
            let v452 = method383(v106, v450, v451)
            let v453 = "starts"
            let v454 = "="
            let v455 = v453 <> v454 
            let v456 = string.inspect(v452)
            let v457 = v455 <> v456 
            let v458 = dict.size(v100)
            let v459 = "prefixes"
            let v460 = v459 <> v454 
            let v461 = string.inspect(v458)
            let v462 = v460 <> v461 
            let v463 = "peak_results"
            let v464 = v463 <> v454 
            let v465 = string.inspect(v113)
            let v466 = v464 <> v465 
            let v467 = dict.keys(v108)
            let v468 = dictm_term_sorted(v467)
            let v469 = Uh3Nil
            let listm_fold = v468 |> list.fold (v469, fn (acc, x) {
            let v470 = x
            let v471 = acc
            let v472 = Uh3Cons(v470, v471)
            v472
            })
            let v473 = listm_fold
            let v474 = Uh3Nil
            let v475 = method4(v473, v474)
            let v476 = 0
            let v477 = method383(v108, v475, v476)
            let v478 = "evictions"
            let v479 = v478 <> v454 
            let v480 = string.inspect(v477)
            let v481 = v479 <> v480 
            let v482 = "rescues"
            let v483 = v482 <> v454 
            let v484 = string.inspect(v110)
            let v485 = v483 <> v484 
            let v486 = "recomputes"
            let v487 = v486 <> v454 
            let v488 = string.inspect(v111)
            let v489 = v487 <> v488 
            let v490 = "cancels"
            let v491 = v490 <> v454 
            let v492 = string.inspect(v109)
            let v493 = v491 <> v492 
            let v494 = dict.size(v114)
            let v495 = "visible"
            let v496 = v495 <> v454 
            let v497 = string.inspect(v494)
            let v498 = v496 <> v497 
            let v499 = "peak_inflight"
            let v500 = v499 <> v454 
            let v501 = string.inspect(v112)
            let v502 = v500 <> v501 
            let v503 = "peak_beam_mb"
            let v504 = v503 <> v454 
            let v505 = string.inspect(v128)
            let v506 = v504 <> v505 
            let v507 = "ms"
            let v508 = v507 <> v454 
            let v509 = string.inspect(v123)
            let v510 = v508 <> v509 
            let v511 = "seed"
            let v512 = v511 <> v454 
            let v513 = string.inspect(v14)
            let v514 = v512 <> v513 
            let v515 = "schedule"
            let v516 = v515 <> v454 
            let v517 = string.inspect(v31)
            let v518 = v516 <> v517 
            let v519 = "posts"
            let v520 = v519 <> v454 
            let v521 = string.inspect(v130)
            let v522 = v520 <> v521 
            let v523 = "events"
            let v524 = v523 <> v454 
            let v525 = string.inspect(v132)
            let v526 = v524 <> v525 
            let v527 = "deliveries"
            let v528 = v527 <> v454 
            let v529 = string.inspect(v134)
            let v530 = v528 <> v529 
            let v531 = "duplicates"
            let v532 = v531 <> v454 
            let v533 = string.inspect(v96)
            let v534 = v532 <> v533 
            let v535 = "buffered"
            let v536 = v535 <> v454 
            let v537 = string.inspect(v97)
            let v538 = v536 <> v537 
            let v539 = "framed"
            let v540 = v539 <> v454 
            let v541 = string.inspect(v94)
            let v542 = v540 <> v541 
            let v543 = "framed_edits"
            let v544 = v543 <> v454 
            let v545 = string.inspect(v95)
            let v546 = v544 <> v545 
            let v547 = Uh3Nil
            let v548 = Uh3Cons(v510, v547)
            let v549 = Uh3Cons(v506, v548)
            let v550 = Uh3Cons(v502, v549)
            let v551 = Uh3Cons(v498, v550)
            let v552 = Uh3Cons(v493, v551)
            let v553 = Uh3Cons(v489, v552)
            let v554 = Uh3Cons(v485, v553)
            let v555 = Uh3Cons(v481, v554)
            let v556 = Uh3Cons(v466, v555)
            let v557 = Uh3Cons(v462, v556)
            let v558 = Uh3Cons(v457, v557)
            let v559 = Uh3Cons(v546, v558)
            let v560 = Uh3Cons(v542, v559)
            let v561 = Uh3Cons(v538, v560)
            let v562 = Uh3Cons(v534, v561)
            let v563 = Uh3Cons(v530, v562)
            let v564 = Uh3Cons(v526, v563)
            let v565 = Uh3Cons(v522, v564)
            let v566 = Uh3Cons(v518, v565)
            let v567 = Uh3Cons(v514, v566)
            let v568 = delimited_21(v441, v567)
            let v569 = "XSIM "
            let v570 = v569 <> v568 
            let v571 = v570 <> v441 
            let v572 = Uh3Nil
            let v573 = method43(v440, v572)
            let v574 = delimited_21(v441, v573)
            let v575 = v571 <> v574 
            let v576 = "\n"
            let v577 = v575 <> v576 
            let v578 = string.inspect(v14)
            let v579 = string.inspect(v31)
            let v580 = "x_sim_run_ms"
            let v581 = "{"
            let v582 = v580 <> v581 
            let v583 = "=\""
            let v584 = v515 <> v583 
            let v585 = v584 <> v579 
            let v586 = "\""
            let v587 = v585 <> v586 
            let v588 = v511 <> v583 
            let v589 = v588 <> v578 
            let v590 = v589 <> v586 
            let v591 = ","
            let v592 = Uh3Nil
            let v593 = Uh3Cons(v587, v592)
            let v594 = Uh3Cons(v590, v593)
            let v595 = delimited_21(v591, v594)
            let v596 = v582 <> v595 
            let v597 = "} "
            let v598 = v596 <> v597 
            let v599 = string.inspect(v123)
            let v600 = v598 <> v599 
            let v601 = v600 <> v576 
            let v602 = string.inspect(v14)
            let v603 = string.inspect(v31)
            let v604 = "x_sim_deliveries_total"
            let v605 = v604 <> v581 
            let v606 = v515 <> v583 
            let v607 = v606 <> v603 
            let v608 = v607 <> v586 
            let v609 = v511 <> v583 
            let v610 = v609 <> v602 
            let v611 = v610 <> v586 
            let v612 = Uh3Nil
            let v613 = Uh3Cons(v608, v612)
            let v614 = Uh3Cons(v611, v613)
            let v615 = delimited_21(v591, v614)
            let v616 = v605 <> v615 
            let v617 = v616 <> v597 
            let v618 = string.inspect(v134)
            let v619 = v617 <> v618 
            let v620 = v601 <> v619 
            let v621 = v577 <> v620 
            let v622 = v3(v31)
            let v623 = Uh3Cons(v621, v622)
            let v624 = delimited_21(v576, v623)
            let v625 = Uh3Nil
            let v626 = method384(v440, v625)
            let #(v731, v732, v733, v734, v735, v736, v737, v738, v739, v740, v741, v742, v743, v744, v745, v746, v747, v748, v749, v750, v751, v752, v753, v754, v755, v756, v757, v758, v759, v760, v761, v762, v763, v764, v765, v766, v767, v768) =
                case v626  {
                    Uh3Cons(v627, v628) -> {
                        let v629 = v624 <> v576 
                        let v630 = Us2Some(v627)
                        let v631 = Uh3Nil
                        let v632 = chain_sources_284(v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v630, v631)
                        let v633 = "XSIM explain "
                        let v634 = v633 <> v627 
                        let v635 = " cells="
                        let v636 = v634 <> v635 
                        let v637 = 0
                        let v638 = method20(v632, v637)
                        let v639 = string.inspect(v638)
                        let v640 = v636 <> v639 
                        let v641 = "\n  concurrent="
                        let v642 = v640 <> v641 
                        let v643 = dict.get(v114, v627)
                        let v644 = method371()
                        let v645 = method372()
                        let v646 = case v643 { Ok(x) -> v644(x) Error(x) -> v645(x) }
                        let v653 =
                            case v646  {
                                Us77Error -> Us78None
                                Us77Ok(v647, v648, v649) -> Us78Some(v647, v648, v649)
                            }
                        let v672 =
                            case v653  {
                                Us78None -> {
                                    let v670 = "nil"
                                    v670
                                }
                                Us78Some(v654, v655, v656) -> {
                                    let v657 = "%{out: \""
                                    let v658 = v657 <> v656 
                                    let v659 = "\", status: :"
                                    let v660 = v658 <> v659 
                                    let v666 =
                                        case v655  {
                                            Us45Crashed -> {
                                                let v663 = "crash"
                                                v663
                                            }
                                            Us45Done -> {
                                                let v661 = "ok"
                                                v661
                                            }
                                            Us45Erred -> {
                                                let v662 = "error"
                                                v662
                                            }
                                        }
                                    let v667 = v660 <> v666 
                                    let v668 = "}"
                                    let v669 = v667 <> v668 
                                    v669
                                }
                            }
                        let v673 = v642 <> v672 
                        let v674 = "\n  sequential="
                        let v675 = v673 <> v674 
                        let #(v676, v677) = v1(v632)
                        let v678 = "%{out: \""
                        let v679 = v678 <> v677 
                        let v680 = "\", status: :"
                        let v681 = v679 <> v680 
                        let v687 =
                            case v676  {
                                Us45Crashed -> {
                                    let v684 = "crash"
                                    v684
                                }
                                Us45Done -> {
                                    let v682 = "ok"
                                    v682
                                }
                                Us45Erred -> {
                                    let v683 = "error"
                                    v683
                                }
                            }
                        let v688 = v681 <> v687 
                        let v689 = "}"
                        let v690 = v688 <> v689 
                        let v691 = v675 <> v690 
                        let v692 = v629 <> v691 
                        #(v692, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, v440)
                    }
                    _ -> {
                        let #(v693, v694, v695, v696, v697, v698, v699, v700, v701, v702, v703, v704, v705, v706, v707, v708, v709, v710, v711, v712, v713, v714, v715, v716, v717, v718, v719, v720, v721, v722, v723, v724, v725, v726, v727, v728, v729, v730) =
                            case v626  {
                                Uh3Nil -> #(v624, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, v440)
                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                            }
                        #(v693, v694, v695, v696, v697, v698, v699, v700, v701, v702, v703, v704, v705, v706, v707, v708, v709, v710, v711, v712, v713, v714, v715, v716, v717, v718, v719, v720, v721, v722, v723, v724, v725, v726, v727, v728, v729, v730)
                    }
                }
            let v769 = Uh32Cons(v731, v732, v733, v734, v735, v736, v737, v738, v739, v740, v741, v742, v743, v744, v745, v746, v747, v748, v749, v750, v751, v752, v753, v754, v755, v756, v757, v758, v759, v760, v761, v762, v763, v764, v765, v766, v767, v768, v32)
            outcomes_from_365(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v36, v769)
        }
    }
}

pub fn method385(v0: Uh32, v1: Uh3) -> Uh3 {
    case v0  {
        Uh32Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40) -> {
            let v41 = method385(v40, v1)
            Uh3Cons(v2, v41)
        }
        Uh32Nil -> v1
    }
}

pub fn method386(v0: Uh32, v1: Uh34) -> Uh34 {
    case v0  {
        Uh32Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40) -> {
            let v41 = method386(v40, v1)
            Uh34Cons(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v41)
        }
        Uh32Nil -> v1
    }
}

pub fn method387(v0: Uh32, v1: Uh35) -> Uh35 {
    case v0  {
        Uh32Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40) -> {
            let v41 = method387(v40, v1)
            Uh35Cons(v39, v41)
        }
        Uh32Nil -> v1
    }
}
