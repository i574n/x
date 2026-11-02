import gleam/bit_array
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/string
import xsim_frames/types.{type Uh3, type Uh13, type Us90, type Us91, Uh13Cons, Uh13Nil, Uh29Nil, Uh3Cons, Uh3Nil, Us3None, Us3Some, Us56Error, Us56Ok, Us76Error, Us76Ok, Us90None, Us90Some, Us91Error, Us91Ok}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_fs_read_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part10.{method259, method260}
import xsim_frames/part13.{method300, method301}
import xsim_frames/part17.{method367, method368}
import xsim_frames/part2.{delimited_21, method18, method20, taken_31}
import xsim_frames/part20.{method396, method397, method398, method399, method400}
import xsim_frames/part25.{closure139}
import xsim_frames/part3.{method77}

pub fn closure143(capt: #(String, Int, String)) -> fn(String) -> Us91 {
    fn (v3) {
        let #(v0, v1, v2) = capt
        let v4 = v2 == "spi"
        case v4 {
            True -> Us91Ok(v3, v1)
            False -> {
                let v6 = v2 == "cells"
                case v6 {
                    True -> {
                        let v7 = count_of_text_10(v3)
                        case v7  {
                            Us3None -> {
                                let v10 = "--cells takes a whole number, got '"
                                let v11 = v10 <> v3 
                                let v12 = "'"
                                let v13 = v11 <> v12 
                                Us91Error(v13)
                            }
                            Us3Some(v8) -> Us91Ok(v0, v8)
                        }
                    }
                    False -> {
                        let v17 = "unknown option --"
                        let v18 = v17 <> v2 
                        Us91Error(v18)
                    }
                }
            }
        }
    }
}

