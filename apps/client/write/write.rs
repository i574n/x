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
enum US0 {
    US0_Ok(Rc<dyn Fn(i32) -> Rc<str>>),
    US0_Error(Rc<str>),
}
#[derive(Clone)]
enum US1 {
    US1_Ok(Rc<str>, Rc<str>, Rc<str>),
    US1_Error(Rc<str>),
}
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
#[derive(Clone)]
enum US2 {
    US2_Unstarted,
    US2_After(Rc<str>, Rc<str>, Rc<str>),
}
#[derive(Clone)]
enum US3 {
    US3_Ok(Rc<str>, Rc<str>, Rc<str>),
    US3_Error(Rc<str>),
}
#[derive(Clone)]
enum US4 {
    US4_Ok(Rc<str>),
    US4_Error(Rc<str>),
}
pub struct Mut0 { pub l0: i32, pub l1: Rc<UH0> }
fn get_environment_variable_0(mut v0: Rc<str>) -> Rc<str> {
    let mut v1: Rc<str> = Rc::<str>::from(std::env::var(&*v0).unwrap_or_default());
    v1
}
fn method1(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> i32 {
    loop {
        let v3: bool = v2 >= v1;
        if v3 {
            return v1;
        } else {
            let v4: u8 = v0.clone().as_bytes()[v2 as usize];
            let v5: bool = v4 == b' ';
            let v11: bool = if v5 {
                true
            } else {
                let mut v6: bool = v4 == b'\t';
                if v6 {
                    true
                } else {
                    let mut v7: bool = v4 == b'\r';
                    if v7 {
                        true
                    } else {
                        let v8: bool = v4 == b'\n';
                        v8
                    }
                }
            };
            if v11 {
                let v12: i32 = v2.wrapping_add(1i32);
                v2 = v12;
                continue;
            } else {
                return v2;
            }
        }
    }
}
fn method2(mut v0: Rc<str>, mut v1: i32) -> i32 {
    loop {
        let mut v2: bool = v1 <= 0i32;
        if v2 {
            return -1i32;
        } else {
            let v3: i32 = v1.wrapping_sub(1i32);
            let v4: u8 = v0.clone().as_bytes()[v3 as usize];
            let v5: bool = v4 == b' ';
            let v11: bool = if v5 {
                true
            } else {
                let mut v6: bool = v4 == b'\t';
                if v6 {
                    true
                } else {
                    let mut v7: bool = v4 == b'\r';
                    if v7 {
                        true
                    } else {
                        let v8: bool = v4 == b'\n';
                        v8
                    }
                }
            };
            if v11 {
                v1 = v3;
                continue;
            } else {
                return v3;
            }
        }
    }
}
fn closure1(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: i32, mut v9: Rc<str>, mut v10: Rc<str>, mut v11: Rc<str>, mut v12: Rc<str>, mut v13: Rc<str>) -> Rc<dyn Fn(i32) -> Rc<str>> {
    Rc::new(move |mut v14: i32| -> Rc<str> {
        let v15: serde_json::Value = serde_json::json!({"base": &*v0, "name": &*v11, "token": &*v12, "repo": &*v13});
        let v16: serde_json::Value = serde_json::json!({"ck": &*v2, "cs": &*v3, "t": &*v4, "ts": &*v5});
        let v17: bool = v14 == 0i32;
        let v20: Rc<str> = if v17 {
            v6.clone()
        } else {
            let v18: Rc<str> = Rc::<str>::from((v14).to_string());
            let v19: Rc<str> = Rc::<str>::from(format!("{}{}", v6.clone(), v18));
            v19
        };
        let v21: i32 = i32::from_str_radix(&*(v7.clone()), 10u32).unwrap();
        let v22: i32 = v21.wrapping_add(v14);
        let v23: Rc<str> = Rc::<str>::from((v22).to_string());
        let mut v24: serde_json::Value = serde_json::json!({"nonce": &*v20, "stamp": &*v7, "seconds": &*v23});
        let v25: Rc<str> = Rc::<str>::from(serde_json::json!({"who": v15, "keys": v16, "clock": v24}).to_string());
        v25
    })
}
fn closure2(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: i32, mut v9: Rc<str>, mut v10: Rc<str>, mut v11: Rc<str>, mut v12: Rc<str>) -> Rc<dyn Fn(i32) -> Rc<str>> {
    Rc::new(move |mut v13: i32| -> Rc<str> {
        let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let v15: serde_json::Value = serde_json::json!({"base": &*v0, "name": &*v11, "token": &*v12, "repo": &*v14});
        let v16: serde_json::Value = serde_json::json!({"ck": &*v2, "cs": &*v3, "t": &*v4, "ts": &*v5});
        let v17: bool = v13 == 0i32;
        let v20: Rc<str> = if v17 {
            v6.clone()
        } else {
            let v18: Rc<str> = Rc::<str>::from((v13).to_string());
            let v19: Rc<str> = Rc::<str>::from(format!("{}{}", v6.clone(), v18));
            v19
        };
        let v21: i32 = i32::from_str_radix(&*(v7.clone()), 10u32).unwrap();
        let v22: i32 = v21.wrapping_add(v13);
        let v23: Rc<str> = Rc::<str>::from((v22).to_string());
        let mut v24: serde_json::Value = serde_json::json!({"nonce": &*v20, "stamp": &*v7, "seconds": &*v23});
        let v25: Rc<str> = Rc::<str>::from(serde_json::json!({"who": v15, "keys": v16, "clock": v24}).to_string());
        v25
    })
}
fn method6(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
                let v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3, v4);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn method7(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
                let v4: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2, v1));
                (v0, v1) = (v3, v4);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn method8(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3;
                let v4: Rc<UH0> = v4;
                v0.borrow_mut().push(v3);
                let v5: i32 = v2.wrapping_add(1i32);
                (v1, v2) = (v4, v5);
                continue;
            }
            UH0::UH0_Nil => {
                return v2;
            }
        }
    }
}
fn method9(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure3() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let mut v1: usize = (v0);
        let mut v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn chained_5(mut v0: Rc<dyn Fn(i32) -> Rc<str>>, mut v1: Rc<UH0>, mut v2: US2, mut v3: US2, mut v4: Rc<UH0>, mut v5: Rc<UH0>, mut v6: bool) -> (i32, Rc<str>) {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH0::UH0_Cons(v16, v17) => {
                let v16: Rc<str> = v16;
                let v17: Rc<UH0> = v17;
                let v18: i32 = 0i32;
                let v19: i32 = method6(v5.clone(), v18);
                let v20: i32 = v19.wrapping_add(1i32);
                let v21: Rc<str> = v0(v20);
                let v38: Rc<str> = match v3 {
                    US2::US2_After(v23, v24, v25) => {
                        let v23: Rc<str> = v23;
                        let mut v24: Rc<str> = v24;
                        let v25: Rc<str> = v25;
                        match &v2 {
                            US2::US2_After(v26, v27, v28) => {
                                let v26: Rc<str> = v26.clone();
                                let v27: Rc<str> = v27.clone();
                                let v28: Rc<str> = v28.clone();
                                let v29: serde_json::Value = serde_json::json!({"id": &*v26, "cid": &*v28});
                                let v30: serde_json::Value = serde_json::json!({"id": &*v23, "cid": &*v25});
                                let v31: Rc<str> = Rc::<str>::from(serde_json::json!({"kind": "answer", "text": &*v16, "root": v29, "parent": v30}).to_string());
                                v31
                            }
                            US2::US2_Unstarted => {
                                let v32: serde_json::Value = serde_json::json!({"id": &*v23, "cid": &*v25});
                                let v33: serde_json::Value = serde_json::json!({"id": &*v23, "cid": &*v25});
                                let v34: Rc<str> = Rc::<str>::from(serde_json::json!({"kind": "answer", "text": &*v16, "root": v32, "parent": v33}).to_string());
                                v34
                            }
                        }
                    }
                    US2::US2_Unstarted => {
                        let v22: Rc<str> = Rc::<str>::from(serde_json::json!({"kind": "fresh", "text": &*v16}).to_string());
                        v22
                    }
                };
                let (mut v39, mut v40, mut v41, mut v42): (i32, Rc<str>, Rc<str>, Rc<str>) = xc_requests::xc_create(&*v21, &*v38);
                let v43: bool = v39 == 0i32;
                let v47: US3 = if v43 {
                    let v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    US3::US3_Ok(v40, v44, v41)
                } else {
                    US3::US3_Error(v42)
                };
                match v47 {
                    US3::US3_Error(v73) => {
                        let v73: Rc<str> = v73;
                        let v74: i32 = 0i32;
                        let v75: i32 = method6(v5.clone(), v74);
                        let v76: bool = v75 == 0i32;
                        let v88: Rc<str> = if v76 {
                            let v77: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                            v77
                        } else {
                            let v78: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                            let v79: Rc<UH0> = method7(v5.clone(), v78);
                            let v80: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                            let v81: i32 = 0i32;
                            let v82: i32 = method8(v80.clone(), v79, v81);
                            let v83: Rc<Vec<Rc<str>>> = Rc::new(v80.borrow().clone());
                            let v84: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v83).as_ref().clone()));
                            let v85: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
                            let v86: Rc<str> = Rc::<str>::from((*v84.borrow()).join(&*v85));
                            let v87: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; posted before it: "); } LIT.with(|lit| lit.clone()) }, v86));
                            v87
                        };
                        let v89: Rc<str> = Rc::<str>::from(format!("{}{}", v73, v88));
                        let v90: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                        let v91: Rc<UH0> = method7(v5, v90);
                        let v100: Rc<str> = if v6 {
                            let v92: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; continue with the same --resume command"); } LIT.with(|lit| lit.clone()) };
                            v92
                        } else {
                            match Rc::unwrap_or_clone(v91) {
                                UH0::UH0_Cons(v93, v94) => {
                                    let v93: Rc<str> = v93;
                                    let v94: Rc<UH0> = v94;
                                    let v95: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; continue with: xc post-thread --resume "); } LIT.with(|lit| lit.clone()) }, v93));
                                    let v96: Rc<str> = Rc::<str>::from(format!("{}{}", v95, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" FILE"); } LIT.with(|lit| lit.clone()) }));
                                    v96
                                }
                                UH0::UH0_Nil => {
                                    let v97: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                                    v97
                                }
                            }
                        };
                        let v101: Rc<str> = Rc::<str>::from(format!("{}{}", v89, v100));
                        return (4i32, v101);
                    }
                    US3::US3_Ok(v48, v49, v50) => {
                        let v48: Rc<str> = v48;
                        let v49: Rc<str> = v49;
                        let v50: Rc<str> = v50;
                        let v51: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posted "); } LIT.with(|lit| lit.clone()) }, v48.clone()));
                        let v52: Rc<str> = Rc::<str>::from(format!("{}{}", v51, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) }));
                        let v53: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                        let v54: Option<usize> = v16.find(&*v53);
                        let v55: Option<usize> = method9(v54);
                        let mut v56: Rc<dyn Fn((usize)) -> i32> = closure3();
                        let mut v57: Option<i32> = v55.map(|x| v56(x));
                        let v59: i32 = v57.unwrap_or(-1i32);
                        let v60: bool = v59 < 0i32;
                        let v64: Rc<str> = if v60 {
                            v16
                        } else {
                            let v61: usize = ((0i32) as usize);
                            let v62: usize = ((v59) as usize);
                            let v63: Rc<str> = Rc::<str>::from(&(v16)[v61..v62]);
                            v63
                        };
                        let v65: Rc<str> = Rc::<str>::from(format!("{}{}", v52, v64));
                        let v67: US2 = match &v2 {
                            US2::US2_Unstarted => {
                                US2::US2_After(v48.clone(), v49.clone(), v50.clone())
                            }
                            _ => {
                                v2
                            }
                        };
                        let v68: US2 = US2::US2_After(v48.clone(), v49, v50);
                        let v69: Rc<UH0> = Rc::new(UH0::UH0_Cons(v65, v4));
                        let v70: Rc<UH0> = Rc::new(UH0::UH0_Cons(v48, v5));
                        (v1, v2, v3, v4, v5) = (v17, v67, v68, v69, v70);
                        continue;
                    }
                }
            }
            UH0::UH0_Nil => {
                let mut v7: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let v8: Rc<UH0> = method7(v4, v7);
                let mut v9: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                let v10: i32 = 0i32;
                let v11: i32 = method8(v9.clone(), v8, v10);
                let v12: Rc<Vec<Rc<str>>> = Rc::new(v9.borrow().clone());
                let v13: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v12).as_ref().clone()));
                let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                let v15: Rc<str> = Rc::<str>::from((*v13.borrow()).join(&*v14));
                return (0i32, v15);
            }
        }
    }
}
fn from_10(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2;
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let mut v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
            let v8: Rc<UH0> = Rc::new(UH0::UH0_Cons(v7, v2));
            (v1, v2) = (v4, v8);
            continue;
        }
    }
}
fn resume_written_4(mut v0: Rc<dyn Fn(i32) -> Rc<str>>, mut v1: Rc<str>, mut v2: Rc<str>) -> (i32, Rc<str>) {
    let (mut v3, mut v4, mut v5): (i32, i32, Rc<str>) = xc_resume::xc_resume_plan(&*v2);
    let mut v6: bool = v3 != 0i32;
    if v6 {
        (4i32, v5)
    } else {
        let mut v7: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v5).unwrap_or_default();
        let v8: usize = v7.as_array().map_or(0, Vec::len);
        let mut v9: i32 = ((v8) as i32);
        let v10: i32 = v9.wrapping_sub(1i32);
        let v11: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v12: Rc<UH0> = from_10(v7, v10, v11);
        let v13: i32 = 0i32;
        let v14: i32 = method6(v12.clone(), v13);
        let v15: i32 = v4.wrapping_add(v14);
        let v16: Rc<str> = Rc::<str>::from((v4).to_string());
        let v17: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("resumed after post "); } LIT.with(|lit| lit.clone()) }, v16));
        let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" of "); } LIT.with(|lit| lit.clone()) }));
        let v19: Rc<str> = Rc::<str>::from((v15).to_string());
        let v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v19));
        let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let v22: US2 = US2::US2_After(v1.clone(), v21.clone(), v21.clone());
        let v23: US2 = US2::US2_After(v1, v21.clone(), v21);
        let mut v24: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v25: Rc<UH0> = Rc::new(UH0::UH0_Cons(v20, v24));
        let v26: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v27: bool = true;
        chained_5(v0, v12, v22, v23, v25, v26, v27)
    }
}
fn method12(mut v0: Rc<dyn Fn(i32) -> Rc<str>>, mut v1: Rc<UH0>, mut v2: Rc<UH0>, mut v3: bool) -> (Rc<UH0>, bool) {
    let (mut v34, mut v35): (Rc<UH0>, bool) = match &*v1 {
        UH0::UH0_Cons(v4, v5) => {
            let v4: Rc<str> = v4.clone();
            let v5: Rc<UH0> = v5.clone();
            let mut v6: i32 = 0i32;
            let mut v7: i32 = method6(v2.clone(), v6);
            let v8: i32 = v7.wrapping_add(1i32);
            let mut v9: Rc<str> = v0(v8);
            let v10: Rc<str> = Rc::<str>::from(serde_json::json!({"kind": "removal", "text": &*v4}).to_string());
            let (mut v11, mut v12, mut v13): (i32, bool, Rc<str>) = xc_requests::xc_delete(&*v9, &*v10);
            let v14: bool = v11 != 0i32;
            let v21: US4 = if v14 {
                US4::US4_Error(v13)
            } else {
                if v12 {
                    let v16: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("deleted "); } LIT.with(|lit| lit.clone()) }, v4));
                    US4::US4_Ok(v16)
                } else {
                    let v18: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not deleted "); } LIT.with(|lit| lit.clone()) }, v4));
                    US4::US4_Error(v18)
                }
            };
            let (mut v28, mut v29): (Rc<UH0>, bool) = match &v21 {
                US4::US4_Ok(v22) => {
                    let v22: Rc<str> = v22.clone();
                    let v23: Rc<UH0> = Rc::new(UH0::UH0_Cons(v22, v2));
                    (v23, v3)
                }
                _ => {
                    let (mut v26, mut v27): (Rc<UH0>, bool) = match v21 {
                        US4::US4_Error(v24) => {
                            let mut v24: Rc<str> = v24;
                            let v25: Rc<UH0> = Rc::new(UH0::UH0_Cons(v24, v2));
                            (v25, true)
                        }
                        _ => unreachable!(),
                    };
                    (v26, v27)
                }
            };
            method12(v0, v5, v28, v29)
        }
        _ => {
            let (mut v32, mut v33): (Rc<UH0>, bool) = match Rc::unwrap_or_clone(v1) {
                UH0::UH0_Nil => {
                    (v2, v3)
                }
                _ => unreachable!(),
            };
            (v32, v33)
        }
    };
    (v34, v35)
}
fn removed_all_11(mut v0: Rc<dyn Fn(i32) -> Rc<str>>, mut v1: Rc<UH0>) -> (i32, Rc<str>) {
    let mut v2: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v3: bool = false;
    let (mut v4, mut v5): (Rc<UH0>, bool) = method12(v0, v1, v2, v3);
    let mut v6: i32 = if v5 {
        4i32
    } else {
        0i32
    };
    let mut v7: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v8: Rc<UH0> = method7(v4, v7);
    let mut v9: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v10: i32 = 0i32;
    let v11: i32 = method8(v9.clone(), v8, v10);
    let v12: Rc<Vec<Rc<str>>> = Rc::new(v9.borrow().clone());
    let v13: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v12).as_ref().clone()));
    let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let v15: Rc<str> = Rc::<str>::from((*v13.borrow()).join(&*v14));
    (v6, v15)
}
fn from_13(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2;
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let mut v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let mut v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9, v2));
            (v1, v2) = (v4, v10);
            continue;
        }
    }
}
fn method14(mut v0: Rc<UH0>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
                (v0, v1) = (v3, v2);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn method16(mut v0: i32, mut v1: &Rc<RefCell<Mut0>>) -> bool {
    let mut v2: i32 = v1.borrow().l0;
    let v3: bool = v2 < v0;
    v3
}
fn split_list_15(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let mut v2: i32 = (v0.clone().len() as i32);
    let v3: bool = v2 == 0i32;
    if v3 {
        let v4: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1, v4))
    } else {
        let mut v6: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(v1.split(&*v0).map(|x| Rc::<str>::from(x)).collect::<Vec<Rc<str>>>()));
        let mut v7: i32 = (v6.clone().borrow().len() as i32);
        let v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v9: Rc<RefCell<Mut0>> = Rc::new(RefCell::new(Mut0 { l0: 0i32, l1: v8 }));
        while method16(v7, &v9) {
            let v11: i32 = v9.borrow().l0;
            let v12: Rc<UH0> = v9.borrow().l1.clone();
            let v13: Rc<str> = v6.borrow()[v11 as usize].clone();
            let v14: i32 = v11.wrapping_add(1i32);
            let v15: Rc<UH0> = Rc::new(UH0::UH0_Cons(v13, v12));
            v9.borrow_mut().l0 = v14;
            v9.borrow_mut().l1 = v15;
            ()
        };
        let v16: Rc<UH0> = v9.borrow().l1.clone();
        let v17: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        method7(v16, v17)
    }
}
fn from_17(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2;
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let mut v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let mut v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9, v2));
            (v1, v2) = (v4, v10);
            continue;
        }
    }
}
fn thread_mode_3(mut v0: Rc<dyn Fn(i32) -> Rc<str>>, mut v1: i32, mut v2: Rc<str>) -> (i32, Rc<str>) {
    let v3: bool = v1 == 10i32;
    if v3 {
        let v4: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v2).unwrap_or_default();
        let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("found"); } LIT.with(|lit| lit.clone()) };
        let mut v6: serde_json::Value = v4.get(&*v5).cloned().unwrap_or_default();
        let mut v7: usize = v6.as_array().map_or(0, Vec::len);
        let v8: i32 = ((v7) as i32);
        let mut v9: i32 = v8.wrapping_sub(1i32);
        let v10: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v11: Rc<UH0> = from_13(v6, v9, v10);
        let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let v13: Rc<str> = method14(v11, v12);
        resume_written_4(v0, v13, v2)
    } else {
        let v16: bool = v1 == 9i32;
        if v16 {
            let v17: bool = &*v2 == "";
            let v21: Rc<UH0> = if v17 {
                { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
            } else {
                let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                split_list_15(v19, v2)
            };
            removed_all_11(v0, v21)
        } else {
            let mut v24: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v2).unwrap_or_default();
            let v25: usize = v24.as_array().map_or(0, Vec::len);
            let v26: i32 = ((v25) as i32);
            let v27: i32 = v26.wrapping_sub(1i32);
            let v28: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v29: Rc<UH0> = from_17(v24, v27, v28);
            let v30: US2 = US2::US2_Unstarted;
            let v31: US2 = US2::US2_Unstarted;
            let v32: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v33: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v34: bool = false;
            chained_5(v0, v29, v30, v31, v32, v33, v34)
        }
    }
}
fn write_18(mut v0: Rc<dyn Fn(i32) -> Rc<str>>, mut v1: i32, mut v2: Rc<str>) -> (i32, Rc<str>) {
    let v3: bool = v1 == 1i32;
    if v3 {
        let v4: Rc<str> = v0(0i32);
        let v5: Rc<str> = Rc::<str>::from(serde_json::json!({"kind": "fresh", "text": &*v2}).to_string());
        let (mut v6, mut v7, mut v8, mut v9): (i32, Rc<str>, Rc<str>, Rc<str>) = xc_requests::xc_create(&*v4, &*v5);
        let v10: bool = v6 == 0i32;
        let v14: US3 = if v10 {
            let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            US3::US3_Ok(v7, v11, v8)
        } else {
            US3::US3_Error(v9)
        };
        match v14 {
            US3::US3_Error(v19) => {
                let v19: Rc<str> = v19;
                (4i32, v19)
            }
            US3::US3_Ok(v15, v16, v17) => {
                let v15: Rc<str> = v15;
                let v16: Rc<str> = v16;
                let v17: Rc<str> = v17;
                let v18: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posted "); } LIT.with(|lit| lit.clone()) }, v15));
                (0i32, v18)
            }
        }
    } else {
        let mut v24: Rc<str> = v0(0i32);
        let v25: Rc<str> = Rc::<str>::from(serde_json::json!({"kind": "removal", "text": &*v2}).to_string());
        let (mut v26, mut v27, mut v28): (i32, bool, Rc<str>) = xc_requests::xc_delete(&*v24, &*v25);
        let v29: bool = v26 != 0i32;
        let v36: US4 = if v29 {
            US4::US4_Error(v28)
        } else {
            if v27 {
                let v31: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("deleted "); } LIT.with(|lit| lit.clone()) }, v2));
                US4::US4_Ok(v31)
            } else {
                let v33: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not deleted "); } LIT.with(|lit| lit.clone()) }, v2));
                US4::US4_Error(v33)
            }
        };
        match v36 {
            US4::US4_Error(v38) => {
                let v38: Rc<str> = v38;
                (4i32, v38)
            }
            US4::US4_Ok(v37) => {
                let v37: Rc<str> = v37;
                (0i32, v37)
            }
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, Rc<str>, Rc<str>) -> (i32, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, Rc<str>, Rc<str>) -> (i32, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: i32, mut v9: Rc<str>, mut v10: Rc<str>| -> (i32, Rc<str>) {
        let v11: bool = &*v10 == "bluesky";
        let v52: US0 = if v11 {
            let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("BLUESKY_IDENTIFIER"); } LIT.with(|lit| lit.clone()) };
            let v13: Rc<str> = get_environment_variable_0(v12);
            let v14: i32 = (v13.clone().len() as i32);
            let v15: i32 = 0i32;
            let v16: i32 = method1(v13.clone(), v14, v15);
            let v17: i32 = v14.wrapping_sub(1i32);
            let v18: Rc<str> = string_slice(&v13, v16 as i64, v17 as i64);
            let v19: i32 = (v18.clone().len() as i32);
            let v20: i32 = method2(v18.clone(), v19);
            let v21: Rc<str> = string_slice(&v18, 0i32 as i64, v20 as i64);
            let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("BLUESKY_APP_PASSWORD"); } LIT.with(|lit| lit.clone()) };
            let v23: Rc<str> = get_environment_variable_0(v22);
            let mut v24: i32 = (v23.clone().len() as i32);
            let v25: i32 = 0i32;
            let v26: i32 = method1(v23.clone(), v24, v25);
            let v27: i32 = v24.wrapping_sub(1i32);
            let v28: Rc<str> = string_slice(&v23, v26 as i64, v27 as i64);
            let v29: i32 = (v28.clone().len() as i32);
            let v30: i32 = method2(v28.clone(), v29);
            let v31: Rc<str> = string_slice(&v28, 0i32 as i64, v30 as i64);
            let (mut v32, mut v33, mut v34, mut v35): (i32, Rc<str>, Rc<str>, Rc<str>) = xc_requests::xc_session(&*v0, &*v21, &*v31);
            let v36: bool = v32 == 0i32;
            let v40: US1 = if v36 {
                let v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("bluesky"); } LIT.with(|lit| lit.clone()) };
                US1::US1_Ok(v37, v33, v34)
            } else {
                US1::US1_Error(v35)
            };
            match v40 {
                US1::US1_Error(v46) => {
                    let v46: Rc<str> = v46;
                    US0::US0_Error(v46)
                }
                US1::US1_Ok(v41, v42, v43) => {
                    let v41: Rc<str> = v41;
                    let v42: Rc<str> = v42;
                    let v43: Rc<str> = v43;
                    let v44: Rc<dyn Fn(i32) -> Rc<str>> = closure1(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9.clone(), v10, v41, v42, v43);
                    US0::US0_Ok(v44)
                }
            }
        } else {
            let v50: Rc<dyn Fn(i32) -> Rc<str>> = closure2(v0, v1.clone(), v2, v3, v4, v5, v6, v7, v8, v9.clone(), v10.clone(), v10.clone(), v1.clone());
            US0::US0_Ok(v50)
        };
        match v52 {
            US0::US0_Error(v61) => {
                let v61: Rc<str> = v61;
                (4i32, v61)
            }
            US0::US0_Ok(v53) => {
                let v53: Rc<dyn Fn(i32) -> Rc<str>> = v53;
                let v54: bool = v8 >= 7i32;
                if v54 {
                    thread_mode_3(v53, v8, v9)
                } else {
                    write_18(v53, v8, v9)
                }
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_write(v0: &str, v1: &str, v2: &str, v3: &str, v4: &str, v5: &str, v6: &str, v7: &str, v8: i32, v9: &str, v10: &str) -> (i32, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), Rc::<str>::from(v3), Rc::<str>::from(v4), Rc::<str>::from(v5), Rc::<str>::from(v6), Rc::<str>::from(v7), v8, Rc::<str>::from(v9), Rc::<str>::from(v10))
}
pub type SpiralShape_652accfc6a8d = Mut0;
