import envoy
import gleam/bit_array
import gleam/erlang/atom
import gleam/otp/actor
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh8, type Uh29, type Us84, Uh29Cons, Uh29Nil, Uh3Cons, Uh3Nil, Uh8Cons, Uh8Nil, Us29CellsExecutor, Us29FakeExecutor, Us29LeakingExecutor, Us30NoEviction, Us33Error, Us33Ok, Us36RunParsed, Us36RunRejected, Us56Error, Us56Ok, Us69None, Us69Some, Us70Tick, Us78None, Us78Some, Us80Error, Us80Ok, Us84None, Us84Some, Us85Replied, Us85Unreachable}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_fs_coerce, spiral_fs_is_regular, spiral_fs_read_file, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part11.{closure39}
import xsim_frames/part12.{closure69, closure70, closure71, closure73, closure74, closure76, closure77, closure78, items_from_301}
import xsim_frames/part13.{closure79, closure82, closure84}
import xsim_frames/part14.{closure85, closure87, closure88, closure89, closure90}
import xsim_frames/part16.{method370, method371}
import xsim_frames/part17.{simulated_by_308}
import xsim_frames/part2.{concat_balanced_22, delimited_21, method20, taken_31}
import xsim_frames/part3.{method56, method57, method60}
import xsim_frames/part5.{controls_from_120}
import xsim_frames/part8.{closure30}
import xsim_frames/part9.{closure32, closure35, closure36, closure37, flags_parsed_235, method258, method259, quiet_c38}

