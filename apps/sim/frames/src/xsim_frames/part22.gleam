import gleam/bit_array
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Us88, type Us89, Uh29Nil, Uh3Cons, Uh3Nil, Us3None, Us3Some, Us56Error, Us56Ok, Us80Error, Us80Ok, Us85Error, Us85Ok, Us88None, Us88Some, Us89Error, Us89Ok}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, spiral_fs_coerce, spiral_fs_read_file, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part10.{method258, method259}
import xsim_frames/part13.{items_from_301}
import xsim_frames/part18.{method370, method371}
import xsim_frames/part2.{delimited_21, method20, taken_31}
import xsim_frames/part20.{method396, method400, method401, method402, method403}
import xsim_frames/part21.{closure111, closure113, flags_parsed_404, method408}
import xsim_frames/part6.{closure16}
import xsim_frames/part9.{scenario_final_228, scenario_stream_227}

pub fn closure110(capt: Nil) -> fn(String) -> Int {
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
        let v107 = closure111(Nil)
        let v108 = closure113(Nil)
        let v109 = ""
        let v110 = -1
        let v111 = 1
        let v112 = 3
        let v113 = 1
        let v114 = 200
        let v115 = False
        let v116 = flags_parsed_404(v107, v108, v109, v110, v111, v112, v113, v109, v114, v115, v109, v109, v106)
        let v147 =
            case v116  {
                Us85Ok(v117, v118, v119, v120, v121, v122, v123, v124, v125, v126) -> {
                    let v127 = v117 == ""
                    let v135 =
                        case v127 {
                            True -> {
                                let v128 = "missing --spi"
                                v128
                            }
                            False -> {
                                let v129 = v125 == ""
                                case v129 {
                                    True -> {
                                        let v130 = "missing --out"
                                        v130
                                    }
                                    False -> {
                                        let v131 = v126 == ""
                                        case v131 {
                                            True -> {
                                                let v132 = "missing --expected"
                                                v132
                                            }
                                            False -> v109
                                        }
                                    }
                                }
                            }
                        }
                    let v136 = v135 != ""
                    case v136 {
                        True -> {
                            let v144 =
                                case v127 {
                                    True -> {
                                        let v137 = "missing --spi"
                                        v137
                                    }
                                    False -> {
                                        let v138 = v125 == ""
                                        case v138 {
                                            True -> {
                                                let v139 = "missing --out"
                                                v139
                                            }
                                            False -> {
                                                let v140 = v126 == ""
                                                case v140 {
                                                    True -> {
                                                        let v141 = "missing --expected"
                                                        v141
                                                    }
                                                    False -> v109
                                                }
                                            }
                                        }
                                    }
                                }
                            Us85Error(v144)
                        }
                        False -> v116
                    }
                }
                _ -> v116
            }
        let v271 =
            case v147  {
                Us85Error(v267) -> {
                    let v268 = "XSIM rejected events: "
                    let v269 = v268 <> v267 
                    v269
                }
                Us85Ok(v148, v149, v150, v151, v152, v153, v154, v155, v156, v157) -> {
                    let v158 = spiral_fs_read_file(v148)
                    let v159 = method370()
                    let v160 = method371()
                    let v161 = case v158 { Ok(x) -> v159(x) Error(x) -> v160(x) }
                    let v174 =
                        case v161  {
                            Us80Error(v171) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us80Ok(v162) -> {
                                let v163 = bit_array.to_string(v162)
                                let v164 = method258()
                                let v165 = method259()
                                let v166 = case v163 { Ok(x) -> v164(x) Error(x) -> v165(x) }
                                case v166  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v167) -> v167
                                }
                            }
                        }
                    let v175 = erlang_term_coerce(v174)
                    let v176 = erlang_term_coerce(v109)
                    let v177 = "Elixir.Spiral.Cells.Document"
                    let v178 = atom.create(v177)
                    let v179 = "parse_spi"
                    let v180 = atom.create(v179)
                    let v181 = []
                    let v182 = [v176, ..v181]
                    let v183 = [v175, ..v182]
                    let v184 = erlang_term_apply(v178, v180, v183)
                    let v185 = []
                    let v186 = erlang_term_coerce(v185)
                    let v187 = "cells"
                    let v188 = atom.create(v187)
                    let v189 = erlang_term_coerce(v188)
                    let v190 = erlang_term_coerce(v189)
                    let v191 = erlang_term_coerce(v186)
                    let v192 = "maps"
                    let v193 = atom.create(v192)
                    let v194 = "get"
                    let v195 = atom.create(v194)
                    let v196 = []
                    let v197 = [v191, ..v196]
                    let v198 = [v184, ..v197]
                    let v199 = [v190, ..v198]
                    let v200 = erlang_term_apply(v193, v195, v199)
                    let v201 = erlang_term_coerce(v200)
                    let v202 = atom.create(v91)
                    let v203 = atom.create(v93)
                    let v204 = []
                    let v205 = [v201, ..v204]
                    let v206 = erlang_term_apply(v202, v203, v205)
                    let v207 = Uh29Nil
                    let v208 = items_from_301(v206, v207)
                    let v209 = Uh29Nil
                    let v210 = method400(v208, v209)
                    let v211 = Uh3Nil
                    let v212 = method401(v210, v211)
                    let v213 = v149 < 0
                    let v215 =
                        case v213 {
                            True -> v212
                            False -> taken_31(v149, v212)
                        }
                    let v216 = unicode_erlang_characters_to_binary([0])
                    let v217 = delimited_21(v216, v215)
                    let v218 = closure16(Nil)
                    let v219 = unicode_erlang_characters_to_binary([0])
                    let v220 = split_list_2(v219, v217)
                    let v221 = scenario_stream_227(v150, v151, v152, v153, v154, v155, v218, v220)
                    let v222 = unicode_erlang_characters_to_binary([0])
                    let v223 = split_list_2(v222, v217)
                    let v224 = scenario_final_228(v150, v151, v152, v153, v154, v155, v218, v223)
                    let v225 = spiral_fs_write_file(v156, v221)
                    let v226 = spiral_fs_coerce(v225)
                    let v227 = atom.create(v20)
                    let v228 = v226 == v227
                    let v229 = v228 == False
                    case v229 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                    let v230 = spiral_fs_write_file(v157, v224)
                    let v231 = spiral_fs_coerce(v230)
                    let v232 = atom.create(v20)
                    let v233 = v231 == v232
                    let v234 = v233 == False
                    case v234 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                    let v235 = erlang_term_coerce(v148)
                    let v236 = "filename"
                    let v237 = atom.create(v236)
                    let v238 = "basename"
                    let v239 = atom.create(v238)
                    let v240 = []
                    let v241 = [v235, ..v240]
                    let v242 = erlang_term_apply(v237, v239, v241)
                    let v243 = "unicode"
                    let v244 = atom.create(v243)
                    let v245 = "characters_to_binary"
                    let v246 = atom.create(v245)
                    let v247 = []
                    let v248 = [v242, ..v247]
                    let v249 = erlang_term_apply(v244, v246, v248)
                    let v250 = erlang_term_coerce(v249)
                    let v251 = "xsim.events "
                    let v252 = v251 <> v250 
                    let v253 = " deliveries="
                    let v254 = v252 <> v253 
                    let v255 = v221 == ""
                    let v259 =
                        case v255 {
                            True -> Uh3Nil
                            False -> {
                                let v257 = "\n"
                                split_list_2(v257, v221)
                            }
                        }
                    let v260 = Uh3Nil
                    let v261 = method408(v259, v260)
                    let v262 = 0
                    let v263 = method20(v261, v262)
                    let v264 = spiral_wrap_signed(v263 - 1, 32)
                    let v265 = int.to_string(v264)
                    let v266 = v254 <> v265 
                    v266
                }
            }
        let v272 = "\n"
        let v273 = v271 <> v272 
        let v274 = erlang_term_coerce(v273)
        let v275 = "io"
        let v276 = atom.create(v275)
        let v277 = "put_chars"
        let v278 = atom.create(v277)
        let v279 = []
        let v280 = [v274, ..v279]
        let _v281 = erlang_term_apply(v276, v278, v280)
        let v282 = v271 == ""
        let v285 =
            case v282 {
                True -> Uh3Nil
                False -> split_list_2(v272, v271)
            }
        let v286 = method402()
        let v287 = method403(v286, v285)
        case v287 {
            True -> 1
            False -> 0
        }
    }
}

