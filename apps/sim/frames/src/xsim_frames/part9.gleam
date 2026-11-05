import gleam/int
import gleam/order
import gleam/string
import xsim_frames/types.{type Uh3, type Uh19, type Uh20, type Us29, type Us30, type Us31, Uh19Cons, Uh19Nil, Uh20Cons, Uh20Nil, Uh21Nil, Uh22Nil, Uh3Cons, Uh3Nil, Uh7Nil, Us26None, Us26Some, Us2None, Us2Some, Us30EvictAfter, Us30EvictNow, Us31None, Us31Some, Us32None, Us32Some, Us3None, Us3Some}
import xsim_frames/part1.{count_of_text_10, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part2.{method18, method20}
import xsim_frames/part3.{method54, method55}
import xsim_frames/part5.{from_cells_63, quoted_119, stream_115}
import xsim_frames/part6.{closure16, deliveries_129, exploded_138, final_replay_147, method158, method159}
import xsim_frames/part8.{gaps_211, materialized_160, method200, method201, method216, method217, program_218, shared_layout_205}

pub fn world_files_146(v0: Int, v1: Int, v2: String, v3: Int, v4: Int, v5: Int, v6: String, v7: String, v8: String, v9: fn(String) -> fn(Int) -> fn(String) -> Uh3, v10: Uh3) -> #(String, String) {
    let v11 = ","
    let v12 = "+"
    let v13 = v2 |> string.replace(v11, v12)
    let v14 = v13 == ""
    let v17 =
        case v14 {
            True -> Uh3Nil
            False -> split_list_2(v12, v13)
        }
    let v18 = Uh3Nil
    let v19 = method54(v17, v18)
    let v20 = Uh7Nil
    let v21 = method55(v19, v20)
    let v22 = 8
    let v23 = 0
    let v24 = 0
    let v25 = False
    let v26 = ""
    let #(_v27, v28, _v29) = from_cells_63(v0, v22, v1, v23, v24, v21, v25, v26, v10)
    let #(v30, v31) = final_replay_147(v28)
    let v32 = Uh19Nil
    let v33 = method158(v30, v32)
    let v34 = Uh21Nil
    let v35 = method159(v33, v34)
    let #(v36, v37, v38, v39, v40, v41, v42, v43) = materialized_160(v9, v35, v3, v4, v5)
    let v44 = spiral_string_slice(v6, 0, 3)
    let v45 = count_of_text_10(v44)
    let v48 =
        case v45  {
            Us3None -> 0
            Us3Some(v46) -> v46
        }
    let v49 = spiral_string_slice(v6, 5, 6)
    let v50 = count_of_text_10(v49)
    let v53 =
        case v50  {
            Us3None -> 0
            Us3Some(v51) -> v51
        }
    let v54 = spiral_string_slice(v6, 8, 9)
    let v55 = count_of_text_10(v54)
    let v58 =
        case v55  {
            Us3None -> 0
            Us3Some(v56) -> v56
        }
    let v59 = spiral_wrap_signed(v48, 64)
    let v60 = spiral_wrap_signed(v53, 64)
    let v61 = spiral_wrap_signed(v58, 64)
    let v62 = v60 <= 2
    let v64 =
        case v62 {
            True -> {
                let v63 = spiral_wrap_signed(v59 - 1, 64)
                v63
            }
            False -> v59
        }
    let v65 = v64 / 400
    let v66 = v64 % 400
    let v67 = v66 != 0
    let v69 =
        case v67 {
            True -> {
                let v68 = v64 < 0
                v68
            }
            False -> False
        }
    let v71 =
        case v69 {
            True -> {
                let v70 = spiral_wrap_signed(v65 - 1, 64)
                v70
            }
            False -> v65
        }
    let v72 = spiral_wrap_signed(v71 * 400, 64)
    let v73 = spiral_wrap_signed(v64 - v72, 64)
    let v74 = v60 > 2
    let v77 =
        case v74 {
            True -> {
                let v75 = spiral_wrap_signed(v60 - 3, 64)
                v75
            }
            False -> {
                let v76 = spiral_wrap_signed(v60 + 9, 64)
                v76
            }
        }
    let v78 = spiral_wrap_signed(153 * v77, 64)
    let v79 = spiral_wrap_signed(v78 + 2, 64)
    let v80 = v79 / 5
    let v81 = spiral_wrap_signed(v80 + v61, 64)
    let v82 = spiral_wrap_signed(v81 - 1, 64)
    let v83 = spiral_wrap_signed(v73 * 365, 64)
    let v84 = v73 / 4
    let v85 = spiral_wrap_signed(v83 + v84, 64)
    let v86 = v73 / 100
    let v87 = spiral_wrap_signed(v85 - v86, 64)
    let v88 = spiral_wrap_signed(v87 + v82, 64)
    let v89 = spiral_wrap_signed(v71 * 146097, 64)
    let v90 = spiral_wrap_signed(v89 + v88, 64)
    let v91 = spiral_wrap_signed(v90 - 719468, 64)
    let v92 = spiral_wrap_signed(v91, 32)
    let v93 = spiral_string_slice(v6, 11, 12)
    let v94 = count_of_text_10(v93)
    let v97 =
        case v94  {
            Us3None -> 0
            Us3Some(v95) -> v95
        }
    let v98 = spiral_wrap_signed(v97 * 3600, 32)
    let v99 = spiral_string_slice(v6, 14, 15)
    let v100 = count_of_text_10(v99)
    let v103 =
        case v100  {
            Us3None -> 0
            Us3Some(v101) -> v101
        }
    let v104 = spiral_wrap_signed(v103 * 60, 32)
    let v105 = spiral_wrap_signed(v98 + v104, 32)
    let v106 = spiral_string_slice(v6, 17, 18)
    let v107 = count_of_text_10(v106)
    let v110 =
        case v107  {
            Us3None -> 0
            Us3Some(v108) -> v108
        }
    let v111 = spiral_wrap_signed(v105 + v110, 32)
    let v112 = Uh22Nil
    let v113 = method200(v36, v37, v38, v39, v40, v41, v42, v43, v39, v112)
    let v114 = Uh3Nil
    let v115 = method201(v36, v37, v38, v39, v40, v41, v42, v43, v30, v31, v92, v111, v113, v114)
    let v116 = quoted_119(v7)
    let v117 = "id"
    let v118 = quoted_119(v117)
    let v119 = ": "
    let v120 = v118 <> v119 
    let v121 = v120 <> v116 
    let v122 = quoted_119(v8)
    let v123 = "name"
    let v124 = quoted_119(v123)
    let v125 = v124 <> v119 
    let v126 = v125 <> v122 
    let v127 = "["
    let v128 = "]"
    let v129 = 3
    let v130 = shared_layout_205(v115, v127, v128, v129)
    let v131 = "posts"
    let v132 = quoted_119(v131)
    let v133 = v132 <> v119 
    let v134 = v133 <> v130 
    let v135 = quoted_119(v8)
    let v136 = "username"
    let v137 = quoted_119(v136)
    let v138 = v137 <> v119 
    let v139 = v138 <> v135 
    let v140 = Uh3Nil
    let v141 = Uh3Cons(v139, v140)
    let v142 = Uh3Cons(v134, v141)
    let v143 = Uh3Cons(v126, v142)
    let v144 = Uh3Cons(v121, v143)
    let v145 = "{"
    let v146 = "}"
    let v147 = 2
    let v148 = shared_layout_205(v144, v145, v146, v147)
    let v149 = Uh3Nil
    let v150 = Uh3Cons(v148, v149)
    let v151 = 1
    let v152 = shared_layout_205(v150, v127, v128, v151)
    let v153 = "users"
    let v154 = quoted_119(v153)
    let v155 = v154 <> v119 
    let v156 = v155 <> v152 
    let v157 = Uh3Nil
    let v158 = Uh3Cons(v156, v157)
    let v159 = 0
    let v160 = shared_layout_205(v158, v145, v146, v159)
    let v161 = "\n"
    let v162 = v160 <> v161 
    let v163 = gaps_211(v36, v37, v38, v39, v40, v41, v42, v43)
    let v164 = Uh3Nil
    let v165 = method216(v163, v164)
    let v166 = Uh3Nil
    let v167 = method217(v165, v166)
    let v168 = 1
    let v169 = shared_layout_205(v167, v127, v128, v168)
    let v170 = "gaps"
    let v171 = quoted_119(v170)
    let v172 = v171 <> v119 
    let v173 = v172 <> v169 
    let v174 = Uh3Nil
    let v175 = method216(v42, v174)
    let v176 = Uh3Nil
    let v177 = method217(v175, v176)
    let v178 = 1
    let v179 = shared_layout_205(v177, v127, v128, v178)
    let v180 = "incomplete"
    let v181 = quoted_119(v180)
    let v182 = v181 <> v119 
    let v183 = v182 <> v179 
    let v184 = program_218(v35, v36, v37, v38, v39, v40, v41, v42, v43)
    let v185 = v184 == ""
    let v188 =
        case v185 {
            True -> Uh3Nil
            False -> split_list_2(v161, v184)
        }
    let v189 = Uh3Nil
    let v190 = method217(v188, v189)
    let v191 = 1
    let v192 = shared_layout_205(v190, v127, v128, v191)
    let v193 = "program"
    let v194 = quoted_119(v193)
    let v195 = v194 <> v119 
    let v196 = v195 <> v192 
    let v201 =
        case v41  {
            Us26None -> {
                let v199 = "null"
                v199
            }
            Us26Some(v197) -> quoted_119(v197)
        }
    let v202 = "root"
    let v203 = quoted_119(v202)
    let v204 = v203 <> v119 
    let v205 = v204 <> v201 
    let v206 = Uh3Nil
    let v207 = Uh3Cons(v205, v206)
    let v208 = Uh3Cons(v196, v207)
    let v209 = Uh3Cons(v183, v208)
    let v210 = Uh3Cons(v173, v209)
    let v211 = 0
    let v212 = shared_layout_205(v210, v145, v146, v211)
    let v213 = v212 <> v161 
    #(v162, v213)
}

