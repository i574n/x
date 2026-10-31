import gleam/bit_array
import gleam/list
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh13, type Uh30, Uh13Cons, Uh13Nil, Uh30Cons, Uh30Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some}
import xsim_frames/part1.{closure1, method4, spiral_string_length, spiral_wrap_signed, unicode_erlang_characters_to_binary}
import xsim_frames/part15.{after_label_323, ascii_letter_311, ascii_of_312, blocks_domain_320, label_before_326, label_glyph_310, letters_after_325, pieces_from_308}
import xsim_frames/part2.{concat_balanced_22, method18}

pub fn tld_ok_327(v0: fn(String) -> Bool, v1: String, v2: String) -> Bool {
    let v3 = spiral_string_length(v2)
    let v4 = v3 >= 2
    let v6 =
        case v4 {
            True -> {
                let v5 = v3 <= 63
                v5
            }
            False -> False
        }
    let v8 =
        case v6 {
            True -> v0(v2)
            False -> False
        }
    case v8 {
        True -> {
            let v9 = v3 != 2
            case v9 {
                True -> True
                False -> {
                    let v10 = spiral_string_length(v1)
                    let v11 = v10 > 2
                    v11
                }
            }
        }
        False -> False
    }
}

pub fn linked_dot_324(v0: fn(String) -> Bool, v1: Uh3, v2: Uh3) -> Bool {
    let v3 = Uh3Nil
    let #(v4, v5) = letters_after_325(v2, v3)
    let v6 = Uh3Nil
    let v7 = label_before_326(v1, v6)
    case v5 {
        True -> {
            let v8 = tld_ok_327(v0, v7, v4)
            case v8 {
                True -> True
                False -> {
                    let v9 = v7 == "t"
                    case v9 {
                        True -> {
                            let v10 = v4 == "co"
                            v10
                        }
                        False -> False
                    }
                }
            }
        }
        False -> False
    }
}

pub fn defusable_322(v0: fn(String) -> Bool, v1: Uh3, v2: String, v3: Uh3) -> Bool {
    let v4 = v2 == "."
    let v6 =
        case v4 {
            True -> after_label_323(v1)
            False -> False
        }
    case v6 {
        True -> linked_dot_324(v0, v1, v3)
        False -> False
    }
}

pub fn defused_run_321(v0: fn(String) -> Bool, v1: Uh3, v2: Uh3, v3: Uh3) -> Uh3 {
    case v2  {
        Uh3Cons(v4, v5) -> {
            let v6 = Uh3Cons(v4, v1)
            let v7 = defusable_322(v0, v1, v4, v5)
            let v10 =
                case v7 {
                    True -> {
                        let v8 = unicode_erlang_characters_to_binary([8203])
                        Uh3Cons(v8, v3)
                    }
                    False -> v3
                }
            let v11 = Uh3Cons(v4, v10)
            defused_run_321(v0, v6, v5, v11)
        }
        Uh3Nil -> {
            let v13 = Uh3Nil
            method4(v3, v13)
        }
    }
}

pub fn run_text_319(v0: fn(String) -> Bool, v1: String, v2: Uh3) -> Uh3 {
    let v3 = blocks_domain_320(v1)
    case v3 {
        True -> v2
        False -> {
            let v4 = Uh3Nil
            let v5 = Uh3Nil
            defused_run_321(v0, v4, v2, v5)
        }
    }
}

pub fn method318(v0: fn(String) -> Bool, v1: Uh30, v2: Uh3) -> Uh3 {
    case v1  {
        Uh30Cons(v3, v4, v5) -> {
            let v6 = method318(v0, v5, v2)
            let v7 = run_text_319(v0, v3, v4)
            method18(v7, v6)
        }
        Uh30Nil -> v2
    }
}

pub fn defused_dots_by_307(v0: fn(String) -> Bool, v1: String) -> String {
    let v2 = ""
    let v3 = string.to_graphemes(v1)
    let v4 = v3 |> list.reverse
    let v5 = Uh3Nil
    let listm_fold = v4 |> list.fold (v5, fn (acc, x) {
    let v6 = x
    let v7 = acc
    let v8 = Uh3Cons(v6, v7)
    v8
    })
    let v9 = listm_fold
    let v10 = Uh30Nil
    let v11 = pieces_from_308(v2, v9, v10)
    let v12 = Uh3Nil
    let v13 = method318(v0, v11, v12)
    concat_balanced_22(v2, v13)
}

