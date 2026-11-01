import gleam/bit_array
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/string
import xsim_frames/types.{type Uh3, type Uh13, type Uh29, type Us90, type Us91, type Uh36, Uh13Cons, Uh13Nil, Uh29Cons, Uh29Nil, Uh36Cons, Uh36Nil, Uh3Cons, Uh3Nil, Us56Error, Us56Ok, Us76Error, Us76Ok, Us90None, Us90Some, Us91Error, Us91Ok}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_fs_read_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part10.{method259, method260}
import xsim_frames/part13.{method300, method301}
import xsim_frames/part17.{method367, method368}
import xsim_frames/part2.{delimited_21, method18, method20, taken_31}
import xsim_frames/part20.{method396, method397, method398, method399, method400}
import xsim_frames/part25.{closure139, closure142}
import xsim_frames/part3.{method77}

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
        let v481 =
            case v132  {
                Us91Error(v477) -> {
                    let v478 = "XSIM rejected diff: "
                    let v479 = v478 <> v477 
                    v479
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
                    let v200 = atom.create(v193)
                    let v201 = "dirname"
                    let v202 = atom.create(v201)
                    let v203 = []
                    let v204 = [v199, ..v203]
                    let v205 = erlang_term_apply(v200, v202, v204)
                    let v206 = erlang_term_coerce(v205)
                    let v207 = Uh29Nil
                    let v208 = method300(v191, v207)
                    let v209 = []
                    let v210 = method301(v208, v209)
                    let v211 = erlang_term_coerce(v210)
                    let v212 = atom.create(v164)
                    let v213 = erlang_term_coerce(v212)
                    let v214 = []
                    let v215 = [v211, ..v214]
                    let v216 = [v213, ..v215]
                    let v217 = erlang_term_tuple(v216)
                    let v218 = []
                    let v219 = [v217, ..v218]
                    let v220 = erlang_term_coerce(v219)
                    let v221 = atom.create(v167)
                    let v222 = "from_list"
                    let v223 = atom.create(v222)
                    let v224 = []
                    let v225 = [v220, ..v224]
                    let v226 = erlang_term_apply(v221, v223, v225)
                    let v227 = erlang_term_coerce(v206)
                    let v228 = "root"
                    let v229 = atom.create(v228)
                    let v230 = erlang_term_coerce(v229)
                    let v231 = []
                    let v232 = [v227, ..v231]
                    let v233 = [v230, ..v232]
                    let v234 = erlang_term_tuple(v233)
                    let v235 = "spiral_lib"
                    let v236 = atom.create(v235)
                    let v237 = erlang_term_coerce(v236)
                    let v238 = []
                    let v239 = [v227, ..v238]
                    let v240 = [v237, ..v239]
                    let v241 = erlang_term_tuple(v240)
                    let v242 = []
                    let v243 = [v241, ..v242]
                    let v244 = [v234, ..v243]
                    let v245 = erlang_term_coerce(v244)
                    let v246 = "Elixir.Spiral.Cells.Notebook"
                    let v247 = atom.create(v246)
                    let v248 = "evaluate"
                    let v249 = atom.create(v248)
                    let v250 = []
                    let v251 = [v245, ..v250]
                    let v252 = [v226, ..v251]
                    let v253 = erlang_term_apply(v247, v249, v252)
                    let v254 = erlang_term_coerce(v133)
                    let v255 = atom.create(v193)
                    let v256 = atom.create(v195)
                    let v257 = []
                    let v258 = [v254, ..v257]
                    let v259 = erlang_term_apply(v255, v256, v258)
                    let v260 = atom.create(v193)
                    let v261 = atom.create(v201)
                    let v262 = []
                    let v263 = [v259, ..v262]
                    let v264 = erlang_term_apply(v260, v261, v263)
                    let v265 = erlang_term_coerce(v264)
                    let v266 = Uh29Nil
                    let v267 = method300(v191, v266)
                    let v268 = []
                    let v269 = method301(v267, v268)
                    let v270 = erlang_term_coerce(v269)
                    let v271 = atom.create(v164)
                    let v272 = erlang_term_coerce(v271)
                    let v273 = []
                    let v274 = [v270, ..v273]
                    let v275 = [v272, ..v274]
                    let v276 = erlang_term_tuple(v275)
                    let v277 = []
                    let v278 = [v276, ..v277]
                    let v279 = erlang_term_coerce(v278)
                    let v280 = atom.create(v167)
                    let v281 = atom.create(v222)
                    let v282 = []
                    let v283 = [v279, ..v282]
                    let v284 = erlang_term_apply(v280, v281, v283)
                    let v285 = erlang_term_coerce(v265)
                    let v286 = atom.create(v228)
                    let v287 = erlang_term_coerce(v286)
                    let v288 = []
                    let v289 = [v285, ..v288]
                    let v290 = [v287, ..v289]
                    let v291 = erlang_term_tuple(v290)
                    let v292 = atom.create(v235)
                    let v293 = erlang_term_coerce(v292)
                    let v294 = []
                    let v295 = [v285, ..v294]
                    let v296 = [v293, ..v295]
                    let v297 = erlang_term_tuple(v296)
                    let v298 = []
                    let v299 = [v297, ..v298]
                    let v300 = [v291, ..v299]
                    let v301 = erlang_term_coerce(v300)
                    let v302 = atom.create(v246)
                    let v303 = atom.create(v248)
                    let v304 = []
                    let v305 = [v301, ..v304]
                    let v306 = [v284, ..v305]
                    let v307 = erlang_term_apply(v302, v303, v306)
                    let v308 = 0
                    let v309 = method20(v191, v308)
                    let v310 = "\n"
                    let v311 = spiral_wrap_signed(v309 - 1, 32)
                    let v312 = "nil"
                    let v313 = atom.create(v312)
                    let v314 = erlang_term_coerce(v313)
                    let v315 = "status"
                    let v316 = atom.create(v315)
                    let v317 = erlang_term_coerce(v316)
                    let v318 = atom.create(v167)
                    let v319 = atom.create(v169)
                    let v320 = []
                    let v321 = [v314, ..v320]
                    let v322 = [v253, ..v321]
                    let v323 = [v317, ..v322]
                    let v324 = erlang_term_apply(v318, v319, v323)
                    let v325 = []
                    let v326 = erlang_term_coerce(v325)
                    let v327 = "Elixir.Kernel"
                    let v328 = atom.create(v327)
                    let v329 = "inspect"
                    let v330 = atom.create(v329)
                    let v331 = []
                    let v332 = [v326, ..v331]
                    let v333 = [v324, ..v332]
                    let v334 = erlang_term_apply(v328, v330, v333)
                    let v335 = erlang_term_coerce(v334)
                    let v336 = "XDIFF status a="
                    let v337 = v336 <> v335 
                    let v338 = " b="
                    let v339 = v337 <> v338 
                    let v340 = atom.create(v312)
                    let v341 = erlang_term_coerce(v340)
                    let v342 = atom.create(v315)
                    let v343 = erlang_term_coerce(v342)
                    let v344 = atom.create(v167)
                    let v345 = atom.create(v169)
                    let v346 = []
                    let v347 = [v341, ..v346]
                    let v348 = [v307, ..v347]
                    let v349 = [v343, ..v348]
                    let v350 = erlang_term_apply(v344, v345, v349)
                    let v351 = []
                    let v352 = erlang_term_coerce(v351)
                    let v353 = atom.create(v327)
                    let v354 = atom.create(v329)
                    let v355 = []
                    let v356 = [v352, ..v355]
                    let v357 = [v350, ..v356]
                    let v358 = erlang_term_apply(v353, v354, v357)
                    let v359 = erlang_term_coerce(v358)
                    let v360 = v339 <> v359 
                    let v361 = " verdict a="
                    let v362 = v360 <> v361 
                    let v363 = erlang_term_coerce(v311)
                    let v364 = []
                    let v365 = erlang_term_coerce(v364)
                    let v366 = atom.create(v167)
                    let v367 = atom.create(v222)
                    let v368 = []
                    let v369 = [v365, ..v368]
                    let v370 = erlang_term_apply(v366, v367, v369)
                    let v371 = "verdicts"
                    let v372 = atom.create(v371)
                    let v373 = erlang_term_coerce(v372)
                    let v374 = atom.create(v167)
                    let v375 = atom.create(v169)
                    let v376 = []
                    let v377 = [v370, ..v376]
                    let v378 = [v253, ..v377]
                    let v379 = [v373, ..v378]
                    let v380 = erlang_term_apply(v374, v375, v379)
                    let v381 = atom.create(v312)
                    let v382 = erlang_term_coerce(v381)
                    let v383 = atom.create(v167)
                    let v384 = atom.create(v169)
                    let v385 = []
                    let v386 = [v382, ..v385]
                    let v387 = [v380, ..v386]
                    let v388 = [v363, ..v387]
                    let v389 = erlang_term_apply(v383, v384, v388)
                    let v390 = []
                    let v391 = erlang_term_coerce(v390)
                    let v392 = atom.create(v327)
                    let v393 = atom.create(v329)
                    let v394 = []
                    let v395 = [v391, ..v394]
                    let v396 = [v389, ..v395]
                    let v397 = erlang_term_apply(v392, v393, v396)
                    let v398 = erlang_term_coerce(v397)
                    let v399 = v362 <> v398 
                    let v400 = v399 <> v338 
                    let v401 = erlang_term_coerce(v311)
                    let v402 = []
                    let v403 = erlang_term_coerce(v402)
                    let v404 = atom.create(v167)
                    let v405 = atom.create(v222)
                    let v406 = []
                    let v407 = [v403, ..v406]
                    let v408 = erlang_term_apply(v404, v405, v407)
                    let v409 = atom.create(v371)
                    let v410 = erlang_term_coerce(v409)
                    let v411 = atom.create(v167)
                    let v412 = atom.create(v169)
                    let v413 = []
                    let v414 = [v408, ..v413]
                    let v415 = [v307, ..v414]
                    let v416 = [v410, ..v415]
                    let v417 = erlang_term_apply(v411, v412, v416)
                    let v418 = atom.create(v312)
                    let v419 = erlang_term_coerce(v418)
                    let v420 = atom.create(v167)
                    let v421 = atom.create(v169)
                    let v422 = []
                    let v423 = [v419, ..v422]
                    let v424 = [v417, ..v423]
                    let v425 = [v401, ..v424]
                    let v426 = erlang_term_apply(v420, v421, v425)
                    let v427 = []
                    let v428 = erlang_term_coerce(v427)
                    let v429 = atom.create(v327)
                    let v430 = atom.create(v329)
                    let v431 = []
                    let v432 = [v428, ..v431]
                    let v433 = [v426, ..v432]
                    let v434 = erlang_term_apply(v429, v430, v433)
                    let v435 = erlang_term_coerce(v434)
                    let v436 = v400 <> v435 
                    let v437 = 0
                    let v438 = method77(v309, v437)
                    let v439 = Uh13Nil
                    let v440 = method438(v253, v307, v438, v439)
                    let v441 = Uh3Nil
                    let v442 = method439(v253, v307, v440, v441)
                    let v443 = atom.create(v312)
                    let v444 = erlang_term_coerce(v443)
                    let v445 = "outputs"
                    let v446 = atom.create(v445)
                    let v447 = erlang_term_coerce(v446)
                    let v448 = atom.create(v167)
                    let v449 = atom.create(v169)
                    let v450 = []
                    let v451 = [v444, ..v450]
                    let v452 = [v253, ..v451]
                    let v453 = [v447, ..v452]
                    let v454 = erlang_term_apply(v448, v449, v453)
                    let v455 = atom.create(v312)
                    let v456 = erlang_term_coerce(v455)
                    let v457 = atom.create(v445)
                    let v458 = erlang_term_coerce(v457)
                    let v459 = atom.create(v167)
                    let v460 = atom.create(v169)
                    let v461 = []
                    let v462 = [v456, ..v461]
                    let v463 = [v307, ..v462]
                    let v464 = [v458, ..v463]
                    let v465 = erlang_term_apply(v459, v460, v464)
                    let v466 = v454 == v465
                    let v469 =
                        case v466 {
                            True -> {
                                let v467 = "true"
                                v467
                            }
                            False -> {
                                let v468 = "false"
                                v468
                            }
                        }
                    let v470 = "XDIFF done identical="
                    let v471 = v470 <> v469 
                    let v472 = Uh3Nil
                    let v473 = Uh3Cons(v471, v472)
                    let v474 = method18(v442, v473)
                    let v475 = Uh3Cons(v436, v474)
                    delimited_21(v310, v475)
                }
            }
        let v482 = "\n"
        let v483 = v481 <> v482 
        let v484 = erlang_term_coerce(v483)
        let v485 = "io"
        let v486 = atom.create(v485)
        let v487 = "put_chars"
        let v488 = atom.create(v487)
        let v489 = []
        let v490 = [v484, ..v489]
        let _v491 = erlang_term_apply(v486, v488, v490)
        let v492 = v481 == ""
        let v495 =
            case v492 {
                True -> Uh3Nil
                False -> split_list_2(v482, v481)
            }
        let v496 = method399()
        let v497 = method400(v496, v495)
        case v497 {
            True -> 1
            False -> 0
        }
    }
}

