import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Uh30, type Uh38, type Uh37, Uh30Cons, Uh30Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil, Us109Error, Us109Ok, Us110None, Us110Some, Us2None, Us2Some, Us3None, Us3Some}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, split_list_2}
import xsim_frames/part12.{items_from_303, method302}
import xsim_frames/part25.{first_value_467}
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
                let v30 = items_from_303(v28, Uh30Nil)
                case v30  {
                    Uh30Nil -> False
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

pub fn method622(v0: Uh3, v1: Uh3, v2: Uh3, v3: Uh30, v4: Uh30) -> Uh30 {
    case v3  {
        Uh30Cons(v5, v6) -> {
            let v7 = method622(v0, v1, v2, v6, v4)
            let v8 = data_item_623(v0, v1, v2, v5)
            Uh30Cons(v8, v7)
        }
        Uh30Nil -> v4
    }
}

pub fn expanded_578(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: Uh3, v14: Uh3, v15: Uh3, v16: Uh30) -> Uh38 {
    let v17 = includes_pairs_579(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
    let v34 =
        case v17  {
            Uh38Nil -> Uh38Nil
            _ -> {
                let v20 = method538(v17, Uh30Nil)
                let v21 = []
                let v22 = method302(v20, v21)
                let v23 = erlang_term_coerce(v22)
                let v25 = atom.create("maps")
                let v27 = atom.create("from_list")
                let v28 = []
                let v29 = [v23, ..v28]
                let v30 = erlang_term_apply(v25, v27, v29)
                Uh38Cons("includes", v30, Uh38Nil)
            }
        }
    let v36 = method622(v13, v14, v15, v16, Uh30Nil)
    let v44 =
        case v36  {
            Uh30Nil -> Uh38Nil
            _ -> {
                let v38 = []
                let v39 = method302(v36, v38)
                let v40 = erlang_term_coerce(v39)
                Uh38Cons("data", v40, Uh38Nil)
            }
        }
    method537(v44, v34)
}

pub fn timeline_body_556(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: Dynamic, v14: String, v15: Int) -> Dynamic {
    let v17 = timeline_posts_557(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    let v18 = closure157(Nil)
    let v19 = sorted_by_572(v18, v17)
    let v20 = sliced_550(0, v15, v19)
    let v22 = v14 == ""
    let v26 =
        case v22 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v14)
            }
        }
    let v27 = first_value_467("post.fields", v26)
    let v28 = v27 == ""
    let v32 =
        case v28 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v27)
            }
        }
    let v34 = method558(v32, Uh3Nil)
    let v39 =
        case v22 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v14)
            }
        }
    let v40 = first_value_467("expansions", v39)
    let v41 = v40 == ""
    let v45 =
        case v41 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v40)
            }
        }
    let v47 = method558(v45, Uh3Nil)
    let v52 =
        case v22 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v14)
            }
        }
    let v53 = first_value_467("media.fields", v52)
    let v54 = v53 == ""
    let v58 =
        case v54 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v53)
            }
        }
    let v60 = method558(v58, Uh3Nil)
    let v61 = expanded_578(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v34, v47, v60, v20)
    let v63 = method551(v20, 0)
    let v64 = erlang_term_coerce(v63)
    let v66 = atom.create("result_count")
    let v67 = erlang_term_coerce(v66)
    let v68 = []
    let v69 = [v64, ..v68]
    let v70 = [v67, ..v69]
    let v71 = erlang_term_tuple(v70)
    let v72 = []
    let v73 = [v71, ..v72]
    let v74 = erlang_term_coerce(v73)
    let v75 = "maps"
    let v76 = atom.create(v75)
    let v77 = "from_list"
    let v78 = atom.create(v77)
    let v79 = []
    let v80 = [v74, ..v79]
    let v81 = erlang_term_apply(v76, v78, v80)
    let v84 = Uh38Cons("meta", v81, Uh38Nil)
    let v85 = method537(v61, v84)
    let v87 = method538(v85, Uh30Nil)
    let v88 = []
    let v89 = method302(v87, v88)
    let v90 = erlang_term_coerce(v89)
    let v91 = atom.create(v75)
    let v92 = atom.create(v77)
    let v93 = []
    let v94 = [v90, ..v93]
    erlang_term_apply(v91, v92, v94)
}