pub fn word_glyph_333(v0: String) -> Bool {
    let v1 = label_glyph_310(v0)
    case v1 {
        True -> {
            let v2 = v0 != "-"
            v2
        }
        False -> False
    }
}

pub fn word_length_332(v0: Uh3, v1: Int) -> #(Int, Uh3) {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = word_glyph_333(v2)
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v1 + 1, 32)
                    word_length_332(v3, v5)
                }
                False -> #(v1, v0)
            }
        }
        _ -> #(v1, v0)
    }
}

pub fn mention_quiet_334(v0: String) -> Bool {
    let v1 = word_glyph_333(v0)
    let v18 =
        case v1 {
            True -> True
            False -> {
                let v2 = spiral_string_length(v0)
                let v3 = v2 == 1
                case v3 {
                    True -> {
                        let v4 = v0 == ""
                        let v15 =
                            case v4 {
                                True -> 0
                                False -> {
                                    let v5 = "!#$%&*@"
                                    let v6 = option.from_result(result.map(string.split_once(v5, v0), pair.first))
                                    let v7 = closure1(Nil)
                                    let v8 = v6 |> option.map(v7)
                                    let v9 = Us2None
                                    let v10 = v8 |> option.unwrap(v9)
                                    case v10  {
                                        Us2None -> -1
                                        Us2Some(v11) -> {
                                            let v12 = bit_array.byte_size(bit_array.from_string(v11))
                                            v12
                                        }
                                    }
                                }
                            }
                        let v16 = v15 >= 0
                        v16
                    }
                    False -> False
                }
            }
        }
    let v20 =
        case v18 {
            True -> True
            False -> {
                let v19 = v0 == "＠"
                v19
            }
        }
    let v21 = v20 == False
    v21
}

pub fn rt_letters_336(v0: String, v1: String) -> Bool {
    let v2 = spiral_string_length(v0)
    let v3 = v2 == 1
    let v17 =
        case v3 {
            True -> {
                let v4 = v0 == ""
                let v15 =
                    case v4 {
                        True -> 0
                        False -> {
                            let v5 = "tT"
                            let v6 = option.from_result(result.map(string.split_once(v5, v0), pair.first))
                            let v7 = closure1(Nil)
                            let v8 = v6 |> option.map(v7)
                            let v9 = Us2None
                            let v10 = v8 |> option.unwrap(v9)
                            case v10  {
                                Us2None -> -1
                                Us2Some(v11) -> {
                                    let v12 = bit_array.byte_size(bit_array.from_string(v11))
                                    v12
                                }
                            }
                        }
                    }
                let v16 = v15 >= 0
                v16
            }
            False -> False
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
                            True -> 0
                            False -> {
                                let v21 = "rR"
                                let v22 = option.from_result(result.map(string.split_once(v21, v1), pair.first))
                                let v23 = closure1(Nil)
                                let v24 = v22 |> option.map(v23)
                                let v25 = Us2None
                                let v26 = v24 |> option.unwrap(v25)
                                case v26  {
                                    Us2None -> -1
                                    Us2Some(v27) -> {
                                        let v28 = bit_array.byte_size(bit_array.from_string(v27))
                                        v28
                                    }
                                }
                            }
                        }
                    let v32 = v31 >= 0
                    v32
                }
                False -> False
            }
        }
        False -> False
    }
}

pub fn closure97(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = label_glyph_310(v0)
        case v1 {
            True -> True
            False -> {
                let v2 = spiral_string_length(v0)
                let v3 = v2 == 1
                case v3 {
                    True -> {
                        let v4 = v0 == ""
                        let v15 =
                            case v4 {
                                True -> 0
                                False -> {
                                    let v5 = "+~."
                                    let v6 = option.from_result(result.map(string.split_once(v5, v0), pair.first))
                                    let v7 = closure1(Nil)
                                    let v8 = v6 |> option.map(v7)
                                    let v9 = Us2None
                                    let v10 = v8 |> option.unwrap(v9)
                                    case v10  {
                                        Us2None -> -1
                                        Us2Some(v11) -> {
                                            let v12 = bit_array.byte_size(bit_array.from_string(v11))
                                            v12
                                        }
                                    }
                                }
                            }
                        let v16 = v15 >= 0
                        v16
                    }
                    False -> False
                }
            }
        }
    }
}

pub fn first_is_338(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> v0(v2)
        Uh3Nil -> False
    }
}

