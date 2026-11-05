import gleam/int
import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Uh13, type Us25, type Uh21, type Us26, type Uh23, type Uh22, type Uh24, type Uh25, type Uh26, type Us27, type Us28, Uh13Cons, Uh13Nil, Uh21Cons, Uh21Nil, Uh22Cons, Uh22Nil, Uh23Cons, Uh23Nil, Uh24Cons, Uh24Nil, Uh25Cons, Uh25Nil, Uh26Cons, Uh26Nil, Uh3Cons, Uh3Nil, Us25None, Us25Some, Us26None, Us26Some, Us27None, Us27Some, Us28None, Us28Some}
import xsim_frames/part1.{method4, spiral_string_length, spiral_string_slice, spiral_wrap_signed}
import xsim_frames/part2.{method20}

pub fn closure21(capt: Nil) -> fn(Int) -> Bool {
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

pub fn method164() -> fn(Int) -> Bool {
    closure21(Nil)
}

pub fn method165(v0: fn(Int) -> Bool, v1: Uh13) -> Bool {
    case v1  {
        Uh13Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method164()
                    method165(v5, v3)
                }
            }
        }
        Uh13Nil -> False
    }
}

pub fn blank_tail_length_163(v0: Uh3, v1: Int) -> Int {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = string.to_utf_codepoints(v2)
            let v5 = v4 |> list.reverse
            let v6 = Uh13Nil
            let listm_fold = v5 |> list.fold (v6, fn (acc, x) {
            let v7 = x
            let v8 = string.utf_codepoint_to_int(v7)
            let v9 = acc
            let v10 = Uh13Cons(v8, v9)
            v10
            })
            let v11 = listm_fold
            let v12 = method164()
            let v13 = method165(v12, v11)
            let v14 = v13 == False
            case v14 {
                True -> {
                    let v15 = spiral_string_length(v2)
                    let v16 = spiral_wrap_signed(v1 + v15, 32)
                    blank_tail_length_163(v3, v16)
                }
                False -> v1
            }
        }
        _ -> v1
    }
}

pub fn method166(v0: String, v1: Uh25) -> Us27 {
    case v1  {
        Uh25Cons(v3, v4, v5) -> {
            let v6 = v3 == v0
            case v6 {
                True -> Us27Some(v3, v4)
                False -> method166(v0, v5)
            }
        }
        Uh25Nil -> Us27None
    }
}

pub fn method167(v0: String, v1: Int, v2: Uh22) -> Us28 {
    case v2  {
        Uh22Cons(v4, v5, v6, v7, v8, v9, v10) -> {
            let v11 = v5 == v0
            let v13 =
                case v11 {
                    True -> {
                        let v12 = v6 == v1
                        v12
                    }
                    False -> False
                }
            case v13 {
                True -> Us28Some(v4, v5, v6, v7, v8, v9)
                False -> method167(v0, v1, v10)
            }
        }
        Uh22Nil -> Us28None
    }
}

pub fn method168(v0: Uh22, v1: Uh22) -> Uh22 {
    case v0  {
        Uh22Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method168(v8, v1)
            Uh22Cons(v2, v3, v4, v5, v6, v7, v9)
        }
        Uh22Nil -> v1
    }
}

pub fn method169(v0: Uh24, v1: Uh24) -> Uh24 {
    case v0  {
        Uh24Cons(v2, v3, v4) -> {
            let v5 = method169(v4, v1)
            Uh24Cons(v2, v3, v5)
        }
        Uh24Nil -> v1
    }
}

pub fn method170(v0: String, v1: Uh25, v2: Uh25) -> Uh25 {
    case v1  {
        Uh25Cons(v3, v4, v5) -> {
            let v6 = method170(v0, v5, v2)
            let v7 = v3 == v0
            let v8 = v7 == False
            case v8 {
                True -> Uh25Cons(v3, v4, v6)
                False -> v6
            }
        }
        Uh25Nil -> v2
    }
}