pub fn closure19(capt: Nil) -> fn(#(String, Int, Int, String, Int, Int, Int, String, String, String)) -> #(String, String) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9) = dom
        let v10 = closure16(Nil)
        let v11 = unicode_erlang_characters_to_binary([0])
        let v12 = split_list_2(v11, v0)
        world_files_146(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v12)
    }
}

pub fn scenario_stream_227(v0: Int, v1: Int, v2: Int, v3: String, v4: Int, v5: Bool, v6: fn(String) -> fn(Int) -> fn(String) -> Uh3, v7: Uh3) -> String {
    let v8 = ","
    let v9 = "+"
    let v10 = v3 |> string.replace(v8, v9)
    let v11 = v10 == ""
    let v14 =
        case v11 {
            True -> Uh3Nil
            False -> split_list_2(v9, v10)
        }
    let v15 = Uh3Nil
    let v16 = method54(v14, v15)
    let v17 = Uh7Nil
    let v18 = method55(v16, v17)
    let v19 = 0
    let v20 = 0
    let v21 = False
    let v22 = ""
    let #(_v23, v24, _v25) = from_cells_63(v0, v1, v2, v19, v20, v18, v21, v22, v7)
    let v28 =
        case v5 {
            True -> {
                let v26 = 280
                exploded_138(v6, v26, v24)
            }
            False -> v24
        }
    let v29 = 1
    let v30 = 6
    let v31 = deliveries_129(v28, v29, v4, v30)
    stream_115(v31)
}

