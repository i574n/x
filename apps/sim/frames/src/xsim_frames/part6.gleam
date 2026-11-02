import gleam/string
import xsim_split
import xsim_frames/types.{type Uh3, type Us2, type Uh7, type Uh8, type Us16, type Uh10, type Uh15, type Us21, type Uh16, type Uh17, type Uh18, type Us24, type Uh19, type Uh20, type Uh21, Uh10Cons, Uh10Nil, Uh15Cons, Uh15Nil, Uh16Cons, Uh16Nil, Uh17Cons, Uh17Nil, Uh18Cons, Uh18Nil, Uh19Cons, Uh19Nil, Uh20Cons, Uh20Nil, Uh21Cons, Uh3Cons, Uh3Nil, Uh5Nil, Uh7Nil, Uh8Nil, Us16Content, Us16Reaction, Us16Revision, Us17Framed, Us17Posted, Us18Deleted, Us18Edited, Us18FrameEdited, Us19Liked, Us19Unliked, Us1None, Us1Some, Us21Error, Us21Ok, Us24None, Us24Some, Us25None, Us25Some, Us2None, Us2Some}
import xsim_frames/part1.{count_at_16, fields_from_6, method4, spiral_string_length, spiral_string_slice, spiral_wrap_signed, spiral_wrap_unsigned, split_list_2, text_at_13, unicode_erlang_characters_to_binary}
import xsim_frames/part2.{delimited_21, method18, method20}
import xsim_frames/part3.{method51, method52, method54, method55, method60, method79, seeded_66, uniform_69}
import xsim_frames/part4.{break_source_82, method105, method96}
import xsim_frames/part5.{all_decoded_125, from_corpus_61, method123, method124, stream_115}

pub fn decoded_stream_122(v0: String) -> Us21 {
    let v1 = v0 == ""
    let v5 =
        case v1 {
            True -> Uh3Nil
            False -> {
                let v3 = "\n"
                split_list_2(v3, v0)
            }
        }
    let v6 = Uh3Nil
    let v7 = method123(v5, v6)
    let v8 = Uh3Nil
    let v9 = method124(v7, v8)
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
                        fields_from_6(v10, v19, v20)
                    }
                    False -> Us1None
                }
            let v33 =
                case v23  {
                    Us1None -> False
                    Us1Some(v24) -> {
                        let v25 = "format"
                        let v26 = text_at_13(v25, v24)
                        let v27 = v26 == "xsim-events"
                        case v27 {
                            True -> {
                                let v28 = "version"
                                let v29 = count_at_16(v28, v24)
                                let v30 = v29 == 1
                                v30
                            }
                            False -> False
                        }
                    }
                }
            case v33 {
                True -> {
                    let v34 = Uh15Nil
                    all_decoded_125(v11, v34)
                }
                False -> {
                    let v36 = "not an xsim-events v1 stream"
                    Us21Error(v36)
                }
            }
        }
        _ -> {
            let v39 = "not an xsim-events v1 stream"
            Us21Error(v39)
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
                let v14 = 1000
                let #(v15, v16, v17) = uniform_69(v14, v11, v12)
                let v18 = spiral_wrap_signed(v15, 32)
                let v19 = v18 <= v0
                let v20 =
                    case v19 {
                        True -> 2
                        False -> 1
                    }
                let v21 = 0
                let v22 = method131(v20, v6, v13, v7, v21)
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
                                                        let v12 = v3 <= v7
                                                        v12
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
    let v13 = Uh16Nil
    let v14 = 0
    let #(v15, _v16, _v17, _v18) = method130(v2, v3, v0, v13, v11, v12, v14)
    let v19 = sorted_keyed_133(v15)
    let v20 = Uh15Nil
    method136(v19, v20)
}

