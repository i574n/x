import gleam/erlang/atom
import gleam/string
import xsim_frames/types.{type Uh3, type Uh13, type Uh37, type Uh36, type Uh39, type Heap0, type Uh43, type Uh41, type Us103, type Uh45, type Uh44, type Uh46, type Us105, type Uh47, type Uh48, type Us104, type Uh49, type Us106, type Uh50, type Uh51, Heap0, Uh13Cons, Uh13Nil, Uh29Nil, Uh36Cons, Uh36Nil, Uh37Cons, Uh37Nil, Uh39Cons, Uh39Nil, Uh3Cons, Uh3Nil, Uh40ShownPost, Uh41Cons, Uh42Nil, Uh43Cons, Uh43Nil, Uh44AutoLink, Uh44Code, Uh44Image, Uh44Link, Uh44LinkedImage, Uh44Strong, Uh44Text, Uh45Cons, Uh45Nil, Uh46Cons, Uh46Nil, Uh47Cons, Uh47Nil, Uh48Cons, Uh48Nil, Uh49Cons, Uh49Nil, Uh50Cons, Uh50Nil, Uh51Cons, Uh51Nil, Us102Original, Us102QuoteOf, Us102ReplyTo, Us102RepostOf, Us103H1, Us103H2, Us103H3, Us103H4, Us103H5, Us103H6, Us104Bullets, Us104CodeBlock, Us104Heading, Us104Numbered, Us104Paragraph, Us104Rule, Us104Table, Us105AlignCenter, Us105AlignLeft, Us105AlignNone, Us105AlignRight, Us106Markup, Us3None, Us3Some}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, spiral_array_from_list, spiral_array_get, spiral_string_index, spiral_string_length, spiral_string_slice, spiral_wrap_signed}
import xsim_frames/part12.{items_from_301}
import xsim_frames/part26.{method481, method482}

