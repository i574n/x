import gleam/int
import gleam/string
import xsim_frames/types.{type Uh0, type Uh1, type Uh2, type Uh3, type Uh4, type Us0, type Us14, type Uh7, type Uh8, type Uh9, type Uh10, type Uh12, type Uh13, type Us20, Global, Uh0Cons, Uh0Nil, Uh10Cons, Uh10Nil, Uh12Cons, Uh12Nil, Uh13Cons, Uh13Nil, Uh3Cons, Uh3Nil, Uh7Cons, Uh7Nil, Uh8Cons, Uh9Cons, Uh9Nil, Us0Some, Us12Broken, Us12Held, Us14Breaker, Us14Editor, Us14Fickle, Us14Lurker, Us15None, Us15Some, Us16Reaction, Us16Revision, Us18Edited, Us19Unliked, Us20None, Us20Some, Us3Some}
import xsim_frames/part1.{count_of_text_7, spiral_string_index, spiral_string_length, spiral_string_slice, spiral_wrap_signed, spiral_wrap_unsigned, split_on_2, unicode_erlang_characters_to_binary, x_binary_split}
import xsim_frames/part2.{delimited_19, method17, method18, snapshot_read_1}
import xsim_frames/part3.{go_29, masked_cells_26, masked_threads_27, method28, method43, method46}

