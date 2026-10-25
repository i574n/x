import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Us0, type Uh7, type Uh8, type Uh10, type Uh17, type Uh18, type Uh19, type Us24, type Uh20, type Uh21, type Uh22, type Uh23, type Uh25, type Uh26, type Us27, type Us28, Global, Uh10Cons, Uh10Nil, Uh17Cons, Uh17Nil, Uh18Cons, Uh18Nil, Uh19Cons, Uh19Nil, Uh20Cons, Uh20Nil, Uh21Cons, Uh21Nil, Uh22Cons, Uh23Cons, Uh23Nil, Uh25Cons, Uh25Nil, Uh26Cons, Uh26Nil, Uh3Cons, Uh3Nil, Uh7Nil, Uh8Nil, Us0None, Us0Some, Us16Content, Us16Reaction, Us16Revision, Us17Framed, Us17Posted, Us18Deleted, Us18Edited, Us18FrameEdited, Us19Liked, Us19Unliked, Us24None, Us24Some, Us25None, Us25Some, Us27None, Us27Some, Us28None, Us28Some}
import xsim_frames/part1.{spiral_string_length, spiral_wrap_signed, split_on_2, unicode_erlang_characters_to_binary, unicode_erlang_nfc, x_binary_split, x_light, x_spaced}
import xsim_frames/part2.{concat_balanced_20, delimited_19, method15, method17, method18}
import xsim_frames/part4.{listed_pieces_58, method49, method50, method52, method53, method59, method78}
import xsim_frames/part5.{method104, method95}
import xsim_frames/part6.{from_corpus_60, stream_114}
import xsim_frames/part7.{closure17, closure18, deliveries_127, method141, method146, method147, taken_while_145, units_of_139}

pub fn split_point_144(v0: Uh18) -> #(Uh18, Uh18) {
    let v1 = closure17(Nil)
    let v2 = Uh18Nil
    let #(v3, v4) = taken_while_145(v1, v0, v2)
    let v5 = closure18(Nil)
    let v6 = Uh18Nil
    let #(v7, v8) = taken_while_145(v5, v4, v6)
    let v9 =
        case v8  {
            Uh18Nil -> {
                False
            }
            _ -> {
                True
            }
        }
    let v16 =
        case v9 {
            True -> {
                let v10 = 0
                let v11 = method146(v3, v10)
                let v12 = 0
                let v13 = method146(v7, v12)
                let v14 = spiral_wrap_signed(v11 + v13, 32)
                let v15 = v14 <= 60
                v15
            }
            False -> {
                False
            }
        }
    case v16 {
        True -> {
            let v17 = method147(v3, v7)
            #(v17, v8)
        }
        False -> {
            let v18 = Uh18Nil
            let #(v19, v20) = taken_while_145(v5, v0, v18)
            let v21 =
                case v20  {
                    Uh18Nil -> {
                        False
                    }
                    _ -> {
                        True
                    }
                }
            case v21 {
                True -> {
                    #(v19, v20)
                }
                False -> {
                    let v22 = Uh18Nil
                    #(v22, v0)
                }
            }
        }
    }
}

pub fn method148(v0: Uh18, v1: Uh3) -> Uh3 {
    case v0  {
        Uh18Cons(v2, v3, v4) -> {
            let v5 = method148(v4, v1)
            Uh3Cons(v2, v5)
        }
        Uh18Nil -> {
            v1
        }
    }
}

