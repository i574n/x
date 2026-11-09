import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import xsim_frames/types.{type Uh13, type Uh29, type Uh37, type Uh36, type Us99, type Uh39, type Uh43, Uh13Cons, Uh13Nil, Uh29Cons, Uh29Nil, Uh36Cons, Uh36Nil, Uh37Cons, Uh37Nil, Uh39Cons, Uh39Nil, Uh40ShownPost, Uh43Cons, Us100None, Us100Some, Us99None, Us99Some}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, spiral_string_length, spiral_string_slice, spiral_wrap_signed}

pub fn method470(v0: String, v1: Uh37, v2: Int) -> Int {
    case v1  {
        Uh37Cons(v3, v4, v5) -> {
            let v7 = erlang_term_coerce("")
            let v9 = erlang_term_coerce("created_at")
            let v10 = erlang_term_coerce(v7)
            let v12 = atom.create("maps")
            let v14 = atom.create("get")
            let v15 = []
            let v16 = [v10, ..v15]
            let v17 = [v4, ..v16]
            let v18 = [v9, ..v17]
            let v19 = erlang_term_apply(v12, v14, v18)
            let v20 = erlang_term_coerce(v19)
            let v21 = erlang_term_coerce(v20)
            let v22 = erlang_term_coerce(v21)
            let v23 = erlang_term_coerce(v0)
            let v25 = atom.create("erlang")
            let v27 = atom.create(">=")
            let v28 = []
            let v29 = [v23, ..v28]
            let v30 = [v22, ..v29]
            let v31 = erlang_term_apply(v25, v27, v30)
            let v32 = erlang_term_coerce(v31)
            let v34 =
                case v32 {
                    True -> {
                        spiral_wrap_signed(v2 + 1, 32)
                    }
                    False -> v2
                }
            method470(v0, v5, v34)
        }
        Uh37Nil -> v2
    }
}

pub fn method469(v0: String, v1: Uh36, v2: Uh13) -> Uh13 {
    case v1  {
        Uh36Cons(v3, v4) -> {
            let v5 = method469(v0, v4, v2)
            let v7 = method470(v0, v3, 0)
            Uh13Cons(v7, v5)
        }
        Uh36Nil -> v2
    }
}

pub fn method472(v0: Uh37, v1: Uh37) -> Uh37 {
    case v0  {
        Uh37Cons(v2, v3, v4) -> {
            let v5 = Uh37Cons(v2, v3, v1)
            method472(v4, v5)
        }
        Uh37Nil -> v1
    }
}

pub fn method471(v0: Uh36, v1: Uh36) -> Uh36 {
    case v0  {
        Uh36Cons(v2, v3) -> {
            let v4 = method471(v3, v1)
            let v6 = method472(v2, Uh37Nil)
            Uh36Cons(v6, v4)
        }
        Uh36Nil -> v1
    }
}

