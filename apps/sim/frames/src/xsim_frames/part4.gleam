import gleam/bit_array
import gleam/int
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Us2, type Uh7, type Uh8, type Uh9, type Uh10, type Uh11, type Uh12, type Uh13, type Uh14, type Uh15, Uh10Cons, Uh10Nil, Uh11Cons, Uh11Nil, Uh12Cons, Uh12Nil, Uh13Cons, Uh13Nil, Uh14Cons, Uh14Nil, Uh15Cons, Uh15Nil, Uh3Cons, Uh3Nil, Uh7Cons, Uh7Nil, Uh8Cons, Uh8Nil, Uh9Cons, Uh9Nil, Us14Breaker, Us14Editor, Us14Fickle, Us14Lurker, Us16Content, Us16Reaction, Us16Revision, Us17Posted, Us18Edited, Us19Liked, Us19Unliked, Us20None, Us20Some, Us2None, Us2Some}
import xsim_frames/part1.{closure1, method18, spiral_string_length, spiral_string_slice, spiral_wrap_signed, spiral_wrap_unsigned}
import xsim_frames/part3.{blank_start_83, digits_start_84, method64, method65, method68, method73, method74, method75, method76, method77, method78, method79, picked_80, seeded_66, uniform_69}

pub fn unpadded_85(v0: String) -> String {
    let v1 = spiral_string_length(v0)
    let v2 = v1 > 1
    let v5 =
        case v2 {
            True -> {
                v0 |> string.starts_with("0")
            }
            False -> False
        }
    case v5 {
        True -> {
            let v6 = spiral_wrap_signed(v1 - 1, 32)
            let v7 = spiral_wrap_signed(1 + v6, 32)
            let v8 = spiral_wrap_signed(v7 - 1, 32)
            let v9 = spiral_string_slice(v0, 1, v8)
            unpadded_85(v9)
        }
        False -> v0
    }
}

pub fn plus_one_86(v0: String) -> String {
    let v1 = v0 == ""
    let v17 =
        case v1 {
            True -> -1
            False -> {
                let v2 = spiral_string_length(v0)
                let v3 = spiral_wrap_signed(v2 - 1, 32)
                let v4 = spiral_string_slice(v0, v3, v3)
                let v5 = v4 == ""
                case v5 {
                    True -> 0
                    False -> {
                        let v7 = option.from_result(result.map(string.split_once("0123456789", v4), pair.first))
                        let v8 = closure1(Nil)
                        let v9 = v7 |> option.map(v8)
                        let v11 = v9 |> option.unwrap(Us2None)
                        case v11  {
                            Us2None -> -1
                            Us2Some(v12) -> {
                                bit_array.byte_size(bit_array.from_string(v12))
                            }
                        }
                    }
                }
            }
        }
    let v18 = v17 < 0
    case v18 {
        True -> {
            "1"
        }
        False -> {
            let v20 = v17 == 9
            case v20 {
                True -> {
                    let v21 = spiral_string_length(v0)
                    let v22 = spiral_wrap_signed(v21 - 1, 32)
                    let v23 = spiral_wrap_signed(v22 - 1, 32)
                    let v24 = spiral_string_slice(v0, 0, v23)
                    let v25 = plus_one_86(v24)
                    let v26 = { v25 } <> { "0" }
                    v26
                }
                False -> {
                    let v27 = spiral_string_length(v0)
                    let v28 = spiral_wrap_signed(v27 - 1, 32)
                    let v29 = spiral_wrap_signed(v28 - 1, 32)
                    let v30 = spiral_string_slice(v0, 0, v29)
                    let v31 = spiral_wrap_signed(v17 + 1, 32)
                    let v32 = int.to_string(v31)
                    let v33 = { v30 } <> { v32 }
                    v33
                }
            }
        }
    }
}

