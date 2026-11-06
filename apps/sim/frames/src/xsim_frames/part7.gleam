import gleam/int
import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Uh14, type Uh20, type Uh21, type Us25, type Uh22, type Us26, type Uh24, type Uh23, type Uh25, type Uh26, type Uh27, type Us28, type Uh28, Uh14Cons, Uh14Nil, Uh21Cons, Uh21Nil, Uh22Cons, Uh22Nil, Uh23Cons, Uh23Nil, Uh24Cons, Uh24Nil, Uh25Cons, Uh25Nil, Uh26Nil, Uh27Cons, Uh27Nil, Uh28Cons, Uh3Cons, Uh3Nil, Us25None, Us25Some, Us26None, Us26Some, Us27None, Us27Some, Us28None, Us28Some}
import xsim_frames/part1.{method18, method4, spiral_string_length, spiral_string_slice, spiral_wrap_signed}
import xsim_frames/part2.{delimited_21, method20}
import xsim_frames/part5.{quoted_121}
import xsim_frames/part6.{blank_tail_length_165, method163, method168, method169, method170, method171, method175, method176, method177, method178, method179, method180, method182}

pub fn method181(v0: String, v1: Us25, v2: Uh3, v3: Int, v4: Uh3, v5: Int, v6: Int, v7: Uh23, v8: Uh25, v9: Uh26, v10: Us26, v11: Uh27, v12: Uh27, v13: Int) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27, Int) {
    case v4  {
        Uh3Cons(v14, v15) -> {
            let v16 = spiral_wrap_signed(v5 + 1, 32)
            let v17 = int.to_string(v16)
            let v18 = spiral_wrap_signed(v6 + 1, 32)
            let v19 = { v0 } <> { " " }
            let v20 = int.to_string(v13)
            let v21 = { v19 } <> { v20 }
            let v22 = { v21 } <> { "/" }
            let v23 = int.to_string(v3)
            let v24 = { v22 } <> { v23 }
            let v25 = { v24 } <> { "\n" }
            let v26 = { v25 } <> { v14 }
            let v27 = spiral_string_length(v26)
            let v28 = string.to_graphemes(v26)
            let v29 = v28 |> list.reverse
            let listm_fold = v29 |> list.fold (Uh3Nil, fn (acc, x) {
            let v31 = x
            let v32 = acc
            Uh3Cons(v31, v32)
            })
            let v34 = listm_fold
            let v36 = method4(v34, Uh3Nil)
            let v38 = blank_tail_length_165(v36, 0)
            let v39 = spiral_wrap_signed(v27 - v38, 32)
            let v40 = spiral_wrap_signed(v39 - 1, 32)
            let v41 = spiral_string_slice(v26, 0, v40)
            let v42 = method169(v0, v13, v7)
            let #(v92, v93, v94, v95, v96, v97, v98, v99) =
                case v42  {
                    Us28Some(v43, v44, v45, v46, v47, v48) -> {
                        let v50 = method182(v0, v13, v17, v18, v41, v3, v7, Uh23Nil)
                        #(v16, v18, v50, v8, v9, v10, v11, v12)
                    }
                    _ -> {
                        let #(v84, v85, v86, v87, v88, v89, v90, v91) =
                            case v42  {
                                Us28None -> {
                                    let v51 = v13 == 1
                                    let v75 =
                                        case v51 {
                                            True -> {
                                                case v1  {
                                                    Us25None -> Us26None
                                                    Us25Some(v52) -> {
                                                        let v53 = method168(v52, v9)
                                                        case v53  {
                                                            Us27None -> Us26None
                                                            Us27Some(v54, v55) -> Us26Some(v55)
                                                        }
                                                    }
                                                }
                                            }
                                            False -> {
                                                let v63 = spiral_wrap_signed(v13 - 1, 32)
                                                let v64 = method169(v0, v63, v7)
                                                case v64  {
                                                    Us28None -> Us26None
                                                    Us28Some(v65, v66, v67, v68, v69, v70) -> Us26Some(v65)
                                                }
                                            }
                                        }
                                    let v77 = Uh24Cons(v17, v18, v41, Uh24Nil)
                                    let v79 = Uh23Cons(v17, v0, v13, v3, v75, v77, Uh23Nil)
                                    let v80 = method170(v7, v79)
                                    let v82 = Uh25Cons(v0, v13, Uh25Nil)
                                    let v83 = method171(v8, v82)
                                    #(v16, v18, v80, v83, v9, v10, v11, v12)
                                }
                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                            }
                        #(v84, v85, v86, v87, v88, v89, v90, v91)
                    }
                }
            let v100 = spiral_wrap_signed(v13 + 1, 32)
            method181(v0, v1, v2, v3, v15, v92, v93, v94, v95, v96, v97, v98, v99, v100)
        }
        Uh3Nil -> #(v5, v6, v7, v8, v9, v10, v11, v12, v13)
    }
}

