import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import xsim_frames/types.{type Uh3, type Uh29, type Uh37, type Uh38, Uh29Cons, Uh29Nil, Uh37Cons, Uh37Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_slice, split_list_2}
import xsim_frames/part27.{items_from_444, method450}
import xsim_frames/part28.{first_value_474, method466}
import xsim_frames/part29.{method488, method489, method490, method491, method493, method494, method495, method496, method497, method498, method499, method500}

pub fn method501(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method500()
                    method501(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn method492(v0: Uh3, v1: Uh29, v2: Uh29) -> Uh29 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method492(v0, v4, v2)
            let v6 = method493()
            let v7 = method494(v6, v0)
            let v36 =
                case v7 {
                    True -> {
                        let v8 = []
                        let v9 = erlang_term_coerce(v8)
                        let v10 = "refs"
                        let v11 = erlang_term_coerce(v10)
                        let v12 = erlang_term_coerce(v9)
                        let v13 = "maps"
                        let v14 = atom.create(v13)
                        let v15 = "get"
                        let v16 = atom.create(v15)
                        let v17 = []
                        let v18 = [v12, ..v17]
                        let v19 = [v3, ..v18]
                        let v20 = [v11, ..v19]
                        let v21 = erlang_term_apply(v14, v16, v20)
                        let v22 = erlang_term_coerce(v21)
                        let v23 = "lists"
                        let v24 = atom.create(v23)
                        let v25 = "reverse"
                        let v26 = atom.create(v25)
                        let v27 = []
                        let v28 = [v22, ..v27]
                        let v29 = erlang_term_apply(v24, v26, v28)
                        let v30 = Uh29Nil
                        let v31 = items_from_444(v29, v30)
                        let v32 = Uh3Nil
                        let v33 = method495(v31, v32)
                        let v34 = method496()
                        method497(v34, v33)
                    }
                    False -> False
                }
            let v68 =
                case v36 {
                    True -> True
                    False -> {
                        let v37 = method498()
                        let v38 = method499(v37, v0)
                        case v38 {
                            True -> {
                                let v39 = []
                                let v40 = erlang_term_coerce(v39)
                                let v41 = "refs"
                                let v42 = erlang_term_coerce(v41)
                                let v43 = erlang_term_coerce(v40)
                                let v44 = "maps"
                                let v45 = atom.create(v44)
                                let v46 = "get"
                                let v47 = atom.create(v46)
                                let v48 = []
                                let v49 = [v43, ..v48]
                                let v50 = [v3, ..v49]
                                let v51 = [v42, ..v50]
                                let v52 = erlang_term_apply(v45, v47, v51)
                                let v53 = erlang_term_coerce(v52)
                                let v54 = "lists"
                                let v55 = atom.create(v54)
                                let v56 = "reverse"
                                let v57 = atom.create(v56)
                                let v58 = []
                                let v59 = [v53, ..v58]
                                let v60 = erlang_term_apply(v55, v57, v59)
                                let v61 = Uh29Nil
                                let v62 = items_from_444(v60, v61)
                                let v63 = Uh3Nil
                                let v64 = method495(v62, v63)
                                let v65 = method500()
                                method501(v65, v64)
                            }
                            False -> False
                        }
                    }
                }
            let v69 = v68 == False
            case v69 {
                True -> Uh29Cons(v3, v5)
                False -> v5
            }
        }
        Uh29Nil -> v2
    }
}

pub fn method502(v0: String, v1: Uh29, v2: Uh29) -> Uh29 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method502(v0, v4, v2)
            let v6 = v0 == ""
            let v36 =
                case v6 {
                    True -> True
                    False -> {
                        let v7 = ""
                        let v8 = erlang_term_coerce(v7)
                        let v9 = "created_at"
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
                        let v22 = erlang_term_coerce(v21)
                        let v23 = spiral_string_slice(v22, 0, 18)
                        let v24 = spiral_string_slice(v0, 0, 18)
                        let v25 = erlang_term_coerce(v23)
                        let v26 = erlang_term_coerce(v24)
                        let v27 = "erlang"
                        let v28 = atom.create(v27)
                        let v29 = ">="
                        let v30 = atom.create(v29)
                        let v31 = []
                        let v32 = [v26, ..v31]
                        let v33 = [v25, ..v32]
                        let v34 = erlang_term_apply(v28, v30, v33)
                        let v35 = erlang_term_coerce(v34)
                        v35
                    }
                }
            case v36 {
                True -> Uh29Cons(v3, v5)
                False -> v5
            }
        }
        Uh29Nil -> v2
    }
}

