import gleam/bit_array
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh19, type Uh20, type Uh21, type Us26, type Uh23, type Uh22, type Uh24, type Uh25, type Uh26, type Uh27, Uh19Cons, Uh19Nil, Uh20Nil, Uh21Nil, Uh22Cons, Uh22Nil, Uh23Cons, Uh23Nil, Uh26Cons, Uh26Nil, Uh27Cons, Uh27Nil, Uh3Cons, Uh3Nil, Uh7Nil, Us0None, Us0Some, Us26None, Us26Some, Us3None, Us3Some}
import xsim_frames/part1.{closure1, count_of_text_7, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part2.{delimited_19, method15, method17}
import xsim_frames/part4.{method52, method53}
import xsim_frames/part6.{from_cells_61, quoted_116, stream_113}
import xsim_frames/part7.{closure16, deliveries_126, exploded_135}
import xsim_frames/part8.{final_replay_144, method155, method156}
import xsim_frames/part9.{materialized_157, method179, method189, method193, method194, method197, method200, method201, method204, method205, method206, method207, shared_layout_202}

pub fn method199(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh19, v9: Uh20, v10: Int, v11: Int, v12: String, v13: String, v14: Int, v15: Int, v16: Us26, v17: Uh23, v18: Uh23, v19: Uh3) -> Uh3 {
    case v18  {
        Uh23Cons(v20, v21, v22, v23) -> {
            let v24 = method199(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v23, v19)
            let v29 =
                case v5  {
                    Us26None -> {
                        let v27 = "null"
                        v27
                    }
                    Us26Some(v25) -> {
                        quoted_116(v25)
                    }
                }
            let v30 = "conversation_id"
            let v31 = quoted_116(v30)
            let v32 = ": "
            let v33 = v31 <> v32 
            let v34 = v33 <> v29 
            let v35 = spiral_wrap_signed(v11 + v21, 32)
            let v36 = v35 / 86400
            let v37 = spiral_wrap_signed(v10 + v36, 32)
            let v38 = spiral_wrap_signed(v37 + 719468, 32)
            let v39 = v38 % 146097
            let v40 = v39 / 1460
            let v41 = spiral_wrap_signed(v39 - v40, 32)
            let v42 = v39 / 36524
            let v43 = spiral_wrap_signed(v41 + v42, 32)
            let v44 = v39 / 146096
            let v45 = spiral_wrap_signed(v43 - v44, 32)
            let v46 = v45 / 365
            let v47 = v38 / 146097
            let v48 = spiral_wrap_signed(v47 * 400, 32)
            let v49 = spiral_wrap_signed(v46 + v48, 32)
            let v50 = spiral_wrap_signed(365 * v46, 32)
            let v51 = v46 / 4
            let v52 = spiral_wrap_signed(v50 + v51, 32)
            let v53 = v46 / 100
            let v54 = spiral_wrap_signed(v52 - v53, 32)
            let v55 = spiral_wrap_signed(v39 - v54, 32)
            let v56 = spiral_wrap_signed(5 * v55, 32)
            let v57 = spiral_wrap_signed(v56 + 2, 32)
            let v58 = v57 / 153
            let v59 = v58 < 10
            let v62 =
                case v59 {
                    True -> {
                        let v60 = spiral_wrap_signed(v58 + 3, 32)
                        v60
                    }
                    False -> {
                        let v61 = spiral_wrap_signed(v58 - 9, 32)
                        v61
                    }
                }
            let v63 = v62 <= 2
            let v65 =
                case v63 {
                    True -> {
                        let v64 = spiral_wrap_signed(v49 + 1, 32)
                        v64
                    }
                    False -> {
                        v49
                    }
                }
            let v66 = spiral_wrap_signed(153 * v58, 32)
            let v67 = spiral_wrap_signed(v66 + 2, 32)
            let v68 = v67 / 5
            let v69 = spiral_wrap_signed(v55 - v68, 32)
            let v70 = spiral_wrap_signed(v69 + 1, 32)
            let v71 = string.inspect(v65)
            let v72 = spiral_string_length(v71)
            let v73 = spiral_wrap_signed(4 - v72, 32)
            let v74 = 0
            let v75 = method200(v73, v74)
            let v76 = ""
            let v77 = v75(v76)
            let v78 = v77 <> v71 
            let v79 = "-"
            let v80 = v78 <> v79 
            let v81 = string.inspect(v62)
            let v82 = spiral_string_length(v81)
            let v83 = spiral_wrap_signed(2 - v82, 32)
            let v84 = 0
            let v85 = method200(v83, v84)
            let v86 = v85(v76)
            let v87 = v86 <> v81 
            let v88 = v80 <> v87 
            let v89 = v88 <> v79 
            let v90 = string.inspect(v70)
            let v91 = spiral_string_length(v90)
            let v92 = spiral_wrap_signed(2 - v91, 32)
            let v93 = 0
            let v94 = method200(v92, v93)
            let v95 = v94(v76)
            let v96 = v95 <> v90 
            let v97 = v89 <> v96 
            let v98 = "T"
            let v99 = v97 <> v98 
            let v100 = v35 % 86400
            let v101 = v100 / 3600
            let v102 = string.inspect(v101)
            let v103 = spiral_string_length(v102)
            let v104 = spiral_wrap_signed(2 - v103, 32)
            let v105 = 0
            let v106 = method200(v104, v105)
            let v107 = v106(v76)
            let v108 = v107 <> v102 
            let v109 = ":"
            let v110 = v108 <> v109 
            let v111 = v100 / 60
            let v112 = v111 % 60
            let v113 = string.inspect(v112)
            let v114 = spiral_string_length(v113)
            let v115 = spiral_wrap_signed(2 - v114, 32)
            let v116 = 0
            let v117 = method200(v115, v116)
            let v118 = v117(v76)
            let v119 = v118 <> v113 
            let v120 = v110 <> v119 
            let v121 = v120 <> v109 
            let v122 = v100 % 60
            let v123 = string.inspect(v122)
            let v124 = spiral_string_length(v123)
            let v125 = spiral_wrap_signed(2 - v124, 32)
            let v126 = 0
            let v127 = method200(v125, v126)
            let v128 = v127(v76)
            let v129 = v128 <> v123 
            let v130 = v121 <> v129 
            let v131 = v99 <> v130 
            let v132 = ".000Z"
            let v133 = v131 <> v132 
            let v134 = quoted_116(v133)
            let v135 = "created_at"
            let v136 = quoted_116(v135)
            let v137 = v136 <> v32 
            let v138 = v137 <> v134 
            let v139 = Uh3Nil
            let v140 = method201(v17, v139)
            let v141 = "["
            let v142 = "]"
            let v143 = 5
            let v144 = shared_layout_202(v140, v141, v142, v143)
            let v145 = "edit_history"
            let v146 = quoted_116(v145)
            let v147 = v146 <> v32 
            let v148 = v147 <> v144 
            let v149 = quoted_116(v20)
            let v150 = "id"
            let v151 = quoted_116(v150)
            let v152 = v151 <> v32 
            let v153 = v152 <> v149 
            let v154 = v14 != 1
            let v161 =
                case v154 {
                    True -> {
                        0
                    }
                    False -> {
                        let v155 = Uh20Nil
                        let v156 = method204(v13, v9, v155)
                        let v157 = Uh3Nil
                        let v158 = method205(v156, v157)
                        let v159 = 0
                        method17(v158, v159)
                    }
                }
            let v162 = string.inspect(v161)
            let v163 = "like_count"
            let v164 = quoted_116(v163)
            let v165 = v164 <> v32 
            let v166 = v165 <> v162 
            let v167 = Uh22Nil
            let v168 = method206(v12, v2, v167)
            let v169 = 0
            let v170 = method207(v168, v169)
            let v171 = string.inspect(v170)
            let v172 = "reply_count"
            let v173 = quoted_116(v172)
            let v174 = v173 <> v32 
            let v175 = v174 <> v171 
            let v176 = Uh3Nil
            let v177 = Uh3Cons(v175, v176)
            let v178 = Uh3Cons(v166, v177)
            let v179 = "{"
            let v180 = "}"
            let v181 = 5
            let v182 = shared_layout_202(v178, v179, v180, v181)
            let v183 = "metrics"
            let v184 = quoted_116(v183)
            let v185 = v184 <> v32 
            let v186 = v185 <> v182 
            let v209 =
                case v16  {
                    Us26None -> {
                        let v207 = "[]"
                        v207
                    }
                    Us26Some(v187) -> {
                        let v188 = quoted_116(v187)
                        let v189 = quoted_116(v150)
                        let v190 = v189 <> v32 
                        let v191 = v190 <> v188 
                        let v192 = "replied_to"
                        let v193 = quoted_116(v192)
                        let v194 = "type"
                        let v195 = quoted_116(v194)
                        let v196 = v195 <> v32 
                        let v197 = v196 <> v193 
                        let v198 = Uh3Nil
                        let v199 = Uh3Cons(v197, v198)
                        let v200 = Uh3Cons(v191, v199)
                        let v201 = 6
                        let v202 = shared_layout_202(v200, v179, v180, v201)
                        let v203 = Uh3Nil
                        let v204 = Uh3Cons(v202, v203)
                        let v205 = 5
                        shared_layout_202(v204, v141, v142, v205)
                    }
                }
            let v210 = "refs"
            let v211 = quoted_116(v210)
            let v212 = v211 <> v32 
            let v213 = v212 <> v209 
            let v214 = quoted_116(v22)
            let v215 = "text"
            let v216 = quoted_116(v215)
            let v217 = v216 <> v32 
            let v218 = v217 <> v214 
            let v219 = Uh3Nil
            let v220 = Uh3Cons(v218, v219)
            let v221 = Uh3Cons(v213, v220)
            let v222 = Uh3Cons(v186, v221)
            let v223 = Uh3Cons(v153, v222)
            let v224 = Uh3Cons(v148, v223)
            let v225 = Uh3Cons(v138, v224)
            let v226 = Uh3Cons(v34, v225)
            let v227 = 4
            let v228 = shared_layout_202(v226, v179, v180, v227)
            Uh3Cons(v228, v24)
        }
        Uh23Nil -> {
            v19
        }
    }
}

pub fn method198(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh19, v9: Uh20, v10: Int, v11: Int, v12: Uh22, v13: Uh3) -> Uh3 {
    case v12  {
        Uh22Cons(v14, v15, v16, v17, v18, v19, v20) -> {
            let v21 = method198(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v20, v13)
            let v22 = Uh3Nil
            let v23 = method199(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v14, v15, v16, v17, v18, v19, v19, v22)
            method15(v23, v21)
        }
        Uh22Nil -> {
            v13
        }
    }
}

pub fn method210(v0: Uh22, v1: Uh27) -> Uh27 {
    case v0  {
        Uh22Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method210(v8, v1)
            Uh27Cons(v2, v9)
        }
        Uh22Nil -> {
            v1
        }
    }
}

