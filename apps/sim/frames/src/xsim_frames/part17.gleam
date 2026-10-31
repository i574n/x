import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/list
import gleam/option
import gleam/order
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh0, type Uh1, type Uh2, type Uh3, type Us2, type Uh15, type Us30, type Us45, type Uh28, type Us75, type Uh31, type Uh32, type Us76, type Us77, type Uh33, type Us79, Uh0Cons, Uh0Nil, Uh13Cons, Uh13Nil, Uh15Cons, Uh15Nil, Uh1Cons, Uh2Cons, Uh31Cons, Uh31Nil, Uh32Cons, Uh32Nil, Uh33Cons, Uh33Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us3None, Us3Some, Us45Crashed, Us45Done, Us45Erred, Us56Error, Us56Ok, Us61Error, Us61Ok, Us75OnBluesky, Us75OnMastodon, Us75OnX, Us76Error, Us76Ok, Us77Error, Us77Ok, Us78None, Us78Some, Us79None, Us79Some}
import xsim_frames/part1.{closure1, method4, spiral_string_length, spiral_wrap_signed, unicode_erlang_characters_to_binary, unicode_erlang_nfc}
import xsim_frames/part10.{method259, method260}
import xsim_frames/part11.{method274, method275}
import xsim_frames/part12.{chain_sources_284}
import xsim_frames/part15.{closure95, closure96}
import xsim_frames/part16.{defused_dots_by_307, defused_entities_328, glued_348, method350}
import xsim_frames/part2.{concat_balanced_22, method20, method25, method26}
import xsim_frames/part7.{method165, method166}

