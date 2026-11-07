import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Uh37, type Uh36, Uh29Cons, Uh29Nil, Uh37Cons, Uh37Nil, Uh3Cons, Uh3Nil, Us109Error, Us109Ok, Us110None, Us110Some, Us2None, Us2Some, Us3None, Us3Some}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, split_list_2}
import xsim_frames/part12.{items_from_301, method300}
import xsim_frames/part25.{first_value_465}
import xsim_frames/part27.{method537, method538, method542, method543, method551, sliced_550}
import xsim_frames/part28.{method558, timeline_fault_555}
import xsim_frames/part29.{closure157, method584, method585, method588, method589, sorted_by_572, timeline_posts_557}
import xsim_frames/part30.{includes_pairs_579, rendered_594}

pub fn data_item_623(v0: Uh3, v1: Uh3, _v2: Uh3, v3: Dynamic) -> Dynamic {
    let v4 = rendered_594(v3, v0)
    let v5 = method584()
    let v6 = method585(v5, v1)
    let v32 =
        case v6 {
            True -> {
                let v7 = []
                let v8 = erlang_term_coerce(v7)
                let v10 = erlang_term_coerce("refs")
                let v11 = erlang_term_coerce(v8)
                let v13 = atom.create("maps")
                let v15 = atom.create("get")
                let v16 = []
                let v17 = [v11, ..v16]
                let v18 = [v3, ..v17]
                let v19 = [v10, ..v18]
                let v20 = erlang_term_apply(v13, v15, v19)
                let v21 = erlang_term_coerce(v20)
                let v23 = atom.create("lists")
                let v25 = atom.create("reverse")
                let v26 = []
                let v27 = [v21, ..v26]
                let v28 = erlang_term_apply(v23, v25, v27)
                let v30 = items_from_301(v28, Uh29Nil)
                case v30  {
                    Uh29Nil -> False
                    _ -> True
                }
            }
            False -> False
        }
    case v32 {
        True -> {
            let v33 = []
            let v34 = erlang_term_coerce(v33)
            let v36 = erlang_term_coerce("refs")
            let v37 = erlang_term_coerce(v34)
            let v38 = "maps"
            let v39 = atom.create(v38)
            let v41 = atom.create("get")
            let v42 = []
            let v43 = [v37, ..v42]
            let v44 = [v3, ..v43]
            let v45 = [v36, ..v44]
            let v46 = erlang_term_apply(v39, v41, v45)
            let v47 = erlang_term_coerce(v46)
            let v49 = erlang_term_coerce("referenced_posts")
            let v50 = erlang_term_coerce(v47)
            let v51 = atom.create(v38)
            let v53 = atom.create("put")
            let v54 = []
            let v55 = [v4, ..v54]
            let v56 = [v50, ..v55]
            let v57 = [v49, ..v56]
            erlang_term_apply(v51, v53, v57)
        }
        False -> v4
    }
}

pub fn method622(v0: Uh3, v1: Uh3, v2: Uh3, v3: Uh29, v4: Uh29) -> Uh29 {
    case v3  {
        Uh29Cons(v5, v6) -> {
            let v7 = method622(v0, v1, v2, v6, v4)
            let v8 = data_item_623(v0, v1, v2, v5)
            Uh29Cons(v8, v7)
        }
        Uh29Nil -> v4
    }
}

