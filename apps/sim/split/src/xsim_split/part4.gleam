import gleam/bit_array
import gleam/list
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_split/types.{type ListString, type Us0, type Uh4, ListStringCons, ListStringNil, Uh3Cons, Uh3Nil, Uh4Cons, Uh4Nil, Us0OnBluesky, Us0OnMastodon, Us0OnX, Us1None, Us1Some}
import xsim_split/part1.{closure1, concat_balanced_22, method10, spiral_string_length, spiral_string_slice, spiral_wrap_signed, unicode_erlang_characters_to_binary}
import xsim_split/part2.{closure3, defused_dots_by_2, defused_entities_27, method26}
import xsim_split/part3.{closure0, delimited_66, method53, method54, method65, split_cell_0, split_cell_on_45}

pub fn closure11(capt: Nil) -> fn(#(String, Int, String)) -> String {
    fn (dom) {
        let #(v0, v1, v2) = dom
        let v3 = split_cell_0(v0, v1, v2)
        let v4 = unicode_erlang_characters_to_binary([0])
        delimited_66(v4, v3)
    }
}

pub fn split_list_68(v0: String, v1: String) -> ListString {
    let v2 = v0 == ""
    let v12 =
        case v2 {
            True -> {
                0
            }
            False -> {
                let v3 = option.from_result(result.map(string.split_once(v1, v0), pair.first))
                let v4 = closure3(Nil)
                let v5 = v3 |> option.map(v4)
                let v6 = Us1None
                let v7 = v5 |> option.unwrap(v6)
                case v7  {
                    Us1None -> {
                        -1
                    }
                    Us1Some(v8) -> {
                        let v9 = bit_array.byte_size(bit_array.from_string(v8))
                        v9
                    }
                }
            }
        }
    let v13 = spiral_string_length(v0)
    let v14 = v12 < 0
    let v16 =
        case v14 {
            True -> {
                True
            }
            False -> {
                let v15 = v13 == 0
                v15
            }
        }
    case v16 {
        True -> {
            let v17 = ListStringNil
            ListStringCons(v1, v17)
        }
        False -> {
            let v19 = spiral_wrap_signed(v12 - 1, 32)
            let v20 = spiral_string_slice(v1, 0, v19)
            let v21 = spiral_wrap_signed(v12 + v13, 32)
            let v22 = spiral_string_length(v1)
            let v23 = spiral_wrap_signed(v22 - v12, 32)
            let v24 = spiral_wrap_signed(v23 - v13, 32)
            let v25 = spiral_wrap_signed(v21 + v24, 32)
            let v26 = spiral_wrap_signed(v25 - 1, 32)
            let v27 = spiral_string_slice(v1, v21, v26)
            let v28 = split_list_68(v0, v27)
            ListStringCons(v20, v28)
        }
    }
}

