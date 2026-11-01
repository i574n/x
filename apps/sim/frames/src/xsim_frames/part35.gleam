import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Us95, type Us96, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us95OAuth1User, Us95UserBearer}
import xsim_frames/part1.{closure1, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part2.{method20}
import xsim_frames/part28.{logged_464}
import xsim_frames/part34.{answer_581, method587, posted_588, routed_469, units_of_586}

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
    let v66 = "maps"
    let v67 = atom.create(v66)
    let v68 = "get"
    let v69 = atom.create(v68)
    let v70 = []
    let v71 = [v63, ..v70]
    let v72 = [v61, ..v71]
    let v73 = [v65, ..v72]
    let v74 = erlang_term_apply(v67, v69, v73)
    let v75 = erlang_term_coerce(v74)
    let v76 = erlang_term_coerce(v75)
    let v77 = "trailing"
    let v78 = atom.create(v77)
    let v79 = erlang_term_coerce(v78)
    let v80 = "string"
    let v81 = atom.create(v80)
    let v82 = "trim"
    let v83 = atom.create(v82)
    let v84 = []
    let v85 = [v79, ..v84]
    let v86 = [v76, ..v85]
    let v87 = erlang_term_apply(v81, v83, v86)
    let v88 = erlang_term_coerce(v87)
    let v89 = atom.create(v66)
    let v90 = "new"
    let v91 = atom.create(v90)
    let v92 = []
    let v93 = erlang_term_apply(v89, v91, v92)
    let v94 = "reply"
    let v95 = erlang_term_coerce(v94)
    let v96 = atom.create(v66)
    let v97 = atom.create(v68)
    let v98 = []
    let v99 = [v93, ..v98]
    let v100 = [v61, ..v99]
    let v101 = [v95, ..v100]
    let v102 = erlang_term_apply(v96, v97, v101)
    let v103 = "in_reply_to_tweet_id"
    let v104 = erlang_term_coerce(v103)
    let v105 = atom.create(v66)
    let v106 = "is_key"
    let v107 = atom.create(v106)
    let v108 = []
    let v109 = [v102, ..v108]
    let v110 = [v104, ..v109]
    let v111 = erlang_term_apply(v105, v107, v110)
    let v112 = erlang_term_coerce(v111)
    let v139 =
        case v112 {
            True -> {
                let v113 = erlang_term_coerce(v103)
                let v114 = erlang_term_coerce(v62)
                let v115 = atom.create(v66)
                let v116 = atom.create(v68)
                let v117 = []
                let v118 = [v114, ..v117]
                let v119 = [v102, ..v118]
                let v120 = [v113, ..v119]
                let v121 = erlang_term_apply(v115, v116, v120)
                let v122 = "erlang"
                let v123 = atom.create(v122)
                let v124 = "is_binary"
                let v125 = atom.create(v124)
                let v126 = []
                let v127 = [v121, ..v126]
                let v128 = erlang_term_apply(v123, v125, v127)
                let v129 = erlang_term_coerce(v128)
                case v129 {
                    True -> {
                        let v130 = erlang_term_coerce(v121)
                        v130
                    }
                    False -> {
                        let v131 = atom.create(v122)
                        let v132 = "integer_to_binary"
                        let v133 = atom.create(v132)
                        let v134 = []
                        let v135 = [v121, ..v134]
                        let v136 = erlang_term_apply(v131, v133, v135)
                        let v137 = erlang_term_coerce(v136)
                        v137
                    }
                }
            }
            False -> v62
        }
    let v140 = v88 == ""
    let v145 =
        case v140 {
            True -> True
            False -> {
                let v141 = units_of_586(v88)
                let v142 = 0
                let v143 = method587(v141, v142)
                let v144 = v143 > 280
                v144
            }
        }
    case v145 {
        True -> {
            let v146 = "Invalid Request"
            let v147 = erlang_term_coerce(v146)
            let v148 = "text must be 1 to 280 characters"
            let v149 = erlang_term_coerce(v148)
            let v150 = "about:blank"
            let v151 = erlang_term_coerce(v150)
            let v152 = erlang_term_coerce(400)
            let v153 = "status"
            let v154 = atom.create(v153)
            let v155 = erlang_term_coerce(v154)
            let v156 = []
            let v157 = [v152, ..v156]
            let v158 = [v155, ..v157]
            let v159 = erlang_term_tuple(v158)
            let v160 = "type"
            let v161 = atom.create(v160)
            let v162 = erlang_term_coerce(v161)
            let v163 = []
            let v164 = [v151, ..v163]
            let v165 = [v162, ..v164]
            let v166 = erlang_term_tuple(v165)
            let v167 = "detail"
            let v168 = atom.create(v167)
            let v169 = erlang_term_coerce(v168)
            let v170 = []
            let v171 = [v149, ..v170]
            let v172 = [v169, ..v171]
            let v173 = erlang_term_tuple(v172)
            let v174 = "title"
            let v175 = atom.create(v174)
            let v176 = erlang_term_coerce(v175)
            let v177 = []
            let v178 = [v147, ..v177]
            let v179 = [v176, ..v178]
            let v180 = erlang_term_tuple(v179)
            let v181 = []
            let v182 = [v159, ..v181]
            let v183 = [v166, ..v182]
            let v184 = [v173, ..v183]
            let v185 = [v180, ..v184]
            let v186 = erlang_term_coerce(v185)
            let v187 = atom.create(v66)
            let v188 = "from_list"
            let v189 = atom.create(v188)
            let v190 = []
            let v191 = [v186, ..v190]
            let v192 = erlang_term_apply(v187, v189, v191)
            let v193 = "json"
            let v194 = atom.create(v193)
            let v195 = "encode"
            let v196 = atom.create(v195)
            let v197 = []
            let v198 = [v192, ..v197]
            let v199 = erlang_term_apply(v194, v196, v198)
            let v200 = "erlang"
            let v201 = atom.create(v200)
            let v202 = "iolist_to_binary"
            let v203 = atom.create(v202)
            let v204 = []
            let v205 = [v199, ..v204]
            let v206 = erlang_term_apply(v201, v203, v205)
            let v207 = erlang_term_coerce(v206)
            let v208 = string.inspect(400)
            let v209 = "HTTP/1.1 "
            let v210 = v209 <> v208 
            let v211 = " "
            let v212 = v210 <> v211 
            let v213 = "Bad Request"
            let v214 = v212 <> v213 
            let v215 = erlang_term_coerce(v207)
            let v216 = atom.create(v200)
            let v217 = "byte_size"
            let v218 = atom.create(v217)
            let v219 = []
            let v220 = [v215, ..v219]
            let v221 = erlang_term_apply(v216, v218, v220)
            let v222 = erlang_term_coerce(v221)
            let v223 = string.inspect(v222)
            let v224 = "\r\nContent-Length: "
            let v225 = v224 <> v223 
            let v226 = "\r\nContent-Type: application/json; charset=utf-8"
            let v227 = v226 <> v225 
            let v228 = "\r\nConnection: close\r\n\r\n"
            let v229 = v227 <> v228 
            let v230 = v214 <> v229 
            let v231 = v230 <> v207 
            #(v231, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
        }
        False -> {
            let v232 = v139 != ""
            let v235 =
                case v232 {
                    True -> {
                        let v233 = dict.has_key(v5, v139)
                        let v234 = v233 == False
                        v234
                    }
                    False -> False
                }
            case v235 {
                True -> {
                    let v236 = "in_reply_to_tweet_id "
                    let v237 = v236 <> v139 
                    let v238 = " does not exist"
                    let v239 = v237 <> v238 
                    let v240 = "Invalid Request"
                    let v241 = erlang_term_coerce(v240)
                    let v242 = erlang_term_coerce(v239)
                    let v243 = "about:blank"
                    let v244 = erlang_term_coerce(v243)
                    let v245 = erlang_term_coerce(400)
                    let v246 = "status"
                    let v247 = atom.create(v246)
                    let v248 = erlang_term_coerce(v247)
                    let v249 = []
                    let v250 = [v245, ..v249]
                    let v251 = [v248, ..v250]
                    let v252 = erlang_term_tuple(v251)
                    let v253 = "type"
                    let v254 = atom.create(v253)
                    let v255 = erlang_term_coerce(v254)
                    let v256 = []
                    let v257 = [v244, ..v256]
                    let v258 = [v255, ..v257]
                    let v259 = erlang_term_tuple(v258)
                    let v260 = "detail"
                    let v261 = atom.create(v260)
                    let v262 = erlang_term_coerce(v261)
                    let v263 = []
                    let v264 = [v242, ..v263]
                    let v265 = [v262, ..v264]
                    let v266 = erlang_term_tuple(v265)
                    let v267 = "title"
                    let v268 = atom.create(v267)
                    let v269 = erlang_term_coerce(v268)
                    let v270 = []
                    let v271 = [v241, ..v270]
                    let v272 = [v269, ..v271]
                    let v273 = erlang_term_tuple(v272)
                    let v274 = []
                    let v275 = [v252, ..v274]
                    let v276 = [v259, ..v275]
                    let v277 = [v266, ..v276]
                    let v278 = [v273, ..v277]
                    let v279 = erlang_term_coerce(v278)
                    let v280 = atom.create(v66)
                    let v281 = "from_list"
                    let v282 = atom.create(v281)
                    let v283 = []
                    let v284 = [v279, ..v283]
                    let v285 = erlang_term_apply(v280, v282, v284)
                    let v286 = "json"
                    let v287 = atom.create(v286)
                    let v288 = "encode"
                    let v289 = atom.create(v288)
                    let v290 = []
                    let v291 = [v285, ..v290]
                    let v292 = erlang_term_apply(v287, v289, v291)
                    let v293 = "erlang"
                    let v294 = atom.create(v293)
                    let v295 = "iolist_to_binary"
                    let v296 = atom.create(v295)
                    let v297 = []
                    let v298 = [v292, ..v297]
                    let v299 = erlang_term_apply(v294, v296, v298)
                    let v300 = erlang_term_coerce(v299)
                    let v301 = string.inspect(400)
                    let v302 = "HTTP/1.1 "
                    let v303 = v302 <> v301 
                    let v304 = " "
                    let v305 = v303 <> v304 
                    let v306 = "Bad Request"
                    let v307 = v305 <> v306 
                    let v308 = erlang_term_coerce(v300)
                    let v309 = atom.create(v293)
                    let v310 = "byte_size"
                    let v311 = atom.create(v310)
                    let v312 = []
                    let v313 = [v308, ..v312]
                    let v314 = erlang_term_apply(v309, v311, v313)
                    let v315 = erlang_term_coerce(v314)
                    let v316 = string.inspect(v315)
                    let v317 = "\r\nContent-Length: "
                    let v318 = v317 <> v316 
                    let v319 = "\r\nContent-Type: application/json; charset=utf-8"
                    let v320 = v319 <> v318 
                    let v321 = "\r\nConnection: close\r\n\r\n"
                    let v322 = v320 <> v321 
                    let v323 = v307 <> v322 
                    let v324 = v323 <> v300 
                    #(v324, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
                }
                False -> posted_588(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v88, v139)
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

pub fn post_or_delete_584(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v17 = v12 == "POST"
    let v19 =
        case v17 {
            True -> {
                let v18 = v13 == "/2/tweets"
                v18
            }
            False -> False
        }
    case v19 {
        True -> new_post_585(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
        False -> {
            let v33 = v13 == ""
            let v37 =
                case v33 {
                    True -> Uh3Nil
                    False -> {
                        let v35 = "/"
                        split_list_2(v35, v13)
                    }
                }
            let v68 =
                case v37  {
                    Uh3Cons(v38, v39) -> {
                        let v40 = "" == v38
                        case v40 {
                            True -> {
                                case v39  {
                                    Uh3Cons(v41, v42) -> {
                                        let v43 = "2" == v41
                                        case v43 {
                                            True -> {
                                                case v42  {
                                                    Uh3Cons(v44, v45) -> {
                                                        let v46 = "tweets" == v44
                                                        case v46 {
                                                            True -> {
                                                                case v45  {
                                                                    Uh3Cons(v47, v48) -> {
                                                                        case v48  {
                                                                            Uh3Nil -> {
                                                                                let v49 = v12 == "DELETE"
                                                                                case v49 {
                                                                                    True -> Us2Some(v47)
                                                                                    False -> Us2None
                                                                                }
                                                                            }
                                                                            _ -> Us2None
                                                                        }
                                                                    }
                                                                    _ -> Us2None
                                                                }
                                                            }
                                                            False -> Us2None
                                                        }
                                                    }
                                                    _ -> Us2None
                                                }
                                            }
                                            False -> Us2None
                                        }
                                    }
                                    _ -> Us2None
                                }
                            }
                            False -> Us2None
                        }
                    }
                    _ -> Us2None
                }
            case v68  {
                Us2None -> {
                    let v83 = "no route "
                    let v84 = v83 <> v13 
                    let v85 = "Not Found Error"
                    let v86 = erlang_term_coerce(v85)
                    let v87 = erlang_term_coerce(v84)
                    let v88 = "about:blank"
                    let v89 = erlang_term_coerce(v88)
                    let v90 = erlang_term_coerce(404)
                    let v91 = "status"
                    let v92 = atom.create(v91)
                    let v93 = erlang_term_coerce(v92)
                    let v94 = []
                    let v95 = [v90, ..v94]
                    let v96 = [v93, ..v95]
                    let v97 = erlang_term_tuple(v96)
                    let v98 = "type"
                    let v99 = atom.create(v98)
                    let v100 = erlang_term_coerce(v99)
                    let v101 = []
                    let v102 = [v89, ..v101]
                    let v103 = [v100, ..v102]
                    let v104 = erlang_term_tuple(v103)
                    let v105 = "detail"
                    let v106 = atom.create(v105)
                    let v107 = erlang_term_coerce(v106)
                    let v108 = []
                    let v109 = [v87, ..v108]
                    let v110 = [v107, ..v109]
                    let v111 = erlang_term_tuple(v110)
                    let v112 = "title"
                    let v113 = atom.create(v112)
                    let v114 = erlang_term_coerce(v113)
                    let v115 = []
                    let v116 = [v86, ..v115]
                    let v117 = [v114, ..v116]
                    let v118 = erlang_term_tuple(v117)
                    let v119 = []
                    let v120 = [v97, ..v119]
                    let v121 = [v104, ..v120]
                    let v122 = [v111, ..v121]
                    let v123 = [v118, ..v122]
                    let v124 = erlang_term_coerce(v123)
                    let v125 = "maps"
                    let v126 = atom.create(v125)
                    let v127 = "from_list"
                    let v128 = atom.create(v127)
                    let v129 = []
                    let v130 = [v124, ..v129]
                    let v131 = erlang_term_apply(v126, v128, v130)
                    let v132 = "json"
                    let v133 = atom.create(v132)
                    let v134 = "encode"
                    let v135 = atom.create(v134)
                    let v136 = []
                    let v137 = [v131, ..v136]
                    let v138 = erlang_term_apply(v133, v135, v137)
                    let v139 = "erlang"
                    let v140 = atom.create(v139)
                    let v141 = "iolist_to_binary"
                    let v142 = atom.create(v141)
                    let v143 = []
                    let v144 = [v138, ..v143]
                    let v145 = erlang_term_apply(v140, v142, v144)
                    let v146 = erlang_term_coerce(v145)
                    let v147 = string.inspect(404)
                    let v148 = "HTTP/1.1 "
                    let v149 = v148 <> v147 
                    let v150 = " "
                    let v151 = v149 <> v150 
                    let v152 = "Not Found"
                    let v153 = v151 <> v152 
                    let v154 = erlang_term_coerce(v146)
                    let v155 = atom.create(v139)
                    let v156 = "byte_size"
                    let v157 = atom.create(v156)
                    let v158 = []
                    let v159 = [v154, ..v158]
                    let v160 = erlang_term_apply(v155, v157, v159)
                    let v161 = erlang_term_coerce(v160)
                    let v162 = string.inspect(v161)
                    let v163 = "\r\nContent-Length: "
                    let v164 = v163 <> v162 
                    let v165 = "\r\nContent-Type: application/json; charset=utf-8"
                    let v166 = v165 <> v164 
                    let v167 = "\r\nConnection: close\r\n\r\n"
                    let v168 = v166 <> v167 
                    let v169 = v153 <> v168 
                    let v170 = v169 <> v146 
                    #(v170, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
                }
                Us2Some(v69) -> removed_590(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v69)
            }
        }
    }
}

pub fn user_write_583(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: Us95) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    case v17  {
        Us95OAuth1User -> post_or_delete_584(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
        Us95UserBearer -> post_or_delete_584(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
    }
}

pub fn change_reply_582(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: Us95) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    user_write_583(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
}

pub fn reply_as_580(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: String, v18: Us95) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v22 =
        case v18  {
            Us95OAuth1User -> {
                let v20 = "oauth1"
                v20
            }
            Us95UserBearer -> {
                let v19 = "user"
                v19
            }
        }
    logged_464(v12, v13, v14, v15, v16, v17, v22)
    let v23 = "xsim serve / answered "
    let v24 = v23 <> v13 
    let v25 = " "
    let v26 = v24 <> v25 
    let v27 = v26 <> v14 
    let v28 = "\n"
    let v29 = v27 <> v28 
    let v30 = erlang_term_coerce(v29)
    let v31 = "standard_error"
    let v32 = atom.create(v31)
    let v33 = erlang_term_coerce(v32)
    let v34 = "io"
    let v35 = atom.create(v34)
    let v36 = "put_chars"
    let v37 = atom.create(v36)
    let v38 = []
    let v39 = [v30, ..v38]
    let v40 = [v33, ..v39]
    let _v41 = erlang_term_apply(v35, v37, v40)
    let v42 = v13 == "GET"
    case v42 {
        True -> {
            let v43 = answer_581(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
            #(v43, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
        }
        False -> change_reply_582(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
    }
}

pub fn answer_593(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, _v17: Us96) -> String {
    routed_469(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
}

pub fn issued_next_596(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v12 = "oauth2"
    let v13 = erlang_term_coerce(v12)
    let v14 = ""
    let v15 = erlang_term_coerce(v14)
    let v16 = "maps"
    let v17 = atom.create(v16)
    let v18 = "get"
    let v19 = atom.create(v18)
    let v20 = []
    let v21 = [v15, ..v20]
    let v22 = [v7, ..v21]
    let v23 = [v13, ..v22]
    let v24 = erlang_term_apply(v17, v19, v23)
    let v25 = "refresh_token"
    let v26 = erlang_term_coerce(v25)
    let v27 = erlang_term_coerce(v14)
    let v28 = atom.create(v16)
    let v29 = atom.create(v18)
    let v30 = []
    let v31 = [v27, ..v30]
    let v32 = [v24, ..v31]
    let v33 = [v26, ..v32]
    let v34 = erlang_term_apply(v28, v29, v33)
    let v35 = erlang_term_coerce(v34)
    let v36 = "-"
    let v37 = v35 <> v36 
    let v38 = 0
    let v39 = method20(v8, v38)
    let v40 = string.inspect(v39)
    let v41 = v37 <> v40 
    let v42 = erlang_term_coerce(v12)
    let v43 = erlang_term_coerce(v14)
    let v44 = atom.create(v16)
    let v45 = atom.create(v18)
    let v46 = []
    let v47 = [v43, ..v46]
    let v48 = [v7, ..v47]
    let v49 = [v42, ..v48]
    let v50 = erlang_term_apply(v44, v45, v49)
    let v51 = "access_token"
    let v52 = erlang_term_coerce(v51)
    let v53 = erlang_term_coerce(v14)
    let v54 = atom.create(v16)
    let v55 = atom.create(v18)
    let v56 = []
    let v57 = [v53, ..v56]
    let v58 = [v50, ..v57]
    let v59 = [v52, ..v58]
    let v60 = erlang_term_apply(v54, v55, v59)
    let v61 = erlang_term_coerce(v60)
    let v62 = v61 <> v36 
    let v63 = 0
    let v64 = method20(v8, v63)
    let v65 = string.inspect(v64)
    let v66 = v62 <> v65 
    let v67 = "tweet.read tweet.write users.read offline.access"
    let v68 = erlang_term_coerce(v67)
    let v69 = erlang_term_coerce(v41)
    let v70 = "bearer"
    let v71 = erlang_term_coerce(v70)
    let v72 = erlang_term_coerce(7200)
    let v73 = erlang_term_coerce(v66)
    let v74 = atom.create(v25)
    let v75 = erlang_term_coerce(v74)
    let v76 = []
    let v77 = [v69, ..v76]
    let v78 = [v75, ..v77]
    let v79 = erlang_term_tuple(v78)
    let v80 = "scope"
    let v81 = atom.create(v80)
    let v82 = erlang_term_coerce(v81)
    let v83 = []
    let v84 = [v68, ..v83]
    let v85 = [v82, ..v84]
    let v86 = erlang_term_tuple(v85)
    let v87 = atom.create(v51)
    let v88 = erlang_term_coerce(v87)
    let v89 = []
    let v90 = [v73, ..v89]
    let v91 = [v88, ..v90]
    let v92 = erlang_term_tuple(v91)
    let v93 = "expires_in"
    let v94 = atom.create(v93)
    let v95 = erlang_term_coerce(v94)
    let v96 = []
    let v97 = [v72, ..v96]
    let v98 = [v95, ..v97]
    let v99 = erlang_term_tuple(v98)
    let v100 = "token_type"
    let v101 = atom.create(v100)
    let v102 = erlang_term_coerce(v101)
    let v103 = []
    let v104 = [v71, ..v103]
    let v105 = [v102, ..v104]
    let v106 = erlang_term_tuple(v105)
    let v107 = []
    let v108 = [v79, ..v107]
    let v109 = [v86, ..v108]
    let v110 = [v92, ..v109]
    let v111 = [v99, ..v110]
    let v112 = [v106, ..v111]
    let v113 = erlang_term_coerce(v112)
    let v114 = atom.create(v16)
    let v115 = "from_list"
    let v116 = atom.create(v115)
    let v117 = []
    let v118 = [v113, ..v117]
    let v119 = erlang_term_apply(v114, v116, v118)
    let v120 = "json"
    let v121 = atom.create(v120)
    let v122 = "encode"
    let v123 = atom.create(v122)
    let v124 = []
    let v125 = [v119, ..v124]
    let v126 = erlang_term_apply(v121, v123, v125)
    let v127 = "erlang"
    let v128 = atom.create(v127)
    let v129 = "iolist_to_binary"
    let v130 = atom.create(v129)
    let v131 = []
    let v132 = [v126, ..v131]
    let v133 = erlang_term_apply(v128, v130, v132)
    let v134 = erlang_term_coerce(v133)
    let v135 = string.inspect(200)
    let v136 = "HTTP/1.1 "
    let v137 = v136 <> v135 
    let v138 = " "
    let v139 = v137 <> v138 
    let v140 = "OK"
    let v141 = v139 <> v140 
    let v142 = erlang_term_coerce(v134)
    let v143 = atom.create(v127)
    let v144 = "byte_size"
    let v145 = atom.create(v144)
    let v146 = []
    let v147 = [v142, ..v146]
    let v148 = erlang_term_apply(v143, v145, v147)
    let v149 = erlang_term_coerce(v148)
    let v150 = string.inspect(v149)
    let v151 = "\r\nContent-Length: "
    let v152 = v151 <> v150 
    let v153 = "\r\nContent-Type: application/json; charset=utf-8"
    let v154 = v153 <> v152 
    let v155 = "\r\nConnection: close\r\n\r\n"
    let v156 = v154 <> v155 
    let v157 = v141 <> v156 
    let v158 = v157 <> v134 
    let v159 = Uh3Cons(v41, v8)
    #(v158, v0, v1, v2, v3, v4, v5, v6, v7, v159, v9, v10, v11)
}
