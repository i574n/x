import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, Uh29Cons, Uh29Nil, Us2None, Us2Some, Us72None, Us72Some, Us94Error, Us94Ok}
import xsim_frames/part1.{closure1, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_length, spiral_string_slice, spiral_wrap_signed}
import xsim_frames/part13.{method301}
import xsim_frames/part28.{method471, method472}
import xsim_frames/part34.{method587, units_of_586}

pub fn created_post_589(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, v5: dict.Dict(String, Dynamic), v6: String, _v7: Dynamic, _v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), _v11: Int, v12: String, v13: String, v14: String) -> Dynamic {
    let v15 = v14 == ""
    let v44 =
        case v15 {
            True -> {
                let v16 = erlang_term_coerce(v12)
                v16
            }
            False -> {
                let v17 = erlang_term_coerce(v14)
                let v18 = dict.get(v5, v14)
                let v19 = method471()
                let v20 = method472()
                let v21 = case v18 { Ok(x) -> v19(x) Error(x) -> v20(x) }
                let v26 =
                    case v21  {
                        Us94Error -> Us72None
                        Us94Ok(v22) -> Us72Some(v22)
                    }
                let v30 =
                    case v26  {
                        Us72None -> panic as "dict.present: the key is not in the dict"
                        Us72Some(v27) -> v27
                    }
                let v31 = "conversation_id"
                let v32 = erlang_term_coerce(v31)
                let v33 = erlang_term_coerce(v17)
                let v34 = "maps"
                let v35 = atom.create(v34)
                let v36 = "get"
                let v37 = atom.create(v36)
                let v38 = []
                let v39 = [v33, ..v38]
                let v40 = [v30, ..v39]
                let v41 = [v32, ..v40]
                let v42 = erlang_term_apply(v35, v37, v41)
                let v43 = erlang_term_coerce(v42)
                v43
            }
        }
    let v76 =
        case v15 {
            True -> Uh29Nil
            False -> {
                let v46 = "replied_to"
                let v47 = erlang_term_coerce(v46)
                let v48 = erlang_term_coerce(v14)
                let v49 = "id"
                let v50 = erlang_term_coerce(v49)
                let v51 = erlang_term_coerce(v48)
                let v52 = []
                let v53 = [v51, ..v52]
                let v54 = [v50, ..v53]
                let v55 = erlang_term_tuple(v54)
                let v56 = "type"
                let v57 = erlang_term_coerce(v56)
                let v58 = erlang_term_coerce(v47)
                let v59 = []
                let v60 = [v58, ..v59]
                let v61 = [v57, ..v60]
                let v62 = erlang_term_tuple(v61)
                let v63 = []
                let v64 = [v55, ..v63]
                let v65 = [v62, ..v64]
                let v66 = erlang_term_coerce(v65)
                let v67 = "maps"
                let v68 = atom.create(v67)
                let v69 = "from_list"
                let v70 = atom.create(v69)
                let v71 = []
                let v72 = [v66, ..v71]
                let v73 = erlang_term_apply(v68, v70, v72)
                let v74 = Uh29Nil
                Uh29Cons(v73, v74)
            }
        }
    let v77 = []
    let v78 = method301(v76, v77)
    let v79 = erlang_term_coerce(v78)
    let v80 = dict.size(v10)
    let v81 = erlang_term_coerce(v6)
    let v82 = "unicode"
    let v83 = atom.create(v82)
    let v84 = "characters_to_list"
    let v85 = atom.create(v84)
    let v86 = []
    let v87 = [v81, ..v86]
    let v88 = erlang_term_apply(v83, v85, v87)
    let v89 = "calendar"
    let v90 = atom.create(v89)
    let v91 = "rfc3339_to_system_time"
    let v92 = atom.create(v91)
    let v93 = []
    let v94 = [v88, ..v93]
    let v95 = erlang_term_apply(v90, v92, v94)
    let v96 = erlang_term_coerce(v80)
    let v97 = "erlang"
    let v98 = atom.create(v97)
    let v99 = "+"
    let v100 = atom.create(v99)
    let v101 = []
    let v102 = [v96, ..v101]
    let v103 = [v95, ..v102]
    let v104 = erlang_term_apply(v98, v100, v103)
    let v105 = "Z"
    let v106 = erlang_term_coerce(v105)
    let v107 = atom.create(v82)
    let v108 = atom.create(v84)
    let v109 = []
    let v110 = [v106, ..v109]
    let v111 = erlang_term_apply(v107, v108, v110)
    let v112 = "offset"
    let v113 = atom.create(v112)
    let v114 = erlang_term_coerce(v113)
    let v115 = []
    let v116 = [v111, ..v115]
    let v117 = [v114, ..v116]
    let v118 = erlang_term_tuple(v117)
    let v119 = []
    let v120 = [v118, ..v119]
    let v121 = erlang_term_coerce(v120)
    let v122 = atom.create(v89)
    let v123 = "system_time_to_rfc3339"
    let v124 = atom.create(v123)
    let v125 = []
    let v126 = [v121, ..v125]
    let v127 = [v104, ..v126]
    let v128 = erlang_term_apply(v122, v124, v127)
    let v129 = atom.create(v82)
    let v130 = "characters_to_binary"
    let v131 = atom.create(v130)
    let v132 = []
    let v133 = [v128, ..v132]
    let v134 = erlang_term_apply(v129, v131, v133)
    let v135 = erlang_term_coerce(v134)
    let v136 = spiral_string_slice(v135, 0, 18)
    let v137 = ".000Z"
    let v138 = v136 <> v137 
    let v139 = erlang_term_coerce(v138)
    let v140 = erlang_term_coerce(v12)
    let v141 = erlang_term_coerce(v13)
    let v142 = "refs"
    let v143 = erlang_term_coerce(v142)
    let v144 = erlang_term_coerce(v79)
    let v145 = []
    let v146 = [v144, ..v145]
    let v147 = [v143, ..v146]
    let v148 = erlang_term_tuple(v147)
    let v149 = "conversation_id"
    let v150 = erlang_term_coerce(v149)
    let v151 = erlang_term_coerce(v44)
    let v152 = []
    let v153 = [v151, ..v152]
    let v154 = [v150, ..v153]
    let v155 = erlang_term_tuple(v154)
    let v156 = "created_at"
    let v157 = erlang_term_coerce(v156)
    let v158 = erlang_term_coerce(v139)
    let v159 = []
    let v160 = [v158, ..v159]
    let v161 = [v157, ..v160]
    let v162 = erlang_term_tuple(v161)
    let v163 = "author_id"
    let v164 = erlang_term_coerce(v163)
    let v165 = erlang_term_coerce(v9)
    let v166 = []
    let v167 = [v165, ..v166]
    let v168 = [v164, ..v167]
    let v169 = erlang_term_tuple(v168)
    let v170 = "text"
    let v171 = erlang_term_coerce(v170)
    let v172 = erlang_term_coerce(v141)
    let v173 = []
    let v174 = [v172, ..v173]
    let v175 = [v171, ..v174]
    let v176 = erlang_term_tuple(v175)
    let v177 = "id"
    let v178 = erlang_term_coerce(v177)
    let v179 = erlang_term_coerce(v140)
    let v180 = []
    let v181 = [v179, ..v180]
    let v182 = [v178, ..v181]
    let v183 = erlang_term_tuple(v182)
    let v184 = []
    let v185 = [v148, ..v184]
    let v186 = [v155, ..v185]
    let v187 = [v162, ..v186]
    let v188 = [v169, ..v187]
    let v189 = [v176, ..v188]
    let v190 = [v183, ..v189]
    let v191 = erlang_term_coerce(v190)
    let v192 = "maps"
    let v193 = atom.create(v192)
    let v194 = "from_list"
    let v195 = atom.create(v194)
    let v196 = []
    let v197 = [v191, ..v196]
    let v198 = erlang_term_apply(v193, v195, v197)
    v198
}