pub fn chunk_143(v0: Int, v1: Uh18, v2: Uh18, v3: Int, v4: Uh3) -> Uh3 {
    case v1  {
        Uh18Cons(v15, v16, v17) -> {
            let v18 = spiral_wrap_signed(v3 + v16, 32)
            let v19 = v18 <= v0
            let v22 =
                case v19 {
                    True -> {
                        True
                    }
                    False -> {
                        let v20 =
                            case v2  {
                                Uh18Nil -> {
                                    False
                                }
                                _ -> {
                                    True
                                }
                            }
                        let v21 = v20 == False
                        v21
                    }
                }
            case v22 {
                True -> {
                    let v23 = Uh18Cons(v15, v16, v2)
                    chunk_143(v0, v17, v23, v18, v4)
                }
                False -> {
                    let #(v25, v26) = split_point_144(v2)
                    let v27 = Uh18Nil
                    let v28 = method141(v25, v27)
                    let v29 = method147(v28, v1)
                    let v37 =
                        case v26  {
                            Uh18Nil -> {
                                v4
                            }
                            _ -> {
                                let v30 = Uh18Nil
                                let v31 = method141(v26, v30)
                                let v32 = Uh3Nil
                                let v33 = method148(v31, v32)
                                let v34 = ""
                                let v35 = concat_balanced_20(v34, v33)
                                Uh3Cons(v35, v4)
                            }
                        }
                    let v38 = Uh18Nil
                    let v39 = 0
                    chunk_143(v0, v29, v38, v39, v37)
                }
            }
        }
        Uh18Nil -> {
            let v12 =
                case v2  {
                    Uh18Nil -> {
                        v4
                    }
                    _ -> {
                        let v5 = Uh18Nil
                        let v6 = method141(v2, v5)
                        let v7 = Uh3Nil
                        let v8 = method148(v6, v7)
                        let v9 = ""
                        let v10 = concat_balanced_20(v9, v8)
                        Uh3Cons(v10, v4)
                    }
                }
            let v13 = Uh3Nil
            method18(v12, v13)
        }
    }
}

pub fn chunks_of_142(v0: Int, v1: String, v2: Uh18, v3: Int) -> Uh3 {
    let v4 = " "
    let v5 = v1 <> v4 
    let v6 = string.inspect(v3)
    let v7 = v5 <> v6 
    let v8 = "/"
    let v9 = v7 <> v8 
    let v10 = string.inspect(v3)
    let v11 = v9 <> v10 
    let v12 = "\n"
    let v13 = v11 <> v12 
    let v14 = string.to_utf_codepoints(v13) |> list.fold(0, fn(sum, c) { sum + case x_light(string.utf_codepoint_to_int(c)) { True -> 1 False -> 2 } })
    let v15 = spiral_wrap_signed(v0 - v14, 32)
    let v16 = Uh18Nil
    let v17 = 0
    let v18 = Uh3Nil
    let v19 = chunk_143(v15, v2, v16, v17, v18)
    let v20 = 0
    let v21 = method17(v19, v20)
    let v22 = string.inspect(v21)
    let v23 = spiral_string_length(v22)
    let v24 = string.inspect(v3)
    let v25 = spiral_string_length(v24)
    let v26 = v23 > v25
    case v26 {
        True -> {
            chunks_of_142(v0, v1, v2, v21)
        }
        False -> {
            v19
        }
    }
}

pub fn split_cell_138(v0: String, v1: Int, v2: String) -> Uh3 {
    let v3 = unicode_erlang_nfc(v2)
    let v4 = units_of_139(v3)
    let v5 = 9
    chunks_of_142(v1, v0, v4, v5)
}

pub fn method150(v0: Uh19, v1: Uh19) -> Uh19 {
    case v0  {
        Uh19Cons(v2, v3, v4, v5) -> {
            let v6 = method150(v5, v1)
            Uh19Cons(v2, v3, v4, v6)
        }
        Uh19Nil -> {
            v1
        }
    }
}

pub fn method149(v0: Int, v1: Uh3, v2: Uh19, v3: Int) -> #(Uh19, Int) {
    case v1  {
        Uh3Cons(v4, v5) -> {
            let v6 = Uh19Nil
            let v7 = Uh19Cons(v3, v0, v4, v6)
            let v8 = method150(v2, v7)
            let v9 = spiral_wrap_signed(v3 + 1, 32)
            method149(v0, v5, v8, v9)
        }
        Uh3Nil -> {
            #(v2, v3)
        }
    }
}

pub fn method151(v0: String, v1: Us0, v2: String, v3: Uh19, v4: Uh10) -> Uh10 {
    case v3  {
        Uh19Cons(v5, v6, v7, v8) -> {
            let v9 = method151(v0, v1, v2, v8, v4)
            let v10 = Us17Framed(v0, v1, v5, v6, v7)
            let v11 = Us16Content(v10)
            Uh10Cons(v11, v9)
        }
        Uh19Nil -> {
            v4
        }
    }
}

