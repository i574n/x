import gleam/bit_array
import gleam/erlang/atom
import gleam/erlang/process
import gleam/int
import gleam/otp/actor
import gleam/string
import xsim_frames/types.{type Uh3, type Us70, type Us71, Uh3Cons, Uh3Nil, Us3None, Us3Some, Us70Peak, Us70Tick, Us71FreshLine, Us71GrowingText, Us72Error, Us72Ok, Us73Closed, Us73Failed, Us73Refused, Us73TimedOut, Us74Error, Us74Ok, Us75Error, Us75Ok, Us76Error, Us76Ok, Us77None, Us77Some}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_sm_coerce, spiral_sm_find_trailing, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part2.{method18}
import xsim_frames/part3.{method56, method57}

pub fn method307(v0: Uh3, v1: Int, v2: Int, v3: Int, v4: Int) -> #(Int, Int, Int, Int) {
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
                                                        Us3Some(v27) -> Us77Some(v26, v27)
                                                        _ -> Us77None
                                                    }
                                                }
                                                _ -> Us77None
                                            }
                                        }
                                        _ -> Us77None
                                    }
                                }
                                _ -> Us77None
                            }
                        }
                        _ -> Us77None
                    }
                let #(v50, v51, v52, v53) =
                    case v38  {
                        Us77Some(v39, v40) -> {
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
                                    Us77None -> #(v1, v2, v3, v4)
                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                }
                            #(v46, v47, v48, v49)
                        }
                    }
                method307(v6, v50, v51, v52, v53)
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

