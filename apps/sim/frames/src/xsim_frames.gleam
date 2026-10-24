import xsim_frames/types.{type Uh3}
import xsim_frames/part10.{closure12, closure15, closure16, closure17, closure18, closure19}
import xsim_frames/part3.{closure0, closure1, closure2, closure3}
import xsim_frames/part6.{closure4, closure6, closure7, closure8}
import xsim_frames/part7.{closure9}

pub fn checked_text(v0: String) -> String {
  closure0(Nil)(v0)
}

pub fn commute_text(v0: String, v1: String) -> String {
  closure1(Nil)(#(v0, v1))
}

pub fn breaking_text(v0: String) -> String {
  closure2(Nil)(v0)
}

pub fn masked_text(v0: String) -> String {
  closure3(Nil)(v0)
}

pub fn corpus_raw(v0: String, v1: Int, v2: Int, v3: Int, v4: Int, v5: Int, v6: String, v7: Bool, v8: Int, v9: Int) -> #(String, String) {
  closure4(Nil)(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9))
}

pub fn cells_raw(v0: String, v1: Int, v2: Int, v3: Int, v4: Int, v5: Int, v6: String, v7: Bool, v8: Int, v9: Int) -> #(String, String) {
  closure6(Nil)(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9))
}

pub fn rescheduled(v0: String, v1: Int, v2: Int, v3: Int) -> String {
  closure7(Nil)(#(v0, v1, v2, v3))
}

pub fn break_source(v0: String) -> String {
  closure8(Nil)(v0)
}

pub fn corpus_run(v0: String, v1: Int, v2: Int, v3: Int, v4: Int, v5: Int, v6: String, v7: Bool, v8: Int, v9: Int) -> #(String, Int, Int, String) {
  closure9(Nil)(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9))
}

pub fn world_files(v0: String, v1: Int, v2: Int, v3: String, v4: Int, v5: Int, v6: Int, v7: String, v8: String, v9: String) -> #(String, String) {
  closure12(Nil)(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9))
}

pub fn split_cell(v0: String, v1: Int, v2: String) -> Uh3 {
  closure15(Nil)(#(v0, v1, v2))
}

pub fn file_cells(v0: String) -> Uh3 {
  closure16(Nil)(v0)
}

pub fn thread_posts(v0: String) -> Uh3 {
  closure17(Nil)(v0)
}

pub fn scenario_stream(v0: String, v1: Int, v2: Int, v3: Int, v4: String, v5: Int, v6: Bool) -> String {
  closure18(Nil)(#(v0, v1, v2, v3, v4, v5, v6))
}

pub fn scenario_final(v0: String, v1: Int, v2: Int, v3: Int, v4: String, v5: Int, v6: Bool) -> String {
  closure19(Nil)(#(v0, v1, v2, v3, v4, v5, v6))
}