pub fn closure142(capt: #(String, Int)) -> fn(String) -> fn(String) -> Us91 {
    fn (v2) {
        let #(v0, v1) = capt
        closure143(#(v0, v1, v2))
    }
}

pub fn closure141(capt: Nil) -> fn(#(String, Int)) -> fn(String) -> fn(String) -> Us91 {
    fn (dom) {
        let #(v0, v1) = dom
        closure142(#(v0, v1))
    }
}

pub fn valued_then_436(v0: fn(#(String, Int)) -> fn(String) -> Us90, v1: fn(#(String, Int)) -> fn(String) -> fn(String) -> Us91, v2: String, v3: Int, v4: String, v5: Uh3) -> Us91 {
    case v5  {
        Uh3Cons(v6, v7) -> {
            let v8 = v1(#(v2, v3))
            let v9 = "--"
            let v10 = v4 |> string.starts_with(v9)
            let v17 =
                case v10 {
                    True -> {
                        let v11 = spiral_string_length(v4)
                        let v12 = spiral_wrap_signed(v11 - 2, 32)
                        let v13 = spiral_wrap_signed(2 + v12, 32)
                        let v14 = spiral_wrap_signed(v13 - 1, 32)
                        let v15 = spiral_string_slice(v4, 2, v14)
                        v15
                    }
                    False -> {
                        let v16 = ""
                        v16
                    }
                }
            let v18 = v8(v17)
            let v19 = v18(v6)
            continued_437(v0, v1, v19, v7)
        }
        Uh3Nil -> {
            let v21 = "--"
            let v22 = v4 |> string.starts_with(v21)
            let v29 =
                case v22 {
                    True -> {
                        let v23 = spiral_string_length(v4)
                        let v24 = spiral_wrap_signed(v23 - 2, 32)
                        let v25 = spiral_wrap_signed(2 + v24, 32)
                        let v26 = spiral_wrap_signed(v25 - 1, 32)
                        let v27 = spiral_string_slice(v4, 2, v26)
                        v27
                    }
                    False -> {
                        let v28 = ""
                        v28
                    }
                }
            let v30 = v21 <> v29 
            let v31 = " needs a value"
            let v32 = v30 <> v31 
            Us91Error(v32)
        }
    }
}

pub fn arg_parsed_435(v0: fn(#(String, Int)) -> fn(String) -> Us90, v1: fn(#(String, Int)) -> fn(String) -> fn(String) -> Us91, v2: String, v3: Int, v4: String, v5: Uh3) -> Us91 {
    let v6 = v0(#(v2, v3))
    let v7 = "--"
    let v8 = v4 |> string.starts_with(v7)
    let v15 =
        case v8 {
            True -> {
                let v9 = spiral_string_length(v4)
                let v10 = spiral_wrap_signed(v9 - 2, 32)
                let v11 = spiral_wrap_signed(2 + v10, 32)
                let v12 = spiral_wrap_signed(v11 - 1, 32)
                let v13 = spiral_string_slice(v4, 2, v12)
                v13
            }
            False -> {
                let v14 = ""
                v14
            }
        }
    let v16 = v6(v15)
    case v16  {
        Us90None -> valued_then_436(v0, v1, v2, v3, v4, v5)
        Us90Some(v17, v18) -> flags_parsed_434(v0, v1, v17, v18, v5)
    }
}

pub fn flags_parsed_434(v0: fn(#(String, Int)) -> fn(String) -> Us90, v1: fn(#(String, Int)) -> fn(String) -> fn(String) -> Us91, v2: String, v3: Int, v4: Uh3) -> Us91 {
    case v4  {
        Uh3Cons(v6, v7) -> {
            let v8 = "--"
            let v9 = v6 |> string.starts_with(v8)
            let v16 =
                case v9 {
                    True -> {
                        let v10 = spiral_string_length(v6)
                        let v11 = spiral_wrap_signed(v10 - 2, 32)
                        let v12 = spiral_wrap_signed(2 + v11, 32)
                        let v13 = spiral_wrap_signed(v12 - 1, 32)
                        let v14 = spiral_string_slice(v6, 2, v13)
                        v14
                    }
                    False -> {
                        let v15 = ""
                        v15
                    }
                }
            let v17 = v16 == ""
            case v17 {
                True -> {
                    let v18 = "unexpected argument '"
                    let v19 = v18 <> v6 
                    let v20 = "'"
                    let v21 = v19 <> v20 
                    Us91Error(v21)
                }
                False -> arg_parsed_435(v0, v1, v2, v3, v6, v7)
            }
        }
        Uh3Nil -> Us91Ok(v2, v3)
    }
}

pub fn continued_437(v0: fn(#(String, Int)) -> fn(String) -> Us90, v1: fn(#(String, Int)) -> fn(String) -> fn(String) -> Us91, v2: Us91, v3: Uh3) -> Us91 {
    case v2  {
        Us91Error(v7) -> Us91Error(v7)
        Us91Ok(v4, v5) -> flags_parsed_434(v0, v1, v4, v5, v3)
    }
}

pub fn method438(v0: Dynamic, v1: Dynamic, v2: Uh13, v3: Uh13) -> Uh13 {
    case v2  {
        Uh13Cons(v4, v5) -> {
            let v6 = method438(v0, v1, v5, v3)
            let v7 = erlang_term_coerce(v4)
            let v8 = []
            let v9 = erlang_term_coerce(v8)
            let v10 = "maps"
            let v11 = atom.create(v10)
            let v12 = "from_list"
            let v13 = atom.create(v12)
            let v14 = []
            let v15 = [v9, ..v14]
            let v16 = erlang_term_apply(v11, v13, v15)
            let v17 = "outputs"
            let v18 = atom.create(v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = atom.create(v10)
            let v21 = "get"
            let v22 = atom.create(v21)
            let v23 = []
            let v24 = [v16, ..v23]
            let v25 = [v0, ..v24]
            let v26 = [v19, ..v25]
            let v27 = erlang_term_apply(v20, v22, v26)
            let v28 = "nil"
            let v29 = atom.create(v28)
            let v30 = erlang_term_coerce(v29)
            let v31 = atom.create(v10)
            let v32 = atom.create(v21)
            let v33 = []
            let v34 = [v30, ..v33]
            let v35 = [v27, ..v34]
            let v36 = [v7, ..v35]
            let v37 = erlang_term_apply(v31, v32, v36)
            let v38 = erlang_term_coerce(v4)
            let v39 = []
            let v40 = erlang_term_coerce(v39)
            let v41 = atom.create(v10)
            let v42 = atom.create(v12)
            let v43 = []
            let v44 = [v40, ..v43]
            let v45 = erlang_term_apply(v41, v42, v44)
            let v46 = atom.create(v17)
            let v47 = erlang_term_coerce(v46)
            let v48 = atom.create(v10)
            let v49 = atom.create(v21)
            let v50 = []
            let v51 = [v45, ..v50]
            let v52 = [v1, ..v51]
            let v53 = [v47, ..v52]
            let v54 = erlang_term_apply(v48, v49, v53)
            let v55 = atom.create(v28)
            let v56 = erlang_term_coerce(v55)
            let v57 = atom.create(v10)
            let v58 = atom.create(v21)
            let v59 = []
            let v60 = [v56, ..v59]
            let v61 = [v54, ..v60]
            let v62 = [v38, ..v61]
            let v63 = erlang_term_apply(v57, v58, v62)
            let v64 = v37 == v63
            let v65 = v64 == False
            case v65 {
                True -> Uh13Cons(v4, v6)
                False -> v6
            }
        }
        Uh13Nil -> v3
    }
}

pub fn method439(v0: Dynamic, v1: Dynamic, v2: Uh13, v3: Uh3) -> Uh3 {
    case v2  {
        Uh13Cons(v4, v5) -> {
            let v6 = method439(v0, v1, v5, v3)
            let v7 = string.inspect(v4)
            let v8 = "XDIFF cell "
            let v9 = v8 <> v7 
            let v10 = "\n  a="
            let v11 = v9 <> v10 
            let v12 = erlang_term_coerce(v4)
            let v13 = []
            let v14 = erlang_term_coerce(v13)
            let v15 = "maps"
            let v16 = atom.create(v15)
            let v17 = "from_list"
            let v18 = atom.create(v17)
            let v19 = []
            let v20 = [v14, ..v19]
            let v21 = erlang_term_apply(v16, v18, v20)
            let v22 = "outputs"
            let v23 = atom.create(v22)
            let v24 = erlang_term_coerce(v23)
            let v25 = atom.create(v15)
            let v26 = "get"
            let v27 = atom.create(v26)
            let v28 = []
            let v29 = [v21, ..v28]
            let v30 = [v0, ..v29]
            let v31 = [v24, ..v30]
            let v32 = erlang_term_apply(v25, v27, v31)
            let v33 = "nil"
            let v34 = atom.create(v33)
            let v35 = erlang_term_coerce(v34)
            let v36 = atom.create(v15)
            let v37 = atom.create(v26)
            let v38 = []
            let v39 = [v35, ..v38]
            let v40 = [v32, ..v39]
            let v41 = [v12, ..v40]
            let v42 = erlang_term_apply(v36, v37, v41)
            let v43 = erlang_term_coerce(600)
            let v44 = "printable_limit"
            let v45 = atom.create(v44)
            let v46 = erlang_term_coerce(v45)
            let v47 = []
            let v48 = [v43, ..v47]
            let v49 = [v46, ..v48]
            let v50 = erlang_term_tuple(v49)
            let v51 = []
            let v52 = [v50, ..v51]
            let v53 = erlang_term_coerce(v52)
            let v54 = "Elixir.Kernel"
            let v55 = atom.create(v54)
            let v56 = "inspect"
            let v57 = atom.create(v56)
            let v58 = []
            let v59 = [v53, ..v58]
            let v60 = [v42, ..v59]
            let v61 = erlang_term_apply(v55, v57, v60)
            let v62 = erlang_term_coerce(v61)
            let v63 = v11 <> v62 
            let v64 = "\n  b="
            let v65 = v63 <> v64 
            let v66 = erlang_term_coerce(v4)
            let v67 = []
            let v68 = erlang_term_coerce(v67)
            let v69 = atom.create(v15)
            let v70 = atom.create(v17)
            let v71 = []
            let v72 = [v68, ..v71]
            let v73 = erlang_term_apply(v69, v70, v72)
            let v74 = atom.create(v22)
            let v75 = erlang_term_coerce(v74)
            let v76 = atom.create(v15)
            let v77 = atom.create(v26)
            let v78 = []
            let v79 = [v73, ..v78]
            let v80 = [v1, ..v79]
            let v81 = [v75, ..v80]
            let v82 = erlang_term_apply(v76, v77, v81)
            let v83 = atom.create(v33)
            let v84 = erlang_term_coerce(v83)
            let v85 = atom.create(v15)
            let v86 = atom.create(v26)
            let v87 = []
            let v88 = [v84, ..v87]
            let v89 = [v82, ..v88]
            let v90 = [v66, ..v89]
            let v91 = erlang_term_apply(v85, v86, v90)
            let v92 = erlang_term_coerce(600)
            let v93 = atom.create(v44)
            let v94 = erlang_term_coerce(v93)
            let v95 = []
            let v96 = [v92, ..v95]
            let v97 = [v94, ..v96]
            let v98 = erlang_term_tuple(v97)
            let v99 = []
            let v100 = [v98, ..v99]
            let v101 = erlang_term_coerce(v100)
            let v102 = atom.create(v54)
            let v103 = atom.create(v56)
            let v104 = []
            let v105 = [v101, ..v104]
            let v106 = [v91, ..v105]
            let v107 = erlang_term_apply(v102, v103, v106)
            let v108 = erlang_term_coerce(v107)
            let v109 = v65 <> v108 
            Uh3Cons(v109, v6)
        }
        Uh13Nil -> v3
    }
}

pub fn closure138(capt: Nil) -> fn(String) -> Int {
    fn (v0) {
        let v1 = "crypto"
        let v2 = atom.create(v1)
        let v3 = erlang_term_coerce(v2)
        let v4 = "application"
        let v5 = atom.create(v4)
        let v6 = "ensure_all_started"
        let v7 = atom.create(v6)
        let v8 = []
        let v9 = [v3, ..v8]
        let v10 = erlang_term_apply(v5, v7, v9)
        let v11 = erlang_term_coerce(1)
        let v12 = "erlang"
        let v13 = atom.create(v12)
        let v14 = "element"
        let v15 = atom.create(v14)
        let v16 = []
        let v17 = [v10, ..v16]
        let v18 = [v11, ..v17]
        let v19 = erlang_term_apply(v13, v15, v18)
        let v20 = "ok"
        let v21 = atom.create(v20)
        let v22 = erlang_term_coerce(v21)
        let v23 = v19 == v22
        let v44 =
            case v23 {
                True -> True
                False -> {
                    let v24 = "xsim / "
                    let v25 = v24 <> v1 
                    let v26 = " did not start: "
                    let v27 = v25 <> v26 
                    let v28 = string.inspect(v10)
                    let v29 = v27 <> v28 
                    let v30 = "\n"
                    let v31 = v29 <> v30 
                    let v32 = "standard_error"
                    let v33 = atom.create(v32)
                    let v34 = erlang_term_coerce(v33)
                    let v35 = erlang_term_coerce(v31)
                    let v36 = "io"
                    let v37 = atom.create(v36)
                    let v38 = "put_chars"
                    let v39 = atom.create(v38)
                    let v40 = []
                    let v41 = [v35, ..v40]
                    let v42 = [v34, ..v41]
                    let _v43 = erlang_term_apply(v37, v39, v42)
                    False
                }
            }
        let _v84 =
            case v44 {
                True -> {
                    let v45 = "spiral_cells"
                    let v46 = atom.create(v45)
                    let v47 = erlang_term_coerce(v46)
                    let v48 = atom.create(v4)
                    let v49 = atom.create(v6)
                    let v50 = []
                    let v51 = [v47, ..v50]
                    let v52 = erlang_term_apply(v48, v49, v51)
                    let v53 = erlang_term_coerce(1)
                    let v54 = atom.create(v12)
                    let v55 = atom.create(v14)
                    let v56 = []
                    let v57 = [v52, ..v56]
                    let v58 = [v53, ..v57]
                    let v59 = erlang_term_apply(v54, v55, v58)
                    let v60 = atom.create(v20)
                    let v61 = erlang_term_coerce(v60)
                    let v62 = v59 == v61
                    case v62 {
                        True -> True
                        False -> {
                            let v63 = "xsim / "
                            let v64 = v63 <> v45 
                            let v65 = " did not start: "
                            let v66 = v64 <> v65 
                            let v67 = string.inspect(v52)
                            let v68 = v66 <> v67 
                            let v69 = "\n"
                            let v70 = v68 <> v69 
                            let v71 = "standard_error"
                            let v72 = atom.create(v71)
                            let v73 = erlang_term_coerce(v72)
                            let v74 = erlang_term_coerce(v70)
                            let v75 = "io"
                            let v76 = atom.create(v75)
                            let v77 = "put_chars"
                            let v78 = atom.create(v77)
                            let v79 = []
                            let v80 = [v74, ..v79]
                            let v81 = [v73, ..v80]
                            let _v82 = erlang_term_apply(v76, v78, v81)
                            False
                        }
                    }
                }
                False -> False
            }
        let v85 = "init"
        let v86 = atom.create(v85)
        let v87 = "get_plain_arguments"
        let v88 = atom.create(v87)
        let v89 = []
        let v90 = erlang_term_apply(v86, v88, v89)
        let v91 = erlang_term_coerce(0)
        let v92 = []
        let v93 = [v91, ..v92]
        let v94 = erlang_term_coerce(v93)
        let v95 = "lists"
        let v96 = atom.create(v95)
        let v97 = "join"
        let v98 = atom.create(v97)
        let v99 = []
        let v100 = [v90, ..v99]
        let v101 = [v94, ..v100]
        let v102 = erlang_term_apply(v96, v98, v101)
        let v103 = "unicode"
        let v104 = atom.create(v103)
        let v105 = "characters_to_binary"
        let v106 = atom.create(v105)
        let v107 = []
        let v108 = [v102, ..v107]
        let v109 = erlang_term_apply(v104, v106, v108)
        let v110 = erlang_term_coerce(v109)
        let v111 = unicode_erlang_characters_to_binary([0])
        let v112 = v110 == ""
        let v115 =
            case v112 {
                True -> Uh3Nil
                False -> split_list_2(v111, v110)
            }
        let v120 =
            case v115  {
                Uh3Cons(v116, v117) -> v117
                Uh3Nil -> Uh3Nil
            }
        let v121 = closure139(Nil)
        let v122 = closure141(Nil)
        let v123 = ""
        let v124 = 5
        let v125 = flags_parsed_434(v121, v122, v123, v124, v120)
        let v132 =
            case v125  {
                Us91Ok(v126, v127) -> {
                    let v128 = v126 == ""
                    case v128 {
                        True -> {
                            let v129 = "missing --spi"
                            Us91Error(v129)
                        }
                        False -> v125
                    }
                }
                _ -> v125
            }
        let v505 =
            case v132  {
                Us91Error(v501) -> {
                    let v502 = "XSIM rejected diff: "
                    let v503 = v502 <> v501 
                    v503
                }
                Us91Ok(v133, v134) -> {
                    let v135 = spiral_fs_read_file(v133)
                    let v136 = method367()
                    let v137 = method368()
                    let v138 = case v135 { Ok(x) -> v136(x) Error(x) -> v137(x) }
                    let v151 =
                        case v138  {
                            Us76Error(v148) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us76Ok(v139) -> {
                                let v140 = bit_array.to_string(v139)
                                let v141 = method259()
                                let v142 = method260()
                                let v143 = case v140 { Ok(x) -> v141(x) Error(x) -> v142(x) }
                                case v143  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v144) -> v144
                                }
                            }
                        }
                    let v152 = erlang_term_coerce(v151)
                    let v153 = erlang_term_coerce(v123)
                    let v154 = "Elixir.Spiral.Cells.Document"
                    let v155 = atom.create(v154)
                    let v156 = "parse_spi"
                    let v157 = atom.create(v156)
                    let v158 = []
                    let v159 = [v153, ..v158]
                    let v160 = [v152, ..v159]
                    let v161 = erlang_term_apply(v155, v157, v160)
                    let v162 = []
                    let v163 = erlang_term_coerce(v162)
                    let v164 = "cells"
                    let v165 = atom.create(v164)
                    let v166 = erlang_term_coerce(v165)
                    let v167 = "maps"
                    let v168 = atom.create(v167)
                    let v169 = "get"
                    let v170 = atom.create(v169)
                    let v171 = []
                    let v172 = [v163, ..v171]
                    let v173 = [v161, ..v172]
                    let v174 = [v166, ..v173]
                    let v175 = erlang_term_apply(v168, v170, v174)
                    let v176 = atom.create(v12)
                    let v177 = "length"
                    let v178 = atom.create(v177)
                    let v179 = []
                    let v180 = [v175, ..v179]
                    let v181 = erlang_term_apply(v176, v178, v180)
                    let v182 = erlang_term_coerce(v181)
                    let v183 = 0
                    let v184 = method396(v182, v175, v183)
                    let v185 = Uh29Nil
                    let v186 = method397(v184, v185)
                    let v187 = Uh3Nil
                    let v188 = method398(v186, v187)
                    let v189 = v134 < 0
                    let v191 =
                        case v189 {
                            True -> v188
                            False -> taken_31(v134, v188)
                        }
                    let v192 = erlang_term_coerce(v133)
                    let v193 = "filename"
                    let v194 = atom.create(v193)
                    let v195 = "absname"
                    let v196 = atom.create(v195)
                    let v197 = []
                    let v198 = [v192, ..v197]
                    let v199 = erlang_term_apply(v194, v196, v198)
                    let v200 = atom.create(v103)
                    let v201 = atom.create(v105)
                    let v202 = []
                    let v203 = [v199, ..v202]
                    let v204 = erlang_term_apply(v200, v201, v203)
                    let v205 = erlang_term_coerce(v204)
                    let v206 = erlang_term_coerce(v205)
                    let v207 = atom.create(v193)
                    let v208 = "dirname"
                    let v209 = atom.create(v208)
                    let v210 = []
                    let v211 = [v206, ..v210]
                    let v212 = erlang_term_apply(v207, v209, v211)
                    let v213 = atom.create(v103)
                    let v214 = atom.create(v105)
                    let v215 = []
                    let v216 = [v212, ..v215]
                    let v217 = erlang_term_apply(v213, v214, v216)
                    let v218 = erlang_term_coerce(v217)
                    let v219 = Uh29Nil
                    let v220 = method300(v191, v219)
                    let v221 = []
                    let v222 = method301(v220, v221)
                    let v223 = erlang_term_coerce(v222)
                    let v224 = atom.create(v164)
                    let v225 = erlang_term_coerce(v224)
                    let v226 = []
                    let v227 = [v223, ..v226]
                    let v228 = [v225, ..v227]
                    let v229 = erlang_term_tuple(v228)
                    let v230 = []
                    let v231 = [v229, ..v230]
                    let v232 = erlang_term_coerce(v231)
                    let v233 = atom.create(v167)
                    let v234 = "from_list"
                    let v235 = atom.create(v234)
                    let v236 = []
                    let v237 = [v232, ..v236]
                    let v238 = erlang_term_apply(v233, v235, v237)
                    let v239 = erlang_term_coerce(v218)
                    let v240 = "root"
                    let v241 = atom.create(v240)
                    let v242 = erlang_term_coerce(v241)
                    let v243 = []
                    let v244 = [v239, ..v243]
                    let v245 = [v242, ..v244]
                    let v246 = erlang_term_tuple(v245)
                    let v247 = "spiral_lib"
                    let v248 = atom.create(v247)
                    let v249 = erlang_term_coerce(v248)
                    let v250 = []
                    let v251 = [v239, ..v250]
                    let v252 = [v249, ..v251]
                    let v253 = erlang_term_tuple(v252)
                    let v254 = []
                    let v255 = [v253, ..v254]
                    let v256 = [v246, ..v255]
                    let v257 = erlang_term_coerce(v256)
                    let v258 = "Elixir.Spiral.Cells.Notebook"
                    let v259 = atom.create(v258)
                    let v260 = "evaluate"
                    let v261 = atom.create(v260)
                    let v262 = []
                    let v263 = [v257, ..v262]
                    let v264 = [v238, ..v263]
                    let v265 = erlang_term_apply(v259, v261, v264)
                    let v266 = erlang_term_coerce(v133)
                    let v267 = atom.create(v193)
                    let v268 = atom.create(v195)
                    let v269 = []
                    let v270 = [v266, ..v269]
                    let v271 = erlang_term_apply(v267, v268, v270)
                    let v272 = atom.create(v103)
                    let v273 = atom.create(v105)
                    let v274 = []
                    let v275 = [v271, ..v274]
                    let v276 = erlang_term_apply(v272, v273, v275)
                    let v277 = erlang_term_coerce(v276)
                    let v278 = erlang_term_coerce(v277)
                    let v279 = atom.create(v193)
                    let v280 = atom.create(v208)
                    let v281 = []
                    let v282 = [v278, ..v281]
                    let v283 = erlang_term_apply(v279, v280, v282)
                    let v284 = atom.create(v103)
                    let v285 = atom.create(v105)
                    let v286 = []
                    let v287 = [v283, ..v286]
                    let v288 = erlang_term_apply(v284, v285, v287)
                    let v289 = erlang_term_coerce(v288)
                    let v290 = Uh29Nil
                    let v291 = method300(v191, v290)
                    let v292 = []
                    let v293 = method301(v291, v292)
                    let v294 = erlang_term_coerce(v293)
                    let v295 = atom.create(v164)
                    let v296 = erlang_term_coerce(v295)
                    let v297 = []
                    let v298 = [v294, ..v297]
                    let v299 = [v296, ..v298]
                    let v300 = erlang_term_tuple(v299)
                    let v301 = []
                    let v302 = [v300, ..v301]
                    let v303 = erlang_term_coerce(v302)
                    let v304 = atom.create(v167)
                    let v305 = atom.create(v234)
                    let v306 = []
                    let v307 = [v303, ..v306]
                    let v308 = erlang_term_apply(v304, v305, v307)
                    let v309 = erlang_term_coerce(v289)
                    let v310 = atom.create(v240)
                    let v311 = erlang_term_coerce(v310)
                    let v312 = []
                    let v313 = [v309, ..v312]
                    let v314 = [v311, ..v313]
                    let v315 = erlang_term_tuple(v314)
                    let v316 = atom.create(v247)
                    let v317 = erlang_term_coerce(v316)
                    let v318 = []
                    let v319 = [v309, ..v318]
                    let v320 = [v317, ..v319]
                    let v321 = erlang_term_tuple(v320)
                    let v322 = []
                    let v323 = [v321, ..v322]
                    let v324 = [v315, ..v323]
                    let v325 = erlang_term_coerce(v324)
                    let v326 = atom.create(v258)
                    let v327 = atom.create(v260)
                    let v328 = []
                    let v329 = [v325, ..v328]
                    let v330 = [v308, ..v329]
                    let v331 = erlang_term_apply(v326, v327, v330)
                    let v332 = 0
                    let v333 = method20(v191, v332)
                    let v334 = "\n"
                    let v335 = spiral_wrap_signed(v333 - 1, 32)
                    let v336 = "nil"
                    let v337 = atom.create(v336)
                    let v338 = erlang_term_coerce(v337)
                    let v339 = "status"
                    let v340 = atom.create(v339)
                    let v341 = erlang_term_coerce(v340)
                    let v342 = atom.create(v167)
                    let v343 = atom.create(v169)
                    let v344 = []
                    let v345 = [v338, ..v344]
                    let v346 = [v265, ..v345]
                    let v347 = [v341, ..v346]
                    let v348 = erlang_term_apply(v342, v343, v347)
                    let v349 = []
                    let v350 = erlang_term_coerce(v349)
                    let v351 = "Elixir.Kernel"
                    let v352 = atom.create(v351)
                    let v353 = "inspect"
                    let v354 = atom.create(v353)
                    let v355 = []
                    let v356 = [v350, ..v355]
                    let v357 = [v348, ..v356]
                    let v358 = erlang_term_apply(v352, v354, v357)
                    let v359 = erlang_term_coerce(v358)
                    let v360 = "XDIFF status a="
                    let v361 = v360 <> v359 
                    let v362 = " b="
                    let v363 = v361 <> v362 
                    let v364 = atom.create(v336)
                    let v365 = erlang_term_coerce(v364)
                    let v366 = atom.create(v339)
                    let v367 = erlang_term_coerce(v366)
                    let v368 = atom.create(v167)
                    let v369 = atom.create(v169)
                    let v370 = []
                    let v371 = [v365, ..v370]
                    let v372 = [v331, ..v371]
                    let v373 = [v367, ..v372]
                    let v374 = erlang_term_apply(v368, v369, v373)
                    let v375 = []
                    let v376 = erlang_term_coerce(v375)
                    let v377 = atom.create(v351)
                    let v378 = atom.create(v353)
                    let v379 = []
                    let v380 = [v376, ..v379]
                    let v381 = [v374, ..v380]
                    let v382 = erlang_term_apply(v377, v378, v381)
                    let v383 = erlang_term_coerce(v382)
                    let v384 = v363 <> v383 
                    let v385 = " verdict a="
                    let v386 = v384 <> v385 
                    let v387 = erlang_term_coerce(v335)
                    let v388 = []
                    let v389 = erlang_term_coerce(v388)
                    let v390 = atom.create(v167)
                    let v391 = atom.create(v234)
                    let v392 = []
                    let v393 = [v389, ..v392]
                    let v394 = erlang_term_apply(v390, v391, v393)
                    let v395 = "verdicts"
                    let v396 = atom.create(v395)
                    let v397 = erlang_term_coerce(v396)
                    let v398 = atom.create(v167)
                    let v399 = atom.create(v169)
                    let v400 = []
                    let v401 = [v394, ..v400]
                    let v402 = [v265, ..v401]
                    let v403 = [v397, ..v402]
                    let v404 = erlang_term_apply(v398, v399, v403)
                    let v405 = atom.create(v336)
                    let v406 = erlang_term_coerce(v405)
                    let v407 = atom.create(v167)
                    let v408 = atom.create(v169)
                    let v409 = []
                    let v410 = [v406, ..v409]
                    let v411 = [v404, ..v410]
                    let v412 = [v387, ..v411]
                    let v413 = erlang_term_apply(v407, v408, v412)
                    let v414 = []
                    let v415 = erlang_term_coerce(v414)
                    let v416 = atom.create(v351)
                    let v417 = atom.create(v353)
                    let v418 = []
                    let v419 = [v415, ..v418]
                    let v420 = [v413, ..v419]
                    let v421 = erlang_term_apply(v416, v417, v420)
                    let v422 = erlang_term_coerce(v421)
                    let v423 = v386 <> v422 
                    let v424 = v423 <> v362 
                    let v425 = erlang_term_coerce(v335)
                    let v426 = []
                    let v427 = erlang_term_coerce(v426)
                    let v428 = atom.create(v167)
                    let v429 = atom.create(v234)
                    let v430 = []
                    let v431 = [v427, ..v430]
                    let v432 = erlang_term_apply(v428, v429, v431)
                    let v433 = atom.create(v395)
                    let v434 = erlang_term_coerce(v433)
                    let v435 = atom.create(v167)
                    let v436 = atom.create(v169)
                    let v437 = []
                    let v438 = [v432, ..v437]
                    let v439 = [v331, ..v438]
                    let v440 = [v434, ..v439]
                    let v441 = erlang_term_apply(v435, v436, v440)
                    let v442 = atom.create(v336)
                    let v443 = erlang_term_coerce(v442)
                    let v444 = atom.create(v167)
                    let v445 = atom.create(v169)
                    let v446 = []
                    let v447 = [v443, ..v446]
                    let v448 = [v441, ..v447]
                    let v449 = [v425, ..v448]
                    let v450 = erlang_term_apply(v444, v445, v449)
                    let v451 = []
                    let v452 = erlang_term_coerce(v451)
                    let v453 = atom.create(v351)
                    let v454 = atom.create(v353)
                    let v455 = []
                    let v456 = [v452, ..v455]
                    let v457 = [v450, ..v456]
                    let v458 = erlang_term_apply(v453, v454, v457)
                    let v459 = erlang_term_coerce(v458)
                    let v460 = v424 <> v459 
                    let v461 = 0
                    let v462 = method77(v333, v461)
                    let v463 = Uh13Nil
                    let v464 = method438(v265, v331, v462, v463)
                    let v465 = Uh3Nil
                    let v466 = method439(v265, v331, v464, v465)
                    let v467 = atom.create(v336)
                    let v468 = erlang_term_coerce(v467)
                    let v469 = "outputs"
                    let v470 = atom.create(v469)
                    let v471 = erlang_term_coerce(v470)
                    let v472 = atom.create(v167)
                    let v473 = atom.create(v169)
                    let v474 = []
                    let v475 = [v468, ..v474]
                    let v476 = [v265, ..v475]
                    let v477 = [v471, ..v476]
                    let v478 = erlang_term_apply(v472, v473, v477)
                    let v479 = atom.create(v336)
                    let v480 = erlang_term_coerce(v479)
                    let v481 = atom.create(v469)
                    let v482 = erlang_term_coerce(v481)
                    let v483 = atom.create(v167)
                    let v484 = atom.create(v169)
                    let v485 = []
                    let v486 = [v480, ..v485]
                    let v487 = [v331, ..v486]
                    let v488 = [v482, ..v487]
                    let v489 = erlang_term_apply(v483, v484, v488)
                    let v490 = v478 == v489
                    let v493 =
                        case v490 {
                            True -> {
                                let v491 = "true"
                                v491
                            }
                            False -> {
                                let v492 = "false"
                                v492
                            }
                        }
                    let v494 = "XDIFF done identical="
                    let v495 = v494 <> v493 
                    let v496 = Uh3Nil
                    let v497 = Uh3Cons(v495, v496)
                    let v498 = method18(v466, v497)
                    let v499 = Uh3Cons(v460, v498)
                    delimited_21(v334, v499)
                }
            }
        let v506 = "\n"
        let v507 = v505 <> v506 
        let v508 = erlang_term_coerce(v507)
        let v509 = "io"
        let v510 = atom.create(v509)
        let v511 = "put_chars"
        let v512 = atom.create(v511)
        let v513 = []
        let v514 = [v508, ..v513]
        let _v515 = erlang_term_apply(v510, v512, v514)
        let v516 = v505 == ""
        let v519 =
            case v516 {
                True -> Uh3Nil
                False -> split_list_2(v506, v505)
            }
        let v520 = method399()
        let v521 = method400(v520, v519)
        case v521 {
            True -> 1
            False -> 0
        }
    }
}
