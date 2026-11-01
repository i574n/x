import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import xsim_frames/types.{type Uh3, type Uh29, type Uh37, type Uh38, Uh29Cons, Uh29Nil, Uh37Cons, Uh37Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_slice, split_list_2}
import xsim_frames/part26.{method444}
import xsim_frames/part27.{method450, method466}
import xsim_frames/part28.{first_value_474}
import xsim_frames/part29.{method488, method489, method490, method491, method492, method502}

pub fn method503(v0: String, v1: Uh29, v2: Uh29) -> Uh29 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method503(v0, v4, v2)
            let v6 = v0 == ""
            let v35 =
                case v6 {
                    True -> True
                    False -> {
                        let v7 = "created_at"
                        let v8 = erlang_term_coerce(v7)
                        let v9 = ""
                        let v10 = erlang_term_coerce(v9)
                        let v11 = "maps"
                        let v12 = atom.create(v11)
                        let v13 = "get"
                        let v14 = atom.create(v13)
                        let v15 = []
                        let v16 = [v10, ..v15]
                        let v17 = [v3, ..v16]
                        let v18 = [v8, ..v17]
                        let v19 = erlang_term_apply(v12, v14, v18)
                        let v20 = erlang_term_coerce(v19)
                        let v21 = spiral_string_slice(v20, 0, 18)
                        let v22 = spiral_string_slice(v0, 0, 18)
                        let v23 = erlang_term_coerce(v21)
                        let v24 = erlang_term_coerce(v22)
                        let v25 = "erlang"
                        let v26 = atom.create(v25)
                        let v27 = ">="
                        let v28 = atom.create(v27)
                        let v29 = []
                        let v30 = [v24, ..v29]
                        let v31 = [v23, ..v30]
                        let v32 = erlang_term_apply(v26, v28, v31)
                        let v33 = erlang_term_coerce(v32)
                        let v34 = v33 == False
                        v34
                    }
                }
            case v35 {
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
    let v28 = "posts"
    let v29 = erlang_term_coerce(v28)
    let v30 = []
    let v31 = erlang_term_coerce(v30)
    let v32 = "maps"
    let v33 = atom.create(v32)
    let v34 = "get"
    let v35 = atom.create(v34)
    let v36 = []
    let v37 = [v31, ..v36]
    let v38 = [v12, ..v37]
    let v39 = [v29, ..v38]
    let v40 = erlang_term_apply(v33, v35, v39)
    let v41 = "erlang"
    let v42 = atom.create(v41)
    let v43 = "length"
    let v44 = atom.create(v43)
    let v45 = []
    let v46 = [v40, ..v45]
    let v47 = erlang_term_apply(v42, v44, v46)
    let v48 = erlang_term_coerce(v47)
    let v49 = 0
    let v50 = method444(v48, v40, v49)
    let v51 = Uh3Nil
    let v52 = method489(v50, v51)
    let v53 = Uh3Nil
    let v54 = method490(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v52, v53)
    let v55 = Uh29Nil
    let v56 = method491(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v54, v55)
    let v57 = Uh29Nil
    let v58 = method492(v27, v56, v57)
    let v59 = "start_time"
    let v63 =
        case v15 {
            True -> Uh3Nil
            False -> {
                let v61 = "&"
                split_list_2(v61, v13)
            }
        }
    let v64 = first_value_474(v59, v63)
    let v65 = v64 == ""
    let v67 =
        case v65 {
            True -> {
                let v66 = ""
                v66
            }
            False -> v64
        }
    let v68 = Uh29Nil
    let v69 = method502(v67, v58, v68)
    let v70 = "end_time"
    let v74 =
        case v15 {
            True -> Uh3Nil
            False -> {
                let v72 = "&"
                split_list_2(v72, v13)
            }
        }
    let v75 = first_value_474(v70, v74)
    let v76 = v75 == ""
    let v78 =
        case v76 {
            True -> {
                let v77 = ""
                v77
            }
            False -> v75
        }
    let v79 = Uh29Nil
    method503(v78, v69, v79)
}

