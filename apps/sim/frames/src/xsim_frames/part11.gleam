import gleam/list
import gleam/order
import gleam/string
import xsim_frames/types.{type Uh3, type Uh8, type Uh20, type Uh21, Global, Uh20Cons, Uh20Nil, Uh21Cons, Uh21Nil, Uh22Nil, Uh23Nil, Uh3Cons, Uh3Nil, Uh7Nil, Uh8Cons, Uh8Nil, Us0None, Us0Some, Us26None, Us26Some, Us3None, Us3Some}
import xsim_frames/part1.{count_of_text_7, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_on_2, unicode_erlang_characters_to_binary, x_binary_split}
import xsim_frames/part10.{gaps_218, materialized_169, method207, method208, method223, method224, program_225, shared_layout_212}
import xsim_frames/part2.{concat_balanced_20, method15, method17, method18}
import xsim_frames/part3.{closure0}
import xsim_frames/part4.{closure5, closure7, closure9, listed_pieces_58, method52, method53}
import xsim_frames/part6.{closure10, closure12, from_cells_62, quoted_117, stream_114}
import xsim_frames/part7.{closure13, closure14, deliveries_127}
import xsim_frames/part8.{closure15, exploded_136, final_replay_156, method167, method168, split_cell_138, without_blank_tail_172}