pub fn expanded_578(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Uh3, v15: Uh3, v16: Uh3, v17: Uh29) -> Uh37 {
    let v18 = includes_pairs_579(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
    let v35 =
        case v18  {
            Uh37Nil -> Uh37Nil
            _ -> {
                let v21 = method538(v18, Uh29Nil)
                let v22 = []
                let v23 = method300(v21, v22)
                let v24 = erlang_term_coerce(v23)
                let v26 = atom.create("maps")
                let v28 = atom.create("from_list")
                let v29 = []
                let v30 = [v24, ..v29]
                let v31 = erlang_term_apply(v26, v28, v30)
                Uh37Cons("includes", v31, Uh37Nil)
            }
        }
    let v37 = method622(v14, v15, v16, v17, Uh29Nil)
    let v45 =
        case v37  {
            Uh29Nil -> Uh37Nil
            _ -> {
                let v39 = []
                let v40 = method300(v37, v39)
                let v41 = erlang_term_coerce(v40)
                Uh37Cons("data", v41, Uh37Nil)
            }
        }
    method537(v45, v35)
}

pub fn timeline_body_556(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Dynamic, v15: String, v16: Int) -> Dynamic {
    let v18 = timeline_posts_557(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15)
    let v19 = closure157(Nil)
    let v20 = sorted_by_572(v19, v18)
    let v21 = sliced_550(0, v16, v20)
    let v23 = v15 == ""
    let v27 =
        case v23 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v15)
            }
        }
    let v28 = first_value_465("post.fields", v27)
    let v29 = v28 == ""
    let v33 =
        case v29 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v28)
            }
        }
    let v35 = method558(v33, Uh3Nil)
    let v40 =
        case v23 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v15)
            }
        }
    let v41 = first_value_465("expansions", v40)
    let v42 = v41 == ""
    let v46 =
        case v42 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v41)
            }
        }
    let v48 = method558(v46, Uh3Nil)
    let v53 =
        case v23 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v15)
            }
        }
    let v54 = first_value_465("media.fields", v53)
    let v55 = v54 == ""
    let v59 =
        case v55 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v54)
            }
        }
    let v61 = method558(v59, Uh3Nil)
    let v62 = expanded_578(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v35, v48, v61, v21)
    let v64 = method551(v21, 0)
    let v65 = erlang_term_coerce(v64)
    let v67 = atom.create("result_count")
    let v68 = erlang_term_coerce(v67)
    let v69 = []
    let v70 = [v65, ..v69]
    let v71 = [v68, ..v70]
    let v72 = erlang_term_tuple(v71)
    let v73 = []
    let v74 = [v72, ..v73]
    let v75 = erlang_term_coerce(v74)
    let v76 = "maps"
    let v77 = atom.create(v76)
    let v78 = "from_list"
    let v79 = atom.create(v78)
    let v80 = []
    let v81 = [v75, ..v80]
    let v82 = erlang_term_apply(v77, v79, v81)
    let v85 = Uh37Cons("meta", v82, Uh37Nil)
    let v86 = method537(v62, v85)
    let v88 = method538(v86, Uh29Nil)
    let v89 = []
    let v90 = method300(v88, v89)
    let v91 = erlang_term_coerce(v90)
    let v92 = atom.create(v76)
    let v93 = atom.create(v78)
    let v94 = []
    let v95 = [v91, ..v94]
    erlang_term_apply(v92, v93, v95)
}

pub fn timeline_reply_554(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Dynamic, v15: String, v16: String) -> String {
    let v17 = timeline_fault_555(v14)
    case v17  {
        Us2None -> {
            let v19 = count_of_text_10(v16)
            let v22 =
                case v19  {
                    Us3None -> 0
                    Us3Some(v20) -> v20
                }
            let v23 = timeline_body_556(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v22)
            let v25 = atom.create("json")
            let v27 = atom.create("encode")
            let v28 = []
            let v29 = [v23, ..v28]
            let v30 = erlang_term_apply(v25, v27, v29)
            let v31 = "erlang"
            let v32 = atom.create(v31)
            let v34 = atom.create("iolist_to_binary")
            let v35 = []
            let v36 = [v30, ..v35]
            let v37 = erlang_term_apply(v32, v34, v36)
            let v38 = erlang_term_coerce(v37)
            let v39 = int.to_string(200)
            let v40 = { "HTTP/1.1 " } <> { v39 }
            let v41 = { v40 } <> { " " }
            let v42 = { v41 } <> { "OK" }
            let v43 = erlang_term_coerce(v38)
            let v44 = atom.create(v31)
            let v46 = atom.create("byte_size")
            let v47 = []
            let v48 = [v43, ..v47]
            let v49 = erlang_term_apply(v44, v46, v48)
            let v50 = erlang_term_coerce(v49)
            let v51 = int.to_string(v50)
            let v52 = { "\r\nContent-Length: " } <> { v51 }
            let v53 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v52 }
            let v54 = { v53 } <> { "\r\nConnection: close\r\n\r\n" }
            let v55 = { v42 } <> { v54 }
            let v56 = { v55 } <> { v38 }
            v56
        }
        Us2Some(v18) -> v18
    }
}