pub fn closure149(capt: #(String, Dynamic)) -> fn(#(String, Dynamic)) -> Bool {
    fn (dom) {
        let #(_v2, v3) = dom
        let #(_v0, v1) = capt
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
        let v15 = [v1, ..v14]
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
        let v28 = [v3, ..v27]
        let v29 = [v22, ..v28]
        let v30 = erlang_term_apply(v24, v25, v29)
        let v31 = erlang_term_coerce(v30)
        let v32 = erlang_term_coerce(v31)
        let v33 = spiral_string_slice(v32, 0, 18)
        let v34 = v20 == v33
        let v143 =
            case v34 {
                True -> {
                    let v35 = erlang_term_coerce(v4)
                    let v36 = "id"
                    let v37 = erlang_term_coerce(v36)
                    let v38 = erlang_term_coerce(v35)
                    let v39 = atom.create(v9)
                    let v40 = atom.create(v11)
                    let v41 = []
                    let v42 = [v38, ..v41]
                    let v43 = [v1, ..v42]
                    let v44 = [v37, ..v43]
                    let v45 = erlang_term_apply(v39, v40, v44)
                    let v46 = erlang_term_coerce(v45)
                    let v47 = "erlang"
                    let v48 = atom.create(v47)
                    let v49 = "is_binary"
                    let v50 = atom.create(v49)
                    let v51 = []
                    let v52 = [v46, ..v51]
                    let v53 = erlang_term_apply(v48, v50, v52)
                    let v54 = erlang_term_coerce(v53)
                    let v63 =
                        case v54 {
                            True -> {
                                erlang_term_coerce(v46)
                            }
                            False -> {
                                let v56 = atom.create(v47)
                                let v58 = atom.create("integer_to_binary")
                                let v59 = []
                                let v60 = [v46, ..v59]
                                let v61 = erlang_term_apply(v56, v58, v60)
                                erlang_term_coerce(v61)
                            }
                        }
                    let v64 = erlang_term_coerce(v4)
                    let v65 = erlang_term_coerce(v36)
                    let v66 = erlang_term_coerce(v64)
                    let v67 = atom.create(v9)
                    let v68 = atom.create(v11)
                    let v69 = []
                    let v70 = [v66, ..v69]
                    let v71 = [v3, ..v70]
                    let v72 = [v65, ..v71]
                    let v73 = erlang_term_apply(v67, v68, v72)
                    let v74 = erlang_term_coerce(v73)
                    let v75 = atom.create(v47)
                    let v76 = atom.create(v49)
                    let v77 = []
                    let v78 = [v74, ..v77]
                    let v79 = erlang_term_apply(v75, v76, v78)
                    let v80 = erlang_term_coerce(v79)
                    let v89 =
                        case v80 {
                            True -> {
                                erlang_term_coerce(v74)
                            }
                            False -> {
                                let v82 = atom.create(v47)
                                let v84 = atom.create("integer_to_binary")
                                let v85 = []
                                let v86 = [v74, ..v85]
                                let v87 = erlang_term_apply(v82, v84, v86)
                                erlang_term_coerce(v87)
                            }
                        }
                    let v90 = spiral_string_length(v63)
                    let v91 = spiral_string_length(v89)
                    let v92 = spiral_wrap_signed(v90 - v91, 32)
                    let v93 = v92 == 0
                    case v93 {
                        True -> {
                            let v94 = erlang_term_coerce(v63)
                            let v95 = erlang_term_coerce(v89)
                            let v96 = atom.create(v47)
                            let v98 = atom.create(">=")
                            let v99 = []
                            let v100 = [v95, ..v99]
                            let v101 = [v94, ..v100]
                            let v102 = erlang_term_apply(v96, v98, v101)
                            erlang_term_coerce(v102)
                        }
                        False -> {
                            v92 > 0
                        }
                    }
                }
                False -> {
                    let v106 = erlang_term_coerce(v4)
                    let v107 = erlang_term_coerce(v6)
                    let v108 = erlang_term_coerce(v106)
                    let v109 = atom.create(v9)
                    let v110 = atom.create(v11)
                    let v111 = []
                    let v112 = [v108, ..v111]
                    let v113 = [v1, ..v112]
                    let v114 = [v107, ..v113]
                    let v115 = erlang_term_apply(v109, v110, v114)
                    let v116 = erlang_term_coerce(v115)
                    let v117 = erlang_term_coerce(v116)
                    let v118 = spiral_string_slice(v117, 0, 18)
                    let v119 = erlang_term_coerce(v4)
                    let v120 = erlang_term_coerce(v6)
                    let v121 = erlang_term_coerce(v119)
                    let v122 = atom.create(v9)
                    let v123 = atom.create(v11)
                    let v124 = []
                    let v125 = [v121, ..v124]
                    let v126 = [v3, ..v125]
                    let v127 = [v120, ..v126]
                    let v128 = erlang_term_apply(v122, v123, v127)
                    let v129 = erlang_term_coerce(v128)
                    let v130 = erlang_term_coerce(v129)
                    let v131 = spiral_string_slice(v130, 0, 18)
                    let v132 = erlang_term_coerce(v118)
                    let v133 = erlang_term_coerce(v131)
                    let v135 = atom.create("erlang")
                    let v137 = atom.create(">=")
                    let v138 = []
                    let v139 = [v133, ..v138]
                    let v140 = [v132, ..v139]
                    let v141 = erlang_term_apply(v135, v137, v140)
                    erlang_term_coerce(v141)
                }
            }
        v143 == False
    }
}