pub fn world_files_155(v0: Int, v1: Int, v2: String, v3: Int, v4: Int, v5: Int, v6: String, v7: String, v8: String, v9: Uh3) -> #(String, String) {
    let v10 = ","
    let v11 = "+"
    let v12 = v2 |> string.replace(v10, v11)
    let v13 = v12 == ""
    let v16 =
        case v13 {
            True -> {
                Uh3Nil
            }
            False -> {
                split_on_2(v11, v12)
            }
        }
    let v17 = Uh3Nil
    let v18 = method52(v16, v17)
    let v19 = Uh7Nil
    let v20 = method53(v18, v19)
    let v21 = 8
    let v22 = 0
    let v23 = 0
    let v24 = False
    let v25 = ""
    let #(_v26, v27, _v28) = from_cells_62(v0, v21, v1, v22, v23, v20, v24, v25, v9)
    let #(v29, v30) = final_replay_156(v27)
    let v31 = Uh20Nil
    let v32 = method167(v29, v31)
    let v33 = Uh22Nil
    let v34 = method168(v32, v33)
    let #(v35, v36, v37, v38, v39, v40, v41, v42) = materialized_169(v34, v3, v4, v5)
    let v43 = spiral_string_slice(v6, 0, 3)
    let v44 = count_of_text_7(v43)
    let v47 =
        case v44  {
            Us3None -> {
                0
            }
            Us3Some(v45) -> {
                v45
            }
        }
    let v48 = spiral_string_slice(v6, 5, 6)
    let v49 = count_of_text_7(v48)
    let v52 =
        case v49  {
            Us3None -> {
                0
            }
            Us3Some(v50) -> {
                v50
            }
        }
    let v53 = spiral_string_slice(v6, 8, 9)
    let v54 = count_of_text_7(v53)
    let v57 =
        case v54  {
            Us3None -> {
                0
            }
            Us3Some(v55) -> {
                v55
            }
        }
    let v58 = v52 <= 2
    let v60 =
        case v58 {
            True -> {
                let v59 = spiral_wrap_signed(v47 - 1, 32)
                v59
            }
            False -> {
                v47
            }
        }
    let v61 = v60 % 400
    let v62 = v60 / 400
    let v63 = spiral_wrap_signed(v62 * 146097, 32)
    let v64 = spiral_wrap_signed(v61 * 365, 32)
    let v65 = spiral_wrap_signed(v63 + v64, 32)
    let v66 = v61 / 4
    let v67 = spiral_wrap_signed(v65 + v66, 32)
    let v68 = v61 / 100
    let v69 = spiral_wrap_signed(v67 - v68, 32)
    let v70 = v52 > 2
    let v73 =
        case v70 {
            True -> {
                let v71 = spiral_wrap_signed(v52 - 3, 32)
                v71
            }
            False -> {
                let v72 = spiral_wrap_signed(v52 + 9, 32)
                v72
            }
        }
    let v74 = spiral_wrap_signed(153 * v73, 32)
    let v75 = spiral_wrap_signed(v74 + 2, 32)
    let v76 = v75 / 5
    let v77 = spiral_wrap_signed(v76 + v57, 32)
    let v78 = spiral_wrap_signed(v77 - 1, 32)
    let v79 = spiral_wrap_signed(v69 + v78, 32)
    let v80 = spiral_wrap_signed(v79 - 719468, 32)
    let v81 = spiral_string_slice(v6, 11, 12)
    let v82 = count_of_text_7(v81)
    let v85 =
        case v82  {
            Us3None -> {
                0
            }
            Us3Some(v83) -> {
                v83
            }
        }
    let v86 = spiral_wrap_signed(v85 * 3600, 32)
    let v87 = spiral_string_slice(v6, 14, 15)
    let v88 = count_of_text_7(v87)
    let v91 =
        case v88  {
            Us3None -> {
                0
            }
            Us3Some(v89) -> {
                v89
            }
        }
    let v92 = spiral_wrap_signed(v91 * 60, 32)
    let v93 = spiral_wrap_signed(v86 + v92, 32)
    let v94 = spiral_string_slice(v6, 17, 18)
    let v95 = count_of_text_7(v94)
    let v98 =
        case v95  {
            Us3None -> {
                0
            }
            Us3Some(v96) -> {
                v96
            }
        }
    let v99 = spiral_wrap_signed(v93 + v98, 32)
    let v100 = Uh23Nil
    let v101 = method207(v35, v36, v37, v38, v39, v40, v41, v42, v38, v100)
    let v102 = Uh3Nil
    let v103 = method208(v35, v36, v37, v38, v39, v40, v41, v42, v29, v30, v80, v99, v101, v102)
    let v104 = quoted_117(v7)
    let v105 = "id"
    let v106 = quoted_117(v105)
    let v107 = ": "
    let v108 = v106 <> v107 
    let v109 = v108 <> v104 
    let v110 = quoted_117(v8)
    let v111 = "name"
    let v112 = quoted_117(v111)
    let v113 = v112 <> v107 
    let v114 = v113 <> v110 
    let v115 = "["
    let v116 = "]"
    let v117 = 3
    let v118 = shared_layout_212(v103, v115, v116, v117)
    let v119 = "posts"
    let v120 = quoted_117(v119)
    let v121 = v120 <> v107 
    let v122 = v121 <> v118 
    let v123 = quoted_117(v8)
    let v124 = "username"
    let v125 = quoted_117(v124)
    let v126 = v125 <> v107 
    let v127 = v126 <> v123 
    let v128 = Uh3Nil
    let v129 = Uh3Cons(v127, v128)
    let v130 = Uh3Cons(v122, v129)
    let v131 = Uh3Cons(v114, v130)
    let v132 = Uh3Cons(v109, v131)
    let v133 = "{"
    let v134 = "}"
    let v135 = 2
    let v136 = shared_layout_212(v132, v133, v134, v135)
    let v137 = Uh3Nil
    let v138 = Uh3Cons(v136, v137)
    let v139 = 1
    let v140 = shared_layout_212(v138, v115, v116, v139)
    let v141 = "users"
    let v142 = quoted_117(v141)
    let v143 = v142 <> v107 
    let v144 = v143 <> v140 
    let v145 = Uh3Nil
    let v146 = Uh3Cons(v144, v145)
    let v147 = 0
    let v148 = shared_layout_212(v146, v133, v134, v147)
    let v149 = "\n"
    let v150 = v148 <> v149 
    let v151 = gaps_218(v35, v36, v37, v38, v39, v40, v41, v42)
    let v152 = Uh3Nil
    let v153 = method223(v151, v152)
    let v154 = Uh3Nil
    let v155 = method224(v153, v154)
    let v156 = 1
    let v157 = shared_layout_212(v155, v115, v116, v156)
    let v158 = "gaps"
    let v159 = quoted_117(v158)
    let v160 = v159 <> v107 
    let v161 = v160 <> v157 
    let v162 = Uh3Nil
    let v163 = method223(v41, v162)
    let v164 = Uh3Nil
    let v165 = method224(v163, v164)
    let v166 = 1
    let v167 = shared_layout_212(v165, v115, v116, v166)
    let v168 = "incomplete"
    let v169 = quoted_117(v168)
    let v170 = v169 <> v107 
    let v171 = v170 <> v167 
    let v172 = program_225(v34, v35, v36, v37, v38, v39, v40, v41, v42)
    let v173 = v172 == ""
    let v176 =
        case v173 {
            True -> {
                Uh3Nil
            }
            False -> {
                split_on_2(v149, v172)
            }
        }
    let v177 = Uh3Nil
    let v178 = method224(v176, v177)
    let v179 = 1
    let v180 = shared_layout_212(v178, v115, v116, v179)
    let v181 = "program"
    let v182 = quoted_117(v181)
    let v183 = v182 <> v107 
    let v184 = v183 <> v180 
    let v189 =
        case v40  {
            Us26None -> {
                let v187 = "null"
                v187
            }
            Us26Some(v185) -> {
                quoted_117(v185)
            }
        }
    let v190 = "root"
    let v191 = quoted_117(v190)
    let v192 = v191 <> v107 
    let v193 = v192 <> v189 
    let v194 = Uh3Nil
    let v195 = Uh3Cons(v193, v194)
    let v196 = Uh3Cons(v184, v195)
    let v197 = Uh3Cons(v171, v196)
    let v198 = Uh3Cons(v161, v197)
    let v199 = 0
    let v200 = shared_layout_212(v198, v133, v134, v199)
    let v201 = v200 <> v149 
    #(v150, v201)
}

