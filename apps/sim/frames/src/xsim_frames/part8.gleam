import gleam/bit_array
import gleam/int
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh19, type Uh20, type Uh21, type Us26, type Uh23, type Uh22, type Uh24, type Uh25, type Uh26, type Uh27, Uh13Nil, Uh20Cons, Uh20Nil, Uh21Cons, Uh21Nil, Uh22Cons, Uh22Nil, Uh23Cons, Uh23Nil, Uh24Cons, Uh24Nil, Uh25Nil, Uh26Cons, Uh26Nil, Uh27Cons, Uh27Nil, Uh3Cons, Uh3Nil, Us26None, Us26Some, Us28None, Us28Some, Us2None, Us2Some}
import xsim_frames/part1.{closure1, spiral_string_length, spiral_string_slice, spiral_wrap_signed, unicode_erlang_characters_to_binary}
import xsim_frames/part2.{delimited_21, method18, method20}
import xsim_frames/part5.{quoted_119}
import xsim_frames/part7.{method161, method167, method168, method171, method173, method174, method182, method183, method185, method186, method187, method189, method192, method193, method196, method197, method199, taken_188}

pub fn method198(v0: Uh26, v1: Int, v2: Int, v3: Uh22, v4: Uh24, v5: Uh25, v6: Us26, v7: Uh26, v8: Uh26) -> #(Int, Int, Uh22, Uh24, Uh25, Us26, Uh26, Uh26) {
    let #(v42, v43, v44, v45, v46, v47, v48, v49) =
        case v0  {
            Uh26Cons(v9, v10) -> {
                let v11 = Uh22Nil
                let v12 = method173(v9, v3, v11)
                let v13 = Uh13Nil
                let v14 = method174(v12, v13)
                let #(v15, v16, v17, v18, v19, v20, v21, _v22) = method199(v9, v14, v1, v2, v3, v4, v5, v6, v7, v8)
                let v23 = Uh26Nil
                let v24 = Uh26Cons(v9, v23)
                let v25 = method192(v8, v24)
                method198(v10, v15, v16, v17, v18, v19, v20, v21, v25)
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

pub fn materialized_160(v0: fn(String) -> fn(Int) -> fn(String) -> Uh3, v1: Uh21, v2: Int, v3: Int, v4: Int) -> #(Int, Int, Uh22, Uh24, Uh25, Us26, Uh26, Uh26) {
    let v5 = 0
    let v6 = Uh22Nil
    let v7 = Uh24Nil
    let v8 = Uh25Nil
    let v9 = Us26None
    let v10 = Uh26Nil
    let v11 = Uh26Nil
    let #(v12, v13, v14, v15, v16, v17, v18, v19) = method161(v0, v1, v2, v5, v6, v7, v8, v9, v10, v11)
    let #(v20, v21, v22, v23, v24, v25, v26, v27) = method171(v0, v1, v12, v13, v14, v15, v16, v17, v18, v19)
    let v34 =
        case v1  {
            Uh21Cons(v28, v29, v30, v31) -> v31
            Uh21Nil -> Uh21Nil
        }
    let v35 = Uh26Nil
    let v36 = method182(v34, v35)
    let v37 = Uh26Nil
    let v38 = method183(v20, v21, v22, v23, v24, v25, v26, v27, v36, v37)
    let v39 = v3 <= 0
    let #(v61, v62, v63, v64, v65, v66, v67, v68) =
        case v39 {
            True -> #(v20, v21, v22, v23, v24, v25, v26, v27)
            False -> {
                let v40 = 0
                let v41 = method185(v38, v40)
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
                let #(_v48, v49) = method186(v45, v38, v46, v47)
                let v50 = Uh26Nil
                let v51 = method187(v49, v50)
                let v52 = taken_188(v3, v51)
                let #(v53, v54, v55, v56, v57, v58, v59, v60) = method189(v52, v20, v21, v22, v23, v24, v25, v26, v27)
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
                let v78 = method182(v76, v77)
                let v79 = Uh26Nil
                let v80 = method193(v61, v62, v63, v64, v65, v66, v67, v68, v1, v78, v79)
                let v81 = taken_188(v4, v80)
                let #(v82, v83, v84, v85, v86, v87, v88, v89) = method198(v81, v61, v62, v63, v64, v65, v66, v67, v68)
                #(v82, v83, v84, v85, v86, v87, v88, v89)
            }
        }
    #(v90, v91, v92, v93, v94, v95, v96, v97)
}

pub fn method200(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh24, v9: Uh22) -> Uh22 {
    case v8  {
        Uh24Cons(v10, v11, v12) -> {
            let v13 = method200(v0, v1, v2, v3, v4, v5, v6, v7, v12, v9)
            let v14 = method167(v10, v11, v2)
            let v25 =
                case v14  {
                    Us28None -> Uh22Nil
                    Us28Some(v15, v16, v17, v18, v19, v20) -> {
                        let v21 = Uh22Nil
                        Uh22Cons(v15, v16, v17, v18, v19, v20, v21)
                    }
                }
            method168(v25, v13)
        }
        Uh24Nil -> v9
    }
}

pub fn method203(v0: Int, v1: String, v2: Int) -> fn(String) -> String {
    closure24(#(v0, v1, v2))
}

pub fn closure24(capt: #(Int, String, Int)) -> fn(String) -> String {
    fn (v3) {
        let #(v0, v1, v2) = capt
        let v4 = v2 >= v0
        case v4 {
            True -> v3
            False -> {
                let v5 = spiral_wrap_signed(v2 + 1, 32)
                let v6 = method203(v0, v1, v5)
                let v7 = v3 <> v1 
                v6(v7)
            }
        }
    }
}

pub fn method204(v0: Uh23, v1: Uh3) -> Uh3 {
    case v0  {
        Uh23Cons(v2, v3, v4, v5) -> {
            let v6 = method204(v5, v1)
            let v7 = quoted_119(v2)
            Uh3Cons(v7, v6)
        }
        Uh23Nil -> v1
    }
}

pub fn method206(v0: Int, v1: Int) -> fn(String) -> String {
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
                let v5 = method206(v0, v4)
                let v6 = " "
                let v7 = v2 <> v6 
                v5(v7)
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
                    let v22 = method206(v20, v21)
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

pub fn method207(v0: String, v1: Uh20, v2: Uh20) -> Uh20 {
    case v1  {
        Uh20Cons(v3, v4, v5) -> {
            let v6 = method207(v0, v5, v2)
            let v7 = v3 == v0
            case v7 {
                True -> Uh20Cons(v3, v4, v6)
                False -> v6
            }
        }
        Uh20Nil -> v2
    }
}

pub fn method208(v0: Uh20, v1: Uh3) -> Uh3 {
    case v0  {
        Uh20Cons(v2, v3, v4) -> {
            let v5 = method208(v4, v1)
            method18(v3, v5)
        }
        Uh20Nil -> v1
    }
}

pub fn method209(v0: String, v1: Uh22, v2: Uh22) -> Uh22 {
    case v1  {
        Uh22Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method209(v0, v9, v2)
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

pub fn method210(v0: Uh22, v1: Int) -> Int {
    case v0  {
        Uh22Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = spiral_wrap_signed(v1 + 1, 32)
            method210(v8, v9)
        }
        Uh22Nil -> v1
    }
}

pub fn method202(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh19, v9: Uh20, v10: Int, v11: Int, v12: String, v13: String, v14: Int, v15: Int, v16: Us26, v17: Uh23, v18: Uh23, v19: Uh3) -> Uh3 {
    case v18  {
        Uh23Cons(v20, v21, v22, v23) -> {
            let v24 = method202(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v23, v19)
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
            let v38 = spiral_wrap_signed(v37, 64)
            let v39 = spiral_wrap_signed(v38 * 86400000000, 64)
            let v40 = v39 / 86400000000
            let v41 = v39 % 86400000000
            let v42 = v41 != 0
            let v44 =
                case v42 {
                    True -> {
                        let v43 = v39 < 0
                        v43
                    }
                    False -> False
                }
            let v46 =
                case v44 {
                    True -> {
                        let v45 = spiral_wrap_signed(v40 - 1, 64)
                        v45
                    }
                    False -> v40
                }
            let v47 = spiral_wrap_signed(v46 * 86400000000, 64)
            let v48 = spiral_wrap_signed(v39 - v47, 64)
            let v49 = spiral_wrap_signed(v46 + 719468, 64)
            let v50 = v49 / 146097
            let v51 = v49 % 146097
            let v52 = v51 != 0
            let v54 =
                case v52 {
                    True -> {
                        let v53 = v49 < 0
                        v53
                    }
                    False -> False
                }
            let v56 =
                case v54 {
                    True -> {
                        let v55 = spiral_wrap_signed(v50 - 1, 64)
                        v55
                    }
                    False -> v50
                }
            let v57 = spiral_wrap_signed(v56 * 146097, 64)
            let v58 = spiral_wrap_signed(v49 - v57, 64)
            let v59 = v58 / 1460
            let v60 = spiral_wrap_signed(v58 - v59, 64)
            let v61 = v58 / 36524
            let v62 = spiral_wrap_signed(v60 + v61, 64)
            let v63 = v58 / 146096
            let v64 = spiral_wrap_signed(v62 - v63, 64)
            let v65 = v64 / 365
            let v66 = spiral_wrap_signed(365 * v65, 64)
            let v67 = v65 / 4
            let v68 = spiral_wrap_signed(v66 + v67, 64)
            let v69 = v65 / 100
            let v70 = spiral_wrap_signed(v68 - v69, 64)
            let v71 = spiral_wrap_signed(v58 - v70, 64)
            let v72 = spiral_wrap_signed(5 * v71, 64)
            let v73 = spiral_wrap_signed(v72 + 2, 64)
            let v74 = v73 / 153
            let v75 = spiral_wrap_signed(153 * v74, 64)
            let v76 = spiral_wrap_signed(v75 + 2, 64)
            let v77 = v76 / 5
            let v78 = spiral_wrap_signed(v71 - v77, 64)
            let v79 = spiral_wrap_signed(v78 + 1, 64)
            let v80 = v74 < 10
            let v83 =
                case v80 {
                    True -> {
                        let v81 = spiral_wrap_signed(v74 + 3, 64)
                        v81
                    }
                    False -> {
                        let v82 = spiral_wrap_signed(v74 - 9, 64)
                        v82
                    }
                }
            let v84 = spiral_wrap_signed(v56 * 400, 64)
            let v85 = spiral_wrap_signed(v65 + v84, 64)
            let v86 = v83 <= 2
            let v87 =
                case v86 {
                    True -> 1
                    False -> 0
                }
            let v88 = spiral_wrap_signed(v85 + v87, 64)
            let v89 = v48 / 1000000
            let _v90 = v89 / 3600
            let v91 = v89 % 3600
            let _v92 = v91 / 60
            let _v93 = v89 % 60
            let _v94 = v48 % 1000000
            let v95 = spiral_wrap_signed(v88, 32)
            let v96 = spiral_wrap_signed(v83, 32)
            let v97 = spiral_wrap_signed(v79, 32)
            let v98 = int.to_string(v95)
            let v99 = "0"
            let v100 = spiral_string_length(v98)
            let v101 = spiral_wrap_signed(4 - v100, 32)
            let v102 = 0
            let v103 = method203(v101, v99, v102)
            let v104 = ""
            let v105 = v103(v104)
            let v106 = v105 <> v98 
            let v107 = "-"
            let v108 = v106 <> v107 
            let v109 = int.to_string(v96)
            let v110 = spiral_string_length(v109)
            let v111 = spiral_wrap_signed(2 - v110, 32)
            let v112 = 0
            let v113 = method203(v111, v99, v112)
            let v114 = v113(v104)
            let v115 = v114 <> v109 
            let v116 = v108 <> v115 
            let v117 = v116 <> v107 
            let v118 = int.to_string(v97)
            let v119 = spiral_string_length(v118)
            let v120 = spiral_wrap_signed(2 - v119, 32)
            let v121 = 0
            let v122 = method203(v120, v99, v121)
            let v123 = v122(v104)
            let v124 = v123 <> v118 
            let v125 = v117 <> v124 
            let v126 = "T"
            let v127 = v125 <> v126 
            let v128 = v35 % 86400
            let v129 = v128 / 3600
            let v130 = int.to_string(v129)
            let v131 = spiral_string_length(v130)
            let v132 = spiral_wrap_signed(2 - v131, 32)
            let v133 = 0
            let v134 = method203(v132, v99, v133)
            let v135 = v134(v104)
            let v136 = v135 <> v130 
            let v137 = ":"
            let v138 = v136 <> v137 
            let v139 = v128 / 60
            let v140 = v139 % 60
            let v141 = int.to_string(v140)
            let v142 = spiral_string_length(v141)
            let v143 = spiral_wrap_signed(2 - v142, 32)
            let v144 = 0
            let v145 = method203(v143, v99, v144)
            let v146 = v145(v104)
            let v147 = v146 <> v141 
            let v148 = v138 <> v147 
            let v149 = v148 <> v137 
            let v150 = v128 % 60
            let v151 = int.to_string(v150)
            let v152 = spiral_string_length(v151)
            let v153 = spiral_wrap_signed(2 - v152, 32)
            let v154 = 0
            let v155 = method203(v153, v99, v154)
            let v156 = v155(v104)
            let v157 = v156 <> v151 
            let v158 = v149 <> v157 
            let v159 = v127 <> v158 
            let v160 = ".000Z"
            let v161 = v159 <> v160 
            let v162 = quoted_119(v161)
            let v163 = "created_at"
            let v164 = quoted_119(v163)
            let v165 = v164 <> v32 
            let v166 = v165 <> v162 
            let v167 = Uh3Nil
            let v168 = method204(v17, v167)
            let v169 = "["
            let v170 = "]"
            let v171 = 5
            let v172 = shared_layout_205(v168, v169, v170, v171)
            let v173 = "edit_history"
            let v174 = quoted_119(v173)
            let v175 = v174 <> v32 
            let v176 = v175 <> v172 
            let v177 = quoted_119(v20)
            let v178 = "id"
            let v179 = quoted_119(v178)
            let v180 = v179 <> v32 
            let v181 = v180 <> v177 
            let v182 = v14 != 1
            let v189 =
                case v182 {
                    True -> 0
                    False -> {
                        let v183 = Uh20Nil
                        let v184 = method207(v13, v9, v183)
                        let v185 = Uh3Nil
                        let v186 = method208(v184, v185)
                        let v187 = 0
                        method20(v186, v187)
                    }
                }
            let v190 = int.to_string(v189)
            let v191 = "like_count"
            let v192 = quoted_119(v191)
            let v193 = v192 <> v32 
            let v194 = v193 <> v190 
            let v195 = Uh22Nil
            let v196 = method209(v12, v2, v195)
            let v197 = 0
            let v198 = method210(v196, v197)
            let v199 = int.to_string(v198)
            let v200 = "reply_count"
            let v201 = quoted_119(v200)
            let v202 = v201 <> v32 
            let v203 = v202 <> v199 
            let v204 = Uh3Nil
            let v205 = Uh3Cons(v203, v204)
            let v206 = Uh3Cons(v194, v205)
            let v207 = "{"
            let v208 = "}"
            let v209 = 5
            let v210 = shared_layout_205(v206, v207, v208, v209)
            let v211 = "metrics"
            let v212 = quoted_119(v211)
            let v213 = v212 <> v32 
            let v214 = v213 <> v210 
            let v237 =
                case v16  {
                    Us26None -> {
                        let v235 = "[]"
                        v235
                    }
                    Us26Some(v215) -> {
                        let v216 = quoted_119(v215)
                        let v217 = quoted_119(v178)
                        let v218 = v217 <> v32 
                        let v219 = v218 <> v216 
                        let v220 = "replied_to"
                        let v221 = quoted_119(v220)
                        let v222 = "type"
                        let v223 = quoted_119(v222)
                        let v224 = v223 <> v32 
                        let v225 = v224 <> v221 
                        let v226 = Uh3Nil
                        let v227 = Uh3Cons(v225, v226)
                        let v228 = Uh3Cons(v219, v227)
                        let v229 = 6
                        let v230 = shared_layout_205(v228, v207, v208, v229)
                        let v231 = Uh3Nil
                        let v232 = Uh3Cons(v230, v231)
                        let v233 = 5
                        shared_layout_205(v232, v169, v170, v233)
                    }
                }
            let v238 = "refs"
            let v239 = quoted_119(v238)
            let v240 = v239 <> v32 
            let v241 = v240 <> v237 
            let v242 = quoted_119(v22)
            let v243 = "text"
            let v244 = quoted_119(v243)
            let v245 = v244 <> v32 
            let v246 = v245 <> v242 
            let v247 = Uh3Nil
            let v248 = Uh3Cons(v246, v247)
            let v249 = Uh3Cons(v241, v248)
            let v250 = Uh3Cons(v214, v249)
            let v251 = Uh3Cons(v181, v250)
            let v252 = Uh3Cons(v176, v251)
            let v253 = Uh3Cons(v166, v252)
            let v254 = Uh3Cons(v34, v253)
            let v255 = 4
            let v256 = shared_layout_205(v254, v207, v208, v255)
            Uh3Cons(v256, v24)
        }
        Uh23Nil -> v19
    }
}

pub fn method201(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh19, v9: Uh20, v10: Int, v11: Int, v12: Uh22, v13: Uh3) -> Uh3 {
    case v12  {
        Uh22Cons(v14, v15, v16, v17, v18, v19, v20) -> {
            let v21 = method201(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v20, v13)
            let v22 = Uh3Nil
            let v23 = method202(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v14, v15, v16, v17, v18, v19, v19, v22)
            method18(v23, v21)
        }
        Uh22Nil -> v13
    }
}

pub fn method213(v0: Uh22, v1: Uh27) -> Uh27 {
    case v0  {
        Uh22Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method213(v8, v1)
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

pub fn method214(v0: String) -> fn(String) -> Bool {
    closure26(#(v0))
}

pub fn method215(v0: String, v1: fn(String) -> Bool, v2: Uh27) -> Bool {
    case v2  {
        Uh27Cons(v3, v4) -> {
            let v5 = v1(v3)
            case v5 {
                True -> True
                False -> {
                    let v6 = method214(v0)
                    method215(v0, v6, v4)
                }
            }
        }
        Uh27Nil -> False
    }
}

pub fn method212(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh22, v9: Uh26) -> Uh26 {
    case v8  {
        Uh22Cons(v10, v11, v12, v13, v14, v15, v16) -> {
            let v17 = method212(v0, v1, v2, v3, v4, v5, v6, v7, v16, v9)
            let v31 =
                case v14  {
                    Us26Some(v18) -> {
                        let v19 = v12 == 1
                        let v25 =
                            case v19 {
                                True -> {
                                    let v20 = Uh27Nil
                                    let v21 = method213(v2, v20)
                                    let v22 = method214(v18)
                                    let v23 = method215(v18, v22, v21)
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
            method192(v31, v17)
        }
        Uh22Nil -> v9
    }
}

pub fn gaps_211(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26) -> Uh26 {
    let v8 = Uh22Nil
    let v9 = method200(v0, v1, v2, v3, v4, v5, v6, v7, v3, v8)
    let v10 = Uh26Nil
    method212(v0, v1, v2, v3, v4, v5, v6, v7, v9, v10)
}

pub fn method216(v0: Uh26, v1: Uh3) -> Uh3 {
    case v0  {
        Uh26Cons(v2, v3) -> {
            let v4 = method216(v3, v1)
            Uh3Cons(v2, v4)
        }
        Uh26Nil -> v1
    }
}

pub fn method217(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method217(v3, v1)
            let v5 = quoted_119(v2)
            Uh3Cons(v5, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method219(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh26, v9: Uh26) -> Uh26 {
    case v8  {
        Uh26Cons(v10, v11) -> {
            let v12 = method219(v0, v1, v2, v3, v4, v5, v6, v7, v11, v9)
            let v13 = method196(v10)
            let v14 = method197(v10, v13, v6)
            let v15 = v14 == False
            let v19 =
                case v15 {
                    True -> {
                        let v16 = method196(v10)
                        let v17 = method197(v10, v16, v7)
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

pub fn method221(v0: String, v1: Uh22, v2: Uh22) -> Uh22 {
    case v1  {
        Uh22Cons(v3, v4, v5, v6, v7, v8, v9) -> {
            let v10 = method221(v0, v9, v2)
            let v11 = v4 == v0
            case v11 {
                True -> Uh22Cons(v3, v4, v5, v6, v7, v8, v10)
                False -> v10
            }
        }
        Uh22Nil -> v2
    }
}

pub fn by_k_223(v0: String, v1: String, v2: Int, v3: Int, v4: Us26, v5: Uh23, v6: Uh22) -> Uh22 {
    case v6  {
        Uh22Cons(v7, v8, v9, v10, v11, v12, v13) -> {
            let v14 = v9 < v2
            case v14 {
                True -> {
                    let v15 = by_k_223(v0, v1, v2, v3, v4, v5, v13)
                    Uh22Cons(v7, v8, v9, v10, v11, v12, v15)
                }
                False -> Uh22Cons(v0, v1, v2, v3, v4, v5, v6)
            }
        }
        _ -> Uh22Cons(v0, v1, v2, v3, v4, v5, v6)
    }
}

pub fn method222(v0: Uh22, v1: Uh22) -> Uh22 {
    case v0  {
        Uh22Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = by_k_223(v2, v3, v4, v5, v6, v7, v1)
            method222(v8, v9)
        }
        Uh22Nil -> v1
    }
}

pub fn method225(v0: Uh23, v1: String) -> String {
    case v0  {
        Uh23Cons(v2, v3, v4, v5) -> method225(v5, v4)
        Uh23Nil -> v1
    }
}

pub fn restored_text_226(v0: String) -> String {
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

pub fn method224(v0: Uh22, v1: Uh3) -> Uh3 {
    case v0  {
        Uh22Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method224(v8, v1)
            let v10 = ""
            let v11 = method225(v7, v10)
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
                        restored_text_226(v28)
                    }
                }
            Uh3Cons(v30, v9)
        }
        Uh22Nil -> v1
    }
}

pub fn method220(v0: Int, v1: Int, v2: Uh22, v3: Uh24, v4: Uh25, v5: Us26, v6: Uh26, v7: Uh26, v8: Uh26, v9: Uh3) -> Uh3 {
    case v8  {
        Uh26Cons(v10, v11) -> {
            let v12 = method220(v0, v1, v2, v3, v4, v5, v6, v7, v11, v9)
            let v13 = Uh22Nil
            let v14 = method221(v10, v2, v13)
            let v15 = Uh22Nil
            let v16 = method222(v14, v15)
            let v17 = Uh3Nil
            let v18 = method224(v16, v17)
            let v19 = ""
            let v20 = delimited_21(v19, v18)
            Uh3Cons(v20, v12)
        }
        Uh26Nil -> v9
    }
}

pub fn program_218(v0: Uh21, v1: Int, v2: Int, v3: Uh22, v4: Uh24, v5: Uh25, v6: Us26, v7: Uh26, v8: Uh26) -> String {
    let v9 = Uh26Nil
    let v10 = method182(v0, v9)
    let v11 = Uh26Nil
    let v12 = method219(v1, v2, v3, v4, v5, v6, v7, v8, v10, v11)
    let v13 = Uh3Nil
    let v14 = method220(v1, v2, v3, v4, v5, v6, v7, v8, v12, v13)
    let v15 = "\n\n"
    delimited_21(v15, v14)
}
