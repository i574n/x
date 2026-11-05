import gleam/bit_array
import gleam/list
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh13, type Us79, type Uh31, Uh13Cons, Uh13Nil, Uh31Cons, Uh31Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us79OnBluesky, Us79OnMastodon, Us79OnX}
import xsim_frames/part1.{closure1, method4, spiral_string_length, spiral_wrap_signed, unicode_erlang_characters_to_binary}
import xsim_frames/part16.{ascii_letter_315, ascii_of_316, closure95, closure96, mention_quiet_338, rt_letters_340, word_glyph_337, word_length_336}
import xsim_frames/part2.{concat_balanced_22}
import xsim_frames/part7.{method164, method165}

pub fn first_is_342(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> v0(v2)
        Uh3Nil -> False
    }
}

pub fn rt_boundary_341(v0: Uh3) -> Bool {
    let v1 = closure96(Nil)
    let v2 = first_is_342(v1, v0)
    let v3 = v2 == False
    v3
}

pub fn rt_before_339(v0: Uh3) -> Bool {
    case v0  {
        Uh3Cons(v1, v2) -> {
            case v2  {
                Uh3Cons(v3, v4) -> {
                    case v4  {
                        Uh3Cons(v5, v6) -> {
                            let v7 = v1 == ":"
                            let v9 =
                                case v7 {
                                    True -> rt_letters_340(v3, v5)
                                    False -> False
                                }
                            case v9 {
                                True -> rt_boundary_341(v6)
                                False -> {
                                    let v11 = rt_letters_340(v1, v3)
                                    case v11 {
                                        True -> rt_boundary_341(v4)
                                        False -> False
                                    }
                                }
                            }
                        }
                        _ -> {
                            let v15 = rt_letters_340(v1, v3)
                            case v15 {
                                True -> rt_boundary_341(v4)
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
        let v1 = word_glyph_337(v0)
        case v1 {
            True -> True
            False -> {
                let v2 = v0 == "@"
                v2
            }
        }
    }
}

pub fn mention_after_335(v0: String, v1: Uh3, v2: Uh3) -> Bool {
    let v3 = 0
    let #(v4, v5) = word_length_336(v2, v3)
    let v6 = mention_quiet_338(v0)
    let v8 =
        case v6 {
            True -> True
            False -> rt_before_339(v1)
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
            let v13 = closure97(Nil)
            let v14 = first_is_342(v13, v5)
            let v15 = v14 == False
            v15
        }
        False -> False
    }
}

pub fn wide_letter_345(v0: String) -> Bool {
    let v1 = ascii_letter_315(v0)
    case v1 {
        True -> True
        False -> {
            let v2 = ascii_of_316(v0)
            let v3 = v2 > 127
            v3
        }
    }
}

pub fn tag_has_letter_344(v0: Uh3) -> Bool {
    case v0  {
        Uh3Cons(v1, v2) -> {
            let v3 = word_glyph_337(v1)
            let v5 =
                case v3 {
                    True -> True
                    False -> wide_letter_345(v1)
                }
            case v5 {
                True -> {
                    let v6 = wide_letter_345(v1)
                    case v6 {
                        True -> True
                        False -> tag_has_letter_344(v2)
                    }
                }
                False -> False
            }
        }
        _ -> False
    }
}

pub fn hashtag_after_343(v0: String, v1: Uh3) -> Bool {
    let v2 = word_glyph_337(v0)
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
        True -> tag_has_letter_344(v1)
        False -> False
    }
}

pub fn letters_length_347(v0: Uh3, v1: Int) -> #(Int, Uh3) {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = ascii_letter_315(v2)
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v1 + 1, 32)
                    letters_length_347(v3, v5)
                }
                False -> #(v1, v0)
            }
        }
        _ -> #(v1, v0)
    }
}

pub fn cash_quiet_348(v0: String) -> Bool {
    let v1 = word_glyph_337(v0)
    let v3 =
        case v1 {
            True -> True
            False -> wide_letter_345(v0)
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

pub fn closure98(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = word_glyph_337(v0)
        case v1 {
            True -> True
            False -> wide_letter_345(v0)
        }
    }
}

pub fn suffix_ok_349(v0: Uh3) -> Uh3 {
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
                    let #(v7, v8) = letters_length_347(v2, v6)
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

pub fn cashtag_after_346(v0: String, v1: Uh3) -> Bool {
    let v2 = 0
    let #(v3, v4) = letters_length_347(v1, v2)
    let v5 = cash_quiet_348(v0)
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
            let v10 = closure98(Nil)
            let v11 = suffix_ok_349(v4)
            let v12 = first_is_342(v10, v11)
            let v13 = v12 == False
            v13
        }
        False -> False
    }
}

