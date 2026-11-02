import gleam/bit_array
import gleam/erlang/atom
import gleam/otp/actor
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Us80, type Us81, Uh3Cons, Uh3Nil, Uh8Nil, Us29CellsExecutor, Us29FakeExecutor, Us29LeakingExecutor, Us30NoEviction, Us33Error, Us33Ok, Us34None, Us34Some, Us36RunParsed, Us36RunRejected, Us3None, Us3Some, Us56Error, Us56Ok, Us69None, Us69Some, Us70Tick, Us74None, Us74Some, Us76Error, Us76Ok, Us80None, Us80Some, Us81Error, Us81Ok, Us82EventsCells, Us82EventsEdits, Us82EventsSeed, Us82EventsUsers, Us83None, Us83Some}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, spiral_fs_coerce, spiral_fs_read_file, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part10.{closure32, closure35, closure36, closure37, flags_parsed_235, method258, method259, quiet_c38}
import xsim_frames/part13.{closure39, closure69, closure72}
import xsim_frames/part14.{closure73, closure75, closure76, closure78, closure79, closure80, closure81, closure84, closure86}
import xsim_frames/part15.{closure87, closure89, closure90, closure91, closure92}
import xsim_frames/part17.{method366, method367}
import xsim_frames/part2.{concat_balanced_22, delimited_21, method20}
import xsim_frames/part20.{method392, method393, method398, method399, simulated_by_304}
import xsim_frames/part9.{closure30}

