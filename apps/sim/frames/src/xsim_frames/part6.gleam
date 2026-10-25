import gleam/string
import xsim_frames/types.{type Uh3, type Us0, type Uh5, type Uh7, type Uh8, type Uh9, type Us16, type Uh10, type Uh11, type Uh14, type Uh15, Global, Uh10Cons, Uh10Nil, Uh11Cons, Uh11Nil, Uh12Nil, Uh14Cons, Uh14Nil, Uh15Cons, Uh15Nil, Uh3Cons, Uh3Nil, Uh7Nil, Uh8Cons, Uh8Nil, Uh9Cons, Uh9Nil, Us0None, Us0Some, Us16Content, Us16Reaction, Us16Revision, Us17Framed, Us17Posted, Us18Deleted, Us18Edited, Us18FrameEdited, Us19Liked, Us19Unliked, Us1Text}
import xsim_frames/part1.{spiral_string_length, spiral_string_slice, spiral_wrap_signed, spiral_wrap_unsigned, split_on_2, unicode_erlang_characters_to_binary, x_binary_split}
import xsim_frames/part2.{concat_balanced_20, delimited_19, method15, value_of_11}
import xsim_frames/part4.{listed_pieces_58, method52, method53, method54, method55, method59, method63, method64, method67, method72, method73, method74, method75, method76, method77, seeded_65}
import xsim_frames/part5.{method100, method101, method104, method80, method86, method95, method99, persona_events_87, round_robin_93}

pub fn woven_103(v0: Int, v1: Int, v2: Uh10, v3: Uh10, v4: Uh10) -> Uh10 {
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
            woven_103(v23, v24, v25, v9, v26)
        }
        Uh10Nil -> {
            let v5 = Uh10Nil
            let v6 = method104(v4, v5)
            method74(v6, v2)
        }
    }
}

pub fn method105(v0: Uh10, v1: Uh3) -> Uh3 {
    case v0  {
        Uh10Cons(v2, v3) -> {
            let v4 = method105(v3, v1)
            let v13 =
                case v2  {
                    Us16Revision(v5) -> {
                        case v5  {
                            Us18Edited(v6, v7) -> {
                                let v8 = Uh3Nil
                                Uh3Cons(v7, v8)
                            }
                            _ -> {
                                Uh3Nil
                            }
                        }
                    }
                    _ -> {
                        Uh3Nil
                    }
                }
            method15(v13, v4)
        }
        Uh10Nil -> {
            v1
        }
    }
}