pub fn closure83(capt: #(Int, Int, Int, Int, Int, Us71, Int, process.Subject(Us70))) -> fn(Us70) -> actor.Next(#(Int, Int, Int, Int, Int, Us71, Int, process.Subject(Us70)), Us70) {
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
                            let #(v38, v39, v40, v41) = method307(v37, v0, v1, v2, v3)
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
                                        let #(v51, v52, v53, v54) = method307(v50, v0, v1, v2, v3)
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

pub fn closure82(capt: Nil) -> fn(#(Int, Int, Int, Int, Int, Us71, Int, process.Subject(Us70))) -> fn(Us70) -> actor.Next(#(Int, Int, Int, Int, Int, Us71, Int, process.Subject(Us70)), Us70) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7) = dom
        closure83(#(v0, v1, v2, v3, v4, v5, v6, v7))
    }
}

pub fn closure84(capt: Nil) -> fn(Int) -> Uh3 {
    fn (v0) {
        let v1 = "  daemon watch did not start"
        let v2 = Uh3Nil
        Uh3Cons(v1, v2)
    }
}

pub fn closure86(capt: Nil) -> fn(process.Subject(#(Int, Int, Int, Int))) -> Us70 {
    fn (v0) {
        Us70Peak(v0)
    }
}

pub fn closure85(capt: #(process.Subject(Us70))) -> fn(Int) -> Uh3 {
    fn (v1) {
        let #(v0) = capt
        let v2 = "Elixir.Spiral.Cells.CompilerDaemon"
        let v3 = atom.create(v2)
        let v4 = "port"
        let v5 = atom.create(v4)
        let v6 = []
        let v7 = erlang_term_apply(v3, v5, v6)
        let v8 = erlang_term_coerce(v7)
        let v9 = erlang_term_coerce(1)
        let v10 = erlang_term_coerce(0)
        let v11 = erlang_term_coerce(0)
        let v12 = erlang_term_coerce(127)
        let v13 = []
        let v14 = [v9, ..v13]
        let v15 = [v10, ..v14]
        let v16 = [v11, ..v15]
        let v17 = [v12, ..v16]
        let v18 = erlang_term_tuple(v17)
        let v19 = erlang_term_coerce(v8)
        let v20 = "line"
        let v21 = atom.create(v20)
        let v22 = erlang_term_coerce(v21)
        let v23 = "packet"
        let v24 = atom.create(v23)
        let v25 = erlang_term_coerce(v24)
        let v26 = []
        let v27 = [v22, ..v26]
        let v28 = [v25, ..v27]
        let v29 = erlang_term_tuple(v28)
        let v30 = "false"
        let v31 = atom.create(v30)
        let v32 = erlang_term_coerce(v31)
        let v33 = "active"
        let v34 = atom.create(v33)
        let v35 = erlang_term_coerce(v34)
        let v36 = []
        let v37 = [v32, ..v36]
        let v38 = [v35, ..v37]
        let v39 = erlang_term_tuple(v38)
        let v40 = "binary"
        let v41 = atom.create(v40)
        let v42 = erlang_term_coerce(v41)
        let v43 = erlang_term_coerce(8000000)
        let v44 = "packet_size"
        let v45 = atom.create(v44)
        let v46 = erlang_term_coerce(v45)
        let v47 = []
        let v48 = [v43, ..v47]
        let v49 = [v46, ..v48]
        let v50 = erlang_term_tuple(v49)
        let v51 = []
        let v52 = [v50, ..v51]
        let v53 = [v39, ..v52]
        let v54 = [v29, ..v53]
        let v55 = [v42, ..v54]
        let v56 = erlang_term_coerce(v55)
        let v57 = erlang_term_coerce(1000)
        let v58 = "gen_tcp"
        let v59 = atom.create(v58)
        let v60 = "connect"
        let v61 = atom.create(v60)
        let v62 = []
        let v63 = [v57, ..v62]
        let v64 = [v56, ..v63]
        let v65 = [v19, ..v64]
        let v66 = [v18, ..v65]
        let v67 = erlang_term_apply(v59, v61, v66)
        let v68 = erlang_term_coerce(1)
        let v69 = "erlang"
        let v70 = atom.create(v69)
        let v71 = "element"
        let v72 = atom.create(v71)
        let v73 = []
        let v74 = [v67, ..v73]
        let v75 = [v68, ..v74]
        let v76 = erlang_term_apply(v70, v72, v75)
        let v77 = "ok"
        let v78 = atom.create(v77)
        let v79 = erlang_term_coerce(v78)
        let v80 = v76 == v79
        let v117 =
            case v80 {
                True -> {
                    let v81 = erlang_term_coerce(2)
                    let v82 = atom.create(v69)
                    let v83 = atom.create(v71)
                    let v84 = []
                    let v85 = [v67, ..v84]
                    let v86 = [v81, ..v85]
                    let v87 = erlang_term_apply(v82, v83, v86)
                    Us72Ok(v87)
                }
                False -> {
                    let v89 = erlang_term_coerce(2)
                    let v90 = atom.create(v69)
                    let v91 = atom.create(v71)
                    let v92 = []
                    let v93 = [v67, ..v92]
                    let v94 = [v89, ..v93]
                    let v95 = erlang_term_apply(v90, v91, v94)
                    let v96 = "econnrefused"
                    let v97 = atom.create(v96)
                    let v98 = erlang_term_coerce(v97)
                    let v99 = v95 == v98
                    let v115 =
                        case v99 {
                            True -> Us73Refused
                            False -> {
                                let v101 = "timeout"
                                let v102 = atom.create(v101)
                                let v103 = erlang_term_coerce(v102)
                                let v104 = v95 == v103
                                case v104 {
                                    True -> Us73TimedOut
                                    False -> {
                                        let v106 = "closed"
                                        let v107 = atom.create(v106)
                                        let v108 = erlang_term_coerce(v107)
                                        let v109 = v95 == v108
                                        case v109 {
                                            True -> Us73Closed
                                            False -> {
                                                let v111 = string.inspect(v95)
                                                Us73Failed(v111)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    Us72Error(v115)
                }
            }
        let v123 =
            case v117  {
                Us72Error(v120) -> Us74Error(v120)
                Us72Ok(v118) -> Us74Ok(v118)
            }
        let v254 =
            case v123  {
                Us74Error(v251) -> {
                    let v252 = ""
                    v252
                }
                Us74Ok(v124) -> {
                    let v125 = "hello"
                    let v126 = "\n"
                    let v127 = v125 <> v126 
                    let v128 = erlang_term_coerce(v127)
                    let v129 = atom.create(v58)
                    let v130 = "send"
                    let v131 = atom.create(v130)
                    let v132 = []
                    let v133 = [v128, ..v132]
                    let v134 = [v124, ..v133]
                    let v135 = erlang_term_apply(v129, v131, v134)
                    let v136 = atom.create(v77)
                    let v137 = erlang_term_coerce(v136)
                    let v138 = v135 == v137
                    let _v168 =
                        case v138 {
                            True -> Us75Ok
                            False -> {
                                let v140 = erlang_term_coerce(2)
                                let v141 = atom.create(v69)
                                let v142 = atom.create(v71)
                                let v143 = []
                                let v144 = [v135, ..v143]
                                let v145 = [v140, ..v144]
                                let v146 = erlang_term_apply(v141, v142, v145)
                                let v147 = "econnrefused"
                                let v148 = atom.create(v147)
                                let v149 = erlang_term_coerce(v148)
                                let v150 = v146 == v149
                                let v166 =
                                    case v150 {
                                        True -> Us73Refused
                                        False -> {
                                            let v152 = "timeout"
                                            let v153 = atom.create(v152)
                                            let v154 = erlang_term_coerce(v153)
                                            let v155 = v146 == v154
                                            case v155 {
                                                True -> Us73TimedOut
                                                False -> {
                                                    let v157 = "closed"
                                                    let v158 = atom.create(v157)
                                                    let v159 = erlang_term_coerce(v158)
                                                    let v160 = v146 == v159
                                                    case v160 {
                                                        True -> Us73Closed
                                                        False -> {
                                                            let v162 = string.inspect(v146)
                                                            Us73Failed(v162)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                Us75Error(v166)
                            }
                        }
                    let v169 = erlang_term_coerce(0)
                    let v170 = erlang_term_coerce(2000)
                    let v171 = atom.create(v58)
                    let v172 = "recv"
                    let v173 = atom.create(v172)
                    let v174 = []
                    let v175 = [v170, ..v174]
                    let v176 = [v169, ..v175]
                    let v177 = [v124, ..v176]
                    let v178 = erlang_term_apply(v171, v173, v177)
                    let v179 = erlang_term_coerce(1)
                    let v180 = atom.create(v69)
                    let v181 = atom.create(v71)
                    let v182 = []
                    let v183 = [v178, ..v182]
                    let v184 = [v179, ..v183]
                    let v185 = erlang_term_apply(v180, v181, v184)
                    let v186 = atom.create(v77)
                    let v187 = erlang_term_coerce(v186)
                    let v188 = v185 == v187
                    let v225 =
                        case v188 {
                            True -> {
                                let v189 = erlang_term_coerce(2)
                                let v190 = atom.create(v69)
                                let v191 = atom.create(v71)
                                let v192 = []
                                let v193 = [v178, ..v192]
                                let v194 = [v189, ..v193]
                                let v195 = erlang_term_apply(v190, v191, v194)
                                Us72Ok(v195)
                            }
                            False -> {
                                let v197 = erlang_term_coerce(2)
                                let v198 = atom.create(v69)
                                let v199 = atom.create(v71)
                                let v200 = []
                                let v201 = [v178, ..v200]
                                let v202 = [v197, ..v201]
                                let v203 = erlang_term_apply(v198, v199, v202)
                                let v204 = "econnrefused"
                                let v205 = atom.create(v204)
                                let v206 = erlang_term_coerce(v205)
                                let v207 = v203 == v206
                                let v223 =
                                    case v207 {
                                        True -> Us73Refused
                                        False -> {
                                            let v209 = "timeout"
                                            let v210 = atom.create(v209)
                                            let v211 = erlang_term_coerce(v210)
                                            let v212 = v203 == v211
                                            case v212 {
                                                True -> Us73TimedOut
                                                False -> {
                                                    let v214 = "closed"
                                                    let v215 = atom.create(v214)
                                                    let v216 = erlang_term_coerce(v215)
                                                    let v217 = v203 == v216
                                                    case v217 {
                                                        True -> Us73Closed
                                                        False -> {
                                                            let v219 = string.inspect(v203)
                                                            Us73Failed(v219)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                Us72Error(v223)
                            }
                        }
                    let v239 =
                        case v225  {
                            Us72Error(v236) -> Us76Error(v236)
                            Us72Ok(v226) -> {
                                let v227 = "string"
                                let v228 = atom.create(v227)
                                let v229 = "trim"
                                let v230 = atom.create(v229)
                                let v231 = []
                                let v232 = [v226, ..v231]
                                let v233 = erlang_term_apply(v228, v230, v232)
                                let v234 = erlang_term_coerce(v233)
                                Us76Ok(v234)
                            }
                        }
                    let v240 = atom.create(v58)
                    let v241 = "close"
                    let v242 = atom.create(v241)
                    let v243 = []
                    let v244 = [v124, ..v243]
                    let _v245 = erlang_term_apply(v240, v242, v244)
                    case v239  {
                        Us76Error(v247) -> {
                            let v248 = ""
                            v248
                        }
                        Us76Ok(v246) -> v246
                    }
                }
            }
        let v255 = spiral_string_length(v254)
        let v256 = 0
        let v257 = method56(v254, v255, v256)
        let v258 = spiral_wrap_signed(v255 - 1, 32)
        let v259 = spiral_string_slice(v254, v257, v258)
        let v260 = spiral_string_length(v259)
        let v261 = method57(v259, v260)
        let v262 = spiral_string_slice(v259, 0, v261)
        let v263 = v262 == ""
        let v267 =
            case v263 {
                True -> Uh3Nil
                False -> {
                    let v265 = "\t"
                    split_list_2(v265, v262)
                }
            }
        let v283 =
            case v267  {
                Uh3Cons(v268, v269) -> {
                    case v269  {
                        Uh3Cons(v270, v271) -> {
                            case v271  {
                                Uh3Cons(v272, v273) -> {
                                    let v274 = v268 == "spiral-cells"
                                    case v274 {
                                        True -> count_of_text_10(v272)
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
        let v288 =
            case v283  {
                Us3None -> {
                    let v286 = ""
                    v286
                }
                Us3Some(v284) -> {
                    let v285 = int.to_string(v284)
                    v285
                }
            }
        let v289 = closure86(Nil)
        let #(v290, v291, v292, v293) = actor.call(v0, 10000, v289)
        let v294 = "  daemon pid="
        let v295 = v294 <> v288 
        let v296 = " "
        let v297 = v295 <> v296 
        let v298 = int.to_string(v293)
        let v299 = "peak_mb="
        let v300 = v299 <> v298 
        let v301 = " last_mb="
        let v302 = v300 <> v301 
        let v303 = int.to_string(v291)
        let v304 = v302 <> v303 
        let v305 = int.to_string(v292)
        let v306 = " procs="
        let v307 = v306 <> v305 
        let v308 = " samples="
        let v309 = v307 <> v308 
        let v310 = int.to_string(v290)
        let v311 = v309 <> v310 
        let v312 = v304 <> v311 
        let v313 = v297 <> v312 
        let v314 = " cumulative_after_schedule="
        let v315 = v313 <> v314 
        let v316 = int.to_string(v1)
        let v317 = v315 <> v316 
        let v318 = Uh3Nil
        Uh3Cons(v317, v318)
    }
}

pub fn closure87(capt: Nil) -> fn(Int) -> Uh3 {
    fn (v0) {
        Uh3Nil
    }
}

pub fn closure88(capt: #(fn(Int) -> Uh3, fn(Int) -> Uh3)) -> fn(Int) -> Uh3 {
    fn (v2) {
        let #(v0, v1) = capt
        let v3 = v0(v2)
        let v4 = v1(v2)
        method18(v3, v4)
    }
}

pub fn closure89(capt: Nil) -> fn(Nil) -> Int {
    fn (dom) {
        let v0 = "total"
        let v1 = atom.create(v0)
        let v2 = erlang_term_coerce(v1)
        let v3 = "erlang"
        let v4 = atom.create(v3)
        let v5 = "memory"
        let v6 = atom.create(v5)
        let v7 = []
        let v8 = [v2, ..v7]
        let v9 = erlang_term_apply(v4, v6, v8)
        let v10 = erlang_term_coerce(1048576)
        let v11 = atom.create(v3)
        let v12 = "div"
        let v13 = atom.create(v12)
        let v14 = []
        let v15 = [v10, ..v14]
        let v16 = [v9, ..v15]
        let v17 = erlang_term_apply(v11, v13, v16)
        let v18 = erlang_term_coerce(v17)
        v18
    }
}

pub fn closure90(capt: Nil) -> fn(Nil) -> Int {
    fn (dom) {
        let v0 = "millisecond"
        let v1 = atom.create(v0)
        let v2 = erlang_term_coerce(v1)
        let v3 = "erlang"
        let v4 = atom.create(v3)
        let v5 = "monotonic_time"
        let v6 = atom.create(v5)
        let v7 = []
        let v8 = [v2, ..v7]
        let v9 = erlang_term_apply(v4, v6, v8)
        let v10 = erlang_term_coerce(v9)
        let v11 = spiral_wrap_signed(v10, 32)
        v11
    }
}
