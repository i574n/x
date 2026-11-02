import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Uh36, type Uh37, Uh29Cons, Uh29Nil, Uh36Cons, Uh36Nil, Uh37Cons, Uh37Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us3None, Us3Some, Us56Error, Us56Ok, Us76Error, Us76Ok}
import xsim_frames/part1.{closure1, count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_fs_read_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part10.{method258, method259}
import xsim_frames/part13.{method300}
import xsim_frames/part17.{method366, method367}
import xsim_frames/part2.{delimited_21}
import xsim_frames/part3.{method56, method57}

pub fn method442(v0: Uh36, v1: Uh29) -> Uh29 {
    case v0  {
        Uh36Cons(v2, v3, v4) -> {
            let v5 = method442(v4, v1)
            let v6 = erlang_term_coerce(v2)
            let v7 = ""
            let v8 = erlang_term_coerce(v7)
            let v9 = "unicode"
            let v10 = atom.create(v9)
            let v11 = "characters_to_list"
            let v12 = atom.create(v11)
            let v13 = []
            let v14 = [v8, ..v13]
            let v15 = erlang_term_apply(v10, v12, v14)
            let v16 = "uri_string"
            let v17 = atom.create(v16)
            let v18 = "quote"
            let v19 = atom.create(v18)
            let v20 = []
            let v21 = [v15, ..v20]
            let v22 = [v6, ..v21]
            let v23 = erlang_term_apply(v17, v19, v22)
            let v24 = erlang_term_coerce(v23)
            let v25 = erlang_term_coerce(v24)
            let v26 = erlang_term_coerce(v3)
            let v27 = erlang_term_coerce(v7)
            let v28 = atom.create(v9)
            let v29 = atom.create(v11)
            let v30 = []
            let v31 = [v27, ..v30]
            let v32 = erlang_term_apply(v28, v29, v31)
            let v33 = atom.create(v16)
            let v34 = atom.create(v18)
            let v35 = []
            let v36 = [v32, ..v35]
            let v37 = [v26, ..v36]
            let v38 = erlang_term_apply(v33, v34, v37)
            let v39 = erlang_term_coerce(v38)
            let v40 = erlang_term_coerce(v39)
            let v41 = []
            let v42 = [v40, ..v41]
            let v43 = [v25, ..v42]
            let v44 = erlang_term_tuple(v43)
            Uh29Cons(v44, v5)
        }
        Uh36Nil -> v1
    }
}

pub fn items_from_443(v0: Dynamic, v1: Uh29) -> Uh29 {
    let v2 = []
    let v3 = erlang_term_coerce(v2)
    let v4 = v0 == v3
    case v4 {
        True -> v1
        False -> {
            let v5 = "erlang"
            let v6 = atom.create(v5)
            let v7 = "tl"
            let v8 = atom.create(v7)
            let v9 = []
            let v10 = [v0, ..v9]
            let v11 = erlang_term_apply(v6, v8, v10)
            let v12 = atom.create(v5)
            let v13 = "hd"
            let v14 = atom.create(v13)
            let v15 = []
            let v16 = [v0, ..v15]
            let v17 = erlang_term_apply(v12, v14, v16)
            let v18 = Uh29Cons(v17, v1)
            items_from_443(v11, v18)
        }
    }
}

pub fn method444(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method444(v3, v1)
            let v5 = erlang_term_coerce(1)
            let v6 = "erlang"
            let v7 = atom.create(v6)
            let v8 = "element"
            let v9 = atom.create(v8)
            let v10 = []
            let v11 = [v2, ..v10]
            let v12 = [v5, ..v11]
            let v13 = erlang_term_apply(v7, v9, v12)
            let v14 = erlang_term_coerce(v13)
            let v15 = "="
            let v16 = v14 <> v15 
            let v17 = erlang_term_coerce(2)
            let v18 = atom.create(v6)
            let v19 = atom.create(v8)
            let v20 = []
            let v21 = [v2, ..v20]
            let v22 = [v17, ..v21]
            let v23 = erlang_term_apply(v18, v19, v22)
            let v24 = erlang_term_coerce(v23)
            let v25 = v16 <> v24 
            Uh3Cons(v25, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn signed_params_441(v0: Uh36) -> String {
    let v1 = Uh29Nil
    let v2 = method442(v0, v1)
    let v3 = []
    let v4 = method300(v2, v3)
    let v5 = erlang_term_coerce(v4)
    let v6 = "lists"
    let v7 = atom.create(v6)
    let v8 = "sort"
    let v9 = atom.create(v8)
    let v10 = []
    let v11 = [v5, ..v10]
    let v12 = erlang_term_apply(v7, v9, v11)
    let v13 = atom.create(v6)
    let v14 = "reverse"
    let v15 = atom.create(v14)
    let v16 = []
    let v17 = [v12, ..v16]
    let v18 = erlang_term_apply(v13, v15, v17)
    let v19 = Uh29Nil
    let v20 = items_from_443(v18, v19)
    let v21 = Uh3Nil
    let v22 = method444(v20, v21)
    let v23 = "&"
    delimited_21(v23, v22)
}

pub fn oauth1_signature_440(v0: String, v1: String, v2: Uh36, v3: String, v4: String) -> String {
    let v5 = "&"
    let v6 = v0 <> v5 
    let v7 = erlang_term_coerce(v1)
    let v8 = ""
    let v9 = erlang_term_coerce(v8)
    let v10 = "unicode"
    let v11 = atom.create(v10)
    let v12 = "characters_to_list"
    let v13 = atom.create(v12)
    let v14 = []
    let v15 = [v9, ..v14]
    let v16 = erlang_term_apply(v11, v13, v15)
    let v17 = "uri_string"
    let v18 = atom.create(v17)
    let v19 = "quote"
    let v20 = atom.create(v19)
    let v21 = []
    let v22 = [v16, ..v21]
    let v23 = [v7, ..v22]
    let v24 = erlang_term_apply(v18, v20, v23)
    let v25 = erlang_term_coerce(v24)
    let v26 = v6 <> v25 
    let v27 = v26 <> v5 
    let v28 = signed_params_441(v2)
    let v29 = erlang_term_coerce(v28)
    let v30 = erlang_term_coerce(v8)
    let v31 = atom.create(v10)
    let v32 = atom.create(v12)
    let v33 = []
    let v34 = [v30, ..v33]
    let v35 = erlang_term_apply(v31, v32, v34)
    let v36 = atom.create(v17)
    let v37 = atom.create(v19)
    let v38 = []
    let v39 = [v35, ..v38]
    let v40 = [v29, ..v39]
    let v41 = erlang_term_apply(v36, v37, v40)
    let v42 = erlang_term_coerce(v41)
    let v43 = v27 <> v42 
    let v44 = erlang_term_coerce(v3)
    let v45 = erlang_term_coerce(v8)
    let v46 = atom.create(v10)
    let v47 = atom.create(v12)
    let v48 = []
    let v49 = [v45, ..v48]
    let v50 = erlang_term_apply(v46, v47, v49)
    let v51 = atom.create(v17)
    let v52 = atom.create(v19)
    let v53 = []
    let v54 = [v50, ..v53]
    let v55 = [v44, ..v54]
    let v56 = erlang_term_apply(v51, v52, v55)
    let v57 = erlang_term_coerce(v56)
    let v58 = v57 <> v5 
    let v59 = erlang_term_coerce(v4)
    let v60 = erlang_term_coerce(v8)
    let v61 = atom.create(v10)
    let v62 = atom.create(v12)
    let v63 = []
    let v64 = [v60, ..v63]
    let v65 = erlang_term_apply(v61, v62, v64)
    let v66 = atom.create(v17)
    let v67 = atom.create(v19)
    let v68 = []
    let v69 = [v65, ..v68]
    let v70 = [v59, ..v69]
    let v71 = erlang_term_apply(v66, v67, v70)
    let v72 = erlang_term_coerce(v71)
    let v73 = v58 <> v72 
    let v74 = "hmac"
    let v75 = atom.create(v74)
    let v76 = erlang_term_coerce(v75)
    let v77 = "sha"
    let v78 = atom.create(v77)
    let v79 = erlang_term_coerce(v78)
    let v80 = erlang_term_coerce(v73)
    let v81 = erlang_term_coerce(v43)
    let v82 = "crypto"
    let v83 = atom.create(v82)
    let v84 = "mac"
    let v85 = atom.create(v84)
    let v86 = []
    let v87 = [v81, ..v86]
    let v88 = [v80, ..v87]
    let v89 = [v79, ..v88]
    let v90 = [v76, ..v89]
    let v91 = erlang_term_apply(v83, v85, v90)
    let v92 = "base64"
    let v93 = atom.create(v92)
    let v94 = "encode"
    let v95 = atom.create(v94)
    let v96 = []
    let v97 = [v91, ..v96]
    let v98 = erlang_term_apply(v93, v95, v97)
    let v99 = erlang_term_coerce(v98)
    v99
}

pub fn method448(v0: String, v1: Uh29, v2: Uh37) -> Uh37 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method448(v0, v4, v2)
            let v6 = erlang_term_coerce(v0)
            let v7 = "filename"
            let v8 = atom.create(v7)
            let v9 = "dirname"
            let v10 = atom.create(v9)
            let v11 = []
            let v12 = [v6, ..v11]
            let v13 = erlang_term_apply(v8, v10, v12)
            let v14 = "unicode"
            let v15 = atom.create(v14)
            let v16 = "characters_to_binary"
            let v17 = atom.create(v16)
            let v18 = []
            let v19 = [v13, ..v18]
            let v20 = erlang_term_apply(v15, v17, v19)
            let v21 = erlang_term_coerce(v20)
            let v22 = "/"
            let v23 = v21 <> v22 
            let v24 = erlang_term_coerce(v3)
            let v25 = v23 <> v24 
            let v26 = spiral_fs_read_file(v25)
            let v27 = method366()
            let v28 = method367()
            let v29 = case v26 { Ok(x) -> v27(x) Error(x) -> v28(x) }
            let v42 =
                case v29  {
                    Us76Error(v39) -> panic as "file_system.read_all_text: file:read_file failed"
                    Us76Ok(v30) -> {
                        let v31 = bit_array.to_string(v30)
                        let v32 = method258()
                        let v33 = method259()
                        let v34 = case v31 { Ok(x) -> v32(x) Error(x) -> v33(x) }
                        case v34  {
                            Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                            Us56Ok(v35) -> v35
                        }
                    }
                }
            let v43 = erlang_term_coerce(v42)
            let v44 = "json"
            let v45 = atom.create(v44)
            let v46 = "decode"
            let v47 = atom.create(v46)
            let v48 = []
            let v49 = [v43, ..v48]
            let v50 = erlang_term_apply(v45, v47, v49)
            let v51 = []
            let v52 = erlang_term_coerce(v51)
            let v53 = "users"
            let v54 = erlang_term_coerce(v53)
            let v55 = erlang_term_coerce(v52)
            let v56 = "maps"
            let v57 = atom.create(v56)
            let v58 = "get"
            let v59 = atom.create(v58)
            let v60 = []
            let v61 = [v55, ..v60]
            let v62 = [v50, ..v61]
            let v63 = [v54, ..v62]
            let v64 = erlang_term_apply(v57, v59, v63)
            let v65 = erlang_term_coerce(v64)
            let v66 = "lists"
            let v67 = atom.create(v66)
            let v68 = "reverse"
            let v69 = atom.create(v68)
            let v70 = []
            let v71 = [v65, ..v70]
            let v72 = erlang_term_apply(v67, v69, v71)
            let v73 = Uh29Nil
            let v74 = items_from_443(v72, v73)
            Uh37Cons(v74, v5)
        }
        Uh29Nil -> v2
    }
}