pub fn timeline_reply_554(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: Dynamic, v14: String, v15: String) -> String {
    let v16 = timeline_fault_555(v13)
    case v16  {
        Us2None -> {
            let v18 = count_of_text_10(v15)
            let v21 =
                case v18  {
                    Us3None -> 0
                    Us3Some(v19) -> v19
                }
            let v22 = timeline_body_556(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v21)
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
        Us2Some(v17) -> v17
    }
}

pub fn timeline_553(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: Dynamic, v14: String) -> String {
    let v16 = v14 == ""
    let v20 =
        case v16 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v14)
            }
        }
    let v21 = first_value_467("max_results", v20)
    let v22 = v21 == ""
    let v24 =
        case v22 {
            True -> {
                "10"
            }
            False -> v21
        }
    let v25 = count_of_text_10(v24)
    let v31 =
        case v25  {
            Us3None -> False
            Us3Some(v26) -> {
                let v27 = v26 >= 5
                case v27 {
                    True -> {
                        v26 <= 100
                    }
                    False -> False
                }
            }
        }
    case v31 {
        True -> timeline_reply_554(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v24)
        False -> {
            let v33 = { "max_results must be 5..100, got " } <> { v24 }
            let v35 = erlang_term_coerce("Invalid Request")
            let v36 = erlang_term_coerce(v33)
            let v38 = erlang_term_coerce("about:blank")
            let v39 = erlang_term_coerce(400)
            let v41 = atom.create("status")
            let v42 = erlang_term_coerce(v41)
            let v43 = []
            let v44 = [v39, ..v43]
            let v45 = [v42, ..v44]
            let v46 = erlang_term_tuple(v45)
            let v48 = atom.create("type")
            let v49 = erlang_term_coerce(v48)
            let v50 = []
            let v51 = [v38, ..v50]
            let v52 = [v49, ..v51]
            let v53 = erlang_term_tuple(v52)
            let v55 = atom.create("detail")
            let v56 = erlang_term_coerce(v55)
            let v57 = []
            let v58 = [v36, ..v57]
            let v59 = [v56, ..v58]
            let v60 = erlang_term_tuple(v59)
            let v62 = atom.create("title")
            let v63 = erlang_term_coerce(v62)
            let v64 = []
            let v65 = [v35, ..v64]
            let v66 = [v63, ..v65]
            let v67 = erlang_term_tuple(v66)
            let v68 = []
            let v69 = [v46, ..v68]
            let v70 = [v53, ..v69]
            let v71 = [v60, ..v70]
            let v72 = [v67, ..v71]
            let v73 = erlang_term_coerce(v72)
            let v75 = atom.create("maps")
            let v77 = atom.create("from_list")
            let v78 = []
            let v79 = [v73, ..v78]
            let v80 = erlang_term_apply(v75, v77, v79)
            let v82 = atom.create("json")
            let v84 = atom.create("encode")
            let v85 = []
            let v86 = [v80, ..v85]
            let v87 = erlang_term_apply(v82, v84, v86)
            let v88 = "erlang"
            let v89 = atom.create(v88)
            let v91 = atom.create("iolist_to_binary")
            let v92 = []
            let v93 = [v87, ..v92]
            let v94 = erlang_term_apply(v89, v91, v93)
            let v95 = erlang_term_coerce(v94)
            let v96 = int.to_string(400)
            let v97 = { "HTTP/1.1 " } <> { v96 }
            let v98 = { v97 } <> { " " }
            let v99 = { v98 } <> { "Bad Request" }
            let v100 = erlang_term_coerce(v95)
            let v101 = atom.create(v88)
            let v103 = atom.create("byte_size")
            let v104 = []
            let v105 = [v100, ..v104]
            let v106 = erlang_term_apply(v101, v103, v105)
            let v107 = erlang_term_coerce(v106)
            let v108 = int.to_string(v107)
            let v109 = { "\r\nContent-Length: " } <> { v108 }
            let v110 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v109 }
            let v111 = { v110 } <> { "\r\nConnection: close\r\n\r\n" }
            let v112 = { v99 } <> { v111 }
            let v113 = { v112 } <> { v95 }
            v113
        }
    }
}

