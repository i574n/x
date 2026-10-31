import gleam/bit_array
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh13, type Uh19, type Uh20, type Uh21, type Us26, type Uh23, type Uh22, type Uh24, type Uh25, type Uh26, type Uh27, Uh13Cons, Uh13Nil, Uh20Cons, Uh20Nil, Uh21Cons, Uh21Nil, Uh22Cons, Uh22Nil, Uh23Cons, Uh23Nil, Uh24Cons, Uh24Nil, Uh25Nil, Uh26Cons, Uh26Nil, Uh27Cons, Uh27Nil, Uh3Cons, Uh3Nil, Us26None, Us26Some, Us28None, Us28Some, Us2None, Us2Some}
import xsim_frames/part1.{closure1, spiral_string_length, spiral_string_slice, spiral_wrap_signed, unicode_erlang_characters_to_binary}
import xsim_frames/part2.{delimited_21, method18, method20}
import xsim_frames/part5.{quoted_119}
import xsim_frames/part7.{method162, method168, method169, method172, method174, method175, method178, method179, method183, method184, method186, method187, method188, method190, method193, method194, method197, method198, taken_189}

pub fn method200(v0: String, v1: Uh13, v2: Int, v3: Int, v4: Uh22, v5: Uh24, v6: Uh25, v7: Us26, v8: Uh26, v9: Uh26) -> #(Int, Int, Uh22, Uh24, Uh25, Us26, Uh26, Uh26) {
    let #(v32, v33, v34, v35, v36, v37, v38, v39) =
        case v1  {
            Uh13Cons(v10, v11) -> {
                let v12 = Uh22Nil
                let v13 = method178(v0, v10, v4, v12)
                let v14 = Uh24Nil
                let v15 = method179(v0, v10, v5, v14)
                method200(v0, v11, v2, v3, v13, v15, v6, v7, v8, v9)
            }
            _ -> {
                let #(v24, v25, v26, v27, v28, v29, v30, v31) =
                    case v1  {
                        Uh13Nil -> #(v2, v3, v4, v5, v6, v7, v8, v9)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v24, v25, v26, v27, v28, v29, v30, v31)
            }
        }
    #(v32, v33, v34, v35, v36, v37, v38, v39)
}

pub fn method199(v0: Uh26, v1: Int, v2: Int, v3: Uh22, v4: Uh24, v5: Uh25, v6: Us26, v7: Uh26, v8: Uh26) -> #(Int, Int, Uh22, Uh24, Uh25, Us26, Uh26, Uh26) {
    let #(v42, v43, v44, v45, v46, v47, v48, v49) =
        case v0  {
            Uh26Cons(v9, v10) -> {
                let v11 = Uh22Nil
                let v12 = method174(v9, v3, v11)
                let v13 = Uh13Nil
                let v14 = method175(v12, v13)
                let #(v15, v16, v17, v18, v19, v20, v21, _v22) = method200(v9, v14, v1, v2, v3, v4, v5, v6, v7, v8)
                let v23 = Uh26Nil
                let v24 = Uh26Cons(v9, v23)
                let v25 = method193(v8, v24)
                method199(v10, v15, v16, v17, v18, v19, v20, v21, v25)
            }
            _ -> {
                let #(v34, v35, v36, v37, v38, v39, v40, v41) =
                    case v0  {
                        Uh26Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v34, v35, v36, v37, v38, v39, v40, v41)
            }
        }
    #(v42, v43, v44, v45, v46, v47, v48, v49)
}

