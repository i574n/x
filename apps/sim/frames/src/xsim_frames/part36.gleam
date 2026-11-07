import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Uh36, type Uh38, Uh13Nil, Uh29Cons, Uh29Nil, Uh36Nil, Uh38Cons, Uh38Nil, Uh39Nil, Uh3Cons, Uh3Nil, Uh41Nil, Uh44Text, Uh45Cons, Uh45Nil, Uh49Cons, Uh49Nil, Uh50Nil, Uh51Cons, Uh51Nil, Us103H1, Us104Heading, Us107AppBearer, Us110None, Us110Some, Us111UserBearer, Us112ClientBasic, Us2None, Us2Some, Us56Error, Us56Ok, Us80Error, Us80Ok}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, method4, spiral_fs_read_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part12.{items_from_301}
import xsim_frames/part16.{method370, method371}
import xsim_frames/part25.{first_value_465, method452, method462, method464, method466, method467, method468, request_of_451}
import xsim_frames/part26.{closure148, consumed_478, element_494, markup_text_497, method474, method475, method476, page_from_471, resumed_from_469, trusted_483}
import xsim_frames/part27.{blocks_html_480, concat_527, header_value_531, method525, method528, method529}
import xsim_frames/part29.{method590}
import xsim_frames/part33.{reply_as_534}
import xsim_frames/part34.{reply_as_654}
import xsim_frames/part35.{reply_as_666, signed_reply_672}
import xsim_frames/part9.{method258, method259}

pub fn keyed_reply_665(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let v21 = ""
    let v22 = erlang_term_coerce(v21)
    let v24 = erlang_term_coerce("oauth2")
    let v25 = erlang_term_coerce(v22)
    let v26 = "maps"
    let v27 = atom.create(v26)
    let v28 = "get"
    let v29 = atom.create(v28)
    let v30 = []
    let v31 = [v25, ..v30]
    let v32 = [v7, ..v31]
    let v33 = [v24, ..v32]
    let v34 = erlang_term_apply(v27, v29, v33)
    let v35 = erlang_term_coerce(v34)
    let v36 = erlang_term_coerce(v21)
    let v38 = erlang_term_coerce("client_id")
    let v39 = erlang_term_coerce(v36)
    let v40 = atom.create(v26)
    let v41 = atom.create(v28)
    let v42 = []
    let v43 = [v39, ..v42]
    let v44 = [v35, ..v43]
    let v45 = [v38, ..v44]
    let v46 = erlang_term_apply(v40, v41, v45)
    let v47 = erlang_term_coerce(v46)
    let v48 = erlang_term_coerce(v47)
    let v49 = { v48 } <> { ":" }
    let v50 = erlang_term_coerce(v21)
    let v52 = erlang_term_coerce("client_secret")
    let v53 = erlang_term_coerce(v50)
    let v54 = atom.create(v26)
    let v55 = atom.create(v28)
    let v56 = []
    let v57 = [v53, ..v56]
    let v58 = [v35, ..v57]
    let v59 = [v52, ..v58]
    let v60 = erlang_term_apply(v54, v55, v59)
    let v61 = erlang_term_coerce(v60)
    let v62 = erlang_term_coerce(v61)
    let v63 = { v49 } <> { v62 }
    let v64 = erlang_term_coerce(v63)
    let v66 = atom.create("base64")
    let v68 = atom.create("encode")
    let v69 = []
    let v70 = [v64, ..v69]
    let v71 = erlang_term_apply(v66, v68, v70)
    let v72 = erlang_term_coerce(v71)
    let v73 = { "Basic " } <> { v72 }
    let v74 = v20 == v73
    let v76 =
        case v74 {
            True -> {
                v16 == "/2/oauth2/token"
            }
            False -> False
        }
    case v76 {
        True -> {
            reply_as_666(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, Us112ClientBasic)
        }
        False -> signed_reply_672(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20)
    }
}

pub fn bearer_reply_533(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String, v20: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let v21 = { "Bearer " } <> { v0 }
    let v22 = v20 == v21
    case v22 {
        True -> {
            reply_as_534(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, Us107AppBearer)
        }
        False -> {
            let v39 = { "Bearer " } <> { v1 }
            let v40 = v20 == v39
            case v40 {
                True -> {
                    reply_as_654(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, Us111UserBearer)
                }
                False -> keyed_reply_665(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20)
            }
        }
    }
}

