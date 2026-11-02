import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, Uh29Cons, Uh29Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us3None, Us3Some, Us72None, Us72Some, Us94Error, Us94Ok}
import xsim_frames/part1.{closure1, count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part13.{method300}
import xsim_frames/part28.{first_value_473, method465, method466, method470, method471, method480, sliced_479}
import xsim_frames/part29.{method487, method489, method490}
import xsim_frames/part31.{rendered_517}
import xsim_frames/part32.{expanded_505, method560}

pub fn method561(v0: Uh3, v1: Uh29) -> Uh29 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method561(v3, v1)
            let v5 = erlang_term_coerce(v2)
            let v6 = "Could not find post with ids: ["
            let v7 = v6 <> v2 
            let v8 = "]."
            let v9 = v7 <> v8 
            let v10 = erlang_term_coerce(v9)
            let v11 = "Not Found Error"
            let v12 = erlang_term_coerce(v11)
            let v13 = "title"
            let v14 = atom.create(v13)
            let v15 = erlang_term_coerce(v14)
            let v16 = []
            let v17 = [v12, ..v16]
            let v18 = [v15, ..v17]
            let v19 = erlang_term_tuple(v18)
            let v20 = "detail"
            let v21 = atom.create(v20)
            let v22 = erlang_term_coerce(v21)
            let v23 = []
            let v24 = [v10, ..v23]
            let v25 = [v22, ..v24]
            let v26 = erlang_term_tuple(v25)
            let v27 = "value"
            let v28 = atom.create(v27)
            let v29 = erlang_term_coerce(v28)
            let v30 = []
            let v31 = [v5, ..v30]
            let v32 = [v29, ..v31]
            let v33 = erlang_term_tuple(v32)
            let v34 = []
            let v35 = [v19, ..v34]
            let v36 = [v26, ..v35]
            let v37 = [v33, ..v36]
            let v38 = erlang_term_coerce(v37)
            let v39 = "maps"
            let v40 = atom.create(v39)
            let v41 = "from_list"
            let v42 = atom.create(v41)
            let v43 = []
            let v44 = [v38, ..v43]
            let v45 = erlang_term_apply(v40, v42, v44)
            Uh29Cons(v45, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn lookup_559(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String) -> Dynamic {
    let v13 = "ids"
    let v14 = v12 == ""
    let v18 =
        case v14 {
            True -> Uh3Nil
            False -> {
                let v16 = "&"
                split_list_2(v16, v12)
            }
        }
    let v19 = first_value_473(v13, v18)
    let v20 = v19 == ""
    let v24 =
        case v20 {
            True -> Uh3Nil
            False -> {
                let v22 = ","
                split_list_2(v22, v19)
            }
        }
    let v25 = Uh3Nil
    let v26 = method487(v24, v25)
    let v27 = "media.fields"
    let v31 =
        case v14 {
            True -> Uh3Nil
            False -> {
                let v29 = "&"
                split_list_2(v29, v12)
            }
        }
    let v32 = first_value_473(v27, v31)
    let v33 = v32 == ""
    let v37 =
        case v33 {
            True -> Uh3Nil
            False -> {
                let v35 = ","
                split_list_2(v35, v32)
            }
        }
    let v38 = Uh3Nil
    let v39 = method487(v37, v38)
    let v40 = "post.fields"
    let v44 =
        case v14 {
            True -> Uh3Nil
            False -> {
                let v42 = "&"
                split_list_2(v42, v12)
            }
        }
    let v45 = first_value_473(v40, v44)
    let v46 = v45 == ""
    let v50 =
        case v46 {
            True -> Uh3Nil
            False -> {
                let v48 = ","
                split_list_2(v48, v45)
            }
        }
    let v51 = Uh3Nil
    let v52 = method487(v50, v51)
    let v53 = "expansions"
    let v57 =
        case v14 {
            True -> Uh3Nil
            False -> {
                let v55 = "&"
                split_list_2(v55, v12)
            }
        }
    let v58 = first_value_473(v53, v57)
    let v59 = v58 == ""
    let v63 =
        case v59 {
            True -> Uh3Nil
            False -> {
                let v61 = ","
                split_list_2(v61, v58)
            }
        }
    let v64 = Uh3Nil
    let v65 = method487(v63, v64)
    let v66 = Uh3Nil
    let v67 = method489(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v26, v66)
    let v68 = Uh29Nil
    let v69 = method490(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v67, v68)
    let v70 = expanded_505(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v52, v65, v39, v69)
    let v71 = Uh3Nil
    let v72 = method560(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v26, v71)
    let v73 = Uh29Nil
    let v74 = method561(v72, v73)
    let v82 =
        case v74  {
            Uh29Nil -> Uh38Nil
            _ -> {
                let v76 = []
                let v77 = method300(v74, v76)
                let v78 = erlang_term_coerce(v77)
                let v79 = "errors"
                let v80 = Uh38Nil
                Uh38Cons(v79, v78, v80)
            }
        }
    let v83 = method465(v70, v82)
    let v84 = Uh29Nil
    let v85 = method466(v83, v84)
    let v86 = []
    let v87 = method300(v85, v86)
    let v88 = erlang_term_coerce(v87)
    let v89 = "maps"
    let v90 = atom.create(v89)
    let v91 = "from_list"
    let v92 = atom.create(v91)
    let v93 = []
    let v94 = [v88, ..v93]
    let v95 = erlang_term_apply(v90, v92, v94)
    v95
}

pub fn single_562(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, v5: dict.Dict(String, Dynamic), _v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, v12: String, v13: String) -> Dynamic {
    let v14 = dict.has_key(v5, v12)
    case v14 {
        True -> {
            let v15 = dict.get(v5, v12)
            let v16 = method470()
            let v17 = method471()
            let v18 = case v15 { Ok(x) -> v16(x) Error(x) -> v17(x) }
            let v23 =
                case v18  {
                    Us94Error -> Us72None
                    Us94Ok(v19) -> Us72Some(v19)
                }
            let v27 =
                case v23  {
                    Us72None -> panic as "dict.present: the key is not in the dict"
                    Us72Some(v24) -> v24
                }
            let v28 = "post.fields"
            let v29 = v13 == ""
            let v33 =
                case v29 {
                    True -> Uh3Nil
                    False -> {
                        let v31 = "&"
                        split_list_2(v31, v13)
                    }
                }
            let v34 = first_value_473(v28, v33)
            let v35 = v34 == ""
            let v39 =
                case v35 {
                    True -> Uh3Nil
                    False -> {
                        let v37 = ","
                        split_list_2(v37, v34)
                    }
                }
            let v40 = Uh3Nil
            let v41 = method487(v39, v40)
            let v42 = rendered_517(v27, v41)
            let v43 = "data"
            let v44 = atom.create(v43)
            let v45 = erlang_term_coerce(v44)
            let v46 = []
            let v47 = [v42, ..v46]
            let v48 = [v45, ..v47]
            let v49 = erlang_term_tuple(v48)
            let v50 = []
            let v51 = [v49, ..v50]
            let v52 = erlang_term_coerce(v51)
            let v53 = "maps"
            let v54 = atom.create(v53)
            let v55 = "from_list"
            let v56 = atom.create(v55)
            let v57 = []
            let v58 = [v52, ..v57]
            let v59 = erlang_term_apply(v54, v56, v58)
            v59
        }
        False -> {
            let v60 = erlang_term_coerce(v12)
            let v61 = "Could not find post with id: ["
            let v62 = v61 <> v12 
            let v63 = "]."
            let v64 = v62 <> v63 
            let v65 = erlang_term_coerce(v64)
            let v66 = "Not Found Error"
            let v67 = erlang_term_coerce(v66)
            let v68 = "post"
            let v69 = erlang_term_coerce(v68)
            let v70 = "id"
            let v71 = erlang_term_coerce(v70)
            let v72 = "parameter"
            let v73 = atom.create(v72)
            let v74 = erlang_term_coerce(v73)
            let v75 = []
            let v76 = [v71, ..v75]
            let v77 = [v74, ..v76]
            let v78 = erlang_term_tuple(v77)
            let v79 = "resource_type"
            let v80 = atom.create(v79)
            let v81 = erlang_term_coerce(v80)
            let v82 = []
            let v83 = [v69, ..v82]
            let v84 = [v81, ..v83]
            let v85 = erlang_term_tuple(v84)
            let v86 = "title"
            let v87 = atom.create(v86)
            let v88 = erlang_term_coerce(v87)
            let v89 = []
            let v90 = [v67, ..v89]
            let v91 = [v88, ..v90]
            let v92 = erlang_term_tuple(v91)
            let v93 = "detail"
            let v94 = atom.create(v93)
            let v95 = erlang_term_coerce(v94)
            let v96 = []
            let v97 = [v65, ..v96]
            let v98 = [v95, ..v97]
            let v99 = erlang_term_tuple(v98)
            let v100 = "value"
            let v101 = atom.create(v100)
            let v102 = erlang_term_coerce(v101)
            let v103 = []
            let v104 = [v60, ..v103]
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
            let v124 = "errors"
            let v125 = atom.create(v124)
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
            let v138 = erlang_term_apply(v134, v135, v137)
            v138
        }
    }
}

pub fn method565(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method565(v3, v1)
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

pub fn method566(v0: Uh3, v1: dict.Dict(String, String)) -> dict.Dict(String, String) {
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
            method566(v3, v26)
        }
        Uh3Nil -> v1
    }
}

pub fn search_terms_564(v0: String) -> dict.Dict(String, String) {
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
    let v7 = first_value_473(v1, v6)
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
    let v23 = method565(v21, v22)
    let v24 = dict.new()
    method566(v23, v24)
}

pub fn window_start_567(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, v12: Int) -> String {
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

pub fn method569(v0: String, v1: Uh29, v2: Uh29) -> Uh29 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method569(v0, v4, v2)
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
            let v12 = first_value_473(v6, v11)
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
            let v19 = method487(v17, v18)
            let v20 = rendered_517(v3, v19)
            Uh29Cons(v20, v5)
        }
        Uh29Nil -> v2
    }
}