pub fn closure26(capt: #(String)) -> fn(String) -> Bool {
    fn (v1) {
        let #(v0) = capt
        let v2 = v0 == v1
        v2
    }
}

pub fn method211(v0: String) -> fn(String) -> Bool {
    closure26(#(v0))
}

pub fn method212(v0: String, v1: fn(String) -> Bool, v2: Uh27) -> Bool {
    case v2  {
        Uh27Cons(v3, v4) -> {
            let v5 = v1(v3)
            case v5 {
                True -> {
                    True
                }
                False -> {
                    let v6 = method211(v0)
                    method212(v0, v6, v4)
                }
            }
        }
        Uh27Nil -> {
            False
        }
    }
}

pub fn method209(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh22, v9: Uh26) -> Uh26 {
    case v8  {
        Uh22Cons(v10, v11, v12, v13, v14, v15, v16) -> {
            let v17 = method209(v0, v1, v2, v3, v4, v5, v6, v7, v16, v9)
            let v31 =
                case v14  {
                    Us26Some(v18) -> {
                        let v19 = v12 == 1
                        let v25 =
                            case v19 {
                                True -> {
                                    let v20 = Uh27Nil
                                    let v21 = method210(v2, v20)
                                    let v22 = method211(v18)
                                    let v23 = method212(v18, v22, v21)
                                    let v24 = v23 == False
                                    v24
                                }
                                False -> {
                                    False
                                }
                            }
                        case v25 {
                            True -> {
                                let v26 = Uh26Nil
                                Uh26Cons(v11, v26)
                            }
                            False -> {
                                Uh26Nil
                            }
                        }
                    }
                    _ -> {
                        Uh26Nil
                    }
                }
            method189(v31, v17)
        }
        Uh22Nil -> {
            v9
        }
    }
}

pub fn gaps_208(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26) -> Uh26 {
    let v8 = Uh22Nil
    let v9 = method197(v0, v1, v2, v3, v4, v5, v6, v7, v3, v8)
    let v10 = Uh26Nil
    method209(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10)
}

pub fn method213(v0: Uh26, v1: Uh3) -> Uh3 {
    case v0  {
        Uh26Cons(v2, v3) -> {
            let v4 = method213(v3, v1)
            Uh3Cons(v2, v4)
        }
        Uh26Nil -> {
            v1
        }
    }
}

pub fn method214(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method214(v3, v1)
            let v5 = quoted_116(v2)
            Uh3Cons(v5, v4)
        }
        Uh3Nil -> {
            v1
        }
    }
}

