import gleam/bit_array
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Us0, type Uh7, type Uh9, type Uh10, type Uh12, type Uh13, type Uh14, Uh10Cons, Uh10Nil, Uh12Cons, Uh12Nil, Uh13Cons, Uh13Nil, Uh14Cons, Uh14Nil, Uh3Cons, Uh3Nil, Uh7Cons, Uh7Nil, Uh9Cons, Uh9Nil, Us0None, Us0Some, Us14Breaker, Us14Editor, Us14Fickle, Us14Lurker, Us16Content, Us16Reaction, Us16Revision, Us17Posted, Us18Edited, Us19Liked, Us19Unliked, Us20None, Us20Some}
import xsim_frames/part1.{closure1, spiral_string_length, spiral_string_slice, spiral_wrap_signed, spiral_wrap_unsigned}
import xsim_frames/part2.{method15}
import xsim_frames/part4.{blank_start_81, method73, method77, picked_78, uniform_67}

pub fn digits_start_82(v0: String, v1: Int) -> Int {
    let v2 = v1 > 0
    let v34 =
        case v2 {
            True -> {
                let v3 = spiral_wrap_signed(v1 - 1, 32)
                let v4 = spiral_string_slice(v0, 0, v3)
                let v5 = string.inspect(0)
                let v6 = v4 |> string.ends_with(v5)
                case v6 {
                    True -> {
                        True
                    }
                    False -> {
                        let v7 = string.inspect(1)
                        let v8 = v4 |> string.ends_with(v7)
                        case v8 {
                            True -> {
                                True
                            }
                            False -> {
                                let v9 = string.inspect(2)
                                let v10 = v4 |> string.ends_with(v9)
                                case v10 {
                                    True -> {
                                        True
                                    }
                                    False -> {
                                        let v11 = string.inspect(3)
                                        let v12 = v4 |> string.ends_with(v11)
                                        case v12 {
                                            True -> {
                                                True
                                            }
                                            False -> {
                                                let v13 = string.inspect(4)
                                                let v14 = v4 |> string.ends_with(v13)
                                                case v14 {
                                                    True -> {
                                                        True
                                                    }
                                                    False -> {
                                                        let v15 = string.inspect(5)
                                                        let v16 = v4 |> string.ends_with(v15)
                                                        case v16 {
                                                            True -> {
                                                                True
                                                            }
                                                            False -> {
                                                                let v17 = string.inspect(6)
                                                                let v18 = v4 |> string.ends_with(v17)
                                                                case v18 {
                                                                    True -> {
                                                                        True
                                                                    }
                                                                    False -> {
                                                                        let v19 = string.inspect(7)
                                                                        let v20 = v4 |> string.ends_with(v19)
                                                                        case v20 {
                                                                            True -> {
                                                                                True
                                                                            }
                                                                            False -> {
                                                                                let v21 = string.inspect(8)
                                                                                let v22 = v4 |> string.ends_with(v21)
                                                                                case v22 {
                                                                                    True -> {
                                                                                        True
                                                                                    }
                                                                                    False -> {
                                                                                        let v23 = string.inspect(9)
                                                                                        let v24 = v4 |> string.ends_with(v23)
                                                                                        v24
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
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            False -> {
                False
            }
        }
    case v34 {
        True -> {
            let v35 = spiral_wrap_signed(v1 - 1, 32)
            digits_start_82(v0, v35)
        }
        False -> {
            v1
        }
    }
}

pub fn unpadded_83(v0: String) -> String {
    let v1 = spiral_string_length(v0)
    let v2 = v1 > 1
    let v5 =
        case v2 {
            True -> {
                let v3 = "0"
                let v4 = v0 |> string.starts_with(v3)
                v4
            }
            False -> {
                False
            }
        }
    case v5 {
        True -> {
            let v6 = spiral_wrap_signed(v1 - 1, 32)
            let v7 = spiral_wrap_signed(1 + v6, 32)
            let v8 = spiral_wrap_signed(v7 - 1, 32)
            let v9 = spiral_string_slice(v0, 1, v8)
            unpadded_83(v9)
        }
        False -> {
            v0
        }
    }
}

pub fn plus_one_84(v0: String) -> String {
    let v1 = v0 == ""
    let v17 =
        case v1 {
            True -> {
                -1
            }
            False -> {
                let v2 = spiral_string_length(v0)
                let v3 = spiral_wrap_signed(v2 - 1, 32)
                let v4 = spiral_string_slice(v0, v3, v3)
                let v5 = v4 == ""
                case v5 {
                    True -> {
                        0
                    }
                    False -> {
                        let v6 = "0123456789"
                        let v7 = option.from_result(result.map(string.split_once(v6, v4), pair.first))
                        let v8 = closure1(Nil)
                        let v9 = v7 |> option.map(v8)
                        let v10 = Us0None
                        let v11 = v9 |> option.unwrap(v10)
                        case v11  {
                            Us0None -> {
                                -1
                            }
                            Us0Some(v12) -> {
                                let v13 = bit_array.byte_size(bit_array.from_string(v12))
                                v13
                            }
                        }
                    }
                }
            }
        }
    let v18 = v17 < 0
    case v18 {
        True -> {
            let v19 = "1"
            v19
        }
        False -> {
            let v20 = v17 == 9
            case v20 {
                True -> {
                    let v21 = spiral_string_length(v0)
                    let v22 = spiral_wrap_signed(v21 - 1, 32)
                    let v23 = spiral_wrap_signed(v22 - 1, 32)
                    let v24 = spiral_string_slice(v0, 0, v23)
                    let v25 = plus_one_84(v24)
                    let v26 = "0"
                    let v27 = v25 <> v26 
                    v27
                }
                False -> {
                    let v28 = spiral_string_length(v0)
                    let v29 = spiral_wrap_signed(v28 - 1, 32)
                    let v30 = spiral_wrap_signed(v29 - 1, 32)
                    let v31 = spiral_string_slice(v0, 0, v30)
                    let v32 = spiral_wrap_signed(v17 + 1, 32)
                    let v33 = string.inspect(v32)
                    let v34 = v31 <> v33 
                    v34
                }
            }
        }
    }
}

pub fn break_source_80(v0: String) -> String {
    let v1 = spiral_string_length(v0)
    let v2 = blank_start_81(v0, v1)
    let v3 = digits_start_82(v0, v2)
    let v4 = v3 == v2
    case v4 {
        True -> {
            v0
        }
        False -> {
            let v5 = v3 > 0
            let v10 =
                case v5 {
                    True -> {
                        let v6 = spiral_wrap_signed(v3 - 1, 32)
                        let v7 = spiral_string_slice(v0, 0, v6)
                        let v8 = "."
                        let v9 = v7 |> string.ends_with(v8)
                        v9
                    }
                    False -> {
                        False
                    }
                }
            case v10 {
                True -> {
                    let v11 = spiral_wrap_signed(v3 - 1, 32)
                    let v12 = digits_start_82(v0, v11)
                    let v13 = v12 == v11
                    let v20 =
                        case v13 {
                            True -> {
                                True
                            }
                            False -> {
                                let v14 = v12 > 0
                                case v14 {
                                    True -> {
                                        let v15 = spiral_wrap_signed(v12 - 1, 32)
                                        let v16 = spiral_string_slice(v0, 0, v15)
                                        let v17 = "."
                                        let v18 = v16 |> string.ends_with(v17)
                                        v18
                                    }
                                    False -> {
                                        False
                                    }
                                }
                            }
                        }
                    case v20 {
                        True -> {
                            v0
                        }
                        False -> {
                            let v21 = spiral_wrap_signed(v12 - 1, 32)
                            let v22 = spiral_string_slice(v0, 0, v21)
                            let v23 = spiral_wrap_signed(v11 - v12, 32)
                            let v24 = spiral_wrap_signed(v12 + v23, 32)
                            let v25 = spiral_wrap_signed(v24 - 1, 32)
                            let v26 = spiral_string_slice(v0, v12, v25)
                            let v27 = unpadded_83(v26)
                            let v28 = plus_one_84(v27)
                            let v29 = v22 <> v28 
                            let v30 = spiral_wrap_signed(v1 - v11, 32)
                            let v31 = spiral_wrap_signed(v11 + v30, 32)
                            let v32 = spiral_wrap_signed(v31 - 1, 32)
                            let v33 = spiral_string_slice(v0, v11, v32)
                            let v34 = v29 <> v33 
                            v34
                        }
                    }
                }
                False -> {
                    let v36 = spiral_wrap_signed(v3 - 1, 32)
                    let v37 = spiral_string_slice(v0, 0, v36)
                    let v38 = spiral_wrap_signed(v2 - v3, 32)
                    let v39 = spiral_wrap_signed(v3 + v38, 32)
                    let v40 = spiral_wrap_signed(v39 - 1, 32)
                    let v41 = spiral_string_slice(v0, v3, v40)
                    let v42 = unpadded_83(v41)
                    let v43 = plus_one_84(v42)
                    let v44 = v37 <> v43 
                    let v45 = spiral_wrap_signed(v1 - v2, 32)
                    let v46 = spiral_wrap_signed(v2 + v45, 32)
                    let v47 = spiral_wrap_signed(v46 - 1, 32)
                    let v48 = spiral_string_slice(v0, v2, v47)
                    let v49 = v44 <> v48 
                    v49
                }
            }
        }
    }
}

pub fn method79(v0: Uh9, v1: Uh9) -> Uh9 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = method79(v5, v1)
            let v7 = "///- --test"
            let v8 = v4 |> string.contains(v7)
            let v11 =
                case v8 {
                    True -> {
                        let v9 = break_source_80(v4)
                        let v10 = v9 != v4
                        v10
                    }
                    False -> {
                        False
                    }
                }
            case v11 {
                True -> {
                    Uh9Cons(v2, v3, v4, v6)
                }
                False -> {
                    v6
                }
            }
        }
        Uh9Nil -> {
            v1
        }
    }
}

pub fn method85(v0: Uh9, v1: Uh13, v2: Uh10, v3: Int, v4: Int) -> #(Uh10, Int, Int) {
    case v1  {
        Uh13Cons(v5, v6) -> {
            let v7 = 0
            let v8 = method77(v0, v7)
            let v9 = spiral_wrap_unsigned(v8, 64)
            let #(v10, v11, v12) = uniform_67(v9, v3, v4)
            let v13 = spiral_wrap_signed(v10, 32)
            let v14 = spiral_wrap_signed(v13 - 1, 32)
            let v15 = picked_78(v14, v0)
            let #(v28, v29, v30) =
                case v15  {
                    Us20None -> {
                        #(v2, v11, v12)
                    }
                    Us20Some(v16, v17, v18) -> {
                        let v19 = break_source_80(v18)
                        let v20 = Us18Edited(v16, v19)
                        let v21 = Us16Revision(v20)
                        let v22 = Uh10Nil
                        let v23 = Uh10Cons(v21, v22)
                        let v24 = method73(v2, v23)
                        #(v24, v11, v12)
                    }
                }
            method85(v0, v6, v28, v29, v30)
        }
        Uh13Nil -> {
            #(v2, v3, v4)
        }
    }
}

pub fn method88(v0: String, v1: Uh9, v2: Uh10, v3: Int, v4: Int) -> #(Uh10, Int, Int) {
    case v1  {
        Uh9Cons(v5, v6, v7, v8) -> {
            let v9 = 2
            let #(v10, v11, v12) = uniform_67(v9, v3, v4)
            let v13 = spiral_wrap_signed(v10, 32)
            let v14 = v13 == 1
            let v20 =
                case v14 {
                    True -> {
                        let v15 = Us19Liked(v5, v0)
                        let v16 = Us16Reaction(v15)
                        let v17 = Uh10Nil
                        let v18 = Uh10Cons(v16, v17)
                        method73(v2, v18)
                    }
                    False -> {
                        v2
                    }
                }
            method88(v0, v8, v20, v11, v12)
        }
        Uh9Nil -> {
            #(v2, v3, v4)
        }
    }
}

pub fn method89(v0: Uh9, v1: Uh9) -> Uh9 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = method89(v5, v1)
            let v7 = "///- --test"
            let v8 = v4 |> string.contains(v7)
            let v9 = v8 == False
            case v9 {
                True -> {
                    Uh9Cons(v2, v3, v4, v6)
                }
                False -> {
                    v6
                }
            }
        }
        Uh9Nil -> {
            v1
        }
    }
}

pub fn method90(v0: Uh9, v1: Uh9) -> Uh9 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = method90(v5, v1)
            let v7 = "///- --test"
            let v8 = v4 |> string.contains(v7)
            let v11 =
                case v8 {
                    True -> {
                        let v9 = break_source_80(v4)
                        let v10 = v9 != v4
                        v10
                    }
                    False -> {
                        False
                    }
                }
            case v11 {
                True -> {
                    Uh9Cons(v2, v3, v4, v6)
                }
                False -> {
                    v6
                }
            }
        }
        Uh9Nil -> {
            v1
        }
    }
}

pub fn method91(v0: Uh14, v1: Uh14) -> Uh14 {
    case v0  {
        Uh14Cons(v2, v3) -> {
            let v4 = method91(v3, v1)
            Uh14Cons(v2, v4)
        }
        Uh14Nil -> {
            v1
        }
    }
}

pub fn method87(v0: Uh9, v1: Uh7, v2: Uh14, v3: Uh3, v4: Int, v5: Int, v6: Int) -> #(Uh14, Uh3, Int, Int, Int) {
    let #(v206, v207, v208, v209, v210) =
        case v1  {
            Uh7Cons(v7, v8) -> {
                let v16 =
                    case v7  {
                        Us14Breaker -> {
                            let v12 = "breaker"
                            v12
                        }
                        Us14Editor -> {
                            let v11 = "editor"
                            v11
                        }
                        Us14Fickle -> {
                            let v10 = "fickle"
                            v10
                        }
                        Us14Lurker -> {
                            let v9 = "lurker"
                            v9
                        }
                    }
                let v17 = string.inspect(v6)
                let v18 = v16 <> v17 
                let #(v187, v188, v189, v190) =
                    case v7  {
                        Us14Lurker -> {
                            let v19 = Uh10Nil
                            let #(v20, v21, v22) = method88(v18, v0, v19, v4, v5)
                            let v23 = Uh3Nil
                            #(v20, v23, v21, v22)
                        }
                        _ -> {
                            let #(v183, v184, v185, v186) =
                                case v7  {
                                    Us14Fickle -> {
                                        case v0  {
                                            Uh9Nil -> {
                                                let v24 = Uh10Nil
                                                let v25 = Uh3Nil
                                                #(v24, v25, v4, v5)
                                            }
                                            _ -> {
                                                let v26 = 0
                                                let v27 = method77(v0, v26)
                                                let v28 = spiral_wrap_unsigned(v27, 64)
                                                let #(v29, v30, v31) = uniform_67(v28, v4, v5)
                                                let v32 = spiral_wrap_signed(v29, 32)
                                                let v33 = spiral_wrap_signed(v32 - 1, 32)
                                                let v34 = picked_78(v33, v0)
                                                let #(v61, v62, v63, v64) =
                                                    case v34  {
                                                        Us20Some(v35, v36, v37) -> {
                                                            let v38 = Us19Liked(v35, v18)
                                                            let v39 = Us16Reaction(v38)
                                                            let v40 = Us19Unliked(v35, v18)
                                                            let v41 = Us16Reaction(v40)
                                                            let v42 = Us19Liked(v35, v18)
                                                            let v43 = Us16Reaction(v42)
                                                            let v44 = Us19Unliked(v35, v18)
                                                            let v45 = Us16Reaction(v44)
                                                            let v46 = Us19Liked(v35, v18)
                                                            let v47 = Us16Reaction(v46)
                                                            let v48 = Uh10Nil
                                                            let v49 = Uh10Cons(v47, v48)
                                                            let v50 = Uh10Cons(v45, v49)
                                                            let v51 = Uh10Cons(v43, v50)
                                                            let v52 = Uh10Cons(v41, v51)
                                                            let v53 = Uh10Cons(v39, v52)
                                                            let v54 = Uh3Nil
                                                            #(v53, v54, v30, v31)
                                                        }
                                                        _ -> {
                                                            let #(v57, v58, v59, v60) =
                                                                case v34  {
                                                                    Us20None -> {
                                                                        let v55 = Uh10Nil
                                                                        let v56 = Uh3Nil
                                                                        #(v55, v56, v4, v5)
                                                                    }
                                                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                }
                                                            #(v57, v58, v59, v60)
                                                        }
                                                    }
                                                #(v61, v62, v63, v64)
                                            }
                                        }
                                    }
                                    _ -> {
                                        let #(v179, v180, v181, v182) =
                                            case v7  {
                                                Us14Editor -> {
                                                    let v69 = Uh9Nil
                                                    let v70 = method89(v0, v69)
                                                    case v70  {
                                                        Uh9Nil -> {
                                                            let v71 = Uh10Nil
                                                            let v72 = Uh3Nil
                                                            #(v71, v72, v4, v5)
                                                        }
                                                        _ -> {
                                                            let v73 = 0
                                                            let v74 = method77(v70, v73)
                                                            let v75 = spiral_wrap_unsigned(v74, 64)
                                                            let #(v76, v77, v78) = uniform_67(v75, v4, v5)
                                                            let v79 = spiral_wrap_signed(v76, 32)
                                                            let v80 = spiral_wrap_signed(v79 - 1, 32)
                                                            let v81 = picked_78(v80, v70)
                                                            let #(v123, v124, v125, v126) =
                                                                case v81  {
                                                                    Us20Some(v82, v83, v84) -> {
                                                                        let v85 = ""
                                                                        let v86 = " "
                                                                        let v87 = v85 <> v86 
                                                                        let v88 = v84 <> v87 
                                                                        let v89 = "\n"
                                                                        let v90 = v88 <> v89 
                                                                        let v91 = v85 <> v86 
                                                                        let v92 = v91 <> v86 
                                                                        let v93 = v84 <> v92 
                                                                        let v94 = v93 <> v89 
                                                                        let v95 = v85 <> v86 
                                                                        let v96 = v95 <> v86 
                                                                        let v97 = v96 <> v86 
                                                                        let v98 = v84 <> v97 
                                                                        let v99 = v98 <> v89 
                                                                        let v100 = Us19Liked(v82, v18)
                                                                        let v101 = Us16Reaction(v100)
                                                                        let v102 = Us18Edited(v82, v90)
                                                                        let v103 = Us16Revision(v102)
                                                                        let v104 = Us18Edited(v82, v94)
                                                                        let v105 = Us16Revision(v104)
                                                                        let v106 = Us18Edited(v82, v99)
                                                                        let v107 = Us16Revision(v106)
                                                                        let v108 = Us18Edited(v82, v84)
                                                                        let v109 = Us16Revision(v108)
                                                                        let v110 = Uh10Nil
                                                                        let v111 = Uh10Cons(v109, v110)
                                                                        let v112 = Uh10Cons(v107, v111)
                                                                        let v113 = Uh10Cons(v105, v112)
                                                                        let v114 = Uh10Cons(v103, v113)
                                                                        let v115 = Uh10Cons(v101, v114)
                                                                        let v116 = Uh3Nil
                                                                        #(v115, v116, v77, v78)
                                                                    }
                                                                    _ -> {
                                                                        let #(v119, v120, v121, v122) =
                                                                            case v81  {
                                                                                Us20None -> {
                                                                                    let v117 = Uh10Nil
                                                                                    let v118 = Uh3Nil
                                                                                    #(v117, v118, v4, v5)
                                                                                }
                                                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                            }
                                                                        #(v119, v120, v121, v122)
                                                                    }
                                                                }
                                                            #(v123, v124, v125, v126)
                                                        }
                                                    }
                                                }
                                                _ -> {
                                                    let #(v175, v176, v177, v178) =
                                                        case v7  {
                                                            Us14Breaker -> {
                                                                let v131 = Uh9Nil
                                                                let v132 = method90(v0, v131)
                                                                case v132  {
                                                                    Uh9Nil -> {
                                                                        let v133 = Uh10Nil
                                                                        let v134 = Uh3Nil
                                                                        #(v133, v134, v4, v5)
                                                                    }
                                                                    _ -> {
                                                                        let v135 = 0
                                                                        let v136 = method77(v132, v135)
                                                                        let v137 = spiral_wrap_unsigned(v136, 64)
                                                                        let #(v138, v139, v140) = uniform_67(v137, v4, v5)
                                                                        let v141 = spiral_wrap_signed(v138, 32)
                                                                        let v142 = spiral_wrap_signed(v141 - 1, 32)
                                                                        let v143 = picked_78(v142, v132)
                                                                        let #(v167, v168, v169, v170) =
                                                                            case v143  {
                                                                                Us20Some(v144, v145, v146) -> {
                                                                                    let v147 = break_source_80(v146)
                                                                                    let v148 = break_source_80(v146)
                                                                                    let v149 = Us19Liked(v144, v18)
                                                                                    let v150 = Us16Reaction(v149)
                                                                                    let v151 = Us18Edited(v144, v147)
                                                                                    let v152 = Us16Revision(v151)
                                                                                    let v153 = Us18Edited(v144, v146)
                                                                                    let v154 = Us16Revision(v153)
                                                                                    let v155 = Uh10Nil
                                                                                    let v156 = Uh10Cons(v154, v155)
                                                                                    let v157 = Uh10Cons(v152, v156)
                                                                                    let v158 = Uh10Cons(v150, v157)
                                                                                    let v159 = Uh3Nil
                                                                                    let v160 = Uh3Cons(v148, v159)
                                                                                    #(v158, v160, v139, v140)
                                                                                }
                                                                                _ -> {
                                                                                    let #(v163, v164, v165, v166) =
                                                                                        case v143  {
                                                                                            Us20None -> {
                                                                                                let v161 = Uh10Nil
                                                                                                let v162 = Uh3Nil
                                                                                                #(v161, v162, v4, v5)
                                                                                            }
                                                                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                                        }
                                                                                    #(v163, v164, v165, v166)
                                                                                }
                                                                            }
                                                                        #(v167, v168, v169, v170)
                                                                    }
                                                                }
                                                            }
                                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                        }
                                                    #(v175, v176, v177, v178)
                                                }
                                            }
                                        #(v179, v180, v181, v182)
                                    }
                                }
                            #(v183, v184, v185, v186)
                        }
                    }
                let v191 = Uh14Nil
                let v192 = Uh14Cons(v187, v191)
                let v193 = method91(v2, v192)
                let v194 = method15(v3, v188)
                let v195 = spiral_wrap_signed(v6 + 1, 32)
                method87(v0, v8, v193, v194, v189, v190, v195)
            }
            _ -> {
                let #(v201, v202, v203, v204, v205) =
                    case v1  {
                        Uh7Nil -> {
                            #(v2, v3, v4, v5, v6)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v201, v202, v203, v204, v205)
            }
        }
    #(v206, v207, v208, v209, v210)
}

pub fn method94(v0: Uh10, v1: Int) -> Int {
    case v0  {
        Uh10Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method94(v3, v4)
        }
        Uh10Nil -> {
            v1
        }
    }
}

pub fn method93(v0: Uh14, v1: Uh14) -> Uh14 {
    case v0  {
        Uh14Cons(v2, v3) -> {
            let v4 = method93(v3, v1)
            let v5 = 0
            let v6 = method94(v2, v5)
            let v7 = v6 > 0
            case v7 {
                True -> {
                    Uh14Cons(v2, v4)
                }
                False -> {
                    v4
                }
            }
        }
        Uh14Nil -> {
            v1
        }
    }
}

pub fn method95(v0: Uh14, v1: Uh14) -> Uh14 {
    case v0  {
        Uh14Cons(v2, v3) -> {
            let v4 = method95(v3, v1)
            let v9 =
                case v2  {
                    Uh10Cons(v5, v6) -> {
                        v6
                    }
                    Uh10Nil -> {
                        Uh10Nil
                    }
                }
            Uh14Cons(v9, v4)
        }
        Uh14Nil -> {
            v1
        }
    }
}

pub fn taken_97(v0: Int, v1: Uh10) -> Uh10 {
    case v1  {
        Uh10Cons(v2, v3) -> {
            let v4 = v0 > 0
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v0 - 1, 32)
                    let v6 = taken_97(v5, v3)
                    Uh10Cons(v2, v6)
                }
                False -> {
                    Uh10Nil
                }
            }
        }
        _ -> {
            Uh10Nil
        }
    }
}

pub fn method96(v0: Uh14, v1: Uh10) -> Uh10 {
    case v0  {
        Uh14Cons(v2, v3) -> {
            let v4 = method96(v3, v1)
            let v5 = 1
            let v6 = taken_97(v5, v2)
            method73(v6, v4)
        }
        Uh14Nil -> {
            v1
        }
    }
}

pub fn round_robin_92(v0: Uh14, v1: Uh10) -> Uh10 {
    let v2 = Uh14Nil
    let v3 = method93(v0, v2)
    case v3  {
        Uh14Nil -> {
            v1
        }
        _ -> {
            let v4 = Uh14Nil
            let v5 = method95(v3, v4)
            let v6 = Uh10Nil
            let v7 = method96(v3, v6)
            let v8 = method73(v1, v7)
            round_robin_92(v5, v8)
        }
    }
}

pub fn persona_events_86(v0: Uh9, v1: Uh7, v2: Int, v3: Int) -> #(Uh10, Uh3, Int, Int) {
    let v4 = Uh14Nil
    let v5 = Uh3Nil
    let v6 = 1
    let #(v7, v8, v9, v10, _v11) = method87(v0, v1, v4, v5, v2, v3, v6)
    let v12 = Uh10Nil
    let v13 = round_robin_92(v7, v12)
    #(v13, v8, v9, v10)
}

pub fn method98(v0: Uh9, v1: Uh10) -> Uh10 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = method98(v5, v1)
            let v7 = Us17Posted(v2, v3, v4)
            let v8 = Us16Content(v7)
            Uh10Cons(v8, v6)
        }
        Uh9Nil -> {
            v1
        }
    }
}

pub fn method99(v0: Uh12, v1: Uh10) -> Uh10 {
    case v0  {
        Uh12Cons(v2, v3, v4) -> {
            let v5 = method99(v4, v1)
            let v6 = Us19Liked(v2, v3)
            let v7 = Us16Reaction(v6)
            Uh10Cons(v7, v5)
        }
        Uh12Nil -> {
            v1
        }
    }
}

pub fn method101(v0: Int, v1: Int) -> fn(String) -> String {
    closure11(#(v0, v1))
}

pub fn closure11(capt: #(Int, Int)) -> fn(String) -> String {
    fn (v2) {
        let #(v0, v1) = capt
        let v3 = v1 >= v0
        case v3 {
            True -> {
                v2
            }
            False -> {
                let v4 = spiral_wrap_signed(v1 + 1, 32)
                let v5 = method101(v0, v4)
                let v6 = "\n"
                let v7 = v2 <> v6 
                v5(v7)
            }
        }
    }
}

pub fn method100(v0: Int, v1: String, v2: Us0, v3: String, v4: Int) -> Uh10 {
    let v5 = v4 < v0
    case v5 {
        True -> {
            let v6 = spiral_wrap_signed(v4 + 1, 32)
            let v7 = v6 % 3
            let v8 = spiral_wrap_signed(v7 + 1, 32)
            let v9 = 0
            let v10 = method101(v8, v9)
            let v11 = ""
            let v12 = v10(v11)
            let v13 = v3 <> v12 
            let v14 = method100(v0, v1, v2, v3, v6)
            let v15 = Us18Edited(v1, v13)
            let v16 = Us16Revision(v15)
            Uh10Cons(v16, v14)
        }
        False -> {
            Uh10Nil
        }
    }
}

pub fn method103(v0: Uh10, v1: Uh10) -> Uh10 {
    case v0  {
        Uh10Cons(v2, v3) -> {
            let v4 = Uh10Cons(v2, v1)
            method103(v3, v4)
        }
        Uh10Nil -> {
            v1
        }
    }
}