pub fn closure29(capt: Nil) -> fn(#(String, String, String)) -> String {
    fn (dom) {
        let #(v0, v1, v2) = dom
        let v4 = atom.create("atomics")
        let v5 = erlang_term_coerce(v4)
        let v6 = []
        let v7 = [v5, ..v6]
        let v8 = erlang_term_coerce(v7)
        let v9 = erlang_term_coerce(2)
        let v11 = atom.create("counters")
        let v13 = atom.create("new")
        let v14 = []
        let v15 = [v8, ..v14]
        let v16 = [v9, ..v15]
        let v17 = erlang_term_apply(v11, v13, v16)
        let v18 = unicode_erlang_characters_to_binary([0])
        let v19 = v0 == ""
        let v22 =
            case v19 {
                True -> Uh3Nil
                False -> split_list_2(v18, v0)
            }
        let v23 = unicode_erlang_characters_to_binary([1])
        let v24 = split_list_2(v23, v1)
        let v25 = unicode_erlang_characters_to_binary([0])
        let v27 = method60(v25, v24, Uh8Nil)
        let v28 = closure30(Nil)
        let v29 = closure32(Nil)
        let v31 = ""
        let v47 = flags_parsed_235(v28, v29, Uh3Nil, v31, -1, 0, 0, v31, False, 1, 8, 3, 2, 100, v31, v31, Us29FakeExecutor, 4, Us30NoEviction, 0, False, False, v22)
        let v80 =
            case v47  {
                Us33Error(v77) -> Us36RunRejected(v77)
                Us33Ok(v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67) -> {
                    let v69 = method20(v48, 0)
                    let v70 = v69 == 0
                    let v72 =
                        case v70 {
                            True -> {
                                v49 == ""
                            }
                            False -> False
                        }
                    case v72 {
                        True -> {
                            Us36RunRejected("missing --spi or --spi-file")
                        }
                        False -> Us36RunParsed(v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67)
                    }
                }
            }
        case v80  {
            Us36RunParsed(v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100) -> {
                let #(v155, v156, v157, _v158, _v159, _v160, v161) =
                    case v95  {
                        Us29FakeExecutor -> {
                            let v101 = closure35(Nil)
                            let v102 = closure36(Nil)
                            let v103 = closure37(Nil)
                            let v104 = quiet_c38(Nil)
                            let v105 = closure39(Nil)
                            #(v101, v102, False, v103, v104, v104, v105)
                        }
                        _ -> {
                            let #(v148, v149, v150, v151, v152, v153, v154) =
                                case v95  {
                                    Us29CellsExecutor -> {
                                        let v106 = closure69(#(v2, v99, v17))
                                        let v107 = closure70(#(v2))
                                        let v108 = closure37(Nil)
                                        let v109 = quiet_c38(Nil)
                                        let v110 = closure39(Nil)
                                        #(v106, v107, True, v108, v109, v109, v110)
                                    }
                                    _ -> {
                                        let #(v141, v142, v143, v144, v145, v146, v147) =
                                            case v95  {
                                                Us29LeakingExecutor -> {
                                                    let v111 = actor.new(v31)
                                                    let v112 = closure71(Nil)
                                                    let v113 = actor.on_message(v111, fn(state, message) { v112(state)(message) })
                                                    let v114 = actor.start(v113)
                                                    let v115 = result.is_ok(v114)
                                                    let v119 =
                                                        case v115 {
                                                            True -> {
                                                                let v116 = result.lazy_unwrap(v114, fn() { panic }).data
                                                                Us69Some(v116)
                                                            }
                                                            False -> Us69None
                                                        }
                                                    let v124 =
                                                        case v119  {
                                                            Us69None -> closure73(Nil)
                                                            Us69Some(v120) -> closure74(#(v120))
                                                        }
                                                    let v125 = actor.new(v31)
                                                    let v126 = actor.on_message(v125, fn(state, message) { v112(state)(message) })
                                                    let v127 = actor.start(v126)
                                                    let v128 = result.is_ok(v127)
                                                    let v132 =
                                                        case v128 {
                                                            True -> {
                                                                let v129 = result.lazy_unwrap(v127, fn() { panic }).data
                                                                Us69Some(v129)
                                                            }
                                                            False -> Us69None
                                                        }
                                                    let v137 =
                                                        case v132  {
                                                            Us69None -> closure76(Nil)
                                                            Us69Some(v133) -> closure74(#(v133))
                                                        }
                                                    let v138 = closure37(Nil)
                                                    let v139 = quiet_c38(Nil)
                                                    let v140 = closure39(Nil)
                                                    #(v124, v137, False, v138, v139, v139, v140)
                                                }
                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                            }
                                        #(v141, v142, v143, v144, v145, v146, v147)
                                    }
                                }
                            #(v148, v149, v150, v151, v152, v153, v154)
                        }
                    }
                let v164 =
                    case v99 {
                        True -> closure77(#(v2, v17, v2, v17))
                        False -> closure78(Nil)
                    }
                let v245 =
                    case v100 {
                        True -> {
                            let v165 = "Elixir.System"
                            let v166 = atom.create(v165)
                            let v168 = atom.create("tmp_dir!")
                            let v169 = []
                            let v170 = erlang_term_apply(v166, v168, v169)
                            let v171 = erlang_term_coerce(v170)
                            let v172 = { v171 } <> { "/xsim-tree-sample-" }
                            let v173 = atom.create(v165)
                            let v175 = atom.create("pid")
                            let v176 = []
                            let v177 = erlang_term_apply(v173, v175, v176)
                            let v178 = erlang_term_coerce(v177)
                            let v179 = { v172 } <> { v178 }
                            let v180 = { v179 } <> { ".ps1" }
                            let v198 = Uh3Cons("\"%(%tree.Count) %([int64](%bytes / 1MB))\"", Uh3Nil)
                            let v199 = Uh3Cons("%bytes = (%mine | Measure-Object WorkingSetSize -Sum).Sum", v198)
                            let v200 = Uh3Cons("%mine = %all | ? { %tree.Contains([int]%_.ProcessId) }", v199)
                            let v201 = Uh3Cons("}", v200)
                            let v202 = Uh3Cons("  }", v201)
                            let v203 = Uh3Cons("    if (%up -and %kid -ne %tree[%i]) { %tree.Add(%kid) }", v202)
                            let v204 = Uh3Cons("    %up = %p.ParentProcessId -eq %tree[%i]", v203)
                            let v205 = Uh3Cons("    %kid = [int]%p.ProcessId", v204)
                            let v206 = Uh3Cons("  foreach (%p in %all) {", v205)
                            let v207 = Uh3Cons("for (%i = 0; %i -lt %tree.Count; %i++) {", v206)
                            let v208 = Uh3Cons("%tree.Add(%Root)", v207)
                            let v209 = Uh3Cons("%tree = [Collections.Generic.List[int]]::new()", v208)
                            let v210 = Uh3Cons("if (-not (%all | ? ProcessId -eq %Root)) { exit 0 }", v209)
                            let v211 = Uh3Cons("%all = @(Get-CimInstance Win32_Process)", v210)
                            let v212 = Uh3Cons("param([int]%Root)", v211)
                            let v213 = concat_balanced_22("\n", v212)
                            let v216 = v213 |> string.replace("%", "$")
                            let v217 = spiral_fs_write_file(v180, v216)
                            let v218 = spiral_fs_coerce(v217)
                            let v220 = atom.create("ok")
                            let v221 = v218 == v220
                            let v222 = v221 == False
                            case v222 {
                                True -> panic as "file_system.write_all_text: the write failed"
                                False -> Nil
                            }
                            let v223 = closure79(#(v180))
                            let v224 = actor.new_with_initialiser(10000, fn(me) { Ok(actor.initialised(v223(me)) |> actor.returning(me)) })
                            let v225 = closure82(Nil)
                            let v226 = actor.on_message(v224, fn(state, message) { v225(state)(message) })
                            let v227 = actor.start(v226)
                            let v228 = result.is_ok(v227)
                            let v232 =
                                case v228 {
                                    True -> {
                                        let v229 = result.lazy_unwrap(v227, fn() { panic }).data
                                        Us78Some(v229)
                                    }
                                    False -> Us78None
                                }
                            let v238 =
                                case v232  {
                                    Us78None -> Us78None
                                    Us78Some(v233) -> {
                                        actor.send(v233, Us70Tick)
                                        Us78Some(v233)
                                    }
                                }
                            case v238  {
                                Us78None -> closure84(Nil)
                                Us78Some(v239) -> closure85(#(v239))
                            }
                        }
                        False -> closure87(Nil)
                    }
                let v246 = closure88(#(v164, v245))
                let v247 = closure89(Nil)
                let v248 = closure90(Nil)
                let v249 = simulated_by_308(v155, v156, v157, v246, v247, v248, v161, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v27)
                delimited_21("\n", v249)
            }
            Us36RunRejected(v252) -> {
                let v253 = { "XSIM rejected " } <> { v252 }
                v253
            }
        }
    }
}

pub fn method396(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method396(v3, v1)
            let v6 = atom.create("unicode")
            let v8 = atom.create("characters_to_binary")
            let v9 = []
            let v10 = [v2, ..v9]
            let v11 = erlang_term_apply(v6, v8, v10)
            let v12 = erlang_term_coerce(v11)
            Uh3Cons(v12, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method397(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method397(v3, v1)
            let v5 = v2 != ""
            case v5 {
                True -> Uh3Cons(v2, v4)
                False -> v4
            }
        }
        Uh3Nil -> v1
    }
}

pub fn file_exists_399(v0: String) -> Bool {
    spiral_fs_is_regular(v0)
}

pub fn method400(v0: Uh29, v1: Uh29) -> Uh29 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method400(v3, v1)
            let v6 = atom.create("none")
            let v7 = erlang_term_coerce(v6)
            let v9 = atom.create("kind")
            let v10 = erlang_term_coerce(v9)
            let v11 = erlang_term_coerce(v10)
            let v12 = erlang_term_coerce(v7)
            let v14 = atom.create("maps")
            let v16 = atom.create("get")
            let v17 = []
            let v18 = [v12, ..v17]
            let v19 = [v2, ..v18]
            let v20 = [v11, ..v19]
            let v21 = erlang_term_apply(v14, v16, v20)
            let v22 = erlang_term_coerce(v21)
            let v24 = atom.create("spiral")
            let v25 = erlang_term_coerce(v24)
            let v26 = v22 == v25
            case v26 {
                True -> Uh29Cons(v2, v4)
                False -> v4
            }
        }
        Uh29Nil -> v1
    }
}

pub fn method401(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method401(v3, v1)
            let v6 = erlang_term_coerce("")
            let v8 = atom.create("source")
            let v9 = erlang_term_coerce(v8)
            let v10 = erlang_term_coerce(v9)
            let v11 = erlang_term_coerce(v6)
            let v13 = atom.create("maps")
            let v15 = atom.create("get")
            let v16 = []
            let v17 = [v11, ..v16]
            let v18 = [v2, ..v17]
            let v19 = [v10, ..v18]
            let v20 = erlang_term_apply(v13, v15, v19)
            let v21 = erlang_term_coerce(v20)
            let v22 = erlang_term_coerce(v21)
            Uh3Cons(v22, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method398(v0: Int, v1: Uh3, v2: Uh8) -> Uh8 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method398(v0, v4, v2)
            let v6 = spiral_fs_read_file(v3)
            let v7 = method370()
            let v8 = method371()
            let v9 = case v6 { Ok(x) -> v7(x) Error(x) -> v8(x) }
            let v22 =
                case v9  {
                    Us80Error(v19) -> panic as "file_system.read_all_text: file:read_file failed"
                    Us80Ok(v10) -> {
                        let v11 = bit_array.to_string(v10)
                        let v12 = method258()
                        let v13 = method259()
                        let v14 = case v11 { Ok(x) -> v12(x) Error(x) -> v13(x) }
                        case v14  {
                            Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                            Us56Ok(v15) -> v15
                        }
                    }
                }
            let v24 = v3 |> string.ends_with(".spi")
            let v29 =
                case v24 {
                    True -> {
                        let v25 = spiral_string_length(v3)
                        let v26 = spiral_wrap_signed(v25 - 4, 32)
                        let v27 = spiral_wrap_signed(v26 - 1, 32)
                        spiral_string_slice(v3, 0, v27)
                    }
                    False -> v3
                }
            let v30 = { v29 } <> { "_real.spir" }
            let v31 = file_exists_399(v30)
            let v50 =
                case v31 {
                    True -> {
                        let v32 = spiral_fs_read_file(v30)
                        let v33 = method370()
                        let v34 = method371()
                        let v35 = case v32 { Ok(x) -> v33(x) Error(x) -> v34(x) }
                        case v35  {
                            Us80Error(v45) -> panic as "file_system.read_all_text: file:read_file failed"
                            Us80Ok(v36) -> {
                                let v37 = bit_array.to_string(v36)
                                let v38 = method258()
                                let v39 = method259()
                                let v40 = case v37 { Ok(x) -> v38(x) Error(x) -> v39(x) }
                                case v40  {
                                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                    Us56Ok(v41) -> v41
                                }
                            }
                        }
                    }
                    False -> {
                        ""
                    }
                }
            let v51 = erlang_term_coerce(v22)
            let v52 = erlang_term_coerce(v50)
            let v54 = atom.create("Elixir.Spiral.Cells.Document")
            let v56 = atom.create("parse_spi")
            let v57 = []
            let v58 = [v52, ..v57]
            let v59 = [v51, ..v58]
            let v60 = erlang_term_apply(v54, v56, v59)
            let v61 = []
            let v62 = erlang_term_coerce(v61)
            let v64 = atom.create("cells")
            let v65 = erlang_term_coerce(v64)
            let v66 = erlang_term_coerce(v65)
            let v67 = erlang_term_coerce(v62)
            let v69 = atom.create("maps")
            let v71 = atom.create("get")
            let v72 = []
            let v73 = [v67, ..v72]
            let v74 = [v60, ..v73]
            let v75 = [v66, ..v74]
            let v76 = erlang_term_apply(v69, v71, v75)
            let v77 = erlang_term_coerce(v76)
            let v79 = atom.create("lists")
            let v81 = atom.create("reverse")
            let v82 = []
            let v83 = [v77, ..v82]
            let v84 = erlang_term_apply(v79, v81, v83)
            let v86 = items_from_301(v84, Uh29Nil)
            let v88 = method400(v86, Uh29Nil)
            let v90 = method401(v88, Uh3Nil)
            let v91 = v0 < 0
            let v93 =
                case v91 {
                    True -> v90
                    False -> taken_31(v0, v90)
                }
            Uh8Cons(v93, v5)
        }
        Uh3Nil -> v2
    }
}

pub fn get_environment_variable_404(v0: String) -> String {
    v0 |> envoy.get |> result.unwrap("")
}

pub fn session_403() -> Us84 {
    let v1 = get_environment_variable_404("IGGY_URL")
    let v2 = spiral_string_length(v1)
    let v4 = method56(v1, v2, 0)
    let v5 = spiral_wrap_signed(v2 - 1, 32)
    let v6 = spiral_string_slice(v1, v4, v5)
    let v7 = spiral_string_length(v6)
    let v8 = method57(v6, v7)
    let v9 = spiral_string_slice(v6, 0, v8)
    let v11 = get_environment_variable_404("IGGY_CA_FILE")
    let v12 = spiral_string_length(v11)
    let v14 = method56(v11, v12, 0)
    let v15 = spiral_wrap_signed(v12 - 1, 32)
    let v16 = spiral_string_slice(v11, v14, v15)
    let v17 = spiral_string_length(v16)
    let v18 = method57(v16, v17)
    let v19 = spiral_string_slice(v16, 0, v18)
    let v20 = v9 == ""
    case v20 {
        True -> Us84None
        False -> {
            let v22 = { v9 } <> { "/users/login" }
            let v24 = get_environment_variable_404("IGGY_USERNAME")
            let v25 = spiral_string_length(v24)
            let v27 = method56(v24, v25, 0)
            let v28 = spiral_wrap_signed(v25 - 1, 32)
            let v29 = spiral_string_slice(v24, v27, v28)
            let v30 = spiral_string_length(v29)
            let v31 = method57(v29, v30)
            let v32 = spiral_string_slice(v29, 0, v31)
            let v33 = "\\"
            let v34 = "\\\\"
            let v35 = v32 |> string.replace(v33, v34)
            let v36 = "\""
            let v37 = "\\\""
            let v38 = v35 |> string.replace(v36, v37)
            let v40 = controls_from_120(0, v38)
            let v41 = ""
            let v43 = Uh3Cons(v36, Uh3Nil)
            let v44 = Uh3Cons(v40, v43)
            let v45 = Uh3Cons(v36, v44)
            let v46 = concat_balanced_22(v41, v45)
            let v47 = { "{\"username\":" } <> { v46 }
            let v48 = { v47 } <> { ",\"password\":" }
            let v50 = get_environment_variable_404("IGGY_PASSWORD")
            let v51 = spiral_string_length(v50)
            let v53 = method56(v50, v51, 0)
            let v54 = spiral_wrap_signed(v51 - 1, 32)
            let v55 = spiral_string_slice(v50, v53, v54)
            let v56 = spiral_string_length(v55)
            let v57 = method57(v55, v56)
            let v58 = spiral_string_slice(v55, 0, v57)
            let v59 = v58 |> string.replace(v33, v34)
            let v60 = v59 |> string.replace(v36, v37)
            let v62 = controls_from_120(0, v60)
            let v64 = Uh3Cons(v36, Uh3Nil)
            let v65 = Uh3Cons(v62, v64)
            let v66 = Uh3Cons(v36, v65)
            let v67 = concat_balanced_22(v41, v66)
            let v68 = { v48 } <> { v67 }
            let v69 = { v68 } <> { "}" }
            let v71 = atom.create("inets")
            let v72 = erlang_term_coerce(v71)
            let v73 = "application"
            let v74 = atom.create(v73)
            let v75 = "ensure_all_started"
            let v76 = atom.create(v75)
            let v77 = []
            let v78 = [v72, ..v77]
            let _v79 = erlang_term_apply(v74, v76, v78)
            let v80 = "ssl"
            let v81 = atom.create(v80)
            let v82 = erlang_term_coerce(v81)
            let v83 = atom.create(v73)
            let v84 = atom.create(v75)
            let v85 = []
            let v86 = [v82, ..v85]
            let _v87 = erlang_term_apply(v83, v84, v86)
            let v89 = erlang_term_coerce("application/json")
            let v90 = "unicode"
            let v91 = atom.create(v90)
            let v92 = "characters_to_list"
            let v93 = atom.create(v92)
            let v94 = []
            let v95 = [v89, ..v94]
            let v96 = erlang_term_apply(v91, v93, v95)
            let v97 = erlang_term_coerce(v22)
            let v98 = atom.create(v90)
            let v99 = atom.create(v92)
            let v100 = []
            let v101 = [v97, ..v100]
            let v102 = erlang_term_apply(v98, v99, v101)
            let v103 = []
            let v104 = erlang_term_coerce(v103)
            let v105 = erlang_term_coerce(v69)
            let v106 = []
            let v107 = [v105, ..v106]
            let v108 = [v96, ..v107]
            let v109 = [v104, ..v108]
            let v110 = [v102, ..v109]
            let v111 = erlang_term_tuple(v110)
            let v113 = atom.create("post")
            let v114 = erlang_term_coerce(v113)
            let v115 = erlang_term_coerce(10000)
            let v117 = atom.create("timeout")
            let v118 = erlang_term_coerce(v117)
            let v119 = []
            let v120 = [v115, ..v119]
            let v121 = [v118, ..v120]
            let v122 = erlang_term_tuple(v121)
            let v123 = v19 == ""
            let v164 =
                case v123 {
                    True -> {
                        let v124 = []
                        let v125 = [v122, ..v124]
                        erlang_term_coerce(v125)
                    }
                    False -> {
                        let v128 = atom.create("verify")
                        let v129 = erlang_term_coerce(v128)
                        let v131 = atom.create("verify_peer")
                        let v132 = erlang_term_coerce(v131)
                        let v133 = []
                        let v134 = [v132, ..v133]
                        let v135 = [v129, ..v134]
                        let v136 = erlang_term_tuple(v135)
                        let v138 = atom.create("cacertfile")
                        let v139 = erlang_term_coerce(v138)
                        let v140 = erlang_term_coerce(v19)
                        let v141 = atom.create(v90)
                        let v142 = atom.create(v92)
                        let v143 = []
                        let v144 = [v140, ..v143]
                        let v145 = erlang_term_apply(v141, v142, v144)
                        let v146 = []
                        let v147 = [v145, ..v146]
                        let v148 = [v139, ..v147]
                        let v149 = erlang_term_tuple(v148)
                        let v150 = []
                        let v151 = [v149, ..v150]
                        let v152 = [v136, ..v151]
                        let v153 = erlang_term_coerce(v152)
                        let v154 = atom.create(v80)
                        let v155 = erlang_term_coerce(v154)
                        let v156 = []
                        let v157 = [v153, ..v156]
                        let v158 = [v155, ..v157]
                        let v159 = erlang_term_tuple(v158)
                        let v160 = []
                        let v161 = [v159, ..v160]
                        let v162 = [v122, ..v161]
                        erlang_term_coerce(v162)
                    }
                }
            let v166 = atom.create("body_format")
            let v167 = erlang_term_coerce(v166)
            let v169 = atom.create("binary")
            let v170 = erlang_term_coerce(v169)
            let v171 = []
            let v172 = [v170, ..v171]
            let v173 = [v167, ..v172]
            let v174 = erlang_term_tuple(v173)
            let v175 = []
            let v176 = [v174, ..v175]
            let v177 = erlang_term_coerce(v176)
            let v179 = atom.create("httpc")
            let v181 = atom.create("request")
            let v182 = []
            let v183 = [v177, ..v182]
            let v184 = [v164, ..v183]
            let v185 = [v111, ..v184]
            let v186 = [v114, ..v185]
            let v187 = erlang_term_apply(v179, v181, v186)
            let v188 = "erlang"
            let v189 = atom.create(v188)
            let v191 = atom.create("is_tuple")
            let v192 = []
            let v193 = [v187, ..v192]
            let v194 = erlang_term_apply(v189, v191, v193)
            let v195 = erlang_term_coerce(v194)
            let v208 =
                case v195 {
                    True -> {
                        let v196 = erlang_term_coerce(1)
                        let v197 = atom.create(v188)
                        let v199 = atom.create("element")
                        let v200 = []
                        let v201 = [v187, ..v200]
                        let v202 = [v196, ..v201]
                        let v203 = erlang_term_apply(v197, v199, v202)
                        let v205 = atom.create("ok")
                        let v206 = erlang_term_coerce(v205)
                        v203 == v206
                    }
                    False -> False
                }
            let v243 =
                case v208 {
                    True -> {
                        let v209 = erlang_term_coerce(2)
                        let v210 = atom.create(v188)
                        let v211 = "element"
                        let v212 = atom.create(v211)
                        let v213 = []
                        let v214 = [v187, ..v213]
                        let v215 = [v209, ..v214]
                        let v216 = erlang_term_apply(v210, v212, v215)
                        let v217 = erlang_term_coerce(1)
                        let v218 = atom.create(v188)
                        let v219 = atom.create(v211)
                        let v220 = []
                        let v221 = [v216, ..v220]
                        let v222 = [v217, ..v221]
                        let v223 = erlang_term_apply(v218, v219, v222)
                        let v224 = erlang_term_coerce(2)
                        let v225 = atom.create(v188)
                        let v226 = atom.create(v211)
                        let v227 = []
                        let v228 = [v223, ..v227]
                        let v229 = [v224, ..v228]
                        let v230 = erlang_term_apply(v225, v226, v229)
                        let v231 = erlang_term_coerce(v230)
                        let v232 = erlang_term_coerce(3)
                        let v233 = atom.create(v188)
                        let v234 = atom.create(v211)
                        let v235 = []
                        let v236 = [v216, ..v235]
                        let v237 = [v232, ..v236]
                        let v238 = erlang_term_apply(v233, v234, v237)
                        let v239 = erlang_term_coerce(v238)
                        Us85Replied(v231, v239)
                    }
                    False -> {
                        let v241 = string.inspect(v187)
                        Us85Unreachable(v241)
                    }
                }
            let v248 =
                case v243  {
                    Us85Replied(v244, v245) -> v244
                    Us85Unreachable(v246) -> 0
                }
            let v253 =
                case v243  {
                    Us85Replied(v249, v250) -> v250
                    Us85Unreachable(v251) -> v41
                }
            let v254 = v248 == 200
            case v254 {
                True -> {
                    let v255 = erlang_term_coerce(v253)
                    let v257 = atom.create("json")
                    let v259 = atom.create("decode")
                    let v260 = []
                    let v261 = [v255, ..v260]
                    let v262 = erlang_term_apply(v257, v259, v261)
                    let v263 = erlang_term_coerce(v41)
                    let v265 = erlang_term_coerce("access_token")
                    let v266 = erlang_term_coerce(v263)
                    let v267 = "maps"
                    let v268 = atom.create(v267)
                    let v269 = "get"
                    let v270 = atom.create(v269)
                    let v271 = []
                    let v272 = [v266, ..v271]
                    let v273 = [v262, ..v272]
                    let v274 = [v265, ..v273]
                    let v275 = erlang_term_apply(v268, v270, v274)
                    let v276 = erlang_term_coerce(v275)
                    let v277 = erlang_term_coerce(v41)
                    let v279 = erlang_term_coerce("token")
                    let v280 = erlang_term_coerce(v277)
                    let v281 = atom.create(v267)
                    let v282 = atom.create(v269)
                    let v283 = []
                    let v284 = [v280, ..v283]
                    let v285 = [v276, ..v284]
                    let v286 = [v279, ..v285]
                    let v287 = erlang_term_apply(v281, v282, v286)
                    let v288 = erlang_term_coerce(v287)
                    let v289 = erlang_term_coerce(v288)
                    let v290 = { "Bearer " } <> { v289 }
                    Us84Some(v9, v290, v19)
                }
                False -> Us84None
            }
        }
    }
}

pub fn method406(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method406(v3, v1)
            let v6 = v2 |> string.starts_with("XSIM seed=")
            case v6 {
                True -> Uh3Cons(v2, v4)
                False -> v4
            }
        }
        Uh3Nil -> v1
    }
}
