import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/int
import gleam/list
import gleam/order
import gleam/string
import xsim_frames/types.{type Uh0, type Uh1, type Uh2, type Uh3, type Us2, type Uh6, type Uh15, type Us30, type Us45, type Uh28, type Us79, type Uh31, type Uh32, type Us80, type Us81, type Uh33, type Us83, Uh0Cons, Uh0Nil, Uh13Cons, Uh13Nil, Uh15Cons, Uh15Nil, Uh1Cons, Uh2Cons, Uh31Cons, Uh31Nil, Uh32Cons, Uh32Nil, Uh33Cons, Uh33Nil, Uh3Cons, Uh3Nil, Uh6Cons, Uh6Nil, Us12Broken, Us12Held, Us13SequentialEquivalence, Us2None, Us2Some, Us3None, Us3Some, Us45Crashed, Us45Done, Us45Erred, Us54Error, Us54Ok, Us55None, Us55Some, Us56Error, Us56Ok, Us61Error, Us61Ok, Us79OnBluesky, Us79OnMastodon, Us79OnX, Us80Error, Us80Ok, Us81Error, Us81Ok, Us82None, Us82Some, Us83None, Us83Some}
import xsim_frames/part1.{dictm_term_sorted, method4, spiral_string_length, spiral_wrap_signed, unicode_erlang_nfc}
import xsim_frames/part10.{method256, method257, method258, method259, method260, method261}
import xsim_frames/part11.{method273, method274}
import xsim_frames/part12.{chain_sources_283}
import xsim_frames/part16.{closure94, defused_dots_by_311}
import xsim_frames/part17.{closure100, closure101, closure99, defused_entities_332, linked_355, method358, method365, taken_while_364, units_on_351}
import xsim_frames/part2.{concat_balanced_22, masked_cells_28, masked_threads_29, method18, method20, method25, method26}

pub fn method366(v0: Uh31, v1: Uh31) -> Uh31 {
    case v0  {
        Uh31Cons(v2, v3, v4) -> {
            let v5 = method366(v4, v1)
            Uh31Cons(v2, v3, v5)
        }
        Uh31Nil -> v1
    }
}

pub fn split_point_363(v0: Uh31) -> #(Uh31, Uh31) {
    let v1 = closure100(Nil)
    let v2 = Uh31Nil
    let #(v3, v4) = taken_while_364(v1, v0, v2)
    let v5 = closure101(Nil)
    let v6 = Uh31Nil
    let #(v7, v8) = taken_while_364(v5, v4, v6)
    let v9 =
        case v8  {
            Uh31Nil -> False
            _ -> True
        }
    let v16 =
        case v9 {
            True -> {
                let v10 = 0
                let v11 = method365(v3, v10)
                let v12 = 0
                let v13 = method365(v7, v12)
                let v14 = spiral_wrap_signed(v11 + v13, 32)
                let v15 = v14 <= 60
                v15
            }
            False -> False
        }
    case v16 {
        True -> {
            let v17 = method366(v3, v7)
            #(v17, v8)
        }
        False -> {
            let v18 = Uh31Nil
            let #(v19, v20) = taken_while_364(v5, v0, v18)
            let v21 =
                case v20  {
                    Uh31Nil -> False
                    _ -> True
                }
            case v21 {
                True -> #(v19, v20)
                False -> {
                    let v22 = Uh31Nil
                    #(v22, v0)
                }
            }
        }
    }
}

pub fn method367(v0: Uh31, v1: Uh3) -> Uh3 {
    case v0  {
        Uh31Cons(v2, v3, v4) -> {
            let v5 = method367(v4, v1)
            Uh3Cons(v2, v5)
        }
        Uh31Nil -> v1
    }
}

