import gleam/int
import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Uh8, type Uh9, type Uh11, type Uh14, type Uh18, type Uh20, type Uh21, type Us25, type Uh22, type Us26, type Uh24, type Uh23, type Uh25, type Uh26, type Uh27, type Us27, type Us28, Uh11Cons, Uh11Nil, Uh14Cons, Uh14Nil, Uh18Cons, Uh18Nil, Uh19Cons, Uh19Nil, Uh20Cons, Uh20Nil, Uh21Cons, Uh21Nil, Uh22Cons, Uh22Nil, Uh23Cons, Uh23Nil, Uh24Cons, Uh24Nil, Uh25Cons, Uh25Nil, Uh26Cons, Uh26Nil, Uh3Cons, Uh3Nil, Uh8Nil, Uh9Nil, Us16Content, Us16Reaction, Us16Revision, Us17Framed, Us17Posted, Us18Deleted, Us18Edited, Us18FrameEdited, Us19Liked, Us19Unliked, Us24None, Us24Some, Us25None, Us25Some, Us26None, Us26Some, Us27None, Us27Some, Us28None, Us28Some, Us2None, Us2Some}
import xsim_frames/part1.{method18, method4, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part2.{delimited_21, method20}
import xsim_frames/part3.{method53, method54, method56, method57, method62, method81}
import xsim_frames/part4.{from_corpus_63, method107, method98}
import xsim_frames/part5.{closure16, deliveries_131, method142, method144, method145, method146, method147, stream_117}

pub fn method141(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: Int, v2: Uh11, v3: Uh11, v4: Uh18) -> #(Uh11, Uh18) {
    let #(v68, v69) =
        case v2  {
            Uh11Cons(v5, v6) -> {
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
                                                Uh19Cons(1, 1, "", Uh19Nil)
                                            }
                                            _ -> {
                                                let v18 = method20(v13, 0)
                                                let #(v21, _v22) = method142(v18, v13, Uh19Nil, 1)
                                                v21
                                            }
                                        }
                                    let v25 = method144(v8, v9, v10, v23, Uh11Nil)
                                    let v26 = method145(v25, v3)
                                    #(v26, v4)
                                }
                                _ -> {
                                    let v27 = Uh11Cons(v5, v3)
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
                                                let v33 = method146(v31, v4)
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
                                                            Uh19Cons(1, 1, "", Uh19Nil)
                                                        }
                                                        _ -> {
                                                            let v46 = method20(v41, 0)
                                                            let #(v49, _v50) = method142(v46, v41, Uh19Nil, 1)
                                                            v49
                                                        }
                                                    }
                                                let v53 = method147(v38, v31, v32, v51, Uh11Nil)
                                                let v54 = method145(v53, v3)
                                                let v55 = Uh18Cons(v31, v38, v4)
                                                #(v54, v55)
                                            }
                                            _ -> {
                                                let v56 = Uh11Cons(v5, v3)
                                                #(v56, v4)
                                            }
                                        }
                                    }
                                    _ -> {
                                        let v59 = Uh11Cons(v5, v3)
                                        #(v59, v4)
                                    }
                                }
                            #(v60, v61)
                        }
                    }
                method141(v0, v1, v6, v62, v63)
            }
            _ -> {
                let #(v66, v67) =
                    case v2  {
                        Uh11Nil -> #(v3, v4)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v66, v67)
            }
        }
    #(v68, v69)
}

pub fn exploded_140(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: Int, v2: Uh11) -> Uh11 {
    let #(v5, _v6) = method141(v0, v1, v2, Uh11Nil, Uh18Nil)
    method107(v5, Uh11Nil)
}