pub fn closure19(capt: Nil) -> fn(#(String, Int, Int, String, Int, Int, Int, String, String, String)) -> #(String, String) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9) = dom
        let v10 = unicode_erlang_characters_to_binary([0])
        let v11 = x_binary_split(v0, v10, [Global])
        let v12 = Uh3Nil
        let v13 = listed_pieces_58(v11, v12)
        world_files_155(v1, v2, v3, v4, v5, v6, v7, v8, v9, v13)
    }
}

pub fn closure26(capt: Nil) -> fn(#(String, Int, String)) -> Uh3 {
    fn (dom) {
        let #(v0, v1, v2) = dom
        split_cell_138(v0, v1, v2)
    }
}

pub fn with_blanks_236(v0: Int, v1: Uh3) -> Uh3 {
    let v2 = v0 <= 0
    case v2 {
        True -> {
            v1
        }
        False -> {
            let v3 = spiral_wrap_signed(v0 - 1, 32)
            let v4 = ""
            let v5 = Uh3Cons(v4, v1)
            with_blanks_236(v3, v5)
        }
    }
}

pub fn step_235(v0: Uh3, v1: Uh3, v2: Int, v3: Bool, v4: String) -> #(Uh3, Uh3, Int, Bool) {
    let v5 = v4 == ""
    let #(v45, v46, v47, v48) =
        case v5 {
            True -> {
                let v6 = spiral_wrap_signed(v2 + 1, 32)
                #(v0, v1, v6, v3)
            }
            False -> {
                let v7 = v2 > 0
                let v8 = v7 && v3
                let v15 =
                    case v8 {
                        True -> {
                            let v9 = " "
                            let v10 = v4 |> string.starts_with(v9)
                            let v13 =
                                case v10 {
                                    True -> {
                                        True
                                    }
                                    False -> {
                                        let v11 = "\t"
                                        let v12 = v4 |> string.starts_with(v11)
                                        v12
                                    }
                                }
                            let v14 = v13 == False
                            v14
                        }
                        False -> {
                            False
                        }
                    }
                let #(v41, v42, v43, v44) =
                    case v15 {
                        True -> {
                            let v16 = Uh3Nil
                            let v17 = method18(v1, v16)
                            let v18 = "\n"
                            let v19 = concat_balanced_20(v18, v17)
                            let v20 = string.to_graphemes(v19)
                            let v21 = v20 |> list.reverse
                            let v22 = Uh3Nil
                            let listm_fold = v21 |> list.fold (v22, fn (acc, x) {
                            let v23 = x
                            let v24 = acc
                            let v25 = Uh3Cons(v23, v24)
                            v25
                            })
                            let v26 = listm_fold
                            let v27 = Uh3Nil
                            let v28 = method18(v26, v27)
                            let v29 = without_blank_tail_172(v28)
                            let v30 = Uh3Nil
                            let v31 = method18(v29, v30)
                            let v32 = ""
                            let v33 = concat_balanced_20(v32, v31)
                            let v34 = spiral_wrap_signed(v2 - 1, 32)
                            let v35 = Uh3Nil
                            let v36 = with_blanks_236(v34, v35)
                            let v37 = Uh3Cons(v33, v0)
                            let v38 = Uh3Cons(v4, v36)
                            #(v37, v38, 0, True)
                        }
                        False -> {
                            let v39 = with_blanks_236(v2, v1)
                            let v40 = Uh3Cons(v4, v39)
                            #(v0, v40, 0, True)
                        }
                    }
                #(v41, v42, v43, v44)
            }
        }
    #(v45, v46, v47, v48)
}