pub fn from_cells_62(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh7, v6: Bool, v7: String, v8: Uh3) -> #(Uh9, Uh10, Uh3) {
    let v9 = Uh9Nil
    let v10 = Us0None
    let v11 = 0
    let #(v12, _v13, _v14) = method63(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
    let v15 = Uh9Nil
    let v16 = method64(v12, v15)
    let v17 = spiral_wrap_signed(v0 * 7, 32)
    let v18 = spiral_wrap_signed(v17 + 1, 32)
    let v19 = spiral_wrap_signed(v0 * 13, 32)
    let v20 = spiral_wrap_signed(v19 + 3, 32)
    let v21 = spiral_wrap_unsigned(v0, 64)
    let v22 = spiral_wrap_unsigned(v18, 64)
    let v23 = spiral_wrap_unsigned(v20, 64)
    let #(v24, v25) = seeded_65(v21, v22, v23)
    let v26 = Uh12Nil
    let #(v27, v28, v29) = method67(v1, v16, v26, v24, v25)
    let v30 = Uh12Nil
    let v31 = method72(v27, v30)
    let v32 = Uh10Nil
    let #(v33, v34, v35) = method73(v31, v32, v28, v29)
    let v36 = Uh9Nil
    let v37 = method75(v16, v36)
    let #(v45, v46, v47) =
        case v37  {
            Uh9Nil -> {
                let v38 = Uh10Nil
                #(v38, v34, v35)
            }
            _ -> {
                let v39 = 0
                let v40 = method76(v2, v39)
                let v41 = Uh10Nil
                method77(v37, v40, v41, v34, v35)
            }
        }
    let v48 = Uh9Nil
    let v49 = method80(v16, v48)
    let #(v57, v58, v59) =
        case v49  {
            Uh9Nil -> {
                let v50 = Uh10Nil
                #(v50, v46, v47)
            }
            _ -> {
                let v51 = 0
                let v52 = method76(v3, v51)
                let v53 = Uh10Nil
                method86(v49, v52, v53, v46, v47)
            }
        }
    let #(v60, v61, _v62, _v63) = persona_events_87(v16, v5, v58, v59)
    let v64 = Uh10Nil
    let v65 = method99(v16, v64)
    let v66 = Uh10Nil
    let v67 = method100(v31, v66)
    let v68 = method74(v33, v60)
    let v69 = method74(v57, v68)
    let v70 = method74(v45, v69)
    let v71 = method74(v67, v70)
    let v80 =
        case v16  {
            Uh9Cons(v72, v73, v74, v75) -> {
                let v76 = 0
                method101(v4, v72, v73, v74, v76)
            }
            Uh9Nil -> {
                Uh10Nil
            }
        }
    let v92 =
        case v80  {
            Uh10Nil -> {
                v71
            }
            _ -> {
                let v81 = 0
                let v82 = method95(v71, v81)
                let v83 = 0
                let v84 = method95(v80, v83)
                let v85 = spiral_wrap_signed(v84 + 1, 32)
                let v86 = v82 / v85
                let v87 = v86 < 1
                let v88 =
                    case v87 {
                        True -> {
                            1
                        }
                        False -> {
                            v86
                        }
                    }
                let v89 = 0
                let v90 = Uh10Nil
                woven_103(v88, v89, v80, v71, v90)
            }
        }
    let v93 = method74(v65, v92)
    let v94 = Uh3Nil
    let v95 = method105(v57, v94)
    let v96 = method15(v95, v61)
    #(v16, v93, v96)
}

pub fn method106(v0: Uh11, v1: Uh11) -> Uh11 {
    case v0  {
        Uh11Cons(v2, v3, v4, v5) -> {
            let v6 = method106(v5, v1)
            Uh11Cons(v2, v3, v4, v6)
        }
        Uh11Nil -> {
            v1
        }
    }
}

pub fn method61(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh7, v6: Bool, v7: Uh8, v8: Uh11, v9: Int) -> #(Uh11, Int) {
    let #(v27, v28) =
        case v7  {
            Uh8Cons(v10, v11) -> {
                let v12 = spiral_wrap_signed(v0 + v9, 32)
                let v13 = string.inspect(v9)
                let v14 = "f"
                let v15 = v14 <> v13 
                let #(v16, v17, v18) = from_cells_62(v12, v1, v2, v3, v4, v5, v6, v15, v10)
                let v19 = Uh11Nil
                let v20 = Uh11Cons(v16, v17, v18, v19)
                let v21 = method106(v8, v20)
                let v22 = spiral_wrap_signed(v9 + 1, 32)
                method61(v0, v1, v2, v3, v4, v5, v6, v11, v21, v22)
            }
            _ -> {
                let #(v25, v26) =
                    case v7  {
                        Uh8Nil -> {
                            #(v8, v9)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v25, v26)
            }
        }
    #(v27, v28)
}

pub fn method107(v0: Uh11, v1: Uh14) -> Uh14 {
    case v0  {
        Uh11Cons(v2, v3, v4, v5) -> {
            let v6 = method107(v5, v1)
            Uh14Cons(v3, v6)
        }
        Uh11Nil -> {
            v1
        }
    }
}

pub fn method109(v0: Uh9, v1: Uh9) -> Uh9 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = method109(v5, v1)
            Uh9Cons(v2, v3, v4, v6)
        }
        Uh9Nil -> {
            v1
        }
    }
}

