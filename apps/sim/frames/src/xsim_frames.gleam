import xsim_frames/part20.{closure29}
import xsim_frames/part21.{closure110}
import xsim_frames/part22.{closure112}
import xsim_frames/part23.{closure118}
import xsim_frames/part24.{closure124}
import xsim_frames/part25.{closure132}
import xsim_frames/part26.{closure138}
import xsim_frames/part3.{closure0, closure5, closure7, closure9}
import xsim_frames/part37.{closure144}
import xsim_frames/part5.{closure10, closure12}
import xsim_frames/part6.{closure13, closure14, closure15}
import xsim_frames/part9.{closure19, closure27, closure28}

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

pub fn simulated_lines(v0: String, v1: String, v2: String) -> String {
  closure29(Nil)(#(v0, v1, v2))
}

pub fn cli_run(v0: String) -> Int {
  closure110(Nil)(v0)
}

pub fn cli_events(v0: String) -> Int {
  closure112(Nil)(v0)
}

pub fn cli_world(v0: String) -> Int {
  closure118(Nil)(v0)
}

pub fn cli_frames(v0: String) -> Int {
  closure124(Nil)(v0)
}

pub fn cli_thread_run(v0: String) -> Int {
  closure132(Nil)(v0)
}

pub fn cli_diff(v0: String) -> Int {
  closure138(Nil)(v0)
}

pub fn cli_serve(v0: String) -> Int {
  closure144(Nil)(v0)
}
