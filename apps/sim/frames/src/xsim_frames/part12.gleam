import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/erlang/process
import gleam/int
import gleam/otp/actor
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Us45, type Uh30, type Us68, Uh30Cons, Uh30Nil, Uh3Cons, Uh3Nil, Us45Crashed, Us45Done, Us45Erred, Us68Swap}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_slice, spiral_wrap_signed, unicode_erlang_characters_to_binary}
import xsim_frames/part2.{delimited_21, method20}
import xsim_frames/part9.{hash_text_241}

pub fn method301(v0: Uh3, v1: Uh30) -> Uh30 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method301(v3, v1)
            let v6 = atom.create("spiral")
            let v7 = erlang_term_coerce(v6)
            let v8 = erlang_term_coerce(v2)
            let v10 = atom.create("source")
            let v11 = erlang_term_coerce(v10)
            let v13 = atom.create("kind")
            let v14 = erlang_term_coerce(v13)
            let v15 = erlang_term_coerce(v11)
            let v16 = erlang_term_coerce(v8)
            let v17 = []
            let v18 = [v16, ..v17]
            let v19 = [v15, ..v18]
            let v20 = erlang_term_tuple(v19)
            let v21 = erlang_term_coerce(v14)
            let v22 = erlang_term_coerce(v7)
            let v23 = []
            let v24 = [v22, ..v23]
            let v25 = [v21, ..v24]
            let v26 = erlang_term_tuple(v25)
            let v27 = []
            let v28 = [v20, ..v27]
            let v29 = [v26, ..v28]
            let v30 = erlang_term_coerce(v29)
            let v32 = atom.create("maps")
            let v34 = atom.create("from_list")
            let v35 = []
            let v36 = [v30, ..v35]
            let v37 = erlang_term_apply(v32, v34, v36)
            Uh30Cons(v37, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method302(v0: Uh30, v1: List(Dynamic)) -> List(Dynamic) {
    case v0  {
        Uh30Cons(v2, v3) -> {
            let v4 = method302(v3, v1)
            [v2, ..v4]
        }
        Uh30Nil -> v1
    }
}

pub fn items_from_303(v0: Dynamic, v1: Uh30) -> Uh30 {
    let v2 = []
    let v3 = erlang_term_coerce(v2)
    let v4 = v0 == v3
    case v4 {
        True -> v1
        False -> {
            let v5 = "erlang"
            let v6 = atom.create(v5)
            let v8 = atom.create("tl")
            let v9 = []
            let v10 = [v0, ..v9]
            let v11 = erlang_term_apply(v6, v8, v10)
            let v12 = atom.create(v5)
            let v14 = atom.create("hd")
            let v15 = []
            let v16 = [v0, ..v15]
            let v17 = erlang_term_apply(v12, v14, v16)
            let v18 = Uh30Cons(v17, v1)
            items_from_303(v11, v18)
        }
    }
}

pub fn method304(v0: Uh30, v1: Uh30) -> Uh30 {
    case v0  {
        Uh30Cons(v2, v3) -> {
            let v4 = method304(v3, v1)
            let v5 = erlang_term_coerce(v2)
            Uh30Cons(v5, v4)
        }
        Uh30Nil -> v1
    }
}

pub fn method305(v0: Uh30, v1: Int) -> Int {
    case v0  {
        Uh30Cons(v2, v3) -> {
            let v5 = atom.create("hit")
            let v6 = erlang_term_coerce(v5)
            let v7 = v2 == v6
            let v9 =
                case v7 {
                    True -> {
                        spiral_wrap_signed(v1 + 1, 32)
                    }
                    False -> v1
                }
            method305(v3, v9)
        }
        Uh30Nil -> v1
    }
}

pub fn method306(v0: Uh30, v1: Int) -> Int {
    case v0  {
        Uh30Cons(v2, v3) -> {
            let v5 = atom.create("miss")
            let v6 = erlang_term_coerce(v5)
            let v7 = v2 == v6
            let v9 =
                case v7 {
                    True -> {
                        spiral_wrap_signed(v1 + 1, 32)
                    }
                    False -> v1
                }
            method306(v3, v9)
        }
        Uh30Nil -> v1
    }
}

pub fn closure69(capt: #(String, Bool, Dynamic)) -> fn(Uh3) -> #(Us45, String) {
    fn (v3) {
        let #(v0, v1, v2) = capt
        let v5 = method301(v3, Uh30Nil)
        let v6 = []
        let v7 = method302(v5, v6)
        let v8 = erlang_term_coerce(v7)
        let v10 = atom.create("cells")
        let v11 = erlang_term_coerce(v10)
        let v12 = erlang_term_coerce(v11)
        let v13 = erlang_term_coerce(v8)
        let v14 = []
        let v15 = [v13, ..v14]
        let v16 = [v12, ..v15]
        let v17 = erlang_term_tuple(v16)
        let v18 = []
        let v19 = [v17, ..v18]
        let v20 = erlang_term_coerce(v19)
        let v21 = "maps"
        let v22 = atom.create(v21)
        let v24 = atom.create("from_list")
        let v25 = []
        let v26 = [v20, ..v25]
        let v27 = erlang_term_apply(v22, v24, v26)
        let v28 = erlang_term_coerce(v0)
        let v29 = erlang_term_coerce(v1)
        let v30 = "memo"
        let v31 = atom.create(v30)
        let v32 = erlang_term_coerce(v31)
        let v33 = []
        let v34 = [v29, ..v33]
        let v35 = [v32, ..v34]
        let v36 = erlang_term_tuple(v35)
        let v38 = atom.create("root")
        let v39 = erlang_term_coerce(v38)
        let v40 = []
        let v41 = [v28, ..v40]
        let v42 = [v39, ..v41]
        let v43 = erlang_term_tuple(v42)
        let v45 = atom.create("spiral_lib")
        let v46 = erlang_term_coerce(v45)
        let v47 = []
        let v48 = [v28, ..v47]
        let v49 = [v46, ..v48]
        let v50 = erlang_term_tuple(v49)
        let v51 = []
        let v52 = [v36, ..v51]
        let v53 = [v50, ..v52]
        let v54 = [v43, ..v53]
        let v55 = erlang_term_coerce(v54)
        let v57 = atom.create("Elixir.Spiral.Cells.Notebook")
        let v59 = atom.create("evaluate")
        let v60 = []
        let v61 = [v55, ..v60]
        let v62 = [v27, ..v61]
        let v63 = erlang_term_apply(v57, v59, v62)
        let v65 = atom.create("erlang")
        let v67 = atom.create("is_map")
        let v68 = []
        let v69 = [v63, ..v68]
        let v70 = erlang_term_apply(v65, v67, v69)
        let v71 = erlang_term_coerce(v70)
        let #(v238, v239) =
            case v71 {
                True -> {
                    let v73 = method20(v3, 0)
                    let v74 = spiral_wrap_signed(v73 - 1, 32)
                    let v75 = atom.create(v21)
                    let v76 = "new"
                    let v77 = atom.create(v76)
                    let v78 = []
                    let v79 = erlang_term_apply(v75, v77, v78)
                    let v80 = atom.create(v30)
                    let v81 = erlang_term_coerce(v80)
                    let v82 = erlang_term_coerce(v81)
                    let v83 = erlang_term_coerce(v79)
                    let v84 = atom.create(v21)
                    let v85 = "get"
                    let v86 = atom.create(v85)
                    let v87 = []
                    let v88 = [v83, ..v87]
                    let v89 = [v63, ..v88]
                    let v90 = [v82, ..v89]
                    let v91 = erlang_term_apply(v84, v86, v90)
                    let v92 = erlang_term_coerce(v91)
                    let v93 = atom.create(v21)
                    let v95 = atom.create("values")
                    let v96 = []
                    let v97 = [v92, ..v96]
                    let v98 = erlang_term_apply(v93, v95, v97)
                    let v100 = atom.create("lists")
                    let v102 = atom.create("reverse")
                    let v103 = []
                    let v104 = [v98, ..v103]
                    let v105 = erlang_term_apply(v100, v102, v104)
                    let v107 = items_from_303(v105, Uh30Nil)
                    let v109 = method304(v107, Uh30Nil)
                    let v111 = method305(v109, 0)
                    let v112 = erlang_term_coerce(1)
                    let v113 = erlang_term_coerce(v111)
                    let v114 = "counters"
                    let v115 = atom.create(v114)
                    let v116 = "add"
                    let v117 = atom.create(v116)
                    let v118 = []
                    let v119 = [v113, ..v118]
                    let v120 = [v112, ..v119]
                    let v121 = [v2, ..v120]
                    let _v122 = erlang_term_apply(v115, v117, v121)
                    let v124 = method306(v109, 0)
                    let v125 = erlang_term_coerce(2)
                    let v126 = erlang_term_coerce(v124)
                    let v127 = atom.create(v114)
                    let v128 = atom.create(v116)
                    let v129 = []
                    let v130 = [v126, ..v129]
                    let v131 = [v125, ..v130]
                    let v132 = [v2, ..v131]
                    let _v133 = erlang_term_apply(v127, v128, v132)
                    let v134 = "nil"
                    let v135 = atom.create(v134)
                    let v136 = erlang_term_coerce(v135)
                    let v137 = "status"
                    let v138 = atom.create(v137)
                    let v139 = erlang_term_coerce(v138)
                    let v140 = erlang_term_coerce(v139)
                    let v141 = erlang_term_coerce(v136)
                    let v142 = atom.create(v21)
                    let v143 = atom.create(v85)
                    let v144 = []
                    let v145 = [v141, ..v144]
                    let v146 = [v63, ..v145]
                    let v147 = [v140, ..v146]
                    let v148 = erlang_term_apply(v142, v143, v147)
                    let v149 = erlang_term_coerce(v148)
                    let v151 = atom.create("ok")
                    let v152 = erlang_term_coerce(v151)
                    let v153 = v149 == v152
                    let v156 =
                        case v153 {
                            True -> Us45Done
                            False -> Us45Erred
                        }
                    let v157 = atom.create(v134)
                    let v158 = erlang_term_coerce(v157)
                    let v159 = atom.create(v137)
                    let v160 = erlang_term_coerce(v159)
                    let v161 = erlang_term_coerce(v160)
                    let v162 = erlang_term_coerce(v158)
                    let v163 = atom.create(v21)
                    let v164 = atom.create(v85)
                    let v165 = []
                    let v166 = [v162, ..v165]
                    let v167 = [v63, ..v166]
                    let v168 = [v161, ..v167]
                    let v169 = erlang_term_apply(v163, v164, v168)
                    let v170 = erlang_term_coerce(v169)
                    let v171 = atom.create(v21)
                    let v172 = atom.create(v76)
                    let v173 = []
                    let v174 = erlang_term_apply(v171, v172, v173)
                    let v176 = atom.create("verdicts")
                    let v177 = erlang_term_coerce(v176)
                    let v178 = erlang_term_coerce(v177)
                    let v179 = erlang_term_coerce(v174)
                    let v180 = atom.create(v21)
                    let v181 = atom.create(v85)
                    let v182 = []
                    let v183 = [v179, ..v182]
                    let v184 = [v63, ..v183]
                    let v185 = [v178, ..v184]
                    let v186 = erlang_term_apply(v180, v181, v185)
                    let v187 = erlang_term_coerce(v186)
                    let v188 = atom.create(v134)
                    let v189 = erlang_term_coerce(v188)
                    let v190 = erlang_term_coerce(v74)
                    let v191 = erlang_term_coerce(v189)
                    let v192 = atom.create(v21)
                    let v193 = atom.create(v85)
                    let v194 = []
                    let v195 = [v191, ..v194]
                    let v196 = [v187, ..v195]
                    let v197 = [v190, ..v196]
                    let v198 = erlang_term_apply(v192, v193, v197)
                    let v199 = erlang_term_coerce(v198)
                    let v200 = atom.create(v21)
                    let v201 = atom.create(v76)
                    let v202 = []
                    let v203 = erlang_term_apply(v200, v201, v202)
                    let v205 = atom.create("outputs")
                    let v206 = erlang_term_coerce(v205)
                    let v207 = erlang_term_coerce(v206)
                    let v208 = erlang_term_coerce(v203)
                    let v209 = atom.create(v21)
                    let v210 = atom.create(v85)
                    let v211 = []
                    let v212 = [v208, ..v211]
                    let v213 = [v63, ..v212]
                    let v214 = [v207, ..v213]
                    let v215 = erlang_term_apply(v209, v210, v214)
                    let v216 = erlang_term_coerce(v215)
                    let v217 = atom.create(v134)
                    let v218 = erlang_term_coerce(v217)
                    let v219 = erlang_term_coerce(v74)
                    let v220 = erlang_term_coerce(v218)
                    let v221 = atom.create(v21)
                    let v222 = atom.create(v85)
                    let v223 = []
                    let v224 = [v220, ..v223]
                    let v225 = [v216, ..v224]
                    let v226 = [v219, ..v225]
                    let v227 = erlang_term_apply(v221, v222, v226)
                    let v228 = erlang_term_coerce(v227)
                    let v229 = []
                    let v230 = [v228, ..v229]
                    let v231 = [v199, ..v230]
                    let v232 = [v170, ..v231]
                    let v233 = erlang_term_tuple(v232)
                    let v234 = string.inspect(v233)
                    #(v156, v234)
                }
                False -> {
                    let v235 = string.inspect(v63)
                    let v236 = { "unexpected " } <> { v235 }
                    #(Us45Erred, v236)
                }
            }
        #(v238, v239)
    }
}

pub fn closure70(capt: #(String)) -> fn(Uh3) -> #(Us45, String) {
    fn (v1) {
        let #(v0) = capt
        let v3 = method301(v1, Uh30Nil)
        let v4 = []
        let v5 = method302(v3, v4)
        let v6 = erlang_term_coerce(v5)
        let v8 = atom.create("cells")
        let v9 = erlang_term_coerce(v8)
        let v10 = erlang_term_coerce(v9)
        let v11 = erlang_term_coerce(v6)
        let v12 = []
        let v13 = [v11, ..v12]
        let v14 = [v10, ..v13]
        let v15 = erlang_term_tuple(v14)
        let v16 = []
        let v17 = [v15, ..v16]
        let v18 = erlang_term_coerce(v17)
        let v19 = "maps"
        let v20 = atom.create(v19)
        let v22 = atom.create("from_list")
        let v23 = []
        let v24 = [v18, ..v23]
        let v25 = erlang_term_apply(v20, v22, v24)
        let v26 = erlang_term_coerce(v0)
        let v27 = erlang_term_coerce(False)
        let v29 = atom.create("memo")
        let v30 = erlang_term_coerce(v29)
        let v31 = []
        let v32 = [v27, ..v31]
        let v33 = [v30, ..v32]
        let v34 = erlang_term_tuple(v33)
        let v36 = atom.create("root")
        let v37 = erlang_term_coerce(v36)
        let v38 = []
        let v39 = [v26, ..v38]
        let v40 = [v37, ..v39]
        let v41 = erlang_term_tuple(v40)
        let v43 = atom.create("spiral_lib")
        let v44 = erlang_term_coerce(v43)
        let v45 = []
        let v46 = [v26, ..v45]
        let v47 = [v44, ..v46]
        let v48 = erlang_term_tuple(v47)
        let v49 = []
        let v50 = [v34, ..v49]
        let v51 = [v48, ..v50]
        let v52 = [v41, ..v51]
        let v53 = erlang_term_coerce(v52)
        let v55 = atom.create("Elixir.Spiral.Cells.Notebook")
        let v57 = atom.create("evaluate")
        let v58 = []
        let v59 = [v53, ..v58]
        let v60 = [v25, ..v59]
        let v61 = erlang_term_apply(v55, v57, v60)
        let v63 = atom.create("erlang")
        let v65 = atom.create("is_map")
        let v66 = []
        let v67 = [v61, ..v66]
        let v68 = erlang_term_apply(v63, v65, v67)
        let v69 = erlang_term_coerce(v68)
        let #(v179, v180) =
            case v69 {
                True -> {
                    let v71 = method20(v1, 0)
                    let v72 = spiral_wrap_signed(v71 - 1, 32)
                    let v73 = "nil"
                    let v74 = atom.create(v73)
                    let v75 = erlang_term_coerce(v74)
                    let v76 = "status"
                    let v77 = atom.create(v76)
                    let v78 = erlang_term_coerce(v77)
                    let v79 = erlang_term_coerce(v78)
                    let v80 = erlang_term_coerce(v75)
                    let v81 = atom.create(v19)
                    let v82 = "get"
                    let v83 = atom.create(v82)
                    let v84 = []
                    let v85 = [v80, ..v84]
                    let v86 = [v61, ..v85]
                    let v87 = [v79, ..v86]
                    let v88 = erlang_term_apply(v81, v83, v87)
                    let v89 = erlang_term_coerce(v88)
                    let v91 = atom.create("ok")
                    let v92 = erlang_term_coerce(v91)
                    let v93 = v89 == v92
                    let v96 =
                        case v93 {
                            True -> Us45Done
                            False -> Us45Erred
                        }
                    let v97 = atom.create(v73)
                    let v98 = erlang_term_coerce(v97)
                    let v99 = atom.create(v76)
                    let v100 = erlang_term_coerce(v99)
                    let v101 = erlang_term_coerce(v100)
                    let v102 = erlang_term_coerce(v98)
                    let v103 = atom.create(v19)
                    let v104 = atom.create(v82)
                    let v105 = []
                    let v106 = [v102, ..v105]
                    let v107 = [v61, ..v106]
                    let v108 = [v101, ..v107]
                    let v109 = erlang_term_apply(v103, v104, v108)
                    let v110 = erlang_term_coerce(v109)
                    let v111 = atom.create(v19)
                    let v112 = "new"
                    let v113 = atom.create(v112)
                    let v114 = []
                    let v115 = erlang_term_apply(v111, v113, v114)
                    let v117 = atom.create("verdicts")
                    let v118 = erlang_term_coerce(v117)
                    let v119 = erlang_term_coerce(v118)
                    let v120 = erlang_term_coerce(v115)
                    let v121 = atom.create(v19)
                    let v122 = atom.create(v82)
                    let v123 = []
                    let v124 = [v120, ..v123]
                    let v125 = [v61, ..v124]
                    let v126 = [v119, ..v125]
                    let v127 = erlang_term_apply(v121, v122, v126)
                    let v128 = erlang_term_coerce(v127)
                    let v129 = atom.create(v73)
                    let v130 = erlang_term_coerce(v129)
                    let v131 = erlang_term_coerce(v72)
                    let v132 = erlang_term_coerce(v130)
                    let v133 = atom.create(v19)
                    let v134 = atom.create(v82)
                    let v135 = []
                    let v136 = [v132, ..v135]
                    let v137 = [v128, ..v136]
                    let v138 = [v131, ..v137]
                    let v139 = erlang_term_apply(v133, v134, v138)
                    let v140 = erlang_term_coerce(v139)
                    let v141 = atom.create(v19)
                    let v142 = atom.create(v112)
                    let v143 = []
                    let v144 = erlang_term_apply(v141, v142, v143)
                    let v146 = atom.create("outputs")
                    let v147 = erlang_term_coerce(v146)
                    let v148 = erlang_term_coerce(v147)
                    let v149 = erlang_term_coerce(v144)
                    let v150 = atom.create(v19)
                    let v151 = atom.create(v82)
                    let v152 = []
                    let v153 = [v149, ..v152]
                    let v154 = [v61, ..v153]
                    let v155 = [v148, ..v154]
                    let v156 = erlang_term_apply(v150, v151, v155)
                    let v157 = erlang_term_coerce(v156)
                    let v158 = atom.create(v73)
                    let v159 = erlang_term_coerce(v158)
                    let v160 = erlang_term_coerce(v72)
                    let v161 = erlang_term_coerce(v159)
                    let v162 = atom.create(v19)
                    let v163 = atom.create(v82)
                    let v164 = []
                    let v165 = [v161, ..v164]
                    let v166 = [v157, ..v165]
                    let v167 = [v160, ..v166]
                    let v168 = erlang_term_apply(v162, v163, v167)
                    let v169 = erlang_term_coerce(v168)
                    let v170 = []
                    let v171 = [v169, ..v170]
                    let v172 = [v140, ..v171]
                    let v173 = [v110, ..v172]
                    let v174 = erlang_term_tuple(v173)
                    let v175 = string.inspect(v174)
                    #(v96, v175)
                }
                False -> {
                    let v176 = string.inspect(v61)
                    let v177 = { "unexpected " } <> { v176 }
                    #(Us45Erred, v177)
                }
            }
        #(v179, v180)
    }
}

pub fn closure72(capt: #(String)) -> fn(Us68) -> actor.Next(String, Us68) {
    fn (v1) {
        let #(v0) = capt
        case v1  {
            Us68Swap(v2, v3) -> {
                process.send(v3, v0)
                actor.continue(v2)
            }
        }
    }
}

pub fn closure71(capt: Nil) -> fn(String) -> fn(Us68) -> actor.Next(String, Us68) {
    fn (v0) {
        closure72(#(v0))
    }
}

pub fn closure73(capt: Nil) -> fn(Uh3) -> #(Us45, String) {
    fn (v0) {
        #(Us45Crashed, "leak cell did not start for xsim_leak_run")
    }
}

pub fn closure75(capt: #(String)) -> fn(process.Subject(String)) -> Us68 {
    fn (v1) {
        let #(v0) = capt
        Us68Swap(v0, v1)
    }
}

pub fn closure74(capt: #(process.Subject(Us68))) -> fn(Uh3) -> #(Us45, String) {
    fn (v1) {
        let #(v0) = capt
        let v2 = unicode_erlang_characters_to_binary([0])
        let v3 = delimited_21(v2, v1)
        let v4 = hash_text_241(v3)
        let v5 = spiral_string_slice(v4, 0, 11)
        let v6 = closure75(#(v5))
        let v7 = actor.call(v0, 10000, v6)
        let v8 = { v5 } <> { v7 }
        #(Us45Done, v8)
    }
}

pub fn closure76(capt: Nil) -> fn(Uh3) -> #(Us45, String) {
    fn (v0) {
        #(Us45Crashed, "leak cell did not start for xsim_leak_baseline")
    }
}

pub fn closure77(capt: #(String, Dynamic, String, Dynamic)) -> fn(Int) -> Uh3 {
    fn (v4) {
        let #(_v0, _v1, _v2, v3) = capt
        let v5 = erlang_term_coerce(1)
        let v6 = "counters"
        let v7 = atom.create(v6)
        let v8 = "get"
        let v9 = atom.create(v8)
        let v10 = []
        let v11 = [v5, ..v10]
        let v12 = [v3, ..v11]
        let v13 = erlang_term_apply(v7, v9, v12)
        let v14 = erlang_term_coerce(v13)
        let v15 = erlang_term_coerce(2)
        let v16 = atom.create(v6)
        let v17 = atom.create(v8)
        let v18 = []
        let v19 = [v15, ..v18]
        let v20 = [v3, ..v19]
        let v21 = erlang_term_apply(v16, v17, v20)
        let v22 = erlang_term_coerce(v21)
        let v23 = int.to_string(v14)
        let v24 = { "hits=" } <> { v23 }
        let v25 = { v24 } <> { " misses=" }
        let v26 = int.to_string(v22)
        let v27 = { v25 } <> { v26 }
        let v28 = { "  memo " } <> { v27 }
        let v29 = { v28 } <> { " cumulative_after_schedule=" }
        let v30 = int.to_string(v4)
        let v31 = { v29 } <> { v30 }
        Uh3Cons(v31, Uh3Nil)
    }
}

pub fn closure78(capt: Nil) -> fn(Int) -> Uh3 {
    fn (v0) {
        Uh3Nil
    }
}

pub fn method307(v0: Uh3, v1: Uh30) -> Uh30 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method307(v3, v1)
            let v5 = erlang_term_coerce(v2)
            let v7 = atom.create("unicode")
            let v9 = atom.create("characters_to_list")
            let v10 = []
            let v11 = [v5, ..v10]
            let v12 = erlang_term_apply(v7, v9, v11)
            Uh30Cons(v12, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn keep_c81(capt: Nil) -> fn(Dynamic) -> Dynamic {
    fn (v0) {
        v0
    }
}

pub fn gleam_collected_308(v0: process.Selector(Dynamic), v1: String) -> #(Int, String) {
    let v2 = process.selector_receive(v0, 86400000)
    let v4 = atom.create("none")
    let v5 = erlang_term_coerce(v4)
    let v6 = result.unwrap(v2, v5)
    let v7 = erlang_term_coerce(2)
    let v8 = "erlang"
    let v9 = atom.create(v8)
    let v10 = "element"
    let v11 = atom.create(v10)
    let v12 = []
    let v13 = [v6, ..v12]
    let v14 = [v7, ..v13]
    let v15 = erlang_term_apply(v9, v11, v14)
    let v16 = erlang_term_coerce(1)
    let v17 = atom.create(v8)
    let v18 = atom.create(v10)
    let v19 = []
    let v20 = [v15, ..v19]
    let v21 = [v16, ..v20]
    let v22 = erlang_term_apply(v17, v18, v21)
    let v23 = atom.create(v8)
    let v25 = atom.create("atom_to_binary")
    let v26 = []
    let v27 = [v22, ..v26]
    let v28 = erlang_term_apply(v23, v25, v27)
    let v29 = erlang_term_coerce(v28)
    let v30 = v29 == "data"
    case v30 {
        True -> {
            let v31 = erlang_term_coerce(2)
            let v32 = atom.create(v8)
            let v33 = atom.create(v10)
            let v34 = []
            let v35 = [v15, ..v34]
            let v36 = [v31, ..v35]
            let v37 = erlang_term_apply(v32, v33, v36)
            let v38 = erlang_term_coerce(v37)
            let v39 = { v1 } <> { v38 }
            gleam_collected_308(v0, v39)
        }
        False -> {
            let v42 = v29 == "exit_status"
            case v42 {
                True -> {
                    let v43 = erlang_term_coerce(2)
                    let v44 = atom.create(v8)
                    let v45 = atom.create(v10)
                    let v46 = []
                    let v47 = [v15, ..v46]
                    let v48 = [v43, ..v47]
                    let v49 = erlang_term_apply(v44, v45, v48)
                    let v50 = erlang_term_coerce(v49)
                    #(v50, v1)
                }
                False -> gleam_collected_308(v0, v1)
            }
        }
    }
}
