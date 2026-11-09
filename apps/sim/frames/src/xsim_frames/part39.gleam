import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Uh36, type Uh38, Uh29Cons, Uh29Nil, Uh36Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil, Us108None, Us108Some, Us111Error, Us111Ok, Us2None, Us2Some, Us3None, Us3Some, Us56Error, Us56Ok, Us72Error, Us72Ok, Us73Closed, Us73Failed, Us73Refused, Us73TimedOut, Us76Error, Us76Ok, Us80Error, Us80Ok}
import xsim_frames/part1.{closure1, erlang_term_apply, erlang_term_coerce, spiral_fs_read_file, spiral_string_slice, spiral_wrap_signed}
import xsim_frames/part12.{items_from_301}
import xsim_frames/part16.{method370, method371}
import xsim_frames/part25.{method462}
import xsim_frames/part28.{header_value_535, method547, method548}
import xsim_frames/part30.{method595}
import xsim_frames/part9.{method258, method259}

pub fn method696(v0: String, v1: Uh29, v2: Uh38) -> Uh38 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method696(v0, v4, v2)
            let v6 = erlang_term_coerce(v0)
            let v8 = atom.create("filename")
            let v10 = atom.create("dirname")
            let v11 = []
            let v12 = [v6, ..v11]
            let v13 = erlang_term_apply(v8, v10, v12)
            let v15 = atom.create("unicode")
            let v17 = atom.create("characters_to_binary")
            let v18 = []
            let v19 = [v13, ..v18]
            let v20 = erlang_term_apply(v15, v17, v19)
            let v21 = erlang_term_coerce(v20)
            let v22 = { v21 } <> { "/" }
            let v23 = erlang_term_coerce(v3)
            let v24 = { v22 } <> { v23 }
            let v25 = { v24 } <> { ".etf" }
            let v26 = erlang_term_coerce(v25)
            let v27 = "filelib"
            let v28 = atom.create(v27)
            let v29 = "last_modified"
            let v30 = atom.create(v29)
            let v31 = []
            let v32 = [v26, ..v31]
            let v33 = erlang_term_apply(v28, v30, v32)
            let v34 = erlang_term_coerce(v24)
            let v35 = atom.create(v27)
            let v36 = atom.create(v29)
            let v37 = []
            let v38 = [v34, ..v37]
            let v39 = erlang_term_apply(v35, v36, v38)
            let v40 = "erlang"
            let v41 = atom.create(v40)
            let v43 = atom.create(">")
            let v44 = []
            let v45 = [v39, ..v44]
            let v46 = [v33, ..v45]
            let v47 = erlang_term_apply(v41, v43, v46)
            let v48 = erlang_term_coerce(v47)
            let v167 =
                case v48 {
                    True -> {
                        let v49 = erlang_term_coerce(v25)
                        let v50 = "file"
                        let v51 = atom.create(v50)
                        let v53 = atom.create("read_file")
                        let v54 = []
                        let v55 = [v49, ..v54]
                        let v56 = erlang_term_apply(v51, v53, v55)
                        let v57 = erlang_term_coerce(1)
                        let v58 = atom.create(v40)
                        let v59 = "element"
                        let v60 = atom.create(v59)
                        let v61 = []
                        let v62 = [v56, ..v61]
                        let v63 = [v57, ..v62]
                        let v64 = erlang_term_apply(v58, v60, v63)
                        let v66 = atom.create("ok")
                        let v67 = erlang_term_coerce(v66)
                        let v68 = v64 == v67
                        let v84 =
                            case v68 {
                                True -> {
                                    let v69 = erlang_term_coerce(2)
                                    let v70 = atom.create(v40)
                                    let v71 = atom.create(v59)
                                    let v72 = []
                                    let v73 = [v56, ..v72]
                                    let v74 = [v69, ..v73]
                                    let v75 = erlang_term_apply(v70, v71, v74)
                                    let v76 = atom.create(v40)
                                    let v78 = atom.create("binary_to_term")
                                    let v79 = []
                                    let v80 = [v75, ..v79]
                                    let v81 = erlang_term_apply(v76, v78, v80)
                                    Us108Some(v81)
                                }
                                False -> Us108None
                            }
                        case v84  {
                            Us108None -> {
                                let v86 = spiral_fs_read_file(v24)
                                let v87 = method370()
                                let v88 = method371()
                                let v89 = case v86 { Ok(x) -> v87(x) Error(x) -> v88(x) }
                                let v102 =
                                    case v89  {
                                        Us80Error(v99) -> panic as "file_system.read_all_text: file:read_file failed"
                                        Us80Ok(v90) -> {
                                            let v91 = bit_array.to_string(v90)
                                            let v92 = method258()
                                            let v93 = method259()
                                            let v94 = case v91 { Ok(x) -> v92(x) Error(x) -> v93(x) }
                                            case v94  {
                                                Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                                Us56Ok(v95) -> v95
                                            }
                                        }
                                    }
                                let v103 = erlang_term_coerce(v102)
                                let v105 = atom.create("json")
                                let v107 = atom.create("decode")
                                let v108 = []
                                let v109 = [v103, ..v108]
                                let v110 = erlang_term_apply(v105, v107, v109)
                                let v111 = erlang_term_coerce(v25)
                                let v112 = atom.create(v40)
                                let v114 = atom.create("term_to_binary")
                                let v115 = []
                                let v116 = [v110, ..v115]
                                let v117 = erlang_term_apply(v112, v114, v116)
                                let v118 = atom.create(v50)
                                let v120 = atom.create("write_file")
                                let v121 = []
                                let v122 = [v117, ..v121]
                                let v123 = [v111, ..v122]
                                let _v124 = erlang_term_apply(v118, v120, v123)
                                v110
                            }
                            Us108Some(v85) -> v85
                        }
                    }
                    False -> {
                        let v127 = spiral_fs_read_file(v24)
                        let v128 = method370()
                        let v129 = method371()
                        let v130 = case v127 { Ok(x) -> v128(x) Error(x) -> v129(x) }
                        let v143 =
                            case v130  {
                                Us80Error(v140) -> panic as "file_system.read_all_text: file:read_file failed"
                                Us80Ok(v131) -> {
                                    let v132 = bit_array.to_string(v131)
                                    let v133 = method258()
                                    let v134 = method259()
                                    let v135 = case v132 { Ok(x) -> v133(x) Error(x) -> v134(x) }
                                    case v135  {
                                        Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                        Us56Ok(v136) -> v136
                                    }
                                }
                            }
                        let v144 = erlang_term_coerce(v143)
                        let v146 = atom.create("json")
                        let v148 = atom.create("decode")
                        let v149 = []
                        let v150 = [v144, ..v149]
                        let v151 = erlang_term_apply(v146, v148, v150)
                        let v152 = erlang_term_coerce(v25)
                        let v153 = atom.create(v40)
                        let v155 = atom.create("term_to_binary")
                        let v156 = []
                        let v157 = [v151, ..v156]
                        let v158 = erlang_term_apply(v153, v155, v157)
                        let v160 = atom.create("file")
                        let v162 = atom.create("write_file")
                        let v163 = []
                        let v164 = [v158, ..v163]
                        let v165 = [v152, ..v164]
                        let _v166 = erlang_term_apply(v160, v162, v165)
                        v151
                    }
                }
            let v168 = []
            let v169 = erlang_term_coerce(v168)
            let v171 = erlang_term_coerce("users")
            let v172 = erlang_term_coerce(v169)
            let v174 = atom.create("maps")
            let v176 = atom.create("get")
            let v177 = []
            let v178 = [v172, ..v177]
            let v179 = [v167, ..v178]
            let v180 = [v171, ..v179]
            let v181 = erlang_term_apply(v174, v176, v180)
            let v182 = erlang_term_coerce(v181)
            let v184 = atom.create("lists")
            let v186 = atom.create("reverse")
            let v187 = []
            let v188 = [v182, ..v187]
            let v189 = erlang_term_apply(v184, v186, v188)
            let v191 = items_from_301(v189, Uh29Nil)
            Uh38Cons(v191, v5)
        }
        Uh29Nil -> v2
    }
}

