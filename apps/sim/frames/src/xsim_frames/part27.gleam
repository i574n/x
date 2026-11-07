import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh13, type Uh29, type Uh37, type Uh36, type Uh43, type Uh41, type Uh45, type Uh46, type Us105, type Uh47, type Uh48, type Us104, type Uh49, type Us106, type Uh51, type Us108, type Us109, Uh13Cons, Uh13Nil, Uh29Cons, Uh29Nil, Uh37Cons, Uh37Nil, Uh3Cons, Uh3Nil, Uh41Cons, Uh41Nil, Uh43Cons, Uh43Nil, Uh44Strong, Uh44Text, Uh45Cons, Uh45Nil, Uh46Cons, Uh46Nil, Uh47Cons, Uh47Nil, Uh48Cons, Uh48Nil, Uh49Cons, Uh49Nil, Uh50Cons, Uh50Nil, Uh51Cons, Uh51Nil, Us102Original, Us102QuoteOf, Us102ReplyTo, Us102RepostOf, Us104Bullets, Us104CodeBlock, Us104Heading, Us104Numbered, Us104Paragraph, Us104Rule, Us104Table, Us105AlignCenter, Us105AlignLeft, Us105AlignNone, Us105AlignRight, Us106Markup, Us108Elsewhere, Us108Following, Us108Lookup, Us108SearchAll, Us108SearchRecent, Us108Single, Us108Timeline, Us108UsersBy, Us108UsersByIds, Us109Error, Us109Ok, Us110None, Us110Some, Us2None, Us2Some}
import xsim_frames/part1.{closure1, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part12.{items_from_301, method300}
import xsim_frames/part26.{bullets_html_482, element_494, heading_html_509, inlines_html_485, items_html_484, joined_503, pre_html_507, show_i64_513, trusted_483}
import xsim_frames/part3.{method56, method57}

pub fn ordered_open_512(v0: Int) -> String {
    let v1 = v0 == 1
    case v1 {
        True -> {
            "<ol>\n"
        }
        False -> {
            let v3 = show_i64_513(v0)
            let v4 = { "<ol start=\"" } <> { v3 }
            let v5 = { v4 } <> { "\">\n" }
            v5
        }
    }
}

pub fn numbered_html_511(v0: Uh46, v1: Int) -> Us106 {
    let v2 = ordered_open_512(v1)
    let v3 = trusted_483(v2)
    let v4 = items_html_484(v0)
    let v5 = joined_503(v3, v4)
    let v7 = trusted_483("</ol>\n")
    joined_503(v5, v7)
}

pub fn para_html_515(v0: Uh45) -> Us106 {
    let v2 = trusted_483("<p>")
    let v3 = inlines_html_485(v0)
    let v4 = joined_503(v2, v3)
    let v6 = trusted_483("</p>\n")
    joined_503(v4, v6)
}

pub fn hr_516() -> Us106 {
    trusted_483("<hr>\n")
}

pub fn align_head_521(v0: Uh47) -> #(Us105, Uh47) {
    case v0  {
        Uh47Cons(v1, v2) -> #(v1, v2)
        Uh47Nil -> {
            #(Us105AlignNone, Uh47Nil)
        }
    }
}

