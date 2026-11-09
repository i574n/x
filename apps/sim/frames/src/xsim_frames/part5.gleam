import gleam/int
import gleam/string
import xsim_split
import xsim_frames/types.{type Uh3, type Uh5, type Us2, type Uh9, type Us16, type Uh10, type Uh15, type Us21, type Us22, type Uh16, type Uh17, type Uh18, type Us24, Uh10Cons, Uh10Nil, Uh15Cons, Uh15Nil, Uh16Cons, Uh16Nil, Uh17Cons, Uh17Nil, Uh18Cons, Uh18Nil, Uh3Cons, Uh3Nil, Uh5Nil, Uh7Nil, Uh8Nil, Us0Text, Us16Content, Us16Reaction, Us16Revision, Us17Framed, Us17Posted, Us18Deleted, Us18Edited, Us18FrameEdited, Us19Liked, Us19Unliked, Us1None, Us1Some, Us21Error, Us21Ok, Us22Error, Us22Ok, Us23None, Us23Some, Us24None, Us24Some, Us2None, Us2Some}
import xsim_frames/part1.{count_at_16, fields_from_6, spiral_string_length, spiral_string_slice, spiral_wrap_signed, spiral_wrap_unsigned, split_list_2, text_at_13, unicode_erlang_characters_to_binary, value_of_14}
import xsim_frames/part2.{concat_balanced_22, delimited_21}
import xsim_frames/part3.{method54, method55, method56, method57, method60, seeded_66, uniform_69}
import xsim_frames/part4.{break_source_82, from_cells_63, from_corpus_61, method113, method114}

