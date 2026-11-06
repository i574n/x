import gleam/bit_array
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Uh14, type Us97, type Us98, Uh14Cons, Uh14Nil, Uh30Nil, Uh3Cons, Uh3Nil, Us56Error, Us56Ok, Us80Error, Us80Ok, Us97None, Us97Some, Us98Error, Us98Ok}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, method18, spiral_fs_read_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part12.{items_from_303, method301, method302}
import xsim_frames/part16.{method372, method373}
import xsim_frames/part18.{method398, method402, method403}
import xsim_frames/part19.{method411, method412}
import xsim_frames/part2.{delimited_21, method20, taken_31}
import xsim_frames/part23.{closure137, closure139}
import xsim_frames/part3.{method79}
import xsim_frames/part9.{method260, method261}

pub fn valued_then_448(v0: fn(#(String, Int)) -> fn(String) -> Us97, v1: fn(#(String, Int)) -> fn(String) -> fn(String) -> Us98, v2: String, v3: Int, v4: String, v5: Uh3) -> Us98 {
    case v5  {
        Uh3Cons(v6, v7) -> {
            let v8 = v1(#(v2, v3))
            let v10 = v4 |> string.starts_with("--")
            let v17 =
                case v10 {
                    True -> {
                        let v11 = spiral_string_length(v4)
                        let v12 = spiral_wrap_signed(v11 - 2, 32)
                        let v13 = spiral_wrap_signed(2 + v12, 32)
                        let v14 = spiral_wrap_signed(v13 - 1, 32)
                        spiral_string_slice(v4, 2, v14)
                    }
                    False -> {
                        ""
                    }
                }
            let v18 = v8(v17)
            let v19 = v18(v6)
            continued_449(v0, v1, v19, v7)
        }
        Uh3Nil -> {
            let v22 = v4 |> string.starts_with("--")
            let v29 =
                case v22 {
                    True -> {
                        let v23 = spiral_string_length(v4)
                        let v24 = spiral_wrap_signed(v23 - 2, 32)
                        let v25 = spiral_wrap_signed(2 + v24, 32)
                        let v26 = spiral_wrap_signed(v25 - 1, 32)
                        spiral_string_slice(v4, 2, v26)
                    }
                    False -> {
                        ""
                    }
                }
            let v30 = { "--" } <> { v29 }
            let v31 = { v30 } <> { " needs a value" }
            Us98Error(v31)
        }
    }
}

pub fn arg_parsed_447(v0: fn(#(String, Int)) -> fn(String) -> Us97, v1: fn(#(String, Int)) -> fn(String) -> fn(String) -> Us98, v2: String, v3: Int, v4: String, v5: Uh3) -> Us98 {
    let v6 = v0(#(v2, v3))
    let v8 = v4 |> string.starts_with("--")
    let v15 =
        case v8 {
            True -> {
                let v9 = spiral_string_length(v4)
                let v10 = spiral_wrap_signed(v9 - 2, 32)
                let v11 = spiral_wrap_signed(2 + v10, 32)
                let v12 = spiral_wrap_signed(v11 - 1, 32)
                spiral_string_slice(v4, 2, v12)
            }
            False -> {
                ""
            }
        }
    let v16 = v6(v15)
    case v16  {
        Us97None -> valued_then_448(v0, v1, v2, v3, v4, v5)
        Us97Some(v17, v18) -> flags_parsed_446(v0, v1, v17, v18, v5)
    }
}

pub fn flags_parsed_446(v0: fn(#(String, Int)) -> fn(String) -> Us97, v1: fn(#(String, Int)) -> fn(String) -> fn(String) -> Us98, v2: String, v3: Int, v4: Uh3) -> Us98 {
    case v4  {
        Uh3Cons(v6, v7) -> {
            let v9 = v6 |> string.starts_with("--")
            let v16 =
                case v9 {
                    True -> {
                        let v10 = spiral_string_length(v6)
                        let v11 = spiral_wrap_signed(v10 - 2, 32)
                        let v12 = spiral_wrap_signed(2 + v11, 32)
                        let v13 = spiral_wrap_signed(v12 - 1, 32)
                        spiral_string_slice(v6, 2, v13)
                    }
                    False -> {
                        ""
                    }
                }
            let v17 = v16 == ""
            case v17 {
                True -> {
                    let v18 = { "unexpected argument '" } <> { v6 }
                    let v19 = { v18 } <> { "'" }
                    Us98Error(v19)
                }
                False -> arg_parsed_447(v0, v1, v2, v3, v6, v7)
            }
        }
        Uh3Nil -> Us98Ok(v2, v3)
    }
}

pub fn continued_449(v0: fn(#(String, Int)) -> fn(String) -> Us97, v1: fn(#(String, Int)) -> fn(String) -> fn(String) -> Us98, v2: Us98, v3: Uh3) -> Us98 {
    case v2  {
        Us98Error(v7) -> Us98Error(v7)
        Us98Ok(v4, v5) -> flags_parsed_446(v0, v1, v4, v5, v3)
    }
}

pub fn method450(v0: Dynamic, v1: Dynamic, v2: Uh14, v3: Uh14) -> Uh14 {
    case v2  {
        Uh14Cons(v4, v5) -> {
            let v6 = method450(v0, v1, v5, v3)
            let v7 = []
            let v8 = erlang_term_coerce(v7)
            let v9 = "maps"
            let v10 = atom.create(v9)
            let v11 = "from_list"
            let v12 = atom.create(v11)
            let v13 = []
            let v14 = [v8, ..v13]
            let v15 = erlang_term_apply(v10, v12, v14)
            let v16 = "outputs"
            let v17 = atom.create(v16)
            let v18 = erlang_term_coerce(v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = erlang_term_coerce(v15)
            let v21 = atom.create(v9)
            let v22 = "get"
            let v23 = atom.create(v22)
            let v24 = []
            let v25 = [v20, ..v24]
            let v26 = [v0, ..v25]
            let v27 = [v19, ..v26]
            let v28 = erlang_term_apply(v21, v23, v27)
            let v29 = erlang_term_coerce(v28)
            let v30 = "nil"
            let v31 = atom.create(v30)
            let v32 = erlang_term_coerce(v31)
            let v33 = erlang_term_coerce(v4)
            let v34 = erlang_term_coerce(v32)
            let v35 = atom.create(v9)
            let v36 = atom.create(v22)
            let v37 = []
            let v38 = [v34, ..v37]
            let v39 = [v29, ..v38]
            let v40 = [v33, ..v39]
            let v41 = erlang_term_apply(v35, v36, v40)
            let v42 = erlang_term_coerce(v41)
            let v43 = []
            let v44 = erlang_term_coerce(v43)
            let v45 = atom.create(v9)
            let v46 = atom.create(v11)
            let v47 = []
            let v48 = [v44, ..v47]
            let v49 = erlang_term_apply(v45, v46, v48)
            let v50 = atom.create(v16)
            let v51 = erlang_term_coerce(v50)
            let v52 = erlang_term_coerce(v51)
            let v53 = erlang_term_coerce(v49)
            let v54 = atom.create(v9)
            let v55 = atom.create(v22)
            let v56 = []
            let v57 = [v53, ..v56]
            let v58 = [v1, ..v57]
            let v59 = [v52, ..v58]
            let v60 = erlang_term_apply(v54, v55, v59)
            let v61 = erlang_term_coerce(v60)
            let v62 = atom.create(v30)
            let v63 = erlang_term_coerce(v62)
            let v64 = erlang_term_coerce(v4)
            let v65 = erlang_term_coerce(v63)
            let v66 = atom.create(v9)
            let v67 = atom.create(v22)
            let v68 = []
            let v69 = [v65, ..v68]
            let v70 = [v61, ..v69]
            let v71 = [v64, ..v70]
            let v72 = erlang_term_apply(v66, v67, v71)
            let v73 = erlang_term_coerce(v72)
            let v74 = v42 == v73
            let v75 = v74 == False
            case v75 {
                True -> Uh14Cons(v4, v6)
                False -> v6
            }
        }
        Uh14Nil -> v3
    }
}

pub fn method451(v0: Dynamic, v1: Dynamic, v2: Uh14, v3: Uh3) -> Uh3 {
    case v2  {
        Uh14Cons(v4, v5) -> {
            let v6 = method451(v0, v1, v5, v3)
            let v7 = int.to_string(v4)
            let v8 = { "XDIFF cell " } <> { v7 }
            let v9 = { v8 } <> { "\n  a=" }
            let v10 = []
            let v11 = erlang_term_coerce(v10)
            let v12 = "maps"
            let v13 = atom.create(v12)
            let v14 = "from_list"
            let v15 = atom.create(v14)
            let v16 = []
            let v17 = [v11, ..v16]
            let v18 = erlang_term_apply(v13, v15, v17)
            let v19 = "outputs"
            let v20 = atom.create(v19)
            let v21 = erlang_term_coerce(v20)
            let v22 = erlang_term_coerce(v21)
            let v23 = erlang_term_coerce(v18)
            let v24 = atom.create(v12)
            let v25 = "get"
            let v26 = atom.create(v25)
            let v27 = []
            let v28 = [v23, ..v27]
            let v29 = [v0, ..v28]
            let v30 = [v22, ..v29]
            let v31 = erlang_term_apply(v24, v26, v30)
            let v32 = erlang_term_coerce(v31)
            let v33 = "nil"
            let v34 = atom.create(v33)
            let v35 = erlang_term_coerce(v34)
            let v36 = erlang_term_coerce(v4)
            let v37 = erlang_term_coerce(v35)
            let v38 = atom.create(v12)
            let v39 = atom.create(v25)
            let v40 = []
            let v41 = [v37, ..v40]
            let v42 = [v32, ..v41]
            let v43 = [v36, ..v42]
            let v44 = erlang_term_apply(v38, v39, v43)
            let v45 = erlang_term_coerce(v44)
            let v46 = erlang_term_coerce(600)
            let v47 = "printable_limit"
            let v48 = atom.create(v47)
            let v49 = erlang_term_coerce(v48)
            let v50 = []
            let v51 = [v46, ..v50]
            let v52 = [v49, ..v51]
            let v53 = erlang_term_tuple(v52)
            let v54 = []
            let v55 = [v53, ..v54]
            let v56 = erlang_term_coerce(v55)
            let v57 = "Elixir.Kernel"
            let v58 = atom.create(v57)
            let v59 = "inspect"
            let v60 = atom.create(v59)
            let v61 = []
            let v62 = [v56, ..v61]
            let v63 = [v45, ..v62]
            let v64 = erlang_term_apply(v58, v60, v63)
            let v65 = erlang_term_coerce(v64)
            let v66 = { v9 } <> { v65 }
            let v67 = { v66 } <> { "\n  b=" }
            let v68 = []
            let v69 = erlang_term_coerce(v68)
            let v70 = atom.create(v12)
            let v71 = atom.create(v14)
            let v72 = []
            let v73 = [v69, ..v72]
            let v74 = erlang_term_apply(v70, v71, v73)
            let v75 = atom.create(v19)
            let v76 = erlang_term_coerce(v75)
            let v77 = erlang_term_coerce(v76)
            let v78 = erlang_term_coerce(v74)
            let v79 = atom.create(v12)
            let v80 = atom.create(v25)
            let v81 = []
            let v82 = [v78, ..v81]
            let v83 = [v1, ..v82]
            let v84 = [v77, ..v83]
            let v85 = erlang_term_apply(v79, v80, v84)
            let v86 = erlang_term_coerce(v85)
            let v87 = atom.create(v33)
            let v88 = erlang_term_coerce(v87)
            let v89 = erlang_term_coerce(v4)
            let v90 = erlang_term_coerce(v88)
            let v91 = atom.create(v12)
            let v92 = atom.create(v25)
            let v93 = []
            let v94 = [v90, ..v93]
            let v95 = [v86, ..v94]
            let v96 = [v89, ..v95]
            let v97 = erlang_term_apply(v91, v92, v96)
            let v98 = erlang_term_coerce(v97)
            let v99 = erlang_term_coerce(600)
            let v100 = atom.create(v47)
            let v101 = erlang_term_coerce(v100)
            let v102 = []
            let v103 = [v99, ..v102]
            let v104 = [v101, ..v103]
            let v105 = erlang_term_tuple(v104)
            let v106 = []
            let v107 = [v105, ..v106]
            let v108 = erlang_term_coerce(v107)
            let v109 = atom.create(v57)
            let v110 = atom.create(v59)
            let v111 = []
            let v112 = [v108, ..v111]
            let v113 = [v98, ..v112]
            let v114 = erlang_term_apply(v109, v110, v113)
            let v115 = erlang_term_coerce(v114)
            let v116 = { v67 } <> { v115 }
            Uh3Cons(v116, v6)
        }
        Uh14Nil -> v3
    }
}

pub fn closure136(capt: Nil) -> fn(String) -> Int {
    fn (v0) {
        let v2 = atom.create("crypto")
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
        let v39 =
            case v23 {
                True -> True
                False -> {
                    let v24 = string.inspect(v10)
                    let v25 = { "xsim / crypto did not start: " } <> { v24 }
                    let v26 = { v25 } <> { "\n" }
                    let v28 = atom.create("standard_error")
                    let v29 = erlang_term_coerce(v28)
                    let v30 = erlang_term_coerce(v26)
                    let v32 = atom.create("io")
                    let v34 = atom.create("put_chars")
                    let v35 = []
                    let v36 = [v30, ..v35]
                    let v37 = [v29, ..v36]
                    let _v38 = erlang_term_apply(v32, v34, v37)
                    False
                }
            }
        let _v74 =
            case v39 {
                True -> {
                    let v41 = atom.create("spiral_cells")
                    let v42 = erlang_term_coerce(v41)
                    let v43 = atom.create(v4)
                    let v44 = atom.create(v6)
                    let v45 = []
                    let v46 = [v42, ..v45]
                    let v47 = erlang_term_apply(v43, v44, v46)
                    let v48 = erlang_term_coerce(1)
                    let v49 = atom.create(v12)
                    let v50 = atom.create(v14)
                    let v51 = []
                    let v52 = [v47, ..v51]
                    let v53 = [v48, ..v52]
                    let v54 = erlang_term_apply(v49, v50, v53)
                    let v55 = atom.create(v20)
                    let v56 = erlang_term_coerce(v55)
                    let v57 = v54 == v56
                    case v57 {
                        True -> True
                        False -> {
                            let v58 = string.inspect(v47)
                            let v59 = { "xsim / spiral_cells did not start: " } <> { v58 }
                            let v60 = { v59 } <> { "\n" }
                            let v62 = atom.create("standard_error")
                            let v63 = erlang_term_coerce(v62)
                            let v64 = erlang_term_coerce(v60)
                            let v66 = atom.create("io")
                            let v68 = atom.create("put_chars")
                            let v69 = []
                            let v70 = [v64, ..v69]
                            let v71 = [v63, ..v70]
                            let _v72 = erlang_term_apply(v66, v68, v71)
                            False
                        }
                    }
                }
                False -> False
            }
        let v76 = atom.create("init")
        let v78 = atom.create("get_plain_arguments")
        let v79 = []
        let v80 = erlang_term_apply(v76, v78, v79)
        let v81 = "lists"
        let v82 = atom.create(v81)
        let v83 = "reverse"
        let v84 = atom.create(v83)
        let v85 = []
        let v86 = [v80, ..v85]
        let v87 = erlang_term_apply(v82, v84, v86)
        let v89 = items_from_303(v87, Uh30Nil)
        let v91 = method398(v89, Uh3Nil)
        let v96 =
            case v91  {
                Uh3Cons(v92, v93) -> v93
                Uh3Nil -> Uh3Nil
            }
        let v97 = closure137(Nil)
        let v98 = closure139(Nil)
        let v99 = ""
        let v101 = flags_parsed_446(v97, v98, v99, 5, v96)
        let v108 =
            case v101  {
                Us98Ok(v102, v103) -> {
                    let v104 = v102 == ""
                    case v104 {
                        True -> {
                            Us98Error("missing --spi")
                        }
                        False -> v101
                    }
                }
                _ -> v101
            }
        let v505 =
            case v108  {
                Us98Error(v502) -> {
                    let v503 = { "XSIM rejected diff: " } <> { v502 }
                    v503
                }
                Us98Ok(v109, v110) -> {
                    let v111 = spiral_fs_read_file(v109)
                    let v112 = method372()
                    let v113 = method373()
                    let v114 = case v111 { Ok(x) -> v112(x) Error(x) -> v113(x) }
                    let v127 =
                        case v114  {
                            Us80Error(v124) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us80Ok(v115) -> {
                                let v116 = bit_array.to_string(v115)
                                let v117 = method260()
                                let v118 = method261()
                                let v119 = case v116 { Ok(x) -> v117(x) Error(x) -> v118(x) }
                                case v119  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v120) -> v120
                                }
                            }
                        }
                    let v128 = erlang_term_coerce(v127)
                    let v129 = erlang_term_coerce(v99)
                    let v131 = atom.create("Elixir.Spiral.Cells.Document")
                    let v133 = atom.create("parse_spi")
                    let v134 = []
                    let v135 = [v129, ..v134]
                    let v136 = [v128, ..v135]
                    let v137 = erlang_term_apply(v131, v133, v136)
                    let v138 = []
                    let v139 = erlang_term_coerce(v138)
                    let v140 = "cells"
                    let v141 = atom.create(v140)
                    let v142 = erlang_term_coerce(v141)
                    let v143 = erlang_term_coerce(v142)
                    let v144 = erlang_term_coerce(v139)
                    let v145 = "maps"
                    let v146 = atom.create(v145)
                    let v147 = "get"
                    let v148 = atom.create(v147)
                    let v149 = []
                    let v150 = [v144, ..v149]
                    let v151 = [v137, ..v150]
                    let v152 = [v143, ..v151]
                    let v153 = erlang_term_apply(v146, v148, v152)
                    let v154 = erlang_term_coerce(v153)
                    let v155 = atom.create(v81)
                    let v156 = atom.create(v83)
                    let v157 = []
                    let v158 = [v154, ..v157]
                    let v159 = erlang_term_apply(v155, v156, v158)
                    let v161 = items_from_303(v159, Uh30Nil)
                    let v163 = method402(v161, Uh30Nil)
                    let v165 = method403(v163, Uh3Nil)
                    let v166 = v110 < 0
                    let v168 =
                        case v166 {
                            True -> v165
                            False -> taken_31(v110, v165)
                        }
                    let v169 = erlang_term_coerce(v109)
                    let v170 = "filename"
                    let v171 = atom.create(v170)
                    let v172 = "absname"
                    let v173 = atom.create(v172)
                    let v174 = []
                    let v175 = [v169, ..v174]
                    let v176 = erlang_term_apply(v171, v173, v175)
                    let v177 = "unicode"
                    let v178 = atom.create(v177)
                    let v179 = "characters_to_binary"
                    let v180 = atom.create(v179)
                    let v181 = []
                    let v182 = [v176, ..v181]
                    let v183 = erlang_term_apply(v178, v180, v182)
                    let v184 = erlang_term_coerce(v183)
                    let v185 = erlang_term_coerce(v184)
                    let v186 = atom.create(v170)
                    let v187 = "dirname"
                    let v188 = atom.create(v187)
                    let v189 = []
                    let v190 = [v185, ..v189]
                    let v191 = erlang_term_apply(v186, v188, v190)
                    let v192 = atom.create(v177)
                    let v193 = atom.create(v179)
                    let v194 = []
                    let v195 = [v191, ..v194]
                    let v196 = erlang_term_apply(v192, v193, v195)
                    let v197 = erlang_term_coerce(v196)
                    let v199 = method301(v168, Uh30Nil)
                    let v200 = []
                    let v201 = method302(v199, v200)
                    let v202 = erlang_term_coerce(v201)
                    let v203 = atom.create(v140)
                    let v204 = erlang_term_coerce(v203)
                    let v205 = erlang_term_coerce(v204)
                    let v206 = erlang_term_coerce(v202)
                    let v207 = []
                    let v208 = [v206, ..v207]
                    let v209 = [v205, ..v208]
                    let v210 = erlang_term_tuple(v209)
                    let v211 = []
                    let v212 = [v210, ..v211]
                    let v213 = erlang_term_coerce(v212)
                    let v214 = atom.create(v145)
                    let v215 = "from_list"
                    let v216 = atom.create(v215)
                    let v217 = []
                    let v218 = [v213, ..v217]
                    let v219 = erlang_term_apply(v214, v216, v218)
                    let v220 = erlang_term_coerce(v197)
                    let v221 = "root"
                    let v222 = atom.create(v221)
                    let v223 = erlang_term_coerce(v222)
                    let v224 = []
                    let v225 = [v220, ..v224]
                    let v226 = [v223, ..v225]
                    let v227 = erlang_term_tuple(v226)
                    let v228 = "spiral_lib"
                    let v229 = atom.create(v228)
                    let v230 = erlang_term_coerce(v229)
                    let v231 = []
                    let v232 = [v220, ..v231]
                    let v233 = [v230, ..v232]
                    let v234 = erlang_term_tuple(v233)
                    let v235 = []
                    let v236 = [v234, ..v235]
                    let v237 = [v227, ..v236]
                    let v238 = erlang_term_coerce(v237)
                    let v239 = "Elixir.Spiral.Cells.Notebook"
                    let v240 = atom.create(v239)
                    let v241 = "evaluate"
                    let v242 = atom.create(v241)
                    let v243 = []
                    let v244 = [v238, ..v243]
                    let v245 = [v219, ..v244]
                    let v246 = erlang_term_apply(v240, v242, v245)
                    let v247 = erlang_term_coerce(v109)
                    let v248 = atom.create(v170)
                    let v249 = atom.create(v172)
                    let v250 = []
                    let v251 = [v247, ..v250]
                    let v252 = erlang_term_apply(v248, v249, v251)
                    let v253 = atom.create(v177)
                    let v254 = atom.create(v179)
                    let v255 = []
                    let v256 = [v252, ..v255]
                    let v257 = erlang_term_apply(v253, v254, v256)
                    let v258 = erlang_term_coerce(v257)
                    let v259 = erlang_term_coerce(v258)
                    let v260 = atom.create(v170)
                    let v261 = atom.create(v187)
                    let v262 = []
                    let v263 = [v259, ..v262]
                    let v264 = erlang_term_apply(v260, v261, v263)
                    let v265 = atom.create(v177)
                    let v266 = atom.create(v179)
                    let v267 = []
                    let v268 = [v264, ..v267]
                    let v269 = erlang_term_apply(v265, v266, v268)
                    let v270 = erlang_term_coerce(v269)
                    let v272 = method301(v168, Uh30Nil)
                    let v273 = []
                    let v274 = method302(v272, v273)
                    let v275 = erlang_term_coerce(v274)
                    let v276 = atom.create(v140)
                    let v277 = erlang_term_coerce(v276)
                    let v278 = erlang_term_coerce(v277)
                    let v279 = erlang_term_coerce(v275)
                    let v280 = []
                    let v281 = [v279, ..v280]
                    let v282 = [v278, ..v281]
                    let v283 = erlang_term_tuple(v282)
                    let v284 = []
                    let v285 = [v283, ..v284]
                    let v286 = erlang_term_coerce(v285)
                    let v287 = atom.create(v145)
                    let v288 = atom.create(v215)
                    let v289 = []
                    let v290 = [v286, ..v289]
                    let v291 = erlang_term_apply(v287, v288, v290)
                    let v292 = erlang_term_coerce(v270)
                    let v293 = atom.create(v221)
                    let v294 = erlang_term_coerce(v293)
                    let v295 = []
                    let v296 = [v292, ..v295]
                    let v297 = [v294, ..v296]
                    let v298 = erlang_term_tuple(v297)
                    let v299 = atom.create(v228)
                    let v300 = erlang_term_coerce(v299)
                    let v301 = []
                    let v302 = [v292, ..v301]
                    let v303 = [v300, ..v302]
                    let v304 = erlang_term_tuple(v303)
                    let v305 = []
                    let v306 = [v304, ..v305]
                    let v307 = [v298, ..v306]
                    let v308 = erlang_term_coerce(v307)
                    let v309 = atom.create(v239)
                    let v310 = atom.create(v241)
                    let v311 = []
                    let v312 = [v308, ..v311]
                    let v313 = [v291, ..v312]
                    let v314 = erlang_term_apply(v309, v310, v313)
                    let v316 = method20(v168, 0)
                    let v318 = spiral_wrap_signed(v316 - 1, 32)
                    let v319 = "nil"
                    let v320 = atom.create(v319)
                    let v321 = erlang_term_coerce(v320)
                    let v322 = "status"
                    let v323 = atom.create(v322)
                    let v324 = erlang_term_coerce(v323)
                    let v325 = erlang_term_coerce(v324)
                    let v326 = erlang_term_coerce(v321)
                    let v327 = atom.create(v145)
                    let v328 = atom.create(v147)
                    let v329 = []
                    let v330 = [v326, ..v329]
                    let v331 = [v246, ..v330]
                    let v332 = [v325, ..v331]
                    let v333 = erlang_term_apply(v327, v328, v332)
                    let v334 = erlang_term_coerce(v333)
                    let v335 = []
                    let v336 = erlang_term_coerce(v335)
                    let v337 = "Elixir.Kernel"
                    let v338 = atom.create(v337)
                    let v339 = "inspect"
                    let v340 = atom.create(v339)
                    let v341 = []
                    let v342 = [v336, ..v341]
                    let v343 = [v334, ..v342]
                    let v344 = erlang_term_apply(v338, v340, v343)
                    let v345 = erlang_term_coerce(v344)
                    let v346 = { "XDIFF status a=" } <> { v345 }
                    let v347 = { v346 } <> { " b=" }
                    let v348 = atom.create(v319)
                    let v349 = erlang_term_coerce(v348)
                    let v350 = atom.create(v322)
                    let v351 = erlang_term_coerce(v350)
                    let v352 = erlang_term_coerce(v351)
                    let v353 = erlang_term_coerce(v349)
                    let v354 = atom.create(v145)
                    let v355 = atom.create(v147)
                    let v356 = []
                    let v357 = [v353, ..v356]
                    let v358 = [v314, ..v357]
                    let v359 = [v352, ..v358]
                    let v360 = erlang_term_apply(v354, v355, v359)
                    let v361 = erlang_term_coerce(v360)
                    let v362 = []
                    let v363 = erlang_term_coerce(v362)
                    let v364 = atom.create(v337)
                    let v365 = atom.create(v339)
                    let v366 = []
                    let v367 = [v363, ..v366]
                    let v368 = [v361, ..v367]
                    let v369 = erlang_term_apply(v364, v365, v368)
                    let v370 = erlang_term_coerce(v369)
                    let v371 = { v347 } <> { v370 }
                    let v372 = { v371 } <> { " verdict a=" }
                    let v373 = []
                    let v374 = erlang_term_coerce(v373)
                    let v375 = atom.create(v145)
                    let v376 = atom.create(v215)
                    let v377 = []
                    let v378 = [v374, ..v377]
                    let v379 = erlang_term_apply(v375, v376, v378)
                    let v380 = "verdicts"
                    let v381 = atom.create(v380)
                    let v382 = erlang_term_coerce(v381)
                    let v383 = erlang_term_coerce(v382)
                    let v384 = erlang_term_coerce(v379)
                    let v385 = atom.create(v145)
                    let v386 = atom.create(v147)
                    let v387 = []
                    let v388 = [v384, ..v387]
                    let v389 = [v246, ..v388]
                    let v390 = [v383, ..v389]
                    let v391 = erlang_term_apply(v385, v386, v390)
                    let v392 = erlang_term_coerce(v391)
                    let v393 = atom.create(v319)
                    let v394 = erlang_term_coerce(v393)
                    let v395 = erlang_term_coerce(v318)
                    let v396 = erlang_term_coerce(v394)
                    let v397 = atom.create(v145)
                    let v398 = atom.create(v147)
                    let v399 = []
                    let v400 = [v396, ..v399]
                    let v401 = [v392, ..v400]
                    let v402 = [v395, ..v401]
                    let v403 = erlang_term_apply(v397, v398, v402)
                    let v404 = erlang_term_coerce(v403)
                    let v405 = []
                    let v406 = erlang_term_coerce(v405)
                    let v407 = atom.create(v337)
                    let v408 = atom.create(v339)
                    let v409 = []
                    let v410 = [v406, ..v409]
                    let v411 = [v404, ..v410]
                    let v412 = erlang_term_apply(v407, v408, v411)
                    let v413 = erlang_term_coerce(v412)
                    let v414 = { v372 } <> { v413 }
                    let v415 = { v414 } <> { " b=" }
                    let v416 = []
                    let v417 = erlang_term_coerce(v416)
                    let v418 = atom.create(v145)
                    let v419 = atom.create(v215)
                    let v420 = []
                    let v421 = [v417, ..v420]
                    let v422 = erlang_term_apply(v418, v419, v421)
                    let v423 = atom.create(v380)
                    let v424 = erlang_term_coerce(v423)
                    let v425 = erlang_term_coerce(v424)
                    let v426 = erlang_term_coerce(v422)
                    let v427 = atom.create(v145)
                    let v428 = atom.create(v147)
                    let v429 = []
                    let v430 = [v426, ..v429]
                    let v431 = [v314, ..v430]
                    let v432 = [v425, ..v431]
                    let v433 = erlang_term_apply(v427, v428, v432)
                    let v434 = erlang_term_coerce(v433)
                    let v435 = atom.create(v319)
                    let v436 = erlang_term_coerce(v435)
                    let v437 = erlang_term_coerce(v318)
                    let v438 = erlang_term_coerce(v436)
                    let v439 = atom.create(v145)
                    let v440 = atom.create(v147)
                    let v441 = []
                    let v442 = [v438, ..v441]
                    let v443 = [v434, ..v442]
                    let v444 = [v437, ..v443]
                    let v445 = erlang_term_apply(v439, v440, v444)
                    let v446 = erlang_term_coerce(v445)
                    let v447 = []
                    let v448 = erlang_term_coerce(v447)
                    let v449 = atom.create(v337)
                    let v450 = atom.create(v339)
                    let v451 = []
                    let v452 = [v448, ..v451]
                    let v453 = [v446, ..v452]
                    let v454 = erlang_term_apply(v449, v450, v453)
                    let v455 = erlang_term_coerce(v454)
                    let v456 = { v415 } <> { v455 }
                    let v458 = method79(v316, 0)
                    let v460 = method450(v246, v314, v458, Uh14Nil)
                    let v462 = method451(v246, v314, v460, Uh3Nil)
                    let v463 = atom.create(v319)
                    let v464 = erlang_term_coerce(v463)
                    let v465 = "outputs"
                    let v466 = atom.create(v465)
                    let v467 = erlang_term_coerce(v466)
                    let v468 = erlang_term_coerce(v467)
                    let v469 = erlang_term_coerce(v464)
                    let v470 = atom.create(v145)
                    let v471 = atom.create(v147)
                    let v472 = []
                    let v473 = [v469, ..v472]
                    let v474 = [v246, ..v473]
                    let v475 = [v468, ..v474]
                    let v476 = erlang_term_apply(v470, v471, v475)
                    let v477 = erlang_term_coerce(v476)
                    let v478 = atom.create(v319)
                    let v479 = erlang_term_coerce(v478)
                    let v480 = atom.create(v465)
                    let v481 = erlang_term_coerce(v480)
                    let v482 = erlang_term_coerce(v481)
                    let v483 = erlang_term_coerce(v479)
                    let v484 = atom.create(v145)
                    let v485 = atom.create(v147)
                    let v486 = []
                    let v487 = [v483, ..v486]
                    let v488 = [v314, ..v487]
                    let v489 = [v482, ..v488]
                    let v490 = erlang_term_apply(v484, v485, v489)
                    let v491 = erlang_term_coerce(v490)
                    let v492 = v477 == v491
                    let v495 =
                        case v492 {
                            True -> {
                                "true"
                            }
                            False -> {
                                "false"
                            }
                        }
                    let v496 = { "XDIFF done identical=" } <> { v495 }
                    let v498 = Uh3Cons(v496, Uh3Nil)
                    let v499 = method18(v462, v498)
                    let v500 = Uh3Cons(v456, v499)
                    delimited_21("\n", v500)
                }
            }
        let v506 = { v505 } <> { "\n" }
        let v507 = erlang_term_coerce(v506)
        let v509 = atom.create("io")
        let v511 = atom.create("put_chars")
        let v512 = []
        let v513 = [v507, ..v512]
        let _v514 = erlang_term_apply(v509, v511, v513)
        let v515 = v505 == ""
        let v519 =
            case v515 {
                True -> Uh3Nil
                False -> {
                    split_list_2("\n", v505)
                }
            }
        let v520 = method411()
        let v521 = method412(v520, v519)
        case v521 {
            True -> 1
            False -> 0
        }
    }
}