pub fn align_attr_523(v0: Us105) -> String {
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

pub fn cell_html_522(v0: String, v1: Us105, v2: Uh45) -> Us106 {
    let v3 = { "<" } <> { v0 }
    let v4 = align_attr_523(v1)
    let v5 = { v3 } <> { v4 }
    let v6 = { v5 } <> { ">" }
    let v7 = trusted_483(v6)
    let v8 = inlines_html_485(v2)
    let v9 = joined_503(v7, v8)
    let v10 = { "</" } <> { v0 }
    let v11 = { v10 } <> { ">" }
    let v12 = trusted_483(v11)
    joined_503(v9, v12)
}

pub fn cells_html_520(v0: String, v1: Uh47, v2: Uh46) -> Us106 {
    case v2  {
        Uh46Cons(v5, v6) -> {
            let #(v7, v8) = align_head_521(v1)
            let v9 = cell_html_522(v0, v7, v5)
            let v10 = cells_html_520(v0, v8, v6)
            joined_503(v9, v10)
        }
        Uh46Nil -> {
            trusted_483("")
        }
    }
}

pub fn row_html_519(v0: String, v1: Uh47, v2: Uh46) -> Us106 {
    let v4 = trusted_483("<tr>")
    let v5 = cells_html_520(v0, v1, v2)
    let v6 = joined_503(v4, v5)
    let v8 = trusted_483("</tr>\n")
    joined_503(v6, v8)
}

pub fn rows_html_524(v0: Uh47, v1: Uh48) -> Us106 {
    case v1  {
        Uh48Cons(v2, v3) -> {
            let v5 = row_html_519("td", v0, v2)
            let v6 = rows_html_524(v0, v3)
            joined_503(v5, v6)
        }
        Uh48Nil -> {
            trusted_483("")
        }
    }
}

pub fn table_html_518(v0: Uh47, v1: Uh46, v2: Uh48) -> Us106 {
    let v4 = trusted_483("<table>\n<thead>\n")
    let v6 = row_html_519("th", v0, v1)
    let v7 = joined_503(v4, v6)
    let v9 = trusted_483("</thead>\n<tbody>\n")
    let v10 = joined_503(v7, v9)
    let v11 = rows_html_524(v0, v2)
    let v12 = joined_503(v10, v11)
    let v14 = trusted_483("</tbody>\n</table>\n")
    joined_503(v12, v14)
}

pub fn table_of_517(v0: Uh48, v1: Uh46, v2: Uh47) -> Us106 {
    table_html_518(v2, v1, v0)
}

pub fn block_html_481(v0: Us104) -> Us106 {
    case v0  {
        Us104Bullets(v6) -> bullets_html_482(v6)
        Us104CodeBlock(v11) -> pre_html_507(v11)
        Us104Heading(v1, v2) -> heading_html_509(v2, v1)
        Us104Numbered(v8, v9) -> numbered_html_511(v9, v8)
        Us104Paragraph(v4) -> para_html_515(v4)
        Us104Rule -> hr_516()
        Us104Table(v14, v15, v16) -> table_of_517(v16, v15, v14)
    }
}

pub fn blocks_html_480(v0: Uh49) -> Us106 {
    case v0  {
        Uh49Cons(v1, v2) -> {
            let v3 = block_html_481(v1)
            let v4 = blocks_html_480(v2)
            joined_503(v3, v4)
        }
        Uh49Nil -> {
            trusted_483("")
        }
    }
}

pub fn method526(v0: Uh43, v1: Uh51) -> Uh51 {
    case v0  {
        Uh43Cons(v2, v3, v4, v5) -> {
            let v6 = method526(v5, v1)
            let v7 = v3 == "video"
            let v31 =
                case v7 {
                    True -> {
                        let v9 = { "/media/" } <> { v2 }
                        let v11 = ""
                        let v14 = Uh50Cons("src", v9, Uh50Nil)
                        let v15 = Uh50Cons("controls", v11, v14)
                        let v16 = trusted_483(v11)
                        element_494("video", v15, v16)
                    }
                    False -> {
                        let v19 = { "/media/" } <> { v2 }
                        let v25 = Uh50Cons("alt", v4, Uh50Nil)
                        let v26 = Uh50Cons("src", v19, v25)
                        let v27 = Uh50Cons("loading", "lazy", v26)
                        let v29 = trusted_483("")
                        element_494("img", v27, v29)
                    }
                }
            Uh51Cons(v31, v6)
        }
        Uh43Nil -> v1
    }
}

pub fn concat_527(v0: Uh51) -> Us106 {
    case v0  {
        Uh51Cons(v1, v2) -> {
            let v3 = concat_527(v2)
            joined_503(v1, v3)
        }
        Uh51Nil -> {
            Us106Markup("")
        }
    }
}

pub fn method525(v0: Uh41, v1: Uh51) -> Uh51 {
    case v0  {
        Uh41Cons(v2, v3, v4, v5) -> {
            let v6 = method525(v5, v1)
            let v19 =
                case v3  {
                    Us102Original -> {
                        "post"
                    }
                    Us102QuoteOf(v13, v14) -> {
                        "post quote"
                    }
                    Us102ReplyTo(v9) -> {
                        "post reply"
                    }
                    Us102RepostOf(v11) -> {
                        "post repost"
                    }
                }
            let v20 = "class"
            let v22 = Uh50Cons(v20, v19, Uh50Nil)
            let v23 = v2.l1
            let v24 = { "@" } <> { v23 }
            let v25 = v2.l2
            let v26 = { " · " } <> { v25 }
            let v48 =
                case v3  {
                    Us102Original -> {
                        ""
                    }
                    Us102QuoteOf(v39, v40) -> {
                        let v41 = v39 == ""
                        case v41 {
                            True -> {
                                "Quoting"
                            }
                            False -> {
                                let v43 = { "Quoting @" } <> { v39 }
                                v43
                            }
                        }
                    }
                    Us102ReplyTo(v28) -> {
                        let v29 = v28 == ""
                        case v29 {
                            True -> {
                                "Reply to"
                            }
                            False -> {
                                let v31 = { "Reply to @" } <> { v28 }
                                v31
                            }
                        }
                    }
                    Us102RepostOf(v33) -> {
                        let v34 = v33 == ""
                        let v37 =
                            case v34 {
                                True -> {
                                    "Repost of"
                                }
                                False -> {
                                    let v36 = { "Repost of @" } <> { v33 }
                                    v36
                                }
                            }
                        let v38 = { v37 } <> { ", not this account's words" }
                        v38
                    }
                }
            let v49 = v48 == ""
            let v60 =
                case v49 {
                    True -> Uh49Nil
                    False -> {
                        let v51 = Uh44Text(v48)
                        let v53 = Uh45Cons(v51, Uh45Nil)
                        let v54 = Uh44Strong(v53)
                        let v56 = Uh45Cons(v54, Uh45Nil)
                        let v57 = Us104Paragraph(v56)
                        Uh49Cons(v57, Uh49Nil)
                    }
                }
            let v61 = Uh44Text(v24)
            let v63 = Uh45Cons(v61, Uh45Nil)
            let v64 = Uh44Strong(v63)
            let v65 = Uh44Text(v26)
            let v67 = Uh45Cons(v65, Uh45Nil)
            let v68 = Uh45Cons(v64, v67)
            let v69 = Us104Paragraph(v68)
            let v70 = Uh49Cons(v69, v60)
            let v71 = blocks_html_480(v70)
            let v72 = v2.l3
            let v73 = Uh44Text(v72)
            let v75 = Uh45Cons(v73, Uh45Nil)
            let v76 = Us104Paragraph(v75)
            let v78 = Uh49Cons(v76, Uh49Nil)
            let v79 = blocks_html_480(v78)
            let v81 = method526(v4, Uh51Nil)
            let v82 = concat_527(v81)
            let v102 =
                case v3  {
                    Us102QuoteOf(v83, v84) -> {
                        let v85 = { "@" } <> { v83 }
                        let v86 = { v85 } <> { ": " }
                        let v87 = { v86 } <> { v84 }
                        let v91 = Uh50Cons(v20, "quoted", Uh50Nil)
                        let v92 = Uh44Text(v87)
                        let v94 = Uh45Cons(v92, Uh45Nil)
                        let v95 = Us104Paragraph(v94)
                        let v97 = Uh49Cons(v95, Uh49Nil)
                        let v98 = blocks_html_480(v97)
                        element_494("blockquote", v91, v98)
                    }
                    _ -> {
                        trusted_483("")
                    }
                }
            let v105 = Uh49Cons(Us104Rule, Uh49Nil)
            let v106 = blocks_html_480(v105)
            let v108 = Uh51Cons(v106, Uh51Nil)
            let v109 = Uh51Cons(v102, v108)
            let v110 = Uh51Cons(v82, v109)
            let v111 = Uh51Cons(v79, v110)
            let v112 = Uh51Cons(v71, v111)
            let v113 = concat_527(v112)
            let v114 = element_494("article", v22, v113)
            Uh51Cons(v114, v6)
        }
        Uh41Nil -> v1
    }
}

pub fn method528(v0: Uh3, v1: String) -> String {
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
            method528(v3, v7)
        }
        Uh3Nil -> v1
    }
}

