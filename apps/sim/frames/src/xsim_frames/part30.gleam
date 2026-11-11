import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import xsim_frames/types.{type Uh3, type Uh29, type Uh37, type Uh36, type Uh38, Uh29Cons, Uh29Nil, Uh37Cons, Uh37Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil, Us108None, Us108Some, Us111Error, Us111Ok}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part12.{items_from_301}
import xsim_frames/part25.{first_value_465, merged_461, method454, method456, method458, method462}
import xsim_frames/part28.{method549, method550}
import xsim_frames/part29.{method565, method566, method568, method569, method570, method571, method572, method573, method574, method575, method576}

pub fn method567(v0: Uh3, v1: Uh29, v2: Uh29) -> Uh29 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method567(v0, v4, v2)
            let v6 = method568()
            let v7 = method569(v6, v0)
            let v36 =
                case v7 {
                    True -> {
                        let v8 = []
                        let v9 = erlang_term_coerce(v8)
                        let v11 = erlang_term_coerce("refs")
                        let v12 = erlang_term_coerce(v9)
                        let v14 = atom.create("maps")
                        let v16 = atom.create("get")
                        let v17 = []
                        let v18 = [v12, ..v17]
                        let v19 = [v3, ..v18]
                        let v20 = [v11, ..v19]
                        let v21 = erlang_term_apply(v14, v16, v20)
                        let v22 = erlang_term_coerce(v21)
                        let v24 = atom.create("lists")
                        let v26 = atom.create("reverse")
                        let v27 = []
                        let v28 = [v22, ..v27]
                        let v29 = erlang_term_apply(v24, v26, v28)
                        let v31 = items_from_301(v29, Uh29Nil)
                        let v33 = method570(v31, Uh3Nil)
                        let v34 = method571()
                        method572(v34, v33)
                    }
                    False -> False
                }
            let v68 =
                case v36 {
                    True -> True
                    False -> {
                        let v37 = method573()
                        let v38 = method574(v37, v0)
                        case v38 {
                            True -> {
                                let v39 = []
                                let v40 = erlang_term_coerce(v39)
                                let v42 = erlang_term_coerce("refs")
                                let v43 = erlang_term_coerce(v40)
                                let v45 = atom.create("maps")
                                let v47 = atom.create("get")
                                let v48 = []
                                let v49 = [v43, ..v48]
                                let v50 = [v3, ..v49]
                                let v51 = [v42, ..v50]
                                let v52 = erlang_term_apply(v45, v47, v51)
                                let v53 = erlang_term_coerce(v52)
                                let v55 = atom.create("lists")
                                let v57 = atom.create("reverse")
                                let v58 = []
                                let v59 = [v53, ..v58]
                                let v60 = erlang_term_apply(v55, v57, v59)
                                let v62 = items_from_301(v60, Uh29Nil)
                                let v64 = method570(v62, Uh3Nil)
                                let v65 = method575()
                                method576(v65, v64)
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

pub fn method577(v0: String, v1: Uh29, v2: Uh29) -> Uh29 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method577(v0, v4, v2)
            let v6 = v0 == ""
            let v36 =
                case v6 {
                    True -> True
                    False -> {
                        let v8 = erlang_term_coerce("")
                        let v10 = erlang_term_coerce("created_at")
                        let v11 = erlang_term_coerce(v8)
                        let v13 = atom.create("maps")
                        let v15 = atom.create("get")
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
                        let v28 = atom.create("erlang")
                        let v30 = atom.create(">=")
                        let v31 = []
                        let v32 = [v26, ..v31]
                        let v33 = [v25, ..v32]
                        let v34 = erlang_term_apply(v28, v30, v33)
                        erlang_term_coerce(v34)
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

pub fn method578(v0: String, v1: Uh29, v2: Uh29) -> Uh29 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method578(v0, v4, v2)
            let v6 = v0 == ""
            let v37 =
                case v6 {
                    True -> True
                    False -> {
                        let v8 = erlang_term_coerce("")
                        let v10 = erlang_term_coerce("created_at")
                        let v11 = erlang_term_coerce(v8)
                        let v13 = atom.create("maps")
                        let v15 = atom.create("get")
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
                        let v28 = atom.create("erlang")
                        let v30 = atom.create(">=")
                        let v31 = []
                        let v32 = [v26, ..v31]
                        let v33 = [v25, ..v32]
                        let v34 = erlang_term_apply(v28, v30, v33)
                        let v35 = erlang_term_coerce(v34)
                        v35 == False
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

pub fn timeline_posts_564(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Dynamic, v16: String) -> Uh29 {
    let v18 = v16 == ""
    let v22 =
        case v18 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v16)
            }
        }
    let v23 = first_value_465("exclude", v22)
    let v24 = v23 == ""
    let v28 =
        case v24 {
            True -> Uh3Nil
            False -> {
                split_list_2(",", v23)
            }
        }
    let v30 = method565(v28, Uh3Nil)
    let v31 = []
    let v32 = erlang_term_coerce(v31)
    let v34 = erlang_term_coerce("posts")
    let v35 = erlang_term_coerce(v32)
    let v37 = atom.create("maps")
    let v39 = atom.create("get")
    let v40 = []
    let v41 = [v35, ..v40]
    let v42 = [v15, ..v41]
    let v43 = [v34, ..v42]
    let v44 = erlang_term_apply(v37, v39, v43)
    let v45 = erlang_term_coerce(v44)
    let v47 = atom.create("lists")
    let v49 = atom.create("reverse")
    let v50 = []
    let v51 = [v45, ..v50]
    let v52 = erlang_term_apply(v47, v49, v51)
    let v54 = items_from_301(v52, Uh29Nil)
    let v56 = method566(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v54, Uh29Nil)
    let v58 = method454(v15, v56, Uh29Nil)
    let v60 = method567(v30, v58, Uh29Nil)
    let v65 =
        case v18 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v16)
            }
        }
    let v66 = first_value_465("start_time", v65)
    let v67 = v66 == ""
    let v69 =
        case v67 {
            True -> {
                ""
            }
            False -> v66
        }
    let v71 = method577(v69, v60, Uh29Nil)
    let v76 =
        case v18 {
            True -> Uh3Nil
            False -> {
                split_list_2("&", v16)
            }
        }
    let v77 = first_value_465("end_time", v76)
    let v78 = v77 == ""
    let v80 =
        case v78 {
            True -> {
                ""
            }
            False -> v77
        }
    method578(v80, v71, Uh29Nil)
}

pub fn closure160(capt: #(Dynamic)) -> fn(Dynamic) -> Bool {
    fn (v1) {
        let #(v0) = capt
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
        let v13 = [v1, ..v12]
        let v14 = [v5, ..v13]
        let v15 = erlang_term_apply(v8, v10, v14)
        let v16 = erlang_term_coerce(v15)
        let v17 = erlang_term_coerce(v16)
        let v18 = spiral_string_slice(v17, 0, 18)
        let v19 = erlang_term_coerce(v2)
        let v20 = erlang_term_coerce(v4)
        let v21 = erlang_term_coerce(v19)
        let v22 = atom.create(v7)
        let v23 = atom.create(v9)
        let v24 = []
        let v25 = [v21, ..v24]
        let v26 = [v0, ..v25]
        let v27 = [v20, ..v26]
        let v28 = erlang_term_apply(v22, v23, v27)
        let v29 = erlang_term_coerce(v28)
        let v30 = erlang_term_coerce(v29)
        let v31 = spiral_string_slice(v30, 0, 18)
        let v32 = v18 == v31
        let v141 =
            case v32 {
                True -> {
                    let v33 = erlang_term_coerce(v2)
                    let v34 = "id"
                    let v35 = erlang_term_coerce(v34)
                    let v36 = erlang_term_coerce(v33)
                    let v37 = atom.create(v7)
                    let v38 = atom.create(v9)
                    let v39 = []
                    let v40 = [v36, ..v39]
                    let v41 = [v1, ..v40]
                    let v42 = [v35, ..v41]
                    let v43 = erlang_term_apply(v37, v38, v42)
                    let v44 = erlang_term_coerce(v43)
                    let v45 = "erlang"
                    let v46 = atom.create(v45)
                    let v47 = "is_binary"
                    let v48 = atom.create(v47)
                    let v49 = []
                    let v50 = [v44, ..v49]
                    let v51 = erlang_term_apply(v46, v48, v50)
                    let v52 = erlang_term_coerce(v51)
                    let v61 =
                        case v52 {
                            True -> {
                                erlang_term_coerce(v44)
                            }
                            False -> {
                                let v54 = atom.create(v45)
                                let v56 = atom.create("integer_to_binary")
                                let v57 = []
                                let v58 = [v44, ..v57]
                                let v59 = erlang_term_apply(v54, v56, v58)
                                erlang_term_coerce(v59)
                            }
                        }
                    let v62 = erlang_term_coerce(v2)
                    let v63 = erlang_term_coerce(v34)
                    let v64 = erlang_term_coerce(v62)
                    let v65 = atom.create(v7)
                    let v66 = atom.create(v9)
                    let v67 = []
                    let v68 = [v64, ..v67]
                    let v69 = [v0, ..v68]
                    let v70 = [v63, ..v69]
                    let v71 = erlang_term_apply(v65, v66, v70)
                    let v72 = erlang_term_coerce(v71)
                    let v73 = atom.create(v45)
                    let v74 = atom.create(v47)
                    let v75 = []
                    let v76 = [v72, ..v75]
                    let v77 = erlang_term_apply(v73, v74, v76)
                    let v78 = erlang_term_coerce(v77)
                    let v87 =
                        case v78 {
                            True -> {
                                erlang_term_coerce(v72)
                            }
                            False -> {
                                let v80 = atom.create(v45)
                                let v82 = atom.create("integer_to_binary")
                                let v83 = []
                                let v84 = [v72, ..v83]
                                let v85 = erlang_term_apply(v80, v82, v84)
                                erlang_term_coerce(v85)
                            }
                        }
                    let v88 = spiral_string_length(v61)
                    let v89 = spiral_string_length(v87)
                    let v90 = spiral_wrap_signed(v88 - v89, 32)
                    let v91 = v90 == 0
                    case v91 {
                        True -> {
                            let v92 = erlang_term_coerce(v61)
                            let v93 = erlang_term_coerce(v87)
                            let v94 = atom.create(v45)
                            let v96 = atom.create(">=")
                            let v97 = []
                            let v98 = [v93, ..v97]
                            let v99 = [v92, ..v98]
                            let v100 = erlang_term_apply(v94, v96, v99)
                            erlang_term_coerce(v100)
                        }
                        False -> {
                            v90 > 0
                        }
                    }
                }
                False -> {
                    let v104 = erlang_term_coerce(v2)
                    let v105 = erlang_term_coerce(v4)
                    let v106 = erlang_term_coerce(v104)
                    let v107 = atom.create(v7)
                    let v108 = atom.create(v9)
                    let v109 = []
                    let v110 = [v106, ..v109]
                    let v111 = [v1, ..v110]
                    let v112 = [v105, ..v111]
                    let v113 = erlang_term_apply(v107, v108, v112)
                    let v114 = erlang_term_coerce(v113)
                    let v115 = erlang_term_coerce(v114)
                    let v116 = spiral_string_slice(v115, 0, 18)
                    let v117 = erlang_term_coerce(v2)
                    let v118 = erlang_term_coerce(v4)
                    let v119 = erlang_term_coerce(v117)
                    let v120 = atom.create(v7)
                    let v121 = atom.create(v9)
                    let v122 = []
                    let v123 = [v119, ..v122]
                    let v124 = [v0, ..v123]
                    let v125 = [v118, ..v124]
                    let v126 = erlang_term_apply(v120, v121, v125)
                    let v127 = erlang_term_coerce(v126)
                    let v128 = erlang_term_coerce(v127)
                    let v129 = spiral_string_slice(v128, 0, 18)
                    let v130 = erlang_term_coerce(v116)
                    let v131 = erlang_term_coerce(v129)
                    let v133 = atom.create("erlang")
                    let v135 = atom.create(">=")
                    let v136 = []
                    let v137 = [v131, ..v136]
                    let v138 = [v130, ..v137]
                    let v139 = erlang_term_apply(v133, v135, v138)
                    erlang_term_coerce(v139)
                }
            }
        v141 == False
    }
}

pub fn closure159(capt: Nil) -> fn(Dynamic) -> fn(Dynamic) -> Bool {
    fn (v0) {
        closure160(#(v0))
    }
}

pub fn falling_581(v0: fn(Dynamic) -> fn(Dynamic) -> Bool, v1: Uh29, v2: Uh29) -> #(Uh29, Uh29) {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v10 =
                case v2  {
                    Uh29Cons(v5, v6) -> {
                        let v7 = v0(v3)
                        v7(v5)
                    }
                    Uh29Nil -> True
                }
            case v10 {
                True -> {
                    let v11 = Uh29Cons(v3, v2)
                    falling_581(v0, v4, v11)
                }
                False -> #(v2, v1)
            }
        }
        _ -> #(v2, v1)
    }
}

