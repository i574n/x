import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/string
import xsim_frames/types.{type Uh3, type Uh13, type Us94, type Us95, Uh13Cons, Uh13Nil, Uh3Cons, Uh3Nil, Us3None, Us3Some, Us94None, Us94Some, Us95Error, Us95Ok}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, spiral_string_length, spiral_string_slice, spiral_wrap_signed}

pub fn closure138(capt: Nil) -> fn(String) -> Us94 {
    fn (v0) {
        Us94None
    }
}

pub fn closure137(capt: Nil) -> fn(#(String, Int)) -> fn(String) -> Us94 {
    fn (dom) {
        let #(_v0, _v1) = dom
        closure138(Nil)
    }
}

pub fn closure141(capt: #(String, Int, String)) -> fn(String) -> Us95 {
    fn (v3) {
        let #(v0, v1, v2) = capt
        let v4 = v2 == "spi"
        case v4 {
            True -> Us95Ok(v3, v1)
            False -> {
                let v6 = v2 == "cells"
                case v6 {
                    True -> {
                        let v7 = count_of_text_10(v3)
                        case v7  {
                            Us3None -> {
                                let v10 = "--cells takes a whole number, got '"
                                let v11 = v10 <> v3 
                                let v12 = "'"
                                let v13 = v11 <> v12 
                                Us95Error(v13)
                            }
                            Us3Some(v8) -> Us95Ok(v0, v8)
                        }
                    }
                    False -> {
                        let v17 = "unknown option --"
                        let v18 = v17 <> v2 
                        Us95Error(v18)
                    }
                }
            }
        }
    }
}

