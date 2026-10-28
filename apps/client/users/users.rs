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
        match &*v0 {
            UH0::UH0_Cons(v2, v3, v4) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<str> = v3.clone();
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
fn app_reply_3(mut v0: Rc<str>, mut v1: US0, mut v2: Rc<str>) -> US4 {
    let v3: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v2));
    let v9: Rc<str> = match &v1 {
        US0::US0_Anonymous => {
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v7.clone()
        }
        US0::US0_BearerToken(v4) => {
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) };
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
        US4::US4_Ok(v17.clone(), v15.clone())
    } else {
        let v19: US2 = US2::US2_Reported(v15.clone());
        US4::US4_Error(v19.clone())
    }
}
fn from_4(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
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
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("username"); } LIT.with(|lit| lit.clone()) };
            let v11: serde_json::Value = v6.get(&*v10).cloned().unwrap_or_default();
            let v12: Rc<str> = Rc::<str>::from(v11.as_str().unwrap_or(""));
            let v13: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9.clone(), v12.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v13.clone());
            continue;
        }
    }
}
fn method5(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH0> = method5(v4, v1.clone());
            Rc::new(UH0::UH0_Cons(v2, v3, v5))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn taken_6(mut v0: i32, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v1 {
        UH0::UH0_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: bool = v0 > 0i32;
            if v5 {
                let v6: i32 = v0.wrapping_sub(1i32);
                let mut v7: Rc<UH0> = taken_6(v6, v4.clone());
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
        let v6: i32 = 0i32;
        let mut v7: i32 = method2(v5.clone(), v6);
        let v8: i32 = v3.wrapping_sub(v7);
        let v9: bool = v8 < 1000i32;
        let v10: i32 = if v9 {
            v8
        } else {
            1000i32
        };
        let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users/"); } LIT.with(|lit| lit.clone()) };
        let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v2));
        let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/following?max_results="); } LIT.with(|lit| lit.clone()) };
        let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v13));
        let v16: Rc<str> = Rc::<str>::from(format!("{}{}", v14, Rc::<str>::from(format!("{:?}", v10))));
        let v17: bool = &*v4 == "";
        let v21: Rc<str> = if v17 {
            v16.clone()
        } else {
            let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&pagination_token="); } LIT.with(|lit| lit.clone()) };
            let v20: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v16, v18)), v4));
            v20.clone()
        };
        let v22: US4 = app_reply_3(v0.clone(), v1.clone(), v21.clone());
        match &v22 {
            US4::US4_Error(v48) => {
                let v48: US2 = v48.clone();
                return US1::US1_Error(v48.clone());
            }
            US4::US4_Ok(v23, v24) => {
                let v23: serde_json::Value = v23.clone();
                let v24: Rc<str> = v24.clone();
                let v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
                let mut v26: serde_json::Value = v23.get(&*v25).cloned().unwrap_or_default();
                let v27: usize = v26.as_array().map_or(0, Vec::len);
                let v28: i32 = ((v27) as i32);
                let v29: i32 = v28.wrapping_sub(1i32);
                let mut v30: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let v31: Rc<UH0> = from_4(v26.clone(), v29, v30.clone());
                let v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("meta"); } LIT.with(|lit| lit.clone()) };
                let v33: serde_json::Value = v23.get(&*v32).cloned().unwrap_or_default();
                let v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("next_token"); } LIT.with(|lit| lit.clone()) };
                let v35: serde_json::Value = v33.get(&*v34).cloned().unwrap_or_default();
                let v36: Rc<str> = Rc::<str>::from(v35.as_str().unwrap_or(""));
                let mut v37: Rc<UH0> = method5(v5.clone(), v31.clone());
                let v38: i32 = 0i32;
                let v39: i32 = method2(v37.clone(), v38);
                let v40: bool = v39 >= v3;
                let v42: Rc<str> = if v40 {
                    let v41: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    v41.clone()
                } else {
                    v36.clone()
                };
                let v43: bool = &*v42 == "";
                if v43 {
                    let v44: Rc<UH0> = taken_6(v3, v37.clone());
                    return US1::US1_Ok(v44.clone());
                } else {
                    (v0, v1, v2, v3, v4, v5) = (v0.clone(), v1.clone(), v2.clone(), v3, v42.clone(), v37.clone());
                    continue;
                }
            }
        }
    }
}
fn describe_failure_7(mut v0: US2) -> Rc<str> {
    match &v0 {
        US2::US2_CursorHalted(v5, v6) => {
            let mut v5: Rc<str> = v5.clone();
            let v6: US3 = v6.clone();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v7));
            let v29: Rc<str> = match &v6 {
                US3::US3_CursorBudget(v19, v20) => {
                    let v19: Rc<str> = v19.clone();
                    let v20: i32 = *v20;
                    let v21: Rc<str> = Rc::<str>::from(format!("{:?}", v20));
                    let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" pages"); } LIT.with(|lit| lit.clone()) };
                    let v23: Rc<str> = Rc::<str>::from(format!("{}{}", v21, v22));
                    let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("stopped after "); } LIT.with(|lit| lit.clone()) };
                    let v25: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v23));
                    let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" (page budget)"); } LIT.with(|lit| lit.clone()) };
                    let v27: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v26));
                    v27.clone()
                }
                US3::US3_CursorRepeated(v9, v10) => {
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
            let mut v30: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v29));
            v30.clone()
        }
        US2::US2_NoSuchAccount(v2) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
            let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v2));
            v4.clone()
        }
        US2::US2_Reported(v1) => {
            let v1: Rc<str> = v1.clone();
            v1.clone()
        }
    }
}
fn method8(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH1> = method8(v4.clone(), v1.clone());
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v2, v6)), v3));
            Rc::new(UH1::UH1_Cons(v8.clone(), v5.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method9(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH1>, mut v2: i32) -> i32 {
    loop {
        match &*v1 {
            UH1::UH1_Cons(v3, v4) => {
                let v3: Rc<str> = v3.clone();
                let mut v4: Rc<UH1> = v4.clone();
                v0.borrow_mut().push(v3);
                let mut v5: i32 = v2.wrapping_add(1i32);
                (v0, v1, v2) = (v0.clone(), v4.clone(), v5);
                continue;
            }
            UH1::UH1_Nil => {
                return v2;
            }
        }
    }
}
fn followed_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: i32) -> (i32, Rc<str>, Rc<str>) {
    let mut v4: i32 = (v0.clone().len() as i32);
    let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let v6: bool = v0.ends_with(&*v5);
    let v11: Rc<str> = if v6 {
        let mut v7: i32 = v4.wrapping_sub(1i32);
        let v8: usize = ((0i32) as usize);
        let v9: usize = ((v7) as usize);
        let v10: Rc<str> = Rc::<str>::from(&(v0)[v8..v9]);
        v10.clone()
    } else {
        v0.clone()
    };
    let v12: US0 = US0::US0_BearerToken(v1.clone());
    let v13: bool = v3 < 0i32;
    let v14: i32 = if v13 {
        201i32
    } else {
        v3
    };
    let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v17: US1 = pages_1(v11.clone(), v12.clone(), v2.clone(), v14, v15.clone(), v16.clone());
    if v13 {
        match &v17 {
            US1::US1_Error(v39) => {
                let v39: US2 = v39.clone();
                let v40: Rc<str> = describe_failure_7(v39.clone());
                (4i32, v15.clone(), v40.clone())
            }
            US1::US1_Ok(v18) => {
                let v18: Rc<UH0> = v18.clone();
                let v19: i32 = 0i32;
                let v20: i32 = method2(v18.clone(), v19);
                let v21: bool = v20 > 200i32;
                if v21 {
                    let v22: Rc<str> = Rc::<str>::from(format!("{:?}", 200i32));
                    let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--max-following all would read more than "); } LIT.with(|lit| lit.clone()) };
                    let v24: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v22));
                    let v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" timelines; pass a number to confirm"); } LIT.with(|lit| lit.clone()) };
                    let mut v26: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v25));
                    (4i32, v15.clone(), v26.clone())
                } else {
                    let v27: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let v28: Rc<UH1> = method8(v18.clone(), v27.clone());
                    let v29: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                    let mut v30: i32 = 0i32;
                    let v31: i32 = method9(v29.clone(), v28.clone(), v30);
                    let v32: Rc<Vec<Rc<str>>> = Rc::new(v29.borrow().clone());
                    let v33: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v32).as_ref().clone()));
                    let v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                    let v35: Rc<str> = Rc::<str>::from((*v33.borrow()).join(&*v34));
                    (0i32, v35.clone(), v15.clone())
                }
            }
        }
    } else {
        match &v17 {
            US1::US1_Error(v57) => {
                let v57: US2 = v57.clone();
                let v58: Rc<str> = describe_failure_7(v57.clone());
                (4i32, v15.clone(), v58.clone())
            }
            US1::US1_Ok(v47) => {
                let v47: Rc<UH0> = v47.clone();
                let v48: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                let v49: Rc<UH1> = method8(v47.clone(), v48.clone());
                let v50: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                let v51: i32 = 0i32;
                let v52: i32 = method9(v50.clone(), v49.clone(), v51);
                let v53: Rc<Vec<Rc<str>>> = Rc::new(v50.borrow().clone());
                let v54: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v53).as_ref().clone()));
                let v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                let v56: Rc<str> = Rc::<str>::from((*v54.borrow()).join(&*v55));
                (0i32, v56.clone(), v15.clone())
            }
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, i32) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, i32) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: i32| -> (i32, Rc<str>, Rc<str>) {
        followed_0(v0.clone(), v1.clone(), v2.clone(), v3)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method12(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure2() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn split_list_11(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH1> {
    let v2: Option<usize> = v1.find(&*v0);
    let v3: Option<usize> = method12(v2.clone());
    let mut v4: Rc<dyn Fn((usize)) -> i32> = closure2();
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
        let v12: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH1::UH1_Cons(v1.clone(), v12.clone()))
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
        let v24: Rc<str> = Rc::<str>::from(&(v1)[v21..v23]);
        let v25: Rc<UH1> = split_list_11(v0.clone(), v24.clone());
        Rc::new(UH1::UH1_Cons(v16.clone(), v25.clone()))
    }
}
fn from_13(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("value"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<UH1> = Rc::new(UH1::UH1_Cons(v9.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v10.clone());
            continue;
        }
    }
}
fn named_10(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> (i32, Rc<str>, Rc<str>, Rc<str>) {
    let v3: i32 = (v0.clone().len() as i32);
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let mut v5: bool = v0.ends_with(&*v4);
    let v10: Rc<str> = if v5 {
        let v6: i32 = v3.wrapping_sub(1i32);
        let mut v7: usize = ((0i32) as usize);
        let v8: usize = ((v6) as usize);
        let v9: Rc<str> = Rc::<str>::from(&(v0)[v7..v8]);
        v9.clone()
    } else {
        v0.clone()
    };
    let v11: bool = &*v2 == "";
    let v15: Rc<UH1> = if v11 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_list_11(v13.clone(), v2.clone())
    };
    let v16: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v17: i32 = 0i32;
    let v18: i32 = method9(v16.clone(), v15.clone(), v17);
    let v19: Rc<Vec<Rc<str>>> = Rc::new(v16.borrow().clone());
    let v20: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v19).as_ref().clone()));
    let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let v22: Rc<str> = Rc::<str>::from((*v20.borrow()).join(&*v21));
    let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users/by?usernames="); } LIT.with(|lit| lit.clone()) };
    let v24: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v22));
    let v25: US0 = US0::US0_BearerToken(v1.clone());
    let mut v26: US4 = app_reply_3(v10.clone(), v25.clone(), v24.clone());
    match &v26 {
        US4::US4_Error(v59) => {
            let v59: US2 = v59.clone();
            let v60: Rc<str> = describe_failure_7(v59.clone());
            let v61: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (4i32, v61.clone(), v61.clone(), v60.clone())
        }
        US4::US4_Ok(v27, v28) => {
            let v27: serde_json::Value = v27.clone();
            let v28: Rc<str> = v28.clone();
            let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v30: serde_json::Value = v27.get(&*v29).cloned().unwrap_or_default();
            let v31: usize = v30.as_array().map_or(0, Vec::len);
            let v32: i32 = ((v31) as i32);
            let v33: i32 = v32.wrapping_sub(1i32);
            let v34: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v35: Rc<UH0> = from_4(v30.clone(), v33, v34.clone());
            let v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
            let mut v37: serde_json::Value = v27.get(&*v36).cloned().unwrap_or_default();
            let v38: usize = v37.as_array().map_or(0, Vec::len);
            let v39: i32 = ((v38) as i32);
            let v40: i32 = v39.wrapping_sub(1i32);
            let v41: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v42: Rc<UH1> = from_13(v37.clone(), v40, v41.clone());
            let v43: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v44: Rc<UH1> = method8(v35.clone(), v43.clone());
            let v45: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            let v46: i32 = 0i32;
            let v47: i32 = method9(v45.clone(), v44.clone(), v46);
            let v48: Rc<Vec<Rc<str>>> = Rc::new(v45.borrow().clone());
            let v49: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v48).as_ref().clone()));
            let v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            let v51: Rc<str> = Rc::<str>::from((*v49.borrow()).join(&*v50));
            let v52: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            let v53: i32 = 0i32;
            let v54: i32 = method9(v52.clone(), v42.clone(), v53);
            let v55: Rc<Vec<Rc<str>>> = Rc::new(v52.borrow().clone());
            let v56: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v55).as_ref().clone()));
            let v57: Rc<str> = Rc::<str>::from((*v56.borrow()).join(&*v21));
            let v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (0i32, v51.clone(), v57.clone(), v58.clone())
        }
    }
}
fn closure1() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>, Rc<str>) {
        named_10(v0.clone(), v1.clone(), v2.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method15(mut v0: Rc<UH1>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH2> = method15(v3, v1.clone());
            Rc::new(UH2::UH2_Cons(v2, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn taken_17(mut v0: i32, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v1 {
        UH2::UH2_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH2> = v3.clone();
            let mut v4: bool = v0 > 0i32;
            if v4 {
                let mut v5: i32 = v0.wrapping_sub(1i32);
                let v6: Rc<UH2> = taken_17(v5, v3.clone());
                Rc::new(UH2::UH2_Cons(v2.clone(), v6.clone()))
            } else {
                { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
            }
        }
        _ => {
            { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
        }
    }
}
fn skip__18(mut v0: i32, mut v1: Rc<UH2>) -> Rc<UH2> {
    loop {
        match &*v1 {
            UH2::UH2_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH2> = v3.clone();
                let mut v4: bool = v0 > 0i32;
                if v4 {
                    let mut v5: i32 = v0.wrapping_sub(1i32);
                    (v0, v1) = (v5, v3.clone());
                    continue;
                } else {
                    return v1.clone();
                }
            }
            _ => {
                return v1.clone();
            }
        }
    }
}
fn chunks__16(mut v0: i32, mut v1: Rc<UH2>) -> Rc<UH3> {
    match &*v1 {
        UH2::UH2_Nil => {
            { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) }
        }
        _ => {
            let v3: bool = v0 <= 0i32;
            if v3 {
                let mut v4: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
                Rc::new(UH3::UH3_Cons(v1.clone(), v4.clone()))
            } else {
                let v6: Rc<UH2> = taken_17(v0, v1.clone());
                let mut v7: Rc<UH2> = skip__18(v0, v1.clone());
                let v8: Rc<UH3> = chunks__16(v0, v7.clone());
                Rc::new(UH3::UH3_Cons(v6.clone(), v8.clone()))
            }
        }
    }
}
fn method20(mut v0: Rc<UH2>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH2> = v3.clone();
            let mut v4: Rc<UH1> = method20(v3, v1.clone());
            Rc::new(UH1::UH1_Cons(v2, v4))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn method19(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<UH3>, mut v3: Rc<UH4>) -> Rc<UH4> {
    match &*v2 {
        UH3::UH3_Cons(v4, v5) => {
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH3> = v5.clone();
            let v6: Rc<UH4> = method19(v0.clone(), v1.clone(), v5.clone(), v3.clone());
            let mut v7: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v8: Rc<UH1> = method20(v4.clone(), v7.clone());
            let v9: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            let v10: i32 = 0i32;
            let v11: i32 = method9(v9.clone(), v8.clone(), v10);
            let v12: Rc<Vec<Rc<str>>> = Rc::new(v9.borrow().clone());
            let v13: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v12).as_ref().clone()));
            let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let v15: Rc<str> = Rc::<str>::from((*v13.borrow()).join(&*v14));
            let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users?ids="); } LIT.with(|lit| lit.clone()) };
            let v17: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v15));
            let v18: US0 = US0::US0_BearerToken(v1.clone());
            let v19: US4 = app_reply_3(v0.clone(), v18.clone(), v17.clone());
            Rc::new(UH4::UH4_Cons(v19.clone(), v6.clone()))
        }
        UH3::UH3_Nil => {
            v3.clone()
        }
    }
}
fn method22(mut v0: Rc<UH5>, mut v1: Rc<UH5>) -> Rc<UH5> {
    loop {
        match &*v0 {
            UH5::UH5_Cons(v2, v3, v4) => {
                let v2: serde_json::Value = v2.clone();
                let v3: Rc<str> = v3.clone();
                let mut v4: Rc<UH5> = v4.clone();
                let mut v5: Rc<UH5> = Rc::new(UH5::UH5_Cons(v2.clone(), v3.clone(), v1.clone()));
                (v0, v1) = (v4.clone(), v5.clone());
                continue;
            }
            UH5::UH5_Nil => {
                return v1.clone();
            }
        }
    }
}
fn collected_21(mut v0: Rc<UH4>, mut v1: Rc<UH5>) -> US5 {
    loop {
        match &*v0 {
            UH4::UH4_Cons(v5, v6) => {
                let mut v5: US4 = v5.clone();
                let v6: Rc<UH4> = v6.clone();
                match &v5 {
                    US4::US4_Error(v7) => {
                        let mut v7: US2 = v7.clone();
                        return US5::US5_Error(v7.clone());
                    }
                    US4::US4_Ok(v9, v10) => {
                        let v9: serde_json::Value = v9.clone();
                        let v10: Rc<str> = v10.clone();
                        let v11: Rc<UH5> = Rc::new(UH5::UH5_Cons(v9.clone(), v10.clone(), v1.clone()));
                        (v0, v1) = (v6.clone(), v11.clone());
                        continue;
                    }
                }
            }
            UH4::UH4_Nil => {
                let v2: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
                let v3: Rc<UH5> = method22(v1.clone(), v2.clone());
                return US5::US5_Ok(v3.clone());
            }
        }
    }
}
fn method23(mut v0: Rc<UH5>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH5::UH5_Cons(v2, v3, v4) => {
            let v2: serde_json::Value = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH5> = v4.clone();
            let mut v5: Rc<UH1> = method23(v4, v1.clone());
            Rc::new(UH1::UH1_Cons(v3, v5))
        }
        UH5::UH5_Nil => {
            v1
        }
    }
}
fn method25(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method25(v3, v1.clone());
            Rc::new(UH1::UH1_Cons(v2, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn from_26(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = Rc::<str>::from((v6).to_string());
            let v8: Rc<UH1> = Rc::new(UH1::UH1_Cons(v7.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v8.clone());
            continue;
        }
    }
}
fn method24(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method24(v3.clone(), v1.clone());
            let mut v5: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v2).unwrap_or_default();
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let v8: usize = v7.as_array().map_or(0, Vec::len);
            let v9: i32 = ((v8) as i32);
            let v10: i32 = v9.wrapping_sub(1i32);
            let v11: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v12: Rc<UH1> = from_26(v7.clone(), v10, v11.clone());
            method25(v12.clone(), v4.clone())
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method27(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method27(v3.clone(), v1.clone());
            let mut v5: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v2).unwrap_or_default();
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let v8: usize = v7.as_array().map_or(0, Vec::len);
            let v9: i32 = ((v8) as i32);
            let v10: i32 = v9.wrapping_sub(1i32);
            let v11: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v12: Rc<UH1> = from_26(v7.clone(), v10, v11.clone());
            method25(v12.clone(), v4.clone())
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn by_ids_14(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> (i32, Rc<str>, Rc<str>) {
    let v3: i32 = (v0.clone().len() as i32);
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let mut v5: bool = v0.ends_with(&*v4);
    let v10: Rc<str> = if v5 {
        let v6: i32 = v3.wrapping_sub(1i32);
        let mut v7: usize = ((0i32) as usize);
        let v8: usize = ((v6) as usize);
        let v9: Rc<str> = Rc::<str>::from(&(v0)[v7..v8]);
        v9.clone()
    } else {
        v0.clone()
    };
    let v11: i32 = 100i32;
    let v12: bool = &*v2 == "";
    let v16: Rc<UH1> = if v12 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_list_11(v14.clone(), v2.clone())
    };
    let v17: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let v18: Rc<UH2> = method15(v16.clone(), v17.clone());
    let v19: Rc<UH3> = chunks__16(v11, v18.clone());
    let v20: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let v21: Rc<UH4> = method19(v10.clone(), v1.clone(), v19.clone(), v20.clone());
    let v22: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
    let v23: US5 = collected_21(v21.clone(), v22.clone());
    match &v23 {
        US5::US5_Error(v71) => {
            let v71: US2 = v71.clone();
            let v72: Rc<str> = describe_failure_7(v71.clone());
            let v73: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (4i32, v73.clone(), v72.clone())
        }
        US5::US5_Ok(v24) => {
            let v24: Rc<UH5> = v24.clone();
            let v25: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v26: Rc<UH1> = method23(v24.clone(), v25.clone());
            let v27: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v28: Rc<UH1> = method24(v26.clone(), v27.clone());
            let v29: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            let mut v30: i32 = 0i32;
            let v31: i32 = method9(v29.clone(), v28.clone(), v30);
            let v32: Rc<Vec<Rc<str>>> = Rc::new(v29.borrow().clone());
            let v33: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v32).as_ref().clone()));
            let v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let v35: Rc<str> = Rc::<str>::from((*v33.borrow()).join(&*v34));
            let v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
            let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v35));
            let v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
            let v39: Rc<str> = Rc::<str>::from(format!("{}{}", v37, v38));
            let v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) };
            let v41: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let v43: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v40, v41)), v40));
            let v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let v46: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v43, v44)), v39));
            let v47: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v48: Rc<UH1> = method27(v26.clone(), v47.clone());
            let v49: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            let v50: i32 = 0i32;
            let v51: i32 = method9(v49.clone(), v48.clone(), v50);
            let v52: Rc<Vec<Rc<str>>> = Rc::new(v49.borrow().clone());
            let v53: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v52).as_ref().clone()));
            let v54: Rc<str> = Rc::<str>::from((*v53.borrow()).join(&*v34));
            let v56: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v36, v54)), v38));
            let v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
            let v61: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v40, v57)), v40)), v44)), v56));
            let mut v62: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            v62.borrow_mut().push(v46);
            v62.borrow_mut().push(v61);
            let v63: Rc<Vec<Rc<str>>> = Rc::new(v62.borrow().clone());
            let v64: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v63).as_ref().clone()));
            let v65: Rc<str> = Rc::<str>::from((*v64.borrow()).join(&*v34));
            let v66: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{"); } LIT.with(|lit| lit.clone()) };
            let v67: Rc<str> = Rc::<str>::from(format!("{}{}", v66, v65));
            let v68: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
            let v69: Rc<str> = Rc::<str>::from(format!("{}{}", v67, v68));
            let v70: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (0i32, v69.clone(), v70.clone())
        }
    }
}
fn closure3() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>) {
        by_ids_14(v0.clone(), v1.clone(), v2.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_users_followed(v0: &str, v1: &str, v2: &str, v3: i32) -> (i32, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), v3)
}
pub fn xc_users_named(v0: &str, v1: &str, v2: &str) -> (i32, Rc<str>, Rc<str>, Rc<str>) {
    closure1()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2))
}
pub fn xc_users_by_ids(v0: &str, v1: &str, v2: &str) -> (i32, Rc<str>, Rc<str>) {
    closure3()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2))
}
