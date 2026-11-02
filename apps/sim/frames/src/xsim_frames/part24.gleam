import gleam/bit_array
import gleam/erlang/atom
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Us88, type Us89, Uh29Cons, Uh29Nil, Uh3Cons, Uh3Nil, Uh8Nil, Us56Error, Us56Ok, Us76Error, Us76Ok, Us87Error, Us87Ok, Us88None, Us88Some, Us89Error, Us89Ok}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, spiral_fs_coerce, spiral_fs_read_file, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part10.{method259, method260}
import xsim_frames/part17.{method367, method368}
import xsim_frames/part2.{delimited_21, method20}
import xsim_frames/part20.{method396, method399, method400}
import xsim_frames/part23.{closure125, closure127, file_cells_414, flags_parsed_410, method425, method426, thread_of_418}

pub fn closure124(capt: Nil) -> fn(String) -> Int {
    fn (v0) {
        let v1 = "init"
        let v2 = atom.create(v1)
        let v3 = "get_plain_arguments"
        let v4 = atom.create(v3)
        let v5 = []
        let v6 = erlang_term_apply(v2, v4, v5)
        let v7 = erlang_term_coerce(0)
        let v8 = []
        let v9 = [v7, ..v8]
        let v10 = erlang_term_coerce(v9)
        let v11 = "lists"
        let v12 = atom.create(v11)
        let v13 = "join"
        let v14 = atom.create(v13)
        let v15 = []
        let v16 = [v6, ..v15]
        let v17 = [v10, ..v16]
        let v18 = erlang_term_apply(v12, v14, v17)
        let v19 = "unicode"
        let v20 = atom.create(v19)
        let v21 = "characters_to_binary"
        let v22 = atom.create(v21)
        let v23 = []
        let v24 = [v18, ..v23]
        let v25 = erlang_term_apply(v20, v22, v24)
        let v26 = erlang_term_coerce(v25)
        let v27 = unicode_erlang_characters_to_binary([0])
        let v28 = v26 == ""
        let v31 =
            case v28 {
                True -> Uh3Nil
                False -> split_list_2(v27, v26)
            }
        let v36 =
            case v31  {
                Uh3Cons(v32, v33) -> v33
                Uh3Nil -> Uh3Nil
            }
        let v37 = closure125(Nil)
        let v38 = closure127(Nil)
        let v39 = ""
        let v40 = flags_parsed_410(v37, v38, v39, v39, v36)
        let v57 =
            case v40  {
                Us87Ok(v41, v42) -> {
                    let v43 = v41 == ""
                    let v48 =
                        case v43 {
                            True -> {
                                let v44 = "missing --file"
                                v44
                            }
                            False -> {
                                let v45 = v42 == ""
                                case v45 {
                                    True -> {
                                        let v46 = "missing --out"
                                        v46
                                    }
                                    False -> v39
                                }
                            }
                        }
                    let v49 = v48 != ""
                    case v49 {
                        True -> {
                            let v54 =
                                case v43 {
                                    True -> {
                                        let v50 = "missing --file"
                                        v50
                                    }
                                    False -> {
                                        let v51 = v42 == ""
                                        case v51 {
                                            True -> {
                                                let v52 = "missing --out"
                                                v52
                                            }
                                            False -> v39
                                        }
                                    }
                                }
                            Us87Error(v54)
                        }
                        False -> v40
                    }
                }
                _ -> v40
            }
        let v161 =
            case v57  {
                Us87Error(v157) -> {
                    let v158 = "XSIM rejected frames: "
                    let v159 = v158 <> v157 
                    v159
                }
                Us87Ok(v58, v59) -> {
                    let v60 = spiral_fs_read_file(v58)
                    let v61 = method367()
                    let v62 = method368()
                    let v63 = case v60 { Ok(x) -> v61(x) Error(x) -> v62(x) }
                    let v76 =
                        case v63  {
                            Us76Error(v73) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us76Ok(v64) -> {
                                let v65 = bit_array.to_string(v64)
                                let v66 = method259()
                                let v67 = method260()
                                let v68 = case v65 { Ok(x) -> v66(x) Error(x) -> v67(x) }
                                case v68  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v69) -> v69
                                }
                            }
                        }
                    let v77 = 1
                    let v78 = file_cells_414(v76)
                    let v79 = Uh8Nil
                    let v80 = thread_of_418(v77, v78, v79)
                    let v81 = file_cells_414(v76)
                    let v82 = Uh3Nil
                    let v83 = method425(v81, v82)
                    let v84 = "\n\n"
                    let v85 = delimited_21(v84, v83)
                    let v86 = v85 == ""
                    let v90 =
                        case v86 {
                            True -> Uh3Nil
                            False -> {
                                let v88 = "\n"
                                split_list_2(v88, v85)
                            }
                        }
                    let v100 =
                        case v80  {
                            Uh3Nil -> {
                                let v91 = "[]"
                                v91
                            }
                            _ -> {
                                let v92 = ",\n        "
                                let v93 = Uh3Nil
                                let v94 = method426(v80, v93)
                                let v95 = delimited_21(v92, v94)
                                let v96 = "[\n        "
                                let v97 = v96 <> v95 
                                let v98 = "\n    ]"
                                let v99 = v97 <> v98 
                                v99
                            }
                        }
                    let v101 = "{\n    \"posts\": "
                    let v102 = v101 <> v100 
                    let v103 = ",\n    \"program\": "
                    let v104 = v102 <> v103 
                    let v114 =
                        case v90  {
                            Uh3Nil -> {
                                let v105 = "[]"
                                v105
                            }
                            _ -> {
                                let v106 = ",\n        "
                                let v107 = Uh3Nil
                                let v108 = method426(v90, v107)
                                let v109 = delimited_21(v106, v108)
                                let v110 = "[\n        "
                                let v111 = v110 <> v109 
                                let v112 = "\n    ]"
                                let v113 = v111 <> v112 
                                v113
                            }
                        }
                    let v115 = v104 <> v114 
                    let v116 = "\n}\n"
                    let v117 = v115 <> v116 
                    let v118 = spiral_fs_write_file(v59, v117)
                    let v119 = spiral_fs_coerce(v118)
                    let v120 = "ok"
                    let v121 = atom.create(v120)
                    let v122 = v119 == v121
                    let v123 = v122 == False
                    case v123 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                    let v124 = file_cells_414(v76)
                    let v125 = 0
                    let v126 = method20(v124, v125)
                    let v127 = 1
                    let v128 = file_cells_414(v76)
                    let v129 = Uh8Nil
                    let v130 = thread_of_418(v127, v128, v129)
                    let v131 = 0
                    let v132 = method20(v130, v131)
                    let v133 = string.inspect(v126)
                    let v134 = " cells="
                    let v135 = v134 <> v133 
                    let v136 = " posts="
                    let v137 = v135 <> v136 
                    let v138 = string.inspect(v132)
                    let v139 = v137 <> v138 
                    let v140 = erlang_term_coerce(v58)
                    let v141 = "filename"
                    let v142 = atom.create(v141)
                    let v143 = "basename"
                    let v144 = atom.create(v143)
                    let v145 = []
                    let v146 = [v140, ..v145]
                    let v147 = erlang_term_apply(v142, v144, v146)
                    let v148 = atom.create(v19)
                    let v149 = atom.create(v21)
                    let v150 = []
                    let v151 = [v147, ..v150]
                    let v152 = erlang_term_apply(v148, v149, v151)
                    let v153 = erlang_term_coerce(v152)
                    let v154 = "xsim.frames "
                    let v155 = v154 <> v153 
                    let v156 = v155 <> v139 
                    v156
                }
            }
        let v162 = "\n"
        let v163 = v161 <> v162 
        let v164 = erlang_term_coerce(v163)
        let v165 = "io"
        let v166 = atom.create(v165)
        let v167 = "put_chars"
        let v168 = atom.create(v167)
        let v169 = []
        let v170 = [v164, ..v169]
        let _v171 = erlang_term_apply(v166, v168, v170)
        let v172 = v161 == ""
        let v175 =
            case v172 {
                True -> Uh3Nil
                False -> split_list_2(v162, v161)
            }
        let v176 = method399()
        let v177 = method400(v176, v175)
        case v177 {
            True -> 1
            False -> 0
        }
    }
}

