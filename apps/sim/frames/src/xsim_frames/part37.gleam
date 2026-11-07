import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Uh36, type Us115, Uh29Cons, Uh29Nil, Uh36Nil, Uh3Cons, Uh3Nil, Us109Error, Us109Ok, Us110None, Us110Some, Us115Error, Us115Ok, Us2None, Us2Some, Us3None, Us3Some, Us56Error, Us56Ok, Us72Error, Us72Ok, Us73Closed, Us73Failed, Us73Refused, Us73TimedOut, Us74Error, Us74Ok, Us75Error, Us75Ok, Us76Error, Us76Ok, Us80Error, Us80Ok}
import xsim_frames/part1.{closure1, erlang_term_apply, erlang_term_coerce, spiral_fs_coerce, spiral_fs_read_file, spiral_fs_write_file, spiral_string_slice, spiral_try_call, spiral_wrap_signed}
import xsim_frames/part12.{items_from_301}
import xsim_frames/part16.{method370, method371}
import xsim_frames/part27.{header_value_531, method542, method543}
import xsim_frames/part36.{included_users_690, method693, method694, with_posts_695}
import xsim_frames/part9.{method258, method259}

pub fn method692(v0: Uh29, v1: String, v2: String, v3: dict.Dict(String, Dynamic), v4: dict.Dict(String, Dynamic), v5: Int, v6: dict.Dict(String, Dynamic), v7: String, v8: Dynamic, v9: Uh3, v10: Dynamic, v11: dict.Dict(String, Nil), v12: Int, v13: Uh36, v14: String) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
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
                let v35 = method542()
                let v36 = method543()
                let v37 = case v34 { Ok(x) -> v35(x) Error(x) -> v36(x) }
                let v42 =
                    case v37  {
                        Us109Error -> Us110None
                        Us109Ok(v38) -> Us110Some(v38)
                    }
                let v103 =
                    case v42  {
                        Us110None -> True
                        Us110Some(v43) -> {
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
                            let v67 = method693(v65, Uh3Nil)
                            let v68 = method694(v67, v17)
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
                            let v89 = method693(v87, Uh3Nil)
                            let v90 = method694(v89, v17)
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
                let v149 = with_posts_695(v15, v6)
                method692(v16, v1, v2, v118, v148, v5, v149, v7, v8, v9, v10, v11, v12, v13, v14)
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

pub fn world_of_689(v0: String) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
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
                            Us110Some(v57)
                        }
                        False -> Us110None
                    }
                case v60  {
                    Us110None -> {
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
                    Us110Some(v61) -> v61
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
    let v144 = included_users_690(v0, v143)
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
    let v188 = dict.new()
    let v189 = dict.new()
    let _v190 = erlang_term_coerce(v145)
    let _v191 = erlang_term_coerce(v145)
    let v192 = dict.new()
    let v193 = erlang_term_coerce(v145)
    let v195 = erlang_term_coerce("me")
    let v196 = erlang_term_coerce(v193)
    let v197 = atom.create(v150)
    let v198 = atom.create(v152)
    let v199 = []
    let v200 = [v196, ..v199]
    let v201 = [v143, ..v200]
    let v202 = [v195, ..v201]
    let v203 = erlang_term_apply(v197, v198, v202)
    let v204 = erlang_term_coerce(v203)
    let v205 = atom.create(v150)
    let v207 = atom.create("new")
    let v208 = []
    let v209 = erlang_term_apply(v205, v207, v208)
    let v211 = erlang_term_coerce("oauth2")
    let v212 = erlang_term_coerce(v209)
    let v213 = atom.create(v150)
    let v214 = atom.create(v152)
    let v215 = []
    let v216 = [v212, ..v215]
    let v217 = [v143, ..v216]
    let v218 = [v211, ..v217]
    let v219 = erlang_term_apply(v213, v214, v218)
    let v220 = erlang_term_coerce(v219)
    let v221 = erlang_term_coerce(v145)
    let v223 = erlang_term_coerce("refresh_token")
    let v224 = erlang_term_coerce(v221)
    let v225 = atom.create(v150)
    let v226 = atom.create(v152)
    let v227 = []
    let v228 = [v224, ..v227]
    let v229 = [v220, ..v228]
    let v230 = [v223, ..v229]
    let v231 = erlang_term_apply(v225, v226, v230)
    let v232 = erlang_term_coerce(v231)
    let v233 = erlang_term_coerce(v232)
    let v235 = erlang_term_coerce("following_page_size")
    let v236 = erlang_term_coerce(100)
    let v237 = atom.create(v150)
    let v238 = atom.create(v152)
    let v239 = []
    let v240 = [v236, ..v239]
    let v241 = [v143, ..v240]
    let v242 = [v235, ..v241]
    let v243 = erlang_term_apply(v237, v238, v242)
    let v244 = erlang_term_coerce(v243)
    let v246 = Uh3Cons(v233, Uh3Nil)
    let #(v249, v250, v251, v252, v253, v254, v255, v256, v257, v258, v259, v260, v261, _v262) = method692(v144, v160, v173, v187, v188, v244, v189, v186, v143, v246, v204, v192, 9001, Uh36Nil, v145)
    let v263 = erlang_term_coerce(v0)
    let v265 = atom.create("filename")
    let v267 = atom.create("dirname")
    let v268 = []
    let v269 = [v263, ..v268]
    let v270 = erlang_term_apply(v265, v267, v269)
    let v272 = atom.create("unicode")
    let v274 = atom.create("characters_to_binary")
    let v275 = []
    let v276 = [v270, ..v275]
    let v277 = erlang_term_apply(v272, v274, v276)
    let v278 = erlang_term_coerce(v277)
    let v279 = { v278 } <> { "/media" }
    #(v249, v250, v251, v252, v253, v254, v255, v256, v257, v258, v259, v260, v261, v279)
}

pub fn received_699(v0: Dynamic, v1: String) -> String {
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
                let v26 = header_value_531("content-length", v24)
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
            received_699(v0, v117)
        }
    }
}

