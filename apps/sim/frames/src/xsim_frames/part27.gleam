import gleam/bit_array
import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh29, type Uh36, type Uh37, type Uh38, Uh29Cons, Uh29Nil, Uh37Cons, Uh37Nil, Uh38Cons, Uh38Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some, Us3None, Us3Some, Us56Error, Us56Ok, Us76Error, Us76Ok}
import xsim_frames/part1.{closure1, count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_fs_read_file, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part10.{method259, method260}
import xsim_frames/part13.{method301}
import xsim_frames/part17.{method367, method368}
import xsim_frames/part2.{delimited_21}
import xsim_frames/part26.{method443, method444}
import xsim_frames/part3.{method56, method57}

pub fn method445(v0: Uh29, v1: Uh3) -> Uh3 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method445(v3, v1)
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

pub fn signed_params_442(v0: Uh36) -> String {
    let v1 = Uh29Nil
    let v2 = method443(v0, v1)
    let v3 = []
    let v4 = method301(v2, v3)
    let v5 = erlang_term_coerce(v4)
    let v6 = "lists"
    let v7 = atom.create(v6)
    let v8 = "sort"
    let v9 = atom.create(v8)
    let v10 = []
    let v11 = [v5, ..v10]
    let v12 = erlang_term_apply(v7, v9, v11)
    let v13 = "erlang"
    let v14 = atom.create(v13)
    let v15 = "length"
    let v16 = atom.create(v15)
    let v17 = []
    let v18 = [v12, ..v17]
    let v19 = erlang_term_apply(v14, v16, v18)
    let v20 = erlang_term_coerce(v19)
    let v21 = 0
    let v22 = method444(v20, v12, v21)
    let v23 = Uh3Nil
    let v24 = method445(v22, v23)
    let v25 = "&"
    delimited_21(v25, v24)
}

pub fn oauth1_signature_441(v0: String, v1: String, v2: Uh36, v3: String, v4: String) -> String {
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
    let v28 = signed_params_442(v2)
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

pub fn method449(v0: String, v1: Uh29, v2: Uh37) -> Uh37 {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = method449(v0, v4, v2)
            let v6 = erlang_term_coerce(v0)
            let v7 = "filename"
            let v8 = atom.create(v7)
            let v9 = "dirname"
            let v10 = atom.create(v9)
            let v11 = []
            let v12 = [v6, ..v11]
            let v13 = erlang_term_apply(v8, v10, v12)
            let v14 = erlang_term_coerce(v13)
            let v15 = "/"
            let v16 = v14 <> v15 
            let v17 = erlang_term_coerce(v3)
            let v18 = v16 <> v17 
            let v19 = spiral_fs_read_file(v18)
            let v20 = method367()
            let v21 = method368()
            let v22 = case v19 { Ok(x) -> v20(x) Error(x) -> v21(x) }
            let v35 =
                case v22  {
                    Us76Error(v32) -> panic as "file_system.read_all_text: file:read_file failed"
                    Us76Ok(v23) -> {
                        let v24 = bit_array.to_string(v23)
                        let v25 = method259()
                        let v26 = method260()
                        let v27 = case v24 { Ok(x) -> v25(x) Error(x) -> v26(x) }
                        case v27  {
                            Us56Error -> panic as "file_system.read_all_text: the file is not UTF-8"
                            Us56Ok(v28) -> v28
                        }
                    }
                }
            let v36 = erlang_term_coerce(v35)
            let v37 = "json"
            let v38 = atom.create(v37)
            let v39 = "decode"
            let v40 = atom.create(v39)
            let v41 = []
            let v42 = [v36, ..v41]
            let v43 = erlang_term_apply(v38, v40, v42)
            let v44 = "users"
            let v45 = erlang_term_coerce(v44)
            let v46 = []
            let v47 = erlang_term_coerce(v46)
            let v48 = "maps"
            let v49 = atom.create(v48)
            let v50 = "get"
            let v51 = atom.create(v50)
            let v52 = []
            let v53 = [v47, ..v52]
            let v54 = [v43, ..v53]
            let v55 = [v45, ..v54]
            let v56 = erlang_term_apply(v49, v51, v55)
            let v57 = "erlang"
            let v58 = atom.create(v57)
            let v59 = "length"
            let v60 = atom.create(v59)
            let v61 = []
            let v62 = [v56, ..v61]
            let v63 = erlang_term_apply(v58, v60, v62)
            let v64 = erlang_term_coerce(v63)
            let v65 = 0
            let v66 = method444(v64, v56, v65)
            Uh37Cons(v66, v5)
        }
        Uh29Nil -> v2
    }
}

