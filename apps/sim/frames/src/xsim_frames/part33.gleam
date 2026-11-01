import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/list
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, Uh29Cons, Uh29Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us3None, Us3Some, Us56Error, Us56Ok, Us72None, Us72Some, Us94Error, Us94Ok}
import xsim_frames/part1.{closure1, count_of_text_10, dictm_term_sorted, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, method4, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part10.{method259, method260}
import xsim_frames/part13.{method301}
import xsim_frames/part27.{method466, method467}
import xsim_frames/part28.{first_value_474, method471, method472, method481, sliced_480}
import xsim_frames/part29.{method488}
import xsim_frames/part31.{rendered_518}

pub fn method566(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method566(v3, v1)
            let v5 = ":"
            let v6 = option.from_result(result.map(string.split_once(v2, v5), pair.first))
            let v7 = closure1(Nil)
            let v8 = v6 |> option.map(v7)
            let v9 = Us2None
            let v10 = v8 |> option.unwrap(v9)
            let v14 =
                case v10  {
                    Us2None -> -1
                    Us2Some(v11) -> {
                        let v12 = bit_array.byte_size(bit_array.from_string(v11))
                        v12
                    }
                }
            let v15 = v14 >= 0
            case v15 {
                True -> Uh3Cons(v2, v4)
                False -> v4
            }
        }
        Uh3Nil -> v1
    }
}

pub fn method567(v0: Uh3, v1: dict.Dict(String, String)) -> dict.Dict(String, String) {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = ":"
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
            let v26 = dict.insert(v1, v24, v25)
            method567(v3, v26)
        }
        Uh3Nil -> v1
    }
}

pub fn search_terms_565(v0: String) -> dict.Dict(String, String) {
    let v1 = "query"
    let v2 = v0 == ""
    let v6 =
        case v2 {
            True -> Uh3Nil
            False -> {
                let v4 = "&"
                split_list_2(v4, v0)
            }
        }
    let v7 = first_value_474(v1, v6)
    let v8 = v7 == ""
    let v10 =
        case v8 {
            True -> {
                let v9 = ""
                v9
            }
            False -> v7
        }
    let v11 = "\t"
    let v12 = " "
    let v13 = v10 |> string.replace(v11, v12)
    let v14 = "\r"
    let v15 = v13 |> string.replace(v14, v12)
    let v16 = "\n"
    let v17 = v15 |> string.replace(v16, v12)
    let v18 = v17 == ""
    let v21 =
        case v18 {
            True -> Uh3Nil
            False -> split_list_2(v12, v17)
        }
    let v22 = Uh3Nil
    let v23 = method566(v21, v22)
    let v24 = dict.new()
    method567(v23, v24)
}

pub fn window_start_568(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, v12: Int) -> String {
    let v13 = erlang_term_coerce(v6)
    let v14 = "unicode"
    let v15 = atom.create(v14)
    let v16 = "characters_to_list"
    let v17 = atom.create(v16)
    let v18 = []
    let v19 = [v13, ..v18]
    let v20 = erlang_term_apply(v15, v17, v19)
    let v21 = "calendar"
    let v22 = atom.create(v21)
    let v23 = "rfc3339_to_system_time"
    let v24 = atom.create(v23)
    let v25 = []
    let v26 = [v20, ..v25]
    let v27 = erlang_term_apply(v22, v24, v26)
    let v28 = spiral_wrap_signed(v12 * 86400, 32)
    let v29 = erlang_term_coerce(v28)
    let v30 = "erlang"
    let v31 = atom.create(v30)
    let v32 = "-"
    let v33 = atom.create(v32)
    let v34 = []
    let v35 = [v29, ..v34]
    let v36 = [v27, ..v35]
    let v37 = erlang_term_apply(v31, v33, v36)
    let v38 = "Z"
    let v39 = erlang_term_coerce(v38)
    let v40 = atom.create(v14)
    let v41 = atom.create(v16)
    let v42 = []
    let v43 = [v39, ..v42]
    let v44 = erlang_term_apply(v40, v41, v43)
    let v45 = "offset"
    let v46 = atom.create(v45)
    let v47 = erlang_term_coerce(v46)
    let v48 = []
    let v49 = [v44, ..v48]
    let v50 = [v47, ..v49]
    let v51 = erlang_term_tuple(v50)
    let v52 = []
    let v53 = [v51, ..v52]
    let v54 = erlang_term_coerce(v53)
    let v55 = atom.create(v21)
    let v56 = "system_time_to_rfc3339"
    let v57 = atom.create(v56)
    let v58 = []
    let v59 = [v54, ..v58]
    let v60 = [v37, ..v59]
    let v61 = erlang_term_apply(v55, v57, v60)
    let v62 = atom.create(v14)
    let v63 = "characters_to_binary"
    let v64 = atom.create(v63)
    let v65 = []
    let v66 = [v61, ..v65]
    let v67 = erlang_term_apply(v62, v64, v66)
    let v68 = erlang_term_coerce(v67)
    let v69 = spiral_string_slice(v68, 0, 18)
    v69
}