pub fn included_users_695(v0: String, v1: Dynamic) -> Uh29 {
    let v2 = []
    let v3 = erlang_term_coerce(v2)
    let v5 = erlang_term_coerce("include")
    let v6 = erlang_term_coerce(v3)
    let v7 = "maps"
    let v8 = atom.create(v7)
    let v9 = "get"
    let v10 = atom.create(v9)
    let v11 = []
    let v12 = [v6, ..v11]
    let v13 = [v1, ..v12]
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
    let v25 = items_from_301(v23, Uh29Nil)
    let v27 = method696(v0, v25, Uh38Nil)
    let v28 = []
    let v29 = erlang_term_coerce(v28)
    let v31 = erlang_term_coerce("users")
    let v32 = erlang_term_coerce(v29)
    let v33 = atom.create(v7)
    let v34 = atom.create(v9)
    let v35 = []
    let v36 = [v32, ..v35]
    let v37 = [v1, ..v36]
    let v38 = [v31, ..v37]
    let v39 = erlang_term_apply(v33, v34, v38)
    let v40 = erlang_term_coerce(v39)
    let v41 = atom.create(v17)
    let v42 = atom.create(v19)
    let v43 = []
    let v44 = [v40, ..v43]
    let v45 = erlang_term_apply(v41, v42, v44)
    let v47 = items_from_301(v45, Uh29Nil)
    let v49 = method595(v27, Uh29Nil)
    method462(v47, v49)
}

