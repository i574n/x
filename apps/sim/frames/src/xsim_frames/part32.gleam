import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Uh37, type Uh36, Uh29Cons, Uh29Nil, Uh37Cons, Uh37Nil, Uh3Cons, Uh3Nil, Us108None, Us108Some, Us111Error, Us111Ok, Us2None, Us2Some, Us3None, Us3Some}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, split_list_2}
import xsim_frames/part12.{items_from_301, method300}
import xsim_frames/part25.{first_value_465}
import xsim_frames/part28.{method544, method545, method549, method550, method558, sliced_557}
import xsim_frames/part29.{method565, timeline_fault_562}
import xsim_frames/part30.{closure159, method591, method592, method595, method596, sorted_by_579, timeline_posts_564}
import xsim_frames/part31.{includes_pairs_586, rendered_601}

pub fn data_item_630(v0: Uh3, v1: Uh3, _v2: Uh3, v3: Dynamic) -> Dynamic {
    let v4 = rendered_601(v3, v0)
    let v5 = method591()
    let v6 = method592(v5, v1)
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

pub fn method629(v0: Uh3, v1: Uh3, v2: Uh3, v3: Uh29, v4: Uh29) -> Uh29 {
    case v3  {
        Uh29Cons(v5, v6) -> {
            let v7 = method629(v0, v1, v2, v6, v4)
            let v8 = data_item_630(v0, v1, v2, v5)
            Uh29Cons(v8, v7)
        }
        Uh29Nil -> v4
    }
}

pub fn expanded_585(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Uh3, v16: Uh3, v17: Uh3, v18: Uh29) -> Uh37 {
    let v19 = includes_pairs_586(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
    let v36 =
        case v19  {
            Uh37Nil -> Uh37Nil
            _ -> {
                let v22 = method545(v19, Uh29Nil)
                let v23 = []
                let v24 = method300(v22, v23)
                let v25 = erlang_term_coerce(v24)
                let v27 = atom.create("maps")
                let v29 = atom.create("from_list")
                let v30 = []
                let v31 = [v25, ..v30]
                let v32 = erlang_term_apply(v27, v29, v31)
                Uh37Cons("includes", v32, Uh37Nil)
            }
        }
    let v38 = method629(v15, v16, v17, v18, Uh29Nil)
    let v46 =
        case v38  {
            Uh29Nil -> Uh37Nil
            _ -> {
                let v40 = []
                let v41 = method300(v38, v40)
                let v42 = erlang_term_coerce(v41)
                Uh37Cons("data", v42, Uh37Nil)
            }
        }
    method544(v46, v36)
}

pub fn timeline_body_563(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Dynamic, v16: String, v17: Int) -> Dynamic {
    let v19 = timeline_posts_564(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
    let v20 = closure159(Nil)
    let v21 = sorted_by_579(v20, v19)
    let v22 = sliced_557(0, v17, v21)
    let v24 = v16 == ""
    let v28 =
        case v24 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v16)
            }
        }
    let v29 = first_value_465("post.fields", v28)
    let v30 = v29 == ""
    let v34 =
        case v30 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v29)
            }
        }
    let v36 = method565(v34, Uh3Nil)
    let v41 =
        case v24 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v16)
            }
        }
    let v42 = first_value_465("expansions", v41)
    let v43 = v42 == ""
    let v47 =
        case v43 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v42)
            }
        }
    let v49 = method565(v47, Uh3Nil)
    let v54 =
        case v24 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v16)
            }
        }
    let v55 = first_value_465("media.fields", v54)
    let v56 = v55 == ""
    let v60 =
        case v56 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v55)
            }
        }
    let v62 = method565(v60, Uh3Nil)
    let v63 = expanded_585(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v36, v49, v62, v22)
    let v65 = method558(v22, 0)
    let v66 = erlang_term_coerce(v65)
    let v68 = atom.create("result_count")
    let v69 = erlang_term_coerce(v68)
    let v70 = []
    let v71 = [v66, ..v70]
    let v72 = [v69, ..v71]
    let v73 = erlang_term_tuple(v72)
    let v74 = []
    let v75 = [v73, ..v74]
    let v76 = erlang_term_coerce(v75)
    let v77 = "maps"
    let v78 = atom.create(v77)
    let v79 = "from_list"
    let v80 = atom.create(v79)
    let v81 = []
    let v82 = [v76, ..v81]
    let v83 = erlang_term_apply(v78, v80, v82)
    let v86 = Uh37Cons("meta", v83, Uh37Nil)
    let v87 = method544(v63, v86)
    let v89 = method545(v87, Uh29Nil)
    let v90 = []
    let v91 = method300(v89, v90)
    let v92 = erlang_term_coerce(v91)
    let v93 = atom.create(v77)
    let v94 = atom.create(v79)
    let v95 = []
    let v96 = [v92, ..v95]
    erlang_term_apply(v93, v94, v96)
}

