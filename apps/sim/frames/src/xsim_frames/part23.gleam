import gleam/bit_array
import gleam/erlang/atom
import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Uh8, type Us75, type Us86, type Us87, Uh29Nil, Uh3Cons, Uh3Nil, Uh8Cons, Uh8Nil, Us56Error, Us56Ok, Us75OnBluesky, Us75OnMastodon, Us75OnX, Us76Error, Us76Ok, Us85Error, Us85Ok, Us86None, Us86Some, Us87Error, Us87Ok}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, method4, spiral_fs_coerce, spiral_fs_read_file, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part10.{method259, method260}
import xsim_frames/part15.{closure96}
import xsim_frames/part16.{defused_dots_by_308, defused_entities_329}
import xsim_frames/part17.{method367, method368, split_cell_on_347}
import xsim_frames/part2.{concat_balanced_22, delimited_21, method18, method20, taken_31}
import xsim_frames/part20.{method396, method397, method398, method399, method400}
import xsim_frames/part22.{closure119, closure121, flags_parsed_406}
import xsim_frames/part6.{closure16}
import xsim_frames/part7.{blank_tail_length_164}
import xsim_frames/part9.{world_files_147}

pub fn closure118(capt: Nil) -> fn(String) -> Int {
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
        let v91 = erlang_term_coerce(0)
        let v92 = []
        let v93 = [v91, ..v92]
        let v94 = erlang_term_coerce(v93)
        let v95 = "lists"
        let v96 = atom.create(v95)
        let v97 = "join"
        let v98 = atom.create(v97)
        let v99 = []
        let v100 = [v90, ..v99]
        let v101 = [v94, ..v100]
        let v102 = erlang_term_apply(v96, v98, v101)
        let v103 = "unicode"
        let v104 = atom.create(v103)
        let v105 = "characters_to_binary"
        let v106 = atom.create(v105)
        let v107 = []
        let v108 = [v102, ..v107]
        let v109 = erlang_term_apply(v104, v106, v108)
        let v110 = erlang_term_coerce(v109)
        let v111 = unicode_erlang_characters_to_binary([0])
        let v112 = v110 == ""
        let v115 =
            case v112 {
                True -> Uh3Nil
                False -> split_list_2(v111, v110)
            }
        let v120 =
            case v115  {
                Uh3Cons(v116, v117) -> v117
                Uh3Nil -> Uh3Nil
            }
        let v121 = closure119(Nil)
        let v122 = closure121(Nil)
        let v123 = ""
        let v124 = -1
        let v125 = 1
        let v126 = 0
        let v127 = 3000000
        let v128 = "500"
        let v129 = "spiralposts"
        let v130 = 0
        let v131 = 0
        let v132 = "2026-10-18T08:00:00Z"
        let v133 = flags_parsed_406(v121, v122, v123, v123, v123, v124, v125, v126, v123, v127, v128, v129, v130, v131, v132, v120)
        let v167 =
            case v133  {
                Us85Ok(v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146) -> {
                    let v147 = v134 == ""
                    let v155 =
                        case v147 {
                            True -> {
                                let v148 = "missing --spi"
                                v148
                            }
                            False -> {
                                let v149 = v135 == ""
                                case v149 {
                                    True -> {
                                        let v150 = "missing --out"
                                        v150
                                    }
                                    False -> {
                                        let v151 = v136 == ""
                                        case v151 {
                                            True -> {
                                                let v152 = "missing --expected"
                                                v152
                                            }
                                            False -> v123
                                        }
                                    }
                                }
                            }
                        }
                    let v156 = v155 != ""
                    case v156 {
                        True -> {
                            let v164 =
                                case v147 {
                                    True -> {
                                        let v157 = "missing --spi"
                                        v157
                                    }
                                    False -> {
                                        let v158 = v135 == ""
                                        case v158 {
                                            True -> {
                                                let v159 = "missing --out"
                                                v159
                                            }
                                            False -> {
                                                let v160 = v136 == ""
                                                case v160 {
                                                    True -> {
                                                        let v161 = "missing --expected"
                                                        v161
                                                    }
                                                    False -> v123
                                                }
                                            }
                                        }
                                    }
                                }
                            Us85Error(v164)
                        }
                        False -> v133
                    }
                }
                _ -> v133
            }
        let v288 =
            case v167  {
                Us85Error(v284) -> {
                    let v285 = "XSIM rejected world: "
                    let v286 = v285 <> v284 
                    v286
                }
                Us85Ok(v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180) -> {
                    let v181 = spiral_fs_read_file(v168)
                    let v182 = method367()
                    let v183 = method368()
                    let v184 = case v181 { Ok(x) -> v182(x) Error(x) -> v183(x) }
                    let v197 =
                        case v184  {
                            Us76Error(v194) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us76Ok(v185) -> {
                                let v186 = bit_array.to_string(v185)
                                let v187 = method259()
                                let v188 = method260()
                                let v189 = case v186 { Ok(x) -> v187(x) Error(x) -> v188(x) }
                                case v189  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v190) -> v190
                                }
                            }
                        }
                    let v198 = erlang_term_coerce(v197)
                    let v199 = erlang_term_coerce(v123)
                    let v200 = "Elixir.Spiral.Cells.Document"
                    let v201 = atom.create(v200)
                    let v202 = "parse_spi"
                    let v203 = atom.create(v202)
                    let v204 = []
                    let v205 = [v199, ..v204]
                    let v206 = [v198, ..v205]
                    let v207 = erlang_term_apply(v201, v203, v206)
                    let v208 = []
                    let v209 = erlang_term_coerce(v208)
                    let v210 = "cells"
                    let v211 = atom.create(v210)
                    let v212 = erlang_term_coerce(v211)
                    let v213 = "maps"
                    let v214 = atom.create(v213)
                    let v215 = "get"
                    let v216 = atom.create(v215)
                    let v217 = []
                    let v218 = [v209, ..v217]
                    let v219 = [v207, ..v218]
                    let v220 = [v212, ..v219]
                    let v221 = erlang_term_apply(v214, v216, v220)
                    let v222 = atom.create(v12)
                    let v223 = "length"
                    let v224 = atom.create(v223)
                    let v225 = []
                    let v226 = [v221, ..v225]
                    let v227 = erlang_term_apply(v222, v224, v226)
                    let v228 = erlang_term_coerce(v227)
                    let v229 = 0
                    let v230 = method396(v228, v221, v229)
                    let v231 = Uh29Nil
                    let v232 = method397(v230, v231)
                    let v233 = Uh3Nil
                    let v234 = method398(v232, v233)
                    let v235 = v171 < 0
                    let v237 =
                        case v235 {
                            True -> v234
                            False -> taken_31(v171, v234)
                        }
                    let v238 = unicode_erlang_characters_to_binary([0])
                    let v239 = delimited_21(v238, v237)
                    let v240 = closure16(Nil)
                    let v241 = unicode_erlang_characters_to_binary([0])
                    let v242 = split_list_2(v241, v239)
                    let #(v243, v244) = world_files_147(v172, v173, v174, v175, v178, v179, v180, v176, v177, v240, v242)
                    let v245 = spiral_fs_write_file(v169, v243)
                    let v246 = spiral_fs_coerce(v245)
                    let v247 = atom.create(v20)
                    let v248 = v246 == v247
                    let v249 = v248 == False
                    case v249 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                    let v250 = spiral_fs_write_file(v170, v244)
                    let v251 = spiral_fs_coerce(v250)
                    let v252 = atom.create(v20)
                    let v253 = v251 == v252
                    let v254 = v253 == False
                    case v254 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                    let v255 = 0
                    let v256 = method20(v237, v255)
                    let v257 = erlang_term_coerce(v243)
                    let v258 = atom.create(v12)
                    let v259 = "byte_size"
                    let v260 = atom.create(v259)
                    let v261 = []
                    let v262 = [v257, ..v261]
                    let v263 = erlang_term_apply(v258, v260, v262)
                    let v264 = erlang_term_coerce(v263)
                    let v265 = string.inspect(v256)
                    let v266 = " cells="
                    let v267 = v266 <> v265 
                    let v268 = " bytes="
                    let v269 = v267 <> v268 
                    let v270 = string.inspect(v264)
                    let v271 = v269 <> v270 
                    let v272 = erlang_term_coerce(v168)
                    let v273 = "filename"
                    let v274 = atom.create(v273)
                    let v275 = "basename"
                    let v276 = atom.create(v275)
                    let v277 = []
                    let v278 = [v272, ..v277]
                    let v279 = erlang_term_apply(v274, v276, v278)
                    let v280 = erlang_term_coerce(v279)
                    let v281 = "xsim.world "
                    let v282 = v281 <> v280 
                    let v283 = v282 <> v271 
                    v283
                }
            }
        let v289 = "\n"
        let v290 = v288 <> v289 
        let v291 = erlang_term_coerce(v290)
        let v292 = "io"
        let v293 = atom.create(v292)
        let v294 = "put_chars"
        let v295 = atom.create(v294)
        let v296 = []
        let v297 = [v291, ..v296]
        let _v298 = erlang_term_apply(v293, v295, v297)
        let v299 = v288 == ""
        let v302 =
            case v299 {
                True -> Uh3Nil
                False -> split_list_2(v289, v288)
            }
        let v303 = method399()
        let v304 = method400(v303, v302)
        case v304 {
            True -> 1
            False -> 0
        }
    }
}