pub fn method570(v0: String, v1: Uh29, v2: Uh29) -> Uh29 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method570(v0, v4, v2)
            let v6 = "post.fields"
            let v7 = v0 == ""
            let v11 =
                case v7 {
                    True -> Uh3Nil
                    False -> {
                        let v9 = "&"
                        split_list_2(v9, v0)
                    }
                }
            let v12 = first_value_474(v6, v11)
            let v13 = v12 == ""
            let v17 =
                case v13 {
                    True -> Uh3Nil
                    False -> {
                        let v15 = ","
                        split_list_2(v15, v12)
                    }
                }
            let v18 = Uh3Nil
            let v19 = method488(v17, v18)
            let v20 = rendered_518(v3, v19)
            Uh29Cons(v20, v5)
        }
        Uh29Nil -> v2
    }
}

pub fn method572(v0: Uh29, v1: Dynamic) -> Dynamic {
    case v0  {
        Uh29Cons(v2, v3) -> method572(v3, v2)
        Uh29Nil -> v1
    }
}

pub fn search_meta_571(v0: Uh29, v1: Int, v2: Bool) -> Dynamic {
    let v3 = string.inspect(v1)
    let v4 = erlang_term_coerce(v3)
    let v9 =
        case v2 {
            True -> {
                let v5 = "next_token"
                let v6 = Uh38Nil
                Uh38Cons(v5, v4, v6)
            }
            False -> Uh38Nil
        }
    let v10 = 0
    let v11 = method481(v0, v10)
    let v12 = erlang_term_coerce(v11)
    let v45 =
        case v0  {
            Uh29Cons(v13, v14) -> {
                let v15 = "id"
                let v16 = erlang_term_coerce(v15)
                let v17 = ""
                let v18 = erlang_term_coerce(v17)
                let v19 = "maps"
                let v20 = atom.create(v19)
                let v21 = "get"
                let v22 = atom.create(v21)
                let v23 = []
                let v24 = [v18, ..v23]
                let v25 = [v13, ..v24]
                let v26 = [v16, ..v25]
                let v27 = erlang_term_apply(v20, v22, v26)
                let v28 = method572(v0, v13)
                let v29 = erlang_term_coerce(v15)
                let v30 = erlang_term_coerce(v17)
                let v31 = atom.create(v19)
                let v32 = atom.create(v21)
                let v33 = []
                let v34 = [v30, ..v33]
                let v35 = [v28, ..v34]
                let v36 = [v29, ..v35]
                let v37 = erlang_term_apply(v31, v32, v36)
                let v38 = "newest_id"
                let v39 = "oldest_id"
                let v40 = Uh38Nil
                let v41 = Uh38Cons(v39, v37, v40)
                Uh38Cons(v38, v27, v41)
            }
            Uh29Nil -> Uh38Nil
        }
    let v46 = Uh38Nil
    let v47 = method466(v9, v46)
    let v48 = method466(v45, v47)
    let v49 = Uh29Nil
    let v50 = method467(v48, v49)
    let v51 = "result_count"
    let v52 = atom.create(v51)
    let v53 = erlang_term_coerce(v52)
    let v54 = []
    let v55 = [v12, ..v54]
    let v56 = [v53, ..v55]
    let v57 = erlang_term_tuple(v56)
    let v58 = []
    let v59 = method301(v50, v58)
    let v60 = [v57, ..v59]
    let v61 = erlang_term_coerce(v60)
    let v62 = "maps"
    let v63 = atom.create(v62)
    let v64 = "from_list"
    let v65 = atom.create(v64)
    let v66 = []
    let v67 = [v61, ..v66]
    let v68 = erlang_term_apply(v63, v65, v67)
    v68
}

