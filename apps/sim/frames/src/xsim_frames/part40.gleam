import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh36, type Us116, Uh29Nil, Uh3Cons, Uh3Nil, Uh50Cons, Uh50Nil, Us115Error, Us115Ok, Us116Error, Us116Ok, Us2None, Us2Some, Us3None, Us3Some, Us72Error, Us72Ok, Us73Closed, Us73Failed, Us73Refused, Us73TimedOut, Us74Error, Us74Ok, Us75Error, Us75Ok, Us76Error, Us76Ok}
import xsim_frames/part1.{closure1, count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_fs_coerce, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_try_call, spiral_wrap_signed}
import xsim_frames/part12.{items_from_301}
import xsim_frames/part18.{closure29, get_environment_variable_404, method396}
import xsim_frames/part19.{closure108}
import xsim_frames/part20.{closure110}
import xsim_frames/part21.{closure116}
import xsim_frames/part22.{closure122}
import xsim_frames/part23.{closure130}
import xsim_frames/part24.{closure136}
import xsim_frames/part28.{header_value_537}
import xsim_frames/part3.{closure0, closure5, closure7, closure9, method56, method57}
import xsim_frames/part36.{oauth1_signature_686}
import xsim_frames/part39.{closure143, world_of_696}
import xsim_frames/part5.{closure10, closure12, closure13, closure14}
import xsim_frames/part6.{closure15}
import xsim_frames/part8.{closure19, closure27, closure28}

pub fn received_706(v0: Dynamic, v1: String) -> String {
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
                let v26 = header_value_537("content-length", v24)
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
            received_706(v0, v117)
        }
    }
}

pub fn closure173(capt: #(fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String), String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String, String, String)) -> fn(Nil) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17) = capt
        let v18 = v0(#(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15))
        let v19 = v18(v16)
        v19(v17)
    }
}

pub fn ok_c174(capt: Nil) -> fn(#(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String)) -> Us116 {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15) = dom
        Us116Ok(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15)
    }
}

pub fn error_c175(capt: Nil) -> fn(String) -> Us116 {
    fn (v0) {
        Us116Error(v0)
    }
}