pub fn method216(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh26, v9: Uh26) -> Uh26 {
    case v8  {
        Uh26Cons(v10, v11) -> {
            let v12 = method216(v0, v1, v2, v3, v4, v5, v6, v7, v11, v9)
            let v13 = method193(v10)
            let v14 = method194(v10, v13, v6)
            let v15 = v14 == False
            let v19 =
                case v15 {
                    True -> {
                        let v16 = method193(v10)
                        let v17 = method194(v10, v16, v7)
                        let v18 = v17 == False
                        v18
                    }
                    False -> {
                        False
                    }
                }
            case v19 {
                True -> {
                    Uh26Cons(v10, v12)
                }
                False -> {
                    v12
                }
            }
        }
        Uh26Nil -> {
            v9
        }
    }
}

pub fn method218(v0: String, v1: Uh22, v2: Uh22) -> Uh22 {
    case v1  {
        Uh22Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method218(v0, v9, v2)
            let v11 = v4 == v0
            case v11 {
                True -> {
                    Uh22Cons(v3, v4, v5, v6, v7, v8, v10)
                }
                False -> {
                    v10
                }
            }
        }
        Uh22Nil -> {
            v2
        }
    }
}

pub fn by_k_220(v0: String, v1: String, v2: Int, v3: Int, v4: Us26, v5: Uh23, v6: Uh22) -> Uh22 {
    case v6  {
        Uh22Cons(v7, v8, v9, v10, v11, v12, v13) -> {
            let v14 = v9 < v2
            case v14 {
                True -> {
                    let v15 = by_k_220(v0, v1, v2, v3, v4, v5, v13)
                    Uh22Cons(v7, v8, v9, v10, v11, v12, v15)
                }
                False -> {
                    Uh22Cons(v0, v1, v2, v3, v4, v5, v6)
                }
            }
        }
        _ -> {
            Uh22Cons(v0, v1, v2, v3, v4, v5, v6)
        }
    }
}

