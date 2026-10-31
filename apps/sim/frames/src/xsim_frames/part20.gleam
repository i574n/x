import gleam/dict
import gleam/erlang/atom
import gleam/list
import gleam/otp/actor
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Us2, type Us12, type Us13, type Uh6, type Uh8, type Uh15, type Us29, type Us30, type Us45, type Uh28, type Uh34, type Uh35, Uh0Nil, Uh1Nil, Uh2Nil, Uh32Nil, Uh34Cons, Uh34Nil, Uh35Cons, Uh35Nil, Uh3Cons, Uh3Nil, Uh6Cons, Uh6Nil, Uh7Nil, Uh8Nil, Us12Broken, Us12Held, Us29CellsExecutor, Us29FakeExecutor, Us29LeakingExecutor, Us30NoEviction, Us33Error, Us33Ok, Us36RunParsed, Us36RunRejected, Us69None, Us69Some, Us70Tick, Us74None, Us74Some}
import xsim_frames/part1.{dictm_term_sorted, erlang_term_apply, erlang_term_coerce, method4, spiral_fs_coerce, spiral_fs_write_file, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part10.{closure32, closure35, closure36, closure37, flags_parsed_236, quiet_c38}
import xsim_frames/part13.{closure39, closure69, closure72, method295}
import xsim_frames/part14.{closure73, closure75, closure76, closure78, closure79, closure80, closure81, closure84, closure86}
import xsim_frames/part15.{closure87, closure89, closure90, closure91}
import xsim_frames/part17.{closure92, method369, method373, method374}
import xsim_frames/part19.{method384, method385, method386, outcomes_from_364}
import xsim_frames/part2.{concat_balanced_22, delimited_21, method18, method20, method30, taken_31}
import xsim_frames/part3.{closure0, closure5, closure7, closure9, method45, method48, method54, method55, method60}
import xsim_frames/part5.{closure10, closure12, from_corpus_61}
import xsim_frames/part6.{closure13, closure14, closure15, exploded_139}
import xsim_frames/part9.{closure19, closure27, closure28, closure30}

pub fn commuted_runs_387(v0: Uh34) -> Us12 {
    case v0  {
        Uh34Cons(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37) -> {
            case v37  {
                Uh34Cons(v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74) -> {
                    let v75 = dict.keys(v30)
                    let v76 = dictm_term_sorted(v75)
                    let v77 = Uh3Nil
                    let listm_fold = v76 |> list.fold (v77, fn (acc, x) {
                    let v78 = x
                    let v79 = acc
                    let v80 = Uh3Cons(v78, v79)
                    v80
                    })
                    let v81 = listm_fold
                    let v82 = Uh3Nil
                    let v83 = method4(v81, v82)
                    let v84 = Uh0Nil
                    let v85 = method369(v30, v83, v84)
                    let v86 = dict.new()
                    let v87 = dict.keys(v7)
                    let v88 = dictm_term_sorted(v87)
                    let v89 = Uh3Nil
                    let listm_fold = v88 |> list.fold (v89, fn (acc, x) {
                    let v90 = x
                    let v91 = acc
                    let v92 = Uh3Cons(v90, v91)
                    v92
                    })
                    let v93 = listm_fold
                    let v94 = Uh3Nil
                    let v95 = method4(v93, v94)
                    let v96 = method295(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v7, v95, v86)
                    let v97 = dict.keys(v96)
                    let v98 = dictm_term_sorted(v97)
                    let v99 = Uh3Nil
                    let listm_fold = v98 |> list.fold (v99, fn (acc, x) {
                    let v100 = x
                    let v101 = acc
                    let v102 = Uh3Cons(v100, v101)
                    v102
                    })
                    let v103 = listm_fold
                    let v104 = Uh3Nil
                    let v105 = method4(v103, v104)
                    let v106 = Uh1Nil
                    let _v107 = method373(v96, v105, v106)
                    let v108 = dict.keys(v22)
                    let v109 = dictm_term_sorted(v108)
                    let v110 = Uh3Nil
                    let listm_fold = v109 |> list.fold (v110, fn (acc, x) {
                    let v111 = x
                    let v112 = acc
                    let v113 = Uh3Cons(v111, v112)
                    v113
                    })
                    let v114 = listm_fold
                    let v115 = Uh3Nil
                    let v116 = method4(v114, v115)
                    let v117 = Uh2Nil
                    let _v118 = method374(v22, v116, v117)
                    let v119 = dict.keys(v23)
                    let v120 = dictm_term_sorted(v119)
                    let v121 = Uh3Nil
                    let listm_fold = v120 |> list.fold (v121, fn (acc, x) {
                    let v122 = x
                    let v123 = acc
                    let v124 = Uh3Cons(v122, v123)
                    v124
                    })
                    let v125 = listm_fold
                    let v126 = Uh3Nil
                    let v127 = method4(v125, v126)
                    let v128 = Uh2Nil
                    let _v129 = method374(v23, v127, v128)
                    let v130 = dict.keys(v24)
                    let v131 = dictm_term_sorted(v130)
                    let v132 = Uh3Nil
                    let listm_fold = v131 |> list.fold (v132, fn (acc, x) {
                    let v133 = x
                    let v134 = acc
                    let v135 = Uh3Cons(v133, v134)
                    v135
                    })
                    let v136 = listm_fold
                    let v137 = Uh3Nil
                    let v138 = method4(v136, v137)
                    let v139 = Uh2Nil
                    let _v140 = method374(v24, v138, v139)
                    let v141 = dict.keys(v16)
                    let v142 = dictm_term_sorted(v141)
                    let v143 = Uh3Nil
                    let listm_fold = v142 |> list.fold (v143, fn (acc, x) {
                    let v144 = x
                    let v145 = acc
                    let v146 = Uh3Cons(v144, v145)
                    v146
                    })
                    let _v147 = listm_fold
                    let v149 = dict.keys(v67)
                    let v150 = dictm_term_sorted(v149)
                    let v151 = Uh3Nil
                    let listm_fold = v150 |> list.fold (v151, fn (acc, x) {
                    let v152 = x
                    let v153 = acc
                    let v154 = Uh3Cons(v152, v153)
                    v154
                    })
                    let v155 = listm_fold
                    let v156 = Uh3Nil
                    let v157 = method4(v155, v156)
                    let v158 = Uh0Nil
                    let v159 = method369(v67, v157, v158)
                    let v160 = dict.new()
                    let v161 = dict.keys(v44)
                    let v162 = dictm_term_sorted(v161)
                    let v163 = Uh3Nil
                    let listm_fold = v162 |> list.fold (v163, fn (acc, x) {
                    let v164 = x
                    let v165 = acc
                    let v166 = Uh3Cons(v164, v165)
                    v166
                    })
                    let v167 = listm_fold
                    let v168 = Uh3Nil
                    let v169 = method4(v167, v168)
                    let v170 = method295(v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v44, v169, v160)
                    let v171 = dict.keys(v170)
                    let v172 = dictm_term_sorted(v171)
                    let v173 = Uh3Nil
                    let listm_fold = v172 |> list.fold (v173, fn (acc, x) {
                    let v174 = x
                    let v175 = acc
                    let v176 = Uh3Cons(v174, v175)
                    v176
                    })
                    let v177 = listm_fold
                    let v178 = Uh3Nil
                    let v179 = method4(v177, v178)
                    let v180 = Uh1Nil
                    let v181 = method373(v170, v179, v180)
                    let v182 = dict.keys(v59)
                    let v183 = dictm_term_sorted(v182)
                    let v184 = Uh3Nil
                    let listm_fold = v183 |> list.fold (v184, fn (acc, x) {
                    let v185 = x
                    let v186 = acc
                    let v187 = Uh3Cons(v185, v186)
                    v187
                    })
                    let v188 = listm_fold
                    let v189 = Uh3Nil
                    let v190 = method4(v188, v189)
                    let v191 = Uh2Nil
                    let v192 = method374(v59, v190, v191)
                    let v193 = dict.keys(v60)
                    let v194 = dictm_term_sorted(v193)
                    let v195 = Uh3Nil
                    let listm_fold = v194 |> list.fold (v195, fn (acc, x) {
                    let v196 = x
                    let v197 = acc
                    let v198 = Uh3Cons(v196, v197)
                    v198
                    })
                    let v199 = listm_fold
                    let v200 = Uh3Nil
                    let v201 = method4(v199, v200)
                    let v202 = Uh2Nil
                    let v203 = method374(v60, v201, v202)
                    let v204 = dict.keys(v61)
                    let v205 = dictm_term_sorted(v204)
                    let v206 = Uh3Nil
                    let listm_fold = v205 |> list.fold (v206, fn (acc, x) {
                    let v207 = x
                    let v208 = acc
                    let v209 = Uh3Cons(v207, v208)
                    v209
                    })
                    let v210 = listm_fold
                    let v211 = Uh3Nil
                    let v212 = method4(v210, v211)
                    let v213 = Uh2Nil
                    let v214 = method374(v61, v212, v213)
                    let v215 = dict.keys(v53)
                    let v216 = dictm_term_sorted(v215)
                    let v217 = Uh3Nil
                    let listm_fold = v216 |> list.fold (v217, fn (acc, x) {
                    let v218 = x
                    let v219 = acc
                    let v220 = Uh3Cons(v218, v219)
                    v220
                    })
                    let v221 = listm_fold
                    let v222 =
                        case v70  {
                            Us30NoEviction -> False
                            _ -> True
                        }
                    let v223 = Uh0Nil
                    let v224 = method45(v159, v181, v192, v203, v214, v221, v222, v85, v223)
                    let v225 = Uh3Nil
                    let v226 = method30(v224, v225)
                    let v231 =
                        case v226  {
                            Uh3Nil -> Us12Held
                            _ -> {
                                let v228 = 5
                                let v229 = taken_31(v228, v226)
                                Us12Broken(v229)
                            }
                        }
                    let v241 =
                        case v231  {
                            Us12Held -> {
                                let v232 = 0
                                let v233 = method48(v85, v232)
                                let v234 = 0
                                let v235 = method48(v159, v234)
                                let v236 = v233 == v235
                                case v236 {
                                    True -> Us12Held
                                    False -> {
                                        let v238 = Uh3Nil
                                        Us12Broken(v238)
                                    }
                                }
                            }
                            _ -> v231
                        }
                    case v241  {
                        Us12Held -> {
                            let v242 = Uh34Cons(v38, v39, v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74)
                            commuted_runs_387(v242)
                        }
                        _ -> v241
                    }
                }
                _ -> Us12Held
            }
        }
        _ -> Us12Held
    }
}

pub fn closure108(capt: Nil) -> fn(#(Us13, Us12)) -> Bool {
    fn (dom) {
        let #(_v0, v1) = dom
        case v1  {
            Us12Held -> False
            _ -> True
        }
    }
}

pub fn method389() -> fn(#(Us13, Us12)) -> Bool {
    closure108(Nil)
}

pub fn method390(v0: fn(#(Us13, Us12)) -> Bool, v1: Uh6) -> Bool {
    case v1  {
        Uh6Cons(v2, v3, v4) -> {
            let v5 = v0(#(v2, v3))
            case v5 {
                True -> True
                False -> {
                    let v6 = method389()
                    method390(v6, v4)
                }
            }
        }
        Uh6Nil -> False
    }
}

pub fn closure107(capt: Nil) -> fn(Uh6) -> Bool {
    fn (v0) {
        let v1 = method389()
        let v2 = method390(v1, v0)
        let v3 = v2 == False
        let v4 = v3 == False
        v4
    }
}

pub fn method388() -> fn(Uh6) -> Bool {
    closure107(Nil)
}

pub fn method391(v0: fn(Uh6) -> Bool, v1: Uh35) -> Bool {
    case v1  {
        Uh35Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method388()
                    method391(v5, v3)
                }
            }
        }
        Uh35Nil -> False
    }
}

