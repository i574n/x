import gleam/bit_array
import gleam/erlang/atom
import gleam/int
import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Uh8, type Us79, type Us93, type Us94, Uh29Nil, Uh3Cons, Uh3Nil, Uh8Cons, Uh8Nil, Us56Error, Us56Ok, Us79OnBluesky, Us79OnMastodon, Us79OnX, Us80Error, Us80Ok, Us92Error, Us92Ok, Us93None, Us93Some, Us94Error, Us94Ok}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, method18, method4, spiral_fs_coerce, spiral_fs_read_file, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary, unicode_erlang_nfc}
import xsim_frames/part12.{items_from_301}
import xsim_frames/part14.{closure94}
import xsim_frames/part15.{defused_dots_by_311, defused_entities_332}
import xsim_frames/part16.{method370, method371, split_cell_on_350}
import xsim_frames/part18.{method396, method400, method401}
import xsim_frames/part19.{method409, method410}
import xsim_frames/part2.{concat_balanced_22, delimited_21, method20, taken_31}
import xsim_frames/part20.{closure117, closure119, flags_parsed_416}
import xsim_frames/part5.{closure16}
import xsim_frames/part6.{blank_tail_length_163}
import xsim_frames/part8.{world_files_146}
import xsim_frames/part9.{method258, method259}

