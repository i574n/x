import gleam/bit_array
import gleam/list
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_split/types.{type Uh0, type Us0, type Uh2, type Uh3, Uh0Cons, Uh0Nil, Uh2Cons, Uh2Nil, Uh3Cons, Uh3Nil, Us0OnBluesky, Us0OnMastodon, Us0OnX, Us1None, Us1Some}
import xsim_split/part1.{closure1, closure2, concat_balanced_22, method10, spiral_string_length, spiral_wrap_signed, unicode_erlang_characters_to_binary, unicode_erlang_nfc}
import xsim_split/part2.{closure3, defused_dots_by_2, defused_entities_27, glued_47, method49}

pub fn method48(v0: Us0, v1: Uh0, v2: Uh2) -> Uh2 {
    case v1  {
        Uh0Cons(v3, v4) -> {
            let v5 = method48(v0, v4, v2)
            let #(v88, v89) =
                case v0  {
                    Us0OnX -> {
                        let v6 = option.from_result(result.map(list.first(string.to_utf_codepoints(v3)), string.utf_codepoint_to_int))
                        let v7 = closure2(Nil)
                        let v8 = v6 |> option.map(v7)
                        let v9 = v8 |> option.unwrap(0)
                        let v10 = list.length(string.to_utf_codepoints(v3))
                        let v11 = v10 > 1
                        let v65 =
                            case v11 {
                                True -> {
                                    let v12 = v9 >= 126976
                                    let v42 =
                                        case v12 {
                                            True -> {
                                                True
                                            }
                                            False -> {
                                                let v13 = unicode_erlang_characters_to_binary([65039])
                                                let v14 = v13 == ""
                                                let v24 =
                                                    case v14 {
                                                        True -> {
                                                            0
                                                        }
                                                        False -> {
                                                            let v15 = option.from_result(result.map(string.split_once(v3, v13), pair.first))
                                                            let v16 = closure3(Nil)
                                                            let v17 = v15 |> option.map(v16)
                                                            let v18 = Us1None
                                                            let v19 = v17 |> option.unwrap(v18)
                                                            case v19  {
                                                                Us1None -> {
                                                                    -1
                                                                }
                                                                Us1Some(v20) -> {
                                                                    let v21 = bit_array.byte_size(bit_array.from_string(v20))
                                                                    v21
                                                                }
                                                            }
                                                        }
                                                    }
                                                let v25 = v24 >= 0
                                                case v25 {
                                                    True -> {
                                                        let v26 = v9 >= 8192
                                                        let v28 =
                                                            case v26 {
                                                                True -> {
                                                                    let v27 = v9 <= 11263
                                                                    v27
                                                                }
                                                                False -> {
                                                                    False
                                                                }
                                                            }
                                                        let v30 =
                                                            case v28 {
                                                                True -> {
                                                                    True
                                                                }
                                                                False -> {
                                                                    let v29 = v9 == 169
                                                                    v29
                                                                }
                                                            }
                                                        let v32 =
                                                            case v30 {
                                                                True -> {
                                                                    True
                                                                }
                                                                False -> {
                                                                    let v31 = v9 == 174
                                                                    v31
                                                                }
                                                            }
                                                        let v34 =
                                                            case v32 {
                                                                True -> {
                                                                    True
                                                                }
                                                                False -> {
                                                                    let v33 = v9 == 12336
                                                                    v33
                                                                }
                                                            }
                                                        let v36 =
                                                            case v34 {
                                                                True -> {
                                                                    True
                                                                }
                                                                False -> {
                                                                    let v35 = v9 == 12349
                                                                    v35
                                                                }
                                                            }
                                                        let v38 =
                                                            case v36 {
                                                                True -> {
                                                                    True
                                                                }
                                                                False -> {
                                                                    let v37 = v9 == 12951
                                                                    v37
                                                                }
                                                            }
                                                        case v38 {
                                                            True -> {
                                                                True
                                                            }
                                                            False -> {
                                                                let v39 = v9 == 12953
                                                                v39
                                                            }
                                                        }
                                                    }
                                                    False -> {
                                                        False
                                                    }
                                                }
                                            }
                                        }
                                    case v42 {
                                        True -> {
                                            True
                                        }
                                        False -> {
                                            let v43 = unicode_erlang_characters_to_binary([8419])
                                            let v44 = v43 == ""
                                            let v54 =
                                                case v44 {
                                                    True -> {
                                                        0
                                                    }
                                                    False -> {
                                                        let v45 = option.from_result(result.map(string.split_once(v3, v43), pair.first))
                                                        let v46 = closure3(Nil)
                                                        let v47 = v45 |> option.map(v46)
                                                        let v48 = Us1None
                                                        let v49 = v47 |> option.unwrap(v48)
                                                        case v49  {
                                                            Us1None -> {
                                                                -1
                                                            }
                                                            Us1Some(v50) -> {
                                                                let v51 = bit_array.byte_size(bit_array.from_string(v50))
                                                                v51
                                                            }
                                                        }
                                                    }
                                                }
                                            let v55 = v54 >= 0
                                            case v55 {
                                                True -> {
                                                    let v56 = v9 == 35
                                                    let v58 =
                                                        case v56 {
                                                            True -> {
                                                                True
                                                            }
                                                            False -> {
                                                                let v57 = v9 == 42
                                                                v57
                                                            }
                                                        }
                                                    case v58 {
                                                        True -> {
                                                            True
                                                        }
                                                        False -> {
                                                            let v59 = v9 >= 48
                                                            case v59 {
                                                                True -> {
                                                                    let v60 = v9 <= 57
                                                                    v60
                                                                }
                                                                False -> {
                                                                    False
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                                False -> {
                                                    False
                                                }
                                            }
                                        }
                                    }
                                }
                                False -> {
                                    False
                                }
                            }
                        let v76 =
                            case v65 {
                                True -> {
                                    2
                                }
                                False -> {
                                    let v66 = string.to_utf_codepoints(v3)
                                    let v67 = v66 |> list.reverse
                                    let v68 = Uh3Nil
                                    let listm_fold = v67 |> list.fold (v68, fn (acc, x) {
                                    let v69 = x
                                    let v70 = string.utf_codepoint_to_int(v69)
                                    let v71 = acc
                                    let v72 = Uh3Cons(v70, v71)
                                    v72
                                    })
                                    let v73 = listm_fold
                                    let v74 = 0
                                    method49(v73, v74)
                                }
                            }
                        #(v3, v76)
                    }
                    _ -> {
                        let #(v86, v87) =
                            case v0  {
                                Us0OnMastodon -> {
                                    #(v3, 1)
                                }
                                _ -> {
                                    let #(v84, v85) =
                                        case v0  {
                                            Us0OnBluesky(v77, v78) -> {
                                                let v79 = spiral_string_length(v3)
                                                let v80 = spiral_wrap_signed(v79 + 9, 32)
                                                let v81 = v80 / 10
                                                let v82 = v81 < 1
                                                let v83 =
                                                    case v82 {
                                                        True -> {
                                                            1
                                                        }
                                                        False -> {
                                                            v81
                                                        }
                                                    }
                                                #(v3, v83)
                                            }
                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                        }
                                    #(v84, v85)
                                }
                            }
                        #(v86, v87)
                    }
                }
            Uh2Cons(v88, v89, v5)
        }
        Uh0Nil -> {
            v2
        }
    }
}

pub fn units_on_46(v0: Us0, v1: String) -> Uh2 {
    let v29 =
        case v0  {
            Us0OnBluesky(v18, v19) -> {
                let v20 = string.to_graphemes(v1)
                let v21 = v20 |> list.reverse
                let v22 = Uh0Nil
                let listm_fold = v21 |> list.fold (v22, fn (acc, x) {
                let v23 = x
                let v24 = acc
                let v25 = Uh0Cons(v23, v24)
                v25
                })
                let v26 = listm_fold
                v26
            }
            Us0OnMastodon -> {
                let v11 = string.to_graphemes(v1)
                let v12 = v11 |> list.reverse
                let v13 = Uh0Nil
                let listm_fold = v12 |> list.fold (v13, fn (acc, x) {
                let v14 = x
                let v15 = acc
                let v16 = Uh0Cons(v14, v15)
                v16
                })
                let v17 = listm_fold
                v17
            }
            Us0OnX -> {
                let v2 = string.to_graphemes(v1)
                let v3 = v2 |> list.reverse
                let v4 = Uh0Nil
                let listm_fold = v3 |> list.fold (v4, fn (acc, x) {
                let v5 = x
                let v6 = acc
                let v7 = Uh0Cons(v5, v6)
                v7
                })
                let v8 = listm_fold
                let v9 = Uh0Nil
                glued_47(v8, v9)
            }
        }
    let v30 = Uh2Nil
    method48(v0, v29, v30)
}

pub fn prefix_text_51(v0: Int, v1: Uh2, v2: String) -> String {
    case v1  {
        Uh2Cons(v3, v4, v5) -> {
            let v6 = v0 > 0
            case v6 {
                True -> {
                    let v7 = spiral_wrap_signed(v0 - 1, 32)
                    let v8 = v2 <> v3 
                    prefix_text_51(v7, v5, v8)
                }
                False -> {
                    v2
                }
            }
        }
        _ -> {
            v2
        }
    }
}

pub fn closure8(capt: Nil) -> fn(Int) -> Bool {
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

pub fn method53() -> fn(Int) -> Bool {
    closure8(Nil)
}

pub fn method54(v0: fn(Int) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> {
                    True
                }
                False -> {
                    let v5 = method53()
                    method54(v5, v3)
                }
            }
        }
        Uh3Nil -> {
            False
        }
    }
}

pub fn link_length_52(v0: Uh2, v1: Int) -> Int {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = string.to_utf_codepoints(v2)
            let v6 = v5 |> list.reverse
            let v7 = Uh3Nil
            let listm_fold = v6 |> list.fold (v7, fn (acc, x) {
            let v8 = x
            let v9 = string.utf_codepoint_to_int(v8)
            let v10 = acc
            let v11 = Uh3Cons(v9, v10)
            v11
            })
            let v12 = listm_fold
            let v13 = method53()
            let v14 = method54(v13, v12)
            let v15 = v14 == False
            let v16 = v15 == False
            case v16 {
                True -> {
                    let v17 = spiral_wrap_signed(v1 + 1, 32)
                    link_length_52(v4, v17)
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

pub fn method55(v0: Uh2, v1: Uh2) -> Uh2 {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = Uh2Cons(v2, v3, v1)
            method55(v4, v5)
        }
        Uh2Nil -> {
            v1
        }
    }
}

pub fn linked_50(v0: Uh2, v1: Uh2) -> Uh2 {
    case v0  {
        Uh2Cons(v4, v5, v6) -> {
            let v7 = 7
            let v8 = ""
            let v9 = prefix_text_51(v7, v0, v8)
            let v10 = v9 == "http://"
            let v14 =
                case v10 {
                    True -> {
                        True
                    }
                    False -> {
                        let v11 = 8
                        let v12 = prefix_text_51(v11, v0, v8)
                        let v13 = v12 == "https://"
                        v13
                    }
                }
            case v14 {
                True -> {
                    let v15 = 0
                    let v16 = link_length_52(v0, v15)
                    let v17 = spiral_wrap_signed(23 - v16, 32)
                    let v18 = v17 > 0
                    let #(v20, v21) =
                        case v18 {
                            True -> {
                                let v19 = spiral_wrap_signed(v5 + v17, 32)
                                #(v4, v19)
                            }
                            False -> {
                                #(v4, v5)
                            }
                        }
                    let v22 = Uh2Cons(v20, v21, v1)
                    linked_50(v6, v22)
                }
                False -> {
                    let v24 = Uh2Cons(v4, v5, v1)
                    linked_50(v6, v24)
                }
            }
        }
        Uh2Nil -> {
            let v2 = Uh2Nil
            method55(v1, v2)
        }
    }
}

pub fn method56(v0: Uh2, v1: Int) -> Int {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + v3, 32)
            method56(v4, v5)
        }
        Uh2Nil -> {
            v1
        }
    }
}

pub fn closure7(capt: #(Us0)) -> fn(String) -> Int {
    fn (v1) {
        let #(v0) = capt
        let v13 =
            case v0  {
                Us0OnBluesky(v8, v9) -> {
                    units_on_46(v0, v1)
                }
                Us0OnMastodon -> {
                    let v4 = Us0OnMastodon
                    let v5 = units_on_46(v4, v1)
                    let v6 = Uh2Nil
                    linked_50(v5, v6)
                }
                Us0OnX -> {
                    let v2 = Us0OnX
                    units_on_46(v2, v1)
                }
            }
        let v14 = 0
        method56(v13, v14)
    }
}

pub fn closure9(capt: Nil) -> fn(#(String, Int)) -> Bool {
    fn (dom) {
        let #(v0, _v1) = dom
        let v2 = string.to_utf_codepoints(v0)
        let v3 = v2 |> list.reverse
        let v4 = Uh3Nil
        let listm_fold = v3 |> list.fold (v4, fn (acc, x) {
        let v5 = x
        let v6 = string.utf_codepoint_to_int(v5)
        let v7 = acc
        let v8 = Uh3Cons(v6, v7)
        v8
        })
        let v9 = listm_fold
        let v10 = method53()
        let v11 = method54(v10, v9)
        let v12 = v11 == False
        let v13 = v12 == False
        v13
    }
}

pub fn taken_while_61(v0: fn(#(String, Int)) -> Bool, v1: Uh2, v2: Uh2) -> #(Uh2, Uh2) {
    case v1  {
        Uh2Cons(v3, v4, v5) -> {
            let v6 = v0(#(v3, v4))
            case v6 {
                True -> {
                    let v7 = Uh2Cons(v3, v4, v2)
                    taken_while_61(v0, v5, v7)
                }
                False -> {
                    let v10 = Uh2Nil
                    let v11 = method55(v2, v10)
                    #(v11, v1)
                }
            }
        }
        _ -> {
            let v14 = Uh2Nil
            let v15 = method55(v2, v14)
            #(v15, v1)
        }
    }
}

pub fn closure10(capt: Nil) -> fn(#(String, Int)) -> Bool {
    fn (dom) {
        let #(v0, _v1) = dom
        let v2 = string.to_utf_codepoints(v0)
        let v3 = v2 |> list.reverse
        let v4 = Uh3Nil
        let listm_fold = v3 |> list.fold (v4, fn (acc, x) {
        let v5 = x
        let v6 = string.utf_codepoint_to_int(v5)
        let v7 = acc
        let v8 = Uh3Cons(v6, v7)
        v8
        })
        let v9 = listm_fold
        let v10 = method53()
        let v11 = method54(v10, v9)
        let v12 = v11 == False
        v12
    }
}

pub fn method62(v0: Uh2, v1: Int) -> Int {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + 1, 32)
            method62(v4, v5)
        }
        Uh2Nil -> {
            v1
        }
    }
}

