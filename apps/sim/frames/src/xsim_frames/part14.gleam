import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/erlang/process
import gleam/int
import gleam/otp/actor
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Us45, type Uh29, type Us68, type Us70, type Us71, Uh29Cons, Uh29Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us3None, Us3Some, Us45Crashed, Us45Done, Us45Erred, Us68Swap, Us71FreshLine, Us72Error, Us72Ok, Us73Closed, Us73Failed, Us73Refused, Us73TimedOut, Us74Error, Us74Ok, Us75Error, Us75Ok, Us76Error, Us76Ok}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, method4, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part10.{hash_text_239}
import xsim_frames/part13.{method299, method300}
import xsim_frames/part2.{delimited_21, method20}
import xsim_frames/part3.{method56, method57}

pub fn closure70(capt: #(String)) -> fn(Uh3) -> #(Us45, String) {
    fn (v1) {
        let #(v0) = capt
        let v2 = Uh29Nil
        let v3 = method299(v1, v2)
        let v4 = []
        let v5 = method300(v3, v4)
        let v6 = erlang_term_coerce(v5)
        let v7 = "cells"
        let v8 = atom.create(v7)
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
        let v21 = "from_list"
        let v22 = atom.create(v21)
        let v23 = []
        let v24 = [v18, ..v23]
        let v25 = erlang_term_apply(v20, v22, v24)
        let v26 = erlang_term_coerce(v0)
        let v27 = erlang_term_coerce(False)
        let v28 = "memo"
        let v29 = atom.create(v28)
        let v30 = erlang_term_coerce(v29)
        let v31 = []
        let v32 = [v27, ..v31]
        let v33 = [v30, ..v32]
        let v34 = erlang_term_tuple(v33)
        let v35 = "root"
        let v36 = atom.create(v35)
        let v37 = erlang_term_coerce(v36)
        let v38 = []
        let v39 = [v26, ..v38]
        let v40 = [v37, ..v39]
        let v41 = erlang_term_tuple(v40)
        let v42 = "spiral_lib"
        let v43 = atom.create(v42)
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
        let v54 = "Elixir.Spiral.Cells.Notebook"
        let v55 = atom.create(v54)
        let v56 = "evaluate"
        let v57 = atom.create(v56)
        let v58 = []
        let v59 = [v53, ..v58]
        let v60 = [v25, ..v59]
        let v61 = erlang_term_apply(v55, v57, v60)
        let v62 = "erlang"
        let v63 = atom.create(v62)
        let v64 = "is_map"
        let v65 = atom.create(v64)
        let v66 = []
        let v67 = [v61, ..v66]
        let v68 = erlang_term_apply(v63, v65, v67)
        let v69 = erlang_term_coerce(v68)
        let #(v180, v181) =
            case v69 {
                True -> {
                    let v70 = 0
                    let v71 = method20(v1, v70)
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
                    let v90 = "ok"
                    let v91 = atom.create(v90)
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
                    let v116 = "verdicts"
                    let v117 = atom.create(v116)
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
                    let v145 = "outputs"
                    let v146 = atom.create(v145)
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
                    let v177 = "unexpected "
                    let v178 = v177 <> v176 
                    let v179 = Us45Erred
                    #(v179, v178)
                }
            }
        #(v180, v181)
    }
}