pub fn chunk_362(v0: Int, v1: Uh31, v2: Uh31, v3: Int, v4: Uh3) -> Uh3 {
    case v1  {
        Uh31Cons(v15, v16, v17) -> {
            let v18 = spiral_wrap_signed(v3 + v16, 32)
            let v19 = v18 <= v0
            let v22 =
                case v19 {
                    True -> True
                    False -> {
                        let v20 =
                            case v2  {
                                Uh31Nil -> False
                                _ -> True
                            }
                        let v21 = v20 == False
                        v21
                    }
                }
            case v22 {
                True -> {
                    let v23 = Uh31Cons(v15, v16, v2)
                    chunk_362(v0, v17, v23, v18, v4)
                }
                False -> {
                    let #(v25, v26) = split_point_363(v2)
                    let v27 = Uh31Nil
                    let v28 = method358(v25, v27)
                    let v29 = method366(v28, v1)
                    let v37 =
                        case v26  {
                            Uh31Nil -> v4
                            _ -> {
                                let v30 = Uh31Nil
                                let v31 = method358(v26, v30)
                                let v32 = Uh3Nil
                                let v33 = method367(v31, v32)
                                let v34 = ""
                                let v35 = concat_balanced_22(v34, v33)
                                Uh3Cons(v35, v4)
                            }
                        }
                    let v38 = Uh31Nil
                    let v39 = 0
                    chunk_362(v0, v29, v38, v39, v37)
                }
            }
        }
        Uh31Nil -> {
            let v12 =
                case v2  {
                    Uh31Nil -> v4
                    _ -> {
                        let v5 = Uh31Nil
                        let v6 = method358(v2, v5)
                        let v7 = Uh3Nil
                        let v8 = method367(v6, v7)
                        let v9 = ""
                        let v10 = concat_balanced_22(v9, v8)
                        Uh3Cons(v10, v4)
                    }
                }
            let v13 = Uh3Nil
            method4(v12, v13)
        }
    }
}

pub fn chunks_of_361(v0: Int, v1: String, v2: fn(String) -> Int, v3: Uh31, v4: Int) -> Uh3 {
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
    let v16 = Uh31Nil
    let v17 = 0
    let v18 = Uh3Nil
    let v19 = chunk_362(v15, v3, v16, v17, v18)
    let v20 = 0
    let v21 = method20(v19, v20)
    let v22 = int.to_string(v21)
    let v23 = spiral_string_length(v22)
    let v24 = spiral_string_length(v7)
    let v25 = v23 > v24
    case v25 {
        True -> chunks_of_361(v0, v1, v2, v3, v21)
        False -> v19
    }
}

pub fn split_units_360(v0: Int, v1: String, v2: fn(String) -> Int, v3: Uh31) -> Uh3 {
    let v4 = 9
    chunks_of_361(v0, v1, v2, v3, v4)
}

pub fn split_cell_on_350(v0: Us79, v1: String, v2: Int, v3: String) -> Uh3 {
    let v4 = closure99(#(v0))
    let v5 = unicode_erlang_nfc(v3)
    let v6 = units_on_351(v0, v5)
    let v17 =
        case v0  {
            Us79OnBluesky(v13, v14) -> v6
            Us79OnMastodon -> {
                let v10 = 0
                let v11 = Uh31Nil
                linked_355(v6, v10, v11)
            }
            Us79OnX -> {
                let v7 = 0
                let v8 = Uh31Nil
                linked_355(v6, v7, v8)
            }
        }
    split_units_360(v2, v1, v4, v17)
}

pub fn split_cell_309(v0: String, v1: Int, v2: String) -> Uh3 {
    let v3 = Us79OnX
    let v4 = closure94(Nil)
    let v5 = defused_dots_by_311(v4, v2)
    let v6 = defused_entities_332(v5)
    split_cell_on_350(v3, v0, v1, v6)
}

pub fn closure93(capt: #(String, Int)) -> fn(String) -> Uh3 {
    fn (v2) {
        let #(v0, v1) = capt
        split_cell_309(v0, v1, v2)
    }
}

pub fn closure92(capt: #(String)) -> fn(Int) -> fn(String) -> Uh3 {
    fn (v1) {
        let #(v0) = capt
        closure93(#(v0, v1))
    }
}

pub fn closure91(capt: Nil) -> fn(String) -> fn(Int) -> fn(String) -> Uh3 {
    fn (v0) {
        closure92(#(v0))
    }
}

pub fn method369(v0: Uh32, v1: Uh32) -> Uh32 {
    case v0  {
        Uh32Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40) -> {
            let v41 = Uh32Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v1)
            method369(v40, v41)
        }
        Uh32Nil -> v1
    }
}

pub fn ok_c102(capt: Nil) -> fn(BitArray) -> Us80 {
    fn (v0) {
        Us80Ok(v0)
    }
}

pub fn method370() -> fn(BitArray) -> Us80 {
    ok_c102(Nil)
}

pub fn error_c103(capt: Nil) -> fn(Dynamic) -> Us80 {
    fn (v0) {
        Us80Error(v0)
    }
}

pub fn method371() -> fn(Dynamic) -> Us80 {
    error_c103(Nil)
}

pub fn method372(v0: Uh15, v1: Int) -> Int {
    case v0  {
        Uh15Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + 1, 32)
            method372(v4, v5)
        }
        Uh15Nil -> v1
    }
}