pub fn method162(v0: String, v1: Us25, v2: Uh3, v3: Int, v4: Uh3, v5: Int, v6: Int, v7: Uh22, v8: Uh24, v9: Uh25, v10: Us26, v11: Uh26, v12: Uh26, v13: Int) -> #(Int, Int, Uh22, Uh24, Uh25, Us26, Uh26, Uh26, Int) {
    case v4  {
        Uh3Cons(v14, v15) -> {
            let v16 = spiral_wrap_signed(v5 + 1, 32)
            let v17 = int.to_string(v16)
            let v18 = spiral_wrap_signed(v6 + 1, 32)
            let v19 = " "
            let v20 = v0 <> v19 
            let v21 = int.to_string(v13)
            let v22 = v20 <> v21 
            let v23 = "/"
            let v24 = v22 <> v23 
            let v25 = int.to_string(v3)
            let v26 = v24 <> v25 
            let v27 = "\n"
            let v28 = v26 <> v27 
            let v29 = v28 <> v14 
            let v30 = spiral_string_length(v29)
            let v31 = string.to_graphemes(v29)
            let v32 = v31 |> list.reverse
            let v33 = Uh3Nil
            let listm_fold = v32 |> list.fold (v33, fn (acc, x) {
            let v34 = x
            let v35 = acc
            let v36 = Uh3Cons(v34, v35)
            v36
            })
            let v37 = listm_fold
            let v38 = Uh3Nil
            let v39 = method4(v37, v38)
            let v40 = 0
            let v41 = blank_tail_length_163(v39, v40)
            let v42 = spiral_wrap_signed(v30 - v41, 32)
            let v43 = spiral_wrap_signed(v42 - 1, 32)
            let v44 = spiral_string_slice(v29, 0, v43)
            let v45 = v13 == 1
            let v69 =
                case v45 {
                    True -> {
                        case v1  {
                            Us25None -> Us26None
                            Us25Some(v46) -> {
                                let v47 = method166(v46, v9)
                                case v47  {
                                    Us27None -> Us26None
                                    Us27Some(v48, v49) -> Us26Some(v49)
                                }
                            }
                        }
                    }
                    False -> {
                        let v57 = spiral_wrap_signed(v13 - 1, 32)
                        let v58 = method167(v0, v57, v7)
                        case v58  {
                            Us28None -> Us26None
                            Us28Some(v59, v60, v61, v62, v63, v64) -> Us26Some(v59)
                        }
                    }
                }
            let v70 = Uh23Nil
            let v71 = Uh23Cons(v17, v18, v44, v70)
            let v72 = Uh22Nil
            let v73 = Uh22Cons(v17, v0, v13, v3, v69, v71, v72)
            let v74 = method168(v7, v73)
            let v75 = Uh24Nil
            let v76 = Uh24Cons(v0, v13, v75)
            let v77 = method169(v8, v76)
            let #(v88, v89, v90, v91, v92, v93, v94, v95) =
                case v10  {
                    Us26Some(v78) -> #(v16, v18, v74, v77, v9, v10, v11, v12)
                    _ -> {
                        let #(v80, v81, v82, v83, v84, v85, v86, v87) =
                            case v10  {
                                Us26None -> {
                                    let v79 = Us26Some(v17)
                                    #(v16, v18, v74, v77, v9, v79, v11, v12)
                                }
                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                            }
                        #(v80, v81, v82, v83, v84, v85, v86, v87)
                    }
                }
            let v96 = Uh25Nil
            let v97 = method170(v0, v92, v96)
            let v98 = spiral_wrap_signed(v13 + 1, 32)
            let v99 = Uh25Cons(v0, v17, v97)
            method162(v0, v1, v2, v3, v15, v88, v89, v90, v91, v99, v93, v94, v95, v98)
        }
        Uh3Nil -> #(v5, v6, v7, v8, v9, v10, v11, v12, v13)
    }
}