pub fn corpus_run_139(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh8, v6: Bool, v7: Bool, v8: Int, v9: Int, v10: fn(String) -> fn(Int) -> fn(String) -> Uh3, v11: Uh9) -> #(String, Int, Int, Uh3) {
    let #(v12, v13, v14) = from_corpus_63(v0, v1, v2, v3, v4, v5, v6, v11)
    let v17 =
        case v7 {
            True -> {
                exploded_140(v10, 280, v13)
            }
            False -> v13
        }
    let v19 = deliveries_131(v17, v8, v9, 6)
    let v20 = stream_117(v19)
    let v22 = method81(v12, 0)
    let v24 = method98(v17, 0)
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
        let v18 = method56(v16, Uh3Nil)
        let v20 = method57(v18, Uh8Nil)
        let v22 = closure16(Nil)
        let v23 = unicode_erlang_characters_to_binary([1])
        let v24 = split_list_2(v23, v0)
        let v25 = unicode_erlang_characters_to_binary([0])
        let v27 = method62(v25, v24, Uh9Nil)
        let #(v28, v29, v30, v31) = corpus_run_139(v1, v2, v3, v4, v5, v20, False, v7, v8, v9, v22, v27)
        let v32 = unicode_erlang_characters_to_binary([0])
        let v33 = delimited_21(v32, v31)
        #(v28, v29, v30, v33)
    }
}

pub fn method151(v0: Uh20, v1: Uh20) -> Uh20 {
    case v0  {
        Uh20Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method151(v6, v1)
            Uh20Cons(v2, v3, v4, v5, v7)
        }
        Uh20Nil -> v1
    }
}

pub fn method152(v0: String, v1: String, v2: Uh20, v3: Uh20) -> Uh20 {
    case v2  {
        Uh20Cons(v4, v5, v6, v7, v8) -> {
            let v9 = method152(v0, v1, v8, v3)
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
            Uh20Cons(v22, v23, v24, v25, v9)
        }
        Uh20Nil -> v3
    }
}

pub fn method153(v0: String, v1: Uh20, v2: Uh20) -> Uh20 {
    case v1  {
        Uh20Cons(v3, v4, v5, v6, v7) -> {
            let v8 = method153(v0, v7, v2)
            let v9 = v3 == v0
            let #(v10, v11, v12, v13) =
                case v9 {
                    True -> #(v3, v4, v5, True)
                    False -> #(v3, v4, v5, v6)
                }
            Uh20Cons(v10, v11, v12, v13, v8)
        }
        Uh20Nil -> v2
    }
}

pub fn closure20(capt: #(String)) -> fn(#(String, Uh3)) -> Bool {
    fn (dom) {
        let #(v1, _v2) = dom
        let #(v0) = capt
        v1 == v0
    }
}

