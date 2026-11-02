import gleam/bit_array
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/list
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type SpiralHashKind, type SpiralArrayStore, type SpiralArray, type SpiralRefCell, type SpiralRef, type Uh3, type Mut0, type Us0, type Uh5, type Us1, type Us2, type Us3, type Us4, Mut0, SpiralArray, SpiralRef, Uh3Cons, Uh3Nil, Uh5Cons, Uh5Nil, Us0Null, Us0Text, Us0Whole, Us1None, Us1Some, Us2None, Us2Some, Us3None, Us3Some, Us4None, Us4Some}

@external(erlang, "string", "find")
pub fn spiral_sm_find_trailing(text: String, search: String, direction: atom.Atom) -> Dynamic


@external(erlang, "gleam_stdlib", "identity")
pub fn spiral_sm_coerce(value: a) -> b

@ external(erlang, "unicode", "characters_to_binary")
pub fn unicode_erlang_characters_to_binary(chars: List(Int)) -> String

@external(erlang, "gleam_stdlib", "identity") pub fn erlang_term_coerce(value: a) -> b

@external(erlang, "erlang", "apply") pub fn erlang_term_apply(m: atom.Atom, f: atom.Atom, args: List(Dynamic)) -> Dynamic

@external(erlang, "erlang", "list_to_tuple") pub fn erlang_term_tuple(items: List(Dynamic)) -> Dynamic

@external(erlang, "crypto", "hash")
pub fn spiral_crypto_hash(kind: SpiralHashKind, data: String) -> BitArray

@ external(erlang, "lists", "sort") pub fn dictm_term_sorted(items: List(a)) -> List(a)

@external(erlang, "file", "read_file")
pub fn spiral_fs_read_file(path: String) -> Result(BitArray, Dynamic)


@external(erlang, "file", "write_file")
pub fn spiral_fs_write_file(path: String, data: String) -> Dynamic


@external(erlang, "filelib", "is_regular")
pub fn spiral_fs_is_regular(path: String) -> Bool


@external(erlang, "gleam_stdlib", "identity")
pub fn spiral_fs_coerce(value: a) -> b


@ external(erlang, "unicode", "characters_to_nfc_binary")
pub fn unicode_erlang_nfc(s: String) -> String

pub fn spiral_string_length(text: String) -> Int {
  bit_array.byte_size(bit_array.from_string(text))
}


@external(erlang, "simframes_ffi", "array_new")
@external(javascript, "./simframes_ffi.mjs", "array_new")
pub fn spiral_array_store_new(size: Int, fill: a) -> SpiralArrayStore(a)


@external(erlang, "simframes_ffi", "array_get")
@external(javascript, "./simframes_ffi.mjs", "array_get")
pub fn spiral_array_store_get(store: SpiralArrayStore(a), i: Int) -> a


@external(erlang, "simframes_ffi", "array_set")
@external(javascript, "./simframes_ffi.mjs", "array_set")
pub fn spiral_array_store_set(store: SpiralArrayStore(a), i: Int, value: a) -> Nil


pub fn spiral_array_create(size: Int) -> SpiralArray(a) {
  SpiralArray(store: spiral_array_store_new(size, option.None), size: size)
}



pub fn spiral_array_set(xs: SpiralArray(a), i: Int, value: a) -> Nil {
  case i >= 0 && i < xs.size {
    True -> spiral_array_store_set(xs.store, i, option.Some(value))
    False -> panic as "spiral array: index out of bounds"
  }
}


pub fn spiral_array_from_list(values: List(a)) -> SpiralArray(a) {
  let xs = spiral_array_create(list.length(values))
  let _ = list.index_map(values, fn(x, i) { spiral_array_set(xs, i, x) })
  xs
}



pub fn spiral_array_get(xs: SpiralArray(a), i: Int) -> a {
  case i >= 0 && i < xs.size {
    True ->
      case spiral_array_store_get(xs.store, i) {
        option.Some(x) -> x
        option.None -> panic as "spiral array: read of an element that was never set"
      }
    False -> panic as "spiral array: index out of bounds"
  }
}


