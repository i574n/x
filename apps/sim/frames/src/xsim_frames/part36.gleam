import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Uh30, type Uh37, type Uh39, Uh14Nil, Uh30Cons, Uh30Nil, Uh37Nil, Uh39Cons, Uh39Nil, Uh3Cons, Uh3Nil, Uh40Nil, Uh42Nil, Uh44Text, Uh45Cons, Uh45Nil, Uh49Cons, Uh49Nil, Uh50Nil, Uh51Cons, Uh51Nil, Us103H1, Us104Heading, Us107AppBearer, Us109Error, Us109Ok, Us110None, Us110Some, Us111UserBearer, Us112ClientBasic, Us56Error, Us56Ok, Us80Error, Us80Ok}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, spiral_fs_read_file, spiral_string_slice, split_list_2}
import xsim_frames/part12.{items_from_303}
import xsim_frames/part16.{method372, method373}
import xsim_frames/part25.{first_value_467, method454, method464, method466, method468, method469, method470, request_of_453}
import xsim_frames/part26.{closure148, consumed_479, element_495, markup_text_498, method476, method477, method478, page_from_473, resumed_from_471, trusted_484}
import xsim_frames/part27.{blocks_html_481, concat_527, header_value_531, method526, method528, method529, method542, method543}
import xsim_frames/part29.{method590}
import xsim_frames/part33.{reply_as_534}
import xsim_frames/part34.{reply_as_654}
import xsim_frames/part35.{reply_as_666, signed_reply_672}
import xsim_frames/part9.{method260, method261}

