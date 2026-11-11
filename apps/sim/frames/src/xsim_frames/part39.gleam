import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Uh36, type Uh38, Uh29Cons, Uh29Nil, Uh36Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil, Us108None, Us108Some, Us111Error, Us111Ok, Us56Error, Us56Ok, Us80Error, Us80Ok}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, spiral_fs_read_file, spiral_string_slice}
import xsim_frames/part12.{items_from_301}
import xsim_frames/part16.{method370, method371}
import xsim_frames/part25.{method462}
import xsim_frames/part28.{method549, method550}
import xsim_frames/part30.{method597}
import xsim_frames/part38.{feed_or_api_450}
import xsim_frames/part9.{method258, method259}

pub fn closure145(capt: #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String, String)) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    fn (v16) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15) = capt
        feed_or_api_450(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
    }
}

pub fn closure144(capt: #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    fn (v15) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14) = capt
        closure145(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15))
    }
}

pub fn closure143(capt: Nil) -> fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14) = dom
        closure144(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14))
    }
}

pub fn method698(v0: String, v1: Uh29, v2: Uh38) -> Uh38 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method698(v0, v4, v2)
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

pub fn included_users_697(v0: String, v1: Dynamic) -> Uh29 {
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
    let v27 = method698(v0, v25, Uh38Nil)
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
    let v49 = method597(v27, Uh29Nil)
    method462(v47, v49)
}

pub fn method700(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method700(v3, v1)
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

pub fn method701(v0: Uh3, v1: String) -> String {
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
            method701(v3, v15)
        }
        Uh3Nil -> v1
    }
}

pub fn method703(v0: Dynamic, v1: Uh29, v2: dict.Dict(String, Dynamic)) -> dict.Dict(String, Dynamic) {
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
            method703(v0, v4, v59)
        }
        Uh29Nil -> v2
    }
}

pub fn with_posts_702(v0: Dynamic, v1: dict.Dict(String, Dynamic)) -> dict.Dict(String, Dynamic) {
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
    method703(v0, v25, v1)
}

