import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Us102, Uh29Nil, Uh36Cons, Uh36Nil, Uh3Cons, Uh3Nil, Us100OAuth1User, Us100UserBearer, Us101ClientBasic, Us102Unauthenticated, Us98AppBearer}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_fs_coerce, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part13.{items_from_301}
import xsim_frames/part20.{closure29, method396}
import xsim_frames/part21.{closure108}
import xsim_frames/part22.{closure110}
import xsim_frames/part23.{closure116}
import xsim_frames/part24.{closure122}
import xsim_frames/part25.{closure130}
import xsim_frames/part27.{closure136, oauth1_signature_444}
import xsim_frames/part28.{header_value_464, logged_470, received_463, request_of_467, world_of_449}
import xsim_frames/part3.{closure0, closure5, closure7, closure9}
import xsim_frames/part35.{reply_as_469}
import xsim_frames/part37.{method605, method606, method607, method608, method609, reply_as_585, reply_as_597}
import xsim_frames/part5.{closure10, closure12}
import xsim_frames/part6.{closure13, closure14, closure15}
import xsim_frames/part9.{closure19, closure27, closure28}

pub fn oauth1_valid_604(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, v12: String, v13: String, _v14: String, v15: String, _v16: String, v17: String) -> Bool {
    let v18 = spiral_string_length(v17)
    let v19 = spiral_wrap_signed(v18 - 6, 32)
    let v20 = spiral_wrap_signed(6 + v19, 32)
    let v21 = spiral_wrap_signed(v20 - 1, 32)
    let v22 = spiral_string_slice(v17, 6, v21)
    let v23 = v22 == ""
    let v27 =
        case v23 {
            True -> Uh3Nil
            False -> {
                let v25 = ","
                split_list_2(v25, v22)
            }
        }
    let v28 = Uh36Nil
    let v29 = method605(v27, v28)
    let v30 = Uh36Nil
    let v31 = method606(v29, v30)
    let v37 =
        case v31  {
            Uh36Cons(v32, v33, v34) -> v33
            Uh36Nil -> {
                let v35 = ""
                v35
            }
        }
    let v38 = ""
    let v39 = erlang_term_coerce(v38)
    let v40 = "oauth1"
    let v41 = erlang_term_coerce(v40)
    let v42 = erlang_term_coerce(v39)
    let v43 = "maps"
    let v44 = atom.create(v43)
    let v45 = "get"
    let v46 = atom.create(v45)
    let v47 = []
    let v48 = [v42, ..v47]
    let v49 = [v7, ..v48]
    let v50 = [v41, ..v49]
    let v51 = erlang_term_apply(v44, v46, v50)
    let v52 = erlang_term_coerce(v51)
    let v53 = erlang_term_coerce(v38)
    let v54 = "consumer_key"
    let v55 = erlang_term_coerce(v54)
    let v56 = erlang_term_coerce(v53)
    let v57 = atom.create(v43)
    let v58 = atom.create(v45)
    let v59 = []
    let v60 = [v56, ..v59]
    let v61 = [v52, ..v60]
    let v62 = [v55, ..v61]
    let v63 = erlang_term_apply(v57, v58, v62)
    let v64 = erlang_term_coerce(v63)
    let v65 = erlang_term_coerce(v64)
    let v66 = v37 == v65
    let v99 =
        case v66 {
            True -> {
                let v67 = Uh36Nil
                let v68 = method607(v29, v67)
                let v73 =
                    case v68  {
                        Uh36Cons(v69, v70, v71) -> v70
                        Uh36Nil -> v38
                    }
                let v74 = erlang_term_coerce(v38)
                let v75 = erlang_term_coerce(v40)
                let v76 = erlang_term_coerce(v74)
                let v77 = atom.create(v43)
                let v78 = atom.create(v45)
                let v79 = []
                let v80 = [v76, ..v79]
                let v81 = [v7, ..v80]
                let v82 = [v75, ..v81]
                let v83 = erlang_term_apply(v77, v78, v82)
                let v84 = erlang_term_coerce(v83)
                let v85 = erlang_term_coerce(v38)
                let v86 = "token"
                let v87 = erlang_term_coerce(v86)
                let v88 = erlang_term_coerce(v85)
                let v89 = atom.create(v43)
                let v90 = atom.create(v45)
                let v91 = []
                let v92 = [v88, ..v91]
                let v93 = [v84, ..v92]
                let v94 = [v87, ..v93]
                let v95 = erlang_term_apply(v89, v90, v94)
                let v96 = erlang_term_coerce(v95)
                let v97 = erlang_term_coerce(v96)
                let v98 = v73 == v97
                v98
            }
            False -> False
        }
    case v99 {
        True -> {
            let v100 = Uh36Nil
            let v101 = method608(v29, v100)
            let v106 =
                case v101  {
                    Uh36Cons(v102, v103, v104) -> v103
                    Uh36Nil -> v38
                }
            let v107 = erlang_term_coerce(v38)
            let v108 = erlang_term_coerce(v40)
            let v109 = erlang_term_coerce(v107)
            let v110 = atom.create(v43)
            let v111 = atom.create(v45)
            let v112 = []
            let v113 = [v109, ..v112]
            let v114 = [v7, ..v113]
            let v115 = [v108, ..v114]
            let v116 = erlang_term_apply(v110, v111, v115)
            let v117 = erlang_term_coerce(v116)
            let v118 = erlang_term_coerce(v38)
            let v119 = "consumer_secret"
            let v120 = erlang_term_coerce(v119)
            let v121 = erlang_term_coerce(v118)
            let v122 = atom.create(v43)
            let v123 = atom.create(v45)
            let v124 = []
            let v125 = [v121, ..v124]
            let v126 = [v117, ..v125]
            let v127 = [v120, ..v126]
            let v128 = erlang_term_apply(v122, v123, v127)
            let v129 = erlang_term_coerce(v128)
            let v130 = erlang_term_coerce(v129)
            let v131 = erlang_term_coerce(v38)
            let v132 = erlang_term_coerce(v40)
            let v133 = erlang_term_coerce(v131)
            let v134 = atom.create(v43)
            let v135 = atom.create(v45)
            let v136 = []
            let v137 = [v133, ..v136]
            let v138 = [v7, ..v137]
            let v139 = [v132, ..v138]
            let v140 = erlang_term_apply(v134, v135, v139)
            let v141 = erlang_term_coerce(v140)
            let v142 = erlang_term_coerce(v38)
            let v143 = "token_secret"
            let v144 = erlang_term_coerce(v143)
            let v145 = erlang_term_coerce(v142)
            let v146 = atom.create(v43)
            let v147 = atom.create(v45)
            let v148 = []
            let v149 = [v145, ..v148]
            let v150 = [v141, ..v149]
            let v151 = [v144, ..v150]
            let v152 = erlang_term_apply(v146, v147, v151)
            let v153 = erlang_term_coerce(v152)
            let v154 = erlang_term_coerce(v153)
            let v155 = "host"
            let v156 = header_value_464(v155, v15)
            let v157 = "http://"
            let v158 = v157 <> v156 
            let v159 = v158 <> v13 
            let v160 = Uh36Nil
            let v161 = method609(v29, v160)
            let v162 = oauth1_signature_444(v12, v159, v161, v130, v154)
            let v163 = v106 == v162
            v163
        }
        False -> False
    }
}