pub fn method108(v0: Uh11, v1: Uh9) -> Uh9 {
    case v0  {
        Uh11Cons(v2, v3, v4, v5) -> {
            let v6 = method108(v5, v1)
            method109(v2, v6)
        }
        Uh11Nil -> {
            v1
        }
    }
}

pub fn method110(v0: Uh11, v1: Uh3) -> Uh3 {
    case v0  {
        Uh11Cons(v2, v3, v4, v5) -> {
            let v6 = method110(v5, v1)
            method15(v4, v6)
        }
        Uh11Nil -> {
            v1
        }
    }
}

pub fn from_corpus_60(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh7, v6: Bool, v7: Uh8) -> #(Uh9, Uh10, Uh3) {
    let v8 = Uh11Nil
    let v9 = 0
    let #(v10, _v11) = method61(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9)
    let v12 = Uh14Nil
    let v13 = method107(v10, v12)
    let v14 = Uh10Nil
    let v15 = round_robin_93(v13, v14)
    let v16 = Uh9Nil
    let v17 = method108(v10, v16)
    let v18 = Uh3Nil
    let v19 = method110(v10, v18)
    #(v17, v15, v19)
}

pub fn method112(v0: Uh10, v1: Uh15, v2: Int) -> #(Uh15, Int) {
    case v0  {
        Uh10Cons(v3, v4) -> {
            let v5 = spiral_wrap_signed(v2 + 1, 32)
            let v6 = Uh15Cons(v2, v3, v1)
            method112(v4, v6, v5)
        }
        Uh10Nil -> {
            #(v1, v2)
        }
    }
}

pub fn method113(v0: Uh15, v1: Uh15) -> Uh15 {
    case v0  {
        Uh15Cons(v2, v3, v4) -> {
            let v5 = Uh15Cons(v2, v3, v1)
            method113(v4, v5)
        }
        Uh15Nil -> {
            v1
        }
    }
}

