import gleam/bit_array
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh0, type Uh1, type Uh2, type Uh3, type Uh4, type Us11, type Uh6, type Uh7, Uh0Cons, Uh0Nil, Uh1Cons, Uh1Nil, Uh2Cons, Uh2Nil, Uh3Cons, Uh3Nil, Uh4Cons, Uh4Nil, Uh5Nil, Uh6Cons, Uh6Nil, Uh7Cons, Uh7Nil, Us10PlainRow, Us10TallyRow, Us11None, Us11Some, Us12Broken, Us12Held, Us13BreakingEditsFail, Us13NoStaleResults, Us13OneCompilePerPrefix, Us13SequentialEquivalence, Us13UnwantedResultsFreed, Us13WithdrawnDemandHidden, Us1None, Us1Some, Us2None, Us2Some, Us5BrokenId, Us5Evicting, Us5Result, Us5Visible, Us5Wanted, Us6None, Us6Some, Us7Cancelled, Us7Evicted, Us7Started, Us8None, Us8Some, Us9None, Us9Some}
import xsim_frames/part1.{closure1, count_at_16, digits_end_9, fields_from_6, method17, method18, method19, method4, spiral_array_from_list, spiral_array_get, spiral_string_index, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, text_at_13}

pub fn method5(v0: Uh3, v1: Uh0, v2: Uh1, v3: Uh2, v4: Uh2, v5: Uh2, v6: Uh3, v7: Bool, v8: Uh4, v9: Uh3, v10: Uh3) -> #(Uh0, Uh1, Uh2, Uh2, Uh2, Uh3, Bool, Uh4, Uh3, Uh3) {
    let #(v290, v291, v292, v293, v294, v295, v296, v297, v298, v299) =
        case v0  {
            Uh3Cons(v11, v12) -> {
                let v13 = spiral_string_length(v11)
                let v14 = 0 > v13
                let v19 =
                    case v14 {
                        True -> False
                        False -> {
                            let v15 = spiral_wrap_signed(v13 - 1, 32)
                            let v16 = spiral_string_slice(v11, 0, v15)
                            let v18 = v16 |> string.starts_with("{")
                            v18
                        }
                    }
                let v24 =
                    case v19 {
                        True -> {
                            fields_from_6(v11, 1, Uh5Nil)
                        }
                        False -> Us1None
                    }
                let #(v260, v261, v262, v263, v264, v265, v266, v267, v268, v269) =
                    case v24  {
                        Us1Some(v25) -> {
                            let v27 = text_at_13("row", v25)
                            let v28 = "visible" == v27
                            let v48 =
                                case v28 {
                                    True -> {
                                        Us6Some(Us5Visible)
                                    }
                                    False -> {
                                        let v31 = "broken" == v27
                                        case v31 {
                                            True -> {
                                                Us6Some(Us5BrokenId)
                                            }
                                            False -> {
                                                let v34 = "evicting" == v27
                                                case v34 {
                                                    True -> {
                                                        Us6Some(Us5Evicting)
                                                    }
                                                    False -> {
                                                        let v37 = "wanted" == v27
                                                        case v37 {
                                                            True -> {
                                                                Us6Some(Us5Wanted)
                                                            }
                                                            False -> {
                                                                let v40 = "result" == v27
                                                                case v40 {
                                                                    True -> {
                                                                        Us6Some(Us5Result)
                                                                    }
                                                                    False -> Us6None
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            let v49 = "start" == v27
                            let v61 =
                                case v49 {
                                    True -> {
                                        Us8Some(Us7Started)
                                    }
                                    False -> {
                                        let v52 = "cancelled" == v27
                                        case v52 {
                                            True -> {
                                                Us8Some(Us7Cancelled)
                                            }
                                            False -> {
                                                let v55 = "evicted" == v27
                                                case v55 {
                                                    True -> {
                                                        Us8Some(Us7Evicted)
                                                    }
                                                    False -> Us8None
                                                }
                                            }
                                        }
                                    }
                                }
                            let v72 =
                                case v48  {
                                    Us6None -> {
                                        case v61  {
                                            Us8None -> Us9None
                                            Us8Some(v65) -> {
                                                let v66 = Us10TallyRow(v65)
                                                Us9Some(v66)
                                            }
                                        }
                                    }
                                    Us6Some(v62) -> {
                                        let v63 = Us10PlainRow(v62)
                                        Us9Some(v63)
                                    }
                                }
                            case v72  {
                                Us9Some(v73) -> {
                                    case v73  {
                                        Us10PlainRow(v74) -> {
                                            case v74  {
                                                Us5Visible -> {
                                                    let v76 = text_at_13("id", v25)
                                                    let v78 = text_at_13("key", v25)
                                                    let v80 = count_at_16("ok", v25)
                                                    let v81 = v80 == 1
                                                    let v83 = text_at_13("out", v25)
                                                    let v85 = Uh0Cons(v76, v78, v81, v83, Uh0Nil)
                                                    let v86 = method17(v1, v85)
                                                    let v88 = count_at_16("based", v25)
                                                    let v89 = v88 == 1
                                                    case v89 {
                                                        True -> {
                                                            let v91 = count_at_16("base_ok", v25)
                                                            let v92 = v91 == 1
                                                            let v94 = text_at_13("base_out", v25)
                                                            let v95 = Uh4Cons(v76, v92, v94, v8)
                                                            #(v86, v2, v3, v4, v5, v6, v7, v95, v9, v10)
                                                        }
                                                        False -> #(v86, v2, v3, v4, v5, v6, v7, v8, v9, v10)
                                                    }
                                                }
                                                _ -> {
                                                    let #(v149, v150, v151, v152, v153, v154, v155, v156, v157, v158) =
                                                        case v74  {
                                                            Us5BrokenId -> {
                                                                let v107 = text_at_13("id", v25)
                                                                let v108 = Uh3Cons(v107, v9)
                                                                #(v1, v2, v3, v4, v5, v6, v7, v8, v108, v10)
                                                            }
                                                            _ -> {
                                                                let #(v139, v140, v141, v142, v143, v144, v145, v146, v147, v148) =
                                                                    case v74  {
                                                                        Us5Evicting -> #(v1, v2, v3, v4, v5, v6, True, v8, v9, v10)
                                                                        _ -> {
                                                                            let #(v129, v130, v131, v132, v133, v134, v135, v136, v137, v138) =
                                                                                case v74  {
                                                                                    Us5Wanted -> {
                                                                                        let v110 = text_at_13("id", v25)
                                                                                        let v112 = text_at_13("key", v25)
                                                                                        let v113 = Uh1Cons(v110, v112, v2)
                                                                                        #(v1, v113, v3, v4, v5, v6, v7, v8, v9, v10)
                                                                                    }
                                                                                    _ -> {
                                                                                        let #(v119, v120, v121, v122, v123, v124, v125, v126, v127, v128) =
                                                                                            case v74  {
                                                                                                Us5Result -> {
                                                                                                    let v115 = text_at_13("key", v25)
                                                                                                    let v117 = Uh3Cons(v115, Uh3Nil)
                                                                                                    let v118 = method18(v6, v117)
                                                                                                    #(v1, v2, v3, v4, v5, v118, v7, v8, v9, v10)
                                                                                                }
                                                                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                                            }
                                                                                        #(v119, v120, v121, v122, v123, v124, v125, v126, v127, v128)
                                                                                    }
                                                                                }
                                                                            #(v129, v130, v131, v132, v133, v134, v135, v136, v137, v138)
                                                                        }
                                                                    }
                                                                #(v139, v140, v141, v142, v143, v144, v145, v146, v147, v148)
                                                            }
                                                        }
                                                    #(v149, v150, v151, v152, v153, v154, v155, v156, v157, v158)
                                                }
                                            }
                                        }
                                        _ -> {
                                            let #(v209, v210, v211, v212, v213, v214, v215, v216, v217, v218) =
                                                case v73  {
                                                    Us10TallyRow(v169) -> {
                                                        let v171 = text_at_13("key", v25)
                                                        let v173 = count_at_16("count", v25)
                                                        case v169  {
                                                            Us7Started -> {
                                                                let v175 = Uh2Cons(v171, v173, Uh2Nil)
                                                                let v176 = method19(v3, v175)
                                                                #(v1, v2, v176, v4, v5, v6, v7, v8, v9, v10)
                                                            }
                                                            _ -> {
                                                                let #(v189, v190, v191, v192, v193, v194, v195, v196, v197, v198) =
                                                                    case v169  {
                                                                        Us7Cancelled -> {
                                                                            let v177 = Uh2Cons(v171, v173, v4)
                                                                            #(v1, v2, v3, v177, v5, v6, v7, v8, v9, v10)
                                                                        }
                                                                        _ -> {
                                                                            let #(v179, v180, v181, v182, v183, v184, v185, v186, v187, v188) =
                                                                                case v169  {
                                                                                    Us7Evicted -> {
                                                                                        let v178 = Uh2Cons(v171, v173, v5)
                                                                                        #(v1, v2, v3, v4, v178, v6, v7, v8, v9, v10)
                                                                                    }
                                                                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                                }
                                                                            #(v179, v180, v181, v182, v183, v184, v185, v186, v187, v188)
                                                                        }
                                                                    }
                                                                #(v189, v190, v191, v192, v193, v194, v195, v196, v197, v198)
                                                            }
                                                        }
                                                    }
                                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                }
                                            #(v209, v210, v211, v212, v213, v214, v215, v216, v217, v218)
                                        }
                                    }
                                }
                                _ -> {
                                    let #(v230, v231, v232, v233, v234, v235, v236, v237, v238, v239) =
                                        case v72  {
                                            Us9None -> {
                                                let v229 = Uh3Cons(v27, v10)
                                                #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v229)
                                            }
                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                        }
                                    #(v230, v231, v232, v233, v234, v235, v236, v237, v238, v239)
                                }
                            }
                        }
                        _ -> {
                            let #(v250, v251, v252, v253, v254, v255, v256, v257, v258, v259) =
                                case v24  {
                                    Us1None -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                }
                            #(v250, v251, v252, v253, v254, v255, v256, v257, v258, v259)
                        }
                    }
                method5(v12, v260, v261, v262, v263, v264, v265, v266, v267, v268, v269)
            }
            _ -> {
                let #(v280, v281, v282, v283, v284, v285, v286, v287, v288, v289) =
                    case v0  {
                        Uh3Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v280, v281, v282, v283, v284, v285, v286, v287, v288, v289)
            }
        }
    #(v290, v291, v292, v293, v294, v295, v296, v297, v298, v299)
}

pub fn snapshot_read_1(v0: String) -> #(Uh0, Uh1, Uh2, Uh2, Uh2, Uh3, Bool, Uh4, Uh3, Uh3) {
    let v1 = v0 == ""
    let v5 =
        case v1 {
            True -> Uh3Nil
            False -> {
                split_list_2("\n", v0)
            }
        }
    let #(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25) = method5(v5, Uh0Nil, Uh1Nil, Uh2Nil, Uh2Nil, Uh2Nil, Uh3Nil, False, Uh4Nil, Uh3Nil, Uh3Nil)
    #(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25)
}

pub fn method20(v0: Uh3, v1: Int) -> Int {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method20(v3, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn concat_pass_23(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            case v4  {
                Uh3Cons(v5, v6) -> {
                    let v7 = { v3 } <> { v0 }
                    let v8 = { v7 } <> { v5 }
                    let v9 = Uh3Cons(v8, v2)
                    concat_pass_23(v0, v6, v9)
                }
                Uh3Nil -> {
                    let v12 = Uh3Cons(v3, Uh3Nil)
                    method4(v2, v12)
                }
            }
        }
        Uh3Nil -> {
            method4(v2, Uh3Nil)
        }
    }
}

pub fn concat_balanced_22(v0: String, v1: Uh3) -> String {
    case v1  {
        Uh3Cons(v3, v4) -> {
            case v4  {
                Uh3Nil -> v3
                _ -> {
                    let v6 = concat_pass_23(v0, v1, Uh3Nil)
                    concat_balanced_22(v0, v6)
                }
            }
        }
        Uh3Nil -> {
            ""
        }
    }
}

pub fn delimited_21(v0: String, v1: Uh3) -> String {
    concat_balanced_22(v0, v1)
}

pub fn closure2(capt: #(String, String, Bool, String)) -> fn(#(String, String)) -> Bool {
    fn (dom) {
        let #(v4, v5) = dom
        let #(v0, v1, _v2, _v3) = capt
        let v6 = v4 == v0
        case v6 {
            True -> {
                v5 == v1
            }
            False -> False
        }
    }
}

pub fn method25(v0: String, v1: String, v2: Bool, v3: String) -> fn(#(String, String)) -> Bool {
    closure2(#(v0, v1, v2, v3))
}

pub fn method26(v0: String, v1: String, v2: Bool, v3: String, v4: fn(#(String, String)) -> Bool, v5: Uh1) -> Bool {
    case v5  {
        Uh1Cons(v6, v7, v8) -> {
            let v9 = v4(#(v6, v7))
            case v9 {
                True -> True
                False -> {
                    let v10 = method25(v0, v1, v2, v3)
                    method26(v0, v1, v2, v3, v10, v8)
                }
            }
        }
        Uh1Nil -> False
    }
}

pub fn method27(v0: String, v1: Uh4) -> Us11 {
    case v1  {
        Uh4Cons(v3, v4, v5, v6) -> {
            let v7 = v3 == v0
            case v7 {
                True -> Us11Some(v3, v4, v5)
                False -> method27(v0, v6)
            }
        }
        Uh4Nil -> Us11None
    }
}

pub fn masked_cells_28(v0: String, v1: Int, v2: String) -> String {
    let v3 = spiral_string_length(v0)
    let v4 = spiral_wrap_signed(v3 - v1, 32)
    let v5 = spiral_wrap_signed(v1 + v4, 32)
    let v6 = spiral_wrap_signed(v5 - 1, 32)
    let v7 = spiral_string_slice(v0, v1, v6)
    let v9 = option.from_result(result.map(string.split_once(v7, "spiral_cells"), pair.first))
    let v10 = closure1(Nil)
    let v11 = v9 |> option.map(v10)
    let v13 = v11 |> option.unwrap(Us2None)
    let v17 =
        case v13  {
            Us2None -> -1
            Us2Some(v14) -> {
                bit_array.byte_size(bit_array.from_string(v14))
            }
        }
    let v18 = v17 < 0
    let v21 =
        case v18 {
            True -> -1
            False -> {
                let v19 = spiral_wrap_signed(v1 + v17, 32)
                spiral_wrap_signed(v19 + 12, 32)
            }
        }
    let v22 = v21 < 0
    case v22 {
        True -> {
            let v23 = { v2 } <> { v7 }
            v23
        }
        False -> {
            let v24 = spiral_wrap_signed(v21 + 1, 32)
            let v25 = spiral_wrap_signed(v3 - v21, 32)
            let v26 = spiral_wrap_signed(v21 + v25, 32)
            let v27 = spiral_wrap_signed(v26 - 1, 32)
            let v28 = spiral_string_slice(v0, v21, v27)
            let v30 = v28 |> string.starts_with("\\")
            let v32 =
                case v30 {
                    True -> digits_end_9(v0, v24)
                    False -> -1
                }
            let v33 = v32 > v24
            let v34 =
                case v33 {
                    True -> v32
                    False -> -1
                }
            let v35 = v34 >= 0
            let v42 =
                case v35 {
                    True -> v34
                    False -> {
                        let v37 = v28 |> string.starts_with("/")
                        let v39 =
                            case v37 {
                                True -> digits_end_9(v0, v24)
                                False -> -1
                            }
                        let v40 = v39 > v24
                        case v40 {
                            True -> v39
                            False -> -1
                        }
                    }
                }
            let v43 = v42 < 0
            let v55 =
                case v43 {
                    True -> -1
                    False -> {
                        let v44 = spiral_wrap_signed(v42 + 1, 32)
                        let v45 = spiral_wrap_signed(v3 - v42, 32)
                        let v46 = spiral_wrap_signed(v42 + v45, 32)
                        let v47 = spiral_wrap_signed(v46 - 1, 32)
                        let v48 = spiral_string_slice(v0, v42, v47)
                        let v50 = v48 |> string.starts_with("-")
                        let v52 =
                            case v50 {
                                True -> digits_end_9(v0, v44)
                                False -> -1
                            }
                        let v53 = v52 > v44
                        case v53 {
                            True -> v52
                            False -> -1
                        }
                    }
                }
            let v56 = spiral_wrap_signed(v21 - v1, 32)
            let v57 = spiral_wrap_signed(v1 + v56, 32)
            let v58 = spiral_wrap_signed(v57 - 1, 32)
            let v59 = spiral_string_slice(v0, v1, v58)
            let v60 = { v2 } <> { v59 }
            let v61 = v55 < 0
            let #(v63, v64) =
                case v61 {
                    True -> #(v60, v21)
                    False -> {
                        let v62 = { v60 } <> { "/_" }
                        #(v62, v55)
                    }
                }
            masked_cells_28(v0, v64, v63)
        }
    }
}

pub fn masked_threads_29(v0: String, v1: Int, v2: String) -> String {
    let v3 = spiral_string_length(v0)
    let v4 = spiral_wrap_signed(v3 - v1, 32)
    let v5 = spiral_wrap_signed(v1 + v4, 32)
    let v6 = spiral_wrap_signed(v5 - 1, 32)
    let v7 = spiral_string_slice(v0, v1, v6)
    let v9 = option.from_result(result.map(string.split_once(v7, "thread '"), pair.first))
    let v10 = closure1(Nil)
    let v11 = v9 |> option.map(v10)
    let v13 = v11 |> option.unwrap(Us2None)
    let v17 =
        case v13  {
            Us2None -> -1
            Us2Some(v14) -> {
                bit_array.byte_size(bit_array.from_string(v14))
            }
        }
    let v18 = v17 < 0
    let v21 =
        case v18 {
            True -> -1
            False -> {
                let v19 = spiral_wrap_signed(v1 + v17, 32)
                spiral_wrap_signed(v19 + 8, 32)
            }
        }
    let v22 = v21 < 0
    let v40 =
        case v22 {
            True -> -1
            False -> {
                let v23 = spiral_wrap_signed(v3 - v21, 32)
                let v24 = spiral_wrap_signed(v21 + v23, 32)
                let v25 = spiral_wrap_signed(v24 - 1, 32)
                let v26 = spiral_string_slice(v0, v21, v25)
                let v28 = option.from_result(result.map(string.split_once(v26, "'"), pair.first))
                let v29 = v28 |> option.map(v10)
                let v31 = v29 |> option.unwrap(Us2None)
                let v35 =
                    case v31  {
                        Us2None -> -1
                        Us2Some(v32) -> {
                            bit_array.byte_size(bit_array.from_string(v32))
                        }
                    }
                let v36 = v35 < 0
                case v36 {
                    True -> -1
                    False -> {
                        let v37 = spiral_wrap_signed(v21 + v35, 32)
                        spiral_wrap_signed(v37 + 1, 32)
                    }
                }
            }
        }
    let v41 = v40 < 0
    case v41 {
        True -> {
            let v42 = { v2 } <> { v7 }
            v42
        }
        False -> {
            let v43 = spiral_wrap_signed(v40 + 2, 32)
            let v44 = spiral_wrap_signed(v3 - v40, 32)
            let v45 = spiral_wrap_signed(v40 + v44, 32)
            let v46 = spiral_wrap_signed(v45 - 1, 32)
            let v47 = spiral_string_slice(v0, v40, v46)
            let v49 = v47 |> string.starts_with(" (")
            let v51 =
                case v49 {
                    True -> digits_end_9(v0, v43)
                    False -> -1
                }
            let v52 = v51 > v43
            let v53 =
                case v52 {
                    True -> v51
                    False -> -1
                }
            let v54 = v53 >= 0
            let v61 =
                case v54 {
                    True -> {
                        let v55 = spiral_wrap_signed(v3 - v53, 32)
                        let v56 = spiral_wrap_signed(v53 + v55, 32)
                        let v57 = spiral_wrap_signed(v56 - 1, 32)
                        let v58 = spiral_string_slice(v0, v53, v57)
                        v58 |> string.starts_with(") panicked")
                    }
                    False -> False
                }
            let v63 =
                case v61 {
                    True -> {
                        spiral_wrap_signed(v53 + 10, 32)
                    }
                    False -> -1
                }
            let v64 = v63 < 0
            let #(v76, v77) =
                case v64 {
                    True -> {
                        let v65 = spiral_wrap_signed(v21 - v1, 32)
                        let v66 = spiral_wrap_signed(v1 + v65, 32)
                        let v67 = spiral_wrap_signed(v66 - 1, 32)
                        let v68 = spiral_string_slice(v0, v1, v67)
                        let v69 = { v2 } <> { v68 }
                        #(v69, v21)
                    }
                    False -> {
                        let v70 = spiral_wrap_signed(v40 - v1, 32)
                        let v71 = spiral_wrap_signed(v1 + v70, 32)
                        let v72 = spiral_wrap_signed(v71 - 1, 32)
                        let v73 = spiral_string_slice(v0, v1, v72)
                        let v74 = { v2 } <> { v73 }
                        let v75 = { v74 } <> { " (_) panicked" }
                        #(v75, v63)
                    }
                }
            masked_threads_29(v0, v77, v76)
        }
    }
}

pub fn method24(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh0, v8: Uh1, v9: Uh2, v10: Uh2, v11: Uh2, v12: Uh3, v13: Bool, v14: Uh4, v15: Uh3, v16: Uh3, v17: Uh0, v18: Uh0) -> Uh0 {
    case v17  {
        Uh0Cons(v19, v20, v21, v22, v23) -> {
            let v24 = method24(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v23, v18)
            let v25 = method25(v19, v20, v21, v22)
            let v26 = method26(v19, v20, v21, v22, v25, v1)
            let v49 =
                case v26 {
                    True -> {
                        let v27 = method27(v19, v14)
                        let #(v34, v35) =
                            case v27  {
                                Us11Some(v28, v29, v30) -> #(v29, v30)
                                _ -> {
                                    let #(v32, v33) =
                                        case v27  {
                                            Us11None -> {
                                                #(False, "")
                                            }
                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                        }
                                    #(v32, v33)
                                }
                            }
                        let v37 = ""
                        let v38 = masked_cells_28(v35, 0, v37)
                        let v40 = masked_threads_29(v38, 0, v37)
                        let v42 = masked_cells_28(v22, 0, v37)
                        let v44 = masked_threads_29(v42, 0, v37)
                        let v45 = v34 == v21
                        let v47 =
                            case v45 {
                                True -> {
                                    v40 == v44
                                }
                                False -> False
                            }
                        v47 == False
                    }
                    False -> False
                }
            case v49 {
                True -> Uh0Cons(v19, v20, v21, v22, v24)
                False -> v24
            }
        }
        Uh0Nil -> v18
    }
}

pub fn method30(v0: Uh0, v1: Uh3) -> Uh3 {
    case v0  {
        Uh0Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method30(v6, v1)
            Uh3Cons(v2, v7)
        }
        Uh0Nil -> v1
    }
}

pub fn taken_31(v0: Int, v1: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0 > 0
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v0 - 1, 32)
                    let v6 = taken_31(v5, v3)
                    Uh3Cons(v2, v6)
                }
                False -> Uh3Nil
            }
        }
        _ -> Uh3Nil
    }
}

pub fn method32(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh0, v8: Uh0) -> Uh0 {
    case v7  {
        Uh0Cons(v9, v10, v11, v12, v13) -> {
            let v14 = method32(v0, v1, v2, v3, v4, v5, v6, v13, v8)
            let v15 = method25(v9, v10, v11, v12)
            let v16 = method26(v9, v10, v11, v12, v15, v1)
            let v17 = v16 == False
            case v17 {
                True -> Uh0Cons(v9, v10, v11, v12, v14)
                False -> v14
            }
        }
        Uh0Nil -> v8
    }
}

pub fn method34(v0: String, v1: Uh2, v2: Uh2) -> Uh2 {
    case v1  {
        Uh2Cons(v3, v4, v5) -> {
            let v6 = method34(v0, v5, v2)
            let v7 = v3 == v0
            case v7 {
                True -> Uh2Cons(v3, v4, v6)
                False -> v6
            }
        }
        Uh2Nil -> v2
    }
}

pub fn method35(v0: Uh2, v1: Int) -> Int {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + v3, 32)
            method35(v4, v5)
        }
        Uh2Nil -> v1
    }
}

pub fn method33(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh2, v8: Uh2) -> Uh2 {
    case v7  {
        Uh2Cons(v9, v10, v11) -> {
            let v12 = method33(v0, v1, v2, v3, v4, v5, v6, v11, v8)
            let v14 = method34(v9, v3, Uh2Nil)
            let v16 = method35(v14, 0)
            let v17 = spiral_wrap_signed(v10 - v16, 32)
            let v19 = method34(v9, v4, Uh2Nil)
            let v21 = method35(v19, 0)
            let v22 = spiral_wrap_signed(v17 - v21, 32)
            let v23 = v22 > 1
            case v23 {
                True -> Uh2Cons(v9, v10, v12)
                False -> v12
            }
        }
        Uh2Nil -> v8
    }
}

pub fn method36(v0: Uh2, v1: Uh3) -> Uh3 {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = method36(v4, v1)
            Uh3Cons(v2, v5)
        }
        Uh2Nil -> v1
    }
}

