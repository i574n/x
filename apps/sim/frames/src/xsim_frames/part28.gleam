import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Uh38, Uh29Cons, Uh29Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us3None, Us3Some, Us56Error, Us56Ok, Us80Error, Us80Ok, Us96Error, Us96Ok, Us97None, Us97Some}
import xsim_frames/part1.{closure1, count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_fs_read_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part10.{method258, method259}
import xsim_frames/part13.{items_from_301, method300}
import xsim_frames/part18.{method370, method371}
import xsim_frames/part27.{included_users_450, method455, method456}
import xsim_frames/part3.{method56, method57}

pub fn method457(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method457(v3, v1)
            let v5 = ""
            let v6 = erlang_term_coerce(v5)
            let v7 = "created_at"
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
            let v20 = erlang_term_coerce(v19)
            let v21 = spiral_string_slice(v20, 0, 18)
            Uh3Cons(v21, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method458(v0: Uh3, v1: String) -> String {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = erlang_term_coerce(v1)
            let v5 = erlang_term_coerce(v2)
            let v6 = "erlang"
            let v7 = atom.create(v6)
            let v8 = ">="
            let v9 = atom.create(v8)
            let v10 = []
            let v11 = [v5, ..v10]
            let v12 = [v4, ..v11]
            let v13 = erlang_term_apply(v7, v9, v12)
            let v14 = erlang_term_coerce(v13)
            let v15 =
                case v14 {
                    True -> v1
                    False -> v2
                }
            method458(v3, v15)
        }
        Uh3Nil -> v1
    }
}

pub fn method460(v0: Dynamic, v1: Uh29, v2: dict.Dict(String, Dynamic)) -> dict.Dict(String, Dynamic) {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = ""
            let v6 = erlang_term_coerce(v5)
            let v7 = "id"
            let v8 = erlang_term_coerce(v7)
            let v9 = erlang_term_coerce(v6)
            let v10 = "maps"
            let v11 = atom.create(v10)
            let v12 = "get"
            let v13 = atom.create(v12)
            let v14 = []
            let v15 = [v9, ..v14]
            let v16 = [v3, ..v15]
            let v17 = [v8, ..v16]
            let v18 = erlang_term_apply(v11, v13, v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = "erlang"
            let v21 = atom.create(v20)
            let v22 = "is_binary"
            let v23 = atom.create(v22)
            let v24 = []
            let v25 = [v19, ..v24]
            let v26 = erlang_term_apply(v21, v23, v25)
            let v27 = erlang_term_coerce(v26)
            let v36 =
                case v27 {
                    True -> {
                        let v28 = erlang_term_coerce(v19)
                        v28
                    }
                    False -> {
                        let v29 = atom.create(v20)
                        let v30 = "integer_to_binary"
                        let v31 = atom.create(v30)
                        let v32 = []
                        let v33 = [v19, ..v32]
                        let v34 = erlang_term_apply(v29, v31, v33)
                        let v35 = erlang_term_coerce(v34)
                        v35
                    }
                }
            let v37 = erlang_term_coerce(v5)
            let v38 = erlang_term_coerce(v7)
            let v39 = erlang_term_coerce(v37)
            let v40 = atom.create(v10)
            let v41 = atom.create(v12)
            let v42 = []
            let v43 = [v39, ..v42]
            let v44 = [v0, ..v43]
            let v45 = [v38, ..v44]
            let v46 = erlang_term_apply(v40, v41, v45)
            let v47 = erlang_term_coerce(v46)
            let v48 = "author_id"
            let v49 = erlang_term_coerce(v48)
            let v50 = erlang_term_coerce(v47)
            let v51 = atom.create(v10)
            let v52 = "put"
            let v53 = atom.create(v52)
            let v54 = []
            let v55 = [v3, ..v54]
            let v56 = [v50, ..v55]
            let v57 = [v49, ..v56]
            let v58 = erlang_term_apply(v51, v53, v57)
            let v59 = dict.insert(v2, v36, v58)
            method460(v0, v4, v59)
        }
        Uh29Nil -> v2
    }
}

