import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Uh10, type Uh13, type Uh19, type Uh20, type Us25, type Uh21, type Us26, type Uh23, type Uh22, type Uh24, type Uh25, type Uh26, type Us27, type Us28, Uh10Cons, Uh10Nil, Uh13Cons, Uh13Nil, Uh19Cons, Uh19Nil, Uh20Cons, Uh20Nil, Uh21Cons, Uh21Nil, Uh22Cons, Uh22Nil, Uh23Cons, Uh23Nil, Uh24Cons, Uh24Nil, Uh25Cons, Uh25Nil, Uh3Cons, Uh3Nil, Us0None, Us0Some, Us16Content, Us16Reaction, Us16Revision, Us17Framed, Us17Posted, Us18Deleted, Us18Edited, Us18FrameEdited, Us19Liked, Us19Unliked, Us25None, Us25Some, Us26None, Us26Some, Us27None, Us27Some, Us28None, Us28Some}
import xsim_frames/part1.{spiral_string_length, spiral_string_slice, spiral_wrap_signed}
import xsim_frames/part2.{method17, method18}
import xsim_frames/part7.{method146, method147, method148, method149, method150, method151}

pub fn method152(v0: Uh20, v1: Uh20) -> Uh20 {
    case v0  {
        Uh20Cons(v2, v3, v4) -> {
            let v5 = method152(v4, v1)
            Uh20Cons(v2, v3, v5)
        }
        Uh20Nil -> {
            v1
        }
    }
}

