import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Uh38, type Us93, type Us94, Uh29Cons, Uh29Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us72None, Us72Some, Us93Elsewhere, Us93Following, Us93Lookup, Us93SearchAll, Us93SearchRecent, Us93Single, Us93Timeline, Us93UsersBy, Us93UsersByIds, Us94Error, Us94Ok}
import xsim_frames/part1.{closure1, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part13.{method300}
import xsim_frames/part27.{items_from_443}

pub fn request_of_460(v0: String) -> #(String, String, String, String, String) {
    let v1 = "\r\n\r\n"
    let v2 = option.from_result(result.map(string.split_once(v0, v1), pair.first))
    let v3 = closure1(Nil)
    let v4 = v2 |> option.map(v3)
    let v5 = Us2None
    let v6 = v4 |> option.unwrap(v5)
    let v10 =
        case v6  {
            Us2None -> -1
            Us2Some(v7) -> {
                let v8 = bit_array.byte_size(bit_array.from_string(v7))
                v8
            }
        }
    let v11 = spiral_wrap_signed(v10 - 1, 32)
    let v12 = spiral_string_slice(v0, 0, v11)
    let v13 = "\r\n"
    let v14 = option.from_result(result.map(string.split_once(v12, v13), pair.first))
    let v15 = v14 |> option.map(v3)
    let v16 = Us2None
    let v17 = v15 |> option.unwrap(v16)
    let v21 =
        case v17  {
            Us2None -> -1
            Us2Some(v18) -> {
                let v19 = bit_array.byte_size(bit_array.from_string(v18))
                v19
            }
        }
    let v22 = spiral_wrap_signed(v21 - 1, 32)
    let v23 = spiral_string_slice(v12, 0, v22)
    let v24 = v23 == ""
    let v28 =
        case v24 {
            True -> Uh3Nil
            False -> {
                let v26 = " "
                split_list_2(v26, v23)
            }
        }
    let v36 =
        case v28  {
            Uh3Cons(v29, v30) -> {
                case v30  {
                    Uh3Cons(v31, v32) -> v31
                    _ -> {
                        let v33 = "/"
                        v33
                    }
                }
            }
            _ -> {
                let v35 = "/"
                v35
            }
        }
    let v37 = "#"
    let v38 = option.from_result(result.map(string.split_once(v36, v37), pair.first))
    let v39 = v38 |> option.map(v3)
    let v40 = Us2None
    let v41 = v39 |> option.unwrap(v40)
    let v45 =
        case v41  {
            Us2None -> -1
            Us2Some(v42) -> {
                let v43 = bit_array.byte_size(bit_array.from_string(v42))
                v43
            }
        }
    let v46 = spiral_wrap_signed(v45 + 1, 32)
    let v47 = v45 < 0
    let #(v56, _v57) =
        case v47 {
            True -> {
                let v48 = ""
                #(v36, v48)
            }
            False -> {
                let v49 = spiral_wrap_signed(v45 - 1, 32)
                let v50 = spiral_string_slice(v36, 0, v49)
                let v51 = spiral_string_length(v36)
                let v52 = spiral_wrap_signed(v51 - v46, 32)
                let v53 = spiral_wrap_signed(v46 + v52, 32)
                let v54 = spiral_wrap_signed(v53 - 1, 32)
                let v55 = spiral_string_slice(v36, v46, v54)
                #(v50, v55)
            }
        }
    let v58 = "?"
    let v59 = option.from_result(result.map(string.split_once(v56, v58), pair.first))
    let v60 = v59 |> option.map(v3)
    let v61 = Us2None
    let v62 = v60 |> option.unwrap(v61)
    let v66 =
        case v62  {
            Us2None -> -1
            Us2Some(v63) -> {
                let v64 = bit_array.byte_size(bit_array.from_string(v63))
                v64
            }
        }
    let v67 = spiral_wrap_signed(v66 + 1, 32)
    let v68 = v66 < 0
    let #(v77, v78) =
        case v68 {
            True -> {
                let v69 = ""
                #(v56, v69)
            }
            False -> {
                let v70 = spiral_wrap_signed(v66 - 1, 32)
                let v71 = spiral_string_slice(v56, 0, v70)
                let v72 = spiral_string_length(v56)
                let v73 = spiral_wrap_signed(v72 - v67, 32)
                let v74 = spiral_wrap_signed(v67 + v73, 32)
                let v75 = spiral_wrap_signed(v74 - 1, 32)
                let v76 = spiral_string_slice(v56, v67, v75)
                #(v71, v76)
            }
        }
    let v79 = v12 == ""
    let v83 =
        case v79 {
            True -> Uh3Nil
            False -> {
                let v81 = " "
                split_list_2(v81, v12)
            }
        }
    let v88 =
        case v83  {
            Uh3Cons(v84, v85) -> v84
            Uh3Nil -> {
                let v86 = ""
                v86
            }
        }
    #(v88, v77, v78, v12, v0)
}

