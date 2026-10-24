import gleam/bit_array
import gleam/string
import xsim_frames/types.{type Uh0, type Uh1, type Uh2, type Uh3, type Uh4, type Us4, type Us5, Uh0Cons, Uh0Nil, Uh1Cons, Uh1Nil, Uh2Cons, Uh2Nil, Uh3Cons, Uh3Nil, Uh4Cons, Uh4Nil, Uh5Nil, Us1None, Us1Some, Us4None, Us4Some, Us5None, Us5Some}
import xsim_frames/part1.{count_at_13, digits_end_6, fields_from_4, method14, method15, method16, spiral_binary_split_first, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_on_2, text_at_10}

pub fn method3(v0: Uh3, v1: Uh0, v2: Uh1, v3: Uh2, v4: Uh2, v5: Uh2, v6: Uh3, v7: Bool, v8: Uh4, v9: Uh3) -> #(Uh0, Uh1, Uh2, Uh2, Uh2, Uh3, Bool, Uh4, Uh3) {
    let #(v190, v191, v192, v193, v194, v195, v196, v197, v198) =
        case v0  {
            Uh3Cons(v10, v11) -> {
                let v12 = spiral_string_length(v10)
                let v13 = 0 > v12
                let v18 =
                    case v13 {
                        True -> {
                            False
                        }
                        False -> {
                            let v14 = spiral_wrap_signed(v12 - 1, 32)
                            let v15 = spiral_string_slice(v10, 0, v14)
                            let v16 = "{"
                            let v17 = v15 |> string.starts_with(v16)
                            v17
                        }
                    }
                let v23 =
                    case v18 {
                        True -> {
                            let v19 = 1
                            let v20 = Uh5Nil
                            fields_from_4(v10, v19, v20)
                        }
                        False -> {
                            Us1None
                        }
                    }
                let #(v163, v164, v165, v166, v167, v168, v169, v170, v171) =
                    case v23  {
                        Us1Some(v24) -> {
                            let v25 = "row"
                            let v26 = text_at_10(v25, v24)
                            let v27 = v26 == "visible"
                            case v27 {
                                True -> {
                                    let v28 = "id"
                                    let v29 = text_at_10(v28, v24)
                                    let v30 = "key"
                                    let v31 = text_at_10(v30, v24)
                                    let v32 = ""
                                    let v33 = "ok"
                                    let v34 = v32 <> v33 
                                    let v35 = count_at_13(v34, v24)
                                    let v36 = v35 == 1
                                    let v37 = "out"
                                    let v38 = v32 <> v37 
                                    let v39 = text_at_10(v38, v24)
                                    let v40 = Uh0Nil
                                    let v41 = Uh0Cons(v29, v31, v36, v39, v40)
                                    let v42 = method14(v1, v41)
                                    let v43 = "based"
                                    let v44 = count_at_13(v43, v24)
                                    let v45 = v44 == 1
                                    let #(v53, v54, v55, v56, v57, v58, v59, v60, v61) =
                                        case v45 {
                                            True -> {
                                                let v46 = "base_"
                                                let v47 = v46 <> v33 
                                                let v48 = count_at_13(v47, v24)
                                                let v49 = v48 == 1
                                                let v50 = v46 <> v37 
                                                let v51 = text_at_10(v50, v24)
                                                let v52 = Uh4Cons(v29, v49, v51, v8)
                                                #(v42, v2, v3, v4, v5, v6, v7, v52, v9)
                                            }
                                            False -> {
                                                #(v42, v2, v3, v4, v5, v6, v7, v8, v9)
                                            }
                                        }
                                    #(v53, v54, v55, v56, v57, v58, v59, v60, v61)
                                }
                                False -> {
                                    let v62 = text_at_10(v25, v24)
                                    let v63 = v62 == "wanted"
                                    let #(v136, v137, v138, v139, v140, v141, v142, v143, v144) =
                                        case v63 {
                                            True -> {
                                                let v64 = "id"
                                                let v65 = text_at_10(v64, v24)
                                                let v66 = "key"
                                                let v67 = text_at_10(v66, v24)
                                                let v68 = Uh1Cons(v65, v67, v2)
                                                #(v1, v68, v3, v4, v5, v6, v7, v8, v9)
                                            }
                                            False -> {
                                                let v69 = v62 == "result"
                                                let #(v127, v128, v129, v130, v131, v132, v133, v134, v135) =
                                                    case v69 {
                                                        True -> {
                                                            let v70 = "key"
                                                            let v71 = text_at_10(v70, v24)
                                                            let v72 = Uh3Nil
                                                            let v73 = Uh3Cons(v71, v72)
                                                            let v74 = method15(v6, v73)
                                                            #(v1, v2, v3, v4, v5, v74, v7, v8, v9)
                                                        }
                                                        False -> {
                                                            let v75 = v62 == "broken"
                                                            let #(v118, v119, v120, v121, v122, v123, v124, v125, v126) =
                                                                case v75 {
                                                                    True -> {
                                                                        let v76 = "id"
                                                                        let v77 = text_at_10(v76, v24)
                                                                        let v78 = Uh3Cons(v77, v9)
                                                                        #(v1, v2, v3, v4, v5, v6, v7, v8, v78)
                                                                    }
                                                                    False -> {
                                                                        let v79 = v62 == "evicting"
                                                                        let #(v109, v110, v111, v112, v113, v114, v115, v116, v117) =
                                                                            case v79 {
                                                                                True -> {
                                                                                    #(v1, v2, v3, v4, v5, v6, True, v8, v9)
                                                                                }
                                                                                False -> {
                                                                                    let v80 = "key"
                                                                                    let v81 = text_at_10(v80, v24)
                                                                                    let v82 = "count"
                                                                                    let v83 = count_at_13(v82, v24)
                                                                                    let v84 = v62 == "start"
                                                                                    let #(v100, v101, v102, v103, v104, v105, v106, v107, v108) =
                                                                                        case v84 {
                                                                                            True -> {
                                                                                                let v85 = Uh2Nil
                                                                                                let v86 = Uh2Cons(v81, v83, v85)
                                                                                                let v87 = method16(v3, v86)
                                                                                                #(v1, v2, v87, v4, v5, v6, v7, v8, v9)
                                                                                            }
                                                                                            False -> {
                                                                                                let v88 = v62 == "cancelled"
                                                                                                let #(v91, v92, v93, v94, v95, v96, v97, v98, v99) =
                                                                                                    case v88 {
                                                                                                        True -> {
                                                                                                            let v89 = Uh2Cons(v81, v83, v4)
                                                                                                            #(v1, v2, v3, v89, v5, v6, v7, v8, v9)
                                                                                                        }
                                                                                                        False -> {
                                                                                                            let v90 = Uh2Cons(v81, v83, v5)
                                                                                                            #(v1, v2, v3, v4, v90, v6, v7, v8, v9)
                                                                                                        }
                                                                                                    }
                                                                                                #(v91, v92, v93, v94, v95, v96, v97, v98, v99)
                                                                                            }
                                                                                        }
                                                                                    #(v100, v101, v102, v103, v104, v105, v106, v107, v108)
                                                                                }
                                                                            }
                                                                        #(v109, v110, v111, v112, v113, v114, v115, v116, v117)
                                                                    }
                                                                }
                                                            #(v118, v119, v120, v121, v122, v123, v124, v125, v126)
                                                        }
                                                    }
                                                #(v127, v128, v129, v130, v131, v132, v133, v134, v135)
                                            }
                                        }
                                    #(v136, v137, v138, v139, v140, v141, v142, v143, v144)
                                }
                            }
                        }
                        _ -> {
                            let #(v154, v155, v156, v157, v158, v159, v160, v161, v162) =
                                case v23  {
                                    Us1None -> {
                                        #(v1, v2, v3, v4, v5, v6, v7, v8, v9)
                                    }
                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                }
                            #(v154, v155, v156, v157, v158, v159, v160, v161, v162)
                        }
                    }
                method3(v11, v163, v164, v165, v166, v167, v168, v169, v170, v171)
            }
            _ -> {
                let #(v181, v182, v183, v184, v185, v186, v187, v188, v189) =
                    case v0  {
                        Uh3Nil -> {
                            #(v1, v2, v3, v4, v5, v6, v7, v8, v9)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v181, v182, v183, v184, v185, v186, v187, v188, v189)
            }
        }
    #(v190, v191, v192, v193, v194, v195, v196, v197, v198)
}

pub fn snapshot_read_1(v0: String) -> #(Uh0, Uh1, Uh2, Uh2, Uh2, Uh3, Bool, Uh4, Uh3) {
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
    let #(v15, v16, v17, v18, v19, v20, v21, v22, v23) = method3(v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    #(v15, v16, v17, v18, v19, v20, v21, v22, v23)
}