pub fn method63(v0: Uh2, v1: Uh2) -> Uh2 {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = method63(v4, v1)
            Uh2Cons(v2, v3, v5)
        }
        Uh2Nil -> {
            v1
        }
    }
}

pub fn split_point_60(v0: Uh2) -> #(Uh2, Uh2) {
    let v1 = closure9(Nil)
    let v2 = Uh2Nil
    let #(v3, v4) = taken_while_61(v1, v0, v2)
    let v5 = closure10(Nil)
    let v6 = Uh2Nil
    let #(v7, v8) = taken_while_61(v5, v4, v6)
    let v9 =
        case v8  {
            Uh2Nil -> {
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
                let v11 = method62(v3, v10)
                let v12 = 0
                let v13 = method62(v7, v12)
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
            let v17 = method63(v3, v7)
            #(v17, v8)
        }
        False -> {
            let v18 = Uh2Nil
            let #(v19, v20) = taken_while_61(v5, v0, v18)
            let v21 =
                case v20  {
                    Uh2Nil -> {
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
                    let v22 = Uh2Nil
                    #(v22, v0)
                }
            }
        }
    }
}

pub fn method64(v0: Uh2, v1: Uh0) -> Uh0 {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = method64(v4, v1)
            Uh0Cons(v2, v5)
        }
        Uh2Nil -> {
            v1
        }
    }
}