pub fn method349(v0: Us75, v1: Uh3, v2: Uh31) -> Uh31 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method349(v0, v4, v2)
            let #(v88, v89) =
                case v0  {
                    Us75OnX -> {
                        let v6 = option.from_result(result.map(list.first(string.to_utf_codepoints(v3)), string.utf_codepoint_to_int))
                        let v7 = closure96(Nil)
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
                                            True -> True
                                            False -> {
                                                let v13 = unicode_erlang_characters_to_binary([65039])
                                                let v14 = v13 == ""
                                                let v24 =
                                                    case v14 {
                                                        True -> 0
                                                        False -> {
                                                            let v15 = option.from_result(result.map(string.split_once(v3, v13), pair.first))
                                                            let v16 = closure1(Nil)
                                                            let v17 = v15 |> option.map(v16)
                                                            let v18 = Us2None
                                                            let v19 = v17 |> option.unwrap(v18)
                                                            case v19  {
                                                                Us2None -> -1
                                                                Us2Some(v20) -> {
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
                                                                False -> False
                                                            }
                                                        let v30 =
                                                            case v28 {
                                                                True -> True
                                                                False -> {
                                                                    let v29 = v9 == 169
                                                                    v29
                                                                }
                                                            }
                                                        let v32 =
                                                            case v30 {
                                                                True -> True
                                                                False -> {
                                                                    let v31 = v9 == 174
                                                                    v31
                                                                }
                                                            }
                                                        let v34 =
                                                            case v32 {
                                                                True -> True
                                                                False -> {
                                                                    let v33 = v9 == 12336
                                                                    v33
                                                                }
                                                            }
                                                        let v36 =
                                                            case v34 {
                                                                True -> True
                                                                False -> {
                                                                    let v35 = v9 == 12349
                                                                    v35
                                                                }
                                                            }
                                                        let v38 =
                                                            case v36 {
                                                                True -> True
                                                                False -> {
                                                                    let v37 = v9 == 12951
                                                                    v37
                                                                }
                                                            }
                                                        case v38 {
                                                            True -> True
                                                            False -> {
                                                                let v39 = v9 == 12953
                                                                v39
                                                            }
                                                        }
                                                    }
                                                    False -> False
                                                }
                                            }
                                        }
                                    case v42 {
                                        True -> True
                                        False -> {
                                            let v43 = unicode_erlang_characters_to_binary([8419])
                                            let v44 = v43 == ""
                                            let v54 =
                                                case v44 {
                                                    True -> 0
                                                    False -> {
                                                        let v45 = option.from_result(result.map(string.split_once(v3, v43), pair.first))
                                                        let v46 = closure1(Nil)
                                                        let v47 = v45 |> option.map(v46)
                                                        let v48 = Us2None
                                                        let v49 = v47 |> option.unwrap(v48)
                                                        case v49  {
                                                            Us2None -> -1
                                                            Us2Some(v50) -> {
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
                                                            True -> True
                                                            False -> {
                                                                let v57 = v9 == 42
                                                                v57
                                                            }
                                                        }
                                                    case v58 {
                                                        True -> True
                                                        False -> {
                                                            let v59 = v9 >= 48
                                                            case v59 {
                                                                True -> {
                                                                    let v60 = v9 <= 57
                                                                    v60
                                                                }
                                                                False -> False
                                                            }
                                                        }
                                                    }
                                                }
                                                False -> False
                                            }
                                        }
                                    }
                                }
                                False -> False
                            }
                        let v76 =
                            case v65 {
                                True -> 2
                                False -> {
                                    let v66 = string.to_utf_codepoints(v3)
                                    let v67 = v66 |> list.reverse
                                    let v68 = Uh13Nil
                                    let listm_fold = v67 |> list.fold (v68, fn (acc, x) {
                                    let v69 = x
                                    let v70 = string.utf_codepoint_to_int(v69)
                                    let v71 = acc
                                    let v72 = Uh13Cons(v70, v71)
                                    v72
                                    })
                                    let v73 = listm_fold
                                    let v74 = 0
                                    method350(v73, v74)
                                }
                            }
                        #(v3, v76)
                    }
                    _ -> {
                        let #(v86, v87) =
                            case v0  {
                                Us75OnMastodon -> #(v3, 1)
                                _ -> {
                                    let #(v84, v85) =
                                        case v0  {
                                            Us75OnBluesky(v77, v78) -> {
                                                let v79 = spiral_string_length(v3)
                                                let v80 = spiral_wrap_signed(v79 + 9, 32)
                                                let v81 = v80 / 10
                                                let v82 = v81 < 1
                                                let v83 =
                                                    case v82 {
                                                        True -> 1
                                                        False -> v81
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
            Uh31Cons(v88, v89, v5)
        }
        Uh3Nil -> v2
    }
}

pub fn units_on_347(v0: Us75, v1: String) -> Uh31 {
    let v29 =
        case v0  {
            Us75OnBluesky(v18, v19) -> {
                let v20 = string.to_graphemes(v1)
                let v21 = v20 |> list.reverse
                let v22 = Uh3Nil
                let listm_fold = v21 |> list.fold (v22, fn (acc, x) {
                let v23 = x
                let v24 = acc
                let v25 = Uh3Cons(v23, v24)
                v25
                })
                let v26 = listm_fold
                v26
            }
            Us75OnMastodon -> {
                let v11 = string.to_graphemes(v1)
                let v12 = v11 |> list.reverse
                let v13 = Uh3Nil
                let listm_fold = v12 |> list.fold (v13, fn (acc, x) {
                let v14 = x
                let v15 = acc
                let v16 = Uh3Cons(v14, v15)
                v16
                })
                let v17 = listm_fold
                v17
            }
            Us75OnX -> {
                let v2 = string.to_graphemes(v1)
                let v3 = v2 |> list.reverse
                let v4 = Uh3Nil
                let listm_fold = v3 |> list.fold (v4, fn (acc, x) {
                let v5 = x
                let v6 = acc
                let v7 = Uh3Cons(v5, v6)
                v7
                })
                let v8 = listm_fold
                let v9 = Uh3Nil
                glued_348(v8, v9)
            }
        }
    let v30 = Uh31Nil
    method349(v0, v29, v30)
}

pub fn prefix_text_352(v0: Int, v1: Uh31, v2: String) -> String {
    case v1  {
        Uh31Cons(v3, v4, v5) -> {
            let v6 = v0 > 0
            case v6 {
                True -> {
                    let v7 = spiral_wrap_signed(v0 - 1, 32)
                    let v8 = v2 <> v3 
                    prefix_text_352(v7, v5, v8)
                }
                False -> v2
            }
        }
        _ -> v2
    }
}

pub fn link_length_353(v0: Uh31, v1: Int) -> Int {
    case v0  {
        Uh31Cons(v2, v3, v4) -> {
            let v5 = string.to_utf_codepoints(v2)
            let v6 = v5 |> list.reverse
            let v7 = Uh13Nil
            let listm_fold = v6 |> list.fold (v7, fn (acc, x) {
            let v8 = x
            let v9 = string.utf_codepoint_to_int(v8)
            let v10 = acc
            let v11 = Uh13Cons(v9, v10)
            v11
            })
            let v12 = listm_fold
            let v13 = method165()
            let v14 = method166(v13, v12)
            let v15 = v14 == False
            let v16 = v15 == False
            case v16 {
                True -> {
                    let v17 = spiral_wrap_signed(v1 + 1, 32)
                    link_length_353(v4, v17)
                }
                False -> v1
            }
        }
        _ -> v1
    }
}

pub fn method354(v0: Uh31, v1: Uh31) -> Uh31 {
    case v0  {
        Uh31Cons(v2, v3, v4) -> {
            let v5 = Uh31Cons(v2, v3, v1)
            method354(v4, v5)
        }
        Uh31Nil -> v1
    }
}

pub fn linked_351(v0: Uh31, v1: Uh31) -> Uh31 {
    case v0  {
        Uh31Cons(v4, v5, v6) -> {
            let v7 = 7
            let v8 = ""
            let v9 = prefix_text_352(v7, v0, v8)
            let v10 = v9 == "http://"
            let v14 =
                case v10 {
                    True -> True
                    False -> {
                        let v11 = 8
                        let v12 = prefix_text_352(v11, v0, v8)
                        let v13 = v12 == "https://"
                        v13
                    }
                }
            case v14 {
                True -> {
                    let v15 = 0
                    let v16 = link_length_353(v0, v15)
                    let v17 = spiral_wrap_signed(23 - v16, 32)
                    let v18 = v17 > 0
                    let #(v20, v21) =
                        case v18 {
                            True -> {
                                let v19 = spiral_wrap_signed(v5 + v17, 32)
                                #(v4, v19)
                            }
                            False -> #(v4, v5)
                        }
                    let v22 = Uh31Cons(v20, v21, v1)
                    linked_351(v6, v22)
                }
                False -> {
                    let v24 = Uh31Cons(v4, v5, v1)
                    linked_351(v6, v24)
                }
            }
        }
        Uh31Nil -> {
            let v2 = Uh31Nil
            method354(v1, v2)
        }
    }
}

pub fn method355(v0: Uh31, v1: Int) -> Int {
    case v0  {
        Uh31Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + v3, 32)
            method355(v4, v5)
        }
        Uh31Nil -> v1
    }
}

pub fn closure100(capt: #(Us75)) -> fn(String) -> Int {
    fn (v1) {
        let #(v0) = capt
        let v13 =
            case v0  {
                Us75OnBluesky(v8, v9) -> units_on_347(v0, v1)
                Us75OnMastodon -> {
                    let v4 = Us75OnMastodon
                    let v5 = units_on_347(v4, v1)
                    let v6 = Uh31Nil
                    linked_351(v5, v6)
                }
                Us75OnX -> {
                    let v2 = Us75OnX
                    units_on_347(v2, v1)
                }
            }
        let v14 = 0
        method355(v13, v14)
    }
}

pub fn closure101(capt: Nil) -> fn(#(String, Int)) -> Bool {
    fn (dom) {
        let #(v0, _v1) = dom
        let v2 = string.to_utf_codepoints(v0)
        let v3 = v2 |> list.reverse
        let v4 = Uh13Nil
        let listm_fold = v3 |> list.fold (v4, fn (acc, x) {
        let v5 = x
        let v6 = string.utf_codepoint_to_int(v5)
        let v7 = acc
        let v8 = Uh13Cons(v6, v7)
        v8
        })
        let v9 = listm_fold
        let v10 = method165()
        let v11 = method166(v10, v9)
        let v12 = v11 == False
        let v13 = v12 == False
        v13
    }
}

pub fn taken_while_360(v0: fn(#(String, Int)) -> Bool, v1: Uh31, v2: Uh31) -> #(Uh31, Uh31) {
    case v1  {
        Uh31Cons(v3, v4, v5) -> {
            let v6 = v0(#(v3, v4))
            case v6 {
                True -> {
                    let v7 = Uh31Cons(v3, v4, v2)
                    taken_while_360(v0, v5, v7)
                }
                False -> {
                    let v10 = Uh31Nil
                    let v11 = method354(v2, v10)
                    #(v11, v1)
                }
            }
        }
        _ -> {
            let v14 = Uh31Nil
            let v15 = method354(v2, v14)
            #(v15, v1)
        }
    }
}

pub fn closure102(capt: Nil) -> fn(#(String, Int)) -> Bool {
    fn (dom) {
        let #(v0, _v1) = dom
        let v2 = string.to_utf_codepoints(v0)
        let v3 = v2 |> list.reverse
        let v4 = Uh13Nil
        let listm_fold = v3 |> list.fold (v4, fn (acc, x) {
        let v5 = x
        let v6 = string.utf_codepoint_to_int(v5)
        let v7 = acc
        let v8 = Uh13Cons(v6, v7)
        v8
        })
        let v9 = listm_fold
        let v10 = method165()
        let v11 = method166(v10, v9)
        let v12 = v11 == False
        v12
    }
}

pub fn method361(v0: Uh31, v1: Int) -> Int {
    case v0  {
        Uh31Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + 1, 32)
            method361(v4, v5)
        }
        Uh31Nil -> v1
    }
}

pub fn method362(v0: Uh31, v1: Uh31) -> Uh31 {
    case v0  {
        Uh31Cons(v2, v3, v4) -> {
            let v5 = method362(v4, v1)
            Uh31Cons(v2, v3, v5)
        }
        Uh31Nil -> v1
    }
}

pub fn split_point_359(v0: Uh31) -> #(Uh31, Uh31) {
    let v1 = closure101(Nil)
    let v2 = Uh31Nil
    let #(v3, v4) = taken_while_360(v1, v0, v2)
    let v5 = closure102(Nil)
    let v6 = Uh31Nil
    let #(v7, v8) = taken_while_360(v5, v4, v6)
    let v9 =
        case v8  {
            Uh31Nil -> False
            _ -> True
        }
    let v16 =
        case v9 {
            True -> {
                let v10 = 0
                let v11 = method361(v3, v10)
                let v12 = 0
                let v13 = method361(v7, v12)
                let v14 = spiral_wrap_signed(v11 + v13, 32)
                let v15 = v14 <= 60
                v15
            }
            False -> False
        }
    case v16 {
        True -> {
            let v17 = method362(v3, v7)
            #(v17, v8)
        }
        False -> {
            let v18 = Uh31Nil
            let #(v19, v20) = taken_while_360(v5, v0, v18)
            let v21 =
                case v20  {
                    Uh31Nil -> False
                    _ -> True
                }
            case v21 {
                True -> #(v19, v20)
                False -> {
                    let v22 = Uh31Nil
                    #(v22, v0)
                }
            }
        }
    }
}