pub fn closure27(capt: Nil) -> fn(#(String, Int, Int, Int, String, Int, Bool)) -> String {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6) = dom
        let v7 = closure16(Nil)
        let v8 = unicode_erlang_characters_to_binary([0])
        let v9 = split_list_2(v8, v0)
        scenario_stream_227(v1, v2, v3, v4, v5, v6, v7, v9)
    }
}

pub fn method230(v0: Uh19, v1: Uh3) -> Uh3 {
    case v0  {
        Uh19Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method230(v6, v1)
            let v12 =
                case v3  {
                    Us2None -> {
                        let v10 = "null"
                        v10
                    }
                    Us2Some(v8) -> quoted_119(v8)
                }
            let v13 = "parent"
            let v14 = quoted_119(v13)
            let v15 = ": "
            let v16 = v14 <> v15 
            let v17 = v16 <> v12 
            let v18 = quoted_119(v2)
            let v19 = "post"
            let v20 = quoted_119(v19)
            let v21 = v20 <> v15 
            let v22 = v21 <> v18 
            let v27 =
                case v4  {
                    Uh3Cons(v23, v24) -> v23
                    Uh3Nil -> {
                        let v25 = ""
                        v25
                    }
                }
            let v28 = quoted_119(v27)
            let v29 = "source"
            let v30 = quoted_119(v29)
            let v31 = v30 <> v15 
            let v32 = v31 <> v28 
            let v33 = Uh3Nil
            let v34 = Uh3Cons(v32, v33)
            let v35 = Uh3Cons(v22, v34)
            let v36 = Uh3Cons(v17, v35)
            let v37 = "{"
            let v38 = "}"
            let v39 = 2
            let v40 = shared_layout_205(v36, v37, v38, v39)
            Uh3Cons(v40, v7)
        }
        Uh19Nil -> v1
    }
}