pub fn with_posts_459(v0: Dynamic, v1: dict.Dict(String, Dynamic)) -> dict.Dict(String, Dynamic) {
    let v2 = []
    let v3 = erlang_term_coerce(v2)
    let v4 = "posts"
    let v5 = erlang_term_coerce(v4)
    let v6 = erlang_term_coerce(v3)
    let v7 = "maps"
    let v8 = atom.create(v7)
    let v9 = "get"
    let v10 = atom.create(v9)
    let v11 = []
    let v12 = [v6, ..v11]
    let v13 = [v0, ..v12]
    let v14 = [v5, ..v13]
    let v15 = erlang_term_apply(v8, v10, v14)
    let v16 = erlang_term_coerce(v15)
    let v17 = "lists"
    let v18 = atom.create(v17)
    let v19 = "reverse"
    let v20 = atom.create(v19)
    let v21 = []
    let v22 = [v16, ..v21]
    let v23 = erlang_term_apply(v18, v20, v22)
    let v24 = Uh29Nil
    let v25 = items_from_301(v23, v24)
    method460(v0, v25, v1)
}

pub fn method454(v0: Uh29, v1: String, v2: String, v3: dict.Dict(String, Dynamic), v4: dict.Dict(String, Dynamic), v5: Int, v6: dict.Dict(String, Dynamic), v7: String, v8: Dynamic, v9: Uh3, v10: Dynamic, v11: dict.Dict(String, Nil), v12: Int) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let #(v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182, v183) =
        case v0  {
            Uh29Cons(v13, v14) -> {
                let v15 = ""
                let v16 = erlang_term_coerce(v15)
                let v17 = "username"
                let v18 = erlang_term_coerce(v17)
                let v19 = erlang_term_coerce(v16)
                let v20 = "maps"
                let v21 = atom.create(v20)
                let v22 = "get"
                let v23 = atom.create(v22)
                let v24 = []
                let v25 = [v19, ..v24]
                let v26 = [v13, ..v25]
                let v27 = [v18, ..v26]
                let v28 = erlang_term_apply(v21, v23, v27)
                let v29 = erlang_term_coerce(v28)
                let v30 = erlang_term_coerce(v29)
                let v31 = v30 |> string.lowercase
                let v32 = dict.get(v3, v31)
                let v33 = method455()
                let v34 = method456()
                let v35 = case v32 { Ok(x) -> v33(x) Error(x) -> v34(x) }
                let v40 =
                    case v35  {
                        Us96Error -> Us97None
                        Us96Ok(v36) -> Us97Some(v36)
                    }
                let v101 =
                    case v40  {
                        Us97None -> True
                        Us97Some(v41) -> {
                            let v42 = []
                            let v43 = erlang_term_coerce(v42)
                            let v44 = "posts"
                            let v45 = erlang_term_coerce(v44)
                            let v46 = erlang_term_coerce(v43)
                            let v47 = atom.create(v20)
                            let v48 = atom.create(v22)
                            let v49 = []
                            let v50 = [v46, ..v49]
                            let v51 = [v13, ..v50]
                            let v52 = [v45, ..v51]
                            let v53 = erlang_term_apply(v47, v48, v52)
                            let v54 = erlang_term_coerce(v53)
                            let v55 = "lists"
                            let v56 = atom.create(v55)
                            let v57 = "reverse"
                            let v58 = atom.create(v57)
                            let v59 = []
                            let v60 = [v54, ..v59]
                            let v61 = erlang_term_apply(v56, v58, v60)
                            let v62 = Uh29Nil
                            let v63 = items_from_301(v61, v62)
                            let v64 = Uh3Nil
                            let v65 = method457(v63, v64)
                            let v66 = method458(v65, v15)
                            let v67 = []
                            let v68 = erlang_term_coerce(v67)
                            let v69 = erlang_term_coerce(v44)
                            let v70 = erlang_term_coerce(v68)
                            let v71 = atom.create(v20)
                            let v72 = atom.create(v22)
                            let v73 = []
                            let v74 = [v70, ..v73]
                            let v75 = [v41, ..v74]
                            let v76 = [v69, ..v75]
                            let v77 = erlang_term_apply(v71, v72, v76)
                            let v78 = erlang_term_coerce(v77)
                            let v79 = atom.create(v55)
                            let v80 = atom.create(v57)
                            let v81 = []
                            let v82 = [v78, ..v81]
                            let v83 = erlang_term_apply(v79, v80, v82)
                            let v84 = Uh29Nil
                            let v85 = items_from_301(v83, v84)
                            let v86 = Uh3Nil
                            let v87 = method457(v85, v86)
                            let v88 = method458(v87, v15)
                            let v89 = erlang_term_coerce(v66)
                            let v90 = erlang_term_coerce(v88)
                            let v91 = "erlang"
                            let v92 = atom.create(v91)
                            let v93 = ">="
                            let v94 = atom.create(v93)
                            let v95 = []
                            let v96 = [v90, ..v95]
                            let v97 = [v89, ..v96]
                            let v98 = erlang_term_apply(v92, v94, v97)
                            let v99 = erlang_term_coerce(v98)
                            v99
                        }
                    }
                let v116 =
                    case v101 {
                        True -> {
                            let v102 = erlang_term_coerce(v15)
                            let v103 = erlang_term_coerce(v17)
                            let v104 = erlang_term_coerce(v102)
                            let v105 = atom.create(v20)
                            let v106 = atom.create(v22)
                            let v107 = []
                            let v108 = [v104, ..v107]
                            let v109 = [v13, ..v108]
                            let v110 = [v103, ..v109]
                            let v111 = erlang_term_apply(v105, v106, v110)
                            let v112 = erlang_term_coerce(v111)
                            let v113 = erlang_term_coerce(v112)
                            let v114 = v113 |> string.lowercase
                            let v115 = dict.insert(v3, v114, v13)
                            v115
                        }
                        False -> v3
                    }
                let v117 = erlang_term_coerce(v15)
                let v118 = "id"
                let v119 = erlang_term_coerce(v118)
                let v120 = erlang_term_coerce(v117)
                let v121 = atom.create(v20)
                let v122 = atom.create(v22)
                let v123 = []
                let v124 = [v120, ..v123]
                let v125 = [v13, ..v124]
                let v126 = [v119, ..v125]
                let v127 = erlang_term_apply(v121, v122, v126)
                let v128 = erlang_term_coerce(v127)
                let v129 = "erlang"
                let v130 = atom.create(v129)
                let v131 = "is_binary"
                let v132 = atom.create(v131)
                let v133 = []
                let v134 = [v128, ..v133]
                let v135 = erlang_term_apply(v130, v132, v134)
                let v136 = erlang_term_coerce(v135)
                let v145 =
                    case v136 {
                        True -> {
                            let v137 = erlang_term_coerce(v128)
                            v137
                        }
                        False -> {
                            let v138 = atom.create(v129)
                            let v139 = "integer_to_binary"
                            let v140 = atom.create(v139)
                            let v141 = []
                            let v142 = [v128, ..v141]
                            let v143 = erlang_term_apply(v138, v140, v142)
                            let v144 = erlang_term_coerce(v143)
                            v144
                        }
                    }
                let v146 = dict.insert(v4, v145, v13)
                let v147 = with_posts_459(v13, v6)
                method454(v14, v1, v2, v116, v146, v5, v147, v7, v8, v9, v10, v11, v12)
            }
            _ -> {
                let #(v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171) =
                    case v0  {
                        Uh29Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171)
            }
        }
    #(v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182, v183)
}