pub fn timeline_reply_561(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Dynamic, v16: String, v17: String) -> String {
    let v18 = timeline_fault_562(v15)
    case v18  {
        Us2None -> {
            let v20 = count_of_text_10(v17)
            let v23 =
                case v20  {
                    Us3None -> 0
                    Us3Some(v21) -> v21
                }
            let v24 = timeline_body_563(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v23)
            let v26 = atom.create("json")
            let v28 = atom.create("encode")
            let v29 = []
            let v30 = [v24, ..v29]
            let v31 = erlang_term_apply(v26, v28, v30)
            let v32 = "erlang"
            let v33 = atom.create(v32)
            let v35 = atom.create("iolist_to_binary")
            let v36 = []
            let v37 = [v31, ..v36]
            let v38 = erlang_term_apply(v33, v35, v37)
            let v39 = erlang_term_coerce(v38)
            let v40 = int.to_string(200)
            let v41 = { "HTTP/1.1 " } <> { v40 }
            let v42 = { v41 } <> { " " }
            let v43 = { v42 } <> { "OK" }
            let v44 = erlang_term_coerce(v39)
            let v45 = atom.create(v32)
            let v47 = atom.create("byte_size")
            let v48 = []
            let v49 = [v44, ..v48]
            let v50 = erlang_term_apply(v45, v47, v49)
            let v51 = erlang_term_coerce(v50)
            let v52 = int.to_string(v51)
            let v53 = { "\r\nContent-Length: " } <> { v52 }
            let v54 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v53 }
            let v55 = { v54 } <> { "\r\nConnection: close\r\n\r\n" }
            let v56 = { v43 } <> { v55 }
            let v57 = { v56 } <> { v39 }
            v57
        }
        Us2Some(v19) -> v19
    }
}

pub fn timeline_560(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Dynamic, v16: String) -> String {
    let v18 = v16 == ""
    let v22 =
        case v18 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v16)
            }
        }
    let v23 = first_value_465("max_results", v22)
    let v24 = v23 == ""
    let v26 =
        case v24 {
            True -> {
                "10"
            }
            False -> v23
        }
    let v27 = count_of_text_10(v26)
    let v33 =
        case v27  {
            Us3None -> False
            Us3Some(v28) -> {
                let v29 = v28 >= 5
                case v29 {
                    True -> {
                        v28 <= 100
                    }
                    False -> False
                }
            }
        }
    case v33 {
        True -> timeline_reply_561(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v26)
        False -> {
            let v35 = { "max_results must be 5..100, got " } <> { v26 }
            let v37 = erlang_term_coerce("Invalid Request")
            let v38 = erlang_term_coerce(v35)
            let v40 = erlang_term_coerce("about:blank")
            let v41 = erlang_term_coerce(400)
            let v43 = atom.create("status")
            let v44 = erlang_term_coerce(v43)
            let v45 = []
            let v46 = [v41, ..v45]
            let v47 = [v44, ..v46]
            let v48 = erlang_term_tuple(v47)
            let v50 = atom.create("type")
            let v51 = erlang_term_coerce(v50)
            let v52 = []
            let v53 = [v40, ..v52]
            let v54 = [v51, ..v53]
            let v55 = erlang_term_tuple(v54)
            let v57 = atom.create("detail")
            let v58 = erlang_term_coerce(v57)
            let v59 = []
            let v60 = [v38, ..v59]
            let v61 = [v58, ..v60]
            let v62 = erlang_term_tuple(v61)
            let v64 = atom.create("title")
            let v65 = erlang_term_coerce(v64)
            let v66 = []
            let v67 = [v37, ..v66]
            let v68 = [v65, ..v67]
            let v69 = erlang_term_tuple(v68)
            let v70 = []
            let v71 = [v48, ..v70]
            let v72 = [v55, ..v71]
            let v73 = [v62, ..v72]
            let v74 = [v69, ..v73]
            let v75 = erlang_term_coerce(v74)
            let v77 = atom.create("maps")
            let v79 = atom.create("from_list")
            let v80 = []
            let v81 = [v75, ..v80]
            let v82 = erlang_term_apply(v77, v79, v81)
            let v84 = atom.create("json")
            let v86 = atom.create("encode")
            let v87 = []
            let v88 = [v82, ..v87]
            let v89 = erlang_term_apply(v84, v86, v88)
            let v90 = "erlang"
            let v91 = atom.create(v90)
            let v93 = atom.create("iolist_to_binary")
            let v94 = []
            let v95 = [v89, ..v94]
            let v96 = erlang_term_apply(v91, v93, v95)
            let v97 = erlang_term_coerce(v96)
            let v98 = int.to_string(400)
            let v99 = { "HTTP/1.1 " } <> { v98 }
            let v100 = { v99 } <> { " " }
            let v101 = { v100 } <> { "Bad Request" }
            let v102 = erlang_term_coerce(v97)
            let v103 = atom.create(v90)
            let v105 = atom.create("byte_size")
            let v106 = []
            let v107 = [v102, ..v106]
            let v108 = erlang_term_apply(v103, v105, v107)
            let v109 = erlang_term_coerce(v108)
            let v110 = int.to_string(v109)
            let v111 = { "\r\nContent-Length: " } <> { v110 }
            let v112 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v111 }
            let v113 = { v112 } <> { "\r\nConnection: close\r\n\r\n" }
            let v114 = { v101 } <> { v113 }
            let v115 = { v114 } <> { v97 }
            v115
        }
    }
}

