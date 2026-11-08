import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh13, type Uh29, type Uh37, type Uh36, type Uh41, type Uh51, type Us110, type Us111, Uh13Cons, Uh13Nil, Uh29Cons, Uh29Nil, Uh37Cons, Uh37Nil, Uh3Cons, Uh3Nil, Uh41Cons, Uh41Nil, Uh44Strong, Uh44Text, Uh45Cons, Uh45Nil, Uh49Cons, Uh49Nil, Uh50Cons, Uh50Nil, Uh51Cons, Uh51Nil, Us102Original, Us102QuoteOf, Us102ReplyTo, Us102RepostOf, Us104Paragraph, Us104Rule, Us108None, Us108Some, Us110Elsewhere, Us110Following, Us110Lookup, Us110SearchAll, Us110SearchRecent, Us110Single, Us110Timeline, Us110UsersBy, Us110UsersByIds, Us111Error, Us111Ok, Us2None, Us2Some}
import xsim_frames/part1.{closure1, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part12.{items_from_301, method300}
import xsim_frames/part27.{blocks_html_485, concat_532, element_499, escape_493, joined_508, method531, trusted_488}
import xsim_frames/part3.{method56, method57}

pub fn method530(v0: Uh41, v1: Uh51) -> Uh51 {
    case v0  {
        Uh41Cons(v2, v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method530(v9, v1)
            let v23 =
                case v3  {
                    Us102Original -> {
                        "post"
                    }
                    Us102QuoteOf(v17, v18) -> {
                        "post quote"
                    }
                    Us102ReplyTo(v13) -> {
                        "post reply"
                    }
                    Us102RepostOf(v15) -> {
                        "post repost"
                    }
                }
            let v24 = "class"
            let v26 = Uh50Cons(v24, v23, Uh50Nil)
            let v27 = v2.l1
            let v28 = { "@" } <> { v27 }
            let v29 = v2.l2
            let v30 = { " · " } <> { v29 }
            let v52 =
                case v3  {
                    Us102Original -> {
                        ""
                    }
                    Us102QuoteOf(v43, v44) -> {
                        let v45 = v43 == ""
                        case v45 {
                            True -> {
                                "Quoting"
                            }
                            False -> {
                                let v47 = { "Quoting @" } <> { v43 }
                                v47
                            }
                        }
                    }
                    Us102ReplyTo(v32) -> {
                        let v33 = v32 == ""
                        case v33 {
                            True -> {
                                "Reply to"
                            }
                            False -> {
                                let v35 = { "Reply to @" } <> { v32 }
                                v35
                            }
                        }
                    }
                    Us102RepostOf(v37) -> {
                        let v38 = v37 == ""
                        let v41 =
                            case v38 {
                                True -> {
                                    "Repost of"
                                }
                                False -> {
                                    let v40 = { "Repost of @" } <> { v37 }
                                    v40
                                }
                            }
                        let v42 = { v41 } <> { ", not this account's words" }
                        v42
                    }
                }
            let v53 = v52 == ""
            let v64 =
                case v53 {
                    True -> Uh49Nil
                    False -> {
                        let v55 = Uh44Text(v52)
                        let v57 = Uh45Cons(v55, Uh45Nil)
                        let v58 = Uh44Strong(v57)
                        let v60 = Uh45Cons(v58, Uh45Nil)
                        let v61 = Us104Paragraph(v60)
                        Uh49Cons(v61, Uh49Nil)
                    }
                }
            let v65 = Uh44Text(v28)
            let v67 = Uh45Cons(v65, Uh45Nil)
            let v68 = Uh44Strong(v67)
            let v69 = Uh44Text(v30)
            let v71 = Uh45Cons(v69, Uh45Nil)
            let v72 = Uh45Cons(v68, v71)
            let v73 = Us104Paragraph(v72)
            let v74 = Uh49Cons(v73, v64)
            let v75 = blocks_html_485(v74)
            let v76 = v2.l3
            let v77 = Uh44Text(v76)
            let v79 = Uh45Cons(v77, Uh45Nil)
            let v80 = Us104Paragraph(v79)
            let v82 = Uh49Cons(v80, Uh49Nil)
            let v83 = blocks_html_485(v82)
            let v85 = method531(v4, Uh51Nil)
            let v86 = concat_532(v85)
            let v87 = v6 == 0
            let v89 =
                case v87 {
                    True -> {
                        v7 == 0
                    }
                    False -> False
                }
            let v103 =
                case v89 {
                    True -> {
                        trusted_488("")
                    }
                    False -> {
                        let v95 = Uh50Cons(v24, "counts", Uh50Nil)
                        let v96 = int.to_string(v6)
                        let v97 = { v96 } <> { " likes · " }
                        let v98 = int.to_string(v7)
                        let v99 = { v97 } <> { v98 }
                        let v100 = { v99 } <> { " replies" }
                        let v101 = trusted_488(v100)
                        element_499("p", v95, v101)
                    }
                }
            let v104 = v8 == ""
            let v117 =
                case v104 {
                    True -> {
                        trusted_488("")
                    }
                    False -> {
                        let v107 = v8 == "en"
                        case v107 {
                            True -> {
                                trusted_488("")
                            }
                            False -> {
                                let v113 = Uh50Cons(v24, "lang", Uh50Nil)
                                let v114 = escape_493(v8)
                                element_499("span", v113, v114)
                            }
                        }
                    }
                }
            let v141 =
                case v3  {
                    Us102QuoteOf(v118, v119) -> {
                        let v120 = { "@" } <> { v118 }
                        let v121 = { v120 } <> { ": " }
                        let v122 = { v121 } <> { v119 }
                        let v126 = Uh50Cons(v24, "quoted", Uh50Nil)
                        let v127 = Uh44Text(v122)
                        let v129 = Uh45Cons(v127, Uh45Nil)
                        let v130 = Us104Paragraph(v129)
                        let v132 = Uh49Cons(v130, Uh49Nil)
                        let v133 = blocks_html_485(v132)
                        let v135 = method531(v5, Uh51Nil)
                        let v136 = concat_532(v135)
                        let v137 = joined_508(v133, v136)
                        element_499("blockquote", v126, v137)
                    }
                    _ -> {
                        trusted_488("")
                    }
                }
            let v144 = Uh49Cons(Us104Rule, Uh49Nil)
            let v145 = blocks_html_485(v144)
            let v147 = Uh51Cons(v145, Uh51Nil)
            let v148 = Uh51Cons(v141, v147)
            let v149 = Uh51Cons(v117, v148)
            let v150 = Uh51Cons(v103, v149)
            let v151 = Uh51Cons(v86, v150)
            let v152 = Uh51Cons(v83, v151)
            let v153 = Uh51Cons(v75, v152)
            let v154 = concat_532(v153)
            let v155 = element_499("article", v26, v154)
            Uh51Cons(v155, v10)
        }
        Uh41Nil -> v1
    }
}

pub fn method533(v0: Uh3, v1: String) -> String {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = v1 == ""
            let v7 =
                case v4 {
                    True -> v2
                    False -> {
                        let v5 = { v1 } <> { "." }
                        let v6 = { v5 } <> { v2 }
                        v6
                    }
                }
            method533(v3, v7)
        }
        Uh3Nil -> v1
    }
}

