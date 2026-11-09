import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/list
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Uh36, Uh29Cons, Uh29Nil, Uh37Cons, Uh37Nil, Uh3Cons, Uh3Nil, Us108None, Us108Some, Us111Error, Us111Ok, Us2None, Us2Some, Us3None, Us3Some, Us56Error, Us56Ok}
import xsim_frames/part1.{closure1, count_of_text_10, dictm_term_sorted, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, method4, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part12.{method300}
import xsim_frames/part25.{first_value_465}
import xsim_frames/part28.{method542, method543, method547, method548, method556, sliced_555}
import xsim_frames/part29.{method563}
import xsim_frames/part30.{sorted_by_577}
import xsim_frames/part31.{rendered_599}
import xsim_frames/part9.{method258, method259}

pub fn single_644(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, v5: dict.Dict(String, Dynamic), _v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, _v12: Uh36, _v13: String, v14: String, v15: String) -> Dynamic {
    let v16 = dict.has_key(v5, v14)
    case v16 {
        True -> {
            let v17 = dict.get(v5, v14)
            let v18 = method547()
            let v19 = method548()
            let v20 = case v17 { Ok(x) -> v18(x) Error(x) -> v19(x) }
            let v25 =
                case v20  {
                    Us111Error -> Us108None
                    Us111Ok(v21) -> Us108Some(v21)
                }
            let v29 =
                case v25  {
                    Us108None -> panic as "dict.present: the key is not in the dict"
                    Us108Some(v26) -> v26
                }
            let v31 = v15 == ""
            let v35 =
                case v31 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2("&", v15)
                    }
                }
            let v36 = first_value_465("post.fields", v35)
            let v37 = v36 == ""
            let v41 =
                case v37 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2(",", v36)
                    }
                }
            let v43 = method563(v41, Uh3Nil)
            let v44 = rendered_599(v29, v43)
            let v46 = atom.create("data")
            let v47 = erlang_term_coerce(v46)
            let v48 = []
            let v49 = [v44, ..v48]
            let v50 = [v47, ..v49]
            let v51 = erlang_term_tuple(v50)
            let v52 = []
            let v53 = [v51, ..v52]
            let v54 = erlang_term_coerce(v53)
            let v56 = atom.create("maps")
            let v58 = atom.create("from_list")
            let v59 = []
            let v60 = [v54, ..v59]
            erlang_term_apply(v56, v58, v60)
        }
        False -> {
            let v62 = erlang_term_coerce(v14)
            let v63 = { "Could not find post with id: [" } <> { v14 }
            let v64 = { v63 } <> { "]." }
            let v65 = erlang_term_coerce(v64)
            let v67 = erlang_term_coerce("Not Found Error")
            let v69 = erlang_term_coerce("post")
            let v71 = erlang_term_coerce("id")
            let v73 = atom.create("parameter")
            let v74 = erlang_term_coerce(v73)
            let v75 = []
            let v76 = [v71, ..v75]
            let v77 = [v74, ..v76]
            let v78 = erlang_term_tuple(v77)
            let v80 = atom.create("resource_type")
            let v81 = erlang_term_coerce(v80)
            let v82 = []
            let v83 = [v69, ..v82]
            let v84 = [v81, ..v83]
            let v85 = erlang_term_tuple(v84)
            let v87 = atom.create("title")
            let v88 = erlang_term_coerce(v87)
            let v89 = []
            let v90 = [v67, ..v89]
            let v91 = [v88, ..v90]
            let v92 = erlang_term_tuple(v91)
            let v94 = atom.create("detail")
            let v95 = erlang_term_coerce(v94)
            let v96 = []
            let v97 = [v65, ..v96]
            let v98 = [v95, ..v97]
            let v99 = erlang_term_tuple(v98)
            let v101 = atom.create("value")
            let v102 = erlang_term_coerce(v101)
            let v103 = []
            let v104 = [v62, ..v103]
            let v105 = [v102, ..v104]
            let v106 = erlang_term_tuple(v105)
            let v107 = []
            let v108 = [v78, ..v107]
            let v109 = [v85, ..v108]
            let v110 = [v92, ..v109]
            let v111 = [v99, ..v110]
            let v112 = [v106, ..v111]
            let v113 = erlang_term_coerce(v112)
            let v114 = "maps"
            let v115 = atom.create(v114)
            let v116 = "from_list"
            let v117 = atom.create(v116)
            let v118 = []
            let v119 = [v113, ..v118]
            let v120 = erlang_term_apply(v115, v117, v119)
            let v121 = []
            let v122 = [v120, ..v121]
            let v123 = erlang_term_coerce(v122)
            let v125 = atom.create("errors")
            let v126 = erlang_term_coerce(v125)
            let v127 = []
            let v128 = [v123, ..v127]
            let v129 = [v126, ..v128]
            let v130 = erlang_term_tuple(v129)
            let v131 = []
            let v132 = [v130, ..v131]
            let v133 = erlang_term_coerce(v132)
            let v134 = atom.create(v114)
            let v135 = atom.create(v116)
            let v136 = []
            let v137 = [v133, ..v136]
            erlang_term_apply(v134, v135, v137)
        }
    }
}