pub fn method465(v0: Uh38, v1: Uh38) -> Uh38 {
    case v0  {
        Uh38Cons(v2, v3, v4) -> {
            let v5 = method465(v4, v1)
            Uh38Cons(v2, v3, v5)
        }
        Uh38Nil -> v1
    }
}

pub fn method466(v0: Uh38, v1: Uh29) -> Uh29 {
    case v0  {
        Uh38Cons(v2, v3, v4) -> {
            let v5 = method466(v4, v1)
            let v6 = atom.create(v2)
            let v7 = erlang_term_coerce(v6)
            let v8 = []
            let v9 = [v3, ..v8]
            let v10 = [v7, ..v9]
            let v11 = erlang_term_tuple(v10)
            Uh29Cons(v11, v5)
        }
        Uh38Nil -> v1
    }
}

pub fn log_row_464(v0: String, v1: String, v2: String, _v3: String, v4: String, v5: String) -> Dynamic {
    let v6 = v0 == "POST"
    let v7 = "\r\n\r\n"
    let v8 = option.from_result(result.map(string.split_once(v4, v7), pair.first))
    let v9 = closure1(Nil)
    let v10 = v8 |> option.map(v9)
    let v11 = Us2None
    let v12 = v10 |> option.unwrap(v11)
    let v16 =
        case v12  {
            Us2None -> -1
            Us2Some(v13) -> {
                let v14 = bit_array.byte_size(bit_array.from_string(v13))
                v14
            }
        }
    let v17 = spiral_wrap_signed(v16 + 4, 32)
    let v18 = spiral_string_length(v4)
    let v19 = spiral_wrap_signed(v18 - v17, 32)
    let v20 = spiral_wrap_signed(v17 + v19, 32)
    let v21 = spiral_wrap_signed(v20 - 1, 32)
    let v22 = spiral_string_slice(v4, v17, v21)
    let v23 = erlang_term_coerce(v22)
    let v28 =
        case v6 {
            True -> {
                let v24 = "body"
                let v25 = Uh38Nil
                Uh38Cons(v24, v23, v25)
            }
            False -> Uh38Nil
        }
    let v29 = v5 != ""
    let v30 = erlang_term_coerce(v29)
    let v31 = v5 == ""
    let v36 =
        case v31 {
            True -> {
                let v32 = "null"
                let v33 = atom.create(v32)
                let v34 = erlang_term_coerce(v33)
                v34
            }
            False -> {
                let v35 = erlang_term_coerce(v5)
                v35
            }
        }
    let v37 = erlang_term_coerce(v0)
    let v38 = erlang_term_coerce(v1)
    let v39 = erlang_term_coerce(v2)
    let v40 = Uh38Nil
    let v41 = method465(v28, v40)
    let v42 = Uh29Nil
    let v43 = method466(v41, v42)
    let v44 = "context"
    let v45 = atom.create(v44)
    let v46 = erlang_term_coerce(v45)
    let v47 = []
    let v48 = [v36, ..v47]
    let v49 = [v46, ..v48]
    let v50 = erlang_term_tuple(v49)
    let v51 = "authorized"
    let v52 = atom.create(v51)
    let v53 = erlang_term_coerce(v52)
    let v54 = []
    let v55 = [v30, ..v54]
    let v56 = [v53, ..v55]
    let v57 = erlang_term_tuple(v56)
    let v58 = "query"
    let v59 = atom.create(v58)
    let v60 = erlang_term_coerce(v59)
    let v61 = []
    let v62 = [v39, ..v61]
    let v63 = [v60, ..v62]
    let v64 = erlang_term_tuple(v63)
    let v65 = "path"
    let v66 = atom.create(v65)
    let v67 = erlang_term_coerce(v66)
    let v68 = []
    let v69 = [v38, ..v68]
    let v70 = [v67, ..v69]
    let v71 = erlang_term_tuple(v70)
    let v72 = "method"
    let v73 = atom.create(v72)
    let v74 = erlang_term_coerce(v73)
    let v75 = []
    let v76 = [v37, ..v75]
    let v77 = [v74, ..v76]
    let v78 = erlang_term_tuple(v77)
    let v79 = []
    let v80 = method300(v43, v79)
    let v81 = [v50, ..v80]
    let v82 = [v57, ..v81]
    let v83 = [v64, ..v82]
    let v84 = [v71, ..v83]
    let v85 = [v78, ..v84]
    let v86 = erlang_term_coerce(v85)
    let v87 = "maps"
    let v88 = atom.create(v87)
    let v89 = "from_list"
    let v90 = atom.create(v89)
    let v91 = []
    let v92 = [v86, ..v91]
    let v93 = erlang_term_apply(v88, v90, v92)
    v93
}

