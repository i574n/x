import gleam/bit_array
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/erlang/process
import gleam/otp/actor
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Us45, type Uh29, type Us68, type Us70, type Us71, Uh29Cons, Uh29Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us3None, Us3Some, Us45Crashed, Us45Done, Us68Swap, Us70Peak, Us70Tick, Us71FreshLine, Us71GrowingText, Us72None, Us72Some, Us73None, Us73Some}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, method4, spiral_sm_coerce, spiral_sm_find_trailing, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part10.{hash_text_240}
import xsim_frames/part13.{method301}
import xsim_frames/part2.{delimited_21}
import xsim_frames/part3.{method56, method57}

pub fn closure74(capt: #(String)) -> fn(Us68) -> actor.Next(String, Us68) {
    fn (v1) {
        let #(v0) = capt
        case v1  {
            Us68Swap(v2, v3) -> {
                process.send(v3, v0)
                let v4 = actor.continue(v2)
                v4
            }
        }
    }
}

pub fn closure73(capt: Nil) -> fn(String) -> fn(Us68) -> actor.Next(String, Us68) {
    fn (v0) {
        closure74(#(v0))
    }
}

pub fn closure75(capt: Nil) -> fn(Uh3) -> #(Us45, String) {
    fn (v0) {
        let v1 = "leak cell did not start for "
        let v2 = "xsim_leak_run"
        let v3 = v1 <> v2 
        let v4 = Us45Crashed
        #(v4, v3)
    }
}

pub fn closure77(capt: #(String)) -> fn(process.Subject(String)) -> Us68 {
    fn (v1) {
        let #(v0) = capt
        Us68Swap(v0, v1)
    }
}

pub fn closure76(capt: #(process.Subject(Us68))) -> fn(Uh3) -> #(Us45, String) {
    fn (v1) {
        let #(v0) = capt
        let v2 = unicode_erlang_characters_to_binary([0])
        let v3 = delimited_21(v2, v1)
        let v4 = hash_text_240(v3)
        let v5 = spiral_string_slice(v4, 0, 11)
        let v6 = closure77(#(v5))
        let v7 = actor.call(v0, 10000, v6)
        let v8 = v5 <> v7 
        let v9 = Us45Done
        #(v9, v8)
    }
}

pub fn closure78(capt: Nil) -> fn(Uh3) -> #(Us45, String) {
    fn (v0) {
        let v1 = "leak cell did not start for "
        let v2 = "xsim_leak_baseline"
        let v3 = v1 <> v2 
        let v4 = Us45Crashed
        #(v4, v3)
    }
}

pub fn closure79(capt: #(String, Dynamic, String, Dynamic)) -> fn(Int) -> Uh3 {
    fn (v4) {
        let #(_v0, _v1, _v2, v3) = capt
        let v5 = erlang_term_coerce(1)
        let v6 = "counters"
        let v7 = atom.create(v6)
        let v8 = "get"
        let v9 = atom.create(v8)
        let v10 = []
        let v11 = [v5, ..v10]
        let v12 = [v3, ..v11]
        let v13 = erlang_term_apply(v7, v9, v12)
        let v14 = erlang_term_coerce(v13)
        let v15 = erlang_term_coerce(2)
        let v16 = atom.create(v6)
        let v17 = atom.create(v8)
        let v18 = []
        let v19 = [v15, ..v18]
        let v20 = [v3, ..v19]
        let v21 = erlang_term_apply(v16, v17, v20)
        let v22 = erlang_term_coerce(v21)
        let v23 = string.inspect(v14)
        let v24 = "hits="
        let v25 = v24 <> v23 
        let v26 = " misses="
        let v27 = v25 <> v26 
        let v28 = string.inspect(v22)
        let v29 = v27 <> v28 
        let v30 = "  memo "
        let v31 = v30 <> v29 
        let v32 = " cumulative_after_schedule="
        let v33 = v31 <> v32 
        let v34 = string.inspect(v4)
        let v35 = v33 <> v34 
        let v36 = Uh3Nil
        Uh3Cons(v35, v36)
    }
}

pub fn closure80(capt: Nil) -> fn(Int) -> Uh3 {
    fn (v0) {
        Uh3Nil
    }
}

