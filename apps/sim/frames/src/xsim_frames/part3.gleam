import gleam/int
import gleam/string
import xsim_frames/types.{type Uh0, type Uh1, type Uh2, type Uh3, type Uh4, type Us2, type Uh6, type Us14, type Uh7, type Uh8, type Uh9, type Uh10, type Uh12, type Uh13, type Us20, Uh0Cons, Uh0Nil, Uh10Cons, Uh10Nil, Uh12Cons, Uh12Nil, Uh13Cons, Uh13Nil, Uh2Nil, Uh3Cons, Uh3Nil, Uh6Cons, Uh6Nil, Uh7Cons, Uh7Nil, Uh8Cons, Uh9Cons, Uh9Nil, Us12Broken, Us12Held, Us13BreakingEditsFail, Us13NoStaleResults, Us13OneCompilePerPrefix, Us13SequentialEquivalence, Us13UnwantedResultsFreed, Us13WithdrawnDemandHidden, Us14Breaker, Us14Editor, Us14Fickle, Us14Lurker, Us15None, Us15Some, Us16Reaction, Us19Unliked, Us20None, Us20Some, Us2Some, Us3Some}
import xsim_frames/part1.{count_of_text_10, method4, spiral_string_index, spiral_string_length, spiral_string_slice, spiral_wrap_signed, spiral_wrap_unsigned, split_list_2}
import xsim_frames/part2.{delimited_21, masked_cells_28, masked_threads_29, method20, method24, method30, method32, method33, method36, method37, method41, method42, snapshot_read_1, taken_31}

pub fn method40(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh3, v8: Uh3) -> Uh3 {
    case v7  {
        Uh3Cons(v9, v10) -> {
            let v11 = method40(v0, v1, v2, v3, v4, v5, v6, v10, v8)
            let v12 = method41(v9)
            let v13 = method42(v9, v12, v1)
            let v14 = v13 == False
            case v14 {
                True -> Uh3Cons(v9, v11)
                False -> v11
            }
        }
        Uh3Nil -> v8
    }
}

pub fn method43(v0: Uh6, v1: Uh3) -> Uh3 {
    case v0  {
        Uh6Cons(v2, v3, v4) -> {
            let v5 = method43(v4, v1)
            let v16 =
                case v2  {
                    Us13BreakingEditsFail -> {
                        let v8 = "breaking_edits_fail"
                        v8
                    }
                    Us13NoStaleResults -> {
                        let v9 = "no_stale_results"
                        v9
                    }
                    Us13OneCompilePerPrefix -> {
                        let v10 = "one_compile_per_prefix"
                        v10
                    }
                    Us13SequentialEquivalence -> {
                        let v6 = "sequential_equivalence"
                        v6
                    }
                    Us13UnwantedResultsFreed -> {
                        let v7 = "unwanted_results_freed"
                        v7
                    }
                    _ -> {
                        let v11 = "withdrawn_demand_hidden"
                        v11
                    }
                }
            let v17 = "="
            let v18 = v16 <> v17 
            let v28 =
                case v3  {
                    Us12Broken(v20) -> {
                        let v21 = ","
                        let v22 = delimited_21(v21, v20)
                        let v23 = "FAIL["
                        let v24 = v23 <> v22 
                        let v25 = "]"
                        let v26 = v24 <> v25 
                        v26
                    }
                    Us12Held -> {
                        let v19 = "ok"
                        v19
                    }
                }
            let v29 = v18 <> v28 
            Uh3Cons(v29, v5)
        }
        Uh6Nil -> v1
    }
}

