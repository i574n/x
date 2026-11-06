import gleam/bit_array
import gleam/list
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh14, type Us79, type Uh31, type Uh32, Uh14Cons, Uh14Nil, Uh31Cons, Uh31Nil, Uh32Cons, Uh32Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us79OnBluesky, Us79OnMastodon, Us79OnX}
import xsim_frames/part1.{closure1, method18, method4, spiral_string_length, spiral_string_slice, spiral_wrap_signed, unicode_erlang_characters_to_binary}
import xsim_frames/part14.{ascii_letter_317, ascii_of_318, blocks_domain_326, closure95, defusable_328, label_glyph_316, pieces_from_314}
import xsim_frames/part2.{concat_balanced_22}
import xsim_frames/part6.{method166, method167}

pub fn defused_run_327(v0: fn(String) -> Bool, v1: Uh3, v2: Uh3, v3: Uh3) -> Uh3 {
    case v2  {
        Uh3Cons(v4, v5) -> {
            let v6 = Uh3Cons(v4, v1)
            let v7 = defusable_328(v0, v1, v4, v5)
            let v10 =
                case v7 {
                    True -> {
                        let v8 = unicode_erlang_characters_to_binary([8203])
                        Uh3Cons(v8, v3)
                    }
                    False -> v3
                }
            let v11 = Uh3Cons(v4, v10)
            defused_run_327(v0, v6, v5, v11)
        }
        Uh3Nil -> {
            method4(v3, Uh3Nil)
        }
    }
}

pub fn run_text_325(v0: fn(String) -> Bool, v1: String, v2: Uh3) -> Uh3 {
    let v3 = blocks_domain_326(v1)
    case v3 {
        True -> v2
        False -> {
            defused_run_327(v0, Uh3Nil, v2, Uh3Nil)
        }
    }
}

pub fn method324(v0: fn(String) -> Bool, v1: Uh31, v2: Uh3) -> Uh3 {
    case v1  {
        Uh31Cons(v3, v4, v5) -> {
            let v6 = method324(v0, v5, v2)
            let v7 = run_text_325(v0, v3, v4)
            method18(v7, v6)
        }
        Uh31Nil -> v2
    }
}

pub fn defused_dots_by_313(v0: fn(String) -> Bool, v1: String) -> String {
    let v2 = ""
    let v3 = string.to_graphemes(v1)
    let v4 = v3 |> list.reverse
    let listm_fold = v4 |> list.fold (Uh3Nil, fn (acc, x) {
    let v6 = x
    let v7 = acc
    Uh3Cons(v6, v7)
    })
    let v9 = listm_fold
    let v11 = pieces_from_314(v2, v9, Uh31Nil)
    let v13 = method324(v0, v11, Uh3Nil)
    concat_balanced_22(v2, v13)
}

pub fn word_glyph_339(v0: String) -> Bool {
    let v1 = label_glyph_316(v0)
    case v1 {
        True -> {
            v0 != "-"
        }
        False -> False
    }
}

pub fn word_length_338(v0: Uh3, v1: Int) -> #(Int, Uh3) {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = word_glyph_339(v2)
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v1 + 1, 32)
                    word_length_338(v3, v5)
                }
                False -> #(v1, v0)
            }
        }
        _ -> #(v1, v0)
    }
}

pub fn mention_quiet_340(v0: String) -> Bool {
    let v1 = word_glyph_339(v0)
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
                                    let v6 = option.from_result(result.map(string.split_once("!#$%&*@", v0), pair.first))
                                    let v7 = closure1(Nil)
                                    let v8 = v6 |> option.map(v7)
                                    let v10 = v8 |> option.unwrap(Us2None)
                                    case v10  {
                                        Us2None -> -1
                                        Us2Some(v11) -> {
                                            bit_array.byte_size(bit_array.from_string(v11))
                                        }
                                    }
                                }
                            }
                        v15 >= 0
                    }
                    False -> False
                }
            }
        }
    let v20 =
        case v18 {
            True -> True
            False -> {
                v0 == "＠"
            }
        }
    v20 == False
}