pub fn method627(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: Uh3, v14: Uh3) -> Uh3 {
    case v13  {
        Uh3Cons(v15, v16) -> {
            let v17 = method627(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v16, v14)
            let v18 = v15 |> string.lowercase
            let v19 = dict.has_key(v2, v18)
            let v20 = v19 == False
            case v20 {
                True -> Uh3Cons(v15, v17)
                False -> v17
            }
        }
        Uh3Nil -> v14
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

pub fn method628(v0: Uh3, v1: Uh30) -> Uh30 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method628(v3, v1)
            let v5 = not_found_629(v2)
            Uh30Cons(v5, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method630(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: Uh3, v14: Uh3) -> Uh3 {
    case v13  {
        Uh3Cons(v15, v16) -> {
            let v17 = method630(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v16, v14)
            let v18 = v15 |> string.lowercase
            let v19 = dict.has_key(v2, v18)
            case v19 {
                True -> Uh3Cons(v15, v17)
                False -> v17
            }
        }
        Uh3Nil -> v14
    }
}

pub fn method631(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: Uh3, v14: Uh30) -> Uh30 {
    case v13  {
        Uh3Cons(v15, v16) -> {
            let v17 = method631(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v16, v14)
            let v18 = v15 |> string.lowercase
            let v19 = dict.get(v2, v18)
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
            Uh30Cons(v99, v17)
        }
        Uh3Nil -> v14
    }
}

pub fn users_by_626(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String) -> Dynamic {
    let v15 = v13 == ""
    let v19 =
        case v15 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v13)
            }
        }
    let v20 = first_value_467("usernames", v19)
    let v21 = v20 == ""
    let v25 =
        case v21 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v20)
            }
        }
    let v27 = method558(v25, Uh3Nil)
    let v29 = method627(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v27, Uh3Nil)
    let v31 = method628(v29, Uh30Nil)
    let v39 =
        case v31  {
            Uh30Nil -> Uh38Nil
            _ -> {
                let v33 = []
                let v34 = method302(v31, v33)
                let v35 = erlang_term_coerce(v34)
                Uh38Cons("errors", v35, Uh38Nil)
            }
        }
    let v41 = method630(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v27, Uh3Nil)
    let v43 = method631(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v41, Uh30Nil)
    let v51 =
        case v43  {
            Uh30Nil -> Uh38Nil
            _ -> {
                let v45 = []
                let v46 = method302(v43, v45)
                let v47 = erlang_term_coerce(v46)
                Uh38Cons("data", v47, Uh38Nil)
            }
        }
    let v52 = method537(v51, v39)
    let v54 = method538(v52, Uh30Nil)
    let v55 = []
    let v56 = method302(v54, v55)
    let v57 = erlang_term_coerce(v56)
    let v59 = atom.create("maps")
    let v61 = atom.create("from_list")
    let v62 = []
    let v63 = [v57, ..v62]
    erlang_term_apply(v59, v61, v63)
}

pub fn method633(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: Uh3, v14: Uh3) -> Uh3 {
    case v13  {
        Uh3Cons(v15, v16) -> {
            let v17 = method633(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v16, v14)
            let v18 = dict.has_key(v3, v15)
            case v18 {
                True -> Uh3Cons(v15, v17)
                False -> v17
            }
        }
        Uh3Nil -> v14
    }
}