pub fn commute_text_42(v0: String, v1: String) -> String {
    let #(v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10, v11) = snapshot_read_1(v0)
    let #(v12, v13, v14, v15, v16, v17, v18, _v19, _v20, v21) = snapshot_read_1(v1)
    let v22 = 0
    let v23 = method17(v11, v22)
    let v24 = v23 > 0
    case v24 {
        True -> {
            let v25 = ","
            let v26 = Uh3Nil
            let v27 = method18(v11, v26)
            let v28 = delimited_19(v25, v27)
            let v29 = "unknown_rows="
            let v30 = v29 <> v28 
            v30
        }
        False -> {
            let v31 = 0
            let v32 = method17(v21, v31)
            let v33 = v32 > 0
            case v33 {
                True -> {
                    let v34 = ","
                    let v35 = Uh3Nil
                    let v36 = method18(v21, v35)
                    let v37 = delimited_19(v34, v36)
                    let v38 = "unknown_rows="
                    let v39 = v38 <> v37 
                    v39
                }
                False -> {
                    let v40 = Uh0Nil
                    let v41 = method43(v12, v13, v14, v15, v16, v17, v18, v2, v40)
                    let v42 = Uh3Nil
                    let v43 = method28(v41, v42)
                    let v48 =
                        case v43  {
                            Uh3Nil -> {
                                Us12Held
                            }
                            _ -> {
                                let v45 = 5
                                let v46 = go_29(v45, v43)
                                Us12Broken(v46)
                            }
                        }
                    let v58 =
                        case v48  {
                            Us12Held -> {
                                let v49 = 0
                                let v50 = method46(v2, v49)
                                let v51 = 0
                                let v52 = method46(v12, v51)
                                let v53 = v50 == v52
                                case v53 {
                                    True -> {
                                        Us12Held
                                    }
                                    False -> {
                                        let v55 = Uh3Nil
                                        Us12Broken(v55)
                                    }
                                }
                            }
                            _ -> {
                                v48
                            }
                        }
                    case v58  {
                        Us12Broken(v60) -> {
                            let v61 = ","
                            let v62 = delimited_19(v61, v60)
                            let v63 = "FAIL["
                            let v64 = v63 <> v62 
                            let v65 = "]"
                            let v66 = v64 <> v65 
                            v66
                        }
                        Us12Held -> {
                            let v59 = "ok"
                            v59
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
        commute_text_42(v0, v1)
    }
}

pub fn closure8(capt: #(String)) -> fn(String) -> Bool {
    fn (v1) {
        let #(v0) = capt
        let v2 = v0 == v1
        v2
    }
}

pub fn method49(v0: String) -> fn(String) -> Bool {
    closure8(#(v0))
}

pub fn method50(v0: String, v1: fn(String) -> Bool, v2: Uh3) -> Bool {
    case v2  {
        Uh3Cons(v3, v4) -> {
            let v5 = v1(v3)
            case v5 {
                True -> {
                    True
                }
                False -> {
                    let v6 = method49(v0)
                    method50(v0, v6, v4)
                }
            }
        }
        Uh3Nil -> {
            False
        }
    }
}

pub fn method48(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh4, v8: Uh3, v9: Uh3, v10: Uh0, v11: Uh0) -> Uh0 {
    case v10  {
        Uh0Cons(v12, v13, v14, v15, v16) -> {
            let v17 = method48(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v16, v11)
            let v18 = method49(v12)
            let v19 = method50(v12, v18, v8)
            let v20 = v19 && v14
            case v20 {
                True -> {
                    Uh0Cons(v12, v13, v14, v15, v17)
                }
                False -> {
                    v17
                }
            }
        }
        Uh0Nil -> {
            v11
        }
    }
}

pub fn breaking_text_47(v0: String) -> String {
    let #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10) = snapshot_read_1(v0)
    let v11 = 0
    let v12 = method17(v10, v11)
    let v13 = v12 > 0
    case v13 {
        True -> {
            let v14 = ","
            let v15 = Uh3Nil
            let v16 = method18(v10, v15)
            let v17 = delimited_19(v14, v16)
            let v18 = "unknown_rows="
            let v19 = v18 <> v17 
            v19
        }
        False -> {
            let v20 = Uh0Nil
            let v21 = method48(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v1, v20)
            let v22 = Uh3Nil
            let v23 = method28(v21, v22)
            let v28 =
                case v23  {
                    Uh3Nil -> {
                        Us12Held
                    }
                    _ -> {
                        let v25 = 5
                        let v26 = go_29(v25, v23)
                        Us12Broken(v26)
                    }
                }
            case v28  {
                Us12Broken(v30) -> {
                    let v31 = ","
                    let v32 = delimited_19(v31, v30)
                    let v33 = "FAIL["
                    let v34 = v33 <> v32 
                    let v35 = "]"
                    let v36 = v34 <> v35 
                    v36
                }
                Us12Held -> {
                    let v29 = "ok"
                    v29
                }
            }
        }
    }
}

pub fn closure7(capt: Nil) -> fn(String) -> String {
    fn (v0) {
        breaking_text_47(v0)
    }
}

pub fn masked_text_51(v0: String) -> String {
    let v1 = 0
    let v2 = ""
    let v3 = masked_cells_26(v0, v1, v2)
    let v4 = 0
    masked_threads_27(v3, v4, v2)
}

pub fn closure9(capt: Nil) -> fn(String) -> String {
    fn (v0) {
        masked_text_51(v0)
    }
}

pub fn method52(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method52(v3, v1)
            let v5 = v2 != ""
            case v5 {
                True -> {
                    Uh3Cons(v2, v4)
                }
                False -> {
                    v4
                }
            }
        }
        Uh3Nil -> {
            v1
        }
    }
}

pub fn method54(v0: String, v1: Int, v2: Int) -> Int {
    let v3 = v2 >= v1
    case v3 {
        True -> {
            v1
        }
        False -> {
            let v4 = spiral_string_index(v0, v2)
            let v5 = v4 == " "
            let v11 =
                case v5 {
                    True -> {
                        True
                    }
                    False -> {
                        let v6 = v4 == "\t"
                        case v6 {
                            True -> {
                                True
                            }
                            False -> {
                                let v7 = v4 == "\r"
                                case v7 {
                                    True -> {
                                        True
                                    }
                                    False -> {
                                        let v8 = v4 == "\n"
                                        v8
                                    }
                                }
                            }
                        }
                    }
                }
            case v11 {
                True -> {
                    let v12 = spiral_wrap_signed(v2 + 1, 32)
                    method54(v0, v1, v12)
                }
                False -> {
                    v2
                }
            }
        }
    }
}

pub fn method55(v0: String, v1: Int) -> Int {
    let v2 = v1 <= 0
    case v2 {
        True -> {
            -1
        }
        False -> {
            let v3 = spiral_wrap_signed(v1 - 1, 32)
            let v4 = spiral_string_index(v0, v3)
            let v5 = v4 == " "
            let v11 =
                case v5 {
                    True -> {
                        True
                    }
                    False -> {
                        let v6 = v4 == "\t"
                        case v6 {
                            True -> {
                                True
                            }
                            False -> {
                                let v7 = v4 == "\r"
                                case v7 {
                                    True -> {
                                        True
                                    }
                                    False -> {
                                        let v8 = v4 == "\n"
                                        v8
                                    }
                                }
                            }
                        }
                    }
                }
            case v11 {
                True -> {
                    method55(v0, v3)
                }
                False -> {
                    v3
                }
            }
        }
    }
}

pub fn method56(v0: Int, v1: Us14, v2: Int) -> Uh7 {
    let v3 = v2 < v0
    case v3 {
        True -> {
            let v4 = spiral_wrap_signed(v2 + 1, 32)
            let v5 = method56(v0, v1, v4)
            Uh7Cons(v1, v5)
        }
        False -> {
            Uh7Nil
        }
    }
}

pub fn method57(v0: Uh7, v1: Uh7) -> Uh7 {
    case v0  {
        Uh7Cons(v2, v3) -> {
            let v4 = method57(v3, v1)
            Uh7Cons(v2, v4)
        }
        Uh7Nil -> {
            v1
        }
    }
}

pub fn method53(v0: Uh3, v1: Uh7) -> Uh7 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method53(v3, v1)
            let v5 = "="
            let v6 = spiral_string_length(v2)
            let v7 = 0
            let v8 = method54(v2, v6, v7)
            let v9 = spiral_wrap_signed(v6 - 1, 32)
            let v10 = spiral_string_slice(v2, v8, v9)
            let v11 = spiral_string_length(v10)
            let v12 = method55(v10, v11)
            let v13 = spiral_string_slice(v10, 0, v12)
            let v14 = split_on_2(v5, v13)
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
                                                    let v20 = Us14Lurker
                                                    Us15Some(v20)
                                                }
                                                False -> {
                                                    let v22 = v15 == "fickle"
                                                    case v22 {
                                                        True -> {
                                                            let v23 = Us14Fickle
                                                            Us15Some(v23)
                                                        }
                                                        False -> {
                                                            let v25 = v15 == "editor"
                                                            case v25 {
                                                                True -> {
                                                                    let v26 = Us14Editor
                                                                    Us15Some(v26)
                                                                }
                                                                False -> {
                                                                    let v28 = v15 == "breaker"
                                                                    case v28 {
                                                                        True -> {
                                                                            let v29 = Us14Breaker
                                                                            Us15Some(v29)
                                                                        }
                                                                        False -> {
                                                                            Us15None
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        let v36 = count_of_text_7(v17)
                                        case v35  {
                                            Us15Some(v37) -> {
                                                case v36  {
                                                    Us3Some(v38) -> {
                                                        let v39 = 0
                                                        method56(v38, v37, v39)
                                                    }
                                                    _ -> {
                                                        Uh7Nil
                                                    }
                                                }
                                            }
                                            _ -> {
                                                Uh7Nil
                                            }
                                        }
                                    }
                                    _ -> {
                                        Uh7Nil
                                    }
                                }
                            }
                            _ -> {
                                Uh7Nil
                            }
                        }
                    }
                    _ -> {
                        Uh7Nil
                    }
                }
            method57(v50, v4)
        }
        Uh3Nil -> {
            v1
        }
    }
}

pub fn listed_pieces_58(v0: List(String), v1: Uh3) -> Uh3 {
    let v2 = case v0 { [] -> True _ -> False }
    case v2 {
        True -> {
            let v3 = Uh3Nil
            method18(v1, v3)
        }
        False -> {
            let v5 = case v0 { [_, ..t] -> t [] -> [] }
            let v6 = case v0 { [h, ..] -> h [] -> "" }
            let v7 = Uh3Cons(v6, v1)
            listed_pieces_58(v5, v7)
        }
    }
}

pub fn method59(v0: String, v1: Uh3, v2: Uh8) -> Uh8 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method59(v0, v4, v2)
            let v6 = x_binary_split(v3, v0, [Global])
            let v7 = Uh3Nil
            let v8 = listed_pieces_58(v6, v7)
            Uh8Cons(v8, v5)
        }
        Uh3Nil -> {
            v2
        }
    }
}