pub fn method450(v0: Uh29, v1: Uh29) -> Uh29 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method450(v3, v1)
            Uh29Cons(v2, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method449(v0: Uh37, v1: Uh29) -> Uh29 {
    case v0  {
        Uh37Cons(v2, v3) -> {
            let v4 = method449(v3, v1)
            method450(v2, v4)
        }
        Uh37Nil -> v1
    }
}

pub fn included_users_447(v0: String, v1: Dynamic) -> Uh29 {
    let v2 = []
    let v3 = erlang_term_coerce(v2)
    let v4 = "include"
    let v5 = erlang_term_coerce(v4)
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
    let v24 = Uh29Nil
    let v25 = items_from_443(v23, v24)
    let v26 = Uh37Nil
    let v27 = method448(v0, v25, v26)
    let v28 = []
    let v29 = erlang_term_coerce(v28)
    let v30 = "users"
    let v31 = erlang_term_coerce(v30)
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
    let v46 = Uh29Nil
    let v47 = items_from_443(v45, v46)
    let v48 = Uh29Nil
    let v49 = method449(v27, v48)
    method450(v47, v49)
}

pub fn method453(v0: Dynamic, v1: Uh29, v2: dict.Dict(String, Dynamic)) -> dict.Dict(String, Dynamic) {
    case v1  {
        Uh29Cons(v3, v4) -> {
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
            let v22 = "is_binary"
            let v23 = atom.create(v22)
            let v24 = []
            let v25 = [v19, ..v24]
            let v26 = erlang_term_apply(v21, v23, v25)
            let v27 = erlang_term_coerce(v26)
            let v36 =
                case v27 {
                    True -> {
                        let v28 = erlang_term_coerce(v19)
                        v28
                    }
                    False -> {
                        let v29 = atom.create(v20)
                        let v30 = "integer_to_binary"
                        let v31 = atom.create(v30)
                        let v32 = []
                        let v33 = [v19, ..v32]
                        let v34 = erlang_term_apply(v29, v31, v33)
                        let v35 = erlang_term_coerce(v34)
                        v35
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
            let v48 = "author_id"
            let v49 = erlang_term_coerce(v48)
            let v50 = erlang_term_coerce(v47)
            let v51 = atom.create(v10)
            let v52 = "put"
            let v53 = atom.create(v52)
            let v54 = []
            let v55 = [v3, ..v54]
            let v56 = [v50, ..v55]
            let v57 = [v49, ..v56]
            let v58 = erlang_term_apply(v51, v53, v57)
            let v59 = dict.insert(v2, v36, v58)
            method453(v0, v4, v59)
        }
        Uh29Nil -> v2
    }
}

pub fn with_posts_452(v0: Dynamic, v1: dict.Dict(String, Dynamic)) -> dict.Dict(String, Dynamic) {
    let v2 = []
    let v3 = erlang_term_coerce(v2)
    let v4 = "posts"
    let v5 = erlang_term_coerce(v4)
    let v6 = erlang_term_coerce(v3)
    let v7 = "maps"
    let v8 = atom.create(v7)
    let v9 = "get"
    let v10 = atom.create(v9)
    let v11 = []
    let v12 = [v6, ..v11]
    let v13 = [v0, ..v12]
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
    let v24 = Uh29Nil
    let v25 = items_from_443(v23, v24)
    method453(v0, v25, v1)
}

pub fn method451(v0: Uh29, v1: String, v2: String, v3: dict.Dict(String, Dynamic), v4: dict.Dict(String, Dynamic), v5: Int, v6: dict.Dict(String, Dynamic), v7: String, v8: Dynamic, v9: Uh3, v10: Dynamic, v11: dict.Dict(String, Nil), v12: Int) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let #(v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99) =
        case v0  {
            Uh29Cons(v13, v14) -> {
                let v15 = ""
                let v16 = erlang_term_coerce(v15)
                let v17 = "username"
                let v18 = erlang_term_coerce(v17)
                let v19 = erlang_term_coerce(v16)
                let v20 = "maps"
                let v21 = atom.create(v20)
                let v22 = "get"
                let v23 = atom.create(v22)
                let v24 = []
                let v25 = [v19, ..v24]
                let v26 = [v13, ..v25]
                let v27 = [v18, ..v26]
                let v28 = erlang_term_apply(v21, v23, v27)
                let v29 = erlang_term_coerce(v28)
                let v30 = erlang_term_coerce(v29)
                let v31 = v30 |> string.lowercase
                let v32 = dict.insert(v3, v31, v13)
                let v33 = erlang_term_coerce(v15)
                let v34 = "id"
                let v35 = erlang_term_coerce(v34)
                let v36 = erlang_term_coerce(v33)
                let v37 = atom.create(v20)
                let v38 = atom.create(v22)
                let v39 = []
                let v40 = [v36, ..v39]
                let v41 = [v13, ..v40]
                let v42 = [v35, ..v41]
                let v43 = erlang_term_apply(v37, v38, v42)
                let v44 = erlang_term_coerce(v43)
                let v45 = "erlang"
                let v46 = atom.create(v45)
                let v47 = "is_binary"
                let v48 = atom.create(v47)
                let v49 = []
                let v50 = [v44, ..v49]
                let v51 = erlang_term_apply(v46, v48, v50)
                let v52 = erlang_term_coerce(v51)
                let v61 =
                    case v52 {
                        True -> {
                            let v53 = erlang_term_coerce(v44)
                            v53
                        }
                        False -> {
                            let v54 = atom.create(v45)
                            let v55 = "integer_to_binary"
                            let v56 = atom.create(v55)
                            let v57 = []
                            let v58 = [v44, ..v57]
                            let v59 = erlang_term_apply(v54, v56, v58)
                            let v60 = erlang_term_coerce(v59)
                            v60
                        }
                    }
                let v62 = dict.insert(v4, v61, v13)
                let v63 = with_posts_452(v13, v6)
                method451(v14, v1, v2, v32, v62, v5, v63, v7, v8, v9, v10, v11, v12)
            }
            _ -> {
                let #(v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87) =
                    case v0  {
                        Uh29Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87)
            }
        }
    #(v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99)
}

pub fn world_of_446(v0: String) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v1 = spiral_fs_read_file(v0)
    let v2 = method366()
    let v3 = method367()
    let v4 = case v1 { Ok(x) -> v2(x) Error(x) -> v3(x) }
    let v17 =
        case v4  {
            Us76Error(v14) -> panic as "file_system.read_all_text: file:read_file failed"
            Us76Ok(v5) -> {
                let v6 = bit_array.to_string(v5)
                let v7 = method258()
                let v8 = method259()
                let v9 = case v6 { Ok(x) -> v7(x) Error(x) -> v8(x) }
                case v9  {
                    Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                    Us56Ok(v10) -> v10
                }
            }
        }
    let v18 = erlang_term_coerce(v17)
    let v19 = "json"
    let v20 = atom.create(v19)
    let v21 = "decode"
    let v22 = atom.create(v21)
    let v23 = []
    let v24 = [v18, ..v23]
    let v25 = erlang_term_apply(v20, v22, v24)
    let v26 = included_users_447(v0, v25)
    let v27 = ""
    let v28 = erlang_term_coerce(v27)
    let v29 = "token"
    let v30 = erlang_term_coerce(v29)
    let v31 = erlang_term_coerce(v28)
    let v32 = "maps"
    let v33 = atom.create(v32)
    let v34 = "get"
    let v35 = atom.create(v34)
    let v36 = []
    let v37 = [v31, ..v36]
    let v38 = [v25, ..v37]
    let v39 = [v30, ..v38]
    let v40 = erlang_term_apply(v33, v35, v39)
    let v41 = erlang_term_coerce(v40)
    let v42 = erlang_term_coerce(v41)
    let v43 = erlang_term_coerce(v27)
    let v44 = "user_token"
    let v45 = erlang_term_coerce(v44)
    let v46 = erlang_term_coerce(v43)
    let v47 = atom.create(v32)
    let v48 = atom.create(v34)
    let v49 = []
    let v50 = [v46, ..v49]
    let v51 = [v25, ..v50]
    let v52 = [v45, ..v51]
    let v53 = erlang_term_apply(v47, v48, v52)
    let v54 = erlang_term_coerce(v53)
    let v55 = erlang_term_coerce(v54)
    let v56 = erlang_term_coerce(v27)
    let v57 = "now"
    let v58 = erlang_term_coerce(v57)
    let v59 = erlang_term_coerce(v56)
    let v60 = atom.create(v32)
    let v61 = atom.create(v34)
    let v62 = []
    let v63 = [v59, ..v62]
    let v64 = [v25, ..v63]
    let v65 = [v58, ..v64]
    let v66 = erlang_term_apply(v60, v61, v65)
    let v67 = erlang_term_coerce(v66)
    let v68 = erlang_term_coerce(v67)
    let v69 = dict.new()
    let v70 = dict.new()
    let v71 = dict.new()
    let _v72 = erlang_term_coerce(v27)
    let _v73 = erlang_term_coerce(v27)
    let v74 = dict.new()
    let v75 = erlang_term_coerce(v27)
    let v76 = "me"
    let v77 = erlang_term_coerce(v76)
    let v78 = erlang_term_coerce(v75)
    let v79 = atom.create(v32)
    let v80 = atom.create(v34)
    let v81 = []
    let v82 = [v78, ..v81]
    let v83 = [v25, ..v82]
    let v84 = [v77, ..v83]
    let v85 = erlang_term_apply(v79, v80, v84)
    let v86 = erlang_term_coerce(v85)
    let v87 = erlang_term_coerce(v27)
    let v88 = "oauth2"
    let v89 = erlang_term_coerce(v88)
    let v90 = erlang_term_coerce(v87)
    let v91 = atom.create(v32)
    let v92 = atom.create(v34)
    let v93 = []
    let v94 = [v90, ..v93]
    let v95 = [v25, ..v94]
    let v96 = [v89, ..v95]
    let v97 = erlang_term_apply(v91, v92, v96)
    let v98 = erlang_term_coerce(v97)
    let v99 = erlang_term_coerce(v27)
    let v100 = "refresh_token"
    let v101 = erlang_term_coerce(v100)
    let v102 = erlang_term_coerce(v99)
    let v103 = atom.create(v32)
    let v104 = atom.create(v34)
    let v105 = []
    let v106 = [v102, ..v105]
    let v107 = [v98, ..v106]
    let v108 = [v101, ..v107]
    let v109 = erlang_term_apply(v103, v104, v108)
    let v110 = erlang_term_coerce(v109)
    let v111 = erlang_term_coerce(v110)
    let v112 = "following_page_size"
    let v113 = erlang_term_coerce(v112)
    let v114 = erlang_term_coerce(100)
    let v115 = atom.create(v32)
    let v116 = atom.create(v34)
    let v117 = []
    let v118 = [v114, ..v117]
    let v119 = [v25, ..v118]
    let v120 = [v113, ..v119]
    let v121 = erlang_term_apply(v115, v116, v120)
    let v122 = erlang_term_coerce(v121)
    let v123 = Uh3Nil
    let v124 = Uh3Cons(v111, v123)
    let v125 = 9001
    let #(v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137) = method451(v26, v42, v55, v69, v70, v122, v71, v68, v25, v124, v86, v74, v125)
    #(v126, v127, v128, v129, v130, v131, v132, v133, v134, v135, v136, v137)
}

pub fn method458(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method458(v0, v4, v2)
            let v6 = v3 |> string.lowercase
            let v7 = v6 |> string.starts_with(v0)
            case v7 {
                True -> Uh3Cons(v3, v5)
                False -> v5
            }
        }
        Uh3Nil -> v2
    }
}

