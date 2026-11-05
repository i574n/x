import gleam/bit_array
import gleam/erlang/atom
import gleam/int
import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Uh8, type Us79, type Us90, type Us91, Uh29Nil, Uh3Cons, Uh3Nil, Uh8Cons, Uh8Nil, Us56Error, Us56Ok, Us79OnBluesky, Us79OnMastodon, Us79OnX, Us80Error, Us80Ok, Us89Error, Us89Ok, Us90None, Us90Some, Us91Error, Us91Ok}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, method4, spiral_fs_coerce, spiral_fs_read_file, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary, unicode_erlang_nfc}
import xsim_frames/part10.{method258, method259}
import xsim_frames/part13.{items_from_301}
import xsim_frames/part16.{closure94, defused_dots_by_311}
import xsim_frames/part17.{defused_entities_332}
import xsim_frames/part18.{method370, method371, split_cell_on_350}
import xsim_frames/part2.{concat_balanced_22, delimited_21, method18, method20, taken_31}
import xsim_frames/part20.{method396, method400, method401, method402, method403}
import xsim_frames/part22.{closure117, closure119, flags_parsed_409}
import xsim_frames/part6.{closure16}
import xsim_frames/part7.{blank_tail_length_163}
import xsim_frames/part9.{world_files_146}