pub fn timeline_553(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Dynamic, v15: String) -> String {
    let v17 = v15 == ""
    let v21 =
        case v17 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v15)
            }
        }
    let v22 = first_value_465("max_results", v21)
    let v23 = v22 == ""
    let v25 =
        case v23 {
            True -> {
                "10"
            }
            False -> v22
        }
    let v26 = count_of_text_10(v25)
    let v32 =
        case v26  {
            Us3None -> False
            Us3Some(v27) -> {
                let v28 = v27 >= 5
                case v28 {
                    True -> {
                        v27 <= 100
                    }
                    False -> False
                }
            }
        }
    case v32 {
        True -> timeline_reply_554(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v25)
        False -> {
            let v34 = { "max_results must be 5..100, got " } <> { v25 }
            let v36 = erlang_term_coerce("Invalid Request")
            let v37 = erlang_term_coerce(v34)
            let v39 = erlang_term_coerce("about:blank")
            let v40 = erlang_term_coerce(400)
            let v42 = atom.create("status")
            let v43 = erlang_term_coerce(v42)
            let v44 = []
            let v45 = [v40, ..v44]
            let v46 = [v43, ..v45]
            let v47 = erlang_term_tuple(v46)
            let v49 = atom.create("type")
            let v50 = erlang_term_coerce(v49)
            let v51 = []
            let v52 = [v39, ..v51]
            let v53 = [v50, ..v52]
            let v54 = erlang_term_tuple(v53)
            let v56 = atom.create("detail")
            let v57 = erlang_term_coerce(v56)
            let v58 = []
            let v59 = [v37, ..v58]
            let v60 = [v57, ..v59]
            let v61 = erlang_term_tuple(v60)
            let v63 = atom.create("title")
            let v64 = erlang_term_coerce(v63)
            let v65 = []
            let v66 = [v36, ..v65]
            let v67 = [v64, ..v66]
            let v68 = erlang_term_tuple(v67)
            let v69 = []
            let v70 = [v47, ..v69]
            let v71 = [v54, ..v70]
            let v72 = [v61, ..v71]
            let v73 = [v68, ..v72]
            let v74 = erlang_term_coerce(v73)
            let v76 = atom.create("maps")
            let v78 = atom.create("from_list")
            let v79 = []
            let v80 = [v74, ..v79]
            let v81 = erlang_term_apply(v76, v78, v80)
            let v83 = atom.create("json")
            let v85 = atom.create("encode")
            let v86 = []
            let v87 = [v81, ..v86]
            let v88 = erlang_term_apply(v83, v85, v87)
            let v89 = "erlang"
            let v90 = atom.create(v89)
            let v92 = atom.create("iolist_to_binary")
            let v93 = []
            let v94 = [v88, ..v93]
            let v95 = erlang_term_apply(v90, v92, v94)
            let v96 = erlang_term_coerce(v95)
            let v97 = int.to_string(400)
            let v98 = { "HTTP/1.1 " } <> { v97 }
            let v99 = { v98 } <> { " " }
            let v100 = { v99 } <> { "Bad Request" }
            let v101 = erlang_term_coerce(v96)
            let v102 = atom.create(v89)
            let v104 = atom.create("byte_size")
            let v105 = []
            let v106 = [v101, ..v105]
            let v107 = erlang_term_apply(v102, v104, v106)
            let v108 = erlang_term_coerce(v107)
            let v109 = int.to_string(v108)
            let v110 = { "\r\nContent-Length: " } <> { v109 }
            let v111 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v110 }
            let v112 = { v111 } <> { "\r\nConnection: close\r\n\r\n" }
            let v113 = { v100 } <> { v112 }
            let v114 = { v113 } <> { v96 }
            v114
        }
    }
}