pub fn header_value_457(v0: String, v1: String) -> String {
    let v2 = ":"
    let v3 = v0 <> v2 
    let v4 = v1 == ""
    let v8 =
        case v4 {
            True -> Uh3Nil
            False -> {
                let v6 = "\r\n"
                split_list_2(v6, v1)
            }
        }
    let v9 = Uh3Nil
    let v10 = method458(v3, v8, v9)
    case v10  {
        Uh3Cons(v11, v12) -> {
            let v13 = spiral_string_length(v3)
            let v14 = spiral_string_length(v11)
            let v15 = spiral_wrap_signed(v14 - v13, 32)
            let v16 = spiral_wrap_signed(v13 + v15, 32)
            let v17 = spiral_wrap_signed(v16 - 1, 32)
            let v18 = spiral_string_slice(v11, v13, v17)
            let v19 = spiral_string_length(v18)
            let v20 = 0
            let v21 = method56(v18, v19, v20)
            let v22 = spiral_wrap_signed(v19 - 1, 32)
            let v23 = spiral_string_slice(v18, v21, v22)
            let v24 = spiral_string_length(v23)
            let v25 = method57(v23, v24)
            let v26 = spiral_string_slice(v23, 0, v25)
            v26
        }
        Uh3Nil -> {
            let v27 = ""
            v27
        }
    }
}