pub fn keyed_reply_665(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    let v20 = ""
    let v21 = erlang_term_coerce(v20)
    let v23 = erlang_term_coerce("oauth2")
    let v24 = erlang_term_coerce(v21)
    let v25 = "maps"
    let v26 = atom.create(v25)
    let v27 = "get"
    let v28 = atom.create(v27)
    let v29 = []
    let v30 = [v24, ..v29]
    let v31 = [v7, ..v30]
    let v32 = [v23, ..v31]
    let v33 = erlang_term_apply(v26, v28, v32)
    let v34 = erlang_term_coerce(v33)
    let v35 = erlang_term_coerce(v20)
    let v37 = erlang_term_coerce("client_id")
    let v38 = erlang_term_coerce(v35)
    let v39 = atom.create(v25)
    let v40 = atom.create(v27)
    let v41 = []
    let v42 = [v38, ..v41]
    let v43 = [v34, ..v42]
    let v44 = [v37, ..v43]
    let v45 = erlang_term_apply(v39, v40, v44)
    let v46 = erlang_term_coerce(v45)
    let v47 = erlang_term_coerce(v46)
    let v48 = { v47 } <> { ":" }
    let v49 = erlang_term_coerce(v20)
    let v51 = erlang_term_coerce("client_secret")
    let v52 = erlang_term_coerce(v49)
    let v53 = atom.create(v25)
    let v54 = atom.create(v27)
    let v55 = []
    let v56 = [v52, ..v55]
    let v57 = [v34, ..v56]
    let v58 = [v51, ..v57]
    let v59 = erlang_term_apply(v53, v54, v58)
    let v60 = erlang_term_coerce(v59)
    let v61 = erlang_term_coerce(v60)
    let v62 = { v48 } <> { v61 }
    let v63 = erlang_term_coerce(v62)
    let v65 = atom.create("base64")
    let v67 = atom.create("encode")
    let v68 = []
    let v69 = [v63, ..v68]
    let v70 = erlang_term_apply(v65, v67, v69)
    let v71 = erlang_term_coerce(v70)
    let v72 = { "Basic " } <> { v71 }
    let v73 = v19 == v72
    let v75 =
        case v73 {
            True -> {
                v15 == "/2/oauth2/token"
            }
            False -> False
        }
    case v75 {
        True -> {
            reply_as_666(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, Us112ClientBasic)
        }
        False -> signed_reply_672(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
    }
}

pub fn bearer_reply_533(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String, v15: String, v16: String, v17: String, v18: String, v19: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    let v20 = { "Bearer " } <> { v0 }
    let v21 = v19 == v20
    case v21 {
        True -> {
            reply_as_534(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, Us107AppBearer)
        }
        False -> {
            let v37 = { "Bearer " } <> { v1 }
            let v38 = v19 == v37
            case v38 {
                True -> {
                    reply_as_654(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, Us111UserBearer)
                }
                False -> keyed_reply_665(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
            }
        }
    }
}

pub fn replied_530(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    let #(v15, v16, v17, v18, v19) = request_of_453(v14)
    let v21 = header_value_531("authorization", v18)
    bearer_reply_533(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v15, v16, v17, v18, v19, v21)
}

pub fn feed_or_api_452(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: Uh37, v13: String, v14: String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    let #(_v15, v16, v17, _v18, _v19) = request_of_453(v14)
    let v20 = v16 == "/timeline"
    case v20 {
        True -> {
            let #(v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59) =
                case v12  {
                    Uh37Nil -> {
                        let v21 = []
                        let v22 = erlang_term_coerce(v21)
                        let v24 = erlang_term_coerce("users")
                        let v25 = erlang_term_coerce(v22)
                        let v27 = atom.create("maps")
                        let v29 = atom.create("get")
                        let v30 = []
                        let v31 = [v25, ..v30]
                        let v32 = [v7, ..v31]
                        let v33 = [v24, ..v32]
                        let v34 = erlang_term_apply(v27, v29, v33)
                        let v35 = erlang_term_coerce(v34)
                        let v37 = atom.create("lists")
                        let v39 = atom.create("reverse")
                        let v40 = []
                        let v41 = [v35, ..v40]
                        let v42 = erlang_term_apply(v37, v39, v41)
                        let v44 = items_from_303(v42, Uh30Nil)
                        let v46 = method454(v44, v44, Uh37Nil)
                        #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v46)
                    }
                    _ -> #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                }
            let v60 = []
            let v61 = erlang_term_coerce(v60)
            let v63 = erlang_term_coerce("users")
            let v64 = erlang_term_coerce(v61)
            let v66 = atom.create("maps")
            let v68 = atom.create("get")
            let v69 = []
            let v70 = [v64, ..v69]
            let v71 = [v54, ..v70]
            let v72 = [v63, ..v71]
            let v73 = erlang_term_apply(v66, v68, v72)
            let v74 = erlang_term_coerce(v73)
            let v76 = atom.create("lists")
            let v78 = atom.create("reverse")
            let v79 = []
            let v80 = [v74, ..v79]
            let v81 = erlang_term_apply(v76, v78, v80)
            let v83 = items_from_303(v81, Uh30Nil)
            let v85 = method466(v83, Uh3Nil)
            let v87 = v17 == ""
            let v91 =
                case v87 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2("&", v17)
                    }
                }
            let v92 = first_value_467("f", v91)
            let v93 = v92 == ""
            let v95 =
                case v93 {
                    True -> {
                        ""
                    }
                    False -> v92
                }
            let v96 = v95 == ""
            let v100 =
                case v96 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2(".", v95)
                    }
                }
            let v102 = method468(v100, Uh3Nil)
            let v107 =
                case v87 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2("&", v17)
                    }
                }
            let v108 = first_value_467("c", v107)
            let v109 = v108 == ""
            let v111 =
                case v109 {
                    True -> {
                        ""
                    }
                    False -> v108
                }
            let v112 = v111 == ""
            let v116 =
                case v112 {
                    True -> Uh3Nil
                    False -> {
                        split_list_2(".", v111)
                    }
                }
            let v118 = method468(v116, Uh3Nil)
            let v120 = method469(v118, Uh14Nil)
            let v121 = method470(v85, v102)
            let v124 =
                case v121 {
                    True -> v120
                    False -> {
                        Uh14Nil
                    }
                }
            let v125 = resumed_from_471(v59, v124)
            let v126 = closure148(Nil)
            let #(v128, v129) = page_from_473(v126, 50, v125)
            let v131 = method476(v128, Uh40Nil)
            let v133 = method477(v131, Uh40Nil)
            let v135 = method478(v133, Uh42Nil)
            let v136 = consumed_479(v59, v129)
            let v139 = Uh44Text("Following")
            let v141 = Uh45Cons(v139, Uh45Nil)
            let v142 = Us104Heading(Us103H1, v141)
            let v144 = Uh49Cons(v142, Uh49Nil)
            let v145 = blocks_html_481(v144)
            let v149 = trusted_484(".repost{opacity:.6;border-left:3px solid #999;padding-left:.6em}.quoted{border-left:3px solid #48c;margin:.3em 0 .3em .6em;padding-left:.6em}")
            let v150 = element_495("style", Uh50Nil, v149)
            let v152 = method526(v135, Uh51Nil)
            let v153 = Uh51Cons(v145, v152)
            let v154 = Uh51Cons(v150, v153)
            let v155 = concat_527(v154)
            let v156 = markup_text_498(v155)
            let v157 = ""
            let v158 = method528(v85, v157)
            let v159 = { "f=" } <> { v158 }
            let v160 = { v159 } <> { "&c=" }
            let v162 = method529(v136, Uh3Nil)
            let v163 = method528(v162, v157)
            let v164 = { v160 } <> { v163 }
            let v167 =
                case v135  {
                    Uh42Nil -> v157
                    _ -> {
                        let v165 = { "\n<a href=\"/timeline?" } <> { v164 }
                        let v166 = { v165 } <> { "\">next</a>" }
                        v166
                    }
                }
            let v168 = { v156 } <> { v167 }
            let v169 = { v168 } <> { "\n<script>(function(){var busy=!1;function last(){var a=document.querySelectorAll('a[href^=\"/timeline?\"]');return a.length?a[a.length-1]:null}function more(){var a=last();if(!a||busy)return;busy=!0;fetch(a.getAttribute('href')).then(function(r){return r.text()}).then(function(h){var d=new DOMParser().parseFromString(h,'text/html');d.querySelectorAll('article.post').forEach(function(x){a.parentNode.insertBefore(document.importNode(x,!0),a)});var n=d.querySelector('a[href^=\"/timeline?\"]');if(n){a.setAttribute('href',n.getAttribute('href'));busy=!1;check()}else a.remove()}).catch(function(){busy=!1})}function check(){var a=last();if(a&&a.getBoundingClientRect().top<innerHeight*2)more()}addEventListener('scroll',check,{passive:!0});check()})()</script>" }
            let v170 = int.to_string(200)
            let v171 = { "HTTP/1.1 " } <> { v170 }
            let v172 = { v171 } <> { " " }
            let v173 = { v172 } <> { "OK" }
            let v174 = erlang_term_coerce(v169)
            let v176 = atom.create("erlang")
            let v178 = atom.create("byte_size")
            let v179 = []
            let v180 = [v174, ..v179]
            let v181 = erlang_term_apply(v176, v178, v180)
            let v182 = erlang_term_coerce(v181)
            let v183 = int.to_string(v182)
            let v184 = { "\r\nContent-Length: " } <> { v183 }
            let v185 = { "\r\nContent-Type: text/html; charset=utf-8" } <> { v184 }
            let v186 = { v185 } <> { "\r\nConnection: close\r\n\r\n" }
            let v187 = { v173 } <> { v186 }
            let v188 = { v187 } <> { v169 }
            #(v188, v47, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58, v59)
        }
        False -> replied_530(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    }
}

