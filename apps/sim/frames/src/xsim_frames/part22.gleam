import gleam/bit_array
import gleam/erlang/atom
import gleam/string
import xsim_frames/types.{type Uh3, type Us84, type Us85, Uh29Nil, Uh3Cons, Uh3Nil, Us3None, Us3Some, Us56Error, Us56Ok, Us76Error, Us76Ok, Us81Error, Us81Ok, Us84None, Us84Some, Us85Error, Us85Ok}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, spiral_fs_coerce, spiral_fs_read_file, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part10.{method259, method260}
import xsim_frames/part17.{method367, method368}
import xsim_frames/part2.{delimited_21, method20, taken_31}
import xsim_frames/part20.{method396, method397, method398, method399, method400}
import xsim_frames/part21.{closure113, closure115, flags_parsed_401, method405}
import xsim_frames/part6.{closure16}
import xsim_frames/part9.{scenario_final_229, scenario_stream_228}

pub fn closure112(capt: Nil) -> fn(String) -> Int {
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
        let v121 = closure113(Nil)
        let v122 = closure115(Nil)
        let v123 = ""
        let v124 = -1
        let v125 = 1
        let v126 = 3
        let v127 = 1
        let v128 = 200
        let v129 = False
        let v130 = flags_parsed_401(v121, v122, v123, v124, v125, v126, v127, v123, v128, v129, v123, v123, v120)
        let v161 =
            case v130  {
                Us81Ok(v131, v132, v133, v134, v135, v136, v137, v138, v139, v140) -> {
                    let v141 = v131 == ""
                    let v149 =
                        case v141 {
                            True -> {
                                let v142 = "missing --spi"
                                v142
                            }
                            False -> {
                                let v143 = v139 == ""
                                case v143 {
                                    True -> {
                                        let v144 = "missing --out"
                                        v144
                                    }
                                    False -> {
                                        let v145 = v140 == ""
                                        case v145 {
                                            True -> {
                                                let v146 = "missing --expected"
                                                v146
                                            }
                                            False -> v123
                                        }
                                    }
                                }
                            }
                        }
                    let v150 = v149 != ""
                    case v150 {
                        True -> {
                            let v158 =
                                case v141 {
                                    True -> {
                                        let v151 = "missing --spi"
                                        v151
                                    }
                                    False -> {
                                        let v152 = v139 == ""
                                        case v152 {
                                            True -> {
                                                let v153 = "missing --out"
                                                v153
                                            }
                                            False -> {
                                                let v154 = v140 == ""
                                                case v154 {
                                                    True -> {
                                                        let v155 = "missing --expected"
                                                        v155
                                                    }
                                                    False -> v123
                                                }
                                            }
                                        }
                                    }
                                }
                            Us81Error(v158)
                        }
                        False -> v130
                    }
                }
                _ -> v130
            }
        let v282 =
            case v161  {
                Us81Error(v278) -> {
                    let v279 = "XSIM rejected events: "
                    let v280 = v279 <> v278 
                    v280
                }
                Us81Ok(v162, v163, v164, v165, v166, v167, v168, v169, v170, v171) -> {
                    let v172 = spiral_fs_read_file(v162)
                    let v173 = method367()
                    let v174 = method368()
                    let v175 = case v172 { Ok(x) -> v173(x) Error(x) -> v174(x) }
                    let v188 =
                        case v175  {
                            Us76Error(v185) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us76Ok(v176) -> {
                                let v177 = bit_array.to_string(v176)
                                let v178 = method259()
                                let v179 = method260()
                                let v180 = case v177 { Ok(x) -> v178(x) Error(x) -> v179(x) }
                                case v180  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v181) -> v181
                                }
                            }
                        }
                    let v189 = erlang_term_coerce(v188)
                    let v190 = erlang_term_coerce(v123)
                    let v191 = "Elixir.Spiral.Cells.Document"
                    let v192 = atom.create(v191)
                    let v193 = "parse_spi"
                    let v194 = atom.create(v193)
                    let v195 = []
                    let v196 = [v190, ..v195]
                    let v197 = [v189, ..v196]
                    let v198 = erlang_term_apply(v192, v194, v197)
                    let v199 = []
                    let v200 = erlang_term_coerce(v199)
                    let v201 = "cells"
                    let v202 = atom.create(v201)
                    let v203 = erlang_term_coerce(v202)
                    let v204 = "maps"
                    let v205 = atom.create(v204)
                    let v206 = "get"
                    let v207 = atom.create(v206)
                    let v208 = []
                    let v209 = [v200, ..v208]
                    let v210 = [v198, ..v209]
                    let v211 = [v203, ..v210]
                    let v212 = erlang_term_apply(v205, v207, v211)
                    let v213 = atom.create(v12)
                    let v214 = "length"
                    let v215 = atom.create(v214)
                    let v216 = []
                    let v217 = [v212, ..v216]
                    let v218 = erlang_term_apply(v213, v215, v217)
                    let v219 = erlang_term_coerce(v218)
                    let v220 = 0
                    let v221 = method396(v219, v212, v220)
                    let v222 = Uh29Nil
                    let v223 = method397(v221, v222)
                    let v224 = Uh3Nil
                    let v225 = method398(v223, v224)
                    let v226 = v163 < 0
                    let v228 =
                        case v226 {
                            True -> v225
                            False -> taken_31(v163, v225)
                        }
                    let v229 = unicode_erlang_characters_to_binary([0])
                    let v230 = delimited_21(v229, v228)
                    let v231 = closure16(Nil)
                    let v232 = unicode_erlang_characters_to_binary([0])
                    let v233 = split_list_2(v232, v230)
                    let v234 = scenario_stream_228(v164, v165, v166, v167, v168, v169, v231, v233)
                    let v235 = unicode_erlang_characters_to_binary([0])
                    let v236 = split_list_2(v235, v230)
                    let v237 = scenario_final_229(v164, v165, v166, v167, v168, v169, v231, v236)
                    let v238 = spiral_fs_write_file(v170, v234)
                    let v239 = spiral_fs_coerce(v238)
                    let v240 = atom.create(v20)
                    let v241 = v239 == v240
                    let v242 = v241 == False
                    case v242 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                    let v243 = spiral_fs_write_file(v171, v237)
                    let v244 = spiral_fs_coerce(v243)
                    let v245 = atom.create(v20)
                    let v246 = v244 == v245
                    let v247 = v246 == False
                    case v247 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                    let v248 = erlang_term_coerce(v162)
                    let v249 = "filename"
                    let v250 = atom.create(v249)
                    let v251 = "basename"
                    let v252 = atom.create(v251)
                    let v253 = []
                    let v254 = [v248, ..v253]
                    let v255 = erlang_term_apply(v250, v252, v254)
                    let v256 = atom.create(v103)
                    let v257 = atom.create(v105)
                    let v258 = []
                    let v259 = [v255, ..v258]
                    let v260 = erlang_term_apply(v256, v257, v259)
                    let v261 = erlang_term_coerce(v260)
                    let v262 = "xsim.events "
                    let v263 = v262 <> v261 
                    let v264 = " deliveries="
                    let v265 = v263 <> v264 
                    let v266 = v234 == ""
                    let v270 =
                        case v266 {
                            True -> Uh3Nil
                            False -> {
                                let v268 = "\n"
                                split_list_2(v268, v234)
                            }
                        }
                    let v271 = Uh3Nil
                    let v272 = method405(v270, v271)
                    let v273 = 0
                    let v274 = method20(v272, v273)
                    let v275 = spiral_wrap_signed(v274 - 1, 32)
                    let v276 = string.inspect(v275)
                    let v277 = v265 <> v276 
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
        let v297 = method399()
        let v298 = method400(v297, v296)
        case v298 {
            True -> 1
            False -> 0
        }
    }
}