pub fn break_source_82(v0: String) -> String {
    let v1 = spiral_string_length(v0)
    let v2 = blank_start_83(v0, v1)
    let v3 = digits_start_84(v0, v2)
    let v4 = v3 == v2
    case v4 {
        True -> v0
        False -> {
            let v5 = v3 > 0
            let v10 =
                case v5 {
                    True -> {
                        let v6 = spiral_wrap_signed(v3 - 1, 32)
                        let v7 = spiral_string_slice(v0, 0, v6)
                        v7 |> string.ends_with(".")
                    }
                    False -> False
                }
            case v10 {
                True -> {
                    let v11 = spiral_wrap_signed(v3 - 1, 32)
                    let v12 = digits_start_84(v0, v11)
                    let v13 = v12 == v11
                    let v20 =
                        case v13 {
                            True -> True
                            False -> {
                                let v14 = v12 > 0
                                case v14 {
                                    True -> {
                                        let v15 = spiral_wrap_signed(v12 - 1, 32)
                                        let v16 = spiral_string_slice(v0, 0, v15)
                                        v16 |> string.ends_with(".")
                                    }
                                    False -> False
                                }
                            }
                        }
                    case v20 {
                        True -> v0
                        False -> {
                            let v21 = spiral_wrap_signed(v12 - 1, 32)
                            let v22 = spiral_string_slice(v0, 0, v21)
                            let v23 = spiral_wrap_signed(v11 - v12, 32)
                            let v24 = spiral_wrap_signed(v12 + v23, 32)
                            let v25 = spiral_wrap_signed(v24 - 1, 32)
                            let v26 = spiral_string_slice(v0, v12, v25)
                            let v27 = unpadded_85(v26)
                            let v28 = plus_one_86(v27)
                            let v29 = { v22 } <> { v28 }
                            let v30 = spiral_wrap_signed(v1 - v11, 32)
                            let v31 = spiral_wrap_signed(v11 + v30, 32)
                            let v32 = spiral_wrap_signed(v31 - 1, 32)
                            let v33 = spiral_string_slice(v0, v11, v32)
                            let v34 = { v29 } <> { v33 }
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
                    let v42 = unpadded_85(v41)
                    let v43 = plus_one_86(v42)
                    let v44 = { v37 } <> { v43 }
                    let v45 = spiral_wrap_signed(v1 - v2, 32)
                    let v46 = spiral_wrap_signed(v2 + v45, 32)
                    let v47 = spiral_wrap_signed(v46 - 1, 32)
                    let v48 = spiral_string_slice(v0, v2, v47)
                    let v49 = { v44 } <> { v48 }
                    v49
                }
            }
        }
    }
}

pub fn method81(v0: Uh9, v1: Uh9) -> Uh9 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = method81(v5, v1)
            let v8 = v4 |> string.contains("///- --test")
            let v11 =
                case v8 {
                    True -> {
                        let v9 = break_source_82(v4)
                        v9 != v4
                    }
                    False -> False
                }
            case v11 {
                True -> Uh9Cons(v2, v3, v4, v6)
                False -> v6
            }
        }
        Uh9Nil -> v1
    }
}

pub fn method87(v0: Uh9, v1: Uh13, v2: Uh10, v3: Int, v4: Int) -> #(Uh10, Int, Int) {
    case v1  {
        Uh13Cons(v5, v6) -> {
            let v8 = method79(v0, 0)
            let v9 = spiral_wrap_unsigned(v8, 64)
            let #(v10, v11, v12) = uniform_69(v9, v3, v4)
            let v13 = spiral_wrap_signed(v10, 32)
            let v14 = spiral_wrap_signed(v13 - 1, 32)
            let v15 = picked_80(v14, v0)
            let #(v28, v29, v30) =
                case v15  {
                    Us20None -> #(v2, v11, v12)
                    Us20Some(v16, v17, v18) -> {
                        let v19 = break_source_82(v18)
                        let v20 = Us18Edited(v16, v19)
                        let v21 = Us16Revision(v20)
                        let v23 = Uh10Cons(v21, Uh10Nil)
                        let v24 = method75(v2, v23)
                        #(v24, v11, v12)
                    }
                }
            method87(v0, v6, v28, v29, v30)
        }
        Uh13Nil -> #(v2, v3, v4)
    }
}