pub fn method219(v0: Uh22, v1: Uh22) -> Uh22 {
    case v0  {
        Uh22Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = by_k_220(v2, v3, v4, v5, v6, v7, v1)
            method219(v8, v9)
        }
        Uh22Nil -> {
            v1
        }
    }
}

pub fn method222(v0: Uh23, v1: String) -> String {
    case v0  {
        Uh23Cons(v2, v3, v4, v5) -> {
            method222(v5, v4)
        }
        Uh23Nil -> {
            v1
        }
    }
}

pub fn restored_text_223(v0: String) -> String {
    let v1 = unicode_erlang_characters_to_binary([8203])
    let v2 = "."
    let v3 = v1 <> v2 
    let v4 = v0 |> string.replace(v3, v2)
    let v5 = unicode_erlang_characters_to_binary([8203])
    let v6 = "@"
    let v7 = v6 <> v5 
    let v8 = v4 |> string.replace(v7, v6)
    let v9 = unicode_erlang_characters_to_binary([8203])
    let v10 = "#"
    let v11 = v10 <> v9 
    let v12 = v8 |> string.replace(v11, v10)
    let v13 = unicode_erlang_characters_to_binary([8203])
    let v14 = "$"
    let v15 = v14 <> v13 
    let v16 = v12 |> string.replace(v15, v14)
    v16
}

