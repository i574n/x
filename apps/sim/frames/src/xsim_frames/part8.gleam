import gleam/string
import xsim_frames/types.{type Uh3, type Uh13, type Us22, type Uh22, type Us23, type Uh24, type Uh23, type Uh25, type Uh26, type Uh27, type Us25, type Us26, Uh13Cons, Uh13Nil, Uh22Cons, Uh22Nil, Uh23Cons, Uh23Nil, Uh24Cons, Uh24Nil, Uh25Cons, Uh25Nil, Uh26Cons, Uh26Nil, Uh27Cons, Uh27Nil, Uh3Cons, Uh3Nil, Us22None, Us22Some, Us23None, Us23Some, Us24None, Us24Some, Us25None, Us25Some, Us26None, Us26Some}
import xsim_frames/part1.{spiral_wrap_signed}
import xsim_frames/part2.{concat_balanced_35, method37}
import xsim_frames/part6.{graphemes_from_134}
import xsim_frames/part7.{method144, method168, method169, method170, method171, method172, split_cell_132, without_blank_tail_167}

pub fn method166(v0: String, v1: Us22, v2: Uh3, v3: Int, v4: Uh3, v5: Int, v6: Int, v7: Uh23, v8: Uh25, v9: Uh26, v10: Us23, v11: Uh27, v12: Uh27, v13: Int) -> #(Int, Int, Uh23, Uh25, Uh26, Us23, Uh27, Uh27, Int) {
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
            let v30 = Uh3Nil
            let v31 = graphemes_from_134(v29, v30)
            let v32 = Uh3Nil
            let v33 = method37(v31, v32)
            let v34 = without_blank_tail_167(v33)
            let v35 = Uh3Nil
            let v36 = method37(v34, v35)
            let v37 = ""
            let v38 = concat_balanced_35(v37, v36)
            let v39 = v13 == 1
            let v65 =
                case v39 {
                    True -> {
                        case v1  {
                            Us22None -> {
                                Us23None
                            }
                            Us22Some(v40) -> {
                                let v41 = Us24None
                                let v42 = method168(v40, v9, v41)
                                case v42  {
                                    Us24None -> {
                                        Us23None
                                    }
                                    Us24Some(v43, v44) -> {
                                        Us23Some(v44)
                                    }
                                }
                            }
                        }
                    }
                    False -> {
                        let v52 = spiral_wrap_signed(v13 - 1, 32)
                        let v53 = Us25None
                        let v54 = method169(v0, v52, v7, v53)
                        case v54  {
                            Us25None -> {
                                Us23None
                            }
                            Us25Some(v55, v56, v57, v58, v59, v60) -> {
                                Us23Some(v55)
                            }
                        }
                    }
                }
            let v66 = Uh24Nil
            let v67 = Uh24Cons(v17, v18, v38, v66)
            let v68 = Uh23Nil
            let v69 = Uh23Cons(v17, v0, v13, v3, v65, v67, v68)
            let v70 = method170(v7, v69)
            let v71 = Uh25Nil
            let v72 = Uh25Cons(v0, v13, v71)
            let v73 = method171(v8, v72)
            let #(v84, v85, v86, v87, v88, v89, v90, v91) =
                case v10  {
                    Us23Some(v74) -> {
                        #(v16, v18, v70, v73, v9, v10, v11, v12)
                    }
                    _ -> {
                        let #(v76, v77, v78, v79, v80, v81, v82, v83) =
                            case v10  {
                                Us23None -> {
                                    let v75 = Us23Some(v17)
                                    #(v16, v18, v70, v73, v9, v75, v11, v12)
                                }
                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                            }
                        #(v76, v77, v78, v79, v80, v81, v82, v83)
                    }
                }
            let v92 = Uh26Nil
            let v93 = method172(v0, v88, v92)
            let v94 = spiral_wrap_signed(v13 + 1, 32)
            let v95 = Uh26Cons(v0, v17, v93)
            method166(v0, v1, v2, v3, v15, v84, v85, v86, v87, v95, v89, v90, v91, v94)
        }
        Uh3Nil -> {
            #(v5, v6, v7, v8, v9, v10, v11, v12, v13)
        }
    }
}

