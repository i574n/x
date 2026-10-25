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
    US1_Unstarted,
    US1_After(Rc<str>, Rc<str>),
}
#[derive(Clone)]
enum US2 {
    US2_CreatePost(Rc<str>),
    US2_ReplyPost(Rc<str>, Rc<str>, Rc<str>),
}
#[derive(Clone)]
enum US5 {
    US5_CursorRepeated(Rc<str>, i32),
    US5_CursorBudget(Rc<str>, i32),
}
#[derive(Clone)]
enum US4 {
    US4_Reported(Rc<str>),
    US4_NoSuchAccount(Rc<str>),
    US4_CursorHalted(Rc<str>, US5),
}
#[derive(Clone)]
enum US3 {
    US3_Ok(Rc<str>, Rc<str>),
    US3_Error(US4),
}
#[derive(Clone)]
enum US6 {
    US6_Read,
    US6_Write(Rc<str>),
    US6_Remove,
}
#[derive(Clone)]
enum US7 {
    US7_Ok(serde_json::Value, Rc<str>),
    US7_Error(US4),
}
#[derive(Clone)]
enum US8 {
    US8_DeletePost(Rc<str>),
}
#[derive(Clone)]
enum US9 {
    US9_Ok(bool),
    US9_Error(US4),
}
#[derive(Clone)]
enum US10 {
    US10_Ok(Rc<str>),
    US10_Error(Rc<str>),
}
fn closure1(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: i32, mut v9: Rc<str>) -> Rc<dyn Fn(i32) -> (Rc<str>, US0)> {
    Rc::new(move |mut v10: i32| -> (Rc<str>, US0) {
        let v11: bool = v10 == 0i32;
        let mut v14: Rc<str> = if v11 {
            v6.clone()
        } else {
            let v13: Rc<str> = Rc::<str>::from(format!("{}{}", v6, Rc::<str>::from(format!("{:?}", v10))));
            v13.clone()
        };
        let v15: bool = &*v1 != "";
        if v15 {
            let v16: i32 = (v0.clone().len() as i32);
            let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
            let v18: bool = v0.ends_with(&*v17);
            let v21: Rc<str> = if v18 {
                let v19: i32 = v16.wrapping_sub(2i32);
                let v20: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v19 as i64);
                v20.clone()
            } else {
                v0.clone()
            };
            let v22: US0 = US0::US0_BearerToken(v1.clone());
            (v21.clone(), v22.clone())
        } else {
            let v23: i32 = (v0.clone().len() as i32);
            let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
            let v25: bool = v0.ends_with(&*v24);
            let v28: Rc<str> = if v25 {
                let v26: i32 = v23.wrapping_sub(2i32);
                let v27: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v26 as i64);
                v27.clone()
            } else {
                v0.clone()
            };
            let v29: US0 = US0::US0_Signed(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v14.clone(), v7.clone());
            (v28.clone(), v29.clone())
        }
    })
}
fn from_0(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v10.clone());
            continue;
        }
    }
}
fn method1(mut v0: Rc<UH0>, mut v1: Rc<str>) -> Rc<str> {
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
fn method4(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
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
fn raw_reply_6(mut v0: Rc<str>, mut v1: US0, mut v2: US6, mut v3: Rc<str>) -> US7 {
    let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v3));
    let v11: Rc<str> = match &v2 {
        US6::US6_Read => {
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("GET"); } LIT.with(|lit| lit.clone()) };
            v5
        }
        US6::US6_Remove => {
            let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("DELETE"); } LIT.with(|lit| lit.clone()) };
            v8
        }
        US6::US6_Write(v6) => {
            let v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("POST"); } LIT.with(|lit| lit.clone()) };
            v7
        }
    };
    let v23: Rc<str> = match &v1 {
        US0::US0_BearerToken(v12) => {
            let v12: Rc<str> = v12.clone();
            let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) };
            let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v12));
            v14
        }
        US0::US0_Signed(v15, v16, v17, v18, v19, v20) => {
            let v15: Rc<str> = v15.clone();
            let v16: Rc<str> = v16.clone();
            let mut v17: Rc<str> = v17.clone();
            let v18: Rc<str> = v18.clone();
            let v19: Rc<str> = v19.clone();
            let v20: Rc<str> = v20.clone();
            let v21: Rc<str> = xc_net::xc_oauth1_header(&*v15, &*v16, &*v17, &*v18, &*v11, &*v4, &*v19, &*v20);
            v21
        }
    };
    let v26: Rc<str> = match &v2 {
        US6::US6_Write(v24) => {
            let v24: Rc<str> = v24.clone();
            v24
        }
        _ => {
            let v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v25
        }
    };
    let (mut v27, mut v28): (i32, Rc<str>) = xc_net::xc_send(&*v11, &*v4, &*v23, &*v26);
    let (mut v29, mut v30): (i32, Rc<str>) = xc_api::xc_classified(&*v3, v27, &*v28);
    let v31: bool = v29 == 0i32;
    if v31 {
        let v32: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v30).unwrap_or_default();
        US7::US7_Ok(v32, v30.clone())
    } else {
        let mut v34: US4 = US4::US4_Reported(v30);
        US7::US7_Error(v34)
    }
}
fn method7(mut v0: serde_json::Value) -> (Rc<str>, Rc<str>) {
    let v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
    let v2: serde_json::Value = v0.get(&*v1).cloned().unwrap_or_default();
    let v3: Rc<str> = Rc::<str>::from(v2.as_str().unwrap_or(""));
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
    let mut v5: serde_json::Value = v0.get(&*v4).cloned().unwrap_or_default();
    let v6: Rc<str> = Rc::<str>::from(v5.as_str().unwrap_or(""));
    (v3, v6)
}
fn send_write_5(mut v0: Rc<str>, mut v1: US0, mut v2: US2) -> US3 {
    let v12: US6 = match &v2 {
        US2::US2_CreatePost(v3) => {
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = Rc::<str>::from(serde_json::json!({"text": &*v3}).to_string());
            US6::US6_Write(v4)
        }
        US2::US2_ReplyPost(v6, v7, v8) => {
            let v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = v7.clone();
            let v8: Rc<str> = v8.clone();
            let v9: Rc<str> = Rc::<str>::from(serde_json::json!({"text": &*v6, "reply": {"in_reply_to_tweet_id": &*v7}}).to_string());
            US6::US6_Write(v9)
        }
    };
    let v20: Rc<str> = match &v2 {
        US2::US2_CreatePost(v13) => {
            let v13: Rc<str> = v13.clone();
            let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets"); } LIT.with(|lit| lit.clone()) };
            v14
        }
        US2::US2_ReplyPost(v15, v16, v17) => {
            let v15: Rc<str> = v15.clone();
            let v16: Rc<str> = v16.clone();
            let mut v17: Rc<str> = v17.clone();
            let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets"); } LIT.with(|lit| lit.clone()) };
            v18
        }
    };
    let v21: US7 = raw_reply_6(v0, v1, v12, v20);
    match &v21 {
        US7::US7_Error(v39) => {
            let v39: US4 = v39.clone();
            US3::US3_Error(v39)
        }
        US7::US7_Ok(v22, v23) => {
            let v22: serde_json::Value = v22.clone();
            let v23: Rc<str> = v23.clone();
            let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let v25: serde_json::Value = v22.get(&*v24).cloned().unwrap_or_default();
            let (mut v36, mut v37): (Rc<str>, Rc<str>) = match &v2 {
                US2::US2_CreatePost(v26) => {
                    let v26: Rc<str> = v26.clone();
                    method7(v25.clone())
                }
                US2::US2_ReplyPost(v29, v30, v31) => {
                    let v29: Rc<str> = v29.clone();
                    let v30: Rc<str> = v30.clone();
                    let v31: Rc<str> = v31.clone();
                    method7(v25)
                }
            };
            US3::US3_Ok(v36, v37)
        }
    }
}
fn method8(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
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
fn method9(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method9(v4, v1.clone(), v2.clone());
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v3, v6)), v5));
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
            (v8, v9)
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1, v2)
                }
                _ => unreachable!(),
            };
            (v10, v11)
        }
    };
    (v12, v13)
}
fn describe_failure_10(mut v0: US4) -> Rc<str> {
    match &v0 {
        US4::US4_CursorHalted(v5, v6) => {
            let mut v5: Rc<str> = v5.clone();
            let v6: US5 = v6.clone();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v7));
            let v29: Rc<str> = match &v6 {
                US5::US5_CursorBudget(v19, v20) => {
                    let v19: Rc<str> = v19.clone();
                    let v20: i32 = *v20;
                    let v21: Rc<str> = Rc::<str>::from(format!("{:?}", v20));
                    let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" pages"); } LIT.with(|lit| lit.clone()) };
                    let v23: Rc<str> = Rc::<str>::from(format!("{}{}", v21, v22));
                    let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("stopped after "); } LIT.with(|lit| lit.clone()) };
                    let v25: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v23));
                    let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" (page budget)"); } LIT.with(|lit| lit.clone()) };
                    let v27: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v26));
                    v27
                }
                US5::US5_CursorRepeated(v9, v10) => {
                    let v9: Rc<str> = v9.clone();
                    let v10: i32 = *v10;
                    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("the API repeated cursor "); } LIT.with(|lit| lit.clone()) };
                    let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v9));
                    let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" after "); } LIT.with(|lit| lit.clone()) };
                    let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v13));
                    let v15: Rc<str> = Rc::<str>::from(format!("{:?}", v10));
                    let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" pages"); } LIT.with(|lit| lit.clone()) };
                    let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v14, Rc::<str>::from(format!("{}{}", v15, v16))));
                    v18
                }
            };
            let v30: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v29));
            v30
        }
        US4::US4_NoSuchAccount(v2) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
            let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v2));
            v4
        }
        US4::US4_Reported(v1) => {
            let v1: Rc<str> = v1.clone();
            v1
        }
    }
}
fn method11(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure2() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method12(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method12(v4, v1.clone(), v2.clone());
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v3, v6)), v5));
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            (v8, v9)
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1, v2)
                }
                _ => unreachable!(),
            };
            (v10, v11)
        }
    };
    (v12, v13)
}
fn chained_3(mut v0: Rc<dyn Fn(i32) -> (Rc<str>, US0)>, mut v1: Rc<UH0>, mut v2: US1, mut v3: Rc<UH0>, mut v4: Rc<UH0>, mut v5: bool) -> (i32, Rc<str>) {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v11, v12) => {
                let v11: Rc<str> = v11.clone();
                let v12: Rc<UH0> = v12.clone();
                let v13: i32 = 0i32;
                let mut v14: i32 = method4(v4.clone(), v13);
                let v15: i32 = v14.wrapping_add(1i32);
                let (mut v16, mut v17): (Rc<str>, US0) = v0(v15);
                let v23: US2 = match &v2 {
                    US1::US1_After(v19, v20) => {
                        let v19: Rc<str> = v19.clone();
                        let v20: Rc<str> = v20.clone();
                        US2::US2_ReplyPost(v11.clone(), v19.clone(), v20.clone())
                    }
                    US1::US1_Unstarted => {
                        US2::US2_CreatePost(v11.clone())
                    }
                };
                let v24: US3 = send_write_5(v16.clone(), v17.clone(), v23.clone());
                match &v24 {
                    US3::US3_Error(v49) => {
                        let v49: US4 = v49.clone();
                        let v50: i32 = 0i32;
                        let v51: i32 = method4(v4.clone(), v50);
                        let v52: bool = v51 == 0i32;
                        let v61: Rc<str> = if v52 {
                            let v53: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                            v53.clone()
                        } else {
                            let v54: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                            let v55: Rc<UH0> = method8(v4.clone(), v54.clone());
                            let v56: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                            let (mut v57, mut v58): (Rc<str>, Rc<str>) = method9(v55.clone(), v56.clone(), v56.clone());
                            let v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; posted before it: "); } LIT.with(|lit| lit.clone()) };
                            let v60: Rc<str> = Rc::<str>::from(format!("{}{}", v59, v57));
                            v60.clone()
                        };
                        let v62: Rc<str> = describe_failure_10(v49.clone());
                        let v63: Rc<str> = Rc::<str>::from(format!("{}{}", v62, v61));
                        let v64: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                        let v65: Rc<UH0> = method8(v4.clone(), v64.clone());
                        let v76: Rc<str> = if v5 {
                            let v66: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; continue with the same --resume command"); } LIT.with(|lit| lit.clone()) };
                            v66.clone()
                        } else {
                            match &*v65 {
                                UH0::UH0_Cons(v67, v68) => {
                                    let v67: Rc<str> = v67.clone();
                                    let v68: Rc<UH0> = v68.clone();
                                    let v69: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; continue with: xc post-thread --resume "); } LIT.with(|lit| lit.clone()) };
                                    let v70: Rc<str> = Rc::<str>::from(format!("{}{}", v69, v67));
                                    let v71: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" FILE"); } LIT.with(|lit| lit.clone()) };
                                    let v72: Rc<str> = Rc::<str>::from(format!("{}{}", v70, v71));
                                    v72.clone()
                                }
                                UH0::UH0_Nil => {
                                    let v73: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                                    v73.clone()
                                }
                            }
                        };
                        let v77: Rc<str> = Rc::<str>::from(format!("{}{}", v63, v76));
                        return (4i32, v77.clone());
                    }
                    US3::US3_Ok(v25, v26) => {
                        let v25: Rc<str> = v25.clone();
                        let v26: Rc<str> = v26.clone();
                        let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posted "); } LIT.with(|lit| lit.clone()) };
                        let v28: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v25));
                        let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
                        let v30: Rc<str> = Rc::<str>::from(format!("{}{}", v28, v29));
                        let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                        let v32: Option<usize> = v11.find(&*v31);
                        let v33: Option<usize> = method11(v32.clone());
                        let mut v34: Rc<dyn Fn((usize)) -> i32> = closure2();
                        let mut v35: Option<i32> = v33.map(|x| v34(x));
                        let v37: i32 = v35.unwrap_or(-1i32);
                        let v38: bool = v37 < 0i32;
                        let v42: Rc<str> = if v38 {
                            v11.clone()
                        } else {
                            let v39: usize = ((0i32) as usize);
                            let v40: usize = ((v37) as usize);
                            let v41: Rc<str> = Rc::<str>::from(&(v11)[v39..v40]);
                            v41.clone()
                        };
                        let v43: Rc<str> = Rc::<str>::from(format!("{}{}", v30, v42));
                        let v44: US1 = US1::US1_After(v25.clone(), v26.clone());
                        let v45: Rc<UH0> = Rc::new(UH0::UH0_Cons(v43.clone(), v3.clone()));
                        let v46: Rc<UH0> = Rc::new(UH0::UH0_Cons(v25.clone(), v4.clone()));
                        (v0, v1, v2, v3, v4, v5) = (v0.clone(), v12.clone(), v44.clone(), v45.clone(), v46.clone(), v5);
                        continue;
                    }
                }
            }
            UH0::UH0_Nil => {
                let v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let mut v7: Rc<UH0> = method8(v3.clone(), v6.clone());
                let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let (mut v9, mut v10): (Rc<str>, Rc<str>) = method12(v7.clone(), v8.clone(), v8.clone());
                return (0i32, v9.clone());
            }
        }
    }
}
fn from_13(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
            let v8: Rc<UH0> = Rc::new(UH0::UH0_Cons(v7.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v8.clone());
            continue;
        }
    }
}
fn resume_written_2(mut v0: Rc<dyn Fn(i32) -> (Rc<str>, US0)>, mut v1: Rc<str>, mut v2: Rc<str>) -> (i32, Rc<str>) {
    let (mut v3, mut v4, mut v5): (i32, i32, Rc<str>) = xc_resume::xc_resume_plan(&*v2);
    let v6: bool = v3 != 0i32;
    if v6 {
        (4i32, v5.clone())
    } else {
        let mut v7: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v5).unwrap_or_default();
        let v8: usize = v7.as_array().map_or(0, Vec::len);
        let v9: i32 = ((v8) as i32);
        let v10: i32 = v9.wrapping_sub(1i32);
        let v11: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v12: Rc<UH0> = from_13(v7, v10, v11);
        let v13: i32 = 0i32;
        let mut v14: i32 = method4(v12.clone(), v13);
        let v15: i32 = v4.wrapping_add(v14);
        let v16: Rc<str> = Rc::<str>::from(format!("{:?}", v4));
        let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("resumed after post "); } LIT.with(|lit| lit.clone()) };
        let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v16));
        let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" of "); } LIT.with(|lit| lit.clone()) };
        let v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v19));
        let v22: Rc<str> = Rc::<str>::from(format!("{}{}", v20, Rc::<str>::from(format!("{:?}", v15))));
        let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let v24: US1 = US1::US1_After(v1, v23);
        let v25: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v26: Rc<UH0> = Rc::new(UH0::UH0_Cons(v22, v25));
        let v27: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v28: bool = true;
        chained_3(v0, v12, v24, v26, v27, v28)
    }
}
fn split_on_14(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let v2: Option<usize> = v1.find(&*v0);
    let v3: Option<usize> = method11(v2);
    let mut v4: Rc<dyn Fn((usize)) -> i32> = closure2();
    let mut v5: Option<i32> = v3.map(|x| v4(x));
    let mut v7: i32 = v5.unwrap_or(-1i32);
    let v8: bool = v7 < 0i32;
    if v8 {
        let v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1.clone(), v9))
    } else {
        let v11: usize = ((0i32) as usize);
        let v12: usize = ((v7) as usize);
        let v13: Rc<str> = Rc::<str>::from(&(v1)[v11..v12]);
        let mut v14: i32 = v7.wrapping_add(1i32);
        let v15: i32 = (v1.clone().len() as i32);
        let v16: i32 = v15.wrapping_sub(v7);
        let mut v17: i32 = v16.wrapping_sub(1i32);
        let v18: usize = ((v14) as usize);
        let v19: i32 = v14.wrapping_add(v17);
        let v20: usize = ((v19) as usize);
        let v21: Rc<str> = Rc::<str>::from(&(v1)[v18..v20]);
        let v22: Rc<UH0> = split_on_14(v0, v21);
        Rc::new(UH0::UH0_Cons(v13, v22))
    }
}
fn send_write_17(mut v0: Rc<str>, mut v1: US0, mut v2: US8) -> US9 {
    let mut v5: US6 = match &v2 {
        US8::US8_DeletePost(v3) => {
            let v3: Rc<str> = v3.clone();
            US6::US6_Remove
        }
    };
    let v9: Rc<str> = match &v2 {
        US8::US8_DeletePost(v6) => {
            let v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/"); } LIT.with(|lit| lit.clone()) };
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v6));
            v8
        }
    };
    let v10: US7 = raw_reply_6(v0, v1, v5, v9);
    match &v10 {
        US7::US7_Error(v21) => {
            let v21: US4 = v21.clone();
            US9::US9_Error(v21)
        }
        US7::US7_Ok(v11, v12) => {
            let v11: serde_json::Value = v11.clone();
            let v12: Rc<str> = v12.clone();
            let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v14: serde_json::Value = v11.get(&*v13).cloned().unwrap_or_default();
            let v19: bool = match &v2 {
                US8::US8_DeletePost(v15) => {
                    let v15: Rc<str> = v15.clone();
                    let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("deleted"); } LIT.with(|lit| lit.clone()) };
                    let mut v17: serde_json::Value = v14.get(&*v16).cloned().unwrap_or_default();
                    let v18: bool = v17.as_bool().unwrap_or(false);
                    v18
                }
            };
            US9::US9_Ok(v19)
        }
    }
}
fn method16(mut v0: Rc<dyn Fn(i32) -> (Rc<str>, US0)>, mut v1: Rc<UH0>, mut v2: Rc<UH0>, mut v3: bool) -> (Rc<UH0>, bool) {
    let (mut v38, mut v39): (Rc<UH0>, bool) = match &*v1 {
        UH0::UH0_Cons(v4, v5) => {
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH0> = v5.clone();
            let v6: i32 = 0i32;
            let mut v7: i32 = method4(v2.clone(), v6);
            let v8: i32 = v7.wrapping_add(1i32);
            let (mut v9, mut v10): (Rc<str>, US0) = v0(v8);
            let v11: US8 = US8::US8_DeletePost(v4.clone());
            let v12: US9 = send_write_17(v9, v10, v11);
            let v25: US10 = match &v12 {
                US9::US9_Error(v21) => {
                    let v21: US4 = v21.clone();
                    let v22: Rc<str> = describe_failure_10(v21);
                    US10::US10_Error(v22)
                }
                US9::US9_Ok(v13) => {
                    let v13: bool = *v13;
                    if v13 {
                        let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("deleted "); } LIT.with(|lit| lit.clone()) };
                        let v15: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v4));
                        US10::US10_Ok(v15)
                    } else {
                        let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not deleted "); } LIT.with(|lit| lit.clone()) };
                        let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v4));
                        US10::US10_Error(v18)
                    }
                }
            };
            let (mut v32, mut v33): (Rc<UH0>, bool) = match &v25 {
                US10::US10_Ok(v26) => {
                    let v26: Rc<str> = v26.clone();
                    let v27: Rc<UH0> = Rc::new(UH0::UH0_Cons(v26, v2.clone()));
                    (v27, v3)
                }
                _ => {
                    let (mut v30, mut v31): (Rc<UH0>, bool) = match &v25 {
                        US10::US10_Error(v28) => {
                            let v28: Rc<str> = v28.clone();
                            let v29: Rc<UH0> = Rc::new(UH0::UH0_Cons(v28, v2.clone()));
                            (v29, true)
                        }
                        _ => unreachable!(),
                    };
                    (v30, v31)
                }
            };
            method16(v0, v5, v32, v33)
        }
        _ => {
            let (mut v36, mut v37): (Rc<UH0>, bool) = match &*v1 {
                UH0::UH0_Nil => {
                    (v2, v3)
                }
                _ => unreachable!(),
            };
            (v36, v37)
        }
    };
    (v38, v39)
}
fn removed_all_15(mut v0: Rc<dyn Fn(i32) -> (Rc<str>, US0)>, mut v1: Rc<UH0>) -> (i32, Rc<str>) {
    let v2: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v3: bool = false;
    let (mut v4, mut v5): (Rc<UH0>, bool) = method16(v0, v1, v2, v3);
    let v6: i32 = if v5 {
        4i32
    } else {
        0i32
    };
    let mut v7: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v8: Rc<UH0> = method8(v4, v7);
    let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v10, mut v11): (Rc<str>, Rc<str>) = method12(v8, v9.clone(), v9);
    (v6, v10)
}
fn from_18(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v10.clone());
            continue;
        }
    }
}
fn write_19(mut v0: Rc<str>, mut v1: US0, mut v2: i32, mut v3: Rc<str>) -> (i32, Rc<str>) {
    let mut v4: bool = v2 == 1i32;
    if v4 {
        let mut v5: US2 = US2::US2_CreatePost(v3.clone());
        let v6: US3 = send_write_5(v0.clone(), v1.clone(), v5);
        match &v6 {
            US3::US3_Error(v11) => {
                let v11: US4 = v11.clone();
                let v12: Rc<str> = describe_failure_10(v11);
                (4i32, v12)
            }
            US3::US3_Ok(v7, v8) => {
                let mut v7: Rc<str> = v7.clone();
                let v8: Rc<str> = v8.clone();
                let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posted "); } LIT.with(|lit| lit.clone()) };
                let v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v7));
                (0i32, v10)
            }
        }
    } else {
        let mut v17: US8 = US8::US8_DeletePost(v3.clone());
        let v18: US9 = send_write_17(v0, v1, v17);
        match &v18 {
            US9::US9_Error(v26) => {
                let v26: US4 = v26.clone();
                let v27: Rc<str> = describe_failure_10(v26);
                (4i32, v27)
            }
            US9::US9_Ok(v19) => {
                let v19: bool = *v19;
                if v19 {
                    let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("deleted "); } LIT.with(|lit| lit.clone()) };
                    let v21: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v3));
                    (0i32, v21)
                } else {
                    let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not deleted "); } LIT.with(|lit| lit.clone()) };
                    let v23: Rc<str> = Rc::<str>::from(format!("{}{}", v22, v3));
                    (4i32, v23)
                }
            }
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, Rc<str>) -> (i32, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, Rc<str>) -> (i32, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: i32, mut v9: Rc<str>| -> (i32, Rc<str>) {
        let v10: bool = v8 == 10i32;
        if v10 {
            let v11: Rc<dyn Fn(i32) -> (Rc<str>, US0)> = closure1(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8, v9.clone());
            let v12: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v9).unwrap_or_default();
            let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("found"); } LIT.with(|lit| lit.clone()) };
            let mut v14: serde_json::Value = v12.get(&*v13).cloned().unwrap_or_default();
            let v15: usize = v14.as_array().map_or(0, Vec::len);
            let v16: i32 = ((v15) as i32);
            let mut v17: i32 = v16.wrapping_sub(1i32);
            let v18: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v19: Rc<UH0> = from_0(v14.clone(), v17, v18.clone());
            let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let v21: Rc<str> = method1(v19.clone(), v20.clone());
            resume_written_2(v11.clone(), v21.clone(), v9.clone())
        } else {
            let v24: bool = v8 >= 7i32;
            if v24 {
                let v25: bool = v8 == 9i32;
                if v25 {
                    let v26: Rc<dyn Fn(i32) -> (Rc<str>, US0)> = closure1(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8, v9.clone());
                    let v27: bool = &*v9 == "";
                    let v31: Rc<UH0> = if v27 {
                        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
                    } else {
                        let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                        split_on_14(v29.clone(), v9.clone())
                    };
                    removed_all_15(v26.clone(), v31.clone())
                } else {
                    let mut v34: Rc<dyn Fn(i32) -> (Rc<str>, US0)> = closure1(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8, v9.clone());
                    let mut v35: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v9).unwrap_or_default();
                    let v36: usize = v35.as_array().map_or(0, Vec::len);
                    let v37: i32 = ((v36) as i32);
                    let v38: i32 = v37.wrapping_sub(1i32);
                    let v39: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let v40: Rc<UH0> = from_18(v35.clone(), v38, v39.clone());
                    let v41: US1 = US1::US1_Unstarted;
                    let v42: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let v43: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let v44: bool = false;
                    chained_3(v34.clone(), v40.clone(), v41.clone(), v42.clone(), v43.clone(), v44)
                }
            } else {
                let v49: bool = &*v1 != "";
                let (mut v64, mut v65): (Rc<str>, US0) = if v49 {
                    let v50: i32 = (v0.clone().len() as i32);
                    let v51: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
                    let v52: bool = v0.ends_with(&*v51);
                    let v55: Rc<str> = if v52 {
                        let v53: i32 = v50.wrapping_sub(2i32);
                        let v54: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v53 as i64);
                        v54.clone()
                    } else {
                        v0.clone()
                    };
                    let v56: US0 = US0::US0_BearerToken(v1.clone());
                    (v55.clone(), v56.clone())
                } else {
                    let v57: i32 = (v0.clone().len() as i32);
                    let v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
                    let v59: bool = v0.ends_with(&*v58);
                    let v62: Rc<str> = if v59 {
                        let v60: i32 = v57.wrapping_sub(2i32);
                        let v61: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v60 as i64);
                        v61.clone()
                    } else {
                        v0.clone()
                    };
                    let v63: US0 = US0::US0_Signed(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone());
                    (v62.clone(), v63.clone())
                };
                write_19(v64.clone(), v65.clone(), v8, v9.clone())
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_write(v0: &str, v1: &str, v2: &str, v3: &str, v4: &str, v5: &str, v6: &str, v7: &str, v8: i32, v9: &str) -> (i32, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), Rc::<str>::from(v3), Rc::<str>::from(v4), Rc::<str>::from(v5), Rc::<str>::from(v6), Rc::<str>::from(v7), v8, Rc::<str>::from(v9))
}