pub fn handled_705(v0: fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String), v1: String, v2: String, v3: dict.Dict(String, Dynamic), v4: dict.Dict(String, Dynamic), v5: Int, v6: dict.Dict(String, Dynamic), v7: String, v8: Dynamic, v9: Uh3, v10: Dynamic, v11: dict.Dict(String, Nil), v12: Int, v13: Uh36, v14: String, v15: String, v16: String, v17: Dynamic) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String) {
    let v19 = received_706(v17, "")
    let v21 = option.from_result(result.map(string.split_once(v19, "\r\n\r\n"), pair.first))
    let v22 = closure1(Nil)
    let v23 = v21 |> option.map(v22)
    let v25 = v23 |> option.unwrap(Us2None)
    let v29 =
        case v25  {
            Us2None -> -1
            Us2Some(v26) -> {
                bit_array.byte_size(bit_array.from_string(v26))
            }
        }
    let v30 = v29 >= 0
    let v58 =
        case v30 {
            True -> {
                let v31 = erlang_term_coerce(v19)
                let v33 = atom.create("erlang")
                let v35 = atom.create("byte_size")
                let v36 = []
                let v37 = [v31, ..v36]
                let v38 = erlang_term_apply(v33, v35, v37)
                let v39 = erlang_term_coerce(v38)
                let v40 = spiral_wrap_signed(v29 + 4, 32)
                let v41 = spiral_wrap_signed(v29 - 1, 32)
                let v42 = spiral_string_slice(v19, 0, v41)
                let v44 = header_value_537("content-length", v42)
                let #(v45, v46) = case int.parse(string.trim(v44)) { Ok(n) -> #(n, 0) Error(Nil) -> #(0, 1) }
                let v47 = v46 == 0
                let v50 =
                    case v47 {
                        True -> Us3Some(v45)
                        False -> Us3None
                    }
                let v55 =
                    case v50  {
                        Us3None -> 0
                        Us3Some(v51) -> {
                            let v52 = v51 < 0
                            case v52 {
                                True -> 0
                                False -> v51
                            }
                        }
                    }
                let v56 = spiral_wrap_signed(v40 + v55, 32)
                v39 >= v56
            }
            False -> False
        }
    let #(v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205) =
        case v58 {
            True -> {
                let v59 = closure173(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v19))
                let v60 = ok_c174(Nil)
                let v61 = error_c175(Nil)
                let v62 = case spiral_try_call(v59) { Ok(v) -> v60(v) Error(e) -> v61(e) }
                let #(v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145) =
                    case v62  {
                        Us116Error(v79) -> {
                            let v80 = { "xsim serve / a request crashed: " } <> { v79 }
                            let v81 = { v80 } <> { "\n" }
                            let v83 = atom.create("standard_error")
                            let v84 = erlang_term_coerce(v83)
                            let v85 = erlang_term_coerce(v81)
                            let v87 = atom.create("io")
                            let v89 = atom.create("put_chars")
                            let v90 = []
                            let v91 = [v85, ..v90]
                            let v92 = [v84, ..v91]
                            let _v93 = erlang_term_apply(v87, v89, v92)
                            let v94 = { "request failed: " } <> { v79 }
                            let v95 = int.to_string(500)
                            let v96 = { "HTTP/1.1 " } <> { v95 }
                            let v97 = { v96 } <> { " " }
                            let v98 = { v97 } <> { "Internal Server Error" }
                            let v99 = erlang_term_coerce(v94)
                            let v101 = atom.create("erlang")
                            let v103 = atom.create("byte_size")
                            let v104 = []
                            let v105 = [v99, ..v104]
                            let v106 = erlang_term_apply(v101, v103, v105)
                            let v107 = erlang_term_coerce(v106)
                            let v108 = int.to_string(v107)
                            let v109 = { "\r\nContent-Length: " } <> { v108 }
                            let v110 = { "\r\nContent-Type: text/plain; charset=utf-8" } <> { v109 }
                            let v111 = { v110 } <> { "\r\nConnection: close\r\n\r\n" }
                            let v112 = { v98 } <> { v111 }
                            let v113 = { v112 } <> { v94 }
                            #(v113, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15)
                        }
                        Us116Ok(v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78) -> #(v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78)
                    }
                let v146 = erlang_term_coerce(v130)
                let v148 = atom.create("gen_tcp")
                let v150 = atom.create("send")
                let v151 = []
                let v152 = [v146, ..v151]
                let v153 = [v17, ..v152]
                let v154 = erlang_term_apply(v148, v150, v153)
                let v156 = atom.create("ok")
                let v157 = erlang_term_coerce(v156)
                let v158 = v154 == v157
                let _v190 =
                    case v158 {
                        True -> Us75Ok
                        False -> {
                            let v160 = erlang_term_coerce(2)
                            let v162 = atom.create("erlang")
                            let v164 = atom.create("element")
                            let v165 = []
                            let v166 = [v154, ..v165]
                            let v167 = [v160, ..v166]
                            let v168 = erlang_term_apply(v162, v164, v167)
                            let v170 = atom.create("econnrefused")
                            let v171 = erlang_term_coerce(v170)
                            let v172 = v168 == v171
                            let v188 =
                                case v172 {
                                    True -> Us73Refused
                                    False -> {
                                        let v175 = atom.create("timeout")
                                        let v176 = erlang_term_coerce(v175)
                                        let v177 = v168 == v176
                                        case v177 {
                                            True -> Us73TimedOut
                                            False -> {
                                                let v180 = atom.create("closed")
                                                let v181 = erlang_term_coerce(v180)
                                                let v182 = v168 == v181
                                                case v182 {
                                                    True -> Us73Closed
                                                    False -> {
                                                        let v184 = string.inspect(v168)
                                                        Us73Failed(v184)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            Us75Error(v188)
                        }
                    }
                #(v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141, v142, v143, v144, v145)
            }
            False -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15)
        }
    let v207 = atom.create("gen_tcp")
    let v209 = atom.create("close")
    let v210 = []
    let v211 = [v17, ..v210]
    let _v212 = erlang_term_apply(v207, v209, v211)
    #(v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205)
}

pub fn served_704(v0: fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String), v1: String, v2: String, v3: dict.Dict(String, Dynamic), v4: dict.Dict(String, Dynamic), v5: Int, v6: dict.Dict(String, Dynamic), v7: String, v8: Dynamic, v9: Uh3, v10: Dynamic, v11: dict.Dict(String, Nil), v12: Int, v13: Uh36, v14: String, v15: String, v16: String, v17: Dynamic) -> Int {
    let v19 = atom.create("infinity")
    let v20 = erlang_term_coerce(v19)
    let v22 = atom.create("gen_tcp")
    let v24 = atom.create("accept")
    let v25 = []
    let v26 = [v20, ..v25]
    let v27 = [v17, ..v26]
    let v28 = erlang_term_apply(v22, v24, v27)
    let v29 = erlang_term_coerce(1)
    let v30 = "erlang"
    let v31 = atom.create(v30)
    let v32 = "element"
    let v33 = atom.create(v32)
    let v34 = []
    let v35 = [v28, ..v34]
    let v36 = [v29, ..v35]
    let v37 = erlang_term_apply(v31, v33, v36)
    let v39 = atom.create("ok")
    let v40 = erlang_term_coerce(v39)
    let v41 = v37 == v40
    let v78 =
        case v41 {
            True -> {
                let v42 = erlang_term_coerce(2)
                let v43 = atom.create(v30)
                let v44 = atom.create(v32)
                let v45 = []
                let v46 = [v28, ..v45]
                let v47 = [v42, ..v46]
                let v48 = erlang_term_apply(v43, v44, v47)
                Us72Ok(v48)
            }
            False -> {
                let v50 = erlang_term_coerce(2)
                let v51 = atom.create(v30)
                let v52 = atom.create(v32)
                let v53 = []
                let v54 = [v28, ..v53]
                let v55 = [v50, ..v54]
                let v56 = erlang_term_apply(v51, v52, v55)
                let v58 = atom.create("econnrefused")
                let v59 = erlang_term_coerce(v58)
                let v60 = v56 == v59
                let v76 =
                    case v60 {
                        True -> Us73Refused
                        False -> {
                            let v63 = atom.create("timeout")
                            let v64 = erlang_term_coerce(v63)
                            let v65 = v56 == v64
                            case v65 {
                                True -> Us73TimedOut
                                False -> {
                                    let v68 = atom.create("closed")
                                    let v69 = erlang_term_coerce(v68)
                                    let v70 = v56 == v69
                                    case v70 {
                                        True -> Us73Closed
                                        False -> {
                                            let v72 = string.inspect(v56)
                                            Us73Failed(v72)
                                        }
                                    }
                                }
                            }
                        }
                    }
                Us72Error(v76)
            }
        }
    let v84 =
        case v78  {
            Us72Error(v81) -> Us74Error(v81)
            Us72Ok(v79) -> Us74Ok(v79)
        }
    case v84  {
        Us74Error(v102) -> 1
        Us74Ok(v85) -> {
            let #(v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100) = handled_705(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v85)
            served_704(v0, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v16, v17)
        }
    }
}

pub fn opened_695(v0: fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String), v1: String, v2: String, v3: String, v4: Dynamic) -> Int {
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
    let #(v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87) = world_of_696(v1)
    served_704(v0, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v3, v4)
}

pub fn listening_694(v0: fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String), v1: String, v2: String, v3: String) -> Int {
    let v5 = get_environment_variable_404("SIM_PORT")
    let v6 = spiral_string_length(v5)
    let v8 = method56(v5, v6, 0)
    let v9 = spiral_wrap_signed(v6 - 1, 32)
    let v10 = spiral_string_slice(v5, v8, v9)
    let v11 = spiral_string_length(v10)
    let v12 = method57(v10, v11)
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
            Us72Error(v136) -> Us115Error(v136)
            Us72Ok(v134) -> Us115Ok(v134)
        }
    case v139  {
        Us115Error(v142) -> {
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
        Us115Ok(v140) -> opened_695(v0, v1, v2, v3, v140)
    }
}

pub fn started_693(v0: fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String), v1: String, v2: String, v3: String) -> Int {
    let v23 = Uh50Cons("oauth_timestamp", "1318622958", Uh50Nil)
    let v24 = Uh50Cons("oauth_signature_method", "HMAC-SHA1", v23)
    let v25 = Uh50Cons("oauth_nonce", "kYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cg", v24)
    let v26 = Uh50Cons("oauth_consumer_key", "xvz1evFS4wEEPTGEFPHBog", v25)
    let v27 = Uh50Cons("oauth_version", "1.0", v26)
    let v28 = Uh50Cons("oauth_token", "370773112-GmHxMAgYyLbNEtIKZeRNFsMKPR9EyMZeS9weJAEb", v27)
    let v29 = Uh50Cons("status", "Hello Ladies + Gentlemen, a signed OAuth request!", v28)
    let v30 = Uh50Cons("include_entities", "true", v29)
    let v33 = oauth1_signature_686("POST", "https://api.x.com/1.1/statuses/update.json", v30, "kAcSOqF21Fu85e7zjz7ZN2U4ZRhfV3WpwPAoE3Z7kBw", "LswwdoUaIvS8ltyTt5jkRh4J50vUPVVHtR2YPi5kE")
    let v34 = v33 == "Ls93hJiZbQ3akF3HF3x1Bz8/zU4="
    case v34 {
        True -> listening_694(v0, v1, v2, v3)
        False -> 3
    }
}