@external(erlang, "simframes_ffi", "ref_new")
@external(javascript, "./simframes_ffi.mjs", "ref_new")
pub fn spiral_ref_cell_new(value: a) -> SpiralRefCell(a)


@external(erlang, "simframes_ffi", "ref_get")
@external(javascript, "./simframes_ffi.mjs", "ref_get")
pub fn spiral_ref_cell_get(cell: SpiralRefCell(a)) -> a


@external(erlang, "simframes_ffi", "ref_set")
@external(javascript, "./simframes_ffi.mjs", "ref_set")
pub fn spiral_ref_cell_set(cell: SpiralRefCell(a), value: a) -> Nil


pub fn spiral_ref_new(value: a) -> SpiralRef(a) {
  SpiralRef(cell: spiral_ref_cell_new(value))
}


pub fn spiral_ref_get(reference: SpiralRef(a)) -> a {
  spiral_ref_cell_get(reference.cell)
}


pub fn spiral_ref_set(reference: SpiralRef(a), value: a) -> Nil {
  spiral_ref_cell_set(reference.cell, value)
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


pub fn method3(v0: Int, v1: SpiralRef(Mut0)) -> Bool {
    let v2 = spiral_ref_get(v1).l0
    let v3 = v2 < v0
    v3
}
pub fn loop0 (v7: SpiralArray(String), v8: Int, v10: SpiralRef(Mut0)) {
    case method3(v8, v10) {
        True -> {
            let v12 = spiral_ref_get(v10).l0
            let v13 = spiral_ref_get(v10).l1
            let v14 = spiral_array_get(v7, v12)
            let v15 = spiral_wrap_signed(v12 + 1, 32)
            let v16 = Uh3Cons(v14, v13)
            spiral_ref_set(v10, Mut0(l0: v15, l1: v16))
            loop0(v7, v8, v10)
        }
        False -> v10
    }
}

pub fn method4(v0: Uh3, v1: Uh3) -> Uh3 {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = Uh3Cons(v2, v1)
            method4(v3, v4)
        }
        Uh3Nil -> v1
    }
}

pub fn split_list_2(v0: String, v1: String) -> Uh3 {
    let v2 = spiral_string_length(v0)
    let v3 = v2 == 0
    case v3 {
        True -> {
            let v4 = Uh3Nil
            Uh3Cons(v1, v4)
        }
        False -> {
            let v6 = v1 |> string.split(v0)
            let v7 = v6 |> spiral_array_from_list
            let v8 = v7.size
            let v9 = Uh3Nil
            let v10 = spiral_ref_new(Mut0(l0: 0, l1: v9))
            let v10 = loop0(v7, v8, v10)
            let v17 = spiral_ref_get(v10).l1
            let v18 = Uh3Nil
            method4(v17, v18)
        }
    }
}

pub fn closure1(capt: Nil) -> fn(String) -> Us2 {
    fn (v0) {
        Us2Some(v0)
    }
}

pub fn hex_at_8(v0: String, v1: Int) -> Int {
    let v2 = spiral_wrap_signed(v1 + 1, 32)
    let v3 = spiral_wrap_signed(v2 - 1, 32)
    let v4 = spiral_string_slice(v0, v1, v3)
    let v5 = v4 == ""
    let v16 =
        case v5 {
            True -> 0
            False -> {
                let v6 = "0123456789abcdefABCDEF"
                let v7 = option.from_result(result.map(string.split_once(v6, v4), pair.first))
                let v8 = closure1(Nil)
                let v9 = v7 |> option.map(v8)
                let v10 = Us2None
                let v11 = v9 |> option.unwrap(v10)
                case v11  {
                    Us2None -> -1
                    Us2Some(v12) -> {
                        let v13 = bit_array.byte_size(bit_array.from_string(v12))
                        v13
                    }
                }
            }
        }
    let v17 = v16 < 16
    case v17 {
        True -> v16
        False -> {
            let v18 = spiral_wrap_signed(v16 - 6, 32)
            v18
        }
    }
}

