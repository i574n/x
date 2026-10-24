import gleam/bit_array
import gleam/string
import xsim_frames/types.{type Uh3, type Uh7, type Uh9, type Uh10, type Uh13, type Us16, type Uh14, Uh10Cons, Uh10Nil, Uh13Cons, Uh13Nil, Uh14Cons, Uh14Nil, Uh3Cons, Uh3Nil, Uh7Cons, Uh7Nil, Uh9Cons, Uh9Nil, Us10Breaker, Us10Editor, Us10Fickle, Us10Lurker, Us12Reaction, Us12Revision, Us14Edited, Us15Liked, Us15Unliked, Us16None, Us16Some, Us2None, Us2Some, Us9None, Us9Some}
import xsim_frames/part1.{method15, spiral_binary_split_first, spiral_string_length, spiral_string_slice, spiral_wrap_signed, spiral_wrap_unsigned}
import xsim_frames/part3.{method68, uniform_62}

pub fn method69(v0: Uh9, v1: Uh9) -> Uh9 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = method69(v5, v1)
            let v7 = "///- --test"
            let v8 = v4 |> string.contains(v7)
            let v9 = v8 == False
            case v9 {
                True -> {
                    Uh9Cons(v2, v3, v4, v6)
                }
                False -> {
                    v6
                }
            }
        }
        Uh9Nil -> {
            v1
        }
    }
}

pub fn method70(v0: Int, v1: Int) -> Uh13 {
    let v2 = v1 < v0
    case v2 {
        True -> {
            let v3 = spiral_wrap_signed(v1 + 1, 32)
            let v4 = method70(v0, v3)
            Uh13Cons(v1, v4)
        }
        False -> {
            Uh13Nil
        }
    }
}

pub fn method72(v0: Uh9, v1: Int) -> Int {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = spiral_wrap_signed(v1 + 1, 32)
            method72(v5, v6)
        }
        Uh9Nil -> {
            v1
        }
    }
}

pub fn picked_73(v0: Int, v1: Uh9) -> Us16 {
    case v1  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = v0 <= 0
            case v6 {
                True -> {
                    Us16Some(v2, v3, v4)
                }
                False -> {
                    let v8 = spiral_wrap_signed(v0 - 1, 32)
                    picked_73(v8, v5)
                }
            }
        }
        Uh9Nil -> {
            Us16None
        }
    }
}

pub fn method71(v0: Uh9, v1: Uh13, v2: Uh10, v3: Int, v4: Int) -> #(Uh10, Int, Int) {
    case v1  {
        Uh13Cons(v5, v6) -> {
            let v7 = 0
            let v8 = method72(v0, v7)
            let v9 = spiral_wrap_unsigned(v8, 64)
            let #(v10, v11, v12) = uniform_62(v9, v3, v4)
            let v13 = spiral_wrap_signed(v10, 32)
            let v14 = spiral_wrap_signed(v13 - 1, 32)
            let v15 = picked_73(v14, v0)
            let #(v29, v30, v31) =
                case v15  {
                    Us16None -> {
                        #(v2, v11, v12)
                    }
                    Us16Some(v16, v17, v18) -> {
                        let v19 = "\n"
                        let v20 = v18 <> v19 
                        let v21 = Us14Edited(v16, v20)
                        let v22 = Us12Revision(v21)
                        let v23 = Uh10Nil
                        let v24 = Uh10Cons(v22, v23)
                        let v25 = method68(v2, v24)
                        #(v25, v11, v12)
                    }
                }
            method71(v0, v6, v29, v30, v31)
        }
        Uh13Nil -> {
            #(v2, v3, v4)
        }
    }
}

