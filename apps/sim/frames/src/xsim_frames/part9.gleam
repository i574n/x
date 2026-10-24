import gleam/bit_array
import gleam/string
import xsim_frames/types.{type Uh3, type Uh20, type Uh21, type Uh22, type Us23, type Uh24, type Uh23, type Uh25, type Uh26, type Uh27, type Uh28, Uh21Cons, Uh21Nil, Uh22Cons, Uh22Nil, Uh23Cons, Uh23Nil, Uh24Cons, Uh24Nil, Uh25Cons, Uh25Nil, Uh26Nil, Uh27Cons, Uh27Nil, Uh28Cons, Uh28Nil, Uh3Cons, Uh3Nil, Us22None, Us22Some, Us23None, Us23Some, Us25None, Us25Some}
import xsim_frames/part1.{method15, spiral_binary_split_first, spiral_string_length, spiral_string_slice, spiral_wrap_signed}
import xsim_frames/part2.{delimited_34}
import xsim_frames/part5.{quoted_111}
import xsim_frames/part7.{method144, method169, method170}
import xsim_frames/part8.{go_190, method165, method173, method184, method185, method187, method188, method189, method191, method194, method195, method197, method198}

pub fn materialized_164(v0: Uh22, v1: Int, v2: Int, v3: Int) -> #(Int, Int, Uh23, Uh25, Uh26, Us23, Uh27, Uh27) {
    let v4 = 0
    let v5 = Uh23Nil
    let v6 = Uh25Nil
    let v7 = Uh26Nil
    let v8 = Us23None
    let v9 = Uh27Nil
    let v10 = Uh27Nil
    let #(v11, v12, v13, v14, v15, v16, v17, v18) = method165(v0, v1, v4, v5, v6, v7, v8, v9, v10)
    let #(v19, v20, v21, v22, v23, v24, v25, v26) = method173(v0, v11, v12, v13, v14, v15, v16, v17, v18)
    let v33 =
        case v0  {
            Uh22Cons(v27, v28, v29, v30) -> {
                v30
            }
            Uh22Nil -> {
                Uh22Nil
            }
        }
    let v34 = Uh27Nil
    let v35 = method184(v33, v34)
    let v36 = Uh27Nil
    let v37 = method185(v19, v20, v21, v22, v23, v24, v25, v26, v35, v36)
    let v38 = v2 <= 0
    let #(v60, v61, v62, v63, v64, v65, v66, v67) =
        case v38 {
            True -> {
                #(v19, v20, v21, v22, v23, v24, v25, v26)
            }
            False -> {
                let v39 = 0
                let v40 = method187(v37, v39)
                let v41 = spiral_wrap_signed(v2 + 1, 32)
                let v42 = v40 / v41
                let v43 = v42 < 1
                let v44 =
                    case v43 {
                        True -> {
                            1
                        }
                        False -> {
                            v42
                        }
                    }
                let v45 = 0
                let v46 = Uh27Nil
                let #(_v47, v48) = method188(v44, v37, v45, v46)
                let v49 = Uh27Nil
                let v50 = method189(v48, v49)
                let v51 = go_190(v2, v50)
                let #(v52, v53, v54, v55, v56, v57, v58, v59) = method191(v51, v19, v20, v21, v22, v23, v24, v25, v26)
                #(v52, v53, v54, v55, v56, v57, v58, v59)
            }
        }
    let v68 = v3 <= 0
    let #(v89, v90, v91, v92, v93, v94, v95, v96) =
        case v68 {
            True -> {
                #(v60, v61, v62, v63, v64, v65, v66, v67)
            }
            False -> {
                let v75 =
                    case v0  {
                        Uh22Cons(v69, v70, v71, v72) -> {
                            v72
                        }
                        Uh22Nil -> {
                            Uh22Nil
                        }
                    }
                let v76 = Uh27Nil
                let v77 = method184(v75, v76)
                let v78 = Uh27Nil
                let v79 = method195(v60, v61, v62, v63, v64, v65, v66, v67, v0, v77, v78)
                let v80 = go_190(v3, v79)
                let #(v81, v82, v83, v84, v85, v86, v87, v88) = method198(v80, v60, v61, v62, v63, v64, v65, v66, v67)
                #(v81, v82, v83, v84, v85, v86, v87, v88)
            }
        }
    #(v89, v90, v91, v92, v93, v94, v95, v96)
}