pub fn rescheduled_121(v0: String, v1: Int, v2: Int, v3: Int) -> String {
    let v4 = decoded_stream_122(v0)
    case v4  {
        Us21Error(v10) -> v10
        Us21Ok(v5) -> {
            let v6 = Uh10Nil
            let v7 = method128(v5, v6)
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
            let v6 = Uh18Nil
            let v7 = Uh18Cons(v3, v0, v4, v6)
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

pub fn method139(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: Int, v2: Uh10, v3: Uh10, v4: Uh17) -> #(Uh10, Uh17) {
    let #(v68, v69) =
        case v2  {
            Uh10Cons(v5, v6) -> {
                let #(v62, v63) =
                    case v5  {
                        Us16Content(v7) -> {
                            case v7  {
                                Us17Posted(v8, v9, v10) -> {
                                    let v11 = v0(v8)
                                    let v12 = v11(v1)
                                    let v13 = v12(v10)
                                    let v23 =
                                        case v13  {
                                            Uh3Nil -> {
                                                let v14 = ""
                                                let v15 = Uh18Nil
                                                Uh18Cons(1, 1, v14, v15)
                                            }
                                            _ -> {
                                                let v17 = 0
                                                let v18 = method20(v13, v17)
                                                let v19 = Uh18Nil
                                                let v20 = 1
                                                let #(v21, _v22) = method140(v18, v13, v19, v20)
                                                v21
                                            }
                                        }
                                    let v24 = Uh10Nil
                                    let v25 = method142(v8, v9, v10, v23, v24)
                                    let v26 = method143(v25, v3)
                                    #(v26, v4)
                                }
                                _ -> {
                                    let v27 = Uh10Cons(v5, v3)
                                    #(v27, v4)
                                }
                            }
                        }
                        _ -> {
                            let #(v60, v61) =
                                case v5  {
                                    Us16Revision(v30) -> {
                                        case v30  {
                                            Us18Edited(v31, v32) -> {
                                                let v33 = method144(v31, v4)
                                                let v37 =
                                                    case v33  {
                                                        Us24None -> 0
                                                        Us24Some(v34, v35) -> v35
                                                    }
                                                let v38 = spiral_wrap_signed(v37 + 1, 32)
                                                let v39 = v0(v31)
                                                let v40 = v39(v1)
                                                let v41 = v40(v32)
                                                let v51 =
                                                    case v41  {
                                                        Uh3Nil -> {
                                                            let v42 = ""
                                                            let v43 = Uh18Nil
                                                            Uh18Cons(1, 1, v42, v43)
                                                        }
                                                        _ -> {
                                                            let v45 = 0
                                                            let v46 = method20(v41, v45)
                                                            let v47 = Uh18Nil
                                                            let v48 = 1
                                                            let #(v49, _v50) = method140(v46, v41, v47, v48)
                                                            v49
                                                        }
                                                    }
                                                let v52 = Uh10Nil
                                                let v53 = method145(v38, v31, v32, v51, v52)
                                                let v54 = method143(v53, v3)
                                                let v55 = Uh17Cons(v31, v38, v4)
                                                #(v54, v55)
                                            }
                                            _ -> {
                                                let v56 = Uh10Cons(v5, v3)
                                                #(v56, v4)
                                            }
                                        }
                                    }
                                    _ -> {
                                        let v59 = Uh10Cons(v5, v3)
                                        #(v59, v4)
                                    }
                                }
                            #(v60, v61)
                        }
                    }
                method139(v0, v1, v6, v62, v63)
            }
            _ -> {
                let #(v66, v67) =
                    case v2  {
                        Uh10Nil -> #(v3, v4)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v66, v67)
            }
        }
    #(v68, v69)
}

pub fn exploded_138(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: Int, v2: Uh10) -> Uh10 {
    let v3 = Uh10Nil
    let v4 = Uh17Nil
    let #(v5, _v6) = method139(v0, v1, v2, v3, v4)
    let v7 = Uh10Nil
    method105(v5, v7)
}

pub fn corpus_run_137(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh7, v6: Bool, v7: Bool, v8: Int, v9: Int, v10: fn(String) -> fn(Int) -> fn(String) -> Uh3, v11: Uh8) -> #(String, Int, Int, Uh3) {
    let #(v12, v13, v14) = from_corpus_61(v0, v1, v2, v3, v4, v5, v6, v11)
    let v17 =
        case v7 {
            True -> {
                let v15 = 280
                exploded_138(v10, v15, v13)
            }
            False -> v13
        }
    let v18 = 6
    let v19 = deliveries_129(v17, v8, v9, v18)
    let v20 = stream_115(v19)
    let v21 = 0
    let v22 = method79(v12, v21)
    let v23 = 0
    let v24 = method96(v17, v23)
    #(v20, v22, v24, v14)
}

pub fn closure15(capt: Nil) -> fn(#(String, Int, Int, Int, Int, Int, String, Bool, Int, Int)) -> #(String, Int, Int, String) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9) = dom
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
        let v22 = closure16(Nil)
        let v23 = unicode_erlang_characters_to_binary([1])
        let v24 = split_list_2(v23, v0)
        let v25 = unicode_erlang_characters_to_binary([0])
        let v26 = Uh8Nil
        let v27 = method60(v25, v24, v26)
        let #(v28, v29, v30, v31) = corpus_run_137(v1, v2, v3, v4, v5, v20, v21, v7, v8, v9, v22, v27)
        let v32 = unicode_erlang_characters_to_binary([0])
        let v33 = delimited_21(v32, v31)
        #(v28, v29, v30, v33)
    }
}

pub fn method149(v0: Uh19, v1: Uh19) -> Uh19 {
    case v0  {
        Uh19Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method149(v6, v1)
            Uh19Cons(v2, v3, v4, v5, v7)
        }
        Uh19Nil -> v1
    }
}