pub fn method154(v0: String) -> fn(#(String, Uh3)) -> Bool {
    closure20(#(v0))
}

pub fn method155(v0: String, v1: fn(#(String, Uh3)) -> Bool, v2: Uh21) -> Bool {
    case v2  {
        Uh21Cons(v3, v4, v5) -> {
            let v6 = v1(#(v3, v4))
            case v6 {
                True -> True
                False -> {
                    let v7 = method154(v0)
                    method155(v0, v7, v5)
                }
            }
        }
        Uh21Nil -> False
    }
}

pub fn method156(v0: String, v1: String, v2: Uh21, v3: Uh21) -> Uh21 {
    case v2  {
        Uh21Cons(v4, v5, v6) -> {
            let v7 = method156(v0, v1, v6, v3)
            let v8 = v4 == v0
            let #(v15, v16) =
                case v8 {
                    True -> {
                        let v9 = method53(v1)
                        let v10 = method54(v1, v9, v5)
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
            Uh21Cons(v15, v16, v7)
        }
        Uh21Nil -> v3
    }
}

pub fn method157(v0: Uh21, v1: Uh21) -> Uh21 {
    case v0  {
        Uh21Cons(v2, v3, v4) -> {
            let v5 = method157(v4, v1)
            Uh21Cons(v2, v3, v5)
        }
        Uh21Nil -> v1
    }
}

pub fn method159(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method159(v0, v4, v2)
            let v6 = v0 != v3
            case v6 {
                True -> Uh3Cons(v3, v5)
                False -> v5
            }
        }
        Uh3Nil -> v2
    }
}

pub fn method158(v0: String, v1: String, v2: Uh21, v3: Uh21) -> Uh21 {
    case v2  {
        Uh21Cons(v4, v5, v6) -> {
            let v7 = method158(v0, v1, v6, v3)
            let v8 = v4 == v0
            let #(v11, v12) =
                case v8 {
                    True -> {
                        let v10 = method159(v1, v5, Uh3Nil)
                        #(v4, v10)
                    }
                    False -> #(v4, v5)
                }
            Uh21Cons(v11, v12, v7)
        }
        Uh21Nil -> v3
    }
}

pub fn method150(v0: Uh11, v1: Uh20, v2: Uh21) -> #(Uh20, Uh21) {
    let #(v83, v84) =
        case v0  {
            Uh11Cons(v3, v4) -> {
                let #(v77, v78) =
                    case v3  {
                        Us16Content(v5) -> {
                            case v5  {
                                Us17Posted(v6, v7, v8) -> {
                                    let v10 = Uh3Cons(v8, Uh3Nil)
                                    let v13 = Uh20Cons(v6, v7, v10, False, Uh20Nil)
                                    let v14 = method151(v1, v13)
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
                                                let v28 = method152(v25, v26, v1, Uh20Nil)
                                                #(v28, v2)
                                            }
                                            _ -> {
                                                let #(v39, v40) =
                                                    case v24  {
                                                        Us18Deleted(v29) -> {
                                                            let v31 = method153(v29, v1, Uh20Nil)
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
                                                            let v46 = method154(v44)
                                                            let v47 = method155(v44, v46, v2)
                                                            case v47 {
                                                                True -> {
                                                                    let v49 = method156(v44, v45, v2, Uh21Nil)
                                                                    #(v1, v49)
                                                                }
                                                                False -> {
                                                                    let v51 = Uh3Cons(v45, Uh3Nil)
                                                                    let v53 = Uh21Cons(v44, v51, Uh21Nil)
                                                                    let v54 = method157(v2, v53)
                                                                    #(v1, v54)
                                                                }
                                                            }
                                                        }
                                                        _ -> {
                                                            let #(v69, v70) =
                                                                case v43  {
                                                                    Us19Unliked(v57, v58) -> {
                                                                        let v59 = method154(v57)
                                                                        let v60 = method155(v57, v59, v2)
                                                                        case v60 {
                                                                            True -> {
                                                                                let v62 = method158(v57, v58, v2, Uh21Nil)
                                                                                #(v1, v62)
                                                                            }
                                                                            False -> {
                                                                                let v65 = Uh21Cons(v57, Uh3Nil, Uh21Nil)
                                                                                let v66 = method157(v2, v65)
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
                method150(v4, v77, v78)
            }
            _ -> {
                let #(v81, v82) =
                    case v0  {
                        Uh11Nil -> #(v1, v2)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v81, v82)
            }
        }
    #(v83, v84)
}

pub fn final_replay_149(v0: Uh11) -> #(Uh20, Uh21) {
    let #(v3, v4) = method150(v0, Uh20Nil, Uh21Nil)
    #(v3, v4)
}

pub fn method160(v0: Uh20, v1: Uh20) -> Uh20 {
    case v0  {
        Uh20Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method160(v6, v1)
            let v8 = v5 == False
            case v8 {
                True -> Uh20Cons(v2, v3, v4, v5, v7)
                False -> v7
            }
        }
        Uh20Nil -> v1
    }
}

pub fn method161(v0: Uh20, v1: Uh22) -> Uh22 {
    case v0  {
        Uh20Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method161(v6, v1)
            let v12 =
                case v3  {
                    Us2None -> Us25None
                    Us2Some(v8) -> Us25Some(v8)
                }
            let v14 = method4(v4, Uh3Nil)
            Uh22Cons(v2, v12, v14, v7)
        }
        Uh20Nil -> v1
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

pub fn method166() -> fn(Int) -> Bool {
    closure21(Nil)
}

pub fn method167(v0: fn(Int) -> Bool, v1: Uh14) -> Bool {
    case v1  {
        Uh14Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method166()
                    method167(v5, v3)
                }
            }
        }
        Uh14Nil -> False
    }
}

pub fn blank_tail_length_165(v0: Uh3, v1: Int) -> Int {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = string.to_utf_codepoints(v2)
            let v5 = v4 |> list.reverse
            let listm_fold = v5 |> list.fold (Uh14Nil, fn (acc, x) {
            let v7 = x
            let v8 = string.utf_codepoint_to_int(v7)
            let v9 = acc
            Uh14Cons(v8, v9)
            })
            let v11 = listm_fold
            let v12 = method166()
            let v13 = method167(v12, v11)
            let v14 = v13 == False
            case v14 {
                True -> {
                    let v15 = spiral_string_length(v2)
                    let v16 = spiral_wrap_signed(v1 + v15, 32)
                    blank_tail_length_165(v3, v16)
                }
                False -> v1
            }
        }
        _ -> v1
    }
}

pub fn method168(v0: String, v1: Uh26) -> Us27 {
    case v1  {
        Uh26Cons(v3, v4, v5) -> {
            let v6 = v3 == v0
            case v6 {
                True -> Us27Some(v3, v4)
                False -> method168(v0, v5)
            }
        }
        Uh26Nil -> Us27None
    }
}

pub fn method169(v0: String, v1: Int, v2: Uh23) -> Us28 {
    case v2  {
        Uh23Cons(v4, v5, v6, v7, v8, v9, v10) -> {
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
                False -> method169(v0, v1, v10)
            }
        }
        Uh23Nil -> Us28None
    }
}

pub fn method170(v0: Uh23, v1: Uh23) -> Uh23 {
    case v0  {
        Uh23Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method170(v8, v1)
            Uh23Cons(v2, v3, v4, v5, v6, v7, v9)
        }
        Uh23Nil -> v1
    }
}

pub fn method171(v0: Uh25, v1: Uh25) -> Uh25 {
    case v0  {
        Uh25Cons(v2, v3, v4) -> {
            let v5 = method171(v4, v1)
            Uh25Cons(v2, v3, v5)
        }
        Uh25Nil -> v1
    }
}

pub fn method172(v0: String, v1: Uh26, v2: Uh26) -> Uh26 {
    case v1  {
        Uh26Cons(v3, v4, v5) -> {
            let v6 = method172(v0, v5, v2)
            let v7 = v3 == v0
            let v8 = v7 == False
            case v8 {
                True -> Uh26Cons(v3, v4, v6)
                False -> v6
            }
        }
        Uh26Nil -> v2
    }
}

pub fn method164(v0: String, v1: Us25, v2: Uh3, v3: Int, v4: Uh3, v5: Int, v6: Int, v7: Uh23, v8: Uh25, v9: Uh26, v10: Us26, v11: Uh27, v12: Uh27, v13: Int) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27, Int) {
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
            let v42 = v13 == 1
            let v66 =
                case v42 {
                    True -> {
                        case v1  {
                            Us25None -> Us26None
                            Us25Some(v43) -> {
                                let v44 = method168(v43, v9)
                                case v44  {
                                    Us27None -> Us26None
                                    Us27Some(v45, v46) -> Us26Some(v46)
                                }
                            }
                        }
                    }
                    False -> {
                        let v54 = spiral_wrap_signed(v13 - 1, 32)
                        let v55 = method169(v0, v54, v7)
                        case v55  {
                            Us28None -> Us26None
                            Us28Some(v56, v57, v58, v59, v60, v61) -> Us26Some(v56)
                        }
                    }
                }
            let v68 = Uh24Cons(v17, v18, v41, Uh24Nil)
            let v70 = Uh23Cons(v17, v0, v13, v3, v66, v68, Uh23Nil)
            let v71 = method170(v7, v70)
            let v73 = Uh25Cons(v0, v13, Uh25Nil)
            let v74 = method171(v8, v73)
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
            let v94 = method172(v0, v89, Uh26Nil)
            let v95 = spiral_wrap_signed(v13 + 1, 32)
            let v96 = Uh26Cons(v0, v17, v94)
            method164(v0, v1, v2, v3, v15, v85, v86, v87, v88, v96, v90, v91, v92, v95)
        }
        Uh3Nil -> #(v5, v6, v7, v8, v9, v10, v11, v12, v13)
    }
}

pub fn method163(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: Uh22, v2: Int, v3: Int, v4: Uh23, v5: Uh25, v6: Uh26, v7: Us26, v8: Uh27, v9: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27) {
    let #(v50, v51, v52, v53, v54, v55, v56, v57) =
        case v1  {
            Uh22Cons(v10, v11, v12, v13) -> {
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
                let #(v25, v26, v27, v28, v29, v30, v31, v32, _v33) = method164(v10, v11, v12, v23, v21, v2, v3, v4, v5, v6, v7, v8, v9, 1)
                method163(v0, v13, v25, v26, v27, v28, v29, v30, v31, v32)
            }
            _ -> {
                let #(v42, v43, v44, v45, v46, v47, v48, v49) =
                    case v1  {
                        Uh22Nil -> #(v2, v3, v4, v5, v6, v7, v8, v9)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v42, v43, v44, v45, v46, v47, v48, v49)
            }
        }
    #(v50, v51, v52, v53, v54, v55, v56, v57)
}

pub fn method175(v0: String, v1: Uh23, v2: Uh23) -> Uh23 {
    case v1  {
        Uh23Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method175(v0, v9, v2)
            let v11 = v4 == v0
            case v11 {
                True -> Uh23Cons(v3, v4, v5, v6, v7, v8, v10)
                False -> v10
            }
        }
        Uh23Nil -> v2
    }
}

pub fn method176(v0: Uh23, v1: Uh14) -> Uh14 {
    case v0  {
        Uh23Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method176(v8, v1)
            Uh14Cons(v4, v9)
        }
        Uh23Nil -> v1
    }
}

pub fn method177(v0: Int, v1: Uh14, v2: Uh14) -> Uh14 {
    case v1  {
        Uh14Cons(v3, v4) -> {
            let v5 = method177(v0, v4, v2)
            let v6 = v3 > v0
            case v6 {
                True -> Uh14Cons(v3, v5)
                False -> v5
            }
        }
        Uh14Nil -> v2
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
                    True -> True
                    False -> {
                        v6 != v1
                    }
                }
            case v15 {
                True -> Uh23Cons(v4, v5, v6, v7, v8, v9, v11)
                False -> v11
            }
        }
        Uh23Nil -> v3
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
                    True -> True
                    False -> {
                        v5 != v1
                    }
                }
            case v11 {
                True -> Uh25Cons(v4, v5, v7)
                False -> v7
            }
        }
        Uh25Nil -> v3
    }
}