pub fn rt_boundary_337(v0: Uh3) -> Bool {
    let v1 = closure97(Nil)
    let v2 = first_is_338(v1, v0)
    let v3 = v2 == False
    v3
}

pub fn rt_before_335(v0: Uh3) -> Bool {
    case v0  {
        Uh3Cons(v1, v2) -> {
            case v2  {
                Uh3Cons(v3, v4) -> {
                    case v4  {
                        Uh3Cons(v5, v6) -> {
                            let v7 = v1 == ":"
                            let v9 =
                                case v7 {
                                    True -> rt_letters_336(v3, v5)
                                    False -> False
                                }
                            case v9 {
                                True -> rt_boundary_337(v6)
                                False -> {
                                    let v11 = rt_letters_336(v1, v3)
                                    case v11 {
                                        True -> rt_boundary_337(v4)
                                        False -> False
                                    }
                                }
                            }
                        }
                        _ -> {
                            let v15 = rt_letters_336(v1, v3)
                            case v15 {
                                True -> rt_boundary_337(v4)
                                False -> False
                            }
                        }
                    }
                }
                _ -> False
            }
        }
        _ -> False
    }
}

pub fn closure98(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = word_glyph_333(v0)
        case v1 {
            True -> True
            False -> {
                let v2 = v0 == "@"
                v2
            }
        }
    }
}

pub fn mention_after_331(v0: String, v1: Uh3, v2: Uh3) -> Bool {
    let v3 = 0
    let #(v4, v5) = word_length_332(v2, v3)
    let v6 = mention_quiet_334(v0)
    let v8 =
        case v6 {
            True -> True
            False -> rt_before_335(v1)
        }
    let v10 =
        case v8 {
            True -> {
                let v9 = v4 >= 1
                v9
            }
            False -> False
        }
    let v12 =
        case v10 {
            True -> {
                let v11 = v4 <= 15
                v11
            }
            False -> False
        }
    case v12 {
        True -> {
            let v13 = closure98(Nil)
            let v14 = first_is_338(v13, v5)
            let v15 = v14 == False
            v15
        }
        False -> False
    }
}

pub fn wide_letter_341(v0: String) -> Bool {
    let v1 = ascii_letter_311(v0)
    case v1 {
        True -> True
        False -> {
            let v2 = ascii_of_312(v0)
            let v3 = v2 > 127
            v3
        }
    }
}

pub fn tag_has_letter_340(v0: Uh3) -> Bool {
    case v0  {
        Uh3Cons(v1, v2) -> {
            let v3 = word_glyph_333(v1)
            let v5 =
                case v3 {
                    True -> True
                    False -> wide_letter_341(v1)
                }
            case v5 {
                True -> {
                    let v6 = wide_letter_341(v1)
                    case v6 {
                        True -> True
                        False -> tag_has_letter_340(v2)
                    }
                }
                False -> False
            }
        }
        _ -> False
    }
}

pub fn hashtag_after_339(v0: String, v1: Uh3) -> Bool {
    let v2 = word_glyph_333(v0)
    let v4 =
        case v2 {
            True -> True
            False -> {
                let v3 = v0 == "&"
                v3
            }
        }
    let v6 =
        case v4 {
            True -> True
            False -> {
                let v5 = v0 == "#"
                v5
            }
        }
    let v7 = v6 == False
    case v7 {
        True -> tag_has_letter_340(v1)
        False -> False
    }
}

pub fn letters_length_343(v0: Uh3, v1: Int) -> #(Int, Uh3) {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = ascii_letter_311(v2)
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v1 + 1, 32)
                    letters_length_343(v3, v5)
                }
                False -> #(v1, v0)
            }
        }
        _ -> #(v1, v0)
    }
}

pub fn cash_quiet_344(v0: String) -> Bool {
    let v1 = word_glyph_333(v0)
    let v3 =
        case v1 {
            True -> True
            False -> wide_letter_341(v0)
        }
    let v5 =
        case v3 {
            True -> True
            False -> {
                let v4 = v0 == "$"
                v4
            }
        }
    let v6 = v5 == False
    v6
}

pub fn closure99(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = word_glyph_333(v0)
        case v1 {
            True -> True
            False -> wide_letter_341(v0)
        }
    }
}

