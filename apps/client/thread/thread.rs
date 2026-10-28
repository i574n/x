#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
#[derive(Clone)]
enum US2 {
    US2_CursorRepeated(Rc<str>, i32),
    US2_CursorBudget(Rc<str>, i32),
}
#[derive(Clone)]
enum US1 {
    US1_Reported(Rc<str>),
    US1_NoSuchAccount(Rc<str>),
    US1_CursorHalted(Rc<str>, US2),
}
#[derive(Clone)]
enum US0 {
    US0_Ok(Rc<UH0>),
    US0_Error(US1),
}
#[derive(Clone)]
enum US3 {
    US3_BearerToken(Rc<str>),
    US3_Anonymous,
}
#[derive(Clone)]
enum US4 {
    US4_Ok(Rc<str>, Rc<str>),
    US4_Error(US1),
}
#[derive(Clone)]
enum US5 {
    US5_Ok(serde_json::Value, Rc<str>),
    US5_Error(US1),
}
#[derive(Clone)]
enum US6 {
    US6_Ok(Rc<str>, Rc<str>, Rc<str>, Rc<str>),
    US6_Error(US1),
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
enum US7 {
    US7_Some(Rc<str>),
    US7_None,
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, US7, Rc<UH1>),
}
fn method3(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let v4: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2.clone(), v1.clone()));
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH0::UH0_Nil => {
                return v1.clone();
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
        match &*v3 {
            UH0::UH0_Cons(v4, v5) => {
                let v4: Rc<str> = v4.clone();
                let v5: Rc<UH0> = v5.clone();
                let v6: bool = v2(v4.clone());
                if v6 {
                    return true;
                } else {
                    let mut v7: Rc<dyn Fn(Rc<str>) -> bool> = method4(v0.clone(), v1.clone());
                    (v0, v1, v2, v3) = (v0.clone(), v1.clone(), v7.clone(), v5.clone());
                    continue;
                }
            }
            UH0::UH0_Nil => {
                return false;
            }
        }
    }
}
fn walked_from_2(mut v0: Rc<dyn Fn(US2) -> US1>, mut v1: i32, mut v2: Rc<dyn Fn(Rc<str>) -> US4>, mut v3: Rc<str>, mut v4: Rc<UH0>, mut v5: i32, mut v6: Rc<UH0>) -> US0 {
    loop {
        let mut v7: bool = v5 >= v1;
        if v7 {
            let v8: US2 = US2::US2_CursorBudget(v3.clone(), v5);
            let v9: US1 = v0(v8.clone());
            return US0::US0_Error(v9.clone());
        } else {
            let v11: US4 = v2(v3.clone());
            match &v11 {
                US4::US4_Error(v12) => {
                    let v12: US1 = v12.clone();
                    return US0::US0_Error(v12.clone());
                }
                US4::US4_Ok(v14, v15) => {
                    let v14: Rc<str> = v14.clone();
                    let v15: Rc<str> = v15.clone();
                    let v16: bool = &*v14 == "";
                    if v16 {
                        let v18: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                        let v19: Rc<UH0> = Rc::new(UH0::UH0_Cons(v15.clone(), v18.clone()));
                        let v20: Rc<UH0> = method3(v6.clone(), v19.clone());
                        return US0::US0_Ok(v20.clone());
                    } else {
                        let v22: Rc<dyn Fn(Rc<str>) -> bool> = method4(v14.clone(), v15.clone());
                        let mut v23: bool = method5(v14.clone(), v15.clone(), v22.clone(), v4.clone());
                        if v23 {
                            let v24: i32 = v5.wrapping_add(1i32);
                            let v25: US2 = US2::US2_CursorRepeated(v14.clone(), v24);
                            let v26: US1 = v0(v25.clone());
                            return US0::US0_Error(v26.clone());
                        } else {
                            let v28: i32 = v5.wrapping_add(1i32);
                            let v29: Rc<UH0> = Rc::new(UH0::UH0_Cons(v14.clone(), v4.clone()));
                            let v30: Rc<UH0> = Rc::new(UH0::UH0_Cons(v15.clone(), v6.clone()));
                            (v0, v1, v2, v3, v4, v5, v6) = (v0.clone(), v1, v2.clone(), v14.clone(), v29.clone(), v28, v30.clone());
                            continue;
                        }
                    }
                }
            }
        }
    }
}
fn closure2(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> Rc<dyn Fn(US2) -> US1> {
    Rc::new(move |mut v3: US2| -> US1 {
        let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("conversation "); } LIT.with(|lit| lit.clone()) };
        let v5: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v0));
        US1::US1_CursorHalted(v5.clone(), v3.clone())
    })
}
fn app_reply_6(mut v0: Rc<str>, mut v1: US3, mut v2: Rc<str>) -> US5 {
    let v3: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v2));
    let v9: Rc<str> = match &v1 {
        US3::US3_Anonymous => {
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v7.clone()
        }
        US3::US3_BearerToken(v4) => {
            let v4: Rc<str> = v4.clone();
            let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) };
            let v6: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v4));
            v6.clone()
        }
    };
    let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("GET"); } LIT.with(|lit| lit.clone()) };
    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v12, mut v13): (i32, Rc<str>) = xc_net::xc_send(&*v10, &*v3, &*v9, &*v11);
    let (mut v14, mut v15): (i32, Rc<str>) = xc_api::xc_classified(&*v2, v12, &*v13);
    let v16: bool = v14 == 0i32;
    if v16 {
        let v17: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v15).unwrap_or_default();
        US5::US5_Ok(v17.clone(), v15.clone())
    } else {
        let v19: US1 = US1::US1_Reported(v15.clone());
        US5::US5_Error(v19.clone())
    }
}
fn closure3(mut v0: Rc<str>, mut v1: US3, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> US4> {
    Rc::new(move |mut v5: Rc<str>| -> US4 {
        let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/search/all?query=conversation_id%3A"); } LIT.with(|lit| lit.clone()) };
        let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v2));
        let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("%20from%3A"); } LIT.with(|lit| lit.clone()) };
        let v10: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v7, v8)), v3));
        let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&start_time="); } LIT.with(|lit| lit.clone()) };
        let v13: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v10, v11)), v4));
        let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&max_results=100&post.fields=conversation_id,entities,referenced_posts"); } LIT.with(|lit| lit.clone()) };
        let v15: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v14));
        let v16: bool = &*v5 == "";
        let v20: Rc<str> = if v16 {
            v15.clone()
        } else {
            let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&next_token="); } LIT.with(|lit| lit.clone()) };
            let v19: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v15, v17)), v5));
            v19.clone()
        };
        let v21: US5 = app_reply_6(v0.clone(), v1.clone(), v20.clone());
        match &v21 {
            US5::US5_Error(v30) => {
                let v30: US1 = v30.clone();
                US4::US4_Error(v30.clone())
            }
            US5::US5_Ok(v22, v23) => {
                let v22: serde_json::Value = v22.clone();
                let mut v23: Rc<str> = v23.clone();
                let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("meta"); } LIT.with(|lit| lit.clone()) };
                let v25: serde_json::Value = v22.get(&*v24).cloned().unwrap_or_default();
                let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("next_token"); } LIT.with(|lit| lit.clone()) };
                let v27: serde_json::Value = v25.get(&*v26).cloned().unwrap_or_default();
                let v28: Rc<str> = Rc::<str>::from(v27.as_str().unwrap_or(""));
                US4::US4_Ok(v28.clone(), v23.clone())
            }
        }
    })
}
fn rooted_1(mut v0: Rc<str>, mut v1: US3, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>) -> US0 {
    let mut v7: i32 = (v5.clone().len() as i32);
    let v8: bool = v7 < 19i32;
    let v14: Rc<str> = if v8 {
        v5.clone()
    } else {
        let v9: usize = ((0i32) as usize);
        let v10: usize = ((19i32) as usize);
        let v11: Rc<str> = Rc::<str>::from(&(v5)[v9..v10]);
        let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Z"); } LIT.with(|lit| lit.clone()) };
        let v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v12));
        v13.clone()
    };
    let v15: bool = &*v3 != "";
    if v15 {
        let v16: Rc<dyn Fn(US2) -> US1> = closure2(v3.clone(), v4.clone(), v14.clone());
        let v17: i32 = 500i32;
        let v18: Rc<dyn Fn(Rc<str>) -> US4> = closure3(v0.clone(), v1.clone(), v3.clone(), v4.clone(), v14.clone());
        let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let v20: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v21: i32 = 0i32;
        let v22: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        walked_from_2(v16.clone(), v17, v18.clone(), v19.clone(), v20.clone(), v21, v22.clone())
    } else {
        let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/"); } LIT.with(|lit| lit.clone()) };
        let v25: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v2));
        let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("?post.fields=conversation_id,author_id,created_at"); } LIT.with(|lit| lit.clone()) };
        let v27: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v26));
        let v28: Rc<str> = Rc::<str>::from(format!("{:?}", 404i32));
        let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
        let v30: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v28));
        let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
        let v33: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v30, v31)), v27));
        let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
        let v36: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v33, v34)), v6));
        let v37: US1 = US1::US1_Reported(v36.clone());
        US0::US0_Error(v37.clone())
    }
}
fn thread_bodies_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> US0 {
    let v3: i32 = (v0.clone().len() as i32);
    let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let v5: bool = v0.ends_with(&*v4);
    let v10: Rc<str> = if v5 {
        let v6: i32 = v3.wrapping_sub(1i32);
        let mut v7: usize = ((0i32) as usize);
        let v8: usize = ((v6) as usize);
        let v9: Rc<str> = Rc::<str>::from(&(v0)[v7..v8]);
        v9.clone()
    } else {
        v0.clone()
    };
    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/"); } LIT.with(|lit| lit.clone()) };
    let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v2));
    let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("?post.fields=conversation_id,author_id,created_at"); } LIT.with(|lit| lit.clone()) };
    let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v13));
    let v15: US3 = US3::US3_BearerToken(v1.clone());
    let v16: US5 = app_reply_6(v10.clone(), v15.clone(), v14.clone());
    let v46: US6 = match &v16 {
        US5::US5_Error(v43) => {
            let v43: US1 = v43.clone();
            US6::US6_Error(v43.clone())
        }
        US5::US5_Ok(v17, v18) => {
            let v17: serde_json::Value = v17.clone();
            let v18: Rc<str> = v18.clone();
            let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let v20: serde_json::Value = v17.get(&*v19).cloned().unwrap_or_default();
            let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
            let v22: serde_json::Value = v17.get(&*v21).cloned().unwrap_or_default();
            let mut v23: usize = ((0i32) as usize);
            let v24: serde_json::Value = v22.get(v23).cloned().unwrap_or_default();
            let v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
            let v26: serde_json::Value = v24.get(&*v25).cloned().unwrap_or_default();
            let v27: Rc<str> = Rc::<str>::from(v26.as_str().unwrap_or(""));
            let v28: bool = &*v27 != "";
            let v32: Rc<str> = if v28 {
                v27.clone()
            } else {
                let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
                let v30: serde_json::Value = v24.get(&*v29).cloned().unwrap_or_default();
                let v31: Rc<str> = Rc::<str>::from(v30.as_str().unwrap_or(""));
                v31.clone()
            };
            let v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("conversation_id"); } LIT.with(|lit| lit.clone()) };
            let mut v34: serde_json::Value = v20.get(&*v33).cloned().unwrap_or_default();
            let v35: Rc<str> = Rc::<str>::from(v34.as_str().unwrap_or(""));
            let v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("author_id"); } LIT.with(|lit| lit.clone()) };
            let v37: serde_json::Value = v20.get(&*v36).cloned().unwrap_or_default();
            let v38: Rc<str> = Rc::<str>::from(v37.as_str().unwrap_or(""));
            let v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("created_at"); } LIT.with(|lit| lit.clone()) };
            let v40: serde_json::Value = v20.get(&*v39).cloned().unwrap_or_default();
            let v41: Rc<str> = Rc::<str>::from(v40.as_str().unwrap_or(""));
            US6::US6_Ok(v35.clone(), v38.clone(), v41.clone(), v32.clone())
        }
    };
    let v47: US3 = US3::US3_BearerToken(v1.clone());
    match &v46 {
        US6::US6_Error(v53) => {
            let v53: US1 = v53.clone();
            US0::US0_Error(v53.clone())
        }
        US6::US6_Ok(v48, v49, v50, v51) => {
            let v48: Rc<str> = v48.clone();
            let v49: Rc<str> = v49.clone();
            let v50: Rc<str> = v50.clone();
            let v51: Rc<str> = v51.clone();
            rooted_1(v10.clone(), v47.clone(), v2.clone(), v48.clone(), v49.clone(), v50.clone(), v51.clone())
        }
    }
}
fn describe_failure_7(mut v0: US1) -> Rc<str> {
    match &v0 {
        US1::US1_CursorHalted(v5, v6) => {
            let v5: Rc<str> = v5.clone();
            let v6: US2 = v6.clone();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v7));
            let v29: Rc<str> = match &v6 {
                US2::US2_CursorBudget(v19, v20) => {
                    let v19: Rc<str> = v19.clone();
                    let v20: i32 = *v20;
                    let v21: Rc<str> = Rc::<str>::from(format!("{:?}", v20));
                    let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" pages"); } LIT.with(|lit| lit.clone()) };
                    let mut v23: Rc<str> = Rc::<str>::from(format!("{}{}", v21, v22));
                    let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("stopped after "); } LIT.with(|lit| lit.clone()) };
                    let v25: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v23));
                    let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" (page budget)"); } LIT.with(|lit| lit.clone()) };
                    let v27: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v26));
                    v27.clone()
                }
                US2::US2_CursorRepeated(v9, v10) => {
                    let v9: Rc<str> = v9.clone();
                    let v10: i32 = *v10;
                    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("the API repeated cursor "); } LIT.with(|lit| lit.clone()) };
                    let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v9));
                    let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" after "); } LIT.with(|lit| lit.clone()) };
                    let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v13));
                    let v15: Rc<str> = Rc::<str>::from(format!("{:?}", v10));
                    let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" pages"); } LIT.with(|lit| lit.clone()) };
                    let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v14, Rc::<str>::from(format!("{}{}", v15, v16))));
                    v18.clone()
                }
            };
            let v30: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v29));
            v30.clone()
        }
        US1::US1_NoSuchAccount(v2) => {
            let mut v2: Rc<str> = v2.clone();
            let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
            let v4: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v2));
            v4.clone()
        }
        US1::US1_Reported(v1) => {
            let mut v1: Rc<str> = v1.clone();
            v1.clone()
        }
    }
}
fn method9(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3.clone();
                let v4: Rc<UH0> = v4.clone();
                v0.borrow_mut().push(v3);
                let v5: i32 = v2.wrapping_add(1i32);
                (v0, v1, v2) = (v0.clone(), v4.clone(), v5);
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
        let v3: US0 = thread_bodies_0(v0.clone(), v1.clone(), v2.clone());
        match &v3 {
            US0::US0_Error(v12) => {
                let v12: US1 = v12.clone();
                let v13: Rc<str> = describe_failure_7(v12.clone());
                let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (4i32, v14.clone(), v13.clone())
            }
            US0::US0_Ok(v4) => {
                let v4: Rc<UH0> = v4.clone();
                let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                let v6: Rc<str> = delimited_8(v5.clone(), v4.clone());
                let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
                let v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v6));
                let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
                let v10: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v9));
                let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (0i32, v10.clone(), v11.clone())
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method11(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let v4: Rc<UH0> = method11(v3, v1.clone());
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
            return v2.clone();
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
            let v8: Rc<UH0> = Rc::new(UH0::UH0_Cons(v7.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v8.clone());
            continue;
        }
    }
}
fn method14(mut v0: Rc<UH0>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let v4: Rc<UH2> = method14(v3, v1.clone());
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
            return v2.clone();
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
            let v16: Rc<UH3> = Rc::new(UH3::UH3_Cons(v9.clone(), v12.clone(), v15.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v16.clone());
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
            return v5.clone();
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
                return v16.clone();
            } else {
                let v17: i32 = v0.wrapping_add(1i32);
                (v0, v1) = (v17, v1.clone());
                continue;
            }
        }
    }
}
fn from_12(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
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
            let v28: Rc<UH0> = from_13(v23.clone(), v26, v27.clone());
            let v29: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let v30: Rc<UH2> = method14(v28.clone(), v29.clone());
            let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("entities"); } LIT.with(|lit| lit.clone()) };
            let v32: serde_json::Value = v6.get(&*v31).cloned().unwrap_or_default();
            let v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("urls"); } LIT.with(|lit| lit.clone()) };
            let mut v34: serde_json::Value = v32.get(&*v33).cloned().unwrap_or_default();
            let v35: usize = v34.as_array().map_or(0, Vec::len);
            let v36: i32 = ((v35) as i32);
            let v37: i32 = v36.wrapping_sub(1i32);
            let v38: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
            let v39: Rc<UH3> = from_15(v34.clone(), v37, v38.clone());
            let v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
            let v41: serde_json::Value = v6.get(&*v40).cloned().unwrap_or_default();
            let v42: i32 = 0i32;
            let v43: Rc<str> = first_reply_from_16(v42, v41.clone());
            let v44: bool = &*v43 == "";
            let v47: US7 = if v44 {
                US7::US7_None
            } else {
                US7::US7_Some(v43.clone())
            };
            let v48: Rc<UH1> = Rc::new(UH1::UH1_Cons(v9.clone(), v21.clone(), v30.clone(), v39.clone(), v47.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v48.clone());
            continue;
        }
    }
}
fn method18(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    loop {
        match &*v0 {
            UH2::UH2_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let v3: Rc<UH2> = v3.clone();
                let v4: Rc<UH2> = Rc::new(UH2::UH2_Cons(v2.clone(), v1.clone()));
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH2::UH2_Nil => {
                return v1.clone();
            }
        }
    }
}
fn method17(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7) => {
            let mut v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let v4: Rc<UH2> = v4.clone();
            let v5: Rc<UH3> = v5.clone();
            let v6: US7 = v6.clone();
            let mut v7: Rc<UH1> = v7.clone();
            let v8: Rc<UH1> = method17(v7.clone(), v1.clone());
            let v9: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let v10: Rc<UH2> = method18(v4.clone(), v9.clone());
            let v15: bool = match &*v10 {
                UH2::UH2_Cons(v11, v12) => {
                    let v11: Rc<str> = v11.clone();
                    let v12: Rc<UH2> = v12.clone();
                    let v13: bool = &*v11 == &*v2;
                    v13
                }
                UH2::UH2_Nil => {
                    true
                }
            };
            if v15 {
                Rc::new(UH1::UH1_Cons(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v8.clone()))
            } else {
                v8.clone()
            }
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method19(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7) => {
            let mut v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let v4: Rc<UH2> = v4.clone();
            let v5: Rc<UH3> = v5.clone();
            let v6: US7 = v6.clone();
            let mut v7: Rc<UH1> = v7.clone();
            let v8: Rc<UH0> = method19(v7, v1.clone());
            Rc::new(UH0::UH0_Cons(v2, v8))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method10(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let v4: Rc<UH0> = method10(v3.clone(), v1.clone());
            let v5: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v2).unwrap_or_default();
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let v8: usize = v7.as_array().map_or(0, Vec::len);
            let v9: i32 = ((v8) as i32);
            let v10: i32 = v9.wrapping_sub(1i32);
            let v11: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v12: Rc<UH1> = from_12(v7.clone(), v10, v11.clone());
            let v13: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v14: Rc<UH1> = method17(v12.clone(), v13.clone());
            let v15: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v16: Rc<UH0> = method19(v14.clone(), v15.clone());
            method11(v16.clone(), v4.clone())
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn closure4() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>) {
        let v3: US0 = thread_bodies_0(v0.clone(), v1.clone(), v2.clone());
        match &v3 {
            US0::US0_Error(v10) => {
                let v10: US1 = v10.clone();
                let v11: Rc<str> = describe_failure_7(v10.clone());
                let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (4i32, v12.clone(), v11.clone())
            }
            US0::US0_Ok(v4) => {
                let v4: Rc<UH0> = v4.clone();
                let v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let v6: Rc<UH0> = method10(v4.clone(), v5.clone());
                let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                let v8: Rc<str> = delimited_8(v7.clone(), v6.clone());
                let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (0i32, v8.clone(), v9.clone())
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
