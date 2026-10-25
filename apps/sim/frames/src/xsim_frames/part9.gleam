import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Uh13, type Us25, type Uh22, type Us26, type Uh24, type Uh23, type Uh25, type Uh26, type Uh27, type Us28, Uh13Cons, Uh13Nil, Uh22Cons, Uh22Nil, Uh23Cons, Uh23Nil, Uh24Cons, Uh24Nil, Uh25Cons, Uh25Nil, Uh26Cons, Uh26Nil, Uh27Cons, Uh27Nil, Uh3Cons, Uh3Nil, Us25None, Us25Some, Us26None, Us26Some, Us27None, Us27Some, Us28None, Us28Some}
import xsim_frames/part1.{spiral_wrap_signed}
import xsim_frames/part2.{concat_balanced_20, method17, method18}
import xsim_frames/part8.{method173, method174, method175, method176, method177, split_cell_138, without_blank_tail_172}

pub fn method171(v0: String, v1: Us25, v2: Uh3, v3: Int, v4: Uh3, v5: Int, v6: Int, v7: Uh23, v8: Uh25, v9: Uh26, v10: Us26, v11: Uh27, v12: Uh27, v13: Int) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27, Int) {
    case v4  {
        Uh3Cons(v14, v15) -> {
            let v16 = spiral_wrap_signed(v5 + 1, 32)
            let v17 = string.inspect(v16)
            let v18 = spiral_wrap_signed(v6 + 1, 32)
            let v19 = " "
            let v20 = v0 <> v19 
            let v21 = string.inspect(v13)
            let v22 = v20 <> v21 
            let v23 = "/"
            let v24 = v22 <> v23 
            let v25 = string.inspect(v3)
            let v26 = v24 <> v25 
            let v27 = "\n"
            let v28 = v26 <> v27 
            let v29 = v28 <> v14 
            let v30 = string.to_graphemes(v29)
            let v31 = v30 |> list.reverse
            let v32 = Uh3Nil
            let listm_fold = v31 |> list.fold (v32, fn (acc, x) {
            let v33 = x
            let v34 = acc
            let v35 = Uh3Cons(v33, v34)
            v35
            })
            let v36 = listm_fold
            let v37 = Uh3Nil
            let v38 = method18(v36, v37)
            let v39 = without_blank_tail_172(v38)
            let v40 = Uh3Nil
            let v41 = method18(v39, v40)
            let v42 = ""
            let v43 = concat_balanced_20(v42, v41)
            let v44 = v13 == 1
            let v68 =
                case v44 {
                    True -> {
                        case v1  {
                            Us25None -> {
                                Us26None
                            }
                            Us25Some(v45) -> {
                                let v46 = method173(v45, v9)
                                case v46  {
                                    Us27None -> {
                                        Us26None
                                    }
                                    Us27Some(v47, v48) -> {
                                        Us26Some(v48)
                                    }
                                }
                            }
                        }
                    }
                    False -> {
                        let v56 = spiral_wrap_signed(v13 - 1, 32)
                        let v57 = method174(v0, v56, v7)
                        case v57  {
                            Us28None -> {
                                Us26None
                            }
                            Us28Some(v58, v59, v60, v61, v62, v63) -> {
                                Us26Some(v58)
                            }
                        }
                    }
                }
            let v69 = Uh24Nil
            let v70 = Uh24Cons(v17, v18, v43, v69)
            let v71 = Uh23Nil
            let v72 = Uh23Cons(v17, v0, v13, v3, v68, v70, v71)
            let v73 = method175(v7, v72)
            let v74 = Uh25Nil
            let v75 = Uh25Cons(v0, v13, v74)
            let v76 = method176(v8, v75)
            let #(v87, v88, v89, v90, v91, v92, v93, v94) =
                case v10  {
                    Us26Some(v77) -> {
                        #(v16, v18, v73, v76, v9, v10, v11, v12)
                    }
                    _ -> {
                        let #(v79, v80, v81, v82, v83, v84, v85, v86) =
                            case v10  {
                                Us26None -> {
                                    let v78 = Us26Some(v17)
                                    #(v16, v18, v73, v76, v9, v78, v11, v12)
                                }
                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                            }
                        #(v79, v80, v81, v82, v83, v84, v85, v86)
                    }
                }
            let v95 = Uh26Nil
            let v96 = method177(v0, v91, v95)
            let v97 = spiral_wrap_signed(v13 + 1, 32)
            let v98 = Uh26Cons(v0, v17, v96)
            method171(v0, v1, v2, v3, v15, v87, v88, v89, v90, v98, v92, v93, v94, v97)
        }
        Uh3Nil -> {
            #(v5, v6, v7, v8, v9, v10, v11, v12, v13)
        }
    }
}

