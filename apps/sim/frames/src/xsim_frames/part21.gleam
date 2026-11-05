import gleam/bit_array
import gleam/erlang/atom
import gleam/otp/actor
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Us84, type Us85, Uh29Nil, Uh3Cons, Uh3Nil, Uh8Nil, Us29CellsExecutor, Us29FakeExecutor, Us29LeakingExecutor, Us30NoEviction, Us33Error, Us33Ok, Us34None, Us34Some, Us36RunParsed, Us36RunRejected, Us3None, Us3Some, Us56Error, Us56Ok, Us69None, Us69Some, Us70Tick, Us78None, Us78Some, Us80Error, Us80Ok, Us84None, Us84Some, Us85Error, Us85Ok, Us86EventsCells, Us86EventsEdits, Us86EventsSeed, Us86EventsUsers, Us87None, Us87Some}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, spiral_fs_coerce, spiral_fs_read_file, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part10.{closure32, closure35, closure36, closure37, flags_parsed_235, method258, method259, quiet_c38}
import xsim_frames/part13.{closure39, closure69, items_from_301}
import xsim_frames/part14.{closure70, closure71, closure73, closure74, closure76, closure77, closure78, closure79}
import xsim_frames/part15.{closure82, closure84, closure85, closure87, closure88, closure89, closure90}
import xsim_frames/part18.{method370, method371}
import xsim_frames/part2.{concat_balanced_22, delimited_21, method20}
import xsim_frames/part20.{method396, method397, method398, method402, method403, simulated_by_308}
import xsim_frames/part9.{closure30}

