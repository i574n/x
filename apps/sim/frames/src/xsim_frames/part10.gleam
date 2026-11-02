import gleam/bit_array
import gleam/dict
import gleam/string
import xsim_frames/types.{type Uh3, type Us2, type Us16, type Uh13, type Us29, type Us30, type Us31, type Us33, type Us45, type Us48, type Us50, type Us52, type Us54, type Us56, Sha256, Uh13Cons, Uh13Nil, Uh3Cons, Uh3Nil, Us16Content, Us17Posted, Us29CellsExecutor, Us29FakeExecutor, Us29LeakingExecutor, Us2None, Us2Some, Us30EvictAfter, Us31None, Us31Some, Us33Error, Us33Ok, Us34None, Us34Some, Us35None, Us35Some, Us36RunParsed, Us36RunRejected, Us37CorpusBreaking, Us37CorpusCells, Us37CorpusChurn, Us38None, Us38Some, Us39ScheduleEdits, Us39ScheduleRounds, Us39ScheduleSeed, Us39ScheduleUsers, Us3None, Us3Some, Us40None, Us40Some, Us41None, Us41Some, Us42RunnerConcurrency, Us42RunnerGrace, Us42RunnerPace, Us43None, Us43Some, Us44None, Us44Some, Us45Done, Us48Error, Us48Ok, Us50Error, Us50Ok, Us51None, Us51Some, Us52Error, Us52Ok, Us54Error, Us54Ok, Us56Error, Us56Ok}
import xsim_frames/part1.{count_of_text_10, spiral_crypto_hash, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part2.{delimited_21}
import xsim_frames/part9.{method235}

pub fn closure34(capt: #(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool, String)) -> fn(String) -> Us33 {
    fn (v21) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20) = capt
        let v22 = v20 == "spi"
        let v32 =
            case v22 {
                True -> {
                    let v23 = v21 == ""
                    let v27 =
                        case v23 {
                            True -> Uh3Nil
                            False -> {
                                let v25 = ","
                                split_list_2(v25, v21)
                            }
                        }
                    let v28 = Uh3Nil
                    let v29 = method235(v27, v28)
                    Us34Some(v29, v1, v2, v3, v4, v5, v6)
                }
                False -> Us34None
            }
        let v33 = v20 == "spi-file"
        let v39 =
            case v33 {
                True -> Us34Some(v0, v21, v2, v3, v4, v5, v6)
                False -> {
                    let v35 = v20 == "personas"
                    case v35 {
                        True -> Us34Some(v0, v1, v2, v3, v4, v21, v6)
                        False -> Us34None
                    }
                }
            }
        let v48 =
            case v32  {
                Us34None -> v39
                Us34Some(v40, v41, v42, v43, v44, v45, v46) -> v32
            }
        let v60 =
            case v48  {
                Us34None -> Us35None
                Us34Some(v49, v50, v51, v52, v53, v54, v55) -> {
                    let v56 = Us36RunParsed(v49, v50, v51, v52, v53, v54, v55, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
                    Us35Some(v56)
                }
            }
        let v61 = v20 == "cells"
        let v73 =
            case v61 {
                True -> {
                    let v62 = Us37CorpusCells
                    Us38Some(v62)
                }
                False -> {
                    let v64 = v20 == "breaking"
                    case v64 {
                        True -> {
                            let v65 = Us37CorpusBreaking
                            Us38Some(v65)
                        }
                        False -> {
                            let v67 = v20 == "churn"
                            case v67 {
                                True -> {
                                    let v68 = Us37CorpusChurn
                                    Us38Some(v68)
                                }
                                False -> Us38None
                            }
                        }
                    }
                }
            }
        let v112 =
            case v73  {
                Us38None -> Us35None
                Us38Some(v74) -> {
                    let v75 = count_of_text_10(v21)
                    let v108 =
                        case v75  {
                            Us3None -> {
                                let v99 = "--"
                                let v100 = v99 <> v20 
                                let v101 = " takes a whole number, got '"
                                let v102 = v100 <> v101 
                                let v103 = v102 <> v21 
                                let v104 = "'"
                                let v105 = v103 <> v104 
                                Us36RunRejected(v105)
                            }
                            Us3Some(v76) -> {
                                let #(v91, v92, v93, v94, v95, v96, v97) =
                                    case v74  {
                                        Us37CorpusCells -> #(v0, v1, v76, v3, v4, v5, v6)
                                        _ -> {
                                            let #(v84, v85, v86, v87, v88, v89, v90) =
                                                case v74  {
                                                    Us37CorpusBreaking -> #(v0, v1, v2, v76, v4, v5, v6)
                                                    _ -> {
                                                        let #(v77, v78, v79, v80, v81, v82, v83) =
                                                            case v74  {
                                                                Us37CorpusChurn -> #(v0, v1, v2, v3, v76, v5, v6)
                                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                            }
                                                        #(v77, v78, v79, v80, v81, v82, v83)
                                                    }
                                                }
                                            #(v84, v85, v86, v87, v88, v89, v90)
                                        }
                                    }
                                Us36RunParsed(v91, v92, v93, v94, v95, v96, v97, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
                            }
                        }
                    Us35Some(v108)
                }
            }
        let v115 =
            case v60  {
                Us35None -> v112
                Us35Some(v113) -> v60
            }
        let v116 = v20 == "seed"
        let v132 =
            case v116 {
                True -> {
                    let v117 = Us39ScheduleSeed
                    Us40Some(v117)
                }
                False -> {
                    let v119 = v20 == "users"
                    case v119 {
                        True -> {
                            let v120 = Us39ScheduleUsers
                            Us40Some(v120)
                        }
                        False -> {
                            let v122 = v20 == "edits"
                            case v122 {
                                True -> {
                                    let v123 = Us39ScheduleEdits
                                    Us40Some(v123)
                                }
                                False -> {
                                    let v125 = v20 == "schedules"
                                    case v125 {
                                        True -> {
                                            let v126 = Us39ScheduleRounds
                                            Us40Some(v126)
                                        }
                                        False -> Us40None
                                    }
                                }
                            }
                        }
                    }
                }
            }
        let v178 =
            case v132  {
                Us40None -> Us35None
                Us40Some(v133) -> {
                    let v134 = count_of_text_10(v21)
                    let v174 =
                        case v134  {
                            Us3None -> {
                                let v165 = "--"
                                let v166 = v165 <> v20 
                                let v167 = " takes a whole number, got '"
                                let v168 = v166 <> v167 
                                let v169 = v168 <> v21 
                                let v170 = "'"
                                let v171 = v169 <> v170 
                                Us36RunRejected(v171)
                            }
                            Us3Some(v135) -> {
                                let #(v157, v158, v159, v160, v161, v162, v163) =
                                    case v133  {
                                        Us39ScheduleSeed -> #(v135, v8, v9, v10, v11, v12, v13)
                                        _ -> {
                                            let #(v150, v151, v152, v153, v154, v155, v156) =
                                                case v133  {
                                                    Us39ScheduleUsers -> #(v7, v135, v9, v10, v11, v12, v13)
                                                    _ -> {
                                                        let #(v143, v144, v145, v146, v147, v148, v149) =
                                                            case v133  {
                                                                Us39ScheduleEdits -> #(v7, v8, v135, v10, v11, v12, v13)
                                                                _ -> {
                                                                    let #(v136, v137, v138, v139, v140, v141, v142) =
                                                                        case v133  {
                                                                            Us39ScheduleRounds -> #(v7, v8, v9, v135, v11, v12, v13)
                                                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                        }
                                                                    #(v136, v137, v138, v139, v140, v141, v142)
                                                                }
                                                            }
                                                        #(v143, v144, v145, v146, v147, v148, v149)
                                                    }
                                                }
                                            #(v150, v151, v152, v153, v154, v155, v156)
                                        }
                                    }
                                Us36RunParsed(v0, v1, v2, v3, v4, v5, v6, v157, v158, v159, v160, v161, v162, v163, v14, v15, v16, v17, v18, v19)
                            }
                        }
                    Us35Some(v174)
                }
            }
        let v179 = v20 == "duplicates"
        let v252 =
            case v179 {
                True -> {
                    let v180 = v21 == ""
                    let v184 =
                        case v180 {
                            True -> Uh3Nil
                            False -> {
                                let v182 = "."
                                split_list_2(v182, v21)
                            }
                        }
                    let v222 =
                        case v184  {
                            Uh3Cons(v185, v186) -> {
                                case v186  {
                                    Uh3Cons(v194, v195) -> {
                                        case v195  {
                                            Uh3Nil -> {
                                                let v196 = v185 == ""
                                                let v198 =
                                                    case v196 {
                                                        True -> {
                                                            let v197 = "0"
                                                            v197
                                                        }
                                                        False -> v185
                                                    }
                                                let v199 = count_of_text_10(v198)
                                                let v200 = "000"
                                                let v201 = v194 <> v200 
                                                let v202 = spiral_string_slice(v201, 0, 2)
                                                let v203 = count_of_text_10(v202)
                                                case v199  {
                                                    Us3Some(v204) -> {
                                                        case v203  {
                                                            Us3Some(v205) -> {
                                                                let v206 = spiral_string_length(v194)
                                                                let v207 = v206 <= 3
                                                                case v207 {
                                                                    True -> {
                                                                        let v208 = spiral_wrap_signed(v204 * 1000, 32)
                                                                        let v209 = spiral_wrap_signed(v208 + v205, 32)
                                                                        Us3Some(v209)
                                                                    }
                                                                    False -> Us3None
                                                                }
                                                            }
                                                            _ -> Us3None
                                                        }
                                                    }
                                                    _ -> Us3None
                                                }
                                            }
                                            _ -> Us3None
                                        }
                                    }
                                    Uh3Nil -> {
                                        let v187 = count_of_text_10(v185)
                                        case v187  {
                                            Us3None -> Us3None
                                            Us3Some(v188) -> {
                                                let v189 = spiral_wrap_signed(v188 * 1000, 32)
                                                Us3Some(v189)
                                            }
                                        }
                                    }
                                }
                            }
                            _ -> Us3None
                        }
                    let v231 =
                        case v222  {
                            Us3None -> {
                                let v225 = "--duplicates takes a decimal like 0.1, got '"
                                let v226 = v225 <> v21 
                                let v227 = "'"
                                let v228 = v226 <> v227 
                                Us36RunRejected(v228)
                            }
                            Us3Some(v223) -> Us36RunParsed(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v223, v12, v13, v14, v15, v16, v17, v18, v19)
                        }
                    Us35Some(v231)
                }
                False -> {
                    let v233 = v20 == "replay"
                    let v239 =
                        case v233 {
                            True -> Us41Some(v7, v8, v9, v10, v11, v21, v13)
                            False -> {
                                let v235 = v20 == "save"
                                case v235 {
                                    True -> Us41Some(v7, v8, v9, v10, v11, v12, v21)
                                    False -> Us41None
                                }
                            }
                        }
                    case v239  {
                        Us41None -> Us35None
                        Us41Some(v240, v241, v242, v243, v244, v245, v246) -> {
                            let v247 = Us36RunParsed(v0, v1, v2, v3, v4, v5, v6, v240, v241, v242, v243, v244, v245, v246, v14, v15, v16, v17, v18, v19)
                            Us35Some(v247)
                        }
                    }
                }
            }
        let v255 =
            case v178  {
                Us35None -> v252
                Us35Some(v253) -> v178
            }
        let v256 = v20 == "max-concurrency"
        let v268 =
            case v256 {
                True -> {
                    let v257 = Us42RunnerConcurrency
                    Us43Some(v257)
                }
                False -> {
                    let v259 = v20 == "pace-ms"
                    case v259 {
                        True -> {
                            let v260 = Us42RunnerPace
                            Us43Some(v260)
                        }
                        False -> {
                            let v262 = v20 == "evict-grace"
                            case v262 {
                                True -> {
                                    let v263 = Us42RunnerGrace
                                    Us43Some(v263)
                                }
                                False -> Us43None
                            }
                        }
                    }
                }
            }
        let v305 =
            case v268  {
                Us43None -> Us35None
                Us43Some(v269) -> {
                    let v270 = count_of_text_10(v21)
                    let v301 =
                        case v270  {
                            Us3None -> {
                                let v292 = "--"
                                let v293 = v292 <> v20 
                                let v294 = " takes a whole number, got '"
                                let v295 = v293 <> v294 
                                let v296 = v295 <> v21 
                                let v297 = "'"
                                let v298 = v296 <> v297 
                                Us36RunRejected(v298)
                            }
                            Us3Some(v271) -> {
                                let #(v285, v286, v287, v288, v289, v290) =
                                    case v269  {
                                        Us42RunnerConcurrency -> #(v14, v271, v16, v17, v18, v19)
                                        _ -> {
                                            let #(v279, v280, v281, v282, v283, v284) =
                                                case v269  {
                                                    Us42RunnerPace -> #(v14, v15, v16, v271, v18, v19)
                                                    _ -> {
                                                        let #(v273, v274, v275, v276, v277, v278) =
                                                            case v269  {
                                                                Us42RunnerGrace -> {
                                                                    let v272 = Us30EvictAfter(v271)
                                                                    #(v14, v15, v272, v17, v18, v19)
                                                                }
                                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                            }
                                                        #(v273, v274, v275, v276, v277, v278)
                                                    }
                                                }
                                            #(v279, v280, v281, v282, v283, v284)
                                        }
                                    }
                                Us36RunParsed(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v285, v286, v287, v288, v289, v290)
                            }
                        }
                    Us35Some(v301)
                }
            }
        let v306 = v20 == "executor"
        let v331 =
            case v306 {
                True -> {
                    let v307 = v21 == "fake"
                    let v319 =
                        case v307 {
                            True -> {
                                let v308 = Us29FakeExecutor
                                Us44Some(v308)
                            }
                            False -> {
                                let v310 = v21 == "fake-leak"
                                case v310 {
                                    True -> {
                                        let v311 = Us29LeakingExecutor
                                        Us44Some(v311)
                                    }
                                    False -> {
                                        let v313 = v21 == "cells"
                                        case v313 {
                                            True -> {
                                                let v314 = Us29CellsExecutor
                                                Us44Some(v314)
                                            }
                                            False -> Us44None
                                        }
                                    }
                                }
                            }
                        }
                    let v328 =
                        case v319  {
                            Us44None -> {
                                let v322 = "--executor is fake, fake-leak or cells, got '"
                                let v323 = v322 <> v21 
                                let v324 = "'"
                                let v325 = v323 <> v324 
                                Us36RunRejected(v325)
                            }
                            Us44Some(v320) -> Us36RunParsed(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v320, v15, v16, v17, v18, v19)
                        }
                    Us35Some(v328)
                }
                False -> Us35None
            }
        let v334 =
            case v305  {
                Us35None -> v331
                Us35Some(v332) -> v305
            }
        let v337 =
            case v255  {
                Us35None -> v334
                Us35Some(v335) -> v255
            }
        let v340 =
            case v115  {
                Us35None -> v337
                Us35Some(v338) -> v115
            }
        let v346 =
            case v340  {
                Us35None -> {
                    let v342 = "unknown option --"
                    let v343 = v342 <> v20 
                    Us36RunRejected(v343)
                }
                Us35Some(v341) -> v341
            }
        case v346  {
            Us36RunParsed(v347, v348, v349, v350, v351, v352, v353, v354, v355, v356, v357, v358, v359, v360, v361, v362, v363, v364, v365, v366) -> Us33Ok(v347, v348, v349, v350, v351, v352, v353, v354, v355, v356, v357, v358, v359, v360, v361, v362, v363, v364, v365, v366)
            Us36RunRejected(v368) -> Us33Error(v368)
        }
    }
}

pub fn closure33(capt: #(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> fn(String) -> Us33 {
    fn (v20) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19) = capt
        closure34(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20))
    }
}