pub fn method571(v0: Uh29, v1: Dynamic) -> Dynamic {
    case v0  {
        Uh29Cons(v2, v3) -> method571(v3, v2)
        Uh29Nil -> v1
    }
}

pub fn search_meta_570(v0: Uh29, v1: Int, v2: Bool) -> Dynamic {
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
    let v11 = method480(v0, v10)
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
                let v30 = method571(v0, v13)
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
                let v42 = "newest_id"
                let v43 = "oldest_id"
                let v44 = Uh38Nil
                let v45 = Uh38Cons(v43, v41, v44)
                Uh38Cons(v42, v29, v45)
            }
            Uh29Nil -> Uh38Nil
        }
    let v50 = Uh38Nil
    let v51 = method465(v9, v50)
    let v52 = method465(v49, v51)
    let v53 = Uh29Nil
    let v54 = method466(v52, v53)
    let v55 = "result_count"
    let v56 = atom.create(v55)
    let v57 = erlang_term_coerce(v56)
    let v58 = []
    let v59 = [v12, ..v58]
    let v60 = [v57, ..v59]
    let v61 = erlang_term_tuple(v60)
    let v62 = []
    let v63 = method300(v54, v62)
    let v64 = [v61, ..v63]
    let v65 = erlang_term_coerce(v64)
    let v66 = "maps"
    let v67 = atom.create(v66)
    let v68 = "from_list"
    let v69 = atom.create(v68)
    let v70 = []
    let v71 = [v65, ..v70]
    let v72 = erlang_term_apply(v67, v69, v71)
    v72
}

