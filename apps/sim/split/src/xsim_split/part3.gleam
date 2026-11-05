import gleam/int
import gleam/list
import gleam/string
import xsim_split/types.{type SpiralArray, type SpiralRef, type ListString, type Us0, type Uh2, type Uh3, type Mut0, type Uh4, ListStringCons, ListStringNil, Mut0, SpiralArray, SpiralRef, Uh2Cons, Uh2Nil, Uh3Cons, Uh3Nil, Uh4Cons, Uh4Nil, Us0OnBluesky, Us0OnMastodon, Us0OnX}
import xsim_split/part1.{closure1, concat_balanced_22, method10, method26, spiral_array_from_list, spiral_array_get, spiral_ref_get, spiral_ref_new, spiral_ref_set, spiral_string_length, spiral_string_slice, spiral_wrap_signed, unicode_erlang_characters_to_binary, unicode_erlang_nfc}
import xsim_split/part2.{defused_dots_by_2, defused_entities_27, prefix_text_51, units_on_46}

pub fn closure8(capt: Nil) -> fn(Int) -> Bool {
    fn (v0) {
        let v1 = v0 >= 9
        let v3 =
            case v1 {
                True -> {
                    let v2 = v0 <= 13
                    v2
                }
                False -> False
            }
        let v5 =
            case v3 {
                True -> True
                False -> {
                    let v4 = v0 == 32
                    v4
                }
            }
        let v7 =
            case v5 {
                True -> True
                False -> {
                    let v6 = v0 == 133
                    v6
                }
            }
        let v9 =
            case v7 {
                True -> True
                False -> {
                    let v8 = v0 == 160
                    v8
                }
            }
        let v11 =
            case v9 {
                True -> True
                False -> {
                    let v10 = v0 == 5760
                    v10
                }
            }
        let v15 =
            case v11 {
                True -> True
                False -> {
                    let v12 = v0 >= 8192
                    case v12 {
                        True -> {
                            let v13 = v0 <= 8202
                            v13
                        }
                        False -> False
                    }
                }
            }
        let v17 =
            case v15 {
                True -> True
                False -> {
                    let v16 = v0 == 8232
                    v16
                }
            }
        let v19 =
            case v17 {
                True -> True
                False -> {
                    let v18 = v0 == 8233
                    v18
                }
            }
        let v21 =
            case v19 {
                True -> True
                False -> {
                    let v20 = v0 == 8239
                    v20
                }
            }
        let v23 =
            case v21 {
                True -> True
                False -> {
                    let v22 = v0 == 8287
                    v22
                }
            }
        let v25 =
            case v23 {
                True -> True
                False -> {
                    let v24 = v0 == 12288
                    v24
                }
            }
        let v26 = v25 == False
        v26
    }
}

pub fn method53() -> fn(Int) -> Bool {
    closure8(Nil)
}

pub fn method54(v0: fn(Int) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method53()
                    method54(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn link_length_52(v0: Uh2, v1: Int) -> Int {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = string.to_utf_codepoints(v2)
            let v6 = v5 |> list.reverse
            let v7 = Uh3Nil
            let listm_fold = v6 |> list.fold (v7, fn (acc, x) {
            let v8 = x
            let v9 = string.utf_codepoint_to_int(v8)
            let v10 = acc
            let v11 = Uh3Cons(v9, v10)
            v11
            })
            let v12 = listm_fold
            let v13 = method53()
            let v14 = method54(v13, v12)
            let v15 = v14 == False
            let v16 = v15 == False
            case v16 {
                True -> {
                    let v17 = spiral_wrap_signed(v1 + 1, 32)
                    link_length_52(v4, v17)
                }
                False -> v1
            }
        }
        _ -> v1
    }
}

pub fn method55(v0: Uh2, v1: Uh2) -> Uh2 {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = Uh2Cons(v2, v3, v1)
            method55(v4, v5)
        }
        Uh2Nil -> v1
    }
}

