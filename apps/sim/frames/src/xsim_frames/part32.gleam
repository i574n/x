import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Uh38, Uh29Cons, Uh29Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us3None, Us3Some, Us72None, Us72Some, Us94Error, Us94Ok}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, split_list_2}
import xsim_frames/part13.{method301}
import xsim_frames/part27.{items_from_444}
import xsim_frames/part28.{first_value_474, method466, method467, method471, method472, method481, sliced_480}
import xsim_frames/part29.{method488, timeline_fault_485}
import xsim_frames/part30.{method504, method512, method513, timeline_posts_487}
import xsim_frames/part31.{includes_pairs_507, rendered_518}

pub fn data_item_547(v0: Uh3, v1: Uh3, _v2: Uh3, v3: Dynamic) -> Dynamic {
    let v4 = rendered_518(v3, v0)
    let v5 = method512()
    let v6 = method513(v5, v1)
    let v32 =
        case v6 {
            True -> {
                let v7 = []
                let v8 = erlang_term_coerce(v7)
                let v9 = "refs"
                let v10 = erlang_term_coerce(v9)
                let v11 = erlang_term_coerce(v8)
                let v12 = "maps"
                let v13 = atom.create(v12)
                let v14 = "get"
                let v15 = atom.create(v14)
                let v16 = []
                let v17 = [v11, ..v16]
                let v18 = [v3, ..v17]
                let v19 = [v10, ..v18]
                let v20 = erlang_term_apply(v13, v15, v19)
                let v21 = erlang_term_coerce(v20)
                let v22 = "lists"
                let v23 = atom.create(v22)
                let v24 = "reverse"
                let v25 = atom.create(v24)
                let v26 = []
                let v27 = [v21, ..v26]
                let v28 = erlang_term_apply(v23, v25, v27)
                let v29 = Uh29Nil
                let v30 = items_from_444(v28, v29)
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
            let v35 = "refs"
            let v36 = erlang_term_coerce(v35)
            let v37 = erlang_term_coerce(v34)
            let v38 = "maps"
            let v39 = atom.create(v38)
            let v40 = "get"
            let v41 = atom.create(v40)
            let v42 = []
            let v43 = [v37, ..v42]
            let v44 = [v3, ..v43]
            let v45 = [v36, ..v44]
            let v46 = erlang_term_apply(v39, v41, v45)
            let v47 = erlang_term_coerce(v46)
            let v48 = "referenced_posts"
            let v49 = erlang_term_coerce(v48)
            let v50 = erlang_term_coerce(v47)
            let v51 = atom.create(v38)
            let v52 = "put"
            let v53 = atom.create(v52)
            let v54 = []
            let v55 = [v4, ..v54]
            let v56 = [v50, ..v55]
            let v57 = [v49, ..v56]
            let v58 = erlang_term_apply(v51, v53, v57)
            v58
        }
        False -> v4
    }
}

pub fn method546(v0: Uh3, v1: Uh3, v2: Uh3, v3: Uh29, v4: Uh29) -> Uh29 {
    case v3  {
        Uh29Cons(v5, v6) -> {
            let v7 = method546(v0, v1, v2, v6, v4)
            let v8 = data_item_547(v0, v1, v2, v5)
            Uh29Cons(v8, v7)
        }
        Uh29Nil -> v4
    }
}

pub fn expanded_506(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh3, v14: Uh3, v15: Uh29) -> Uh38 {
    let v16 = includes_pairs_507(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15)
    let v33 =
        case v16  {
            Uh38Nil -> Uh38Nil
            _ -> {
                let v18 = Uh29Nil
                let v19 = method467(v16, v18)
                let v20 = []
                let v21 = method301(v19, v20)
                let v22 = erlang_term_coerce(v21)
                let v23 = "maps"
                let v24 = atom.create(v23)
                let v25 = "from_list"
                let v26 = atom.create(v25)
                let v27 = []
                let v28 = [v22, ..v27]
                let v29 = erlang_term_apply(v24, v26, v28)
                let v30 = "includes"
                let v31 = Uh38Nil
                Uh38Cons(v30, v29, v31)
            }
        }
    let v34 = Uh29Nil
    let v35 = method546(v12, v13, v14, v15, v34)
    let v43 =
        case v35  {
            Uh29Nil -> Uh38Nil
            _ -> {
                let v37 = []
                let v38 = method301(v35, v37)
                let v39 = erlang_term_coerce(v38)
                let v40 = "data"
                let v41 = Uh38Nil
                Uh38Cons(v40, v39, v41)
            }
        }
    method466(v43, v33)
}