pub fn simulated_by_304(v0: fn(Uh3) -> #(Us45, String), v1: fn(Uh3) -> #(Us45, String), v2: Bool, v3: fn(Int) -> Uh3, v4: fn(Nil) -> Int, v5: fn(Int) -> fn(fn(Uh3) -> #(Us45, String)) -> fn(#(Bool, Bool, Us30, Bool, Int)) -> fn(Uh15) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, Int), v6: Uh3, v7: String, v8: Int, v9: Int, v10: Int, v11: String, v12: Bool, v13: Int, v14: Int, v15: Int, v16: Int, v17: Int, v18: String, v19: String, v20: Us29, v21: Int, v22: Us30, v23: Int, v24: Bool, v25: Bool, v26: Uh8) -> Uh3 {
    let v27 = ","
    let v28 = "+"
    let v29 = v11 |> string.replace(v27, v28)
    let v30 = v29 == ""
    let v33 =
        case v30 {
            True -> Uh3Nil
            False -> split_list_2(v28, v29)
        }
    let v34 = Uh3Nil
    let v35 = method54(v33, v34)
    let v36 = Uh7Nil
    let v37 = method55(v35, v36)
    let v38 = False
    let #(v39, v40, v41) = from_corpus_61(v13, v14, v15, v9, v10, v37, v38, v26)
    let v45 =
        case v12 {
            True -> {
                let v42 = closure92(Nil)
                let v43 = 280
                exploded_139(v42, v43, v40)
            }
            False -> v40
        }
    let v46 = 1
    let v47 = Uh32Nil
    let v48 = outcomes_from_364(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v39, v40, v41, v45, v46, v47)
    let v49 = Uh3Nil
    let v50 = method384(v48, v49)
    let v51 = Uh34Nil
    let v52 = method385(v48, v51)
    let v53 = Uh35Nil
    let v54 = method386(v48, v53)
    let v55 = commuted_runs_387(v52)
    let v56 = method388()
    let v57 = method391(v56, v54)
    let v58 = v57 == False
    let v60 =
        case v58 {
            True -> {
                case v55  {
                    Us12Held -> True
                    _ -> False
                }
            }
            False -> False
        }
    let v69 =
        case v55  {
            Us12Broken(v62) -> {
                let v63 = delimited_21(v27, v62)
                let v64 = "FAIL["
                let v65 = v64 <> v63 
                let v66 = "]"
                let v67 = v65 <> v66 
                v67
            }
            Us12Held -> {
                let v61 = "ok"
                v61
            }
        }
    let v70 = "XSIM commute="
    let v71 = v70 <> v69 
    let v72 = " result="
    let v73 = v71 <> v72 
    let v76 =
        case v60 {
            True -> {
                let v74 = "pass"
                v74
            }
            False -> {
                let v75 = "fail"
                v75
            }
        }
    let v77 = v73 <> v76 
    let v78 = Uh3Nil
    let v79 = Uh3Cons(v77, v78)
    method18(v50, v79)
}