pub fn method363(v0: Uh31, v1: Uh3) -> Uh3 {
    case v0  {
        Uh31Cons(v2, v3, v4) -> {
            let v5 = method363(v4, v1)
            Uh3Cons(v2, v5)
        }
        Uh31Nil -> v1
    }
}

pub fn chunk_358(v0: Int, v1: Uh31, v2: Uh31, v3: Int, v4: Uh3) -> Uh3 {
    case v1  {
        Uh31Cons(v15, v16, v17) -> {
            let v18 = spiral_wrap_signed(v3 + v16, 32)
            let v19 = v18 <= v0
            let v22 =
                case v19 {
                    True -> True
                    False -> {
                        let v20 =
                            case v2  {
                                Uh31Nil -> False
                                _ -> True
                            }
                        let v21 = v20 == False
                        v21
                    }
                }
            case v22 {
                True -> {
                    let v23 = Uh31Cons(v15, v16, v2)
                    chunk_358(v0, v17, v23, v18, v4)
                }
                False -> {
                    let #(v25, v26) = split_point_359(v2)
                    let v27 = Uh31Nil
                    let v28 = method354(v25, v27)
                    let v29 = method362(v28, v1)
                    let v37 =
                        case v26  {
                            Uh31Nil -> v4
                            _ -> {
                                let v30 = Uh31Nil
                                let v31 = method354(v26, v30)
                                let v32 = Uh3Nil
                                let v33 = method363(v31, v32)
                                let v34 = ""
                                let v35 = concat_balanced_22(v34, v33)
                                Uh3Cons(v35, v4)
                            }
                        }
                    let v38 = Uh31Nil
                    let v39 = 0
                    chunk_358(v0, v29, v38, v39, v37)
                }
            }
        }
        Uh31Nil -> {
            let v12 =
                case v2  {
                    Uh31Nil -> v4
                    _ -> {
                        let v5 = Uh31Nil
                        let v6 = method354(v2, v5)
                        let v7 = Uh3Nil
                        let v8 = method363(v6, v7)
                        let v9 = ""
                        let v10 = concat_balanced_22(v9, v8)
                        Uh3Cons(v10, v4)
                    }
                }
            let v13 = Uh3Nil
            method4(v12, v13)
        }
    }
}