pub fn world_of_449(v0: String) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v1 = spiral_fs_read_file(v0)
    let v2 = method370()
    let v3 = method371()
    let v4 = case v1 { Ok(x) -> v2(x) Error(x) -> v3(x) }
    let v17 =
        case v4  {
            Us80Error(v14) -> panic as "file_system.read_all_text: file:read_file failed"
            Us80Ok(v5) -> {
                let v6 = bit_array.to_string(v5)
                let v7 = method258()
                let v8 = method259()
                let v9 = case v6 { Ok(x) -> v7(x) Error(x) -> v8(x) }
                case v9  {
                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                    Us56Ok(v10) -> v10
                }
            }
        }
    let v18 = erlang_term_coerce(v17)
    let v19 = "json"
    let v20 = atom.create(v19)
    let v21 = "decode"
    let v22 = atom.create(v21)
    let v23 = []
    let v24 = [v18, ..v23]
    let v25 = erlang_term_apply(v20, v22, v24)
    let v26 = included_users_450(v0, v25)
    let v27 = ""
    let v28 = erlang_term_coerce(v27)
    let v29 = "token"
    let v30 = erlang_term_coerce(v29)
    let v31 = erlang_term_coerce(v28)
    let v32 = "maps"
    let v33 = atom.create(v32)
    let v34 = "get"
    let v35 = atom.create(v34)
    let v36 = []
    let v37 = [v31, ..v36]
    let v38 = [v25, ..v37]
    let v39 = [v30, ..v38]
    let v40 = erlang_term_apply(v33, v35, v39)
    let v41 = erlang_term_coerce(v40)
    let v42 = erlang_term_coerce(v41)
    let v43 = erlang_term_coerce(v27)
    let v44 = "user_token"
    let v45 = erlang_term_coerce(v44)
    let v46 = erlang_term_coerce(v43)
    let v47 = atom.create(v32)
    let v48 = atom.create(v34)
    let v49 = []
    let v50 = [v46, ..v49]
    let v51 = [v25, ..v50]
    let v52 = [v45, ..v51]
    let v53 = erlang_term_apply(v47, v48, v52)
    let v54 = erlang_term_coerce(v53)
    let v55 = erlang_term_coerce(v54)
    let v56 = erlang_term_coerce(v27)
    let v57 = "now"
    let v58 = erlang_term_coerce(v57)
    let v59 = erlang_term_coerce(v56)
    let v60 = atom.create(v32)
    let v61 = atom.create(v34)
    let v62 = []
    let v63 = [v59, ..v62]
    let v64 = [v25, ..v63]
    let v65 = [v58, ..v64]
    let v66 = erlang_term_apply(v60, v61, v65)
    let v67 = erlang_term_coerce(v66)
    let v68 = erlang_term_coerce(v67)
    let v69 = dict.new()
    let v70 = dict.new()
    let v71 = dict.new()
    let _v72 = erlang_term_coerce(v27)
    let _v73 = erlang_term_coerce(v27)
    let v74 = dict.new()
    let v75 = erlang_term_coerce(v27)
    let v76 = "me"
    let v77 = erlang_term_coerce(v76)
    let v78 = erlang_term_coerce(v75)
    let v79 = atom.create(v32)
    let v80 = atom.create(v34)
    let v81 = []
    let v82 = [v78, ..v81]
    let v83 = [v25, ..v82]
    let v84 = [v77, ..v83]
    let v85 = erlang_term_apply(v79, v80, v84)
    let v86 = erlang_term_coerce(v85)
    let v87 = erlang_term_coerce(v27)
    let v88 = "oauth2"
    let v89 = erlang_term_coerce(v88)
    let v90 = erlang_term_coerce(v87)
    let v91 = atom.create(v32)
    let v92 = atom.create(v34)
    let v93 = []
    let v94 = [v90, ..v93]
    let v95 = [v25, ..v94]
    let v96 = [v89, ..v95]
    let v97 = erlang_term_apply(v91, v92, v96)
    let v98 = erlang_term_coerce(v97)
    let v99 = erlang_term_coerce(v27)
    let v100 = "refresh_token"
    let v101 = erlang_term_coerce(v100)
    let v102 = erlang_term_coerce(v99)
    let v103 = atom.create(v32)
    let v104 = atom.create(v34)
    let v105 = []
    let v106 = [v102, ..v105]
    let v107 = [v98, ..v106]
    let v108 = [v101, ..v107]
    let v109 = erlang_term_apply(v103, v104, v108)
    let v110 = erlang_term_coerce(v109)
    let v111 = erlang_term_coerce(v110)
    let v112 = "following_page_size"
    let v113 = erlang_term_coerce(v112)
    let v114 = erlang_term_coerce(100)
    let v115 = atom.create(v32)
    let v116 = atom.create(v34)
    let v117 = []
    let v118 = [v114, ..v117]
    let v119 = [v25, ..v118]
    let v120 = [v113, ..v119]
    let v121 = erlang_term_apply(v115, v116, v120)
    let v122 = erlang_term_coerce(v121)
    let v123 = Uh3Nil
    let v124 = Uh3Cons(v111, v123)
    let v125 = 9001
    let #(v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137) = method454(v26, v42, v55, v69, v70, v122, v71, v68, v25, v124, v86, v74, v125)
    #(v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137)
}