pub fn without_controls_118(v0: String) -> String {
    let v1 = unicode_erlang_characters_to_binary([0])
    let v2 = "\\u00"
    let v3 = "0"
    let v4 = v2 <> v3 
    let v5 = v4 <> v3 
    let v6 = v0 |> string.replace(v1, v5)
    let v7 = unicode_erlang_characters_to_binary([1])
    let v8 = v2 <> v3 
    let v9 = "1"
    let v10 = v8 <> v9 
    let v11 = v6 |> string.replace(v7, v10)
    let v12 = unicode_erlang_characters_to_binary([2])
    let v13 = v2 <> v3 
    let v14 = "2"
    let v15 = v13 <> v14 
    let v16 = v11 |> string.replace(v12, v15)
    let v17 = unicode_erlang_characters_to_binary([3])
    let v18 = v2 <> v3 
    let v19 = "3"
    let v20 = v18 <> v19 
    let v21 = v16 |> string.replace(v17, v20)
    let v22 = unicode_erlang_characters_to_binary([4])
    let v23 = v2 <> v3 
    let v24 = "4"
    let v25 = v23 <> v24 
    let v26 = v21 |> string.replace(v22, v25)
    let v27 = unicode_erlang_characters_to_binary([5])
    let v28 = v2 <> v3 
    let v29 = "5"
    let v30 = v28 <> v29 
    let v31 = v26 |> string.replace(v27, v30)
    let v32 = unicode_erlang_characters_to_binary([6])
    let v33 = v2 <> v3 
    let v34 = "6"
    let v35 = v33 <> v34 
    let v36 = v31 |> string.replace(v32, v35)
    let v37 = unicode_erlang_characters_to_binary([7])
    let v38 = v2 <> v3 
    let v39 = "7"
    let v40 = v38 <> v39 
    let v41 = v36 |> string.replace(v37, v40)
    let v42 = unicode_erlang_characters_to_binary([8])
    let v43 = "\\b"
    let v44 = v41 |> string.replace(v42, v43)
    let v45 = unicode_erlang_characters_to_binary([9])
    let v46 = "\\t"
    let v47 = v44 |> string.replace(v45, v46)
    let v48 = unicode_erlang_characters_to_binary([10])
    let v49 = "\\n"
    let v50 = v47 |> string.replace(v48, v49)
    let v51 = unicode_erlang_characters_to_binary([11])
    let v52 = v2 <> v3 
    let v53 = "b"
    let v54 = v52 <> v53 
    let v55 = v50 |> string.replace(v51, v54)
    let v56 = unicode_erlang_characters_to_binary([12])
    let v57 = "\\f"
    let v58 = v55 |> string.replace(v56, v57)
    let v59 = unicode_erlang_characters_to_binary([13])
    let v60 = "\\r"
    let v61 = v58 |> string.replace(v59, v60)
    let v62 = unicode_erlang_characters_to_binary([14])
    let v63 = v2 <> v3 
    let v64 = "e"
    let v65 = v63 <> v64 
    let v66 = v61 |> string.replace(v62, v65)
    let v67 = unicode_erlang_characters_to_binary([15])
    let v68 = v2 <> v3 
    let v69 = "f"
    let v70 = v68 <> v69 
    let v71 = v66 |> string.replace(v67, v70)
    let v72 = unicode_erlang_characters_to_binary([16])
    let v73 = v2 <> v9 
    let v74 = v73 <> v3 
    let v75 = v71 |> string.replace(v72, v74)
    let v76 = unicode_erlang_characters_to_binary([17])
    let v77 = v2 <> v9 
    let v78 = v77 <> v9 
    let v79 = v75 |> string.replace(v76, v78)
    let v80 = unicode_erlang_characters_to_binary([18])
    let v81 = v2 <> v9 
    let v82 = v81 <> v14 
    let v83 = v79 |> string.replace(v80, v82)
    let v84 = unicode_erlang_characters_to_binary([19])
    let v85 = v2 <> v9 
    let v86 = v85 <> v19 
    let v87 = v83 |> string.replace(v84, v86)
    let v88 = unicode_erlang_characters_to_binary([20])
    let v89 = v2 <> v9 
    let v90 = v89 <> v24 
    let v91 = v87 |> string.replace(v88, v90)
    let v92 = unicode_erlang_characters_to_binary([21])
    let v93 = v2 <> v9 
    let v94 = v93 <> v29 
    let v95 = v91 |> string.replace(v92, v94)
    let v96 = unicode_erlang_characters_to_binary([22])
    let v97 = v2 <> v9 
    let v98 = v97 <> v34 
    let v99 = v95 |> string.replace(v96, v98)
    let v100 = unicode_erlang_characters_to_binary([23])
    let v101 = v2 <> v9 
    let v102 = v101 <> v39 
    let v103 = v99 |> string.replace(v100, v102)
    let v104 = unicode_erlang_characters_to_binary([24])
    let v105 = v2 <> v9 
    let v106 = "8"
    let v107 = v105 <> v106 
    let v108 = v103 |> string.replace(v104, v107)
    let v109 = unicode_erlang_characters_to_binary([25])
    let v110 = v2 <> v9 
    let v111 = "9"
    let v112 = v110 <> v111 
    let v113 = v108 |> string.replace(v109, v112)
    let v114 = unicode_erlang_characters_to_binary([26])
    let v115 = v2 <> v9 
    let v116 = "a"
    let v117 = v115 <> v116 
    let v118 = v113 |> string.replace(v114, v117)
    let v119 = unicode_erlang_characters_to_binary([27])
    let v120 = v2 <> v9 
    let v121 = v120 <> v53 
    let v122 = v118 |> string.replace(v119, v121)
    let v123 = unicode_erlang_characters_to_binary([28])
    let v124 = v2 <> v9 
    let v125 = "c"
    let v126 = v124 <> v125 
    let v127 = v122 |> string.replace(v123, v126)
    let v128 = unicode_erlang_characters_to_binary([29])
    let v129 = v2 <> v9 
    let v130 = "d"
    let v131 = v129 <> v130 
    let v132 = v127 |> string.replace(v128, v131)
    let v133 = unicode_erlang_characters_to_binary([30])
    let v134 = v2 <> v9 
    let v135 = v134 <> v64 
    let v136 = v132 |> string.replace(v133, v135)
    let v137 = unicode_erlang_characters_to_binary([31])
    let v138 = v2 <> v9 
    let v139 = v138 <> v69 
    let v140 = v136 |> string.replace(v137, v139)
    v140
}