pub fn closure116(capt: Nil) -> fn(String) -> Int {
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
        let v97 = closure117(Nil)
        let v98 = closure119(Nil)
        let v99 = ""
        let v109 = flags_parsed_416(v97, v98, v99, v99, v99, -1, 1, 0, v99, 3000000, "500", "spiralposts", 0, 0, "2026-10-18T08:00:00Z", v96)
        let v143 =
            case v109  {
                Us92Ok(v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, v121, v122) -> {
                    let v123 = v110 == ""
                    let v131 =
                        case v123 {
                            True -> {
                                "missing --spi"
                            }
                            False -> {
                                let v125 = v111 == ""
                                case v125 {
                                    True -> {
                                        "missing --out"
                                    }
                                    False -> {
                                        let v127 = v112 == ""
                                        case v127 {
                                            True -> {
                                                "missing --expected"
                                            }
                                            False -> v99
                                        }
                                    }
                                }
                            }
                        }
                    let v132 = v131 != ""
                    case v132 {
                        True -> {
                            let v140 =
                                case v123 {
                                    True -> {
                                        "missing --spi"
                                    }
                                    False -> {
                                        let v134 = v111 == ""
                                        case v134 {
                                            True -> {
                                                "missing --out"
                                            }
                                            False -> {
                                                let v136 = v112 == ""
                                                case v136 {
                                                    True -> {
                                                        "missing --expected"
                                                    }
                                                    False -> v99
                                                }
                                            }
                                        }
                                    }
                                }
                            Us92Error(v140)
                        }
                        False -> v109
                    }
                }
                _ -> v109
            }
        let v268 =
            case v143  {
                Us92Error(v265) -> {
                    let v266 = { "XSIM rejected world: " } <> { v265 }
                    v266
                }
                Us92Ok(v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156) -> {
                    let v157 = spiral_fs_read_file(v144)
                    let v158 = method370()
                    let v159 = method371()
                    let v160 = case v157 { Ok(x) -> v158(x) Error(x) -> v159(x) }
                    let v173 =
                        case v160  {
                            Us80Error(v170) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us80Ok(v161) -> {
                                let v162 = bit_array.to_string(v161)
                                let v163 = method258()
                                let v164 = method259()
                                let v165 = case v162 { Ok(x) -> v163(x) Error(x) -> v164(x) }
                                case v165  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v166) -> v166
                                }
                            }
                        }
                    let v174 = erlang_term_coerce(v173)
                    let v175 = erlang_term_coerce(v99)
                    let v177 = atom.create("Elixir.Spiral.Cells.Document")
                    let v179 = atom.create("parse_spi")
                    let v180 = []
                    let v181 = [v175, ..v180]
                    let v182 = [v174, ..v181]
                    let v183 = erlang_term_apply(v177, v179, v182)
                    let v184 = []
                    let v185 = erlang_term_coerce(v184)
                    let v187 = atom.create("cells")
                    let v188 = erlang_term_coerce(v187)
                    let v189 = erlang_term_coerce(v188)
                    let v190 = erlang_term_coerce(v185)
                    let v192 = atom.create("maps")
                    let v194 = atom.create("get")
                    let v195 = []
                    let v196 = [v190, ..v195]
                    let v197 = [v183, ..v196]
                    let v198 = [v189, ..v197]
                    let v199 = erlang_term_apply(v192, v194, v198)
                    let v200 = erlang_term_coerce(v199)
                    let v201 = atom.create(v81)
                    let v202 = atom.create(v83)
                    let v203 = []
                    let v204 = [v200, ..v203]
                    let v205 = erlang_term_apply(v201, v202, v204)
                    let v207 = items_from_301(v205, Uh29Nil)
                    let v209 = method400(v207, Uh29Nil)
                    let v211 = method401(v209, Uh3Nil)
                    let v212 = v147 < 0
                    let v214 =
                        case v212 {
                            True -> v211
                            False -> taken_31(v147, v211)
                        }
                    let v215 = unicode_erlang_characters_to_binary([0])
                    let v216 = delimited_21(v215, v214)
                    let v217 = closure16(Nil)
                    let v218 = unicode_erlang_characters_to_binary([0])
                    let v219 = split_list_2(v218, v216)
                    let #(v220, v221) = world_files_146(v148, v149, v150, v151, v154, v155, v156, v152, v153, v217, v219)
                    let v222 = spiral_fs_write_file(v145, v220)
                    let v223 = spiral_fs_coerce(v222)
                    let v224 = atom.create(v20)
                    let v225 = v223 == v224
                    let v226 = v225 == False
                    case v226 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                    let v227 = spiral_fs_write_file(v146, v221)
                    let v228 = spiral_fs_coerce(v227)
                    let v229 = atom.create(v20)
                    let v230 = v228 == v229
                    let v231 = v230 == False
                    case v231 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                    let v233 = method20(v214, 0)
                    let v234 = erlang_term_coerce(v220)
                    let v235 = atom.create(v12)
                    let v237 = atom.create("byte_size")
                    let v238 = []
                    let v239 = [v234, ..v238]
                    let v240 = erlang_term_apply(v235, v237, v239)
                    let v241 = erlang_term_coerce(v240)
                    let v242 = int.to_string(v233)
                    let v243 = { " cells=" } <> { v242 }
                    let v244 = { v243 } <> { " bytes=" }
                    let v245 = int.to_string(v241)
                    let v246 = { v244 } <> { v245 }
                    let v247 = erlang_term_coerce(v144)
                    let v249 = atom.create("filename")
                    let v251 = atom.create("basename")
                    let v252 = []
                    let v253 = [v247, ..v252]
                    let v254 = erlang_term_apply(v249, v251, v253)
                    let v256 = atom.create("unicode")
                    let v258 = atom.create("characters_to_binary")
                    let v259 = []
                    let v260 = [v254, ..v259]
                    let v261 = erlang_term_apply(v256, v258, v260)
                    let v262 = erlang_term_coerce(v261)
                    let v263 = { "xsim.world " } <> { v262 }
                    let v264 = { v263 } <> { v246 }
                    v264
                }
            }
        let v269 = { v268 } <> { "\n" }
        let v270 = erlang_term_coerce(v269)
        let v272 = atom.create("io")
        let v274 = atom.create("put_chars")
        let v275 = []
        let v276 = [v270, ..v275]
        let _v277 = erlang_term_apply(v272, v274, v276)
        let v278 = v268 == ""
        let v282 =
            case v278 {
                True -> Uh3Nil
                False -> {
                    split_list_2("\n", v268)
                }
            }
        let v283 = method409()
        let v284 = method410(v283, v282)
        case v284 {
            True -> 1
            False -> 0
        }
    }
}

