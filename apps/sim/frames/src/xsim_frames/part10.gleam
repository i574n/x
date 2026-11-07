import gleam/dict
import gleam/int
import xsim_frames/types.{type Uh3, type Us2, type Us17, type Us18, type Us16, type Uh15, type Us30, type Us45, type Uh28, type Us47, type Us61, Uh15Cons, Uh15Nil, Uh28Cons, Uh3Cons, Uh3Nil, Us16Content, Us16Reaction, Us16Revision, Us17Framed, Us17Posted, Us18Deleted, Us18Edited, Us18FrameEdited, Us19Liked, Us19Unliked, Us2None, Us2Some, Us30EvictAfter, Us30EvictNow, Us30NoEviction, Us3None, Us3Some, Us46CancelTask, Us47Applied, Us47Waiting, Us48Error, Us48Ok, Us49None, Us49Some, Us52Error, Us52Ok, Us53None, Us53Some, Us54Error, Us54Ok, Us55None, Us55Some, Us56Error, Us56Ok, Us57Error, Us57Ok, Us58None, Us58Some, Us59Error, Us59Ok, Us60None, Us60Some, Us61Error, Us61Ok}
import xsim_frames/part1.{method18, spiral_wrap_signed}
import xsim_frames/part2.{delimited_21}
import xsim_frames/part8.{restored_text_226}
import xsim_frames/part9.{closure43, closure44, method245, method246, method249, method253, method254, method256, method257, method258, method259, method263, method264, method265, method266, rekeyed_255}

pub fn closure59(capt: #(String, Int, Int, Int, String)) -> fn(String) -> Us16 {
    fn (v5) {
        let #(v0, _v1, _v2, _v3, _v4) = capt
        let v6 = Us18Edited(v0, v5)
        Us16Revision(v6)
    }
}

pub fn closure60(capt: Nil) -> fn(#(Int, Int, Int, Int)) -> #(Int, Int, Int, Int) {
    fn (dom) {
        let #(v0, v1, v2, v3) = dom
        let v4 = spiral_wrap_signed(v1 + 1, 32)
        #(v0, v4, v2, v3)
    }
}