pub fn method200(v0: Int, v1: Int, v2: Uh23, v3: Uh25, v4: Uh26, v5: Us23, v6: Uh27, v7: Uh27, v8: Uh25, v9: Uh23) -> Uh23 {
    case v8  {
        Uh25Cons(v10, v11, v12) -> {
            let v13 = method200(v0, v1, v2, v3, v4, v5, v6, v7, v12, v9)
            let v14 = Us25None
            let v15 = method169(v10, v11, v2, v14)
            let v26 =
                case v15  {
                    Us25None -> {
                        Uh23Nil
                    }
                    Us25Some(v16, v17, v18, v19, v20, v21) -> {
                        let v22 = Uh23Nil
                        Uh23Cons(v16, v17, v18, v19, v20, v21, v22)
                    }
                }
            method170(v26, v13)
        }
        Uh25Nil -> {
            v9
        }
    }
}

pub fn method203(v0: Int, v1: Int) -> fn(String) -> String {
    closure13(#(v0, v1))
}

pub fn closure13(capt: #(Int, Int)) -> fn(String) -> String {
    fn (v2) {
        let #(v0, v1) = capt
        let v3 = v1 >= v0
        case v3 {
            True -> {
                v2
            }
            False -> {
                let v4 = spiral_wrap_signed(v1 + 1, 32)
                let v5 = method203(v0, v4)
                let v6 = "0"
                let v7 = v2 <> v6 
                v5( v7  )
            }
        }
    }
}

pub fn method204(v0: Uh24, v1: Uh3) -> Uh3 {
    case v0  {
        Uh24Cons(v2, v3, v4, v5) -> {
            let v6 = method204(v5, v1)
            let v7 = quoted_111(v2)
            Uh3Cons(v7, v6)
        }
        Uh24Nil -> {
            v1
        }
    }
}

pub fn method206(v0: Int, v1: Int) -> fn(String) -> String {
    closure14(#(v0, v1))
}

pub fn closure14(capt: #(Int, Int)) -> fn(String) -> String {
    fn (v2) {
        let #(v0, v1) = capt
        let v3 = v1 >= v0
        case v3 {
            True -> {
                v2
            }
            False -> {
                let v4 = spiral_wrap_signed(v1 + 1, 32)
                let v5 = method206(v0, v4)
                let v6 = " "
                let v7 = v2 <> v6 
                v5( v7  )
            }
        }
    }
}

pub fn shared_layout_205(v0: Uh3, v1: String, v2: String, v3: Int) -> String {
    case v0  {
        Uh3Nil -> {
            let v4 = v1 <> v2 
            v4
        }
        _ -> {
            let v5 = v3 < 4
            case v5 {
                True -> {
                    let v6 = spiral_wrap_signed(v3 + 1, 32)
                    let v7 = spiral_wrap_signed(4 * v6, 32)
                    let v8 = 0
                    let v9 = method206(v7, v8)
                    let v10 = ""
                    let v11 = v9( v10  )
                    let v12 = "\n"
                    let v13 = v12 <> v11 
                    let v14 = v1 <> v13 
                    let v15 = ","
                    let v16 = v15 <> v13 
                    let v17 = delimited_34(v16, v0)
                    let v18 = v14 <> v17 
                    let v19 = v18 <> v12 
                    let v20 = spiral_wrap_signed(4 * v3, 32)
                    let v21 = 0
                    let v22 = method206(v20, v21)
                    let v23 = v22( v10  )
                    let v24 = v19 <> v23 
                    let v25 = v24 <> v2 
                    v25
                }
                False -> {
                    let v26 = ", "
                    let v27 = delimited_34(v26, v0)
                    let v28 = v1 <> v27 
                    let v29 = v28 <> v2 
                    v29
                }
            }
        }
    }
}

pub fn method207(v0: String, v1: Uh21, v2: Uh21) -> Uh21 {
    case v1  {
        Uh21Cons(v3, v4, v5) -> {
            let v6 = method207(v0, v5, v2)
            let v7 = v3 == v0
            case v7 {
                True -> {
                    Uh21Cons(v3, v4, v6)
                }
                False -> {
                    v6
                }
            }
        }
        Uh21Nil -> {
            v2
        }
    }
}

pub fn method208(v0: Uh21, v1: Uh3) -> Uh3 {
    case v0  {
        Uh21Cons(v2, v3, v4) -> {
            let v5 = method208(v4, v1)
            method15(v3, v5)
        }
        Uh21Nil -> {
            v1
        }
    }
}

pub fn method209(v0: String, v1: Uh23, v2: Uh23) -> Uh23 {
    case v1  {
        Uh23Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method209(v0, v9, v2)
            let v14 =
                case v7  {
                    Us23None -> {
                        False
                    }
                    Us23Some(v11) -> {
                        let v12 = v11 == v0
                        v12
                    }
                }
            case v14 {
                True -> {
                    Uh23Cons(v3, v4, v5, v6, v7, v8, v10)
                }
                False -> {
                    v10
                }
            }
        }
        Uh23Nil -> {
            v2
        }
    }
}

pub fn method210(v0: Uh23, v1: Int) -> Int {
    case v0  {
        Uh23Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = spiral_wrap_signed(v1 + 1, 32)
            method210(v8, v9)
        }
        Uh23Nil -> {
            v1
        }
    }
}

