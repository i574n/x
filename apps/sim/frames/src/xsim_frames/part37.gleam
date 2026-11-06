import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh37, type Us115, Uh37Nil, Uh3Cons, Uh3Nil, Uh50Cons, Uh50Nil, Us110None, Us110Some, Us114Error, Us114Ok, Us115Error, Us115Ok, Us2None, Us2Some, Us3None, Us3Some, Us56Error, Us56Ok, Us72Error, Us72Ok, Us73Closed, Us73Failed, Us73Refused, Us73TimedOut, Us74Error, Us74Ok, Us75Error, Us75Ok, Us76Error, Us76Ok, Us80Error, Us80Ok}
import xsim_frames/part1.{closure1, count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_fs_coerce, spiral_fs_read_file, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_try_call, spiral_wrap_signed}
import xsim_frames/part16.{method372, method373}
import xsim_frames/part18.{get_environment_variable_406}
import xsim_frames/part27.{header_value_531}
import xsim_frames/part3.{method58, method59}
import xsim_frames/part35.{oauth1_signature_679}
import xsim_frames/part36.{included_users_690, method692}
import xsim_frames/part9.{method260, method261}

pub fn world_of_689(v0: String) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
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
                        let v63 = method372()
                        let v64 = method373()
                        let v65 = case v62 { Ok(x) -> v63(x) Error(x) -> v64(x) }
                        let v78 =
                            case v65  {
                                Us80Error(v75) -> panic as "file_system.read_all_text: file:read_file failed"
                                Us80Ok(v66) -> {
                                    let v67 = bit_array.to_string(v66)
                                    let v68 = method260()
                                    let v69 = method261()
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
                let v104 = method372()
                let v105 = method373()
                let v106 = case v103 { Ok(x) -> v104(x) Error(x) -> v105(x) }
                let v119 =
                    case v106  {
                        Us80Error(v116) -> panic as "file_system.read_all_text: file:read_file failed"
                        Us80Ok(v107) -> {
                            let v108 = bit_array.to_string(v107)
                            let v109 = method260()
                            let v110 = method261()
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
    let #(v249, v250, v251, v252, v253, v254, v255, v256, v257, v258, v259, v260, v261) = method692(v144, v160, v173, v187, v188, v244, v189, v186, v143, v246, v204, v192, 9001, Uh37Nil)
    #(v249, v250, v251, v252, v253, v254, v255, v256, v257, v258, v259, v260, v261)
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

pub fn closure171(capt: #(fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37), String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37, String, String)) -> fn(Nil) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15) = capt
        let v16 = v0(#(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13))
        let v17 = v16(v14)
        v17(v15)
    }
}

pub fn ok_c172(capt: Nil) -> fn(#(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37)) -> Us115 {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13) = dom
        Us115Ok(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
    }
}

pub fn error_c173(capt: Nil) -> fn(String) -> Us115 {
    fn (v0) {
        Us115Error(v0)
    }
}

pub fn handled_698(v0: fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37), v1: String, v2: String, v3: dict.Dict(String, Dynamic), v4: dict.Dict(String, Dynamic), v5: Int, v6: dict.Dict(String, Dynamic), v7: String, v8: Dynamic, v9: Uh3, v10: Dynamic, v11: dict.Dict(String, Nil), v12: Int, v13: Uh37, v14: String, v15: Dynamic) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    let v17 = received_699(v15, "")
    let v19 = option.from_result(result.map(string.split_once(v17, "\r\n\r\n"), pair.first))
    let v20 = closure1(Nil)
    let v21 = v19 |> option.map(v20)
    let v23 = v21 |> option.unwrap(Us2None)
    let v27 =
        case v23  {
            Us2None -> -1
            Us2Some(v24) -> {
                bit_array.byte_size(bit_array.from_string(v24))
            }
        }
    let v28 = v27 >= 0
    let v56 =
        case v28 {
            True -> {
                let v29 = erlang_term_coerce(v17)
                let v31 = atom.create("erlang")
                let v33 = atom.create("byte_size")
                let v34 = []
                let v35 = [v29, ..v34]
                let v36 = erlang_term_apply(v31, v33, v35)
                let v37 = erlang_term_coerce(v36)
                let v38 = spiral_wrap_signed(v27 + 4, 32)
                let v39 = spiral_wrap_signed(v27 - 1, 32)
                let v40 = spiral_string_slice(v17, 0, v39)
                let v42 = header_value_531("content-length", v40)
                let #(v43, v44) = case int.parse(string.trim(v42)) { Ok(n) -> #(n, 0) Error(Nil) -> #(0, 1) }
                let v45 = v44 == 0
                let v48 =
                    case v45 {
                        True -> Us3Some(v43)
                        False -> Us3None
                    }
                let v53 =
                    case v48  {
                        Us3None -> 0
                        Us3Some(v49) -> {
                            let v50 = v49 < 0
                            case v50 {
                                True -> 0
                                False -> v49
                            }
                        }
                    }
                let v54 = spiral_wrap_signed(v38 + v53, 32)
                v37 >= v54
            }
            False -> False
        }
    let #(v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195) =
        case v56 {
            True -> {
                let v57 = closure171(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v17))
                let v58 = ok_c172(Nil)
                let v59 = error_c173(Nil)
                let v60 = case spiral_try_call(v57) { Ok(v) -> v58(v) Error(e) -> v59(e) }
                let #(v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137) =
                    case v60  {
                        Us115Error(v75) -> {
                            let v76 = { "xsim serve / a request crashed: " } <> { v75 }
                            let v77 = { v76 } <> { "\n" }
                            let v79 = atom.create("standard_error")
                            let v80 = erlang_term_coerce(v79)
                            let v81 = erlang_term_coerce(v77)
                            let v83 = atom.create("io")
                            let v85 = atom.create("put_chars")
                            let v86 = []
                            let v87 = [v81, ..v86]
                            let v88 = [v80, ..v87]
                            let _v89 = erlang_term_apply(v83, v85, v88)
                            let v90 = { "request failed: " } <> { v75 }
                            let v91 = int.to_string(500)
                            let v92 = { "HTTP/1.1 " } <> { v91 }
                            let v93 = { v92 } <> { " " }
                            let v94 = { v93 } <> { "Internal Server Error" }
                            let v95 = erlang_term_coerce(v90)
                            let v97 = atom.create("erlang")
                            let v99 = atom.create("byte_size")
                            let v100 = []
                            let v101 = [v95, ..v100]
                            let v102 = erlang_term_apply(v97, v99, v101)
                            let v103 = erlang_term_coerce(v102)
                            let v104 = int.to_string(v103)
                            let v105 = { "\r\nContent-Length: " } <> { v104 }
                            let v106 = { "\r\nContent-Type: text/plain; charset=utf-8" } <> { v105 }
                            let v107 = { v106 } <> { "\r\nConnection: close\r\n\r\n" }
                            let v108 = { v94 } <> { v107 }
                            let v109 = { v108 } <> { v90 }
                            #(v109, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
                        }
                        Us115Ok(v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74) -> #(v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74)
                    }
                let v138 = erlang_term_coerce(v124)
                let v140 = atom.create("gen_tcp")
                let v142 = atom.create("send")
                let v143 = []
                let v144 = [v138, ..v143]
                let v145 = [v15, ..v144]
                let v146 = erlang_term_apply(v140, v142, v145)
                let v148 = atom.create("ok")
                let v149 = erlang_term_coerce(v148)
                let v150 = v146 == v149
                let _v182 =
                    case v150 {
                        True -> Us75Ok
                        False -> {
                            let v152 = erlang_term_coerce(2)
                            let v154 = atom.create("erlang")
                            let v156 = atom.create("element")
                            let v157 = []
                            let v158 = [v146, ..v157]
                            let v159 = [v152, ..v158]
                            let v160 = erlang_term_apply(v154, v156, v159)
                            let v162 = atom.create("econnrefused")
                            let v163 = erlang_term_coerce(v162)
                            let v164 = v160 == v163
                            let v180 =
                                case v164 {
                                    True -> Us73Refused
                                    False -> {
                                        let v167 = atom.create("timeout")
                                        let v168 = erlang_term_coerce(v167)
                                        let v169 = v160 == v168
                                        case v169 {
                                            True -> Us73TimedOut
                                            False -> {
                                                let v172 = atom.create("closed")
                                                let v173 = erlang_term_coerce(v172)
                                                let v174 = v160 == v173
                                                case v174 {
                                                    True -> Us73Closed
                                                    False -> {
                                                        let v176 = string.inspect(v160)
                                                        Us73Failed(v176)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            Us75Error(v180)
                        }
                    }
                #(v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137)
            }
            False -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
        }
    let v197 = atom.create("gen_tcp")
    let v199 = atom.create("close")
    let v200 = []
    let v201 = [v15, ..v200]
    let _v202 = erlang_term_apply(v197, v199, v201)
    #(v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195)
}

pub fn served_697(v0: fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37), v1: String, v2: String, v3: dict.Dict(String, Dynamic), v4: dict.Dict(String, Dynamic), v5: Int, v6: dict.Dict(String, Dynamic), v7: String, v8: Dynamic, v9: Uh3, v10: Dynamic, v11: dict.Dict(String, Nil), v12: Int, v13: Uh37, v14: String, v15: Dynamic) -> Int {
    let v17 = atom.create("infinity")
    let v18 = erlang_term_coerce(v17)
    let v20 = atom.create("gen_tcp")
    let v22 = atom.create("accept")
    let v23 = []
    let v24 = [v18, ..v23]
    let v25 = [v15, ..v24]
    let v26 = erlang_term_apply(v20, v22, v25)
    let v27 = erlang_term_coerce(1)
    let v28 = "erlang"
    let v29 = atom.create(v28)
    let v30 = "element"
    let v31 = atom.create(v30)
    let v32 = []
    let v33 = [v26, ..v32]
    let v34 = [v27, ..v33]
    let v35 = erlang_term_apply(v29, v31, v34)
    let v37 = atom.create("ok")
    let v38 = erlang_term_coerce(v37)
    let v39 = v35 == v38
    let v76 =
        case v39 {
            True -> {
                let v40 = erlang_term_coerce(2)
                let v41 = atom.create(v28)
                let v42 = atom.create(v30)
                let v43 = []
                let v44 = [v26, ..v43]
                let v45 = [v40, ..v44]
                let v46 = erlang_term_apply(v41, v42, v45)
                Us72Ok(v46)
            }
            False -> {
                let v48 = erlang_term_coerce(2)
                let v49 = atom.create(v28)
                let v50 = atom.create(v30)
                let v51 = []
                let v52 = [v26, ..v51]
                let v53 = [v48, ..v52]
                let v54 = erlang_term_apply(v49, v50, v53)
                let v56 = atom.create("econnrefused")
                let v57 = erlang_term_coerce(v56)
                let v58 = v54 == v57
                let v74 =
                    case v58 {
                        True -> Us73Refused
                        False -> {
                            let v61 = atom.create("timeout")
                            let v62 = erlang_term_coerce(v61)
                            let v63 = v54 == v62
                            case v63 {
                                True -> Us73TimedOut
                                False -> {
                                    let v66 = atom.create("closed")
                                    let v67 = erlang_term_coerce(v66)
                                    let v68 = v54 == v67
                                    case v68 {
                                        True -> Us73Closed
                                        False -> {
                                            let v70 = string.inspect(v54)
                                            Us73Failed(v70)
                                        }
                                    }
                                }
                            }
                        }
                    }
                Us72Error(v74)
            }
        }
    let v82 =
        case v76  {
            Us72Error(v79) -> Us74Error(v79)
            Us72Ok(v77) -> Us74Ok(v77)
        }
    case v82  {
        Us74Error(v98) -> 1
        Us74Ok(v83) -> {
            let #(v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96) = handled_698(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v83)
            served_697(v0, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v14, v15)
        }
    }
}

pub fn opened_688(v0: fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37), v1: String, v2: String, v3: String, v4: Dynamic) -> Int {
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
    let #(v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85) = world_of_689(v1)
    served_697(v0, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v3, v4)
}

pub fn listening_687(v0: fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37), v1: String, v2: String, v3: String) -> Int {
    let v5 = get_environment_variable_406("SIM_PORT")
    let v6 = spiral_string_length(v5)
    let v8 = method58(v5, v6, 0)
    let v9 = spiral_wrap_signed(v6 - 1, 32)
    let v10 = spiral_string_slice(v5, v8, v9)
    let v11 = spiral_string_length(v10)
    let v12 = method59(v10, v11)
    let v13 = spiral_string_slice(v10, 0, v12)
    let v14 = count_of_text_10(v13)
    let v17 =
        case v14  {
            Us3None -> 0
            Us3Some(v15) -> v15
        }
    let v18 = erlang_term_coerce(v17)
    let v20 = atom.create("true")
    let v21 = erlang_term_coerce(v20)
    let v23 = atom.create("reuseaddr")
    let v24 = erlang_term_coerce(v23)
    let v25 = []
    let v26 = [v21, ..v25]
    let v27 = [v24, ..v26]
    let v28 = erlang_term_tuple(v27)
    let v29 = erlang_term_coerce(1)
    let v30 = erlang_term_coerce(0)
    let v31 = erlang_term_coerce(0)
    let v32 = erlang_term_coerce(127)
    let v33 = []
    let v34 = [v29, ..v33]
    let v35 = [v30, ..v34]
    let v36 = [v31, ..v35]
    let v37 = [v32, ..v36]
    let v38 = erlang_term_tuple(v37)
    let v40 = atom.create("ip")
    let v41 = erlang_term_coerce(v40)
    let v42 = []
    let v43 = [v38, ..v42]
    let v44 = [v41, ..v43]
    let v45 = erlang_term_tuple(v44)
    let v47 = atom.create("binary")
    let v48 = erlang_term_coerce(v47)
    let v50 = atom.create("raw")
    let v51 = erlang_term_coerce(v50)
    let v53 = atom.create("packet")
    let v54 = erlang_term_coerce(v53)
    let v55 = []
    let v56 = [v51, ..v55]
    let v57 = [v54, ..v56]
    let v58 = erlang_term_tuple(v57)
    let v60 = atom.create("false")
    let v61 = erlang_term_coerce(v60)
    let v63 = atom.create("active")
    let v64 = erlang_term_coerce(v63)
    let v65 = []
    let v66 = [v61, ..v65]
    let v67 = [v64, ..v66]
    let v68 = erlang_term_tuple(v67)
    let v69 = []
    let v70 = [v45, ..v69]
    let v71 = [v28, ..v70]
    let v72 = [v68, ..v71]
    let v73 = [v58, ..v72]
    let v74 = [v48, ..v73]
    let v75 = erlang_term_coerce(v74)
    let v77 = atom.create("gen_tcp")
    let v79 = atom.create("listen")
    let v80 = []
    let v81 = [v75, ..v80]
    let v82 = [v18, ..v81]
    let v83 = erlang_term_apply(v77, v79, v82)
    let v84 = erlang_term_coerce(1)
    let v85 = "erlang"
    let v86 = atom.create(v85)
    let v87 = "element"
    let v88 = atom.create(v87)
    let v89 = []
    let v90 = [v83, ..v89]
    let v91 = [v84, ..v90]
    let v92 = erlang_term_apply(v86, v88, v91)
    let v94 = atom.create("ok")
    let v95 = erlang_term_coerce(v94)
    let v96 = v92 == v95
    let v133 =
        case v96 {
            True -> {
                let v97 = erlang_term_coerce(2)
                let v98 = atom.create(v85)
                let v99 = atom.create(v87)
                let v100 = []
                let v101 = [v83, ..v100]
                let v102 = [v97, ..v101]
                let v103 = erlang_term_apply(v98, v99, v102)
                Us72Ok(v103)
            }
            False -> {
                let v105 = erlang_term_coerce(2)
                let v106 = atom.create(v85)
                let v107 = atom.create(v87)
                let v108 = []
                let v109 = [v83, ..v108]
                let v110 = [v105, ..v109]
                let v111 = erlang_term_apply(v106, v107, v110)
                let v113 = atom.create("econnrefused")
                let v114 = erlang_term_coerce(v113)
                let v115 = v111 == v114
                let v131 =
                    case v115 {
                        True -> Us73Refused
                        False -> {
                            let v118 = atom.create("timeout")
                            let v119 = erlang_term_coerce(v118)
                            let v120 = v111 == v119
                            case v120 {
                                True -> Us73TimedOut
                                False -> {
                                    let v123 = atom.create("closed")
                                    let v124 = erlang_term_coerce(v123)
                                    let v125 = v111 == v124
                                    case v125 {
                                        True -> Us73Closed
                                        False -> {
                                            let v127 = string.inspect(v111)
                                            Us73Failed(v127)
                                        }
                                    }
                                }
                            }
                        }
                    }
                Us72Error(v131)
            }
        }
    let v139 =
        case v133  {
            Us72Error(v136) -> Us114Error(v136)
            Us72Ok(v134) -> Us114Ok(v134)
        }
    case v139  {
        Us114Error(v142) -> {
            let v143 = int.to_string(v17)
            let v144 = { "xsim serve / cannot listen on port " } <> { v143 }
            let v145 = { v144 } <> { "\n" }
            let v147 = atom.create("standard_error")
            let v148 = erlang_term_coerce(v147)
            let v149 = erlang_term_coerce(v145)
            let v151 = atom.create("io")
            let v153 = atom.create("put_chars")
            let v154 = []
            let v155 = [v149, ..v154]
            let v156 = [v148, ..v155]
            let _v157 = erlang_term_apply(v151, v153, v156)
            4
        }
        Us114Ok(v140) -> opened_688(v0, v1, v2, v3, v140)
    }
}

pub fn started_686(v0: fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37), v1: String, v2: String, v3: String) -> Int {
    let v23 = Uh50Cons("oauth_timestamp", "1318622958", Uh50Nil)
    let v24 = Uh50Cons("oauth_signature_method", "HMAC-SHA1", v23)
    let v25 = Uh50Cons("oauth_nonce", "kYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cg", v24)
    let v26 = Uh50Cons("oauth_consumer_key", "xvz1evFS4wEEPTGEFPHBog", v25)
    let v27 = Uh50Cons("oauth_version", "1.0", v26)
    let v28 = Uh50Cons("oauth_token", "370773112-GmHxMAgYyLbNEtIKZeRNFsMKPR9EyMZeS9weJAEb", v27)
    let v29 = Uh50Cons("status", "Hello Ladies + Gentlemen, a signed OAuth request!", v28)
    let v30 = Uh50Cons("include_entities", "true", v29)
    let v33 = oauth1_signature_679("POST", "https://api.x.com/1.1/statuses/update.json", v30, "kAcSOqF21Fu85e7zjz7ZN2U4ZRhfV3WpwPAoE3Z7kBw", "LswwdoUaIvS8ltyTt5jkRh4J50vUPVVHtR2YPi5kE")
    let v34 = v33 == "Ls93hJiZbQ3akF3HF3x1Bz8/zU4="
    case v34 {
        True -> listening_687(v0, v1, v2, v3)
        False -> 3
    }
}