pub fn method480(v0: Uh39, v1: Uh41) -> Uh41 {
    case v0  {
        Uh39Cons(v2, v3, v4) -> {
            let v5 = method480(v4, v1)
            let #(v340, v341, v342, v343, v344, v345, v346) =
                case v3  {
                    Uh40ShownPost(v6) -> {
                        let v7 = ""
                        let v8 = erlang_term_coerce(v7)
                        let v10 = erlang_term_coerce("id")
                        let v11 = erlang_term_coerce(v8)
                        let v12 = "maps"
                        let v13 = atom.create(v12)
                        let v14 = "get"
                        let v15 = atom.create(v14)
                        let v16 = []
                        let v17 = [v11, ..v16]
                        let v18 = [v6, ..v17]
                        let v19 = [v10, ..v18]
                        let v20 = erlang_term_apply(v13, v15, v19)
                        let v21 = erlang_term_coerce(v20)
                        let v22 = "erlang"
                        let v23 = atom.create(v22)
                        let v24 = "is_binary"
                        let v25 = atom.create(v24)
                        let v26 = []
                        let v27 = [v21, ..v26]
                        let v28 = erlang_term_apply(v23, v25, v27)
                        let v29 = erlang_term_coerce(v28)
                        let v38 =
                            case v29 {
                                True -> {
                                    erlang_term_coerce(v21)
                                }
                                False -> {
                                    let v31 = atom.create(v22)
                                    let v33 = atom.create("integer_to_binary")
                                    let v34 = []
                                    let v35 = [v21, ..v34]
                                    let v36 = erlang_term_apply(v31, v33, v35)
                                    erlang_term_coerce(v36)
                                }
                            }
                        let v39 = erlang_term_coerce(v7)
                        let v41 = erlang_term_coerce("created_at")
                        let v42 = erlang_term_coerce(v39)
                        let v43 = atom.create(v12)
                        let v44 = atom.create(v14)
                        let v45 = []
                        let v46 = [v42, ..v45]
                        let v47 = [v6, ..v46]
                        let v48 = [v41, ..v47]
                        let v49 = erlang_term_apply(v43, v44, v48)
                        let v50 = erlang_term_coerce(v49)
                        let v51 = erlang_term_coerce(v50)
                        let v52 = erlang_term_coerce(v7)
                        let v53 = "text"
                        let v54 = erlang_term_coerce(v53)
                        let v55 = erlang_term_coerce(v52)
                        let v56 = atom.create(v12)
                        let v57 = atom.create(v14)
                        let v58 = []
                        let v59 = [v55, ..v58]
                        let v60 = [v6, ..v59]
                        let v61 = [v54, ..v60]
                        let v62 = erlang_term_apply(v56, v57, v61)
                        let v63 = erlang_term_coerce(v62)
                        let v64 = erlang_term_coerce(v63)
                        let v65 = "0"
                        let v68 = Heap0(l0: v38, l1: v2, l2: v51, l3: v64, l4: v65, l5: v65, l6: v65, l7: Uh3Nil, l8: Uh42Nil)
                        let v69 = erlang_term_coerce(v7)
                        let v71 = erlang_term_coerce("kind")
                        let v72 = erlang_term_coerce(v69)
                        let v73 = atom.create(v12)
                        let v74 = atom.create(v14)
                        let v75 = []
                        let v76 = [v72, ..v75]
                        let v77 = [v6, ..v76]
                        let v78 = [v71, ..v77]
                        let v79 = erlang_term_apply(v73, v74, v78)
                        let v80 = erlang_term_coerce(v79)
                        let v81 = erlang_term_coerce(v80)
                        let v82 = v81 == "retweet"
                        let v163 =
                            case v82 {
                                True -> {
                                    let v83 = erlang_term_coerce(v7)
                                    let v85 = erlang_term_coerce("retweet_author")
                                    let v86 = erlang_term_coerce(v83)
                                    let v87 = atom.create(v12)
                                    let v88 = atom.create(v14)
                                    let v89 = []
                                    let v90 = [v86, ..v89]
                                    let v91 = [v6, ..v90]
                                    let v92 = [v85, ..v91]
                                    let v93 = erlang_term_apply(v87, v88, v92)
                                    let v94 = erlang_term_coerce(v93)
                                    let v95 = erlang_term_coerce(v94)
                                    Us102RepostOf(v95)
                                }
                                False -> {
                                    let v97 = v81 == "reply"
                                    case v97 {
                                        True -> {
                                            let v98 = erlang_term_coerce(v7)
                                            let v100 = erlang_term_coerce("reply_to_user")
                                            let v101 = erlang_term_coerce(v98)
                                            let v102 = atom.create(v12)
                                            let v103 = atom.create(v14)
                                            let v104 = []
                                            let v105 = [v101, ..v104]
                                            let v106 = [v6, ..v105]
                                            let v107 = [v100, ..v106]
                                            let v108 = erlang_term_apply(v102, v103, v107)
                                            let v109 = erlang_term_coerce(v108)
                                            let v110 = erlang_term_coerce(v109)
                                            Us102ReplyTo(v110)
                                        }
                                        False -> {
                                            let v112 = v81 == "quote"
                                            case v112 {
                                                True -> {
                                                    let v113 = erlang_term_coerce(v7)
                                                    let v115 = erlang_term_coerce("quote")
                                                    let v116 = erlang_term_coerce(v113)
                                                    let v117 = atom.create(v12)
                                                    let v118 = atom.create(v14)
                                                    let v119 = []
                                                    let v120 = [v116, ..v119]
                                                    let v121 = [v6, ..v120]
                                                    let v122 = [v115, ..v121]
                                                    let v123 = erlang_term_apply(v117, v118, v122)
                                                    let v124 = erlang_term_coerce(v123)
                                                    let v125 = atom.create(v22)
                                                    let v127 = atom.create("is_map")
                                                    let v128 = []
                                                    let v129 = [v124, ..v128]
                                                    let v130 = erlang_term_apply(v125, v127, v129)
                                                    let v131 = erlang_term_coerce(v130)
                                                    case v131 {
                                                        True -> {
                                                            let v132 = erlang_term_coerce(v7)
                                                            let v134 = erlang_term_coerce("author")
                                                            let v135 = erlang_term_coerce(v132)
                                                            let v136 = atom.create(v12)
                                                            let v137 = atom.create(v14)
                                                            let v138 = []
                                                            let v139 = [v135, ..v138]
                                                            let v140 = [v124, ..v139]
                                                            let v141 = [v134, ..v140]
                                                            let v142 = erlang_term_apply(v136, v137, v141)
                                                            let v143 = erlang_term_coerce(v142)
                                                            let v144 = erlang_term_coerce(v143)
                                                            let v145 = erlang_term_coerce(v7)
                                                            let v146 = erlang_term_coerce(v53)
                                                            let v147 = erlang_term_coerce(v145)
                                                            let v148 = atom.create(v12)
                                                            let v149 = atom.create(v14)
                                                            let v150 = []
                                                            let v151 = [v147, ..v150]
                                                            let v152 = [v124, ..v151]
                                                            let v153 = [v146, ..v152]
                                                            let v154 = erlang_term_apply(v148, v149, v153)
                                                            let v155 = erlang_term_coerce(v154)
                                                            let v156 = erlang_term_coerce(v155)
                                                            Us102QuoteOf(v144, v156)
                                                        }
                                                        False -> Us102QuoteOf(v7, v7)
                                                    }
                                                }
                                                False -> Us102Original
                                            }
                                        }
                                    }
                                }
                            }
                        let v164 = []
                        let v165 = erlang_term_coerce(v164)
                        let v166 = "media"
                        let v167 = erlang_term_coerce(v166)
                        let v168 = erlang_term_coerce(v165)
                        let v169 = atom.create(v12)
                        let v170 = atom.create(v14)
                        let v171 = []
                        let v172 = [v168, ..v171]
                        let v173 = [v6, ..v172]
                        let v174 = [v167, ..v173]
                        let v175 = erlang_term_apply(v169, v170, v174)
                        let v176 = erlang_term_coerce(v175)
                        let v177 = "lists"
                        let v178 = atom.create(v177)
                        let v179 = "reverse"
                        let v180 = atom.create(v179)
                        let v181 = []
                        let v182 = [v176, ..v181]
                        let v183 = erlang_term_apply(v178, v180, v182)
                        let v185 = items_from_301(v183, Uh29Nil)
                        let v187 = method481(v185, Uh29Nil)
                        let v189 = method482(v187, Uh43Nil)
                        let v190 = erlang_term_coerce(v7)
                        let v192 = erlang_term_coerce("quote")
                        let v193 = erlang_term_coerce(v190)
                        let v194 = atom.create(v12)
                        let v195 = atom.create(v14)
                        let v196 = []
                        let v197 = [v193, ..v196]
                        let v198 = [v6, ..v197]
                        let v199 = [v192, ..v198]
                        let v200 = erlang_term_apply(v194, v195, v199)
                        let v201 = erlang_term_coerce(v200)
                        let v202 = atom.create(v22)
                        let v204 = atom.create("is_map")
                        let v205 = []
                        let v206 = [v201, ..v205]
                        let v207 = erlang_term_apply(v202, v204, v206)
                        let v208 = erlang_term_coerce(v207)
                        let v209 = v208 == False
                        let v234 =
                            case v209 {
                                True -> Uh43Nil
                                False -> {
                                    let v211 = []
                                    let v212 = erlang_term_coerce(v211)
                                    let v213 = erlang_term_coerce(v166)
                                    let v214 = erlang_term_coerce(v212)
                                    let v215 = atom.create(v12)
                                    let v216 = atom.create(v14)
                                    let v217 = []
                                    let v218 = [v214, ..v217]
                                    let v219 = [v201, ..v218]
                                    let v220 = [v213, ..v219]
                                    let v221 = erlang_term_apply(v215, v216, v220)
                                    let v222 = erlang_term_coerce(v221)
                                    let v223 = atom.create(v177)
                                    let v224 = atom.create(v179)
                                    let v225 = []
                                    let v226 = [v222, ..v225]
                                    let v227 = erlang_term_apply(v223, v224, v226)
                                    let v229 = items_from_301(v227, Uh29Nil)
                                    let v231 = method481(v229, Uh29Nil)
                                    method482(v231, Uh43Nil)
                                }
                            }
                        let v235 = erlang_term_coerce(v7)
                        let v237 = erlang_term_coerce("favorite_count")
                        let v238 = erlang_term_coerce(v235)
                        let v239 = atom.create(v12)
                        let v240 = atom.create(v14)
                        let v241 = []
                        let v242 = [v238, ..v241]
                        let v243 = [v6, ..v242]
                        let v244 = [v237, ..v243]
                        let v245 = erlang_term_apply(v239, v240, v244)
                        let v246 = erlang_term_coerce(v245)
                        let v247 = atom.create(v22)
                        let v248 = atom.create(v24)
                        let v249 = []
                        let v250 = [v246, ..v249]
                        let v251 = erlang_term_apply(v247, v248, v250)
                        let v252 = erlang_term_coerce(v251)
                        let v260 =
                            case v252 {
                                True -> True
                                False -> {
                                    let v253 = atom.create(v22)
                                    let v255 = atom.create("is_integer")
                                    let v256 = []
                                    let v257 = [v246, ..v256]
                                    let v258 = erlang_term_apply(v253, v255, v257)
                                    erlang_term_coerce(v258)
                                }
                            }
                        let v280 =
                            case v260 {
                                True -> {
                                    let v261 = atom.create(v22)
                                    let v262 = atom.create(v24)
                                    let v263 = []
                                    let v264 = [v246, ..v263]
                                    let v265 = erlang_term_apply(v261, v262, v264)
                                    let v266 = erlang_term_coerce(v265)
                                    let v275 =
                                        case v266 {
                                            True -> {
                                                erlang_term_coerce(v246)
                                            }
                                            False -> {
                                                let v268 = atom.create(v22)
                                                let v270 = atom.create("integer_to_binary")
                                                let v271 = []
                                                let v272 = [v246, ..v271]
                                                let v273 = erlang_term_apply(v268, v270, v272)
                                                erlang_term_coerce(v273)
                                            }
                                        }
                                    let v276 = count_of_text_10(v275)
                                    case v276  {
                                        Us3None -> 0
                                        Us3Some(v277) -> v277
                                    }
                                }
                                False -> 0
                            }
                        let v281 = erlang_term_coerce(v7)
                        let v283 = erlang_term_coerce("conversation_count")
                        let v284 = erlang_term_coerce(v281)
                        let v285 = atom.create(v12)
                        let v286 = atom.create(v14)
                        let v287 = []
                        let v288 = [v284, ..v287]
                        let v289 = [v6, ..v288]
                        let v290 = [v283, ..v289]
                        let v291 = erlang_term_apply(v285, v286, v290)
                        let v292 = erlang_term_coerce(v291)
                        let v293 = atom.create(v22)
                        let v294 = atom.create(v24)
                        let v295 = []
                        let v296 = [v292, ..v295]
                        let v297 = erlang_term_apply(v293, v294, v296)
                        let v298 = erlang_term_coerce(v297)
                        let v306 =
                            case v298 {
                                True -> True
                                False -> {
                                    let v299 = atom.create(v22)
                                    let v301 = atom.create("is_integer")
                                    let v302 = []
                                    let v303 = [v292, ..v302]
                                    let v304 = erlang_term_apply(v299, v301, v303)
                                    erlang_term_coerce(v304)
                                }
                            }
                        let v326 =
                            case v306 {
                                True -> {
                                    let v307 = atom.create(v22)
                                    let v308 = atom.create(v24)
                                    let v309 = []
                                    let v310 = [v292, ..v309]
                                    let v311 = erlang_term_apply(v307, v308, v310)
                                    let v312 = erlang_term_coerce(v311)
                                    let v321 =
                                        case v312 {
                                            True -> {
                                                erlang_term_coerce(v292)
                                            }
                                            False -> {
                                                let v314 = atom.create(v22)
                                                let v316 = atom.create("integer_to_binary")
                                                let v317 = []
                                                let v318 = [v292, ..v317]
                                                let v319 = erlang_term_apply(v314, v316, v318)
                                                erlang_term_coerce(v319)
                                            }
                                        }
                                    let v322 = count_of_text_10(v321)
                                    case v322  {
                                        Us3None -> 0
                                        Us3Some(v323) -> v323
                                    }
                                }
                                False -> 0
                            }
                        let v327 = erlang_term_coerce(v7)
                        let v329 = erlang_term_coerce("lang")
                        let v330 = erlang_term_coerce(v327)
                        let v331 = atom.create(v12)
                        let v332 = atom.create(v14)
                        let v333 = []
                        let v334 = [v330, ..v333]
                        let v335 = [v6, ..v334]
                        let v336 = [v329, ..v335]
                        let v337 = erlang_term_apply(v331, v332, v336)
                        let v338 = erlang_term_coerce(v337)
                        let v339 = erlang_term_coerce(v338)
                        #(v68, v163, v189, v234, v280, v326, v339)
                    }
                }
            Uh41Cons(v340, v341, v342, v343, v344, v345, v346, v5)
        }
        Uh39Nil -> v1
    }
}

