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
    let v59 = v53 <= 2
    let v61 =
        case v59 {
            True -> {
                let v60 = spiral_wrap_signed(v48 - 1, 32)
                v60
            }
            False -> v48
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
    let v83 = count_of_text_10(v82)
    let v86 =
        case v83  {
            Us3None -> 0
            Us3Some(v84) -> v84
        }
    let v87 = spiral_wrap_signed(v86 * 3600, 32)
    let v88 = spiral_string_slice(v6, 14, 15)
    let v89 = count_of_text_10(v88)
    let v92 =
        case v89  {
            Us3None -> 0
            Us3Some(v90) -> v90
        }
    let v93 = spiral_wrap_signed(v92 * 60, 32)
    let v94 = spiral_wrap_signed(v87 + v93, 32)
    let v95 = spiral_string_slice(v6, 17, 18)
    let v96 = count_of_text_10(v95)
    let v99 =
        case v96  {
            Us3None -> 0
            Us3Some(v97) -> v97
        }
    let v100 = spiral_wrap_signed(v94 + v99, 32)
    let v101 = Uh22Nil
    let v102 = method200(v36, v37, v38, v39, v40, v41, v42, v43, v39, v101)
    let v103 = Uh3Nil
    let v104 = method201(v36, v37, v38, v39, v40, v41, v42, v43, v30, v31, v81, v100, v102, v103)
    let v105 = quoted_119(v7)
    let v106 = "id"
    let v107 = quoted_119(v106)
    let v108 = ": "
    let v109 = v107 <> v108 
    let v110 = v109 <> v105 
    let v111 = quoted_119(v8)
    let v112 = "name"
    let v113 = quoted_119(v112)
    let v114 = v113 <> v108 
    let v115 = v114 <> v111 
    let v116 = "["
    let v117 = "]"
    let v118 = 3
    let v119 = shared_layout_205(v104, v116, v117, v118)
    let v120 = "posts"
    let v121 = quoted_119(v120)
    let v122 = v121 <> v108 
    let v123 = v122 <> v119 
    let v124 = quoted_119(v8)
    let v125 = "username"
    let v126 = quoted_119(v125)
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
    let v137 = shared_layout_205(v133, v134, v135, v136)
    let v138 = Uh3Nil
    let v139 = Uh3Cons(v137, v138)
    let v140 = 1
    let v141 = shared_layout_205(v139, v116, v117, v140)
    let v142 = "users"
    let v143 = quoted_119(v142)
    let v144 = v143 <> v108 
    let v145 = v144 <> v141 
    let v146 = Uh3Nil
    let v147 = Uh3Cons(v145, v146)
    let v148 = 0
    let v149 = shared_layout_205(v147, v134, v135, v148)
    let v150 = "\n"
    let v151 = v149 <> v150 
    let v152 = gaps_211(v36, v37, v38, v39, v40, v41, v42, v43)
    let v153 = Uh3Nil
    let v154 = method216(v152, v153)
    let v155 = Uh3Nil
    let v156 = method217(v154, v155)
    let v157 = 1
    let v158 = shared_layout_205(v156, v116, v117, v157)
    let v159 = "gaps"
    let v160 = quoted_119(v159)
    let v161 = v160 <> v108 
    let v162 = v161 <> v158 
    let v163 = Uh3Nil
    let v164 = method216(v42, v163)
    let v165 = Uh3Nil
    let v166 = method217(v164, v165)
    let v167 = 1
    let v168 = shared_layout_205(v166, v116, v117, v167)
    let v169 = "incomplete"
    let v170 = quoted_119(v169)
    let v171 = v170 <> v108 
    let v172 = v171 <> v168 
    let v173 = program_218(v35, v36, v37, v38, v39, v40, v41, v42, v43)
    let v174 = v173 == ""
    let v177 =
        case v174 {
            True -> Uh3Nil
            False -> split_list_2(v150, v173)
        }
    let v178 = Uh3Nil
    let v179 = method217(v177, v178)
    let v180 = 1
    let v181 = shared_layout_205(v179, v116, v117, v180)
    let v182 = "program"
    let v183 = quoted_119(v182)
    let v184 = v183 <> v108 
    let v185 = v184 <> v181 
    let v190 =
        case v41  {
            Us26None -> {
                let v188 = "null"
                v188
            }
            Us26Some(v186) -> quoted_119(v186)
        }
    let v191 = "root"
    let v192 = quoted_119(v191)
    let v193 = v192 <> v108 
    let v194 = v193 <> v190 
    let v195 = Uh3Nil
    let v196 = Uh3Cons(v194, v195)
    let v197 = Uh3Cons(v185, v196)
    let v198 = Uh3Cons(v172, v197)
    let v199 = Uh3Cons(v162, v198)
    let v200 = 0
    let v201 = shared_layout_205(v199, v134, v135, v200)
    let v202 = v201 <> v150 
    #(v151, v202)
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
            let v8 = string.inspect(v7)
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
