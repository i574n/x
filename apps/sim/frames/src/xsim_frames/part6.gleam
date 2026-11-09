import gleam/int
import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Uh7, type Uh8, type Uh10, type Uh13, type Uh17, type Uh19, type Uh20, type Us25, type Uh21, type Us26, type Uh23, type Uh22, type Uh24, type Uh25, type Uh26, type Us27, type Us28, Uh10Cons, Uh10Nil, Uh13Cons, Uh13Nil, Uh17Cons, Uh17Nil, Uh18Cons, Uh18Nil, Uh19Cons, Uh19Nil, Uh20Cons, Uh20Nil, Uh21Cons, Uh21Nil, Uh22Cons, Uh22Nil, Uh23Cons, Uh23Nil, Uh24Cons, Uh24Nil, Uh25Cons, Uh25Nil, Uh3Cons, Uh3Nil, Uh7Nil, Uh8Nil, Us16Content, Us16Reaction, Us16Revision, Us17Framed, Us17Posted, Us18Deleted, Us18Edited, Us18FrameEdited, Us19Liked, Us19Unliked, Us24None, Us24Some, Us25None, Us25Some, Us26None, Us26Some, Us27None, Us27Some, Us28None, Us28Some, Us2None, Us2Some}
import xsim_frames/part1.{method18, method4, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part2.{delimited_21, method20}
import xsim_frames/part3.{method51, method52, method54, method55, method60, method79}
import xsim_frames/part4.{from_corpus_61, method105, method96}
import xsim_frames/part5.{closure16, deliveries_129, method140, method142, method143, method144, method145, stream_115}

pub fn method139(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: Int, v2: Uh10, v3: Uh10, v4: Uh17) -> #(Uh10, Uh17) {
    let #(v68, v69) =
        case v2  {
            Uh10Cons(v5, v6) -> {
                let #(v62, v63) =
                    case v5  {
                        Us16Content(v7) -> {
                            case v7  {
                                Us17Posted(v8, v9, v10) -> {
                                    let v11 = v0(v8)
                                    let v12 = v11(v1)
                                    let v13 = v12(v10)
                                    let v23 =
                                        case v13  {
                                            Uh3Nil -> {
                                                Uh18Cons(1, 1, "", Uh18Nil)
                                            }
                                            _ -> {
                                                let v18 = method20(v13, 0)
                                                let #(v21, _v22) = method140(v18, v13, Uh18Nil, 1)
                                                v21
                                            }
                                        }
                                    let v25 = method142(v8, v9, v10, v23, Uh10Nil)
                                    let v26 = method143(v25, v3)
                                    #(v26, v4)
                                }
                                _ -> {
                                    let v27 = Uh10Cons(v5, v3)
                                    #(v27, v4)
                                }
                            }
                        }
                        _ -> {
                            let #(v60, v61) =
                                case v5  {
                                    Us16Revision(v30) -> {
                                        case v30  {
                                            Us18Edited(v31, v32) -> {
                                                let v33 = method144(v31, v4)
                                                let v37 =
                                                    case v33  {
                                                        Us24None -> 0
                                                        Us24Some(v34, v35) -> v35
                                                    }
                                                let v38 = spiral_wrap_signed(v37 + 1, 32)
                                                let v39 = v0(v31)
                                                let v40 = v39(v1)
                                                let v41 = v40(v32)
                                                let v51 =
                                                    case v41  {
                                                        Uh3Nil -> {
                                                            Uh18Cons(1, 1, "", Uh18Nil)
                                                        }
                                                        _ -> {
                                                            let v46 = method20(v41, 0)
                                                            let #(v49, _v50) = method140(v46, v41, Uh18Nil, 1)
                                                            v49
                                                        }
                                                    }
                                                let v53 = method145(v38, v31, v32, v51, Uh10Nil)
                                                let v54 = method143(v53, v3)
                                                let v55 = Uh17Cons(v31, v38, v4)
                                                #(v54, v55)
                                            }
                                            _ -> {
                                                let v56 = Uh10Cons(v5, v3)
                                                #(v56, v4)
                                            }
                                        }
                                    }
                                    _ -> {
                                        let v59 = Uh10Cons(v5, v3)
                                        #(v59, v4)
                                    }
                                }
                            #(v60, v61)
                        }
                    }
                method139(v0, v1, v6, v62, v63)
            }
            _ -> {
                let #(v66, v67) =
                    case v2  {
                        Uh10Nil -> #(v3, v4)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v66, v67)
            }
        }
    #(v68, v69)
}

pub fn exploded_138(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: Int, v2: Uh10) -> Uh10 {
    let #(v5, _v6) = method139(v0, v1, v2, Uh10Nil, Uh17Nil)
    method105(v5, Uh10Nil)
}

pub fn corpus_run_137(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh7, v6: Bool, v7: Bool, v8: Int, v9: Int, v10: fn(String) -> fn(Int) -> fn(String) -> Uh3, v11: Uh8) -> #(String, Int, Int, Uh3) {
    let #(v12, v13, v14) = from_corpus_61(v0, v1, v2, v3, v4, v5, v6, v11)
    let v17 =
        case v7 {
            True -> {
                exploded_138(v10, 280, v13)
            }
            False -> v13
        }
    let v19 = deliveries_129(v17, v8, v9, 6)
    let v20 = stream_115(v19)
    let v22 = method79(v12, 0)
    let v24 = method96(v17, 0)
    #(v20, v22, v24, v14)
}