pub fn suffix_ok_345(v0: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v1, v2) -> {
            let v3 = v1 == "."
            let v5 =
                case v3 {
                    True -> True
                    False -> {
                        let v4 = v1 == "_"
                        v4
                    }
                }
            case v5 {
                True -> {
                    let v6 = 0
                    let #(v7, v8) = letters_length_343(v2, v6)
                    let v9 = v7 >= 1
                    let v11 =
                        case v9 {
                            True -> {
                                let v10 = v7 <= 2
                                v10
                            }
                            False -> False
                        }
                    case v11 {
                        True -> v8
                        False -> v0
                    }
                }
                False -> v0
            }
        }
        _ -> v0
    }
}

pub fn cashtag_after_342(v0: String, v1: Uh3) -> Bool {
    let v2 = 0
    let #(v3, v4) = letters_length_343(v1, v2)
    let v5 = cash_quiet_344(v0)
    let v7 =
        case v5 {
            True -> {
                let v6 = v3 >= 1
                v6
            }
            False -> False
        }
    let v9 =
        case v7 {
            True -> {
                let v8 = v3 <= 6
                v8
            }
            False -> False
        }
    case v9 {
        True -> {
            let v10 = closure99(Nil)
            let v11 = suffix_ok_345(v4)
            let v12 = first_is_338(v10, v11)
            let v13 = v12 == False
            v13
        }
        False -> False
    }
}

pub fn tags_330(v0: String, v1: Uh3, v2: String, v3: Uh3) -> Bool {
    let v4 = v2 == "@"
    let v6 =
        case v4 {
            True -> mention_after_331(v0, v1, v3)
            False -> False
        }
    let v10 =
        case v6 {
            True -> True
            False -> {
                let v7 = v2 == "#"
                case v7 {
                    True -> hashtag_after_339(v0, v3)
                    False -> False
                }
            }
        }
    case v10 {
        True -> True
        False -> {
            let v11 = v2 == "$"
            case v11 {
                True -> cashtag_after_342(v0, v3)
                False -> False
            }
        }
    }
}

pub fn entities_from_329(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = tags_330(v0, v2, v3, v4)
            case v5 {
                True -> {
                    let v6 = unicode_erlang_characters_to_binary([8203])
                    let v7 = Uh3Cons(v3, v2)
                    let v8 = Uh3Cons(v6, v7)
                    entities_from_329(v3, v4, v8)
                }
                False -> {
                    let v10 = Uh3Cons(v3, v2)
                    entities_from_329(v3, v4, v10)
                }
            }
        }
        Uh3Nil -> {
            let v13 = Uh3Nil
            method4(v2, v13)
        }
    }
}

pub fn defused_entities_328(v0: String) -> String {
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
    let v9 = Uh3Nil
    let v10 = entities_from_329(v1, v8, v9)
    concat_balanced_22(v1, v10)
}

pub fn glued_348(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            case v3  {
                Uh3Cons(v4, v5) -> {
                    let v6 = unicode_erlang_characters_to_binary([8203])
                    let v7 = v2 == v6
                    case v7 {
                        True -> {
                            let v8 = v2 <> v4 
                            let v9 = Uh3Cons(v8, v1)
                            glued_348(v5, v9)
                        }
                        False -> {
                            let v11 = Uh3Cons(v2, v1)
                            glued_348(v3, v11)
                        }
                    }
                }
                _ -> {
                    let v14 = Uh3Cons(v2, v1)
                    glued_348(v3, v14)
                }
            }
        }
        Uh3Nil -> {
            let v17 = Uh3Nil
            method4(v1, v17)
        }
    }
}

pub fn method350(v0: Uh13, v1: Int) -> Int {
    case v0  {
        Uh13Cons(v2, v3) -> {
            let v4 = v2 <= 4351
            let v8 =
                case v4 {
                    True -> True
                    False -> {
                        let v5 = v2 >= 8192
                        case v5 {
                            True -> {
                                let v6 = v2 <= 8205
                                v6
                            }
                            False -> False
                        }
                    }
                }
            let v12 =
                case v8 {
                    True -> True
                    False -> {
                        let v9 = v2 >= 8208
                        case v9 {
                            True -> {
                                let v10 = v2 <= 8223
                                v10
                            }
                            False -> False
                        }
                    }
                }
            let v16 =
                case v12 {
                    True -> True
                    False -> {
                        let v13 = v2 >= 8242
                        case v13 {
                            True -> {
                                let v14 = v2 <= 8247
                                v14
                            }
                            False -> False
                        }
                    }
                }
            let v17 =
                case v16 {
                    True -> 1
                    False -> 2
                }
            let v18 = spiral_wrap_signed(v1 + v17, 32)
            method350(v3, v18)
        }
        Uh13Nil -> v1
    }
}
