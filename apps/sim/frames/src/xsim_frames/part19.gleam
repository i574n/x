import gleam/bit_array
import gleam/erlang/atom
import gleam/int
import gleam/otp/actor
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh13, type Us86, type Us87, Uh13Cons, Uh13Nil, Uh29Nil, Uh3Cons, Uh3Nil, Uh8Nil, Us29CellsExecutor, Us29FakeExecutor, Us29LeakingExecutor, Us30NoEviction, Us33Error, Us33Ok, Us34None, Us34Some, Us36RunParsed, Us36RunRejected, Us56Error, Us56Ok, Us69None, Us69Some, Us70Tick, Us78None, Us78Some, Us80Error, Us80Ok, Us84None, Us84Some, Us85Replied, Us85Unreachable, Us86Finished, Us86Step, Us87None, Us87Some}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_fs_coerce, spiral_fs_read_file, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part11.{closure39}
import xsim_frames/part12.{closure69, closure70, closure71, closure73, closure74, closure76, closure77, closure78, items_from_301}
import xsim_frames/part13.{closure79, closure82, closure84}
import xsim_frames/part14.{closure85, closure87, closure88, closure89, closure90}
import xsim_frames/part16.{method370, method371}
import xsim_frames/part17.{simulated_by_308}
import xsim_frames/part18.{get_environment_variable_404, method396, method397, method398, method406, session_403}
import xsim_frames/part2.{concat_balanced_22, delimited_21, method20}
import xsim_frames/part3.{method56, method57}
import xsim_frames/part5.{controls_from_120}
import xsim_frames/part8.{closure30}
import xsim_frames/part9.{closure32, closure35, closure36, closure37, flags_parsed_235, method258, method259, quiet_c38}