pub fn method529(v0: Uh13, v1: Uh3) -> Uh3 {
    case v0  {
        Uh13Cons(v2, v3) -> {
            let v4 = method529(v3, v1)
            let v5 = int.to_string(v2)
            Uh3Cons(v5, v4)
        }
        Uh13Nil -> v1
    }
}

pub fn method532(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method532(v0, v4, v2)
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

pub fn header_value_531(v0: String, v1: String) -> String {
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
    let v10 = method532(v3, v8, Uh3Nil)
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

pub fn method537(v0: Uh37, v1: Uh37) -> Uh37 {
    case v0  {
        Uh37Cons(v2, v3, v4) -> {
            let v5 = method537(v4, v1)
            Uh37Cons(v2, v3, v5)
        }
        Uh37Nil -> v1
    }
}

pub fn method538(v0: Uh37, v1: Uh29) -> Uh29 {
    case v0  {
        Uh37Cons(v2, v3, v4) -> {
            let v5 = method538(v4, v1)
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

pub fn log_row_536(v0: String, v1: String, v2: String, _v3: String, v4: String, v5: String) -> Dynamic {
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
    let v52 = method537(v39, Uh37Nil)
    let v54 = method538(v52, Uh29Nil)
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

pub fn logged_535(v0: String, v1: String, v2: String, v3: String, v4: String, v5: String, v6: String) -> Nil {
    let v7 = log_row_536(v1, v2, v3, v4, v5, v6)
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

pub fn ok_c151(capt: Nil) -> fn(Dynamic) -> Us109 {
    fn (v0) {
        Us109Ok(v0)
    }
}

pub fn method542() -> fn(Dynamic) -> Us109 {
    ok_c151(Nil)
}

pub fn error_c152(capt: Nil) -> fn(Nil) -> Us109 {
    fn (dom) {
        Us109Error
    }
}

pub fn method543() -> fn(Nil) -> Us109 {
    error_c152(Nil)
}

pub fn route_of_541(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, _v12: Uh36, _v13: String, v14: String) -> Us108 {
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
                                                                                        True -> Us108Elsewhere
                                                                                        False -> {
                                                                                            let v38 = v33 == "following"
                                                                                            case v38 {
                                                                                                True -> {
                                                                                                    let v39 = dict.get(v3, v29)
                                                                                                    let v40 = method542()
                                                                                                    let v41 = method543()
                                                                                                    let v42 = case v39 { Ok(x) -> v40(x) Error(x) -> v41(x) }
                                                                                                    let v47 =
                                                                                                        case v42  {
                                                                                                            Us109Error -> Us110None
                                                                                                            Us109Ok(v43) -> Us110Some(v43)
                                                                                                        }
                                                                                                    let v51 =
                                                                                                        case v47  {
                                                                                                            Us110None -> panic as "dict.present: the key is not in the dict"
                                                                                                            Us110Some(v48) -> v48
                                                                                                        }
                                                                                                    Us108Following(v51)
                                                                                                }
                                                                                                False -> {
                                                                                                    let v53 = v33 == "tweets"
                                                                                                    case v53 {
                                                                                                        True -> {
                                                                                                            let v54 = dict.get(v3, v29)
                                                                                                            let v55 = method542()
                                                                                                            let v56 = method543()
                                                                                                            let v57 = case v54 { Ok(x) -> v55(x) Error(x) -> v56(x) }
                                                                                                            let v62 =
                                                                                                                case v57  {
                                                                                                                    Us109Error -> Us110None
                                                                                                                    Us109Ok(v58) -> Us110Some(v58)
                                                                                                                }
                                                                                                            let v66 =
                                                                                                                case v62  {
                                                                                                                    Us110None -> panic as "dict.present: the key is not in the dict"
                                                                                                                    Us110Some(v63) -> v63
                                                                                                                }
                                                                                                            Us108Timeline(v66)
                                                                                                        }
                                                                                                        False -> Us108Elsewhere
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                                _ -> Us108Elsewhere
                                                                            }
                                                                        }
                                                                        Uh3Nil -> Us108UsersBy
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
                                                                                        True -> Us108Elsewhere
                                                                                        False -> {
                                                                                            let v81 = v76 == "following"
                                                                                            case v81 {
                                                                                                True -> {
                                                                                                    let v82 = dict.get(v3, v29)
                                                                                                    let v83 = method542()
                                                                                                    let v84 = method543()
                                                                                                    let v85 = case v82 { Ok(x) -> v83(x) Error(x) -> v84(x) }
                                                                                                    let v90 =
                                                                                                        case v85  {
                                                                                                            Us109Error -> Us110None
                                                                                                            Us109Ok(v86) -> Us110Some(v86)
                                                                                                        }
                                                                                                    let v94 =
                                                                                                        case v90  {
                                                                                                            Us110None -> panic as "dict.present: the key is not in the dict"
                                                                                                            Us110Some(v91) -> v91
                                                                                                        }
                                                                                                    Us108Following(v94)
                                                                                                }
                                                                                                False -> {
                                                                                                    let v96 = v76 == "tweets"
                                                                                                    case v96 {
                                                                                                        True -> {
                                                                                                            let v97 = dict.get(v3, v29)
                                                                                                            let v98 = method542()
                                                                                                            let v99 = method543()
                                                                                                            let v100 = case v97 { Ok(x) -> v98(x) Error(x) -> v99(x) }
                                                                                                            let v105 =
                                                                                                                case v100  {
                                                                                                                    Us109Error -> Us110None
                                                                                                                    Us109Ok(v101) -> Us110Some(v101)
                                                                                                                }
                                                                                                            let v109 =
                                                                                                                case v105  {
                                                                                                                    Us110None -> panic as "dict.present: the key is not in the dict"
                                                                                                                    Us110Some(v106) -> v106
                                                                                                                }
                                                                                                            Us108Timeline(v109)
                                                                                                        }
                                                                                                        False -> Us108Elsewhere
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                                _ -> Us108Elsewhere
                                                                            }
                                                                        }
                                                                        _ -> Us108Elsewhere
                                                                    }
                                                                }
                                                            }
                                                        }
                                                        Uh3Nil -> Us108UsersByIds
                                                    }
                                                }
                                                False -> {
                                                    let v123 = "tweets" == v26
                                                    case v123 {
                                                        True -> {
                                                            case v27  {
                                                                Uh3Cons(v125, v126) -> {
                                                                    case v126  {
                                                                        Uh3Nil -> Us108Single(v125)
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
                                                                                                        True -> Us108SearchRecent
                                                                                                        False -> {
                                                                                                            let v133 = v129 == "all"
                                                                                                            case v133 {
                                                                                                                True -> Us108SearchAll
                                                                                                                False -> Us108Elsewhere
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                                _ -> Us108Elsewhere
                                                                                            }
                                                                                        }
                                                                                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                                    }
                                                                                }
                                                                                False -> Us108Elsewhere
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                                Uh3Nil -> Us108Lookup
                                                            }
                                                        }
                                                        False -> Us108Elsewhere
                                                    }
                                                }
                                            }
                                        }
                                        _ -> Us108Elsewhere
                                    }
                                }
                                False -> Us108Elsewhere
                            }
                        }
                        _ -> Us108Elsewhere
                    }
                }
                False -> Us108Elsewhere
            }
        }
        _ -> Us108Elsewhere
    }
}