pub fn closure110(capt: Nil) -> fn(String) -> Int {
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
        let v91 = erlang_term_coerce(0)
        let v92 = []
        let v93 = [v91, ..v92]
        let v94 = erlang_term_coerce(v93)
        let v95 = "lists"
        let v96 = atom.create(v95)
        let v97 = "join"
        let v98 = atom.create(v97)
        let v99 = []
        let v100 = [v90, ..v99]
        let v101 = [v94, ..v100]
        let v102 = erlang_term_apply(v96, v98, v101)
        let v103 = "unicode"
        let v104 = atom.create(v103)
        let v105 = "characters_to_binary"
        let v106 = atom.create(v105)
        let v107 = []
        let v108 = [v102, ..v107]
        let v109 = erlang_term_apply(v104, v106, v108)
        let v110 = erlang_term_coerce(v109)
        let v111 = unicode_erlang_characters_to_binary([0])
        let v112 = v110 == ""
        let v115 =
            case v112 {
                True -> Uh3Nil
                False -> split_list_2(v111, v110)
            }
        let v116 = closure30(Nil)
        let v117 = closure32(Nil)
        let v118 = Uh3Nil
        let v119 = ""
        let v120 = -1
        let v121 = 0
        let v122 = 0
        let v123 = False
        let v124 = 1
        let v125 = 8
        let v126 = 3
        let v127 = 2
        let v128 = 100
        let v129 = Us29FakeExecutor
        let v130 = 4
        let v131 = Us30NoEviction
        let v132 = 0
        let v133 = False
        let v134 = False
        let v135 = flags_parsed_235(v116, v117, v118, v119, v120, v121, v122, v119, v123, v124, v125, v126, v127, v128, v119, v119, v129, v130, v131, v132, v133, v134, v115)
        let v168 =
            case v135  {
                Us33Error(v165) -> Us36RunRejected(v165)
                Us33Ok(v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155) -> {
                    let v156 = 0
                    let v157 = method20(v136, v156)
                    let v158 = v157 == 0
                    let v160 =
                        case v158 {
                            True -> {
                                let v159 = v137 == ""
                                v159
                            }
                            False -> False
                        }
                    case v160 {
                        True -> {
                            let v161 = "missing --spi or --spi-file"
                            Us36RunRejected(v161)
                        }
                        False -> Us36RunParsed(v136, v137, v138, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149, v150, v151, v152, v153, v154, v155)
                    }
                }
            }
        let v193 =
            case v168  {
                Us36RunParsed(v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188) -> Us34Some(v169, v170, v171, v172, v173, v174, v175)
                Us36RunRejected(v190) -> Us34None
            }
        let #(v270, v271) =
            case v193  {
                Us34None -> {
                    let v266 = Uh8Nil
                    let v267 = "."
                    #(v266, v267)
                }
                Us34Some(v194, v195, v196, v197, v198, v199, v200) -> {
                    let v201 = v195 == ""
                    let v228 =
                        case v201 {
                            True -> v194
                            False -> {
                                let v202 = spiral_fs_read_file(v195)
                                let v203 = method366()
                                let v204 = method367()
                                let v205 = case v202 { Ok(x) -> v203(x) Error(x) -> v204(x) }
                                let v218 =
                                    case v205  {
                                        Us76Error(v215) -> panic as "file_system.read_all_text: file:read_file failed"
                                        Us76Ok(v206) -> {
                                            let v207 = bit_array.to_string(v206)
                                            let v208 = method258()
                                            let v209 = method259()
                                            let v210 = case v207 { Ok(x) -> v208(x) Error(x) -> v209(x) }
                                            case v210  {
                                                Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                                Us56Ok(v211) -> v211
                                            }
                                        }
                                    }
                                let v219 = "\r\n"
                                let v220 = "\n"
                                let v221 = v218 |> string.replace(v219, v220)
                                let v222 = v221 == ""
                                let v225 =
                                    case v222 {
                                        True -> Uh3Nil
                                        False -> split_list_2(v220, v221)
                                    }
                                let v226 = Uh3Nil
                                method392(v225, v226)
                            }
                        }
                    case v228  {
                        Uh3Cons(v229, v230) -> {
                            let v231 = Uh8Nil
                            let v232 = method393(v196, v228, v231)
                            let v233 = erlang_term_coerce(v229)
                            let v234 = "filename"
                            let v235 = atom.create(v234)
                            let v236 = "absname"
                            let v237 = atom.create(v236)
                            let v238 = []
                            let v239 = [v233, ..v238]
                            let v240 = erlang_term_apply(v235, v237, v239)
                            let v241 = atom.create(v103)
                            let v242 = atom.create(v105)
                            let v243 = []
                            let v244 = [v240, ..v243]
                            let v245 = erlang_term_apply(v241, v242, v244)
                            let v246 = erlang_term_coerce(v245)
                            let v247 = erlang_term_coerce(v246)
                            let v248 = atom.create(v234)
                            let v249 = "dirname"
                            let v250 = atom.create(v249)
                            let v251 = []
                            let v252 = [v247, ..v251]
                            let v253 = erlang_term_apply(v248, v250, v252)
                            let v254 = atom.create(v103)
                            let v255 = atom.create(v105)
                            let v256 = []
                            let v257 = [v253, ..v256]
                            let v258 = erlang_term_apply(v254, v255, v257)
                            let v259 = erlang_term_coerce(v258)
                            #(v232, v259)
                        }
                        Uh3Nil -> {
                            let v260 = Uh8Nil
                            let v261 = "."
                            #(v260, v261)
                        }
                    }
                }
            }
        let v272 = "atomics"
        let v273 = atom.create(v272)
        let v274 = erlang_term_coerce(v273)
        let v275 = []
        let v276 = [v274, ..v275]
        let v277 = erlang_term_coerce(v276)
        let v278 = erlang_term_coerce(2)
        let v279 = "counters"
        let v280 = atom.create(v279)
        let v281 = "new"
        let v282 = atom.create(v281)
        let v283 = []
        let v284 = [v277, ..v283]
        let v285 = [v278, ..v284]
        let v286 = erlang_term_apply(v280, v282, v285)
        let v287 = Uh3Nil
        let v288 = -1
        let v289 = 0
        let v290 = 0
        let v291 = False
        let v292 = 1
        let v293 = 8
        let v294 = 3
        let v295 = 2
        let v296 = 100
        let v297 = Us29FakeExecutor
        let v298 = 4
        let v299 = Us30NoEviction
        let v300 = 0
        let v301 = False
        let v302 = False
        let v303 = flags_parsed_235(v116, v117, v287, v119, v288, v289, v290, v119, v291, v292, v293, v294, v295, v296, v119, v119, v297, v298, v299, v300, v301, v302, v115)
        let v336 =
            case v303  {
                Us33Error(v333) -> Us36RunRejected(v333)
                Us33Ok(v304, v305, v306, v307, v308, v309, v310, v311, v312, v313, v314, v315, v316, v317, v318, v319, v320, v321, v322, v323) -> {
                    let v324 = 0
                    let v325 = method20(v304, v324)
                    let v326 = v325 == 0
                    let v328 =
                        case v326 {
                            True -> {
                                let v327 = v305 == ""
                                v327
                            }
                            False -> False
                        }
                    case v328 {
                        True -> {
                            let v329 = "missing --spi or --spi-file"
                            Us36RunRejected(v329)
                        }
                        False -> Us36RunParsed(v304, v305, v306, v307, v308, v309, v310, v311, v312, v313, v314, v315, v316, v317, v318, v319, v320, v321, v322, v323)
                    }
                }
            }
        let v513 =
            case v336  {
                Us36RunParsed(v337, v338, v339, v340, v341, v342, v343, v344, v345, v346, v347, v348, v349, v350, v351, v352, v353, v354, v355, v356) -> {
                    let #(v411, v412, v413, _v414, _v415, _v416, v417) =
                        case v351  {
                            Us29FakeExecutor -> {
                                let v357 = closure35(Nil)
                                let v358 = closure36(Nil)
                                let v359 = closure37(Nil)
                                let v360 = quiet_c38(Nil)
                                let v361 = closure39(Nil)
                                #(v357, v358, False, v359, v360, v360, v361)
                            }
                            _ -> {
                                let #(v404, v405, v406, v407, v408, v409, v410) =
                                    case v351  {
                                        Us29CellsExecutor -> {
                                            let v362 = closure69(#(v271, v355, v286))
                                            let v363 = closure72(#(v271))
                                            let v364 = closure37(Nil)
                                            let v365 = quiet_c38(Nil)
                                            let v366 = closure39(Nil)
                                            #(v362, v363, True, v364, v365, v365, v366)
                                        }
                                        _ -> {
                                            let #(v397, v398, v399, v400, v401, v402, v403) =
                                                case v351  {
                                                    Us29LeakingExecutor -> {
                                                        let v367 = actor.new(v119)
                                                        let v368 = closure73(Nil)
                                                        let v369 = actor.on_message(v367, fn(state, message) { v368(state)(message) })
                                                        let v370 = actor.start(v369)
                                                        let v371 = result.is_ok(v370)
                                                        let v375 =
                                                            case v371 {
                                                                True -> {
                                                                    let v372 = result.lazy_unwrap(v370, fn() { panic }).data
                                                                    Us69Some(v372)
                                                                }
                                                                False -> Us69None
                                                            }
                                                        let v380 =
                                                            case v375  {
                                                                Us69None -> closure75(Nil)
                                                                Us69Some(v376) -> closure76(#(v376))
                                                            }
                                                        let v381 = actor.new(v119)
                                                        let v382 = actor.on_message(v381, fn(state, message) { v368(state)(message) })
                                                        let v383 = actor.start(v382)
                                                        let v384 = result.is_ok(v383)
                                                        let v388 =
                                                            case v384 {
                                                                True -> {
                                                                    let v385 = result.lazy_unwrap(v383, fn() { panic }).data
                                                                    Us69Some(v385)
                                                                }
                                                                False -> Us69None
                                                            }
                                                        let v393 =
                                                            case v388  {
                                                                Us69None -> closure78(Nil)
                                                                Us69Some(v389) -> closure76(#(v389))
                                                            }
                                                        let v394 = closure37(Nil)
                                                        let v395 = quiet_c38(Nil)
                                                        let v396 = closure39(Nil)
                                                        #(v380, v393, False, v394, v395, v395, v396)
                                                    }
                                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                }
                                            #(v397, v398, v399, v400, v401, v402, v403)
                                        }
                                    }
                                #(v404, v405, v406, v407, v408, v409, v410)
                            }
                        }
                    let v420 =
                        case v355 {
                            True -> closure79(#(v271, v286, v271, v286))
                            False -> closure80(Nil)
                        }
                    let v502 =
                        case v356 {
                            True -> {
                                let v421 = "Elixir.System"
                                let v422 = atom.create(v421)
                                let v423 = "tmp_dir!"
                                let v424 = atom.create(v423)
                                let v425 = []
                                let v426 = erlang_term_apply(v422, v424, v425)
                                let v427 = erlang_term_coerce(v426)
                                let v428 = "/xsim-tree-sample-"
                                let v429 = v427 <> v428 
                                let v430 = atom.create(v421)
                                let v431 = "pid"
                                let v432 = atom.create(v431)
                                let v433 = []
                                let v434 = erlang_term_apply(v430, v432, v433)
                                let v435 = erlang_term_coerce(v434)
                                let v436 = v429 <> v435 
                                let v437 = ".ps1"
                                let v438 = v436 <> v437 
                                let v439 = "\n"
                                let v440 = "param([int]%Root)"
                                let v441 = "%all = @(Get-CimInstance Win32_Process)"
                                let v442 = "if (-not (%all | ? ProcessId -eq %Root)) { exit 0 }"
                                let v443 = "%tree = [Collections.Generic.List[int]]::new()"
                                let v444 = "%tree.Add(%Root)"
                                let v445 = "for (%i = 0; %i -lt %tree.Count; %i++) {"
                                let v446 = "  foreach (%p in %all) {"
                                let v447 = "    %kid = [int]%p.ProcessId"
                                let v448 = "    %up = %p.ParentProcessId -eq %tree[%i]"
                                let v449 = "    if (%up -and %kid -ne %tree[%i]) { %tree.Add(%kid) }"
                                let v450 = "  }"
                                let v451 = "}"
                                let v452 = "%mine = %all | ? { %tree.Contains([int]%_.ProcessId) }"
                                let v453 = "%bytes = (%mine | Measure-Object WorkingSetSize -Sum).Sum"
                                let v454 = "\"%(%tree.Count) %([int64](%bytes / 1MB))\""
                                let v455 = Uh3Nil
                                let v456 = Uh3Cons(v454, v455)
                                let v457 = Uh3Cons(v453, v456)
                                let v458 = Uh3Cons(v452, v457)
                                let v459 = Uh3Cons(v451, v458)
                                let v460 = Uh3Cons(v450, v459)
                                let v461 = Uh3Cons(v449, v460)
                                let v462 = Uh3Cons(v448, v461)
                                let v463 = Uh3Cons(v447, v462)
                                let v464 = Uh3Cons(v446, v463)
                                let v465 = Uh3Cons(v445, v464)
                                let v466 = Uh3Cons(v444, v465)
                                let v467 = Uh3Cons(v443, v466)
                                let v468 = Uh3Cons(v442, v467)
                                let v469 = Uh3Cons(v441, v468)
                                let v470 = Uh3Cons(v440, v469)
                                let v471 = concat_balanced_22(v439, v470)
                                let v472 = "%"
                                let v473 = "$"
                                let v474 = v471 |> string.replace(v472, v473)
                                let v475 = spiral_fs_write_file(v438, v474)
                                let v476 = spiral_fs_coerce(v475)
                                let v477 = atom.create(v20)
                                let v478 = v476 == v477
                                let v479 = v478 == False
                                case v479 {
                                    True -> panic as "file_system.write_all_text: the write failed"
                                    False -> Nil
                                }
                                let v480 = closure81(#(v438))
                                let v481 = actor.new_with_initialiser(10000, fn(me) { Ok(actor.initialised(v480(me)) |> actor.returning(me)) })
                                let v482 = closure84(Nil)
                                let v483 = actor.on_message(v481, fn(state, message) { v482(state)(message) })
                                let v484 = actor.start(v483)
                                let v485 = result.is_ok(v484)
                                let v489 =
                                    case v485 {
                                        True -> {
                                            let v486 = result.lazy_unwrap(v484, fn() { panic }).data
                                            Us74Some(v486)
                                        }
                                        False -> Us74None
                                    }
                                let v495 =
                                    case v489  {
                                        Us74None -> Us74None
                                        Us74Some(v490) -> {
                                            let v491 = Us70Tick
                                            actor.send(v490, v491)
                                            Us74Some(v490)
                                        }
                                    }
                                case v495  {
                                    Us74None -> closure86(Nil)
                                    Us74Some(v496) -> closure87(#(v496))
                                }
                            }
                            False -> closure89(Nil)
                        }
                    let v503 = closure90(#(v420, v502))
                    let v504 = closure91(Nil)
                    let v505 = closure92(Nil)
                    let v506 = simulated_by_304(v411, v412, v413, v503, v504, v505, v417, v337, v338, v339, v340, v341, v342, v343, v344, v345, v346, v347, v348, v349, v350, v351, v352, v353, v354, v355, v356, v270)
                    let v507 = "\n"
                    delimited_21(v507, v506)
                }
                Us36RunRejected(v509) -> {
                    let v510 = "XSIM rejected "
                    let v511 = v510 <> v509 
                    v511
                }
            }
        let v514 = "\n"
        let v515 = v513 <> v514 
        let v516 = erlang_term_coerce(v515)
        let v517 = "io"
        let v518 = atom.create(v517)
        let v519 = "put_chars"
        let v520 = atom.create(v519)
        let v521 = []
        let v522 = [v516, ..v521]
        let _v523 = erlang_term_apply(v518, v520, v522)
        let v524 = v513 == ""
        let v527 =
            case v524 {
                True -> Uh3Nil
                False -> split_list_2(v514, v513)
            }
        let v528 = method398()
        let v529 = method399(v528, v527)
        case v529 {
            True -> 1
            False -> 0
        }
    }
}

pub fn closure114(capt: #(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us80 {
    fn (v10) {
        let #(v0, v1, v2, v3, v4, v5, v6, _v7, v8, v9) = capt
        let v11 = v10 == "frames"
        case v11 {
            True -> Us80Some(v0, v1, v2, v3, v4, v5, v6, True, v8, v9)
            False -> Us80None
        }
    }
}

pub fn closure113(capt: Nil) -> fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us80 {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9) = dom
        closure114(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9))
    }
}

pub fn closure117(capt: #(String, Int, Int, Int, Int, String, Int, Bool, String, String, String)) -> fn(String) -> Us81 {
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
                        Us81Error(v61)
                    }
                    Us3Some(v56) -> Us81Ok(v0, v1, v2, v3, v4, v5, v56, v7, v8, v9)
                }
            }
            False -> {
                let v65 = v10 == "spi"
                let v71 =
                    case v65 {
                        True -> Us80Some(v11, v1, v2, v3, v4, v5, v6, v7, v8, v9)
                        False -> {
                            let v67 = v10 == "personas"
                            case v67 {
                                True -> Us80Some(v0, v1, v2, v3, v4, v11, v6, v7, v8, v9)
                                False -> Us80None
                            }
                        }
                    }
                let v72 = v10 == "out"
                let v78 =
                    case v72 {
                        True -> Us80Some(v0, v1, v2, v3, v4, v5, v6, v7, v11, v9)
                        False -> {
                            let v74 = v10 == "expected"
                            case v74 {
                                True -> Us80Some(v0, v1, v2, v3, v4, v5, v6, v7, v8, v11)
                                False -> Us80None
                            }
                        }
                    }
                let v90 =
                    case v71  {
                        Us80None -> v78
                        Us80Some(v79, v80, v81, v82, v83, v84, v85, v86, v87, v88) -> v71
                    }
                case v90  {
                    Us80None -> {
                        let v102 = v10 == "cells"
                        let v118 =
                            case v102 {
                                True -> {
                                    let v103 = Us82EventsCells
                                    Us83Some(v103)
                                }
                                False -> {
                                    let v105 = v10 == "seed"
                                    case v105 {
                                        True -> {
                                            let v106 = Us82EventsSeed
                                            Us83Some(v106)
                                        }
                                        False -> {
                                            let v108 = v10 == "users"
                                            case v108 {
                                                True -> {
                                                    let v109 = Us82EventsUsers
                                                    Us83Some(v109)
                                                }
                                                False -> {
                                                    let v111 = v10 == "edits"
                                                    case v111 {
                                                        True -> {
                                                            let v112 = Us82EventsEdits
                                                            Us83Some(v112)
                                                        }
                                                        False -> Us83None
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        case v118  {
                            Us83None -> {
                                let v173 = "unknown option --"
                                let v174 = v173 <> v10 
                                Us81Error(v174)
                            }
                            Us83Some(v119) -> {
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
                                        Us81Error(v169)
                                    }
                                    Us3Some(v121) -> {
                                        let #(v152, v153, v154, v155, v156, v157, v158, v159, v160, v161) =
                                            case v119  {
                                                Us82EventsCells -> #(v0, v121, v2, v3, v4, v5, v6, v7, v8, v9)
                                                _ -> {
                                                    let #(v142, v143, v144, v145, v146, v147, v148, v149, v150, v151) =
                                                        case v119  {
                                                            Us82EventsSeed -> #(v0, v1, v121, v3, v4, v5, v6, v7, v8, v9)
                                                            _ -> {
                                                                let #(v132, v133, v134, v135, v136, v137, v138, v139, v140, v141) =
                                                                    case v119  {
                                                                        Us82EventsUsers -> #(v0, v1, v2, v121, v4, v5, v6, v7, v8, v9)
                                                                        _ -> {
                                                                            let #(v122, v123, v124, v125, v126, v127, v128, v129, v130, v131) =
                                                                                case v119  {
                                                                                    Us82EventsEdits -> #(v0, v1, v2, v3, v121, v5, v6, v7, v8, v9)
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
                                        Us81Ok(v152, v153, v154, v155, v156, v157, v158, v159, v160, v161)
                                    }
                                }
                            }
                        }
                    }
                    Us80Some(v91, v92, v93, v94, v95, v96, v97, v98, v99, v100) -> Us81Ok(v91, v92, v93, v94, v95, v96, v97, v98, v99, v100)
                }
            }
        }
    }
}

pub fn closure116(capt: #(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us81 {
    fn (v10) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9) = capt
        closure117(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10))
    }
}

pub fn closure115(capt: Nil) -> fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us81 {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9) = dom
        closure116(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9))
    }
}

pub fn valued_then_402(v0: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us80, v1: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us81, v2: String, v3: Int, v4: Int, v5: Int, v6: Int, v7: String, v8: Int, v9: Bool, v10: String, v11: String, v12: String, v13: Uh3) -> Us81 {
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
            continued_403(v0, v1, v27, v15)
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
            Us81Error(v40)
        }
    }
}

pub fn arg_parsed_401(v0: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us80, v1: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us81, v2: String, v3: Int, v4: Int, v5: Int, v6: Int, v7: String, v8: Int, v9: Bool, v10: String, v11: String, v12: String, v13: Uh3) -> Us81 {
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
        Us80None -> valued_then_402(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
        Us80Some(v25, v26, v27, v28, v29, v30, v31, v32, v33, v34) -> flags_parsed_400(v0, v1, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v13)
    }
}

pub fn flags_parsed_400(v0: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us80, v1: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us81, v2: String, v3: Int, v4: Int, v5: Int, v6: Int, v7: String, v8: Int, v9: Bool, v10: String, v11: String, v12: Uh3) -> Us81 {
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
                    Us81Error(v29)
                }
                False -> arg_parsed_401(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v14, v15)
            }
        }
        Uh3Nil -> Us81Ok(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
    }
}

pub fn continued_403(v0: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> Us80, v1: fn(#(String, Int, Int, Int, Int, String, Int, Bool, String, String)) -> fn(String) -> fn(String) -> Us81, v2: Us81, v3: Uh3) -> Us81 {
    case v2  {
        Us81Error(v15) -> Us81Error(v15)
        Us81Ok(v4, v5, v6, v7, v8, v9, v10, v11, v12, v13) -> flags_parsed_400(v0, v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v3)
    }
}

pub fn method404(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method404(v3, v1)
            let v5 = v2 != ""
            case v5 {
                True -> Uh3Cons(v2, v4)
                False -> v4
            }
        }
        Uh3Nil -> v1
    }
}