pub fn method202(v0: Int, v1: Int, v2: Uh23, v3: Uh25, v4: Uh26, v5: Us23, v6: Uh27, v7: Uh27, v8: Uh20, v9: Uh21, v10: Int, v11: Int, v12: String, v13: String, v14: Int, v15: Int, v16: Us23, v17: Uh24, v18: Uh24, v19: Uh3) -> Uh3 {
    case v18  {
        Uh24Cons(v20, v21, v22, v23) -> {
            let v24 = method202(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v23, v19)
            let v29 =
                case v5  {
                    Us23None -> {
                        let v27 = "null"
                        v27
                    }
                    Us23Some(v25) -> {
                        quoted_111(v25)
                    }
                }
            let v30 = "conversation_id"
            let v31 = quoted_111(v30)
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
            let v75 = method203(v73, v74)
            let v76 = ""
            let v77 = v75( v76  )
            let v78 = v77 <> v71 
            let v79 = "-"
            let v80 = v78 <> v79 
            let v81 = string.inspect(v62)
            let v82 = spiral_string_length(v81)
            let v83 = spiral_wrap_signed(2 - v82, 32)
            let v84 = 0
            let v85 = method203(v83, v84)
            let v86 = v85( v76  )
            let v87 = v86 <> v81 
            let v88 = v80 <> v87 
            let v89 = v88 <> v79 
            let v90 = string.inspect(v70)
            let v91 = spiral_string_length(v90)
            let v92 = spiral_wrap_signed(2 - v91, 32)
            let v93 = 0
            let v94 = method203(v92, v93)
            let v95 = v94( v76  )
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
            let v106 = method203(v104, v105)
            let v107 = v106( v76  )
            let v108 = v107 <> v102 
            let v109 = ":"
            let v110 = v108 <> v109 
            let v111 = v100 / 60
            let v112 = v111 % 60
            let v113 = string.inspect(v112)
            let v114 = spiral_string_length(v113)
            let v115 = spiral_wrap_signed(2 - v114, 32)
            let v116 = 0
            let v117 = method203(v115, v116)
            let v118 = v117( v76  )
            let v119 = v118 <> v113 
            let v120 = v110 <> v119 
            let v121 = v120 <> v109 
            let v122 = v100 % 60
            let v123 = string.inspect(v122)
            let v124 = spiral_string_length(v123)
            let v125 = spiral_wrap_signed(2 - v124, 32)
            let v126 = 0
            let v127 = method203(v125, v126)
            let v128 = v127( v76  )
            let v129 = v128 <> v123 
            let v130 = v121 <> v129 
            let v131 = v99 <> v130 
            let v132 = ".000Z"
            let v133 = v131 <> v132 
            let v134 = quoted_111(v133)
            let v135 = "created_at"
            let v136 = quoted_111(v135)
            let v137 = v136 <> v32 
            let v138 = v137 <> v134 
            let v139 = Uh3Nil
            let v140 = method204(v17, v139)
            let v141 = "["
            let v142 = "]"
            let v143 = 5
            let v144 = shared_layout_205(v140, v141, v142, v143)
            let v145 = "edit_history"
            let v146 = quoted_111(v145)
            let v147 = v146 <> v32 
            let v148 = v147 <> v144 
            let v149 = quoted_111(v20)
            let v150 = "id"
            let v151 = quoted_111(v150)
            let v152 = v151 <> v32 
            let v153 = v152 <> v149 
            let v154 = v14 != 1
            let v161 =
                case v154 {
                    True -> {
                        0
                    }
                    False -> {
                        let v155 = Uh21Nil
                        let v156 = method207(v13, v9, v155)
                        let v157 = Uh3Nil
                        let v158 = method208(v156, v157)
                        let v159 = 0
                        method144(v158, v159)
                    }
                }
            let v162 = string.inspect(v161)
            let v163 = "like_count"
            let v164 = quoted_111(v163)
            let v165 = v164 <> v32 
            let v166 = v165 <> v162 
            let v167 = Uh23Nil
            let v168 = method209(v12, v2, v167)
            let v169 = 0
            let v170 = method210(v168, v169)
            let v171 = string.inspect(v170)
            let v172 = "reply_count"
            let v173 = quoted_111(v172)
            let v174 = v173 <> v32 
            let v175 = v174 <> v171 
            let v176 = Uh3Nil
            let v177 = Uh3Cons(v175, v176)
            let v178 = Uh3Cons(v166, v177)
            let v179 = "{"
            let v180 = "}"
            let v181 = 5
            let v182 = shared_layout_205(v178, v179, v180, v181)
            let v183 = "metrics"
            let v184 = quoted_111(v183)
            let v185 = v184 <> v32 
            let v186 = v185 <> v182 
            let v209 =
                case v16  {
                    Us23None -> {
                        let v207 = "[]"
                        v207
                    }
                    Us23Some(v187) -> {
                        let v188 = quoted_111(v187)
                        let v189 = quoted_111(v150)
                        let v190 = v189 <> v32 
                        let v191 = v190 <> v188 
                        let v192 = "replied_to"
                        let v193 = quoted_111(v192)
                        let v194 = "type"
                        let v195 = quoted_111(v194)
                        let v196 = v195 <> v32 
                        let v197 = v196 <> v193 
                        let v198 = Uh3Nil
                        let v199 = Uh3Cons(v197, v198)
                        let v200 = Uh3Cons(v191, v199)
                        let v201 = 6
                        let v202 = shared_layout_205(v200, v179, v180, v201)
                        let v203 = Uh3Nil
                        let v204 = Uh3Cons(v202, v203)
                        let v205 = 5
                        shared_layout_205(v204, v141, v142, v205)
                    }
                }
            let v210 = "refs"
            let v211 = quoted_111(v210)
            let v212 = v211 <> v32 
            let v213 = v212 <> v209 
            let v214 = quoted_111(v22)
            let v215 = "text"
            let v216 = quoted_111(v215)
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
            let v228 = shared_layout_205(v226, v179, v180, v227)
            Uh3Cons(v228, v24)
        }
        Uh24Nil -> {
            v19
        }
    }
}

