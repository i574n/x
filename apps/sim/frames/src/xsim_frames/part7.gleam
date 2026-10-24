import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Us9, type Uh7, type Uh8, type Uh10, type Uh17, type Uh18, type Uh19, type Us20, type Uh20, type Uh21, type Us21, type Uh22, type Uh23, type Uh25, type Uh26, type Us24, type Us25, Global, Uh10Cons, Uh10Nil, Uh17Cons, Uh17Nil, Uh18Cons, Uh18Nil, Uh19Cons, Uh19Nil, Uh20Cons, Uh20Nil, Uh21Cons, Uh21Nil, Uh22Cons, Uh23Cons, Uh23Nil, Uh25Cons, Uh25Nil, Uh26Cons, Uh26Nil, Uh3Cons, Uh3Nil, Uh7Nil, Uh8Nil, Us12Content, Us12Reaction, Us12Revision, Us13Framed, Us13Posted, Us14Deleted, Us14Edited, Us14FrameEdited, Us15Liked, Us15Unliked, Us20None, Us20Some, Us21None, Us21Some, Us22None, Us22Some, Us24Some, Us25Some, Us9None, Us9Some}
import xsim_frames/part1.{erlang_nfc, method15, spiral_string_length, spiral_wrap_signed, split_on_2, x_binary_split, x_light, x_spaced}
import xsim_frames/part2.{concat_balanced_35, delimited_34, method37}
import xsim_frames/part3.{listed_pieces_52, method44, method46, method47, method53}
import xsim_frames/part4.{method72, method89}
import xsim_frames/part5.{from_corpus_54, method98, stream_108}
import xsim_frames/part6.{deliveries_121, method136, method142, method143, split_point_139, units_of_133}

pub fn chunk_138(v0: Int, v1: Uh18, v2: Uh18, v3: Int, v4: Uh3) -> Uh3 {
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
                    chunk_138(v0, v17, v23, v18, v4)
                }
                False -> {
                    let #(v25, v26) = split_point_139(v2)
                    let v27 = Uh18Nil
                    let v28 = method136(v25, v27)
                    let v29 = method142(v28, v1)
                    let v37 =
                        case v26  {
                            Uh18Nil -> {
                                v4
                            }
                            _ -> {
                                let v30 = Uh18Nil
                                let v31 = method136(v26, v30)
                                let v32 = Uh3Nil
                                let v33 = method143(v31, v32)
                                let v34 = ""
                                let v35 = concat_balanced_35(v34, v33)
                                Uh3Cons(v35, v4)
                            }
                        }
                    let v38 = Uh18Nil
                    let v39 = 0
                    chunk_138(v0, v29, v38, v39, v37)
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
                        let v6 = method136(v2, v5)
                        let v7 = Uh3Nil
                        let v8 = method143(v6, v7)
                        let v9 = ""
                        let v10 = concat_balanced_35(v9, v8)
                        Uh3Cons(v10, v4)
                    }
                }
            let v13 = Uh3Nil
            method37(v12, v13)
        }
    }
}

pub fn method144(v0: Uh3, v1: Int) -> Int {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method144(v3, v4)
        }
        Uh3Nil -> {
            v1
        }
    }
}

pub fn chunks_of_137(v0: Int, v1: String, v2: Uh18, v3: Int) -> Uh3 {
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
    let v19 = chunk_138(v15, v2, v16, v17, v18)
    let v20 = 0
    let v21 = method144(v19, v20)
    let v22 = string.inspect(v21)
    let v23 = spiral_string_length(v22)
    let v24 = string.inspect(v3)
    let v25 = spiral_string_length(v24)
    let v26 = v23 > v25
    case v26 {
        True -> {
            chunks_of_137(v0, v1, v2, v21)
        }
        False -> {
            v19
        }
    }
}

pub fn split_cell_132(v0: String, v1: Int, v2: String) -> Uh3 {
    let v3 = erlang_nfc(v2)
    let v4 = units_of_133(v3)
    let v5 = 9
    chunks_of_137(v1, v0, v4, v5)
}

pub fn method146(v0: Uh19, v1: Uh19) -> Uh19 {
    case v0  {
        Uh19Cons(v2, v3, v4, v5) -> {
            let v6 = method146(v5, v1)
            Uh19Cons(v2, v3, v4, v6)
        }
        Uh19Nil -> {
            v1
        }
    }
}

