import gleam/string
import xsim_frames/types.{type Uh3, type Uh5, type Us2, type Uh7, type Uh8, type Uh9, type Us16, type Uh10, type Uh11, type Uh14, type Uh15, type Us21, type Us22, Uh10Cons, Uh10Nil, Uh11Cons, Uh11Nil, Uh12Nil, Uh14Cons, Uh14Nil, Uh15Cons, Uh15Nil, Uh3Cons, Uh3Nil, Uh5Nil, Uh7Nil, Uh8Cons, Uh8Nil, Uh9Cons, Uh9Nil, Us0Text, Us16Content, Us16Reaction, Us16Revision, Us17Framed, Us17Posted, Us18Deleted, Us18Edited, Us18FrameEdited, Us19Liked, Us19Unliked, Us1None, Us1Some, Us21Error, Us21Ok, Us22Error, Us22Ok, Us23None, Us23Some, Us2None, Us2Some}
import xsim_frames/part1.{count_at_16, fields_from_6, spiral_string_length, spiral_string_slice, spiral_wrap_signed, spiral_wrap_unsigned, split_list_2, text_at_13, unicode_erlang_characters_to_binary, value_of_14}
import xsim_frames/part2.{concat_balanced_22, delimited_21, method18}
import xsim_frames/part3.{method54, method55, method56, method57, method60, method64, method65, method68, method73, method74, method75, method76, method77, seeded_66}
import xsim_frames/part4.{method100, method101, method102, method78, method81, method87, method96, persona_events_88, round_robin_94, woven_104}