pub fn method634(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Uh3, v16: Uh3) -> Uh3 {
    case v15  {
        Uh3Cons(v17, v18) -> {
            let v19 = method634(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v18, v16)
            let v20 = v17 |> string.lowercase
            let v21 = dict.has_key(v2, v20)
            let v22 = v21 == False
            case v22 {
                True -> Uh3Cons(v17, v19)
                False -> v19
            }
        }
        Uh3Nil -> v16
    }
}

pub fn not_found_636(v0: String) -> Dynamic {
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

pub fn method635(v0: Uh3, v1: Uh29) -> Uh29 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method635(v3, v1)
            let v5 = not_found_636(v2)
            Uh29Cons(v5, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method637(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Uh3, v16: Uh3) -> Uh3 {
    case v15  {
        Uh3Cons(v17, v18) -> {
            let v19 = method637(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v18, v16)
            let v20 = v17 |> string.lowercase
            let v21 = dict.has_key(v2, v20)
            case v21 {
                True -> Uh3Cons(v17, v19)
                False -> v19
            }
        }
        Uh3Nil -> v16
    }
}

pub fn method638(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Uh3, v16: Uh29) -> Uh29 {
    case v15  {
        Uh3Cons(v17, v18) -> {
            let v19 = method638(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v18, v16)
            let v20 = v17 |> string.lowercase
            let v21 = dict.get(v2, v20)
            let v22 = method549()
            let v23 = method550()
            let v24 = case v21 { Ok(x) -> v22(x) Error(x) -> v23(x) }
            let v29 =
                case v24  {
                    Us111Error -> Us108None
                    Us111Ok(v25) -> Us108Some(v25)
                }
            let v33 =
                case v29  {
                    Us108None -> panic as "dict.present: the key is not in the dict"
                    Us108Some(v30) -> v30
                }
            let v34 = ""
            let v35 = erlang_term_coerce(v34)
            let v36 = "username"
            let v37 = erlang_term_coerce(v36)
            let v38 = erlang_term_coerce(v35)
            let v39 = "maps"
            let v40 = atom.create(v39)
            let v41 = "get"
            let v42 = atom.create(v41)
            let v43 = []
            let v44 = [v38, ..v43]
            let v45 = [v33, ..v44]
            let v46 = [v37, ..v45]
            let v47 = erlang_term_apply(v40, v42, v46)
            let v48 = erlang_term_coerce(v47)
            let v49 = erlang_term_coerce(v34)
            let v50 = "name"
            let v51 = erlang_term_coerce(v50)
            let v52 = erlang_term_coerce(v49)
            let v53 = atom.create(v39)
            let v54 = atom.create(v41)
            let v55 = []
            let v56 = [v52, ..v55]
            let v57 = [v33, ..v56]
            let v58 = [v51, ..v57]
            let v59 = erlang_term_apply(v53, v54, v58)
            let v60 = erlang_term_coerce(v59)
            let v61 = erlang_term_coerce(v34)
            let v62 = "id"
            let v63 = erlang_term_coerce(v62)
            let v64 = erlang_term_coerce(v61)
            let v65 = atom.create(v39)
            let v66 = atom.create(v41)
            let v67 = []
            let v68 = [v64, ..v67]
            let v69 = [v33, ..v68]
            let v70 = [v63, ..v69]
            let v71 = erlang_term_apply(v65, v66, v70)
            let v72 = erlang_term_coerce(v71)
            let v73 = atom.create(v36)
            let v74 = erlang_term_coerce(v73)
            let v75 = []
            let v76 = [v48, ..v75]
            let v77 = [v74, ..v76]
            let v78 = erlang_term_tuple(v77)
            let v79 = atom.create(v50)
            let v80 = erlang_term_coerce(v79)
            let v81 = []
            let v82 = [v60, ..v81]
            let v83 = [v80, ..v82]
            let v84 = erlang_term_tuple(v83)
            let v85 = atom.create(v62)
            let v86 = erlang_term_coerce(v85)
            let v87 = []
            let v88 = [v72, ..v87]
            let v89 = [v86, ..v88]
            let v90 = erlang_term_tuple(v89)
            let v91 = []
            let v92 = [v78, ..v91]
            let v93 = [v84, ..v92]
            let v94 = [v90, ..v93]
            let v95 = erlang_term_coerce(v94)
            let v96 = atom.create(v39)
            let v98 = atom.create("from_list")
            let v99 = []
            let v100 = [v95, ..v99]
            let v101 = erlang_term_apply(v96, v98, v100)
            Uh29Cons(v101, v19)
        }
        Uh3Nil -> v16
    }
}

pub fn users_by_633(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String) -> Dynamic {
    let v17 = v15 == ""
    let v21 =
        case v17 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v15)
            }
        }
    let v22 = first_value_465("usernames", v21)
    let v23 = v22 == ""
    let v27 =
        case v23 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v22)
            }
        }
    let v29 = method565(v27, Uh3Nil)
    let v31 = method634(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v29, Uh3Nil)
    let v33 = method635(v31, Uh29Nil)
    let v41 =
        case v33  {
            Uh29Nil -> Uh37Nil
            _ -> {
                let v35 = []
                let v36 = method300(v33, v35)
                let v37 = erlang_term_coerce(v36)
                Uh37Cons("errors", v37, Uh37Nil)
            }
        }
    let v43 = method637(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v29, Uh3Nil)
    let v45 = method638(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v43, Uh29Nil)
    let v53 =
        case v45  {
            Uh29Nil -> Uh37Nil
            _ -> {
                let v47 = []
                let v48 = method300(v45, v47)
                let v49 = erlang_term_coerce(v48)
                Uh37Cons("data", v49, Uh37Nil)
            }
        }
    let v54 = method544(v53, v41)
    let v56 = method545(v54, Uh29Nil)
    let v57 = []
    let v58 = method300(v56, v57)
    let v59 = erlang_term_coerce(v58)
    let v61 = atom.create("maps")
    let v63 = atom.create("from_list")
    let v64 = []
    let v65 = [v59, ..v64]
    erlang_term_apply(v61, v63, v65)
}