pub fn closure145(capt: #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37, String)) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    fn (v14) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13) = capt
        feed_or_api_452(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    }
}

pub fn closure144(capt: #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    fn (v13) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12) = capt
        closure145(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13))
    }
}

pub fn closure143(capt: Nil) -> fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12) = dom
        closure144(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12))
    }
}

pub fn method691(v0: String, v1: Uh30, v2: Uh39) -> Uh39 {
    case v1  {
        Uh30Cons(v3, v4) -> {
            let v5 = method691(v0, v4, v2)
            let v6 = erlang_term_coerce(v0)
            let v8 = atom.create("filename")
            let v10 = atom.create("dirname")
            let v11 = []
            let v12 = [v6, ..v11]
            let v13 = erlang_term_apply(v8, v10, v12)
            let v15 = atom.create("unicode")
            let v17 = atom.create("characters_to_binary")
            let v18 = []
            let v19 = [v13, ..v18]
            let v20 = erlang_term_apply(v15, v17, v19)
            let v21 = erlang_term_coerce(v20)
            let v22 = { v21 } <> { "/" }
            let v23 = erlang_term_coerce(v3)
            let v24 = { v22 } <> { v23 }
            let v25 = { v24 } <> { ".etf" }
            let v26 = erlang_term_coerce(v25)
            let v27 = "filelib"
            let v28 = atom.create(v27)
            let v29 = "last_modified"
            let v30 = atom.create(v29)
            let v31 = []
            let v32 = [v26, ..v31]
            let v33 = erlang_term_apply(v28, v30, v32)
            let v34 = erlang_term_coerce(v24)
            let v35 = atom.create(v27)
            let v36 = atom.create(v29)
            let v37 = []
            let v38 = [v34, ..v37]
            let v39 = erlang_term_apply(v35, v36, v38)
            let v40 = "erlang"
            let v41 = atom.create(v40)
            let v43 = atom.create(">")
            let v44 = []
            let v45 = [v39, ..v44]
            let v46 = [v33, ..v45]
            let v47 = erlang_term_apply(v41, v43, v46)
            let v48 = erlang_term_coerce(v47)
            let v167 =
                case v48 {
                    True -> {
                        let v49 = erlang_term_coerce(v25)
                        let v50 = "file"
                        let v51 = atom.create(v50)
                        let v53 = atom.create("read_file")
                        let v54 = []
                        let v55 = [v49, ..v54]
                        let v56 = erlang_term_apply(v51, v53, v55)
                        let v57 = erlang_term_coerce(1)
                        let v58 = atom.create(v40)
                        let v59 = "element"
                        let v60 = atom.create(v59)
                        let v61 = []
                        let v62 = [v56, ..v61]
                        let v63 = [v57, ..v62]
                        let v64 = erlang_term_apply(v58, v60, v63)
                        let v66 = atom.create("ok")
                        let v67 = erlang_term_coerce(v66)
                        let v68 = v64 == v67
                        let v84 =
                            case v68 {
                                True -> {
                                    let v69 = erlang_term_coerce(2)
                                    let v70 = atom.create(v40)
                                    let v71 = atom.create(v59)
                                    let v72 = []
                                    let v73 = [v56, ..v72]
                                    let v74 = [v69, ..v73]
                                    let v75 = erlang_term_apply(v70, v71, v74)
                                    let v76 = atom.create(v40)
                                    let v78 = atom.create("binary_to_term")
                                    let v79 = []
                                    let v80 = [v75, ..v79]
                                    let v81 = erlang_term_apply(v76, v78, v80)
                                    Us110Some(v81)
                                }
                                False -> Us110None
                            }
                        case v84  {
                            Us110None -> {
                                let v86 = spiral_fs_read_file(v24)
                                let v87 = method372()
                                let v88 = method373()
                                let v89 = case v86 { Ok(x) -> v87(x) Error(x) -> v88(x) }
                                let v102 =
                                    case v89  {
                                        Us80Error(v99) -> panic as "file_system.read_all_text: file:read_file failed"
                                        Us80Ok(v90) -> {
                                            let v91 = bit_array.to_string(v90)
                                            let v92 = method260()
                                            let v93 = method261()
                                            let v94 = case v91 { Ok(x) -> v92(x) Error(x) -> v93(x) }
                                            case v94  {
                                                Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                                Us56Ok(v95) -> v95
                                            }
                                        }
                                    }
                                let v103 = erlang_term_coerce(v102)
                                let v105 = atom.create("json")
                                let v107 = atom.create("decode")
                                let v108 = []
                                let v109 = [v103, ..v108]
                                let v110 = erlang_term_apply(v105, v107, v109)
                                let v111 = erlang_term_coerce(v25)
                                let v112 = atom.create(v40)
                                let v114 = atom.create("term_to_binary")
                                let v115 = []
                                let v116 = [v110, ..v115]
                                let v117 = erlang_term_apply(v112, v114, v116)
                                let v118 = atom.create(v50)
                                let v120 = atom.create("write_file")
                                let v121 = []
                                let v122 = [v117, ..v121]
                                let v123 = [v111, ..v122]
                                let _v124 = erlang_term_apply(v118, v120, v123)
                                v110
                            }
                            Us110Some(v85) -> v85
                        }
                    }
                    False -> {
                        let v127 = spiral_fs_read_file(v24)
                        let v128 = method372()
                        let v129 = method373()
                        let v130 = case v127 { Ok(x) -> v128(x) Error(x) -> v129(x) }
                        let v143 =
                            case v130  {
                                Us80Error(v140) -> panic as "file_system.read_all_text: file:read_file failed"
                                Us80Ok(v131) -> {
                                    let v132 = bit_array.to_string(v131)
                                    let v133 = method260()
                                    let v134 = method261()
                                    let v135 = case v132 { Ok(x) -> v133(x) Error(x) -> v134(x) }
                                    case v135  {
                                        Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                                        Us56Ok(v136) -> v136
                                    }
                                }
                            }
                        let v144 = erlang_term_coerce(v143)
                        let v146 = atom.create("json")
                        let v148 = atom.create("decode")
                        let v149 = []
                        let v150 = [v144, ..v149]
                        let v151 = erlang_term_apply(v146, v148, v150)
                        let v152 = erlang_term_coerce(v25)
                        let v153 = atom.create(v40)
                        let v155 = atom.create("term_to_binary")
                        let v156 = []
                        let v157 = [v151, ..v156]
                        let v158 = erlang_term_apply(v153, v155, v157)
                        let v160 = atom.create("file")
                        let v162 = atom.create("write_file")
                        let v163 = []
                        let v164 = [v158, ..v163]
                        let v165 = [v152, ..v164]
                        let _v166 = erlang_term_apply(v160, v162, v165)
                        v151
                    }
                }
            let v168 = []
            let v169 = erlang_term_coerce(v168)
            let v171 = erlang_term_coerce("users")
            let v172 = erlang_term_coerce(v169)
            let v174 = atom.create("maps")
            let v176 = atom.create("get")
            let v177 = []
            let v178 = [v172, ..v177]
            let v179 = [v167, ..v178]
            let v180 = [v171, ..v179]
            let v181 = erlang_term_apply(v174, v176, v180)
            let v182 = erlang_term_coerce(v181)
            let v184 = atom.create("lists")
            let v186 = atom.create("reverse")
            let v187 = []
            let v188 = [v182, ..v187]
            let v189 = erlang_term_apply(v184, v186, v188)
            let v191 = items_from_303(v189, Uh30Nil)
            Uh39Cons(v191, v5)
        }
        Uh30Nil -> v2
    }
}

