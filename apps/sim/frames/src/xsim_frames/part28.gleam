import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh13, type Uh29, type Uh37, type Uh36, type Uh41, type Us106, type Uh51, type Us110, type Us111, Uh13Cons, Uh13Nil, Uh29Cons, Uh29Nil, Uh37Cons, Uh37Nil, Uh3Cons, Uh3Nil, Uh41Cons, Uh41Nil, Uh44Strong, Uh44Text, Uh45Cons, Uh45Nil, Uh49Cons, Uh49Nil, Uh50Cons, Uh50Nil, Uh51Cons, Uh51Nil, Us102Original, Us102QuoteOf, Us102ReplyTo, Us102RepostOf, Us104Paragraph, Us104Rule, Us106Markup, Us108None, Us108Some, Us110Elsewhere, Us110Following, Us110Lookup, Us110SearchAll, Us110SearchRecent, Us110Single, Us110Timeline, Us110UsersBy, Us110UsersByIds, Us111Error, Us111Ok, Us2None, Us2Some}
import xsim_frames/part1.{closure1, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part12.{items_from_301, method300}
import xsim_frames/part27.{blocks_html_485, element_499, escape_493, joined_508, method532, trusted_488}
import xsim_frames/part3.{method56, method57}

pub fn concat_533(v0: Uh51) -> Us106 {
    case v0  {
        Uh51Cons(v1, v2) -> {
            let v3 = concat_533(v2)
            joined_508(v1, v3)
        }
        Uh51Nil -> {
            Us106Markup("")
        }
    }
}

pub fn method531(v0: Uh41, v1: Uh51) -> Uh51 {
    case v0  {
        Uh41Cons(v2, v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method531(v9, v1)
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
            let v27 = "div"
            let v30 = Uh50Cons(v24, "row", Uh50Nil)
            let v33 = Uh50Cons(v24, "avatar", Uh50Nil)
            let v34 = ""
            let v35 = trusted_488(v34)
            let v36 = element_499(v27, v33, v35)
            let v39 = Uh50Cons(v24, "content", Uh50Nil)
            let v40 = v2.l1
            let v41 = { "@" } <> { v40 }
            let v42 = v2.l2
            let v43 = { " · " } <> { v42 }
            let v44 = { v43 } <> { " · " }
            let v45 = v2.l0
            let v46 = { v44 } <> { v45 }
            let v62 =
                case v3  {
                    Us102Original -> v34
                    Us102QuoteOf(v53, v54) -> {
                        let v55 = v53 == ""
                        case v55 {
                            True -> {
                                "Quoting"
                            }
                            False -> {
                                let v57 = { "Quoting @" } <> { v53 }
                                v57
                            }
                        }
                    }
                    Us102ReplyTo(v47) -> v34
                    Us102RepostOf(v48) -> {
                        let v49 = v48 == ""
                        case v49 {
                            True -> {
                                "Repost of"
                            }
                            False -> {
                                let v51 = { "Repost of @" } <> { v48 }
                                v51
                            }
                        }
                    }
                }
            let v63 = v62 == ""
            let v74 =
                case v63 {
                    True -> Uh49Nil
                    False -> {
                        let v65 = Uh44Text(v62)
                        let v67 = Uh45Cons(v65, Uh45Nil)
                        let v68 = Uh44Strong(v67)
                        let v70 = Uh45Cons(v68, Uh45Nil)
                        let v71 = Us104Paragraph(v70)
                        Uh49Cons(v71, Uh49Nil)
                    }
                }
            let v75 = Uh44Text(v41)
            let v77 = Uh45Cons(v75, Uh45Nil)
            let v78 = Uh44Strong(v77)
            let v79 = Uh44Text(v46)
            let v81 = Uh45Cons(v79, Uh45Nil)
            let v82 = Uh45Cons(v78, v81)
            let v83 = Us104Paragraph(v82)
            let v84 = Uh49Cons(v83, v74)
            let v85 = blocks_html_485(v84)
            let v86 = v2.l3
            let v87 = "&lt;"
            let v88 = "<"
            let v89 = v86 |> string.replace(v87, v88)
            let v90 = "&gt;"
            let v91 = ">"
            let v92 = v89 |> string.replace(v90, v91)
            let v93 = "&quot;"
            let v94 = "\""
            let v95 = v92 |> string.replace(v93, v94)
            let v96 = "&#39;"
            let v97 = "'"
            let v98 = v95 |> string.replace(v96, v97)
            let v99 = "&amp;"
            let v100 = "&"
            let v101 = v98 |> string.replace(v99, v100)
            let v102 = Uh44Text(v101)
            let v104 = Uh45Cons(v102, Uh45Nil)
            let v105 = Us104Paragraph(v104)
            let v107 = Uh49Cons(v105, Uh49Nil)
            let v108 = blocks_html_485(v107)
            let v110 = method532(v4, Uh51Nil)
            let v111 = concat_533(v110)
            let v112 = v6 == 0
            let v114 =
                case v112 {
                    True -> {
                        v7 == 0
                    }
                    False -> False
                }
            let v127 =
                case v114 {
                    True -> trusted_488(v34)
                    False -> {
                        let v119 = Uh50Cons(v24, "counts", Uh50Nil)
                        let v120 = int.to_string(v6)
                        let v121 = { v120 } <> { " likes · " }
                        let v122 = int.to_string(v7)
                        let v123 = { v121 } <> { v122 }
                        let v124 = { v123 } <> { " replies" }
                        let v125 = trusted_488(v124)
                        element_499("p", v119, v125)
                    }
                }
            let v128 = v8 == ""
            let v139 =
                case v128 {
                    True -> trusted_488(v34)
                    False -> {
                        let v130 = v8 == "en"
                        case v130 {
                            True -> trusted_488(v34)
                            False -> {
                                let v135 = Uh50Cons(v24, "lang", Uh50Nil)
                                let v136 = escape_493(v8)
                                element_499("span", v135, v136)
                            }
                        }
                    }
                }
            let v167 =
                case v3  {
                    Us102QuoteOf(v140, v141) -> {
                        let v142 = { "@" } <> { v140 }
                        let v143 = { v142 } <> { ": " }
                        let v144 = v141 |> string.replace(v87, v88)
                        let v145 = v144 |> string.replace(v90, v91)
                        let v146 = v145 |> string.replace(v93, v94)
                        let v147 = v146 |> string.replace(v96, v97)
                        let v148 = v147 |> string.replace(v99, v100)
                        let v149 = { v143 } <> { v148 }
                        let v153 = Uh50Cons(v24, "quoted", Uh50Nil)
                        let v154 = Uh44Text(v149)
                        let v156 = Uh45Cons(v154, Uh45Nil)
                        let v157 = Us104Paragraph(v156)
                        let v159 = Uh49Cons(v157, Uh49Nil)
                        let v160 = blocks_html_485(v159)
                        let v162 = method532(v5, Uh51Nil)
                        let v163 = concat_533(v162)
                        let v164 = joined_508(v160, v163)
                        element_499("blockquote", v153, v164)
                    }
                    _ -> trusted_488(v34)
                }
            let v170 = Uh49Cons(Us104Rule, Uh49Nil)
            let v171 = blocks_html_485(v170)
            let v173 = Uh51Cons(v171, Uh51Nil)
            let v174 = Uh51Cons(v167, v173)
            let v175 = Uh51Cons(v139, v174)
            let v176 = Uh51Cons(v127, v175)
            let v177 = Uh51Cons(v111, v176)
            let v178 = Uh51Cons(v108, v177)
            let v179 = Uh51Cons(v85, v178)
            let v180 = concat_533(v179)
            let v181 = element_499(v27, v39, v180)
            let v182 = joined_508(v36, v181)
            let v183 = element_499(v27, v30, v182)
            let v184 = element_499("article", v26, v183)
            Uh51Cons(v184, v10)
        }
        Uh41Nil -> v1
    }
}

pub fn method534(v0: Uh51, v1: Uh51) -> Uh51 {
    case v0  {
        Uh51Cons(v2, v3) -> {
            let v4 = method534(v3, v1)
            Uh51Cons(v2, v4)
        }
        Uh51Nil -> v1
    }
}

pub fn method535(v0: Uh3, v1: String) -> String {
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
            method535(v3, v7)
        }
        Uh3Nil -> v1
    }
}