pub fn closure72(capt: #(String)) -> fn(Us68) -> actor.Next(String, Us68) {
    fn (v1) {
        let #(v0) = capt
        case v1  {
            Us68Swap(v2, v3) -> {
                process.send(v3, v0)
                let v4 = actor.continue(v2)
                v4
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
        let v1 = "leak cell did not start for "
        let v2 = "xsim_leak_run"
        let v3 = v1 <> v2 
        let v4 = Us45Crashed
        #(v4, v3)
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
        let v4 = hash_text_239(v3)
        let v5 = spiral_string_slice(v4, 0, 11)
        let v6 = closure75(#(v5))
        let v7 = actor.call(v0, 10000, v6)
        let v8 = v5 <> v7 
        let v9 = Us45Done
        #(v9, v8)
    }
}

pub fn closure76(capt: Nil) -> fn(Uh3) -> #(Us45, String) {
    fn (v0) {
        let v1 = "leak cell did not start for "
        let v2 = "xsim_leak_baseline"
        let v3 = v1 <> v2 
        let v4 = Us45Crashed
        #(v4, v3)
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
        let v24 = "hits="
        let v25 = v24 <> v23 
        let v26 = " misses="
        let v27 = v25 <> v26 
        let v28 = int.to_string(v22)
        let v29 = v27 <> v28 
        let v30 = "  memo "
        let v31 = v30 <> v29 
        let v32 = " cumulative_after_schedule="
        let v33 = v31 <> v32 
        let v34 = int.to_string(v4)
        let v35 = v33 <> v34 
        let v36 = Uh3Nil
        Uh3Cons(v35, v36)
    }
}

pub fn closure78(capt: Nil) -> fn(Int) -> Uh3 {
    fn (v0) {
        Uh3Nil
    }
}

pub fn method305(v0: Uh3, v1: Uh29) -> Uh29 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method305(v3, v1)
            let v5 = erlang_term_coerce(v2)
            let v6 = "unicode"
            let v7 = atom.create(v6)
            let v8 = "characters_to_list"
            let v9 = atom.create(v8)
            let v10 = []
            let v11 = [v5, ..v10]
            let v12 = erlang_term_apply(v7, v9, v11)
            Uh29Cons(v12, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn keep_c81(capt: Nil) -> fn(Dynamic) -> Dynamic {
    fn (v0) {
        v0
    }
}

pub fn gleam_collected_306(v0: process.Selector(Dynamic), v1: String) -> #(Int, String) {
    let v2 = process.selector_receive(v0, 86400000)
    let v3 = "none"
    let v4 = atom.create(v3)
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
    let v24 = "atom_to_binary"
    let v25 = atom.create(v24)
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
            let v39 = v1 <> v38 
            gleam_collected_306(v0, v39)
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
                False -> gleam_collected_306(v0, v1)
            }
        }
    }
}