pub fn search_body_569(v0: Uh29, v1: String) -> Dynamic {
    let v2 = "next_token"
    let v3 = v1 == ""
    let v7 =
        case v3 {
            True -> Uh3Nil
            False -> {
                let v5 = "&"
                split_list_2(v5, v1)
            }
        }
    let v8 = first_value_474(v2, v7)
    let v9 = v8 == ""
    let v11 =
        case v9 {
            True -> {
                let v10 = "0"
                v10
            }
            False -> v8
        }
    let v12 = count_of_text_10(v11)
    let v15 =
        case v12  {
            Us3None -> 0
            Us3Some(v13) -> v13
        }
    let v16 = "max_results"
    let v20 =
        case v3 {
            True -> Uh3Nil
            False -> {
                let v18 = "&"
                split_list_2(v18, v1)
            }
        }
    let v21 = first_value_474(v16, v20)
    let v22 = v21 == ""
    let v24 =
        case v22 {
            True -> {
                let v23 = "10"
                v23
            }
            False -> v21
        }
    let v25 = count_of_text_10(v24)
    let v28 =
        case v25  {
            Us3None -> 0
            Us3Some(v26) -> v26
        }
    let v29 = sliced_480(v15, v28, v0)
    let v30 = Uh29Nil
    let v31 = method570(v1, v29, v30)
    let v39 =
        case v31  {
            Uh29Nil -> Uh38Nil
            _ -> {
                let v33 = []
                let v34 = method301(v31, v33)
                let v35 = erlang_term_coerce(v34)
                let v36 = "data"
                let v37 = Uh38Nil
                Uh38Cons(v36, v35, v37)
            }
        }
    let v40 = spiral_wrap_signed(v15 + v28, 32)
    let v41 = 0
    let v42 = method481(v0, v41)
    let v43 = v40 < v42
    let v44 = search_meta_571(v29, v40, v43)
    let v45 = "meta"
    let v46 = Uh38Nil
    let v47 = Uh38Cons(v45, v44, v46)
    let v48 = method466(v39, v47)
    let v49 = Uh29Nil
    let v50 = method467(v48, v49)
    let v51 = []
    let v52 = method301(v50, v51)
    let v53 = erlang_term_coerce(v52)
    let v54 = "maps"
    let v55 = atom.create(v54)
    let v56 = "from_list"
    let v57 = atom.create(v56)
    let v58 = []
    let v59 = [v53, ..v58]
    let v60 = erlang_term_apply(v55, v57, v59)
    v60
}

pub fn method574(v0: dict.Dict(String, Dynamic), v1: Uh3, v2: Uh29) -> Uh29 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = dict.get(v0, v3)
            let v6 = method471()
            let v7 = method472()
            let v8 = case v5 { Ok(x) -> v6(x) Error(x) -> v7(x) }
            let v13 =
                case v8  {
                    Us94Error -> Us72None
                    Us94Ok(v9) -> Us72Some(v9)
                }
            let v17 =
                case v13  {
                    Us72None -> panic as "dictm.present: the key is not in the dict"
                    Us72Some(v14) -> v14
                }
            let v18 = Uh29Cons(v17, v2)
            method574(v0, v4, v18)
        }
        Uh3Nil -> v2
    }
}