pub fn method90(v0: String, v1: Uh9, v2: Uh10, v3: Int, v4: Int) -> #(Uh10, Int, Int) {
    case v1  {
        Uh9Cons(v5, v6, v7, v8) -> {
            let #(v10, v11, v12) = uniform_69(2, v3, v4)
            let v13 = spiral_wrap_signed(v10, 32)
            let v14 = v13 == 1
            let v20 =
                case v14 {
                    True -> {
                        let v15 = Us19Liked(v5, v0)
                        let v16 = Us16Reaction(v15)
                        let v18 = Uh10Cons(v16, Uh10Nil)
                        method75(v2, v18)
                    }
                    False -> v2
                }
            method90(v0, v8, v20, v11, v12)
        }
        Uh9Nil -> #(v2, v3, v4)
    }
}

pub fn method91(v0: Uh9, v1: Uh9) -> Uh9 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = method91(v5, v1)
            let v8 = v4 |> string.contains("///- --test")
            let v9 = v8 == False
            case v9 {
                True -> Uh9Cons(v2, v3, v4, v6)
                False -> v6
            }
        }
        Uh9Nil -> v1
    }
}

pub fn method92(v0: Uh9, v1: Uh9) -> Uh9 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = method92(v5, v1)
            let v8 = v4 |> string.contains("///- --test")
            let v11 =
                case v8 {
                    True -> {
                        let v9 = break_source_82(v4)
                        v9 != v4
                    }
                    False -> False
                }
            case v11 {
                True -> Uh9Cons(v2, v3, v4, v6)
                False -> v6
            }
        }
        Uh9Nil -> v1
    }
}

pub fn method93(v0: Uh14, v1: Uh14) -> Uh14 {
    case v0  {
        Uh14Cons(v2, v3) -> {
            let v4 = method93(v3, v1)
            Uh14Cons(v2, v4)
        }
        Uh14Nil -> v1
    }
}