pub fn checked_text_0(v0: String) -> String {
    let #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10) = snapshot_read_1(v0)
    let v11 = 0
    let v12 = method20(v10, v11)
    let v13 = v12 > 0
    case v13 {
        True -> {
            let v14 = ","
            let v15 = Uh3Nil
            let v16 = method4(v10, v15)
            let v17 = delimited_21(v14, v16)
            let v18 = "unknown_rows="
            let v19 = v18 <> v17 
            v19
        }
        False -> {
            let v20 = Uh0Nil
            let v21 = method24(v1, v2, v3, v4, v5, v6, v7, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v1, v20)
            let v22 = Uh3Nil
            let v23 = method30(v21, v22)
            let v28 =
                case v23  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v25 = 5
                        let v26 = taken_31(v25, v23)
                        Us12Broken(v26)
                    }
                }
            let v29 = Uh0Nil
            let v30 = method32(v1, v2, v3, v4, v5, v6, v7, v1, v29)
            let v31 = Uh3Nil
            let v32 = method30(v30, v31)
            let v37 =
                case v32  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v34 = 5
                        let v35 = taken_31(v34, v32)
                        Us12Broken(v35)
                    }
                }
            let v38 = Uh2Nil
            let v39 = method33(v1, v2, v3, v4, v5, v6, v7, v3, v38)
            let v40 = Uh3Nil
            let v41 = method36(v39, v40)
            let v46 =
                case v41  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v43 = 5
                        let v44 = taken_31(v43, v41)
                        Us12Broken(v44)
                    }
                }
            let v47 = Uh0Nil
            let v48 = method37(v1, v2, v3, v4, v5, v6, v7, v1, v47)
            let v49 = Uh3Nil
            let v50 = method30(v48, v49)
            let v55 =
                case v50  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v52 = 5
                        let v53 = taken_31(v52, v50)
                        Us12Broken(v53)
                    }
                }
            let v83 =
                case v7 {
                    True -> {
                        let v56 = Uh3Nil
                        let v57 = method40(v1, v2, v3, v4, v5, v6, v7, v6, v56)
                        let v62 =
                            case v57  {
                                Uh3Nil -> Us12Held
                                _ -> {
                                    let v59 = 5
                                    let v60 = taken_31(v59, v57)
                                    Us12Broken(v60)
                                }
                            }
                        let v63 = Us13SequentialEquivalence
                        let v64 = Us13NoStaleResults
                        let v65 = Us13OneCompilePerPrefix
                        let v66 = Us13WithdrawnDemandHidden
                        let v67 = Us13UnwantedResultsFreed
                        let v68 = Uh6Nil
                        let v69 = Uh6Cons(v67, v62, v68)
                        let v70 = Uh6Cons(v66, v55, v69)
                        let v71 = Uh6Cons(v65, v46, v70)
                        let v72 = Uh6Cons(v64, v37, v71)
                        Uh6Cons(v63, v28, v72)
                    }
                    False -> {
                        let v74 = Us13SequentialEquivalence
                        let v75 = Us13NoStaleResults
                        let v76 = Us13OneCompilePerPrefix
                        let v77 = Us13WithdrawnDemandHidden
                        let v78 = Uh6Nil
                        let v79 = Uh6Cons(v77, v55, v78)
                        let v80 = Uh6Cons(v76, v46, v79)
                        let v81 = Uh6Cons(v75, v37, v80)
                        Uh6Cons(v74, v28, v81)
                    }
                }
            let v84 = Uh3Nil
            let v85 = method43(v83, v84)
            let v86 = " "
            delimited_21(v86, v85)
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
                let v9 = 0
                let v10 = ""
                let v11 = masked_cells_28(v7, v9, v10)
                let v12 = 0
                let v13 = masked_threads_29(v11, v12, v10)
                let v14 = 0
                let v15 = masked_cells_28(v3, v14, v10)
                let v16 = 0
                let v17 = masked_threads_29(v15, v16, v10)
                let v18 = v6 == v2
                case v18 {
                    True -> {
                        let v19 = v13 == v17
                        v19
                    }
                    False -> False
                }
            }
            False -> False
        }
    }
}