pub fn method647(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method647(v3, v1)
            let v6 = option.from_result(result.map(string.split_once(v2, ":"), pair.first))
            let v7 = closure1(Nil)
            let v8 = v6 |> option.map(v7)
            let v10 = v8 |> option.unwrap(Us2None)
            let v14 =
                case v10  {
                    Us2None -> -1
                    Us2Some(v11) -> {
                        bit_array.byte_size(bit_array.from_string(v11))
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

pub fn method648(v0: Uh3, v1: dict.Dict(String, String)) -> dict.Dict(String, String) {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v5 = option.from_result(result.map(string.split_once(v2, ":"), pair.first))
            let v6 = closure1(Nil)
            let v7 = v5 |> option.map(v6)
            let v9 = v7 |> option.unwrap(Us2None)
            let v13 =
                case v9  {
                    Us2None -> -1
                    Us2Some(v10) -> {
                        bit_array.byte_size(bit_array.from_string(v10))
                    }
                }
            let v14 = spiral_wrap_signed(v13 + 1, 32)
            let v15 = v13 < 0
            let #(v24, v25) =
                case v15 {
                    True -> {
                        #(v2, "")
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
            method648(v3, v26)
        }
        Uh3Nil -> v1
    }
}

pub fn search_terms_646(v0: String) -> dict.Dict(String, String) {
    let v2 = v0 == ""
    let v6 =
        case v2 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v0)
            }
        }
    let v7 = first_value_465("query", v6)
    let v8 = v7 == ""
    let v10 =
        case v8 {
            True -> {
                ""
            }
            False -> v7
        }
    let v12 = " "
    let v13 = v10 |> string.replace("\t", v12)
    let v15 = v13 |> string.replace("\r", v12)
    let v17 = v15 |> string.replace("\n", v12)
    let v18 = v17 == ""
    let v21 =
        case v18 {
            True -> Uh3Nil
            False -> split_list_2(v12, v17)
        }
    let v23 = method647(v21, Uh3Nil)
    let v24 = dict.new()
    method648(v23, v24)
}

pub fn window_start_649(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, _v12: Uh36, _v13: String, v14: Int) -> String {
    let v15 = erlang_term_coerce(v6)
    let v16 = "unicode"
    let v17 = atom.create(v16)
    let v18 = "characters_to_list"
    let v19 = atom.create(v18)
    let v20 = []
    let v21 = [v15, ..v20]
    let v22 = erlang_term_apply(v17, v19, v21)
    let v23 = "calendar"
    let v24 = atom.create(v23)
    let v26 = atom.create("rfc3339_to_system_time")
    let v27 = []
    let v28 = [v22, ..v27]
    let v29 = erlang_term_apply(v24, v26, v28)
    let v30 = erlang_term_coerce(v29)
    let v31 = spiral_wrap_signed(v14 * 86400, 32)
    let v32 = spiral_wrap_signed(v31, 64)
    let v33 = spiral_wrap_signed(v30 - v32, 64)
    let v34 = erlang_term_coerce(v33)
    let v36 = atom.create("offset")
    let v37 = erlang_term_coerce(v36)
    let v39 = erlang_term_coerce("Z")
    let v40 = atom.create(v16)
    let v41 = atom.create(v18)
    let v42 = []
    let v43 = [v39, ..v42]
    let v44 = erlang_term_apply(v40, v41, v43)
    let v45 = []
    let v46 = [v44, ..v45]
    let v47 = [v37, ..v46]
    let v48 = erlang_term_tuple(v47)
    let v49 = []
    let v50 = [v48, ..v49]
    let v51 = erlang_term_coerce(v50)
    let v52 = atom.create(v23)
    let v54 = atom.create("system_time_to_rfc3339")
    let v55 = []
    let v56 = [v51, ..v55]
    let v57 = [v34, ..v56]
    let v58 = erlang_term_apply(v52, v54, v57)
    let v59 = atom.create(v16)
    let v61 = atom.create("characters_to_binary")
    let v62 = []
    let v63 = [v58, ..v62]
    let v64 = erlang_term_apply(v59, v61, v63)
    let v65 = erlang_term_coerce(v64)
    spiral_string_slice(v65, 0, 18)
}