pub fn method89(v0: Uh9, v1: Uh7, v2: Uh14, v3: Uh3, v4: Int, v5: Int, v6: Int) -> #(Uh14, Uh3, Int, Int, Int) {
    let #(v197, v198, v199, v200, v201) =
        case v1  {
            Uh7Cons(v7, v8) -> {
                let v16 =
                    case v7  {
                        Us14Breaker -> {
                            "breaker"
                        }
                        Us14Editor -> {
                            "editor"
                        }
                        Us14Fickle -> {
                            "fickle"
                        }
                        Us14Lurker -> {
                            "lurker"
                        }
                    }
                let v17 = int.to_string(v6)
                let v18 = { v16 } <> { v17 }
                let #(v178, v179, v180, v181) =
                    case v7  {
                        Us14Lurker -> {
                            let #(v20, v21, v22) = method90(v18, v0, Uh10Nil, v4, v5)
                            #(v20, Uh3Nil, v21, v22)
                        }
                        _ -> {
                            let #(v174, v175, v176, v177) =
                                case v7  {
                                    Us14Fickle -> {
                                        case v0  {
                                            Uh9Nil -> {
                                                #(Uh10Nil, Uh3Nil, v4, v5)
                                            }
                                            _ -> {
                                                let v27 = method79(v0, 0)
                                                let v28 = spiral_wrap_unsigned(v27, 64)
                                                let #(v29, v30, v31) = uniform_69(v28, v4, v5)
                                                let v32 = spiral_wrap_signed(v29, 32)
                                                let v33 = spiral_wrap_signed(v32 - 1, 32)
                                                let v34 = picked_80(v33, v0)
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
                                                            let v49 = Uh10Cons(v47, Uh10Nil)
                                                            let v50 = Uh10Cons(v45, v49)
                                                            let v51 = Uh10Cons(v43, v50)
                                                            let v52 = Uh10Cons(v41, v51)
                                                            let v53 = Uh10Cons(v39, v52)
                                                            #(v53, Uh3Nil, v30, v31)
                                                        }
                                                        _ -> {
                                                            let #(v57, v58, v59, v60) =
                                                                case v34  {
                                                                    Us20None -> {
                                                                        #(Uh10Nil, Uh3Nil, v4, v5)
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
                                        let #(v170, v171, v172, v173) =
                                            case v7  {
                                                Us14Editor -> {
                                                    let v70 = method91(v0, Uh9Nil)
                                                    case v70  {
                                                        Uh9Nil -> {
                                                            #(Uh10Nil, Uh3Nil, v4, v5)
                                                        }
                                                        _ -> {
                                                            let v74 = method79(v70, 0)
                                                            let v75 = spiral_wrap_unsigned(v74, 64)
                                                            let #(v76, v77, v78) = uniform_69(v75, v4, v5)
                                                            let v79 = spiral_wrap_signed(v76, 32)
                                                            let v80 = spiral_wrap_signed(v79 - 1, 32)
                                                            let v81 = picked_80(v80, v70)
                                                            let #(v114, v115, v116, v117) =
                                                                case v81  {
                                                                    Us20Some(v82, v83, v84) -> {
                                                                        let v85 = { v84 } <> { " " }
                                                                        let v86 = { v85 } <> { "\n" }
                                                                        let v87 = { v84 } <> { "  " }
                                                                        let v88 = { v87 } <> { "\n" }
                                                                        let v89 = { v84 } <> { "   " }
                                                                        let v90 = { v89 } <> { "\n" }
                                                                        let v91 = Us19Liked(v82, v18)
                                                                        let v92 = Us16Reaction(v91)
                                                                        let v93 = Us18Edited(v82, v86)
                                                                        let v94 = Us16Revision(v93)
                                                                        let v95 = Us18Edited(v82, v88)
                                                                        let v96 = Us16Revision(v95)
                                                                        let v97 = Us18Edited(v82, v90)
                                                                        let v98 = Us16Revision(v97)
                                                                        let v99 = Us18Edited(v82, v84)
                                                                        let v100 = Us16Revision(v99)
                                                                        let v102 = Uh10Cons(v100, Uh10Nil)
                                                                        let v103 = Uh10Cons(v98, v102)
                                                                        let v104 = Uh10Cons(v96, v103)
                                                                        let v105 = Uh10Cons(v94, v104)
                                                                        let v106 = Uh10Cons(v92, v105)
                                                                        #(v106, Uh3Nil, v77, v78)
                                                                    }
                                                                    _ -> {
                                                                        let #(v110, v111, v112, v113) =
                                                                            case v81  {
                                                                                Us20None -> {
                                                                                    #(Uh10Nil, Uh3Nil, v4, v5)
                                                                                }
                                                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                            }
                                                                        #(v110, v111, v112, v113)
                                                                    }
                                                                }
                                                            #(v114, v115, v116, v117)
                                                        }
                                                    }
                                                }
                                                _ -> {
                                                    let #(v166, v167, v168, v169) =
                                                        case v7  {
                                                            Us14Breaker -> {
                                                                let v123 = method92(v0, Uh9Nil)
                                                                case v123  {
                                                                    Uh9Nil -> {
                                                                        #(Uh10Nil, Uh3Nil, v4, v5)
                                                                    }
                                                                    _ -> {
                                                                        let v127 = method79(v123, 0)
                                                                        let v128 = spiral_wrap_unsigned(v127, 64)
                                                                        let #(v129, v130, v131) = uniform_69(v128, v4, v5)
                                                                        let v132 = spiral_wrap_signed(v129, 32)
                                                                        let v133 = spiral_wrap_signed(v132 - 1, 32)
                                                                        let v134 = picked_80(v133, v123)
                                                                        let #(v158, v159, v160, v161) =
                                                                            case v134  {
                                                                                Us20Some(v135, v136, v137) -> {
                                                                                    let v138 = break_source_82(v137)
                                                                                    let v139 = break_source_82(v137)
                                                                                    let v140 = Us19Liked(v135, v18)
                                                                                    let v141 = Us16Reaction(v140)
                                                                                    let v142 = Us18Edited(v135, v138)
                                                                                    let v143 = Us16Revision(v142)
                                                                                    let v144 = Us18Edited(v135, v137)
                                                                                    let v145 = Us16Revision(v144)
                                                                                    let v147 = Uh10Cons(v145, Uh10Nil)
                                                                                    let v148 = Uh10Cons(v143, v147)
                                                                                    let v149 = Uh10Cons(v141, v148)
                                                                                    let v151 = Uh3Cons(v139, Uh3Nil)
                                                                                    #(v149, v151, v130, v131)
                                                                                }
                                                                                _ -> {
                                                                                    let #(v154, v155, v156, v157) =
                                                                                        case v134  {
                                                                                            Us20None -> {
                                                                                                #(Uh10Nil, Uh3Nil, v4, v5)
                                                                                            }
                                                                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                                        }
                                                                                    #(v154, v155, v156, v157)
                                                                                }
                                                                            }
                                                                        #(v158, v159, v160, v161)
                                                                    }
                                                                }
                                                            }
                                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                        }
                                                    #(v166, v167, v168, v169)
                                                }
                                            }
                                        #(v170, v171, v172, v173)
                                    }
                                }
                            #(v174, v175, v176, v177)
                        }
                    }
                let v183 = Uh14Cons(v178, Uh14Nil)
                let v184 = method93(v2, v183)
                let v185 = method18(v3, v179)
                let v186 = spiral_wrap_signed(v6 + 1, 32)
                method89(v0, v8, v184, v185, v180, v181, v186)
            }
            _ -> {
                let #(v192, v193, v194, v195, v196) =
                    case v1  {
                        Uh7Nil -> #(v2, v3, v4, v5, v6)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v192, v193, v194, v195, v196)
            }
        }
    #(v197, v198, v199, v200, v201)
}

pub fn method96(v0: Uh10, v1: Int) -> Int {
    case v0  {
        Uh10Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method96(v3, v4)
        }
        Uh10Nil -> v1
    }
}

pub fn method95(v0: Uh14, v1: Uh14) -> Uh14 {
    case v0  {
        Uh14Cons(v2, v3) -> {
            let v4 = method95(v3, v1)
            let v6 = method96(v2, 0)
            let v7 = v6 > 0
            case v7 {
                True -> Uh14Cons(v2, v4)
                False -> v4
            }
        }
        Uh14Nil -> v1
    }
}

pub fn method97(v0: Uh14, v1: Uh14) -> Uh14 {
    case v0  {
        Uh14Cons(v2, v3) -> {
            let v4 = method97(v3, v1)
            let v9 =
                case v2  {
                    Uh10Cons(v5, v6) -> v6
                    Uh10Nil -> Uh10Nil
                }
            Uh14Cons(v9, v4)
        }
        Uh14Nil -> v1
    }
}

pub fn taken_99(v0: Int, v1: Uh10) -> Uh10 {
    case v1  {
        Uh10Cons(v2, v3) -> {
            let v4 = v0 > 0
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v0 - 1, 32)
                    let v6 = taken_99(v5, v3)
                    Uh10Cons(v2, v6)
                }
                False -> Uh10Nil
            }
        }
        _ -> Uh10Nil
    }
}