pub fn closure148(capt: Nil) -> fn(#(String, Dynamic)) -> fn(#(String, Dynamic)) -> Bool {
    fn (dom) {
        let #(v0, v1) = dom
        closure149(#(v0, v1))
    }
}

pub fn closure151(capt: #(Dynamic)) -> fn(#(String, Dynamic)) -> Bool {
    fn (dom) {
        let #(_v1, v2) = dom
        let #(v0) = capt
        let v3 = ""
        let v4 = erlang_term_coerce(v3)
        let v5 = "created_at"
        let v6 = erlang_term_coerce(v5)
        let v7 = erlang_term_coerce(v4)
        let v8 = "maps"
        let v9 = atom.create(v8)
        let v10 = "get"
        let v11 = atom.create(v10)
        let v12 = []
        let v13 = [v7, ..v12]
        let v14 = [v2, ..v13]
        let v15 = [v6, ..v14]
        let v16 = erlang_term_apply(v9, v11, v15)
        let v17 = erlang_term_coerce(v16)
        let v18 = erlang_term_coerce(v17)
        let v19 = spiral_string_slice(v18, 0, 18)
        let v20 = erlang_term_coerce(v3)
        let v21 = erlang_term_coerce(v5)
        let v22 = erlang_term_coerce(v20)
        let v23 = atom.create(v8)
        let v24 = atom.create(v10)
        let v25 = []
        let v26 = [v22, ..v25]
        let v27 = [v0, ..v26]
        let v28 = [v21, ..v27]
        let v29 = erlang_term_apply(v23, v24, v28)
        let v30 = erlang_term_coerce(v29)
        let v31 = erlang_term_coerce(v30)
        let v32 = spiral_string_slice(v31, 0, 18)
        let v33 = v19 == v32
        let v142 =
            case v33 {
                True -> {
                    let v34 = erlang_term_coerce(v3)
                    let v35 = "id"
                    let v36 = erlang_term_coerce(v35)
                    let v37 = erlang_term_coerce(v34)
                    let v38 = atom.create(v8)
                    let v39 = atom.create(v10)
                    let v40 = []
                    let v41 = [v37, ..v40]
                    let v42 = [v2, ..v41]
                    let v43 = [v36, ..v42]
                    let v44 = erlang_term_apply(v38, v39, v43)
                    let v45 = erlang_term_coerce(v44)
                    let v46 = "erlang"
                    let v47 = atom.create(v46)
                    let v48 = "is_binary"
                    let v49 = atom.create(v48)
                    let v50 = []
                    let v51 = [v45, ..v50]
                    let v52 = erlang_term_apply(v47, v49, v51)
                    let v53 = erlang_term_coerce(v52)
                    let v62 =
                        case v53 {
                            True -> {
                                erlang_term_coerce(v45)
                            }
                            False -> {
                                let v55 = atom.create(v46)
                                let v57 = atom.create("integer_to_binary")
                                let v58 = []
                                let v59 = [v45, ..v58]
                                let v60 = erlang_term_apply(v55, v57, v59)
                                erlang_term_coerce(v60)
                            }
                        }
                    let v63 = erlang_term_coerce(v3)
                    let v64 = erlang_term_coerce(v35)
                    let v65 = erlang_term_coerce(v63)
                    let v66 = atom.create(v8)
                    let v67 = atom.create(v10)
                    let v68 = []
                    let v69 = [v65, ..v68]
                    let v70 = [v0, ..v69]
                    let v71 = [v64, ..v70]
                    let v72 = erlang_term_apply(v66, v67, v71)
                    let v73 = erlang_term_coerce(v72)
                    let v74 = atom.create(v46)
                    let v75 = atom.create(v48)
                    let v76 = []
                    let v77 = [v73, ..v76]
                    let v78 = erlang_term_apply(v74, v75, v77)
                    let v79 = erlang_term_coerce(v78)
                    let v88 =
                        case v79 {
                            True -> {
                                erlang_term_coerce(v73)
                            }
                            False -> {
                                let v81 = atom.create(v46)
                                let v83 = atom.create("integer_to_binary")
                                let v84 = []
                                let v85 = [v73, ..v84]
                                let v86 = erlang_term_apply(v81, v83, v85)
                                erlang_term_coerce(v86)
                            }
                        }
                    let v89 = spiral_string_length(v62)
                    let v90 = spiral_string_length(v88)
                    let v91 = spiral_wrap_signed(v89 - v90, 32)
                    let v92 = v91 == 0
                    case v92 {
                        True -> {
                            let v93 = erlang_term_coerce(v62)
                            let v94 = erlang_term_coerce(v88)
                            let v95 = atom.create(v46)
                            let v97 = atom.create(">=")
                            let v98 = []
                            let v99 = [v94, ..v98]
                            let v100 = [v93, ..v99]
                            let v101 = erlang_term_apply(v95, v97, v100)
                            erlang_term_coerce(v101)
                        }
                        False -> {
                            v91 > 0
                        }
                    }
                }
                False -> {
                    let v105 = erlang_term_coerce(v3)
                    let v106 = erlang_term_coerce(v5)
                    let v107 = erlang_term_coerce(v105)
                    let v108 = atom.create(v8)
                    let v109 = atom.create(v10)
                    let v110 = []
                    let v111 = [v107, ..v110]
                    let v112 = [v2, ..v111]
                    let v113 = [v106, ..v112]
                    let v114 = erlang_term_apply(v108, v109, v113)
                    let v115 = erlang_term_coerce(v114)
                    let v116 = erlang_term_coerce(v115)
                    let v117 = spiral_string_slice(v116, 0, 18)
                    let v118 = erlang_term_coerce(v3)
                    let v119 = erlang_term_coerce(v5)
                    let v120 = erlang_term_coerce(v118)
                    let v121 = atom.create(v8)
                    let v122 = atom.create(v10)
                    let v123 = []
                    let v124 = [v120, ..v123]
                    let v125 = [v0, ..v124]
                    let v126 = [v119, ..v125]
                    let v127 = erlang_term_apply(v121, v122, v126)
                    let v128 = erlang_term_coerce(v127)
                    let v129 = erlang_term_coerce(v128)
                    let v130 = spiral_string_slice(v129, 0, 18)
                    let v131 = erlang_term_coerce(v117)
                    let v132 = erlang_term_coerce(v130)
                    let v134 = atom.create("erlang")
                    let v136 = atom.create(">=")
                    let v137 = []
                    let v138 = [v132, ..v137]
                    let v139 = [v131, ..v138]
                    let v140 = erlang_term_apply(v134, v136, v139)
                    erlang_term_coerce(v140)
                }
            }
        v142 == False
    }
}

pub fn closure150(capt: Nil) -> fn(#(String, Dynamic)) -> fn(#(String, Dynamic)) -> Bool {
    fn (dom) {
        let #(_v0, v1) = dom
        closure151(#(v1))
    }
}

pub fn dropped_474(v0: Int, v1: Uh37) -> Uh37 {
    case v1  {
        Uh37Cons(v2, v3, v4) -> {
            let v5 = v0 > 0
            case v5 {
                True -> {
                    let v6 = spiral_wrap_signed(v0 - 1, 32)
                    dropped_474(v6, v4)
                }
                False -> v1
            }
        }
        _ -> v1
    }
}

pub fn resumed_from_473(v0: Uh36, v1: Uh13) -> Uh36 {
    case v0  {
        Uh36Cons(v3, v4) -> {
            let v8 =
                case v1  {
                    Uh13Cons(v5, v6) -> v5
                    Uh13Nil -> 0
                }
            let v9 = dropped_474(v8, v3)
            let v14 =
                case v1  {
                    Uh13Cons(v10, v11) -> v11
                    Uh13Nil -> Uh13Nil
                }
            let v15 = resumed_from_473(v4, v14)
            Uh36Cons(v9, v15)
        }
        Uh36Nil -> Uh36Nil
    }
}

pub fn best_from_476(v0: fn(#(String, Dynamic)) -> fn(#(String, Dynamic)) -> Bool, v1: Uh36, v2: Int, v3: Us99) -> Us99 {
    case v1  {
        Uh36Cons(v4, v5) -> {
            let v6 = spiral_wrap_signed(v2 + 1, 32)
            let v22 =
                case v4  {
                    Uh37Cons(v7, v8, v9) -> {
                        case v3  {
                            Us99Some(v10, v11, v12) -> {
                                let v13 = v0(#(v7, v8))
                                let v14 = v13(#(v11, v12))
                                let v15 = v14 == False
                                case v15 {
                                    True -> Us99Some(v10, v11, v12)
                                    False -> Us99Some(v2, v7, v8)
                                }
                            }
                            _ -> Us99Some(v2, v7, v8)
                        }
                    }
                    Uh37Nil -> v3
                }
            best_from_476(v0, v5, v6, v22)
        }
        Uh36Nil -> v3
    }
}

pub fn popped_477(v0: Uh36, v1: Int) -> Uh36 {
    case v0  {
        Uh36Cons(v3, v4) -> {
            let v5 = v1 == 0
            case v5 {
                True -> {
                    let v11 =
                        case v3  {
                            Uh37Cons(v6, v7, v8) -> v8
                            Uh37Nil -> Uh37Nil
                        }
                    Uh36Cons(v11, v4)
                }
                False -> {
                    let v13 = spiral_wrap_signed(v1 - 1, 32)
                    let v14 = popped_477(v4, v13)
                    Uh36Cons(v3, v14)
                }
            }
        }
        Uh36Nil -> Uh36Nil
    }
}

pub fn page_from_475(v0: fn(#(String, Dynamic)) -> fn(#(String, Dynamic)) -> Bool, v1: Int, v2: Uh36) -> #(Uh37, Uh36) {
    let v3 = v1 > 0
    let v8 =
        case v3 {
            True -> {
                best_from_476(v0, v2, 0, Us99None)
            }
            False -> Us99None
        }
    case v8  {
        Us99None -> {
            #(Uh37Nil, v2)
        }
        Us99Some(v9, v10, v11) -> {
            let v12 = spiral_wrap_signed(v1 - 1, 32)
            let v13 = popped_477(v2, v9)
            let #(v14, v15) = page_from_475(v0, v12, v13)
            let v16 = Uh37Cons(v10, v11, v14)
            #(v16, v15)
        }
    }
}

pub fn method478(v0: Uh37, v1: Uh39) -> Uh39 {
    case v0  {
        Uh37Cons(v2, v3, v4) -> {
            let v6 = erlang_term_coerce("")
            let v8 = erlang_term_coerce("lost")
            let v9 = erlang_term_coerce(v6)
            let v11 = atom.create("maps")
            let v13 = atom.create("get")
            let v14 = []
            let v15 = [v9, ..v14]
            let v16 = [v3, ..v15]
            let v17 = [v8, ..v16]
            let v18 = erlang_term_apply(v11, v13, v17)
            let v19 = erlang_term_coerce(v18)
            let v21 = atom.create("true")
            let v22 = erlang_term_coerce(v21)
            let v23 = v19 == v22
            let v27 =
                case v23 {
                    True -> Us100None
                    False -> {
                        let v25 = Uh40ShownPost(v3)
                        Us100Some(v2, v25)
                    }
                }
            let v32 =
                case v27  {
                    Us100None -> v1
                    Us100Some(v28, v29) -> Uh39Cons(v28, v29, v1)
                }
            method478(v4, v32)
        }
        Uh37Nil -> v1
    }
}

pub fn method479(v0: Uh39, v1: Uh39) -> Uh39 {
    case v0  {
        Uh39Cons(v2, v3, v4) -> {
            let v5 = Uh39Cons(v2, v3, v1)
            method479(v4, v5)
        }
        Uh39Nil -> v1
    }
}

pub fn method481(v0: Uh29, v1: Uh29) -> Uh29 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method481(v3, v1)
            let v6 = atom.create("erlang")
            let v8 = atom.create("is_map")
            let v9 = []
            let v10 = [v2, ..v9]
            let v11 = erlang_term_apply(v6, v8, v10)
            let v12 = erlang_term_coerce(v11)
            case v12 {
                True -> Uh29Cons(v2, v4)
                False -> v4
            }
        }
        Uh29Nil -> v1
    }
}

pub fn method482(v0: Uh29, v1: Uh43) -> Uh43 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method482(v3, v1)
            let v5 = ""
            let v6 = erlang_term_coerce(v5)
            let v8 = erlang_term_coerce("path")
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
            let v20 = erlang_term_coerce(v19)
            let v21 = erlang_term_coerce(v5)
            let v23 = erlang_term_coerce("type")
            let v24 = erlang_term_coerce(v21)
            let v25 = atom.create(v10)
            let v26 = atom.create(v12)
            let v27 = []
            let v28 = [v24, ..v27]
            let v29 = [v2, ..v28]
            let v30 = [v23, ..v29]
            let v31 = erlang_term_apply(v25, v26, v30)
            let v32 = erlang_term_coerce(v31)
            let v33 = erlang_term_coerce(v32)
            let v34 = erlang_term_coerce(v5)
            let v36 = erlang_term_coerce("alt_text")
            let v37 = erlang_term_coerce(v34)
            let v38 = atom.create(v10)
            let v39 = atom.create(v12)
            let v40 = []
            let v41 = [v37, ..v40]
            let v42 = [v2, ..v41]
            let v43 = [v36, ..v42]
            let v44 = erlang_term_apply(v38, v39, v43)
            let v45 = erlang_term_coerce(v44)
            let v46 = erlang_term_coerce(v45)
            Uh43Cons(v20, v33, v46, v4)
        }
        Uh29Nil -> v1
    }
}
