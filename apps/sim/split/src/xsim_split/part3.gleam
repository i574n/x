import gleam/int
import gleam/list
import gleam/string
import xsim_split/types.{type SpiralArray, type SpiralRef, type ListString, type Us0, type Uh2, type Mut0, type Uh4, ListStringCons, ListStringNil, Mut0, SpiralArray, SpiralRef, Uh2Cons, Uh2Nil, Uh3Cons, Uh3Nil, Uh4Cons, Uh4Nil, Us0OnBluesky, Us0OnMastodon, Us0OnX}
import xsim_split/part1.{closure1, concat_balanced_22, defused_dots_by_2, method10, method26, spiral_array_from_list, spiral_array_get, spiral_ref_get, spiral_ref_new, spiral_ref_set, spiral_string_length, spiral_string_slice, spiral_wrap_signed, unicode_erlang_characters_to_binary, unicode_erlang_nfc}
import xsim_split/part2.{closure7, defused_entities_27, linked_50, method53, method54, method55, units_on_46}

pub fn closure9(capt: Nil) -> fn(#(String, Int)) -> Bool {
    fn (dom) {
        let #(v0, _v1) = dom
        let v2 = string.to_utf_codepoints(v0)
        let v3 = v2 |> list.reverse
        let listm_fold = v3 |> list.fold (Uh3Nil, fn (acc, x) {
        let v5 = x
        let v6 = string.utf_codepoint_to_int(v5)
        let v7 = acc
        Uh3Cons(v6, v7)
        })
        let v9 = listm_fold
        let v10 = method53()
        let v11 = method54(v10, v9)
        let v12 = v11 == False
        v12 == False
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
                    let v11 = method55(v2, Uh2Nil)
                    #(v11, v1)
                }
            }
        }
        _ -> {
            let v15 = method55(v2, Uh2Nil)
            #(v15, v1)
        }
    }
}