pub fn method98(v0: Uh14, v1: Uh10) -> Uh10 {
    case v0  {
        Uh14Cons(v2, v3) -> {
            let v4 = method98(v3, v1)
            let v6 = taken_99(1, v2)
            method75(v6, v4)
        }
        Uh14Nil -> v1
    }
}

pub fn round_robin_94(v0: Uh14, v1: Uh10) -> Uh10 {
    let v3 = method95(v0, Uh14Nil)
    case v3  {
        Uh14Nil -> v1
        _ -> {
            let v5 = method97(v3, Uh14Nil)
            let v7 = method98(v3, Uh10Nil)
            let v8 = method75(v1, v7)
            round_robin_94(v5, v8)
        }
    }
}

pub fn persona_events_88(v0: Uh9, v1: Uh7, v2: Int, v3: Int) -> #(Uh10, Uh3, Int, Int) {
    let #(v7, v8, v9, v10, _v11) = method89(v0, v1, Uh14Nil, Uh3Nil, v2, v3, 1)
    let v13 = round_robin_94(v7, Uh10Nil)
    #(v13, v8, v9, v10)
}

pub fn method100(v0: Uh9, v1: Uh10) -> Uh10 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = method100(v5, v1)
            let v7 = Us17Posted(v2, v3, v4)
            let v8 = Us16Content(v7)
            Uh10Cons(v8, v6)
        }
        Uh9Nil -> v1
    }
}

