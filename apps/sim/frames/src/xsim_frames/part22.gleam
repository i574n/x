import gleam/bit_array
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Uh30, type Us95, type Us96, Uh30Cons, Uh30Nil, Uh3Cons, Uh3Nil, Uh9Nil, Us56Error, Us56Ok, Us80Error, Us80Ok, Us94Error, Us94Ok, Us95None, Us95Some, Us96Error, Us96Ok}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, spiral_fs_coerce, spiral_fs_read_file, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part12.{items_from_303}
import xsim_frames/part16.{method372, method373}
import xsim_frames/part18.{method398}
import xsim_frames/part19.{method411, method412}
import xsim_frames/part2.{delimited_21, method20}
import xsim_frames/part21.{closure123, closure125, file_cells_426, flags_parsed_422, method437, method438, thread_of_430}
import xsim_frames/part9.{method260, method261}

pub fn closure122(capt: Nil) -> fn(String) -> Int {
    fn (v0) {
        let v2 = atom.create("init")
        let v4 = atom.create("get_plain_arguments")
        let v5 = []
        let v6 = erlang_term_apply(v2, v4, v5)
        let v8 = atom.create("lists")
        let v10 = atom.create("reverse")
        let v11 = []
        let v12 = [v6, ..v11]
        let v13 = erlang_term_apply(v8, v10, v12)
        let v15 = items_from_303(v13, Uh30Nil)
        let v17 = method398(v15, Uh3Nil)
        let v22 =
            case v17  {
                Uh3Cons(v18, v19) -> v19
                Uh3Nil -> Uh3Nil
            }
        let v23 = closure123(Nil)
        let v24 = closure125(Nil)
        let v25 = ""
        let v26 = flags_parsed_422(v23, v24, v25, v25, v22)
        let v43 =
            case v26  {
                Us94Ok(v27, v28) -> {
                    let v29 = v27 == ""
                    let v34 =
                        case v29 {
                            True -> {
                                "missing --file"
                            }
                            False -> {
                                let v31 = v28 == ""
                                case v31 {
                                    True -> {
                                        "missing --out"
                                    }
                                    False -> v25
                                }
                            }
                        }
                    let v35 = v34 != ""
                    case v35 {
                        True -> {
                            let v40 =
                                case v29 {
                                    True -> {
                                        "missing --file"
                                    }
                                    False -> {
                                        let v37 = v28 == ""
                                        case v37 {
                                            True -> {
                                                "missing --out"
                                            }
                                            False -> v25
                                        }
                                    }
                                }
                            Us94Error(v40)
                        }
                        False -> v26
                    }
                }
                _ -> v26
            }
        let v138 =
            case v43  {
                Us94Error(v135) -> {
                    let v136 = { "XSIM rejected frames: " } <> { v135 }
                    v136
                }
                Us94Ok(v44, v45) -> {
                    let v46 = spiral_fs_read_file(v44)
                    let v47 = method372()
                    let v48 = method373()
                    let v49 = case v46 { Ok(x) -> v47(x) Error(x) -> v48(x) }
                    let v62 =
                        case v49  {
                            Us80Error(v59) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us80Ok(v50) -> {
                                let v51 = bit_array.to_string(v50)
                                let v52 = method260()
                                let v53 = method261()
                                let v54 = case v51 { Ok(x) -> v52(x) Error(x) -> v53(x) }
                                case v54  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v55) -> v55
                                }
                            }
                        }
                    let v64 = file_cells_426(v62)
                    let v66 = thread_of_430(1, v64, Uh9Nil)
                    let v67 = file_cells_426(v62)
                    let v69 = method437(v67, Uh3Nil)
                    let v71 = delimited_21("\n\n", v69)
                    let v72 = v71 == ""
                    let v76 =
                        case v72 {
                            True -> Uh3Nil
                            False -> {
                                split_list_2("\n", v71)
                            }
                        }
                    let v84 =
                        case v66  {
                            Uh3Nil -> {
                                "[]"
                            }
                            _ -> {
                                let v80 = method438(v66, Uh3Nil)
                                let v81 = delimited_21(",\n        ", v80)
                                let v82 = { "[\n        " } <> { v81 }
                                let v83 = { v82 } <> { "\n    ]" }
                                v83
                            }
                        }
                    let v85 = { "{\n    \"posts\": " } <> { v84 }
                    let v86 = { v85 } <> { ",\n    \"program\": " }
                    let v94 =
                        case v76  {
                            Uh3Nil -> {
                                "[]"
                            }
                            _ -> {
                                let v90 = method438(v76, Uh3Nil)
                                let v91 = delimited_21(",\n        ", v90)
                                let v92 = { "[\n        " } <> { v91 }
                                let v93 = { v92 } <> { "\n    ]" }
                                v93
                            }
                        }
                    let v95 = { v86 } <> { v94 }
                    let v96 = { v95 } <> { "\n}\n" }
                    let v97 = spiral_fs_write_file(v45, v96)
                    let v98 = spiral_fs_coerce(v97)
                    let v100 = atom.create("ok")
                    let v101 = v98 == v100
                    let v102 = v101 == False
                    case v102 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                    let v103 = file_cells_426(v62)
                    let v105 = method20(v103, 0)
                    let v107 = file_cells_426(v62)
                    let v109 = thread_of_430(1, v107, Uh9Nil)
                    let v111 = method20(v109, 0)
                    let v112 = int.to_string(v105)
                    let v113 = { " cells=" } <> { v112 }
                    let v114 = { v113 } <> { " posts=" }
                    let v115 = int.to_string(v111)
                    let v116 = { v114 } <> { v115 }
                    let v117 = erlang_term_coerce(v44)
                    let v119 = atom.create("filename")
                    let v121 = atom.create("basename")
                    let v122 = []
                    let v123 = [v117, ..v122]
                    let v124 = erlang_term_apply(v119, v121, v123)
                    let v126 = atom.create("unicode")
                    let v128 = atom.create("characters_to_binary")
                    let v129 = []
                    let v130 = [v124, ..v129]
                    let v131 = erlang_term_apply(v126, v128, v130)
                    let v132 = erlang_term_coerce(v131)
                    let v133 = { "xsim.frames " } <> { v132 }
                    let v134 = { v133 } <> { v116 }
                    v134
                }
            }
        let v139 = { v138 } <> { "\n" }
        let v140 = erlang_term_coerce(v139)
        let v142 = atom.create("io")
        let v144 = atom.create("put_chars")
        let v145 = []
        let v146 = [v140, ..v145]
        let _v147 = erlang_term_apply(v142, v144, v146)
        let v148 = v138 == ""
        let v152 =
            case v148 {
                True -> Uh3Nil
                False -> {
                    split_list_2("\n", v138)
                }
            }
        let v153 = method411()
        let v154 = method412(v153, v152)
        case v154 {
            True -> 1
            False -> 0
        }
    }
}