pub fn method451(v0: Uh29, v1: Uh29) -> Uh29 {
    case v0  {
        Uh29Cons(v2, v3) -> {
            let v4 = method451(v3, v1)
            Uh29Cons(v2, v4)
        }
        Uh29Nil -> v1
    }
}

pub fn method450(v0: Uh37, v1: Uh29) -> Uh29 {
    case v0  {
        Uh37Cons(v2, v3) -> {
            let v4 = method450(v3, v1)
            method451(v2, v4)
        }
        Uh37Nil -> v1
    }
}

pub fn included_users_448(v0: String, v1: Dynamic) -> Uh29 {
    let v2 = "include"
    let v3 = erlang_term_coerce(v2)
    let v4 = []
    let v5 = erlang_term_coerce(v4)
    let v6 = "maps"
    let v7 = atom.create(v6)
    let v8 = "get"
    let v9 = atom.create(v8)
    let v10 = []
    let v11 = [v5, ..v10]
    let v12 = [v1, ..v11]
    let v13 = [v3, ..v12]
    let v14 = erlang_term_apply(v7, v9, v13)
    let v15 = "erlang"
    let v16 = atom.create(v15)
    let v17 = "length"
    let v18 = atom.create(v17)
    let v19 = []
    let v20 = [v14, ..v19]
    let v21 = erlang_term_apply(v16, v18, v20)
    let v22 = erlang_term_coerce(v21)
    let v23 = 0
    let v24 = method444(v22, v14, v23)
    let v25 = Uh37Nil
    let v26 = method449(v0, v24, v25)
    let v27 = "users"
    let v28 = erlang_term_coerce(v27)
    let v29 = []
    let v30 = erlang_term_coerce(v29)
    let v31 = atom.create(v6)
    let v32 = atom.create(v8)
    let v33 = []
    let v34 = [v30, ..v33]
    let v35 = [v1, ..v34]
    let v36 = [v28, ..v35]
    let v37 = erlang_term_apply(v31, v32, v36)
    let v38 = atom.create(v15)
    let v39 = atom.create(v17)
    let v40 = []
    let v41 = [v37, ..v40]
    let v42 = erlang_term_apply(v38, v39, v41)
    let v43 = erlang_term_coerce(v42)
    let v44 = 0
    let v45 = method444(v43, v37, v44)
    let v46 = Uh29Nil
    let v47 = method450(v26, v46)
    method451(v45, v47)
}