pub fn chunk_59(v0: Int, v1: Uh2, v2: Uh2, v3: Int, v4: Uh0) -> Uh0 {
    case v1  {
        Uh2Cons(v15, v16, v17) -> {
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
                                Uh2Nil -> {
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
                    let v23 = Uh2Cons(v15, v16, v2)
                    chunk_59(v0, v17, v23, v18, v4)
                }
                False -> {
                    let #(v25, v26) = split_point_60(v2)
                    let v27 = Uh2Nil
                    let v28 = method55(v25, v27)
                    let v29 = method63(v28, v1)
                    let v37 =
                        case v26  {
                            Uh2Nil -> {
                                v4
                            }
                            _ -> {
                                let v30 = Uh2Nil
                                let v31 = method55(v26, v30)
                                let v32 = Uh0Nil
                                let v33 = method64(v31, v32)
                                let v34 = ""
                                let v35 = concat_balanced_22(v34, v33)
                                Uh0Cons(v35, v4)
                            }
                        }
                    let v38 = Uh2Nil
                    let v39 = 0
                    chunk_59(v0, v29, v38, v39, v37)
                }
            }
        }
        Uh2Nil -> {
            let v12 =
                case v2  {
                    Uh2Nil -> {
                        v4
                    }
                    _ -> {
                        let v5 = Uh2Nil
                        let v6 = method55(v2, v5)
                        let v7 = Uh0Nil
                        let v8 = method64(v6, v7)
                        let v9 = ""
                        let v10 = concat_balanced_22(v9, v8)
                        Uh0Cons(v10, v4)
                    }
                }
            let v13 = Uh0Nil
            method10(v12, v13)
        }
    }
}