pub fn method18(v0: String, v1: String, v2: Bool, v3: String, v4: Uh1, v5: Us4) -> Us4 {
    case v4  {
        Uh1Cons(v6, v7, v8) -> {
            let v9 = method18(v0, v1, v2, v3, v8, v5)
            let v10 = v6 == v0
            let v12 =
                case v10 {
                    True -> {
                        let v11 = v7 == v1
                        v11
                    }
                    False -> {
                        False
                    }
                }
            case v12 {
                True -> {
                    Us4Some(v6, v7)
                }
                False -> {
                    v9
                }
            }
        }
        Uh1Nil -> {
            v5
        }
    }
}

pub fn method19(v0: String, v1: Uh4, v2: Us5) -> Us5 {
    case v1  {
        Uh4Cons(v3, v4, v5, v6) -> {
            let v7 = method19(v0, v6, v2)
            let v8 = v3 == v0
            case v8 {
                True -> {
                    Us5Some(v3, v4, v5)
                }
                False -> {
                    v7
                }
            }
        }
        Uh4Nil -> {
            v2
        }
    }
}

pub fn masked_cells_20(v0: String, v1: Int, v2: String) -> String {
    let v3 = spiral_string_length(v0)
    let v4 = spiral_wrap_signed(v3 - v1, 32)
    let v5 = spiral_wrap_signed(v1 + v4, 32)
    let v6 = spiral_wrap_signed(v5 - 1, 32)
    let v7 = spiral_string_slice(v0, v1, v6)
    let v8 = "spiral_cells"
    let v9 = case v8 { "" -> 0 _ -> case spiral_binary_split_first(v7, v8) { [spiral_head, _] -> bit_array.byte_size(bit_array.from_string(spiral_head)) _ -> -1 } }
    let v10 = v9 < 0
    let v13 =
        case v10 {
            True -> {
                -1
            }
            False -> {
                let v11 = spiral_wrap_signed(v1 + v9, 32)
                let v12 = spiral_wrap_signed(v11 + 12, 32)
                v12
            }
        }
    let v14 = v13 < 0
    case v14 {
        True -> {
            let v15 = v2 <> v7 
            v15
        }
        False -> {
            let v16 = spiral_wrap_signed(v13 + 1, 32)
            let v17 = spiral_wrap_signed(v3 - v13, 32)
            let v18 = spiral_wrap_signed(v13 + v17, 32)
            let v19 = spiral_wrap_signed(v18 - 1, 32)
            let v20 = spiral_string_slice(v0, v13, v19)
            let v21 = "\\"
            let v22 = v20 |> string.starts_with(v21)
            let v24 =
                case v22 {
                    True -> {
                        digits_end_6(v0, v16)
                    }
                    False -> {
                        -1
                    }
                }
            let v25 = v24 > v16
            let v26 =
                case v25 {
                    True -> {
                        v24
                    }
                    False -> {
                        -1
                    }
                }
            let v27 = v26 >= 0
            let v34 =
                case v27 {
                    True -> {
                        v26
                    }
                    False -> {
                        let v28 = "/"
                        let v29 = v20 |> string.starts_with(v28)
                        let v31 =
                            case v29 {
                                True -> {
                                    digits_end_6(v0, v16)
                                }
                                False -> {
                                    -1
                                }
                            }
                        let v32 = v31 > v16
                        case v32 {
                            True -> {
                                v31
                            }
                            False -> {
                                -1
                            }
                        }
                    }
                }
            let v35 = v34 < 0
            let v47 =
                case v35 {
                    True -> {
                        -1
                    }
                    False -> {
                        let v36 = spiral_wrap_signed(v34 + 1, 32)
                        let v37 = spiral_wrap_signed(v3 - v34, 32)
                        let v38 = spiral_wrap_signed(v34 + v37, 32)
                        let v39 = spiral_wrap_signed(v38 - 1, 32)
                        let v40 = spiral_string_slice(v0, v34, v39)
                        let v41 = "-"
                        let v42 = v40 |> string.starts_with(v41)
                        let v44 =
                            case v42 {
                                True -> {
                                    digits_end_6(v0, v36)
                                }
                                False -> {
                                    -1
                                }
                            }
                        let v45 = v44 > v36
                        case v45 {
                            True -> {
                                v44
                            }
                            False -> {
                                -1
                            }
                        }
                    }
                }
            let v48 = spiral_wrap_signed(v13 - v1, 32)
            let v49 = spiral_wrap_signed(v1 + v48, 32)
            let v50 = spiral_wrap_signed(v49 - 1, 32)
            let v51 = spiral_string_slice(v0, v1, v50)
            let v52 = v2 <> v51 
            let v53 = v47 < 0
            let #(v56, v57) =
                case v53 {
                    True -> {
                        #(v52, v13)
                    }
                    False -> {
                        let v54 = "/_"
                        let v55 = v52 <> v54 
                        #(v55, v47)
                    }
                }
            masked_cells_20(v0, v57, v56)
        }
    }
}