pub fn method106(v0: Uh10, v1: Uh3) -> Uh3 {
    case v0  {
        Uh10Cons(v2, v3) -> {
            let v4 = method106(v3, v1)
            let v13 =
                case v2  {
                    Us16Revision(v5) -> {
                        case v5  {
                            Us18Edited(v6, v7) -> {
                                let v8 = Uh3Nil
                                Uh3Cons(v7, v8)
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
    let v9 = Uh9Nil
    let v10 = Us2None
    let v11 = 0
    let #(v12, _v13, _v14) = method64(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
    let v15 = Uh9Nil
    let v16 = method65(v12, v15)
    let v17 = spiral_wrap_signed(v0 * 7, 32)
    let v18 = spiral_wrap_signed(v17 + 1, 32)
    let v19 = spiral_wrap_signed(v0 * 13, 32)
    let v20 = spiral_wrap_signed(v19 + 3, 32)
    let v21 = spiral_wrap_unsigned(v0, 64)
    let v22 = spiral_wrap_unsigned(v18, 64)
    let v23 = spiral_wrap_unsigned(v20, 64)
    let #(v24, v25) = seeded_66(v21, v22, v23)
    let v26 = Uh12Nil
    let #(v27, v28, v29) = method68(v1, v16, v26, v24, v25)
    let v30 = Uh12Nil
    let v31 = method73(v27, v30)
    let v32 = Uh10Nil
    let #(v33, v34, v35) = method74(v31, v32, v28, v29)
    let v36 = Uh9Nil
    let v37 = method76(v16, v36)
    let #(v45, v46, v47) =
        case v37  {
            Uh9Nil -> {
                let v38 = Uh10Nil
                #(v38, v34, v35)
            }
            _ -> {
                let v39 = 0
                let v40 = method77(v2, v39)
                let v41 = Uh10Nil
                method78(v37, v40, v41, v34, v35)
            }
        }
    let v48 = Uh9Nil
    let v49 = method81(v16, v48)
    let #(v57, v58, v59) =
        case v49  {
            Uh9Nil -> {
                let v50 = Uh10Nil
                #(v50, v46, v47)
            }
            _ -> {
                let v51 = 0
                let v52 = method77(v3, v51)
                let v53 = Uh10Nil
                method87(v49, v52, v53, v46, v47)
            }
        }
    let #(v60, v61, _v62, _v63) = persona_events_88(v16, v5, v58, v59)
    let v64 = Uh10Nil
    let v65 = method100(v16, v64)
    let v66 = Uh10Nil
    let v67 = method101(v31, v66)
    let v68 = method75(v33, v60)
    let v69 = method75(v57, v68)
    let v70 = method75(v45, v69)
    let v71 = method75(v67, v70)
    let v80 =
        case v16  {
            Uh9Cons(v72, v73, v74, v75) -> {
                let v76 = 0
                method102(v4, v72, v73, v74, v76)
            }
            Uh9Nil -> Uh10Nil
        }
    let v92 =
        case v80  {
            Uh10Nil -> v71
            _ -> {
                let v81 = 0
                let v82 = method96(v71, v81)
                let v83 = 0
                let v84 = method96(v80, v83)
                let v85 = spiral_wrap_signed(v84 + 1, 32)
                let v86 = v82 / v85
                let v87 = v86 < 1
                let v88 =
                    case v87 {
                        True -> 1
                        False -> v86
                    }
                let v89 = 0
                let v90 = Uh10Nil
                woven_104(v88, v89, v80, v71, v90)
            }
        }
    let v93 = method75(v65, v92)
    let v94 = Uh3Nil
    let v95 = method106(v57, v94)
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
    let #(v27, v28) =
        case v7  {
            Uh8Cons(v10, v11) -> {
                let v12 = spiral_wrap_signed(v0 + v9, 32)
                let v13 = string.inspect(v9)
                let v14 = "f"
                let v15 = v14 <> v13 
                let #(v16, v17, v18) = from_cells_63(v12, v1, v2, v3, v4, v5, v6, v15, v10)
                let v19 = Uh11Nil
                let v20 = Uh11Cons(v16, v17, v18, v19)
                let v21 = method107(v8, v20)
                let v22 = spiral_wrap_signed(v9 + 1, 32)
                method62(v0, v1, v2, v3, v4, v5, v6, v11, v21, v22)
            }
            _ -> {
                let #(v25, v26) =
                    case v7  {
                        Uh8Nil -> #(v8, v9)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v25, v26)
            }
        }
    #(v27, v28)
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
    let v8 = Uh11Nil
    let v9 = 0
    let #(v10, _v11) = method62(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9)
    let v12 = Uh14Nil
    let v13 = method108(v10, v12)
    let v14 = Uh10Nil
    let v15 = round_robin_94(v13, v14)
    let v16 = Uh9Nil
    let v17 = method109(v10, v16)
    let v18 = Uh3Nil
    let v19 = method111(v10, v18)
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

pub fn controls_from_121(v0: Int, v1: String) -> String {
    let v2 = v0 >= 32
    case v2 {
        True -> v1
        False -> {
            let v3 = spiral_wrap_signed(v0 + 1, 32)
            let v4 = v0 >= 0
            let v6 =
                case v4 {
                    True -> {
                        let v5 = v0 <= 1114111
                        v5
                    }
                    False -> False
                }
            let v10 =
                case v6 {
                    True -> {
                        let v7 = v0 < 55296
                        case v7 {
                            True -> True
                            False -> {
                                let v8 = v0 > 57343
                                v8
                            }
                        }
                    }
                    False -> False
                }
            let v13 =
                case v10 {
                    True -> {
                        let v11 = unicode_erlang_characters_to_binary([v0])
                        v11
                    }
                    False -> {
                        let v12 = ""
                        v12
                    }
                }
            let v14 = v0 == 8
            let v34 =
                case v14 {
                    True -> {
                        let v15 = "\\b"
                        Us2Some(v15)
                    }
                    False -> {
                        let v17 = v0 == 9
                        case v17 {
                            True -> {
                                let v18 = "\\t"
                                Us2Some(v18)
                            }
                            False -> {
                                let v20 = v0 == 10
                                case v20 {
                                    True -> {
                                        let v21 = "\\n"
                                        Us2Some(v21)
                                    }
                                    False -> {
                                        let v23 = v0 == 12
                                        case v23 {
                                            True -> {
                                                let v24 = "\\f"
                                                Us2Some(v24)
                                            }
                                            False -> {
                                                let v26 = v0 == 13
                                                case v26 {
                                                    True -> {
                                                        let v27 = "\\r"
                                                        Us2Some(v27)
                                                    }
                                                    False -> Us2None
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            let v44 =
                case v34  {
                    Us2None -> {
                        let v36 = v0 / 16
                        let v37 = spiral_string_slice("0123456789abcdef", v36, v36)
                        let v38 = "\\u00"
                        let v39 = v38 <> v37 
                        let v40 = v0 % 16
                        let v41 = spiral_string_slice("0123456789abcdef", v40, v40)
                        let v42 = v39 <> v41 
                        v42
                    }
                    Us2Some(v35) -> v35
                }
            let v45 = v1 |> string.replace(v13, v44)
            controls_from_121(v3, v45)
        }
    }
}

pub fn without_controls_120(v0: String) -> String {
    let v1 = 0
    controls_from_121(v1, v0)
}

pub fn quoted_119(v0: String) -> String {
    let v1 = "\\"
    let v2 = "\\\\"
    let v3 = v0 |> string.replace(v1, v2)
    let v4 = "\""
    let v5 = "\\\""
    let v6 = v3 |> string.replace(v4, v5)
    let v7 = without_controls_120(v6)
    let v8 = v4 <> v7 
    let v9 = v8 <> v4 
    v9
}

pub fn field_118(v0: String, v1: String) -> String {
    let v2 = quoted_119(v0)
    let v3 = ":"
    let v4 = v2 <> v3 
    let v5 = v4 <> v1 
    v5
}

pub fn encoded_117(v0: Int, v1: Us16) -> String {
    let v191 =
        case v1  {
            Us16Content(v2) -> {
                case v2  {
                    Us17Framed(v31, v32, v33, v34, v35) -> {
                        let v36 = "at"
                        let v37 = string.inspect(v0)
                        let v38 = field_118(v36, v37)
                        let v39 = "body"
                        let v40 = quoted_119(v35)
                        let v41 = field_118(v39, v40)
                        let v42 = "k"
                        let v43 = string.inspect(v33)
                        let v44 = field_118(v42, v43)
                        let v45 = "kind"
                        let v46 = "frame"
                        let v47 = quoted_119(v46)
                        let v48 = field_118(v45, v47)
                        let v49 = "n"
                        let v50 = string.inspect(v34)
                        let v51 = field_118(v49, v50)
                        let v52 = "parent"
                        let v57 =
                            case v32  {
                                Us2None -> {
                                    let v55 = "null"
                                    v55
                                }
                                Us2Some(v53) -> quoted_119(v53)
                            }
                        let v58 = field_118(v52, v57)
                        let v59 = "post"
                        let v60 = quoted_119(v31)
                        let v61 = field_118(v59, v60)
                        let v62 = Uh3Nil
                        let v63 = Uh3Cons(v61, v62)
                        let v64 = Uh3Cons(v58, v63)
                        let v65 = Uh3Cons(v51, v64)
                        let v66 = Uh3Cons(v48, v65)
                        let v67 = Uh3Cons(v44, v66)
                        let v68 = Uh3Cons(v41, v67)
                        Uh3Cons(v38, v68)
                    }
                    Us17Posted(v3, v4, v5) -> {
                        let v6 = "at"
                        let v7 = string.inspect(v0)
                        let v8 = field_118(v6, v7)
                        let v9 = "kind"
                        let v10 = "post"
                        let v11 = quoted_119(v10)
                        let v12 = field_118(v9, v11)
                        let v13 = "parent"
                        let v18 =
                            case v4  {
                                Us2None -> {
                                    let v16 = "null"
                                    v16
                                }
                                Us2Some(v14) -> quoted_119(v14)
                            }
                        let v19 = field_118(v13, v18)
                        let v20 = quoted_119(v3)
                        let v21 = field_118(v10, v20)
                        let v22 = "source"
                        let v23 = quoted_119(v5)
                        let v24 = field_118(v22, v23)
                        let v25 = Uh3Nil
                        let v26 = Uh3Cons(v24, v25)
                        let v27 = Uh3Cons(v21, v26)
                        let v28 = Uh3Cons(v19, v27)
                        let v29 = Uh3Cons(v12, v28)
                        Uh3Cons(v8, v29)
                    }
                }
            }
            Us16Reaction(v146) -> {
                case v146  {
                    Us19Liked(v147, v148) -> {
                        let v149 = "at"
                        let v150 = string.inspect(v0)
                        let v151 = field_118(v149, v150)
                        let v152 = "kind"
                        let v153 = "like"
                        let v154 = quoted_119(v153)
                        let v155 = field_118(v152, v154)
                        let v156 = "post"
                        let v157 = quoted_119(v147)
                        let v158 = field_118(v156, v157)
                        let v159 = "user"
                        let v160 = quoted_119(v148)
                        let v161 = field_118(v159, v160)
                        let v162 = Uh3Nil
                        let v163 = Uh3Cons(v161, v162)
                        let v164 = Uh3Cons(v158, v163)
                        let v165 = Uh3Cons(v155, v164)
                        Uh3Cons(v151, v165)
                    }
                    Us19Unliked(v167, v168) -> {
                        let v169 = "at"
                        let v170 = string.inspect(v0)
                        let v171 = field_118(v169, v170)
                        let v172 = "kind"
                        let v173 = "unlike"
                        let v174 = quoted_119(v173)
                        let v175 = field_118(v172, v174)
                        let v176 = "post"
                        let v177 = quoted_119(v167)
                        let v178 = field_118(v176, v177)
                        let v179 = "user"
                        let v180 = quoted_119(v168)
                        let v181 = field_118(v179, v180)
                        let v182 = Uh3Nil
                        let v183 = Uh3Cons(v181, v182)
                        let v184 = Uh3Cons(v178, v183)
                        let v185 = Uh3Cons(v175, v184)
                        Uh3Cons(v171, v185)
                    }
                }
            }
            Us16Revision(v72) -> {
                case v72  {
                    Us18Deleted(v128) -> {
                        let v129 = "at"
                        let v130 = string.inspect(v0)
                        let v131 = field_118(v129, v130)
                        let v132 = "kind"
                        let v133 = "delete"
                        let v134 = quoted_119(v133)
                        let v135 = field_118(v132, v134)
                        let v136 = "post"
                        let v137 = quoted_119(v128)
                        let v138 = field_118(v136, v137)
                        let v139 = Uh3Nil
                        let v140 = Uh3Cons(v138, v139)
                        let v141 = Uh3Cons(v135, v140)
                        Uh3Cons(v131, v141)
                    }
                    Us18Edited(v73, v74) -> {
                        let v75 = "at"
                        let v76 = string.inspect(v0)
                        let v77 = field_118(v75, v76)
                        let v78 = "kind"
                        let v79 = "edit"
                        let v80 = quoted_119(v79)
                        let v81 = field_118(v78, v80)
                        let v82 = "post"
                        let v83 = quoted_119(v73)
                        let v84 = field_118(v82, v83)
                        let v85 = "source"
                        let v86 = quoted_119(v74)
                        let v87 = field_118(v85, v86)
                        let v88 = Uh3Nil
                        let v89 = Uh3Cons(v87, v88)
                        let v90 = Uh3Cons(v84, v89)
                        let v91 = Uh3Cons(v81, v90)
                        Uh3Cons(v77, v91)
                    }
                    Us18FrameEdited(v93, v94, v95, v96, v97) -> {
                        let v98 = "at"
                        let v99 = string.inspect(v0)
                        let v100 = field_118(v98, v99)
                        let v101 = "body"
                        let v102 = quoted_119(v97)
                        let v103 = field_118(v101, v102)
                        let v104 = "k"
                        let v105 = string.inspect(v95)
                        let v106 = field_118(v104, v105)
                        let v107 = "kind"
                        let v108 = "edit_frame"
                        let v109 = quoted_119(v108)
                        let v110 = field_118(v107, v109)
                        let v111 = "n"
                        let v112 = string.inspect(v96)
                        let v113 = field_118(v111, v112)
                        let v114 = "post"
                        let v115 = quoted_119(v93)
                        let v116 = field_118(v114, v115)
                        let v117 = "rev"
                        let v118 = string.inspect(v94)
                        let v119 = field_118(v117, v118)
                        let v120 = Uh3Nil
                        let v121 = Uh3Cons(v119, v120)
                        let v122 = Uh3Cons(v116, v121)
                        let v123 = Uh3Cons(v113, v122)
                        let v124 = Uh3Cons(v110, v123)
                        let v125 = Uh3Cons(v106, v124)
                        let v126 = Uh3Cons(v103, v125)
                        Uh3Cons(v100, v126)
                    }
                }
            }
        }
    let v192 = ","
    let v193 = concat_balanced_22(v192, v191)
    let v194 = "{"
    let v195 = v194 <> v193 
    let v196 = "}"
    let v197 = v195 <> v196 
    v197
}

pub fn method116(v0: Uh15, v1: Uh3) -> Uh3 {
    case v0  {
        Uh15Cons(v2, v3, v4) -> {
            let v5 = method116(v4, v1)
            let v6 = encoded_117(v2, v3)
            Uh3Cons(v6, v5)
        }
        Uh15Nil -> v1
    }
}

pub fn stream_115(v0: Uh15) -> String {
    let v1 = Uh3Nil
    let v2 = method116(v0, v1)
    let v3 = "\n"
    let v4 = "{\"format\":\"xsim-events\",\"version\":1}"
    let v5 = Uh3Cons(v4, v2)
    let v6 = concat_balanced_22(v3, v5)
    let v7 = v6 <> v3 
    v7
}

pub fn raw_scenario_112(_v0: Uh9, v1: Uh10, v2: Uh3) -> #(String, Uh3) {
    let v3 = Uh15Nil
    let v4 = 0
    let #(v5, _v6) = method113(v1, v3, v4)
    let v7 = Uh15Nil
    let v8 = method114(v5, v7)
    let v9 = stream_115(v8)
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
                True -> Uh3Nil
                False -> split_list_2(v11, v12)
            }
        let v17 = Uh3Nil
        let v18 = method54(v16, v17)
        let v19 = Uh7Nil
        let v20 = method55(v18, v19)
        let v21 = False
        let v22 = unicode_erlang_characters_to_binary([1])
        let v23 = split_list_2(v22, v0)
        let v24 = unicode_erlang_characters_to_binary([0])
        let v25 = Uh8Nil
        let v26 = method60(v24, v23, v25)
        let #(v27, v28, v29) = from_corpus_61(v1, v2, v3, v4, v5, v20, v21, v26)
        let #(v30, v31) = raw_scenario_112(v27, v28, v29)
        let v32 = unicode_erlang_characters_to_binary([0])
        let v33 = delimited_21(v32, v31)
        #(v30, v33)
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
                True -> Uh3Nil
                False -> split_list_2(v11, v12)
            }
        let v17 = Uh3Nil
        let v18 = method54(v16, v17)
        let v19 = Uh7Nil
        let v20 = method55(v18, v19)
        let v21 = False
        let v22 = ""
        let v23 = unicode_erlang_characters_to_binary([0])
        let v24 = v0 == ""
        let v27 =
            case v24 {
                True -> Uh3Nil
                False -> split_list_2(v23, v0)
            }
        let #(v28, v29, v30) = from_cells_63(v1, v2, v3, v4, v5, v20, v21, v22, v27)
        let #(v31, v32) = raw_scenario_112(v28, v29, v30)
        let v33 = unicode_erlang_characters_to_binary([0])
        let v34 = delimited_21(v33, v32)
        #(v31, v34)
    }
}

pub fn method124(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method124(v3, v1)
            let v5 = spiral_string_length(v2)
            let v6 = 0
            let v7 = method56(v2, v5, v6)
            let v8 = spiral_wrap_signed(v5 - 1, 32)
            let v9 = spiral_string_slice(v2, v7, v8)
            let v10 = spiral_string_length(v9)
            let v11 = method57(v9, v10)
            let v12 = spiral_string_slice(v9, 0, v11)
            Uh3Cons(v12, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method125(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method125(v3, v1)
            let v5 = v2 != ""
            case v5 {
                True -> Uh3Cons(v2, v4)
                False -> v4
            }
        }
        Uh3Nil -> v1
    }
}

pub fn parent_at_128(v0: Uh5) -> Us2 {
    let v1 = "parent"
    let v2 = value_of_14(v1, v0)
    case v2  {
        Us0Text(v3) -> Us2Some(v3)
        _ -> Us2None
    }
}

pub fn decoded_127(v0: String) -> Us22 {
    let v1 = spiral_string_length(v0)
    let v2 = 0 > v1
    let v7 =
        case v2 {
            True -> False
            False -> {
                let v3 = spiral_wrap_signed(v1 - 1, 32)
                let v4 = spiral_string_slice(v0, 0, v3)
                let v5 = "{"
                let v6 = v4 |> string.starts_with(v5)
                v6
            }
        }
    let v12 =
        case v7 {
            True -> {
                let v8 = 1
                let v9 = Uh5Nil
                fields_from_6(v0, v8, v9)
            }
            False -> Us1None
        }
    case v12  {
        Us1None -> {
            let v102 = "not a compact xsim-events line: "
            let v103 = v102 <> v0 
            Us22Error(v103)
        }
        Us1Some(v13) -> {
            let v14 = "kind"
            let v15 = text_at_13(v14, v13)
            let v16 = v15 == "post"
            let v89 =
                case v16 {
                    True -> {
                        let v17 = "post"
                        let v18 = text_at_13(v17, v13)
                        let v19 = parent_at_128(v13)
                        let v20 = "source"
                        let v21 = text_at_13(v20, v13)
                        let v22 = Us17Posted(v18, v19, v21)
                        let v23 = Us16Content(v22)
                        Us23Some(v23)
                    }
                    False -> {
                        let v25 = v15 == "frame"
                        case v25 {
                            True -> {
                                let v26 = "post"
                                let v27 = text_at_13(v26, v13)
                                let v28 = parent_at_128(v13)
                                let v29 = "k"
                                let v30 = count_at_16(v29, v13)
                                let v31 = "n"
                                let v32 = count_at_16(v31, v13)
                                let v33 = "body"
                                let v34 = text_at_13(v33, v13)
                                let v35 = Us17Framed(v27, v28, v30, v32, v34)
                                let v36 = Us16Content(v35)
                                Us23Some(v36)
                            }
                            False -> {
                                let v38 = v15 == "edit"
                                case v38 {
                                    True -> {
                                        let v39 = "post"
                                        let v40 = text_at_13(v39, v13)
                                        let v41 = "source"
                                        let v42 = text_at_13(v41, v13)
                                        let v43 = Us18Edited(v40, v42)
                                        let v44 = Us16Revision(v43)
                                        Us23Some(v44)
                                    }
                                    False -> {
                                        let v46 = v15 == "edit_frame"
                                        case v46 {
                                            True -> {
                                                let v47 = "post"
                                                let v48 = text_at_13(v47, v13)
                                                let v49 = "rev"
                                                let v50 = count_at_16(v49, v13)
                                                let v51 = "k"
                                                let v52 = count_at_16(v51, v13)
                                                let v53 = "n"
                                                let v54 = count_at_16(v53, v13)
                                                let v55 = "body"
                                                let v56 = text_at_13(v55, v13)
                                                let v57 = Us18FrameEdited(v48, v50, v52, v54, v56)
                                                let v58 = Us16Revision(v57)
                                                Us23Some(v58)
                                            }
                                            False -> {
                                                let v60 = v15 == "delete"
                                                case v60 {
                                                    True -> {
                                                        let v61 = "post"
                                                        let v62 = text_at_13(v61, v13)
                                                        let v63 = Us18Deleted(v62)
                                                        let v64 = Us16Revision(v63)
                                                        Us23Some(v64)
                                                    }
                                                    False -> {
                                                        let v66 = v15 == "like"
                                                        case v66 {
                                                            True -> {
                                                                let v67 = "post"
                                                                let v68 = text_at_13(v67, v13)
                                                                let v69 = "user"
                                                                let v70 = text_at_13(v69, v13)
                                                                let v71 = Us19Liked(v68, v70)
                                                                let v72 = Us16Reaction(v71)
                                                                Us23Some(v72)
                                                            }
                                                            False -> {
                                                                let v74 = v15 == "unlike"
                                                                case v74 {
                                                                    True -> {
                                                                        let v75 = "post"
                                                                        let v76 = text_at_13(v75, v13)
                                                                        let v77 = "user"
                                                                        let v78 = text_at_13(v77, v13)
                                                                        let v79 = Us19Unliked(v76, v78)
                                                                        let v80 = Us16Reaction(v79)
                                                                        Us23Some(v80)
                                                                    }
                                                                    False -> Us23None
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
            case v89  {
                Us23None -> {
                    let v94 = text_at_13(v14, v13)
                    let v95 = "unknown event kind '"
                    let v96 = v95 <> v94 
                    let v97 = "'"
                    let v98 = v96 <> v97 
                    Us22Error(v98)
                }
                Us23Some(v90) -> {
                    let v91 = "at"
                    let v92 = count_at_16(v91, v13)
                    Us22Ok(v92, v90)
                }
            }
        }
    }
}

pub fn all_decoded_126(v0: Uh3, v1: Uh15) -> Us21 {
    case v0  {
        Uh3Cons(v5, v6) -> {
            let v7 = decoded_127(v5)
            case v7  {
                Us22Error(v12) -> Us21Error(v12)
                Us22Ok(v8, v9) -> {
                    let v10 = Uh15Cons(v8, v9, v1)
                    all_decoded_126(v6, v10)
                }
            }
        }
        Uh3Nil -> {
            let v2 = Uh15Nil
            let v3 = method114(v1, v2)
            Us21Ok(v3)
        }
    }
}