pub fn method634(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: Uh3, v14: Uh30) -> Uh30 {
    case v13  {
        Uh3Cons(v15, v16) -> {
            let v17 = method634(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v16, v14)
            let v18 = dict.get(v3, v15)
            let v19 = method542()
            let v20 = method543()
            let v21 = case v18 { Ok(x) -> v19(x) Error(x) -> v20(x) }
            let v26 =
                case v21  {
                    Us109Error -> Us110None
                    Us109Ok(v22) -> Us110Some(v22)
                }
            let v30 =
                case v26  {
                    Us110None -> panic as "dict.present: the key is not in the dict"
                    Us110Some(v27) -> v27
                }
            let v31 = ""
            let v32 = erlang_term_coerce(v31)
            let v33 = "username"
            let v34 = erlang_term_coerce(v33)
            let v35 = erlang_term_coerce(v32)
            let v36 = "maps"
            let v37 = atom.create(v36)
            let v38 = "get"
            let v39 = atom.create(v38)
            let v40 = []
            let v41 = [v35, ..v40]
            let v42 = [v30, ..v41]
            let v43 = [v34, ..v42]
            let v44 = erlang_term_apply(v37, v39, v43)
            let v45 = erlang_term_coerce(v44)
            let v46 = erlang_term_coerce(v31)
            let v47 = "name"
            let v48 = erlang_term_coerce(v47)
            let v49 = erlang_term_coerce(v46)
            let v50 = atom.create(v36)
            let v51 = atom.create(v38)
            let v52 = []
            let v53 = [v49, ..v52]
            let v54 = [v30, ..v53]
            let v55 = [v48, ..v54]
            let v56 = erlang_term_apply(v50, v51, v55)
            let v57 = erlang_term_coerce(v56)
            let v58 = erlang_term_coerce(v31)
            let v59 = "id"
            let v60 = erlang_term_coerce(v59)
            let v61 = erlang_term_coerce(v58)
            let v62 = atom.create(v36)
            let v63 = atom.create(v38)
            let v64 = []
            let v65 = [v61, ..v64]
            let v66 = [v30, ..v65]
            let v67 = [v60, ..v66]
            let v68 = erlang_term_apply(v62, v63, v67)
            let v69 = erlang_term_coerce(v68)
            let v70 = atom.create(v33)
            let v71 = erlang_term_coerce(v70)
            let v72 = []
            let v73 = [v45, ..v72]
            let v74 = [v71, ..v73]
            let v75 = erlang_term_tuple(v74)
            let v76 = atom.create(v47)
            let v77 = erlang_term_coerce(v76)
            let v78 = []
            let v79 = [v57, ..v78]
            let v80 = [v77, ..v79]
            let v81 = erlang_term_tuple(v80)
            let v82 = atom.create(v59)
            let v83 = erlang_term_coerce(v82)
            let v84 = []
            let v85 = [v69, ..v84]
            let v86 = [v83, ..v85]
            let v87 = erlang_term_tuple(v86)
            let v88 = []
            let v89 = [v75, ..v88]
            let v90 = [v81, ..v89]
            let v91 = [v87, ..v90]
            let v92 = erlang_term_coerce(v91)
            let v93 = atom.create(v36)
            let v95 = atom.create("from_list")
            let v96 = []
            let v97 = [v92, ..v96]
            let v98 = erlang_term_apply(v93, v95, v97)
            Uh30Cons(v98, v17)
        }
        Uh3Nil -> v14
    }
}

pub fn users_by_ids_632(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String) -> Dynamic {
    let v15 = v13 == ""
    let v19 =
        case v15 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v13)
            }
        }
    let v20 = first_value_467("ids", v19)
    let v21 = v20 == ""
    let v25 =
        case v21 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v20)
            }
        }
    let v27 = method558(v25, Uh3Nil)
    let v29 = method633(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v27, Uh3Nil)
    let v31 = method634(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v29, Uh30Nil)
    let v32 = []
    let v33 = method302(v31, v32)
    let v34 = erlang_term_coerce(v33)
    let v36 = atom.create("data")
    let v37 = erlang_term_coerce(v36)
    let v38 = []
    let v39 = [v34, ..v38]
    let v40 = [v37, ..v39]
    let v41 = erlang_term_tuple(v40)
    let v42 = []
    let v43 = [v41, ..v42]
    let v44 = erlang_term_coerce(v43)
    let v46 = atom.create("maps")
    let v48 = atom.create("from_list")
    let v49 = []
    let v50 = [v44, ..v49]
    erlang_term_apply(v46, v48, v50)
}