pub fn method536(v0: Uh13, v1: Uh3) -> Uh3 {
    case v0  {
        Uh13Cons(v2, v3) -> {
            let v4 = method536(v3, v1)
            let v5 = int.to_string(v2)
            Uh3Cons(v5, v4)
        }
        Uh13Nil -> v1
    }
}

pub fn method538(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method538(v0, v4, v2)
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

pub fn header_value_537(v0: String, v1: String) -> String {
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
    let v10 = method538(v3, v8, Uh3Nil)
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

pub fn method544(v0: Uh37, v1: Uh37) -> Uh37 {
    case v0  {
        Uh37Cons(v2, v3, v4) -> {
            let v5 = method544(v4, v1)
            Uh37Cons(v2, v3, v5)
        }
        Uh37Nil -> v1
    }
}

pub fn method545(v0: Uh37, v1: Uh29) -> Uh29 {
    case v0  {
        Uh37Cons(v2, v3, v4) -> {
            let v5 = method545(v4, v1)
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

pub fn log_row_543(v0: String, v1: String, v2: String, _v3: String, v4: String, v5: String) -> Dynamic {
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
    let v52 = method544(v39, Uh37Nil)
    let v54 = method545(v52, Uh29Nil)
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

pub fn logged_542(v0: String, v1: String, v2: String, v3: String, v4: String, v5: String, v6: String) -> Nil {
    let v7 = log_row_543(v1, v2, v3, v4, v5, v6)
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

pub fn method549() -> fn(Dynamic) -> Us111 {
    ok_c153(Nil)
}

pub fn error_c154(capt: Nil) -> fn(Nil) -> Us111 {
    fn (dom) {
        Us111Error
    }
}

pub fn method550() -> fn(Nil) -> Us111 {
    error_c154(Nil)
}

pub fn route_of_548(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, _v12: Uh36, _v13: String, _v14: String, v15: String) -> Us110 {
    let v16 = v15 == ""
    let v20 =
        case v16 {
            True -> Uh3Nil
            False -> {
                split_list_2("/", v15)
            }
        }
    case v20  {
        Uh3Cons(v21, v22) -> {
            let v23 = "" == v21
            case v23 {
                True -> {
                    case v22  {
                        Uh3Cons(v24, v25) -> {
                            let v26 = "2" == v24
                            case v26 {
                                True -> {
                                    case v25  {
                                        Uh3Cons(v27, v28) -> {
                                            let v29 = "users" == v27
                                            case v29 {
                                                True -> {
                                                    case v28  {
                                                        Uh3Cons(v30, v31) -> {
                                                            let v32 = "by" == v30
                                                            case v32 {
                                                                True -> {
                                                                    case v31  {
                                                                        Uh3Cons(v34, v35) -> {
                                                                            case v35  {
                                                                                Uh3Nil -> {
                                                                                    let v36 = dict.has_key(v3, v30)
                                                                                    let v37 = v36 == False
                                                                                    case v37 {
                                                                                        True -> Us110Elsewhere
                                                                                        False -> {
                                                                                            let v39 = v34 == "following"
                                                                                            case v39 {
                                                                                                True -> {
                                                                                                    let v40 = dict.get(v3, v30)
                                                                                                    let v41 = method549()
                                                                                                    let v42 = method550()
                                                                                                    let v43 = case v40 { Ok(x) -> v41(x) Error(x) -> v42(x) }
                                                                                                    let v48 =
                                                                                                        case v43  {
                                                                                                            Us111Error -> Us108None
                                                                                                            Us111Ok(v44) -> Us108Some(v44)
                                                                                                        }
                                                                                                    let v52 =
                                                                                                        case v48  {
                                                                                                            Us108None -> panic as "dict.present: the key is not in the dict"
                                                                                                            Us108Some(v49) -> v49
                                                                                                        }
                                                                                                    Us110Following(v52)
                                                                                                }
                                                                                                False -> {
                                                                                                    let v54 = v34 == "tweets"
                                                                                                    case v54 {
                                                                                                        True -> {
                                                                                                            let v55 = dict.get(v3, v30)
                                                                                                            let v56 = method549()
                                                                                                            let v57 = method550()
                                                                                                            let v58 = case v55 { Ok(x) -> v56(x) Error(x) -> v57(x) }
                                                                                                            let v63 =
                                                                                                                case v58  {
                                                                                                                    Us111Error -> Us108None
                                                                                                                    Us111Ok(v59) -> Us108Some(v59)
                                                                                                                }
                                                                                                            let v67 =
                                                                                                                case v63  {
                                                                                                                    Us108None -> panic as "dict.present: the key is not in the dict"
                                                                                                                    Us108Some(v64) -> v64
                                                                                                                }
                                                                                                            Us110Timeline(v67)
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
                                                                    case v31  {
                                                                        Uh3Cons(v77, v78) -> {
                                                                            case v78  {
                                                                                Uh3Nil -> {
                                                                                    let v79 = dict.has_key(v3, v30)
                                                                                    let v80 = v79 == False
                                                                                    case v80 {
                                                                                        True -> Us110Elsewhere
                                                                                        False -> {
                                                                                            let v82 = v77 == "following"
                                                                                            case v82 {
                                                                                                True -> {
                                                                                                    let v83 = dict.get(v3, v30)
                                                                                                    let v84 = method549()
                                                                                                    let v85 = method550()
                                                                                                    let v86 = case v83 { Ok(x) -> v84(x) Error(x) -> v85(x) }
                                                                                                    let v91 =
                                                                                                        case v86  {
                                                                                                            Us111Error -> Us108None
                                                                                                            Us111Ok(v87) -> Us108Some(v87)
                                                                                                        }
                                                                                                    let v95 =
                                                                                                        case v91  {
                                                                                                            Us108None -> panic as "dict.present: the key is not in the dict"
                                                                                                            Us108Some(v92) -> v92
                                                                                                        }
                                                                                                    Us110Following(v95)
                                                                                                }
                                                                                                False -> {
                                                                                                    let v97 = v77 == "tweets"
                                                                                                    case v97 {
                                                                                                        True -> {
                                                                                                            let v98 = dict.get(v3, v30)
                                                                                                            let v99 = method549()
                                                                                                            let v100 = method550()
                                                                                                            let v101 = case v98 { Ok(x) -> v99(x) Error(x) -> v100(x) }
                                                                                                            let v106 =
                                                                                                                case v101  {
                                                                                                                    Us111Error -> Us108None
                                                                                                                    Us111Ok(v102) -> Us108Some(v102)
                                                                                                                }
                                                                                                            let v110 =
                                                                                                                case v106  {
                                                                                                                    Us108None -> panic as "dict.present: the key is not in the dict"
                                                                                                                    Us108Some(v107) -> v107
                                                                                                                }
                                                                                                            Us110Timeline(v110)
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
                                                    let v124 = "tweets" == v27
                                                    case v124 {
                                                        True -> {
                                                            case v28  {
                                                                Uh3Cons(v126, v127) -> {
                                                                    case v127  {
                                                                        Uh3Nil -> Us110Single(v126)
                                                                        _ -> {
                                                                            let v129 = "search" == v126
                                                                            case v129 {
                                                                                True -> {
                                                                                    case v127  {
                                                                                        Uh3Cons(v130, v131) -> {
                                                                                            case v131  {
                                                                                                Uh3Nil -> {
                                                                                                    let v132 = v130 == "recent"
                                                                                                    case v132 {
                                                                                                        True -> Us110SearchRecent
                                                                                                        False -> {
                                                                                                            let v134 = v130 == "all"
                                                                                                            case v134 {
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

pub fn method554(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method554(v3, v1)
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

pub fn method555(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Uh3, v16: Uh3) -> Uh3 {
    case v15  {
        Uh3Cons(v17, v18) -> {
            let v19 = method555(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v18, v16)
            let v20 = dict.has_key(v3, v17)
            case v20 {
                True -> Uh3Cons(v17, v19)
                False -> v19
            }
        }
        Uh3Nil -> v16
    }
}

pub fn method556(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Uh3, v16: Uh29) -> Uh29 {
    case v15  {
        Uh3Cons(v17, v18) -> {
            let v19 = method556(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v18, v16)
            let v20 = dict.get(v3, v17)
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

pub fn followed_553(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: Dynamic) -> Uh29 {
    let v16 = []
    let v17 = erlang_term_coerce(v16)
    let v19 = erlang_term_coerce("following")
    let v20 = erlang_term_coerce(v17)
    let v22 = atom.create("maps")
    let v24 = atom.create("get")
    let v25 = []
    let v26 = [v20, ..v25]
    let v27 = [v15, ..v26]
    let v28 = [v19, ..v27]
    let v29 = erlang_term_apply(v22, v24, v28)
    let v30 = erlang_term_coerce(v29)
    let v32 = atom.create("lists")
    let v34 = atom.create("reverse")
    let v35 = []
    let v36 = [v30, ..v35]
    let v37 = erlang_term_apply(v32, v34, v36)
    let v39 = items_from_301(v37, Uh29Nil)
    let v41 = method554(v39, Uh3Nil)
    let v43 = method555(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v41, Uh3Nil)
    method556(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v43, Uh29Nil)
}

pub fn sliced_557(v0: Int, v1: Int, v2: Uh29) -> Uh29 {
    case v2  {
        Uh29Cons(v3, v4) -> {
            let v5 = v0 > 0
            case v5 {
                True -> {
                    let v6 = spiral_wrap_signed(v0 - 1, 32)
                    sliced_557(v6, v1, v4)
                }
                False -> {
                    let v8 = v1 > 0
                    case v8 {
                        True -> {
                            let v10 = spiral_wrap_signed(v1 - 1, 32)
                            let v11 = sliced_557(0, v10, v4)
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

pub fn method558(v0: Uh29, v1: Int) -> Int {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method558(v3, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method559(v0: Uh29, v1: Uh29) -> Uh29 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method559(v3, v1)
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