pub fn method145(v0: Int, v1: Uh3, v2: Uh19, v3: Int) -> #(Uh19, Int) {
    case v1  {
        Uh3Cons(v4, v5) -> {
            let v6 = Uh19Nil
            let v7 = Uh19Cons(v3, v0, v4, v6)
            let v8 = method146(v2, v7)
            let v9 = spiral_wrap_signed(v3 + 1, 32)
            method145(v0, v5, v8, v9)
        }
        Uh3Nil -> {
            #(v2, v3)
        }
    }
}

pub fn method147(v0: String, v1: Us9, v2: String, v3: Uh19, v4: Uh10) -> Uh10 {
    case v3  {
        Uh19Cons(v5, v6, v7, v8) -> {
            let v9 = method147(v0, v1, v2, v8, v4)
            let v10 = Us13Framed(v0, v1, v5, v6, v7)
            let v11 = Us12Content(v10)
            Uh10Cons(v11, v9)
        }
        Uh19Nil -> {
            v4
        }
    }
}

pub fn method148(v0: Uh10, v1: Uh10) -> Uh10 {
    case v0  {
        Uh10Cons(v2, v3) -> {
            let v4 = Uh10Cons(v2, v1)
            method148(v3, v4)
        }
        Uh10Nil -> {
            v1
        }
    }
}

pub fn method149(v0: String, v1: Uh17, v2: Us20) -> Us20 {
    case v1  {
        Uh17Cons(v3, v4, v5) -> {
            let v6 = method149(v0, v5, v2)
            let v7 = v3 == v0
            case v7 {
                True -> {
                    Us20Some(v3, v4)
                }
                False -> {
                    v6
                }
            }
        }
        Uh17Nil -> {
            v2
        }
    }
}

pub fn method150(v0: Int, v1: String, v2: String, v3: Uh19, v4: Uh10) -> Uh10 {
    case v3  {
        Uh19Cons(v5, v6, v7, v8) -> {
            let v9 = method150(v0, v1, v2, v8, v4)
            let v10 = Us14FrameEdited(v1, v0, v5, v6, v7)
            let v11 = Us12Revision(v10)
            Uh10Cons(v11, v9)
        }
        Uh19Nil -> {
            v4
        }
    }
}

pub fn method131(v0: Int, v1: Uh10, v2: Uh10, v3: Uh17) -> #(Uh10, Uh17) {
    let #(v64, v65) =
        case v1  {
            Uh10Cons(v4, v5) -> {
                let #(v58, v59) =
                    case v4  {
                        Us12Content(v6) -> {
                            case v6  {
                                Us13Posted(v7, v8, v9) -> {
                                    let v10 = split_cell_132(v7, v0, v9)
                                    let v20 =
                                        case v10  {
                                            Uh3Nil -> {
                                                let v11 = ""
                                                let v12 = Uh19Nil
                                                Uh19Cons(1, 1, v11, v12)
                                            }
                                            _ -> {
                                                let v14 = 0
                                                let v15 = method144(v10, v14)
                                                let v16 = Uh19Nil
                                                let v17 = 1
                                                let #(v18, _v19) = method145(v15, v10, v16, v17)
                                                v18
                                            }
                                        }
                                    let v21 = Uh10Nil
                                    let v22 = method147(v7, v8, v9, v20, v21)
                                    let v23 = method148(v22, v2)
                                    #(v23, v3)
                                }
                                _ -> {
                                    let v24 = Uh10Cons(v4, v2)
                                    #(v24, v3)
                                }
                            }
                        }
                        _ -> {
                            let #(v56, v57) =
                                case v4  {
                                    Us12Revision(v27) -> {
                                        case v27  {
                                            Us14Edited(v28, v29) -> {
                                                let v30 = Us20None
                                                let v31 = method149(v28, v3, v30)
                                                let v35 =
                                                    case v31  {
                                                        Us20None -> {
                                                            0
                                                        }
                                                        Us20Some(v32, v33) -> {
                                                            v33
                                                        }
                                                    }
                                                let v36 = spiral_wrap_signed(v35 + 1, 32)
                                                let v37 = split_cell_132(v28, v0, v29)
                                                let v47 =
                                                    case v37  {
                                                        Uh3Nil -> {
                                                            let v38 = ""
                                                            let v39 = Uh19Nil
                                                            Uh19Cons(1, 1, v38, v39)
                                                        }
                                                        _ -> {
                                                            let v41 = 0
                                                            let v42 = method144(v37, v41)
                                                            let v43 = Uh19Nil
                                                            let v44 = 1
                                                            let #(v45, _v46) = method145(v42, v37, v43, v44)
                                                            v45
                                                        }
                                                    }
                                                let v48 = Uh10Nil
                                                let v49 = method150(v36, v28, v29, v47, v48)
                                                let v50 = method148(v49, v2)
                                                let v51 = Uh17Cons(v28, v36, v3)
                                                #(v50, v51)
                                            }
                                            _ -> {
                                                let v52 = Uh10Cons(v4, v2)
                                                #(v52, v3)
                                            }
                                        }
                                    }
                                    _ -> {
                                        let v55 = Uh10Cons(v4, v2)
                                        #(v55, v3)
                                    }
                                }
                            #(v56, v57)
                        }
                    }
                method131(v0, v5, v58, v59)
            }
            _ -> {
                let #(v62, v63) =
                    case v1  {
                        Uh10Nil -> {
                            #(v2, v3)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v62, v63)
            }
        }
    #(v64, v65)
}

pub fn exploded_130(v0: Int, v1: Uh10) -> Uh10 {
    let v2 = Uh10Nil
    let v3 = Uh17Nil
    let #(v4, _v5) = method131(v0, v1, v2, v3)
    let v6 = Uh10Nil
    method98(v4, v6)
}

pub fn corpus_run_129(v0: Int, v1: Int, v2: Int, v3: Int, v4: Int, v5: Uh7, v6: Bool, v7: Bool, v8: Int, v9: Int, v10: Uh8) -> #(String, Int, Int, Uh3) {
    let #(v11, v12, v13) = from_corpus_54(v0, v1, v2, v3, v4, v5, v6, v10)
    let v16 =
        case v7 {
            True -> {
                let v14 = 280
                exploded_130(v14, v12)
            }
            False -> {
                v12
            }
        }
    let v17 = 6
    let v18 = deliveries_121(v16, v8, v9, v17)
    let v19 = stream_108(v18)
    let v20 = 0
    let v21 = method72(v11, v20)
    let v22 = 0
    let v23 = method89(v16, v22)
    #(v19, v21, v23, v13)
}