pub fn chunks_of_357(v0: Int, v1: String, v2: fn(String) -> Int, v3: Uh31, v4: Int) -> Uh3 {
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
    let v17 = Uh31Nil
    let v18 = 0
    let v19 = Uh3Nil
    let v20 = chunk_358(v16, v3, v17, v18, v19)
    let v21 = 0
    let v22 = method20(v20, v21)
    let v23 = string.inspect(v22)
    let v24 = spiral_string_length(v23)
    let v25 = string.inspect(v4)
    let v26 = spiral_string_length(v25)
    let v27 = v24 > v26
    case v27 {
        True -> chunks_of_357(v0, v1, v2, v3, v22)
        False -> v20
    }
}

pub fn split_units_356(v0: Int, v1: String, v2: fn(String) -> Int, v3: Uh31) -> Uh3 {
    let v4 = 9
    chunks_of_357(v0, v1, v2, v3, v4)
}

pub fn split_cell_on_346(v0: Us75, v1: String, v2: Int, v3: String) -> Uh3 {
    let v4 = closure100(#(v0))
    let v5 = unicode_erlang_nfc(v3)
    let v17 =
        case v0  {
            Us75OnBluesky(v12, v13) -> units_on_347(v0, v5)
            Us75OnMastodon -> {
                let v8 = Us75OnMastodon
                let v9 = units_on_347(v8, v5)
                let v10 = Uh31Nil
                linked_351(v9, v10)
            }
            Us75OnX -> {
                let v6 = Us75OnX
                units_on_347(v6, v5)
            }
        }
    split_units_356(v2, v1, v4, v17)
}

pub fn split_cell_305(v0: String, v1: Int, v2: String) -> Uh3 {
    let v3 = Us75OnX
    let v4 = closure95(Nil)
    let v5 = defused_dots_by_307(v4, v2)
    let v6 = defused_entities_328(v5)
    split_cell_on_346(v3, v0, v1, v6)
}

pub fn closure94(capt: #(String, Int)) -> fn(String) -> Uh3 {
    fn (v2) {
        let #(v0, v1) = capt
        split_cell_305(v0, v1, v2)
    }
}

pub fn closure93(capt: #(String)) -> fn(Int) -> fn(String) -> Uh3 {
    fn (v1) {
        let #(v0) = capt
        closure94(#(v0, v1))
    }
}

pub fn closure92(capt: Nil) -> fn(String) -> fn(Int) -> fn(String) -> Uh3 {
    fn (v0) {
        closure93(#(v0))
    }
}

pub fn method365(v0: Uh32, v1: Uh32) -> Uh32 {
    case v0  {
        Uh32Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40) -> {
            let v41 = Uh32Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v1)
            method365(v40, v41)
        }
        Uh32Nil -> v1
    }
}

pub fn ok_c103(capt: Nil) -> fn(BitArray) -> Us76 {
    fn (v0) {
        Us76Ok(v0)
    }
}

pub fn method366() -> fn(BitArray) -> Us76 {
    ok_c103(Nil)
}

pub fn error_c104(capt: Nil) -> fn(Dynamic) -> Us76 {
    fn (v0) {
        Us76Error(v0)
    }
}

pub fn method367() -> fn(Dynamic) -> Us76 {
    error_c104(Nil)
}

pub fn method368(v0: Uh15, v1: Int) -> Int {
    case v0  {
        Uh15Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + 1, 32)
            method368(v4, v5)
        }
        Uh15Nil -> v1
    }
}