pub fn closure10(capt: Nil) -> fn(#(String, Int)) -> Bool {
    fn (dom) {
        let #(v0, _v1) = dom
        let v2 = string.to_utf_codepoints(v0)
        let v3 = v2 |> list.reverse
        let listm_fold = v3 |> list.fold (Uh3Nil, fn (acc, x) {
        let v5 = x
        let v6 = string.utf_codepoint_to_int(v5)
        let v7 = acc
        Uh3Cons(v6, v7)
        })
        let v9 = listm_fold
        let v10 = method53()
        let v11 = method54(v10, v9)
        v11 == False
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
    let #(v3, v4) = taken_while_61(v1, v0, Uh2Nil)
    let v5 = closure10(Nil)
    let #(v7, v8) = taken_while_61(v5, v4, Uh2Nil)
    let v9 =
        case v8  {
            Uh2Nil -> False
            _ -> True
        }
    let v16 =
        case v9 {
            True -> {
                let v11 = method62(v3, 0)
                let v13 = method62(v7, 0)
                let v14 = spiral_wrap_signed(v11 + v13, 32)
                v14 <= 60
            }
            False -> False
        }
    case v16 {
        True -> {
            let v17 = method63(v3, v7)
            #(v17, v8)
        }
        False -> {
            let #(v19, v20) = taken_while_61(v5, v0, Uh2Nil)
            let v21 =
                case v20  {
                    Uh2Nil -> False
                    _ -> True
                }
            case v21 {
                True -> #(v19, v20)
                False -> {
                    #(Uh2Nil, v0)
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
                        v20 == False
                    }
                }
            case v22 {
                True -> {
                    let v23 = Uh2Cons(v15, v16, v2)
                    chunk_59(v0, v17, v23, v18, v4)
                }
                False -> {
                    let #(v25, v26) = split_point_60(v2)
                    let v28 = method55(v25, Uh2Nil)
                    let v29 = method63(v28, v1)
                    let v37 =
                        case v26  {
                            Uh2Nil -> v4
                            _ -> {
                                let v31 = method55(v26, Uh2Nil)
                                let v33 = method64(v31, ListStringNil)
                                let v35 = concat_balanced_22("", v33)
                                ListStringCons(v35, v4)
                            }
                        }
                    chunk_59(v0, v29, Uh2Nil, 0, v37)
                }
            }
        }
        Uh2Nil -> {
            let v12 =
                case v2  {
                    Uh2Nil -> v4
                    _ -> {
                        let v6 = method55(v2, Uh2Nil)
                        let v8 = method64(v6, ListStringNil)
                        let v10 = concat_balanced_22("", v8)
                        ListStringCons(v10, v4)
                    }
                }
            method10(v12, ListStringNil)
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
    let v5 = { v1 } <> { " " }
    let v6 = int.to_string(v4)
    let v7 = { v5 } <> { v6 }
    let v8 = { v7 } <> { "/" }
    let v9 = { v8 } <> { v6 }
    let v10 = { v9 } <> { "\n" }
    let v11 = v2(v10)
    let v12 = spiral_wrap_signed(v0 - v11, 32)
    let v16 = chunk_59(v12, v3, Uh2Nil, 0, ListStringNil)
    let v18 = method65(v16, 0)
    let v19 = int.to_string(v18)
    let v20 = spiral_string_length(v19)
    let v21 = spiral_string_length(v6)
    let v22 = v20 > v21
    case v22 {
        True -> chunks_of_58(v0, v1, v2, v3, v18)
        False -> v16
    }
}

pub fn split_units_57(v0: Int, v1: String, v2: fn(String) -> Int, v3: Uh2) -> ListString {
    chunks_of_58(v0, v1, v2, v3, 9)
}

pub fn split_cell_on_45(v0: Us0, v1: String, v2: Int, v3: String) -> ListString {
    let v4 = closure7(#(v0))
    let v5 = unicode_erlang_nfc(v3)
    let v6 = units_on_46(v0, v5)
    let v17 =
        case v0  {
            Us0OnBluesky(v13, v14) -> v6
            Us0OnMastodon -> {
                linked_50(v6, 0, Uh2Nil)
            }
            Us0OnX -> {
                linked_50(v6, 0, Uh2Nil)
            }
        }
    split_units_57(v2, v1, v4, v17)
}

pub fn split_cell_0(v0: String, v1: Int, v2: String) -> ListString {
    let v4 = closure1(Nil)
    let v5 = defused_dots_by_2(v4, v2)
    let v6 = defused_entities_27(v5)
    split_cell_on_45(Us0OnX, v0, v1, v6)
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
    v2 < v0
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
            ListStringCons(v1, ListStringNil)
        }
        False -> {
            let v6 = v1 |> string.split(v0)
            let v7 = v6 |> spiral_array_from_list
            let v8 = v7.size
            let v10 = spiral_ref_new(Mut0(l0: 0, l1: ListStringNil))
            let v10 = loop0(v7, v8, v10)
            let v17 = spiral_ref_get(v10).l1
            method10(v17, ListStringNil)
        }
    }
}

pub fn blank_tail_length_72(v0: ListString, v1: Int) -> Int {
    case v0  {
        ListStringCons(v2, v3) -> {
            let v4 = string.to_utf_codepoints(v2)
            let v5 = v4 |> list.reverse
            let listm_fold = v5 |> list.fold (Uh3Nil, fn (acc, x) {
            let v7 = x
            let v8 = string.utf_codepoint_to_int(v7)
            let v9 = acc
            Uh3Cons(v8, v9)
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
            let v5 = ListStringCons("", v1)
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
                            let v10 = v4 |> string.starts_with(" ")
                            let v13 =
                                case v10 {
                                    True -> True
                                    False -> {
                                        v4 |> string.starts_with("\t")
                                    }
                                }
                            v13 == False
                        }
                        False -> False
                    }
                let #(v42, v43, v44, v45) =
                    case v15 {
                        True -> {
                            let v17 = method10(v1, ListStringNil)
                            let v19 = concat_balanced_22("\n", v17)
                            let v20 = spiral_string_length(v19)
                            let v21 = string.to_graphemes(v19)
                            let v22 = v21 |> list.reverse
                            let listm_fold = v22 |> list.fold (ListStringNil, fn (acc, x) {
                            let v24 = x
                            let v25 = acc
                            ListStringCons(v24, v25)
                            })
                            let v27 = listm_fold
                            let v29 = method10(v27, ListStringNil)
                            let v31 = blank_tail_length_72(v29, 0)
                            let v32 = spiral_wrap_signed(v20 - v31, 32)
                            let v33 = spiral_wrap_signed(v32 - 1, 32)
                            let v34 = spiral_string_slice(v19, 0, v33)
                            let v35 = spiral_wrap_signed(v2 - 1, 32)
                            let v37 = with_blanks_73(v35, ListStringNil)
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
    let v2 = "\n"
    let v3 = v0 |> string.replace("\r\n", v2)
    let v4 = v3 |> string.ends_with(v2)
    let v9 =
        case v4 {
            True -> {
                let v5 = spiral_string_length(v3)
                let v6 = spiral_wrap_signed(v5 - 1, 32)
                let v7 = spiral_wrap_signed(v6 - 1, 32)
                spiral_string_slice(v3, 0, v7)
            }
            False -> v3
        }
    let v10 = v9 == ""
    case v10 {
        True -> ListStringNil
        False -> {
            let v12 = split_list_68(v2, v9)
            let #(v17, v18, v19, _v20) = method70(v12, ListStringNil, ListStringNil, 0, False)
            let v21 = with_blanks_73(v19, v18)
            let v23 = method10(v21, ListStringNil)
            let v24 = concat_balanced_22(v2, v23)
            let v25 = spiral_string_length(v24)
            let v26 = string.to_graphemes(v24)
            let v27 = v26 |> list.reverse
            let listm_fold = v27 |> list.fold (ListStringNil, fn (acc, x) {
            let v29 = x
            let v30 = acc
            ListStringCons(v29, v30)
            })
            let v32 = listm_fold
            let v34 = method10(v32, ListStringNil)
            let v36 = blank_tail_length_72(v34, 0)
            let v37 = spiral_wrap_signed(v25 - v36, 32)
            let v38 = spiral_wrap_signed(v37 - 1, 32)
            let v39 = spiral_string_slice(v24, 0, v38)
            let v41 = ListStringCons(v39, ListStringNil)
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
        let v12 = { "c" } <> { v11 }
        let v17 =
            case v0  {
                Us0OnBluesky(v13, v14) -> 300
                Us0OnMastodon -> 500
                Us0OnX -> 280
            }
        split_cell_on_45(v0, v12, v17, v10)
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
            let v10 = { v0 } <> { " " }
            let v11 = int.to_string(v2)
            let v12 = { v10 } <> { v11 }
            let v13 = { v12 } <> { "/" }
            let v14 = int.to_string(v1)
            let v15 = { v13 } <> { v14 }
            let v16 = { v15 } <> { "\n" }
            let v17 = { v16 } <> { v7 }
            let v18 = spiral_string_length(v17)
            let v19 = string.to_graphemes(v17)
            let v20 = v19 |> list.reverse
            let listm_fold = v20 |> list.fold (ListStringNil, fn (acc, x) {
            let v22 = x
            let v23 = acc
            ListStringCons(v22, v23)
            })
            let v25 = listm_fold
            let v27 = method10(v25, ListStringNil)
            let v29 = blank_tail_length_72(v27, 0)
            let v30 = spiral_wrap_signed(v18 - v29, 32)
            let v31 = spiral_wrap_signed(v30 - 1, 32)
            let v32 = spiral_string_slice(v17, 0, v31)
            let v33 = ListStringCons(v32, v4)
            numbered_78(v0, v1, v9, v8, v33)
        }
        ListStringNil -> {
            method10(v4, ListStringNil)
        }
    }
}

pub fn cell_posts_by_77(v0: fn(Int) -> fn(String) -> ListString, v1: Int, v2: String) -> ListString {
    let v3 = v0(v1)
    let v4 = v3(v2)
    let v8 =
        case v4  {
            ListStringNil -> {
                ListStringCons("", ListStringNil)
            }
            _ -> v4
        }
    let v9 = int.to_string(v1)
    let v10 = { "c" } <> { v9 }
    let v12 = method65(v8, 0)
    numbered_78(v10, v12, 1, v8, ListStringNil)
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
            let v5 = method79(v3, Uh4Nil)
            method80(v5, ListStringNil)
        }
    }
}

pub fn thread_on_75(v0: Us0, v1: Int, v2: ListString, v3: Uh4) -> ListString {
    let v4 = closure14(#(v0))
    thread_by_76(v4, v1, v2, v3)
}

pub fn thread_of_74(v0: Int, v1: ListString, v2: Uh4) -> ListString {
    thread_on_75(Us0OnX, v0, v1, v2)
}

pub fn closure13(capt: Nil) -> fn(String) -> ListString {
    fn (v0) {
        let v2 = file_cells_67(v0)
        thread_of_74(1, v2, Uh4Nil)
    }
}

pub fn main() {
    let _v0 = closure0(Nil)
    let _ = Nil
    let _v1 = closure11(Nil)
    let _ = Nil
    let _v2 = closure12(Nil)
    let _ = Nil
    let _v3 = closure13(Nil)
    let _ = Nil
    0
}