pub fn method221(v0: Uh22, v1: Uh3) -> Uh3 {
    case v0  {
        Uh22Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method221(v8, v1)
            let v10 = ""
            let v11 = method222(v7, v10)
            let v12 = "\n"
            let v13 = option.from_result(result.map(string.split_once(v11, v12), pair.first))
            let v14 = closure1(Nil)
            let v15 = v13 |> option.map(v14)
            let v16 = Us0None
            let v17 = v15 |> option.unwrap(v16)
            let v21 =
                case v17  {
                    Us0None -> {
                        -1
                    }
                    Us0Some(v18) -> {
                        let v19 = bit_array.byte_size(bit_array.from_string(v18))
                        v19
                    }
                }
            let v22 = v21 < 0
            let v30 =
                case v22 {
                    True -> {
                        v10
                    }
                    False -> {
                        let v23 = spiral_wrap_signed(v21 + 1, 32)
                        let v24 = spiral_string_length(v11)
                        let v25 = spiral_wrap_signed(v24 - v23, 32)
                        let v26 = spiral_wrap_signed(v23 + v25, 32)
                        let v27 = spiral_wrap_signed(v26 - 1, 32)
                        let v28 = spiral_string_slice(v11, v23, v27)
                        restored_text_223(v28)
                    }
                }
            Uh3Cons(v30, v9)
        }
        Uh22Nil -> {
            v1
        }
    }
}

pub fn method217(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh26, v9: Uh3) -> Uh3 {
    case v8  {
        Uh26Cons(v10, v11) -> {
            let v12 = method217(v0, v1, v2, v3, v4, v5, v6, v7, v11, v9)
            let v13 = Uh22Nil
            let v14 = method218(v10, v2, v13)
            let v15 = Uh22Nil
            let v16 = method219(v14, v15)
            let v17 = Uh3Nil
            let v18 = method221(v16, v17)
            let v19 = ""
            let v20 = delimited_19(v19, v18)
            Uh3Cons(v20, v12)
        }
        Uh26Nil -> {
            v9
        }
    }
}

pub fn program_215(v0: Uh21, v1: Int, v2: Int, v3: Uh22, v4: Uh24, v5: Uh25, v6: Us26, v7: Uh26, v8: Uh26) -> String {
    let v9 = Uh26Nil
    let v10 = method179(v0, v9)
    let v11 = Uh26Nil
    let v12 = method216(v1, v2, v3, v4, v5, v6, v7, v8, v10, v11)
    let v13 = Uh3Nil
    let v14 = method217(v1, v2, v3, v4, v5, v6, v7, v8, v12, v13)
    let v15 = "\n\n"
    delimited_19(v15, v14)
}