pub fn ok_c105(capt: Nil) -> fn(#(String, Us45, String)) -> Us77 {
    fn (dom) {
        let #(v0, v1, v2) = dom
        Us77Ok(v0, v1, v2)
    }
}

pub fn method370() -> fn(#(String, Us45, String)) -> Us77 {
    ok_c105(Nil)
}

pub fn error_c106(capt: Nil) -> fn(Nil) -> Us77 {
    fn (dom) {
        Us77Error
    }
}

pub fn method371() -> fn(Nil) -> Us77 {
    error_c106(Nil)
}

pub fn shown_inserted_372(v0: String, v1: String, v2: Bool, v3: String, v4: Uh0) -> Uh0 {
    case v4  {
        Uh0Cons(v5, v6, v7, v8, v9) -> {
            let v10 = string.compare(v5, v0) == order.Lt
            let v13 =
                case v10 {
                    True -> -1
                    False -> {
                        let v11 = string.compare(v5, v0) == order.Gt
                        case v11 {
                            True -> 1
                            False -> 0
                        }
                    }
                }
            let v14 = v13 == -1
            case v14 {
                True -> {
                    let v15 = shown_inserted_372(v0, v1, v2, v3, v9)
                    Uh0Cons(v5, v6, v7, v8, v15)
                }
                False -> Uh0Cons(v0, v1, v2, v3, v4)
            }
        }
        _ -> Uh0Cons(v0, v1, v2, v3, v4)
    }
}