pub fn inserted_505(v0: Dynamic, v1: Uh29) -> Uh29 {
    case v1  {
        Uh29Cons(v2, v3) -> {
            let v4 = "created_at"
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
            let v17 = erlang_term_coerce(v16)
            let v18 = spiral_string_slice(v17, 0, 18)
            let v19 = erlang_term_coerce(v4)
            let v20 = erlang_term_coerce(v6)
            let v21 = atom.create(v8)
            let v22 = atom.create(v10)
            let v23 = []
            let v24 = [v20, ..v23]
            let v25 = [v0, ..v24]
            let v26 = [v19, ..v25]
            let v27 = erlang_term_apply(v21, v22, v26)
            let v28 = erlang_term_coerce(v27)
            let v29 = spiral_string_slice(v28, 0, 18)
            let v30 = erlang_term_coerce(v18)
            let v31 = erlang_term_coerce(v29)
            let v32 = "erlang"
            let v33 = atom.create(v32)
            let v34 = ">="
            let v35 = atom.create(v34)
            let v36 = []
            let v37 = [v31, ..v36]
            let v38 = [v30, ..v37]
            let v39 = erlang_term_apply(v33, v35, v38)
            let v40 = erlang_term_coerce(v39)
            case v40 {
                True -> {
                    let v41 = inserted_505(v0, v3)
                    Uh29Cons(v2, v41)
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
            let v34 =
                case v9 {
                    True -> {
                        let v10 = "refs"
                        let v11 = erlang_term_coerce(v10)
                        let v12 = []
                        let v13 = erlang_term_coerce(v12)
                        let v14 = "maps"
                        let v15 = atom.create(v14)
                        let v16 = "get"
                        let v17 = atom.create(v16)
                        let v18 = []
                        let v19 = [v13, ..v18]
                        let v20 = [v5, ..v19]
                        let v21 = [v11, ..v20]
                        let v22 = erlang_term_apply(v15, v17, v21)
                        let v23 = "erlang"
                        let v24 = atom.create(v23)
                        let v25 = "length"
                        let v26 = atom.create(v25)
                        let v27 = []
                        let v28 = [v22, ..v27]
                        let v29 = erlang_term_apply(v24, v26, v28)
                        let v30 = erlang_term_coerce(v29)
                        let v31 = 0
                        let v32 = method444(v30, v22, v31)
                        case v32  {
                            Uh29Nil -> False
                            _ -> True
                        }
                    }
                    False -> False
                }
            case v34 {
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
            let v17 = "refs"
            let v18 = erlang_term_coerce(v17)
            let v19 = []
            let v20 = erlang_term_coerce(v19)
            let v21 = "maps"
            let v22 = atom.create(v21)
            let v23 = "get"
            let v24 = atom.create(v23)
            let v25 = []
            let v26 = [v20, ..v25]
            let v27 = [v14, ..v26]
            let v28 = [v18, ..v27]
            let v29 = erlang_term_apply(v22, v24, v28)
            let v30 = "erlang"
            let v31 = atom.create(v30)
            let v32 = "length"
            let v33 = atom.create(v32)
            let v34 = []
            let v35 = [v29, ..v34]
            let v36 = erlang_term_apply(v31, v33, v35)
            let v37 = erlang_term_coerce(v36)
            let v38 = 0
            let v39 = method444(v37, v29, v38)
            let v40 = Uh3Nil
            let v41 = method489(v39, v40)
            let v42 = Uh3Nil
            let v43 = method490(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v41, v42)
            let v44 = Uh29Nil
            let v45 = method491(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v43, v44)
            Uh37Cons(v45, v16)
        }
        Uh29Nil -> v13
    }
}

pub fn method515(v0: Uh29, v1: Uh38) -> Uh38 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method515(v3, v1)
            let v5 = "author_id"
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
            let v18 = "erlang"
            let v19 = atom.create(v18)
            let v20 = "is_binary"
            let v21 = atom.create(v20)
            let v22 = []
            let v23 = [v17, ..v22]
            let v24 = erlang_term_apply(v19, v21, v23)
            let v25 = erlang_term_coerce(v24)
            let v34 =
                case v25 {
                    True -> {
                        let v26 = erlang_term_coerce(v17)
                        v26
                    }
                    False -> {
                        let v27 = atom.create(v18)
                        let v28 = "integer_to_binary"
                        let v29 = atom.create(v28)
                        let v30 = []
                        let v31 = [v17, ..v30]
                        let v32 = erlang_term_apply(v27, v29, v31)
                        let v33 = erlang_term_coerce(v32)
                        v33
                    }
                }
            let v35 = erlang_term_coerce(v5)
            let v36 = erlang_term_coerce(v7)
            let v37 = atom.create(v9)
            let v38 = atom.create(v11)
            let v39 = []
            let v40 = [v36, ..v39]
            let v41 = [v2, ..v40]
            let v42 = [v35, ..v41]
            let v43 = erlang_term_apply(v37, v38, v42)
            let v44 = "id"
            let v45 = atom.create(v44)
            let v46 = erlang_term_coerce(v45)
            let v47 = []
            let v48 = [v43, ..v47]
            let v49 = [v46, ..v48]
            let v50 = erlang_term_tuple(v49)
            let v51 = []
            let v52 = [v50, ..v51]
            let v53 = erlang_term_coerce(v52)
            let v54 = atom.create(v9)
            let v55 = "from_list"
            let v56 = atom.create(v55)
            let v57 = []
            let v58 = [v53, ..v57]
            let v59 = erlang_term_apply(v54, v56, v58)
            Uh38Cons(v34, v59, v4)
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
    let v2 = "created_at"
    let v3 = erlang_term_coerce(v2)
    let v4 = ""
    let v5 = erlang_term_coerce(v4)
    let v6 = "maps"
    let v7 = atom.create(v6)
    let v8 = "get"
    let v9 = atom.create(v8)
    let v10 = []
    let v11 = [v5, ..v10]
    let v12 = [v0, ..v11]
    let v13 = [v3, ..v12]
    let v14 = erlang_term_apply(v7, v9, v13)
    let v15 = method520()
    let v16 = method521(v15, v1)
    let v20 =
        case v16 {
            True -> {
                let v17 = Uh38Nil
                Uh38Cons(v2, v14, v17)
            }
            False -> Uh38Nil
        }
    let v21 = "id"
    let v22 = erlang_term_coerce(v21)
    let v23 = erlang_term_coerce(v4)
    let v24 = atom.create(v6)
    let v25 = atom.create(v8)
    let v26 = []
    let v27 = [v23, ..v26]
    let v28 = [v0, ..v27]
    let v29 = [v22, ..v28]
    let v30 = erlang_term_apply(v24, v25, v29)
    let v31 = "conversation_id"
    let v32 = erlang_term_coerce(v31)
    let v33 = atom.create(v6)
    let v34 = atom.create(v8)
    let v35 = []
    let v36 = [v30, ..v35]
    let v37 = [v0, ..v36]
    let v38 = [v32, ..v37]
    let v39 = erlang_term_apply(v33, v34, v38)
    let v40 = method522()
    let v41 = method523(v40, v1)
    let v45 =
        case v41 {
            True -> {
                let v42 = Uh38Nil
                Uh38Cons(v31, v39, v42)
            }
            False -> Uh38Nil
        }
    let v46 = "author_id"
    let v47 = erlang_term_coerce(v46)
    let v48 = erlang_term_coerce(v4)
    let v49 = atom.create(v6)
    let v50 = atom.create(v8)
    let v51 = []
    let v52 = [v48, ..v51]
    let v53 = [v0, ..v52]
    let v54 = [v47, ..v53]
    let v55 = erlang_term_apply(v49, v50, v54)
    let v56 = method524()
    let v57 = method525(v56, v1)
    let v61 =
        case v57 {
            True -> {
                let v58 = Uh38Nil
                Uh38Cons(v46, v55, v58)
            }
            False -> Uh38Nil
        }
    let v62 = Uh38Nil
    let v63 = method466(v61, v62)
    let v64 = method466(v20, v63)
    method466(v45, v64)
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

pub fn counted_pairs_529(v0: Dynamic, v1: Uh3) -> Uh38 {
    let v2 = method512()
    let v3 = method513(v2, v1)
    let v28 =
        case v3 {
            True -> {
                let v4 = "refs"
                let v5 = erlang_term_coerce(v4)
                let v6 = []
                let v7 = erlang_term_coerce(v6)
                let v8 = "maps"
                let v9 = atom.create(v8)
                let v10 = "get"
                let v11 = atom.create(v10)
                let v12 = []
                let v13 = [v7, ..v12]
                let v14 = [v0, ..v13]
                let v15 = [v5, ..v14]
                let v16 = erlang_term_apply(v9, v11, v15)
                let v17 = "erlang"
                let v18 = atom.create(v17)
                let v19 = "length"
                let v20 = atom.create(v19)
                let v21 = []
                let v22 = [v16, ..v21]
                let v23 = erlang_term_apply(v18, v20, v22)
                let v24 = erlang_term_coerce(v23)
                let v25 = 0
                let v26 = method444(v24, v16, v25)
                case v26  {
                    Uh29Nil -> False
                    _ -> True
                }
            }
            False -> False
        }
    let v29 = "refs"
    let v30 = erlang_term_coerce(v29)
    let v31 = []
    let v32 = erlang_term_coerce(v31)
    let v33 = "maps"
    let v34 = atom.create(v33)
    let v35 = "get"
    let v36 = atom.create(v35)
    let v37 = []
    let v38 = [v32, ..v37]
    let v39 = [v0, ..v38]
    let v40 = [v30, ..v39]
    let v41 = erlang_term_apply(v34, v36, v40)
    let v46 =
        case v28 {
            True -> {
                let v42 = "referenced_posts"
                let v43 = Uh38Nil
                Uh38Cons(v42, v41, v43)
            }
            False -> Uh38Nil
        }
    let v47 = []
    let v48 = erlang_term_coerce(v47)
    let v49 = atom.create(v33)
    let v50 = "from_list"
    let v51 = atom.create(v50)
    let v52 = []
    let v53 = [v48, ..v52]
    let v54 = erlang_term_apply(v49, v51, v53)
    let v55 = "metrics"
    let v56 = erlang_term_coerce(v55)
    let v57 = atom.create(v33)
    let v58 = atom.create(v35)
    let v59 = []
    let v60 = [v54, ..v59]
    let v61 = [v0, ..v60]
    let v62 = [v56, ..v61]
    let v63 = erlang_term_apply(v57, v58, v62)
    let v64 = erlang_term_coerce(0)
    let v65 = "repost_count"
    let v66 = erlang_term_coerce(v65)
    let v67 = atom.create(v33)
    let v68 = atom.create(v35)
    let v69 = []
    let v70 = [v64, ..v69]
    let v71 = [v63, ..v70]
    let v72 = [v66, ..v71]
    let v73 = erlang_term_apply(v67, v68, v72)
    let v74 = erlang_term_coerce(0)
    let v75 = "reply_count"
    let v76 = erlang_term_coerce(v75)
    let v77 = atom.create(v33)
    let v78 = atom.create(v35)
    let v79 = []
    let v80 = [v74, ..v79]
    let v81 = [v63, ..v80]
    let v82 = [v76, ..v81]
    let v83 = erlang_term_apply(v77, v78, v82)
    let v84 = erlang_term_coerce(0)
    let v85 = "quote_count"
    let v86 = erlang_term_coerce(v85)
    let v87 = atom.create(v33)
    let v88 = atom.create(v35)
    let v89 = []
    let v90 = [v84, ..v89]
    let v91 = [v63, ..v90]
    let v92 = [v86, ..v91]
    let v93 = erlang_term_apply(v87, v88, v92)
    let v94 = erlang_term_coerce(0)
    let v95 = "like_count"
    let v96 = erlang_term_coerce(v95)
    let v97 = atom.create(v33)
    let v98 = atom.create(v35)
    let v99 = []
    let v100 = [v94, ..v99]
    let v101 = [v63, ..v100]
    let v102 = [v96, ..v101]
    let v103 = erlang_term_apply(v97, v98, v102)
    let v104 = erlang_term_coerce(0)
    let v105 = "impression_count"
    let v106 = erlang_term_coerce(v105)
    let v107 = atom.create(v33)
    let v108 = atom.create(v35)
    let v109 = []
    let v110 = [v104, ..v109]
    let v111 = [v63, ..v110]
    let v112 = [v106, ..v111]
    let v113 = erlang_term_apply(v107, v108, v112)
    let v114 = erlang_term_coerce(0)
    let v115 = "bookmark_count"
    let v116 = erlang_term_coerce(v115)
    let v117 = atom.create(v33)
    let v118 = atom.create(v35)
    let v119 = []
    let v120 = [v114, ..v119]
    let v121 = [v63, ..v120]
    let v122 = [v116, ..v121]
    let v123 = erlang_term_apply(v117, v118, v122)
    let v124 = atom.create(v65)
    let v125 = erlang_term_coerce(v124)
    let v126 = []
    let v127 = [v73, ..v126]
    let v128 = [v125, ..v127]
    let v129 = erlang_term_tuple(v128)
    let v130 = atom.create(v75)
    let v131 = erlang_term_coerce(v130)
    let v132 = []
    let v133 = [v83, ..v132]
    let v134 = [v131, ..v133]
    let v135 = erlang_term_tuple(v134)
    let v136 = atom.create(v85)
    let v137 = erlang_term_coerce(v136)
    let v138 = []
    let v139 = [v93, ..v138]
    let v140 = [v137, ..v139]
    let v141 = erlang_term_tuple(v140)
    let v142 = atom.create(v95)
    let v143 = erlang_term_coerce(v142)
    let v144 = []
    let v145 = [v103, ..v144]
    let v146 = [v143, ..v145]
    let v147 = erlang_term_tuple(v146)
    let v148 = atom.create(v105)
    let v149 = erlang_term_coerce(v148)
    let v150 = []
    let v151 = [v113, ..v150]
    let v152 = [v149, ..v151]
    let v153 = erlang_term_tuple(v152)
    let v154 = atom.create(v115)
    let v155 = erlang_term_coerce(v154)
    let v156 = []
    let v157 = [v123, ..v156]
    let v158 = [v155, ..v157]
    let v159 = erlang_term_tuple(v158)
    let v160 = []
    let v161 = [v129, ..v160]
    let v162 = [v135, ..v161]
    let v163 = [v141, ..v162]
    let v164 = [v147, ..v163]
    let v165 = [v153, ..v164]
    let v166 = [v159, ..v165]
    let v167 = erlang_term_coerce(v166)
    let v168 = atom.create(v33)
    let v169 = atom.create(v50)
    let v170 = []
    let v171 = [v167, ..v170]
    let v172 = erlang_term_apply(v168, v169, v171)
    let v173 = method530()
    let v174 = method531(v173, v1)
    let v179 =
        case v174 {
            True -> {
                let v175 = "public_metrics"
                let v176 = Uh38Nil
                Uh38Cons(v175, v172, v176)
            }
            False -> Uh38Nil
        }
    method466(v179, v46)
}

pub fn closure158(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "attachments"
        v1
    }
}

pub fn method532() -> fn(String) -> Bool {
    closure158(Nil)
}

pub fn method533(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method532()
                    method533(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn method534(v0: Uh29, v1: Uh29) -> Uh29 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method534(v3, v1)
            let v5 = "media_key"
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
            Uh29Cons(v17, v4)
        }
        Uh29Nil -> v1
    }
}
