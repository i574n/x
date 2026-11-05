import xsim_split/types.{type ListString, type Uh4, Uh4Nil, Us0OnX}
import xsim_split/part3.{closure0, closure11, closure12, file_cells_67, thread_on_75}

pub fn thread_of_74(v0: Int, v1: ListString, v2: Uh4) -> ListString {
    let v3 = Us0OnX
    thread_on_75(v3, v0, v1, v2)
}

pub fn closure13(capt: Nil) -> fn(String) -> ListString {
    fn (v0) {
        let v1 = 1
        let v2 = file_cells_67(v0)
        let v3 = Uh4Nil
        thread_of_74(v1, v2, v3)
    }
}

pub fn main() {
    let _v0 = closure0(Nil)
    let _ = Nil
    let _v1 = closure11(Nil)
    let _ = Nil
    let _v2 = closure12(Nil)
    let _ = Nil
    let _v3 = closure13(Nil)
    let _ = Nil
    0
}
