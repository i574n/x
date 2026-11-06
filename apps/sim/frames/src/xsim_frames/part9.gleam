import gleam/bit_array
import gleam/dict
import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Us2, type Us16, type Uh14, type Uh16, type Us29, type Us30, type Us31, type Us33, type Us45, type Us48, type Us50, type Us52, type Us54, type Us56, type Us57, type Us59, Sha256, Uh14Cons, Uh14Nil, Uh3Cons, Uh3Nil, Us16Content, Us17Posted, Us29CellsExecutor, Us29FakeExecutor, Us29LeakingExecutor, Us2None, Us2Some, Us30EvictAfter, Us31None, Us31Some, Us33Error, Us33Ok, Us34None, Us34Some, Us35None, Us35Some, Us36RunParsed, Us36RunRejected, Us37CorpusBreaking, Us37CorpusCells, Us37CorpusChurn, Us38None, Us38Some, Us39ScheduleEdits, Us39ScheduleRounds, Us39ScheduleSeed, Us39ScheduleUsers, Us3None, Us3Some, Us40None, Us40Some, Us41None, Us41Some, Us42RunnerConcurrency, Us42RunnerGrace, Us42RunnerPace, Us43None, Us43Some, Us44None, Us44Some, Us45Done, Us48Error, Us48Ok, Us50Error, Us50Ok, Us51None, Us51Some, Us52Error, Us52Ok, Us53None, Us53Some, Us54Error, Us54Ok, Us55None, Us55Some, Us56Error, Us56Ok, Us57Error, Us57Ok, Us59Error, Us59Ok}
import xsim_frames/part1.{count_of_text_10, dictm_term_sorted, spiral_crypto_hash, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part2.{delimited_21}
import xsim_frames/part8.{method236}

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
                                split_list_2(",", v21)
                            }
                        }
                    let v29 = method236(v27, Uh3Nil)
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
                    Us38Some(Us37CorpusCells)
                }
                False -> {
                    let v64 = v20 == "breaking"
                    case v64 {
                        True -> {
                            Us38Some(Us37CorpusBreaking)
                        }
                        False -> {
                            let v67 = v20 == "churn"
                            case v67 {
                                True -> {
                                    Us38Some(Us37CorpusChurn)
                                }
                                False -> Us38None
                            }
                        }
                    }
                }
            }
        let v109 =
            case v73  {
                Us38None -> Us35None
                Us38Some(v74) -> {
                    let v75 = count_of_text_10(v21)
                    let v105 =
                        case v75  {
                            Us3None -> {
                                let v99 = { "--" } <> { v20 }
                                let v100 = { v99 } <> { " takes a whole number, got '" }
                                let v101 = { v100 } <> { v21 }
                                let v102 = { v101 } <> { "'" }
                                Us36RunRejected(v102)
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
                    Us35Some(v105)
                }
            }
        let v112 =
            case v60  {
                Us35None -> v109
                Us35Some(v110) -> v60
            }
        let v113 = v20 == "seed"
        let v129 =
            case v113 {
                True -> {
                    Us40Some(Us39ScheduleSeed)
                }
                False -> {
                    let v116 = v20 == "users"
                    case v116 {
                        True -> {
                            Us40Some(Us39ScheduleUsers)
                        }
                        False -> {
                            let v119 = v20 == "edits"
                            case v119 {
                                True -> {
                                    Us40Some(Us39ScheduleEdits)
                                }
                                False -> {
                                    let v122 = v20 == "schedules"
                                    case v122 {
                                        True -> {
                                            Us40Some(Us39ScheduleRounds)
                                        }
                                        False -> Us40None
                                    }
                                }
                            }
                        }
                    }
                }
            }
        let v172 =
            case v129  {
                Us40None -> Us35None
                Us40Some(v130) -> {
                    let v131 = count_of_text_10(v21)
                    let v168 =
                        case v131  {
                            Us3None -> {
                                let v162 = { "--" } <> { v20 }
                                let v163 = { v162 } <> { " takes a whole number, got '" }
                                let v164 = { v163 } <> { v21 }
                                let v165 = { v164 } <> { "'" }
                                Us36RunRejected(v165)
                            }
                            Us3Some(v132) -> {
                                let #(v154, v155, v156, v157, v158, v159, v160) =
                                    case v130  {
                                        Us39ScheduleSeed -> #(v132, v8, v9, v10, v11, v12, v13)
                                        _ -> {
                                            let #(v147, v148, v149, v150, v151, v152, v153) =
                                                case v130  {
                                                    Us39ScheduleUsers -> #(v7, v132, v9, v10, v11, v12, v13)
                                                    _ -> {
                                                        let #(v140, v141, v142, v143, v144, v145, v146) =
                                                            case v130  {
                                                                Us39ScheduleEdits -> #(v7, v8, v132, v10, v11, v12, v13)
                                                                _ -> {
                                                                    let #(v133, v134, v135, v136, v137, v138, v139) =
                                                                        case v130  {
                                                                            Us39ScheduleRounds -> #(v7, v8, v9, v132, v11, v12, v13)
                                                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                        }
                                                                    #(v133, v134, v135, v136, v137, v138, v139)
                                                                }
                                                            }
                                                        #(v140, v141, v142, v143, v144, v145, v146)
                                                    }
                                                }
                                            #(v147, v148, v149, v150, v151, v152, v153)
                                        }
                                    }
                                Us36RunParsed(v0, v1, v2, v3, v4, v5, v6, v154, v155, v156, v157, v158, v159, v160, v14, v15, v16, v17, v18, v19)
                            }
                        }
                    Us35Some(v168)
                }
            }
        let v173 = v20 == "duplicates"
        let v243 =
            case v173 {
                True -> {
                    let v174 = v21 == ""
                    let v178 =
                        case v174 {
                            True -> Uh3Nil
                            False -> {
                                split_list_2(".", v21)
                            }
                        }
                    let v215 =
                        case v178  {
                            Uh3Cons(v179, v180) -> {
                                case v180  {
                                    Uh3Cons(v188, v189) -> {
                                        case v189  {
                                            Uh3Nil -> {
                                                let v190 = v179 == ""
                                                let v192 =
                                                    case v190 {
                                                        True -> {
                                                            "0"
                                                        }
                                                        False -> v179
                                                    }
                                                let v193 = count_of_text_10(v192)
                                                let v194 = { v188 } <> { "000" }
                                                let v195 = spiral_string_slice(v194, 0, 2)
                                                let v196 = count_of_text_10(v195)
                                                case v193  {
                                                    Us3Some(v197) -> {
                                                        case v196  {
                                                            Us3Some(v198) -> {
                                                                let v199 = spiral_string_length(v188)
                                                                let v200 = v199 <= 3
                                                                case v200 {
                                                                    True -> {
                                                                        let v201 = spiral_wrap_signed(v197 * 1000, 32)
                                                                        let v202 = spiral_wrap_signed(v201 + v198, 32)
                                                                        Us3Some(v202)
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
                                        let v181 = count_of_text_10(v179)
                                        case v181  {
                                            Us3None -> Us3None
                                            Us3Some(v182) -> {
                                                let v183 = spiral_wrap_signed(v182 * 1000, 32)
                                                Us3Some(v183)
                                            }
                                        }
                                    }
                                }
                            }
                            _ -> Us3None
                        }
                    let v222 =
                        case v215  {
                            Us3None -> {
                                let v218 = { "--duplicates takes a decimal like 0.1, got '" } <> { v21 }
                                let v219 = { v218 } <> { "'" }
                                Us36RunRejected(v219)
                            }
                            Us3Some(v216) -> Us36RunParsed(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v216, v12, v13, v14, v15, v16, v17, v18, v19)
                        }
                    Us35Some(v222)
                }
                False -> {
                    let v224 = v20 == "replay"
                    let v230 =
                        case v224 {
                            True -> Us41Some(v7, v8, v9, v10, v11, v21, v13)
                            False -> {
                                let v226 = v20 == "save"
                                case v226 {
                                    True -> Us41Some(v7, v8, v9, v10, v11, v12, v21)
                                    False -> Us41None
                                }
                            }
                        }
                    case v230  {
                        Us41None -> Us35None
                        Us41Some(v231, v232, v233, v234, v235, v236, v237) -> {
                            let v238 = Us36RunParsed(v0, v1, v2, v3, v4, v5, v6, v231, v232, v233, v234, v235, v236, v237, v14, v15, v16, v17, v18, v19)
                            Us35Some(v238)
                        }
                    }
                }
            }
        let v246 =
            case v172  {
                Us35None -> v243
                Us35Some(v244) -> v172
            }
        let v247 = v20 == "max-concurrency"
        let v259 =
            case v247 {
                True -> {
                    Us43Some(Us42RunnerConcurrency)
                }
                False -> {
                    let v250 = v20 == "pace-ms"
                    case v250 {
                        True -> {
                            Us43Some(Us42RunnerPace)
                        }
                        False -> {
                            let v253 = v20 == "evict-grace"
                            case v253 {
                                True -> {
                                    Us43Some(Us42RunnerGrace)
                                }
                                False -> Us43None
                            }
                        }
                    }
                }
            }
        let v293 =
            case v259  {
                Us43None -> Us35None
                Us43Some(v260) -> {
                    let v261 = count_of_text_10(v21)
                    let v289 =
                        case v261  {
                            Us3None -> {
                                let v283 = { "--" } <> { v20 }
                                let v284 = { v283 } <> { " takes a whole number, got '" }
                                let v285 = { v284 } <> { v21 }
                                let v286 = { v285 } <> { "'" }
                                Us36RunRejected(v286)
                            }
                            Us3Some(v262) -> {
                                let #(v276, v277, v278, v279, v280, v281) =
                                    case v260  {
                                        Us42RunnerConcurrency -> #(v14, v262, v16, v17, v18, v19)
                                        _ -> {
                                            let #(v270, v271, v272, v273, v274, v275) =
                                                case v260  {
                                                    Us42RunnerPace -> #(v14, v15, v16, v262, v18, v19)
                                                    _ -> {
                                                        let #(v264, v265, v266, v267, v268, v269) =
                                                            case v260  {
                                                                Us42RunnerGrace -> {
                                                                    let v263 = Us30EvictAfter(v262)
                                                                    #(v14, v15, v263, v17, v18, v19)
                                                                }
                                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                            }
                                                        #(v264, v265, v266, v267, v268, v269)
                                                    }
                                                }
                                            #(v270, v271, v272, v273, v274, v275)
                                        }
                                    }
                                Us36RunParsed(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v276, v277, v278, v279, v280, v281)
                            }
                        }
                    Us35Some(v289)
                }
            }
        let v294 = v20 == "executor"
        let v317 =
            case v294 {
                True -> {
                    let v295 = v21 == "fake"
                    let v307 =
                        case v295 {
                            True -> {
                                Us44Some(Us29FakeExecutor)
                            }
                            False -> {
                                let v298 = v21 == "fake-leak"
                                case v298 {
                                    True -> {
                                        Us44Some(Us29LeakingExecutor)
                                    }
                                    False -> {
                                        let v301 = v21 == "cells"
                                        case v301 {
                                            True -> {
                                                Us44Some(Us29CellsExecutor)
                                            }
                                            False -> Us44None
                                        }
                                    }
                                }
                            }
                        }
                    let v314 =
                        case v307  {
                            Us44None -> {
                                let v310 = { "--executor is fake, fake-leak or cells, got '" } <> { v21 }
                                let v311 = { v310 } <> { "'" }
                                Us36RunRejected(v311)
                            }
                            Us44Some(v308) -> Us36RunParsed(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v308, v15, v16, v17, v18, v19)
                        }
                    Us35Some(v314)
                }
                False -> Us35None
            }
        let v320 =
            case v293  {
                Us35None -> v317
                Us35Some(v318) -> v293
            }
        let v323 =
            case v246  {
                Us35None -> v320
                Us35Some(v321) -> v246
            }
        let v326 =
            case v112  {
                Us35None -> v323
                Us35Some(v324) -> v112
            }
        let v331 =
            case v326  {
                Us35None -> {
                    let v328 = { "unknown option --" } <> { v20 }
                    Us36RunRejected(v328)
                }
                Us35Some(v327) -> v327
            }
        case v331  {
            Us36RunParsed(v332, v333, v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344, v345, v346, v347, v348, v349, v350, v351) -> Us33Ok(v332, v333, v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344, v345, v346, v347, v348, v349, v350, v351)
            Us36RunRejected(v353) -> Us33Error(v353)
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

pub fn valued_then_239(v0: fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> Us31, v1: fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> fn(String) -> Us33, v2: Uh3, v3: String, v4: Int, v5: Int, v6: Int, v7: String, v8: Bool, v9: Int, v10: Int, v11: Int, v12: Int, v13: Int, v14: String, v15: String, v16: Us29, v17: Int, v18: Us30, v19: Int, v20: Bool, v21: Bool, v22: String, v23: Uh3) -> Us33 {
    case v23  {
        Uh3Cons(v24, v25) -> {
            let v26 = v1(#(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21))
            let v28 = v22 |> string.starts_with("--")
            let v35 =
                case v28 {
                    True -> {
                        let v29 = spiral_string_length(v22)
                        let v30 = spiral_wrap_signed(v29 - 2, 32)
                        let v31 = spiral_wrap_signed(2 + v30, 32)
                        let v32 = spiral_wrap_signed(v31 - 1, 32)
                        spiral_string_slice(v22, 2, v32)
                    }
                    False -> {
                        ""
                    }
                }
            let v36 = v26(v35)
            let v37 = v36(v24)
            continued_240(v0, v1, v37, v25)
        }
        Uh3Nil -> {
            let v40 = v22 |> string.starts_with("--")
            let v47 =
                case v40 {
                    True -> {
                        let v41 = spiral_string_length(v22)
                        let v42 = spiral_wrap_signed(v41 - 2, 32)
                        let v43 = spiral_wrap_signed(2 + v42, 32)
                        let v44 = spiral_wrap_signed(v43 - 1, 32)
                        spiral_string_slice(v22, 2, v44)
                    }
                    False -> {
                        ""
                    }
                }
            let v48 = { "--" } <> { v47 }
            let v49 = { v48 } <> { " needs a value" }
            Us33Error(v49)
        }
    }
}

pub fn arg_parsed_238(v0: fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> Us31, v1: fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> fn(String) -> Us33, v2: Uh3, v3: String, v4: Int, v5: Int, v6: Int, v7: String, v8: Bool, v9: Int, v10: Int, v11: Int, v12: Int, v13: Int, v14: String, v15: String, v16: Us29, v17: Int, v18: Us30, v19: Int, v20: Bool, v21: Bool, v22: String, v23: Uh3) -> Us33 {
    let v24 = v0(#(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21))
    let v26 = v22 |> string.starts_with("--")
    let v33 =
        case v26 {
            True -> {
                let v27 = spiral_string_length(v22)
                let v28 = spiral_wrap_signed(v27 - 2, 32)
                let v29 = spiral_wrap_signed(2 + v28, 32)
                let v30 = spiral_wrap_signed(v29 - 1, 32)
                spiral_string_slice(v22, 2, v30)
            }
            False -> {
                ""
            }
        }
    let v34 = v24(v33)
    case v34  {
        Us31None -> valued_then_239(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23)
        Us31Some(v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54) -> flags_parsed_237(v0, v1, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v23)
    }
}

pub fn flags_parsed_237(v0: fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> Us31, v1: fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> fn(String) -> Us33, v2: Uh3, v3: String, v4: Int, v5: Int, v6: Int, v7: String, v8: Bool, v9: Int, v10: Int, v11: Int, v12: Int, v13: Int, v14: String, v15: String, v16: Us29, v17: Int, v18: Us30, v19: Int, v20: Bool, v21: Bool, v22: Uh3) -> Us33 {
    case v22  {
        Uh3Cons(v24, v25) -> {
            let v27 = v24 |> string.starts_with("--")
            let v34 =
                case v27 {
                    True -> {
                        let v28 = spiral_string_length(v24)
                        let v29 = spiral_wrap_signed(v28 - 2, 32)
                        let v30 = spiral_wrap_signed(2 + v29, 32)
                        let v31 = spiral_wrap_signed(v30 - 1, 32)
                        spiral_string_slice(v24, 2, v31)
                    }
                    False -> {
                        ""
                    }
                }
            let v35 = v34 == ""
            case v35 {
                True -> {
                    let v36 = { "unexpected argument '" } <> { v24 }
                    let v37 = { v36 } <> { "'" }
                    Us33Error(v37)
                }
                False -> arg_parsed_238(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v24, v25)
            }
        }
        Uh3Nil -> Us33Ok(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21)
    }
}

pub fn continued_240(v0: fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> Us31, v1: fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> fn(String) -> Us33, v2: Us33, v3: Uh3) -> Us33 {
    case v2  {
        Us33Error(v25) -> Us33Error(v25)
        Us33Ok(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23) -> flags_parsed_237(v0, v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v3)
    }
}

pub fn hash_text_241(v0: String) -> String {
    string.lowercase(bit_array.base16_encode(spiral_crypto_hash(Sha256, v0)))
}

pub fn closure35(capt: Nil) -> fn(Uh3) -> #(Us45, String) {
    fn (v0) {
        let v1 = unicode_erlang_characters_to_binary([0])
        let v2 = delimited_21(v1, v0)
        let v3 = hash_text_241(v2)
        let v4 = spiral_string_slice(v3, 0, 11)
        #(Us45Done, v4)
    }
}

pub fn closure36(capt: Nil) -> fn(Uh3) -> #(Us45, String) {
    fn (v0) {
        let v1 = unicode_erlang_characters_to_binary([0])
        let v2 = delimited_21(v1, v0)
        let v3 = hash_text_241(v2)
        let v4 = spiral_string_slice(v3, 0, 11)
        #(Us45Done, v4)
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

pub fn method247() -> fn(#(dict.Dict(Int, #(Int, Int, String)), Int)) -> Us48 {
    ok_c45(Nil)
}

pub fn error_c46(capt: Nil) -> fn(Nil) -> Us48 {
    fn (dom) {
        Us48Error
    }
}

pub fn method248() -> fn(Nil) -> Us48 {
    error_c46(Nil)
}

pub fn ok_c47(capt: Nil) -> fn(#(Int, Int, String)) -> Us50 {
    fn (dom) {
        let #(v0, v1, v2) = dom
        Us50Ok(v0, v1, v2)
    }
}

pub fn method252() -> fn(#(Int, Int, String)) -> Us50 {
    ok_c47(Nil)
}

pub fn error_c48(capt: Nil) -> fn(Nil) -> Us50 {
    fn (dom) {
        Us50Error
    }
}

pub fn method253() -> fn(Nil) -> Us50 {
    error_c48(Nil)
}

pub fn method251(v0: Int, v1: dict.Dict(Int, #(Int, Int, String)), v2: Int) -> Uh3 {
    let v3 = v2 < v0
    case v3 {
        True -> {
            let v4 = spiral_wrap_signed(v2 + 1, 32)
            let v5 = dict.get(v1, v4)
            let v6 = method252()
            let v7 = method253()
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
            let v28 = method251(v0, v1, v4)
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

pub fn method255() -> fn(Uh3) -> Us52 {
    ok_c49(Nil)
}

pub fn error_c50(capt: Nil) -> fn(Nil) -> Us52 {
    fn (dom) {
        Us52Error
    }
}

pub fn method256() -> fn(Nil) -> Us52 {
    error_c50(Nil)
}

pub fn ok_c51(capt: Nil) -> fn(#(Us2, dict.Dict(Int, String), Bool)) -> Us54 {
    fn (dom) {
        let #(v0, v1, v2) = dom
        Us54Ok(v0, v1, v2)
    }
}

pub fn method258() -> fn(#(Us2, dict.Dict(Int, String), Bool)) -> Us54 {
    ok_c51(Nil)
}

pub fn error_c52(capt: Nil) -> fn(Nil) -> Us54 {
    fn (dom) {
        Us54Error
    }
}

pub fn method259() -> fn(Nil) -> Us54 {
    error_c52(Nil)
}

pub fn ok_c53(capt: Nil) -> fn(String) -> Us56 {
    fn (v0) {
        Us56Ok(v0)
    }
}

pub fn method260() -> fn(String) -> Us56 {
    ok_c53(Nil)
}

pub fn error_c54(capt: Nil) -> fn(Nil) -> Us56 {
    fn (dom) {
        Us56Error
    }
}

pub fn method261() -> fn(Nil) -> Us56 {
    error_c54(Nil)
}

pub fn method262(v0: Uh14, v1: Uh14) -> Uh14 {
    case v0  {
        Uh14Cons(v2, v3) -> {
            let v4 = Uh14Cons(v2, v1)
            method262(v3, v4)
        }
        Uh14Nil -> v1
    }
}

pub fn method263(v0: dict.Dict(Int, String), v1: Uh14, v2: Int) -> Int {
    case v1  {
        Uh14Cons(v3, v4) -> {
            let v5 = dict.get(v0, v3)
            let v6 = method260()
            let v7 = method261()
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
            method263(v0, v4, v19)
        }
        Uh14Nil -> v2
    }
}

pub fn method264(v0: Uh3, v1: dict.Dict(Int, Nil), v2: Uh16, v3: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v4: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v5: dict.Dict(String, String), v6: dict.Dict(String, Uh3), v7: dict.Dict(String, dict.Dict(String, Nil)), v8: dict.Dict(String, #(Int, Bool)), v9: dict.Dict(String, Nil), v10: Int, v11: Int, v12: Int, v13: Int) -> #(dict.Dict(Int, Nil), Uh16, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int) {
    let #(v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67) =
        case v0  {
            Uh3Cons(v14, v15) -> {
                let #(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28) = rekeyed_257(v14, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
                method264(v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28)
            }
            _ -> {
                let #(v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54) =
                    case v0  {
                        Uh3Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54)
            }
        }
    #(v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67)
}

pub fn rekeyed_257(v0: String, v1: dict.Dict(Int, Nil), v2: Uh16, v3: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v4: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v5: dict.Dict(String, String), v6: dict.Dict(String, Uh3), v7: dict.Dict(String, dict.Dict(String, Nil)), v8: dict.Dict(String, #(Int, Bool)), v9: dict.Dict(String, Nil), v10: Int, v11: Int, v12: Int, v13: Int) -> #(dict.Dict(Int, Nil), Uh16, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int) {
    let v14 = dict.get(v6, v0)
    let v15 = method255()
    let v16 = method256()
    let v17 = case v14 { Ok(x) -> v15(x) Error(x) -> v16(x) }
    let v22 =
        case v17  {
            Us52Error -> Us53None
            Us52Ok(v18) -> Us53Some(v18)
        }
    let v23 = dict.get(v4, v0)
    let v24 = method258()
    let v25 = method259()
    let v26 = case v23 { Ok(x) -> v24(x) Error(x) -> v25(x) }
    let v33 =
        case v26  {
            Us54Error -> Us55None
            Us54Ok(v27, v28, v29) -> Us55Some(v27, v28, v29)
        }
    let #(v43, v44, _v45) =
        case v33  {
            Us55Some(v34, v35, v36) -> #(v34, v35, v36)
            _ -> {
                let #(v40, v41, v42) =
                    case v33  {
                        Us55None -> panic as "dict.present: the key is not in the dict"
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v40, v41, v42)
            }
        }
    let v62 =
        case v43  {
            Us2None -> {
                ""
            }
            Us2Some(v46) -> {
                let v47 = dict.get(v5, v46)
                let v48 = method260()
                let v49 = method261()
                let v50 = case v47 { Ok(x) -> v48(x) Error(x) -> v49(x) }
                let v55 =
                    case v50  {
                        Us56Error -> Us2None
                        Us56Ok(v51) -> Us2Some(v51)
                    }
                case v55  {
                    Us2None -> panic as "dict.present: the key is not in the dict"
                    Us2Some(v56) -> v56
                }
            }
        }
    let v63 = dict.keys(v44)
    let v64 = dictm_term_sorted(v63)
    let listm_fold = v64 |> list.fold (Uh14Nil, fn (acc, x) {
    let v66 = x
    let v67 = acc
    Uh14Cons(v66, v67)
    })
    let v69 = listm_fold
    let v71 = method262(v69, Uh14Nil)
    let v73 = method263(v44, v71, -1)
    let v74 = dict.get(v44, v73)
    let v75 = method260()
    let v76 = method261()
    let v77 = case v74 { Ok(x) -> v75(x) Error(x) -> v76(x) }
    let v82 =
        case v77  {
            Us56Error -> Us2None
            Us56Ok(v78) -> Us2Some(v78)
        }
    let v86 =
        case v82  {
            Us2None -> panic as "dict.present: the key is not in the dict"
            Us2Some(v83) -> v83
        }
    let v87 = unicode_erlang_characters_to_binary([0])
    let v88 = { v62 } <> { v87 }
    let v89 = { v88 } <> { v86 }
    let v90 = hash_text_241(v89)
    let v91 = spiral_string_slice(v90, 0, 15)
    let v92 = dict.insert(v5, v0, v91)
    let v93 = dict.insert(v9, v0, Nil)
    let #(v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133) =
        case v22  {
            Us53Some(v94) -> method264(v94, v1, v2, v3, v4, v92, v6, v7, v8, v93, v10, v11, v12, v13)
            _ -> {
                let #(v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120) =
                    case v22  {
                        Us53None -> #(v1, v2, v3, v4, v92, v6, v7, v8, v93, v10, v11, v12, v13)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120)
            }
        }
    #(v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133)
}

pub fn ok_c55(capt: Nil) -> fn(#(Int, Bool)) -> Us57 {
    fn (dom) {
        let #(v0, v1) = dom
        Us57Ok(v0, v1)
    }
}

pub fn method265() -> fn(#(Int, Bool)) -> Us57 {
    ok_c55(Nil)
}

pub fn error_c56(capt: Nil) -> fn(Nil) -> Us57 {
    fn (dom) {
        Us57Error
    }
}

pub fn method266() -> fn(Nil) -> Us57 {
    error_c56(Nil)
}

pub fn ok_c57(capt: Nil) -> fn(dict.Dict(String, Nil)) -> Us59 {
    fn (v0) {
        Us59Ok(v0)
    }
}

pub fn method267() -> fn(dict.Dict(String, Nil)) -> Us59 {
    ok_c57(Nil)
}

pub fn error_c58(capt: Nil) -> fn(Nil) -> Us59 {
    fn (dom) {
        Us59Error
    }
}

pub fn method268() -> fn(Nil) -> Us59 {
    error_c58(Nil)
}