pub fn method170(v0: Uh22, v1: Int, v2: Int, v3: Uh23, v4: Uh25, v5: Uh26, v6: Us26, v7: Uh27, v8: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27) {
    let #(v48, v49, v50, v51, v52, v53, v54, v55) =
        case v0  {
            Uh22Cons(v9, v10, v11, v12) -> {
                let v17 =
                    case v11  {
                        Uh3Cons(v13, v14) -> {
                            v13
                        }
                        Uh3Nil -> {
                            let v15 = ""
                            v15
                        }
                    }
                let v18 = 280
                let v19 = split_cell_138(v9, v18, v17)
                let v20 = 0
                let v21 = method17(v19, v20)
                let v22 = 1
                let #(v23, v24, v25, v26, v27, v28, v29, v30, _v31) = method171(v9, v10, v11, v21, v19, v1, v2, v3, v4, v5, v6, v7, v8, v22)
                method170(v12, v23, v24, v25, v26, v27, v28, v29, v30)
            }
            _ -> {
                let #(v40, v41, v42, v43, v44, v45, v46, v47) =
                    case v0  {
                        Uh22Nil -> {
                            #(v1, v2, v3, v4, v5, v6, v7, v8)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v40, v41, v42, v43, v44, v45, v46, v47)
            }
        }
    #(v48, v49, v50, v51, v52, v53, v54, v55)
}

pub fn method180(v0: String, v1: Uh23, v2: Uh23) -> Uh23 {
    case v1  {
        Uh23Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method180(v0, v9, v2)
            let v11 = v4 == v0
            case v11 {
                True -> {
                    Uh23Cons(v3, v4, v5, v6, v7, v8, v10)
                }
                False -> {
                    v10
                }
            }
        }
        Uh23Nil -> {
            v2
        }
    }
}

pub fn method181(v0: Uh23, v1: Uh13) -> Uh13 {
    case v0  {
        Uh23Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method181(v8, v1)
            Uh13Cons(v4, v9)
        }
        Uh23Nil -> {
            v1
        }
    }
}

pub fn method182(v0: Int, v1: Uh13, v2: Uh13) -> Uh13 {
    case v1  {
        Uh13Cons(v3, v4) -> {
            let v5 = method182(v0, v4, v2)
            let v6 = v3 > v0
            case v6 {
                True -> {
                    Uh13Cons(v3, v5)
                }
                False -> {
                    v5
                }
            }
        }
        Uh13Nil -> {
            v2
        }
    }
}

pub fn method184(v0: String, v1: Int, v2: Uh23, v3: Uh23) -> Uh23 {
    case v2  {
        Uh23Cons(v4, v5, v6, v7, v8, v9, v10) -> {
            let v11 = method184(v0, v1, v10, v3)
            let v12 = v5 == v0
            let v13 = v12 == False
            let v15 =
                case v13 {
                    True -> {
                        True
                    }
                    False -> {
                        let v14 = v6 != v1
                        v14
                    }
                }
            case v15 {
                True -> {
                    Uh23Cons(v4, v5, v6, v7, v8, v9, v11)
                }
                False -> {
                    v11
                }
            }
        }
        Uh23Nil -> {
            v3
        }
    }
}