pub fn closure9(capt: Nil) -> fn(#(String, Int, Int, Int, Int, Int, String, Bool, Int, Int)) -> #(String, Int, Int, String) {
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
        let v18 = method46(v16, v17)
        let v19 = Uh7Nil
        let v20 = method47(v18, v19)
        let v21 = False
        let v22 = case string.utf_codepoint(1) { Ok(c) -> string.from_utf_codepoints([c]) Error(_) -> "" }
        let v23 = x_binary_split(v0, v22, [Global])
        let v24 = Uh3Nil
        let v25 = listed_pieces_52(v23, v24)
        let v26 = case string.utf_codepoint(0) { Ok(c) -> string.from_utf_codepoints([c]) Error(_) -> "" }
        let v27 = Uh8Nil
        let v28 = method53(v26, v25, v27)
        let #(v29, v30, v31, v32) = corpus_run_129(v1, v2, v3, v4, v5, v20, v21, v7, v8, v9, v28)
        let v33 = case string.utf_codepoint(0) { Ok(c) -> string.from_utf_codepoints([c]) Error(_) -> "" }
        let v34 = delimited_34(v33, v32)
        #(v29, v30, v31, v34)
    }
}

pub fn method154(v0: Uh20, v1: Uh20) -> Uh20 {
    case v0  {
        Uh20Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method154(v6, v1)
            Uh20Cons(v2, v3, v4, v5, v7)
        }
        Uh20Nil -> {
            v1
        }
    }
}