pub fn method640(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Uh3, v16: Uh3) -> Uh3 {
    case v15  {
        Uh3Cons(v17, v18) -> {
            let v19 = method640(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v18, v16)
            let v20 = dict.has_key(v3, v17)
            case v20 {
                True -> Uh3Cons(v17, v19)
                False -> v19
            }
        }
        Uh3Nil -> v16
    }
}

pub fn method641(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Uh3, v16: Uh29) -> Uh29 {
    case v15  {
        Uh3Cons(v17, v18) -> {
            let v19 = method641(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v18, v16)
            let v20 = dict.get(v3, v17)
            let v21 = method549()
            let v22 = method550()
            let v23 = case v20 { Ok(x) -> v21(x) Error(x) -> v22(x) }
            let v28 =
                case v23  {
                    Us111Error -> Us108None
                    Us111Ok(v24) -> Us108Some(v24)
                }
            let v32 =
                case v28  {
                    Us108None -> panic as "dict.present: the key is not in the dict"
                    Us108Some(v29) -> v29
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
            Uh29Cons(v100, v19)
        }
        Uh3Nil -> v16
    }
}

pub fn users_by_ids_639(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String) -> Dynamic {
    let v17 = v15 == ""
    let v21 =
        case v17 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v15)
            }
        }
    let v22 = first_value_465("ids", v21)
    let v23 = v22 == ""
    let v27 =
        case v23 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v22)
            }
        }
    let v29 = method565(v27, Uh3Nil)
    let v31 = method640(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v29, Uh3Nil)
    let v33 = method641(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v31, Uh29Nil)
    let v34 = []
    let v35 = method300(v33, v34)
    let v36 = erlang_term_coerce(v35)
    let v38 = atom.create("data")
    let v39 = erlang_term_coerce(v38)
    let v40 = []
    let v41 = [v36, ..v40]
    let v42 = [v39, ..v41]
    let v43 = erlang_term_tuple(v42)
    let v44 = []
    let v45 = [v43, ..v44]
    let v46 = erlang_term_coerce(v45)
    let v48 = atom.create("maps")
    let v50 = atom.create("from_list")
    let v51 = []
    let v52 = [v46, ..v51]
    erlang_term_apply(v48, v50, v52)
}

