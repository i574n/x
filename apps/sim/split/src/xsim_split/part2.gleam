import gleam/bit_array
import gleam/list
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_split/types.{type ListString, type Uh1, type Us1, type Uh3, ListStringCons, ListStringNil, Uh1Cons, Uh1Nil, Uh3Cons, Uh3Nil, Us1None, Us1Some}
import xsim_split/part1.{ascii_letter_6, ascii_of_7, blocks_domain_16, concat_balanced_22, defusable_18, label_glyph_5, method10, pieces_from_3, spiral_string_length, spiral_wrap_signed, unicode_erlang_characters_to_binary}

pub fn defused_run_17(v0: fn(String) -> Bool, v1: ListString, v2: ListString, v3: ListString) -> ListString {
    case v2  {
        ListStringCons(v4, v5) -> {
            let v6 = ListStringCons(v4, v1)
            let v7 = defusable_18(v0, v1, v4, v5)
            let v10 =
                case v7 {
                    True -> {
                        let v8 = unicode_erlang_characters_to_binary([8203])
                        ListStringCons(v8, v3)
                    }
                    False -> {
                        v3
                    }
                }
            let v11 = ListStringCons(v4, v10)
            defused_run_17(v0, v6, v5, v11)
        }
        ListStringNil -> {
            let v13 = ListStringNil
            method10(v3, v13)
        }
    }
}

pub fn run_text_15(v0: fn(String) -> Bool, v1: String, v2: ListString) -> ListString {
    let v3 = blocks_domain_16(v1)
    case v3 {
        True -> {
            v2
        }
        False -> {
            let v4 = ListStringNil
            let v5 = ListStringNil
            defused_run_17(v0, v4, v2, v5)
        }
    }
}

pub fn method26(v0: ListString, v1: ListString) -> ListString {
    case v0  {
        ListStringCons(v2, v3) -> {
            let v4 = method26(v3, v1)
            ListStringCons(v2, v4)
        }
        ListStringNil -> {
            v1
        }
    }
}

pub fn method14(v0: fn(String) -> Bool, v1: Uh1, v2: ListString) -> ListString {
    case v1  {
        Uh1Cons(v3, v4, v5) -> {
            let v6 = method14(v0, v5, v2)
            let v7 = run_text_15(v0, v3, v4)
            method26(v7, v6)
        }
        Uh1Nil -> {
            v2
        }
    }
}

pub fn defused_dots_by_2(v0: fn(String) -> Bool, v1: String) -> String {
    let v2 = ""
    let v3 = string.to_graphemes(v1)
    let v4 = v3 |> list.reverse
    let v5 = ListStringNil
    let listm_fold = v4 |> list.fold (v5, fn (acc, x) {
    let v6 = x
    let v7 = acc
    let v8 = ListStringCons(v6, v7)
    v8
    })
    let v9 = listm_fold
    let v10 = Uh1Nil
    let v11 = pieces_from_3(v2, v9, v10)
    let v12 = ListStringNil
    let v13 = method14(v0, v11, v12)
    concat_balanced_22(v2, v13)
}

pub fn word_glyph_32(v0: String) -> Bool {
    let v1 = label_glyph_5(v0)
    case v1 {
        True -> {
            let v2 = v0 != "-"
            v2
        }
        False -> {
            False
        }
    }
}

pub fn word_length_31(v0: ListString, v1: Int) -> #(Int, ListString) {
    case v0  {
        ListStringCons(v2, v3) -> {
            let v4 = word_glyph_32(v2)
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v1 + 1, 32)
                    word_length_31(v3, v5)
                }
                False -> {
                    #(v1, v0)
                }
            }
        }
        _ -> {
            #(v1, v0)
        }
    }
}

pub fn closure3(capt: Nil) -> fn(String) -> Us1 {
    fn (v0) {
        Us1Some(v0)
    }
}

pub fn mention_quiet_33(v0: String) -> Bool {
    let v1 = word_glyph_32(v0)
    let v18 =
        case v1 {
            True -> {
                True
            }
            False -> {
                let v2 = spiral_string_length(v0)
                let v3 = v2 == 1
                case v3 {
                    True -> {
                        let v4 = v0 == ""
                        let v15 =
                            case v4 {
                                True -> {
                                    0
                                }
                                False -> {
                                    let v5 = "!#$%&*@"
                                    let v6 = option.from_result(result.map(string.split_once(v5, v0), pair.first))
                                    let v7 = closure3(Nil)
                                    let v8 = v6 |> option.map(v7)
                                    let v9 = Us1None
                                    let v10 = v8 |> option.unwrap(v9)
                                    case v10  {
                                        Us1None -> {
                                            -1
                                        }
                                        Us1Some(v11) -> {
                                            let v12 = bit_array.byte_size(bit_array.from_string(v11))
                                            v12
                                        }
                                    }
                                }
                            }
                        let v16 = v15 >= 0
                        v16
                    }
                    False -> {
                        False
                    }
                }
            }
        }
    let v20 =
        case v18 {
            True -> {
                True
            }
            False -> {
                let v19 = v0 == "＠"
                v19
            }
        }
    let v21 = v20 == False
    v21
}