pub fn closure140(capt: #(String, Int)) -> fn(String) -> fn(String) -> Us95 {
    fn (v2) {
        let #(v0, v1) = capt
        closure141(#(v0, v1, v2))
    }
}

pub fn closure139(capt: Nil) -> fn(#(String, Int)) -> fn(String) -> fn(String) -> Us95 {
    fn (dom) {
        let #(v0, v1) = dom
        closure140(#(v0, v1))
    }
}

pub fn valued_then_439(v0: fn(#(String, Int)) -> fn(String) -> Us94, v1: fn(#(String, Int)) -> fn(String) -> fn(String) -> Us95, v2: String, v3: Int, v4: String, v5: Uh3) -> Us95 {
    case v5  {
        Uh3Cons(v6, v7) -> {
            let v8 = v1(#(v2, v3))
            let v9 = "--"
            let v10 = v4 |> string.starts_with(v9)
            let v17 =
                case v10 {
                    True -> {
                        let v11 = spiral_string_length(v4)
                        let v12 = spiral_wrap_signed(v11 - 2, 32)
                        let v13 = spiral_wrap_signed(2 + v12, 32)
                        let v14 = spiral_wrap_signed(v13 - 1, 32)
                        let v15 = spiral_string_slice(v4, 2, v14)
                        v15
                    }
                    False -> {
                        let v16 = ""
                        v16
                    }
                }
            let v18 = v8(v17)
            let v19 = v18(v6)
            continued_440(v0, v1, v19, v7)
        }
        Uh3Nil -> {
            let v21 = "--"
            let v22 = v4 |> string.starts_with(v21)
            let v29 =
                case v22 {
                    True -> {
                        let v23 = spiral_string_length(v4)
                        let v24 = spiral_wrap_signed(v23 - 2, 32)
                        let v25 = spiral_wrap_signed(2 + v24, 32)
                        let v26 = spiral_wrap_signed(v25 - 1, 32)
                        let v27 = spiral_string_slice(v4, 2, v26)
                        v27
                    }
                    False -> {
                        let v28 = ""
                        v28
                    }
                }
            let v30 = v21 <> v29 
            let v31 = " needs a value"
            let v32 = v30 <> v31 
            Us95Error(v32)
        }
    }
}

pub fn arg_parsed_438(v0: fn(#(String, Int)) -> fn(String) -> Us94, v1: fn(#(String, Int)) -> fn(String) -> fn(String) -> Us95, v2: String, v3: Int, v4: String, v5: Uh3) -> Us95 {
    let v6 = v0(#(v2, v3))
    let v7 = "--"
    let v8 = v4 |> string.starts_with(v7)
    let v15 =
        case v8 {
            True -> {
                let v9 = spiral_string_length(v4)
                let v10 = spiral_wrap_signed(v9 - 2, 32)
                let v11 = spiral_wrap_signed(2 + v10, 32)
                let v12 = spiral_wrap_signed(v11 - 1, 32)
                let v13 = spiral_string_slice(v4, 2, v12)
                v13
            }
            False -> {
                let v14 = ""
                v14
            }
        }
    let v16 = v6(v15)
    case v16  {
        Us94None -> valued_then_439(v0, v1, v2, v3, v4, v5)
        Us94Some(v17, v18) -> flags_parsed_437(v0, v1, v17, v18, v5)
    }
}

pub fn flags_parsed_437(v0: fn(#(String, Int)) -> fn(String) -> Us94, v1: fn(#(String, Int)) -> fn(String) -> fn(String) -> Us95, v2: String, v3: Int, v4: Uh3) -> Us95 {
    case v4  {
        Uh3Cons(v6, v7) -> {
            let v8 = "--"
            let v9 = v6 |> string.starts_with(v8)
            let v16 =
                case v9 {
                    True -> {
                        let v10 = spiral_string_length(v6)
                        let v11 = spiral_wrap_signed(v10 - 2, 32)
                        let v12 = spiral_wrap_signed(2 + v11, 32)
                        let v13 = spiral_wrap_signed(v12 - 1, 32)
                        let v14 = spiral_string_slice(v6, 2, v13)
                        v14
                    }
                    False -> {
                        let v15 = ""
                        v15
                    }
                }
            let v17 = v16 == ""
            case v17 {
                True -> {
                    let v18 = "unexpected argument '"
                    let v19 = v18 <> v6 
                    let v20 = "'"
                    let v21 = v19 <> v20 
                    Us95Error(v21)
                }
                False -> arg_parsed_438(v0, v1, v2, v3, v6, v7)
            }
        }
        Uh3Nil -> Us95Ok(v2, v3)
    }
}

pub fn continued_440(v0: fn(#(String, Int)) -> fn(String) -> Us94, v1: fn(#(String, Int)) -> fn(String) -> fn(String) -> Us95, v2: Us95, v3: Uh3) -> Us95 {
    case v2  {
        Us95Error(v7) -> Us95Error(v7)
        Us95Ok(v4, v5) -> flags_parsed_437(v0, v1, v4, v5, v3)
    }
}

pub fn method441(v0: Dynamic, v1: Dynamic, v2: Uh13, v3: Uh13) -> Uh13 {
    case v2  {
        Uh13Cons(v4, v5) -> {
            let v6 = method441(v0, v1, v5, v3)
            let v7 = []
            let v8 = erlang_term_coerce(v7)
            let v9 = "maps"
            let v10 = atom.create(v9)
            let v11 = "from_list"
            let v12 = atom.create(v11)
            let v13 = []
            let v14 = [v8, ..v13]
            let v15 = erlang_term_apply(v10, v12, v14)
            let v16 = "outputs"
            let v17 = atom.create(v16)
            let v18 = erlang_term_coerce(v17)
            let v19 = erlang_term_coerce(v18)
            let v20 = erlang_term_coerce(v15)
            let v21 = atom.create(v9)
            let v22 = "get"
            let v23 = atom.create(v22)
            let v24 = []
            let v25 = [v20, ..v24]
            let v26 = [v0, ..v25]
            let v27 = [v19, ..v26]
            let v28 = erlang_term_apply(v21, v23, v27)
            let v29 = erlang_term_coerce(v28)
            let v30 = "nil"
            let v31 = atom.create(v30)
            let v32 = erlang_term_coerce(v31)
            let v33 = erlang_term_coerce(v4)
            let v34 = erlang_term_coerce(v32)
            let v35 = atom.create(v9)
            let v36 = atom.create(v22)
            let v37 = []
            let v38 = [v34, ..v37]
            let v39 = [v29, ..v38]
            let v40 = [v33, ..v39]
            let v41 = erlang_term_apply(v35, v36, v40)
            let v42 = erlang_term_coerce(v41)
            let v43 = []
            let v44 = erlang_term_coerce(v43)
            let v45 = atom.create(v9)
            let v46 = atom.create(v11)
            let v47 = []
            let v48 = [v44, ..v47]
            let v49 = erlang_term_apply(v45, v46, v48)
            let v50 = atom.create(v16)
            let v51 = erlang_term_coerce(v50)
            let v52 = erlang_term_coerce(v51)
            let v53 = erlang_term_coerce(v49)
            let v54 = atom.create(v9)
            let v55 = atom.create(v22)
            let v56 = []
            let v57 = [v53, ..v56]
            let v58 = [v1, ..v57]
            let v59 = [v52, ..v58]
            let v60 = erlang_term_apply(v54, v55, v59)
            let v61 = erlang_term_coerce(v60)
            let v62 = atom.create(v30)
            let v63 = erlang_term_coerce(v62)
            let v64 = erlang_term_coerce(v4)
            let v65 = erlang_term_coerce(v63)
            let v66 = atom.create(v9)
            let v67 = atom.create(v22)
            let v68 = []
            let v69 = [v65, ..v68]
            let v70 = [v61, ..v69]
            let v71 = [v64, ..v70]
            let v72 = erlang_term_apply(v66, v67, v71)
            let v73 = erlang_term_coerce(v72)
            let v74 = v42 == v73
            let v75 = v74 == False
            case v75 {
                True -> Uh13Cons(v4, v6)
                False -> v6
            }
        }
        Uh13Nil -> v3
    }
}

pub fn method442(v0: Dynamic, v1: Dynamic, v2: Uh13, v3: Uh3) -> Uh3 {
    case v2  {
        Uh13Cons(v4, v5) -> {
            let v6 = method442(v0, v1, v5, v3)
            let v7 = int.to_string(v4)
            let v8 = "XDIFF cell "
            let v9 = v8 <> v7 
            let v10 = "\n  a="
            let v11 = v9 <> v10 
            let v12 = []
            let v13 = erlang_term_coerce(v12)
            let v14 = "maps"
            let v15 = atom.create(v14)
            let v16 = "from_list"
            let v17 = atom.create(v16)
            let v18 = []
            let v19 = [v13, ..v18]
            let v20 = erlang_term_apply(v15, v17, v19)
            let v21 = "outputs"
            let v22 = atom.create(v21)
            let v23 = erlang_term_coerce(v22)
            let v24 = erlang_term_coerce(v23)
            let v25 = erlang_term_coerce(v20)
            let v26 = atom.create(v14)
            let v27 = "get"
            let v28 = atom.create(v27)
            let v29 = []
            let v30 = [v25, ..v29]
            let v31 = [v0, ..v30]
            let v32 = [v24, ..v31]
            let v33 = erlang_term_apply(v26, v28, v32)
            let v34 = erlang_term_coerce(v33)
            let v35 = "nil"
            let v36 = atom.create(v35)
            let v37 = erlang_term_coerce(v36)
            let v38 = erlang_term_coerce(v4)
            let v39 = erlang_term_coerce(v37)
            let v40 = atom.create(v14)
            let v41 = atom.create(v27)
            let v42 = []
            let v43 = [v39, ..v42]
            let v44 = [v34, ..v43]
            let v45 = [v38, ..v44]
            let v46 = erlang_term_apply(v40, v41, v45)
            let v47 = erlang_term_coerce(v46)
            let v48 = erlang_term_coerce(600)
            let v49 = "printable_limit"
            let v50 = atom.create(v49)
            let v51 = erlang_term_coerce(v50)
            let v52 = []
            let v53 = [v48, ..v52]
            let v54 = [v51, ..v53]
            let v55 = erlang_term_tuple(v54)
            let v56 = []
            let v57 = [v55, ..v56]
            let v58 = erlang_term_coerce(v57)
            let v59 = "Elixir.Kernel"
            let v60 = atom.create(v59)
            let v61 = "inspect"
            let v62 = atom.create(v61)
            let v63 = []
            let v64 = [v58, ..v63]
            let v65 = [v47, ..v64]
            let v66 = erlang_term_apply(v60, v62, v65)
            let v67 = erlang_term_coerce(v66)
            let v68 = v11 <> v67 
            let v69 = "\n  b="
            let v70 = v68 <> v69 
            let v71 = []
            let v72 = erlang_term_coerce(v71)
            let v73 = atom.create(v14)
            let v74 = atom.create(v16)
            let v75 = []
            let v76 = [v72, ..v75]
            let v77 = erlang_term_apply(v73, v74, v76)
            let v78 = atom.create(v21)
            let v79 = erlang_term_coerce(v78)
            let v80 = erlang_term_coerce(v79)
            let v81 = erlang_term_coerce(v77)
            let v82 = atom.create(v14)
            let v83 = atom.create(v27)
            let v84 = []
            let v85 = [v81, ..v84]
            let v86 = [v1, ..v85]
            let v87 = [v80, ..v86]
            let v88 = erlang_term_apply(v82, v83, v87)
            let v89 = erlang_term_coerce(v88)
            let v90 = atom.create(v35)
            let v91 = erlang_term_coerce(v90)
            let v92 = erlang_term_coerce(v4)
            let v93 = erlang_term_coerce(v91)
            let v94 = atom.create(v14)
            let v95 = atom.create(v27)
            let v96 = []
            let v97 = [v93, ..v96]
            let v98 = [v89, ..v97]
            let v99 = [v92, ..v98]
            let v100 = erlang_term_apply(v94, v95, v99)
            let v101 = erlang_term_coerce(v100)
            let v102 = erlang_term_coerce(600)
            let v103 = atom.create(v49)
            let v104 = erlang_term_coerce(v103)
            let v105 = []
            let v106 = [v102, ..v105]
            let v107 = [v104, ..v106]
            let v108 = erlang_term_tuple(v107)
            let v109 = []
            let v110 = [v108, ..v109]
            let v111 = erlang_term_coerce(v110)
            let v112 = atom.create(v59)
            let v113 = atom.create(v61)
            let v114 = []
            let v115 = [v111, ..v114]
            let v116 = [v101, ..v115]
            let v117 = erlang_term_apply(v112, v113, v116)
            let v118 = erlang_term_coerce(v117)
            let v119 = v70 <> v118 
            Uh3Cons(v119, v6)
        }
        Uh13Nil -> v3
    }
}