pub fn masked_threads_21(v0: String, v1: Int, v2: String) -> String {
    let v3 = spiral_string_length(v0)
    let v4 = spiral_wrap_signed(v3 - v1, 32)
    let v5 = spiral_wrap_signed(v1 + v4, 32)
    let v6 = spiral_wrap_signed(v5 - 1, 32)
    let v7 = spiral_string_slice(v0, v1, v6)
    let v8 = "thread '"
    let v9 = case v8 { "" -> 0 _ -> case spiral_binary_split_first(v7, v8) { [spiral_head, _] -> bit_array.byte_size(bit_array.from_string(spiral_head)) _ -> -1 } }
    let v10 = v9 < 0
    let v13 =
        case v10 {
            True -> {
                -1
            }
            False -> {
                let v11 = spiral_wrap_signed(v1 + v9, 32)
                let v12 = spiral_wrap_signed(v11 + 8, 32)
                v12
            }
        }
    let v14 = v13 < 0
    let v25 =
        case v14 {
            True -> {
                -1
            }
            False -> {
                let v15 = spiral_wrap_signed(v3 - v13, 32)
                let v16 = spiral_wrap_signed(v13 + v15, 32)
                let v17 = spiral_wrap_signed(v16 - 1, 32)
                let v18 = spiral_string_slice(v0, v13, v17)
                let v19 = "'"
                let v20 = case v19 { "" -> 0 _ -> case spiral_binary_split_first(v18, v19) { [spiral_head, _] -> bit_array.byte_size(bit_array.from_string(spiral_head)) _ -> -1 } }
                let v21 = v20 < 0
                case v21 {
                    True -> {
                        -1
                    }
                    False -> {
                        let v22 = spiral_wrap_signed(v13 + v20, 32)
                        let v23 = spiral_wrap_signed(v22 + 1, 32)
                        v23
                    }
                }
            }
        }
    let v26 = v25 < 0
    case v26 {
        True -> {
            let v27 = v2 <> v7 
            v27
        }
        False -> {
            let v28 = spiral_wrap_signed(v25 + 2, 32)
            let v29 = spiral_wrap_signed(v3 - v25, 32)
            let v30 = spiral_wrap_signed(v25 + v29, 32)
            let v31 = spiral_wrap_signed(v30 - 1, 32)
            let v32 = spiral_string_slice(v0, v25, v31)
            let v33 = " ("
            let v34 = v32 |> string.starts_with(v33)
            let v36 =
                case v34 {
                    True -> {
                        digits_end_6(v0, v28)
                    }
                    False -> {
                        -1
                    }
                }
            let v37 = v36 > v28
            let v38 =
                case v37 {
                    True -> {
                        v36
                    }
                    False -> {
                        -1
                    }
                }
            let v39 = v38 >= 0
            let v46 =
                case v39 {
                    True -> {
                        let v40 = spiral_wrap_signed(v3 - v38, 32)
                        let v41 = spiral_wrap_signed(v38 + v40, 32)
                        let v42 = spiral_wrap_signed(v41 - 1, 32)
                        let v43 = spiral_string_slice(v0, v38, v42)
                        let v44 = ") panicked"
                        let v45 = v43 |> string.starts_with(v44)
                        v45
                    }
                    False -> {
                        False
                    }
                }
            let v48 =
                case v46 {
                    True -> {
                        let v47 = spiral_wrap_signed(v38 + 10, 32)
                        v47
                    }
                    False -> {
                        -1
                    }
                }
            let v49 = v48 < 0
            let #(v62, v63) =
                case v49 {
                    True -> {
                        let v50 = spiral_wrap_signed(v13 - v1, 32)
                        let v51 = spiral_wrap_signed(v1 + v50, 32)
                        let v52 = spiral_wrap_signed(v51 - 1, 32)
                        let v53 = spiral_string_slice(v0, v1, v52)
                        let v54 = v2 <> v53 
                        #(v54, v13)
                    }
                    False -> {
                        let v55 = spiral_wrap_signed(v25 - v1, 32)
                        let v56 = spiral_wrap_signed(v1 + v55, 32)
                        let v57 = spiral_wrap_signed(v56 - 1, 32)
                        let v58 = spiral_string_slice(v0, v1, v57)
                        let v59 = v2 <> v58 
                        let v60 = " (_) panicked"
                        let v61 = v59 <> v60 
                        #(v61, v48)
                    }
                }
            masked_threads_21(v0, v63, v62)
        }
    }
}

