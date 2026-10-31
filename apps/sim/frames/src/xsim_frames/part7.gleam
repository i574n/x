import gleam/string
import xsim_split
import xsim_frames/types.{type Uh3, type Us0, type Uh7, type Uh8, type Us16, type Uh10, type Uh15, type Us21, type Us22, type Uh16, type Uh17, type Uh18, type Us24, type Uh19, type Uh20, Uh10Cons, Uh10Nil, Uh15Cons, Uh15Nil, Uh16Cons, Uh16Nil, Uh17Cons, Uh17Nil, Uh18Cons, Uh18Nil, Uh19Cons, Uh19Nil, Uh20Cons, Uh20Nil, Uh3Cons, Uh3Nil, Uh5Nil, Uh7Nil, Uh8Nil, Us16Content, Us16Reaction, Us16Revision, Us17Framed, Us17Posted, Us18Deleted, Us18Edited, Us18FrameEdited, Us19Liked, Us19Unliked, Us21Error, Us21Ok, Us22Error, Us22Ok, Us23None, Us23Some, Us24None, Us24Some, Us2None, Us2Some}
import xsim_frames/part1.{spiral_string_length, spiral_string_slice, spiral_wrap_signed, spiral_wrap_unsigned, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part2.{count_at_13, delimited_19, fields_from_4, method15, method17, text_at_10}
import xsim_frames/part4.{method49, method50, method52, method53, method58, method77, seeded_64, uniform_67}
import xsim_frames/part5.{break_source_80, method103, method94}
import xsim_frames/part6.{from_corpus_59, method112, method120, method121, parent_at_124, stream_113}

pub fn decoded_123(v0: String) -> Us22 {
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
                Us2None
            }
        }
    case v12  {
        Us2None -> {
            let v102 = "not a compact xsim-events line: "
            let v103 = v102 <> v0 
            Us22Error(v103)
        }
        Us2Some(v13) -> {
            let v14 = "kind"
            let v15 = text_at_10(v14, v13)
            let v16 = v15 == "post"
            let v89 =
                case v16 {
                    True -> {
                        let v17 = "post"
                        let v18 = text_at_10(v17, v13)
                        let v19 = parent_at_124(v13)
                        let v20 = "source"
                        let v21 = text_at_10(v20, v13)
                        let v22 = Us17Posted(v18, v19, v21)
                        let v23 = Us16Content(v22)
                        Us23Some(v23)
                    }
                    False -> {
                        let v25 = v15 == "frame"
                        case v25 {
                            True -> {
                                let v26 = "post"
                                let v27 = text_at_10(v26, v13)
                                let v28 = parent_at_124(v13)
                                let v29 = "k"
                                let v30 = count_at_13(v29, v13)
                                let v31 = "n"
                                let v32 = count_at_13(v31, v13)
                                let v33 = "body"
                                let v34 = text_at_10(v33, v13)
                                let v35 = Us17Framed(v27, v28, v30, v32, v34)
                                let v36 = Us16Content(v35)
                                Us23Some(v36)
                            }
                            False -> {
                                let v38 = v15 == "edit"
                                case v38 {
                                    True -> {
                                        let v39 = "post"
                                        let v40 = text_at_10(v39, v13)
                                        let v41 = "source"
                                        let v42 = text_at_10(v41, v13)
                                        let v43 = Us18Edited(v40, v42)
                                        let v44 = Us16Revision(v43)
                                        Us23Some(v44)
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
                                                let v57 = Us18FrameEdited(v48, v50, v52, v54, v56)
                                                let v58 = Us16Revision(v57)
                                                Us23Some(v58)
                                            }
                                            False -> {
                                                let v60 = v15 == "delete"
                                                case v60 {
                                                    True -> {
                                                        let v61 = "post"
                                                        let v62 = text_at_10(v61, v13)
                                                        let v63 = Us18Deleted(v62)
                                                        let v64 = Us16Revision(v63)
                                                        Us23Some(v64)
                                                    }
                                                    False -> {
                                                        let v66 = v15 == "like"
                                                        case v66 {
                                                            True -> {
                                                                let v67 = "post"
                                                                let v68 = text_at_10(v67, v13)
                                                                let v69 = "user"
                                                                let v70 = text_at_10(v69, v13)
                                                                let v71 = Us19Liked(v68, v70)
                                                                let v72 = Us16Reaction(v71)
                                                                Us23Some(v72)
                                                            }
                                                            False -> {
                                                                let v74 = v15 == "unlike"
                                                                case v74 {
                                                                    True -> {
                                                                        let v75 = "post"
                                                                        let v76 = text_at_10(v75, v13)
                                                                        let v77 = "user"
                                                                        let v78 = text_at_10(v77, v13)
                                                                        let v79 = Us19Unliked(v76, v78)
                                                                        let v80 = Us16Reaction(v79)
                                                                        Us23Some(v80)
                                                                    }
                                                                    False -> {
                                                                        Us23None
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
                Us23None -> {
                    let v94 = text_at_10(v14, v13)
                    let v95 = "unknown event kind '"
                    let v96 = v95 <> v94 
                    let v97 = "'"
                    let v98 = v96 <> v97 
                    Us22Error(v98)
                }
                Us23Some(v90) -> {
                    let v91 = "at"
                    let v92 = count_at_13(v91, v13)
                    Us22Ok(v92, v90)
                }
            }
        }
    }
}

pub fn all_decoded_122(v0: Uh3, v1: Uh15) -> Us21 {
    case v0  {
        Uh3Cons(v5, v6) -> {
            let v7 = decoded_123(v5)
            case v7  {
                Us22Error(v12) -> {
                    Us21Error(v12)
                }
                Us22Ok(v8, v9) -> {
                    let v10 = Uh15Cons(v8, v9, v1)
                    all_decoded_122(v6, v10)
                }
            }
        }
        Uh3Nil -> {
            let v2 = Uh15Nil
            let v3 = method112(v1, v2)
            Us21Ok(v3)
        }
    }
}

pub fn decoded_stream_119(v0: String) -> Us21 {
    let v1 = v0 == ""
    let v5 =
        case v1 {
            True -> {
                Uh3Nil
            }
            False -> {
                let v3 = "\n"
                split_list_2(v3, v0)
            }
        }
    let v6 = Uh3Nil
    let v7 = method120(v5, v6)
    let v8 = Uh3Nil
    let v9 = method121(v7, v8)
    case v9  {
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
                        Us2None
                    }
                }
            let v33 =
                case v23  {
                    Us2None -> {
                        False
                    }
                    Us2Some(v24) -> {
                        let v25 = "format"
                        let v26 = text_at_10(v25, v24)
                        let v27 = v26 == "xsim-events"
                        case v27 {
                            True -> {
                                let v28 = "version"
                                let v29 = count_at_13(v28, v24)
                                let v30 = v29 == 1
                                v30
                            }
                            False -> {
                                False
                            }
                        }
                    }
                }
            case v33 {
                True -> {
                    let v34 = Uh15Nil
                    all_decoded_122(v11, v34)
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

pub fn method125(v0: Uh15, v1: Uh10) -> Uh10 {
    case v0  {
        Uh15Cons(v2, v3, v4) -> {
            let v5 = method125(v4, v1)
            Uh10Cons(v3, v5)
        }
        Uh15Nil -> {
            v1
        }
    }
}

pub fn method128(v0: Int, v1: Int, v2: Int, v3: Us16, v4: Int) -> Uh16 {
    let v5 = v4 < v0
    case v5 {
        True -> {
            let v6 = spiral_wrap_signed(v1 + v2, 32)
            let v7 = spiral_wrap_signed(v6 + v4, 32)
            let v8 = spiral_wrap_signed(v7 + 1, 32)
            let v9 = spiral_wrap_signed(v4 + 1, 32)
            let v10 = method128(v0, v1, v2, v3, v9)
            Uh16Cons(v8, v1, v3, v10)
        }
        False -> {
            Uh16Nil
        }
    }
}

pub fn method129(v0: Uh16, v1: Uh16) -> Uh16 {
    case v0  {
        Uh16Cons(v2, v3, v4, v5) -> {
            let v6 = method129(v5, v1)
            Uh16Cons(v2, v3, v4, v6)
        }
        Uh16Nil -> {
            v1
        }
    }
}

pub fn method127(v0: Int, v1: Int, v2: Uh10, v3: Uh16, v4: Int, v5: Int, v6: Int) -> #(Uh16, Int, Int, Int) {
    let #(v33, v34, v35, v36) =
        case v2  {
            Uh10Cons(v7, v8) -> {
                let v9 = spiral_wrap_unsigned(v1, 64)
                let #(v10, v11, v12) = uniform_67(v9, v4, v5)
                let v13 = spiral_wrap_signed(v10, 32)
                let v14 = 1000
                let #(v15, v16, v17) = uniform_67(v14, v11, v12)
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
                let v22 = method128(v20, v6, v13, v7, v21)
                let v23 = method129(v22, v3)
                let v24 = spiral_wrap_signed(v6 + 1, 32)
                method127(v0, v1, v8, v23, v16, v17, v24)
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

pub fn halved_keyed_131(v0: Uh16) -> #(Uh16, Uh16) {
    case v0  {
        Uh16Cons(v1, v2, v3, v4) -> {
            case v4  {
                Uh16Cons(v5, v6, v7, v8) -> {
                    let #(v9, v10) = halved_keyed_131(v8)
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

pub fn merged_keyed_132(v0: Uh16, v1: Uh16) -> Uh16 {
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
                                            let v15 = merged_keyed_132(v5, v1)
                                            Uh16Cons(v2, v3, v4, v15)
                                        }
                                        False -> {
                                            let v17 = merged_keyed_132(v0, v9)
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

pub fn sorted_keyed_130(v0: Uh16) -> Uh16 {
    case v0  {
        Uh16Cons(v1, v2, v3, v4) -> {
            case v4  {
                Uh16Nil -> {
                    v0
                }
                _ -> {
                    let #(v5, v6) = halved_keyed_131(v0)
                    let v7 = sorted_keyed_130(v5)
                    let v8 = sorted_keyed_130(v6)
                    merged_keyed_132(v7, v8)
                }
            }
        }
        Uh16Nil -> {
            v0
        }
    }
}

pub fn method133(v0: Uh16, v1: Uh15) -> Uh15 {
    case v0  {
        Uh16Cons(v2, v3, v4, v5) -> {
            let v6 = method133(v5, v1)
            Uh15Cons(v3, v4, v6)
        }
        Uh16Nil -> {
            v1
        }
    }
}

pub fn deliveries_126(v0: Uh10, v1: Int, v2: Int, v3: Int) -> Uh15 {
    let v4 = spiral_wrap_signed(v1 * 31, 32)
    let v5 = spiral_wrap_signed(v4 + 5, 32)
    let v6 = spiral_wrap_signed(v1 * 17, 32)
    let v7 = spiral_wrap_signed(v6 + 11, 32)
    let v8 = spiral_wrap_unsigned(v1, 64)
    let v9 = spiral_wrap_unsigned(v5, 64)
    let v10 = spiral_wrap_unsigned(v7, 64)
    let #(v11, v12) = seeded_64(v8, v9, v10)
    let v13 = Uh16Nil
    let v14 = 0
    let #(v15, _v16, _v17, _v18) = method127(v2, v3, v0, v13, v11, v12, v14)
    let v19 = sorted_keyed_130(v15)
    let v20 = Uh15Nil
    method133(v19, v20)
}

pub fn rescheduled_118(v0: String, v1: Int, v2: Int, v3: Int) -> String {
    let v4 = decoded_stream_119(v0)
    case v4  {
        Us21Error(v10) -> {
            v10
        }
        Us21Ok(v5) -> {
            let v6 = Uh10Nil
            let v7 = method125(v5, v6)
            let v8 = deliveries_126(v7, v1, v2, v3)
            stream_113(v8)
        }
    }
}

pub fn closure13(capt: Nil) -> fn(#(String, Int, Int, Int)) -> String {
    fn (dom) {
        let #(v0, v1, v2, v3) = dom
        rescheduled_118(v0, v1, v2, v3)
    }
}

pub fn closure14(capt: Nil) -> fn(String) -> String {
    fn (v0) {
        break_source_80(v0)
    }
}

pub fn closure18(capt: #(String, Int)) -> fn(String) -> Uh3 {
    fn (v2) {
        let #(v0, v1) = capt
        let v3 = xsim_split.split_cell_joined(v0, v1, v2)
        let v4 = v3 == ""
        case v4 {
            True -> {
                Uh3Nil
            }
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

pub fn method138(v0: Uh18, v1: Uh18) -> Uh18 {
    case v0  {
        Uh18Cons(v2, v3, v4, v5) -> {
            let v6 = method138(v5, v1)
            Uh18Cons(v2, v3, v4, v6)
        }
        Uh18Nil -> {
            v1
        }
    }
}

pub fn method137(v0: Int, v1: Uh3, v2: Uh18, v3: Int) -> #(Uh18, Int) {
    case v1  {
        Uh3Cons(v4, v5) -> {
            let v6 = Uh18Nil
            let v7 = Uh18Cons(v3, v0, v4, v6)
            let v8 = method138(v2, v7)
            let v9 = spiral_wrap_signed(v3 + 1, 32)
            method137(v0, v5, v8, v9)
        }
        Uh3Nil -> {
            #(v2, v3)
        }
    }
}

pub fn method139(v0: String, v1: Us0, v2: String, v3: Uh18, v4: Uh10) -> Uh10 {
    case v3  {
        Uh18Cons(v5, v6, v7, v8) -> {
            let v9 = method139(v0, v1, v2, v8, v4)
            let v10 = Us17Framed(v0, v1, v5, v6, v7)
            let v11 = Us16Content(v10)
            Uh10Cons(v11, v9)
        }
        Uh18Nil -> {
            v4
        }
    }
}

pub fn method140(v0: Uh10, v1: Uh10) -> Uh10 {
    case v0  {
        Uh10Cons(v2, v3) -> {
            let v4 = Uh10Cons(v2, v1)
            method140(v3, v4)
        }
        Uh10Nil -> {
            v1
        }
    }
}

pub fn method141(v0: String, v1: Uh17) -> Us24 {
    case v1  {
        Uh17Cons(v3, v4, v5) -> {
            let v6 = v3 == v0
            case v6 {
                True -> {
                    Us24Some(v3, v4)
                }
                False -> {
                    method141(v0, v5)
                }
            }
        }
        Uh17Nil -> {
            Us24None
        }
    }
}

pub fn method142(v0: Int, v1: String, v2: String, v3: Uh18, v4: Uh10) -> Uh10 {
    case v3  {
        Uh18Cons(v5, v6, v7, v8) -> {
            let v9 = method142(v0, v1, v2, v8, v4)
            let v10 = Us18FrameEdited(v1, v0, v5, v6, v7)
            let v11 = Us16Revision(v10)
            Uh10Cons(v11, v9)
        }
        Uh18Nil -> {
            v4
        }
    }
}

pub fn method136(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: Int, v2: Uh10, v3: Uh10, v4: Uh17) -> #(Uh10, Uh17) {
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
                                                let v18 = method17(v13, v17)
                                                let v19 = Uh18Nil
                                                let v20 = 1
                                                let #(v21, _v22) = method137(v18, v13, v19, v20)
                                                v21
                                            }
                                        }
                                    let v24 = Uh10Nil
                                    let v25 = method139(v8, v9, v10, v23, v24)
                                    let v26 = method140(v25, v3)
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
                                                let v33 = method141(v31, v4)
                                                let v37 =
                                                    case v33  {
                                                        Us24None -> {
                                                            0
                                                        }
                                                        Us24Some(v34, v35) -> {
                                                            v35
                                                        }
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
                                                            let v46 = method17(v41, v45)
                                                            let v47 = Uh18Nil
                                                            let v48 = 1
                                                            let #(v49, _v50) = method137(v46, v41, v47, v48)
                                                            v49
                                                        }
                                                    }
                                                let v52 = Uh10Nil
                                                let v53 = method142(v38, v31, v32, v51, v52)
                                                let v54 = method140(v53, v3)
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
                method136(v0, v1, v6, v62, v63)
            }
            _ -> {
                let #(v66, v67) =
                    case v2  {
                        Uh10Nil -> {
                            #(v3, v4)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v66, v67)
            }
        }
    #(v68, v69)
}

pub fn exploded_135(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: Int, v2: Uh10) -> Uh10 {
    let v3 = Uh10Nil
    let v4 = Uh17Nil
    let #(v5, _v6) = method136(v0, v1, v2, v3, v4)
    let v7 = Uh10Nil
    method103(v5, v7)
}

pub fn corpus_run_134(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh7, v6: Bool, v7: Bool, v8: Int, v9: Int, v10: fn(String) -> fn(Int) -> fn(String) -> Uh3, v11: Uh8) -> #(String, Int, Int, Uh3) {
    let #(v12, v13, v14) = from_corpus_59(v0, v1, v2, v3, v4, v5, v6, v11)
    let v17 =
        case v7 {
            True -> {
                let v15 = 280
                exploded_135(v10, v15, v13)
            }
            False -> {
                v13
            }
        }
    let v18 = 6
    let v19 = deliveries_126(v17, v8, v9, v18)
    let v20 = stream_113(v19)
    let v21 = 0
    let v22 = method77(v12, v21)
    let v23 = 0
    let v24 = method94(v17, v23)
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
                True -> {
                    Uh3Nil
                }
                False -> {
                    split_list_2(v11, v12)
                }
            }
        let v17 = Uh3Nil
        let v18 = method52(v16, v17)
        let v19 = Uh7Nil
        let v20 = method53(v18, v19)
        let v21 = False
        let v22 = closure16(Nil)
        let v23 = unicode_erlang_characters_to_binary([1])
        let v24 = split_list_2(v23, v0)
        let v25 = unicode_erlang_characters_to_binary([0])
        let v26 = Uh8Nil
        let v27 = method58(v25, v24, v26)
        let #(v28, v29, v30, v31) = corpus_run_134(v1, v2, v3, v4, v5, v20, v21, v7, v8, v9, v22, v27)
        let v32 = unicode_erlang_characters_to_binary([0])
        let v33 = delimited_19(v32, v31)
        #(v28, v29, v30, v33)
    }
}

pub fn method146(v0: Uh19, v1: Uh19) -> Uh19 {
    case v0  {
        Uh19Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method146(v6, v1)
            Uh19Cons(v2, v3, v4, v5, v7)
        }
        Uh19Nil -> {
            v1
        }
    }
}

pub fn method147(v0: String, v1: String, v2: Uh19, v3: Uh19) -> Uh19 {
    case v2  {
        Uh19Cons(v4, v5, v6, v7, v8) -> {
            let v9 = method147(v0, v1, v8, v3)
            let v10 = v4 == v0
            let #(v22, v23, v24, v25) =
                case v10 {
                    True -> {
                        let v15 =
                            case v6  {
                                Uh3Cons(v11, v12) -> {
                                    v11
                                }
                                Uh3Nil -> {
                                    let v13 = ""
                                    v13
                                }
                            }
                        let v16 = v15 == v1
                        let #(v18, v19, v20, v21) =
                            case v16 {
                                True -> {
                                    #(v4, v5, v6, v7)
                                }
                                False -> {
                                    let v17 = Uh3Cons(v1, v6)
                                    #(v4, v5, v17, v7)
                                }
                            }
                        #(v18, v19, v20, v21)
                    }
                    False -> {
                        #(v4, v5, v6, v7)
                    }
                }
            Uh19Cons(v22, v23, v24, v25, v9)
        }
        Uh19Nil -> {
            v3
        }
    }
}

pub fn method148(v0: String, v1: Uh19, v2: Uh19) -> Uh19 {
    case v1  {
        Uh19Cons(v3, v4, v5, v6, v7) -> {
            let v8 = method148(v0, v7, v2)
            let v9 = v3 == v0
            let #(v10, v11, v12, v13) =
                case v9 {
                    True -> {
                        #(v3, v4, v5, True)
                    }
                    False -> {
                        #(v3, v4, v5, v6)
                    }
                }
            Uh19Cons(v10, v11, v12, v13, v8)
        }
        Uh19Nil -> {
            v2
        }
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

pub fn method149(v0: String) -> fn(#(String, Uh3)) -> Bool {
    closure20(#(v0))
}

pub fn method150(v0: String, v1: fn(#(String, Uh3)) -> Bool, v2: Uh20) -> Bool {
    case v2  {
        Uh20Cons(v3, v4, v5) -> {
            let v6 = v1(#(v3, v4))
            case v6 {
                True -> {
                    True
                }
                False -> {
                    let v7 = method149(v0)
                    method150(v0, v7, v5)
                }
            }
        }
        Uh20Nil -> {
            False
        }
    }
}

pub fn method151(v0: String, v1: String, v2: Uh20, v3: Uh20) -> Uh20 {
    case v2  {
        Uh20Cons(v4, v5, v6) -> {
            let v7 = method151(v0, v1, v6, v3)
            let v8 = v4 == v0
            let #(v15, v16) =
                case v8 {
                    True -> {
                        let v9 = method49(v1)
                        let v10 = method50(v1, v9, v5)
                        let v14 =
                            case v10 {
                                True -> {
                                    v5
                                }
                                False -> {
                                    let v11 = Uh3Nil
                                    let v12 = Uh3Cons(v1, v11)
                                    method15(v5, v12)
                                }
                            }
                        #(v4, v14)
                    }
                    False -> {
                        #(v4, v5)
                    }
                }
            Uh20Cons(v15, v16, v7)
        }
        Uh20Nil -> {
            v3
        }
    }
}