pub fn rt_letters_35(v0: String, v1: String) -> Bool {
    let v2 = spiral_string_length(v0)
    let v3 = v2 == 1
    let v17 =
        case v3 {
            True -> {
                let v4 = v0 == ""
                let v15 =
                    case v4 {
                        True -> {
                            0
                        }
                        False -> {
                            let v5 = "tT"
                            let v6 = option.from_result(result.map(string.split_once(v5, v0), pair.first))
                            let v7 = closure3(Nil)
                            let v8 = v6 |> option.map(v7)
                            let v9 = Us1None
                            let v10 = v8 |> option.unwrap(v9)
                            case v10  {
                                Us1None -> {
                                    -1
                                }
                                Us1Some(v11) -> {
                                    let v12 = bit_array.byte_size(bit_array.from_string(v11))
                                    v12
                                }
                            }
                        }
                    }
                let v16 = v15 >= 0
                v16
            }
            False -> {
                False
            }
        }
    case v17 {
        True -> {
            let v18 = spiral_string_length(v1)
            let v19 = v18 == 1
            case v19 {
                True -> {
                    let v20 = v1 == ""
                    let v31 =
                        case v20 {
                            True -> {
                                0
                            }
                            False -> {
                                let v21 = "rR"
                                let v22 = option.from_result(result.map(string.split_once(v21, v1), pair.first))
                                let v23 = closure3(Nil)
                                let v24 = v22 |> option.map(v23)
                                let v25 = Us1None
                                let v26 = v24 |> option.unwrap(v25)
                                case v26  {
                                    Us1None -> {
                                        -1
                                    }
                                    Us1Some(v27) -> {
                                        let v28 = bit_array.byte_size(bit_array.from_string(v27))
                                        v28
                                    }
                                }
                            }
                        }
                    let v32 = v31 >= 0
                    v32
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
}

pub fn closure4(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = label_glyph_5(v0)
        case v1 {
            True -> {
                True
            }
            False -> {
                let v2 = spiral_string_length(v0)
                let v3 = v2 == 1
                case v3 {
                    True -> {
                        let v4 = v0 == ""
                        let v15 =
                            case v4 {
                                True -> {
                                    0
                                }
                                False -> {
                                    let v5 = "+~."
                                    let v6 = option.from_result(result.map(string.split_once(v5, v0), pair.first))
                                    let v7 = closure3(Nil)
                                    let v8 = v6 |> option.map(v7)
                                    let v9 = Us1None
                                    let v10 = v8 |> option.unwrap(v9)
                                    case v10  {
                                        Us1None -> {
                                            -1
                                        }
                                        Us1Some(v11) -> {
                                            let v12 = bit_array.byte_size(bit_array.from_string(v11))
                                            v12
                                        }
                                    }
                                }
                            }
                        let v16 = v15 >= 0
                        v16
                    }
                    False -> {
                        False
                    }
                }
            }
        }
    }
}

pub fn first_is_37(v0: fn(String) -> Bool, v1: ListString) -> Bool {
    case v1  {
        ListStringCons(v2, v3) -> {
            v0(v2)
        }
        ListStringNil -> {
            False
        }
    }
}

pub fn rt_boundary_36(v0: ListString) -> Bool {
    let v1 = closure4(Nil)
    let v2 = first_is_37(v1, v0)
    let v3 = v2 == False
    v3
}

pub fn rt_before_34(v0: ListString) -> Bool {
    case v0  {
        ListStringCons(v1, v2) -> {
            case v2  {
                ListStringCons(v3, v4) -> {
                    case v4  {
                        ListStringCons(v5, v6) -> {
                            let v7 = v1 == ":"
                            let v9 =
                                case v7 {
                                    True -> {
                                        rt_letters_35(v3, v5)
                                    }
                                    False -> {
                                        False
                                    }
                                }
                            case v9 {
                                True -> {
                                    rt_boundary_36(v6)
                                }
                                False -> {
                                    let v11 = rt_letters_35(v1, v3)
                                    case v11 {
                                        True -> {
                                            rt_boundary_36(v4)
                                        }
                                        False -> {
                                            False
                                        }
                                    }
                                }
                            }
                        }
                        _ -> {
                            let v15 = rt_letters_35(v1, v3)
                            case v15 {
                                True -> {
                                    rt_boundary_36(v4)
                                }
                                False -> {
                                    False
                                }
                            }
                        }
                    }
                }
                _ -> {
                    False
                }
            }
        }
        _ -> {
            False
        }
    }
}

pub fn closure5(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = word_glyph_32(v0)
        case v1 {
            True -> {
                True
            }
            False -> {
                let v2 = v0 == "@"
                v2
            }
        }
    }
}

pub fn mention_after_30(v0: String, v1: ListString, v2: ListString) -> Bool {
    let v3 = 0
    let #(v4, v5) = word_length_31(v2, v3)
    let v6 = mention_quiet_33(v0)
    let v8 =
        case v6 {
            True -> {
                True
            }
            False -> {
                rt_before_34(v1)
            }
        }
    let v10 =
        case v8 {
            True -> {
                let v9 = v4 >= 1
                v9
            }
            False -> {
                False
            }
        }
    let v12 =
        case v10 {
            True -> {
                let v11 = v4 <= 15
                v11
            }
            False -> {
                False
            }
        }
    case v12 {
        True -> {
            let v13 = closure5(Nil)
            let v14 = first_is_37(v13, v5)
            let v15 = v14 == False
            v15
        }
        False -> {
            False
        }
    }
}

pub fn wide_letter_40(v0: String) -> Bool {
    let v1 = ascii_letter_6(v0)
    case v1 {
        True -> {
            True
        }
        False -> {
            let v2 = ascii_of_7(v0)
            let v3 = v2 > 127
            v3
        }
    }
}

pub fn tag_has_letter_39(v0: ListString) -> Bool {
    case v0  {
        ListStringCons(v1, v2) -> {
            let v3 = word_glyph_32(v1)
            let v5 =
                case v3 {
                    True -> {
                        True
                    }
                    False -> {
                        wide_letter_40(v1)
                    }
                }
            case v5 {
                True -> {
                    let v6 = wide_letter_40(v1)
                    case v6 {
                        True -> {
                            True
                        }
                        False -> {
                            tag_has_letter_39(v2)
                        }
                    }
                }
                False -> {
                    False
                }
            }
        }
        _ -> {
            False
        }
    }
}

pub fn hashtag_after_38(v0: String, v1: ListString) -> Bool {
    let v2 = word_glyph_32(v0)
    let v4 =
        case v2 {
            True -> {
                True
            }
            False -> {
                let v3 = v0 == "&"
                v3
            }
        }
    let v6 =
        case v4 {
            True -> {
                True
            }
            False -> {
                let v5 = v0 == "#"
                v5
            }
        }
    let v7 = v6 == False
    case v7 {
        True -> {
            tag_has_letter_39(v1)
        }
        False -> {
            False
        }
    }
}

pub fn letters_length_42(v0: ListString, v1: Int) -> #(Int, ListString) {
    case v0  {
        ListStringCons(v2, v3) -> {
            let v4 = ascii_letter_6(v2)
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v1 + 1, 32)
                    letters_length_42(v3, v5)
                }
                False -> {
                    #(v1, v0)
                }
            }
        }
        _ -> {
            #(v1, v0)
        }
    }
}