pub fn method454(v0: Dynamic, v1: Uh29, v2: dict.Dict(String, Dynamic)) -> dict.Dict(String, Dynamic) {
    case v1  {
        Uh29Cons(v3, v4) -> {
            let v5 = "id"
            let v6 = erlang_term_coerce(v5)
            let v7 = ""
            let v8 = erlang_term_coerce(v7)
            let v9 = "maps"
            let v10 = atom.create(v9)
            let v11 = "get"
            let v12 = atom.create(v11)
            let v13 = []
            let v14 = [v8, ..v13]
            let v15 = [v3, ..v14]
            let v16 = [v6, ..v15]
            let v17 = erlang_term_apply(v10, v12, v16)
            let v18 = "erlang"
            let v19 = atom.create(v18)
            let v20 = "is_binary"
            let v21 = atom.create(v20)
            let v22 = []
            let v23 = [v17, ..v22]
            let v24 = erlang_term_apply(v19, v21, v23)
            let v25 = erlang_term_coerce(v24)
            let v34 =
                case v25 {
                    True -> {
                        let v26 = erlang_term_coerce(v17)
                        v26
                    }
                    False -> {
                        let v27 = atom.create(v18)
                        let v28 = "integer_to_binary"
                        let v29 = atom.create(v28)
                        let v30 = []
                        let v31 = [v17, ..v30]
                        let v32 = erlang_term_apply(v27, v29, v31)
                        let v33 = erlang_term_coerce(v32)
                        v33
                    }
                }
            let v35 = "author_id"
            let v36 = erlang_term_coerce(v35)
            let v37 = erlang_term_coerce(v5)
            let v38 = erlang_term_coerce(v7)
            let v39 = atom.create(v9)
            let v40 = atom.create(v11)
            let v41 = []
            let v42 = [v38, ..v41]
            let v43 = [v0, ..v42]
            let v44 = [v37, ..v43]
            let v45 = erlang_term_apply(v39, v40, v44)
            let v46 = atom.create(v9)
            let v47 = "put"
            let v48 = atom.create(v47)
            let v49 = []
            let v50 = [v3, ..v49]
            let v51 = [v45, ..v50]
            let v52 = [v36, ..v51]
            let v53 = erlang_term_apply(v46, v48, v52)
            let v54 = dict.insert(v2, v34, v53)
            method454(v0, v4, v54)
        }
        Uh29Nil -> v2
    }
}

pub fn with_posts_453(v0: Dynamic, v1: dict.Dict(String, Dynamic)) -> dict.Dict(String, Dynamic) {
    let v2 = "posts"
    let v3 = erlang_term_coerce(v2)
    let v4 = []
    let v5 = erlang_term_coerce(v4)
    let v6 = "maps"
    let v7 = atom.create(v6)
    let v8 = "get"
    let v9 = atom.create(v8)
    let v10 = []
    let v11 = [v5, ..v10]
    let v12 = [v0, ..v11]
    let v13 = [v3, ..v12]
    let v14 = erlang_term_apply(v7, v9, v13)
    let v15 = "erlang"
    let v16 = atom.create(v15)
    let v17 = "length"
    let v18 = atom.create(v17)
    let v19 = []
    let v20 = [v14, ..v19]
    let v21 = erlang_term_apply(v16, v18, v20)
    let v22 = erlang_term_coerce(v21)
    let v23 = 0
    let v24 = method444(v22, v14, v23)
    method454(v0, v24, v1)
}