pub fn ok_c104(capt: Nil) -> fn(#(String, Us45, String)) -> Us81 {
    fn (dom) {
        let #(v0, v1, v2) = dom
        Us81Ok(v0, v1, v2)
    }
}

pub fn method374() -> fn(#(String, Us45, String)) -> Us81 {
    ok_c104(Nil)
}

pub fn error_c105(capt: Nil) -> fn(Nil) -> Us81 {
    fn (dom) {
        Us81Error
    }
}

pub fn method375() -> fn(Nil) -> Us81 {
    error_c105(Nil)
}

pub fn shown_inserted_376(v0: String, v1: String, v2: Bool, v3: String, v4: Uh0) -> Uh0 {
    case v4  {
        Uh0Cons(v5, v6, v7, v8, v9) -> {
            let v10 = string.compare(v5, v0) == order.Lt
            let v13 =
                case v10 {
                    True -> -1
                    False -> {
                        let v11 = string.compare(v5, v0) == order.Gt
                        case v11 {
                            True -> 1
                            False -> 0
                        }
                    }
                }
            let v14 = v13 == -1
            case v14 {
                True -> {
                    let v15 = shown_inserted_376(v0, v1, v2, v3, v9)
                    Uh0Cons(v5, v6, v7, v8, v15)
                }
                False -> Uh0Cons(v0, v1, v2, v3, v4)
            }
        }
        _ -> Uh0Cons(v0, v1, v2, v3, v4)
    }
}

pub fn method373(v0: dict.Dict(String, #(String, Us45, String)), v1: Uh3, v2: Uh0) -> Uh0 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = dict.get(v0, v3)
            let v6 = method374()
            let v7 = method375()
            let v8 = case v5 { Ok(x) -> v6(x) Error(x) -> v7(x) }
            let v15 =
                case v8  {
                    Us81Error -> Us82None
                    Us81Ok(v9, v10, v11) -> Us82Some(v9, v10, v11)
                }
            let #(v25, v26, v27) =
                case v15  {
                    Us82Some(v16, v17, v18) -> #(v16, v17, v18)
                    _ -> {
                        let #(v22, v23, v24) =
                            case v15  {
                                Us82None -> panic as "dict.present: the key is not in the dict"
                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                            }
                        #(v22, v23, v24)
                    }
                }
            let v28 =
                case v26  {
                    Us45Done -> True
                    _ -> False
                }
            let v34 =
                case v26  {
                    Us45Crashed -> {
                        let v31 = "crash"
                        v31
                    }
                    Us45Done -> {
                        let v29 = "ok"
                        v29
                    }
                    Us45Erred -> {
                        let v30 = "error"
                        v30
                    }
                }
            let v35 = "|"
            let v36 = v34 <> v35 
            let v37 = v36 <> v27 
            let v38 = shown_inserted_376(v3, v25, v28, v37, v2)
            method373(v0, v4, v38)
        }
        Uh3Nil -> v2
    }
}

