import gleam/bit_array
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Us87, type Us88, type Us91, type Us92, Uh29Nil, Uh3Cons, Uh3Nil, Us3None, Us3Some, Us56Error, Us56Ok, Us80Error, Us80Ok, Us87None, Us87Some, Us88Error, Us88Ok, Us89EventsCells, Us89EventsEdits, Us89EventsSeed, Us89EventsUsers, Us90None, Us90Some, Us91None, Us91Some, Us92Error, Us92Ok}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, spiral_fs_coerce, spiral_fs_read_file, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part12.{items_from_301}
import xsim_frames/part16.{method370, method371}
import xsim_frames/part18.{method396, method400, method401}
import xsim_frames/part19.{closure111, method409, method410}
import xsim_frames/part2.{delimited_21, method20, taken_31}
import xsim_frames/part5.{closure16}
import xsim_frames/part8.{scenario_final_228, scenario_stream_227}
import xsim_frames/part9.{method258, method259}

pub fn closure115(capt: #(String, Int, Int, Int, Int, String, Int, Bool, String, String, String)) -> fn(String) -> Us88 {
    fn (v11) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10) = capt
        let v12 = v10 == "duplicates"
        case v12 {
            True -> {
                let v13 = v11 == ""
                let v17 =
                    case v13 {
                        True -> Uh3Nil
                        False -> {
                            split_list_2(".", v11)
                        }
                    }
                let v54 =
                    case v17  {
                        Uh3Cons(v18, v19) -> {
                            case v19  {
                                Uh3Cons(v27, v28) -> {
                                    case v28  {
                                        Uh3Nil -> {
                                            let v29 = v18 == ""
                                            let v31 =
                                                case v29 {
                                                    True -> {
                                                        "0"
                                                    }
                                                    False -> v18
                                                }
                                            let v32 = count_of_text_10(v31)
                                            let v33 = { v27 } <> { "000" }
                                            let v34 = spiral_string_slice(v33, 0, 2)
                                            let v35 = count_of_text_10(v34)
                                            case v32  {
                                                Us3Some(v36) -> {
                                                    case v35  {
                                                        Us3Some(v37) -> {
                                                            let v38 = spiral_string_length(v27)
                                                            let v39 = v38 <= 3
                                                            case v39 {
                                                                True -> {
                                                                    let v40 = spiral_wrap_signed(v36 * 1000, 32)
                                                                    let v41 = spiral_wrap_signed(v40 + v37, 32)
                                                                    Us3Some(v41)
                                                                }
                                                                False -> Us3None
                                                            }
                                                        }
                                                        _ -> Us3None
                                                    }
                                                }
                                                _ -> Us3None
                                            }
                                        }
                                        _ -> Us3None
                                    }
                                }
                                Uh3Nil -> {
                                    let v20 = count_of_text_10(v18)
                                    case v20  {
                                        Us3None -> Us3None
                                        Us3Some(v21) -> {
                                            let v22 = spiral_wrap_signed(v21 * 1000, 32)
                                            Us3Some(v22)
                                        }
                                    }
                                }
                            }
                        }
                        _ -> Us3None
                    }
                case v54  {
                    Us3None -> {
                        let v57 = { "--duplicates takes a decimal like 0.1, got '" } <> { v11 }
                        let v58 = { v57 } <> { "'" }
                        Us88Error(v58)
                    }
                    Us3Some(v55) -> Us88Ok(v0, v1, v2, v3, v4, v5, v55, v7, v8, v9)
                }
            }
            False -> {
                let v62 = v10 == "spi"
                let v68 =
                    case v62 {
                        True -> Us87Some(v11, v1, v2, v3, v4, v5, v6, v7, v8, v9)
                        False -> {
                            let v64 = v10 == "personas"
                            case v64 {
                                True -> Us87Some(v0, v1, v2, v3, v4, v11, v6, v7, v8, v9)
                                False -> Us87None
                            }
                        }
                    }
                let v69 = v10 == "out"
                let v75 =
                    case v69 {
                        True -> Us87Some(v0, v1, v2, v3, v4, v5, v6, v7, v11, v9)
                        False -> {
                            let v71 = v10 == "expected"
                            case v71 {
                                True -> Us87Some(v0, v1, v2, v3, v4, v5, v6, v7, v8, v11)
                                False -> Us87None
                            }
                        }
                    }
                let v87 =
                    case v68  {
                        Us87None -> v75
                        Us87Some(v76, v77, v78, v79, v80, v81, v82, v83, v84, v85) -> v68
                    }
                case v87  {
                    Us87None -> {
                        let v99 = v10 == "cells"
                        let v115 =
                            case v99 {
                                True -> {
                                    Us90Some(Us89EventsCells)
                                }
                                False -> {
                                    let v102 = v10 == "seed"
                                    case v102 {
                                        True -> {
                                            Us90Some(Us89EventsSeed)
                                        }
                                        False -> {
                                            let v105 = v10 == "users"
                                            case v105 {
                                                True -> {
                                                    Us90Some(Us89EventsUsers)
                                                }
                                                False -> {
                                                    let v108 = v10 == "edits"
                                                    case v108 {
                                                        True -> {
                                                            Us90Some(Us89EventsEdits)
                                                        }
                                                        False -> Us90None
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        case v115  {
                            Us90None -> {
                                let v167 = { "unknown option --" } <> { v10 }
                                Us88Error(v167)
                            }
                            Us90Some(v116) -> {
                                let v117 = count_of_text_10(v11)
                                case v117  {
                                    Us3None -> {
                                        let v160 = { "--" } <> { v10 }
                                        let v161 = { v160 } <> { " takes a whole number, got '" }
                                        let v162 = { v161 } <> { v11 }
                                        let v163 = { v162 } <> { "'" }
                                        Us88Error(v163)
                                    }
                                    Us3Some(v118) -> {
                                        let #(v149, v150, v151, v152, v153, v154, v155, v156, v157, v158) =
                                            case v116  {
                                                Us89EventsCells -> #(v0, v118, v2, v3, v4, v5, v6, v7, v8, v9)
                                                _ -> {
                                                    let #(v139, v140, v141, v142, v143, v144, v145, v146, v147, v148) =
                                                        case v116  {
                                                            Us89EventsSeed -> #(v0, v1, v118, v3, v4, v5, v6, v7, v8, v9)
                                                            _ -> {
                                                                let #(v129, v130, v131, v132, v133, v134, v135, v136, v137, v138) =
                                                                    case v116  {
                                                                        Us89EventsUsers -> #(v0, v1, v2, v118, v4, v5, v6, v7, v8, v9)
                                                                        _ -> {
                                                                            let #(v119, v120, v121, v122, v123, v124, v125, v126, v127, v128) =
                                                                                case v116  {
                                                                                    Us89EventsEdits -> #(v0, v1, v2, v3, v118, v5, v6, v7, v8, v9)
                                                                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                                }
                                                                            #(v119, v120, v121, v122, v123, v124, v125, v126, v127, v128)
                                                                        }
                                                                    }
                                                                #(v129, v130, v131, v132, v133, v134, v135, v136, v137, v138)
                                                            }
                                                        }
                                                    #(v139, v140, v141, v142, v143, v144, v145, v146, v147, v148)
                                                }
                                            }
                                        Us88Ok(v149, v150, v151, v152, v153, v154, v155, v156, v157, v158)
                                    }
                                }
                            }
                        }
                    }
                    Us87Some(v88, v89, v90, v91, v92, v93, v94, v95, v96, v97) -> Us88Ok(v88, v89, v90, v91, v92, v93, v94, v95, v96, v97)
                }
            }
        }
    }
}

pub fn closure114(capt: #(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us88 {
    fn (v10) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9) = capt
        closure115(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10))
    }
}

pub fn closure113(capt: Nil) -> fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us88 {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9) = dom
        closure114(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9))
    }
}