pub fn length_from_484(v0: Int, v1: Uh37) -> Int {
    case v1  {
        Uh37Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v0 + 1, 32)
            length_from_484(v5, v4)
        }
        Uh37Nil -> v0
    }
}

pub fn consumed_483(v0: Uh36, v1: Uh36) -> Uh13 {
    case v0  {
        Uh36Cons(v3, v4) -> {
            let v6 = length_from_484(0, v3)
            let v12 =
                case v1  {
                    Uh36Cons(v8, v9) -> v8
                    Uh36Nil -> Uh37Nil
                }
            let v13 = length_from_484(0, v12)
            let v14 = spiral_wrap_signed(v6 - v13, 32)
            let v19 =
                case v1  {
                    Uh36Cons(v15, v16) -> v16
                    Uh36Nil -> Uh36Nil
                }
            let v20 = consumed_483(v4, v19)
            Uh13Cons(v14, v20)
        }
        Uh36Nil -> Uh13Nil
    }
}

pub fn trusted_488(v0: String) -> Us106 {
    Us106Markup(v0)
}

pub fn entity_497(v0: String) -> String {
    let v1 = v0 == "&"
    case v1 {
        True -> {
            "&amp;"
        }
        False -> {
            let v3 = v0 == "<"
            case v3 {
                True -> {
                    "&lt;"
                }
                False -> {
                    let v5 = v0 == ">"
                    case v5 {
                        True -> {
                            "&gt;"
                        }
                        False -> {
                            let v7 = v0 == "\""
                            case v7 {
                                True -> {
                                    "&quot;"
                                }
                                False -> {
                                    ""
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

pub fn run_of_495(v0: String, v1: Int, v2: Int) -> String {
    let v3 = v2 <= v1
    case v3 {
        True -> {
            ""
        }
        False -> {
            let v5 = spiral_wrap_signed(v2 - 1, 32)
            spiral_string_slice(v0, v1, v5)
        }
    }
}

pub fn escape_step_496(v0: String, v1: Int, v2: Int, v3: String) -> #(Int, String) {
    let v4 = spiral_string_index(v0, v1)
    let v5 = entity_497(v4)
    let v6 = v5 == ""
    case v6 {
        True -> #(v2, v3)
        False -> {
            let v7 = spiral_wrap_signed(v1 + 1, 32)
            let v8 = run_of_495(v0, v2, v1)
            let v9 = { v3 } <> { v8 }
            let v10 = { v9 } <> { v5 }
            #(v7, v10)
        }
    }
}

pub fn escape_from_494(v0: String, v1: Int, v2: Int, v3: String) -> String {
    let v4 = spiral_string_length(v0)
    let v5 = v1 >= v4
    case v5 {
        True -> {
            let v6 = run_of_495(v0, v2, v1)
            let v7 = { v3 } <> { v6 }
            v7
        }
        False -> {
            let #(v8, v9) = escape_step_496(v0, v1, v2, v3)
            let v10 = spiral_wrap_signed(v1 + 1, 32)
            escape_from_494(v0, v10, v8, v9)
        }
    }
}

pub fn escape_493(v0: String) -> Us106 {
    let v4 = escape_from_494(v0, 0, 0, "")
    Us106Markup(v4)
}

pub fn markup_text_502(v0: Us106) -> String {
    case v0  {
        Us106Markup(v1) -> v1
    }
}

pub fn attribute_501(v0: String, v1: String) -> String {
    let v2 = { " " } <> { v1 }
    let v3 = { v2 } <> { "=\"" }
    let v4 = escape_493(v0)
    let v5 = markup_text_502(v4)
    let v6 = { v3 } <> { v5 }
    let v7 = { v6 } <> { "\"" }
    v7
}

pub fn attributes_500(v0: Uh50) -> String {
    case v0  {
        Uh50Cons(v1, v2, v3) -> {
            let v4 = attribute_501(v2, v1)
            let v5 = attributes_500(v3)
            let v6 = { v4 } <> { v5 }
            v6
        }
        Uh50Nil -> {
            ""
        }
    }
}

pub fn element_499(v0: String, v1: Uh50, v2: Us106) -> Us106 {
    let v3 = { "<" } <> { v0 }
    let v4 = attributes_500(v1)
    let v5 = { v3 } <> { v4 }
    let v6 = { v5 } <> { ">" }
    let v7 = markup_text_502(v2)
    let v8 = { v6 } <> { v7 }
    let v9 = { v8 } <> { "</" }
    let v10 = { v9 } <> { v0 }
    let v11 = { v10 } <> { ">" }
    Us106Markup(v11)
}

pub fn anchor_498(v0: String, v1: Us106) -> Us106 {
    let v5 = Uh50Cons("href", v0, Uh50Nil)
    element_499("a", v5, v1)
}

pub fn joined_508(v0: Us106, v1: Us106) -> Us106 {
    let v2 = markup_text_502(v0)
    let v3 = markup_text_502(v1)
    let v4 = { v2 } <> { v3 }
    Us106Markup(v4)
}

pub fn quoted_507(v0: String) -> Us106 {
    let v1 = "\""
    let v2 = trusted_488(v1)
    let v3 = escape_493(v0)
    let v4 = joined_508(v2, v3)
    let v5 = trusted_488(v1)
    joined_508(v4, v5)
}

pub fn image_506(v0: String, v1: String) -> Us106 {
    let v3 = trusted_488("<img src=")
    let v4 = quoted_507(v1)
    let v5 = joined_508(v3, v4)
    let v7 = trusted_488(" alt=")
    let v8 = joined_508(v5, v7)
    let v9 = quoted_507(v0)
    let v10 = joined_508(v8, v9)
    let v12 = trusted_488(">")
    joined_508(v10, v12)
}

pub fn badge_510(v0: String, v1: String, v2: String) -> Us106 {
    let v3 = image_506(v2, v1)
    anchor_498(v0, v3)
}

pub fn wrap_504(v0: String, v1: Us106) -> Us106 {
    element_499(v0, Uh50Nil, v1)
}

pub fn code_of_503(v0: String) -> Us106 {
    let v2 = escape_493(v0)
    wrap_504("code", v2)
}

pub fn linked_492(v0: String, v1: String) -> Us106 {
    let v2 = escape_493(v0)
    anchor_498(v1, v2)
}

pub fn link_html_509(v0: String, v1: String) -> Us106 {
    linked_492(v1, v0)
}

pub fn pic_505(v0: String, v1: String) -> Us106 {
    image_506(v1, v0)
}

pub fn strong_511(v0: Us106) -> Us106 {
    wrap_504("strong", v0)
}

pub fn inline_by_491(v0: fn(Uh45) -> Us106, v1: Uh44) -> Us106 {
    case v1  {
        Uh44AutoLink(v15) -> linked_492(v15, v15)
        Uh44Code(v4) -> code_of_503(v4)
        Uh44Image(v12, v13) -> pic_505(v13, v12)
        Uh44Link(v9, v10) -> link_html_509(v10, v9)
        Uh44LinkedImage(v17, v18, v19) -> badge_510(v19, v18, v17)
        Uh44Strong(v6) -> {
            let v7 = v0(v6)
            strong_511(v7)
        }
        Uh44Text(v2) -> escape_493(v2)
    }
}

pub fn inlines_html_490(v0: Uh45) -> Us106 {
    case v0  {
        Uh45Cons(v1, v2) -> {
            let v3 = closure152(Nil)
            let v4 = inline_by_491(v3, v1)
            let v5 = inlines_html_490(v2)
            joined_508(v4, v5)
        }
        Uh45Nil -> {
            trusted_488("")
        }
    }
}

pub fn closure152(capt: Nil) -> fn(Uh45) -> Us106 {
    fn (v0) {
        inlines_html_490(v0)
    }
}

pub fn items_html_489(v0: Uh46) -> Us106 {
    case v0  {
        Uh46Cons(v1, v2) -> {
            let v4 = trusted_488("<li>")
            let v5 = inlines_html_490(v1)
            let v6 = joined_508(v4, v5)
            let v8 = trusted_488("</li>\n")
            let v9 = joined_508(v6, v8)
            let v10 = items_html_489(v2)
            joined_508(v9, v10)
        }
        Uh46Nil -> {
            trusted_488("")
        }
    }
}

pub fn bullets_html_487(v0: Uh46) -> Us106 {
    let v2 = trusted_488("<ul>\n")
    let v3 = items_html_489(v0)
    let v4 = joined_508(v2, v3)
    let v6 = trusted_488("</ul>\n")
    joined_508(v4, v6)
}

pub fn code_html_513(v0: Uh3) -> Us106 {
    case v0  {
        Uh3Cons(v1, v2) -> {
            let v3 = escape_493(v1)
            let v5 = trusted_488("\n")
            let v6 = joined_508(v3, v5)
            let v7 = code_html_513(v2)
            joined_508(v6, v7)
        }
        Uh3Nil -> {
            trusted_488("")
        }
    }
}

pub fn pre_html_512(v0: Uh3) -> Us106 {
    let v2 = trusted_488("<pre><code>")
    let v3 = code_html_513(v0)
    let v4 = joined_508(v2, v3)
    let v6 = trusted_488("</code></pre>\n")
    joined_508(v4, v6)
}

pub fn level_tag_515(v0: Us103) -> String {
    let v7 = spiral_array_from_list([ "H1", "H2", "H3", "H4", "H5", "H6" ])
    let v8 = case v0 { Us103H1 -> 0 Us103H2 -> 1 Us103H3 -> 2 Us103H4 -> 3 Us103H5 -> 4 Us103H6 -> 5 }
    let v9 = spiral_array_get(v7, v8)
    v9 |> string.lowercase
}

pub fn heading_html_514(v0: Uh45, v1: Us103) -> Us106 {
    let v2 = level_tag_515(v1)
    let v3 = inlines_html_490(v0)
    let v4 = wrap_504(v2, v3)
    let v6 = trusted_488("\n")
    joined_508(v4, v6)
}

pub fn digit_519(v0: Int) -> String {
    let v1 = spiral_wrap_signed(v0, 32)
    let v3 = spiral_wrap_signed(v1 + 1, 32)
    run_of_495("0123456789", v1, v3)
}

pub fn show_i64_518(v0: Int) -> String {
    let v1 = v0 < 10
    case v1 {
        True -> digit_519(v0)
        False -> {
            let v3 = v0 / 10
            let v4 = show_i64_518(v3)
            let v5 = v0 % 10
            let v6 = digit_519(v5)
            let v7 = { v4 } <> { v6 }
            v7
        }
    }
}

pub fn ordered_open_517(v0: Int) -> String {
    let v1 = v0 == 1
    case v1 {
        True -> {
            "<ol>\n"
        }
        False -> {
            let v3 = show_i64_518(v0)
            let v4 = { "<ol start=\"" } <> { v3 }
            let v5 = { v4 } <> { "\">\n" }
            v5
        }
    }
}

pub fn numbered_html_516(v0: Uh46, v1: Int) -> Us106 {
    let v2 = ordered_open_517(v1)
    let v3 = trusted_488(v2)
    let v4 = items_html_489(v0)
    let v5 = joined_508(v3, v4)
    let v7 = trusted_488("</ol>\n")
    joined_508(v5, v7)
}

pub fn para_html_520(v0: Uh45) -> Us106 {
    let v2 = trusted_488("<p>")
    let v3 = inlines_html_490(v0)
    let v4 = joined_508(v2, v3)
    let v6 = trusted_488("</p>\n")
    joined_508(v4, v6)
}

pub fn hr_521() -> Us106 {
    trusted_488("<hr>\n")
}

pub fn align_head_526(v0: Uh47) -> #(Us105, Uh47) {
    case v0  {
        Uh47Cons(v1, v2) -> #(v1, v2)
        Uh47Nil -> {
            #(Us105AlignNone, Uh47Nil)
        }
    }
}

pub fn align_attr_528(v0: Us105) -> String {
    case v0  {
        Us105AlignCenter -> {
            " style=\"text-align: center\""
        }
        Us105AlignLeft -> {
            " style=\"text-align: left\""
        }
        Us105AlignNone -> {
            ""
        }
        Us105AlignRight -> {
            " style=\"text-align: right\""
        }
    }
}

pub fn cell_html_527(v0: String, v1: Us105, v2: Uh45) -> Us106 {
    let v3 = { "<" } <> { v0 }
    let v4 = align_attr_528(v1)
    let v5 = { v3 } <> { v4 }
    let v6 = { v5 } <> { ">" }
    let v7 = trusted_488(v6)
    let v8 = inlines_html_490(v2)
    let v9 = joined_508(v7, v8)
    let v10 = { "</" } <> { v0 }
    let v11 = { v10 } <> { ">" }
    let v12 = trusted_488(v11)
    joined_508(v9, v12)
}

pub fn cells_html_525(v0: String, v1: Uh47, v2: Uh46) -> Us106 {
    case v2  {
        Uh46Cons(v5, v6) -> {
            let #(v7, v8) = align_head_526(v1)
            let v9 = cell_html_527(v0, v7, v5)
            let v10 = cells_html_525(v0, v8, v6)
            joined_508(v9, v10)
        }
        Uh46Nil -> {
            trusted_488("")
        }
    }
}

pub fn row_html_524(v0: String, v1: Uh47, v2: Uh46) -> Us106 {
    let v4 = trusted_488("<tr>")
    let v5 = cells_html_525(v0, v1, v2)
    let v6 = joined_508(v4, v5)
    let v8 = trusted_488("</tr>\n")
    joined_508(v6, v8)
}

pub fn rows_html_529(v0: Uh47, v1: Uh48) -> Us106 {
    case v1  {
        Uh48Cons(v2, v3) -> {
            let v5 = row_html_524("td", v0, v2)
            let v6 = rows_html_529(v0, v3)
            joined_508(v5, v6)
        }
        Uh48Nil -> {
            trusted_488("")
        }
    }
}

pub fn table_html_523(v0: Uh47, v1: Uh46, v2: Uh48) -> Us106 {
    let v4 = trusted_488("<table>\n<thead>\n")
    let v6 = row_html_524("th", v0, v1)
    let v7 = joined_508(v4, v6)
    let v9 = trusted_488("</thead>\n<tbody>\n")
    let v10 = joined_508(v7, v9)
    let v11 = rows_html_529(v0, v2)
    let v12 = joined_508(v10, v11)
    let v14 = trusted_488("</tbody>\n</table>\n")
    joined_508(v12, v14)
}

pub fn table_of_522(v0: Uh48, v1: Uh46, v2: Uh47) -> Us106 {
    table_html_523(v2, v1, v0)
}

pub fn block_html_486(v0: Us104) -> Us106 {
    case v0  {
        Us104Bullets(v6) -> bullets_html_487(v6)
        Us104CodeBlock(v11) -> pre_html_512(v11)
        Us104Heading(v1, v2) -> heading_html_514(v2, v1)
        Us104Numbered(v8, v9) -> numbered_html_516(v9, v8)
        Us104Paragraph(v4) -> para_html_520(v4)
        Us104Rule -> hr_521()
        Us104Table(v14, v15, v16) -> table_of_522(v16, v15, v14)
    }
}

pub fn blocks_html_485(v0: Uh49) -> Us106 {
    case v0  {
        Uh49Cons(v1, v2) -> {
            let v3 = block_html_486(v1)
            let v4 = blocks_html_485(v2)
            joined_508(v3, v4)
        }
        Uh49Nil -> {
            trusted_488("")
        }
    }
}

pub fn method531(v0: Uh43, v1: Uh51) -> Uh51 {
    case v0  {
        Uh43Cons(v2, v3, v4, v5) -> {
            let v6 = method531(v5, v1)
            let v7 = v3 == "video"
            let v43 =
                case v7 {
                    True -> {
                        let v8 = { "/media/" } <> { v2 }
                        let v13 = ""
                        let v21 = Uh50Cons("src", v8, Uh50Nil)
                        let v22 = Uh50Cons("controls", v13, v21)
                        let v23 = Uh50Cons("preload", "metadata", v22)
                        let v24 = Uh50Cons("playsinline", v13, v23)
                        let v25 = Uh50Cons("loop", v13, v24)
                        let v26 = Uh50Cons("muted", v13, v25)
                        let v27 = Uh50Cons("class", "vid", v26)
                        let v28 = trusted_488(v13)
                        element_499("video", v27, v28)
                    }
                    False -> {
                        let v31 = { "/media/" } <> { v2 }
                        let v37 = Uh50Cons("alt", v4, Uh50Nil)
                        let v38 = Uh50Cons("src", v31, v37)
                        let v39 = Uh50Cons("loading", "lazy", v38)
                        let v41 = trusted_488("")
                        element_499("img", v39, v41)
                    }
                }
            Uh51Cons(v43, v6)
        }
        Uh43Nil -> v1
    }
}

pub fn concat_532(v0: Uh51) -> Us106 {
    case v0  {
        Uh51Cons(v1, v2) -> {
            let v3 = concat_532(v2)
            joined_508(v1, v3)
        }
        Uh51Nil -> {
            Us106Markup("")
        }
    }
}