pub fn method161(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: Uh21, v2: Int, v3: Int, v4: Uh22, v5: Uh24, v6: Uh25, v7: Us26, v8: Uh26, v9: Uh26) -> #(Int, Int, Uh22, Uh24, Uh25, Us26, Uh26, Uh26) {
    let #(v50, v51, v52, v53, v54, v55, v56, v57) =
        case v1  {
            Uh21Cons(v10, v11, v12, v13) -> {
                let v18 =
                    case v12  {
                        Uh3Cons(v14, v15) -> v14
                        Uh3Nil -> {
                            let v16 = ""
                            v16
                        }
                    }
                let v19 = v0(v10)
                let v20 = v19(280)
                let v21 = v20(v18)
                let v22 = 0
                let v23 = method20(v21, v22)
                let v24 = 1
                let #(v25, v26, v27, v28, v29, v30, v31, v32, _v33) = method162(v10, v11, v12, v23, v21, v2, v3, v4, v5, v6, v7, v8, v9, v24)
                method161(v0, v13, v25, v26, v27, v28, v29, v30, v31, v32)
            }
            _ -> {
                let #(v42, v43, v44, v45, v46, v47, v48, v49) =
                    case v1  {
                        Uh21Nil -> #(v2, v3, v4, v5, v6, v7, v8, v9)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v42, v43, v44, v45, v46, v47, v48, v49)
            }
        }
    #(v50, v51, v52, v53, v54, v55, v56, v57)
}

pub fn method173(v0: String, v1: Uh22, v2: Uh22) -> Uh22 {
    case v1  {
        Uh22Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method173(v0, v9, v2)
            let v11 = v4 == v0
            case v11 {
                True -> Uh22Cons(v3, v4, v5, v6, v7, v8, v10)
                False -> v10
            }
        }
        Uh22Nil -> v2
    }
}

pub fn method174(v0: Uh22, v1: Uh13) -> Uh13 {
    case v0  {
        Uh22Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method174(v8, v1)
            Uh13Cons(v4, v9)
        }
        Uh22Nil -> v1
    }
}

pub fn method175(v0: Int, v1: Uh13, v2: Uh13) -> Uh13 {
    case v1  {
        Uh13Cons(v3, v4) -> {
            let v5 = method175(v0, v4, v2)
            let v6 = v3 > v0
            case v6 {
                True -> Uh13Cons(v3, v5)
                False -> v5
            }
        }
        Uh13Nil -> v2
    }
}

pub fn method177(v0: String, v1: Int, v2: Uh22, v3: Uh22) -> Uh22 {
    case v2  {
        Uh22Cons(v4, v5, v6, v7, v8, v9, v10) -> {
            let v11 = method177(v0, v1, v10, v3)
            let v12 = v5 == v0
            let v13 = v12 == False
            let v15 =
                case v13 {
                    True -> True
                    False -> {
                        let v14 = v6 != v1
                        v14
                    }
                }
            case v15 {
                True -> Uh22Cons(v4, v5, v6, v7, v8, v9, v11)
                False -> v11
            }
        }
        Uh22Nil -> v3
    }
}

pub fn method178(v0: String, v1: Int, v2: Uh24, v3: Uh24) -> Uh24 {
    case v2  {
        Uh24Cons(v4, v5, v6) -> {
            let v7 = method178(v0, v1, v6, v3)
            let v8 = v4 == v0
            let v9 = v8 == False
            let v11 =
                case v9 {
                    True -> True
                    False -> {
                        let v10 = v5 != v1
                        v10
                    }
                }
            case v11 {
                True -> Uh24Cons(v4, v5, v7)
                False -> v7
            }
        }
        Uh24Nil -> v3
    }
}

pub fn method176(v0: String, v1: Uh13, v2: Int, v3: Int, v4: Uh22, v5: Uh24, v6: Uh25, v7: Us26, v8: Uh26, v9: Uh26) -> #(Int, Int, Uh22, Uh24, Uh25, Us26, Uh26, Uh26) {
    let #(v32, v33, v34, v35, v36, v37, v38, v39) =
        case v1  {
            Uh13Cons(v10, v11) -> {
                let v12 = Uh22Nil
                let v13 = method177(v0, v10, v4, v12)
                let v14 = Uh24Nil
                let v15 = method178(v0, v10, v5, v14)
                method176(v0, v11, v2, v3, v13, v15, v6, v7, v8, v9)
            }
            _ -> {
                let #(v24, v25, v26, v27, v28, v29, v30, v31) =
                    case v1  {
                        Uh13Nil -> #(v2, v3, v4, v5, v6, v7, v8, v9)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v24, v25, v26, v27, v28, v29, v30, v31)
            }
        }
    #(v32, v33, v34, v35, v36, v37, v38, v39)
}