pub fn method627(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Uh3, v15: Uh3) -> Uh3 {
    case v14  {
        Uh3Cons(v16, v17) -> {
            let v18 = method627(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v17, v15)
            let v19 = v16 |> string.lowercase
            let v20 = dict.has_key(v2, v19)
            let v21 = v20 == False
            case v21 {
                True -> Uh3Cons(v16, v18)
                False -> v18
            }
        }
        Uh3Nil -> v15
    }
}

pub fn not_found_629(v0: String) -> Dynamic {
    let v2 = erlang_term_coerce("user")
    let v4 = erlang_term_coerce("usernames")
    let v6 = erlang_term_coerce("https://api.x.com/2/problems/resource-not-found")
    let v7 = erlang_term_coerce(v0)
    let v8 = { "Could not find user with usernames: [" } <> { v0 }
    let v9 = { v8 } <> { "]." }
    let v10 = erlang_term_coerce(v9)
    let v12 = erlang_term_coerce("Not Found Error")
    let v14 = atom.create("type")
    let v15 = erlang_term_coerce(v14)
    let v16 = []
    let v17 = [v6, ..v16]
    let v18 = [v15, ..v17]
    let v19 = erlang_term_tuple(v18)
    let v21 = atom.create("parameter")
    let v22 = erlang_term_coerce(v21)
    let v23 = []
    let v24 = [v4, ..v23]
    let v25 = [v22, ..v24]
    let v26 = erlang_term_tuple(v25)
    let v28 = atom.create("resource_type")
    let v29 = erlang_term_coerce(v28)
    let v30 = []
    let v31 = [v2, ..v30]
    let v32 = [v29, ..v31]
    let v33 = erlang_term_tuple(v32)
    let v35 = atom.create("title")
    let v36 = erlang_term_coerce(v35)
    let v37 = []
    let v38 = [v12, ..v37]
    let v39 = [v36, ..v38]
    let v40 = erlang_term_tuple(v39)
    let v42 = atom.create("detail")
    let v43 = erlang_term_coerce(v42)
    let v44 = []
    let v45 = [v10, ..v44]
    let v46 = [v43, ..v45]
    let v47 = erlang_term_tuple(v46)
    let v49 = atom.create("value")
    let v50 = erlang_term_coerce(v49)
    let v51 = []
    let v52 = [v7, ..v51]
    let v53 = [v50, ..v52]
    let v54 = erlang_term_tuple(v53)
    let v55 = []
    let v56 = [v19, ..v55]
    let v57 = [v26, ..v56]
    let v58 = [v33, ..v57]
    let v59 = [v40, ..v58]
    let v60 = [v47, ..v59]
    let v61 = [v54, ..v60]
    let v62 = erlang_term_coerce(v61)
    let v64 = atom.create("maps")
    let v66 = atom.create("from_list")
    let v67 = []
    let v68 = [v62, ..v67]
    erlang_term_apply(v64, v66, v68)
}

