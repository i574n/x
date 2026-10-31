import gleam/bit_array
import gleam/dict
import gleam/erlang/atom
import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Us2, type Uh9, type Uh10, type Uh15, type Us29, type Us30, type Us45, type Uh28, type Uh32, type Uh34, type Uh35, Uh0Nil, Uh1Nil, Uh2Nil, Uh32Cons, Uh32Nil, Uh33Nil, Uh34Cons, Uh35Cons, Uh3Cons, Uh3Nil, Uh6Cons, Uh6Nil, Us12Broken, Us12Held, Us13BreakingEditsFail, Us13NoStaleResults, Us13OneCompilePerPrefix, Us13SequentialEquivalence, Us13UnwantedResultsFreed, Us13WithdrawnDemandHidden, Us21Error, Us21Ok, Us2Some, Us30NoEviction, Us45Crashed, Us45Done, Us45Erred, Us56Error, Us56Ok, Us76Error, Us76Ok, Us77Error, Us77Ok, Us78None, Us78Some}
import xsim_frames/part1.{dictm_term_sorted, method4, spiral_fs_coerce, spiral_fs_read_file, spiral_fs_write_file, spiral_wrap_signed}
import xsim_frames/part10.{method259, method260}
import xsim_frames/part12.{chain_sources_284}
import xsim_frames/part13.{method295}
import xsim_frames/part17.{method365, method366, method367, method368, method369, method370, method371, method373, method374, method375, method376}
import xsim_frames/part18.{method377, method379, method380, method381, method382, method383}
import xsim_frames/part2.{delimited_21, method20, method30, method32, method33, method36, method37, method40, taken_31}
import xsim_frames/part3.{method43, method79}
import xsim_frames/part4.{method96}
import xsim_frames/part5.{stream_115}
import xsim_frames/part6.{decoded_stream_123, deliveries_130}