pub fn method698(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method698(v3, v1)
            let v6 = erlang_term_coerce("")
            let v8 = erlang_term_coerce("created_at")
            let v9 = erlang_term_coerce(v6)
            let v11 = atom.create("maps")
            let v13 = atom.create("get")
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

pub fn method699(v0: Uh3, v1: String) -> String {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = erlang_term_coerce(v1)
            let v5 = erlang_term_coerce(v2)
            let v7 = atom.create("erlang")
            let v9 = atom.create(">=")
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
            method699(v3, v15)
        }
        Uh3Nil -> v1
    }
}

pub fn method701(v0: Dynamic, v1: Uh29, v2: dict.Dict(String, Dynamic)) -> dict.Dict(String, Dynamic) {
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
            let v23 = atom.create("is_binary")
            let v24 = []
            let v25 = [v19, ..v24]
            let v26 = erlang_term_apply(v21, v23, v25)
            let v27 = erlang_term_coerce(v26)
            let v36 =
                case v27 {
                    True -> {
                        erlang_term_coerce(v19)
                    }
                    False -> {
                        let v29 = atom.create(v20)
                        let v31 = atom.create("integer_to_binary")
                        let v32 = []
                        let v33 = [v19, ..v32]
                        let v34 = erlang_term_apply(v29, v31, v33)
                        erlang_term_coerce(v34)
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
            let v49 = erlang_term_coerce("author_id")
            let v50 = erlang_term_coerce(v47)
            let v51 = atom.create(v10)
            let v53 = atom.create("put")
            let v54 = []
            let v55 = [v3, ..v54]
            let v56 = [v50, ..v55]
            let v57 = [v49, ..v56]
            let v58 = erlang_term_apply(v51, v53, v57)
            let v59 = dict.insert(v2, v36, v58)
            method701(v0, v4, v59)
        }
        Uh29Nil -> v2
    }
}

pub fn with_posts_700(v0: Dynamic, v1: dict.Dict(String, Dynamic)) -> dict.Dict(String, Dynamic) {
    let v2 = []
    let v3 = erlang_term_coerce(v2)
    let v5 = erlang_term_coerce("posts")
    let v6 = erlang_term_coerce(v3)
    let v8 = atom.create("maps")
    let v10 = atom.create("get")
    let v11 = []
    let v12 = [v6, ..v11]
    let v13 = [v0, ..v12]
    let v14 = [v5, ..v13]
    let v15 = erlang_term_apply(v8, v10, v14)
    let v16 = erlang_term_coerce(v15)
    let v18 = atom.create("lists")
    let v20 = atom.create("reverse")
    let v21 = []
    let v22 = [v16, ..v21]
    let v23 = erlang_term_apply(v18, v20, v22)
    let v25 = items_from_301(v23, Uh29Nil)
    method701(v0, v25, v1)
}