pub fn closure29(capt: Nil) -> fn(#(String, String, String)) -> String {
    fn (dom) {
        let #(v0, v1, v2) = dom
        let v3 = "atomics"
        let v4 = atom.create(v3)
        let v5 = erlang_term_coerce(v4)
        let v6 = []
        let v7 = [v5, ..v6]
        let v8 = erlang_term_coerce(v7)
        let v9 = erlang_term_coerce(2)
        let v10 = "counters"
        let v11 = atom.create(v10)
        let v12 = "new"
        let v13 = atom.create(v12)
        let v14 = []
        let v15 = [v8, ..v14]
        let v16 = [v9, ..v15]
        let v17 = erlang_term_apply(v11, v13, v16)
        let v18 = unicode_erlang_characters_to_binary([0])
        let v19 = v0 == ""
        let v22 =
            case v19 {
                True -> Uh3Nil
                False -> split_list_2(v18, v0)
            }
        let v23 = unicode_erlang_characters_to_binary([1])
        let v24 = split_list_2(v23, v1)
        let v25 = unicode_erlang_characters_to_binary([0])
        let v26 = Uh8Nil
        let v27 = method60(v25, v24, v26)
        let v28 = closure30(Nil)
        let v29 = closure32(Nil)
        let v30 = Uh3Nil
        let v31 = ""
        let v32 = -1
        let v33 = 0
        let v34 = 0
        let v35 = False
        let v36 = 1
        let v37 = 8
        let v38 = 3
        let v39 = 2
        let v40 = 100
        let v41 = Us29FakeExecutor
        let v42 = 4
        let v43 = Us30NoEviction
        let v44 = 0
        let v45 = False
        let v46 = False
        let v47 = flags_parsed_236(v28, v29, v30, v31, v32, v33, v34, v31, v35, v36, v37, v38, v39, v40, v31, v31, v41, v42, v43, v44, v45, v46, v22)
        let v80 =
            case v47  {
                Us33Error(v77) -> Us36RunRejected(v77)
                Us33Ok(v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67) -> {
                    let v68 = 0
                    let v69 = method20(v48, v68)
                    let v70 = v69 == 0
                    let v72 =
                        case v70 {
                            True -> {
                                let v71 = v49 == ""
                                v71
                            }
                            False -> False
                        }
                    case v72 {
                        True -> {
                            let v73 = "missing --spi or --spi-file"
                            Us36RunRejected(v73)
                        }
                        False -> Us36RunParsed(v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67)
                    }
                }
            }
        case v80  {
            Us36RunParsed(v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100) -> {
                let #(v153, v154, v155, _v156, _v157, v158) =
                    case v95  {
                        Us29FakeExecutor -> {
                            let v101 = closure35(Nil)
                            let v102 = closure36(Nil)
                            let v103 = closure37(Nil)
                            let v104 = quiet_c38(Nil)
                            let v105 = closure39(Nil)
                            #(v101, v102, False, v103, v104, v105)
                        }
                        _ -> {
                            let #(v147, v148, v149, v150, v151, v152) =
                                case v95  {
                                    Us29CellsExecutor -> {
                                        let v106 = closure69(#(v2, v99, v17))
                                        let v107 = closure72(#(v2))
                                        let v108 = closure37(Nil)
                                        let v109 = quiet_c38(Nil)
                                        let v110 = closure39(Nil)
                                        #(v106, v107, True, v108, v109, v110)
                                    }
                                    _ -> {
                                        let #(v141, v142, v143, v144, v145, v146) =
                                            case v95  {
                                                Us29LeakingExecutor -> {
                                                    let v111 = actor.new(v31)
                                                    let v112 = closure73(Nil)
                                                    let v113 = actor.on_message(v111, fn(state, message) { v112(state)(message) })
                                                    let v114 = actor.start(v113)
                                                    let v115 = result.is_ok(v114)
                                                    let v119 =
                                                        case v115 {
                                                            True -> {
                                                                let v116 = result.lazy_unwrap(v114, fn() { panic }).data
                                                                Us69Some(v116)
                                                            }
                                                            False -> Us69None
                                                        }
                                                    let v124 =
                                                        case v119  {
                                                            Us69None -> closure75(Nil)
                                                            Us69Some(v120) -> closure76(#(v120))
                                                        }
                                                    let v125 = actor.new(v31)
                                                    let v126 = actor.on_message(v125, fn(state, message) { v112(state)(message) })
                                                    let v127 = actor.start(v126)
                                                    let v128 = result.is_ok(v127)
                                                    let v132 =
                                                        case v128 {
                                                            True -> {
                                                                let v129 = result.lazy_unwrap(v127, fn() { panic }).data
                                                                Us69Some(v129)
                                                            }
                                                            False -> Us69None
                                                        }
                                                    let v137 =
                                                        case v132  {
                                                            Us69None -> closure78(Nil)
                                                            Us69Some(v133) -> closure76(#(v133))
                                                        }
                                                    let v138 = closure37(Nil)
                                                    let v139 = quiet_c38(Nil)
                                                    let v140 = closure39(Nil)
                                                    #(v124, v137, False, v138, v139, v140)
                                                }
                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                            }
                                        #(v141, v142, v143, v144, v145, v146)
                                    }
                                }
                            #(v147, v148, v149, v150, v151, v152)
                        }
                    }
                let v161 =
                    case v99 {
                        True -> closure79(#(v2, v17, v2, v17))
                        False -> closure80(Nil)
                    }
                let v244 =
                    case v100 {
                        True -> {
                            let v162 = "Elixir.System"
                            let v163 = atom.create(v162)
                            let v164 = "tmp_dir!"
                            let v165 = atom.create(v164)
                            let v166 = []
                            let v167 = erlang_term_apply(v163, v165, v166)
                            let v168 = erlang_term_coerce(v167)
                            let v169 = "/xsim-tree-sample-"
                            let v170 = v168 <> v169 
                            let v171 = atom.create(v162)
                            let v172 = "pid"
                            let v173 = atom.create(v172)
                            let v174 = []
                            let v175 = erlang_term_apply(v171, v173, v174)
                            let v176 = erlang_term_coerce(v175)
                            let v177 = v170 <> v176 
                            let v178 = ".ps1"
                            let v179 = v177 <> v178 
                            let v180 = "\n"
                            let v181 = "param([int]%Root)"
                            let v182 = "%all = @(Get-CimInstance Win32_Process)"
                            let v183 = "if (-not (%all | ? ProcessId -eq %Root)) { exit 0 }"
                            let v184 = "%tree = [Collections.Generic.List[int]]::new()"
                            let v185 = "%tree.Add(%Root)"
                            let v186 = "for (%i = 0; %i -lt %tree.Count; %i++) {"
                            let v187 = "  foreach (%p in %all) {"
                            let v188 = "    %kid = [int]%p.ProcessId"
                            let v189 = "    %up = %p.ParentProcessId -eq %tree[%i]"
                            let v190 = "    if (%up -and %kid -ne %tree[%i]) { %tree.Add(%kid) }"
                            let v191 = "  }"
                            let v192 = "}"
                            let v193 = "%mine = %all | ? { %tree.Contains([int]%_.ProcessId) }"
                            let v194 = "%bytes = (%mine | Measure-Object WorkingSetSize -Sum).Sum"
                            let v195 = "\"%(%tree.Count) %([int64](%bytes / 1MB))\""
                            let v196 = Uh3Nil
                            let v197 = Uh3Cons(v195, v196)
                            let v198 = Uh3Cons(v194, v197)
                            let v199 = Uh3Cons(v193, v198)
                            let v200 = Uh3Cons(v192, v199)
                            let v201 = Uh3Cons(v191, v200)
                            let v202 = Uh3Cons(v190, v201)
                            let v203 = Uh3Cons(v189, v202)
                            let v204 = Uh3Cons(v188, v203)
                            let v205 = Uh3Cons(v187, v204)
                            let v206 = Uh3Cons(v186, v205)
                            let v207 = Uh3Cons(v185, v206)
                            let v208 = Uh3Cons(v184, v207)
                            let v209 = Uh3Cons(v183, v208)
                            let v210 = Uh3Cons(v182, v209)
                            let v211 = Uh3Cons(v181, v210)
                            let v212 = concat_balanced_22(v180, v211)
                            let v213 = "%"
                            let v214 = "$"
                            let v215 = v212 |> string.replace(v213, v214)
                            let v216 = spiral_fs_write_file(v179, v215)
                            let v217 = spiral_fs_coerce(v216)
                            let v218 = "ok"
                            let v219 = atom.create(v218)
                            let v220 = v217 == v219
                            let v221 = v220 == False
                            case v221 {
                                True -> panic as "file_system.write_all_text: the write failed"
                                False -> Nil
                            }
                            let v222 = closure81(#(v179))
                            let v223 = actor.new_with_initialiser(10000, fn(me) { Ok(actor.initialised(v222(me)) |> actor.returning(me)) })
                            let v224 = closure84(Nil)
                            let v225 = actor.on_message(v223, fn(state, message) { v224(state)(message) })
                            let v226 = actor.start(v225)
                            let v227 = result.is_ok(v226)
                            let v231 =
                                case v227 {
                                    True -> {
                                        let v228 = result.lazy_unwrap(v226, fn() { panic }).data
                                        Us74Some(v228)
                                    }
                                    False -> Us74None
                                }
                            let v237 =
                                case v231  {
                                    Us74None -> Us74None
                                    Us74Some(v232) -> {
                                        let v233 = Us70Tick
                                        actor.send(v232, v233)
                                        Us74Some(v232)
                                    }
                                }
                            case v237  {
                                Us74None -> closure86(Nil)
                                Us74Some(v238) -> closure87(#(v238))
                            }
                        }
                        False -> closure89(Nil)
                    }
                let v245 = closure90(#(v161, v244))
                let v246 = closure91(Nil)
                let v247 = simulated_by_304(v153, v154, v155, v245, v246, v158, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v27)
                let v248 = "\n"
                delimited_21(v248, v247)
            }
            Us36RunRejected(v250) -> {
                let v251 = "XSIM rejected "
                let v252 = v251 <> v250 
                v252
            }
        }
    }
}

pub fn main() {
    let _v0 = closure0(Nil)
    let _ = Nil
    let _v1 = closure5(Nil)
    let _ = Nil
    let _v2 = closure7(Nil)
    let _ = Nil
    let _v3 = closure9(Nil)
    let _ = Nil
    let _v4 = closure10(Nil)
    let _ = Nil
    let _v5 = closure12(Nil)
    let _ = Nil
    let _v6 = closure13(Nil)
    let _ = Nil
    let _v7 = closure14(Nil)
    let _ = Nil
    let _v8 = closure15(Nil)
    let _ = Nil
    let _v9 = closure19(Nil)
    let _ = Nil
    let _v10 = closure27(Nil)
    let _ = Nil
    let _v11 = closure28(Nil)
    let _ = Nil
    let _v12 = closure29(Nil)
    let _ = Nil
    0
}
