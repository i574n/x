import gleam/bit_array
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh0, type Uh1, type Uh2, type Uh3, type Uh4, type Us11, Uh0Cons, Uh0Nil, Uh1Cons, Uh1Nil, Uh2Cons, Uh2Nil, Uh3Cons, Uh3Nil, Uh4Cons, Uh4Nil, Uh5Nil, Us10PlainRow, Us10TallyRow, Us11None, Us11Some, Us1None, Us1Some, Us2None, Us2Some, Us5BrokenId, Us5Evicting, Us5Result, Us5Visible, Us5Wanted, Us6None, Us6Some, Us7Cancelled, Us7Evicted, Us7Started, Us8None, Us8Some, Us9None, Us9Some}
import xsim_frames/part1.{closure1, count_at_16, digits_end_9, fields_from_6, method17, method4, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, text_at_13}

pub fn method18(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method18(v3, v1)
            Uh3Cons(v2, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method19(v0: Uh2, v1: Uh2) -> Uh2 {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = method19(v4, v1)
            Uh2Cons(v2, v3, v5)
        }
        Uh2Nil -> v1
    }
}

pub fn method5(v0: Uh3, v1: Uh0, v2: Uh1, v3: Uh2, v4: Uh2, v5: Uh2, v6: Uh3, v7: Bool, v8: Uh4, v9: Uh3, v10: Uh3) -> #(Uh0, Uh1, Uh2, Uh2, Uh2, Uh3, Bool, Uh4, Uh3, Uh3) {
    let #(v294, v295, v296, v297, v298, v299, v300, v301, v302, v303) =
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
                            let v17 = "{"
                            let v18 = v16 |> string.starts_with(v17)
                            v18
                        }
                    }
                let v24 =
                    case v19 {
                        True -> {
                            let v20 = 1
                            let v21 = Uh5Nil
                            fields_from_6(v11, v20, v21)
                        }
                        False -> Us1None
                    }
                let #(v264, v265, v266, v267, v268, v269, v270, v271, v272, v273) =
                    case v24  {
                        Us1Some(v25) -> {
                            let v26 = "row"
                            let v27 = text_at_13(v26, v25)
                            let v28 = "visible" == v27
                            let v48 =
                                case v28 {
                                    True -> {
                                        let v29 = Us5Visible
                                        Us6Some(v29)
                                    }
                                    False -> {
                                        let v31 = "broken" == v27
                                        case v31 {
                                            True -> {
                                                let v32 = Us5BrokenId
                                                Us6Some(v32)
                                            }
                                            False -> {
                                                let v34 = "evicting" == v27
                                                case v34 {
                                                    True -> {
                                                        let v35 = Us5Evicting
                                                        Us6Some(v35)
                                                    }
                                                    False -> {
                                                        let v37 = "wanted" == v27
                                                        case v37 {
                                                            True -> {
                                                                let v38 = Us5Wanted
                                                                Us6Some(v38)
                                                            }
                                                            False -> {
                                                                let v40 = "result" == v27
                                                                case v40 {
                                                                    True -> {
                                                                        let v41 = Us5Result
                                                                        Us6Some(v41)
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
                                        let v50 = Us7Started
                                        Us8Some(v50)
                                    }
                                    False -> {
                                        let v52 = "cancelled" == v27
                                        case v52 {
                                            True -> {
                                                let v53 = Us7Cancelled
                                                Us8Some(v53)
                                            }
                                            False -> {
                                                let v55 = "evicted" == v27
                                                case v55 {
                                                    True -> {
                                                        let v56 = Us7Evicted
                                                        Us8Some(v56)
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
                                                    let v75 = "id"
                                                    let v76 = text_at_13(v75, v25)
                                                    let v77 = "key"
                                                    let v78 = text_at_13(v77, v25)
                                                    let v79 = ""
                                                    let v80 = "ok"
                                                    let v81 = v79 <> v80 
                                                    let v82 = count_at_16(v81, v25)
                                                    let v83 = v82 == 1
                                                    let v84 = "out"
                                                    let v85 = v79 <> v84 
                                                    let v86 = text_at_13(v85, v25)
                                                    let v87 = Uh0Nil
                                                    let v88 = Uh0Cons(v76, v78, v83, v86, v87)
                                                    let v89 = method17(v1, v88)
                                                    let v90 = "based"
                                                    let v91 = count_at_16(v90, v25)
                                                    let v92 = v91 == 1
                                                    case v92 {
                                                        True -> {
                                                            let v93 = "base_"
                                                            let v94 = v93 <> v80 
                                                            let v95 = count_at_16(v94, v25)
                                                            let v96 = v95 == 1
                                                            let v97 = v93 <> v84 
                                                            let v98 = text_at_13(v97, v25)
                                                            let v99 = Uh4Cons(v76, v96, v98, v8)
                                                            #(v89, v2, v3, v4, v5, v6, v7, v99, v9, v10)
                                                        }
                                                        False -> #(v89, v2, v3, v4, v5, v6, v7, v8, v9, v10)
                                                    }
                                                }
                                                _ -> {
                                                    let #(v153, v154, v155, v156, v157, v158, v159, v160, v161, v162) =
                                                        case v74  {
                                                            Us5BrokenId -> {
                                                                let v110 = "id"
                                                                let v111 = text_at_13(v110, v25)
                                                                let v112 = Uh3Cons(v111, v9)
                                                                #(v1, v2, v3, v4, v5, v6, v7, v8, v112, v10)
                                                            }
                                                            _ -> {
                                                                let #(v143, v144, v145, v146, v147, v148, v149, v150, v151, v152) =
                                                                    case v74  {
                                                                        Us5Evicting -> #(v1, v2, v3, v4, v5, v6, True, v8, v9, v10)
                                                                        _ -> {
                                                                            let #(v133, v134, v135, v136, v137, v138, v139, v140, v141, v142) =
                                                                                case v74  {
                                                                                    Us5Wanted -> {
                                                                                        let v113 = "id"
                                                                                        let v114 = text_at_13(v113, v25)
                                                                                        let v115 = "key"
                                                                                        let v116 = text_at_13(v115, v25)
                                                                                        let v117 = Uh1Cons(v114, v116, v2)
                                                                                        #(v1, v117, v3, v4, v5, v6, v7, v8, v9, v10)
                                                                                    }
                                                                                    _ -> {
                                                                                        let #(v123, v124, v125, v126, v127, v128, v129, v130, v131, v132) =
                                                                                            case v74  {
                                                                                                Us5Result -> {
                                                                                                    let v118 = "key"
                                                                                                    let v119 = text_at_13(v118, v25)
                                                                                                    let v120 = Uh3Nil
                                                                                                    let v121 = Uh3Cons(v119, v120)
                                                                                                    let v122 = method18(v6, v121)
                                                                                                    #(v1, v2, v3, v4, v5, v122, v7, v8, v9, v10)
                                                                                                }
                                                                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                                            }
                                                                                        #(v123, v124, v125, v126, v127, v128, v129, v130, v131, v132)
                                                                                    }
                                                                                }
                                                                            #(v133, v134, v135, v136, v137, v138, v139, v140, v141, v142)
                                                                        }
                                                                    }
                                                                #(v143, v144, v145, v146, v147, v148, v149, v150, v151, v152)
                                                            }
                                                        }
                                                    #(v153, v154, v155, v156, v157, v158, v159, v160, v161, v162)
                                                }
                                            }
                                        }
                                        _ -> {
                                            let #(v213, v214, v215, v216, v217, v218, v219, v220, v221, v222) =
                                                case v73  {
                                                    Us10TallyRow(v173) -> {
                                                        let v174 = "key"
                                                        let v175 = text_at_13(v174, v25)
                                                        let v176 = "count"
                                                        let v177 = count_at_16(v176, v25)
                                                        case v173  {
                                                            Us7Started -> {
                                                                let v178 = Uh2Nil
                                                                let v179 = Uh2Cons(v175, v177, v178)
                                                                let v180 = method19(v3, v179)
                                                                #(v1, v2, v180, v4, v5, v6, v7, v8, v9, v10)
                                                            }
                                                            _ -> {
                                                                let #(v193, v194, v195, v196, v197, v198, v199, v200, v201, v202) =
                                                                    case v173  {
                                                                        Us7Cancelled -> {
                                                                            let v181 = Uh2Cons(v175, v177, v4)
                                                                            #(v1, v2, v3, v181, v5, v6, v7, v8, v9, v10)
                                                                        }
                                                                        _ -> {
                                                                            let #(v183, v184, v185, v186, v187, v188, v189, v190, v191, v192) =
                                                                                case v173  {
                                                                                    Us7Evicted -> {
                                                                                        let v182 = Uh2Cons(v175, v177, v5)
                                                                                        #(v1, v2, v3, v4, v182, v6, v7, v8, v9, v10)
                                                                                    }
                                                                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                                }
                                                                            #(v183, v184, v185, v186, v187, v188, v189, v190, v191, v192)
                                                                        }
                                                                    }
                                                                #(v193, v194, v195, v196, v197, v198, v199, v200, v201, v202)
                                                            }
                                                        }
                                                    }
                                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                }
                                            #(v213, v214, v215, v216, v217, v218, v219, v220, v221, v222)
                                        }
                                    }
                                }
                                _ -> {
                                    let #(v234, v235, v236, v237, v238, v239, v240, v241, v242, v243) =
                                        case v72  {
                                            Us9None -> {
                                                let v233 = Uh3Cons(v27, v10)
                                                #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v233)
                                            }
                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                        }
                                    #(v234, v235, v236, v237, v238, v239, v240, v241, v242, v243)
                                }
                            }
                        }
                        _ -> {
                            let #(v254, v255, v256, v257, v258, v259, v260, v261, v262, v263) =
                                case v24  {
                                    Us1None -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                }
                            #(v254, v255, v256, v257, v258, v259, v260, v261, v262, v263)
                        }
                    }
                method5(v12, v264, v265, v266, v267, v268, v269, v270, v271, v272, v273)
            }
            _ -> {
                let #(v284, v285, v286, v287, v288, v289, v290, v291, v292, v293) =
                    case v0  {
                        Uh3Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v284, v285, v286, v287, v288, v289, v290, v291, v292, v293)
            }
        }
    #(v294, v295, v296, v297, v298, v299, v300, v301, v302, v303)
}

pub fn snapshot_read_1(v0: String) -> #(Uh0, Uh1, Uh2, Uh2, Uh2, Uh3, Bool, Uh4, Uh3, Uh3) {
    let v1 = v0 == ""
    let v5 =
        case v1 {
            True -> Uh3Nil
            False -> {
                let v3 = "\n"
                split_list_2(v3, v0)
            }
        }
    let v6 = Uh0Nil
    let v7 = Uh1Nil
    let v8 = Uh2Nil
    let v9 = Uh2Nil
    let v10 = Uh2Nil
    let v11 = Uh3Nil
    let v12 = False
    let v13 = Uh4Nil
    let v14 = Uh3Nil
    let v15 = Uh3Nil
    let #(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25) = method5(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15)
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
                    let v7 = v3 <> v0 
                    let v8 = v7 <> v5 
                    let v9 = Uh3Cons(v8, v2)
                    concat_pass_23(v0, v6, v9)
                }
                Uh3Nil -> {
                    let v11 = Uh3Nil
                    let v12 = Uh3Cons(v3, v11)
                    method4(v2, v12)
                }
            }
        }
        Uh3Nil -> {
            let v16 = Uh3Nil
            method4(v2, v16)
        }
    }
}