pub fn method63(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh7, v6: Bool, v7: String, v8: Uh3, v9: Uh9, v10: Us0, v11: Int) -> #(Uh9, Us0, Int) {
    let #(v36, v37, v38) =
        case v8  {
            Uh3Cons(v12, v13) -> {
                let v14 = "p"
                let v15 = v7 <> v14 
                let v16 = string.inspect(v11)
                let v17 = v15 <> v16 
                let v18 = spiral_string_length(v12)
                let v19 = 0
                let v20 = method54(v12, v18, v19)
                let v21 = spiral_wrap_signed(v18 - 1, 32)
                let v22 = spiral_string_slice(v12, v20, v21)
                let v23 = "///- --test"
                let v24 = v22 |> string.starts_with(v23)
                let v25 = v24 && v6
                let v27 =
                    case v25 {
                        True -> {
                            v10
                        }
                        False -> {
                            Us0Some(v17)
                        }
                    }
                let v28 = spiral_wrap_signed(v11 + 1, 32)
                let v29 = Uh9Cons(v17, v10, v12, v9)
                method63(v0, v1, v2, v3, v4, v5, v6, v7, v13, v29, v27, v28)
            }
            _ -> {
                let #(v33, v34, v35) =
                    case v8  {
                        Uh3Nil -> {
                            #(v9, v10, v11)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v33, v34, v35)
            }
        }
    #(v36, v37, v38)
}

pub fn method64(v0: Uh9, v1: Uh9) -> Uh9 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = Uh9Cons(v2, v3, v4, v1)
            method64(v5, v6)
        }
        Uh9Nil -> {
            v1
        }
    }
}