pub fn method165(v0: Uh22, v1: Int, v2: Int, v3: Uh23, v4: Uh25, v5: Uh26, v6: Us23, v7: Uh27, v8: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us23, Uh27, Uh27) {
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
                let v19 = split_cell_132(v9, v18, v17)
                let v20 = 0
                let v21 = method144(v19, v20)
                let v22 = 1
                let #(v23, v24, v25, v26, v27, v28, v29, v30, _v31) = method166(v9, v10, v11, v21, v19, v1, v2, v3, v4, v5, v6, v7, v8, v22)
                method165(v12, v23, v24, v25, v26, v27, v28, v29, v30)
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

pub fn method175(v0: String, v1: Uh23, v2: Uh23) -> Uh23 {
    case v1  {
        Uh23Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method175(v0, v9, v2)
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

pub fn method176(v0: Uh23, v1: Uh13) -> Uh13 {
    case v0  {
        Uh23Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method176(v8, v1)
            Uh13Cons(v4, v9)
        }
        Uh23Nil -> {
            v1
        }
    }
}

pub fn method177(v0: Int, v1: Uh13, v2: Uh13) -> Uh13 {
    case v1  {
        Uh13Cons(v3, v4) -> {
            let v5 = method177(v0, v4, v2)
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

pub fn method179(v0: String, v1: Int, v2: Uh23, v3: Uh23) -> Uh23 {
    case v2  {
        Uh23Cons(v4, v5, v6, v7, v8, v9, v10) -> {
            let v11 = method179(v0, v1, v10, v3)
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

pub fn method180(v0: String, v1: Int, v2: Uh25, v3: Uh25) -> Uh25 {
    case v2  {
        Uh25Cons(v4, v5, v6) -> {
            let v7 = method180(v0, v1, v6, v3)
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

pub fn method178(v0: String, v1: Uh13, v2: Int, v3: Int, v4: Uh23, v5: Uh25, v6: Uh26, v7: Us23, v8: Uh27, v9: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us23, Uh27, Uh27) {
    let #(v32, v33, v34, v35, v36, v37, v38, v39) =
        case v1  {
            Uh13Cons(v10, v11) -> {
                let v12 = Uh23Nil
                let v13 = method179(v0, v10, v4, v12)
                let v14 = Uh25Nil
                let v15 = method180(v0, v10, v5, v14)
                method178(v0, v11, v2, v3, v13, v15, v6, v7, v8, v9)
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

pub fn method183(v0: Uh24, v1: Uh24) -> Uh24 {
    case v0  {
        Uh24Cons(v2, v3, v4, v5) -> {
            let v6 = method183(v5, v1)
            Uh24Cons(v2, v3, v4, v6)
        }
        Uh24Nil -> {
            v1
        }
    }
}

pub fn method182(v0: String, v1: Int, v2: String, v3: Int, v4: String, v5: Int, v6: Uh23, v7: Uh23) -> Uh23 {
    case v6  {
        Uh23Cons(v8, v9, v10, v11, v12, v13, v14) -> {
            let v15 = method182(v0, v1, v2, v3, v4, v5, v14, v7)
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
                        let v21 = method183(v13, v20)
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

pub fn method181(v0: String, v1: Us22, v2: Uh3, v3: Int, v4: Uh3, v5: Int, v6: Int, v7: Uh23, v8: Uh25, v9: Uh26, v10: Us23, v11: Uh27, v12: Uh27, v13: Int) -> #(Int, Int, Uh23, Uh25, Uh26, Us23, Uh27, Uh27, Int) {
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
            let v30 = Uh3Nil
            let v31 = graphemes_from_134(v29, v30)
            let v32 = Uh3Nil
            let v33 = method37(v31, v32)
            let v34 = without_blank_tail_167(v33)
            let v35 = Uh3Nil
            let v36 = method37(v34, v35)
            let v37 = ""
            let v38 = concat_balanced_35(v37, v36)
            let v39 = Us25None
            let v40 = method169(v0, v13, v7, v39)
            let #(v92, v93, v94, v95, v96, v97, v98, v99) =
                case v40  {
                    Us25Some(v41, v42, v43, v44, v45, v46) -> {
                        let v47 = Uh23Nil
                        let v48 = method182(v0, v13, v17, v18, v38, v3, v7, v47)
                        #(v16, v18, v48, v8, v9, v10, v11, v12)
                    }
                    _ -> {
                        let #(v84, v85, v86, v87, v88, v89, v90, v91) =
                            case v40  {
                                Us25None -> {
                                    let v49 = v13 == 1
                                    let v75 =
                                        case v49 {
                                            True -> {
                                                case v1  {
                                                    Us22None -> {
                                                        Us23None
                                                    }
                                                    Us22Some(v50) -> {
                                                        let v51 = Us24None
                                                        let v52 = method168(v50, v9, v51)
                                                        case v52  {
                                                            Us24None -> {
                                                                Us23None
                                                            }
                                                            Us24Some(v53, v54) -> {
                                                                Us23Some(v54)
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            False -> {
                                                let v62 = spiral_wrap_signed(v13 - 1, 32)
                                                let v63 = Us25None
                                                let v64 = method169(v0, v62, v7, v63)
                                                case v64  {
                                                    Us25None -> {
                                                        Us23None
                                                    }
                                                    Us25Some(v65, v66, v67, v68, v69, v70) -> {
                                                        Us23Some(v65)
                                                    }
                                                }
                                            }
                                        }
                                    let v76 = Uh24Nil
                                    let v77 = Uh24Cons(v17, v18, v38, v76)
                                    let v78 = Uh23Nil
                                    let v79 = Uh23Cons(v17, v0, v13, v3, v75, v77, v78)
                                    let v80 = method170(v7, v79)
                                    let v81 = Uh25Nil
                                    let v82 = Uh25Cons(v0, v13, v81)
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
        Uh3Nil -> {
            #(v5, v6, v7, v8, v9, v10, v11, v12, v13)
        }
    }
}

pub fn method174(v0: String, v1: Us22, v2: Uh3, v3: Uh3, v4: Int, v5: Int, v6: Uh23, v7: Uh25, v8: Uh26, v9: Us23, v10: Uh27, v11: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us23, Uh27, Uh27) {
    let #(v58, v59, v60, v61, v62, v63, v64, v65) =
        case v3  {
            Uh3Cons(v12, v13) -> {
                let v14 = 280
                let v15 = split_cell_132(v0, v14, v12)
                let v16 = 0
                let v17 = method144(v15, v16)
                let v18 = Uh23Nil
                let v19 = method175(v0, v6, v18)
                let v20 = Uh13Nil
                let v21 = method176(v19, v20)
                let v22 = Uh13Nil
                let v23 = method177(v17, v21, v22)
                let #(v24, v25, v26, v27, v28, v29, v30, v31) = method178(v0, v23, v4, v5, v6, v7, v8, v9, v10, v11)
                let v32 = 1
                let #(v33, v34, v35, v36, v37, v38, v39, v40, _v41) = method181(v0, v1, v2, v17, v15, v24, v25, v26, v27, v28, v29, v30, v31, v32)
                method174(v0, v1, v2, v13, v33, v34, v35, v36, v37, v38, v39, v40)
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

pub fn method173(v0: Uh22, v1: Int, v2: Int, v3: Uh23, v4: Uh25, v5: Uh26, v6: Us23, v7: Uh27, v8: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us23, Uh27, Uh27) {
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
                let #(v18, v19, v20, v21, v22, v23, v24, v25) = method174(v9, v10, v11, v17, v1, v2, v3, v4, v5, v6, v7, v8)
                method173(v12, v18, v19, v20, v21, v22, v23, v24, v25)
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

pub fn method184(v0: Uh22, v1: Uh27) -> Uh27 {
    case v0  {
        Uh22Cons(v2, v3, v4, v5) -> {
            let v6 = method184(v5, v1)
            Uh27Cons(v2, v6)
        }
        Uh22Nil -> {
            v1
        }
    }
}

pub fn method186(v0: String, v1: Uh23, v2: Us25) -> Us25 {
    case v1  {
        Uh23Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method186(v0, v9, v2)
            let v11 = v4 == v0
            let v13 =
                case v11 {
                    True -> {
                        let v12 = v5 == 2
                        v12
                    }
                    False -> {
                        False
                    }
                }
            case v13 {
                True -> {
                    Us25Some(v3, v4, v5, v6, v7, v8)
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

pub fn method185(v0: Int, v1: Int, v2: Uh23, v3: Uh25, v4: Uh26, v5: Us23, v6: Uh27, v7: Uh27, v8: Uh27, v9: Uh27) -> Uh27 {
    case v8  {
        Uh27Cons(v10, v11) -> {
            let v12 = method185(v0, v1, v2, v3, v4, v5, v6, v7, v11, v9)
            let v13 = Us25None
            let v14 = method186(v10, v2, v13)
            let v22 =
                case v14  {
                    Us25None -> {
                        False
                    }
                    Us25Some(v15, v16, v17, v18, v19, v20) -> {
                        True
                    }
                }
            case v22 {
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

pub fn method187(v0: Uh27, v1: Int) -> Int {
    case v0  {
        Uh27Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method187(v3, v4)
        }
        Uh27Nil -> {
            v1
        }
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
            method188(v0, v5, v6, v15)
        }
        Uh27Nil -> {
            #(v2, v3)
        }
    }
}

pub fn method189(v0: Uh27, v1: Uh27) -> Uh27 {
    case v0  {
        Uh27Cons(v2, v3) -> {
            let v4 = Uh27Cons(v2, v1)
            method189(v3, v4)
        }
        Uh27Nil -> {
            v1
        }
    }
}

pub fn go_190(v0: Int, v1: Uh27) -> Uh27 {
    case v1  {
        Uh27Cons(v2, v3) -> {
            let v4 = v0 > 0
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v0 - 1, 32)
                    let v6 = go_190(v5, v3)
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

pub fn method192(v0: String, v1: Uh23, v2: Uh23) -> Uh23 {
    case v1  {
        Uh23Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method192(v0, v9, v2)
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

pub fn method193(v0: String, v1: Uh25, v2: Uh25) -> Uh25 {
    case v1  {
        Uh25Cons(v3, v4, v5) -> {
            let v6 = method193(v0, v5, v2)
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

pub fn method194(v0: Uh27, v1: Uh27) -> Uh27 {
    case v0  {
        Uh27Cons(v2, v3) -> {
            let v4 = method194(v3, v1)
            Uh27Cons(v2, v4)
        }
        Uh27Nil -> {
            v1
        }
    }
}

pub fn method191(v0: Uh27, v1: Int, v2: Int, v3: Uh23, v4: Uh25, v5: Uh26, v6: Us23, v7: Uh27, v8: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us23, Uh27, Uh27) {
    let #(v34, v35, v36, v37, v38, v39, v40, v41) =
        case v0  {
            Uh27Cons(v9, v10) -> {
                let v11 = Uh23Nil
                let v12 = method192(v9, v3, v11)
                let v13 = Uh25Nil
                let v14 = method193(v9, v4, v13)
                let v15 = Uh27Nil
                let v16 = Uh27Cons(v9, v15)
                let v17 = method194(v7, v16)
                method191(v10, v1, v2, v12, v14, v5, v6, v17, v8)
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

pub fn method196(v0: String, v1: Uh22, v2: Us26) -> Us26 {
    case v1  {
        Uh22Cons(v3, v4, v5, v6) -> {
            let v7 = method196(v0, v6, v2)
            let v11 =
                case v4  {
                    Us22None -> {
                        False
                    }
                    Us22Some(v8) -> {
                        let v9 = v8 == v0
                        v9
                    }
                }
            case v11 {
                True -> {
                    Us26Some(v3, v4, v5)
                }
                False -> {
                    v7
                }
            }
        }
        Uh22Nil -> {
            v2
        }
    }
}

pub fn method197(v0: String, v1: Uh27, v2: Us22) -> Us22 {
    case v1  {
        Uh27Cons(v3, v4) -> {
            let v5 = method197(v0, v4, v2)
            let v6 = v0 == v3
            case v6 {
                True -> {
                    Us22Some(v3)
                }
                False -> {
                    v5
                }
            }
        }
        Uh27Nil -> {
            v2
        }
    }
}

pub fn method195(v0: Int, v1: Int, v2: Uh23, v3: Uh25, v4: Uh26, v5: Us23, v6: Uh27, v7: Uh27, v8: Uh22, v9: Uh27, v10: Uh27) -> Uh27 {
    case v9  {
        Uh27Cons(v11, v12) -> {
            let v13 = method195(v0, v1, v2, v3, v4, v5, v6, v7, v8, v12, v10)
            let v14 = Us26None
            let v15 = method196(v11, v8, v14)
            let v20 =
                case v15  {
                    Us26None -> {
                        False
                    }
                    Us26Some(v16, v17, v18) -> {
                        True
                    }
                }
            let v27 =
                case v20 {
                    True -> {
                        let v21 = Us22None
                        let v22 = method197(v11, v6, v21)
                        let v25 =
                            case v22  {
                                Us22None -> {
                                    False
                                }
                                Us22Some(v23) -> {
                                    True
                                }
                            }
                        let v26 = v25 == False
                        v26
                    }
                    False -> {
                        False
                    }
                }
            case v27 {
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

pub fn method199(v0: String, v1: Uh13, v2: Int, v3: Int, v4: Uh23, v5: Uh25, v6: Uh26, v7: Us23, v8: Uh27, v9: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us23, Uh27, Uh27) {
    let #(v32, v33, v34, v35, v36, v37, v38, v39) =
        case v1  {
            Uh13Cons(v10, v11) -> {
                let v12 = Uh23Nil
                let v13 = method179(v0, v10, v4, v12)
                let v14 = Uh25Nil
                let v15 = method180(v0, v10, v5, v14)
                method199(v0, v11, v2, v3, v13, v15, v6, v7, v8, v9)
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

pub fn method198(v0: Uh27, v1: Int, v2: Int, v3: Uh23, v4: Uh25, v5: Uh26, v6: Us23, v7: Uh27, v8: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us23, Uh27, Uh27) {
    let #(v42, v43, v44, v45, v46, v47, v48, v49) =
        case v0  {
            Uh27Cons(v9, v10) -> {
                let v11 = Uh23Nil
                let v12 = method175(v9, v3, v11)
                let v13 = Uh13Nil
                let v14 = method176(v12, v13)
                let #(v15, v16, v17, v18, v19, v20, v21, _v22) = method199(v9, v14, v1, v2, v3, v4, v5, v6, v7, v8)
                let v23 = Uh27Nil
                let v24 = Uh27Cons(v9, v23)
                let v25 = method194(v8, v24)
                method198(v10, v15, v16, v17, v18, v19, v20, v21, v25)
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