pub fn method465(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method465(v0, v4, v2)
            let v6 = v3 |> string.lowercase
            let v7 = v6 |> string.starts_with(v0)
            case v7 {
                True -> Uh3Cons(v3, v5)
                False -> v5
            }
        }
        Uh3Nil -> v2
    }
}

pub fn header_value_464(v0: String, v1: String) -> String {
    let v2 = ":"
    let v3 = v0 <> v2 
    let v4 = v1 == ""
    let v8 =
        case v4 {
            True -> Uh3Nil
            False -> {
                let v6 = "\r\n"
                split_list_2(v6, v1)
            }
        }
    let v9 = Uh3Nil
    let v10 = method465(v3, v8, v9)
    case v10  {
        Uh3Cons(v11, v12) -> {
            let v13 = spiral_string_length(v3)
            let v14 = spiral_string_length(v11)
            let v15 = spiral_wrap_signed(v14 - v13, 32)
            let v16 = spiral_wrap_signed(v13 + v15, 32)
            let v17 = spiral_wrap_signed(v16 - 1, 32)
            let v18 = spiral_string_slice(v11, v13, v17)
            let v19 = spiral_string_length(v18)
            let v20 = 0
            let v21 = method56(v18, v19, v20)
            let v22 = spiral_wrap_signed(v19 - 1, 32)
            let v23 = spiral_string_slice(v18, v21, v22)
            let v24 = spiral_string_length(v23)
            let v25 = method57(v23, v24)
            let v26 = spiral_string_slice(v23, 0, v25)
            v26
        }
        Uh3Nil -> {
            let v27 = ""
            v27
        }
    }
}