pub fn method651(v0: String, v1: Uh29, v2: Uh29) -> Uh29 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method651(v0, v4, v2)
            let v7 = v0 == ""
            let v11 =
                case v7 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2("&", v0)
                    }
                }
            let v12 = first_value_465("post.fields", v11)
            let v13 = v12 == ""
            let v17 =
                case v13 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2(",", v12)
                    }
                }
            let v19 = method563(v17, Uh3Nil)
            let v20 = rendered_599(v3, v19)
            Uh29Cons(v20, v5)
        }
        Uh29Nil -> v2
    }
}

pub fn method653(v0: Uh29, v1: Dynamic) -> Dynamic {
    case v0  {
        Uh29Cons(v2, v3) -> method653(v3, v2)
        Uh29Nil -> v1
    }
}

pub fn search_meta_652(v0: Uh29, v1: Int, v2: Bool) -> Dynamic {
    let v3 = int.to_string(v1)
    let v4 = erlang_term_coerce(v3)
    let v9 =
        case v2 {
            True -> {
                Uh37Cons("next_token", v4, Uh37Nil)
            }
            False -> Uh37Nil
        }
    let v11 = method556(v0, 0)
    let v12 = erlang_term_coerce(v11)
    let v49 =
        case v0  {
            Uh29Cons(v13, v14) -> {
                let v15 = ""
                let v16 = erlang_term_coerce(v15)
                let v17 = "id"
                let v18 = erlang_term_coerce(v17)
                let v19 = erlang_term_coerce(v16)
                let v20 = "maps"
                let v21 = atom.create(v20)
                let v22 = "get"
                let v23 = atom.create(v22)
                let v24 = []
                let v25 = [v19, ..v24]
                let v26 = [v13, ..v25]
                let v27 = [v18, ..v26]
                let v28 = erlang_term_apply(v21, v23, v27)
                let v29 = erlang_term_coerce(v28)
                let v30 = method653(v0, v13)
                let v31 = erlang_term_coerce(v15)
                let v32 = erlang_term_coerce(v17)
                let v33 = erlang_term_coerce(v31)
                let v34 = atom.create(v20)
                let v35 = atom.create(v22)
                let v36 = []
                let v37 = [v33, ..v36]
                let v38 = [v30, ..v37]
                let v39 = [v32, ..v38]
                let v40 = erlang_term_apply(v34, v35, v39)
                let v41 = erlang_term_coerce(v40)
                let v45 = Uh37Cons("oldest_id", v41, Uh37Nil)
                Uh37Cons("newest_id", v29, v45)
            }
            Uh29Nil -> Uh37Nil
        }
    let v51 = method542(v9, Uh37Nil)
    let v52 = method542(v49, v51)
    let v54 = method543(v52, Uh29Nil)
    let v56 = atom.create("result_count")
    let v57 = erlang_term_coerce(v56)
    let v58 = []
    let v59 = [v12, ..v58]
    let v60 = [v57, ..v59]
    let v61 = erlang_term_tuple(v60)
    let v62 = []
    let v63 = method300(v54, v62)
    let v64 = [v61, ..v63]
    let v65 = erlang_term_coerce(v64)
    let v67 = atom.create("maps")
    let v69 = atom.create("from_list")
    let v70 = []
    let v71 = [v65, ..v70]
    erlang_term_apply(v67, v69, v71)
}