pub fn timeline_body_486(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Dynamic, v13: String, v14: Int) -> Dynamic {
    let v15 = 0
    let v16 = timeline_posts_487(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
    let v17 = Uh29Nil
    let v18 = method504(v16, v17)
    let v19 = sliced_480(v15, v14, v18)
    let v20 = "media.fields"
    let v21 = v13 == ""
    let v25 =
        case v21 {
            True -> Uh3Nil
            False -> {
                let v23 = "&"
                split_list_2(v23, v13)
            }
        }
    let v26 = first_value_474(v20, v25)
    let v27 = v26 == ""
    let v31 =
        case v27 {
            True -> Uh3Nil
            False -> {
                let v29 = ","
                split_list_2(v29, v26)
            }
        }
    let v32 = Uh3Nil
    let v33 = method488(v31, v32)
    let v34 = "post.fields"
    let v38 =
        case v21 {
            True -> Uh3Nil
            False -> {
                let v36 = "&"
                split_list_2(v36, v13)
            }
        }
    let v39 = first_value_474(v34, v38)
    let v40 = v39 == ""
    let v44 =
        case v40 {
            True -> Uh3Nil
            False -> {
                let v42 = ","
                split_list_2(v42, v39)
            }
        }
    let v45 = Uh3Nil
    let v46 = method488(v44, v45)
    let v47 = "expansions"
    let v51 =
        case v21 {
            True -> Uh3Nil
            False -> {
                let v49 = "&"
                split_list_2(v49, v13)
            }
        }
    let v52 = first_value_474(v47, v51)
    let v53 = v52 == ""
    let v57 =
        case v53 {
            True -> Uh3Nil
            False -> {
                let v55 = ","
                split_list_2(v55, v52)
            }
        }
    let v58 = Uh3Nil
    let v59 = method488(v57, v58)
    let v60 = expanded_506(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v46, v59, v33, v19)
    let v61 = 0
    let v62 = method481(v19, v61)
    let v63 = erlang_term_coerce(v62)
    let v64 = "result_count"
    let v65 = atom.create(v64)
    let v66 = erlang_term_coerce(v65)
    let v67 = []
    let v68 = [v63, ..v67]
    let v69 = [v66, ..v68]
    let v70 = erlang_term_tuple(v69)
    let v71 = []
    let v72 = [v70, ..v71]
    let v73 = erlang_term_coerce(v72)
    let v74 = "maps"
    let v75 = atom.create(v74)
    let v76 = "from_list"
    let v77 = atom.create(v76)
    let v78 = []
    let v79 = [v73, ..v78]
    let v80 = erlang_term_apply(v75, v77, v79)
    let v81 = "meta"
    let v82 = Uh38Nil
    let v83 = Uh38Cons(v81, v80, v82)
    let v84 = method466(v60, v83)
    let v85 = Uh29Nil
    let v86 = method467(v84, v85)
    let v87 = []
    let v88 = method301(v86, v87)
    let v89 = erlang_term_coerce(v88)
    let v90 = atom.create(v74)
    let v91 = atom.create(v76)
    let v92 = []
    let v93 = [v89, ..v92]
    let v94 = erlang_term_apply(v90, v91, v93)
    v94
}

pub fn timeline_reply_484(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Dynamic, v13: String, v14: String) -> String {
    let v15 = timeline_fault_485(v12)
    case v15  {
        Us2None -> {
            let v17 = count_of_text_10(v14)
            let v20 =
                case v17  {
                    Us3None -> 0
                    Us3Some(v18) -> v18
                }
            let v21 = timeline_body_486(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v20)
            let v22 = "json"
            let v23 = atom.create(v22)
            let v24 = "encode"
            let v25 = atom.create(v24)
            let v26 = []
            let v27 = [v21, ..v26]
            let v28 = erlang_term_apply(v23, v25, v27)
            let v29 = "erlang"
            let v30 = atom.create(v29)
            let v31 = "iolist_to_binary"
            let v32 = atom.create(v31)
            let v33 = []
            let v34 = [v28, ..v33]
            let v35 = erlang_term_apply(v30, v32, v34)
            let v36 = erlang_term_coerce(v35)
            let v37 = string.inspect(200)
            let v38 = "HTTP/1.1 "
            let v39 = v38 <> v37 
            let v40 = " "
            let v41 = v39 <> v40 
            let v42 = "OK"
            let v43 = v41 <> v42 
            let v44 = erlang_term_coerce(v36)
            let v45 = atom.create(v29)
            let v46 = "byte_size"
            let v47 = atom.create(v46)
            let v48 = []
            let v49 = [v44, ..v48]
            let v50 = erlang_term_apply(v45, v47, v49)
            let v51 = erlang_term_coerce(v50)
            let v52 = string.inspect(v51)
            let v53 = "\r\nContent-Length: "
            let v54 = v53 <> v52 
            let v55 = "\r\nContent-Type: application/json; charset=utf-8"
            let v56 = v55 <> v54 
            let v57 = "\r\nConnection: close\r\n\r\n"
            let v58 = v56 <> v57 
            let v59 = v43 <> v58 
            let v60 = v59 <> v36 
            v60
        }
        Us2Some(v16) -> v16
    }
}

pub fn timeline_483(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Dynamic, v13: String) -> String {
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
                let v22 = "10"
                v22
            }
            False -> v20
        }
    let v24 = count_of_text_10(v23)
    let v30 =
        case v24  {
            Us3None -> False
            Us3Some(v25) -> {
                let v26 = v25 >= 5
                case v26 {
                    True -> {
                        let v27 = v25 <= 100
                        v27
                    }
                    False -> False
                }
            }
        }
    case v30 {
        True -> timeline_reply_484(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v23)
        False -> {
            let v32 = "max_results must be 5..100, got "
            let v33 = v32 <> v23 
            let v34 = "Invalid Request"
            let v35 = erlang_term_coerce(v34)
            let v36 = erlang_term_coerce(v33)
            let v37 = "about:blank"
            let v38 = erlang_term_coerce(v37)
            let v39 = erlang_term_coerce(400)
            let v40 = "status"
            let v41 = atom.create(v40)
            let v42 = erlang_term_coerce(v41)
            let v43 = []
            let v44 = [v39, ..v43]
            let v45 = [v42, ..v44]
            let v46 = erlang_term_tuple(v45)
            let v47 = "type"
            let v48 = atom.create(v47)
            let v49 = erlang_term_coerce(v48)
            let v50 = []
            let v51 = [v38, ..v50]
            let v52 = [v49, ..v51]
            let v53 = erlang_term_tuple(v52)
            let v54 = "detail"
            let v55 = atom.create(v54)
            let v56 = erlang_term_coerce(v55)
            let v57 = []
            let v58 = [v36, ..v57]
            let v59 = [v56, ..v58]
            let v60 = erlang_term_tuple(v59)
            let v61 = "title"
            let v62 = atom.create(v61)
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
            let v74 = "maps"
            let v75 = atom.create(v74)
            let v76 = "from_list"
            let v77 = atom.create(v76)
            let v78 = []
            let v79 = [v73, ..v78]
            let v80 = erlang_term_apply(v75, v77, v79)
            let v81 = "json"
            let v82 = atom.create(v81)
            let v83 = "encode"
            let v84 = atom.create(v83)
            let v85 = []
            let v86 = [v80, ..v85]
            let v87 = erlang_term_apply(v82, v84, v86)
            let v88 = "erlang"
            let v89 = atom.create(v88)
            let v90 = "iolist_to_binary"
            let v91 = atom.create(v90)
            let v92 = []
            let v93 = [v87, ..v92]
            let v94 = erlang_term_apply(v89, v91, v93)
            let v95 = erlang_term_coerce(v94)
            let v96 = string.inspect(400)
            let v97 = "HTTP/1.1 "
            let v98 = v97 <> v96 
            let v99 = " "
            let v100 = v98 <> v99 
            let v101 = "Bad Request"
            let v102 = v100 <> v101 
            let v103 = erlang_term_coerce(v95)
            let v104 = atom.create(v88)
            let v105 = "byte_size"
            let v106 = atom.create(v105)
            let v107 = []
            let v108 = [v103, ..v107]
            let v109 = erlang_term_apply(v104, v106, v108)
            let v110 = erlang_term_coerce(v109)
            let v111 = string.inspect(v110)
            let v112 = "\r\nContent-Length: "
            let v113 = v112 <> v111 
            let v114 = "\r\nContent-Type: application/json; charset=utf-8"
            let v115 = v114 <> v113 
            let v116 = "\r\nConnection: close\r\n\r\n"
            let v117 = v115 <> v116 
            let v118 = v102 <> v117 
            let v119 = v118 <> v95 
            v119
        }
    }
}

