import gleam/erlang/atom
import xsim_frames/types.{Uh30Nil, Uh3Cons, Uh3Nil}
import xsim_frames/part1.{erlang_term_apply}
import xsim_frames/part12.{items_from_303}
import xsim_frames/part18.{closure29, method398}
import xsim_frames/part19.{closure108}
import xsim_frames/part20.{closure110}
import xsim_frames/part21.{closure116}
import xsim_frames/part22.{closure122}
import xsim_frames/part23.{closure130}
import xsim_frames/part24.{closure136}
import xsim_frames/part3.{closure0, closure5, closure7, closure9}
import xsim_frames/part36.{closure143}
import xsim_frames/part37.{started_686}
import xsim_frames/part5.{closure10, closure12, closure13, closure14}
import xsim_frames/part6.{closure15}
import xsim_frames/part8.{closure19, closure27, closure28}

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
        let v15 = items_from_303(v13, Uh30Nil)
        let v17 = method398(v15, Uh3Nil)
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