pub fn method443(v0: Uh36, v1: Uh29) -> Uh29 {
    case v0  {
        Uh36Cons(v2, v3, v4) -> {
            let v5 = method443(v4, v1)
            let v6 = erlang_term_coerce(v2)
            let v7 = ""
            let v8 = erlang_term_coerce(v7)
            let v9 = "unicode"
            let v10 = atom.create(v9)
            let v11 = "characters_to_list"
            let v12 = atom.create(v11)
            let v13 = []
            let v14 = [v8, ..v13]
            let v15 = erlang_term_apply(v10, v12, v14)
            let v16 = "uri_string"
            let v17 = atom.create(v16)
            let v18 = "quote"
            let v19 = atom.create(v18)
            let v20 = []
            let v21 = [v15, ..v20]
            let v22 = [v6, ..v21]
            let v23 = erlang_term_apply(v17, v19, v22)
            let v24 = erlang_term_coerce(v23)
            let v25 = erlang_term_coerce(v24)
            let v26 = erlang_term_coerce(v3)
            let v27 = erlang_term_coerce(v7)
            let v28 = atom.create(v9)
            let v29 = atom.create(v11)
            let v30 = []
            let v31 = [v27, ..v30]
            let v32 = erlang_term_apply(v28, v29, v31)
            let v33 = atom.create(v16)
            let v34 = atom.create(v18)
            let v35 = []
            let v36 = [v32, ..v35]
            let v37 = [v26, ..v36]
            let v38 = erlang_term_apply(v33, v34, v37)
            let v39 = erlang_term_coerce(v38)
            let v40 = erlang_term_coerce(v39)
            let v41 = []
            let v42 = [v40, ..v41]
            let v43 = [v25, ..v42]
            let v44 = erlang_term_tuple(v43)
            Uh29Cons(v44, v5)
        }
        Uh36Nil -> v1
    }
}

pub fn method444(v0: Int, v1: Dynamic, v2: Int) -> Uh29 {
    let v3 = v2 < v0
    case v3 {
        True -> {
            let v4 = spiral_wrap_signed(v2 + 1, 32)
            let v5 = erlang_term_coerce(v4)
            let v6 = "lists"
            let v7 = atom.create(v6)
            let v8 = "nth"
            let v9 = atom.create(v8)
            let v10 = []
            let v11 = [v1, ..v10]
            let v12 = [v5, ..v11]
            let v13 = erlang_term_apply(v7, v9, v12)
            let v14 = method444(v0, v1, v4)
            Uh29Cons(v13, v14)
        }
        False -> Uh29Nil
    }
}