pub fn word_from_66(v0: Int) -> #(Int, Int) {
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
        True -> {
            word_from_66(v1)
        }
        False -> {
            #(v10, v1)
        }
    }
}

pub fn seeded_65(v0: Int, v1: Int, v2: Int) -> #(Int, Int) {
    let #(_v3, v4) = word_from_66(v0)
    let v5 = int.bitwise_exclusive_or(v1, v4)
    let #(v6, v7) = word_from_66(v5)
    let v8 = int.bitwise_exclusive_or(v2, v7)
    let #(v9, _v10) = word_from_66(v8)
    #(v6, v9)
}

pub fn stepped_69(v0: Int, v1: Int) -> #(Int, Int, Int) {
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

pub fn uniform_68(v0: Int, v1: Int, v2: Int) -> #(Int, Int, Int) {
    let #(v3, v4, v5) = stepped_69(v1, v2)
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
                False -> {
                    uniform_68(v0, v4, v5)
                }
            }
        }
    }
}

pub fn method70(v0: Int, v1: String, v2: Us0, v3: String, v4: Int) -> Uh12 {
    let v5 = v4 < v0
    case v5 {
        True -> {
            let v6 = spiral_wrap_signed(v4 + 1, 32)
            let v7 = string.inspect(v6)
            let v8 = "u"
            let v9 = v8 <> v7 
            let v10 = method70(v0, v1, v2, v3, v6)
            Uh12Cons(v1, v9, v10)
        }
        False -> {
            Uh12Nil
        }
    }
}

pub fn method71(v0: Uh12, v1: Uh12) -> Uh12 {
    case v0  {
        Uh12Cons(v2, v3, v4) -> {
            let v5 = Uh12Cons(v2, v3, v1)
            method71(v4, v5)
        }
        Uh12Nil -> {
            v1
        }
    }
}

pub fn method67(v0: Int, v1: Uh9, v2: Uh12, v3: Int, v4: Int) -> #(Uh12, Int, Int) {
    case v1  {
        Uh9Cons(v5, v6, v7, v8) -> {
            let v9 = spiral_wrap_unsigned(v0, 64)
            let #(v10, v11, v12) = uniform_68(v9, v3, v4)
            let v13 = spiral_wrap_signed(v10, 32)
            let v14 = 0
            let v15 = method70(v13, v5, v6, v7, v14)
            let v16 = method71(v15, v2)
            method67(v0, v8, v16, v11, v12)
        }
        Uh9Nil -> {
            #(v2, v3, v4)
        }
    }
}

pub fn method72(v0: Uh12, v1: Uh12) -> Uh12 {
    case v0  {
        Uh12Cons(v2, v3, v4) -> {
            let v5 = Uh12Cons(v2, v3, v1)
            method72(v4, v5)
        }
        Uh12Nil -> {
            v1
        }
    }
}

pub fn method74(v0: Uh10, v1: Uh10) -> Uh10 {
    case v0  {
        Uh10Cons(v2, v3) -> {
            let v4 = method74(v3, v1)
            Uh10Cons(v2, v4)
        }
        Uh10Nil -> {
            v1
        }
    }
}

pub fn method73(v0: Uh12, v1: Uh10, v2: Int, v3: Int) -> #(Uh10, Int, Int) {
    case v0  {
        Uh12Cons(v4, v5, v6) -> {
            let v7 = 10
            let #(v8, v9, v10) = uniform_68(v7, v2, v3)
            let v11 = spiral_wrap_signed(v8, 32)
            let v12 = v11 == 1
            let v18 =
                case v12 {
                    True -> {
                        let v13 = Us19Unliked(v4, v5)
                        let v14 = Us16Reaction(v13)
                        let v15 = Uh10Nil
                        let v16 = Uh10Cons(v14, v15)
                        method74(v1, v16)
                    }
                    False -> {
                        v1
                    }
                }
            method73(v6, v18, v9, v10)
        }
        Uh12Nil -> {
            #(v1, v2, v3)
        }
    }
}