pub fn rising_582(v0: fn(Dynamic) -> fn(Dynamic) -> Bool, v1: Uh29, v2: Uh29) -> #(Uh29, Uh29) {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v11 =
                case v2  {
                    Uh29Cons(v5, v6) -> {
                        let v7 = v0(v3)
                        let v8 = v7(v5)
                        v8 == False
                    }
                    Uh29Nil -> True
                }
            case v11 {
                True -> {
                    let v12 = Uh29Cons(v3, v2)
                    rising_582(v0, v4, v12)
                }
                False -> {
                    let v16 = method456(v2, Uh29Nil)
                    #(v16, v1)
                }
            }
        }
        _ -> {
            let v20 = method456(v2, Uh29Nil)
            #(v20, v1)
        }
    }
}

pub fn runs_of_580(v0: fn(Dynamic) -> fn(Dynamic) -> Bool, v1: Uh29, v2: Uh38) -> Uh38 {
    case v1  {
        Uh29Cons(v5, v6) -> {
            case v6  {
                Uh29Cons(v7, v8) -> {
                    let v9 = v0(v7)
                    let v10 = v9(v5)
                    case v10 {
                        True -> {
                            let #(v12, v13) = falling_581(v0, v1, Uh29Nil)
                            let v14 = Uh38Cons(v12, v2)
                            runs_of_580(v0, v13, v14)
                        }
                        False -> {
                            let #(v17, v18) = rising_582(v0, v1, Uh29Nil)
                            let v19 = Uh38Cons(v17, v2)
                            runs_of_580(v0, v18, v19)
                        }
                    }
                }
                _ -> {
                    let #(v23, v24) = rising_582(v0, v1, Uh29Nil)
                    let v25 = Uh38Cons(v23, v2)
                    runs_of_580(v0, v24, v25)
                }
            }
        }
        Uh29Nil -> {
            method458(v2, Uh38Nil)
        }
    }
}