pub fn method234(v0: Uh3, v1: Uh3, v2: Uh3, v3: Int, v4: Bool) -> #(Uh3, Uh3, Int, Bool) {
    let #(v19, v20, v21, v22) =
        case v0  {
            Uh3Cons(v5, v6) -> {
                let #(v7, v8, v9, v10) = step_235(v1, v2, v3, v4, v5)
                method234(v6, v7, v8, v9, v10)
            }
            _ -> {
                let #(v15, v16, v17, v18) =
                    case v0  {
                        Uh3Nil -> {
                            #(v1, v2, v3, v4)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v15, v16, v17, v18)
            }
        }
    #(v19, v20, v21, v22)
}

pub fn file_cells_233(v0: String) -> Uh3 {
    let v1 = "\r\n"
    let v2 = "\n"
    let v3 = v0 |> string.replace(v1, v2)
    let v4 = v3 |> string.ends_with(v2)
    let v9 =
        case v4 {
            True -> {
                let v5 = spiral_string_length(v3)
                let v6 = spiral_wrap_signed(v5 - 1, 32)
                let v7 = spiral_wrap_signed(v6 - 1, 32)
                let v8 = spiral_string_slice(v3, 0, v7)
                v8
            }
            False -> {
                v3
            }
        }
    let v10 = v9 == ""
    case v10 {
        True -> {
            Uh3Nil
        }
        False -> {
            let v12 = split_on_2(v2, v9)
            let v13 = Uh3Nil
            let v14 = Uh3Nil
            let v15 = 0
            let v16 = False
            let #(v17, v18, v19, _v20) = method234(v12, v13, v14, v15, v16)
            let v21 = with_blanks_236(v19, v18)
            let v22 = Uh3Nil
            let v23 = method18(v21, v22)
            let v24 = concat_balanced_20(v2, v23)
            let v25 = string.to_graphemes(v24)
            let v26 = v25 |> list.reverse
            let v27 = Uh3Nil
            let listm_fold = v26 |> list.fold (v27, fn (acc, x) {
            let v28 = x
            let v29 = acc
            let v30 = Uh3Cons(v28, v29)
            v30
            })
            let v31 = listm_fold
            let v32 = Uh3Nil
            let v33 = method18(v31, v32)
            let v34 = without_blank_tail_172(v33)
            let v35 = Uh3Nil
            let v36 = method18(v34, v35)
            let v37 = ""
            let v38 = concat_balanced_20(v37, v36)
            let v39 = Uh3Nil
            let v40 = Uh3Cons(v38, v39)
            method18(v17, v40)
        }
    }
}

pub fn closure27(capt: Nil) -> fn(String) -> Uh3 {
    fn (v0) {
        file_cells_233(v0)
    }
}

pub fn numbered_239(v0: String, v1: Int, v2: Int, v3: Uh3, v4: Uh3) -> Uh3 {
    case v3  {
        Uh3Cons(v7, v8) -> {
            let v9 = spiral_wrap_signed(v2 + 1, 32)
            let v10 = " "
            let v11 = v0 <> v10 
            let v12 = string.inspect(v2)
            let v13 = v11 <> v12 
            let v14 = "/"
            let v15 = v13 <> v14 
            let v16 = string.inspect(v1)
            let v17 = v15 <> v16 
            let v18 = "\n"
            let v19 = v17 <> v18 
            let v20 = v19 <> v7 
            let v21 = string.to_graphemes(v20)
            let v22 = v21 |> list.reverse
            let v23 = Uh3Nil
            let listm_fold = v22 |> list.fold (v23, fn (acc, x) {
            let v24 = x
            let v25 = acc
            let v26 = Uh3Cons(v24, v25)
            v26
            })
            let v27 = listm_fold
            let v28 = Uh3Nil
            let v29 = method18(v27, v28)
            let v30 = without_blank_tail_172(v29)
            let v31 = Uh3Nil
            let v32 = method18(v30, v31)
            let v33 = ""
            let v34 = concat_balanced_20(v33, v32)
            let v35 = Uh3Cons(v34, v4)
            numbered_239(v0, v1, v9, v8, v35)
        }
        Uh3Nil -> {
            let v5 = Uh3Nil
            method18(v4, v5)
        }
    }
}

pub fn cell_posts_238(v0: Int, v1: String) -> Uh3 {
    let v2 = string.inspect(v0)
    let v3 = "c"
    let v4 = v3 <> v2 
    let v5 = 280
    let v6 = split_cell_138(v4, v5, v1)
    let v10 =
        case v6  {
            Uh3Nil -> {
                let v7 = ""
                let v8 = Uh3Nil
                Uh3Cons(v7, v8)
            }
            _ -> {
                v6
            }
        }
    let v11 = string.inspect(v0)
    let v12 = v3 <> v11 
    let v13 = 0
    let v14 = method17(v10, v13)
    let v15 = 1
    let v16 = Uh3Nil
    numbered_239(v12, v14, v15, v10, v16)
}

pub fn method240(v0: Uh8, v1: Uh8) -> Uh8 {
    case v0  {
        Uh8Cons(v2, v3) -> {
            let v4 = Uh8Cons(v2, v1)
            method240(v3, v4)
        }
        Uh8Nil -> {
            v1
        }
    }
}

pub fn method241(v0: Uh8, v1: Uh3) -> Uh3 {
    case v0  {
        Uh8Cons(v2, v3) -> {
            let v4 = method241(v3, v1)
            method15(v2, v4)
        }
        Uh8Nil -> {
            v1
        }
    }
}

pub fn thread_of_237(v0: Int, v1: Uh3, v2: Uh8) -> Uh3 {
    case v1  {
        Uh3Cons(v7, v8) -> {
            let v9 = spiral_wrap_signed(v0 + 1, 32)
            let v10 = cell_posts_238(v0, v7)
            let v11 = Uh8Cons(v10, v2)
            thread_of_237(v9, v8, v11)
        }
        Uh3Nil -> {
            let v3 = Uh8Nil
            let v4 = method240(v2, v3)
            let v5 = Uh3Nil
            method241(v4, v5)
        }
    }
}

pub fn closure28(capt: Nil) -> fn(String) -> Uh3 {
    fn (v0) {
        let v1 = 1
        let v2 = file_cells_233(v0)
        let v3 = Uh8Nil
        thread_of_237(v1, v2, v3)
    }
}

pub fn scenario_stream_242(v0: Int, v1: Int, v2: Int, v3: String, v4: Int, v5: Bool, v6: Uh3) -> String {
    let v7 = ","
    let v8 = "+"
    let v9 = v3 |> string.replace(v7, v8)
    let v10 = v9 == ""
    let v13 =
        case v10 {
            True -> {
                Uh3Nil
            }
            False -> {
                split_on_2(v8, v9)
            }
        }
    let v14 = Uh3Nil
    let v15 = method52(v13, v14)
    let v16 = Uh7Nil
    let v17 = method53(v15, v16)
    let v18 = 0
    let v19 = 0
    let v20 = False
    let v21 = ""
    let #(_v22, v23, _v24) = from_cells_62(v0, v1, v2, v18, v19, v17, v20, v21, v6)
    let v27 =
        case v5 {
            True -> {
                let v25 = 280
                exploded_136(v25, v23)
            }
            False -> {
                v23
            }
        }
    let v28 = 1
    let v29 = 6
    let v30 = deliveries_127(v27, v28, v4, v29)
    stream_114(v30)
}

pub fn closure29(capt: Nil) -> fn(#(String, Int, Int, Int, String, Int, Bool)) -> String {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6) = dom
        let v7 = unicode_erlang_characters_to_binary([0])
        let v8 = x_binary_split(v0, v7, [Global])
        let v9 = Uh3Nil
        let v10 = listed_pieces_58(v8, v9)
        scenario_stream_242(v1, v2, v3, v4, v5, v6, v10)
    }
}