pub fn cash_quiet_43(v0: String) -> Bool {
    let v1 = word_glyph_32(v0)
    let v3 =
        case v1 {
            True -> {
                True
            }
            False -> {
                wide_letter_40(v0)
            }
        }
    let v5 =
        case v3 {
            True -> {
                True
            }
            False -> {
                let v4 = v0 == "$"
                v4
            }
        }
    let v6 = v5 == False
    v6
}

pub fn closure6(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = word_glyph_32(v0)
        case v1 {
            True -> {
                True
            }
            False -> {
                wide_letter_40(v0)
            }
        }
    }
}

pub fn suffix_ok_44(v0: ListString) -> ListString {
    case v0  {
        ListStringCons(v1, v2) -> {
            let v3 = v1 == "."
            let v5 =
                case v3 {
                    True -> {
                        True
                    }
                    False -> {
                        let v4 = v1 == "_"
                        v4
                    }
                }
            case v5 {
                True -> {
                    let v6 = 0
                    let #(v7, v8) = letters_length_42(v2, v6)
                    let v9 = v7 >= 1
                    let v11 =
                        case v9 {
                            True -> {
                                let v10 = v7 <= 2
                                v10
                            }
                            False -> {
                                False
                            }
                        }
                    case v11 {
                        True -> {
                            v8
                        }
                        False -> {
                            v0
                        }
                    }
                }
                False -> {
                    v0
                }
            }
        }
        _ -> {
            v0
        }
    }
}

