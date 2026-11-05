import gleam/bit_array
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Us92, type Us93, Uh29Cons, Uh29Nil, Uh3Cons, Uh3Nil, Uh8Nil, Us56Error, Us56Ok, Us80Error, Us80Ok, Us91Error, Us91Ok, Us92None, Us92Some, Us93Error, Us93Ok}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, spiral_fs_coerce, spiral_fs_read_file, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part10.{method258, method259}
import xsim_frames/part13.{items_from_301}
import xsim_frames/part18.{method370, method371}
import xsim_frames/part2.{delimited_21, method20}
import xsim_frames/part20.{method396, method402, method403}
import xsim_frames/part23.{closure123, closure125, file_cells_417, flags_parsed_413, method428, method429, thread_of_421}

pub fn closure122(capt: Nil) -> fn(String) -> Int {
    fn (v0) {
        let v1 = "init"
        let v2 = atom.create(v1)
        let v3 = "get_plain_arguments"
        let v4 = atom.create(v3)
        let v5 = []
        let v6 = erlang_term_apply(v2, v4, v5)
        let v7 = "lists"
        let v8 = atom.create(v7)
        let v9 = "reverse"
        let v10 = atom.create(v9)
        let v11 = []
        let v12 = [v6, ..v11]
        let v13 = erlang_term_apply(v8, v10, v12)
        let v14 = Uh29Nil
        let v15 = items_from_301(v13, v14)
        let v16 = Uh3Nil
        let v17 = method396(v15, v16)
        let v22 =
            case v17  {
                Uh3Cons(v18, v19) -> v19
                Uh3Nil -> Uh3Nil
            }
        let v23 = closure123(Nil)
        let v24 = closure125(Nil)
        let v25 = ""
        let v26 = flags_parsed_413(v23, v24, v25, v25, v22)
        let v43 =
            case v26  {
                Us91Ok(v27, v28) -> {
                    let v29 = v27 == ""
                    let v34 =
                        case v29 {
                            True -> {
                                let v30 = "missing --file"
                                v30
                            }
                            False -> {
                                let v31 = v28 == ""
                                case v31 {
                                    True -> {
                                        let v32 = "missing --out"
                                        v32
                                    }
                                    False -> v25
                                }
                            }
                        }
                    let v35 = v34 != ""
                    case v35 {
                        True -> {
                            let v40 =
                                case v29 {
                                    True -> {
                                        let v36 = "missing --file"
                                        v36
                                    }
                                    False -> {
                                        let v37 = v28 == ""
                                        case v37 {
                                            True -> {
                                                let v38 = "missing --out"
                                                v38
                                            }
                                            False -> v25
                                        }
                                    }
                                }
                            Us91Error(v40)
                        }
                        False -> v26
                    }
                }
                _ -> v26
            }
        let v149 =
            case v43  {
                Us91Error(v145) -> {
                    let v146 = "XSIM rejected frames: "
                    let v147 = v146 <> v145 
                    v147
                }
                Us91Ok(v44, v45) -> {
                    let v46 = spiral_fs_read_file(v44)
                    let v47 = method370()
                    let v48 = method371()
                    let v49 = case v46 { Ok(x) -> v47(x) Error(x) -> v48(x) }
                    let v62 =
                        case v49  {
                            Us80Error(v59) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us80Ok(v50) -> {
                                let v51 = bit_array.to_string(v50)
                                let v52 = method258()
                                let v53 = method259()
                                let v54 = case v51 { Ok(x) -> v52(x) Error(x) -> v53(x) }
                                case v54  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v55) -> v55
                                }
                            }
                        }
                    let v63 = 1
                    let v64 = file_cells_417(v62)
                    let v65 = Uh8Nil
                    let v66 = thread_of_421(v63, v64, v65)
                    let v67 = file_cells_417(v62)
                    let v68 = Uh3Nil
                    let v69 = method428(v67, v68)
                    let v70 = "\n\n"
                    let v71 = delimited_21(v70, v69)
                    let v72 = v71 == ""
                    let v76 =
                        case v72 {
                            True -> Uh3Nil
                            False -> {
                                let v74 = "\n"
                                split_list_2(v74, v71)
                            }
                        }
                    let v86 =
                        case v66  {
                            Uh3Nil -> {
                                let v77 = "[]"
                                v77
                            }
                            _ -> {
                                let v78 = ",\n        "
                                let v79 = Uh3Nil
                                let v80 = method429(v66, v79)
                                let v81 = delimited_21(v78, v80)
                                let v82 = "[\n        "
                                let v83 = v82 <> v81 
                                let v84 = "\n    ]"
                                let v85 = v83 <> v84 
                                v85
                            }
                        }
                    let v87 = "{\n    \"posts\": "
                    let v88 = v87 <> v86 
                    let v89 = ",\n    \"program\": "
                    let v90 = v88 <> v89 
                    let v100 =
                        case v76  {
                            Uh3Nil -> {
                                let v91 = "[]"
                                v91
                            }
                            _ -> {
                                let v92 = ",\n        "
                                let v93 = Uh3Nil
                                let v94 = method429(v76, v93)
                                let v95 = delimited_21(v92, v94)
                                let v96 = "[\n        "
                                let v97 = v96 <> v95 
                                let v98 = "\n    ]"
                                let v99 = v97 <> v98 
                                v99
                            }
                        }
                    let v101 = v90 <> v100 
                    let v102 = "\n}\n"
                    let v103 = v101 <> v102 
                    let v104 = spiral_fs_write_file(v45, v103)
                    let v105 = spiral_fs_coerce(v104)
                    let v106 = "ok"
                    let v107 = atom.create(v106)
                    let v108 = v105 == v107
                    let v109 = v108 == False
                    case v109 {
                        True -> panic as "file_system.write_all_text: the write failed"
                        False -> Nil
                    }
                    let v110 = file_cells_417(v62)
                    let v111 = 0
                    let v112 = method20(v110, v111)
                    let v113 = 1
                    let v114 = file_cells_417(v62)
                    let v115 = Uh8Nil
                    let v116 = thread_of_421(v113, v114, v115)
                    let v117 = 0
                    let v118 = method20(v116, v117)
                    let v119 = int.to_string(v112)
                    let v120 = " cells="
                    let v121 = v120 <> v119 
                    let v122 = " posts="
                    let v123 = v121 <> v122 
                    let v124 = int.to_string(v118)
                    let v125 = v123 <> v124 
                    let v126 = erlang_term_coerce(v44)
                    let v127 = "filename"
                    let v128 = atom.create(v127)
                    let v129 = "basename"
                    let v130 = atom.create(v129)
                    let v131 = []
                    let v132 = [v126, ..v131]
                    let v133 = erlang_term_apply(v128, v130, v132)
                    let v134 = "unicode"
                    let v135 = atom.create(v134)
                    let v136 = "characters_to_binary"
                    let v137 = atom.create(v136)
                    let v138 = []
                    let v139 = [v133, ..v138]
                    let v140 = erlang_term_apply(v135, v137, v139)
                    let v141 = erlang_term_coerce(v140)
                    let v142 = "xsim.frames "
                    let v143 = v142 <> v141 
                    let v144 = v143 <> v125 
                    v144
                }
            }
        let v150 = "\n"
        let v151 = v149 <> v150 
        let v152 = erlang_term_coerce(v151)
        let v153 = "io"
        let v154 = atom.create(v153)
        let v155 = "put_chars"
        let v156 = atom.create(v155)
        let v157 = []
        let v158 = [v152, ..v157]
        let _v159 = erlang_term_apply(v154, v156, v158)
        let v160 = v149 == ""
        let v163 =
            case v160 {
                True -> Uh3Nil
                False -> split_list_2(v150, v149)
            }
        let v164 = method402()
        let v165 = method403(v164, v163)
        case v165 {
            True -> 1
            False -> 0
        }
    }
}

