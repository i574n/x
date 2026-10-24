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
    UH0_Cons(Rc<str>, Rc<UH0>),
}
#[derive(Clone)]
enum US1 {
    US1_DeletePost(Rc<str>),
}
#[derive(Clone)]
enum US3 {
    US3_HttpStatus(i32, Rc<str>, Rc<str>),
    US3_Transport(Rc<str>, Rc<str>),
    US3_Undecodable(Rc<str>, Rc<str>),
    US3_NoSuchAccount(Rc<str>),
}
#[derive(Clone)]
enum US2 {
    US2_Ok(bool),
    US2_Error(US3),
}
#[derive(Clone)]
enum US4 {
    US4_Read,
    US4_Write(Rc<str>),
    US4_Remove,
}
#[derive(Clone)]
enum US5 {
    US5_Ok(serde_json::Value, Rc<str>),
    US5_Error(US3),
}
#[derive(Clone)]
enum US6 {
    US6_Ok(serde_json::Value),
    US6_Error(US3),
}
#[derive(Clone)]
enum US7 {
    US7_Ok(Rc<str>),
    US7_Error(Rc<str>),
}
#[derive(Clone)]
enum US8 {
    US8_Unstarted,
    US8_After(Rc<str>, Rc<str>),
}
#[derive(Clone)]
enum US9 {
    US9_CreatePost(Rc<str>),
    US9_ReplyPost(Rc<str>, Rc<str>, Rc<str>),
}
#[derive(Clone)]
enum US10 {
    US10_Ok(Rc<str>, Rc<str>),
    US10_Error(US3),
}
fn closure1(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: i32, mut v9: Rc<str>) -> Rc<dyn Fn(i32) -> (Rc<str>, US0)> {
    Rc::new(move |mut v10: i32| -> (Rc<str>, US0) {
        let mut v11: bool = v10 == 0i32;
        let mut v14: Rc<str> = if v11 {
            v6.clone()
        } else {
            let mut v12: Rc<str> = Rc::<str>::from(format!("{:?}", v10));
            let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v12));
            v13.clone()
        };
        let mut v15: bool = v1.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        if v15 {
            let mut v16: i32 = (v0.clone().len() as i32);
            let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
            let mut v18: bool = v0.ends_with(&*v17);
            let mut v21: Rc<str> = if v18 {
                let mut v19: i32 = v16.wrapping_sub(2i32);
                let mut v20: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v19 as i64);
                v20.clone()
            } else {
                v0.clone()
            };
            let mut v22: US0 = US0::US0_BearerToken(v1.clone());
            (v21.clone(), v22.clone())
        } else {
            let mut v23: i32 = (v0.clone().len() as i32);
            let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
            let mut v25: bool = v0.ends_with(&*v24);
            let mut v28: Rc<str> = if v25 {
                let mut v26: i32 = v23.wrapping_sub(2i32);
                let mut v27: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v26 as i64);
                v27.clone()
            } else {
                v0.clone()
            };
            let mut v29: US0 = US0::US0_Signed(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v14.clone(), v7.clone());
            (v28.clone(), v29.clone())
        }
    })
}
fn split_on_0(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let mut v2: i32 = v1.find(&*v0).map(|i| i as i32).unwrap_or(-1);
    let mut v3: bool = v2 < 0i32;
    if v3 {
        let mut v4: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1.clone(), v4.clone()))
    } else {
        let mut v6: Rc<str> = Rc::<str>::from(&(v1)[((0i32) as usize)..(((0i32) + (v2)) as usize)]);
        let mut v7: i32 = v2.wrapping_add(1i32);
        let mut v8: i32 = (v1.clone().len() as i32);
        let mut v9: i32 = v8.wrapping_sub(v2);
        let mut v10: i32 = v9.wrapping_sub(1i32);
        let mut v11: Rc<str> = Rc::<str>::from(&(v1)[((v7) as usize)..(((v7) + (v10)) as usize)]);
        let mut v12: Rc<UH0> = split_on_0(v0.clone(), v11.clone());
        Rc::new(UH0::UH0_Cons(v6.clone(), v12.clone()))
    }
}
fn method3(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
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
fn raw_reply_5(mut v0: Rc<str>, mut v1: US0, mut v2: US4, mut v3: Rc<str>) -> US5 {
    let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v3));
    let mut v11: Rc<str> = match &v2 {
        US4::US4_Read => {
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("GET"); } LIT.with(|lit| lit.clone()) };
            v5.clone()
        }
        US4::US4_Remove => {
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("DELETE"); } LIT.with(|lit| lit.clone()) };
            v8.clone()
        }
        US4::US4_Write(v6) => {
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("POST"); } LIT.with(|lit| lit.clone()) };
            v7.clone()
        }
    };
    let mut v23: Rc<str> = match &v1 {
        US0::US0_BearerToken(v12) => {
            let mut v12: Rc<str> = v12.clone();
            let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) };
            let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v12));
            v14.clone()
        }
        US0::US0_Signed(v15, v16, v17, v18, v19, v20) => {
            let mut v15: Rc<str> = v15.clone();
            let mut v16: Rc<str> = v16.clone();
            let mut v17: Rc<str> = v17.clone();
            let mut v18: Rc<str> = v18.clone();
            let mut v19: Rc<str> = v19.clone();
            let mut v20: Rc<str> = v20.clone();
            let mut v21: Rc<str> = xc_net::xc_oauth1_header(&*v15, &*v16, &*v17, &*v18, &*v11, &*v4, &*v19, &*v20);
            v21.clone()
        }
    };
    let mut v26: Rc<str> = match &v2 {
        US4::US4_Write(v24) => {
            let mut v24: Rc<str> = v24.clone();
            v24.clone()
        }
        _ => {
            let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v25.clone()
        }
    };
    let (mut v27, mut v28): (i32, Rc<str>) = xc_net::xc_send(&*v11, &*v4, &*v23, &*v26);
    let mut v29: bool = v27 == 0i32;
    let mut v85: US6 = if v29 {
        let mut v30: US3 = US3::US3_Transport(v3.clone(), v28.clone());
        US6::US6_Error(v30.clone())
    } else {
        let mut v32: bool = v27 >= 200i32;
        let mut v34: bool = if v32 {
            let mut v33: bool = v27 < 300i32;
            v33
        } else {
            false
        };
        let mut v35: bool = v34 == false;
        if v35 {
            let mut v36: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v28).unwrap_or_default();
            let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
            let mut v38: serde_json::Value = v36.get(&*v37).cloned().unwrap_or_default();
            let mut v39: Rc<str> = Rc::<str>::from(v38.as_str().unwrap_or(""));
            let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
            let mut v41: serde_json::Value = v36.get(&*v40).cloned().unwrap_or_default();
            let mut v42: Rc<str> = Rc::<str>::from(v41.as_str().unwrap_or(""));
            let mut v43: bool = v39.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v45: bool = if v43 {
                let mut v44: bool = v42.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v44
            } else {
                false
            };
            let mut v47: bool = if v45 {
                let mut v46: bool = v39.clone() != v42.clone();
                v46
            } else {
                false
            };
            let mut v69: Rc<str> = if v47 {
                let mut v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                let mut v49: Rc<str> = Rc::<str>::from(format!("{}{}", v39, v48));
                let mut v50: Rc<str> = Rc::<str>::from(format!("{}{}", v49, v42));
                v50.clone()
            } else {
                let mut v51: bool = v42.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                if v51 {
                    v42.clone()
                } else {
                    if v43 {
                        v39.clone()
                    } else {
                        let mut v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
                        let mut v53: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
                        let mut v54: Rc<str> = Rc::<str>::from(v28.replace(&*v52, &*v53));
                        let mut v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                        let mut v56: Rc<str> = Rc::<str>::from(v54.replace(&*v55, &*v53));
                        let mut v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
                        let mut v58: Rc<str> = Rc::<str>::from(v56.replace(&*v57, &*v53));
                        let mut v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
                        let mut v60: Rc<str> = Rc::<str>::from(v58.replace(&*v59, &*v53));
                        let mut v61: i32 = (v60.clone().len() as i32);
                        let mut v62: bool = v61 <= 300i32;
                        if v62 {
                            v60.clone()
                        } else {
                            let mut v63: Rc<str> = string_slice(&v60.clone(), 0i32 as i64, 299i32 as i64);
                            let mut v64: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("..."); } LIT.with(|lit| lit.clone()) };
                            let mut v65: Rc<str> = Rc::<str>::from(format!("{}{}", v63, v64));
                            v65.clone()
                        }
                    }
                }
            };
            let mut v70: US3 = US3::US3_HttpStatus(v27, v3.clone(), v69.clone());
            US6::US6_Error(v70.clone())
        } else {
            let mut v72: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v28).unwrap_or_default();
            let mut v73: bool = v72.is_null();
            if v73 {
                let mut v74: i32 = (v28.clone().len() as i32);
                let mut v75: bool = v74 <= 300i32;
                let mut v79: Rc<str> = if v75 {
                    v28.clone()
                } else {
                    let mut v76: Rc<str> = string_slice(&v28.clone(), 0i32 as i64, 299i32 as i64);
                    let mut v77: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("..."); } LIT.with(|lit| lit.clone()) };
                    let mut v78: Rc<str> = Rc::<str>::from(format!("{}{}", v76, v77));
                    v78.clone()
                };
                let mut v80: US3 = US3::US3_Undecodable(v3.clone(), v79.clone());
                US6::US6_Error(v80.clone())
            } else {
                US6::US6_Ok(v72.clone())
            }
        }
    };
    match &v85 {
        US6::US6_Error(v88) => {
            let mut v88: US3 = v88.clone();
            US5::US5_Error(v88.clone())
        }
        US6::US6_Ok(v86) => {
            let mut v86: serde_json::Value = v86.clone();
            US5::US5_Ok(v86.clone(), v28.clone())
        }
    }
}
fn send_write_4(mut v0: Rc<str>, mut v1: US0, mut v2: US1) -> US2 {
    let mut v5: US4 = match &v2 {
        US1::US1_DeletePost(v3) => {
            let mut v3: Rc<str> = v3.clone();
            US4::US4_Remove
        }
    };
    let mut v9: Rc<str> = match &v2 {
        US1::US1_DeletePost(v6) => {
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/"); } LIT.with(|lit| lit.clone()) };
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v6));
            v8.clone()
        }
    };
    let mut v10: US5 = raw_reply_5(v0.clone(), v1.clone(), v5.clone(), v9.clone());
    match &v10 {
        US5::US5_Error(v21) => {
            let mut v21: US3 = v21.clone();
            US2::US2_Error(v21.clone())
        }
        US5::US5_Ok(v11, v12) => {
            let mut v11: serde_json::Value = v11.clone();
            let mut v12: Rc<str> = v12.clone();
            let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v14: serde_json::Value = v11.get(&*v13).cloned().unwrap_or_default();
            let mut v19: bool = match &v2 {
                US1::US1_DeletePost(v15) => {
                    let mut v15: Rc<str> = v15.clone();
                    let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("deleted"); } LIT.with(|lit| lit.clone()) };
                    let mut v17: serde_json::Value = v14.get(&*v16).cloned().unwrap_or_default();
                    let mut v18: bool = v17.as_bool().unwrap_or(false);
                    v18
                }
            };
            US2::US2_Ok(v19)
        }
    }
}
fn method2(mut v0: Rc<dyn Fn(i32) -> (Rc<str>, US0)>, mut v1: Rc<UH0>, mut v2: Rc<UH0>, mut v3: bool) -> (Rc<UH0>, bool) {
    let (mut v70, mut v71): (Rc<UH0>, bool) = match &*v1 {
        UH0::UH0_Cons(v4, v5) => {
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH0> = v5.clone();
            let mut v6: i32 = 0i32;
            let mut v7: i32 = method3(v2.clone(), v6);
            let mut v8: i32 = v7.wrapping_add(1i32);
            let (mut v9, mut v10): (Rc<str>, US0) = v0(v8);
            let mut v11: US1 = US1::US1_DeletePost(v4.clone());
            let mut v12: US2 = send_write_4(v9.clone(), v10.clone(), v11.clone());
            let mut v57: US7 = match &v12 {
                US2::US2_Error(v21) => {
                    let mut v21: US3 = v21.clone();
                    let mut v54: Rc<str> = match &v21 {
                        US3::US3_HttpStatus(v22, v23, v24) => {
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
                        US3::US3_NoSuchAccount(v48) => {
                            let mut v48: Rc<str> = v48.clone();
                            let mut v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
                            let mut v50: Rc<str> = Rc::<str>::from(format!("{}{}", v49, v48));
                            v50.clone()
                        }
                        US3::US3_Transport(v34, v35) => {
                            let mut v34: Rc<str> = v34.clone();
                            let mut v35: Rc<str> = v35.clone();
                            let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
                            let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v34));
                            let mut v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                            let mut v39: Rc<str> = Rc::<str>::from(format!("{}{}", v37, v38));
                            let mut v40: Rc<str> = Rc::<str>::from(format!("{}{}", v39, v35));
                            v40.clone()
                        }
                        US3::US3_Undecodable(v41, v42) => {
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
                    US7::US7_Error(v54.clone())
                }
                US2::US2_Ok(v13) => {
                    let mut v13: bool = *v13;
                    if v13 {
                        let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("deleted "); } LIT.with(|lit| lit.clone()) };
                        let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v4));
                        US7::US7_Ok(v15.clone())
                    } else {
                        let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not deleted "); } LIT.with(|lit| lit.clone()) };
                        let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v4));
                        US7::US7_Error(v18.clone())
                    }
                }
            };
            let (mut v64, mut v65): (Rc<UH0>, bool) = match &v57 {
                US7::US7_Ok(v58) => {
                    let mut v58: Rc<str> = v58.clone();
                    let mut v59: Rc<UH0> = Rc::new(UH0::UH0_Cons(v58.clone(), v2.clone()));
                    (v59.clone(), v3)
                }
                _ => {
                    let (mut v62, mut v63): (Rc<UH0>, bool) = match &v57 {
                        US7::US7_Error(v60) => {
                            let mut v60: Rc<str> = v60.clone();
                            let mut v61: Rc<UH0> = Rc::new(UH0::UH0_Cons(v60.clone(), v2.clone()));
                            (v61.clone(), true)
                        }
                        _ => unreachable!(),
                    };
                    (v62.clone(), v63)
                }
            };
            method2(v0.clone(), v5.clone(), v64.clone(), v65)
        }
        _ => {
            let (mut v68, mut v69): (Rc<UH0>, bool) = match &*v1 {
                UH0::UH0_Nil => {
                    (v2.clone(), v3)
                }
                _ => unreachable!(),
            };
            (v68.clone(), v69)
        }
    };
    (v70.clone(), v71)
}
fn method6(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
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
fn method7(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method7(v4.clone(), v1.clone(), v2.clone());
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v6));
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v5));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            (v8.clone(), v9.clone())
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1.clone(), v2.clone())
                }
                _ => unreachable!(),
            };
            (v10.clone(), v11.clone())
        }
    };
    (v12.clone(), v13.clone())
}
fn removed_all_1(mut v0: Rc<dyn Fn(i32) -> (Rc<str>, US0)>, mut v1: Rc<UH0>) -> (i32, Rc<str>) {
    let mut v2: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v3: bool = false;
    let (mut v4, mut v5): (Rc<UH0>, bool) = method2(v0.clone(), v1.clone(), v2.clone(), v3);
    let mut v6: i32 = if v5 {
        4i32
    } else {
        0i32
    };
    let mut v7: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v8: Rc<UH0> = method6(v4.clone(), v7.clone());
    let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v10, mut v11): (Rc<str>, Rc<str>) = method7(v8.clone(), v9.clone(), v9.clone());
    (v6, v10.clone())
}
fn from_8(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: Rc<str> = Rc::<str>::from(v7.as_str().unwrap_or(""));
            let mut v9: Rc<UH0> = Rc::new(UH0::UH0_Cons(v8.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v9.clone());
            continue;
        }
    }
}
fn send_write_10(mut v0: Rc<str>, mut v1: US0, mut v2: US9) -> US10 {
    let mut v12: US4 = match &v2 {
        US9::US9_CreatePost(v3) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = Rc::<str>::from(serde_json::json!({"text": &*v3}).to_string());
            US4::US4_Write(v4.clone())
        }
        US9::US9_ReplyPost(v6, v7, v8) => {
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<str> = v8.clone();
            let mut v9: Rc<str> = Rc::<str>::from(serde_json::json!({"text": &*v6, "reply": {"in_reply_to_tweet_id": &*v7}}).to_string());
            US4::US4_Write(v9.clone())
        }
    };
    let mut v20: Rc<str> = match &v2 {
        US9::US9_CreatePost(v13) => {
            let mut v13: Rc<str> = v13.clone();
            let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets"); } LIT.with(|lit| lit.clone()) };
            v14.clone()
        }
        US9::US9_ReplyPost(v15, v16, v17) => {
            let mut v15: Rc<str> = v15.clone();
            let mut v16: Rc<str> = v16.clone();
            let mut v17: Rc<str> = v17.clone();
            let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets"); } LIT.with(|lit| lit.clone()) };
            v18.clone()
        }
    };
    let mut v21: US5 = raw_reply_5(v0.clone(), v1.clone(), v12.clone(), v20.clone());
    match &v21 {
        US5::US5_Error(v47) => {
            let mut v47: US3 = v47.clone();
            US10::US10_Error(v47.clone())
        }
        US5::US5_Ok(v22, v23) => {
            let mut v22: serde_json::Value = v22.clone();
            let mut v23: Rc<str> = v23.clone();
            let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v25: serde_json::Value = v22.get(&*v24).cloned().unwrap_or_default();
            let (mut v44, mut v45): (Rc<str>, Rc<str>) = match &v2 {
                US9::US9_CreatePost(v26) => {
                    let mut v26: Rc<str> = v26.clone();
                    let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
                    let mut v28: serde_json::Value = v25.get(&*v27).cloned().unwrap_or_default();
                    let mut v29: Rc<str> = Rc::<str>::from(v28.as_str().unwrap_or(""));
                    let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
                    let mut v31: serde_json::Value = v25.get(&*v30).cloned().unwrap_or_default();
                    let mut v32: Rc<str> = Rc::<str>::from(v31.as_str().unwrap_or(""));
                    (v29.clone(), v32.clone())
                }
                US9::US9_ReplyPost(v33, v34, v35) => {
                    let mut v33: Rc<str> = v33.clone();
                    let mut v34: Rc<str> = v34.clone();
                    let mut v35: Rc<str> = v35.clone();
                    let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
                    let mut v37: serde_json::Value = v25.get(&*v36).cloned().unwrap_or_default();
                    let mut v38: Rc<str> = Rc::<str>::from(v37.as_str().unwrap_or(""));
                    let mut v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
                    let mut v40: serde_json::Value = v25.get(&*v39).cloned().unwrap_or_default();
                    let mut v41: Rc<str> = Rc::<str>::from(v40.as_str().unwrap_or(""));
                    (v38.clone(), v41.clone())
                }
            };
            US10::US10_Ok(v44.clone(), v45.clone())
        }
    }
}
fn method11(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method11(v4.clone(), v1.clone(), v2.clone());
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v6));
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v5));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
            (v8.clone(), v9.clone())
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1.clone(), v2.clone())
                }
                _ => unreachable!(),
            };
            (v10.clone(), v11.clone())
        }
    };
    (v12.clone(), v13.clone())
}
fn chained_9(mut v0: Rc<dyn Fn(i32) -> (Rc<str>, US0)>, mut v1: Rc<UH0>, mut v2: US8, mut v3: Rc<UH0>, mut v4: Rc<UH0>) -> (i32, Rc<str>) {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v10, v11) => {
                let mut v10: Rc<str> = v10.clone();
                let mut v11: Rc<UH0> = v11.clone();
                let mut v12: i32 = 0i32;
                let mut v13: i32 = method3(v4.clone(), v12);
                let mut v14: i32 = v13.wrapping_add(1i32);
                let (mut v15, mut v16): (Rc<str>, US0) = v0(v14);
                let mut v22: US9 = match &v2 {
                    US8::US8_After(v18, v19) => {
                        let mut v18: Rc<str> = v18.clone();
                        let mut v19: Rc<str> = v19.clone();
                        US9::US9_ReplyPost(v10.clone(), v18.clone(), v19.clone())
                    }
                    US8::US8_Unstarted => {
                        US9::US9_CreatePost(v10.clone())
                    }
                };
                let mut v23: US10 = send_write_10(v15.clone(), v16.clone(), v22.clone());
                match &v23 {
                    US10::US10_Error(v41) => {
                        let mut v41: US3 = v41.clone();
                        let mut v42: i32 = 0i32;
                        let mut v43: i32 = method3(v4.clone(), v42);
                        let mut v44: bool = v43 == 0i32;
                        let mut v53: Rc<str> = if v44 {
                            let mut v45: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                            v45.clone()
                        } else {
                            let mut v46: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                            let mut v47: Rc<UH0> = method6(v4.clone(), v46.clone());
                            let mut v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                            let (mut v49, mut v50): (Rc<str>, Rc<str>) = method11(v47.clone(), v48.clone(), v48.clone());
                            let mut v51: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; posted before it: "); } LIT.with(|lit| lit.clone()) };
                            let mut v52: Rc<str> = Rc::<str>::from(format!("{}{}", v51, v49));
                            v52.clone()
                        };
                        let mut v86: Rc<str> = match &v41 {
                            US3::US3_HttpStatus(v54, v55, v56) => {
                                let mut v54: i32 = *v54;
                                let mut v55: Rc<str> = v55.clone();
                                let mut v56: Rc<str> = v56.clone();
                                let mut v57: Rc<str> = Rc::<str>::from(format!("{:?}", v54));
                                let mut v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                                let mut v59: Rc<str> = Rc::<str>::from(format!("{}{}", v58, v57));
                                let mut v60: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                                let mut v61: Rc<str> = Rc::<str>::from(format!("{}{}", v59, v60));
                                let mut v62: Rc<str> = Rc::<str>::from(format!("{}{}", v61, v55));
                                let mut v63: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                                let mut v64: Rc<str> = Rc::<str>::from(format!("{}{}", v62, v63));
                                let mut v65: Rc<str> = Rc::<str>::from(format!("{}{}", v64, v56));
                                v65.clone()
                            }
                            US3::US3_NoSuchAccount(v80) => {
                                let mut v80: Rc<str> = v80.clone();
                                let mut v81: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
                                let mut v82: Rc<str> = Rc::<str>::from(format!("{}{}", v81, v80));
                                v82.clone()
                            }
                            US3::US3_Transport(v66, v67) => {
                                let mut v66: Rc<str> = v66.clone();
                                let mut v67: Rc<str> = v67.clone();
                                let mut v68: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
                                let mut v69: Rc<str> = Rc::<str>::from(format!("{}{}", v68, v66));
                                let mut v70: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                                let mut v71: Rc<str> = Rc::<str>::from(format!("{}{}", v69, v70));
                                let mut v72: Rc<str> = Rc::<str>::from(format!("{}{}", v71, v67));
                                v72.clone()
                            }
                            US3::US3_Undecodable(v73, v74) => {
                                let mut v73: Rc<str> = v73.clone();
                                let mut v74: Rc<str> = v74.clone();
                                let mut v75: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
                                let mut v76: Rc<str> = Rc::<str>::from(format!("{}{}", v75, v73));
                                let mut v77: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                                let mut v78: Rc<str> = Rc::<str>::from(format!("{}{}", v76, v77));
                                let mut v79: Rc<str> = Rc::<str>::from(format!("{}{}", v78, v74));
                                v79.clone()
                            }
                        };
                        let mut v87: Rc<str> = Rc::<str>::from(format!("{}{}", v86, v53));
                        return (4i32, v87.clone());
                    }
                    US10::US10_Ok(v24, v25) => {
                        let mut v24: Rc<str> = v24.clone();
                        let mut v25: Rc<str> = v25.clone();
                        let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posted "); } LIT.with(|lit| lit.clone()) };
                        let mut v27: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v24));
                        let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
                        let mut v29: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v28));
                        let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                        let mut v31: i32 = v10.find(&*v30).map(|i| i as i32).unwrap_or(-1);
                        let mut v32: bool = v31 < 0i32;
                        let mut v34: Rc<str> = if v32 {
                            v10.clone()
                        } else {
                            let mut v33: Rc<str> = Rc::<str>::from(&(v10)[((0i32) as usize)..(((0i32) + (v31)) as usize)]);
                            v33.clone()
                        };
                        let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v34));
                        let mut v36: US8 = US8::US8_After(v24.clone(), v25.clone());
                        let mut v37: Rc<UH0> = Rc::new(UH0::UH0_Cons(v35.clone(), v3.clone()));
                        let mut v38: Rc<UH0> = Rc::new(UH0::UH0_Cons(v24.clone(), v4.clone()));
                        (v0, v1, v2, v3, v4) = (v0.clone(), v11.clone(), v36.clone(), v37.clone(), v38.clone());
                        continue;
                    }
                }
            }
            UH0::UH0_Nil => {
                let mut v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let mut v6: Rc<UH0> = method6(v3.clone(), v5.clone());
                let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let (mut v8, mut v9): (Rc<str>, Rc<str>) = method7(v6.clone(), v7.clone(), v7.clone());
                return (0i32, v8.clone());
            }
        }
    }
}
fn write_12(mut v0: Rc<str>, mut v1: US0, mut v2: i32, mut v3: Rc<str>) -> (i32, Rc<str>) {
    let mut v4: bool = v2 == 1i32;
    if v4 {
        let mut v5: US9 = US9::US9_CreatePost(v3.clone());
        let mut v6: US10 = send_write_10(v0.clone(), v1.clone(), v5.clone());
        match &v6 {
            US10::US10_Error(v11) => {
                let mut v11: US3 = v11.clone();
                let mut v44: Rc<str> = match &v11 {
                    US3::US3_HttpStatus(v12, v13, v14) => {
                        let mut v12: i32 = *v12;
                        let mut v13: Rc<str> = v13.clone();
                        let mut v14: Rc<str> = v14.clone();
                        let mut v15: Rc<str> = Rc::<str>::from(format!("{:?}", v12));
                        let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                        let mut v17: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v15));
                        let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                        let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v18));
                        let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v13));
                        let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v22: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v21));
                        let mut v23: Rc<str> = Rc::<str>::from(format!("{}{}", v22, v14));
                        v23.clone()
                    }
                    US3::US3_NoSuchAccount(v38) => {
                        let mut v38: Rc<str> = v38.clone();
                        let mut v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
                        let mut v40: Rc<str> = Rc::<str>::from(format!("{}{}", v39, v38));
                        v40.clone()
                    }
                    US3::US3_Transport(v24, v25) => {
                        let mut v24: Rc<str> = v24.clone();
                        let mut v25: Rc<str> = v25.clone();
                        let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
                        let mut v27: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v24));
                        let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v29: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v28));
                        let mut v30: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v25));
                        v30.clone()
                    }
                    US3::US3_Undecodable(v31, v32) => {
                        let mut v31: Rc<str> = v31.clone();
                        let mut v32: Rc<str> = v32.clone();
                        let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
                        let mut v34: Rc<str> = Rc::<str>::from(format!("{}{}", v33, v31));
                        let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v36: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v35));
                        let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v32));
                        v37.clone()
                    }
                };
                (4i32, v44.clone())
            }
            US10::US10_Ok(v7, v8) => {
                let mut v7: Rc<str> = v7.clone();
                let mut v8: Rc<str> = v8.clone();
                let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posted "); } LIT.with(|lit| lit.clone()) };
                let mut v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v7));
                (0i32, v10.clone())
            }
        }
    } else {
        let mut v49: US1 = US1::US1_DeletePost(v3.clone());
        let mut v50: US2 = send_write_4(v0.clone(), v1.clone(), v49.clone());
        match &v50 {
            US2::US2_Error(v58) => {
                let mut v58: US3 = v58.clone();
                let mut v91: Rc<str> = match &v58 {
                    US3::US3_HttpStatus(v59, v60, v61) => {
                        let mut v59: i32 = *v59;
                        let mut v60: Rc<str> = v60.clone();
                        let mut v61: Rc<str> = v61.clone();
                        let mut v62: Rc<str> = Rc::<str>::from(format!("{:?}", v59));
                        let mut v63: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                        let mut v64: Rc<str> = Rc::<str>::from(format!("{}{}", v63, v62));
                        let mut v65: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                        let mut v66: Rc<str> = Rc::<str>::from(format!("{}{}", v64, v65));
                        let mut v67: Rc<str> = Rc::<str>::from(format!("{}{}", v66, v60));
                        let mut v68: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v69: Rc<str> = Rc::<str>::from(format!("{}{}", v67, v68));
                        let mut v70: Rc<str> = Rc::<str>::from(format!("{}{}", v69, v61));
                        v70.clone()
                    }
                    US3::US3_NoSuchAccount(v85) => {
                        let mut v85: Rc<str> = v85.clone();
                        let mut v86: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
                        let mut v87: Rc<str> = Rc::<str>::from(format!("{}{}", v86, v85));
                        v87.clone()
                    }
                    US3::US3_Transport(v71, v72) => {
                        let mut v71: Rc<str> = v71.clone();
                        let mut v72: Rc<str> = v72.clone();
                        let mut v73: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
                        let mut v74: Rc<str> = Rc::<str>::from(format!("{}{}", v73, v71));
                        let mut v75: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v76: Rc<str> = Rc::<str>::from(format!("{}{}", v74, v75));
                        let mut v77: Rc<str> = Rc::<str>::from(format!("{}{}", v76, v72));
                        v77.clone()
                    }
                    US3::US3_Undecodable(v78, v79) => {
                        let mut v78: Rc<str> = v78.clone();
                        let mut v79: Rc<str> = v79.clone();
                        let mut v80: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
                        let mut v81: Rc<str> = Rc::<str>::from(format!("{}{}", v80, v78));
                        let mut v82: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v83: Rc<str> = Rc::<str>::from(format!("{}{}", v81, v82));
                        let mut v84: Rc<str> = Rc::<str>::from(format!("{}{}", v83, v79));
                        v84.clone()
                    }
                };
                (4i32, v91.clone())
            }
            US2::US2_Ok(v51) => {
                let mut v51: bool = *v51;
                if v51 {
                    let mut v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("deleted "); } LIT.with(|lit| lit.clone()) };
                    let mut v53: Rc<str> = Rc::<str>::from(format!("{}{}", v52, v3));
                    (0i32, v53.clone())
                } else {
                    let mut v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not deleted "); } LIT.with(|lit| lit.clone()) };
                    let mut v55: Rc<str> = Rc::<str>::from(format!("{}{}", v54, v3));
                    (4i32, v55.clone())
                }
            }
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, Rc<str>) -> (i32, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, Rc<str>) -> (i32, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: i32, mut v9: Rc<str>| -> (i32, Rc<str>) {
        let mut v10: bool = v8 >= 7i32;
        if v10 {
            let mut v11: bool = v8 == 9i32;
            if v11 {
                let mut v12: Rc<dyn Fn(i32) -> (Rc<str>, US0)> = closure1(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8, v9.clone());
                let mut v13: bool = v9.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v17: Rc<UH0> = if v13 {
                    { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
                } else {
                    let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                    split_on_0(v15.clone(), v9.clone())
                };
                removed_all_1(v12.clone(), v17.clone())
            } else {
                let mut v20: Rc<dyn Fn(i32) -> (Rc<str>, US0)> = closure1(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8, v9.clone());
                let mut v21: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v9).unwrap_or_default();
                let mut v22: i32 = v21.as_array().map_or(0, |a| a.len()) as i32;
                let mut v23: i32 = v22.wrapping_sub(1i32);
                let mut v24: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let mut v25: Rc<UH0> = from_8(v21.clone(), v23, v24.clone());
                let mut v26: US8 = US8::US8_Unstarted;
                let mut v27: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let mut v28: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                chained_9(v20.clone(), v25.clone(), v26.clone(), v27.clone(), v28.clone())
            }
        } else {
            let mut v33: bool = v1.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v48, mut v49): (Rc<str>, US0) = if v33 {
                let mut v34: i32 = (v0.clone().len() as i32);
                let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
                let mut v36: bool = v0.ends_with(&*v35);
                let mut v39: Rc<str> = if v36 {
                    let mut v37: i32 = v34.wrapping_sub(2i32);
                    let mut v38: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v37 as i64);
                    v38.clone()
                } else {
                    v0.clone()
                };
                let mut v40: US0 = US0::US0_BearerToken(v1.clone());
                (v39.clone(), v40.clone())
            } else {
                let mut v41: i32 = (v0.clone().len() as i32);
                let mut v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
                let mut v43: bool = v0.ends_with(&*v42);
                let mut v46: Rc<str> = if v43 {
                    let mut v44: i32 = v41.wrapping_sub(2i32);
                    let mut v45: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v44 as i64);
                    v45.clone()
                } else {
                    v0.clone()
                };
                let mut v47: US0 = US0::US0_Signed(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone());
                (v46.clone(), v47.clone())
            };
            write_12(v48.clone(), v49.clone(), v8, v9.clone())
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_write(v0: &str, v1: &str, v2: &str, v3: &str, v4: &str, v5: &str, v6: &str, v7: &str, v8: i32, v9: &str) -> (i32, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), Rc::<str>::from(v3), Rc::<str>::from(v4), Rc::<str>::from(v5), Rc::<str>::from(v6), Rc::<str>::from(v7), v8, Rc::<str>::from(v9))
}