pub fn closure32(capt: Nil) -> fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> fn(String) -> Us33 {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19) = dom
        closure33(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19))
    }
}

pub fn valued_then_238(v0: fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> Us31, v1: fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> fn(String) -> Us33, v2: Uh3, v3: String, v4: Int, v5: Int, v6: Int, v7: String, v8: Bool, v9: Int, v10: Int, v11: Int, v12: Int, v13: Int, v14: String, v15: String, v16: Us29, v17: Int, v18: Us30, v19: Int, v20: Bool, v21: Bool, v22: String, v23: Uh3) -> Us33 {
    case v23  {
        Uh3Cons(v24, v25) -> {
            let v26 = v1(#(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21))
            let v27 = "--"
            let v28 = v22 |> string.starts_with(v27)
            let v35 =
                case v28 {
                    True -> {
                        let v29 = spiral_string_length(v22)
                        let v30 = spiral_wrap_signed(v29 - 2, 32)
                        let v31 = spiral_wrap_signed(2 + v30, 32)
                        let v32 = spiral_wrap_signed(v31 - 1, 32)
                        let v33 = spiral_string_slice(v22, 2, v32)
                        v33
                    }
                    False -> {
                        let v34 = ""
                        v34
                    }
                }
            let v36 = v26(v35)
            let v37 = v36(v24)
            continued_239(v0, v1, v37, v25)
        }
        Uh3Nil -> {
            let v39 = "--"
            let v40 = v22 |> string.starts_with(v39)
            let v47 =
                case v40 {
                    True -> {
                        let v41 = spiral_string_length(v22)
                        let v42 = spiral_wrap_signed(v41 - 2, 32)
                        let v43 = spiral_wrap_signed(2 + v42, 32)
                        let v44 = spiral_wrap_signed(v43 - 1, 32)
                        let v45 = spiral_string_slice(v22, 2, v44)
                        v45
                    }
                    False -> {
                        let v46 = ""
                        v46
                    }
                }
            let v48 = v39 <> v47 
            let v49 = " needs a value"
            let v50 = v48 <> v49 
            Us33Error(v50)
        }
    }
}

pub fn arg_parsed_237(v0: fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> Us31, v1: fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> fn(String) -> Us33, v2: Uh3, v3: String, v4: Int, v5: Int, v6: Int, v7: String, v8: Bool, v9: Int, v10: Int, v11: Int, v12: Int, v13: Int, v14: String, v15: String, v16: Us29, v17: Int, v18: Us30, v19: Int, v20: Bool, v21: Bool, v22: String, v23: Uh3) -> Us33 {
    let v24 = v0(#(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21))
    let v25 = "--"
    let v26 = v22 |> string.starts_with(v25)
    let v33 =
        case v26 {
            True -> {
                let v27 = spiral_string_length(v22)
                let v28 = spiral_wrap_signed(v27 - 2, 32)
                let v29 = spiral_wrap_signed(2 + v28, 32)
                let v30 = spiral_wrap_signed(v29 - 1, 32)
                let v31 = spiral_string_slice(v22, 2, v30)
                v31
            }
            False -> {
                let v32 = ""
                v32
            }
        }
    let v34 = v24(v33)
    case v34  {
        Us31None -> valued_then_238(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23)
        Us31Some(v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54) -> flags_parsed_236(v0, v1, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v23)
    }
}

pub fn flags_parsed_236(v0: fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> Us31, v1: fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> fn(String) -> Us33, v2: Uh3, v3: String, v4: Int, v5: Int, v6: Int, v7: String, v8: Bool, v9: Int, v10: Int, v11: Int, v12: Int, v13: Int, v14: String, v15: String, v16: Us29, v17: Int, v18: Us30, v19: Int, v20: Bool, v21: Bool, v22: Uh3) -> Us33 {
    case v22  {
        Uh3Cons(v24, v25) -> {
            let v26 = "--"
            let v27 = v24 |> string.starts_with(v26)
            let v34 =
                case v27 {
                    True -> {
                        let v28 = spiral_string_length(v24)
                        let v29 = spiral_wrap_signed(v28 - 2, 32)
                        let v30 = spiral_wrap_signed(2 + v29, 32)
                        let v31 = spiral_wrap_signed(v30 - 1, 32)
                        let v32 = spiral_string_slice(v24, 2, v31)
                        v32
                    }
                    False -> {
                        let v33 = ""
                        v33
                    }
                }
            let v35 = v34 == ""
            case v35 {
                True -> {
                    let v36 = "unexpected argument '"
                    let v37 = v36 <> v24 
                    let v38 = "'"
                    let v39 = v37 <> v38 
                    Us33Error(v39)
                }
                False -> arg_parsed_237(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v24, v25)
            }
        }
        Uh3Nil -> Us33Ok(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21)
    }
}

pub fn continued_239(v0: fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> Us31, v1: fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> fn(String) -> Us33, v2: Us33, v3: Uh3) -> Us33 {
    case v2  {
        Us33Error(v25) -> Us33Error(v25)
        Us33Ok(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23) -> flags_parsed_236(v0, v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v3)
    }
}

pub fn hash_text_240(v0: String) -> String {
    let v1 = string.lowercase(bit_array.base16_encode(spiral_crypto_hash(Sha256, v0)))
    v1
}

pub fn closure35(capt: Nil) -> fn(Uh3) -> #(Us45, String) {
    fn (v0) {
        let v1 = unicode_erlang_characters_to_binary([0])
        let v2 = delimited_21(v1, v0)
        let v3 = hash_text_240(v2)
        let v4 = spiral_string_slice(v3, 0, 11)
        let v5 = Us45Done
        #(v5, v4)
    }
}

pub fn closure36(capt: Nil) -> fn(Uh3) -> #(Us45, String) {
    fn (v0) {
        let v1 = unicode_erlang_characters_to_binary([0])
        let v2 = delimited_21(v1, v0)
        let v3 = hash_text_240(v2)
        let v4 = spiral_string_slice(v3, 0, 11)
        let v5 = Us45Done
        #(v5, v4)
    }
}

