import gleam/int
import gleam/string
import xsim_frames/types.{type Uh0, type Uh1, type Uh2, type Uh3, type Uh4, type Us2, type Us14, type Uh8, type Uh9, type Uh10, type Uh11, type Uh13, type Uh14, type Us20, Uh0Cons, Uh0Nil, Uh10Cons, Uh10Nil, Uh11Cons, Uh11Nil, Uh13Cons, Uh13Nil, Uh14Cons, Uh14Nil, Uh2Nil, Uh3Cons, Uh3Nil, Uh6Cons, Uh6Nil, Uh8Cons, Uh8Nil, Uh9Cons, Us12Broken, Us12Held, Us13NoStaleResults, Us13OneCompilePerPrefix, Us13SequentialEquivalence, Us13UnwantedResultsFreed, Us13WithdrawnDemandHidden, Us14Breaker, Us14Editor, Us14Fickle, Us14Lurker, Us15None, Us15Some, Us16Reaction, Us16Revision, Us18Edited, Us19Unliked, Us20None, Us20Some, Us2Some, Us3Some}
import xsim_frames/part1.{count_of_text_10, method4, spiral_string_index, spiral_string_length, spiral_string_slice, spiral_wrap_signed, spiral_wrap_unsigned, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part2.{delimited_21, masked_cells_28, masked_threads_29, method20, method24, method30, method32, method33, method36, method37, method40, method43, snapshot_read_1, taken_31}

pub fn checked_text_0(v0: String) -> String {
    let #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10) = snapshot_read_1(v0)
    let v12 = method20(v10, 0)
    let v13 = v12 > 0
    case v13 {
        True -> {
            let v16 = method4(v10, Uh3Nil)
            let v17 = delimited_21(",", v16)
            let v18 = { "unknown_rows=" } <> { v17 }
            v18
        }
        False -> {
            let v20 = method24(v1, v2, v3, v4, v5, v6, v7, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v1, Uh0Nil)
            let v22 = method30(v20, Uh3Nil)
            let v27 =
                case v22  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v25 = taken_31(5, v22)
                        Us12Broken(v25)
                    }
                }
            let v29 = method32(v1, v2, v3, v4, v5, v6, v7, v1, Uh0Nil)
            let v31 = method30(v29, Uh3Nil)
            let v36 =
                case v31  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v34 = taken_31(5, v31)
                        Us12Broken(v34)
                    }
                }
            let v38 = method33(v1, v2, v3, v4, v5, v6, v7, v3, Uh2Nil)
            let v40 = method36(v38, Uh3Nil)
            let v45 =
                case v40  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v43 = taken_31(5, v40)
                        Us12Broken(v43)
                    }
                }
            let v47 = method37(v1, v2, v3, v4, v5, v6, v7, v1, Uh0Nil)
            let v49 = method30(v47, Uh3Nil)
            let v54 =
                case v49  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v52 = taken_31(5, v49)
                        Us12Broken(v52)
                    }
                }
            let v82 =
                case v7 {
                    True -> {
                        let v56 = method40(v1, v2, v3, v4, v5, v6, v7, v6, Uh3Nil)
                        let v61 =
                            case v56  {
                                Uh3Nil -> Us12Held
                                _ -> {
                                    let v59 = taken_31(5, v56)
                                    Us12Broken(v59)
                                }
                            }
                        let v68 = Uh6Cons(Us13UnwantedResultsFreed, v61, Uh6Nil)
                        let v69 = Uh6Cons(Us13WithdrawnDemandHidden, v54, v68)
                        let v70 = Uh6Cons(Us13OneCompilePerPrefix, v45, v69)
                        let v71 = Uh6Cons(Us13NoStaleResults, v36, v70)
                        Uh6Cons(Us13SequentialEquivalence, v27, v71)
                    }
                    False -> {
                        let v78 = Uh6Cons(Us13WithdrawnDemandHidden, v54, Uh6Nil)
                        let v79 = Uh6Cons(Us13OneCompilePerPrefix, v45, v78)
                        let v80 = Uh6Cons(Us13NoStaleResults, v36, v79)
                        Uh6Cons(Us13SequentialEquivalence, v27, v80)
                    }
                }
            let v84 = method43(v82, Uh3Nil)
            delimited_21(" ", v84)
        }
    }
}

pub fn closure0(capt: Nil) -> fn(String) -> String {
    fn (v0) {
        checked_text_0(v0)
    }
}