pub fn outcomes_from_364(v0: fn(Uh3) -> #(Us45, String), v1: fn(Uh3) -> #(Us45, String), v2: Bool, v3: fn(Int) -> Uh3, v4: fn(Nil) -> Int, v5: fn(Int) -> fn(fn(Uh3) -> #(Us45, String)) -> fn(#(Bool, Bool, Us30, Bool, Int)) -> fn(Uh15) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, Int), v6: Uh3, v7: String, v8: Int, v9: Int, v10: Int, v11: String, v12: Bool, v13: Int, v14: Int, v15: Int, v16: Int, v17: Int, v18: String, v19: String, v20: Us29, v21: Int, v22: Us30, v23: Int, v24: Bool, v25: Bool, v26: Uh9, v27: Uh10, v28: Uh3, v29: Uh10, v30: Int, v31: Uh32) -> Uh32 {
    let v32 = v30 > v16
    case v32 {
        True -> {
            let v33 = Uh32Nil
            method365(v31, v33)
        }
        False -> {
            let v35 = spiral_wrap_signed(v30 + 1, 32)
            let v36 = v18 != ""
            let v67 =
                case v36 {
                    True -> {
                        let v37 = spiral_fs_read_file(v18)
                        let v38 = method366()
                        let v39 = method367()
                        let v40 = case v37 { Ok(x) -> v38(x) Error(x) -> v39(x) }
                        let v53 =
                            case v40  {
                                Us76Error(v50) -> panic as "file_system.read_all_text: file:read_file failed"
                                Us76Ok(v41) -> {
                                    let v42 = bit_array.to_string(v41)
                                    let v43 = method259()
                                    let v44 = method260()
                                    let v45 = case v42 { Ok(x) -> v43(x) Error(x) -> v44(x) }
                                    case v45  {
                                        Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                        Us56Ok(v46) -> v46
                                    }
                                }
                            }
                        let v54 = decoded_stream_123(v53)
                        case v54  {
                            Us21Error(v56) -> {
                                let v57 = "xsim: --replay "
                                let v58 = v57 <> v18 
                                let v59 = ": "
                                let v60 = v58 <> v59 
                                let v61 = v60 <> v56 
                                panic as v61
                            }
                            Us21Ok(v55) -> v55
                        }
                    }
                    False -> {
                        let v65 = 6
                        deliveries_130(v29, v30, v17, v65)
                    }
                }
            let v68 = v19 != ""
            case v68 {
                True -> {
                    let v69 = string.inspect(v30)
                    let v70 = "{schedule}"
                    let v71 = v19 |> string.replace(v70, v69)
                    let v72 = stream_115(v67)
                    let v73 = spiral_fs_write_file(v71, v72)
                    let v74 = spiral_fs_coerce(v73)
                    let v75 = "ok"
                    let v76 = atom.create(v75)
                    let v77 = v74 == v76
                    let v78 = v77 == False
                    case v78 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                }
                False -> Nil
            }
            let v79 = v4(Nil)
            let v80 = v5(v23)
            let v81 = v80(v0)
            let v82 = v81(#(True, False, v22, False, v21))
            let #(v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119) = v82(v67)
            let v120 = v119 > v79
            let v121 =
                case v120 {
                    True -> v119
                    False -> v79
                }
            let v122 = v4(Nil)
            let v123 = v122 > v121
            let v124 =
                case v123 {
                    True -> v122
                    False -> v121
                }
            let v125 = 0
            let v126 = method79(v26, v125)
            let v127 = 0
            let v128 = method96(v29, v127)
            let v129 = 0
            let v130 = method368(v67, v129)
            let v131 = dict.keys(v112)
            let v132 = dictm_term_sorted(v131)
            let v133 = Uh3Nil
            let listm_fold = v132 |> list.fold (v133, fn (acc, x) {
            let v134 = x
            let v135 = acc
            let v136 = Uh3Cons(v134, v135)
            v136
            })
            let v137 = listm_fold
            let v138 = Uh3Nil
            let v139 = method4(v137, v138)
            let v140 = Uh0Nil
            let v141 = method369(v112, v139, v140)
            let v142 = dict.new()
            let v143 = dict.keys(v89)
            let v144 = dictm_term_sorted(v143)
            let v145 = Uh3Nil
            let listm_fold = v144 |> list.fold (v145, fn (acc, x) {
            let v146 = x
            let v147 = acc
            let v148 = Uh3Cons(v146, v147)
            v148
            })
            let v149 = listm_fold
            let v150 = Uh3Nil
            let v151 = method4(v149, v150)
            let v152 = method295(v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v89, v151, v142)
            let v153 = dict.keys(v152)
            let v154 = dictm_term_sorted(v153)
            let v155 = Uh3Nil
            let listm_fold = v154 |> list.fold (v155, fn (acc, x) {
            let v156 = x
            let v157 = acc
            let v158 = Uh3Cons(v156, v157)
            v158
            })
            let v159 = listm_fold
            let v160 = Uh3Nil
            let v161 = method4(v159, v160)
            let v162 = Uh1Nil
            let v163 = method373(v152, v161, v162)
            let v164 = dict.keys(v104)
            let v165 = dictm_term_sorted(v164)
            let v166 = Uh3Nil
            let listm_fold = v165 |> list.fold (v166, fn (acc, x) {
            let v167 = x
            let v168 = acc
            let v169 = Uh3Cons(v167, v168)
            v169
            })
            let v170 = listm_fold
            let v171 = Uh3Nil
            let v172 = method4(v170, v171)
            let v173 = Uh2Nil
            let v174 = method374(v104, v172, v173)
            let v175 = dict.keys(v105)
            let v176 = dictm_term_sorted(v175)
            let v177 = Uh3Nil
            let listm_fold = v176 |> list.fold (v177, fn (acc, x) {
            let v178 = x
            let v179 = acc
            let v180 = Uh3Cons(v178, v179)
            v180
            })
            let v181 = listm_fold
            let v182 = Uh3Nil
            let v183 = method4(v181, v182)
            let v184 = Uh2Nil
            let v185 = method374(v105, v183, v184)
            let v186 = dict.keys(v106)
            let v187 = dictm_term_sorted(v186)
            let v188 = Uh3Nil
            let listm_fold = v187 |> list.fold (v188, fn (acc, x) {
            let v189 = x
            let v190 = acc
            let v191 = Uh3Cons(v189, v190)
            v191
            })
            let v192 = listm_fold
            let v193 = Uh3Nil
            let v194 = method4(v192, v193)
            let v195 = Uh2Nil
            let v196 = method374(v106, v194, v195)
            let v197 = dict.keys(v98)
            let v198 = dictm_term_sorted(v197)
            let v199 = Uh3Nil
            let listm_fold = v198 |> list.fold (v199, fn (acc, x) {
            let v200 = x
            let v201 = acc
            let v202 = Uh3Cons(v200, v201)
            v202
            })
            let v203 = listm_fold
            let v204 =
                case v115  {
                    Us30NoEviction -> False
                    _ -> True
                }
            let v205 = Uh0Nil
            let v206 = method375(v141, v163, v174, v185, v196, v203, v204, v141, v205)
            let v207 = Uh33Nil
            let v208 = method376(v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v1, v206, v207)
            let v209 = dict.keys(v112)
            let v210 = dictm_term_sorted(v209)
            let v211 = Uh3Nil
            let listm_fold = v210 |> list.fold (v211, fn (acc, x) {
            let v212 = x
            let v213 = acc
            let v214 = Uh3Cons(v212, v213)
            v214
            })
            let v215 = listm_fold
            let v216 = Uh3Nil
            let v217 = method4(v215, v216)
            let v218 = Uh0Nil
            let v219 = method369(v112, v217, v218)
            let v220 = dict.new()
            let v221 = dict.keys(v89)
            let v222 = dictm_term_sorted(v221)
            let v223 = Uh3Nil
            let listm_fold = v222 |> list.fold (v223, fn (acc, x) {
            let v224 = x
            let v225 = acc
            let v226 = Uh3Cons(v224, v225)
            v226
            })
            let v227 = listm_fold
            let v228 = Uh3Nil
            let v229 = method4(v227, v228)
            let v230 = method295(v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v89, v229, v220)
            let v231 = dict.keys(v230)
            let v232 = dictm_term_sorted(v231)
            let v233 = Uh3Nil
            let listm_fold = v232 |> list.fold (v233, fn (acc, x) {
            let v234 = x
            let v235 = acc
            let v236 = Uh3Cons(v234, v235)
            v236
            })
            let v237 = listm_fold
            let v238 = Uh3Nil
            let v239 = method4(v237, v238)
            let v240 = Uh1Nil
            let v241 = method373(v230, v239, v240)
            let v242 = dict.keys(v104)
            let v243 = dictm_term_sorted(v242)
            let v244 = Uh3Nil
            let listm_fold = v243 |> list.fold (v244, fn (acc, x) {
            let v245 = x
            let v246 = acc
            let v247 = Uh3Cons(v245, v246)
            v247
            })
            let v248 = listm_fold
            let v249 = Uh3Nil
            let v250 = method4(v248, v249)
            let v251 = Uh2Nil
            let v252 = method374(v104, v250, v251)
            let v253 = dict.keys(v105)
            let v254 = dictm_term_sorted(v253)
            let v255 = Uh3Nil
            let listm_fold = v254 |> list.fold (v255, fn (acc, x) {
            let v256 = x
            let v257 = acc
            let v258 = Uh3Cons(v256, v257)
            v258
            })
            let v259 = listm_fold
            let v260 = Uh3Nil
            let v261 = method4(v259, v260)
            let v262 = Uh2Nil
            let v263 = method374(v105, v261, v262)
            let v264 = dict.keys(v106)
            let v265 = dictm_term_sorted(v264)
            let v266 = Uh3Nil
            let listm_fold = v265 |> list.fold (v266, fn (acc, x) {
            let v267 = x
            let v268 = acc
            let v269 = Uh3Cons(v267, v268)
            v269
            })
            let v270 = listm_fold
            let v271 = Uh3Nil
            let v272 = method4(v270, v271)
            let v273 = Uh2Nil
            let v274 = method374(v106, v272, v273)
            let v275 = dict.keys(v98)
            let v276 = dictm_term_sorted(v275)
            let v277 = Uh3Nil
            let listm_fold = v276 |> list.fold (v277, fn (acc, x) {
            let v278 = x
            let v279 = acc
            let v280 = Uh3Cons(v278, v279)
            v280
            })
            let v281 = listm_fold
            let v282 =
                case v115  {
                    Us30NoEviction -> False
                    _ -> True
                }
            let v283 = Uh0Nil
            let v284 = method377(v219, v241, v252, v263, v274, v281, v282, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v208, v1, v219, v283)
            let v285 = Uh3Nil
            let v286 = method30(v284, v285)
            let v291 =
                case v286  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v288 = 5
                        let v289 = taken_31(v288, v286)
                        Us12Broken(v289)
                    }
                }
            let v292 = Uh0Nil
            let v293 = method32(v219, v241, v252, v263, v274, v281, v282, v219, v292)
            let v294 = Uh3Nil
            let v295 = method30(v293, v294)
            let v300 =
                case v295  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v297 = 5
                        let v298 = taken_31(v297, v295)
                        Us12Broken(v298)
                    }
                }
            let v301 = Uh2Nil
            let v302 = method33(v219, v241, v252, v263, v274, v281, v282, v252, v301)
            let v303 = Uh3Nil
            let v304 = method36(v302, v303)
            let v309 =
                case v304  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v306 = 5
                        let v307 = taken_31(v306, v304)
                        Us12Broken(v307)
                    }
                }
            let v310 = Uh0Nil
            let v311 = method37(v219, v241, v252, v263, v274, v281, v282, v219, v310)
            let v312 = Uh3Nil
            let v313 = method30(v311, v312)
            let v318 =
                case v313  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v315 = 5
                        let v316 = taken_31(v315, v313)
                        Us12Broken(v316)
                    }
                }
            let v346 =
                case v282 {
                    True -> {
                        let v319 = Uh3Nil
                        let v320 = method40(v219, v241, v252, v263, v274, v281, v282, v281, v319)
                        let v325 =
                            case v320  {
                                Uh3Nil -> Us12Held
                                _ -> {
                                    let v322 = 5
                                    let v323 = taken_31(v322, v320)
                                    Us12Broken(v323)
                                }
                            }
                        let v326 = Us13SequentialEquivalence
                        let v327 = Us13NoStaleResults
                        let v328 = Us13OneCompilePerPrefix
                        let v329 = Us13WithdrawnDemandHidden
                        let v330 = Us13UnwantedResultsFreed
                        let v331 = Uh6Nil
                        let v332 = Uh6Cons(v330, v325, v331)
                        let v333 = Uh6Cons(v329, v318, v332)
                        let v334 = Uh6Cons(v328, v309, v333)
                        let v335 = Uh6Cons(v327, v300, v334)
                        Uh6Cons(v326, v291, v335)
                    }
                    False -> {
                        let v337 = Us13SequentialEquivalence
                        let v338 = Us13NoStaleResults
                        let v339 = Us13OneCompilePerPrefix
                        let v340 = Us13WithdrawnDemandHidden
                        let v341 = Uh6Nil
                        let v342 = Uh6Cons(v340, v318, v341)
                        let v343 = Uh6Cons(v339, v309, v342)
                        let v344 = Uh6Cons(v338, v300, v343)
                        Uh6Cons(v337, v291, v344)
                    }
                }
            let v436 =
                case v2 {
                    True -> {
                        let v347 = dict.new()
                        let v348 = method379(v28, v347)
                        let v349 = dict.keys(v112)
                        let v350 = dictm_term_sorted(v349)
                        let v351 = Uh3Nil
                        let listm_fold = v350 |> list.fold (v351, fn (acc, x) {
                        let v352 = x
                        let v353 = acc
                        let v354 = Uh3Cons(v352, v353)
                        v354
                        })
                        let v355 = listm_fold
                        let v356 = Uh3Nil
                        let v357 = method4(v355, v356)
                        let v358 = Uh0Nil
                        let v359 = method369(v112, v357, v358)
                        let v360 = dict.new()
                        let v361 = dict.keys(v89)
                        let v362 = dictm_term_sorted(v361)
                        let v363 = Uh3Nil
                        let listm_fold = v362 |> list.fold (v363, fn (acc, x) {
                        let v364 = x
                        let v365 = acc
                        let v366 = Uh3Cons(v364, v365)
                        v366
                        })
                        let v367 = listm_fold
                        let v368 = Uh3Nil
                        let v369 = method4(v367, v368)
                        let v370 = method295(v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v89, v369, v360)
                        let v371 = dict.keys(v370)
                        let v372 = dictm_term_sorted(v371)
                        let v373 = Uh3Nil
                        let listm_fold = v372 |> list.fold (v373, fn (acc, x) {
                        let v374 = x
                        let v375 = acc
                        let v376 = Uh3Cons(v374, v375)
                        v376
                        })
                        let v377 = listm_fold
                        let v378 = Uh3Nil
                        let v379 = method4(v377, v378)
                        let v380 = Uh1Nil
                        let _v381 = method373(v370, v379, v380)
                        let v382 = dict.keys(v104)
                        let v383 = dictm_term_sorted(v382)
                        let v384 = Uh3Nil
                        let listm_fold = v383 |> list.fold (v384, fn (acc, x) {
                        let v385 = x
                        let v386 = acc
                        let v387 = Uh3Cons(v385, v386)
                        v387
                        })
                        let v388 = listm_fold
                        let v389 = Uh3Nil
                        let v390 = method4(v388, v389)
                        let v391 = Uh2Nil
                        let _v392 = method374(v104, v390, v391)
                        let v393 = dict.keys(v105)
                        let v394 = dictm_term_sorted(v393)
                        let v395 = Uh3Nil
                        let listm_fold = v394 |> list.fold (v395, fn (acc, x) {
                        let v396 = x
                        let v397 = acc
                        let v398 = Uh3Cons(v396, v397)
                        v398
                        })
                        let v399 = listm_fold
                        let v400 = Uh3Nil
                        let v401 = method4(v399, v400)
                        let v402 = Uh2Nil
                        let _v403 = method374(v105, v401, v402)
                        let v404 = dict.keys(v106)
                        let v405 = dictm_term_sorted(v404)
                        let v406 = Uh3Nil
                        let listm_fold = v405 |> list.fold (v406, fn (acc, x) {
                        let v407 = x
                        let v408 = acc
                        let v409 = Uh3Cons(v407, v408)
                        v409
                        })
                        let v410 = listm_fold
                        let v411 = Uh3Nil
                        let v412 = method4(v410, v411)
                        let v413 = Uh2Nil
                        let _v414 = method374(v106, v412, v413)
                        let v415 = dict.keys(v98)
                        let v416 = dictm_term_sorted(v415)
                        let v417 = Uh3Nil
                        let listm_fold = v416 |> list.fold (v417, fn (acc, x) {
                        let v418 = x
                        let v419 = acc
                        let v420 = Uh3Cons(v418, v419)
                        v420
                        })
                        let _v421 = listm_fold
                        let v423 = Uh0Nil
                        let v424 = method380(v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v348, v359, v423)
                        let v425 = Uh3Nil
                        let v426 = method30(v424, v425)
                        let v431 =
                            case v426  {
                                Uh3Nil -> Us12Held
                                _ -> {
                                    let v428 = 5
                                    let v429 = taken_31(v428, v426)
                                    Us12Broken(v429)
                                }
                            }
                        let v432 = Us13BreakingEditsFail
                        let v433 = Uh6Nil
                        let v434 = Uh6Cons(v432, v431, v433)
                        method381(v346, v434)
                    }
                    False -> v346
                }
            let v437 = " "
            let v438 = dict.keys(v104)
            let v439 = dictm_term_sorted(v438)
            let v440 = Uh3Nil
            let listm_fold = v439 |> list.fold (v440, fn (acc, x) {
            let v441 = x
            let v442 = acc
            let v443 = Uh3Cons(v441, v442)
            v443
            })
            let v444 = listm_fold
            let v445 = Uh3Nil
            let v446 = method4(v444, v445)
            let v447 = 0
            let v448 = method382(v104, v446, v447)
            let v449 = "starts"
            let v450 = "="
            let v451 = v449 <> v450 
            let v452 = string.inspect(v448)
            let v453 = v451 <> v452 
            let v454 = dict.size(v98)
            let v455 = "prefixes"
            let v456 = v455 <> v450 
            let v457 = string.inspect(v454)
            let v458 = v456 <> v457 
            let v459 = "peak_results"
            let v460 = v459 <> v450 
            let v461 = string.inspect(v111)
            let v462 = v460 <> v461 
            let v463 = dict.keys(v106)
            let v464 = dictm_term_sorted(v463)
            let v465 = Uh3Nil
            let listm_fold = v464 |> list.fold (v465, fn (acc, x) {
            let v466 = x
            let v467 = acc
            let v468 = Uh3Cons(v466, v467)
            v468
            })
            let v469 = listm_fold
            let v470 = Uh3Nil
            let v471 = method4(v469, v470)
            let v472 = 0
            let v473 = method382(v106, v471, v472)
            let v474 = "evictions"
            let v475 = v474 <> v450 
            let v476 = string.inspect(v473)
            let v477 = v475 <> v476 
            let v478 = "rescues"
            let v479 = v478 <> v450 
            let v480 = string.inspect(v108)
            let v481 = v479 <> v480 
            let v482 = "recomputes"
            let v483 = v482 <> v450 
            let v484 = string.inspect(v109)
            let v485 = v483 <> v484 
            let v486 = "cancels"
            let v487 = v486 <> v450 
            let v488 = string.inspect(v107)
            let v489 = v487 <> v488 
            let v490 = dict.size(v112)
            let v491 = "visible"
            let v492 = v491 <> v450 
            let v493 = string.inspect(v490)
            let v494 = v492 <> v493 
            let v495 = "peak_inflight"
            let v496 = v495 <> v450 
            let v497 = string.inspect(v110)
            let v498 = v496 <> v497 
            let v499 = "peak_beam_mb"
            let v500 = v499 <> v450 
            let v501 = string.inspect(v124)
            let v502 = v500 <> v501 
            let v503 = "ms"
            let v504 = v503 <> v450 
            let v505 = string.inspect(0)
            let v506 = v504 <> v505 
            let v507 = "seed"
            let v508 = v507 <> v450 
            let v509 = string.inspect(v13)
            let v510 = v508 <> v509 
            let v511 = "schedule"
            let v512 = v511 <> v450 
            let v513 = string.inspect(v30)
            let v514 = v512 <> v513 
            let v515 = "posts"
            let v516 = v515 <> v450 
            let v517 = string.inspect(v126)
            let v518 = v516 <> v517 
            let v519 = "events"
            let v520 = v519 <> v450 
            let v521 = string.inspect(v128)
            let v522 = v520 <> v521 
            let v523 = "deliveries"
            let v524 = v523 <> v450 
            let v525 = string.inspect(v130)
            let v526 = v524 <> v525 
            let v527 = "duplicates"
            let v528 = v527 <> v450 
            let v529 = string.inspect(v94)
            let v530 = v528 <> v529 
            let v531 = "buffered"
            let v532 = v531 <> v450 
            let v533 = string.inspect(v95)
            let v534 = v532 <> v533 
            let v535 = "framed"
            let v536 = v535 <> v450 
            let v537 = string.inspect(v92)
            let v538 = v536 <> v537 
            let v539 = "framed_edits"
            let v540 = v539 <> v450 
            let v541 = string.inspect(v93)
            let v542 = v540 <> v541 
            let v543 = Uh3Nil
            let v544 = Uh3Cons(v506, v543)
            let v545 = Uh3Cons(v502, v544)
            let v546 = Uh3Cons(v498, v545)
            let v547 = Uh3Cons(v494, v546)
            let v548 = Uh3Cons(v489, v547)
            let v549 = Uh3Cons(v485, v548)
            let v550 = Uh3Cons(v481, v549)
            let v551 = Uh3Cons(v477, v550)
            let v552 = Uh3Cons(v462, v551)
            let v553 = Uh3Cons(v458, v552)
            let v554 = Uh3Cons(v453, v553)
            let v555 = Uh3Cons(v542, v554)
            let v556 = Uh3Cons(v538, v555)
            let v557 = Uh3Cons(v534, v556)
            let v558 = Uh3Cons(v530, v557)
            let v559 = Uh3Cons(v526, v558)
            let v560 = Uh3Cons(v522, v559)
            let v561 = Uh3Cons(v518, v560)
            let v562 = Uh3Cons(v514, v561)
            let v563 = Uh3Cons(v510, v562)
            let v564 = delimited_21(v437, v563)
            let v565 = "XSIM "
            let v566 = v565 <> v564 
            let v567 = v566 <> v437 
            let v568 = Uh3Nil
            let v569 = method43(v436, v568)
            let v570 = delimited_21(v437, v569)
            let v571 = v567 <> v570 
            let v572 = "\n"
            let v573 = v3(v30)
            let v574 = Uh3Cons(v571, v573)
            let v575 = delimited_21(v572, v574)
            let v576 = Uh3Nil
            let v577 = method383(v436, v576)
            let #(v682, v683, v684, v685, v686, v687, v688, v689, v690, v691, v692, v693, v694, v695, v696, v697, v698, v699, v700, v701, v702, v703, v704, v705, v706, v707, v708, v709, v710, v711, v712, v713, v714, v715, v716, v717, v718, v719) =
                case v577  {
                    Uh3Cons(v578, v579) -> {
                        let v580 = v575 <> v572 
                        let v581 = Us2Some(v578)
                        let v582 = Uh3Nil
                        let v583 = chain_sources_284(v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v581, v582)
                        let v584 = "XSIM explain "
                        let v585 = v584 <> v578 
                        let v586 = " cells="
                        let v587 = v585 <> v586 
                        let v588 = 0
                        let v589 = method20(v583, v588)
                        let v590 = string.inspect(v589)
                        let v591 = v587 <> v590 
                        let v592 = "\n  concurrent="
                        let v593 = v591 <> v592 
                        let v594 = dict.get(v112, v578)
                        let v595 = method370()
                        let v596 = method371()
                        let v597 = case v594 { Ok(x) -> v595(x) Error(x) -> v596(x) }
                        let v604 =
                            case v597  {
                                Us77Error -> Us78None
                                Us77Ok(v598, v599, v600) -> Us78Some(v598, v599, v600)
                            }
                        let v623 =
                            case v604  {
                                Us78None -> {
                                    let v621 = "nil"
                                    v621
                                }
                                Us78Some(v605, v606, v607) -> {
                                    let v608 = "%{out: \""
                                    let v609 = v608 <> v607 
                                    let v610 = "\", status: :"
                                    let v611 = v609 <> v610 
                                    let v617 =
                                        case v606  {
                                            Us45Crashed -> {
                                                let v614 = "crash"
                                                v614
                                            }
                                            Us45Done -> {
                                                let v612 = "ok"
                                                v612
                                            }
                                            Us45Erred -> {
                                                let v613 = "error"
                                                v613
                                            }
                                        }
                                    let v618 = v611 <> v617 
                                    let v619 = "}"
                                    let v620 = v618 <> v619 
                                    v620
                                }
                            }
                        let v624 = v593 <> v623 
                        let v625 = "\n  sequential="
                        let v626 = v624 <> v625 
                        let #(v627, v628) = v1(v583)
                        let v629 = "%{out: \""
                        let v630 = v629 <> v628 
                        let v631 = "\", status: :"
                        let v632 = v630 <> v631 
                        let v638 =
                            case v627  {
                                Us45Crashed -> {
                                    let v635 = "crash"
                                    v635
                                }
                                Us45Done -> {
                                    let v633 = "ok"
                                    v633
                                }
                                Us45Erred -> {
                                    let v634 = "error"
                                    v634
                                }
                            }
                        let v639 = v632 <> v638 
                        let v640 = "}"
                        let v641 = v639 <> v640 
                        let v642 = v626 <> v641 
                        let v643 = v580 <> v642 
                        #(v643, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v436)
                    }
                    _ -> {
                        let #(v644, v645, v646, v647, v648, v649, v650, v651, v652, v653, v654, v655, v656, v657, v658, v659, v660, v661, v662, v663, v664, v665, v666, v667, v668, v669, v670, v671, v672, v673, v674, v675, v676, v677, v678, v679, v680, v681) =
                            case v577  {
                                Uh3Nil -> #(v575, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v436)
                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                            }
                        #(v644, v645, v646, v647, v648, v649, v650, v651, v652, v653, v654, v655, v656, v657, v658, v659, v660, v661, v662, v663, v664, v665, v666, v667, v668, v669, v670, v671, v672, v673, v674, v675, v676, v677, v678, v679, v680, v681)
                    }
                }
            let v720 = Uh32Cons(v682, v683, v684, v685, v686, v687, v688, v689, v690, v691, v692, v693, v694, v695, v696, v697, v698, v699, v700, v701, v702, v703, v704, v705, v706, v707, v708, v709, v710, v711, v712, v713, v714, v715, v716, v717, v718, v719, v31)
            outcomes_from_364(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v35, v720)
        }
    }
}

pub fn method384(v0: Uh32, v1: Uh3) -> Uh3 {
    case v0  {
        Uh32Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40) -> {
            let v41 = method384(v40, v1)
            Uh3Cons(v2, v41)
        }
        Uh32Nil -> v1
    }
}

pub fn method385(v0: Uh32, v1: Uh34) -> Uh34 {
    case v0  {
        Uh32Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40) -> {
            let v41 = method385(v40, v1)
            Uh34Cons(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v41)
        }
        Uh32Nil -> v1
    }
}

pub fn method386(v0: Uh32, v1: Uh35) -> Uh35 {
    case v0  {
        Uh32Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40) -> {
            let v41 = method386(v40, v1)
            Uh35Cons(v39, v41)
        }
        Uh32Nil -> v1
    }
}