pub fn posted_one_408(v0: String, v1: String, v2: String, v3: String, v4: Us86) -> Int {
    let v6 = erlang_term_coerce("authorization")
    let v7 = "unicode"
    let v8 = atom.create(v7)
    let v9 = "characters_to_list"
    let v10 = atom.create(v9)
    let v11 = []
    let v12 = [v6, ..v11]
    let v13 = erlang_term_apply(v8, v10, v12)
    let v14 = erlang_term_coerce(v1)
    let v15 = atom.create(v7)
    let v16 = atom.create(v9)
    let v17 = []
    let v18 = [v14, ..v17]
    let v19 = erlang_term_apply(v15, v16, v18)
    let v20 = []
    let v21 = [v19, ..v20]
    let v22 = [v13, ..v21]
    let v23 = erlang_term_tuple(v22)
    let v24 = { v0 } <> { "/streams/x/topics/run-progress/messages" }
    let v31 =
        case v4  {
            Us86Finished(v27, v28) -> {
                "finished"
            }
            Us86Step(v25) -> {
                "step"
            }
        }
    let v32 = "\\"
    let v33 = "\\\\"
    let v34 = v3 |> string.replace(v32, v33)
    let v35 = "\""
    let v36 = "\\\""
    let v37 = v34 |> string.replace(v35, v36)
    let v39 = controls_from_120(0, v37)
    let v40 = ""
    let v42 = Uh3Cons(v35, Uh3Nil)
    let v43 = Uh3Cons(v39, v42)
    let v44 = Uh3Cons(v35, v43)
    let v45 = concat_balanced_22(v40, v44)
    let v46 = { "{\"run\":" } <> { v45 }
    let v47 = { v46 } <> { "," }
    let v48 = { v47 } <> { "\"kind\":" }
    let v49 = v31 |> string.replace(v32, v33)
    let v50 = v49 |> string.replace(v35, v36)
    let v52 = controls_from_120(0, v50)
    let v54 = Uh3Cons(v35, Uh3Nil)
    let v55 = Uh3Cons(v52, v54)
    let v56 = Uh3Cons(v35, v55)
    let v57 = concat_balanced_22(v40, v56)
    let v58 = { v48 } <> { v57 }
    let v80 =
        case v4  {
            Us86Finished(v71, v72) -> {
                let v73 = int.to_string(v71)
                let v74 = { ",\"steps\":" } <> { v73 }
                let v75 = { v74 } <> { ",\"failures\":" }
                let v76 = int.to_string(v72)
                let v77 = { v75 } <> { v76 }
                let v78 = { v77 } <> { "}" }
                v78
            }
            Us86Step(v59) -> {
                let v60 = v59 |> string.replace(v32, v33)
                let v61 = v60 |> string.replace(v35, v36)
                let v63 = controls_from_120(0, v61)
                let v65 = Uh3Cons(v35, Uh3Nil)
                let v66 = Uh3Cons(v63, v65)
                let v67 = Uh3Cons(v35, v66)
                let v68 = concat_balanced_22(v40, v67)
                let v69 = { ",\"line\":" } <> { v68 }
                let v70 = { v69 } <> { "}" }
                v70
            }
        }
    let v81 = { v58 } <> { v80 }
    let v82 = erlang_term_coerce(v81)
    let v84 = atom.create("base64")
    let v86 = atom.create("encode")
    let v87 = []
    let v88 = [v82, ..v87]
    let v89 = erlang_term_apply(v84, v86, v88)
    let v90 = erlang_term_coerce(v89)
    let v91 = v90 |> string.replace(v32, v33)
    let v92 = v91 |> string.replace(v35, v36)
    let v94 = controls_from_120(0, v92)
    let v96 = Uh3Cons(v35, Uh3Nil)
    let v97 = Uh3Cons(v94, v96)
    let v98 = Uh3Cons(v35, v97)
    let v99 = concat_balanced_22(v40, v98)
    let v100 = { "{\"partitioning\":{\"kind\":\"partition_id\",\"value\":\"AAAAAA==\"},\"messages\":[{\"id\":0,\"payload\":" } <> { v99 }
    let v101 = { v100 } <> { "}]}" }
    let v103 = atom.create("inets")
    let v104 = erlang_term_coerce(v103)
    let v105 = "application"
    let v106 = atom.create(v105)
    let v107 = "ensure_all_started"
    let v108 = atom.create(v107)
    let v109 = []
    let v110 = [v104, ..v109]
    let _v111 = erlang_term_apply(v106, v108, v110)
    let v112 = "ssl"
    let v113 = atom.create(v112)
    let v114 = erlang_term_coerce(v113)
    let v115 = atom.create(v105)
    let v116 = atom.create(v107)
    let v117 = []
    let v118 = [v114, ..v117]
    let _v119 = erlang_term_apply(v115, v116, v118)
    let v121 = erlang_term_coerce("application/json")
    let v122 = atom.create(v7)
    let v123 = atom.create(v9)
    let v124 = []
    let v125 = [v121, ..v124]
    let v126 = erlang_term_apply(v122, v123, v125)
    let v127 = erlang_term_coerce(v24)
    let v128 = atom.create(v7)
    let v129 = atom.create(v9)
    let v130 = []
    let v131 = [v127, ..v130]
    let v132 = erlang_term_apply(v128, v129, v131)
    let v133 = []
    let v134 = [v23, ..v133]
    let v135 = erlang_term_coerce(v134)
    let v136 = erlang_term_coerce(v101)
    let v137 = []
    let v138 = [v136, ..v137]
    let v139 = [v126, ..v138]
    let v140 = [v135, ..v139]
    let v141 = [v132, ..v140]
    let v142 = erlang_term_tuple(v141)
    let v144 = atom.create("post")
    let v145 = erlang_term_coerce(v144)
    let v146 = erlang_term_coerce(10000)
    let v148 = atom.create("timeout")
    let v149 = erlang_term_coerce(v148)
    let v150 = []
    let v151 = [v146, ..v150]
    let v152 = [v149, ..v151]
    let v153 = erlang_term_tuple(v152)
    let v154 = v2 == ""
    let v195 =
        case v154 {
            True -> {
                let v155 = []
                let v156 = [v153, ..v155]
                erlang_term_coerce(v156)
            }
            False -> {
                let v159 = atom.create("verify")
                let v160 = erlang_term_coerce(v159)
                let v162 = atom.create("verify_peer")
                let v163 = erlang_term_coerce(v162)
                let v164 = []
                let v165 = [v163, ..v164]
                let v166 = [v160, ..v165]
                let v167 = erlang_term_tuple(v166)
                let v169 = atom.create("cacertfile")
                let v170 = erlang_term_coerce(v169)
                let v171 = erlang_term_coerce(v2)
                let v172 = atom.create(v7)
                let v173 = atom.create(v9)
                let v174 = []
                let v175 = [v171, ..v174]
                let v176 = erlang_term_apply(v172, v173, v175)
                let v177 = []
                let v178 = [v176, ..v177]
                let v179 = [v170, ..v178]
                let v180 = erlang_term_tuple(v179)
                let v181 = []
                let v182 = [v180, ..v181]
                let v183 = [v167, ..v182]
                let v184 = erlang_term_coerce(v183)
                let v185 = atom.create(v112)
                let v186 = erlang_term_coerce(v185)
                let v187 = []
                let v188 = [v184, ..v187]
                let v189 = [v186, ..v188]
                let v190 = erlang_term_tuple(v189)
                let v191 = []
                let v192 = [v190, ..v191]
                let v193 = [v153, ..v192]
                erlang_term_coerce(v193)
            }
        }
    let v197 = atom.create("body_format")
    let v198 = erlang_term_coerce(v197)
    let v200 = atom.create("binary")
    let v201 = erlang_term_coerce(v200)
    let v202 = []
    let v203 = [v201, ..v202]
    let v204 = [v198, ..v203]
    let v205 = erlang_term_tuple(v204)
    let v206 = []
    let v207 = [v205, ..v206]
    let v208 = erlang_term_coerce(v207)
    let v210 = atom.create("httpc")
    let v212 = atom.create("request")
    let v213 = []
    let v214 = [v208, ..v213]
    let v215 = [v195, ..v214]
    let v216 = [v142, ..v215]
    let v217 = [v145, ..v216]
    let v218 = erlang_term_apply(v210, v212, v217)
    let v219 = "erlang"
    let v220 = atom.create(v219)
    let v222 = atom.create("is_tuple")
    let v223 = []
    let v224 = [v218, ..v223]
    let v225 = erlang_term_apply(v220, v222, v224)
    let v226 = erlang_term_coerce(v225)
    let v239 =
        case v226 {
            True -> {
                let v227 = erlang_term_coerce(1)
                let v228 = atom.create(v219)
                let v230 = atom.create("element")
                let v231 = []
                let v232 = [v218, ..v231]
                let v233 = [v227, ..v232]
                let v234 = erlang_term_apply(v228, v230, v233)
                let v236 = atom.create("ok")
                let v237 = erlang_term_coerce(v236)
                v234 == v237
            }
            False -> False
        }
    let v274 =
        case v239 {
            True -> {
                let v240 = erlang_term_coerce(2)
                let v241 = atom.create(v219)
                let v242 = "element"
                let v243 = atom.create(v242)
                let v244 = []
                let v245 = [v218, ..v244]
                let v246 = [v240, ..v245]
                let v247 = erlang_term_apply(v241, v243, v246)
                let v248 = erlang_term_coerce(1)
                let v249 = atom.create(v219)
                let v250 = atom.create(v242)
                let v251 = []
                let v252 = [v247, ..v251]
                let v253 = [v248, ..v252]
                let v254 = erlang_term_apply(v249, v250, v253)
                let v255 = erlang_term_coerce(2)
                let v256 = atom.create(v219)
                let v257 = atom.create(v242)
                let v258 = []
                let v259 = [v254, ..v258]
                let v260 = [v255, ..v259]
                let v261 = erlang_term_apply(v256, v257, v260)
                let v262 = erlang_term_coerce(v261)
                let v263 = erlang_term_coerce(3)
                let v264 = atom.create(v219)
                let v265 = atom.create(v242)
                let v266 = []
                let v267 = [v247, ..v266]
                let v268 = [v263, ..v267]
                let v269 = erlang_term_apply(v264, v265, v268)
                let v270 = erlang_term_coerce(v269)
                Us85Replied(v262, v270)
            }
            False -> {
                let v272 = string.inspect(v218)
                Us85Unreachable(v272)
            }
        }
    case v274  {
        Us85Replied(v275, v276) -> v275
        Us85Unreachable(v277) -> 0
    }
}

