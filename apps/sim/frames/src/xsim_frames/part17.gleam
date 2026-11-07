import gleam/bit_array
import gleam/dict
import gleam/erlang/atom
import gleam/int
import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Us2, type Us12, type Us13, type Uh6, type Uh8, type Uh9, type Uh10, type Uh15, type Us29, type Us30, type Us45, type Uh28, type Uh32, type Uh34, type Uh35, Uh0Nil, Uh1Nil, Uh2Nil, Uh32Cons, Uh32Nil, Uh33Nil, Uh34Cons, Uh34Nil, Uh35Cons, Uh35Nil, Uh3Cons, Uh3Nil, Uh6Cons, Uh6Nil, Uh7Nil, Us12Broken, Us12Held, Us13BreakingEditsFail, Us13NoStaleResults, Us13OneCompilePerPrefix, Us13SequentialEquivalence, Us13UnwantedResultsFreed, Us13WithdrawnDemandHidden, Us21Error, Us21Ok, Us2Some, Us30NoEviction, Us45Crashed, Us45Done, Us45Erred, Us56Error, Us56Ok, Us80Error, Us80Ok, Us81Error, Us81Ok, Us82None, Us82Some}
import xsim_frames/part1.{dictm_term_sorted, method18, method4, spiral_fs_coerce, spiral_fs_read_file, spiral_fs_write_file, spiral_wrap_signed, split_list_2}
import xsim_frames/part11.{chain_sources_283, method295}
import xsim_frames/part16.{closure91, method369, method370, method371, method372, method373, method374, method375, method377, method378, method379, method380, method381, method383, method384, method385, method386, method387}
import xsim_frames/part2.{delimited_21, method20, method30, method32, method33, method36, method37, method40, method43, taken_31}
import xsim_frames/part3.{method45, method48, method54, method55, method79}
import xsim_frames/part4.{from_corpus_61, method96}
import xsim_frames/part5.{decoded_stream_122, deliveries_129, stream_115}
import xsim_frames/part6.{exploded_138}
import xsim_frames/part9.{method258, method259}