pub fn method369(v0: dict.Dict(String, #(String, Us45, String)), v1: Uh3, v2: Uh0) -> Uh0 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = dict.get(v0, v3)
            let v6 = method370()
            let v7 = method371()
            let v8 = case v5 { Ok(x) -> v6(x) Error(x) -> v7(x) }
            let v15 =
                case v8  {
                    Us77Error -> Us78None
                    Us77Ok(v9, v10, v11) -> Us78Some(v9, v10, v11)
                }
            let #(v25, v26, v27) =
                case v15  {
                    Us78Some(v16, v17, v18) -> #(v16, v17, v18)
                    _ -> {
                        let #(v22, v23, v24) =
                            case v15  {
                                Us78None -> panic as "dictm.present: the key is not in the dict"
                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                            }
                        #(v22, v23, v24)
                    }
                }
            let v28 =
                case v26  {
                    Us45Done -> True
                    _ -> False
                }
            let v34 =
                case v26  {
                    Us45Crashed -> {
                        let v31 = "crash"
                        v31
                    }
                    Us45Done -> {
                        let v29 = "ok"
                        v29
                    }
                    Us45Erred -> {
                        let v30 = "error"
                        v30
                    }
                }
            let v35 = "|"
            let v36 = v34 <> v35 
            let v37 = v36 <> v27 
            let v38 = shown_inserted_372(v3, v25, v28, v37, v2)
            method369(v0, v4, v38)
        }
        Uh3Nil -> v2
    }
}