pub fn posted_588(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v14 = string.inspect(v11)
    let v15 = erlang_term_coerce(v14)
    let v16 = "&"
    let v17 = "&amp;"
    let v18 = v12 |> string.replace(v16, v17)
    let v19 = "<"
    let v20 = "&lt;"
    let v21 = v18 |> string.replace(v19, v20)
    let v22 = ">"
    let v23 = "&gt;"
    let v24 = v21 |> string.replace(v22, v23)
    let v25 = erlang_term_coerce(v24)
    let v26 = erlang_term_coerce(v14)
    let v27 = []
    let v28 = [v26, ..v27]
    let v29 = erlang_term_coerce(v28)
    let v30 = "edit_history_post_ids"
    let v31 = atom.create(v30)
    let v32 = erlang_term_coerce(v31)
    let v33 = []
    let v34 = [v29, ..v33]
    let v35 = [v32, ..v34]
    let v36 = erlang_term_tuple(v35)
    let v37 = "text"
    let v38 = atom.create(v37)
    let v39 = erlang_term_coerce(v38)
    let v40 = []
    let v41 = [v25, ..v40]
    let v42 = [v39, ..v41]
    let v43 = erlang_term_tuple(v42)
    let v44 = "id"
    let v45 = atom.create(v44)
    let v46 = erlang_term_coerce(v45)
    let v47 = []
    let v48 = [v15, ..v47]
    let v49 = [v46, ..v48]
    let v50 = erlang_term_tuple(v49)
    let v51 = []
    let v52 = [v36, ..v51]
    let v53 = [v43, ..v52]
    let v54 = [v50, ..v53]
    let v55 = erlang_term_coerce(v54)
    let v56 = "maps"
    let v57 = atom.create(v56)
    let v58 = "from_list"
    let v59 = atom.create(v58)
    let v60 = []
    let v61 = [v55, ..v60]
    let v62 = erlang_term_apply(v57, v59, v61)
    let v63 = "data"
    let v64 = atom.create(v63)
    let v65 = erlang_term_coerce(v64)
    let v66 = []
    let v67 = [v62, ..v66]
    let v68 = [v65, ..v67]
    let v69 = erlang_term_tuple(v68)
    let v70 = []
    let v71 = [v69, ..v70]
    let v72 = erlang_term_coerce(v71)
    let v73 = atom.create(v56)
    let v74 = atom.create(v58)
    let v75 = []
    let v76 = [v72, ..v75]
    let v77 = erlang_term_apply(v73, v74, v76)
    let v78 = "json"
    let v79 = atom.create(v78)
    let v80 = "encode"
    let v81 = atom.create(v80)
    let v82 = []
    let v83 = [v77, ..v82]
    let v84 = erlang_term_apply(v79, v81, v83)
    let v85 = "erlang"
    let v86 = atom.create(v85)
    let v87 = "iolist_to_binary"
    let v88 = atom.create(v87)
    let v89 = []
    let v90 = [v84, ..v89]
    let v91 = erlang_term_apply(v86, v88, v90)
    let v92 = erlang_term_coerce(v91)
    let v93 = string.inspect(201)
    let v94 = "HTTP/1.1 "
    let v95 = v94 <> v93 
    let v96 = " "
    let v97 = v95 <> v96 
    let v98 = "Created"
    let v99 = v97 <> v98 
    let v100 = erlang_term_coerce(v92)
    let v101 = atom.create(v85)
    let v102 = "byte_size"
    let v103 = atom.create(v102)
    let v104 = []
    let v105 = [v100, ..v104]
    let v106 = erlang_term_apply(v101, v103, v105)
    let v107 = erlang_term_coerce(v106)
    let v108 = string.inspect(v107)
    let v109 = "\r\nContent-Length: "
    let v110 = v109 <> v108 
    let v111 = "\r\nContent-Type: application/json; charset=utf-8"
    let v112 = v111 <> v110 
    let v113 = "\r\nConnection: close\r\n\r\n"
    let v114 = v112 <> v113 
    let v115 = v99 <> v114 
    let v116 = v115 <> v92 
    let v117 = dict.insert(v10, v14, Nil)
    let v118 = spiral_wrap_signed(v11 + 1, 32)
    let v119 = created_post_589(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v117, v118, v14, v12, v13)
    let v120 = dict.insert(v5, v14, v119)
    #(v116, v0, v1, v2, v3, v4, v120, v6, v7, v8, v9, v117, v118)
}