pub fn answer_611(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, _v12: String, _v13: String, _v14: String, _v15: String, _v16: String, v17: Us102) -> String {
    case v17  {
        Us102Unauthenticated -> {
            let v18 = "Unauthorized"
            let v19 = erlang_term_coerce(v18)
            let v20 = erlang_term_coerce(v18)
            let v21 = "about:blank"
            let v22 = erlang_term_coerce(v21)
            let v23 = erlang_term_coerce(401)
            let v24 = "status"
            let v25 = atom.create(v24)
            let v26 = erlang_term_coerce(v25)
            let v27 = []
            let v28 = [v23, ..v27]
            let v29 = [v26, ..v28]
            let v30 = erlang_term_tuple(v29)
            let v31 = "type"
            let v32 = atom.create(v31)
            let v33 = erlang_term_coerce(v32)
            let v34 = []
            let v35 = [v22, ..v34]
            let v36 = [v33, ..v35]
            let v37 = erlang_term_tuple(v36)
            let v38 = "detail"
            let v39 = atom.create(v38)
            let v40 = erlang_term_coerce(v39)
            let v41 = []
            let v42 = [v20, ..v41]
            let v43 = [v40, ..v42]
            let v44 = erlang_term_tuple(v43)
            let v45 = "title"
            let v46 = atom.create(v45)
            let v47 = erlang_term_coerce(v46)
            let v48 = []
            let v49 = [v19, ..v48]
            let v50 = [v47, ..v49]
            let v51 = erlang_term_tuple(v50)
            let v52 = []
            let v53 = [v30, ..v52]
            let v54 = [v37, ..v53]
            let v55 = [v44, ..v54]
            let v56 = [v51, ..v55]
            let v57 = erlang_term_coerce(v56)
            let v58 = "maps"
            let v59 = atom.create(v58)
            let v60 = "from_list"
            let v61 = atom.create(v60)
            let v62 = []
            let v63 = [v57, ..v62]
            let v64 = erlang_term_apply(v59, v61, v63)
            let v65 = "json"
            let v66 = atom.create(v65)
            let v67 = "encode"
            let v68 = atom.create(v67)
            let v69 = []
            let v70 = [v64, ..v69]
            let v71 = erlang_term_apply(v66, v68, v70)
            let v72 = "erlang"
            let v73 = atom.create(v72)
            let v74 = "iolist_to_binary"
            let v75 = atom.create(v74)
            let v76 = []
            let v77 = [v71, ..v76]
            let v78 = erlang_term_apply(v73, v75, v77)
            let v79 = erlang_term_coerce(v78)
            let v80 = int.to_string(401)
            let v81 = "HTTP/1.1 "
            let v82 = v81 <> v80 
            let v83 = " "
            let v84 = v82 <> v83 
            let v85 = v84 <> v18 
            let v86 = erlang_term_coerce(v79)
            let v87 = atom.create(v72)
            let v88 = "byte_size"
            let v89 = atom.create(v88)
            let v90 = []
            let v91 = [v86, ..v90]
            let v92 = erlang_term_apply(v87, v89, v91)
            let v93 = erlang_term_coerce(v92)
            let v94 = int.to_string(v93)
            let v95 = "\r\nContent-Length: "
            let v96 = v95 <> v94 
            let v97 = "\r\nContent-Type: application/json; charset=utf-8"
            let v98 = v97 <> v96 
            let v99 = "\r\nConnection: close\r\n\r\n"
            let v100 = v98 <> v99 
            let v101 = v85 <> v100 
            let v102 = v101 <> v79 
            v102
        }
    }
}