pub fn method245(v0: Uh20, v1: Uh3) -> Uh3 {
    case v0  {
        Uh20Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method245(v6, v1)
            let v12 =
                case v3  {
                    Us0None -> {
                        let v10 = "null"
                        v10
                    }
                    Us0Some(v8) -> {
                        quoted_117(v8)
                    }
                }
            let v13 = "parent"
            let v14 = quoted_117(v13)
            let v15 = ": "
            let v16 = v14 <> v15 
            let v17 = v16 <> v12 
            let v18 = quoted_117(v2)
            let v19 = "post"
            let v20 = quoted_117(v19)
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
            let v28 = quoted_117(v27)
            let v29 = "source"
            let v30 = quoted_117(v29)
            let v31 = v30 <> v15 
            let v32 = v31 <> v28 
            let v33 = Uh3Nil
            let v34 = Uh3Cons(v32, v33)
            let v35 = Uh3Cons(v22, v34)
            let v36 = Uh3Cons(v17, v35)
            let v37 = "{"
            let v38 = "}"
            let v39 = 2
            let v40 = shared_layout_212(v36, v37, v38, v39)
            Uh3Cons(v40, v7)
        }
        Uh20Nil -> {
            v1
        }
    }
}

pub fn inserted_247(v0: String, v1: Uh3, v2: Uh21) -> Uh21 {
    case v2  {
        Uh21Cons(v3, v4, v5) -> {
            let v6 = string.compare(v0, v3) == order.Lt
            let v9 =
                case v6 {
                    True -> {
                        -1
                    }
                    False -> {
                        let v7 = string.compare(v0, v3) == order.Gt
                        case v7 {
                            True -> {
                                1
                            }
                            False -> {
                                0
                            }
                        }
                    }
                }
            let v10 = v9 == 1
            case v10 {
                True -> {
                    let v11 = inserted_247(v0, v1, v5)
                    Uh21Cons(v3, v4, v11)
                }
                False -> {
                    Uh21Cons(v0, v1, v2)
                }
            }
        }
        _ -> {
            Uh21Cons(v0, v1, v2)
        }
    }
}