pub fn valued_then_413(v0: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us87, v1: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us88, v2: String, v3: Int, v4: Int, v5: Int, v6: Int, v7: String, v8: Int, v9: Bool, v10: String, v11: String, v12: String, v13: Uh3) -> Us88 {
    case v13  {
        Uh3Cons(v14, v15) -> {
            let v16 = v1(#(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11))
            let v18 = v12 |> string.starts_with("--")
            let v25 =
                case v18 {
                    True -> {
                        let v19 = spiral_string_length(v12)
                        let v20 = spiral_wrap_signed(v19 - 2, 32)
                        let v21 = spiral_wrap_signed(2 + v20, 32)
                        let v22 = spiral_wrap_signed(v21 - 1, 32)
                        spiral_string_slice(v12, 2, v22)
                    }
                    False -> {
                        ""
                    }
                }
            let v26 = v16(v25)
            let v27 = v26(v14)
            continued_414(v0, v1, v27, v15)
        }
        Uh3Nil -> {
            let v30 = v12 |> string.starts_with("--")
            let v37 =
                case v30 {
                    True -> {
                        let v31 = spiral_string_length(v12)
                        let v32 = spiral_wrap_signed(v31 - 2, 32)
                        let v33 = spiral_wrap_signed(2 + v32, 32)
                        let v34 = spiral_wrap_signed(v33 - 1, 32)
                        spiral_string_slice(v12, 2, v34)
                    }
                    False -> {
                        ""
                    }
                }
            let v38 = { "--" } <> { v37 }
            let v39 = { v38 } <> { " needs a value" }
            Us88Error(v39)
        }
    }
}

pub fn arg_parsed_412(v0: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us87, v1: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us88, v2: String, v3: Int, v4: Int, v5: Int, v6: Int, v7: String, v8: Int, v9: Bool, v10: String, v11: String, v12: String, v13: Uh3) -> Us88 {
    let v14 = v0(#(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11))
    let v16 = v12 |> string.starts_with("--")
    let v23 =
        case v16 {
            True -> {
                let v17 = spiral_string_length(v12)
                let v18 = spiral_wrap_signed(v17 - 2, 32)
                let v19 = spiral_wrap_signed(2 + v18, 32)
                let v20 = spiral_wrap_signed(v19 - 1, 32)
                spiral_string_slice(v12, 2, v20)
            }
            False -> {
                ""
            }
        }
    let v24 = v14(v23)
    case v24  {
        Us87None -> valued_then_413(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
        Us87Some(v25, v26, v27, v28, v29, v30, v31, v32, v33, v34) -> flags_parsed_411(v0, v1, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v13)
    }
}

pub fn flags_parsed_411(v0: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us87, v1: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us88, v2: String, v3: Int, v4: Int, v5: Int, v6: Int, v7: String, v8: Int, v9: Bool, v10: String, v11: String, v12: Uh3) -> Us88 {
    case v12  {
        Uh3Cons(v14, v15) -> {
            let v17 = v14 |> string.starts_with("--")
            let v24 =
                case v17 {
                    True -> {
                        let v18 = spiral_string_length(v14)
                        let v19 = spiral_wrap_signed(v18 - 2, 32)
                        let v20 = spiral_wrap_signed(2 + v19, 32)
                        let v21 = spiral_wrap_signed(v20 - 1, 32)
                        spiral_string_slice(v14, 2, v21)
                    }
                    False -> {
                        ""
                    }
                }
            let v25 = v24 == ""
            case v25 {
                True -> {
                    let v26 = { "unexpected argument '" } <> { v14 }
                    let v27 = { v26 } <> { "'" }
                    Us88Error(v27)
                }
                False -> arg_parsed_412(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v14, v15)
            }
        }
        Uh3Nil -> Us88Ok(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
    }
}

pub fn continued_414(v0: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us87, v1: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us88, v2: Us88, v3: Uh3) -> Us88 {
    case v2  {
        Us88Error(v15) -> Us88Error(v15)
        Us88Ok(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13) -> flags_parsed_411(v0, v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v3)
    }
}

pub fn method415(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method415(v3, v1)
            let v5 = v2 != ""
            case v5 {
                True -> Uh3Cons(v2, v4)
                False -> v4
            }
        }
        Uh3Nil -> v1
    }
}

pub fn closure110(capt: Nil) -> fn(String) -> Int {
    fn (v0) {
        let v2 = atom.create("crypto")
        let v3 = erlang_term_coerce(v2)
        let v4 = "application"
        let v5 = atom.create(v4)
        let v6 = "ensure_all_started"
        let v7 = atom.create(v6)
        let v8 = []
        let v9 = [v3, ..v8]
        let v10 = erlang_term_apply(v5, v7, v9)
        let v11 = erlang_term_coerce(1)
        let v12 = "erlang"
        let v13 = atom.create(v12)
        let v14 = "element"
        let v15 = atom.create(v14)
        let v16 = []
        let v17 = [v10, ..v16]
        let v18 = [v11, ..v17]
        let v19 = erlang_term_apply(v13, v15, v18)
        let v20 = "ok"
        let v21 = atom.create(v20)
        let v22 = erlang_term_coerce(v21)
        let v23 = v19 == v22
        let v39 =
            case v23 {
                True -> True
                False -> {
                    let v24 = string.inspect(v10)
                    let v25 = { "xsim / crypto did not start: " } <> { v24 }
                    let v26 = { v25 } <> { "\n" }
                    let v28 = atom.create("standard_error")
                    let v29 = erlang_term_coerce(v28)
                    let v30 = erlang_term_coerce(v26)
                    let v32 = atom.create("io")
                    let v34 = atom.create("put_chars")
                    let v35 = []
                    let v36 = [v30, ..v35]
                    let v37 = [v29, ..v36]
                    let _v38 = erlang_term_apply(v32, v34, v37)
                    False
                }
            }
        let _v74 =
            case v39 {
                True -> {
                    let v41 = atom.create("spiral_cells")
                    let v42 = erlang_term_coerce(v41)
                    let v43 = atom.create(v4)
                    let v44 = atom.create(v6)
                    let v45 = []
                    let v46 = [v42, ..v45]
                    let v47 = erlang_term_apply(v43, v44, v46)
                    let v48 = erlang_term_coerce(1)
                    let v49 = atom.create(v12)
                    let v50 = atom.create(v14)
                    let v51 = []
                    let v52 = [v47, ..v51]
                    let v53 = [v48, ..v52]
                    let v54 = erlang_term_apply(v49, v50, v53)
                    let v55 = atom.create(v20)
                    let v56 = erlang_term_coerce(v55)
                    let v57 = v54 == v56
                    case v57 {
                        True -> True
                        False -> {
                            let v58 = string.inspect(v47)
                            let v59 = { "xsim / spiral_cells did not start: " } <> { v58 }
                            let v60 = { v59 } <> { "\n" }
                            let v62 = atom.create("standard_error")
                            let v63 = erlang_term_coerce(v62)
                            let v64 = erlang_term_coerce(v60)
                            let v66 = atom.create("io")
                            let v68 = atom.create("put_chars")
                            let v69 = []
                            let v70 = [v64, ..v69]
                            let v71 = [v63, ..v70]
                            let _v72 = erlang_term_apply(v66, v68, v71)
                            False
                        }
                    }
                }
                False -> False
            }
        let v76 = atom.create("init")
        let v78 = atom.create("get_plain_arguments")
        let v79 = []
        let v80 = erlang_term_apply(v76, v78, v79)
        let v81 = "lists"
        let v82 = atom.create(v81)
        let v83 = "reverse"
        let v84 = atom.create(v83)
        let v85 = []
        let v86 = [v80, ..v85]
        let v87 = erlang_term_apply(v82, v84, v86)
        let v89 = items_from_301(v87, Uh29Nil)
        let v91 = method396(v89, Uh3Nil)
        let v96 =
            case v91  {
                Uh3Cons(v92, v93) -> v93
                Uh3Nil -> Uh3Nil
            }
        let v97 = closure111(Nil)
        let v98 = closure113(Nil)
        let v99 = ""
        let v106 = flags_parsed_411(v97, v98, v99, -1, 1, 3, 1, v99, 200, False, v99, v99, v96)
        let v137 =
            case v106  {
                Us88Ok(v107, v108, v109, v110, v111, v112, v113, v114, v115, v116) -> {
                    let v117 = v107 == ""
                    let v125 =
                        case v117 {
                            True -> {
                                "missing --spi"
                            }
                            False -> {
                                let v119 = v115 == ""
                                case v119 {
                                    True -> {
                                        "missing --out"
                                    }
                                    False -> {
                                        let v121 = v116 == ""
                                        case v121 {
                                            True -> {
                                                "missing --expected"
                                            }
                                            False -> v99
                                        }
                                    }
                                }
                            }
                        }
                    let v126 = v125 != ""
                    case v126 {
                        True -> {
                            let v134 =
                                case v117 {
                                    True -> {
                                        "missing --spi"
                                    }
                                    False -> {
                                        let v128 = v115 == ""
                                        case v128 {
                                            True -> {
                                                "missing --out"
                                            }
                                            False -> {
                                                let v130 = v116 == ""
                                                case v130 {
                                                    True -> {
                                                        "missing --expected"
                                                    }
                                                    False -> v99
                                                }
                                            }
                                        }
                                    }
                                }
                            Us88Error(v134)
                        }
                        False -> v106
                    }
                }
                _ -> v106
            }
        let v258 =
            case v137  {
                Us88Error(v255) -> {
                    let v256 = { "XSIM rejected events: " } <> { v255 }
                    v256
                }
                Us88Ok(v138, v139, v140, v141, v142, v143, v144, v145, v146, v147) -> {
                    let v148 = spiral_fs_read_file(v138)
                    let v149 = method370()
                    let v150 = method371()
                    let v151 = case v148 { Ok(x) -> v149(x) Error(x) -> v150(x) }
                    let v164 =
                        case v151  {
                            Us80Error(v161) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us80Ok(v152) -> {
                                let v153 = bit_array.to_string(v152)
                                let v154 = method258()
                                let v155 = method259()
                                let v156 = case v153 { Ok(x) -> v154(x) Error(x) -> v155(x) }
                                case v156  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v157) -> v157
                                }
                            }
                        }
                    let v165 = erlang_term_coerce(v164)
                    let v166 = erlang_term_coerce(v99)
                    let v168 = atom.create("Elixir.Spiral.Cells.Document")
                    let v170 = atom.create("parse_spi")
                    let v171 = []
                    let v172 = [v166, ..v171]
                    let v173 = [v165, ..v172]
                    let v174 = erlang_term_apply(v168, v170, v173)
                    let v175 = []
                    let v176 = erlang_term_coerce(v175)
                    let v178 = atom.create("cells")
                    let v179 = erlang_term_coerce(v178)
                    let v180 = erlang_term_coerce(v179)
                    let v181 = erlang_term_coerce(v176)
                    let v183 = atom.create("maps")
                    let v185 = atom.create("get")
                    let v186 = []
                    let v187 = [v181, ..v186]
                    let v188 = [v174, ..v187]
                    let v189 = [v180, ..v188]
                    let v190 = erlang_term_apply(v183, v185, v189)
                    let v191 = erlang_term_coerce(v190)
                    let v192 = atom.create(v81)
                    let v193 = atom.create(v83)
                    let v194 = []
                    let v195 = [v191, ..v194]
                    let v196 = erlang_term_apply(v192, v193, v195)
                    let v198 = items_from_301(v196, Uh29Nil)
                    let v200 = method400(v198, Uh29Nil)
                    let v202 = method401(v200, Uh3Nil)
                    let v203 = v139 < 0
                    let v205 =
                        case v203 {
                            True -> v202
                            False -> taken_31(v139, v202)
                        }
                    let v206 = unicode_erlang_characters_to_binary([0])
                    let v207 = delimited_21(v206, v205)
                    let v208 = closure16(Nil)
                    let v209 = unicode_erlang_characters_to_binary([0])
                    let v210 = split_list_2(v209, v207)
                    let v211 = scenario_stream_227(v140, v141, v142, v143, v144, v145, v208, v210)
                    let v212 = unicode_erlang_characters_to_binary([0])
                    let v213 = split_list_2(v212, v207)
                    let v214 = scenario_final_228(v140, v141, v142, v143, v144, v145, v208, v213)
                    let v215 = spiral_fs_write_file(v146, v211)
                    let v216 = spiral_fs_coerce(v215)
                    let v217 = atom.create(v20)
                    let v218 = v216 == v217
                    let v219 = v218 == False
                    case v219 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                    let v220 = spiral_fs_write_file(v147, v214)
                    let v221 = spiral_fs_coerce(v220)
                    let v222 = atom.create(v20)
                    let v223 = v221 == v222
                    let v224 = v223 == False
                    case v224 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                    let v225 = erlang_term_coerce(v138)
                    let v227 = atom.create("filename")
                    let v229 = atom.create("basename")
                    let v230 = []
                    let v231 = [v225, ..v230]
                    let v232 = erlang_term_apply(v227, v229, v231)
                    let v234 = atom.create("unicode")
                    let v236 = atom.create("characters_to_binary")
                    let v237 = []
                    let v238 = [v232, ..v237]
                    let v239 = erlang_term_apply(v234, v236, v238)
                    let v240 = erlang_term_coerce(v239)
                    let v241 = { "xsim.events " } <> { v240 }
                    let v242 = { v241 } <> { " deliveries=" }
                    let v243 = v211 == ""
                    let v247 =
                        case v243 {
                            True -> Uh3Nil
                            False -> {
                                split_list_2("\n", v211)
                            }
                        }
                    let v249 = method415(v247, Uh3Nil)
                    let v251 = method20(v249, 0)
                    let v252 = spiral_wrap_signed(v251 - 1, 32)
                    let v253 = int.to_string(v252)
                    let v254 = { v242 } <> { v253 }
                    v254
                }
            }
        let v259 = { v258 } <> { "\n" }
        let v260 = erlang_term_coerce(v259)
        let v262 = atom.create("io")
        let v264 = atom.create("put_chars")
        let v265 = []
        let v266 = [v260, ..v265]
        let _v267 = erlang_term_apply(v262, v264, v266)
        let v268 = v258 == ""
        let v272 =
            case v268 {
                True -> Uh3Nil
                False -> {
                    split_list_2("\n", v258)
                }
            }
        let v273 = method409()
        let v274 = method410(v273, v272)
        case v274 {
            True -> 1
            False -> 0
        }
    }
}