pub fn method628(v0: Uh3, v1: Uh29) -> Uh29 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method628(v3, v1)
            let v5 = not_found_629(v2)
            Uh29Cons(v5, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method630(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Uh3, v15: Uh3) -> Uh3 {
    case v14  {
        Uh3Cons(v16, v17) -> {
            let v18 = method630(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v17, v15)
            let v19 = v16 |> string.lowercase
            let v20 = dict.has_key(v2, v19)
            case v20 {
                True -> Uh3Cons(v16, v18)
                False -> v18
            }
        }
        Uh3Nil -> v15
    }
}

pub fn method631(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Uh3, v15: Uh29) -> Uh29 {
    case v14  {
        Uh3Cons(v16, v17) -> {
            let v18 = method631(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v17, v15)
            let v19 = v16 |> string.lowercase
            let v20 = dict.get(v2, v19)
            let v21 = method542()
            let v22 = method543()
            let v23 = case v20 { Ok(x) -> v21(x) Error(x) -> v22(x) }
            let v28 =
                case v23  {
                    Us109Error -> Us110None
                    Us109Ok(v24) -> Us110Some(v24)
                }
            let v32 =
                case v28  {
                    Us110None -> panic as "dict.present: the key is not in the dict"
                    Us110Some(v29) -> v29
                }
            let v33 = ""
            let v34 = erlang_term_coerce(v33)
            let v35 = "username"
            let v36 = erlang_term_coerce(v35)
            let v37 = erlang_term_coerce(v34)
            let v38 = "maps"
            let v39 = atom.create(v38)
            let v40 = "get"
            let v41 = atom.create(v40)
            let v42 = []
            let v43 = [v37, ..v42]
            let v44 = [v32, ..v43]
            let v45 = [v36, ..v44]
            let v46 = erlang_term_apply(v39, v41, v45)
            let v47 = erlang_term_coerce(v46)
            let v48 = erlang_term_coerce(v33)
            let v49 = "name"
            let v50 = erlang_term_coerce(v49)
            let v51 = erlang_term_coerce(v48)
            let v52 = atom.create(v38)
            let v53 = atom.create(v40)
            let v54 = []
            let v55 = [v51, ..v54]
            let v56 = [v32, ..v55]
            let v57 = [v50, ..v56]
            let v58 = erlang_term_apply(v52, v53, v57)
            let v59 = erlang_term_coerce(v58)
            let v60 = erlang_term_coerce(v33)
            let v61 = "id"
            let v62 = erlang_term_coerce(v61)
            let v63 = erlang_term_coerce(v60)
            let v64 = atom.create(v38)
            let v65 = atom.create(v40)
            let v66 = []
            let v67 = [v63, ..v66]
            let v68 = [v32, ..v67]
            let v69 = [v62, ..v68]
            let v70 = erlang_term_apply(v64, v65, v69)
            let v71 = erlang_term_coerce(v70)
            let v72 = atom.create(v35)
            let v73 = erlang_term_coerce(v72)
            let v74 = []
            let v75 = [v47, ..v74]
            let v76 = [v73, ..v75]
            let v77 = erlang_term_tuple(v76)
            let v78 = atom.create(v49)
            let v79 = erlang_term_coerce(v78)
            let v80 = []
            let v81 = [v59, ..v80]
            let v82 = [v79, ..v81]
            let v83 = erlang_term_tuple(v82)
            let v84 = atom.create(v61)
            let v85 = erlang_term_coerce(v84)
            let v86 = []
            let v87 = [v71, ..v86]
            let v88 = [v85, ..v87]
            let v89 = erlang_term_tuple(v88)
            let v90 = []
            let v91 = [v77, ..v90]
            let v92 = [v83, ..v91]
            let v93 = [v89, ..v92]
            let v94 = erlang_term_coerce(v93)
            let v95 = atom.create(v38)
            let v97 = atom.create("from_list")
            let v98 = []
            let v99 = [v94, ..v98]
            let v100 = erlang_term_apply(v95, v97, v99)
            Uh29Cons(v100, v18)
        }
        Uh3Nil -> v15
    }
}

pub fn users_by_626(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String) -> Dynamic {
    let v16 = v14 == ""
    let v20 =
        case v16 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v14)
            }
        }
    let v21 = first_value_465("usernames", v20)
    let v22 = v21 == ""
    let v26 =
        case v22 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v21)
            }
        }
    let v28 = method558(v26, Uh3Nil)
    let v30 = method627(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v28, Uh3Nil)
    let v32 = method628(v30, Uh29Nil)
    let v40 =
        case v32  {
            Uh29Nil -> Uh37Nil
            _ -> {
                let v34 = []
                let v35 = method300(v32, v34)
                let v36 = erlang_term_coerce(v35)
                Uh37Cons("errors", v36, Uh37Nil)
            }
        }
    let v42 = method630(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v28, Uh3Nil)
    let v44 = method631(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v42, Uh29Nil)
    let v52 =
        case v44  {
            Uh29Nil -> Uh37Nil
            _ -> {
                let v46 = []
                let v47 = method300(v44, v46)
                let v48 = erlang_term_coerce(v47)
                Uh37Cons("data", v48, Uh37Nil)
            }
        }
    let v53 = method537(v52, v40)
    let v55 = method538(v53, Uh29Nil)
    let v56 = []
    let v57 = method300(v55, v56)
    let v58 = erlang_term_coerce(v57)
    let v60 = atom.create("maps")
    let v62 = atom.create("from_list")
    let v63 = []
    let v64 = [v58, ..v63]
    erlang_term_apply(v60, v62, v64)
}