pub fn method407(v0: String, v1: String, v2: String, v3: String, v4: Uh3, v5: Uh13) -> Uh13 {
    case v4  {
        Uh3Cons(v6, v7) -> {
            let v8 = method407(v0, v1, v2, v3, v7, v5)
            let v9 = Us86Step(v6)
            let v10 = posted_one_408(v0, v1, v2, v3, v9)
            Uh13Cons(v10, v8)
        }
        Uh3Nil -> v5
    }
}

pub fn posted_all_405(v0: String, v1: String, v2: String, v3: String, v4: String) -> Nil {
    let v5 = v4 == ""
    let v9 =
        case v5 {
            True -> Uh3Nil
            False -> {
                split_list_2("\n", v4)
            }
        }
    let v11 = method406(v9, Uh3Nil)
    let _v13 = method407(v0, v1, v2, v3, v11, Uh13Nil)
    let v15 = method20(v11, 0)
    let v17 = v4 |> string.contains(" result=pass")
    let v18 =
        case v17 {
            True -> 0
            False -> 1
        }
    let v19 = Us86Finished(v15, v18)
    let _v20 = posted_one_408(v0, v1, v2, v3, v19)
    Nil
}

pub fn posted_when_signed_in_402(v0: String) -> Nil {
    let v1 = session_403()
    case v1  {
        Us84None -> Nil
        Us84Some(v2, v3, v4) -> {
            let v6 = get_environment_variable_404("XSIM_RUN_ID")
            let v7 = spiral_string_length(v6)
            let v9 = method56(v6, v7, 0)
            let v10 = spiral_wrap_signed(v7 - 1, 32)
            let v11 = spiral_string_slice(v6, v9, v10)
            let v12 = spiral_string_length(v11)
            let v13 = method57(v11, v12)
            let v14 = spiral_string_slice(v11, 0, v13)
            let v15 = v14 == ""
            let v17 =
                case v15 {
                    True -> {
                        "xsim"
                    }
                    False -> v14
                }
            posted_all_405(v2, v3, v4, v17, v0)
        }
    }
}

