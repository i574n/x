import gleam/dict
import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Us2, type Us17, type Us18, type Us16, type Uh15, type Us30, type Us45, type Uh28, type Us47, type Us57, type Us59, type Us61, Uh13Cons, Uh13Nil, Uh15Cons, Uh15Nil, Uh3Cons, Uh3Nil, Us16Content, Us16Reaction, Us16Revision, Us17Framed, Us17Posted, Us18Deleted, Us18Edited, Us18FrameEdited, Us19Liked, Us19Unliked, Us2None, Us2Some, Us3None, Us3Some, Us47Applied, Us47Waiting, Us48Error, Us48Ok, Us49None, Us49Some, Us52Error, Us52Ok, Us53None, Us53Some, Us54Error, Us54Ok, Us55None, Us55Some, Us56Error, Us56Ok, Us57Error, Us57Ok, Us58None, Us58Some, Us59Error, Us59Ok, Us60None, Us60Some, Us61Error, Us61Ok}
import xsim_frames/part1.{dictm_term_sorted, spiral_string_slice, spiral_wrap_signed, unicode_erlang_characters_to_binary}
import xsim_frames/part10.{closure43, closure44, hash_text_240, method246, method247, method250, method254, method255, method257, method258, method259, method260, method261, method262}
import xsim_frames/part2.{delimited_21}
import xsim_frames/part8.{restored_text_227}

