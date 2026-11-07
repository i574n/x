import gleam/bit_array
import gleam/int
import gleam/option
import gleam/order
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh19, type Uh20, type Uh21, type Us26, type Uh23, type Uh22, type Uh24, type Uh25, type Uh26, type Uh27, type Us29, type Us30, type Us31, Uh19Cons, Uh19Nil, Uh20Cons, Uh20Nil, Uh21Nil, Uh22Cons, Uh22Nil, Uh23Cons, Uh23Nil, Uh26Cons, Uh26Nil, Uh27Cons, Uh27Nil, Uh3Cons, Uh3Nil, Uh7Nil, Us26None, Us26Some, Us2None, Us2Some, Us30EvictAfter, Us30EvictNow, Us31None, Us31Some, Us32None, Us32Some, Us3None, Us3Some}
import xsim_frames/part1.{closure1, count_of_text_10, method18, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part2.{delimited_21, method20}
import xsim_frames/part3.{method54, method55}
import xsim_frames/part4.{from_cells_63}
import xsim_frames/part5.{closure16, deliveries_129, quoted_119, stream_115}
import xsim_frames/part6.{exploded_138, final_replay_147, method158, method159}
import xsim_frames/part7.{materialized_160, method182, method192, method196, method197, method200, method201, method213, method214, shared_layout_205}

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
                                    let v21 = method213(v2, Uh27Nil)
                                    let v22 = method214(v18)
                                    let v23 = method215(v18, v22, v21)
                                    v23 == False
                                }
                                False -> False
                            }
                        case v25 {
                            True -> {
                                Uh26Cons(v11, Uh26Nil)
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
    let v9 = method200(v0, v1, v2, v3, v4, v5, v6, v7, v3, Uh22Nil)
    method212(v0, v1, v2, v3, v4, v5, v6, v7, v9, Uh26Nil)
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
                        v17 == False
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
    let v2 = { v1 } <> { "." }
    let v4 = v0 |> string.replace(v2, ".")
    let v5 = unicode_erlang_characters_to_binary([8203])
    let v6 = { "@" } <> { v5 }
    let v8 = v4 |> string.replace(v6, "@")
    let v9 = unicode_erlang_characters_to_binary([8203])
    let v10 = { "#" } <> { v9 }
    let v12 = v8 |> string.replace(v10, "#")
    let v13 = unicode_erlang_characters_to_binary([8203])
    let v14 = { "$" } <> { v13 }
    v12 |> string.replace(v14, "$")
}

pub fn method224(v0: Uh22, v1: Uh3) -> Uh3 {
    case v0  {
        Uh22Cons(v2, v3, v4, v5, v6, v7, v8) -> {
            let v9 = method224(v8, v1)
            let v10 = ""
            let v11 = method225(v7, v10)
            let v13 = option.from_result(result.map(string.split_once(v11, "\n"), pair.first))
            let v14 = closure1(Nil)
            let v15 = v13 |> option.map(v14)
            let v17 = v15 |> option.unwrap(Us2None)
            let v21 =
                case v17  {
                    Us2None -> -1
                    Us2Some(v18) -> {
                        bit_array.byte_size(bit_array.from_string(v18))
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
            let v14 = method221(v10, v2, Uh22Nil)
            let v16 = method222(v14, Uh22Nil)
            let v18 = method224(v16, Uh3Nil)
            let v20 = delimited_21("", v18)
            Uh3Cons(v20, v12)
        }
        Uh26Nil -> v9
    }
}

pub fn program_218(v0: Uh21, v1: Int, v2: Int, v3: Uh22, v4: Uh24, v5: Uh25, v6: Us26, v7: Uh26, v8: Uh26) -> String {
    let v10 = method182(v0, Uh26Nil)
    let v12 = method219(v1, v2, v3, v4, v5, v6, v7, v8, v10, Uh26Nil)
    let v14 = method220(v1, v2, v3, v4, v5, v6, v7, v8, v12, Uh3Nil)
    delimited_21("\n\n", v14)
}

pub fn world_files_146(v0: Int, v1: Int, v2: String, v3: Int, v4: Int, v5: Int, v6: String, v7: String, v8: String, v9: fn(String) -> fn(Int) -> fn(String) -> Uh3, v10: Uh3) -> #(String, String) {
    let v12 = "+"
    let v13 = v2 |> string.replace(",", v12)
    let v14 = v13 == ""
    let v17 =
        case v14 {
            True -> Uh3Nil
            False -> split_list_2(v12, v13)
        }
    let v19 = method54(v17, Uh3Nil)
    let v21 = method55(v19, Uh7Nil)
    let #(_v27, v28, _v29) = from_cells_63(v0, 8, v1, 0, 0, v21, False, "", v10)
    let #(v30, v31) = final_replay_147(v28)
    let v33 = method158(v30, Uh19Nil)
    let v35 = method159(v33, Uh21Nil)
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
                spiral_wrap_signed(v59 - 1, 64)
            }
            False -> v59
        }
    let v65 = v64 / 400
    let v66 = v64 % 400
    let v67 = v66 != 0
    let v69 =
        case v67 {
            True -> {
                v64 < 0
            }
            False -> False
        }
    let v71 =
        case v69 {
            True -> {
                spiral_wrap_signed(v65 - 1, 64)
            }
            False -> v65
        }
    let v72 = spiral_wrap_signed(v71 * 400, 64)
    let v73 = spiral_wrap_signed(v64 - v72, 64)
    let v74 = spiral_wrap_signed(v73 * 365, 64)
    let v75 = v73 / 4
    let v76 = spiral_wrap_signed(v74 + v75, 64)
    let v77 = v73 / 100
    let v78 = spiral_wrap_signed(v76 - v77, 64)
    let v79 = v60 > 2
    let v82 =
        case v79 {
            True -> {
                spiral_wrap_signed(v60 - 3, 64)
            }
            False -> {
                spiral_wrap_signed(v60 + 9, 64)
            }
        }
    let v83 = spiral_wrap_signed(153 * v82, 64)
    let v84 = spiral_wrap_signed(v83 + 2, 64)
    let v85 = v84 / 5
    let v86 = spiral_wrap_signed(v85 + v61, 64)
    let v87 = spiral_wrap_signed(v86 - 1, 64)
    let v88 = spiral_wrap_signed(v78 + v87, 64)
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
    let v113 = method200(v36, v37, v38, v39, v40, v41, v42, v43, v39, Uh22Nil)
    let v115 = method201(v36, v37, v38, v39, v40, v41, v42, v43, v30, v31, v92, v111, v113, Uh3Nil)
    let v116 = quoted_119(v7)
    let v118 = quoted_119("id")
    let v119 = { v118 } <> { ": " }
    let v120 = { v119 } <> { v116 }
    let v121 = quoted_119(v8)
    let v123 = quoted_119("name")
    let v124 = { v123 } <> { ": " }
    let v125 = { v124 } <> { v121 }
    let v126 = "["
    let v127 = "]"
    let v129 = shared_layout_205(v115, v126, v127, 3)
    let v131 = quoted_119("posts")
    let v132 = { v131 } <> { ": " }
    let v133 = { v132 } <> { v129 }
    let v134 = quoted_119(v8)
    let v136 = quoted_119("username")
    let v137 = { v136 } <> { ": " }
    let v138 = { v137 } <> { v134 }
    let v140 = Uh3Cons(v138, Uh3Nil)
    let v141 = Uh3Cons(v133, v140)
    let v142 = Uh3Cons(v125, v141)
    let v143 = Uh3Cons(v120, v142)
    let v144 = "{"
    let v145 = "}"
    let v147 = shared_layout_205(v143, v144, v145, 2)
    let v149 = Uh3Cons(v147, Uh3Nil)
    let v151 = shared_layout_205(v149, v126, v127, 1)
    let v153 = quoted_119("users")
    let v154 = { v153 } <> { ": " }
    let v155 = { v154 } <> { v151 }
    let v157 = Uh3Cons(v155, Uh3Nil)
    let v159 = shared_layout_205(v157, v144, v145, 0)
    let v160 = { v159 } <> { "\n" }
    let v161 = gaps_211(v36, v37, v38, v39, v40, v41, v42, v43)
    let v163 = method216(v161, Uh3Nil)
    let v165 = method217(v163, Uh3Nil)
    let v167 = shared_layout_205(v165, v126, v127, 1)
    let v169 = quoted_119("gaps")
    let v170 = { v169 } <> { ": " }
    let v171 = { v170 } <> { v167 }
    let v173 = method216(v42, Uh3Nil)
    let v175 = method217(v173, Uh3Nil)
    let v177 = shared_layout_205(v175, v126, v127, 1)
    let v179 = quoted_119("incomplete")
    let v180 = { v179 } <> { ": " }
    let v181 = { v180 } <> { v177 }
    let v182 = program_218(v35, v36, v37, v38, v39, v40, v41, v42, v43)
    let v183 = v182 == ""
    let v187 =
        case v183 {
            True -> Uh3Nil
            False -> {
                split_list_2("\n", v182)
            }
        }
    let v189 = method217(v187, Uh3Nil)
    let v191 = shared_layout_205(v189, v126, v127, 1)
    let v193 = quoted_119("program")
    let v194 = { v193 } <> { ": " }
    let v195 = { v194 } <> { v191 }
    let v200 =
        case v41  {
            Us26None -> {
                "null"
            }
            Us26Some(v196) -> quoted_119(v196)
        }
    let v202 = quoted_119("root")
    let v203 = { v202 } <> { ": " }
    let v204 = { v203 } <> { v200 }
    let v206 = Uh3Cons(v204, Uh3Nil)
    let v207 = Uh3Cons(v195, v206)
    let v208 = Uh3Cons(v181, v207)
    let v209 = Uh3Cons(v171, v208)
    let v211 = shared_layout_205(v209, v144, v145, 0)
    let v212 = { v211 } <> { "\n" }
    #(v160, v212)
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
    let v9 = "+"
    let v10 = v3 |> string.replace(",", v9)
    let v11 = v10 == ""
    let v14 =
        case v11 {
            True -> Uh3Nil
            False -> split_list_2(v9, v10)
        }
    let v16 = method54(v14, Uh3Nil)
    let v18 = method55(v16, Uh7Nil)
    let #(_v23, v24, _v25) = from_cells_63(v0, v1, v2, 0, 0, v18, False, "", v7)
    let v28 =
        case v5 {
            True -> {
                exploded_138(v6, 280, v24)
            }
            False -> v24
        }
    let v31 = deliveries_129(v28, 1, v4, 6)
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
                        "null"
                    }
                    Us2Some(v8) -> quoted_119(v8)
                }
            let v14 = quoted_119("parent")
            let v15 = { v14 } <> { ": " }
            let v16 = { v15 } <> { v12 }
            let v17 = quoted_119(v2)
            let v19 = quoted_119("post")
            let v20 = { v19 } <> { ": " }
            let v21 = { v20 } <> { v17 }
            let v26 =
                case v4  {
                    Uh3Cons(v22, v23) -> v22
                    Uh3Nil -> {
                        ""
                    }
                }
            let v27 = quoted_119(v26)
            let v29 = quoted_119("source")
            let v30 = { v29 } <> { ": " }
            let v31 = { v30 } <> { v27 }
            let v33 = Uh3Cons(v31, Uh3Nil)
            let v34 = Uh3Cons(v21, v33)
            let v35 = Uh3Cons(v16, v34)
            let v39 = shared_layout_205(v35, "{", "}", 2)
            Uh3Cons(v39, v7)
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
            let v7 = method20(v3, 0)
            let v8 = int.to_string(v7)
            let v9 = quoted_119(v2)
            let v10 = { v9 } <> { ": " }
            let v11 = { v10 } <> { v8 }
            Uh3Cons(v11, v5)
        }
        Uh20Nil -> v1
    }
}

