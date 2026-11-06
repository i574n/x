import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/string
import xsim_frames/types.{type Uh3, type Uh14, type Uh38, type Uh37, type Us99, type Uh40, type Heap0, type Uh42, type Us103, type Uh45, type Uh44, type Uh46, type Us105, type Uh47, type Us106, type Uh50, Heap0, Uh14Cons, Uh14Nil, Uh37Cons, Uh37Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil, Uh40Cons, Uh40Nil, Uh41ShownPost, Uh42Cons, Uh43Nil, Uh44AutoLink, Uh44Code, Uh44Image, Uh44Link, Uh44LinkedImage, Uh44Strong, Uh44Text, Uh45Cons, Uh45Nil, Uh46Cons, Uh46Nil, Uh47Cons, Uh47Nil, Uh50Cons, Uh50Nil, Us100None, Us100Some, Us102Original, Us102QuoteOf, Us102ReplyTo, Us102RepostOf, Us103H1, Us103H2, Us103H3, Us103H4, Us103H5, Us103H6, Us105AlignCenter, Us105AlignLeft, Us105AlignNone, Us105AlignRight, Us106Markup, Us99None, Us99Some}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, spiral_array_from_list, spiral_array_get, spiral_string_index, spiral_string_length, spiral_string_slice, spiral_wrap_signed}

pub fn dropped_472(v0: Int, v1: Uh38) -> Uh38 {
    case v1  {
        Uh38Cons(v2, v3, v4) -> {
            let v5 = v0 > 0
            case v5 {
                True -> {
                    let v6 = spiral_wrap_signed(v0 - 1, 32)
                    dropped_472(v6, v4)
                }
                False -> v1
            }
        }
        _ -> v1
    }
}

pub fn resumed_from_471(v0: Uh37, v1: Uh14) -> Uh37 {
    case v0  {
        Uh37Cons(v3, v4) -> {
            let v8 =
                case v1  {
                    Uh14Cons(v5, v6) -> v5
                    Uh14Nil -> 0
                }
            let v9 = dropped_472(v8, v3)
            let v14 =
                case v1  {
                    Uh14Cons(v10, v11) -> v11
                    Uh14Nil -> Uh14Nil
                }
            let v15 = resumed_from_471(v4, v14)
            Uh37Cons(v9, v15)
        }
        Uh37Nil -> Uh37Nil
    }
}