pub fn materialized_161(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: Uh21, v2: Int, v3: Int, v4: Int) -> #(Int, Int, Uh22, Uh24, Uh25, Us26, Uh26, Uh26) {
    let v5 = 0
    let v6 = Uh22Nil
    let v7 = Uh24Nil
    let v8 = Uh25Nil
    let v9 = Us26None
    let v10 = Uh26Nil
    let v11 = Uh26Nil
    let #(v12, v13, v14, v15, v16, v17, v18, v19) = method162(v0, v1, v2, v5, v6, v7, v8, v9, v10, v11)
    let #(v20, v21, v22, v23, v24, v25, v26, v27) = method172(v0, v1, v12, v13, v14, v15, v16, v17, v18, v19)
    let v34 =
        case v1  {
            Uh21Cons(v28, v29, v30, v31) -> v31
            Uh21Nil -> Uh21Nil
        }
    let v35 = Uh26Nil
    let v36 = method183(v34, v35)
    let v37 = Uh26Nil
    let v38 = method184(v20, v21, v22, v23, v24, v25, v26, v27, v36, v37)
    let v39 = v3 <= 0
    let #(v61, v62, v63, v64, v65, v66, v67, v68) =
        case v39 {
            True -> #(v20, v21, v22, v23, v24, v25, v26, v27)
            False -> {
                let v40 = 0
                let v41 = method186(v38, v40)
                let v42 = spiral_wrap_signed(v3 + 1, 32)
                let v43 = v41 / v42
                let v44 = v43 < 1
                let v45 =
                    case v44 {
                        True -> 1
                        False -> v43
                    }
                let v46 = 0
                let v47 = Uh26Nil
                let #(_v48, v49) = method187(v45, v38, v46, v47)
                let v50 = Uh26Nil
                let v51 = method188(v49, v50)
                let v52 = taken_189(v3, v51)
                let #(v53, v54, v55, v56, v57, v58, v59, v60) = method190(v52, v20, v21, v22, v23, v24, v25, v26, v27)
                #(v53, v54, v55, v56, v57, v58, v59, v60)
            }
        }
    let v69 = v4 <= 0
    let #(v90, v91, v92, v93, v94, v95, v96, v97) =
        case v69 {
            True -> #(v61, v62, v63, v64, v65, v66, v67, v68)
            False -> {
                let v76 =
                    case v1  {
                        Uh21Cons(v70, v71, v72, v73) -> v73
                        Uh21Nil -> Uh21Nil
                    }
                let v77 = Uh26Nil
                let v78 = method183(v76, v77)
                let v79 = Uh26Nil
                let v80 = method194(v61, v62, v63, v64, v65, v66, v67, v68, v1, v78, v79)
                let v81 = taken_189(v4, v80)
                let #(v82, v83, v84, v85, v86, v87, v88, v89) = method199(v81, v61, v62, v63, v64, v65, v66, v67, v68)
                #(v82, v83, v84, v85, v86, v87, v88, v89)
            }
        }
    #(v90, v91, v92, v93, v94, v95, v96, v97)
}

pub fn method201(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh24, v9: Uh22) -> Uh22 {
    case v8  {
        Uh24Cons(v10, v11, v12) -> {
            let v13 = method201(v0, v1, v2, v3, v4, v5, v6, v7, v12, v9)
            let v14 = method168(v10, v11, v2)
            let v25 =
                case v14  {
                    Us28None -> Uh22Nil
                    Us28Some(v15, v16, v17, v18, v19, v20) -> {
                        let v21 = Uh22Nil
                        Uh22Cons(v15, v16, v17, v18, v19, v20, v21)
                    }
                }
            method169(v25, v13)
        }
        Uh24Nil -> v9
    }
}