pub fn change_reply_612(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, _v12: String, _v13: String, _v14: String, _v15: String, _v16: String, v17: Us102) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    case v17  {
        Us102Unauthenticated -> {
            let v18 = "Unauthorized"
            let v19 = erlang_term_coerce(v18)
            let v20 = erlang_term_coerce(v18)
            let v21 = "about:blank"
            let v22 = erlang_term_coerce(v21)
            let v23 = erlang_term_coerce(401)
            let v24 = "status"
            let v25 = atom.create(v24)
            let v26 = erlang_term_coerce(v25)
            let v27 = []
            let v28 = [v23, ..v27]
            let v29 = [v26, ..v28]
            let v30 = erlang_term_tuple(v29)
            let v31 = "type"
            let v32 = atom.create(v31)
            let v33 = erlang_term_coerce(v32)
            let v34 = []
            let v35 = [v22, ..v34]
            let v36 = [v33, ..v35]
            let v37 = erlang_term_tuple(v36)
            let v38 = "detail"
            let v39 = atom.create(v38)
            let v40 = erlang_term_coerce(v39)
            let v41 = []
            let v42 = [v20, ..v41]
            let v43 = [v40, ..v42]
            let v44 = erlang_term_tuple(v43)
            let v45 = "title"
            let v46 = atom.create(v45)
            let v47 = erlang_term_coerce(v46)
            let v48 = []
            let v49 = [v19, ..v48]
            let v50 = [v47, ..v49]
            let v51 = erlang_term_tuple(v50)
            let v52 = []
            let v53 = [v30, ..v52]
            let v54 = [v37, ..v53]
            let v55 = [v44, ..v54]
            let v56 = [v51, ..v55]
            let v57 = erlang_term_coerce(v56)
            let v58 = "maps"
            let v59 = atom.create(v58)
            let v60 = "from_list"
            let v61 = atom.create(v60)
            let v62 = []
            let v63 = [v57, ..v62]
            let v64 = erlang_term_apply(v59, v61, v63)
            let v65 = "json"
            let v66 = atom.create(v65)
            let v67 = "encode"
            let v68 = atom.create(v67)
            let v69 = []
            let v70 = [v64, ..v69]
            let v71 = erlang_term_apply(v66, v68, v70)
            let v72 = "erlang"
            let v73 = atom.create(v72)
            let v74 = "iolist_to_binary"
            let v75 = atom.create(v74)
            let v76 = []
            let v77 = [v71, ..v76]
            let v78 = erlang_term_apply(v73, v75, v77)
            let v79 = erlang_term_coerce(v78)
            let v80 = int.to_string(401)
            let v81 = "HTTP/1.1 "
            let v82 = v81 <> v80 
            let v83 = " "
            let v84 = v82 <> v83 
            let v85 = v84 <> v18 
            let v86 = erlang_term_coerce(v79)
            let v87 = atom.create(v72)
            let v88 = "byte_size"
            let v89 = atom.create(v88)
            let v90 = []
            let v91 = [v86, ..v90]
            let v92 = erlang_term_apply(v87, v89, v91)
            let v93 = erlang_term_coerce(v92)
            let v94 = int.to_string(v93)
            let v95 = "\r\nContent-Length: "
            let v96 = v95 <> v94 
            let v97 = "\r\nContent-Type: application/json; charset=utf-8"
            let v98 = v97 <> v96 
            let v99 = "\r\nConnection: close\r\n\r\n"
            let v100 = v98 <> v99 
            let v101 = v85 <> v100 
            let v102 = v101 <> v79 
            #(v102, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
        }
    }
}