pub fn users_reply_625(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, _v13: String, v14: String, v15: String, _v16: String, _v17: String) -> String {
    let v18 = v14 == "/2/users/by"
    let v21 =
        case v18 {
            True -> users_by_626(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v15)
            False -> users_by_ids_632(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v15)
        }
    let v23 = atom.create("json")
    let v25 = atom.create("encode")
    let v26 = []
    let v27 = [v21, ..v26]
    let v28 = erlang_term_apply(v23, v25, v27)
    let v29 = "erlang"
    let v30 = atom.create(v29)
    let v32 = atom.create("iolist_to_binary")
    let v33 = []
    let v34 = [v28, ..v33]
    let v35 = erlang_term_apply(v30, v32, v34)
    let v36 = erlang_term_coerce(v35)
    let v37 = int.to_string(200)
    let v38 = { "HTTP/1.1 " } <> { v37 }
    let v39 = { v38 } <> { " " }
    let v40 = { v39 } <> { "OK" }
    let v41 = erlang_term_coerce(v36)
    let v42 = atom.create(v29)
    let v44 = atom.create("byte_size")
    let v45 = []
    let v46 = [v41, ..v45]
    let v47 = erlang_term_apply(v42, v44, v46)
    let v48 = erlang_term_coerce(v47)
    let v49 = int.to_string(v48)
    let v50 = { "\r\nContent-Length: " } <> { v49 }
    let v51 = { "\r\nContent-Type: application/json; charset=utf-8" } <> { v50 }
    let v52 = { v51 } <> { "\r\nConnection: close\r\n\r\n" }
    let v53 = { v40 } <> { v52 }
    let v54 = { v53 } <> { v36 }
    v54
}

pub fn method637(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: Uh3, v14: Uh3) -> Uh3 {
    case v13  {
        Uh3Cons(v15, v16) -> {
            let v17 = method637(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v16, v14)
            let v18 = dict.has_key(v5, v15)
            let v19 = v18 == False
            case v19 {
                True -> Uh3Cons(v15, v17)
                False -> v17
            }
        }
        Uh3Nil -> v14
    }
}

pub fn method638(v0: Uh3, v1: Uh30) -> Uh30 {
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
            Uh30Cons(v43, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn lookup_636(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String) -> Dynamic {
    let v15 = v13 == ""
    let v19 =
        case v15 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v13)
            }
        }
    let v20 = first_value_467("ids", v19)
    let v21 = v20 == ""
    let v25 =
        case v21 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v20)
            }
        }
    let v27 = method558(v25, Uh3Nil)
    let v32 =
        case v15 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v13)
            }
        }
    let v33 = first_value_467("post.fields", v32)
    let v34 = v33 == ""
    let v38 =
        case v34 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v33)
            }
        }
    let v40 = method558(v38, Uh3Nil)
    let v45 =
        case v15 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v13)
            }
        }
    let v46 = first_value_467("expansions", v45)
    let v47 = v46 == ""
    let v51 =
        case v47 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v46)
            }
        }
    let v53 = method558(v51, Uh3Nil)
    let v58 =
        case v15 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v13)
            }
        }
    let v59 = first_value_467("media.fields", v58)
    let v60 = v59 == ""
    let v64 =
        case v60 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v59)
            }
        }
    let v66 = method558(v64, Uh3Nil)
    let v68 = method588(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v27, Uh3Nil)
    let v70 = method589(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v68, Uh30Nil)
    let v71 = expanded_578(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v40, v53, v66, v70)
    let v73 = method637(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v27, Uh3Nil)
    let v75 = method638(v73, Uh30Nil)
    let v83 =
        case v75  {
            Uh30Nil -> Uh38Nil
            _ -> {
                let v77 = []
                let v78 = method302(v75, v77)
                let v79 = erlang_term_coerce(v78)
                Uh38Cons("errors", v79, Uh38Nil)
            }
        }
    let v84 = method537(v71, v83)
    let v86 = method538(v84, Uh30Nil)
    let v87 = []
    let v88 = method302(v86, v87)
    let v89 = erlang_term_coerce(v88)
    let v91 = atom.create("maps")
    let v93 = atom.create("from_list")
    let v94 = []
    let v95 = [v89, ..v94]
    erlang_term_apply(v91, v93, v95)
}