pub fn method65(v0: Uh0, v1: Int) -> Int {
    case v0  {
        Uh0Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method65(v3, v4)
        }
        Uh0Nil -> {
            v1
        }
    }
}

pub fn chunks_of_58(v0: Int, v1: String, v2: fn(String) -> Int, v3: Uh2, v4: Int) -> Uh0 {
    let v5 = " "
    let v6 = v1 <> v5 
    let v7 = string.inspect(v4)
    let v8 = v6 <> v7 
    let v9 = "/"
    let v10 = v8 <> v9 
    let v11 = string.inspect(v4)
    let v12 = v10 <> v11 
    let v13 = "\n"
    let v14 = v12 <> v13 
    let v15 = v2(v14)
    let v16 = spiral_wrap_signed(v0 - v15, 32)
    let v17 = Uh2Nil
    let v18 = 0
    let v19 = Uh0Nil
    let v20 = chunk_59(v16, v3, v17, v18, v19)
    let v21 = 0
    let v22 = method65(v20, v21)
    let v23 = string.inspect(v22)
    let v24 = spiral_string_length(v23)
    let v25 = string.inspect(v4)
    let v26 = spiral_string_length(v25)
    let v27 = v24 > v26
    case v27 {
        True -> {
            chunks_of_58(v0, v1, v2, v3, v22)
        }
        False -> {
            v20
        }
    }
}