pub fn closure80(capt: #(String)) -> fn(Nil) -> String {
    fn (dom) {
        let #(v0) = capt
        let v1 = "Elixir.Spiral.Cells.CompilerDaemon"
        let v2 = atom.create(v1)
        let v3 = "port"
        let v4 = atom.create(v3)
        let v5 = []
        let v6 = erlang_term_apply(v2, v4, v5)
        let v7 = erlang_term_coerce(v6)
        let v8 = erlang_term_coerce(1)
        let v9 = erlang_term_coerce(0)
        let v10 = erlang_term_coerce(0)
        let v11 = erlang_term_coerce(127)
        let v12 = []
        let v13 = [v8, ..v12]
        let v14 = [v9, ..v13]
        let v15 = [v10, ..v14]
        let v16 = [v11, ..v15]
        let v17 = erlang_term_tuple(v16)
        let v18 = erlang_term_coerce(v7)
        let v19 = "line"
        let v20 = atom.create(v19)
        let v21 = erlang_term_coerce(v20)
        let v22 = "packet"
        let v23 = atom.create(v22)
        let v24 = erlang_term_coerce(v23)
        let v25 = []
        let v26 = [v21, ..v25]
        let v27 = [v24, ..v26]
        let v28 = erlang_term_tuple(v27)
        let v29 = "false"
        let v30 = atom.create(v29)
        let v31 = erlang_term_coerce(v30)
        let v32 = "active"
        let v33 = atom.create(v32)
        let v34 = erlang_term_coerce(v33)
        let v35 = []
        let v36 = [v31, ..v35]
        let v37 = [v34, ..v36]
        let v38 = erlang_term_tuple(v37)
        let v39 = "binary"
        let v40 = atom.create(v39)
        let v41 = erlang_term_coerce(v40)
        let v42 = erlang_term_coerce(8000000)
        let v43 = "packet_size"
        let v44 = atom.create(v43)
        let v45 = erlang_term_coerce(v44)
        let v46 = []
        let v47 = [v42, ..v46]
        let v48 = [v45, ..v47]
        let v49 = erlang_term_tuple(v48)
        let v50 = []
        let v51 = [v49, ..v50]
        let v52 = [v38, ..v51]
        let v53 = [v28, ..v52]
        let v54 = [v41, ..v53]
        let v55 = erlang_term_coerce(v54)
        let v56 = erlang_term_coerce(1000)
        let v57 = "gen_tcp"
        let v58 = atom.create(v57)
        let v59 = "connect"
        let v60 = atom.create(v59)
        let v61 = []
        let v62 = [v56, ..v61]
        let v63 = [v55, ..v62]
        let v64 = [v18, ..v63]
        let v65 = [v17, ..v64]
        let v66 = erlang_term_apply(v58, v60, v65)
        let v67 = erlang_term_coerce(1)
        let v68 = "erlang"
        let v69 = atom.create(v68)
        let v70 = "element"
        let v71 = atom.create(v70)
        let v72 = []
        let v73 = [v66, ..v72]
        let v74 = [v67, ..v73]
        let v75 = erlang_term_apply(v69, v71, v74)
        let v76 = "ok"
        let v77 = atom.create(v76)
        let v78 = erlang_term_coerce(v77)
        let v79 = v75 == v78
        let v116 =
            case v79 {
                True -> {
                    let v80 = erlang_term_coerce(2)
                    let v81 = atom.create(v68)
                    let v82 = atom.create(v70)
                    let v83 = []
                    let v84 = [v66, ..v83]
                    let v85 = [v80, ..v84]
                    let v86 = erlang_term_apply(v81, v82, v85)
                    Us72Ok(v86)
                }
                False -> {
                    let v88 = erlang_term_coerce(2)
                    let v89 = atom.create(v68)
                    let v90 = atom.create(v70)
                    let v91 = []
                    let v92 = [v66, ..v91]
                    let v93 = [v88, ..v92]
                    let v94 = erlang_term_apply(v89, v90, v93)
                    let v95 = "econnrefused"
                    let v96 = atom.create(v95)
                    let v97 = erlang_term_coerce(v96)
                    let v98 = v94 == v97
                    let v114 =
                        case v98 {
                            True -> Us73Refused
                            False -> {
                                let v100 = "timeout"
                                let v101 = atom.create(v100)
                                let v102 = erlang_term_coerce(v101)
                                let v103 = v94 == v102
                                case v103 {
                                    True -> Us73TimedOut
                                    False -> {
                                        let v105 = "closed"
                                        let v106 = atom.create(v105)
                                        let v107 = erlang_term_coerce(v106)
                                        let v108 = v94 == v107
                                        case v108 {
                                            True -> Us73Closed
                                            False -> {
                                                let v110 = string.inspect(v94)
                                                Us73Failed(v110)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    Us72Error(v114)
                }
            }
        let v122 =
            case v116  {
                Us72Error(v119) -> Us74Error(v119)
                Us72Ok(v117) -> Us74Ok(v117)
            }
        let v253 =
            case v122  {
                Us74Error(v250) -> {
                    let v251 = ""
                    v251
                }
                Us74Ok(v123) -> {
                    let v124 = "hello"
                    let v125 = "\n"
                    let v126 = v124 <> v125 
                    let v127 = erlang_term_coerce(v126)
                    let v128 = atom.create(v57)
                    let v129 = "send"
                    let v130 = atom.create(v129)
                    let v131 = []
                    let v132 = [v127, ..v131]
                    let v133 = [v123, ..v132]
                    let v134 = erlang_term_apply(v128, v130, v133)
                    let v135 = atom.create(v76)
                    let v136 = erlang_term_coerce(v135)
                    let v137 = v134 == v136
                    let _v167 =
                        case v137 {
                            True -> Us75Ok
                            False -> {
                                let v139 = erlang_term_coerce(2)
                                let v140 = atom.create(v68)
                                let v141 = atom.create(v70)
                                let v142 = []
                                let v143 = [v134, ..v142]
                                let v144 = [v139, ..v143]
                                let v145 = erlang_term_apply(v140, v141, v144)
                                let v146 = "econnrefused"
                                let v147 = atom.create(v146)
                                let v148 = erlang_term_coerce(v147)
                                let v149 = v145 == v148
                                let v165 =
                                    case v149 {
                                        True -> Us73Refused
                                        False -> {
                                            let v151 = "timeout"
                                            let v152 = atom.create(v151)
                                            let v153 = erlang_term_coerce(v152)
                                            let v154 = v145 == v153
                                            case v154 {
                                                True -> Us73TimedOut
                                                False -> {
                                                    let v156 = "closed"
                                                    let v157 = atom.create(v156)
                                                    let v158 = erlang_term_coerce(v157)
                                                    let v159 = v145 == v158
                                                    case v159 {
                                                        True -> Us73Closed
                                                        False -> {
                                                            let v161 = string.inspect(v145)
                                                            Us73Failed(v161)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                Us75Error(v165)
                            }
                        }
                    let v168 = erlang_term_coerce(0)
                    let v169 = erlang_term_coerce(2000)
                    let v170 = atom.create(v57)
                    let v171 = "recv"
                    let v172 = atom.create(v171)
                    let v173 = []
                    let v174 = [v169, ..v173]
                    let v175 = [v168, ..v174]
                    let v176 = [v123, ..v175]
                    let v177 = erlang_term_apply(v170, v172, v176)
                    let v178 = erlang_term_coerce(1)
                    let v179 = atom.create(v68)
                    let v180 = atom.create(v70)
                    let v181 = []
                    let v182 = [v177, ..v181]
                    let v183 = [v178, ..v182]
                    let v184 = erlang_term_apply(v179, v180, v183)
                    let v185 = atom.create(v76)
                    let v186 = erlang_term_coerce(v185)
                    let v187 = v184 == v186
                    let v224 =
                        case v187 {
                            True -> {
                                let v188 = erlang_term_coerce(2)
                                let v189 = atom.create(v68)
                                let v190 = atom.create(v70)
                                let v191 = []
                                let v192 = [v177, ..v191]
                                let v193 = [v188, ..v192]
                                let v194 = erlang_term_apply(v189, v190, v193)
                                Us72Ok(v194)
                            }
                            False -> {
                                let v196 = erlang_term_coerce(2)
                                let v197 = atom.create(v68)
                                let v198 = atom.create(v70)
                                let v199 = []
                                let v200 = [v177, ..v199]
                                let v201 = [v196, ..v200]
                                let v202 = erlang_term_apply(v197, v198, v201)
                                let v203 = "econnrefused"
                                let v204 = atom.create(v203)
                                let v205 = erlang_term_coerce(v204)
                                let v206 = v202 == v205
                                let v222 =
                                    case v206 {
                                        True -> Us73Refused
                                        False -> {
                                            let v208 = "timeout"
                                            let v209 = atom.create(v208)
                                            let v210 = erlang_term_coerce(v209)
                                            let v211 = v202 == v210
                                            case v211 {
                                                True -> Us73TimedOut
                                                False -> {
                                                    let v213 = "closed"
                                                    let v214 = atom.create(v213)
                                                    let v215 = erlang_term_coerce(v214)
                                                    let v216 = v202 == v215
                                                    case v216 {
                                                        True -> Us73Closed
                                                        False -> {
                                                            let v218 = string.inspect(v202)
                                                            Us73Failed(v218)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                Us72Error(v222)
                            }
                        }
                    let v238 =
                        case v224  {
                            Us72Error(v235) -> Us76Error(v235)
                            Us72Ok(v225) -> {
                                let v226 = "string"
                                let v227 = atom.create(v226)
                                let v228 = "trim"
                                let v229 = atom.create(v228)
                                let v230 = []
                                let v231 = [v225, ..v230]
                                let v232 = erlang_term_apply(v227, v229, v231)
                                let v233 = erlang_term_coerce(v232)
                                Us76Ok(v233)
                            }
                        }
                    let v239 = atom.create(v57)
                    let v240 = "close"
                    let v241 = atom.create(v240)
                    let v242 = []
                    let v243 = [v123, ..v242]
                    let _v244 = erlang_term_apply(v239, v241, v243)
                    case v238  {
                        Us76Error(v246) -> {
                            let v247 = ""
                            v247
                        }
                        Us76Ok(v245) -> v245
                    }
                }
            }
        let v254 = spiral_string_length(v253)
        let v255 = 0
        let v256 = method56(v253, v254, v255)
        let v257 = spiral_wrap_signed(v254 - 1, 32)
        let v258 = spiral_string_slice(v253, v256, v257)
        let v259 = spiral_string_length(v258)
        let v260 = method57(v258, v259)
        let v261 = spiral_string_slice(v258, 0, v260)
        let v262 = v261 == ""
        let v266 =
            case v262 {
                True -> Uh3Nil
                False -> {
                    let v264 = "\t"
                    split_list_2(v264, v261)
                }
            }
        let v282 =
            case v266  {
                Uh3Cons(v267, v268) -> {
                    case v268  {
                        Uh3Cons(v269, v270) -> {
                            case v270  {
                                Uh3Cons(v271, v272) -> {
                                    let v273 = v267 == "spiral-cells"
                                    case v273 {
                                        True -> count_of_text_10(v271)
                                        False -> Us3None
                                    }
                                }
                                _ -> Us3None
                            }
                        }
                        _ -> Us3None
                    }
                }
                _ -> Us3None
            }
        case v282  {
            Us3None -> {
                let v389 = ""
                v389
            }
            Us3Some(v283) -> {
                let v284 = int.to_string(v283)
                let v285 = "pwsh"
                let v286 = erlang_term_coerce(v285)
                let v287 = "unicode"
                let v288 = atom.create(v287)
                let v289 = "characters_to_list"
                let v290 = atom.create(v289)
                let v291 = []
                let v292 = [v286, ..v291]
                let v293 = erlang_term_apply(v288, v290, v292)
                let v294 = "os"
                let v295 = atom.create(v294)
                let v296 = "find_executable"
                let v297 = atom.create(v296)
                let v298 = []
                let v299 = [v293, ..v298]
                let v300 = erlang_term_apply(v295, v297, v299)
                let v301 = atom.create(v29)
                let v302 = erlang_term_coerce(v301)
                let v303 = v300 == v302
                let #(v377, v378, v379) =
                    case v303 {
                        True -> {
                            let v304 = ""
                            #(False, -1, v304)
                        }
                        False -> {
                            let v305 = "args"
                            let v306 = atom.create(v305)
                            let v307 = erlang_term_coerce(v306)
                            let v308 = v0 == ""
                            let v320 =
                                case v308 {
                                    True -> {
                                        let v309 = "-File"
                                        let v310 = "-NoProfile"
                                        let v311 = Uh3Nil
                                        let v312 = Uh3Cons(v310, v311)
                                        Uh3Cons(v309, v312)
                                    }
                                    False -> {
                                        let v314 = "-File"
                                        let v315 = "-NoProfile"
                                        let v316 = Uh3Nil
                                        let v317 = Uh3Cons(v315, v316)
                                        let v318 = Uh3Cons(v314, v317)
                                        Uh3Cons(v0, v318)
                                    }
                                }
                            let v321 = v284 == ""
                            let v327 =
                                case v321 {
                                    True -> {
                                        let v322 = "-Root"
                                        Uh3Cons(v322, v320)
                                    }
                                    False -> {
                                        let v324 = "-Root"
                                        let v325 = Uh3Cons(v324, v320)
                                        Uh3Cons(v284, v325)
                                    }
                                }
                            let v328 = Uh3Nil
                            let v329 = method4(v327, v328)
                            let v330 = Uh29Nil
                            let v331 = method305(v329, v330)
                            let v332 = []
                            let v333 = method300(v331, v332)
                            let v334 = erlang_term_coerce(v333)
                            let v335 = []
                            let v336 = [v334, ..v335]
                            let v337 = [v307, ..v336]
                            let v338 = erlang_term_tuple(v337)
                            let v339 = atom.create(v39)
                            let v340 = erlang_term_coerce(v339)
                            let v341 = "exit_status"
                            let v342 = atom.create(v341)
                            let v343 = erlang_term_coerce(v342)
                            let v344 = "stderr_to_stdout"
                            let v345 = atom.create(v344)
                            let v346 = erlang_term_coerce(v345)
                            let v347 = "hide"
                            let v348 = atom.create(v347)
                            let v349 = erlang_term_coerce(v348)
                            let v350 = "spawn_executable"
                            let v351 = atom.create(v350)
                            let v352 = erlang_term_coerce(v351)
                            let v353 = []
                            let v354 = [v300, ..v353]
                            let v355 = [v352, ..v354]
                            let v356 = erlang_term_tuple(v355)
                            let v357 = []
                            let v358 = [v338, ..v357]
                            let v359 = [v343, ..v358]
                            let v360 = [v340, ..v359]
                            let v361 = [v346, ..v360]
                            let v362 = [v349, ..v361]
                            let v363 = erlang_term_coerce(v362)
                            let v364 = atom.create(v68)
                            let v365 = "open_port"
                            let v366 = atom.create(v365)
                            let v367 = []
                            let v368 = [v363, ..v367]
                            let v369 = [v356, ..v368]
                            let v370 = erlang_term_apply(v364, v366, v369)
                            let v371 = erlang_term_coerce(v370)
                            let v372 = keep_c81(Nil)
                            let v373 = process.select_record(process.new_selector(), v371, 1, v372)
                            let v374 = ""
                            let #(v375, v376) = gleam_collected_306(v373, v374)
                            #(True, v375, v376)
                        }
                    }
                let v381 =
                    case v377 {
                        True -> {
                            let v380 = v378 == 0
                            v380
                        }
                        False -> False
                    }
                let v384 =
                    case v381 {
                        True -> Us2Some(v379)
                        False -> Us2None
                    }
                case v384  {
                    Us2None -> {
                        let v386 = ""
                        v386
                    }
                    Us2Some(v385) -> v385
                }
            }
        }
    }
}

pub fn closure79(capt: #(String)) -> fn(process.Subject(Us70)) -> #(Int, Int, Int, Int, Int, Us71, Int, process.Subject(Us70)) {
    fn (v1) {
        let #(v0) = capt
        let v2 = closure80(#(v0))
        let v3 = Us71FreshLine(v2)
        #(0, 0, 0, 0, 0, v3, 1000, v1)
    }
}