pub fn linked_50(v0: Uh2, v1: Int, v2: Uh2) -> Uh2 {
    case v0  {
        Uh2Cons(v5, v6, v7) -> {
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
                        let v12 = prefix_text_51(v10, v0, v11)
                        let v13 = v12 == "http://"
                        let v17 =
                            case v13 {
                                True -> True
                                False -> {
                                    let v14 = 8
                                    let v15 = prefix_text_51(v14, v0, v11)
                                    let v16 = v15 == "https://"
                                    v16
                                }
                            }
                        case v17 {
                            True -> {
                                let v18 = 0
                                let v19 = link_length_52(v0, v18)
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
                        let v25 = prefix_text_51(v23, v0, v24)
                        let v26 = v25 == "http://"
                        let v30 =
                            case v26 {
                                True -> True
                                False -> {
                                    let v27 = 8
                                    let v28 = prefix_text_51(v27, v0, v24)
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
            let v35 = Uh2Cons(v33, v34, v2)
            linked_50(v7, v22, v35)
        }
        Uh2Nil -> {
            let v3 = Uh2Nil
            method55(v2, v3)
        }
    }
}

pub fn method56(v0: Uh2, v1: Int) -> Int {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + v3, 32)
            method56(v4, v5)
        }
        Uh2Nil -> v1
    }
}

pub fn closure7(capt: #(Us0)) -> fn(String) -> Int {
    fn (v1) {
        let #(v0) = capt
        let v2 = units_on_46(v0, v1)
        let v13 =
            case v0  {
                Us0OnBluesky(v9, v10) -> v2
                Us0OnMastodon -> {
                    let v6 = 0
                    let v7 = Uh2Nil
                    linked_50(v2, v6, v7)
                }
                Us0OnX -> {
                    let v3 = 0
                    let v4 = Uh2Nil
                    linked_50(v2, v3, v4)
                }
            }
        let v14 = 0
        method56(v13, v14)
    }
}

pub fn closure9(capt: Nil) -> fn(#(String, Int)) -> Bool {
    fn (dom) {
        let #(v0, _v1) = dom
        let v2 = string.to_utf_codepoints(v0)
        let v3 = v2 |> list.reverse
        let v4 = Uh3Nil
        let listm_fold = v3 |> list.fold (v4, fn (acc, x) {
        let v5 = x
        let v6 = string.utf_codepoint_to_int(v5)
        let v7 = acc
        let v8 = Uh3Cons(v6, v7)
        v8
        })
        let v9 = listm_fold
        let v10 = method53()
        let v11 = method54(v10, v9)
        let v12 = v11 == False
        let v13 = v12 == False
        v13
    }
}

pub fn taken_while_61(v0: fn(#(String, Int)) -> Bool, v1: Uh2, v2: Uh2) -> #(Uh2, Uh2) {
    case v1  {
        Uh2Cons(v3, v4, v5) -> {
            let v6 = v0(#(v3, v4))
            case v6 {
                True -> {
                    let v7 = Uh2Cons(v3, v4, v2)
                    taken_while_61(v0, v5, v7)
                }
                False -> {
                    let v10 = Uh2Nil
                    let v11 = method55(v2, v10)
                    #(v11, v1)
                }
            }
        }
        _ -> {
            let v14 = Uh2Nil
            let v15 = method55(v2, v14)
            #(v15, v1)
        }
    }
}

pub fn closure10(capt: Nil) -> fn(#(String, Int)) -> Bool {
    fn (dom) {
        let #(v0, _v1) = dom
        let v2 = string.to_utf_codepoints(v0)
        let v3 = v2 |> list.reverse
        let v4 = Uh3Nil
        let listm_fold = v3 |> list.fold (v4, fn (acc, x) {
        let v5 = x
        let v6 = string.utf_codepoint_to_int(v5)
        let v7 = acc
        let v8 = Uh3Cons(v6, v7)
        v8
        })
        let v9 = listm_fold
        let v10 = method53()
        let v11 = method54(v10, v9)
        let v12 = v11 == False
        v12
    }
}

pub fn method62(v0: Uh2, v1: Int) -> Int {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + 1, 32)
            method62(v4, v5)
        }
        Uh2Nil -> v1
    }
}

