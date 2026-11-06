import gleam/bit_array
import gleam/int
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Us2, type Uh8, type Uh9, type Uh10, type Uh11, type Uh12, type Uh13, type Uh14, type Uh15, type Uh16, Uh10Cons, Uh10Nil, Uh11Cons, Uh11Nil, Uh12Cons, Uh12Nil, Uh13Cons, Uh13Nil, Uh14Cons, Uh14Nil, Uh15Cons, Uh15Nil, Uh16Cons, Uh16Nil, Uh3Cons, Uh3Nil, Uh8Cons, Uh8Nil, Uh9Cons, Uh9Nil, Us14Breaker, Us14Editor, Us14Fickle, Us14Lurker, Us16Content, Us16Reaction, Us16Revision, Us17Posted, Us18Edited, Us19Liked, Us19Unliked, Us20None, Us20Some, Us2None, Us2Some}
import xsim_frames/part1.{closure1, method18, spiral_string_length, spiral_string_slice, spiral_wrap_signed, spiral_wrap_unsigned}
import xsim_frames/part3.{blank_start_85, digits_start_86, method66, method67, method70, method75, method76, method77, method78, method79, method80, method81, picked_82, seeded_68, uniform_71}

pub fn unpadded_87(v0: String) -> String {
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
            unpadded_87(v9)
        }
        False -> v0
    }
}

pub fn plus_one_88(v0: String) -> String {
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
                    let v25 = plus_one_88(v24)
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

pub fn break_source_84(v0: String) -> String {
    let v1 = spiral_string_length(v0)
    let v2 = blank_start_85(v0, v1)
    let v3 = digits_start_86(v0, v2)
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
                    let v12 = digits_start_86(v0, v11)
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
                            let v27 = unpadded_87(v26)
                            let v28 = plus_one_88(v27)
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
                    let v42 = unpadded_87(v41)
                    let v43 = plus_one_88(v42)
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

pub fn method83(v0: Uh10, v1: Uh10) -> Uh10 {
    case v0  {
        Uh10Cons(v2, v3, v4, v5) -> {
            let v6 = method83(v5, v1)
            let v8 = v4 |> string.contains("///- --test")
            let v11 =
                case v8 {
                    True -> {
                        let v9 = break_source_84(v4)
                        v9 != v4
                    }
                    False -> False
                }
            case v11 {
                True -> Uh10Cons(v2, v3, v4, v6)
                False -> v6
            }
        }
        Uh10Nil -> v1
    }
}

pub fn method89(v0: Uh10, v1: Uh14, v2: Uh11, v3: Int, v4: Int) -> #(Uh11, Int, Int) {
    case v1  {
        Uh14Cons(v5, v6) -> {
            let v8 = method81(v0, 0)
            let v9 = spiral_wrap_unsigned(v8, 64)
            let #(v10, v11, v12) = uniform_71(v9, v3, v4)
            let v13 = spiral_wrap_signed(v10, 32)
            let v14 = spiral_wrap_signed(v13 - 1, 32)
            let v15 = picked_82(v14, v0)
            let #(v28, v29, v30) =
                case v15  {
                    Us20None -> #(v2, v11, v12)
                    Us20Some(v16, v17, v18) -> {
                        let v19 = break_source_84(v18)
                        let v20 = Us18Edited(v16, v19)
                        let v21 = Us16Revision(v20)
                        let v23 = Uh11Cons(v21, Uh11Nil)
                        let v24 = method77(v2, v23)
                        #(v24, v11, v12)
                    }
                }
            method89(v0, v6, v28, v29, v30)
        }
        Uh14Nil -> #(v2, v3, v4)
    }
}

pub fn method92(v0: String, v1: Uh10, v2: Uh11, v3: Int, v4: Int) -> #(Uh11, Int, Int) {
    case v1  {
        Uh10Cons(v5, v6, v7, v8) -> {
            let #(v10, v11, v12) = uniform_71(2, v3, v4)
            let v13 = spiral_wrap_signed(v10, 32)
            let v14 = v13 == 1
            let v20 =
                case v14 {
                    True -> {
                        let v15 = Us19Liked(v5, v0)
                        let v16 = Us16Reaction(v15)
                        let v18 = Uh11Cons(v16, Uh11Nil)
                        method77(v2, v18)
                    }
                    False -> v2
                }
            method92(v0, v8, v20, v11, v12)
        }
        Uh10Nil -> #(v2, v3, v4)
    }
}