pub fn method201(v0: Int, v1: Int, v2: Uh23, v3: Uh25, v4: Uh26, v5: Us23, v6: Uh27, v7: Uh27, v8: Uh20, v9: Uh21, v10: Int, v11: Int, v12: Uh23, v13: Uh3) -> Uh3 {
    case v12  {
        Uh23Cons(v14, v15, v16, v17, v18, v19, v20) -> {
            let v21 = method201(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v20, v13)
            let v22 = Uh3Nil
            let v23 = method202(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v14, v15, v16, v17, v18, v19, v19, v22)
            method15(v23, v21)
        }
        Uh23Nil -> {
            v13
        }
    }
}

pub fn method213(v0: Uh23, v1: Uh28) -> Uh28 {
    case v0  {
        Uh23Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method213(v8, v1)
            Uh28Cons(v2, v9)
        }
        Uh23Nil -> {
            v1
        }
    }
}

pub fn method214(v0: String, v1: Uh28, v2: Us23) -> Us23 {
    case v1  {
        Uh28Cons(v3, v4) -> {
            let v5 = method214(v0, v4, v2)
            let v6 = v0 == v3
            case v6 {
                True -> {
                    Us23Some(v3)
                }
                False -> {
                    v5
                }
            }
        }
        Uh28Nil -> {
            v2
        }
    }
}