pub fn received_456(v0: Dynamic, v1: String) -> String {
    let v2 = "\r\n\r\n"
    let v3 = option.from_result(result.map(string.split_once(v1, v2), pair.first))
    let v4 = closure1(Nil)
    let v5 = v3 |> option.map(v4)
    let v6 = Us2None
    let v7 = v5 |> option.unwrap(v6)
    let v11 =
        case v7  {
            Us2None -> -1
            Us2Some(v8) -> {
                let v9 = bit_array.byte_size(bit_array.from_string(v8))
                v9
            }
        }
    let v12 = v11 >= 0
    let v33 =
        case v12 {
            True -> {
                let v13 = erlang_term_coerce(v1)
                let v14 = "erlang"
                let v15 = atom.create(v14)
                let v16 = "byte_size"
                let v17 = atom.create(v16)
                let v18 = []
                let v19 = [v13, ..v18]
                let v20 = erlang_term_apply(v15, v17, v19)
                let v21 = erlang_term_coerce(v20)
                let v22 = spiral_wrap_signed(v11 + 4, 32)
                let v23 = spiral_wrap_signed(v11 - 1, 32)
                let v24 = spiral_string_slice(v1, 0, v23)
                let v25 = "content-length"
                let v26 = header_value_457(v25, v24)
                let v27 = count_of_text_10(v26)
                let v30 =
                    case v27  {
                        Us3None -> 0
                        Us3Some(v28) -> v28
                    }
                let v31 = spiral_wrap_signed(v22 + v30, 32)
                let v32 = v21 >= v31
                v32
            }
            False -> False
        }
    let v48 =
        case v33 {
            True -> {
                let v34 = "done"
                let v35 = atom.create(v34)
                let v36 = erlang_term_coerce(v35)
                v36
            }
            False -> {
                let v37 = erlang_term_coerce(0)
                let v38 = erlang_term_coerce(10000)
                let v39 = "gen_tcp"
                let v40 = atom.create(v39)
                let v41 = "recv"
                let v42 = atom.create(v41)
                let v43 = []
                let v44 = [v38, ..v43]
                let v45 = [v37, ..v44]
                let v46 = [v0, ..v45]
                let v47 = erlang_term_apply(v40, v42, v46)
                v47
            }
        }
    let v49 = "erlang"
    let v50 = atom.create(v49)
    let v51 = "is_tuple"
    let v52 = atom.create(v51)
    let v53 = []
    let v54 = [v48, ..v53]
    let v55 = erlang_term_apply(v50, v52, v54)
    let v56 = erlang_term_coerce(v55)
    let v69 =
        case v56 {
            True -> {
                let v57 = erlang_term_coerce(1)
                let v58 = atom.create(v49)
                let v59 = "element"
                let v60 = atom.create(v59)
                let v61 = []
                let v62 = [v48, ..v61]
                let v63 = [v57, ..v62]
                let v64 = erlang_term_apply(v58, v60, v63)
                let v65 = "ok"
                let v66 = atom.create(v65)
                let v67 = erlang_term_coerce(v66)
                let v68 = v64 == v67
                v68
            }
            False -> False
        }
    case v69 {
        True -> {
            let v70 = erlang_term_coerce(2)
            let v71 = atom.create(v49)
            let v72 = "element"
            let v73 = atom.create(v72)
            let v74 = []
            let v75 = [v48, ..v74]
            let v76 = [v70, ..v75]
            let v77 = erlang_term_apply(v71, v73, v76)
            let v78 = erlang_term_coerce(v77)
            let v79 = v1 <> v78 
            received_456(v0, v79)
        }
        False -> v1
    }
}
