import gleam/bit_array
import gleam/list
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Us16, type Uh10, type Uh15, type Us21, type Us22, type Uh16, type Uh18, Global, Uh10Cons, Uh10Nil, Uh15Cons, Uh15Nil, Uh16Cons, Uh16Nil, Uh18Cons, Uh18Nil, Uh3Cons, Uh3Nil, Uh5Nil, Us0None, Us0Some, Us16Content, Us16Reaction, Us16Revision, Us17Framed, Us17Posted, Us18Deleted, Us18Edited, Us18FrameEdited, Us19Liked, Us19Unliked, Us21Error, Us21Ok, Us22Error, Us22Ok, Us23None, Us23Some, Us2None, Us2Some}
import xsim_frames/part1.{closure1, spiral_string_length, spiral_string_slice, spiral_wrap_signed, spiral_wrap_unsigned, unicode_erlang_characters_to_binary, x_binary_split, x_light, x_spaced}
import xsim_frames/part2.{count_at_13, fields_from_4, text_at_10}
import xsim_frames/part4.{listed_pieces_58, seeded_65, uniform_68}
import xsim_frames/part5.{break_source_81}
import xsim_frames/part6.{method113, method121, method122, parent_at_125, stream_114}

pub fn decoded_124(v0: String) -> Us22 {
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
                        let v19 = parent_at_125(v13)
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
                                let v28 = parent_at_125(v13)
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

pub fn all_decoded_123(v0: Uh3, v1: Uh15) -> Us21 {
    case v0  {
        Uh3Cons(v5, v6) -> {
            let v7 = decoded_124(v5)
            case v7  {
                Us22Error(v12) -> {
                    Us21Error(v12)
                }
                Us22Ok(v8, v9) -> {
                    let v10 = Uh15Cons(v8, v9, v1)
                    all_decoded_123(v6, v10)
                }
            }
        }
        Uh3Nil -> {
            let v2 = Uh15Nil
            let v3 = method113(v1, v2)
            Us21Ok(v3)
        }
    }
}

pub fn decoded_stream_120(v0: String) -> Us21 {
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
                listed_pieces_58(v4, v5)
            }
        }
    let v8 = Uh3Nil
    let v9 = method121(v7, v8)
    let v10 = Uh3Nil
    let v11 = method122(v9, v10)
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
                        Us2None
                    }
                }
            let v35 =
                case v25  {
                    Us2None -> {
                        False
                    }
                    Us2Some(v26) -> {
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
                    all_decoded_123(v13, v36)
                }
                False -> {
                    let v38 = "not an xsim-events v1 stream"
                    Us21Error(v38)
                }
            }
        }
        _ -> {
            let v41 = "not an xsim-events v1 stream"
            Us21Error(v41)
        }
    }
}

pub fn method126(v0: Uh15, v1: Uh10) -> Uh10 {
    case v0  {
        Uh15Cons(v2, v3, v4) -> {
            let v5 = method126(v4, v1)
            Uh10Cons(v3, v5)
        }
        Uh15Nil -> {
            v1
        }
    }
}

pub fn method129(v0: Int, v1: Int, v2: Int, v3: Us16, v4: Int) -> Uh16 {
    let v5 = v4 < v0
    case v5 {
        True -> {
            let v6 = spiral_wrap_signed(v1 + v2, 32)
            let v7 = spiral_wrap_signed(v6 + v4, 32)
            let v8 = spiral_wrap_signed(v7 + 1, 32)
            let v9 = spiral_wrap_signed(v4 + 1, 32)
            let v10 = method129(v0, v1, v2, v3, v9)
            Uh16Cons(v8, v1, v3, v10)
        }
        False -> {
            Uh16Nil
        }
    }
}

pub fn method130(v0: Uh16, v1: Uh16) -> Uh16 {
    case v0  {
        Uh16Cons(v2, v3, v4, v5) -> {
            let v6 = method130(v5, v1)
            Uh16Cons(v2, v3, v4, v6)
        }
        Uh16Nil -> {
            v1
        }
    }
}