pub fn new_post_585(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, _v12: String, _v13: String, _v14: String, _v15: String, v16: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v17 = "\r\n\r\n"
    let v18 = option.from_result(result.map(string.split_once(v16, v17), pair.first))
    let v19 = closure1(Nil)
    let v20 = v18 |> option.map(v19)
    let v21 = Us2None
    let v22 = v20 |> option.unwrap(v21)
    let v26 =
        case v22  {
            Us2None -> -1
            Us2Some(v23) -> {
                let v24 = bit_array.byte_size(bit_array.from_string(v23))
                v24
            }
        }
    let v27 = spiral_wrap_signed(v26 + 4, 32)
    let v28 = spiral_string_length(v16)
    let v29 = spiral_wrap_signed(v28 - v27, 32)
    let v30 = spiral_wrap_signed(v27 + v29, 32)
    let v31 = spiral_wrap_signed(v30 - 1, 32)
    let v32 = spiral_string_slice(v16, v27, v31)
    let v33 = v32 == ""
    let v61 =
        case v33 {
            True -> {
                let v34 = "maps"
                let v35 = atom.create(v34)
                let v36 = "new"
                let v37 = atom.create(v36)
                let v38 = []
                let v39 = erlang_term_apply(v35, v37, v38)
                v39
            }
            False -> {
                let v40 = option.from_result(result.map(string.split_once(v16, v17), pair.first))
                let v41 = v40 |> option.map(v19)
                let v42 = Us2None
                let v43 = v41 |> option.unwrap(v42)
                let v47 =
                    case v43  {
                        Us2None -> -1
                        Us2Some(v44) -> {
                            let v45 = bit_array.byte_size(bit_array.from_string(v44))
                            v45
                        }
                    }
                let v48 = spiral_wrap_signed(v47 + 4, 32)
                let v49 = spiral_wrap_signed(v28 - v48, 32)
                let v50 = spiral_wrap_signed(v48 + v49, 32)
                let v51 = spiral_wrap_signed(v50 - 1, 32)
                let v52 = spiral_string_slice(v16, v48, v51)
                let v53 = erlang_term_coerce(v52)
                let v54 = "json"
                let v55 = atom.create(v54)
                let v56 = "decode"
                let v57 = atom.create(v56)
                let v58 = []
                let v59 = [v53, ..v58]
                let v60 = erlang_term_apply(v55, v57, v59)
                v60
            }
        }
    let v62 = ""
    let v63 = erlang_term_coerce(v62)
    let v64 = "text"
    let v65 = erlang_term_coerce(v64)
    let v66 = erlang_term_coerce(v63)
    let v67 = "maps"
    let v68 = atom.create(v67)
    let v69 = "get"
    let v70 = atom.create(v69)
    let v71 = []
    let v72 = [v66, ..v71]
    let v73 = [v61, ..v72]
    let v74 = [v65, ..v73]
    let v75 = erlang_term_apply(v68, v70, v74)
    let v76 = erlang_term_coerce(v75)
    let v77 = erlang_term_coerce(v76)
    let v78 = erlang_term_coerce(v77)
    let v79 = "trailing"
    let v80 = atom.create(v79)
    let v81 = erlang_term_coerce(v80)
    let v82 = "string"
    let v83 = atom.create(v82)
    let v84 = "trim"
    let v85 = atom.create(v84)
    let v86 = []
    let v87 = [v81, ..v86]
    let v88 = [v78, ..v87]
    let v89 = erlang_term_apply(v83, v85, v88)
    let v90 = erlang_term_coerce(v89)
    let v91 = atom.create(v67)
    let v92 = "new"
    let v93 = atom.create(v92)
    let v94 = []
    let v95 = erlang_term_apply(v91, v93, v94)
    let v96 = "reply"
    let v97 = erlang_term_coerce(v96)
    let v98 = erlang_term_coerce(v95)
    let v99 = atom.create(v67)
    let v100 = atom.create(v69)
    let v101 = []
    let v102 = [v98, ..v101]
    let v103 = [v61, ..v102]
    let v104 = [v97, ..v103]
    let v105 = erlang_term_apply(v99, v100, v104)
    let v106 = erlang_term_coerce(v105)
    let v107 = "in_reply_to_tweet_id"
    let v108 = erlang_term_coerce(v107)
    let v109 = atom.create(v67)
    let v110 = "is_key"
    let v111 = atom.create(v110)
    let v112 = []
    let v113 = [v106, ..v112]
    let v114 = [v108, ..v113]
    let v115 = erlang_term_apply(v109, v111, v114)
    let v116 = erlang_term_coerce(v115)
    let v145 =
        case v116 {
            True -> {
                let v117 = erlang_term_coerce(v62)
                let v118 = erlang_term_coerce(v107)
                let v119 = erlang_term_coerce(v117)
                let v120 = atom.create(v67)
                let v121 = atom.create(v69)
                let v122 = []
                let v123 = [v119, ..v122]
                let v124 = [v106, ..v123]
                let v125 = [v118, ..v124]
                let v126 = erlang_term_apply(v120, v121, v125)
                let v127 = erlang_term_coerce(v126)
                let v128 = "erlang"
                let v129 = atom.create(v128)
                let v130 = "is_binary"
                let v131 = atom.create(v130)
                let v132 = []
                let v133 = [v127, ..v132]
                let v134 = erlang_term_apply(v129, v131, v133)
                let v135 = erlang_term_coerce(v134)
                case v135 {
                    True -> {
                        let v136 = erlang_term_coerce(v127)
                        v136
                    }
                    False -> {
                        let v137 = atom.create(v128)
                        let v138 = "integer_to_binary"
                        let v139 = atom.create(v138)
                        let v140 = []
                        let v141 = [v127, ..v140]
                        let v142 = erlang_term_apply(v137, v139, v141)
                        let v143 = erlang_term_coerce(v142)
                        v143
                    }
                }
            }
            False -> v62
        }
    let v146 = v90 == ""
    let v151 =
        case v146 {
            True -> True
            False -> {
                let v147 = units_of_586(v90)
                let v148 = 0
                let v149 = method587(v147, v148)
                let v150 = v149 > 280
                v150
            }
        }
    case v151 {
        True -> {
            let v152 = "Invalid Request"
            let v153 = erlang_term_coerce(v152)
            let v154 = "text must be 1 to 280 characters"
            let v155 = erlang_term_coerce(v154)
            let v156 = "about:blank"
            let v157 = erlang_term_coerce(v156)
            let v158 = erlang_term_coerce(400)
            let v159 = "status"
            let v160 = atom.create(v159)
            let v161 = erlang_term_coerce(v160)
            let v162 = []
            let v163 = [v158, ..v162]
            let v164 = [v161, ..v163]
            let v165 = erlang_term_tuple(v164)
            let v166 = "type"
            let v167 = atom.create(v166)
            let v168 = erlang_term_coerce(v167)
            let v169 = []
            let v170 = [v157, ..v169]
            let v171 = [v168, ..v170]
            let v172 = erlang_term_tuple(v171)
            let v173 = "detail"
            let v174 = atom.create(v173)
            let v175 = erlang_term_coerce(v174)
            let v176 = []
            let v177 = [v155, ..v176]
            let v178 = [v175, ..v177]
            let v179 = erlang_term_tuple(v178)
            let v180 = "title"
            let v181 = atom.create(v180)
            let v182 = erlang_term_coerce(v181)
            let v183 = []
            let v184 = [v153, ..v183]
            let v185 = [v182, ..v184]
            let v186 = erlang_term_tuple(v185)
            let v187 = []
            let v188 = [v165, ..v187]
            let v189 = [v172, ..v188]
            let v190 = [v179, ..v189]
            let v191 = [v186, ..v190]
            let v192 = erlang_term_coerce(v191)
            let v193 = atom.create(v67)
            let v194 = "from_list"
            let v195 = atom.create(v194)
            let v196 = []
            let v197 = [v192, ..v196]
            let v198 = erlang_term_apply(v193, v195, v197)
            let v199 = "json"
            let v200 = atom.create(v199)
            let v201 = "encode"
            let v202 = atom.create(v201)
            let v203 = []
            let v204 = [v198, ..v203]
            let v205 = erlang_term_apply(v200, v202, v204)
            let v206 = "erlang"
            let v207 = atom.create(v206)
            let v208 = "iolist_to_binary"
            let v209 = atom.create(v208)
            let v210 = []
            let v211 = [v205, ..v210]
            let v212 = erlang_term_apply(v207, v209, v211)
            let v213 = erlang_term_coerce(v212)
            let v214 = string.inspect(400)
            let v215 = "HTTP/1.1 "
            let v216 = v215 <> v214 
            let v217 = " "
            let v218 = v216 <> v217 
            let v219 = "Bad Request"
            let v220 = v218 <> v219 
            let v221 = erlang_term_coerce(v213)
            let v222 = atom.create(v206)
            let v223 = "byte_size"
            let v224 = atom.create(v223)
            let v225 = []
            let v226 = [v221, ..v225]
            let v227 = erlang_term_apply(v222, v224, v226)
            let v228 = erlang_term_coerce(v227)
            let v229 = string.inspect(v228)
            let v230 = "\r\nContent-Length: "
            let v231 = v230 <> v229 
            let v232 = "\r\nContent-Type: application/json; charset=utf-8"
            let v233 = v232 <> v231 
            let v234 = "\r\nConnection: close\r\n\r\n"
            let v235 = v233 <> v234 
            let v236 = v220 <> v235 
            let v237 = v236 <> v213 
            #(v237, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
        }
        False -> {
            let v238 = v145 != ""
            let v241 =
                case v238 {
                    True -> {
                        let v239 = dict.has_key(v5, v145)
                        let v240 = v239 == False
                        v240
                    }
                    False -> False
                }
            case v241 {
                True -> {
                    let v242 = "in_reply_to_tweet_id "
                    let v243 = v242 <> v145 
                    let v244 = " does not exist"
                    let v245 = v243 <> v244 
                    let v246 = "Invalid Request"
                    let v247 = erlang_term_coerce(v246)
                    let v248 = erlang_term_coerce(v245)
                    let v249 = "about:blank"
                    let v250 = erlang_term_coerce(v249)
                    let v251 = erlang_term_coerce(400)
                    let v252 = "status"
                    let v253 = atom.create(v252)
                    let v254 = erlang_term_coerce(v253)
                    let v255 = []
                    let v256 = [v251, ..v255]
                    let v257 = [v254, ..v256]
                    let v258 = erlang_term_tuple(v257)
                    let v259 = "type"
                    let v260 = atom.create(v259)
                    let v261 = erlang_term_coerce(v260)
                    let v262 = []
                    let v263 = [v250, ..v262]
                    let v264 = [v261, ..v263]
                    let v265 = erlang_term_tuple(v264)
                    let v266 = "detail"
                    let v267 = atom.create(v266)
                    let v268 = erlang_term_coerce(v267)
                    let v269 = []
                    let v270 = [v248, ..v269]
                    let v271 = [v268, ..v270]
                    let v272 = erlang_term_tuple(v271)
                    let v273 = "title"
                    let v274 = atom.create(v273)
                    let v275 = erlang_term_coerce(v274)
                    let v276 = []
                    let v277 = [v247, ..v276]
                    let v278 = [v275, ..v277]
                    let v279 = erlang_term_tuple(v278)
                    let v280 = []
                    let v281 = [v258, ..v280]
                    let v282 = [v265, ..v281]
                    let v283 = [v272, ..v282]
                    let v284 = [v279, ..v283]
                    let v285 = erlang_term_coerce(v284)
                    let v286 = atom.create(v67)
                    let v287 = "from_list"
                    let v288 = atom.create(v287)
                    let v289 = []
                    let v290 = [v285, ..v289]
                    let v291 = erlang_term_apply(v286, v288, v290)
                    let v292 = "json"
                    let v293 = atom.create(v292)
                    let v294 = "encode"
                    let v295 = atom.create(v294)
                    let v296 = []
                    let v297 = [v291, ..v296]
                    let v298 = erlang_term_apply(v293, v295, v297)
                    let v299 = "erlang"
                    let v300 = atom.create(v299)
                    let v301 = "iolist_to_binary"
                    let v302 = atom.create(v301)
                    let v303 = []
                    let v304 = [v298, ..v303]
                    let v305 = erlang_term_apply(v300, v302, v304)
                    let v306 = erlang_term_coerce(v305)
                    let v307 = string.inspect(400)
                    let v308 = "HTTP/1.1 "
                    let v309 = v308 <> v307 
                    let v310 = " "
                    let v311 = v309 <> v310 
                    let v312 = "Bad Request"
                    let v313 = v311 <> v312 
                    let v314 = erlang_term_coerce(v306)
                    let v315 = atom.create(v299)
                    let v316 = "byte_size"
                    let v317 = atom.create(v316)
                    let v318 = []
                    let v319 = [v314, ..v318]
                    let v320 = erlang_term_apply(v315, v317, v319)
                    let v321 = erlang_term_coerce(v320)
                    let v322 = string.inspect(v321)
                    let v323 = "\r\nContent-Length: "
                    let v324 = v323 <> v322 
                    let v325 = "\r\nContent-Type: application/json; charset=utf-8"
                    let v326 = v325 <> v324 
                    let v327 = "\r\nConnection: close\r\n\r\n"
                    let v328 = v326 <> v327 
                    let v329 = v313 <> v328 
                    let v330 = v329 <> v306 
                    #(v330, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
                }
                False -> posted_588(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v90, v145)
            }
        }
    }
}