pub fn search_body_650(v0: Uh29, v1: String) -> Dynamic {
    let v3 = v1 == ""
    let v7 =
        case v3 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v1)
            }
        }
    let v8 = first_value_465("next_token", v7)
    let v9 = v8 == ""
    let v11 =
        case v9 {
            True -> {
                "0"
            }
            False -> v8
        }
    let v12 = count_of_text_10(v11)
    let v15 =
        case v12  {
            Us3None -> 0
            Us3Some(v13) -> v13
        }
    let v20 =
        case v3 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v1)
            }
        }
    let v21 = first_value_465("max_results", v20)
    let v22 = v21 == ""
    let v24 =
        case v22 {
            True -> {
                "10"
            }
            False -> v21
        }
    let v25 = count_of_text_10(v24)
    let v28 =
        case v25  {
            Us3None -> 0
            Us3Some(v26) -> v26
        }
    let v29 = sliced_555(v15, v28, v0)
    let v31 = method651(v1, v29, Uh29Nil)
    let v39 =
        case v31  {
            Uh29Nil -> Uh37Nil
            _ -> {
                let v33 = []
                let v34 = method300(v31, v33)
                let v35 = erlang_term_coerce(v34)
                Uh37Cons("data", v35, Uh37Nil)
            }
        }
    let v40 = spiral_wrap_signed(v15 + v28, 32)
    let v42 = method556(v0, 0)
    let v43 = v40 < v42
    let v44 = search_meta_652(v29, v40, v43)
    let v47 = Uh37Cons("meta", v44, Uh37Nil)
    let v48 = method542(v39, v47)
    let v50 = method543(v48, Uh29Nil)
    let v51 = []
    let v52 = method300(v50, v51)
    let v53 = erlang_term_coerce(v52)
    let v55 = atom.create("maps")
    let v57 = atom.create("from_list")
    let v58 = []
    let v59 = [v53, ..v58]
    erlang_term_apply(v55, v57, v59)
}

pub fn method655(v0: dict.Dict(String, Dynamic), v1: Uh3, v2: Uh29) -> Uh29 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = dict.get(v0, v3)
            let v6 = method547()
            let v7 = method548()
            let v8 = case v5 { Ok(x) -> v6(x) Error(x) -> v7(x) }
            let v13 =
                case v8  {
                    Us111Error -> Us108None
                    Us111Ok(v9) -> Us108Some(v9)
                }
            let v17 =
                case v13  {
                    Us108None -> panic as "dict.present: the key is not in the dict"
                    Us108Some(v14) -> v14
                }
            let v18 = Uh29Cons(v17, v2)
            method655(v0, v4, v18)
        }
        Uh3Nil -> v2
    }
}