pub fn quoted_117(v0: String) -> String {
    let v1 = "\\"
    let v2 = "\\\\"
    let v3 = v0 |> string.replace(v1, v2)
    let v4 = "\""
    let v5 = "\\\""
    let v6 = v3 |> string.replace(v4, v5)
    let v7 = without_controls_118(v6)
    let v8 = v4 <> v7 
    let v9 = v8 <> v4 
    v9
}

pub fn encoded_116(v0: Int, v1: Us16) -> String {
    let v266 =
        case v1  {
            Us16Content(v2) -> {
                case v2  {
                    Us17Framed(v42, v43, v44, v45, v46) -> {
                        let v47 = string.inspect(v0)
                        let v48 = "at"
                        let v49 = quoted_117(v48)
                        let v50 = ":"
                        let v51 = v49 <> v50 
                        let v52 = v51 <> v47 
                        let v53 = quoted_117(v46)
                        let v54 = "body"
                        let v55 = quoted_117(v54)
                        let v56 = v55 <> v50 
                        let v57 = v56 <> v53 
                        let v58 = string.inspect(v44)
                        let v59 = "k"
                        let v60 = quoted_117(v59)
                        let v61 = v60 <> v50 
                        let v62 = v61 <> v58 
                        let v63 = "frame"
                        let v64 = quoted_117(v63)
                        let v65 = "kind"
                        let v66 = quoted_117(v65)
                        let v67 = v66 <> v50 
                        let v68 = v67 <> v64 
                        let v69 = string.inspect(v45)
                        let v70 = "n"
                        let v71 = quoted_117(v70)
                        let v72 = v71 <> v50 
                        let v73 = v72 <> v69 
                        let v78 =
                            case v43  {
                                Us0None -> {
                                    let v76 = "null"
                                    v76
                                }
                                Us0Some(v74) -> {
                                    quoted_117(v74)
                                }
                            }
                        let v79 = "parent"
                        let v80 = quoted_117(v79)
                        let v81 = v80 <> v50 
                        let v82 = v81 <> v78 
                        let v83 = quoted_117(v42)
                        let v84 = "post"
                        let v85 = quoted_117(v84)
                        let v86 = v85 <> v50 
                        let v87 = v86 <> v83 
                        let v88 = Uh3Nil
                        let v89 = Uh3Cons(v87, v88)
                        let v90 = Uh3Cons(v82, v89)
                        let v91 = Uh3Cons(v73, v90)
                        let v92 = Uh3Cons(v68, v91)
                        let v93 = Uh3Cons(v62, v92)
                        let v94 = Uh3Cons(v57, v93)
                        Uh3Cons(v52, v94)
                    }
                    Us17Posted(v3, v4, v5) -> {
                        let v6 = string.inspect(v0)
                        let v7 = "at"
                        let v8 = quoted_117(v7)
                        let v9 = ":"
                        let v10 = v8 <> v9 
                        let v11 = v10 <> v6 
                        let v12 = "post"
                        let v13 = quoted_117(v12)
                        let v14 = "kind"
                        let v15 = quoted_117(v14)
                        let v16 = v15 <> v9 
                        let v17 = v16 <> v13 
                        let v22 =
                            case v4  {
                                Us0None -> {
                                    let v20 = "null"
                                    v20
                                }
                                Us0Some(v18) -> {
                                    quoted_117(v18)
                                }
                            }
                        let v23 = "parent"
                        let v24 = quoted_117(v23)
                        let v25 = v24 <> v9 
                        let v26 = v25 <> v22 
                        let v27 = quoted_117(v3)
                        let v28 = quoted_117(v12)
                        let v29 = v28 <> v9 
                        let v30 = v29 <> v27 
                        let v31 = quoted_117(v5)
                        let v32 = "source"
                        let v33 = quoted_117(v32)
                        let v34 = v33 <> v9 
                        let v35 = v34 <> v31 
                        let v36 = Uh3Nil
                        let v37 = Uh3Cons(v35, v36)
                        let v38 = Uh3Cons(v30, v37)
                        let v39 = Uh3Cons(v26, v38)
                        let v40 = Uh3Cons(v17, v39)
                        Uh3Cons(v11, v40)
                    }
                }
            }
            Us16Reaction(v203) -> {
                case v203  {
                    Us19Liked(v204, v205) -> {
                        let v206 = string.inspect(v0)
                        let v207 = "at"
                        let v208 = quoted_117(v207)
                        let v209 = ":"
                        let v210 = v208 <> v209 
                        let v211 = v210 <> v206 
                        let v212 = "like"
                        let v213 = quoted_117(v212)
                        let v214 = "kind"
                        let v215 = quoted_117(v214)
                        let v216 = v215 <> v209 
                        let v217 = v216 <> v213 
                        let v218 = quoted_117(v204)
                        let v219 = "post"
                        let v220 = quoted_117(v219)
                        let v221 = v220 <> v209 
                        let v222 = v221 <> v218 
                        let v223 = quoted_117(v205)
                        let v224 = "user"
                        let v225 = quoted_117(v224)
                        let v226 = v225 <> v209 
                        let v227 = v226 <> v223 
                        let v228 = Uh3Nil
                        let v229 = Uh3Cons(v227, v228)
                        let v230 = Uh3Cons(v222, v229)
                        let v231 = Uh3Cons(v217, v230)
                        Uh3Cons(v211, v231)
                    }
                    Us19Unliked(v233, v234) -> {
                        let v235 = string.inspect(v0)
                        let v236 = "at"
                        let v237 = quoted_117(v236)
                        let v238 = ":"
                        let v239 = v237 <> v238 
                        let v240 = v239 <> v235 
                        let v241 = "unlike"
                        let v242 = quoted_117(v241)
                        let v243 = "kind"
                        let v244 = quoted_117(v243)
                        let v245 = v244 <> v238 
                        let v246 = v245 <> v242 
                        let v247 = quoted_117(v233)
                        let v248 = "post"
                        let v249 = quoted_117(v248)
                        let v250 = v249 <> v238 
                        let v251 = v250 <> v247 
                        let v252 = quoted_117(v234)
                        let v253 = "user"
                        let v254 = quoted_117(v253)
                        let v255 = v254 <> v238 
                        let v256 = v255 <> v252 
                        let v257 = Uh3Nil
                        let v258 = Uh3Cons(v256, v257)
                        let v259 = Uh3Cons(v251, v258)
                        let v260 = Uh3Cons(v246, v259)
                        Uh3Cons(v240, v260)
                    }
                }
            }
            Us16Revision(v98) -> {
                case v98  {
                    Us18Deleted(v178) -> {
                        let v179 = string.inspect(v0)
                        let v180 = "at"
                        let v181 = quoted_117(v180)
                        let v182 = ":"
                        let v183 = v181 <> v182 
                        let v184 = v183 <> v179 
                        let v185 = "delete"
                        let v186 = quoted_117(v185)
                        let v187 = "kind"
                        let v188 = quoted_117(v187)
                        let v189 = v188 <> v182 
                        let v190 = v189 <> v186 
                        let v191 = quoted_117(v178)
                        let v192 = "post"
                        let v193 = quoted_117(v192)
                        let v194 = v193 <> v182 
                        let v195 = v194 <> v191 
                        let v196 = Uh3Nil
                        let v197 = Uh3Cons(v195, v196)
                        let v198 = Uh3Cons(v190, v197)
                        Uh3Cons(v184, v198)
                    }
                    Us18Edited(v99, v100) -> {
                        let v101 = string.inspect(v0)
                        let v102 = "at"
                        let v103 = quoted_117(v102)
                        let v104 = ":"
                        let v105 = v103 <> v104 
                        let v106 = v105 <> v101 
                        let v107 = "edit"
                        let v108 = quoted_117(v107)
                        let v109 = "kind"
                        let v110 = quoted_117(v109)
                        let v111 = v110 <> v104 
                        let v112 = v111 <> v108 
                        let v113 = quoted_117(v99)
                        let v114 = "post"
                        let v115 = quoted_117(v114)
                        let v116 = v115 <> v104 
                        let v117 = v116 <> v113 
                        let v118 = quoted_117(v100)
                        let v119 = "source"
                        let v120 = quoted_117(v119)
                        let v121 = v120 <> v104 
                        let v122 = v121 <> v118 
                        let v123 = Uh3Nil
                        let v124 = Uh3Cons(v122, v123)
                        let v125 = Uh3Cons(v117, v124)
                        let v126 = Uh3Cons(v112, v125)
                        Uh3Cons(v106, v126)
                    }
                    Us18FrameEdited(v128, v129, v130, v131, v132) -> {
                        let v133 = string.inspect(v0)
                        let v134 = "at"
                        let v135 = quoted_117(v134)
                        let v136 = ":"
                        let v137 = v135 <> v136 
                        let v138 = v137 <> v133 
                        let v139 = quoted_117(v132)
                        let v140 = "body"
                        let v141 = quoted_117(v140)
                        let v142 = v141 <> v136 
                        let v143 = v142 <> v139 
                        let v144 = string.inspect(v130)
                        let v145 = "k"
                        let v146 = quoted_117(v145)
                        let v147 = v146 <> v136 
                        let v148 = v147 <> v144 
                        let v149 = "edit_frame"
                        let v150 = quoted_117(v149)
                        let v151 = "kind"
                        let v152 = quoted_117(v151)
                        let v153 = v152 <> v136 
                        let v154 = v153 <> v150 
                        let v155 = string.inspect(v131)
                        let v156 = "n"
                        let v157 = quoted_117(v156)
                        let v158 = v157 <> v136 
                        let v159 = v158 <> v155 
                        let v160 = quoted_117(v128)
                        let v161 = "post"
                        let v162 = quoted_117(v161)
                        let v163 = v162 <> v136 
                        let v164 = v163 <> v160 
                        let v165 = string.inspect(v129)
                        let v166 = "rev"
                        let v167 = quoted_117(v166)
                        let v168 = v167 <> v136 
                        let v169 = v168 <> v165 
                        let v170 = Uh3Nil
                        let v171 = Uh3Cons(v169, v170)
                        let v172 = Uh3Cons(v164, v171)
                        let v173 = Uh3Cons(v159, v172)
                        let v174 = Uh3Cons(v154, v173)
                        let v175 = Uh3Cons(v148, v174)
                        let v176 = Uh3Cons(v143, v175)
                        Uh3Cons(v138, v176)
                    }
                }
            }
        }
    let v267 = ","
    let v268 = concat_balanced_20(v267, v266)
    let v269 = "{"
    let v270 = v269 <> v268 
    let v271 = "}"
    let v272 = v270 <> v271 
    v272
}

