import gleam/bit_array
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh0, type Uh1, type Uh2, type Uh3, type Uh4, type Uh6, Uh0Cons, Uh0Nil, Uh1Cons, Uh1Nil, Uh2Cons, Uh2Nil, Uh3Cons, Uh3Nil, Uh6Cons, Uh6Nil, Us0None, Us0Some, Us11None, Us11Some, Us12Broken, Us12Held, Us13NoStaleResults, Us13OneCompilePerPrefix, Us13SequentialEquivalence, Us13UnwantedResultsFreed, Us13WithdrawnDemandHidden}
import xsim_frames/part1.{closure1, digits_end_6, spiral_string_length, spiral_string_slice, spiral_wrap_signed}
import xsim_frames/part2.{delimited_19, method17, method18, method23, method24, method25, snapshot_read_1}

pub fn masked_cells_26(v0: String, v1: Int, v2: String) -> String {
    let v3 = spiral_string_length(v0)
    let v4 = spiral_wrap_signed(v3 - v1, 32)
    let v5 = spiral_wrap_signed(v1 + v4, 32)
    let v6 = spiral_wrap_signed(v5 - 1, 32)
    let v7 = spiral_string_slice(v0, v1, v6)
    let v8 = "spiral_cells"
    let v9 = option.from_result(result.map(string.split_once(v7, v8), pair.first))
    let v10 = closure1(Nil)
    let v11 = v9 |> option.map(v10)
    let v12 = Us0None
    let v13 = v11 |> option.unwrap(v12)
    let v17 =
        case v13  {
            Us0None -> {
                -1
            }
            Us0Some(v14) -> {
                let v15 = bit_array.byte_size(bit_array.from_string(v14))
                v15
            }
        }
    let v18 = v17 < 0
    let v21 =
        case v18 {
            True -> {
                -1
            }
            False -> {
                let v19 = spiral_wrap_signed(v1 + v17, 32)
                let v20 = spiral_wrap_signed(v19 + 12, 32)
                v20
            }
        }
    let v22 = v21 < 0
    case v22 {
        True -> {
            let v23 = v2 <> v7 
            v23
        }
        False -> {
            let v24 = spiral_wrap_signed(v21 + 1, 32)
            let v25 = spiral_wrap_signed(v3 - v21, 32)
            let v26 = spiral_wrap_signed(v21 + v25, 32)
            let v27 = spiral_wrap_signed(v26 - 1, 32)
            let v28 = spiral_string_slice(v0, v21, v27)
            let v29 = "\\"
            let v30 = v28 |> string.starts_with(v29)
            let v32 =
                case v30 {
                    True -> {
                        digits_end_6(v0, v24)
                    }
                    False -> {
                        -1
                    }
                }
            let v33 = v32 > v24
            let v34 =
                case v33 {
                    True -> {
                        v32
                    }
                    False -> {
                        -1
                    }
                }
            let v35 = v34 >= 0
            let v42 =
                case v35 {
                    True -> {
                        v34
                    }
                    False -> {
                        let v36 = "/"
                        let v37 = v28 |> string.starts_with(v36)
                        let v39 =
                            case v37 {
                                True -> {
                                    digits_end_6(v0, v24)
                                }
                                False -> {
                                    -1
                                }
                            }
                        let v40 = v39 > v24
                        case v40 {
                            True -> {
                                v39
                            }
                            False -> {
                                -1
                            }
                        }
                    }
                }
            let v43 = v42 < 0
            let v55 =
                case v43 {
                    True -> {
                        -1
                    }
                    False -> {
                        let v44 = spiral_wrap_signed(v42 + 1, 32)
                        let v45 = spiral_wrap_signed(v3 - v42, 32)
                        let v46 = spiral_wrap_signed(v42 + v45, 32)
                        let v47 = spiral_wrap_signed(v46 - 1, 32)
                        let v48 = spiral_string_slice(v0, v42, v47)
                        let v49 = "-"
                        let v50 = v48 |> string.starts_with(v49)
                        let v52 =
                            case v50 {
                                True -> {
                                    digits_end_6(v0, v44)
                                }
                                False -> {
                                    -1
                                }
                            }
                        let v53 = v52 > v44
                        case v53 {
                            True -> {
                                v52
                            }
                            False -> {
                                -1
                            }
                        }
                    }
                }
            let v56 = spiral_wrap_signed(v21 - v1, 32)
            let v57 = spiral_wrap_signed(v1 + v56, 32)
            let v58 = spiral_wrap_signed(v57 - 1, 32)
            let v59 = spiral_string_slice(v0, v1, v58)
            let v60 = v2 <> v59 
            let v61 = v55 < 0
            let #(v64, v65) =
                case v61 {
                    True -> {
                        #(v60, v21)
                    }
                    False -> {
                        let v62 = "/_"
                        let v63 = v60 <> v62 
                        #(v63, v55)
                    }
                }
            masked_cells_26(v0, v65, v64)
        }
    }
}