pub fn method63(v0: Uh2, v1: Uh2) -> Uh2 {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = method63(v4, v1)
            Uh2Cons(v2, v3, v5)
        }
        Uh2Nil -> v1
    }
}

pub fn split_point_60(v0: Uh2) -> #(Uh2, Uh2) {
    let v1 = closure9(Nil)
    let v2 = Uh2Nil
    let #(v3, v4) = taken_while_61(v1, v0, v2)
    let v5 = closure10(Nil)
    let v6 = Uh2Nil
    let #(v7, v8) = taken_while_61(v5, v4, v6)
    let v9 =
        case v8  {
            Uh2Nil -> False
            _ -> True
        }
    let v16 =
        case v9 {
            True -> {
                let v10 = 0
                let v11 = method62(v3, v10)
                let v12 = 0
                let v13 = method62(v7, v12)
                let v14 = spiral_wrap_signed(v11 + v13, 32)
                let v15 = v14 <= 60
                v15
            }
            False -> False
        }
    case v16 {
        True -> {
            let v17 = method63(v3, v7)
            #(v17, v8)
        }
        False -> {
            let v18 = Uh2Nil
            let #(v19, v20) = taken_while_61(v5, v0, v18)
            let v21 =
                case v20  {
                    Uh2Nil -> False
                    _ -> True
                }
            case v21 {
                True -> #(v19, v20)
                False -> {
                    let v22 = Uh2Nil
                    #(v22, v0)
                }
            }
        }
    }
}

pub fn method64(v0: Uh2, v1: ListString) -> ListString {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = method64(v4, v1)
            ListStringCons(v2, v5)
        }
        Uh2Nil -> v1
    }
}

pub fn chunk_59(v0: Int, v1: Uh2, v2: Uh2, v3: Int, v4: ListString) -> ListString {
    case v1  {
        Uh2Cons(v15, v16, v17) -> {
            let v18 = spiral_wrap_signed(v3 + v16, 32)
            let v19 = v18 <= v0
            let v22 =
                case v19 {
                    True -> True
                    False -> {
                        let v20 =
                            case v2  {
                                Uh2Nil -> False
                                _ -> True
                            }
                        let v21 = v20 == False
                        v21
                    }
                }
            case v22 {
                True -> {
                    let v23 = Uh2Cons(v15, v16, v2)
                    chunk_59(v0, v17, v23, v18, v4)
                }
                False -> {
                    let #(v25, v26) = split_point_60(v2)
                    let v27 = Uh2Nil
                    let v28 = method55(v25, v27)
                    let v29 = method63(v28, v1)
                    let v37 =
                        case v26  {
                            Uh2Nil -> v4
                            _ -> {
                                let v30 = Uh2Nil
                                let v31 = method55(v26, v30)
                                let v32 = ListStringNil
                                let v33 = method64(v31, v32)
                                let v34 = ""
                                let v35 = concat_balanced_22(v34, v33)
                                ListStringCons(v35, v4)
                            }
                        }
                    let v38 = Uh2Nil
                    let v39 = 0
                    chunk_59(v0, v29, v38, v39, v37)
                }
            }
        }
        Uh2Nil -> {
            let v12 =
                case v2  {
                    Uh2Nil -> v4
                    _ -> {
                        let v5 = Uh2Nil
                        let v6 = method55(v2, v5)
                        let v7 = ListStringNil
                        let v8 = method64(v6, v7)
                        let v9 = ""
                        let v10 = concat_balanced_22(v9, v8)
                        ListStringCons(v10, v4)
                    }
                }
            let v13 = ListStringNil
            method10(v12, v13)
        }
    }
}