pub fn method699(v0: Uh29, v1: String, v2: String, v3: dict.Dict(String, Dynamic), v4: dict.Dict(String, Dynamic), v5: Int, v6: dict.Dict(String, Dynamic), v7: String, v8: Dynamic, v9: Uh3, v10: Dynamic, v11: dict.Dict(String, Nil), v12: Int, v13: Uh36, v14: String, v15: String) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    let #(v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195) =
        case v0  {
            Uh29Cons(v16, v17) -> {
                let v18 = ""
                let v19 = erlang_term_coerce(v18)
                let v20 = "username"
                let v21 = erlang_term_coerce(v20)
                let v22 = erlang_term_coerce(v19)
                let v23 = "maps"
                let v24 = atom.create(v23)
                let v25 = "get"
                let v26 = atom.create(v25)
                let v27 = []
                let v28 = [v22, ..v27]
                let v29 = [v16, ..v28]
                let v30 = [v21, ..v29]
                let v31 = erlang_term_apply(v24, v26, v30)
                let v32 = erlang_term_coerce(v31)
                let v33 = erlang_term_coerce(v32)
                let v34 = v33 |> string.lowercase
                let v35 = dict.get(v3, v34)
                let v36 = method549()
                let v37 = method550()
                let v38 = case v35 { Ok(x) -> v36(x) Error(x) -> v37(x) }
                let v43 =
                    case v38  {
                        Us111Error -> Us108None
                        Us111Ok(v39) -> Us108Some(v39)
                    }
                let v104 =
                    case v43  {
                        Us108None -> True
                        Us108Some(v44) -> {
                            let v45 = []
                            let v46 = erlang_term_coerce(v45)
                            let v47 = "posts"
                            let v48 = erlang_term_coerce(v47)
                            let v49 = erlang_term_coerce(v46)
                            let v50 = atom.create(v23)
                            let v51 = atom.create(v25)
                            let v52 = []
                            let v53 = [v49, ..v52]
                            let v54 = [v16, ..v53]
                            let v55 = [v48, ..v54]
                            let v56 = erlang_term_apply(v50, v51, v55)
                            let v57 = erlang_term_coerce(v56)
                            let v58 = "lists"
                            let v59 = atom.create(v58)
                            let v60 = "reverse"
                            let v61 = atom.create(v60)
                            let v62 = []
                            let v63 = [v57, ..v62]
                            let v64 = erlang_term_apply(v59, v61, v63)
                            let v66 = items_from_301(v64, Uh29Nil)
                            let v68 = method700(v66, Uh3Nil)
                            let v69 = method701(v68, v18)
                            let v70 = []
                            let v71 = erlang_term_coerce(v70)
                            let v72 = erlang_term_coerce(v47)
                            let v73 = erlang_term_coerce(v71)
                            let v74 = atom.create(v23)
                            let v75 = atom.create(v25)
                            let v76 = []
                            let v77 = [v73, ..v76]
                            let v78 = [v44, ..v77]
                            let v79 = [v72, ..v78]
                            let v80 = erlang_term_apply(v74, v75, v79)
                            let v81 = erlang_term_coerce(v80)
                            let v82 = atom.create(v58)
                            let v83 = atom.create(v60)
                            let v84 = []
                            let v85 = [v81, ..v84]
                            let v86 = erlang_term_apply(v82, v83, v85)
                            let v88 = items_from_301(v86, Uh29Nil)
                            let v90 = method700(v88, Uh3Nil)
                            let v91 = method701(v90, v18)
                            let v92 = erlang_term_coerce(v69)
                            let v93 = erlang_term_coerce(v91)
                            let v95 = atom.create("erlang")
                            let v97 = atom.create(">=")
                            let v98 = []
                            let v99 = [v93, ..v98]
                            let v100 = [v92, ..v99]
                            let v101 = erlang_term_apply(v95, v97, v100)
                            erlang_term_coerce(v101)
                        }
                    }
                let v119 =
                    case v104 {
                        True -> {
                            let v105 = erlang_term_coerce(v18)
                            let v106 = erlang_term_coerce(v20)
                            let v107 = erlang_term_coerce(v105)
                            let v108 = atom.create(v23)
                            let v109 = atom.create(v25)
                            let v110 = []
                            let v111 = [v107, ..v110]
                            let v112 = [v16, ..v111]
                            let v113 = [v106, ..v112]
                            let v114 = erlang_term_apply(v108, v109, v113)
                            let v115 = erlang_term_coerce(v114)
                            let v116 = erlang_term_coerce(v115)
                            let v117 = v116 |> string.lowercase
                            dict.insert(v3, v117, v16)
                        }
                        False -> v3
                    }
                let v120 = erlang_term_coerce(v18)
                let v122 = erlang_term_coerce("id")
                let v123 = erlang_term_coerce(v120)
                let v124 = atom.create(v23)
                let v125 = atom.create(v25)
                let v126 = []
                let v127 = [v123, ..v126]
                let v128 = [v16, ..v127]
                let v129 = [v122, ..v128]
                let v130 = erlang_term_apply(v124, v125, v129)
                let v131 = erlang_term_coerce(v130)
                let v132 = "erlang"
                let v133 = atom.create(v132)
                let v135 = atom.create("is_binary")
                let v136 = []
                let v137 = [v131, ..v136]
                let v138 = erlang_term_apply(v133, v135, v137)
                let v139 = erlang_term_coerce(v138)
                let v148 =
                    case v139 {
                        True -> {
                            erlang_term_coerce(v131)
                        }
                        False -> {
                            let v141 = atom.create(v132)
                            let v143 = atom.create("integer_to_binary")
                            let v144 = []
                            let v145 = [v131, ..v144]
                            let v146 = erlang_term_apply(v141, v143, v145)
                            erlang_term_coerce(v146)
                        }
                    }
                let v149 = dict.insert(v4, v148, v16)
                let v150 = with_posts_702(v16, v6)
                method699(v17, v1, v2, v119, v149, v5, v150, v7, v8, v9, v10, v11, v12, v13, v14, v15)
            }
            _ -> {
                let #(v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180) =
                    case v0  {
                        Uh29Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180)
            }
        }
    #(v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195)
}

