import xsim_split/types.{type ListString}
import xsim_split/part3.{closure0}
import xsim_split/part4.{closure11, closure12, closure13}

pub fn split_cell(v0: String, v1: Int, v2: String) -> ListString {
  closure0(Nil)(#(v0, v1, v2))
}

pub fn split_cell_joined(v0: String, v1: Int, v2: String) -> String {
  closure11(Nil)(#(v0, v1, v2))
}

pub fn file_cells(v0: String) -> ListString {
  closure12(Nil)(v0)
}

pub fn thread_posts(v0: String) -> ListString {
  closure13(Nil)(v0)
}