pub fn method93(v0: Uh10, v1: Uh10) -> Uh10 {
    case v0  {
        Uh10Cons(v2, v3, v4, v5) -> {
            let v6 = method93(v5, v1)
            let v8 = v4 |> string.contains("///- --test")
            let v9 = v8 == False
            case v9 {
                True -> Uh10Cons(v2, v3, v4, v6)
                False -> v6
            }
        }
        Uh10Nil -> v1
    }
}

pub fn method94(v0: Uh10, v1: Uh10) -> Uh10 {
    case v0  {
        Uh10Cons(v2, v3, v4, v5) -> {
            let v6 = method94(v5, v1)
            let v8 = v4 |> string.contains("///- --test")
            let v11 =
                case v8 {
                    True -> {
                        let v9 = break_source_84(v4)
                        v9 != v4
                    }
                    False -> False
                }
            case v11 {
                True -> Uh10Cons(v2, v3, v4, v6)
                False -> v6
            }
        }
        Uh10Nil -> v1
    }
}

pub fn method95(v0: Uh15, v1: Uh15) -> Uh15 {
    case v0  {
        Uh15Cons(v2, v3) -> {
            let v4 = method95(v3, v1)
            Uh15Cons(v2, v4)
        }
        Uh15Nil -> v1
    }
}