pub fn logged_463(v0: String, v1: String, v2: String, v3: String, v4: String, v5: String, v6: String) -> Nil {
    let v7 = log_row_464(v1, v2, v3, v4, v5, v6)
    let v8 = "json"
    let v9 = atom.create(v8)
    let v10 = "encode"
    let v11 = atom.create(v10)
    let v12 = []
    let v13 = [v7, ..v12]
    let v14 = erlang_term_apply(v9, v11, v13)
    let v15 = "erlang"
    let v16 = atom.create(v15)
    let v17 = "iolist_to_binary"
    let v18 = atom.create(v17)
    let v19 = []
    let v20 = [v14, ..v19]
    let v21 = erlang_term_apply(v16, v18, v20)
    let v22 = erlang_term_coerce(v21)
    let v23 = "\n"
    let v24 = v22 <> v23 
    let v25 = "append"
    let v26 = atom.create(v25)
    let v27 = erlang_term_coerce(v26)
    let v28 = []
    let v29 = [v27, ..v28]
    let v30 = erlang_term_coerce(v29)
    let v31 = erlang_term_coerce(v0)
    let v32 = erlang_term_coerce(v24)
    let v33 = "file"
    let v34 = atom.create(v33)
    let v35 = "write_file"
    let v36 = atom.create(v35)
    let v37 = []
    let v38 = [v30, ..v37]
    let v39 = [v32, ..v38]
    let v40 = [v31, ..v39]
    let v41 = erlang_term_apply(v34, v36, v40)
    let v42 = "ok"
    let v43 = atom.create(v42)
    let v44 = erlang_term_coerce(v43)
    let _v45 = v41 == v44
    Nil
}

pub fn ok_c145(capt: Nil) -> fn(Dynamic) -> Us94 {
    fn (v0) {
        Us94Ok(v0)
    }
}

pub fn method470() -> fn(Dynamic) -> Us94 {
    ok_c145(Nil)
}

pub fn error_c146(capt: Nil) -> fn(Nil) -> Us94 {
    fn (dom) {
        Us94Error
    }
}