pub fn closure116(capt: Nil) -> fn(String) -> Int {
    fn (v0) {
        let v1 = "crypto"
        let v2 = atom.create(v1)
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
        let v44 =
            case v23 {
                True -> True
                False -> {
                    let v24 = "xsim / "
                    let v25 = v24 <> v1 
                    let v26 = " did not start: "
                    let v27 = v25 <> v26 
                    let v28 = string.inspect(v10)
                    let v29 = v27 <> v28 
                    let v30 = "\n"
                    let v31 = v29 <> v30 
                    let v32 = "standard_error"
                    let v33 = atom.create(v32)
                    let v34 = erlang_term_coerce(v33)
                    let v35 = erlang_term_coerce(v31)
                    let v36 = "io"
                    let v37 = atom.create(v36)
                    let v38 = "put_chars"
                    let v39 = atom.create(v38)
                    let v40 = []
                    let v41 = [v35, ..v40]
                    let v42 = [v34, ..v41]
                    let _v43 = erlang_term_apply(v37, v39, v42)
                    False
                }
            }
        let _v84 =
            case v44 {
                True -> {
                    let v45 = "spiral_cells"
                    let v46 = atom.create(v45)
                    let v47 = erlang_term_coerce(v46)
                    let v48 = atom.create(v4)
                    let v49 = atom.create(v6)
                    let v50 = []
                    let v51 = [v47, ..v50]
                    let v52 = erlang_term_apply(v48, v49, v51)
                    let v53 = erlang_term_coerce(1)
                    let v54 = atom.create(v12)
                    let v55 = atom.create(v14)
                    let v56 = []
                    let v57 = [v52, ..v56]
                    let v58 = [v53, ..v57]
                    let v59 = erlang_term_apply(v54, v55, v58)
                    let v60 = atom.create(v20)
                    let v61 = erlang_term_coerce(v60)
                    let v62 = v59 == v61
                    case v62 {
                        True -> True
                        False -> {
                            let v63 = "xsim / "
                            let v64 = v63 <> v45 
                            let v65 = " did not start: "
                            let v66 = v64 <> v65 
                            let v67 = string.inspect(v52)
                            let v68 = v66 <> v67 
                            let v69 = "\n"
                            let v70 = v68 <> v69 
                            let v71 = "standard_error"
                            let v72 = atom.create(v71)
                            let v73 = erlang_term_coerce(v72)
                            let v74 = erlang_term_coerce(v70)
                            let v75 = "io"
                            let v76 = atom.create(v75)
                            let v77 = "put_chars"
                            let v78 = atom.create(v77)
                            let v79 = []
                            let v80 = [v74, ..v79]
                            let v81 = [v73, ..v80]
                            let _v82 = erlang_term_apply(v76, v78, v81)
                            False
                        }
                    }
                }
                False -> False
            }
        let v85 = "init"
        let v86 = atom.create(v85)
        let v87 = "get_plain_arguments"
        let v88 = atom.create(v87)
        let v89 = []
        let v90 = erlang_term_apply(v86, v88, v89)
        let v91 = "lists"
        let v92 = atom.create(v91)
        let v93 = "reverse"
        let v94 = atom.create(v93)
        let v95 = []
        let v96 = [v90, ..v95]
        let v97 = erlang_term_apply(v92, v94, v96)
        let v98 = Uh29Nil
        let v99 = items_from_301(v97, v98)
        let v100 = Uh3Nil
        let v101 = method396(v99, v100)
        let v106 =
            case v101  {
                Uh3Cons(v102, v103) -> v103
                Uh3Nil -> Uh3Nil
            }
        let v107 = closure117(Nil)
        let v108 = closure119(Nil)
        let v109 = ""
        let v110 = -1
        let v111 = 1
        let v112 = 0
        let v113 = 3000000
        let v114 = "500"
        let v115 = "spiralposts"
        let v116 = 0
        let v117 = 0
        let v118 = "2026-10-18T08:00:00Z"
        let v119 = flags_parsed_409(v107, v108, v109, v109, v109, v110, v111, v112, v109, v113, v114, v115, v116, v117, v118, v106)
        let v153 =
            case v119  {
                Us89Ok(v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132) -> {
                    let v133 = v120 == ""
                    let v141 =
                        case v133 {
                            True -> {
                                let v134 = "missing --spi"
                                v134
                            }
                            False -> {
                                let v135 = v121 == ""
                                case v135 {
                                    True -> {
                                        let v136 = "missing --out"
                                        v136
                                    }
                                    False -> {
                                        let v137 = v122 == ""
                                        case v137 {
                                            True -> {
                                                let v138 = "missing --expected"
                                                v138
                                            }
                                            False -> v109
                                        }
                                    }
                                }
                            }
                        }
                    let v142 = v141 != ""
                    case v142 {
                        True -> {
                            let v150 =
                                case v133 {
                                    True -> {
                                        let v143 = "missing --spi"
                                        v143
                                    }
                                    False -> {
                                        let v144 = v121 == ""
                                        case v144 {
                                            True -> {
                                                let v145 = "missing --out"
                                                v145
                                            }
                                            False -> {
                                                let v146 = v122 == ""
                                                case v146 {
                                                    True -> {
                                                        let v147 = "missing --expected"
                                                        v147
                                                    }
                                                    False -> v109
                                                }
                                            }
                                        }
                                    }
                                }
                            Us89Error(v150)
                        }
                        False -> v119
                    }
                }
                _ -> v119
            }
        let v282 =
            case v153  {
                Us89Error(v278) -> {
                    let v279 = "XSIM rejected world: "
                    let v280 = v279 <> v278 
                    v280
                }
                Us89Ok(v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166) -> {
                    let v167 = spiral_fs_read_file(v154)
                    let v168 = method370()
                    let v169 = method371()
                    let v170 = case v167 { Ok(x) -> v168(x) Error(x) -> v169(x) }
                    let v183 =
                        case v170  {
                            Us80Error(v180) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us80Ok(v171) -> {
                                let v172 = bit_array.to_string(v171)
                                let v173 = method258()
                                let v174 = method259()
                                let v175 = case v172 { Ok(x) -> v173(x) Error(x) -> v174(x) }
                                case v175  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v176) -> v176
                                }
                            }
                        }
                    let v184 = erlang_term_coerce(v183)
                    let v185 = erlang_term_coerce(v109)
                    let v186 = "Elixir.Spiral.Cells.Document"
                    let v187 = atom.create(v186)
                    let v188 = "parse_spi"
                    let v189 = atom.create(v188)
                    let v190 = []
                    let v191 = [v185, ..v190]
                    let v192 = [v184, ..v191]
                    let v193 = erlang_term_apply(v187, v189, v192)
                    let v194 = []
                    let v195 = erlang_term_coerce(v194)
                    let v196 = "cells"
                    let v197 = atom.create(v196)
                    let v198 = erlang_term_coerce(v197)
                    let v199 = erlang_term_coerce(v198)
                    let v200 = erlang_term_coerce(v195)
                    let v201 = "maps"
                    let v202 = atom.create(v201)
                    let v203 = "get"
                    let v204 = atom.create(v203)
                    let v205 = []
                    let v206 = [v200, ..v205]
                    let v207 = [v193, ..v206]
                    let v208 = [v199, ..v207]
                    let v209 = erlang_term_apply(v202, v204, v208)
                    let v210 = erlang_term_coerce(v209)
                    let v211 = atom.create(v91)
                    let v212 = atom.create(v93)
                    let v213 = []
                    let v214 = [v210, ..v213]
                    let v215 = erlang_term_apply(v211, v212, v214)
                    let v216 = Uh29Nil
                    let v217 = items_from_301(v215, v216)
                    let v218 = Uh29Nil
                    let v219 = method400(v217, v218)
                    let v220 = Uh3Nil
                    let v221 = method401(v219, v220)
                    let v222 = v157 < 0
                    let v224 =
                        case v222 {
                            True -> v221
                            False -> taken_31(v157, v221)
                        }
                    let v225 = unicode_erlang_characters_to_binary([0])
                    let v226 = delimited_21(v225, v224)
                    let v227 = closure16(Nil)
                    let v228 = unicode_erlang_characters_to_binary([0])
                    let v229 = split_list_2(v228, v226)
                    let #(v230, v231) = world_files_146(v158, v159, v160, v161, v164, v165, v166, v162, v163, v227, v229)
                    let v232 = spiral_fs_write_file(v155, v230)
                    let v233 = spiral_fs_coerce(v232)
                    let v234 = atom.create(v20)
                    let v235 = v233 == v234
                    let v236 = v235 == False
                    case v236 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                    let v237 = spiral_fs_write_file(v156, v231)
                    let v238 = spiral_fs_coerce(v237)
                    let v239 = atom.create(v20)
                    let v240 = v238 == v239
                    let v241 = v240 == False
                    case v241 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                    let v242 = 0
                    let v243 = method20(v224, v242)
                    let v244 = erlang_term_coerce(v230)
                    let v245 = atom.create(v12)
                    let v246 = "byte_size"
                    let v247 = atom.create(v246)
                    let v248 = []
                    let v249 = [v244, ..v248]
                    let v250 = erlang_term_apply(v245, v247, v249)
                    let v251 = erlang_term_coerce(v250)
                    let v252 = int.to_string(v243)
                    let v253 = " cells="
                    let v254 = v253 <> v252 
                    let v255 = " bytes="
                    let v256 = v254 <> v255 
                    let v257 = int.to_string(v251)
                    let v258 = v256 <> v257 
                    let v259 = erlang_term_coerce(v154)
                    let v260 = "filename"
                    let v261 = atom.create(v260)
                    let v262 = "basename"
                    let v263 = atom.create(v262)
                    let v264 = []
                    let v265 = [v259, ..v264]
                    let v266 = erlang_term_apply(v261, v263, v265)
                    let v267 = "unicode"
                    let v268 = atom.create(v267)
                    let v269 = "characters_to_binary"
                    let v270 = atom.create(v269)
                    let v271 = []
                    let v272 = [v266, ..v271]
                    let v273 = erlang_term_apply(v268, v270, v272)
                    let v274 = erlang_term_coerce(v273)
                    let v275 = "xsim.world "
                    let v276 = v275 <> v274 
                    let v277 = v276 <> v258 
                    v277
                }
            }
        let v283 = "\n"
        let v284 = v282 <> v283 
        let v285 = erlang_term_coerce(v284)
        let v286 = "io"
        let v287 = atom.create(v286)
        let v288 = "put_chars"
        let v289 = atom.create(v288)
        let v290 = []
        let v291 = [v285, ..v290]
        let _v292 = erlang_term_apply(v287, v289, v291)
        let v293 = v282 == ""
        let v296 =
            case v293 {
                True -> Uh3Nil
                False -> split_list_2(v283, v282)
            }
        let v297 = method402()
        let v298 = method403(v297, v296)
        case v298 {
            True -> 1
            False -> 0
        }
    }
}