pub fn frame_edit_gathered_268(v0: Int, v1: String, v2: Int, v3: Int, v4: Int, v5: String, v6: dict.Dict(Int, Nil), v7: Uh15, v8: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v9: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v10: dict.Dict(String, String), v11: dict.Dict(String, Uh3), v12: dict.Dict(String, dict.Dict(String, Nil)), v13: dict.Dict(String, #(Int, Bool)), v14: dict.Dict(String, Nil), v15: Int, v16: Int, v17: Int, v18: Int) -> Us47 {
    let v19 = { "edit\n" } <> { v1 }
    let v20 = { v19 } <> { "\n" }
    let v21 = int.to_string(v2)
    let v22 = { v20 } <> { v21 }
    let v23 = closure59(#(v1, v2, v3, v4, v5))
    let v24 = closure60(Nil)
    frame_gathered_244(v22, v0, v3, v4, v5, v23, v24, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
}

pub fn revision_applied_267(v0: Int, v1: Us18, v2: dict.Dict(Int, Nil), v3: Uh15, v4: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v5: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v6: dict.Dict(String, String), v7: dict.Dict(String, Uh3), v8: dict.Dict(String, dict.Dict(String, Nil)), v9: dict.Dict(String, #(Int, Bool)), v10: dict.Dict(String, Nil), v11: Int, v12: Int, v13: Int, v14: Int) -> Us47 {
    case v1  {
        Us18Deleted(v56) -> {
            let v57 = dict.get(v5, v56)
            let v58 = method256()
            let v59 = method257()
            let v60 = case v57 { Ok(x) -> v58(x) Error(x) -> v59(x) }
            let v67 =
                case v60  {
                    Us54Error -> Us55None
                    Us54Ok(v61, v62, v63) -> Us55Some(v61, v62, v63)
                }
            case v67  {
                Us55None -> Us47Waiting
                Us55Some(v68, v69, v70) -> {
                    let v71 = dict.insert(v5, v56, #(v68, v69, True))
                    let v72 = dict.insert(v10, v56, Nil)
                    Us47Applied(v2, v3, v4, v71, v6, v7, v8, v9, v72, v11, v12, v13, v14)
                }
            }
        }
        Us18Edited(v15, v16) -> {
            let v17 = dict.get(v5, v15)
            let v18 = method256()
            let v19 = method257()
            let v20 = case v17 { Ok(x) -> v18(x) Error(x) -> v19(x) }
            let v27 =
                case v20  {
                    Us54Error -> Us55None
                    Us54Ok(v21, v22, v23) -> Us55Some(v21, v22, v23)
                }
            case v27  {
                Us55None -> Us47Waiting
                Us55Some(v28, v29, v30) -> {
                    let v31 = dict.insert(v29, v0, v16)
                    let v32 = dict.insert(v5, v15, #(v28, v31, v30))
                    let #(v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45) = rekeyed_255(v15, v2, v3, v4, v32, v6, v7, v8, v9, v10, v11, v12, v13, v14)
                    Us47Applied(v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45)
                }
            }
        }
        Us18FrameEdited(v50, v51, v52, v53, v54) -> frame_edit_gathered_268(v0, v50, v51, v52, v53, v54, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    }
}

pub fn frame_done_248(v0: String, v1: dict.Dict(Int, #(Int, Int, String)), v2: Int, v3: fn(String) -> Us16, v4: fn(#(Int, Int, Int, Int)) -> #(Int, Int, Int, Int), v5: dict.Dict(Int, Nil), v6: Uh15, v7: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v8: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v9: dict.Dict(String, String), v10: dict.Dict(String, Uh3), v11: dict.Dict(String, dict.Dict(String, Nil)), v12: dict.Dict(String, #(Int, Bool)), v13: dict.Dict(String, Nil), v14: Int, v15: Int, v16: Int, v17: Int) -> Us47 {
    let v18 = dict.size(v1)
    let v20 = method249(v18, v1, 0)
    let v22 = delimited_21("", v20)
    let v23 = restored_text_226(v22)
    let v24 = v3(v23)
    let v25 = dict.delete(v7, v0)
    let #(v26, v27, v28, v29) = v4(#(v14, v15, v16, v17))
    completed_252(v2, v24, v5, v6, v25, v8, v9, v10, v11, v12, v13, v26, v27, v28, v29)
}

pub fn frame_step_247(v0: String, v1: dict.Dict(Int, #(Int, Int, String)), v2: Int, _v3: Int, v4: Int, _v5: String, v6: fn(String) -> Us16, v7: fn(#(Int, Int, Int, Int)) -> #(Int, Int, Int, Int), v8: dict.Dict(Int, Nil), v9: Uh15, v10: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v11: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v12: dict.Dict(String, String), v13: dict.Dict(String, Uh3), v14: dict.Dict(String, dict.Dict(String, Nil)), v15: dict.Dict(String, #(Int, Bool)), v16: dict.Dict(String, Nil), v17: Int, v18: Int, v19: Int, v20: Int) -> Us47 {
    let v21 = dict.size(v1)
    let v22 = v21 == v4
    case v22 {
        True -> frame_done_248(v0, v1, v2, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20)
        False -> {
            let v24 = dict.insert(v10, v0, #(v1, v2))
            Us47Applied(v8, v9, v24, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20)
        }
    }
}

pub fn frame_gathered_244(v0: String, v1: Int, v2: Int, v3: Int, v4: String, v5: fn(String) -> Us16, v6: fn(#(Int, Int, Int, Int)) -> #(Int, Int, Int, Int), v7: dict.Dict(Int, Nil), v8: Uh15, v9: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v10: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v11: dict.Dict(String, String), v12: dict.Dict(String, Uh3), v13: dict.Dict(String, dict.Dict(String, Nil)), v14: dict.Dict(String, #(Int, Bool)), v15: dict.Dict(String, Nil), v16: Int, v17: Int, v18: Int, v19: Int) -> Us47 {
    let v20 = dict.get(v9, v0)
    let v21 = method245()
    let v22 = method246()
    let v23 = case v20 { Ok(x) -> v21(x) Error(x) -> v22(x) }
    let v29 =
        case v23  {
            Us48Error -> Us49None
            Us48Ok(v24, v25) -> Us49Some(v24, v25)
        }
    let #(v35, v36) =
        case v29  {
            Us49Some(v30, v31) -> #(v30, v31)
            _ -> {
                let #(v33, v34) =
                    case v29  {
                        Us49None -> {
                            let v32 = dict.new()
                            #(v32, v1)
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v33, v34)
            }
        }
    let v37 = dict.insert(v35, v2, #(v2, v3, v4))
    let v38 = v1 < v36
    let v39 =
        case v38 {
            True -> v1
            False -> v36
        }
    frame_step_247(v0, v37, v39, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
}

pub fn content_applied_243(v0: Int, v1: Us17, v2: dict.Dict(Int, Nil), v3: Uh15, v4: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v5: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v6: dict.Dict(String, String), v7: dict.Dict(String, Uh3), v8: dict.Dict(String, dict.Dict(String, Nil)), v9: dict.Dict(String, #(Int, Bool)), v10: dict.Dict(String, Nil), v11: Int, v12: Int, v13: Int, v14: Int) -> Us47 {
    case v1  {
        Us17Framed(v76, v77, v78, v79, v80) -> {
            let v81 = { "post\n" } <> { v76 }
            let v82 = closure43(#(v76, v77, v78, v79, v80))
            let v83 = closure44(Nil)
            frame_gathered_244(v81, v0, v78, v79, v80, v82, v83, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
        }
        Us17Posted(v15, v16, v17) -> {
            case v16  {
                Us2Some(v18) -> {
                    let v19 = dict.has_key(v5, v18)
                    let v20 = v19 == False
                    case v20 {
                        True -> Us47Waiting
                        False -> {
                            let v22 = dict.new()
                            let v23 = dict.insert(v22, v0, v17)
                            let v24 = dict.insert(v5, v15, #(v16, v23, False))
                            let v25 = dict.get(v7, v18)
                            let v26 = method253()
                            let v27 = method254()
                            let v28 = case v25 { Ok(x) -> v26(x) Error(x) -> v27(x) }
                            let v33 =
                                case v28  {
                                    Us52Error -> Us53None
                                    Us52Ok(v29) -> Us53Some(v29)
                                }
                            let v37 =
                                case v33  {
                                    Us53None -> Uh3Nil
                                    Us53Some(v34) -> v34
                                }
                            let v38 = Uh3Cons(v15, v37)
                            let v39 = dict.insert(v7, v18, v38)
                            let #(v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52) = rekeyed_255(v15, v2, v3, v4, v24, v6, v39, v8, v9, v10, v11, v12, v13, v14)
                            Us47Applied(v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52)
                        }
                    }
                }
                _ -> {
                    let v55 = dict.new()
                    let v56 = dict.insert(v55, v0, v17)
                    let v57 = dict.insert(v5, v15, #(v16, v56, False))
                    let #(v58, v59, v60) =
                        case v16  {
                            Us2None -> #(v57, v6, v7)
                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                        }
                    let #(v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73) = rekeyed_255(v15, v2, v3, v4, v58, v59, v60, v8, v9, v10, v11, v12, v13, v14)
                    Us47Applied(v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73)
                }
            }
        }
    }
}

pub fn applied_event_242(v0: Int, v1: Us16, v2: dict.Dict(Int, Nil), v3: Uh15, v4: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v5: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v6: dict.Dict(String, String), v7: dict.Dict(String, Uh3), v8: dict.Dict(String, dict.Dict(String, Nil)), v9: dict.Dict(String, #(Int, Bool)), v10: dict.Dict(String, Nil), v11: Int, v12: Int, v13: Int, v14: Int) -> Us47 {
    case v1  {
        Us16Content(v15) -> content_applied_243(v0, v15, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
        Us16Reaction(v19) -> {
            case v19  {
                Us19Liked(v20, v21) -> {
                    let v22 = dict.has_key(v5, v20)
                    let v23 = v22 == False
                    case v23 {
                        True -> Us47Waiting
                        False -> {
                            let v25 = { v20 } <> { "\n" }
                            let v26 = { v25 } <> { v21 }
                            let v27 = dict.get(v9, v26)
                            let v28 = method263()
                            let v29 = method264()
                            let v30 = case v27 { Ok(x) -> v28(x) Error(x) -> v29(x) }
                            let v36 =
                                case v30  {
                                    Us57Error -> Us58None
                                    Us57Ok(v31, v32) -> Us58Some(v31, v32)
                                }
                            let v41 =
                                case v36  {
                                    Us58None -> False
                                    Us58Some(v37, v38) -> {
                                        v37 > v0
                                    }
                                }
                            case v41 {
                                True -> Us47Applied(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
                                False -> {
                                    let v43 = dict.new()
                                    let v44 = dict.get(v8, v20)
                                    let v45 = method265()
                                    let v46 = method266()
                                    let v47 = case v44 { Ok(x) -> v45(x) Error(x) -> v46(x) }
                                    let v52 =
                                        case v47  {
                                            Us59Error -> Us60None
                                            Us59Ok(v48) -> Us60Some(v48)
                                        }
                                    let v55 =
                                        case v52  {
                                            Us60None -> v43
                                            Us60Some(v53) -> v53
                                        }
                                    let v56 = dict.insert(v55, v21, Nil)
                                    let v57 = dict.insert(v8, v20, v56)
                                    let v58 = dict.insert(v9, v26, #(v0, True))
                                    let v59 = dict.insert(v10, v20, Nil)
                                    Us47Applied(v2, v3, v4, v5, v6, v7, v57, v58, v59, v11, v12, v13, v14)
                                }
                            }
                        }
                    }
                }
                Us19Unliked(v63, v64) -> {
                    let v65 = dict.has_key(v5, v63)
                    let v66 = v65 == False
                    case v66 {
                        True -> Us47Waiting
                        False -> {
                            let v68 = { v63 } <> { "\n" }
                            let v69 = { v68 } <> { v64 }
                            let v70 = dict.get(v9, v69)
                            let v71 = method263()
                            let v72 = method264()
                            let v73 = case v70 { Ok(x) -> v71(x) Error(x) -> v72(x) }
                            let v79 =
                                case v73  {
                                    Us57Error -> Us58None
                                    Us57Ok(v74, v75) -> Us58Some(v74, v75)
                                }
                            let v84 =
                                case v79  {
                                    Us58None -> False
                                    Us58Some(v80, v81) -> {
                                        v80 > v0
                                    }
                                }
                            case v84 {
                                True -> Us47Applied(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
                                False -> {
                                    let v86 = dict.new()
                                    let v87 = dict.get(v8, v63)
                                    let v88 = method265()
                                    let v89 = method266()
                                    let v90 = case v87 { Ok(x) -> v88(x) Error(x) -> v89(x) }
                                    let v95 =
                                        case v90  {
                                            Us59Error -> Us60None
                                            Us59Ok(v91) -> Us60Some(v91)
                                        }
                                    let v98 =
                                        case v95  {
                                            Us60None -> v86
                                            Us60Some(v96) -> v96
                                        }
                                    let v99 = dict.delete(v98, v64)
                                    let v100 = dict.insert(v8, v63, v99)
                                    let v101 = dict.insert(v9, v69, #(v0, False))
                                    let v102 = dict.insert(v10, v63, Nil)
                                    Us47Applied(v2, v3, v4, v5, v6, v7, v100, v101, v102, v11, v12, v13, v14)
                                }
                            }
                        }
                    }
                }
            }
        }
        Us16Revision(v17) -> revision_applied_267(v0, v17, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    }
}

pub fn completed_252(v0: Int, v1: Us16, v2: dict.Dict(Int, Nil), v3: Uh15, v4: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v5: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v6: dict.Dict(String, String), v7: dict.Dict(String, Uh3), v8: dict.Dict(String, dict.Dict(String, Nil)), v9: dict.Dict(String, #(Int, Bool)), v10: dict.Dict(String, Nil), v11: Int, v12: Int, v13: Int, v14: Int) -> Us47 {
    let v15 = applied_event_242(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    case v15  {
        Us47Applied(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28) -> Us47Applied(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28)
        Us47Waiting -> {
            let v30 = spiral_wrap_signed(v14 + 1, 32)
            let v31 = Uh15Cons(v0, v1, v3)
            Us47Applied(v2, v31, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v30)
        }
    }
}

pub fn method271(v0: Int, v1: Uh15, v2: Uh15) -> Uh15 {
    case v1  {
        Uh15Cons(v3, v4, v5) -> {
            let v6 = method271(v0, v5, v2)
            let v7 = v3 != v0
            case v7 {
                True -> Uh15Cons(v3, v4, v6)
                False -> v6
            }
        }
        Uh15Nil -> v2
    }
}

pub fn drained_269(v0: dict.Dict(Int, Nil), v1: Uh15, v2: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v3: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v4: dict.Dict(String, String), v5: dict.Dict(String, Uh3), v6: dict.Dict(String, dict.Dict(String, Nil)), v7: dict.Dict(String, #(Int, Bool)), v8: dict.Dict(String, Nil), v9: Int, v10: Int, v11: Int, v12: Int) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int) {
    let #(v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25) = drained_from_270(v1, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
    #(v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25)
}

pub fn drained_from_270(v0: Uh15, v1: dict.Dict(Int, Nil), v2: Uh15, v3: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v4: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v5: dict.Dict(String, String), v6: dict.Dict(String, Uh3), v7: dict.Dict(String, dict.Dict(String, Nil)), v8: dict.Dict(String, #(Int, Bool)), v9: dict.Dict(String, Nil), v10: Int, v11: Int, v12: Int, v13: Int) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int) {
    let #(v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110) =
        case v0  {
            Uh15Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
            _ -> {
                let #(v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97) =
                    case v0  {
                        Uh15Cons(v14, v15, v16) -> {
                            let v17 = applied_event_242(v14, v15, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
                            case v17  {
                                Us47Applied(v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30) -> {
                                    let v32 = method271(v14, v19, Uh15Nil)
                                    drained_269(v18, v32, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30)
                                }
                                _ -> {
                                    let #(v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71) =
                                        case v17  {
                                            Us47Waiting -> drained_from_270(v16, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                        }
                                    #(v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71)
                                }
                            }
                        }
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97)
            }
        }
    #(v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110)
}

pub fn delivered_241(v0: dict.Dict(Int, Nil), v1: Uh15, v2: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v3: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v4: dict.Dict(String, String), v5: dict.Dict(String, Uh3), v6: dict.Dict(String, dict.Dict(String, Nil)), v7: dict.Dict(String, #(Int, Bool)), v8: dict.Dict(String, Nil), v9: Int, v10: Int, v11: Int, v12: Int, v13: Int, v14: Us16) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int) {
    let v15 = dict.has_key(v0, v13)
    let #(v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85) =
        case v15 {
            True -> {
                let v16 = spiral_wrap_signed(v11 + 1, 32)
                #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v16, v12)
            }
            False -> {
                let v17 = dict.insert(v0, v13, Nil)
                let v18 = applied_event_242(v13, v14, v17, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                let #(v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72) =
                    case v18  {
                        Us47Applied(v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31) -> drained_269(v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31)
                        _ -> {
                            let #(v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59) =
                                case v18  {
                                    Us47Waiting -> {
                                        let v45 = spiral_wrap_signed(v12 + 1, 32)
                                        let v46 = Uh15Cons(v13, v14, v1)
                                        #(v17, v46, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v45)
                                    }
                                    _ -> panic as "spiral: union case ruled out by partial evaluation"
                                }
                            #(v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59)
                        }
                    }
                #(v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72)
            }
        }
    #(v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85)
}

pub fn ok_c61(capt: Nil) -> fn(Int) -> Us61 {
    fn (v0) {
        Us61Ok(v0)
    }
}

pub fn method273() -> fn(Int) -> Us61 {
    ok_c61(Nil)
}

pub fn error_c62(capt: Nil) -> fn(Nil) -> Us61 {
    fn (dom) {
        Us61Error
    }
}

pub fn method274() -> fn(Nil) -> Us61 {
    error_c62(Nil)
}

pub fn method272(v0: dict.Dict(String, Int), v1: Int, v2: Uh3, v3: Uh3) -> Uh3 {
    case v2  {
        Uh3Cons(v4, v5) -> {
            let v6 = method272(v0, v1, v5, v3)
            let v7 = dict.get(v0, v4)
            let v8 = method273()
            let v9 = method274()
            let v10 = case v7 { Ok(x) -> v8(x) Error(x) -> v9(x) }
            let v15 =
                case v10  {
                    Us61Error -> Us3None
                    Us61Ok(v11) -> Us3Some(v11)
                }
            let v19 =
                case v15  {
                    Us3None -> panic as "dict.present: the key is not in the dict"
                    Us3Some(v16) -> v16
                }
            let v20 = v19 <= v1
            case v20 {
                True -> Uh3Cons(v4, v6)
                False -> v6
            }
        }
        Uh3Nil -> v3
    }
}

pub fn method275(v0: Uh3, v1: dict.Dict(String, Int)) -> dict.Dict(String, Int) {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = dict.delete(v1, v2)
            method275(v3, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method276(v0: Uh3, v1: dict.Dict(Int, Nil), v2: Uh15, v3: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v4: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v5: dict.Dict(String, String), v6: dict.Dict(String, Uh3), v7: dict.Dict(String, dict.Dict(String, Nil)), v8: dict.Dict(String, #(Int, Bool)), v9: dict.Dict(String, Nil), v10: Int, v11: Int, v12: Int, v13: Int, v14: dict.Dict(String, Uh3), v15: Uh3, v16: dict.Dict(String, #(Us45, String)), v17: dict.Dict(String, Int), v18: dict.Dict(String, String), v19: dict.Dict(String, String), v20: dict.Dict(String, Int), v21: Int, v22: dict.Dict(String, Int), v23: dict.Dict(String, Int), v24: dict.Dict(String, Int), v25: Int, v26: Int, v27: Int, v28: Int, v29: Int, v30: dict.Dict(String, #(String, Us45, String)), v31: Bool, v32: Bool, v33: Us30, v34: Bool, v35: Int, v36: Uh28) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28) {
    let #(v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216, v217, v218, v219, v220, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230, v231, v232, v233, v234, v235, v236) =
        case v0  {
            Uh3Cons(v37, v38) -> {
                let v39 = dict.has_key(v17, v37)
                let #(v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128) =
                    case v39 {
                        True -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36)
                        False -> {
                            let v40 = dict.has_key(v16, v37)
                            let v41 = v40 == False
                            let #(v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92) =
                                case v41 {
                                    True -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36)
                                    False -> {
                                        let v42 = dict.delete(v16, v37)
                                        let v43 = dict.get(v24, v37)
                                        let v44 = method273()
                                        let v45 = method274()
                                        let v46 = case v43 { Ok(x) -> v44(x) Error(x) -> v45(x) }
                                        let v51 =
                                            case v46  {
                                                Us61Error -> Us3None
                                                Us61Ok(v47) -> Us3Some(v47)
                                            }
                                        let v54 =
                                            case v51  {
                                                Us3None -> 0
                                                Us3Some(v52) -> v52
                                            }
                                        let v55 = spiral_wrap_signed(v54 + 1, 32)
                                        let v56 = dict.insert(v24, v37, v55)
                                        #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v42, v17, v18, v19, v20, v21, v22, v23, v56, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36)
                                    }
                                }
                            #(v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92)
                        }
                    }
                method276(v38, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128)
            }
            _ -> {
                let #(v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200) =
                    case v0  {
                        Uh3Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v165, v166, v167, v168, v169, v170, v171, v172, v173, v174, v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200)
            }
        }
    #(v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216, v217, v218, v219, v220, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230, v231, v232, v233, v234, v235, v236)
}

pub fn method278(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method278(v0, v4, v2)
            let v6 = v3 != v0
            case v6 {
                True -> Uh3Cons(v3, v5)
                False -> v5
            }
        }
        Uh3Nil -> v2
    }
}

pub fn closure63(capt: #(String)) -> fn(String) -> Bool {
    fn (v1) {
        let #(v0) = capt
        v1 == v0
    }
}

pub fn method279(v0: String) -> fn(String) -> Bool {
    closure63(#(v0))
}

pub fn method280(v0: String, v1: fn(String) -> Bool, v2: Uh3) -> Bool {
    case v2  {
        Uh3Cons(v3, v4) -> {
            let v5 = v1(v3)
            case v5 {
                True -> True
                False -> {
                    let v6 = method279(v0)
                    method280(v0, v6, v4)
                }
            }
        }
        Uh3Nil -> False
    }
}

pub fn method277(v0: Uh3, v1: dict.Dict(Int, Nil), v2: Uh15, v3: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v4: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v5: dict.Dict(String, String), v6: dict.Dict(String, Uh3), v7: dict.Dict(String, dict.Dict(String, Nil)), v8: dict.Dict(String, #(Int, Bool)), v9: dict.Dict(String, Nil), v10: Int, v11: Int, v12: Int, v13: Int, v14: dict.Dict(String, Uh3), v15: Uh3, v16: dict.Dict(String, #(Us45, String)), v17: dict.Dict(String, Int), v18: dict.Dict(String, String), v19: dict.Dict(String, String), v20: dict.Dict(String, Int), v21: Int, v22: dict.Dict(String, Int), v23: dict.Dict(String, Int), v24: dict.Dict(String, Int), v25: Int, v26: Int, v27: Int, v28: Int, v29: Int, v30: dict.Dict(String, #(String, Us45, String)), v31: Bool, v32: Bool, v33: Us30, v34: Bool, v35: Int, v36: Uh28) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28) {
    let #(v814, v815, v816, v817, v818, v819, v820, v821, v822, v823, v824, v825, v826, v827, v828, v829, v830, v831, v832, v833, v834, v835, v836, v837, v838, v839, v840, v841, v842, v843, v844, v845, v846, v847, v848, v849) =
        case v0  {
            Uh3Cons(v37, v38) -> {
                let v39 = dict.get(v18, v37)
                let v40 = method258()
                let v41 = method259()
                let v42 = case v39 { Ok(x) -> v40(x) Error(x) -> v41(x) }
                let v47 =
                    case v42  {
                        Us56Error -> Us2None
                        Us56Ok(v43) -> Us2Some(v43)
                    }
                let v48 = dict.get(v7, v37)
                let v49 = method265()
                let v50 = method266()
                let v51 = case v48 { Ok(x) -> v49(x) Error(x) -> v50(x) }
                let v56 =
                    case v51  {
                        Us59Error -> Us60None
                        Us59Ok(v52) -> Us60Some(v52)
                    }
                let v57 = dict.get(v4, v37)
                let v58 = method256()
                let v59 = method257()
                let v60 = case v57 { Ok(x) -> v58(x) Error(x) -> v59(x) }
                let v67 =
                    case v60  {
                        Us54Error -> Us55None
                        Us54Ok(v61, v62, v63) -> Us55Some(v61, v62, v63)
                    }
                let v90 =
                    case v56  {
                        Us60Some(v68) -> {
                            case v67  {
                                Us55Some(v69, v70, v71) -> {
                                    let v72 = dict.size(v68)
                                    let v73 = v72 > 0
                                    let v75 =
                                        case v73 {
                                            True -> {
                                                v71 == False
                                            }
                                            False -> False
                                        }
                                    case v75 {
                                        True -> {
                                            let v76 = dict.get(v5, v37)
                                            let v77 = method258()
                                            let v78 = method259()
                                            let v79 = case v76 { Ok(x) -> v77(x) Error(x) -> v78(x) }
                                            case v79  {
                                                Us56Error -> Us2None
                                                Us56Ok(v80) -> Us2Some(v80)
                                            }
                                        }
                                        False -> Us2None
                                    }
                                }
                                _ -> Us2None
                            }
                        }
                        _ -> Us2None
                    }
                let v97 =
                    case v47  {
                        Us2None -> {
                            case v90  {
                                Us2None -> True
                                _ -> False
                            }
                        }
                        Us2Some(v91) -> {
                            case v90  {
                                Us2Some(v92) -> {
                                    v91 == v92
                                }
                                _ -> False
                            }
                        }
                    }
                let #(v706, v707, v708, v709, v710, v711, v712, v713, v714, v715, v716, v717, v718, v719, v720, v721, v722, v723, v724, v725, v726, v727, v728, v729, v730, v731, v732, v733, v734, v735, v736, v737, v738, v739, v740, v741) =
                    case v97 {
                        True -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36)
                        False -> {
                            let #(v104, v105, v106) =
                                case v90  {
                                    Us2Some(v98) -> {
                                        let v99 = dict.insert(v18, v37, v98)
                                        #(v17, v99, v19)
                                    }
                                    _ -> {
                                        let #(v101, v102, v103) =
                                            case v90  {
                                                Us2None -> {
                                                    let v100 = dict.delete(v18, v37)
                                                    #(v17, v100, v19)
                                                }
                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                            }
                                        #(v101, v102, v103)
                                    }
                                }
                            let #(v419, v420, v421, v422, v423, v424, v425, v426, v427, v428, v429, v430, v431, v432, v433, v434, v435, v436, v437, v438, v439, v440, v441, v442, v443, v444, v445, v446, v447, v448, v449, v450, v451, v452, v453, v454) =
                                case v47  {
                                    Us2Some(v107) -> {
                                        let v108 = dict.get(v104, v107)
                                        let v109 = method273()
                                        let v110 = method274()
                                        let v111 = case v108 { Ok(x) -> v109(x) Error(x) -> v110(x) }
                                        let v116 =
                                            case v111  {
                                                Us61Error -> Us3None
                                                Us61Ok(v112) -> Us3Some(v112)
                                            }
                                        let v120 =
                                            case v116  {
                                                Us3None -> panic as "dict.present: the key is not in the dict"
                                                Us3Some(v117) -> v117
                                            }
                                        let v121 = spiral_wrap_signed(v120 - 1, 32)
                                        let v122 = v121 > 0
                                        case v122 {
                                            True -> {
                                                let v123 = dict.insert(v104, v107, v121)
                                                #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v123, v105, v106, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36)
                                            }
                                            False -> {
                                                let v124 = dict.delete(v104, v107)
                                                let v126 = method278(v107, v15, Uh3Nil)
                                                let #(v255, v256, v257, v258, v259, v260, v261, v262, v263, v264, v265, v266, v267, v268, v269, v270, v271, v272, v273, v274, v275, v276, v277, v278, v279, v280, v281, v282, v283, v284, v285, v286, v287, v288, v289, v290) =
                                                    case v33  {
                                                        Us30NoEviction -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v126, v16, v124, v105, v106, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36)
                                                        _ -> {
                                                            let #(v219, v220, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230, v231, v232, v233, v234, v235, v236, v237, v238, v239, v240, v241, v242, v243, v244, v245, v246, v247, v248, v249, v250, v251, v252, v253, v254) =
                                                                case v33  {
                                                                    Us30EvictNow -> {
                                                                        let v127 = dict.has_key(v16, v107)
                                                                        let v128 = v127 == False
                                                                        case v128 {
                                                                            True -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v126, v16, v124, v105, v106, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36)
                                                                            False -> {
                                                                                let v129 = dict.delete(v16, v107)
                                                                                let v130 = dict.get(v24, v107)
                                                                                let v131 = method273()
                                                                                let v132 = method274()
                                                                                let v133 = case v130 { Ok(x) -> v131(x) Error(x) -> v132(x) }
                                                                                let v138 =
                                                                                    case v133  {
                                                                                        Us61Error -> Us3None
                                                                                        Us61Ok(v134) -> Us3Some(v134)
                                                                                    }
                                                                                let v141 =
                                                                                    case v138  {
                                                                                        Us3None -> 0
                                                                                        Us3Some(v139) -> v139
                                                                                    }
                                                                                let v142 = spiral_wrap_signed(v141 + 1, 32)
                                                                                let v143 = dict.insert(v24, v107, v142)
                                                                                #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v126, v129, v124, v105, v106, v20, v21, v22, v23, v143, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36)
                                                                            }
                                                                        }
                                                                    }
                                                                    _ -> {
                                                                        let #(v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216, v217, v218) =
                                                                            case v33  {
                                                                                Us30EvictAfter(v180) -> {
                                                                                    let v181 = spiral_wrap_signed(v21 + v180, 32)
                                                                                    let v182 = dict.insert(v20, v107, v181)
                                                                                    #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v126, v16, v124, v105, v106, v182, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36)
                                                                                }
                                                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                                                            }
                                                                        #(v183, v184, v185, v186, v187, v188, v189, v190, v191, v192, v193, v194, v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210, v211, v212, v213, v214, v215, v216, v217, v218)
                                                                    }
                                                                }
                                                            #(v219, v220, v221, v222, v223, v224, v225, v226, v227, v228, v229, v230, v231, v232, v233, v234, v235, v236, v237, v238, v239, v240, v241, v242, v243, v244, v245, v246, v247, v248, v249, v250, v251, v252, v253, v254)
                                                        }
                                                    }
                                                let v292 =
                                                    case v285 {
                                                        True -> {
                                                            dict.has_key(v268, v107)
                                                        }
                                                        False -> False
                                                    }
                                                let #(v311, v312, v313, v314, v315, v316, v317, v318, v319, v320, v321, v322, v323, v324, v325, v326, v327, v328, v329, v330, v331, v332, v333, v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344, v345, v346) =
                                                    case v292 {
                                                        True -> {
                                                            let v293 = dict.delete(v268, v107)
                                                            let v294 = spiral_wrap_signed(v279 + 1, 32)
                                                            let v295 = dict.get(v277, v107)
                                                            let v296 = method273()
                                                            let v297 = method274()
                                                            let v298 = case v295 { Ok(x) -> v296(x) Error(x) -> v297(x) }
                                                            let v303 =
                                                                case v298  {
                                                                    Us61Error -> Us3None
                                                                    Us61Ok(v299) -> Us3Some(v299)
                                                                }
                                                            let v306 =
                                                                case v303  {
                                                                    Us3None -> 0
                                                                    Us3Some(v304) -> v304
                                                                }
                                                            let v307 = spiral_wrap_signed(v306 + 1, 32)
                                                            let v308 = dict.insert(v277, v107, v307)
                                                            let v309 = Us46CancelTask(v107)
                                                            let v310 = Uh28Cons(v309, v290)
                                                            #(v255, v256, v257, v258, v259, v260, v261, v262, v263, v264, v265, v266, v267, v293, v269, v270, v271, v272, v273, v274, v275, v276, v308, v278, v294, v280, v281, v282, v283, v284, v285, v286, v287, v288, v289, v310)
                                                        }
                                                        False -> #(v255, v256, v257, v258, v259, v260, v261, v262, v263, v264, v265, v266, v267, v268, v269, v270, v271, v272, v273, v274, v275, v276, v277, v278, v279, v280, v281, v282, v283, v284, v285, v286, v287, v288, v289, v290)
                                                    }
                                                #(v311, v312, v313, v314, v315, v316, v317, v318, v319, v320, v321, v322, v323, v324, v325, v326, v327, v328, v329, v330, v331, v332, v333, v334, v335, v336, v337, v338, v339, v340, v341, v342, v343, v344, v345, v346)
                                            }
                                        }
                                    }
                                    _ -> {
                                        let #(v383, v384, v385, v386, v387, v388, v389, v390, v391, v392, v393, v394, v395, v396, v397, v398, v399, v400, v401, v402, v403, v404, v405, v406, v407, v408, v409, v410, v411, v412, v413, v414, v415, v416, v417, v418) =
                                            case v47  {
                                                Us2None -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v104, v105, v106, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36)
                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                            }
                                        #(v383, v384, v385, v386, v387, v388, v389, v390, v391, v392, v393, v394, v395, v396, v397, v398, v399, v400, v401, v402, v403, v404, v405, v406, v407, v408, v409, v410, v411, v412, v413, v414, v415, v416, v417, v418)
                                    }
                                }
                            let #(v670, v671, v672, v673, v674, v675, v676, v677, v678, v679, v680, v681, v682, v683, v684, v685, v686, v687, v688, v689, v690, v691, v692, v693, v694, v695, v696, v697, v698, v699, v700, v701, v702, v703, v704, v705) =
                                case v90  {
                                    Us2Some(v455) -> {
                                        let v456 = dict.get(v435, v455)
                                        let v457 = method273()
                                        let v458 = method274()
                                        let v459 = case v456 { Ok(x) -> v457(x) Error(x) -> v458(x) }
                                        let v464 =
                                            case v459  {
                                                Us61Error -> Us3None
                                                Us61Ok(v460) -> Us3Some(v460)
                                            }
                                        let v467 =
                                            case v464  {
                                                Us3None -> 0
                                                Us3Some(v465) -> v465
                                            }
                                        let v468 = spiral_wrap_signed(v467 + 1, 32)
                                        let v469 = dict.has_key(v438, v455)
                                        let v470 = v469 == False
                                        let #(v510, v511, v512, v513, v514, v515, v516, v517, v518, v519, v520, v521, v522, v523, v524, v525, v526, v527, v528, v529, v530, v531, v532, v533, v534, v535, v536, v537, v538, v539, v540, v541, v542, v543, v544, v545) =
                                            case v470 {
                                                True -> #(v419, v420, v421, v422, v423, v424, v425, v426, v427, v428, v429, v430, v431, v432, v433, v434, v435, v436, v437, v438, v439, v440, v441, v442, v443, v444, v445, v446, v447, v448, v449, v450, v451, v452, v453, v454)
                                                False -> {
                                                    let v471 = dict.delete(v438, v455)
                                                    let v472 = dict.has_key(v434, v455)
                                                    let #(v474, v475, v476, v477, v478, v479, v480, v481, v482, v483, v484, v485, v486, v487, v488, v489, v490, v491, v492, v493, v494, v495, v496, v497, v498, v499, v500, v501, v502, v503, v504, v505, v506, v507, v508, v509) =
                                                        case v472 {
                                                            True -> {
                                                                let v473 = spiral_wrap_signed(v444 + 1, 32)
                                                                #(v419, v420, v421, v422, v423, v424, v425, v426, v427, v428, v429, v430, v431, v432, v433, v434, v435, v436, v437, v471, v439, v440, v441, v442, v443, v473, v445, v446, v447, v448, v449, v450, v451, v452, v453, v454)
                                                            }
                                                            False -> #(v419, v420, v421, v422, v423, v424, v425, v426, v427, v428, v429, v430, v431, v432, v433, v434, v435, v436, v437, v471, v439, v440, v441, v442, v443, v444, v445, v446, v447, v448, v449, v450, v451, v452, v453, v454)
                                                        }
                                                    #(v474, v475, v476, v477, v478, v479, v480, v481, v482, v483, v484, v485, v486, v487, v488, v489, v490, v491, v492, v493, v494, v495, v496, v497, v498, v499, v500, v501, v502, v503, v504, v505, v506, v507, v508, v509)
                                                }
                                            }
                                        let v546 = dict.insert(v526, v455, v468)
                                        let v547 = dict.insert(v528, v455, v37)
                                        let v548 = v468 == 1
                                        let v556 =
                                            case v548 {
                                                True -> {
                                                    let v549 = dict.has_key(v525, v455)
                                                    let v551 =
                                                        case v549 {
                                                            True -> True
                                                            False -> {
                                                                dict.has_key(v523, v455)
                                                            }
                                                        }
                                                    let v554 =
                                                        case v551 {
                                                            True -> True
                                                            False -> {
                                                                let v552 = method279(v455)
                                                                method280(v455, v552, v524)
                                                            }
                                                        }
                                                    v554 == False
                                                }
                                                False -> False
                                            }
                                        case v556 {
                                            True -> {
                                                let v558 = Uh3Cons(v455, Uh3Nil)
                                                let v559 = method18(v524, v558)
                                                let v560 = dict.has_key(v533, v455)
                                                let #(v562, v563, v564, v565, v566, v567, v568, v569, v570, v571, v572, v573, v574, v575, v576, v577, v578, v579, v580, v581, v582, v583, v584, v585, v586, v587, v588, v589, v590, v591, v592, v593, v594, v595, v596, v597) =
                                                    case v560 {
                                                        True -> {
                                                            let v561 = spiral_wrap_signed(v536 + 1, 32)
                                                            #(v510, v511, v512, v513, v514, v515, v516, v517, v518, v519, v520, v521, v522, v523, v559, v525, v546, v527, v547, v529, v530, v531, v532, v533, v534, v535, v561, v537, v538, v539, v540, v541, v542, v543, v544, v545)
                                                        }
                                                        False -> #(v510, v511, v512, v513, v514, v515, v516, v517, v518, v519, v520, v521, v522, v523, v559, v525, v546, v527, v547, v529, v530, v531, v532, v533, v534, v535, v536, v537, v538, v539, v540, v541, v542, v543, v544, v545)
                                                    }
                                                #(v562, v563, v564, v565, v566, v567, v568, v569, v570, v571, v572, v573, v574, v575, v576, v577, v578, v579, v580, v581, v582, v583, v584, v585, v586, v587, v588, v589, v590, v591, v592, v593, v594, v595, v596, v597)
                                            }
                                            False -> #(v510, v511, v512, v513, v514, v515, v516, v517, v518, v519, v520, v521, v522, v523, v524, v525, v546, v527, v547, v529, v530, v531, v532, v533, v534, v535, v536, v537, v538, v539, v540, v541, v542, v543, v544, v545)
                                        }
                                    }
                                    _ -> {
                                        let #(v634, v635, v636, v637, v638, v639, v640, v641, v642, v643, v644, v645, v646, v647, v648, v649, v650, v651, v652, v653, v654, v655, v656, v657, v658, v659, v660, v661, v662, v663, v664, v665, v666, v667, v668, v669) =
                                            case v90  {
                                                Us2None -> #(v419, v420, v421, v422, v423, v424, v425, v426, v427, v428, v429, v430, v431, v432, v433, v434, v435, v436, v437, v438, v439, v440, v441, v442, v443, v444, v445, v446, v447, v448, v449, v450, v451, v452, v453, v454)
                                                _ -> panic as "spiral: union case ruled out by partial evaluation"
                                            }
                                        #(v634, v635, v636, v637, v638, v639, v640, v641, v642, v643, v644, v645, v646, v647, v648, v649, v650, v651, v652, v653, v654, v655, v656, v657, v658, v659, v660, v661, v662, v663, v664, v665, v666, v667, v668, v669)
                                    }
                                }
                            #(v670, v671, v672, v673, v674, v675, v676, v677, v678, v679, v680, v681, v682, v683, v684, v685, v686, v687, v688, v689, v690, v691, v692, v693, v694, v695, v696, v697, v698, v699, v700, v701, v702, v703, v704, v705)
                        }
                    }
                method277(v38, v706, v707, v708, v709, v710, v711, v712, v713, v714, v715, v716, v717, v718, v719, v720, v721, v722, v723, v724, v725, v726, v727, v728, v729, v730, v731, v732, v733, v734, v735, v736, v737, v738, v739, v740, v741)
            }
            _ -> {
                let #(v778, v779, v780, v781, v782, v783, v784, v785, v786, v787, v788, v789, v790, v791, v792, v793, v794, v795, v796, v797, v798, v799, v800, v801, v802, v803, v804, v805, v806, v807, v808, v809, v810, v811, v812, v813) =
                    case v0  {
                        Uh3Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v778, v779, v780, v781, v782, v783, v784, v785, v786, v787, v788, v789, v790, v791, v792, v793, v794, v795, v796, v797, v798, v799, v800, v801, v802, v803, v804, v805, v806, v807, v808, v809, v810, v811, v812, v813)
            }
        }
    #(v814, v815, v816, v817, v818, v819, v820, v821, v822, v823, v824, v825, v826, v827, v828, v829, v830, v831, v832, v833, v834, v835, v836, v837, v838, v839, v840, v841, v842, v843, v844, v845, v846, v847, v848, v849)
}

pub fn method281(v0: dict.Dict(Int, Nil), v1: Uh15, v2: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v3: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v4: dict.Dict(String, String), v5: dict.Dict(String, Uh3), v6: dict.Dict(String, dict.Dict(String, Nil)), v7: dict.Dict(String, #(Int, Bool)), v8: dict.Dict(String, Nil), v9: Int, v10: Int, v11: Int, v12: Int, v13: dict.Dict(String, Uh3), v14: Uh3, v15: dict.Dict(String, #(Us45, String)), v16: dict.Dict(String, Int), v17: dict.Dict(String, String), v18: dict.Dict(String, String), v19: dict.Dict(String, Int), v20: Int, v21: dict.Dict(String, Int), v22: dict.Dict(String, Int), v23: dict.Dict(String, Int), v24: Int, v25: Int, v26: Int, v27: Int, v28: Int, v29: dict.Dict(String, #(String, Us45, String)), v30: Bool, v31: Bool, v32: Us30, v33: Bool, v34: Int, v35: Uh28, v36: Uh3, v37: Uh3) -> Uh3 {
    case v36  {
        Uh3Cons(v38, v39) -> {
            let v40 = method281(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v39, v37)
            let v41 = dict.has_key(v15, v38)
            let v47 =
                case v41 {
                    True -> {
                        let v42 = dict.has_key(v13, v38)
                        let v45 =
                            case v42 {
                                True -> True
                                False -> {
                                    let v43 = method279(v38)
                                    method280(v38, v43, v14)
                                }
                            }
                        v45 == False
                    }
                    False -> False
                }
            case v47 {
                True -> Uh3Cons(v38, v40)
                False -> v40
            }
        }
        Uh3Nil -> v37
    }
}