pub fn method181(v0: Uh23, v1: Uh23) -> Uh23 {
    case v0  {
        Uh23Cons(v2, v3, v4, v5) -> {
            let v6 = method181(v5, v1)
            Uh23Cons(v2, v3, v4, v6)
        }
        Uh23Nil -> v1
    }
}

pub fn method180(v0: String, v1: Int, v2: String, v3: Int, v4: String, v5: Int, v6: Uh22, v7: Uh22) -> Uh22 {
    case v6  {
        Uh22Cons(v8, v9, v10, v11, v12, v13, v14) -> {
            let v15 = method180(v0, v1, v2, v3, v4, v5, v14, v7)
            let v16 = v9 == v0
            let v18 =
                case v16 {
                    True -> {
                        let v17 = v10 == v1
                        v17
                    }
                    False -> False
                }
            let #(v22, v23, v24, v25, v26, v27) =
                case v18 {
                    True -> {
                        let v19 = Uh23Nil
                        let v20 = Uh23Cons(v2, v3, v4, v19)
                        let v21 = method181(v13, v20)
                        #(v8, v9, v10, v5, v12, v21)
                    }
                    False -> #(v8, v9, v10, v11, v12, v13)
                }
            Uh22Cons(v22, v23, v24, v25, v26, v27, v15)
        }
        Uh22Nil -> v7
    }
}

pub fn method179(v0: String, v1: Us25, v2: Uh3, v3: Int, v4: Uh3, v5: Int, v6: Int, v7: Uh22, v8: Uh24, v9: Uh25, v10: Us26, v11: Uh26, v12: Uh26, v13: Int) -> #(Int, Int, Uh22, Uh24, Uh25, Us26, Uh26, Uh26, Int) {
    case v4  {
        Uh3Cons(v14, v15) -> {
            let v16 = spiral_wrap_signed(v5 + 1, 32)
            let v17 = int.to_string(v16)
            let v18 = spiral_wrap_signed(v6 + 1, 32)
            let v19 = " "
            let v20 = v0 <> v19 
            let v21 = int.to_string(v13)
            let v22 = v20 <> v21 
            let v23 = "/"
            let v24 = v22 <> v23 
            let v25 = int.to_string(v3)
            let v26 = v24 <> v25 
            let v27 = "\n"
            let v28 = v26 <> v27 
            let v29 = v28 <> v14 
            let v30 = spiral_string_length(v29)
            let v31 = string.to_graphemes(v29)
            let v32 = v31 |> list.reverse
            let v33 = Uh3Nil
            let listm_fold = v32 |> list.fold (v33, fn (acc, x) {
            let v34 = x
            let v35 = acc
            let v36 = Uh3Cons(v34, v35)
            v36
            })
            let v37 = listm_fold
            let v38 = Uh3Nil
            let v39 = method4(v37, v38)
            let v40 = 0
            let v41 = blank_tail_length_163(v39, v40)
            let v42 = spiral_wrap_signed(v30 - v41, 32)
            let v43 = spiral_wrap_signed(v42 - 1, 32)
            let v44 = spiral_string_slice(v29, 0, v43)
            let v45 = method167(v0, v13, v7)
            let #(v95, v96, v97, v98, v99, v100, v101, v102) =
                case v45  {
                    Us28Some(v46, v47, v48, v49, v50, v51) -> {
                        let v52 = Uh22Nil
                        let v53 = method180(v0, v13, v17, v18, v44, v3, v7, v52)
                        #(v16, v18, v53, v8, v9, v10, v11, v12)
                    }
                    _ -> {
                        let #(v87, v88, v89, v90, v91, v92, v93, v94) =
                            case v45  {
                                Us28None -> {
                                    let v54 = v13 == 1
                                    let v78 =
                                        case v54 {
                                            True -> {
                                                case v1  {
                                                    Us25None -> Us26None
                                                    Us25Some(v55) -> {
                                                        let v56 = method166(v55, v9)
                                                        case v56  {
                                                            Us27None -> Us26None
                                                            Us27Some(v57, v58) -> Us26Some(v58)
                                                        }
                                                    }
                                                }
                                            }
                                            False -> {
                                                let v66 = spiral_wrap_signed(v13 - 1, 32)
                                                let v67 = method167(v0, v66, v7)
                                                case v67  {
                                                    Us28None -> Us26None
                                                    Us28Some(v68, v69, v70, v71, v72, v73) -> Us26Some(v68)
                                                }
                                            }
                                        }
                                    let v79 = Uh23Nil
                                    let v80 = Uh23Cons(v17, v18, v44, v79)
                                    let v81 = Uh22Nil
                                    let v82 = Uh22Cons(v17, v0, v13, v3, v78, v80, v81)
                                    let v83 = method168(v7, v82)
                                    let v84 = Uh24Nil
                                    let v85 = Uh24Cons(v0, v13, v84)
                                    let v86 = method169(v8, v85)
                                    #(v16, v18, v83, v86, v9, v10, v11, v12)
                                }
                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                            }
                        #(v87, v88, v89, v90, v91, v92, v93, v94)
                    }
                }
            let v103 = spiral_wrap_signed(v13 + 1, 32)
            method179(v0, v1, v2, v3, v15, v95, v96, v97, v98, v99, v100, v101, v102, v103)
        }
        Uh3Nil -> #(v5, v6, v7, v8, v9, v10, v11, v12, v13)
    }
}

