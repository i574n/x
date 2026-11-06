import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Us106, Uh36Cons, Uh36Nil, Uh3Nil, Us102AppBearer, Us104OAuth1User, Us104UserBearer, Us105ClientBasic, Us106Unauthenticated, Us72Error, Us72Ok, Us73Closed, Us73Failed, Us73Refused, Us73TimedOut, Us74Error, Us74Ok, Us75Error, Us75Ok, Us99Error, Us99Ok}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_fs_coerce, spiral_fs_write_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part28.{oauth1_signature_451}
import xsim_frames/part29.{header_value_471, received_470, request_of_474, world_of_456}
import xsim_frames/part30.{logged_477}
import xsim_frames/part36.{reply_as_476}
import xsim_frames/part38.{method613, method614, method615, method616, method617, reply_as_593, reply_as_605}

pub fn oauth1_valid_612(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, v12: String, v13: String, _v14: String, v15: String, _v16: String, v17: String) -> Bool {
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
    let v29 = method613(v27, v28)
    let v30 = Uh36Nil
    let v31 = method614(v29, v30)
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
                let v68 = method615(v29, v67)
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
            let v101 = method616(v29, v100)
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
            let v156 = header_value_471(v155, v15)
            let v157 = "http://"
            let v158 = v157 <> v156 
            let v159 = v158 <> v13 
            let v160 = Uh36Nil
            let v161 = method617(v29, v160)
            let v162 = oauth1_signature_451(v12, v159, v161, v130, v154)
            let v163 = v106 == v162
            v163
        }
        False -> False
    }
}

pub fn answer_619(_v0: String, _v1: String, _v2: dict.Dict(String, Dynamic), _v3: dict.Dict(String, Dynamic), _v4: Int, _v5: dict.Dict(String, Dynamic), _v6: String, _v7: Dynamic, _v8: Uh3, _v9: Dynamic, _v10: dict.Dict(String, Nil), _v11: Int, _v12: String, _v13: String, _v14: String, _v15: String, _v16: String, v17: Us106) -> String {
    case v17  {
        Us106Unauthenticated -> {
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
            let v97 = "\r\nContent-Type: "
            let v98 = "application/json; charset=utf-8"
            let v99 = v97 <> v98 
            let v100 = v99 <> v96 
            let v101 = "\r\nConnection: close\r\n\r\n"
            let v102 = v100 <> v101 
            let v103 = v85 <> v102 
            let v104 = v103 <> v79 
            v104
        }
    }
}

pub fn change_reply_620(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, _v12: String, _v13: String, _v14: String, _v15: String, _v16: String, v17: Us106) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    case v17  {
        Us106Unauthenticated -> {
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
            let v97 = "\r\nContent-Type: "
            let v98 = "application/json; charset=utf-8"
            let v99 = v97 <> v98 
            let v100 = v99 <> v96 
            let v101 = "\r\nConnection: close\r\n\r\n"
            let v102 = v100 <> v101 
            let v103 = v85 <> v102 
            let v104 = v103 <> v79 
            #(v104, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
        }
    }
}

pub fn reply_as_618(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: String, v18: Us106) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v20 =
        case v18  {
            Us106Unauthenticated -> {
                let v19 = ""
                v19
            }
        }
    logged_477(v12, v13, v14, v15, v16, v17, v20)
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
            let v41 = answer_619(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
            #(v41, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11)
        }
        False -> change_reply_620(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
    }
}

pub fn signed_reply_611(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v19 = "OAuth "
    let v20 = v18 |> string.starts_with(v19)
    let v22 =
        case v20 {
            True -> oauth1_valid_612(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14, v15, v16, v17, v18)
            False -> False
        }
    case v22 {
        True -> {
            let v23 = Us104OAuth1User
            reply_as_593(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v23)
        }
        False -> {
            let v37 = Us106Unauthenticated
            reply_as_618(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v37)
        }
    }
}

pub fn keyed_reply_604(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
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
            let v77 = Us105ClientBasic
            reply_as_605(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v77)
        }
        False -> signed_reply_611(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
    }
}