pub fn method452(v0: Uh29, v1: String, v2: String, v3: dict.Dict(String, Dynamic), v4: dict.Dict(String, Dynamic), v5: Int, v6: dict.Dict(String, Dynamic), v7: String, v8: Dynamic, v9: Uh3, v10: Dynamic, v11: dict.Dict(String, Nil), v12: Int) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let #(v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95) =
        case v0  {
            Uh29Cons(v13, v14) -> {
                let v15 = "username"
                let v16 = erlang_term_coerce(v15)
                let v17 = ""
                let v18 = erlang_term_coerce(v17)
                let v19 = "maps"
                let v20 = atom.create(v19)
                let v21 = "get"
                let v22 = atom.create(v21)
                let v23 = []
                let v24 = [v18, ..v23]
                let v25 = [v13, ..v24]
                let v26 = [v16, ..v25]
                let v27 = erlang_term_apply(v20, v22, v26)
                let v28 = erlang_term_coerce(v27)
                let v29 = v28 |> string.lowercase
                let v30 = dict.insert(v3, v29, v13)
                let v31 = "id"
                let v32 = erlang_term_coerce(v31)
                let v33 = erlang_term_coerce(v17)
                let v34 = atom.create(v19)
                let v35 = atom.create(v21)
                let v36 = []
                let v37 = [v33, ..v36]
                let v38 = [v13, ..v37]
                let v39 = [v32, ..v38]
                let v40 = erlang_term_apply(v34, v35, v39)
                let v41 = "erlang"
                let v42 = atom.create(v41)
                let v43 = "is_binary"
                let v44 = atom.create(v43)
                let v45 = []
                let v46 = [v40, ..v45]
                let v47 = erlang_term_apply(v42, v44, v46)
                let v48 = erlang_term_coerce(v47)
                let v57 =
                    case v48 {
                        True -> {
                            let v49 = erlang_term_coerce(v40)
                            v49
                        }
                        False -> {
                            let v50 = atom.create(v41)
                            let v51 = "integer_to_binary"
                            let v52 = atom.create(v51)
                            let v53 = []
                            let v54 = [v40, ..v53]
                            let v55 = erlang_term_apply(v50, v52, v54)
                            let v56 = erlang_term_coerce(v55)
                            v56
                        }
                    }
                let v58 = dict.insert(v4, v57, v13)
                let v59 = with_posts_453(v13, v6)
                method452(v14, v1, v2, v30, v58, v5, v59, v7, v8, v9, v10, v11, v12)
            }
            _ -> {
                let #(v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83) =
                    case v0  {
                        Uh29Nil -> #(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                        _ -> panic as "spiral: union case ruled out by partial evaluation"
                    }
                #(v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83)
            }
        }
    #(v84, v85, v86, v87, v88, v89, v90, v91, v92, v93, v94, v95)
}