pub fn method204(v0: Int, v1: Int) -> fn(String) -> String {
    closure24(#(v0, v1))
}

pub fn closure24(capt: #(Int, Int)) -> fn(String) -> String {
    fn (v2) {
        let #(v0, v1) = capt
        let v3 = v1 >= v0
        case v3 {
            True -> v2
            False -> {
                let v4 = spiral_wrap_signed(v1 + 1, 32)
                let v5 = method204(v0, v4)
                let v6 = "0"
                let v7 = v2 <> v6 
                v5(v7)
            }
        }
    }
}

pub fn method205(v0: Uh23, v1: Uh3) -> Uh3 {
    case v0  {
        Uh23Cons(v2, v3, v4, v5) -> {
            let v6 = method205(v5, v1)
            let v7 = quoted_119(v2)
            Uh3Cons(v7, v6)
        }
        Uh23Nil -> v1
    }
}

pub fn method207(v0: Int, v1: Int) -> fn(String) -> String {
    closure25(#(v0, v1))
}

pub fn closure25(capt: #(Int, Int)) -> fn(String) -> String {
    fn (v2) {
        let #(v0, v1) = capt
        let v3 = v1 >= v0
        case v3 {
            True -> v2
            False -> {
                let v4 = spiral_wrap_signed(v1 + 1, 32)
                let v5 = method207(v0, v4)
                let v6 = " "
                let v7 = v2 <> v6 
                v5(v7)
            }
        }
    }
}

pub fn shared_layout_206(v0: Uh3, v1: String, v2: String, v3: Int) -> String {
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
                    let v9 = method207(v7, v8)
                    let v10 = ""
                    let v11 = v9(v10)
                    let v12 = "\n"
                    let v13 = v12 <> v11 
                    let v14 = v1 <> v13 
                    let v15 = ","
                    let v16 = v15 <> v13 
                    let v17 = delimited_21(v16, v0)
                    let v18 = v14 <> v17 
                    let v19 = v18 <> v12 
                    let v20 = spiral_wrap_signed(4 * v3, 32)
                    let v21 = 0
                    let v22 = method207(v20, v21)
                    let v23 = v22(v10)
                    let v24 = v19 <> v23 
                    let v25 = v24 <> v2 
                    v25
                }
                False -> {
                    let v26 = ", "
                    let v27 = delimited_21(v26, v0)
                    let v28 = v1 <> v27 
                    let v29 = v28 <> v2 
                    v29
                }
            }
        }
    }
}

pub fn method208(v0: String, v1: Uh20, v2: Uh20) -> Uh20 {
    case v1  {
        Uh20Cons(v3, v4, v5) -> {
            let v6 = method208(v0, v5, v2)
            let v7 = v3 == v0
            case v7 {
                True -> Uh20Cons(v3, v4, v6)
                False -> v6
            }
        }
        Uh20Nil -> v2
    }
}

pub fn method209(v0: Uh20, v1: Uh3) -> Uh3 {
    case v0  {
        Uh20Cons(v2, v3, v4) -> {
            let v5 = method209(v4, v1)
            method18(v3, v5)
        }
        Uh20Nil -> v1
    }
}

pub fn method210(v0: String, v1: Uh22, v2: Uh22) -> Uh22 {
    case v1  {
        Uh22Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method210(v0, v9, v2)
            let v14 =
                case v7  {
                    Us26None -> False
                    Us26Some(v11) -> {
                        let v12 = v11 == v0
                        v12
                    }
                }
            case v14 {
                True -> Uh22Cons(v3, v4, v5, v6, v7, v8, v10)
                False -> v10
            }
        }
        Uh22Nil -> v2
    }
}

pub fn method211(v0: Uh22, v1: Int) -> Int {
    case v0  {
        Uh22Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = spiral_wrap_signed(v1 + 1, 32)
            method211(v8, v9)
        }
        Uh22Nil -> v1
    }
}