pub fn bearer_reply_475(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v19 = "Bearer "
    let v20 = v19 <> v0 
    let v21 = v18 == v20
    case v21 {
        True -> {
            let v22 = Us102AppBearer
            reply_as_476(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v22)
        }
        False -> {
            let v36 = v19 <> v1 
            let v37 = v18 == v36
            case v37 {
                True -> {
                    let v38 = Us104UserBearer
                    reply_as_593(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v38)
                }
                False -> keyed_reply_604(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
            }
        }
    }
}

pub fn replied_473(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let #(v14, v15, v16, v17, v18) = request_of_474(v13)
    let v19 = "authorization"
    let v20 = header_value_471(v19, v17)
    bearer_reply_475(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v14, v15, v16, v17, v18, v20)
}

pub fn handled_469(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: Dynamic) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v14 = ""
    let v15 = received_470(v13, v14)
    let #(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28) = replied_473(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v15)
    let v29 = erlang_term_coerce(v16)
    let v30 = "gen_tcp"
    let v31 = atom.create(v30)
    let v32 = "send"
    let v33 = atom.create(v32)
    let v34 = []
    let v35 = [v29, ..v34]
    let v36 = [v13, ..v35]
    let v37 = erlang_term_apply(v31, v33, v36)
    let v38 = "ok"
    let v39 = atom.create(v38)
    let v40 = erlang_term_coerce(v39)
    let v41 = v37 == v40
    let _v73 =
        case v41 {
            True -> Us75Ok
            False -> {
                let v43 = erlang_term_coerce(2)
                let v44 = "erlang"
                let v45 = atom.create(v44)
                let v46 = "element"
                let v47 = atom.create(v46)
                let v48 = []
                let v49 = [v37, ..v48]
                let v50 = [v43, ..v49]
                let v51 = erlang_term_apply(v45, v47, v50)
                let v52 = "econnrefused"
                let v53 = atom.create(v52)
                let v54 = erlang_term_coerce(v53)
                let v55 = v51 == v54
                let v71 =
                    case v55 {
                        True -> Us73Refused
                        False -> {
                            let v57 = "timeout"
                            let v58 = atom.create(v57)
                            let v59 = erlang_term_coerce(v58)
                            let v60 = v51 == v59
                            case v60 {
                                True -> Us73TimedOut
                                False -> {
                                    let v62 = "closed"
                                    let v63 = atom.create(v62)
                                    let v64 = erlang_term_coerce(v63)
                                    let v65 = v51 == v64
                                    case v65 {
                                        True -> Us73Closed
                                        False -> {
                                            let v67 = string.inspect(v51)
                                            Us73Failed(v67)
                                        }
                                    }
                                }
                            }
                        }
                    }
                Us75Error(v71)
            }
        }
    let v74 = atom.create(v30)
    let v75 = "close"
    let v76 = atom.create(v75)
    let v77 = []
    let v78 = [v13, ..v77]
    let _v79 = erlang_term_apply(v74, v76, v78)
    #(v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28)
}

pub fn served_468(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: Dynamic) -> Int {
    let v14 = "infinity"
    let v15 = atom.create(v14)
    let v16 = erlang_term_coerce(v15)
    let v17 = "gen_tcp"
    let v18 = atom.create(v17)
    let v19 = "accept"
    let v20 = atom.create(v19)
    let v21 = []
    let v22 = [v16, ..v21]
    let v23 = [v13, ..v22]
    let v24 = erlang_term_apply(v18, v20, v23)
    let v25 = erlang_term_coerce(1)
    let v26 = "erlang"
    let v27 = atom.create(v26)
    let v28 = "element"
    let v29 = atom.create(v28)
    let v30 = []
    let v31 = [v24, ..v30]
    let v32 = [v25, ..v31]
    let v33 = erlang_term_apply(v27, v29, v32)
    let v34 = "ok"
    let v35 = atom.create(v34)
    let v36 = erlang_term_coerce(v35)
    let v37 = v33 == v36
    let v74 =
        case v37 {
            True -> {
                let v38 = erlang_term_coerce(2)
                let v39 = atom.create(v26)
                let v40 = atom.create(v28)
                let v41 = []
                let v42 = [v24, ..v41]
                let v43 = [v38, ..v42]
                let v44 = erlang_term_apply(v39, v40, v43)
                Us72Ok(v44)
            }
            False -> {
                let v46 = erlang_term_coerce(2)
                let v47 = atom.create(v26)
                let v48 = atom.create(v28)
                let v49 = []
                let v50 = [v24, ..v49]
                let v51 = [v46, ..v50]
                let v52 = erlang_term_apply(v47, v48, v51)
                let v53 = "econnrefused"
                let v54 = atom.create(v53)
                let v55 = erlang_term_coerce(v54)
                let v56 = v52 == v55
                let v72 =
                    case v56 {
                        True -> Us73Refused
                        False -> {
                            let v58 = "timeout"
                            let v59 = atom.create(v58)
                            let v60 = erlang_term_coerce(v59)
                            let v61 = v52 == v60
                            case v61 {
                                True -> Us73TimedOut
                                False -> {
                                    let v63 = "closed"
                                    let v64 = atom.create(v63)
                                    let v65 = erlang_term_coerce(v64)
                                    let v66 = v52 == v65
                                    case v66 {
                                        True -> Us73Closed
                                        False -> {
                                            let v68 = string.inspect(v52)
                                            Us73Failed(v68)
                                        }
                                    }
                                }
                            }
                        }
                    }
                Us72Error(v72)
            }
        }
    let v80 =
        case v74  {
            Us72Error(v77) -> Us74Error(v77)
            Us72Ok(v75) -> Us74Ok(v75)
        }
    case v80  {
        Us74Error(v95) -> 1
        Us74Ok(v81) -> {
            let #(v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93) = handled_469(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v81)
            served_468(v82, v83, v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v12, v13)
        }
    }
}