pub fn method534(v0: Uh13, v1: Uh3) -> Uh3 {
    case v0  {
        Uh13Cons(v2, v3) -> {
            let v4 = method534(v3, v1)
            let v5 = int.to_string(v2)
            Uh3Cons(v5, v4)
        }
        Uh13Nil -> v1
    }
}

pub fn method536(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method536(v0, v4, v2)
            let v6 = v3 |> string.lowercase
            let v7 = v6 |> string.starts_with(v0)
            case v7 {
                True -> Uh3Cons(v3, v5)
                False -> v5
            }
        }
        Uh3Nil -> v2
    }
}

pub fn header_value_535(v0: String, v1: String) -> String {
    let v2 = v0 |> string.lowercase
    let v3 = { v2 } <> { ":" }
    let v4 = v1 == ""
    let v8 =
        case v4 {
            True -> Uh3Nil
            False -> {
                split_list_2("\r\n", v1)
            }
        }
    let v10 = method536(v3, v8, Uh3Nil)
    case v10  {
        Uh3Cons(v11, v12) -> {
            let v13 = spiral_string_length(v3)
            let v14 = spiral_string_length(v11)
            let v15 = spiral_wrap_signed(v14 - v13, 32)
            let v16 = spiral_wrap_signed(v13 + v15, 32)
            let v17 = spiral_wrap_signed(v16 - 1, 32)
            let v18 = spiral_string_slice(v11, v13, v17)
            let v19 = spiral_string_length(v18)
            let v21 = method56(v18, v19, 0)
            let v22 = spiral_wrap_signed(v19 - 1, 32)
            let v23 = spiral_string_slice(v18, v21, v22)
            let v24 = spiral_string_length(v23)
            let v25 = method57(v23, v24)
            spiral_string_slice(v23, 0, v25)
        }
        Uh3Nil -> {
            ""
        }
    }
}

