import gleam/int
import gleam/string
import xsim_frames/types.{type Uh0, type Uh1, type Uh2, type Uh3, type Uh4, type Uh6, type Us8, type Us9, type Us10, type Uh7, type Uh8, type Uh9, type Uh10, type Uh12, Global, Uh0Cons, Uh0Nil, Uh10Cons, Uh10Nil, Uh12Cons, Uh12Nil, Uh2Nil, Uh3Cons, Uh3Nil, Uh6Cons, Uh6Nil, Uh7Cons, Uh7Nil, Uh8Cons, Uh9Cons, Uh9Nil, Us10Breaker, Us10Editor, Us10Fickle, Us10Lurker, Us11None, Us11Some, Us12Reaction, Us15Unliked, Us2Some, Us6Broken, Us6Held, Us7NoStaleResults, Us7OneCompilePerPrefix, Us7SequentialEquivalence, Us7UnwantedResultsFreed, Us7WithdrawnDemandHidden, Us8None, Us8Some, Us9None, Us9Some}
import xsim_frames/part1.{count_of_text_7, spiral_string_index, spiral_string_length, spiral_string_slice, spiral_wrap_signed, spiral_wrap_unsigned, split_on_2, x_binary_split}
import xsim_frames/part2.{delimited_34, go_23, masked_cells_20, masked_threads_21, method17, method22, method24, method25, method28, method29, method31, method37, snapshot_read_1}

pub fn method33(v0: Uh6, v1: Uh3) -> Uh3 {
    case v0  {
        Uh6Cons(v2, v3, v4) -> {
            let v5 = method33(v4, v1)
            let v14 =
                case v2  {
                    Us7NoStaleResults -> {
                        let v8 = "no_stale_results"
                        v8
                    }
                    Us7OneCompilePerPrefix -> {
                        let v9 = "one_compile_per_prefix"
                        v9
                    }
                    Us7SequentialEquivalence -> {
                        let v6 = "sequential_equivalence"
                        v6
                    }
                    Us7UnwantedResultsFreed -> {
                        let v7 = "unwanted_results_freed"
                        v7
                    }
                    _ -> {
                        let v10 = "withdrawn_demand_hidden"
                        v10
                    }
                }
            let v15 = "="
            let v16 = v14 <> v15 
            let v26 =
                case v3  {
                    Us6Broken(v18) -> {
                        let v19 = ","
                        let v20 = delimited_34(v19, v18)
                        let v21 = "FAIL["
                        let v22 = v21 <> v20 
                        let v23 = "]"
                        let v24 = v22 <> v23 
                        v24
                    }
                    Us6Held -> {
                        let v17 = "ok"
                        v17
                    }
                }
            let v27 = v16 <> v26 
            Uh3Cons(v27, v5)
        }
        Uh6Nil -> {
            v1
        }
    }
}

