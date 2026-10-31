import gleam/bit_array
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Us0, type Uh5, type Us3, Uh3Cons, Uh3Nil, Uh5Cons, Uh5Nil, Us0None, Us0Some, Us3None, Us3Some}

@external(erlang, "string", "find")
pub fn spiral_sm_find_trailing(text: String, search: String, direction: atom.Atom) -> Dynamic


@external(erlang, "gleam_stdlib", "identity")
pub fn spiral_sm_coerce(value: a) -> b

@ external(erlang, "unicode", "characters_to_binary")
pub fn unicode_erlang_characters_to_binary(chars: List(Int)) -> String

pub fn spiral_string_length(text: String) -> Int {
  bit_array.byte_size(bit_array.from_string(text))
}


pub fn spiral_wrap_signed(value: Int, bits: Int) -> Int {
  let half = int.bitwise_shift_left(1, bits - 1)
  int.bitwise_and(value + half, int.bitwise_shift_left(1, bits) - 1) - half
}


pub fn spiral_wrap_unsigned(value: Int, bits: Int) -> Int {
  int.bitwise_and(value, int.bitwise_shift_left(1, bits) - 1)
}



pub fn spiral_string_index(text: String, index: Int) -> String {
  case bit_array.slice(bit_array.from_string(text), index, 1) {
    Ok(<<byte>>) ->
      case string.utf_codepoint(byte) {
        Ok(codepoint) -> string.from_utf_codepoints([codepoint])
        Error(_) -> panic as "spiral string index: not a single-byte character"
      }
    _ -> panic as "spiral string index: out of range"
  }
}


@external(erlang, "gleam_stdlib", "identity")
pub fn spiral_string_of_checked_bytes(bytes: BitArray) -> String {
  case bit_array.to_string(bytes) {
    Ok(text) -> text
    Error(_) -> panic as "spiral string slice: splits a character"
  }
}


pub fn spiral_string_starts_character(bytes: BitArray, at: Int) -> Bool {
  case bit_array.slice(bytes, at, 1) {
    Ok(<<lead>>) -> lead < 128 || lead >= 192
    _ -> True
  }
}


pub fn spiral_string_slice(text: String, from: Int, to: Int) -> String {
  let bytes = bit_array.from_string(text)
  let length = bit_array.byte_size(bytes)
  case from < 0 || from > length || to < from - 1 || to >= length {
    True -> panic as "spiral string slice: out of range"
    False ->
      case to < from {
        True -> ""
        False ->
          case spiral_string_starts_character(bytes, from) && spiral_string_starts_character(bytes, to + 1) {
            False -> panic as "spiral string slice: splits a character"
            True ->
              case bit_array.slice(bytes, from, to - from + 1) {
                Ok(part) -> spiral_string_of_checked_bytes(part)
                Error(_) -> panic as "spiral string slice: out of range"
              }
          }
      }
  }
}


pub fn closure1(capt: Nil) -> fn(String) -> Us0 {
    fn (v0) {
        Us0Some(v0)
    }
}

pub fn split_list_2(v0: String, v1: String) -> Uh3 {
    let v2 = v0 == ""
    let v12 =
        case v2 {
            True -> {
                0
            }
            False -> {
                let v3 = option.from_result(result.map(string.split_once(v1, v0), pair.first))
                let v4 = closure1(Nil)
                let v5 = v3 |> option.map(v4)
                let v6 = Us0None
                let v7 = v5 |> option.unwrap(v6)
                case v7  {
                    Us0None -> {
                        -1
                    }
                    Us0Some(v8) -> {
                        let v9 = bit_array.byte_size(bit_array.from_string(v8))
                        v9
                    }
                }
            }
        }
    let v13 = spiral_string_length(v0)
    let v14 = v12 < 0
    let v16 =
        case v14 {
            True -> {
                True
            }
            False -> {
                let v15 = v13 == 0
                v15
            }
        }
    case v16 {
        True -> {
            let v17 = Uh3Nil
            Uh3Cons(v1, v17)
        }
        False -> {
            let v19 = spiral_wrap_signed(v12 - 1, 32)
            let v20 = spiral_string_slice(v1, 0, v19)
            let v21 = spiral_wrap_signed(v12 + v13, 32)
            let v22 = spiral_string_length(v1)
            let v23 = spiral_wrap_signed(v22 - v12, 32)
            let v24 = spiral_wrap_signed(v23 - v13, 32)
            let v25 = spiral_wrap_signed(v21 + v24, 32)
            let v26 = spiral_wrap_signed(v25 - 1, 32)
            let v27 = spiral_string_slice(v1, v21, v26)
            let v28 = split_list_2(v0, v27)
            Uh3Cons(v20, v28)
        }
    }
}