pub fn method46(v0: String, v1: String, v2: Bool, v3: String) -> fn(#(String, String, Bool, String)) -> Bool {
    closure6(#(v0, v1, v2, v3))
}

pub fn method47(v0: String, v1: String, v2: Bool, v3: String, v4: fn(#(String, String, Bool, String)) -> Bool, v5: Uh0) -> Bool {
    case v5  {
        Uh0Cons(v6, v7, v8, v9, v10) -> {
            let v11 = v4(#(v6, v7, v8, v9))
            case v11 {
                True -> True
                False -> {
                    let v12 = method46(v0, v1, v2, v3)
                    method47(v0, v1, v2, v3, v12, v10)
                }
            }
        }
        Uh0Nil -> False
    }
}

pub fn method45(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh0, v8: Uh0) -> Uh0 {
    case v7  {
        Uh0Cons(v9, v10, v11, v12, v13) -> {
            let v14 = method45(v0, v1, v2, v3, v4, v5, v6, v13, v8)
            let v15 = method46(v9, v10, v11, v12)
            let v16 = method47(v9, v10, v11, v12, v15, v0)
            let v17 = v16 == False
            case v17 {
                True -> Uh0Cons(v9, v10, v11, v12, v14)
                False -> v14
            }
        }
        Uh0Nil -> v8
    }
}

pub fn method48(v0: Uh0, v1: Int) -> Int {
    case v0  {
        Uh0Cons(v2, v3, v4, v5, v6) -> {
            let v7 = spiral_wrap_signed(v1 + 1, 32)
            method48(v6, v7)
        }
        Uh0Nil -> v1
    }
}

pub fn commute_text_44(v0: String, v1: String) -> String {
    let #(v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10, v11) = snapshot_read_1(v0)
    let #(v12, v13, v14, v15, v16, v17, v18, _v19, _v20, v21) = snapshot_read_1(v1)
    let v22 = 0
    let v23 = method20(v11, v22)
    let v24 = v23 > 0
    case v24 {
        True -> {
            let v25 = ","
            let v26 = Uh3Nil
            let v27 = method4(v11, v26)
            let v28 = delimited_21(v25, v27)
            let v29 = "unknown_rows="
            let v30 = v29 <> v28 
            v30
        }
        False -> {
            let v31 = 0
            let v32 = method20(v21, v31)
            let v33 = v32 > 0
            case v33 {
                True -> {
                    let v34 = ","
                    let v35 = Uh3Nil
                    let v36 = method4(v21, v35)
                    let v37 = delimited_21(v34, v36)
                    let v38 = "unknown_rows="
                    let v39 = v38 <> v37 
                    v39
                }
                False -> {
                    let v40 = Uh0Nil
                    let v41 = method45(v12, v13, v14, v15, v16, v17, v18, v2, v40)
                    let v42 = Uh3Nil
                    let v43 = method30(v41, v42)
                    let v48 =
                        case v43  {
                            Uh3Nil -> Us12Held
                            _ -> {
                                let v45 = 5
                                let v46 = taken_31(v45, v43)
                                Us12Broken(v46)
                            }
                        }
                    let v58 =
                        case v48  {
                            Us12Held -> {
                                let v49 = 0
                                let v50 = method48(v2, v49)
                                let v51 = 0
                                let v52 = method48(v12, v51)
                                let v53 = v50 == v52
                                case v53 {
                                    True -> Us12Held
                                    False -> {
                                        let v55 = Uh3Nil
                                        Us12Broken(v55)
                                    }
                                }
                            }
                            _ -> v48
                        }
                    case v58  {
                        Us12Broken(v60) -> {
                            let v61 = ","
                            let v62 = delimited_21(v61, v60)
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
        commute_text_44(v0, v1)
    }
}

pub fn closure8(capt: #(String)) -> fn(String) -> Bool {
    fn (v1) {
        let #(v0) = capt
        let v2 = v0 == v1
        v2
    }
}

pub fn method51(v0: String) -> fn(String) -> Bool {
    closure8(#(v0))
}

pub fn method52(v0: String, v1: fn(String) -> Bool, v2: Uh3) -> Bool {
    case v2  {
        Uh3Cons(v3, v4) -> {
            let v5 = v1(v3)
            case v5 {
                True -> True
                False -> {
                    let v6 = method51(v0)
                    method52(v0, v6, v4)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn method50(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh4, v8: Uh3, v9: Uh3, v10: Uh0, v11: Uh0) -> Uh0 {
    case v10  {
        Uh0Cons(v12, v13, v14, v15, v16) -> {
            let v17 = method50(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v16, v11)
            let v18 = method51(v12)
            let v19 = method52(v12, v18, v8)
            let v20 = v19 && v14
            case v20 {
                True -> Uh0Cons(v12, v13, v14, v15, v17)
                False -> v17
            }
        }
        Uh0Nil -> v11
    }
}

pub fn breaking_text_49(v0: String) -> String {
    let #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10) = snapshot_read_1(v0)
    let v11 = 0
    let v12 = method20(v10, v11)
    let v13 = v12 > 0
    case v13 {
        True -> {
            let v14 = ","
            let v15 = Uh3Nil
            let v16 = method4(v10, v15)
            let v17 = delimited_21(v14, v16)
            let v18 = "unknown_rows="
            let v19 = v18 <> v17 
            v19
        }
        False -> {
            let v20 = Uh0Nil
            let v21 = method50(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v1, v20)
            let v22 = Uh3Nil
            let v23 = method30(v21, v22)
            let v28 =
                case v23  {
                    Uh3Nil -> Us12Held
                    _ -> {
                        let v25 = 5
                        let v26 = taken_31(v25, v23)
                        Us12Broken(v26)
                    }
                }
            case v28  {
                Us12Broken(v30) -> {
                    let v31 = ","
                    let v32 = delimited_21(v31, v30)
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
        breaking_text_49(v0)
    }
}

pub fn masked_text_53(v0: String) -> String {
    let v1 = 0
    let v2 = ""
    let v3 = masked_cells_28(v0, v1, v2)
    let v4 = 0
    masked_threads_29(v3, v4, v2)
}

pub fn closure9(capt: Nil) -> fn(String) -> String {
    fn (v0) {
        masked_text_53(v0)
    }
}

pub fn method54(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method54(v3, v1)
            let v5 = v2 != ""
            case v5 {
                True -> Uh3Cons(v2, v4)
                False -> v4
            }
        }
        Uh3Nil -> v1
    }
}

pub fn method56(v0: String, v1: Int, v2: Int) -> Int {
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
                    method56(v0, v1, v12)
                }
                False -> v2
            }
        }
    }
}

pub fn method57(v0: String, v1: Int) -> Int {
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
                                        let v8 = v4 == "\n"
                                        v8
                                    }
                                }
                            }
                        }
                    }
                }
            case v11 {
                True -> method57(v0, v3)
                False -> v3
            }
        }
    }
}

pub fn method58(v0: Int, v1: Us14, v2: Int) -> Uh7 {
    let v3 = v2 < v0
    case v3 {
        True -> {
            let v4 = spiral_wrap_signed(v2 + 1, 32)
            let v5 = method58(v0, v1, v4)
            Uh7Cons(v1, v5)
        }
        False -> Uh7Nil
    }
}

pub fn method59(v0: Uh7, v1: Uh7) -> Uh7 {
    case v0  {
        Uh7Cons(v2, v3) -> {
            let v4 = method59(v3, v1)
            Uh7Cons(v2, v4)
        }
        Uh7Nil -> v1
    }
}

pub fn method55(v0: Uh3, v1: Uh7) -> Uh7 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method55(v3, v1)
            let v5 = spiral_string_length(v2)
            let v6 = 0
            let v7 = method56(v2, v5, v6)
            let v8 = spiral_wrap_signed(v5 - 1, 32)
            let v9 = spiral_string_slice(v2, v7, v8)
            let v10 = spiral_string_length(v9)
            let v11 = method57(v9, v10)
            let v12 = spiral_string_slice(v9, 0, v11)
            let v13 = "="
            let v14 = split_list_2(v13, v12)
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
                                                        let v39 = 0
                                                        method58(v38, v37, v39)
                                                    }
                                                    _ -> Uh7Nil
                                                }
                                            }
                                            _ -> Uh7Nil
                                        }
                                    }
                                    _ -> Uh7Nil
                                }
                            }
                            _ -> Uh7Nil
                        }
                    }
                    _ -> Uh7Nil
                }
            method59(v50, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method60(v0: String, v1: Uh3, v2: Uh8) -> Uh8 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method60(v0, v4, v2)
            let v6 = split_list_2(v0, v3)
            Uh8Cons(v6, v5)
        }
        Uh3Nil -> v2
    }
}