pub fn split_units_57(v0: Int, v1: String, v2: fn(String) -> Int, v3: Uh2) -> Uh0 {
    let v4 = 9
    chunks_of_58(v0, v1, v2, v3, v4)
}

pub fn split_cell_on_45(v0: Us0, v1: String, v2: Int, v3: String) -> Uh0 {
    let v4 = closure7(#(v0))
    let v5 = unicode_erlang_nfc(v3)
    let v17 =
        case v0  {
            Us0OnBluesky(v12, v13) -> {
                units_on_46(v0, v5)
            }
            Us0OnMastodon -> {
                let v8 = Us0OnMastodon
                let v9 = units_on_46(v8, v5)
                let v10 = Uh2Nil
                linked_50(v9, v10)
            }
            Us0OnX -> {
                let v6 = Us0OnX
                units_on_46(v6, v5)
            }
        }
    split_units_57(v2, v1, v4, v17)
}

pub fn split_cell_0(v0: String, v1: Int, v2: String) -> Uh0 {
    let v3 = Us0OnX
    let v4 = closure1(Nil)
    let v5 = defused_dots_by_2(v4, v2)
    let v6 = defused_entities_27(v5)
    split_cell_on_45(v3, v0, v1, v6)
}

pub fn closure0(capt: Nil) -> fn(#(String, Int, String)) -> Uh0 {
    fn (dom) {
        let #(v0, v1, v2) = dom
        split_cell_0(v0, v1, v2)
    }
}

pub fn delimited_66(v0: String, v1: Uh0) -> String {
    concat_balanced_22(v0, v1)
}