pub fn method115(v0: Uh15, v1: Uh3) -> Uh3 {
    case v0  {
        Uh15Cons(v2, v3, v4) -> {
            let v5 = method115(v4, v1)
            let v6 = encoded_116(v2, v3)
            Uh3Cons(v6, v5)
        }
        Uh15Nil -> {
            v1
        }
    }
}

pub fn stream_114(v0: Uh15) -> String {
    let v1 = Uh3Nil
    let v2 = method115(v0, v1)
    let v3 = "\n"
    let v4 = "{\"format\":\"xsim-events\",\"version\":1}"
    let v5 = Uh3Cons(v4, v2)
    let v6 = concat_balanced_20(v3, v5)
    let v7 = v6 <> v3 
    v7
}

pub fn raw_scenario_111(_v0: Uh9, v1: Uh10, v2: Uh3) -> #(String, Uh3) {
    let v3 = Uh15Nil
    let v4 = 0
    let #(v5, _v6) = method112(v1, v3, v4)
    let v7 = Uh15Nil
    let v8 = method113(v5, v7)
    let v9 = stream_114(v8)
    #(v9, v2)
}

pub fn closure10(capt: Nil) -> fn(#(String, Int, Int, Int, Int, Int, String, Bool, Int, Int)) -> #(String, String) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, _v7, _v8, _v9) = dom
        let v10 = ","
        let v11 = "+"
        let v12 = v6 |> string.replace(v10, v11)
        let v13 = v12 == ""
        let v16 =
            case v13 {
                True -> {
                    Uh3Nil
                }
                False -> {
                    split_on_2(v11, v12)
                }
            }
        let v17 = Uh3Nil
        let v18 = method52(v16, v17)
        let v19 = Uh7Nil
        let v20 = method53(v18, v19)
        let v21 = False
        let v22 = unicode_erlang_characters_to_binary([1])
        let v23 = x_binary_split(v0, v22, [Global])
        let v24 = Uh3Nil
        let v25 = listed_pieces_58(v23, v24)
        let v26 = unicode_erlang_characters_to_binary([0])
        let v27 = Uh8Nil
        let v28 = method59(v26, v25, v27)
        let #(v29, v30, v31) = from_corpus_60(v1, v2, v3, v4, v5, v20, v21, v28)
        let #(v32, v33) = raw_scenario_111(v29, v30, v31)
        let v34 = unicode_erlang_characters_to_binary([0])
        let v35 = delimited_19(v34, v33)
        #(v32, v35)
    }
}