pub fn method246(v0: Uh21, v1: Uh21) -> Uh21 {
    case v0  {
        Uh21Cons(v2, v3, v4) -> {
            let v5 = inserted_247(v2, v3, v1)
            method246(v4, v5)
        }
        Uh21Nil -> {
            v1
        }
    }
}

pub fn method248(v0: Uh21, v1: Uh3) -> Uh3 {
    case v0  {
        Uh21Cons(v2, v3, v4) -> {
            let v5 = method248(v4, v1)
            let v6 = 0
            let v7 = method17(v3, v6)
            let v8 = string.inspect(v7)
            let v9 = quoted_117(v2)
            let v10 = ": "
            let v11 = v9 <> v10 
            let v12 = v11 <> v8 
            Uh3Cons(v12, v5)
        }
        Uh21Nil -> {
            v1
        }
    }
}

pub fn final_json_244(v0: Uh20, v1: Uh21) -> String {
    let v2 = Uh20Nil
    let v3 = method167(v0, v2)
    let v4 = Uh3Nil
    let v5 = method245(v3, v4)
    let v6 = "["
    let v7 = "]"
    let v8 = 1
    let v9 = shared_layout_212(v5, v6, v7, v8)
    let v10 = "cells"
    let v11 = quoted_117(v10)
    let v12 = ": "
    let v13 = v11 <> v12 
    let v14 = v13 <> v9 
    let v15 = Uh21Nil
    let v16 = method246(v1, v15)
    let v17 = Uh3Nil
    let v18 = method248(v16, v17)
    let v19 = "{"
    let v20 = "}"
    let v21 = 1
    let v22 = shared_layout_212(v18, v19, v20, v21)
    let v23 = "likes"
    let v24 = quoted_117(v23)
    let v25 = v24 <> v12 
    let v26 = v25 <> v22 
    let v27 = Uh3Nil
    let v28 = Uh3Cons(v26, v27)
    let v29 = Uh3Cons(v14, v28)
    let v30 = 0
    let v31 = shared_layout_212(v29, v19, v20, v30)
    let v32 = "\n"
    let v33 = v31 <> v32 
    v33
}