pub fn masked_threads_27(v0: String, v1: Int, v2: String) -> String {
    let v3 = spiral_string_length(v0)
    let v4 = spiral_wrap_signed(v3 - v1, 32)
    let v5 = spiral_wrap_signed(v1 + v4, 32)
    let v6 = spiral_wrap_signed(v5 - 1, 32)
    let v7 = spiral_string_slice(v0, v1, v6)
    let v8 = "thread '"
    let v9 = option.from_result(result.map(string.split_once(v7, v8), pair.first))
    let v10 = closure1(Nil)
    let v11 = v9 |> option.map(v10)
    let v12 = Us0None
    let v13 = v11 |> option.unwrap(v12)
    let v17 =
        case v13  {
            Us0None -> {
                -1
            }
            Us0Some(v14) -> {
                let v15 = bit_array.byte_size(bit_array.from_string(v14))
                v15
            }
        }
    let v18 = v17 < 0
    let v21 =
        case v18 {
            True -> {
                -1
            }
            False -> {
                let v19 = spiral_wrap_signed(v1 + v17, 32)
                let v20 = spiral_wrap_signed(v19 + 8, 32)
                v20
            }
        }
    let v22 = v21 < 0
    let v40 =
        case v22 {
            True -> {
                -1
            }
            False -> {
                let v23 = spiral_wrap_signed(v3 - v21, 32)
                let v24 = spiral_wrap_signed(v21 + v23, 32)
                let v25 = spiral_wrap_signed(v24 - 1, 32)
                let v26 = spiral_string_slice(v0, v21, v25)
                let v27 = "'"
                let v28 = option.from_result(result.map(string.split_once(v26, v27), pair.first))
                let v29 = v28 |> option.map(v10)
                let v30 = Us0None
                let v31 = v29 |> option.unwrap(v30)
                let v35 =
                    case v31  {
                        Us0None -> {
                            -1
                        }
                        Us0Some(v32) -> {
                            let v33 = bit_array.byte_size(bit_array.from_string(v32))
                            v33
                        }
                    }
                let v36 = v35 < 0
                case v36 {
                    True -> {
                        -1
                    }
                    False -> {
                        let v37 = spiral_wrap_signed(v21 + v35, 32)
                        let v38 = spiral_wrap_signed(v37 + 1, 32)
                        v38
                    }
                }
            }
        }
    let v41 = v40 < 0
    case v41 {
        True -> {
            let v42 = v2 <> v7 
            v42
        }
        False -> {
            let v43 = spiral_wrap_signed(v40 + 2, 32)
            let v44 = spiral_wrap_signed(v3 - v40, 32)
            let v45 = spiral_wrap_signed(v40 + v44, 32)
            let v46 = spiral_wrap_signed(v45 - 1, 32)
            let v47 = spiral_string_slice(v0, v40, v46)
            let v48 = " ("
            let v49 = v47 |> string.starts_with(v48)
            let v51 =
                case v49 {
                    True -> {
                        digits_end_6(v0, v43)
                    }
                    False -> {
                        -1
                    }
                }
            let v52 = v51 > v43
            let v53 =
                case v52 {
                    True -> {
                        v51
                    }
                    False -> {
                        -1
                    }
                }
            let v54 = v53 >= 0
            let v61 =
                case v54 {
                    True -> {
                        let v55 = spiral_wrap_signed(v3 - v53, 32)
                        let v56 = spiral_wrap_signed(v53 + v55, 32)
                        let v57 = spiral_wrap_signed(v56 - 1, 32)
                        let v58 = spiral_string_slice(v0, v53, v57)
                        let v59 = ") panicked"
                        let v60 = v58 |> string.starts_with(v59)
                        v60
                    }
                    False -> {
                        False
                    }
                }
            let v63 =
                case v61 {
                    True -> {
                        let v62 = spiral_wrap_signed(v53 + 10, 32)
                        v62
                    }
                    False -> {
                        -1
                    }
                }
            let v64 = v63 < 0
            let #(v77, v78) =
                case v64 {
                    True -> {
                        let v65 = spiral_wrap_signed(v21 - v1, 32)
                        let v66 = spiral_wrap_signed(v1 + v65, 32)
                        let v67 = spiral_wrap_signed(v66 - 1, 32)
                        let v68 = spiral_string_slice(v0, v1, v67)
                        let v69 = v2 <> v68 
                        #(v69, v21)
                    }
                    False -> {
                        let v70 = spiral_wrap_signed(v40 - v1, 32)
                        let v71 = spiral_wrap_signed(v1 + v70, 32)
                        let v72 = spiral_wrap_signed(v71 - 1, 32)
                        let v73 = spiral_string_slice(v0, v1, v72)
                        let v74 = v2 <> v73 
                        let v75 = " (_) panicked"
                        let v76 = v74 <> v75 
                        #(v76, v63)
                    }
                }
            masked_threads_27(v0, v78, v77)
        }
    }
}