pub fn closure134(capt: Nil) -> fn(String) -> Us88 {
    fn (v0) {
        Us88None
    }
}

pub fn closure133(capt: Nil) -> fn(#(String, String, String)) -> fn(String) -> Us88 {
    fn (dom) {
        let #(_v0, _v1, _v2) = dom
        closure134(Nil)
    }
}

pub fn closure137(capt: #(String, String, String, String)) -> fn(String) -> Us89 {
    fn (v4) {
        let #(v0, v1, v2, v3) = capt
        let v5 = v3 == "expected"
        let v14 =
            case v5 {
                True -> Us88Some(v0, v1, v4)
                False -> {
                    let v7 = v3 == "file"
                    case v7 {
                        True -> Us88Some(v4, v1, v2)
                        False -> {
                            let v9 = v3 == "program"
                            case v9 {
                                True -> Us88Some(v0, v4, v2)
                                False -> Us88None
                            }
                        }
                    }
                }
            }
        case v14  {
            Us88None -> {
                let v19 = "unknown option --"
                let v20 = v19 <> v3 
                Us89Error(v20)
            }
            Us88Some(v15, v16, v17) -> Us89Ok(v15, v16, v17)
        }
    }
}

pub fn closure136(capt: #(String, String, String)) -> fn(String) -> fn(String) -> Us89 {
    fn (v3) {
        let #(v0, v1, v2) = capt
        closure137(#(v0, v1, v2, v3))
    }
}

pub fn closure135(capt: Nil) -> fn(#(String, String, String)) -> fn(String) -> fn(String) -> Us89 {
    fn (dom) {
        let #(v0, v1, v2) = dom
        closure136(#(v0, v1, v2))
    }
}

pub fn valued_then_429(v0: fn(#(String, String, String)) -> fn(String) -> Us88, v1: fn(#(String, String, String)) -> fn(String) -> fn(String) -> Us89, v2: String, v3: String, v4: String, v5: String, v6: Uh3) -> Us89 {
    case v6  {
        Uh3Cons(v7, v8) -> {
            let v9 = v1(#(v2, v3, v4))
            let v10 = "--"
            let v11 = v5 |> string.starts_with(v10)
            let v18 =
                case v11 {
                    True -> {
                        let v12 = spiral_string_length(v5)
                        let v13 = spiral_wrap_signed(v12 - 2, 32)
                        let v14 = spiral_wrap_signed(2 + v13, 32)
                        let v15 = spiral_wrap_signed(v14 - 1, 32)
                        let v16 = spiral_string_slice(v5, 2, v15)
                        v16
                    }
                    False -> {
                        let v17 = ""
                        v17
                    }
                }
            let v19 = v9(v18)
            let v20 = v19(v7)
            continued_430(v0, v1, v20, v8)
        }
        Uh3Nil -> {
            let v22 = "--"
            let v23 = v5 |> string.starts_with(v22)
            let v30 =
                case v23 {
                    True -> {
                        let v24 = spiral_string_length(v5)
                        let v25 = spiral_wrap_signed(v24 - 2, 32)
                        let v26 = spiral_wrap_signed(2 + v25, 32)
                        let v27 = spiral_wrap_signed(v26 - 1, 32)
                        let v28 = spiral_string_slice(v5, 2, v27)
                        v28
                    }
                    False -> {
                        let v29 = ""
                        v29
                    }
                }
            let v31 = v22 <> v30 
            let v32 = " needs a value"
            let v33 = v31 <> v32 
            Us89Error(v33)
        }
    }
}

pub fn arg_parsed_428(v0: fn(#(String, String, String)) -> fn(String) -> Us88, v1: fn(#(String, String, String)) -> fn(String) -> fn(String) -> Us89, v2: String, v3: String, v4: String, v5: String, v6: Uh3) -> Us89 {
    let v7 = v0(#(v2, v3, v4))
    let v8 = "--"
    let v9 = v5 |> string.starts_with(v8)
    let v16 =
        case v9 {
            True -> {
                let v10 = spiral_string_length(v5)
                let v11 = spiral_wrap_signed(v10 - 2, 32)
                let v12 = spiral_wrap_signed(2 + v11, 32)
                let v13 = spiral_wrap_signed(v12 - 1, 32)
                let v14 = spiral_string_slice(v5, 2, v13)
                v14
            }
            False -> {
                let v15 = ""
                v15
            }
        }
    let v17 = v7(v16)
    case v17  {
        Us88None -> valued_then_429(v0, v1, v2, v3, v4, v5, v6)
        Us88Some(v18, v19, v20) -> flags_parsed_427(v0, v1, v18, v19, v20, v6)
    }
}

pub fn flags_parsed_427(v0: fn(#(String, String, String)) -> fn(String) -> Us88, v1: fn(#(String, String, String)) -> fn(String) -> fn(String) -> Us89, v2: String, v3: String, v4: String, v5: Uh3) -> Us89 {
    case v5  {
        Uh3Cons(v7, v8) -> {
            let v9 = "--"
            let v10 = v7 |> string.starts_with(v9)
            let v17 =
                case v10 {
                    True -> {
                        let v11 = spiral_string_length(v7)
                        let v12 = spiral_wrap_signed(v11 - 2, 32)
                        let v13 = spiral_wrap_signed(2 + v12, 32)
                        let v14 = spiral_wrap_signed(v13 - 1, 32)
                        let v15 = spiral_string_slice(v7, 2, v14)
                        v15
                    }
                    False -> {
                        let v16 = ""
                        v16
                    }
                }
            let v18 = v17 == ""
            case v18 {
                True -> {
                    let v19 = "unexpected argument '"
                    let v20 = v19 <> v7 
                    let v21 = "'"
                    let v22 = v20 <> v21 
                    Us89Error(v22)
                }
                False -> arg_parsed_428(v0, v1, v2, v3, v4, v7, v8)
            }
        }
        Uh3Nil -> Us89Ok(v2, v3, v4)
    }
}

pub fn continued_430(v0: fn(#(String, String, String)) -> fn(String) -> Us88, v1: fn(#(String, String, String)) -> fn(String) -> fn(String) -> Us89, v2: Us89, v3: Uh3) -> Us89 {
    case v2  {
        Us89Error(v8) -> Us89Error(v8)
        Us89Ok(v4, v5, v6) -> flags_parsed_427(v0, v1, v4, v5, v6, v3)
    }
}

pub fn method432(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method432(v3, v1)
            let v5 = "target"
            let v6 = erlang_term_coerce(v5)
            let v7 = ""
            let v8 = erlang_term_coerce(v7)
            let v9 = "maps"
            let v10 = atom.create(v9)
            let v11 = "get"
            let v12 = atom.create(v11)
            let v13 = []
            let v14 = [v8, ..v13]
            let v15 = [v2, ..v14]
            let v16 = [v6, ..v15]
            let v17 = erlang_term_apply(v10, v12, v16)
            let v18 = string.inspect(v17)
            let v19 = "="
            let v20 = v18 <> v19 
            let v21 = "status"
            let v22 = erlang_term_coerce(v21)
            let v23 = erlang_term_coerce(v7)
            let v24 = atom.create(v9)
            let v25 = atom.create(v11)
            let v26 = []
            let v27 = [v23, ..v26]
            let v28 = [v2, ..v27]
            let v29 = [v22, ..v28]
            let v30 = erlang_term_apply(v24, v25, v29)
            let v31 = string.inspect(v30)
            let v32 = v20 <> v31 
            Uh3Cons(v32, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method431(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method431(v3, v1)
            let v5 = "targets"
            let v6 = erlang_term_coerce(v5)
            let v7 = []
            let v8 = erlang_term_coerce(v7)
            let v9 = "maps"
            let v10 = atom.create(v9)
            let v11 = "get"
            let v12 = atom.create(v11)
            let v13 = []
            let v14 = [v8, ..v13]
            let v15 = [v2, ..v14]
            let v16 = [v6, ..v15]
            let v17 = erlang_term_apply(v10, v12, v16)
            let v18 = "erlang"
            let v19 = atom.create(v18)
            let v20 = "length"
            let v21 = atom.create(v20)
            let v22 = []
            let v23 = [v17, ..v22]
            let v24 = erlang_term_apply(v19, v21, v23)
            let v25 = erlang_term_coerce(v24)
            let v26 = 0
            let v27 = method396(v25, v17, v26)
            let v28 = Uh3Nil
            let v29 = method432(v27, v28)
            let v30 = ","
            let v31 = delimited_21(v30, v29)
            let v32 = "name"
            let v33 = erlang_term_coerce(v32)
            let v34 = ""
            let v35 = erlang_term_coerce(v34)
            let v36 = atom.create(v9)
            let v37 = atom.create(v11)
            let v38 = []
            let v39 = [v35, ..v38]
            let v40 = [v2, ..v39]
            let v41 = [v33, ..v40]
            let v42 = erlang_term_apply(v36, v37, v41)
            let v43 = string.inspect(v42)
            let v44 = " "
            let v45 = v43 <> v44 
            let v46 = "status"
            let v47 = erlang_term_coerce(v46)
            let v48 = erlang_term_coerce(v34)
            let v49 = atom.create(v9)
            let v50 = atom.create(v11)
            let v51 = []
            let v52 = [v48, ..v51]
            let v53 = [v2, ..v52]
            let v54 = [v47, ..v53]
            let v55 = erlang_term_apply(v49, v50, v54)
            let v56 = string.inspect(v55)
            let v57 = v45 <> v56 
            let v58 = " ["
            let v59 = v57 <> v58 
            let v60 = v59 <> v31 
            let v61 = "]"
            let v62 = v60 <> v61 
            Uh3Cons(v62, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn paired_rows_433(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            case v1  {
                Uh3Cons(v4, v5) -> {
                    let v6 = v2 == v4
                    case v6 {
                        True -> paired_rows_433(v3, v5)
                        False -> {
                            let v8 = "  file="
                            let v9 = v8 <> v2 
                            let v10 = "\n  thread="
                            let v11 = v9 <> v10 
                            let v12 = v11 <> v4 
                            let v13 = paired_rows_433(v3, v5)
                            Uh3Cons(v12, v13)
                        }
                    }
                }
                _ -> Uh3Nil
            }
        }
        _ -> Uh3Nil
    }
}