pub fn closure118(capt: Nil) -> fn(String) -> Us91 {
    fn (v0) {
        Us91None
    }
}

pub fn closure117(capt: Nil) -> fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> Us91 {
    fn (dom) {
        let #(_v0, _v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10, _v11, _v12) = dom
        closure118(Nil)
    }
}

pub fn closure121(capt: #(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String, String)) -> fn(String) -> Us92 {
    fn (v14) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13) = capt
        let v15 = v13 == "spi"
        let v21 =
            case v15 {
                True -> Us91Some(v14, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                False -> {
                    let v17 = v13 == "personas"
                    case v17 {
                        True -> Us91Some(v0, v1, v2, v3, v4, v5, v14, v7, v8, v9, v10, v11, v12)
                        False -> Us91None
                    }
                }
            }
        let v22 = v13 == "out"
        let v28 =
            case v22 {
                True -> Us91Some(v0, v14, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                False -> {
                    let v24 = v13 == "expected"
                    case v24 {
                        True -> Us91Some(v0, v1, v14, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                        False -> Us91None
                    }
                }
            }
        let v43 =
            case v21  {
                Us91None -> v28
                Us91Some(v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41) -> v21
            }
        let v44 = v13 == "user-id"
        let v50 =
            case v44 {
                True -> Us91Some(v0, v1, v2, v3, v4, v5, v6, v7, v14, v9, v10, v11, v12)
                False -> {
                    let v46 = v13 == "username"
                    case v46 {
                        True -> Us91Some(v0, v1, v2, v3, v4, v5, v6, v7, v8, v14, v10, v11, v12)
                        False -> Us91None
                    }
                }
            }
        let v51 = v13 == "base-time"
        let v54 =
            case v51 {
                True -> Us91Some(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v14)
                False -> Us91None
            }
        let v69 =
            case v50  {
                Us91None -> v54
                Us91Some(v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67) -> v50
            }
        let v84 =
            case v43  {
                Us91None -> v69
                Us91Some(v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82) -> v43
            }
        case v84  {
            Us91None -> {
                let v99 = count_of_text_10(v14)
                case v99  {
                    Us3None -> {
                        let v154 = { "--" } <> { v13 }
                        let v155 = { v154 } <> { " takes a whole number, got '" }
                        let v156 = { v155 } <> { v14 }
                        let v157 = { v156 } <> { "'" }
                        Us92Error(v157)
                    }
                    Us3Some(v100) -> {
                        let v101 = v13 == "cells"
                        let v110 =
                            case v101 {
                                True -> Us91Some(v0, v1, v2, v100, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                                False -> {
                                    let v103 = v13 == "seed"
                                    case v103 {
                                        True -> Us91Some(v0, v1, v2, v3, v100, v5, v6, v7, v8, v9, v10, v11, v12)
                                        False -> {
                                            let v105 = v13 == "edits"
                                            case v105 {
                                                True -> Us91Some(v0, v1, v2, v3, v4, v100, v6, v7, v8, v9, v10, v11, v12)
                                                False -> Us91None
                                            }
                                        }
                                    }
                                }
                            }
                        let v111 = v13 == "id-base"
                        let v120 =
                            case v111 {
                                True -> Us91Some(v0, v1, v2, v3, v4, v5, v6, v100, v8, v9, v10, v11, v12)
                                False -> {
                                    let v113 = v13 == "lost"
                                    case v113 {
                                        True -> Us91Some(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v100, v11, v12)
                                        False -> {
                                            let v115 = v13 == "lost-cells"
                                            case v115 {
                                                True -> Us91Some(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v100, v12)
                                                False -> Us91None
                                            }
                                        }
                                    }
                                }
                            }
                        let v135 =
                            case v110  {
                                Us91None -> v120
                                Us91Some(v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133) -> v110
                            }
                        case v135  {
                            Us91None -> {
                                let v150 = { "unknown option --" } <> { v13 }
                                Us92Error(v150)
                            }
                            Us91Some(v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148) -> Us92Ok(v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148)
                        }
                    }
                }
            }
            Us91Some(v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97) -> Us92Ok(v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97)
        }
    }
}

pub fn closure120(capt: #(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us92 {
    fn (v13) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12) = capt
        closure121(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13))
    }
}