pub fn reply_as_610(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: String, v18: Us102) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v20 =
        case v18  {
            Us102Unauthenticated -> {
                let v19 = ""
                v19
            }
        }
    logged_470(v12, v13, v14, v15, v16, v17, v20)
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
            let v41 = answer_611(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
            #(v41, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
        }
        False -> change_reply_612(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
    }
}

pub fn signed_reply_603(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v19 = "OAuth "
    let v20 = v18 |> string.starts_with(v19)
    let v22 =
        case v20 {
            True -> oauth1_valid_604(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
            False -> False
        }
    case v22 {
        True -> {
            let v23 = Us100OAuth1User
            reply_as_585(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v23)
        }
        False -> {
            let v37 = Us102Unauthenticated
            reply_as_610(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v37)
        }
    }
}

pub fn keyed_reply_596(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v19 = ""
    let v20 = erlang_term_coerce(v19)
    let v21 = "oauth2"
    let v22 = erlang_term_coerce(v21)
    let v23 = erlang_term_coerce(v20)
    let v24 = "maps"
    let v25 = atom.create(v24)
    let v26 = "get"
    let v27 = atom.create(v26)
    let v28 = []
    let v29 = [v23, ..v28]
    let v30 = [v7, ..v29]
    let v31 = [v22, ..v30]
    let v32 = erlang_term_apply(v25, v27, v31)
    let v33 = erlang_term_coerce(v32)
    let v34 = erlang_term_coerce(v19)
    let v35 = "client_id"
    let v36 = erlang_term_coerce(v35)
    let v37 = erlang_term_coerce(v34)
    let v38 = atom.create(v24)
    let v39 = atom.create(v26)
    let v40 = []
    let v41 = [v37, ..v40]
    let v42 = [v33, ..v41]
    let v43 = [v36, ..v42]
    let v44 = erlang_term_apply(v38, v39, v43)
    let v45 = erlang_term_coerce(v44)
    let v46 = erlang_term_coerce(v45)
    let v47 = ":"
    let v48 = v46 <> v47 
    let v49 = erlang_term_coerce(v19)
    let v50 = "client_secret"
    let v51 = erlang_term_coerce(v50)
    let v52 = erlang_term_coerce(v49)
    let v53 = atom.create(v24)
    let v54 = atom.create(v26)
    let v55 = []
    let v56 = [v52, ..v55]
    let v57 = [v33, ..v56]
    let v58 = [v51, ..v57]
    let v59 = erlang_term_apply(v53, v54, v58)
    let v60 = erlang_term_coerce(v59)
    let v61 = erlang_term_coerce(v60)
    let v62 = v48 <> v61 
    let v63 = erlang_term_coerce(v62)
    let v64 = "base64"
    let v65 = atom.create(v64)
    let v66 = "encode"
    let v67 = atom.create(v66)
    let v68 = []
    let v69 = [v63, ..v68]
    let v70 = erlang_term_apply(v65, v67, v69)
    let v71 = erlang_term_coerce(v70)
    let v72 = "Basic "
    let v73 = v72 <> v71 
    let v74 = v18 == v73
    let v76 =
        case v74 {
            True -> {
                let v75 = v14 == "/2/oauth2/token"
                v75
            }
            False -> False
        }
    case v76 {
        True -> {
            let v77 = Us101ClientBasic
            reply_as_597(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v77)
        }
        False -> signed_reply_603(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
    }
}

pub fn bearer_reply_468(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v19 = "Bearer "
    let v20 = v19 <> v0 
    let v21 = v18 == v20
    case v21 {
        True -> {
            let v22 = Us98AppBearer
            reply_as_469(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v22)
        }
        False -> {
            let v36 = v19 <> v1 
            let v37 = v18 == v36
            case v37 {
                True -> {
                    let v38 = Us100UserBearer
                    reply_as_585(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v38)
                }
                False -> keyed_reply_596(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
            }
        }
    }
}

pub fn replied_466(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let #(v14, v15, v16, v17, v18) = request_of_467(v13)
    let v19 = "authorization"
    let v20 = header_value_464(v19, v17)
    bearer_reply_468(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v14, v15, v16, v17, v18, v20)
}

pub fn handled_462(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: Dynamic) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v14 = ""
    let v15 = received_463(v13, v14)
    let #(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28) = replied_466(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v15)
    let v29 = erlang_term_coerce(v16)
    let v30 = "gen_tcp"
    let v31 = atom.create(v30)
    let v32 = "send"
    let v33 = atom.create(v32)
    let v34 = []
    let v35 = [v29, ..v34]
    let v36 = [v13, ..v35]
    let _v37 = erlang_term_apply(v31, v33, v36)
    let v38 = atom.create(v30)
    let v39 = "close"
    let v40 = atom.create(v39)
    let v41 = []
    let v42 = [v13, ..v41]
    let _v43 = erlang_term_apply(v38, v40, v42)
    #(v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28)
}

pub fn served_461(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: Dynamic) -> Int {
    let v14 = "gen_tcp"
    let v15 = atom.create(v14)
    let v16 = "accept"
    let v17 = atom.create(v16)
    let v18 = []
    let v19 = [v13, ..v18]
    let v20 = erlang_term_apply(v15, v17, v19)
    let v21 = "erlang"
    let v22 = atom.create(v21)
    let v23 = "is_tuple"
    let v24 = atom.create(v23)
    let v25 = []
    let v26 = [v20, ..v25]
    let v27 = erlang_term_apply(v22, v24, v26)
    let v28 = erlang_term_coerce(v27)
    let v41 =
        case v28 {
            True -> {
                let v29 = erlang_term_coerce(1)
                let v30 = atom.create(v21)
                let v31 = "element"
                let v32 = atom.create(v31)
                let v33 = []
                let v34 = [v20, ..v33]
                let v35 = [v29, ..v34]
                let v36 = erlang_term_apply(v30, v32, v35)
                let v37 = "ok"
                let v38 = atom.create(v37)
                let v39 = erlang_term_coerce(v38)
                let v40 = v36 == v39
                v40
            }
            False -> False
        }
    let v42 = v41 == False
    case v42 {
        True -> 1
        False -> {
            let v43 = erlang_term_coerce(2)
            let v44 = atom.create(v21)
            let v45 = "element"
            let v46 = atom.create(v45)
            let v47 = []
            let v48 = [v20, ..v47]
            let v49 = [v43, ..v48]
            let v50 = erlang_term_apply(v44, v46, v49)
            let #(v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62) = handled_462(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v50)
            served_461(v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v12, v13)
        }
    }
}

pub fn listening_448(v0: String, v1: String, v2: String) -> Int {
    let v3 = erlang_term_coerce(0)
    let v4 = erlang_term_coerce(True)
    let v5 = "reuseaddr"
    let v6 = atom.create(v5)
    let v7 = erlang_term_coerce(v6)
    let v8 = []
    let v9 = [v4, ..v8]
    let v10 = [v7, ..v9]
    let v11 = erlang_term_tuple(v10)
    let v12 = erlang_term_coerce(127)
    let v13 = erlang_term_coerce(0)
    let v14 = erlang_term_coerce(0)
    let v15 = erlang_term_coerce(1)
    let v16 = []
    let v17 = [v15, ..v16]
    let v18 = [v14, ..v17]
    let v19 = [v13, ..v18]
    let v20 = [v12, ..v19]
    let v21 = erlang_term_tuple(v20)
    let v22 = "ip"
    let v23 = atom.create(v22)
    let v24 = erlang_term_coerce(v23)
    let v25 = []
    let v26 = [v21, ..v25]
    let v27 = [v24, ..v26]
    let v28 = erlang_term_tuple(v27)
    let v29 = "binary"
    let v30 = atom.create(v29)
    let v31 = erlang_term_coerce(v30)
    let v32 = "raw"
    let v33 = atom.create(v32)
    let v34 = erlang_term_coerce(v33)
    let v35 = "packet"
    let v36 = atom.create(v35)
    let v37 = erlang_term_coerce(v36)
    let v38 = []
    let v39 = [v34, ..v38]
    let v40 = [v37, ..v39]
    let v41 = erlang_term_tuple(v40)
    let v42 = erlang_term_coerce(False)
    let v43 = "active"
    let v44 = atom.create(v43)
    let v45 = erlang_term_coerce(v44)
    let v46 = []
    let v47 = [v42, ..v46]
    let v48 = [v45, ..v47]
    let v49 = erlang_term_tuple(v48)
    let v50 = []
    let v51 = [v28, ..v50]
    let v52 = [v11, ..v51]
    let v53 = [v49, ..v52]
    let v54 = [v41, ..v53]
    let v55 = [v31, ..v54]
    let v56 = erlang_term_coerce(v55)
    let v57 = "gen_tcp"
    let v58 = atom.create(v57)
    let v59 = "listen"
    let v60 = atom.create(v59)
    let v61 = []
    let v62 = [v56, ..v61]
    let v63 = [v3, ..v62]
    let v64 = erlang_term_apply(v58, v60, v63)
    let v65 = erlang_term_coerce(2)
    let v66 = "erlang"
    let v67 = atom.create(v66)
    let v68 = "element"
    let v69 = atom.create(v68)
    let v70 = []
    let v71 = [v64, ..v70]
    let v72 = [v65, ..v71]
    let v73 = erlang_term_apply(v67, v69, v72)
    let v74 = "inet"
    let v75 = atom.create(v74)
    let v76 = "port"
    let v77 = atom.create(v76)
    let v78 = []
    let v79 = [v73, ..v78]
    let v80 = erlang_term_apply(v75, v77, v79)
    let v81 = erlang_term_coerce(2)
    let v82 = atom.create(v66)
    let v83 = atom.create(v68)
    let v84 = []
    let v85 = [v80, ..v84]
    let v86 = [v81, ..v85]
    let v87 = erlang_term_apply(v82, v83, v86)
    let v88 = erlang_term_coerce(v87)
    let v89 = int.to_string(v88)
    let v90 = spiral_fs_write_file(v1, v89)
    let v91 = spiral_fs_coerce(v90)
    let v92 = "ok"
    let v93 = atom.create(v92)
    let v94 = v91 == v93
    let v95 = v94 == False
    case v95 {
        True -> panic as "file_system.write_all_text: the write failed"
        False -> Nil
    }
    let #(v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107) = world_of_449(v0)
    served_461(v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v2, v73)
}

pub fn started_443(v0: String, v1: String, v2: String) -> Int {
    let v3 = "POST"
    let v4 = "https://api.x.com/1.1/statuses/update.json"
    let v5 = "include_entities"
    let v6 = "true"
    let v7 = "status"
    let v8 = "Hello Ladies + Gentlemen, a signed OAuth request!"
    let v9 = "oauth_token"
    let v10 = "370773112-GmHxMAgYyLbNEtIKZeRNFsMKPR9EyMZeS9weJAEb"
    let v11 = "oauth_version"
    let v12 = "1.0"
    let v13 = "oauth_consumer_key"
    let v14 = "xvz1evFS4wEEPTGEFPHBog"
    let v15 = "oauth_nonce"
    let v16 = "kYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cg"
    let v17 = "oauth_signature_method"
    let v18 = "HMAC-SHA1"
    let v19 = "oauth_timestamp"
    let v20 = "1318622958"
    let v21 = Uh36Nil
    let v22 = Uh36Cons(v19, v20, v21)
    let v23 = Uh36Cons(v17, v18, v22)
    let v24 = Uh36Cons(v15, v16, v23)
    let v25 = Uh36Cons(v13, v14, v24)
    let v26 = Uh36Cons(v11, v12, v25)
    let v27 = Uh36Cons(v9, v10, v26)
    let v28 = Uh36Cons(v7, v8, v27)
    let v29 = Uh36Cons(v5, v6, v28)
    let v30 = "kAcSOqF21Fu85e7zjz7ZN2U4ZRhfV3WpwPAoE3Z7kBw"
    let v31 = "LswwdoUaIvS8ltyTt5jkRh4J50vUPVVHtR2YPi5kE"
    let v32 = oauth1_signature_444(v3, v4, v29, v30, v31)
    let v33 = v32 == "Ls93hJiZbQ3akF3HF3x1Bz8/zU4="
    case v33 {
        True -> listening_448(v0, v1, v2)
        False -> 3
    }
}

pub fn closure142(capt: Nil) -> fn(String) -> Int {
    fn (v0) {
        let v1 = "init"
        let v2 = atom.create(v1)
        let v3 = "get_plain_arguments"
        let v4 = atom.create(v3)
        let v5 = []
        let v6 = erlang_term_apply(v2, v4, v5)
        let v7 = "lists"
        let v8 = atom.create(v7)
        let v9 = "reverse"
        let v10 = atom.create(v9)
        let v11 = []
        let v12 = [v6, ..v11]
        let v13 = erlang_term_apply(v8, v10, v12)
        let v14 = Uh29Nil
        let v15 = items_from_301(v13, v14)
        let v16 = Uh3Nil
        let v17 = method396(v15, v16)
        let v22 =
            case v17  {
                Uh3Cons(v18, v19) -> v19
                Uh3Nil -> Uh3Nil
            }
        case v22  {
            Uh3Cons(v23, v24) -> {
                case v24  {
                    Uh3Cons(v25, v26) -> {
                        case v26  {
                            Uh3Cons(v27, v28) -> started_443(v23, v25, v27)
                            _ -> 2
                        }
                    }
                    _ -> 2
                }
            }
            _ -> 2
        }
    }
}

pub fn main() {
    let _v0 = closure0(Nil)
    let _ = Nil
    let _v1 = closure5(Nil)
    let _ = Nil
    let _v2 = closure7(Nil)
    let _ = Nil
    let _v3 = closure9(Nil)
    let _ = Nil
    let _v4 = closure10(Nil)
    let _ = Nil
    let _v5 = closure12(Nil)
    let _ = Nil
    let _v6 = closure13(Nil)
    let _ = Nil
    let _v7 = closure14(Nil)
    let _ = Nil
    let _v8 = closure15(Nil)
    let _ = Nil
    let _v9 = closure19(Nil)
    let _ = Nil
    let _v10 = closure27(Nil)
    let _ = Nil
    let _v11 = closure28(Nil)
    let _ = Nil
    let _v12 = closure29(Nil)
    let _ = Nil
    let _v13 = closure108(Nil)
    let _ = Nil
    let _v14 = closure110(Nil)
    let _ = Nil
    let _v15 = closure116(Nil)
    let _ = Nil
    let _v16 = closure122(Nil)
    let _ = Nil
    let _v17 = closure130(Nil)
    let _ = Nil
    let _v18 = closure136(Nil)
    let _ = Nil
    let _v19 = closure142(Nil)
    let _ = Nil
    0
}