pub fn checked_text_0(v0: String) -> String {
    let #(v1, v2, v3, v4, v5, v6, v7, v8, v9) = snapshot_read_1(v0)
    let v10 = Uh0Nil
    let v11 = method17(v1, v2, v3, v4, v5, v6, v7, v1, v2, v3, v4, v5, v6, v7, v8, v9, v1, v10)
    let v12 = Uh3Nil
    let v13 = method22(v11, v12)
    let v18 =
        case v13  {
            Uh3Nil -> {
                Us6Held
            }
            _ -> {
                let v15 = 5
                let v16 = go_23(v15, v13)
                Us6Broken(v16)
            }
        }
    let v19 = Uh0Nil
    let v20 = method24(v1, v2, v3, v4, v5, v6, v7, v1, v19)
    let v21 = Uh3Nil
    let v22 = method22(v20, v21)
    let v27 =
        case v22  {
            Uh3Nil -> {
                Us6Held
            }
            _ -> {
                let v24 = 5
                let v25 = go_23(v24, v22)
                Us6Broken(v25)
            }
        }
    let v28 = Uh2Nil
    let v29 = method25(v1, v2, v3, v4, v5, v6, v7, v3, v28)
    let v30 = Uh3Nil
    let v31 = method28(v29, v30)
    let v36 =
        case v31  {
            Uh3Nil -> {
                Us6Held
            }
            _ -> {
                let v33 = 5
                let v34 = go_23(v33, v31)
                Us6Broken(v34)
            }
        }
    let v37 = Uh0Nil
    let v38 = method29(v1, v2, v3, v4, v5, v6, v7, v1, v37)
    let v39 = Uh3Nil
    let v40 = method22(v38, v39)
    let v45 =
        case v40  {
            Uh3Nil -> {
                Us6Held
            }
            _ -> {
                let v42 = 5
                let v43 = go_23(v42, v40)
                Us6Broken(v43)
            }
        }
    let v73 =
        case v7 {
            True -> {
                let v46 = Uh3Nil
                let v47 = method31(v1, v2, v3, v4, v5, v6, v7, v6, v46)
                let v52 =
                    case v47  {
                        Uh3Nil -> {
                            Us6Held
                        }
                        _ -> {
                            let v49 = 5
                            let v50 = go_23(v49, v47)
                            Us6Broken(v50)
                        }
                    }
                let v53 = Us7SequentialEquivalence
                let v54 = Us7NoStaleResults
                let v55 = Us7OneCompilePerPrefix
                let v56 = Us7WithdrawnDemandHidden
                let v57 = Us7UnwantedResultsFreed
                let v58 = Uh6Nil
                let v59 = Uh6Cons(v57, v52, v58)
                let v60 = Uh6Cons(v56, v45, v59)
                let v61 = Uh6Cons(v55, v36, v60)
                let v62 = Uh6Cons(v54, v27, v61)
                Uh6Cons(v53, v18, v62)
            }
            False -> {
                let v64 = Us7SequentialEquivalence
                let v65 = Us7NoStaleResults
                let v66 = Us7OneCompilePerPrefix
                let v67 = Us7WithdrawnDemandHidden
                let v68 = Uh6Nil
                let v69 = Uh6Cons(v67, v45, v68)
                let v70 = Uh6Cons(v66, v36, v69)
                let v71 = Uh6Cons(v65, v27, v70)
                Uh6Cons(v64, v18, v71)
            }
        }
    let v74 = Uh3Nil
    let v75 = method33(v73, v74)
    let v76 = " "
    delimited_34(v76, v75)
}

pub fn closure0(capt: Nil) -> fn(String) -> String {
    fn (v0) {
        checked_text_0(v0)
    }
}