pub fn method172(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: String, v2: Us25, v3: Uh3, v4: Uh3, v5: Int, v6: Int, v7: Uh22, v8: Uh24, v9: Uh25, v10: Us26, v11: Uh26, v12: Uh26) -> #(Int, Int, Uh22, Uh24, Uh25, Us26, Uh26, Uh26) {
    let #(v60, v61, v62, v63, v64, v65, v66, v67) =
        case v4  {
            Uh3Cons(v13, v14) -> {
                let v15 = v0(v1)
                let v16 = v15(280)
                let v17 = v16(v13)
                let v18 = 0
                let v19 = method20(v17, v18)
                let v20 = Uh22Nil
                let v21 = method173(v1, v7, v20)
                let v22 = Uh13Nil
                let v23 = method174(v21, v22)
                let v24 = Uh13Nil
                let v25 = method175(v19, v23, v24)
                let #(v26, v27, v28, v29, v30, v31, v32, v33) = method176(v1, v25, v5, v6, v7, v8, v9, v10, v11, v12)
                let v34 = 1
                let #(v35, v36, v37, v38, v39, v40, v41, v42, _v43) = method179(v1, v2, v3, v19, v17, v26, v27, v28, v29, v30, v31, v32, v33, v34)
                method172(v0, v1, v2, v3, v14, v35, v36, v37, v38, v39, v40, v41, v42)
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

pub fn method171(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: Uh21, v2: Int, v3: Int, v4: Uh22, v5: Uh24, v6: Uh25, v7: Us26, v8: Uh26, v9: Uh26) -> #(Int, Int, Uh22, Uh24, Uh25, Us26, Uh26, Uh26) {
    let #(v43, v44, v45, v46, v47, v48, v49, v50) =
        case v1  {
            Uh21Cons(v10, v11, v12, v13) -> {
                let v18 =
                    case v12  {
                        Uh3Cons(v14, v15) -> v15
                        Uh3Nil -> Uh3Nil
                    }
                let #(v19, v20, v21, v22, v23, v24, v25, v26) = method172(v0, v10, v11, v12, v18, v2, v3, v4, v5, v6, v7, v8, v9)
                method171(v0, v13, v19, v20, v21, v22, v23, v24, v25, v26)
            }
            _ -> {
                let #(v35, v36, v37, v38, v39, v40, v41, v42) =
                    case v1  {
                        Uh21Nil -> #(v2, v3, v4, v5, v6, v7, v8, v9)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v35, v36, v37, v38, v39, v40, v41, v42)
            }
        }
    #(v43, v44, v45, v46, v47, v48, v49, v50)
}

pub fn method182(v0: Uh21, v1: Uh26) -> Uh26 {
    case v0  {
        Uh21Cons(v2, v3, v4, v5) -> {
            let v6 = method182(v5, v1)
            Uh26Cons(v2, v6)
        }
        Uh21Nil -> v1
    }
}

pub fn method184(v0: String, v1: Uh22) -> Us28 {
    case v1  {
        Uh22Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = v4 == v0
            let v12 =
                case v10 {
                    True -> {
                        let v11 = v5 == 2
                        v11
                    }
                    False -> False
                }
            case v12 {
                True -> Us28Some(v3, v4, v5, v6, v7, v8)
                False -> method184(v0, v9)
            }
        }
        Uh22Nil -> Us28None
    }
}

pub fn method183(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh26, v9: Uh26) -> Uh26 {
    case v8  {
        Uh26Cons(v10, v11) -> {
            let v12 = method183(v0, v1, v2, v3, v4, v5, v6, v7, v11, v9)
            let v13 = method184(v10, v2)
            let v21 =
                case v13  {
                    Us28None -> False
                    Us28Some(v14, v15, v16, v17, v18, v19) -> True
                }
            case v21 {
                True -> Uh26Cons(v10, v12)
                False -> v12
            }
        }
        Uh26Nil -> v9
    }
}

pub fn method185(v0: Uh26, v1: Int) -> Int {
    case v0  {
        Uh26Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method185(v3, v4)
        }
        Uh26Nil -> v1
    }
}

