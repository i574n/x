import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Uh36, Uh13Nil, Uh29Nil, Uh36Nil, Uh39Nil, Uh3Cons, Uh3Nil, Uh41Nil, Uh44Text, Uh45Cons, Uh45Nil, Uh49Cons, Uh49Nil, Uh50Cons, Uh50Nil, Uh51Cons, Uh51Nil, Us103H1, Us104Heading, Us107None, Us107Some, Us108None, Us108Some, Us2None, Us2Some, Us3None, Us3Some}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, method4, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part12.{items_from_301}
import xsim_frames/part25.{first_value_465, method452, method464, method466, method467, method468, request_of_451}
import xsim_frames/part26.{closure148, closure150, method469, method471, method478, method479, page_from_475, resumed_from_473}
import xsim_frames/part27.{blocks_html_485, concat_532, consumed_483, element_499, escape_493, joined_508, markup_text_502, method480, trusted_488}
import xsim_frames/part28.{header_value_535, method530, method533, method534}
import xsim_frames/part37.{replied_537}

pub fn feed_or_api_450(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh36, v13: String, v14: String, v15: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String) {
    let #(_v16, v17, v18, v19, _v20) = request_of_451(v15)
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
            let v69 = "get"
            let v70 = atom.create(v69)
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
            let v94 = first_value_465("d", v93)
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
                case v104  {
                    Uh3Cons(v105, v106) -> v105
                    Uh3Nil -> {
                        "down"
                    }
                }
            let v114 =
                case v89 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2("&", v18)
                    }
                }
            let v115 = first_value_465("f", v114)
            let v116 = v115 == ""
            let v118 =
                case v116 {
                    True -> {
                        ""
                    }
                    False -> v115
                }
            let v119 = v118 == ""
            let v123 =
                case v119 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2(".", v118)
                    }
                }
            let v125 = method466(v123, Uh3Nil)
            let v130 =
                case v89 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2("&", v18)
                    }
                }
            let v131 = first_value_465("c", v130)
            let v132 = v131 == ""
            let v134 =
                case v132 {
                    True -> {
                        ""
                    }
                    False -> v131
                }
            let v135 = v134 == ""
            let v139 =
                case v135 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2(".", v134)
                    }
                }
            let v141 = method466(v139, Uh3Nil)
            let v143 = method467(v141, Uh13Nil)
            let v144 = method468(v87, v125)
            let #(v146, v147) =
                case v144 {
                    True -> #(v125, v143)
                    False -> {
                        #(v87, Uh13Nil)
                    }
                }
            let v148 = "from"
            let v152 =
                case v89 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2("&", v18)
                    }
                }
            let v153 = first_value_465(v148, v152)
            let v154 = v153 == ""
            let v156 =
                case v154 {
                    True -> {
                        ""
                    }
                    False -> v153
                }
            let v157 = v156 == ""
            let v161 =
                case v157 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2(".", v156)
                    }
                }
            let v163 = method466(v161, Uh3Nil)
            let v168 =
                case v163  {
                    Uh3Cons(v164, v165) -> v164
                    Uh3Nil -> {
                        ""
                    }
                }
            let #(_v177, v178) =
                case v147  {
                    Uh13Nil -> {
                        let v169 = v168 == ""
                        let v171 =
                            case v169 {
                                True -> True
                                False -> {
                                    v109 == "up"
                                }
                            }
                        case v171 {
                            True -> #(v146, v147)
                            False -> {
                                let v172 = { v168 } <> { "T9" }
                                let v174 = method469(v172, v60, Uh13Nil)
                                #(v146, v174)
                            }
                        }
                    }
                    _ -> #(v146, v147)
                }
            let v179 = v109 == "up"
            let v182 =
                case v179 {
                    True -> {
                        method471(v60, Uh36Nil)
                    }
                    False -> v60
                }
            let v185 =
                case v179 {
                    True -> closure148(Nil)
                    False -> closure150(Nil)
                }
            let v186 = resumed_from_473(v182, v178)
            let #(v188, v189) = page_from_475(v185, 50, v186)
            let v191 = method478(v188, Uh39Nil)
            let v193 = method479(v191, Uh39Nil)
            let v195 = method480(v193, Uh41Nil)
            let v196 = consumed_483(v182, v189)
            let v199 = Uh44Text("Following")
            let v201 = Uh45Cons(v199, Uh45Nil)
            let v202 = Us104Heading(Us103H1, v201)
            let v204 = Uh49Cons(v202, Uh49Nil)
            let v205 = blocks_html_485(v204)
            let v209 = trusted_488("body{background:rgb(21,32,43);color:rgb(231,233,234);font-family:system-ui,sans-serif;max-width:640px;margin:0 auto;padding:1em}img,video{max-width:100%;height:auto;border-radius:16px;margin:.5em 0;display:block}video.vid{width:100%;max-height:600px;background:#000;object-fit:contain}article{border-bottom:1px solid rgb(47,51,54);padding:.75em .2em}article:hover{background:rgba(255,255,255,.03)}article strong{color:rgb(231,233,234);font-weight:700}p.counts{color:rgb(113,118,123);font-size:.9em;margin:.3em 0}blockquote.quoted{color:rgb(139,152,165)}.repost{opacity:.6;border-left:3px solid #999;padding-left:.6em}.quoted{border-left:3px solid #48c;margin:.3em 0 .3em .6em;padding-left:.6em}.nav{position:sticky;top:0;z-index:9;background:rgb(21,32,43);padding:.5em 0;border-bottom:1px solid rgb(47,51,54)}")
            let v210 = element_499("style", Uh50Nil, v209)
            let v214 = trusted_488("(function(){var io=new IntersectionObserver(function(es){es.forEach(function(e){var v=e.target;if(e.isIntersecting&&e.intersectionRatio>=.5){v.play().catch(function(){})}else{v.pause()}})},{threshold:[0,.5,1]});function scan(){document.querySelectorAll('video.vid').forEach(function(v){if(!v.dataset.io){v.dataset.io='1';io.observe(v)}})}scan();new MutationObserver(scan).observe(document.body,{childList:!0,subtree:!0})})()")
            let v215 = element_499("script", Uh50Nil, v214)
            let v217 = "class"
            let v218 = "nav"
            let v221 = "/timeline"
            let v223 = Uh50Cons("action", v221, Uh50Nil)
            let v224 = Uh50Cons("method", v69, v223)
            let v225 = Uh50Cons(v217, v218, v224)
            let v227 = "type"
            let v231 = Uh50Cons("name", v148, Uh50Nil)
            let v232 = Uh50Cons(v227, "date", v231)
            let v233 = ""
            let v234 = trusted_488(v233)
            let v235 = element_499("input", v232, v234)
            let v239 = Uh50Cons(v227, "submit", Uh50Nil)
            let v241 = escape_493("Go to date")
            let v242 = element_499("button", v239, v241)
            let v243 = joined_508(v235, v242)
            let v244 = element_499("form", v225, v243)
            let v246 = Uh50Cons(v217, v218, Uh50Nil)
            let v247 = "a"
            let v248 = "dir"
            let v249 = "href"
            let v251 = Uh50Cons(v249, v221, Uh50Nil)
            let v252 = Uh50Cons(v217, v248, v251)
            let v254 = escape_493("Newest first")
            let v255 = element_499(v247, v252, v254)
            let v258 = Uh50Cons(v249, "/timeline?d=up", Uh50Nil)
            let v259 = Uh50Cons(v217, v248, v258)
            let v261 = escape_493("Oldest first")
            let v262 = element_499(v247, v259, v261)
            let v263 = joined_508(v255, v262)
            let v264 = element_499(v218, v246, v263)
            let v266 = method530(v195, Uh51Nil)
            let v267 = Uh51Cons(v205, v266)
            let v268 = Uh51Cons(v264, v267)
            let v269 = Uh51Cons(v244, v268)
            let v270 = Uh51Cons(v215, v269)
            let v271 = Uh51Cons(v210, v270)
            let v272 = concat_532(v271)
            let v273 = markup_text_502(v272)
            let v274 = method533(v87, v233)
            let v275 = { "f=" } <> { v274 }
            let v276 = { v275 } <> { "&c=" }
            let v278 = method534(v196, Uh3Nil)
            let v279 = method533(v278, v233)
            let v280 = { v276 } <> { v279 }
            let v281 = v109 == "down"
            let v283 =
                case v281 {
                    True -> v233
                    False -> {
                        let v282 = { "&d=" } <> { v109 }
                        v282
                    }
                }
            let v287 =
                case v195  {
                    Uh41Nil -> v233
                    _ -> {
                        let v284 = { "\n<a href=\"/timeline?" } <> { v280 }
                        let v285 = { v284 } <> { v283 }
                        let v286 = { v285 } <> { "\">next</a>" }
                        v286
                    }
                }
            let v288 = { v273 } <> { v287 }
            let v289 = { v288 } <> { "\n<script>(function(){var busy=!1;function last(){var a=document.querySelectorAll('a[href^=\"/timeline?\"]');return a.length?a[a.length-1]:null}function more(){var a=last();if(!a||busy)return;busy=!0;fetch(a.getAttribute('href')).then(function(r){return r.text()}).then(function(h){var d=new DOMParser().parseFromString(h,'text/html');d.querySelectorAll('article.post').forEach(function(x){a.parentNode.insertBefore(document.importNode(x,!0),a)});var n=d.querySelector('a[href^=\"/timeline?\"]');if(n){a.setAttribute('href',n.getAttribute('href'));busy=!1;check()}else a.remove()}).catch(function(){busy=!1})}function check(){var a=last();if(a&&a.getBoundingClientRect().top<innerHeight*2)more()}addEventListener('scroll',check,{passive:!0});check()})()</script>" }
            let v290 = int.to_string(200)
            let v291 = { "HTTP/1.1 " } <> { v290 }
            let v292 = { v291 } <> { " " }
            let v293 = { v292 } <> { "OK" }
            let v294 = erlang_term_coerce(v289)
            let v296 = atom.create("erlang")
            let v298 = atom.create("byte_size")
            let v299 = []
            let v300 = [v294, ..v299]
            let v301 = erlang_term_apply(v296, v298, v300)
            let v302 = erlang_term_coerce(v301)
            let v303 = int.to_string(v302)
            let v304 = { "\r\nContent-Length: " } <> { v303 }
            let v305 = { "\r\nContent-Type: text/html; charset=utf-8" } <> { v304 }
            let v306 = { v305 } <> { "\r\nConnection: close\r\n\r\n" }
            let v307 = { v293 } <> { v306 }
            let v308 = { v307 } <> { v289 }
            #(v308, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61)
        }
        False -> {
            let v310 = v17 |> string.starts_with("/media/")
            case v310 {
                True -> {
                    let v312 = header_value_535("range", v19)
                    let v313 = spiral_string_length(v17)
                    let v314 = spiral_wrap_signed(v313 - 7, 32)
                    let v315 = spiral_wrap_signed(7 + v314, 32)
                    let v316 = spiral_wrap_signed(v315 - 1, 32)
                    let v317 = spiral_string_slice(v17, 7, v316)
                    let v318 = v317 != ""
                    let v322 =
                        case v318 {
                            True -> {
                                let v320 = v317 |> string.contains("..")
                                v320 == False
                            }
                            False -> False
                        }
                    let v326 =
                        case v322 {
                            True -> {
                                let v324 = v317 |> string.starts_with("/")
                                v324 == False
                            }
                            False -> False
                        }
                    let v330 =
                        case v326 {
                            True -> {
                                let v328 = v317 |> string.starts_with("\\")
                                v328 == False
                            }
                            False -> False
                        }
                    let v334 =
                        case v330 {
                            True -> {
                                let v332 = v317 |> string.contains(":")
                                v332 == False
                            }
                            False -> False
                        }
                    let v749 =
                        case v334 {
                            True -> {
                                let v335 = v317 == ""
                                let v339 =
                                    case v335 {
                                        True -> Uh3Nil
                                        False -> {
                                            split_list_2(".", v317)
                                        }
                                    }
                                let v341 = method4(v339, Uh3Nil)
                                let v347 =
                                    case v341  {
                                        Uh3Cons(v342, v343) -> {
                                            v342 |> string.lowercase
                                        }
                                        Uh3Nil -> {
                                            ""
                                        }
                                    }
                                let v348 = v347 == "jpg"
                                let v350 =
                                    case v348 {
                                        True -> True
                                        False -> {
                                            v347 == "jpeg"
                                        }
                                    }
                                let v368 =
                                    case v350 {
                                        True -> {
                                            "image/jpeg"
                                        }
                                        False -> {
                                            let v352 = v347 == "png"
                                            case v352 {
                                                True -> {
                                                    "image/png"
                                                }
                                                False -> {
                                                    let v354 = v347 == "gif"
                                                    case v354 {
                                                        True -> {
                                                            "image/gif"
                                                        }
                                                        False -> {
                                                            let v356 = v347 == "webp"
                                                            case v356 {
                                                                True -> {
                                                                    "image/webp"
                                                                }
                                                                False -> {
                                                                    let v358 = v347 == "mp4"
                                                                    case v358 {
                                                                        True -> {
                                                                            "video/mp4"
                                                                        }
                                                                        False -> {
                                                                            let v360 = v347 == "webm"
                                                                            case v360 {
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
                                let v369 = { v13 } <> { "/" }
                                let v370 = { v369 } <> { v317 }
                                let v371 = erlang_term_coerce(v370)
                                let v372 = "unicode"
                                let v373 = atom.create(v372)
                                let v374 = "characters_to_list"
                                let v375 = atom.create(v374)
                                let v376 = []
                                let v377 = [v371, ..v376]
                                let v378 = erlang_term_apply(v373, v375, v377)
                                let v380 = atom.create("filelib")
                                let v382 = atom.create("file_size")
                                let v383 = []
                                let v384 = [v378, ..v383]
                                let v385 = erlang_term_apply(v380, v382, v384)
                                let v386 = "erlang"
                                let v387 = atom.create(v386)
                                let v389 = atom.create("is_binary")
                                let v390 = []
                                let v391 = [v385, ..v390]
                                let v392 = erlang_term_apply(v387, v389, v391)
                                let v393 = erlang_term_coerce(v392)
                                let v402 =
                                    case v393 {
                                        True -> {
                                            erlang_term_coerce(v385)
                                        }
                                        False -> {
                                            let v395 = atom.create(v386)
                                            let v397 = atom.create("integer_to_binary")
                                            let v398 = []
                                            let v399 = [v385, ..v398]
                                            let v400 = erlang_term_apply(v395, v397, v399)
                                            erlang_term_coerce(v400)
                                        }
                                    }
                                let v403 = count_of_text_10(v402)
                                let v406 =
                                    case v403  {
                                        Us3None -> 0
                                        Us3Some(v404) -> v404
                                    }
                                let v407 = v406 <= 0
                                case v407 {
                                    True -> {
                                        let v408 = int.to_string(404)
                                        let v409 = { "HTTP/1.1 " } <> { v408 }
                                        let v410 = { v409 } <> { " " }
                                        let v411 = { v410 } <> { "Not Found" }
                                        let v413 = erlang_term_coerce("not found")
                                        let v414 = atom.create(v386)
                                        let v416 = atom.create("byte_size")
                                        let v417 = []
                                        let v418 = [v413, ..v417]
                                        let v419 = erlang_term_apply(v414, v416, v418)
                                        let v420 = erlang_term_coerce(v419)
                                        let v421 = int.to_string(v420)
                                        let v422 = { "\r\nContent-Length: " } <> { v421 }
                                        let v423 = { "\r\nContent-Type: text/plain; charset=utf-8" } <> { v422 }
                                        let v424 = { v423 } <> { "\r\nConnection: close\r\n\r\n" }
                                        let v425 = { v411 } <> { v424 }
                                        let v426 = { v425 } <> { "not found" }
                                        v426
                                    }
                                    False -> {
                                        let v427 = v312 == ""
                                        let v502 =
                                            case v427 {
                                                True -> Us107None
                                                False -> {
                                                    let v430 = v312 |> string.starts_with("bytes=")
                                                    let v431 = v430 == False
                                                    case v431 {
                                                        True -> Us107None
                                                        False -> {
                                                            let v433 = spiral_string_length(v312)
                                                            let v434 = spiral_wrap_signed(v433 - 6, 32)
                                                            let v435 = spiral_wrap_signed(6 + v434, 32)
                                                            let v436 = spiral_wrap_signed(v435 - 1, 32)
                                                            let v437 = spiral_string_slice(v312, 6, v436)
                                                            let v439 = v437 |> string.contains(",")
                                                            case v439 {
                                                                True -> Us107None
                                                                False -> {
                                                                    let v441 = v437 == ""
                                                                    let v445 =
                                                                        case v441 {
                                                                            True -> Uh3Nil
                                                                            False -> {
                                                                                split_list_2("-", v437)
                                                                            }
                                                                        }
                                                                    case v445  {
                                                                        Uh3Cons(v446, v447) -> {
                                                                            case v447  {
                                                                                Uh3Cons(v448, v449) -> {
                                                                                    case v449  {
                                                                                        Uh3Nil -> {
                                                                                            let v450 = v446 == ""
                                                                                            let v452 =
                                                                                                case v450 {
                                                                                                    True -> {
                                                                                                        v448 == ""
                                                                                                    }
                                                                                                    False -> False
                                                                                                }
                                                                                            case v452 {
                                                                                                True -> Us107None
                                                                                                False -> {
                                                                                                    case v450 {
                                                                                                        True -> {
                                                                                                            let v454 = count_of_text_10(v448)
                                                                                                            case v454  {
                                                                                                                Us3None -> Us107None
                                                                                                                Us3Some(v455) -> {
                                                                                                                    let v456 = spiral_wrap_signed(v406 - v455, 32)
                                                                                                                    let v457 = v456 < 0
                                                                                                                    let v458 =
                                                                                                                        case v457 {
                                                                                                                            True -> 0
                                                                                                                            False -> v456
                                                                                                                        }
                                                                                                                    let v459 = spiral_wrap_signed(v406 - 1, 32)
                                                                                                                    Us107Some(v458, v459)
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                        False -> {
                                                                                                            let v464 = v448 == ""
                                                                                                            case v464 {
                                                                                                                True -> {
                                                                                                                    let v465 = count_of_text_10(v446)
                                                                                                                    case v465  {
                                                                                                                        Us3None -> Us107None
                                                                                                                        Us3Some(v466) -> {
                                                                                                                            let v467 = v466 < v406
                                                                                                                            case v467 {
                                                                                                                                True -> {
                                                                                                                                    let v468 = spiral_wrap_signed(v406 - 1, 32)
                                                                                                                                    Us107Some(v466, v468)
                                                                                                                                }
                                                                                                                                False -> Us107None
                                                                                                                            }
                                                                                                                        }
                                                                                                                    }
                                                                                                                }
                                                                                                                False -> {
                                                                                                                    let v475 = count_of_text_10(v446)
                                                                                                                    case v475  {
                                                                                                                        Us3None -> Us107None
                                                                                                                        Us3Some(v477) -> {
                                                                                                                            let v478 = count_of_text_10(v448)
                                                                                                                            case v478  {
                                                                                                                                Us3None -> Us107None
                                                                                                                                Us3Some(v479) -> {
                                                                                                                                    let v480 = v477 <= v479
                                                                                                                                    let v482 =
                                                                                                                                        case v480 {
                                                                                                                                            True -> {
                                                                                                                                                v479 < v406
                                                                                                                                            }
                                                                                                                                            False -> False
                                                                                                                                        }
                                                                                                                                    case v482 {
                                                                                                                                        True -> Us107Some(v477, v479)
                                                                                                                                        False -> Us107None
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
                                                                                        _ -> Us107None
                                                                                    }
                                                                                }
                                                                                _ -> Us107None
                                                                            }
                                                                        }
                                                                        _ -> Us107None
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        case v502  {
                                            Us107None -> {
                                                let v503 = erlang_term_coerce(v370)
                                                let v504 = atom.create(v372)
                                                let v505 = atom.create(v374)
                                                let v506 = []
                                                let v507 = [v503, ..v506]
                                                let v508 = erlang_term_apply(v504, v505, v507)
                                                let v510 = atom.create("file")
                                                let v512 = atom.create("read_file")
                                                let v513 = []
                                                let v514 = [v508, ..v513]
                                                let v515 = erlang_term_apply(v510, v512, v514)
                                                let v516 = erlang_term_coerce(1)
                                                let v517 = atom.create(v386)
                                                let v518 = "element"
                                                let v519 = atom.create(v518)
                                                let v520 = []
                                                let v521 = [v515, ..v520]
                                                let v522 = [v516, ..v521]
                                                let v523 = erlang_term_apply(v517, v519, v522)
                                                let v525 = atom.create("ok")
                                                let v526 = erlang_term_coerce(v525)
                                                let v527 = v523 == v526
                                                let v538 =
                                                    case v527 {
                                                        True -> {
                                                            let v528 = erlang_term_coerce(2)
                                                            let v529 = atom.create(v386)
                                                            let v530 = atom.create(v518)
                                                            let v531 = []
                                                            let v532 = [v515, ..v531]
                                                            let v533 = [v528, ..v532]
                                                            let v534 = erlang_term_apply(v529, v530, v533)
                                                            let v535 = erlang_term_coerce(v534)
                                                            Us2Some(v535)
                                                        }
                                                        False -> Us2None
                                                    }
                                                case v538  {
                                                    Us2None -> {
                                                        let v560 = int.to_string(404)
                                                        let v561 = { "HTTP/1.1 " } <> { v560 }
                                                        let v562 = { v561 } <> { " " }
                                                        let v563 = { v562 } <> { "Not Found" }
                                                        let v565 = erlang_term_coerce("not found")
                                                        let v566 = atom.create(v386)
                                                        let v568 = atom.create("byte_size")
                                                        let v569 = []
                                                        let v570 = [v565, ..v569]
                                                        let v571 = erlang_term_apply(v566, v568, v570)
                                                        let v572 = erlang_term_coerce(v571)
                                                        let v573 = int.to_string(v572)
                                                        let v574 = { "\r\nContent-Length: " } <> { v573 }
                                                        let v575 = { "\r\nContent-Type: text/plain; charset=utf-8" } <> { v574 }
                                                        let v576 = { v575 } <> { "\r\nConnection: close\r\n\r\n" }
                                                        let v577 = { v563 } <> { v576 }
                                                        let v578 = { v577 } <> { "not found" }
                                                        v578
                                                    }
                                                    Us2Some(v539) -> {
                                                        let v540 = int.to_string(200)
                                                        let v541 = { "HTTP/1.1 " } <> { v540 }
                                                        let v542 = { v541 } <> { " " }
                                                        let v543 = { v542 } <> { "OK" }
                                                        let v544 = { "\r\nContent-Type: " } <> { v368 }
                                                        let v545 = { v544 } <> { "\r\nContent-Length: " }
                                                        let v546 = erlang_term_coerce(v539)
                                                        let v547 = atom.create(v386)
                                                        let v549 = atom.create("byte_size")
                                                        let v550 = []
                                                        let v551 = [v546, ..v550]
                                                        let v552 = erlang_term_apply(v547, v549, v551)
                                                        let v553 = erlang_term_coerce(v552)
                                                        let v554 = int.to_string(v553)
                                                        let v555 = { v545 } <> { v554 }
                                                        let v556 = { v555 } <> { "\r\nAccept-Ranges: bytes" }
                                                        let v557 = { v556 } <> { "\r\nConnection: close\r\n\r\n" }
                                                        let v558 = { v543 } <> { v557 }
                                                        let v559 = { v558 } <> { v539 }
                                                        v559
                                                    }
                                                }
                                            }
                                            Us107Some(v581, v582) -> {
                                                let v583 = spiral_wrap_signed(v582 - v581, 32)
                                                let v584 = spiral_wrap_signed(v583 + 1, 32)
                                                let v585 = erlang_term_coerce(v370)
                                                let v586 = atom.create(v372)
                                                let v587 = atom.create(v374)
                                                let v588 = []
                                                let v589 = [v585, ..v588]
                                                let v590 = erlang_term_apply(v586, v587, v589)
                                                let v592 = atom.create("read")
                                                let v593 = erlang_term_coerce(v592)
                                                let v595 = atom.create("binary")
                                                let v596 = erlang_term_coerce(v595)
                                                let v598 = atom.create("raw")
                                                let v599 = erlang_term_coerce(v598)
                                                let v600 = []
                                                let v601 = [v599, ..v600]
                                                let v602 = [v596, ..v601]
                                                let v603 = [v593, ..v602]
                                                let v604 = erlang_term_coerce(v603)
                                                let v605 = "file"
                                                let v606 = atom.create(v605)
                                                let v608 = atom.create("open")
                                                let v609 = []
                                                let v610 = [v604, ..v609]
                                                let v611 = [v590, ..v610]
                                                let v612 = erlang_term_apply(v606, v608, v611)
                                                let v613 = erlang_term_coerce(1)
                                                let v614 = atom.create(v386)
                                                let v615 = "element"
                                                let v616 = atom.create(v615)
                                                let v617 = []
                                                let v618 = [v612, ..v617]
                                                let v619 = [v613, ..v618]
                                                let v620 = erlang_term_apply(v614, v616, v619)
                                                let v621 = "ok"
                                                let v622 = atom.create(v621)
                                                let v623 = erlang_term_coerce(v622)
                                                let v624 = v620 == v623
                                                let v634 =
                                                    case v624 {
                                                        True -> {
                                                            let v625 = erlang_term_coerce(2)
                                                            let v626 = atom.create(v386)
                                                            let v627 = atom.create(v615)
                                                            let v628 = []
                                                            let v629 = [v612, ..v628]
                                                            let v630 = [v625, ..v629]
                                                            let v631 = erlang_term_apply(v626, v627, v630)
                                                            Us108Some(v631)
                                                        }
                                                        False -> Us108None
                                                    }
                                                let v675 =
                                                    case v634  {
                                                        Us108None -> Us2None
                                                        Us108Some(v635) -> {
                                                            let v636 = erlang_term_coerce(v581)
                                                            let v637 = erlang_term_coerce(v584)
                                                            let v638 = atom.create(v605)
                                                            let v640 = atom.create("pread")
                                                            let v641 = []
                                                            let v642 = [v637, ..v641]
                                                            let v643 = [v636, ..v642]
                                                            let v644 = [v635, ..v643]
                                                            let v645 = erlang_term_apply(v638, v640, v644)
                                                            let v646 = atom.create(v605)
                                                            let v648 = atom.create("close")
                                                            let v649 = []
                                                            let v650 = [v635, ..v649]
                                                            let _v651 = erlang_term_apply(v646, v648, v650)
                                                            let v652 = erlang_term_coerce(1)
                                                            let v653 = atom.create(v386)
                                                            let v654 = atom.create(v615)
                                                            let v655 = []
                                                            let v656 = [v645, ..v655]
                                                            let v657 = [v652, ..v656]
                                                            let v658 = erlang_term_apply(v653, v654, v657)
                                                            let v659 = atom.create(v621)
                                                            let v660 = erlang_term_coerce(v659)
                                                            let v661 = v658 == v660
                                                            case v661 {
                                                                True -> {
                                                                    let v662 = erlang_term_coerce(2)
                                                                    let v663 = atom.create(v386)
                                                                    let v664 = atom.create(v615)
                                                                    let v665 = []
                                                                    let v666 = [v645, ..v665]
                                                                    let v667 = [v662, ..v666]
                                                                    let v668 = erlang_term_apply(v663, v664, v667)
                                                                    let v669 = erlang_term_coerce(v668)
                                                                    Us2Some(v669)
                                                                }
                                                                False -> Us2None
                                                            }
                                                        }
                                                    }
                                                case v675  {
                                                    Us2None -> {
                                                        let v705 = int.to_string(404)
                                                        let v706 = { "HTTP/1.1 " } <> { v705 }
                                                        let v707 = { v706 } <> { " " }
                                                        let v708 = { v707 } <> { "Not Found" }
                                                        let v710 = erlang_term_coerce("not found")
                                                        let v711 = atom.create(v386)
                                                        let v713 = atom.create("byte_size")
                                                        let v714 = []
                                                        let v715 = [v710, ..v714]
                                                        let v716 = erlang_term_apply(v711, v713, v715)
                                                        let v717 = erlang_term_coerce(v716)
                                                        let v718 = int.to_string(v717)
                                                        let v719 = { "\r\nContent-Length: " } <> { v718 }
                                                        let v720 = { "\r\nContent-Type: text/plain; charset=utf-8" } <> { v719 }
                                                        let v721 = { v720 } <> { "\r\nConnection: close\r\n\r\n" }
                                                        let v722 = { v708 } <> { v721 }
                                                        let v723 = { v722 } <> { "not found" }
                                                        v723
                                                    }
                                                    Us2Some(v676) -> {
                                                        let v677 = int.to_string(v581)
                                                        let v678 = { "\r\nAccept-Ranges: bytes\r\nContent-Range: bytes " } <> { v677 }
                                                        let v679 = { v678 } <> { "-" }
                                                        let v680 = int.to_string(v582)
                                                        let v681 = { v679 } <> { v680 }
                                                        let v682 = { v681 } <> { "/" }
                                                        let v683 = int.to_string(v406)
                                                        let v684 = { v682 } <> { v683 }
                                                        let v685 = int.to_string(206)
                                                        let v686 = { "HTTP/1.1 " } <> { v685 }
                                                        let v687 = { v686 } <> { " " }
                                                        let v688 = { v687 } <> { "Status" }
                                                        let v689 = { "\r\nContent-Type: " } <> { v368 }
                                                        let v690 = { v689 } <> { "\r\nContent-Length: " }
                                                        let v691 = erlang_term_coerce(v676)
                                                        let v692 = atom.create(v386)
                                                        let v694 = atom.create("byte_size")
                                                        let v695 = []
                                                        let v696 = [v691, ..v695]
                                                        let v697 = erlang_term_apply(v692, v694, v696)
                                                        let v698 = erlang_term_coerce(v697)
                                                        let v699 = int.to_string(v698)
                                                        let v700 = { v690 } <> { v699 }
                                                        let v701 = { v700 } <> { v684 }
                                                        let v702 = { v701 } <> { "\r\nConnection: close\r\n\r\n" }
                                                        let v703 = { v688 } <> { v702 }
                                                        let v704 = { v703 } <> { v676 }
                                                        v704
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            False -> {
                                let v729 = int.to_string(404)
                                let v730 = { "HTTP/1.1 " } <> { v729 }
                                let v731 = { v730 } <> { " " }
                                let v732 = { v731 } <> { "Not Found" }
                                let v734 = erlang_term_coerce("not found")
                                let v736 = atom.create("erlang")
                                let v738 = atom.create("byte_size")
                                let v739 = []
                                let v740 = [v734, ..v739]
                                let v741 = erlang_term_apply(v736, v738, v740)
                                let v742 = erlang_term_coerce(v741)
                                let v743 = int.to_string(v742)
                                let v744 = { "\r\nContent-Length: " } <> { v743 }
                                let v745 = { "\r\nContent-Type: text/plain; charset=utf-8" } <> { v744 }
                                let v746 = { v745 } <> { "\r\nConnection: close\r\n\r\n" }
                                let v747 = { v732 } <> { v746 }
                                let v748 = { v747 } <> { "not found" }
                                v748
                            }
                        }
                    #(v749, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
                }
                False -> replied_537(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15)
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