pub fn method40(v0: String, v1: String, v2: Bool, v3: String, v4: Uh0, v5: Us8) -> Us8 {
    case v4  {
        Uh0Cons(v6, v7, v8, v9, v10) -> {
            let v11 = method40(v0, v1, v2, v3, v10, v5)
            let v12 = v6 == v0
            let v25 =
                case v12 {
                    True -> {
                        let v13 = 0
                        let v14 = ""
                        let v15 = masked_cells_20(v9, v13, v14)
                        let v16 = 0
                        let v17 = masked_threads_21(v15, v16, v14)
                        let v18 = 0
                        let v19 = masked_cells_20(v3, v18, v14)
                        let v20 = 0
                        let v21 = masked_threads_21(v19, v20, v14)
                        let v22 = v8 == v2
                        case v22 {
                            True -> {
                                let v23 = v17 == v21
                                v23
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
            case v25 {
                True -> {
                    Us8Some(v6, v7, v8, v9)
                }
                False -> {
                    v11
                }
            }
        }
        Uh0Nil -> {
            v5
        }
    }
}

pub fn method39(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh0, v8: Uh0) -> Uh0 {
    case v7  {
        Uh0Cons(v9, v10, v11, v12, v13) -> {
            let v14 = method39(v0, v1, v2, v3, v4, v5, v6, v13, v8)
            let v15 = Us8None
            let v16 = method40(v9, v10, v11, v12, v0, v15)
            let v22 =
                case v16  {
                    Us8None -> {
                        False
                    }
                    Us8Some(v17, v18, v19, v20) -> {
                        True
                    }
                }
            let v23 = v22 == False
            case v23 {
                True -> {
                    Uh0Cons(v9, v10, v11, v12, v14)
                }
                False -> {
                    v14
                }
            }
        }
        Uh0Nil -> {
            v8
        }
    }
}

pub fn method41(v0: Uh0, v1: Int) -> Int {
    case v0  {
        Uh0Cons(v2, v3, v4, v5, v6) -> {
            let v7 = spiral_wrap_signed(v1 + 1, 32)
            method41(v6, v7)
        }
        Uh0Nil -> {
            v1
        }
    }
}

pub fn commute_text_38(v0: String, v1: String) -> String {
    let #(v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10) = snapshot_read_1(v0)
    let #(v11, v12, v13, v14, v15, v16, v17, _v18, _v19) = snapshot_read_1(v1)
    let v20 = Uh0Nil
    let v21 = method39(v11, v12, v13, v14, v15, v16, v17, v2, v20)
    let v22 = Uh3Nil
    let v23 = method22(v21, v22)
    let v28 =
        case v23  {
            Uh3Nil -> {
                Us6Held
            }
            _ -> {
                let v25 = 5
                let v26 = go_23(v25, v23)
                Us6Broken(v26)
            }
        }
    let v38 =
        case v28  {
            Us6Held -> {
                let v29 = 0
                let v30 = method41(v2, v29)
                let v31 = 0
                let v32 = method41(v11, v31)
                let v33 = v30 == v32
                case v33 {
                    True -> {
                        Us6Held
                    }
                    False -> {
                        let v35 = Uh3Nil
                        Us6Broken(v35)
                    }
                }
            }
            _ -> {
                v28
            }
        }
    case v38  {
        Us6Broken(v40) -> {
            let v41 = ","
            let v42 = delimited_34(v41, v40)
            let v43 = "FAIL["
            let v44 = v43 <> v42 
            let v45 = "]"
            let v46 = v44 <> v45 
            v46
        }
        Us6Held -> {
            let v39 = "ok"
            v39
        }
    }
}

pub fn closure1(capt: Nil) -> fn(#(String, String)) -> String {
    fn (dom) {
        let #(v0, v1) = dom
        commute_text_38(v0, v1)
    }
}

pub fn method44(v0: String, v1: Uh3, v2: Us9) -> Us9 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method44(v0, v4, v2)
            let v6 = v0 == v3
            case v6 {
                True -> {
                    Us9Some(v3)
                }
                False -> {
                    v5
                }
            }
        }
        Uh3Nil -> {
            v2
        }
    }
}

pub fn method43(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh4, v8: Uh3, v9: Uh0, v10: Uh0) -> Uh0 {
    case v9  {
        Uh0Cons(v11, v12, v13, v14, v15) -> {
            let v16 = method43(v0, v1, v2, v3, v4, v5, v6, v7, v8, v15, v10)
            let v17 = Us9None
            let v18 = method44(v11, v8, v17)
            let v21 =
                case v18  {
                    Us9None -> {
                        False
                    }
                    Us9Some(v19) -> {
                        True
                    }
                }
            let v22 = v21 && v13
            case v22 {
                True -> {
                    Uh0Cons(v11, v12, v13, v14, v16)
                }
                False -> {
                    v16
                }
            }
        }
        Uh0Nil -> {
            v10
        }
    }
}

pub fn breaking_text_42(v0: String) -> String {
    let #(v1, v2, v3, v4, v5, v6, v7, v8, v9) = snapshot_read_1(v0)
    let v10 = Uh0Nil
    let v11 = method43(v1, v2, v3, v4, v5, v6, v7, v8, v9, v1, v10)
    let v12 = Uh3Nil
    let v13 = method22(v11, v12)
    let v18 =
        case v13  {
            Uh3Nil -> {
                Us6Held
            }
            _ -> {
                let v15 = 5
                let v16 = go_23(v15, v13)
                Us6Broken(v16)
            }
        }
    case v18  {
        Us6Broken(v20) -> {
            let v21 = ","
            let v22 = delimited_34(v21, v20)
            let v23 = "FAIL["
            let v24 = v23 <> v22 
            let v25 = "]"
            let v26 = v24 <> v25 
            v26
        }
        Us6Held -> {
            let v19 = "ok"
            v19
        }
    }
}

pub fn closure2(capt: Nil) -> fn(String) -> String {
    fn (v0) {
        breaking_text_42(v0)
    }
}

pub fn masked_text_45(v0: String) -> String {
    let v1 = 0
    let v2 = ""
    let v3 = masked_cells_20(v0, v1, v2)
    let v4 = 0
    masked_threads_21(v3, v4, v2)
}

pub fn closure3(capt: Nil) -> fn(String) -> String {
    fn (v0) {
        masked_text_45(v0)
    }
}

pub fn method46(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method46(v3, v1)
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

pub fn method48(v0: String, v1: Int, v2: Int) -> Int {
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
                    method48(v0, v1, v12)
                }
                False -> {
                    v2
                }
            }
        }
    }
}