pub fn method17(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh0, v8: Uh1, v9: Uh2, v10: Uh2, v11: Uh2, v12: Uh3, v13: Bool, v14: Uh4, v15: Uh3, v16: Uh0, v17: Uh0) -> Uh0 {
    case v16  {
        Uh0Cons(v18, v19, v20, v21, v22) -> {
            let v23 = method17(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v22, v17)
            let v24 = Us4None
            let v25 = method18(v18, v19, v20, v21, v1, v24)
            let v29 =
                case v25  {
                    Us4None -> {
                        False
                    }
                    Us4Some(v26, v27) -> {
                        True
                    }
                }
            let v53 =
                case v29 {
                    True -> {
                        let v30 = Us5None
                        let v31 = method19(v18, v14, v30)
                        let #(v38, v39) =
                            case v31  {
                                Us5Some(v32, v33, v34) -> {
                                    #(v33, v34)
                                }
                                _ -> {
                                    let #(v36, v37) =
                                        case v31  {
                                            Us5None -> {
                                                let v35 = ""
                                                #(False, v35)
                                            }
                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                        }
                                    #(v36, v37)
                                }
                            }
                        let v40 = 0
                        let v41 = ""
                        let v42 = masked_cells_20(v39, v40, v41)
                        let v43 = 0
                        let v44 = masked_threads_21(v42, v43, v41)
                        let v45 = 0
                        let v46 = masked_cells_20(v21, v45, v41)
                        let v47 = 0
                        let v48 = masked_threads_21(v46, v47, v41)
                        let v49 = v38 == v20
                        let v51 =
                            case v49 {
                                True -> {
                                    let v50 = v44 == v48
                                    v50
                                }
                                False -> {
                                    False
                                }
                            }
                        let v52 = v51 == False
                        v52
                    }
                    False -> {
                        False
                    }
                }
            case v53 {
                True -> {
                    Uh0Cons(v18, v19, v20, v21, v23)
                }
                False -> {
                    v23
                }
            }
        }
        Uh0Nil -> {
            v17
        }
    }
}