pub fn closure132(capt: Nil) -> fn(String) -> Us95 {
    fn (v0) {
        Us95None
    }
}

pub fn closure131(capt: Nil) -> fn(#(String, String, String)) -> fn(String) -> Us95 {
    fn (dom) {
        let #(_v0, _v1, _v2) = dom
        closure132(Nil)
    }
}

pub fn closure135(capt: #(String, String, String, String)) -> fn(String) -> Us96 {
    fn (v4) {
        let #(v0, v1, v2, v3) = capt
        let v5 = v3 == "expected"
        let v14 =
            case v5 {
                True -> Us95Some(v0, v1, v4)
                False -> {
                    let v7 = v3 == "file"
                    case v7 {
                        True -> Us95Some(v4, v1, v2)
                        False -> {
                            let v9 = v3 == "program"
                            case v9 {
                                True -> Us95Some(v0, v4, v2)
                                False -> Us95None
                            }
                        }
                    }
                }
            }
        case v14  {
            Us95None -> {
                let v19 = { "unknown option --" } <> { v3 }
                Us96Error(v19)
            }
            Us95Some(v15, v16, v17) -> Us96Ok(v15, v16, v17)
        }
    }
}

pub fn closure134(capt: #(String, String, String)) -> fn(String) -> fn(String) -> Us96 {
    fn (v3) {
        let #(v0, v1, v2) = capt
        closure135(#(v0, v1, v2, v3))
    }
}

pub fn closure133(capt: Nil) -> fn(#(String, String, String)) -> fn(String) -> fn(String) -> Us96 {
    fn (dom) {
        let #(v0, v1, v2) = dom
        closure134(#(v0, v1, v2))
    }
}

pub fn valued_then_441(v0: fn(#(String, String, String)) -> fn(String) -> Us95, v1: fn(#(String, String, String)) -> fn(String) -> fn(String) -> Us96, v2: String, v3: String, v4: String, v5: String, v6: Uh3) -> Us96 {
    case v6  {
        Uh3Cons(v7, v8) -> {
            let v9 = v1(#(v2, v3, v4))
            let v11 = v5 |> string.starts_with("--")
            let v18 =
                case v11 {
                    True -> {
                        let v12 = spiral_string_length(v5)
                        let v13 = spiral_wrap_signed(v12 - 2, 32)
                        let v14 = spiral_wrap_signed(2 + v13, 32)
                        let v15 = spiral_wrap_signed(v14 - 1, 32)
                        spiral_string_slice(v5, 2, v15)
                    }
                    False -> {
                        ""
                    }
                }
            let v19 = v9(v18)
            let v20 = v19(v7)
            continued_442(v0, v1, v20, v8)
        }
        Uh3Nil -> {
            let v23 = v5 |> string.starts_with("--")
            let v30 =
                case v23 {
                    True -> {
                        let v24 = spiral_string_length(v5)
                        let v25 = spiral_wrap_signed(v24 - 2, 32)
                        let v26 = spiral_wrap_signed(2 + v25, 32)
                        let v27 = spiral_wrap_signed(v26 - 1, 32)
                        spiral_string_slice(v5, 2, v27)
                    }
                    False -> {
                        ""
                    }
                }
            let v31 = { "--" } <> { v30 }
            let v32 = { v31 } <> { " needs a value" }
            Us96Error(v32)
        }
    }
}

pub fn arg_parsed_440(v0: fn(#(String, String, String)) -> fn(String) -> Us95, v1: fn(#(String, String, String)) -> fn(String) -> fn(String) -> Us96, v2: String, v3: String, v4: String, v5: String, v6: Uh3) -> Us96 {
    let v7 = v0(#(v2, v3, v4))
    let v9 = v5 |> string.starts_with("--")
    let v16 =
        case v9 {
            True -> {
                let v10 = spiral_string_length(v5)
                let v11 = spiral_wrap_signed(v10 - 2, 32)
                let v12 = spiral_wrap_signed(2 + v11, 32)
                let v13 = spiral_wrap_signed(v12 - 1, 32)
                spiral_string_slice(v5, 2, v13)
            }
            False -> {
                ""
            }
        }
    let v17 = v7(v16)
    case v17  {
        Us95None -> valued_then_441(v0, v1, v2, v3, v4, v5, v6)
        Us95Some(v18, v19, v20) -> flags_parsed_439(v0, v1, v18, v19, v20, v6)
    }
}

pub fn flags_parsed_439(v0: fn(#(String, String, String)) -> fn(String) -> Us95, v1: fn(#(String, String, String)) -> fn(String) -> fn(String) -> Us96, v2: String, v3: String, v4: String, v5: Uh3) -> Us96 {
    case v5  {
        Uh3Cons(v7, v8) -> {
            let v10 = v7 |> string.starts_with("--")
            let v17 =
                case v10 {
                    True -> {
                        let v11 = spiral_string_length(v7)
                        let v12 = spiral_wrap_signed(v11 - 2, 32)
                        let v13 = spiral_wrap_signed(2 + v12, 32)
                        let v14 = spiral_wrap_signed(v13 - 1, 32)
                        spiral_string_slice(v7, 2, v14)
                    }
                    False -> {
                        ""
                    }
                }
            let v18 = v17 == ""
            case v18 {
                True -> {
                    let v19 = { "unexpected argument '" } <> { v7 }
                    let v20 = { v19 } <> { "'" }
                    Us96Error(v20)
                }
                False -> arg_parsed_440(v0, v1, v2, v3, v4, v7, v8)
            }
        }
        Uh3Nil -> Us96Ok(v2, v3, v4)
    }
}

pub fn continued_442(v0: fn(#(String, String, String)) -> fn(String) -> Us95, v1: fn(#(String, String, String)) -> fn(String) -> fn(String) -> Us96, v2: Us96, v3: Uh3) -> Us96 {
    case v2  {
        Us96Error(v8) -> Us96Error(v8)
        Us96Ok(v4, v5, v6) -> flags_parsed_439(v0, v1, v4, v5, v6, v3)
    }
}

pub fn method444(v0: Uh30, v1: Uh3) -> Uh3 {
    case v0  {
        Uh30Cons(v2, v3) -> {
            let v4 = method444(v3, v1)
            let v5 = ""
            let v6 = erlang_term_coerce(v5)
            let v8 = erlang_term_coerce("target")
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
            let v20 = string.inspect(v19)
            let v21 = { v20 } <> { "=" }
            let v22 = erlang_term_coerce(v5)
            let v24 = erlang_term_coerce("status")
            let v25 = erlang_term_coerce(v22)
            let v26 = atom.create(v10)
            let v27 = atom.create(v12)
            let v28 = []
            let v29 = [v25, ..v28]
            let v30 = [v2, ..v29]
            let v31 = [v24, ..v30]
            let v32 = erlang_term_apply(v26, v27, v31)
            let v33 = erlang_term_coerce(v32)
            let v34 = string.inspect(v33)
            let v35 = { v21 } <> { v34 }
            Uh3Cons(v35, v4)
        }
        Uh30Nil -> v1
    }
}

pub fn method443(v0: Uh30, v1: Uh3) -> Uh3 {
    case v0  {
        Uh30Cons(v2, v3) -> {
            let v4 = method443(v3, v1)
            let v5 = []
            let v6 = erlang_term_coerce(v5)
            let v8 = erlang_term_coerce("targets")
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
            let v21 = atom.create("lists")
            let v23 = atom.create("reverse")
            let v24 = []
            let v25 = [v19, ..v24]
            let v26 = erlang_term_apply(v21, v23, v25)
            let v28 = items_from_303(v26, Uh30Nil)
            let v30 = method444(v28, Uh3Nil)
            let v32 = delimited_21(",", v30)
            let v33 = ""
            let v34 = erlang_term_coerce(v33)
            let v36 = erlang_term_coerce("name")
            let v37 = erlang_term_coerce(v34)
            let v38 = atom.create(v10)
            let v39 = atom.create(v12)
            let v40 = []
            let v41 = [v37, ..v40]
            let v42 = [v2, ..v41]
            let v43 = [v36, ..v42]
            let v44 = erlang_term_apply(v38, v39, v43)
            let v45 = erlang_term_coerce(v44)
            let v46 = string.inspect(v45)
            let v47 = { v46 } <> { " " }
            let v48 = erlang_term_coerce(v33)
            let v50 = erlang_term_coerce("status")
            let v51 = erlang_term_coerce(v48)
            let v52 = atom.create(v10)
            let v53 = atom.create(v12)
            let v54 = []
            let v55 = [v51, ..v54]
            let v56 = [v2, ..v55]
            let v57 = [v50, ..v56]
            let v58 = erlang_term_apply(v52, v53, v57)
            let v59 = erlang_term_coerce(v58)
            let v60 = string.inspect(v59)
            let v61 = { v47 } <> { v60 }
            let v62 = { v61 } <> { " [" }
            let v63 = { v62 } <> { v32 }
            let v64 = { v63 } <> { "]" }
            Uh3Cons(v64, v4)
        }
        Uh30Nil -> v1
    }
}

pub fn paired_rows_445(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            case v1  {
                Uh3Cons(v4, v5) -> {
                    let v6 = v2 == v4
                    case v6 {
                        True -> paired_rows_445(v3, v5)
                        False -> {
                            let v8 = { "  file=" } <> { v2 }
                            let v9 = { v8 } <> { "\n  thread=" }
                            let v10 = { v9 } <> { v4 }
                            let v11 = paired_rows_445(v3, v5)
                            Uh3Cons(v10, v11)
                        }
                    }
                }
                _ -> Uh3Nil
            }
        }
        _ -> Uh3Nil
    }
}