pub fn method152(v0: Uh10, v1: Uh10) -> Uh10 {
    case v0  {
        Uh10Cons(v2, v3) -> {
            let v4 = Uh10Cons(v2, v1)
            method152(v3, v4)
        }
        Uh10Nil -> {
            v1
        }
    }
}

pub fn method153(v0: String, v1: Uh17) -> Us24 {
    case v1  {
        Uh17Cons(v3, v4, v5) -> {
            let v6 = v3 == v0
            case v6 {
                True -> {
                    Us24Some(v3, v4)
                }
                False -> {
                    method153(v0, v5)
                }
            }
        }
        Uh17Nil -> {
            Us24None
        }
    }
}

pub fn method154(v0: Int, v1: String, v2: String, v3: Uh19, v4: Uh10) -> Uh10 {
    case v3  {
        Uh19Cons(v5, v6, v7, v8) -> {
            let v9 = method154(v0, v1, v2, v8, v4)
            let v10 = Us18FrameEdited(v1, v0, v5, v6, v7)
            let v11 = Us16Revision(v10)
            Uh10Cons(v11, v9)
        }
        Uh19Nil -> {
            v4
        }
    }
}

pub fn method137(v0: Int, v1: Uh10, v2: Uh10, v3: Uh17) -> #(Uh10, Uh17) {
    let #(v63, v64) =
        case v1  {
            Uh10Cons(v4, v5) -> {
                let #(v57, v58) =
                    case v4  {
                        Us16Content(v6) -> {
                            case v6  {
                                Us17Posted(v7, v8, v9) -> {
                                    let v10 = split_cell_138(v7, v0, v9)
                                    let v20 =
                                        case v10  {
                                            Uh3Nil -> {
                                                let v11 = ""
                                                let v12 = Uh19Nil
                                                Uh19Cons(1, 1, v11, v12)
                                            }
                                            _ -> {
                                                let v14 = 0
                                                let v15 = method17(v10, v14)
                                                let v16 = Uh19Nil
                                                let v17 = 1
                                                let #(v18, _v19) = method149(v15, v10, v16, v17)
                                                v18
                                            }
                                        }
                                    let v21 = Uh10Nil
                                    let v22 = method151(v7, v8, v9, v20, v21)
                                    let v23 = method152(v22, v2)
                                    #(v23, v3)
                                }
                                _ -> {
                                    let v24 = Uh10Cons(v4, v2)
                                    #(v24, v3)
                                }
                            }
                        }
                        _ -> {
                            let #(v55, v56) =
                                case v4  {
                                    Us16Revision(v27) -> {
                                        case v27  {
                                            Us18Edited(v28, v29) -> {
                                                let v30 = method153(v28, v3)
                                                let v34 =
                                                    case v30  {
                                                        Us24None -> {
                                                            0
                                                        }
                                                        Us24Some(v31, v32) -> {
                                                            v32
                                                        }
                                                    }
                                                let v35 = spiral_wrap_signed(v34 + 1, 32)
                                                let v36 = split_cell_138(v28, v0, v29)
                                                let v46 =
                                                    case v36  {
                                                        Uh3Nil -> {
                                                            let v37 = ""
                                                            let v38 = Uh19Nil
                                                            Uh19Cons(1, 1, v37, v38)
                                                        }
                                                        _ -> {
                                                            let v40 = 0
                                                            let v41 = method17(v36, v40)
                                                            let v42 = Uh19Nil
                                                            let v43 = 1
                                                            let #(v44, _v45) = method149(v41, v36, v42, v43)
                                                            v44
                                                        }
                                                    }
                                                let v47 = Uh10Nil
                                                let v48 = method154(v35, v28, v29, v46, v47)
                                                let v49 = method152(v48, v2)
                                                let v50 = Uh17Cons(v28, v35, v3)
                                                #(v49, v50)
                                            }
                                            _ -> {
                                                let v51 = Uh10Cons(v4, v2)
                                                #(v51, v3)
                                            }
                                        }
                                    }
                                    _ -> {
                                        let v54 = Uh10Cons(v4, v2)
                                        #(v54, v3)
                                    }
                                }
                            #(v55, v56)
                        }
                    }
                method137(v0, v5, v57, v58)
            }
            _ -> {
                let #(v61, v62) =
                    case v1  {
                        Uh10Nil -> {
                            #(v2, v3)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v61, v62)
            }
        }
    #(v63, v64)
}

pub fn exploded_136(v0: Int, v1: Uh10) -> Uh10 {
    let v2 = Uh10Nil
    let v3 = Uh17Nil
    let #(v4, _v5) = method137(v0, v1, v2, v3)
    let v6 = Uh10Nil
    method104(v4, v6)
}

pub fn corpus_run_135(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh7, v6: Bool, v7: Bool, v8: Int, v9: Int, v10: Uh8) -> #(String, Int, Int, Uh3) {
    let #(v11, v12, v13) = from_corpus_60(v0, v1, v2, v3, v4, v5, v6, v10)
    let v16 =
        case v7 {
            True -> {
                let v14 = 280
                exploded_136(v14, v12)
            }
            False -> {
                v12
            }
        }
    let v17 = 6
    let v18 = deliveries_127(v16, v8, v9, v17)
    let v19 = stream_114(v18)
    let v20 = 0
    let v21 = method78(v11, v20)
    let v22 = 0
    let v23 = method95(v16, v22)
    #(v19, v21, v23, v13)
}