pub fn closure126(capt: Nil) -> fn(String) -> Us86 {
    fn (v0) {
        Us86None
    }
}

pub fn closure125(capt: Nil) -> fn(#(String, String)) -> fn(String) -> Us86 {
    fn (dom) {
        let #(_v0, _v1) = dom
        closure126(Nil)
    }
}

pub fn closure129(capt: #(String, String, String)) -> fn(String) -> Us87 {
    fn (v3) {
        let #(v0, v1, v2) = capt
        let v4 = v2 == "file"
        case v4 {
            True -> Us87Ok(v3, v1)
            False -> {
                let v6 = v2 == "out"
                case v6 {
                    True -> Us87Ok(v0, v3)
                    False -> {
                        let v8 = "unknown option --"
                        let v9 = v8 <> v2 
                        Us87Error(v9)
                    }
                }
            }
        }
    }
}

pub fn closure128(capt: #(String, String)) -> fn(String) -> fn(String) -> Us87 {
    fn (v2) {
        let #(v0, v1) = capt
        closure129(#(v0, v1, v2))
    }
}

pub fn closure127(capt: Nil) -> fn(#(String, String)) -> fn(String) -> fn(String) -> Us87 {
    fn (dom) {
        let #(v0, v1) = dom
        closure128(#(v0, v1))
    }
}

pub fn valued_then_412(v0: fn(#(String, String)) -> fn(String) -> Us86, v1: fn(#(String, String)) -> fn(String) -> fn(String) -> Us87, v2: String, v3: String, v4: String, v5: Uh3) -> Us87 {
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
            continued_413(v0, v1, v19, v7)
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
            Us87Error(v32)
        }
    }
}

pub fn arg_parsed_411(v0: fn(#(String, String)) -> fn(String) -> Us86, v1: fn(#(String, String)) -> fn(String) -> fn(String) -> Us87, v2: String, v3: String, v4: String, v5: Uh3) -> Us87 {
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
        Us86None -> valued_then_412(v0, v1, v2, v3, v4, v5)
        Us86Some(v17, v18) -> flags_parsed_410(v0, v1, v17, v18, v5)
    }
}

pub fn flags_parsed_410(v0: fn(#(String, String)) -> fn(String) -> Us86, v1: fn(#(String, String)) -> fn(String) -> fn(String) -> Us87, v2: String, v3: String, v4: Uh3) -> Us87 {
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
                    Us87Error(v21)
                }
                False -> arg_parsed_411(v0, v1, v2, v3, v6, v7)
            }
        }
        Uh3Nil -> Us87Ok(v2, v3)
    }
}