pub fn world_of_447(v0: String) -> #(String, String, dict.Dict(String, Dynamic), dict.Dict(String, Dynamic), Int, dict.Dict(String, Dynamic), String, Dynamic, Uh3, Dynamic, dict.Dict(String, Nil), Int) {
    let v1 = spiral_fs_read_file(v0)
    let v2 = method367()
    let v3 = method368()
    let v4 = case v1 { Ok(x) -> v2(x) Error(x) -> v3(x) }
    let v17 =
        case v4  {
            Us76Error(v14) -> panic as "file_system.read_all_text: file:read_file failed"
            Us76Ok(v5) -> {
                let v6 = bit_array.to_string(v5)
                let v7 = method259()
                let v8 = method260()
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
    let v26 = included_users_448(v0, v25)
    let v27 = "token"
    let v28 = erlang_term_coerce(v27)
    let v29 = ""
    let v30 = erlang_term_coerce(v29)
    let v31 = "maps"
    let v32 = atom.create(v31)
    let v33 = "get"
    let v34 = atom.create(v33)
    let v35 = []
    let v36 = [v30, ..v35]
    let v37 = [v25, ..v36]
    let v38 = [v28, ..v37]
    let v39 = erlang_term_apply(v32, v34, v38)
    let v40 = erlang_term_coerce(v39)
    let v41 = "user_token"
    let v42 = erlang_term_coerce(v41)
    let v43 = erlang_term_coerce(v29)
    let v44 = atom.create(v31)
    let v45 = atom.create(v33)
    let v46 = []
    let v47 = [v43, ..v46]
    let v48 = [v25, ..v47]
    let v49 = [v42, ..v48]
    let v50 = erlang_term_apply(v44, v45, v49)
    let v51 = erlang_term_coerce(v50)
    let v52 = "now"
    let v53 = erlang_term_coerce(v52)
    let v54 = erlang_term_coerce(v29)
    let v55 = atom.create(v31)
    let v56 = atom.create(v33)
    let v57 = []
    let v58 = [v54, ..v57]
    let v59 = [v25, ..v58]
    let v60 = [v53, ..v59]
    let v61 = erlang_term_apply(v55, v56, v60)
    let v62 = erlang_term_coerce(v61)
    let v63 = dict.new()
    let v64 = dict.new()
    let v65 = dict.new()
    let _v66 = erlang_term_coerce(v29)
    let _v67 = erlang_term_coerce(v29)
    let v68 = dict.new()
    let v69 = "me"
    let v70 = erlang_term_coerce(v69)
    let v71 = erlang_term_coerce(v29)
    let v72 = atom.create(v31)
    let v73 = atom.create(v33)
    let v74 = []
    let v75 = [v71, ..v74]
    let v76 = [v25, ..v75]
    let v77 = [v70, ..v76]
    let v78 = erlang_term_apply(v72, v73, v77)
    let v79 = "oauth2"
    let v80 = erlang_term_coerce(v79)
    let v81 = erlang_term_coerce(v29)
    let v82 = atom.create(v31)
    let v83 = atom.create(v33)
    let v84 = []
    let v85 = [v81, ..v84]
    let v86 = [v25, ..v85]
    let v87 = [v80, ..v86]
    let v88 = erlang_term_apply(v82, v83, v87)
    let v89 = "refresh_token"
    let v90 = erlang_term_coerce(v89)
    let v91 = erlang_term_coerce(v29)
    let v92 = atom.create(v31)
    let v93 = atom.create(v33)
    let v94 = []
    let v95 = [v91, ..v94]
    let v96 = [v88, ..v95]
    let v97 = [v90, ..v96]
    let v98 = erlang_term_apply(v92, v93, v97)
    let v99 = erlang_term_coerce(v98)
    let v100 = "following_page_size"
    let v101 = erlang_term_coerce(v100)
    let v102 = erlang_term_coerce(100)
    let v103 = atom.create(v31)
    let v104 = atom.create(v33)
    let v105 = []
    let v106 = [v102, ..v105]
    let v107 = [v25, ..v106]
    let v108 = [v101, ..v107]
    let v109 = erlang_term_apply(v103, v104, v108)
    let v110 = erlang_term_coerce(v109)
    let v111 = Uh3Nil
    let v112 = Uh3Cons(v99, v111)
    let v113 = 9001
    let #(v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125) = method452(v26, v40, v51, v63, v64, v110, v65, v62, v25, v112, v78, v68, v113)
    #(v114, v115, v116, v117, v118, v119, v120, v121, v122, v123, v124, v125)
}

pub fn method459(v0: String, v1: Uh3, v2: Uh3) -> Uh3 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = method459(v0, v4, v2)
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

pub fn header_value_458(v0: String, v1: String) -> String {
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
    let v10 = method459(v3, v8, v9)
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

pub fn received_457(v0: Dynamic, v1: String) -> String {
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
                let v26 = header_value_458(v25, v24)
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
            received_457(v0, v79)
        }
        False -> v1
    }
}