pub fn method64(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh7, v6: Bool, v7: String, v8: Uh3, v9: Uh9, v10: Us2, v11: Int) -> #(Uh9, Us2, Int) {
    let #(v36, v37, v38) =
        case v8  {
            Uh3Cons(v12, v13) -> {
                let v14 = "p"
                let v15 = v7 <> v14 
                let v16 = string.inspect(v11)
                let v17 = v15 <> v16 
                let v18 = spiral_string_length(v12)
                let v19 = 0
                let v20 = method56(v12, v18, v19)
                let v21 = spiral_wrap_signed(v18 - 1, 32)
                let v22 = spiral_string_slice(v12, v20, v21)
                let v23 = "///- --test"
                let v24 = v22 |> string.starts_with(v23)
                let v25 = v24 && v6
                let v27 =
                    case v25 {
                        True -> v10
                        False -> Us2Some(v17)
                    }
                let v28 = spiral_wrap_signed(v11 + 1, 32)
                let v29 = Uh9Cons(v17, v10, v12, v9)
                method64(v0, v1, v2, v3, v4, v5, v6, v7, v13, v29, v27, v28)
            }
            _ -> {
                let #(v33, v34, v35) =
                    case v8  {
                        Uh3Nil -> #(v9, v10, v11)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v33, v34, v35)
            }
        }
    #(v36, v37, v38)
}