pub fn closure3(capt: #(String, String, Bool, String)) -> fn(#(String, String)) -> Bool {
    fn (dom) {
        let #(v4, _v5) = dom
        let #(v0, _v1, _v2, _v3) = capt
        v4 == v0
    }
}

pub fn method38(v0: String, v1: String, v2: Bool, v3: String) -> fn(#(String, String)) -> Bool {
    closure3(#(v0, v1, v2, v3))
}

pub fn method39(v0: String, v1: String, v2: Bool, v3: String, v4: fn(#(String, String)) -> Bool, v5: Uh1) -> Bool {
    case v5  {
        Uh1Cons(v6, v7, v8) -> {
            let v9 = v4(#(v6, v7))
            case v9 {
                True -> True
                False -> {
                    let v10 = method38(v0, v1, v2, v3)
                    method39(v0, v1, v2, v3, v10, v8)
                }
            }
        }
        Uh1Nil -> False
    }
}

pub fn method37(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh0, v8: Uh0) -> Uh0 {
    case v7  {
        Uh0Cons(v9, v10, v11, v12, v13) -> {
            let v14 = method37(v0, v1, v2, v3, v4, v5, v6, v13, v8)
            let v15 = method38(v9, v10, v11, v12)
            let v16 = method39(v9, v10, v11, v12, v15, v1)
            let v17 = v16 == False
            case v17 {
                True -> Uh0Cons(v9, v10, v11, v12, v14)
                False -> v14
            }
        }
        Uh0Nil -> v8
    }
}

pub fn closure4(capt: #(String)) -> fn(#(String, String)) -> Bool {
    fn (dom) {
        let #(_v1, v2) = dom
        let #(v0) = capt
        v2 == v0
    }
}

pub fn method41(v0: String) -> fn(#(String, String)) -> Bool {
    closure4(#(v0))
}

pub fn method42(v0: String, v1: fn(#(String, String)) -> Bool, v2: Uh1) -> Bool {
    case v2  {
        Uh1Cons(v3, v4, v5) -> {
            let v6 = v1(#(v3, v4))
            case v6 {
                True -> True
                False -> {
                    let v7 = method41(v0)
                    method42(v0, v7, v5)
                }
            }
        }
        Uh1Nil -> False
    }
}

pub fn method40(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh3, v8: Uh3) -> Uh3 {
    case v7  {
        Uh3Cons(v9, v10) -> {
            let v11 = method40(v0, v1, v2, v3, v4, v5, v6, v10, v8)
            let v12 = method41(v9)
            let v13 = method42(v9, v12, v1)
            let v14 = v13 == False
            case v14 {
                True -> Uh3Cons(v9, v11)
                False -> v11
            }
        }
        Uh3Nil -> v8
    }
}

pub fn method44(v0: Int, v1: String, v2: Int) -> Uh7 {
    let v3 = v2 < v0
    case v3 {
        True -> {
            let v4 = spiral_string_index(v1, v2)
            let v5 = spiral_wrap_signed(v2 + 1, 64)
            let v6 = method44(v0, v1, v5)
            Uh7Cons(v4, v6)
        }
        False -> Uh7Nil
    }
}

pub fn method45(v0: Uh7, v1: Uh3) -> Uh3 {
    case v0  {
        Uh7Cons(v2, v3) -> {
            let v4 = v2
            let v5 = v4 |> string.lowercase
            let v6 = v5 != v4
            let v10 =
                case v6 {
                    True -> {
                        let v8 = method20(v1, 0)
                        v8 > 0
                    }
                    False -> False
                }
            let v15 =
                case v10 {
                    True -> {
                        let v12 = Uh3Cons("_", v1)
                        Uh3Cons(v5, v12)
                    }
                    False -> Uh3Cons(v5, v1)
                }
            method45(v3, v15)
        }
        Uh7Nil -> v1
    }
}

pub fn method43(v0: Uh6, v1: Uh3) -> Uh3 {
    case v0  {
        Uh6Cons(v2, v3, v4) -> {
            let v5 = method43(v4, v1)
            let v12 = spiral_array_from_list([ "SequentialEquivalence", "NoStaleResults", "OneCompilePerPrefix", "WithdrawnDemandHidden", "UnwantedResultsFreed", "BreakingEditsFail" ])
            let v13 = case v2 { Us13SequentialEquivalence -> 0 Us13NoStaleResults -> 1 Us13OneCompilePerPrefix -> 2 Us13WithdrawnDemandHidden -> 3 Us13UnwantedResultsFreed -> 4 Us13BreakingEditsFail -> 5 }
            let v14 = spiral_array_get(v12, v13)
            let v15 = spiral_string_length(v14)
            let v17 = method44(v15, v14, 0)
            let v19 = method45(v17, Uh3Nil)
            let v21 = method4(v19, Uh3Nil)
            let v23 = concat_balanced_22("", v21)
            let v24 = { v23 } <> { "=" }
            let v32 =
                case v3  {
                    Us12Broken(v26) -> {
                        let v28 = delimited_21(",", v26)
                        let v29 = { "FAIL[" } <> { v28 }
                        let v30 = { v29 } <> { "]" }
                        v30
                    }
                    Us12Held -> {
                        "ok"
                    }
                }
            let v33 = { v24 } <> { v32 }
            Uh3Cons(v33, v5)
        }
        Uh6Nil -> v1
    }
}