pub fn search_body_568(v0: Uh29, v1: String) -> Dynamic {
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
    let v8 = first_value_473(v2, v7)
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
    let v21 = first_value_473(v16, v20)
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
    let v29 = sliced_479(v15, v28, v0)
    let v30 = Uh29Nil
    let v31 = method569(v1, v29, v30)
    let v39 =
        case v31  {
            Uh29Nil -> Uh38Nil
            _ -> {
                let v33 = []
                let v34 = method300(v31, v33)
                let v35 = erlang_term_coerce(v34)
                let v36 = "data"
                let v37 = Uh38Nil
                Uh38Cons(v36, v35, v37)
            }
        }
    let v40 = spiral_wrap_signed(v15 + v28, 32)
    let v41 = 0
    let v42 = method480(v0, v41)
    let v43 = v40 < v42
    let v44 = search_meta_570(v29, v40, v43)
    let v45 = "meta"
    let v46 = Uh38Nil
    let v47 = Uh38Cons(v45, v44, v46)
    let v48 = method465(v39, v47)
    let v49 = Uh29Nil
    let v50 = method466(v48, v49)
    let v51 = []
    let v52 = method300(v50, v51)
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

pub fn method573(v0: dict.Dict(String, Dynamic), v1: Uh3, v2: Uh29) -> Uh29 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = dict.get(v0, v3)
            let v6 = method470()
            let v7 = method471()
            let v8 = case v5 { Ok(x) -> v6(x) Error(x) -> v7(x) }
            let v13 =
                case v8  {
                    Us94Error -> Us72None
                    Us94Ok(v9) -> Us72Some(v9)
                }
            let v17 =
                case v13  {
                    Us72None -> panic as "dict.present: the key is not in the dict"
                    Us72Some(v14) -> v14
                }
            let v18 = Uh29Cons(v17, v2)
            method573(v0, v4, v18)
        }
        Uh3Nil -> v2
    }
}