pub fn method65(v0: Uh9, v1: Uh9) -> Uh9 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = Uh9Cons(v2, v3, v4, v1)
            method65(v5, v6)
        }
        Uh9Nil -> v1
    }
}

pub fn word_from_67(v0: Int) -> #(Int, Int) {
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
        True -> word_from_67(v1)
        False -> #(v10, v1)
    }
}

pub fn seeded_66(v0: Int, v1: Int, v2: Int) -> #(Int, Int) {
    let #(_v3, v4) = word_from_67(v0)
    let v5 = int.bitwise_exclusive_or(v1, v4)
    let #(v6, v7) = word_from_67(v5)
    let v8 = int.bitwise_exclusive_or(v2, v7)
    let #(v9, _v10) = word_from_67(v8)
    #(v6, v9)
}

pub fn stepped_70(v0: Int, v1: Int) -> #(Int, Int, Int) {
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

pub fn uniform_69(v0: Int, v1: Int, v2: Int) -> #(Int, Int, Int) {
    let #(v3, v4, v5) = stepped_70(v1, v2)
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
                False -> uniform_69(v0, v4, v5)
            }
        }
    }
}

pub fn method71(v0: Int, v1: String, v2: Us2, v3: String, v4: Int) -> Uh12 {
    let v5 = v4 < v0
    case v5 {
        True -> {
            let v6 = spiral_wrap_signed(v4 + 1, 32)
            let v7 = string.inspect(v6)
            let v8 = "u"
            let v9 = v8 <> v7 
            let v10 = method71(v0, v1, v2, v3, v6)
            Uh12Cons(v1, v9, v10)
        }
        False -> Uh12Nil
    }
}