pub fn continued_413(v0: fn(#(String, String)) -> fn(String) -> Us86, v1: fn(#(String, String)) -> fn(String) -> fn(String) -> Us87, v2: Us87, v3: Uh3) -> Us87 {
    case v2  {
        Us87Error(v7) -> Us87Error(v7)
        Us87Ok(v4, v5) -> flags_parsed_410(v0, v1, v4, v5, v3)
    }
}

pub fn with_blanks_417(v0: Int, v1: Uh3) -> Uh3 {
    let v2 = v0 <= 0
    case v2 {
        True -> v1
        False -> {
            let v3 = spiral_wrap_signed(v0 - 1, 32)
            let v4 = ""
            let v5 = Uh3Cons(v4, v1)
            with_blanks_417(v3, v5)
        }
    }
}

pub fn step_416(v0: Uh3, v1: Uh3, v2: Int, v3: Bool, v4: String) -> #(Uh3, Uh3, Int, Bool) {
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
                            let v31 = blank_tail_length_164(v29, v30)
                            let v32 = spiral_wrap_signed(v20 - v31, 32)
                            let v33 = spiral_wrap_signed(v32 - 1, 32)
                            let v34 = spiral_string_slice(v19, 0, v33)
                            let v35 = spiral_wrap_signed(v2 - 1, 32)
                            let v36 = Uh3Nil
                            let v37 = with_blanks_417(v35, v36)
                            let v38 = Uh3Cons(v34, v0)
                            let v39 = Uh3Cons(v4, v37)
                            #(v38, v39, 0, True)
                        }
                        False -> {
                            let v40 = with_blanks_417(v2, v1)
                            let v41 = Uh3Cons(v4, v40)
                            #(v0, v41, 0, True)
                        }
                    }
                #(v42, v43, v44, v45)
            }
        }
    #(v46, v47, v48, v49)
}