pub fn method65(v0: ListString, v1: Int) -> Int {
    case v0  {
        ListStringCons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method65(v3, v4)
        }
        ListStringNil -> v1
    }
}

pub fn chunks_of_58(v0: Int, v1: String, v2: fn(String) -> Int, v3: Uh2, v4: Int) -> ListString {
    let v5 = " "
    let v6 = v1 <> v5 
    let v7 = int.to_string(v4)
    let v8 = v6 <> v7 
    let v9 = "/"
    let v10 = v8 <> v9 
    let v11 = v10 <> v7 
    let v12 = "\n"
    let v13 = v11 <> v12 
    let v14 = v2(v13)
    let v15 = spiral_wrap_signed(v0 - v14, 32)
    let v16 = Uh2Nil
    let v17 = 0
    let v18 = ListStringNil
    let v19 = chunk_59(v15, v3, v16, v17, v18)
    let v20 = 0
    let v21 = method65(v19, v20)
    let v22 = int.to_string(v21)
    let v23 = spiral_string_length(v22)
    let v24 = spiral_string_length(v7)
    let v25 = v23 > v24
    case v25 {
        True -> chunks_of_58(v0, v1, v2, v3, v21)
        False -> v19
    }
}

pub fn split_units_57(v0: Int, v1: String, v2: fn(String) -> Int, v3: Uh2) -> ListString {
    let v4 = 9
    chunks_of_58(v0, v1, v2, v3, v4)
}