pub fn outcomes_from_368(v0: fn(Uh3) -> #(Us45, String), v1: fn(Uh3) -> #(Us45, String), v2: Bool, v3: fn(Int) -> Uh3, v4: fn(Nil) -> Int, v5: fn(Nil) -> Int, v6: fn(Int) -> fn(fn(Uh3) -> #(Us45, String)) -> fn(#(Bool, Bool, Us30, Bool, Int)) -> fn(Uh15) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, Int), v7: Uh3, v8: String, v9: Int, v10: Int, v11: Int, v12: String, v13: Bool, v14: Int, v15: Int, v16: Int, v17: Int, v18: Int, v19: String, v20: String, v21: Us29, v22: Int, v23: Us30, v24: Int, v25: Bool, v26: Bool, v27: Uh9, v28: Uh10, v29: Uh3, v30: Uh10, v31: Int, v32: Uh32) -> Uh32 {
    let v33 = v31 > v17
    case v33 {
        True -> {
            method369(v32, Uh32Nil)
        }
        False -> {
            let v36 = spiral_wrap_signed(v31 + 1, 32)
            let v37 = v19 != ""
            let v66 =
                case v37 {
                    True -> {
                        let v38 = spiral_fs_read_file(v19)
                        let v39 = method370()
                        let v40 = method371()
                        let v41 = case v38 { Ok(x) -> v39(x) Error(x) -> v40(x) }
                        let v54 =
                            case v41  {
                                Us80Error(v51) -> panic as "file_system.read_all_text: file:read_file failed"
                                Us80Ok(v42) -> {
                                    let v43 = bit_array.to_string(v42)
                                    let v44 = method258()
                                    let v45 = method259()
                                    let v46 = case v43 { Ok(x) -> v44(x) Error(x) -> v45(x) }
                                    case v46  {
                                        Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                        Us56Ok(v47) -> v47
                                    }
                                }
                            }
                        let v55 = decoded_stream_122(v54)
                        case v55  {
                            Us21Error(v57) -> {
                                let v58 = { "xsim: --replay " } <> { v19 }
                                let v59 = { v58 } <> { ": " }
                                let v60 = { v59 } <> { v57 }
                                panic as v60
                            }
                            Us21Ok(v56) -> v56
                        }
                    }
                    False -> {
                        deliveries_129(v30, v31, v18, 6)
                    }
                }
            let v67 = v20 != ""
            case v67 {
                True -> {
                    let v68 = int.to_string(v31)
                    let v70 = v20 |> string.replace("{schedule}", v68)
                    let v71 = stream_115(v66)
                    let v72 = spiral_fs_write_file(v70, v71)
                    let v73 = spiral_fs_coerce(v72)
                    let v75 = atom.create("ok")
                    let v76 = v73 == v75
                    let v77 = v76 == False
                    case v77 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                }
                False -> Nil
            }
            let v78 = v4(Nil)
            let v79 = v5(Nil)
            let v80 = v6(v24)
            let v81 = v80(v0)
            let v82 = v81(#(True, False, v23, False, v22))
            let #(v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119) = v82(v66)
            let v120 = v5(Nil)
            let v121 = spiral_wrap_signed(v120 - v79, 32)
            let v122 = v119 > v78
            let v123 =
                case v122 {
                    True -> v119
                    False -> v78
                }
            let v124 = v4(Nil)
            let v125 = v124 > v123
            let v126 =
                case v125 {
                    True -> v124
                    False -> v123
                }
            let v128 = method79(v27, 0)
            let v130 = method96(v30, 0)
            let v132 = method372(v66, 0)
            let v133 = dict.keys(v112)
            let v134 = dictm_term_sorted(v133)
            let listm_fold = v134 |> list.fold (Uh3Nil, fn (acc, x) {
            let v136 = x
            let v137 = acc
            Uh3Cons(v136, v137)
            })
            let v139 = listm_fold
            let v141 = method4(v139, Uh3Nil)
            let v143 = method373(v112, v141, Uh0Nil)
            let v144 = dict.new()
            let v145 = dict.keys(v89)
            let v146 = dictm_term_sorted(v145)
            let listm_fold = v146 |> list.fold (Uh3Nil, fn (acc, x) {
            let v148 = x
            let v149 = acc
            Uh3Cons(v148, v149)
            })
            let v151 = listm_fold
            let v153 = method4(v151, Uh3Nil)
            let v154 = method295(v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v89, v153, v144)
            let v155 = dict.keys(v154)
            let v156 = dictm_term_sorted(v155)
            let listm_fold = v156 |> list.fold (Uh3Nil, fn (acc, x) {
            let v158 = x
            let v159 = acc
            Uh3Cons(v158, v159)
            })
            let v161 = listm_fold
            let v163 = method4(v161, Uh3Nil)
            let v165 = method377(v154, v163, Uh1Nil)
            let v166 = dict.keys(v104)
            let v167 = dictm_term_sorted(v166)
            let listm_fold = v167 |> list.fold (Uh3Nil, fn (acc, x) {
            let v169 = x
            let v170 = acc
            Uh3Cons(v169, v170)
            })
            let v172 = listm_fold
            let v174 = method4(v172, Uh3Nil)
            let v176 = method378(v104, v174, Uh2Nil)
            let v177 = dict.keys(v105)
            let v178 = dictm_term_sorted(v177)
            let listm_fold = v178 |> list.fold (Uh3Nil, fn (acc, x) {
            let v180 = x
            let v181 = acc
            Uh3Cons(v180, v181)
            })
            let v183 = listm_fold
            let v185 = method4(v183, Uh3Nil)
            let v187 = method378(v105, v185, Uh2Nil)
            let v188 = dict.keys(v106)
            let v189 = dictm_term_sorted(v188)
            let listm_fold = v189 |> list.fold (Uh3Nil, fn (acc, x) {
            let v191 = x
            let v192 = acc
            Uh3Cons(v191, v192)
            })
            let v194 = listm_fold
            let v196 = method4(v194, Uh3Nil)
            let v198 = method378(v106, v196, Uh2Nil)
            let v199 = dict.keys(v98)
            let v200 = dictm_term_sorted(v199)
            let listm_fold = v200 |> list.fold (Uh3Nil, fn (acc, x) {
            let v202 = x
            let v203 = acc
            Uh3Cons(v202, v203)
            })
            let v205 = listm_fold
            let v206 =
                case v115  {
                    Us30NoEviction -> False
                    _ -> True
                }
            let v208 = method379(v143, v165, v176, v187, v198, v205, v206, v143, Uh0Nil)
            let v210 = method380(v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v1, v208, Uh33Nil)
            let v211 = dict.keys(v112)
            let v212 = dictm_term_sorted(v211)
            let listm_fold = v212 |> list.fold (Uh3Nil, fn (acc, x) {
            let v214 = x
            let v215 = acc
            Uh3Cons(v214, v215)
            })
            let v217 = listm_fold
            let v219 = method4(v217, Uh3Nil)
            let v221 = method373(v112, v219, Uh0Nil)
            let v222 = dict.new()
            let v223 = dict.keys(v89)
            let v224 = dictm_term_sorted(v223)
            let listm_fold = v224 |> list.fold (Uh3Nil, fn (acc, x) {
            let v226 = x
            let v227 = acc
            Uh3Cons(v226, v227)
            })
            let v229 = listm_fold
            let v231 = method4(v229, Uh3Nil)
            let v232 = method295(v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v89, v231, v222)
            let v233 = dict.keys(v232)
            let v234 = dictm_term_sorted(v233)
            let listm_fold = v234 |> list.fold (Uh3Nil, fn (acc, x) {
            let v236 = x
            let v237 = acc
            Uh3Cons(v236, v237)
            })
            let v239 = listm_fold
            let v241 = method4(v239, Uh3Nil)
            let v243 = method377(v232, v241, Uh1Nil)
            let v244 = dict.keys(v104)
            let v245 = dictm_term_sorted(v244)
            let listm_fold = v245 |> list.fold (Uh3Nil, fn (acc, x) {
            let v247 = x
            let v248 = acc
            Uh3Cons(v247, v248)
            })
            let v250 = listm_fold
            let v252 = method4(v250, Uh3Nil)
            let v254 = method378(v104, v252, Uh2Nil)
            let v255 = dict.keys(v105)
            let v256 = dictm_term_sorted(v255)
            let listm_fold = v256 |> list.fold (Uh3Nil, fn (acc, x) {
            let v258 = x
            let v259 = acc
            Uh3Cons(v258, v259)
            })
            let v261 = listm_fold
            let v263 = method4(v261, Uh3Nil)
            let v265 = method378(v105, v263, Uh2Nil)
            let v266 = dict.keys(v106)
            let v267 = dictm_term_sorted(v266)
            let listm_fold = v267 |> list.fold (Uh3Nil, fn (acc, x) {
            let v269 = x
            let v270 = acc
            Uh3Cons(v269, v270)
            })
            let v272 = listm_fold
            let v274 = method4(v272, Uh3Nil)
            let v276 = method378(v106, v274, Uh2Nil)
            let v277 = dict.keys(v98)
            let v278 = dictm_term_sorted(v277)
            let listm_fold = v278 |> list.fold (Uh3Nil, fn (acc, x) {
            let v280 = x
            let v281 = acc
            Uh3Cons(v280, v281)
            })
            let v283 = listm_fold
            let v284 =
                case v115  {
                    Us30NoEviction -> False
                    _ -> True
                }
            let v286 = method381(v221, v243, v254, v265, v276, v283, v284, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v210, v1, v221, Uh0Nil)
            let v288 = method30(v286, Uh3Nil)
            let v293 =
                case v288  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v291 = taken_31(5, v288)
                        Us12Broken(v291)
                    }
                }
            let v295 = method32(v221, v243, v254, v265, v276, v283, v284, v221, Uh0Nil)
            let v297 = method30(v295, Uh3Nil)
            let v302 =
                case v297  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v300 = taken_31(5, v297)
                        Us12Broken(v300)
                    }
                }
            let v304 = method33(v221, v243, v254, v265, v276, v283, v284, v254, Uh2Nil)
            let v306 = method36(v304, Uh3Nil)
            let v311 =
                case v306  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v309 = taken_31(5, v306)
                        Us12Broken(v309)
                    }
                }
            let v313 = method37(v221, v243, v254, v265, v276, v283, v284, v221, Uh0Nil)
            let v315 = method30(v313, Uh3Nil)
            let v320 =
                case v315  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v318 = taken_31(5, v315)
                        Us12Broken(v318)
                    }
                }
            let v348 =
                case v284 {
                    True -> {
                        let v322 = method40(v221, v243, v254, v265, v276, v283, v284, v283, Uh3Nil)
                        let v327 =
                            case v322  {
                                Uh3Nil -> Us12Held
                                _ -> {
                                    let v325 = taken_31(5, v322)
                                    Us12Broken(v325)
                                }
                            }
                        let v334 = Uh6Cons(Us13UnwantedResultsFreed, v327, Uh6Nil)
                        let v335 = Uh6Cons(Us13WithdrawnDemandHidden, v320, v334)
                        let v336 = Uh6Cons(Us13OneCompilePerPrefix, v311, v335)
                        let v337 = Uh6Cons(Us13NoStaleResults, v302, v336)
                        Uh6Cons(Us13SequentialEquivalence, v293, v337)
                    }
                    False -> {
                        let v344 = Uh6Cons(Us13WithdrawnDemandHidden, v320, Uh6Nil)
                        let v345 = Uh6Cons(Us13OneCompilePerPrefix, v311, v344)
                        let v346 = Uh6Cons(Us13NoStaleResults, v302, v345)
                        Uh6Cons(Us13SequentialEquivalence, v293, v346)
                    }
                }
            let v438 =
                case v2 {
                    True -> {
                        let v349 = dict.new()
                        let v350 = method383(v29, v349)
                        let v351 = dict.keys(v112)
                        let v352 = dictm_term_sorted(v351)
                        let listm_fold = v352 |> list.fold (Uh3Nil, fn (acc, x) {
                        let v354 = x
                        let v355 = acc
                        Uh3Cons(v354, v355)
                        })
                        let v357 = listm_fold
                        let v359 = method4(v357, Uh3Nil)
                        let v361 = method373(v112, v359, Uh0Nil)
                        let v362 = dict.new()
                        let v363 = dict.keys(v89)
                        let v364 = dictm_term_sorted(v363)
                        let listm_fold = v364 |> list.fold (Uh3Nil, fn (acc, x) {
                        let v366 = x
                        let v367 = acc
                        Uh3Cons(v366, v367)
                        })
                        let v369 = listm_fold
                        let v371 = method4(v369, Uh3Nil)
                        let v372 = method295(v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v89, v371, v362)
                        let v373 = dict.keys(v372)
                        let v374 = dictm_term_sorted(v373)
                        let listm_fold = v374 |> list.fold (Uh3Nil, fn (acc, x) {
                        let v376 = x
                        let v377 = acc
                        Uh3Cons(v376, v377)
                        })
                        let v379 = listm_fold
                        let v381 = method4(v379, Uh3Nil)
                        let _v383 = method377(v372, v381, Uh1Nil)
                        let v384 = dict.keys(v104)
                        let v385 = dictm_term_sorted(v384)
                        let listm_fold = v385 |> list.fold (Uh3Nil, fn (acc, x) {
                        let v387 = x
                        let v388 = acc
                        Uh3Cons(v387, v388)
                        })
                        let v390 = listm_fold
                        let v392 = method4(v390, Uh3Nil)
                        let _v394 = method378(v104, v392, Uh2Nil)
                        let v395 = dict.keys(v105)
                        let v396 = dictm_term_sorted(v395)
                        let listm_fold = v396 |> list.fold (Uh3Nil, fn (acc, x) {
                        let v398 = x
                        let v399 = acc
                        Uh3Cons(v398, v399)
                        })
                        let v401 = listm_fold
                        let v403 = method4(v401, Uh3Nil)
                        let _v405 = method378(v105, v403, Uh2Nil)
                        let v406 = dict.keys(v106)
                        let v407 = dictm_term_sorted(v406)
                        let listm_fold = v407 |> list.fold (Uh3Nil, fn (acc, x) {
                        let v409 = x
                        let v410 = acc
                        Uh3Cons(v409, v410)
                        })
                        let v412 = listm_fold
                        let v414 = method4(v412, Uh3Nil)
                        let _v416 = method378(v106, v414, Uh2Nil)
                        let v417 = dict.keys(v98)
                        let v418 = dictm_term_sorted(v417)
                        let listm_fold = v418 |> list.fold (Uh3Nil, fn (acc, x) {
                        let v420 = x
                        let v421 = acc
                        Uh3Cons(v420, v421)
                        })
                        let _v423 = listm_fold
                        let v426 = method384(v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v350, v361, Uh0Nil)
                        let v428 = method30(v426, Uh3Nil)
                        let v433 =
                            case v428  {
                                Uh3Nil -> Us12Held
                                _ -> {
                                    let v431 = taken_31(5, v428)
                                    Us12Broken(v431)
                                }
                            }
                        let v436 = Uh6Cons(Us13BreakingEditsFail, v433, Uh6Nil)
                        method385(v348, v436)
                    }
                    False -> v348
                }
            let v439 = " "
            let v440 = dict.keys(v104)
            let v441 = dictm_term_sorted(v440)
            let listm_fold = v441 |> list.fold (Uh3Nil, fn (acc, x) {
            let v443 = x
            let v444 = acc
            Uh3Cons(v443, v444)
            })
            let v446 = listm_fold
            let v448 = method4(v446, Uh3Nil)
            let v450 = method386(v104, v448, 0)
            let v451 = int.to_string(v450)
            let v452 = { "starts=" } <> { v451 }
            let v453 = dict.size(v98)
            let v454 = int.to_string(v453)
            let v455 = { "prefixes=" } <> { v454 }
            let v456 = int.to_string(v111)
            let v457 = { "peak_results=" } <> { v456 }
            let v458 = dict.keys(v106)
            let v459 = dictm_term_sorted(v458)
            let listm_fold = v459 |> list.fold (Uh3Nil, fn (acc, x) {
            let v461 = x
            let v462 = acc
            Uh3Cons(v461, v462)
            })
            let v464 = listm_fold
            let v466 = method4(v464, Uh3Nil)
            let v468 = method386(v106, v466, 0)
            let v469 = int.to_string(v468)
            let v470 = { "evictions=" } <> { v469 }
            let v471 = int.to_string(v108)
            let v472 = { "rescues=" } <> { v471 }
            let v473 = int.to_string(v109)
            let v474 = { "recomputes=" } <> { v473 }
            let v475 = int.to_string(v107)
            let v476 = { "cancels=" } <> { v475 }
            let v477 = dict.size(v112)
            let v478 = int.to_string(v477)
            let v479 = { "visible=" } <> { v478 }
            let v480 = int.to_string(v110)
            let v481 = { "peak_inflight=" } <> { v480 }
            let v482 = int.to_string(v126)
            let v483 = { "peak_beam_mb=" } <> { v482 }
            let v484 = int.to_string(v121)
            let v485 = { "ms=" } <> { v484 }
            let v486 = int.to_string(v14)
            let v487 = { "seed=" } <> { v486 }
            let v488 = int.to_string(v31)
            let v489 = { "schedule=" } <> { v488 }
            let v490 = int.to_string(v128)
            let v491 = { "posts=" } <> { v490 }
            let v492 = int.to_string(v130)
            let v493 = { "events=" } <> { v492 }
            let v494 = int.to_string(v132)
            let v495 = { "deliveries=" } <> { v494 }
            let v496 = int.to_string(v94)
            let v497 = { "duplicates=" } <> { v496 }
            let v498 = int.to_string(v95)
            let v499 = { "buffered=" } <> { v498 }
            let v500 = int.to_string(v92)
            let v501 = { "framed=" } <> { v500 }
            let v502 = int.to_string(v93)
            let v503 = { "framed_edits=" } <> { v502 }
            let v505 = Uh3Cons(v485, Uh3Nil)
            let v506 = Uh3Cons(v483, v505)
            let v507 = Uh3Cons(v481, v506)
            let v508 = Uh3Cons(v479, v507)
            let v509 = Uh3Cons(v476, v508)
            let v510 = Uh3Cons(v474, v509)
            let v511 = Uh3Cons(v472, v510)
            let v512 = Uh3Cons(v470, v511)
            let v513 = Uh3Cons(v457, v512)
            let v514 = Uh3Cons(v455, v513)
            let v515 = Uh3Cons(v452, v514)
            let v516 = Uh3Cons(v503, v515)
            let v517 = Uh3Cons(v501, v516)
            let v518 = Uh3Cons(v499, v517)
            let v519 = Uh3Cons(v497, v518)
            let v520 = Uh3Cons(v495, v519)
            let v521 = Uh3Cons(v493, v520)
            let v522 = Uh3Cons(v491, v521)
            let v523 = Uh3Cons(v489, v522)
            let v524 = Uh3Cons(v487, v523)
            let v525 = delimited_21(v439, v524)
            let v526 = { "XSIM " } <> { v525 }
            let v527 = { v526 } <> { " " }
            let v529 = method43(v438, Uh3Nil)
            let v530 = delimited_21(v439, v529)
            let v531 = { v527 } <> { v530 }
            let v532 = { v531 } <> { "\n" }
            let v533 = { "schedule=\"" } <> { v488 }
            let v534 = { v533 } <> { "\"" }
            let v535 = { "seed=\"" } <> { v486 }
            let v536 = { v535 } <> { "\"" }
            let v537 = ","
            let v539 = Uh3Cons(v534, Uh3Nil)
            let v540 = Uh3Cons(v536, v539)
            let v541 = delimited_21(v537, v540)
            let v542 = { "x_sim_run_ms{" } <> { v541 }
            let v543 = { v542 } <> { "} " }
            let v544 = { v543 } <> { v484 }
            let v545 = { v544 } <> { "\n" }
            let v547 = Uh3Cons(v534, Uh3Nil)
            let v548 = Uh3Cons(v536, v547)
            let v549 = delimited_21(v537, v548)
            let v550 = { "x_sim_deliveries_total{" } <> { v549 }
            let v551 = { v550 } <> { "} " }
            let v552 = { v551 } <> { v494 }
            let v553 = { v545 } <> { v552 }
            let v554 = { v532 } <> { v553 }
            let v556 = v3(v31)
            let v557 = Uh3Cons(v554, v556)
            let v558 = delimited_21("\n", v557)
            let v560 = method387(v438, Uh3Nil)
            let #(v655, v656, v657, v658, v659, v660, v661, v662, v663, v664, v665, v666, v667, v668, v669, v670, v671, v672, v673, v674, v675, v676, v677, v678, v679, v680, v681, v682, v683, v684, v685, v686, v687, v688, v689, v690, v691, v692) =
                case v560  {
                    Uh3Cons(v561, v562) -> {
                        let v563 = { v558 } <> { "\n" }
                        let v564 = Us2Some(v561)
                        let v566 = chain_sources_283(v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v564, Uh3Nil)
                        let v567 = { "XSIM explain " } <> { v561 }
                        let v568 = { v567 } <> { " cells=" }
                        let v570 = method20(v566, 0)
                        let v571 = int.to_string(v570)
                        let v572 = { v568 } <> { v571 }
                        let v573 = { v572 } <> { "\n  concurrent=" }
                        let v574 = dict.get(v112, v561)
                        let v575 = method374()
                        let v576 = method375()
                        let v577 = case v574 { Ok(x) -> v575(x) Error(x) -> v576(x) }
                        let v584 =
                            case v577  {
                                Us81Error -> Us82None
                                Us81Ok(v578, v579, v580) -> Us82Some(v578, v579, v580)
                            }
                        let v600 =
                            case v584  {
                                Us82None -> {
                                    "nil"
                                }
                                Us82Some(v585, v586, v587) -> {
                                    let v588 = { "%{out: \"" } <> { v587 }
                                    let v589 = { v588 } <> { "\", status: :" }
                                    let v595 =
                                        case v586  {
                                            Us45Crashed -> {
                                                "crash"
                                            }
                                            Us45Done -> {
                                                "ok"
                                            }
                                            Us45Erred -> {
                                                "error"
                                            }
                                        }
                                    let v596 = { v589 } <> { v595 }
                                    let v597 = { v596 } <> { "}" }
                                    v597
                                }
                            }
                        let v601 = { v573 } <> { v600 }
                        let v602 = { v601 } <> { "\n  sequential=" }
                        let #(v603, v604) = v1(v566)
                        let v605 = { "%{out: \"" } <> { v604 }
                        let v606 = { v605 } <> { "\", status: :" }
                        let v612 =
                            case v603  {
                                Us45Crashed -> {
                                    "crash"
                                }
                                Us45Done -> {
                                    "ok"
                                }
                                Us45Erred -> {
                                    "error"
                                }
                            }
                        let v613 = { v606 } <> { v612 }
                        let v614 = { v613 } <> { "}" }
                        let v615 = { v602 } <> { v614 }
                        let v616 = { v563 } <> { v615 }
                        #(v616, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v438)
                    }
                    _ -> {
                        let #(v617, v618, v619, v620, v621, v622, v623, v624, v625, v626, v627, v628, v629, v630, v631, v632, v633, v634, v635, v636, v637, v638, v639, v640, v641, v642, v643, v644, v645, v646, v647, v648, v649, v650, v651, v652, v653, v654) =
                            case v560  {
                                Uh3Nil -> #(v558, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v438)
                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                            }
                        #(v617, v618, v619, v620, v621, v622, v623, v624, v625, v626, v627, v628, v629, v630, v631, v632, v633, v634, v635, v636, v637, v638, v639, v640, v641, v642, v643, v644, v645, v646, v647, v648, v649, v650, v651, v652, v653, v654)
                    }
                }
            let v693 = Uh32Cons(v655, v656, v657, v658, v659, v660, v661, v662, v663, v664, v665, v666, v667, v668, v669, v670, v671, v672, v673, v674, v675, v676, v677, v678, v679, v680, v681, v682, v683, v684, v685, v686, v687, v688, v689, v690, v691, v692, v32)
            outcomes_from_368(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v36, v693)
        }
    }
}