pub fn method101(v0: Uh12, v1: Uh10) -> Uh10 {
    case v0  {
        Uh12Cons(v2, v3, v4) -> {
            let v5 = method101(v4, v1)
            let v6 = Us19Liked(v2, v3)
            let v7 = Us16Reaction(v6)
            Uh10Cons(v7, v5)
        }
        Uh12Nil -> v1
    }
}

pub fn method103(v0: Int, v1: Int) -> fn(String) -> String {
    closure11(#(v0, v1))
}

pub fn closure11(capt: #(Int, Int)) -> fn(String) -> String {
    fn (v2) {
        let #(v0, v1) = capt
        let v3 = v1 >= v0
        case v3 {
            True -> v2
            False -> {
                let v4 = spiral_wrap_signed(v1 + 1, 32)
                let v5 = method103(v0, v4)
                let v6 = { v2 } <> { "\n" }
                v5(v6)
            }
        }
    }
}

pub fn method102(v0: Int, v1: String, v2: Us2, v3: String, v4: Int) -> Uh10 {
    let v5 = v4 < v0
    case v5 {
        True -> {
            let v6 = spiral_wrap_signed(v4 + 1, 32)
            let v7 = v6 % 3
            let v8 = spiral_wrap_signed(v7 + 1, 32)
            let v10 = method103(v8, 0)
            let v12 = v10("")
            let v13 = { v3 } <> { v12 }
            let v14 = method102(v0, v1, v2, v3, v6)
            let v15 = Us18Edited(v1, v13)
            let v16 = Us16Revision(v15)
            Uh10Cons(v16, v14)
        }
        False -> Uh10Nil
    }
}

pub fn method105(v0: Uh10, v1: Uh10) -> Uh10 {
    case v0  {
        Uh10Cons(v2, v3) -> {
            let v4 = Uh10Cons(v2, v1)
            method105(v3, v4)
        }
        Uh10Nil -> v1
    }
}

pub fn woven_104(v0: Int, v1: Int, v2: Uh10, v3: Uh10, v4: Uh10) -> Uh10 {
    case v3  {
        Uh10Cons(v8, v9) -> {
            let v10 = spiral_wrap_signed(v1 + 1, 32)
            let #(v23, v24, v25, v26) =
                case v2  {
                    Uh10Cons(v11, v12) -> {
                        let v13 = v10 % v0
                        let v14 = v13 == 0
                        case v14 {
                            True -> {
                                let v15 = Uh10Cons(v8, v4)
                                let v16 = Uh10Cons(v11, v15)
                                #(v0, v10, v12, v16)
                            }
                            False -> {
                                let v17 = Uh10Cons(v8, v4)
                                #(v0, v10, v2, v17)
                            }
                        }
                    }
                    _ -> {
                        let v22 = Uh10Cons(v8, v4)
                        #(v0, v10, v2, v22)
                    }
                }
            woven_104(v23, v24, v25, v9, v26)
        }
        Uh10Nil -> {
            let v6 = method105(v4, Uh10Nil)
            method75(v6, v2)
        }
    }
}

pub fn method106(v0: Uh10, v1: Uh3) -> Uh3 {
    case v0  {
        Uh10Cons(v2, v3) -> {
            let v4 = method106(v3, v1)
            let v13 =
                case v2  {
                    Us16Revision(v5) -> {
                        case v5  {
                            Us18Edited(v6, v7) -> {
                                Uh3Cons(v7, Uh3Nil)
                            }
                            _ -> Uh3Nil
                        }
                    }
                    _ -> Uh3Nil
                }
            method18(v13, v4)
        }
        Uh10Nil -> v1
    }
}

pub fn from_cells_63(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh7, v6: Bool, v7: String, v8: Uh3) -> #(Uh9, Uh10, Uh3) {
    let #(v12, _v13, _v14) = method64(v0, v1, v2, v3, v4, v5, v6, v7, v8, Uh9Nil, Us2None, 0)
    let v16 = method65(v12, Uh9Nil)
    let v17 = spiral_wrap_signed(v0 * 7, 32)
    let v18 = spiral_wrap_signed(v17 + 1, 32)
    let v19 = spiral_wrap_signed(v0 * 13, 32)
    let v20 = spiral_wrap_signed(v19 + 3, 32)
    let v21 = spiral_wrap_unsigned(v0, 64)
    let v22 = spiral_wrap_unsigned(v18, 64)
    let v23 = spiral_wrap_unsigned(v20, 64)
    let #(v24, v25) = seeded_66(v21, v22, v23)
    let #(v27, v28, v29) = method68(v1, v16, Uh12Nil, v24, v25)
    let v31 = method73(v27, Uh12Nil)
    let #(v33, v34, v35) = method74(v31, Uh10Nil, v28, v29)
    let v37 = method76(v16, Uh9Nil)
    let #(v45, v46, v47) =
        case v37  {
            Uh9Nil -> {
                #(Uh10Nil, v34, v35)
            }
            _ -> {
                let v40 = method77(v2, 0)
                method78(v37, v40, Uh10Nil, v34, v35)
            }
        }
    let v49 = method81(v16, Uh9Nil)
    let #(v57, v58, v59) =
        case v49  {
            Uh9Nil -> {
                #(Uh10Nil, v46, v47)
            }
            _ -> {
                let v52 = method77(v3, 0)
                method87(v49, v52, Uh10Nil, v46, v47)
            }
        }
    let #(v60, v61, _v62, _v63) = persona_events_88(v16, v5, v58, v59)
    let v65 = method100(v16, Uh10Nil)
    let v67 = method101(v31, Uh10Nil)
    let v68 = method75(v33, v60)
    let v69 = method75(v57, v68)
    let v70 = method75(v45, v69)
    let v71 = method75(v67, v70)
    let v80 =
        case v16  {
            Uh9Cons(v72, v73, v74, v75) -> {
                method102(v4, v72, v73, v74, 0)
            }
            Uh9Nil -> Uh10Nil
        }
    let v92 =
        case v80  {
            Uh10Nil -> v71
            _ -> {
                let v82 = method96(v71, 0)
                let v84 = method96(v80, 0)
                let v85 = spiral_wrap_signed(v84 + 1, 32)
                let v86 = v82 / v85
                let v87 = v86 < 1
                let v88 =
                    case v87 {
                        True -> 1
                        False -> v86
                    }
                woven_104(v88, 0, v80, v71, Uh10Nil)
            }
        }
    let v93 = method75(v65, v92)
    let v95 = method106(v57, Uh3Nil)
    let v96 = method18(v95, v61)
    #(v16, v93, v96)
}