pub fn closure12(capt: Nil) -> fn(#(String, Int, Int, Int, Int, Int, String, Bool, Int, Int)) -> #(String, String) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, _v7, _v8, _v9) = dom
        let v10 = ","
        let v11 = "+"
        let v12 = v6 |> string.replace(v10, v11)
        let v13 = v12 == ""
        let v16 =
            case v13 {
                True -> {
                    Uh3Nil
                }
                False -> {
                    split_on_2(v11, v12)
                }
            }
        let v17 = Uh3Nil
        let v18 = method52(v16, v17)
        let v19 = Uh7Nil
        let v20 = method53(v18, v19)
        let v21 = False
        let v22 = ""
        let v23 = unicode_erlang_characters_to_binary([0])
        let v24 = v0 == ""
        let v27 =
            case v24 {
                True -> {
                    Uh3Nil
                }
                False -> {
                    split_on_2(v23, v0)
                }
            }
        let #(v28, v29, v30) = from_cells_62(v1, v2, v3, v4, v5, v20, v21, v22, v27)
        let #(v31, v32) = raw_scenario_111(v28, v29, v30)
        let v33 = unicode_erlang_characters_to_binary([0])
        let v34 = delimited_19(v33, v32)
        #(v31, v34)
    }
}

pub fn method121(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method121(v3, v1)
            let v5 = spiral_string_length(v2)
            let v6 = 0
            let v7 = method54(v2, v5, v6)
            let v8 = spiral_wrap_signed(v5 - 1, 32)
            let v9 = spiral_string_slice(v2, v7, v8)
            let v10 = spiral_string_length(v9)
            let v11 = method55(v9, v10)
            let v12 = spiral_string_slice(v9, 0, v11)
            Uh3Cons(v12, v4)
        }
        Uh3Nil -> {
            v1
        }
    }
}

pub fn method122(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method122(v3, v1)
            let v5 = v2 != ""
            case v5 {
                True -> {
                    Uh3Cons(v2, v4)
                }
                False -> {
                    v4
                }
            }
        }
        Uh3Nil -> {
            v1
        }
    }
}

pub fn parent_at_125(v0: Uh5) -> Us0 {
    let v1 = "parent"
    let v2 = value_of_11(v1, v0)
    case v2  {
        Us1Text(v3) -> {
            Us0Some(v3)
        }
        _ -> {
            Us0None
        }
    }
}