pub fn method656(v0: String, v1: String, v2: String, v3: Uh29, v4: Uh29) -> Uh29 {
    case v3  {
        Uh29Cons(v5, v6) -> {
            let v7 = method656(v0, v1, v2, v6, v4)
            let v8 = v1 == ""
            let v42 =
                case v8 {
                    True -> True
                    False -> {
                        let v10 = erlang_term_coerce("")
                        let v12 = erlang_term_coerce("author_id")
                        let v13 = erlang_term_coerce(v10)
                        let v15 = atom.create("maps")
                        let v17 = atom.create("get")
                        let v18 = []
                        let v19 = [v13, ..v18]
                        let v20 = [v5, ..v19]
                        let v21 = [v12, ..v20]
                        let v22 = erlang_term_apply(v15, v17, v21)
                        let v23 = erlang_term_coerce(v22)
                        let v24 = "erlang"
                        let v25 = atom.create(v24)
                        let v27 = atom.create("is_binary")
                        let v28 = []
                        let v29 = [v23, ..v28]
                        let v30 = erlang_term_apply(v25, v27, v29)
                        let v31 = erlang_term_coerce(v30)
                        let v40 =
                            case v31 {
                                True -> {
                                    erlang_term_coerce(v23)
                                }
                                False -> {
                                    let v33 = atom.create(v24)
                                    let v35 = atom.create("integer_to_binary")
                                    let v36 = []
                                    let v37 = [v23, ..v36]
                                    let v38 = erlang_term_apply(v33, v35, v37)
                                    erlang_term_coerce(v38)
                                }
                            }
                        v40 == v1
                    }
                }
            let v43 = ""
            let v44 = erlang_term_coerce(v43)
            let v46 = erlang_term_coerce("id")
            let v47 = erlang_term_coerce(v44)
            let v48 = "maps"
            let v49 = atom.create(v48)
            let v50 = "get"
            let v51 = atom.create(v50)
            let v52 = []
            let v53 = [v47, ..v52]
            let v54 = [v5, ..v53]
            let v55 = [v46, ..v54]
            let v56 = erlang_term_apply(v49, v51, v55)
            let v57 = erlang_term_coerce(v56)
            let v59 = erlang_term_coerce("conversation_id")
            let v60 = erlang_term_coerce(v57)
            let v61 = atom.create(v48)
            let v62 = atom.create(v50)
            let v63 = []
            let v64 = [v60, ..v63]
            let v65 = [v5, ..v64]
            let v66 = [v59, ..v65]
            let v67 = erlang_term_apply(v61, v62, v66)
            let v68 = erlang_term_coerce(v67)
            let v69 = "erlang"
            let v70 = atom.create(v69)
            let v72 = atom.create("is_binary")
            let v73 = []
            let v74 = [v68, ..v73]
            let v75 = erlang_term_apply(v70, v72, v74)
            let v76 = erlang_term_coerce(v75)
            let v85 =
                case v76 {
                    True -> {
                        erlang_term_coerce(v68)
                    }
                    False -> {
                        let v78 = atom.create(v69)
                        let v80 = atom.create("integer_to_binary")
                        let v81 = []
                        let v82 = [v68, ..v81]
                        let v83 = erlang_term_apply(v78, v80, v82)
                        erlang_term_coerce(v83)
                    }
                }
            let v86 = v85 == v0
            let v87 = v86 && v42
            let v112 =
                case v87 {
                    True -> {
                        let v88 = erlang_term_coerce(v43)
                        let v90 = erlang_term_coerce("created_at")
                        let v91 = erlang_term_coerce(v88)
                        let v92 = atom.create(v48)
                        let v93 = atom.create(v50)
                        let v94 = []
                        let v95 = [v91, ..v94]
                        let v96 = [v5, ..v95]
                        let v97 = [v90, ..v96]
                        let v98 = erlang_term_apply(v92, v93, v97)
                        let v99 = erlang_term_coerce(v98)
                        let v100 = erlang_term_coerce(v99)
                        let v101 = spiral_string_slice(v100, 0, 18)
                        let v102 = erlang_term_coerce(v101)
                        let v103 = erlang_term_coerce(v2)
                        let v104 = atom.create(v69)
                        let v106 = atom.create(">=")
                        let v107 = []
                        let v108 = [v103, ..v107]
                        let v109 = [v102, ..v108]
                        let v110 = erlang_term_apply(v104, v106, v109)
                        erlang_term_coerce(v110)
                    }
                    False -> False
                }
            case v112 {
                True -> Uh29Cons(v5, v7)
                False -> v7
            }
        }
        Uh29Nil -> v4
    }
}