pub fn method575(v0: String, v1: String, v2: String, v3: Uh29, v4: Uh29) -> Uh29 {
    case v3  {
        Uh29Cons(v5, v6) -> {
            let v7 = method575(v0, v1, v2, v6, v4)
            let v8 = v1 == ""
            let v40 =
                case v8 {
                    True -> True
                    False -> {
                        let v9 = "author_id"
                        let v10 = erlang_term_coerce(v9)
                        let v11 = ""
                        let v12 = erlang_term_coerce(v11)
                        let v13 = "maps"
                        let v14 = atom.create(v13)
                        let v15 = "get"
                        let v16 = atom.create(v15)
                        let v17 = []
                        let v18 = [v12, ..v17]
                        let v19 = [v5, ..v18]
                        let v20 = [v10, ..v19]
                        let v21 = erlang_term_apply(v14, v16, v20)
                        let v22 = "erlang"
                        let v23 = atom.create(v22)
                        let v24 = "is_binary"
                        let v25 = atom.create(v24)
                        let v26 = []
                        let v27 = [v21, ..v26]
                        let v28 = erlang_term_apply(v23, v25, v27)
                        let v29 = erlang_term_coerce(v28)
                        let v38 =
                            case v29 {
                                True -> {
                                    let v30 = erlang_term_coerce(v21)
                                    v30
                                }
                                False -> {
                                    let v31 = atom.create(v22)
                                    let v32 = "integer_to_binary"
                                    let v33 = atom.create(v32)
                                    let v34 = []
                                    let v35 = [v21, ..v34]
                                    let v36 = erlang_term_apply(v31, v33, v35)
                                    let v37 = erlang_term_coerce(v36)
                                    v37
                                }
                            }
                        let v39 = v38 == v1
                        v39
                    }
                }
            let v41 = "id"
            let v42 = erlang_term_coerce(v41)
            let v43 = ""
            let v44 = erlang_term_coerce(v43)
            let v45 = "maps"
            let v46 = atom.create(v45)
            let v47 = "get"
            let v48 = atom.create(v47)
            let v49 = []
            let v50 = [v44, ..v49]
            let v51 = [v5, ..v50]
            let v52 = [v42, ..v51]
            let v53 = erlang_term_apply(v46, v48, v52)
            let v54 = "conversation_id"
            let v55 = erlang_term_coerce(v54)
            let v56 = atom.create(v45)
            let v57 = atom.create(v47)
            let v58 = []
            let v59 = [v53, ..v58]
            let v60 = [v5, ..v59]
            let v61 = [v55, ..v60]
            let v62 = erlang_term_apply(v56, v57, v61)
            let v63 = "erlang"
            let v64 = atom.create(v63)
            let v65 = "is_binary"
            let v66 = atom.create(v65)
            let v67 = []
            let v68 = [v62, ..v67]
            let v69 = erlang_term_apply(v64, v66, v68)
            let v70 = erlang_term_coerce(v69)
            let v79 =
                case v70 {
                    True -> {
                        let v71 = erlang_term_coerce(v62)
                        v71
                    }
                    False -> {
                        let v72 = atom.create(v63)
                        let v73 = "integer_to_binary"
                        let v74 = atom.create(v73)
                        let v75 = []
                        let v76 = [v62, ..v75]
                        let v77 = erlang_term_apply(v72, v74, v76)
                        let v78 = erlang_term_coerce(v77)
                        v78
                    }
                }
            let v80 = v79 == v0
            let v81 = v80 && v40
            let v104 =
                case v81 {
                    True -> {
                        let v82 = "created_at"
                        let v83 = erlang_term_coerce(v82)
                        let v84 = erlang_term_coerce(v43)
                        let v85 = atom.create(v45)
                        let v86 = atom.create(v47)
                        let v87 = []
                        let v88 = [v84, ..v87]
                        let v89 = [v5, ..v88]
                        let v90 = [v83, ..v89]
                        let v91 = erlang_term_apply(v85, v86, v90)
                        let v92 = erlang_term_coerce(v91)
                        let v93 = spiral_string_slice(v92, 0, 18)
                        let v94 = erlang_term_coerce(v93)
                        let v95 = erlang_term_coerce(v2)
                        let v96 = atom.create(v63)
                        let v97 = ">="
                        let v98 = atom.create(v97)
                        let v99 = []
                        let v100 = [v95, ..v99]
                        let v101 = [v94, ..v100]
                        let v102 = erlang_term_apply(v96, v98, v101)
                        let v103 = erlang_term_coerce(v102)
                        v103
                    }
                    False -> False
                }
            case v104 {
                True -> Uh29Cons(v5, v7)
                False -> v7
            }
        }
        Uh29Nil -> v4
    }
}