pub fn method185(v0: String, v1: Int, v2: Uh25, v3: Uh25) -> Uh25 {
    case v2  {
        Uh25Cons(v4, v5, v6) -> {
            let v7 = method185(v0, v1, v6, v3)
            let v8 = v4 == v0
            let v9 = v8 == False
            let v11 =
                case v9 {
                    True -> {
                        True
                    }
                    False -> {
                        let v10 = v5 != v1
                        v10
                    }
                }
            case v11 {
                True -> {
                    Uh25Cons(v4, v5, v7)
                }
                False -> {
                    v7
                }
            }
        }
        Uh25Nil -> {
            v3
        }
    }
}

pub fn method183(v0: String, v1: Uh13, v2: Int, v3: Int, v4: Uh23, v5: Uh25, v6: Uh26, v7: Us26, v8: Uh27, v9: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27) {
    let #(v32, v33, v34, v35, v36, v37, v38, v39) =
        case v1  {
            Uh13Cons(v10, v11) -> {
                let v12 = Uh23Nil
                let v13 = method184(v0, v10, v4, v12)
                let v14 = Uh25Nil
                let v15 = method185(v0, v10, v5, v14)
                method183(v0, v11, v2, v3, v13, v15, v6, v7, v8, v9)
            }
            _ -> {
                let #(v24, v25, v26, v27, v28, v29, v30, v31) =
                    case v1  {
                        Uh13Nil -> {
                            #(v2, v3, v4, v5, v6, v7, v8, v9)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v24, v25, v26, v27, v28, v29, v30, v31)
            }
        }
    #(v32, v33, v34, v35, v36, v37, v38, v39)
}

pub fn method188(v0: Uh24, v1: Uh24) -> Uh24 {
    case v0  {
        Uh24Cons(v2, v3, v4, v5) -> {
            let v6 = method188(v5, v1)
            Uh24Cons(v2, v3, v4, v6)
        }
        Uh24Nil -> {
            v1
        }
    }
}

pub fn method187(v0: String, v1: Int, v2: String, v3: Int, v4: String, v5: Int, v6: Uh23, v7: Uh23) -> Uh23 {
    case v6  {
        Uh23Cons(v8, v9, v10, v11, v12, v13, v14) -> {
            let v15 = method187(v0, v1, v2, v3, v4, v5, v14, v7)
            let v16 = v9 == v0
            let v18 =
                case v16 {
                    True -> {
                        let v17 = v10 == v1
                        v17
                    }
                    False -> {
                        False
                    }
                }
            let #(v22, v23, v24, v25, v26, v27) =
                case v18 {
                    True -> {
                        let v19 = Uh24Nil
                        let v20 = Uh24Cons(v2, v3, v4, v19)
                        let v21 = method188(v13, v20)
                        #(v8, v9, v10, v5, v12, v21)
                    }
                    False -> {
                        #(v8, v9, v10, v11, v12, v13)
                    }
                }
            Uh23Cons(v22, v23, v24, v25, v26, v27, v15)
        }
        Uh23Nil -> {
            v7
        }
    }
}

pub fn method186(v0: String, v1: Us25, v2: Uh3, v3: Int, v4: Uh3, v5: Int, v6: Int, v7: Uh23, v8: Uh25, v9: Uh26, v10: Us26, v11: Uh27, v12: Uh27, v13: Int) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27, Int) {
    case v4  {
        Uh3Cons(v14, v15) -> {
            let v16 = spiral_wrap_signed(v5 + 1, 32)
            let v17 = string.inspect(v16)
            let v18 = spiral_wrap_signed(v6 + 1, 32)
            let v19 = " "
            let v20 = v0 <> v19 
            let v21 = string.inspect(v13)
            let v22 = v20 <> v21 
            let v23 = "/"
            let v24 = v22 <> v23 
            let v25 = string.inspect(v3)
            let v26 = v24 <> v25 
            let v27 = "\n"
            let v28 = v26 <> v27 
            let v29 = v28 <> v14 
            let v30 = string.to_graphemes(v29)
            let v31 = v30 |> list.reverse
            let v32 = Uh3Nil
            let listm_fold = v31 |> list.fold (v32, fn (acc, x) {
            let v33 = x
            let v34 = acc
            let v35 = Uh3Cons(v33, v34)
            v35
            })
            let v36 = listm_fold
            let v37 = Uh3Nil
            let v38 = method18(v36, v37)
            let v39 = without_blank_tail_172(v38)
            let v40 = Uh3Nil
            let v41 = method18(v39, v40)
            let v42 = ""
            let v43 = concat_balanced_20(v42, v41)
            let v44 = method174(v0, v13, v7)
            let #(v94, v95, v96, v97, v98, v99, v100, v101) =
                case v44  {
                    Us28Some(v45, v46, v47, v48, v49, v50) -> {
                        let v51 = Uh23Nil
                        let v52 = method187(v0, v13, v17, v18, v43, v3, v7, v51)
                        #(v16, v18, v52, v8, v9, v10, v11, v12)
                    }
                    _ -> {
                        let #(v86, v87, v88, v89, v90, v91, v92, v93) =
                            case v44  {
                                Us28None -> {
                                    let v53 = v13 == 1
                                    let v77 =
                                        case v53 {
                                            True -> {
                                                case v1  {
                                                    Us25None -> {
                                                        Us26None
                                                    }
                                                    Us25Some(v54) -> {
                                                        let v55 = method173(v54, v9)
                                                        case v55  {
                                                            Us27None -> {
                                                                Us26None
                                                            }
                                                            Us27Some(v56, v57) -> {
                                                                Us26Some(v57)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            False -> {
                                                let v65 = spiral_wrap_signed(v13 - 1, 32)
                                                let v66 = method174(v0, v65, v7)
                                                case v66  {
                                                    Us28None -> {
                                                        Us26None
                                                    }
                                                    Us28Some(v67, v68, v69, v70, v71, v72) -> {
                                                        Us26Some(v67)
                                                    }
                                                }
                                            }
                                        }
                                    let v78 = Uh24Nil
                                    let v79 = Uh24Cons(v17, v18, v43, v78)
                                    let v80 = Uh23Nil
                                    let v81 = Uh23Cons(v17, v0, v13, v3, v77, v79, v80)
                                    let v82 = method175(v7, v81)
                                    let v83 = Uh25Nil
                                    let v84 = Uh25Cons(v0, v13, v83)
                                    let v85 = method176(v8, v84)
                                    #(v16, v18, v82, v85, v9, v10, v11, v12)
                                }
                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                            }
                        #(v86, v87, v88, v89, v90, v91, v92, v93)
                    }
                }
            let v102 = spiral_wrap_signed(v13 + 1, 32)
            method186(v0, v1, v2, v3, v15, v94, v95, v96, v97, v98, v99, v100, v101, v102)
        }
        Uh3Nil -> {
            #(v5, v6, v7, v8, v9, v10, v11, v12, v13)
        }
    }
}

pub fn method179(v0: String, v1: Us25, v2: Uh3, v3: Uh3, v4: Int, v5: Int, v6: Uh23, v7: Uh25, v8: Uh26, v9: Us26, v10: Uh27, v11: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27) {
    let #(v58, v59, v60, v61, v62, v63, v64, v65) =
        case v3  {
            Uh3Cons(v12, v13) -> {
                let v14 = 280
                let v15 = split_cell_138(v0, v14, v12)
                let v16 = 0
                let v17 = method17(v15, v16)
                let v18 = Uh23Nil
                let v19 = method180(v0, v6, v18)
                let v20 = Uh13Nil
                let v21 = method181(v19, v20)
                let v22 = Uh13Nil
                let v23 = method182(v17, v21, v22)
                let #(v24, v25, v26, v27, v28, v29, v30, v31) = method183(v0, v23, v4, v5, v6, v7, v8, v9, v10, v11)
                let v32 = 1
                let #(v33, v34, v35, v36, v37, v38, v39, v40, _v41) = method186(v0, v1, v2, v17, v15, v24, v25, v26, v27, v28, v29, v30, v31, v32)
                method179(v0, v1, v2, v13, v33, v34, v35, v36, v37, v38, v39, v40)
            }
            _ -> {
                let #(v50, v51, v52, v53, v54, v55, v56, v57) =
                    case v3  {
                        Uh3Nil -> {
                            #(v4, v5, v6, v7, v8, v9, v10, v11)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v50, v51, v52, v53, v54, v55, v56, v57)
            }
        }
    #(v58, v59, v60, v61, v62, v63, v64, v65)
}

pub fn method178(v0: Uh22, v1: Int, v2: Int, v3: Uh23, v4: Uh25, v5: Uh26, v6: Us26, v7: Uh27, v8: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27) {
    let #(v42, v43, v44, v45, v46, v47, v48, v49) =
        case v0  {
            Uh22Cons(v9, v10, v11, v12) -> {
                let v17 =
                    case v11  {
                        Uh3Cons(v13, v14) -> {
                            v14
                        }
                        Uh3Nil -> {
                            Uh3Nil
                        }
                    }
                let #(v18, v19, v20, v21, v22, v23, v24, v25) = method179(v9, v10, v11, v17, v1, v2, v3, v4, v5, v6, v7, v8)
                method178(v12, v18, v19, v20, v21, v22, v23, v24, v25)
            }
            _ -> {
                let #(v34, v35, v36, v37, v38, v39, v40, v41) =
                    case v0  {
                        Uh22Nil -> {
                            #(v1, v2, v3, v4, v5, v6, v7, v8)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v34, v35, v36, v37, v38, v39, v40, v41)
            }
        }
    #(v42, v43, v44, v45, v46, v47, v48, v49)
}

pub fn method189(v0: Uh22, v1: Uh27) -> Uh27 {
    case v0  {
        Uh22Cons(v2, v3, v4, v5) -> {
            let v6 = method189(v5, v1)
            Uh27Cons(v2, v6)
        }
        Uh22Nil -> {
            v1
        }
    }
}

pub fn method191(v0: String, v1: Uh23) -> Us28 {
    case v1  {
        Uh23Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = v4 == v0
            let v12 =
                case v10 {
                    True -> {
                        let v11 = v5 == 2
                        v11
                    }
                    False -> {
                        False
                    }
                }
            case v12 {
                True -> {
                    Us28Some(v3, v4, v5, v6, v7, v8)
                }
                False -> {
                    method191(v0, v9)
                }
            }
        }
        Uh23Nil -> {
            Us28None
        }
    }
}

pub fn method190(v0: Int, v1: Int, v2: Uh23, v3: Uh25, v4: Uh26, v5: Us26, v6: Uh27, v7: Uh27, v8: Uh27, v9: Uh27) -> Uh27 {
    case v8  {
        Uh27Cons(v10, v11) -> {
            let v12 = method190(v0, v1, v2, v3, v4, v5, v6, v7, v11, v9)
            let v13 = method191(v10, v2)
            let v21 =
                case v13  {
                    Us28None -> {
                        False
                    }
                    Us28Some(v14, v15, v16, v17, v18, v19) -> {
                        True
                    }
                }
            case v21 {
                True -> {
                    Uh27Cons(v10, v12)
                }
                False -> {
                    v12
                }
            }
        }
        Uh27Nil -> {
            v9
        }
    }
}

pub fn method192(v0: Uh27, v1: Int) -> Int {
    case v0  {
        Uh27Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method192(v3, v4)
        }
        Uh27Nil -> {
            v1
        }
    }
}

pub fn method193(v0: Int, v1: Uh27, v2: Int, v3: Uh27) -> #(Int, Uh27) {
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
                        let v12 = v11 == 0
                        v12
                    }
                    False -> {
                        False
                    }
                }
            let v15 =
                case v13 {
                    True -> {
                        Uh27Cons(v4, v3)
                    }
                    False -> {
                        v3
                    }
                }
            method193(v0, v5, v6, v15)
        }
        Uh27Nil -> {
            #(v2, v3)
        }
    }
}

pub fn method194(v0: Uh27, v1: Uh27) -> Uh27 {
    case v0  {
        Uh27Cons(v2, v3) -> {
            let v4 = Uh27Cons(v2, v1)
            method194(v3, v4)
        }
        Uh27Nil -> {
            v1
        }
    }
}

pub fn go_195(v0: Int, v1: Uh27) -> Uh27 {
    case v1  {
        Uh27Cons(v2, v3) -> {
            let v4 = v0 > 0
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v0 - 1, 32)
                    let v6 = go_195(v5, v3)
                    Uh27Cons(v2, v6)
                }
                False -> {
                    Uh27Nil
                }
            }
        }
        _ -> {
            Uh27Nil
        }
    }
}