pub fn method503(v0: String, v1: Uh29, v2: Uh29) -> Uh29 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method503(v0, v4, v2)
            let v6 = v0 == ""
            let v37 =
                case v6 {
                    True -> True
                    False -> {
                        let v7 = ""
                        let v8 = erlang_term_coerce(v7)
                        let v9 = "created_at"
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
                        let v22 = erlang_term_coerce(v21)
                        let v23 = spiral_string_slice(v22, 0, 18)
                        let v24 = spiral_string_slice(v0, 0, 18)
                        let v25 = erlang_term_coerce(v23)
                        let v26 = erlang_term_coerce(v24)
                        let v27 = "erlang"
                        let v28 = atom.create(v27)
                        let v29 = ">="
                        let v30 = atom.create(v29)
                        let v31 = []
                        let v32 = [v26, ..v31]
                        let v33 = [v25, ..v32]
                        let v34 = erlang_term_apply(v28, v30, v33)
                        let v35 = erlang_term_coerce(v34)
                        let v36 = v35 == False
                        v36
                    }
                }
            case v37 {
                True -> Uh29Cons(v3, v5)
                False -> v5
            }
        }
        Uh29Nil -> v2
    }
}

pub fn timeline_posts_487(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Dynamic, v13: String) -> Uh29 {
    let v14 = "exclude"
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
    let v25 =
        case v21 {
            True -> Uh3Nil
            False -> {
                let v23 = ","
                split_list_2(v23, v20)
            }
        }
    let v26 = Uh3Nil
    let v27 = method488(v25, v26)
    let v28 = []
    let v29 = erlang_term_coerce(v28)
    let v30 = "posts"
    let v31 = erlang_term_coerce(v30)
    let v32 = erlang_term_coerce(v29)
    let v33 = "maps"
    let v34 = atom.create(v33)
    let v35 = "get"
    let v36 = atom.create(v35)
    let v37 = []
    let v38 = [v32, ..v37]
    let v39 = [v12, ..v38]
    let v40 = [v31, ..v39]
    let v41 = erlang_term_apply(v34, v36, v40)
    let v42 = erlang_term_coerce(v41)
    let v43 = "lists"
    let v44 = atom.create(v43)
    let v45 = "reverse"
    let v46 = atom.create(v45)
    let v47 = []
    let v48 = [v42, ..v47]
    let v49 = erlang_term_apply(v44, v46, v48)
    let v50 = Uh29Nil
    let v51 = items_from_444(v49, v50)
    let v52 = Uh3Nil
    let v53 = method489(v51, v52)
    let v54 = Uh3Nil
    let v55 = method490(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v53, v54)
    let v56 = Uh29Nil
    let v57 = method491(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v55, v56)
    let v58 = Uh29Nil
    let v59 = method492(v27, v57, v58)
    let v60 = "start_time"
    let v64 =
        case v15 {
            True -> Uh3Nil
            False -> {
                let v62 = "&"
                split_list_2(v62, v13)
            }
        }
    let v65 = first_value_474(v60, v64)
    let v66 = v65 == ""
    let v68 =
        case v66 {
            True -> {
                let v67 = ""
                v67
            }
            False -> v65
        }
    let v69 = Uh29Nil
    let v70 = method502(v68, v59, v69)
    let v71 = "end_time"
    let v75 =
        case v15 {
            True -> Uh3Nil
            False -> {
                let v73 = "&"
                split_list_2(v73, v13)
            }
        }
    let v76 = first_value_474(v71, v75)
    let v77 = v76 == ""
    let v79 =
        case v77 {
            True -> {
                let v78 = ""
                v78
            }
            False -> v76
        }
    let v80 = Uh29Nil
    method503(v79, v70, v80)
}