pub fn method174(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: String, v2: Us25, v3: Uh3, v4: Uh3, v5: Int, v6: Int, v7: Uh23, v8: Uh25, v9: Uh26, v10: Us26, v11: Uh27, v12: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27) {
    let #(v60, v61, v62, v63, v64, v65, v66, v67) =
        case v4  {
            Uh3Cons(v13, v14) -> {
                let v15 = v0(v1)
                let v16 = v15(280)
                let v17 = v16(v13)
                let v19 = method20(v17, 0)
                let v21 = method175(v1, v7, Uh23Nil)
                let v23 = method176(v21, Uh14Nil)
                let v25 = method177(v19, v23, Uh14Nil)
                let #(v26, v27, v28, v29, v30, v31, v32, v33) = method178(v1, v25, v5, v6, v7, v8, v9, v10, v11, v12)
                let #(v35, v36, v37, v38, v39, v40, v41, v42, _v43) = method181(v1, v2, v3, v19, v17, v26, v27, v28, v29, v30, v31, v32, v33, 1)
                method174(v0, v1, v2, v3, v14, v35, v36, v37, v38, v39, v40, v41, v42)
            }
            _ -> {
                let #(v52, v53, v54, v55, v56, v57, v58, v59) =
                    case v4  {
                        Uh3Nil -> #(v5, v6, v7, v8, v9, v10, v11, v12)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v52, v53, v54, v55, v56, v57, v58, v59)
            }
        }
    #(v60, v61, v62, v63, v64, v65, v66, v67)
}

pub fn method173(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: Uh22, v2: Int, v3: Int, v4: Uh23, v5: Uh25, v6: Uh26, v7: Us26, v8: Uh27, v9: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27) {
    let #(v43, v44, v45, v46, v47, v48, v49, v50) =
        case v1  {
            Uh22Cons(v10, v11, v12, v13) -> {
                let v18 =
                    case v12  {
                        Uh3Cons(v14, v15) -> v15
                        Uh3Nil -> Uh3Nil
                    }
                let #(v19, v20, v21, v22, v23, v24, v25, v26) = method174(v0, v10, v11, v12, v18, v2, v3, v4, v5, v6, v7, v8, v9)
                method173(v0, v13, v19, v20, v21, v22, v23, v24, v25, v26)
            }
            _ -> {
                let #(v35, v36, v37, v38, v39, v40, v41, v42) =
                    case v1  {
                        Uh22Nil -> #(v2, v3, v4, v5, v6, v7, v8, v9)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v35, v36, v37, v38, v39, v40, v41, v42)
            }
        }
    #(v43, v44, v45, v46, v47, v48, v49, v50)
}

pub fn method184(v0: Uh22, v1: Uh27) -> Uh27 {
    case v0  {
        Uh22Cons(v2, v3, v4, v5) -> {
            let v6 = method184(v5, v1)
            Uh27Cons(v2, v6)
        }
        Uh22Nil -> v1
    }
}

pub fn method186(v0: String, v1: Uh23) -> Us28 {
    case v1  {
        Uh23Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = v4 == v0
            let v12 =
                case v10 {
                    True -> {
                        v5 == 2
                    }
                    False -> False
                }
            case v12 {
                True -> Us28Some(v3, v4, v5, v6, v7, v8)
                False -> method186(v0, v9)
            }
        }
        Uh23Nil -> Us28None
    }
}

pub fn method185(v0: Int, v1: Int, v2: Uh23, v3: Uh25, v4: Uh26, v5: Us26, v6: Uh27, v7: Uh27, v8: Uh27, v9: Uh27) -> Uh27 {
    case v8  {
        Uh27Cons(v10, v11) -> {
            let v12 = method185(v0, v1, v2, v3, v4, v5, v6, v7, v11, v9)
            let v13 = method186(v10, v2)
            let v21 =
                case v13  {
                    Us28None -> False
                    Us28Some(v14, v15, v16, v17, v18, v19) -> True
                }
            case v21 {
                True -> Uh27Cons(v10, v12)
                False -> v12
            }
        }
        Uh27Nil -> v9
    }
}

pub fn method187(v0: Uh27, v1: Int) -> Int {
    case v0  {
        Uh27Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method187(v3, v4)
        }
        Uh27Nil -> v1
    }
}