pub fn concat_balanced_22(v0: String, v1: Uh3) -> String {
    case v1  {
        Uh3Cons(v3, v4) -> {
            case v4  {
                Uh3Nil -> v3
                _ -> {
                    let v5 = Uh3Nil
                    let v6 = concat_pass_23(v0, v1, v5)
                    concat_balanced_22(v0, v6)
                }
            }
        }
        Uh3Nil -> {
            let v2 = ""
            v2
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
                let v7 = v5 == v1
                v7
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
    let v8 = "spiral_cells"
    let v9 = option.from_result(result.map(string.split_once(v7, v8), pair.first))
    let v10 = closure1(Nil)
    let v11 = v9 |> option.map(v10)
    let v12 = Us2None
    let v13 = v11 |> option.unwrap(v12)
    let v17 =
        case v13  {
            Us2None -> -1
            Us2Some(v14) -> {
                let v15 = bit_array.byte_size(bit_array.from_string(v14))
                v15
            }
        }
    let v18 = v17 < 0
    let v21 =
        case v18 {
            True -> -1
            False -> {
                let v19 = spiral_wrap_signed(v1 + v17, 32)
                let v20 = spiral_wrap_signed(v19 + 12, 32)
                v20
            }
        }
    let v22 = v21 < 0
    case v22 {
        True -> {
            let v23 = v2 <> v7 
            v23
        }
        False -> {
            let v24 = spiral_wrap_signed(v21 + 1, 32)
            let v25 = spiral_wrap_signed(v3 - v21, 32)
            let v26 = spiral_wrap_signed(v21 + v25, 32)
            let v27 = spiral_wrap_signed(v26 - 1, 32)
            let v28 = spiral_string_slice(v0, v21, v27)
            let v29 = "\\"
            let v30 = v28 |> string.starts_with(v29)
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
                        let v36 = "/"
                        let v37 = v28 |> string.starts_with(v36)
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
                        let v49 = "-"
                        let v50 = v48 |> string.starts_with(v49)
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
            let v60 = v2 <> v59 
            let v61 = v55 < 0
            let #(v64, v65) =
                case v61 {
                    True -> #(v60, v21)
                    False -> {
                        let v62 = "/_"
                        let v63 = v60 <> v62 
                        #(v63, v55)
                    }
                }
            masked_cells_28(v0, v65, v64)
        }
    }
}

pub fn masked_threads_29(v0: String, v1: Int, v2: String) -> String {
    let v3 = spiral_string_length(v0)
    let v4 = spiral_wrap_signed(v3 - v1, 32)
    let v5 = spiral_wrap_signed(v1 + v4, 32)
    let v6 = spiral_wrap_signed(v5 - 1, 32)
    let v7 = spiral_string_slice(v0, v1, v6)
    let v8 = "thread '"
    let v9 = option.from_result(result.map(string.split_once(v7, v8), pair.first))
    let v10 = closure1(Nil)
    let v11 = v9 |> option.map(v10)
    let v12 = Us2None
    let v13 = v11 |> option.unwrap(v12)
    let v17 =
        case v13  {
            Us2None -> -1
            Us2Some(v14) -> {
                let v15 = bit_array.byte_size(bit_array.from_string(v14))
                v15
            }
        }
    let v18 = v17 < 0
    let v21 =
        case v18 {
            True -> -1
            False -> {
                let v19 = spiral_wrap_signed(v1 + v17, 32)
                let v20 = spiral_wrap_signed(v19 + 8, 32)
                v20
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
                let v27 = "'"
                let v28 = option.from_result(result.map(string.split_once(v26, v27), pair.first))
                let v29 = v28 |> option.map(v10)
                let v30 = Us2None
                let v31 = v29 |> option.unwrap(v30)
                let v35 =
                    case v31  {
                        Us2None -> -1
                        Us2Some(v32) -> {
                            let v33 = bit_array.byte_size(bit_array.from_string(v32))
                            v33
                        }
                    }
                let v36 = v35 < 0
                case v36 {
                    True -> -1
                    False -> {
                        let v37 = spiral_wrap_signed(v21 + v35, 32)
                        let v38 = spiral_wrap_signed(v37 + 1, 32)
                        v38
                    }
                }
            }
        }
    let v41 = v40 < 0
    case v41 {
        True -> {
            let v42 = v2 <> v7 
            v42
        }
        False -> {
            let v43 = spiral_wrap_signed(v40 + 2, 32)
            let v44 = spiral_wrap_signed(v3 - v40, 32)
            let v45 = spiral_wrap_signed(v40 + v44, 32)
            let v46 = spiral_wrap_signed(v45 - 1, 32)
            let v47 = spiral_string_slice(v0, v40, v46)
            let v48 = " ("
            let v49 = v47 |> string.starts_with(v48)
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
                        let v59 = ") panicked"
                        let v60 = v58 |> string.starts_with(v59)
                        v60
                    }
                    False -> False
                }
            let v63 =
                case v61 {
                    True -> {
                        let v62 = spiral_wrap_signed(v53 + 10, 32)
                        v62
                    }
                    False -> -1
                }
            let v64 = v63 < 0
            let #(v77, v78) =
                case v64 {
                    True -> {
                        let v65 = spiral_wrap_signed(v21 - v1, 32)
                        let v66 = spiral_wrap_signed(v1 + v65, 32)
                        let v67 = spiral_wrap_signed(v66 - 1, 32)
                        let v68 = spiral_string_slice(v0, v1, v67)
                        let v69 = v2 <> v68 
                        #(v69, v21)
                    }
                    False -> {
                        let v70 = spiral_wrap_signed(v40 - v1, 32)
                        let v71 = spiral_wrap_signed(v1 + v70, 32)
                        let v72 = spiral_wrap_signed(v71 - 1, 32)
                        let v73 = spiral_string_slice(v0, v1, v72)
                        let v74 = v2 <> v73 
                        let v75 = " (_) panicked"
                        let v76 = v74 <> v75 
                        #(v76, v63)
                    }
                }
            masked_threads_29(v0, v78, v77)
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
                                                let v31 = ""
                                                #(False, v31)
                                            }
                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                        }
                                    #(v32, v33)
                                }
                            }
                        let v36 = 0
                        let v37 = ""
                        let v38 = masked_cells_28(v35, v36, v37)
                        let v39 = 0
                        let v40 = masked_threads_29(v38, v39, v37)
                        let v41 = 0
                        let v42 = masked_cells_28(v22, v41, v37)
                        let v43 = 0
                        let v44 = masked_threads_29(v42, v43, v37)
                        let v45 = v34 == v21
                        let v47 =
                            case v45 {
                                True -> {
                                    let v46 = v40 == v44
                                    v46
                                }
                                False -> False
                            }
                        let v48 = v47 == False
                        v48
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
            let v13 = Uh2Nil
            let v14 = method34(v9, v3, v13)
            let v15 = 0
            let v16 = method35(v14, v15)
            let v17 = spiral_wrap_signed(v10 - v16, 32)
            let v18 = Uh2Nil
            let v19 = method34(v9, v4, v18)
            let v20 = 0
            let v21 = method35(v19, v20)
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
        let v6 = v4 == v0
        v6
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
        let v3 = v2 == v0
        v3
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
