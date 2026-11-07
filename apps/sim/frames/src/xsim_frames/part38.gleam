import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Uh36, Uh29Nil, Uh3Cons, Uh3Nil, Uh50Cons, Uh50Nil, Us114Error, Us114Ok, Us3None, Us3Some, Us72Error, Us72Ok, Us73Closed, Us73Failed, Us73Refused, Us73TimedOut}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_length, spiral_string_slice, spiral_wrap_signed}
import xsim_frames/part12.{items_from_301}
import xsim_frames/part18.{closure29, get_environment_variable_404, method396}
import xsim_frames/part19.{closure108}
import xsim_frames/part20.{closure110}
import xsim_frames/part21.{closure116}
import xsim_frames/part22.{closure122}
import xsim_frames/part23.{closure130}
import xsim_frames/part24.{closure136}
import xsim_frames/part3.{closure0, closure5, closure7, closure9, method56, method57}
import xsim_frames/part35.{oauth1_signature_679}
import xsim_frames/part36.{closure143}
import xsim_frames/part37.{opened_688}
import xsim_frames/part5.{closure10, closure12, closure13, closure14}
import xsim_frames/part6.{closure15}
import xsim_frames/part8.{closure19, closure27, closure28}

pub fn listening_687(v0: fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String), v1: String, v2: String, v3: String) -> Int {
    let v5 = get_environment_variable_404("SIM_PORT")
    let v6 = spiral_string_length(v5)
    let v8 = method56(v5, v6, 0)
    let v9 = spiral_wrap_signed(v6 - 1, 32)
    let v10 = spiral_string_slice(v5, v8, v9)
    let v11 = spiral_string_length(v10)
    let v12 = method57(v10, v11)
    let v13 = spiral_string_slice(v10, 0, v12)
    let v14 = count_of_text_10(v13)
    let v17 =
        case v14  {
            Us3None -> 0
            Us3Some(v15) -> v15
        }
    let v18 = erlang_term_coerce(v17)
    let v20 = atom.create("true")
    let v21 = erlang_term_coerce(v20)
    let v23 = atom.create("reuseaddr")
    let v24 = erlang_term_coerce(v23)
    let v25 = []
    let v26 = [v21, ..v25]
    let v27 = [v24, ..v26]
    let v28 = erlang_term_tuple(v27)
    let v29 = erlang_term_coerce(1)
    let v30 = erlang_term_coerce(0)
    let v31 = erlang_term_coerce(0)
    let v32 = erlang_term_coerce(127)
    let v33 = []
    let v34 = [v29, ..v33]
    let v35 = [v30, ..v34]
    let v36 = [v31, ..v35]
    let v37 = [v32, ..v36]
    let v38 = erlang_term_tuple(v37)
    let v40 = atom.create("ip")
    let v41 = erlang_term_coerce(v40)
    let v42 = []
    let v43 = [v38, ..v42]
    let v44 = [v41, ..v43]
    let v45 = erlang_term_tuple(v44)
    let v47 = atom.create("binary")
    let v48 = erlang_term_coerce(v47)
    let v50 = atom.create("raw")
    let v51 = erlang_term_coerce(v50)
    let v53 = atom.create("packet")
    let v54 = erlang_term_coerce(v53)
    let v55 = []
    let v56 = [v51, ..v55]
    let v57 = [v54, ..v56]
    let v58 = erlang_term_tuple(v57)
    let v60 = atom.create("false")
    let v61 = erlang_term_coerce(v60)
    let v63 = atom.create("active")
    let v64 = erlang_term_coerce(v63)
    let v65 = []
    let v66 = [v61, ..v65]
    let v67 = [v64, ..v66]
    let v68 = erlang_term_tuple(v67)
    let v69 = []
    let v70 = [v45, ..v69]
    let v71 = [v28, ..v70]
    let v72 = [v68, ..v71]
    let v73 = [v58, ..v72]
    let v74 = [v48, ..v73]
    let v75 = erlang_term_coerce(v74)
    let v77 = atom.create("gen_tcp")
    let v79 = atom.create("listen")
    let v80 = []
    let v81 = [v75, ..v80]
    let v82 = [v18, ..v81]
    let v83 = erlang_term_apply(v77, v79, v82)
    let v84 = erlang_term_coerce(1)
    let v85 = "erlang"
    let v86 = atom.create(v85)
    let v87 = "element"
    let v88 = atom.create(v87)
    let v89 = []
    let v90 = [v83, ..v89]
    let v91 = [v84, ..v90]
    let v92 = erlang_term_apply(v86, v88, v91)
    let v94 = atom.create("ok")
    let v95 = erlang_term_coerce(v94)
    let v96 = v92 == v95
    let v133 =
        case v96 {
            True -> {
                let v97 = erlang_term_coerce(2)
                let v98 = atom.create(v85)
                let v99 = atom.create(v87)
                let v100 = []
                let v101 = [v83, ..v100]
                let v102 = [v97, ..v101]
                let v103 = erlang_term_apply(v98, v99, v102)
                Us72Ok(v103)
            }
            False -> {
                let v105 = erlang_term_coerce(2)
                let v106 = atom.create(v85)
                let v107 = atom.create(v87)
                let v108 = []
                let v109 = [v83, ..v108]
                let v110 = [v105, ..v109]
                let v111 = erlang_term_apply(v106, v107, v110)
                let v113 = atom.create("econnrefused")
                let v114 = erlang_term_coerce(v113)
                let v115 = v111 == v114
                let v131 =
                    case v115 {
                        True -> Us73Refused
                        False -> {
                            let v118 = atom.create("timeout")
                            let v119 = erlang_term_coerce(v118)
                            let v120 = v111 == v119
                            case v120 {
                                True -> Us73TimedOut
                                False -> {
                                    let v123 = atom.create("closed")
                                    let v124 = erlang_term_coerce(v123)
                                    let v125 = v111 == v124
                                    case v125 {
                                        True -> Us73Closed
                                        False -> {
                                            let v127 = string.inspect(v111)
                                            Us73Failed(v127)
                                        }
                                    }
                                }
                            }
                        }
                    }
                Us72Error(v131)
            }
        }
    let v139 =
        case v133  {
            Us72Error(v136) -> Us114Error(v136)
            Us72Ok(v134) -> Us114Ok(v134)
        }
    case v139  {
        Us114Error(v142) -> {
            let v143 = int.to_string(v17)
            let v144 = { "xsim serve / cannot listen on port " } <> { v143 }
            let v145 = { v144 } <> { "\n" }
            let v147 = atom.create("standard_error")
            let v148 = erlang_term_coerce(v147)
            let v149 = erlang_term_coerce(v145)
            let v151 = atom.create("io")
            let v153 = atom.create("put_chars")
            let v154 = []
            let v155 = [v149, ..v154]
            let v156 = [v148, ..v155]
            let _v157 = erlang_term_apply(v151, v153, v156)
            4
        }
        Us114Ok(v140) -> opened_688(v0, v1, v2, v3, v140)
    }
}