pub fn method547(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method547(v3, v1)
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

pub fn method548(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Uh3, v15: Uh3) -> Uh3 {
    case v14  {
        Uh3Cons(v16, v17) -> {
            let v18 = method548(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v17, v15)
            let v19 = dict.has_key(v3, v16)
            case v19 {
                True -> Uh3Cons(v16, v18)
                False -> v18
            }
        }
        Uh3Nil -> v15
    }
}

pub fn method549(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Uh3, v15: Uh29) -> Uh29 {
    case v14  {
        Uh3Cons(v16, v17) -> {
            let v18 = method549(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v17, v15)
            let v19 = dict.get(v3, v16)
            let v20 = method542()
            let v21 = method543()
            let v22 = case v19 { Ok(x) -> v20(x) Error(x) -> v21(x) }
            let v27 =
                case v22  {
                    Us109Error -> Us110None
                    Us109Ok(v23) -> Us110Some(v23)
                }
            let v31 =
                case v27  {
                    Us110None -> panic as "dict.present: the key is not in the dict"
                    Us110Some(v28) -> v28
                }
            Uh29Cons(v31, v18)
        }
        Uh3Nil -> v15
    }
}

pub fn followed_546(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: Dynamic) -> Uh29 {
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
    let v40 = method547(v38, Uh3Nil)
    let v42 = method548(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v40, Uh3Nil)
    method549(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v42, Uh29Nil)
}

pub fn sliced_550(v0: Int, v1: Int, v2: Uh29) -> Uh29 {
    case v2  {
        Uh29Cons(v3, v4) -> {
            let v5 = v0 > 0
            case v5 {
                True -> {
                    let v6 = spiral_wrap_signed(v0 - 1, 32)
                    sliced_550(v6, v1, v4)
                }
                False -> {
                    let v8 = v1 > 0
                    case v8 {
                        True -> {
                            let v10 = spiral_wrap_signed(v1 - 1, 32)
                            let v11 = sliced_550(0, v10, v4)
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

pub fn method551(v0: Uh29, v1: Int) -> Int {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method551(v3, v4)
        }
        Uh29Nil -> v1
    }
}