pub fn method107(v0: Uh11, v1: Uh11) -> Uh11 {
    case v0  {
        Uh11Cons(v2, v3, v4, v5) -> {
            let v6 = method107(v5, v1)
            Uh11Cons(v2, v3, v4, v6)
        }
        Uh11Nil -> v1
    }
}

pub fn method62(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh7, v6: Bool, v7: Uh8, v8: Uh11, v9: Int) -> #(Uh11, Int) {
    let #(v26, v27) =
        case v7  {
            Uh8Cons(v10, v11) -> {
                let v12 = spiral_wrap_signed(v0 + v9, 32)
                let v13 = int.to_string(v9)
                let v14 = { "f" } <> { v13 }
                let #(v15, v16, v17) = from_cells_63(v12, v1, v2, v3, v4, v5, v6, v14, v10)
                let v19 = Uh11Cons(v15, v16, v17, Uh11Nil)
                let v20 = method107(v8, v19)
                let v21 = spiral_wrap_signed(v9 + 1, 32)
                method62(v0, v1, v2, v3, v4, v5, v6, v11, v20, v21)
            }
            _ -> {
                let #(v24, v25) =
                    case v7  {
                        Uh8Nil -> #(v8, v9)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v24, v25)
            }
        }
    #(v26, v27)
}

