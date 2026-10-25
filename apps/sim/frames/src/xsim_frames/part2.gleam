import gleam/string
import xsim_frames/types.{type Uh0, type Uh1, type Uh2, type Uh3, type Uh4, type Us1, type Uh5, type Us2, type Us4, type Us11, Uh0Cons, Uh0Nil, Uh1Cons, Uh1Nil, Uh2Cons, Uh2Nil, Uh3Cons, Uh3Nil, Uh4Cons, Uh4Nil, Uh5Cons, Uh5Nil, Us10PlainRow, Us10TallyRow, Us11None, Us11Some, Us1Null, Us1Text, Us1Whole, Us2None, Us2Some, Us3None, Us3Some, Us4None, Us4Some, Us5BrokenId, Us5Evicting, Us5Result, Us5Visible, Us5Wanted, Us6None, Us6Some, Us7Cancelled, Us7Evicted, Us7Started, Us8None, Us8Some, Us9None, Us9Some}
import xsim_frames/part1.{count_of_text_7, digits_end_6, method9, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_on_2, string_from_5}

pub fn fields_from_4(v0: String, v1: Int, v2: Uh5) -> Us2 {
    let v3 = v1 < 0
    let v6 =
        case v3 {
            True -> {
                True
            }
            False -> {
                let v4 = spiral_string_length(v0)
                let v5 = v1 > v4
                v5
            }
        }
    let v14 =
        case v6 {
            True -> {
                False
            }
            False -> {
                let v7 = spiral_string_length(v0)
                let v8 = spiral_wrap_signed(v7 - v1, 32)
                let v9 = spiral_wrap_signed(v1 + v8, 32)
                let v10 = spiral_wrap_signed(v9 - 1, 32)
                let v11 = spiral_string_slice(v0, v1, v10)
                let v12 = "\""
                let v13 = v11 |> string.starts_with(v12)
                v13
            }
        }
    let #(v90, v91, v92) =
        case v14 {
            True -> {
                let v15 = spiral_wrap_signed(v1 + 1, 32)
                let v16 = ""
                let #(v17, v18) = string_from_5(v0, v15, v16)
                let v19 = v18 < 0
                let v22 =
                    case v19 {
                        True -> {
                            True
                        }
                        False -> {
                            let v20 = spiral_string_length(v0)
                            let v21 = v18 > v20
                            v21
                        }
                    }
                let v30 =
                    case v22 {
                        True -> {
                            False
                        }
                        False -> {
                            let v23 = spiral_string_length(v0)
                            let v24 = spiral_wrap_signed(v23 - v18, 32)
                            let v25 = spiral_wrap_signed(v18 + v24, 32)
                            let v26 = spiral_wrap_signed(v25 - 1, 32)
                            let v27 = spiral_string_slice(v0, v18, v26)
                            let v28 = ":"
                            let v29 = v27 |> string.starts_with(v28)
                            v29
                        }
                    }
                let #(v86, v87) =
                    case v30 {
                        True -> {
                            let v31 = spiral_wrap_signed(v18 + 1, 32)
                            let v32 = v31 < 0
                            let v35 =
                                case v32 {
                                    True -> {
                                        True
                                    }
                                    False -> {
                                        let v33 = spiral_string_length(v0)
                                        let v34 = v31 > v33
                                        v34
                                    }
                                }
                            let v43 =
                                case v35 {
                                    True -> {
                                        False
                                    }
                                    False -> {
                                        let v36 = spiral_string_length(v0)
                                        let v37 = spiral_wrap_signed(v36 - v31, 32)
                                        let v38 = spiral_wrap_signed(v31 + v37, 32)
                                        let v39 = spiral_wrap_signed(v38 - 1, 32)
                                        let v40 = spiral_string_slice(v0, v31, v39)
                                        let v41 = "\""
                                        let v42 = v40 |> string.starts_with(v41)
                                        v42
                                    }
                                }
                            case v43 {
                                True -> {
                                    let v44 = spiral_wrap_signed(v31 + 1, 32)
                                    let #(v45, v46) = string_from_5(v0, v44, v16)
                                    let v47 = Us1Text(v45)
                                    #(v47, v46)
                                }
                                False -> {
                                    let v50 =
                                        case v32 {
                                            True -> {
                                                True
                                            }
                                            False -> {
                                                let v48 = spiral_string_length(v0)
                                                let v49 = v31 > v48
                                                v49
                                            }
                                        }
                                    let v58 =
                                        case v50 {
                                            True -> {
                                                False
                                            }
                                            False -> {
                                                let v51 = spiral_string_length(v0)
                                                let v52 = spiral_wrap_signed(v51 - v31, 32)
                                                let v53 = spiral_wrap_signed(v31 + v52, 32)
                                                let v54 = spiral_wrap_signed(v53 - 1, 32)
                                                let v55 = spiral_string_slice(v0, v31, v54)
                                                let v56 = "null"
                                                let v57 = v55 |> string.starts_with(v56)
                                                v57
                                            }
                                        }
                                    case v58 {
                                        True -> {
                                            let v59 = spiral_wrap_signed(v31 + 4, 32)
                                            let v60 = Us1Null
                                            #(v60, v59)
                                        }
                                        False -> {
                                            let v61 = v31 >= 0
                                            let v64 =
                                                case v61 {
                                                    True -> {
                                                        let v62 = spiral_string_length(v0)
                                                        let v63 = v31 < v62
                                                        v63
                                                    }
                                                    False -> {
                                                        False
                                                    }
                                                }
                                            case v64 {
                                                True -> {
                                                    let v65 = digits_end_6(v0, v31)
                                                    let v66 = spiral_wrap_signed(v65 - v31, 32)
                                                    let v67 = spiral_wrap_signed(v31 + v66, 32)
                                                    let v68 = spiral_wrap_signed(v67 - 1, 32)
                                                    let v69 = spiral_string_slice(v0, v31, v68)
                                                    let v70 = count_of_text_7(v69)
                                                    case v70  {
                                                        Us3None -> {
                                                            let v73 = Us1Null
                                                            #(v73, -1)
                                                        }
                                                        Us3Some(v71) -> {
                                                            let v72 = Us1Whole(v71)
                                                            #(v72, v65)
                                                        }
                                                    }
                                                }
                                                False -> {
                                                    let v78 = Us1Null
                                                    #(v78, -1)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        False -> {
                            let v85 = Us1Null
                            #(v85, -1)
                        }
                    }
                #(v17, v86, v87)
            }
            False -> {
                let v88 = ""
                let v89 = Us1Null
                #(v88, v89, -1)
            }
        }
    let v93 = v92 < 0
    let v96 =
        case v93 {
            True -> {
                True
            }
            False -> {
                let v94 = spiral_string_length(v0)
                let v95 = v92 > v94
                v95
            }
        }
    let v104 =
        case v96 {
            True -> {
                False
            }
            False -> {
                let v97 = spiral_string_length(v0)
                let v98 = spiral_wrap_signed(v97 - v92, 32)
                let v99 = spiral_wrap_signed(v92 + v98, 32)
                let v100 = spiral_wrap_signed(v99 - 1, 32)
                let v101 = spiral_string_slice(v0, v92, v100)
                let v102 = ","
                let v103 = v101 |> string.starts_with(v102)
                v103
            }
        }
    case v104 {
        True -> {
            let v105 = spiral_wrap_signed(v92 + 1, 32)
            let v106 = Uh5Cons(v90, v91, v2)
            fields_from_4(v0, v105, v106)
        }
        False -> {
            let v110 =
                case v93 {
                    True -> {
                        True
                    }
                    False -> {
                        let v108 = spiral_string_length(v0)
                        let v109 = v92 > v108
                        v109
                    }
                }
            let v118 =
                case v110 {
                    True -> {
                        False
                    }
                    False -> {
                        let v111 = spiral_string_length(v0)
                        let v112 = spiral_wrap_signed(v111 - v92, 32)
                        let v113 = spiral_wrap_signed(v92 + v112, 32)
                        let v114 = spiral_wrap_signed(v113 - 1, 32)
                        let v115 = spiral_string_slice(v0, v92, v114)
                        let v116 = "}"
                        let v117 = v115 |> string.starts_with(v116)
                        v117
                    }
                }
            let v122 =
                case v118 {
                    True -> {
                        let v119 = spiral_wrap_signed(v92 + 1, 32)
                        let v120 = spiral_string_length(v0)
                        let v121 = v119 == v120
                        v121
                    }
                    False -> {
                        False
                    }
                }
            case v122 {
                True -> {
                    let v123 = Uh5Nil
                    let v124 = Uh5Cons(v90, v91, v123)
                    let v125 = method9(v2, v124)
                    Us2Some(v125)
                }
                False -> {
                    Us2None
                }
            }
        }
    }
}

pub fn method12(v0: String, v1: Uh5) -> Us4 {
    case v1  {
        Uh5Cons(v3, v4, v5) -> {
            let v6 = v3 == v0
            case v6 {
                True -> {
                    Us4Some(v3, v4)
                }
                False -> {
                    method12(v0, v5)
                }
            }
        }
        Uh5Nil -> {
            Us4None
        }
    }
}

pub fn value_of_11(v0: String, v1: Uh5) -> Us1 {
    let v2 = method12(v0, v1)
    case v2  {
        Us4None -> {
            Us1Null
        }
        Us4Some(v3, v4) -> {
            v4
        }
    }
}

pub fn text_at_10(v0: String, v1: Uh5) -> String {
    let v2 = value_of_11(v0, v1)
    case v2  {
        Us1Text(v3) -> {
            v3
        }
        _ -> {
            let v4 = ""
            v4
        }
    }
}

pub fn count_at_13(v0: String, v1: Uh5) -> Int {
    let v2 = value_of_11(v0, v1)
    case v2  {
        Us1Whole(v3) -> {
            v3
        }
        _ -> {
            -1
        }
    }
}

pub fn method14(v0: Uh0, v1: Uh0) -> Uh0 {
    case v0  {
        Uh0Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method14(v6, v1)
            Uh0Cons(v2, v3, v4, v5, v7)
        }
        Uh0Nil -> {
            v1
        }
    }
}

pub fn method15(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method15(v3, v1)
            Uh3Cons(v2, v4)
        }
        Uh3Nil -> {
            v1
        }
    }
}

pub fn method16(v0: Uh2, v1: Uh2) -> Uh2 {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = method16(v4, v1)
            Uh2Cons(v2, v3, v5)
        }
        Uh2Nil -> {
            v1
        }
    }
}

pub fn method3(v0: Uh3, v1: Uh0, v2: Uh1, v3: Uh2, v4: Uh2, v5: Uh2, v6: Uh3, v7: Bool, v8: Uh4, v9: Uh3, v10: Uh3) -> #(Uh0, Uh1, Uh2, Uh2, Uh2, Uh3, Bool, Uh4, Uh3, Uh3) {
    let #(v294, v295, v296, v297, v298, v299, v300, v301, v302, v303) =
        case v0  {
            Uh3Cons(v11, v12) -> {
                let v13 = spiral_string_length(v11)
                let v14 = 0 > v13
                let v19 =
                    case v14 {
                        True -> {
                            False
                        }
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
                            fields_from_4(v11, v20, v21)
                        }
                        False -> {
                            Us2None
                        }
                    }
                let #(v264, v265, v266, v267, v268, v269, v270, v271, v272, v273) =
                    case v24  {
                        Us2Some(v25) -> {
                            let v26 = "row"
                            let v27 = text_at_10(v26, v25)
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
                                                                    False -> {
                                                                        Us6None
                                                                    }
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
                                                    False -> {
                                                        Us8None
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            let v72 =
                                case v48  {
                                    Us6None -> {
                                        case v61  {
                                            Us8None -> {
                                                Us9None
                                            }
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
                                                    let v76 = text_at_10(v75, v25)
                                                    let v77 = "key"
                                                    let v78 = text_at_10(v77, v25)
                                                    let v79 = ""
                                                    let v80 = "ok"
                                                    let v81 = v79 <> v80 
                                                    let v82 = count_at_13(v81, v25)
                                                    let v83 = v82 == 1
                                                    let v84 = "out"
                                                    let v85 = v79 <> v84 
                                                    let v86 = text_at_10(v85, v25)
                                                    let v87 = Uh0Nil
                                                    let v88 = Uh0Cons(v76, v78, v83, v86, v87)
                                                    let v89 = method14(v1, v88)
                                                    let v90 = "based"
                                                    let v91 = count_at_13(v90, v25)
                                                    let v92 = v91 == 1
                                                    case v92 {
                                                        True -> {
                                                            let v93 = "base_"
                                                            let v94 = v93 <> v80 
                                                            let v95 = count_at_13(v94, v25)
                                                            let v96 = v95 == 1
                                                            let v97 = v93 <> v84 
                                                            let v98 = text_at_10(v97, v25)
                                                            let v99 = Uh4Cons(v76, v96, v98, v8)
                                                            #(v89, v2, v3, v4, v5, v6, v7, v99, v9, v10)
                                                        }
                                                        False -> {
                                                            #(v89, v2, v3, v4, v5, v6, v7, v8, v9, v10)
                                                        }
                                                    }
                                                }
                                                _ -> {
                                                    let #(v153, v154, v155, v156, v157, v158, v159, v160, v161, v162) =
                                                        case v74  {
                                                            Us5BrokenId -> {
                                                                let v110 = "id"
                                                                let v111 = text_at_10(v110, v25)
                                                                let v112 = Uh3Cons(v111, v9)
                                                                #(v1, v2, v3, v4, v5, v6, v7, v8, v112, v10)
                                                            }
                                                            _ -> {
                                                                let #(v143, v144, v145, v146, v147, v148, v149, v150, v151, v152) =
                                                                    case v74  {
                                                                        Us5Evicting -> {
                                                                            #(v1, v2, v3, v4, v5, v6, True, v8, v9, v10)
                                                                        }
                                                                        _ -> {
                                                                            let #(v133, v134, v135, v136, v137, v138, v139, v140, v141, v142) =
                                                                                case v74  {
                                                                                    Us5Wanted -> {
                                                                                        let v113 = "id"
                                                                                        let v114 = text_at_10(v113, v25)
                                                                                        let v115 = "key"
                                                                                        let v116 = text_at_10(v115, v25)
                                                                                        let v117 = Uh1Cons(v114, v116, v2)
                                                                                        #(v1, v117, v3, v4, v5, v6, v7, v8, v9, v10)
                                                                                    }
                                                                                    _ -> {
                                                                                        let #(v123, v124, v125, v126, v127, v128, v129, v130, v131, v132) =
                                                                                            case v74  {
                                                                                                Us5Result -> {
                                                                                                    let v118 = "key"
                                                                                                    let v119 = text_at_10(v118, v25)
                                                                                                    let v120 = Uh3Nil
                                                                                                    let v121 = Uh3Cons(v119, v120)
                                                                                                    let v122 = method15(v6, v121)
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
                                                        let v175 = text_at_10(v174, v25)
                                                        let v176 = "count"
                                                        let v177 = count_at_13(v176, v25)
                                                        case v173  {
                                                            Us7Started -> {
                                                                let v178 = Uh2Nil
                                                                let v179 = Uh2Cons(v175, v177, v178)
                                                                let v180 = method16(v3, v179)
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
                                    Us2None -> {
                                        #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
                                    }
                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                }
                            #(v254, v255, v256, v257, v258, v259, v260, v261, v262, v263)
                        }
                    }
                method3(v12, v264, v265, v266, v267, v268, v269, v270, v271, v272, v273)
            }
            _ -> {
                let #(v284, v285, v286, v287, v288, v289, v290, v291, v292, v293) =
                    case v0  {
                        Uh3Nil -> {
                            #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10)
                        }
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
            True -> {
                Uh3Nil
            }
            False -> {
                let v3 = "\n"
                split_on_2(v3, v0)
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
    let #(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25) = method3(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15)
    #(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25)
}

pub fn method17(v0: Uh3, v1: Int) -> Int {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method17(v3, v4)
        }
        Uh3Nil -> {
            v1
        }
    }
}

pub fn method18(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = Uh3Cons(v2, v1)
            method18(v3, v4)
        }
        Uh3Nil -> {
            v1
        }
    }
}

pub fn concat_pass_21(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            case v4  {
                Uh3Cons(v5, v6) -> {
                    let v7 = v3 <> v0 
                    let v8 = v7 <> v5 
                    let v9 = Uh3Cons(v8, v2)
                    concat_pass_21(v0, v6, v9)
                }
                Uh3Nil -> {
                    let v11 = Uh3Nil
                    let v12 = Uh3Cons(v3, v11)
                    method18(v2, v12)
                }
            }
        }
        Uh3Nil -> {
            let v16 = Uh3Nil
            method18(v2, v16)
        }
    }
}

pub fn concat_balanced_20(v0: String, v1: Uh3) -> String {
    case v1  {
        Uh3Cons(v3, v4) -> {
            case v4  {
                Uh3Nil -> {
                    v3
                }
                _ -> {
                    let v5 = Uh3Nil
                    let v6 = concat_pass_21(v0, v1, v5)
                    concat_balanced_20(v0, v6)
                }
            }
        }
        Uh3Nil -> {
            let v2 = ""
            v2
        }
    }
}

pub fn delimited_19(v0: String, v1: Uh3) -> String {
    concat_balanced_20(v0, v1)
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
            False -> {
                False
            }
        }
    }
}

pub fn method23(v0: String, v1: String, v2: Bool, v3: String) -> fn(#(String, String)) -> Bool {
    closure2(#(v0, v1, v2, v3))
}

pub fn method24(v0: String, v1: String, v2: Bool, v3: String, v4: fn(#(String, String)) -> Bool, v5: Uh1) -> Bool {
    case v5  {
        Uh1Cons(v6, v7, v8) -> {
            let v9 = v4(#(v6, v7))
            case v9 {
                True -> {
                    True
                }
                False -> {
                    let v10 = method23(v0, v1, v2, v3)
                    method24(v0, v1, v2, v3, v10, v8)
                }
            }
        }
        Uh1Nil -> {
            False
        }
    }
}

pub fn method25(v0: String, v1: Uh4) -> Us11 {
    case v1  {
        Uh4Cons(v3, v4, v5, v6) -> {
            let v7 = v3 == v0
            case v7 {
                True -> {
                    Us11Some(v3, v4, v5)
                }
                False -> {
                    method25(v0, v6)
                }
            }
        }
        Uh4Nil -> {
            Us11None
        }
    }
}