pub fn closure172(capt: #(Dynamic)) -> fn(Dynamic) -> Bool {
    fn (v1) {
        let #(v0) = capt
        let v2 = ""
        let v3 = erlang_term_coerce(v2)
        let v4 = "id"
        let v5 = erlang_term_coerce(v4)
        let v6 = erlang_term_coerce(v3)
        let v7 = "maps"
        let v8 = atom.create(v7)
        let v9 = "get"
        let v10 = atom.create(v9)
        let v11 = []
        let v12 = [v6, ..v11]
        let v13 = [v1, ..v12]
        let v14 = [v5, ..v13]
        let v15 = erlang_term_apply(v8, v10, v14)
        let v16 = erlang_term_coerce(v15)
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
                    erlang_term_coerce(v16)
                }
                False -> {
                    let v26 = atom.create(v17)
                    let v28 = atom.create("integer_to_binary")
                    let v29 = []
                    let v30 = [v16, ..v29]
                    let v31 = erlang_term_apply(v26, v28, v30)
                    erlang_term_coerce(v31)
                }
            }
        let v34 = spiral_string_length(v33)
        let v35 = int.to_string(v34)
        let v36 = erlang_term_coerce(v35)
        let v37 = erlang_term_coerce(10)
        let v38 = "leading"
        let v39 = atom.create(v38)
        let v40 = erlang_term_coerce(v39)
        let v41 = "0"
        let v42 = erlang_term_coerce(v41)
        let v43 = "unicode"
        let v44 = atom.create(v43)
        let v45 = "characters_to_list"
        let v46 = atom.create(v45)
        let v47 = []
        let v48 = [v42, ..v47]
        let v49 = erlang_term_apply(v44, v46, v48)
        let v50 = "string"
        let v51 = atom.create(v50)
        let v52 = "pad"
        let v53 = atom.create(v52)
        let v54 = []
        let v55 = [v49, ..v54]
        let v56 = [v40, ..v55]
        let v57 = [v37, ..v56]
        let v58 = [v36, ..v57]
        let v59 = erlang_term_apply(v51, v53, v58)
        let v60 = atom.create(v17)
        let v61 = "iolist_to_binary"
        let v62 = atom.create(v61)
        let v63 = []
        let v64 = [v59, ..v63]
        let v65 = erlang_term_apply(v60, v62, v64)
        let v66 = erlang_term_coerce(v65)
        let v67 = { v66 } <> { "|" }
        let v68 = { v67 } <> { v33 }
        let v69 = erlang_term_coerce(v2)
        let v70 = erlang_term_coerce(v4)
        let v71 = erlang_term_coerce(v69)
        let v72 = atom.create(v7)
        let v73 = atom.create(v9)
        let v74 = []
        let v75 = [v71, ..v74]
        let v76 = [v0, ..v75]
        let v77 = [v70, ..v76]
        let v78 = erlang_term_apply(v72, v73, v77)
        let v79 = erlang_term_coerce(v78)
        let v80 = atom.create(v17)
        let v81 = atom.create(v19)
        let v82 = []
        let v83 = [v79, ..v82]
        let v84 = erlang_term_apply(v80, v81, v83)
        let v85 = erlang_term_coerce(v84)
        let v94 =
            case v85 {
                True -> {
                    erlang_term_coerce(v79)
                }
                False -> {
                    let v87 = atom.create(v17)
                    let v89 = atom.create("integer_to_binary")
                    let v90 = []
                    let v91 = [v79, ..v90]
                    let v92 = erlang_term_apply(v87, v89, v91)
                    erlang_term_coerce(v92)
                }
            }
        let v95 = spiral_string_length(v94)
        let v96 = int.to_string(v95)
        let v97 = erlang_term_coerce(v96)
        let v98 = erlang_term_coerce(10)
        let v99 = atom.create(v38)
        let v100 = erlang_term_coerce(v99)
        let v101 = erlang_term_coerce(v41)
        let v102 = atom.create(v43)
        let v103 = atom.create(v45)
        let v104 = []
        let v105 = [v101, ..v104]
        let v106 = erlang_term_apply(v102, v103, v105)
        let v107 = atom.create(v50)
        let v108 = atom.create(v52)
        let v109 = []
        let v110 = [v106, ..v109]
        let v111 = [v100, ..v110]
        let v112 = [v98, ..v111]
        let v113 = [v97, ..v112]
        let v114 = erlang_term_apply(v107, v108, v113)
        let v115 = atom.create(v17)
        let v116 = atom.create(v61)
        let v117 = []
        let v118 = [v114, ..v117]
        let v119 = erlang_term_apply(v115, v116, v118)
        let v120 = erlang_term_coerce(v119)
        let v121 = { v120 } <> { "|" }
        let v122 = { v121 } <> { v94 }
        let v123 = erlang_term_coerce(v68)
        let v124 = erlang_term_coerce(v122)
        let v125 = atom.create(v17)
        let v127 = atom.create(">=")
        let v128 = []
        let v129 = [v124, ..v128]
        let v130 = [v123, ..v129]
        let v131 = erlang_term_apply(v125, v127, v130)
        let v132 = erlang_term_coerce(v131)
        v132 == False
    }
}