pub fn method49(v0: String, v1: Int) -> Int {
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
                    method49(v0, v3)
                }
                False -> {
                    v3
                }
            }
        }
    }
}

pub fn method50(v0: Int, v1: Us10, v2: Int) -> Uh7 {
    let v3 = v2 < v0
    case v3 {
        True -> {
            let v4 = spiral_wrap_signed(v2 + 1, 32)
            let v5 = method50(v0, v1, v4)
            Uh7Cons(v1, v5)
        }
        False -> {
            Uh7Nil
        }
    }
}

pub fn method51(v0: Uh7, v1: Uh7) -> Uh7 {
    case v0  {
        Uh7Cons(v2, v3) -> {
            let v4 = method51(v3, v1)
            Uh7Cons(v2, v4)
        }
        Uh7Nil -> {
            v1
        }
    }
}

pub fn method47(v0: Uh3, v1: Uh7) -> Uh7 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method47(v3, v1)
            let v5 = "="
            let v6 = spiral_string_length(v2)
            let v7 = 0
            let v8 = method48(v2, v6, v7)
            let v9 = spiral_wrap_signed(v6 - 1, 32)
            let v10 = spiral_string_slice(v2, v8, v9)
            let v11 = spiral_string_length(v10)
            let v12 = method49(v10, v11)
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
                                                    let v20 = Us10Lurker
                                                    Us11Some(v20)
                                                }
                                                False -> {
                                                    let v22 = v15 == "fickle"
                                                    case v22 {
                                                        True -> {
                                                            let v23 = Us10Fickle
                                                            Us11Some(v23)
                                                        }
                                                        False -> {
                                                            let v25 = v15 == "editor"
                                                            case v25 {
                                                                True -> {
                                                                    let v26 = Us10Editor
                                                                    Us11Some(v26)
                                                                }
                                                                False -> {
                                                                    let v28 = v15 == "breaker"
                                                                    case v28 {
                                                                        True -> {
                                                                            let v29 = Us10Breaker
                                                                            Us11Some(v29)
                                                                        }
                                                                        False -> {
                                                                            Us11None
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
                                            Us11Some(v37) -> {
                                                case v36  {
                                                    Us2Some(v38) -> {
                                                        let v39 = 0
                                                        method50(v38, v37, v39)
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
            method51(v50, v4)
        }
        Uh3Nil -> {
            v1
        }
    }
}

pub fn listed_pieces_52(v0: List(String), v1: Uh3) -> Uh3 {
    let v2 = case v0 { [] -> True _ -> False }
    case v2 {
        True -> {
            let v3 = Uh3Nil
            method37(v1, v3)
        }
        False -> {
            let v5 = case v0 { [_, ..t] -> t [] -> [] }
            let v6 = case v0 { [h, ..] -> h [] -> "" }
            let v7 = Uh3Cons(v6, v1)
            listed_pieces_52(v5, v7)
        }
    }
}

pub fn method53(v0: String, v1: Uh3, v2: Uh8) -> Uh8 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method53(v0, v4, v2)
            let v6 = x_binary_split(v3, v0, [Global])
            let v7 = Uh3Nil
            let v8 = listed_pieces_52(v6, v7)
            Uh8Cons(v8, v5)
        }
        Uh3Nil -> {
            v2
        }
    }
}

pub fn method57(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh7, v6: Bool, v7: String, v8: Uh3, v9: Uh9, v10: Us9, v11: Int) -> #(Uh9, Us9, Int) {
    let #(v36, v37, v38) =
        case v8  {
            Uh3Cons(v12, v13) -> {
                let v14 = "p"
                let v15 = v7 <> v14 
                let v16 = string.inspect(v11)
                let v17 = v15 <> v16 
                let v18 = spiral_string_length(v12)
                let v19 = 0
                let v20 = method48(v12, v18, v19)
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
                            Us9Some(v17)
                        }
                    }
                let v28 = spiral_wrap_signed(v11 + 1, 32)
                let v29 = Uh9Cons(v17, v10, v12, v9)
                method57(v0, v1, v2, v3, v4, v5, v6, v7, v13, v29, v27, v28)
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

pub fn method58(v0: Uh9, v1: Uh9) -> Uh9 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = Uh9Cons(v2, v3, v4, v1)
            method58(v5, v6)
        }
        Uh9Nil -> {
            v1
        }
    }
}

pub fn word_from_60(v0: Int) -> #(Int, Int) {
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
            word_from_60(v1)
        }
        False -> {
            #(v10, v1)
        }
    }
}