pub fn split_cell_on_45(v0: Us0, v1: String, v2: Int, v3: String) -> ListString {
    let v4 = closure7(#(v0))
    let v5 = unicode_erlang_nfc(v3)
    let v6 = units_on_46(v0, v5)
    let v17 =
        case v0  {
            Us0OnBluesky(v13, v14) -> v6
            Us0OnMastodon -> {
                let v10 = 0
                let v11 = Uh2Nil
                linked_50(v6, v10, v11)
            }
            Us0OnX -> {
                let v7 = 0
                let v8 = Uh2Nil
                linked_50(v6, v7, v8)
            }
        }
    split_units_57(v2, v1, v4, v17)
}

pub fn split_cell_0(v0: String, v1: Int, v2: String) -> ListString {
    let v3 = Us0OnX
    let v4 = closure1(Nil)
    let v5 = defused_dots_by_2(v4, v2)
    let v6 = defused_entities_27(v5)
    split_cell_on_45(v3, v0, v1, v6)
}

pub fn closure0(capt: Nil) -> fn(#(String, Int, String)) -> ListString {
    fn (dom) {
        let #(v0, v1, v2) = dom
        split_cell_0(v0, v1, v2)
    }
}

pub fn delimited_66(v0: String, v1: ListString) -> String {
    concat_balanced_22(v0, v1)
}

pub fn closure11(capt: Nil) -> fn(#(String, Int, String)) -> String {
    fn (dom) {
        let #(v0, v1, v2) = dom
        let v3 = split_cell_0(v0, v1, v2)
        let v4 = unicode_erlang_characters_to_binary([0])
        delimited_66(v4, v3)
    }
}

pub fn method69(v0: Int, v1: SpiralRef(Mut0)) -> Bool {
    let v2 = spiral_ref_get(v1).l0
    let v3 = v2 < v0
    v3
}
pub fn loop0 (v7: SpiralArray(String), v8: Int, v10: SpiralRef(Mut0)) {
    case method69(v8, v10) {
        True -> {
            let v12 = spiral_ref_get(v10).l0
            let v13 = spiral_ref_get(v10).l1
            let v14 = spiral_array_get(v7, v12)
            let v15 = spiral_wrap_signed(v12 + 1, 32)
            let v16 = ListStringCons(v14, v13)
            spiral_ref_set(v10, Mut0(l0: v15, l1: v16))
            loop0(v7, v8, v10)
        }
        False -> v10
    }
}

pub fn split_list_68(v0: String, v1: String) -> ListString {
    let v2 = spiral_string_length(v0)
    let v3 = v2 == 0
    case v3 {
        True -> {
            let v4 = ListStringNil
            ListStringCons(v1, v4)
        }
        False -> {
            let v6 = v1 |> string.split(v0)
            let v7 = v6 |> spiral_array_from_list
            let v8 = v7.size
            let v9 = ListStringNil
            let v10 = spiral_ref_new(Mut0(l0: 0, l1: v9))
            let v10 = loop0(v7, v8, v10)
            let v17 = spiral_ref_get(v10).l1
            let v18 = ListStringNil
            method10(v17, v18)
        }
    }
}

pub fn blank_tail_length_72(v0: ListString, v1: Int) -> Int {
    case v0  {
        ListStringCons(v2, v3) -> {
            let v4 = string.to_utf_codepoints(v2)
            let v5 = v4 |> list.reverse
            let v6 = Uh3Nil
            let listm_fold = v5 |> list.fold (v6, fn (acc, x) {
            let v7 = x
            let v8 = string.utf_codepoint_to_int(v7)
            let v9 = acc
            let v10 = Uh3Cons(v8, v9)
            v10
            })
            let v11 = listm_fold
            let v12 = method53()
            let v13 = method54(v12, v11)
            let v14 = v13 == False
            case v14 {
                True -> {
                    let v15 = spiral_string_length(v2)
                    let v16 = spiral_wrap_signed(v1 + v15, 32)
                    blank_tail_length_72(v3, v16)
                }
                False -> v1
            }
        }
        _ -> v1
    }
}

pub fn with_blanks_73(v0: Int, v1: ListString) -> ListString {
    let v2 = v0 <= 0
    case v2 {
        True -> v1
        False -> {
            let v3 = spiral_wrap_signed(v0 - 1, 32)
            let v4 = ""
            let v5 = ListStringCons(v4, v1)
            with_blanks_73(v3, v5)
        }
    }
}

pub fn step_71(v0: ListString, v1: ListString, v2: Int, v3: Bool, v4: String) -> #(ListString, ListString, Int, Bool) {
    let v5 = v4 == ""
    let #(v46, v47, v48, v49) =
        case v5 {
            True -> {
                let v6 = spiral_wrap_signed(v2 + 1, 32)
                #(v0, v1, v6, v3)
            }
            False -> {
                let v7 = v2 > 0
                let v8 = v7 && v3
                let v15 =
                    case v8 {
                        True -> {
                            let v9 = " "
                            let v10 = v4 |> string.starts_with(v9)
                            let v13 =
                                case v10 {
                                    True -> True
                                    False -> {
                                        let v11 = "\t"
                                        let v12 = v4 |> string.starts_with(v11)
                                        v12
                                    }
                                }
                            let v14 = v13 == False
                            v14
                        }
                        False -> False
                    }
                let #(v42, v43, v44, v45) =
                    case v15 {
                        True -> {
                            let v16 = ListStringNil
                            let v17 = method10(v1, v16)
                            let v18 = "\n"
                            let v19 = concat_balanced_22(v18, v17)
                            let v20 = spiral_string_length(v19)
                            let v21 = string.to_graphemes(v19)
                            let v22 = v21 |> list.reverse
                            let v23 = ListStringNil
                            let listm_fold = v22 |> list.fold (v23, fn (acc, x) {
                            let v24 = x
                            let v25 = acc
                            let v26 = ListStringCons(v24, v25)
                            v26
                            })
                            let v27 = listm_fold
                            let v28 = ListStringNil
                            let v29 = method10(v27, v28)
                            let v30 = 0
                            let v31 = blank_tail_length_72(v29, v30)
                            let v32 = spiral_wrap_signed(v20 - v31, 32)
                            let v33 = spiral_wrap_signed(v32 - 1, 32)
                            let v34 = spiral_string_slice(v19, 0, v33)
                            let v35 = spiral_wrap_signed(v2 - 1, 32)
                            let v36 = ListStringNil
                            let v37 = with_blanks_73(v35, v36)
                            let v38 = ListStringCons(v34, v0)
                            let v39 = ListStringCons(v4, v37)
                            #(v38, v39, 0, True)
                        }
                        False -> {
                            let v40 = with_blanks_73(v2, v1)
                            let v41 = ListStringCons(v4, v40)
                            #(v0, v41, 0, True)
                        }
                    }
                #(v42, v43, v44, v45)
            }
        }
    #(v46, v47, v48, v49)
}