pub fn closure132(capt: Nil) -> fn(String) -> Us92 {
    fn (v0) {
        Us92None
    }
}

pub fn closure131(capt: Nil) -> fn(#(String, String, String)) -> fn(String) -> Us92 {
    fn (dom) {
        let #(_v0, _v1, _v2) = dom
        closure132(Nil)
    }
}

pub fn closure135(capt: #(String, String, String, String)) -> fn(String) -> Us93 {
    fn (v4) {
        let #(v0, v1, v2, v3) = capt
        let v5 = v3 == "expected"
        let v14 =
            case v5 {
                True -> Us92Some(v0, v1, v4)
                False -> {
                    let v7 = v3 == "file"
                    case v7 {
                        True -> Us92Some(v4, v1, v2)
                        False -> {
                            let v9 = v3 == "program"
                            case v9 {
                                True -> Us92Some(v0, v4, v2)
                                False -> Us92None
                            }
                        }
                    }
                }
            }
        case v14  {
            Us92None -> {
                let v19 = "unknown option --"
                let v20 = v19 <> v3 
                Us93Error(v20)
            }
            Us92Some(v15, v16, v17) -> Us93Ok(v15, v16, v17)
        }
    }
}

pub fn closure134(capt: #(String, String, String)) -> fn(String) -> fn(String) -> Us93 {
    fn (v3) {
        let #(v0, v1, v2) = capt
        closure135(#(v0, v1, v2, v3))
    }
}

pub fn closure133(capt: Nil) -> fn(#(String, String, String)) -> fn(String) -> fn(String) -> Us93 {
    fn (dom) {
        let #(v0, v1, v2) = dom
        closure134(#(v0, v1, v2))
    }
}

pub fn valued_then_432(v0: fn(#(String, String, String)) -> fn(String) -> Us92, v1: fn(#(String, String, String)) -> fn(String) -> fn(String) -> Us93, v2: String, v3: String, v4: String, v5: String, v6: Uh3) -> Us93 {
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
            continued_433(v0, v1, v20, v8)
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
            Us93Error(v33)
        }
    }
}

pub fn arg_parsed_431(v0: fn(#(String, String, String)) -> fn(String) -> Us92, v1: fn(#(String, String, String)) -> fn(String) -> fn(String) -> Us93, v2: String, v3: String, v4: String, v5: String, v6: Uh3) -> Us93 {
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
        Us92None -> valued_then_432(v0, v1, v2, v3, v4, v5, v6)
        Us92Some(v18, v19, v20) -> flags_parsed_430(v0, v1, v18, v19, v20, v6)
    }
}

pub fn flags_parsed_430(v0: fn(#(String, String, String)) -> fn(String) -> Us92, v1: fn(#(String, String, String)) -> fn(String) -> fn(String) -> Us93, v2: String, v3: String, v4: String, v5: Uh3) -> Us93 {
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
                    Us93Error(v22)
                }
                False -> arg_parsed_431(v0, v1, v2, v3, v4, v7, v8)
            }
        }
        Uh3Nil -> Us93Ok(v2, v3, v4)
    }
}