pub fn final_json_229(v0: Uh19, v1: Uh20) -> String {
    let v3 = method158(v0, Uh19Nil)
    let v5 = method230(v3, Uh3Nil)
    let v9 = shared_layout_205(v5, "[", "]", 1)
    let v11 = quoted_119("cells")
    let v12 = { v11 } <> { ": " }
    let v13 = { v12 } <> { v9 }
    let v15 = method231(v1, Uh20Nil)
    let v17 = method233(v15, Uh3Nil)
    let v18 = "{"
    let v19 = "}"
    let v21 = shared_layout_205(v17, v18, v19, 1)
    let v23 = quoted_119("likes")
    let v24 = { v23 } <> { ": " }
    let v25 = { v24 } <> { v21 }
    let v27 = Uh3Cons(v25, Uh3Nil)
    let v28 = Uh3Cons(v13, v27)
    let v30 = shared_layout_205(v28, v18, v19, 0)
    let v31 = { v30 } <> { "\n" }
    v31
}

pub fn scenario_final_228(v0: Int, v1: Int, v2: Int, v3: String, _v4: Int, _v5: Bool, _v6: fn(String) -> fn(Int) -> fn(String) -> Uh3, v7: Uh3) -> String {
    let v9 = "+"
    let v10 = v3 |> string.replace(",", v9)
    let v11 = v10 == ""
    let v14 =
        case v11 {
            True -> Uh3Nil
            False -> split_list_2(v9, v10)
        }
    let v16 = method54(v14, Uh3Nil)
    let v18 = method55(v16, Uh7Nil)
    let #(_v23, v24, _v25) = from_cells_63(v0, v1, v2, 0, 0, v18, False, "", v7)
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
                        split_list_2("+", v2)
                    }
                }
            method18(v9, v4)
        }
        Uh3Nil -> v1
    }
}