pub fn method574(v0: String, v1: String, v2: String, v3: Uh29, v4: Uh29) -> Uh29 {
    case v3  {
        Uh29Cons(v5, v6) -> {
            let v7 = method574(v0, v1, v2, v6, v4)
            let v8 = v1 == ""
            let v42 =
                case v8 {
                    True -> True
                    False -> {
                        let v9 = ""
                        let v10 = erlang_term_coerce(v9)
                        let v11 = "author_id"
                        let v12 = erlang_term_coerce(v11)
                        let v13 = erlang_term_coerce(v10)
                        let v14 = "maps"
                        let v15 = atom.create(v14)
                        let v16 = "get"
                        let v17 = atom.create(v16)
                        let v18 = []
                        let v19 = [v13, ..v18]
                        let v20 = [v5, ..v19]
                        let v21 = [v12, ..v20]
                        let v22 = erlang_term_apply(v15, v17, v21)
                        let v23 = erlang_term_coerce(v22)
                        let v24 = "erlang"
                        let v25 = atom.create(v24)
                        let v26 = "is_binary"
                        let v27 = atom.create(v26)
                        let v28 = []
                        let v29 = [v23, ..v28]
                        let v30 = erlang_term_apply(v25, v27, v29)
                        let v31 = erlang_term_coerce(v30)
                        let v40 =
                            case v31 {
                                True -> {
                                    let v32 = erlang_term_coerce(v23)
                                    v32
                                }
                                False -> {
                                    let v33 = atom.create(v24)
                                    let v34 = "integer_to_binary"
                                    let v35 = atom.create(v34)
                                    let v36 = []
                                    let v37 = [v23, ..v36]
                                    let v38 = erlang_term_apply(v33, v35, v37)
                                    let v39 = erlang_term_coerce(v38)
                                    v39
                                }
                            }
                        let v41 = v40 == v1
                        v41
                    }
                }
            let v43 = ""
            let v44 = erlang_term_coerce(v43)
            let v45 = "id"
            let v46 = erlang_term_coerce(v45)
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
            let v58 = "conversation_id"
            let v59 = erlang_term_coerce(v58)
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
            let v71 = "is_binary"
            let v72 = atom.create(v71)
            let v73 = []
            let v74 = [v68, ..v73]
            let v75 = erlang_term_apply(v70, v72, v74)
            let v76 = erlang_term_coerce(v75)
            let v85 =
                case v76 {
                    True -> {
                        let v77 = erlang_term_coerce(v68)
                        v77
                    }
                    False -> {
                        let v78 = atom.create(v69)
                        let v79 = "integer_to_binary"
                        let v80 = atom.create(v79)
                        let v81 = []
                        let v82 = [v68, ..v81]
                        let v83 = erlang_term_apply(v78, v80, v82)
                        let v84 = erlang_term_coerce(v83)
                        v84
                    }
                }
            let v86 = v85 == v0
            let v87 = v86 && v42
            let v112 =
                case v87 {
                    True -> {
                        let v88 = erlang_term_coerce(v43)
                        let v89 = "created_at"
                        let v90 = erlang_term_coerce(v89)
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
                        let v105 = ">="
                        let v106 = atom.create(v105)
                        let v107 = []
                        let v108 = [v103, ..v107]
                        let v109 = [v102, ..v108]
                        let v110 = erlang_term_apply(v104, v106, v109)
                        let v111 = erlang_term_coerce(v110)
                        v111
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