pub fn closure149(capt: #(Dynamic)) -> fn(#(String, Dynamic)) -> Bool {
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

pub fn closure148(capt: Nil) -> fn(#(String, Dynamic)) -> fn(#(String, Dynamic)) -> Bool {
    fn (dom) {
        let #(_v0, v1) = dom
        closure149(#(v1))
    }
}

pub fn best_from_474(v0: fn(#(String, Dynamic)) -> fn(#(String, Dynamic)) -> Bool, v1: Uh37, v2: Int, v3: Us99) -> Us99 {
    case v1  {
        Uh37Cons(v4, v5) -> {
            let v6 = spiral_wrap_signed(v2 + 1, 32)
            let v22 =
                case v4  {
                    Uh38Cons(v7, v8, v9) -> {
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
                    Uh38Nil -> v3
                }
            best_from_474(v0, v5, v6, v22)
        }
        Uh37Nil -> v3
    }
}

pub fn popped_475(v0: Uh37, v1: Int) -> Uh37 {
    case v0  {
        Uh37Cons(v3, v4) -> {
            let v5 = v1 == 0
            case v5 {
                True -> {
                    let v11 =
                        case v3  {
                            Uh38Cons(v6, v7, v8) -> v8
                            Uh38Nil -> Uh38Nil
                        }
                    Uh37Cons(v11, v4)
                }
                False -> {
                    let v13 = spiral_wrap_signed(v1 - 1, 32)
                    let v14 = popped_475(v4, v13)
                    Uh37Cons(v3, v14)
                }
            }
        }
        Uh37Nil -> Uh37Nil
    }
}

pub fn page_from_473(v0: fn(#(String, Dynamic)) -> fn(#(String, Dynamic)) -> Bool, v1: Int, v2: Uh37) -> #(Uh38, Uh37) {
    let v3 = v1 > 0
    let v8 =
        case v3 {
            True -> {
                best_from_474(v0, v2, 0, Us99None)
            }
            False -> Us99None
        }
    case v8  {
        Us99None -> {
            #(Uh38Nil, v2)
        }
        Us99Some(v9, v10, v11) -> {
            let v12 = spiral_wrap_signed(v1 - 1, 32)
            let v13 = popped_475(v2, v9)
            let #(v14, v15) = page_from_473(v0, v12, v13)
            let v16 = Uh38Cons(v10, v11, v14)
            #(v16, v15)
        }
    }
}

pub fn method476(v0: Uh38, v1: Uh40) -> Uh40 {
    case v0  {
        Uh38Cons(v2, v3, v4) -> {
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
                        let v25 = Uh41ShownPost(v3)
                        Us100Some(v2, v25)
                    }
                }
            let v32 =
                case v27  {
                    Us100None -> v1
                    Us100Some(v28, v29) -> Uh40Cons(v28, v29, v1)
                }
            method476(v4, v32)
        }
        Uh38Nil -> v1
    }
}

pub fn method477(v0: Uh40, v1: Uh40) -> Uh40 {
    case v0  {
        Uh40Cons(v2, v3, v4) -> {
            let v5 = Uh40Cons(v2, v3, v1)
            method477(v4, v5)
        }
        Uh40Nil -> v1
    }
}

pub fn method478(v0: Uh40, v1: Uh42) -> Uh42 {
    case v0  {
        Uh40Cons(v2, v3, v4) -> {
            let v5 = method478(v4, v1)
            let #(v164, v165) =
                case v3  {
                    Uh41ShownPost(v6) -> {
                        let v7 = ""
                        let v8 = erlang_term_coerce(v7)
                        let v10 = erlang_term_coerce("id")
                        let v11 = erlang_term_coerce(v8)
                        let v12 = "maps"
                        let v13 = atom.create(v12)
                        let v14 = "get"
                        let v15 = atom.create(v14)
                        let v16 = []
                        let v17 = [v11, ..v16]
                        let v18 = [v6, ..v17]
                        let v19 = [v10, ..v18]
                        let v20 = erlang_term_apply(v13, v15, v19)
                        let v21 = erlang_term_coerce(v20)
                        let v22 = "erlang"
                        let v23 = atom.create(v22)
                        let v25 = atom.create("is_binary")
                        let v26 = []
                        let v27 = [v21, ..v26]
                        let v28 = erlang_term_apply(v23, v25, v27)
                        let v29 = erlang_term_coerce(v28)
                        let v38 =
                            case v29 {
                                True -> {
                                    erlang_term_coerce(v21)
                                }
                                False -> {
                                    let v31 = atom.create(v22)
                                    let v33 = atom.create("integer_to_binary")
                                    let v34 = []
                                    let v35 = [v21, ..v34]
                                    let v36 = erlang_term_apply(v31, v33, v35)
                                    erlang_term_coerce(v36)
                                }
                            }
                        let v39 = erlang_term_coerce(v7)
                        let v41 = erlang_term_coerce("created_at")
                        let v42 = erlang_term_coerce(v39)
                        let v43 = atom.create(v12)
                        let v44 = atom.create(v14)
                        let v45 = []
                        let v46 = [v42, ..v45]
                        let v47 = [v6, ..v46]
                        let v48 = [v41, ..v47]
                        let v49 = erlang_term_apply(v43, v44, v48)
                        let v50 = erlang_term_coerce(v49)
                        let v51 = erlang_term_coerce(v50)
                        let v52 = erlang_term_coerce(v7)
                        let v53 = "text"
                        let v54 = erlang_term_coerce(v53)
                        let v55 = erlang_term_coerce(v52)
                        let v56 = atom.create(v12)
                        let v57 = atom.create(v14)
                        let v58 = []
                        let v59 = [v55, ..v58]
                        let v60 = [v6, ..v59]
                        let v61 = [v54, ..v60]
                        let v62 = erlang_term_apply(v56, v57, v61)
                        let v63 = erlang_term_coerce(v62)
                        let v64 = erlang_term_coerce(v63)
                        let v65 = "0"
                        let v68 = Heap0(l0: v38, l1: v2, l2: v51, l3: v64, l4: v65, l5: v65, l6: v65, l7: Uh3Nil, l8: Uh43Nil)
                        let v69 = erlang_term_coerce(v7)
                        let v71 = erlang_term_coerce("kind")
                        let v72 = erlang_term_coerce(v69)
                        let v73 = atom.create(v12)
                        let v74 = atom.create(v14)
                        let v75 = []
                        let v76 = [v72, ..v75]
                        let v77 = [v6, ..v76]
                        let v78 = [v71, ..v77]
                        let v79 = erlang_term_apply(v73, v74, v78)
                        let v80 = erlang_term_coerce(v79)
                        let v81 = erlang_term_coerce(v80)
                        let v82 = v81 == "retweet"
                        let v163 =
                            case v82 {
                                True -> {
                                    let v83 = erlang_term_coerce(v7)
                                    let v85 = erlang_term_coerce("retweet_author")
                                    let v86 = erlang_term_coerce(v83)
                                    let v87 = atom.create(v12)
                                    let v88 = atom.create(v14)
                                    let v89 = []
                                    let v90 = [v86, ..v89]
                                    let v91 = [v6, ..v90]
                                    let v92 = [v85, ..v91]
                                    let v93 = erlang_term_apply(v87, v88, v92)
                                    let v94 = erlang_term_coerce(v93)
                                    let v95 = erlang_term_coerce(v94)
                                    Us102RepostOf(v95)
                                }
                                False -> {
                                    let v97 = v81 == "reply"
                                    case v97 {
                                        True -> {
                                            let v98 = erlang_term_coerce(v7)
                                            let v100 = erlang_term_coerce("reply_to_user")
                                            let v101 = erlang_term_coerce(v98)
                                            let v102 = atom.create(v12)
                                            let v103 = atom.create(v14)
                                            let v104 = []
                                            let v105 = [v101, ..v104]
                                            let v106 = [v6, ..v105]
                                            let v107 = [v100, ..v106]
                                            let v108 = erlang_term_apply(v102, v103, v107)
                                            let v109 = erlang_term_coerce(v108)
                                            let v110 = erlang_term_coerce(v109)
                                            Us102ReplyTo(v110)
                                        }
                                        False -> {
                                            let v112 = v81 == "quote"
                                            case v112 {
                                                True -> {
                                                    let v113 = erlang_term_coerce(v7)
                                                    let v115 = erlang_term_coerce("quote")
                                                    let v116 = erlang_term_coerce(v113)
                                                    let v117 = atom.create(v12)
                                                    let v118 = atom.create(v14)
                                                    let v119 = []
                                                    let v120 = [v116, ..v119]
                                                    let v121 = [v6, ..v120]
                                                    let v122 = [v115, ..v121]
                                                    let v123 = erlang_term_apply(v117, v118, v122)
                                                    let v124 = erlang_term_coerce(v123)
                                                    let v125 = atom.create(v22)
                                                    let v127 = atom.create("is_map")
                                                    let v128 = []
                                                    let v129 = [v124, ..v128]
                                                    let v130 = erlang_term_apply(v125, v127, v129)
                                                    let v131 = erlang_term_coerce(v130)
                                                    case v131 {
                                                        True -> {
                                                            let v132 = erlang_term_coerce(v7)
                                                            let v134 = erlang_term_coerce("author")
                                                            let v135 = erlang_term_coerce(v132)
                                                            let v136 = atom.create(v12)
                                                            let v137 = atom.create(v14)
                                                            let v138 = []
                                                            let v139 = [v135, ..v138]
                                                            let v140 = [v124, ..v139]
                                                            let v141 = [v134, ..v140]
                                                            let v142 = erlang_term_apply(v136, v137, v141)
                                                            let v143 = erlang_term_coerce(v142)
                                                            let v144 = erlang_term_coerce(v143)
                                                            let v145 = erlang_term_coerce(v7)
                                                            let v146 = erlang_term_coerce(v53)
                                                            let v147 = erlang_term_coerce(v145)
                                                            let v148 = atom.create(v12)
                                                            let v149 = atom.create(v14)
                                                            let v150 = []
                                                            let v151 = [v147, ..v150]
                                                            let v152 = [v124, ..v151]
                                                            let v153 = [v146, ..v152]
                                                            let v154 = erlang_term_apply(v148, v149, v153)
                                                            let v155 = erlang_term_coerce(v154)
                                                            let v156 = erlang_term_coerce(v155)
                                                            Us102QuoteOf(v144, v156)
                                                        }
                                                        False -> Us102QuoteOf(v7, v7)
                                                    }
                                                }
                                                False -> Us102Original
                                            }
                                        }
                                    }
                                }
                            }
                        #(v68, v163)
                    }
                }
            Uh42Cons(v164, v165, v5)
        }
        Uh40Nil -> v1
    }
}

pub fn length_from_480(v0: Int, v1: Uh38) -> Int {
    case v1  {
        Uh38Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v0 + 1, 32)
            length_from_480(v5, v4)
        }
        Uh38Nil -> v0
    }
}

pub fn consumed_479(v0: Uh37, v1: Uh37) -> Uh14 {
    case v0  {
        Uh37Cons(v3, v4) -> {
            let v6 = length_from_480(0, v3)
            let v12 =
                case v1  {
                    Uh37Cons(v8, v9) -> v8
                    Uh37Nil -> Uh38Nil
                }
            let v13 = length_from_480(0, v12)
            let v14 = spiral_wrap_signed(v6 - v13, 32)
            let v19 =
                case v1  {
                    Uh37Cons(v15, v16) -> v16
                    Uh37Nil -> Uh37Nil
                }
            let v20 = consumed_479(v4, v19)
            Uh14Cons(v14, v20)
        }
        Uh37Nil -> Uh14Nil
    }
}

pub fn trusted_484(v0: String) -> Us106 {
    Us106Markup(v0)
}

pub fn entity_493(v0: String) -> String {
    let v1 = v0 == "&"
    case v1 {
        True -> {
            "&amp;"
        }
        False -> {
            let v3 = v0 == "<"
            case v3 {
                True -> {
                    "&lt;"
                }
                False -> {
                    let v5 = v0 == ">"
                    case v5 {
                        True -> {
                            "&gt;"
                        }
                        False -> {
                            let v7 = v0 == "\""
                            case v7 {
                                True -> {
                                    "&quot;"
                                }
                                False -> {
                                    ""
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

pub fn run_of_491(v0: String, v1: Int, v2: Int) -> String {
    let v3 = v2 <= v1
    case v3 {
        True -> {
            ""
        }
        False -> {
            let v5 = spiral_wrap_signed(v2 - 1, 32)
            spiral_string_slice(v0, v1, v5)
        }
    }
}

pub fn escape_step_492(v0: String, v1: Int, v2: Int, v3: String) -> #(Int, String) {
    let v4 = spiral_string_index(v0, v1)
    let v5 = entity_493(v4)
    let v6 = v5 == ""
    case v6 {
        True -> #(v2, v3)
        False -> {
            let v7 = spiral_wrap_signed(v1 + 1, 32)
            let v8 = run_of_491(v0, v2, v1)
            let v9 = { v3 } <> { v8 }
            let v10 = { v9 } <> { v5 }
            #(v7, v10)
        }
    }
}

pub fn escape_from_490(v0: String, v1: Int, v2: Int, v3: String) -> String {
    let v4 = spiral_string_length(v0)
    let v5 = v1 >= v4
    case v5 {
        True -> {
            let v6 = run_of_491(v0, v2, v1)
            let v7 = { v3 } <> { v6 }
            v7
        }
        False -> {
            let #(v8, v9) = escape_step_492(v0, v1, v2, v3)
            let v10 = spiral_wrap_signed(v1 + 1, 32)
            escape_from_490(v0, v10, v8, v9)
        }
    }
}

pub fn escape_489(v0: String) -> Us106 {
    let v4 = escape_from_490(v0, 0, 0, "")
    Us106Markup(v4)
}

pub fn markup_text_498(v0: Us106) -> String {
    case v0  {
        Us106Markup(v1) -> v1
    }
}

pub fn attribute_497(v0: String, v1: String) -> String {
    let v2 = { " " } <> { v1 }
    let v3 = { v2 } <> { "=\"" }
    let v4 = escape_489(v0)
    let v5 = markup_text_498(v4)
    let v6 = { v3 } <> { v5 }
    let v7 = { v6 } <> { "\"" }
    v7
}

pub fn attributes_496(v0: Uh50) -> String {
    case v0  {
        Uh50Cons(v1, v2, v3) -> {
            let v4 = attribute_497(v2, v1)
            let v5 = attributes_496(v3)
            let v6 = { v4 } <> { v5 }
            v6
        }
        Uh50Nil -> {
            ""
        }
    }
}

pub fn element_495(v0: String, v1: Uh50, v2: Us106) -> Us106 {
    let v3 = { "<" } <> { v0 }
    let v4 = attributes_496(v1)
    let v5 = { v3 } <> { v4 }
    let v6 = { v5 } <> { ">" }
    let v7 = markup_text_498(v2)
    let v8 = { v6 } <> { v7 }
    let v9 = { v8 } <> { "</" }
    let v10 = { v9 } <> { v0 }
    let v11 = { v10 } <> { ">" }
    Us106Markup(v11)
}

pub fn anchor_494(v0: String, v1: Us106) -> Us106 {
    let v5 = Uh50Cons("href", v0, Uh50Nil)
    element_495("a", v5, v1)
}

pub fn joined_504(v0: Us106, v1: Us106) -> Us106 {
    let v2 = markup_text_498(v0)
    let v3 = markup_text_498(v1)
    let v4 = { v2 } <> { v3 }
    Us106Markup(v4)
}

pub fn quoted_503(v0: String) -> Us106 {
    let v1 = "\""
    let v2 = trusted_484(v1)
    let v3 = escape_489(v0)
    let v4 = joined_504(v2, v3)
    let v5 = trusted_484(v1)
    joined_504(v4, v5)
}

pub fn image_502(v0: String, v1: String) -> Us106 {
    let v3 = trusted_484("<img src=")
    let v4 = quoted_503(v1)
    let v5 = joined_504(v3, v4)
    let v7 = trusted_484(" alt=")
    let v8 = joined_504(v5, v7)
    let v9 = quoted_503(v0)
    let v10 = joined_504(v8, v9)
    let v12 = trusted_484(">")
    joined_504(v10, v12)
}

pub fn badge_506(v0: String, v1: String, v2: String) -> Us106 {
    let v3 = image_502(v2, v1)
    anchor_494(v0, v3)
}

pub fn wrap_500(v0: String, v1: Us106) -> Us106 {
    element_495(v0, Uh50Nil, v1)
}

pub fn code_of_499(v0: String) -> Us106 {
    let v2 = escape_489(v0)
    wrap_500("code", v2)
}

pub fn linked_488(v0: String, v1: String) -> Us106 {
    let v2 = escape_489(v0)
    anchor_494(v1, v2)
}

pub fn link_html_505(v0: String, v1: String) -> Us106 {
    linked_488(v1, v0)
}

pub fn pic_501(v0: String, v1: String) -> Us106 {
    image_502(v1, v0)
}

pub fn strong_507(v0: Us106) -> Us106 {
    wrap_500("strong", v0)
}

pub fn inline_by_487(v0: fn(Uh45) -> Us106, v1: Uh44) -> Us106 {
    case v1  {
        Uh44AutoLink(v15) -> linked_488(v15, v15)
        Uh44Code(v4) -> code_of_499(v4)
        Uh44Image(v12, v13) -> pic_501(v13, v12)
        Uh44Link(v9, v10) -> link_html_505(v10, v9)
        Uh44LinkedImage(v17, v18, v19) -> badge_506(v19, v18, v17)
        Uh44Strong(v6) -> {
            let v7 = v0(v6)
            strong_507(v7)
        }
        Uh44Text(v2) -> escape_489(v2)
    }
}

pub fn inlines_html_486(v0: Uh45) -> Us106 {
    case v0  {
        Uh45Cons(v1, v2) -> {
            let v3 = closure150(Nil)
            let v4 = inline_by_487(v3, v1)
            let v5 = inlines_html_486(v2)
            joined_504(v4, v5)
        }
        Uh45Nil -> {
            trusted_484("")
        }
    }
}

pub fn closure150(capt: Nil) -> fn(Uh45) -> Us106 {
    fn (v0) {
        inlines_html_486(v0)
    }
}

pub fn items_html_485(v0: Uh46) -> Us106 {
    case v0  {
        Uh46Cons(v1, v2) -> {
            let v4 = trusted_484("<li>")
            let v5 = inlines_html_486(v1)
            let v6 = joined_504(v4, v5)
            let v8 = trusted_484("</li>\n")
            let v9 = joined_504(v6, v8)
            let v10 = items_html_485(v2)
            joined_504(v9, v10)
        }
        Uh46Nil -> {
            trusted_484("")
        }
    }
}

pub fn bullets_html_483(v0: Uh46) -> Us106 {
    let v2 = trusted_484("<ul>\n")
    let v3 = items_html_485(v0)
    let v4 = joined_504(v2, v3)
    let v6 = trusted_484("</ul>\n")
    joined_504(v4, v6)
}

pub fn code_html_509(v0: Uh3) -> Us106 {
    case v0  {
        Uh3Cons(v1, v2) -> {
            let v3 = escape_489(v1)
            let v5 = trusted_484("\n")
            let v6 = joined_504(v3, v5)
            let v7 = code_html_509(v2)
            joined_504(v6, v7)
        }
        Uh3Nil -> {
            trusted_484("")
        }
    }
}

pub fn pre_html_508(v0: Uh3) -> Us106 {
    let v2 = trusted_484("<pre><code>")
    let v3 = code_html_509(v0)
    let v4 = joined_504(v2, v3)
    let v6 = trusted_484("</code></pre>\n")
    joined_504(v4, v6)
}

pub fn level_tag_511(v0: Us103) -> String {
    let v7 = spiral_array_from_list([ "H1", "H2", "H3", "H4", "H5", "H6" ])
    let v8 = case v0 { Us103H1 -> 0 Us103H2 -> 1 Us103H3 -> 2 Us103H4 -> 3 Us103H5 -> 4 Us103H6 -> 5 }
    let v9 = spiral_array_get(v7, v8)
    v9 |> string.lowercase
}

pub fn heading_html_510(v0: Uh45, v1: Us103) -> Us106 {
    let v2 = level_tag_511(v1)
    let v3 = inlines_html_486(v0)
    let v4 = wrap_500(v2, v3)
    let v6 = trusted_484("\n")
    joined_504(v4, v6)
}

pub fn digit_515(v0: Int) -> String {
    let v1 = spiral_wrap_signed(v0, 32)
    let v3 = spiral_wrap_signed(v1 + 1, 32)
    run_of_491("0123456789", v1, v3)
}

pub fn show_i64_514(v0: Int) -> String {
    let v1 = v0 < 10
    case v1 {
        True -> digit_515(v0)
        False -> {
            let v3 = v0 / 10
            let v4 = show_i64_514(v3)
            let v5 = v0 % 10
            let v6 = digit_515(v5)
            let v7 = { v4 } <> { v6 }
            v7
        }
    }
}

pub fn ordered_open_513(v0: Int) -> String {
    let v1 = v0 == 1
    case v1 {
        True -> {
            "<ol>\n"
        }
        False -> {
            let v3 = show_i64_514(v0)
            let v4 = { "<ol start=\"" } <> { v3 }
            let v5 = { v4 } <> { "\">\n" }
            v5
        }
    }
}

pub fn numbered_html_512(v0: Uh46, v1: Int) -> Us106 {
    let v2 = ordered_open_513(v1)
    let v3 = trusted_484(v2)
    let v4 = items_html_485(v0)
    let v5 = joined_504(v3, v4)
    let v7 = trusted_484("</ol>\n")
    joined_504(v5, v7)
}

pub fn para_html_516(v0: Uh45) -> Us106 {
    let v2 = trusted_484("<p>")
    let v3 = inlines_html_486(v0)
    let v4 = joined_504(v2, v3)
    let v6 = trusted_484("</p>\n")
    joined_504(v4, v6)
}

pub fn hr_517() -> Us106 {
    trusted_484("<hr>\n")
}

pub fn align_head_522(v0: Uh47) -> #(Us105, Uh47) {
    case v0  {
        Uh47Cons(v1, v2) -> #(v1, v2)
        Uh47Nil -> {
            #(Us105AlignNone, Uh47Nil)
        }
    }
}

pub fn align_attr_524(v0: Us105) -> String {
    case v0  {
        Us105AlignCenter -> {
            " style=\"text-align: center\""
        }
        Us105AlignLeft -> {
            " style=\"text-align: left\""
        }
        Us105AlignNone -> {
            ""
        }
        Us105AlignRight -> {
            " style=\"text-align: right\""
        }
    }
}

pub fn cell_html_523(v0: String, v1: Us105, v2: Uh45) -> Us106 {
    let v3 = { "<" } <> { v0 }
    let v4 = align_attr_524(v1)
    let v5 = { v3 } <> { v4 }
    let v6 = { v5 } <> { ">" }
    let v7 = trusted_484(v6)
    let v8 = inlines_html_486(v2)
    let v9 = joined_504(v7, v8)
    let v10 = { "</" } <> { v0 }
    let v11 = { v10 } <> { ">" }
    let v12 = trusted_484(v11)
    joined_504(v9, v12)
}
