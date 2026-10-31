#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
fn string_slice(value: &str, from: i64, to: i64) -> Rc<str> {
    let bytes = value.as_bytes();
    let length = bytes.len() as i64;
    if from < 0 || from > length || to < from - 1 || to >= length { std::process::abort(); }
    if to < from { return { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }; }
    if (bytes[from as usize] & 0xC0) == 0x80 || (to + 1 < length && (bytes[(to + 1) as usize] & 0xC0) == 0x80) { std::process::exit(3); }
    let slice = &bytes[from as usize..(to + 1) as usize];
    match std::str::from_utf8(slice) { Ok(text) => Rc::<str>::from(text), Err(error) => Rc::<str>::from(std::str::from_utf8(&slice[..error.valid_up_to()]).unwrap_or("")) }
}
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(serde_json::Value, Rc<UH0>),
}
#[derive(Clone)]
enum US0 {
    US0_Ok(Rc<str>),
    US0_Error(Rc<str>),
}
fn from_2(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let mut v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v6.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v7.clone());
            continue;
        }
    }
}
fn method3(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: serde_json::Value = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3.clone(), v4);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn method1(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: serde_json::Value = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("role"); } LIT.with(|lit| lit.clone()) };
                let v5: serde_json::Value = v2.get(&*v4).cloned().unwrap_or_default();
                let mut v6: Rc<str> = Rc::<str>::from(v5.as_str().unwrap_or(""));
                let v7: bool = &*v6 == "primary";
                let v9: bool = if v7 {
                    true
                } else {
                    let v8: bool = &*v6 == "lookup";
                    v8
                };
                let v33: i32 = if v9 {
                    let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("doc"); } LIT.with(|lit| lit.clone()) };
                    let v11: serde_json::Value = v2.get(&*v10).cloned().unwrap_or_default();
                    let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
                    let mut v13: serde_json::Value = v11.get(&*v12).cloned().unwrap_or_default();
                    let v14: usize = v13.as_array().map_or(0, Vec::len);
                    let v15: i32 = ((v14) as i32);
                    let v16: i32 = v15.wrapping_sub(1i32);
                    let v17: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let v18: Rc<UH0> = from_2(v13.clone(), v16, v17.clone());
                    let v19: i32 = 0i32;
                    let v20: i32 = method3(v18.clone(), v19);
                    let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("includes"); } LIT.with(|lit| lit.clone()) };
                    let v22: serde_json::Value = v11.get(&*v21).cloned().unwrap_or_default();
                    let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts"); } LIT.with(|lit| lit.clone()) };
                    let mut v24: serde_json::Value = v22.get(&*v23).cloned().unwrap_or_default();
                    let v25: usize = v24.as_array().map_or(0, Vec::len);
                    let v26: i32 = ((v25) as i32);
                    let v27: i32 = v26.wrapping_sub(1i32);
                    let v28: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let v29: Rc<UH0> = from_2(v24.clone(), v27, v28.clone());
                    let v30: i32 = 0i32;
                    let v31: i32 = method3(v29.clone(), v30);
                    let v32: i32 = v20.wrapping_add(v31);
                    v32
                } else {
                    0i32
                };
                let v34: i32 = v1.wrapping_add(v33);
                (v0, v1) = (v3.clone(), v34);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn posts_read_0(mut v0: Rc<str>) -> i32 {
    let mut v1: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v0).unwrap_or_default();
    let v2: usize = v1.as_array().map_or(0, Vec::len);
    let v3: i32 = ((v2) as i32);
    let v4: i32 = v3.wrapping_sub(1i32);
    let v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v6: Rc<UH0> = from_2(v1.clone(), v4, v5.clone());
    let v7: i32 = 0i32;
    method1(v6.clone(), v7)
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> i32> = Rc::new(move |mut v0: Rc<str>| -> i32 {
        posts_read_0(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn single_line_6(mut v0: Rc<str>) -> Rc<str> {
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
    let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
    let v3: Rc<str> = Rc::<str>::from(v0.replace(&*v1, &*v2));
    let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let v5: Rc<str> = Rc::<str>::from(v3.replace(&*v4, &*v2));
    let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
    let v7: Rc<str> = Rc::<str>::from(v5.replace(&*v6, &*v2));
    let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
    let v9: Rc<str> = Rc::<str>::from(v7.replace(&*v8, &*v2));
    v9.clone()
}
fn classified_5(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>) -> US0 {
    let v3: bool = v1 >= 200i32;
    let v5: bool = if v3 {
        let v4: bool = v1 < 300i32;
        v4
    } else {
        false
    };
    if v5 {
        let mut v6: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v2).unwrap_or_default();
        let v7: bool = v6.is_null();
        if v7 {
            let v8: i32 = (v2.clone().len() as i32);
            let v9: bool = v8 <= 300i32;
            let mut v13: Rc<str> = if v9 {
                v2.clone()
            } else {
                let v10: Rc<str> = string_slice(&v2.clone(), 0i32 as i64, 299i32 as i64);
                let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("..."); } LIT.with(|lit| lit.clone()) };
                let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v11));
                v12.clone()
            };
            let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
            let v15: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v0));
            let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let v18: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v15, v16)), v13));
            US0::US0_Error(v18.clone())
        } else {
            US0::US0_Ok(v2.clone())
        }
    } else {
        let v22: bool = v1 == 0i32;
        let v63: Rc<str> = if v22 {
            let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
            let mut v24: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v0));
            let v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let v27: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v24, v25)), v2));
            v27.clone()
        } else {
            let v28: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v2).unwrap_or_default();
            let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
            let v30: serde_json::Value = v28.get(&*v29).cloned().unwrap_or_default();
            let v31: Rc<str> = Rc::<str>::from(v30.as_str().unwrap_or(""));
            let v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
            let v33: serde_json::Value = v28.get(&*v32).cloned().unwrap_or_default();
            let v34: Rc<str> = Rc::<str>::from(v33.as_str().unwrap_or(""));
            let v35: bool = &*v31 != "";
            let v37: bool = if v35 {
                let v36: bool = &*v34 != "";
                v36
            } else {
                false
            };
            let v39: bool = if v37 {
                let v38: bool = &*v31 != &*v34;
                v38
            } else {
                false
            };
            let v53: Rc<str> = if v39 {
                let v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                let v42: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v31, v40)), v34));
                v42.clone()
            } else {
                let v43: bool = &*v34 != "";
                if v43 {
                    v34.clone()
                } else {
                    if v35 {
                        v31.clone()
                    } else {
                        let v44: Rc<str> = single_line_6(v2.clone());
                        let v45: i32 = (v44.clone().len() as i32);
                        let v46: bool = v45 <= 300i32;
                        if v46 {
                            v44.clone()
                        } else {
                            let v47: Rc<str> = string_slice(&v44.clone(), 0i32 as i64, 299i32 as i64);
                            let v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("..."); } LIT.with(|lit| lit.clone()) };
                            let v49: Rc<str> = Rc::<str>::from(format!("{}{}", v47, v48));
                            v49.clone()
                        }
                    }
                }
            };
            let v54: Rc<str> = Rc::<str>::from(format!("{:?}", v1));
            let v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
            let v56: Rc<str> = Rc::<str>::from(format!("{}{}", v55, v54));
            let v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
            let v59: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v56, v57)), v0));
            let v60: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let v62: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v59, v60)), v53));
            v62.clone()
        };
        US0::US0_Error(v63.clone())
    }
}
fn classified_reply_4(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>) -> (i32, Rc<str>) {
    let v3: US0 = classified_5(v0, v1, v2);
    match &v3 {
        US0::US0_Error(v5) => {
            let v5: Rc<str> = v5.clone();
            (4i32, v5)
        }
        US0::US0_Ok(v4) => {
            let v4: Rc<str> = v4.clone();
            (0i32, v4)
        }
    }
}
fn closure1() -> Rc<dyn Fn(Rc<str>, i32, Rc<str>) -> (i32, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32, Rc<str>) -> (i32, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>| -> (i32, Rc<str>) {
        classified_reply_4(v0.clone(), v1, v2.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_posts_read(v0: &str) -> i32 {
    closure0()(Rc::<str>::from(v0))
}
pub fn xc_classified(v0: &str, v1: i32, v2: &str) -> (i32, Rc<str>) {
    closure1()(Rc::<str>::from(v0), v1, Rc::<str>::from(v2))
}