pub fn closure37(capt: Nil) -> fn(Int) -> Uh3 {
    fn (v0) {
        Uh3Nil
    }
}

pub fn quiet_c38(capt: Nil) -> fn(Nil) -> Int {
    fn (dom) {
        0
    }
}

pub fn closure43(capt: #(String, Us2, Int, Int, String)) -> fn(String) -> Us16 {
    fn (v5) {
        let #(v0, v1, _v2, _v3, _v4) = capt
        let v6 = Us17Posted(v0, v1, v5)
        Us16Content(v6)
    }
}

pub fn closure44(capt: Nil) -> fn(#(Int, Int, Int, Int)) -> #(Int, Int, Int, Int) {
    fn (dom) {
        let #(v0, v1, v2, v3) = dom
        let v4 = spiral_wrap_signed(v0 + 1, 32)
        #(v4, v1, v2, v3)
    }
}

pub fn ok_c45(capt: Nil) -> fn(#(dict.Dict(Int, #(Int, Int, String)), Int)) -> Us48 {
    fn (dom) {
        let #(v0, v1) = dom
        Us48Ok(v0, v1)
    }
}

pub fn method246() -> fn(#(dict.Dict(Int, #(Int, Int, String)), Int)) -> Us48 {
    ok_c45(Nil)
}