pub fn string_from_5(v0: String, v1: Int, v2: String) -> #(String, Int) {
    let v3 = spiral_string_length(v0)
    let v4 = spiral_wrap_signed(v3 - v1, 32)
    let v5 = spiral_wrap_signed(v1 + v4, 32)
    let v6 = spiral_wrap_signed(v5 - 1, 32)
    let v7 = spiral_string_slice(v0, v1, v6)
    let v8 = "\""
    let v9 = option.from_result(result.map(string.split_once(v7, v8), pair.first))
    let v10 = closure1(Nil)
    let v11 = v9 |> option.map(v10)
    let v12 = Us0None
    let v13 = v11 |> option.unwrap(v12)
    let v17 =
        case v13  {
            Us0None -> {
                -1
            }
            Us0Some(v14) -> {
                let v15 = bit_array.byte_size(bit_array.from_string(v14))
                v15
            }
        }
    let v18 = "\\"
    let v19 = option.from_result(result.map(string.split_once(v7, v18), pair.first))
    let v20 = v19 |> option.map(v10)
    let v21 = Us0None
    let v22 = v20 |> option.unwrap(v21)
    let v26 =
        case v22  {
            Us0None -> {
                -1
            }
            Us0Some(v23) -> {
                let v24 = bit_array.byte_size(bit_array.from_string(v23))
                v24
            }
        }
    let v27 = v26 >= 0
    let v31 =
        case v27 {
            True -> {
                let v28 = v17 < 0
                case v28 {
                    True -> {
                        True
                    }
                    False -> {
                        let v29 = v26 < v17
                        v29
                    }
                }
            }
            False -> {
                False
            }
        }
    let v32 = v31 == False
    let #(v157, v158) =
        case v32 {
            True -> {
                let v33 = v17 < 0
                let #(v39, v40) =
                    case v33 {
                        True -> {
                            #(v2, -1)
                        }
                        False -> {
                            let v34 = spiral_wrap_signed(v1 + v17, 32)
                            let v35 = spiral_wrap_signed(v34 - 1, 32)
                            let v36 = spiral_string_slice(v0, v1, v35)
                            let v37 = v2 <> v36 
                            let v38 = spiral_wrap_signed(v34 + 1, 32)
                            #(v37, v38)
                        }
                    }
                #(v39, v40)
            }
            False -> {
                let v41 = spiral_wrap_signed(v1 + v26, 32)
                let v42 = spiral_wrap_signed(v41 + 1, 32)
                let v43 = spiral_wrap_signed(v42 + 1, 32)
                let v44 = spiral_wrap_signed(v43 - 1, 32)
                let v45 = spiral_string_slice(v0, v42, v44)
                let v46 = v45 == "u"
                let #(v149, v150) =
                    case v46 {
                        True -> {
                            let v47 = spiral_wrap_signed(v43 + 1, 32)
                            let v48 = spiral_wrap_signed(v47 - 1, 32)
                            let v49 = spiral_string_slice(v0, v43, v48)
                            let v50 = v49 == ""
                            let v60 =
                                case v50 {
                                    True -> {
                                        0
                                    }
                                    False -> {
                                        let v51 = "0123456789abcdefABCDEF"
                                        let v52 = option.from_result(result.map(string.split_once(v51, v49), pair.first))
                                        let v53 = v52 |> option.map(v10)
                                        let v54 = Us0None
                                        let v55 = v53 |> option.unwrap(v54)
                                        case v55  {
                                            Us0None -> {
                                                -1
                                            }
                                            Us0Some(v56) -> {
                                                let v57 = bit_array.byte_size(bit_array.from_string(v56))
                                                v57
                                            }
                                        }
                                    }
                                }
                            let v61 = v60 < 16
                            let v63 =
                                case v61 {
                                    True -> {
                                        v60
                                    }
                                    False -> {
                                        let v62 = spiral_wrap_signed(v60 - 6, 32)
                                        v62
                                    }
                                }
                            let v64 = spiral_wrap_signed(v63 * 16, 32)
                            let v65 = spiral_wrap_signed(v47 + 1, 32)
                            let v66 = spiral_wrap_signed(v65 - 1, 32)
                            let v67 = spiral_string_slice(v0, v47, v66)
                            let v68 = v67 == ""
                            let v78 =
                                case v68 {
                                    True -> {
                                        0
                                    }
                                    False -> {
                                        let v69 = "0123456789abcdefABCDEF"
                                        let v70 = option.from_result(result.map(string.split_once(v69, v67), pair.first))
                                        let v71 = v70 |> option.map(v10)
                                        let v72 = Us0None
                                        let v73 = v71 |> option.unwrap(v72)
                                        case v73  {
                                            Us0None -> {
                                                -1
                                            }
                                            Us0Some(v74) -> {
                                                let v75 = bit_array.byte_size(bit_array.from_string(v74))
                                                v75
                                            }
                                        }
                                    }
                                }
                            let v79 = v78 < 16
                            let v81 =
                                case v79 {
                                    True -> {
                                        v78
                                    }
                                    False -> {
                                        let v80 = spiral_wrap_signed(v78 - 6, 32)
                                        v80
                                    }
                                }
                            let v82 = spiral_wrap_signed(v64 + v81, 32)
                            let v83 = spiral_wrap_signed(v82 * 16, 32)
                            let v84 = spiral_wrap_signed(v43 + 2, 32)
                            let v85 = spiral_wrap_signed(v84 + 1, 32)
                            let v86 = spiral_wrap_signed(v85 - 1, 32)
                            let v87 = spiral_string_slice(v0, v84, v86)
                            let v88 = v87 == ""
                            let v98 =
                                case v88 {
                                    True -> {
                                        0
                                    }
                                    False -> {
                                        let v89 = "0123456789abcdefABCDEF"
                                        let v90 = option.from_result(result.map(string.split_once(v89, v87), pair.first))
                                        let v91 = v90 |> option.map(v10)
                                        let v92 = Us0None
                                        let v93 = v91 |> option.unwrap(v92)
                                        case v93  {
                                            Us0None -> {
                                                -1
                                            }
                                            Us0Some(v94) -> {
                                                let v95 = bit_array.byte_size(bit_array.from_string(v94))
                                                v95
                                            }
                                        }
                                    }
                                }
                            let v99 = v98 < 16
                            let v101 =
                                case v99 {
                                    True -> {
                                        v98
                                    }
                                    False -> {
                                        let v100 = spiral_wrap_signed(v98 - 6, 32)
                                        v100
                                    }
                                }
                            let v102 = spiral_wrap_signed(v83 + v101, 32)
                            let v103 = spiral_wrap_signed(v102 * 16, 32)
                            let v104 = spiral_wrap_signed(v43 + 3, 32)
                            let v105 = spiral_wrap_signed(v104 + 1, 32)
                            let v106 = spiral_wrap_signed(v105 - 1, 32)
                            let v107 = spiral_string_slice(v0, v104, v106)
                            let v108 = v107 == ""
                            let v118 =
                                case v108 {
                                    True -> {
                                        0
                                    }
                                    False -> {
                                        let v109 = "0123456789abcdefABCDEF"
                                        let v110 = option.from_result(result.map(string.split_once(v109, v107), pair.first))
                                        let v111 = v110 |> option.map(v10)
                                        let v112 = Us0None
                                        let v113 = v111 |> option.unwrap(v112)
                                        case v113  {
                                            Us0None -> {
                                                -1
                                            }
                                            Us0Some(v114) -> {
                                                let v115 = bit_array.byte_size(bit_array.from_string(v114))
                                                v115
                                            }
                                        }
                                    }
                                }
                            let v119 = v118 < 16
                            let v121 =
                                case v119 {
                                    True -> {
                                        v118
                                    }
                                    False -> {
                                        let v120 = spiral_wrap_signed(v118 - 6, 32)
                                        v120
                                    }
                                }
                            let v122 = spiral_wrap_signed(v103 + v121, 32)
                            let v123 = v122 >= 0
                            let v125 =
                                case v123 {
                                    True -> {
                                        let v124 = v122 <= 1114111
                                        v124
                                    }
                                    False -> {
                                        False
                                    }
                                }
                            let v129 =
                                case v125 {
                                    True -> {
                                        let v126 = v122 < 55296
                                        case v126 {
                                            True -> {
                                                True
                                            }
                                            False -> {
                                                let v127 = v122 > 57343
                                                v127
                                            }
                                        }
                                    }
                                    False -> {
                                        False
                                    }
                                }
                            let v132 =
                                case v129 {
                                    True -> {
                                        let v130 = unicode_erlang_characters_to_binary([v122])
                                        v130
                                    }
                                    False -> {
                                        let v131 = ""
                                        v131
                                    }
                                }
                            let v133 = spiral_wrap_signed(v42 + 5, 32)
                            #(v132, v133)
                        }
                        False -> {
                            let v134 = v45 == "n"
                            let v148 =
                                case v134 {
                                    True -> {
                                        let v135 = "\n"
                                        v135
                                    }
                                    False -> {
                                        let v136 = v45 == "t"
                                        case v136 {
                                            True -> {
                                                let v137 = "\t"
                                                v137
                                            }
                                            False -> {
                                                let v138 = v45 == "r"
                                                case v138 {
                                                    True -> {
                                                        let v139 = "\r"
                                                        v139
                                                    }
                                                    False -> {
                                                        let v140 = v45 == "b"
                                                        case v140 {
                                                            True -> {
                                                                let v141 = unicode_erlang_characters_to_binary([8])
                                                                v141
                                                            }
                                                            False -> {
                                                                let v142 = v45 == "f"
                                                                case v142 {
                                                                    True -> {
                                                                        let v143 = unicode_erlang_characters_to_binary([12])
                                                                        v143
                                                                    }
                                                                    False -> {
                                                                        v45
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            #(v148, v43)
                        }
                    }
                let v151 = spiral_wrap_signed(v41 - 1, 32)
                let v152 = spiral_string_slice(v0, v1, v151)
                let v153 = v2 <> v152 
                let v154 = v153 <> v149 
                let #(v155, v156) = string_from_5(v0, v150, v154)
                #(v155, v156)
            }
        }
    #(v157, v158)
}

pub fn digits_end_6(v0: String, v1: Int) -> Int {
    let v2 = spiral_string_length(v0)
    let v3 = v1 < v2
    let v37 =
        case v3 {
            True -> {
                let v4 = spiral_wrap_signed(v2 - v1, 32)
                let v5 = spiral_wrap_signed(v1 + v4, 32)
                let v6 = spiral_wrap_signed(v5 - 1, 32)
                let v7 = spiral_string_slice(v0, v1, v6)
                let v8 = string.inspect(0)
                let v9 = v7 |> string.starts_with(v8)
                case v9 {
                    True -> {
                        True
                    }
                    False -> {
                        let v10 = string.inspect(1)
                        let v11 = v7 |> string.starts_with(v10)
                        case v11 {
                            True -> {
                                True
                            }
                            False -> {
                                let v12 = string.inspect(2)
                                let v13 = v7 |> string.starts_with(v12)
                                case v13 {
                                    True -> {
                                        True
                                    }
                                    False -> {
                                        let v14 = string.inspect(3)
                                        let v15 = v7 |> string.starts_with(v14)
                                        case v15 {
                                            True -> {
                                                True
                                            }
                                            False -> {
                                                let v16 = string.inspect(4)
                                                let v17 = v7 |> string.starts_with(v16)
                                                case v17 {
                                                    True -> {
                                                        True
                                                    }
                                                    False -> {
                                                        let v18 = string.inspect(5)
                                                        let v19 = v7 |> string.starts_with(v18)
                                                        case v19 {
                                                            True -> {
                                                                True
                                                            }
                                                            False -> {
                                                                let v20 = string.inspect(6)
                                                                let v21 = v7 |> string.starts_with(v20)
                                                                case v21 {
                                                                    True -> {
                                                                        True
                                                                    }
                                                                    False -> {
                                                                        let v22 = string.inspect(7)
                                                                        let v23 = v7 |> string.starts_with(v22)
                                                                        case v23 {
                                                                            True -> {
                                                                                True
                                                                            }
                                                                            False -> {
                                                                                let v24 = string.inspect(8)
                                                                                let v25 = v7 |> string.starts_with(v24)
                                                                                case v25 {
                                                                                    True -> {
                                                                                        True
                                                                                    }
                                                                                    False -> {
                                                                                        let v26 = string.inspect(9)
                                                                                        let v27 = v7 |> string.starts_with(v26)
                                                                                        v27
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            False -> {
                False
            }
        }
    case v37 {
        True -> {
            let v38 = spiral_wrap_signed(v1 + 1, 32)
            digits_end_6(v0, v38)
        }
        False -> {
            v1
        }
    }
}

pub fn digits_8(v0: String, v1: Int, v2: Int) -> Us3 {
    let v3 = spiral_string_length(v0)
    let v4 = v1 >= v3
    case v4 {
        True -> {
            Us3Some(v2)
        }
        False -> {
            let v6 = spiral_string_slice(v0, v1, v1)
            let v7 = v6 == ""
            let v18 =
                case v7 {
                    True -> {
                        0
                    }
                    False -> {
                        let v8 = "0123456789"
                        let v9 = option.from_result(result.map(string.split_once(v8, v6), pair.first))
                        let v10 = closure1(Nil)
                        let v11 = v9 |> option.map(v10)
                        let v12 = Us0None
                        let v13 = v11 |> option.unwrap(v12)
                        case v13  {
                            Us0None -> {
                                -1
                            }
                            Us0Some(v14) -> {
                                let v15 = bit_array.byte_size(bit_array.from_string(v14))
                                v15
                            }
                        }
                    }
                }
            let v19 = v18 < 0
            let v21 =
                case v19 {
                    True -> {
                        True
                    }
                    False -> {
                        let v20 = v2 > 100000000
                        v20
                    }
                }
            case v21 {
                True -> {
                    Us3None
                }
                False -> {
                    let v23 = spiral_wrap_signed(v1 + 1, 32)
                    let v24 = spiral_wrap_signed(v2 * 10, 32)
                    let v25 = spiral_wrap_signed(v24 + v18, 32)
                    digits_8(v0, v23, v25)
                }
            }
        }
    }
}

pub fn count_of_text_7(v0: String) -> Us3 {
    let v1 = v0 == ""
    let v24 =
        case v1 {
            True -> {
                True
            }
            False -> {
                let v2 = string.inspect(0)
                let v3 = ""
                let v4 = v0 |> string.replace(v2, v3)
                let v5 = string.inspect(1)
                let v6 = v4 |> string.replace(v5, v3)
                let v7 = string.inspect(2)
                let v8 = v6 |> string.replace(v7, v3)
                let v9 = string.inspect(3)
                let v10 = v8 |> string.replace(v9, v3)
                let v11 = string.inspect(4)
                let v12 = v10 |> string.replace(v11, v3)
                let v13 = string.inspect(5)
                let v14 = v12 |> string.replace(v13, v3)
                let v15 = string.inspect(6)
                let v16 = v14 |> string.replace(v15, v3)
                let v17 = string.inspect(7)
                let v18 = v16 |> string.replace(v17, v3)
                let v19 = string.inspect(8)
                let v20 = v18 |> string.replace(v19, v3)
                let v21 = string.inspect(9)
                let v22 = v20 |> string.replace(v21, v3)
                let v23 = v22 != ""
                v23
            }
        }
    case v24 {
        True -> {
            Us3None
        }
        False -> {
            let v26 = 0
            let v27 = 0
            digits_8(v0, v26, v27)
        }
    }
}

pub fn method9(v0: Uh5, v1: Uh5) -> Uh5 {
    case v0  {
        Uh5Cons(v2, v3, v4) -> {
            let v5 = Uh5Cons(v2, v3, v1)
            method9(v4, v5)
        }
        Uh5Nil -> {
            v1
        }
    }
}