pub fn closure120(capt: Nil) -> fn(String) -> Us84 {
    fn (v0) {
        Us84None
    }
}

pub fn closure119(capt: Nil) -> fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> Us84 {
    fn (dom) {
        let #(_v0, _v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10, _v11, _v12) = dom
        closure120(Nil)
    }
}

pub fn closure123(capt: #(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String, String)) -> fn(String) -> Us85 {
    fn (v14) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13) = capt
        let v15 = v13 == "spi"
        let v21 =
            case v15 {
                True -> Us84Some(v14, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                False -> {
                    let v17 = v13 == "personas"
                    case v17 {
                        True -> Us84Some(v0, v1, v2, v3, v4, v5, v14, v7, v8, v9, v10, v11, v12)
                        False -> Us84None
                    }
                }
            }
        let v22 = v13 == "out"
        let v28 =
            case v22 {
                True -> Us84Some(v0, v14, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                False -> {
                    let v24 = v13 == "expected"
                    case v24 {
                        True -> Us84Some(v0, v1, v14, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                        False -> Us84None
                    }
                }
            }
        let v43 =
            case v21  {
                Us84None -> v28
                Us84Some(v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41) -> v21
            }
        let v44 = v13 == "user-id"
        let v50 =
            case v44 {
                True -> Us84Some(v0, v1, v2, v3, v4, v5, v6, v7, v14, v9, v10, v11, v12)
                False -> {
                    let v46 = v13 == "username"
                    case v46 {
                        True -> Us84Some(v0, v1, v2, v3, v4, v5, v6, v7, v8, v14, v10, v11, v12)
                        False -> Us84None
                    }
                }
            }
        let v51 = v13 == "base-time"
        let v54 =
            case v51 {
                True -> Us84Some(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v14)
                False -> Us84None
            }
        let v69 =
            case v50  {
                Us84None -> v54
                Us84Some(v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67) -> v50
            }
        let v84 =
            case v43  {
                Us84None -> v69
                Us84Some(v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82) -> v43
            }
        case v84  {
            Us84None -> {
                let v99 = count_of_text_10(v14)
                case v99  {
                    Us3None -> {
                        let v155 = "--"
                        let v156 = v155 <> v13 
                        let v157 = " takes a whole number, got '"
                        let v158 = v156 <> v157 
                        let v159 = v158 <> v14 
                        let v160 = "'"
                        let v161 = v159 <> v160 
                        Us85Error(v161)
                    }
                    Us3Some(v100) -> {
                        let v101 = v13 == "cells"
                        let v110 =
                            case v101 {
                                True -> Us84Some(v0, v1, v2, v100, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                                False -> {
                                    let v103 = v13 == "seed"
                                    case v103 {
                                        True -> Us84Some(v0, v1, v2, v3, v100, v5, v6, v7, v8, v9, v10, v11, v12)
                                        False -> {
                                            let v105 = v13 == "edits"
                                            case v105 {
                                                True -> Us84Some(v0, v1, v2, v3, v4, v100, v6, v7, v8, v9, v10, v11, v12)
                                                False -> Us84None
                                            }
                                        }
                                    }
                                }
                            }
                        let v111 = v13 == "id-base"
                        let v120 =
                            case v111 {
                                True -> Us84Some(v0, v1, v2, v3, v4, v5, v6, v100, v8, v9, v10, v11, v12)
                                False -> {
                                    let v113 = v13 == "lost"
                                    case v113 {
                                        True -> Us84Some(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v100, v11, v12)
                                        False -> {
                                            let v115 = v13 == "lost-cells"
                                            case v115 {
                                                True -> Us84Some(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v100, v12)
                                                False -> Us84None
                                            }
                                        }
                                    }
                                }
                            }
                        let v135 =
                            case v110  {
                                Us84None -> v120
                                Us84Some(v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133) -> v110
                            }
                        case v135  {
                            Us84None -> {
                                let v150 = "unknown option --"
                                let v151 = v150 <> v13 
                                Us85Error(v151)
                            }
                            Us84Some(v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148) -> Us85Ok(v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148)
                        }
                    }
                }
            }
            Us84Some(v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97) -> Us85Ok(v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97)
        }
    }
}

pub fn closure122(capt: #(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us85 {
    fn (v13) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12) = capt
        closure123(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13))
    }
}