pub fn method70(v0: ListString, v1: ListString, v2: ListString, v3: Int, v4: Bool) -> #(ListString, ListString, Int, Bool) {
    let #(v19, v20, v21, v22) =
        case v0  {
            ListStringCons(v5, v6) -> {
                let #(v7, v8, v9, v10) = step_71(v1, v2, v3, v4, v5)
                method70(v6, v7, v8, v9, v10)
            }
            _ -> {
                let #(v15, v16, v17, v18) =
                    case v0  {
                        ListStringNil -> #(v1, v2, v3, v4)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v15, v16, v17, v18)
            }
        }
    #(v19, v20, v21, v22)
}

pub fn file_cells_67(v0: String) -> ListString {
    let v1 = "\r\n"
    let v2 = "\n"
    let v3 = v0 |> string.replace(v1, v2)
    let v4 = v3 |> string.ends_with(v2)
    let v9 =
        case v4 {
            True -> {
                let v5 = spiral_string_length(v3)
                let v6 = spiral_wrap_signed(v5 - 1, 32)
                let v7 = spiral_wrap_signed(v6 - 1, 32)
                let v8 = spiral_string_slice(v3, 0, v7)
                v8
            }
            False -> v3
        }
    let v10 = v9 == ""
    case v10 {
        True -> ListStringNil
        False -> {
            let v12 = split_list_68(v2, v9)
            let v13 = ListStringNil
            let v14 = ListStringNil
            let v15 = 0
            let v16 = False
            let #(v17, v18, v19, _v20) = method70(v12, v13, v14, v15, v16)
            let v21 = with_blanks_73(v19, v18)
            let v22 = ListStringNil
            let v23 = method10(v21, v22)
            let v24 = concat_balanced_22(v2, v23)
            let v25 = spiral_string_length(v24)
            let v26 = string.to_graphemes(v24)
            let v27 = v26 |> list.reverse
            let v28 = ListStringNil
            let listm_fold = v27 |> list.fold (v28, fn (acc, x) {
            let v29 = x
            let v30 = acc
            let v31 = ListStringCons(v29, v30)
            v31
            })
            let v32 = listm_fold
            let v33 = ListStringNil
            let v34 = method10(v32, v33)
            let v35 = 0
            let v36 = blank_tail_length_72(v34, v35)
            let v37 = spiral_wrap_signed(v25 - v36, 32)
            let v38 = spiral_wrap_signed(v37 - 1, 32)
            let v39 = spiral_string_slice(v24, 0, v38)
            let v40 = ListStringNil
            let v41 = ListStringCons(v39, v40)
            method10(v17, v41)
        }
    }
}

pub fn closure12(capt: Nil) -> fn(String) -> ListString {
    fn (v0) {
        file_cells_67(v0)
    }
}

pub fn closure15(capt: #(Us0, Int)) -> fn(String) -> ListString {
    fn (v2) {
        let #(v0, v1) = capt
        let v10 =
            case v0  {
                Us0OnBluesky(v6, v7) -> v2
                Us0OnMastodon -> v2
                Us0OnX -> {
                    let v3 = closure1(Nil)
                    let v4 = defused_dots_by_2(v3, v2)
                    defused_entities_27(v4)
                }
            }
        let v11 = int.to_string(v1)
        let v12 = "c"
        let v13 = v12 <> v11 
        let v18 =
            case v0  {
                Us0OnBluesky(v14, v15) -> 300
                Us0OnMastodon -> 500
                Us0OnX -> 280
            }
        split_cell_on_45(v0, v13, v18, v10)
    }
}