pub fn method22(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh0, v8: Uh1, v9: Uh2, v10: Uh2, v11: Uh2, v12: Uh3, v13: Bool, v14: Uh4, v15: Uh3, v16: Uh3, v17: Uh0, v18: Uh0) -> Uh0 {
    case v17  {
        Uh0Cons(v19, v20, v21, v22, v23) -> {
            let v24 = method22(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v23, v18)
            let v25 = method23(v19, v20, v21, v22)
            let v26 = method24(v19, v20, v21, v22, v25, v1)
            let v49 =
                case v26 {
                    True -> {
                        let v27 = method25(v19, v14)
                        let #(v34, v35) =
                            case v27  {
                                Us11Some(v28, v29, v30) -> {
                                    #(v29, v30)
                                }
                                _ -> {
                                    let #(v32, v33) =
                                        case v27  {
                                            Us11None -> {
                                                let v31 = ""
                                                #(False, v31)
                                            }
                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                        }
                                    #(v32, v33)
                                }
                            }
                        let v36 = 0
                        let v37 = ""
                        let v38 = masked_cells_26(v35, v36, v37)
                        let v39 = 0
                        let v40 = masked_threads_27(v38, v39, v37)
                        let v41 = 0
                        let v42 = masked_cells_26(v22, v41, v37)
                        let v43 = 0
                        let v44 = masked_threads_27(v42, v43, v37)
                        let v45 = v34 == v21
                        let v47 =
                            case v45 {
                                True -> {
                                    let v46 = v40 == v44
                                    v46
                                }
                                False -> {
                                    False
                                }
                            }
                        let v48 = v47 == False
                        v48
                    }
                    False -> {
                        False
                    }
                }
            case v49 {
                True -> {
                    Uh0Cons(v19, v20, v21, v22, v24)
                }
                False -> {
                    v24
                }
            }
        }
        Uh0Nil -> {
            v18
        }
    }
}

pub fn method28(v0: Uh0, v1: Uh3) -> Uh3 {
    case v0  {
        Uh0Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method28(v6, v1)
            Uh3Cons(v2, v7)
        }
        Uh0Nil -> {
            v1
        }
    }
}

pub fn taken_29(v0: Int, v1: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0 > 0
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v0 - 1, 32)
                    let v6 = taken_29(v5, v3)
                    Uh3Cons(v2, v6)
                }
                False -> {
                    Uh3Nil
                }
            }
        }
        _ -> {
            Uh3Nil
        }
    }
}

pub fn method30(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh0, v8: Uh0) -> Uh0 {
    case v7  {
        Uh0Cons(v9, v10, v11, v12, v13) -> {
            let v14 = method30(v0, v1, v2, v3, v4, v5, v6, v13, v8)
            let v15 = method23(v9, v10, v11, v12)
            let v16 = method24(v9, v10, v11, v12, v15, v1)
            let v17 = v16 == False
            case v17 {
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

pub fn method32(v0: String, v1: Uh2, v2: Uh2) -> Uh2 {
    case v1  {
        Uh2Cons(v3, v4, v5) -> {
            let v6 = method32(v0, v5, v2)
            let v7 = v3 == v0
            case v7 {
                True -> {
                    Uh2Cons(v3, v4, v6)
                }
                False -> {
                    v6
                }
            }
        }
        Uh2Nil -> {
            v2
        }
    }
}

pub fn method33(v0: Uh2, v1: Int) -> Int {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + v3, 32)
            method33(v4, v5)
        }
        Uh2Nil -> {
            v1
        }
    }
}

pub fn method31(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh2, v8: Uh2) -> Uh2 {
    case v7  {
        Uh2Cons(v9, v10, v11) -> {
            let v12 = method31(v0, v1, v2, v3, v4, v5, v6, v11, v8)
            let v13 = Uh2Nil
            let v14 = method32(v9, v3, v13)
            let v15 = 0
            let v16 = method33(v14, v15)
            let v17 = spiral_wrap_signed(v10 - v16, 32)
            let v18 = Uh2Nil
            let v19 = method32(v9, v4, v18)
            let v20 = 0
            let v21 = method33(v19, v20)
            let v22 = spiral_wrap_signed(v17 - v21, 32)
            let v23 = v22 > 1
            case v23 {
                True -> {
                    Uh2Cons(v9, v10, v12)
                }
                False -> {
                    v12
                }
            }
        }
        Uh2Nil -> {
            v8
        }
    }
}

pub fn method34(v0: Uh2, v1: Uh3) -> Uh3 {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = method34(v4, v1)
            Uh3Cons(v2, v5)
        }
        Uh2Nil -> {
            v1
        }
    }
}