pub fn method212(v0: Int, v1: Int, v2: Uh23, v3: Uh25, v4: Uh26, v5: Us23, v6: Uh27, v7: Uh27, v8: Uh23, v9: Uh27) -> Uh27 {
    case v8  {
        Uh23Cons(v10, v11, v12, v13, v14, v15, v16) -> {
            let v17 = method212(v0, v1, v2, v3, v4, v5, v6, v7, v16, v9)
            let v34 =
                case v14  {
                    Us23Some(v18) -> {
                        let v19 = v12 == 1
                        let v28 =
                            case v19 {
                                True -> {
                                    let v20 = Uh28Nil
                                    let v21 = method213(v2, v20)
                                    let v22 = Us23None
                                    let v23 = method214(v18, v21, v22)
                                    let v26 =
                                        case v23  {
                                            Us23None -> {
                                                False
                                            }
                                            Us23Some(v24) -> {
                                                True
                                            }
                                        }
                                    let v27 = v26 == False
                                    v27
                                }
                                False -> {
                                    False
                                }
                            }
                        case v28 {
                            True -> {
                                let v29 = Uh27Nil
                                Uh27Cons(v11, v29)
                            }
                            False -> {
                                Uh27Nil
                            }
                        }
                    }
                    _ -> {
                        Uh27Nil
                    }
                }
            method194(v34, v17)
        }
        Uh23Nil -> {
            v9
        }
    }
}

pub fn gaps_211(v0: Int, v1: Int, v2: Uh23, v3: Uh25, v4: Uh26, v5: Us23, v6: Uh27, v7: Uh27) -> Uh27 {
    let v8 = Uh23Nil
    let v9 = method200(v0, v1, v2, v3, v4, v5, v6, v7, v3, v8)
    let v10 = Uh27Nil
    method212(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10)
}

pub fn method215(v0: Uh27, v1: Uh3) -> Uh3 {
    case v0  {
        Uh27Cons(v2, v3) -> {
            let v4 = method215(v3, v1)
            Uh3Cons(v2, v4)
        }
        Uh27Nil -> {
            v1
        }
    }
}

pub fn method216(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method216(v3, v1)
            let v5 = quoted_111(v2)
            Uh3Cons(v5, v4)
        }
        Uh3Nil -> {
            v1
        }
    }
}

pub fn method218(v0: Int, v1: Int, v2: Uh23, v3: Uh25, v4: Uh26, v5: Us23, v6: Uh27, v7: Uh27, v8: Uh27, v9: Uh27) -> Uh27 {
    case v8  {
        Uh27Cons(v10, v11) -> {
            let v12 = method218(v0, v1, v2, v3, v4, v5, v6, v7, v11, v9)
            let v13 = Us22None
            let v14 = method197(v10, v6, v13)
            let v17 =
                case v14  {
                    Us22None -> {
                        False
                    }
                    Us22Some(v15) -> {
                        True
                    }
                }
            let v18 = v17 == False
            let v25 =
                case v18 {
                    True -> {
                        let v19 = Us22None
                        let v20 = method197(v10, v7, v19)
                        let v23 =
                            case v20  {
                                Us22None -> {
                                    False
                                }
                                Us22Some(v21) -> {
                                    True
                                }
                            }
                        let v24 = v23 == False
                        v24
                    }
                    False -> {
                        False
                    }
                }
            case v25 {
                True -> {
                    Uh27Cons(v10, v12)
                }
                False -> {
                    v12
                }
            }
        }
        Uh27Nil -> {
            v9
        }
    }
}

pub fn method220(v0: String, v1: Uh23, v2: Uh23) -> Uh23 {
    case v1  {
        Uh23Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method220(v0, v9, v2)
            let v11 = v4 == v0
            case v11 {
                True -> {
                    Uh23Cons(v3, v4, v5, v6, v7, v8, v10)
                }
                False -> {
                    v10
                }
            }
        }
        Uh23Nil -> {
            v2
        }
    }
}