pub fn removed_590(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v13 = dict.has_key(v10, v12)
    case v13 {
        True -> {
            let v14 = erlang_term_coerce(True)
            let v15 = "deleted"
            let v16 = atom.create(v15)
            let v17 = erlang_term_coerce(v16)
            let v18 = []
            let v19 = [v14, ..v18]
            let v20 = [v17, ..v19]
            let v21 = erlang_term_tuple(v20)
            let v22 = []
            let v23 = [v21, ..v22]
            let v24 = erlang_term_coerce(v23)
            let v25 = "maps"
            let v26 = atom.create(v25)
            let v27 = "from_list"
            let v28 = atom.create(v27)
            let v29 = []
            let v30 = [v24, ..v29]
            let v31 = erlang_term_apply(v26, v28, v30)
            let v32 = "data"
            let v33 = atom.create(v32)
            let v34 = erlang_term_coerce(v33)
            let v35 = []
            let v36 = [v31, ..v35]
            let v37 = [v34, ..v36]
            let v38 = erlang_term_tuple(v37)
            let v39 = []
            let v40 = [v38, ..v39]
            let v41 = erlang_term_coerce(v40)
            let v42 = atom.create(v25)
            let v43 = atom.create(v27)
            let v44 = []
            let v45 = [v41, ..v44]
            let v46 = erlang_term_apply(v42, v43, v45)
            let v47 = "json"
            let v48 = atom.create(v47)
            let v49 = "encode"
            let v50 = atom.create(v49)
            let v51 = []
            let v52 = [v46, ..v51]
            let v53 = erlang_term_apply(v48, v50, v52)
            let v54 = "erlang"
            let v55 = atom.create(v54)
            let v56 = "iolist_to_binary"
            let v57 = atom.create(v56)
            let v58 = []
            let v59 = [v53, ..v58]
            let v60 = erlang_term_apply(v55, v57, v59)
            let v61 = erlang_term_coerce(v60)
            let v62 = string.inspect(200)
            let v63 = "HTTP/1.1 "
            let v64 = v63 <> v62 
            let v65 = " "
            let v66 = v64 <> v65 
            let v67 = "OK"
            let v68 = v66 <> v67 
            let v69 = erlang_term_coerce(v61)
            let v70 = atom.create(v54)
            let v71 = "byte_size"
            let v72 = atom.create(v71)
            let v73 = []
            let v74 = [v69, ..v73]
            let v75 = erlang_term_apply(v70, v72, v74)
            let v76 = erlang_term_coerce(v75)
            let v77 = string.inspect(v76)
            let v78 = "\r\nContent-Length: "
            let v79 = v78 <> v77 
            let v80 = "\r\nContent-Type: application/json; charset=utf-8"
            let v81 = v80 <> v79 
            let v82 = "\r\nConnection: close\r\n\r\n"
            let v83 = v81 <> v82 
            let v84 = v68 <> v83 
            let v85 = v84 <> v61 
            let v86 = dict.delete(v10, v12)
            let v87 = dict.delete(v5, v12)
            #(v85, v0, v1, v2, v3, v4, v87, v6, v7, v8, v9, v86, v11)
        }
        False -> {
            let v88 = "Could not find post with id: ["
            let v89 = v88 <> v12 
            let v90 = "]."
            let v91 = v89 <> v90 
            let v92 = "Not Found Error"
            let v93 = erlang_term_coerce(v92)
            let v94 = erlang_term_coerce(v91)
            let v95 = "about:blank"
            let v96 = erlang_term_coerce(v95)
            let v97 = erlang_term_coerce(404)
            let v98 = "status"
            let v99 = atom.create(v98)
            let v100 = erlang_term_coerce(v99)
            let v101 = []
            let v102 = [v97, ..v101]
            let v103 = [v100, ..v102]
            let v104 = erlang_term_tuple(v103)
            let v105 = "type"
            let v106 = atom.create(v105)
            let v107 = erlang_term_coerce(v106)
            let v108 = []
            let v109 = [v96, ..v108]
            let v110 = [v107, ..v109]
            let v111 = erlang_term_tuple(v110)
            let v112 = "detail"
            let v113 = atom.create(v112)
            let v114 = erlang_term_coerce(v113)
            let v115 = []
            let v116 = [v94, ..v115]
            let v117 = [v114, ..v116]
            let v118 = erlang_term_tuple(v117)
            let v119 = "title"
            let v120 = atom.create(v119)
            let v121 = erlang_term_coerce(v120)
            let v122 = []
            let v123 = [v93, ..v122]
            let v124 = [v121, ..v123]
            let v125 = erlang_term_tuple(v124)
            let v126 = []
            let v127 = [v104, ..v126]
            let v128 = [v111, ..v127]
            let v129 = [v118, ..v128]
            let v130 = [v125, ..v129]
            let v131 = erlang_term_coerce(v130)
            let v132 = "maps"
            let v133 = atom.create(v132)
            let v134 = "from_list"
            let v135 = atom.create(v134)
            let v136 = []
            let v137 = [v131, ..v136]
            let v138 = erlang_term_apply(v133, v135, v137)
            let v139 = "json"
            let v140 = atom.create(v139)
            let v141 = "encode"
            let v142 = atom.create(v141)
            let v143 = []
            let v144 = [v138, ..v143]
            let v145 = erlang_term_apply(v140, v142, v144)
            let v146 = "erlang"
            let v147 = atom.create(v146)
            let v148 = "iolist_to_binary"
            let v149 = atom.create(v148)
            let v150 = []
            let v151 = [v145, ..v150]
            let v152 = erlang_term_apply(v147, v149, v151)
            let v153 = erlang_term_coerce(v152)
            let v154 = string.inspect(404)
            let v155 = "HTTP/1.1 "
            let v156 = v155 <> v154 
            let v157 = " "
            let v158 = v156 <> v157 
            let v159 = "Not Found"
            let v160 = v158 <> v159 
            let v161 = erlang_term_coerce(v153)
            let v162 = atom.create(v146)
            let v163 = "byte_size"
            let v164 = atom.create(v163)
            let v165 = []
            let v166 = [v161, ..v165]
            let v167 = erlang_term_apply(v162, v164, v166)
            let v168 = erlang_term_coerce(v167)
            let v169 = string.inspect(v168)
            let v170 = "\r\nContent-Length: "
            let v171 = v170 <> v169 
            let v172 = "\r\nContent-Type: application/json; charset=utf-8"
            let v173 = v172 <> v171 
            let v174 = "\r\nConnection: close\r\n\r\n"
            let v175 = v173 <> v174 
            let v176 = v160 <> v175 
            let v177 = v176 <> v153 
            #(v177, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
        }
    }
}
