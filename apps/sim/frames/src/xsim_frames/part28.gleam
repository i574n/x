import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Us93, type Us94, Uh29Cons, Uh29Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us3None, Us3Some, Us72None, Us72Some, Us93Elsewhere, Us93Following, Us93Lookup, Us93SearchAll, Us93SearchRecent, Us93Single, Us93Timeline, Us93UsersBy, Us93UsersByIds, Us94Error, Us94Ok}
import xsim_frames/part1.{closure1, count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part13.{method301}
import xsim_frames/part26.{method444}
import xsim_frames/part27.{method466, method467}

pub fn log_row_465(v0: String, v1: String, v2: String, _v3: String, v4: String, v5: String) -> Dynamic {
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
    let v41 = method466(v28, v40)
    let v42 = Uh29Nil
    let v43 = method467(v41, v42)
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
    let v80 = method301(v43, v79)
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

pub fn logged_464(v0: String, v1: String, v2: String, v3: String, v4: String, v5: String, v6: String) -> Nil {
    let v7 = log_row_465(v1, v2, v3, v4, v5, v6)
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
    let v25 = erlang_term_coerce(v24)
    let v26 = erlang_term_coerce(v0)
    let v27 = "append"
    let v28 = atom.create(v27)
    let v29 = erlang_term_coerce(v28)
    let v30 = []
    let v31 = [v29, ..v30]
    let v32 = erlang_term_coerce(v31)
    let v33 = "file"
    let v34 = atom.create(v33)
    let v35 = "write_file"
    let v36 = atom.create(v35)
    let v37 = []
    let v38 = [v32, ..v37]
    let v39 = [v25, ..v38]
    let v40 = [v26, ..v39]
    let _v41 = erlang_term_apply(v34, v36, v40)
    Nil
}

pub fn ok_c145(capt: Nil) -> fn(Dynamic) -> Us94 {
    fn (v0) {
        Us94Ok(v0)
    }
}

pub fn method471() -> fn(Dynamic) -> Us94 {
    ok_c145(Nil)
}

pub fn error_c146(capt: Nil) -> fn(Nil) -> Us94 {
    fn (dom) {
        Us94Error
    }
}

pub fn method472() -> fn(Nil) -> Us94 {
    error_c146(Nil)
}

pub fn route_of_470(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, v12: String) -> Us93 {
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
                                                                                                    let v38 = method471()
                                                                                                    let v39 = method472()
                                                                                                    let v40 = case v37 { Ok(x) -> v38(x) Error(x) -> v39(x) }
                                                                                                    let v45 =
                                                                                                        case v40  {
                                                                                                            Us94Error -> Us72None
                                                                                                            Us94Ok(v41) -> Us72Some(v41)
                                                                                                        }
                                                                                                    let v49 =
                                                                                                        case v45  {
                                                                                                            Us72None -> panic as "dictm.present: the key is not in the dict"
                                                                                                            Us72Some(v46) -> v46
                                                                                                        }
                                                                                                    Us93Following(v49)
                                                                                                }
                                                                                                False -> {
                                                                                                    let v51 = v31 == "tweets"
                                                                                                    case v51 {
                                                                                                        True -> {
                                                                                                            let v52 = dict.get(v3, v27)
                                                                                                            let v53 = method471()
                                                                                                            let v54 = method472()
                                                                                                            let v55 = case v52 { Ok(x) -> v53(x) Error(x) -> v54(x) }
                                                                                                            let v60 =
                                                                                                                case v55  {
                                                                                                                    Us94Error -> Us72None
                                                                                                                    Us94Ok(v56) -> Us72Some(v56)
                                                                                                                }
                                                                                                            let v64 =
                                                                                                                case v60  {
                                                                                                                    Us72None -> panic as "dictm.present: the key is not in the dict"
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
                                                                                                    let v81 = method471()
                                                                                                    let v82 = method472()
                                                                                                    let v83 = case v80 { Ok(x) -> v81(x) Error(x) -> v82(x) }
                                                                                                    let v88 =
                                                                                                        case v83  {
                                                                                                            Us94Error -> Us72None
                                                                                                            Us94Ok(v84) -> Us72Some(v84)
                                                                                                        }
                                                                                                    let v92 =
                                                                                                        case v88  {
                                                                                                            Us72None -> panic as "dictm.present: the key is not in the dict"
                                                                                                            Us72Some(v89) -> v89
                                                                                                        }
                                                                                                    Us93Following(v92)
                                                                                                }
                                                                                                False -> {
                                                                                                    let v94 = v74 == "tweets"
                                                                                                    case v94 {
                                                                                                        True -> {
                                                                                                            let v95 = dict.get(v3, v27)
                                                                                                            let v96 = method471()
                                                                                                            let v97 = method472()
                                                                                                            let v98 = case v95 { Ok(x) -> v96(x) Error(x) -> v97(x) }
                                                                                                            let v103 =
                                                                                                                case v98  {
                                                                                                                    Us94Error -> Us72None
                                                                                                                    Us94Ok(v99) -> Us72Some(v99)
                                                                                                                }
                                                                                                            let v107 =
                                                                                                                case v103  {
                                                                                                                    Us72None -> panic as "dictm.present: the key is not in the dict"
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

pub fn first_value_474(v0: String, v1: Uh3) -> String {
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
                Us2None -> first_value_474(v0, v3)
                Us2Some(v56) -> v56
            }
        }
        Uh3Nil -> {
            let v60 = ""
            v60
        }
    }
}

pub fn method477(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method477(v3, v1)
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

pub fn method478(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh3) -> Uh3 {
    case v12  {
        Uh3Cons(v14, v15) -> {
            let v16 = method478(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v15, v13)
            let v17 = dict.has_key(v3, v14)
            case v17 {
                True -> Uh3Cons(v14, v16)
                False -> v16
            }
        }
        Uh3Nil -> v13
    }
}

pub fn method479(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh29) -> Uh29 {
    case v12  {
        Uh3Cons(v14, v15) -> {
            let v16 = method479(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v15, v13)
            let v17 = dict.get(v3, v14)
            let v18 = method471()
            let v19 = method472()
            let v20 = case v17 { Ok(x) -> v18(x) Error(x) -> v19(x) }
            let v25 =
                case v20  {
                    Us94Error -> Us72None
                    Us94Ok(v21) -> Us72Some(v21)
                }
            let v29 =
                case v25  {
                    Us72None -> panic as "dictm.present: the key is not in the dict"
                    Us72Some(v26) -> v26
                }
            Uh29Cons(v29, v16)
        }
        Uh3Nil -> v13
    }
}

pub fn followed_476(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Dynamic) -> Uh29 {
    let v13 = "following"
    let v14 = erlang_term_coerce(v13)
    let v15 = []
    let v16 = erlang_term_coerce(v15)
    let v17 = "maps"
    let v18 = atom.create(v17)
    let v19 = "get"
    let v20 = atom.create(v19)
    let v21 = []
    let v22 = [v16, ..v21]
    let v23 = [v12, ..v22]
    let v24 = [v14, ..v23]
    let v25 = erlang_term_apply(v18, v20, v24)
    let v26 = "erlang"
    let v27 = atom.create(v26)
    let v28 = "length"
    let v29 = atom.create(v28)
    let v30 = []
    let v31 = [v25, ..v30]
    let v32 = erlang_term_apply(v27, v29, v31)
    let v33 = erlang_term_coerce(v32)
    let v34 = 0
    let v35 = method444(v33, v25, v34)
    let v36 = Uh3Nil
    let v37 = method477(v35, v36)
    let v38 = Uh3Nil
    let v39 = method478(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v37, v38)
    let v40 = Uh29Nil
    method479(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v39, v40)
}

pub fn sliced_480(v0: Int, v1: Int, v2: Uh29) -> Uh29 {
    case v2  {
        Uh29Cons(v3, v4) -> {
            let v5 = v0 > 0
            case v5 {
                True -> {
                    let v6 = spiral_wrap_signed(v0 - 1, 32)
                    sliced_480(v6, v1, v4)
                }
                False -> {
                    let v8 = v1 > 0
                    case v8 {
                        True -> {
                            let v9 = 0
                            let v10 = spiral_wrap_signed(v1 - 1, 32)
                            let v11 = sliced_480(v9, v10, v4)
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

pub fn method481(v0: Uh29, v1: Int) -> Int {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method481(v3, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method482(v0: Uh29, v1: Uh29) -> Uh29 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method482(v3, v1)
            let v5 = "username"
            let v6 = erlang_term_coerce(v5)
            let v7 = ""
            let v8 = erlang_term_coerce(v7)
            let v9 = "maps"
            let v10 = atom.create(v9)
            let v11 = "get"
            let v12 = atom.create(v11)
            let v13 = []
            let v14 = [v8, ..v13]
            let v15 = [v2, ..v14]
            let v16 = [v6, ..v15]
            let v17 = erlang_term_apply(v10, v12, v16)
            let v18 = "name"
            let v19 = erlang_term_coerce(v18)
            let v20 = erlang_term_coerce(v7)
            let v21 = atom.create(v9)
            let v22 = atom.create(v11)
            let v23 = []
            let v24 = [v20, ..v23]
            let v25 = [v2, ..v24]
            let v26 = [v19, ..v25]
            let v27 = erlang_term_apply(v21, v22, v26)
            let v28 = "id"
            let v29 = erlang_term_coerce(v28)
            let v30 = erlang_term_coerce(v7)
            let v31 = atom.create(v9)
            let v32 = atom.create(v11)
            let v33 = []
            let v34 = [v30, ..v33]
            let v35 = [v2, ..v34]
            let v36 = [v29, ..v35]
            let v37 = erlang_term_apply(v31, v32, v36)
            let v38 = atom.create(v5)
            let v39 = erlang_term_coerce(v38)
            let v40 = []
            let v41 = [v17, ..v40]
            let v42 = [v39, ..v41]
            let v43 = erlang_term_tuple(v42)
            let v44 = atom.create(v18)
            let v45 = erlang_term_coerce(v44)
            let v46 = []
            let v47 = [v27, ..v46]
            let v48 = [v45, ..v47]
            let v49 = erlang_term_tuple(v48)
            let v50 = atom.create(v28)
            let v51 = erlang_term_coerce(v50)
            let v52 = []
            let v53 = [v37, ..v52]
            let v54 = [v51, ..v53]
            let v55 = erlang_term_tuple(v54)
            let v56 = []
            let v57 = [v43, ..v56]
            let v58 = [v49, ..v57]
            let v59 = [v55, ..v58]
            let v60 = erlang_term_coerce(v59)
            let v61 = atom.create(v9)
            let v62 = "from_list"
            let v63 = atom.create(v62)
            let v64 = []
            let v65 = [v60, ..v64]
            let v66 = erlang_term_apply(v61, v63, v65)
            Uh29Cons(v66, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn following_body_475(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Dynamic, v13: Int, v14: Int) -> Dynamic {
    let v15 = followed_476(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
    let v16 = sliced_480(v13, v14, v15)
    let v17 = 0
    let v18 = method481(v16, v17)
    let v19 = spiral_wrap_signed(v13 + v14, 32)
    let v20 = 0
    let v21 = method481(v15, v20)
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
    let v34 = method467(v31, v33)
    let v35 = "result_count"
    let v36 = atom.create(v35)
    let v37 = erlang_term_coerce(v36)
    let v38 = []
    let v39 = [v32, ..v38]
    let v40 = [v37, ..v39]
    let v41 = erlang_term_tuple(v40)
    let v42 = []
    let v43 = method301(v34, v42)
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
    let v54 = method482(v16, v53)
    let v62 =
        case v54  {
            Uh29Nil -> Uh38Nil
            _ -> {
                let v56 = []
                let v57 = method301(v54, v56)
                let v58 = erlang_term_coerce(v57)
                let v59 = "data"
                let v60 = Uh38Nil
                Uh38Cons(v59, v58, v60)
            }
        }
    let v63 = "meta"
    let v64 = Uh38Nil
    let v65 = Uh38Cons(v63, v52, v64)
    let v66 = method466(v62, v65)
    let v67 = Uh29Nil
    let v68 = method467(v66, v67)
    let v69 = []
    let v70 = method301(v68, v69)
    let v71 = erlang_term_coerce(v70)
    let v72 = atom.create(v46)
    let v73 = atom.create(v48)
    let v74 = []
    let v75 = [v71, ..v74]
    let v76 = erlang_term_apply(v72, v73, v75)
    v76
}

pub fn following_473(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Dynamic, v13: String) -> #(Int, Dynamic) {
    let v14 = "max_results"
    let v15 = v13 == ""
    let v19 =
        case v15 {
            True -> Uh3Nil
            False -> {
                let v17 = "&"
                split_list_2(v17, v13)
            }
        }
    let v20 = first_value_474(v14, v19)
    let v21 = v20 == ""
    let v23 =
        case v21 {
            True -> {
                let v22 = "100"
                v22
            }
            False -> v20
        }
    let v24 = count_of_text_10(v23)
    let v30 =
        case v24  {
            Us3None -> False
            Us3Some(v25) -> {
                let v26 = v25 >= 1
                case v26 {
                    True -> {
                        let v27 = v25 <= 1000
                        v27
                    }
                    False -> False
                }
            }
        }
    case v30 {
        True -> {
            let v31 = "pagination_token"
            let v35 =
                case v15 {
                    True -> Uh3Nil
                    False -> {
                        let v33 = "&"
                        split_list_2(v33, v13)
                    }
                }
            let v36 = first_value_474(v31, v35)
            let v37 = v36 == ""
            let v39 =
                case v37 {
                    True -> {
                        let v38 = "p0"
                        v38
                    }
                    False -> v36
                }
            let v40 = spiral_string_length(v39)
            let v41 = spiral_wrap_signed(v40 - 1, 32)
            let v42 = spiral_wrap_signed(1 + v41, 32)
            let v43 = spiral_wrap_signed(v42 - 1, 32)
            let v44 = spiral_string_slice(v39, 1, v43)
            let v45 = count_of_text_10(v44)
            let v48 =
                case v45  {
                    Us3None -> 0
                    Us3Some(v46) -> v46
                }
            let v49 = count_of_text_10(v23)
            let v52 =
                case v49  {
                    Us3None -> 0
                    Us3Some(v50) -> v50
                }
            let v53 = v52 < v4
            let v54 =
                case v53 {
                    True -> v52
                    False -> v4
                }
            let v55 = following_body_475(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v48, v54)
            #(200, v55)
        }
        False -> {
            let v56 = "max_results must be 1..1000, got "
            let v57 = v56 <> v23 
            let v58 = "Invalid Request"
            let v59 = erlang_term_coerce(v58)
            let v60 = erlang_term_coerce(v57)
            let v61 = "about:blank"
            let v62 = erlang_term_coerce(v61)
            let v63 = erlang_term_coerce(400)
            let v64 = "status"
            let v65 = atom.create(v64)
            let v66 = erlang_term_coerce(v65)
            let v67 = []
            let v68 = [v63, ..v67]
            let v69 = [v66, ..v68]
            let v70 = erlang_term_tuple(v69)
            let v71 = "type"
            let v72 = atom.create(v71)
            let v73 = erlang_term_coerce(v72)
            let v74 = []
            let v75 = [v62, ..v74]
            let v76 = [v73, ..v75]
            let v77 = erlang_term_tuple(v76)
            let v78 = "detail"
            let v79 = atom.create(v78)
            let v80 = erlang_term_coerce(v79)
            let v81 = []
            let v82 = [v60, ..v81]
            let v83 = [v80, ..v82]
            let v84 = erlang_term_tuple(v83)
            let v85 = "title"
            let v86 = atom.create(v85)
            let v87 = erlang_term_coerce(v86)
            let v88 = []
            let v89 = [v59, ..v88]
            let v90 = [v87, ..v89]
            let v91 = erlang_term_tuple(v90)
            let v92 = []
            let v93 = [v70, ..v92]
            let v94 = [v77, ..v93]
            let v95 = [v84, ..v94]
            let v96 = [v91, ..v95]
            let v97 = erlang_term_coerce(v96)
            let v98 = "maps"
            let v99 = atom.create(v98)
            let v100 = "from_list"
            let v101 = atom.create(v100)
            let v102 = []
            let v103 = [v97, ..v102]
            let v104 = erlang_term_apply(v99, v101, v103)
            #(400, v104)
        }
    }
}