pub fn method91(v0: Uh10, v1: Uh8, v2: Uh15, v3: Uh3, v4: Int, v5: Int, v6: Int) -> #(Uh15, Uh3, Int, Int, Int) {
    let #(v197, v198, v199, v200, v201) =
        case v1  {
            Uh8Cons(v7, v8) -> {
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
                            let #(v20, v21, v22) = method92(v18, v0, Uh11Nil, v4, v5)
                            #(v20, Uh3Nil, v21, v22)
                        }
                        _ -> {
                            let #(v174, v175, v176, v177) =
                                case v7  {
                                    Us14Fickle -> {
                                        case v0  {
                                            Uh10Nil -> {
                                                #(Uh11Nil, Uh3Nil, v4, v5)
                                            }
                                            _ -> {
                                                let v27 = method81(v0, 0)
                                                let v28 = spiral_wrap_unsigned(v27, 64)
                                                let #(v29, v30, v31) = uniform_71(v28, v4, v5)
                                                let v32 = spiral_wrap_signed(v29, 32)
                                                let v33 = spiral_wrap_signed(v32 - 1, 32)
                                                let v34 = picked_82(v33, v0)
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
                                                            let v49 = Uh11Cons(v47, Uh11Nil)
                                                            let v50 = Uh11Cons(v45, v49)
                                                            let v51 = Uh11Cons(v43, v50)
                                                            let v52 = Uh11Cons(v41, v51)
                                                            let v53 = Uh11Cons(v39, v52)
                                                            #(v53, Uh3Nil, v30, v31)
                                                        }
                                                        _ -> {
                                                            let #(v57, v58, v59, v60) =
                                                                case v34  {
                                                                    Us20None -> {
                                                                        #(Uh11Nil, Uh3Nil, v4, v5)
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
                                                    let v70 = method93(v0, Uh10Nil)
                                                    case v70  {
                                                        Uh10Nil -> {
                                                            #(Uh11Nil, Uh3Nil, v4, v5)
                                                        }
                                                        _ -> {
                                                            let v74 = method81(v70, 0)
                                                            let v75 = spiral_wrap_unsigned(v74, 64)
                                                            let #(v76, v77, v78) = uniform_71(v75, v4, v5)
                                                            let v79 = spiral_wrap_signed(v76, 32)
                                                            let v80 = spiral_wrap_signed(v79 - 1, 32)
                                                            let v81 = picked_82(v80, v70)
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
                                                                        let v102 = Uh11Cons(v100, Uh11Nil)
                                                                        let v103 = Uh11Cons(v98, v102)
                                                                        let v104 = Uh11Cons(v96, v103)
                                                                        let v105 = Uh11Cons(v94, v104)
                                                                        let v106 = Uh11Cons(v92, v105)
                                                                        #(v106, Uh3Nil, v77, v78)
                                                                    }
                                                                    _ -> {
                                                                        let #(v110, v111, v112, v113) =
                                                                            case v81  {
                                                                                Us20None -> {
                                                                                    #(Uh11Nil, Uh3Nil, v4, v5)
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
                                                                let v123 = method94(v0, Uh10Nil)
                                                                case v123  {
                                                                    Uh10Nil -> {
                                                                        #(Uh11Nil, Uh3Nil, v4, v5)
                                                                    }
                                                                    _ -> {
                                                                        let v127 = method81(v123, 0)
                                                                        let v128 = spiral_wrap_unsigned(v127, 64)
                                                                        let #(v129, v130, v131) = uniform_71(v128, v4, v5)
                                                                        let v132 = spiral_wrap_signed(v129, 32)
                                                                        let v133 = spiral_wrap_signed(v132 - 1, 32)
                                                                        let v134 = picked_82(v133, v123)
                                                                        let #(v158, v159, v160, v161) =
                                                                            case v134  {
                                                                                Us20Some(v135, v136, v137) -> {
                                                                                    let v138 = break_source_84(v137)
                                                                                    let v139 = break_source_84(v137)
                                                                                    let v140 = Us19Liked(v135, v18)
                                                                                    let v141 = Us16Reaction(v140)
                                                                                    let v142 = Us18Edited(v135, v138)
                                                                                    let v143 = Us16Revision(v142)
                                                                                    let v144 = Us18Edited(v135, v137)
                                                                                    let v145 = Us16Revision(v144)
                                                                                    let v147 = Uh11Cons(v145, Uh11Nil)
                                                                                    let v148 = Uh11Cons(v143, v147)
                                                                                    let v149 = Uh11Cons(v141, v148)
                                                                                    let v151 = Uh3Cons(v139, Uh3Nil)
                                                                                    #(v149, v151, v130, v131)
                                                                                }
                                                                                _ -> {
                                                                                    let #(v154, v155, v156, v157) =
                                                                                        case v134  {
                                                                                            Us20None -> {
                                                                                                #(Uh11Nil, Uh3Nil, v4, v5)
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
                let v183 = Uh15Cons(v178, Uh15Nil)
                let v184 = method95(v2, v183)
                let v185 = method18(v3, v179)
                let v186 = spiral_wrap_signed(v6 + 1, 32)
                method91(v0, v8, v184, v185, v180, v181, v186)
            }
            _ -> {
                let #(v192, v193, v194, v195, v196) =
                    case v1  {
                        Uh8Nil -> #(v2, v3, v4, v5, v6)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v192, v193, v194, v195, v196)
            }
        }
    #(v197, v198, v199, v200, v201)
}

pub fn method98(v0: Uh11, v1: Int) -> Int {
    case v0  {
        Uh11Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method98(v3, v4)
        }
        Uh11Nil -> v1
    }
}

pub fn method97(v0: Uh15, v1: Uh15) -> Uh15 {
    case v0  {
        Uh15Cons(v2, v3) -> {
            let v4 = method97(v3, v1)
            let v6 = method98(v2, 0)
            let v7 = v6 > 0
            case v7 {
                True -> Uh15Cons(v2, v4)
                False -> v4
            }
        }
        Uh15Nil -> v1
    }
}

pub fn method99(v0: Uh15, v1: Uh15) -> Uh15 {
    case v0  {
        Uh15Cons(v2, v3) -> {
            let v4 = method99(v3, v1)
            let v9 =
                case v2  {
                    Uh11Cons(v5, v6) -> v6
                    Uh11Nil -> Uh11Nil
                }
            Uh15Cons(v9, v4)
        }
        Uh15Nil -> v1
    }
}

pub fn taken_101(v0: Int, v1: Uh11) -> Uh11 {
    case v1  {
        Uh11Cons(v2, v3) -> {
            let v4 = v0 > 0
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v0 - 1, 32)
                    let v6 = taken_101(v5, v3)
                    Uh11Cons(v2, v6)
                }
                False -> Uh11Nil
            }
        }
        _ -> Uh11Nil
    }
}

pub fn method100(v0: Uh15, v1: Uh11) -> Uh11 {
    case v0  {
        Uh15Cons(v2, v3) -> {
            let v4 = method100(v3, v1)
            let v6 = taken_101(1, v2)
            method77(v6, v4)
        }
        Uh15Nil -> v1
    }
}

pub fn round_robin_96(v0: Uh15, v1: Uh11) -> Uh11 {
    let v3 = method97(v0, Uh15Nil)
    case v3  {
        Uh15Nil -> v1
        _ -> {
            let v5 = method99(v3, Uh15Nil)
            let v7 = method100(v3, Uh11Nil)
            let v8 = method77(v1, v7)
            round_robin_96(v5, v8)
        }
    }
}

pub fn persona_events_90(v0: Uh10, v1: Uh8, v2: Int, v3: Int) -> #(Uh11, Uh3, Int, Int) {
    let #(v7, v8, v9, v10, _v11) = method91(v0, v1, Uh15Nil, Uh3Nil, v2, v3, 1)
    let v13 = round_robin_96(v7, Uh11Nil)
    #(v13, v8, v9, v10)
}

pub fn method102(v0: Uh10, v1: Uh11) -> Uh11 {
    case v0  {
        Uh10Cons(v2, v3, v4, v5) -> {
            let v6 = method102(v5, v1)
            let v7 = Us17Posted(v2, v3, v4)
            let v8 = Us16Content(v7)
            Uh11Cons(v8, v6)
        }
        Uh10Nil -> v1
    }
}

pub fn method103(v0: Uh13, v1: Uh11) -> Uh11 {
    case v0  {
        Uh13Cons(v2, v3, v4) -> {
            let v5 = method103(v4, v1)
            let v6 = Us19Liked(v2, v3)
            let v7 = Us16Reaction(v6)
            Uh11Cons(v7, v5)
        }
        Uh13Nil -> v1
    }
}

pub fn method105(v0: Int, v1: Int) -> fn(String) -> String {
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
                let v5 = method105(v0, v4)
                let v6 = { v2 } <> { "\n" }
                v5(v6)
            }
        }
    }
}

pub fn method104(v0: Int, v1: String, v2: Us2, v3: String, v4: Int) -> Uh11 {
    let v5 = v4 < v0
    case v5 {
        True -> {
            let v6 = spiral_wrap_signed(v4 + 1, 32)
            let v7 = v6 % 3
            let v8 = spiral_wrap_signed(v7 + 1, 32)
            let v10 = method105(v8, 0)
            let v12 = v10("")
            let v13 = { v3 } <> { v12 }
            let v14 = method104(v0, v1, v2, v3, v6)
            let v15 = Us18Edited(v1, v13)
            let v16 = Us16Revision(v15)
            Uh11Cons(v16, v14)
        }
        False -> Uh11Nil
    }
}

pub fn method107(v0: Uh11, v1: Uh11) -> Uh11 {
    case v0  {
        Uh11Cons(v2, v3) -> {
            let v4 = Uh11Cons(v2, v1)
            method107(v3, v4)
        }
        Uh11Nil -> v1
    }
}

pub fn woven_106(v0: Int, v1: Int, v2: Uh11, v3: Uh11, v4: Uh11) -> Uh11 {
    case v3  {
        Uh11Cons(v8, v9) -> {
            let v10 = spiral_wrap_signed(v1 + 1, 32)
            let #(v23, v24, v25, v26) =
                case v2  {
                    Uh11Cons(v11, v12) -> {
                        let v13 = v10 % v0
                        let v14 = v13 == 0
                        case v14 {
                            True -> {
                                let v15 = Uh11Cons(v8, v4)
                                let v16 = Uh11Cons(v11, v15)
                                #(v0, v10, v12, v16)
                            }
                            False -> {
                                let v17 = Uh11Cons(v8, v4)
                                #(v0, v10, v2, v17)
                            }
                        }
                    }
                    _ -> {
                        let v22 = Uh11Cons(v8, v4)
                        #(v0, v10, v2, v22)
                    }
                }
            woven_106(v23, v24, v25, v9, v26)
        }
        Uh11Nil -> {
            let v6 = method107(v4, Uh11Nil)
            method77(v6, v2)
        }
    }
}

pub fn method108(v0: Uh11, v1: Uh3) -> Uh3 {
    case v0  {
        Uh11Cons(v2, v3) -> {
            let v4 = method108(v3, v1)
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
        Uh11Nil -> v1
    }
}

pub fn from_cells_65(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh8, v6: Bool, v7: String, v8: Uh3) -> #(Uh10, Uh11, Uh3) {
    let #(v12, _v13, _v14) = method66(v0, v1, v2, v3, v4, v5, v6, v7, v8, Uh10Nil, Us2None, 0)
    let v16 = method67(v12, Uh10Nil)
    let v17 = spiral_wrap_signed(v0 * 7, 32)
    let v18 = spiral_wrap_signed(v17 + 1, 32)
    let v19 = spiral_wrap_signed(v0 * 13, 32)
    let v20 = spiral_wrap_signed(v19 + 3, 32)
    let v21 = spiral_wrap_unsigned(v0, 64)
    let v22 = spiral_wrap_unsigned(v18, 64)
    let v23 = spiral_wrap_unsigned(v20, 64)
    let #(v24, v25) = seeded_68(v21, v22, v23)
    let #(v27, v28, v29) = method70(v1, v16, Uh13Nil, v24, v25)
    let v31 = method75(v27, Uh13Nil)
    let #(v33, v34, v35) = method76(v31, Uh11Nil, v28, v29)
    let v37 = method78(v16, Uh10Nil)
    let #(v45, v46, v47) =
        case v37  {
            Uh10Nil -> {
                #(Uh11Nil, v34, v35)
            }
            _ -> {
                let v40 = method79(v2, 0)
                method80(v37, v40, Uh11Nil, v34, v35)
            }
        }
    let v49 = method83(v16, Uh10Nil)
    let #(v57, v58, v59) =
        case v49  {
            Uh10Nil -> {
                #(Uh11Nil, v46, v47)
            }
            _ -> {
                let v52 = method79(v3, 0)
                method89(v49, v52, Uh11Nil, v46, v47)
            }
        }
    let #(v60, v61, _v62, _v63) = persona_events_90(v16, v5, v58, v59)
    let v65 = method102(v16, Uh11Nil)
    let v67 = method103(v31, Uh11Nil)
    let v68 = method77(v33, v60)
    let v69 = method77(v57, v68)
    let v70 = method77(v45, v69)
    let v71 = method77(v67, v70)
    let v80 =
        case v16  {
            Uh10Cons(v72, v73, v74, v75) -> {
                method104(v4, v72, v73, v74, 0)
            }
            Uh10Nil -> Uh11Nil
        }
    let v92 =
        case v80  {
            Uh11Nil -> v71
            _ -> {
                let v82 = method98(v71, 0)
                let v84 = method98(v80, 0)
                let v85 = spiral_wrap_signed(v84 + 1, 32)
                let v86 = v82 / v85
                let v87 = v86 < 1
                let v88 =
                    case v87 {
                        True -> 1
                        False -> v86
                    }
                woven_106(v88, 0, v80, v71, Uh11Nil)
            }
        }
    let v93 = method77(v65, v92)
    let v95 = method108(v57, Uh3Nil)
    let v96 = method18(v95, v61)
    #(v16, v93, v96)
}

pub fn method109(v0: Uh12, v1: Uh12) -> Uh12 {
    case v0  {
        Uh12Cons(v2, v3, v4, v5) -> {
            let v6 = method109(v5, v1)
            Uh12Cons(v2, v3, v4, v6)
        }
        Uh12Nil -> v1
    }
}

pub fn method64(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh8, v6: Bool, v7: Uh9, v8: Uh12, v9: Int) -> #(Uh12, Int) {
    let #(v26, v27) =
        case v7  {
            Uh9Cons(v10, v11) -> {
                let v12 = spiral_wrap_signed(v0 + v9, 32)
                let v13 = int.to_string(v9)
                let v14 = { "f" } <> { v13 }
                let #(v15, v16, v17) = from_cells_65(v12, v1, v2, v3, v4, v5, v6, v14, v10)
                let v19 = Uh12Cons(v15, v16, v17, Uh12Nil)
                let v20 = method109(v8, v19)
                let v21 = spiral_wrap_signed(v9 + 1, 32)
                method64(v0, v1, v2, v3, v4, v5, v6, v11, v20, v21)
            }
            _ -> {
                let #(v24, v25) =
                    case v7  {
                        Uh9Nil -> #(v8, v9)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v24, v25)
            }
        }
    #(v26, v27)
}

pub fn method110(v0: Uh12, v1: Uh15) -> Uh15 {
    case v0  {
        Uh12Cons(v2, v3, v4, v5) -> {
            let v6 = method110(v5, v1)
            Uh15Cons(v3, v6)
        }
        Uh12Nil -> v1
    }
}

pub fn method112(v0: Uh10, v1: Uh10) -> Uh10 {
    case v0  {
        Uh10Cons(v2, v3, v4, v5) -> {
            let v6 = method112(v5, v1)
            Uh10Cons(v2, v3, v4, v6)
        }
        Uh10Nil -> v1
    }
}

pub fn method111(v0: Uh12, v1: Uh10) -> Uh10 {
    case v0  {
        Uh12Cons(v2, v3, v4, v5) -> {
            let v6 = method111(v5, v1)
            method112(v2, v6)
        }
        Uh12Nil -> v1
    }
}

pub fn method113(v0: Uh12, v1: Uh3) -> Uh3 {
    case v0  {
        Uh12Cons(v2, v3, v4, v5) -> {
            let v6 = method113(v5, v1)
            method18(v4, v6)
        }
        Uh12Nil -> v1
    }
}

pub fn from_corpus_63(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh8, v6: Bool, v7: Uh9) -> #(Uh10, Uh11, Uh3) {
    let #(v10, _v11) = method64(v0, v1, v2, v3, v4, v5, v6, v7, Uh12Nil, 0)
    let v13 = method110(v10, Uh15Nil)
    let v15 = round_robin_96(v13, Uh11Nil)
    let v17 = method111(v10, Uh10Nil)
    let v19 = method113(v10, Uh3Nil)
    #(v17, v15, v19)
}

pub fn method115(v0: Uh11, v1: Uh16, v2: Int) -> #(Uh16, Int) {
    case v0  {
        Uh11Cons(v3, v4) -> {
            let v5 = spiral_wrap_signed(v2 + 1, 32)
            let v6 = Uh16Cons(v2, v3, v1)
            method115(v4, v6, v5)
        }
        Uh11Nil -> #(v1, v2)
    }
}

pub fn method116(v0: Uh16, v1: Uh16) -> Uh16 {
    case v0  {
        Uh16Cons(v2, v3, v4) -> {
            let v5 = Uh16Cons(v2, v3, v1)
            method116(v4, v5)
        }
        Uh16Nil -> v1
    }
}