pub fn started_686(v0: fn(#(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String)) -> fn(String) -> fn(String) -> #(String, String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int, Uh36, String), v1: String, v2: String, v3: String) -> Int {
    let v23 = Uh50Cons("oauth_timestamp", "1318622958", Uh50Nil)
    let v24 = Uh50Cons("oauth_signature_method", "HMAC-SHA1", v23)
    let v25 = Uh50Cons("oauth_nonce", "kYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cg", v24)
    let v26 = Uh50Cons("oauth_consumer_key", "xvz1evFS4wEEPTGEFPHBog", v25)
    let v27 = Uh50Cons("oauth_version", "1.0", v26)
    let v28 = Uh50Cons("oauth_token", "370773112-GmHxMAgYyLbNEtIKZeRNFsMKPR9EyMZeS9weJAEb", v27)
    let v29 = Uh50Cons("status", "Hello Ladies + Gentlemen, a signed OAuth request!", v28)
    let v30 = Uh50Cons("include_entities", "true", v29)
    let v33 = oauth1_signature_679("POST", "https://api.x.com/1.1/statuses/update.json", v30, "kAcSOqF21Fu85e7zjz7ZN2U4ZRhfV3WpwPAoE3Z7kBw", "LswwdoUaIvS8ltyTt5jkRh4J50vUPVVHtR2YPi5kE")
    let v34 = v33 == "Ls93hJiZbQ3akF3HF3x1Bz8/zU4="
    case v34 {
        True -> listening_687(v0, v1, v2, v3)
        False -> 3
    }
}

pub fn closure142(capt: Nil) -> fn(String) -> Int {
    fn (v0) {
        let v2 = atom.create("init")
        let v4 = atom.create("get_plain_arguments")
        let v5 = []
        let v6 = erlang_term_apply(v2, v4, v5)
        let v8 = atom.create("lists")
        let v10 = atom.create("reverse")
        let v11 = []
        let v12 = [v6, ..v11]
        let v13 = erlang_term_apply(v8, v10, v12)
        let v15 = items_from_301(v13, Uh29Nil)
        let v17 = method396(v15, Uh3Nil)
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
                            Uh3Cons(v27, v28) -> {
                                let v29 = closure143(Nil)
                                started_686(v29, v23, v25, v27)
                            }
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