pub fn seeded_59(v0: Int, v1: Int, v2: Int) -> #(Int, Int) {
    let #(_v3, v4) = word_from_60(v0)
    let v5 = int.bitwise_exclusive_or(v1, v4)
    let #(v6, v7) = word_from_60(v5)
    let v8 = int.bitwise_exclusive_or(v2, v7)
    let #(v9, _v10) = word_from_60(v8)
    #(v6, v9)
}

pub fn stepped_63(v0: Int, v1: Int) -> #(Int, Int, Int) {
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

pub fn uniform_62(v0: Int, v1: Int, v2: Int) -> #(Int, Int, Int) {
    let #(v3, v4, v5) = stepped_63(v1, v2)
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
                    uniform_62(v0, v4, v5)
                }
            }
        }
    }
}

pub fn method64(v0: Int, v1: String, v2: Us9, v3: String, v4: Int) -> Uh12 {
    let v5 = v4 < v0
    case v5 {
        True -> {
            let v6 = spiral_wrap_signed(v4 + 1, 32)
            let v7 = string.inspect(v6)
            let v8 = "u"
            let v9 = v8 <> v7 
            let v10 = method64(v0, v1, v2, v3, v6)
            Uh12Cons(v1, v9, v10)
        }
        False -> {
            Uh12Nil
        }
    }
}

pub fn method65(v0: Uh12, v1: Uh12) -> Uh12 {
    case v0  {
        Uh12Cons(v2, v3, v4) -> {
            let v5 = Uh12Cons(v2, v3, v1)
            method65(v4, v5)
        }
        Uh12Nil -> {
            v1
        }
    }
}

pub fn method61(v0: Int, v1: Uh9, v2: Uh12, v3: Int, v4: Int) -> #(Uh12, Int, Int) {
    case v1  {
        Uh9Cons(v5, v6, v7, v8) -> {
            let v9 = spiral_wrap_unsigned(v0, 64)
            let #(v10, v11, v12) = uniform_62(v9, v3, v4)
            let v13 = spiral_wrap_signed(v10, 32)
            let v14 = 0
            let v15 = method64(v13, v5, v6, v7, v14)
            let v16 = method65(v15, v2)
            method61(v0, v8, v16, v11, v12)
        }
        Uh9Nil -> {
            #(v2, v3, v4)
        }
    }
}

pub fn method66(v0: Uh12, v1: Uh12) -> Uh12 {
    case v0  {
        Uh12Cons(v2, v3, v4) -> {
            let v5 = Uh12Cons(v2, v3, v1)
            method66(v4, v5)
        }
        Uh12Nil -> {
            v1
        }
    }
}

pub fn method68(v0: Uh10, v1: Uh10) -> Uh10 {
    case v0  {
        Uh10Cons(v2, v3) -> {
            let v4 = method68(v3, v1)
            Uh10Cons(v2, v4)
        }
        Uh10Nil -> {
            v1
        }
    }
}

pub fn method67(v0: Uh12, v1: Uh10, v2: Int, v3: Int) -> #(Uh10, Int, Int) {
    case v0  {
        Uh12Cons(v4, v5, v6) -> {
            let v7 = 10
            let #(v8, v9, v10) = uniform_62(v7, v2, v3)
            let v11 = spiral_wrap_signed(v8, 32)
            let v12 = v11 == 1
            let v18 =
                case v12 {
                    True -> {
                        let v13 = Us15Unliked(v4, v5)
                        let v14 = Us12Reaction(v13)
                        let v15 = Uh10Nil
                        let v16 = Uh10Cons(v14, v15)
                        method68(v1, v16)
                    }
                    False -> {
                        v1
                    }
                }
            method67(v6, v18, v9, v10)
        }
        Uh12Nil -> {
            #(v1, v2, v3)
        }
    }
}