pub fn closure118(capt: Nil) -> fn(String) -> Us88 {
    fn (v0) {
        Us88None
    }
}

pub fn closure117(capt: Nil) -> fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> Us88 {
    fn (dom) {
        let #(_v0, _v1, _v2, _v3, _v4, _v5, _v6, _v7, _v8, _v9, _v10, _v11, _v12) = dom
        closure118(Nil)
    }
}

pub fn closure121(capt: #(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String, String)) -> fn(String) -> Us89 {
    fn (v14) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13) = capt
        let v15 = v13 == "spi"
        let v21 =
            case v15 {
                True -> Us88Some(v14, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                False -> {
                    let v17 = v13 == "personas"
                    case v17 {
                        True -> Us88Some(v0, v1, v2, v3, v4, v5, v14, v7, v8, v9, v10, v11, v12)
                        False -> Us88None
                    }
                }
            }
        let v22 = v13 == "out"
        let v28 =
            case v22 {
                True -> Us88Some(v0, v14, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                False -> {
                    let v24 = v13 == "expected"
                    case v24 {
                        True -> Us88Some(v0, v1, v14, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                        False -> Us88None
                    }
                }
            }
        let v43 =
            case v21  {
                Us88None -> v28
                Us88Some(v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41) -> v21
            }
        let v44 = v13 == "user-id"
        let v50 =
            case v44 {
                True -> Us88Some(v0, v1, v2, v3, v4, v5, v6, v7, v14, v9, v10, v11, v12)
                False -> {
                    let v46 = v13 == "username"
                    case v46 {
                        True -> Us88Some(v0, v1, v2, v3, v4, v5, v6, v7, v8, v14, v10, v11, v12)
                        False -> Us88None
                    }
                }
            }
        let v51 = v13 == "base-time"
        let v54 =
            case v51 {
                True -> Us88Some(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v14)
                False -> Us88None
            }
        let v69 =
            case v50  {
                Us88None -> v54
                Us88Some(v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67) -> v50
            }
        let v84 =
            case v43  {
                Us88None -> v69
                Us88Some(v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82) -> v43
            }
        case v84  {
            Us88None -> {
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
                        Us89Error(v161)
                    }
                    Us3Some(v100) -> {
                        let v101 = v13 == "cells"
                        let v110 =
                            case v101 {
                                True -> Us88Some(v0, v1, v2, v100, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                                False -> {
                                    let v103 = v13 == "seed"
                                    case v103 {
                                        True -> Us88Some(v0, v1, v2, v3, v100, v5, v6, v7, v8, v9, v10, v11, v12)
                                        False -> {
                                            let v105 = v13 == "edits"
                                            case v105 {
                                                True -> Us88Some(v0, v1, v2, v3, v4, v100, v6, v7, v8, v9, v10, v11, v12)
                                                False -> Us88None
                                            }
                                        }
                                    }
                                }
                            }
                        let v111 = v13 == "id-base"
                        let v120 =
                            case v111 {
                                True -> Us88Some(v0, v1, v2, v3, v4, v5, v6, v100, v8, v9, v10, v11, v12)
                                False -> {
                                    let v113 = v13 == "lost"
                                    case v113 {
                                        True -> Us88Some(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v100, v11, v12)
                                        False -> {
                                            let v115 = v13 == "lost-cells"
                                            case v115 {
                                                True -> Us88Some(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v100, v12)
                                                False -> Us88None
                                            }
                                        }
                                    }
                                }
                            }
                        let v135 =
                            case v110  {
                                Us88None -> v120
                                Us88Some(v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133) -> v110
                            }
                        case v135  {
                            Us88None -> {
                                let v150 = "unknown option --"
                                let v151 = v150 <> v13 
                                Us89Error(v151)
                            }
                            Us88Some(v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148) -> Us89Ok(v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148)
                        }
                    }
                }
            }
            Us88Some(v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97) -> Us89Ok(v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97)
        }
    }
}