pub fn tags_334(v0: String, v1: Uh3, v2: String, v3: Uh3) -> Bool {
    let v4 = v2 == "@"
    let v6 =
        case v4 {
            True -> mention_after_335(v0, v1, v3)
            False -> False
        }
    let v10 =
        case v6 {
            True -> True
            False -> {
                let v7 = v2 == "#"
                case v7 {
                    True -> hashtag_after_343(v0, v3)
                    False -> False
                }
            }
        }
    case v10 {
        True -> True
        False -> {
            let v11 = v2 == "$"
            case v11 {
                True -> cashtag_after_346(v0, v3)
                False -> False
            }
        }
    }
}

pub fn entities_from_333(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = tags_334(v0, v2, v3, v4)
            case v5 {
                True -> {
                    let v6 = unicode_erlang_characters_to_binary([8203])
                    let v7 = Uh3Cons(v3, v2)
                    let v8 = Uh3Cons(v6, v7)
                    entities_from_333(v3, v4, v8)
                }
                False -> {
                    let v10 = Uh3Cons(v3, v2)
                    entities_from_333(v3, v4, v10)
                }
            }
        }
        Uh3Nil -> {
            let v13 = Uh3Nil
            method4(v2, v13)
        }
    }
}

pub fn defused_entities_332(v0: String) -> String {
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
    let v10 = entities_from_333(v1, v8, v9)
    concat_balanced_22(v1, v10)
}

pub fn glued_352(v0: Uh3, v1: Uh3) -> Uh3 {
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
                            glued_352(v5, v9)
                        }
                        False -> {
                            let v11 = Uh3Cons(v2, v1)
                            glued_352(v3, v11)
                        }
                    }
                }
                _ -> {
                    let v14 = Uh3Cons(v2, v1)
                    glued_352(v3, v14)
                }
            }
        }
        Uh3Nil -> {
            let v17 = Uh3Nil
            method4(v1, v17)
        }
    }
}

pub fn method354(v0: Uh13, v1: Int) -> Int {
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
            method354(v3, v18)
        }
        Uh13Nil -> v1
    }
}