pub fn inserted_232(v0: String, v1: Uh3, v2: Uh20) -> Uh20 {
    case v2  {
        Uh20Cons(v3, v4, v5) -> {
            let v6 = string.compare(v0, v3) == order.Lt
            let v9 =
                case v6 {
                    True -> -1
                    False -> {
                        let v7 = string.compare(v0, v3) == order.Gt
                        case v7 {
                            True -> 1
                            False -> 0
                        }
                    }
                }
            let v10 = v9 == 1
            case v10 {
                True -> {
                    let v11 = inserted_232(v0, v1, v5)
                    Uh20Cons(v3, v4, v11)
                }
                False -> Uh20Cons(v0, v1, v2)
            }
        }
        _ -> Uh20Cons(v0, v1, v2)
    }
}

pub fn method231(v0: Uh20, v1: Uh20) -> Uh20 {
    case v0  {
        Uh20Cons(v2, v3, v4) -> {
            let v5 = inserted_232(v2, v3, v1)
            method231(v4, v5)
        }
        Uh20Nil -> v1
    }
}

pub fn method233(v0: Uh20, v1: Uh3) -> Uh3 {
    case v0  {
        Uh20Cons(v2, v3, v4) -> {
            let v5 = method233(v4, v1)
            let v6 = 0
            let v7 = method20(v3, v6)
            let v8 = int.to_string(v7)
            let v9 = quoted_119(v2)
            let v10 = ": "
            let v11 = v9 <> v10 
            let v12 = v11 <> v8 
            Uh3Cons(v12, v5)
        }
        Uh20Nil -> v1
    }
}