pub fn method197(v0: String, v1: Uh23, v2: Uh23) -> Uh23 {
    case v1  {
        Uh23Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method197(v0, v9, v2)
            let v11 = v4 == v0
            let v12 = v11 == False
            let v14 =
                case v12 {
                    True -> {
                        True
                    }
                    False -> {
                        let v13 = v5 != 2
                        v13
                    }
                }
            case v14 {
                True -> {
                    Uh23Cons(v3, v4, v5, v6, v7, v8, v10)
                }
                False -> {
                    v10
                }
            }
        }
        Uh23Nil -> {
            v2
        }
    }
}

pub fn method198(v0: String, v1: Uh25, v2: Uh25) -> Uh25 {
    case v1  {
        Uh25Cons(v3, v4, v5) -> {
            let v6 = method198(v0, v5, v2)
            let v7 = v3 == v0
            let v8 = v7 == False
            let v10 =
                case v8 {
                    True -> {
                        True
                    }
                    False -> {
                        let v9 = v4 != 2
                        v9
                    }
                }
            case v10 {
                True -> {
                    Uh25Cons(v3, v4, v6)
                }
                False -> {
                    v6
                }
            }
        }
        Uh25Nil -> {
            v2
        }
    }
}

pub fn method199(v0: Uh27, v1: Uh27) -> Uh27 {
    case v0  {
        Uh27Cons(v2, v3) -> {
            let v4 = method199(v3, v1)
            Uh27Cons(v2, v4)
        }
        Uh27Nil -> {
            v1
        }
    }
}

