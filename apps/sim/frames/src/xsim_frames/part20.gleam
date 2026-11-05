import gleam/bit_array
import gleam/dict
import gleam/erlang/atom
import gleam/list
import gleam/otp/actor
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Us2, type Us12, type Us13, type Uh6, type Uh8, type Uh15, type Us29, type Us30, type Us45, type Uh28, type Uh29, type Uh34, type Uh35, Uh0Nil, Uh1Nil, Uh29Cons, Uh29Nil, Uh2Nil, Uh32Nil, Uh34Cons, Uh34Nil, Uh35Cons, Uh35Nil, Uh3Cons, Uh3Nil, Uh6Cons, Uh6Nil, Uh7Nil, Uh8Cons, Uh8Nil, Us12Broken, Us12Held, Us29CellsExecutor, Us29FakeExecutor, Us29LeakingExecutor, Us30NoEviction, Us33Error, Us33Ok, Us36RunParsed, Us36RunRejected, Us56Error, Us56Ok, Us69None, Us69Some, Us70Tick, Us78None, Us78Some, Us80Error, Us80Ok}
import xsim_frames/part1.{dictm_term_sorted, erlang_term_apply, erlang_term_coerce, method4, spiral_fs_coerce, spiral_fs_is_regular, spiral_fs_read_file, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part10.{closure32, closure35, closure36, closure37, flags_parsed_235, method258, method259, quiet_c38}
import xsim_frames/part13.{closure39, closure69, items_from_301, method295}
import xsim_frames/part14.{closure70, closure71, closure73, closure74, closure76, closure77, closure78, closure79}
import xsim_frames/part15.{closure82, closure84, closure85, closure87, closure88, closure89, closure90}
import xsim_frames/part18.{closure91, method370, method371, method373, method377, method378}
import xsim_frames/part19.{method388, method389, method390, outcomes_from_368}
import xsim_frames/part2.{concat_balanced_22, delimited_21, method18, method20, method30, taken_31}
import xsim_frames/part3.{method45, method48, method54, method55, method60}
import xsim_frames/part5.{from_corpus_61}
import xsim_frames/part6.{exploded_138}
import xsim_frames/part9.{closure30}

pub fn commuted_runs_391(v0: Uh34) -> Us12 {
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
                    let v85 = method373(v30, v83, v84)
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
                    let _v107 = method377(v96, v105, v106)
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
                    let _v118 = method378(v22, v116, v117)
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
                    let _v129 = method378(v23, v127, v128)
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
                    let _v140 = method378(v24, v138, v139)
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
                    let v159 = method373(v67, v157, v158)
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
                    let v181 = method377(v170, v179, v180)
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
                    let v192 = method378(v59, v190, v191)
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
                    let v203 = method378(v60, v201, v202)
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
                    let v214 = method378(v61, v212, v213)
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
                            commuted_runs_391(v242)
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

pub fn closure107(capt: Nil) -> fn(#(Us13, Us12)) -> Bool {
    fn (dom) {
        let #(_v0, v1) = dom
        case v1  {
            Us12Held -> False
            _ -> True
        }
    }
}

pub fn method393() -> fn(#(Us13, Us12)) -> Bool {
    closure107(Nil)
}

pub fn method394(v0: fn(#(Us13, Us12)) -> Bool, v1: Uh6) -> Bool {
    case v1  {
        Uh6Cons(v2, v3, v4) -> {
            let v5 = v0(#(v2, v3))
            case v5 {
                True -> True
                False -> {
                    let v6 = method393()
                    method394(v6, v4)
                }
            }
        }
        Uh6Nil -> False
    }
}

pub fn closure106(capt: Nil) -> fn(Uh6) -> Bool {
    fn (v0) {
        let v1 = method393()
        let v2 = method394(v1, v0)
        let v3 = v2 == False
        let v4 = v3 == False
        v4
    }
}

pub fn method392() -> fn(Uh6) -> Bool {
    closure106(Nil)
}

pub fn method395(v0: fn(Uh6) -> Bool, v1: Uh35) -> Bool {
    case v1  {
        Uh35Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method392()
                    method395(v5, v3)
                }
            }
        }
        Uh35Nil -> False
    }
}

pub fn simulated_by_308(v0: fn(Uh3) -> #(Us45, String), v1: fn(Uh3) -> #(Us45, String), v2: Bool, v3: fn(Int) -> Uh3, v4: fn(Nil) -> Int, v5: fn(Nil) -> Int, v6: fn(Int) -> fn(fn(Uh3) -> #(Us45, String)) -> fn(#(Bool, Bool, Us30, Bool, Int)) -> fn(Uh15) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, Int), v7: Uh3, v8: String, v9: Int, v10: Int, v11: Int, v12: String, v13: Bool, v14: Int, v15: Int, v16: Int, v17: Int, v18: Int, v19: String, v20: String, v21: Us29, v22: Int, v23: Us30, v24: Int, v25: Bool, v26: Bool, v27: Uh8) -> Uh3 {
    let v28 = ","
    let v29 = "+"
    let v30 = v12 |> string.replace(v28, v29)
    let v31 = v30 == ""
    let v34 =
        case v31 {
            True -> Uh3Nil
            False -> split_list_2(v29, v30)
        }
    let v35 = Uh3Nil
    let v36 = method54(v34, v35)
    let v37 = Uh7Nil
    let v38 = method55(v36, v37)
    let v39 = False
    let #(v40, v41, v42) = from_corpus_61(v14, v15, v16, v10, v11, v38, v39, v27)
    let v46 =
        case v13 {
            True -> {
                let v43 = closure91(Nil)
                let v44 = 280
                exploded_138(v43, v44, v41)
            }
            False -> v41
        }
    let v47 = 1
    let v48 = Uh32Nil
    let v49 = outcomes_from_368(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v40, v41, v42, v46, v47, v48)
    let v50 = Uh3Nil
    let v51 = method388(v49, v50)
    let v52 = Uh34Nil
    let v53 = method389(v49, v52)
    let v54 = Uh35Nil
    let v55 = method390(v49, v54)
    let v56 = commuted_runs_391(v53)
    let v57 = method392()
    let v58 = method395(v57, v55)
    let v59 = v58 == False
    let v61 =
        case v59 {
            True -> {
                case v56  {
                    Us12Held -> True
                    _ -> False
                }
            }
            False -> False
        }
    let v70 =
        case v56  {
            Us12Broken(v63) -> {
                let v64 = delimited_21(v28, v63)
                let v65 = "FAIL["
                let v66 = v65 <> v64 
                let v67 = "]"
                let v68 = v66 <> v67 
                v68
            }
            Us12Held -> {
                let v62 = "ok"
                v62
            }
        }
    let v71 = "XSIM commute="
    let v72 = v71 <> v70 
    let v73 = " result="
    let v74 = v72 <> v73 
    let v77 =
        case v61 {
            True -> {
                let v75 = "pass"
                v75
            }
            False -> {
                let v76 = "fail"
                v76
            }
        }
    let v78 = v74 <> v77 
    let v79 = Uh3Nil
    let v80 = Uh3Cons(v78, v79)
    method18(v51, v80)
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
        let v47 = flags_parsed_235(v28, v29, v30, v31, v32, v33, v34, v31, v35, v36, v37, v38, v39, v40, v31, v31, v41, v42, v43, v44, v45, v46, v22)
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
                let #(v155, v156, v157, _v158, _v159, _v160, v161) =
                    case v95  {
                        Us29FakeExecutor -> {
                            let v101 = closure35(Nil)
                            let v102 = closure36(Nil)
                            let v103 = closure37(Nil)
                            let v104 = quiet_c38(Nil)
                            let v105 = closure39(Nil)
                            #(v101, v102, False, v103, v104, v104, v105)
                        }
                        _ -> {
                            let #(v148, v149, v150, v151, v152, v153, v154) =
                                case v95  {
                                    Us29CellsExecutor -> {
                                        let v106 = closure69(#(v2, v99, v17))
                                        let v107 = closure70(#(v2))
                                        let v108 = closure37(Nil)
                                        let v109 = quiet_c38(Nil)
                                        let v110 = closure39(Nil)
                                        #(v106, v107, True, v108, v109, v109, v110)
                                    }
                                    _ -> {
                                        let #(v141, v142, v143, v144, v145, v146, v147) =
                                            case v95  {
                                                Us29LeakingExecutor -> {
                                                    let v111 = actor.new(v31)
                                                    let v112 = closure71(Nil)
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
                                                            Us69None -> closure73(Nil)
                                                            Us69Some(v120) -> closure74(#(v120))
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
                                                            Us69None -> closure76(Nil)
                                                            Us69Some(v133) -> closure74(#(v133))
                                                        }
                                                    let v138 = closure37(Nil)
                                                    let v139 = quiet_c38(Nil)
                                                    let v140 = closure39(Nil)
                                                    #(v124, v137, False, v138, v139, v139, v140)
                                                }
                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                            }
                                        #(v141, v142, v143, v144, v145, v146, v147)
                                    }
                                }
                            #(v148, v149, v150, v151, v152, v153, v154)
                        }
                    }
                let v164 =
                    case v99 {
                        True -> closure77(#(v2, v17, v2, v17))
                        False -> closure78(Nil)
                    }
                let v247 =
                    case v100 {
                        True -> {
                            let v165 = "Elixir.System"
                            let v166 = atom.create(v165)
                            let v167 = "tmp_dir!"
                            let v168 = atom.create(v167)
                            let v169 = []
                            let v170 = erlang_term_apply(v166, v168, v169)
                            let v171 = erlang_term_coerce(v170)
                            let v172 = "/xsim-tree-sample-"
                            let v173 = v171 <> v172 
                            let v174 = atom.create(v165)
                            let v175 = "pid"
                            let v176 = atom.create(v175)
                            let v177 = []
                            let v178 = erlang_term_apply(v174, v176, v177)
                            let v179 = erlang_term_coerce(v178)
                            let v180 = v173 <> v179 
                            let v181 = ".ps1"
                            let v182 = v180 <> v181 
                            let v183 = "\n"
                            let v184 = "param([int]%Root)"
                            let v185 = "%all = @(Get-CimInstance Win32_Process)"
                            let v186 = "if (-not (%all | ? ProcessId -eq %Root)) { exit 0 }"
                            let v187 = "%tree = [Collections.Generic.List[int]]::new()"
                            let v188 = "%tree.Add(%Root)"
                            let v189 = "for (%i = 0; %i -lt %tree.Count; %i++) {"
                            let v190 = "  foreach (%p in %all) {"
                            let v191 = "    %kid = [int]%p.ProcessId"
                            let v192 = "    %up = %p.ParentProcessId -eq %tree[%i]"
                            let v193 = "    if (%up -and %kid -ne %tree[%i]) { %tree.Add(%kid) }"
                            let v194 = "  }"
                            let v195 = "}"
                            let v196 = "%mine = %all | ? { %tree.Contains([int]%_.ProcessId) }"
                            let v197 = "%bytes = (%mine | Measure-Object WorkingSetSize -Sum).Sum"
                            let v198 = "\"%(%tree.Count) %([int64](%bytes / 1MB))\""
                            let v199 = Uh3Nil
                            let v200 = Uh3Cons(v198, v199)
                            let v201 = Uh3Cons(v197, v200)
                            let v202 = Uh3Cons(v196, v201)
                            let v203 = Uh3Cons(v195, v202)
                            let v204 = Uh3Cons(v194, v203)
                            let v205 = Uh3Cons(v193, v204)
                            let v206 = Uh3Cons(v192, v205)
                            let v207 = Uh3Cons(v191, v206)
                            let v208 = Uh3Cons(v190, v207)
                            let v209 = Uh3Cons(v189, v208)
                            let v210 = Uh3Cons(v188, v209)
                            let v211 = Uh3Cons(v187, v210)
                            let v212 = Uh3Cons(v186, v211)
                            let v213 = Uh3Cons(v185, v212)
                            let v214 = Uh3Cons(v184, v213)
                            let v215 = concat_balanced_22(v183, v214)
                            let v216 = "%"
                            let v217 = "$"
                            let v218 = v215 |> string.replace(v216, v217)
                            let v219 = spiral_fs_write_file(v182, v218)
                            let v220 = spiral_fs_coerce(v219)
                            let v221 = "ok"
                            let v222 = atom.create(v221)
                            let v223 = v220 == v222
                            let v224 = v223 == False
                            case v224 {
                                True -> panic as "file_system.write_all_text: the write failed"
                                False -> Nil
                            }
                            let v225 = closure79(#(v182))
                            let v226 = actor.new_with_initialiser(10000, fn(me) { Ok(actor.initialised(v225(me)) |> actor.returning(me)) })
                            let v227 = closure82(Nil)
                            let v228 = actor.on_message(v226, fn(state, message) { v227(state)(message) })
                            let v229 = actor.start(v228)
                            let v230 = result.is_ok(v229)
                            let v234 =
                                case v230 {
                                    True -> {
                                        let v231 = result.lazy_unwrap(v229, fn() { panic }).data
                                        Us78Some(v231)
                                    }
                                    False -> Us78None
                                }
                            let v240 =
                                case v234  {
                                    Us78None -> Us78None
                                    Us78Some(v235) -> {
                                        let v236 = Us70Tick
                                        actor.send(v235, v236)
                                        Us78Some(v235)
                                    }
                                }
                            case v240  {
                                Us78None -> closure84(Nil)
                                Us78Some(v241) -> closure85(#(v241))
                            }
                        }
                        False -> closure87(Nil)
                    }
                let v248 = closure88(#(v164, v247))
                let v249 = closure89(Nil)
                let v250 = closure90(Nil)
                let v251 = simulated_by_308(v155, v156, v157, v248, v249, v250, v161, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v27)
                let v252 = "\n"
                delimited_21(v252, v251)
            }
            Us36RunRejected(v254) -> {
                let v255 = "XSIM rejected "
                let v256 = v255 <> v254 
                v256
            }
        }
    }
}

pub fn method396(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method396(v3, v1)
            let v5 = "unicode"
            let v6 = atom.create(v5)
            let v7 = "characters_to_binary"
            let v8 = atom.create(v7)
            let v9 = []
            let v10 = [v2, ..v9]
            let v11 = erlang_term_apply(v6, v8, v10)
            let v12 = erlang_term_coerce(v11)
            Uh3Cons(v12, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method397(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method397(v3, v1)
            let v5 = v2 != ""
            case v5 {
                True -> Uh3Cons(v2, v4)
                False -> v4
            }
        }
        Uh3Nil -> v1
    }
}

pub fn file_exists_399(v0: String) -> Bool {
    let v1 = spiral_fs_is_regular(v0)
    v1
}

pub fn method400(v0: Uh29, v1: Uh29) -> Uh29 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method400(v3, v1)
            let v5 = "none"
            let v6 = atom.create(v5)
            let v7 = erlang_term_coerce(v6)
            let v8 = "kind"
            let v9 = atom.create(v8)
            let v10 = erlang_term_coerce(v9)
            let v11 = erlang_term_coerce(v10)
            let v12 = erlang_term_coerce(v7)
            let v13 = "maps"
            let v14 = atom.create(v13)
            let v15 = "get"
            let v16 = atom.create(v15)
            let v17 = []
            let v18 = [v12, ..v17]
            let v19 = [v2, ..v18]
            let v20 = [v11, ..v19]
            let v21 = erlang_term_apply(v14, v16, v20)
            let v22 = erlang_term_coerce(v21)
            let v23 = "spiral"
            let v24 = atom.create(v23)
            let v25 = erlang_term_coerce(v24)
            let v26 = v22 == v25
            case v26 {
                True -> Uh29Cons(v2, v4)
                False -> v4
            }
        }
        Uh29Nil -> v1
    }
}

pub fn method401(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method401(v3, v1)
            let v5 = ""
            let v6 = erlang_term_coerce(v5)
            let v7 = "source"
            let v8 = atom.create(v7)
            let v9 = erlang_term_coerce(v8)
            let v10 = erlang_term_coerce(v9)
            let v11 = erlang_term_coerce(v6)
            let v12 = "maps"
            let v13 = atom.create(v12)
            let v14 = "get"
            let v15 = atom.create(v14)
            let v16 = []
            let v17 = [v11, ..v16]
            let v18 = [v2, ..v17]
            let v19 = [v10, ..v18]
            let v20 = erlang_term_apply(v13, v15, v19)
            let v21 = erlang_term_coerce(v20)
            let v22 = erlang_term_coerce(v21)
            Uh3Cons(v22, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method398(v0: Int, v1: Uh3, v2: Uh8) -> Uh8 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method398(v0, v4, v2)
            let v6 = spiral_fs_read_file(v3)
            let v7 = method370()
            let v8 = method371()
            let v9 = case v6 { Ok(x) -> v7(x) Error(x) -> v8(x) }
            let v22 =
                case v9  {
                    Us80Error(v19) -> panic as "file_system.read_all_text: file:read_file failed"
                    Us80Ok(v10) -> {
                        let v11 = bit_array.to_string(v10)
                        let v12 = method258()
                        let v13 = method259()
                        let v14 = case v11 { Ok(x) -> v12(x) Error(x) -> v13(x) }
                        case v14  {
                            Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                            Us56Ok(v15) -> v15
                        }
                    }
                }
            let v23 = ".spi"
            let v24 = v3 |> string.ends_with(v23)
            let v29 =
                case v24 {
                    True -> {
                        let v25 = spiral_string_length(v3)
                        let v26 = spiral_wrap_signed(v25 - 4, 32)
                        let v27 = spiral_wrap_signed(v26 - 1, 32)
                        let v28 = spiral_string_slice(v3, 0, v27)
                        v28
                    }
                    False -> v3
                }
            let v30 = "_real.spir"
            let v31 = v29 <> v30 
            let v32 = file_exists_399(v31)
            let v51 =
                case v32 {
                    True -> {
                        let v33 = spiral_fs_read_file(v31)
                        let v34 = method370()
                        let v35 = method371()
                        let v36 = case v33 { Ok(x) -> v34(x) Error(x) -> v35(x) }
                        case v36  {
                            Us80Error(v46) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us80Ok(v37) -> {
                                let v38 = bit_array.to_string(v37)
                                let v39 = method258()
                                let v40 = method259()
                                let v41 = case v38 { Ok(x) -> v39(x) Error(x) -> v40(x) }
                                case v41  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v42) -> v42
                                }
                            }
                        }
                    }
                    False -> {
                        let v50 = ""
                        v50
                    }
                }
            let v52 = erlang_term_coerce(v22)
            let v53 = erlang_term_coerce(v51)
            let v54 = "Elixir.Spiral.Cells.Document"
            let v55 = atom.create(v54)
            let v56 = "parse_spi"
            let v57 = atom.create(v56)
            let v58 = []
            let v59 = [v53, ..v58]
            let v60 = [v52, ..v59]
            let v61 = erlang_term_apply(v55, v57, v60)
            let v62 = []
            let v63 = erlang_term_coerce(v62)
            let v64 = "cells"
            let v65 = atom.create(v64)
            let v66 = erlang_term_coerce(v65)
            let v67 = erlang_term_coerce(v66)
            let v68 = erlang_term_coerce(v63)
            let v69 = "maps"
            let v70 = atom.create(v69)
            let v71 = "get"
            let v72 = atom.create(v71)
            let v73 = []
            let v74 = [v68, ..v73]
            let v75 = [v61, ..v74]
            let v76 = [v67, ..v75]
            let v77 = erlang_term_apply(v70, v72, v76)
            let v78 = erlang_term_coerce(v77)
            let v79 = "lists"
            let v80 = atom.create(v79)
            let v81 = "reverse"
            let v82 = atom.create(v81)
            let v83 = []
            let v84 = [v78, ..v83]
            let v85 = erlang_term_apply(v80, v82, v84)
            let v86 = Uh29Nil
            let v87 = items_from_301(v85, v86)
            let v88 = Uh29Nil
            let v89 = method400(v87, v88)
            let v90 = Uh3Nil
            let v91 = method401(v89, v90)
            let v92 = v0 < 0
            let v94 =
                case v92 {
                    True -> v91
                    False -> taken_31(v0, v91)
                }
            Uh8Cons(v94, v5)
        }
        Uh3Nil -> v2
    }
}

pub fn closure109(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = "XSIM rejected"
        let v2 = v0 |> string.starts_with(v1)
        case v2 {
            True -> True
            False -> {
                let v3 = "result=fail"
                let v4 = v0 |> string.ends_with(v3)
                v4
            }
        }
    }
}

pub fn method402() -> fn(String) -> Bool {
    closure109(Nil)
}

pub fn method403(v0: fn(String) -> Bool, v1: Uh3) -> Bool {
    case v1  {
        Uh3Cons(v2, v3) -> {
            let v4 = v0(v2)
            case v4 {
                True -> True
                False -> {
                    let v5 = method402()
                    method403(v5, v3)
                }
            }
        }
        Uh3Nil -> False
    }
}