pub fn included_users_690(v0: String, v1: Dynamic) -> Uh30 {
    let v2 = []
    let v3 = erlang_term_coerce(v2)
    let v5 = erlang_term_coerce("include")
    let v6 = erlang_term_coerce(v3)
    let v7 = "maps"
    let v8 = atom.create(v7)
    let v9 = "get"
    let v10 = atom.create(v9)
    let v11 = []
    let v12 = [v6, ..v11]
    let v13 = [v1, ..v12]
    let v14 = [v5, ..v13]
    let v15 = erlang_term_apply(v8, v10, v14)
    let v16 = erlang_term_coerce(v15)
    let v17 = "lists"
    let v18 = atom.create(v17)
    let v19 = "reverse"
    let v20 = atom.create(v19)
    let v21 = []
    let v22 = [v16, ..v21]
    let v23 = erlang_term_apply(v18, v20, v22)
    let v25 = items_from_303(v23, Uh30Nil)
    let v27 = method691(v0, v25, Uh39Nil)
    let v28 = []
    let v29 = erlang_term_coerce(v28)
    let v31 = erlang_term_coerce("users")
    let v32 = erlang_term_coerce(v29)
    let v33 = atom.create(v7)
    let v34 = atom.create(v9)
    let v35 = []
    let v36 = [v32, ..v35]
    let v37 = [v1, ..v36]
    let v38 = [v31, ..v37]
    let v39 = erlang_term_apply(v33, v34, v38)
    let v40 = erlang_term_coerce(v39)
    let v41 = atom.create(v17)
    let v42 = atom.create(v19)
    let v43 = []
    let v44 = [v40, ..v43]
    let v45 = erlang_term_apply(v41, v42, v44)
    let v47 = items_from_303(v45, Uh30Nil)
    let v49 = method590(v27, Uh30Nil)
    method464(v47, v49)
}