pub fn method415(v0: Uh3, v1: Uh3, v2: Uh3, v3: Int, v4: Bool) -> #(Uh3, Uh3, Int, Bool) {
    let #(v19, v20, v21, v22) =
        case v0  {
            Uh3Cons(v5, v6) -> {
                let #(v7, v8, v9, v10) = step_416(v1, v2, v3, v4, v5)
                method415(v6, v7, v8, v9, v10)
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

pub fn file_cells_414(v0: String) -> Uh3 {
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
            let #(v17, v18, v19, _v20) = method415(v12, v13, v14, v15, v16)
            let v21 = with_blanks_417(v19, v18)
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
            let v36 = blank_tail_length_164(v34, v35)
            let v37 = spiral_wrap_signed(v25 - v36, 32)
            let v38 = spiral_wrap_signed(v37 - 1, 32)
            let v39 = spiral_string_slice(v24, 0, v38)
            let v40 = Uh3Nil
            let v41 = Uh3Cons(v39, v40)
            method4(v17, v41)
        }
    }
}

pub fn closure131(capt: #(Us75, Int)) -> fn(String) -> Uh3 {
    fn (v2) {
        let #(v0, v1) = capt
        let v10 =
            case v0  {
                Us75OnBluesky(v6, v7) -> v2
                Us75OnMastodon -> v2
                Us75OnX -> {
                    let v3 = closure96(Nil)
                    let v4 = defused_dots_by_308(v3, v2)
                    defused_entities_329(v4)
                }
            }
        let v11 = string.inspect(v1)
        let v12 = "c"
        let v13 = v12 <> v11 
        let v18 =
            case v0  {
                Us75OnBluesky(v14, v15) -> 300
                Us75OnMastodon -> 500
                Us75OnX -> 280
            }
        split_cell_on_347(v0, v13, v18, v10)
    }
}