pub fn closure6(capt: #(String, String, Bool, String)) -> fn(#(String, String, Bool, String)) -> Bool {
    fn (dom) {
        let #(v4, _v5, v6, v7) = dom
        let #(v0, _v1, v2, v3) = capt
        let v8 = v4 == v0
        case v8 {
            True -> {
                let v10 = ""
                let v11 = masked_cells_28(v7, 0, v10)
                let v13 = masked_threads_29(v11, 0, v10)
                let v15 = masked_cells_28(v3, 0, v10)
                let v17 = masked_threads_29(v15, 0, v10)
                let v18 = v6 == v2
                case v18 {
                    True -> {
                        v13 == v17
                    }
                    False -> False
                }
            }
            False -> False
        }
    }
}

pub fn method48(v0: String, v1: String, v2: Bool, v3: String) -> fn(#(String, String, Bool, String)) -> Bool {
    closure6(#(v0, v1, v2, v3))
}

pub fn method49(v0: String, v1: String, v2: Bool, v3: String, v4: fn(#(String, String, Bool, String)) -> Bool, v5: Uh0) -> Bool {
    case v5  {
        Uh0Cons(v6, v7, v8, v9, v10) -> {
            let v11 = v4(#(v6, v7, v8, v9))
            case v11 {
                True -> True
                False -> {
                    let v12 = method48(v0, v1, v2, v3)
                    method49(v0, v1, v2, v3, v12, v10)
                }
            }
        }
        Uh0Nil -> False
    }
}

pub fn method47(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh0, v8: Uh0) -> Uh0 {
    case v7  {
        Uh0Cons(v9, v10, v11, v12, v13) -> {
            let v14 = method47(v0, v1, v2, v3, v4, v5, v6, v13, v8)
            let v15 = method48(v9, v10, v11, v12)
            let v16 = method49(v9, v10, v11, v12, v15, v0)
            let v17 = v16 == False
            case v17 {
                True -> Uh0Cons(v9, v10, v11, v12, v14)
                False -> v14
            }
        }
        Uh0Nil -> v8
    }
}

pub fn method50(v0: Uh0, v1: Int) -> Int {
    case v0  {
        Uh0Cons(v2, v3, v4, v5, v6) -> {
            let v7 = spiral_wrap_signed(v1 + 1, 32)
            method50(v6, v7)
        }
        Uh0Nil -> v1
    }
}

pub fn commute_text_46(v0: String, v1: String) -> String {
    let #(v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10, v11) = snapshot_read_1(v0)
    let #(v12, v13, v14, v15, v16, v17, v18, _v19, _v20, v21) = snapshot_read_1(v1)
    let v23 = method20(v11, 0)
    let v24 = v23 > 0
    case v24 {
        True -> {
            let v27 = method4(v11, Uh3Nil)
            let v28 = delimited_21(",", v27)
            let v29 = { "unknown_rows=" } <> { v28 }
            v29
        }
        False -> {
            let v31 = method20(v21, 0)
            let v32 = v31 > 0
            case v32 {
                True -> {
                    let v35 = method4(v21, Uh3Nil)
                    let v36 = delimited_21(",", v35)
                    let v37 = { "unknown_rows=" } <> { v36 }
                    v37
                }
                False -> {
                    let v39 = method47(v12, v13, v14, v15, v16, v17, v18, v2, Uh0Nil)
                    let v41 = method30(v39, Uh3Nil)
                    let v46 =
                        case v41  {
                            Uh3Nil -> Us12Held
                            _ -> {
                                let v44 = taken_31(5, v41)
                                Us12Broken(v44)
                            }
                        }
                    let v56 =
                        case v46  {
                            Us12Held -> {
                                let v48 = method50(v2, 0)
                                let v50 = method50(v12, 0)
                                let v51 = v48 == v50
                                case v51 {
                                    True -> Us12Held
                                    False -> {
                                        Us12Broken(Uh3Nil)
                                    }
                                }
                            }
                            _ -> v46
                        }
                    case v56  {
                        Us12Broken(v58) -> {
                            let v60 = delimited_21(",", v58)
                            let v61 = { "FAIL[" } <> { v60 }
                            let v62 = { v61 } <> { "]" }
                            v62
                        }
                        Us12Held -> {
                            "ok"
                        }
                    }
                }
            }
        }
    }
}

pub fn closure5(capt: Nil) -> fn(#(String, String)) -> String {
    fn (dom) {
        let #(v0, v1) = dom
        commute_text_46(v0, v1)
    }
}

pub fn closure8(capt: #(String)) -> fn(String) -> Bool {
    fn (v1) {
        let #(v0) = capt
        v0 == v1
    }
}

pub fn method53(v0: String) -> fn(String) -> Bool {
    closure8(#(v0))
}

pub fn method54(v0: String, v1: fn(String) -> Bool, v2: Uh3) -> Bool {
    case v2  {
        Uh3Cons(v3, v4) -> {
            let v5 = v1(v3)
            case v5 {
                True -> True
                False -> {
                    let v6 = method53(v0)
                    method54(v0, v6, v4)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn method52(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh4, v8: Uh3, v9: Uh3, v10: Uh0, v11: Uh0) -> Uh0 {
    case v10  {
        Uh0Cons(v12, v13, v14, v15, v16) -> {
            let v17 = method52(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v16, v11)
            let v18 = method53(v12)
            let v19 = method54(v12, v18, v8)
            let v20 = v19 && v14
            case v20 {
                True -> Uh0Cons(v12, v13, v14, v15, v17)
                False -> v17
            }
        }
        Uh0Nil -> v11
    }
}

pub fn breaking_text_51(v0: String) -> String {
    let #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10) = snapshot_read_1(v0)
    let v12 = method20(v10, 0)
    let v13 = v12 > 0
    case v13 {
        True -> {
            let v16 = method4(v10, Uh3Nil)
            let v17 = delimited_21(",", v16)
            let v18 = { "unknown_rows=" } <> { v17 }
            v18
        }
        False -> {
            let v20 = method52(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v1, Uh0Nil)
            let v22 = method30(v20, Uh3Nil)
            let v27 =
                case v22  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v25 = taken_31(5, v22)
                        Us12Broken(v25)
                    }
                }
            case v27  {
                Us12Broken(v29) -> {
                    let v31 = delimited_21(",", v29)
                    let v32 = { "FAIL[" } <> { v31 }
                    let v33 = { v32 } <> { "]" }
                    v33
                }
                Us12Held -> {
                    "ok"
                }
            }
        }
    }
}

pub fn closure7(capt: Nil) -> fn(String) -> String {
    fn (v0) {
        breaking_text_51(v0)
    }
}

pub fn masked_text_55(v0: String) -> String {
    let v2 = ""
    let v3 = masked_cells_28(v0, 0, v2)
    masked_threads_29(v3, 0, v2)
}

pub fn closure9(capt: Nil) -> fn(String) -> String {
    fn (v0) {
        masked_text_55(v0)
    }
}

pub fn method56(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method56(v3, v1)
            let v5 = v2 != ""
            case v5 {
                True -> Uh3Cons(v2, v4)
                False -> v4
            }
        }
        Uh3Nil -> v1
    }
}

pub fn method58(v0: String, v1: Int, v2: Int) -> Int {
    let v3 = v2 >= v1
    case v3 {
        True -> v1
        False -> {
            let v4 = spiral_string_index(v0, v2)
            let v5 = v4 == " "
            let v11 =
                case v5 {
                    True -> True
                    False -> {
                        let v6 = v4 == "\t"
                        case v6 {
                            True -> True
                            False -> {
                                let v7 = v4 == "\r"
                                case v7 {
                                    True -> True
                                    False -> {
                                        v4 == "\n"
                                    }
                                }
                            }
                        }
                    }
                }
            case v11 {
                True -> {
                    let v12 = spiral_wrap_signed(v2 + 1, 32)
                    method58(v0, v1, v12)
                }
                False -> v2
            }
        }
    }
}

pub fn method59(v0: String, v1: Int) -> Int {
    let v2 = v1 <= 0
    case v2 {
        True -> -1
        False -> {
            let v3 = spiral_wrap_signed(v1 - 1, 32)
            let v4 = spiral_string_index(v0, v3)
            let v5 = v4 == " "
            let v11 =
                case v5 {
                    True -> True
                    False -> {
                        let v6 = v4 == "\t"
                        case v6 {
                            True -> True
                            False -> {
                                let v7 = v4 == "\r"
                                case v7 {
                                    True -> True
                                    False -> {
                                        v4 == "\n"
                                    }
                                }
                            }
                        }
                    }
                }
            case v11 {
                True -> method59(v0, v3)
                False -> v3
            }
        }
    }
}

pub fn method60(v0: Int, v1: Us14, v2: Int) -> Uh8 {
    let v3 = v2 < v0
    case v3 {
        True -> {
            let v4 = spiral_wrap_signed(v2 + 1, 32)
            let v5 = method60(v0, v1, v4)
            Uh8Cons(v1, v5)
        }
        False -> Uh8Nil
    }
}

pub fn method61(v0: Uh8, v1: Uh8) -> Uh8 {
    case v0  {
        Uh8Cons(v2, v3) -> {
            let v4 = method61(v3, v1)
            Uh8Cons(v2, v4)
        }
        Uh8Nil -> v1
    }
}

pub fn method57(v0: Uh3, v1: Uh8) -> Uh8 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method57(v3, v1)
            let v5 = spiral_string_length(v2)
            let v7 = method58(v2, v5, 0)
            let v8 = spiral_wrap_signed(v5 - 1, 32)
            let v9 = spiral_string_slice(v2, v7, v8)
            let v10 = spiral_string_length(v9)
            let v11 = method59(v9, v10)
            let v12 = spiral_string_slice(v9, 0, v11)
            let v14 = split_list_2("=", v12)
            let v50 =
                case v14  {
                    Uh3Cons(v15, v16) -> {
                        case v16  {
                            Uh3Cons(v17, v18) -> {
                                case v18  {
                                    Uh3Nil -> {
                                        let v19 = v15 == "lurker"
                                        let v35 =
                                            case v19 {
                                                True -> {
                                                    Us15Some(Us14Lurker)
                                                }
                                                False -> {
                                                    let v22 = v15 == "fickle"
                                                    case v22 {
                                                        True -> {
                                                            Us15Some(Us14Fickle)
                                                        }
                                                        False -> {
                                                            let v25 = v15 == "editor"
                                                            case v25 {
                                                                True -> {
                                                                    Us15Some(Us14Editor)
                                                                }
                                                                False -> {
                                                                    let v28 = v15 == "breaker"
                                                                    case v28 {
                                                                        True -> {
                                                                            Us15Some(Us14Breaker)
                                                                        }
                                                                        False -> Us15None
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        let v36 = count_of_text_10(v17)
                                        case v35  {
                                            Us15Some(v37) -> {
                                                case v36  {
                                                    Us3Some(v38) -> {
                                                        method60(v38, v37, 0)
                                                    }
                                                    _ -> Uh8Nil
                                                }
                                            }
                                            _ -> Uh8Nil
                                        }
                                    }
                                    _ -> Uh8Nil
                                }
                            }
                            _ -> Uh8Nil
                        }
                    }
                    _ -> Uh8Nil
                }
            method61(v50, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method62(v0: String, v1: Uh3, v2: Uh9) -> Uh9 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method62(v0, v4, v2)
            let v6 = split_list_2(v0, v3)
            Uh9Cons(v6, v5)
        }
        Uh3Nil -> v2
    }
}

pub fn method66(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh8, v6: Bool, v7: String, v8: Uh3, v9: Uh10, v10: Us2, v11: Int) -> #(Uh10, Us2, Int) {
    let #(v35, v36, v37) =
        case v8  {
            Uh3Cons(v12, v13) -> {
                let v14 = { v7 } <> { "p" }
                let v15 = int.to_string(v11)
                let v16 = { v14 } <> { v15 }
                let v17 = spiral_string_length(v12)
                let v19 = method58(v12, v17, 0)
                let v20 = spiral_wrap_signed(v17 - 1, 32)
                let v21 = spiral_string_slice(v12, v19, v20)
                let v23 = v21 |> string.starts_with("///- --test")
                let v24 = v23 && v6
                let v26 =
                    case v24 {
                        True -> v10
                        False -> Us2Some(v16)
                    }
                let v27 = spiral_wrap_signed(v11 + 1, 32)
                let v28 = Uh10Cons(v16, v10, v12, v9)
                method66(v0, v1, v2, v3, v4, v5, v6, v7, v13, v28, v26, v27)
            }
            _ -> {
                let #(v32, v33, v34) =
                    case v8  {
                        Uh3Nil -> #(v9, v10, v11)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v32, v33, v34)
            }
        }
    #(v35, v36, v37)
}

pub fn method67(v0: Uh10, v1: Uh10) -> Uh10 {
    case v0  {
        Uh10Cons(v2, v3, v4, v5) -> {
            let v6 = Uh10Cons(v2, v3, v4, v1)
            method67(v5, v6)
        }
        Uh10Nil -> v1
    }
}

pub fn word_from_69(v0: Int) -> #(Int, Int) {
    let v1 = spiral_wrap_unsigned(v0 + 11400714819323198485, 64)
    let v2 = int.bitwise_shift_right(v1, 30)
    let v3 = int.bitwise_exclusive_or(v1, v2)
    let v4 = spiral_wrap_unsigned(v3 * 13787848793156543929, 64)
    let v5 = int.bitwise_shift_right(v4, 27)
    let v6 = int.bitwise_exclusive_or(v4, v5)
    let v7 = spiral_wrap_unsigned(v6 * 10723151780598845931, 64)
    let v8 = int.bitwise_shift_right(v7, 31)
    let v9 = int.bitwise_exclusive_or(v7, v8)
    let v10 = int.bitwise_and(v9, 288230376151711743)
    let v11 = v10 == 0
    case v11 {
        True -> word_from_69(v1)
        False -> #(v10, v1)
    }
}

pub fn seeded_68(v0: Int, v1: Int, v2: Int) -> #(Int, Int) {
    let #(_v3, v4) = word_from_69(v0)
    let v5 = int.bitwise_exclusive_or(v1, v4)
    let #(v6, v7) = word_from_69(v5)
    let v8 = int.bitwise_exclusive_or(v2, v7)
    let #(v9, _v10) = word_from_69(v8)
    #(v6, v9)
}

pub fn stepped_72(v0: Int, v1: Int) -> #(Int, Int, Int) {
    let v2 = int.bitwise_and(v1, 288230376151711743)
    let v3 = int.bitwise_and(v2, 72057594037927935)
    let v4 = spiral_wrap_unsigned(int.bitwise_shift_left(v3, 2), 64)
    let v5 = spiral_wrap_unsigned(v2 + v4, 64)
    let v6 = int.bitwise_and(v5, 2251799813685247)
    let v7 = spiral_wrap_unsigned(int.bitwise_shift_left(v6, 7), 64)
    let v8 = int.bitwise_shift_right(v5, 51)
    let v9 = int.bitwise_and(v8, 127)
    let v10 = int.bitwise_or(v7, v9)
    let v11 = int.bitwise_and(v10, 36028797018963967)
    let v12 = spiral_wrap_unsigned(int.bitwise_shift_left(v11, 3), 64)
    let v13 = spiral_wrap_unsigned(v10 + v12, 64)
    let v14 = int.bitwise_and(v13, 288230376151711743)
    let v15 = int.bitwise_and(v0, 288230376151711743)
    let v16 = int.bitwise_and(v0, 17179869183)
    let v17 = spiral_wrap_unsigned(int.bitwise_shift_left(v16, 24), 64)
    let v18 = int.bitwise_exclusive_or(v15, v17)
    let v19 = int.bitwise_exclusive_or(v18, v2)
    let v20 = int.bitwise_shift_right(v18, 11)
    let v21 = int.bitwise_shift_right(v2, 41)
    let v22 = int.bitwise_exclusive_or(v20, v21)
    let v23 = int.bitwise_exclusive_or(v19, v22)
    #(v14, v2, v23)
}

pub fn uniform_71(v0: Int, v1: Int, v2: Int) -> #(Int, Int, Int) {
    let #(v3, v4, v5) = stepped_72(v1, v2)
    let v6 = v3 % v0
    let v7 = v3 < v0
    case v7 {
        True -> {
            let v8 = spiral_wrap_unsigned(v3 + 1, 64)
            #(v8, v4, v5)
        }
        False -> {
            let v9 = spiral_wrap_unsigned(v3 - v6, 64)
            let v10 = spiral_wrap_unsigned(288230376151711744 - v0, 64)
            let v11 = v9 <= v10
            case v11 {
                True -> {
                    let v12 = spiral_wrap_unsigned(v6 + 1, 64)
                    #(v12, v4, v5)
                }
                False -> uniform_71(v0, v4, v5)
            }
        }
    }
}

pub fn method73(v0: Int, v1: String, v2: Us2, v3: String, v4: Int) -> Uh13 {
    let v5 = v4 < v0
    case v5 {
        True -> {
            let v6 = spiral_wrap_signed(v4 + 1, 32)
            let v7 = int.to_string(v6)
            let v8 = { "u" } <> { v7 }
            let v9 = method73(v0, v1, v2, v3, v6)
            Uh13Cons(v1, v8, v9)
        }
        False -> Uh13Nil
    }
}

pub fn method74(v0: Uh13, v1: Uh13) -> Uh13 {
    case v0  {
        Uh13Cons(v2, v3, v4) -> {
            let v5 = Uh13Cons(v2, v3, v1)
            method74(v4, v5)
        }
        Uh13Nil -> v1
    }
}

pub fn method70(v0: Int, v1: Uh10, v2: Uh13, v3: Int, v4: Int) -> #(Uh13, Int, Int) {
    case v1  {
        Uh10Cons(v5, v6, v7, v8) -> {
            let v9 = spiral_wrap_unsigned(v0, 64)
            let #(v10, v11, v12) = uniform_71(v9, v3, v4)
            let v13 = spiral_wrap_signed(v10, 32)
            let v15 = method73(v13, v5, v6, v7, 0)
            let v16 = method74(v15, v2)
            method70(v0, v8, v16, v11, v12)
        }
        Uh10Nil -> #(v2, v3, v4)
    }
}

pub fn method75(v0: Uh13, v1: Uh13) -> Uh13 {
    case v0  {
        Uh13Cons(v2, v3, v4) -> {
            let v5 = Uh13Cons(v2, v3, v1)
            method75(v4, v5)
        }
        Uh13Nil -> v1
    }
}

pub fn method77(v0: Uh11, v1: Uh11) -> Uh11 {
    case v0  {
        Uh11Cons(v2, v3) -> {
            let v4 = method77(v3, v1)
            Uh11Cons(v2, v4)
        }
        Uh11Nil -> v1
    }
}

pub fn method76(v0: Uh13, v1: Uh11, v2: Int, v3: Int) -> #(Uh11, Int, Int) {
    case v0  {
        Uh13Cons(v4, v5, v6) -> {
            let #(v8, v9, v10) = uniform_71(10, v2, v3)
            let v11 = spiral_wrap_signed(v8, 32)
            let v12 = v11 == 1
            let v18 =
                case v12 {
                    True -> {
                        let v13 = Us19Unliked(v4, v5)
                        let v14 = Us16Reaction(v13)
                        let v16 = Uh11Cons(v14, Uh11Nil)
                        method77(v1, v16)
                    }
                    False -> v1
                }
            method76(v6, v18, v9, v10)
        }
        Uh13Nil -> #(v1, v2, v3)
    }
}

pub fn method78(v0: Uh10, v1: Uh10) -> Uh10 {
    case v0  {
        Uh10Cons(v2, v3, v4, v5) -> {
            let v6 = method78(v5, v1)
            let v8 = v4 |> string.contains("///- --test")
            let v9 = v8 == False
            case v9 {
                True -> Uh10Cons(v2, v3, v4, v6)
                False -> v6
            }
        }
        Uh10Nil -> v1
    }
}

pub fn method79(v0: Int, v1: Int) -> Uh14 {
    let v2 = v1 < v0
    case v2 {
        True -> {
            let v3 = spiral_wrap_signed(v1 + 1, 32)
            let v4 = method79(v0, v3)
            Uh14Cons(v1, v4)
        }
        False -> Uh14Nil
    }
}

pub fn method81(v0: Uh10, v1: Int) -> Int {
    case v0  {
        Uh10Cons(v2, v3, v4, v5) -> {
            let v6 = spiral_wrap_signed(v1 + 1, 32)
            method81(v5, v6)
        }
        Uh10Nil -> v1
    }
}

pub fn picked_82(v0: Int, v1: Uh10) -> Us20 {
    case v1  {
        Uh10Cons(v2, v3, v4, v5) -> {
            let v6 = v0 <= 0
            case v6 {
                True -> Us20Some(v2, v3, v4)
                False -> {
                    let v8 = spiral_wrap_signed(v0 - 1, 32)
                    picked_82(v8, v5)
                }
            }
        }
        Uh10Nil -> Us20None
    }
}

pub fn method80(v0: Uh10, v1: Uh14, v2: Uh11, v3: Int, v4: Int) -> #(Uh11, Int, Int) {
    case v1  {
        Uh14Cons(v5, v6) -> {
            let v8 = method81(v0, 0)
            let v9 = spiral_wrap_unsigned(v8, 64)
            let #(v10, v11, v12) = uniform_71(v9, v3, v4)
            let v13 = spiral_wrap_signed(v10, 32)
            let v14 = spiral_wrap_signed(v13 - 1, 32)
            let v15 = picked_82(v14, v0)
            let #(v28, v29, v30) =
                case v15  {
                    Us20None -> #(v2, v11, v12)
                    Us20Some(v16, v17, v18) -> {
                        let v19 = { v18 } <> { "\n" }
                        let v20 = Us18Edited(v16, v19)
                        let v21 = Us16Revision(v20)
                        let v23 = Uh11Cons(v21, Uh11Nil)
                        let v24 = method77(v2, v23)
                        #(v24, v11, v12)
                    }
                }
            method80(v0, v6, v28, v29, v30)
        }
        Uh14Nil -> #(v2, v3, v4)
    }
}

pub fn blank_start_85(v0: String, v1: Int) -> Int {
    let v2 = v1 > 0
    let v22 =
        case v2 {
            True -> {
                let v3 = spiral_wrap_signed(v1 - 1, 32)
                let v4 = spiral_string_slice(v0, 0, v3)
                let v5 = unicode_erlang_characters_to_binary([11])
                let v6 = unicode_erlang_characters_to_binary([12])
                let v8 = v4 |> string.ends_with(" ")
                case v8 {
                    True -> True
                    False -> {
                        let v10 = v4 |> string.ends_with("\t")
                        case v10 {
                            True -> True
                            False -> {
                                let v12 = v4 |> string.ends_with("\n")
                                case v12 {
                                    True -> True
                                    False -> {
                                        let v14 = v4 |> string.ends_with("\r")
                                        case v14 {
                                            True -> True
                                            False -> {
                                                let v15 = v4 |> string.ends_with(v5)
                                                case v15 {
                                                    True -> True
                                                    False -> {
                                                        v4 |> string.ends_with(v6)
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
            False -> False
        }
    case v22 {
        True -> {
            let v23 = spiral_wrap_signed(v1 - 1, 32)
            blank_start_85(v0, v23)
        }
        False -> v1
    }
}

pub fn digits_start_86(v0: String, v1: Int) -> Int {
    let v2 = v1 > 0
    let v34 =
        case v2 {
            True -> {
                let v3 = spiral_wrap_signed(v1 - 1, 32)
                let v4 = spiral_string_slice(v0, 0, v3)
                let v5 = int.to_string(0)
                let v6 = v4 |> string.ends_with(v5)
                case v6 {
                    True -> True
                    False -> {
                        let v7 = int.to_string(1)
                        let v8 = v4 |> string.ends_with(v7)
                        case v8 {
                            True -> True
                            False -> {
                                let v9 = int.to_string(2)
                                let v10 = v4 |> string.ends_with(v9)
                                case v10 {
                                    True -> True
                                    False -> {
                                        let v11 = int.to_string(3)
                                        let v12 = v4 |> string.ends_with(v11)
                                        case v12 {
                                            True -> True
                                            False -> {
                                                let v13 = int.to_string(4)
                                                let v14 = v4 |> string.ends_with(v13)
                                                case v14 {
                                                    True -> True
                                                    False -> {
                                                        let v15 = int.to_string(5)
                                                        let v16 = v4 |> string.ends_with(v15)
                                                        case v16 {
                                                            True -> True
                                                            False -> {
                                                                let v17 = int.to_string(6)
                                                                let v18 = v4 |> string.ends_with(v17)
                                                                case v18 {
                                                                    True -> True
                                                                    False -> {
                                                                        let v19 = int.to_string(7)
                                                                        let v20 = v4 |> string.ends_with(v19)
                                                                        case v20 {
                                                                            True -> True
                                                                            False -> {
                                                                                let v21 = int.to_string(8)
                                                                                let v22 = v4 |> string.ends_with(v21)
                                                                                case v22 {
                                                                                    True -> True
                                                                                    False -> {
                                                                                        let v23 = int.to_string(9)
                                                                                        v4 |> string.ends_with(v23)
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
                            }
                        }
                    }
                }
            }
            False -> False
        }
    case v34 {
        True -> {
            let v35 = spiral_wrap_signed(v1 - 1, 32)
            digits_start_86(v0, v35)
        }
        False -> v1
    }
}