pub fn method154(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method154(v0, v4, v2)
            let v6 = v0 != v3
            case v6 {
                True -> {
                    Uh3Cons(v3, v5)
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

pub fn method153(v0: String, v1: String, v2: Uh20, v3: Uh20) -> Uh20 {
    case v2  {
        Uh20Cons(v4, v5, v6) -> {
            let v7 = method153(v0, v1, v6, v3)
            let v8 = v4 == v0
            let #(v11, v12) =
                case v8 {
                    True -> {
                        let v9 = Uh3Nil
                        let v10 = method154(v1, v5, v9)
                        #(v4, v10)
                    }
                    False -> {
                        #(v4, v5)
                    }
                }
            Uh20Cons(v11, v12, v7)
        }
        Uh20Nil -> {
            v3
        }
    }
}

pub fn method145(v0: Uh10, v1: Uh19, v2: Uh20) -> #(Uh19, Uh20) {
    let #(v83, v84) =
        case v0  {
            Uh10Cons(v3, v4) -> {
                let #(v77, v78) =
                    case v3  {
                        Us16Content(v5) -> {
                            case v5  {
                                Us17Posted(v6, v7, v8) -> {
                                    let v9 = Uh3Nil
                                    let v10 = Uh3Cons(v8, v9)
                                    let v11 = False
                                    let v12 = Uh19Nil
                                    let v13 = Uh19Cons(v6, v7, v10, v11, v12)
                                    let v14 = method146(v1, v13)
                                    #(v14, v2)
                                }
                                _ -> {
                                    let #(v20, v21) =
                                        case v5  {
                                            Us17Framed(v15, v16, v17, v18, v19) -> {
                                                #(v1, v2)
                                            }
                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                        }
                                    #(v20, v21)
                                }
                            }
                        }
                        _ -> {
                            let #(v75, v76) =
                                case v3  {
                                    Us16Revision(v24) -> {
                                        case v24  {
                                            Us18Edited(v25, v26) -> {
                                                let v27 = Uh19Nil
                                                let v28 = method147(v25, v26, v1, v27)
                                                #(v28, v2)
                                            }
                                            _ -> {
                                                let #(v39, v40) =
                                                    case v24  {
                                                        Us18Deleted(v29) -> {
                                                            let v30 = Uh19Nil
                                                            let v31 = method148(v29, v1, v30)
                                                            #(v31, v2)
                                                        }
                                                        _ -> {
                                                            let #(v37, v38) =
                                                                case v24  {
                                                                    Us18FrameEdited(v32, v33, v34, v35, v36) -> {
                                                                        #(v1, v2)
                                                                    }
                                                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                }
                                                            #(v37, v38)
                                                        }
                                                    }
                                                #(v39, v40)
                                            }
                                        }
                                    }
                                    _ -> {
                                        let #(v73, v74) =
                                            case v3  {
                                                Us16Reaction(v43) -> {
                                                    case v43  {
                                                        Us19Liked(v44, v45) -> {
                                                            let v46 = method149(v44)
                                                            let v47 = method150(v44, v46, v2)
                                                            case v47 {
                                                                True -> {
                                                                    let v48 = Uh20Nil
                                                                    let v49 = method151(v44, v45, v2, v48)
                                                                    #(v1, v49)
                                                                }
                                                                False -> {
                                                                    let v50 = Uh3Nil
                                                                    let v51 = Uh3Cons(v45, v50)
                                                                    let v52 = Uh20Nil
                                                                    let v53 = Uh20Cons(v44, v51, v52)
                                                                    let v54 = method152(v2, v53)
                                                                    #(v1, v54)
                                                                }
                                                            }
                                                        }
                                                        _ -> {
                                                            let #(v69, v70) =
                                                                case v43  {
                                                                    Us19Unliked(v57, v58) -> {
                                                                        let v59 = method149(v57)
                                                                        let v60 = method150(v57, v59, v2)
                                                                        case v60 {
                                                                            True -> {
                                                                                let v61 = Uh20Nil
                                                                                let v62 = method153(v57, v58, v2, v61)
                                                                                #(v1, v62)
                                                                            }
                                                                            False -> {
                                                                                let v63 = Uh3Nil
                                                                                let v64 = Uh20Nil
                                                                                let v65 = Uh20Cons(v57, v63, v64)
                                                                                let v66 = method152(v2, v65)
                                                                                #(v1, v66)
                                                                            }
                                                                        }
                                                                    }
                                                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                }
                                                            #(v69, v70)
                                                        }
                                                    }
                                                }
                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                            }
                                        #(v73, v74)
                                    }
                                }
                            #(v75, v76)
                        }
                    }
                method145(v4, v77, v78)
            }
            _ -> {
                let #(v81, v82) =
                    case v0  {
                        Uh10Nil -> {
                            #(v1, v2)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v81, v82)
            }
        }
    #(v83, v84)
}

pub fn final_replay_144(v0: Uh10) -> #(Uh19, Uh20) {
    let v1 = Uh19Nil
    let v2 = Uh20Nil
    let #(v3, v4) = method145(v0, v1, v2)
    #(v3, v4)
}

pub fn method155(v0: Uh19, v1: Uh19) -> Uh19 {
    case v0  {
        Uh19Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method155(v6, v1)
            let v8 = v5 == False
            case v8 {
                True -> {
                    Uh19Cons(v2, v3, v4, v5, v7)
                }
                False -> {
                    v7
                }
            }
        }
        Uh19Nil -> {
            v1
        }
    }
}

pub fn method156(v0: Uh19, v1: Uh21) -> Uh21 {
    case v0  {
        Uh19Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method156(v6, v1)
            let v12 =
                case v3  {
                    Us0None -> {
                        Us25None
                    }
                    Us0Some(v8) -> {
                        Us25Some(v8)
                    }
                }
            let v13 = Uh3Nil
            let v14 = method18(v4, v13)
            Uh21Cons(v2, v12, v14, v7)
        }
        Uh19Nil -> {
            v1
        }
    }
}

pub fn closure21(capt: Nil) -> fn(Int) -> Bool {
    fn (v0) {
        let v1 = v0 >= 9
        let v3 =
            case v1 {
                True -> {
                    let v2 = v0 <= 13
                    v2
                }
                False -> {
                    False
                }
            }
        let v5 =
            case v3 {
                True -> {
                    True
                }
                False -> {
                    let v4 = v0 == 32
                    v4
                }
            }
        let v7 =
            case v5 {
                True -> {
                    True
                }
                False -> {
                    let v6 = v0 == 133
                    v6
                }
            }
        let v9 =
            case v7 {
                True -> {
                    True
                }
                False -> {
                    let v8 = v0 == 160
                    v8
                }
            }
        let v11 =
            case v9 {
                True -> {
                    True
                }
                False -> {
                    let v10 = v0 == 5760
                    v10
                }
            }
        let v15 =
            case v11 {
                True -> {
                    True
                }
                False -> {
                    let v12 = v0 >= 8192
                    case v12 {
                        True -> {
                            let v13 = v0 <= 8202
                            v13
                        }
                        False -> {
                            False
                        }
                    }
                }
            }
        let v17 =
            case v15 {
                True -> {
                    True
                }
                False -> {
                    let v16 = v0 == 8232
                    v16
                }
            }
        let v19 =
            case v17 {
                True -> {
                    True
                }
                False -> {
                    let v18 = v0 == 8233
                    v18
                }
            }
        let v21 =
            case v19 {
                True -> {
                    True
                }
                False -> {
                    let v20 = v0 == 8239
                    v20
                }
            }
        let v23 =
            case v21 {
                True -> {
                    True
                }
                False -> {
                    let v22 = v0 == 8287
                    v22
                }
            }
        let v25 =
            case v23 {
                True -> {
                    True
                }
                False -> {
                    let v24 = v0 == 12288
                    v24
                }
            }
        let v26 = v25 == False
        v26
    }
}

pub fn method161() -> fn(Int) -> Bool {
    closure21(Nil)
}

pub fn method162(v0: fn(Int) -> Bool, v1: Uh13) -> Bool {
    case v1  {
        Uh13Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> {
                    True
                }
                False -> {
                    let v5 = method161()
                    method162(v5, v3)
                }
            }
        }
        Uh13Nil -> {
            False
        }
    }
}