pub fn method203(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh19, v9: Uh20, v10: Int, v11: Int, v12: String, v13: String, v14: Int, v15: Int, v16: Us26, v17: Uh23, v18: Uh23, v19: Uh3) -> Uh3 {
    case v18  {
        Uh23Cons(v20, v21, v22, v23) -> {
            let v24 = method203(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v23, v19)
            let v29 =
                case v5  {
                    Us26None -> {
                        let v27 = "null"
                        v27
                    }
                    Us26Some(v25) -> quoted_119(v25)
                }
            let v30 = "conversation_id"
            let v31 = quoted_119(v30)
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
                    False -> v49
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
            let v75 = method204(v73, v74)
            let v76 = ""
            let v77 = v75(v76)
            let v78 = v77 <> v71 
            let v79 = "-"
            let v80 = v78 <> v79 
            let v81 = string.inspect(v62)
            let v82 = spiral_string_length(v81)
            let v83 = spiral_wrap_signed(2 - v82, 32)
            let v84 = 0
            let v85 = method204(v83, v84)
            let v86 = v85(v76)
            let v87 = v86 <> v81 
            let v88 = v80 <> v87 
            let v89 = v88 <> v79 
            let v90 = string.inspect(v70)
            let v91 = spiral_string_length(v90)
            let v92 = spiral_wrap_signed(2 - v91, 32)
            let v93 = 0
            let v94 = method204(v92, v93)
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
            let v106 = method204(v104, v105)
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
            let v117 = method204(v115, v116)
            let v118 = v117(v76)
            let v119 = v118 <> v113 
            let v120 = v110 <> v119 
            let v121 = v120 <> v109 
            let v122 = v100 % 60
            let v123 = string.inspect(v122)
            let v124 = spiral_string_length(v123)
            let v125 = spiral_wrap_signed(2 - v124, 32)
            let v126 = 0
            let v127 = method204(v125, v126)
            let v128 = v127(v76)
            let v129 = v128 <> v123 
            let v130 = v121 <> v129 
            let v131 = v99 <> v130 
            let v132 = ".000Z"
            let v133 = v131 <> v132 
            let v134 = quoted_119(v133)
            let v135 = "created_at"
            let v136 = quoted_119(v135)
            let v137 = v136 <> v32 
            let v138 = v137 <> v134 
            let v139 = Uh3Nil
            let v140 = method205(v17, v139)
            let v141 = "["
            let v142 = "]"
            let v143 = 5
            let v144 = shared_layout_206(v140, v141, v142, v143)
            let v145 = "edit_history"
            let v146 = quoted_119(v145)
            let v147 = v146 <> v32 
            let v148 = v147 <> v144 
            let v149 = quoted_119(v20)
            let v150 = "id"
            let v151 = quoted_119(v150)
            let v152 = v151 <> v32 
            let v153 = v152 <> v149 
            let v154 = v14 != 1
            let v161 =
                case v154 {
                    True -> 0
                    False -> {
                        let v155 = Uh20Nil
                        let v156 = method208(v13, v9, v155)
                        let v157 = Uh3Nil
                        let v158 = method209(v156, v157)
                        let v159 = 0
                        method20(v158, v159)
                    }
                }
            let v162 = string.inspect(v161)
            let v163 = "like_count"
            let v164 = quoted_119(v163)
            let v165 = v164 <> v32 
            let v166 = v165 <> v162 
            let v167 = Uh22Nil
            let v168 = method210(v12, v2, v167)
            let v169 = 0
            let v170 = method211(v168, v169)
            let v171 = string.inspect(v170)
            let v172 = "reply_count"
            let v173 = quoted_119(v172)
            let v174 = v173 <> v32 
            let v175 = v174 <> v171 
            let v176 = Uh3Nil
            let v177 = Uh3Cons(v175, v176)
            let v178 = Uh3Cons(v166, v177)
            let v179 = "{"
            let v180 = "}"
            let v181 = 5
            let v182 = shared_layout_206(v178, v179, v180, v181)
            let v183 = "metrics"
            let v184 = quoted_119(v183)
            let v185 = v184 <> v32 
            let v186 = v185 <> v182 
            let v209 =
                case v16  {
                    Us26None -> {
                        let v207 = "[]"
                        v207
                    }
                    Us26Some(v187) -> {
                        let v188 = quoted_119(v187)
                        let v189 = quoted_119(v150)
                        let v190 = v189 <> v32 
                        let v191 = v190 <> v188 
                        let v192 = "replied_to"
                        let v193 = quoted_119(v192)
                        let v194 = "type"
                        let v195 = quoted_119(v194)
                        let v196 = v195 <> v32 
                        let v197 = v196 <> v193 
                        let v198 = Uh3Nil
                        let v199 = Uh3Cons(v197, v198)
                        let v200 = Uh3Cons(v191, v199)
                        let v201 = 6
                        let v202 = shared_layout_206(v200, v179, v180, v201)
                        let v203 = Uh3Nil
                        let v204 = Uh3Cons(v202, v203)
                        let v205 = 5
                        shared_layout_206(v204, v141, v142, v205)
                    }
                }
            let v210 = "refs"
            let v211 = quoted_119(v210)
            let v212 = v211 <> v32 
            let v213 = v212 <> v209 
            let v214 = quoted_119(v22)
            let v215 = "text"
            let v216 = quoted_119(v215)
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
            let v228 = shared_layout_206(v226, v179, v180, v227)
            Uh3Cons(v228, v24)
        }
        Uh23Nil -> v19
    }
}

