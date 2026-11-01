import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Uh38, type Uh40, Uh29Cons, Uh29Nil, Uh37Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil, Uh40Cons, Uh40Nil, Us2None, Us2Some, Us3None, Us3Some}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, split_list_2}
import xsim_frames/part13.{method301}
import xsim_frames/part26.{method444}
import xsim_frames/part27.{method450, method466, method467}
import xsim_frames/part28.{first_value_474, method481, sliced_480}
import xsim_frames/part29.{method488, timeline_fault_485}
import xsim_frames/part30.{counted_pairs_529, deduped_516, included_authors_508, method504, method511, method512, method513, method514, method527, method528, method532, method533, method534, simple_pairs_519, timeline_posts_487}

pub fn nested_pairs_526(v0: Dynamic, v1: Uh3) -> Uh38 {
    let v2 = method527()
    let v3 = method528(v2, v1)
    let v28 =
        case v3 {
            True -> {
                let v4 = "urls"
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
    let v29 = "urls"
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
    let v42 = atom.create(v29)
    let v43 = erlang_term_coerce(v42)
    let v44 = []
    let v45 = [v41, ..v44]
    let v46 = [v43, ..v45]
    let v47 = erlang_term_tuple(v46)
    let v48 = []
    let v49 = [v47, ..v48]
    let v50 = erlang_term_coerce(v49)
    let v51 = atom.create(v33)
    let v52 = "from_list"
    let v53 = atom.create(v52)
    let v54 = []
    let v55 = [v50, ..v54]
    let v56 = erlang_term_apply(v51, v53, v55)
    let v61 =
        case v28 {
            True -> {
                let v57 = "entities"
                let v58 = Uh38Nil
                Uh38Cons(v57, v56, v58)
            }
            False -> Uh38Nil
        }
    let v62 = counted_pairs_529(v0, v1)
    let v63 = method532()
    let v64 = method533(v63, v1)
    let v87 =
        case v64 {
            True -> {
                let v65 = "media"
                let v66 = erlang_term_coerce(v65)
                let v67 = []
                let v68 = erlang_term_coerce(v67)
                let v69 = atom.create(v33)
                let v70 = atom.create(v35)
                let v71 = []
                let v72 = [v68, ..v71]
                let v73 = [v0, ..v72]
                let v74 = [v66, ..v73]
                let v75 = erlang_term_apply(v69, v70, v74)
                let v76 = "erlang"
                let v77 = atom.create(v76)
                let v78 = "length"
                let v79 = atom.create(v78)
                let v80 = []
                let v81 = [v75, ..v80]
                let v82 = erlang_term_apply(v77, v79, v81)
                let v83 = erlang_term_coerce(v82)
                let v84 = 0
                let v85 = method444(v83, v75, v84)
                case v85  {
                    Uh29Nil -> False
                    _ -> True
                }
            }
            False -> False
        }
    let v88 = "media"
    let v89 = erlang_term_coerce(v88)
    let v90 = []
    let v91 = erlang_term_coerce(v90)
    let v92 = atom.create(v33)
    let v93 = atom.create(v35)
    let v94 = []
    let v95 = [v91, ..v94]
    let v96 = [v0, ..v95]
    let v97 = [v89, ..v96]
    let v98 = erlang_term_apply(v92, v93, v97)
    let v99 = "erlang"
    let v100 = atom.create(v99)
    let v101 = "length"
    let v102 = atom.create(v101)
    let v103 = []
    let v104 = [v98, ..v103]
    let v105 = erlang_term_apply(v100, v102, v104)
    let v106 = erlang_term_coerce(v105)
    let v107 = 0
    let v108 = method444(v106, v98, v107)
    let v109 = Uh29Nil
    let v110 = method534(v108, v109)
    let v111 = []
    let v112 = method301(v110, v111)
    let v113 = erlang_term_coerce(v112)
    let v114 = "media_keys"
    let v115 = atom.create(v114)
    let v116 = erlang_term_coerce(v115)
    let v117 = []
    let v118 = [v113, ..v117]
    let v119 = [v116, ..v118]
    let v120 = erlang_term_tuple(v119)
    let v121 = []
    let v122 = [v120, ..v121]
    let v123 = erlang_term_coerce(v122)
    let v124 = atom.create(v33)
    let v125 = atom.create(v52)
    let v126 = []
    let v127 = [v123, ..v126]
    let v128 = erlang_term_apply(v124, v125, v127)
    let v133 =
        case v87 {
            True -> {
                let v129 = "attachments"
                let v130 = Uh38Nil
                Uh38Cons(v129, v128, v130)
            }
            False -> Uh38Nil
        }
    let v134 = Uh38Nil
    let v135 = method466(v133, v134)
    let v136 = method466(v61, v135)
    method466(v62, v136)
}

pub fn rendered_518(v0: Dynamic, v1: Uh3) -> Dynamic {
    let v2 = "id"
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
    let v15 = "text"
    let v16 = erlang_term_coerce(v15)
    let v17 = erlang_term_coerce(v4)
    let v18 = atom.create(v6)
    let v19 = atom.create(v8)
    let v20 = []
    let v21 = [v17, ..v20]
    let v22 = [v0, ..v21]
    let v23 = [v16, ..v22]
    let v24 = erlang_term_apply(v18, v19, v23)
    let v25 = erlang_term_coerce(v24)
    let v26 = "&"
    let v27 = "&amp;"
    let v28 = v25 |> string.replace(v26, v27)
    let v29 = "<"
    let v30 = "&lt;"
    let v31 = v28 |> string.replace(v29, v30)
    let v32 = ">"
    let v33 = "&gt;"
    let v34 = v31 |> string.replace(v32, v33)
    let v35 = erlang_term_coerce(v34)
    let v36 = erlang_term_coerce(v2)
    let v37 = erlang_term_coerce(v4)
    let v38 = atom.create(v6)
    let v39 = atom.create(v8)
    let v40 = []
    let v41 = [v37, ..v40]
    let v42 = [v0, ..v41]
    let v43 = [v36, ..v42]
    let v44 = erlang_term_apply(v38, v39, v43)
    let v45 = []
    let v46 = [v44, ..v45]
    let v47 = erlang_term_coerce(v46)
    let v48 = "edit_history"
    let v49 = erlang_term_coerce(v48)
    let v50 = atom.create(v6)
    let v51 = atom.create(v8)
    let v52 = []
    let v53 = [v47, ..v52]
    let v54 = [v0, ..v53]
    let v55 = [v49, ..v54]
    let v56 = erlang_term_apply(v50, v51, v55)
    let v57 = simple_pairs_519(v0, v1)
    let v58 = nested_pairs_526(v0, v1)
    let v59 = Uh38Nil
    let v60 = method466(v58, v59)
    let v61 = method466(v57, v60)
    let v62 = Uh29Nil
    let v63 = method467(v61, v62)
    let v64 = "edit_history_post_ids"
    let v65 = atom.create(v64)
    let v66 = erlang_term_coerce(v65)
    let v67 = []
    let v68 = [v56, ..v67]
    let v69 = [v66, ..v68]
    let v70 = erlang_term_tuple(v69)
    let v71 = atom.create(v15)
    let v72 = erlang_term_coerce(v71)
    let v73 = []
    let v74 = [v35, ..v73]
    let v75 = [v72, ..v74]
    let v76 = erlang_term_tuple(v75)
    let v77 = atom.create(v2)
    let v78 = erlang_term_coerce(v77)
    let v79 = []
    let v80 = [v14, ..v79]
    let v81 = [v78, ..v80]
    let v82 = erlang_term_tuple(v81)
    let v83 = []
    let v84 = method301(v63, v83)
    let v85 = [v70, ..v84]
    let v86 = [v76, ..v85]
    let v87 = [v82, ..v86]
    let v88 = erlang_term_coerce(v87)
    let v89 = atom.create(v6)
    let v90 = "from_list"
    let v91 = atom.create(v90)
    let v92 = []
    let v93 = [v88, ..v92]
    let v94 = erlang_term_apply(v89, v91, v93)
    v94
}

pub fn method517(v0: Uh3, v1: Uh3, v2: Uh3, v3: Uh29, v4: Uh38) -> Uh38 {
    case v3  {
        Uh29Cons(v5, v6) -> {
            let v7 = method517(v0, v1, v2, v6, v4)
            let v8 = "id"
            let v9 = erlang_term_coerce(v8)
            let v10 = ""
            let v11 = erlang_term_coerce(v10)
            let v12 = "maps"
            let v13 = atom.create(v12)
            let v14 = "get"
            let v15 = atom.create(v14)
            let v16 = []
            let v17 = [v11, ..v16]
            let v18 = [v5, ..v17]
            let v19 = [v9, ..v18]
            let v20 = erlang_term_apply(v13, v15, v19)
            let v21 = "erlang"
            let v22 = atom.create(v21)
            let v23 = "is_binary"
            let v24 = atom.create(v23)
            let v25 = []
            let v26 = [v20, ..v25]
            let v27 = erlang_term_apply(v22, v24, v26)
            let v28 = erlang_term_coerce(v27)
            let v37 =
                case v28 {
                    True -> {
                        let v29 = erlang_term_coerce(v20)
                        v29
                    }
                    False -> {
                        let v30 = atom.create(v21)
                        let v31 = "integer_to_binary"
                        let v32 = atom.create(v31)
                        let v33 = []
                        let v34 = [v20, ..v33]
                        let v35 = erlang_term_apply(v30, v32, v34)
                        let v36 = erlang_term_coerce(v35)
                        v36
                    }
                }
            let v38 = rendered_518(v5, v0)
            Uh38Cons(v37, v38, v7)
        }
        Uh29Nil -> v4
    }
}

pub fn closure159(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "attachments.media_keys"
        v1
    }
}

pub fn method536() -> fn(String) -> Bool {
    closure159(Nil)
}

pub fn method537(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method536()
                    method537(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn method540(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method540(v3, v1)
            let v5 = erlang_term_coerce(v2)
            Uh3Cons(v5, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn closure160(capt: #(String)) -> fn(String) -> Bool {
    fn (v1) {
        let #(v0) = capt
        let v2 = v1 == v0
        v2
    }
}

pub fn method542(v0: String) -> fn(String) -> Bool {
    closure160(#(v0))
}

pub fn method543(v0: String, v1: fn(String) -> Bool, v2: Uh3) -> Bool {
    case v2  {
        Uh3Cons(v3, v4) -> {
            let v5 = v1(v3)
            case v5 {
                True -> True
                False -> {
                    let v6 = method542(v0)
                    method543(v0, v6, v4)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn method541(v0: Uh3, v1: Uh3, v2: Uh3, v3: Uh3, v4: Uh3) -> Uh3 {
    case v3  {
        Uh3Cons(v5, v6) -> {
            let v7 = method541(v0, v1, v2, v6, v4)
            let v8 = v5 == "media_key"
            let v11 =
                case v8 {
                    True -> True
                    False -> {
                        let v9 = method542(v5)
                        method543(v5, v9, v2)
                    }
                }
            case v11 {
                True -> Uh3Cons(v5, v7)
                False -> v7
            }
        }
        Uh3Nil -> v4
    }
}

pub fn method544(v0: Dynamic, v1: Uh3, v2: Uh38) -> Uh38 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method544(v0, v4, v2)
            let v6 = erlang_term_coerce(v3)
            let v7 = ""
            let v8 = erlang_term_coerce(v7)
            let v9 = "maps"
            let v10 = atom.create(v9)
            let v11 = "get"
            let v12 = atom.create(v11)
            let v13 = []
            let v14 = [v8, ..v13]
            let v15 = [v0, ..v14]
            let v16 = [v6, ..v15]
            let v17 = erlang_term_apply(v10, v12, v16)
            Uh38Cons(v3, v17, v5)
        }
        Uh3Nil -> v2
    }
}

pub fn method539(v0: Uh3, v1: Uh3, v2: Uh3, v3: Uh29, v4: Uh38) -> Uh38 {
    case v3  {
        Uh29Cons(v5, v6) -> {
            let v7 = method539(v0, v1, v2, v6, v4)
            let v8 = "media_key"
            let v9 = erlang_term_coerce(v8)
            let v10 = ""
            let v11 = erlang_term_coerce(v10)
            let v12 = "maps"
            let v13 = atom.create(v12)
            let v14 = "get"
            let v15 = atom.create(v14)
            let v16 = []
            let v17 = [v11, ..v16]
            let v18 = [v5, ..v17]
            let v19 = [v9, ..v18]
            let v20 = erlang_term_apply(v13, v15, v19)
            let v21 = erlang_term_coerce(v20)
            let v22 = atom.create(v12)
            let v23 = "keys"
            let v24 = atom.create(v23)
            let v25 = []
            let v26 = [v5, ..v25]
            let v27 = erlang_term_apply(v22, v24, v26)
            let v28 = "erlang"
            let v29 = atom.create(v28)
            let v30 = "length"
            let v31 = atom.create(v30)
            let v32 = []
            let v33 = [v27, ..v32]
            let v34 = erlang_term_apply(v29, v31, v33)
            let v35 = erlang_term_coerce(v34)
            let v36 = 0
            let v37 = method444(v35, v27, v36)
            let v38 = Uh3Nil
            let v39 = method540(v37, v38)
            let v40 = Uh3Nil
            let v41 = method541(v0, v1, v2, v39, v40)
            let v42 = Uh38Nil
            let v43 = method544(v5, v41, v42)
            let v44 = Uh29Nil
            let v45 = method467(v43, v44)
            let v46 = []
            let v47 = method301(v45, v46)
            let v48 = erlang_term_coerce(v47)
            let v49 = atom.create(v12)
            let v50 = "from_list"
            let v51 = atom.create(v50)
            let v52 = []
            let v53 = [v48, ..v52]
            let v54 = erlang_term_apply(v49, v51, v53)
            Uh38Cons(v21, v54, v7)
        }
        Uh29Nil -> v4
    }
}

pub fn method538(v0: Uh3, v1: Uh3, v2: Uh3, v3: Uh29, v4: Uh40) -> Uh40 {
    case v3  {
        Uh29Cons(v5, v6) -> {
            let v7 = method538(v0, v1, v2, v6, v4)
            let v8 = "media"
            let v9 = erlang_term_coerce(v8)
            let v10 = []
            let v11 = erlang_term_coerce(v10)
            let v12 = "maps"
            let v13 = atom.create(v12)
            let v14 = "get"
            let v15 = atom.create(v14)
            let v16 = []
            let v17 = [v11, ..v16]
            let v18 = [v5, ..v17]
            let v19 = [v9, ..v18]
            let v20 = erlang_term_apply(v13, v15, v19)
            let v21 = "erlang"
            let v22 = atom.create(v21)
            let v23 = "length"
            let v24 = atom.create(v23)
            let v25 = []
            let v26 = [v20, ..v25]
            let v27 = erlang_term_apply(v22, v24, v26)
            let v28 = erlang_term_coerce(v27)
            let v29 = 0
            let v30 = method444(v28, v20, v29)
            let v31 = Uh38Nil
            let v32 = method539(v0, v1, v2, v30, v31)
            Uh40Cons(v32, v7)
        }
        Uh29Nil -> v4
    }
}

pub fn method545(v0: Uh40, v1: Uh38) -> Uh38 {
    case v0  {
        Uh40Cons(v2, v3) -> {
            let v4 = method545(v3, v1)
            method466(v2, v4)
        }
        Uh40Nil -> v1
    }
}

pub fn included_media_535(v0: Uh3, v1: Uh3, v2: Uh3, v3: Uh29) -> Uh38 {
    let v4 = method536()
    let v5 = method537(v4, v1)
    case v5 {
        True -> {
            let v6 = Uh40Nil
            let v7 = method538(v0, v1, v2, v3, v6)
            let v8 = Uh38Nil
            method545(v7, v8)
        }
        False -> Uh38Nil
    }
}

pub fn includes_pairs_507(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh3, v14: Uh3, v15: Uh29) -> Uh38 {
    let v16 = included_authors_508(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15)
    let v17 = dict.new()
    let v18 = deduped_516(v17, v16)
    let v26 =
        case v18  {
            Uh29Nil -> Uh38Nil
            _ -> {
                let v20 = []
                let v21 = method301(v18, v20)
                let v22 = erlang_term_coerce(v21)
                let v23 = "users"
                let v24 = Uh38Nil
                Uh38Cons(v23, v22, v24)
            }
        }
    let v27 = Uh29Nil
    let v28 = method511(v12, v13, v14, v15, v27)
    let v29 = Uh37Nil
    let v30 = method514(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v28, v29)
    let v31 = Uh29Nil
    let v32 = method450(v30, v31)
    let v33 = Uh38Nil
    let v34 = method517(v12, v13, v14, v32, v33)
    let v35 = dict.new()
    let v36 = deduped_516(v35, v34)
    let v44 =
        case v36  {
            Uh29Nil -> Uh38Nil
            _ -> {
                let v38 = []
                let v39 = method301(v36, v38)
                let v40 = erlang_term_coerce(v39)
                let v41 = "posts"
                let v42 = Uh38Nil
                Uh38Cons(v41, v40, v42)
            }
        }
    let v45 = included_media_535(v12, v13, v14, v15)
    let v46 = dict.new()
    let v47 = deduped_516(v46, v45)
    let v55 =
        case v47  {
            Uh29Nil -> Uh38Nil
            _ -> {
                let v49 = []
                let v50 = method301(v47, v49)
                let v51 = erlang_term_coerce(v50)
                let v52 = "media"
                let v53 = Uh38Nil
                Uh38Cons(v52, v51, v53)
            }
        }
    let v56 = Uh38Nil
    let v57 = method466(v55, v56)
    let v58 = method466(v26, v57)
    method466(v44, v58)
}

pub fn data_item_547(v0: Uh3, v1: Uh3, _v2: Uh3, v3: Dynamic) -> Dynamic {
    let v4 = rendered_518(v3, v0)
    let v5 = method512()
    let v6 = method513(v5, v1)
    let v31 =
        case v6 {
            True -> {
                let v7 = "refs"
                let v8 = erlang_term_coerce(v7)
                let v9 = []
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
                let v20 = "erlang"
                let v21 = atom.create(v20)
                let v22 = "length"
                let v23 = atom.create(v22)
                let v24 = []
                let v25 = [v19, ..v24]
                let v26 = erlang_term_apply(v21, v23, v25)
                let v27 = erlang_term_coerce(v26)
                let v28 = 0
                let v29 = method444(v27, v19, v28)
                case v29  {
                    Uh29Nil -> False
                    _ -> True
                }
            }
            False -> False
        }
    case v31 {
        True -> {
            let v32 = "referenced_posts"
            let v33 = erlang_term_coerce(v32)
            let v34 = "refs"
            let v35 = erlang_term_coerce(v34)
            let v36 = []
            let v37 = erlang_term_coerce(v36)
            let v38 = "maps"
            let v39 = atom.create(v38)
            let v40 = "get"
            let v41 = atom.create(v40)
            let v42 = []
            let v43 = [v37, ..v42]
            let v44 = [v3, ..v43]
            let v45 = [v35, ..v44]
            let v46 = erlang_term_apply(v39, v41, v45)
            let v47 = atom.create(v38)
            let v48 = "put"
            let v49 = atom.create(v48)
            let v50 = []
            let v51 = [v4, ..v50]
            let v52 = [v46, ..v51]
            let v53 = [v33, ..v52]
            let v54 = erlang_term_apply(v47, v49, v53)
            v54
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
