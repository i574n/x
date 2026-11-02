import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Uh38, type Uh40, Uh29Cons, Uh29Nil, Uh37Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil, Uh40Cons, Uh40Nil}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple}
import xsim_frames/part13.{method300}
import xsim_frames/part27.{items_from_443, method449}
import xsim_frames/part28.{method465, method466}
import xsim_frames/part30.{deduped_515, included_authors_507, method510, method511, method512, method513, method526, method527, method529, method530, simple_pairs_518}

pub fn counted_pairs_528(v0: Dynamic, v1: Uh3) -> Uh38 {
    let v2 = method511()
    let v3 = method512(v2, v1)
    let v29 =
        case v3 {
            True -> {
                let v4 = []
                let v5 = erlang_term_coerce(v4)
                let v6 = "refs"
                let v7 = erlang_term_coerce(v6)
                let v8 = erlang_term_coerce(v5)
                let v9 = "maps"
                let v10 = atom.create(v9)
                let v11 = "get"
                let v12 = atom.create(v11)
                let v13 = []
                let v14 = [v8, ..v13]
                let v15 = [v0, ..v14]
                let v16 = [v7, ..v15]
                let v17 = erlang_term_apply(v10, v12, v16)
                let v18 = erlang_term_coerce(v17)
                let v19 = "lists"
                let v20 = atom.create(v19)
                let v21 = "reverse"
                let v22 = atom.create(v21)
                let v23 = []
                let v24 = [v18, ..v23]
                let v25 = erlang_term_apply(v20, v22, v24)
                let v26 = Uh29Nil
                let v27 = items_from_443(v25, v26)
                case v27  {
                    Uh29Nil -> False
                    _ -> True
                }
            }
            False -> False
        }
    let v30 = []
    let v31 = erlang_term_coerce(v30)
    let v32 = "refs"
    let v33 = erlang_term_coerce(v32)
    let v34 = erlang_term_coerce(v31)
    let v35 = "maps"
    let v36 = atom.create(v35)
    let v37 = "get"
    let v38 = atom.create(v37)
    let v39 = []
    let v40 = [v34, ..v39]
    let v41 = [v0, ..v40]
    let v42 = [v33, ..v41]
    let v43 = erlang_term_apply(v36, v38, v42)
    let v44 = erlang_term_coerce(v43)
    let v49 =
        case v29 {
            True -> {
                let v45 = "referenced_posts"
                let v46 = Uh38Nil
                Uh38Cons(v45, v44, v46)
            }
            False -> Uh38Nil
        }
    let v50 = []
    let v51 = erlang_term_coerce(v50)
    let v52 = atom.create(v35)
    let v53 = "from_list"
    let v54 = atom.create(v53)
    let v55 = []
    let v56 = [v51, ..v55]
    let v57 = erlang_term_apply(v52, v54, v56)
    let v58 = "metrics"
    let v59 = erlang_term_coerce(v58)
    let v60 = erlang_term_coerce(v57)
    let v61 = atom.create(v35)
    let v62 = atom.create(v37)
    let v63 = []
    let v64 = [v60, ..v63]
    let v65 = [v0, ..v64]
    let v66 = [v59, ..v65]
    let v67 = erlang_term_apply(v61, v62, v66)
    let v68 = erlang_term_coerce(v67)
    let v69 = erlang_term_coerce(0)
    let v70 = "repost_count"
    let v71 = erlang_term_coerce(v70)
    let v72 = erlang_term_coerce(v69)
    let v73 = atom.create(v35)
    let v74 = atom.create(v37)
    let v75 = []
    let v76 = [v72, ..v75]
    let v77 = [v68, ..v76]
    let v78 = [v71, ..v77]
    let v79 = erlang_term_apply(v73, v74, v78)
    let v80 = erlang_term_coerce(v79)
    let v81 = erlang_term_coerce(0)
    let v82 = "reply_count"
    let v83 = erlang_term_coerce(v82)
    let v84 = erlang_term_coerce(v81)
    let v85 = atom.create(v35)
    let v86 = atom.create(v37)
    let v87 = []
    let v88 = [v84, ..v87]
    let v89 = [v68, ..v88]
    let v90 = [v83, ..v89]
    let v91 = erlang_term_apply(v85, v86, v90)
    let v92 = erlang_term_coerce(v91)
    let v93 = erlang_term_coerce(0)
    let v94 = "quote_count"
    let v95 = erlang_term_coerce(v94)
    let v96 = erlang_term_coerce(v93)
    let v97 = atom.create(v35)
    let v98 = atom.create(v37)
    let v99 = []
    let v100 = [v96, ..v99]
    let v101 = [v68, ..v100]
    let v102 = [v95, ..v101]
    let v103 = erlang_term_apply(v97, v98, v102)
    let v104 = erlang_term_coerce(v103)
    let v105 = erlang_term_coerce(0)
    let v106 = "like_count"
    let v107 = erlang_term_coerce(v106)
    let v108 = erlang_term_coerce(v105)
    let v109 = atom.create(v35)
    let v110 = atom.create(v37)
    let v111 = []
    let v112 = [v108, ..v111]
    let v113 = [v68, ..v112]
    let v114 = [v107, ..v113]
    let v115 = erlang_term_apply(v109, v110, v114)
    let v116 = erlang_term_coerce(v115)
    let v117 = erlang_term_coerce(0)
    let v118 = "impression_count"
    let v119 = erlang_term_coerce(v118)
    let v120 = erlang_term_coerce(v117)
    let v121 = atom.create(v35)
    let v122 = atom.create(v37)
    let v123 = []
    let v124 = [v120, ..v123]
    let v125 = [v68, ..v124]
    let v126 = [v119, ..v125]
    let v127 = erlang_term_apply(v121, v122, v126)
    let v128 = erlang_term_coerce(v127)
    let v129 = erlang_term_coerce(0)
    let v130 = "bookmark_count"
    let v131 = erlang_term_coerce(v130)
    let v132 = erlang_term_coerce(v129)
    let v133 = atom.create(v35)
    let v134 = atom.create(v37)
    let v135 = []
    let v136 = [v132, ..v135]
    let v137 = [v68, ..v136]
    let v138 = [v131, ..v137]
    let v139 = erlang_term_apply(v133, v134, v138)
    let v140 = erlang_term_coerce(v139)
    let v141 = atom.create(v70)
    let v142 = erlang_term_coerce(v141)
    let v143 = []
    let v144 = [v80, ..v143]
    let v145 = [v142, ..v144]
    let v146 = erlang_term_tuple(v145)
    let v147 = atom.create(v82)
    let v148 = erlang_term_coerce(v147)
    let v149 = []
    let v150 = [v92, ..v149]
    let v151 = [v148, ..v150]
    let v152 = erlang_term_tuple(v151)
    let v153 = atom.create(v94)
    let v154 = erlang_term_coerce(v153)
    let v155 = []
    let v156 = [v104, ..v155]
    let v157 = [v154, ..v156]
    let v158 = erlang_term_tuple(v157)
    let v159 = atom.create(v106)
    let v160 = erlang_term_coerce(v159)
    let v161 = []
    let v162 = [v116, ..v161]
    let v163 = [v160, ..v162]
    let v164 = erlang_term_tuple(v163)
    let v165 = atom.create(v118)
    let v166 = erlang_term_coerce(v165)
    let v167 = []
    let v168 = [v128, ..v167]
    let v169 = [v166, ..v168]
    let v170 = erlang_term_tuple(v169)
    let v171 = atom.create(v130)
    let v172 = erlang_term_coerce(v171)
    let v173 = []
    let v174 = [v140, ..v173]
    let v175 = [v172, ..v174]
    let v176 = erlang_term_tuple(v175)
    let v177 = []
    let v178 = [v146, ..v177]
    let v179 = [v152, ..v178]
    let v180 = [v158, ..v179]
    let v181 = [v164, ..v180]
    let v182 = [v170, ..v181]
    let v183 = [v176, ..v182]
    let v184 = erlang_term_coerce(v183)
    let v185 = atom.create(v35)
    let v186 = atom.create(v53)
    let v187 = []
    let v188 = [v184, ..v187]
    let v189 = erlang_term_apply(v185, v186, v188)
    let v190 = method529()
    let v191 = method530(v190, v1)
    let v196 =
        case v191 {
            True -> {
                let v192 = "public_metrics"
                let v193 = Uh38Nil
                Uh38Cons(v192, v189, v193)
            }
            False -> Uh38Nil
        }
    method465(v196, v49)
}