pub fn method75(v0: Uh9, v1: Uh9) -> Uh9 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = method75(v5, v1)
            let v7 = "///- --test"
            let v8 = v4 |> string.contains(v7)
            let v9 = v8 == False
            case v9 {
                True -> {
                    Uh9Cons(v2, v3, v4, v6)
                }
                False -> {
                    v6
                }
            }
        }
        Uh9Nil -> {
            v1
        }
    }
}

pub fn method76(v0: Int, v1: Int) -> Uh13 {
    let v2 = v1 < v0
    case v2 {
        True -> {
            let v3 = spiral_wrap_signed(v1 + 1, 32)
            let v4 = method76(v0, v3)
            Uh13Cons(v1, v4)
        }
        False -> {
            Uh13Nil
        }
    }
}

pub fn method78(v0: Uh9, v1: Int) -> Int {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = spiral_wrap_signed(v1 + 1, 32)
            method78(v5, v6)
        }
        Uh9Nil -> {
            v1
        }
    }
}

pub fn picked_79(v0: Int, v1: Uh9) -> Us20 {
    case v1  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = v0 <= 0
            case v6 {
                True -> {
                    Us20Some(v2, v3, v4)
                }
                False -> {
                    let v8 = spiral_wrap_signed(v0 - 1, 32)
                    picked_79(v8, v5)
                }
            }
        }
        Uh9Nil -> {
            Us20None
        }
    }
}

pub fn method77(v0: Uh9, v1: Uh13, v2: Uh10, v3: Int, v4: Int) -> #(Uh10, Int, Int) {
    case v1  {
        Uh13Cons(v5, v6) -> {
            let v7 = 0
            let v8 = method78(v0, v7)
            let v9 = spiral_wrap_unsigned(v8, 64)
            let #(v10, v11, v12) = uniform_68(v9, v3, v4)
            let v13 = spiral_wrap_signed(v10, 32)
            let v14 = spiral_wrap_signed(v13 - 1, 32)
            let v15 = picked_79(v14, v0)
            let #(v29, v30, v31) =
                case v15  {
                    Us20None -> {
                        #(v2, v11, v12)
                    }
                    Us20Some(v16, v17, v18) -> {
                        let v19 = "\n"
                        let v20 = v18 <> v19 
                        let v21 = Us18Edited(v16, v20)
                        let v22 = Us16Revision(v21)
                        let v23 = Uh10Nil
                        let v24 = Uh10Cons(v22, v23)
                        let v25 = method74(v2, v24)
                        #(v25, v11, v12)
                    }
                }
            method77(v0, v6, v29, v30, v31)
        }
        Uh13Nil -> {
            #(v2, v3, v4)
        }
    }
}

pub fn blank_start_82(v0: String, v1: Int) -> Int {
    let v2 = v1 > 0
    let v22 =
        case v2 {
            True -> {
                let v3 = spiral_wrap_signed(v1 - 1, 32)
                let v4 = spiral_string_slice(v0, 0, v3)
                let v5 = unicode_erlang_characters_to_binary([11])
                let v6 = unicode_erlang_characters_to_binary([12])
                let v7 = " "
                let v8 = v4 |> string.ends_with(v7)
                case v8 {
                    True -> {
                        True
                    }
                    False -> {
                        let v9 = "\t"
                        let v10 = v4 |> string.ends_with(v9)
                        case v10 {
                            True -> {
                                True
                            }
                            False -> {
                                let v11 = "\n"
                                let v12 = v4 |> string.ends_with(v11)
                                case v12 {
                                    True -> {
                                        True
                                    }
                                    False -> {
                                        let v13 = "\r"
                                        let v14 = v4 |> string.ends_with(v13)
                                        case v14 {
                                            True -> {
                                                True
                                            }
                                            False -> {
                                                let v15 = v4 |> string.ends_with(v5)
                                                case v15 {
                                                    True -> {
                                                        True
                                                    }
                                                    False -> {
                                                        let v16 = v4 |> string.ends_with(v6)
                                                        v16
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
            False -> {
                False
            }
        }
    case v22 {
        True -> {
            let v23 = spiral_wrap_signed(v1 - 1, 32)
            blank_start_82(v0, v23)
        }
        False -> {
            v1
        }
    }
}