pub fn closure15(capt: Nil) -> fn(#(String, Int, Int, Int, Int, Int, String, Bool, Int, Int)) -> #(String, Int, Int, String) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9) = dom
        let v10 = ","
        let v11 = "+"
        let v12 = v6 |> string.replace(v10, v11)
        let v13 = v12 == ""
        let v16 =
            case v13 {
                True -> {
                    Uh3Nil
                }
                False -> {
                    split_on_2(v11, v12)
                }
            }
        let v17 = Uh3Nil
        let v18 = method52(v16, v17)
        let v19 = Uh7Nil
        let v20 = method53(v18, v19)
        let v21 = False
        let v22 = unicode_erlang_characters_to_binary([1])
        let v23 = x_binary_split(v0, v22, [Global])
        let v24 = Uh3Nil
        let v25 = listed_pieces_58(v23, v24)
        let v26 = unicode_erlang_characters_to_binary([0])
        let v27 = Uh8Nil
        let v28 = method59(v26, v25, v27)
        let #(v29, v30, v31, v32) = corpus_run_135(v1, v2, v3, v4, v5, v20, v21, v7, v8, v9, v28)
        let v33 = unicode_erlang_characters_to_binary([0])
        let v34 = delimited_19(v33, v32)
        #(v29, v30, v31, v34)
    }
}

pub fn method158(v0: Uh20, v1: Uh20) -> Uh20 {
    case v0  {
        Uh20Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method158(v6, v1)
            Uh20Cons(v2, v3, v4, v5, v7)
        }
        Uh20Nil -> {
            v1
        }
    }
}

pub fn method159(v0: String, v1: String, v2: Uh20, v3: Uh20) -> Uh20 {
    case v2  {
        Uh20Cons(v4, v5, v6, v7, v8) -> {
            let v9 = method159(v0, v1, v8, v3)
            let v10 = v4 == v0
            let #(v22, v23, v24, v25) =
                case v10 {
                    True -> {
                        let v15 =
                            case v6  {
                                Uh3Cons(v11, v12) -> {
                                    v11
                                }
                                Uh3Nil -> {
                                    let v13 = ""
                                    v13
                                }
                            }
                        let v16 = v15 == v1
                        let #(v18, v19, v20, v21) =
                            case v16 {
                                True -> {
                                    #(v4, v5, v6, v7)
                                }
                                False -> {
                                    let v17 = Uh3Cons(v1, v6)
                                    #(v4, v5, v17, v7)
                                }
                            }
                        #(v18, v19, v20, v21)
                    }
                    False -> {
                        #(v4, v5, v6, v7)
                    }
                }
            Uh20Cons(v22, v23, v24, v25, v9)
        }
        Uh20Nil -> {
            v3
        }
    }
}