pub fn method377(v0: dict.Dict(String, String), v1: Uh3, v2: Uh1) -> Uh1 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = dict.get(v0, v3)
            let v6 = method258()
            let v7 = method259()
            let v8 = case v5 { Ok(x) -> v6(x) Error(x) -> v7(x) }
            let v13 =
                case v8  {
                    Us56Error -> Us2None
                    Us56Ok(v9) -> Us2Some(v9)
                }
            let v17 =
                case v13  {
                    Us2None -> panic as "dict.present: the key is not in the dict"
                    Us2Some(v14) -> v14
                }
            let v18 = Uh1Cons(v3, v17, v2)
            method377(v0, v4, v18)
        }
        Uh3Nil -> v2
    }
}

pub fn method378(v0: dict.Dict(String, Int), v1: Uh3, v2: Uh2) -> Uh2 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = dict.get(v0, v3)
            let v6 = method273()
            let v7 = method274()
            let v8 = case v5 { Ok(x) -> v6(x) Error(x) -> v7(x) }
            let v13 =
                case v8  {
                    Us61Error -> Us3None
                    Us61Ok(v9) -> Us3Some(v9)
                }
            let v17 =
                case v13  {
                    Us3None -> panic as "dict.present: the key is not in the dict"
                    Us3Some(v14) -> v14
                }
            let v18 = Uh2Cons(v3, v17, v2)
            method378(v0, v4, v18)
        }
        Uh3Nil -> v2
    }
}

pub fn method379(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh0, v8: Uh0) -> Uh0 {
    case v7  {
        Uh0Cons(v9, v10, v11, v12, v13) -> {
            let v14 = method379(v0, v1, v2, v3, v4, v5, v6, v13, v8)
            let v15 = method25(v9, v10, v11, v12)
            let v16 = method26(v9, v10, v11, v12, v15, v1)
            case v16 {
                True -> Uh0Cons(v9, v10, v11, v12, v14)
                False -> v14
            }
        }
        Uh0Nil -> v8
    }
}