pub fn method155(v0: String, v1: String, v2: Uh20, v3: Uh20) -> Uh20 {
    case v2  {
        Uh20Cons(v4, v5, v6, v7, v8) -> {
            let v9 = method155(v0, v1, v8, v3)
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

pub fn method156(v0: String, v1: Uh20, v2: Uh20) -> Uh20 {
    case v1  {
        Uh20Cons(v3, v4, v5, v6, v7) -> {
            let v8 = method156(v0, v7, v2)
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

pub fn method157(v0: String, v1: Uh21, v2: Us21) -> Us21 {
    case v1  {
        Uh21Cons(v3, v4, v5) -> {
            let v6 = method157(v0, v5, v2)
            let v7 = v3 == v0
            case v7 {
                True -> {
                    Us21Some(v3, v4)
                }
                False -> {
                    v6
                }
            }
        }
        Uh21Nil -> {
            v2
        }
    }
}

pub fn method158(v0: String, v1: String, v2: Uh21, v3: Uh21) -> Uh21 {
    case v2  {
        Uh21Cons(v4, v5, v6) -> {
            let v7 = method158(v0, v1, v6, v3)
            let v8 = v4 == v0
            let #(v18, v19) =
                case v8 {
                    True -> {
                        let v9 = Us9None
                        let v10 = method44(v1, v5, v9)
                        let v13 =
                            case v10  {
                                Us9None -> {
                                    False
                                }
                                Us9Some(v11) -> {
                                    True
                                }
                            }
                        let v17 =
                            case v13 {
                                True -> {
                                    v5
                                }
                                False -> {
                                    let v14 = Uh3Nil
                                    let v15 = Uh3Cons(v1, v14)
                                    method15(v5, v15)
                                }
                            }
                        #(v4, v17)
                    }
                    False -> {
                        #(v4, v5)
                    }
                }
            Uh21Cons(v18, v19, v7)
        }
        Uh21Nil -> {
            v3
        }
    }
}

pub fn method159(v0: Uh21, v1: Uh21) -> Uh21 {
    case v0  {
        Uh21Cons(v2, v3, v4) -> {
            let v5 = method159(v4, v1)
            Uh21Cons(v2, v3, v5)
        }
        Uh21Nil -> {
            v1
        }
    }
}

pub fn method161(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method161(v0, v4, v2)
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

pub fn method160(v0: String, v1: String, v2: Uh21, v3: Uh21) -> Uh21 {
    case v2  {
        Uh21Cons(v4, v5, v6) -> {
            let v7 = method160(v0, v1, v6, v3)
            let v8 = v4 == v0
            let #(v11, v12) =
                case v8 {
                    True -> {
                        let v9 = Uh3Nil
                        let v10 = method161(v1, v5, v9)
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

pub fn method153(v0: Uh10, v1: Uh20, v2: Uh21) -> #(Uh20, Uh21) {
    let #(v91, v92) =
        case v0  {
            Uh10Cons(v3, v4) -> {
                let #(v85, v86) =
                    case v3  {
                        Us12Content(v5) -> {
                            case v5  {
                                Us13Posted(v6, v7, v8) -> {
                                    let v9 = Uh3Nil
                                    let v10 = Uh3Cons(v8, v9)
                                    let v11 = False
                                    let v12 = Uh20Nil
                                    let v13 = Uh20Cons(v6, v7, v10, v11, v12)
                                    let v14 = method154(v1, v13)
                                    #(v14, v2)
                                }
                                _ -> {
                                    let #(v20, v21) =
                                        case v5  {
                                            Us13Framed(v15, v16, v17, v18, v19) -> {
                                                #(v1, v2)
                                            }
                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                        }
                                    #(v20, v21)
                                }
                            }
                        }
                        _ -> {
                            let #(v83, v84) =
                                case v3  {
                                    Us12Revision(v24) -> {
                                        case v24  {
                                            Us14Edited(v25, v26) -> {
                                                let v27 = Uh20Nil
                                                let v28 = method155(v25, v26, v1, v27)
                                                #(v28, v2)
                                            }
                                            _ -> {
                                                let #(v39, v40) =
                                                    case v24  {
                                                        Us14Deleted(v29) -> {
                                                            let v30 = Uh20Nil
                                                            let v31 = method156(v29, v1, v30)
                                                            #(v31, v2)
                                                        }
                                                        _ -> {
                                                            let #(v37, v38) =
                                                                case v24  {
                                                                    Us14FrameEdited(v32, v33, v34, v35, v36) -> {
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
                                        let #(v81, v82) =
                                            case v3  {
                                                Us12Reaction(v43) -> {
                                                    case v43  {
                                                        Us15Liked(v44, v45) -> {
                                                            let v46 = Us21None
                                                            let v47 = method157(v44, v2, v46)
                                                            let v51 =
                                                                case v47  {
                                                                    Us21None -> {
                                                                        False
                                                                    }
                                                                    Us21Some(v48, v49) -> {
                                                                        True
                                                                    }
                                                                }
                                                            case v51 {
                                                                True -> {
                                                                    let v52 = Uh21Nil
                                                                    let v53 = method158(v44, v45, v2, v52)
                                                                    #(v1, v53)
                                                                }
                                                                False -> {
                                                                    let v54 = Uh3Nil
                                                                    let v55 = Uh3Cons(v45, v54)
                                                                    let v56 = Uh21Nil
                                                                    let v57 = Uh21Cons(v44, v55, v56)
                                                                    let v58 = method159(v2, v57)
                                                                    #(v1, v58)
                                                                }
                                                            }
                                                        }
                                                        _ -> {
                                                            let #(v77, v78) =
                                                                case v43  {
                                                                    Us15Unliked(v61, v62) -> {
                                                                        let v63 = Us21None
                                                                        let v64 = method157(v61, v2, v63)
                                                                        let v68 =
                                                                            case v64  {
                                                                                Us21None -> {
                                                                                    False
                                                                                }
                                                                                Us21Some(v65, v66) -> {
                                                                                    True
                                                                                }
                                                                            }
                                                                        case v68 {
                                                                            True -> {
                                                                                let v69 = Uh21Nil
                                                                                let v70 = method160(v61, v62, v2, v69)
                                                                                #(v1, v70)
                                                                            }
                                                                            False -> {
                                                                                let v71 = Uh3Nil
                                                                                let v72 = Uh21Nil
                                                                                let v73 = Uh21Cons(v61, v71, v72)
                                                                                let v74 = method159(v2, v73)
                                                                                #(v1, v74)
                                                                            }
                                                                        }
                                                                    }
                                                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                }
                                                            #(v77, v78)
                                                        }
                                                    }
                                                }
                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                            }
                                        #(v81, v82)
                                    }
                                }
                            #(v83, v84)
                        }
                    }
                method153(v4, v85, v86)
            }
            _ -> {
                let #(v89, v90) =
                    case v0  {
                        Uh10Nil -> {
                            #(v1, v2)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v89, v90)
            }
        }
    #(v91, v92)
}

pub fn final_replay_152(v0: Uh10) -> #(Uh20, Uh21) {
    let v1 = Uh20Nil
    let v2 = Uh21Nil
    let #(v3, v4) = method153(v0, v1, v2)
    #(v3, v4)
}

pub fn method162(v0: Uh20, v1: Uh20) -> Uh20 {
    case v0  {
        Uh20Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method162(v6, v1)
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

pub fn method163(v0: Uh20, v1: Uh22) -> Uh22 {
    case v0  {
        Uh20Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method163(v6, v1)
            let v12 =
                case v3  {
                    Us9None -> {
                        Us22None
                    }
                    Us9Some(v8) -> {
                        Us22Some(v8)
                    }
                }
            let v13 = Uh3Nil
            let v14 = method37(v4, v13)
            Uh22Cons(v2, v12, v14, v7)
        }
        Uh20Nil -> {
            v1
        }
    }
}

pub fn without_blank_tail_167(v0: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v1, v2) -> {
            let v3 = string.to_utf_codepoints(v1) |> list.all(fn(c) { x_spaced(string.utf_codepoint_to_int(c)) })
            case v3 {
                True -> {
                    without_blank_tail_167(v2)
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

pub fn method168(v0: String, v1: Uh26, v2: Us24) -> Us24 {
    case v1  {
        Uh26Cons(v3, v4, v5) -> {
            let v6 = method168(v0, v5, v2)
            let v7 = v3 == v0
            case v7 {
                True -> {
                    Us24Some(v3, v4)
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

pub fn method169(v0: String, v1: Int, v2: Uh23, v3: Us25) -> Us25 {
    case v2  {
        Uh23Cons(v4, v5, v6, v7, v8, v9, v10) -> {
            let v11 = method169(v0, v1, v10, v3)
            let v12 = v5 == v0
            let v14 =
                case v12 {
                    True -> {
                        let v13 = v6 == v1
                        v13
                    }
                    False -> {
                        False
                    }
                }
            case v14 {
                True -> {
                    Us25Some(v4, v5, v6, v7, v8, v9)
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

pub fn method170(v0: Uh23, v1: Uh23) -> Uh23 {
    case v0  {
        Uh23Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method170(v8, v1)
            Uh23Cons(v2, v3, v4, v5, v6, v7, v9)
        }
        Uh23Nil -> {
            v1
        }
    }
}

pub fn method171(v0: Uh25, v1: Uh25) -> Uh25 {
    case v0  {
        Uh25Cons(v2, v3, v4) -> {
            let v5 = method171(v4, v1)
            Uh25Cons(v2, v3, v5)
        }
        Uh25Nil -> {
            v1
        }
    }
}

pub fn method172(v0: String, v1: Uh26, v2: Uh26) -> Uh26 {
    case v1  {
        Uh26Cons(v3, v4, v5) -> {
            let v6 = method172(v0, v5, v2)
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