pub fn received_463(v0: Dynamic, v1: String) -> String {
    let v2 = "\r\n\r\n"
    let v3 = option.from_result(result.map(string.split_once(v1, v2), pair.first))
    let v4 = closure1(Nil)
    let v5 = v3 |> option.map(v4)
    let v6 = Us2None
    let v7 = v5 |> option.unwrap(v6)
    let v11 =
        case v7  {
            Us2None -> -1
            Us2Some(v8) -> {
                let v9 = bit_array.byte_size(bit_array.from_string(v8))
                v9
            }
        }
    let v12 = v11 >= 0
    let v33 =
        case v12 {
            True -> {
                let v13 = erlang_term_coerce(v1)
                let v14 = "erlang"
                let v15 = atom.create(v14)
                let v16 = "byte_size"
                let v17 = atom.create(v16)
                let v18 = []
                let v19 = [v13, ..v18]
                let v20 = erlang_term_apply(v15, v17, v19)
                let v21 = erlang_term_coerce(v20)
                let v22 = spiral_wrap_signed(v11 + 4, 32)
                let v23 = spiral_wrap_signed(v11 - 1, 32)
                let v24 = spiral_string_slice(v1, 0, v23)
                let v25 = "content-length"
                let v26 = header_value_464(v25, v24)
                let v27 = count_of_text_10(v26)
                let v30 =
                    case v27  {
                        Us3None -> 0
                        Us3Some(v28) -> v28
                    }
                let v31 = spiral_wrap_signed(v22 + v30, 32)
                let v32 = v21 >= v31
                v32
            }
            False -> False
        }
    let v48 =
        case v33 {
            True -> {
                let v34 = "done"
                let v35 = atom.create(v34)
                let v36 = erlang_term_coerce(v35)
                v36
            }
            False -> {
                let v37 = erlang_term_coerce(0)
                let v38 = erlang_term_coerce(10000)
                let v39 = "gen_tcp"
                let v40 = atom.create(v39)
                let v41 = "recv"
                let v42 = atom.create(v41)
                let v43 = []
                let v44 = [v38, ..v43]
                let v45 = [v37, ..v44]
                let v46 = [v0, ..v45]
                let v47 = erlang_term_apply(v40, v42, v46)
                v47
            }
        }
    let v49 = "erlang"
    let v50 = atom.create(v49)
    let v51 = "is_tuple"
    let v52 = atom.create(v51)
    let v53 = []
    let v54 = [v48, ..v53]
    let v55 = erlang_term_apply(v50, v52, v54)
    let v56 = erlang_term_coerce(v55)
    let v69 =
        case v56 {
            True -> {
                let v57 = erlang_term_coerce(1)
                let v58 = atom.create(v49)
                let v59 = "element"
                let v60 = atom.create(v59)
                let v61 = []
                let v62 = [v48, ..v61]
                let v63 = [v57, ..v62]
                let v64 = erlang_term_apply(v58, v60, v63)
                let v65 = "ok"
                let v66 = atom.create(v65)
                let v67 = erlang_term_coerce(v66)
                let v68 = v64 == v67
                v68
            }
            False -> False
        }
    case v69 {
        True -> {
            let v70 = erlang_term_coerce(2)
            let v71 = atom.create(v49)
            let v72 = "element"
            let v73 = atom.create(v72)
            let v74 = []
            let v75 = [v48, ..v74]
            let v76 = [v70, ..v75]
            let v77 = erlang_term_apply(v71, v73, v76)
            let v78 = erlang_term_coerce(v77)
            let v79 = v1 <> v78 
            received_463(v0, v79)
        }
        False -> v1
    }
}