pub fn method22(v0: Uh0, v1: Uh3) -> Uh3 {
    case v0  {
        Uh0Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method22(v6, v1)
            Uh3Cons(v2, v7)
        }
        Uh0Nil -> {
            v1
        }
    }
}

pub fn go_23(v0: Int, v1: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0 > 0
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v0 - 1, 32)
                    let v6 = go_23(v5, v3)
                    Uh3Cons(v2, v6)
                }
                False -> {
                    Uh3Nil
                }
            }
        }
        _ -> {
            Uh3Nil
        }
    }
}

pub fn method24(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh0, v8: Uh0) -> Uh0 {
    case v7  {
        Uh0Cons(v9, v10, v11, v12, v13) -> {
            let v14 = method24(v0, v1, v2, v3, v4, v5, v6, v13, v8)
            let v15 = Us4None
            let v16 = method18(v9, v10, v11, v12, v1, v15)
            let v20 =
                case v16  {
                    Us4None -> {
                        False
                    }
                    Us4Some(v17, v18) -> {
                        True
                    }
                }
            let v21 = v20 == False
            case v21 {
                True -> {
                    Uh0Cons(v9, v10, v11, v12, v14)
                }
                False -> {
                    v14
                }
            }
        }
        Uh0Nil -> {
            v8
        }
    }
}

