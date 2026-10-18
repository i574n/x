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
    US0_BearerToken(Rc<str>),
    US0_Signed(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>),
}
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<str>, Rc<UH0>),
}
#[derive(Clone)]
enum US2 {
    US2_HttpStatus(i32, Rc<str>, Rc<str>),
    US2_Transport(Rc<str>, Rc<str>),
    US2_Undecodable(Rc<str>, Rc<str>),
    US2_NoSuchAccount(Rc<str>),
}
#[derive(Clone)]
enum US1 {
    US1_Ok(Rc<UH0>),
    US1_Error(US2),
}
#[derive(Clone)]
enum US3 {
    US3_Ok(serde_json::Value, Rc<str>),
    US3_Error(US2),
}
#[derive(Clone)]
enum US4 {
    US4_Ok(serde_json::Value),
    US4_Error(US2),
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<UH1>),
}
fn method2(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3, v4) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<str> = v3.clone();
                let mut v4: Rc<UH0> = v4.clone();
                let mut v5: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v4.clone(), v5);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn app_reply_3(mut v0: Rc<str>, mut v1: US0, mut v2: Rc<str>) -> US3 {
    let mut v3: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v2));
    let mut v15: Rc<str> = match &v1 {
        US0::US0_BearerToken(v4) => {
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) };
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v4));
            v6.clone()
        }
        US0::US0_Signed(v7, v8, v9, v10, v11, v12) => {
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<str> = v8.clone();
            let mut v9: Rc<str> = v9.clone();
            let mut v10: Rc<str> = v10.clone();
            let mut v11: Rc<str> = v11.clone();
            let mut v12: Rc<str> = v12.clone();
            let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v13.clone()
        }
    };
    let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("GET"); } LIT.with(|lit| lit.clone()) };
    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v18, mut v19): (i32, Rc<str>) = xc_net::xc_send(&*v16, &*v3, &*v15, &*v17);
    let mut v20: bool = v18 == 0i32;
    let mut v80: US4 = if v20 {
        let mut v21: US2 = US2::US2_Transport(v2.clone(), v19.clone());
        US4::US4_Error(v21.clone())
    } else {
        let mut v23: bool = v18 >= 200i32;
        let mut v25: bool = if v23 {
            let mut v24: bool = v18 < 300i32;
            v24
        } else {
            false
        };
        let mut v26: bool = v25 == false;
        if v26 {
            let mut v27: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v19).unwrap_or_default();
            let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
            let mut v29: serde_json::Value = v27.get(&*v28).cloned().unwrap_or_default();
            let mut v30: Rc<str> = Rc::<str>::from(v29.as_str().unwrap_or(""));
            let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
            let mut v32: serde_json::Value = v27.get(&*v31).cloned().unwrap_or_default();
            let mut v33: Rc<str> = Rc::<str>::from(v32.as_str().unwrap_or(""));
            let mut v34: bool = v30.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v35: bool = v34 != true;
            let mut v38: bool = if v35 {
                let mut v36: bool = v33.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v37: bool = v36 != true;
                v37
            } else {
                false
            };
            let mut v41: bool = if v38 {
                let mut v39: bool = v30.clone() == v33.clone();
                let mut v40: bool = v39 != true;
                v40
            } else {
                false
            };
            let mut v64: Rc<str> = if v41 {
                let mut v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                let mut v43: Rc<str> = Rc::<str>::from(format!("{}{}", v30, v42));
                let mut v44: Rc<str> = Rc::<str>::from(format!("{}{}", v43, v33));
                v44.clone()
            } else {
                let mut v45: bool = v33.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v46: bool = v45 != true;
                if v46 {
                    v33.clone()
                } else {
                    if v35 {
                        v30.clone()
                    } else {
                        let mut v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
                        let mut v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
                        let mut v49: Rc<str> = Rc::<str>::from(v19.replace(&*v47, &*v48));
                        let mut v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                        let mut v51: Rc<str> = Rc::<str>::from(v49.replace(&*v50, &*v48));
                        let mut v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
                        let mut v53: Rc<str> = Rc::<str>::from(v51.replace(&*v52, &*v48));
                        let mut v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
                        let mut v55: Rc<str> = Rc::<str>::from(v53.replace(&*v54, &*v48));
                        let mut v56: i32 = (v55.clone().len() as i32);
                        let mut v57: bool = v56 <= 300i32;
                        if v57 {
                            v55.clone()
                        } else {
                            let mut v58: Rc<str> = string_slice(&v55.clone(), 0i32 as i64, 299i32 as i64);
                            let mut v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("..."); } LIT.with(|lit| lit.clone()) };
                            let mut v60: Rc<str> = Rc::<str>::from(format!("{}{}", v58, v59));
                            v60.clone()
                        }
                    }
                }
            };
            let mut v65: US2 = US2::US2_HttpStatus(v18, v2.clone(), v64.clone());
            US4::US4_Error(v65.clone())
        } else {
            let mut v67: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v19).unwrap_or_default();
            let mut v68: bool = v67.is_null();
            if v68 {
                let mut v69: i32 = (v19.clone().len() as i32);
                let mut v70: bool = v69 <= 300i32;
                let mut v74: Rc<str> = if v70 {
                    v19.clone()
                } else {
                    let mut v71: Rc<str> = string_slice(&v19.clone(), 0i32 as i64, 299i32 as i64);
                    let mut v72: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("..."); } LIT.with(|lit| lit.clone()) };
                    let mut v73: Rc<str> = Rc::<str>::from(format!("{}{}", v71, v72));
                    v73.clone()
                };
                let mut v75: US2 = US2::US2_Undecodable(v2.clone(), v74.clone());
                US4::US4_Error(v75.clone())
            } else {
                US4::US4_Ok(v67.clone())
            }
        }
    };
    match &v80 {
        US4::US4_Error(v83) => {
            let mut v83: US2 = v83.clone();
            US3::US3_Error(v83.clone())
        }
        US4::US4_Ok(v81) => {
            let mut v81: serde_json::Value = v81.clone();
            US3::US3_Ok(v81.clone(), v19.clone())
        }
    }
}
fn from_4(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: Rc<str> = Rc::<str>::from(v7.as_str().unwrap_or(""));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("username"); } LIT.with(|lit| lit.clone()) };
            let mut v10: serde_json::Value = v5.get(&*v9).cloned().unwrap_or_default();
            let mut v11: Rc<str> = Rc::<str>::from(v10.as_str().unwrap_or(""));
            let mut v12: Rc<UH0> = Rc::new(UH0::UH0_Cons(v8.clone(), v11.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v12.clone());
            continue;
        }
    }
}
fn method5(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH0> = method5(v4.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v2.clone(), v3.clone(), v5.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn go_6(mut v0: i32, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v1 {
        UH0::UH0_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: bool = v0 > 0i32;
            if v5 {
                let mut v6: i32 = v0.wrapping_sub(1i32);
                let mut v7: Rc<UH0> = go_6(v6, v4.clone());
                Rc::new(UH0::UH0_Cons(v2.clone(), v3.clone(), v7.clone()))
            } else {
                { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
            }
        }
        _ => {
            { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
        }
    }
}
fn pages_1(mut v0: Rc<str>, mut v1: US0, mut v2: Rc<str>, mut v3: i32, mut v4: Rc<str>, mut v5: Rc<UH0>) -> US1 {
    loop {
        let mut v6: i32 = 0i32;
        let mut v7: i32 = method2(v5.clone(), v6);
        let mut v8: i32 = v3.wrapping_sub(v7);
        let mut v9: bool = v8 < 1000i32;
        let mut v10: i32 = if v9 {
            v8
        } else {
            1000i32
        };
        let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users/"); } LIT.with(|lit| lit.clone()) };
        let mut v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v2));
        let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/following?max_results="); } LIT.with(|lit| lit.clone()) };
        let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v13));
        let mut v15: Rc<str> = Rc::<str>::from(format!("{:?}", v10));
        let mut v16: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v15));
        let mut v17: bool = v4.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v21: Rc<str> = if v17 {
            v16.clone()
        } else {
            let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&pagination_token="); } LIT.with(|lit| lit.clone()) };
            let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v18));
            let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v4));
            v20.clone()
        };
        let mut v22: US3 = app_reply_3(v0.clone(), v1.clone(), v21.clone());
        match &v22 {
            US3::US3_Error(v47) => {
                let mut v47: US2 = v47.clone();
                return US1::US1_Error(v47.clone());
            }
            US3::US3_Ok(v23, v24) => {
                let mut v23: serde_json::Value = v23.clone();
                let mut v24: Rc<str> = v24.clone();
                let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
                let mut v26: serde_json::Value = v23.get(&*v25).cloned().unwrap_or_default();
                let mut v27: i32 = v26.as_array().map_or(0, |a| a.len()) as i32;
                let mut v28: i32 = v27.wrapping_sub(1i32);
                let mut v29: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let mut v30: Rc<UH0> = from_4(v26.clone(), v28, v29.clone());
                let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("meta"); } LIT.with(|lit| lit.clone()) };
                let mut v32: serde_json::Value = v23.get(&*v31).cloned().unwrap_or_default();
                let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("next_token"); } LIT.with(|lit| lit.clone()) };
                let mut v34: serde_json::Value = v32.get(&*v33).cloned().unwrap_or_default();
                let mut v35: Rc<str> = Rc::<str>::from(v34.as_str().unwrap_or(""));
                let mut v36: Rc<UH0> = method5(v5.clone(), v30.clone());
                let mut v37: i32 = 0i32;
                let mut v38: i32 = method2(v36.clone(), v37);
                let mut v39: bool = v38 >= v3;
                let mut v41: Rc<str> = if v39 {
                    let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    v40.clone()
                } else {
                    v35.clone()
                };
                let mut v42: bool = v41.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                if v42 {
                    let mut v43: Rc<UH0> = go_6(v3, v36.clone());
                    return US1::US1_Ok(v43.clone());
                } else {
                    (v0, v1, v2, v3, v4, v5) = (v0.clone(), v1.clone(), v2.clone(), v3, v41.clone(), v36.clone());
                    continue;
                }
            }
        }
    }
}
fn method7(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH1> = method7(v4.clone(), v1.clone());
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v6));
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v3));
            Rc::new(UH1::UH1_Cons(v8.clone(), v5.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method8(mut v0: Rc<UH1>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method8(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH1::UH1_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn followed_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: i32) -> (i32, Rc<str>, Rc<str>) {
    let mut v4: bool = v3 < 0i32;
    let mut v5: i32 = if v4 {
        2147483647i32
    } else {
        v3
    };
    let mut v6: i32 = (v0.clone().len() as i32);
    let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let mut v8: bool = v0.ends_with(&*v7);
    let mut v11: Rc<str> = if v8 {
        let mut v9: i32 = v6.wrapping_sub(2i32);
        let mut v10: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v9 as i64);
        v10.clone()
    } else {
        v0.clone()
    };
    let mut v12: US0 = US0::US0_BearerToken(v1.clone());
    let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v15: US1 = pages_1(v11.clone(), v12.clone(), v2.clone(), v5, v13.clone(), v14.clone());
    match &v15 {
        US1::US1_Error(v21) => {
            let mut v21: US2 = v21.clone();
            let mut v54: Rc<str> = match &v21 {
                US2::US2_HttpStatus(v22, v23, v24) => {
                    let mut v22: i32 = *v22;
                    let mut v23: Rc<str> = v23.clone();
                    let mut v24: Rc<str> = v24.clone();
                    let mut v25: Rc<str> = Rc::<str>::from(format!("{:?}", v22));
                    let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                    let mut v27: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v25));
                    let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                    let mut v29: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v28));
                    let mut v30: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v23));
                    let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v30, v31));
                    let mut v33: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v24));
                    v33.clone()
                }
                US2::US2_NoSuchAccount(v48) => {
                    let mut v48: Rc<str> = v48.clone();
                    let mut v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
                    let mut v50: Rc<str> = Rc::<str>::from(format!("{}{}", v49, v48));
                    v50.clone()
                }
                US2::US2_Transport(v34, v35) => {
                    let mut v34: Rc<str> = v34.clone();
                    let mut v35: Rc<str> = v35.clone();
                    let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
                    let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v34));
                    let mut v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v39: Rc<str> = Rc::<str>::from(format!("{}{}", v37, v38));
                    let mut v40: Rc<str> = Rc::<str>::from(format!("{}{}", v39, v35));
                    v40.clone()
                }
                US2::US2_Undecodable(v41, v42) => {
                    let mut v41: Rc<str> = v41.clone();
                    let mut v42: Rc<str> = v42.clone();
                    let mut v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
                    let mut v44: Rc<str> = Rc::<str>::from(format!("{}{}", v43, v41));
                    let mut v45: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v46: Rc<str> = Rc::<str>::from(format!("{}{}", v44, v45));
                    let mut v47: Rc<str> = Rc::<str>::from(format!("{}{}", v46, v42));
                    v47.clone()
                }
            };
            (4i32, v13.clone(), v54.clone())
        }
        US1::US1_Ok(v16) => {
            let mut v16: Rc<UH0> = v16.clone();
            let mut v17: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v18: Rc<UH1> = method7(v16.clone(), v17.clone());
            let (mut v19, mut v20): (Rc<str>, Rc<str>) = method8(v18.clone(), v13.clone());
            (0i32, v19.clone(), v13.clone())
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, i32) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, i32) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: i32| -> (i32, Rc<str>, Rc<str>) {
        followed_0(v0.clone(), v1.clone(), v2.clone(), v3)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn split_on_10(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH1> {
    let mut v2: i32 = v1.find(&*v0).map(|i| i as i32).unwrap_or(-1);
    let mut v3: bool = v2 < 0i32;
    if v3 {
        let mut v4: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH1::UH1_Cons(v1.clone(), v4.clone()))
    } else {
        let mut v6: Rc<str> = Rc::<str>::from(&(v1)[((0i32) as usize)..(((0i32) + (v2)) as usize)]);
        let mut v7: i32 = v2.wrapping_add(1i32);
        let mut v8: i32 = (v1.clone().len() as i32);
        let mut v9: i32 = v8.wrapping_sub(v2);
        let mut v10: i32 = v9.wrapping_sub(1i32);
        let mut v11: Rc<str> = Rc::<str>::from(&(v1)[((v7) as usize)..(((v7) + (v10)) as usize)]);
        let mut v12: Rc<UH1> = split_on_10(v0.clone(), v11.clone());
        Rc::new(UH1::UH1_Cons(v6.clone(), v12.clone()))
    }
}
fn method11(mut v0: Rc<UH1>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method11(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH1::UH1_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn from_12(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("value"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: Rc<str> = Rc::<str>::from(v7.as_str().unwrap_or(""));
            let mut v9: Rc<UH1> = Rc::new(UH1::UH1_Cons(v8.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v9.clone());
            continue;
        }
    }
}
fn named_9(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> (i32, Rc<str>, Rc<str>, Rc<str>) {
    let mut v3: i32 = (v0.clone().len() as i32);
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let mut v5: bool = v0.ends_with(&*v4);
    let mut v8: Rc<str> = if v5 {
        let mut v6: i32 = v3.wrapping_sub(2i32);
        let mut v7: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v6 as i64);
        v7.clone()
    } else {
        v0.clone()
    };
    let mut v9: bool = v2.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v13: Rc<UH1> = if v9 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_on_10(v11.clone(), v2.clone())
    };
    let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v15, mut v16): (Rc<str>, Rc<str>) = method11(v13.clone(), v14.clone());
    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users/by?usernames="); } LIT.with(|lit| lit.clone()) };
    let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v15));
    let mut v19: US0 = US0::US0_BearerToken(v1.clone());
    let mut v20: US3 = app_reply_3(v8.clone(), v19.clone(), v18.clone());
    match &v20 {
        US3::US3_Error(v41) => {
            let mut v41: US2 = v41.clone();
            let mut v74: Rc<str> = match &v41 {
                US2::US2_HttpStatus(v42, v43, v44) => {
                    let mut v42: i32 = *v42;
                    let mut v43: Rc<str> = v43.clone();
                    let mut v44: Rc<str> = v44.clone();
                    let mut v45: Rc<str> = Rc::<str>::from(format!("{:?}", v42));
                    let mut v46: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                    let mut v47: Rc<str> = Rc::<str>::from(format!("{}{}", v46, v45));
                    let mut v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                    let mut v49: Rc<str> = Rc::<str>::from(format!("{}{}", v47, v48));
                    let mut v50: Rc<str> = Rc::<str>::from(format!("{}{}", v49, v43));
                    let mut v51: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v52: Rc<str> = Rc::<str>::from(format!("{}{}", v50, v51));
                    let mut v53: Rc<str> = Rc::<str>::from(format!("{}{}", v52, v44));
                    v53.clone()
                }
                US2::US2_NoSuchAccount(v68) => {
                    let mut v68: Rc<str> = v68.clone();
                    let mut v69: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
                    let mut v70: Rc<str> = Rc::<str>::from(format!("{}{}", v69, v68));
                    v70.clone()
                }
                US2::US2_Transport(v54, v55) => {
                    let mut v54: Rc<str> = v54.clone();
                    let mut v55: Rc<str> = v55.clone();
                    let mut v56: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
                    let mut v57: Rc<str> = Rc::<str>::from(format!("{}{}", v56, v54));
                    let mut v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v59: Rc<str> = Rc::<str>::from(format!("{}{}", v57, v58));
                    let mut v60: Rc<str> = Rc::<str>::from(format!("{}{}", v59, v55));
                    v60.clone()
                }
                US2::US2_Undecodable(v61, v62) => {
                    let mut v61: Rc<str> = v61.clone();
                    let mut v62: Rc<str> = v62.clone();
                    let mut v63: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
                    let mut v64: Rc<str> = Rc::<str>::from(format!("{}{}", v63, v61));
                    let mut v65: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v66: Rc<str> = Rc::<str>::from(format!("{}{}", v64, v65));
                    let mut v67: Rc<str> = Rc::<str>::from(format!("{}{}", v66, v62));
                    v67.clone()
                }
            };
            (4i32, v14.clone(), v14.clone(), v74.clone())
        }
        US3::US3_Ok(v21, v22) => {
            let mut v21: serde_json::Value = v21.clone();
            let mut v22: Rc<str> = v22.clone();
            let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v24: serde_json::Value = v21.get(&*v23).cloned().unwrap_or_default();
            let mut v25: i32 = v24.as_array().map_or(0, |a| a.len()) as i32;
            let mut v26: i32 = v25.wrapping_sub(1i32);
            let mut v27: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v28: Rc<UH0> = from_4(v24.clone(), v26, v27.clone());
            let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
            let mut v30: serde_json::Value = v21.get(&*v29).cloned().unwrap_or_default();
            let mut v31: i32 = v30.as_array().map_or(0, |a| a.len()) as i32;
            let mut v32: i32 = v31.wrapping_sub(1i32);
            let mut v33: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v34: Rc<UH1> = from_12(v30.clone(), v32, v33.clone());
            let mut v35: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v36: Rc<UH1> = method7(v28.clone(), v35.clone());
            let (mut v37, mut v38): (Rc<str>, Rc<str>) = method8(v36.clone(), v14.clone());
            let (mut v39, mut v40): (Rc<str>, Rc<str>) = method11(v34.clone(), v14.clone());
            (0i32, v37.clone(), v39.clone(), v14.clone())
        }
    }
}
fn closure1() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>, Rc<str>) {
        named_9(v0.clone(), v1.clone(), v2.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn by_ids_13(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> (i32, Rc<str>, Rc<str>) {
    let mut v3: i32 = (v0.clone().len() as i32);
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let mut v5: bool = v0.ends_with(&*v4);
    let mut v8: Rc<str> = if v5 {
        let mut v6: i32 = v3.wrapping_sub(2i32);
        let mut v7: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v6 as i64);
        v7.clone()
    } else {
        v0.clone()
    };
    let mut v9: bool = v2.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v13: Rc<UH1> = if v9 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_on_10(v11.clone(), v2.clone())
    };
    let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v15, mut v16): (Rc<str>, Rc<str>) = method11(v13.clone(), v14.clone());
    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users?ids="); } LIT.with(|lit| lit.clone()) };
    let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v15));
    let mut v19: US0 = US0::US0_BearerToken(v1.clone());
    let mut v20: US3 = app_reply_3(v8.clone(), v19.clone(), v18.clone());
    match &v20 {
        US3::US3_Error(v23) => {
            let mut v23: US2 = v23.clone();
            let mut v56: Rc<str> = match &v23 {
                US2::US2_HttpStatus(v24, v25, v26) => {
                    let mut v24: i32 = *v24;
                    let mut v25: Rc<str> = v25.clone();
                    let mut v26: Rc<str> = v26.clone();
                    let mut v27: Rc<str> = Rc::<str>::from(format!("{:?}", v24));
                    let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                    let mut v29: Rc<str> = Rc::<str>::from(format!("{}{}", v28, v27));
                    let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                    let mut v31: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v30));
                    let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v31, v25));
                    let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v34: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v33));
                    let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v26));
                    v35.clone()
                }
                US2::US2_NoSuchAccount(v50) => {
                    let mut v50: Rc<str> = v50.clone();
                    let mut v51: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
                    let mut v52: Rc<str> = Rc::<str>::from(format!("{}{}", v51, v50));
                    v52.clone()
                }
                US2::US2_Transport(v36, v37) => {
                    let mut v36: Rc<str> = v36.clone();
                    let mut v37: Rc<str> = v37.clone();
                    let mut v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
                    let mut v39: Rc<str> = Rc::<str>::from(format!("{}{}", v38, v36));
                    let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v41: Rc<str> = Rc::<str>::from(format!("{}{}", v39, v40));
                    let mut v42: Rc<str> = Rc::<str>::from(format!("{}{}", v41, v37));
                    v42.clone()
                }
                US2::US2_Undecodable(v43, v44) => {
                    let mut v43: Rc<str> = v43.clone();
                    let mut v44: Rc<str> = v44.clone();
                    let mut v45: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
                    let mut v46: Rc<str> = Rc::<str>::from(format!("{}{}", v45, v43));
                    let mut v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v48: Rc<str> = Rc::<str>::from(format!("{}{}", v46, v47));
                    let mut v49: Rc<str> = Rc::<str>::from(format!("{}{}", v48, v44));
                    v49.clone()
                }
            };
            (4i32, v14.clone(), v56.clone())
        }
        US3::US3_Ok(v21, v22) => {
            let mut v21: serde_json::Value = v21.clone();
            let mut v22: Rc<str> = v22.clone();
            (0i32, v22.clone(), v14.clone())
        }
    }
}
fn closure2() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>) {
        by_ids_13(v0.clone(), v1.clone(), v2.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_users_followed(v0: &str, v1: &str, v2: &str, v3: i32) -> (i32, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), v3)
}
pub fn xc_users_named(v0: &str, v1: &str, v2: &str) -> (i32, Rc<str>, Rc<str>, Rc<str>) {
    closure1()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2))
}
pub fn xc_users_by_ids(v0: &str, v1: &str, v2: &str) -> (i32, Rc<str>, Rc<str>) {
    closure2()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2))
}