pub fn closure119(capt: Nil) -> fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us92 {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12) = dom
        closure120(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12))
    }
}

pub fn valued_then_418(v0: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> Us91, v1: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us92, v2: String, v3: String, v4: String, v5: Int, v6: Int, v7: Int, v8: String, v9: Int, v10: String, v11: String, v12: Int, v13: Int, v14: String, v15: String, v16: Uh3) -> Us92 {
    case v16  {
        Uh3Cons(v17, v18) -> {
            let v19 = v1(#(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14))
            let v21 = v15 |> string.starts_with("--")
            let v28 =
                case v21 {
                    True -> {
                        let v22 = spiral_string_length(v15)
                        let v23 = spiral_wrap_signed(v22 - 2, 32)
                        let v24 = spiral_wrap_signed(2 + v23, 32)
                        let v25 = spiral_wrap_signed(v24 - 1, 32)
                        spiral_string_slice(v15, 2, v25)
                    }
                    False -> {
                        ""
                    }
                }
            let v29 = v19(v28)
            let v30 = v29(v17)
            continued_419(v0, v1, v30, v18)
        }
        Uh3Nil -> {
            let v33 = v15 |> string.starts_with("--")
            let v40 =
                case v33 {
                    True -> {
                        let v34 = spiral_string_length(v15)
                        let v35 = spiral_wrap_signed(v34 - 2, 32)
                        let v36 = spiral_wrap_signed(2 + v35, 32)
                        let v37 = spiral_wrap_signed(v36 - 1, 32)
                        spiral_string_slice(v15, 2, v37)
                    }
                    False -> {
                        ""
                    }
                }
            let v41 = { "--" } <> { v40 }
            let v42 = { v41 } <> { " needs a value" }
            Us92Error(v42)
        }
    }
}

pub fn arg_parsed_417(v0: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> Us91, v1: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us92, v2: String, v3: String, v4: String, v5: Int, v6: Int, v7: Int, v8: String, v9: Int, v10: String, v11: String, v12: Int, v13: Int, v14: String, v15: String, v16: Uh3) -> Us92 {
    let v17 = v0(#(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14))
    let v19 = v15 |> string.starts_with("--")
    let v26 =
        case v19 {
            True -> {
                let v20 = spiral_string_length(v15)
                let v21 = spiral_wrap_signed(v20 - 2, 32)
                let v22 = spiral_wrap_signed(2 + v21, 32)
                let v23 = spiral_wrap_signed(v22 - 1, 32)
                spiral_string_slice(v15, 2, v23)
            }
            False -> {
                ""
            }
        }
    let v27 = v17(v26)
    case v27  {
        Us91None -> valued_then_418(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
        Us91Some(v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40) -> flags_parsed_416(v0, v1, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v16)
    }
}

pub fn flags_parsed_416(v0: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> Us91, v1: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us92, v2: String, v3: String, v4: String, v5: Int, v6: Int, v7: Int, v8: String, v9: Int, v10: String, v11: String, v12: Int, v13: Int, v14: String, v15: Uh3) -> Us92 {
    case v15  {
        Uh3Cons(v17, v18) -> {
            let v20 = v17 |> string.starts_with("--")
            let v27 =
                case v20 {
                    True -> {
                        let v21 = spiral_string_length(v17)
                        let v22 = spiral_wrap_signed(v21 - 2, 32)
                        let v23 = spiral_wrap_signed(2 + v22, 32)
                        let v24 = spiral_wrap_signed(v23 - 1, 32)
                        spiral_string_slice(v17, 2, v24)
                    }
                    False -> {
                        ""
                    }
                }
            let v28 = v27 == ""
            case v28 {
                True -> {
                    let v29 = { "unexpected argument '" } <> { v17 }
                    let v30 = { v29 } <> { "'" }
                    Us92Error(v30)
                }
                False -> arg_parsed_417(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v17, v18)
            }
        }
        Uh3Nil -> Us92Ok(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    }
}

pub fn continued_419(v0: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> Us91, v1: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us92, v2: Us92, v3: Uh3) -> Us92 {
    case v2  {
        Us92Error(v18) -> Us92Error(v18)
        Us92Ok(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16) -> flags_parsed_416(v0, v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v3)
    }
}
