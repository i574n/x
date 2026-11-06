import gleam/bit_array
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh14, type Uh30, type Uh38, type Uh37, type Uh39, Uh14Cons, Uh30Cons, Uh30Nil, Uh37Cons, Uh38Cons, Uh38Nil, Uh39Cons, Uh39Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us3None, Us3Some}
import xsim_frames/part1.{closure1, count_of_text_10, erlang_term_apply, erlang_term_coerce, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part12.{items_from_303}

pub fn request_of_453(v0: String) -> #(String, String, String, String, String) {
    let v2 = option.from_result(result.map(string.split_once(v0, "\r\n\r\n"), pair.first))
    let v3 = closure1(Nil)
    let v4 = v2 |> option.map(v3)
    let v6 = v4 |> option.unwrap(Us2None)
    let v10 =
        case v6  {
            Us2None -> -1
            Us2Some(v7) -> {
                bit_array.byte_size(bit_array.from_string(v7))
            }
        }
    let v11 = v10 < 0
    let v14 =
        case v11 {
            True -> v0
            False -> {
                let v12 = spiral_wrap_signed(v10 - 1, 32)
                spiral_string_slice(v0, 0, v12)
            }
        }
    let v16 = option.from_result(result.map(string.split_once(v14, "\r\n"), pair.first))
    let v17 = v16 |> option.map(v3)
    let v19 = v17 |> option.unwrap(Us2None)
    let v23 =
        case v19  {
            Us2None -> -1
            Us2Some(v20) -> {
                bit_array.byte_size(bit_array.from_string(v20))
            }
        }
    let v24 = v23 < 0
    let v27 =
        case v24 {
            True -> v14
            False -> {
                let v25 = spiral_wrap_signed(v23 - 1, 32)
                spiral_string_slice(v14, 0, v25)
            }
        }
    let v28 = v27 == ""
    let v32 =
        case v28 {
            True -> Uh3Nil
            False -> {
                split_list_2(" ", v27)
            }
        }
    let v40 =
        case v32  {
            Uh3Cons(v33, v34) -> {
                case v34  {
                    Uh3Cons(v35, v36) -> v35
                    _ -> {
                        "/"
                    }
                }
            }
            _ -> {
                "/"
            }
        }
    let v42 = option.from_result(result.map(string.split_once(v40, "#"), pair.first))
    let v43 = v42 |> option.map(v3)
    let v45 = v43 |> option.unwrap(Us2None)
    let v49 =
        case v45  {
            Us2None -> -1
            Us2Some(v46) -> {
                bit_array.byte_size(bit_array.from_string(v46))
            }
        }
    let v50 = spiral_wrap_signed(v49 + 1, 32)
    let v51 = v49 < 0
    let #(v60, _v61) =
        case v51 {
            True -> {
                #(v40, "")
            }
            False -> {
                let v53 = spiral_wrap_signed(v49 - 1, 32)
                let v54 = spiral_string_slice(v40, 0, v53)
                let v55 = spiral_string_length(v40)
                let v56 = spiral_wrap_signed(v55 - v50, 32)
                let v57 = spiral_wrap_signed(v50 + v56, 32)
                let v58 = spiral_wrap_signed(v57 - 1, 32)
                let v59 = spiral_string_slice(v40, v50, v58)
                #(v54, v59)
            }
        }
    let v63 = option.from_result(result.map(string.split_once(v60, "?"), pair.first))
    let v64 = v63 |> option.map(v3)
    let v66 = v64 |> option.unwrap(Us2None)
    let v70 =
        case v66  {
            Us2None -> -1
            Us2Some(v67) -> {
                bit_array.byte_size(bit_array.from_string(v67))
            }
        }
    let v71 = spiral_wrap_signed(v70 + 1, 32)
    let v72 = v70 < 0
    let #(v81, v82) =
        case v72 {
            True -> {
                #(v60, "")
            }
            False -> {
                let v74 = spiral_wrap_signed(v70 - 1, 32)
                let v75 = spiral_string_slice(v60, 0, v74)
                let v76 = spiral_string_length(v60)
                let v77 = spiral_wrap_signed(v76 - v71, 32)
                let v78 = spiral_wrap_signed(v71 + v77, 32)
                let v79 = spiral_wrap_signed(v78 - 1, 32)
                let v80 = spiral_string_slice(v60, v71, v79)
                #(v75, v80)
            }
        }
    let v83 = v14 == ""
    let v87 =
        case v83 {
            True -> Uh3Nil
            False -> {
                split_list_2(" ", v14)
            }
        }
    let v92 =
        case v87  {
            Uh3Cons(v88, v89) -> v88
            Uh3Nil -> {
                ""
            }
        }
    #(v92, v81, v82, v14, v0)
}