pub fn string_from_7(v0: String, v1: Int, v2: String) -> #(String, Int) {
    let v3 = spiral_string_length(v0)
    let v4 = spiral_wrap_signed(v3 - v1, 32)
    let v5 = spiral_wrap_signed(v1 + v4, 32)
    let v6 = spiral_wrap_signed(v5 - 1, 32)
    let v7 = spiral_string_slice(v0, v1, v6)
    let v8 = "\""
    let v9 = option.from_result(result.map(string.split_once(v7, v8), pair.first))
    let v10 = closure1(Nil)
    let v11 = v9 |> option.map(v10)
    let v12 = Us2None
    let v13 = v11 |> option.unwrap(v12)
    let v17 =
        case v13  {
            Us2None -> -1
            Us2Some(v14) -> {
                let v15 = bit_array.byte_size(bit_array.from_string(v14))
                v15
            }
        }
    let v18 = "\\"
    let v19 = option.from_result(result.map(string.split_once(v7, v18), pair.first))
    let v20 = v19 |> option.map(v10)
    let v21 = Us2None
    let v22 = v20 |> option.unwrap(v21)
    let v26 =
        case v22  {
            Us2None -> -1
            Us2Some(v23) -> {
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
                    True -> True
                    False -> {
                        let v29 = v26 < v17
                        v29
                    }
                }
            }
            False -> False
        }
    let v32 = v31 == False
    let #(v94, v95) =
        case v32 {
            True -> {
                let v33 = v17 < 0
                let #(v39, v40) =
                    case v33 {
                        True -> #(v2, -1)
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
                let #(v86, v87) =
                    case v46 {
                        True -> {
                            let v47 = hex_at_8(v0, v43)
                            let v48 = spiral_wrap_signed(v47 * 16, 32)
                            let v49 = spiral_wrap_signed(v43 + 1, 32)
                            let v50 = hex_at_8(v0, v49)
                            let v51 = spiral_wrap_signed(v48 + v50, 32)
                            let v52 = spiral_wrap_signed(v51 * 16, 32)
                            let v53 = spiral_wrap_signed(v43 + 2, 32)
                            let v54 = hex_at_8(v0, v53)
                            let v55 = spiral_wrap_signed(v52 + v54, 32)
                            let v56 = spiral_wrap_signed(v55 * 16, 32)
                            let v57 = spiral_wrap_signed(v43 + 3, 32)
                            let v58 = hex_at_8(v0, v57)
                            let v59 = spiral_wrap_signed(v56 + v58, 32)
                            let v60 = v59 >= 0
                            let v62 =
                                case v60 {
                                    True -> {
                                        let v61 = v59 <= 1114111
                                        v61
                                    }
                                    False -> False
                                }
                            let v66 =
                                case v62 {
                                    True -> {
                                        let v63 = v59 < 55296
                                        case v63 {
                                            True -> True
                                            False -> {
                                                let v64 = v59 > 57343
                                                v64
                                            }
                                        }
                                    }
                                    False -> False
                                }
                            let v69 =
                                case v66 {
                                    True -> {
                                        let v67 = unicode_erlang_characters_to_binary([v59])
                                        v67
                                    }
                                    False -> {
                                        let v68 = ""
                                        v68
                                    }
                                }
                            let v70 = spiral_wrap_signed(v42 + 5, 32)
                            #(v69, v70)
                        }
                        False -> {
                            let v71 = v45 == "n"
                            let v85 =
                                case v71 {
                                    True -> {
                                        let v72 = "\n"
                                        v72
                                    }
                                    False -> {
                                        let v73 = v45 == "t"
                                        case v73 {
                                            True -> {
                                                let v74 = "\t"
                                                v74
                                            }
                                            False -> {
                                                let v75 = v45 == "r"
                                                case v75 {
                                                    True -> {
                                                        let v76 = "\r"
                                                        v76
                                                    }
                                                    False -> {
                                                        let v77 = v45 == "b"
                                                        case v77 {
                                                            True -> {
                                                                let v78 = unicode_erlang_characters_to_binary([8])
                                                                v78
                                                            }
                                                            False -> {
                                                                let v79 = v45 == "f"
                                                                case v79 {
                                                                    True -> {
                                                                        let v80 = unicode_erlang_characters_to_binary([12])
                                                                        v80
                                                                    }
                                                                    False -> v45
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            #(v85, v43)
                        }
                    }
                let v88 = spiral_wrap_signed(v41 - 1, 32)
                let v89 = spiral_string_slice(v0, v1, v88)
                let v90 = v2 <> v89 
                let v91 = v90 <> v86 
                let #(v92, v93) = string_from_7(v0, v87, v91)
                #(v92, v93)
            }
        }
    #(v94, v95)
}

pub fn digits_end_9(v0: String, v1: Int) -> Int {
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
                    True -> True
                    False -> {
                        let v10 = string.inspect(1)
                        let v11 = v7 |> string.starts_with(v10)
                        case v11 {
                            True -> True
                            False -> {
                                let v12 = string.inspect(2)
                                let v13 = v7 |> string.starts_with(v12)
                                case v13 {
                                    True -> True
                                    False -> {
                                        let v14 = string.inspect(3)
                                        let v15 = v7 |> string.starts_with(v14)
                                        case v15 {
                                            True -> True
                                            False -> {
                                                let v16 = string.inspect(4)
                                                let v17 = v7 |> string.starts_with(v16)
                                                case v17 {
                                                    True -> True
                                                    False -> {
                                                        let v18 = string.inspect(5)
                                                        let v19 = v7 |> string.starts_with(v18)
                                                        case v19 {
                                                            True -> True
                                                            False -> {
                                                                let v20 = string.inspect(6)
                                                                let v21 = v7 |> string.starts_with(v20)
                                                                case v21 {
                                                                    True -> True
                                                                    False -> {
                                                                        let v22 = string.inspect(7)
                                                                        let v23 = v7 |> string.starts_with(v22)
                                                                        case v23 {
                                                                            True -> True
                                                                            False -> {
                                                                                let v24 = string.inspect(8)
                                                                                let v25 = v7 |> string.starts_with(v24)
                                                                                case v25 {
                                                                                    True -> True
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
            False -> False
        }
    case v37 {
        True -> {
            let v38 = spiral_wrap_signed(v1 + 1, 32)
            digits_end_9(v0, v38)
        }
        False -> v1
    }
}

pub fn digits_11(v0: String, v1: Int, v2: Int) -> Us3 {
    let v3 = spiral_string_length(v0)
    let v4 = v1 >= v3
    case v4 {
        True -> Us3Some(v2)
        False -> {
            let v6 = spiral_string_slice(v0, v1, v1)
            let v7 = v6 == ""
            let v18 =
                case v7 {
                    True -> 0
                    False -> {
                        let v8 = "0123456789"
                        let v9 = option.from_result(result.map(string.split_once(v8, v6), pair.first))
                        let v10 = closure1(Nil)
                        let v11 = v9 |> option.map(v10)
                        let v12 = Us2None
                        let v13 = v11 |> option.unwrap(v12)
                        case v13  {
                            Us2None -> -1
                            Us2Some(v14) -> {
                                let v15 = bit_array.byte_size(bit_array.from_string(v14))
                                v15
                            }
                        }
                    }
                }
            let v19 = v18 < 0
            let v21 =
                case v19 {
                    True -> True
                    False -> {
                        let v20 = v2 > 100000000
                        v20
                    }
                }
            case v21 {
                True -> Us3None
                False -> {
                    let v23 = spiral_wrap_signed(v1 + 1, 32)
                    let v24 = spiral_wrap_signed(v2 * 10, 32)
                    let v25 = spiral_wrap_signed(v24 + v18, 32)
                    digits_11(v0, v23, v25)
                }
            }
        }
    }
}

pub fn count_of_text_10(v0: String) -> Us3 {
    let v1 = v0 == ""
    let v24 =
        case v1 {
            True -> True
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
        True -> Us3None
        False -> {
            let v26 = 0
            let v27 = 0
            digits_11(v0, v26, v27)
        }
    }
}

pub fn method12(v0: Uh5, v1: Uh5) -> Uh5 {
    case v0  {
        Uh5Cons(v2, v3, v4) -> {
            let v5 = Uh5Cons(v2, v3, v1)
            method12(v4, v5)
        }
        Uh5Nil -> v1
    }
}

pub fn fields_from_6(v0: String, v1: Int, v2: Uh5) -> Us1 {
    let v3 = v1 < 0
    let v6 =
        case v3 {
            True -> True
            False -> {
                let v4 = spiral_string_length(v0)
                let v5 = v1 > v4
                v5
            }
        }
    let v14 =
        case v6 {
            True -> False
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
                let #(v17, v18) = string_from_7(v0, v15, v16)
                let v19 = v18 < 0
                let v22 =
                    case v19 {
                        True -> True
                        False -> {
                            let v20 = spiral_string_length(v0)
                            let v21 = v18 > v20
                            v21
                        }
                    }
                let v30 =
                    case v22 {
                        True -> False
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
                                    True -> True
                                    False -> {
                                        let v33 = spiral_string_length(v0)
                                        let v34 = v31 > v33
                                        v34
                                    }
                                }
                            let v43 =
                                case v35 {
                                    True -> False
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
                                    let #(v45, v46) = string_from_7(v0, v44, v16)
                                    let v47 = Us0Text(v45)
                                    #(v47, v46)
                                }
                                False -> {
                                    let v50 =
                                        case v32 {
                                            True -> True
                                            False -> {
                                                let v48 = spiral_string_length(v0)
                                                let v49 = v31 > v48
                                                v49
                                            }
                                        }
                                    let v58 =
                                        case v50 {
                                            True -> False
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
                                                    False -> False
                                                }
                                            case v64 {
                                                True -> {
                                                    let v65 = digits_end_9(v0, v31)
                                                    let v66 = spiral_wrap_signed(v65 - v31, 32)
                                                    let v67 = spiral_wrap_signed(v31 + v66, 32)
                                                    let v68 = spiral_wrap_signed(v67 - 1, 32)
                                                    let v69 = spiral_string_slice(v0, v31, v68)
                                                    let v70 = count_of_text_10(v69)
                                                    case v70  {
                                                        Us3None -> {
                                                            let v73 = Us0Null
                                                            #(v73, -1)
                                                        }
                                                        Us3Some(v71) -> {
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
            True -> True
            False -> {
                let v94 = spiral_string_length(v0)
                let v95 = v92 > v94
                v95
            }
        }
    let v104 =
        case v96 {
            True -> False
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
            fields_from_6(v0, v105, v106)
        }
        False -> {
            let v110 =
                case v93 {
                    True -> True
                    False -> {
                        let v108 = spiral_string_length(v0)
                        let v109 = v92 > v108
                        v109
                    }
                }
            let v118 =
                case v110 {
                    True -> False
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
                    False -> False
                }
            case v122 {
                True -> {
                    let v123 = Uh5Nil
                    let v124 = Uh5Cons(v90, v91, v123)
                    let v125 = method12(v2, v124)
                    Us1Some(v125)
                }
                False -> Us1None
            }
        }
    }
}

pub fn method15(v0: String, v1: Uh5) -> Us4 {
    case v1  {
        Uh5Cons(v3, v4, v5) -> {
            let v6 = v3 == v0
            case v6 {
                True -> Us4Some(v3, v4)
                False -> method15(v0, v5)
            }
        }
        Uh5Nil -> Us4None
    }
}

pub fn value_of_14(v0: String, v1: Uh5) -> Us0 {
    let v2 = method15(v0, v1)
    case v2  {
        Us4None -> Us0Null
        Us4Some(v3, v4) -> v4
    }
}

pub fn text_at_13(v0: String, v1: Uh5) -> String {
    let v2 = value_of_14(v0, v1)
    case v2  {
        Us0Text(v3) -> v3
        _ -> {
            let v4 = ""
            v4
        }
    }
}

pub fn count_at_16(v0: String, v1: Uh5) -> Int {
    let v2 = value_of_14(v0, v1)
    case v2  {
        Us0Whole(v3) -> v3
        _ -> -1
    }
}