pub fn blank_start_76(v0: String, v1: Int) -> Int {
    let v2 = v1 > 0
    let v33 =
        case v2 {
            True -> {
                let v3 = spiral_wrap_signed(v1 - 1, 32)
                let v4 = spiral_string_slice(v0, 0, v3)
                let v5 = case string.utf_codepoint(11) { Ok(c) -> string.from_utf_codepoints([c]) Error(_) -> "" }
                let v6 = case string.utf_codepoint(12) { Ok(c) -> string.from_utf_codepoints([c]) Error(_) -> "" }
                let v7 = v4 |> string.ends_with(v6)
                let v10 =
                    case v7 {
                        True -> {
                            Us9Some(v6)
                        }
                        False -> {
                            Us9None
                        }
                    }
                let v11 = v4 |> string.ends_with(v5)
                let v13 =
                    case v11 {
                        True -> {
                            Us9Some(v5)
                        }
                        False -> {
                            v10
                        }
                    }
                let v14 = "\r"
                let v15 = v4 |> string.ends_with(v14)
                let v17 =
                    case v15 {
                        True -> {
                            Us9Some(v14)
                        }
                        False -> {
                            v13
                        }
                    }
                let v18 = "\n"
                let v19 = v4 |> string.ends_with(v18)
                let v21 =
                    case v19 {
                        True -> {
                            Us9Some(v18)
                        }
                        False -> {
                            v17
                        }
                    }
                let v22 = "\t"
                let v23 = v4 |> string.ends_with(v22)
                let v25 =
                    case v23 {
                        True -> {
                            Us9Some(v22)
                        }
                        False -> {
                            v21
                        }
                    }
                let v26 = " "
                let v27 = v4 |> string.ends_with(v26)
                let v29 =
                    case v27 {
                        True -> {
                            Us9Some(v26)
                        }
                        False -> {
                            v25
                        }
                    }
                case v29  {
                    Us9None -> {
                        False
                    }
                    Us9Some(v30) -> {
                        True
                    }
                }
            }
            False -> {
                False
            }
        }
    case v33 {
        True -> {
            let v34 = spiral_wrap_signed(v1 - 1, 32)
            blank_start_76(v0, v34)
        }
        False -> {
            v1
        }
    }
}

pub fn digits_start_77(v0: String, v1: Int) -> Int {
    let v2 = v1 > 0
    let v49 =
        case v2 {
            True -> {
                let v3 = spiral_wrap_signed(v1 - 1, 32)
                let v4 = spiral_string_slice(v0, 0, v3)
                let v5 = string.inspect(9)
                let v6 = v4 |> string.ends_with(v5)
                let v9 =
                    case v6 {
                        True -> {
                            Us2Some(9)
                        }
                        False -> {
                            Us2None
                        }
                    }
                let v10 = string.inspect(8)
                let v11 = v4 |> string.ends_with(v10)
                let v13 =
                    case v11 {
                        True -> {
                            Us2Some(8)
                        }
                        False -> {
                            v9
                        }
                    }
                let v14 = string.inspect(7)
                let v15 = v4 |> string.ends_with(v14)
                let v17 =
                    case v15 {
                        True -> {
                            Us2Some(7)
                        }
                        False -> {
                            v13
                        }
                    }
                let v18 = string.inspect(6)
                let v19 = v4 |> string.ends_with(v18)
                let v21 =
                    case v19 {
                        True -> {
                            Us2Some(6)
                        }
                        False -> {
                            v17
                        }
                    }
                let v22 = string.inspect(5)
                let v23 = v4 |> string.ends_with(v22)
                let v25 =
                    case v23 {
                        True -> {
                            Us2Some(5)
                        }
                        False -> {
                            v21
                        }
                    }
                let v26 = string.inspect(4)
                let v27 = v4 |> string.ends_with(v26)
                let v29 =
                    case v27 {
                        True -> {
                            Us2Some(4)
                        }
                        False -> {
                            v25
                        }
                    }
                let v30 = string.inspect(3)
                let v31 = v4 |> string.ends_with(v30)
                let v33 =
                    case v31 {
                        True -> {
                            Us2Some(3)
                        }
                        False -> {
                            v29
                        }
                    }
                let v34 = string.inspect(2)
                let v35 = v4 |> string.ends_with(v34)
                let v37 =
                    case v35 {
                        True -> {
                            Us2Some(2)
                        }
                        False -> {
                            v33
                        }
                    }
                let v38 = string.inspect(1)
                let v39 = v4 |> string.ends_with(v38)
                let v41 =
                    case v39 {
                        True -> {
                            Us2Some(1)
                        }
                        False -> {
                            v37
                        }
                    }
                let v42 = string.inspect(0)
                let v43 = v4 |> string.ends_with(v42)
                let v45 =
                    case v43 {
                        True -> {
                            Us2Some(0)
                        }
                        False -> {
                            v41
                        }
                    }
                case v45  {
                    Us2None -> {
                        False
                    }
                    Us2Some(v46) -> {
                        True
                    }
                }
            }
            False -> {
                False
            }
        }
    case v49 {
        True -> {
            let v50 = spiral_wrap_signed(v1 - 1, 32)
            digits_start_77(v0, v50)
        }
        False -> {
            v1
        }
    }
}