pub fn cashtag_after_41(v0: String, v1: ListString) -> Bool {
    let v2 = 0
    let #(v3, v4) = letters_length_42(v1, v2)
    let v5 = cash_quiet_43(v0)
    let v7 =
        case v5 {
            True -> {
                let v6 = v3 >= 1
                v6
            }
            False -> {
                False
            }
        }
    let v9 =
        case v7 {
            True -> {
                let v8 = v3 <= 6
                v8
            }
            False -> {
                False
            }
        }
    case v9 {
        True -> {
            let v10 = closure6(Nil)
            let v11 = suffix_ok_44(v4)
            let v12 = first_is_37(v10, v11)
            let v13 = v12 == False
            v13
        }
        False -> {
            False
        }
    }
}

pub fn tags_29(v0: String, v1: ListString, v2: String, v3: ListString) -> Bool {
    let v4 = v2 == "@"
    let v6 =
        case v4 {
            True -> {
                mention_after_30(v0, v1, v3)
            }
            False -> {
                False
            }
        }
    let v10 =
        case v6 {
            True -> {
                True
            }
            False -> {
                let v7 = v2 == "#"
                case v7 {
                    True -> {
                        hashtag_after_38(v0, v3)
                    }
                    False -> {
                        False
                    }
                }
            }
        }
    case v10 {
        True -> {
            True
        }
        False -> {
            let v11 = v2 == "$"
            case v11 {
                True -> {
                    cashtag_after_41(v0, v3)
                }
                False -> {
                    False
                }
            }
        }
    }
}

pub fn entities_from_28(v0: String, v1: ListString, v2: ListString) -> ListString {
    case v1  {
        ListStringCons(v3, v4) -> {
            let v5 = tags_29(v0, v2, v3, v4)
            case v5 {
                True -> {
                    let v6 = unicode_erlang_characters_to_binary([8203])
                    let v7 = ListStringCons(v3, v2)
                    let v8 = ListStringCons(v6, v7)
                    entities_from_28(v3, v4, v8)
                }
                False -> {
                    let v10 = ListStringCons(v3, v2)
                    entities_from_28(v3, v4, v10)
                }
            }
        }
        ListStringNil -> {
            let v13 = ListStringNil
            method10(v2, v13)
        }
    }
}

pub fn defused_entities_27(v0: String) -> String {
    let v1 = ""
    let v2 = string.to_graphemes(v0)
    let v3 = v2 |> list.reverse
    let v4 = ListStringNil
    let listm_fold = v3 |> list.fold (v4, fn (acc, x) {
    let v5 = x
    let v6 = acc
    let v7 = ListStringCons(v5, v6)
    v7
    })
    let v8 = listm_fold
    let v9 = ListStringNil
    let v10 = entities_from_28(v1, v8, v9)
    concat_balanced_22(v1, v10)
}

pub fn glued_47(v0: ListString, v1: ListString) -> ListString {
    case v0  {
        ListStringCons(v2, v3) -> {
            case v3  {
                ListStringCons(v4, v5) -> {
                    let v6 = unicode_erlang_characters_to_binary([8203])
                    let v7 = v2 == v6
                    case v7 {
                        True -> {
                            let v8 = v2 <> v4 
                            let v9 = ListStringCons(v8, v1)
                            glued_47(v5, v9)
                        }
                        False -> {
                            let v11 = ListStringCons(v2, v1)
                            glued_47(v3, v11)
                        }
                    }
                }
                _ -> {
                    let v14 = ListStringCons(v2, v1)
                    glued_47(v3, v14)
                }
            }
        }
        ListStringNil -> {
            let v17 = ListStringNil
            method10(v1, v17)
        }
    }
}

pub fn method49(v0: Uh3, v1: Int) -> Int {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = v2 <= 4351
            let v8 =
                case v4 {
                    True -> {
                        True
                    }
                    False -> {
                        let v5 = v2 >= 8192
                        case v5 {
                            True -> {
                                let v6 = v2 <= 8205
                                v6
                            }
                            False -> {
                                False
                            }
                        }
                    }
                }
            let v12 =
                case v8 {
                    True -> {
                        True
                    }
                    False -> {
                        let v9 = v2 >= 8208
                        case v9 {
                            True -> {
                                let v10 = v2 <= 8223
                                v10
                            }
                            False -> {
                                False
                            }
                        }
                    }
                }
            let v16 =
                case v12 {
                    True -> {
                        True
                    }
                    False -> {
                        let v13 = v2 >= 8242
                        case v13 {
                            True -> {
                                let v14 = v2 <= 8247
                                v14
                            }
                            False -> {
                                False
                            }
                        }
                    }
                }
            let v17 =
                case v16 {
                    True -> {
                        1
                    }
                    False -> {
                        2
                    }
                }
            let v18 = spiral_wrap_signed(v1 + v17, 32)
            method49(v3, v18)
        }
        Uh3Nil -> {
            v1
        }
    }
}