pub fn world_files_143(v0: Int, v1: Int, v2: String, v3: Int, v4: Int, v5: Int, v6: String, v7: String, v8: String, v9: fn(String) -> fn(Int) -> fn(String) -> Uh3, v10: Uh3) -> #(String, String) {
    let v11 = ","
    let v12 = "+"
    let v13 = v2 |> string.replace(v11, v12)
    let v14 = v13 == ""
    let v17 =
        case v14 {
            True -> {
                Uh3Nil
            }
            False -> {
                split_list_2(v12, v13)
            }
        }
    let v18 = Uh3Nil
    let v19 = method52(v17, v18)
    let v20 = Uh7Nil
    let v21 = method53(v19, v20)
    let v22 = 8
    let v23 = 0
    let v24 = 0
    let v25 = False
    let v26 = ""
    let #(_v27, v28, _v29) = from_cells_61(v0, v22, v1, v23, v24, v21, v25, v26, v10)
    let #(v30, v31) = final_replay_144(v28)
    let v32 = Uh19Nil
    let v33 = method155(v30, v32)
    let v34 = Uh21Nil
    let v35 = method156(v33, v34)
    let #(v36, v37, v38, v39, v40, v41, v42, v43) = materialized_157(v9, v35, v3, v4, v5)
    let v44 = spiral_string_slice(v6, 0, 3)
    let v45 = count_of_text_7(v44)
    let v48 =
        case v45  {
            Us3None -> {
                0
            }
            Us3Some(v46) -> {
                v46
            }
        }
    let v49 = spiral_string_slice(v6, 5, 6)
    let v50 = count_of_text_7(v49)
    let v53 =
        case v50  {
            Us3None -> {
                0
            }
            Us3Some(v51) -> {
                v51
            }
        }
    let v54 = spiral_string_slice(v6, 8, 9)
    let v55 = count_of_text_7(v54)
    let v58 =
        case v55  {
            Us3None -> {
                0
            }
            Us3Some(v56) -> {
                v56
            }
        }
    let v59 = v53 <= 2
    let v61 =
        case v59 {
            True -> {
                let v60 = spiral_wrap_signed(v48 - 1, 32)
                v60
            }
            False -> {
                v48
            }
        }
    let v62 = v61 % 400
    let v63 = v61 / 400
    let v64 = spiral_wrap_signed(v63 * 146097, 32)
    let v65 = spiral_wrap_signed(v62 * 365, 32)
    let v66 = spiral_wrap_signed(v64 + v65, 32)
    let v67 = v62 / 4
    let v68 = spiral_wrap_signed(v66 + v67, 32)
    let v69 = v62 / 100
    let v70 = spiral_wrap_signed(v68 - v69, 32)
    let v71 = v53 > 2
    let v74 =
        case v71 {
            True -> {
                let v72 = spiral_wrap_signed(v53 - 3, 32)
                v72
            }
            False -> {
                let v73 = spiral_wrap_signed(v53 + 9, 32)
                v73
            }
        }
    let v75 = spiral_wrap_signed(153 * v74, 32)
    let v76 = spiral_wrap_signed(v75 + 2, 32)
    let v77 = v76 / 5
    let v78 = spiral_wrap_signed(v77 + v58, 32)
    let v79 = spiral_wrap_signed(v78 - 1, 32)
    let v80 = spiral_wrap_signed(v70 + v79, 32)
    let v81 = spiral_wrap_signed(v80 - 719468, 32)
    let v82 = spiral_string_slice(v6, 11, 12)
    let v83 = count_of_text_7(v82)
    let v86 =
        case v83  {
            Us3None -> {
                0
            }
            Us3Some(v84) -> {
                v84
            }
        }
    let v87 = spiral_wrap_signed(v86 * 3600, 32)
    let v88 = spiral_string_slice(v6, 14, 15)
    let v89 = count_of_text_7(v88)
    let v92 =
        case v89  {
            Us3None -> {
                0
            }
            Us3Some(v90) -> {
                v90
            }
        }
    let v93 = spiral_wrap_signed(v92 * 60, 32)
    let v94 = spiral_wrap_signed(v87 + v93, 32)
    let v95 = spiral_string_slice(v6, 17, 18)
    let v96 = count_of_text_7(v95)
    let v99 =
        case v96  {
            Us3None -> {
                0
            }
            Us3Some(v97) -> {
                v97
            }
        }
    let v100 = spiral_wrap_signed(v94 + v99, 32)
    let v101 = Uh22Nil
    let v102 = method197(v36, v37, v38, v39, v40, v41, v42, v43, v39, v101)
    let v103 = Uh3Nil
    let v104 = method198(v36, v37, v38, v39, v40, v41, v42, v43, v30, v31, v81, v100, v102, v103)
    let v105 = quoted_116(v7)
    let v106 = "id"
    let v107 = quoted_116(v106)
    let v108 = ": "
    let v109 = v107 <> v108 
    let v110 = v109 <> v105 
    let v111 = quoted_116(v8)
    let v112 = "name"
    let v113 = quoted_116(v112)
    let v114 = v113 <> v108 
    let v115 = v114 <> v111 
    let v116 = "["
    let v117 = "]"
    let v118 = 3
    let v119 = shared_layout_202(v104, v116, v117, v118)
    let v120 = "posts"
    let v121 = quoted_116(v120)
    let v122 = v121 <> v108 
    let v123 = v122 <> v119 
    let v124 = quoted_116(v8)
    let v125 = "username"
    let v126 = quoted_116(v125)
    let v127 = v126 <> v108 
    let v128 = v127 <> v124 
    let v129 = Uh3Nil
    let v130 = Uh3Cons(v128, v129)
    let v131 = Uh3Cons(v123, v130)
    let v132 = Uh3Cons(v115, v131)
    let v133 = Uh3Cons(v110, v132)
    let v134 = "{"
    let v135 = "}"
    let v136 = 2
    let v137 = shared_layout_202(v133, v134, v135, v136)
    let v138 = Uh3Nil
    let v139 = Uh3Cons(v137, v138)
    let v140 = 1
    let v141 = shared_layout_202(v139, v116, v117, v140)
    let v142 = "users"
    let v143 = quoted_116(v142)
    let v144 = v143 <> v108 
    let v145 = v144 <> v141 
    let v146 = Uh3Nil
    let v147 = Uh3Cons(v145, v146)
    let v148 = 0
    let v149 = shared_layout_202(v147, v134, v135, v148)
    let v150 = "\n"
    let v151 = v149 <> v150 
    let v152 = gaps_208(v36, v37, v38, v39, v40, v41, v42, v43)
    let v153 = Uh3Nil
    let v154 = method213(v152, v153)
    let v155 = Uh3Nil
    let v156 = method214(v154, v155)
    let v157 = 1
    let v158 = shared_layout_202(v156, v116, v117, v157)
    let v159 = "gaps"
    let v160 = quoted_116(v159)
    let v161 = v160 <> v108 
    let v162 = v161 <> v158 
    let v163 = Uh3Nil
    let v164 = method213(v42, v163)
    let v165 = Uh3Nil
    let v166 = method214(v164, v165)
    let v167 = 1
    let v168 = shared_layout_202(v166, v116, v117, v167)
    let v169 = "incomplete"
    let v170 = quoted_116(v169)
    let v171 = v170 <> v108 
    let v172 = v171 <> v168 
    let v173 = program_215(v35, v36, v37, v38, v39, v40, v41, v42, v43)
    let v174 = v173 == ""
    let v177 =
        case v174 {
            True -> {
                Uh3Nil
            }
            False -> {
                split_list_2(v150, v173)
            }
        }
    let v178 = Uh3Nil
    let v179 = method214(v177, v178)
    let v180 = 1
    let v181 = shared_layout_202(v179, v116, v117, v180)
    let v182 = "program"
    let v183 = quoted_116(v182)
    let v184 = v183 <> v108 
    let v185 = v184 <> v181 
    let v190 =
        case v41  {
            Us26None -> {
                let v188 = "null"
                v188
            }
            Us26Some(v186) -> {
                quoted_116(v186)
            }
        }
    let v191 = "root"
    let v192 = quoted_116(v191)
    let v193 = v192 <> v108 
    let v194 = v193 <> v190 
    let v195 = Uh3Nil
    let v196 = Uh3Cons(v194, v195)
    let v197 = Uh3Cons(v185, v196)
    let v198 = Uh3Cons(v172, v197)
    let v199 = Uh3Cons(v162, v198)
    let v200 = 0
    let v201 = shared_layout_202(v199, v134, v135, v200)
    let v202 = v201 <> v150 
    #(v151, v202)
}

