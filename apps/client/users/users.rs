#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum US0 {
    US0_BearerToken(Rc<str>),
    US0_Anonymous,
}
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<str>, Rc<UH0>),
}
#[derive(Clone)]
enum US3 {
    US3_CursorRepeated(Rc<str>, i32),
    US3_CursorBudget(Rc<str>, i32),
}
#[derive(Clone)]
enum US2 {
    US2_Reported(Rc<str>),
    US2_NoSuchAccount(Rc<str>),
    US2_CursorHalted(Rc<str>, US3),
}
#[derive(Clone)]
enum US1 {
    US1_Ok(Rc<UH0>),
    US1_Error(US2),
}
#[derive(Clone)]
enum US4 {
    US4_Ok(serde_json::Value, Rc<str>),
    US4_Error(US2),
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<UH1>),
}
pub struct Mut0 { pub l0: i32, pub l1: Rc<UH1> }
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(Rc<str>, Rc<UH2>),
}
#[derive(Clone)]
enum UH3 {
    UH3_Nil,
    UH3_Cons(Rc<UH2>, Rc<UH3>),
}
#[derive(Clone)]
enum UH4 {
    UH4_Nil,
    UH4_Cons(US4, Rc<UH4>),
}
#[derive(Clone)]
enum UH5 {
    UH5_Nil,
    UH5_Cons(serde_json::Value, Rc<str>, Rc<UH5>),
}
#[derive(Clone)]
enum US5 {
    US5_Ok(Rc<UH5>),
    US5_Error(US2),
}
fn method2(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3, v4) => {
                let v2: Rc<str> = v2;
                let v3: Rc<str> = v3;
                let v4: Rc<UH0> = v4;
                let v5: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v4, v5);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn app_reply_3(mut v0: Rc<str>, mut v1: US0, mut v2: Rc<str>) -> US4 {
    let v3: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v2.clone()));
    let v8: Rc<str> = match v1 {
        US0::US0_Anonymous => {
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v6
        }
        US0::US0_BearerToken(v4) => {
            let v4: Rc<str> = v4;
            let v5: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) }, v4));
            v5
        }
    };
    let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("GET"); } LIT.with(|lit| lit.clone()) };
    let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v11, mut v12): (i32, Rc<str>) = xc_net::xc_send(&*v9, &*v3, &*v8, &*v10);
    let (mut v13, mut v14): (i32, Rc<str>) = xc_api::xc_classified(&*v2, v11, &*v12);
    let v15: bool = v13 == 0i32;
    if v15 {
        let v16: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v14).unwrap_or_default();
        US4::US4_Ok(v16, v14)
    } else {
        let v18: US2 = US2::US2_Reported(v14);
        US4::US4_Error(v18)
    }
}
fn from_4(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
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
            let mut v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("username"); } LIT.with(|lit| lit.clone()) };
            let v11: serde_json::Value = v6.get(&*v10).cloned().unwrap_or_default();
            let v12: Rc<str> = Rc::<str>::from(v11.as_str().unwrap_or(""));
            let v13: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9, v12, v2));
            (v1, v2) = (v4, v13);
            continue;
        }
    }
}
fn method5(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2;
            let v3: Rc<str> = v3;
            let v4: Rc<UH0> = v4;
            let v5: Rc<UH0> = method5(v4, v1);
            Rc::new(UH0::UH0_Cons(v2, v3, v5))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn taken_6(mut v0: i32, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v1) {
        UH0::UH0_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2;
            let v3: Rc<str> = v3;
            let v4: Rc<UH0> = v4;
            let v5: bool = v0 > 0i32;
            if v5 {
                let v6: i32 = v0.wrapping_sub(1i32);
                let mut v7: Rc<UH0> = taken_6(v6, v4);
                Rc::new(UH0::UH0_Cons(v2, v3, v7))
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
        let v6: i32 = 0i32;
        let mut v7: i32 = method2(v5.clone(), v6);
        let v8: i32 = v3.wrapping_sub(v7);
        let mut v9: bool = v8 < 1000i32;
        let v10: i32 = if v9 {
            v8
        } else {
            1000i32
        };
        let v11: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users/"); } LIT.with(|lit| lit.clone()) }, v2.clone()));
        let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/following?max_results="); } LIT.with(|lit| lit.clone()) }));
        let v13: Rc<str> = Rc::<str>::from((v10).to_string());
        let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v13));
        let v15: bool = &*v4 == "";
        let v18: Rc<str> = if v15 {
            v14
        } else {
            let v16: Rc<str> = Rc::<str>::from(format!("{}{}", v14, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&pagination_token="); } LIT.with(|lit| lit.clone()) }));
            let v17: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v4));
            v17
        };
        let v19: US4 = app_reply_3(v0.clone(), v1.clone(), v18);
        match v19 {
            US4::US4_Error(v45) => {
                let v45: US2 = v45;
                return US1::US1_Error(v45);
            }
            US4::US4_Ok(v20, v21) => {
                let v20: serde_json::Value = v20;
                let v21: Rc<str> = v21;
                let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
                let mut v23: serde_json::Value = v20.get(&*v22).cloned().unwrap_or_default();
                let v24: usize = v23.as_array().map_or(0, Vec::len);
                let v25: i32 = ((v24) as i32);
                let v26: i32 = v25.wrapping_sub(1i32);
                let v27: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let v28: Rc<UH0> = from_4(v23, v26, v27);
                let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("meta"); } LIT.with(|lit| lit.clone()) };
                let v30: serde_json::Value = v20.get(&*v29).cloned().unwrap_or_default();
                let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("next_token"); } LIT.with(|lit| lit.clone()) };
                let v32: serde_json::Value = v30.get(&*v31).cloned().unwrap_or_default();
                let v33: Rc<str> = Rc::<str>::from(v32.as_str().unwrap_or(""));
                let v34: Rc<UH0> = method5(v5, v28);
                let v35: i32 = 0i32;
                let mut v36: i32 = method2(v34.clone(), v35);
                let v37: bool = v36 >= v3;
                let v39: Rc<str> = if v37 {
                    let v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    v38
                } else {
                    v33
                };
                let v40: bool = &*v39 == "";
                if v40 {
                    let v41: Rc<UH0> = taken_6(v3, v34);
                    return US1::US1_Ok(v41);
                } else {
                    (v4, v5) = (v39, v34);
                    continue;
                }
            }
        }
    }
}
fn describe_failure_7(mut v0: US2) -> Rc<str> {
    match v0 {
        US2::US2_CursorHalted(v4, v5) => {
            let v4: Rc<str> = v4;
            let v5: US3 = v5;
            let v6: Rc<str> = Rc::<str>::from(format!("{}{}", v4, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) }));
            let v21: Rc<str> = match v5 {
                US3::US3_CursorBudget(v14, v15) => {
                    let v14: Rc<str> = v14;
                    let v15: i32 = v15;
                    let v16: Rc<str> = Rc::<str>::from((v15).to_string());
                    let v17: Rc<str> = Rc::<str>::from(format!("{}{}", v16, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" pages"); } LIT.with(|lit| lit.clone()) }));
                    let v18: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("stopped after "); } LIT.with(|lit| lit.clone()) }, v17));
                    let v19: Rc<str> = Rc::<str>::from(format!("{}{}", v18, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" (page budget)"); } LIT.with(|lit| lit.clone()) }));
                    v19
                }
                US3::US3_CursorRepeated(v7, v8) => {
                    let mut v7: Rc<str> = v7;
                    let v8: i32 = v8;
                    let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("the API repeated cursor "); } LIT.with(|lit| lit.clone()) }, v7));
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
        US2::US2_NoSuchAccount(v2) => {
            let v2: Rc<str> = v2;
            let v3: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) }, v2));
            v3
        }
        US2::US2_Reported(v1) => {
            let v1: Rc<str> = v1;
            v1
        }
    }
}
fn method8(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2;
            let v3: Rc<str> = v3;
            let v4: Rc<UH0> = v4;
            let v5: Rc<UH1> = method8(v4, v1);
            let v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) }));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v3));
            Rc::new(UH1::UH1_Cons(v7, v5))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method9(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH1>, mut v2: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH1::UH1_Cons(v3, v4) => {
                let v3: Rc<str> = v3;
                let v4: Rc<UH1> = v4;
                v0.borrow_mut().push(v3);
                let v5: i32 = v2.wrapping_add(1i32);
                (v1, v2) = (v4, v5);
                continue;
            }
            UH1::UH1_Nil => {
                return v2;
            }
        }
    }
}
fn followed_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: i32) -> (i32, Rc<str>, Rc<str>) {
    let v4: i32 = (v0.clone().len() as i32);
    let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let v6: bool = v0.ends_with(&*v5);
    let v11: Rc<str> = if v6 {
        let mut v7: i32 = v4.wrapping_sub(1i32);
        let v8: usize = ((0i32) as usize);
        let mut v9: usize = ((v7) as usize);
        let v10: Rc<str> = Rc::<str>::from(&(v0)[v8..v9]);
        v10
    } else {
        v0
    };
    let v12: US0 = US0::US0_BearerToken(v1);
    let v13: bool = v3 < 0i32;
    let v14: i32 = if v13 {
        201i32
    } else {
        v3
    };
    let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v17: US1 = pages_1(v11, v12, v2, v14, v15.clone(), v16);
    if v13 {
        match v17 {
            US1::US1_Error(v37) => {
                let v37: US2 = v37;
                let v38: Rc<str> = describe_failure_7(v37);
                (4i32, v15, v38)
            }
            US1::US1_Ok(v18) => {
                let v18: Rc<UH0> = v18;
                let v19: i32 = 0i32;
                let v20: i32 = method2(v18.clone(), v19);
                let v21: bool = v20 > 200i32;
                if v21 {
                    let v22: Rc<str> = Rc::<str>::from((200i32).to_string());
                    let mut v23: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--max-following all would read more than "); } LIT.with(|lit| lit.clone()) }, v22));
                    let v24: Rc<str> = Rc::<str>::from(format!("{}{}", v23, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" timelines; pass a number to confirm"); } LIT.with(|lit| lit.clone()) }));
                    (4i32, v15, v24)
                } else {
                    let v25: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let v26: Rc<UH1> = method8(v18, v25);
                    let v27: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                    let v28: i32 = 0i32;
                    let mut v29: i32 = method9(v27.clone(), v26, v28);
                    let v30: Rc<Vec<Rc<str>>> = Rc::new(v27.borrow().clone());
                    let v31: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v30).as_ref().clone()));
                    let v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                    let v33: Rc<str> = Rc::<str>::from((*v31.borrow()).join(&*v32));
                    (0i32, v33, v15)
                }
            }
        }
    } else {
        match v17 {
            US1::US1_Error(v55) => {
                let v55: US2 = v55;
                let v56: Rc<str> = describe_failure_7(v55);
                (4i32, v15, v56)
            }
            US1::US1_Ok(v45) => {
                let v45: Rc<UH0> = v45;
                let v46: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                let v47: Rc<UH1> = method8(v45, v46);
                let v48: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                let v49: i32 = 0i32;
                let mut v50: i32 = method9(v48.clone(), v47, v49);
                let v51: Rc<Vec<Rc<str>>> = Rc::new(v48.borrow().clone());
                let v52: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v51).as_ref().clone()));
                let v53: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                let v54: Rc<str> = Rc::<str>::from((*v52.borrow()).join(&*v53));
                (0i32, v54, v15)
            }
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, i32) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, i32) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: i32| -> (i32, Rc<str>, Rc<str>) {
        followed_0(v0, v1, v2, v3)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method12(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let v3: Rc<UH1> = v3;
                let v4: Rc<UH1> = Rc::new(UH1::UH1_Cons(v2, v1));
                (v0, v1) = (v3, v4);
                continue;
            }
            UH1::UH1_Nil => {
                return v1;
            }
        }
    }
}
fn method13(mut v0: i32, mut v1: &Rc<RefCell<Mut0>>) -> bool {
    let v2: i32 = v1.borrow().l0;
    let v3: bool = v2 < v0;
    v3
}
fn split_list_11(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH1> {
    let v2: i32 = (v0.clone().len() as i32);
    let v3: bool = v2 == 0i32;
    if v3 {
        let v4: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH1::UH1_Cons(v1, v4))
    } else {
        let v6: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(v1.split(&*v0).map(|x| Rc::<str>::from(x)).collect::<Vec<Rc<str>>>()));
        let mut v7: i32 = (v6.clone().borrow().len() as i32);
        let v8: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let mut v9: Rc<RefCell<Mut0>> = Rc::new(RefCell::new(Mut0 { l0: 0i32, l1: v8 }));
        while method13(v7, &v9) {
            let v11: i32 = v9.borrow().l0;
            let v12: Rc<UH1> = v9.borrow().l1.clone();
            let v13: Rc<str> = v6.borrow()[v11 as usize].clone();
            let v14: i32 = v11.wrapping_add(1i32);
            let v15: Rc<UH1> = Rc::new(UH1::UH1_Cons(v13, v12));
            v9.borrow_mut().l0 = v14;
            v9.borrow_mut().l1 = v15;
            ()
        };
        let v16: Rc<UH1> = v9.borrow().l1.clone();
        let v17: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        method12(v16, v17)
    }
}
fn from_14(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2;
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("value"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let mut v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<UH1> = Rc::new(UH1::UH1_Cons(v9, v2));
            (v1, v2) = (v4, v10);
            continue;
        }
    }
}
fn named_10(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> (i32, Rc<str>, Rc<str>, Rc<str>) {
    let v3: i32 = (v0.clone().len() as i32);
    let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let v5: bool = v0.ends_with(&*v4);
    let v10: Rc<str> = if v5 {
        let v6: i32 = v3.wrapping_sub(1i32);
        let mut v7: usize = ((0i32) as usize);
        let v8: usize = ((v6) as usize);
        let mut v9: Rc<str> = Rc::<str>::from(&(v0)[v7..v8]);
        v9
    } else {
        v0
    };
    let v11: bool = &*v2 == "";
    let v15: Rc<UH1> = if v11 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_list_11(v13, v2)
    };
    let v16: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v17: i32 = 0i32;
    let v18: i32 = method9(v16.clone(), v15, v17);
    let v19: Rc<Vec<Rc<str>>> = Rc::new(v16.borrow().clone());
    let v20: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v19).as_ref().clone()));
    let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let v22: Rc<str> = Rc::<str>::from((*v20.borrow()).join(&*v21));
    let mut v23: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users/by?usernames="); } LIT.with(|lit| lit.clone()) }, v22));
    let v24: US0 = US0::US0_BearerToken(v1);
    let v25: US4 = app_reply_3(v10, v24, v23);
    match v25 {
        US4::US4_Error(v58) => {
            let v58: US2 = v58;
            let v59: Rc<str> = describe_failure_7(v58);
            let v60: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (4i32, v60.clone(), v60, v59)
        }
        US4::US4_Ok(v26, v27) => {
            let v26: serde_json::Value = v26;
            let v27: Rc<str> = v27;
            let v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v29: serde_json::Value = v26.get(&*v28).cloned().unwrap_or_default();
            let v30: usize = v29.as_array().map_or(0, Vec::len);
            let v31: i32 = ((v30) as i32);
            let v32: i32 = v31.wrapping_sub(1i32);
            let v33: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v34: Rc<UH0> = from_4(v29, v32, v33);
            let v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
            let mut v36: serde_json::Value = v26.get(&*v35).cloned().unwrap_or_default();
            let v37: usize = v36.as_array().map_or(0, Vec::len);
            let v38: i32 = ((v37) as i32);
            let v39: i32 = v38.wrapping_sub(1i32);
            let v40: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v41: Rc<UH1> = from_14(v36, v39, v40);
            let v42: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v43: Rc<UH1> = method8(v34, v42);
            let v44: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            let v45: i32 = 0i32;
            let v46: i32 = method9(v44.clone(), v43, v45);
            let v47: Rc<Vec<Rc<str>>> = Rc::new(v44.borrow().clone());
            let v48: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v47).as_ref().clone()));
            let v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            let mut v50: Rc<str> = Rc::<str>::from((*v48.borrow()).join(&*v49));
            let v51: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            let v52: i32 = 0i32;
            let v53: i32 = method9(v51.clone(), v41, v52);
            let v54: Rc<Vec<Rc<str>>> = Rc::new(v51.borrow().clone());
            let v55: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v54).as_ref().clone()));
            let v56: Rc<str> = Rc::<str>::from((*v55.borrow()).join(&*v21));
            let v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (0i32, v50, v56, v57)
        }
    }
}
fn closure1() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>, Rc<str>) {
        named_10(v0, v1, v2)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method16(mut v0: Rc<UH1>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH1> = v3;
            let v4: Rc<UH2> = method16(v3, v1);
            Rc::new(UH2::UH2_Cons(v2, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn taken_18(mut v0: i32, mut v1: Rc<UH2>) -> Rc<UH2> {
    match Rc::unwrap_or_clone(v1) {
        UH2::UH2_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH2> = v3;
            let v4: bool = v0 > 0i32;
            if v4 {
                let v5: i32 = v0.wrapping_sub(1i32);
                let v6: Rc<UH2> = taken_18(v5, v3);
                Rc::new(UH2::UH2_Cons(v2, v6))
            } else {
                { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
            }
        }
        _ => {
            { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
        }
    }
}
fn skip__19(mut v0: i32, mut v1: Rc<UH2>) -> Rc<UH2> {
    loop {
        match &*v1 {
            UH2::UH2_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH2> = v3.clone();
                let v4: bool = v0 > 0i32;
                if v4 {
                    let v5: i32 = v0.wrapping_sub(1i32);
                    (v0, v1) = (v5, v3);
                    continue;
                } else {
                    return v1;
                }
            }
            _ => {
                return v1;
            }
        }
    }
}
fn chunks__17(mut v0: i32, mut v1: Rc<UH2>) -> Rc<UH3> {
    match &*v1 {
        UH2::UH2_Nil => {
            { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) }
        }
        _ => {
            let v3: bool = v0 <= 0i32;
            if v3 {
                let v4: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
                Rc::new(UH3::UH3_Cons(v1, v4))
            } else {
                let v6: Rc<UH2> = taken_18(v0, v1.clone());
                let mut v7: Rc<UH2> = skip__19(v0, v1);
                let v8: Rc<UH3> = chunks__17(v0, v7);
                Rc::new(UH3::UH3_Cons(v6, v8))
            }
        }
    }
}
fn method21(mut v0: Rc<UH2>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH2::UH2_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH2> = v3;
            let v4: Rc<UH1> = method21(v3, v1);
            Rc::new(UH1::UH1_Cons(v2, v4))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn method20(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<UH3>, mut v3: Rc<UH4>) -> Rc<UH4> {
    match Rc::unwrap_or_clone(v2) {
        UH3::UH3_Cons(v4, v5) => {
            let v4: Rc<UH2> = v4;
            let v5: Rc<UH3> = v5;
            let v6: Rc<UH4> = method20(v0.clone(), v1.clone(), v5, v3);
            let mut v7: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v8: Rc<UH1> = method21(v4, v7);
            let mut v9: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            let v10: i32 = 0i32;
            let v11: i32 = method9(v9.clone(), v8, v10);
            let v12: Rc<Vec<Rc<str>>> = Rc::new(v9.borrow().clone());
            let v13: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v12).as_ref().clone()));
            let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let v15: Rc<str> = Rc::<str>::from((*v13.borrow()).join(&*v14));
            let v16: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users?ids="); } LIT.with(|lit| lit.clone()) }, v15));
            let v17: US0 = US0::US0_BearerToken(v1);
            let v18: US4 = app_reply_3(v0, v17, v16);
            Rc::new(UH4::UH4_Cons(v18, v6))
        }
        UH3::UH3_Nil => {
            v3
        }
    }
}
fn method23(mut v0: Rc<UH5>, mut v1: Rc<UH5>) -> Rc<UH5> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH5::UH5_Cons(v2, v3, v4) => {
                let v2: serde_json::Value = v2;
                let v3: Rc<str> = v3;
                let v4: Rc<UH5> = v4;
                let v5: Rc<UH5> = Rc::new(UH5::UH5_Cons(v2, v3, v1));
                (v0, v1) = (v4, v5);
                continue;
            }
            UH5::UH5_Nil => {
                return v1;
            }
        }
    }
}
fn collected_22(mut v0: Rc<UH4>, mut v1: Rc<UH5>) -> US5 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH4::UH4_Cons(v5, v6) => {
                let v5: US4 = v5;
                let v6: Rc<UH4> = v6;
                match v5 {
                    US4::US4_Error(v7) => {
                        let mut v7: US2 = v7;
                        return US5::US5_Error(v7);
                    }
                    US4::US4_Ok(v9, v10) => {
                        let mut v9: serde_json::Value = v9;
                        let v10: Rc<str> = v10;
                        let v11: Rc<UH5> = Rc::new(UH5::UH5_Cons(v9, v10, v1));
                        (v0, v1) = (v6, v11);
                        continue;
                    }
                }
            }
            UH4::UH4_Nil => {
                let v2: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
                let v3: Rc<UH5> = method23(v1, v2);
                return US5::US5_Ok(v3);
            }
        }
    }
}
fn method24(mut v0: Rc<UH5>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH5::UH5_Cons(v2, v3, v4) => {
            let v2: serde_json::Value = v2;
            let v3: Rc<str> = v3;
            let v4: Rc<UH5> = v4;
            let v5: Rc<UH1> = method24(v4, v1);
            Rc::new(UH1::UH1_Cons(v3, v5))
        }
        UH5::UH5_Nil => {
            v1
        }
    }
}
fn method26(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH1> = v3;
            let v4: Rc<UH1> = method26(v3, v1);
            Rc::new(UH1::UH1_Cons(v2, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn from_27(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2;
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = Rc::<str>::from((v6).to_string());
            let v8: Rc<UH1> = Rc::new(UH1::UH1_Cons(v7, v2));
            (v1, v2) = (v4, v8);
            continue;
        }
    }
}
fn method25(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH1> = v3;
            let v4: Rc<UH1> = method25(v3, v1);
            let v5: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v2).unwrap_or_default();
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let v8: usize = v7.as_array().map_or(0, Vec::len);
            let mut v9: i32 = ((v8) as i32);
            let v10: i32 = v9.wrapping_sub(1i32);
            let v11: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v12: Rc<UH1> = from_27(v7, v10, v11);
            method26(v12, v4)
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method28(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH1> = v3;
            let v4: Rc<UH1> = method28(v3, v1);
            let v5: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v2).unwrap_or_default();
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let v8: usize = v7.as_array().map_or(0, Vec::len);
            let mut v9: i32 = ((v8) as i32);
            let v10: i32 = v9.wrapping_sub(1i32);
            let v11: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v12: Rc<UH1> = from_27(v7, v10, v11);
            method26(v12, v4)
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn by_ids_15(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> (i32, Rc<str>, Rc<str>) {
    let v3: i32 = (v0.clone().len() as i32);
    let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let v5: bool = v0.ends_with(&*v4);
    let v10: Rc<str> = if v5 {
        let v6: i32 = v3.wrapping_sub(1i32);
        let mut v7: usize = ((0i32) as usize);
        let v8: usize = ((v6) as usize);
        let mut v9: Rc<str> = Rc::<str>::from(&(v0)[v7..v8]);
        v9
    } else {
        v0
    };
    let v11: i32 = 100i32;
    let v12: bool = &*v2 == "";
    let v16: Rc<UH1> = if v12 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_list_11(v14, v2)
    };
    let v17: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let v18: Rc<UH2> = method16(v16, v17);
    let v19: Rc<UH3> = chunks__17(v11, v18);
    let v20: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let v21: Rc<UH4> = method20(v10, v1, v19, v20);
    let v22: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
    let mut v23: US5 = collected_22(v21, v22);
    match v23 {
        US5::US5_Error(v57) => {
            let v57: US2 = v57;
            let v58: Rc<str> = describe_failure_7(v57);
            let v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (4i32, v59, v58)
        }
        US5::US5_Ok(v24) => {
            let v24: Rc<UH5> = v24;
            let v25: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v26: Rc<UH1> = method24(v24, v25);
            let v27: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v28: Rc<UH1> = method25(v26.clone(), v27);
            let mut v29: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            let v30: i32 = 0i32;
            let v31: i32 = method9(v29.clone(), v28, v30);
            let v32: Rc<Vec<Rc<str>>> = Rc::new(v29.borrow().clone());
            let v33: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v32).as_ref().clone()));
            let v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let v35: Rc<str> = Rc::<str>::from((*v33.borrow()).join(&*v34));
            let mut v36: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) }, v35));
            let v37: Rc<str> = Rc::<str>::from(format!("{}{}", v36, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) }));
            let v38: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"data\":"); } LIT.with(|lit| lit.clone()) }, v37));
            let v39: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v40: Rc<UH1> = method28(v26, v39);
            let v41: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            let v42: i32 = 0i32;
            let v43: i32 = method9(v41.clone(), v40, v42);
            let v44: Rc<Vec<Rc<str>>> = Rc::new(v41.borrow().clone());
            let v45: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v44).as_ref().clone()));
            let v46: Rc<str> = Rc::<str>::from((*v45.borrow()).join(&*v34));
            let v47: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) }, v46));
            let v48: Rc<str> = Rc::<str>::from(format!("{}{}", v47, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) }));
            let v49: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"errors\":"); } LIT.with(|lit| lit.clone()) }, v48));
            let mut v50: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            v50.borrow_mut().push(v38);
            v50.borrow_mut().push(v49);
            let v51: Rc<Vec<Rc<str>>> = Rc::new(v50.borrow().clone());
            let v52: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v51).as_ref().clone()));
            let v53: Rc<str> = Rc::<str>::from((*v52.borrow()).join(&*v34));
            let v54: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{"); } LIT.with(|lit| lit.clone()) }, v53));
            let v55: Rc<str> = Rc::<str>::from(format!("{}{}", v54, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) }));
            let v56: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (0i32, v55, v56)
        }
    }
}
fn closure2() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>) {
        by_ids_15(v0, v1, v2)
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
pub type SpiralShape_accbf6de6842 = Mut0;