pub fn closure15(capt: Nil) -> fn(#(String, Int, Int, Int, Int, Int, String, Bool, Int, Int)) -> #(String, Int, Int, String) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9) = dom
        let v11 = "+"
        let v12 = v6 |> string.replace(",", v11)
        let v13 = v12 == ""
        let v16 =
            case v13 {
                True -> Uh3Nil
                False -> split_list_2(v11, v12)
            }
        let v18 = method54(v16, Uh3Nil)
        let v20 = method55(v18, Uh7Nil)
        let v22 = closure16(Nil)
        let v23 = unicode_erlang_characters_to_binary([1])
        let v24 = split_list_2(v23, v0)
        let v25 = unicode_erlang_characters_to_binary([0])
        let v27 = method60(v25, v24, Uh8Nil)
        let #(v28, v29, v30, v31) = corpus_run_137(v1, v2, v3, v4, v5, v20, False, v7, v8, v9, v22, v27)
        let v32 = unicode_erlang_characters_to_binary([0])
        let v33 = delimited_21(v32, v31)
        #(v28, v29, v30, v33)
    }
}

pub fn method149(v0: Uh19, v1: Uh19) -> Uh19 {
    case v0  {
        Uh19Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method149(v6, v1)
            Uh19Cons(v2, v3, v4, v5, v7)
        }
        Uh19Nil -> v1
    }
}

pub fn method150(v0: String, v1: String, v2: Uh19, v3: Uh19) -> Uh19 {
    case v2  {
        Uh19Cons(v4, v5, v6, v7, v8) -> {
            let v9 = method150(v0, v1, v8, v3)
            let v10 = v4 == v0
            let #(v22, v23, v24, v25) =
                case v10 {
                    True -> {
                        let v15 =
                            case v6  {
                                Uh3Cons(v11, v12) -> v11
                                Uh3Nil -> {
                                    ""
                                }
                            }
                        let v16 = v15 == v1
                        let #(v18, v19, v20, v21) =
                            case v16 {
                                True -> #(v4, v5, v6, v7)
                                False -> {
                                    let v17 = Uh3Cons(v1, v6)
                                    #(v4, v5, v17, v7)
                                }
                            }
                        #(v18, v19, v20, v21)
                    }
                    False -> #(v4, v5, v6, v7)
                }
            Uh19Cons(v22, v23, v24, v25, v9)
        }
        Uh19Nil -> v3
    }
}