pub fn request_of_461(v0: String) -> #(String, String, String, String, String) {
    let v1 = "\r\n\r\n"
    let v2 = option.from_result(result.map(string.split_once(v0, v1), pair.first))
    let v3 = closure1(Nil)
    let v4 = v2 |> option.map(v3)
    let v5 = Us2None
    let v6 = v4 |> option.unwrap(v5)
    let v10 =
        case v6  {
            Us2None -> -1
            Us2Some(v7) -> {
                let v8 = bit_array.byte_size(bit_array.from_string(v7))
                v8
            }
        }
    let v11 = spiral_wrap_signed(v10 - 1, 32)
    let v12 = spiral_string_slice(v0, 0, v11)
    let v13 = "\r\n"
    let v14 = option.from_result(result.map(string.split_once(v12, v13), pair.first))
    let v15 = v14 |> option.map(v3)
    let v16 = Us2None
    let v17 = v15 |> option.unwrap(v16)
    let v21 =
        case v17  {
            Us2None -> -1
            Us2Some(v18) -> {
                let v19 = bit_array.byte_size(bit_array.from_string(v18))
                v19
            }
        }
    let v22 = spiral_wrap_signed(v21 - 1, 32)
    let v23 = spiral_string_slice(v12, 0, v22)
    let v24 = v23 == ""
    let v28 =
        case v24 {
            True -> Uh3Nil
            False -> {
                let v26 = " "
                split_list_2(v26, v23)
            }
        }
    let v36 =
        case v28  {
            Uh3Cons(v29, v30) -> {
                case v30  {
                    Uh3Cons(v31, v32) -> v31
                    _ -> {
                        let v33 = "/"
                        v33
                    }
                }
            }
            _ -> {
                let v35 = "/"
                v35
            }
        }
    let v37 = "#"
    let v38 = option.from_result(result.map(string.split_once(v36, v37), pair.first))
    let v39 = v38 |> option.map(v3)
    let v40 = Us2None
    let v41 = v39 |> option.unwrap(v40)
    let v45 =
        case v41  {
            Us2None -> -1
            Us2Some(v42) -> {
                let v43 = bit_array.byte_size(bit_array.from_string(v42))
                v43
            }
        }
    let v46 = spiral_wrap_signed(v45 + 1, 32)
    let v47 = v45 < 0
    let #(v56, _v57) =
        case v47 {
            True -> {
                let v48 = ""
                #(v36, v48)
            }
            False -> {
                let v49 = spiral_wrap_signed(v45 - 1, 32)
                let v50 = spiral_string_slice(v36, 0, v49)
                let v51 = spiral_string_length(v36)
                let v52 = spiral_wrap_signed(v51 - v46, 32)
                let v53 = spiral_wrap_signed(v46 + v52, 32)
                let v54 = spiral_wrap_signed(v53 - 1, 32)
                let v55 = spiral_string_slice(v36, v46, v54)
                #(v50, v55)
            }
        }
    let v58 = "?"
    let v59 = option.from_result(result.map(string.split_once(v56, v58), pair.first))
    let v60 = v59 |> option.map(v3)
    let v61 = Us2None
    let v62 = v60 |> option.unwrap(v61)
    let v66 =
        case v62  {
            Us2None -> -1
            Us2Some(v63) -> {
                let v64 = bit_array.byte_size(bit_array.from_string(v63))
                v64
            }
        }
    let v67 = spiral_wrap_signed(v66 + 1, 32)
    let v68 = v66 < 0
    let #(v77, v78) =
        case v68 {
            True -> {
                let v69 = ""
                #(v56, v69)
            }
            False -> {
                let v70 = spiral_wrap_signed(v66 - 1, 32)
                let v71 = spiral_string_slice(v56, 0, v70)
                let v72 = spiral_string_length(v56)
                let v73 = spiral_wrap_signed(v72 - v67, 32)
                let v74 = spiral_wrap_signed(v67 + v73, 32)
                let v75 = spiral_wrap_signed(v74 - 1, 32)
                let v76 = spiral_string_slice(v56, v67, v75)
                #(v71, v76)
            }
        }
    let v79 = v12 == ""
    let v83 =
        case v79 {
            True -> Uh3Nil
            False -> {
                let v81 = " "
                split_list_2(v81, v12)
            }
        }
    let v88 =
        case v83  {
            Uh3Cons(v84, v85) -> v84
            Uh3Nil -> {
                let v86 = ""
                v86
            }
        }
    #(v88, v77, v78, v12, v0)
}

pub fn method466(v0: Uh38, v1: Uh38) -> Uh38 {
    case v0  {
        Uh38Cons(v2, v3, v4) -> {
            let v5 = method466(v4, v1)
            Uh38Cons(v2, v3, v5)
        }
        Uh38Nil -> v1
    }
}

pub fn method467(v0: Uh38, v1: Uh29) -> Uh29 {
    case v0  {
        Uh38Cons(v2, v3, v4) -> {
            let v5 = method467(v4, v1)
            let v6 = atom.create(v2)
            let v7 = erlang_term_coerce(v6)
            let v8 = []
            let v9 = [v3, ..v8]
            let v10 = [v7, ..v9]
            let v11 = erlang_term_tuple(v10)
            Uh29Cons(v11, v5)
        }
        Uh38Nil -> v1
    }
}