pub fn method388(v0: Uh32, v1: Uh3) -> Uh3 {
    case v0  {
        Uh32Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40) -> {
            let v41 = method388(v40, v1)
            Uh3Cons(v2, v41)
        }
        Uh32Nil -> v1
    }
}

pub fn method389(v0: Uh32, v1: Uh34) -> Uh34 {
    case v0  {
        Uh32Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40) -> {
            let v41 = method389(v40, v1)
            Uh34Cons(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v41)
        }
        Uh32Nil -> v1
    }
}

pub fn method390(v0: Uh32, v1: Uh35) -> Uh35 {
    case v0  {
        Uh32Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40) -> {
            let v41 = method390(v40, v1)
            Uh35Cons(v39, v41)
        }
        Uh32Nil -> v1
    }
}

pub fn commuted_runs_391(v0: Uh34) -> Us12 {
    case v0  {
        Uh34Cons(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37) -> {
            case v37  {
                Uh34Cons(v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74) -> {
                    let v75 = dict.keys(v30)
                    let v76 = dictm_term_sorted(v75)
                    let listm_fold = v76 |> list.fold (Uh3Nil, fn (acc, x) {
                    let v78 = x
                    let v79 = acc
                    Uh3Cons(v78, v79)
                    })
                    let v81 = listm_fold
                    let v83 = method4(v81, Uh3Nil)
                    let v85 = method373(v30, v83, Uh0Nil)
                    let v86 = dict.new()
                    let v87 = dict.keys(v7)
                    let v88 = dictm_term_sorted(v87)
                    let listm_fold = v88 |> list.fold (Uh3Nil, fn (acc, x) {
                    let v90 = x
                    let v91 = acc
                    Uh3Cons(v90, v91)
                    })
                    let v93 = listm_fold
                    let v95 = method4(v93, Uh3Nil)
                    let v96 = method295(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v7, v95, v86)
                    let v97 = dict.keys(v96)
                    let v98 = dictm_term_sorted(v97)
                    let listm_fold = v98 |> list.fold (Uh3Nil, fn (acc, x) {
                    let v100 = x
                    let v101 = acc
                    Uh3Cons(v100, v101)
                    })
                    let v103 = listm_fold
                    let v105 = method4(v103, Uh3Nil)
                    let _v107 = method377(v96, v105, Uh1Nil)
                    let v108 = dict.keys(v22)
                    let v109 = dictm_term_sorted(v108)
                    let listm_fold = v109 |> list.fold (Uh3Nil, fn (acc, x) {
                    let v111 = x
                    let v112 = acc
                    Uh3Cons(v111, v112)
                    })
                    let v114 = listm_fold
                    let v116 = method4(v114, Uh3Nil)
                    let _v118 = method378(v22, v116, Uh2Nil)
                    let v119 = dict.keys(v23)
                    let v120 = dictm_term_sorted(v119)
                    let listm_fold = v120 |> list.fold (Uh3Nil, fn (acc, x) {
                    let v122 = x
                    let v123 = acc
                    Uh3Cons(v122, v123)
                    })
                    let v125 = listm_fold
                    let v127 = method4(v125, Uh3Nil)
                    let _v129 = method378(v23, v127, Uh2Nil)
                    let v130 = dict.keys(v24)
                    let v131 = dictm_term_sorted(v130)
                    let listm_fold = v131 |> list.fold (Uh3Nil, fn (acc, x) {
                    let v133 = x
                    let v134 = acc
                    Uh3Cons(v133, v134)
                    })
                    let v136 = listm_fold
                    let v138 = method4(v136, Uh3Nil)
                    let _v140 = method378(v24, v138, Uh2Nil)
                    let v141 = dict.keys(v16)
                    let v142 = dictm_term_sorted(v141)
                    let listm_fold = v142 |> list.fold (Uh3Nil, fn (acc, x) {
                    let v144 = x
                    let v145 = acc
                    Uh3Cons(v144, v145)
                    })
                    let _v147 = listm_fold
                    let v149 = dict.keys(v67)
                    let v150 = dictm_term_sorted(v149)
                    let listm_fold = v150 |> list.fold (Uh3Nil, fn (acc, x) {
                    let v152 = x
                    let v153 = acc
                    Uh3Cons(v152, v153)
                    })
                    let v155 = listm_fold
                    let v157 = method4(v155, Uh3Nil)
                    let v159 = method373(v67, v157, Uh0Nil)
                    let v160 = dict.new()
                    let v161 = dict.keys(v44)
                    let v162 = dictm_term_sorted(v161)
                    let listm_fold = v162 |> list.fold (Uh3Nil, fn (acc, x) {
                    let v164 = x
                    let v165 = acc
                    Uh3Cons(v164, v165)
                    })
                    let v167 = listm_fold
                    let v169 = method4(v167, Uh3Nil)
                    let v170 = method295(v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v44, v169, v160)
                    let v171 = dict.keys(v170)
                    let v172 = dictm_term_sorted(v171)
                    let listm_fold = v172 |> list.fold (Uh3Nil, fn (acc, x) {
                    let v174 = x
                    let v175 = acc
                    Uh3Cons(v174, v175)
                    })
                    let v177 = listm_fold
                    let v179 = method4(v177, Uh3Nil)
                    let v181 = method377(v170, v179, Uh1Nil)
                    let v182 = dict.keys(v59)
                    let v183 = dictm_term_sorted(v182)
                    let listm_fold = v183 |> list.fold (Uh3Nil, fn (acc, x) {
                    let v185 = x
                    let v186 = acc
                    Uh3Cons(v185, v186)
                    })
                    let v188 = listm_fold
                    let v190 = method4(v188, Uh3Nil)
                    let v192 = method378(v59, v190, Uh2Nil)
                    let v193 = dict.keys(v60)
                    let v194 = dictm_term_sorted(v193)
                    let listm_fold = v194 |> list.fold (Uh3Nil, fn (acc, x) {
                    let v196 = x
                    let v197 = acc
                    Uh3Cons(v196, v197)
                    })
                    let v199 = listm_fold
                    let v201 = method4(v199, Uh3Nil)
                    let v203 = method378(v60, v201, Uh2Nil)
                    let v204 = dict.keys(v61)
                    let v205 = dictm_term_sorted(v204)
                    let listm_fold = v205 |> list.fold (Uh3Nil, fn (acc, x) {
                    let v207 = x
                    let v208 = acc
                    Uh3Cons(v207, v208)
                    })
                    let v210 = listm_fold
                    let v212 = method4(v210, Uh3Nil)
                    let v214 = method378(v61, v212, Uh2Nil)
                    let v215 = dict.keys(v53)
                    let v216 = dictm_term_sorted(v215)
                    let listm_fold = v216 |> list.fold (Uh3Nil, fn (acc, x) {
                    let v218 = x
                    let v219 = acc
                    Uh3Cons(v218, v219)
                    })
                    let v221 = listm_fold
                    let v222 =
                        case v70  {
                            Us30NoEviction -> False
                            _ -> True
                        }
                    let v224 = method45(v159, v181, v192, v203, v214, v221, v222, v85, Uh0Nil)
                    let v226 = method30(v224, Uh3Nil)
                    let v231 =
                        case v226  {
                            Uh3Nil -> Us12Held
                            _ -> {
                                let v229 = taken_31(5, v226)
                                Us12Broken(v229)
                            }
                        }
                    let v241 =
                        case v231  {
                            Us12Held -> {
                                let v233 = method48(v85, 0)
                                let v235 = method48(v159, 0)
                                let v236 = v233 == v235
                                case v236 {
                                    True -> Us12Held
                                    False -> {
                                        Us12Broken(Uh3Nil)
                                    }
                                }
                            }
                            _ -> v231
                        }
                    case v241  {
                        Us12Held -> {
                            let v242 = Uh34Cons(v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74)
                            commuted_runs_391(v242)
                        }
                        _ -> v241
                    }
                }
                _ -> Us12Held
            }
        }
        _ -> Us12Held
    }
}

