import gleam/bit_array
import gleam/int
import gleam/string
import xsim_frames/types.{type XSplitScope, type Uh0, type Uh2, type Uh3, type Us0, type Uh5, type Us1, type Us2, type Us3, Uh0Cons, Uh0Nil, Uh2Cons, Uh2Nil, Uh3Cons, Uh3Nil, Uh5Cons, Uh5Nil, Us0Null, Us0Text, Us0Whole, Us1None, Us1Some, Us2None, Us2Some, Us3None, Us3Some}

@external(erlang, "binary", "split")
pub fn spiral_binary_split_first(text: String, search: String) -> List(String) {
  case string.split_once(text, search) {
    Ok(#(head, tail)) -> [head, tail]
    Error(_) -> [text]
  }
}

@ external(erlang, "binary", "split")
pub fn x_binary_split(s: String, sep: String, options: List(XSplitScope)) -> List(String)

@ external(erlang, "unicode", "characters_to_nfc_binary")
pub fn erlang_nfc(s: String) -> String

pub fn x_light(n: Int) -> Bool { n <= 4351 || n >= 8192 && n <= 8205 || n >= 8208 && n <= 8223 || n >= 8242 && n <= 8247 }

pub fn x_white(n: Int) -> Bool { n >= 9 && n <= 13 || n == 32 || n == 133 || n == 160 || n == 5760 || n >= 8192 && n <= 8202 }

pub fn x_spaced(n: Int) -> Bool { x_white(n) || n == 8232 || n == 8233 || n == 8239 || n == 8287 || n == 12288 }

pub fn spiral_wrap_signed(value: Int, bits: Int) -> Int {
  let half = int.bitwise_shift_left(1, bits - 1)
  int.bitwise_and(value + half, int.bitwise_shift_left(1, bits) - 1) - half
}


pub fn spiral_wrap_unsigned(value: Int, bits: Int) -> Int {
  int.bitwise_and(value, int.bitwise_shift_left(1, bits) - 1)
}


pub fn spiral_string_length(text: String) -> Int {
  bit_array.byte_size(bit_array.from_string(text))
}


@external(erlang, "erlang", "halt")
@external(javascript, "node:process", "exit")
pub fn spiral_halt(code: Int) -> a


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


pub fn split_on_2(v0: String, v1: String) -> Uh3 {
    let v2 = case v0 { "" -> 0 _ -> case spiral_binary_split_first(v1, v0) { [spiral_head, _] -> bit_array.byte_size(bit_array.from_string(spiral_head)) _ -> -1 } }
    let v3 = v2 < 0
    case v3 {
        True -> {
            let v4 = Uh3Nil
            Uh3Cons(v1, v4)
        }
        False -> {
            let v6 = spiral_wrap_signed(v2 - 1, 32)
            let v7 = spiral_string_slice(v1, 0, v6)
            let v8 = spiral_wrap_signed(v2 + 1, 32)
            let v9 = spiral_string_length(v1)
            let v10 = spiral_wrap_signed(v9 - v2, 32)
            let v11 = spiral_wrap_signed(v10 - 1, 32)
            let v12 = spiral_wrap_signed(v8 + v11, 32)
            let v13 = spiral_wrap_signed(v12 - 1, 32)
            let v14 = spiral_string_slice(v1, v8, v13)
            let v15 = split_on_2(v0, v14)
            Uh3Cons(v7, v15)
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
    let v9 = case v8 { "" -> 0 _ -> case spiral_binary_split_first(v7, v8) { [spiral_head, _] -> bit_array.byte_size(bit_array.from_string(spiral_head)) _ -> -1 } }
    let v10 = "\\"
    let v11 = case v10 { "" -> 0 _ -> case spiral_binary_split_first(v7, v10) { [spiral_head, _] -> bit_array.byte_size(bit_array.from_string(spiral_head)) _ -> -1 } }
    let v12 = v11 >= 0
    let v16 =
        case v12 {
            True -> {
                let v13 = v9 < 0
                case v13 {
                    True -> {
                        True
                    }
                    False -> {
                        let v14 = v11 < v9
                        v14
                    }
                }
            }
            False -> {
                False
            }
        }
    let v17 = v16 == False
    let #(v94, v95) =
        case v17 {
            True -> {
                let v18 = v9 < 0
                let #(v24, v25) =
                    case v18 {
                        True -> {
                            #(v2, -1)
                        }
                        False -> {
                            let v19 = spiral_wrap_signed(v1 + v9, 32)
                            let v20 = spiral_wrap_signed(v19 - 1, 32)
                            let v21 = spiral_string_slice(v0, v1, v20)
                            let v22 = v2 <> v21 
                            let v23 = spiral_wrap_signed(v19 + 1, 32)
                            #(v22, v23)
                        }
                    }
                #(v24, v25)
            }
            False -> {
                let v26 = spiral_wrap_signed(v1 + v11, 32)
                let v27 = spiral_wrap_signed(v26 + 1, 32)
                let v28 = spiral_wrap_signed(v27 + 1, 32)
                let v29 = spiral_wrap_signed(v28 - 1, 32)
                let v30 = spiral_string_slice(v0, v27, v29)
                let v31 = v30 == "u"
                let #(v86, v87) =
                    case v31 {
                        True -> {
                            let v32 = spiral_wrap_signed(v28 + 1, 32)
                            let v33 = spiral_wrap_signed(v32 - 1, 32)
                            let v34 = spiral_string_slice(v0, v28, v33)
                            let v35 = "0123456789abcdefABCDEF"
                            let v36 = case v34 { "" -> 0 _ -> case spiral_binary_split_first(v35, v34) { [spiral_head, _] -> bit_array.byte_size(bit_array.from_string(spiral_head)) _ -> -1 } }
                            let v37 = v36 < 16
                            let v39 =
                                case v37 {
                                    True -> {
                                        v36
                                    }
                                    False -> {
                                        let v38 = spiral_wrap_signed(v36 - 6, 32)
                                        v38
                                    }
                                }
                            let v40 = spiral_wrap_signed(v39 * 16, 32)
                            let v41 = spiral_wrap_signed(v32 + 1, 32)
                            let v42 = spiral_wrap_signed(v41 - 1, 32)
                            let v43 = spiral_string_slice(v0, v32, v42)
                            let v44 = case v43 { "" -> 0 _ -> case spiral_binary_split_first(v35, v43) { [spiral_head, _] -> bit_array.byte_size(bit_array.from_string(spiral_head)) _ -> -1 } }
                            let v45 = v44 < 16
                            let v47 =
                                case v45 {
                                    True -> {
                                        v44
                                    }
                                    False -> {
                                        let v46 = spiral_wrap_signed(v44 - 6, 32)
                                        v46
                                    }
                                }
                            let v48 = spiral_wrap_signed(v40 + v47, 32)
                            let v49 = spiral_wrap_signed(v48 * 16, 32)
                            let v50 = spiral_wrap_signed(v28 + 2, 32)
                            let v51 = spiral_wrap_signed(v50 + 1, 32)
                            let v52 = spiral_wrap_signed(v51 - 1, 32)
                            let v53 = spiral_string_slice(v0, v50, v52)
                            let v54 = case v53 { "" -> 0 _ -> case spiral_binary_split_first(v35, v53) { [spiral_head, _] -> bit_array.byte_size(bit_array.from_string(spiral_head)) _ -> -1 } }
                            let v55 = v54 < 16
                            let v57 =
                                case v55 {
                                    True -> {
                                        v54
                                    }
                                    False -> {
                                        let v56 = spiral_wrap_signed(v54 - 6, 32)
                                        v56
                                    }
                                }
                            let v58 = spiral_wrap_signed(v49 + v57, 32)
                            let v59 = spiral_wrap_signed(v58 * 16, 32)
                            let v60 = spiral_wrap_signed(v28 + 3, 32)
                            let v61 = spiral_wrap_signed(v60 + 1, 32)
                            let v62 = spiral_wrap_signed(v61 - 1, 32)
                            let v63 = spiral_string_slice(v0, v60, v62)
                            let v64 = case v63 { "" -> 0 _ -> case spiral_binary_split_first(v35, v63) { [spiral_head, _] -> bit_array.byte_size(bit_array.from_string(spiral_head)) _ -> -1 } }
                            let v65 = v64 < 16
                            let v67 =
                                case v65 {
                                    True -> {
                                        v64
                                    }
                                    False -> {
                                        let v66 = spiral_wrap_signed(v64 - 6, 32)
                                        v66
                                    }
                                }
                            let v68 = spiral_wrap_signed(v59 + v67, 32)
                            let v69 = case string.utf_codepoint(v68) { Ok(c) -> string.from_utf_codepoints([c]) Error(_) -> "" }
                            let v70 = spiral_wrap_signed(v27 + 5, 32)
                            #(v69, v70)
                        }
                        False -> {
                            let v71 = v30 == "n"
                            let v85 =
                                case v71 {
                                    True -> {
                                        let v72 = "\n"
                                        v72
                                    }
                                    False -> {
                                        let v73 = v30 == "t"
                                        case v73 {
                                            True -> {
                                                let v74 = "\t"
                                                v74
                                            }
                                            False -> {
                                                let v75 = v30 == "r"
                                                case v75 {
                                                    True -> {
                                                        let v76 = "\r"
                                                        v76
                                                    }
                                                    False -> {
                                                        let v77 = v30 == "b"
                                                        case v77 {
                                                            True -> {
                                                                let v78 = case string.utf_codepoint(8) { Ok(c) -> string.from_utf_codepoints([c]) Error(_) -> "" }
                                                                v78
                                                            }
                                                            False -> {
                                                                let v79 = v30 == "f"
                                                                case v79 {
                                                                    True -> {
                                                                        let v80 = case string.utf_codepoint(12) { Ok(c) -> string.from_utf_codepoints([c]) Error(_) -> "" }
                                                                        v80
                                                                    }
                                                                    False -> {
                                                                        v30
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
                            #(v85, v28)
                        }
                    }
                let v88 = spiral_wrap_signed(v26 - 1, 32)
                let v89 = spiral_string_slice(v0, v1, v88)
                let v90 = v2 <> v89 
                let v91 = v90 <> v86 
                let #(v92, v93) = string_from_5(v0, v87, v91)
                #(v92, v93)
            }
        }
    #(v94, v95)
}

pub fn digits_end_6(v0: String, v1: Int) -> Int {
    let v2 = spiral_string_length(v0)
    let v3 = v1 < v2
    let v52 =
        case v3 {
            True -> {
                let v4 = spiral_wrap_signed(v2 - v1, 32)
                let v5 = spiral_wrap_signed(v1 + v4, 32)
                let v6 = spiral_wrap_signed(v5 - 1, 32)
                let v7 = spiral_string_slice(v0, v1, v6)
                let v8 = string.inspect(9)
                let v9 = v7 |> string.starts_with(v8)
                let v12 =
                    case v9 {
                        True -> {
                            Us2Some(9)
                        }
                        False -> {
                            Us2None
                        }
                    }
                let v13 = string.inspect(8)
                let v14 = v7 |> string.starts_with(v13)
                let v16 =
                    case v14 {
                        True -> {
                            Us2Some(8)
                        }
                        False -> {
                            v12
                        }
                    }
                let v17 = string.inspect(7)
                let v18 = v7 |> string.starts_with(v17)
                let v20 =
                    case v18 {
                        True -> {
                            Us2Some(7)
                        }
                        False -> {
                            v16
                        }
                    }
                let v21 = string.inspect(6)
                let v22 = v7 |> string.starts_with(v21)
                let v24 =
                    case v22 {
                        True -> {
                            Us2Some(6)
                        }
                        False -> {
                            v20
                        }
                    }
                let v25 = string.inspect(5)
                let v26 = v7 |> string.starts_with(v25)
                let v28 =
                    case v26 {
                        True -> {
                            Us2Some(5)
                        }
                        False -> {
                            v24
                        }
                    }
                let v29 = string.inspect(4)
                let v30 = v7 |> string.starts_with(v29)
                let v32 =
                    case v30 {
                        True -> {
                            Us2Some(4)
                        }
                        False -> {
                            v28
                        }
                    }
                let v33 = string.inspect(3)
                let v34 = v7 |> string.starts_with(v33)
                let v36 =
                    case v34 {
                        True -> {
                            Us2Some(3)
                        }
                        False -> {
                            v32
                        }
                    }
                let v37 = string.inspect(2)
                let v38 = v7 |> string.starts_with(v37)
                let v40 =
                    case v38 {
                        True -> {
                            Us2Some(2)
                        }
                        False -> {
                            v36
                        }
                    }
                let v41 = string.inspect(1)
                let v42 = v7 |> string.starts_with(v41)
                let v44 =
                    case v42 {
                        True -> {
                            Us2Some(1)
                        }
                        False -> {
                            v40
                        }
                    }
                let v45 = string.inspect(0)
                let v46 = v7 |> string.starts_with(v45)
                let v48 =
                    case v46 {
                        True -> {
                            Us2Some(0)
                        }
                        False -> {
                            v44
                        }
                    }
                case v48  {
                    Us2None -> {
                        False
                    }
                    Us2Some(v49) -> {
                        True
                    }
                }
            }
            False -> {
                False
            }
        }
    case v52 {
        True -> {
            let v53 = spiral_wrap_signed(v1 + 1, 32)
            digits_end_6(v0, v53)
        }
        False -> {
            v1
        }
    }
}

pub fn digits_8(v0: String, v1: Int, v2: Int) -> Us2 {
    let v3 = spiral_string_length(v0)
    let v4 = v1 >= v3
    case v4 {
        True -> {
            Us2Some(v2)
        }
        False -> {
            let v6 = spiral_string_slice(v0, v1, v1)
            let v7 = "0123456789"
            let v8 = case v6 { "" -> 0 _ -> case spiral_binary_split_first(v7, v6) { [spiral_head, _] -> bit_array.byte_size(bit_array.from_string(spiral_head)) _ -> -1 } }
            let v9 = v8 < 0
            let v11 =
                case v9 {
                    True -> {
                        True
                    }
                    False -> {
                        let v10 = v2 > 100000000
                        v10
                    }
                }
            case v11 {
                True -> {
                    Us2None
                }
                False -> {
                    let v13 = spiral_wrap_signed(v1 + 1, 32)
                    let v14 = spiral_wrap_signed(v2 * 10, 32)
                    let v15 = spiral_wrap_signed(v14 + v8, 32)
                    digits_8(v0, v13, v15)
                }
            }
        }
    }
}

pub fn count_of_text_7(v0: String) -> Us2 {
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
            Us2None
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

pub fn fields_from_4(v0: String, v1: Int, v2: Uh5) -> Us1 {
    let v3 = v1 < 0
    let v6 =
        case v3 {
            True -> {
                True
            }
            False -> {
                let v4 = spiral_string_length(v0)
                let v5 = v1 > v4
                v5
            }
        }
    let v14 =
        case v6 {
            True -> {
                False
            }
            False -> {
                let v7 = spiral_string_length(v0)
                let v8 = spiral_wrap_signed(v7 - v1, 32)
                let v9 = spiral_wrap_signed(v1 + v8, 32)
                let v10 = spiral_wrap_signed(v9 - 1, 32)
                let v11 = spiral_string_slice(v0, v1, v10)
                let v12 = "\""
                let v13 = v11 |> string.starts_with(v12)
                v13
            }
        }
    let #(v90, v91, v92) =
        case v14 {
            True -> {
                let v15 = spiral_wrap_signed(v1 + 1, 32)
                let v16 = ""
                let #(v17, v18) = string_from_5(v0, v15, v16)
                let v19 = v18 < 0
                let v22 =
                    case v19 {
                        True -> {
                            True
                        }
                        False -> {
                            let v20 = spiral_string_length(v0)
                            let v21 = v18 > v20
                            v21
                        }
                    }
                let v30 =
                    case v22 {
                        True -> {
                            False
                        }
                        False -> {
                            let v23 = spiral_string_length(v0)
                            let v24 = spiral_wrap_signed(v23 - v18, 32)
                            let v25 = spiral_wrap_signed(v18 + v24, 32)
                            let v26 = spiral_wrap_signed(v25 - 1, 32)
                            let v27 = spiral_string_slice(v0, v18, v26)
                            let v28 = ":"
                            let v29 = v27 |> string.starts_with(v28)
                            v29
                        }
                    }
                let #(v86, v87) =
                    case v30 {
                        True -> {
                            let v31 = spiral_wrap_signed(v18 + 1, 32)
                            let v32 = v31 < 0
                            let v35 =
                                case v32 {
                                    True -> {
                                        True
                                    }
                                    False -> {
                                        let v33 = spiral_string_length(v0)
                                        let v34 = v31 > v33
                                        v34
                                    }
                                }
                            let v43 =
                                case v35 {
                                    True -> {
                                        False
                                    }
                                    False -> {
                                        let v36 = spiral_string_length(v0)
                                        let v37 = spiral_wrap_signed(v36 - v31, 32)
                                        let v38 = spiral_wrap_signed(v31 + v37, 32)
                                        let v39 = spiral_wrap_signed(v38 - 1, 32)
                                        let v40 = spiral_string_slice(v0, v31, v39)
                                        let v41 = "\""
                                        let v42 = v40 |> string.starts_with(v41)
                                        v42
                                    }
                                }
                            case v43 {
                                True -> {
                                    let v44 = spiral_wrap_signed(v31 + 1, 32)
                                    let #(v45, v46) = string_from_5(v0, v44, v16)
                                    let v47 = Us0Text(v45)
                                    #(v47, v46)
                                }
                                False -> {
                                    let v50 =
                                        case v32 {
                                            True -> {
                                                True
                                            }
                                            False -> {
                                                let v48 = spiral_string_length(v0)
                                                let v49 = v31 > v48
                                                v49
                                            }
                                        }
                                    let v58 =
                                        case v50 {
                                            True -> {
                                                False
                                            }
                                            False -> {
                                                let v51 = spiral_string_length(v0)
                                                let v52 = spiral_wrap_signed(v51 - v31, 32)
                                                let v53 = spiral_wrap_signed(v31 + v52, 32)
                                                let v54 = spiral_wrap_signed(v53 - 1, 32)
                                                let v55 = spiral_string_slice(v0, v31, v54)
                                                let v56 = "null"
                                                let v57 = v55 |> string.starts_with(v56)
                                                v57
                                            }
                                        }
                                    case v58 {
                                        True -> {
                                            let v59 = spiral_wrap_signed(v31 + 4, 32)
                                            let v60 = Us0Null
                                            #(v60, v59)
                                        }
                                        False -> {
                                            let v61 = v31 >= 0
                                            let v64 =
                                                case v61 {
                                                    True -> {
                                                        let v62 = spiral_string_length(v0)
                                                        let v63 = v31 < v62
                                                        v63
                                                    }
                                                    False -> {
                                                        False
                                                    }
                                                }
                                            case v64 {
                                                True -> {
                                                    let v65 = digits_end_6(v0, v31)
                                                    let v66 = spiral_wrap_signed(v65 - v31, 32)
                                                    let v67 = spiral_wrap_signed(v31 + v66, 32)
                                                    let v68 = spiral_wrap_signed(v67 - 1, 32)
                                                    let v69 = spiral_string_slice(v0, v31, v68)
                                                    let v70 = count_of_text_7(v69)
                                                    case v70  {
                                                        Us2None -> {
                                                            let v73 = Us0Null
                                                            #(v73, -1)
                                                        }
                                                        Us2Some(v71) -> {
                                                            let v72 = Us0Whole(v71)
                                                            #(v72, v65)
                                                        }
                                                    }
                                                }
                                                False -> {
                                                    let v78 = Us0Null
                                                    #(v78, -1)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        False -> {
                            let v85 = Us0Null
                            #(v85, -1)
                        }
                    }
                #(v17, v86, v87)
            }
            False -> {
                let v88 = ""
                let v89 = Us0Null
                #(v88, v89, -1)
            }
        }
    let v93 = v92 < 0
    let v96 =
        case v93 {
            True -> {
                True
            }
            False -> {
                let v94 = spiral_string_length(v0)
                let v95 = v92 > v94
                v95
            }
        }
    let v104 =
        case v96 {
            True -> {
                False
            }
            False -> {
                let v97 = spiral_string_length(v0)
                let v98 = spiral_wrap_signed(v97 - v92, 32)
                let v99 = spiral_wrap_signed(v92 + v98, 32)
                let v100 = spiral_wrap_signed(v99 - 1, 32)
                let v101 = spiral_string_slice(v0, v92, v100)
                let v102 = ","
                let v103 = v101 |> string.starts_with(v102)
                v103
            }
        }
    case v104 {
        True -> {
            let v105 = spiral_wrap_signed(v92 + 1, 32)
            let v106 = Uh5Cons(v90, v91, v2)
            fields_from_4(v0, v105, v106)
        }
        False -> {
            let v110 =
                case v93 {
                    True -> {
                        True
                    }
                    False -> {
                        let v108 = spiral_string_length(v0)
                        let v109 = v92 > v108
                        v109
                    }
                }
            let v118 =
                case v110 {
                    True -> {
                        False
                    }
                    False -> {
                        let v111 = spiral_string_length(v0)
                        let v112 = spiral_wrap_signed(v111 - v92, 32)
                        let v113 = spiral_wrap_signed(v92 + v112, 32)
                        let v114 = spiral_wrap_signed(v113 - 1, 32)
                        let v115 = spiral_string_slice(v0, v92, v114)
                        let v116 = "}"
                        let v117 = v115 |> string.starts_with(v116)
                        v117
                    }
                }
            let v122 =
                case v118 {
                    True -> {
                        let v119 = spiral_wrap_signed(v92 + 1, 32)
                        let v120 = spiral_string_length(v0)
                        let v121 = v119 == v120
                        v121
                    }
                    False -> {
                        False
                    }
                }
            case v122 {
                True -> {
                    let v123 = Uh5Nil
                    let v124 = Uh5Cons(v90, v91, v123)
                    let v125 = method9(v2, v124)
                    Us1Some(v125)
                }
                False -> {
                    Us1None
                }
            }
        }
    }
}

pub fn method12(v0: String, v1: Uh5, v2: Us3) -> Us3 {
    case v1  {
        Uh5Cons(v3, v4, v5) -> {
            let v6 = method12(v0, v5, v2)
            let v7 = v3 == v0
            case v7 {
                True -> {
                    Us3Some(v3, v4)
                }
                False -> {
                    v6
                }
            }
        }
        Uh5Nil -> {
            v2
        }
    }
}

pub fn value_of_11(v0: String, v1: Uh5) -> Us0 {
    let v2 = Us3None
    let v3 = method12(v0, v1, v2)
    case v3  {
        Us3None -> {
            Us0Null
        }
        Us3Some(v4, v5) -> {
            v5
        }
    }
}

pub fn text_at_10(v0: String, v1: Uh5) -> String {
    let v2 = value_of_11(v0, v1)
    case v2  {
        Us0Text(v3) -> {
            v3
        }
        _ -> {
            let v4 = ""
            v4
        }
    }
}

pub fn count_at_13(v0: String, v1: Uh5) -> Int {
    let v2 = value_of_11(v0, v1)
    case v2  {
        Us0Whole(v3) -> {
            v3
        }
        _ -> {
            -1
        }
    }
}

pub fn method14(v0: Uh0, v1: Uh0) -> Uh0 {
    case v0  {
        Uh0Cons(v2, v3, v4, v5, v6) -> {
            let v7 = method14(v6, v1)
            Uh0Cons(v2, v3, v4, v5, v7)
        }
        Uh0Nil -> {
            v1
        }
    }
}

pub fn method15(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = method15(v3, v1)
            Uh3Cons(v2, v4)
        }
        Uh3Nil -> {
            v1
        }
    }
}

pub fn method16(v0: Uh2, v1: Uh2) -> Uh2 {
    case v0  {
        Uh2Cons(v2, v3, v4) -> {
            let v5 = method16(v4, v1)
            Uh2Cons(v2, v3, v5)
        }
        Uh2Nil -> {
            v1
        }
    }
}