pub fn method196(v0: Uh27, v1: Int, v2: Int, v3: Uh23, v4: Uh25, v5: Uh26, v6: Us26, v7: Uh27, v8: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27) {
    let #(v34, v35, v36, v37, v38, v39, v40, v41) =
        case v0  {
            Uh27Cons(v9, v10) -> {
                let v11 = Uh23Nil
                let v12 = method197(v9, v3, v11)
                let v13 = Uh25Nil
                let v14 = method198(v9, v4, v13)
                let v15 = Uh27Nil
                let v16 = Uh27Cons(v9, v15)
                let v17 = method199(v7, v16)
                method196(v10, v1, v2, v12, v14, v5, v6, v17, v8)
            }
            _ -> {
                let #(v26, v27, v28, v29, v30, v31, v32, v33) =
                    case v0  {
                        Uh27Nil -> {
                            #(v1, v2, v3, v4, v5, v6, v7, v8)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v26, v27, v28, v29, v30, v31, v32, v33)
            }
        }
    #(v34, v35, v36, v37, v38, v39, v40, v41)
}

pub fn closure21(capt: #(String)) -> fn(#(String, Us25, Uh3)) -> Bool {
    fn (dom) {
        let #(_v1, v2, _v3) = dom
        let #(v0) = capt
        case v2  {
            Us25None -> {
                False
            }
            Us25Some(v4) -> {
                let v5 = v4 == v0
                v5
            }
        }
    }
}

pub fn method201(v0: String) -> fn(#(String, Us25, Uh3)) -> Bool {
    closure21(#(v0))
}

pub fn method202(v0: String, v1: fn(#(String, Us25, Uh3)) -> Bool, v2: Uh22) -> Bool {
    case v2  {
        Uh22Cons(v3, v4, v5, v6) -> {
            let v7 = v1(#(v3, v4, v5))
            case v7 {
                True -> {
                    True
                }
                False -> {
                    let v8 = method201(v0)
                    method202(v0, v8, v6)
                }
            }
        }
        Uh22Nil -> {
            False
        }
    }
}

pub fn closure22(capt: #(String)) -> fn(String) -> Bool {
    fn (v1) {
        let #(v0) = capt
        let v2 = v0 == v1
        v2
    }
}

pub fn method203(v0: String) -> fn(String) -> Bool {
    closure22(#(v0))
}

pub fn method204(v0: String, v1: fn(String) -> Bool, v2: Uh27) -> Bool {
    case v2  {
        Uh27Cons(v3, v4) -> {
            let v5 = v1(v3)
            case v5 {
                True -> {
                    True
                }
                False -> {
                    let v6 = method203(v0)
                    method204(v0, v6, v4)
                }
            }
        }
        Uh27Nil -> {
            False
        }
    }
}

pub fn method200(v0: Int, v1: Int, v2: Uh23, v3: Uh25, v4: Uh26, v5: Us26, v6: Uh27, v7: Uh27, v8: Uh22, v9: Uh27, v10: Uh27) -> Uh27 {
    case v9  {
        Uh27Cons(v11, v12) -> {
            let v13 = method200(v0, v1, v2, v3, v4, v5, v6, v7, v8, v12, v10)
            let v14 = method201(v11)
            let v15 = method202(v11, v14, v8)
            let v19 =
                case v15 {
                    True -> {
                        let v16 = method203(v11)
                        let v17 = method204(v11, v16, v6)
                        let v18 = v17 == False
                        v18
                    }
                    False -> {
                        False
                    }
                }
            case v19 {
                True -> {
                    Uh27Cons(v11, v13)
                }
                False -> {
                    v13
                }
            }
        }
        Uh27Nil -> {
            v10
        }
    }
}

pub fn method206(v0: String, v1: Uh13, v2: Int, v3: Int, v4: Uh23, v5: Uh25, v6: Uh26, v7: Us26, v8: Uh27, v9: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27) {
    let #(v32, v33, v34, v35, v36, v37, v38, v39) =
        case v1  {
            Uh13Cons(v10, v11) -> {
                let v12 = Uh23Nil
                let v13 = method184(v0, v10, v4, v12)
                let v14 = Uh25Nil
                let v15 = method185(v0, v10, v5, v14)
                method206(v0, v11, v2, v3, v13, v15, v6, v7, v8, v9)
            }
            _ -> {
                let #(v24, v25, v26, v27, v28, v29, v30, v31) =
                    case v1  {
                        Uh13Nil -> {
                            #(v2, v3, v4, v5, v6, v7, v8, v9)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v24, v25, v26, v27, v28, v29, v30, v31)
            }
        }
    #(v32, v33, v34, v35, v36, v37, v38, v39)
}

pub fn method205(v0: Uh27, v1: Int, v2: Int, v3: Uh23, v4: Uh25, v5: Uh26, v6: Us26, v7: Uh27, v8: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27) {
    let #(v42, v43, v44, v45, v46, v47, v48, v49) =
        case v0  {
            Uh27Cons(v9, v10) -> {
                let v11 = Uh23Nil
                let v12 = method180(v9, v3, v11)
                let v13 = Uh13Nil
                let v14 = method181(v12, v13)
                let #(v15, v16, v17, v18, v19, v20, v21, _v22) = method206(v9, v14, v1, v2, v3, v4, v5, v6, v7, v8)
                let v23 = Uh27Nil
                let v24 = Uh27Cons(v9, v23)
                let v25 = method199(v8, v24)
                method205(v10, v15, v16, v17, v18, v19, v20, v21, v25)
            }
            _ -> {
                let #(v34, v35, v36, v37, v38, v39, v40, v41) =
                    case v0  {
                        Uh27Nil -> {
                            #(v1, v2, v3, v4, v5, v6, v7, v8)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v34, v35, v36, v37, v38, v39, v40, v41)
            }
        }
    #(v42, v43, v44, v45, v46, v47, v48, v49)
}