pub fn method302(v0: Uh3, v1: Uh29) -> Uh29 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method302(v3, v1)
            let v5 = erlang_term_coerce(v2)
            let v6 = "unicode"
            let v7 = atom.create(v6)
            let v8 = "characters_to_list"
            let v9 = atom.create(v8)
            let v10 = []
            let v11 = [v5, ..v10]
            let v12 = erlang_term_apply(v7, v9, v11)
            Uh29Cons(v12, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn keep_c83(capt: Nil) -> fn(Dynamic) -> Dynamic {
    fn (v0) {
        v0
    }
}

pub fn gleam_collected_303(v0: process.Selector(Dynamic), v1: String) -> #(Int, String) {
    let v2 = process.selector_receive(v0, 86400000)
    let v3 = "none"
    let v4 = atom.create(v3)
    let v5 = erlang_term_coerce(v4)
    let v6 = result.unwrap(v2, v5)
    let v7 = erlang_term_coerce(2)
    let v8 = "erlang"
    let v9 = atom.create(v8)
    let v10 = "element"
    let v11 = atom.create(v10)
    let v12 = []
    let v13 = [v6, ..v12]
    let v14 = [v7, ..v13]
    let v15 = erlang_term_apply(v9, v11, v14)
    let v16 = erlang_term_coerce(1)
    let v17 = atom.create(v8)
    let v18 = atom.create(v10)
    let v19 = []
    let v20 = [v15, ..v19]
    let v21 = [v16, ..v20]
    let v22 = erlang_term_apply(v17, v18, v21)
    let v23 = atom.create(v8)
    let v24 = "atom_to_binary"
    let v25 = atom.create(v24)
    let v26 = []
    let v27 = [v22, ..v26]
    let v28 = erlang_term_apply(v23, v25, v27)
    let v29 = erlang_term_coerce(v28)
    let v30 = v29 == "data"
    case v30 {
        True -> {
            let v31 = erlang_term_coerce(2)
            let v32 = atom.create(v8)
            let v33 = atom.create(v10)
            let v34 = []
            let v35 = [v15, ..v34]
            let v36 = [v31, ..v35]
            let v37 = erlang_term_apply(v32, v33, v36)
            let v38 = erlang_term_coerce(v37)
            let v39 = v1 <> v38 
            gleam_collected_303(v0, v39)
        }
        False -> {
            let v42 = v29 == "exit_status"
            case v42 {
                True -> {
                    let v43 = erlang_term_coerce(2)
                    let v44 = atom.create(v8)
                    let v45 = atom.create(v10)
                    let v46 = []
                    let v47 = [v15, ..v46]
                    let v48 = [v43, ..v47]
                    let v49 = erlang_term_apply(v44, v45, v48)
                    let v50 = erlang_term_coerce(v49)
                    #(v50, v1)
                }
                False -> gleam_collected_303(v0, v1)
            }
        }
    }
}