pub fn method151(v0: String, v1: Uh19, v2: Uh19) -> Uh19 {
    case v1  {
        Uh19Cons(v3, v4, v5, v6, v7) -> {
            let v8 = method151(v0, v7, v2)
            let v9 = v3 == v0
            let #(v10, v11, v12, v13) =
                case v9 {
                    True -> #(v3, v4, v5, True)
                    False -> #(v3, v4, v5, v6)
                }
            Uh19Cons(v10, v11, v12, v13, v8)
        }
        Uh19Nil -> v2
    }
}

pub fn closure20(capt: #(String)) -> fn(#(String, Uh3)) -> Bool {
    fn (dom) {
        let #(v1, _v2) = dom
        let #(v0) = capt
        v1 == v0
    }
}

pub fn method152(v0: String) -> fn(#(String, Uh3)) -> Bool {
    closure20(#(v0))
}

pub fn method153(v0: String, v1: fn(#(String, Uh3)) -> Bool, v2: Uh20) -> Bool {
    case v2  {
        Uh20Cons(v3, v4, v5) -> {
            let v6 = v1(#(v3, v4))
            case v6 {
                True -> True
                False -> {
                    let v7 = method152(v0)
                    method153(v0, v7, v5)
                }
            }
        }
        Uh20Nil -> False
    }
}

pub fn method154(v0: String, v1: String, v2: Uh20, v3: Uh20) -> Uh20 {
    case v2  {
        Uh20Cons(v4, v5, v6) -> {
            let v7 = method154(v0, v1, v6, v3)
            let v8 = v4 == v0
            let #(v15, v16) =
                case v8 {
                    True -> {
                        let v9 = method51(v1)
                        let v10 = method52(v1, v9, v5)
                        let v14 =
                            case v10 {
                                True -> v5
                                False -> {
                                    let v12 = Uh3Cons(v1, Uh3Nil)
                                    method18(v5, v12)
                                }
                            }
                        #(v4, v14)
                    }
                    False -> #(v4, v5)
                }
            Uh20Cons(v15, v16, v7)
        }
        Uh20Nil -> v3
    }
}

pub fn method155(v0: Uh20, v1: Uh20) -> Uh20 {
    case v0  {
        Uh20Cons(v2, v3, v4) -> {
            let v5 = method155(v4, v1)
            Uh20Cons(v2, v3, v5)
        }
        Uh20Nil -> v1
    }
}

pub fn method157(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method157(v0, v4, v2)
            let v6 = v0 != v3
            case v6 {
                True -> Uh3Cons(v3, v5)
                False -> v5
            }
        }
        Uh3Nil -> v2
    }
}

pub fn method156(v0: String, v1: String, v2: Uh20, v3: Uh20) -> Uh20 {
    case v2  {
        Uh20Cons(v4, v5, v6) -> {
            let v7 = method156(v0, v1, v6, v3)
            let v8 = v4 == v0
            let #(v11, v12) =
                case v8 {
                    True -> {
                        let v10 = method157(v1, v5, Uh3Nil)
                        #(v4, v10)
                    }
                    False -> #(v4, v5)
                }
            Uh20Cons(v11, v12, v7)
        }
        Uh20Nil -> v3
    }
}

pub fn method148(v0: Uh10, v1: Uh19, v2: Uh20) -> #(Uh19, Uh20) {
    let #(v83, v84) =
        case v0  {
            Uh10Cons(v3, v4) -> {
                let #(v77, v78) =
                    case v3  {
                        Us16Content(v5) -> {
                            case v5  {
                                Us17Posted(v6, v7, v8) -> {
                                    let v10 = Uh3Cons(v8, Uh3Nil)
                                    let v13 = Uh19Cons(v6, v7, v10, False, Uh19Nil)
                                    let v14 = method149(v1, v13)
                                    #(v14, v2)
                                }
                                _ -> {
                                    let #(v20, v21) =
                                        case v5  {
                                            Us17Framed(v15, v16, v17, v18, v19) -> #(v1, v2)
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
                                                let v28 = method150(v25, v26, v1, Uh19Nil)
                                                #(v28, v2)
                                            }
                                            _ -> {
                                                let #(v39, v40) =
                                                    case v24  {
                                                        Us18Deleted(v29) -> {
                                                            let v31 = method151(v29, v1, Uh19Nil)
                                                            #(v31, v2)
                                                        }
                                                        _ -> {
                                                            let #(v37, v38) =
                                                                case v24  {
                                                                    Us18FrameEdited(v32, v33, v34, v35, v36) -> #(v1, v2)
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
                                                            let v46 = method152(v44)
                                                            let v47 = method153(v44, v46, v2)
                                                            case v47 {
                                                                True -> {
                                                                    let v49 = method154(v44, v45, v2, Uh20Nil)
                                                                    #(v1, v49)
                                                                }
                                                                False -> {
                                                                    let v51 = Uh3Cons(v45, Uh3Nil)
                                                                    let v53 = Uh20Cons(v44, v51, Uh20Nil)
                                                                    let v54 = method155(v2, v53)
                                                                    #(v1, v54)
                                                                }
                                                            }
                                                        }
                                                        _ -> {
                                                            let #(v69, v70) =
                                                                case v43  {
                                                                    Us19Unliked(v57, v58) -> {
                                                                        let v59 = method152(v57)
                                                                        let v60 = method153(v57, v59, v2)
                                                                        case v60 {
                                                                            True -> {
                                                                                let v62 = method156(v57, v58, v2, Uh20Nil)
                                                                                #(v1, v62)
                                                                            }
                                                                            False -> {
                                                                                let v65 = Uh20Cons(v57, Uh3Nil, Uh20Nil)
                                                                                let v66 = method155(v2, v65)
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
                method148(v4, v77, v78)
            }
            _ -> {
                let #(v81, v82) =
                    case v0  {
                        Uh10Nil -> #(v1, v2)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v81, v82)
            }
        }
    #(v83, v84)
}

pub fn final_replay_147(v0: Uh10) -> #(Uh19, Uh20) {
    let #(v3, v4) = method148(v0, Uh19Nil, Uh20Nil)
    #(v3, v4)
}

pub fn method158(v0: Uh19, v1: Uh19) -> Uh19 {
    case v0  {
        Uh19Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method158(v6, v1)
            let v8 = v5 == False
            case v8 {
                True -> Uh19Cons(v2, v3, v4, v5, v7)
                False -> v7
            }
        }
        Uh19Nil -> v1
    }
}

pub fn method159(v0: Uh19, v1: Uh21) -> Uh21 {
    case v0  {
        Uh19Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method159(v6, v1)
            let v12 =
                case v3  {
                    Us2None -> Us25None
                    Us2Some(v8) -> Us25Some(v8)
                }
            let v14 = method4(v4, Uh3Nil)
            Uh21Cons(v2, v12, v14, v7)
        }
        Uh19Nil -> v1
    }
}

pub fn closure21(capt: Nil) -> fn(Int) -> Bool {
    fn (v0) {
        let v1 = v0 >= 9
        let v3 =
            case v1 {
                True -> {
                    v0 <= 13
                }
                False -> False
            }
        let v5 =
            case v3 {
                True -> True
                False -> {
                    v0 == 32
                }
            }
        let v7 =
            case v5 {
                True -> True
                False -> {
                    v0 == 133
                }
            }
        let v9 =
            case v7 {
                True -> True
                False -> {
                    v0 == 160
                }
            }
        let v11 =
            case v9 {
                True -> True
                False -> {
                    v0 == 5760
                }
            }
        let v15 =
            case v11 {
                True -> True
                False -> {
                    let v12 = v0 >= 8192
                    case v12 {
                        True -> {
                            v0 <= 8202
                        }
                        False -> False
                    }
                }
            }
        let v17 =
            case v15 {
                True -> True
                False -> {
                    v0 == 8232
                }
            }
        let v19 =
            case v17 {
                True -> True
                False -> {
                    v0 == 8233
                }
            }
        let v21 =
            case v19 {
                True -> True
                False -> {
                    v0 == 8239
                }
            }
        let v23 =
            case v21 {
                True -> True
                False -> {
                    v0 == 8287
                }
            }
        let v25 =
            case v23 {
                True -> True
                False -> {
                    v0 == 12288
                }
            }
        v25 == False
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
            let listm_fold = v5 |> list.fold (Uh13Nil, fn (acc, x) {
            let v7 = x
            let v8 = string.utf_codepoint_to_int(v7)
            let v9 = acc
            Uh13Cons(v8, v9)
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
                        v6 == v1
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
            let v38 = blank_tail_length_163(v36, 0)
            let v39 = spiral_wrap_signed(v27 - v38, 32)
            let v40 = spiral_wrap_signed(v39 - 1, 32)
            let v41 = spiral_string_slice(v26, 0, v40)
            let v42 = v13 == 1
            let v66 =
                case v42 {
                    True -> {
                        case v1  {
                            Us25None -> Us26None
                            Us25Some(v43) -> {
                                let v44 = method166(v43, v9)
                                case v44  {
                                    Us27None -> Us26None
                                    Us27Some(v45, v46) -> Us26Some(v46)
                                }
                            }
                        }
                    }
                    False -> {
                        let v54 = spiral_wrap_signed(v13 - 1, 32)
                        let v55 = method167(v0, v54, v7)
                        case v55  {
                            Us28None -> Us26None
                            Us28Some(v56, v57, v58, v59, v60, v61) -> Us26Some(v56)
                        }
                    }
                }
            let v68 = Uh23Cons(v17, v18, v41, Uh23Nil)
            let v70 = Uh22Cons(v17, v0, v13, v3, v66, v68, Uh22Nil)
            let v71 = method168(v7, v70)
            let v73 = Uh24Cons(v0, v13, Uh24Nil)
            let v74 = method169(v8, v73)
            let #(v85, v86, v87, v88, v89, v90, v91, v92) =
                case v10  {
                    Us26Some(v75) -> #(v16, v18, v71, v74, v9, v10, v11, v12)
                    _ -> {
                        let #(v77, v78, v79, v80, v81, v82, v83, v84) =
                            case v10  {
                                Us26None -> {
                                    let v76 = Us26Some(v17)
                                    #(v16, v18, v71, v74, v9, v76, v11, v12)
                                }
                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                            }
                        #(v77, v78, v79, v80, v81, v82, v83, v84)
                    }
                }
            let v94 = method170(v0, v89, Uh25Nil)
            let v95 = spiral_wrap_signed(v13 + 1, 32)
            let v96 = Uh25Cons(v0, v17, v94)
            method162(v0, v1, v2, v3, v15, v85, v86, v87, v88, v96, v90, v91, v92, v95)
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
                            ""
                        }
                    }
                let v19 = v0(v10)
                let v20 = v19(280)
                let v21 = v20(v18)
                let v23 = method20(v21, 0)
                let #(v25, v26, v27, v28, v29, v30, v31, v32, _v33) = method162(v10, v11, v12, v23, v21, v2, v3, v4, v5, v6, v7, v8, v9, 1)
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
                        v6 != v1
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
                        v5 != v1
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
                let v13 = method177(v0, v10, v4, Uh22Nil)
                let v15 = method178(v0, v10, v5, Uh24Nil)
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
                        v10 == v1
                    }
                    False -> False
                }
            let #(v22, v23, v24, v25, v26, v27) =
                case v18 {
                    True -> {
                        let v20 = Uh23Cons(v2, v3, v4, Uh23Nil)
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