pub fn world_of_696(v0: String) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
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
    let v145 = erlang_term_coerce("xsim_world")
    let v146 = "persistent_term"
    let v147 = atom.create(v146)
    let v149 = atom.create("put")
    let v150 = []
    let v151 = [v143, ..v150]
    let v152 = [v145, ..v151]
    let _v153 = erlang_term_apply(v147, v149, v152)
    let v154 = atom.create(v16)
    let v156 = atom.create("garbage_collect")
    let v157 = []
    let _v158 = erlang_term_apply(v154, v156, v157)
    let v159 = atom.create(v146)
    let v160 = "get"
    let v161 = atom.create(v160)
    let v162 = []
    let v163 = [v145, ..v162]
    let v164 = erlang_term_apply(v159, v161, v163)
    let v165 = included_users_697(v0, v164)
    let v166 = ""
    let v167 = erlang_term_coerce(v166)
    let v169 = erlang_term_coerce("token")
    let v170 = erlang_term_coerce(v167)
    let v171 = "maps"
    let v172 = atom.create(v171)
    let v173 = atom.create(v160)
    let v174 = []
    let v175 = [v170, ..v174]
    let v176 = [v164, ..v175]
    let v177 = [v169, ..v176]
    let v178 = erlang_term_apply(v172, v173, v177)
    let v179 = erlang_term_coerce(v178)
    let v180 = erlang_term_coerce(v179)
    let v181 = erlang_term_coerce(v166)
    let v183 = erlang_term_coerce("user_token")
    let v184 = erlang_term_coerce(v181)
    let v185 = atom.create(v171)
    let v186 = atom.create(v160)
    let v187 = []
    let v188 = [v184, ..v187]
    let v189 = [v164, ..v188]
    let v190 = [v183, ..v189]
    let v191 = erlang_term_apply(v185, v186, v190)
    let v192 = erlang_term_coerce(v191)
    let v193 = erlang_term_coerce(v192)
    let v194 = erlang_term_coerce(v166)
    let v196 = erlang_term_coerce("now")
    let v197 = erlang_term_coerce(v194)
    let v198 = atom.create(v171)
    let v199 = atom.create(v160)
    let v200 = []
    let v201 = [v197, ..v200]
    let v202 = [v164, ..v201]
    let v203 = [v196, ..v202]
    let v204 = erlang_term_apply(v198, v199, v203)
    let v205 = erlang_term_coerce(v204)
    let v206 = erlang_term_coerce(v205)
    let v207 = dict.new()
    let _v208 = erlang_term_coerce(v166)
    let _v209 = erlang_term_coerce(v166)
    let v210 = dict.new()
    let v211 = erlang_term_coerce(v166)
    let v213 = erlang_term_coerce("me")
    let v214 = erlang_term_coerce(v211)
    let v215 = atom.create(v171)
    let v216 = atom.create(v160)
    let v217 = []
    let v218 = [v214, ..v217]
    let v219 = [v164, ..v218]
    let v220 = [v213, ..v219]
    let v221 = erlang_term_apply(v215, v216, v220)
    let v222 = erlang_term_coerce(v221)
    let v223 = atom.create(v171)
    let v225 = atom.create("new")
    let v226 = []
    let v227 = erlang_term_apply(v223, v225, v226)
    let v229 = erlang_term_coerce("oauth2")
    let v230 = erlang_term_coerce(v227)
    let v231 = atom.create(v171)
    let v232 = atom.create(v160)
    let v233 = []
    let v234 = [v230, ..v233]
    let v235 = [v164, ..v234]
    let v236 = [v229, ..v235]
    let v237 = erlang_term_apply(v231, v232, v236)
    let v238 = erlang_term_coerce(v237)
    let v239 = erlang_term_coerce(v166)
    let v241 = erlang_term_coerce("refresh_token")
    let v242 = erlang_term_coerce(v239)
    let v243 = atom.create(v171)
    let v244 = atom.create(v160)
    let v245 = []
    let v246 = [v242, ..v245]
    let v247 = [v238, ..v246]
    let v248 = [v241, ..v247]
    let v249 = erlang_term_apply(v243, v244, v248)
    let v250 = erlang_term_coerce(v249)
    let v251 = erlang_term_coerce(v250)
    let v253 = erlang_term_coerce("following_page_size")
    let v254 = erlang_term_coerce(100)
    let v255 = atom.create(v171)
    let v256 = atom.create(v160)
    let v257 = []
    let v258 = [v254, ..v257]
    let v259 = [v164, ..v258]
    let v260 = [v253, ..v259]
    let v261 = erlang_term_apply(v255, v256, v260)
    let v262 = erlang_term_coerce(v261)
    let v264 = Uh3Cons(v251, Uh3Nil)
    let #(v267, v268, v269, v270, v271, v272, v273, v274, v275, v276, v277, v278, v279, _v280, v281) = method699(v165, v180, v193, v207, v207, v262, v207, v206, v164, v264, v222, v210, 9001, Uh36Nil, v166, v166)
    let v282 = erlang_term_coerce(v0)
    let v284 = atom.create("filename")
    let v286 = atom.create("dirname")
    let v287 = []
    let v288 = [v282, ..v287]
    let v289 = erlang_term_apply(v284, v286, v288)
    let v291 = atom.create("unicode")
    let v293 = atom.create("characters_to_binary")
    let v294 = []
    let v295 = [v289, ..v294]
    let v296 = erlang_term_apply(v291, v293, v295)
    let v297 = erlang_term_coerce(v296)
    let v298 = { v297 } <> { "/media" }
    #(v267, v268, v269, v270, v271, v272, v273, v274, v275, v276, v277, v278, v279, v298, v281)
}