pub fn unpadded_78(v0: String) -> String {
    let v1 = spiral_string_length(v0)
    let v2 = v1 > 1
    let v5 =
        case v2 {
            True -> {
                let v3 = "0"
                let v4 = v0 |> string.starts_with(v3)
                v4
            }
            False -> {
                False
            }
        }
    case v5 {
        True -> {
            let v6 = spiral_wrap_signed(v1 - 1, 32)
            let v7 = spiral_wrap_signed(1 + v6, 32)
            let v8 = spiral_wrap_signed(v7 - 1, 32)
            let v9 = spiral_string_slice(v0, 1, v8)
            unpadded_78(v9)
        }
        False -> {
            v0
        }
    }
}

pub fn plus_one_79(v0: String) -> String {
    let v1 = v0 == ""
    let v7 =
        case v1 {
            True -> {
                -1
            }
            False -> {
                let v2 = spiral_string_length(v0)
                let v3 = spiral_wrap_signed(v2 - 1, 32)
                let v4 = spiral_string_slice(v0, v3, v3)
                let v5 = "0123456789"
                let v6 = case v4 { "" -> 0 _ -> case spiral_binary_split_first(v5, v4) { [spiral_head, _] -> bit_array.byte_size(bit_array.from_string(spiral_head)) _ -> -1 } }
                v6
            }
        }
    let v8 = v7 < 0
    case v8 {
        True -> {
            let v9 = "1"
            v9
        }
        False -> {
            let v10 = v7 == 9
            case v10 {
                True -> {
                    let v11 = spiral_string_length(v0)
                    let v12 = spiral_wrap_signed(v11 - 1, 32)
                    let v13 = spiral_wrap_signed(v12 - 1, 32)
                    let v14 = spiral_string_slice(v0, 0, v13)
                    let v15 = plus_one_79(v14)
                    let v16 = "0"
                    let v17 = v15 <> v16 
                    v17
                }
                False -> {
                    let v18 = spiral_string_length(v0)
                    let v19 = spiral_wrap_signed(v18 - 1, 32)
                    let v20 = spiral_wrap_signed(v19 - 1, 32)
                    let v21 = spiral_string_slice(v0, 0, v20)
                    let v22 = spiral_wrap_signed(v7 + 1, 32)
                    let v23 = string.inspect(v22)
                    let v24 = v21 <> v23 
                    v24
                }
            }
        }
    }
}

