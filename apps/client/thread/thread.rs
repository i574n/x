#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum US0 {
    US0_CursorRepeated(Rc<str>, i32),
    US0_CursorBudget(Rc<str>, i32),
}
#[derive(Clone)]
enum US1 {
    US1_Reported(Rc<str>),
    US1_NoSuchAccount(Rc<str>),
    US1_CursorHalted(Rc<str>, US0),
}
#[derive(Clone)]
enum US2 {
    US2_Ok(Rc<str>, Rc<str>),
    US2_Error(US1),
}
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
#[derive(Clone)]
enum US3 {
    US3_Ok(Rc<UH0>),
    US3_Error(US1),
}
#[derive(Clone)]
enum US4 {
    US4_CursorEnd(US3),
    US4_CursorOn(Rc<str>, Rc<str>),
}
#[derive(Clone)]
enum US5 {
    US5_BearerToken(Rc<str>),
    US5_Anonymous,
}
#[derive(Clone)]
enum US6 {
    US6_Ok(serde_json::Value, Rc<str>),
    US6_Error(US1),
}
#[derive(Clone)]
enum US7 {
    US7_Ok(Rc<str>, Rc<str>, Rc<str>, Rc<str>),
    US7_Error(US1),
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(Rc<str>, Rc<UH2>),
}
#[derive(Clone)]
enum UH3 {
    UH3_Nil,
    UH3_Cons(Rc<str>, Rc<str>, Rc<str>, Rc<UH3>),
}
#[derive(Clone)]
enum US8 {
    US8_Some(Rc<str>),
    US8_None,
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, US8, Rc<UH1>),
}
fn method3(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
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
fn closure1(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> bool> {
    Rc::new(move |mut v2: Rc<str>| -> bool {
        let v3: bool = &*v2 == &*v0;
        v3
    })
}
fn method4(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> bool> {
    closure1(v0, v1)
}
fn method5(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<dyn Fn(Rc<str>) -> bool>, mut v3: Rc<UH0>) -> bool {
    loop {
        match Rc::unwrap_or_clone(v3) {
            UH0::UH0_Cons(v4, v5) => {
                let v4: Rc<str> = v4;
                let v5: Rc<UH0> = v5;
                let v6: bool = v2(v4);
                if v6 {
                    return true;
                } else {
                    let mut v7: Rc<dyn Fn(Rc<str>) -> bool> = method4(v0.clone(), v1.clone());
                    (v2, v3) = (v7, v5);
                    continue;
                }
            }
            UH0::UH0_Nil => {
                return false;
            }
        }
    }
}
fn walked_from_2(mut v0: Rc<dyn Fn(US0) -> US1>, mut v1: i32, mut v2: Rc<dyn Fn(Rc<str>) -> US2>, mut v3: Rc<str>, mut v4: Rc<UH0>, mut v5: i32, mut v6: Rc<UH0>) -> US3 {
    loop {
        let mut v7: bool = v5 >= v1;
        let v37: US4 = if v7 {
            let v8: US0 = US0::US0_CursorBudget(v3, v5);
            let v9: US1 = v0(v8);
            let v10: US3 = US3::US3_Error(v9);
            US4::US4_CursorEnd(v10)
        } else {
            let v12: US2 = v2(v3);
            match v12 {
                US2::US2_Error(v13) => {
                    let v13: US1 = v13;
                    let v14: US3 = US3::US3_Error(v13);
                    US4::US4_CursorEnd(v14)
                }
                US2::US2_Ok(v16, v17) => {
                    let v16: Rc<str> = v16;
                    let v17: Rc<str> = v17;
                    let v18: bool = &*v16 == "";
                    if v18 {
                        let v20: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                        let v21: Rc<UH0> = Rc::new(UH0::UH0_Cons(v17, v20));
                        let v22: Rc<UH0> = method3(v6.clone(), v21);
                        let mut v23: US3 = US3::US3_Ok(v22);
                        US4::US4_CursorEnd(v23)
                    } else {
                        let v25: Rc<dyn Fn(Rc<str>) -> bool> = method4(v16.clone(), v17.clone());
                        let v26: bool = method5(v16.clone(), v17.clone(), v25, v4.clone());
                        if v26 {
                            let v27: i32 = v5.wrapping_add(1i32);
                            let v28: US0 = US0::US0_CursorRepeated(v16, v27);
                            let v29: US1 = v0(v28);
                            let v30: US3 = US3::US3_Error(v29);
                            US4::US4_CursorEnd(v30)
                        } else {
                            US4::US4_CursorOn(v16, v17)
                        }
                    }
                }
            }
        };
        match v37 {
            US4::US4_CursorEnd(v38) => {
                let v38: US3 = v38;
                return v38;
            }
            US4::US4_CursorOn(v39, v40) => {
                let v39: Rc<str> = v39;
                let v40: Rc<str> = v40;
                let v41: i32 = v5.wrapping_add(1i32);
                let v42: Rc<UH0> = Rc::new(UH0::UH0_Cons(v39.clone(), v4));
                let v43: Rc<UH0> = Rc::new(UH0::UH0_Cons(v40, v6));
                (v3, v4, v5, v6) = (v39, v42, v41, v43);
                continue;
            }
        }
    }
}
fn closure2(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> Rc<dyn Fn(US0) -> US1> {
    Rc::new(move |mut v3: US0| -> US1 {
        let v4: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("conversation "); } LIT.with(|lit| lit.clone()) }, v0.clone()));
        US1::US1_CursorHalted(v4, v3)
    })
}
fn app_reply_6(mut v0: Rc<str>, mut v1: US5, mut v2: Rc<str>) -> US6 {
    let v3: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v2.clone()));
    let v8: Rc<str> = match v1 {
        US5::US5_Anonymous => {
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v6
        }
        US5::US5_BearerToken(v4) => {
            let v4: Rc<str> = v4;
            let v5: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) }, v4));
            v5
        }
    };
    let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("GET"); } LIT.with(|lit| lit.clone()) };
    let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v11, mut v12): (i32, Rc<str>) = xc_net::xc_send(&*v9, &*v3, &*v8, &*v10);
    let (mut v13, mut v14): (i32, Rc<str>) = xc_api::xc_classified(&*v2, v11, &*v12);
    let v15: bool = v13 == 0i32;
    if v15 {
        let v16: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v14).unwrap_or_default();
        US6::US6_Ok(v16, v14)
    } else {
        let v18: US1 = US1::US1_Reported(v14);
        US6::US6_Error(v18)
    }
}
fn closure3(mut v0: Rc<str>, mut v1: US5, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> US2> {
    Rc::new(move |mut v5: Rc<str>| -> US2 {
        let v6: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/search/all?query=conversation_id%3A"); } LIT.with(|lit| lit.clone()) }, v2.clone()));
        let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("%20from%3A"); } LIT.with(|lit| lit.clone()) }));
        let v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v3.clone()));
        let v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&start_time="); } LIT.with(|lit| lit.clone()) }));
        let v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v4.clone()));
        let v11: Rc<str> = Rc::<str>::from(format!("{}{}", v10, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&max_results=100&post.fields=conversation_id,entities,referenced_posts"); } LIT.with(|lit| lit.clone()) }));
        let v12: bool = &*v5 == "";
        let v15: Rc<str> = if v12 {
            v11
        } else {
            let v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&next_token="); } LIT.with(|lit| lit.clone()) }));
            let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v5));
            v14
        };
        let v16: US6 = app_reply_6(v0.clone(), v1.clone(), v15);
        match v16 {
            US6::US6_Error(v25) => {
                let v25: US1 = v25;
                US2::US2_Error(v25)
            }
            US6::US6_Ok(v17, v18) => {
                let v17: serde_json::Value = v17;
                let v18: Rc<str> = v18;
                let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("meta"); } LIT.with(|lit| lit.clone()) };
                let v20: serde_json::Value = v17.get(&*v19).cloned().unwrap_or_default();
                let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("next_token"); } LIT.with(|lit| lit.clone()) };
                let v22: serde_json::Value = v20.get(&*v21).cloned().unwrap_or_default();
                let mut v23: Rc<str> = Rc::<str>::from(v22.as_str().unwrap_or(""));
                US2::US2_Ok(v23, v18)
            }
        }
    })
}
fn rooted_1(mut v0: Rc<str>, mut v1: US5, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>) -> US3 {
    let mut v7: i32 = (v5.clone().len() as i32);
    let v8: bool = v7 < 19i32;
    let v13: Rc<str> = if v8 {
        v5
    } else {
        let v9: usize = ((0i32) as usize);
        let v10: usize = ((19i32) as usize);
        let v11: Rc<str> = Rc::<str>::from(&(v5)[v9..v10]);
        let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Z"); } LIT.with(|lit| lit.clone()) }));
        v12
    };
    let v14: bool = &*v3 != "";
    if v14 {
        let v15: Rc<dyn Fn(US0) -> US1> = closure2(v3.clone(), v4.clone(), v13.clone());
        let v16: i32 = 500i32;
        let v17: Rc<dyn Fn(Rc<str>) -> US2> = closure3(v0, v1, v3, v4, v13);
        let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let v19: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v20: i32 = 0i32;
        let v21: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        walked_from_2(v15, v16, v17, v18, v19, v20, v21)
    } else {
        let mut v23: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/"); } LIT.with(|lit| lit.clone()) }, v2));
        let v24: Rc<str> = Rc::<str>::from(format!("{}{}", v23, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("?post.fields=conversation_id,author_id,created_at"); } LIT.with(|lit| lit.clone()) }));
        let v25: Rc<str> = Rc::<str>::from((404i32).to_string());
        let v26: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) }, v25));
        let v27: Rc<str> = Rc::<str>::from(format!("{}{}", v26, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) }));
        let v28: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v24));
        let v29: Rc<str> = Rc::<str>::from(format!("{}{}", v28, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) }));
        let v30: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v6));
        let v31: US1 = US1::US1_Reported(v30);
        US3::US3_Error(v31)
    }
}
fn thread_bodies_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> US3 {
    let v3: i32 = (v0.clone().len() as i32);
    let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let v5: bool = v0.ends_with(&*v4);
    let v10: Rc<str> = if v5 {
        let v6: i32 = v3.wrapping_sub(1i32);
        let mut v7: usize = ((0i32) as usize);
        let v8: usize = ((v6) as usize);
        let v9: Rc<str> = Rc::<str>::from(&(v0)[v7..v8]);
        v9
    } else {
        v0
    };
    let v11: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/"); } LIT.with(|lit| lit.clone()) }, v2.clone()));
    let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("?post.fields=conversation_id,author_id,created_at"); } LIT.with(|lit| lit.clone()) }));
    let v13: US5 = US5::US5_BearerToken(v1.clone());
    let v14: US6 = app_reply_6(v10.clone(), v13, v12);
    let v44: US7 = match v14 {
        US6::US6_Error(v41) => {
            let v41: US1 = v41;
            US7::US7_Error(v41)
        }
        US6::US6_Ok(v15, v16) => {
            let v15: serde_json::Value = v15;
            let v16: Rc<str> = v16;
            let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let v18: serde_json::Value = v15.get(&*v17).cloned().unwrap_or_default();
            let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
            let v20: serde_json::Value = v15.get(&*v19).cloned().unwrap_or_default();
            let v21: usize = ((0i32) as usize);
            let v22: serde_json::Value = v20.get(v21).cloned().unwrap_or_default();
            let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
            let v24: serde_json::Value = v22.get(&*v23).cloned().unwrap_or_default();
            let v25: Rc<str> = Rc::<str>::from(v24.as_str().unwrap_or(""));
            let v26: bool = &*v25 != "";
            let v30: Rc<str> = if v26 {
                v25
            } else {
                let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
                let v28: serde_json::Value = v22.get(&*v27).cloned().unwrap_or_default();
                let v29: Rc<str> = Rc::<str>::from(v28.as_str().unwrap_or(""));
                v29
            };
            let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("conversation_id"); } LIT.with(|lit| lit.clone()) };
            let v32: serde_json::Value = v18.get(&*v31).cloned().unwrap_or_default();
            let v33: Rc<str> = Rc::<str>::from(v32.as_str().unwrap_or(""));
            let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("author_id"); } LIT.with(|lit| lit.clone()) };
            let v35: serde_json::Value = v18.get(&*v34).cloned().unwrap_or_default();
            let v36: Rc<str> = Rc::<str>::from(v35.as_str().unwrap_or(""));
            let v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("created_at"); } LIT.with(|lit| lit.clone()) };
            let v38: serde_json::Value = v18.get(&*v37).cloned().unwrap_or_default();
            let v39: Rc<str> = Rc::<str>::from(v38.as_str().unwrap_or(""));
            US7::US7_Ok(v33, v36, v39, v30)
        }
    };
    let v45: US5 = US5::US5_BearerToken(v1);
    match v44 {
        US7::US7_Error(v51) => {
            let v51: US1 = v51;
            US3::US3_Error(v51)
        }
        US7::US7_Ok(v46, v47, v48, v49) => {
            let v46: Rc<str> = v46;
            let v47: Rc<str> = v47;
            let v48: Rc<str> = v48;
            let v49: Rc<str> = v49;
            rooted_1(v10, v45, v2, v46, v47, v48, v49)
        }
    }
}
fn describe_failure_7(mut v0: US1) -> Rc<str> {
    match v0 {
        US1::US1_CursorHalted(v4, v5) => {
            let v4: Rc<str> = v4;
            let v5: US0 = v5;
            let v6: Rc<str> = Rc::<str>::from(format!("{}{}", v4, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) }));
            let v21: Rc<str> = match v5 {
                US0::US0_CursorBudget(v14, v15) => {
                    let v14: Rc<str> = v14;
                    let v15: i32 = v15;
                    let v16: Rc<str> = Rc::<str>::from((v15).to_string());
                    let v17: Rc<str> = Rc::<str>::from(format!("{}{}", v16, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" pages"); } LIT.with(|lit| lit.clone()) }));
                    let v18: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("stopped after "); } LIT.with(|lit| lit.clone()) }, v17));
                    let v19: Rc<str> = Rc::<str>::from(format!("{}{}", v18, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" (page budget)"); } LIT.with(|lit| lit.clone()) }));
                    v19
                }
                US0::US0_CursorRepeated(v7, v8) => {
                    let mut v7: Rc<str> = v7;
                    let v8: i32 = v8;
                    let v9: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("the API repeated cursor "); } LIT.with(|lit| lit.clone()) }, v7));
                    let v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" after "); } LIT.with(|lit| lit.clone()) }));
                    let v11: Rc<str> = Rc::<str>::from((v8).to_string());
                    let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" pages"); } LIT.with(|lit| lit.clone()) }));
                    let v13: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v12));
                    v13
                }
            };
            let v22: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v21));
            v22
        }
        US1::US1_NoSuchAccount(v2) => {
            let mut v2: Rc<str> = v2;
            let v3: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) }, v2));
            v3
        }
        US1::US1_Reported(v1) => {
            let mut v1: Rc<str> = v1;
            v1
        }
    }
}
fn method9(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
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
fn delimited_8(mut v0: Rc<str>, mut v1: Rc<UH0>) -> Rc<str> {
    let mut v2: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v3: i32 = 0i32;
    let v4: i32 = method9(v2.clone(), v1, v3);
    let v5: Rc<Vec<Rc<str>>> = Rc::new(v2.borrow().clone());
    let v6: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v5).as_ref().clone()));
    let mut v7: Rc<str> = Rc::<str>::from((*v6.borrow()).join(&*v0));
    v7
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>) {
        let v3: US3 = thread_bodies_0(v0, v1, v2);
        match v3 {
            US3::US3_Error(v10) => {
                let v10: US1 = v10;
                let v11: Rc<str> = describe_failure_7(v10);
                let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (4i32, v12, v11)
            }
            US3::US3_Ok(v4) => {
                let v4: Rc<UH0> = v4;
                let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                let v6: Rc<str> = delimited_8(v5, v4);
                let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) }, v6));
                let v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) }));
                let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (0i32, v8, v9)
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method11(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2;
            let v3: Rc<UH0> = v3;
            let v4: Rc<UH0> = method11(v3, v1);
            Rc::new(UH0::UH0_Cons(v2, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn from_13(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2;
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
            let v8: Rc<UH0> = Rc::new(UH0::UH0_Cons(v7, v2));
            (v1, v2) = (v4, v8);
            continue;
        }
    }
}
fn method14(mut v0: Rc<UH0>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2;
            let v3: Rc<UH0> = v3;
            let v4: Rc<UH2> = method14(v3, v1);
            Rc::new(UH2::UH2_Cons(v2, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn from_15(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH3>) -> Rc<UH3> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2;
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("url"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("expanded_url"); } LIT.with(|lit| lit.clone()) };
            let v11: serde_json::Value = v6.get(&*v10).cloned().unwrap_or_default();
            let v12: Rc<str> = Rc::<str>::from(v11.as_str().unwrap_or(""));
            let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
            let v14: serde_json::Value = v6.get(&*v13).cloned().unwrap_or_default();
            let v15: Rc<str> = Rc::<str>::from(v14.as_str().unwrap_or(""));
            let v16: Rc<UH3> = Rc::new(UH3::UH3_Cons(v9, v12, v15, v2));
            (v1, v2) = (v4, v16);
            continue;
        }
    }
}
fn first_reply_from_16(mut v0: i32, mut v1: serde_json::Value) -> Rc<str> {
    loop {
        let mut v2: usize = v1.as_array().map_or(0, Vec::len);
        let v3: i32 = ((v2) as i32);
        let v4: bool = v0 >= v3;
        if v4 {
            let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            return v5;
        } else {
            let v6: usize = ((v0) as usize);
            let mut v7: serde_json::Value = v1.get(v6).cloned().unwrap_or_default();
            let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("type"); } LIT.with(|lit| lit.clone()) };
            let v9: serde_json::Value = v7.get(&*v8).cloned().unwrap_or_default();
            let v10: Rc<str> = Rc::<str>::from(v9.as_str().unwrap_or(""));
            let v11: bool = &*v10 == "replied_to";
            if v11 {
                let v12: usize = ((v0) as usize);
                let v13: serde_json::Value = v1.get(v12).cloned().unwrap_or_default();
                let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
                let v15: serde_json::Value = v13.get(&*v14).cloned().unwrap_or_default();
                let v16: Rc<str> = Rc::<str>::from(v15.as_str().unwrap_or(""));
                return v16;
            } else {
                let v17: i32 = v0.wrapping_add(1i32);
                v0 = v17;
                continue;
            }
        }
    }
}
fn from_12(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2;
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
            let v11: serde_json::Value = v6.get(&*v10).cloned().unwrap_or_default();
            let v12: Rc<str> = Rc::<str>::from(v11.as_str().unwrap_or(""));
            let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&lt;"); } LIT.with(|lit| lit.clone()) };
            let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("<"); } LIT.with(|lit| lit.clone()) };
            let v15: Rc<str> = Rc::<str>::from(v12.replace(&*v13, &*v14));
            let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&gt;"); } LIT.with(|lit| lit.clone()) };
            let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(">"); } LIT.with(|lit| lit.clone()) };
            let v18: Rc<str> = Rc::<str>::from(v15.replace(&*v16, &*v17));
            let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&amp;"); } LIT.with(|lit| lit.clone()) };
            let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&"); } LIT.with(|lit| lit.clone()) };
            let v21: Rc<str> = Rc::<str>::from(v18.replace(&*v19, &*v20));
            let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("edit_history_post_ids"); } LIT.with(|lit| lit.clone()) };
            let mut v23: serde_json::Value = v6.get(&*v22).cloned().unwrap_or_default();
            let v24: usize = v23.as_array().map_or(0, Vec::len);
            let v25: i32 = ((v24) as i32);
            let v26: i32 = v25.wrapping_sub(1i32);
            let v27: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v28: Rc<UH0> = from_13(v23, v26, v27);
            let v29: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let v30: Rc<UH2> = method14(v28, v29);
            let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("entities"); } LIT.with(|lit| lit.clone()) };
            let v32: serde_json::Value = v6.get(&*v31).cloned().unwrap_or_default();
            let v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("urls"); } LIT.with(|lit| lit.clone()) };
            let mut v34: serde_json::Value = v32.get(&*v33).cloned().unwrap_or_default();
            let v35: usize = v34.as_array().map_or(0, Vec::len);
            let v36: i32 = ((v35) as i32);
            let v37: i32 = v36.wrapping_sub(1i32);
            let v38: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
            let v39: Rc<UH3> = from_15(v34, v37, v38);
            let v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
            let v41: serde_json::Value = v6.get(&*v40).cloned().unwrap_or_default();
            let v42: i32 = 0i32;
            let v43: Rc<str> = first_reply_from_16(v42, v41);
            let v44: bool = &*v43 == "";
            let v47: US8 = if v44 {
                US8::US8_None
            } else {
                US8::US8_Some(v43)
            };
            let v48: Rc<UH1> = Rc::new(UH1::UH1_Cons(v9, v21, v30, v39, v47, v2));
            (v1, v2) = (v4, v48);
            continue;
        }
    }
}
fn method18(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH2::UH2_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2;
                let v3: Rc<UH2> = v3;
                let v4: Rc<UH2> = Rc::new(UH2::UH2_Cons(v2, v1));
                (v0, v1) = (v3, v4);
                continue;
            }
            UH2::UH2_Nil => {
                return v1;
            }
        }
    }
}
fn method17(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7) => {
            let mut v2: Rc<str> = v2;
            let v3: Rc<str> = v3;
            let v4: Rc<UH2> = v4;
            let v5: Rc<UH3> = v5;
            let v6: US8 = v6;
            let mut v7: Rc<UH1> = v7;
            let v8: Rc<UH1> = method17(v7, v1);
            let v9: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let v10: Rc<UH2> = method18(v4.clone(), v9);
            let v15: bool = match Rc::unwrap_or_clone(v10) {
                UH2::UH2_Cons(v11, v12) => {
                    let v11: Rc<str> = v11;
                    let v12: Rc<UH2> = v12;
                    let v13: bool = &*v11 == &*v2;
                    v13
                }
                UH2::UH2_Nil => {
                    true
                }
            };
            if v15 {
                Rc::new(UH1::UH1_Cons(v2, v3, v4, v5, v6, v8))
            } else {
                v8
            }
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method19(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7) => {
            let mut v2: Rc<str> = v2;
            let v3: Rc<str> = v3;
            let v4: Rc<UH2> = v4;
            let v5: Rc<UH3> = v5;
            let v6: US8 = v6;
            let mut v7: Rc<UH1> = v7;
            let v8: Rc<UH0> = method19(v7, v1);
            Rc::new(UH0::UH0_Cons(v2, v8))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method10(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2;
            let v3: Rc<UH0> = v3;
            let v4: Rc<UH0> = method10(v3, v1);
            let v5: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v2).unwrap_or_default();
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let v8: usize = v7.as_array().map_or(0, Vec::len);
            let v9: i32 = ((v8) as i32);
            let v10: i32 = v9.wrapping_sub(1i32);
            let v11: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v12: Rc<UH1> = from_12(v7, v10, v11);
            let v13: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v14: Rc<UH1> = method17(v12, v13);
            let v15: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v16: Rc<UH0> = method19(v14, v15);
            method11(v16, v4)
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn closure4() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>) {
        let v3: US3 = thread_bodies_0(v0, v1, v2);
        match v3 {
            US3::US3_Error(v10) => {
                let v10: US1 = v10;
                let v11: Rc<str> = describe_failure_7(v10);
                let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (4i32, v12, v11)
            }
            US3::US3_Ok(v4) => {
                let v4: Rc<UH0> = v4;
                let v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let v6: Rc<UH0> = method10(v4, v5);
                let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                let v8: Rc<str> = delimited_8(v7, v6);
                let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (0i32, v8, v9)
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_thread_pages(v0: &str, v1: &str, v2: &str) -> (i32, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2))
}
pub fn xc_thread_ids(v0: &str, v1: &str, v2: &str) -> (i32, Rc<str>, Rc<str>) {
    closure4()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2))
}