pub fn closure3(capt: #(String, String, Bool, String)) -> fn(#(String, String)) -> Bool {
    fn (dom) {
        let #(v4, _v5) = dom
        let #(v0, _v1, _v2, _v3) = capt
        let v6 = v4 == v0
        v6
    }
}

pub fn method36(v0: String, v1: String, v2: Bool, v3: String) -> fn(#(String, String)) -> Bool {
    closure3(#(v0, v1, v2, v3))
}

pub fn method37(v0: String, v1: String, v2: Bool, v3: String, v4: fn(#(String, String)) -> Bool, v5: Uh1) -> Bool {
    case v5  {
        Uh1Cons(v6, v7, v8) -> {
            let v9 = v4(#(v6, v7))
            case v9 {
                True -> {
                    True
                }
                False -> {
                    let v10 = method36(v0, v1, v2, v3)
                    method37(v0, v1, v2, v3, v10, v8)
                }
            }
        }
        Uh1Nil -> {
            False
        }
    }
}

pub fn method35(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh0, v8: Uh0) -> Uh0 {
    case v7  {
        Uh0Cons(v9, v10, v11, v12, v13) -> {
            let v14 = method35(v0, v1, v2, v3, v4, v5, v6, v13, v8)
            let v15 = method36(v9, v10, v11, v12)
            let v16 = method37(v9, v10, v11, v12, v15, v1)
            let v17 = v16 == False
            case v17 {
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

pub fn closure4(capt: #(String)) -> fn(#(String, String)) -> Bool {
    fn (dom) {
        let #(_v1, v2) = dom
        let #(v0) = capt
        let v3 = v2 == v0
        v3
    }
}

pub fn method39(v0: String) -> fn(#(String, String)) -> Bool {
    closure4(#(v0))
}

pub fn method40(v0: String, v1: fn(#(String, String)) -> Bool, v2: Uh1) -> Bool {
    case v2  {
        Uh1Cons(v3, v4, v5) -> {
            let v6 = v1(#(v3, v4))
            case v6 {
                True -> {
                    True
                }
                False -> {
                    let v7 = method39(v0)
                    method40(v0, v7, v5)
                }
            }
        }
        Uh1Nil -> {
            False
        }
    }
}

pub fn method38(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh3, v8: Uh3) -> Uh3 {
    case v7  {
        Uh3Cons(v9, v10) -> {
            let v11 = method38(v0, v1, v2, v3, v4, v5, v6, v10, v8)
            let v12 = method39(v9)
            let v13 = method40(v9, v12, v1)
            let v14 = v13 == False
            case v14 {
                True -> {
                    Uh3Cons(v9, v11)
                }
                False -> {
                    v11
                }
            }
        }
        Uh3Nil -> {
            v8
        }
    }
}

pub fn method41(v0: Uh6, v1: Uh3) -> Uh3 {
    case v0  {
        Uh6Cons(v2, v3, v4) -> {
            let v5 = method41(v4, v1)
            let v14 =
                case v2  {
                    Us13NoStaleResults -> {
                        let v8 = "no_stale_results"
                        v8
                    }
                    Us13OneCompilePerPrefix -> {
                        let v9 = "one_compile_per_prefix"
                        v9
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
                        let v10 = "withdrawn_demand_hidden"
                        v10
                    }
                }
            let v15 = "="
            let v16 = v14 <> v15 
            let v26 =
                case v3  {
                    Us12Broken(v18) -> {
                        let v19 = ","
                        let v20 = delimited_19(v19, v18)
                        let v21 = "FAIL["
                        let v22 = v21 <> v20 
                        let v23 = "]"
                        let v24 = v22 <> v23 
                        v24
                    }
                    Us12Held -> {
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
            let v21 = method22(v1, v2, v3, v4, v5, v6, v7, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v1, v20)
            let v22 = Uh3Nil
            let v23 = method28(v21, v22)
            let v28 =
                case v23  {
                    Uh3Nil -> {
                        Us12Held
                    }
                    _ -> {
                        let v25 = 5
                        let v26 = taken_29(v25, v23)
                        Us12Broken(v26)
                    }
                }
            let v29 = Uh0Nil
            let v30 = method30(v1, v2, v3, v4, v5, v6, v7, v1, v29)
            let v31 = Uh3Nil
            let v32 = method28(v30, v31)
            let v37 =
                case v32  {
                    Uh3Nil -> {
                        Us12Held
                    }
                    _ -> {
                        let v34 = 5
                        let v35 = taken_29(v34, v32)
                        Us12Broken(v35)
                    }
                }
            let v38 = Uh2Nil
            let v39 = method31(v1, v2, v3, v4, v5, v6, v7, v3, v38)
            let v40 = Uh3Nil
            let v41 = method34(v39, v40)
            let v46 =
                case v41  {
                    Uh3Nil -> {
                        Us12Held
                    }
                    _ -> {
                        let v43 = 5
                        let v44 = taken_29(v43, v41)
                        Us12Broken(v44)
                    }
                }
            let v47 = Uh0Nil
            let v48 = method35(v1, v2, v3, v4, v5, v6, v7, v1, v47)
            let v49 = Uh3Nil
            let v50 = method28(v48, v49)
            let v55 =
                case v50  {
                    Uh3Nil -> {
                        Us12Held
                    }
                    _ -> {
                        let v52 = 5
                        let v53 = taken_29(v52, v50)
                        Us12Broken(v53)
                    }
                }
            let v83 =
                case v7 {
                    True -> {
                        let v56 = Uh3Nil
                        let v57 = method38(v1, v2, v3, v4, v5, v6, v7, v6, v56)
                        let v62 =
                            case v57  {
                                Uh3Nil -> {
                                    Us12Held
                                }
                                _ -> {
                                    let v59 = 5
                                    let v60 = taken_29(v59, v57)
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
            let v85 = method41(v83, v84)
            let v86 = " "
            delimited_19(v86, v85)
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
                let v11 = masked_cells_26(v7, v9, v10)
                let v12 = 0
                let v13 = masked_threads_27(v11, v12, v10)
                let v14 = 0
                let v15 = masked_cells_26(v3, v14, v10)
                let v16 = 0
                let v17 = masked_threads_27(v15, v16, v10)
                let v18 = v6 == v2
                case v18 {
                    True -> {
                        let v19 = v13 == v17
                        v19
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
}

pub fn method44(v0: String, v1: String, v2: Bool, v3: String) -> fn(#(String, String, Bool, String)) -> Bool {
    closure6(#(v0, v1, v2, v3))
}

pub fn method45(v0: String, v1: String, v2: Bool, v3: String, v4: fn(#(String, String, Bool, String)) -> Bool, v5: Uh0) -> Bool {
    case v5  {
        Uh0Cons(v6, v7, v8, v9, v10) -> {
            let v11 = v4(#(v6, v7, v8, v9))
            case v11 {
                True -> {
                    True
                }
                False -> {
                    let v12 = method44(v0, v1, v2, v3)
                    method45(v0, v1, v2, v3, v12, v10)
                }
            }
        }
        Uh0Nil -> {
            False
        }
    }
}

pub fn method43(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh0, v8: Uh0) -> Uh0 {
    case v7  {
        Uh0Cons(v9, v10, v11, v12, v13) -> {
            let v14 = method43(v0, v1, v2, v3, v4, v5, v6, v13, v8)
            let v15 = method44(v9, v10, v11, v12)
            let v16 = method45(v9, v10, v11, v12, v15, v0)
            let v17 = v16 == False
            case v17 {
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

pub fn method46(v0: Uh0, v1: Int) -> Int {
    case v0  {
        Uh0Cons(v2, v3, v4, v5, v6) -> {
            let v7 = spiral_wrap_signed(v1 + 1, 32)
            method46(v6, v7)
        }
        Uh0Nil -> {
            v1
        }
    }
}