pub fn merged_pairs_584(v0: fn(Dynamic) -> fn(Dynamic) -> Bool, v1: Uh38) -> Uh38 {
    case v1  {
        Uh38Cons(v2, v3) -> {
            case v3  {
                Uh38Cons(v4, v5) -> {
                    let v7 = merged_461(v0, v2, v4, Uh29Nil)
                    let v8 = merged_pairs_584(v0, v5)
                    Uh38Cons(v7, v8)
                }
                _ -> v1
            }
        }
        _ -> v1
    }
}

pub fn merged_all_583(v0: fn(Dynamic) -> fn(Dynamic) -> Bool, v1: Uh38) -> Uh29 {
    case v1  {
        Uh38Cons(v3, v4) -> {
            case v4  {
                Uh38Nil -> v3
                _ -> {
                    let v5 = merged_pairs_584(v0, v1)
                    merged_all_583(v0, v5)
                }
            }
        }
        Uh38Nil -> Uh29Nil
    }
}

pub fn sorted_by_579(v0: fn(Dynamic) -> fn(Dynamic) -> Bool, v1: Uh29) -> Uh29 {
    let v3 = runs_of_580(v0, v1, Uh38Nil)
    merged_all_583(v0, v3)
}

pub fn closure161(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        v0 == "referenced_posts.author_id"
    }
}