pub fn closure14(capt: #(Us0)) -> fn(Int) -> fn(String) -> ListString {
    fn (v1) {
        let #(v0) = capt
        closure15(#(v0, v1))
    }
}

pub fn numbered_78(v0: String, v1: Int, v2: Int, v3: ListString, v4: ListString) -> ListString {
    case v3  {
        ListStringCons(v7, v8) -> {
            let v9 = spiral_wrap_signed(v2 + 1, 32)
            let v10 = " "
            let v11 = v0 <> v10 
            let v12 = int.to_string(v2)
            let v13 = v11 <> v12 
            let v14 = "/"
            let v15 = v13 <> v14 
            let v16 = int.to_string(v1)
            let v17 = v15 <> v16 
            let v18 = "\n"
            let v19 = v17 <> v18 
            let v20 = v19 <> v7 
            let v21 = spiral_string_length(v20)
            let v22 = string.to_graphemes(v20)
            let v23 = v22 |> list.reverse
            let v24 = ListStringNil
            let listm_fold = v23 |> list.fold (v24, fn (acc, x) {
            let v25 = x
            let v26 = acc
            let v27 = ListStringCons(v25, v26)
            v27
            })
            let v28 = listm_fold
            let v29 = ListStringNil
            let v30 = method10(v28, v29)
            let v31 = 0
            let v32 = blank_tail_length_72(v30, v31)
            let v33 = spiral_wrap_signed(v21 - v32, 32)
            let v34 = spiral_wrap_signed(v33 - 1, 32)
            let v35 = spiral_string_slice(v20, 0, v34)
            let v36 = ListStringCons(v35, v4)
            numbered_78(v0, v1, v9, v8, v36)
        }
        ListStringNil -> {
            let v5 = ListStringNil
            method10(v4, v5)
        }
    }
}

pub fn cell_posts_by_77(v0: fn(Int) -> fn(String) -> ListString, v1: Int, v2: String) -> ListString {
    let v3 = v0(v1)
    let v4 = v3(v2)
    let v8 =
        case v4  {
            ListStringNil -> {
                let v5 = ""
                let v6 = ListStringNil
                ListStringCons(v5, v6)
            }
            _ -> v4
        }
    let v9 = int.to_string(v1)
    let v10 = "c"
    let v11 = v10 <> v9 
    let v12 = 0
    let v13 = method65(v8, v12)
    let v14 = 1
    let v15 = ListStringNil
    numbered_78(v11, v13, v14, v8, v15)
}

pub fn method79(v0: Uh4, v1: Uh4) -> Uh4 {
    case v0  {
        Uh4Cons(v2, v3) -> {
            let v4 = Uh4Cons(v2, v1)
            method79(v3, v4)
        }
        Uh4Nil -> v1
    }
}

pub fn method80(v0: Uh4, v1: ListString) -> ListString {
    case v0  {
        Uh4Cons(v2, v3) -> {
            let v4 = method80(v3, v1)
            method26(v2, v4)
        }
        Uh4Nil -> v1
    }
}

pub fn thread_by_76(v0: fn(Int) -> fn(String) -> ListString, v1: Int, v2: ListString, v3: Uh4) -> ListString {
    case v2  {
        ListStringCons(v8, v9) -> {
            let v10 = spiral_wrap_signed(v1 + 1, 32)
            let v11 = cell_posts_by_77(v0, v1, v8)
            let v12 = Uh4Cons(v11, v3)
            thread_by_76(v0, v10, v9, v12)
        }
        ListStringNil -> {
            let v4 = Uh4Nil
            let v5 = method79(v3, v4)
            let v6 = ListStringNil
            method80(v5, v6)
        }
    }
}

pub fn thread_on_75(v0: Us0, v1: Int, v2: ListString, v3: Uh4) -> ListString {
    let v4 = closure14(#(v0))
    thread_by_76(v4, v1, v2, v3)
}