pub fn method697(v0: Uh29, v1: String, v2: String, v3: dict.Dict(String, Dynamic), v4: dict.Dict(String, Dynamic), v5: Int, v6: dict.Dict(String, Dynamic), v7: String, v8: Dynamic, v9: Uh3, v10: Dynamic, v11: dict.Dict(String, Nil), v12: Int, v13: Uh36, v14: String) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let #(v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191) =
        case v0  {
            Uh29Cons(v15, v16) -> {
                let v17 = ""
                let v18 = erlang_term_coerce(v17)
                let v19 = "username"
                let v20 = erlang_term_coerce(v19)
                let v21 = erlang_term_coerce(v18)
                let v22 = "maps"
                let v23 = atom.create(v22)
                let v24 = "get"
                let v25 = atom.create(v24)
                let v26 = []
                let v27 = [v21, ..v26]
                let v28 = [v15, ..v27]
                let v29 = [v20, ..v28]
                let v30 = erlang_term_apply(v23, v25, v29)
                let v31 = erlang_term_coerce(v30)
                let v32 = erlang_term_coerce(v31)
                let v33 = v32 |> string.lowercase
                let v34 = dict.get(v3, v33)
                let v35 = method547()
                let v36 = method548()
                let v37 = case v34 { Ok(x) -> v35(x) Error(x) -> v36(x) }
                let v42 =
                    case v37  {
                        Us111Error -> Us108None
                        Us111Ok(v38) -> Us108Some(v38)
                    }
                let v103 =
                    case v42  {
                        Us108None -> True
                        Us108Some(v43) -> {
                            let v44 = []
                            let v45 = erlang_term_coerce(v44)
                            let v46 = "posts"
                            let v47 = erlang_term_coerce(v46)
                            let v48 = erlang_term_coerce(v45)
                            let v49 = atom.create(v22)
                            let v50 = atom.create(v24)
                            let v51 = []
                            let v52 = [v48, ..v51]
                            let v53 = [v15, ..v52]
                            let v54 = [v47, ..v53]
                            let v55 = erlang_term_apply(v49, v50, v54)
                            let v56 = erlang_term_coerce(v55)
                            let v57 = "lists"
                            let v58 = atom.create(v57)
                            let v59 = "reverse"
                            let v60 = atom.create(v59)
                            let v61 = []
                            let v62 = [v56, ..v61]
                            let v63 = erlang_term_apply(v58, v60, v62)
                            let v65 = items_from_301(v63, Uh29Nil)
                            let v67 = method698(v65, Uh3Nil)
                            let v68 = method699(v67, v17)
                            let v69 = []
                            let v70 = erlang_term_coerce(v69)
                            let v71 = erlang_term_coerce(v46)
                            let v72 = erlang_term_coerce(v70)
                            let v73 = atom.create(v22)
                            let v74 = atom.create(v24)
                            let v75 = []
                            let v76 = [v72, ..v75]
                            let v77 = [v43, ..v76]
                            let v78 = [v71, ..v77]
                            let v79 = erlang_term_apply(v73, v74, v78)
                            let v80 = erlang_term_coerce(v79)
                            let v81 = atom.create(v57)
                            let v82 = atom.create(v59)
                            let v83 = []
                            let v84 = [v80, ..v83]
                            let v85 = erlang_term_apply(v81, v82, v84)
                            let v87 = items_from_301(v85, Uh29Nil)
                            let v89 = method698(v87, Uh3Nil)
                            let v90 = method699(v89, v17)
                            let v91 = erlang_term_coerce(v68)
                            let v92 = erlang_term_coerce(v90)
                            let v94 = atom.create("erlang")
                            let v96 = atom.create(">=")
                            let v97 = []
                            let v98 = [v92, ..v97]
                            let v99 = [v91, ..v98]
                            let v100 = erlang_term_apply(v94, v96, v99)
                            erlang_term_coerce(v100)
                        }
                    }
                let v118 =
                    case v103 {
                        True -> {
                            let v104 = erlang_term_coerce(v17)
                            let v105 = erlang_term_coerce(v19)
                            let v106 = erlang_term_coerce(v104)
                            let v107 = atom.create(v22)
                            let v108 = atom.create(v24)
                            let v109 = []
                            let v110 = [v106, ..v109]
                            let v111 = [v15, ..v110]
                            let v112 = [v105, ..v111]
                            let v113 = erlang_term_apply(v107, v108, v112)
                            let v114 = erlang_term_coerce(v113)
                            let v115 = erlang_term_coerce(v114)
                            let v116 = v115 |> string.lowercase
                            dict.insert(v3, v116, v15)
                        }
                        False -> v3
                    }
                let v119 = erlang_term_coerce(v17)
                let v121 = erlang_term_coerce("id")
                let v122 = erlang_term_coerce(v119)
                let v123 = atom.create(v22)
                let v124 = atom.create(v24)
                let v125 = []
                let v126 = [v122, ..v125]
                let v127 = [v15, ..v126]
                let v128 = [v121, ..v127]
                let v129 = erlang_term_apply(v123, v124, v128)
                let v130 = erlang_term_coerce(v129)
                let v131 = "erlang"
                let v132 = atom.create(v131)
                let v134 = atom.create("is_binary")
                let v135 = []
                let v136 = [v130, ..v135]
                let v137 = erlang_term_apply(v132, v134, v136)
                let v138 = erlang_term_coerce(v137)
                let v147 =
                    case v138 {
                        True -> {
                            erlang_term_coerce(v130)
                        }
                        False -> {
                            let v140 = atom.create(v131)
                            let v142 = atom.create("integer_to_binary")
                            let v143 = []
                            let v144 = [v130, ..v143]
                            let v145 = erlang_term_apply(v140, v142, v144)
                            erlang_term_coerce(v145)
                        }
                    }
                let v148 = dict.insert(v4, v147, v15)
                let v149 = with_posts_700(v15, v6)
                method697(v16, v1, v2, v118, v148, v5, v149, v7, v8, v9, v10, v11, v12, v13, v14)
            }
            _ -> {
                let #(v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177) =
                    case v0  {
                        Uh29Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177)
            }
        }
    #(v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191)
}