pub fn closure19(capt: Nil) -> fn(#(String, Int, Int, String, Int, Int, Int, String, String, String)) -> #(String, String) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9) = dom
        let v10 = closure16(Nil)
        let v11 = unicode_erlang_characters_to_binary([0])
        let v12 = split_list_2(v11, v0)
        world_files_143(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v12)
    }
}

pub fn scenario_stream_224(v0: Int, v1: Int, v2: Int, v3: String, v4: Int, v5: Bool, v6: fn(String) -> fn(Int) -> fn(String) -> Uh3, v7: Uh3) -> String {
    let v8 = ","
    let v9 = "+"
    let v10 = v3 |> string.replace(v8, v9)
    let v11 = v10 == ""
    let v14 =
        case v11 {
            True -> {
                Uh3Nil
            }
            False -> {
                split_list_2(v9, v10)
            }
        }
    let v15 = Uh3Nil
    let v16 = method52(v14, v15)
    let v17 = Uh7Nil
    let v18 = method53(v16, v17)
    let v19 = 0
    let v20 = 0
    let v21 = False
    let v22 = ""
    let #(_v23, v24, _v25) = from_cells_61(v0, v1, v2, v19, v20, v18, v21, v22, v7)
    let v28 =
        case v5 {
            True -> {
                let v26 = 280
                exploded_135(v6, v26, v24)
            }
            False -> {
                v24
            }
        }
    let v29 = 1
    let v30 = 6
    let v31 = deliveries_126(v28, v29, v4, v30)
    stream_113(v31)
}