pub fn closure121(capt: Nil) -> fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us85 {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12) = dom
        closure122(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12))
    }
}

pub fn valued_then_408(v0: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> Us84, v1: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us85, v2: String, v3: String, v4: String, v5: Int, v6: Int, v7: Int, v8: String, v9: Int, v10: String, v11: String, v12: Int, v13: Int, v14: String, v15: String, v16: Uh3) -> Us85 {
    case v16  {
        Uh3Cons(v17, v18) -> {
            let v19 = v1(#(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14))
            let v20 = "--"
            let v21 = v15 |> string.starts_with(v20)
            let v28 =
                case v21 {
                    True -> {
                        let v22 = spiral_string_length(v15)
                        let v23 = spiral_wrap_signed(v22 - 2, 32)
                        let v24 = spiral_wrap_signed(2 + v23, 32)
                        let v25 = spiral_wrap_signed(v24 - 1, 32)
                        let v26 = spiral_string_slice(v15, 2, v25)
                        v26
                    }
                    False -> {
                        let v27 = ""
                        v27
                    }
                }
            let v29 = v19(v28)
            let v30 = v29(v17)
            continued_409(v0, v1, v30, v18)
        }
        Uh3Nil -> {
            let v32 = "--"
            let v33 = v15 |> string.starts_with(v32)
            let v40 =
                case v33 {
                    True -> {
                        let v34 = spiral_string_length(v15)
                        let v35 = spiral_wrap_signed(v34 - 2, 32)
                        let v36 = spiral_wrap_signed(2 + v35, 32)
                        let v37 = spiral_wrap_signed(v36 - 1, 32)
                        let v38 = spiral_string_slice(v15, 2, v37)
                        v38
                    }
                    False -> {
                        let v39 = ""
                        v39
                    }
                }
            let v41 = v32 <> v40 
            let v42 = " needs a value"
            let v43 = v41 <> v42 
            Us85Error(v43)
        }
    }
}

pub fn arg_parsed_407(v0: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> Us84, v1: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us85, v2: String, v3: String, v4: String, v5: Int, v6: Int, v7: Int, v8: String, v9: Int, v10: String, v11: String, v12: Int, v13: Int, v14: String, v15: String, v16: Uh3) -> Us85 {
    let v17 = v0(#(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14))
    let v18 = "--"
    let v19 = v15 |> string.starts_with(v18)
    let v26 =
        case v19 {
            True -> {
                let v20 = spiral_string_length(v15)
                let v21 = spiral_wrap_signed(v20 - 2, 32)
                let v22 = spiral_wrap_signed(2 + v21, 32)
                let v23 = spiral_wrap_signed(v22 - 1, 32)
                let v24 = spiral_string_slice(v15, 2, v23)
                v24
            }
            False -> {
                let v25 = ""
                v25
            }
        }
    let v27 = v17(v26)
    case v27  {
        Us84None -> valued_then_408(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
        Us84Some(v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40) -> flags_parsed_406(v0, v1, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v16)
    }
}

pub fn flags_parsed_406(v0: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> Us84, v1: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us85, v2: String, v3: String, v4: String, v5: Int, v6: Int, v7: Int, v8: String, v9: Int, v10: String, v11: String, v12: Int, v13: Int, v14: String, v15: Uh3) -> Us85 {
    case v15  {
        Uh3Cons(v17, v18) -> {
            let v19 = "--"
            let v20 = v17 |> string.starts_with(v19)
            let v27 =
                case v20 {
                    True -> {
                        let v21 = spiral_string_length(v17)
                        let v22 = spiral_wrap_signed(v21 - 2, 32)
                        let v23 = spiral_wrap_signed(2 + v22, 32)
                        let v24 = spiral_wrap_signed(v23 - 1, 32)
                        let v25 = spiral_string_slice(v17, 2, v24)
                        v25
                    }
                    False -> {
                        let v26 = ""
                        v26
                    }
                }
            let v28 = v27 == ""
            case v28 {
                True -> {
                    let v29 = "unexpected argument '"
                    let v30 = v29 <> v17 
                    let v31 = "'"
                    let v32 = v30 <> v31 
                    Us85Error(v32)
                }
                False -> arg_parsed_407(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v17, v18)
            }
        }
        Uh3Nil -> Us85Ok(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    }
}

pub fn continued_409(v0: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> Us84, v1: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us85, v2: Us85, v3: Uh3) -> Us85 {
    case v2  {
        Us85Error(v18) -> Us85Error(v18)
        Us85Ok(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16) -> flags_parsed_406(v0, v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v3)
    }
}