pub fn world_of_694(v0: String) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let v1 = { v0 } <> { ".etf" }
    let v2 = erlang_term_coerce(v1)
    let v3 = "filelib"
    let v4 = atom.create(v3)
    let v5 = "last_modified"
    let v6 = atom.create(v5)
    let v7 = []
    let v8 = [v2, ..v7]
    let v9 = erlang_term_apply(v4, v6, v8)
    let v10 = erlang_term_coerce(v0)
    let v11 = atom.create(v3)
    let v12 = atom.create(v5)
    let v13 = []
    let v14 = [v10, ..v13]
    let v15 = erlang_term_apply(v11, v12, v14)
    let v16 = "erlang"
    let v17 = atom.create(v16)
    let v19 = atom.create(">")
    let v20 = []
    let v21 = [v15, ..v20]
    let v22 = [v9, ..v21]
    let v23 = erlang_term_apply(v17, v19, v22)
    let v24 = erlang_term_coerce(v23)
    let v143 =
        case v24 {
            True -> {
                let v25 = erlang_term_coerce(v1)
                let v26 = "file"
                let v27 = atom.create(v26)
                let v29 = atom.create("read_file")
                let v30 = []
                let v31 = [v25, ..v30]
                let v32 = erlang_term_apply(v27, v29, v31)
                let v33 = erlang_term_coerce(1)
                let v34 = atom.create(v16)
                let v35 = "element"
                let v36 = atom.create(v35)
                let v37 = []
                let v38 = [v32, ..v37]
                let v39 = [v33, ..v38]
                let v40 = erlang_term_apply(v34, v36, v39)
                let v42 = atom.create("ok")
                let v43 = erlang_term_coerce(v42)
                let v44 = v40 == v43
                let v60 =
                    case v44 {
                        True -> {
                            let v45 = erlang_term_coerce(2)
                            let v46 = atom.create(v16)
                            let v47 = atom.create(v35)
                            let v48 = []
                            let v49 = [v32, ..v48]
                            let v50 = [v45, ..v49]
                            let v51 = erlang_term_apply(v46, v47, v50)
                            let v52 = atom.create(v16)
                            let v54 = atom.create("binary_to_term")
                            let v55 = []
                            let v56 = [v51, ..v55]
                            let v57 = erlang_term_apply(v52, v54, v56)
                            Us108Some(v57)
                        }
                        False -> Us108None
                    }
                case v60  {
                    Us108None -> {
                        let v62 = spiral_fs_read_file(v0)
                        let v63 = method370()
                        let v64 = method371()
                        let v65 = case v62 { Ok(x) -> v63(x) Error(x) -> v64(x) }
                        let v78 =
                            case v65  {
                                Us80Error(v75) -> panic as "file_system.read_all_text: file:read_file failed"
                                Us80Ok(v66) -> {
                                    let v67 = bit_array.to_string(v66)
                                    let v68 = method258()
                                    let v69 = method259()
                                    let v70 = case v67 { Ok(x) -> v68(x) Error(x) -> v69(x) }
                                    case v70  {
                                        Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                        Us56Ok(v71) -> v71
                                    }
                                }
                            }
                        let v79 = erlang_term_coerce(v78)
                        let v81 = atom.create("json")
                        let v83 = atom.create("decode")
                        let v84 = []
                        let v85 = [v79, ..v84]
                        let v86 = erlang_term_apply(v81, v83, v85)
                        let v87 = erlang_term_coerce(v1)
                        let v88 = atom.create(v16)
                        let v90 = atom.create("term_to_binary")
                        let v91 = []
                        let v92 = [v86, ..v91]
                        let v93 = erlang_term_apply(v88, v90, v92)
                        let v94 = atom.create(v26)
                        let v96 = atom.create("write_file")
                        let v97 = []
                        let v98 = [v93, ..v97]
                        let v99 = [v87, ..v98]
                        let _v100 = erlang_term_apply(v94, v96, v99)
                        v86
                    }
                    Us108Some(v61) -> v61
                }
            }
            False -> {
                let v103 = spiral_fs_read_file(v0)
                let v104 = method370()
                let v105 = method371()
                let v106 = case v103 { Ok(x) -> v104(x) Error(x) -> v105(x) }
                let v119 =
                    case v106  {
                        Us80Error(v116) -> panic as "file_system.read_all_text: file:read_file failed"
                        Us80Ok(v107) -> {
                            let v108 = bit_array.to_string(v107)
                            let v109 = method258()
                            let v110 = method259()
                            let v111 = case v108 { Ok(x) -> v109(x) Error(x) -> v110(x) }
                            case v111  {
                                Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                Us56Ok(v112) -> v112
                            }
                        }
                    }
                let v120 = erlang_term_coerce(v119)
                let v122 = atom.create("json")
                let v124 = atom.create("decode")
                let v125 = []
                let v126 = [v120, ..v125]
                let v127 = erlang_term_apply(v122, v124, v126)
                let v128 = erlang_term_coerce(v1)
                let v129 = atom.create(v16)
                let v131 = atom.create("term_to_binary")
                let v132 = []
                let v133 = [v127, ..v132]
                let v134 = erlang_term_apply(v129, v131, v133)
                let v136 = atom.create("file")
                let v138 = atom.create("write_file")
                let v139 = []
                let v140 = [v134, ..v139]
                let v141 = [v128, ..v140]
                let _v142 = erlang_term_apply(v136, v138, v141)
                v127
            }
        }
    let v144 = included_users_695(v0, v143)
    let v145 = ""
    let v146 = erlang_term_coerce(v145)
    let v148 = erlang_term_coerce("token")
    let v149 = erlang_term_coerce(v146)
    let v150 = "maps"
    let v151 = atom.create(v150)
    let v152 = "get"
    let v153 = atom.create(v152)
    let v154 = []
    let v155 = [v149, ..v154]
    let v156 = [v143, ..v155]
    let v157 = [v148, ..v156]
    let v158 = erlang_term_apply(v151, v153, v157)
    let v159 = erlang_term_coerce(v158)
    let v160 = erlang_term_coerce(v159)
    let v161 = erlang_term_coerce(v145)
    let v163 = erlang_term_coerce("user_token")
    let v164 = erlang_term_coerce(v161)
    let v165 = atom.create(v150)
    let v166 = atom.create(v152)
    let v167 = []
    let v168 = [v164, ..v167]
    let v169 = [v143, ..v168]
    let v170 = [v163, ..v169]
    let v171 = erlang_term_apply(v165, v166, v170)
    let v172 = erlang_term_coerce(v171)
    let v173 = erlang_term_coerce(v172)
    let v174 = erlang_term_coerce(v145)
    let v176 = erlang_term_coerce("now")
    let v177 = erlang_term_coerce(v174)
    let v178 = atom.create(v150)
    let v179 = atom.create(v152)
    let v180 = []
    let v181 = [v177, ..v180]
    let v182 = [v143, ..v181]
    let v183 = [v176, ..v182]
    let v184 = erlang_term_apply(v178, v179, v183)
    let v185 = erlang_term_coerce(v184)
    let v186 = erlang_term_coerce(v185)
    let v187 = dict.new()
    let _v188 = erlang_term_coerce(v145)
    let _v189 = erlang_term_coerce(v145)
    let v190 = dict.new()
    let v191 = erlang_term_coerce(v145)
    let v193 = erlang_term_coerce("me")
    let v194 = erlang_term_coerce(v191)
    let v195 = atom.create(v150)
    let v196 = atom.create(v152)
    let v197 = []
    let v198 = [v194, ..v197]
    let v199 = [v143, ..v198]
    let v200 = [v193, ..v199]
    let v201 = erlang_term_apply(v195, v196, v200)
    let v202 = erlang_term_coerce(v201)
    let v203 = atom.create(v150)
    let v205 = atom.create("new")
    let v206 = []
    let v207 = erlang_term_apply(v203, v205, v206)
    let v209 = erlang_term_coerce("oauth2")
    let v210 = erlang_term_coerce(v207)
    let v211 = atom.create(v150)
    let v212 = atom.create(v152)
    let v213 = []
    let v214 = [v210, ..v213]
    let v215 = [v143, ..v214]
    let v216 = [v209, ..v215]
    let v217 = erlang_term_apply(v211, v212, v216)
    let v218 = erlang_term_coerce(v217)
    let v219 = erlang_term_coerce(v145)
    let v221 = erlang_term_coerce("refresh_token")
    let v222 = erlang_term_coerce(v219)
    let v223 = atom.create(v150)
    let v224 = atom.create(v152)
    let v225 = []
    let v226 = [v222, ..v225]
    let v227 = [v218, ..v226]
    let v228 = [v221, ..v227]
    let v229 = erlang_term_apply(v223, v224, v228)
    let v230 = erlang_term_coerce(v229)
    let v231 = erlang_term_coerce(v230)
    let v233 = erlang_term_coerce("following_page_size")
    let v234 = erlang_term_coerce(100)
    let v235 = atom.create(v150)
    let v236 = atom.create(v152)
    let v237 = []
    let v238 = [v234, ..v237]
    let v239 = [v143, ..v238]
    let v240 = [v233, ..v239]
    let v241 = erlang_term_apply(v235, v236, v240)
    let v242 = erlang_term_coerce(v241)
    let v244 = Uh3Cons(v231, Uh3Nil)
    let #(v247, v248, v249, v250, v251, v252, v253, v254, v255, v256, v257, v258, v259, _v260) = method697(v144, v160, v173, v187, v187, v242, v187, v186, v143, v244, v202, v190, 9001, Uh36Nil, v145)
    let v261 = erlang_term_coerce(v0)
    let v263 = atom.create("filename")
    let v265 = atom.create("dirname")
    let v266 = []
    let v267 = [v261, ..v266]
    let v268 = erlang_term_apply(v263, v265, v267)
    let v270 = atom.create("unicode")
    let v272 = atom.create("characters_to_binary")
    let v273 = []
    let v274 = [v268, ..v273]
    let v275 = erlang_term_apply(v270, v272, v274)
    let v276 = erlang_term_coerce(v275)
    let v277 = { v276 } <> { "/media" }
    #(v247, v248, v249, v250, v251, v252, v253, v254, v255, v256, v257, v258, v259, v277)
}