pub fn method26(v0: String, v1: Uh2, v2: Uh2) -> Uh2 {
    case v1  {
        Uh2Cons(v3, v4, v5) -> {
            let v6 = method26(v0, v5, v2)
            let v7 = v3 == v0
            case v7 {
                True -> {
                    Uh2Cons(v3, v4, v6)
                }
                False -> {
                    v6
                }
            }
        }
        Uh2Nil -> {
            v2
        }
    }
}

pub fn method27(v0: Uh2, v1: Int) -> Int {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + v3, 32)
            method27(v4, v5)
        }
        Uh2Nil -> {
            v1
        }
    }
}

pub fn method25(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh2, v8: Uh2) -> Uh2 {
    case v7  {
        Uh2Cons(v9, v10, v11) -> {
            let v12 = method25(v0, v1, v2, v3, v4, v5, v6, v11, v8)
            let v13 = Uh2Nil
            let v14 = method26(v9, v3, v13)
            let v15 = 0
            let v16 = method27(v14, v15)
            let v17 = spiral_wrap_signed(v10 - v16, 32)
            let v18 = Uh2Nil
            let v19 = method26(v9, v4, v18)
            let v20 = 0
            let v21 = method27(v19, v20)
            let v22 = spiral_wrap_signed(v17 - v21, 32)
            let v23 = v22 > 1
            case v23 {
                True -> {
                    Uh2Cons(v9, v10, v12)
                }
                False -> {
                    v12
                }
            }
        }
        Uh2Nil -> {
            v8
        }
    }
}