pub fn request_of_467(v0: String) -> #(String, String, String, String, String) {
    let v1 = "\r\n\r\n"
    let v2 = option.from_result(result.map(string.split_once(v0, v1), pair.first))
    let v3 = closure1(Nil)
    let v4 = v2 |> option.map(v3)
    let v5 = Us2None
    let v6 = v4 |> option.unwrap(v5)
    let v10 =
        case v6  {
            Us2None -> -1
            Us2Some(v7) -> {
                let v8 = bit_array.byte_size(bit_array.from_string(v7))
                v8
            }
        }
    let v11 = spiral_wrap_signed(v10 - 1, 32)
    let v12 = spiral_string_slice(v0, 0, v11)
    let v13 = "\r\n"
    let v14 = option.from_result(result.map(string.split_once(v12, v13), pair.first))
    let v15 = v14 |> option.map(v3)
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
    let v22 = spiral_wrap_signed(v21 - 1, 32)
    let v23 = spiral_string_slice(v12, 0, v22)
    let v24 = v23 == ""
    let v28 =
        case v24 {
            True -> Uh3Nil
            False -> {
                let v26 = " "
                split_list_2(v26, v23)
            }
        }
    let v36 =
        case v28  {
            Uh3Cons(v29, v30) -> {
                case v30  {
                    Uh3Cons(v31, v32) -> v31
                    _ -> {
                        let v33 = "/"
                        v33
                    }
                }
            }
            _ -> {
                let v35 = "/"
                v35
            }
        }
    let v37 = "#"
    let v38 = option.from_result(result.map(string.split_once(v36, v37), pair.first))
    let v39 = v38 |> option.map(v3)
    let v40 = Us2None
    let v41 = v39 |> option.unwrap(v40)
    let v45 =
        case v41  {
            Us2None -> -1
            Us2Some(v42) -> {
                let v43 = bit_array.byte_size(bit_array.from_string(v42))
                v43
            }
        }
    let v46 = spiral_wrap_signed(v45 + 1, 32)
    let v47 = v45 < 0
    let #(v56, _v57) =
        case v47 {
            True -> {
                let v48 = ""
                #(v36, v48)
            }
            False -> {
                let v49 = spiral_wrap_signed(v45 - 1, 32)
                let v50 = spiral_string_slice(v36, 0, v49)
                let v51 = spiral_string_length(v36)
                let v52 = spiral_wrap_signed(v51 - v46, 32)
                let v53 = spiral_wrap_signed(v46 + v52, 32)
                let v54 = spiral_wrap_signed(v53 - 1, 32)
                let v55 = spiral_string_slice(v36, v46, v54)
                #(v50, v55)
            }
        }
    let v58 = "?"
    let v59 = option.from_result(result.map(string.split_once(v56, v58), pair.first))
    let v60 = v59 |> option.map(v3)
    let v61 = Us2None
    let v62 = v60 |> option.unwrap(v61)
    let v66 =
        case v62  {
            Us2None -> -1
            Us2Some(v63) -> {
                let v64 = bit_array.byte_size(bit_array.from_string(v63))
                v64
            }
        }
    let v67 = spiral_wrap_signed(v66 + 1, 32)
    let v68 = v66 < 0
    let #(v77, v78) =
        case v68 {
            True -> {
                let v69 = ""
                #(v56, v69)
            }
            False -> {
                let v70 = spiral_wrap_signed(v66 - 1, 32)
                let v71 = spiral_string_slice(v56, 0, v70)
                let v72 = spiral_string_length(v56)
                let v73 = spiral_wrap_signed(v72 - v67, 32)
                let v74 = spiral_wrap_signed(v67 + v73, 32)
                let v75 = spiral_wrap_signed(v74 - 1, 32)
                let v76 = spiral_string_slice(v56, v67, v75)
                #(v71, v76)
            }
        }
    let v79 = v12 == ""
    let v83 =
        case v79 {
            True -> Uh3Nil
            False -> {
                let v81 = " "
                split_list_2(v81, v12)
            }
        }
    let v88 =
        case v83  {
            Uh3Cons(v84, v85) -> v84
            Uh3Nil -> {
                let v86 = ""
                v86
            }
        }
    #(v88, v77, v78, v12, v0)
}