pub fn continued_433(v0: fn(#(String, String, String)) -> fn(String) -> Us92, v1: fn(#(String, String, String)) -> fn(String) -> fn(String) -> Us93, v2: Us93, v3: Uh3) -> Us93 {
    case v2  {
        Us93Error(v8) -> Us93Error(v8)
        Us93Ok(v4, v5, v6) -> flags_parsed_430(v0, v1, v4, v5, v6, v3)
    }
}

pub fn method435(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method435(v3, v1)
            let v5 = ""
            let v6 = erlang_term_coerce(v5)
            let v7 = "target"
            let v8 = erlang_term_coerce(v7)
            let v9 = erlang_term_coerce(v6)
            let v10 = "maps"
            let v11 = atom.create(v10)
            let v12 = "get"
            let v13 = atom.create(v12)
            let v14 = []
            let v15 = [v9, ..v14]
            let v16 = [v2, ..v15]
            let v17 = [v8, ..v16]
            let v18 = erlang_term_apply(v11, v13, v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = string.inspect(v19)
            let v21 = "="
            let v22 = v20 <> v21 
            let v23 = erlang_term_coerce(v5)
            let v24 = "status"
            let v25 = erlang_term_coerce(v24)
            let v26 = erlang_term_coerce(v23)
            let v27 = atom.create(v10)
            let v28 = atom.create(v12)
            let v29 = []
            let v30 = [v26, ..v29]
            let v31 = [v2, ..v30]
            let v32 = [v25, ..v31]
            let v33 = erlang_term_apply(v27, v28, v32)
            let v34 = erlang_term_coerce(v33)
            let v35 = string.inspect(v34)
            let v36 = v22 <> v35 
            Uh3Cons(v36, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method434(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method434(v3, v1)
            let v5 = []
            let v6 = erlang_term_coerce(v5)
            let v7 = "targets"
            let v8 = erlang_term_coerce(v7)
            let v9 = erlang_term_coerce(v6)
            let v10 = "maps"
            let v11 = atom.create(v10)
            let v12 = "get"
            let v13 = atom.create(v12)
            let v14 = []
            let v15 = [v9, ..v14]
            let v16 = [v2, ..v15]
            let v17 = [v8, ..v16]
            let v18 = erlang_term_apply(v11, v13, v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = "lists"
            let v21 = atom.create(v20)
            let v22 = "reverse"
            let v23 = atom.create(v22)
            let v24 = []
            let v25 = [v19, ..v24]
            let v26 = erlang_term_apply(v21, v23, v25)
            let v27 = Uh29Nil
            let v28 = items_from_301(v26, v27)
            let v29 = Uh3Nil
            let v30 = method435(v28, v29)
            let v31 = ","
            let v32 = delimited_21(v31, v30)
            let v33 = ""
            let v34 = erlang_term_coerce(v33)
            let v35 = "name"
            let v36 = erlang_term_coerce(v35)
            let v37 = erlang_term_coerce(v34)
            let v38 = atom.create(v10)
            let v39 = atom.create(v12)
            let v40 = []
            let v41 = [v37, ..v40]
            let v42 = [v2, ..v41]
            let v43 = [v36, ..v42]
            let v44 = erlang_term_apply(v38, v39, v43)
            let v45 = erlang_term_coerce(v44)
            let v46 = string.inspect(v45)
            let v47 = " "
            let v48 = v46 <> v47 
            let v49 = erlang_term_coerce(v33)
            let v50 = "status"
            let v51 = erlang_term_coerce(v50)
            let v52 = erlang_term_coerce(v49)
            let v53 = atom.create(v10)
            let v54 = atom.create(v12)
            let v55 = []
            let v56 = [v52, ..v55]
            let v57 = [v2, ..v56]
            let v58 = [v51, ..v57]
            let v59 = erlang_term_apply(v53, v54, v58)
            let v60 = erlang_term_coerce(v59)
            let v61 = string.inspect(v60)
            let v62 = v48 <> v61 
            let v63 = " ["
            let v64 = v62 <> v63 
            let v65 = v64 <> v32 
            let v66 = "]"
            let v67 = v65 <> v66 
            Uh3Cons(v67, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn paired_rows_436(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            case v1  {
                Uh3Cons(v4, v5) -> {
                    let v6 = v2 == v4
                    case v6 {
                        True -> paired_rows_436(v3, v5)
                        False -> {
                            let v8 = "  file="
                            let v9 = v8 <> v2 
                            let v10 = "\n  thread="
                            let v11 = v9 <> v10 
                            let v12 = v11 <> v4 
                            let v13 = paired_rows_436(v3, v5)
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