pub fn method72(v0: Uh12, v1: Uh12) -> Uh12 {
    case v0  {
        Uh12Cons(v2, v3, v4) -> {
            let v5 = Uh12Cons(v2, v3, v1)
            method72(v4, v5)
        }
        Uh12Nil -> v1
    }
}

pub fn method68(v0: Int, v1: Uh9, v2: Uh12, v3: Int, v4: Int) -> #(Uh12, Int, Int) {
    case v1  {
        Uh9Cons(v5, v6, v7, v8) -> {
            let v9 = spiral_wrap_unsigned(v0, 64)
            let #(v10, v11, v12) = uniform_69(v9, v3, v4)
            let v13 = spiral_wrap_signed(v10, 32)
            let v14 = 0
            let v15 = method71(v13, v5, v6, v7, v14)
            let v16 = method72(v15, v2)
            method68(v0, v8, v16, v11, v12)
        }
        Uh9Nil -> #(v2, v3, v4)
    }
}

pub fn method73(v0: Uh12, v1: Uh12) -> Uh12 {
    case v0  {
        Uh12Cons(v2, v3, v4) -> {
            let v5 = Uh12Cons(v2, v3, v1)
            method73(v4, v5)
        }
        Uh12Nil -> v1
    }
}

pub fn method75(v0: Uh10, v1: Uh10) -> Uh10 {
    case v0  {
        Uh10Cons(v2, v3) -> {
            let v4 = method75(v3, v1)
            Uh10Cons(v2, v4)
        }
        Uh10Nil -> v1
    }
}

pub fn method74(v0: Uh12, v1: Uh10, v2: Int, v3: Int) -> #(Uh10, Int, Int) {
    case v0  {
        Uh12Cons(v4, v5, v6) -> {
            let v7 = 10
            let #(v8, v9, v10) = uniform_69(v7, v2, v3)
            let v11 = spiral_wrap_signed(v8, 32)
            let v12 = v11 == 1
            let v18 =
                case v12 {
                    True -> {
                        let v13 = Us19Unliked(v4, v5)
                        let v14 = Us16Reaction(v13)
                        let v15 = Uh10Nil
                        let v16 = Uh10Cons(v14, v15)
                        method75(v1, v16)
                    }
                    False -> v1
                }
            method74(v6, v18, v9, v10)
        }
        Uh12Nil -> #(v1, v2, v3)
    }
}

pub fn method76(v0: Uh9, v1: Uh9) -> Uh9 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = method76(v5, v1)
            let v7 = "///- --test"
            let v8 = v4 |> string.contains(v7)
            let v9 = v8 == False
            case v9 {
                True -> Uh9Cons(v2, v3, v4, v6)
                False -> v6
            }
        }
        Uh9Nil -> v1
    }
}

pub fn method77(v0: Int, v1: Int) -> Uh13 {
    let v2 = v1 < v0
    case v2 {
        True -> {
            let v3 = spiral_wrap_signed(v1 + 1, 32)
            let v4 = method77(v0, v3)
            Uh13Cons(v1, v4)
        }
        False -> Uh13Nil
    }
}

pub fn method79(v0: Uh9, v1: Int) -> Int {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = spiral_wrap_signed(v1 + 1, 32)
            method79(v5, v6)
        }
        Uh9Nil -> v1
    }
}

pub fn picked_80(v0: Int, v1: Uh9) -> Us20 {
    case v1  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = v0 <= 0
            case v6 {
                True -> Us20Some(v2, v3, v4)
                False -> {
                    let v8 = spiral_wrap_signed(v0 - 1, 32)
                    picked_80(v8, v5)
                }
            }
        }
        Uh9Nil -> Us20None
    }
}