pub fn users_reply_632(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, _v15: String, v16: String, v17: String, _v18: String, _v19: String) -> String {
    let v20 = v16 == "/2/users/by"
    let v23 =
        case v20 {
            True -> users_by_633(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v17)
            False -> users_by_ids_639(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v17)
        }
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

pub fn method644(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Uh3, v16: Uh3) -> Uh3 {
    case v15  {
        Uh3Cons(v17, v18) -> {
            let v19 = method644(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v18, v16)
            let v20 = dict.has_key(v5, v17)
            let v21 = v20 == False
            case v21 {
                True -> Uh3Cons(v17, v19)
                False -> v19
            }
        }
        Uh3Nil -> v16
    }
}

pub fn method645(v0: Uh3, v1: Uh29) -> Uh29 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method645(v3, v1)
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

pub fn lookup_643(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String) -> Dynamic {
    let v17 = v15 == ""
    let v21 =
        case v17 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v15)
            }
        }
    let v22 = first_value_465("ids", v21)
    let v23 = v22 == ""
    let v27 =
        case v23 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v22)
            }
        }
    let v29 = method565(v27, Uh3Nil)
    let v34 =
        case v17 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v15)
            }
        }
    let v35 = first_value_465("post.fields", v34)
    let v36 = v35 == ""
    let v40 =
        case v36 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v35)
            }
        }
    let v42 = method565(v40, Uh3Nil)
    let v47 =
        case v17 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v15)
            }
        }
    let v48 = first_value_465("expansions", v47)
    let v49 = v48 == ""
    let v53 =
        case v49 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v48)
            }
        }
    let v55 = method565(v53, Uh3Nil)
    let v60 =
        case v17 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v15)
            }
        }
    let v61 = first_value_465("media.fields", v60)
    let v62 = v61 == ""
    let v66 =
        case v62 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v61)
            }
        }
    let v68 = method565(v66, Uh3Nil)
    let v70 = method595(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v29, Uh3Nil)
    let v72 = method596(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v70, Uh29Nil)
    let v73 = expanded_585(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v42, v55, v68, v72)
    let v75 = method644(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v29, Uh3Nil)
    let v77 = method645(v75, Uh29Nil)
    let v85 =
        case v77  {
            Uh29Nil -> Uh37Nil
            _ -> {
                let v79 = []
                let v80 = method300(v77, v79)
                let v81 = erlang_term_coerce(v80)
                Uh37Cons("errors", v81, Uh37Nil)
            }
        }
    let v86 = method544(v73, v85)
    let v88 = method545(v86, Uh29Nil)
    let v89 = []
    let v90 = method300(v88, v89)
    let v91 = erlang_term_coerce(v90)
    let v93 = atom.create("maps")
    let v95 = atom.create("from_list")
    let v96 = []
    let v97 = [v91, ..v96]
    erlang_term_apply(v93, v95, v97)
}