pub fn method472(v0: Uh38, v1: Uh38) -> Uh38 {
    case v0  {
        Uh38Cons(v2, v3, v4) -> {
            let v5 = method472(v4, v1)
            Uh38Cons(v2, v3, v5)
        }
        Uh38Nil -> v1
    }
}

pub fn method473(v0: Uh38, v1: Uh29) -> Uh29 {
    case v0  {
        Uh38Cons(v2, v3, v4) -> {
            let v5 = method473(v4, v1)
            let v6 = atom.create(v2)
            let v7 = erlang_term_coerce(v6)
            let v8 = []
            let v9 = [v3, ..v8]
            let v10 = [v7, ..v9]
            let v11 = erlang_term_tuple(v10)
            Uh29Cons(v11, v5)
        }
        Uh38Nil -> v1
    }
}

pub fn log_row_471(v0: String, v1: String, v2: String, _v3: String, v4: String, v5: String) -> Dynamic {
    let v6 = v0 == "POST"
    let v7 = "\r\n\r\n"
    let v8 = option.from_result(result.map(string.split_once(v4, v7), pair.first))
    let v9 = closure1(Nil)
    let v10 = v8 |> option.map(v9)
    let v11 = Us2None
    let v12 = v10 |> option.unwrap(v11)
    let v16 =
        case v12  {
            Us2None -> -1
            Us2Some(v13) -> {
                let v14 = bit_array.byte_size(bit_array.from_string(v13))
                v14
            }
        }
    let v17 = spiral_wrap_signed(v16 + 4, 32)
    let v18 = spiral_string_length(v4)
    let v19 = spiral_wrap_signed(v18 - v17, 32)
    let v20 = spiral_wrap_signed(v17 + v19, 32)
    let v21 = spiral_wrap_signed(v20 - 1, 32)
    let v22 = spiral_string_slice(v4, v17, v21)
    let v23 = erlang_term_coerce(v22)
    let v28 =
        case v6 {
            True -> {
                let v24 = "body"
                let v25 = Uh38Nil
                Uh38Cons(v24, v23, v25)
            }
            False -> Uh38Nil
        }
    let v29 = v5 != ""
    let v30 = erlang_term_coerce(v29)
    let v31 = v5 == ""
    let v36 =
        case v31 {
            True -> {
                let v32 = "null"
                let v33 = atom.create(v32)
                let v34 = erlang_term_coerce(v33)
                v34
            }
            False -> {
                let v35 = erlang_term_coerce(v5)
                v35
            }
        }
    let v37 = erlang_term_coerce(v0)
    let v38 = erlang_term_coerce(v1)
    let v39 = erlang_term_coerce(v2)
    let v40 = Uh38Nil
    let v41 = method472(v28, v40)
    let v42 = Uh29Nil
    let v43 = method473(v41, v42)
    let v44 = "context"
    let v45 = atom.create(v44)
    let v46 = erlang_term_coerce(v45)
    let v47 = []
    let v48 = [v36, ..v47]
    let v49 = [v46, ..v48]
    let v50 = erlang_term_tuple(v49)
    let v51 = "authorized"
    let v52 = atom.create(v51)
    let v53 = erlang_term_coerce(v52)
    let v54 = []
    let v55 = [v30, ..v54]
    let v56 = [v53, ..v55]
    let v57 = erlang_term_tuple(v56)
    let v58 = "query"
    let v59 = atom.create(v58)
    let v60 = erlang_term_coerce(v59)
    let v61 = []
    let v62 = [v39, ..v61]
    let v63 = [v60, ..v62]
    let v64 = erlang_term_tuple(v63)
    let v65 = "path"
    let v66 = atom.create(v65)
    let v67 = erlang_term_coerce(v66)
    let v68 = []
    let v69 = [v38, ..v68]
    let v70 = [v67, ..v69]
    let v71 = erlang_term_tuple(v70)
    let v72 = "method"
    let v73 = atom.create(v72)
    let v74 = erlang_term_coerce(v73)
    let v75 = []
    let v76 = [v37, ..v75]
    let v77 = [v74, ..v76]
    let v78 = erlang_term_tuple(v77)
    let v79 = []
    let v80 = method300(v43, v79)
    let v81 = [v50, ..v80]
    let v82 = [v57, ..v81]
    let v83 = [v64, ..v82]
    let v84 = [v71, ..v83]
    let v85 = [v78, ..v84]
    let v86 = erlang_term_coerce(v85)
    let v87 = "maps"
    let v88 = atom.create(v87)
    let v89 = "from_list"
    let v90 = atom.create(v89)
    let v91 = []
    let v92 = [v86, ..v91]
    let v93 = erlang_term_apply(v88, v90, v92)
    v93
}