pub fn closure109(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v2 = v0 |> string.starts_with("XSIM rejected")
        case v2 {
            True -> True
            False -> {
                v0 |> string.ends_with("result=fail")
            }
        }
    }
}

pub fn method409() -> fn(String) -> Bool {
    closure109(Nil)
}

pub fn method410(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method409()
                    method410(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn closure108(capt: Nil) -> fn(String) -> Int {
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
        let v82 = atom.create("lists")
        let v84 = atom.create("reverse")
        let v85 = []
        let v86 = [v80, ..v85]
        let v87 = erlang_term_apply(v82, v84, v86)
        let v89 = items_from_301(v87, Uh29Nil)
        let v91 = method396(v89, Uh3Nil)
        let v92 = closure30(Nil)
        let v93 = closure32(Nil)
        let v95 = ""
        let v111 = flags_parsed_235(v92, v93, Uh3Nil, v95, -1, 0, 0, v95, False, 1, 8, 3, 2, 100, v95, v95, Us29FakeExecutor, 4, Us30NoEviction, 0, False, False, v91)
        let v144 =
            case v111  {
                Us33Error(v141) -> Us36RunRejected(v141)
                Us33Ok(v112, v113, v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131) -> {
                    let v133 = method20(v112, 0)
                    let v134 = v133 == 0
                    let v136 =
                        case v134 {
                            True -> {
                                v113 == ""
                            }
                            False -> False
                        }
                    case v136 {
                        True -> {
                            Us36RunRejected("missing --spi or --spi-file")
                        }
                        False -> Us36RunParsed(v112, v113, v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131)
                    }
                }
            }
        let v169 =
            case v144  {
                Us36RunParsed(v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164) -> Us34Some(v145, v146, v147, v148, v149, v150, v151)
                Us36RunRejected(v166) -> Us34None
            }
        let #(v248, v249) =
            case v169  {
                Us34None -> {
                    #(Uh8Nil, ".")
                }
                Us34Some(v170, v171, v172, v173, v174, v175, v176) -> {
                    let v177 = v171 == ""
                    let v204 =
                        case v177 {
                            True -> v170
                            False -> {
                                let v178 = spiral_fs_read_file(v171)
                                let v179 = method370()
                                let v180 = method371()
                                let v181 = case v178 { Ok(x) -> v179(x) Error(x) -> v180(x) }
                                let v194 =
                                    case v181  {
                                        Us80Error(v191) -> panic as "file_system.read_all_text: file:read_file failed"
                                        Us80Ok(v182) -> {
                                            let v183 = bit_array.to_string(v182)
                                            let v184 = method258()
                                            let v185 = method259()
                                            let v186 = case v183 { Ok(x) -> v184(x) Error(x) -> v185(x) }
                                            case v186  {
                                                Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                                Us56Ok(v187) -> v187
                                            }
                                        }
                                    }
                                let v196 = "\n"
                                let v197 = v194 |> string.replace("\r\n", v196)
                                let v198 = v197 == ""
                                let v201 =
                                    case v198 {
                                        True -> Uh3Nil
                                        False -> split_list_2(v196, v197)
                                    }
                                method397(v201, Uh3Nil)
                            }
                        }
                    case v204  {
                        Uh3Cons(v205, v206) -> {
                            let v208 = method398(v172, v204, Uh8Nil)
                            let v209 = erlang_term_coerce(v205)
                            let v210 = "filename"
                            let v211 = atom.create(v210)
                            let v213 = atom.create("absname")
                            let v214 = []
                            let v215 = [v209, ..v214]
                            let v216 = erlang_term_apply(v211, v213, v215)
                            let v217 = "unicode"
                            let v218 = atom.create(v217)
                            let v219 = "characters_to_binary"
                            let v220 = atom.create(v219)
                            let v221 = []
                            let v222 = [v216, ..v221]
                            let v223 = erlang_term_apply(v218, v220, v222)
                            let v224 = erlang_term_coerce(v223)
                            let v225 = erlang_term_coerce(v224)
                            let v226 = atom.create(v210)
                            let v228 = atom.create("dirname")
                            let v229 = []
                            let v230 = [v225, ..v229]
                            let v231 = erlang_term_apply(v226, v228, v230)
                            let v232 = atom.create(v217)
                            let v233 = atom.create(v219)
                            let v234 = []
                            let v235 = [v231, ..v234]
                            let v236 = erlang_term_apply(v232, v233, v235)
                            let v237 = erlang_term_coerce(v236)
                            #(v208, v237)
                        }
                        Uh3Nil -> {
                            #(Uh8Nil, ".")
                        }
                    }
                }
            }
        let v251 = atom.create("atomics")
        let v252 = erlang_term_coerce(v251)
        let v253 = []
        let v254 = [v252, ..v253]
        let v255 = erlang_term_coerce(v254)
        let v256 = erlang_term_coerce(2)
        let v258 = atom.create("counters")
        let v260 = atom.create("new")
        let v261 = []
        let v262 = [v255, ..v261]
        let v263 = [v256, ..v262]
        let v264 = erlang_term_apply(v258, v260, v263)
        let v281 = flags_parsed_235(v92, v93, Uh3Nil, v95, -1, 0, 0, v95, False, 1, 8, 3, 2, 100, v95, v95, Us29FakeExecutor, 4, Us30NoEviction, 0, False, False, v91)
        let v314 =
            case v281  {
                Us33Error(v311) -> Us36RunRejected(v311)
                Us33Ok(v282, v283, v284, v285, v286, v287, v288, v289, v290, v291, v292, v293, v294, v295, v296, v297, v298, v299, v300, v301) -> {
                    let v303 = method20(v282, 0)
                    let v304 = v303 == 0
                    let v306 =
                        case v304 {
                            True -> {
                                v283 == ""
                            }
                            False -> False
                        }
                    case v306 {
                        True -> {
                            Us36RunRejected("missing --spi or --spi-file")
                        }
                        False -> Us36RunParsed(v282, v283, v284, v285, v286, v287, v288, v289, v290, v291, v292, v293, v294, v295, v296, v297, v298, v299, v300, v301)
                    }
                }
            }
        let v488 =
            case v314  {
                Us36RunParsed(v315, v316, v317, v318, v319, v320, v321, v322, v323, v324, v325, v326, v327, v328, v329, v330, v331, v332, v333, v334) -> {
                    let #(v389, v390, v391, _v392, _v393, _v394, v395) =
                        case v329  {
                            Us29FakeExecutor -> {
                                let v335 = closure35(Nil)
                                let v336 = closure36(Nil)
                                let v337 = closure37(Nil)
                                let v338 = quiet_c38(Nil)
                                let v339 = closure39(Nil)
                                #(v335, v336, False, v337, v338, v338, v339)
                            }
                            _ -> {
                                let #(v382, v383, v384, v385, v386, v387, v388) =
                                    case v329  {
                                        Us29CellsExecutor -> {
                                            let v340 = closure69(#(v249, v333, v264))
                                            let v341 = closure70(#(v249))
                                            let v342 = closure37(Nil)
                                            let v343 = quiet_c38(Nil)
                                            let v344 = closure39(Nil)
                                            #(v340, v341, True, v342, v343, v343, v344)
                                        }
                                        _ -> {
                                            let #(v375, v376, v377, v378, v379, v380, v381) =
                                                case v329  {
                                                    Us29LeakingExecutor -> {
                                                        let v345 = actor.new(v95)
                                                        let v346 = closure71(Nil)
                                                        let v347 = actor.on_message(v345, fn(state, message) { v346(state)(message) })
                                                        let v348 = actor.start(v347)
                                                        let v349 = result.is_ok(v348)
                                                        let v353 =
                                                            case v349 {
                                                                True -> {
                                                                    let v350 = result.lazy_unwrap(v348, fn() { panic }).data
                                                                    Us69Some(v350)
                                                                }
                                                                False -> Us69None
                                                            }
                                                        let v358 =
                                                            case v353  {
                                                                Us69None -> closure73(Nil)
                                                                Us69Some(v354) -> closure74(#(v354))
                                                            }
                                                        let v359 = actor.new(v95)
                                                        let v360 = actor.on_message(v359, fn(state, message) { v346(state)(message) })
                                                        let v361 = actor.start(v360)
                                                        let v362 = result.is_ok(v361)
                                                        let v366 =
                                                            case v362 {
                                                                True -> {
                                                                    let v363 = result.lazy_unwrap(v361, fn() { panic }).data
                                                                    Us69Some(v363)
                                                                }
                                                                False -> Us69None
                                                            }
                                                        let v371 =
                                                            case v366  {
                                                                Us69None -> closure76(Nil)
                                                                Us69Some(v367) -> closure74(#(v367))
                                                            }
                                                        let v372 = closure37(Nil)
                                                        let v373 = quiet_c38(Nil)
                                                        let v374 = closure39(Nil)
                                                        #(v358, v371, False, v372, v373, v373, v374)
                                                    }
                                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                }
                                            #(v375, v376, v377, v378, v379, v380, v381)
                                        }
                                    }
                                #(v382, v383, v384, v385, v386, v387, v388)
                            }
                        }
                    let v398 =
                        case v333 {
                            True -> closure77(#(v249, v264, v249, v264))
                            False -> closure78(Nil)
                        }
                    let v478 =
                        case v334 {
                            True -> {
                                let v399 = "Elixir.System"
                                let v400 = atom.create(v399)
                                let v402 = atom.create("tmp_dir!")
                                let v403 = []
                                let v404 = erlang_term_apply(v400, v402, v403)
                                let v405 = erlang_term_coerce(v404)
                                let v406 = { v405 } <> { "/xsim-tree-sample-" }
                                let v407 = atom.create(v399)
                                let v409 = atom.create("pid")
                                let v410 = []
                                let v411 = erlang_term_apply(v407, v409, v410)
                                let v412 = erlang_term_coerce(v411)
                                let v413 = { v406 } <> { v412 }
                                let v414 = { v413 } <> { ".ps1" }
                                let v432 = Uh3Cons("\"%(%tree.Count) %([int64](%bytes / 1MB))\"", Uh3Nil)
                                let v433 = Uh3Cons("%bytes = (%mine | Measure-Object WorkingSetSize -Sum).Sum", v432)
                                let v434 = Uh3Cons("%mine = %all | ? { %tree.Contains([int]%_.ProcessId) }", v433)
                                let v435 = Uh3Cons("}", v434)
                                let v436 = Uh3Cons("  }", v435)
                                let v437 = Uh3Cons("    if (%up -and %kid -ne %tree[%i]) { %tree.Add(%kid) }", v436)
                                let v438 = Uh3Cons("    %up = %p.ParentProcessId -eq %tree[%i]", v437)
                                let v439 = Uh3Cons("    %kid = [int]%p.ProcessId", v438)
                                let v440 = Uh3Cons("  foreach (%p in %all) {", v439)
                                let v441 = Uh3Cons("for (%i = 0; %i -lt %tree.Count; %i++) {", v440)
                                let v442 = Uh3Cons("%tree.Add(%Root)", v441)
                                let v443 = Uh3Cons("%tree = [Collections.Generic.List[int]]::new()", v442)
                                let v444 = Uh3Cons("if (-not (%all | ? ProcessId -eq %Root)) { exit 0 }", v443)
                                let v445 = Uh3Cons("%all = @(Get-CimInstance Win32_Process)", v444)
                                let v446 = Uh3Cons("param([int]%Root)", v445)
                                let v447 = concat_balanced_22("\n", v446)
                                let v450 = v447 |> string.replace("%", "$")
                                let v451 = spiral_fs_write_file(v414, v450)
                                let v452 = spiral_fs_coerce(v451)
                                let v453 = atom.create(v20)
                                let v454 = v452 == v453
                                let v455 = v454 == False
                                case v455 {
                                    True -> panic as "file_system.write_all_text: the write failed"
                                    False -> Nil
                                }
                                let v456 = closure79(#(v414))
                                let v457 = actor.new_with_initialiser(10000, fn(me) { Ok(actor.initialised(v456(me)) |> actor.returning(me)) })
                                let v458 = closure82(Nil)
                                let v459 = actor.on_message(v457, fn(state, message) { v458(state)(message) })
                                let v460 = actor.start(v459)
                                let v461 = result.is_ok(v460)
                                let v465 =
                                    case v461 {
                                        True -> {
                                            let v462 = result.lazy_unwrap(v460, fn() { panic }).data
                                            Us78Some(v462)
                                        }
                                        False -> Us78None
                                    }
                                let v471 =
                                    case v465  {
                                        Us78None -> Us78None
                                        Us78Some(v466) -> {
                                            actor.send(v466, Us70Tick)
                                            Us78Some(v466)
                                        }
                                    }
                                case v471  {
                                    Us78None -> closure84(Nil)
                                    Us78Some(v472) -> closure85(#(v472))
                                }
                            }
                            False -> closure87(Nil)
                        }
                    let v479 = closure88(#(v398, v478))
                    let v480 = closure89(Nil)
                    let v481 = closure90(Nil)
                    let v482 = simulated_by_308(v389, v390, v391, v479, v480, v481, v395, v315, v316, v317, v318, v319, v320, v321, v322, v323, v324, v325, v326, v327, v328, v329, v330, v331, v332, v333, v334, v248)
                    delimited_21("\n", v482)
                }
                Us36RunRejected(v485) -> {
                    let v486 = { "XSIM rejected " } <> { v485 }
                    v486
                }
            }
        posted_when_signed_in_402(v488)
        let v489 = { v488 } <> { "\n" }
        let v490 = erlang_term_coerce(v489)
        let v492 = atom.create("io")
        let v494 = atom.create("put_chars")
        let v495 = []
        let v496 = [v490, ..v495]
        let _v497 = erlang_term_apply(v492, v494, v496)
        let v498 = v488 == ""
        let v502 =
            case v498 {
                True -> Uh3Nil
                False -> {
                    split_list_2("\n", v488)
                }
            }
        let v503 = method409()
        let v504 = method410(v503, v502)
        case v504 {
            True -> 1
            False -> 0
        }
    }
}

pub fn closure112(capt: #(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us87 {
    fn (v10) {
        let #(v0, v1, v2, v3, v4, v5, v6, _v7, v8, v9) = capt
        let v11 = v10 == "frames"
        case v11 {
            True -> Us87Some(v0, v1, v2, v3, v4, v5, v6, True, v8, v9)
            False -> Us87None
        }
    }
}

pub fn closure111(capt: Nil) -> fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us87 {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9) = dom
        closure112(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9))
    }
}