pub fn method542(v0: Uh37, v1: Uh37) -> Uh37 {
    case v0  {
        Uh37Cons(v2, v3, v4) -> {
            let v5 = method542(v4, v1)
            Uh37Cons(v2, v3, v5)
        }
        Uh37Nil -> v1
    }
}

pub fn method543(v0: Uh37, v1: Uh29) -> Uh29 {
    case v0  {
        Uh37Cons(v2, v3, v4) -> {
            let v5 = method543(v4, v1)
            let v6 = atom.create(v2)
            let v7 = erlang_term_coerce(v6)
            let v8 = []
            let v9 = [v3, ..v8]
            let v10 = [v7, ..v9]
            let v11 = erlang_term_tuple(v10)
            Uh29Cons(v11, v5)
        }
        Uh37Nil -> v1
    }
}

pub fn log_row_541(v0: String, v1: String, v2: String, _v3: String, v4: String, v5: String) -> Dynamic {
    let v6 = v0 == "POST"
    let v7 = "\r\n\r\n"
    let v8 = option.from_result(result.map(string.split_once(v4, v7), pair.first))
    let v9 = closure1(Nil)
    let v10 = v8 |> option.map(v9)
    let v12 = v10 |> option.unwrap(Us2None)
    let v16 =
        case v12  {
            Us2None -> -1
            Us2Some(v13) -> {
                bit_array.byte_size(bit_array.from_string(v13))
            }
        }
    let v17 = spiral_wrap_signed(v16 + 4, 32)
    let v18 = option.from_result(result.map(string.split_once(v4, v7), pair.first))
    let v19 = v18 |> option.map(v9)
    let v21 = v19 |> option.unwrap(Us2None)
    let v25 =
        case v21  {
            Us2None -> -1
            Us2Some(v22) -> {
                bit_array.byte_size(bit_array.from_string(v22))
            }
        }
    let v26 = v25 < 0
    let v33 =
        case v26 {
            True -> {
                ""
            }
            False -> {
                let v28 = spiral_string_length(v4)
                let v29 = spiral_wrap_signed(v28 - v17, 32)
                let v30 = spiral_wrap_signed(v17 + v29, 32)
                let v31 = spiral_wrap_signed(v30 - 1, 32)
                spiral_string_slice(v4, v17, v31)
            }
        }
    let v34 = erlang_term_coerce(v33)
    let v39 =
        case v6 {
            True -> {
                Uh37Cons("body", v34, Uh37Nil)
            }
            False -> Uh37Nil
        }
    let v40 = v5 != ""
    let v41 = erlang_term_coerce(v40)
    let v42 = v5 == ""
    let v47 =
        case v42 {
            True -> {
                let v44 = atom.create("null")
                erlang_term_coerce(v44)
            }
            False -> {
                erlang_term_coerce(v5)
            }
        }
    let v48 = erlang_term_coerce(v0)
    let v49 = erlang_term_coerce(v1)
    let v50 = erlang_term_coerce(v2)
    let v52 = method542(v39, Uh37Nil)
    let v54 = method543(v52, Uh29Nil)
    let v56 = atom.create("context")
    let v57 = erlang_term_coerce(v56)
    let v58 = []
    let v59 = [v47, ..v58]
    let v60 = [v57, ..v59]
    let v61 = erlang_term_tuple(v60)
    let v63 = atom.create("authorized")
    let v64 = erlang_term_coerce(v63)
    let v65 = []
    let v66 = [v41, ..v65]
    let v67 = [v64, ..v66]
    let v68 = erlang_term_tuple(v67)
    let v70 = atom.create("query")
    let v71 = erlang_term_coerce(v70)
    let v72 = []
    let v73 = [v50, ..v72]
    let v74 = [v71, ..v73]
    let v75 = erlang_term_tuple(v74)
    let v77 = atom.create("path")
    let v78 = erlang_term_coerce(v77)
    let v79 = []
    let v80 = [v49, ..v79]
    let v81 = [v78, ..v80]
    let v82 = erlang_term_tuple(v81)
    let v84 = atom.create("method")
    let v85 = erlang_term_coerce(v84)
    let v86 = []
    let v87 = [v48, ..v86]
    let v88 = [v85, ..v87]
    let v89 = erlang_term_tuple(v88)
    let v90 = []
    let v91 = method300(v54, v90)
    let v92 = [v61, ..v91]
    let v93 = [v68, ..v92]
    let v94 = [v75, ..v93]
    let v95 = [v82, ..v94]
    let v96 = [v89, ..v95]
    let v97 = erlang_term_coerce(v96)
    let v99 = atom.create("maps")
    let v101 = atom.create("from_list")
    let v102 = []
    let v103 = [v97, ..v102]
    erlang_term_apply(v99, v101, v103)
}