pub fn error_c46(capt: Nil) -> fn(Nil) -> Us48 {
    fn (dom) {
        Us48Error
    }
}

pub fn method247() -> fn(Nil) -> Us48 {
    error_c46(Nil)
}

pub fn ok_c47(capt: Nil) -> fn(#(Int, Int, String)) -> Us50 {
    fn (dom) {
        let #(v0, v1, v2) = dom
        Us50Ok(v0, v1, v2)
    }
}

pub fn method251() -> fn(#(Int, Int, String)) -> Us50 {
    ok_c47(Nil)
}

pub fn error_c48(capt: Nil) -> fn(Nil) -> Us50 {
    fn (dom) {
        Us50Error
    }
}

pub fn method252() -> fn(Nil) -> Us50 {
    error_c48(Nil)
}

pub fn method250(v0: Int, v1: dict.Dict(Int, #(Int, Int, String)), v2: Int) -> Uh3 {
    let v3 = v2 < v0
    case v3 {
        True -> {
            let v4 = spiral_wrap_signed(v2 + 1, 32)
            let v5 = dict.get(v1, v4)
            let v6 = method251()
            let v7 = method252()
            let v8 = case v5 { Ok(x) -> v6(x) Error(x) -> v7(x) }
            let v15 =
                case v8  {
                    Us50Error -> Us51None
                    Us50Ok(v9, v10, v11) -> Us51Some(v9, v10, v11)
                }
            let #(_v25, _v26, v27) =
                case v15  {
                    Us51Some(v16, v17, v18) -> #(v16, v17, v18)
                    _ -> {
                        let #(v22, v23, v24) =
                            case v15  {
                                Us51None -> panic as "dict.present: the key is not in the dict"
                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                            }
                        #(v22, v23, v24)
                    }
                }
            let v28 = method250(v0, v1, v4)
            Uh3Cons(v27, v28)
        }
        False -> Uh3Nil
    }
}

pub fn ok_c49(capt: Nil) -> fn(Uh3) -> Us52 {
    fn (v0) {
        Us52Ok(v0)
    }
}

pub fn method254() -> fn(Uh3) -> Us52 {
    ok_c49(Nil)
}

pub fn error_c50(capt: Nil) -> fn(Nil) -> Us52 {
    fn (dom) {
        Us52Error
    }
}

pub fn method255() -> fn(Nil) -> Us52 {
    error_c50(Nil)
}

pub fn ok_c51(capt: Nil) -> fn(#(Us2, dict.Dict(Int, String), Bool)) -> Us54 {
    fn (dom) {
        let #(v0, v1, v2) = dom
        Us54Ok(v0, v1, v2)
    }
}

pub fn method257() -> fn(#(Us2, dict.Dict(Int, String), Bool)) -> Us54 {
    ok_c51(Nil)
}

pub fn error_c52(capt: Nil) -> fn(Nil) -> Us54 {
    fn (dom) {
        Us54Error
    }
}

pub fn method258() -> fn(Nil) -> Us54 {
    error_c52(Nil)
}

pub fn ok_c53(capt: Nil) -> fn(String) -> Us56 {
    fn (v0) {
        Us56Ok(v0)
    }
}

pub fn method259() -> fn(String) -> Us56 {
    ok_c53(Nil)
}

pub fn error_c54(capt: Nil) -> fn(Nil) -> Us56 {
    fn (dom) {
        Us56Error
    }
}

pub fn method260() -> fn(Nil) -> Us56 {
    error_c54(Nil)
}

pub fn method261(v0: Uh13, v1: Uh13) -> Uh13 {
    case v0  {
        Uh13Cons(v2, v3) -> {
            let v4 = Uh13Cons(v2, v1)
            method261(v3, v4)
        }
        Uh13Nil -> v1
    }
}

pub fn method262(v0: dict.Dict(Int, String), v1: Uh13, v2: Int) -> Int {
    case v1  {
        Uh13Cons(v3, v4) -> {
            let v5 = dict.get(v0, v3)
            let v6 = method259()
            let v7 = method260()
            let v8 = case v5 { Ok(x) -> v6(x) Error(x) -> v7(x) }
            let v13 =
                case v8  {
                    Us56Error -> Us2None
                    Us56Ok(v9) -> Us2Some(v9)
                }
            let _v17 =
                case v13  {
                    Us2None -> panic as "dict.present: the key is not in the dict"
                    Us2Some(v14) -> v14
                }
            let v18 = v3 > v2
            let v19 =
                case v18 {
                    True -> v3
                    False -> v2
                }
            method262(v0, v4, v19)
        }
        Uh13Nil -> v2
    }
}