pub fn break_source_75(v0: String) -> String {
    let v1 = spiral_string_length(v0)
    let v2 = blank_start_76(v0, v1)
    let v3 = digits_start_77(v0, v2)
    let v4 = v3 == v2
    case v4 {
        True -> {
            v0
        }
        False -> {
            let v5 = v3 > 0
            let v10 =
                case v5 {
                    True -> {
                        let v6 = spiral_wrap_signed(v3 - 1, 32)
                        let v7 = spiral_string_slice(v0, 0, v6)
                        let v8 = "."
                        let v9 = v7 |> string.ends_with(v8)
                        v9
                    }
                    False -> {
                        False
                    }
                }
            case v10 {
                True -> {
                    let v11 = spiral_wrap_signed(v3 - 1, 32)
                    let v12 = digits_start_77(v0, v11)
                    let v13 = v12 == v11
                    let v20 =
                        case v13 {
                            True -> {
                                True
                            }
                            False -> {
                                let v14 = v12 > 0
                                case v14 {
                                    True -> {
                                        let v15 = spiral_wrap_signed(v12 - 1, 32)
                                        let v16 = spiral_string_slice(v0, 0, v15)
                                        let v17 = "."
                                        let v18 = v16 |> string.ends_with(v17)
                                        v18
                                    }
                                    False -> {
                                        False
                                    }
                                }
                            }
                        }
                    case v20 {
                        True -> {
                            v0
                        }
                        False -> {
                            let v21 = spiral_wrap_signed(v12 - 1, 32)
                            let v22 = spiral_string_slice(v0, 0, v21)
                            let v23 = spiral_wrap_signed(v11 - v12, 32)
                            let v24 = spiral_wrap_signed(v12 + v23, 32)
                            let v25 = spiral_wrap_signed(v24 - 1, 32)
                            let v26 = spiral_string_slice(v0, v12, v25)
                            let v27 = unpadded_78(v26)
                            let v28 = plus_one_79(v27)
                            let v29 = v22 <> v28 
                            let v30 = spiral_wrap_signed(v1 - v11, 32)
                            let v31 = spiral_wrap_signed(v11 + v30, 32)
                            let v32 = spiral_wrap_signed(v31 - 1, 32)
                            let v33 = spiral_string_slice(v0, v11, v32)
                            let v34 = v29 <> v33 
                            v34
                        }
                    }
                }
                False -> {
                    let v36 = spiral_wrap_signed(v3 - 1, 32)
                    let v37 = spiral_string_slice(v0, 0, v36)
                    let v38 = spiral_wrap_signed(v2 - v3, 32)
                    let v39 = spiral_wrap_signed(v3 + v38, 32)
                    let v40 = spiral_wrap_signed(v39 - 1, 32)
                    let v41 = spiral_string_slice(v0, v3, v40)
                    let v42 = unpadded_78(v41)
                    let v43 = plus_one_79(v42)
                    let v44 = v37 <> v43 
                    let v45 = spiral_wrap_signed(v1 - v2, 32)
                    let v46 = spiral_wrap_signed(v2 + v45, 32)
                    let v47 = spiral_wrap_signed(v46 - 1, 32)
                    let v48 = spiral_string_slice(v0, v2, v47)
                    let v49 = v44 <> v48 
                    v49
                }
            }
        }
    }
}

pub fn method74(v0: Uh9, v1: Uh9) -> Uh9 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = method74(v5, v1)
            let v7 = "///- --test"
            let v8 = v4 |> string.contains(v7)
            let v11 =
                case v8 {
                    True -> {
                        let v9 = break_source_75(v4)
                        let v10 = v9 != v4
                        v10
                    }
                    False -> {
                        False
                    }
                }
            case v11 {
                True -> {
                    Uh9Cons(v2, v3, v4, v6)
                }
                False -> {
                    v6
                }
            }
        }
        Uh9Nil -> {
            v1
        }
    }
}

pub fn method80(v0: Uh9, v1: Uh13, v2: Uh10, v3: Int, v4: Int) -> #(Uh10, Int, Int) {
    case v1  {
        Uh13Cons(v5, v6) -> {
            let v7 = 0
            let v8 = method72(v0, v7)
            let v9 = spiral_wrap_unsigned(v8, 64)
            let #(v10, v11, v12) = uniform_62(v9, v3, v4)
            let v13 = spiral_wrap_signed(v10, 32)
            let v14 = spiral_wrap_signed(v13 - 1, 32)
            let v15 = picked_73(v14, v0)
            let #(v28, v29, v30) =
                case v15  {
                    Us16None -> {
                        #(v2, v11, v12)
                    }
                    Us16Some(v16, v17, v18) -> {
                        let v19 = break_source_75(v18)
                        let v20 = Us14Edited(v16, v19)
                        let v21 = Us12Revision(v20)
                        let v22 = Uh10Nil
                        let v23 = Uh10Cons(v21, v22)
                        let v24 = method68(v2, v23)
                        #(v24, v11, v12)
                    }
                }
            method80(v0, v6, v28, v29, v30)
        }
        Uh13Nil -> {
            #(v2, v3, v4)
        }
    }
}

