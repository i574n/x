import gleam/dict
import gleam/list
import xsim_frames/types.{type Uh0, type Uh1, type Uh2, type Uh3, type Us2, type Uh6, type Uh15, type Us30, type Us45, type Uh28, type Uh33, Uh0Cons, Uh0Nil, Uh13Cons, Uh13Nil, Uh3Cons, Uh3Nil, Uh6Cons, Uh6Nil, Us12Broken, Us12Held, Us13SequentialEquivalence, Us2None, Us2Some, Us3None, Us3Some, Us45Crashed, Us45Done, Us45Erred, Us54Error, Us54Ok, Us55None, Us55Some, Us56Error, Us56Ok, Us61Error, Us61Ok, Us79None, Us79Some}
import xsim_frames/part1.{dictm_term_sorted, spiral_wrap_signed}
import xsim_frames/part10.{method257, method258, method259, method260, method261, method262}
import xsim_frames/part11.{method274, method275}
import xsim_frames/part12.{chain_sources_284}
import xsim_frames/part17.{method379}
import xsim_frames/part2.{masked_cells_28, masked_threads_29, method18, method25, method26}

pub fn method378(v0: Uh0, v1: Uh1, v2: Uh2, v3: Uh2, v4: Uh2, v5: Uh3, v6: Bool, v7: dict.Dict(Int, Nil), v8: Uh15, v9: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v10: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v11: dict.Dict(String, String), v12: dict.Dict(String, Uh3), v13: dict.Dict(String, dict.Dict(String, Nil)), v14: dict.Dict(String, #(Int, Bool)), v15: dict.Dict(String, Nil), v16: Int, v17: Int, v18: Int, v19: Int, v20: dict.Dict(String, Uh3), v21: Uh3, v22: dict.Dict(String, #(Us45, String)), v23: dict.Dict(String, Int), v24: dict.Dict(String, String), v25: dict.Dict(String, String), v26: dict.Dict(String, Int), v27: Int, v28: dict.Dict(String, Int), v29: dict.Dict(String, Int), v30: dict.Dict(String, Int), v31: Int, v32: Int, v33: Int, v34: Int, v35: Int, v36: dict.Dict(String, #(String, Us45, String)), v37: Bool, v38: Bool, v39: Us30, v40: Bool, v41: Int, v42: Uh28, v43: Uh33, v44: fn(Uh3) -> #(Us45, String), v45: Uh0, v46: Uh0) -> Uh0 {
    case v45  {
        Uh0Cons(v47, v48, v49, v50, v51) -> {
            let v52 = method378(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41, v42, v43, v44, v51, v46)
            let v53 = method25(v47, v48, v49, v50)
            let v54 = method26(v47, v48, v49, v50, v53, v1)
            let v91 =
                case v54 {
                    True -> {
                        let v55 = Us2Some(v47)
                        let v56 = Uh3Nil
                        let v57 = chain_sources_284(v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v55, v56)
                        let v58 = method379(v57, v43)
                        let #(v66, v67) =
                            case v58  {
                                Us79Some(v59, v60, v61) -> #(v60, v61)
                                _ -> {
                                    let #(v64, v65) =
                                        case v58  {
                                            Us79None -> v44(v57)
                                            _ -> panic as "spiral: union case ruled out by partial evaluation"
                                        }
                                    #(v64, v65)
                                }
                            }
                        let v68 =
                            case v66  {
                                Us45Done -> True
                                _ -> False
                            }
                        let v74 =
                            case v66  {
                                Us45Crashed -> {
                                    let v71 = "crash"
                                    v71
                                }
                                Us45Done -> {
                                    let v69 = "ok"
                                    v69
                                }
                                Us45Erred -> {
                                    let v70 = "error"
                                    v70
                                }
                            }
                        let v75 = "|"
                        let v76 = v74 <> v75 
                        let v77 = v76 <> v67 
                        let v78 = 0
                        let v79 = ""
                        let v80 = masked_cells_28(v77, v78, v79)
                        let v81 = 0
                        let v82 = masked_threads_29(v80, v81, v79)
                        let v83 = 0
                        let v84 = masked_cells_28(v50, v83, v79)
                        let v85 = 0
                        let v86 = masked_threads_29(v84, v85, v79)
                        let v87 = v68 == v49
                        let v89 =
                            case v87 {
                                True -> {
                                    let v88 = v82 == v86
                                    v88
                                }
                                False -> False
                            }
                        let v90 = v89 == False
                        v90
                    }
                    False -> False
                }
            case v91 {
                True -> Uh0Cons(v47, v48, v49, v50, v52)
                False -> v52
            }
        }
        Uh0Nil -> v46
    }
}

pub fn method380(v0: Uh3, v1: dict.Dict(String, Nil)) -> dict.Dict(String, Nil) {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = dict.insert(v1, v2, Nil)
            method380(v3, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn method381(v0: dict.Dict(Int, Nil), v1: Uh15, v2: dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), v3: dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), v4: dict.Dict(String, String), v5: dict.Dict(String, Uh3), v6: dict.Dict(String, dict.Dict(String, Nil)), v7: dict.Dict(String, #(Int, Bool)), v8: dict.Dict(String, Nil), v9: Int, v10: Int, v11: Int, v12: Int, v13: dict.Dict(String, Uh3), v14: Uh3, v15: dict.Dict(String, #(Us45, String)), v16: dict.Dict(String, Int), v17: dict.Dict(String, String), v18: dict.Dict(String, String), v19: dict.Dict(String, Int), v20: Int, v21: dict.Dict(String, Int), v22: dict.Dict(String, Int), v23: dict.Dict(String, Int), v24: Int, v25: Int, v26: Int, v27: Int, v28: Int, v29: dict.Dict(String, #(String, Us45, String)), v30: Bool, v31: Bool, v32: Us30, v33: Bool, v34: Int, v35: Uh28, v36: dict.Dict(String, Nil), v37: Uh0, v38: Uh0) -> Uh0 {
    case v37  {
        Uh0Cons(v39, v40, v41, v42, v43) -> {
            let v44 = method381(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v43, v38)
            let v86 =
                case v41 {
                    True -> {
                        let v45 = dict.get(v3, v39)
                        let v46 = method257()
                        let v47 = method258()
                        let v48 = case v45 { Ok(x) -> v46(x) Error(x) -> v47(x) }
                        let v55 =
                            case v48  {
                                Us54Error -> Us55None
                                Us54Ok(v49, v50, v51) -> Us55Some(v49, v50, v51)
                            }
                        case v55  {
                            Us55None -> False
                            Us55Some(v56, v57, v58) -> {
                                let v59 = dict.keys(v57)
                                let v60 = dictm_term_sorted(v59)
                                let v61 = Uh13Nil
                                let listm_fold = v60 |> list.fold (v61, fn (acc, x) {
                                let v62 = x
                                let v63 = acc
                                let v64 = Uh13Cons(v62, v63)
                                v64
                                })
                                let v65 = listm_fold
                                let v66 = Uh13Nil
                                let v67 = method261(v65, v66)
                                let v68 = -1
                                let v69 = method262(v57, v67, v68)
                                let v70 = dict.get(v57, v69)
                                let v71 = method259()
                                let v72 = method260()
                                let v73 = case v70 { Ok(x) -> v71(x) Error(x) -> v72(x) }
                                let v78 =
                                    case v73  {
                                        Us56Error -> Us2None
                                        Us56Ok(v74) -> Us2Some(v74)
                                    }
                                let v82 =
                                    case v78  {
                                        Us2None -> panic as "dict.present: the key is not in the dict"
                                        Us2Some(v79) -> v79
                                    }
                                let v83 = dict.has_key(v36, v82)
                                v83
                            }
                        }
                    }
                    False -> False
                }
            case v86 {
                True -> Uh0Cons(v39, v40, v41, v42, v44)
                False -> v44
            }
        }
        Uh0Nil -> v38
    }
}

pub fn method382(v0: Uh6, v1: Uh6) -> Uh6 {
    case v0  {
        Uh6Cons(v2, v3, v4) -> {
            let v5 = method382(v4, v1)
            Uh6Cons(v2, v3, v5)
        }
        Uh6Nil -> v1
    }
}

pub fn method383(v0: dict.Dict(String, Int), v1: Uh3, v2: Int) -> Int {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = dict.get(v0, v3)
            let v6 = method274()
            let v7 = method275()
            let v8 = case v5 { Ok(x) -> v6(x) Error(x) -> v7(x) }
            let v13 =
                case v8  {
                    Us61Error -> Us3None
                    Us61Ok(v9) -> Us3Some(v9)
                }
            let v17 =
                case v13  {
                    Us3None -> panic as "dict.present: the key is not in the dict"
                    Us3Some(v14) -> v14
                }
            let v18 = spiral_wrap_signed(v2 + v17, 32)
            method383(v0, v4, v18)
        }
        Uh3Nil -> v2
    }
}

pub fn method384(v0: Uh6, v1: Uh3) -> Uh3 {
    case v0  {
        Uh6Cons(v2, v3, v4) -> {
            let v5 = method384(v4, v1)
            let v12 =
                case v3  {
                    Us12Broken(v6) -> {
                        let v7 =
                            case v2  {
                                Us13SequentialEquivalence -> True
                                _ -> False
                            }
                        case v7 {
                            True -> v6
                            False -> Uh3Nil
                        }
                    }
                    Us12Held -> Uh3Nil
                }
            method18(v12, v5)
        }
        Uh6Nil -> v1
    }
}