pub fn method551(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh3) -> Uh3 {
    case v12  {
        Uh3Cons(v14, v15) -> {
            let v16 = method551(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v15, v13)
            let v17 = v14 |> string.lowercase
            let v18 = dict.has_key(v2, v17)
            let v19 = v18 == False
            case v19 {
                True -> Uh3Cons(v14, v16)
                False -> v16
            }
        }
        Uh3Nil -> v13
    }
}

pub fn not_found_553(v0: String) -> Dynamic {
    let v1 = "user"
    let v2 = erlang_term_coerce(v1)
    let v3 = "usernames"
    let v4 = erlang_term_coerce(v3)
    let v5 = "https://api.x.com/2/problems/resource-not-found"
    let v6 = erlang_term_coerce(v5)
    let v7 = erlang_term_coerce(v0)
    let v8 = "Could not find user with usernames: ["
    let v9 = v8 <> v0 
    let v10 = "]."
    let v11 = v9 <> v10 
    let v12 = erlang_term_coerce(v11)
    let v13 = "Not Found Error"
    let v14 = erlang_term_coerce(v13)
    let v15 = "type"
    let v16 = atom.create(v15)
    let v17 = erlang_term_coerce(v16)
    let v18 = []
    let v19 = [v6, ..v18]
    let v20 = [v17, ..v19]
    let v21 = erlang_term_tuple(v20)
    let v22 = "parameter"
    let v23 = atom.create(v22)
    let v24 = erlang_term_coerce(v23)
    let v25 = []
    let v26 = [v4, ..v25]
    let v27 = [v24, ..v26]
    let v28 = erlang_term_tuple(v27)
    let v29 = "resource_type"
    let v30 = atom.create(v29)
    let v31 = erlang_term_coerce(v30)
    let v32 = []
    let v33 = [v2, ..v32]
    let v34 = [v31, ..v33]
    let v35 = erlang_term_tuple(v34)
    let v36 = "title"
    let v37 = atom.create(v36)
    let v38 = erlang_term_coerce(v37)
    let v39 = []
    let v40 = [v14, ..v39]
    let v41 = [v38, ..v40]
    let v42 = erlang_term_tuple(v41)
    let v43 = "detail"
    let v44 = atom.create(v43)
    let v45 = erlang_term_coerce(v44)
    let v46 = []
    let v47 = [v12, ..v46]
    let v48 = [v45, ..v47]
    let v49 = erlang_term_tuple(v48)
    let v50 = "value"
    let v51 = atom.create(v50)
    let v52 = erlang_term_coerce(v51)
    let v53 = []
    let v54 = [v7, ..v53]
    let v55 = [v52, ..v54]
    let v56 = erlang_term_tuple(v55)
    let v57 = []
    let v58 = [v21, ..v57]
    let v59 = [v28, ..v58]
    let v60 = [v35, ..v59]
    let v61 = [v42, ..v60]
    let v62 = [v49, ..v61]
    let v63 = [v56, ..v62]
    let v64 = erlang_term_coerce(v63)
    let v65 = "maps"
    let v66 = atom.create(v65)
    let v67 = "from_list"
    let v68 = atom.create(v67)
    let v69 = []
    let v70 = [v64, ..v69]
    let v71 = erlang_term_apply(v66, v68, v70)
    v71
}