pub fn final_json_229(v0: Uh19, v1: Uh20) -> String {
    let v2 = Uh19Nil
    let v3 = method158(v0, v2)
    let v4 = Uh3Nil
    let v5 = method230(v3, v4)
    let v6 = "["
    let v7 = "]"
    let v8 = 1
    let v9 = shared_layout_205(v5, v6, v7, v8)
    let v10 = "cells"
    let v11 = quoted_119(v10)
    let v12 = ": "
    let v13 = v11 <> v12 
    let v14 = v13 <> v9 
    let v15 = Uh20Nil
    let v16 = method231(v1, v15)
    let v17 = Uh3Nil
    let v18 = method233(v16, v17)
    let v19 = "{"
    let v20 = "}"
    let v21 = 1
    let v22 = shared_layout_205(v18, v19, v20, v21)
    let v23 = "likes"
    let v24 = quoted_119(v23)
    let v25 = v24 <> v12 
    let v26 = v25 <> v22 
    let v27 = Uh3Nil
    let v28 = Uh3Cons(v26, v27)
    let v29 = Uh3Cons(v14, v28)
    let v30 = 0
    let v31 = shared_layout_205(v29, v19, v20, v30)
    let v32 = "\n"
    let v33 = v31 <> v32 
    v33
}

pub fn scenario_final_228(v0: Int, v1: Int, v2: Int, v3: String, _v4: Int, _v5: Bool, _v6: fn(String) -> fn(Int) -> fn(String) -> Uh3, v7: Uh3) -> String {
    let v8 = ","
    let v9 = "+"
    let v10 = v3 |> string.replace(v8, v9)
    let v11 = v10 == ""
    let v14 =
        case v11 {
            True -> Uh3Nil
            False -> split_list_2(v9, v10)
        }
    let v15 = Uh3Nil
    let v16 = method54(v14, v15)
    let v17 = Uh7Nil
    let v18 = method55(v16, v17)
    let v19 = 0
    let v20 = 0
    let v21 = False
    let v22 = ""
    let #(_v23, v24, _v25) = from_cells_63(v0, v1, v2, v19, v20, v18, v21, v22, v7)
    let #(v26, v27) = final_replay_147(v24)
    final_json_229(v26, v27)
}

pub fn closure28(capt: Nil) -> fn(#(String, Int, Int, Int, String, Int, Bool)) -> String {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6) = dom
        let v7 = closure16(Nil)
        let v8 = unicode_erlang_characters_to_binary([0])
        let v9 = split_list_2(v8, v0)
        scenario_final_228(v1, v2, v3, v4, v5, v6, v7, v9)
    }
}

pub fn closure31(capt: #(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> Us31 {
    fn (v20) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19) = capt
        let v21 = v20 == "frames"
        case v21 {
            True -> Us31Some(v0, v1, v2, v3, v4, v5, True, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
            False -> {
                let v23 = v20 == "memo"
                let v36 =
                    case v23 {
                        True -> Us32Some(v14, v15, v16, v17, True, v19)
                        False -> {
                            let v25 = v20 == "daemon-memory"
                            case v25 {
                                True -> Us32Some(v14, v15, v16, v17, v18, True)
                                False -> {
                                    let v27 = v20 == "evict"
                                    case v27 {
                                        True -> {
                                            let v31 =
                                                case v16  {
                                                    Us30EvictAfter(v28) -> Us30EvictAfter(v28)
                                                    _ -> Us30EvictNow
                                                }
                                            Us32Some(v14, v15, v31, v17, v18, v19)
                                        }
                                        False -> Us32None
                                    }
                                }
                            }
                        }
                    }
                case v36  {
                    Us32None -> Us31None
                    Us32Some(v37, v38, v39, v40, v41, v42) -> Us31Some(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v37, v38, v39, v40, v41, v42)
                }
            }
        }
    }
}

pub fn closure30(capt: Nil) -> fn(#(Uh3, String, Int, Int, Int, String, Bool, Int, Int, Int, Int, Int, String, String, Us29, Int, Us30, Int, Bool, Bool)) -> fn(String) -> Us31 {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19) = dom
        closure31(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19))
    }
}

pub fn method234(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method234(v3, v1)
            let v5 = v2 == ""
            let v9 =
                case v5 {
                    True -> Uh3Nil
                    False -> {
                        let v7 = "+"
                        split_list_2(v7, v2)
                    }
                }
            method18(v9, v4)
        }
        Uh3Nil -> v1
    }
}