pub fn listening_455(v0: String, v1: String, v2: String) -> Int {
    let v3 = erlang_term_coerce(0)
    let v4 = "true"
    let v5 = atom.create(v4)
    let v6 = erlang_term_coerce(v5)
    let v7 = "reuseaddr"
    let v8 = atom.create(v7)
    let v9 = erlang_term_coerce(v8)
    let v10 = []
    let v11 = [v6, ..v10]
    let v12 = [v9, ..v11]
    let v13 = erlang_term_tuple(v12)
    let v14 = erlang_term_coerce(1)
    let v15 = erlang_term_coerce(0)
    let v16 = erlang_term_coerce(0)
    let v17 = erlang_term_coerce(127)
    let v18 = []
    let v19 = [v14, ..v18]
    let v20 = [v15, ..v19]
    let v21 = [v16, ..v20]
    let v22 = [v17, ..v21]
    let v23 = erlang_term_tuple(v22)
    let v24 = "ip"
    let v25 = atom.create(v24)
    let v26 = erlang_term_coerce(v25)
    let v27 = []
    let v28 = [v23, ..v27]
    let v29 = [v26, ..v28]
    let v30 = erlang_term_tuple(v29)
    let v31 = "binary"
    let v32 = atom.create(v31)
    let v33 = erlang_term_coerce(v32)
    let v34 = "raw"
    let v35 = atom.create(v34)
    let v36 = erlang_term_coerce(v35)
    let v37 = "packet"
    let v38 = atom.create(v37)
    let v39 = erlang_term_coerce(v38)
    let v40 = []
    let v41 = [v36, ..v40]
    let v42 = [v39, ..v41]
    let v43 = erlang_term_tuple(v42)
    let v44 = "false"
    let v45 = atom.create(v44)
    let v46 = erlang_term_coerce(v45)
    let v47 = "active"
    let v48 = atom.create(v47)
    let v49 = erlang_term_coerce(v48)
    let v50 = []
    let v51 = [v46, ..v50]
    let v52 = [v49, ..v51]
    let v53 = erlang_term_tuple(v52)
    let v54 = []
    let v55 = [v30, ..v54]
    let v56 = [v13, ..v55]
    let v57 = [v53, ..v56]
    let v58 = [v43, ..v57]
    let v59 = [v33, ..v58]
    let v60 = erlang_term_coerce(v59)
    let v61 = "gen_tcp"
    let v62 = atom.create(v61)
    let v63 = "listen"
    let v64 = atom.create(v63)
    let v65 = []
    let v66 = [v60, ..v65]
    let v67 = [v3, ..v66]
    let v68 = erlang_term_apply(v62, v64, v67)
    let v69 = erlang_term_coerce(1)
    let v70 = "erlang"
    let v71 = atom.create(v70)
    let v72 = "element"
    let v73 = atom.create(v72)
    let v74 = []
    let v75 = [v68, ..v74]
    let v76 = [v69, ..v75]
    let v77 = erlang_term_apply(v71, v73, v76)
    let v78 = "ok"
    let v79 = atom.create(v78)
    let v80 = erlang_term_coerce(v79)
    let v81 = v77 == v80
    let v118 =
        case v81 {
            True -> {
                let v82 = erlang_term_coerce(2)
                let v83 = atom.create(v70)
                let v84 = atom.create(v72)
                let v85 = []
                let v86 = [v68, ..v85]
                let v87 = [v82, ..v86]
                let v88 = erlang_term_apply(v83, v84, v87)
                Us72Ok(v88)
            }
            False -> {
                let v90 = erlang_term_coerce(2)
                let v91 = atom.create(v70)
                let v92 = atom.create(v72)
                let v93 = []
                let v94 = [v68, ..v93]
                let v95 = [v90, ..v94]
                let v96 = erlang_term_apply(v91, v92, v95)
                let v97 = "econnrefused"
                let v98 = atom.create(v97)
                let v99 = erlang_term_coerce(v98)
                let v100 = v96 == v99
                let v116 =
                    case v100 {
                        True -> Us73Refused
                        False -> {
                            let v102 = "timeout"
                            let v103 = atom.create(v102)
                            let v104 = erlang_term_coerce(v103)
                            let v105 = v96 == v104
                            case v105 {
                                True -> Us73TimedOut
                                False -> {
                                    let v107 = "closed"
                                    let v108 = atom.create(v107)
                                    let v109 = erlang_term_coerce(v108)
                                    let v110 = v96 == v109
                                    case v110 {
                                        True -> Us73Closed
                                        False -> {
                                            let v112 = string.inspect(v96)
                                            Us73Failed(v112)
                                        }
                                    }
                                }
                            }
                        }
                    }
                Us72Error(v116)
            }
        }
    let v124 =
        case v118  {
            Us72Error(v121) -> Us99Error(v121)
            Us72Ok(v119) -> Us99Ok(v119)
        }
    let v129 =
        case v124  {
            Us99Error(v126) -> panic as "erlang_tcp: unexpected failure in a test"
            Us99Ok(v125) -> v125
        }
    let v130 = "inet"
    let v131 = atom.create(v130)
    let v132 = "port"
    let v133 = atom.create(v132)
    let v134 = []
    let v135 = [v129, ..v134]
    let v136 = erlang_term_apply(v131, v133, v135)
    let v137 = erlang_term_coerce(1)
    let v138 = atom.create(v70)
    let v139 = atom.create(v72)
    let v140 = []
    let v141 = [v136, ..v140]
    let v142 = [v137, ..v141]
    let v143 = erlang_term_apply(v138, v139, v142)
    let v144 = atom.create(v78)
    let v145 = erlang_term_coerce(v144)
    let v146 = v143 == v145
    let v183 =
        case v146 {
            True -> {
                let v147 = erlang_term_coerce(2)
                let v148 = atom.create(v70)
                let v149 = atom.create(v72)
                let v150 = []
                let v151 = [v136, ..v150]
                let v152 = [v147, ..v151]
                let v153 = erlang_term_apply(v148, v149, v152)
                Us72Ok(v153)
            }
            False -> {
                let v155 = erlang_term_coerce(2)
                let v156 = atom.create(v70)
                let v157 = atom.create(v72)
                let v158 = []
                let v159 = [v136, ..v158]
                let v160 = [v155, ..v159]
                let v161 = erlang_term_apply(v156, v157, v160)
                let v162 = "econnrefused"
                let v163 = atom.create(v162)
                let v164 = erlang_term_coerce(v163)
                let v165 = v161 == v164
                let v181 =
                    case v165 {
                        True -> Us73Refused
                        False -> {
                            let v167 = "timeout"
                            let v168 = atom.create(v167)
                            let v169 = erlang_term_coerce(v168)
                            let v170 = v161 == v169
                            case v170 {
                                True -> Us73TimedOut
                                False -> {
                                    let v172 = "closed"
                                    let v173 = atom.create(v172)
                                    let v174 = erlang_term_coerce(v173)
                                    let v175 = v161 == v174
                                    case v175 {
                                        True -> Us73Closed
                                        False -> {
                                            let v177 = string.inspect(v161)
                                            Us73Failed(v177)
                                        }
                                    }
                                }
                            }
                        }
                    }
                Us72Error(v181)
            }
        }
    let v188 =
        case v183  {
            Us72Error(v186) -> 0
            Us72Ok(v184) -> {
                let v185 = erlang_term_coerce(v184)
                v185
            }
        }
    let v189 = int.to_string(v188)
    let v190 = spiral_fs_write_file(v1, v189)
    let v191 = spiral_fs_coerce(v190)
    let v192 = atom.create(v78)
    let v193 = v191 == v192
    let v194 = v193 == False
    case v194 {
        True -> panic as "file_system.write_all_text: the write failed"
        False -> Nil
    }
    let #(v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206) = world_of_456(v0)
    served_468(v195, v196, v197, v198, v199, v200, v201, v202, v203, v204, v205, v206, v2, v129)
}