pub fn closure107(capt: Nil) -> fn(#(Us13, Us12)) -> Bool {
    fn (dom) {
        let #(_v0, v1) = dom
        case v1  {
            Us12Held -> False
            _ -> True
        }
    }
}

pub fn method393() -> fn(#(Us13, Us12)) -> Bool {
    closure107(Nil)
}

pub fn method394(v0: fn(#(Us13, Us12)) -> Bool, v1: Uh6) -> Bool {
    case v1  {
        Uh6Cons(v2, v3, v4) -> {
            let v5 = v0(#(v2, v3))
            case v5 {
                True -> True
                False -> {
                    let v6 = method393()
                    method394(v6, v4)
                }
            }
        }
        Uh6Nil -> False
    }
}

pub fn closure106(capt: Nil) -> fn(Uh6) -> Bool {
    fn (v0) {
        let v1 = method393()
        let v2 = method394(v1, v0)
        let v3 = v2 == False
        v3 == False
    }
}

pub fn method392() -> fn(Uh6) -> Bool {
    closure106(Nil)
}

pub fn method395(v0: fn(Uh6) -> Bool, v1: Uh35) -> Bool {
    case v1  {
        Uh35Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method392()
                    method395(v5, v3)
                }
            }
        }
        Uh35Nil -> False
    }
}