pub fn logged_540(v0: String, v1: String, v2: String, v3: String, v4: String, v5: String, v6: String) -> Nil {
    let v7 = log_row_541(v1, v2, v3, v4, v5, v6)
    let v9 = atom.create("json")
    let v11 = atom.create("encode")
    let v12 = []
    let v13 = [v7, ..v12]
    let v14 = erlang_term_apply(v9, v11, v13)
    let v16 = atom.create("erlang")
    let v18 = atom.create("iolist_to_binary")
    let v19 = []
    let v20 = [v14, ..v19]
    let v21 = erlang_term_apply(v16, v18, v20)
    let v22 = erlang_term_coerce(v21)
    let v23 = { v22 } <> { "\n" }
    let v24 = erlang_term_coerce(v0)
    let v25 = erlang_term_coerce(v23)
    let v27 = atom.create("append")
    let v28 = erlang_term_coerce(v27)
    let v29 = []
    let v30 = [v28, ..v29]
    let v31 = erlang_term_coerce(v30)
    let v33 = atom.create("file")
    let v35 = atom.create("write_file")
    let v36 = []
    let v37 = [v31, ..v36]
    let v38 = [v25, ..v37]
    let v39 = [v24, ..v38]
    let v40 = erlang_term_apply(v33, v35, v39)
    let v42 = atom.create("ok")
    let v43 = erlang_term_coerce(v42)
    let _v44 = v40 == v43
    Nil
}

pub fn ok_c153(capt: Nil) -> fn(Dynamic) -> Us111 {
    fn (v0) {
        Us111Ok(v0)
    }
}

pub fn method547() -> fn(Dynamic) -> Us111 {
    ok_c153(Nil)
}