pub fn by_k_222(v0: String, v1: String, v2: Int, v3: Int, v4: Us23, v5: Uh24, v6: Uh23) -> Uh23 {
    case v6  {
        Uh23Cons(v7, v8, v9, v10, v11, v12, v13) -> {
            let v14 = v9 < v2
            case v14 {
                True -> {
                    let v15 = by_k_222(v0, v1, v2, v3, v4, v5, v13)
                    Uh23Cons(v7, v8, v9, v10, v11, v12, v15)
                }
                False -> {
                    Uh23Cons(v0, v1, v2, v3, v4, v5, v6)
                }
            }
        }
        _ -> {
            Uh23Cons(v0, v1, v2, v3, v4, v5, v6)
        }
    }
}

pub fn method221(v0: Uh23, v1: Uh23) -> Uh23 {
    case v0  {
        Uh23Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = by_k_222(v2, v3, v4, v5, v6, v7, v1)
            method221(v8, v9)
        }
        Uh23Nil -> {
            v1
        }
    }
}

pub fn method224(v0: Uh24, v1: String) -> String {
    case v0  {
        Uh24Cons(v2, v3, v4, v5) -> {
            method224(v5, v4)
        }
        Uh24Nil -> {
            v1
        }
    }
}

pub fn method223(v0: Uh23, v1: Uh3) -> Uh3 {
    case v0  {
        Uh23Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method223(v8, v1)
            let v10 = ""
            let v11 = method224(v7, v10)
            let v12 = "\n"
            let v13 = case v12 { "" -> 0 _ -> case spiral_binary_split_first(v11, v12) { [spiral_head, _] -> bit_array.byte_size(bit_array.from_string(spiral_head)) _ -> -1 } }
            let v14 = v13 < 0
            let v25 =
                case v14 {
                    True -> {
                        v10
                    }
                    False -> {
                        let v15 = spiral_wrap_signed(v13 + 1, 32)
                        let v16 = spiral_string_length(v11)
                        let v17 = spiral_wrap_signed(v16 - v15, 32)
                        let v18 = spiral_wrap_signed(v15 + v17, 32)
                        let v19 = spiral_wrap_signed(v18 - 1, 32)
                        let v20 = spiral_string_slice(v11, v15, v19)
                        let v21 = case string.utf_codepoint(8203) { Ok(c) -> string.from_utf_codepoints([c]) Error(_) -> "" }
                        let v22 = "."
                        let v23 = v21 <> v22 
                        let v24 = v20 |> string.replace(v23, v22)
                        v24
                    }
                }
            Uh3Cons(v25, v9)
        }
        Uh23Nil -> {
            v1
        }
    }
}

pub fn method219(v0: Int, v1: Int, v2: Uh23, v3: Uh25, v4: Uh26, v5: Us23, v6: Uh27, v7: Uh27, v8: Uh27, v9: Uh3) -> Uh3 {
    case v8  {
        Uh27Cons(v10, v11) -> {
            let v12 = method219(v0, v1, v2, v3, v4, v5, v6, v7, v11, v9)
            let v13 = Uh23Nil
            let v14 = method220(v10, v2, v13)
            let v15 = Uh23Nil
            let v16 = method221(v14, v15)
            let v17 = Uh3Nil
            let v18 = method223(v16, v17)
            let v19 = ""
            let v20 = delimited_34(v19, v18)
            Uh3Cons(v20, v12)
        }
        Uh27Nil -> {
            v9
        }
    }
}

pub fn program_217(v0: Uh22, v1: Int, v2: Int, v3: Uh23, v4: Uh25, v5: Uh26, v6: Us23, v7: Uh27, v8: Uh27) -> String {
    let v9 = Uh27Nil
    let v10 = method184(v0, v9)
    let v11 = Uh27Nil
    let v12 = method218(v1, v2, v3, v4, v5, v6, v7, v8, v10, v11)
    let v13 = Uh3Nil
    let v14 = method219(v1, v2, v3, v4, v5, v6, v7, v8, v12, v13)
    let v15 = "\n\n"
    delimited_34(v15, v14)
}