pub fn method186(v0: Int, v1: Uh26, v2: Int, v3: Uh26) -> #(Int, Uh26) {
    case v1  {
        Uh26Cons(v4, v5) -> {
            let v6 = spiral_wrap_signed(v2 + 1, 32)
            let v7 = spiral_wrap_signed(v0 - 1, 32)
            let v8 = v2 >= v7
            let v13 =
                case v8 {
                    True -> {
                        let v9 = spiral_wrap_signed(v2 - v0, 32)
                        let v10 = spiral_wrap_signed(v9 + 1, 32)
                        let v11 = v10 % v0
                        let v12 = v11 == 0
                        v12
                    }
                    False -> False
                }
            let v15 =
                case v13 {
                    True -> Uh26Cons(v4, v3)
                    False -> v3
                }
            method186(v0, v5, v6, v15)
        }
        Uh26Nil -> #(v2, v3)
    }
}

pub fn method187(v0: Uh26, v1: Uh26) -> Uh26 {
    case v0  {
        Uh26Cons(v2, v3) -> {
            let v4 = Uh26Cons(v2, v1)
            method187(v3, v4)
        }
        Uh26Nil -> v1
    }
}

pub fn taken_188(v0: Int, v1: Uh26) -> Uh26 {
    case v1  {
        Uh26Cons(v2, v3) -> {
            let v4 = v0 > 0
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v0 - 1, 32)
                    let v6 = taken_188(v5, v3)
                    Uh26Cons(v2, v6)
                }
                False -> Uh26Nil
            }
        }
        _ -> Uh26Nil
    }
}

pub fn method190(v0: String, v1: Uh22, v2: Uh22) -> Uh22 {
    case v1  {
        Uh22Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method190(v0, v9, v2)
            let v11 = v4 == v0
            let v12 = v11 == False
            let v14 =
                case v12 {
                    True -> True
                    False -> {
                        let v13 = v5 != 2
                        v13
                    }
                }
            case v14 {
                True -> Uh22Cons(v3, v4, v5, v6, v7, v8, v10)
                False -> v10
            }
        }
        Uh22Nil -> v2
    }
}

pub fn method191(v0: String, v1: Uh24, v2: Uh24) -> Uh24 {
    case v1  {
        Uh24Cons(v3, v4, v5) -> {
            let v6 = method191(v0, v5, v2)
            let v7 = v3 == v0
            let v8 = v7 == False
            let v10 =
                case v8 {
                    True -> True
                    False -> {
                        let v9 = v4 != 2
                        v9
                    }
                }
            case v10 {
                True -> Uh24Cons(v3, v4, v6)
                False -> v6
            }
        }
        Uh24Nil -> v2
    }
}

pub fn method192(v0: Uh26, v1: Uh26) -> Uh26 {
    case v0  {
        Uh26Cons(v2, v3) -> {
            let v4 = method192(v3, v1)
            Uh26Cons(v2, v4)
        }
        Uh26Nil -> v1
    }
}