pub fn closure158(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "attachments"
        v1
    }
}

pub fn method531() -> fn(String) -> Bool {
    closure158(Nil)
}

pub fn method532(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method531()
                    method532(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn method533(v0: Uh29, v1: Uh29) -> Uh29 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method533(v3, v1)
            let v5 = ""
            let v6 = erlang_term_coerce(v5)
            let v7 = "media_key"
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
            Uh29Cons(v19, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn nested_pairs_525(v0: Dynamic, v1: Uh3) -> Uh38 {
    let v2 = method526()
    let v3 = method527(v2, v1)
    let v29 =
        case v3 {
            True -> {
                let v4 = []
                let v5 = erlang_term_coerce(v4)
                let v6 = "urls"
                let v7 = erlang_term_coerce(v6)
                let v8 = erlang_term_coerce(v5)
                let v9 = "maps"
                let v10 = atom.create(v9)
                let v11 = "get"
                let v12 = atom.create(v11)
                let v13 = []
                let v14 = [v8, ..v13]
                let v15 = [v0, ..v14]
                let v16 = [v7, ..v15]
                let v17 = erlang_term_apply(v10, v12, v16)
                let v18 = erlang_term_coerce(v17)
                let v19 = "lists"
                let v20 = atom.create(v19)
                let v21 = "reverse"
                let v22 = atom.create(v21)
                let v23 = []
                let v24 = [v18, ..v23]
                let v25 = erlang_term_apply(v20, v22, v24)
                let v26 = Uh29Nil
                let v27 = items_from_443(v25, v26)
                case v27  {
                    Uh29Nil -> False
                    _ -> True
                }
            }
            False -> False
        }
    let v30 = []
    let v31 = erlang_term_coerce(v30)
    let v32 = "urls"
    let v33 = erlang_term_coerce(v32)
    let v34 = erlang_term_coerce(v31)
    let v35 = "maps"
    let v36 = atom.create(v35)
    let v37 = "get"
    let v38 = atom.create(v37)
    let v39 = []
    let v40 = [v34, ..v39]
    let v41 = [v0, ..v40]
    let v42 = [v33, ..v41]
    let v43 = erlang_term_apply(v36, v38, v42)
    let v44 = erlang_term_coerce(v43)
    let v45 = atom.create(v32)
    let v46 = erlang_term_coerce(v45)
    let v47 = []
    let v48 = [v44, ..v47]
    let v49 = [v46, ..v48]
    let v50 = erlang_term_tuple(v49)
    let v51 = []
    let v52 = [v50, ..v51]
    let v53 = erlang_term_coerce(v52)
    let v54 = atom.create(v35)
    let v55 = "from_list"
    let v56 = atom.create(v55)
    let v57 = []
    let v58 = [v53, ..v57]
    let v59 = erlang_term_apply(v54, v56, v58)
    let v64 =
        case v29 {
            True -> {
                let v60 = "entities"
                let v61 = Uh38Nil
                Uh38Cons(v60, v59, v61)
            }
            False -> Uh38Nil
        }
    let v65 = counted_pairs_528(v0, v1)
    let v66 = method531()
    let v67 = method532(v66, v1)
    let v91 =
        case v67 {
            True -> {
                let v68 = []
                let v69 = erlang_term_coerce(v68)
                let v70 = "media"
                let v71 = erlang_term_coerce(v70)
                let v72 = erlang_term_coerce(v69)
                let v73 = atom.create(v35)
                let v74 = atom.create(v37)
                let v75 = []
                let v76 = [v72, ..v75]
                let v77 = [v0, ..v76]
                let v78 = [v71, ..v77]
                let v79 = erlang_term_apply(v73, v74, v78)
                let v80 = erlang_term_coerce(v79)
                let v81 = "lists"
                let v82 = atom.create(v81)
                let v83 = "reverse"
                let v84 = atom.create(v83)
                let v85 = []
                let v86 = [v80, ..v85]
                let v87 = erlang_term_apply(v82, v84, v86)
                let v88 = Uh29Nil
                let v89 = items_from_443(v87, v88)
                case v89  {
                    Uh29Nil -> False
                    _ -> True
                }
            }
            False -> False
        }
    let v92 = []
    let v93 = erlang_term_coerce(v92)
    let v94 = "media"
    let v95 = erlang_term_coerce(v94)
    let v96 = erlang_term_coerce(v93)
    let v97 = atom.create(v35)
    let v98 = atom.create(v37)
    let v99 = []
    let v100 = [v96, ..v99]
    let v101 = [v0, ..v100]
    let v102 = [v95, ..v101]
    let v103 = erlang_term_apply(v97, v98, v102)
    let v104 = erlang_term_coerce(v103)
    let v105 = "lists"
    let v106 = atom.create(v105)
    let v107 = "reverse"
    let v108 = atom.create(v107)
    let v109 = []
    let v110 = [v104, ..v109]
    let v111 = erlang_term_apply(v106, v108, v110)
    let v112 = Uh29Nil
    let v113 = items_from_443(v111, v112)
    let v114 = Uh29Nil
    let v115 = method533(v113, v114)
    let v116 = []
    let v117 = method300(v115, v116)
    let v118 = erlang_term_coerce(v117)
    let v119 = "media_keys"
    let v120 = atom.create(v119)
    let v121 = erlang_term_coerce(v120)
    let v122 = []
    let v123 = [v118, ..v122]
    let v124 = [v121, ..v123]
    let v125 = erlang_term_tuple(v124)
    let v126 = []
    let v127 = [v125, ..v126]
    let v128 = erlang_term_coerce(v127)
    let v129 = atom.create(v35)
    let v130 = atom.create(v55)
    let v131 = []
    let v132 = [v128, ..v131]
    let v133 = erlang_term_apply(v129, v130, v132)
    let v138 =
        case v91 {
            True -> {
                let v134 = "attachments"
                let v135 = Uh38Nil
                Uh38Cons(v134, v133, v135)
            }
            False -> Uh38Nil
        }
    let v139 = Uh38Nil
    let v140 = method465(v138, v139)
    let v141 = method465(v64, v140)
    method465(v65, v141)
}

pub fn rendered_517(v0: Dynamic, v1: Uh3) -> Dynamic {
    let v2 = ""
    let v3 = erlang_term_coerce(v2)
    let v4 = "id"
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
    let v17 = erlang_term_coerce(v2)
    let v18 = "text"
    let v19 = erlang_term_coerce(v18)
    let v20 = erlang_term_coerce(v17)
    let v21 = atom.create(v7)
    let v22 = atom.create(v9)
    let v23 = []
    let v24 = [v20, ..v23]
    let v25 = [v0, ..v24]
    let v26 = [v19, ..v25]
    let v27 = erlang_term_apply(v21, v22, v26)
    let v28 = erlang_term_coerce(v27)
    let v29 = erlang_term_coerce(v28)
    let v30 = "&"
    let v31 = "&amp;"
    let v32 = v29 |> string.replace(v30, v31)
    let v33 = "<"
    let v34 = "&lt;"
    let v35 = v32 |> string.replace(v33, v34)
    let v36 = ">"
    let v37 = "&gt;"
    let v38 = v35 |> string.replace(v36, v37)
    let v39 = erlang_term_coerce(v38)
    let v40 = erlang_term_coerce(v2)
    let v41 = erlang_term_coerce(v4)
    let v42 = erlang_term_coerce(v40)
    let v43 = atom.create(v7)
    let v44 = atom.create(v9)
    let v45 = []
    let v46 = [v42, ..v45]
    let v47 = [v0, ..v46]
    let v48 = [v41, ..v47]
    let v49 = erlang_term_apply(v43, v44, v48)
    let v50 = erlang_term_coerce(v49)
    let v51 = []
    let v52 = [v50, ..v51]
    let v53 = erlang_term_coerce(v52)
    let v54 = "edit_history"
    let v55 = erlang_term_coerce(v54)
    let v56 = erlang_term_coerce(v53)
    let v57 = atom.create(v7)
    let v58 = atom.create(v9)
    let v59 = []
    let v60 = [v56, ..v59]
    let v61 = [v0, ..v60]
    let v62 = [v55, ..v61]
    let v63 = erlang_term_apply(v57, v58, v62)
    let v64 = erlang_term_coerce(v63)
    let v65 = simple_pairs_518(v0, v1)
    let v66 = nested_pairs_525(v0, v1)
    let v67 = Uh38Nil
    let v68 = method465(v66, v67)
    let v69 = method465(v65, v68)
    let v70 = Uh29Nil
    let v71 = method466(v69, v70)
    let v72 = "edit_history_post_ids"
    let v73 = atom.create(v72)
    let v74 = erlang_term_coerce(v73)
    let v75 = []
    let v76 = [v64, ..v75]
    let v77 = [v74, ..v76]
    let v78 = erlang_term_tuple(v77)
    let v79 = atom.create(v18)
    let v80 = erlang_term_coerce(v79)
    let v81 = []
    let v82 = [v39, ..v81]
    let v83 = [v80, ..v82]
    let v84 = erlang_term_tuple(v83)
    let v85 = atom.create(v4)
    let v86 = erlang_term_coerce(v85)
    let v87 = []
    let v88 = [v16, ..v87]
    let v89 = [v86, ..v88]
    let v90 = erlang_term_tuple(v89)
    let v91 = []
    let v92 = method300(v71, v91)
    let v93 = [v78, ..v92]
    let v94 = [v84, ..v93]
    let v95 = [v90, ..v94]
    let v96 = erlang_term_coerce(v95)
    let v97 = atom.create(v7)
    let v98 = "from_list"
    let v99 = atom.create(v98)
    let v100 = []
    let v101 = [v96, ..v100]
    let v102 = erlang_term_apply(v97, v99, v101)
    v102
}

pub fn method516(v0: Uh3, v1: Uh3, v2: Uh3, v3: Uh29, v4: Uh38) -> Uh38 {
    case v3  {
        Uh29Cons(v5, v6) -> {
            let v7 = method516(v0, v1, v2, v6, v4)
            let v8 = ""
            let v9 = erlang_term_coerce(v8)
            let v10 = "id"
            let v11 = erlang_term_coerce(v10)
            let v12 = erlang_term_coerce(v9)
            let v13 = "maps"
            let v14 = atom.create(v13)
            let v15 = "get"
            let v16 = atom.create(v15)
            let v17 = []
            let v18 = [v12, ..v17]
            let v19 = [v5, ..v18]
            let v20 = [v11, ..v19]
            let v21 = erlang_term_apply(v14, v16, v20)
            let v22 = erlang_term_coerce(v21)
            let v23 = "erlang"
            let v24 = atom.create(v23)
            let v25 = "is_binary"
            let v26 = atom.create(v25)
            let v27 = []
            let v28 = [v22, ..v27]
            let v29 = erlang_term_apply(v24, v26, v28)
            let v30 = erlang_term_coerce(v29)
            let v39 =
                case v30 {
                    True -> {
                        let v31 = erlang_term_coerce(v22)
                        v31
                    }
                    False -> {
                        let v32 = atom.create(v23)
                        let v33 = "integer_to_binary"
                        let v34 = atom.create(v33)
                        let v35 = []
                        let v36 = [v22, ..v35]
                        let v37 = erlang_term_apply(v32, v34, v36)
                        let v38 = erlang_term_coerce(v37)
                        v38
                    }
                }
            let v40 = rendered_517(v5, v0)
            Uh38Cons(v39, v40, v7)
        }
        Uh29Nil -> v4
    }
}

pub fn closure159(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = v0 == "attachments.media_keys"
        v1
    }
}

pub fn method535() -> fn(String) -> Bool {
    closure159(Nil)
}

pub fn method536(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method535()
                    method536(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn method539(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method539(v3, v1)
            let v5 = erlang_term_coerce(v2)
            Uh3Cons(v5, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn closure160(capt: #(String)) -> fn(String) -> Bool {
    fn (v1) {
        let #(v0) = capt
        let v2 = v1 == v0
        v2
    }
}

pub fn method541(v0: String) -> fn(String) -> Bool {
    closure160(#(v0))
}

pub fn method542(v0: String, v1: fn(String) -> Bool, v2: Uh3) -> Bool {
    case v2  {
        Uh3Cons(v3, v4) -> {
            let v5 = v1(v3)
            case v5 {
                True -> True
                False -> {
                    let v6 = method541(v0)
                    method542(v0, v6, v4)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn method540(v0: Uh3, v1: Uh3, v2: Uh3, v3: Uh3, v4: Uh3) -> Uh3 {
    case v3  {
        Uh3Cons(v5, v6) -> {
            let v7 = method540(v0, v1, v2, v6, v4)
            let v8 = v5 == "media_key"
            let v11 =
                case v8 {
                    True -> True
                    False -> {
                        let v9 = method541(v5)
                        method542(v5, v9, v2)
                    }
                }
            case v11 {
                True -> Uh3Cons(v5, v7)
                False -> v7
            }
        }
        Uh3Nil -> v4
    }
}

pub fn method543(v0: Dynamic, v1: Uh3, v2: Uh38) -> Uh38 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method543(v0, v4, v2)
            let v6 = ""
            let v7 = erlang_term_coerce(v6)
            let v8 = erlang_term_coerce(v3)
            let v9 = erlang_term_coerce(v7)
            let v10 = "maps"
            let v11 = atom.create(v10)
            let v12 = "get"
            let v13 = atom.create(v12)
            let v14 = []
            let v15 = [v9, ..v14]
            let v16 = [v0, ..v15]
            let v17 = [v8, ..v16]
            let v18 = erlang_term_apply(v11, v13, v17)
            let v19 = erlang_term_coerce(v18)
            Uh38Cons(v3, v19, v5)
        }
        Uh3Nil -> v2
    }
}

pub fn method538(v0: Uh3, v1: Uh3, v2: Uh3, v3: Uh29, v4: Uh38) -> Uh38 {
    case v3  {
        Uh29Cons(v5, v6) -> {
            let v7 = method538(v0, v1, v2, v6, v4)
            let v8 = ""
            let v9 = erlang_term_coerce(v8)
            let v10 = "media_key"
            let v11 = erlang_term_coerce(v10)
            let v12 = erlang_term_coerce(v9)
            let v13 = "maps"
            let v14 = atom.create(v13)
            let v15 = "get"
            let v16 = atom.create(v15)
            let v17 = []
            let v18 = [v12, ..v17]
            let v19 = [v5, ..v18]
            let v20 = [v11, ..v19]
            let v21 = erlang_term_apply(v14, v16, v20)
            let v22 = erlang_term_coerce(v21)
            let v23 = erlang_term_coerce(v22)
            let v24 = atom.create(v13)
            let v25 = "keys"
            let v26 = atom.create(v25)
            let v27 = []
            let v28 = [v5, ..v27]
            let v29 = erlang_term_apply(v24, v26, v28)
            let v30 = "lists"
            let v31 = atom.create(v30)
            let v32 = "reverse"
            let v33 = atom.create(v32)
            let v34 = []
            let v35 = [v29, ..v34]
            let v36 = erlang_term_apply(v31, v33, v35)
            let v37 = Uh29Nil
            let v38 = items_from_443(v36, v37)
            let v39 = Uh3Nil
            let v40 = method539(v38, v39)
            let v41 = Uh3Nil
            let v42 = method540(v0, v1, v2, v40, v41)
            let v43 = Uh38Nil
            let v44 = method543(v5, v42, v43)
            let v45 = Uh29Nil
            let v46 = method466(v44, v45)
            let v47 = []
            let v48 = method300(v46, v47)
            let v49 = erlang_term_coerce(v48)
            let v50 = atom.create(v13)
            let v51 = "from_list"
            let v52 = atom.create(v51)
            let v53 = []
            let v54 = [v49, ..v53]
            let v55 = erlang_term_apply(v50, v52, v54)
            Uh38Cons(v23, v55, v7)
        }
        Uh29Nil -> v4
    }
}

pub fn method537(v0: Uh3, v1: Uh3, v2: Uh3, v3: Uh29, v4: Uh40) -> Uh40 {
    case v3  {
        Uh29Cons(v5, v6) -> {
            let v7 = method537(v0, v1, v2, v6, v4)
            let v8 = []
            let v9 = erlang_term_coerce(v8)
            let v10 = "media"
            let v11 = erlang_term_coerce(v10)
            let v12 = erlang_term_coerce(v9)
            let v13 = "maps"
            let v14 = atom.create(v13)
            let v15 = "get"
            let v16 = atom.create(v15)
            let v17 = []
            let v18 = [v12, ..v17]
            let v19 = [v5, ..v18]
            let v20 = [v11, ..v19]
            let v21 = erlang_term_apply(v14, v16, v20)
            let v22 = erlang_term_coerce(v21)
            let v23 = "lists"
            let v24 = atom.create(v23)
            let v25 = "reverse"
            let v26 = atom.create(v25)
            let v27 = []
            let v28 = [v22, ..v27]
            let v29 = erlang_term_apply(v24, v26, v28)
            let v30 = Uh29Nil
            let v31 = items_from_443(v29, v30)
            let v32 = Uh38Nil
            let v33 = method538(v0, v1, v2, v31, v32)
            Uh40Cons(v33, v7)
        }
        Uh29Nil -> v4
    }
}

pub fn method544(v0: Uh40, v1: Uh38) -> Uh38 {
    case v0  {
        Uh40Cons(v2, v3) -> {
            let v4 = method544(v3, v1)
            method465(v2, v4)
        }
        Uh40Nil -> v1
    }
}

pub fn included_media_534(v0: Uh3, v1: Uh3, v2: Uh3, v3: Uh29) -> Uh38 {
    let v4 = method535()
    let v5 = method536(v4, v1)
    case v5 {
        True -> {
            let v6 = Uh40Nil
            let v7 = method537(v0, v1, v2, v3, v6)
            let v8 = Uh38Nil
            method544(v7, v8)
        }
        False -> Uh38Nil
    }
}

pub fn includes_pairs_506(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh3, v13: Uh3, v14: Uh3, v15: Uh29) -> Uh38 {
    let v16 = included_authors_507(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15)
    let v17 = dict.new()
    let v18 = deduped_515(v17, v16)
    let v26 =
        case v18  {
            Uh29Nil -> Uh38Nil
            _ -> {
                let v20 = []
                let v21 = method300(v18, v20)
                let v22 = erlang_term_coerce(v21)
                let v23 = "users"
                let v24 = Uh38Nil
                Uh38Cons(v23, v22, v24)
            }
        }
    let v27 = Uh29Nil
    let v28 = method510(v12, v13, v14, v15, v27)
    let v29 = Uh37Nil
    let v30 = method513(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v28, v29)
    let v31 = Uh29Nil
    let v32 = method449(v30, v31)
    let v33 = Uh38Nil
    let v34 = method516(v12, v13, v14, v32, v33)
    let v35 = dict.new()
    let v36 = deduped_515(v35, v34)
    let v44 =
        case v36  {
            Uh29Nil -> Uh38Nil
            _ -> {
                let v38 = []
                let v39 = method300(v36, v38)
                let v40 = erlang_term_coerce(v39)
                let v41 = "posts"
                let v42 = Uh38Nil
                Uh38Cons(v41, v40, v42)
            }
        }
    let v45 = included_media_534(v12, v13, v14, v15)
    let v46 = dict.new()
    let v47 = deduped_515(v46, v45)
    let v55 =
        case v47  {
            Uh29Nil -> Uh38Nil
            _ -> {
                let v49 = []
                let v50 = method300(v47, v49)
                let v51 = erlang_term_coerce(v50)
                let v52 = "media"
                let v53 = Uh38Nil
                Uh38Cons(v52, v51, v53)
            }
        }
    let v56 = Uh38Nil
    let v57 = method465(v55, v56)
    let v58 = method465(v26, v57)
    method465(v44, v58)
}