pub fn blank_tail_length_160(v0: Uh3, v1: Int) -> Int {
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
            let v12 = method161()
            let v13 = method162(v12, v11)
            let v14 = v13 == False
            case v14 {
                True -> {
                    let v15 = spiral_string_length(v2)
                    let v16 = spiral_wrap_signed(v1 + v15, 32)
                    blank_tail_length_160(v3, v16)
                }
                False -> {
                    v1
                }
            }
        }
        _ -> {
            v1
        }
    }
}

pub fn method163(v0: String, v1: Uh25) -> Us27 {
    case v1  {
        Uh25Cons(v3, v4, v5) -> {
            let v6 = v3 == v0
            case v6 {
                True -> {
                    Us27Some(v3, v4)
                }
                False -> {
                    method163(v0, v5)
                }
            }
        }
        Uh25Nil -> {
            Us27None
        }
    }
}

pub fn method164(v0: String, v1: Int, v2: Uh22) -> Us28 {
    case v2  {
        Uh22Cons(v4, v5, v6, v7, v8, v9, v10) -> {
            let v11 = v5 == v0
            let v13 =
                case v11 {
                    True -> {
                        let v12 = v6 == v1
                        v12
                    }
                    False -> {
                        False
                    }
                }
            case v13 {
                True -> {
                    Us28Some(v4, v5, v6, v7, v8, v9)
                }
                False -> {
                    method164(v0, v1, v10)
                }
            }
        }
        Uh22Nil -> {
            Us28None
        }
    }
}

pub fn method165(v0: Uh22, v1: Uh22) -> Uh22 {
    case v0  {
        Uh22Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method165(v8, v1)
            Uh22Cons(v2, v3, v4, v5, v6, v7, v9)
        }
        Uh22Nil -> {
            v1
        }
    }
}

pub fn method166(v0: Uh24, v1: Uh24) -> Uh24 {
    case v0  {
        Uh24Cons(v2, v3, v4) -> {
            let v5 = method166(v4, v1)
            Uh24Cons(v2, v3, v5)
        }
        Uh24Nil -> {
            v1
        }
    }
}