pub fn method380(v0: dict.Dict(Int, Nil), v1: Uh15, v2: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v3: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v4: dict.Dict(String, String), v5: dict.Dict(String, Uh3), v6: dict.Dict(String, dict.Dict(String, Nil)), v7: dict.Dict(String, #(Int, Bool)), v8: dict.Dict(String, Nil), v9: Int, v10: Int, v11: Int, v12: Int, v13: dict.Dict(String, Uh3), v14: Uh3, v15: dict.Dict(String, #(Us45, String)), v16: dict.Dict(String, Int), v17: dict.Dict(String, String), v18: dict.Dict(String, String), v19: dict.Dict(String, Int), v20: Int, v21: dict.Dict(String, Int), v22: dict.Dict(String, Int), v23: dict.Dict(String, Int), v24: Int, v25: Int, v26: Int, v27: Int, v28: Int, v29: dict.Dict(String, #(String, Us45, String)), v30: Bool, v31: Bool, v32: Us30, v33: Bool, v34: Int, v35: Uh28, v36: fn(Uh3) -> #(Us45, String), v37: Uh0, v38: Uh33) -> Uh33 {
    case v37  {
        Uh0Cons(v39, v40, v41, v42, v43) -> {
            let v44 = Us2Some(v39)
            let v45 = Uh3Nil
            let v46 = chain_sources_283(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v44, v45)
            let v47 = "\n"
            let v48 = concat_balanced_22(v47, v46)
            let #(v49, v50) = v36(v46)
            let v51 = Uh33Cons(v48, v49, v50, v38)
            method380(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v43, v51)
        }
        Uh0Nil -> v38
    }
}

pub fn method382(v0: Uh3, v1: Uh33) -> Us83 {
    case v1  {
        Uh33Cons(v3, v4, v5, v6) -> {
            let v7 = "\n"
            let v8 = concat_balanced_22(v7, v0)
            let v9 = v3 == v8
            case v9 {
                True -> Us83Some(v3, v4, v5)
                False -> method382(v0, v6)
            }
        }
        Uh33Nil -> Us83None
    }
}

pub fn method381(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: dict.Dict(Int, Nil), v8: Uh15, v9: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v10: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v11: dict.Dict(String, String), v12: dict.Dict(String, Uh3), v13: dict.Dict(String, dict.Dict(String, Nil)), v14: dict.Dict(String, #(Int, Bool)), v15: dict.Dict(String, Nil), v16: Int, v17: Int, v18: Int, v19: Int, v20: dict.Dict(String, Uh3), v21: Uh3, v22: dict.Dict(String, #(Us45, String)), v23: dict.Dict(String, Int), v24: dict.Dict(String, String), v25: dict.Dict(String, String), v26: dict.Dict(String, Int), v27: Int, v28: dict.Dict(String, Int), v29: dict.Dict(String, Int), v30: dict.Dict(String, Int), v31: Int, v32: Int, v33: Int, v34: Int, v35: Int, v36: dict.Dict(String, #(String, Us45, String)), v37: Bool, v38: Bool, v39: Us30, v40: Bool, v41: Int, v42: Uh28, v43: Uh33, v44: fn(Uh3) -> #(Us45, String), v45: Uh0, v46: Uh0) -> Uh0 {
    case v45  {
        Uh0Cons(v47, v48, v49, v50, v51) -> {
            let v52 = method381(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v51, v46)
            let v53 = method25(v47, v48, v49, v50)
            let v54 = method26(v47, v48, v49, v50, v53, v1)
            let v91 =
                case v54 {
                    True -> {
                        let v55 = Us2Some(v47)
                        let v56 = Uh3Nil
                        let v57 = chain_sources_283(v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v55, v56)
                        let v58 = method382(v57, v43)
                        let #(v66, v67) =
                            case v58  {
                                Us83Some(v59, v60, v61) -> #(v60, v61)
                                _ -> {
                                    let #(v64, v65) =
                                        case v58  {
                                            Us83None -> v44(v57)
                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                        }
                                    #(v64, v65)
                                }
                            }
                        let v68 =
                            case v66  {
                                Us45Done -> True
                                _ -> False
                            }
                        let v74 =
                            case v66  {
                                Us45Crashed -> {
                                    let v71 = "crash"
                                    v71
                                }
                                Us45Done -> {
                                    let v69 = "ok"
                                    v69
                                }
                                Us45Erred -> {
                                    let v70 = "error"
                                    v70
                                }
                            }
                        let v75 = "|"
                        let v76 = v74 <> v75 
                        let v77 = v76 <> v67 
                        let v78 = 0
                        let v79 = ""
                        let v80 = masked_cells_28(v77, v78, v79)
                        let v81 = 0
                        let v82 = masked_threads_29(v80, v81, v79)
                        let v83 = 0
                        let v84 = masked_cells_28(v50, v83, v79)
                        let v85 = 0
                        let v86 = masked_threads_29(v84, v85, v79)
                        let v87 = v68 == v49
                        let v89 =
                            case v87 {
                                True -> {
                                    let v88 = v82 == v86
                                    v88
                                }
                                False -> False
                            }
                        let v90 = v89 == False
                        v90
                    }
                    False -> False
                }
            case v91 {
                True -> Uh0Cons(v47, v48, v49, v50, v52)
                False -> v52
            }
        }
        Uh0Nil -> v46
    }
}

pub fn method383(v0: Uh3, v1: dict.Dict(String, Nil)) -> dict.Dict(String, Nil) {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = dict.insert(v1, v2, Nil)
            method383(v3, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method384(v0: dict.Dict(Int, Nil), v1: Uh15, v2: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v3: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v4: dict.Dict(String, String), v5: dict.Dict(String, Uh3), v6: dict.Dict(String, dict.Dict(String, Nil)), v7: dict.Dict(String, #(Int, Bool)), v8: dict.Dict(String, Nil), v9: Int, v10: Int, v11: Int, v12: Int, v13: dict.Dict(String, Uh3), v14: Uh3, v15: dict.Dict(String, #(Us45, String)), v16: dict.Dict(String, Int), v17: dict.Dict(String, String), v18: dict.Dict(String, String), v19: dict.Dict(String, Int), v20: Int, v21: dict.Dict(String, Int), v22: dict.Dict(String, Int), v23: dict.Dict(String, Int), v24: Int, v25: Int, v26: Int, v27: Int, v28: Int, v29: dict.Dict(String, #(String, Us45, String)), v30: Bool, v31: Bool, v32: Us30, v33: Bool, v34: Int, v35: Uh28, v36: dict.Dict(String, Nil), v37: Uh0, v38: Uh0) -> Uh0 {
    case v37  {
        Uh0Cons(v39, v40, v41, v42, v43) -> {
            let v44 = method384(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v43, v38)
            let v86 =
                case v41 {
                    True -> {
                        let v45 = dict.get(v3, v39)
                        let v46 = method256()
                        let v47 = method257()
                        let v48 = case v45 { Ok(x) -> v46(x) Error(x) -> v47(x) }
                        let v55 =
                            case v48  {
                                Us54Error -> Us55None
                                Us54Ok(v49, v50, v51) -> Us55Some(v49, v50, v51)
                            }
                        case v55  {
                            Us55None -> False
                            Us55Some(v56, v57, v58) -> {
                                let v59 = dict.keys(v57)
                                let v60 = dictm_term_sorted(v59)
                                let v61 = Uh13Nil
                                let listm_fold = v60 |> list.fold (v61, fn (acc, x) {
                                let v62 = x
                                let v63 = acc
                                let v64 = Uh13Cons(v62, v63)
                                v64
                                })
                                let v65 = listm_fold
                                let v66 = Uh13Nil
                                let v67 = method260(v65, v66)
                                let v68 = -1
                                let v69 = method261(v57, v67, v68)
                                let v70 = dict.get(v57, v69)
                                let v71 = method258()
                                let v72 = method259()
                                let v73 = case v70 { Ok(x) -> v71(x) Error(x) -> v72(x) }
                                let v78 =
                                    case v73  {
                                        Us56Error -> Us2None
                                        Us56Ok(v74) -> Us2Some(v74)
                                    }
                                let v82 =
                                    case v78  {
                                        Us2None -> panic as "dict.present: the key is not in the dict"
                                        Us2Some(v79) -> v79
                                    }
                                let v83 = dict.has_key(v36, v82)
                                v83
                            }
                        }
                    }
                    False -> False
                }
            case v86 {
                True -> Uh0Cons(v39, v40, v41, v42, v44)
                False -> v44
            }
        }
        Uh0Nil -> v38
    }
}

pub fn method385(v0: Uh6, v1: Uh6) -> Uh6 {
    case v0  {
        Uh6Cons(v2, v3, v4) -> {
            let v5 = method385(v4, v1)
            Uh6Cons(v2, v3, v5)
        }
        Uh6Nil -> v1
    }
}

pub fn method386(v0: dict.Dict(String, Int), v1: Uh3, v2: Int) -> Int {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = dict.get(v0, v3)
            let v6 = method273()
            let v7 = method274()
            let v8 = case v5 { Ok(x) -> v6(x) Error(x) -> v7(x) }
            let v13 =
                case v8  {
                    Us61Error -> Us3None
                    Us61Ok(v9) -> Us3Some(v9)
                }
            let v17 =
                case v13  {
                    Us3None -> panic as "dict.present: the key is not in the dict"
                    Us3Some(v14) -> v14
                }
            let v18 = spiral_wrap_signed(v2 + v17, 32)
            method386(v0, v4, v18)
        }
        Uh3Nil -> v2
    }
}

pub fn method387(v0: Uh6, v1: Uh3) -> Uh3 {
    case v0  {
        Uh6Cons(v2, v3, v4) -> {
            let v5 = method387(v4, v1)
            let v12 =
                case v3  {
                    Us12Broken(v6) -> {
                        let v7 =
                            case v2  {
                                Us13SequentialEquivalence -> True
                                _ -> False
                            }
                        case v7 {
                            True -> v6
                            False -> Uh3Nil
                        }
                    }
                    Us12Held -> Uh3Nil
                }
            method18(v12, v5)
        }
        Uh6Nil -> v1
    }
}