pub fn closure108(capt: Nil) -> fn(String) -> Int {
    fn (v0) {
        let v1 = "crypto"
        let v2 = atom.create(v1)
        let v3 = erlang_term_coerce(v2)
        let v4 = "application"
        let v5 = atom.create(v4)
        let v6 = "ensure_all_started"
        let v7 = atom.create(v6)
        let v8 = []
        let v9 = [v3, ..v8]
        let v10 = erlang_term_apply(v5, v7, v9)
        let v11 = erlang_term_coerce(1)
        let v12 = "erlang"
        let v13 = atom.create(v12)
        let v14 = "element"
        let v15 = atom.create(v14)
        let v16 = []
        let v17 = [v10, ..v16]
        let v18 = [v11, ..v17]
        let v19 = erlang_term_apply(v13, v15, v18)
        let v20 = "ok"
        let v21 = atom.create(v20)
        let v22 = erlang_term_coerce(v21)
        let v23 = v19 == v22
        let v44 =
            case v23 {
                True -> True
                False -> {
                    let v24 = "xsim / "
                    let v25 = v24 <> v1 
                    let v26 = " did not start: "
                    let v27 = v25 <> v26 
                    let v28 = string.inspect(v10)
                    let v29 = v27 <> v28 
                    let v30 = "\n"
                    let v31 = v29 <> v30 
                    let v32 = "standard_error"
                    let v33 = atom.create(v32)
                    let v34 = erlang_term_coerce(v33)
                    let v35 = erlang_term_coerce(v31)
                    let v36 = "io"
                    let v37 = atom.create(v36)
                    let v38 = "put_chars"
                    let v39 = atom.create(v38)
                    let v40 = []
                    let v41 = [v35, ..v40]
                    let v42 = [v34, ..v41]
                    let _v43 = erlang_term_apply(v37, v39, v42)
                    False
                }
            }
        let _v84 =
            case v44 {
                True -> {
                    let v45 = "spiral_cells"
                    let v46 = atom.create(v45)
                    let v47 = erlang_term_coerce(v46)
                    let v48 = atom.create(v4)
                    let v49 = atom.create(v6)
                    let v50 = []
                    let v51 = [v47, ..v50]
                    let v52 = erlang_term_apply(v48, v49, v51)
                    let v53 = erlang_term_coerce(1)
                    let v54 = atom.create(v12)
                    let v55 = atom.create(v14)
                    let v56 = []
                    let v57 = [v52, ..v56]
                    let v58 = [v53, ..v57]
                    let v59 = erlang_term_apply(v54, v55, v58)
                    let v60 = atom.create(v20)
                    let v61 = erlang_term_coerce(v60)
                    let v62 = v59 == v61
                    case v62 {
                        True -> True
                        False -> {
                            let v63 = "xsim / "
                            let v64 = v63 <> v45 
                            let v65 = " did not start: "
                            let v66 = v64 <> v65 
                            let v67 = string.inspect(v52)
                            let v68 = v66 <> v67 
                            let v69 = "\n"
                            let v70 = v68 <> v69 
                            let v71 = "standard_error"
                            let v72 = atom.create(v71)
                            let v73 = erlang_term_coerce(v72)
                            let v74 = erlang_term_coerce(v70)
                            let v75 = "io"
                            let v76 = atom.create(v75)
                            let v77 = "put_chars"
                            let v78 = atom.create(v77)
                            let v79 = []
                            let v80 = [v74, ..v79]
                            let v81 = [v73, ..v80]
                            let _v82 = erlang_term_apply(v76, v78, v81)
                            False
                        }
                    }
                }
                False -> False
            }
        let v85 = "init"
        let v86 = atom.create(v85)
        let v87 = "get_plain_arguments"
        let v88 = atom.create(v87)
        let v89 = []
        let v90 = erlang_term_apply(v86, v88, v89)
        let v91 = "lists"
        let v92 = atom.create(v91)
        let v93 = "reverse"
        let v94 = atom.create(v93)
        let v95 = []
        let v96 = [v90, ..v95]
        let v97 = erlang_term_apply(v92, v94, v96)
        let v98 = Uh29Nil
        let v99 = items_from_301(v97, v98)
        let v100 = Uh3Nil
        let v101 = method396(v99, v100)
        let v102 = closure30(Nil)
        let v103 = closure32(Nil)
        let v104 = Uh3Nil
        let v105 = ""
        let v106 = -1
        let v107 = 0
        let v108 = 0
        let v109 = False
        let v110 = 1
        let v111 = 8
        let v112 = 3
        let v113 = 2
        let v114 = 100
        let v115 = Us29FakeExecutor
        let v116 = 4
        let v117 = Us30NoEviction
        let v118 = 0
        let v119 = False
        let v120 = False
        let v121 = flags_parsed_235(v102, v103, v104, v105, v106, v107, v108, v105, v109, v110, v111, v112, v113, v114, v105, v105, v115, v116, v117, v118, v119, v120, v101)
        let v154 =
            case v121  {
                Us33Error(v151) -> Us36RunRejected(v151)
                Us33Ok(v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141) -> {
                    let v142 = 0
                    let v143 = method20(v122, v142)
                    let v144 = v143 == 0
                    let v146 =
                        case v144 {
                            True -> {
                                let v145 = v123 == ""
                                v145
                            }
                            False -> False
                        }
                    case v146 {
                        True -> {
                            let v147 = "missing --spi or --spi-file"
                            Us36RunRejected(v147)
                        }
                        False -> Us36RunParsed(v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137, v138, v139, v140, v141)
                    }
                }
            }
        let v179 =
            case v154  {
                Us36RunParsed(v155, v156, v157, v158, v159, v160, v161, v162, v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174) -> Us34Some(v155, v156, v157, v158, v159, v160, v161)
                Us36RunRejected(v176) -> Us34None
            }
        let #(v258, v259) =
            case v179  {
                Us34None -> {
                    let v254 = Uh8Nil
                    let v255 = "."
                    #(v254, v255)
                }
                Us34Some(v180, v181, v182, v183, v184, v185, v186) -> {
                    let v187 = v181 == ""
                    let v214 =
                        case v187 {
                            True -> v180
                            False -> {
                                let v188 = spiral_fs_read_file(v181)
                                let v189 = method370()
                                let v190 = method371()
                                let v191 = case v188 { Ok(x) -> v189(x) Error(x) -> v190(x) }
                                let v204 =
                                    case v191  {
                                        Us80Error(v201) -> panic as "file_system.read_all_text: file:read_file failed"
                                        Us80Ok(v192) -> {
                                            let v193 = bit_array.to_string(v192)
                                            let v194 = method258()
                                            let v195 = method259()
                                            let v196 = case v193 { Ok(x) -> v194(x) Error(x) -> v195(x) }
                                            case v196  {
                                                Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                                Us56Ok(v197) -> v197
                                            }
                                        }
                                    }
                                let v205 = "\r\n"
                                let v206 = "\n"
                                let v207 = v204 |> string.replace(v205, v206)
                                let v208 = v207 == ""
                                let v211 =
                                    case v208 {
                                        True -> Uh3Nil
                                        False -> split_list_2(v206, v207)
                                    }
                                let v212 = Uh3Nil
                                method397(v211, v212)
                            }
                        }
                    case v214  {
                        Uh3Cons(v215, v216) -> {
                            let v217 = Uh8Nil
                            let v218 = method398(v182, v214, v217)
                            let v219 = erlang_term_coerce(v215)
                            let v220 = "filename"
                            let v221 = atom.create(v220)
                            let v222 = "absname"
                            let v223 = atom.create(v222)
                            let v224 = []
                            let v225 = [v219, ..v224]
                            let v226 = erlang_term_apply(v221, v223, v225)
                            let v227 = "unicode"
                            let v228 = atom.create(v227)
                            let v229 = "characters_to_binary"
                            let v230 = atom.create(v229)
                            let v231 = []
                            let v232 = [v226, ..v231]
                            let v233 = erlang_term_apply(v228, v230, v232)
                            let v234 = erlang_term_coerce(v233)
                            let v235 = erlang_term_coerce(v234)
                            let v236 = atom.create(v220)
                            let v237 = "dirname"
                            let v238 = atom.create(v237)
                            let v239 = []
                            let v240 = [v235, ..v239]
                            let v241 = erlang_term_apply(v236, v238, v240)
                            let v242 = atom.create(v227)
                            let v243 = atom.create(v229)
                            let v244 = []
                            let v245 = [v241, ..v244]
                            let v246 = erlang_term_apply(v242, v243, v245)
                            let v247 = erlang_term_coerce(v246)
                            #(v218, v247)
                        }
                        Uh3Nil -> {
                            let v248 = Uh8Nil
                            let v249 = "."
                            #(v248, v249)
                        }
                    }
                }
            }
        let v260 = "atomics"
        let v261 = atom.create(v260)
        let v262 = erlang_term_coerce(v261)
        let v263 = []
        let v264 = [v262, ..v263]
        let v265 = erlang_term_coerce(v264)
        let v266 = erlang_term_coerce(2)
        let v267 = "counters"
        let v268 = atom.create(v267)
        let v269 = "new"
        let v270 = atom.create(v269)
        let v271 = []
        let v272 = [v265, ..v271]
        let v273 = [v266, ..v272]
        let v274 = erlang_term_apply(v268, v270, v273)
        let v275 = Uh3Nil
        let v276 = -1
        let v277 = 0
        let v278 = 0
        let v279 = False
        let v280 = 1
        let v281 = 8
        let v282 = 3
        let v283 = 2
        let v284 = 100
        let v285 = Us29FakeExecutor
        let v286 = 4
        let v287 = Us30NoEviction
        let v288 = 0
        let v289 = False
        let v290 = False
        let v291 = flags_parsed_235(v102, v103, v275, v105, v276, v277, v278, v105, v279, v280, v281, v282, v283, v284, v105, v105, v285, v286, v287, v288, v289, v290, v101)
        let v324 =
            case v291  {
                Us33Error(v321) -> Us36RunRejected(v321)
                Us33Ok(v292, v293, v294, v295, v296, v297, v298, v299, v300, v301, v302, v303, v304, v305, v306, v307, v308, v309, v310, v311) -> {
                    let v312 = 0
                    let v313 = method20(v292, v312)
                    let v314 = v313 == 0
                    let v316 =
                        case v314 {
                            True -> {
                                let v315 = v293 == ""
                                v315
                            }
                            False -> False
                        }
                    case v316 {
                        True -> {
                            let v317 = "missing --spi or --spi-file"
                            Us36RunRejected(v317)
                        }
                        False -> Us36RunParsed(v292, v293, v294, v295, v296, v297, v298, v299, v300, v301, v302, v303, v304, v305, v306, v307, v308, v309, v310, v311)
                    }
                }
            }
        let v501 =
            case v324  {
                Us36RunParsed(v325, v326, v327, v328, v329, v330, v331, v332, v333, v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344) -> {
                    let #(v399, v400, v401, _v402, _v403, _v404, v405) =
                        case v339  {
                            Us29FakeExecutor -> {
                                let v345 = closure35(Nil)
                                let v346 = closure36(Nil)
                                let v347 = closure37(Nil)
                                let v348 = quiet_c38(Nil)
                                let v349 = closure39(Nil)
                                #(v345, v346, False, v347, v348, v348, v349)
                            }
                            _ -> {
                                let #(v392, v393, v394, v395, v396, v397, v398) =
                                    case v339  {
                                        Us29CellsExecutor -> {
                                            let v350 = closure69(#(v259, v343, v274))
                                            let v351 = closure70(#(v259))
                                            let v352 = closure37(Nil)
                                            let v353 = quiet_c38(Nil)
                                            let v354 = closure39(Nil)
                                            #(v350, v351, True, v352, v353, v353, v354)
                                        }
                                        _ -> {
                                            let #(v385, v386, v387, v388, v389, v390, v391) =
                                                case v339  {
                                                    Us29LeakingExecutor -> {
                                                        let v355 = actor.new(v105)
                                                        let v356 = closure71(Nil)
                                                        let v357 = actor.on_message(v355, fn(state, message) { v356(state)(message) })
                                                        let v358 = actor.start(v357)
                                                        let v359 = result.is_ok(v358)
                                                        let v363 =
                                                            case v359 {
                                                                True -> {
                                                                    let v360 = result.lazy_unwrap(v358, fn() { panic }).data
                                                                    Us69Some(v360)
                                                                }
                                                                False -> Us69None
                                                            }
                                                        let v368 =
                                                            case v363  {
                                                                Us69None -> closure73(Nil)
                                                                Us69Some(v364) -> closure74(#(v364))
                                                            }
                                                        let v369 = actor.new(v105)
                                                        let v370 = actor.on_message(v369, fn(state, message) { v356(state)(message) })
                                                        let v371 = actor.start(v370)
                                                        let v372 = result.is_ok(v371)
                                                        let v376 =
                                                            case v372 {
                                                                True -> {
                                                                    let v373 = result.lazy_unwrap(v371, fn() { panic }).data
                                                                    Us69Some(v373)
                                                                }
                                                                False -> Us69None
                                                            }
                                                        let v381 =
                                                            case v376  {
                                                                Us69None -> closure76(Nil)
                                                                Us69Some(v377) -> closure74(#(v377))
                                                            }
                                                        let v382 = closure37(Nil)
                                                        let v383 = quiet_c38(Nil)
                                                        let v384 = closure39(Nil)
                                                        #(v368, v381, False, v382, v383, v383, v384)
                                                    }
                                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                }
                                            #(v385, v386, v387, v388, v389, v390, v391)
                                        }
                                    }
                                #(v392, v393, v394, v395, v396, v397, v398)
                            }
                        }
                    let v408 =
                        case v343 {
                            True -> closure77(#(v259, v274, v259, v274))
                            False -> closure78(Nil)
                        }
                    let v490 =
                        case v344 {
                            True -> {
                                let v409 = "Elixir.System"
                                let v410 = atom.create(v409)
                                let v411 = "tmp_dir!"
                                let v412 = atom.create(v411)
                                let v413 = []
                                let v414 = erlang_term_apply(v410, v412, v413)
                                let v415 = erlang_term_coerce(v414)
                                let v416 = "/xsim-tree-sample-"
                                let v417 = v415 <> v416 
                                let v418 = atom.create(v409)
                                let v419 = "pid"
                                let v420 = atom.create(v419)
                                let v421 = []
                                let v422 = erlang_term_apply(v418, v420, v421)
                                let v423 = erlang_term_coerce(v422)
                                let v424 = v417 <> v423 
                                let v425 = ".ps1"
                                let v426 = v424 <> v425 
                                let v427 = "\n"
                                let v428 = "param([int]%Root)"
                                let v429 = "%all = @(Get-CimInstance Win32_Process)"
                                let v430 = "if (-not (%all | ? ProcessId -eq %Root)) { exit 0 }"
                                let v431 = "%tree = [Collections.Generic.List[int]]::new()"
                                let v432 = "%tree.Add(%Root)"
                                let v433 = "for (%i = 0; %i -lt %tree.Count; %i++) {"
                                let v434 = "  foreach (%p in %all) {"
                                let v435 = "    %kid = [int]%p.ProcessId"
                                let v436 = "    %up = %p.ParentProcessId -eq %tree[%i]"
                                let v437 = "    if (%up -and %kid -ne %tree[%i]) { %tree.Add(%kid) }"
                                let v438 = "  }"
                                let v439 = "}"
                                let v440 = "%mine = %all | ? { %tree.Contains([int]%_.ProcessId) }"
                                let v441 = "%bytes = (%mine | Measure-Object WorkingSetSize -Sum).Sum"
                                let v442 = "\"%(%tree.Count) %([int64](%bytes / 1MB))\""
                                let v443 = Uh3Nil
                                let v444 = Uh3Cons(v442, v443)
                                let v445 = Uh3Cons(v441, v444)
                                let v446 = Uh3Cons(v440, v445)
                                let v447 = Uh3Cons(v439, v446)
                                let v448 = Uh3Cons(v438, v447)
                                let v449 = Uh3Cons(v437, v448)
                                let v450 = Uh3Cons(v436, v449)
                                let v451 = Uh3Cons(v435, v450)
                                let v452 = Uh3Cons(v434, v451)
                                let v453 = Uh3Cons(v433, v452)
                                let v454 = Uh3Cons(v432, v453)
                                let v455 = Uh3Cons(v431, v454)
                                let v456 = Uh3Cons(v430, v455)
                                let v457 = Uh3Cons(v429, v456)
                                let v458 = Uh3Cons(v428, v457)
                                let v459 = concat_balanced_22(v427, v458)
                                let v460 = "%"
                                let v461 = "$"
                                let v462 = v459 |> string.replace(v460, v461)
                                let v463 = spiral_fs_write_file(v426, v462)
                                let v464 = spiral_fs_coerce(v463)
                                let v465 = atom.create(v20)
                                let v466 = v464 == v465
                                let v467 = v466 == False
                                case v467 {
                                    True -> panic as "file_system.write_all_text: the write failed"
                                    False -> Nil
                                }
                                let v468 = closure79(#(v426))
                                let v469 = actor.new_with_initialiser(10000, fn(me) { Ok(actor.initialised(v468(me)) |> actor.returning(me)) })
                                let v470 = closure82(Nil)
                                let v471 = actor.on_message(v469, fn(state, message) { v470(state)(message) })
                                let v472 = actor.start(v471)
                                let v473 = result.is_ok(v472)
                                let v477 =
                                    case v473 {
                                        True -> {
                                            let v474 = result.lazy_unwrap(v472, fn() { panic }).data
                                            Us78Some(v474)
                                        }
                                        False -> Us78None
                                    }
                                let v483 =
                                    case v477  {
                                        Us78None -> Us78None
                                        Us78Some(v478) -> {
                                            let v479 = Us70Tick
                                            actor.send(v478, v479)
                                            Us78Some(v478)
                                        }
                                    }
                                case v483  {
                                    Us78None -> closure84(Nil)
                                    Us78Some(v484) -> closure85(#(v484))
                                }
                            }
                            False -> closure87(Nil)
                        }
                    let v491 = closure88(#(v408, v490))
                    let v492 = closure89(Nil)
                    let v493 = closure90(Nil)
                    let v494 = simulated_by_308(v399, v400, v401, v491, v492, v493, v405, v325, v326, v327, v328, v329, v330, v331, v332, v333, v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344, v258)
                    let v495 = "\n"
                    delimited_21(v495, v494)
                }
                Us36RunRejected(v497) -> {
                    let v498 = "XSIM rejected "
                    let v499 = v498 <> v497 
                    v499
                }
            }
        let v502 = "\n"
        let v503 = v501 <> v502 
        let v504 = erlang_term_coerce(v503)
        let v505 = "io"
        let v506 = atom.create(v505)
        let v507 = "put_chars"
        let v508 = atom.create(v507)
        let v509 = []
        let v510 = [v504, ..v509]
        let _v511 = erlang_term_apply(v506, v508, v510)
        let v512 = v501 == ""
        let v515 =
            case v512 {
                True -> Uh3Nil
                False -> split_list_2(v502, v501)
            }
        let v516 = method402()
        let v517 = method403(v516, v515)
        case v517 {
            True -> 1
            False -> 0
        }
    }
}

pub fn closure112(capt: #(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us84 {
    fn (v10) {
        let #(v0, v1, v2, v3, v4, v5, v6, _v7, v8, v9) = capt
        let v11 = v10 == "frames"
        case v11 {
            True -> Us84Some(v0, v1, v2, v3, v4, v5, v6, True, v8, v9)
            False -> Us84None
        }
    }
}

pub fn closure111(capt: Nil) -> fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us84 {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9) = dom
        closure112(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9))
    }
}

pub fn closure115(capt: #(String, Int, Int, Int, Int, String, Int, Bool, String, String, String)) -> fn(String) -> Us85 {
    fn (v11) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10) = capt
        let v12 = v10 == "duplicates"
        case v12 {
            True -> {
                let v13 = v11 == ""
                let v17 =
                    case v13 {
                        True -> Uh3Nil
                        False -> {
                            let v15 = "."
                            split_list_2(v15, v11)
                        }
                    }
                let v55 =
                    case v17  {
                        Uh3Cons(v18, v19) -> {
                            case v19  {
                                Uh3Cons(v27, v28) -> {
                                    case v28  {
                                        Uh3Nil -> {
                                            let v29 = v18 == ""
                                            let v31 =
                                                case v29 {
                                                    True -> {
                                                        let v30 = "0"
                                                        v30
                                                    }
                                                    False -> v18
                                                }
                                            let v32 = count_of_text_10(v31)
                                            let v33 = "000"
                                            let v34 = v27 <> v33 
                                            let v35 = spiral_string_slice(v34, 0, 2)
                                            let v36 = count_of_text_10(v35)
                                            case v32  {
                                                Us3Some(v37) -> {
                                                    case v36  {
                                                        Us3Some(v38) -> {
                                                            let v39 = spiral_string_length(v27)
                                                            let v40 = v39 <= 3
                                                            case v40 {
                                                                True -> {
                                                                    let v41 = spiral_wrap_signed(v37 * 1000, 32)
                                                                    let v42 = spiral_wrap_signed(v41 + v38, 32)
                                                                    Us3Some(v42)
                                                                }
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
                                }
                                Uh3Nil -> {
                                    let v20 = count_of_text_10(v18)
                                    case v20  {
                                        Us3None -> Us3None
                                        Us3Some(v21) -> {
                                            let v22 = spiral_wrap_signed(v21 * 1000, 32)
                                            Us3Some(v22)
                                        }
                                    }
                                }
                            }
                        }
                        _ -> Us3None
                    }
                case v55  {
                    Us3None -> {
                        let v58 = "--duplicates takes a decimal like 0.1, got '"
                        let v59 = v58 <> v11 
                        let v60 = "'"
                        let v61 = v59 <> v60 
                        Us85Error(v61)
                    }
                    Us3Some(v56) -> Us85Ok(v0, v1, v2, v3, v4, v5, v56, v7, v8, v9)
                }
            }
            False -> {
                let v65 = v10 == "spi"
                let v71 =
                    case v65 {
                        True -> Us84Some(v11, v1, v2, v3, v4, v5, v6, v7, v8, v9)
                        False -> {
                            let v67 = v10 == "personas"
                            case v67 {
                                True -> Us84Some(v0, v1, v2, v3, v4, v11, v6, v7, v8, v9)
                                False -> Us84None
                            }
                        }
                    }
                let v72 = v10 == "out"
                let v78 =
                    case v72 {
                        True -> Us84Some(v0, v1, v2, v3, v4, v5, v6, v7, v11, v9)
                        False -> {
                            let v74 = v10 == "expected"
                            case v74 {
                                True -> Us84Some(v0, v1, v2, v3, v4, v5, v6, v7, v8, v11)
                                False -> Us84None
                            }
                        }
                    }
                let v90 =
                    case v71  {
                        Us84None -> v78
                        Us84Some(v79, v80, v81, v82, v83, v84, v85, v86, v87, v88) -> v71
                    }
                case v90  {
                    Us84None -> {
                        let v102 = v10 == "cells"
                        let v118 =
                            case v102 {
                                True -> {
                                    let v103 = Us86EventsCells
                                    Us87Some(v103)
                                }
                                False -> {
                                    let v105 = v10 == "seed"
                                    case v105 {
                                        True -> {
                                            let v106 = Us86EventsSeed
                                            Us87Some(v106)
                                        }
                                        False -> {
                                            let v108 = v10 == "users"
                                            case v108 {
                                                True -> {
                                                    let v109 = Us86EventsUsers
                                                    Us87Some(v109)
                                                }
                                                False -> {
                                                    let v111 = v10 == "edits"
                                                    case v111 {
                                                        True -> {
                                                            let v112 = Us86EventsEdits
                                                            Us87Some(v112)
                                                        }
                                                        False -> Us87None
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        case v118  {
                            Us87None -> {
                                let v173 = "unknown option --"
                                let v174 = v173 <> v10 
                                Us85Error(v174)
                            }
                            Us87Some(v119) -> {
                                let v120 = count_of_text_10(v11)
                                case v120  {
                                    Us3None -> {
                                        let v163 = "--"
                                        let v164 = v163 <> v10 
                                        let v165 = " takes a whole number, got '"
                                        let v166 = v164 <> v165 
                                        let v167 = v166 <> v11 
                                        let v168 = "'"
                                        let v169 = v167 <> v168 
                                        Us85Error(v169)
                                    }
                                    Us3Some(v121) -> {
                                        let #(v152, v153, v154, v155, v156, v157, v158, v159, v160, v161) =
                                            case v119  {
                                                Us86EventsCells -> #(v0, v121, v2, v3, v4, v5, v6, v7, v8, v9)
                                                _ -> {
                                                    let #(v142, v143, v144, v145, v146, v147, v148, v149, v150, v151) =
                                                        case v119  {
                                                            Us86EventsSeed -> #(v0, v1, v121, v3, v4, v5, v6, v7, v8, v9)
                                                            _ -> {
                                                                let #(v132, v133, v134, v135, v136, v137, v138, v139, v140, v141) =
                                                                    case v119  {
                                                                        Us86EventsUsers -> #(v0, v1, v2, v121, v4, v5, v6, v7, v8, v9)
                                                                        _ -> {
                                                                            let #(v122, v123, v124, v125, v126, v127, v128, v129, v130, v131) =
                                                                                case v119  {
                                                                                    Us86EventsEdits -> #(v0, v1, v2, v3, v121, v5, v6, v7, v8, v9)
                                                                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                                }
                                                                            #(v122, v123, v124, v125, v126, v127, v128, v129, v130, v131)
                                                                        }
                                                                    }
                                                                #(v132, v133, v134, v135, v136, v137, v138, v139, v140, v141)
                                                            }
                                                        }
                                                    #(v142, v143, v144, v145, v146, v147, v148, v149, v150, v151)
                                                }
                                            }
                                        Us85Ok(v152, v153, v154, v155, v156, v157, v158, v159, v160, v161)
                                    }
                                }
                            }
                        }
                    }
                    Us84Some(v91, v92, v93, v94, v95, v96, v97, v98, v99, v100) -> Us85Ok(v91, v92, v93, v94, v95, v96, v97, v98, v99, v100)
                }
            }
        }
    }
}

pub fn closure114(capt: #(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us85 {
    fn (v10) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9) = capt
        closure115(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10))
    }
}

pub fn closure113(capt: Nil) -> fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us85 {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9) = dom
        closure114(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9))
    }
}

pub fn valued_then_406(v0: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us84, v1: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us85, v2: String, v3: Int, v4: Int, v5: Int, v6: Int, v7: String, v8: Int, v9: Bool, v10: String, v11: String, v12: String, v13: Uh3) -> Us85 {
    case v13  {
        Uh3Cons(v14, v15) -> {
            let v16 = v1(#(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11))
            let v17 = "--"
            let v18 = v12 |> string.starts_with(v17)
            let v25 =
                case v18 {
                    True -> {
                        let v19 = spiral_string_length(v12)
                        let v20 = spiral_wrap_signed(v19 - 2, 32)
                        let v21 = spiral_wrap_signed(2 + v20, 32)
                        let v22 = spiral_wrap_signed(v21 - 1, 32)
                        let v23 = spiral_string_slice(v12, 2, v22)
                        v23
                    }
                    False -> {
                        let v24 = ""
                        v24
                    }
                }
            let v26 = v16(v25)
            let v27 = v26(v14)
            continued_407(v0, v1, v27, v15)
        }
        Uh3Nil -> {
            let v29 = "--"
            let v30 = v12 |> string.starts_with(v29)
            let v37 =
                case v30 {
                    True -> {
                        let v31 = spiral_string_length(v12)
                        let v32 = spiral_wrap_signed(v31 - 2, 32)
                        let v33 = spiral_wrap_signed(2 + v32, 32)
                        let v34 = spiral_wrap_signed(v33 - 1, 32)
                        let v35 = spiral_string_slice(v12, 2, v34)
                        v35
                    }
                    False -> {
                        let v36 = ""
                        v36
                    }
                }
            let v38 = v29 <> v37 
            let v39 = " needs a value"
            let v40 = v38 <> v39 
            Us85Error(v40)
        }
    }
}

pub fn arg_parsed_405(v0: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us84, v1: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us85, v2: String, v3: Int, v4: Int, v5: Int, v6: Int, v7: String, v8: Int, v9: Bool, v10: String, v11: String, v12: String, v13: Uh3) -> Us85 {
    let v14 = v0(#(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11))
    let v15 = "--"
    let v16 = v12 |> string.starts_with(v15)
    let v23 =
        case v16 {
            True -> {
                let v17 = spiral_string_length(v12)
                let v18 = spiral_wrap_signed(v17 - 2, 32)
                let v19 = spiral_wrap_signed(2 + v18, 32)
                let v20 = spiral_wrap_signed(v19 - 1, 32)
                let v21 = spiral_string_slice(v12, 2, v20)
                v21
            }
            False -> {
                let v22 = ""
                v22
            }
        }
    let v24 = v14(v23)
    case v24  {
        Us84None -> valued_then_406(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
        Us84Some(v25, v26, v27, v28, v29, v30, v31, v32, v33, v34) -> flags_parsed_404(v0, v1, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v13)
    }
}

pub fn flags_parsed_404(v0: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us84, v1: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us85, v2: String, v3: Int, v4: Int, v5: Int, v6: Int, v7: String, v8: Int, v9: Bool, v10: String, v11: String, v12: Uh3) -> Us85 {
    case v12  {
        Uh3Cons(v14, v15) -> {
            let v16 = "--"
            let v17 = v14 |> string.starts_with(v16)
            let v24 =
                case v17 {
                    True -> {
                        let v18 = spiral_string_length(v14)
                        let v19 = spiral_wrap_signed(v18 - 2, 32)
                        let v20 = spiral_wrap_signed(2 + v19, 32)
                        let v21 = spiral_wrap_signed(v20 - 1, 32)
                        let v22 = spiral_string_slice(v14, 2, v21)
                        v22
                    }
                    False -> {
                        let v23 = ""
                        v23
                    }
                }
            let v25 = v24 == ""
            case v25 {
                True -> {
                    let v26 = "unexpected argument '"
                    let v27 = v26 <> v14 
                    let v28 = "'"
                    let v29 = v27 <> v28 
                    Us85Error(v29)
                }
                False -> arg_parsed_405(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v14, v15)
            }
        }
        Uh3Nil -> Us85Ok(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
    }
}

pub fn continued_407(v0: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us84, v1: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us85, v2: Us85, v3: Uh3) -> Us85 {
    case v2  {
        Us85Error(v15) -> Us85Error(v15)
        Us85Ok(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13) -> flags_parsed_404(v0, v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v3)
    }
}

pub fn method408(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method408(v3, v1)
            let v5 = v2 != ""
            case v5 {
                True -> Uh3Cons(v2, v4)
                False -> v4
            }
        }
        Uh3Nil -> v1
    }
}