pub fn method160(v0: String, v1: Uh20, v2: Uh20) -> Uh20 {
    case v1  {
        Uh20Cons(v3, v4, v5, v6, v7) -> {
            let v8 = method160(v0, v7, v2)
            let v9 = v3 == v0
            let #(v10, v11, v12, v13) =
                case v9 {
                    True -> {
                        #(v3, v4, v5, True)
                    }
                    False -> {
                        #(v3, v4, v5, v6)
                    }
                }
            Uh20Cons(v10, v11, v12, v13, v8)
        }
        Uh20Nil -> {
            v2
        }
    }
}

pub fn closure20(capt: #(String)) -> fn(#(String, Uh3)) -> Bool {
    fn (dom) {
        let #(v1, _v2) = dom
        let #(v0) = capt
        let v3 = v1 == v0
        v3
    }
}

pub fn method161(v0: String) -> fn(#(String, Uh3)) -> Bool {
    closure20(#(v0))
}

pub fn method162(v0: String, v1: fn(#(String, Uh3)) -> Bool, v2: Uh21) -> Bool {
    case v2  {
        Uh21Cons(v3, v4, v5) -> {
            let v6 = v1(#(v3, v4))
            case v6 {
                True -> {
                    True
                }
                False -> {
                    let v7 = method161(v0)
                    method162(v0, v7, v5)
                }
            }
        }
        Uh21Nil -> {
            False
        }
    }
}

pub fn method163(v0: String, v1: String, v2: Uh21, v3: Uh21) -> Uh21 {
    case v2  {
        Uh21Cons(v4, v5, v6) -> {
            let v7 = method163(v0, v1, v6, v3)
            let v8 = v4 == v0
            let #(v15, v16) =
                case v8 {
                    True -> {
                        let v9 = method49(v1)
                        let v10 = method50(v1, v9, v5)
                        let v14 =
                            case v10 {
                                True -> {
                                    v5
                                }
                                False -> {
                                    let v11 = Uh3Nil
                                    let v12 = Uh3Cons(v1, v11)
                                    method15(v5, v12)
                                }
                            }
                        #(v4, v14)
                    }
                    False -> {
                        #(v4, v5)
                    }
                }
            Uh21Cons(v15, v16, v7)
        }
        Uh21Nil -> {
            v3
        }
    }
}

pub fn method164(v0: Uh21, v1: Uh21) -> Uh21 {
    case v0  {
        Uh21Cons(v2, v3, v4) -> {
            let v5 = method164(v4, v1)
            Uh21Cons(v2, v3, v5)
        }
        Uh21Nil -> {
            v1
        }
    }
}

pub fn method166(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method166(v0, v4, v2)
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

pub fn method165(v0: String, v1: String, v2: Uh21, v3: Uh21) -> Uh21 {
    case v2  {
        Uh21Cons(v4, v5, v6) -> {
            let v7 = method165(v0, v1, v6, v3)
            let v8 = v4 == v0
            let #(v11, v12) =
                case v8 {
                    True -> {
                        let v9 = Uh3Nil
                        let v10 = method166(v1, v5, v9)
                        #(v4, v10)
                    }
                    False -> {
                        #(v4, v5)
                    }
                }
            Uh21Cons(v11, v12, v7)
        }
        Uh21Nil -> {
            v3
        }
    }
}

pub fn method157(v0: Uh10, v1: Uh20, v2: Uh21) -> #(Uh20, Uh21) {
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
                                    let v12 = Uh20Nil
                                    let v13 = Uh20Cons(v6, v7, v10, v11, v12)
                                    let v14 = method158(v1, v13)
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
                                                let v27 = Uh20Nil
                                                let v28 = method159(v25, v26, v1, v27)
                                                #(v28, v2)
                                            }
                                            _ -> {
                                                let #(v39, v40) =
                                                    case v24  {
                                                        Us18Deleted(v29) -> {
                                                            let v30 = Uh20Nil
                                                            let v31 = method160(v29, v1, v30)
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
                                                            let v46 = method161(v44)
                                                            let v47 = method162(v44, v46, v2)
                                                            case v47 {
                                                                True -> {
                                                                    let v48 = Uh21Nil
                                                                    let v49 = method163(v44, v45, v2, v48)
                                                                    #(v1, v49)
                                                                }
                                                                False -> {
                                                                    let v50 = Uh3Nil
                                                                    let v51 = Uh3Cons(v45, v50)
                                                                    let v52 = Uh21Nil
                                                                    let v53 = Uh21Cons(v44, v51, v52)
                                                                    let v54 = method164(v2, v53)
                                                                    #(v1, v54)
                                                                }
                                                            }
                                                        }
                                                        _ -> {
                                                            let #(v69, v70) =
                                                                case v43  {
                                                                    Us19Unliked(v57, v58) -> {
                                                                        let v59 = method161(v57)
                                                                        let v60 = method162(v57, v59, v2)
                                                                        case v60 {
                                                                            True -> {
                                                                                let v61 = Uh21Nil
                                                                                let v62 = method165(v57, v58, v2, v61)
                                                                                #(v1, v62)
                                                                            }
                                                                            False -> {
                                                                                let v63 = Uh3Nil
                                                                                let v64 = Uh21Nil
                                                                                let v65 = Uh21Cons(v57, v63, v64)
                                                                                let v66 = method164(v2, v65)
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
                method157(v4, v77, v78)
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

pub fn final_replay_156(v0: Uh10) -> #(Uh20, Uh21) {
    let v1 = Uh20Nil
    let v2 = Uh21Nil
    let #(v3, v4) = method157(v0, v1, v2)
    #(v3, v4)
}

pub fn method167(v0: Uh20, v1: Uh20) -> Uh20 {
    case v0  {
        Uh20Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method167(v6, v1)
            let v8 = v5 == False
            case v8 {
                True -> {
                    Uh20Cons(v2, v3, v4, v5, v7)
                }
                False -> {
                    v7
                }
            }
        }
        Uh20Nil -> {
            v1
        }
    }
}

pub fn method168(v0: Uh20, v1: Uh22) -> Uh22 {
    case v0  {
        Uh20Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method168(v6, v1)
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
            Uh22Cons(v2, v12, v14, v7)
        }
        Uh20Nil -> {
            v1
        }
    }
}

pub fn without_blank_tail_172(v0: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v1, v2) -> {
            let v3 = string.to_utf_codepoints(v1) |> list.all(fn(c) { x_spaced(string.utf_codepoint_to_int(c)) })
            case v3 {
                True -> {
                    without_blank_tail_172(v2)
                }
                False -> {
                    v0
                }
            }
        }
        _ -> {
            v0
        }
    }
}

pub fn method173(v0: String, v1: Uh26) -> Us27 {
    case v1  {
        Uh26Cons(v3, v4, v5) -> {
            let v6 = v3 == v0
            case v6 {
                True -> {
                    Us27Some(v3, v4)
                }
                False -> {
                    method173(v0, v5)
                }
            }
        }
        Uh26Nil -> {
            Us27None
        }
    }
}

pub fn method174(v0: String, v1: Int, v2: Uh23) -> Us28 {
    case v2  {
        Uh23Cons(v4, v5, v6, v7, v8, v9, v10) -> {
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
                    method174(v0, v1, v10)
                }
            }
        }
        Uh23Nil -> {
            Us28None
        }
    }
}

pub fn method175(v0: Uh23, v1: Uh23) -> Uh23 {
    case v0  {
        Uh23Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method175(v8, v1)
            Uh23Cons(v2, v3, v4, v5, v6, v7, v9)
        }
        Uh23Nil -> {
            v1
        }
    }
}

pub fn method176(v0: Uh25, v1: Uh25) -> Uh25 {
    case v0  {
        Uh25Cons(v2, v3, v4) -> {
            let v5 = method176(v4, v1)
            Uh25Cons(v2, v3, v5)
        }
        Uh25Nil -> {
            v1
        }
    }
}

pub fn method177(v0: String, v1: Uh26, v2: Uh26) -> Uh26 {
    case v1  {
        Uh26Cons(v3, v4, v5) -> {
            let v6 = method177(v0, v5, v2)
            let v7 = v3 == v0
            let v8 = v7 == False
            case v8 {
                True -> {
                    Uh26Cons(v3, v4, v6)
                }
                False -> {
                    v6
                }
            }
        }
        Uh26Nil -> {
            v2
        }
    }
}