pub fn method188(v0: Int, v1: Uh27, v2: Int, v3: Uh27) -> #(Int, Uh27) {
    case v1  {
        Uh27Cons(v4, v5) -> {
            let v6 = spiral_wrap_signed(v2 + 1, 32)
            let v7 = spiral_wrap_signed(v0 - 1, 32)
            let v8 = v2 >= v7
            let v13 =
                case v8 {
                    True -> {
                        let v9 = spiral_wrap_signed(v2 - v0, 32)
                        let v10 = spiral_wrap_signed(v9 + 1, 32)
                        let v11 = v10 % v0
                        v11 == 0
                    }
                    False -> False
                }
            let v15 =
                case v13 {
                    True -> Uh27Cons(v4, v3)
                    False -> v3
                }
            method188(v0, v5, v6, v15)
        }
        Uh27Nil -> #(v2, v3)
    }
}

pub fn method189(v0: Uh27, v1: Uh27) -> Uh27 {
    case v0  {
        Uh27Cons(v2, v3) -> {
            let v4 = Uh27Cons(v2, v1)
            method189(v3, v4)
        }
        Uh27Nil -> v1
    }
}

pub fn taken_190(v0: Int, v1: Uh27) -> Uh27 {
    case v1  {
        Uh27Cons(v2, v3) -> {
            let v4 = v0 > 0
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v0 - 1, 32)
                    let v6 = taken_190(v5, v3)
                    Uh27Cons(v2, v6)
                }
                False -> Uh27Nil
            }
        }
        _ -> Uh27Nil
    }
}

pub fn method192(v0: String, v1: Uh23, v2: Uh23) -> Uh23 {
    case v1  {
        Uh23Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method192(v0, v9, v2)
            let v11 = v4 == v0
            let v12 = v11 == False
            let v14 =
                case v12 {
                    True -> True
                    False -> {
                        v5 != 2
                    }
                }
            case v14 {
                True -> Uh23Cons(v3, v4, v5, v6, v7, v8, v10)
                False -> v10
            }
        }
        Uh23Nil -> v2
    }
}

pub fn method193(v0: String, v1: Uh25, v2: Uh25) -> Uh25 {
    case v1  {
        Uh25Cons(v3, v4, v5) -> {
            let v6 = method193(v0, v5, v2)
            let v7 = v3 == v0
            let v8 = v7 == False
            let v10 =
                case v8 {
                    True -> True
                    False -> {
                        v4 != 2
                    }
                }
            case v10 {
                True -> Uh25Cons(v3, v4, v6)
                False -> v6
            }
        }
        Uh25Nil -> v2
    }
}

pub fn method194(v0: Uh27, v1: Uh27) -> Uh27 {
    case v0  {
        Uh27Cons(v2, v3) -> {
            let v4 = method194(v3, v1)
            Uh27Cons(v2, v4)
        }
        Uh27Nil -> v1
    }
}

pub fn method191(v0: Uh27, v1: Int, v2: Int, v3: Uh23, v4: Uh25, v5: Uh26, v6: Us26, v7: Uh27, v8: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27) {
    let #(v34, v35, v36, v37, v38, v39, v40, v41) =
        case v0  {
            Uh27Cons(v9, v10) -> {
                let v12 = method192(v9, v3, Uh23Nil)
                let v14 = method193(v9, v4, Uh25Nil)
                let v16 = Uh27Cons(v9, Uh27Nil)
                let v17 = method194(v7, v16)
                method191(v10, v1, v2, v12, v14, v5, v6, v17, v8)
            }
            _ -> {
                let #(v26, v27, v28, v29, v30, v31, v32, v33) =
                    case v0  {
                        Uh27Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v26, v27, v28, v29, v30, v31, v32, v33)
            }
        }
    #(v34, v35, v36, v37, v38, v39, v40, v41)
}

pub fn closure22(capt: #(String)) -> fn(#(String, Us25, Uh3)) -> Bool {
    fn (dom) {
        let #(_v1, v2, _v3) = dom
        let #(v0) = capt
        case v2  {
            Us25None -> False
            Us25Some(v4) -> {
                v4 == v0
            }
        }
    }
}