pub fn method693(v0: Uh30, v1: Uh3) -> Uh3 {
    case v0  {
        Uh30Cons(v2, v3) -> {
            let v4 = method693(v3, v1)
            let v6 = erlang_term_coerce("")
            let v8 = erlang_term_coerce("created_at")
            let v9 = erlang_term_coerce(v6)
            let v11 = atom.create("maps")
            let v13 = atom.create("get")
            let v14 = []
            let v15 = [v9, ..v14]
            let v16 = [v2, ..v15]
            let v17 = [v8, ..v16]
            let v18 = erlang_term_apply(v11, v13, v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = erlang_term_coerce(v19)
            let v21 = spiral_string_slice(v20, 0, 18)
            Uh3Cons(v21, v4)
        }
        Uh30Nil -> v1
    }
}

pub fn method694(v0: Uh3, v1: String) -> String {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = erlang_term_coerce(v1)
            let v5 = erlang_term_coerce(v2)
            let v7 = atom.create("erlang")
            let v9 = atom.create(">=")
            let v10 = []
            let v11 = [v5, ..v10]
            let v12 = [v4, ..v11]
            let v13 = erlang_term_apply(v7, v9, v12)
            let v14 = erlang_term_coerce(v13)
            let v15 =
                case v14 {
                    True -> v1
                    False -> v2
                }
            method694(v3, v15)
        }
        Uh3Nil -> v1
    }
}