pub fn closure171(capt: Nil) -> fn(Dynamic) -> fn(Dynamic) -> Bool {
    fn (v0) {
        closure172(#(v0))
    }
}

pub fn found_posts_654(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, v5: dict.Dict(String, Dynamic), _v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, _v12: Uh36, _v13: String, v14: String, v15: String, v16: String) -> Uh29 {
    let v17 = dict.keys(v5)
    let v18 = dictm_term_sorted(v17)
    let listm_fold = v18 |> list.fold (Uh3Nil, fn (acc, x) {
    let v20 = x
    let v21 = acc
    Uh3Cons(v20, v21)
    })
    let v23 = listm_fold
    let v25 = method4(v23, Uh3Nil)
    let v27 = method655(v5, v25, Uh29Nil)
    let v29 = method656(v14, v15, v16, v27, Uh29Nil)
    let v30 = closure171(Nil)
    sorted_by_577(v30, v29)
}

pub fn search_645(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Bool, v15: String) -> Dynamic {
    let v16 = search_terms_646(v15)
    let v17 =
        case v14 {
            True -> 30
            False -> 7
        }
    let v18 = window_start_649(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v17)
    let v20 = v15 == ""
    let v24 =
        case v20 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v15)
            }
        }
    let v25 = first_value_465("start_time", v24)
    let v26 = v25 == ""
    let v28 =
        case v26 {
            True -> {
                ""
            }
            False -> v25
        }
    let v29 = spiral_string_slice(v28, 0, 18)
    let v30 = v29 != ""
    let v44 =
        case v30 {
            True -> {
                case v14 {
                    True -> True
                    False -> {
                        let v31 = erlang_term_coerce(v18)
                        let v32 = erlang_term_coerce(v29)
                        let v34 = atom.create("erlang")
                        let v36 = atom.create(">=")
                        let v37 = []
                        let v38 = [v32, ..v37]
                        let v39 = [v31, ..v38]
                        let v40 = erlang_term_apply(v34, v36, v39)
                        let v41 = erlang_term_coerce(v40)
                        v41 == False
                    }
                }
            }
            False -> False
        }
    let v45 =
        case v44 {
            True -> v29
            False -> v18
        }
    let v46 = "conversation_id"
    let v47 = dict.has_key(v16, v46)
    let v62 =
        case v47 {
            True -> {
                let v48 = dict.get(v16, v46)
                let v49 = method258()
                let v50 = method259()
                let v51 = case v48 { Ok(x) -> v49(x) Error(x) -> v50(x) }
                let v56 =
                    case v51  {
                        Us56Error -> Us2None
                        Us56Ok(v52) -> Us2Some(v52)
                    }
                case v56  {
                    Us2None -> panic as "dict.present: the key is not in the dict"
                    Us2Some(v57) -> v57
                }
            }
            False -> {
                ""
            }
        }
    let v63 = "from"
    let v64 = dict.has_key(v16, v63)
    let v79 =
        case v64 {
            True -> {
                let v65 = dict.get(v16, v63)
                let v66 = method258()
                let v67 = method259()
                let v68 = case v65 { Ok(x) -> v66(x) Error(x) -> v67(x) }
                let v73 =
                    case v68  {
                        Us56Error -> Us2None
                        Us56Ok(v69) -> Us2Some(v69)
                    }
                case v73  {
                    Us2None -> panic as "dict.present: the key is not in the dict"
                    Us2Some(v74) -> v74
                }
            }
            False -> {
                ""
            }
        }
    let v80 = v79 |> string.lowercase
    let v81 = dict.has_key(v2, v80)
    let v128 =
        case v81 {
            True -> {
                let v82 = v79 |> string.lowercase
                let v83 = dict.get(v2, v82)
                let v84 = method547()
                let v85 = method548()
                let v86 = case v83 { Ok(x) -> v84(x) Error(x) -> v85(x) }
                let v91 =
                    case v86  {
                        Us111Error -> Us108None
                        Us111Ok(v87) -> Us108Some(v87)
                    }
                let v95 =
                    case v91  {
                        Us108None -> panic as "dict.present: the key is not in the dict"
                        Us108Some(v92) -> v92
                    }
                let v97 = erlang_term_coerce("")
                let v99 = erlang_term_coerce("id")
                let v100 = erlang_term_coerce(v97)
                let v102 = atom.create("maps")
                let v104 = atom.create("get")
                let v105 = []
                let v106 = [v100, ..v105]
                let v107 = [v95, ..v106]
                let v108 = [v99, ..v107]
                let v109 = erlang_term_apply(v102, v104, v108)
                let v110 = erlang_term_coerce(v109)
                let v111 = "erlang"
                let v112 = atom.create(v111)
                let v114 = atom.create("is_binary")
                let v115 = []
                let v116 = [v110, ..v115]
                let v117 = erlang_term_apply(v112, v114, v116)
                let v118 = erlang_term_coerce(v117)
                case v118 {
                    True -> {
                        erlang_term_coerce(v110)
                    }
                    False -> {
                        let v120 = atom.create(v111)
                        let v122 = atom.create("integer_to_binary")
                        let v123 = []
                        let v124 = [v110, ..v123]
                        let v125 = erlang_term_apply(v120, v122, v124)
                        erlang_term_coerce(v125)
                    }
                }
            }
            False -> v79
        }
    let v129 = v62 == ""
    case v129 {
        True -> {
            search_body_650(Uh29Nil, v15)
        }
        False -> {
            let v132 = found_posts_654(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v62, v128, v45)
            search_body_650(v132, v15)
        }
    }
}
