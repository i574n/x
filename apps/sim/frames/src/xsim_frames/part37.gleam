import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/string
import xsim_frames/types.{type Uh3, Uh36Cons, Uh36Nil, Uh3Cons, Uh3Nil}
import xsim_frames/part1.{erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_fs_coerce, spiral_fs_write_file, split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part20.{closure29}
import xsim_frames/part21.{closure110}
import xsim_frames/part22.{closure112}
import xsim_frames/part23.{closure118}
import xsim_frames/part24.{closure124}
import xsim_frames/part25.{closure132}
import xsim_frames/part26.{closure138}
import xsim_frames/part27.{oauth1_signature_441, world_of_447}
import xsim_frames/part3.{closure0, closure5, closure7, closure9}
import xsim_frames/part36.{handled_456}
import xsim_frames/part5.{closure10, closure12}
import xsim_frames/part6.{closure13, closure14, closure15}
import xsim_frames/part9.{closure19, closure27, closure28}

pub fn served_455(v0: String, v1: String, v2: dict.Dict(String, Dynamic), v3: dict.Dict(String, Dynamic), v4: Int, v5: dict.Dict(String, Dynamic), v6: String, v7: Dynamic, v8: Uh3, v9: Dynamic, v10: dict.Dict(String, Nil), v11: Int, v12: String, v13: Dynamic) -> Int {
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
            let #(v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62) = handled_456(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v50)
            served_455(v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62, v12, v13)
        }
    }
}

pub fn listening_446(v0: String, v1: String, v2: String) -> Int {
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
    let v89 = string.inspect(v88)
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
    let #(v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107) = world_of_447(v0)
    served_455(v96, v97, v98, v99, v100, v101, v102, v103, v104, v105, v106, v107, v2, v73)
}

pub fn started_440(v0: String, v1: String, v2: String) -> Int {
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
    let v32 = oauth1_signature_441(v3, v4, v29, v30, v31)
    let v33 = v32 == "Ls93hJiZbQ3akF3HF3x1Bz8/zU4="
    case v33 {
        True -> listening_446(v0, v1, v2)
        False -> 3
    }
}

pub fn closure144(capt: Nil) -> fn(String) -> Int {
    fn (v0) {
        let v1 = "init"
        let v2 = atom.create(v1)
        let v3 = "get_plain_arguments"
        let v4 = atom.create(v3)
        let v5 = []
        let v6 = erlang_term_apply(v2, v4, v5)
        let v7 = erlang_term_coerce(0)
        let v8 = []
        let v9 = [v7, ..v8]
        let v10 = erlang_term_coerce(v9)
        let v11 = "lists"
        let v12 = atom.create(v11)
        let v13 = "join"
        let v14 = atom.create(v13)
        let v15 = []
        let v16 = [v6, ..v15]
        let v17 = [v10, ..v16]
        let v18 = erlang_term_apply(v12, v14, v17)
        let v19 = "unicode"
        let v20 = atom.create(v19)
        let v21 = "characters_to_binary"
        let v22 = atom.create(v21)
        let v23 = []
        let v24 = [v18, ..v23]
        let v25 = erlang_term_apply(v20, v22, v24)
        let v26 = erlang_term_coerce(v25)
        let v27 = unicode_erlang_characters_to_binary([0])
        let v28 = v26 == ""
        let v31 =
            case v28 {
                True -> Uh3Nil
                False -> split_list_2(v27, v26)
            }
        let v36 =
            case v31  {
                Uh3Cons(v32, v33) -> v33
                Uh3Nil -> Uh3Nil
            }
        case v36  {
            Uh3Cons(v37, v38) -> {
                case v38  {
                    Uh3Cons(v39, v40) -> {
                        case v40  {
                            Uh3Cons(v41, v42) -> started_440(v37, v39, v41)
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
    let _v13 = closure110(Nil)
    let _ = Nil
    let _v14 = closure112(Nil)
    let _ = Nil
    let _v15 = closure118(Nil)
    let _ = Nil
    let _v16 = closure124(Nil)
    let _ = Nil
    let _v17 = closure132(Nil)
    let _ = Nil
    let _v18 = closure138(Nil)
    let _ = Nil
    let _v19 = closure144(Nil)
    let _ = Nil
    0
}