pub fn method189(v0: Uh26, v1: Int, v2: Int, v3: Uh22, v4: Uh24, v5: Uh25, v6: Us26, v7: Uh26, v8: Uh26) -> #(Int, Int, Uh22, Uh24, Uh25, Us26, Uh26, Uh26) {
    let #(v34, v35, v36, v37, v38, v39, v40, v41) =
        case v0  {
            Uh26Cons(v9, v10) -> {
                let v11 = Uh22Nil
                let v12 = method190(v9, v3, v11)
                let v13 = Uh24Nil
                let v14 = method191(v9, v4, v13)
                let v15 = Uh26Nil
                let v16 = Uh26Cons(v9, v15)
                let v17 = method192(v7, v16)
                method189(v10, v1, v2, v12, v14, v5, v6, v17, v8)
            }
            _ -> {
                let #(v26, v27, v28, v29, v30, v31, v32, v33) =
                    case v0  {
                        Uh26Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8)
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
                let v5 = v4 == v0
                v5
            }
        }
    }
}

pub fn method194(v0: String) -> fn(#(String, Us25, Uh3)) -> Bool {
    closure22(#(v0))
}

pub fn method195(v0: String, v1: fn(#(String, Us25, Uh3)) -> Bool, v2: Uh21) -> Bool {
    case v2  {
        Uh21Cons(v3, v4, v5, v6) -> {
            let v7 = v1(#(v3, v4, v5))
            case v7 {
                True -> True
                False -> {
                    let v8 = method194(v0)
                    method195(v0, v8, v6)
                }
            }
        }
        Uh21Nil -> False
    }
}

pub fn closure23(capt: #(String)) -> fn(String) -> Bool {
    fn (v1) {
        let #(v0) = capt
        let v2 = v0 == v1
        v2
    }
}

pub fn method196(v0: String) -> fn(String) -> Bool {
    closure23(#(v0))
}

pub fn method197(v0: String, v1: fn(String) -> Bool, v2: Uh26) -> Bool {
    case v2  {
        Uh26Cons(v3, v4) -> {
            let v5 = v1(v3)
            case v5 {
                True -> True
                False -> {
                    let v6 = method196(v0)
                    method197(v0, v6, v4)
                }
            }
        }
        Uh26Nil -> False
    }
}

pub fn method193(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh21, v9: Uh26, v10: Uh26) -> Uh26 {
    case v9  {
        Uh26Cons(v11, v12) -> {
            let v13 = method193(v0, v1, v2, v3, v4, v5, v6, v7, v8, v12, v10)
            let v14 = method194(v11)
            let v15 = method195(v11, v14, v8)
            let v19 =
                case v15 {
                    True -> {
                        let v16 = method196(v11)
                        let v17 = method197(v11, v16, v6)
                        let v18 = v17 == False
                        v18
                    }
                    False -> False
                }
            case v19 {
                True -> Uh26Cons(v11, v13)
                False -> v13
            }
        }
        Uh26Nil -> v10
    }
}

pub fn method199(v0: String, v1: Uh13, v2: Int, v3: Int, v4: Uh22, v5: Uh24, v6: Uh25, v7: Us26, v8: Uh26, v9: Uh26) -> #(Int, Int, Uh22, Uh24, Uh25, Us26, Uh26, Uh26) {
    let #(v32, v33, v34, v35, v36, v37, v38, v39) =
        case v1  {
            Uh13Cons(v10, v11) -> {
                let v12 = Uh22Nil
                let v13 = method177(v0, v10, v4, v12)
                let v14 = Uh24Nil
                let v15 = method178(v0, v10, v5, v14)
                method199(v0, v11, v2, v3, v13, v15, v6, v7, v8, v9)
            }
            _ -> {
                let #(v24, v25, v26, v27, v28, v29, v30, v31) =
                    case v1  {
                        Uh13Nil -> #(v2, v3, v4, v5, v6, v7, v8, v9)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v24, v25, v26, v27, v28, v29, v30, v31)
            }
        }
    #(v32, v33, v34, v35, v36, v37, v38, v39)
}