pub fn closure124(capt: Nil) -> fn(String) -> Us90 {
    fn (v0) {
        Us90None
    }
}

pub fn closure123(capt: Nil) -> fn(#(String, String)) -> fn(String) -> Us90 {
    fn (dom) {
        let #(_v0, _v1) = dom
        closure124(Nil)
    }
}

pub fn closure127(capt: #(String, String, String)) -> fn(String) -> Us91 {
    fn (v3) {
        let #(v0, v1, v2) = capt
        let v4 = v2 == "file"
        case v4 {
            True -> Us91Ok(v3, v1)
            False -> {
                let v6 = v2 == "out"
                case v6 {
                    True -> Us91Ok(v0, v3)
                    False -> {
                        let v8 = "unknown option --"
                        let v9 = v8 <> v2 
                        Us91Error(v9)
                    }
                }
            }
        }
    }
}

pub fn closure126(capt: #(String, String)) -> fn(String) -> fn(String) -> Us91 {
    fn (v2) {
        let #(v0, v1) = capt
        closure127(#(v0, v1, v2))
    }
}

pub fn closure125(capt: Nil) -> fn(#(String, String)) -> fn(String) -> fn(String) -> Us91 {
    fn (dom) {
        let #(v0, v1) = dom
        closure126(#(v0, v1))
    }
}

pub fn valued_then_415(v0: fn(#(String, String)) -> fn(String) -> Us90, v1: fn(#(String, String)) -> fn(String) -> fn(String) -> Us91, v2: String, v3: String, v4: String, v5: Uh3) -> Us91 {
    case v5  {
        Uh3Cons(v6, v7) -> {
            let v8 = v1(#(v2, v3))
            let v9 = "--"
            let v10 = v4 |> string.starts_with(v9)
            let v17 =
                case v10 {
                    True -> {
                        let v11 = spiral_string_length(v4)
                        let v12 = spiral_wrap_signed(v11 - 2, 32)
                        let v13 = spiral_wrap_signed(2 + v12, 32)
                        let v14 = spiral_wrap_signed(v13 - 1, 32)
                        let v15 = spiral_string_slice(v4, 2, v14)
                        v15
                    }
                    False -> {
                        let v16 = ""
                        v16
                    }
                }
            let v18 = v8(v17)
            let v19 = v18(v6)
            continued_416(v0, v1, v19, v7)
        }
        Uh3Nil -> {
            let v21 = "--"
            let v22 = v4 |> string.starts_with(v21)
            let v29 =
                case v22 {
                    True -> {
                        let v23 = spiral_string_length(v4)
                        let v24 = spiral_wrap_signed(v23 - 2, 32)
                        let v25 = spiral_wrap_signed(2 + v24, 32)
                        let v26 = spiral_wrap_signed(v25 - 1, 32)
                        let v27 = spiral_string_slice(v4, 2, v26)
                        v27
                    }
                    False -> {
                        let v28 = ""
                        v28
                    }
                }
            let v30 = v21 <> v29 
            let v31 = " needs a value"
            let v32 = v30 <> v31 
            Us91Error(v32)
        }
    }
}

pub fn arg_parsed_414(v0: fn(#(String, String)) -> fn(String) -> Us90, v1: fn(#(String, String)) -> fn(String) -> fn(String) -> Us91, v2: String, v3: String, v4: String, v5: Uh3) -> Us91 {
    let v6 = v0(#(v2, v3))
    let v7 = "--"
    let v8 = v4 |> string.starts_with(v7)
    let v15 =
        case v8 {
            True -> {
                let v9 = spiral_string_length(v4)
                let v10 = spiral_wrap_signed(v9 - 2, 32)
                let v11 = spiral_wrap_signed(2 + v10, 32)
                let v12 = spiral_wrap_signed(v11 - 1, 32)
                let v13 = spiral_string_slice(v4, 2, v12)
                v13
            }
            False -> {
                let v14 = ""
                v14
            }
        }
    let v16 = v6(v15)
    case v16  {
        Us90None -> valued_then_415(v0, v1, v2, v3, v4, v5)
        Us90Some(v17, v18) -> flags_parsed_413(v0, v1, v17, v18, v5)
    }
}

pub fn flags_parsed_413(v0: fn(#(String, String)) -> fn(String) -> Us90, v1: fn(#(String, String)) -> fn(String) -> fn(String) -> Us91, v2: String, v3: String, v4: Uh3) -> Us91 {
    case v4  {
        Uh3Cons(v6, v7) -> {
            let v8 = "--"
            let v9 = v6 |> string.starts_with(v8)
            let v16 =
                case v9 {
                    True -> {
                        let v10 = spiral_string_length(v6)
                        let v11 = spiral_wrap_signed(v10 - 2, 32)
                        let v12 = spiral_wrap_signed(2 + v11, 32)
                        let v13 = spiral_wrap_signed(v12 - 1, 32)
                        let v14 = spiral_string_slice(v6, 2, v13)
                        v14
                    }
                    False -> {
                        let v15 = ""
                        v15
                    }
                }
            let v17 = v16 == ""
            case v17 {
                True -> {
                    let v18 = "unexpected argument '"
                    let v19 = v18 <> v6 
                    let v20 = "'"
                    let v21 = v19 <> v20 
                    Us91Error(v21)
                }
                False -> arg_parsed_414(v0, v1, v2, v3, v6, v7)
            }
        }
        Uh3Nil -> Us91Ok(v2, v3)
    }
}

pub fn continued_416(v0: fn(#(String, String)) -> fn(String) -> Us90, v1: fn(#(String, String)) -> fn(String) -> fn(String) -> Us91, v2: Us91, v3: Uh3) -> Us91 {
    case v2  {
        Us91Error(v7) -> Us91Error(v7)
        Us91Ok(v4, v5) -> flags_parsed_413(v0, v1, v4, v5, v3)
    }
}

pub fn with_blanks_420(v0: Int, v1: Uh3) -> Uh3 {
    let v2 = v0 <= 0
    case v2 {
        True -> v1
        False -> {
            let v3 = spiral_wrap_signed(v0 - 1, 32)
            let v4 = ""
            let v5 = Uh3Cons(v4, v1)
            with_blanks_420(v3, v5)
        }
    }
}

pub fn step_419(v0: Uh3, v1: Uh3, v2: Int, v3: Bool, v4: String) -> #(Uh3, Uh3, Int, Bool) {
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
                            let v9 = " "
                            let v10 = v4 |> string.starts_with(v9)
                            let v13 =
                                case v10 {
                                    True -> True
                                    False -> {
                                        let v11 = "\t"
                                        let v12 = v4 |> string.starts_with(v11)
                                        v12
                                    }
                                }
                            let v14 = v13 == False
                            v14
                        }
                        False -> False
                    }
                let #(v42, v43, v44, v45) =
                    case v15 {
                        True -> {
                            let v16 = Uh3Nil
                            let v17 = method4(v1, v16)
                            let v18 = "\n"
                            let v19 = concat_balanced_22(v18, v17)
                            let v20 = spiral_string_length(v19)
                            let v21 = string.to_graphemes(v19)
                            let v22 = v21 |> list.reverse
                            let v23 = Uh3Nil
                            let listm_fold = v22 |> list.fold (v23, fn (acc, x) {
                            let v24 = x
                            let v25 = acc
                            let v26 = Uh3Cons(v24, v25)
                            v26
                            })
                            let v27 = listm_fold
                            let v28 = Uh3Nil
                            let v29 = method4(v27, v28)
                            let v30 = 0
                            let v31 = blank_tail_length_163(v29, v30)
                            let v32 = spiral_wrap_signed(v20 - v31, 32)
                            let v33 = spiral_wrap_signed(v32 - 1, 32)
                            let v34 = spiral_string_slice(v19, 0, v33)
                            let v35 = spiral_wrap_signed(v2 - 1, 32)
                            let v36 = Uh3Nil
                            let v37 = with_blanks_420(v35, v36)
                            let v38 = Uh3Cons(v34, v0)
                            let v39 = Uh3Cons(v4, v37)
                            #(v38, v39, 0, True)
                        }
                        False -> {
                            let v40 = with_blanks_420(v2, v1)
                            let v41 = Uh3Cons(v4, v40)
                            #(v0, v41, 0, True)
                        }
                    }
                #(v42, v43, v44, v45)
            }
        }
    #(v46, v47, v48, v49)
}

pub fn method418(v0: Uh3, v1: Uh3, v2: Uh3, v3: Int, v4: Bool) -> #(Uh3, Uh3, Int, Bool) {
    let #(v19, v20, v21, v22) =
        case v0  {
            Uh3Cons(v5, v6) -> {
                let #(v7, v8, v9, v10) = step_419(v1, v2, v3, v4, v5)
                method418(v6, v7, v8, v9, v10)
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

pub fn file_cells_417(v0: String) -> Uh3 {
    let v1 = "\r\n"
    let v2 = "\n"
    let v3 = v0 |> string.replace(v1, v2)
    let v4 = v3 |> string.ends_with(v2)
    let v9 =
        case v4 {
            True -> {
                let v5 = spiral_string_length(v3)
                let v6 = spiral_wrap_signed(v5 - 1, 32)
                let v7 = spiral_wrap_signed(v6 - 1, 32)
                let v8 = spiral_string_slice(v3, 0, v7)
                v8
            }
            False -> v3
        }
    let v10 = v9 == ""
    case v10 {
        True -> Uh3Nil
        False -> {
            let v12 = split_list_2(v2, v9)
            let v13 = Uh3Nil
            let v14 = Uh3Nil
            let v15 = 0
            let v16 = False
            let #(v17, v18, v19, _v20) = method418(v12, v13, v14, v15, v16)
            let v21 = with_blanks_420(v19, v18)
            let v22 = Uh3Nil
            let v23 = method4(v21, v22)
            let v24 = concat_balanced_22(v2, v23)
            let v25 = spiral_string_length(v24)
            let v26 = string.to_graphemes(v24)
            let v27 = v26 |> list.reverse
            let v28 = Uh3Nil
            let listm_fold = v27 |> list.fold (v28, fn (acc, x) {
            let v29 = x
            let v30 = acc
            let v31 = Uh3Cons(v29, v30)
            v31
            })
            let v32 = listm_fold
            let v33 = Uh3Nil
            let v34 = method4(v32, v33)
            let v35 = 0
            let v36 = blank_tail_length_163(v34, v35)
            let v37 = spiral_wrap_signed(v25 - v36, 32)
            let v38 = spiral_wrap_signed(v37 - 1, 32)
            let v39 = spiral_string_slice(v24, 0, v38)
            let v40 = Uh3Nil
            let v41 = Uh3Cons(v39, v40)
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
        let v12 = "c"
        let v13 = v12 <> v11 
        let v18 =
            case v0  {
                Us79OnBluesky(v14, v15) -> 300
                Us79OnMastodon -> 500
                Us79OnX -> 280
            }
        split_cell_on_350(v0, v13, v18, v10)
    }
}

pub fn closure128(capt: #(Us79)) -> fn(Int) -> fn(String) -> Uh3 {
    fn (v1) {
        let #(v0) = capt
        closure129(#(v0, v1))
    }
}

pub fn numbered_425(v0: String, v1: Int, v2: Int, v3: Uh3, v4: Uh3) -> Uh3 {
    case v3  {
        Uh3Cons(v7, v8) -> {
            let v9 = spiral_wrap_signed(v2 + 1, 32)
            let v10 = " "
            let v11 = v0 <> v10 
            let v12 = int.to_string(v2)
            let v13 = v11 <> v12 
            let v14 = "/"
            let v15 = v13 <> v14 
            let v16 = int.to_string(v1)
            let v17 = v15 <> v16 
            let v18 = "\n"
            let v19 = v17 <> v18 
            let v20 = v19 <> v7 
            let v21 = spiral_string_length(v20)
            let v22 = string.to_graphemes(v20)
            let v23 = v22 |> list.reverse
            let v24 = Uh3Nil
            let listm_fold = v23 |> list.fold (v24, fn (acc, x) {
            let v25 = x
            let v26 = acc
            let v27 = Uh3Cons(v25, v26)
            v27
            })
            let v28 = listm_fold
            let v29 = Uh3Nil
            let v30 = method4(v28, v29)
            let v31 = 0
            let v32 = blank_tail_length_163(v30, v31)
            let v33 = spiral_wrap_signed(v21 - v32, 32)
            let v34 = spiral_wrap_signed(v33 - 1, 32)
            let v35 = spiral_string_slice(v20, 0, v34)
            let v36 = Uh3Cons(v35, v4)
            numbered_425(v0, v1, v9, v8, v36)
        }
        Uh3Nil -> {
            let v5 = Uh3Nil
            method4(v4, v5)
        }
    }
}

pub fn cell_posts_by_424(v0: fn(Int) -> fn(String) -> Uh3, v1: Int, v2: String) -> Uh3 {
    let v3 = v0(v1)
    let v4 = v3(v2)
    let v8 =
        case v4  {
            Uh3Nil -> {
                let v5 = ""
                let v6 = Uh3Nil
                Uh3Cons(v5, v6)
            }
            _ -> v4
        }
    let v9 = int.to_string(v1)
    let v10 = "c"
    let v11 = v10 <> v9 
    let v12 = 0
    let v13 = method20(v8, v12)
    let v14 = 1
    let v15 = Uh3Nil
    numbered_425(v11, v13, v14, v8, v15)
}

pub fn method426(v0: Uh8, v1: Uh8) -> Uh8 {
    case v0  {
        Uh8Cons(v2, v3) -> {
            let v4 = Uh8Cons(v2, v1)
            method426(v3, v4)
        }
        Uh8Nil -> v1
    }
}

pub fn method427(v0: Uh8, v1: Uh3) -> Uh3 {
    case v0  {
        Uh8Cons(v2, v3) -> {
            let v4 = method427(v3, v1)
            method18(v2, v4)
        }
        Uh8Nil -> v1
    }
}

pub fn thread_by_423(v0: fn(Int) -> fn(String) -> Uh3, v1: Int, v2: Uh3, v3: Uh8) -> Uh3 {
    case v2  {
        Uh3Cons(v8, v9) -> {
            let v10 = spiral_wrap_signed(v1 + 1, 32)
            let v11 = cell_posts_by_424(v0, v1, v8)
            let v12 = Uh8Cons(v11, v3)
            thread_by_423(v0, v10, v9, v12)
        }
        Uh3Nil -> {
            let v4 = Uh8Nil
            let v5 = method426(v3, v4)
            let v6 = Uh3Nil
            method427(v5, v6)
        }
    }
}

pub fn thread_on_422(v0: Us79, v1: Int, v2: Uh3, v3: Uh8) -> Uh3 {
    let v4 = closure128(#(v0))
    thread_by_423(v4, v1, v2, v3)
}

pub fn thread_of_421(v0: Int, v1: Uh3, v2: Uh8) -> Uh3 {
    let v3 = Us79OnX
    thread_on_422(v3, v0, v1, v2)
}

pub fn method428(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method428(v3, v1)
            let v5 = unicode_erlang_nfc(v2)
            Uh3Cons(v5, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method429(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method429(v3, v1)
            let v5 = erlang_term_coerce(v2)
            let v6 = "json"
            let v7 = atom.create(v6)
            let v8 = "encode"
            let v9 = atom.create(v8)
            let v10 = []
            let v11 = [v5, ..v10]
            let v12 = erlang_term_apply(v7, v9, v11)
            let v13 = "erlang"
            let v14 = atom.create(v13)
            let v15 = "iolist_to_binary"
            let v16 = atom.create(v15)
            let v17 = []
            let v18 = [v12, ..v17]
            let v19 = erlang_term_apply(v14, v16, v18)
            let v20 = erlang_term_coerce(v19)
            Uh3Cons(v20, v4)
        }
        Uh3Nil -> v1
    }
}