pub fn closure27(capt: Nil) -> fn(#(String, Int, Int, Int, String, Int, Bool)) -> String {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6) = dom
        let v7 = closure16(Nil)
        let v8 = unicode_erlang_characters_to_binary([0])
        let v9 = split_list_2(v8, v0)
        scenario_stream_224(v1, v2, v3, v4, v5, v6, v7, v9)
    }
}

pub fn method227(v0: Uh19, v1: Uh3) -> Uh3 {
    case v0  {
        Uh19Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method227(v6, v1)
            let v12 =
                case v3  {
                    Us0None -> {
                        let v10 = "null"
                        v10
                    }
                    Us0Some(v8) -> {
                        quoted_116(v8)
                    }
                }
            let v13 = "parent"
            let v14 = quoted_116(v13)
            let v15 = ": "
            let v16 = v14 <> v15 
            let v17 = v16 <> v12 
            let v18 = quoted_116(v2)
            let v19 = "post"
            let v20 = quoted_116(v19)
            let v21 = v20 <> v15 
            let v22 = v21 <> v18 
            let v27 =
                case v4  {
                    Uh3Cons(v23, v24) -> {
                        v23
                    }
                    Uh3Nil -> {
                        let v25 = ""
                        v25
                    }
                }
            let v28 = quoted_116(v27)
            let v29 = "source"
            let v30 = quoted_116(v29)
            let v31 = v30 <> v15 
            let v32 = v31 <> v28 
            let v33 = Uh3Nil
            let v34 = Uh3Cons(v32, v33)
            let v35 = Uh3Cons(v22, v34)
            let v36 = Uh3Cons(v17, v35)
            let v37 = "{"
            let v38 = "}"
            let v39 = 2
            let v40 = shared_layout_202(v36, v37, v38, v39)
            Uh3Cons(v40, v7)
        }
        Uh19Nil -> {
            v1
        }
    }
}