pub fn by_id_desc_577(v0: Dynamic, v1: Uh29) -> Uh29 {
    case v1  {
        Uh29Cons(v2, v3) -> {
            let v4 = "id"
            let v5 = erlang_term_coerce(v4)
            let v6 = ""
            let v7 = erlang_term_coerce(v6)
            let v8 = "maps"
            let v9 = atom.create(v8)
            let v10 = "get"
            let v11 = atom.create(v10)
            let v12 = []
            let v13 = [v7, ..v12]
            let v14 = [v2, ..v13]
            let v15 = [v5, ..v14]
            let v16 = erlang_term_apply(v9, v11, v15)
            let v17 = "erlang"
            let v18 = atom.create(v17)
            let v19 = "is_binary"
            let v20 = atom.create(v19)
            let v21 = []
            let v22 = [v16, ..v21]
            let v23 = erlang_term_apply(v18, v20, v22)
            let v24 = erlang_term_coerce(v23)
            let v33 =
                case v24 {
                    True -> {
                        let v25 = erlang_term_coerce(v16)
                        v25
                    }
                    False -> {
                        let v26 = atom.create(v17)
                        let v27 = "integer_to_binary"
                        let v28 = atom.create(v27)
                        let v29 = []
                        let v30 = [v16, ..v29]
                        let v31 = erlang_term_apply(v26, v28, v30)
                        let v32 = erlang_term_coerce(v31)
                        v32
                    }
                }
            let v34 = spiral_string_length(v33)
            let v35 = string.inspect(v34)
            let v36 = erlang_term_coerce(v35)
            let v37 = erlang_term_coerce(10)
            let v38 = "leading"
            let v39 = atom.create(v38)
            let v40 = erlang_term_coerce(v39)
            let v41 = erlang_term_coerce(48)
            let v42 = "string"
            let v43 = atom.create(v42)
            let v44 = "pad"
            let v45 = atom.create(v44)
            let v46 = []
            let v47 = [v41, ..v46]
            let v48 = [v40, ..v47]
            let v49 = [v37, ..v48]
            let v50 = [v36, ..v49]
            let v51 = erlang_term_apply(v43, v45, v50)
            let v52 = atom.create(v17)
            let v53 = "iolist_to_binary"
            let v54 = atom.create(v53)
            let v55 = []
            let v56 = [v51, ..v55]
            let v57 = erlang_term_apply(v52, v54, v56)
            let v58 = erlang_term_coerce(v57)
            let v59 = "|"
            let v60 = v58 <> v59 
            let v61 = v60 <> v33 
            let v62 = erlang_term_coerce(v4)
            let v63 = erlang_term_coerce(v6)
            let v64 = atom.create(v8)
            let v65 = atom.create(v10)
            let v66 = []
            let v67 = [v63, ..v66]
            let v68 = [v0, ..v67]
            let v69 = [v62, ..v68]
            let v70 = erlang_term_apply(v64, v65, v69)
            let v71 = atom.create(v17)
            let v72 = atom.create(v19)
            let v73 = []
            let v74 = [v70, ..v73]
            let v75 = erlang_term_apply(v71, v72, v74)
            let v76 = erlang_term_coerce(v75)
            let v85 =
                case v76 {
                    True -> {
                        let v77 = erlang_term_coerce(v70)
                        v77
                    }
                    False -> {
                        let v78 = atom.create(v17)
                        let v79 = "integer_to_binary"
                        let v80 = atom.create(v79)
                        let v81 = []
                        let v82 = [v70, ..v81]
                        let v83 = erlang_term_apply(v78, v80, v82)
                        let v84 = erlang_term_coerce(v83)
                        v84
                    }
                }
            let v86 = spiral_string_length(v85)
            let v87 = string.inspect(v86)
            let v88 = erlang_term_coerce(v87)
            let v89 = erlang_term_coerce(10)
            let v90 = atom.create(v38)
            let v91 = erlang_term_coerce(v90)
            let v92 = erlang_term_coerce(48)
            let v93 = atom.create(v42)
            let v94 = atom.create(v44)
            let v95 = []
            let v96 = [v92, ..v95]
            let v97 = [v91, ..v96]
            let v98 = [v89, ..v97]
            let v99 = [v88, ..v98]
            let v100 = erlang_term_apply(v93, v94, v99)
            let v101 = atom.create(v17)
            let v102 = atom.create(v53)
            let v103 = []
            let v104 = [v100, ..v103]
            let v105 = erlang_term_apply(v101, v102, v104)
            let v106 = erlang_term_coerce(v105)
            let v107 = v106 <> v59 
            let v108 = v107 <> v85 
            let v109 = erlang_term_coerce(v61)
            let v110 = erlang_term_coerce(v108)
            let v111 = atom.create(v17)
            let v112 = ">="
            let v113 = atom.create(v112)
            let v114 = []
            let v115 = [v110, ..v114]
            let v116 = [v109, ..v115]
            let v117 = erlang_term_apply(v111, v113, v116)
            let v118 = erlang_term_coerce(v117)
            case v118 {
                True -> {
                    let v119 = by_id_desc_577(v0, v3)
                    Uh29Cons(v2, v119)
                }
                False -> Uh29Cons(v0, v1)
            }
        }
        _ -> Uh29Cons(v0, v1)
    }
}