pub fn controls_from_120(v0: Int, v1: String) -> String {
    let v2 = v0 >= 32
    case v2 {
        True -> v1
        False -> {
            let v3 = spiral_wrap_signed(v0 + 1, 32)
            let v4 = v0 >= 0
            let v6 =
                case v4 {
                    True -> {
                        v0 <= 1114111
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
                                v0 > 57343
                            }
                        }
                    }
                    False -> False
                }
            let v13 =
                case v10 {
                    True -> {
                        unicode_erlang_characters_to_binary([v0])
                    }
                    False -> {
                        ""
                    }
                }
            let v14 = v0 == 8
            let v34 =
                case v14 {
                    True -> {
                        Us2Some("\\b")
                    }
                    False -> {
                        let v17 = v0 == 9
                        case v17 {
                            True -> {
                                Us2Some("\\t")
                            }
                            False -> {
                                let v20 = v0 == 10
                                case v20 {
                                    True -> {
                                        Us2Some("\\n")
                                    }
                                    False -> {
                                        let v23 = v0 == 12
                                        case v23 {
                                            True -> {
                                                Us2Some("\\f")
                                            }
                                            False -> {
                                                let v26 = v0 == 13
                                                case v26 {
                                                    True -> {
                                                        Us2Some("\\r")
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
            let v48 =
                case v34  {
                    Us2None -> {
                        let v36 = v0 / 16
                        let v37 = spiral_string_slice("0123456789abcdef", v36, v36)
                        let v38 = v0 % 16
                        let v39 = spiral_string_slice("0123456789abcdef", v38, v38)
                        let v43 = Uh3Cons(v39, Uh3Nil)
                        let v44 = Uh3Cons(v37, v43)
                        let v45 = Uh3Cons("\\u00", v44)
                        concat_balanced_22("", v45)
                    }
                    Us2Some(v35) -> v35
                }
            let v49 = v1 |> string.replace(v13, v48)
            controls_from_120(v3, v49)
        }
    }
}

pub fn quoted_119(v0: String) -> String {
    let v3 = v0 |> string.replace("\\", "\\\\")
    let v4 = "\""
    let v6 = v3 |> string.replace(v4, "\\\"")
    let v8 = controls_from_120(0, v6)
    let v11 = Uh3Cons(v4, Uh3Nil)
    let v12 = Uh3Cons(v8, v11)
    let v13 = Uh3Cons(v4, v12)
    concat_balanced_22("", v13)
}

pub fn field_118(v0: String, v1: String) -> String {
    let v2 = quoted_119(v0)
    let v3 = { v2 } <> { ":" }
    let v4 = { v3 } <> { v1 }
    v4
}

pub fn encoded_117(v0: Int, v1: Us16) -> String {
    let v191 =
        case v1  {
            Us16Content(v2) -> {
                case v2  {
                    Us17Framed(v31, v32, v33, v34, v35) -> {
                        let v37 = int.to_string(v0)
                        let v38 = field_118("at", v37)
                        let v40 = quoted_119(v35)
                        let v41 = field_118("body", v40)
                        let v43 = int.to_string(v33)
                        let v44 = field_118("k", v43)
                        let v47 = quoted_119("frame")
                        let v48 = field_118("kind", v47)
                        let v50 = int.to_string(v34)
                        let v51 = field_118("n", v50)
                        let v57 =
                            case v32  {
                                Us2None -> {
                                    "null"
                                }
                                Us2Some(v53) -> quoted_119(v53)
                            }
                        let v58 = field_118("parent", v57)
                        let v60 = quoted_119(v31)
                        let v61 = field_118("post", v60)
                        let v63 = Uh3Cons(v61, Uh3Nil)
                        let v64 = Uh3Cons(v58, v63)
                        let v65 = Uh3Cons(v51, v64)
                        let v66 = Uh3Cons(v48, v65)
                        let v67 = Uh3Cons(v44, v66)
                        let v68 = Uh3Cons(v41, v67)
                        Uh3Cons(v38, v68)
                    }
                    Us17Posted(v3, v4, v5) -> {
                        let v7 = int.to_string(v0)
                        let v8 = field_118("at", v7)
                        let v10 = "post"
                        let v11 = quoted_119(v10)
                        let v12 = field_118("kind", v11)
                        let v18 =
                            case v4  {
                                Us2None -> {
                                    "null"
                                }
                                Us2Some(v14) -> quoted_119(v14)
                            }
                        let v19 = field_118("parent", v18)
                        let v20 = quoted_119(v3)
                        let v21 = field_118(v10, v20)
                        let v23 = quoted_119(v5)
                        let v24 = field_118("source", v23)
                        let v26 = Uh3Cons(v24, Uh3Nil)
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
                        let v150 = int.to_string(v0)
                        let v151 = field_118("at", v150)
                        let v154 = quoted_119("like")
                        let v155 = field_118("kind", v154)
                        let v157 = quoted_119(v147)
                        let v158 = field_118("post", v157)
                        let v160 = quoted_119(v148)
                        let v161 = field_118("user", v160)
                        let v163 = Uh3Cons(v161, Uh3Nil)
                        let v164 = Uh3Cons(v158, v163)
                        let v165 = Uh3Cons(v155, v164)
                        Uh3Cons(v151, v165)
                    }
                    Us19Unliked(v167, v168) -> {
                        let v170 = int.to_string(v0)
                        let v171 = field_118("at", v170)
                        let v174 = quoted_119("unlike")
                        let v175 = field_118("kind", v174)
                        let v177 = quoted_119(v167)
                        let v178 = field_118("post", v177)
                        let v180 = quoted_119(v168)
                        let v181 = field_118("user", v180)
                        let v183 = Uh3Cons(v181, Uh3Nil)
                        let v184 = Uh3Cons(v178, v183)
                        let v185 = Uh3Cons(v175, v184)
                        Uh3Cons(v171, v185)
                    }
                }
            }
            Us16Revision(v72) -> {
                case v72  {
                    Us18Deleted(v128) -> {
                        let v130 = int.to_string(v0)
                        let v131 = field_118("at", v130)
                        let v134 = quoted_119("delete")
                        let v135 = field_118("kind", v134)
                        let v137 = quoted_119(v128)
                        let v138 = field_118("post", v137)
                        let v140 = Uh3Cons(v138, Uh3Nil)
                        let v141 = Uh3Cons(v135, v140)
                        Uh3Cons(v131, v141)
                    }
                    Us18Edited(v73, v74) -> {
                        let v76 = int.to_string(v0)
                        let v77 = field_118("at", v76)
                        let v80 = quoted_119("edit")
                        let v81 = field_118("kind", v80)
                        let v83 = quoted_119(v73)
                        let v84 = field_118("post", v83)
                        let v86 = quoted_119(v74)
                        let v87 = field_118("source", v86)
                        let v89 = Uh3Cons(v87, Uh3Nil)
                        let v90 = Uh3Cons(v84, v89)
                        let v91 = Uh3Cons(v81, v90)
                        Uh3Cons(v77, v91)
                    }
                    Us18FrameEdited(v93, v94, v95, v96, v97) -> {
                        let v99 = int.to_string(v0)
                        let v100 = field_118("at", v99)
                        let v102 = quoted_119(v97)
                        let v103 = field_118("body", v102)
                        let v105 = int.to_string(v95)
                        let v106 = field_118("k", v105)
                        let v109 = quoted_119("edit_frame")
                        let v110 = field_118("kind", v109)
                        let v112 = int.to_string(v96)
                        let v113 = field_118("n", v112)
                        let v115 = quoted_119(v93)
                        let v116 = field_118("post", v115)
                        let v118 = int.to_string(v94)
                        let v119 = field_118("rev", v118)
                        let v121 = Uh3Cons(v119, Uh3Nil)
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
    let v193 = concat_balanced_22(",", v191)
    let v194 = { "{" } <> { v193 }
    let v195 = { v194 } <> { "}" }
    v195
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
    let v2 = method116(v0, Uh3Nil)
    let v5 = Uh3Cons("{\"format\":\"xsim-events\",\"version\":1}", v2)
    let v6 = concat_balanced_22("\n", v5)
    let v7 = { v6 } <> { "\n" }
    v7
}

pub fn raw_scenario_112(_v0: Uh9, v1: Uh10, v2: Uh3) -> #(String, Uh3) {
    let #(v5, _v6) = method113(v1, Uh15Nil, 0)
    let v8 = method114(v5, Uh15Nil)
    let v9 = stream_115(v8)
    #(v9, v2)
}

pub fn closure10(capt: Nil) -> fn(#(String, Int, Int, Int, Int, Int, String, Bool, Int, Int)) -> #(String, String) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, _v7, _v8, _v9) = dom
        let v11 = "+"
        let v12 = v6 |> string.replace(",", v11)
        let v13 = v12 == ""
        let v16 =
            case v13 {
                True -> Uh3Nil
                False -> split_list_2(v11, v12)
            }
        let v18 = method54(v16, Uh3Nil)
        let v20 = method55(v18, Uh7Nil)
        let v22 = unicode_erlang_characters_to_binary([1])
        let v23 = split_list_2(v22, v0)
        let v24 = unicode_erlang_characters_to_binary([0])
        let v26 = method60(v24, v23, Uh8Nil)
        let #(v27, v28, v29) = from_corpus_61(v1, v2, v3, v4, v5, v20, False, v26)
        let #(v30, v31) = raw_scenario_112(v27, v28, v29)
        let v32 = unicode_erlang_characters_to_binary([0])
        let v33 = delimited_21(v32, v31)
        #(v30, v33)
    }
}

pub fn closure12(capt: Nil) -> fn(#(String, Int, Int, Int, Int, Int, String, Bool, Int, Int)) -> #(String, String) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, _v7, _v8, _v9) = dom
        let v11 = "+"
        let v12 = v6 |> string.replace(",", v11)
        let v13 = v12 == ""
        let v16 =
            case v13 {
                True -> Uh3Nil
                False -> split_list_2(v11, v12)
            }
        let v18 = method54(v16, Uh3Nil)
        let v20 = method55(v18, Uh7Nil)
        let v23 = unicode_erlang_characters_to_binary([0])
        let v24 = v0 == ""
        let v27 =
            case v24 {
                True -> Uh3Nil
                False -> split_list_2(v23, v0)
            }
        let #(v28, v29, v30) = from_cells_63(v1, v2, v3, v4, v5, v20, False, "", v27)
        let #(v31, v32) = raw_scenario_112(v28, v29, v30)
        let v33 = unicode_erlang_characters_to_binary([0])
        let v34 = delimited_21(v33, v32)
        #(v31, v34)
    }
}

pub fn method123(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method123(v3, v1)
            let v5 = spiral_string_length(v2)
            let v7 = method56(v2, v5, 0)
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

pub fn method124(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method124(v3, v1)
            let v5 = v2 != ""
            case v5 {
                True -> Uh3Cons(v2, v4)
                False -> v4
            }
        }
        Uh3Nil -> v1
    }
}

pub fn parent_at_127(v0: Uh5) -> Us2 {
    let v2 = value_of_14("parent", v0)
    case v2  {
        Us0Text(v3) -> Us2Some(v3)
        _ -> Us2None
    }
}

pub fn decoded_126(v0: String) -> Us22 {
    let v1 = spiral_string_length(v0)
    let v2 = 0 > v1
    let v7 =
        case v2 {
            True -> False
            False -> {
                let v3 = spiral_wrap_signed(v1 - 1, 32)
                let v4 = spiral_string_slice(v0, 0, v3)
                let v6 = v4 |> string.starts_with("{")
                v6
            }
        }
    let v12 =
        case v7 {
            True -> {
                fields_from_6(v0, 1, Uh5Nil)
            }
            False -> Us1None
        }
    case v12  {
        Us1None -> {
            let v100 = { "not a compact xsim-events line: " } <> { v0 }
            Us22Error(v100)
        }
        Us1Some(v13) -> {
            let v14 = "kind"
            let v15 = text_at_13(v14, v13)
            let v16 = v15 == "post"
            let v89 =
                case v16 {
                    True -> {
                        let v18 = text_at_13("post", v13)
                        let v19 = parent_at_127(v13)
                        let v21 = text_at_13("source", v13)
                        let v22 = Us17Posted(v18, v19, v21)
                        let v23 = Us16Content(v22)
                        Us23Some(v23)
                    }
                    False -> {
                        let v25 = v15 == "frame"
                        case v25 {
                            True -> {
                                let v27 = text_at_13("post", v13)
                                let v28 = parent_at_127(v13)
                                let v30 = count_at_16("k", v13)
                                let v32 = count_at_16("n", v13)
                                let v34 = text_at_13("body", v13)
                                let v35 = Us17Framed(v27, v28, v30, v32, v34)
                                let v36 = Us16Content(v35)
                                Us23Some(v36)
                            }
                            False -> {
                                let v38 = v15 == "edit"
                                case v38 {
                                    True -> {
                                        let v40 = text_at_13("post", v13)
                                        let v42 = text_at_13("source", v13)
                                        let v43 = Us18Edited(v40, v42)
                                        let v44 = Us16Revision(v43)
                                        Us23Some(v44)
                                    }
                                    False -> {
                                        let v46 = v15 == "edit_frame"
                                        case v46 {
                                            True -> {
                                                let v48 = text_at_13("post", v13)
                                                let v50 = count_at_16("rev", v13)
                                                let v52 = count_at_16("k", v13)
                                                let v54 = count_at_16("n", v13)
                                                let v56 = text_at_13("body", v13)
                                                let v57 = Us18FrameEdited(v48, v50, v52, v54, v56)
                                                let v58 = Us16Revision(v57)
                                                Us23Some(v58)
                                            }
                                            False -> {
                                                let v60 = v15 == "delete"
                                                case v60 {
                                                    True -> {
                                                        let v62 = text_at_13("post", v13)
                                                        let v63 = Us18Deleted(v62)
                                                        let v64 = Us16Revision(v63)
                                                        Us23Some(v64)
                                                    }
                                                    False -> {
                                                        let v66 = v15 == "like"
                                                        case v66 {
                                                            True -> {
                                                                let v68 = text_at_13("post", v13)
                                                                let v70 = text_at_13("user", v13)
                                                                let v71 = Us19Liked(v68, v70)
                                                                let v72 = Us16Reaction(v71)
                                                                Us23Some(v72)
                                                            }
                                                            False -> {
                                                                let v74 = v15 == "unlike"
                                                                case v74 {
                                                                    True -> {
                                                                        let v76 = text_at_13("post", v13)
                                                                        let v78 = text_at_13("user", v13)
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
                    let v95 = { "unknown event kind '" } <> { v94 }
                    let v96 = { v95 } <> { "'" }
                    Us22Error(v96)
                }
                Us23Some(v90) -> {
                    let v92 = count_at_16("at", v13)
                    Us22Ok(v92, v90)
                }
            }
        }
    }
}

pub fn all_decoded_125(v0: Uh3, v1: Uh15) -> Us21 {
    case v0  {
        Uh3Cons(v5, v6) -> {
            let v7 = decoded_126(v5)
            case v7  {
                Us22Error(v12) -> Us21Error(v12)
                Us22Ok(v8, v9) -> {
                    let v10 = Uh15Cons(v8, v9, v1)
                    all_decoded_125(v6, v10)
                }
            }
        }
        Uh3Nil -> {
            let v3 = method114(v1, Uh15Nil)
            Us21Ok(v3)
        }
    }
}

pub fn decoded_stream_122(v0: String) -> Us21 {
    let v1 = v0 == ""
    let v5 =
        case v1 {
            True -> Uh3Nil
            False -> {
                split_list_2("\n", v0)
            }
        }
    let v7 = method123(v5, Uh3Nil)
    let v9 = method124(v7, Uh3Nil)
    case v9  {
        Uh3Cons(v10, v11) -> {
            let v12 = spiral_string_length(v10)
            let v13 = 0 > v12
            let v18 =
                case v13 {
                    True -> False
                    False -> {
                        let v14 = spiral_wrap_signed(v12 - 1, 32)
                        let v15 = spiral_string_slice(v10, 0, v14)
                        let v17 = v15 |> string.starts_with("{")
                        v17
                    }
                }
            let v23 =
                case v18 {
                    True -> {
                        fields_from_6(v10, 1, Uh5Nil)
                    }
                    False -> Us1None
                }
            let v33 =
                case v23  {
                    Us1None -> False
                    Us1Some(v24) -> {
                        let v26 = text_at_13("format", v24)
                        let v27 = v26 == "xsim-events"
                        case v27 {
                            True -> {
                                let v29 = count_at_16("version", v24)
                                v29 == 1
                            }
                            False -> False
                        }
                    }
                }
            case v33 {
                True -> {
                    all_decoded_125(v11, Uh15Nil)
                }
                False -> {
                    Us21Error("not an xsim-events v1 stream")
                }
            }
        }
        _ -> {
            Us21Error("not an xsim-events v1 stream")
        }
    }
}

pub fn method128(v0: Uh15, v1: Uh10) -> Uh10 {
    case v0  {
        Uh15Cons(v2, v3, v4) -> {
            let v5 = method128(v4, v1)
            Uh10Cons(v3, v5)
        }
        Uh15Nil -> v1
    }
}

pub fn method131(v0: Int, v1: Int, v2: Int, v3: Us16, v4: Int) -> Uh16 {
    let v5 = v4 < v0
    case v5 {
        True -> {
            let v6 = spiral_wrap_signed(v1 + v2, 32)
            let v7 = spiral_wrap_signed(v6 + v4, 32)
            let v8 = spiral_wrap_signed(v7 + 1, 32)
            let v9 = spiral_wrap_signed(v4 + 1, 32)
            let v10 = method131(v0, v1, v2, v3, v9)
            Uh16Cons(v8, v1, v3, v10)
        }
        False -> Uh16Nil
    }
}

pub fn method132(v0: Uh16, v1: Uh16) -> Uh16 {
    case v0  {
        Uh16Cons(v2, v3, v4, v5) -> {
            let v6 = method132(v5, v1)
            Uh16Cons(v2, v3, v4, v6)
        }
        Uh16Nil -> v1
    }
}

pub fn method130(v0: Int, v1: Int, v2: Uh10, v3: Uh16, v4: Int, v5: Int, v6: Int) -> #(Uh16, Int, Int, Int) {
    let #(v33, v34, v35, v36) =
        case v2  {
            Uh10Cons(v7, v8) -> {
                let v9 = spiral_wrap_unsigned(v1, 64)
                let #(v10, v11, v12) = uniform_69(v9, v4, v5)
                let v13 = spiral_wrap_signed(v10, 32)
                let #(v15, v16, v17) = uniform_69(1000, v11, v12)
                let v18 = spiral_wrap_signed(v15, 32)
                let v19 = v18 <= v0
                let v20 =
                    case v19 {
                        True -> 2
                        False -> 1
                    }
                let v22 = method131(v20, v6, v13, v7, 0)
                let v23 = method132(v22, v3)
                let v24 = spiral_wrap_signed(v6 + 1, 32)
                method130(v0, v1, v8, v23, v16, v17, v24)
            }
            _ -> {
                let #(v29, v30, v31, v32) =
                    case v2  {
                        Uh10Nil -> #(v3, v4, v5, v6)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v29, v30, v31, v32)
            }
        }
    #(v33, v34, v35, v36)
}

pub fn halved_keyed_134(v0: Uh16) -> #(Uh16, Uh16) {
    case v0  {
        Uh16Cons(v1, v2, v3, v4) -> {
            case v4  {
                Uh16Cons(v5, v6, v7, v8) -> {
                    let #(v9, v10) = halved_keyed_134(v8)
                    let v11 = Uh16Cons(v1, v2, v3, v9)
                    let v12 = Uh16Cons(v5, v6, v7, v10)
                    #(v11, v12)
                }
                _ -> {
                    #(v0, Uh16Nil)
                }
            }
        }
        _ -> {
            #(v0, Uh16Nil)
        }
    }
}

pub fn merged_keyed_135(v0: Uh16, v1: Uh16) -> Uh16 {
    case v0  {
        Uh16Nil -> v1
        _ -> {
            case v1  {
                Uh16Nil -> v0
                _ -> {
                    case v0  {
                        Uh16Cons(v2, v3, v4, v5) -> {
                            case v1  {
                                Uh16Cons(v6, v7, v8, v9) -> {
                                    let v10 = v2 < v6
                                    let v14 =
                                        case v10 {
                                            True -> True
                                            False -> {
                                                let v11 = v2 == v6
                                                case v11 {
                                                    True -> {
                                                        v3 <= v7
                                                    }
                                                    False -> False
                                                }
                                            }
                                        }
                                    case v14 {
                                        True -> {
                                            let v15 = merged_keyed_135(v5, v1)
                                            Uh16Cons(v2, v3, v4, v15)
                                        }
                                        False -> {
                                            let v17 = merged_keyed_135(v0, v9)
                                            Uh16Cons(v6, v7, v8, v17)
                                        }
                                    }
                                }
                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                            }
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                }
            }
        }
    }
}

pub fn sorted_keyed_133(v0: Uh16) -> Uh16 {
    case v0  {
        Uh16Cons(v1, v2, v3, v4) -> {
            case v4  {
                Uh16Nil -> v0
                _ -> {
                    let #(v5, v6) = halved_keyed_134(v0)
                    let v7 = sorted_keyed_133(v5)
                    let v8 = sorted_keyed_133(v6)
                    merged_keyed_135(v7, v8)
                }
            }
        }
        Uh16Nil -> v0
    }
}

pub fn method136(v0: Uh16, v1: Uh15) -> Uh15 {
    case v0  {
        Uh16Cons(v2, v3, v4, v5) -> {
            let v6 = method136(v5, v1)
            Uh15Cons(v3, v4, v6)
        }
        Uh16Nil -> v1
    }
}

pub fn deliveries_129(v0: Uh10, v1: Int, v2: Int, v3: Int) -> Uh15 {
    let v4 = spiral_wrap_signed(v1 * 31, 32)
    let v5 = spiral_wrap_signed(v4 + 5, 32)
    let v6 = spiral_wrap_signed(v1 * 17, 32)
    let v7 = spiral_wrap_signed(v6 + 11, 32)
    let v8 = spiral_wrap_unsigned(v1, 64)
    let v9 = spiral_wrap_unsigned(v5, 64)
    let v10 = spiral_wrap_unsigned(v7, 64)
    let #(v11, v12) = seeded_66(v8, v9, v10)
    let #(v15, _v16, _v17, _v18) = method130(v2, v3, v0, Uh16Nil, v11, v12, 0)
    let v19 = sorted_keyed_133(v15)
    method136(v19, Uh15Nil)
}

pub fn rescheduled_121(v0: String, v1: Int, v2: Int, v3: Int) -> String {
    let v4 = decoded_stream_122(v0)
    case v4  {
        Us21Error(v10) -> v10
        Us21Ok(v5) -> {
            let v7 = method128(v5, Uh10Nil)
            let v8 = deliveries_129(v7, v1, v2, v3)
            stream_115(v8)
        }
    }
}

pub fn closure13(capt: Nil) -> fn(#(String, Int, Int, Int)) -> String {
    fn (dom) {
        let #(v0, v1, v2, v3) = dom
        rescheduled_121(v0, v1, v2, v3)
    }
}

pub fn closure14(capt: Nil) -> fn(String) -> String {
    fn (v0) {
        break_source_82(v0)
    }
}

pub fn closure18(capt: #(String, Int)) -> fn(String) -> Uh3 {
    fn (v2) {
        let #(v0, v1) = capt
        let v3 = xsim_split.split_cell_joined(v0, v1, v2)
        let v4 = v3 == ""
        case v4 {
            True -> Uh3Nil
            False -> {
                let v6 = unicode_erlang_characters_to_binary([0])
                split_list_2(v6, v3)
            }
        }
    }
}

pub fn closure17(capt: #(String)) -> fn(Int) -> fn(String) -> Uh3 {
    fn (v1) {
        let #(v0) = capt
        closure18(#(v0, v1))
    }
}

pub fn closure16(capt: Nil) -> fn(String) -> fn(Int) -> fn(String) -> Uh3 {
    fn (v0) {
        closure17(#(v0))
    }
}

pub fn method141(v0: Uh18, v1: Uh18) -> Uh18 {
    case v0  {
        Uh18Cons(v2, v3, v4, v5) -> {
            let v6 = method141(v5, v1)
            Uh18Cons(v2, v3, v4, v6)
        }
        Uh18Nil -> v1
    }
}

pub fn method140(v0: Int, v1: Uh3, v2: Uh18, v3: Int) -> #(Uh18, Int) {
    case v1  {
        Uh3Cons(v4, v5) -> {
            let v7 = Uh18Cons(v3, v0, v4, Uh18Nil)
            let v8 = method141(v2, v7)
            let v9 = spiral_wrap_signed(v3 + 1, 32)
            method140(v0, v5, v8, v9)
        }
        Uh3Nil -> #(v2, v3)
    }
}

pub fn method142(v0: String, v1: Us2, v2: String, v3: Uh18, v4: Uh10) -> Uh10 {
    case v3  {
        Uh18Cons(v5, v6, v7, v8) -> {
            let v9 = method142(v0, v1, v2, v8, v4)
            let v10 = Us17Framed(v0, v1, v5, v6, v7)
            let v11 = Us16Content(v10)
            Uh10Cons(v11, v9)
        }
        Uh18Nil -> v4
    }
}

pub fn method143(v0: Uh10, v1: Uh10) -> Uh10 {
    case v0  {
        Uh10Cons(v2, v3) -> {
            let v4 = Uh10Cons(v2, v1)
            method143(v3, v4)
        }
        Uh10Nil -> v1
    }
}

pub fn method144(v0: String, v1: Uh17) -> Us24 {
    case v1  {
        Uh17Cons(v3, v4, v5) -> {
            let v6 = v3 == v0
            case v6 {
                True -> Us24Some(v3, v4)
                False -> method144(v0, v5)
            }
        }
        Uh17Nil -> Us24None
    }
}

pub fn method145(v0: Int, v1: String, v2: String, v3: Uh18, v4: Uh10) -> Uh10 {
    case v3  {
        Uh18Cons(v5, v6, v7, v8) -> {
            let v9 = method145(v0, v1, v2, v8, v4)
            let v10 = Us18FrameEdited(v1, v0, v5, v6, v7)
            let v11 = Us16Revision(v10)
            Uh10Cons(v11, v9)
        }
        Uh18Nil -> v4
    }
}