pub fn logged_470(v0: String, v1: String, v2: String, v3: String, v4: String, v5: String, v6: String) -> Nil {
    let v7 = log_row_471(v1, v2, v3, v4, v5, v6)
    let v8 = "json"
    let v9 = atom.create(v8)
    let v10 = "encode"
    let v11 = atom.create(v10)
    let v12 = []
    let v13 = [v7, ..v12]
    let v14 = erlang_term_apply(v9, v11, v13)
    let v15 = "erlang"
    let v16 = atom.create(v15)
    let v17 = "iolist_to_binary"
    let v18 = atom.create(v17)
    let v19 = []
    let v20 = [v14, ..v19]
    let v21 = erlang_term_apply(v16, v18, v20)
    let v22 = erlang_term_coerce(v21)
    let v23 = "\n"
    let v24 = v22 <> v23 
    let v25 = erlang_term_coerce(v0)
    let v26 = erlang_term_coerce(v24)
    let v27 = "append"
    let v28 = atom.create(v27)
    let v29 = erlang_term_coerce(v28)
    let v30 = []
    let v31 = [v29, ..v30]
    let v32 = erlang_term_coerce(v31)
    let v33 = "file"
    let v34 = atom.create(v33)
    let v35 = "write_file"
    let v36 = atom.create(v35)
    let v37 = []
    let v38 = [v32, ..v37]
    let v39 = [v26, ..v38]
    let v40 = [v25, ..v39]
    let v41 = erlang_term_apply(v34, v36, v40)
    let v42 = "ok"
    let v43 = atom.create(v42)
    let v44 = erlang_term_coerce(v43)
    let _v45 = v41 == v44
    Nil
}