pub fn method167(v0: String, v1: Uh25, v2: Uh25) -> Uh25 {
    case v1  {
        Uh25Cons(v3, v4, v5) -> {
            let v6 = method167(v0, v5, v2)
            let v7 = v3 == v0
            let v8 = v7 == False
            case v8 {
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

pub fn method159(v0: String, v1: Us25, v2: Uh3, v3: Int, v4: Uh3, v5: Int, v6: Int, v7: Uh22, v8: Uh24, v9: Uh25, v10: Us26, v11: Uh26, v12: Uh26, v13: Int) -> #(Int, Int, Uh22, Uh24, Uh25, Us26, Uh26, Uh26, Int) {
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
            let v39 = method18(v37, v38)
            let v40 = 0
            let v41 = blank_tail_length_160(v39, v40)
            let v42 = spiral_wrap_signed(v30 - v41, 32)
            let v43 = spiral_wrap_signed(v42 - 1, 32)
            let v44 = spiral_string_slice(v29, 0, v43)
            let v45 = v13 == 1
            let v69 =
                case v45 {
                    True -> {
                        case v1  {
                            Us25None -> {
                                Us26None
                            }
                            Us25Some(v46) -> {
                                let v47 = method163(v46, v9)
                                case v47  {
                                    Us27None -> {
                                        Us26None
                                    }
                                    Us27Some(v48, v49) -> {
                                        Us26Some(v49)
                                    }
                                }
                            }
                        }
                    }
                    False -> {
                        let v57 = spiral_wrap_signed(v13 - 1, 32)
                        let v58 = method164(v0, v57, v7)
                        case v58  {
                            Us28None -> {
                                Us26None
                            }
                            Us28Some(v59, v60, v61, v62, v63, v64) -> {
                                Us26Some(v59)
                            }
                        }
                    }
                }
            let v70 = Uh23Nil
            let v71 = Uh23Cons(v17, v18, v44, v70)
            let v72 = Uh22Nil
            let v73 = Uh22Cons(v17, v0, v13, v3, v69, v71, v72)
            let v74 = method165(v7, v73)
            let v75 = Uh24Nil
            let v76 = Uh24Cons(v0, v13, v75)
            let v77 = method166(v8, v76)
            let #(v88, v89, v90, v91, v92, v93, v94, v95) =
                case v10  {
                    Us26Some(v78) -> {
                        #(v16, v18, v74, v77, v9, v10, v11, v12)
                    }
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
            let v97 = method167(v0, v92, v96)
            let v98 = spiral_wrap_signed(v13 + 1, 32)
            let v99 = Uh25Cons(v0, v17, v97)
            method159(v0, v1, v2, v3, v15, v88, v89, v90, v91, v99, v93, v94, v95, v98)
        }
        Uh3Nil -> {
            #(v5, v6, v7, v8, v9, v10, v11, v12, v13)
        }
    }
}

pub fn method158(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: Uh21, v2: Int, v3: Int, v4: Uh22, v5: Uh24, v6: Uh25, v7: Us26, v8: Uh26, v9: Uh26) -> #(Int, Int, Uh22, Uh24, Uh25, Us26, Uh26, Uh26) {
    let #(v50, v51, v52, v53, v54, v55, v56, v57) =
        case v1  {
            Uh21Cons(v10, v11, v12, v13) -> {
                let v18 =
                    case v12  {
                        Uh3Cons(v14, v15) -> {
                            v14
                        }
                        Uh3Nil -> {
                            let v16 = ""
                            v16
                        }
                    }
                let v19 = v0(v10)
                let v20 = v19(280)
                let v21 = v20(v18)
                let v22 = 0
                let v23 = method17(v21, v22)
                let v24 = 1
                let #(v25, v26, v27, v28, v29, v30, v31, v32, _v33) = method159(v10, v11, v12, v23, v21, v2, v3, v4, v5, v6, v7, v8, v9, v24)
                method158(v0, v13, v25, v26, v27, v28, v29, v30, v31, v32)
            }
            _ -> {
                let #(v42, v43, v44, v45, v46, v47, v48, v49) =
                    case v1  {
                        Uh21Nil -> {
                            #(v2, v3, v4, v5, v6, v7, v8, v9)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v42, v43, v44, v45, v46, v47, v48, v49)
            }
        }
    #(v50, v51, v52, v53, v54, v55, v56, v57)
}

pub fn method170(v0: String, v1: Uh22, v2: Uh22) -> Uh22 {
    case v1  {
        Uh22Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method170(v0, v9, v2)
            let v11 = v4 == v0
            case v11 {
                True -> {
                    Uh22Cons(v3, v4, v5, v6, v7, v8, v10)
                }
                False -> {
                    v10
                }
            }
        }
        Uh22Nil -> {
            v2
        }
    }
}

pub fn method171(v0: Uh22, v1: Uh13) -> Uh13 {
    case v0  {
        Uh22Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method171(v8, v1)
            Uh13Cons(v4, v9)
        }
        Uh22Nil -> {
            v1
        }
    }
}

pub fn method172(v0: Int, v1: Uh13, v2: Uh13) -> Uh13 {
    case v1  {
        Uh13Cons(v3, v4) -> {
            let v5 = method172(v0, v4, v2)
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

pub fn method174(v0: String, v1: Int, v2: Uh22, v3: Uh22) -> Uh22 {
    case v2  {
        Uh22Cons(v4, v5, v6, v7, v8, v9, v10) -> {
            let v11 = method174(v0, v1, v10, v3)
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
                    Uh22Cons(v4, v5, v6, v7, v8, v9, v11)
                }
                False -> {
                    v11
                }
            }
        }
        Uh22Nil -> {
            v3
        }
    }
}

pub fn method175(v0: String, v1: Int, v2: Uh24, v3: Uh24) -> Uh24 {
    case v2  {
        Uh24Cons(v4, v5, v6) -> {
            let v7 = method175(v0, v1, v6, v3)
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
                    Uh24Cons(v4, v5, v7)
                }
                False -> {
                    v7
                }
            }
        }
        Uh24Nil -> {
            v3
        }
    }
}