pub fn method552(v0: Uh3, v1: Uh29) -> Uh29 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method552(v3, v1)
            let v5 = not_found_553(v2)
            Uh29Cons(v5, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method554(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh3) -> Uh3 {
    case v12  {
        Uh3Cons(v14, v15) -> {
            let v16 = method554(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v15, v13)
            let v17 = v14 |> string.lowercase
            let v18 = dict.has_key(v2, v17)
            case v18 {
                True -> Uh3Cons(v14, v16)
                False -> v16
            }
        }
        Uh3Nil -> v13
    }
}

pub fn method555(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh29) -> Uh29 {
    case v12  {
        Uh3Cons(v14, v15) -> {
            let v16 = method555(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v15, v13)
            let v17 = v14 |> string.lowercase
            let v18 = dict.get(v2, v17)
            let v19 = method471()
            let v20 = method472()
            let v21 = case v18 { Ok(x) -> v19(x) Error(x) -> v20(x) }
            let v26 =
                case v21  {
                    Us94Error -> Us72None
                    Us94Ok(v22) -> Us72Some(v22)
                }
            let v30 =
                case v26  {
                    Us72None -> panic as "dict.present: the key is not in the dict"
                    Us72Some(v27) -> v27
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
            let v94 = "from_list"
            let v95 = atom.create(v94)
            let v96 = []
            let v97 = [v92, ..v96]
            let v98 = erlang_term_apply(v93, v95, v97)
            Uh29Cons(v98, v16)
        }
        Uh3Nil -> v13
    }
}

pub fn users_by_550(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String) -> Dynamic {
    let v13 = "usernames"
    let v14 = v12 == ""
    let v18 =
        case v14 {
            True -> Uh3Nil
            False -> {
                let v16 = "&"
                split_list_2(v16, v12)
            }
        }
    let v19 = first_value_474(v13, v18)
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
    let v26 = method488(v24, v25)
    let v27 = Uh3Nil
    let v28 = method551(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v26, v27)
    let v29 = Uh29Nil
    let v30 = method552(v28, v29)
    let v38 =
        case v30  {
            Uh29Nil -> Uh38Nil
            _ -> {
                let v32 = []
                let v33 = method301(v30, v32)
                let v34 = erlang_term_coerce(v33)
                let v35 = "errors"
                let v36 = Uh38Nil
                Uh38Cons(v35, v34, v36)
            }
        }
    let v39 = Uh3Nil
    let v40 = method554(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v26, v39)
    let v41 = Uh29Nil
    let v42 = method555(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v40, v41)
    let v50 =
        case v42  {
            Uh29Nil -> Uh38Nil
            _ -> {
                let v44 = []
                let v45 = method301(v42, v44)
                let v46 = erlang_term_coerce(v45)
                let v47 = "data"
                let v48 = Uh38Nil
                Uh38Cons(v47, v46, v48)
            }
        }
    let v51 = method466(v50, v38)
    let v52 = Uh29Nil
    let v53 = method467(v51, v52)
    let v54 = []
    let v55 = method301(v53, v54)
    let v56 = erlang_term_coerce(v55)
    let v57 = "maps"
    let v58 = atom.create(v57)
    let v59 = "from_list"
    let v60 = atom.create(v59)
    let v61 = []
    let v62 = [v56, ..v61]
    let v63 = erlang_term_apply(v58, v60, v62)
    v63
}

pub fn method557(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh3) -> Uh3 {
    case v12  {
        Uh3Cons(v14, v15) -> {
            let v16 = method557(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v15, v13)
            let v17 = dict.has_key(v3, v14)
            case v17 {
                True -> Uh3Cons(v14, v16)
                False -> v16
            }
        }
        Uh3Nil -> v13
    }
}

pub fn method558(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh29) -> Uh29 {
    case v12  {
        Uh3Cons(v14, v15) -> {
            let v16 = method558(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v15, v13)
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
                    Us72None -> panic as "dict.present: the key is not in the dict"
                    Us72Some(v26) -> v26
                }
            let v30 = ""
            let v31 = erlang_term_coerce(v30)
            let v32 = "username"
            let v33 = erlang_term_coerce(v32)
            let v34 = erlang_term_coerce(v31)
            let v35 = "maps"
            let v36 = atom.create(v35)
            let v37 = "get"
            let v38 = atom.create(v37)
            let v39 = []
            let v40 = [v34, ..v39]
            let v41 = [v29, ..v40]
            let v42 = [v33, ..v41]
            let v43 = erlang_term_apply(v36, v38, v42)
            let v44 = erlang_term_coerce(v43)
            let v45 = erlang_term_coerce(v30)
            let v46 = "name"
            let v47 = erlang_term_coerce(v46)
            let v48 = erlang_term_coerce(v45)
            let v49 = atom.create(v35)
            let v50 = atom.create(v37)
            let v51 = []
            let v52 = [v48, ..v51]
            let v53 = [v29, ..v52]
            let v54 = [v47, ..v53]
            let v55 = erlang_term_apply(v49, v50, v54)
            let v56 = erlang_term_coerce(v55)
            let v57 = erlang_term_coerce(v30)
            let v58 = "id"
            let v59 = erlang_term_coerce(v58)
            let v60 = erlang_term_coerce(v57)
            let v61 = atom.create(v35)
            let v62 = atom.create(v37)
            let v63 = []
            let v64 = [v60, ..v63]
            let v65 = [v29, ..v64]
            let v66 = [v59, ..v65]
            let v67 = erlang_term_apply(v61, v62, v66)
            let v68 = erlang_term_coerce(v67)
            let v69 = atom.create(v32)
            let v70 = erlang_term_coerce(v69)
            let v71 = []
            let v72 = [v44, ..v71]
            let v73 = [v70, ..v72]
            let v74 = erlang_term_tuple(v73)
            let v75 = atom.create(v46)
            let v76 = erlang_term_coerce(v75)
            let v77 = []
            let v78 = [v56, ..v77]
            let v79 = [v76, ..v78]
            let v80 = erlang_term_tuple(v79)
            let v81 = atom.create(v58)
            let v82 = erlang_term_coerce(v81)
            let v83 = []
            let v84 = [v68, ..v83]
            let v85 = [v82, ..v84]
            let v86 = erlang_term_tuple(v85)
            let v87 = []
            let v88 = [v74, ..v87]
            let v89 = [v80, ..v88]
            let v90 = [v86, ..v89]
            let v91 = erlang_term_coerce(v90)
            let v92 = atom.create(v35)
            let v93 = "from_list"
            let v94 = atom.create(v93)
            let v95 = []
            let v96 = [v91, ..v95]
            let v97 = erlang_term_apply(v92, v94, v96)
            Uh29Cons(v97, v16)
        }
        Uh3Nil -> v13
    }
}

pub fn users_by_ids_556(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String) -> Dynamic {
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
    let v19 = first_value_474(v13, v18)
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
    let v26 = method488(v24, v25)
    let v27 = Uh3Nil
    let v28 = method557(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v26, v27)
    let v29 = Uh29Nil
    let v30 = method558(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v28, v29)
    let v31 = []
    let v32 = method301(v30, v31)
    let v33 = erlang_term_coerce(v32)
    let v34 = "data"
    let v35 = atom.create(v34)
    let v36 = erlang_term_coerce(v35)
    let v37 = []
    let v38 = [v33, ..v37]
    let v39 = [v36, ..v38]
    let v40 = erlang_term_tuple(v39)
    let v41 = []
    let v42 = [v40, ..v41]
    let v43 = erlang_term_coerce(v42)
    let v44 = "maps"
    let v45 = atom.create(v44)
    let v46 = "from_list"
    let v47 = atom.create(v46)
    let v48 = []
    let v49 = [v43, ..v48]
    let v50 = erlang_term_apply(v45, v47, v49)
    v50
}

pub fn users_reply_549(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, _v12: String, v13: String, v14: String, _v15: String, _v16: String) -> String {
    let v17 = v13 == "/2/users/by"
    let v20 =
        case v17 {
            True -> users_by_550(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v14)
            False -> users_by_ids_556(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v14)
        }
    let v21 = "json"
    let v22 = atom.create(v21)
    let v23 = "encode"
    let v24 = atom.create(v23)
    let v25 = []
    let v26 = [v20, ..v25]
    let v27 = erlang_term_apply(v22, v24, v26)
    let v28 = "erlang"
    let v29 = atom.create(v28)
    let v30 = "iolist_to_binary"
    let v31 = atom.create(v30)
    let v32 = []
    let v33 = [v27, ..v32]
    let v34 = erlang_term_apply(v29, v31, v33)
    let v35 = erlang_term_coerce(v34)
    let v36 = string.inspect(200)
    let v37 = "HTTP/1.1 "
    let v38 = v37 <> v36 
    let v39 = " "
    let v40 = v38 <> v39 
    let v41 = "OK"
    let v42 = v40 <> v41 
    let v43 = erlang_term_coerce(v35)
    let v44 = atom.create(v28)
    let v45 = "byte_size"
    let v46 = atom.create(v45)
    let v47 = []
    let v48 = [v43, ..v47]
    let v49 = erlang_term_apply(v44, v46, v48)
    let v50 = erlang_term_coerce(v49)
    let v51 = string.inspect(v50)
    let v52 = "\r\nContent-Length: "
    let v53 = v52 <> v51 
    let v54 = "\r\nContent-Type: application/json; charset=utf-8"
    let v55 = v54 <> v53 
    let v56 = "\r\nConnection: close\r\n\r\n"
    let v57 = v55 <> v56 
    let v58 = v42 <> v57 
    let v59 = v58 <> v35 
    v59
}

pub fn method561(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh3) -> Uh3 {
    case v12  {
        Uh3Cons(v14, v15) -> {
            let v16 = method561(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v15, v13)
            let v17 = dict.has_key(v5, v14)
            let v18 = v17 == False
            case v18 {
                True -> Uh3Cons(v14, v16)
                False -> v16
            }
        }
        Uh3Nil -> v13
    }
}