pub fn rt_letters_342(v0: String, v1: String) -> Bool {
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
                            let v6 = option.from_result(result.map(string.split_once("tT", v0), pair.first))
                            let v7 = closure1(Nil)
                            let v8 = v6 |> option.map(v7)
                            let v10 = v8 |> option.unwrap(Us2None)
                            case v10  {
                                Us2None -> -1
                                Us2Some(v11) -> {
                                    bit_array.byte_size(bit_array.from_string(v11))
                                }
                            }
                        }
                    }
                v15 >= 0
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
                                let v22 = option.from_result(result.map(string.split_once("rR", v1), pair.first))
                                let v23 = closure1(Nil)
                                let v24 = v22 |> option.map(v23)
                                let v26 = v24 |> option.unwrap(Us2None)
                                case v26  {
                                    Us2None -> -1
                                    Us2Some(v27) -> {
                                        bit_array.byte_size(bit_array.from_string(v27))
                                    }
                                }
                            }
                        }
                    v31 >= 0
                }
                False -> False
            }
        }
        False -> False
    }
}

pub fn closure96(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = label_glyph_316(v0)
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
                                    let v6 = option.from_result(result.map(string.split_once("+~.", v0), pair.first))
                                    let v7 = closure1(Nil)
                                    let v8 = v6 |> option.map(v7)
                                    let v10 = v8 |> option.unwrap(Us2None)
                                    case v10  {
                                        Us2None -> -1
                                        Us2Some(v11) -> {
                                            bit_array.byte_size(bit_array.from_string(v11))
                                        }
                                    }
                                }
                            }
                        v15 >= 0
                    }
                    False -> False
                }
            }
        }
    }
}

pub fn first_is_344(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> v0(v2)
        Uh3Nil -> False
    }
}

pub fn rt_boundary_343(v0: Uh3) -> Bool {
    let v1 = closure96(Nil)
    let v2 = first_is_344(v1, v0)
    v2 == False
}

pub fn rt_before_341(v0: Uh3) -> Bool {
    case v0  {
        Uh3Cons(v1, v2) -> {
            case v2  {
                Uh3Cons(v3, v4) -> {
                    case v4  {
                        Uh3Cons(v5, v6) -> {
                            let v7 = v1 == ":"
                            let v9 =
                                case v7 {
                                    True -> rt_letters_342(v3, v5)
                                    False -> False
                                }
                            case v9 {
                                True -> rt_boundary_343(v6)
                                False -> {
                                    let v11 = rt_letters_342(v1, v3)
                                    case v11 {
                                        True -> rt_boundary_343(v4)
                                        False -> False
                                    }
                                }
                            }
                        }
                        _ -> {
                            let v15 = rt_letters_342(v1, v3)
                            case v15 {
                                True -> rt_boundary_343(v4)
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

pub fn closure97(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = word_glyph_339(v0)
        case v1 {
            True -> True
            False -> {
                v0 == "@"
            }
        }
    }
}

pub fn mention_after_337(v0: String, v1: Uh3, v2: Uh3) -> Bool {
    let #(v4, v5) = word_length_338(v2, 0)
    let v6 = mention_quiet_340(v0)
    let v8 =
        case v6 {
            True -> True
            False -> rt_before_341(v1)
        }
    let v10 =
        case v8 {
            True -> {
                v4 >= 1
            }
            False -> False
        }
    let v12 =
        case v10 {
            True -> {
                v4 <= 15
            }
            False -> False
        }
    case v12 {
        True -> {
            let v13 = closure97(Nil)
            let v14 = first_is_344(v13, v5)
            v14 == False
        }
        False -> False
    }
}

pub fn wide_letter_347(v0: String) -> Bool {
    let v1 = ascii_letter_317(v0)
    case v1 {
        True -> True
        False -> {
            let v2 = ascii_of_318(v0)
            v2 > 127
        }
    }
}

pub fn tag_has_letter_346(v0: Uh3) -> Bool {
    case v0  {
        Uh3Cons(v1, v2) -> {
            let v3 = word_glyph_339(v1)
            let v5 =
                case v3 {
                    True -> True
                    False -> wide_letter_347(v1)
                }
            case v5 {
                True -> {
                    let v6 = wide_letter_347(v1)
                    case v6 {
                        True -> True
                        False -> tag_has_letter_346(v2)
                    }
                }
                False -> False
            }
        }
        _ -> False
    }
}

pub fn hashtag_after_345(v0: String, v1: Uh3) -> Bool {
    let v2 = word_glyph_339(v0)
    let v4 =
        case v2 {
            True -> True
            False -> {
                v0 == "&"
            }
        }
    let v6 =
        case v4 {
            True -> True
            False -> {
                v0 == "#"
            }
        }
    let v7 = v6 == False
    case v7 {
        True -> tag_has_letter_346(v1)
        False -> False
    }
}

pub fn letters_length_349(v0: Uh3, v1: Int) -> #(Int, Uh3) {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = ascii_letter_317(v2)
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v1 + 1, 32)
                    letters_length_349(v3, v5)
                }
                False -> #(v1, v0)
            }
        }
        _ -> #(v1, v0)
    }
}

pub fn cash_quiet_350(v0: String) -> Bool {
    let v1 = word_glyph_339(v0)
    let v3 =
        case v1 {
            True -> True
            False -> wide_letter_347(v0)
        }
    let v5 =
        case v3 {
            True -> True
            False -> {
                v0 == "$"
            }
        }
    v5 == False
}

pub fn closure98(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = word_glyph_339(v0)
        case v1 {
            True -> True
            False -> wide_letter_347(v0)
        }
    }
}