pub fn closure171(capt: #(fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String), String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String, String)) -> fn(Nil) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16) = capt
        let v17 = v0(#(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14))
        let v18 = v17(v15)
        v18(v16)
    }
}

pub fn ok_c172(capt: Nil) -> fn(#(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String)) -> Us115 {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14) = dom
        Us115Ok(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    }
}

pub fn error_c173(capt: Nil) -> fn(String) -> Us115 {
    fn (v0) {
        Us115Error(v0)
    }
}

pub fn handled_698(v0: fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String), v1: String, v2: String, v3: dict.Dict(String, Dynamic), v4: dict.Dict(String, Dynamic), v5: Int, v6: dict.Dict(String, Dynamic), v7: String, v8: Dynamic, v9: Uh3, v10: Dynamic, v11: dict.Dict(String, Nil), v12: Int, v13: Uh36, v14: String, v15: String, v16: Dynamic) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let v18 = received_699(v16, "")
    let v20 = option.from_result(result.map(string.split_once(v18, "\r\n\r\n"), pair.first))
    let v21 = closure1(Nil)
    let v22 = v20 |> option.map(v21)
    let v24 = v22 |> option.unwrap(Us2None)
    let v28 =
        case v24  {
            Us2None -> -1
            Us2Some(v25) -> {
                bit_array.byte_size(bit_array.from_string(v25))
            }
        }
    let v29 = v28 >= 0
    let v57 =
        case v29 {
            True -> {
                let v30 = erlang_term_coerce(v18)
                let v32 = atom.create("erlang")
                let v34 = atom.create("byte_size")
                let v35 = []
                let v36 = [v30, ..v35]
                let v37 = erlang_term_apply(v32, v34, v36)
                let v38 = erlang_term_coerce(v37)
                let v39 = spiral_wrap_signed(v28 + 4, 32)
                let v40 = spiral_wrap_signed(v28 - 1, 32)
                let v41 = spiral_string_slice(v18, 0, v40)
                let v43 = header_value_531("content-length", v41)
                let #(v44, v45) = case int.parse(string.trim(v43)) { Ok(n) -> #(n, 0) Error(Nil) -> #(0, 1) }
                let v46 = v45 == 0
                let v49 =
                    case v46 {
                        True -> Us3Some(v44)
                        False -> Us3None
                    }
                let v54 =
                    case v49  {
                        Us3None -> 0
                        Us3Some(v50) -> {
                            let v51 = v50 < 0
                            case v51 {
                                True -> 0
                                False -> v50
                            }
                        }
                    }
                let v55 = spiral_wrap_signed(v39 + v54, 32)
                v38 >= v55
            }
            False -> False
        }
    let #(v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200) =
        case v57 {
            True -> {
                let v58 = closure171(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v18))
                let v59 = ok_c172(Nil)
                let v60 = error_c173(Nil)
                let v61 = case spiral_try_call(v58) { Ok(v) -> v59(v) Error(e) -> v60(e) }
                let #(v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141) =
                    case v61  {
                        Us115Error(v77) -> {
                            let v78 = { "xsim serve / a request crashed: " } <> { v77 }
                            let v79 = { v78 } <> { "\n" }
                            let v81 = atom.create("standard_error")
                            let v82 = erlang_term_coerce(v81)
                            let v83 = erlang_term_coerce(v79)
                            let v85 = atom.create("io")
                            let v87 = atom.create("put_chars")
                            let v88 = []
                            let v89 = [v83, ..v88]
                            let v90 = [v82, ..v89]
                            let _v91 = erlang_term_apply(v85, v87, v90)
                            let v92 = { "request failed: " } <> { v77 }
                            let v93 = int.to_string(500)
                            let v94 = { "HTTP/1.1 " } <> { v93 }
                            let v95 = { v94 } <> { " " }
                            let v96 = { v95 } <> { "Internal Server Error" }
                            let v97 = erlang_term_coerce(v92)
                            let v99 = atom.create("erlang")
                            let v101 = atom.create("byte_size")
                            let v102 = []
                            let v103 = [v97, ..v102]
                            let v104 = erlang_term_apply(v99, v101, v103)
                            let v105 = erlang_term_coerce(v104)
                            let v106 = int.to_string(v105)
                            let v107 = { "\r\nContent-Length: " } <> { v106 }
                            let v108 = { "\r\nContent-Type: text/plain; charset=utf-8" } <> { v107 }
                            let v109 = { v108 } <> { "\r\nConnection: close\r\n\r\n" }
                            let v110 = { v96 } <> { v109 }
                            let v111 = { v110 } <> { v92 }
                            #(v111, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
                        }
                        Us115Ok(v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76) -> #(v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76)
                    }
                let v142 = erlang_term_coerce(v127)
                let v144 = atom.create("gen_tcp")
                let v146 = atom.create("send")
                let v147 = []
                let v148 = [v142, ..v147]
                let v149 = [v16, ..v148]
                let v150 = erlang_term_apply(v144, v146, v149)
                let v152 = atom.create("ok")
                let v153 = erlang_term_coerce(v152)
                let v154 = v150 == v153
                let _v186 =
                    case v154 {
                        True -> Us75Ok
                        False -> {
                            let v156 = erlang_term_coerce(2)
                            let v158 = atom.create("erlang")
                            let v160 = atom.create("element")
                            let v161 = []
                            let v162 = [v150, ..v161]
                            let v163 = [v156, ..v162]
                            let v164 = erlang_term_apply(v158, v160, v163)
                            let v166 = atom.create("econnrefused")
                            let v167 = erlang_term_coerce(v166)
                            let v168 = v164 == v167
                            let v184 =
                                case v168 {
                                    True -> Us73Refused
                                    False -> {
                                        let v171 = atom.create("timeout")
                                        let v172 = erlang_term_coerce(v171)
                                        let v173 = v164 == v172
                                        case v173 {
                                            True -> Us73TimedOut
                                            False -> {
                                                let v176 = atom.create("closed")
                                                let v177 = erlang_term_coerce(v176)
                                                let v178 = v164 == v177
                                                case v178 {
                                                    True -> Us73Closed
                                                    False -> {
                                                        let v180 = string.inspect(v164)
                                                        Us73Failed(v180)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            Us75Error(v184)
                        }
                    }
                #(v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141)
            }
            False -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
        }
    let v202 = atom.create("gen_tcp")
    let v204 = atom.create("close")
    let v205 = []
    let v206 = [v16, ..v205]
    let _v207 = erlang_term_apply(v202, v204, v206)
    #(v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200)
}

pub fn served_697(v0: fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String), v1: String, v2: String, v3: dict.Dict(String, Dynamic), v4: dict.Dict(String, Dynamic), v5: Int, v6: dict.Dict(String, Dynamic), v7: String, v8: Dynamic, v9: Uh3, v10: Dynamic, v11: dict.Dict(String, Nil), v12: Int, v13: Uh36, v14: String, v15: String, v16: Dynamic) -> Int {
    let v18 = atom.create("infinity")
    let v19 = erlang_term_coerce(v18)
    let v21 = atom.create("gen_tcp")
    let v23 = atom.create("accept")
    let v24 = []
    let v25 = [v19, ..v24]
    let v26 = [v16, ..v25]
    let v27 = erlang_term_apply(v21, v23, v26)
    let v28 = erlang_term_coerce(1)
    let v29 = "erlang"
    let v30 = atom.create(v29)
    let v31 = "element"
    let v32 = atom.create(v31)
    let v33 = []
    let v34 = [v27, ..v33]
    let v35 = [v28, ..v34]
    let v36 = erlang_term_apply(v30, v32, v35)
    let v38 = atom.create("ok")
    let v39 = erlang_term_coerce(v38)
    let v40 = v36 == v39
    let v77 =
        case v40 {
            True -> {
                let v41 = erlang_term_coerce(2)
                let v42 = atom.create(v29)
                let v43 = atom.create(v31)
                let v44 = []
                let v45 = [v27, ..v44]
                let v46 = [v41, ..v45]
                let v47 = erlang_term_apply(v42, v43, v46)
                Us72Ok(v47)
            }
            False -> {
                let v49 = erlang_term_coerce(2)
                let v50 = atom.create(v29)
                let v51 = atom.create(v31)
                let v52 = []
                let v53 = [v27, ..v52]
                let v54 = [v49, ..v53]
                let v55 = erlang_term_apply(v50, v51, v54)
                let v57 = atom.create("econnrefused")
                let v58 = erlang_term_coerce(v57)
                let v59 = v55 == v58
                let v75 =
                    case v59 {
                        True -> Us73Refused
                        False -> {
                            let v62 = atom.create("timeout")
                            let v63 = erlang_term_coerce(v62)
                            let v64 = v55 == v63
                            case v64 {
                                True -> Us73TimedOut
                                False -> {
                                    let v67 = atom.create("closed")
                                    let v68 = erlang_term_coerce(v67)
                                    let v69 = v55 == v68
                                    case v69 {
                                        True -> Us73Closed
                                        False -> {
                                            let v71 = string.inspect(v55)
                                            Us73Failed(v71)
                                        }
                                    }
                                }
                            }
                        }
                    }
                Us72Error(v75)
            }
        }
    let v83 =
        case v77  {
            Us72Error(v80) -> Us74Error(v80)
            Us72Ok(v78) -> Us74Ok(v78)
        }
    case v83  {
        Us74Error(v100) -> 1
        Us74Ok(v84) -> {
            let #(v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98) = handled_698(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v84)
            served_697(v0, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v15, v16)
        }
    }
}

pub fn opened_688(v0: fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String), v1: String, v2: String, v3: String, v4: Dynamic) -> Int {
    let v6 = atom.create("inet")
    let v8 = atom.create("port")
    let v9 = []
    let v10 = [v4, ..v9]
    let v11 = erlang_term_apply(v6, v8, v10)
    let v12 = erlang_term_coerce(1)
    let v13 = "erlang"
    let v14 = atom.create(v13)
    let v15 = "element"
    let v16 = atom.create(v15)
    let v17 = []
    let v18 = [v11, ..v17]
    let v19 = [v12, ..v18]
    let v20 = erlang_term_apply(v14, v16, v19)
    let v21 = "ok"
    let v22 = atom.create(v21)
    let v23 = erlang_term_coerce(v22)
    let v24 = v20 == v23
    let v61 =
        case v24 {
            True -> {
                let v25 = erlang_term_coerce(2)
                let v26 = atom.create(v13)
                let v27 = atom.create(v15)
                let v28 = []
                let v29 = [v11, ..v28]
                let v30 = [v25, ..v29]
                let v31 = erlang_term_apply(v26, v27, v30)
                Us72Ok(v31)
            }
            False -> {
                let v33 = erlang_term_coerce(2)
                let v34 = atom.create(v13)
                let v35 = atom.create(v15)
                let v36 = []
                let v37 = [v11, ..v36]
                let v38 = [v33, ..v37]
                let v39 = erlang_term_apply(v34, v35, v38)
                let v41 = atom.create("econnrefused")
                let v42 = erlang_term_coerce(v41)
                let v43 = v39 == v42
                let v59 =
                    case v43 {
                        True -> Us73Refused
                        False -> {
                            let v46 = atom.create("timeout")
                            let v47 = erlang_term_coerce(v46)
                            let v48 = v39 == v47
                            case v48 {
                                True -> Us73TimedOut
                                False -> {
                                    let v51 = atom.create("closed")
                                    let v52 = erlang_term_coerce(v51)
                                    let v53 = v39 == v52
                                    case v53 {
                                        True -> Us73Closed
                                        False -> {
                                            let v55 = string.inspect(v39)
                                            Us73Failed(v55)
                                        }
                                    }
                                }
                            }
                        }
                    }
                Us72Error(v59)
            }
        }
    let v66 =
        case v61  {
            Us72Error(v64) -> 0
            Us72Ok(v62) -> {
                erlang_term_coerce(v62)
            }
        }
    let v67 = int.to_string(v66)
    let v68 = spiral_fs_write_file(v2, v67)
    let v69 = spiral_fs_coerce(v68)
    let v70 = atom.create(v21)
    let v71 = v69 == v70
    let v72 = v71 == False
    case v72 {
        True -> panic as "file_system.write_all_text: the write failed"
        False -> Nil
    }
    let #(v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86) = world_of_689(v1)
    served_697(v0, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v3, v4)
}