pub fn closure120(capt: #(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us89 {
    fn (v13) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12) = capt
        closure121(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13))
    }
}

pub fn closure119(capt: Nil) -> fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us89 {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12) = dom
        closure120(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12))
    }
}

pub fn valued_then_411(v0: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> Us88, v1: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us89, v2: String, v3: String, v4: String, v5: Int, v6: Int, v7: Int, v8: String, v9: Int, v10: String, v11: String, v12: Int, v13: Int, v14: String, v15: String, v16: Uh3) -> Us89 {
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
            continued_412(v0, v1, v30, v18)
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
            Us89Error(v43)
        }
    }
}

pub fn arg_parsed_410(v0: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> Us88, v1: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us89, v2: String, v3: String, v4: String, v5: Int, v6: Int, v7: Int, v8: String, v9: Int, v10: String, v11: String, v12: Int, v13: Int, v14: String, v15: String, v16: Uh3) -> Us89 {
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
        Us88None -> valued_then_411(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
        Us88Some(v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40) -> flags_parsed_409(v0, v1, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v16)
    }
}

pub fn flags_parsed_409(v0: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> Us88, v1: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us89, v2: String, v3: String, v4: String, v5: Int, v6: Int, v7: Int, v8: String, v9: Int, v10: String, v11: String, v12: Int, v13: Int, v14: String, v15: Uh3) -> Us89 {
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
                    Us89Error(v32)
                }
                False -> arg_parsed_410(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v17, v18)
            }
        }
        Uh3Nil -> Us89Ok(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    }
}

pub fn continued_412(v0: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> Us88, v1: fn(#(String, String, String, Int, Int, Int, String, Int, String, String, Int, Int, String)) -> fn(String) -> fn(String) -> Us89, v2: Us89, v3: Uh3) -> Us89 {
    case v2  {
        Us89Error(v18) -> Us89Error(v18)
        Us89Ok(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16) -> flags_parsed_409(v0, v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v3)
    }
}