pub fn method588() -> fn(String) -> Bool {
    closure161(Nil)
}

pub fn method589(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method588()
                    method589(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn closure162(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        v0 == "referenced_posts"
    }
}

pub fn method591() -> fn(String) -> Bool {
    closure162(Nil)
}

pub fn method592(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method591()
                    method592(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn method590(v0: Uh3, v1: Uh3, v2: Uh3, v3: Uh29, v4: Uh29) -> Uh29 {
    case v3  {
        Uh29Cons(v5, v6) -> {
            let v7 = method590(v0, v1, v2, v6, v4)
            let v8 = method591()
            let v9 = method592(v8, v1)
            let v35 =
                case v9 {
                    True -> {
                        let v10 = []
                        let v11 = erlang_term_coerce(v10)
                        let v13 = erlang_term_coerce("refs")
                        let v14 = erlang_term_coerce(v11)
                        let v16 = atom.create("maps")
                        let v18 = atom.create("get")
                        let v19 = []
                        let v20 = [v14, ..v19]
                        let v21 = [v5, ..v20]
                        let v22 = [v13, ..v21]
                        let v23 = erlang_term_apply(v16, v18, v22)
                        let v24 = erlang_term_coerce(v23)
                        let v26 = atom.create("lists")
                        let v28 = atom.create("reverse")
                        let v29 = []
                        let v30 = [v24, ..v29]
                        let v31 = erlang_term_apply(v26, v28, v30)
                        let v33 = items_from_301(v31, Uh29Nil)
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

pub fn method594(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method594(v3, v1)
            let v6 = erlang_term_coerce("")
            let v8 = erlang_term_coerce("id")
            let v9 = erlang_term_coerce(v6)
            let v11 = atom.create("maps")
            let v13 = atom.create("get")
            let v14 = []
            let v15 = [v9, ..v14]
            let v16 = [v2, ..v15]
            let v17 = [v8, ..v16]
            let v18 = erlang_term_apply(v11, v13, v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = "erlang"
            let v21 = atom.create(v20)
            let v23 = atom.create("is_binary")
            let v24 = []
            let v25 = [v19, ..v24]
            let v26 = erlang_term_apply(v21, v23, v25)
            let v27 = erlang_term_coerce(v26)
            let v36 =
                case v27 {
                    True -> {
                        erlang_term_coerce(v19)
                    }
                    False -> {
                        let v29 = atom.create(v20)
                        let v31 = atom.create("integer_to_binary")
                        let v32 = []
                        let v33 = [v19, ..v32]
                        let v34 = erlang_term_apply(v29, v31, v33)
                        erlang_term_coerce(v34)
                    }
                }
            Uh3Cons(v36, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method595(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Uh3, v16: Uh3) -> Uh3 {
    case v15  {
        Uh3Cons(v17, v18) -> {
            let v19 = method595(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v18, v16)
            let v20 = dict.has_key(v5, v17)
            case v20 {
                True -> Uh3Cons(v17, v19)
                False -> v19
            }
        }
        Uh3Nil -> v16
    }
}

pub fn method596(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Uh3, v16: Uh29) -> Uh29 {
    case v15  {
        Uh3Cons(v17, v18) -> {
            let v19 = method596(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v18, v16)
            let v20 = dict.get(v5, v17)
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
            Uh29Cons(v32, v19)
        }
        Uh3Nil -> v16
    }
}

pub fn method593(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Uh29, v16: Uh38) -> Uh38 {
    case v15  {
        Uh29Cons(v17, v18) -> {
            let v19 = method593(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v18, v16)
            let v20 = []
            let v21 = erlang_term_coerce(v20)
            let v23 = erlang_term_coerce("refs")
            let v24 = erlang_term_coerce(v21)
            let v26 = atom.create("maps")
            let v28 = atom.create("get")
            let v29 = []
            let v30 = [v24, ..v29]
            let v31 = [v17, ..v30]
            let v32 = [v23, ..v31]
            let v33 = erlang_term_apply(v26, v28, v32)
            let v34 = erlang_term_coerce(v33)
            let v36 = atom.create("lists")
            let v38 = atom.create("reverse")
            let v39 = []
            let v40 = [v34, ..v39]
            let v41 = erlang_term_apply(v36, v38, v40)
            let v43 = items_from_301(v41, Uh29Nil)
            let v45 = method594(v43, Uh3Nil)
            let v47 = method595(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v45, Uh3Nil)
            let v49 = method596(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v47, Uh29Nil)
            Uh38Cons(v49, v19)
        }
        Uh29Nil -> v16
    }
}

pub fn method597(v0: Uh38, v1: Uh29) -> Uh29 {
    case v0  {
        Uh38Cons(v2, v3) -> {
            let v4 = method597(v3, v1)
            method462(v2, v4)
        }
        Uh38Nil -> v1
    }
}

pub fn method598(v0: Uh29, v1: Uh37) -> Uh37 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method598(v3, v1)
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
            let v23 = atom.create("is_binary")
            let v24 = []
            let v25 = [v19, ..v24]
            let v26 = erlang_term_apply(v21, v23, v25)
            let v27 = erlang_term_coerce(v26)
            let v36 =
                case v27 {
                    True -> {
                        erlang_term_coerce(v19)
                    }
                    False -> {
                        let v29 = atom.create(v20)
                        let v31 = atom.create("integer_to_binary")
                        let v32 = []
                        let v33 = [v19, ..v32]
                        let v34 = erlang_term_apply(v29, v31, v33)
                        erlang_term_coerce(v34)
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
            let v49 = atom.create("id")
            let v50 = erlang_term_coerce(v49)
            let v51 = []
            let v52 = [v47, ..v51]
            let v53 = [v50, ..v52]
            let v54 = erlang_term_tuple(v53)
            let v55 = []
            let v56 = [v54, ..v55]
            let v57 = erlang_term_coerce(v56)
            let v58 = atom.create(v10)
            let v60 = atom.create("from_list")
            let v61 = []
            let v62 = [v57, ..v61]
            let v63 = erlang_term_apply(v58, v60, v62)
            Uh37Cons(v36, v63, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn included_authors_587(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Uh3, v16: Uh3, v17: Uh3, v18: Uh29) -> Uh37 {
    let v19 = method588()
    let v20 = method589(v19, v16)
    case v20 {
        True -> {
            let v22 = method590(v15, v16, v17, v18, Uh29Nil)
            let v24 = method593(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v22, Uh38Nil)
            let v26 = method597(v24, Uh29Nil)
            method598(v26, Uh37Nil)
        }
        False -> Uh37Nil
    }
}

pub fn deduped_599(v0: dict.Dict(String, Nil), v1: Uh37) -> Uh29 {
    case v1  {
        Uh37Cons(v2, v3, v4) -> {
            let v5 = dict.has_key(v0, v2)
            case v5 {
                True -> deduped_599(v0, v4)
                False -> {
                    let v7 = dict.insert(v0, v2, Nil)
                    let v8 = deduped_599(v7, v4)
                    Uh29Cons(v3, v8)
                }
            }
        }
        Uh37Nil -> Uh29Nil
    }
}

pub fn closure163(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        v0 == "created_at"
    }
}

pub fn method603() -> fn(String) -> Bool {
    closure163(Nil)
}

pub fn method604(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method603()
                    method604(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn closure164(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        v0 == "conversation_id"
    }
}

pub fn method605() -> fn(String) -> Bool {
    closure164(Nil)
}

pub fn method606(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method605()
                    method606(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn closure165(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        v0 == "author_id"
    }
}

pub fn method607() -> fn(String) -> Bool {
    closure165(Nil)
}

pub fn method608(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method607()
                    method608(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}