pub fn inserted_505(v0: Dynamic, v1: Uh29) -> Uh29 {
    case v1  {
        Uh29Cons(v2, v3) -> {
            let v4 = ""
            let v5 = erlang_term_coerce(v4)
            let v6 = "created_at"
            let v7 = erlang_term_coerce(v6)
            let v8 = erlang_term_coerce(v5)
            let v9 = "maps"
            let v10 = atom.create(v9)
            let v11 = "get"
            let v12 = atom.create(v11)
            let v13 = []
            let v14 = [v8, ..v13]
            let v15 = [v2, ..v14]
            let v16 = [v7, ..v15]
            let v17 = erlang_term_apply(v10, v12, v16)
            let v18 = erlang_term_coerce(v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = spiral_string_slice(v19, 0, 18)
            let v21 = erlang_term_coerce(v4)
            let v22 = erlang_term_coerce(v6)
            let v23 = erlang_term_coerce(v21)
            let v24 = atom.create(v9)
            let v25 = atom.create(v11)
            let v26 = []
            let v27 = [v23, ..v26]
            let v28 = [v0, ..v27]
            let v29 = [v22, ..v28]
            let v30 = erlang_term_apply(v24, v25, v29)
            let v31 = erlang_term_coerce(v30)
            let v32 = erlang_term_coerce(v31)
            let v33 = spiral_string_slice(v32, 0, 18)
            let v34 = erlang_term_coerce(v20)
            let v35 = erlang_term_coerce(v33)
            let v36 = "erlang"
            let v37 = atom.create(v36)
            let v38 = ">="
            let v39 = atom.create(v38)
            let v40 = []
            let v41 = [v35, ..v40]
            let v42 = [v34, ..v41]
            let v43 = erlang_term_apply(v37, v39, v42)
            let v44 = erlang_term_coerce(v43)
            case v44 {
                True -> {
                    let v45 = inserted_505(v0, v3)
                    Uh29Cons(v2, v45)
                }
                False -> Uh29Cons(v0, v1)
            }
        }
        _ -> Uh29Cons(v0, v1)
    }
}

pub fn method504(v0: Uh29, v1: Uh29) -> Uh29 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = inserted_505(v2, v1)
            method504(v3, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn closure151(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "referenced_posts.author_id"
        v1
    }
}

pub fn method509() -> fn(String) -> Bool {
    closure151(Nil)
}

pub fn method510(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method509()
                    method510(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn closure152(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "referenced_posts"
        v1
    }
}

pub fn method512() -> fn(String) -> Bool {
    closure152(Nil)
}

pub fn method513(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method512()
                    method513(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn method511(v0: Uh3, v1: Uh3, v2: Uh3, v3: Uh29, v4: Uh29) -> Uh29 {
    case v3  {
        Uh29Cons(v5, v6) -> {
            let v7 = method511(v0, v1, v2, v6, v4)
            let v8 = method512()
            let v9 = method513(v8, v1)
            let v35 =
                case v9 {
                    True -> {
                        let v10 = []
                        let v11 = erlang_term_coerce(v10)
                        let v12 = "refs"
                        let v13 = erlang_term_coerce(v12)
                        let v14 = erlang_term_coerce(v11)
                        let v15 = "maps"
                        let v16 = atom.create(v15)
                        let v17 = "get"
                        let v18 = atom.create(v17)
                        let v19 = []
                        let v20 = [v14, ..v19]
                        let v21 = [v5, ..v20]
                        let v22 = [v13, ..v21]
                        let v23 = erlang_term_apply(v16, v18, v22)
                        let v24 = erlang_term_coerce(v23)
                        let v25 = "lists"
                        let v26 = atom.create(v25)
                        let v27 = "reverse"
                        let v28 = atom.create(v27)
                        let v29 = []
                        let v30 = [v24, ..v29]
                        let v31 = erlang_term_apply(v26, v28, v30)
                        let v32 = Uh29Nil
                        let v33 = items_from_444(v31, v32)
                        case v33  {
                            Uh29Nil -> False
                            _ -> True
                        }
                    }
                    False -> False
                }
            case v35 {
                True -> Uh29Cons(v5, v7)
                False -> v7
            }
        }
        Uh29Nil -> v4
    }
}

pub fn method514(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh29, v13: Uh37) -> Uh37 {
    case v12  {
        Uh29Cons(v14, v15) -> {
            let v16 = method514(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v15, v13)
            let v17 = []
            let v18 = erlang_term_coerce(v17)
            let v19 = "refs"
            let v20 = erlang_term_coerce(v19)
            let v21 = erlang_term_coerce(v18)
            let v22 = "maps"
            let v23 = atom.create(v22)
            let v24 = "get"
            let v25 = atom.create(v24)
            let v26 = []
            let v27 = [v21, ..v26]
            let v28 = [v14, ..v27]
            let v29 = [v20, ..v28]
            let v30 = erlang_term_apply(v23, v25, v29)
            let v31 = erlang_term_coerce(v30)
            let v32 = "lists"
            let v33 = atom.create(v32)
            let v34 = "reverse"
            let v35 = atom.create(v34)
            let v36 = []
            let v37 = [v31, ..v36]
            let v38 = erlang_term_apply(v33, v35, v37)
            let v39 = Uh29Nil
            let v40 = items_from_444(v38, v39)
            let v41 = Uh3Nil
            let v42 = method489(v40, v41)
            let v43 = Uh3Nil
            let v44 = method490(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v42, v43)
            let v45 = Uh29Nil
            let v46 = method491(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v44, v45)
            Uh37Cons(v46, v16)
        }
        Uh29Nil -> v13
    }
}

pub fn method515(v0: Uh29, v1: Uh38) -> Uh38 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method515(v3, v1)
            let v5 = ""
            let v6 = erlang_term_coerce(v5)
            let v7 = "author_id"
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
            let v20 = "erlang"
            let v21 = atom.create(v20)
            let v22 = "is_binary"
            let v23 = atom.create(v22)
            let v24 = []
            let v25 = [v19, ..v24]
            let v26 = erlang_term_apply(v21, v23, v25)
            let v27 = erlang_term_coerce(v26)
            let v36 =
                case v27 {
                    True -> {
                        let v28 = erlang_term_coerce(v19)
                        v28
                    }
                    False -> {
                        let v29 = atom.create(v20)
                        let v30 = "integer_to_binary"
                        let v31 = atom.create(v30)
                        let v32 = []
                        let v33 = [v19, ..v32]
                        let v34 = erlang_term_apply(v29, v31, v33)
                        let v35 = erlang_term_coerce(v34)
                        v35
                    }
                }
            let v37 = erlang_term_coerce(v5)
            let v38 = erlang_term_coerce(v7)
            let v39 = erlang_term_coerce(v37)
            let v40 = atom.create(v10)
            let v41 = atom.create(v12)
            let v42 = []
            let v43 = [v39, ..v42]
            let v44 = [v2, ..v43]
            let v45 = [v38, ..v44]
            let v46 = erlang_term_apply(v40, v41, v45)
            let v47 = erlang_term_coerce(v46)
            let v48 = "id"
            let v49 = atom.create(v48)
            let v50 = erlang_term_coerce(v49)
            let v51 = []
            let v52 = [v47, ..v51]
            let v53 = [v50, ..v52]
            let v54 = erlang_term_tuple(v53)
            let v55 = []
            let v56 = [v54, ..v55]
            let v57 = erlang_term_coerce(v56)
            let v58 = atom.create(v10)
            let v59 = "from_list"
            let v60 = atom.create(v59)
            let v61 = []
            let v62 = [v57, ..v61]
            let v63 = erlang_term_apply(v58, v60, v62)
            Uh38Cons(v36, v63, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn included_authors_508(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh3, v14: Uh3, v15: Uh29) -> Uh38 {
    let v16 = method509()
    let v17 = method510(v16, v13)
    case v17 {
        True -> {
            let v18 = Uh29Nil
            let v19 = method511(v12, v13, v14, v15, v18)
            let v20 = Uh37Nil
            let v21 = method514(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v19, v20)
            let v22 = Uh29Nil
            let v23 = method450(v21, v22)
            let v24 = Uh38Nil
            method515(v23, v24)
        }
        False -> Uh38Nil
    }
}

pub fn deduped_516(v0: dict.Dict(String, Nil), v1: Uh38) -> Uh29 {
    case v1  {
        Uh38Cons(v2, v3, v4) -> {
            let v5 = dict.has_key(v0, v2)
            case v5 {
                True -> deduped_516(v0, v4)
                False -> {
                    let v7 = dict.insert(v0, v2, Nil)
                    let v8 = deduped_516(v7, v4)
                    Uh29Cons(v3, v8)
                }
            }
        }
        Uh38Nil -> Uh29Nil
    }
}

pub fn closure153(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "created_at"
        v1
    }
}

pub fn method520() -> fn(String) -> Bool {
    closure153(Nil)
}

pub fn method521(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method520()
                    method521(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn closure154(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "conversation_id"
        v1
    }
}

pub fn method522() -> fn(String) -> Bool {
    closure154(Nil)
}

pub fn method523(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method522()
                    method523(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn closure155(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "author_id"
        v1
    }
}

pub fn method524() -> fn(String) -> Bool {
    closure155(Nil)
}

pub fn method525(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method524()
                    method525(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn simple_pairs_519(v0: Dynamic, v1: Uh3) -> Uh38 {
    let v2 = ""
    let v3 = erlang_term_coerce(v2)
    let v4 = "created_at"
    let v5 = erlang_term_coerce(v4)
    let v6 = erlang_term_coerce(v3)
    let v7 = "maps"
    let v8 = atom.create(v7)
    let v9 = "get"
    let v10 = atom.create(v9)
    let v11 = []
    let v12 = [v6, ..v11]
    let v13 = [v0, ..v12]
    let v14 = [v5, ..v13]
    let v15 = erlang_term_apply(v8, v10, v14)
    let v16 = erlang_term_coerce(v15)
    let v17 = method520()
    let v18 = method521(v17, v1)
    let v22 =
        case v18 {
            True -> {
                let v19 = Uh38Nil
                Uh38Cons(v4, v16, v19)
            }
            False -> Uh38Nil
        }
    let v23 = erlang_term_coerce(v2)
    let v24 = "id"
    let v25 = erlang_term_coerce(v24)
    let v26 = erlang_term_coerce(v23)
    let v27 = atom.create(v7)
    let v28 = atom.create(v9)
    let v29 = []
    let v30 = [v26, ..v29]
    let v31 = [v0, ..v30]
    let v32 = [v25, ..v31]
    let v33 = erlang_term_apply(v27, v28, v32)
    let v34 = erlang_term_coerce(v33)
    let v35 = "conversation_id"
    let v36 = erlang_term_coerce(v35)
    let v37 = erlang_term_coerce(v34)
    let v38 = atom.create(v7)
    let v39 = atom.create(v9)
    let v40 = []
    let v41 = [v37, ..v40]
    let v42 = [v0, ..v41]
    let v43 = [v36, ..v42]
    let v44 = erlang_term_apply(v38, v39, v43)
    let v45 = erlang_term_coerce(v44)
    let v46 = method522()
    let v47 = method523(v46, v1)
    let v51 =
        case v47 {
            True -> {
                let v48 = Uh38Nil
                Uh38Cons(v35, v45, v48)
            }
            False -> Uh38Nil
        }
    let v52 = erlang_term_coerce(v2)
    let v53 = "author_id"
    let v54 = erlang_term_coerce(v53)
    let v55 = erlang_term_coerce(v52)
    let v56 = atom.create(v7)
    let v57 = atom.create(v9)
    let v58 = []
    let v59 = [v55, ..v58]
    let v60 = [v0, ..v59]
    let v61 = [v54, ..v60]
    let v62 = erlang_term_apply(v56, v57, v61)
    let v63 = erlang_term_coerce(v62)
    let v64 = method524()
    let v65 = method525(v64, v1)
    let v69 =
        case v65 {
            True -> {
                let v66 = Uh38Nil
                Uh38Cons(v53, v63, v66)
            }
            False -> Uh38Nil
        }
    let v70 = Uh38Nil
    let v71 = method466(v69, v70)
    let v72 = method466(v22, v71)
    method466(v51, v72)
}

pub fn closure156(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "entities"
        v1
    }
}

pub fn method527() -> fn(String) -> Bool {
    closure156(Nil)
}

pub fn method528(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method527()
                    method528(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn closure157(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "public_metrics"
        v1
    }
}

pub fn method530() -> fn(String) -> Bool {
    closure157(Nil)
}

pub fn method531(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method530()
                    method531(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}
