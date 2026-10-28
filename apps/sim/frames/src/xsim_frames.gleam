import xsim_frames/part10.{closure19, closure27}
import xsim_frames/part11.{closure28}
import xsim_frames/part3.{closure0}
import xsim_frames/part4.{closure5, closure7, closure9}
import xsim_frames/part6.{closure10, closure12}
import xsim_frames/part7.{closure13, closure14, closure15}

pub fn checked_text(v0: String) -> String {
  closure0(Nil)(v0)
}

pub fn commute_text(v0: String, v1: String) -> String {
  closure5(Nil)(#(v0, v1))
}

pub fn breaking_text(v0: String) -> String {
  closure7(Nil)(v0)
}

pub fn masked_text(v0: String) -> String {
  closure9(Nil)(v0)
}

pub fn corpus_raw(v0: String, v1: Int, v2: Int, v3: Int, v4: Int, v5: Int, v6: String, v7: Bool, v8: Int, v9: Int) -> #(String, String) {
  closure10(Nil)(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9))
}

pub fn cells_raw(v0: String, v1: Int, v2: Int, v3: Int, v4: Int, v5: Int, v6: String, v7: Bool, v8: Int, v9: Int) -> #(String, String) {
  closure12(Nil)(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9))
}

pub fn rescheduled(v0: String, v1: Int, v2: Int, v3: Int) -> String {
  closure13(Nil)(#(v0, v1, v2, v3))
}

pub fn break_source(v0: String) -> String {
  closure14(Nil)(v0)
}

pub fn corpus_run(v0: String, v1: Int, v2: Int, v3: Int, v4: Int, v5: Int, v6: String, v7: Bool, v8: Int, v9: Int) -> #(String, Int, Int, String) {
  closure15(Nil)(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9))
}

pub fn world_files(v0: String, v1: Int, v2: Int, v3: String, v4: Int, v5: Int, v6: Int, v7: String, v8: String, v9: String) -> #(String, String) {
  closure19(Nil)(#(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9))
}

pub fn scenario_stream(v0: String, v1: Int, v2: Int, v3: Int, v4: String, v5: Int, v6: Bool) -> String {
  closure27(Nil)(#(v0, v1, v2, v3, v4, v5, v6))
}

pub fn scenario_final(v0: String, v1: Int, v2: Int, v3: Int, v4: String, v5: Int, v6: Bool) -> String {
  closure28(Nil)(#(v0, v1, v2, v3, v4, v5, v6))
}
