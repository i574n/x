import gleam/dict
import gleam/erlang/atom
import gleam/erlang/process
import gleam/list
import gleam/result
import xsim_frames/types.{type Uh3, type Us2, type Uh15, type Us30, type Us45, type Uh28, type Us62, type Us66, Uh13Cons, Uh13Nil, Uh15Cons, Uh15Nil, Uh28Cons, Uh28Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us3None, Us3Some, Us45Erred, Us46CancelTask, Us46StartTask, Us52Error, Us52Ok, Us53None, Us53Some, Us54Error, Us54Ok, Us55None, Us55Some, Us56Error, Us56Ok, Us59Error, Us59Ok, Us60None, Us60Some, Us61Error, Us61Ok, Us62Error, Us62Ok, Us63None, Us63Some, Us64None, Us64Some, Us65Got, Us65TimedOut, Us66Error, Us66Ok, Us67None, Us67Some}
import xsim_frames/part1.{dictm_term_sorted, erlang_term_apply, erlang_term_coerce, method18, method4, spiral_wrap_signed}
import xsim_frames/part10.{delivered_241, method272, method273, method274, method275, method276, method277, method281}
import xsim_frames/part9.{method253, method254, method256, method257, method258, method259, method260, method261, method265, method266}

pub fn chain_sources_283(v0: dict.Dict(Int, Nil), v1: Uh15, v2: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v3: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v4: dict.Dict(String, String), v5: dict.Dict(String, Uh3), v6: dict.Dict(String, dict.Dict(String, Nil)), v7: dict.Dict(String, #(Int, Bool)), v8: dict.Dict(String, Nil), v9: Int, v10: Int, v11: Int, v12: Int, v13: Us2, v14: Uh3) -> Uh3 {
    case v13  {
        Us2None -> v14
        Us2Some(v15) -> {
            let v16 = dict.get(v3, v15)
            let v17 = method256()
            let v18 = method257()
            let v19 = case v16 { Ok(x) -> v17(x) Error(x) -> v18(x) }
            let v26 =
                case v19  {
                    Us54Error -> Us55None
                    Us54Ok(v20, v21, v22) -> Us55Some(v20, v21, v22)
                }
            let #(v36, v37, _v38) =
                case v26  {
                    Us55Some(v27, v28, v29) -> #(v27, v28, v29)
                    _ -> {
                        let #(v33, v34, v35) =
                            case v26  {
                                Us55None -> panic as "dict.present: the key is not in the dict"
                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                            }
                        #(v33, v34, v35)
                    }
                }
            let v39 = dict.keys(v37)
            let v40 = dictm_term_sorted(v39)
            let listm_fold = v40 |> list.fold (Uh13Nil, fn (acc, x) {
            let v42 = x
            let v43 = acc
            Uh13Cons(v42, v43)
            })
            let v45 = listm_fold
            let v47 = method260(v45, Uh13Nil)
            let v49 = method261(v37, v47, -1)
            let v50 = dict.get(v37, v49)
            let v51 = method258()
            let v52 = method259()
            let v53 = case v50 { Ok(x) -> v51(x) Error(x) -> v52(x) }
            let v58 =
                case v53  {
                    Us56Error -> Us2None
                    Us56Ok(v54) -> Us2Some(v54)
                }
            let v62 =
                case v58  {
                    Us2None -> panic as "dict.present: the key is not in the dict"
                    Us2Some(v59) -> v59
                }
            let v63 = Uh3Cons(v62, v14)
            chain_sources_283(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v36, v63)
        }
    }
}

pub fn started_queued_282(v0: dict.Dict(Int, Nil), v1: Uh15, v2: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v3: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v4: dict.Dict(String, String), v5: dict.Dict(String, Uh3), v6: dict.Dict(String, dict.Dict(String, Nil)), v7: dict.Dict(String, #(Int, Bool)), v8: dict.Dict(String, Nil), v9: Int, v10: Int, v11: Int, v12: Int, v13: dict.Dict(String, Uh3), v14: Uh3, v15: dict.Dict(String, #(Us45, String)), v16: dict.Dict(String, Int), v17: dict.Dict(String, String), v18: dict.Dict(String, String), v19: dict.Dict(String, Int), v20: Int, v21: dict.Dict(String, Int), v22: dict.Dict(String, Int), v23: dict.Dict(String, Int), v24: Int, v25: Int, v26: Int, v27: Int, v28: Int, v29: dict.Dict(String, #(String, Us45, String)), v30: Bool, v31: Bool, v32: Us30, v33: Bool, v34: Int, v35: Uh28) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28) {
    let #(v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182) =
        case v14  {
            Uh3Cons(v36, v37) -> {
                let v38 = dict.size(v13)
                let v39 = v38 < v34
                case v39 {
                    True -> {
                        let v40 = dict.get(v18, v36)
                        let v41 = method258()
                        let v42 = method259()
                        let v43 = case v40 { Ok(x) -> v41(x) Error(x) -> v42(x) }
                        let v48 =
                            case v43  {
                                Us56Error -> Us2None
                                Us56Ok(v44) -> Us2Some(v44)
                            }
                        let v52 =
                            case v48  {
                                Us2None -> panic as "dict.present: the key is not in the dict"
                                Us2Some(v49) -> v49
                            }
                        let v54 = Uh3Cons(v52, Uh3Nil)
                        let v55 = dict.insert(v13, v36, v54)
                        let v56 = dict.get(v21, v36)
                        let v57 = method273()
                        let v58 = method274()
                        let v59 = case v56 { Ok(x) -> v57(x) Error(x) -> v58(x) }
                        let v64 =
                            case v59  {
                                Us61Error -> Us3None
                                Us61Ok(v60) -> Us3Some(v60)
                            }
                        let v67 =
                            case v64  {
                                Us3None -> 0
                                Us3Some(v65) -> v65
                            }
                        let v68 = spiral_wrap_signed(v67 + 1, 32)
                        let v69 = dict.insert(v21, v36, v68)
                        let v70 = Us2Some(v52)
                        let v72 = chain_sources_283(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v70, Uh3Nil)
                        let v73 = Us46StartTask(v36, v72)
                        let v74 = Uh28Cons(v73, v35)
                        let #(v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110) = started_queued_282(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v55, v37, v15, v16, v17, v18, v19, v20, v69, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v74)
                        #(v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110)
                    }
                    False -> #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35)
                }
            }
            _ -> #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35)
        }
    #(v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182)
}

pub fn method284(v0: Uh28, v1: Uh28) -> Uh28 {
    case v0  {
        Uh28Cons(v2, v3) -> {
            let v4 = Uh28Cons(v2, v1)
            method284(v3, v4)
        }
        Uh28Nil -> v1
    }
}

pub fn closure64(capt: #(fn(Uh3) -> #(Us45, String), process.Subject(#(String, process.Pid, Us45, String)), String, Uh3)) -> fn(Nil) -> Nil {
    fn (dom) {
        let #(v0, v1, v2, v3) = capt
        let v4 = process.self()
        let #(v5, v6) = v0(v3)
        process.send(v1, #(v2, v4, v5, v6))
        Nil
    }
}

pub fn ok_c65(capt: Nil) -> fn(process.Pid) -> Us62 {
    fn (v0) {
        Us62Ok(v0)
    }
}

pub fn method286() -> fn(process.Pid) -> Us62 {
    ok_c65(Nil)
}

pub fn error_c66(capt: Nil) -> fn(Nil) -> Us62 {
    fn (dom) {
        Us62Error
    }
}

pub fn method287() -> fn(Nil) -> Us62 {
    error_c66(Nil)
}

pub fn method285(v0: fn(Uh3) -> #(Us45, String), v1: process.Subject(#(String, process.Pid, Us45, String)), v2: Uh28, v3: dict.Dict(Int, Nil), v4: Uh15, v5: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v6: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v7: dict.Dict(String, String), v8: dict.Dict(String, Uh3), v9: dict.Dict(String, dict.Dict(String, Nil)), v10: dict.Dict(String, #(Int, Bool)), v11: dict.Dict(String, Nil), v12: Int, v13: Int, v14: Int, v15: Int, v16: dict.Dict(String, Uh3), v17: Uh3, v18: dict.Dict(String, #(Us45, String)), v19: dict.Dict(String, Int), v20: dict.Dict(String, String), v21: dict.Dict(String, String), v22: dict.Dict(String, Int), v23: Int, v24: dict.Dict(String, Int), v25: dict.Dict(String, Int), v26: dict.Dict(String, Int), v27: Int, v28: Int, v29: Int, v30: Int, v31: Int, v32: dict.Dict(String, #(String, Us45, String)), v33: Bool, v34: Bool, v35: Us30, v36: Bool, v37: Int, v38: Uh28, v39: dict.Dict(String, process.Pid), v40: Int) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, dict.Dict(String, process.Pid), Int) {
    let #(v288, v289, v290, v291, v292, v293, v294, v295, v296, v297, v298, v299, v300, v301, v302, v303, v304, v305, v306, v307, v308, v309, v310, v311, v312, v313, v314, v315, v316, v317, v318, v319, v320, v321, v322, v323, v324, v325) =
        case v2  {
            Uh28Cons(v41, v42) -> {
                let #(v174, v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211) =
                    case v41  {
                        Us46StartTask(v43, v44) -> {
                            let v45 = closure64(#(v0, v1, v43, v44))
                            let v46 = process.spawn_unlinked(fn() { v45(Nil) })
                            let v47 = dict.insert(v39, v43, v46)
                            #(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v47, v40)
                        }
                        _ -> {
                            let #(v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173) =
                                case v41  {
                                    Us46CancelTask(v48) -> {
                                        let v49 = dict.get(v39, v48)
                                        let v50 = method286()
                                        let v51 = method287()
                                        let v52 = case v49 { Ok(x) -> v50(x) Error(x) -> v51(x) }
                                        let v57 =
                                            case v52  {
                                                Us62Error -> Us63None
                                                Us62Ok(v53) -> Us63Some(v53)
                                            }
                                        case v57  {
                                            Us63Some(v58) -> {
                                                process.kill(v58)
                                                let v59 = dict.delete(v39, v48)
                                                #(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v59, v40)
                                            }
                                            _ -> {
                                                let #(v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97) =
                                                    case v57  {
                                                        Us63None -> #(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40)
                                                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                    }
                                                #(v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97)
                                            }
                                        }
                                    }
                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                }
                            #(v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173)
                        }
                    }
                method285(v0, v1, v42, v174, v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211)
            }
            _ -> {
                let #(v250, v251, v252, v253, v254, v255, v256, v257, v258, v259, v260, v261, v262, v263, v264, v265, v266, v267, v268, v269, v270, v271, v272, v273, v274, v275, v276, v277, v278, v279, v280, v281, v282, v283, v284, v285, v286, v287) =
                    case v2  {
                        Uh28Nil -> #(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v250, v251, v252, v253, v254, v255, v256, v257, v258, v259, v260, v261, v262, v263, v264, v265, v266, v267, v268, v269, v270, v271, v272, v273, v274, v275, v276, v277, v278, v279, v280, v281, v282, v283, v284, v285, v286, v287)
            }
        }
    #(v288, v289, v290, v291, v292, v293, v294, v295, v296, v297, v298, v299, v300, v301, v302, v303, v304, v305, v306, v307, v308, v309, v310, v311, v312, v313, v314, v315, v316, v317, v318, v319, v320, v321, v322, v323, v324, v325)
}

pub fn method289(v0: String, v1: Us45, v2: String, v3: Uh3, v4: dict.Dict(String, #(String, Us45, String))) -> dict.Dict(String, #(String, Us45, String)) {
    case v3  {
        Uh3Cons(v5, v6) -> {
            let v7 = dict.insert(v4, v5, #(v0, v1, v2))
            method289(v0, v1, v2, v6, v7)
        }
        Uh3Nil -> v4
    }
}

pub fn harvested_288(v0: process.Subject(#(String, process.Pid, Us45, String)), v1: Int, v2: dict.Dict(Int, Nil), v3: Uh15, v4: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v5: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v6: dict.Dict(String, String), v7: dict.Dict(String, Uh3), v8: dict.Dict(String, dict.Dict(String, Nil)), v9: dict.Dict(String, #(Int, Bool)), v10: dict.Dict(String, Nil), v11: Int, v12: Int, v13: Int, v14: Int, v15: dict.Dict(String, Uh3), v16: Uh3, v17: dict.Dict(String, #(Us45, String)), v18: dict.Dict(String, Int), v19: dict.Dict(String, String), v20: dict.Dict(String, String), v21: dict.Dict(String, Int), v22: Int, v23: dict.Dict(String, Int), v24: dict.Dict(String, Int), v25: dict.Dict(String, Int), v26: Int, v27: Int, v28: Int, v29: Int, v30: Int, v31: dict.Dict(String, #(String, Us45, String)), v32: Bool, v33: Bool, v34: Us30, v35: Bool, v36: Int, v37: Uh28, v38: dict.Dict(String, process.Pid), v39: Int) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, dict.Dict(String, process.Pid), Int) {
    let v40 = dict.size(v38)
    let v41 = v40 == 0
    let v75 =
        case v41 {
            True -> Us64None
            False -> {
                let v44 = atom.create("millisecond")
                let v45 = erlang_term_coerce(v44)
                let v47 = atom.create("erlang")
                let v49 = atom.create("monotonic_time")
                let v50 = []
                let v51 = [v45, ..v50]
                let v52 = erlang_term_apply(v47, v49, v51)
                let v53 = erlang_term_coerce(v52)
                let v54 = spiral_wrap_signed(v1 - v53, 64)
                let v55 = v54 > 0
                let v56 =
                    case v55 {
                        True -> v54
                        False -> 0
                    }
                let v57 = spiral_wrap_signed(v56, 32)
                let v58 = process.receive(v0, v57)
                let v59 = result.is_ok(v58)
                let v66 =
                    case v59 {
                        True -> {
                            let #(v60, v61, v62, v63) = result.lazy_unwrap(v58, fn() { panic })
                            Us65Got(v60, v61, v62, v63)
                        }
                        False -> Us65TimedOut
                    }
                case v66  {
                    Us65Got(v67, v68, v69, v70) -> Us64Some(v67, v68, v69, v70)
                    Us65TimedOut -> Us64None
                }
            }
        }
    let #(v332, v333, v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344, v345, v346, v347, v348, v349, v350, v351, v352, v353, v354, v355, v356, v357, v358, v359, v360, v361, v362, v363, v364, v365, v366, v367, v368, v369) =
        case v75  {
            Us64Some(v76, v77, v78, v79) -> {
                let v80 = dict.get(v38, v76)
                let v81 = method286()
                let v82 = method287()
                let v83 = case v80 { Ok(x) -> v81(x) Error(x) -> v82(x) }
                let v88 =
                    case v83  {
                        Us62Error -> Us63None
                        Us62Ok(v84) -> Us63Some(v84)
                    }
                let v94 =
                    case v88  {
                        Us63None -> False
                        Us63Some(v89) -> {
                            let v90 = erlang_term_coerce(v89)
                            let v91 = erlang_term_coerce(v77)
                            v90 == v91
                        }
                    }
                let v95 = v94 == False
                let #(v218, v219, v220, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230, v231, v232, v233, v234, v235, v236, v237, v238, v239, v240, v241, v242, v243, v244, v245, v246, v247, v248, v249, v250, v251, v252, v253, v254, v255) =
                    case v95 {
                        True -> #(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39)
                        False -> {
                            let v96 = dict.get(v15, v76)
                            let v97 = method253()
                            let v98 = method254()
                            let v99 = case v96 { Ok(x) -> v97(x) Error(x) -> v98(x) }
                            let v104 =
                                case v99  {
                                    Us52Error -> Us53None
                                    Us52Ok(v100) -> Us53Some(v100)
                                }
                            let #(v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216) =
                                case v104  {
                                    Us53Some(v105) -> {
                                        let v106 = dict.delete(v15, v76)
                                        let v107 = dict.insert(v17, v76, #(v78, v79))
                                        case v35 {
                                            True -> {
                                                let v108 = method289(v76, v78, v79, v105, v31)
                                                #(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v106, v16, v107, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v108, v32, v33, v34, v35, v36, v37)
                                            }
                                            False -> #(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v106, v16, v107, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37)
                                        }
                                    }
                                    _ -> {
                                        let #(v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180) =
                                            case v104  {
                                                Us53None -> #(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37)
                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                            }
                                        #(v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180)
                                    }
                                }
                            let v217 = dict.delete(v38, v76)
                            #(v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216, v217, v39)
                        }
                    }
                harvested_288(v0, v1, v218, v219, v220, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230, v231, v232, v233, v234, v235, v236, v237, v238, v239, v240, v241, v242, v243, v244, v245, v246, v247, v248, v249, v250, v251, v252, v253, v254, v255)
            }
            _ -> {
                let #(v294, v295, v296, v297, v298, v299, v300, v301, v302, v303, v304, v305, v306, v307, v308, v309, v310, v311, v312, v313, v314, v315, v316, v317, v318, v319, v320, v321, v322, v323, v324, v325, v326, v327, v328, v329, v330, v331) =
                    case v75  {
                        Us64None -> #(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v294, v295, v296, v297, v298, v299, v300, v301, v302, v303, v304, v305, v306, v307, v308, v309, v310, v311, v312, v313, v314, v315, v316, v317, v318, v319, v320, v321, v322, v323, v324, v325, v326, v327, v328, v329, v330, v331)
            }
        }
    #(v332, v333, v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344, v345, v346, v347, v348, v349, v350, v351, v352, v353, v354, v355, v356, v357, v358, v359, v360, v361, v362, v363, v364, v365, v366, v367, v368, v369)
}

pub fn method240(v0: fn(Uh3) -> #(Us45, String), v1: process.Subject(#(String, process.Pid, Us45, String)), v2: Int, v3: Uh15, v4: dict.Dict(Int, Nil), v5: Uh15, v6: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v7: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v8: dict.Dict(String, String), v9: dict.Dict(String, Uh3), v10: dict.Dict(String, dict.Dict(String, Nil)), v11: dict.Dict(String, #(Int, Bool)), v12: dict.Dict(String, Nil), v13: Int, v14: Int, v15: Int, v16: Int, v17: dict.Dict(String, Uh3), v18: Uh3, v19: dict.Dict(String, #(Us45, String)), v20: dict.Dict(String, Int), v21: dict.Dict(String, String), v22: dict.Dict(String, String), v23: dict.Dict(String, Int), v24: Int, v25: dict.Dict(String, Int), v26: dict.Dict(String, Int), v27: dict.Dict(String, Int), v28: Int, v29: Int, v30: Int, v31: Int, v32: Int, v33: dict.Dict(String, #(String, Us45, String)), v34: Bool, v35: Bool, v36: Us30, v37: Bool, v38: Int, v39: Uh28, v40: dict.Dict(String, process.Pid), v41: Int) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, dict.Dict(String, process.Pid), Int) {
    let #(v425, v426, v427, v428, v429, v430, v431, v432, v433, v434, v435, v436, v437, v438, v439, v440, v441, v442, v443, v444, v445, v446, v447, v448, v449, v450, v451, v452, v453, v454, v455, v456, v457, v458, v459, v460, v461, v462) =
        case v3  {
            Uh15Cons(v42, v43, v44) -> {
                let #(v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57) = delivered_241(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v42, v43)
                let v58 = spiral_wrap_signed(v24 + 1, 32)
                let v59 = dict.keys(v23)
                let v60 = dictm_term_sorted(v59)
                let listm_fold = v60 |> list.fold (Uh3Nil, fn (acc, x) {
                let v62 = x
                let v63 = acc
                Uh3Cons(v62, v63)
                })
                let v65 = listm_fold
                let v67 = method272(v23, v58, v65, Uh3Nil)
                let v68 = method275(v67, v23)
                let #(v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104) = method276(v67, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v17, v18, v19, v20, v21, v22, v68, v58, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39)
                let v105 = dict.keys(v77)
                let v106 = dictm_term_sorted(v105)
                let listm_fold = v106 |> list.fold (Uh3Nil, fn (acc, x) {
                let v108 = x
                let v109 = acc
                Uh3Cons(v108, v109)
                })
                let v111 = listm_fold
                let v112 = dict.new()
                let #(v113, v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148) = method277(v111, v69, v70, v71, v72, v73, v74, v75, v76, v112, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104)
                let #(v159, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194) =
                    case v100 {
                        True -> {
                            let v149 = dict.keys(v129)
                            let v150 = dictm_term_sorted(v149)
                            let listm_fold = v150 |> list.fold (Uh3Nil, fn (acc, x) {
                            let v152 = x
                            let v153 = acc
                            Uh3Cons(v152, v153)
                            })
                            let v155 = listm_fold
                            let v157 = method281(v113, v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v155, Uh3Nil)
                            let v158 = method18(v127, v157)
                            #(v113, v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v158, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148)
                        }
                        False -> #(v113, v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148)
                    }
                let #(v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216, v217, v218, v219, v220, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230) = started_queued_282(v159, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194)
                let v231 = dict.size(v208)
                let v232 = dict.size(v210)
                let v233 = v231 > v222
                let v234 =
                    case v233 {
                        True -> v231
                        False -> v222
                    }
                let v235 = v232 > v223
                let v236 =
                    case v235 {
                        True -> v232
                        False -> v223
                    }
                let v238 = method284(v230, Uh28Nil)
                let #(v240, v241, v242, v243, v244, v245, v246, v247, v248, v249, v250, v251, v252, v253, v254, v255, v256, v257, v258, v259, v260, v261, v262, v263, v264, v265, v266, v267, v268, v269, v270, v271, v272, v273, v274, v275, v276, v277) = method285(v0, v1, v238, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216, v217, v218, v219, v220, v221, v234, v236, v224, v225, v226, v227, v228, v229, Uh28Nil, v40, v41)
                let v279 = atom.create("total")
                let v280 = erlang_term_coerce(v279)
                let v281 = "erlang"
                let v282 = atom.create(v281)
                let v284 = atom.create("memory")
                let v285 = []
                let v286 = [v280, ..v285]
                let v287 = erlang_term_apply(v282, v284, v286)
                let v288 = erlang_term_coerce(1048576)
                let v289 = atom.create(v281)
                let v291 = atom.create("div")
                let v292 = []
                let v293 = [v288, ..v292]
                let v294 = [v287, ..v293]
                let v295 = erlang_term_apply(v289, v291, v294)
                let v296 = erlang_term_coerce(v295)
                let v297 = v296 > v277
                let v298 =
                    case v297 {
                        True -> v296
                        False -> v277
                    }
                let v300 = atom.create("millisecond")
                let v301 = erlang_term_coerce(v300)
                let v302 = atom.create(v281)
                let v304 = atom.create("monotonic_time")
                let v305 = []
                let v306 = [v301, ..v305]
                let v307 = erlang_term_apply(v302, v304, v306)
                let v308 = erlang_term_coerce(v307)
                let v309 = spiral_wrap_signed(v2, 64)
                let v310 = spiral_wrap_signed(v308 + v309, 64)
                let #(v311, v312, v313, v314, v315, v316, v317, v318, v319, v320, v321, v322, v323, v324, v325, v326, v327, v328, v329, v330, v331, v332, v333, v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344, v345, v346, v347, v348) = harvested_288(v1, v310, v240, v241, v242, v243, v244, v245, v246, v247, v248, v249, v250, v251, v252, v253, v254, v255, v256, v257, v258, v259, v260, v261, v262, v263, v264, v265, v266, v267, v268, v269, v270, v271, v272, v273, v274, v275, v276, v298)
                method240(v0, v1, v2, v44, v311, v312, v313, v314, v315, v316, v317, v318, v319, v320, v321, v322, v323, v324, v325, v326, v327, v328, v329, v330, v331, v332, v333, v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344, v345, v346, v347, v348)
            }
            _ -> {
                let #(v387, v388, v389, v390, v391, v392, v393, v394, v395, v396, v397, v398, v399, v400, v401, v402, v403, v404, v405, v406, v407, v408, v409, v410, v411, v412, v413, v414, v415, v416, v417, v418, v419, v420, v421, v422, v423, v424) =
                    case v3  {
                        Uh15Nil -> #(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v387, v388, v389, v390, v391, v392, v393, v394, v395, v396, v397, v398, v399, v400, v401, v402, v403, v404, v405, v406, v407, v408, v409, v410, v411, v412, v413, v414, v415, v416, v417, v418, v419, v420, v421, v422, v423, v424)
            }
        }
    #(v425, v426, v427, v428, v429, v430, v431, v432, v433, v434, v435, v436, v437, v438, v439, v440, v441, v442, v443, v444, v445, v446, v447, v448, v449, v450, v451, v452, v453, v454, v455, v456, v457, v458, v459, v460, v461, v462)
}

pub fn collected_291(v0: process.Subject(#(String, process.Pid, Us45, String)), v1: Int, v2: dict.Dict(Int, Nil), v3: Uh15, v4: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v5: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v6: dict.Dict(String, String), v7: dict.Dict(String, Uh3), v8: dict.Dict(String, dict.Dict(String, Nil)), v9: dict.Dict(String, #(Int, Bool)), v10: dict.Dict(String, Nil), v11: Int, v12: Int, v13: Int, v14: Int, v15: dict.Dict(String, Uh3), v16: Uh3, v17: dict.Dict(String, #(Us45, String)), v18: dict.Dict(String, Int), v19: dict.Dict(String, String), v20: dict.Dict(String, String), v21: dict.Dict(String, Int), v22: Int, v23: dict.Dict(String, Int), v24: dict.Dict(String, Int), v25: dict.Dict(String, Int), v26: Int, v27: Int, v28: Int, v29: Int, v30: Int, v31: dict.Dict(String, #(String, Us45, String)), v32: Bool, v33: Bool, v34: Us30, v35: Bool, v36: Int, v37: Uh28, v38: dict.Dict(String, process.Pid), v39: Int) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, dict.Dict(String, process.Pid), Int) {
    let v40 = process.receive(v0, v1)
    let v41 = result.is_ok(v40)
    let v48 =
        case v41 {
            True -> {
                let #(v42, v43, v44, v45) = result.lazy_unwrap(v40, fn() { panic })
                Us65Got(v42, v43, v44, v45)
            }
            False -> Us65TimedOut
        }
    let v56 =
        case v48  {
            Us65Got(v49, v50, v51, v52) -> Us64Some(v49, v50, v51, v52)
            Us65TimedOut -> Us64None
        }
    let #(v314, v315, v316, v317, v318, v319, v320, v321, v322, v323, v324, v325, v326, v327, v328, v329, v330, v331, v332, v333, v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344, v345, v346, v347, v348, v349, v350, v351) =
        case v56  {
            Us64Some(v57, v58, v59, v60) -> {
                let v62 = dict.get(v38, v57)
                let v63 = method286()
                let v64 = method287()
                let v65 = case v62 { Ok(x) -> v63(x) Error(x) -> v64(x) }
                let v70 =
                    case v65  {
                        Us62Error -> Us63None
                        Us62Ok(v66) -> Us63Some(v66)
                    }
                let v76 =
                    case v70  {
                        Us63None -> False
                        Us63Some(v71) -> {
                            let v72 = erlang_term_coerce(v71)
                            let v73 = erlang_term_coerce(v58)
                            v72 == v73
                        }
                    }
                let v77 = v76 == False
                let #(v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216, v217, v218, v219, v220, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230, v231, v232, v233, v234, v235, v236, v237) =
                    case v77 {
                        True -> #(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39)
                        False -> {
                            let v78 = dict.get(v15, v57)
                            let v79 = method253()
                            let v80 = method254()
                            let v81 = case v78 { Ok(x) -> v79(x) Error(x) -> v80(x) }
                            let v86 =
                                case v81  {
                                    Us52Error -> Us53None
                                    Us52Ok(v82) -> Us53Some(v82)
                                }
                            let #(v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198) =
                                case v86  {
                                    Us53Some(v87) -> {
                                        let v88 = dict.delete(v15, v57)
                                        let v89 = dict.insert(v17, v57, #(v59, v60))
                                        case v35 {
                                            True -> {
                                                let v90 = method289(v57, v59, v60, v87, v31)
                                                #(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v88, v16, v89, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v90, v32, v33, v34, v35, v36, v37)
                                            }
                                            False -> #(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v88, v16, v89, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37)
                                        }
                                    }
                                    _ -> {
                                        let #(v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162) =
                                            case v86  {
                                                Us53None -> #(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37)
                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                            }
                                        #(v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162)
                                    }
                                }
                            let v199 = dict.delete(v38, v57)
                            #(v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v39)
                        }
                    }
                collected_291(v0, 0, v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216, v217, v218, v219, v220, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230, v231, v232, v233, v234, v235, v236, v237)
            }
            _ -> {
                let #(v276, v277, v278, v279, v280, v281, v282, v283, v284, v285, v286, v287, v288, v289, v290, v291, v292, v293, v294, v295, v296, v297, v298, v299, v300, v301, v302, v303, v304, v305, v306, v307, v308, v309, v310, v311, v312, v313) =
                    case v56  {
                        Us64None -> #(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v276, v277, v278, v279, v280, v281, v282, v283, v284, v285, v286, v287, v288, v289, v290, v291, v292, v293, v294, v295, v296, v297, v298, v299, v300, v301, v302, v303, v304, v305, v306, v307, v308, v309, v310, v311, v312, v313)
            }
        }
    #(v314, v315, v316, v317, v318, v319, v320, v321, v322, v323, v324, v325, v326, v327, v328, v329, v330, v331, v332, v333, v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344, v345, v346, v347, v348, v349, v350, v351)
}

pub fn method293(v0: String, v1: Uh3, v2: dict.Dict(String, #(String, Us45, String))) -> dict.Dict(String, #(String, Us45, String)) {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v7 = dict.insert(v2, v3, #(v0, Us45Erred, "no reply within 600 s"))
            method293(v0, v4, v7)
        }
        Uh3Nil -> v2
    }
}

pub fn method292(v0: dict.Dict(String, process.Pid), v1: Uh3, v2: dict.Dict(Int, Nil), v3: Uh15, v4: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v5: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v6: dict.Dict(String, String), v7: dict.Dict(String, Uh3), v8: dict.Dict(String, dict.Dict(String, Nil)), v9: dict.Dict(String, #(Int, Bool)), v10: dict.Dict(String, Nil), v11: Int, v12: Int, v13: Int, v14: Int, v15: dict.Dict(String, Uh3), v16: Uh3, v17: dict.Dict(String, #(Us45, String)), v18: dict.Dict(String, Int), v19: dict.Dict(String, String), v20: dict.Dict(String, String), v21: dict.Dict(String, Int), v22: Int, v23: dict.Dict(String, Int), v24: dict.Dict(String, Int), v25: dict.Dict(String, Int), v26: Int, v27: Int, v28: Int, v29: Int, v30: Int, v31: dict.Dict(String, #(String, Us45, String)), v32: Bool, v33: Bool, v34: Us30, v35: Bool, v36: Int, v37: Uh28, v38: dict.Dict(String, process.Pid), v39: Int) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, dict.Dict(String, process.Pid), Int) {
    let #(v309, v310, v311, v312, v313, v314, v315, v316, v317, v318, v319, v320, v321, v322, v323, v324, v325, v326, v327, v328, v329, v330, v331, v332, v333, v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344, v345, v346) =
        case v1  {
            Uh3Cons(v40, v41) -> {
                let v42 = dict.get(v0, v40)
                let v43 = method286()
                let v44 = method287()
                let v45 = case v42 { Ok(x) -> v43(x) Error(x) -> v44(x) }
                let v50 =
                    case v45  {
                        Us62Error -> Us63None
                        Us62Ok(v46) -> Us63Some(v46)
                    }
                let v54 =
                    case v50  {
                        Us63None -> panic as "dict.present: the key is not in the dict"
                        Us63Some(v51) -> v51
                    }
                process.kill(v54)
                let v55 = dict.get(v38, v40)
                let v56 = method286()
                let v57 = method287()
                let v58 = case v55 { Ok(x) -> v56(x) Error(x) -> v57(x) }
                let v63 =
                    case v58  {
                        Us62Error -> Us63None
                        Us62Ok(v59) -> Us63Some(v59)
                    }
                let v69 =
                    case v63  {
                        Us63None -> False
                        Us63Some(v64) -> {
                            let v65 = erlang_term_coerce(v64)
                            let v66 = erlang_term_coerce(v54)
                            v65 == v66
                        }
                    }
                let v70 = v69 == False
                let #(v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216, v217, v218, v219, v220, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230, v231, v232) =
                    case v70 {
                        True -> #(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39)
                        False -> {
                            let v71 = dict.get(v15, v40)
                            let v72 = method253()
                            let v73 = method254()
                            let v74 = case v71 { Ok(x) -> v72(x) Error(x) -> v73(x) }
                            let v79 =
                                case v74  {
                                    Us52Error -> Us53None
                                    Us52Ok(v75) -> Us53Some(v75)
                                }
                            let #(v158, v159, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193) =
                                case v79  {
                                    Us53Some(v80) -> {
                                        let v81 = dict.delete(v15, v40)
                                        let v84 = dict.insert(v17, v40, #(Us45Erred, "no reply within 600 s"))
                                        case v35 {
                                            True -> {
                                                let v85 = method293(v40, v80, v31)
                                                #(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v81, v16, v84, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v85, v32, v33, v34, v35, v36, v37)
                                            }
                                            False -> #(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v81, v16, v84, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37)
                                        }
                                    }
                                    _ -> {
                                        let #(v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157) =
                                            case v79  {
                                                Us53None -> #(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37)
                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                            }
                                        #(v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157)
                                    }
                                }
                            let v194 = dict.delete(v38, v40)
                            #(v158, v159, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v39)
                        }
                    }
                method292(v0, v41, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216, v217, v218, v219, v220, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230, v231, v232)
            }
            _ -> {
                let #(v271, v272, v273, v274, v275, v276, v277, v278, v279, v280, v281, v282, v283, v284, v285, v286, v287, v288, v289, v290, v291, v292, v293, v294, v295, v296, v297, v298, v299, v300, v301, v302, v303, v304, v305, v306, v307, v308) =
                    case v1  {
                        Uh3Nil -> #(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v271, v272, v273, v274, v275, v276, v277, v278, v279, v280, v281, v282, v283, v284, v285, v286, v287, v288, v289, v290, v291, v292, v293, v294, v295, v296, v297, v298, v299, v300, v301, v302, v303, v304, v305, v306, v307, v308)
            }
        }
    #(v309, v310, v311, v312, v313, v314, v315, v316, v317, v318, v319, v320, v321, v322, v323, v324, v325, v326, v327, v328, v329, v330, v331, v332, v333, v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344, v345, v346)
}

pub fn settled_runs_290(v0: fn(Uh3) -> #(Us45, String), v1: process.Subject(#(String, process.Pid, Us45, String)), v2: dict.Dict(Int, Nil), v3: Uh15, v4: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v5: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v6: dict.Dict(String, String), v7: dict.Dict(String, Uh3), v8: dict.Dict(String, dict.Dict(String, Nil)), v9: dict.Dict(String, #(Int, Bool)), v10: dict.Dict(String, Nil), v11: Int, v12: Int, v13: Int, v14: Int, v15: dict.Dict(String, Uh3), v16: Uh3, v17: dict.Dict(String, #(Us45, String)), v18: dict.Dict(String, Int), v19: dict.Dict(String, String), v20: dict.Dict(String, String), v21: dict.Dict(String, Int), v22: Int, v23: dict.Dict(String, Int), v24: dict.Dict(String, Int), v25: dict.Dict(String, Int), v26: Int, v27: Int, v28: Int, v29: Int, v30: Int, v31: dict.Dict(String, #(String, Us45, String)), v32: Bool, v33: Bool, v34: Us30, v35: Bool, v36: Int, v37: Uh28, v38: dict.Dict(String, process.Pid), v39: Int) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, dict.Dict(String, process.Pid), Int) {
    let v40 = dict.keys(v10)
    let v41 = dictm_term_sorted(v40)
    let listm_fold = v41 |> list.fold (Uh3Nil, fn (acc, x) {
    let v43 = x
    let v44 = acc
    Uh3Cons(v43, v44)
    })
    let v46 = listm_fold
    let v47 = dict.new()
    let #(v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83) = method277(v46, v2, v3, v4, v5, v6, v7, v8, v9, v47, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37)
    let #(v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119) = started_queued_282(v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83)
    let v120 = dict.size(v97)
    let v121 = dict.size(v99)
    let v122 = v120 > v111
    let v123 =
        case v122 {
            True -> v120
            False -> v111
        }
    let v124 = v121 > v112
    let v125 =
        case v124 {
            True -> v121
            False -> v112
        }
    let v127 = method284(v119, Uh28Nil)
    let #(v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166) = method285(v0, v1, v127, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v123, v125, v113, v114, v115, v116, v117, v118, Uh28Nil, v38, v39)
    let v167 = dict.size(v165)
    let v168 = v167 == 0
    let #(v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344, v345, v346, v347, v348, v349, v350, v351, v352, v353, v354, v355, v356, v357, v358, v359, v360, v361, v362, v363, v364, v365, v366, v367, v368, v369, v370, v371) =
        case v168 {
            True -> #(v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166)
            False -> {
                let #(v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207) = collected_291(v1, 600000, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166)
                let v208 = dict.size(v206)
                let v209 = dict.size(v165)
                let v210 = v208 == v209
                let #(v258, v259, v260, v261, v262, v263, v264, v265, v266, v267, v268, v269, v270, v271, v272, v273, v274, v275, v276, v277, v278, v279, v280, v281, v282, v283, v284, v285, v286, v287, v288, v289, v290, v291, v292, v293, v294, v295) =
                    case v210 {
                        True -> {
                            let v211 = dict.keys(v206)
                            let v212 = dictm_term_sorted(v211)
                            let listm_fold = v212 |> list.fold (Uh3Nil, fn (acc, x) {
                            let v214 = x
                            let v215 = acc
                            Uh3Cons(v214, v215)
                            })
                            let v217 = listm_fold
                            let v219 = method4(v217, Uh3Nil)
                            let #(v220, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230, v231, v232, v233, v234, v235, v236, v237, v238, v239, v240, v241, v242, v243, v244, v245, v246, v247, v248, v249, v250, v251, v252, v253, v254, v255, v256, v257) = method292(v206, v219, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207)
                            #(v220, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230, v231, v232, v233, v234, v235, v236, v237, v238, v239, v240, v241, v242, v243, v244, v245, v246, v247, v248, v249, v250, v251, v252, v253, v254, v255, v256, v257)
                        }
                        False -> #(v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207)
                    }
                let #(v296, v297, v298, v299, v300, v301, v302, v303, v304, v305, v306, v307, v308, v309, v310, v311, v312, v313, v314, v315, v316, v317, v318, v319, v320, v321, v322, v323, v324, v325, v326, v327, v328, v329, v330, v331, v332, v333) = settled_runs_290(v0, v1, v258, v259, v260, v261, v262, v263, v264, v265, v266, v267, v268, v269, v270, v271, v272, v273, v274, v275, v276, v277, v278, v279, v280, v281, v282, v283, v284, v285, v286, v287, v288, v289, v290, v291, v292, v293, v294, v295)
                #(v296, v297, v298, v299, v300, v301, v302, v303, v304, v305, v306, v307, v308, v309, v310, v311, v312, v313, v314, v315, v316, v317, v318, v319, v320, v321, v322, v323, v324, v325, v326, v327, v328, v329, v330, v331, v332, v333)
            }
        }
    #(v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344, v345, v346, v347, v348, v349, v350, v351, v352, v353, v354, v355, v356, v357, v358, v359, v360, v361, v362, v363, v364, v365, v366, v367, v368, v369, v370, v371)
}

pub fn method294(v0: dict.Dict(String, Int), v1: Int, v2: Uh3, v3: Uh3) -> Uh3 {
    case v2  {
        Uh3Cons(v4, v5) -> {
            let v6 = method294(v0, v1, v5, v3)
            Uh3Cons(v4, v6)
        }
        Uh3Nil -> v3
    }
}

pub fn method295(v0: dict.Dict(Int, Nil), v1: Uh15, v2: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v3: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v4: dict.Dict(String, String), v5: dict.Dict(String, Uh3), v6: dict.Dict(String, dict.Dict(String, Nil)), v7: dict.Dict(String, #(Int, Bool)), v8: dict.Dict(String, Nil), v9: Int, v10: Int, v11: Int, v12: Int, v13: dict.Dict(String, dict.Dict(String, Nil)), v14: Uh3, v15: dict.Dict(String, String)) -> dict.Dict(String, String) {
    case v14  {
        Uh3Cons(v16, v17) -> {
            let v18 = dict.get(v13, v16)
            let v19 = method265()
            let v20 = method266()
            let v21 = case v18 { Ok(x) -> v19(x) Error(x) -> v20(x) }
            let v26 =
                case v21  {
                    Us59Error -> Us60None
                    Us59Ok(v22) -> Us60Some(v22)
                }
            let _v30 =
                case v26  {
                    Us60None -> panic as "dict.present: the key is not in the dict"
                    Us60Some(v27) -> v27
                }
            let v31 = dict.get(v6, v16)
            let v32 = method265()
            let v33 = method266()
            let v34 = case v31 { Ok(x) -> v32(x) Error(x) -> v33(x) }
            let v39 =
                case v34  {
                    Us59Error -> Us60None
                    Us59Ok(v35) -> Us60Some(v35)
                }
            let v40 = dict.get(v3, v16)
            let v41 = method256()
            let v42 = method257()
            let v43 = case v40 { Ok(x) -> v41(x) Error(x) -> v42(x) }
            let v50 =
                case v43  {
                    Us54Error -> Us55None
                    Us54Ok(v44, v45, v46) -> Us55Some(v44, v45, v46)
                }
            let v73 =
                case v39  {
                    Us60Some(v51) -> {
                        case v50  {
                            Us55Some(v52, v53, v54) -> {
                                let v55 = dict.size(v51)
                                let v56 = v55 > 0
                                let v58 =
                                    case v56 {
                                        True -> {
                                            v54 == False
                                        }
                                        False -> False
                                    }
                                case v58 {
                                    True -> {
                                        let v59 = dict.get(v4, v16)
                                        let v60 = method258()
                                        let v61 = method259()
                                        let v62 = case v59 { Ok(x) -> v60(x) Error(x) -> v61(x) }
                                        case v62  {
                                            Us56Error -> Us2None
                                            Us56Ok(v63) -> Us2Some(v63)
                                        }
                                    }
                                    False -> Us2None
                                }
                            }
                            _ -> Us2None
                        }
                    }
                    _ -> Us2None
                }
            let v77 =
                case v73  {
                    Us2None -> v15
                    Us2Some(v74) -> {
                        dict.insert(v15, v16, v74)
                    }
                }
            method295(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v17, v77)
        }
        Uh3Nil -> v15
    }
}

pub fn ok_c67(capt: Nil) -> fn(#(Us45, String)) -> Us66 {
    fn (dom) {
        let #(v0, v1) = dom
        Us66Ok(v0, v1)
    }
}

pub fn method297() -> fn(#(Us45, String)) -> Us66 {
    ok_c67(Nil)
}

pub fn error_c68(capt: Nil) -> fn(Nil) -> Us66 {
    fn (dom) {
        Us66Error
    }
}

pub fn method298() -> fn(Nil) -> Us66 {
    error_c68(Nil)
}

pub fn method296(v0: dict.Dict(Int, Nil), v1: Uh15, v2: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v3: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v4: dict.Dict(String, String), v5: dict.Dict(String, Uh3), v6: dict.Dict(String, dict.Dict(String, Nil)), v7: dict.Dict(String, #(Int, Bool)), v8: dict.Dict(String, Nil), v9: Int, v10: Int, v11: Int, v12: Int, v13: dict.Dict(String, Uh3), v14: Uh3, v15: dict.Dict(String, #(Us45, String)), v16: dict.Dict(String, Int), v17: dict.Dict(String, String), v18: dict.Dict(String, String), v19: dict.Dict(String, Int), v20: Int, v21: dict.Dict(String, Int), v22: dict.Dict(String, Int), v23: dict.Dict(String, Int), v24: Int, v25: Int, v26: Int, v27: Int, v28: Int, v29: dict.Dict(String, #(String, Us45, String)), v30: Bool, v31: Bool, v32: Us30, v33: Bool, v34: Int, v35: Uh28, v36: dict.Dict(String, String), v37: Uh3, v38: dict.Dict(String, #(String, Us45, String))) -> dict.Dict(String, #(String, Us45, String)) {
    case v37  {
        Uh3Cons(v39, v40) -> {
            let v41 = dict.get(v36, v39)
            let v42 = method258()
            let v43 = method259()
            let v44 = case v41 { Ok(x) -> v42(x) Error(x) -> v43(x) }
            let v49 =
                case v44  {
                    Us56Error -> Us2None
                    Us56Ok(v45) -> Us2Some(v45)
                }
            let v53 =
                case v49  {
                    Us2None -> panic as "dict.present: the key is not in the dict"
                    Us2Some(v50) -> v50
                }
            let v54 = dict.get(v15, v53)
            let v55 = method297()
            let v56 = method298()
            let v57 = case v54 { Ok(x) -> v55(x) Error(x) -> v56(x) }
            let v63 =
                case v57  {
                    Us66Error -> Us67None
                    Us66Ok(v58, v59) -> Us67Some(v58, v59)
                }
            let v68 =
                case v63  {
                    Us67None -> v38
                    Us67Some(v64, v65) -> {
                        dict.insert(v38, v39, #(v53, v64, v65))
                    }
                }
            method296(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v40, v68)
        }
        Uh3Nil -> v38
    }
}

pub fn closure42(capt: #(Int, fn(Uh3) -> #(Us45, String), Bool, Bool, Us30, Bool, Int)) -> fn(Uh15) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, Int) {
    fn (v7) {
        let #(v0, v1, v2, v3, v4, v5, v6) = capt
        let v8 = process.new_subject()
        let v9 = dict.new()
        let v10 = dict.new()
        let v11 = dict.new()
        let v12 = dict.new()
        let v13 = dict.new()
        let v14 = dict.new()
        let v15 = dict.new()
        let v16 = dict.new()
        let v17 = dict.new()
        let v18 = dict.new()
        let v19 = dict.new()
        let v20 = dict.new()
        let v21 = dict.new()
        let v22 = dict.new()
        let v23 = dict.new()
        let v24 = dict.new()
        let v25 = dict.new()
        let v26 = dict.new()
        let v27 = dict.new()
        let #(v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79) = method240(v1, v8, v0, v7, v9, Uh15Nil, v10, v11, v12, v13, v14, v15, v16, 0, 0, 0, 0, v17, Uh3Nil, v18, v19, v20, v21, v22, 0, v23, v24, v25, 0, 0, 0, 0, 0, v26, v2, v3, v4, v5, v6, Uh28Nil, v27, 0)
        let #(v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, _v116, v117) = settled_runs_290(v1, v8, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79)
        let v118 = dict.keys(v99)
        let v119 = dictm_term_sorted(v118)
        let listm_fold = v119 |> list.fold (Uh3Nil, fn (acc, x) {
        let v121 = x
        let v122 = acc
        Uh3Cons(v121, v122)
        })
        let v124 = listm_fold
        let v126 = method294(v99, v100, v124, Uh3Nil)
        let v127 = method275(v126, v99)
        let #(v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163) = method276(v126, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v127, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115)
        let v164 = dict.size(v157)
        let v165 = v164 > 0
        let #(v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216, v217, v218, v219, v220, v221, v222, v223) =
            case v165 {
                True -> #(v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163)
                False -> {
                    let v166 = dict.new()
                    let v167 = dict.keys(v134)
                    let v168 = dictm_term_sorted(v167)
                    let listm_fold = v168 |> list.fold (Uh3Nil, fn (acc, x) {
                    let v170 = x
                    let v171 = acc
                    Uh3Cons(v170, v171)
                    })
                    let v173 = listm_fold
                    let v175 = method4(v173, Uh3Nil)
                    let v176 = method295(v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v134, v175, v166)
                    let v177 = dict.new()
                    let v178 = dict.keys(v176)
                    let v179 = dictm_term_sorted(v178)
                    let listm_fold = v179 |> list.fold (Uh3Nil, fn (acc, x) {
                    let v181 = x
                    let v182 = acc
                    Uh3Cons(v181, v182)
                    })
                    let v184 = listm_fold
                    let v186 = method4(v184, Uh3Nil)
                    let v187 = method296(v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v176, v186, v177)
                    #(v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v187, v158, v159, v160, v161, v162, v163)
                }
            }
        #(v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216, v217, v218, v219, v220, v221, v222, v223, v117)
    }
}

pub fn closure41(capt: #(Int, fn(Uh3) -> #(Us45, String))) -> fn(#(Bool, Bool, Us30, Bool, Int)) -> fn(Uh15) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, Int) {
    fn (dom) {
        let #(v2, v3, v4, v5, v6) = dom
        let #(v0, v1) = capt
        closure42(#(v0, v1, v2, v3, v4, v5, v6))
    }
}

pub fn closure40(capt: #(Int)) -> fn(fn(Uh3) -> #(Us45, String)) -> fn(#(Bool, Bool, Us30, Bool, Int)) -> fn(Uh15) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, Int) {
    fn (v1) {
        let #(v0) = capt
        closure41(#(v0, v1))
    }
}

pub fn closure39(capt: Nil) -> fn(Int) -> fn(fn(Uh3) -> #(Us45, String)) -> fn(#(Bool, Bool, Us30, Bool, Int)) -> fn(Uh15) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, Int) {
    fn (v0) {
        closure40(#(v0))
    }
}