pub fn scenario_final_243(v0: Int, v1: Int, v2: Int, v3: String, _v4: Int, _v5: Bool, v6: Uh3) -> String {
    let v7 = ","
    let v8 = "+"
    let v9 = v3 |> string.replace(v7, v8)
    let v10 = v9 == ""
    let v13 =
        case v10 {
            True -> {
                Uh3Nil
            }
            False -> {
                split_on_2(v8, v9)
            }
        }
    let v14 = Uh3Nil
    let v15 = method52(v13, v14)
    let v16 = Uh7Nil
    let v17 = method53(v15, v16)
    let v18 = 0
    let v19 = 0
    let v20 = False
    let v21 = ""
    let #(_v22, v23, _v24) = from_cells_62(v0, v1, v2, v18, v19, v17, v20, v21, v6)
    let #(v25, v26) = final_replay_156(v23)
    final_json_244(v25, v26)
}

pub fn closure30(capt: Nil) -> fn(#(String, Int, Int, Int, String, Int, Bool)) -> String {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6) = dom
        let v7 = unicode_erlang_characters_to_binary([0])
        let v8 = x_binary_split(v0, v7, [Global])
        let v9 = Uh3Nil
        let v10 = listed_pieces_58(v8, v9)
        scenario_final_243(v1, v2, v3, v4, v5, v6, v10)
    }
}

pub fn main() {
    let _v0 = closure0(Nil)
    let _ = Nil
    let _v1 = closure5(Nil)
    let _ = Nil
    let _v2 = closure7(Nil)
    let _ = Nil
    let _v3 = closure9(Nil)
    let _ = Nil
    let _v4 = closure10(Nil)
    let _ = Nil
    let _v5 = closure12(Nil)
    let _ = Nil
    let _v6 = closure13(Nil)
    let _ = Nil
    let _v7 = closure14(Nil)
    let _ = Nil
    let _v8 = closure15(Nil)
    let _ = Nil
    let _v9 = closure19(Nil)
    let _ = Nil
    let _v10 = closure26(Nil)
    let _ = Nil
    let _v11 = closure27(Nil)
    let _ = Nil
    let _v12 = closure28(Nil)
    let _ = Nil
    let _v13 = closure29(Nil)
    let _ = Nil
    let _v14 = closure30(Nil)
    let _ = Nil
    0
}