pub fn method150(v0: String, v1: String, v2: Uh19, v3: Uh19) -> Uh19 {
    case v2  {
        Uh19Cons(v4, v5, v6, v7, v8) -> {
            let v9 = method150(v0, v1, v8, v3)
            let v10 = v4 == v0
            let #(v22, v23, v24, v25) =
                case v10 {
                    True -> {
                        let v15 =
                            case v6  {
                                Uh3Cons(v11, v12) -> v11
                                Uh3Nil -> {
                                    let v13 = ""
                                    v13
                                }
                            }
                        let v16 = v15 == v1
                        let #(v18, v19, v20, v21) =
                            case v16 {
                                True -> #(v4, v5, v6, v7)
                                False -> {
                                    let v17 = Uh3Cons(v1, v6)
                                    #(v4, v5, v17, v7)
                                }
                            }
                        #(v18, v19, v20, v21)
                    }
                    False -> #(v4, v5, v6, v7)
                }
            Uh19Cons(v22, v23, v24, v25, v9)
        }
        Uh19Nil -> v3
    }
}

pub fn method151(v0: String, v1: Uh19, v2: Uh19) -> Uh19 {
    case v1  {
        Uh19Cons(v3, v4, v5, v6, v7) -> {
            let v8 = method151(v0, v7, v2)
            let v9 = v3 == v0
            let #(v10, v11, v12, v13) =
                case v9 {
                    True -> #(v3, v4, v5, True)
                    False -> #(v3, v4, v5, v6)
                }
            Uh19Cons(v10, v11, v12, v13, v8)
        }
        Uh19Nil -> v2
    }
}

pub fn closure20(capt: #(String)) -> fn(#(String, Uh3)) -> Bool {
    fn (dom) {
        let #(v1, _v2) = dom
        let #(v0) = capt
        let v3 = v1 == v0
        v3
    }
}