pub fn method178(v0: String, v1: Uh14, v2: Int, v3: Int, v4: Uh23, v5: Uh25, v6: Uh26, v7: Us26, v8: Uh27, v9: Uh27) -> #(Int, Int, Uh23, Uh25, Uh26, Us26, Uh27, Uh27) {
    let #(v32, v33, v34, v35, v36, v37, v38, v39) =
        case v1  {
            Uh14Cons(v10, v11) -> {
                let v13 = method179(v0, v10, v4, Uh23Nil)
                let v15 = method180(v0, v10, v5, Uh25Nil)
                method178(v0, v11, v2, v3, v13, v15, v6, v7, v8, v9)
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

pub fn method183(v0: Uh24, v1: Uh24) -> Uh24 {
    case v0  {
        Uh24Cons(v2, v3, v4, v5) -> {
            let v6 = method183(v5, v1)
            Uh24Cons(v2, v3, v4, v6)
        }
        Uh24Nil -> v1
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
                        v10 == v1
                    }
                    False -> False
                }
            let #(v22, v23, v24, v25, v26, v27) =
                case v18 {
                    True -> {
                        let v20 = Uh24Cons(v2, v3, v4, Uh24Nil)
                        let v21 = method183(v13, v20)
                        #(v8, v9, v10, v5, v12, v21)
                    }
                    False -> #(v8, v9, v10, v11, v12, v13)
                }
            Uh23Cons(v22, v23, v24, v25, v26, v27, v15)
        }
        Uh23Nil -> v7
    }
}
