import gleam/bit_array
import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Uh5, type Us9, type Uh9, type Us12, type Uh10, type Uh15, type Us17, type Us18, type Uh16, type Uh18, Global, Uh10Cons, Uh10Nil, Uh15Cons, Uh15Nil, Uh16Cons, Uh16Nil, Uh18Cons, Uh18Nil, Uh3Cons, Uh3Nil, Uh5Nil, Uh7Nil, Uh8Nil, Us0Text, Us12Content, Us12Reaction, Us12Revision, Us13Framed, Us13Posted, Us14Deleted, Us14Edited, Us14FrameEdited, Us15Liked, Us15Unliked, Us17Error, Us17Ok, Us18Error, Us18Ok, Us19None, Us19Some, Us1None, Us1Some, Us9None, Us9Some}
import xsim_frames/part1.{count_at_13, fields_from_4, spiral_binary_split_first, spiral_string_length, spiral_string_slice, spiral_wrap_signed, spiral_wrap_unsigned, split_on_2, text_at_10, value_of_11, x_binary_split, x_light, x_spaced}
import xsim_frames/part2.{delimited_34, method37}
import xsim_frames/part3.{listed_pieces_52, method46, method47, method48, method49, method53, seeded_59, uniform_62}
import xsim_frames/part4.{break_source_75}
import xsim_frames/part5.{from_cells_56, from_corpus_54, method106, method107, stream_108}

pub fn raw_scenario_105(_v0: Uh9, v1: Uh10, v2: Uh3) -> #(String, Uh3) {
    let v3 = Uh15Nil
    let v4 = 0
    let #(v5, _v6) = method106(v1, v3, v4)
    let v7 = Uh15Nil
    let v8 = method107(v5, v7)
    let v9 = stream_108(v8)
    #(v9, v2)
}

pub fn closure4(capt: Nil) -> fn(#(String, Int, Int, Int, Int, Int, String, Bool, Int, Int)) -> #(String, String) {
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
        let v18 = method46(v16, v17)
        let v19 = Uh7Nil
        let v20 = method47(v18, v19)
        let v21 = False
        let v22 = case string.utf_codepoint(1) { Ok(c) -> string.from_utf_codepoints([c]) Error(_) -> "" }
        let v23 = x_binary_split(v0, v22, [Global])
        let v24 = Uh3Nil
        let v25 = listed_pieces_52(v23, v24)
        let v26 = case string.utf_codepoint(0) { Ok(c) -> string.from_utf_codepoints([c]) Error(_) -> "" }
        let v27 = Uh8Nil
        let v28 = method53(v26, v25, v27)
        let #(v29, v30, v31) = from_corpus_54(v1, v2, v3, v4, v5, v20, v21, v28)
        let #(v32, v33) = raw_scenario_105(v29, v30, v31)
        let v34 = case string.utf_codepoint(0) { Ok(c) -> string.from_utf_codepoints([c]) Error(_) -> "" }
        let v35 = delimited_34(v34, v33)
        #(v32, v35)
    }
}

pub fn closure6(capt: Nil) -> fn(#(String, Int, Int, Int, Int, Int, String, Bool, Int, Int)) -> #(String, String) {
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
        let v18 = method46(v16, v17)
        let v19 = Uh7Nil
        let v20 = method47(v18, v19)
        let v21 = False
        let v22 = ""
        let v23 = case string.utf_codepoint(0) { Ok(c) -> string.from_utf_codepoints([c]) Error(_) -> "" }
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
        let #(v28, v29, v30) = from_cells_56(v1, v2, v3, v4, v5, v20, v21, v22, v27)
        let #(v31, v32) = raw_scenario_105(v28, v29, v30)
        let v33 = case string.utf_codepoint(0) { Ok(c) -> string.from_utf_codepoints([c]) Error(_) -> "" }
        let v34 = delimited_34(v33, v32)
        #(v31, v34)
    }
}

pub fn method115(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method115(v3, v1)
            let v5 = spiral_string_length(v2)
            let v6 = 0
            let v7 = method48(v2, v5, v6)
            let v8 = spiral_wrap_signed(v5 - 1, 32)
            let v9 = spiral_string_slice(v2, v7, v8)
            let v10 = spiral_string_length(v9)
            let v11 = method49(v9, v10)
            let v12 = spiral_string_slice(v9, 0, v11)
            Uh3Cons(v12, v4)
        }
        Uh3Nil -> {
            v1
        }
    }
}

