import gleam/bit_array
import gleam/erlang/atom
import gleam/erlang/process
import gleam/int
import gleam/otp/actor
import gleam/string
import xsim_frames/types.{type Uh3, type Us70, type Us71, Uh30Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us3None, Us3Some, Us70Peak, Us70Tick, Us71FreshLine, Us71GrowingText, Us72Error, Us72Ok, Us73Closed, Us73Failed, Us73Refused, Us73TimedOut, Us74Error, Us74Ok, Us75Error, Us75Ok, Us76Error, Us76Ok, Us77None, Us77Some}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, method4, spiral_sm_coerce, spiral_sm_find_trailing, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part12.{gleam_collected_308, keep_c81, method302, method307}
import xsim_frames/part3.{method58, method59}

pub fn closure80(capt: #(String)) -> fn(Nil) -> String {
    fn (dom) {
        let #(v0) = capt
        let v2 = atom.create("Elixir.Spiral.Cells.CompilerDaemon")
        let v4 = atom.create("port")
        let v5 = []
        let v6 = erlang_term_apply(v2, v4, v5)
        let v7 = erlang_term_coerce(v6)
        let v8 = erlang_term_coerce(1)
        let v9 = erlang_term_coerce(0)
        let v10 = erlang_term_coerce(0)
        let v11 = erlang_term_coerce(127)
        let v12 = []
        let v13 = [v8, ..v12]
        let v14 = [v9, ..v13]
        let v15 = [v10, ..v14]
        let v16 = [v11, ..v15]
        let v17 = erlang_term_tuple(v16)
        let v18 = erlang_term_coerce(v7)
        let v19 = "binary"
        let v20 = atom.create(v19)
        let v21 = erlang_term_coerce(v20)
        let v23 = atom.create("line")
        let v24 = erlang_term_coerce(v23)
        let v26 = atom.create("packet")
        let v27 = erlang_term_coerce(v26)
        let v28 = []
        let v29 = [v24, ..v28]
        let v30 = [v27, ..v29]
        let v31 = erlang_term_tuple(v30)
        let v32 = "false"
        let v33 = atom.create(v32)
        let v34 = erlang_term_coerce(v33)
        let v36 = atom.create("active")
        let v37 = erlang_term_coerce(v36)
        let v38 = []
        let v39 = [v34, ..v38]
        let v40 = [v37, ..v39]
        let v41 = erlang_term_tuple(v40)
        let v42 = erlang_term_coerce(8000000)
        let v44 = atom.create("packet_size")
        let v45 = erlang_term_coerce(v44)
        let v46 = []
        let v47 = [v42, ..v46]
        let v48 = [v45, ..v47]
        let v49 = erlang_term_tuple(v48)
        let v50 = []
        let v51 = [v49, ..v50]
        let v52 = [v41, ..v51]
        let v53 = [v31, ..v52]
        let v54 = [v21, ..v53]
        let v55 = erlang_term_coerce(v54)
        let v56 = erlang_term_coerce(1000)
        let v57 = "gen_tcp"
        let v58 = atom.create(v57)
        let v60 = atom.create("connect")
        let v61 = []
        let v62 = [v56, ..v61]
        let v63 = [v55, ..v62]
        let v64 = [v18, ..v63]
        let v65 = [v17, ..v64]
        let v66 = erlang_term_apply(v58, v60, v65)
        let v67 = erlang_term_coerce(1)
        let v68 = "erlang"
        let v69 = atom.create(v68)
        let v70 = "element"
        let v71 = atom.create(v70)
        let v72 = []
        let v73 = [v66, ..v72]
        let v74 = [v67, ..v73]
        let v75 = erlang_term_apply(v69, v71, v74)
        let v76 = "ok"
        let v77 = atom.create(v76)
        let v78 = erlang_term_coerce(v77)
        let v79 = v75 == v78
        let v116 =
            case v79 {
                True -> {
                    let v80 = erlang_term_coerce(2)
                    let v81 = atom.create(v68)
                    let v82 = atom.create(v70)
                    let v83 = []
                    let v84 = [v66, ..v83]
                    let v85 = [v80, ..v84]
                    let v86 = erlang_term_apply(v81, v82, v85)
                    Us72Ok(v86)
                }
                False -> {
                    let v88 = erlang_term_coerce(2)
                    let v89 = atom.create(v68)
                    let v90 = atom.create(v70)
                    let v91 = []
                    let v92 = [v66, ..v91]
                    let v93 = [v88, ..v92]
                    let v94 = erlang_term_apply(v89, v90, v93)
                    let v96 = atom.create("econnrefused")
                    let v97 = erlang_term_coerce(v96)
                    let v98 = v94 == v97
                    let v114 =
                        case v98 {
                            True -> Us73Refused
                            False -> {
                                let v101 = atom.create("timeout")
                                let v102 = erlang_term_coerce(v101)
                                let v103 = v94 == v102
                                case v103 {
                                    True -> Us73TimedOut
                                    False -> {
                                        let v106 = atom.create("closed")
                                        let v107 = erlang_term_coerce(v106)
                                        let v108 = v94 == v107
                                        case v108 {
                                            True -> Us73Closed
                                            False -> {
                                                let v110 = string.inspect(v94)
                                                Us73Failed(v110)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    Us72Error(v114)
                }
            }
        let v122 =
            case v116  {
                Us72Error(v119) -> Us74Error(v119)
                Us72Ok(v117) -> Us74Ok(v117)
            }
        let v251 =
            case v122  {
                Us74Error(v248) -> {
                    ""
                }
                Us74Ok(v123) -> {
                    let v125 = erlang_term_coerce("hello\n")
                    let v126 = atom.create(v57)
                    let v128 = atom.create("send")
                    let v129 = []
                    let v130 = [v125, ..v129]
                    let v131 = [v123, ..v130]
                    let v132 = erlang_term_apply(v126, v128, v131)
                    let v133 = atom.create(v76)
                    let v134 = erlang_term_coerce(v133)
                    let v135 = v132 == v134
                    let _v165 =
                        case v135 {
                            True -> Us75Ok
                            False -> {
                                let v137 = erlang_term_coerce(2)
                                let v138 = atom.create(v68)
                                let v139 = atom.create(v70)
                                let v140 = []
                                let v141 = [v132, ..v140]
                                let v142 = [v137, ..v141]
                                let v143 = erlang_term_apply(v138, v139, v142)
                                let v145 = atom.create("econnrefused")
                                let v146 = erlang_term_coerce(v145)
                                let v147 = v143 == v146
                                let v163 =
                                    case v147 {
                                        True -> Us73Refused
                                        False -> {
                                            let v150 = atom.create("timeout")
                                            let v151 = erlang_term_coerce(v150)
                                            let v152 = v143 == v151
                                            case v152 {
                                                True -> Us73TimedOut
                                                False -> {
                                                    let v155 = atom.create("closed")
                                                    let v156 = erlang_term_coerce(v155)
                                                    let v157 = v143 == v156
                                                    case v157 {
                                                        True -> Us73Closed
                                                        False -> {
                                                            let v159 = string.inspect(v143)
                                                            Us73Failed(v159)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                Us75Error(v163)
                            }
                        }
                    let v166 = erlang_term_coerce(0)
                    let v167 = erlang_term_coerce(2000)
                    let v168 = atom.create(v57)
                    let v170 = atom.create("recv")
                    let v171 = []
                    let v172 = [v167, ..v171]
                    let v173 = [v166, ..v172]
                    let v174 = [v123, ..v173]
                    let v175 = erlang_term_apply(v168, v170, v174)
                    let v176 = erlang_term_coerce(1)
                    let v177 = atom.create(v68)
                    let v178 = atom.create(v70)
                    let v179 = []
                    let v180 = [v175, ..v179]
                    let v181 = [v176, ..v180]
                    let v182 = erlang_term_apply(v177, v178, v181)
                    let v183 = atom.create(v76)
                    let v184 = erlang_term_coerce(v183)
                    let v185 = v182 == v184
                    let v222 =
                        case v185 {
                            True -> {
                                let v186 = erlang_term_coerce(2)
                                let v187 = atom.create(v68)
                                let v188 = atom.create(v70)
                                let v189 = []
                                let v190 = [v175, ..v189]
                                let v191 = [v186, ..v190]
                                let v192 = erlang_term_apply(v187, v188, v191)
                                Us72Ok(v192)
                            }
                            False -> {
                                let v194 = erlang_term_coerce(2)
                                let v195 = atom.create(v68)
                                let v196 = atom.create(v70)
                                let v197 = []
                                let v198 = [v175, ..v197]
                                let v199 = [v194, ..v198]
                                let v200 = erlang_term_apply(v195, v196, v199)
                                let v202 = atom.create("econnrefused")
                                let v203 = erlang_term_coerce(v202)
                                let v204 = v200 == v203
                                let v220 =
                                    case v204 {
                                        True -> Us73Refused
                                        False -> {
                                            let v207 = atom.create("timeout")
                                            let v208 = erlang_term_coerce(v207)
                                            let v209 = v200 == v208
                                            case v209 {
                                                True -> Us73TimedOut
                                                False -> {
                                                    let v212 = atom.create("closed")
                                                    let v213 = erlang_term_coerce(v212)
                                                    let v214 = v200 == v213
                                                    case v214 {
                                                        True -> Us73Closed
                                                        False -> {
                                                            let v216 = string.inspect(v200)
                                                            Us73Failed(v216)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                Us72Error(v220)
                            }
                        }
                    let v236 =
                        case v222  {
                            Us72Error(v233) -> Us76Error(v233)
                            Us72Ok(v223) -> {
                                let v225 = atom.create("string")
                                let v227 = atom.create("trim")
                                let v228 = []
                                let v229 = [v223, ..v228]
                                let v230 = erlang_term_apply(v225, v227, v229)
                                let v231 = erlang_term_coerce(v230)
                                Us76Ok(v231)
                            }
                        }
                    let v237 = atom.create(v57)
                    let v239 = atom.create("close")
                    let v240 = []
                    let v241 = [v123, ..v240]
                    let _v242 = erlang_term_apply(v237, v239, v241)
                    case v236  {
                        Us76Error(v244) -> {
                            ""
                        }
                        Us76Ok(v243) -> v243
                    }
                }
            }
        let v252 = spiral_string_length(v251)
        let v254 = method58(v251, v252, 0)
        let v255 = spiral_wrap_signed(v252 - 1, 32)
        let v256 = spiral_string_slice(v251, v254, v255)
        let v257 = spiral_string_length(v256)
        let v258 = method59(v256, v257)
        let v259 = spiral_string_slice(v256, 0, v258)
        let v260 = v259 == ""
        let v264 =
            case v260 {
                True -> Uh3Nil
                False -> {
                    split_list_2("\t", v259)
                }
            }
        let v280 =
            case v264  {
                Uh3Cons(v265, v266) -> {
                    case v266  {
                        Uh3Cons(v267, v268) -> {
                            case v268  {
                                Uh3Cons(v269, v270) -> {
                                    let v271 = v265 == "spiral-cells"
                                    case v271 {
                                        True -> count_of_text_10(v269)
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
        case v280  {
            Us3None -> {
                ""
            }
            Us3Some(v281) -> {
                let v282 = int.to_string(v281)
                let v284 = erlang_term_coerce("pwsh")
                let v286 = atom.create("unicode")
                let v288 = atom.create("characters_to_list")
                let v289 = []
                let v290 = [v284, ..v289]
                let v291 = erlang_term_apply(v286, v288, v290)
                let v293 = atom.create("os")
                let v295 = atom.create("find_executable")
                let v296 = []
                let v297 = [v291, ..v296]
                let v298 = erlang_term_apply(v293, v295, v297)
                let v299 = atom.create(v32)
                let v300 = erlang_term_coerce(v299)
                let v301 = v298 == v300
                let #(v375, v376, v377) =
                    case v301 {
                        True -> {
                            #(False, -1, "")
                        }
                        False -> {
                            let v304 = atom.create("args")
                            let v305 = erlang_term_coerce(v304)
                            let v306 = v0 == ""
                            let v318 =
                                case v306 {
                                    True -> {
                                        let v310 = Uh3Cons("-NoProfile", Uh3Nil)
                                        Uh3Cons("-File", v310)
                                    }
                                    False -> {
                                        let v315 = Uh3Cons("-NoProfile", Uh3Nil)
                                        let v316 = Uh3Cons("-File", v315)
                                        Uh3Cons(v0, v316)
                                    }
                                }
                            let v319 = v282 == ""
                            let v325 =
                                case v319 {
                                    True -> {
                                        Uh3Cons("-Root", v318)
                                    }
                                    False -> {
                                        let v323 = Uh3Cons("-Root", v318)
                                        Uh3Cons(v282, v323)
                                    }
                                }
                            let v327 = method4(v325, Uh3Nil)
                            let v329 = method307(v327, Uh30Nil)
                            let v330 = []
                            let v331 = method302(v329, v330)
                            let v332 = erlang_term_coerce(v331)
                            let v333 = []
                            let v334 = [v332, ..v333]
                            let v335 = [v305, ..v334]
                            let v336 = erlang_term_tuple(v335)
                            let v337 = atom.create(v19)
                            let v338 = erlang_term_coerce(v337)
                            let v340 = atom.create("exit_status")
                            let v341 = erlang_term_coerce(v340)
                            let v343 = atom.create("stderr_to_stdout")
                            let v344 = erlang_term_coerce(v343)
                            let v346 = atom.create("hide")
                            let v347 = erlang_term_coerce(v346)
                            let v349 = atom.create("spawn_executable")
                            let v350 = erlang_term_coerce(v349)
                            let v351 = []
                            let v352 = [v298, ..v351]
                            let v353 = [v350, ..v352]
                            let v354 = erlang_term_tuple(v353)
                            let v355 = []
                            let v356 = [v336, ..v355]
                            let v357 = [v341, ..v356]
                            let v358 = [v338, ..v357]
                            let v359 = [v344, ..v358]
                            let v360 = [v347, ..v359]
                            let v361 = erlang_term_coerce(v360)
                            let v362 = atom.create(v68)
                            let v364 = atom.create("open_port")
                            let v365 = []
                            let v366 = [v361, ..v365]
                            let v367 = [v354, ..v366]
                            let v368 = erlang_term_apply(v362, v364, v367)
                            let v369 = erlang_term_coerce(v368)
                            let v370 = keep_c81(Nil)
                            let v371 = process.select_record(process.new_selector(), v369, 1, v370)
                            let #(v373, v374) = gleam_collected_308(v371, "")
                            #(True, v373, v374)
                        }
                    }
                let v379 =
                    case v375 {
                        True -> {
                            v376 == 0
                        }
                        False -> False
                    }
                let v382 =
                    case v379 {
                        True -> Us2Some(v377)
                        False -> Us2None
                    }
                case v382  {
                    Us2None -> {
                        ""
                    }
                    Us2Some(v383) -> v383
                }
            }
        }
    }
}

pub fn closure79(capt: #(String)) -> fn(process.Subject(Us70)) -> #(Int, Int, Int, Int, Int, Us71, Int, process.Subject(Us70)) {
    fn (v1) {
        let #(v0) = capt
        let v2 = closure80(#(v0))
        let v3 = Us71FreshLine(v2)
        #(0, 0, 0, 0, 0, v3, 1000, v1)
    }
}

pub fn method309(v0: Uh3, v1: Int, v2: Int, v3: Int, v4: Int) -> #(Int, Int, Int, Int) {
    let #(v62, v63, v64, v65) =
        case v0  {
            Uh3Cons(v5, v6) -> {
                let v7 = spiral_string_length(v5)
                let v9 = method58(v5, v7, 0)
                let v10 = spiral_wrap_signed(v7 - 1, 32)
                let v11 = spiral_string_slice(v5, v9, v10)
                let v12 = spiral_string_length(v11)
                let v13 = method59(v11, v12)
                let v14 = spiral_string_slice(v11, 0, v13)
                let v15 = v14 == ""
                let v19 =
                    case v15 {
                        True -> Uh3Nil
                        False -> {
                            split_list_2(" ", v14)
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
                method309(v6, v50, v51, v52, v53)
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
                actor.continue(#(v0, v1, v2, v3, v4, v5, v6, v7))
            }
            Us70Tick -> {
                let _v10 = process.send_after(v7, v6, Us70Tick)
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
                                        bit_array.byte_size(bit_array.from_string(v19))
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
                                                spiral_wrap_signed(v25 - v27, 32)
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
                            let #(v38, v39, v40, v41) = method309(v37, v0, v1, v2, v3)
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
                                                    split_list_2("\n", v45)
                                                }
                                            }
                                        let #(v51, v52, v53, v54) = method309(v50, v0, v1, v2, v3)
                                        #(v51, v52, v53, v54, v4, v5, v6, v7)
                                    }
                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                }
                            #(v55, v56, v57, v58, v59, v60, v61, v62)
                        }
                    }
                actor.continue(#(v63, v64, v65, v66, v67, v68, v69, v70))
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
        Uh3Cons("  daemon watch did not start", Uh3Nil)
    }
}

pub fn closure86(capt: Nil) -> fn(process.Subject(#(Int, Int, Int, Int))) -> Us70 {
    fn (v0) {
        Us70Peak(v0)
    }
}