pub fn method455(v0: Dynamic, v1: Uh30, v2: Int) -> Int {
    case v1  {
        Uh30Cons(v3, v4) -> {
            let v5 = ""
            let v6 = erlang_term_coerce(v5)
            let v7 = "username"
            let v8 = erlang_term_coerce(v7)
            let v9 = erlang_term_coerce(v6)
            let v10 = "maps"
            let v11 = atom.create(v10)
            let v12 = "get"
            let v13 = atom.create(v12)
            let v14 = []
            let v15 = [v9, ..v14]
            let v16 = [v3, ..v15]
            let v17 = [v8, ..v16]
            let v18 = erlang_term_apply(v11, v13, v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = erlang_term_coerce(v19)
            let v21 = v20 |> string.lowercase
            let v22 = erlang_term_coerce(v5)
            let v23 = erlang_term_coerce(v7)
            let v24 = erlang_term_coerce(v22)
            let v25 = atom.create(v10)
            let v26 = atom.create(v12)
            let v27 = []
            let v28 = [v24, ..v27]
            let v29 = [v0, ..v28]
            let v30 = [v23, ..v29]
            let v31 = erlang_term_apply(v25, v26, v30)
            let v32 = erlang_term_coerce(v31)
            let v33 = erlang_term_coerce(v32)
            let v34 = v33 |> string.lowercase
            let v35 = v21 == v34
            let v37 =
                case v35 {
                    True -> {
                        spiral_wrap_signed(v2 + 1, 32)
                    }
                    False -> v2
                }
            method455(v0, v4, v37)
        }
        Uh30Nil -> v2
    }
}

pub fn method456(v0: Dynamic, v1: Uh30, v2: Uh30) -> Uh30 {
    case v1  {
        Uh30Cons(v3, v4) -> {
            let v5 = method456(v0, v4, v2)
            let v7 = erlang_term_coerce("")
            let v9 = erlang_term_coerce("id")
            let v10 = erlang_term_coerce(v7)
            let v11 = "maps"
            let v12 = atom.create(v11)
            let v14 = atom.create("get")
            let v15 = []
            let v16 = [v10, ..v15]
            let v17 = [v0, ..v16]
            let v18 = [v9, ..v17]
            let v19 = erlang_term_apply(v12, v14, v18)
            let v20 = erlang_term_coerce(v19)
            let v22 = erlang_term_coerce("author_id")
            let v23 = erlang_term_coerce(v20)
            let v24 = atom.create(v11)
            let v26 = atom.create("put")
            let v27 = []
            let v28 = [v3, ..v27]
            let v29 = [v23, ..v28]
            let v30 = [v22, ..v29]
            let v31 = erlang_term_apply(v24, v26, v30)
            Uh30Cons(v31, v5)
        }
        Uh30Nil -> v2
    }
}

pub fn method458(v0: Uh30, v1: Uh30) -> Uh30 {
    case v0  {
        Uh30Cons(v2, v3) -> {
            let v4 = Uh30Cons(v2, v1)
            method458(v3, v4)
        }
        Uh30Nil -> v1
    }
}

pub fn runs_of_459(v0: Uh30, v1: Uh30, v2: Uh39) -> Uh39 {
    case v0  {
        Uh30Cons(v7, v8) -> {
            let v153 =
                case v1  {
                    Uh30Cons(v9, v10) -> {
                        let v11 = ""
                        let v12 = erlang_term_coerce(v11)
                        let v13 = "created_at"
                        let v14 = erlang_term_coerce(v13)
                        let v15 = erlang_term_coerce(v12)
                        let v16 = "maps"
                        let v17 = atom.create(v16)
                        let v18 = "get"
                        let v19 = atom.create(v18)
                        let v20 = []
                        let v21 = [v15, ..v20]
                        let v22 = [v9, ..v21]
                        let v23 = [v14, ..v22]
                        let v24 = erlang_term_apply(v17, v19, v23)
                        let v25 = erlang_term_coerce(v24)
                        let v26 = erlang_term_coerce(v25)
                        let v27 = spiral_string_slice(v26, 0, 18)
                        let v28 = erlang_term_coerce(v11)
                        let v29 = erlang_term_coerce(v13)
                        let v30 = erlang_term_coerce(v28)
                        let v31 = atom.create(v16)
                        let v32 = atom.create(v18)
                        let v33 = []
                        let v34 = [v30, ..v33]
                        let v35 = [v7, ..v34]
                        let v36 = [v29, ..v35]
                        let v37 = erlang_term_apply(v31, v32, v36)
                        let v38 = erlang_term_coerce(v37)
                        let v39 = erlang_term_coerce(v38)
                        let v40 = spiral_string_slice(v39, 0, 18)
                        let v41 = v27 == v40
                        let v150 =
                            case v41 {
                                True -> {
                                    let v42 = erlang_term_coerce(v11)
                                    let v43 = "id"
                                    let v44 = erlang_term_coerce(v43)
                                    let v45 = erlang_term_coerce(v42)
                                    let v46 = atom.create(v16)
                                    let v47 = atom.create(v18)
                                    let v48 = []
                                    let v49 = [v45, ..v48]
                                    let v50 = [v9, ..v49]
                                    let v51 = [v44, ..v50]
                                    let v52 = erlang_term_apply(v46, v47, v51)
                                    let v53 = erlang_term_coerce(v52)
                                    let v54 = "erlang"
                                    let v55 = atom.create(v54)
                                    let v56 = "is_binary"
                                    let v57 = atom.create(v56)
                                    let v58 = []
                                    let v59 = [v53, ..v58]
                                    let v60 = erlang_term_apply(v55, v57, v59)
                                    let v61 = erlang_term_coerce(v60)
                                    let v70 =
                                        case v61 {
                                            True -> {
                                                erlang_term_coerce(v53)
                                            }
                                            False -> {
                                                let v63 = atom.create(v54)
                                                let v65 = atom.create("integer_to_binary")
                                                let v66 = []
                                                let v67 = [v53, ..v66]
                                                let v68 = erlang_term_apply(v63, v65, v67)
                                                erlang_term_coerce(v68)
                                            }
                                        }
                                    let v71 = erlang_term_coerce(v11)
                                    let v72 = erlang_term_coerce(v43)
                                    let v73 = erlang_term_coerce(v71)
                                    let v74 = atom.create(v16)
                                    let v75 = atom.create(v18)
                                    let v76 = []
                                    let v77 = [v73, ..v76]
                                    let v78 = [v7, ..v77]
                                    let v79 = [v72, ..v78]
                                    let v80 = erlang_term_apply(v74, v75, v79)
                                    let v81 = erlang_term_coerce(v80)
                                    let v82 = atom.create(v54)
                                    let v83 = atom.create(v56)
                                    let v84 = []
                                    let v85 = [v81, ..v84]
                                    let v86 = erlang_term_apply(v82, v83, v85)
                                    let v87 = erlang_term_coerce(v86)
                                    let v96 =
                                        case v87 {
                                            True -> {
                                                erlang_term_coerce(v81)
                                            }
                                            False -> {
                                                let v89 = atom.create(v54)
                                                let v91 = atom.create("integer_to_binary")
                                                let v92 = []
                                                let v93 = [v81, ..v92]
                                                let v94 = erlang_term_apply(v89, v91, v93)
                                                erlang_term_coerce(v94)
                                            }
                                        }
                                    let v97 = spiral_string_length(v70)
                                    let v98 = spiral_string_length(v96)
                                    let v99 = spiral_wrap_signed(v97 - v98, 32)
                                    let v100 = v99 == 0
                                    case v100 {
                                        True -> {
                                            let v101 = erlang_term_coerce(v70)
                                            let v102 = erlang_term_coerce(v96)
                                            let v103 = atom.create(v54)
                                            let v105 = atom.create(">=")
                                            let v106 = []
                                            let v107 = [v102, ..v106]
                                            let v108 = [v101, ..v107]
                                            let v109 = erlang_term_apply(v103, v105, v108)
                                            erlang_term_coerce(v109)
                                        }
                                        False -> {
                                            v99 > 0
                                        }
                                    }
                                }
                                False -> {
                                    let v113 = erlang_term_coerce(v11)
                                    let v114 = erlang_term_coerce(v13)
                                    let v115 = erlang_term_coerce(v113)
                                    let v116 = atom.create(v16)
                                    let v117 = atom.create(v18)
                                    let v118 = []
                                    let v119 = [v115, ..v118]
                                    let v120 = [v9, ..v119]
                                    let v121 = [v114, ..v120]
                                    let v122 = erlang_term_apply(v116, v117, v121)
                                    let v123 = erlang_term_coerce(v122)
                                    let v124 = erlang_term_coerce(v123)
                                    let v125 = spiral_string_slice(v124, 0, 18)
                                    let v126 = erlang_term_coerce(v11)
                                    let v127 = erlang_term_coerce(v13)
                                    let v128 = erlang_term_coerce(v126)
                                    let v129 = atom.create(v16)
                                    let v130 = atom.create(v18)
                                    let v131 = []
                                    let v132 = [v128, ..v131]
                                    let v133 = [v7, ..v132]
                                    let v134 = [v127, ..v133]
                                    let v135 = erlang_term_apply(v129, v130, v134)
                                    let v136 = erlang_term_coerce(v135)
                                    let v137 = erlang_term_coerce(v136)
                                    let v138 = spiral_string_slice(v137, 0, 18)
                                    let v139 = erlang_term_coerce(v125)
                                    let v140 = erlang_term_coerce(v138)
                                    let v142 = atom.create("erlang")
                                    let v144 = atom.create(">=")
                                    let v145 = []
                                    let v146 = [v140, ..v145]
                                    let v147 = [v139, ..v146]
                                    let v148 = erlang_term_apply(v142, v144, v147)
                                    erlang_term_coerce(v148)
                                }
                            }
                        v150 == False
                    }
                    Uh30Nil -> False
                }
            case v153 {
                True -> {
                    let v155 = Uh30Cons(v7, Uh30Nil)
                    let v159 =
                        case v1  {
                            Uh30Nil -> v2
                            _ -> {
                                let v157 = method458(v1, Uh30Nil)
                                Uh39Cons(v157, v2)
                            }
                        }
                    runs_of_459(v8, v155, v159)
                }
                False -> {
                    let v161 = Uh30Cons(v7, v1)
                    runs_of_459(v8, v161, v2)
                }
            }
        }
        Uh30Nil -> {
            case v1  {
                Uh30Nil -> v2
                _ -> {
                    let v4 = method458(v1, Uh30Nil)
                    Uh39Cons(v4, v2)
                }
            }
        }
    }
}

pub fn method460(v0: Uh39, v1: Uh39) -> Uh39 {
    case v0  {
        Uh39Cons(v2, v3) -> {
            let v4 = Uh39Cons(v2, v1)
            method460(v3, v4)
        }
        Uh39Nil -> v1
    }
}

pub fn closure147(capt: #(Dynamic)) -> fn(Dynamic) -> Bool {
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

pub fn closure146(capt: Nil) -> fn(Dynamic) -> fn(Dynamic) -> Bool {
    fn (v0) {
        closure147(#(v0))
    }
}

pub fn method464(v0: Uh30, v1: Uh30) -> Uh30 {
    case v0  {
        Uh30Cons(v2, v3) -> {
            let v4 = method464(v3, v1)
            Uh30Cons(v2, v4)
        }
        Uh30Nil -> v1
    }
}

pub fn merged_463(v0: fn(Dynamic) -> fn(Dynamic) -> Bool, v1: Uh30, v2: Uh30, v3: Uh30) -> Uh30 {
    case v1  {
        Uh30Cons(v7, v8) -> {
            case v2  {
                Uh30Cons(v12, v13) -> {
                    let v14 = v0(v12)
                    let v15 = v14(v7)
                    case v15 {
                        True -> {
                            let v16 = Uh30Cons(v12, v3)
                            merged_463(v0, v1, v13, v16)
                        }
                        False -> {
                            let v18 = Uh30Cons(v7, v3)
                            merged_463(v0, v8, v2, v18)
                        }
                    }
                }
                Uh30Nil -> {
                    let v10 = method458(v3, Uh30Nil)
                    method464(v10, v1)
                }
            }
        }
        Uh30Nil -> {
            let v5 = method458(v3, Uh30Nil)
            method464(v5, v2)
        }
    }
}

pub fn merged_pairs_462(v0: Uh39) -> Uh39 {
    case v0  {
        Uh39Cons(v1, v2) -> {
            case v2  {
                Uh39Cons(v3, v4) -> {
                    let v5 = closure146(Nil)
                    let v7 = merged_463(v5, v1, v3, Uh30Nil)
                    let v8 = merged_pairs_462(v4)
                    Uh39Cons(v7, v8)
                }
                _ -> v0
            }
        }
        _ -> v0
    }
}

pub fn merged_runs_461(v0: Uh39) -> Uh30 {
    case v0  {
        Uh39Cons(v2, v3) -> {
            case v3  {
                Uh39Nil -> v2
                _ -> {
                    let v4 = merged_pairs_462(v0)
                    merged_runs_461(v4)
                }
            }
        }
        Uh39Nil -> Uh30Nil
    }
}

pub fn newest_posts_457(v0: Uh30) -> Uh30 {
    let v2 = method458(v0, Uh30Nil)
    let v5 = runs_of_459(v2, Uh30Nil, Uh39Nil)
    let v7 = method460(v5, Uh39Nil)
    merged_runs_461(v7)
}

pub fn method465(v0: String, v1: Uh30, v2: Uh38) -> Uh38 {
    case v1  {
        Uh30Cons(v3, v4) -> {
            let v5 = method465(v0, v4, v2)
            Uh38Cons(v0, v3, v5)
        }
        Uh30Nil -> v2
    }
}

pub fn method454(v0: Uh30, v1: Uh30, v2: Uh37) -> Uh37 {
    case v1  {
        Uh30Cons(v3, v4) -> {
            let v5 = method454(v0, v4, v2)
            let v6 = ""
            let v7 = erlang_term_coerce(v6)
            let v9 = erlang_term_coerce("username")
            let v10 = erlang_term_coerce(v7)
            let v11 = "maps"
            let v12 = atom.create(v11)
            let v13 = "get"
            let v14 = atom.create(v13)
            let v15 = []
            let v16 = [v10, ..v15]
            let v17 = [v3, ..v16]
            let v18 = [v9, ..v17]
            let v19 = erlang_term_apply(v12, v14, v18)
            let v20 = erlang_term_coerce(v19)
            let v21 = erlang_term_coerce(v20)
            let v23 = method455(v3, v0, 0)
            let v24 = v23 > 1
            let v56 =
                case v24 {
                    True -> {
                        let v25 = { v21 } <> { " · " }
                        let v26 = erlang_term_coerce(v6)
                        let v28 = erlang_term_coerce("id")
                        let v29 = erlang_term_coerce(v26)
                        let v30 = atom.create(v11)
                        let v31 = atom.create(v13)
                        let v32 = []
                        let v33 = [v29, ..v32]
                        let v34 = [v3, ..v33]
                        let v35 = [v28, ..v34]
                        let v36 = erlang_term_apply(v30, v31, v35)
                        let v37 = erlang_term_coerce(v36)
                        let v38 = "erlang"
                        let v39 = atom.create(v38)
                        let v41 = atom.create("is_binary")
                        let v42 = []
                        let v43 = [v37, ..v42]
                        let v44 = erlang_term_apply(v39, v41, v43)
                        let v45 = erlang_term_coerce(v44)
                        let v54 =
                            case v45 {
                                True -> {
                                    erlang_term_coerce(v37)
                                }
                                False -> {
                                    let v47 = atom.create(v38)
                                    let v49 = atom.create("integer_to_binary")
                                    let v50 = []
                                    let v51 = [v37, ..v50]
                                    let v52 = erlang_term_apply(v47, v49, v51)
                                    erlang_term_coerce(v52)
                                }
                            }
                        let v55 = { v25 } <> { v54 }
                        v55
                    }
                    False -> v21
                }
            let v57 = []
            let v58 = erlang_term_coerce(v57)
            let v60 = erlang_term_coerce("posts")
            let v61 = erlang_term_coerce(v58)
            let v62 = atom.create(v11)
            let v63 = atom.create(v13)
            let v64 = []
            let v65 = [v61, ..v64]
            let v66 = [v3, ..v65]
            let v67 = [v60, ..v66]
            let v68 = erlang_term_apply(v62, v63, v67)
            let v69 = erlang_term_coerce(v68)
            let v71 = atom.create("lists")
            let v73 = atom.create("reverse")
            let v74 = []
            let v75 = [v69, ..v74]
            let v76 = erlang_term_apply(v71, v73, v75)
            let v78 = items_from_303(v76, Uh30Nil)
            let v80 = method456(v3, v78, Uh30Nil)
            let v81 = newest_posts_457(v80)
            let v83 = method465(v56, v81, Uh38Nil)
            Uh37Cons(v83, v5)
        }
        Uh30Nil -> v2
    }
}

pub fn method466(v0: Uh30, v1: Uh3) -> Uh3 {
    case v0  {
        Uh30Cons(v2, v3) -> {
            let v4 = method466(v3, v1)
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
        Uh30Nil -> v1
    }
}

pub fn first_value_467(v0: String, v1: Uh3) -> String {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v5 = option.from_result(result.map(string.split_once(v2, "="), pair.first))
            let v6 = closure1(Nil)
            let v7 = v5 |> option.map(v6)
            let v9 = v7 |> option.unwrap(Us2None)
            let v13 =
                case v9  {
                    Us2None -> -1
                    Us2Some(v10) -> {
                        bit_array.byte_size(bit_array.from_string(v10))
                    }
                }
            let v14 = spiral_wrap_signed(v13 + 1, 32)
            let v15 = v13 < 0
            let #(v24, v25) =
                case v15 {
                    True -> {
                        #(v2, "")
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
            let v26 = v25 != ""
            let v40 =
                case v26 {
                    True -> {
                        let v29 = v24 |> string.replace("+", " ")
                        let v30 = erlang_term_coerce(v29)
                        let v32 = atom.create("uri_string")
                        let v34 = atom.create("percent_decode")
                        let v35 = []
                        let v36 = [v30, ..v35]
                        let v37 = erlang_term_apply(v32, v34, v36)
                        let v38 = erlang_term_coerce(v37)
                        v38 == v0
                    }
                    False -> False
                }
            let v55 =
                case v40 {
                    True -> {
                        let v43 = v25 |> string.replace("+", " ")
                        let v44 = erlang_term_coerce(v43)
                        let v46 = atom.create("uri_string")
                        let v48 = atom.create("percent_decode")
                        let v49 = []
                        let v50 = [v44, ..v49]
                        let v51 = erlang_term_apply(v46, v48, v50)
                        let v52 = erlang_term_coerce(v51)
                        Us2Some(v52)
                    }
                    False -> Us2None
                }
            case v55  {
                Us2None -> first_value_467(v0, v3)
                Us2Some(v56) -> v56
            }
        }
        Uh3Nil -> {
            ""
        }
    }
}

pub fn method468(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method468(v3, v1)
            let v5 = v2 != ""
            case v5 {
                True -> Uh3Cons(v2, v4)
                False -> v4
            }
        }
        Uh3Nil -> v1
    }
}

pub fn method469(v0: Uh3, v1: Uh14) -> Uh14 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method469(v3, v1)
            let v5 = count_of_text_10(v2)
            let v8 =
                case v5  {
                    Us3None -> 0
                    Us3Some(v6) -> v6
                }
            Uh14Cons(v8, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method470(v0: Uh3, v1: Uh3) -> Bool {
    case v1,v0  {
        Uh3Cons(v2, v3),Uh3Cons(v4, v5) -> {
            let v6 = v2 == v4
            case v6 {
                True -> method470(v5, v3)
                False -> False
            }
        }
        Uh3Nil,Uh3Nil -> True
        _,_ -> False
    }
}