pub fn method633(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Uh3, v15: Uh3) -> Uh3 {
    case v14  {
        Uh3Cons(v16, v17) -> {
            let v18 = method633(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v17, v15)
            let v19 = dict.has_key(v3, v16)
            case v19 {
                True -> Uh3Cons(v16, v18)
                False -> v18
            }
        }
        Uh3Nil -> v15
    }
}

pub fn method634(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Uh3, v15: Uh29) -> Uh29 {
    case v14  {
        Uh3Cons(v16, v17) -> {
            let v18 = method634(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v17, v15)
            let v19 = dict.get(v3, v16)
            let v20 = method542()
            let v21 = method543()
            let v22 = case v19 { Ok(x) -> v20(x) Error(x) -> v21(x) }
            let v27 =
                case v22  {
                    Us109Error -> Us110None
                    Us109Ok(v23) -> Us110Some(v23)
                }
            let v31 =
                case v27  {
                    Us110None -> panic as "dict.present: the key is not in the dict"
                    Us110Some(v28) -> v28
                }
            let v32 = ""
            let v33 = erlang_term_coerce(v32)
            let v34 = "username"
            let v35 = erlang_term_coerce(v34)
            let v36 = erlang_term_coerce(v33)
            let v37 = "maps"
            let v38 = atom.create(v37)
            let v39 = "get"
            let v40 = atom.create(v39)
            let v41 = []
            let v42 = [v36, ..v41]
            let v43 = [v31, ..v42]
            let v44 = [v35, ..v43]
            let v45 = erlang_term_apply(v38, v40, v44)
            let v46 = erlang_term_coerce(v45)
            let v47 = erlang_term_coerce(v32)
            let v48 = "name"
            let v49 = erlang_term_coerce(v48)
            let v50 = erlang_term_coerce(v47)
            let v51 = atom.create(v37)
            let v52 = atom.create(v39)
            let v53 = []
            let v54 = [v50, ..v53]
            let v55 = [v31, ..v54]
            let v56 = [v49, ..v55]
            let v57 = erlang_term_apply(v51, v52, v56)
            let v58 = erlang_term_coerce(v57)
            let v59 = erlang_term_coerce(v32)
            let v60 = "id"
            let v61 = erlang_term_coerce(v60)
            let v62 = erlang_term_coerce(v59)
            let v63 = atom.create(v37)
            let v64 = atom.create(v39)
            let v65 = []
            let v66 = [v62, ..v65]
            let v67 = [v31, ..v66]
            let v68 = [v61, ..v67]
            let v69 = erlang_term_apply(v63, v64, v68)
            let v70 = erlang_term_coerce(v69)
            let v71 = atom.create(v34)
            let v72 = erlang_term_coerce(v71)
            let v73 = []
            let v74 = [v46, ..v73]
            let v75 = [v72, ..v74]
            let v76 = erlang_term_tuple(v75)
            let v77 = atom.create(v48)
            let v78 = erlang_term_coerce(v77)
            let v79 = []
            let v80 = [v58, ..v79]
            let v81 = [v78, ..v80]
            let v82 = erlang_term_tuple(v81)
            let v83 = atom.create(v60)
            let v84 = erlang_term_coerce(v83)
            let v85 = []
            let v86 = [v70, ..v85]
            let v87 = [v84, ..v86]
            let v88 = erlang_term_tuple(v87)
            let v89 = []
            let v90 = [v76, ..v89]
            let v91 = [v82, ..v90]
            let v92 = [v88, ..v91]
            let v93 = erlang_term_coerce(v92)
            let v94 = atom.create(v37)
            let v96 = atom.create("from_list")
            let v97 = []
            let v98 = [v93, ..v97]
            let v99 = erlang_term_apply(v94, v96, v98)
            Uh29Cons(v99, v18)
        }
        Uh3Nil -> v15
    }
}