pub fn replied_530(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let #(v16, v17, v18, v19, v20) = request_of_451(v15)
    let v22 = header_value_531("authorization", v19)
    bearer_reply_533(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v16, v17, v18, v19, v20, v22)
}

pub fn feed_or_api_450(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let #(_v16, v17, v18, _v19, _v20) = request_of_451(v15)
    let v21 = v17 == "/timeline"
    case v21 {
        True -> {
            let #(v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61) =
                case v12  {
                    Uh36Nil -> {
                        let v22 = []
                        let v23 = erlang_term_coerce(v22)
                        let v25 = erlang_term_coerce("users")
                        let v26 = erlang_term_coerce(v23)
                        let v28 = atom.create("maps")
                        let v30 = atom.create("get")
                        let v31 = []
                        let v32 = [v26, ..v31]
                        let v33 = [v7, ..v32]
                        let v34 = [v25, ..v33]
                        let v35 = erlang_term_apply(v28, v30, v34)
                        let v36 = erlang_term_coerce(v35)
                        let v38 = atom.create("lists")
                        let v40 = atom.create("reverse")
                        let v41 = []
                        let v42 = [v36, ..v41]
                        let v43 = erlang_term_apply(v38, v40, v42)
                        let v45 = items_from_301(v43, Uh29Nil)
                        let v47 = method452(v45, v45, Uh36Nil)
                        #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v47, v13)
                    }
                    _ -> #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
                }
            let v62 = []
            let v63 = erlang_term_coerce(v62)
            let v65 = erlang_term_coerce("users")
            let v66 = erlang_term_coerce(v63)
            let v68 = atom.create("maps")
            let v70 = atom.create("get")
            let v71 = []
            let v72 = [v66, ..v71]
            let v73 = [v55, ..v72]
            let v74 = [v65, ..v73]
            let v75 = erlang_term_apply(v68, v70, v74)
            let v76 = erlang_term_coerce(v75)
            let v78 = atom.create("lists")
            let v80 = atom.create("reverse")
            let v81 = []
            let v82 = [v76, ..v81]
            let v83 = erlang_term_apply(v78, v80, v82)
            let v85 = items_from_301(v83, Uh29Nil)
            let v87 = method464(v85, Uh3Nil)
            let v89 = v18 == ""
            let v93 =
                case v89 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2("&", v18)
                    }
                }
            let v94 = first_value_465("f", v93)
            let v95 = v94 == ""
            let v97 =
                case v95 {
                    True -> {
                        ""
                    }
                    False -> v94
                }
            let v98 = v97 == ""
            let v102 =
                case v98 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2(".", v97)
                    }
                }
            let v104 = method466(v102, Uh3Nil)
            let v109 =
                case v89 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2("&", v18)
                    }
                }
            let v110 = first_value_465("c", v109)
            let v111 = v110 == ""
            let v113 =
                case v111 {
                    True -> {
                        ""
                    }
                    False -> v110
                }
            let v114 = v113 == ""
            let v118 =
                case v114 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2(".", v113)
                    }
                }
            let v120 = method466(v118, Uh3Nil)
            let v122 = method467(v120, Uh13Nil)
            let v123 = method468(v87, v104)
            let v126 =
                case v123 {
                    True -> v122
                    False -> {
                        Uh13Nil
                    }
                }
            let v127 = resumed_from_469(v60, v126)
            let v128 = closure148(Nil)
            let #(v130, v131) = page_from_471(v128, 50, v127)
            let v133 = method474(v130, Uh39Nil)
            let v135 = method475(v133, Uh39Nil)
            let v137 = method476(v135, Uh41Nil)
            let v138 = consumed_478(v60, v131)
            let v141 = Uh44Text("Following")
            let v143 = Uh45Cons(v141, Uh45Nil)
            let v144 = Us104Heading(Us103H1, v143)
            let v146 = Uh49Cons(v144, Uh49Nil)
            let v147 = blocks_html_480(v146)
            let v151 = trusted_483("body{background:rgb(21,32,43);color:rgb(231,233,234);font-family:system-ui,sans-serif;max-width:640px;margin:0 auto;padding:1em}img,video{max-width:100%;height:auto;border-radius:12px;margin:.4em 0}article{border-bottom:1px solid rgb(56,68,77);padding:.6em 0}blockquote.quoted{color:rgb(139,152,165)}.repost{opacity:.6;border-left:3px solid #999;padding-left:.6em}.quoted{border-left:3px solid #48c;margin:.3em 0 .3em .6em;padding-left:.6em}")
            let v152 = element_494("style", Uh50Nil, v151)
            let v154 = method525(v137, Uh51Nil)
            let v155 = Uh51Cons(v147, v154)
            let v156 = Uh51Cons(v152, v155)
            let v157 = concat_527(v156)
            let v158 = markup_text_497(v157)
            let v159 = ""
            let v160 = method528(v87, v159)
            let v161 = { "f=" } <> { v160 }
            let v162 = { v161 } <> { "&c=" }
            let v164 = method529(v138, Uh3Nil)
            let v165 = method528(v164, v159)
            let v166 = { v162 } <> { v165 }
            let v169 =
                case v137  {
                    Uh41Nil -> v159
                    _ -> {
                        let v167 = { "\n<a href=\"/timeline?" } <> { v166 }
                        let v168 = { v167 } <> { "\">next</a>" }
                        v168
                    }
                }
            let v170 = { v158 } <> { v169 }
            let v171 = { v170 } <> { "\n<script>(function(){var busy=!1;function last(){var a=document.querySelectorAll('a[href^=\"/timeline?\"]');return a.length?a[a.length-1]:null}function more(){var a=last();if(!a||busy)return;busy=!0;fetch(a.getAttribute('href')).then(function(r){return r.text()}).then(function(h){var d=new DOMParser().parseFromString(h,'text/html');d.querySelectorAll('article.post').forEach(function(x){a.parentNode.insertBefore(document.importNode(x,!0),a)});var n=d.querySelector('a[href^=\"/timeline?\"]');if(n){a.setAttribute('href',n.getAttribute('href'));busy=!1;check()}else a.remove()}).catch(function(){busy=!1})}function check(){var a=last();if(a&&a.getBoundingClientRect().top<innerHeight*2)more()}addEventListener('scroll',check,{passive:!0});check()})()</script>" }
            let v172 = int.to_string(200)
            let v173 = { "HTTP/1.1 " } <> { v172 }
            let v174 = { v173 } <> { " " }
            let v175 = { v174 } <> { "OK" }
            let v176 = erlang_term_coerce(v171)
            let v178 = atom.create("erlang")
            let v180 = atom.create("byte_size")
            let v181 = []
            let v182 = [v176, ..v181]
            let v183 = erlang_term_apply(v178, v180, v182)
            let v184 = erlang_term_coerce(v183)
            let v185 = int.to_string(v184)
            let v186 = { "\r\nContent-Length: " } <> { v185 }
            let v187 = { "\r\nContent-Type: text/html; charset=utf-8" } <> { v186 }
            let v188 = { v187 } <> { "\r\nConnection: close\r\n\r\n" }
            let v189 = { v175 } <> { v188 }
            let v190 = { v189 } <> { v171 }
            #(v190, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61)
        }
        False -> {
            let v192 = v17 |> string.starts_with("/media/")
            case v192 {
                True -> {
                    let v193 = spiral_string_length(v17)
                    let v194 = spiral_wrap_signed(v193 - 7, 32)
                    let v195 = spiral_wrap_signed(7 + v194, 32)
                    let v196 = spiral_wrap_signed(v195 - 1, 32)
                    let v197 = spiral_string_slice(v17, 7, v196)
                    let v198 = v197 != ""
                    let v202 =
                        case v198 {
                            True -> {
                                let v200 = v197 |> string.contains("..")
                                v200 == False
                            }
                            False -> False
                        }
                    let v206 =
                        case v202 {
                            True -> {
                                let v204 = v197 |> string.starts_with("/")
                                v204 == False
                            }
                            False -> False
                        }
                    let v210 =
                        case v206 {
                            True -> {
                                let v208 = v197 |> string.starts_with("\\")
                                v208 == False
                            }
                            False -> False
                        }
                    let v214 =
                        case v210 {
                            True -> {
                                let v212 = v197 |> string.contains(":")
                                v212 == False
                            }
                            False -> False
                        }
                    let v352 =
                        case v214 {
                            True -> {
                                let v215 = v197 == ""
                                let v219 =
                                    case v215 {
                                        True -> Uh3Nil
                                        False -> {
                                            split_list_2(".", v197)
                                        }
                                    }
                                let v221 = method4(v219, Uh3Nil)
                                let v227 =
                                    case v221  {
                                        Uh3Cons(v222, v223) -> {
                                            v222 |> string.lowercase
                                        }
                                        Uh3Nil -> {
                                            ""
                                        }
                                    }
                                let v228 = v227 == "jpg"
                                let v249 =
                                    case v228 {
                                        True -> {
                                            "image/jpeg"
                                        }
                                        False -> {
                                            let v230 = v227 == "jpeg"
                                            case v230 {
                                                True -> {
                                                    "image/jpeg"
                                                }
                                                False -> {
                                                    let v232 = v227 == "png"
                                                    case v232 {
                                                        True -> {
                                                            "image/png"
                                                        }
                                                        False -> {
                                                            let v234 = v227 == "gif"
                                                            case v234 {
                                                                True -> {
                                                                    "image/gif"
                                                                }
                                                                False -> {
                                                                    let v236 = v227 == "webp"
                                                                    case v236 {
                                                                        True -> {
                                                                            "image/webp"
                                                                        }
                                                                        False -> {
                                                                            let v238 = v227 == "mp4"
                                                                            case v238 {
                                                                                True -> {
                                                                                    "video/mp4"
                                                                                }
                                                                                False -> {
                                                                                    let v240 = v227 == "webm"
                                                                                    case v240 {
                                                                                        True -> {
                                                                                            "video/webm"
                                                                                        }
                                                                                        False -> {
                                                                                            "application/octet-stream"
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                let v250 = { v13 } <> { "/" }
                                let v251 = { v250 } <> { v197 }
                                let v252 = erlang_term_coerce(v251)
                                let v254 = atom.create("unicode")
                                let v256 = atom.create("characters_to_list")
                                let v257 = []
                                let v258 = [v252, ..v257]
                                let v259 = erlang_term_apply(v254, v256, v258)
                                let v261 = atom.create("file")
                                let v263 = atom.create("read_file")
                                let v264 = []
                                let v265 = [v259, ..v264]
                                let v266 = erlang_term_apply(v261, v263, v265)
                                let v267 = erlang_term_coerce(1)
                                let v268 = "erlang"
                                let v269 = atom.create(v268)
                                let v270 = "element"
                                let v271 = atom.create(v270)
                                let v272 = []
                                let v273 = [v266, ..v272]
                                let v274 = [v267, ..v273]
                                let v275 = erlang_term_apply(v269, v271, v274)
                                let v277 = atom.create("ok")
                                let v278 = erlang_term_coerce(v277)
                                let v279 = v275 == v278
                                let v290 =
                                    case v279 {
                                        True -> {
                                            let v280 = erlang_term_coerce(2)
                                            let v281 = atom.create(v268)
                                            let v282 = atom.create(v270)
                                            let v283 = []
                                            let v284 = [v266, ..v283]
                                            let v285 = [v280, ..v284]
                                            let v286 = erlang_term_apply(v281, v282, v285)
                                            let v287 = erlang_term_coerce(v286)
                                            Us2Some(v287)
                                        }
                                        False -> Us2None
                                    }
                                case v290  {
                                    Us2None -> {
                                        let v311 = int.to_string(404)
                                        let v312 = { "HTTP/1.1 " } <> { v311 }
                                        let v313 = { v312 } <> { " " }
                                        let v314 = { v313 } <> { "Not Found" }
                                        let v316 = erlang_term_coerce("not found")
                                        let v317 = atom.create(v268)
                                        let v319 = atom.create("byte_size")
                                        let v320 = []
                                        let v321 = [v316, ..v320]
                                        let v322 = erlang_term_apply(v317, v319, v321)
                                        let v323 = erlang_term_coerce(v322)
                                        let v324 = int.to_string(v323)
                                        let v325 = { "\r\nContent-Length: " } <> { v324 }
                                        let v326 = { "\r\nContent-Type: text/plain; charset=utf-8" } <> { v325 }
                                        let v327 = { v326 } <> { "\r\nConnection: close\r\n\r\n" }
                                        let v328 = { v314 } <> { v327 }
                                        let v329 = { v328 } <> { "not found" }
                                        v329
                                    }
                                    Us2Some(v291) -> {
                                        let v292 = int.to_string(200)
                                        let v293 = { "HTTP/1.1 " } <> { v292 }
                                        let v294 = { v293 } <> { " " }
                                        let v295 = { v294 } <> { "OK" }
                                        let v296 = erlang_term_coerce(v291)
                                        let v297 = atom.create(v268)
                                        let v299 = atom.create("byte_size")
                                        let v300 = []
                                        let v301 = [v296, ..v300]
                                        let v302 = erlang_term_apply(v297, v299, v301)
                                        let v303 = erlang_term_coerce(v302)
                                        let v304 = int.to_string(v303)
                                        let v305 = { "\r\nContent-Length: " } <> { v304 }
                                        let v306 = { "\r\nContent-Type: " } <> { v249 }
                                        let v307 = { v306 } <> { v305 }
                                        let v308 = { v307 } <> { "\r\nConnection: close\r\n\r\n" }
                                        let v309 = { v295 } <> { v308 }
                                        let v310 = { v309 } <> { v291 }
                                        v310
                                    }
                                }
                            }
                            False -> {
                                let v332 = int.to_string(404)
                                let v333 = { "HTTP/1.1 " } <> { v332 }
                                let v334 = { v333 } <> { " " }
                                let v335 = { v334 } <> { "Not Found" }
                                let v337 = erlang_term_coerce("not found")
                                let v339 = atom.create("erlang")
                                let v341 = atom.create("byte_size")
                                let v342 = []
                                let v343 = [v337, ..v342]
                                let v344 = erlang_term_apply(v339, v341, v343)
                                let v345 = erlang_term_coerce(v344)
                                let v346 = int.to_string(v345)
                                let v347 = { "\r\nContent-Length: " } <> { v346 }
                                let v348 = { "\r\nContent-Type: text/plain; charset=utf-8" } <> { v347 }
                                let v349 = { v348 } <> { "\r\nConnection: close\r\n\r\n" }
                                let v350 = { v335 } <> { v349 }
                                let v351 = { v350 } <> { "not found" }
                                v351
                            }
                        }
                    #(v352, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
                }
                False -> replied_530(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15)
            }
        }
    }
}

pub fn closure145(capt: #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String, String)) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    fn (v15) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14) = capt
        feed_or_api_450(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15)
    }
}

pub fn closure144(capt: #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    fn (v14) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13) = capt
        closure145(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14))
    }
}

pub fn closure143(capt: Nil) -> fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13) = dom
        closure144(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13))
    }
}

pub fn method691(v0: String, v1: Uh29, v2: Uh38) -> Uh38 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method691(v0, v4, v2)
            let v6 = erlang_term_coerce(v0)
            let v8 = atom.create("filename")
            let v10 = atom.create("dirname")
            let v11 = []
            let v12 = [v6, ..v11]
            let v13 = erlang_term_apply(v8, v10, v12)
            let v15 = atom.create("unicode")
            let v17 = atom.create("characters_to_binary")
            let v18 = []
            let v19 = [v13, ..v18]
            let v20 = erlang_term_apply(v15, v17, v19)
            let v21 = erlang_term_coerce(v20)
            let v22 = { v21 } <> { "/" }
            let v23 = erlang_term_coerce(v3)
            let v24 = { v22 } <> { v23 }
            let v25 = { v24 } <> { ".etf" }
            let v26 = erlang_term_coerce(v25)
            let v27 = "filelib"
            let v28 = atom.create(v27)
            let v29 = "last_modified"
            let v30 = atom.create(v29)
            let v31 = []
            let v32 = [v26, ..v31]
            let v33 = erlang_term_apply(v28, v30, v32)
            let v34 = erlang_term_coerce(v24)
            let v35 = atom.create(v27)
            let v36 = atom.create(v29)
            let v37 = []
            let v38 = [v34, ..v37]
            let v39 = erlang_term_apply(v35, v36, v38)
            let v40 = "erlang"
            let v41 = atom.create(v40)
            let v43 = atom.create(">")
            let v44 = []
            let v45 = [v39, ..v44]
            let v46 = [v33, ..v45]
            let v47 = erlang_term_apply(v41, v43, v46)
            let v48 = erlang_term_coerce(v47)
            let v167 =
                case v48 {
                    True -> {
                        let v49 = erlang_term_coerce(v25)
                        let v50 = "file"
                        let v51 = atom.create(v50)
                        let v53 = atom.create("read_file")
                        let v54 = []
                        let v55 = [v49, ..v54]
                        let v56 = erlang_term_apply(v51, v53, v55)
                        let v57 = erlang_term_coerce(1)
                        let v58 = atom.create(v40)
                        let v59 = "element"
                        let v60 = atom.create(v59)
                        let v61 = []
                        let v62 = [v56, ..v61]
                        let v63 = [v57, ..v62]
                        let v64 = erlang_term_apply(v58, v60, v63)
                        let v66 = atom.create("ok")
                        let v67 = erlang_term_coerce(v66)
                        let v68 = v64 == v67
                        let v84 =
                            case v68 {
                                True -> {
                                    let v69 = erlang_term_coerce(2)
                                    let v70 = atom.create(v40)
                                    let v71 = atom.create(v59)
                                    let v72 = []
                                    let v73 = [v56, ..v72]
                                    let v74 = [v69, ..v73]
                                    let v75 = erlang_term_apply(v70, v71, v74)
                                    let v76 = atom.create(v40)
                                    let v78 = atom.create("binary_to_term")
                                    let v79 = []
                                    let v80 = [v75, ..v79]
                                    let v81 = erlang_term_apply(v76, v78, v80)
                                    Us110Some(v81)
                                }
                                False -> Us110None
                            }
                        case v84  {
                            Us110None -> {
                                let v86 = spiral_fs_read_file(v24)
                                let v87 = method370()
                                let v88 = method371()
                                let v89 = case v86 { Ok(x) -> v87(x) Error(x) -> v88(x) }
                                let v102 =
                                    case v89  {
                                        Us80Error(v99) -> panic as "file_system.read_all_text: file:read_file failed"
                                        Us80Ok(v90) -> {
                                            let v91 = bit_array.to_string(v90)
                                            let v92 = method258()
                                            let v93 = method259()
                                            let v94 = case v91 { Ok(x) -> v92(x) Error(x) -> v93(x) }
                                            case v94  {
                                                Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                                Us56Ok(v95) -> v95
                                            }
                                        }
                                    }
                                let v103 = erlang_term_coerce(v102)
                                let v105 = atom.create("json")
                                let v107 = atom.create("decode")
                                let v108 = []
                                let v109 = [v103, ..v108]
                                let v110 = erlang_term_apply(v105, v107, v109)
                                let v111 = erlang_term_coerce(v25)
                                let v112 = atom.create(v40)
                                let v114 = atom.create("term_to_binary")
                                let v115 = []
                                let v116 = [v110, ..v115]
                                let v117 = erlang_term_apply(v112, v114, v116)
                                let v118 = atom.create(v50)
                                let v120 = atom.create("write_file")
                                let v121 = []
                                let v122 = [v117, ..v121]
                                let v123 = [v111, ..v122]
                                let _v124 = erlang_term_apply(v118, v120, v123)
                                v110
                            }
                            Us110Some(v85) -> v85
                        }
                    }
                    False -> {
                        let v127 = spiral_fs_read_file(v24)
                        let v128 = method370()
                        let v129 = method371()
                        let v130 = case v127 { Ok(x) -> v128(x) Error(x) -> v129(x) }
                        let v143 =
                            case v130  {
                                Us80Error(v140) -> panic as "file_system.read_all_text: file:read_file failed"
                                Us80Ok(v131) -> {
                                    let v132 = bit_array.to_string(v131)
                                    let v133 = method258()
                                    let v134 = method259()
                                    let v135 = case v132 { Ok(x) -> v133(x) Error(x) -> v134(x) }
                                    case v135  {
                                        Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                        Us56Ok(v136) -> v136
                                    }
                                }
                            }
                        let v144 = erlang_term_coerce(v143)
                        let v146 = atom.create("json")
                        let v148 = atom.create("decode")
                        let v149 = []
                        let v150 = [v144, ..v149]
                        let v151 = erlang_term_apply(v146, v148, v150)
                        let v152 = erlang_term_coerce(v25)
                        let v153 = atom.create(v40)
                        let v155 = atom.create("term_to_binary")
                        let v156 = []
                        let v157 = [v151, ..v156]
                        let v158 = erlang_term_apply(v153, v155, v157)
                        let v160 = atom.create("file")
                        let v162 = atom.create("write_file")
                        let v163 = []
                        let v164 = [v158, ..v163]
                        let v165 = [v152, ..v164]
                        let _v166 = erlang_term_apply(v160, v162, v165)
                        v151
                    }
                }
            let v168 = []
            let v169 = erlang_term_coerce(v168)
            let v171 = erlang_term_coerce("users")
            let v172 = erlang_term_coerce(v169)
            let v174 = atom.create("maps")
            let v176 = atom.create("get")
            let v177 = []
            let v178 = [v172, ..v177]
            let v179 = [v167, ..v178]
            let v180 = [v171, ..v179]
            let v181 = erlang_term_apply(v174, v176, v180)
            let v182 = erlang_term_coerce(v181)
            let v184 = atom.create("lists")
            let v186 = atom.create("reverse")
            let v187 = []
            let v188 = [v182, ..v187]
            let v189 = erlang_term_apply(v184, v186, v188)
            let v191 = items_from_301(v189, Uh29Nil)
            Uh38Cons(v191, v5)
        }
        Uh29Nil -> v2
    }
}

pub fn included_users_690(v0: String, v1: Dynamic) -> Uh29 {
    let v2 = []
    let v3 = erlang_term_coerce(v2)
    let v5 = erlang_term_coerce("include")
    let v6 = erlang_term_coerce(v3)
    let v7 = "maps"
    let v8 = atom.create(v7)
    let v9 = "get"
    let v10 = atom.create(v9)
    let v11 = []
    let v12 = [v6, ..v11]
    let v13 = [v1, ..v12]
    let v14 = [v5, ..v13]
    let v15 = erlang_term_apply(v8, v10, v14)
    let v16 = erlang_term_coerce(v15)
    let v17 = "lists"
    let v18 = atom.create(v17)
    let v19 = "reverse"
    let v20 = atom.create(v19)
    let v21 = []
    let v22 = [v16, ..v21]
    let v23 = erlang_term_apply(v18, v20, v22)
    let v25 = items_from_301(v23, Uh29Nil)
    let v27 = method691(v0, v25, Uh38Nil)
    let v28 = []
    let v29 = erlang_term_coerce(v28)
    let v31 = erlang_term_coerce("users")
    let v32 = erlang_term_coerce(v29)
    let v33 = atom.create(v7)
    let v34 = atom.create(v9)
    let v35 = []
    let v36 = [v32, ..v35]
    let v37 = [v1, ..v36]
    let v38 = [v31, ..v37]
    let v39 = erlang_term_apply(v33, v34, v38)
    let v40 = erlang_term_coerce(v39)
    let v41 = atom.create(v17)
    let v42 = atom.create(v19)
    let v43 = []
    let v44 = [v40, ..v43]
    let v45 = erlang_term_apply(v41, v42, v44)
    let v47 = items_from_301(v45, Uh29Nil)
    let v49 = method590(v27, Uh29Nil)
    method462(v47, v49)
}

pub fn method693(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method693(v3, v1)
            let v6 = erlang_term_coerce("")
            let v8 = erlang_term_coerce("created_at")
            let v9 = erlang_term_coerce(v6)
            let v11 = atom.create("maps")
            let v13 = atom.create("get")
            let v14 = []
            let v15 = [v9, ..v14]
            let v16 = [v2, ..v15]
            let v17 = [v8, ..v16]
            let v18 = erlang_term_apply(v11, v13, v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = erlang_term_coerce(v19)
            let v21 = spiral_string_slice(v20, 0, 18)
            Uh3Cons(v21, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method694(v0: Uh3, v1: String) -> String {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = erlang_term_coerce(v1)
            let v5 = erlang_term_coerce(v2)
            let v7 = atom.create("erlang")
            let v9 = atom.create(">=")
            let v10 = []
            let v11 = [v5, ..v10]
            let v12 = [v4, ..v11]
            let v13 = erlang_term_apply(v7, v9, v12)
            let v14 = erlang_term_coerce(v13)
            let v15 =
                case v14 {
                    True -> v1
                    False -> v2
                }
            method694(v3, v15)
        }
        Uh3Nil -> v1
    }
}

pub fn method696(v0: Dynamic, v1: Uh29, v2: dict.Dict(String, Dynamic)) -> dict.Dict(String, Dynamic) {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = ""
            let v6 = erlang_term_coerce(v5)
            let v7 = "id"
            let v8 = erlang_term_coerce(v7)
            let v9 = erlang_term_coerce(v6)
            let v10 = "maps"
            let v11 = atom.create(v10)
            let v12 = "get"
            let v13 = atom.create(v12)
            let v14 = []
            let v15 = [v9, ..v14]
            let v16 = [v3, ..v15]
            let v17 = [v8, ..v16]
            let v18 = erlang_term_apply(v11, v13, v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = "erlang"
            let v21 = atom.create(v20)
            let v23 = atom.create("is_binary")
            let v24 = []
            let v25 = [v19, ..v24]
            let v26 = erlang_term_apply(v21, v23, v25)
            let v27 = erlang_term_coerce(v26)
            let v36 =
                case v27 {
                    True -> {
                        erlang_term_coerce(v19)
                    }
                    False -> {
                        let v29 = atom.create(v20)
                        let v31 = atom.create("integer_to_binary")
                        let v32 = []
                        let v33 = [v19, ..v32]
                        let v34 = erlang_term_apply(v29, v31, v33)
                        erlang_term_coerce(v34)
                    }
                }
            let v37 = erlang_term_coerce(v5)
            let v38 = erlang_term_coerce(v7)
            let v39 = erlang_term_coerce(v37)
            let v40 = atom.create(v10)
            let v41 = atom.create(v12)
            let v42 = []
            let v43 = [v39, ..v42]
            let v44 = [v0, ..v43]
            let v45 = [v38, ..v44]
            let v46 = erlang_term_apply(v40, v41, v45)
            let v47 = erlang_term_coerce(v46)
            let v49 = erlang_term_coerce("author_id")
            let v50 = erlang_term_coerce(v47)
            let v51 = atom.create(v10)
            let v53 = atom.create("put")
            let v54 = []
            let v55 = [v3, ..v54]
            let v56 = [v50, ..v55]
            let v57 = [v49, ..v56]
            let v58 = erlang_term_apply(v51, v53, v57)
            let v59 = dict.insert(v2, v36, v58)
            method696(v0, v4, v59)
        }
        Uh29Nil -> v2
    }
}

pub fn with_posts_695(v0: Dynamic, v1: dict.Dict(String, Dynamic)) -> dict.Dict(String, Dynamic) {
    let v2 = []
    let v3 = erlang_term_coerce(v2)
    let v5 = erlang_term_coerce("posts")
    let v6 = erlang_term_coerce(v3)
    let v8 = atom.create("maps")
    let v10 = atom.create("get")
    let v11 = []
    let v12 = [v6, ..v11]
    let v13 = [v0, ..v12]
    let v14 = [v5, ..v13]
    let v15 = erlang_term_apply(v8, v10, v14)
    let v16 = erlang_term_coerce(v15)
    let v18 = atom.create("lists")
    let v20 = atom.create("reverse")
    let v21 = []
    let v22 = [v16, ..v21]
    let v23 = erlang_term_apply(v18, v20, v22)
    let v25 = items_from_301(v23, Uh29Nil)
    method696(v0, v25, v1)
}