pub fn method471() -> fn(Nil) -> Us94 {
    error_c146(Nil)
}

pub fn route_of_469(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, v12: String) -> Us93 {
    let v13 = v12 == ""
    let v17 =
        case v13 {
            True -> Uh3Nil
            False -> {
                let v15 = "/"
                split_list_2(v15, v12)
            }
        }
    case v17  {
        Uh3Cons(v18, v19) -> {
            let v20 = "" == v18
            case v20 {
                True -> {
                    case v19  {
                        Uh3Cons(v21, v22) -> {
                            let v23 = "2" == v21
                            case v23 {
                                True -> {
                                    case v22  {
                                        Uh3Cons(v24, v25) -> {
                                            let v26 = "users" == v24
                                            case v26 {
                                                True -> {
                                                    case v25  {
                                                        Uh3Cons(v27, v28) -> {
                                                            let v29 = "by" == v27
                                                            case v29 {
                                                                True -> {
                                                                    case v28  {
                                                                        Uh3Cons(v31, v32) -> {
                                                                            case v32  {
                                                                                Uh3Nil -> {
                                                                                    let v33 = dict.has_key(v3, v27)
                                                                                    let v34 = v33 == False
                                                                                    case v34 {
                                                                                        True -> Us93Elsewhere
                                                                                        False -> {
                                                                                            let v36 = v31 == "following"
                                                                                            case v36 {
                                                                                                True -> {
                                                                                                    let v37 = dict.get(v3, v27)
                                                                                                    let v38 = method470()
                                                                                                    let v39 = method471()
                                                                                                    let v40 = case v37 { Ok(x) -> v38(x) Error(x) -> v39(x) }
                                                                                                    let v45 =
                                                                                                        case v40  {
                                                                                                            Us94Error -> Us72None
                                                                                                            Us94Ok(v41) -> Us72Some(v41)
                                                                                                        }
                                                                                                    let v49 =
                                                                                                        case v45  {
                                                                                                            Us72None -> panic as "dict.present: the key is not in the dict"
                                                                                                            Us72Some(v46) -> v46
                                                                                                        }
                                                                                                    Us93Following(v49)
                                                                                                }
                                                                                                False -> {
                                                                                                    let v51 = v31 == "tweets"
                                                                                                    case v51 {
                                                                                                        True -> {
                                                                                                            let v52 = dict.get(v3, v27)
                                                                                                            let v53 = method470()
                                                                                                            let v54 = method471()
                                                                                                            let v55 = case v52 { Ok(x) -> v53(x) Error(x) -> v54(x) }
                                                                                                            let v60 =
                                                                                                                case v55  {
                                                                                                                    Us94Error -> Us72None
                                                                                                                    Us94Ok(v56) -> Us72Some(v56)
                                                                                                                }
                                                                                                            let v64 =
                                                                                                                case v60  {
                                                                                                                    Us72None -> panic as "dict.present: the key is not in the dict"
                                                                                                                    Us72Some(v61) -> v61
                                                                                                                }
                                                                                                            Us93Timeline(v64)
                                                                                                        }
                                                                                                        False -> Us93Elsewhere
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                                _ -> Us93Elsewhere
                                                                            }
                                                                        }
                                                                        Uh3Nil -> Us93UsersBy
                                                                    }
                                                                }
                                                                False -> {
                                                                    case v28  {
                                                                        Uh3Cons(v74, v75) -> {
                                                                            case v75  {
                                                                                Uh3Nil -> {
                                                                                    let v76 = dict.has_key(v3, v27)
                                                                                    let v77 = v76 == False
                                                                                    case v77 {
                                                                                        True -> Us93Elsewhere
                                                                                        False -> {
                                                                                            let v79 = v74 == "following"
                                                                                            case v79 {
                                                                                                True -> {
                                                                                                    let v80 = dict.get(v3, v27)
                                                                                                    let v81 = method470()
                                                                                                    let v82 = method471()
                                                                                                    let v83 = case v80 { Ok(x) -> v81(x) Error(x) -> v82(x) }
                                                                                                    let v88 =
                                                                                                        case v83  {
                                                                                                            Us94Error -> Us72None
                                                                                                            Us94Ok(v84) -> Us72Some(v84)
                                                                                                        }
                                                                                                    let v92 =
                                                                                                        case v88  {
                                                                                                            Us72None -> panic as "dict.present: the key is not in the dict"
                                                                                                            Us72Some(v89) -> v89
                                                                                                        }
                                                                                                    Us93Following(v92)
                                                                                                }
                                                                                                False -> {
                                                                                                    let v94 = v74 == "tweets"
                                                                                                    case v94 {
                                                                                                        True -> {
                                                                                                            let v95 = dict.get(v3, v27)
                                                                                                            let v96 = method470()
                                                                                                            let v97 = method471()
                                                                                                            let v98 = case v95 { Ok(x) -> v96(x) Error(x) -> v97(x) }
                                                                                                            let v103 =
                                                                                                                case v98  {
                                                                                                                    Us94Error -> Us72None
                                                                                                                    Us94Ok(v99) -> Us72Some(v99)
                                                                                                                }
                                                                                                            let v107 =
                                                                                                                case v103  {
                                                                                                                    Us72None -> panic as "dict.present: the key is not in the dict"
                                                                                                                    Us72Some(v104) -> v104
                                                                                                                }
                                                                                                            Us93Timeline(v107)
                                                                                                        }
                                                                                                        False -> Us93Elsewhere
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                                _ -> Us93Elsewhere
                                                                            }
                                                                        }
                                                                        _ -> Us93Elsewhere
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        Uh3Nil -> Us93UsersByIds
                                                    }
                                                }
                                                False -> {
                                                    let v121 = "tweets" == v24
                                                    case v121 {
                                                        True -> {
                                                            case v25  {
                                                                Uh3Cons(v123, v124) -> {
                                                                    case v124  {
                                                                        Uh3Nil -> Us93Single(v123)
                                                                        _ -> {
                                                                            let v126 = "search" == v123
                                                                            case v126 {
                                                                                True -> {
                                                                                    case v124  {
                                                                                        Uh3Cons(v127, v128) -> {
                                                                                            case v128  {
                                                                                                Uh3Nil -> {
                                                                                                    let v129 = v127 == "recent"
                                                                                                    case v129 {
                                                                                                        True -> Us93SearchRecent
                                                                                                        False -> {
                                                                                                            let v131 = v127 == "all"
                                                                                                            case v131 {
                                                                                                                True -> Us93SearchAll
                                                                                                                False -> Us93Elsewhere
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                _ -> Us93Elsewhere
                                                                                            }
                                                                                        }
                                                                                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                                    }
                                                                                }
                                                                                False -> Us93Elsewhere
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                                Uh3Nil -> Us93Lookup
                                                            }
                                                        }
                                                        False -> Us93Elsewhere
                                                    }
                                                }
                                            }
                                        }
                                        _ -> Us93Elsewhere
                                    }
                                }
                                False -> Us93Elsewhere
                            }
                        }
                        _ -> Us93Elsewhere
                    }
                }
                False -> Us93Elsewhere
            }
        }
        _ -> Us93Elsewhere
    }
}

pub fn first_value_473(v0: String, v1: Uh3) -> String {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = "="
            let v5 = option.from_result(result.map(string.split_once(v2, v4), pair.first))
            let v6 = closure1(Nil)
            let v7 = v5 |> option.map(v6)
            let v8 = Us2None
            let v9 = v7 |> option.unwrap(v8)
            let v13 =
                case v9  {
                    Us2None -> -1
                    Us2Some(v10) -> {
                        let v11 = bit_array.byte_size(bit_array.from_string(v10))
                        v11
                    }
                }
            let v14 = spiral_wrap_signed(v13 + 1, 32)
            let v15 = v13 < 0
            let #(v24, v25) =
                case v15 {
                    True -> {
                        let v16 = ""
                        #(v2, v16)
                    }
                    False -> {
                        let v17 = spiral_wrap_signed(v13 - 1, 32)
                        let v18 = spiral_string_slice(v2, 0, v17)
                        let v19 = spiral_string_length(v2)
                        let v20 = spiral_wrap_signed(v19 - v14, 32)
                        let v21 = spiral_wrap_signed(v14 + v20, 32)
                        let v22 = spiral_wrap_signed(v21 - 1, 32)
                        let v23 = spiral_string_slice(v2, v14, v22)
                        #(v18, v23)
                    }
                }
            let v26 = v25 != ""
            let v40 =
                case v26 {
                    True -> {
                        let v27 = "+"
                        let v28 = " "
                        let v29 = v24 |> string.replace(v27, v28)
                        let v30 = erlang_term_coerce(v29)
                        let v31 = "uri_string"
                        let v32 = atom.create(v31)
                        let v33 = "percent_decode"
                        let v34 = atom.create(v33)
                        let v35 = []
                        let v36 = [v30, ..v35]
                        let v37 = erlang_term_apply(v32, v34, v36)
                        let v38 = erlang_term_coerce(v37)
                        let v39 = v38 == v0
                        v39
                    }
                    False -> False
                }
            let v55 =
                case v40 {
                    True -> {
                        let v41 = "+"
                        let v42 = " "
                        let v43 = v25 |> string.replace(v41, v42)
                        let v44 = erlang_term_coerce(v43)
                        let v45 = "uri_string"
                        let v46 = atom.create(v45)
                        let v47 = "percent_decode"
                        let v48 = atom.create(v47)
                        let v49 = []
                        let v50 = [v44, ..v49]
                        let v51 = erlang_term_apply(v46, v48, v50)
                        let v52 = erlang_term_coerce(v51)
                        Us2Some(v52)
                    }
                    False -> Us2None
                }
            case v55  {
                Us2None -> first_value_473(v0, v3)
                Us2Some(v56) -> v56
            }
        }
        Uh3Nil -> {
            let v60 = ""
            v60
        }
    }
}

pub fn method476(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method476(v3, v1)
            let v5 = "erlang"
            let v6 = atom.create(v5)
            let v7 = "is_binary"
            let v8 = atom.create(v7)
            let v9 = []
            let v10 = [v2, ..v9]
            let v11 = erlang_term_apply(v6, v8, v10)
            let v12 = erlang_term_coerce(v11)
            let v21 =
                case v12 {
                    True -> {
                        let v13 = erlang_term_coerce(v2)
                        v13
                    }
                    False -> {
                        let v14 = atom.create(v5)
                        let v15 = "integer_to_binary"
                        let v16 = atom.create(v15)
                        let v17 = []
                        let v18 = [v2, ..v17]
                        let v19 = erlang_term_apply(v14, v16, v18)
                        let v20 = erlang_term_coerce(v19)
                        v20
                    }
                }
            Uh3Cons(v21, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method477(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh3) -> Uh3 {
    case v12  {
        Uh3Cons(v14, v15) -> {
            let v16 = method477(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v15, v13)
            let v17 = dict.has_key(v3, v14)
            case v17 {
                True -> Uh3Cons(v14, v16)
                False -> v16
            }
        }
        Uh3Nil -> v13
    }
}

pub fn method478(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh29) -> Uh29 {
    case v12  {
        Uh3Cons(v14, v15) -> {
            let v16 = method478(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v15, v13)
            let v17 = dict.get(v3, v14)
            let v18 = method470()
            let v19 = method471()
            let v20 = case v17 { Ok(x) -> v18(x) Error(x) -> v19(x) }
            let v25 =
                case v20  {
                    Us94Error -> Us72None
                    Us94Ok(v21) -> Us72Some(v21)
                }
            let v29 =
                case v25  {
                    Us72None -> panic as "dict.present: the key is not in the dict"
                    Us72Some(v26) -> v26
                }
            Uh29Cons(v29, v16)
        }
        Uh3Nil -> v13
    }
}

pub fn followed_475(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Dynamic) -> Uh29 {
    let v13 = []
    let v14 = erlang_term_coerce(v13)
    let v15 = "following"
    let v16 = erlang_term_coerce(v15)
    let v17 = erlang_term_coerce(v14)
    let v18 = "maps"
    let v19 = atom.create(v18)
    let v20 = "get"
    let v21 = atom.create(v20)
    let v22 = []
    let v23 = [v17, ..v22]
    let v24 = [v12, ..v23]
    let v25 = [v16, ..v24]
    let v26 = erlang_term_apply(v19, v21, v25)
    let v27 = erlang_term_coerce(v26)
    let v28 = "lists"
    let v29 = atom.create(v28)
    let v30 = "reverse"
    let v31 = atom.create(v30)
    let v32 = []
    let v33 = [v27, ..v32]
    let v34 = erlang_term_apply(v29, v31, v33)
    let v35 = Uh29Nil
    let v36 = items_from_443(v34, v35)
    let v37 = Uh3Nil
    let v38 = method476(v36, v37)
    let v39 = Uh3Nil
    let v40 = method477(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v38, v39)
    let v41 = Uh29Nil
    method478(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v40, v41)
}

pub fn sliced_479(v0: Int, v1: Int, v2: Uh29) -> Uh29 {
    case v2  {
        Uh29Cons(v3, v4) -> {
            let v5 = v0 > 0
            case v5 {
                True -> {
                    let v6 = spiral_wrap_signed(v0 - 1, 32)
                    sliced_479(v6, v1, v4)
                }
                False -> {
                    let v8 = v1 > 0
                    case v8 {
                        True -> {
                            let v9 = 0
                            let v10 = spiral_wrap_signed(v1 - 1, 32)
                            let v11 = sliced_479(v9, v10, v4)
                            Uh29Cons(v3, v11)
                        }
                        False -> Uh29Nil
                    }
                }
            }
        }
        _ -> Uh29Nil
    }
}

pub fn method480(v0: Uh29, v1: Int) -> Int {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method480(v3, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method481(v0: Uh29, v1: Uh29) -> Uh29 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method481(v3, v1)
            let v5 = ""
            let v6 = erlang_term_coerce(v5)
            let v7 = "username"
            let v8 = erlang_term_coerce(v7)
            let v9 = erlang_term_coerce(v6)
            let v10 = "maps"
            let v11 = atom.create(v10)
            let v12 = "get"
            let v13 = atom.create(v12)
            let v14 = []
            let v15 = [v9, ..v14]
            let v16 = [v2, ..v15]
            let v17 = [v8, ..v16]
            let v18 = erlang_term_apply(v11, v13, v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = erlang_term_coerce(v5)
            let v21 = "name"
            let v22 = erlang_term_coerce(v21)
            let v23 = erlang_term_coerce(v20)
            let v24 = atom.create(v10)
            let v25 = atom.create(v12)
            let v26 = []
            let v27 = [v23, ..v26]
            let v28 = [v2, ..v27]
            let v29 = [v22, ..v28]
            let v30 = erlang_term_apply(v24, v25, v29)
            let v31 = erlang_term_coerce(v30)
            let v32 = erlang_term_coerce(v5)
            let v33 = "id"
            let v34 = erlang_term_coerce(v33)
            let v35 = erlang_term_coerce(v32)
            let v36 = atom.create(v10)
            let v37 = atom.create(v12)
            let v38 = []
            let v39 = [v35, ..v38]
            let v40 = [v2, ..v39]
            let v41 = [v34, ..v40]
            let v42 = erlang_term_apply(v36, v37, v41)
            let v43 = erlang_term_coerce(v42)
            let v44 = atom.create(v7)
            let v45 = erlang_term_coerce(v44)
            let v46 = []
            let v47 = [v19, ..v46]
            let v48 = [v45, ..v47]
            let v49 = erlang_term_tuple(v48)
            let v50 = atom.create(v21)
            let v51 = erlang_term_coerce(v50)
            let v52 = []
            let v53 = [v31, ..v52]
            let v54 = [v51, ..v53]
            let v55 = erlang_term_tuple(v54)
            let v56 = atom.create(v33)
            let v57 = erlang_term_coerce(v56)
            let v58 = []
            let v59 = [v43, ..v58]
            let v60 = [v57, ..v59]
            let v61 = erlang_term_tuple(v60)
            let v62 = []
            let v63 = [v49, ..v62]
            let v64 = [v55, ..v63]
            let v65 = [v61, ..v64]
            let v66 = erlang_term_coerce(v65)
            let v67 = atom.create(v10)
            let v68 = "from_list"
            let v69 = atom.create(v68)
            let v70 = []
            let v71 = [v66, ..v70]
            let v72 = erlang_term_apply(v67, v69, v71)
            Uh29Cons(v72, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn following_body_474(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Dynamic, v13: Int, v14: Int) -> Dynamic {
    let v15 = followed_475(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
    let v16 = sliced_479(v13, v14, v15)
    let v17 = 0
    let v18 = method480(v16, v17)
    let v19 = spiral_wrap_signed(v13 + v14, 32)
    let v20 = 0
    let v21 = method480(v15, v20)
    let v22 = v19 < v21
    let v31 =
        case v22 {
            True -> {
                let v23 = string.inspect(v19)
                let v24 = "p"
                let v25 = v24 <> v23 
                let v26 = erlang_term_coerce(v25)
                let v27 = "next_token"
                let v28 = Uh38Nil
                Uh38Cons(v27, v26, v28)
            }
            False -> Uh38Nil
        }
    let v32 = erlang_term_coerce(v18)
    let v33 = Uh29Nil
    let v34 = method466(v31, v33)
    let v35 = "result_count"
    let v36 = atom.create(v35)
    let v37 = erlang_term_coerce(v36)
    let v38 = []
    let v39 = [v32, ..v38]
    let v40 = [v37, ..v39]
    let v41 = erlang_term_tuple(v40)
    let v42 = []
    let v43 = method300(v34, v42)
    let v44 = [v41, ..v43]
    let v45 = erlang_term_coerce(v44)
    let v46 = "maps"
    let v47 = atom.create(v46)
    let v48 = "from_list"
    let v49 = atom.create(v48)
    let v50 = []
    let v51 = [v45, ..v50]
    let v52 = erlang_term_apply(v47, v49, v51)
    let v53 = Uh29Nil
    let v54 = method481(v16, v53)
    let v62 =
        case v54  {
            Uh29Nil -> Uh38Nil
            _ -> {
                let v56 = []
                let v57 = method300(v54, v56)
                let v58 = erlang_term_coerce(v57)
                let v59 = "data"
                let v60 = Uh38Nil
                Uh38Cons(v59, v58, v60)
            }
        }
    let v63 = "meta"
    let v64 = Uh38Nil
    let v65 = Uh38Cons(v63, v52, v64)
    let v66 = method465(v62, v65)
    let v67 = Uh29Nil
    let v68 = method466(v66, v67)
    let v69 = []
    let v70 = method300(v68, v69)
    let v71 = erlang_term_coerce(v70)
    let v72 = atom.create(v46)
    let v73 = atom.create(v48)
    let v74 = []
    let v75 = [v71, ..v74]
    let v76 = erlang_term_apply(v72, v73, v75)
    v76
}