pub fn simulated_by_308(v0: fn(Uh3) -> #(Us45, String), v1: fn(Uh3) -> #(Us45, String), v2: Bool, v3: fn(Int) -> Uh3, v4: fn(Nil) -> Int, v5: fn(Nil) -> Int, v6: fn(Int) -> fn(fn(Uh3) -> #(Us45, String)) -> fn(#(Bool, Bool, Us30, Bool, Int)) -> fn(Uh15) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, Int), v7: Uh3, v8: String, v9: Int, v10: Int, v11: Int, v12: String, v13: Bool, v14: Int, v15: Int, v16: Int, v17: Int, v18: Int, v19: String, v20: String, v21: Us29, v22: Int, v23: Us30, v24: Int, v25: Bool, v26: Bool, v27: Uh8) -> Uh3 {
    let v28 = ","
    let v29 = "+"
    let v30 = v12 |> string.replace(v28, v29)
    let v31 = v30 == ""
    let v34 =
        case v31 {
            True -> Uh3Nil
            False -> split_list_2(v29, v30)
        }
    let v36 = method54(v34, Uh3Nil)
    let v38 = method55(v36, Uh7Nil)
    let #(v40, v41, v42) = from_corpus_61(v14, v15, v16, v10, v11, v38, False, v27)
    let v46 =
        case v13 {
            True -> {
                let v43 = closure91(Nil)
                exploded_138(v43, 280, v41)
            }
            False -> v41
        }
    let v49 = outcomes_from_368(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v40, v41, v42, v46, 1, Uh32Nil)
    let v51 = method388(v49, Uh3Nil)
    let v53 = method389(v49, Uh34Nil)
    let v55 = method390(v49, Uh35Nil)
    let v56 = commuted_runs_391(v53)
    let v57 = method392()
    let v58 = method395(v57, v55)
    let v59 = v58 == False
    let v61 =
        case v59 {
            True -> {
                case v56  {
                    Us12Held -> True
                    _ -> False
                }
            }
            False -> False
        }
    let v68 =
        case v56  {
            Us12Broken(v63) -> {
                let v64 = delimited_21(v28, v63)
                let v65 = { "FAIL[" } <> { v64 }
                let v66 = { v65 } <> { "]" }
                v66
            }
            Us12Held -> {
                "ok"
            }
        }
    let v69 = { "XSIM commute=" } <> { v68 }
    let v70 = { v69 } <> { " result=" }
    let v73 =
        case v61 {
            True -> {
                "pass"
            }
            False -> {
                "fail"
            }
        }
    let v74 = { v70 } <> { v73 }
    let v76 = Uh3Cons(v74, Uh3Nil)
    method18(v51, v76)
}
