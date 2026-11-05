import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/erlang/process
import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Us2, type Uh15, type Us30, type Us45, type Uh28, type Us66, type Uh29, Uh15Nil, Uh28Nil, Uh29Cons, Uh29Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us45Done, Us45Erred, Us52Error, Us52Ok, Us53None, Us53Some, Us54Error, Us54Ok, Us55None, Us55Some, Us56Error, Us56Ok, Us59Error, Us59Ok, Us60None, Us60Some, Us62Error, Us62Ok, Us63None, Us63Some, Us66Error, Us66Ok, Us67None, Us67Some}
import xsim_frames/part1.{dictm_term_sorted, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, method4, spiral_wrap_signed}
import xsim_frames/part10.{method253, method254, method256, method257, method258, method259}
import xsim_frames/part11.{method265, method266, method275, method276}
import xsim_frames/part12.{collected_291, method240, method277, method284, method285, method286, method287, method293, started_queued_282}
import xsim_frames/part2.{method20}

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
                            let v67 = v65 == v66
                            v67
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
                                        let v82 = Us45Erred
                                        let v83 = "no reply within 600 s"
                                        let v84 = dict.insert(v17, v40, #(v82, v83))
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
    let v42 = Uh3Nil
    let listm_fold = v41 |> list.fold (v42, fn (acc, x) {
    let v43 = x
    let v44 = acc
    let v45 = Uh3Cons(v43, v44)
    v45
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
    let v126 = Uh28Nil
    let v127 = method284(v119, v126)
    let v128 = Uh28Nil
    let #(v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166) = method285(v0, v1, v127, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v123, v125, v113, v114, v115, v116, v117, v118, v128, v38, v39)
    let v167 = dict.size(v165)
    let v168 = v167 == 0
    let #(v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344, v345, v346, v347, v348, v349, v350, v351, v352, v353, v354, v355, v356, v357, v358, v359, v360, v361, v362, v363, v364, v365, v366, v367, v368, v369, v370, v371) =
        case v168 {
            True -> #(v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166)
            False -> {
                let v169 = 600000
                let #(v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207) = collected_291(v1, v169, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166)
                let v208 = dict.size(v206)
                let v209 = dict.size(v165)
                let v210 = v208 == v209
                let #(v258, v259, v260, v261, v262, v263, v264, v265, v266, v267, v268, v269, v270, v271, v272, v273, v274, v275, v276, v277, v278, v279, v280, v281, v282, v283, v284, v285, v286, v287, v288, v289, v290, v291, v292, v293, v294, v295) =
                    case v210 {
                        True -> {
                            let v211 = dict.keys(v206)
                            let v212 = dictm_term_sorted(v211)
                            let v213 = Uh3Nil
                            let listm_fold = v212 |> list.fold (v213, fn (acc, x) {
                            let v214 = x
                            let v215 = acc
                            let v216 = Uh3Cons(v214, v215)
                            v216
                            })
                            let v217 = listm_fold
                            let v218 = Uh3Nil
                            let v219 = method4(v217, v218)
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
                                            let v57 = v54 == False
                                            v57
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
                        let v75 = dict.insert(v15, v16, v74)
                        v75
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
                        let v66 = dict.insert(v38, v39, #(v53, v64, v65))
                        v66
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
        let v28 = Uh15Nil
        let v29 = 0
        let v30 = 0
        let v31 = 0
        let v32 = 0
        let v33 = Uh3Nil
        let v34 = 0
        let v35 = 0
        let v36 = 0
        let v37 = 0
        let v38 = 0
        let v39 = 0
        let v40 = Uh28Nil
        let v41 = 0
        let #(v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79) = method240(v1, v8, v0, v7, v9, v28, v10, v11, v12, v13, v14, v15, v16, v29, v30, v31, v32, v17, v33, v18, v19, v20, v21, v22, v34, v23, v24, v25, v35, v36, v37, v38, v39, v26, v2, v3, v4, v5, v6, v40, v27, v41)
        let #(v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, _v116, v117) = settled_runs_290(v1, v8, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79)
        let v118 = dict.keys(v99)
        let v119 = dictm_term_sorted(v118)
        let v120 = Uh3Nil
        let listm_fold = v119 |> list.fold (v120, fn (acc, x) {
        let v121 = x
        let v122 = acc
        let v123 = Uh3Cons(v121, v122)
        v123
        })
        let v124 = listm_fold
        let v125 = Uh3Nil
        let v126 = method294(v99, v100, v124, v125)
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
                    let v169 = Uh3Nil
                    let listm_fold = v168 |> list.fold (v169, fn (acc, x) {
                    let v170 = x
                    let v171 = acc
                    let v172 = Uh3Cons(v170, v171)
                    v172
                    })
                    let v173 = listm_fold
                    let v174 = Uh3Nil
                    let v175 = method4(v173, v174)
                    let v176 = method295(v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v134, v175, v166)
                    let v177 = dict.new()
                    let v178 = dict.keys(v176)
                    let v179 = dictm_term_sorted(v178)
                    let v180 = Uh3Nil
                    let listm_fold = v179 |> list.fold (v180, fn (acc, x) {
                    let v181 = x
                    let v182 = acc
                    let v183 = Uh3Cons(v181, v182)
                    v183
                    })
                    let v184 = listm_fold
                    let v185 = Uh3Nil
                    let v186 = method4(v184, v185)
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

pub fn method299(v0: Uh3, v1: Uh29) -> Uh29 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method299(v3, v1)
            let v5 = "spiral"
            let v6 = atom.create(v5)
            let v7 = erlang_term_coerce(v6)
            let v8 = erlang_term_coerce(v2)
            let v9 = "source"
            let v10 = atom.create(v9)
            let v11 = erlang_term_coerce(v10)
            let v12 = "kind"
            let v13 = atom.create(v12)
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
            let v31 = "maps"
            let v32 = atom.create(v31)
            let v33 = "from_list"
            let v34 = atom.create(v33)
            let v35 = []
            let v36 = [v30, ..v35]
            let v37 = erlang_term_apply(v32, v34, v36)
            Uh29Cons(v37, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method300(v0: Uh29, v1: List(Dynamic)) -> List(Dynamic) {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method300(v3, v1)
            let v5 = [v2, ..v4]
            v5
        }
        Uh29Nil -> v1
    }
}

pub fn items_from_301(v0: Dynamic, v1: Uh29) -> Uh29 {
    let v2 = []
    let v3 = erlang_term_coerce(v2)
    let v4 = v0 == v3
    case v4 {
        True -> v1
        False -> {
            let v5 = "erlang"
            let v6 = atom.create(v5)
            let v7 = "tl"
            let v8 = atom.create(v7)
            let v9 = []
            let v10 = [v0, ..v9]
            let v11 = erlang_term_apply(v6, v8, v10)
            let v12 = atom.create(v5)
            let v13 = "hd"
            let v14 = atom.create(v13)
            let v15 = []
            let v16 = [v0, ..v15]
            let v17 = erlang_term_apply(v12, v14, v16)
            let v18 = Uh29Cons(v17, v1)
            items_from_301(v11, v18)
        }
    }
}

pub fn method302(v0: Uh29, v1: Uh29) -> Uh29 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method302(v3, v1)
            let v5 = erlang_term_coerce(v2)
            Uh29Cons(v5, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method303(v0: Uh29, v1: Int) -> Int {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = "hit"
            let v5 = atom.create(v4)
            let v6 = erlang_term_coerce(v5)
            let v7 = v2 == v6
            let v9 =
                case v7 {
                    True -> {
                        let v8 = spiral_wrap_signed(v1 + 1, 32)
                        v8
                    }
                    False -> v1
                }
            method303(v3, v9)
        }
        Uh29Nil -> v1
    }
}

pub fn method304(v0: Uh29, v1: Int) -> Int {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = "miss"
            let v5 = atom.create(v4)
            let v6 = erlang_term_coerce(v5)
            let v7 = v2 == v6
            let v9 =
                case v7 {
                    True -> {
                        let v8 = spiral_wrap_signed(v1 + 1, 32)
                        v8
                    }
                    False -> v1
                }
            method304(v3, v9)
        }
        Uh29Nil -> v1
    }
}

pub fn closure69(capt: #(String, Bool, Dynamic)) -> fn(Uh3) -> #(Us45, String) {
    fn (v3) {
        let #(v0, v1, v2) = capt
        let v4 = Uh29Nil
        let v5 = method299(v3, v4)
        let v6 = []
        let v7 = method300(v5, v6)
        let v8 = erlang_term_coerce(v7)
        let v9 = "cells"
        let v10 = atom.create(v9)
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
        let v23 = "from_list"
        let v24 = atom.create(v23)
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
        let v37 = "root"
        let v38 = atom.create(v37)
        let v39 = erlang_term_coerce(v38)
        let v40 = []
        let v41 = [v28, ..v40]
        let v42 = [v39, ..v41]
        let v43 = erlang_term_tuple(v42)
        let v44 = "spiral_lib"
        let v45 = atom.create(v44)
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
        let v56 = "Elixir.Spiral.Cells.Notebook"
        let v57 = atom.create(v56)
        let v58 = "evaluate"
        let v59 = atom.create(v58)
        let v60 = []
        let v61 = [v55, ..v60]
        let v62 = [v27, ..v61]
        let v63 = erlang_term_apply(v57, v59, v62)
        let v64 = "erlang"
        let v65 = atom.create(v64)
        let v66 = "is_map"
        let v67 = atom.create(v66)
        let v68 = []
        let v69 = [v63, ..v68]
        let v70 = erlang_term_apply(v65, v67, v69)
        let v71 = erlang_term_coerce(v70)
        let #(v239, v240) =
            case v71 {
                True -> {
                    let v72 = 0
                    let v73 = method20(v3, v72)
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
                    let v94 = "values"
                    let v95 = atom.create(v94)
                    let v96 = []
                    let v97 = [v92, ..v96]
                    let v98 = erlang_term_apply(v93, v95, v97)
                    let v99 = "lists"
                    let v100 = atom.create(v99)
                    let v101 = "reverse"
                    let v102 = atom.create(v101)
                    let v103 = []
                    let v104 = [v98, ..v103]
                    let v105 = erlang_term_apply(v100, v102, v104)
                    let v106 = Uh29Nil
                    let v107 = items_from_301(v105, v106)
                    let v108 = Uh29Nil
                    let v109 = method302(v107, v108)
                    let v110 = 0
                    let v111 = method303(v109, v110)
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
                    let v123 = 0
                    let v124 = method304(v109, v123)
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
                    let v150 = "ok"
                    let v151 = atom.create(v150)
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
                    let v175 = "verdicts"
                    let v176 = atom.create(v175)
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
                    let v204 = "outputs"
                    let v205 = atom.create(v204)
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
                    let v236 = "unexpected "
                    let v237 = v236 <> v235 
                    let v238 = Us45Erred
                    #(v238, v237)
                }
            }
        #(v239, v240)
    }
}