pub fn method83(v0: String, v1: Uh9, v2: Uh10, v3: Int, v4: Int) -> #(Uh10, Int, Int) {
    case v1  {
        Uh9Cons(v5, v6, v7, v8) -> {
            let v9 = 2
            let #(v10, v11, v12) = uniform_62(v9, v3, v4)
            let v13 = spiral_wrap_signed(v10, 32)
            let v14 = v13 == 1
            let v20 =
                case v14 {
                    True -> {
                        let v15 = Us15Liked(v5, v0)
                        let v16 = Us12Reaction(v15)
                        let v17 = Uh10Nil
                        let v18 = Uh10Cons(v16, v17)
                        method68(v2, v18)
                    }
                    False -> {
                        v2
                    }
                }
            method83(v0, v8, v20, v11, v12)
        }
        Uh9Nil -> {
            #(v2, v3, v4)
        }
    }
}

pub fn method84(v0: Uh9, v1: Uh9) -> Uh9 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = method84(v5, v1)
            let v7 = "///- --test"
            let v8 = v4 |> string.contains(v7)
            let v9 = v8 == False
            case v9 {
                True -> {
                    Uh9Cons(v2, v3, v4, v6)
                }
                False -> {
                    v6
                }
            }
        }
        Uh9Nil -> {
            v1
        }
    }
}

pub fn method85(v0: Uh9, v1: Uh9) -> Uh9 {
    case v0  {
        Uh9Cons(v2, v3, v4, v5) -> {
            let v6 = method85(v5, v1)
            let v7 = "///- --test"
            let v8 = v4 |> string.contains(v7)
            let v11 =
                case v8 {
                    True -> {
                        let v9 = break_source_75(v4)
                        let v10 = v9 != v4
                        v10
                    }
                    False -> {
                        False
                    }
                }
            case v11 {
                True -> {
                    Uh9Cons(v2, v3, v4, v6)
                }
                False -> {
                    v6
                }
            }
        }
        Uh9Nil -> {
            v1
        }
    }
}

pub fn method86(v0: Uh14, v1: Uh14) -> Uh14 {
    case v0  {
        Uh14Cons(v2, v3) -> {
            let v4 = method86(v3, v1)
            Uh14Cons(v2, v4)
        }
        Uh14Nil -> {
            v1
        }
    }
}