pub fn method576(v0: Uh29, v1: Uh29) -> Uh29 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = by_id_desc_577(v2, v1)
            method576(v3, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn found_posts_573(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, v5: dict.Dict(String, Dynamic), _v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, v12: String, v13: String, v14: String) -> Uh29 {
    let v15 = dict.keys(v5)
    let v16 = dictm_term_sorted(v15)
    let v17 = Uh3Nil
    let listm_fold = v16 |> list.fold (v17, fn (acc, x) {
    let v18 = x
    let v19 = acc
    let v20 = Uh3Cons(v18, v19)
    v20
    })
    let v21 = listm_fold
    let v22 = Uh3Nil
    let v23 = method4(v21, v22)
    let v24 = Uh29Nil
    let v25 = method574(v5, v23, v24)
    let v26 = Uh29Nil
    let v27 = method575(v12, v13, v14, v25, v26)
    let v28 = Uh29Nil
    method576(v27, v28)
}

pub fn search_564(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Bool, v13: String) -> Dynamic {
    let v14 = search_terms_565(v13)
    let v15 =
        case v12 {
            True -> 30
            False -> 7
        }
    let v16 = window_start_568(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v15)
    let v17 = "start_time"
    let v18 = v13 == ""
    let v22 =
        case v18 {
            True -> Uh3Nil
            False -> {
                let v20 = "&"
                split_list_2(v20, v13)
            }
        }
    let v23 = first_value_474(v17, v22)
    let v24 = v23 == ""
    let v26 =
        case v24 {
            True -> {
                let v25 = ""
                v25
            }
            False -> v23
        }
    let v27 = spiral_string_slice(v26, 0, 18)
    let v28 = v27 != ""
    let v42 =
        case v28 {
            True -> {
                case v12 {
                    True -> True
                    False -> {
                        let v29 = erlang_term_coerce(v16)
                        let v30 = erlang_term_coerce(v27)
                        let v31 = "erlang"
                        let v32 = atom.create(v31)
                        let v33 = ">="
                        let v34 = atom.create(v33)
                        let v35 = []
                        let v36 = [v30, ..v35]
                        let v37 = [v29, ..v36]
                        let v38 = erlang_term_apply(v32, v34, v37)
                        let v39 = erlang_term_coerce(v38)
                        let v40 = v39 == False
                        v40
                    }
                }
            }
            False -> False
        }
    let v43 =
        case v42 {
            True -> v27
            False -> v16
        }
    let v44 = "conversation_id"
    let v45 = dict.has_key(v14, v44)
    let v60 =
        case v45 {
            True -> {
                let v46 = dict.get(v14, v44)
                let v47 = method259()
                let v48 = method260()
                let v49 = case v46 { Ok(x) -> v47(x) Error(x) -> v48(x) }
                let v54 =
                    case v49  {
                        Us56Error -> Us2None
                        Us56Ok(v50) -> Us2Some(v50)
                    }
                case v54  {
                    Us2None -> panic as "dictm.present: the key is not in the dict"
                    Us2Some(v55) -> v55
                }
            }
            False -> {
                let v59 = ""
                v59
            }
        }
    let v61 = "from"
    let v62 = dict.has_key(v14, v61)
    let v77 =
        case v62 {
            True -> {
                let v63 = dict.get(v14, v61)
                let v64 = method259()
                let v65 = method260()
                let v66 = case v63 { Ok(x) -> v64(x) Error(x) -> v65(x) }
                let v71 =
                    case v66  {
                        Us56Error -> Us2None
                        Us56Ok(v67) -> Us2Some(v67)
                    }
                case v71  {
                    Us2None -> panic as "dictm.present: the key is not in the dict"
                    Us2Some(v72) -> v72
                }
            }
            False -> {
                let v76 = ""
                v76
            }
        }
    let v78 = v77 |> string.lowercase
    let v79 = dict.has_key(v2, v78)
    let v124 =
        case v79 {
            True -> {
                let v80 = v77 |> string.lowercase
                let v81 = dict.get(v2, v80)
                let v82 = method471()
                let v83 = method472()
                let v84 = case v81 { Ok(x) -> v82(x) Error(x) -> v83(x) }
                let v89 =
                    case v84  {
                        Us94Error -> Us72None
                        Us94Ok(v85) -> Us72Some(v85)
                    }
                let v93 =
                    case v89  {
                        Us72None -> panic as "dictm.present: the key is not in the dict"
                        Us72Some(v90) -> v90
                    }
                let v94 = "id"
                let v95 = erlang_term_coerce(v94)
                let v96 = ""
                let v97 = erlang_term_coerce(v96)
                let v98 = "maps"
                let v99 = atom.create(v98)
                let v100 = "get"
                let v101 = atom.create(v100)
                let v102 = []
                let v103 = [v97, ..v102]
                let v104 = [v93, ..v103]
                let v105 = [v95, ..v104]
                let v106 = erlang_term_apply(v99, v101, v105)
                let v107 = "erlang"
                let v108 = atom.create(v107)
                let v109 = "is_binary"
                let v110 = atom.create(v109)
                let v111 = []
                let v112 = [v106, ..v111]
                let v113 = erlang_term_apply(v108, v110, v112)
                let v114 = erlang_term_coerce(v113)
                case v114 {
                    True -> {
                        let v115 = erlang_term_coerce(v106)
                        v115
                    }
                    False -> {
                        let v116 = atom.create(v107)
                        let v117 = "integer_to_binary"
                        let v118 = atom.create(v117)
                        let v119 = []
                        let v120 = [v106, ..v119]
                        let v121 = erlang_term_apply(v116, v118, v120)
                        let v122 = erlang_term_coerce(v121)
                        v122
                    }
                }
            }
            False -> v77
        }
    let v125 = v60 == ""
    case v125 {
        True -> {
            let v126 = Uh29Nil
            search_body_569(v126, v13)
        }
        False -> {
            let v128 = found_posts_573(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v60, v124, v43)
            search_body_569(v128, v13)
        }
    }
}
