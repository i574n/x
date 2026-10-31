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
fn get_environment_variable_0(mut v0: Rc<str>) -> Rc<str> {
    let v1: Rc<str> = Rc::<str>::from(std::env::var(&*v0).unwrap_or_default());
    v1
}
fn method1(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> i32 {
    loop {
        let v3: bool = v2 >= v1;
        if v3 {
            return v1;
        } else {
            let mut v4: u8 = v0.clone().as_bytes()[v2 as usize];
            let mut v5: bool = v4 == b' ';
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
                (v0, v1, v2) = (v0.clone(), v1, v12);
                continue;
            } else {
                return v2;
            }
        }
    }
}
fn method2(mut v0: Rc<str>, mut v1: i32) -> i32 {
    loop {
        let v2: bool = v1 <= 0i32;
        if v2 {
            return -1i32;
        } else {
            let v3: i32 = v1.wrapping_sub(1i32);
            let mut v4: u8 = v0.clone().as_bytes()[v3 as usize];
            let mut v5: bool = v4 == b' ';
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
                (v0, v1) = (v0.clone(), v3);
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
            let v19: Rc<str> = Rc::<str>::from(format!("{}{}", v6, Rc::<str>::from(format!("{:?}", v14))));
            v19.clone()
        };
        let v21: i32 = i32::from_str_radix(&*(v7.clone()), 10u32).unwrap();
        let v22: i32 = v21.wrapping_add(v14);
        let v23: Rc<str> = Rc::<str>::from(format!("{:?}", v22));
        let mut v24: serde_json::Value = serde_json::json!({"nonce": &*v20, "stamp": &*v7, "seconds": &*v23});
        let v25: Rc<str> = Rc::<str>::from(serde_json::json!({"who": v15, "keys": v16, "clock": v24}).to_string());
        v25.clone()
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
            let v19: Rc<str> = Rc::<str>::from(format!("{}{}", v6, Rc::<str>::from(format!("{:?}", v13))));
            v19.clone()
        };
        let v21: i32 = i32::from_str_radix(&*(v7.clone()), 10u32).unwrap();
        let v22: i32 = v21.wrapping_add(v13);
        let v23: Rc<str> = Rc::<str>::from(format!("{:?}", v22));
        let mut v24: serde_json::Value = serde_json::json!({"nonce": &*v20, "stamp": &*v7, "seconds": &*v23});
        let v25: Rc<str> = Rc::<str>::from(serde_json::json!({"who": v15, "keys": v16, "clock": v24}).to_string());
        v25.clone()
    })
}
fn method6(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let mut v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3.clone(), v4);
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
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let mut v4: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2.clone(), v1.clone()));
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH0::UH0_Nil => {
                return v1.clone();
            }
        }
    }
}
fn method8(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3.clone();
                let mut v4: Rc<UH0> = v4.clone();
                v0.borrow_mut().push(v3);
                let mut v5: i32 = v2.wrapping_add(1i32);
                (v0, v1, v2) = (v0.clone(), v4.clone(), v5);
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
        let v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn chained_5(mut v0: Rc<dyn Fn(i32) -> Rc<str>>, mut v1: Rc<UH0>, mut v2: US2, mut v3: US2, mut v4: Rc<UH0>, mut v5: Rc<UH0>, mut v6: bool) -> (i32, Rc<str>) {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v16, v17) => {
                let v16: Rc<str> = v16.clone();
                let v17: Rc<UH0> = v17.clone();
                let v18: i32 = 0i32;
                let v19: i32 = method6(v5.clone(), v18);
                let v20: i32 = v19.wrapping_add(1i32);
                let v21: Rc<str> = v0(v20);
                let v38: Rc<str> = match &v3 {
                    US2::US2_After(v23, v24, v25) => {
                        let v23: Rc<str> = v23.clone();
                        let mut v24: Rc<str> = v24.clone();
                        let v25: Rc<str> = v25.clone();
                        match &v2 {
                            US2::US2_After(v26, v27, v28) => {
                                let v26: Rc<str> = v26.clone();
                                let v27: Rc<str> = v27.clone();
                                let v28: Rc<str> = v28.clone();
                                let v29: serde_json::Value = serde_json::json!({"id": &*v26, "cid": &*v28});
                                let v30: serde_json::Value = serde_json::json!({"id": &*v23, "cid": &*v25});
                                let v31: Rc<str> = Rc::<str>::from(serde_json::json!({"kind": "answer", "text": &*v16, "root": v29, "parent": v30}).to_string());
                                v31.clone()
                            }
                            US2::US2_Unstarted => {
                                let v32: serde_json::Value = serde_json::json!({"id": &*v23, "cid": &*v25});
                                let v33: serde_json::Value = serde_json::json!({"id": &*v23, "cid": &*v25});
                                let v34: Rc<str> = Rc::<str>::from(serde_json::json!({"kind": "answer", "text": &*v16, "root": v32, "parent": v33}).to_string());
                                v34.clone()
                            }
                        }
                    }
                    US2::US2_Unstarted => {
                        let v22: Rc<str> = Rc::<str>::from(serde_json::json!({"kind": "fresh", "text": &*v16}).to_string());
                        v22.clone()
                    }
                };
                let (mut v39, mut v40, mut v41, mut v42): (i32, Rc<str>, Rc<str>, Rc<str>) = xc_requests::xc_create(&*v21, &*v38);
                let v43: bool = v39 == 0i32;
                let v47: US3 = if v43 {
                    let v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    US3::US3_Ok(v40.clone(), v44.clone(), v41.clone())
                } else {
                    US3::US3_Error(v42.clone())
                };
                match &v47 {
                    US3::US3_Error(v75) => {
                        let v75: Rc<str> = v75.clone();
                        let v76: i32 = 0i32;
                        let v77: i32 = method6(v5.clone(), v76);
                        let v78: bool = v77 == 0i32;
                        let v91: Rc<str> = if v78 {
                            let v79: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                            v79.clone()
                        } else {
                            let v80: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                            let v81: Rc<UH0> = method7(v5.clone(), v80.clone());
                            let v82: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                            let v83: i32 = 0i32;
                            let v84: i32 = method8(v82.clone(), v81.clone(), v83);
                            let v85: Rc<Vec<Rc<str>>> = Rc::new(v82.borrow().clone());
                            let v86: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v85).as_ref().clone()));
                            let v87: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
                            let v88: Rc<str> = Rc::<str>::from((*v86.borrow()).join(&*v87));
                            let v89: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; posted before it: "); } LIT.with(|lit| lit.clone()) };
                            let v90: Rc<str> = Rc::<str>::from(format!("{}{}", v89, v88));
                            v90.clone()
                        };
                        let v92: Rc<str> = Rc::<str>::from(format!("{}{}", v75, v91));
                        let v93: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                        let v94: Rc<UH0> = method7(v5.clone(), v93.clone());
                        let v105: Rc<str> = if v6 {
                            let v95: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; continue with the same --resume command"); } LIT.with(|lit| lit.clone()) };
                            v95.clone()
                        } else {
                            match &*v94 {
                                UH0::UH0_Cons(v96, v97) => {
                                    let v96: Rc<str> = v96.clone();
                                    let v97: Rc<UH0> = v97.clone();
                                    let v98: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; continue with: xc post-thread --resume "); } LIT.with(|lit| lit.clone()) };
                                    let v99: Rc<str> = Rc::<str>::from(format!("{}{}", v98, v96));
                                    let v100: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" FILE"); } LIT.with(|lit| lit.clone()) };
                                    let v101: Rc<str> = Rc::<str>::from(format!("{}{}", v99, v100));
                                    v101.clone()
                                }
                                UH0::UH0_Nil => {
                                    let v102: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                                    v102.clone()
                                }
                            }
                        };
                        let v106: Rc<str> = Rc::<str>::from(format!("{}{}", v92, v105));
                        return (4i32, v106.clone());
                    }
                    US3::US3_Ok(v48, v49, v50) => {
                        let v48: Rc<str> = v48.clone();
                        let v49: Rc<str> = v49.clone();
                        let v50: Rc<str> = v50.clone();
                        let v51: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posted "); } LIT.with(|lit| lit.clone()) };
                        let v52: Rc<str> = Rc::<str>::from(format!("{}{}", v51, v48));
                        let v53: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
                        let v54: Rc<str> = Rc::<str>::from(format!("{}{}", v52, v53));
                        let v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                        let v56: Option<usize> = v16.find(&*v55);
                        let v57: Option<usize> = method9(v56.clone());
                        let mut v58: Rc<dyn Fn((usize)) -> i32> = closure3();
                        let mut v59: Option<i32> = v57.map(|x| v58(x));
                        let v61: i32 = v59.unwrap_or(-1i32);
                        let v62: bool = v61 < 0i32;
                        let v66: Rc<str> = if v62 {
                            v16.clone()
                        } else {
                            let v63: usize = ((0i32) as usize);
                            let v64: usize = ((v61) as usize);
                            let v65: Rc<str> = Rc::<str>::from(&(v16)[v63..v64]);
                            v65.clone()
                        };
                        let v67: Rc<str> = Rc::<str>::from(format!("{}{}", v54, v66));
                        let v69: US2 = match &v2 {
                            US2::US2_Unstarted => {
                                US2::US2_After(v48.clone(), v49.clone(), v50.clone())
                            }
                            _ => {
                                v2.clone()
                            }
                        };
                        let v70: US2 = US2::US2_After(v48.clone(), v49.clone(), v50.clone());
                        let v71: Rc<UH0> = Rc::new(UH0::UH0_Cons(v67.clone(), v4.clone()));
                        let v72: Rc<UH0> = Rc::new(UH0::UH0_Cons(v48.clone(), v5.clone()));
                        (v0, v1, v2, v3, v4, v5, v6) = (v0.clone(), v17.clone(), v69.clone(), v70.clone(), v71.clone(), v72.clone(), v6);
                        continue;
                    }
                }
            }
            UH0::UH0_Nil => {
                let mut v7: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let v8: Rc<UH0> = method7(v4.clone(), v7.clone());
                let v9: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                let v10: i32 = 0i32;
                let v11: i32 = method8(v9.clone(), v8.clone(), v10);
                let v12: Rc<Vec<Rc<str>>> = Rc::new(v9.borrow().clone());
                let v13: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v12).as_ref().clone()));
                let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                let v15: Rc<str> = Rc::<str>::from((*v13.borrow()).join(&*v14));
                return (0i32, v15.clone());
            }
        }
    }
}
fn from_10(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let mut v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
            let v8: Rc<UH0> = Rc::new(UH0::UH0_Cons(v7.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v8.clone());
            continue;
        }
    }
}
fn resume_written_4(mut v0: Rc<dyn Fn(i32) -> Rc<str>>, mut v1: Rc<str>, mut v2: Rc<str>) -> (i32, Rc<str>) {
    let (mut v3, mut v4, mut v5): (i32, i32, Rc<str>) = xc_resume::xc_resume_plan(&*v2);
    let mut v6: bool = v3 != 0i32;
    if v6 {
        (4i32, v5.clone())
    } else {
        let mut v7: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v5).unwrap_or_default();
        let v8: usize = v7.as_array().map_or(0, Vec::len);
        let v9: i32 = ((v8) as i32);
        let v10: i32 = v9.wrapping_sub(1i32);
        let v11: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v12: Rc<UH0> = from_10(v7.clone(), v10, v11.clone());
        let v13: i32 = 0i32;
        let v14: i32 = method6(v12.clone(), v13);
        let v15: i32 = v4.wrapping_add(v14);
        let v16: Rc<str> = Rc::<str>::from(format!("{:?}", v4));
        let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("resumed after post "); } LIT.with(|lit| lit.clone()) };
        let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v16));
        let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" of "); } LIT.with(|lit| lit.clone()) };
        let v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v19));
        let v22: Rc<str> = Rc::<str>::from(format!("{}{}", v20, Rc::<str>::from(format!("{:?}", v15))));
        let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v24: US2 = US2::US2_After(v1.clone(), v23.clone(), v23.clone());
        let v25: US2 = US2::US2_After(v1.clone(), v23.clone(), v23.clone());
        let v26: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v27: Rc<UH0> = Rc::new(UH0::UH0_Cons(v22.clone(), v26.clone()));
        let v28: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v29: bool = true;
        chained_5(v0.clone(), v12.clone(), v24.clone(), v25.clone(), v27.clone(), v28.clone(), v29)
    }
}
fn method12(mut v0: Rc<dyn Fn(i32) -> Rc<str>>, mut v1: Rc<UH0>, mut v2: Rc<UH0>, mut v3: bool) -> (Rc<UH0>, bool) {
    let (mut v36, mut v37): (Rc<UH0>, bool) = match &*v1 {
        UH0::UH0_Cons(v4, v5) => {
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH0> = v5.clone();
            let mut v6: i32 = 0i32;
            let mut v7: i32 = method6(v2.clone(), v6);
            let v8: i32 = v7.wrapping_add(1i32);
            let v9: Rc<str> = v0(v8);
            let v10: Rc<str> = Rc::<str>::from(serde_json::json!({"kind": "removal", "text": &*v4}).to_string());
            let (mut v11, mut v12, mut v13): (i32, bool, Rc<str>) = xc_requests::xc_delete(&*v9, &*v10);
            let v14: bool = v11 != 0i32;
            let v23: US4 = if v14 {
                US4::US4_Error(v13.clone())
            } else {
                if v12 {
                    let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("deleted "); } LIT.with(|lit| lit.clone()) };
                    let v17: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v4));
                    US4::US4_Ok(v17.clone())
                } else {
                    let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not deleted "); } LIT.with(|lit| lit.clone()) };
                    let v20: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v4));
                    US4::US4_Error(v20.clone())
                }
            };
            let (mut v30, mut v31): (Rc<UH0>, bool) = match &v23 {
                US4::US4_Ok(v24) => {
                    let mut v24: Rc<str> = v24.clone();
                    let v25: Rc<UH0> = Rc::new(UH0::UH0_Cons(v24.clone(), v2.clone()));
                    (v25.clone(), v3)
                }
                _ => {
                    let (mut v28, mut v29): (Rc<UH0>, bool) = match &v23 {
                        US4::US4_Error(v26) => {
                            let v26: Rc<str> = v26.clone();
                            let v27: Rc<UH0> = Rc::new(UH0::UH0_Cons(v26.clone(), v2.clone()));
                            (v27.clone(), true)
                        }
                        _ => unreachable!(),
                    };
                    (v28.clone(), v29)
                }
            };
            method12(v0.clone(), v5.clone(), v30.clone(), v31)
        }
        _ => {
            let (mut v34, mut v35): (Rc<UH0>, bool) = match &*v1 {
                UH0::UH0_Nil => {
                    (v2.clone(), v3)
                }
                _ => unreachable!(),
            };
            (v34.clone(), v35)
        }
    };
    (v36.clone(), v37)
}
fn removed_all_11(mut v0: Rc<dyn Fn(i32) -> Rc<str>>, mut v1: Rc<UH0>) -> (i32, Rc<str>) {
    let v2: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v3: bool = false;
    let (mut v4, mut v5): (Rc<UH0>, bool) = method12(v0.clone(), v1.clone(), v2.clone(), v3);
    let mut v6: i32 = if v5 {
        4i32
    } else {
        0i32
    };
    let mut v7: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v8: Rc<UH0> = method7(v4.clone(), v7.clone());
    let v9: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v10: i32 = 0i32;
    let v11: i32 = method8(v9.clone(), v8.clone(), v10);
    let v12: Rc<Vec<Rc<str>>> = Rc::new(v9.borrow().clone());
    let v13: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v12).as_ref().clone()));
    let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let v15: Rc<str> = Rc::<str>::from((*v13.borrow()).join(&*v14));
    (v6, v15.clone())
}
fn from_13(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let mut v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v10.clone());
            continue;
        }
    }
}
fn method14(mut v0: Rc<UH0>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                (v0, v1) = (v3.clone(), v2.clone());
                continue;
            }
            UH0::UH0_Nil => {
                return v1.clone();
            }
        }
    }
}
fn split_list_15(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let v2: Option<usize> = v1.find(&*v0);
    let v3: Option<usize> = method9(v2.clone());
    let mut v4: Rc<dyn Fn((usize)) -> i32> = closure3();
    let mut v5: Option<i32> = v3.map(|x| v4(x));
    let mut v7: i32 = v5.unwrap_or(-1i32);
    let v8: i32 = (v0.clone().len() as i32);
    let v9: bool = v7 < 0i32;
    let v11: bool = if v9 {
        true
    } else {
        let v10: bool = v8 == 0i32;
        v10
    };
    if v11 {
        let v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1.clone(), v12.clone()))
    } else {
        let v14: usize = ((0i32) as usize);
        let v15: usize = ((v7) as usize);
        let v16: Rc<str> = Rc::<str>::from(&(v1)[v14..v15]);
        let v17: i32 = v7.wrapping_add(v8);
        let v18: i32 = (v1.clone().len() as i32);
        let v19: i32 = v18.wrapping_sub(v7);
        let v20: i32 = v19.wrapping_sub(v8);
        let v21: usize = ((v17) as usize);
        let v22: i32 = v17.wrapping_add(v20);
        let v23: usize = ((v22) as usize);
        let mut v24: Rc<str> = Rc::<str>::from(&(v1)[v21..v23]);
        let v25: Rc<UH0> = split_list_15(v0.clone(), v24.clone());
        Rc::new(UH0::UH0_Cons(v16.clone(), v25.clone()))
    }
}
fn from_16(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let mut v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v10.clone());
            continue;
        }
    }
}
fn thread_mode_3(mut v0: Rc<dyn Fn(i32) -> Rc<str>>, mut v1: i32, mut v2: Rc<str>) -> (i32, Rc<str>) {
    let v3: bool = v1 == 10i32;
    if v3 {
        let mut v4: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v2).unwrap_or_default();
        let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("found"); } LIT.with(|lit| lit.clone()) };
        let mut v6: serde_json::Value = v4.get(&*v5).cloned().unwrap_or_default();
        let mut v7: usize = v6.as_array().map_or(0, Vec::len);
        let v8: i32 = ((v7) as i32);
        let v9: i32 = v8.wrapping_sub(1i32);
        let v10: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v11: Rc<UH0> = from_13(v6.clone(), v9, v10.clone());
        let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let v13: Rc<str> = method14(v11.clone(), v12.clone());
        resume_written_4(v0.clone(), v13.clone(), v2.clone())
    } else {
        let v16: bool = v1 == 9i32;
        if v16 {
            let v17: bool = &*v2 == "";
            let v21: Rc<UH0> = if v17 {
                { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
            } else {
                let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                split_list_15(v19.clone(), v2.clone())
            };
            removed_all_11(v0.clone(), v21.clone())
        } else {
            let mut v24: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v2).unwrap_or_default();
            let v25: usize = v24.as_array().map_or(0, Vec::len);
            let v26: i32 = ((v25) as i32);
            let v27: i32 = v26.wrapping_sub(1i32);
            let v28: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v29: Rc<UH0> = from_16(v24.clone(), v27, v28.clone());
            let v30: US2 = US2::US2_Unstarted;
            let v31: US2 = US2::US2_Unstarted;
            let v32: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v33: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v34: bool = false;
            chained_5(v0.clone(), v29.clone(), v30.clone(), v31.clone(), v32.clone(), v33.clone(), v34)
        }
    }
}
fn write_17(mut v0: Rc<dyn Fn(i32) -> Rc<str>>, mut v1: i32, mut v2: Rc<str>) -> (i32, Rc<str>) {
    let v3: bool = v1 == 1i32;
    if v3 {
        let mut v4: Rc<str> = v0(0i32);
        let mut v5: Rc<str> = Rc::<str>::from(serde_json::json!({"kind": "fresh", "text": &*v2}).to_string());
        let (mut v6, mut v7, mut v8, mut v9): (i32, Rc<str>, Rc<str>, Rc<str>) = xc_requests::xc_create(&*v4, &*v5);
        let v10: bool = v6 == 0i32;
        let v14: US3 = if v10 {
            let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            US3::US3_Ok(v7.clone(), v11.clone(), v8.clone())
        } else {
            US3::US3_Error(v9.clone())
        };
        match &v14 {
            US3::US3_Error(v20) => {
                let v20: Rc<str> = v20.clone();
                (4i32, v20.clone())
            }
            US3::US3_Ok(v15, v16, v17) => {
                let v15: Rc<str> = v15.clone();
                let v16: Rc<str> = v16.clone();
                let v17: Rc<str> = v17.clone();
                let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posted "); } LIT.with(|lit| lit.clone()) };
                let v19: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v15));
                (0i32, v19.clone())
            }
        }
    } else {
        let v25: Rc<str> = v0(0i32);
        let v26: Rc<str> = Rc::<str>::from(serde_json::json!({"kind": "removal", "text": &*v2}).to_string());
        let (mut v27, mut v28, mut v29): (i32, bool, Rc<str>) = xc_requests::xc_delete(&*v25, &*v26);
        let v30: bool = v27 != 0i32;
        let v39: US4 = if v30 {
            US4::US4_Error(v29.clone())
        } else {
            if v28 {
                let v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("deleted "); } LIT.with(|lit| lit.clone()) };
                let v33: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v2));
                US4::US4_Ok(v33.clone())
            } else {
                let v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not deleted "); } LIT.with(|lit| lit.clone()) };
                let v36: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v2));
                US4::US4_Error(v36.clone())
            }
        };
        match &v39 {
            US4::US4_Error(v41) => {
                let v41: Rc<str> = v41.clone();
                (4i32, v41.clone())
            }
            US4::US4_Ok(v40) => {
                let v40: Rc<str> = v40.clone();
                (0i32, v40.clone())
            }
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, Rc<str>, Rc<str>) -> (i32, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, Rc<str>, Rc<str>) -> (i32, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: i32, mut v9: Rc<str>, mut v10: Rc<str>| -> (i32, Rc<str>) {
        let v11: bool = &*v10 == "bluesky";
        let v52: US0 = if v11 {
            let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("BLUESKY_IDENTIFIER"); } LIT.with(|lit| lit.clone()) };
            let v13: Rc<str> = get_environment_variable_0(v12.clone());
            let v14: i32 = (v13.clone().len() as i32);
            let v15: i32 = 0i32;
            let v16: i32 = method1(v13.clone(), v14, v15);
            let v17: i32 = v14.wrapping_sub(1i32);
            let v18: Rc<str> = string_slice(&v13.clone(), v16 as i64, v17 as i64);
            let v19: i32 = (v18.clone().len() as i32);
            let v20: i32 = method2(v18.clone(), v19);
            let v21: Rc<str> = string_slice(&v18.clone(), 0i32 as i64, v20 as i64);
            let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("BLUESKY_APP_PASSWORD"); } LIT.with(|lit| lit.clone()) };
            let v23: Rc<str> = get_environment_variable_0(v22.clone());
            let mut v24: i32 = (v23.clone().len() as i32);
            let v25: i32 = 0i32;
            let v26: i32 = method1(v23.clone(), v24, v25);
            let v27: i32 = v24.wrapping_sub(1i32);
            let v28: Rc<str> = string_slice(&v23.clone(), v26 as i64, v27 as i64);
            let v29: i32 = (v28.clone().len() as i32);
            let v30: i32 = method2(v28.clone(), v29);
            let v31: Rc<str> = string_slice(&v28.clone(), 0i32 as i64, v30 as i64);
            let (mut v32, mut v33, mut v34, mut v35): (i32, Rc<str>, Rc<str>, Rc<str>) = xc_requests::xc_session(&*v0, &*v21, &*v31);
            let v36: bool = v32 == 0i32;
            let v40: US1 = if v36 {
                let v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("bluesky"); } LIT.with(|lit| lit.clone()) };
                US1::US1_Ok(v37.clone(), v33.clone(), v34.clone())
            } else {
                US1::US1_Error(v35.clone())
            };
            match &v40 {
                US1::US1_Error(v46) => {
                    let v46: Rc<str> = v46.clone();
                    US0::US0_Error(v46.clone())
                }
                US1::US1_Ok(v41, v42, v43) => {
                    let v41: Rc<str> = v41.clone();
                    let v42: Rc<str> = v42.clone();
                    let v43: Rc<str> = v43.clone();
                    let v44: Rc<dyn Fn(i32) -> Rc<str>> = closure1(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8, v9.clone(), v10.clone(), v41.clone(), v42.clone(), v43.clone());
                    US0::US0_Ok(v44.clone())
                }
            }
        } else {
            let v50: Rc<dyn Fn(i32) -> Rc<str>> = closure2(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8, v9.clone(), v10.clone(), v10.clone(), v1.clone());
            US0::US0_Ok(v50.clone())
        };
        match &v52 {
            US0::US0_Error(v61) => {
                let v61: Rc<str> = v61.clone();
                (4i32, v61.clone())
            }
            US0::US0_Ok(v53) => {
                let v53: Rc<dyn Fn(i32) -> Rc<str>> = v53.clone();
                let v54: bool = v8 >= 7i32;
                if v54 {
                    thread_mode_3(v53.clone(), v8, v9.clone())
                } else {
                    write_17(v53.clone(), v8, v9.clone())
                }
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_write(v0: &str, v1: &str, v2: &str, v3: &str, v4: &str, v5: &str, v6: &str, v7: &str, v8: i32, v9: &str, v10: &str) -> (i32, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), Rc::<str>::from(v3), Rc::<str>::from(v4), Rc::<str>::from(v5), Rc::<str>::from(v6), Rc::<str>::from(v7), v8, Rc::<str>::from(v9), Rc::<str>::from(v10))
}
