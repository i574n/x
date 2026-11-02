import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/list
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Uh31, type Us92, type Us93, type Us95, Uh29Cons, Uh29Nil, Uh31Cons, Uh31Nil, Uh39Cons, Uh39Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us56Error, Us56Ok, Us72None, Us72Some, Us75OnX, Us92AppBearer, Us93Elsewhere, Us93Following, Us93Lookup, Us93SearchAll, Us93Single, Us93Timeline, Us93UsersBy, Us93UsersByIds, Us94Error, Us94Ok}
import xsim_frames/part1.{dictm_term_sorted, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, method4, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part10.{method259, method260}
import xsim_frames/part17.{units_on_348}
import xsim_frames/part28.{first_value_474, logged_464, method471, method472, route_of_470}
import xsim_frames/part29.{following_473}
import xsim_frames/part32.{timeline_483, users_reply_549}
import xsim_frames/part33.{lookup_560, method574, method575, search_body_569, search_terms_565, single_563, window_start_568}

pub fn by_id_desc_577(v0: Dynamic, v1: Uh29) -> Uh29 {
    case v1  {
        Uh29Cons(v2, v3) -> {
            let v4 = ""
            let v5 = erlang_term_coerce(v4)
            let v6 = "id"
            let v7 = erlang_term_coerce(v6)
            let v8 = erlang_term_coerce(v5)
            let v9 = "maps"
            let v10 = atom.create(v9)
            let v11 = "get"
            let v12 = atom.create(v11)
            let v13 = []
            let v14 = [v8, ..v13]
            let v15 = [v2, ..v14]
            let v16 = [v7, ..v15]
            let v17 = erlang_term_apply(v10, v12, v16)
            let v18 = erlang_term_coerce(v17)
            let v19 = "erlang"
            let v20 = atom.create(v19)
            let v21 = "is_binary"
            let v22 = atom.create(v21)
            let v23 = []
            let v24 = [v18, ..v23]
            let v25 = erlang_term_apply(v20, v22, v24)
            let v26 = erlang_term_coerce(v25)
            let v35 =
                case v26 {
                    True -> {
                        let v27 = erlang_term_coerce(v18)
                        v27
                    }
                    False -> {
                        let v28 = atom.create(v19)
                        let v29 = "integer_to_binary"
                        let v30 = atom.create(v29)
                        let v31 = []
                        let v32 = [v18, ..v31]
                        let v33 = erlang_term_apply(v28, v30, v32)
                        let v34 = erlang_term_coerce(v33)
                        v34
                    }
                }
            let v36 = spiral_string_length(v35)
            let v37 = string.inspect(v36)
            let v38 = erlang_term_coerce(v37)
            let v39 = erlang_term_coerce(10)
            let v40 = "leading"
            let v41 = atom.create(v40)
            let v42 = erlang_term_coerce(v41)
            let v43 = "0"
            let v44 = erlang_term_coerce(v43)
            let v45 = "unicode"
            let v46 = atom.create(v45)
            let v47 = "characters_to_list"
            let v48 = atom.create(v47)
            let v49 = []
            let v50 = [v44, ..v49]
            let v51 = erlang_term_apply(v46, v48, v50)
            let v52 = "string"
            let v53 = atom.create(v52)
            let v54 = "pad"
            let v55 = atom.create(v54)
            let v56 = []
            let v57 = [v51, ..v56]
            let v58 = [v42, ..v57]
            let v59 = [v39, ..v58]
            let v60 = [v38, ..v59]
            let v61 = erlang_term_apply(v53, v55, v60)
            let v62 = atom.create(v19)
            let v63 = "iolist_to_binary"
            let v64 = atom.create(v63)
            let v65 = []
            let v66 = [v61, ..v65]
            let v67 = erlang_term_apply(v62, v64, v66)
            let v68 = erlang_term_coerce(v67)
            let v69 = "|"
            let v70 = v68 <> v69 
            let v71 = v70 <> v35 
            let v72 = erlang_term_coerce(v4)
            let v73 = erlang_term_coerce(v6)
            let v74 = erlang_term_coerce(v72)
            let v75 = atom.create(v9)
            let v76 = atom.create(v11)
            let v77 = []
            let v78 = [v74, ..v77]
            let v79 = [v0, ..v78]
            let v80 = [v73, ..v79]
            let v81 = erlang_term_apply(v75, v76, v80)
            let v82 = erlang_term_coerce(v81)
            let v83 = atom.create(v19)
            let v84 = atom.create(v21)
            let v85 = []
            let v86 = [v82, ..v85]
            let v87 = erlang_term_apply(v83, v84, v86)
            let v88 = erlang_term_coerce(v87)
            let v97 =
                case v88 {
                    True -> {
                        let v89 = erlang_term_coerce(v82)
                        v89
                    }
                    False -> {
                        let v90 = atom.create(v19)
                        let v91 = "integer_to_binary"
                        let v92 = atom.create(v91)
                        let v93 = []
                        let v94 = [v82, ..v93]
                        let v95 = erlang_term_apply(v90, v92, v94)
                        let v96 = erlang_term_coerce(v95)
                        v96
                    }
                }
            let v98 = spiral_string_length(v97)
            let v99 = string.inspect(v98)
            let v100 = erlang_term_coerce(v99)
            let v101 = erlang_term_coerce(10)
            let v102 = atom.create(v40)
            let v103 = erlang_term_coerce(v102)
            let v104 = erlang_term_coerce(v43)
            let v105 = atom.create(v45)
            let v106 = atom.create(v47)
            let v107 = []
            let v108 = [v104, ..v107]
            let v109 = erlang_term_apply(v105, v106, v108)
            let v110 = atom.create(v52)
            let v111 = atom.create(v54)
            let v112 = []
            let v113 = [v109, ..v112]
            let v114 = [v103, ..v113]
            let v115 = [v101, ..v114]
            let v116 = [v100, ..v115]
            let v117 = erlang_term_apply(v110, v111, v116)
            let v118 = atom.create(v19)
            let v119 = atom.create(v63)
            let v120 = []
            let v121 = [v117, ..v120]
            let v122 = erlang_term_apply(v118, v119, v121)
            let v123 = erlang_term_coerce(v122)
            let v124 = v123 <> v69 
            let v125 = v124 <> v97 
            let v126 = erlang_term_coerce(v71)
            let v127 = erlang_term_coerce(v125)
            let v128 = atom.create(v19)
            let v129 = ">="
            let v130 = atom.create(v129)
            let v131 = []
            let v132 = [v127, ..v131]
            let v133 = [v126, ..v132]
            let v134 = erlang_term_apply(v128, v130, v133)
            let v135 = erlang_term_coerce(v134)
            case v135 {
                True -> {
                    let v136 = by_id_desc_577(v0, v3)
                    Uh29Cons(v2, v136)
                }
                False -> Uh29Cons(v0, v1)
            }
        }
        _ -> Uh29Cons(v0, v1)
    }
}

pub fn method576(v0: Uh29, v1: Uh29) -> Uh29 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = by_id_desc_577(v2, v1)
            method576(v3, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn found_posts_573(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, v5: dict.Dict(String, Dynamic), _v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, v12: String, v13: String, v14: String) -> Uh29 {
    let v15 = dict.keys(v5)
    let v16 = dictm_term_sorted(v15)
    let v17 = Uh3Nil
    let listm_fold = v16 |> list.fold (v17, fn (acc, x) {
    let v18 = x
    let v19 = acc
    let v20 = Uh3Cons(v18, v19)
    v20
    })
    let v21 = listm_fold
    let v22 = Uh3Nil
    let v23 = method4(v21, v22)
    let v24 = Uh29Nil
    let v25 = method574(v5, v23, v24)
    let v26 = Uh29Nil
    let v27 = method575(v12, v13, v14, v25, v26)
    let v28 = Uh29Nil
    method576(v27, v28)
}

pub fn search_564(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Bool, v13: String) -> Dynamic {
    let v14 = search_terms_565(v13)
    let v15 =
        case v12 {
            True -> 30
            False -> 7
        }
    let v16 = window_start_568(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v15)
    let v17 = "start_time"
    let v18 = v13 == ""
    let v22 =
        case v18 {
            True -> Uh3Nil
            False -> {
                let v20 = "&"
                split_list_2(v20, v13)
            }
        }
    let v23 = first_value_474(v17, v22)
    let v24 = v23 == ""
    let v26 =
        case v24 {
            True -> {
                let v25 = ""
                v25
            }
            False -> v23
        }
    let v27 = spiral_string_slice(v26, 0, 18)
    let v28 = v27 != ""
    let v42 =
        case v28 {
            True -> {
                case v12 {
                    True -> True
                    False -> {
                        let v29 = erlang_term_coerce(v16)
                        let v30 = erlang_term_coerce(v27)
                        let v31 = "erlang"
                        let v32 = atom.create(v31)
                        let v33 = ">="
                        let v34 = atom.create(v33)
                        let v35 = []
                        let v36 = [v30, ..v35]
                        let v37 = [v29, ..v36]
                        let v38 = erlang_term_apply(v32, v34, v37)
                        let v39 = erlang_term_coerce(v38)
                        let v40 = v39 == False
                        v40
                    }
                }
            }
            False -> False
        }
    let v43 =
        case v42 {
            True -> v27
            False -> v16
        }
    let v44 = "conversation_id"
    let v45 = dict.has_key(v14, v44)
    let v60 =
        case v45 {
            True -> {
                let v46 = dict.get(v14, v44)
                let v47 = method259()
                let v48 = method260()
                let v49 = case v46 { Ok(x) -> v47(x) Error(x) -> v48(x) }
                let v54 =
                    case v49  {
                        Us56Error -> Us2None
                        Us56Ok(v50) -> Us2Some(v50)
                    }
                case v54  {
                    Us2None -> panic as "dict.present: the key is not in the dict"
                    Us2Some(v55) -> v55
                }
            }
            False -> {
                let v59 = ""
                v59
            }
        }
    let v61 = "from"
    let v62 = dict.has_key(v14, v61)
    let v77 =
        case v62 {
            True -> {
                let v63 = dict.get(v14, v61)
                let v64 = method259()
                let v65 = method260()
                let v66 = case v63 { Ok(x) -> v64(x) Error(x) -> v65(x) }
                let v71 =
                    case v66  {
                        Us56Error -> Us2None
                        Us56Ok(v67) -> Us2Some(v67)
                    }
                case v71  {
                    Us2None -> panic as "dict.present: the key is not in the dict"
                    Us2Some(v72) -> v72
                }
            }
            False -> {
                let v76 = ""
                v76
            }
        }
    let v78 = v77 |> string.lowercase
    let v79 = dict.has_key(v2, v78)
    let v126 =
        case v79 {
            True -> {
                let v80 = v77 |> string.lowercase
                let v81 = dict.get(v2, v80)
                let v82 = method471()
                let v83 = method472()
                let v84 = case v81 { Ok(x) -> v82(x) Error(x) -> v83(x) }
                let v89 =
                    case v84  {
                        Us94Error -> Us72None
                        Us94Ok(v85) -> Us72Some(v85)
                    }
                let v93 =
                    case v89  {
                        Us72None -> panic as "dict.present: the key is not in the dict"
                        Us72Some(v90) -> v90
                    }
                let v94 = ""
                let v95 = erlang_term_coerce(v94)
                let v96 = "id"
                let v97 = erlang_term_coerce(v96)
                let v98 = erlang_term_coerce(v95)
                let v99 = "maps"
                let v100 = atom.create(v99)
                let v101 = "get"
                let v102 = atom.create(v101)
                let v103 = []
                let v104 = [v98, ..v103]
                let v105 = [v93, ..v104]
                let v106 = [v97, ..v105]
                let v107 = erlang_term_apply(v100, v102, v106)
                let v108 = erlang_term_coerce(v107)
                let v109 = "erlang"
                let v110 = atom.create(v109)
                let v111 = "is_binary"
                let v112 = atom.create(v111)
                let v113 = []
                let v114 = [v108, ..v113]
                let v115 = erlang_term_apply(v110, v112, v114)
                let v116 = erlang_term_coerce(v115)
                case v116 {
                    True -> {
                        let v117 = erlang_term_coerce(v108)
                        v117
                    }
                    False -> {
                        let v118 = atom.create(v109)
                        let v119 = "integer_to_binary"
                        let v120 = atom.create(v119)
                        let v121 = []
                        let v122 = [v108, ..v121]
                        let v123 = erlang_term_apply(v118, v120, v122)
                        let v124 = erlang_term_coerce(v123)
                        v124
                    }
                }
            }
            False -> v77
        }
    let v127 = v60 == ""
    case v127 {
        True -> {
            let v128 = Uh29Nil
            search_body_569(v128, v13)
        }
        False -> {
            let v130 = found_posts_573(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v60, v126, v43)
            search_body_569(v130, v13)
        }
    }
}

pub fn post_reply_559(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, _v12: String, _v13: String, v14: String, _v15: String, _v16: String, v17: Us93) -> String {
    case v17  {
        Us93Lookup -> {
            let v59 = lookup_560(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v14)
            let v60 = "json"
            let v61 = atom.create(v60)
            let v62 = "encode"
            let v63 = atom.create(v62)
            let v64 = []
            let v65 = [v59, ..v64]
            let v66 = erlang_term_apply(v61, v63, v65)
            let v67 = "erlang"
            let v68 = atom.create(v67)
            let v69 = "iolist_to_binary"
            let v70 = atom.create(v69)
            let v71 = []
            let v72 = [v66, ..v71]
            let v73 = erlang_term_apply(v68, v70, v72)
            let v74 = erlang_term_coerce(v73)
            let v75 = string.inspect(200)
            let v76 = "HTTP/1.1 "
            let v77 = v76 <> v75 
            let v78 = " "
            let v79 = v77 <> v78 
            let v80 = "OK"
            let v81 = v79 <> v80 
            let v82 = erlang_term_coerce(v74)
            let v83 = atom.create(v67)
            let v84 = "byte_size"
            let v85 = atom.create(v84)
            let v86 = []
            let v87 = [v82, ..v86]
            let v88 = erlang_term_apply(v83, v85, v87)
            let v89 = erlang_term_coerce(v88)
            let v90 = string.inspect(v89)
            let v91 = "\r\nContent-Length: "
            let v92 = v91 <> v90 
            let v93 = "\r\nContent-Type: application/json; charset=utf-8"
            let v94 = v93 <> v92 
            let v95 = "\r\nConnection: close\r\n\r\n"
            let v96 = v94 <> v95 
            let v97 = v81 <> v96 
            let v98 = v97 <> v74 
            v98
        }
        Us93Single(v18) -> {
            let v19 = single_563(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v18, v14)
            let v20 = "json"
            let v21 = atom.create(v20)
            let v22 = "encode"
            let v23 = atom.create(v22)
            let v24 = []
            let v25 = [v19, ..v24]
            let v26 = erlang_term_apply(v21, v23, v25)
            let v27 = "erlang"
            let v28 = atom.create(v27)
            let v29 = "iolist_to_binary"
            let v30 = atom.create(v29)
            let v31 = []
            let v32 = [v26, ..v31]
            let v33 = erlang_term_apply(v28, v30, v32)
            let v34 = erlang_term_coerce(v33)
            let v35 = string.inspect(200)
            let v36 = "HTTP/1.1 "
            let v37 = v36 <> v35 
            let v38 = " "
            let v39 = v37 <> v38 
            let v40 = "OK"
            let v41 = v39 <> v40 
            let v42 = erlang_term_coerce(v34)
            let v43 = atom.create(v27)
            let v44 = "byte_size"
            let v45 = atom.create(v44)
            let v46 = []
            let v47 = [v42, ..v46]
            let v48 = erlang_term_apply(v43, v45, v47)
            let v49 = erlang_term_coerce(v48)
            let v50 = string.inspect(v49)
            let v51 = "\r\nContent-Length: "
            let v52 = v51 <> v50 
            let v53 = "\r\nContent-Type: application/json; charset=utf-8"
            let v54 = v53 <> v52 
            let v55 = "\r\nConnection: close\r\n\r\n"
            let v56 = v54 <> v55 
            let v57 = v41 <> v56 
            let v58 = v57 <> v34 
            v58
        }
        _ -> {
            let v99 =
                case v17  {
                    Us93SearchAll -> True
                    _ -> False
                }
            let v100 = search_564(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v99, v14)
            let v101 = "json"
            let v102 = atom.create(v101)
            let v103 = "encode"
            let v104 = atom.create(v103)
            let v105 = []
            let v106 = [v100, ..v105]
            let v107 = erlang_term_apply(v102, v104, v106)
            let v108 = "erlang"
            let v109 = atom.create(v108)
            let v110 = "iolist_to_binary"
            let v111 = atom.create(v110)
            let v112 = []
            let v113 = [v107, ..v112]
            let v114 = erlang_term_apply(v109, v111, v113)
            let v115 = erlang_term_coerce(v114)
            let v116 = string.inspect(200)
            let v117 = "HTTP/1.1 "
            let v118 = v117 <> v116 
            let v119 = " "
            let v120 = v118 <> v119 
            let v121 = "OK"
            let v122 = v120 <> v121 
            let v123 = erlang_term_coerce(v115)
            let v124 = atom.create(v108)
            let v125 = "byte_size"
            let v126 = atom.create(v125)
            let v127 = []
            let v128 = [v123, ..v127]
            let v129 = erlang_term_apply(v124, v126, v128)
            let v130 = erlang_term_coerce(v129)
            let v131 = string.inspect(v130)
            let v132 = "\r\nContent-Length: "
            let v133 = v132 <> v131 
            let v134 = "\r\nContent-Type: application/json; charset=utf-8"
            let v135 = v134 <> v133 
            let v136 = "\r\nConnection: close\r\n\r\n"
            let v137 = v135 <> v136 
            let v138 = v122 <> v137 
            let v139 = v138 <> v115 
            v139
        }
    }
}

pub fn other_reply_548(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: Us93) -> String {
    case v17  {
        Us93UsersBy -> users_reply_549(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
        Us93UsersByIds -> users_reply_549(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
        _ -> post_reply_559(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
    }
}

pub fn routed_469(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String) -> String {
    let v17 = route_of_470(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13)
    case v17  {
        Us93Elsewhere -> {
            let v117 = "no route "
            let v118 = v117 <> v13 
            let v119 = "Not Found Error"
            let v120 = erlang_term_coerce(v119)
            let v121 = erlang_term_coerce(v118)
            let v122 = "about:blank"
            let v123 = erlang_term_coerce(v122)
            let v124 = erlang_term_coerce(404)
            let v125 = "status"
            let v126 = atom.create(v125)
            let v127 = erlang_term_coerce(v126)
            let v128 = []
            let v129 = [v124, ..v128]
            let v130 = [v127, ..v129]
            let v131 = erlang_term_tuple(v130)
            let v132 = "type"
            let v133 = atom.create(v132)
            let v134 = erlang_term_coerce(v133)
            let v135 = []
            let v136 = [v123, ..v135]
            let v137 = [v134, ..v136]
            let v138 = erlang_term_tuple(v137)
            let v139 = "detail"
            let v140 = atom.create(v139)
            let v141 = erlang_term_coerce(v140)
            let v142 = []
            let v143 = [v121, ..v142]
            let v144 = [v141, ..v143]
            let v145 = erlang_term_tuple(v144)
            let v146 = "title"
            let v147 = atom.create(v146)
            let v148 = erlang_term_coerce(v147)
            let v149 = []
            let v150 = [v120, ..v149]
            let v151 = [v148, ..v150]
            let v152 = erlang_term_tuple(v151)
            let v153 = []
            let v154 = [v131, ..v153]
            let v155 = [v138, ..v154]
            let v156 = [v145, ..v155]
            let v157 = [v152, ..v156]
            let v158 = erlang_term_coerce(v157)
            let v159 = "maps"
            let v160 = atom.create(v159)
            let v161 = "from_list"
            let v162 = atom.create(v161)
            let v163 = []
            let v164 = [v158, ..v163]
            let v165 = erlang_term_apply(v160, v162, v164)
            let v166 = "json"
            let v167 = atom.create(v166)
            let v168 = "encode"
            let v169 = atom.create(v168)
            let v170 = []
            let v171 = [v165, ..v170]
            let v172 = erlang_term_apply(v167, v169, v171)
            let v173 = "erlang"
            let v174 = atom.create(v173)
            let v175 = "iolist_to_binary"
            let v176 = atom.create(v175)
            let v177 = []
            let v178 = [v172, ..v177]
            let v179 = erlang_term_apply(v174, v176, v178)
            let v180 = erlang_term_coerce(v179)
            let v181 = string.inspect(404)
            let v182 = "HTTP/1.1 "
            let v183 = v182 <> v181 
            let v184 = " "
            let v185 = v183 <> v184 
            let v186 = "Not Found"
            let v187 = v185 <> v186 
            let v188 = erlang_term_coerce(v180)
            let v189 = atom.create(v173)
            let v190 = "byte_size"
            let v191 = atom.create(v190)
            let v192 = []
            let v193 = [v188, ..v192]
            let v194 = erlang_term_apply(v189, v191, v193)
            let v195 = erlang_term_coerce(v194)
            let v196 = string.inspect(v195)
            let v197 = "\r\nContent-Length: "
            let v198 = v197 <> v196 
            let v199 = "\r\nContent-Type: application/json; charset=utf-8"
            let v200 = v199 <> v198 
            let v201 = "\r\nConnection: close\r\n\r\n"
            let v202 = v200 <> v201 
            let v203 = v187 <> v202 
            let v204 = v203 <> v180 
            v204
        }
        Us93Following(v18) -> {
            let #(v19, v20) = following_473(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v18, v14)
            let v21 = "json"
            let v22 = atom.create(v21)
            let v23 = "encode"
            let v24 = atom.create(v23)
            let v25 = []
            let v26 = [v20, ..v25]
            let v27 = erlang_term_apply(v22, v24, v26)
            let v28 = "erlang"
            let v29 = atom.create(v28)
            let v30 = "iolist_to_binary"
            let v31 = atom.create(v30)
            let v32 = []
            let v33 = [v27, ..v32]
            let v34 = erlang_term_apply(v29, v31, v33)
            let v35 = erlang_term_coerce(v34)
            let v36 = string.inspect(v19)
            let v37 = "HTTP/1.1 "
            let v38 = v37 <> v36 
            let v39 = " "
            let v40 = v38 <> v39 
            let v41 = 503 == v19
            let v46 =
                case v41 {
                    True -> {
                        let v42 = "Service Unavailable"
                        let v43 = Uh39Nil
                        Uh39Cons(503, v42, v43)
                    }
                    False -> Uh39Nil
                }
            let v47 = 502 == v19
            let v50 =
                case v47 {
                    True -> {
                        let v48 = "Bad Gateway"
                        Uh39Cons(502, v48, v46)
                    }
                    False -> v46
                }
            let v51 = 500 == v19
            let v54 =
                case v51 {
                    True -> {
                        let v52 = "Internal Server Error"
                        Uh39Cons(500, v52, v50)
                    }
                    False -> v50
                }
            let v55 = 429 == v19
            let v58 =
                case v55 {
                    True -> {
                        let v56 = "Too Many Requests"
                        Uh39Cons(429, v56, v54)
                    }
                    False -> v54
                }
            let v59 = 422 == v19
            let v62 =
                case v59 {
                    True -> {
                        let v60 = "Unprocessable Entity"
                        Uh39Cons(422, v60, v58)
                    }
                    False -> v58
                }
            let v63 = 404 == v19
            let v66 =
                case v63 {
                    True -> {
                        let v64 = "Not Found"
                        Uh39Cons(404, v64, v62)
                    }
                    False -> v62
                }
            let v67 = 403 == v19
            let v70 =
                case v67 {
                    True -> {
                        let v68 = "Forbidden"
                        Uh39Cons(403, v68, v66)
                    }
                    False -> v66
                }
            let v71 = 402 == v19
            let v74 =
                case v71 {
                    True -> {
                        let v72 = "Payment Required"
                        Uh39Cons(402, v72, v70)
                    }
                    False -> v70
                }
            let v75 = 401 == v19
            let v78 =
                case v75 {
                    True -> {
                        let v76 = "Unauthorized"
                        Uh39Cons(401, v76, v74)
                    }
                    False -> v74
                }
            let v79 = 400 == v19
            let v82 =
                case v79 {
                    True -> {
                        let v80 = "Bad Request"
                        Uh39Cons(400, v80, v78)
                    }
                    False -> v78
                }
            let v83 = 201 == v19
            let v86 =
                case v83 {
                    True -> {
                        let v84 = "Created"
                        Uh39Cons(201, v84, v82)
                    }
                    False -> v82
                }
            let v87 = 200 == v19
            let v90 =
                case v87 {
                    True -> {
                        let v88 = "OK"
                        Uh39Cons(200, v88, v86)
                    }
                    False -> v86
                }
            let v96 =
                case v90  {
                    Uh39Cons(v91, v92, v93) -> v92
                    Uh39Nil -> {
                        let v94 = "Status"
                        v94
                    }
                }
            let v97 = v40 <> v96 
            let v98 = erlang_term_coerce(v35)
            let v99 = atom.create(v28)
            let v100 = "byte_size"
            let v101 = atom.create(v100)
            let v102 = []
            let v103 = [v98, ..v102]
            let v104 = erlang_term_apply(v99, v101, v103)
            let v105 = erlang_term_coerce(v104)
            let v106 = string.inspect(v105)
            let v107 = "\r\nContent-Length: "
            let v108 = v107 <> v106 
            let v109 = "\r\nContent-Type: application/json; charset=utf-8"
            let v110 = v109 <> v108 
            let v111 = "\r\nConnection: close\r\n\r\n"
            let v112 = v110 <> v111 
            let v113 = v97 <> v112 
            let v114 = v113 <> v35 
            v114
        }
        Us93Timeline(v115) -> timeline_483(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v115, v14)
        _ -> other_reply_548(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
    }
}

pub fn answer_468(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, _v17: Us92) -> String {
    routed_469(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
}

pub fn user_write_579(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, _v12: String, _v13: String, _v14: String, _v15: String, _v16: String, _v17: Us92) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v18 = "Unsupported Authentication"
    let v19 = erlang_term_coerce(v18)
    let v20 = "Authenticating with OAuth 2.0 Application-Only is forbidden for this endpoint.  "
    let v21 = "Supported authentication types are [OAuth 1.0a User Context, OAuth 2.0 User Context]."
    let v22 = v20 <> v21 
    let v23 = erlang_term_coerce(v22)
    let v24 = "https://api.x.com/2/problems/unsupported-authentication"
    let v25 = erlang_term_coerce(v24)
    let v26 = erlang_term_coerce(403)
    let v27 = "status"
    let v28 = atom.create(v27)
    let v29 = erlang_term_coerce(v28)
    let v30 = []
    let v31 = [v26, ..v30]
    let v32 = [v29, ..v31]
    let v33 = erlang_term_tuple(v32)
    let v34 = "type"
    let v35 = atom.create(v34)
    let v36 = erlang_term_coerce(v35)
    let v37 = []
    let v38 = [v25, ..v37]
    let v39 = [v36, ..v38]
    let v40 = erlang_term_tuple(v39)
    let v41 = "detail"
    let v42 = atom.create(v41)
    let v43 = erlang_term_coerce(v42)
    let v44 = []
    let v45 = [v23, ..v44]
    let v46 = [v43, ..v45]
    let v47 = erlang_term_tuple(v46)
    let v48 = "title"
    let v49 = atom.create(v48)
    let v50 = erlang_term_coerce(v49)
    let v51 = []
    let v52 = [v19, ..v51]
    let v53 = [v50, ..v52]
    let v54 = erlang_term_tuple(v53)
    let v55 = []
    let v56 = [v33, ..v55]
    let v57 = [v40, ..v56]
    let v58 = [v47, ..v57]
    let v59 = [v54, ..v58]
    let v60 = erlang_term_coerce(v59)
    let v61 = "maps"
    let v62 = atom.create(v61)
    let v63 = "from_list"
    let v64 = atom.create(v63)
    let v65 = []
    let v66 = [v60, ..v65]
    let v67 = erlang_term_apply(v62, v64, v66)
    let v68 = "json"
    let v69 = atom.create(v68)
    let v70 = "encode"
    let v71 = atom.create(v70)
    let v72 = []
    let v73 = [v67, ..v72]
    let v74 = erlang_term_apply(v69, v71, v73)
    let v75 = "erlang"
    let v76 = atom.create(v75)
    let v77 = "iolist_to_binary"
    let v78 = atom.create(v77)
    let v79 = []
    let v80 = [v74, ..v79]
    let v81 = erlang_term_apply(v76, v78, v80)
    let v82 = erlang_term_coerce(v81)
    let v83 = string.inspect(403)
    let v84 = "HTTP/1.1 "
    let v85 = v84 <> v83 
    let v86 = " "
    let v87 = v85 <> v86 
    let v88 = "Forbidden"
    let v89 = v87 <> v88 
    let v90 = erlang_term_coerce(v82)
    let v91 = atom.create(v75)
    let v92 = "byte_size"
    let v93 = atom.create(v92)
    let v94 = []
    let v95 = [v90, ..v94]
    let v96 = erlang_term_apply(v91, v93, v95)
    let v97 = erlang_term_coerce(v96)
    let v98 = string.inspect(v97)
    let v99 = "\r\nContent-Length: "
    let v100 = v99 <> v98 
    let v101 = "\r\nContent-Type: application/json; charset=utf-8"
    let v102 = v101 <> v100 
    let v103 = "\r\nConnection: close\r\n\r\n"
    let v104 = v102 <> v103 
    let v105 = v89 <> v104 
    let v106 = v105 <> v82 
    #(v106, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
}

pub fn change_reply_578(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: Us92) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    user_write_579(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17)
}

pub fn reply_as_463(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: String, v18: Us92) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v20 =
        case v18  {
            Us92AppBearer -> {
                let v19 = "app"
                v19
            }
        }
    logged_464(v12, v13, v14, v15, v16, v17, v20)
    let v21 = "xsim serve / answered "
    let v22 = v21 <> v13 
    let v23 = " "
    let v24 = v22 <> v23 
    let v25 = v24 <> v14 
    let v26 = "\n"
    let v27 = v25 <> v26 
    let v28 = "standard_error"
    let v29 = atom.create(v28)
    let v30 = erlang_term_coerce(v29)
    let v31 = erlang_term_coerce(v27)
    let v32 = "io"
    let v33 = atom.create(v32)
    let v34 = "put_chars"
    let v35 = atom.create(v34)
    let v36 = []
    let v37 = [v31, ..v36]
    let v38 = [v30, ..v37]
    let _v39 = erlang_term_apply(v33, v35, v38)
    let v40 = v13 == "GET"
    case v40 {
        True -> {
            let v41 = answer_468(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
            #(v41, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
        }
        False -> change_reply_578(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
    }
}

pub fn answer_581(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, _v17: Us95) -> String {
    routed_469(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
}

pub fn units_of_586(v0: String) -> Uh31 {
    let v1 = Us75OnX
    units_on_348(v1, v0)
}

pub fn method587(v0: Uh31, v1: Int) -> Int {
    case v0  {
        Uh31Cons(v2, v3, v4) -> {
            let v5 = spiral_wrap_signed(v1 + v3, 32)
            method587(v4, v5)
        }
        Uh31Nil -> v1
    }
}