pub fn error_c154(capt: Nil) -> fn(Nil) -> Us111 {
    fn (dom) {
        Us111Error
    }
}

pub fn method548() -> fn(Nil) -> Us111 {
    error_c154(Nil)
}

pub fn route_of_546(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, _v12: Uh36, _v13: String, v14: String) -> Us110 {
    let v15 = v14 == ""
    let v19 =
        case v15 {
            True -> Uh3Nil
            False -> {
                split_list_2("/", v14)
            }
        }
    case v19  {
        Uh3Cons(v20, v21) -> {
            let v22 = "" == v20
            case v22 {
                True -> {
                    case v21  {
                        Uh3Cons(v23, v24) -> {
                            let v25 = "2" == v23
                            case v25 {
                                True -> {
                                    case v24  {
                                        Uh3Cons(v26, v27) -> {
                                            let v28 = "users" == v26
                                            case v28 {
                                                True -> {
                                                    case v27  {
                                                        Uh3Cons(v29, v30) -> {
                                                            let v31 = "by" == v29
                                                            case v31 {
                                                                True -> {
                                                                    case v30  {
                                                                        Uh3Cons(v33, v34) -> {
                                                                            case v34  {
                                                                                Uh3Nil -> {
                                                                                    let v35 = dict.has_key(v3, v29)
                                                                                    let v36 = v35 == False
                                                                                    case v36 {
                                                                                        True -> Us110Elsewhere
                                                                                        False -> {
                                                                                            let v38 = v33 == "following"
                                                                                            case v38 {
                                                                                                True -> {
                                                                                                    let v39 = dict.get(v3, v29)
                                                                                                    let v40 = method547()
                                                                                                    let v41 = method548()
                                                                                                    let v42 = case v39 { Ok(x) -> v40(x) Error(x) -> v41(x) }
                                                                                                    let v47 =
                                                                                                        case v42  {
                                                                                                            Us111Error -> Us108None
                                                                                                            Us111Ok(v43) -> Us108Some(v43)
                                                                                                        }
                                                                                                    let v51 =
                                                                                                        case v47  {
                                                                                                            Us108None -> panic as "dict.present: the key is not in the dict"
                                                                                                            Us108Some(v48) -> v48
                                                                                                        }
                                                                                                    Us110Following(v51)
                                                                                                }
                                                                                                False -> {
                                                                                                    let v53 = v33 == "tweets"
                                                                                                    case v53 {
                                                                                                        True -> {
                                                                                                            let v54 = dict.get(v3, v29)
                                                                                                            let v55 = method547()
                                                                                                            let v56 = method548()
                                                                                                            let v57 = case v54 { Ok(x) -> v55(x) Error(x) -> v56(x) }
                                                                                                            let v62 =
                                                                                                                case v57  {
                                                                                                                    Us111Error -> Us108None
                                                                                                                    Us111Ok(v58) -> Us108Some(v58)
                                                                                                                }
                                                                                                            let v66 =
                                                                                                                case v62  {
                                                                                                                    Us108None -> panic as "dict.present: the key is not in the dict"
                                                                                                                    Us108Some(v63) -> v63
                                                                                                                }
                                                                                                            Us110Timeline(v66)
                                                                                                        }
                                                                                                        False -> Us110Elsewhere
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                                _ -> Us110Elsewhere
                                                                            }
                                                                        }
                                                                        Uh3Nil -> Us110UsersBy
                                                                    }
                                                                }
                                                                False -> {
                                                                    case v30  {
                                                                        Uh3Cons(v76, v77) -> {
                                                                            case v77  {
                                                                                Uh3Nil -> {
                                                                                    let v78 = dict.has_key(v3, v29)
                                                                                    let v79 = v78 == False
                                                                                    case v79 {
                                                                                        True -> Us110Elsewhere
                                                                                        False -> {
                                                                                            let v81 = v76 == "following"
                                                                                            case v81 {
                                                                                                True -> {
                                                                                                    let v82 = dict.get(v3, v29)
                                                                                                    let v83 = method547()
                                                                                                    let v84 = method548()
                                                                                                    let v85 = case v82 { Ok(x) -> v83(x) Error(x) -> v84(x) }
                                                                                                    let v90 =
                                                                                                        case v85  {
                                                                                                            Us111Error -> Us108None
                                                                                                            Us111Ok(v86) -> Us108Some(v86)
                                                                                                        }
                                                                                                    let v94 =
                                                                                                        case v90  {
                                                                                                            Us108None -> panic as "dict.present: the key is not in the dict"
                                                                                                            Us108Some(v91) -> v91
                                                                                                        }
                                                                                                    Us110Following(v94)
                                                                                                }
                                                                                                False -> {
                                                                                                    let v96 = v76 == "tweets"
                                                                                                    case v96 {
                                                                                                        True -> {
                                                                                                            let v97 = dict.get(v3, v29)
                                                                                                            let v98 = method547()
                                                                                                            let v99 = method548()
                                                                                                            let v100 = case v97 { Ok(x) -> v98(x) Error(x) -> v99(x) }
                                                                                                            let v105 =
                                                                                                                case v100  {
                                                                                                                    Us111Error -> Us108None
                                                                                                                    Us111Ok(v101) -> Us108Some(v101)
                                                                                                                }
                                                                                                            let v109 =
                                                                                                                case v105  {
                                                                                                                    Us108None -> panic as "dict.present: the key is not in the dict"
                                                                                                                    Us108Some(v106) -> v106
                                                                                                                }
                                                                                                            Us110Timeline(v109)
                                                                                                        }
                                                                                                        False -> Us110Elsewhere
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                                _ -> Us110Elsewhere
                                                                            }
                                                                        }
                                                                        _ -> Us110Elsewhere
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        Uh3Nil -> Us110UsersByIds
                                                    }
                                                }
                                                False -> {
                                                    let v123 = "tweets" == v26
                                                    case v123 {
                                                        True -> {
                                                            case v27  {
                                                                Uh3Cons(v125, v126) -> {
                                                                    case v126  {
                                                                        Uh3Nil -> Us110Single(v125)
                                                                        _ -> {
                                                                            let v128 = "search" == v125
                                                                            case v128 {
                                                                                True -> {
                                                                                    case v126  {
                                                                                        Uh3Cons(v129, v130) -> {
                                                                                            case v130  {
                                                                                                Uh3Nil -> {
                                                                                                    let v131 = v129 == "recent"
                                                                                                    case v131 {
                                                                                                        True -> Us110SearchRecent
                                                                                                        False -> {
                                                                                                            let v133 = v129 == "all"
                                                                                                            case v133 {
                                                                                                                True -> Us110SearchAll
                                                                                                                False -> Us110Elsewhere
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                _ -> Us110Elsewhere
                                                                                            }
                                                                                        }
                                                                                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                                    }
                                                                                }
                                                                                False -> Us110Elsewhere
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                                Uh3Nil -> Us110Lookup
                                                            }
                                                        }
                                                        False -> Us110Elsewhere
                                                    }
                                                }
                                            }
                                        }
                                        _ -> Us110Elsewhere
                                    }
                                }
                                False -> Us110Elsewhere
                            }
                        }
                        _ -> Us110Elsewhere
                    }
                }
                False -> Us110Elsewhere
            }
        }
        _ -> Us110Elsewhere
    }
}

pub fn method552(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method552(v3, v1)
            let v5 = "erlang"
            let v6 = atom.create(v5)
            let v8 = atom.create("is_binary")
            let v9 = []
            let v10 = [v2, ..v9]
            let v11 = erlang_term_apply(v6, v8, v10)
            let v12 = erlang_term_coerce(v11)
            let v21 =
                case v12 {
                    True -> {
                        erlang_term_coerce(v2)
                    }
                    False -> {
                        let v14 = atom.create(v5)
                        let v16 = atom.create("integer_to_binary")
                        let v17 = []
                        let v18 = [v2, ..v17]
                        let v19 = erlang_term_apply(v14, v16, v18)
                        erlang_term_coerce(v19)
                    }
                }
            Uh3Cons(v21, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method553(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Uh3, v15: Uh3) -> Uh3 {
    case v14  {
        Uh3Cons(v16, v17) -> {
            let v18 = method553(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v17, v15)
            let v19 = dict.has_key(v3, v16)
            case v19 {
                True -> Uh3Cons(v16, v18)
                False -> v18
            }
        }
        Uh3Nil -> v15
    }
}

pub fn method554(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Uh3, v15: Uh29) -> Uh29 {
    case v14  {
        Uh3Cons(v16, v17) -> {
            let v18 = method554(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v17, v15)
            let v19 = dict.get(v3, v16)
            let v20 = method547()
            let v21 = method548()
            let v22 = case v19 { Ok(x) -> v20(x) Error(x) -> v21(x) }
            let v27 =
                case v22  {
                    Us111Error -> Us108None
                    Us111Ok(v23) -> Us108Some(v23)
                }
            let v31 =
                case v27  {
                    Us108None -> panic as "dict.present: the key is not in the dict"
                    Us108Some(v28) -> v28
                }
            Uh29Cons(v31, v18)
        }
        Uh3Nil -> v15
    }
}

pub fn followed_551(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Dynamic) -> Uh29 {
    let v15 = []
    let v16 = erlang_term_coerce(v15)
    let v18 = erlang_term_coerce("following")
    let v19 = erlang_term_coerce(v16)
    let v21 = atom.create("maps")
    let v23 = atom.create("get")
    let v24 = []
    let v25 = [v19, ..v24]
    let v26 = [v14, ..v25]
    let v27 = [v18, ..v26]
    let v28 = erlang_term_apply(v21, v23, v27)
    let v29 = erlang_term_coerce(v28)
    let v31 = atom.create("lists")
    let v33 = atom.create("reverse")
    let v34 = []
    let v35 = [v29, ..v34]
    let v36 = erlang_term_apply(v31, v33, v35)
    let v38 = items_from_301(v36, Uh29Nil)
    let v40 = method552(v38, Uh3Nil)
    let v42 = method553(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v40, Uh3Nil)
    method554(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v42, Uh29Nil)
}

pub fn sliced_555(v0: Int, v1: Int, v2: Uh29) -> Uh29 {
    case v2  {
        Uh29Cons(v3, v4) -> {
            let v5 = v0 > 0
            case v5 {
                True -> {
                    let v6 = spiral_wrap_signed(v0 - 1, 32)
                    sliced_555(v6, v1, v4)
                }
                False -> {
                    let v8 = v1 > 0
                    case v8 {
                        True -> {
                            let v10 = spiral_wrap_signed(v1 - 1, 32)
                            let v11 = sliced_555(0, v10, v4)
                            Uh29Cons(v3, v11)
                        }
                        False -> Uh29Nil
                    }
                }
            }
        }
        _ -> Uh29Nil
    }
}

pub fn method556(v0: Uh29, v1: Int) -> Int {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method556(v3, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method557(v0: Uh29, v1: Uh29) -> Uh29 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method557(v3, v1)
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
            let v16 = [v2, ..v15]
            let v17 = [v8, ..v16]
            let v18 = erlang_term_apply(v11, v13, v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = erlang_term_coerce(v5)
            let v21 = "name"
            let v22 = erlang_term_coerce(v21)
            let v23 = erlang_term_coerce(v20)
            let v24 = atom.create(v10)
            let v25 = atom.create(v12)
            let v26 = []
            let v27 = [v23, ..v26]
            let v28 = [v2, ..v27]
            let v29 = [v22, ..v28]
            let v30 = erlang_term_apply(v24, v25, v29)
            let v31 = erlang_term_coerce(v30)
            let v32 = erlang_term_coerce(v5)
            let v33 = "id"
            let v34 = erlang_term_coerce(v33)
            let v35 = erlang_term_coerce(v32)
            let v36 = atom.create(v10)
            let v37 = atom.create(v12)
            let v38 = []
            let v39 = [v35, ..v38]
            let v40 = [v2, ..v39]
            let v41 = [v34, ..v40]
            let v42 = erlang_term_apply(v36, v37, v41)
            let v43 = erlang_term_coerce(v42)
            let v44 = atom.create(v7)
            let v45 = erlang_term_coerce(v44)
            let v46 = []
            let v47 = [v19, ..v46]
            let v48 = [v45, ..v47]
            let v49 = erlang_term_tuple(v48)
            let v50 = atom.create(v21)
            let v51 = erlang_term_coerce(v50)
            let v52 = []
            let v53 = [v31, ..v52]
            let v54 = [v51, ..v53]
            let v55 = erlang_term_tuple(v54)
            let v56 = atom.create(v33)
            let v57 = erlang_term_coerce(v56)
            let v58 = []
            let v59 = [v43, ..v58]
            let v60 = [v57, ..v59]
            let v61 = erlang_term_tuple(v60)
            let v62 = []
            let v63 = [v49, ..v62]
            let v64 = [v55, ..v63]
            let v65 = [v61, ..v64]
            let v66 = erlang_term_coerce(v65)
            let v67 = atom.create(v10)
            let v69 = atom.create("from_list")
            let v70 = []
            let v71 = [v66, ..v70]
            let v72 = erlang_term_apply(v67, v69, v71)
            Uh29Cons(v72, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn following_body_550(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Dynamic, v15: Int, v16: Int) -> Dynamic {
    let v17 = followed_551(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    let v18 = sliced_555(v15, v16, v17)
    let v20 = method556(v18, 0)
    let v21 = spiral_wrap_signed(v15 + v16, 32)
    let v23 = method556(v17, 0)
    let v24 = v21 < v23
    let v32 =
        case v24 {
            True -> {
                let v25 = int.to_string(v21)
                let v26 = { "p" } <> { v25 }
                let v27 = erlang_term_coerce(v26)
                Uh37Cons("next_token", v27, Uh37Nil)
            }
            False -> Uh37Nil
        }
    let v33 = erlang_term_coerce(v20)
    let v35 = method543(v32, Uh29Nil)
    let v37 = atom.create("result_count")
    let v38 = erlang_term_coerce(v37)
    let v39 = []
    let v40 = [v33, ..v39]
    let v41 = [v38, ..v40]
    let v42 = erlang_term_tuple(v41)
    let v43 = []
    let v44 = method300(v35, v43)
    let v45 = [v42, ..v44]
    let v46 = erlang_term_coerce(v45)
    let v47 = "maps"
    let v48 = atom.create(v47)
    let v49 = "from_list"
    let v50 = atom.create(v49)
    let v51 = []
    let v52 = [v46, ..v51]
    let v53 = erlang_term_apply(v48, v50, v52)
    let v55 = method557(v18, Uh29Nil)
    let v63 =
        case v55  {
            Uh29Nil -> Uh37Nil
            _ -> {
                let v57 = []
                let v58 = method300(v55, v57)
                let v59 = erlang_term_coerce(v58)
                Uh37Cons("data", v59, Uh37Nil)
            }
        }
    let v66 = Uh37Cons("meta", v53, Uh37Nil)
    let v67 = method542(v63, v66)
    let v69 = method543(v67, Uh29Nil)
    let v70 = []
    let v71 = method300(v69, v70)
    let v72 = erlang_term_coerce(v71)
    let v73 = atom.create(v47)
    let v74 = atom.create(v49)
    let v75 = []
    let v76 = [v72, ..v75]
    erlang_term_apply(v73, v74, v76)
}