pub fn method263(v0: Uh3, v1: dict.Dict(Int, Nil), v2: Uh15, v3: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v4: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v5: dict.Dict(String, String), v6: dict.Dict(String, Uh3), v7: dict.Dict(String, dict.Dict(String, Nil)), v8: dict.Dict(String, #(Int, Bool)), v9: dict.Dict(String, Nil), v10: Int, v11: Int, v12: Int, v13: Int) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int) {
    let #(v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67) =
        case v0  {
            Uh3Cons(v14, v15) -> {
                let #(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28) = rekeyed_256(v14, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
                method263(v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28)
            }
            _ -> {
                let #(v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54) =
                    case v0  {
                        Uh3Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54)
            }
        }
    #(v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67)
}

pub fn rekeyed_256(v0: String, v1: dict.Dict(Int, Nil), v2: Uh15, v3: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v4: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v5: dict.Dict(String, String), v6: dict.Dict(String, Uh3), v7: dict.Dict(String, dict.Dict(String, Nil)), v8: dict.Dict(String, #(Int, Bool)), v9: dict.Dict(String, Nil), v10: Int, v11: Int, v12: Int, v13: Int) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int) {
    let v14 = dict.get(v6, v0)
    let v15 = method254()
    let v16 = method255()
    let v17 = case v14 { Ok(x) -> v15(x) Error(x) -> v16(x) }
    let v22 =
        case v17  {
            Us52Error -> Us53None
            Us52Ok(v18) -> Us53Some(v18)
        }
    let v23 = dict.get(v4, v0)
    let v24 = method257()
    let v25 = method258()
    let v26 = case v23 { Ok(x) -> v24(x) Error(x) -> v25(x) }
    let v33 =
        case v26  {
            Us54Error -> Us55None
            Us54Ok(v27, v28, v29) -> Us55Some(v27, v28, v29)
        }
    let #(v43, v44, _v45) =
        case v33  {
            Us55Some(v34, v35, v36) -> #(v34, v35, v36)
            _ -> {
                let #(v40, v41, v42) =
                    case v33  {
                        Us55None -> panic as "dictm.present: the key is not in the dict"
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v40, v41, v42)
            }
        }
    let v62 =
        case v43  {
            Us2None -> {
                let v60 = ""
                v60
            }
            Us2Some(v46) -> {
                let v47 = dict.get(v5, v46)
                let v48 = method259()
                let v49 = method260()
                let v50 = case v47 { Ok(x) -> v48(x) Error(x) -> v49(x) }
                let v55 =
                    case v50  {
                        Us56Error -> Us2None
                        Us56Ok(v51) -> Us2Some(v51)
                    }
                case v55  {
                    Us2None -> panic as "dictm.present: the key is not in the dict"
                    Us2Some(v56) -> v56
                }
            }
        }
    let v63 = dict.keys(v44)
    let v64 = dictm_term_sorted(v63)
    let v65 = Uh13Nil
    let listm_fold = v64 |> list.fold (v65, fn (acc, x) {
    let v66 = x
    let v67 = acc
    let v68 = Uh13Cons(v66, v67)
    v68
    })
    let v69 = listm_fold
    let v70 = Uh13Nil
    let v71 = method261(v69, v70)
    let v72 = -1
    let v73 = method262(v44, v71, v72)
    let v74 = dict.get(v44, v73)
    let v75 = method259()
    let v76 = method260()
    let v77 = case v74 { Ok(x) -> v75(x) Error(x) -> v76(x) }
    let v82 =
        case v77  {
            Us56Error -> Us2None
            Us56Ok(v78) -> Us2Some(v78)
        }
    let v86 =
        case v82  {
            Us2None -> panic as "dictm.present: the key is not in the dict"
            Us2Some(v83) -> v83
        }
    let v87 = unicode_erlang_characters_to_binary([0])
    let v88 = v62 <> v87 
    let v89 = v88 <> v86 
    let v90 = hash_text_240(v89)
    let v91 = spiral_string_slice(v90, 0, 15)
    let v92 = dict.insert(v5, v0, v91)
    let v93 = dict.insert(v9, v0, Nil)
    let #(v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133) =
        case v22  {
            Us53Some(v94) -> method263(v94, v1, v2, v3, v4, v92, v6, v7, v8, v93, v10, v11, v12, v13)
            _ -> {
                let #(v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120) =
                    case v22  {
                        Us53None -> #(v1, v2, v3, v4, v92, v6, v7, v8, v93, v10, v11, v12, v13)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120)
            }
        }
    #(v121, v122, v123, v124, v125, v126, v127, v128, v129, v130, v131, v132, v133)
}

pub fn ok_c55(capt: Nil) -> fn(#(Int, Bool)) -> Us57 {
    fn (dom) {
        let #(v0, v1) = dom
        Us57Ok(v0, v1)
    }
}

pub fn method264() -> fn(#(Int, Bool)) -> Us57 {
    ok_c55(Nil)
}

pub fn error_c56(capt: Nil) -> fn(Nil) -> Us57 {
    fn (dom) {
        Us57Error
    }
}

pub fn method265() -> fn(Nil) -> Us57 {
    error_c56(Nil)
}

pub fn ok_c57(capt: Nil) -> fn(dict.Dict(String, Nil)) -> Us59 {
    fn (v0) {
        Us59Ok(v0)
    }
}

pub fn method266() -> fn(dict.Dict(String, Nil)) -> Us59 {
    ok_c57(Nil)
}

pub fn error_c58(capt: Nil) -> fn(Nil) -> Us59 {
    fn (dom) {
        Us59Error
    }
}

pub fn method267() -> fn(Nil) -> Us59 {
    error_c58(Nil)
}

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

pub fn frame_edit_gathered_269(v0: Int, v1: String, v2: Int, v3: Int, v4: Int, v5: String, v6: dict.Dict(Int, Nil), v7: Uh15, v8: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v9: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v10: dict.Dict(String, String), v11: dict.Dict(String, Uh3), v12: dict.Dict(String, dict.Dict(String, Nil)), v13: dict.Dict(String, #(Int, Bool)), v14: dict.Dict(String, Nil), v15: Int, v16: Int, v17: Int, v18: Int) -> Us47 {
    let v19 = "edit\n"
    let v20 = v19 <> v1 
    let v21 = "\n"
    let v22 = v20 <> v21 
    let v23 = string.inspect(v2)
    let v24 = v22 <> v23 
    let v25 = closure59(#(v1, v2, v3, v4, v5))
    let v26 = closure60(Nil)
    frame_gathered_245(v24, v0, v3, v4, v5, v25, v26, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
}

pub fn revision_applied_268(v0: Int, v1: Us18, v2: dict.Dict(Int, Nil), v3: Uh15, v4: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v5: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v6: dict.Dict(String, String), v7: dict.Dict(String, Uh3), v8: dict.Dict(String, dict.Dict(String, Nil)), v9: dict.Dict(String, #(Int, Bool)), v10: dict.Dict(String, Nil), v11: Int, v12: Int, v13: Int, v14: Int) -> Us47 {
    case v1  {
        Us18Deleted(v56) -> {
            let v57 = dict.get(v5, v56)
            let v58 = method257()
            let v59 = method258()
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
            let v18 = method257()
            let v19 = method258()
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
                    let #(v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45) = rekeyed_256(v15, v2, v3, v4, v32, v6, v7, v8, v9, v10, v11, v12, v13, v14)
                    Us47Applied(v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v45)
                }
            }
        }
        Us18FrameEdited(v50, v51, v52, v53, v54) -> frame_edit_gathered_269(v0, v50, v51, v52, v53, v54, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    }
}

pub fn frame_done_249(v0: String, v1: dict.Dict(Int, #(Int, Int, String)), v2: Int, v3: fn(String) -> Us16, v4: fn(#(Int, Int, Int, Int)) -> #(Int, Int, Int, Int), v5: dict.Dict(Int, Nil), v6: Uh15, v7: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v8: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v9: dict.Dict(String, String), v10: dict.Dict(String, Uh3), v11: dict.Dict(String, dict.Dict(String, Nil)), v12: dict.Dict(String, #(Int, Bool)), v13: dict.Dict(String, Nil), v14: Int, v15: Int, v16: Int, v17: Int) -> Us47 {
    let v18 = dict.size(v1)
    let v19 = 0
    let v20 = method250(v18, v1, v19)
    let v21 = ""
    let v22 = delimited_21(v21, v20)
    let v23 = restored_text_227(v22)
    let v24 = v3(v23)
    let v25 = dict.delete(v7, v0)
    let #(v26, v27, v28, v29) = v4(#(v14, v15, v16, v17))
    completed_253(v2, v24, v5, v6, v25, v8, v9, v10, v11, v12, v13, v26, v27, v28, v29)
}

pub fn frame_step_248(v0: String, v1: dict.Dict(Int, #(Int, Int, String)), v2: Int, _v3: Int, v4: Int, _v5: String, v6: fn(String) -> Us16, v7: fn(#(Int, Int, Int, Int)) -> #(Int, Int, Int, Int), v8: dict.Dict(Int, Nil), v9: Uh15, v10: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v11: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v12: dict.Dict(String, String), v13: dict.Dict(String, Uh3), v14: dict.Dict(String, dict.Dict(String, Nil)), v15: dict.Dict(String, #(Int, Bool)), v16: dict.Dict(String, Nil), v17: Int, v18: Int, v19: Int, v20: Int) -> Us47 {
    let v21 = dict.size(v1)
    let v22 = v21 == v4
    case v22 {
        True -> frame_done_249(v0, v1, v2, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20)
        False -> {
            let v24 = dict.insert(v10, v0, #(v1, v2))
            Us47Applied(v8, v9, v24, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20)
        }
    }
}

pub fn frame_gathered_245(v0: String, v1: Int, v2: Int, v3: Int, v4: String, v5: fn(String) -> Us16, v6: fn(#(Int, Int, Int, Int)) -> #(Int, Int, Int, Int), v7: dict.Dict(Int, Nil), v8: Uh15, v9: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v10: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v11: dict.Dict(String, String), v12: dict.Dict(String, Uh3), v13: dict.Dict(String, dict.Dict(String, Nil)), v14: dict.Dict(String, #(Int, Bool)), v15: dict.Dict(String, Nil), v16: Int, v17: Int, v18: Int, v19: Int) -> Us47 {
    let v20 = dict.get(v9, v0)
    let v21 = method246()
    let v22 = method247()
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
    frame_step_248(v0, v37, v39, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
}

pub fn content_applied_244(v0: Int, v1: Us17, v2: dict.Dict(Int, Nil), v3: Uh15, v4: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v5: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v6: dict.Dict(String, String), v7: dict.Dict(String, Uh3), v8: dict.Dict(String, dict.Dict(String, Nil)), v9: dict.Dict(String, #(Int, Bool)), v10: dict.Dict(String, Nil), v11: Int, v12: Int, v13: Int, v14: Int) -> Us47 {
    case v1  {
        Us17Framed(v76, v77, v78, v79, v80) -> {
            let v81 = "post\n"
            let v82 = v81 <> v76 
            let v83 = closure43(#(v76, v77, v78, v79, v80))
            let v84 = closure44(Nil)
            frame_gathered_245(v82, v0, v78, v79, v80, v83, v84, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
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
                            let v26 = method254()
                            let v27 = method255()
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
                            let #(v40, v41, v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52) = rekeyed_256(v15, v2, v3, v4, v24, v6, v39, v8, v9, v10, v11, v12, v13, v14)
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
                    let #(v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73) = rekeyed_256(v15, v2, v3, v4, v58, v59, v60, v8, v9, v10, v11, v12, v13, v14)
                    Us47Applied(v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73)
                }
            }
        }
    }
}

pub fn applied_event_243(v0: Int, v1: Us16, v2: dict.Dict(Int, Nil), v3: Uh15, v4: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v5: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v6: dict.Dict(String, String), v7: dict.Dict(String, Uh3), v8: dict.Dict(String, dict.Dict(String, Nil)), v9: dict.Dict(String, #(Int, Bool)), v10: dict.Dict(String, Nil), v11: Int, v12: Int, v13: Int, v14: Int) -> Us47 {
    case v1  {
        Us16Content(v15) -> content_applied_244(v0, v15, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
        Us16Reaction(v19) -> {
            case v19  {
                Us19Liked(v20, v21) -> {
                    let v22 = dict.has_key(v5, v20)
                    let v23 = v22 == False
                    case v23 {
                        True -> Us47Waiting
                        False -> {
                            let v25 = "\n"
                            let v26 = v20 <> v25 
                            let v27 = v26 <> v21 
                            let v28 = dict.get(v9, v27)
                            let v29 = method264()
                            let v30 = method265()
                            let v31 = case v28 { Ok(x) -> v29(x) Error(x) -> v30(x) }
                            let v37 =
                                case v31  {
                                    Us57Error -> Us58None
                                    Us57Ok(v32, v33) -> Us58Some(v32, v33)
                                }
                            let v42 =
                                case v37  {
                                    Us58None -> False
                                    Us58Some(v38, v39) -> {
                                        let v40 = v38 > v0
                                        v40
                                    }
                                }
                            case v42 {
                                True -> Us47Applied(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
                                False -> {
                                    let v44 = dict.new()
                                    let v45 = dict.get(v8, v20)
                                    let v46 = method266()
                                    let v47 = method267()
                                    let v48 = case v45 { Ok(x) -> v46(x) Error(x) -> v47(x) }
                                    let v53 =
                                        case v48  {
                                            Us59Error -> Us60None
                                            Us59Ok(v49) -> Us60Some(v49)
                                        }
                                    let v56 =
                                        case v53  {
                                            Us60None -> v44
                                            Us60Some(v54) -> v54
                                        }
                                    let v57 = dict.insert(v56, v21, Nil)
                                    let v58 = dict.insert(v8, v20, v57)
                                    let v59 = v20 <> v25 
                                    let v60 = v59 <> v21 
                                    let v61 = dict.insert(v9, v60, #(v0, True))
                                    let v62 = dict.insert(v10, v20, Nil)
                                    Us47Applied(v2, v3, v4, v5, v6, v7, v58, v61, v62, v11, v12, v13, v14)
                                }
                            }
                        }
                    }
                }
                Us19Unliked(v66, v67) -> {
                    let v68 = dict.has_key(v5, v66)
                    let v69 = v68 == False
                    case v69 {
                        True -> Us47Waiting
                        False -> {
                            let v71 = "\n"
                            let v72 = v66 <> v71 
                            let v73 = v72 <> v67 
                            let v74 = dict.get(v9, v73)
                            let v75 = method264()
                            let v76 = method265()
                            let v77 = case v74 { Ok(x) -> v75(x) Error(x) -> v76(x) }
                            let v83 =
                                case v77  {
                                    Us57Error -> Us58None
                                    Us57Ok(v78, v79) -> Us58Some(v78, v79)
                                }
                            let v88 =
                                case v83  {
                                    Us58None -> False
                                    Us58Some(v84, v85) -> {
                                        let v86 = v84 > v0
                                        v86
                                    }
                                }
                            case v88 {
                                True -> Us47Applied(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
                                False -> {
                                    let v90 = dict.new()
                                    let v91 = dict.get(v8, v66)
                                    let v92 = method266()
                                    let v93 = method267()
                                    let v94 = case v91 { Ok(x) -> v92(x) Error(x) -> v93(x) }
                                    let v99 =
                                        case v94  {
                                            Us59Error -> Us60None
                                            Us59Ok(v95) -> Us60Some(v95)
                                        }
                                    let v102 =
                                        case v99  {
                                            Us60None -> v90
                                            Us60Some(v100) -> v100
                                        }
                                    let v103 = dict.delete(v102, v67)
                                    let v104 = dict.insert(v8, v66, v103)
                                    let v105 = v66 <> v71 
                                    let v106 = v105 <> v67 
                                    let v107 = dict.insert(v9, v106, #(v0, False))
                                    let v108 = dict.insert(v10, v66, Nil)
                                    Us47Applied(v2, v3, v4, v5, v6, v7, v104, v107, v108, v11, v12, v13, v14)
                                }
                            }
                        }
                    }
                }
            }
        }
        Us16Revision(v17) -> revision_applied_268(v0, v17, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    }
}

pub fn completed_253(v0: Int, v1: Us16, v2: dict.Dict(Int, Nil), v3: Uh15, v4: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v5: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v6: dict.Dict(String, String), v7: dict.Dict(String, Uh3), v8: dict.Dict(String, dict.Dict(String, Nil)), v9: dict.Dict(String, #(Int, Bool)), v10: dict.Dict(String, Nil), v11: Int, v12: Int, v13: Int, v14: Int) -> Us47 {
    let v15 = applied_event_243(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    case v15  {
        Us47Applied(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28) -> Us47Applied(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28)
        Us47Waiting -> {
            let v30 = spiral_wrap_signed(v14 + 1, 32)
            let v31 = Uh15Cons(v0, v1, v3)
            Us47Applied(v2, v31, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v30)
        }
    }
}

pub fn method272(v0: Int, v1: Uh15, v2: Uh15) -> Uh15 {
    case v1  {
        Uh15Cons(v3, v4, v5) -> {
            let v6 = method272(v0, v5, v2)
            let v7 = v3 != v0
            case v7 {
                True -> Uh15Cons(v3, v4, v6)
                False -> v6
            }
        }
        Uh15Nil -> v2
    }
}

pub fn drained_270(v0: dict.Dict(Int, Nil), v1: Uh15, v2: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v3: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v4: dict.Dict(String, String), v5: dict.Dict(String, Uh3), v6: dict.Dict(String, dict.Dict(String, Nil)), v7: dict.Dict(String, #(Int, Bool)), v8: dict.Dict(String, Nil), v9: Int, v10: Int, v11: Int, v12: Int) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int) {
    let #(v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25) = drained_from_271(v1, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
    #(v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25)
}

pub fn drained_from_271(v0: Uh15, v1: dict.Dict(Int, Nil), v2: Uh15, v3: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v4: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v5: dict.Dict(String, String), v6: dict.Dict(String, Uh3), v7: dict.Dict(String, dict.Dict(String, Nil)), v8: dict.Dict(String, #(Int, Bool)), v9: dict.Dict(String, Nil), v10: Int, v11: Int, v12: Int, v13: Int) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int) {
    let #(v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110) =
        case v0  {
            Uh15Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
            _ -> {
                let #(v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95, v96, v97) =
                    case v0  {
                        Uh15Cons(v14, v15, v16) -> {
                            let v17 = applied_event_243(v14, v15, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
                            case v17  {
                                Us47Applied(v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30) -> {
                                    let v31 = Uh15Nil
                                    let v32 = method272(v14, v19, v31)
                                    drained_270(v18, v32, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30)
                                }
                                _ -> {
                                    let #(v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71) =
                                        case v17  {
                                            Us47Waiting -> drained_from_271(v16, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
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

pub fn delivered_242(v0: dict.Dict(Int, Nil), v1: Uh15, v2: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v3: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v4: dict.Dict(String, String), v5: dict.Dict(String, Uh3), v6: dict.Dict(String, dict.Dict(String, Nil)), v7: dict.Dict(String, #(Int, Bool)), v8: dict.Dict(String, Nil), v9: Int, v10: Int, v11: Int, v12: Int, v13: Int, v14: Us16) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int) {
    let v15 = dict.has_key(v0, v13)
    let #(v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85) =
        case v15 {
            True -> {
                let v16 = spiral_wrap_signed(v11 + 1, 32)
                #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v16, v12)
            }
            False -> {
                let v17 = dict.insert(v0, v13, Nil)
                let v18 = applied_event_243(v13, v14, v17, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                let #(v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72) =
                    case v18  {
                        Us47Applied(v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31) -> drained_270(v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31)
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

pub fn method274() -> fn(Int) -> Us61 {
    ok_c61(Nil)
}

pub fn error_c62(capt: Nil) -> fn(Nil) -> Us61 {
    fn (dom) {
        Us61Error
    }
}

pub fn method275() -> fn(Nil) -> Us61 {
    error_c62(Nil)
}

pub fn method273(v0: dict.Dict(String, Int), v1: Int, v2: Uh3, v3: Uh3) -> Uh3 {
    case v2  {
        Uh3Cons(v4, v5) -> {
            let v6 = method273(v0, v1, v5, v3)
            let v7 = dict.get(v0, v4)
            let v8 = method274()
            let v9 = method275()
            let v10 = case v7 { Ok(x) -> v8(x) Error(x) -> v9(x) }
            let v15 =
                case v10  {
                    Us61Error -> Us3None
                    Us61Ok(v11) -> Us3Some(v11)
                }
            let v19 =
                case v15  {
                    Us3None -> panic as "dictm.present: the key is not in the dict"
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

pub fn method276(v0: Uh3, v1: dict.Dict(String, Int)) -> dict.Dict(String, Int) {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = dict.delete(v1, v2)
            method276(v3, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method277(v0: Uh3, v1: dict.Dict(Int, Nil), v2: Uh15, v3: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v4: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v5: dict.Dict(String, String), v6: dict.Dict(String, Uh3), v7: dict.Dict(String, dict.Dict(String, Nil)), v8: dict.Dict(String, #(Int, Bool)), v9: dict.Dict(String, Nil), v10: Int, v11: Int, v12: Int, v13: Int, v14: dict.Dict(String, Uh3), v15: Uh3, v16: dict.Dict(String, #(Us45, String)), v17: dict.Dict(String, Int), v18: dict.Dict(String, String), v19: dict.Dict(String, String), v20: dict.Dict(String, Int), v21: Int, v22: dict.Dict(String, Int), v23: dict.Dict(String, Int), v24: dict.Dict(String, Int), v25: Int, v26: Int, v27: Int, v28: Int, v29: Int, v30: dict.Dict(String, #(String, Us45, String)), v31: Bool, v32: Bool, v33: Us30, v34: Bool, v35: Int, v36: Uh28) -> #(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28) {
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
                                        let v44 = method274()
                                        let v45 = method275()
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
                method277(v38, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125, v126, v127, v128)
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

pub fn method279(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method279(v0, v4, v2)
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
        let v2 = v1 == v0
        v2
    }
}

pub fn method280(v0: String) -> fn(String) -> Bool {
    closure63(#(v0))
}

pub fn method281(v0: String, v1: fn(String) -> Bool, v2: Uh3) -> Bool {
    case v2  {
        Uh3Cons(v3, v4) -> {
            let v5 = v1(v3)
            case v5 {
                True -> True
                False -> {
                    let v6 = method280(v0)
                    method281(v0, v6, v4)
                }
            }
        }
        Uh3Nil -> False
    }
}