pub fn method373(v0: dict.Dict(String, String), v1: Uh3, v2: Uh1) -> Uh1 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = dict.get(v0, v3)
            let v6 = method259()
            let v7 = method260()
            let v8 = case v5 { Ok(x) -> v6(x) Error(x) -> v7(x) }
            let v13 =
                case v8  {
                    Us56Error -> Us2None
                    Us56Ok(v9) -> Us2Some(v9)
                }
            let v17 =
                case v13  {
                    Us2None -> panic as "dictm.present: the key is not in the dict"
                    Us2Some(v14) -> v14
                }
            let v18 = Uh1Cons(v3, v17, v2)
            method373(v0, v4, v18)
        }
        Uh3Nil -> v2
    }
}

pub fn method374(v0: dict.Dict(String, Int), v1: Uh3, v2: Uh2) -> Uh2 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = dict.get(v0, v3)
            let v6 = method274()
            let v7 = method275()
            let v8 = case v5 { Ok(x) -> v6(x) Error(x) -> v7(x) }
            let v13 =
                case v8  {
                    Us61Error -> Us3None
                    Us61Ok(v9) -> Us3Some(v9)
                }
            let v17 =
                case v13  {
                    Us3None -> panic as "dictm.present: the key is not in the dict"
                    Us3Some(v14) -> v14
                }
            let v18 = Uh2Cons(v3, v17, v2)
            method374(v0, v4, v18)
        }
        Uh3Nil -> v2
    }
}

pub fn method375(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: Uh0, v8: Uh0) -> Uh0 {
    case v7  {
        Uh0Cons(v9, v10, v11, v12, v13) -> {
            let v14 = method375(v0, v1, v2, v3, v4, v5, v6, v13, v8)
            let v15 = method25(v9, v10, v11, v12)
            let v16 = method26(v9, v10, v11, v12, v15, v1)
            case v16 {
                True -> Uh0Cons(v9, v10, v11, v12, v14)
                False -> v14
            }
        }
        Uh0Nil -> v8
    }
}

pub fn method376(v0: dict.Dict(Int, Nil), v1: Uh15, v2: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v3: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v4: dict.Dict(String, String), v5: dict.Dict(String, Uh3), v6: dict.Dict(String, dict.Dict(String, Nil)), v7: dict.Dict(String, #(Int, Bool)), v8: dict.Dict(String, Nil), v9: Int, v10: Int, v11: Int, v12: Int, v13: dict.Dict(String, Uh3), v14: Uh3, v15: dict.Dict(String, #(Us45, String)), v16: dict.Dict(String, Int), v17: dict.Dict(String, String), v18: dict.Dict(String, String), v19: dict.Dict(String, Int), v20: Int, v21: dict.Dict(String, Int), v22: dict.Dict(String, Int), v23: dict.Dict(String, Int), v24: Int, v25: Int, v26: Int, v27: Int, v28: Int, v29: dict.Dict(String, #(String, Us45, String)), v30: Bool, v31: Bool, v32: Us30, v33: Bool, v34: Int, v35: Uh28, v36: fn(Uh3) -> #(Us45, String), v37: Uh0, v38: Uh33) -> Uh33 {
    case v37  {
        Uh0Cons(v39, v40, v41, v42, v43) -> {
            let v44 = Us2Some(v39)
            let v45 = Uh3Nil
            let v46 = chain_sources_284(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v44, v45)
            let v47 = "\n"
            let v48 = concat_balanced_22(v47, v46)
            let #(v49, v50) = v36(v46)
            let v51 = Uh33Cons(v48, v49, v50, v38)
            method376(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v43, v51)
        }
        Uh0Nil -> v38
    }
}

pub fn method378(v0: Uh3, v1: Uh33) -> Us79 {
    case v1  {
        Uh33Cons(v3, v4, v5, v6) -> {
            let v7 = "\n"
            let v8 = concat_balanced_22(v7, v0)
            let v9 = v3 == v8
            case v9 {
                True -> Us79Some(v3, v4, v5)
                False -> method378(v0, v6)
            }
        }
        Uh33Nil -> Us79None
    }
}