pub fn blank_tail_length_71(v0: ListString, v1: Int) -> Int {
    case v0  {
        ListStringCons(v2, v3) -> {
            let v4 = string.to_utf_codepoints(v2)
            let v5 = v4 |> list.reverse
            let v6 = Uh3Nil
            let listm_fold = v5 |> list.fold (v6, fn (acc, x) {
            let v7 = x
            let v8 = string.utf_codepoint_to_int(v7)
            let v9 = acc
            let v10 = Uh3Cons(v8, v9)
            v10
            })
            let v11 = listm_fold
            let v12 = method53()
            let v13 = method54(v12, v11)
            let v14 = v13 == False
            case v14 {
                True -> {
                    let v15 = spiral_string_length(v2)
                    let v16 = spiral_wrap_signed(v1 + v15, 32)
                    blank_tail_length_71(v3, v16)
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

pub fn with_blanks_72(v0: Int, v1: ListString) -> ListString {
    let v2 = v0 <= 0
    case v2 {
        True -> {
            v1
        }
        False -> {
            let v3 = spiral_wrap_signed(v0 - 1, 32)
            let v4 = ""
            let v5 = ListStringCons(v4, v1)
            with_blanks_72(v3, v5)
        }
    }
}

pub fn step_70(v0: ListString, v1: ListString, v2: Int, v3: Bool, v4: String) -> #(ListString, ListString, Int, Bool) {
    let v5 = v4 == ""
    let #(v46, v47, v48, v49) =
        case v5 {
            True -> {
                let v6 = spiral_wrap_signed(v2 + 1, 32)
                #(v0, v1, v6, v3)
            }
            False -> {
                let v7 = v2 > 0
                let v8 = v7 && v3
                let v15 =
                    case v8 {
                        True -> {
                            let v9 = " "
                            let v10 = v4 |> string.starts_with(v9)
                            let v13 =
                                case v10 {
                                    True -> {
                                        True
                                    }
                                    False -> {
                                        let v11 = "\t"
                                        let v12 = v4 |> string.starts_with(v11)
                                        v12
                                    }
                                }
                            let v14 = v13 == False
                            v14
                        }
                        False -> {
                            False
                        }
                    }
                let #(v42, v43, v44, v45) =
                    case v15 {
                        True -> {
                            let v16 = ListStringNil
                            let v17 = method10(v1, v16)
                            let v18 = "\n"
                            let v19 = concat_balanced_22(v18, v17)
                            let v20 = spiral_string_length(v19)
                            let v21 = string.to_graphemes(v19)
                            let v22 = v21 |> list.reverse
                            let v23 = ListStringNil
                            let listm_fold = v22 |> list.fold (v23, fn (acc, x) {
                            let v24 = x
                            let v25 = acc
                            let v26 = ListStringCons(v24, v25)
                            v26
                            })
                            let v27 = listm_fold
                            let v28 = ListStringNil
                            let v29 = method10(v27, v28)
                            let v30 = 0
                            let v31 = blank_tail_length_71(v29, v30)
                            let v32 = spiral_wrap_signed(v20 - v31, 32)
                            let v33 = spiral_wrap_signed(v32 - 1, 32)
                            let v34 = spiral_string_slice(v19, 0, v33)
                            let v35 = spiral_wrap_signed(v2 - 1, 32)
                            let v36 = ListStringNil
                            let v37 = with_blanks_72(v35, v36)
                            let v38 = ListStringCons(v34, v0)
                            let v39 = ListStringCons(v4, v37)
                            #(v38, v39, 0, True)
                        }
                        False -> {
                            let v40 = with_blanks_72(v2, v1)
                            let v41 = ListStringCons(v4, v40)
                            #(v0, v41, 0, True)
                        }
                    }
                #(v42, v43, v44, v45)
            }
        }
    #(v46, v47, v48, v49)
}

pub fn method69(v0: ListString, v1: ListString, v2: ListString, v3: Int, v4: Bool) -> #(ListString, ListString, Int, Bool) {
    let #(v19, v20, v21, v22) =
        case v0  {
            ListStringCons(v5, v6) -> {
                let #(v7, v8, v9, v10) = step_70(v1, v2, v3, v4, v5)
                method69(v6, v7, v8, v9, v10)
            }
            _ -> {
                let #(v15, v16, v17, v18) =
                    case v0  {
                        ListStringNil -> {
                            #(v1, v2, v3, v4)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v15, v16, v17, v18)
            }
        }
    #(v19, v20, v21, v22)
}

pub fn file_cells_67(v0: String) -> ListString {
    let v1 = "\r\n"
    let v2 = "\n"
    let v3 = v0 |> string.replace(v1, v2)
    let v4 = v3 |> string.ends_with(v2)
    let v9 =
        case v4 {
            True -> {
                let v5 = spiral_string_length(v3)
                let v6 = spiral_wrap_signed(v5 - 1, 32)
                let v7 = spiral_wrap_signed(v6 - 1, 32)
                let v8 = spiral_string_slice(v3, 0, v7)
                v8
            }
            False -> {
                v3
            }
        }
    let v10 = v9 == ""
    case v10 {
        True -> {
            ListStringNil
        }
        False -> {
            let v12 = split_list_68(v2, v9)
            let v13 = ListStringNil
            let v14 = ListStringNil
            let v15 = 0
            let v16 = False
            let #(v17, v18, v19, _v20) = method69(v12, v13, v14, v15, v16)
            let v21 = with_blanks_72(v19, v18)
            let v22 = ListStringNil
            let v23 = method10(v21, v22)
            let v24 = concat_balanced_22(v2, v23)
            let v25 = spiral_string_length(v24)
            let v26 = string.to_graphemes(v24)
            let v27 = v26 |> list.reverse
            let v28 = ListStringNil
            let listm_fold = v27 |> list.fold (v28, fn (acc, x) {
            let v29 = x
            let v30 = acc
            let v31 = ListStringCons(v29, v30)
            v31
            })
            let v32 = listm_fold
            let v33 = ListStringNil
            let v34 = method10(v32, v33)
            let v35 = 0
            let v36 = blank_tail_length_71(v34, v35)
            let v37 = spiral_wrap_signed(v25 - v36, 32)
            let v38 = spiral_wrap_signed(v37 - 1, 32)
            let v39 = spiral_string_slice(v24, 0, v38)
            let v40 = ListStringNil
            let v41 = ListStringCons(v39, v40)
            method10(v17, v41)
        }
    }
}

pub fn closure12(capt: Nil) -> fn(String) -> ListString {
    fn (v0) {
        file_cells_67(v0)
    }
}

pub fn closure15(capt: #(Us0, Int)) -> fn(String) -> ListString {
    fn (v2) {
        let #(v0, v1) = capt
        let v10 =
            case v0  {
                Us0OnBluesky(v6, v7) -> {
                    v2
                }
                Us0OnMastodon -> {
                    v2
                }
                Us0OnX -> {
                    let v3 = closure1(Nil)
                    let v4 = defused_dots_by_2(v3, v2)
                    defused_entities_27(v4)
                }
            }
        let v11 = string.inspect(v1)
        let v12 = "c"
        let v13 = v12 <> v11 
        let v18 =
            case v0  {
                Us0OnBluesky(v14, v15) -> {
                    300
                }
                Us0OnMastodon -> {
                    500
                }
                Us0OnX -> {
                    280
                }
            }
        split_cell_on_45(v0, v13, v18, v10)
    }
}

pub fn closure14(capt: #(Us0)) -> fn(Int) -> fn(String) -> ListString {
    fn (v1) {
        let #(v0) = capt
        closure15(#(v0, v1))
    }
}

pub fn numbered_77(v0: String, v1: Int, v2: Int, v3: ListString, v4: ListString) -> ListString {
    case v3  {
        ListStringCons(v7, v8) -> {
            let v9 = spiral_wrap_signed(v2 + 1, 32)
            let v10 = " "
            let v11 = v0 <> v10 
            let v12 = string.inspect(v2)
            let v13 = v11 <> v12 
            let v14 = "/"
            let v15 = v13 <> v14 
            let v16 = string.inspect(v1)
            let v17 = v15 <> v16 
            let v18 = "\n"
            let v19 = v17 <> v18 
            let v20 = v19 <> v7 
            let v21 = spiral_string_length(v20)
            let v22 = string.to_graphemes(v20)
            let v23 = v22 |> list.reverse
            let v24 = ListStringNil
            let listm_fold = v23 |> list.fold (v24, fn (acc, x) {
            let v25 = x
            let v26 = acc
            let v27 = ListStringCons(v25, v26)
            v27
            })
            let v28 = listm_fold
            let v29 = ListStringNil
            let v30 = method10(v28, v29)
            let v31 = 0
            let v32 = blank_tail_length_71(v30, v31)
            let v33 = spiral_wrap_signed(v21 - v32, 32)
            let v34 = spiral_wrap_signed(v33 - 1, 32)
            let v35 = spiral_string_slice(v20, 0, v34)
            let v36 = ListStringCons(v35, v4)
            numbered_77(v0, v1, v9, v8, v36)
        }
        ListStringNil -> {
            let v5 = ListStringNil
            method10(v4, v5)
        }
    }
}

pub fn cell_posts_by_76(v0: fn(Int) -> fn(String) -> ListString, v1: Int, v2: String) -> ListString {
    let v3 = v0(v1)
    let v4 = v3(v2)
    let v8 =
        case v4  {
            ListStringNil -> {
                let v5 = ""
                let v6 = ListStringNil
                ListStringCons(v5, v6)
            }
            _ -> {
                v4
            }
        }
    let v9 = string.inspect(v1)
    let v10 = "c"
    let v11 = v10 <> v9 
    let v12 = 0
    let v13 = method65(v8, v12)
    let v14 = 1
    let v15 = ListStringNil
    numbered_77(v11, v13, v14, v8, v15)
}

pub fn method78(v0: Uh4, v1: Uh4) -> Uh4 {
    case v0  {
        Uh4Cons(v2, v3) -> {
            let v4 = Uh4Cons(v2, v1)
            method78(v3, v4)
        }
        Uh4Nil -> {
            v1
        }
    }
}

pub fn method79(v0: Uh4, v1: ListString) -> ListString {
    case v0  {
        Uh4Cons(v2, v3) -> {
            let v4 = method79(v3, v1)
            method26(v2, v4)
        }
        Uh4Nil -> {
            v1
        }
    }
}

pub fn thread_by_75(v0: fn(Int) -> fn(String) -> ListString, v1: Int, v2: ListString, v3: Uh4) -> ListString {
    case v2  {
        ListStringCons(v8, v9) -> {
            let v10 = spiral_wrap_signed(v1 + 1, 32)
            let v11 = cell_posts_by_76(v0, v1, v8)
            let v12 = Uh4Cons(v11, v3)
            thread_by_75(v0, v10, v9, v12)
        }
        ListStringNil -> {
            let v4 = Uh4Nil
            let v5 = method78(v3, v4)
            let v6 = ListStringNil
            method79(v5, v6)
        }
    }
}

pub fn thread_on_74(v0: Us0, v1: Int, v2: ListString, v3: Uh4) -> ListString {
    let v4 = closure14(#(v0))
    thread_by_75(v4, v1, v2, v3)
}

pub fn thread_of_73(v0: Int, v1: ListString, v2: Uh4) -> ListString {
    let v3 = Us0OnX
    thread_on_74(v3, v0, v1, v2)
}

pub fn closure13(capt: Nil) -> fn(String) -> ListString {
    fn (v0) {
        let v1 = 1
        let v2 = file_cells_67(v0)
        let v3 = Uh4Nil
        thread_of_73(v1, v2, v3)
    }
}

pub fn main() {
    let _v0 = closure0(Nil)
    let _ = Nil
    let _v1 = closure11(Nil)
    let _ = Nil
    let _v2 = closure12(Nil)
    let _ = Nil
    let _v3 = closure13(Nil)
    let _ = Nil
    0
}