pub fn method28(v0: Uh2, v1: Uh3) -> Uh3 {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = method28(v4, v1)
            Uh3Cons(v2, v5)
        }
        Uh2Nil -> {
            v1
        }
    }
}

pub fn method30(v0: String, v1: String, v2: Bool, v3: String, v4: Uh1, v5: Us4) -> Us4 {
    case v4  {
        Uh1Cons(v6, v7, v8) -> {
            let v9 = method30(v0, v1, v2, v3, v8, v5)
            let v10 = v6 == v0
            case v10 {
                True -> {
                    Us4Some(v6, v7)
                }
                False -> {
                    v9
                }
            }
        }
        Uh1Nil -> {
            v5
        }
    }
}

pub fn method29(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh0, v8: Uh0) -> Uh0 {
    case v7  {
        Uh0Cons(v9, v10, v11, v12, v13) -> {
            let v14 = method29(v0, v1, v2, v3, v4, v5, v6, v13, v8)
            let v15 = Us4None
            let v16 = method30(v9, v10, v11, v12, v1, v15)
            let v20 =
                case v16  {
                    Us4None -> {
                        False
                    }
                    Us4Some(v17, v18) -> {
                        True
                    }
                }
            let v21 = v20 == False
            case v21 {
                True -> {
                    Uh0Cons(v9, v10, v11, v12, v14)
                }
                False -> {
                    v14
                }
            }
        }
        Uh0Nil -> {
            v8
        }
    }
}

pub fn method32(v0: String, v1: Uh1, v2: Us4) -> Us4 {
    case v1  {
        Uh1Cons(v3, v4, v5) -> {
            let v6 = method32(v0, v5, v2)
            let v7 = v4 == v0
            case v7 {
                True -> {
                    Us4Some(v3, v4)
                }
                False -> {
                    v6
                }
            }
        }
        Uh1Nil -> {
            v2
        }
    }
}

pub fn method31(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh3, v8: Uh3) -> Uh3 {
    case v7  {
        Uh3Cons(v9, v10) -> {
            let v11 = method31(v0, v1, v2, v3, v4, v5, v6, v10, v8)
            let v12 = Us4None
            let v13 = method32(v9, v1, v12)
            let v17 =
                case v13  {
                    Us4None -> {
                        False
                    }
                    Us4Some(v14, v15) -> {
                        True
                    }
                }
            let v18 = v17 == False
            case v18 {
                True -> {
                    Uh3Cons(v9, v11)
                }
                False -> {
                    v11
                }
            }
        }
        Uh3Nil -> {
            v8
        }
    }
}

pub fn method37(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = Uh3Cons(v2, v1)
            method37(v3, v4)
        }
        Uh3Nil -> {
            v1
        }
    }
}

pub fn concat_pass_36(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            case v4  {
                Uh3Cons(v5, v6) -> {
                    let v7 = v3 <> v0 
                    let v8 = v7 <> v5 
                    let v9 = Uh3Cons(v8, v2)
                    concat_pass_36(v0, v6, v9)
                }
                Uh3Nil -> {
                    let v11 = Uh3Nil
                    let v12 = Uh3Cons(v3, v11)
                    method37(v2, v12)
                }
            }
        }
        Uh3Nil -> {
            let v16 = Uh3Nil
            method37(v2, v16)
        }
    }
}

pub fn concat_balanced_35(v0: String, v1: Uh3) -> String {
    case v1  {
        Uh3Cons(v3, v4) -> {
            case v4  {
                Uh3Nil -> {
                    v3
                }
                _ -> {
                    let v5 = Uh3Nil
                    let v6 = concat_pass_36(v0, v1, v5)
                    concat_balanced_35(v0, v6)
                }
            }
        }
        Uh3Nil -> {
            let v2 = ""
            v2
        }
    }
}

pub fn delimited_34(v0: String, v1: Uh3) -> String {
    concat_balanced_35(v0, v1)
}
