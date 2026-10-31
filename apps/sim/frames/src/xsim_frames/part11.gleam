import gleam/order
import gleam/string
import xsim_frames/types.{type Uh3, type Uh19, type Uh20, Uh19Nil, Uh20Cons, Uh20Nil, Uh3Cons, Uh3Nil, Uh7Nil}
import xsim_frames/part1.{split_list_2, unicode_erlang_characters_to_binary}
import xsim_frames/part10.{closure19, closure27, method227}
import xsim_frames/part2.{method17}
import xsim_frames/part3.{closure0}
import xsim_frames/part4.{closure5, closure7, closure9, method52, method53}
import xsim_frames/part6.{closure10, closure12, from_cells_61, quoted_116}
import xsim_frames/part7.{closure13, closure14, closure15, closure16}
import xsim_frames/part8.{final_replay_144, method155}
import xsim_frames/part9.{shared_layout_202}

pub fn inserted_229(v0: String, v1: Uh3, v2: Uh20) -> Uh20 {
    case v2  {
        Uh20Cons(v3, v4, v5) -> {
            let v6 = string.compare(v0, v3) == order.Lt
            let v9 =
                case v6 {
                    True -> {
                        -1
                    }
                    False -> {
                        let v7 = string.compare(v0, v3) == order.Gt
                        case v7 {
                            True -> {
                                1
                            }
                            False -> {
                                0
                            }
                        }
                    }
                }
            let v10 = v9 == 1
            case v10 {
                True -> {
                    let v11 = inserted_229(v0, v1, v5)
                    Uh20Cons(v3, v4, v11)
                }
                False -> {
                    Uh20Cons(v0, v1, v2)
                }
            }
        }
        _ -> {
            Uh20Cons(v0, v1, v2)
        }
    }
}

pub fn method228(v0: Uh20, v1: Uh20) -> Uh20 {
    case v0  {
        Uh20Cons(v2, v3, v4) -> {
            let v5 = inserted_229(v2, v3, v1)
            method228(v4, v5)
        }
        Uh20Nil -> {
            v1
        }
    }
}

pub fn method230(v0: Uh20, v1: Uh3) -> Uh3 {
    case v0  {
        Uh20Cons(v2, v3, v4) -> {
            let v5 = method230(v4, v1)
            let v6 = 0
            let v7 = method17(v3, v6)
            let v8 = string.inspect(v7)
            let v9 = quoted_116(v2)
            let v10 = ": "
            let v11 = v9 <> v10 
            let v12 = v11 <> v8 
            Uh3Cons(v12, v5)
        }
        Uh20Nil -> {
            v1
        }
    }
}

pub fn final_json_226(v0: Uh19, v1: Uh20) -> String {
    let v2 = Uh19Nil
    let v3 = method155(v0, v2)
    let v4 = Uh3Nil
    let v5 = method227(v3, v4)
    let v6 = "["
    let v7 = "]"
    let v8 = 1
    let v9 = shared_layout_202(v5, v6, v7, v8)
    let v10 = "cells"
    let v11 = quoted_116(v10)
    let v12 = ": "
    let v13 = v11 <> v12 
    let v14 = v13 <> v9 
    let v15 = Uh20Nil
    let v16 = method228(v1, v15)
    let v17 = Uh3Nil
    let v18 = method230(v16, v17)
    let v19 = "{"
    let v20 = "}"
    let v21 = 1
    let v22 = shared_layout_202(v18, v19, v20, v21)
    let v23 = "likes"
    let v24 = quoted_116(v23)
    let v25 = v24 <> v12 
    let v26 = v25 <> v22 
    let v27 = Uh3Nil
    let v28 = Uh3Cons(v26, v27)
    let v29 = Uh3Cons(v14, v28)
    let v30 = 0
    let v31 = shared_layout_202(v29, v19, v20, v30)
    let v32 = "\n"
    let v33 = v31 <> v32 
    v33
}

pub fn scenario_final_225(v0: Int, v1: Int, v2: Int, v3: String, _v4: Int, _v5: Bool, _v6: fn(String) -> fn(Int) -> fn(String) -> Uh3, v7: Uh3) -> String {
    let v8 = ","
    let v9 = "+"
    let v10 = v3 |> string.replace(v8, v9)
    let v11 = v10 == ""
    let v14 =
        case v11 {
            True -> {
                Uh3Nil
            }
            False -> {
                split_list_2(v9, v10)
            }
        }
    let v15 = Uh3Nil
    let v16 = method52(v14, v15)
    let v17 = Uh7Nil
    let v18 = method53(v16, v17)
    let v19 = 0
    let v20 = 0
    let v21 = False
    let v22 = ""
    let #(_v23, v24, _v25) = from_cells_61(v0, v1, v2, v19, v20, v18, v21, v22, v7)
    let #(v26, v27) = final_replay_144(v24)
    final_json_226(v26, v27)
}

pub fn closure28(capt: Nil) -> fn(#(String, Int, Int, Int, String, Int, Bool)) -> String {
    fn (dom) {
        let #(v0, v1, v2, v3, v4, v5, v6) = dom
        let v7 = closure16(Nil)
        let v8 = unicode_erlang_characters_to_binary([0])
        let v9 = split_list_2(v8, v0)
        scenario_final_225(v1, v2, v3, v4, v5, v6, v7, v9)
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
    0
}