pub fn method202(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh19, v9: Uh20, v10: Int, v11: Int, v12: Uh22, v13: Uh3) -> Uh3 {
    case v12  {
        Uh22Cons(v14, v15, v16, v17, v18, v19, v20) -> {
            let v21 = method202(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v20, v13)
            let v22 = Uh3Nil
            let v23 = method203(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v14, v15, v16, v17, v18, v19, v19, v22)
            method18(v23, v21)
        }
        Uh22Nil -> v13
    }
}

pub fn method214(v0: Uh22, v1: Uh27) -> Uh27 {
    case v0  {
        Uh22Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method214(v8, v1)
            Uh27Cons(v2, v9)
        }
        Uh22Nil -> v1
    }
}

pub fn closure26(capt: #(String)) -> fn(String) -> Bool {
    fn (v1) {
        let #(v0) = capt
        let v2 = v0 == v1
        v2
    }
}

pub fn method215(v0: String) -> fn(String) -> Bool {
    closure26(#(v0))
}

pub fn method216(v0: String, v1: fn(String) -> Bool, v2: Uh27) -> Bool {
    case v2  {
        Uh27Cons(v3, v4) -> {
            let v5 = v1(v3)
            case v5 {
                True -> True
                False -> {
                    let v6 = method215(v0)
                    method216(v0, v6, v4)
                }
            }
        }
        Uh27Nil -> False
    }
}

pub fn method213(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh22, v9: Uh26) -> Uh26 {
    case v8  {
        Uh22Cons(v10, v11, v12, v13, v14, v15, v16) -> {
            let v17 = method213(v0, v1, v2, v3, v4, v5, v6, v7, v16, v9)
            let v31 =
                case v14  {
                    Us26Some(v18) -> {
                        let v19 = v12 == 1
                        let v25 =
                            case v19 {
                                True -> {
                                    let v20 = Uh27Nil
                                    let v21 = method214(v2, v20)
                                    let v22 = method215(v18)
                                    let v23 = method216(v18, v22, v21)
                                    let v24 = v23 == False
                                    v24
                                }
                                False -> False
                            }
                        case v25 {
                            True -> {
                                let v26 = Uh26Nil
                                Uh26Cons(v11, v26)
                            }
                            False -> Uh26Nil
                        }
                    }
                    _ -> Uh26Nil
                }
            method193(v31, v17)
        }
        Uh22Nil -> v9
    }
}

pub fn gaps_212(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26) -> Uh26 {
    let v8 = Uh22Nil
    let v9 = method201(v0, v1, v2, v3, v4, v5, v6, v7, v3, v8)
    let v10 = Uh26Nil
    method213(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10)
}

pub fn method217(v0: Uh26, v1: Uh3) -> Uh3 {
    case v0  {
        Uh26Cons(v2, v3) -> {
            let v4 = method217(v3, v1)
            Uh3Cons(v2, v4)
        }
        Uh26Nil -> v1
    }
}

pub fn method218(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method218(v3, v1)
            let v5 = quoted_119(v2)
            Uh3Cons(v5, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method220(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh26, v9: Uh26) -> Uh26 {
    case v8  {
        Uh26Cons(v10, v11) -> {
            let v12 = method220(v0, v1, v2, v3, v4, v5, v6, v7, v11, v9)
            let v13 = method197(v10)
            let v14 = method198(v10, v13, v6)
            let v15 = v14 == False
            let v19 =
                case v15 {
                    True -> {
                        let v16 = method197(v10)
                        let v17 = method198(v10, v16, v7)
                        let v18 = v17 == False
                        v18
                    }
                    False -> False
                }
            case v19 {
                True -> Uh26Cons(v10, v12)
                False -> v12
            }
        }
        Uh26Nil -> v9
    }
}

pub fn method222(v0: String, v1: Uh22, v2: Uh22) -> Uh22 {
    case v1  {
        Uh22Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method222(v0, v9, v2)
            let v11 = v4 == v0
            case v11 {
                True -> Uh22Cons(v3, v4, v5, v6, v7, v8, v10)
                False -> v10
            }
        }
        Uh22Nil -> v2
    }
}

pub fn by_k_224(v0: String, v1: String, v2: Int, v3: Int, v4: Us26, v5: Uh23, v6: Uh22) -> Uh22 {
    case v6  {
        Uh22Cons(v7, v8, v9, v10, v11, v12, v13) -> {
            let v14 = v9 < v2
            case v14 {
                True -> {
                    let v15 = by_k_224(v0, v1, v2, v3, v4, v5, v13)
                    Uh22Cons(v7, v8, v9, v10, v11, v12, v15)
                }
                False -> Uh22Cons(v0, v1, v2, v3, v4, v5, v6)
            }
        }
        _ -> Uh22Cons(v0, v1, v2, v3, v4, v5, v6)
    }
}

pub fn method223(v0: Uh22, v1: Uh22) -> Uh22 {
    case v0  {
        Uh22Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = by_k_224(v2, v3, v4, v5, v6, v7, v1)
            method223(v8, v9)
        }
        Uh22Nil -> v1
    }
}

pub fn method226(v0: Uh23, v1: String) -> String {
    case v0  {
        Uh23Cons(v2, v3, v4, v5) -> method226(v5, v4)
        Uh23Nil -> v1
    }
}

pub fn restored_text_227(v0: String) -> String {
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

pub fn method225(v0: Uh22, v1: Uh3) -> Uh3 {
    case v0  {
        Uh22Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method225(v8, v1)
            let v10 = ""
            let v11 = method226(v7, v10)
            let v12 = "\n"
            let v13 = option.from_result(result.map(string.split_once(v11, v12), pair.first))
            let v14 = closure1(Nil)
            let v15 = v13 |> option.map(v14)
            let v16 = Us2None
            let v17 = v15 |> option.unwrap(v16)
            let v21 =
                case v17  {
                    Us2None -> -1
                    Us2Some(v18) -> {
                        let v19 = bit_array.byte_size(bit_array.from_string(v18))
                        v19
                    }
                }
            let v22 = v21 < 0
            let v30 =
                case v22 {
                    True -> v10
                    False -> {
                        let v23 = spiral_wrap_signed(v21 + 1, 32)
                        let v24 = spiral_string_length(v11)
                        let v25 = spiral_wrap_signed(v24 - v23, 32)
                        let v26 = spiral_wrap_signed(v23 + v25, 32)
                        let v27 = spiral_wrap_signed(v26 - 1, 32)
                        let v28 = spiral_string_slice(v11, v23, v27)
                        restored_text_227(v28)
                    }
                }
            Uh3Cons(v30, v9)
        }
        Uh22Nil -> v1
    }
}

pub fn method221(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh26, v9: Uh3) -> Uh3 {
    case v8  {
        Uh26Cons(v10, v11) -> {
            let v12 = method221(v0, v1, v2, v3, v4, v5, v6, v7, v11, v9)
            let v13 = Uh22Nil
            let v14 = method222(v10, v2, v13)
            let v15 = Uh22Nil
            let v16 = method223(v14, v15)
            let v17 = Uh3Nil
            let v18 = method225(v16, v17)
            let v19 = ""
            let v20 = delimited_21(v19, v18)
            Uh3Cons(v20, v12)
        }
        Uh26Nil -> v9
    }
}

pub fn program_219(v0: Uh21, v1: Int, v2: Int, v3: Uh22, v4: Uh24, v5: Uh25, v6: Us26, v7: Uh26, v8: Uh26) -> String {
    let v9 = Uh26Nil
    let v10 = method183(v0, v9)
    let v11 = Uh26Nil
    let v12 = method220(v1, v2, v3, v4, v5, v6, v7, v8, v10, v11)
    let v13 = Uh3Nil
    let v14 = method221(v1, v2, v3, v4, v5, v6, v7, v8, v12, v13)
    let v15 = "\n\n"
    delimited_21(v15, v14)
}