pub fn method116(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method116(v3, v1)
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

pub fn parent_at_119(v0: Uh5) -> Us9 {
    let v1 = "parent"
    let v2 = value_of_11(v1, v0)
    case v2  {
        Us0Text(v3) -> {
            Us9Some(v3)
        }
        _ -> {
            Us9None
        }
    }
}

pub fn decoded_118(v0: String) -> Us18 {
    let v1 = spiral_string_length(v0)
    let v2 = 0 > v1
    let v7 =
        case v2 {
            True -> {
                False
            }
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
                fields_from_4(v0, v8, v9)
            }
            False -> {
                Us1None
            }
        }
    case v12  {
        Us1None -> {
            let v102 = "not a compact xsim-events line: "
            let v103 = v102 <> v0 
            Us18Error(v103)
        }
        Us1Some(v13) -> {
            let v14 = "kind"
            let v15 = text_at_10(v14, v13)
            let v16 = v15 == "post"
            let v89 =
                case v16 {
                    True -> {
                        let v17 = "post"
                        let v18 = text_at_10(v17, v13)
                        let v19 = parent_at_119(v13)
                        let v20 = "source"
                        let v21 = text_at_10(v20, v13)
                        let v22 = Us13Posted(v18, v19, v21)
                        let v23 = Us12Content(v22)
                        Us19Some(v23)
                    }
                    False -> {
                        let v25 = v15 == "frame"
                        case v25 {
                            True -> {
                                let v26 = "post"
                                let v27 = text_at_10(v26, v13)
                                let v28 = parent_at_119(v13)
                                let v29 = "k"
                                let v30 = count_at_13(v29, v13)
                                let v31 = "n"
                                let v32 = count_at_13(v31, v13)
                                let v33 = "body"
                                let v34 = text_at_10(v33, v13)
                                let v35 = Us13Framed(v27, v28, v30, v32, v34)
                                let v36 = Us12Content(v35)
                                Us19Some(v36)
                            }
                            False -> {
                                let v38 = v15 == "edit"
                                case v38 {
                                    True -> {
                                        let v39 = "post"
                                        let v40 = text_at_10(v39, v13)
                                        let v41 = "source"
                                        let v42 = text_at_10(v41, v13)
                                        let v43 = Us14Edited(v40, v42)
                                        let v44 = Us12Revision(v43)
                                        Us19Some(v44)
                                    }
                                    False -> {
                                        let v46 = v15 == "edit_frame"
                                        case v46 {
                                            True -> {
                                                let v47 = "post"
                                                let v48 = text_at_10(v47, v13)
                                                let v49 = "rev"
                                                let v50 = count_at_13(v49, v13)
                                                let v51 = "k"
                                                let v52 = count_at_13(v51, v13)
                                                let v53 = "n"
                                                let v54 = count_at_13(v53, v13)
                                                let v55 = "body"
                                                let v56 = text_at_10(v55, v13)
                                                let v57 = Us14FrameEdited(v48, v50, v52, v54, v56)
                                                let v58 = Us12Revision(v57)
                                                Us19Some(v58)
                                            }
                                            False -> {
                                                let v60 = v15 == "delete"
                                                case v60 {
                                                    True -> {
                                                        let v61 = "post"
                                                        let v62 = text_at_10(v61, v13)
                                                        let v63 = Us14Deleted(v62)
                                                        let v64 = Us12Revision(v63)
                                                        Us19Some(v64)
                                                    }
                                                    False -> {
                                                        let v66 = v15 == "like"
                                                        case v66 {
                                                            True -> {
                                                                let v67 = "post"
                                                                let v68 = text_at_10(v67, v13)
                                                                let v69 = "user"
                                                                let v70 = text_at_10(v69, v13)
                                                                let v71 = Us15Liked(v68, v70)
                                                                let v72 = Us12Reaction(v71)
                                                                Us19Some(v72)
                                                            }
                                                            False -> {
                                                                let v74 = v15 == "unlike"
                                                                case v74 {
                                                                    True -> {
                                                                        let v75 = "post"
                                                                        let v76 = text_at_10(v75, v13)
                                                                        let v77 = "user"
                                                                        let v78 = text_at_10(v77, v13)
                                                                        let v79 = Us15Unliked(v76, v78)
                                                                        let v80 = Us12Reaction(v79)
                                                                        Us19Some(v80)
                                                                    }
                                                                    False -> {
                                                                        Us19None
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
            case v89  {
                Us19None -> {
                    let v94 = text_at_10(v14, v13)
                    let v95 = "unknown event kind '"
                    let v96 = v95 <> v94 
                    let v97 = "'"
                    let v98 = v96 <> v97 
                    Us18Error(v98)
                }
                Us19Some(v90) -> {
                    let v91 = "at"
                    let v92 = count_at_13(v91, v13)
                    Us18Ok(v92, v90)
                }
            }
        }
    }
}

pub fn all_decoded_117(v0: Uh3, v1: Uh15) -> Us17 {
    case v0  {
        Uh3Cons(v5, v6) -> {
            let v7 = decoded_118(v5)
            case v7  {
                Us18Error(v12) -> {
                    Us17Error(v12)
                }
                Us18Ok(v8, v9) -> {
                    let v10 = Uh15Cons(v8, v9, v1)
                    all_decoded_117(v6, v10)
                }
            }
        }
        Uh3Nil -> {
            let v2 = Uh15Nil
            let v3 = method107(v1, v2)
            Us17Ok(v3)
        }
    }
}

pub fn decoded_stream_114(v0: String) -> Us17 {
    let v1 = v0 == ""
    let v7 =
        case v1 {
            True -> {
                Uh3Nil
            }
            False -> {
                let v3 = "\n"
                let v4 = x_binary_split(v0, v3, [Global])
                let v5 = Uh3Nil
                listed_pieces_52(v4, v5)
            }
        }
    let v8 = Uh3Nil
    let v9 = method115(v7, v8)
    let v10 = Uh3Nil
    let v11 = method116(v9, v10)
    case v11  {
        Uh3Cons(v12, v13) -> {
            let v14 = spiral_string_length(v12)
            let v15 = 0 > v14
            let v20 =
                case v15 {
                    True -> {
                        False
                    }
                    False -> {
                        let v16 = spiral_wrap_signed(v14 - 1, 32)
                        let v17 = spiral_string_slice(v12, 0, v16)
                        let v18 = "{"
                        let v19 = v17 |> string.starts_with(v18)
                        v19
                    }
                }
            let v25 =
                case v20 {
                    True -> {
                        let v21 = 1
                        let v22 = Uh5Nil
                        fields_from_4(v12, v21, v22)
                    }
                    False -> {
                        Us1None
                    }
                }
            let v35 =
                case v25  {
                    Us1None -> {
                        False
                    }
                    Us1Some(v26) -> {
                        let v27 = "format"
                        let v28 = text_at_10(v27, v26)
                        let v29 = v28 == "xsim-events"
                        case v29 {
                            True -> {
                                let v30 = "version"
                                let v31 = count_at_13(v30, v26)
                                let v32 = v31 == 1
                                v32
                            }
                            False -> {
                                False
                            }
                        }
                    }
                }
            case v35 {
                True -> {
                    let v36 = Uh15Nil
                    all_decoded_117(v13, v36)
                }
                False -> {
                    let v38 = "not an xsim-events v1 stream"
                    Us17Error(v38)
                }
            }
        }
        _ -> {
            let v41 = "not an xsim-events v1 stream"
            Us17Error(v41)
        }
    }
}

pub fn method120(v0: Uh15, v1: Uh10) -> Uh10 {
    case v0  {
        Uh15Cons(v2, v3, v4) -> {
            let v5 = method120(v4, v1)
            Uh10Cons(v3, v5)
        }
        Uh15Nil -> {
            v1
        }
    }
}

pub fn method123(v0: Int, v1: Int, v2: Int, v3: Us12, v4: Int) -> Uh16 {
    let v5 = v4 < v0
    case v5 {
        True -> {
            let v6 = spiral_wrap_signed(v1 + v2, 32)
            let v7 = spiral_wrap_signed(v6 + v4, 32)
            let v8 = spiral_wrap_signed(v7 + 1, 32)
            let v9 = spiral_wrap_signed(v4 + 1, 32)
            let v10 = method123(v0, v1, v2, v3, v9)
            Uh16Cons(v8, v1, v3, v10)
        }
        False -> {
            Uh16Nil
        }
    }
}

pub fn method124(v0: Uh16, v1: Uh16) -> Uh16 {
    case v0  {
        Uh16Cons(v2, v3, v4, v5) -> {
            let v6 = method124(v5, v1)
            Uh16Cons(v2, v3, v4, v6)
        }
        Uh16Nil -> {
            v1
        }
    }
}

pub fn method122(v0: Int, v1: Int, v2: Uh10, v3: Uh16, v4: Int, v5: Int, v6: Int) -> #(Uh16, Int, Int, Int) {
    let #(v33, v34, v35, v36) =
        case v2  {
            Uh10Cons(v7, v8) -> {
                let v9 = spiral_wrap_unsigned(v1, 64)
                let #(v10, v11, v12) = uniform_62(v9, v4, v5)
                let v13 = spiral_wrap_signed(v10, 32)
                let v14 = 1000
                let #(v15, v16, v17) = uniform_62(v14, v11, v12)
                let v18 = spiral_wrap_signed(v15, 32)
                let v19 = v18 <= v0
                let v20 =
                    case v19 {
                        True -> {
                            2
                        }
                        False -> {
                            1
                        }
                    }
                let v21 = 0
                let v22 = method123(v20, v6, v13, v7, v21)
                let v23 = method124(v22, v3)
                let v24 = spiral_wrap_signed(v6 + 1, 32)
                method122(v0, v1, v8, v23, v16, v17, v24)
            }
            _ -> {
                let #(v29, v30, v31, v32) =
                    case v2  {
                        Uh10Nil -> {
                            #(v3, v4, v5, v6)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v29, v30, v31, v32)
            }
        }
    #(v33, v34, v35, v36)
}

pub fn halved_keyed_126(v0: Uh16) -> #(Uh16, Uh16) {
    case v0  {
        Uh16Cons(v1, v2, v3, v4) -> {
            case v4  {
                Uh16Cons(v5, v6, v7, v8) -> {
                    let #(v9, v10) = halved_keyed_126(v8)
                    let v11 = Uh16Cons(v1, v2, v3, v9)
                    let v12 = Uh16Cons(v5, v6, v7, v10)
                    #(v11, v12)
                }
                _ -> {
                    let v13 = Uh16Nil
                    #(v0, v13)
                }
            }
        }
        _ -> {
            let v16 = Uh16Nil
            #(v0, v16)
        }
    }
}

pub fn merged_keyed_127(v0: Uh16, v1: Uh16) -> Uh16 {
    case v0  {
        Uh16Nil -> {
            v1
        }
        _ -> {
            case v1  {
                Uh16Nil -> {
                    v0
                }
                _ -> {
                    case v0  {
                        Uh16Cons(v2, v3, v4, v5) -> {
                            case v1  {
                                Uh16Cons(v6, v7, v8, v9) -> {
                                    let v10 = v2 < v6
                                    let v14 =
                                        case v10 {
                                            True -> {
                                                True
                                            }
                                            False -> {
                                                let v11 = v2 == v6
                                                case v11 {
                                                    True -> {
                                                        let v12 = v3 <= v7
                                                        v12
                                                    }
                                                    False -> {
                                                        False
                                                    }
                                                }
                                            }
                                        }
                                    case v14 {
                                        True -> {
                                            let v15 = merged_keyed_127(v5, v1)
                                            Uh16Cons(v2, v3, v4, v15)
                                        }
                                        False -> {
                                            let v17 = merged_keyed_127(v0, v9)
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

pub fn sorted_keyed_125(v0: Uh16) -> Uh16 {
    case v0  {
        Uh16Cons(v1, v2, v3, v4) -> {
            case v4  {
                Uh16Nil -> {
                    v0
                }
                _ -> {
                    let #(v5, v6) = halved_keyed_126(v0)
                    let v7 = sorted_keyed_125(v5)
                    let v8 = sorted_keyed_125(v6)
                    merged_keyed_127(v7, v8)
                }
            }
        }
        Uh16Nil -> {
            v0
        }
    }
}

pub fn method128(v0: Uh16, v1: Uh15) -> Uh15 {
    case v0  {
        Uh16Cons(v2, v3, v4, v5) -> {
            let v6 = method128(v5, v1)
            Uh15Cons(v3, v4, v6)
        }
        Uh16Nil -> {
            v1
        }
    }
}

pub fn deliveries_121(v0: Uh10, v1: Int, v2: Int, v3: Int) -> Uh15 {
    let v4 = spiral_wrap_signed(v1 * 31, 32)
    let v5 = spiral_wrap_signed(v4 + 5, 32)
    let v6 = spiral_wrap_signed(v1 * 17, 32)
    let v7 = spiral_wrap_signed(v6 + 11, 32)
    let v8 = spiral_wrap_unsigned(v1, 64)
    let v9 = spiral_wrap_unsigned(v5, 64)
    let v10 = spiral_wrap_unsigned(v7, 64)
    let #(v11, v12) = seeded_59(v8, v9, v10)
    let v13 = Uh16Nil
    let v14 = 0
    let #(v15, _v16, _v17, _v18) = method122(v2, v3, v0, v13, v11, v12, v14)
    let v19 = sorted_keyed_125(v15)
    let v20 = Uh15Nil
    method128(v19, v20)
}

pub fn rescheduled_113(v0: String, v1: Int, v2: Int, v3: Int) -> String {
    let v4 = decoded_stream_114(v0)
    case v4  {
        Us17Error(v10) -> {
            v10
        }
        Us17Ok(v5) -> {
            let v6 = Uh10Nil
            let v7 = method120(v5, v6)
            let v8 = deliveries_121(v7, v1, v2, v3)
            stream_108(v8)
        }
    }
}

pub fn closure7(capt: Nil) -> fn(#(String, Int, Int, Int)) -> String {
    fn (dom) {
        let #(v0, v1, v2, v3) = dom
        rescheduled_113(v0, v1, v2, v3)
    }
}

pub fn closure8(capt: Nil) -> fn(String) -> String {
    fn (v0) {
        break_source_75(v0)
    }
}

pub fn graphemes_from_134(v0: String, v1: Uh3) -> Uh3 {
    let v2 = case string.pop_grapheme(v0) { Ok(pair) -> string.byte_size(pair.0) Error(_) -> 0 }
    let v3 = v2 == 0
    case v3 {
        True -> {
            let v4 = Uh3Nil
            method37(v1, v4)
        }
        False -> {
            let v6 = spiral_string_length(v0)
            let v7 = spiral_wrap_signed(v6 - v2, 32)
            let v8 = spiral_wrap_signed(v2 + v7, 32)
            let v9 = spiral_wrap_signed(v8 - 1, 32)
            let v10 = spiral_string_slice(v0, v2, v9)
            let v11 = spiral_wrap_signed(v2 - 1, 32)
            let v12 = spiral_string_slice(v0, 0, v11)
            let v13 = Uh3Cons(v12, v1)
            graphemes_from_134(v10, v13)
        }
    }
}

pub fn method136(v0: Uh18, v1: Uh18) -> Uh18 {
    case v0  {
        Uh18Cons(v2, v3, v4) -> {
            let v5 = Uh18Cons(v2, v3, v1)
            method136(v4, v5)
        }
        Uh18Nil -> {
            v1
        }
    }
}

pub fn defused_135(v0: String, v1: Uh3, v2: Uh18) -> Uh18 {
    case v1  {
        Uh3Cons(v5, v6) -> {
            let v11 =
                case v6  {
                    Uh3Cons(v7, v8) -> {
                        v7
                    }
                    Uh3Nil -> {
                        let v9 = ""
                        v9
                    }
                }
            let v12 = v5 == "."
            let v21 =
                case v12 {
                    True -> {
                        let v13 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                        let v14 = "0123456789_-"
                        let v15 = v13 <> v14 
                        let v16 = spiral_string_length(v0)
                        let v17 = v16 == 1
                        case v17 {
                            True -> {
                                let v18 = case v0 { "" -> 0 _ -> case spiral_binary_split_first(v15, v0) { [spiral_head, _] -> bit_array.byte_size(bit_array.from_string(spiral_head)) _ -> -1 } }
                                let v19 = v18 >= 0
                                v19
                            }
                            False -> {
                                False
                            }
                        }
                    }
                    False -> {
                        False
                    }
                }
            let v28 =
                case v21 {
                    True -> {
                        let v22 = spiral_string_length(v11)
                        let v23 = v22 == 1
                        case v23 {
                            True -> {
                                let v24 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                let v25 = case v11 { "" -> 0 _ -> case spiral_binary_split_first(v24, v11) { [spiral_head, _] -> bit_array.byte_size(bit_array.from_string(spiral_head)) _ -> -1 } }
                                let v26 = v25 >= 0
                                v26
                            }
                            False -> {
                                False
                            }
                        }
                    }
                    False -> {
                        False
                    }
                }
            let #(v36, v37) =
                case v28 {
                    True -> {
                        let v29 = case string.utf_codepoint(8203) { Ok(c) -> string.from_utf_codepoints([c]) Error(_) -> "" }
                        let v30 = "."
                        let v31 = v29 <> v30 
                        let v32 = case string.utf_codepoint(8203) { Ok(c) -> string.from_utf_codepoints([c]) Error(_) -> "" }
                        let v33 = v32 <> v30 
                        let v34 = string.to_utf_codepoints(v33) |> list.fold(0, fn(sum, c) { sum + case x_light(string.utf_codepoint_to_int(c)) { True -> 1 False -> 2 } })
                        #(v31, v34)
                    }
                    False -> {
                        let v35 = string.to_utf_codepoints(v5) |> list.fold(0, fn(sum, c) { sum + case x_light(string.utf_codepoint_to_int(c)) { True -> 1 False -> 2 } })
                        #(v5, v35)
                    }
                }
            let v38 = Uh18Cons(v36, v37, v2)
            defused_135(v5, v6, v38)
        }
        Uh3Nil -> {
            let v3 = Uh18Nil
            method136(v2, v3)
        }
    }
}

pub fn units_of_133(v0: String) -> Uh18 {
    let v1 = ""
    let v2 = Uh3Nil
    let v3 = graphemes_from_134(v0, v2)
    let v4 = Uh18Nil
    defused_135(v1, v3, v4)
}

pub fn closure10(capt: Nil) -> fn(#(String, Int)) -> Bool {
    fn (dom) {
        let #(v0, _v1) = dom
        let v2 = string.to_utf_codepoints(v0) |> list.all(fn(c) { x_spaced(string.utf_codepoint_to_int(c)) })
        let v3 = v2 == False
        v3
    }
}

pub fn taken_while_140(v0: fn(#(String, Int)) -> Bool, v1: Uh18, v2: Uh18) -> #(Uh18, Uh18) {
    case v1  {
        Uh18Cons(v3, v4, v5) -> {
            let v6 = v0( #(v3, v4)  )
            case v6 {
                True -> {
                    let v7 = Uh18Cons(v3, v4, v2)
                    taken_while_140(v0, v5, v7)
                }
                False -> {
                    let v10 = Uh18Nil
                    let v11 = method136(v2, v10)
                    #(v11, v1)
                }
            }
        }
        _ -> {
            let v14 = Uh18Nil
            let v15 = method136(v2, v14)
            #(v15, v1)
        }
    }
}

pub fn closure11(capt: Nil) -> fn(#(String, Int)) -> Bool {
    fn (dom) {
        let #(v0, _v1) = dom
        let v2 = string.to_utf_codepoints(v0) |> list.all(fn(c) { x_spaced(string.utf_codepoint_to_int(c)) })
        v2
    }
}

pub fn method141(v0: Uh18, v1: Int) -> Int {
    case v0  {
        Uh18Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + 1, 32)
            method141(v4, v5)
        }
        Uh18Nil -> {
            v1
        }
    }
}

pub fn method142(v0: Uh18, v1: Uh18) -> Uh18 {
    case v0  {
        Uh18Cons(v2, v3, v4) -> {
            let v5 = method142(v4, v1)
            Uh18Cons(v2, v3, v5)
        }
        Uh18Nil -> {
            v1
        }
    }
}

pub fn split_point_139(v0: Uh18) -> #(Uh18, Uh18) {
    let v1 = closure10(Nil)
    let v2 = Uh18Nil
    let #(v3, v4) = taken_while_140(v1, v0, v2)
    let v5 = closure11(Nil)
    let v6 = Uh18Nil
    let #(v7, v8) = taken_while_140(v5, v4, v6)
    let v9 =
        case v8  {
            Uh18Nil -> {
                False
            }
            _ -> {
                True
            }
        }
    let v16 =
        case v9 {
            True -> {
                let v10 = 0
                let v11 = method141(v3, v10)
                let v12 = 0
                let v13 = method141(v7, v12)
                let v14 = spiral_wrap_signed(v11 + v13, 32)
                let v15 = v14 <= 60
                v15
            }
            False -> {
                False
            }
        }
    case v16 {
        True -> {
            let v17 = method142(v3, v7)
            #(v17, v8)
        }
        False -> {
            let v18 = Uh18Nil
            let #(v19, v20) = taken_while_140(v5, v0, v18)
            let v21 =
                case v20  {
                    Uh18Nil -> {
                        False
                    }
                    _ -> {
                        True
                    }
                }
            case v21 {
                True -> {
                    #(v19, v20)
                }
                False -> {
                    let v22 = Uh18Nil
                    #(v22, v0)
                }
            }
        }
    }
}

pub fn method143(v0: Uh18, v1: Uh3) -> Uh3 {
    case v0  {
        Uh18Cons(v2, v3, v4) -> {
            let v5 = method143(v4, v1)
            Uh3Cons(v2, v5)
        }
        Uh18Nil -> {
            v1
        }
    }
}