pub fn closure130(capt: #(Us75)) -> fn(Int) -> fn(String) -> Uh3 {
    fn (v1) {
        let #(v0) = capt
        closure131(#(v0, v1))
    }
}

pub fn numbered_422(v0: String, v1: Int, v2: Int, v3: Uh3, v4: Uh3) -> Uh3 {
    case v3  {
        Uh3Cons(v7, v8) -> {
            let v9 = spiral_wrap_signed(v2 + 1, 32)
            let v10 = " "
            let v11 = v0 <> v10 
            let v12 = string.inspect(v2)
            let v13 = v11 <> v12 
            let v14 = "/"
            let v15 = v13 <> v14 
            let v16 = string.inspect(v1)
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
            let v32 = blank_tail_length_164(v30, v31)
            let v33 = spiral_wrap_signed(v21 - v32, 32)
            let v34 = spiral_wrap_signed(v33 - 1, 32)
            let v35 = spiral_string_slice(v20, 0, v34)
            let v36 = Uh3Cons(v35, v4)
            numbered_422(v0, v1, v9, v8, v36)
        }
        Uh3Nil -> {
            let v5 = Uh3Nil
            method4(v4, v5)
        }
    }
}

pub fn cell_posts_by_421(v0: fn(Int) -> fn(String) -> Uh3, v1: Int, v2: String) -> Uh3 {
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
    let v9 = string.inspect(v1)
    let v10 = "c"
    let v11 = v10 <> v9 
    let v12 = 0
    let v13 = method20(v8, v12)
    let v14 = 1
    let v15 = Uh3Nil
    numbered_422(v11, v13, v14, v8, v15)
}

pub fn method423(v0: Uh8, v1: Uh8) -> Uh8 {
    case v0  {
        Uh8Cons(v2, v3) -> {
            let v4 = Uh8Cons(v2, v1)
            method423(v3, v4)
        }
        Uh8Nil -> v1
    }
}

pub fn method424(v0: Uh8, v1: Uh3) -> Uh3 {
    case v0  {
        Uh8Cons(v2, v3) -> {
            let v4 = method424(v3, v1)
            method18(v2, v4)
        }
        Uh8Nil -> v1
    }
}

pub fn thread_by_420(v0: fn(Int) -> fn(String) -> Uh3, v1: Int, v2: Uh3, v3: Uh8) -> Uh3 {
    case v2  {
        Uh3Cons(v8, v9) -> {
            let v10 = spiral_wrap_signed(v1 + 1, 32)
            let v11 = cell_posts_by_421(v0, v1, v8)
            let v12 = Uh8Cons(v11, v3)
            thread_by_420(v0, v10, v9, v12)
        }
        Uh3Nil -> {
            let v4 = Uh8Nil
            let v5 = method423(v3, v4)
            let v6 = Uh3Nil
            method424(v5, v6)
        }
    }
}

pub fn thread_on_419(v0: Us75, v1: Int, v2: Uh3, v3: Uh8) -> Uh3 {
    let v4 = closure130(#(v0))
    thread_by_420(v4, v1, v2, v3)
}

pub fn thread_of_418(v0: Int, v1: Uh3, v2: Uh8) -> Uh3 {
    let v3 = Us75OnX
    thread_on_419(v3, v0, v1, v2)
}

pub fn method425(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method425(v3, v1)
            let v5 = erlang_term_coerce(v2)
            let v6 = "unicode"
            let v7 = atom.create(v6)
            let v8 = "characters_to_nfc_binary"
            let v9 = atom.create(v8)
            let v10 = []
            let v11 = [v5, ..v10]
            let v12 = erlang_term_apply(v7, v9, v11)
            let v13 = erlang_term_coerce(v12)
            Uh3Cons(v13, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method426(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method426(v3, v1)
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