pub fn method152(v0: String) -> fn(#(String, Uh3)) -> Bool {
    closure20(#(v0))
}

pub fn method153(v0: String, v1: fn(#(String, Uh3)) -> Bool, v2: Uh20) -> Bool {
    case v2  {
        Uh20Cons(v3, v4, v5) -> {
            let v6 = v1(#(v3, v4))
            case v6 {
                True -> True
                False -> {
                    let v7 = method152(v0)
                    method153(v0, v7, v5)
                }
            }
        }
        Uh20Nil -> False
    }
}

pub fn method154(v0: String, v1: String, v2: Uh20, v3: Uh20) -> Uh20 {
    case v2  {
        Uh20Cons(v4, v5, v6) -> {
            let v7 = method154(v0, v1, v6, v3)
            let v8 = v4 == v0
            let #(v15, v16) =
                case v8 {
                    True -> {
                        let v9 = method51(v1)
                        let v10 = method52(v1, v9, v5)
                        let v14 =
                            case v10 {
                                True -> v5
                                False -> {
                                    let v11 = Uh3Nil
                                    let v12 = Uh3Cons(v1, v11)
                                    method18(v5, v12)
                                }
                            }
                        #(v4, v14)
                    }
                    False -> #(v4, v5)
                }
            Uh20Cons(v15, v16, v7)
        }
        Uh20Nil -> v3
    }
}

pub fn method155(v0: Uh20, v1: Uh20) -> Uh20 {
    case v0  {
        Uh20Cons(v2, v3, v4) -> {
            let v5 = method155(v4, v1)
            Uh20Cons(v2, v3, v5)
        }
        Uh20Nil -> v1
    }
}

pub fn method157(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method157(v0, v4, v2)
            let v6 = v0 != v3
            case v6 {
                True -> Uh3Cons(v3, v5)
                False -> v5
            }
        }
        Uh3Nil -> v2
    }
}

pub fn method156(v0: String, v1: String, v2: Uh20, v3: Uh20) -> Uh20 {
    case v2  {
        Uh20Cons(v4, v5, v6) -> {
            let v7 = method156(v0, v1, v6, v3)
            let v8 = v4 == v0
            let #(v11, v12) =
                case v8 {
                    True -> {
                        let v9 = Uh3Nil
                        let v10 = method157(v1, v5, v9)
                        #(v4, v10)
                    }
                    False -> #(v4, v5)
                }
            Uh20Cons(v11, v12, v7)
        }
        Uh20Nil -> v3
    }
}

pub fn method148(v0: Uh10, v1: Uh19, v2: Uh20) -> #(Uh19, Uh20) {
    let #(v83, v84) =
        case v0  {
            Uh10Cons(v3, v4) -> {
                let #(v77, v78) =
                    case v3  {
                        Us16Content(v5) -> {
                            case v5  {
                                Us17Posted(v6, v7, v8) -> {
                                    let v9 = Uh3Nil
                                    let v10 = Uh3Cons(v8, v9)
                                    let v11 = False
                                    let v12 = Uh19Nil
                                    let v13 = Uh19Cons(v6, v7, v10, v11, v12)
                                    let v14 = method149(v1, v13)
                                    #(v14, v2)
                                }
                                _ -> {
                                    let #(v20, v21) =
                                        case v5  {
                                            Us17Framed(v15, v16, v17, v18, v19) -> #(v1, v2)
                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                        }
                                    #(v20, v21)
                                }
                            }
                        }
                        _ -> {
                            let #(v75, v76) =
                                case v3  {
                                    Us16Revision(v24) -> {
                                        case v24  {
                                            Us18Edited(v25, v26) -> {
                                                let v27 = Uh19Nil
                                                let v28 = method150(v25, v26, v1, v27)
                                                #(v28, v2)
                                            }
                                            _ -> {
                                                let #(v39, v40) =
                                                    case v24  {
                                                        Us18Deleted(v29) -> {
                                                            let v30 = Uh19Nil
                                                            let v31 = method151(v29, v1, v30)
                                                            #(v31, v2)
                                                        }
                                                        _ -> {
                                                            let #(v37, v38) =
                                                                case v24  {
                                                                    Us18FrameEdited(v32, v33, v34, v35, v36) -> #(v1, v2)
                                                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                }
                                                            #(v37, v38)
                                                        }
                                                    }
                                                #(v39, v40)
                                            }
                                        }
                                    }
                                    _ -> {
                                        let #(v73, v74) =
                                            case v3  {
                                                Us16Reaction(v43) -> {
                                                    case v43  {
                                                        Us19Liked(v44, v45) -> {
                                                            let v46 = method152(v44)
                                                            let v47 = method153(v44, v46, v2)
                                                            case v47 {
                                                                True -> {
                                                                    let v48 = Uh20Nil
                                                                    let v49 = method154(v44, v45, v2, v48)
                                                                    #(v1, v49)
                                                                }
                                                                False -> {
                                                                    let v50 = Uh3Nil
                                                                    let v51 = Uh3Cons(v45, v50)
                                                                    let v52 = Uh20Nil
                                                                    let v53 = Uh20Cons(v44, v51, v52)
                                                                    let v54 = method155(v2, v53)
                                                                    #(v1, v54)
                                                                }
                                                            }
                                                        }
                                                        _ -> {
                                                            let #(v69, v70) =
                                                                case v43  {
                                                                    Us19Unliked(v57, v58) -> {
                                                                        let v59 = method152(v57)
                                                                        let v60 = method153(v57, v59, v2)
                                                                        case v60 {
                                                                            True -> {
                                                                                let v61 = Uh20Nil
                                                                                let v62 = method156(v57, v58, v2, v61)
                                                                                #(v1, v62)
                                                                            }
                                                                            False -> {
                                                                                let v63 = Uh3Nil
                                                                                let v64 = Uh20Nil
                                                                                let v65 = Uh20Cons(v57, v63, v64)
                                                                                let v66 = method155(v2, v65)
                                                                                #(v1, v66)
                                                                            }
                                                                        }
                                                                    }
                                                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                }
                                                            #(v69, v70)
                                                        }
                                                    }
                                                }
                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                            }
                                        #(v73, v74)
                                    }
                                }
                            #(v75, v76)
                        }
                    }
                method148(v4, v77, v78)
            }
            _ -> {
                let #(v81, v82) =
                    case v0  {
                        Uh10Nil -> #(v1, v2)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v81, v82)
            }
        }
    #(v83, v84)
}

pub fn final_replay_147(v0: Uh10) -> #(Uh19, Uh20) {
    let v1 = Uh19Nil
    let v2 = Uh20Nil
    let #(v3, v4) = method148(v0, v1, v2)
    #(v3, v4)
}

pub fn method158(v0: Uh19, v1: Uh19) -> Uh19 {
    case v0  {
        Uh19Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method158(v6, v1)
            let v8 = v5 == False
            case v8 {
                True -> Uh19Cons(v2, v3, v4, v5, v7)
                False -> v7
            }
        }
        Uh19Nil -> v1
    }
}

pub fn method159(v0: Uh19, v1: Uh21) -> Uh21 {
    case v0  {
        Uh19Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method159(v6, v1)
            let v12 =
                case v3  {
                    Us2None -> Us25None
                    Us2Some(v8) -> Us25Some(v8)
                }
            let v13 = Uh3Nil
            let v14 = method4(v4, v13)
            Uh21Cons(v2, v12, v14, v7)
        }
        Uh19Nil -> v1
    }
}