pub fn closure142(capt: Nil) -> fn(String) -> Int {
    fn (v0) {
        let v2 = atom.create("init")
        let v4 = atom.create("get_plain_arguments")
        let v5 = []
        let v6 = erlang_term_apply(v2, v4, v5)
        let v8 = atom.create("lists")
        let v10 = atom.create("reverse")
        let v11 = []
        let v12 = [v6, ..v11]
        let v13 = erlang_term_apply(v8, v10, v12)
        let v15 = items_from_301(v13, Uh29Nil)
        let v17 = method396(v15, Uh3Nil)
        let v22 =
            case v17  {
                Uh3Cons(v18, v19) -> v19
                Uh3Nil -> Uh3Nil
            }
        case v22  {
            Uh3Cons(v23, v24) -> {
                case v24  {
                    Uh3Cons(v25, v26) -> {
                        case v26  {
                            Uh3Cons(v27, v28) -> {
                                let v29 = closure143(Nil)
                                started_693(v29, v23, v25, v27)
                            }
                            _ -> 2
                        }
                    }
                    _ -> 2
                }
            }
            _ -> 2
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
    let _v13 = closure108(Nil)
    let _ = Nil
    let _v14 = closure110(Nil)
    let _ = Nil
    let _v15 = closure116(Nil)
    let _ = Nil
    let _v16 = closure122(Nil)
    let _ = Nil
    let _v17 = closure130(Nil)
    let _ = Nil
    let _v18 = closure136(Nil)
    let _ = Nil
    let _v19 = closure142(Nil)
    let _ = Nil
    0
}