pub fn closure82(capt: #(String)) -> fn(Nil) -> String {
    fn (dom) {
        let #(v0) = capt
        let v1 = "127.0.0.1"
        let v2 = erlang_term_coerce(v1)
        let v3 = "unicode"
        let v4 = atom.create(v3)
        let v5 = "characters_to_list"
        let v6 = atom.create(v5)
        let v7 = []
        let v8 = [v2, ..v7]
        let v9 = erlang_term_apply(v4, v6, v8)
        let v10 = "Elixir.Spiral.Cells.CompilerDaemon"
        let v11 = atom.create(v10)
        let v12 = "port"
        let v13 = atom.create(v12)
        let v14 = []
        let v15 = erlang_term_apply(v11, v13, v14)
        let v16 = "line"
        let v17 = atom.create(v16)
        let v18 = erlang_term_coerce(v17)
        let v19 = "packet"
        let v20 = atom.create(v19)
        let v21 = erlang_term_coerce(v20)
        let v22 = []
        let v23 = [v18, ..v22]
        let v24 = [v21, ..v23]
        let v25 = erlang_term_tuple(v24)
        let v26 = "binary"
        let v27 = atom.create(v26)
        let v28 = erlang_term_coerce(v27)
        let v29 = erlang_term_coerce(False)
        let v30 = "active"
        let v31 = atom.create(v30)
        let v32 = erlang_term_coerce(v31)
        let v33 = []
        let v34 = [v29, ..v33]
        let v35 = [v32, ..v34]
        let v36 = erlang_term_tuple(v35)
        let v37 = []
        let v38 = [v36, ..v37]
        let v39 = [v25, ..v38]
        let v40 = [v28, ..v39]
        let v41 = erlang_term_coerce(v40)
        let v42 = erlang_term_coerce(1000)
        let v43 = "gen_tcp"
        let v44 = atom.create(v43)
        let v45 = "connect"
        let v46 = atom.create(v45)
        let v47 = []
        let v48 = [v42, ..v47]
        let v49 = [v41, ..v48]
        let v50 = [v15, ..v49]
        let v51 = [v9, ..v50]
        let v52 = erlang_term_apply(v44, v46, v51)
        let v53 = "erlang"
        let v54 = atom.create(v53)
        let v55 = "is_tuple"
        let v56 = atom.create(v55)
        let v57 = []
        let v58 = [v52, ..v57]
        let v59 = erlang_term_apply(v54, v56, v58)
        let v60 = erlang_term_coerce(v59)
        let v61 = v60 == False
        let v85 =
            case v61 {
                True -> Us72None
                False -> {
                    let v63 = erlang_term_coerce(1)
                    let v64 = atom.create(v53)
                    let v65 = "element"
                    let v66 = atom.create(v65)
                    let v67 = []
                    let v68 = [v52, ..v67]
                    let v69 = [v63, ..v68]
                    let v70 = erlang_term_apply(v64, v66, v69)
                    let v71 = "ok"
                    let v72 = atom.create(v71)
                    let v73 = erlang_term_coerce(v72)
                    let v74 = v70 == v73
                    case v74 {
                        True -> {
                            let v75 = erlang_term_coerce(2)
                            let v76 = atom.create(v53)
                            let v77 = atom.create(v65)
                            let v78 = []
                            let v79 = [v52, ..v78]
                            let v80 = [v75, ..v79]
                            let v81 = erlang_term_apply(v76, v77, v80)
                            Us72Some(v81)
                        }
                        False -> Us72None
                    }
                }
            }
        let v150 =
            case v85  {
                Us72None -> {
                    let v148 = ""
                    v148
                }
                Us72Some(v86) -> {
                    let v87 = "hello\n"
                    let v88 = erlang_term_coerce(v87)
                    let v89 = atom.create(v43)
                    let v90 = "send"
                    let v91 = atom.create(v90)
                    let v92 = []
                    let v93 = [v88, ..v92]
                    let v94 = [v86, ..v93]
                    let _v95 = erlang_term_apply(v89, v91, v94)
                    let v96 = erlang_term_coerce(0)
                    let v97 = erlang_term_coerce(2000)
                    let v98 = atom.create(v43)
                    let v99 = "recv"
                    let v100 = atom.create(v99)
                    let v101 = []
                    let v102 = [v97, ..v101]
                    let v103 = [v96, ..v102]
                    let v104 = [v86, ..v103]
                    let v105 = erlang_term_apply(v98, v100, v104)
                    let v106 = atom.create(v43)
                    let v107 = "close"
                    let v108 = atom.create(v107)
                    let v109 = []
                    let v110 = [v86, ..v109]
                    let _v111 = erlang_term_apply(v106, v108, v110)
                    let v112 = atom.create(v53)
                    let v113 = atom.create(v55)
                    let v114 = []
                    let v115 = [v105, ..v114]
                    let v116 = erlang_term_apply(v112, v113, v115)
                    let v117 = erlang_term_coerce(v116)
                    let v118 = v117 == False
                    let v142 =
                        case v118 {
                            True -> Us72None
                            False -> {
                                let v120 = erlang_term_coerce(1)
                                let v121 = atom.create(v53)
                                let v122 = "element"
                                let v123 = atom.create(v122)
                                let v124 = []
                                let v125 = [v105, ..v124]
                                let v126 = [v120, ..v125]
                                let v127 = erlang_term_apply(v121, v123, v126)
                                let v128 = "ok"
                                let v129 = atom.create(v128)
                                let v130 = erlang_term_coerce(v129)
                                let v131 = v127 == v130
                                case v131 {
                                    True -> {
                                        let v132 = erlang_term_coerce(2)
                                        let v133 = atom.create(v53)
                                        let v134 = atom.create(v122)
                                        let v135 = []
                                        let v136 = [v105, ..v135]
                                        let v137 = [v132, ..v136]
                                        let v138 = erlang_term_apply(v133, v134, v137)
                                        Us72Some(v138)
                                    }
                                    False -> Us72None
                                }
                            }
                        }
                    case v142  {
                        Us72None -> {
                            let v145 = ""
                            v145
                        }
                        Us72Some(v143) -> {
                            let v144 = erlang_term_coerce(v143)
                            v144
                        }
                    }
                }
            }
        let v151 = spiral_string_length(v150)
        let v152 = 0
        let v153 = method56(v150, v151, v152)
        let v154 = spiral_wrap_signed(v151 - 1, 32)
        let v155 = spiral_string_slice(v150, v153, v154)
        let v156 = spiral_string_length(v155)
        let v157 = method57(v155, v156)
        let v158 = spiral_string_slice(v155, 0, v157)
        let v159 = v158 == ""
        let v163 =
            case v159 {
                True -> Uh3Nil
                False -> {
                    let v161 = "\t"
                    split_list_2(v161, v158)
                }
            }
        let v179 =
            case v163  {
                Uh3Cons(v164, v165) -> {
                    case v165  {
                        Uh3Cons(v166, v167) -> {
                            case v167  {
                                Uh3Cons(v168, v169) -> {
                                    let v170 = v164 == "spiral-cells"
                                    case v170 {
                                        True -> count_of_text_10(v168)
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
        case v179  {
            Us3None -> {
                let v285 = ""
                v285
            }
            Us3Some(v180) -> {
                let v181 = string.inspect(v180)
                let v182 = "pwsh"
                let v183 = erlang_term_coerce(v182)
                let v184 = atom.create(v3)
                let v185 = atom.create(v5)
                let v186 = []
                let v187 = [v183, ..v186]
                let v188 = erlang_term_apply(v184, v185, v187)
                let v189 = "os"
                let v190 = atom.create(v189)
                let v191 = "find_executable"
                let v192 = atom.create(v191)
                let v193 = []
                let v194 = [v188, ..v193]
                let v195 = erlang_term_apply(v190, v192, v194)
                let v196 = "false"
                let v197 = atom.create(v196)
                let v198 = erlang_term_coerce(v197)
                let v199 = v195 == v198
                let #(v273, v274, v275) =
                    case v199 {
                        True -> {
                            let v200 = ""
                            #(False, -1, v200)
                        }
                        False -> {
                            let v201 = "args"
                            let v202 = atom.create(v201)
                            let v203 = erlang_term_coerce(v202)
                            let v204 = v0 == ""
                            let v216 =
                                case v204 {
                                    True -> {
                                        let v205 = "-File"
                                        let v206 = "-NoProfile"
                                        let v207 = Uh3Nil
                                        let v208 = Uh3Cons(v206, v207)
                                        Uh3Cons(v205, v208)
                                    }
                                    False -> {
                                        let v210 = "-File"
                                        let v211 = "-NoProfile"
                                        let v212 = Uh3Nil
                                        let v213 = Uh3Cons(v211, v212)
                                        let v214 = Uh3Cons(v210, v213)
                                        Uh3Cons(v0, v214)
                                    }
                                }
                            let v217 = v181 == ""
                            let v223 =
                                case v217 {
                                    True -> {
                                        let v218 = "-Root"
                                        Uh3Cons(v218, v216)
                                    }
                                    False -> {
                                        let v220 = "-Root"
                                        let v221 = Uh3Cons(v220, v216)
                                        Uh3Cons(v181, v221)
                                    }
                                }
                            let v224 = Uh3Nil
                            let v225 = method4(v223, v224)
                            let v226 = Uh29Nil
                            let v227 = method302(v225, v226)
                            let v228 = []
                            let v229 = method301(v227, v228)
                            let v230 = erlang_term_coerce(v229)
                            let v231 = []
                            let v232 = [v230, ..v231]
                            let v233 = [v203, ..v232]
                            let v234 = erlang_term_tuple(v233)
                            let v235 = atom.create(v26)
                            let v236 = erlang_term_coerce(v235)
                            let v237 = "exit_status"
                            let v238 = atom.create(v237)
                            let v239 = erlang_term_coerce(v238)
                            let v240 = "stderr_to_stdout"
                            let v241 = atom.create(v240)
                            let v242 = erlang_term_coerce(v241)
                            let v243 = "hide"
                            let v244 = atom.create(v243)
                            let v245 = erlang_term_coerce(v244)
                            let v246 = "spawn_executable"
                            let v247 = atom.create(v246)
                            let v248 = erlang_term_coerce(v247)
                            let v249 = []
                            let v250 = [v195, ..v249]
                            let v251 = [v248, ..v250]
                            let v252 = erlang_term_tuple(v251)
                            let v253 = []
                            let v254 = [v234, ..v253]
                            let v255 = [v239, ..v254]
                            let v256 = [v236, ..v255]
                            let v257 = [v242, ..v256]
                            let v258 = [v245, ..v257]
                            let v259 = erlang_term_coerce(v258)
                            let v260 = atom.create(v53)
                            let v261 = "open_port"
                            let v262 = atom.create(v261)
                            let v263 = []
                            let v264 = [v259, ..v263]
                            let v265 = [v252, ..v264]
                            let v266 = erlang_term_apply(v260, v262, v265)
                            let v267 = erlang_term_coerce(v266)
                            let v268 = keep_c83(Nil)
                            let v269 = process.select_record(process.new_selector(), v267, 1, v268)
                            let v270 = ""
                            let #(v271, v272) = gleam_collected_303(v269, v270)
                            #(True, v271, v272)
                        }
                    }
                let v277 =
                    case v273 {
                        True -> {
                            let v276 = v274 == 0
                            v276
                        }
                        False -> False
                    }
                let v280 =
                    case v277 {
                        True -> Us2Some(v275)
                        False -> Us2None
                    }
                case v280  {
                    Us2None -> {
                        let v282 = ""
                        v282
                    }
                    Us2Some(v281) -> v281
                }
            }
        }
    }
}

pub fn closure81(capt: #(String)) -> fn(process.Subject(Us70)) -> #(Int, Int, Int, Int, Int, Us71, Int, process.Subject(Us70)) {
    fn (v1) {
        let #(v0) = capt
        let v2 = closure82(#(v0))
        let v3 = Us71FreshLine(v2)
        #(0, 0, 0, 0, 0, v3, 1000, v1)
    }
}

pub fn method304(v0: Uh3, v1: Int, v2: Int, v3: Int, v4: Int) -> #(Int, Int, Int, Int) {
    let #(v62, v63, v64, v65) =
        case v0  {
            Uh3Cons(v5, v6) -> {
                let v7 = spiral_string_length(v5)
                let v8 = 0
                let v9 = method56(v5, v7, v8)
                let v10 = spiral_wrap_signed(v7 - 1, 32)
                let v11 = spiral_string_slice(v5, v9, v10)
                let v12 = spiral_string_length(v11)
                let v13 = method57(v11, v12)
                let v14 = spiral_string_slice(v11, 0, v13)
                let v15 = v14 == ""
                let v19 =
                    case v15 {
                        True -> Uh3Nil
                        False -> {
                            let v17 = " "
                            split_list_2(v17, v14)
                        }
                    }
                let v38 =
                    case v19  {
                        Uh3Cons(v20, v21) -> {
                            case v21  {
                                Uh3Cons(v22, v23) -> {
                                    case v23  {
                                        Uh3Nil -> {
                                            let v24 = count_of_text_10(v20)
                                            let v25 = count_of_text_10(v22)
                                            case v24  {
                                                Us3Some(v26) -> {
                                                    case v25  {
                                                        Us3Some(v27) -> Us73Some(v26, v27)
                                                        _ -> Us73None
                                                    }
                                                }
                                                _ -> Us73None
                                            }
                                        }
                                        _ -> Us73None
                                    }
                                }
                                _ -> Us73None
                            }
                        }
                        _ -> Us73None
                    }
                let #(v50, v51, v52, v53) =
                    case v38  {
                        Us73Some(v39, v40) -> {
                            let v41 = spiral_wrap_signed(v1 + 1, 32)
                            let v42 = v3 > v39
                            let v43 =
                                case v42 {
                                    True -> v3
                                    False -> v39
                                }
                            let v44 = v4 > v40
                            let v45 =
                                case v44 {
                                    True -> v4
                                    False -> v40
                                }
                            #(v41, v40, v43, v45)
                        }
                        _ -> {
                            let #(v46, v47, v48, v49) =
                                case v38  {
                                    Us73None -> #(v1, v2, v3, v4)
                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                }
                            #(v46, v47, v48, v49)
                        }
                    }
                method304(v6, v50, v51, v52, v53)
            }
            _ -> {
                let #(v58, v59, v60, v61) =
                    case v0  {
                        Uh3Nil -> #(v1, v2, v3, v4)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v58, v59, v60, v61)
            }
        }
    #(v62, v63, v64, v65)
}

pub fn closure85(capt: #(Int, Int, Int, Int, Int, Us71, Int, process.Subject(Us70))) -> fn(Us70) -> actor.Next(#(Int, Int, Int, Int, Int, Us71, Int, process.Subject(Us70)), Us70) {
    fn (v8) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7) = capt
        case v8  {
            Us70Peak(v72) -> {
                process.send(v72, #(v0, v1, v2, v3))
                let v73 = actor.continue(#(v0, v1, v2, v3, v4, v5, v6, v7))
                v73
            }
            Us70Tick -> {
                let v9 = Us70Tick
                let _v10 = process.send_after(v7, v6, v9)
                let #(v63, v64, v65, v66, v67, v68, v69, v70) =
                    case v5  {
                        Us71GrowingText(v11) -> {
                            let v12 = v11(Nil)
                            let v13 = spiral_string_length(v12)
                            let v14 = v13 >= v4
                            let v15 =
                                case v14 {
                                    True -> v4
                                    False -> 0
                                }
                            let v16 = spiral_wrap_signed(v13 - v15, 32)
                            let v17 = spiral_wrap_signed(v15 + v16, 32)
                            let v18 = spiral_wrap_signed(v17 - 1, 32)
                            let v19 = spiral_string_slice(v12, v15, v18)
                            let v20 = "\n"
                            let v21 = v20 == ""
                            let v30 =
                                case v21 {
                                    True -> {
                                        let v22 = bit_array.byte_size(bit_array.from_string(v19))
                                        v22
                                    }
                                    False -> {
                                        let v23 = spiral_sm_find_trailing(v19, v20, atom.create("trailing"))
                                        let v24 = v23 == spiral_sm_coerce(atom.create("nomatch"))
                                        case v24 {
                                            True -> -1
                                            False -> {
                                                let v25 = bit_array.byte_size(bit_array.from_string(v19))
                                                let v26 = spiral_sm_coerce(v23)
                                                let v27 = bit_array.byte_size(bit_array.from_string(v26))
                                                let v28 = spiral_wrap_signed(v25 - v27, 32)
                                                v28
                                            }
                                        }
                                    }
                                }
                            let v31 = spiral_wrap_signed(v30 + 1, 32)
                            let v32 = spiral_wrap_signed(v31 - 1, 32)
                            let v33 = spiral_string_slice(v19, 0, v32)
                            let v34 = v33 == ""
                            let v37 =
                                case v34 {
                                    True -> Uh3Nil
                                    False -> split_list_2(v20, v33)
                                }
                            let #(v38, v39, v40, v41) = method304(v37, v0, v1, v2, v3)
                            let v42 = spiral_string_length(v33)
                            let v43 = spiral_wrap_signed(v15 + v42, 32)
                            #(v38, v39, v40, v41, v43, v5, v6, v7)
                        }
                        _ -> {
                            let #(v55, v56, v57, v58, v59, v60, v61, v62) =
                                case v5  {
                                    Us71FreshLine(v44) -> {
                                        let v45 = v44(Nil)
                                        let v46 = v45 == ""
                                        let v50 =
                                            case v46 {
                                                True -> Uh3Nil
                                                False -> {
                                                    let v48 = "\n"
                                                    split_list_2(v48, v45)
                                                }
                                            }
                                        let #(v51, v52, v53, v54) = method304(v50, v0, v1, v2, v3)
                                        #(v51, v52, v53, v54, v4, v5, v6, v7)
                                    }
                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                }
                            #(v55, v56, v57, v58, v59, v60, v61, v62)
                        }
                    }
                let v71 = actor.continue(#(v63, v64, v65, v66, v67, v68, v69, v70))
                v71
            }
        }
    }
}

pub fn closure84(capt: Nil) -> fn(#(Int, Int, Int, Int, Int, Us71, Int, process.Subject(Us70))) -> fn(Us70) -> actor.Next(#(Int, Int, Int, Int, Int, Us71, Int, process.Subject(Us70)), Us70) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7) = dom
        closure85(#(v0, v1, v2, v3, v4, v5, v6, v7))
    }
}

pub fn closure86(capt: Nil) -> fn(Int) -> Uh3 {
    fn (v0) {
        let v1 = "  daemon watch did not start"
        let v2 = Uh3Nil
        Uh3Cons(v1, v2)
    }
}

pub fn closure88(capt: Nil) -> fn(process.Subject(#(Int, Int, Int, Int))) -> Us70 {
    fn (v0) {
        Us70Peak(v0)
    }
}