pub fn method353(v0: Us79, v1: Uh3, v2: Uh31) -> Uh31 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method353(v0, v4, v2)
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
                                                            let v18 = Us2None
                                                            let v19 = v17 |> option.unwrap(v18)
                                                            case v19  {
                                                                Us2None -> -1
                                                                Us2Some(v20) -> {
                                                                    let v21 = bit_array.byte_size(bit_array.from_string(v20))
                                                                    v21
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
                                                                    let v27 = v9 <= 11263
                                                                    v27
                                                                }
                                                                False -> False
                                                            }
                                                        let v30 =
                                                            case v28 {
                                                                True -> True
                                                                False -> {
                                                                    let v29 = v9 == 169
                                                                    v29
                                                                }
                                                            }
                                                        let v32 =
                                                            case v30 {
                                                                True -> True
                                                                False -> {
                                                                    let v31 = v9 == 174
                                                                    v31
                                                                }
                                                            }
                                                        let v34 =
                                                            case v32 {
                                                                True -> True
                                                                False -> {
                                                                    let v33 = v9 == 12336
                                                                    v33
                                                                }
                                                            }
                                                        let v36 =
                                                            case v34 {
                                                                True -> True
                                                                False -> {
                                                                    let v35 = v9 == 12349
                                                                    v35
                                                                }
                                                            }
                                                        let v38 =
                                                            case v36 {
                                                                True -> True
                                                                False -> {
                                                                    let v37 = v9 == 12951
                                                                    v37
                                                                }
                                                            }
                                                        case v38 {
                                                            True -> True
                                                            False -> {
                                                                let v39 = v9 == 12953
                                                                v39
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
                                                        let v48 = Us2None
                                                        let v49 = v47 |> option.unwrap(v48)
                                                        case v49  {
                                                            Us2None -> -1
                                                            Us2Some(v50) -> {
                                                                let v51 = bit_array.byte_size(bit_array.from_string(v50))
                                                                v51
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
                                                                let v57 = v9 == 42
                                                                v57
                                                            }
                                                        }
                                                    case v58 {
                                                        True -> True
                                                        False -> {
                                                            let v59 = v9 >= 48
                                                            case v59 {
                                                                True -> {
                                                                    let v60 = v9 <= 57
                                                                    v60
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
                                    let v68 = Uh13Nil
                                    let listm_fold = v67 |> list.fold (v68, fn (acc, x) {
                                    let v69 = x
                                    let v70 = string.utf_codepoint_to_int(v69)
                                    let v71 = acc
                                    let v72 = Uh13Cons(v70, v71)
                                    v72
                                    })
                                    let v73 = listm_fold
                                    let v74 = 0
                                    method354(v73, v74)
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
            Uh31Cons(v88, v89, v5)
        }
        Uh3Nil -> v2
    }
}

pub fn units_on_351(v0: Us79, v1: String) -> Uh31 {
    let v29 =
        case v0  {
            Us79OnBluesky(v18, v19) -> {
                let v20 = string.to_graphemes(v1)
                let v21 = v20 |> list.reverse
                let v22 = Uh3Nil
                let listm_fold = v21 |> list.fold (v22, fn (acc, x) {
                let v23 = x
                let v24 = acc
                let v25 = Uh3Cons(v23, v24)
                v25
                })
                let v26 = listm_fold
                v26
            }
            Us79OnMastodon -> {
                let v11 = string.to_graphemes(v1)
                let v12 = v11 |> list.reverse
                let v13 = Uh3Nil
                let listm_fold = v12 |> list.fold (v13, fn (acc, x) {
                let v14 = x
                let v15 = acc
                let v16 = Uh3Cons(v14, v15)
                v16
                })
                let v17 = listm_fold
                v17
            }
            Us79OnX -> {
                let v2 = string.to_graphemes(v1)
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
                glued_352(v8, v9)
            }
        }
    let v30 = Uh31Nil
    method353(v0, v29, v30)
}

pub fn prefix_text_356(v0: Int, v1: Uh31, v2: String) -> String {
    case v1  {
        Uh31Cons(v3, v4, v5) -> {
            let v6 = v0 > 0
            case v6 {
                True -> {
                    let v7 = spiral_wrap_signed(v0 - 1, 32)
                    let v8 = v2 <> v3 
                    prefix_text_356(v7, v5, v8)
                }
                False -> v2
            }
        }
        _ -> v2
    }
}

pub fn link_length_357(v0: Uh31, v1: Int) -> Int {
    case v0  {
        Uh31Cons(v2, v3, v4) -> {
            let v5 = string.to_utf_codepoints(v2)
            let v6 = v5 |> list.reverse
            let v7 = Uh13Nil
            let listm_fold = v6 |> list.fold (v7, fn (acc, x) {
            let v8 = x
            let v9 = string.utf_codepoint_to_int(v8)
            let v10 = acc
            let v11 = Uh13Cons(v9, v10)
            v11
            })
            let v12 = listm_fold
            let v13 = method164()
            let v14 = method165(v13, v12)
            let v15 = v14 == False
            let v16 = v15 == False
            case v16 {
                True -> {
                    let v17 = spiral_wrap_signed(v1 + 1, 32)
                    link_length_357(v4, v17)
                }
                False -> v1
            }
        }
        _ -> v1
    }
}

pub fn method358(v0: Uh31, v1: Uh31) -> Uh31 {
    case v0  {
        Uh31Cons(v2, v3, v4) -> {
            let v5 = Uh31Cons(v2, v3, v1)
            method358(v4, v5)
        }
        Uh31Nil -> v1
    }
}

pub fn linked_355(v0: Uh31, v1: Int, v2: Uh31) -> Uh31 {
    case v0  {
        Uh31Cons(v5, v6, v7) -> {
            let v8 = v1 > 0
            let v22 =
                case v8 {
                    True -> {
                        let v9 = spiral_wrap_signed(v1 - 1, 32)
                        v9
                    }
                    False -> {
                        let v10 = 7
                        let v11 = ""
                        let v12 = prefix_text_356(v10, v0, v11)
                        let v13 = v12 == "http://"
                        let v17 =
                            case v13 {
                                True -> True
                                False -> {
                                    let v14 = 8
                                    let v15 = prefix_text_356(v14, v0, v11)
                                    let v16 = v15 == "https://"
                                    v16
                                }
                            }
                        case v17 {
                            True -> {
                                let v18 = 0
                                let v19 = link_length_357(v0, v18)
                                let v20 = spiral_wrap_signed(v19 - 1, 32)
                                v20
                            }
                            False -> 0
                        }
                    }
                }
            let #(v33, v34) =
                case v8 {
                    True -> #(v5, 0)
                    False -> {
                        let v23 = 7
                        let v24 = ""
                        let v25 = prefix_text_356(v23, v0, v24)
                        let v26 = v25 == "http://"
                        let v30 =
                            case v26 {
                                True -> True
                                False -> {
                                    let v27 = 8
                                    let v28 = prefix_text_356(v27, v0, v24)
                                    let v29 = v28 == "https://"
                                    v29
                                }
                            }
                        let #(v31, v32) =
                            case v30 {
                                True -> #(v5, 23)
                                False -> #(v5, v6)
                            }
                        #(v31, v32)
                    }
                }
            let v35 = Uh31Cons(v33, v34, v2)
            linked_355(v7, v22, v35)
        }
        Uh31Nil -> {
            let v3 = Uh31Nil
            method358(v2, v3)
        }
    }
}

pub fn method359(v0: Uh31, v1: Int) -> Int {
    case v0  {
        Uh31Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + v3, 32)
            method359(v4, v5)
        }
        Uh31Nil -> v1
    }
}

pub fn closure99(capt: #(Us79)) -> fn(String) -> Int {
    fn (v1) {
        let #(v0) = capt
        let v2 = units_on_351(v0, v1)
        let v13 =
            case v0  {
                Us79OnBluesky(v9, v10) -> v2
                Us79OnMastodon -> {
                    let v6 = 0
                    let v7 = Uh31Nil
                    linked_355(v2, v6, v7)
                }
                Us79OnX -> {
                    let v3 = 0
                    let v4 = Uh31Nil
                    linked_355(v2, v3, v4)
                }
            }
        let v14 = 0
        method359(v13, v14)
    }
}

pub fn closure100(capt: Nil) -> fn(#(String, Int)) -> Bool {
    fn (dom) {
        let #(v0, _v1) = dom
        let v2 = string.to_utf_codepoints(v0)
        let v3 = v2 |> list.reverse
        let v4 = Uh13Nil
        let listm_fold = v3 |> list.fold (v4, fn (acc, x) {
        let v5 = x
        let v6 = string.utf_codepoint_to_int(v5)
        let v7 = acc
        let v8 = Uh13Cons(v6, v7)
        v8
        })
        let v9 = listm_fold
        let v10 = method164()
        let v11 = method165(v10, v9)
        let v12 = v11 == False
        let v13 = v12 == False
        v13
    }
}

pub fn taken_while_364(v0: fn(#(String, Int)) -> Bool, v1: Uh31, v2: Uh31) -> #(Uh31, Uh31) {
    case v1  {
        Uh31Cons(v3, v4, v5) -> {
            let v6 = v0(#(v3, v4))
            case v6 {
                True -> {
                    let v7 = Uh31Cons(v3, v4, v2)
                    taken_while_364(v0, v5, v7)
                }
                False -> {
                    let v10 = Uh31Nil
                    let v11 = method358(v2, v10)
                    #(v11, v1)
                }
            }
        }
        _ -> {
            let v14 = Uh31Nil
            let v15 = method358(v2, v14)
            #(v15, v1)
        }
    }
}

pub fn closure101(capt: Nil) -> fn(#(String, Int)) -> Bool {
    fn (dom) {
        let #(v0, _v1) = dom
        let v2 = string.to_utf_codepoints(v0)
        let v3 = v2 |> list.reverse
        let v4 = Uh13Nil
        let listm_fold = v3 |> list.fold (v4, fn (acc, x) {
        let v5 = x
        let v6 = string.utf_codepoint_to_int(v5)
        let v7 = acc
        let v8 = Uh13Cons(v6, v7)
        v8
        })
        let v9 = listm_fold
        let v10 = method164()
        let v11 = method165(v10, v9)
        let v12 = v11 == False
        v12
    }
}

pub fn method365(v0: Uh31, v1: Int) -> Int {
    case v0  {
        Uh31Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + 1, 32)
            method365(v4, v5)
        }
        Uh31Nil -> v1
    }
}