pub fn method128(v0: Int, v1: Int, v2: Uh10, v3: Uh16, v4: Int, v5: Int, v6: Int) -> #(Uh16, Int, Int, Int) {
    let #(v33, v34, v35, v36) =
        case v2  {
            Uh10Cons(v7, v8) -> {
                let v9 = spiral_wrap_unsigned(v1, 64)
                let #(v10, v11, v12) = uniform_68(v9, v4, v5)
                let v13 = spiral_wrap_signed(v10, 32)
                let v14 = 1000
                let #(v15, v16, v17) = uniform_68(v14, v11, v12)
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
                let v22 = method129(v20, v6, v13, v7, v21)
                let v23 = method130(v22, v3)
                let v24 = spiral_wrap_signed(v6 + 1, 32)
                method128(v0, v1, v8, v23, v16, v17, v24)
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

pub fn halved_keyed_132(v0: Uh16) -> #(Uh16, Uh16) {
    case v0  {
        Uh16Cons(v1, v2, v3, v4) -> {
            case v4  {
                Uh16Cons(v5, v6, v7, v8) -> {
                    let #(v9, v10) = halved_keyed_132(v8)
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

pub fn merged_keyed_133(v0: Uh16, v1: Uh16) -> Uh16 {
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
                                            let v15 = merged_keyed_133(v5, v1)
                                            Uh16Cons(v2, v3, v4, v15)
                                        }
                                        False -> {
                                            let v17 = merged_keyed_133(v0, v9)
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

pub fn sorted_keyed_131(v0: Uh16) -> Uh16 {
    case v0  {
        Uh16Cons(v1, v2, v3, v4) -> {
            case v4  {
                Uh16Nil -> {
                    v0
                }
                _ -> {
                    let #(v5, v6) = halved_keyed_132(v0)
                    let v7 = sorted_keyed_131(v5)
                    let v8 = sorted_keyed_131(v6)
                    merged_keyed_133(v7, v8)
                }
            }
        }
        Uh16Nil -> {
            v0
        }
    }
}

pub fn method134(v0: Uh16, v1: Uh15) -> Uh15 {
    case v0  {
        Uh16Cons(v2, v3, v4, v5) -> {
            let v6 = method134(v5, v1)
            Uh15Cons(v3, v4, v6)
        }
        Uh16Nil -> {
            v1
        }
    }
}

pub fn deliveries_127(v0: Uh10, v1: Int, v2: Int, v3: Int) -> Uh15 {
    let v4 = spiral_wrap_signed(v1 * 31, 32)
    let v5 = spiral_wrap_signed(v4 + 5, 32)
    let v6 = spiral_wrap_signed(v1 * 17, 32)
    let v7 = spiral_wrap_signed(v6 + 11, 32)
    let v8 = spiral_wrap_unsigned(v1, 64)
    let v9 = spiral_wrap_unsigned(v5, 64)
    let v10 = spiral_wrap_unsigned(v7, 64)
    let #(v11, v12) = seeded_65(v8, v9, v10)
    let v13 = Uh16Nil
    let v14 = 0
    let #(v15, _v16, _v17, _v18) = method128(v2, v3, v0, v13, v11, v12, v14)
    let v19 = sorted_keyed_131(v15)
    let v20 = Uh15Nil
    method134(v19, v20)
}

pub fn rescheduled_119(v0: String, v1: Int, v2: Int, v3: Int) -> String {
    let v4 = decoded_stream_120(v0)
    case v4  {
        Us21Error(v10) -> {
            v10
        }
        Us21Ok(v5) -> {
            let v6 = Uh10Nil
            let v7 = method126(v5, v6)
            let v8 = deliveries_127(v7, v1, v2, v3)
            stream_114(v8)
        }
    }
}

pub fn closure13(capt: Nil) -> fn(#(String, Int, Int, Int)) -> String {
    fn (dom) {
        let #(v0, v1, v2, v3) = dom
        rescheduled_119(v0, v1, v2, v3)
    }
}

pub fn closure14(capt: Nil) -> fn(String) -> String {
    fn (v0) {
        break_source_81(v0)
    }
}

pub fn closure16(capt: Nil) -> fn(Int) -> Int {
    fn (v0) {
        let v1 = spiral_wrap_signed(v0, 32)
        v1
    }
}

pub fn method141(v0: Uh18, v1: Uh18) -> Uh18 {
    case v0  {
        Uh18Cons(v2, v3, v4) -> {
            let v5 = Uh18Cons(v2, v3, v1)
            method141(v4, v5)
        }
        Uh18Nil -> {
            v1
        }
    }
}

pub fn defused_140(v0: String, v1: Uh3, v2: Uh18) -> Uh18 {
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
            let v31 =
                case v12 {
                    True -> {
                        let v13 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                        let v14 = "0123456789_-"
                        let v15 = v13 <> v14 
                        let v16 = spiral_string_length(v0)
                        let v17 = v16 == 1
                        case v17 {
                            True -> {
                                let v18 = v0 == ""
                                let v28 =
                                    case v18 {
                                        True -> {
                                            0
                                        }
                                        False -> {
                                            let v19 = option.from_result(result.map(string.split_once(v15, v0), pair.first))
                                            let v20 = closure1(Nil)
                                            let v21 = v19 |> option.map(v20)
                                            let v22 = Us0None
                                            let v23 = v21 |> option.unwrap(v22)
                                            case v23  {
                                                Us0None -> {
                                                    -1
                                                }
                                                Us0Some(v24) -> {
                                                    let v25 = bit_array.byte_size(bit_array.from_string(v24))
                                                    v25
                                                }
                                            }
                                        }
                                    }
                                let v29 = v28 >= 0
                                v29
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
            let v48 =
                case v31 {
                    True -> {
                        let v32 = spiral_string_length(v11)
                        let v33 = v32 == 1
                        case v33 {
                            True -> {
                                let v34 = v11 == ""
                                let v45 =
                                    case v34 {
                                        True -> {
                                            0
                                        }
                                        False -> {
                                            let v35 = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                            let v36 = option.from_result(result.map(string.split_once(v35, v11), pair.first))
                                            let v37 = closure1(Nil)
                                            let v38 = v36 |> option.map(v37)
                                            let v39 = Us0None
                                            let v40 = v38 |> option.unwrap(v39)
                                            case v40  {
                                                Us0None -> {
                                                    -1
                                                }
                                                Us0Some(v41) -> {
                                                    let v42 = bit_array.byte_size(bit_array.from_string(v41))
                                                    v42
                                                }
                                            }
                                        }
                                    }
                                let v46 = v45 >= 0
                                v46
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
            let #(v117, v118) =
                case v48 {
                    True -> {
                        let v49 = unicode_erlang_characters_to_binary([8203])
                        let v50 = "."
                        let v51 = v49 <> v50 
                        let v52 = unicode_erlang_characters_to_binary([8203])
                        let v53 = v52 <> v50 
                        let v54 = string.to_utf_codepoints(v53) |> list.fold(0, fn(sum, c) { sum + case x_light(string.utf_codepoint_to_int(c)) { True -> 1 False -> 2 } })
                        #(v51, v54)
                    }
                    False -> {
                        let v55 = option.from_result(result.map(list.first(string.to_utf_codepoints(v5)), string.utf_codepoint_to_int))
                        let v56 = closure16(Nil)
                        let v57 = v55 |> option.map(v56)
                        let v58 = v57 |> option.unwrap(0)
                        let v59 = list.length(string.to_utf_codepoints(v5))
                        let v60 = v59 > 1
                        let v114 =
                            case v60 {
                                True -> {
                                    let v61 = v58 >= 126976
                                    let v91 =
                                        case v61 {
                                            True -> {
                                                True
                                            }
                                            False -> {
                                                let v62 = unicode_erlang_characters_to_binary([65039])
                                                let v63 = v62 == ""
                                                let v73 =
                                                    case v63 {
                                                        True -> {
                                                            0
                                                        }
                                                        False -> {
                                                            let v64 = option.from_result(result.map(string.split_once(v5, v62), pair.first))
                                                            let v65 = closure1(Nil)
                                                            let v66 = v64 |> option.map(v65)
                                                            let v67 = Us0None
                                                            let v68 = v66 |> option.unwrap(v67)
                                                            case v68  {
                                                                Us0None -> {
                                                                    -1
                                                                }
                                                                Us0Some(v69) -> {
                                                                    let v70 = bit_array.byte_size(bit_array.from_string(v69))
                                                                    v70
                                                                }
                                                            }
                                                        }
                                                    }
                                                let v74 = v73 >= 0
                                                case v74 {
                                                    True -> {
                                                        let v75 = v58 >= 8192
                                                        let v77 =
                                                            case v75 {
                                                                True -> {
                                                                    let v76 = v58 <= 11263
                                                                    v76
                                                                }
                                                                False -> {
                                                                    False
                                                                }
                                                            }
                                                        let v79 =
                                                            case v77 {
                                                                True -> {
                                                                    True
                                                                }
                                                                False -> {
                                                                    let v78 = v58 == 169
                                                                    v78
                                                                }
                                                            }
                                                        let v81 =
                                                            case v79 {
                                                                True -> {
                                                                    True
                                                                }
                                                                False -> {
                                                                    let v80 = v58 == 174
                                                                    v80
                                                                }
                                                            }
                                                        let v83 =
                                                            case v81 {
                                                                True -> {
                                                                    True
                                                                }
                                                                False -> {
                                                                    let v82 = v58 == 12336
                                                                    v82
                                                                }
                                                            }
                                                        let v85 =
                                                            case v83 {
                                                                True -> {
                                                                    True
                                                                }
                                                                False -> {
                                                                    let v84 = v58 == 12349
                                                                    v84
                                                                }
                                                            }
                                                        let v87 =
                                                            case v85 {
                                                                True -> {
                                                                    True
                                                                }
                                                                False -> {
                                                                    let v86 = v58 == 12951
                                                                    v86
                                                                }
                                                            }
                                                        case v87 {
                                                            True -> {
                                                                True
                                                            }
                                                            False -> {
                                                                let v88 = v58 == 12953
                                                                v88
                                                            }
                                                        }
                                                    }
                                                    False -> {
                                                        False
                                                    }
                                                }
                                            }
                                        }
                                    case v91 {
                                        True -> {
                                            True
                                        }
                                        False -> {
                                            let v92 = unicode_erlang_characters_to_binary([8419])
                                            let v93 = v92 == ""
                                            let v103 =
                                                case v93 {
                                                    True -> {
                                                        0
                                                    }
                                                    False -> {
                                                        let v94 = option.from_result(result.map(string.split_once(v5, v92), pair.first))
                                                        let v95 = closure1(Nil)
                                                        let v96 = v94 |> option.map(v95)
                                                        let v97 = Us0None
                                                        let v98 = v96 |> option.unwrap(v97)
                                                        case v98  {
                                                            Us0None -> {
                                                                -1
                                                            }
                                                            Us0Some(v99) -> {
                                                                let v100 = bit_array.byte_size(bit_array.from_string(v99))
                                                                v100
                                                            }
                                                        }
                                                    }
                                                }
                                            let v104 = v103 >= 0
                                            case v104 {
                                                True -> {
                                                    let v105 = v58 == 35
                                                    let v107 =
                                                        case v105 {
                                                            True -> {
                                                                True
                                                            }
                                                            False -> {
                                                                let v106 = v58 == 42
                                                                v106
                                                            }
                                                        }
                                                    case v107 {
                                                        True -> {
                                                            True
                                                        }
                                                        False -> {
                                                            let v108 = v58 >= 48
                                                            case v108 {
                                                                True -> {
                                                                    let v109 = v58 <= 57
                                                                    v109
                                                                }
                                                                False -> {
                                                                    False
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                                False -> {
                                                    False
                                                }
                                            }
                                        }
                                    }
                                }
                                False -> {
                                    False
                                }
                            }
                        let v116 =
                            case v114 {
                                True -> {
                                    2
                                }
                                False -> {
                                    let v115 = string.to_utf_codepoints(v5) |> list.fold(0, fn(sum, c) { sum + case x_light(string.utf_codepoint_to_int(c)) { True -> 1 False -> 2 } })
                                    v115
                                }
                            }
                        #(v5, v116)
                    }
                }
            let v119 = Uh18Cons(v117, v118, v2)
            defused_140(v5, v6, v119)
        }
        Uh3Nil -> {
            let v3 = Uh18Nil
            method141(v2, v3)
        }
    }
}

pub fn units_of_139(v0: String) -> Uh18 {
    let v1 = ""
    let v2 = string.to_graphemes(v0)
    let v3 = v2 |> list.reverse
    let v4 = Uh3Nil
    let listm_fold = v3 |> list.fold (v4, fn (acc, x) {
    let v5 = x
    let v6 = acc
    let v7 = Uh3Cons(v5, v6)
    v7
    })
    let v8 = listm_fold
    let v9 = Uh18Nil
    defused_140(v1, v8, v9)
}

pub fn closure17(capt: Nil) -> fn(#(String, Int)) -> Bool {
    fn (dom) {
        let #(v0, _v1) = dom
        let v2 = string.to_utf_codepoints(v0) |> list.all(fn(c) { x_spaced(string.utf_codepoint_to_int(c)) })
        let v3 = v2 == False
        v3
    }
}

pub fn taken_while_145(v0: fn(#(String, Int)) -> Bool, v1: Uh18, v2: Uh18) -> #(Uh18, Uh18) {
    case v1  {
        Uh18Cons(v3, v4, v5) -> {
            let v6 = v0(#(v3, v4))
            case v6 {
                True -> {
                    let v7 = Uh18Cons(v3, v4, v2)
                    taken_while_145(v0, v5, v7)
                }
                False -> {
                    let v10 = Uh18Nil
                    let v11 = method141(v2, v10)
                    #(v11, v1)
                }
            }
        }
        _ -> {
            let v14 = Uh18Nil
            let v15 = method141(v2, v14)
            #(v15, v1)
        }
    }
}

pub fn closure18(capt: Nil) -> fn(#(String, Int)) -> Bool {
    fn (dom) {
        let #(v0, _v1) = dom
        let v2 = string.to_utf_codepoints(v0) |> list.all(fn(c) { x_spaced(string.utf_codepoint_to_int(c)) })
        v2
    }
}

pub fn method146(v0: Uh18, v1: Int) -> Int {
    case v0  {
        Uh18Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + 1, 32)
            method146(v4, v5)
        }
        Uh18Nil -> {
            v1
        }
    }
}

pub fn method147(v0: Uh18, v1: Uh18) -> Uh18 {
    case v0  {
        Uh18Cons(v2, v3, v4) -> {
            let v5 = method147(v4, v1)
            Uh18Cons(v2, v3, v5)
        }
        Uh18Nil -> {
            v1
        }
    }
}