pub fn users_by_ids_632(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String) -> Dynamic {
    let v16 = v14 == ""
    let v20 =
        case v16 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v14)
            }
        }
    let v21 = first_value_465("ids", v20)
    let v22 = v21 == ""
    let v26 =
        case v22 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v21)
            }
        }
    let v28 = method558(v26, Uh3Nil)
    let v30 = method633(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v28, Uh3Nil)
    let v32 = method634(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v30, Uh29Nil)
    let v33 = []
    let v34 = method300(v32, v33)
    let v35 = erlang_term_coerce(v34)
    let v37 = atom.create("data")
    let v38 = erlang_term_coerce(v37)
    let v39 = []
    let v40 = [v35, ..v39]
    let v41 = [v38, ..v40]
    let v42 = erlang_term_tuple(v41)
    let v43 = []
    let v44 = [v42, ..v43]
    let v45 = erlang_term_coerce(v44)
    let v47 = atom.create("maps")
    let v49 = atom.create("from_list")
    let v50 = []
    let v51 = [v45, ..v50]
    erlang_term_apply(v47, v49, v51)
}

pub fn users_reply_625(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, _v14: String, v15: String, v16: String, _v17: String, _v18: String) -> String {
    let v19 = v15 == "/2/users/by"
    let v22 =
        case v19 {
            True -> users_by_626(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v16)
            False -> users_by_ids_632(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v16)
        }
    let v24 = atom.create("json")
    let v26 = atom.create("encode")
    let v27 = []
    let v28 = [v22, ..v27]
    let v29 = erlang_term_apply(v24, v26, v28)
    let v30 = "erlang"
    let v31 = atom.create(v30)
    let v33 = atom.create("iolist_to_binary")
    let v34 = []
    let v35 = [v29, ..v34]
    let v36 = erlang_term_apply(v31, v33, v35)
    let v37 = erlang_term_coerce(v36)
    let v38 = int.to_string(200)
    let v39 = { "HTTP/1.1 " } <> { v38 }
    let v40 = { v39 } <> { " " }
    let v41 = { v40 } <> { "OK" }
    let v42 = erlang_term_coerce(v37)
    let v43 = atom.create(v30)
    let v45 = atom.create("byte_size")
    let v46 = []
    let v47 = [v42, ..v46]
    let v48 = erlang_term_apply(v43, v45, v47)
    let v49 = erlang_term_coerce(v48)
    let v50 = int.to_string(v49)
    let v51 = { "\r\nContent-Length: " } <> { v50 }
    let v52 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v51 }
    let v53 = { v52 } <> { "\r\nConnection: close\r\n\r\n" }
    let v54 = { v41 } <> { v53 }
    let v55 = { v54 } <> { v37 }
    v55
}