pub fn suffix_ok_351(v0: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v1, v2) -> {
            let v3 = v1 == "."
            let v5 =
                case v3 {
                    True -> True
                    False -> {
                        v1 == "_"
                    }
                }
            case v5 {
                True -> {
                    let #(v7, v8) = letters_length_349(v2, 0)
                    let v9 = v7 >= 1
                    let v11 =
                        case v9 {
                            True -> {
                                v7 <= 2
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

pub fn cashtag_after_348(v0: String, v1: Uh3) -> Bool {
    let #(v3, v4) = letters_length_349(v1, 0)
    let v5 = cash_quiet_350(v0)
    let v7 =
        case v5 {
            True -> {
                v3 >= 1
            }
            False -> False
        }
    let v9 =
        case v7 {
            True -> {
                v3 <= 6
            }
            False -> False
        }
    case v9 {
        True -> {
            let v10 = closure98(Nil)
            let v11 = suffix_ok_351(v4)
            let v12 = first_is_344(v10, v11)
            v12 == False
        }
        False -> False
    }
}

pub fn tags_336(v0: String, v1: Uh3, v2: String, v3: Uh3) -> Bool {
    let v4 = v2 == "@"
    let v6 =
        case v4 {
            True -> mention_after_337(v0, v1, v3)
            False -> False
        }
    let v10 =
        case v6 {
            True -> True
            False -> {
                let v7 = v2 == "#"
                case v7 {
                    True -> hashtag_after_345(v0, v3)
                    False -> False
                }
            }
        }
    case v10 {
        True -> True
        False -> {
            let v11 = v2 == "$"
            case v11 {
                True -> cashtag_after_348(v0, v3)
                False -> False
            }
        }
    }
}

pub fn entities_from_335(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = tags_336(v0, v2, v3, v4)
            case v5 {
                True -> {
                    let v6 = unicode_erlang_characters_to_binary([8203])
                    let v7 = Uh3Cons(v3, v2)
                    let v8 = Uh3Cons(v6, v7)
                    entities_from_335(v3, v4, v8)
                }
                False -> {
                    let v10 = Uh3Cons(v3, v2)
                    entities_from_335(v3, v4, v10)
                }
            }
        }
        Uh3Nil -> {
            method4(v2, Uh3Nil)
        }
    }
}

pub fn defused_entities_334(v0: String) -> String {
    let v1 = ""
    let v2 = string.to_graphemes(v0)
    let v3 = v2 |> list.reverse
    let listm_fold = v3 |> list.fold (Uh3Nil, fn (acc, x) {
    let v5 = x
    let v6 = acc
    Uh3Cons(v5, v6)
    })
    let v8 = listm_fold
    let v10 = entities_from_335(v1, v8, Uh3Nil)
    concat_balanced_22(v1, v10)
}

pub fn glued_354(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            case v3  {
                Uh3Cons(v4, v5) -> {
                    let v6 = unicode_erlang_characters_to_binary([8203])
                    let v7 = v2 == v6
                    case v7 {
                        True -> {
                            let v8 = { v2 } <> { v4 }
                            let v9 = Uh3Cons(v8, v1)
                            glued_354(v5, v9)
                        }
                        False -> {
                            let v11 = Uh3Cons(v2, v1)
                            glued_354(v3, v11)
                        }
                    }
                }
                _ -> {
                    let v14 = Uh3Cons(v2, v1)
                    glued_354(v3, v14)
                }
            }
        }
        Uh3Nil -> {
            method4(v1, Uh3Nil)
        }
    }
}

pub fn method356(v0: Uh14, v1: Int) -> Int {
    case v0  {
        Uh14Cons(v2, v3) -> {
            let v4 = v2 <= 4351
            let v8 =
                case v4 {
                    True -> True
                    False -> {
                        let v5 = v2 >= 8192
                        case v5 {
                            True -> {
                                v2 <= 8205
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
                                v2 <= 8223
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
                                v2 <= 8247
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
            method356(v3, v18)
        }
        Uh14Nil -> v1
    }
}

pub fn method355(v0: Us79, v1: Uh3, v2: Uh32) -> Uh32 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method355(v0, v4, v2)
            let #(v88, v89) =
                case v0  {
                    Us79OnX -> {
                        let v6 = option.from_result(result.map(list.first(string.to_utf_codepoints(v3)), string.utf_codepoint_to_int))
                        let v7 = closure95(Nil)
                        let v8 = v6 |> option.map(v7)
                        let v9 = v8 |> option.unwrap(0)
                        let v10 = list.length(string.to_utf_codepoints(v3))
                        let v11 = v10 > 1
                        let v65 =
                            case v11 {
                                True -> {
                                    let v12 = v9 >= 126976
                                    let v42 =
                                        case v12 {
                                            True -> True
                                            False -> {
                                                let v13 = unicode_erlang_characters_to_binary([65039])
                                                let v14 = v13 == ""
                                                let v24 =
                                                    case v14 {
                                                        True -> 0
                                                        False -> {
                                                            let v15 = option.from_result(result.map(string.split_once(v3, v13), pair.first))
                                                            let v16 = closure1(Nil)
                                                            let v17 = v15 |> option.map(v16)
                                                            let v19 = v17 |> option.unwrap(Us2None)
                                                            case v19  {
                                                                Us2None -> -1
                                                                Us2Some(v20) -> {
                                                                    bit_array.byte_size(bit_array.from_string(v20))
                                                                }
                                                            }
                                                        }
                                                    }
                                                let v25 = v24 >= 0
                                                case v25 {
                                                    True -> {
                                                        let v26 = v9 >= 8192
                                                        let v28 =
                                                            case v26 {
                                                                True -> {
                                                                    v9 <= 11263
                                                                }
                                                                False -> False
                                                            }
                                                        let v30 =
                                                            case v28 {
                                                                True -> True
                                                                False -> {
                                                                    v9 == 169
                                                                }
                                                            }
                                                        let v32 =
                                                            case v30 {
                                                                True -> True
                                                                False -> {
                                                                    v9 == 174
                                                                }
                                                            }
                                                        let v34 =
                                                            case v32 {
                                                                True -> True
                                                                False -> {
                                                                    v9 == 12336
                                                                }
                                                            }
                                                        let v36 =
                                                            case v34 {
                                                                True -> True
                                                                False -> {
                                                                    v9 == 12349
                                                                }
                                                            }
                                                        let v38 =
                                                            case v36 {
                                                                True -> True
                                                                False -> {
                                                                    v9 == 12951
                                                                }
                                                            }
                                                        case v38 {
                                                            True -> True
                                                            False -> {
                                                                v9 == 12953
                                                            }
                                                        }
                                                    }
                                                    False -> False
                                                }
                                            }
                                        }
                                    case v42 {
                                        True -> True
                                        False -> {
                                            let v43 = unicode_erlang_characters_to_binary([8419])
                                            let v44 = v43 == ""
                                            let v54 =
                                                case v44 {
                                                    True -> 0
                                                    False -> {
                                                        let v45 = option.from_result(result.map(string.split_once(v3, v43), pair.first))
                                                        let v46 = closure1(Nil)
                                                        let v47 = v45 |> option.map(v46)
                                                        let v49 = v47 |> option.unwrap(Us2None)
                                                        case v49  {
                                                            Us2None -> -1
                                                            Us2Some(v50) -> {
                                                                bit_array.byte_size(bit_array.from_string(v50))
                                                            }
                                                        }
                                                    }
                                                }
                                            let v55 = v54 >= 0
                                            case v55 {
                                                True -> {
                                                    let v56 = v9 == 35
                                                    let v58 =
                                                        case v56 {
                                                            True -> True
                                                            False -> {
                                                                v9 == 42
                                                            }
                                                        }
                                                    case v58 {
                                                        True -> True
                                                        False -> {
                                                            let v59 = v9 >= 48
                                                            case v59 {
                                                                True -> {
                                                                    v9 <= 57
                                                                }
                                                                False -> False
                                                            }
                                                        }
                                                    }
                                                }
                                                False -> False
                                            }
                                        }
                                    }
                                }
                                False -> False
                            }
                        let v76 =
                            case v65 {
                                True -> 2
                                False -> {
                                    let v66 = string.to_utf_codepoints(v3)
                                    let v67 = v66 |> list.reverse
                                    let listm_fold = v67 |> list.fold (Uh14Nil, fn (acc, x) {
                                    let v69 = x
                                    let v70 = string.utf_codepoint_to_int(v69)
                                    let v71 = acc
                                    Uh14Cons(v70, v71)
                                    })
                                    let v73 = listm_fold
                                    method356(v73, 0)
                                }
                            }
                        #(v3, v76)
                    }
                    _ -> {
                        let #(v86, v87) =
                            case v0  {
                                Us79OnMastodon -> #(v3, 1)
                                _ -> {
                                    let #(v84, v85) =
                                        case v0  {
                                            Us79OnBluesky(v77, v78) -> {
                                                let v79 = spiral_string_length(v3)
                                                let v80 = spiral_wrap_signed(v79 + 9, 32)
                                                let v81 = v80 / 10
                                                let v82 = v81 < 1
                                                let v83 =
                                                    case v82 {
                                                        True -> 1
                                                        False -> v81
                                                    }
                                                #(v3, v83)
                                            }
                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                        }
                                    #(v84, v85)
                                }
                            }
                        #(v86, v87)
                    }
                }
            Uh32Cons(v88, v89, v5)
        }
        Uh3Nil -> v2
    }
}

pub fn units_on_353(v0: Us79, v1: String) -> Uh32 {
    let v29 =
        case v0  {
            Us79OnBluesky(v18, v19) -> {
                let v20 = string.to_graphemes(v1)
                let v21 = v20 |> list.reverse
                let listm_fold = v21 |> list.fold (Uh3Nil, fn (acc, x) {
                let v23 = x
                let v24 = acc
                Uh3Cons(v23, v24)
                })
                listm_fold
            }
            Us79OnMastodon -> {
                let v11 = string.to_graphemes(v1)
                let v12 = v11 |> list.reverse
                let listm_fold = v12 |> list.fold (Uh3Nil, fn (acc, x) {
                let v14 = x
                let v15 = acc
                Uh3Cons(v14, v15)
                })
                listm_fold
            }
            Us79OnX -> {
                let v2 = string.to_graphemes(v1)
                let v3 = v2 |> list.reverse
                let listm_fold = v3 |> list.fold (Uh3Nil, fn (acc, x) {
                let v5 = x
                let v6 = acc
                Uh3Cons(v5, v6)
                })
                let v8 = listm_fold
                glued_354(v8, Uh3Nil)
            }
        }
    method355(v0, v29, Uh32Nil)
}

pub fn led_by_358(v0: String, v1: Int, v2: Uh32) -> Bool {
    let v3 = spiral_string_length(v0)
    let v4 = v1 >= v3
    case v4 {
        True -> True
        False -> {
            case v2  {
                Uh32Cons(v5, v6, v7) -> {
                    let v8 = spiral_wrap_signed(v1 + 1, 32)
                    let v9 = spiral_wrap_signed(v8 - 1, 32)
                    let v10 = spiral_string_slice(v0, v1, v9)
                    let v11 = v5 == v10
                    case v11 {
                        True -> led_by_358(v0, v8, v7)
                        False -> False
                    }
                }
                _ -> False
            }
        }
    }
}

pub fn link_length_359(v0: Uh32, v1: Int) -> Int {
    case v0  {
        Uh32Cons(v2, v3, v4) -> {
            let v5 = string.to_utf_codepoints(v2)
            let v6 = v5 |> list.reverse
            let listm_fold = v6 |> list.fold (Uh14Nil, fn (acc, x) {
            let v8 = x
            let v9 = string.utf_codepoint_to_int(v8)
            let v10 = acc
            Uh14Cons(v9, v10)
            })
            let v12 = listm_fold
            let v13 = method166()
            let v14 = method167(v13, v12)
            let v15 = v14 == False
            let v16 = v15 == False
            case v16 {
                True -> {
                    let v17 = spiral_wrap_signed(v1 + 1, 32)
                    link_length_359(v4, v17)
                }
                False -> v1
            }
        }
        _ -> v1
    }
}

pub fn method360(v0: Uh32, v1: Uh32) -> Uh32 {
    case v0  {
        Uh32Cons(v2, v3, v4) -> {
            let v5 = Uh32Cons(v2, v3, v1)
            method360(v4, v5)
        }
        Uh32Nil -> v1
    }
}