pub fn received_704(v0: Dynamic, v1: String) -> String {
    let v3 = option.from_result(result.map(string.split_once(v1, "\r\n\r\n"), pair.first))
    let v4 = closure1(Nil)
    let v5 = v3 |> option.map(v4)
    let v7 = v5 |> option.unwrap(Us2None)
    let v11 =
        case v7  {
            Us2None -> -1
            Us2Some(v8) -> {
                bit_array.byte_size(bit_array.from_string(v8))
            }
        }
    let v12 = v11 >= 0
    let v40 =
        case v12 {
            True -> {
                let v13 = erlang_term_coerce(v1)
                let v15 = atom.create("erlang")
                let v17 = atom.create("byte_size")
                let v18 = []
                let v19 = [v13, ..v18]
                let v20 = erlang_term_apply(v15, v17, v19)
                let v21 = erlang_term_coerce(v20)
                let v22 = spiral_wrap_signed(v11 + 4, 32)
                let v23 = spiral_wrap_signed(v11 - 1, 32)
                let v24 = spiral_string_slice(v1, 0, v23)
                let v26 = header_value_535("content-length", v24)
                let #(v27, v28) = case int.parse(string.trim(v26)) { Ok(n) -> #(n, 0) Error(Nil) -> #(0, 1) }
                let v29 = v28 == 0
                let v32 =
                    case v29 {
                        True -> Us3Some(v27)
                        False -> Us3None
                    }
                let v37 =
                    case v32  {
                        Us3None -> 0
                        Us3Some(v33) -> {
                            let v34 = v33 < 0
                            case v34 {
                                True -> 0
                                False -> v33
                            }
                        }
                    }
                let v38 = spiral_wrap_signed(v22 + v37, 32)
                v21 >= v38
            }
            False -> False
        }
    let v115 =
        case v40 {
            True -> {
                ""
            }
            False -> {
                let v42 = erlang_term_coerce(0)
                let v43 = erlang_term_coerce(10000)
                let v45 = atom.create("gen_tcp")
                let v47 = atom.create("recv")
                let v48 = []
                let v49 = [v43, ..v48]
                let v50 = [v42, ..v49]
                let v51 = [v0, ..v50]
                let v52 = erlang_term_apply(v45, v47, v51)
                let v53 = erlang_term_coerce(1)
                let v54 = "erlang"
                let v55 = atom.create(v54)
                let v56 = "element"
                let v57 = atom.create(v56)
                let v58 = []
                let v59 = [v52, ..v58]
                let v60 = [v53, ..v59]
                let v61 = erlang_term_apply(v55, v57, v60)
                let v63 = atom.create("ok")
                let v64 = erlang_term_coerce(v63)
                let v65 = v61 == v64
                let v102 =
                    case v65 {
                        True -> {
                            let v66 = erlang_term_coerce(2)
                            let v67 = atom.create(v54)
                            let v68 = atom.create(v56)
                            let v69 = []
                            let v70 = [v52, ..v69]
                            let v71 = [v66, ..v70]
                            let v72 = erlang_term_apply(v67, v68, v71)
                            Us72Ok(v72)
                        }
                        False -> {
                            let v74 = erlang_term_coerce(2)
                            let v75 = atom.create(v54)
                            let v76 = atom.create(v56)
                            let v77 = []
                            let v78 = [v52, ..v77]
                            let v79 = [v74, ..v78]
                            let v80 = erlang_term_apply(v75, v76, v79)
                            let v82 = atom.create("econnrefused")
                            let v83 = erlang_term_coerce(v82)
                            let v84 = v80 == v83
                            let v100 =
                                case v84 {
                                    True -> Us73Refused
                                    False -> {
                                        let v87 = atom.create("timeout")
                                        let v88 = erlang_term_coerce(v87)
                                        let v89 = v80 == v88
                                        case v89 {
                                            True -> Us73TimedOut
                                            False -> {
                                                let v92 = atom.create("closed")
                                                let v93 = erlang_term_coerce(v92)
                                                let v94 = v80 == v93
                                                case v94 {
                                                    True -> Us73Closed
                                                    False -> {
                                                        let v96 = string.inspect(v80)
                                                        Us73Failed(v96)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            Us72Error(v100)
                        }
                    }
                let v109 =
                    case v102  {
                        Us72Error(v106) -> Us76Error(v106)
                        Us72Ok(v103) -> {
                            let v104 = erlang_term_coerce(v103)
                            Us76Ok(v104)
                        }
                    }
                case v109  {
                    Us76Error(v111) -> {
                        ""
                    }
                    Us76Ok(v110) -> v110
                }
            }
        }
    let v116 = v115 == ""
    case v116 {
        True -> v1
        False -> {
            let v117 = { v1 } <> { v115 }
            received_704(v0, v117)
        }
    }
}

pub fn closure173(capt: #(fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String), String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String, String)) -> fn(Nil) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16) = capt
        let v17 = v0(#(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14))
        let v18 = v17(v15)
        v18(v16)
    }
}