pub fn method196(v0: String) -> fn(#(String, Us25, Uh3)) -> Bool {
    closure22(#(v0))
}

pub fn method197(v0: String, v1: fn(#(String, Us25, Uh3)) -> Bool, v2: Uh22) -> Bool {
    case v2  {
        Uh22Cons(v3, v4, v5, v6) -> {
            let v7 = v1(#(v3, v4, v5))
            case v7 {
                True -> True
                False -> {
                    let v8 = method196(v0)
                    method197(v0, v8, v6)
                }
            }
        }
        Uh22Nil -> False
    }
}

pub fn closure23(capt: #(String)) -> fn(String) -> Bool {
    fn (v1) {
        let #(v0) = capt
        v0 == v1
    }
}

pub fn method198(v0: String) -> fn(String) -> Bool {
    closure23(#(v0))
}

pub fn method199(v0: String, v1: fn(String) -> Bool, v2: Uh27) -> Bool {
    case v2  {
        Uh27Cons(v3, v4) -> {
            let v5 = v1(v3)
            case v5 {
                True -> True
                False -> {
                    let v6 = method198(v0)
                    method199(v0, v6, v4)
                }
            }
        }
        Uh27Nil -> False
    }
}

pub fn method195(v0: Int, v1: Int, v2: Uh23, v3: Uh25, v4: Uh26, v5: Us26, v6: Uh27, v7: Uh27, v8: Uh22, v9: Uh27, v10: Uh27) -> Uh27 {
    case v9  {
        Uh27Cons(v11, v12) -> {
            let v13 = method195(v0, v1, v2, v3, v4, v5, v6, v7, v8, v12, v10)
            let v14 = method196(v11)
            let v15 = method197(v11, v14, v8)
            let v19 =
                case v15 {
                    True -> {
                        let v16 = method198(v11)
                        let v17 = method199(v11, v16, v6)
                        v17 == False
                    }
                    False -> False
                }
            case v19 {
                True -> Uh27Cons(v11, v13)
                False -> v13
            }
        }
        Uh27Nil -> v10
    }
}

pub fn method201(v0: String, v1: Uh14, v2: Int, v3: Int, v4: Uh23, v5: Uh25, v6: Uh26, v7: Us26, v8: Uh27, v9: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27) {
    let #(v32, v33, v34, v35, v36, v37, v38, v39) =
        case v1  {
            Uh14Cons(v10, v11) -> {
                let v13 = method179(v0, v10, v4, Uh23Nil)
                let v15 = method180(v0, v10, v5, Uh25Nil)
                method201(v0, v11, v2, v3, v13, v15, v6, v7, v8, v9)
            }
            _ -> {
                let #(v24, v25, v26, v27, v28, v29, v30, v31) =
                    case v1  {
                        Uh14Nil -> #(v2, v3, v4, v5, v6, v7, v8, v9)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v24, v25, v26, v27, v28, v29, v30, v31)
            }
        }
    #(v32, v33, v34, v35, v36, v37, v38, v39)
}

pub fn method200(v0: Uh27, v1: Int, v2: Int, v3: Uh23, v4: Uh25, v5: Uh26, v6: Us26, v7: Uh27, v8: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27) {
    let #(v42, v43, v44, v45, v46, v47, v48, v49) =
        case v0  {
            Uh27Cons(v9, v10) -> {
                let v12 = method175(v9, v3, Uh23Nil)
                let v14 = method176(v12, Uh14Nil)
                let #(v15, v16, v17, v18, v19, v20, v21, _v22) = method201(v9, v14, v1, v2, v3, v4, v5, v6, v7, v8)
                let v24 = Uh27Cons(v9, Uh27Nil)
                let v25 = method194(v8, v24)
                method200(v10, v15, v16, v17, v18, v19, v20, v21, v25)
            }
            _ -> {
                let #(v34, v35, v36, v37, v38, v39, v40, v41) =
                    case v0  {
                        Uh27Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v34, v35, v36, v37, v38, v39, v40, v41)
            }
        }
    #(v42, v43, v44, v45, v46, v47, v48, v49)
}

pub fn materialized_162(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: Uh22, v2: Int, v3: Int, v4: Int) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27) {
    let #(v12, v13, v14, v15, v16, v17, v18, v19) = method163(v0, v1, v2, 0, Uh23Nil, Uh25Nil, Uh26Nil, Us26None, Uh27Nil, Uh27Nil)
    let #(v20, v21, v22, v23, v24, v25, v26, v27) = method173(v0, v1, v12, v13, v14, v15, v16, v17, v18, v19)
    let v34 =
        case v1  {
            Uh22Cons(v28, v29, v30, v31) -> v31
            Uh22Nil -> Uh22Nil
        }
    let v36 = method184(v34, Uh27Nil)
    let v38 = method185(v20, v21, v22, v23, v24, v25, v26, v27, v36, Uh27Nil)
    let v39 = v3 <= 0
    let #(v61, v62, v63, v64, v65, v66, v67, v68) =
        case v39 {
            True -> #(v20, v21, v22, v23, v24, v25, v26, v27)
            False -> {
                let v41 = method187(v38, 0)
                let v42 = spiral_wrap_signed(v3 + 1, 32)
                let v43 = v41 / v42
                let v44 = v43 < 1
                let v45 =
                    case v44 {
                        True -> 1
                        False -> v43
                    }
                let #(_v48, v49) = method188(v45, v38, 0, Uh27Nil)
                let v51 = method189(v49, Uh27Nil)
                let v52 = taken_190(v3, v51)
                let #(v53, v54, v55, v56, v57, v58, v59, v60) = method191(v52, v20, v21, v22, v23, v24, v25, v26, v27)
                #(v53, v54, v55, v56, v57, v58, v59, v60)
            }
        }
    let v69 = v4 <= 0
    let #(v90, v91, v92, v93, v94, v95, v96, v97) =
        case v69 {
            True -> #(v61, v62, v63, v64, v65, v66, v67, v68)
            False -> {
                let v76 =
                    case v1  {
                        Uh22Cons(v70, v71, v72, v73) -> v73
                        Uh22Nil -> Uh22Nil
                    }
                let v78 = method184(v76, Uh27Nil)
                let v80 = method195(v61, v62, v63, v64, v65, v66, v67, v68, v1, v78, Uh27Nil)
                let v81 = taken_190(v4, v80)
                let #(v82, v83, v84, v85, v86, v87, v88, v89) = method200(v81, v61, v62, v63, v64, v65, v66, v67, v68)
                #(v82, v83, v84, v85, v86, v87, v88, v89)
            }
        }
    #(v90, v91, v92, v93, v94, v95, v96, v97)
}

pub fn method202(v0: Int, v1: Int, v2: Uh23, v3: Uh25, v4: Uh26, v5: Us26, v6: Uh27, v7: Uh27, v8: Uh25, v9: Uh23) -> Uh23 {
    case v8  {
        Uh25Cons(v10, v11, v12) -> {
            let v13 = method202(v0, v1, v2, v3, v4, v5, v6, v7, v12, v9)
            let v14 = method169(v10, v11, v2)
            let v25 =
                case v14  {
                    Us28None -> Uh23Nil
                    Us28Some(v15, v16, v17, v18, v19, v20) -> {
                        Uh23Cons(v15, v16, v17, v18, v19, v20, Uh23Nil)
                    }
                }
            method170(v25, v13)
        }
        Uh25Nil -> v9
    }
}

pub fn method205(v0: Int, v1: String, v2: Int) -> fn(String) -> String {
    closure24(#(v0, v1, v2))
}

pub fn closure24(capt: #(Int, String, Int)) -> fn(String) -> String {
    fn (v3) {
        let #(v0, v1, v2) = capt
        let v4 = v2 >= v0
        case v4 {
            True -> v3
            False -> {
                let v5 = spiral_wrap_signed(v2 + 1, 32)
                let v6 = method205(v0, v1, v5)
                let v7 = { v3 } <> { v1 }
                v6(v7)
            }
        }
    }
}

pub fn method206(v0: Uh24, v1: Uh3) -> Uh3 {
    case v0  {
        Uh24Cons(v2, v3, v4, v5) -> {
            let v6 = method206(v5, v1)
            let v7 = quoted_121(v2)
            Uh3Cons(v7, v6)
        }
        Uh24Nil -> v1
    }
}

pub fn method208(v0: Int, v1: Int) -> fn(String) -> String {
    closure25(#(v0, v1))
}

pub fn closure25(capt: #(Int, Int)) -> fn(String) -> String {
    fn (v2) {
        let #(v0, v1) = capt
        let v3 = v1 >= v0
        case v3 {
            True -> v2
            False -> {
                let v4 = spiral_wrap_signed(v1 + 1, 32)
                let v5 = method208(v0, v4)
                let v6 = { v2 } <> { " " }
                v5(v6)
            }
        }
    }
}

pub fn shared_layout_207(v0: Uh3, v1: String, v2: String, v3: Int) -> String {
    case v0  {
        Uh3Nil -> {
            let v4 = { v1 } <> { v2 }
            v4
        }
        _ -> {
            let v5 = v3 < 4
            case v5 {
                True -> {
                    let v6 = spiral_wrap_signed(v3 + 1, 32)
                    let v7 = spiral_wrap_signed(4 * v6, 32)
                    let v9 = method208(v7, 0)
                    let v10 = ""
                    let v11 = v9(v10)
                    let v12 = { "\n" } <> { v11 }
                    let v13 = { v1 } <> { v12 }
                    let v14 = { "," } <> { v12 }
                    let v15 = delimited_21(v14, v0)
                    let v16 = { v13 } <> { v15 }
                    let v17 = { v16 } <> { "\n" }
                    let v18 = spiral_wrap_signed(4 * v3, 32)
                    let v20 = method208(v18, 0)
                    let v21 = v20(v10)
                    let v22 = { v17 } <> { v21 }
                    let v23 = { v22 } <> { v2 }
                    v23
                }
                False -> {
                    let v25 = delimited_21(", ", v0)
                    let v26 = { v1 } <> { v25 }
                    let v27 = { v26 } <> { v2 }
                    v27
                }
            }
        }
    }
}

pub fn method209(v0: String, v1: Uh21, v2: Uh21) -> Uh21 {
    case v1  {
        Uh21Cons(v3, v4, v5) -> {
            let v6 = method209(v0, v5, v2)
            let v7 = v3 == v0
            case v7 {
                True -> Uh21Cons(v3, v4, v6)
                False -> v6
            }
        }
        Uh21Nil -> v2
    }
}

pub fn method210(v0: Uh21, v1: Uh3) -> Uh3 {
    case v0  {
        Uh21Cons(v2, v3, v4) -> {
            let v5 = method210(v4, v1)
            method18(v3, v5)
        }
        Uh21Nil -> v1
    }
}

pub fn method211(v0: String, v1: Uh23, v2: Uh23) -> Uh23 {
    case v1  {
        Uh23Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method211(v0, v9, v2)
            let v14 =
                case v7  {
                    Us26None -> False
                    Us26Some(v11) -> {
                        v11 == v0
                    }
                }
            case v14 {
                True -> Uh23Cons(v3, v4, v5, v6, v7, v8, v10)
                False -> v10
            }
        }
        Uh23Nil -> v2
    }
}

pub fn method212(v0: Uh23, v1: Int) -> Int {
    case v0  {
        Uh23Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = spiral_wrap_signed(v1 + 1, 32)
            method212(v8, v9)
        }
        Uh23Nil -> v1
    }
}

pub fn method204(v0: Int, v1: Int, v2: Uh23, v3: Uh25, v4: Uh26, v5: Us26, v6: Uh27, v7: Uh27, v8: Uh20, v9: Uh21, v10: Int, v11: Int, v12: String, v13: String, v14: Int, v15: Int, v16: Us26, v17: Uh24, v18: Uh24, v19: Uh3) -> Uh3 {
    case v18  {
        Uh24Cons(v20, v21, v22, v23) -> {
            let v24 = method204(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v23, v19)
            let v29 =
                case v5  {
                    Us26None -> {
                        "null"
                    }
                    Us26Some(v25) -> quoted_121(v25)
                }
            let v31 = quoted_121("conversation_id")
            let v32 = { v31 } <> { ": " }
            let v33 = { v32 } <> { v29 }
            let v34 = spiral_wrap_signed(v11 + v21, 32)
            let v35 = v34 / 86400
            let v36 = spiral_wrap_signed(v10 + v35, 32)
            let v37 = spiral_wrap_signed(v36, 64)
            let v38 = spiral_wrap_signed(v37 * 86400000000, 64)
            let v39 = v38 / 86400000000
            let v40 = v38 % 86400000000
            let v41 = v40 != 0
            let v43 =
                case v41 {
                    True -> {
                        v38 < 0
                    }
                    False -> False
                }
            let v45 =
                case v43 {
                    True -> {
                        spiral_wrap_signed(v39 - 1, 64)
                    }
                    False -> v39
                }
            let v46 = spiral_wrap_signed(v45 + 719468, 64)
            let v47 = v46 / 146097
            let v48 = v46 % 146097
            let v49 = v48 != 0
            let v51 =
                case v49 {
                    True -> {
                        v46 < 0
                    }
                    False -> False
                }
            let v53 =
                case v51 {
                    True -> {
                        spiral_wrap_signed(v47 - 1, 64)
                    }
                    False -> v47
                }
            let v54 = spiral_wrap_signed(v53 * 146097, 64)
            let v55 = spiral_wrap_signed(v46 - v54, 64)
            let v56 = v55 / 1460
            let v57 = spiral_wrap_signed(v55 - v56, 64)
            let v58 = v55 / 36524
            let v59 = spiral_wrap_signed(v57 + v58, 64)
            let v60 = v55 / 146096
            let v61 = spiral_wrap_signed(v59 - v60, 64)
            let v62 = v61 / 365
            let v63 = spiral_wrap_signed(365 * v62, 64)
            let v64 = v62 / 4
            let v65 = spiral_wrap_signed(v63 + v64, 64)
            let v66 = v62 / 100
            let v67 = spiral_wrap_signed(v65 - v66, 64)
            let v68 = spiral_wrap_signed(v55 - v67, 64)
            let v69 = spiral_wrap_signed(5 * v68, 64)
            let v70 = spiral_wrap_signed(v69 + 2, 64)
            let v71 = v70 / 153
            let v72 = v71 < 10
            let v75 =
                case v72 {
                    True -> {
                        spiral_wrap_signed(v71 + 3, 64)
                    }
                    False -> {
                        spiral_wrap_signed(v71 - 9, 64)
                    }
                }
            let v76 = spiral_wrap_signed(153 * v71, 64)
            let v77 = spiral_wrap_signed(v76 + 2, 64)
            let v78 = v77 / 5
            let v79 = spiral_wrap_signed(v68 - v78, 64)
            let v80 = spiral_wrap_signed(v79 + 1, 64)
            let v81 = spiral_wrap_signed(v53 * 400, 64)
            let v82 = spiral_wrap_signed(v62 + v81, 64)
            let v83 = v75 <= 2
            let v84 =
                case v83 {
                    True -> 1
                    False -> 0
                }
            let v85 = spiral_wrap_signed(v82 + v84, 64)
            let v86 = spiral_wrap_signed(v45 * 86400000000, 64)
            let v87 = spiral_wrap_signed(v38 - v86, 64)
            let v88 = v87 / 1000000
            let _v89 = v88 / 3600
            let v90 = v88 % 3600
            let _v91 = v90 / 60
            let _v92 = v88 % 60
            let _v93 = v87 % 1000000
            let v94 = spiral_wrap_signed(v85, 32)
            let v95 = spiral_wrap_signed(v75, 32)
            let v96 = spiral_wrap_signed(v80, 32)
            let v97 = int.to_string(v94)
            let v98 = "0"
            let v99 = spiral_string_length(v97)
            let v100 = spiral_wrap_signed(4 - v99, 32)
            let v102 = method205(v100, v98, 0)
            let v103 = ""
            let v104 = v102(v103)
            let v105 = { v104 } <> { v97 }
            let v106 = { v105 } <> { "-" }
            let v107 = int.to_string(v95)
            let v108 = spiral_string_length(v107)
            let v109 = spiral_wrap_signed(2 - v108, 32)
            let v111 = method205(v109, v98, 0)
            let v112 = v111(v103)
            let v113 = { v112 } <> { v107 }
            let v114 = { v106 } <> { v113 }
            let v115 = { v114 } <> { "-" }
            let v116 = int.to_string(v96)
            let v117 = spiral_string_length(v116)
            let v118 = spiral_wrap_signed(2 - v117, 32)
            let v120 = method205(v118, v98, 0)
            let v121 = v120(v103)
            let v122 = { v121 } <> { v116 }
            let v123 = { v115 } <> { v122 }
            let v124 = { v123 } <> { "T" }
            let v125 = v34 % 86400
            let v126 = v125 / 3600
            let v127 = int.to_string(v126)
            let v128 = spiral_string_length(v127)
            let v129 = spiral_wrap_signed(2 - v128, 32)
            let v131 = method205(v129, v98, 0)
            let v132 = v131(v103)
            let v133 = { v132 } <> { v127 }
            let v134 = { v133 } <> { ":" }
            let v135 = v125 / 60
            let v136 = v135 % 60
            let v137 = int.to_string(v136)
            let v138 = spiral_string_length(v137)
            let v139 = spiral_wrap_signed(2 - v138, 32)
            let v141 = method205(v139, v98, 0)
            let v142 = v141(v103)
            let v143 = { v142 } <> { v137 }
            let v144 = { v134 } <> { v143 }
            let v145 = { v144 } <> { ":" }
            let v146 = v125 % 60
            let v147 = int.to_string(v146)
            let v148 = spiral_string_length(v147)
            let v149 = spiral_wrap_signed(2 - v148, 32)
            let v151 = method205(v149, v98, 0)
            let v152 = v151(v103)
            let v153 = { v152 } <> { v147 }
            let v154 = { v145 } <> { v153 }
            let v155 = { v124 } <> { v154 }
            let v156 = { v155 } <> { ".000Z" }
            let v157 = quoted_121(v156)
            let v159 = quoted_121("created_at")
            let v160 = { v159 } <> { ": " }
            let v161 = { v160 } <> { v157 }
            let v163 = method206(v17, Uh3Nil)
            let v164 = "["
            let v165 = "]"
            let v167 = shared_layout_207(v163, v164, v165, 5)
            let v169 = quoted_121("edit_history")
            let v170 = { v169 } <> { ": " }
            let v171 = { v170 } <> { v167 }
            let v172 = quoted_121(v20)
            let v173 = "id"
            let v174 = quoted_121(v173)
            let v175 = { v174 } <> { ": " }
            let v176 = { v175 } <> { v172 }
            let v177 = v14 != 1
            let v184 =
                case v177 {
                    True -> 0
                    False -> {
                        let v179 = method209(v13, v9, Uh21Nil)
                        let v181 = method210(v179, Uh3Nil)
                        method20(v181, 0)
                    }
                }
            let v185 = int.to_string(v184)
            let v187 = quoted_121("like_count")
            let v188 = { v187 } <> { ": " }
            let v189 = { v188 } <> { v185 }
            let v191 = method211(v12, v2, Uh23Nil)
            let v193 = method212(v191, 0)
            let v194 = int.to_string(v193)
            let v196 = quoted_121("reply_count")
            let v197 = { v196 } <> { ": " }
            let v198 = { v197 } <> { v194 }
            let v200 = Uh3Cons(v198, Uh3Nil)
            let v201 = Uh3Cons(v189, v200)
            let v202 = "{"
            let v203 = "}"
            let v205 = shared_layout_207(v201, v202, v203, 5)
            let v207 = quoted_121("metrics")
            let v208 = { v207 } <> { ": " }
            let v209 = { v208 } <> { v205 }
            let v232 =
                case v16  {
                    Us26None -> {
                        "[]"
                    }
                    Us26Some(v210) -> {
                        let v211 = quoted_121(v210)
                        let v212 = quoted_121(v173)
                        let v213 = { v212 } <> { ": " }
                        let v214 = { v213 } <> { v211 }
                        let v216 = quoted_121("replied_to")
                        let v218 = quoted_121("type")
                        let v219 = { v218 } <> { ": " }
                        let v220 = { v219 } <> { v216 }
                        let v222 = Uh3Cons(v220, Uh3Nil)
                        let v223 = Uh3Cons(v214, v222)
                        let v225 = shared_layout_207(v223, v202, v203, 6)
                        let v227 = Uh3Cons(v225, Uh3Nil)
                        shared_layout_207(v227, v164, v165, 5)
                    }
                }
            let v234 = quoted_121("refs")
            let v235 = { v234 } <> { ": " }
            let v236 = { v235 } <> { v232 }
            let v237 = quoted_121(v22)
            let v239 = quoted_121("text")
            let v240 = { v239 } <> { ": " }
            let v241 = { v240 } <> { v237 }
            let v243 = Uh3Cons(v241, Uh3Nil)
            let v244 = Uh3Cons(v236, v243)
            let v245 = Uh3Cons(v209, v244)
            let v246 = Uh3Cons(v176, v245)
            let v247 = Uh3Cons(v171, v246)
            let v248 = Uh3Cons(v161, v247)
            let v249 = Uh3Cons(v33, v248)
            let v251 = shared_layout_207(v249, v202, v203, 4)
            Uh3Cons(v251, v24)
        }
        Uh24Nil -> v19
    }
}

pub fn method203(v0: Int, v1: Int, v2: Uh23, v3: Uh25, v4: Uh26, v5: Us26, v6: Uh27, v7: Uh27, v8: Uh20, v9: Uh21, v10: Int, v11: Int, v12: Uh23, v13: Uh3) -> Uh3 {
    case v12  {
        Uh23Cons(v14, v15, v16, v17, v18, v19, v20) -> {
            let v21 = method203(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v20, v13)
            let v23 = method204(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v14, v15, v16, v17, v18, v19, v19, Uh3Nil)
            method18(v23, v21)
        }
        Uh23Nil -> v13
    }
}

pub fn method215(v0: Uh23, v1: Uh28) -> Uh28 {
    case v0  {
        Uh23Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method215(v8, v1)
            Uh28Cons(v2, v9)
        }
        Uh23Nil -> v1
    }
}

pub fn closure26(capt: #(String)) -> fn(String) -> Bool {
    fn (v1) {
        let #(v0) = capt
        v0 == v1
    }
}

pub fn method216(v0: String) -> fn(String) -> Bool {
    closure26(#(v0))
}