pub fn method82(v0: Uh9, v1: Uh7, v2: Uh14, v3: Uh3, v4: Int, v5: Int, v6: Int) -> #(Uh14, Uh3, Int, Int, Int) {
    let #(v206, v207, v208, v209, v210) =
        case v1  {
            Uh7Cons(v7, v8) -> {
                let v16 =
                    case v7  {
                        Us10Breaker -> {
                            let v12 = "breaker"
                            v12
                        }
                        Us10Editor -> {
                            let v11 = "editor"
                            v11
                        }
                        Us10Fickle -> {
                            let v10 = "fickle"
                            v10
                        }
                        Us10Lurker -> {
                            let v9 = "lurker"
                            v9
                        }
                    }
                let v17 = string.inspect(v6)
                let v18 = v16 <> v17 
                let #(v187, v188, v189, v190) =
                    case v7  {
                        Us10Lurker -> {
                            let v19 = Uh10Nil
                            let #(v20, v21, v22) = method83(v18, v0, v19, v4, v5)
                            let v23 = Uh3Nil
                            #(v20, v23, v21, v22)
                        }
                        _ -> {
                            let #(v183, v184, v185, v186) =
                                case v7  {
                                    Us10Fickle -> {
                                        case v0  {
                                            Uh9Nil -> {
                                                let v24 = Uh10Nil
                                                let v25 = Uh3Nil
                                                #(v24, v25, v4, v5)
                                            }
                                            _ -> {
                                                let v26 = 0
                                                let v27 = method72(v0, v26)
                                                let v28 = spiral_wrap_unsigned(v27, 64)
                                                let #(v29, v30, v31) = uniform_62(v28, v4, v5)
                                                let v32 = spiral_wrap_signed(v29, 32)
                                                let v33 = spiral_wrap_signed(v32 - 1, 32)
                                                let v34 = picked_73(v33, v0)
                                                let #(v61, v62, v63, v64) =
                                                    case v34  {
                                                        Us16Some(v35, v36, v37) -> {
                                                            let v38 = Us15Liked(v35, v18)
                                                            let v39 = Us12Reaction(v38)
                                                            let v40 = Us15Unliked(v35, v18)
                                                            let v41 = Us12Reaction(v40)
                                                            let v42 = Us15Liked(v35, v18)
                                                            let v43 = Us12Reaction(v42)
                                                            let v44 = Us15Unliked(v35, v18)
                                                            let v45 = Us12Reaction(v44)
                                                            let v46 = Us15Liked(v35, v18)
                                                            let v47 = Us12Reaction(v46)
                                                            let v48 = Uh10Nil
                                                            let v49 = Uh10Cons(v47, v48)
                                                            let v50 = Uh10Cons(v45, v49)
                                                            let v51 = Uh10Cons(v43, v50)
                                                            let v52 = Uh10Cons(v41, v51)
                                                            let v53 = Uh10Cons(v39, v52)
                                                            let v54 = Uh3Nil
                                                            #(v53, v54, v30, v31)
                                                        }
                                                        _ -> {
                                                            let #(v57, v58, v59, v60) =
                                                                case v34  {
                                                                    Us16None -> {
                                                                        let v55 = Uh10Nil
                                                                        let v56 = Uh3Nil
                                                                        #(v55, v56, v4, v5)
                                                                    }
                                                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                }
                                                            #(v57, v58, v59, v60)
                                                        }
                                                    }
                                                #(v61, v62, v63, v64)
                                            }
                                        }
                                    }
                                    _ -> {
                                        let #(v179, v180, v181, v182) =
                                            case v7  {
                                                Us10Editor -> {
                                                    let v69 = Uh9Nil
                                                    let v70 = method84(v0, v69)
                                                    case v70  {
                                                        Uh9Nil -> {
                                                            let v71 = Uh10Nil
                                                            let v72 = Uh3Nil
                                                            #(v71, v72, v4, v5)
                                                        }
                                                        _ -> {
                                                            let v73 = 0
                                                            let v74 = method72(v70, v73)
                                                            let v75 = spiral_wrap_unsigned(v74, 64)
                                                            let #(v76, v77, v78) = uniform_62(v75, v4, v5)
                                                            let v79 = spiral_wrap_signed(v76, 32)
                                                            let v80 = spiral_wrap_signed(v79 - 1, 32)
                                                            let v81 = picked_73(v80, v70)
                                                            let #(v123, v124, v125, v126) =
                                                                case v81  {
                                                                    Us16Some(v82, v83, v84) -> {
                                                                        let v85 = ""
                                                                        let v86 = " "
                                                                        let v87 = v85 <> v86 
                                                                        let v88 = v84 <> v87 
                                                                        let v89 = "\n"
                                                                        let v90 = v88 <> v89 
                                                                        let v91 = v85 <> v86 
                                                                        let v92 = v91 <> v86 
                                                                        let v93 = v84 <> v92 
                                                                        let v94 = v93 <> v89 
                                                                        let v95 = v85 <> v86 
                                                                        let v96 = v95 <> v86 
                                                                        let v97 = v96 <> v86 
                                                                        let v98 = v84 <> v97 
                                                                        let v99 = v98 <> v89 
                                                                        let v100 = Us15Liked(v82, v18)
                                                                        let v101 = Us12Reaction(v100)
                                                                        let v102 = Us14Edited(v82, v90)
                                                                        let v103 = Us12Revision(v102)
                                                                        let v104 = Us14Edited(v82, v94)
                                                                        let v105 = Us12Revision(v104)
                                                                        let v106 = Us14Edited(v82, v99)
                                                                        let v107 = Us12Revision(v106)
                                                                        let v108 = Us14Edited(v82, v84)
                                                                        let v109 = Us12Revision(v108)
                                                                        let v110 = Uh10Nil
                                                                        let v111 = Uh10Cons(v109, v110)
                                                                        let v112 = Uh10Cons(v107, v111)
                                                                        let v113 = Uh10Cons(v105, v112)
                                                                        let v114 = Uh10Cons(v103, v113)
                                                                        let v115 = Uh10Cons(v101, v114)
                                                                        let v116 = Uh3Nil
                                                                        #(v115, v116, v77, v78)
                                                                    }
                                                                    _ -> {
                                                                        let #(v119, v120, v121, v122) =
                                                                            case v81  {
                                                                                Us16None -> {
                                                                                    let v117 = Uh10Nil
                                                                                    let v118 = Uh3Nil
                                                                                    #(v117, v118, v4, v5)
                                                                                }
                                                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                            }
                                                                        #(v119, v120, v121, v122)
                                                                    }
                                                                }
                                                            #(v123, v124, v125, v126)
                                                        }
                                                    }
                                                }
                                                _ -> {
                                                    let #(v175, v176, v177, v178) =
                                                        case v7  {
                                                            Us10Breaker -> {
                                                                let v131 = Uh9Nil
                                                                let v132 = method85(v0, v131)
                                                                case v132  {
                                                                    Uh9Nil -> {
                                                                        let v133 = Uh10Nil
                                                                        let v134 = Uh3Nil
                                                                        #(v133, v134, v4, v5)
                                                                    }
                                                                    _ -> {
                                                                        let v135 = 0
                                                                        let v136 = method72(v132, v135)
                                                                        let v137 = spiral_wrap_unsigned(v136, 64)
                                                                        let #(v138, v139, v140) = uniform_62(v137, v4, v5)
                                                                        let v141 = spiral_wrap_signed(v138, 32)
                                                                        let v142 = spiral_wrap_signed(v141 - 1, 32)
                                                                        let v143 = picked_73(v142, v132)
                                                                        let #(v167, v168, v169, v170) =
                                                                            case v143  {
                                                                                Us16Some(v144, v145, v146) -> {
                                                                                    let v147 = break_source_75(v146)
                                                                                    let v148 = break_source_75(v146)
                                                                                    let v149 = Us15Liked(v144, v18)
                                                                                    let v150 = Us12Reaction(v149)
                                                                                    let v151 = Us14Edited(v144, v147)
                                                                                    let v152 = Us12Revision(v151)
                                                                                    let v153 = Us14Edited(v144, v146)
                                                                                    let v154 = Us12Revision(v153)
                                                                                    let v155 = Uh10Nil
                                                                                    let v156 = Uh10Cons(v154, v155)
                                                                                    let v157 = Uh10Cons(v152, v156)
                                                                                    let v158 = Uh10Cons(v150, v157)
                                                                                    let v159 = Uh3Nil
                                                                                    let v160 = Uh3Cons(v148, v159)
                                                                                    #(v158, v160, v139, v140)
                                                                                }
                                                                                _ -> {
                                                                                    let #(v163, v164, v165, v166) =
                                                                                        case v143  {
                                                                                            Us16None -> {
                                                                                                let v161 = Uh10Nil
                                                                                                let v162 = Uh3Nil
                                                                                                #(v161, v162, v4, v5)
                                                                                            }
                                                                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                                        }
                                                                                    #(v163, v164, v165, v166)
                                                                                }
                                                                            }
                                                                        #(v167, v168, v169, v170)
                                                                    }
                                                                }
                                                            }
                                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                        }
                                                    #(v175, v176, v177, v178)
                                                }
                                            }
                                        #(v179, v180, v181, v182)
                                    }
                                }
                            #(v183, v184, v185, v186)
                        }
                    }
                let v191 = Uh14Nil
                let v192 = Uh14Cons(v187, v191)
                let v193 = method86(v2, v192)
                let v194 = method15(v3, v188)
                let v195 = spiral_wrap_signed(v6 + 1, 32)
                method82(v0, v8, v193, v194, v189, v190, v195)
            }
            _ -> {
                let #(v201, v202, v203, v204, v205) =
                    case v1  {
                        Uh7Nil -> {
                            #(v2, v3, v4, v5, v6)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v201, v202, v203, v204, v205)
            }
        }
    #(v206, v207, v208, v209, v210)
}

pub fn method89(v0: Uh10, v1: Int) -> Int {
    case v0  {
        Uh10Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method89(v3, v4)
        }
        Uh10Nil -> {
            v1
        }
    }
}
