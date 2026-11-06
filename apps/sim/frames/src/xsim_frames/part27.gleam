import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh14, type Uh30, type Uh38, type Uh37, type Uh42, type Uh46, type Uh47, type Uh48, type Us104, type Uh49, type Us106, type Uh51, type Us108, type Us109, Uh14Cons, Uh14Nil, Uh30Cons, Uh30Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil, Uh42Cons, Uh42Nil, Uh44Strong, Uh44Text, Uh45Cons, Uh45Nil, Uh46Cons, Uh46Nil, Uh48Cons, Uh48Nil, Uh49Cons, Uh49Nil, Uh50Cons, Uh50Nil, Uh51Cons, Uh51Nil, Us102Original, Us102QuoteOf, Us102ReplyTo, Us102RepostOf, Us104Bullets, Us104CodeBlock, Us104Heading, Us104Numbered, Us104Paragraph, Us104Rule, Us104Table, Us106Markup, Us108Elsewhere, Us108Following, Us108Lookup, Us108SearchAll, Us108SearchRecent, Us108Single, Us108Timeline, Us108UsersBy, Us108UsersByIds, Us109Error, Us109Ok, Us110None, Us110Some, Us2None, Us2Some}
import xsim_frames/part1.{closure1, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part12.{items_from_303, method302}
import xsim_frames/part26.{align_head_522, bullets_html_483, cell_html_523, element_495, heading_html_510, hr_517, joined_504, numbered_html_512, para_html_516, pre_html_508, trusted_484}
import xsim_frames/part3.{method58, method59}

pub fn cells_html_521(v0: String, v1: Uh47, v2: Uh46) -> Us106 {
    case v2  {
        Uh46Cons(v5, v6) -> {
            let #(v7, v8) = align_head_522(v1)
            let v9 = cell_html_523(v0, v7, v5)
            let v10 = cells_html_521(v0, v8, v6)
            joined_504(v9, v10)
        }
        Uh46Nil -> {
            trusted_484("")
        }
    }
}

pub fn row_html_520(v0: String, v1: Uh47, v2: Uh46) -> Us106 {
    let v4 = trusted_484("<tr>")
    let v5 = cells_html_521(v0, v1, v2)
    let v6 = joined_504(v4, v5)
    let v8 = trusted_484("</tr>\n")
    joined_504(v6, v8)
}

pub fn rows_html_525(v0: Uh47, v1: Uh48) -> Us106 {
    case v1  {
        Uh48Cons(v2, v3) -> {
            let v5 = row_html_520("td", v0, v2)
            let v6 = rows_html_525(v0, v3)
            joined_504(v5, v6)
        }
        Uh48Nil -> {
            trusted_484("")
        }
    }
}

pub fn table_html_519(v0: Uh47, v1: Uh46, v2: Uh48) -> Us106 {
    let v4 = trusted_484("<table>\n<thead>\n")
    let v6 = row_html_520("th", v0, v1)
    let v7 = joined_504(v4, v6)
    let v9 = trusted_484("</thead>\n<tbody>\n")
    let v10 = joined_504(v7, v9)
    let v11 = rows_html_525(v0, v2)
    let v12 = joined_504(v10, v11)
    let v14 = trusted_484("</tbody>\n</table>\n")
    joined_504(v12, v14)
}

pub fn table_of_518(v0: Uh48, v1: Uh46, v2: Uh47) -> Us106 {
    table_html_519(v2, v1, v0)
}

pub fn block_html_482(v0: Us104) -> Us106 {
    case v0  {
        Us104Bullets(v6) -> bullets_html_483(v6)
        Us104CodeBlock(v11) -> pre_html_508(v11)
        Us104Heading(v1, v2) -> heading_html_510(v2, v1)
        Us104Numbered(v8, v9) -> numbered_html_512(v9, v8)
        Us104Paragraph(v4) -> para_html_516(v4)
        Us104Rule -> hr_517()
        Us104Table(v14, v15, v16) -> table_of_518(v16, v15, v14)
    }
}

pub fn blocks_html_481(v0: Uh49) -> Us106 {
    case v0  {
        Uh49Cons(v1, v2) -> {
            let v3 = block_html_482(v1)
            let v4 = blocks_html_481(v2)
            joined_504(v3, v4)
        }
        Uh49Nil -> {
            trusted_484("")
        }
    }
}

pub fn concat_527(v0: Uh51) -> Us106 {
    case v0  {
        Uh51Cons(v1, v2) -> {
            let v3 = concat_527(v2)
            joined_504(v1, v3)
        }
        Uh51Nil -> {
            Us106Markup("")
        }
    }
}

pub fn method526(v0: Uh42, v1: Uh51) -> Uh51 {
    case v0  {
        Uh42Cons(v2, v3, v4) -> {
            let v5 = method526(v4, v1)
            let v18 =
                case v3  {
                    Us102Original -> {
                        "post"
                    }
                    Us102QuoteOf(v12, v13) -> {
                        "post quote"
                    }
                    Us102ReplyTo(v8) -> {
                        "post reply"
                    }
                    Us102RepostOf(v10) -> {
                        "post repost"
                    }
                }
            let v19 = "class"
            let v21 = Uh50Cons(v19, v18, Uh50Nil)
            let v22 = v2.l1
            let v23 = { "@" } <> { v22 }
            let v24 = v2.l2
            let v25 = { " · " } <> { v24 }
            let v47 =
                case v3  {
                    Us102Original -> {
                        ""
                    }
                    Us102QuoteOf(v38, v39) -> {
                        let v40 = v38 == ""
                        case v40 {
                            True -> {
                                "Quoting"
                            }
                            False -> {
                                let v42 = { "Quoting @" } <> { v38 }
                                v42
                            }
                        }
                    }
                    Us102ReplyTo(v27) -> {
                        let v28 = v27 == ""
                        case v28 {
                            True -> {
                                "Reply to"
                            }
                            False -> {
                                let v30 = { "Reply to @" } <> { v27 }
                                v30
                            }
                        }
                    }
                    Us102RepostOf(v32) -> {
                        let v33 = v32 == ""
                        let v36 =
                            case v33 {
                                True -> {
                                    "Repost of"
                                }
                                False -> {
                                    let v35 = { "Repost of @" } <> { v32 }
                                    v35
                                }
                            }
                        let v37 = { v36 } <> { ", not this account's words" }
                        v37
                    }
                }
            let v48 = v47 == ""
            let v59 =
                case v48 {
                    True -> Uh49Nil
                    False -> {
                        let v50 = Uh44Text(v47)
                        let v52 = Uh45Cons(v50, Uh45Nil)
                        let v53 = Uh44Strong(v52)
                        let v55 = Uh45Cons(v53, Uh45Nil)
                        let v56 = Us104Paragraph(v55)
                        Uh49Cons(v56, Uh49Nil)
                    }
                }
            let v60 = Uh44Text(v23)
            let v62 = Uh45Cons(v60, Uh45Nil)
            let v63 = Uh44Strong(v62)
            let v64 = Uh44Text(v25)
            let v66 = Uh45Cons(v64, Uh45Nil)
            let v67 = Uh45Cons(v63, v66)
            let v68 = Us104Paragraph(v67)
            let v69 = Uh49Cons(v68, v59)
            let v70 = blocks_html_481(v69)
            let v71 = v2.l3
            let v72 = Uh44Text(v71)
            let v74 = Uh45Cons(v72, Uh45Nil)
            let v75 = Us104Paragraph(v74)
            let v77 = Uh49Cons(v75, Uh49Nil)
            let v78 = blocks_html_481(v77)
            let v98 =
                case v3  {
                    Us102QuoteOf(v79, v80) -> {
                        let v81 = { "@" } <> { v79 }
                        let v82 = { v81 } <> { ": " }
                        let v83 = { v82 } <> { v80 }
                        let v87 = Uh50Cons(v19, "quoted", Uh50Nil)
                        let v88 = Uh44Text(v83)
                        let v90 = Uh45Cons(v88, Uh45Nil)
                        let v91 = Us104Paragraph(v90)
                        let v93 = Uh49Cons(v91, Uh49Nil)
                        let v94 = blocks_html_481(v93)
                        element_495("blockquote", v87, v94)
                    }
                    _ -> {
                        trusted_484("")
                    }
                }
            let v101 = Uh49Cons(Us104Rule, Uh49Nil)
            let v102 = blocks_html_481(v101)
            let v104 = Uh51Cons(v102, Uh51Nil)
            let v105 = Uh51Cons(v98, v104)
            let v106 = Uh51Cons(v78, v105)
            let v107 = Uh51Cons(v70, v106)
            let v108 = concat_527(v107)
            let v109 = element_495("article", v21, v108)
            Uh51Cons(v109, v5)
        }
        Uh42Nil -> v1
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

pub fn method529(v0: Uh14, v1: Uh3) -> Uh3 {
    case v0  {
        Uh14Cons(v2, v3) -> {
            let v4 = method529(v3, v1)
            let v5 = int.to_string(v2)
            Uh3Cons(v5, v4)
        }
        Uh14Nil -> v1
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
            let v21 = method58(v18, v19, 0)
            let v22 = spiral_wrap_signed(v19 - 1, 32)
            let v23 = spiral_string_slice(v18, v21, v22)
            let v24 = spiral_string_length(v23)
            let v25 = method59(v23, v24)
            spiral_string_slice(v23, 0, v25)
        }
        Uh3Nil -> {
            ""
        }
    }
}

pub fn method537(v0: Uh38, v1: Uh38) -> Uh38 {
    case v0  {
        Uh38Cons(v2, v3, v4) -> {
            let v5 = method537(v4, v1)
            Uh38Cons(v2, v3, v5)
        }
        Uh38Nil -> v1
    }
}

pub fn method538(v0: Uh38, v1: Uh30) -> Uh30 {
    case v0  {
        Uh38Cons(v2, v3, v4) -> {
            let v5 = method538(v4, v1)
            let v6 = atom.create(v2)
            let v7 = erlang_term_coerce(v6)
            let v8 = []
            let v9 = [v3, ..v8]
            let v10 = [v7, ..v9]
            let v11 = erlang_term_tuple(v10)
            Uh30Cons(v11, v5)
        }
        Uh38Nil -> v1
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
                Uh38Cons("body", v34, Uh38Nil)
            }
            False -> Uh38Nil
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
    let v52 = method537(v39, Uh38Nil)
    let v54 = method538(v52, Uh30Nil)
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
    let v91 = method302(v54, v90)
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

pub fn route_of_541(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, _v12: Uh37, v13: String) -> Us108 {
    let v14 = v13 == ""
    let v18 =
        case v14 {
            True -> Uh3Nil
            False -> {
                split_list_2("/", v13)
            }
        }
    case v18  {
        Uh3Cons(v19, v20) -> {
            let v21 = "" == v19
            case v21 {
                True -> {
                    case v20  {
                        Uh3Cons(v22, v23) -> {
                            let v24 = "2" == v22
                            case v24 {
                                True -> {
                                    case v23  {
                                        Uh3Cons(v25, v26) -> {
                                            let v27 = "users" == v25
                                            case v27 {
                                                True -> {
                                                    case v26  {
                                                        Uh3Cons(v28, v29) -> {
                                                            let v30 = "by" == v28
                                                            case v30 {
                                                                True -> {
                                                                    case v29  {
                                                                        Uh3Cons(v32, v33) -> {
                                                                            case v33  {
                                                                                Uh3Nil -> {
                                                                                    let v34 = dict.has_key(v3, v28)
                                                                                    let v35 = v34 == False
                                                                                    case v35 {
                                                                                        True -> Us108Elsewhere
                                                                                        False -> {
                                                                                            let v37 = v32 == "following"
                                                                                            case v37 {
                                                                                                True -> {
                                                                                                    let v38 = dict.get(v3, v28)
                                                                                                    let v39 = method542()
                                                                                                    let v40 = method543()
                                                                                                    let v41 = case v38 { Ok(x) -> v39(x) Error(x) -> v40(x) }
                                                                                                    let v46 =
                                                                                                        case v41  {
                                                                                                            Us109Error -> Us110None
                                                                                                            Us109Ok(v42) -> Us110Some(v42)
                                                                                                        }
                                                                                                    let v50 =
                                                                                                        case v46  {
                                                                                                            Us110None -> panic as "dict.present: the key is not in the dict"
                                                                                                            Us110Some(v47) -> v47
                                                                                                        }
                                                                                                    Us108Following(v50)
                                                                                                }
                                                                                                False -> {
                                                                                                    let v52 = v32 == "tweets"
                                                                                                    case v52 {
                                                                                                        True -> {
                                                                                                            let v53 = dict.get(v3, v28)
                                                                                                            let v54 = method542()
                                                                                                            let v55 = method543()
                                                                                                            let v56 = case v53 { Ok(x) -> v54(x) Error(x) -> v55(x) }
                                                                                                            let v61 =
                                                                                                                case v56  {
                                                                                                                    Us109Error -> Us110None
                                                                                                                    Us109Ok(v57) -> Us110Some(v57)
                                                                                                                }
                                                                                                            let v65 =
                                                                                                                case v61  {
                                                                                                                    Us110None -> panic as "dict.present: the key is not in the dict"
                                                                                                                    Us110Some(v62) -> v62
                                                                                                                }
                                                                                                            Us108Timeline(v65)
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
                                                                    case v29  {
                                                                        Uh3Cons(v75, v76) -> {
                                                                            case v76  {
                                                                                Uh3Nil -> {
                                                                                    let v77 = dict.has_key(v3, v28)
                                                                                    let v78 = v77 == False
                                                                                    case v78 {
                                                                                        True -> Us108Elsewhere
                                                                                        False -> {
                                                                                            let v80 = v75 == "following"
                                                                                            case v80 {
                                                                                                True -> {
                                                                                                    let v81 = dict.get(v3, v28)
                                                                                                    let v82 = method542()
                                                                                                    let v83 = method543()
                                                                                                    let v84 = case v81 { Ok(x) -> v82(x) Error(x) -> v83(x) }
                                                                                                    let v89 =
                                                                                                        case v84  {
                                                                                                            Us109Error -> Us110None
                                                                                                            Us109Ok(v85) -> Us110Some(v85)
                                                                                                        }
                                                                                                    let v93 =
                                                                                                        case v89  {
                                                                                                            Us110None -> panic as "dict.present: the key is not in the dict"
                                                                                                            Us110Some(v90) -> v90
                                                                                                        }
                                                                                                    Us108Following(v93)
                                                                                                }
                                                                                                False -> {
                                                                                                    let v95 = v75 == "tweets"
                                                                                                    case v95 {
                                                                                                        True -> {
                                                                                                            let v96 = dict.get(v3, v28)
                                                                                                            let v97 = method542()
                                                                                                            let v98 = method543()
                                                                                                            let v99 = case v96 { Ok(x) -> v97(x) Error(x) -> v98(x) }
                                                                                                            let v104 =
                                                                                                                case v99  {
                                                                                                                    Us109Error -> Us110None
                                                                                                                    Us109Ok(v100) -> Us110Some(v100)
                                                                                                                }
                                                                                                            let v108 =
                                                                                                                case v104  {
                                                                                                                    Us110None -> panic as "dict.present: the key is not in the dict"
                                                                                                                    Us110Some(v105) -> v105
                                                                                                                }
                                                                                                            Us108Timeline(v108)
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
                                                    let v122 = "tweets" == v25
                                                    case v122 {
                                                        True -> {
                                                            case v26  {
                                                                Uh3Cons(v124, v125) -> {
                                                                    case v125  {
                                                                        Uh3Nil -> Us108Single(v124)
                                                                        _ -> {
                                                                            let v127 = "search" == v124
                                                                            case v127 {
                                                                                True -> {
                                                                                    case v125  {
                                                                                        Uh3Cons(v128, v129) -> {
                                                                                            case v129  {
                                                                                                Uh3Nil -> {
                                                                                                    let v130 = v128 == "recent"
                                                                                                    case v130 {
                                                                                                        True -> Us108SearchRecent
                                                                                                        False -> {
                                                                                                            let v132 = v128 == "all"
                                                                                                            case v132 {
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

pub fn method547(v0: Uh30, v1: Uh3) -> Uh3 {
    case v0  {
        Uh30Cons(v2, v3) -> {
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
        Uh30Nil -> v1
    }
}

pub fn method548(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: Uh3, v14: Uh3) -> Uh3 {
    case v13  {
        Uh3Cons(v15, v16) -> {
            let v17 = method548(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v16, v14)
            let v18 = dict.has_key(v3, v15)
            case v18 {
                True -> Uh3Cons(v15, v17)
                False -> v17
            }
        }
        Uh3Nil -> v14
    }
}

pub fn method549(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: Uh3, v14: Uh30) -> Uh30 {
    case v13  {
        Uh3Cons(v15, v16) -> {
            let v17 = method549(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v16, v14)
            let v18 = dict.get(v3, v15)
            let v19 = method542()
            let v20 = method543()
            let v21 = case v18 { Ok(x) -> v19(x) Error(x) -> v20(x) }
            let v26 =
                case v21  {
                    Us109Error -> Us110None
                    Us109Ok(v22) -> Us110Some(v22)
                }
            let v30 =
                case v26  {
                    Us110None -> panic as "dict.present: the key is not in the dict"
                    Us110Some(v27) -> v27
                }
            Uh30Cons(v30, v17)
        }
        Uh3Nil -> v14
    }
}

pub fn followed_546(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: Dynamic) -> Uh30 {
    let v14 = []
    let v15 = erlang_term_coerce(v14)
    let v17 = erlang_term_coerce("following")
    let v18 = erlang_term_coerce(v15)
    let v20 = atom.create("maps")
    let v22 = atom.create("get")
    let v23 = []
    let v24 = [v18, ..v23]
    let v25 = [v13, ..v24]
    let v26 = [v17, ..v25]
    let v27 = erlang_term_apply(v20, v22, v26)
    let v28 = erlang_term_coerce(v27)
    let v30 = atom.create("lists")
    let v32 = atom.create("reverse")
    let v33 = []
    let v34 = [v28, ..v33]
    let v35 = erlang_term_apply(v30, v32, v34)
    let v37 = items_from_303(v35, Uh30Nil)
    let v39 = method547(v37, Uh3Nil)
    let v41 = method548(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v39, Uh3Nil)
    method549(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v41, Uh30Nil)
}

pub fn sliced_550(v0: Int, v1: Int, v2: Uh30) -> Uh30 {
    case v2  {
        Uh30Cons(v3, v4) -> {
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
                            Uh30Cons(v3, v11)
                        }
                        False -> Uh30Nil
                    }
                }
            }
        }
        _ -> Uh30Nil
    }
}

pub fn method551(v0: Uh30, v1: Int) -> Int {
    case v0  {
        Uh30Cons(v2, v3) -> {
            let v4 = spiral_wrap_signed(v1 + 1, 32)
            method551(v3, v4)
        }
        Uh30Nil -> v1
    }
}

pub fn method552(v0: Uh30, v1: Uh30) -> Uh30 {
    case v0  {
        Uh30Cons(v2, v3) -> {
            let v4 = method552(v3, v1)
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
            Uh30Cons(v72, v4)
        }
        Uh30Nil -> v1
    }
}