pub fn method696(v0: Dynamic, v1: Uh30, v2: dict.Dict(String, Dynamic)) -> dict.Dict(String, Dynamic) {
    case v1  {
        Uh30Cons(v3, v4) -> {
            let v5 = ""
            let v6 = erlang_term_coerce(v5)
            let v7 = "id"
            let v8 = erlang_term_coerce(v7)
            let v9 = erlang_term_coerce(v6)
            let v10 = "maps"
            let v11 = atom.create(v10)
            let v12 = "get"
            let v13 = atom.create(v12)
            let v14 = []
            let v15 = [v9, ..v14]
            let v16 = [v3, ..v15]
            let v17 = [v8, ..v16]
            let v18 = erlang_term_apply(v11, v13, v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = "erlang"
            let v21 = atom.create(v20)
            let v23 = atom.create("is_binary")
            let v24 = []
            let v25 = [v19, ..v24]
            let v26 = erlang_term_apply(v21, v23, v25)
            let v27 = erlang_term_coerce(v26)
            let v36 =
                case v27 {
                    True -> {
                        erlang_term_coerce(v19)
                    }
                    False -> {
                        let v29 = atom.create(v20)
                        let v31 = atom.create("integer_to_binary")
                        let v32 = []
                        let v33 = [v19, ..v32]
                        let v34 = erlang_term_apply(v29, v31, v33)
                        erlang_term_coerce(v34)
                    }
                }
            let v37 = erlang_term_coerce(v5)
            let v38 = erlang_term_coerce(v7)
            let v39 = erlang_term_coerce(v37)
            let v40 = atom.create(v10)
            let v41 = atom.create(v12)
            let v42 = []
            let v43 = [v39, ..v42]
            let v44 = [v0, ..v43]
            let v45 = [v38, ..v44]
            let v46 = erlang_term_apply(v40, v41, v45)
            let v47 = erlang_term_coerce(v46)
            let v49 = erlang_term_coerce("author_id")
            let v50 = erlang_term_coerce(v47)
            let v51 = atom.create(v10)
            let v53 = atom.create("put")
            let v54 = []
            let v55 = [v3, ..v54]
            let v56 = [v50, ..v55]
            let v57 = [v49, ..v56]
            let v58 = erlang_term_apply(v51, v53, v57)
            let v59 = dict.insert(v2, v36, v58)
            method696(v0, v4, v59)
        }
        Uh30Nil -> v2
    }
}

pub fn with_posts_695(v0: Dynamic, v1: dict.Dict(String, Dynamic)) -> dict.Dict(String, Dynamic) {
    let v2 = []
    let v3 = erlang_term_coerce(v2)
    let v5 = erlang_term_coerce("posts")
    let v6 = erlang_term_coerce(v3)
    let v8 = atom.create("maps")
    let v10 = atom.create("get")
    let v11 = []
    let v12 = [v6, ..v11]
    let v13 = [v0, ..v12]
    let v14 = [v5, ..v13]
    let v15 = erlang_term_apply(v8, v10, v14)
    let v16 = erlang_term_coerce(v15)
    let v18 = atom.create("lists")
    let v20 = atom.create("reverse")
    let v21 = []
    let v22 = [v16, ..v21]
    let v23 = erlang_term_apply(v18, v20, v22)
    let v25 = items_from_303(v23, Uh30Nil)
    method696(v0, v25, v1)
}

pub fn method692(v0: Uh30, v1: String, v2: String, v3: dict.Dict(String, Dynamic), v4: dict.Dict(String, Dynamic), v5: Int, v6: dict.Dict(String, Dynamic), v7: String, v8: Dynamic, v9: Uh3, v10: Dynamic, v11: dict.Dict(String, Nil), v12: Int, v13: Uh37) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh37) {
    let #(v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187) =
        case v0  {
            Uh30Cons(v14, v15) -> {
                let v16 = ""
                let v17 = erlang_term_coerce(v16)
                let v18 = "username"
                let v19 = erlang_term_coerce(v18)
                let v20 = erlang_term_coerce(v17)
                let v21 = "maps"
                let v22 = atom.create(v21)
                let v23 = "get"
                let v24 = atom.create(v23)
                let v25 = []
                let v26 = [v20, ..v25]
                let v27 = [v14, ..v26]
                let v28 = [v19, ..v27]
                let v29 = erlang_term_apply(v22, v24, v28)
                let v30 = erlang_term_coerce(v29)
                let v31 = erlang_term_coerce(v30)
                let v32 = v31 |> string.lowercase
                let v33 = dict.get(v3, v32)
                let v34 = method542()
                let v35 = method543()
                let v36 = case v33 { Ok(x) -> v34(x) Error(x) -> v35(x) }
                let v41 =
                    case v36  {
                        Us109Error -> Us110None
                        Us109Ok(v37) -> Us110Some(v37)
                    }
                let v102 =
                    case v41  {
                        Us110None -> True
                        Us110Some(v42) -> {
                            let v43 = []
                            let v44 = erlang_term_coerce(v43)
                            let v45 = "posts"
                            let v46 = erlang_term_coerce(v45)
                            let v47 = erlang_term_coerce(v44)
                            let v48 = atom.create(v21)
                            let v49 = atom.create(v23)
                            let v50 = []
                            let v51 = [v47, ..v50]
                            let v52 = [v14, ..v51]
                            let v53 = [v46, ..v52]
                            let v54 = erlang_term_apply(v48, v49, v53)
                            let v55 = erlang_term_coerce(v54)
                            let v56 = "lists"
                            let v57 = atom.create(v56)
                            let v58 = "reverse"
                            let v59 = atom.create(v58)
                            let v60 = []
                            let v61 = [v55, ..v60]
                            let v62 = erlang_term_apply(v57, v59, v61)
                            let v64 = items_from_303(v62, Uh30Nil)
                            let v66 = method693(v64, Uh3Nil)
                            let v67 = method694(v66, v16)
                            let v68 = []
                            let v69 = erlang_term_coerce(v68)
                            let v70 = erlang_term_coerce(v45)
                            let v71 = erlang_term_coerce(v69)
                            let v72 = atom.create(v21)
                            let v73 = atom.create(v23)
                            let v74 = []
                            let v75 = [v71, ..v74]
                            let v76 = [v42, ..v75]
                            let v77 = [v70, ..v76]
                            let v78 = erlang_term_apply(v72, v73, v77)
                            let v79 = erlang_term_coerce(v78)
                            let v80 = atom.create(v56)
                            let v81 = atom.create(v58)
                            let v82 = []
                            let v83 = [v79, ..v82]
                            let v84 = erlang_term_apply(v80, v81, v83)
                            let v86 = items_from_303(v84, Uh30Nil)
                            let v88 = method693(v86, Uh3Nil)
                            let v89 = method694(v88, v16)
                            let v90 = erlang_term_coerce(v67)
                            let v91 = erlang_term_coerce(v89)
                            let v93 = atom.create("erlang")
                            let v95 = atom.create(">=")
                            let v96 = []
                            let v97 = [v91, ..v96]
                            let v98 = [v90, ..v97]
                            let v99 = erlang_term_apply(v93, v95, v98)
                            erlang_term_coerce(v99)
                        }
                    }
                let v117 =
                    case v102 {
                        True -> {
                            let v103 = erlang_term_coerce(v16)
                            let v104 = erlang_term_coerce(v18)
                            let v105 = erlang_term_coerce(v103)
                            let v106 = atom.create(v21)
                            let v107 = atom.create(v23)
                            let v108 = []
                            let v109 = [v105, ..v108]
                            let v110 = [v14, ..v109]
                            let v111 = [v104, ..v110]
                            let v112 = erlang_term_apply(v106, v107, v111)
                            let v113 = erlang_term_coerce(v112)
                            let v114 = erlang_term_coerce(v113)
                            let v115 = v114 |> string.lowercase
                            dict.insert(v3, v115, v14)
                        }
                        False -> v3
                    }
                let v118 = erlang_term_coerce(v16)
                let v120 = erlang_term_coerce("id")
                let v121 = erlang_term_coerce(v118)
                let v122 = atom.create(v21)
                let v123 = atom.create(v23)
                let v124 = []
                let v125 = [v121, ..v124]
                let v126 = [v14, ..v125]
                let v127 = [v120, ..v126]
                let v128 = erlang_term_apply(v122, v123, v127)
                let v129 = erlang_term_coerce(v128)
                let v130 = "erlang"
                let v131 = atom.create(v130)
                let v133 = atom.create("is_binary")
                let v134 = []
                let v135 = [v129, ..v134]
                let v136 = erlang_term_apply(v131, v133, v135)
                let v137 = erlang_term_coerce(v136)
                let v146 =
                    case v137 {
                        True -> {
                            erlang_term_coerce(v129)
                        }
                        False -> {
                            let v139 = atom.create(v130)
                            let v141 = atom.create("integer_to_binary")
                            let v142 = []
                            let v143 = [v129, ..v142]
                            let v144 = erlang_term_apply(v139, v141, v143)
                            erlang_term_coerce(v144)
                        }
                    }
                let v147 = dict.insert(v4, v146, v14)
                let v148 = with_posts_695(v14, v6)
                method692(v15, v1, v2, v117, v147, v5, v148, v7, v8, v9, v10, v11, v12, v13)
            }
            _ -> {
                let #(v162, v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174) =
                    case v0  {
                        Uh30Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v162, v163, v164, v165, v166, v167, v168, v169, v170, v171, v172, v173, v174)
            }
        }
    #(v175, v176, v177, v178, v179, v180, v181, v182, v183, v184, v185, v186, v187)
}