pub fn method173(v0: String, v1: Uh13, v2: Int, v3: Int, v4: Uh22, v5: Uh24, v6: Uh25, v7: Us26, v8: Uh26, v9: Uh26) -> #(Int, Int, Uh22, Uh24, Uh25, Us26, Uh26, Uh26) {
    let #(v32, v33, v34, v35, v36, v37, v38, v39) =
        case v1  {
            Uh13Cons(v10, v11) -> {
                let v12 = Uh22Nil
                let v13 = method174(v0, v10, v4, v12)
                let v14 = Uh24Nil
                let v15 = method175(v0, v10, v5, v14)
                method173(v0, v11, v2, v3, v13, v15, v6, v7, v8, v9)
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

pub fn method178(v0: Uh23, v1: Uh23) -> Uh23 {
    case v0  {
        Uh23Cons(v2, v3, v4, v5) -> {
            let v6 = method178(v5, v1)
            Uh23Cons(v2, v3, v4, v6)
        }
        Uh23Nil -> {
            v1
        }
    }
}

pub fn method177(v0: String, v1: Int, v2: String, v3: Int, v4: String, v5: Int, v6: Uh22, v7: Uh22) -> Uh22 {
    case v6  {
        Uh22Cons(v8, v9, v10, v11, v12, v13, v14) -> {
            let v15 = method177(v0, v1, v2, v3, v4, v5, v14, v7)
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
                        let v19 = Uh23Nil
                        let v20 = Uh23Cons(v2, v3, v4, v19)
                        let v21 = method178(v13, v20)
                        #(v8, v9, v10, v5, v12, v21)
                    }
                    False -> {
                        #(v8, v9, v10, v11, v12, v13)
                    }
                }
            Uh22Cons(v22, v23, v24, v25, v26, v27, v15)
        }
        Uh22Nil -> {
            v7
        }
    }
}