pub fn closure124(capt: Nil) -> fn(String) -> Us93 {
    fn (v0) {
        Us93None
    }
}

pub fn closure123(capt: Nil) -> fn(#(String, String)) -> fn(String) -> Us93 {
    fn (dom) {
        let #(_v0, _v1) = dom
        closure124(Nil)
    }
}

pub fn closure127(capt: #(String, String, String)) -> fn(String) -> Us94 {
    fn (v3) {
        let #(v0, v1, v2) = capt
        let v4 = v2 == "file"
        case v4 {
            True -> Us94Ok(v3, v1)
            False -> {
                let v6 = v2 == "out"
                case v6 {
                    True -> Us94Ok(v0, v3)
                    False -> {
                        let v8 = { "unknown option --" } <> { v2 }
                        Us94Error(v8)
                    }
                }
            }
        }
    }
}

pub fn closure126(capt: #(String, String)) -> fn(String) -> fn(String) -> Us94 {
    fn (v2) {
        let #(v0, v1) = capt
        closure127(#(v0, v1, v2))
    }
}

pub fn closure125(capt: Nil) -> fn(#(String, String)) -> fn(String) -> fn(String) -> Us94 {
    fn (dom) {
        let #(v0, v1) = dom
        closure126(#(v0, v1))
    }
}

pub fn valued_then_422(v0: fn(#(String, String)) -> fn(String) -> Us93, v1: fn(#(String, String)) -> fn(String) -> fn(String) -> Us94, v2: String, v3: String, v4: String, v5: Uh3) -> Us94 {
    case v5  {
        Uh3Cons(v6, v7) -> {
            let v8 = v1(#(v2, v3))
            let v10 = v4 |> string.starts_with("--")
            let v17 =
                case v10 {
                    True -> {
                        let v11 = spiral_string_length(v4)
                        let v12 = spiral_wrap_signed(v11 - 2, 32)
                        let v13 = spiral_wrap_signed(2 + v12, 32)
                        let v14 = spiral_wrap_signed(v13 - 1, 32)
                        spiral_string_slice(v4, 2, v14)
                    }
                    False -> {
                        ""
                    }
                }
            let v18 = v8(v17)
            let v19 = v18(v6)
            continued_423(v0, v1, v19, v7)
        }
        Uh3Nil -> {
            let v22 = v4 |> string.starts_with("--")
            let v29 =
                case v22 {
                    True -> {
                        let v23 = spiral_string_length(v4)
                        let v24 = spiral_wrap_signed(v23 - 2, 32)
                        let v25 = spiral_wrap_signed(2 + v24, 32)
                        let v26 = spiral_wrap_signed(v25 - 1, 32)
                        spiral_string_slice(v4, 2, v26)
                    }
                    False -> {
                        ""
                    }
                }
            let v30 = { "--" } <> { v29 }
            let v31 = { v30 } <> { " needs a value" }
            Us94Error(v31)
        }
    }
}

pub fn arg_parsed_421(v0: fn(#(String, String)) -> fn(String) -> Us93, v1: fn(#(String, String)) -> fn(String) -> fn(String) -> Us94, v2: String, v3: String, v4: String, v5: Uh3) -> Us94 {
    let v6 = v0(#(v2, v3))
    let v8 = v4 |> string.starts_with("--")
    let v15 =
        case v8 {
            True -> {
                let v9 = spiral_string_length(v4)
                let v10 = spiral_wrap_signed(v9 - 2, 32)
                let v11 = spiral_wrap_signed(2 + v10, 32)
                let v12 = spiral_wrap_signed(v11 - 1, 32)
                spiral_string_slice(v4, 2, v12)
            }
            False -> {
                ""
            }
        }
    let v16 = v6(v15)
    case v16  {
        Us93None -> valued_then_422(v0, v1, v2, v3, v4, v5)
        Us93Some(v17, v18) -> flags_parsed_420(v0, v1, v17, v18, v5)
    }
}

pub fn flags_parsed_420(v0: fn(#(String, String)) -> fn(String) -> Us93, v1: fn(#(String, String)) -> fn(String) -> fn(String) -> Us94, v2: String, v3: String, v4: Uh3) -> Us94 {
    case v4  {
        Uh3Cons(v6, v7) -> {
            let v9 = v6 |> string.starts_with("--")
            let v16 =
                case v9 {
                    True -> {
                        let v10 = spiral_string_length(v6)
                        let v11 = spiral_wrap_signed(v10 - 2, 32)
                        let v12 = spiral_wrap_signed(2 + v11, 32)
                        let v13 = spiral_wrap_signed(v12 - 1, 32)
                        spiral_string_slice(v6, 2, v13)
                    }
                    False -> {
                        ""
                    }
                }
            let v17 = v16 == ""
            case v17 {
                True -> {
                    let v18 = { "unexpected argument '" } <> { v6 }
                    let v19 = { v18 } <> { "'" }
                    Us94Error(v19)
                }
                False -> arg_parsed_421(v0, v1, v2, v3, v6, v7)
            }
        }
        Uh3Nil -> Us94Ok(v2, v3)
    }
}

pub fn continued_423(v0: fn(#(String, String)) -> fn(String) -> Us93, v1: fn(#(String, String)) -> fn(String) -> fn(String) -> Us94, v2: Us94, v3: Uh3) -> Us94 {
    case v2  {
        Us94Error(v7) -> Us94Error(v7)
        Us94Ok(v4, v5) -> flags_parsed_420(v0, v1, v4, v5, v3)
    }
}

pub fn with_blanks_427(v0: Int, v1: Uh3) -> Uh3 {
    let v2 = v0 <= 0
    case v2 {
        True -> v1
        False -> {
            let v3 = spiral_wrap_signed(v0 - 1, 32)
            let v5 = Uh3Cons("", v1)
            with_blanks_427(v3, v5)
        }
    }
}

pub fn step_426(v0: Uh3, v1: Uh3, v2: Int, v3: Bool, v4: String) -> #(Uh3, Uh3, Int, Bool) {
    let v5 = v4 == ""
    let #(v46, v47, v48, v49) =
        case v5 {
            True -> {
                let v6 = spiral_wrap_signed(v2 + 1, 32)
                #(v0, v1, v6, v3)
            }
            False -> {
                let v7 = v2 > 0
                let v8 = v7 && v3
                let v15 =
                    case v8 {
                        True -> {
                            let v10 = v4 |> string.starts_with(" ")
                            let v13 =
                                case v10 {
                                    True -> True
                                    False -> {
                                        v4 |> string.starts_with("\t")
                                    }
                                }
                            v13 == False
                        }
                        False -> False
                    }
                let #(v42, v43, v44, v45) =
                    case v15 {
                        True -> {
                            let v17 = method4(v1, Uh3Nil)
                            let v19 = concat_balanced_22("\n", v17)
                            let v20 = spiral_string_length(v19)
                            let v21 = string.to_graphemes(v19)
                            let v22 = v21 |> list.reverse
                            let listm_fold = v22 |> list.fold (Uh3Nil, fn (acc, x) {
                            let v24 = x
                            let v25 = acc
                            Uh3Cons(v24, v25)
                            })
                            let v27 = listm_fold
                            let v29 = method4(v27, Uh3Nil)
                            let v31 = blank_tail_length_163(v29, 0)
                            let v32 = spiral_wrap_signed(v20 - v31, 32)
                            let v33 = spiral_wrap_signed(v32 - 1, 32)
                            let v34 = spiral_string_slice(v19, 0, v33)
                            let v35 = spiral_wrap_signed(v2 - 1, 32)
                            let v37 = with_blanks_427(v35, Uh3Nil)
                            let v38 = Uh3Cons(v34, v0)
                            let v39 = Uh3Cons(v4, v37)
                            #(v38, v39, 0, True)
                        }
                        False -> {
                            let v40 = with_blanks_427(v2, v1)
                            let v41 = Uh3Cons(v4, v40)
                            #(v0, v41, 0, True)
                        }
                    }
                #(v42, v43, v44, v45)
            }
        }
    #(v46, v47, v48, v49)
}

pub fn method425(v0: Uh3, v1: Uh3, v2: Uh3, v3: Int, v4: Bool) -> #(Uh3, Uh3, Int, Bool) {
    let #(v19, v20, v21, v22) =
        case v0  {
            Uh3Cons(v5, v6) -> {
                let #(v7, v8, v9, v10) = step_426(v1, v2, v3, v4, v5)
                method425(v6, v7, v8, v9, v10)
            }
            _ -> {
                let #(v15, v16, v17, v18) =
                    case v0  {
                        Uh3Nil -> #(v1, v2, v3, v4)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v15, v16, v17, v18)
            }
        }
    #(v19, v20, v21, v22)
}

pub fn file_cells_424(v0: String) -> Uh3 {
    let v2 = "\n"
    let v3 = v0 |> string.replace("\r\n", v2)
    let v4 = v3 |> string.ends_with(v2)
    let v9 =
        case v4 {
            True -> {
                let v5 = spiral_string_length(v3)
                let v6 = spiral_wrap_signed(v5 - 1, 32)
                let v7 = spiral_wrap_signed(v6 - 1, 32)
                spiral_string_slice(v3, 0, v7)
            }
            False -> v3
        }
    let v10 = v9 == ""
    case v10 {
        True -> Uh3Nil
        False -> {
            let v12 = split_list_2(v2, v9)
            let #(v17, v18, v19, _v20) = method425(v12, Uh3Nil, Uh3Nil, 0, False)
            let v21 = with_blanks_427(v19, v18)
            let v23 = method4(v21, Uh3Nil)
            let v24 = concat_balanced_22(v2, v23)
            let v25 = spiral_string_length(v24)
            let v26 = string.to_graphemes(v24)
            let v27 = v26 |> list.reverse
            let listm_fold = v27 |> list.fold (Uh3Nil, fn (acc, x) {
            let v29 = x
            let v30 = acc
            Uh3Cons(v29, v30)
            })
            let v32 = listm_fold
            let v34 = method4(v32, Uh3Nil)
            let v36 = blank_tail_length_163(v34, 0)
            let v37 = spiral_wrap_signed(v25 - v36, 32)
            let v38 = spiral_wrap_signed(v37 - 1, 32)
            let v39 = spiral_string_slice(v24, 0, v38)
            let v41 = Uh3Cons(v39, Uh3Nil)
            method4(v17, v41)
        }
    }
}

pub fn closure129(capt: #(Us79, Int)) -> fn(String) -> Uh3 {
    fn (v2) {
        let #(v0, v1) = capt
        let v10 =
            case v0  {
                Us79OnBluesky(v6, v7) -> v2
                Us79OnMastodon -> v2
                Us79OnX -> {
                    let v3 = closure94(Nil)
                    let v4 = defused_dots_by_311(v3, v2)
                    defused_entities_332(v4)
                }
            }
        let v11 = int.to_string(v1)
        let v12 = { "c" } <> { v11 }
        let v17 =
            case v0  {
                Us79OnBluesky(v13, v14) -> 300
                Us79OnMastodon -> 500
                Us79OnX -> 280
            }
        split_cell_on_350(v0, v12, v17, v10)
    }
}

pub fn closure128(capt: #(Us79)) -> fn(Int) -> fn(String) -> Uh3 {
    fn (v1) {
        let #(v0) = capt
        closure129(#(v0, v1))
    }
}

pub fn numbered_432(v0: String, v1: Int, v2: Int, v3: Uh3, v4: Uh3) -> Uh3 {
    case v3  {
        Uh3Cons(v7, v8) -> {
            let v9 = spiral_wrap_signed(v2 + 1, 32)
            let v10 = { v0 } <> { " " }
            let v11 = int.to_string(v2)
            let v12 = { v10 } <> { v11 }
            let v13 = { v12 } <> { "/" }
            let v14 = int.to_string(v1)
            let v15 = { v13 } <> { v14 }
            let v16 = { v15 } <> { "\n" }
            let v17 = { v16 } <> { v7 }
            let v18 = spiral_string_length(v17)
            let v19 = string.to_graphemes(v17)
            let v20 = v19 |> list.reverse
            let listm_fold = v20 |> list.fold (Uh3Nil, fn (acc, x) {
            let v22 = x
            let v23 = acc
            Uh3Cons(v22, v23)
            })
            let v25 = listm_fold
            let v27 = method4(v25, Uh3Nil)
            let v29 = blank_tail_length_163(v27, 0)
            let v30 = spiral_wrap_signed(v18 - v29, 32)
            let v31 = spiral_wrap_signed(v30 - 1, 32)
            let v32 = spiral_string_slice(v17, 0, v31)
            let v33 = Uh3Cons(v32, v4)
            numbered_432(v0, v1, v9, v8, v33)
        }
        Uh3Nil -> {
            method4(v4, Uh3Nil)
        }
    }
}

pub fn cell_posts_by_431(v0: fn(Int) -> fn(String) -> Uh3, v1: Int, v2: String) -> Uh3 {
    let v3 = v0(v1)
    let v4 = v3(v2)
    let v8 =
        case v4  {
            Uh3Nil -> {
                Uh3Cons("", Uh3Nil)
            }
            _ -> v4
        }
    let v9 = int.to_string(v1)
    let v10 = { "c" } <> { v9 }
    let v12 = method20(v8, 0)
    numbered_432(v10, v12, 1, v8, Uh3Nil)
}

pub fn method433(v0: Uh8, v1: Uh8) -> Uh8 {
    case v0  {
        Uh8Cons(v2, v3) -> {
            let v4 = Uh8Cons(v2, v1)
            method433(v3, v4)
        }
        Uh8Nil -> v1
    }
}

pub fn method434(v0: Uh8, v1: Uh3) -> Uh3 {
    case v0  {
        Uh8Cons(v2, v3) -> {
            let v4 = method434(v3, v1)
            method18(v2, v4)
        }
        Uh8Nil -> v1
    }
}

pub fn thread_by_430(v0: fn(Int) -> fn(String) -> Uh3, v1: Int, v2: Uh3, v3: Uh8) -> Uh3 {
    case v2  {
        Uh3Cons(v8, v9) -> {
            let v10 = spiral_wrap_signed(v1 + 1, 32)
            let v11 = cell_posts_by_431(v0, v1, v8)
            let v12 = Uh8Cons(v11, v3)
            thread_by_430(v0, v10, v9, v12)
        }
        Uh3Nil -> {
            let v5 = method433(v3, Uh8Nil)
            method434(v5, Uh3Nil)
        }
    }
}

pub fn thread_on_429(v0: Us79, v1: Int, v2: Uh3, v3: Uh8) -> Uh3 {
    let v4 = closure128(#(v0))
    thread_by_430(v4, v1, v2, v3)
}

pub fn thread_of_428(v0: Int, v1: Uh3, v2: Uh8) -> Uh3 {
    thread_on_429(Us79OnX, v0, v1, v2)
}

pub fn method435(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method435(v3, v1)
            let v5 = unicode_erlang_nfc(v2)
            Uh3Cons(v5, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method436(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method436(v3, v1)
            let v5 = erlang_term_coerce(v2)
            let v7 = atom.create("json")
            let v9 = atom.create("encode")
            let v10 = []
            let v11 = [v5, ..v10]
            let v12 = erlang_term_apply(v7, v9, v11)
            let v14 = atom.create("erlang")
            let v16 = atom.create("iolist_to_binary")
            let v17 = []
            let v18 = [v12, ..v17]
            let v19 = erlang_term_apply(v14, v16, v18)
            let v20 = erlang_term_coerce(v19)
            Uh3Cons(v20, v4)
        }
        Uh3Nil -> v1
    }
}