pub fn method108(v0: Uh11, v1: Uh14) -> Uh14 {
    case v0  {
        Uh11Cons(v2, v3, v4, v5) -> {
            let v6 = method108(v5, v1)
            Uh14Cons(v3, v6)
        }
        Uh11Nil -> v1
    }
}

pub fn method110(v0: Uh9, v1: Uh9) -> Uh9 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = method110(v5, v1)
            Uh9Cons(v2, v3, v4, v6)
        }
        Uh9Nil -> v1
    }
}

pub fn method109(v0: Uh11, v1: Uh9) -> Uh9 {
    case v0  {
        Uh11Cons(v2, v3, v4, v5) -> {
            let v6 = method109(v5, v1)
            method110(v2, v6)
        }
        Uh11Nil -> v1
    }
}

pub fn method111(v0: Uh11, v1: Uh3) -> Uh3 {
    case v0  {
        Uh11Cons(v2, v3, v4, v5) -> {
            let v6 = method111(v5, v1)
            method18(v4, v6)
        }
        Uh11Nil -> v1
    }
}

pub fn from_corpus_61(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh7, v6: Bool, v7: Uh8) -> #(Uh9, Uh10, Uh3) {
    let #(v10, _v11) = method62(v0, v1, v2, v3, v4, v5, v6, v7, Uh11Nil, 0)
    let v13 = method108(v10, Uh14Nil)
    let v15 = round_robin_94(v13, Uh10Nil)
    let v17 = method109(v10, Uh9Nil)
    let v19 = method111(v10, Uh3Nil)
    #(v17, v15, v19)
}

pub fn method113(v0: Uh10, v1: Uh15, v2: Int) -> #(Uh15, Int) {
    case v0  {
        Uh10Cons(v3, v4) -> {
            let v5 = spiral_wrap_signed(v2 + 1, 32)
            let v6 = Uh15Cons(v2, v3, v1)
            method113(v4, v6, v5)
        }
        Uh10Nil -> #(v1, v2)
    }
}

pub fn method114(v0: Uh15, v1: Uh15) -> Uh15 {
    case v0  {
        Uh15Cons(v2, v3, v4) -> {
            let v5 = Uh15Cons(v2, v3, v1)
            method114(v4, v5)
        }
        Uh15Nil -> v1
    }
}