pub fn method637(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Uh3, v15: Uh3) -> Uh3 {
    case v14  {
        Uh3Cons(v16, v17) -> {
            let v18 = method637(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v17, v15)
            let v19 = dict.has_key(v5, v16)
            let v20 = v19 == False
            case v20 {
                True -> Uh3Cons(v16, v18)
                False -> v18
            }
        }
        Uh3Nil -> v15
    }
}

pub fn method638(v0: Uh3, v1: Uh29) -> Uh29 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method638(v3, v1)
            let v5 = erlang_term_coerce(v2)
            let v6 = { "Could not find post with ids: [" } <> { v2 }
            let v7 = { v6 } <> { "]." }
            let v8 = erlang_term_coerce(v7)
            let v10 = erlang_term_coerce("Not Found Error")
            let v12 = atom.create("title")
            let v13 = erlang_term_coerce(v12)
            let v14 = []
            let v15 = [v10, ..v14]
            let v16 = [v13, ..v15]
            let v17 = erlang_term_tuple(v16)
            let v19 = atom.create("detail")
            let v20 = erlang_term_coerce(v19)
            let v21 = []
            let v22 = [v8, ..v21]
            let v23 = [v20, ..v22]
            let v24 = erlang_term_tuple(v23)
            let v26 = atom.create("value")
            let v27 = erlang_term_coerce(v26)
            let v28 = []
            let v29 = [v5, ..v28]
            let v30 = [v27, ..v29]
            let v31 = erlang_term_tuple(v30)
            let v32 = []
            let v33 = [v17, ..v32]
            let v34 = [v24, ..v33]
            let v35 = [v31, ..v34]
            let v36 = erlang_term_coerce(v35)
            let v38 = atom.create("maps")
            let v40 = atom.create("from_list")
            let v41 = []
            let v42 = [v36, ..v41]
            let v43 = erlang_term_apply(v38, v40, v42)
            Uh29Cons(v43, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn lookup_636(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String) -> Dynamic {
    let v16 = v14 == ""
    let v20 =
        case v16 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v14)
            }
        }
    let v21 = first_value_465("ids", v20)
    let v22 = v21 == ""
    let v26 =
        case v22 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v21)
            }
        }
    let v28 = method558(v26, Uh3Nil)
    let v33 =
        case v16 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v14)
            }
        }
    let v34 = first_value_465("post.fields", v33)
    let v35 = v34 == ""
    let v39 =
        case v35 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v34)
            }
        }
    let v41 = method558(v39, Uh3Nil)
    let v46 =
        case v16 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v14)
            }
        }
    let v47 = first_value_465("expansions", v46)
    let v48 = v47 == ""
    let v52 =
        case v48 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v47)
            }
        }
    let v54 = method558(v52, Uh3Nil)
    let v59 =
        case v16 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v14)
            }
        }
    let v60 = first_value_465("media.fields", v59)
    let v61 = v60 == ""
    let v65 =
        case v61 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v60)
            }
        }
    let v67 = method558(v65, Uh3Nil)
    let v69 = method588(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v28, Uh3Nil)
    let v71 = method589(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v69, Uh29Nil)
    let v72 = expanded_578(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v41, v54, v67, v71)
    let v74 = method637(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v28, Uh3Nil)
    let v76 = method638(v74, Uh29Nil)
    let v84 =
        case v76  {
            Uh29Nil -> Uh37Nil
            _ -> {
                let v78 = []
                let v79 = method300(v76, v78)
                let v80 = erlang_term_coerce(v79)
                Uh37Cons("errors", v80, Uh37Nil)
            }
        }
    let v85 = method537(v72, v84)
    let v87 = method538(v85, Uh29Nil)
    let v88 = []
    let v89 = method300(v87, v88)
    let v90 = erlang_term_coerce(v89)
    let v92 = atom.create("maps")
    let v94 = atom.create("from_list")
    let v95 = []
    let v96 = [v90, ..v95]
    erlang_term_apply(v92, v94, v96)
}
