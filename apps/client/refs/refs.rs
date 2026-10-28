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
    UH0_Cons(Rc<str>, Rc<UH0>),
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<UH1>),
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(Rc<UH1>, Rc<UH2>),
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
    US1_Ok(serde_json::Value, Rc<str>),
    US1_Error(US2),
}
#[derive(Clone)]
enum UH3 {
    UH3_Nil,
    UH3_Cons(US1, Rc<UH3>),
}
#[derive(Clone)]
enum UH4 {
    UH4_Nil,
    UH4_Cons(serde_json::Value, Rc<str>, Rc<UH4>),
}
#[derive(Clone)]
enum US4 {
    US4_Ok(Rc<UH4>),
    US4_Error(US2),
}
#[derive(Clone)]
enum UH5 {
    UH5_Nil,
    UH5_Cons(Rc<UH0>, Rc<UH5>),
}
#[derive(Clone)]
enum UH6 {
    UH6_Nil,
    UH6_Cons(Rc<str>, Rc<str>, Rc<UH6>),
}
fn method2(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure1() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let mut v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn split_list_1(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let v2: Option<usize> = v1.find(&*v0);
    let v3: Option<usize> = method2(v2.clone());
    let mut v4: Rc<dyn Fn((usize)) -> i32> = closure1();
    let mut v5: Option<i32> = v3.map(|x| v4(x));
    let mut v7: i32 = v5.unwrap_or(-1i32);
    let mut v8: i32 = (v0.clone().len() as i32);
    let mut v9: bool = v7 < 0i32;
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
        let mut v21: usize = ((v17) as usize);
        let v22: i32 = v17.wrapping_add(v20);
        let v23: usize = ((v22) as usize);
        let v24: Rc<str> = Rc::<str>::from(&(v1)[v21..v23]);
        let v25: Rc<UH0> = split_list_1(v0.clone(), v24.clone());
        Rc::new(UH0::UH0_Cons(v16.clone(), v25.clone()))
    }
}
fn method3(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH1> = method3(v3, v1.clone());
            Rc::new(UH1::UH1_Cons(v2, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn closure2(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> bool> {
    Rc::new(move |mut v1: Rc<str>| -> bool {
        let v2: bool = &*v0 == &*v1;
        v2
    })
}
fn method6(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> bool> {
    closure2(v0)
}
fn method7(mut v0: Rc<str>, mut v1: Rc<dyn Fn(Rc<str>) -> bool>, mut v2: Rc<UH1>) -> bool {
    loop {
        match &*v2 {
            UH1::UH1_Cons(v3, v4) => {
                let v3: Rc<str> = v3.clone();
                let mut v4: Rc<UH1> = v4.clone();
                let mut v5: bool = v1(v3.clone());
                if v5 {
                    return true;
                } else {
                    let v6: Rc<dyn Fn(Rc<str>) -> bool> = method6(v0.clone());
                    (v0, v1, v2) = (v0.clone(), v6.clone(), v4.clone());
                    continue;
                }
            }
            UH1::UH1_Nil => {
                return false;
            }
        }
    }
}
fn method8(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method8(v3, v1.clone());
            Rc::new(UH1::UH1_Cons(v2, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method5(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH1> = v3.clone();
                let mut v4: Rc<dyn Fn(Rc<str>) -> bool> = method6(v2.clone());
                let mut v5: bool = method7(v2.clone(), v4.clone(), v1.clone());
                let mut v9: Rc<UH1> = if v5 {
                    v1.clone()
                } else {
                    let v6: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let mut v7: Rc<UH1> = Rc::new(UH1::UH1_Cons(v2.clone(), v6.clone()));
                    method8(v1.clone(), v7.clone())
                };
                (v0, v1) = (v3.clone(), v9.clone());
                continue;
            }
            UH1::UH1_Nil => {
                return v1.clone();
            }
        }
    }
}
fn taken_10(mut v0: i32, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v1 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let mut v4: bool = v0 > 0i32;
            if v4 {
                let mut v5: i32 = v0.wrapping_sub(1i32);
                let v6: Rc<UH1> = taken_10(v5, v3.clone());
                Rc::new(UH1::UH1_Cons(v2.clone(), v6.clone()))
            } else {
                { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
            }
        }
        _ => {
            { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
        }
    }
}
fn skip__11(mut v0: i32, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v1 {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH1> = v3.clone();
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
fn chunks__9(mut v0: i32, mut v1: Rc<UH1>) -> Rc<UH2> {
    match &*v1 {
        UH1::UH1_Nil => {
            { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
        }
        _ => {
            let v3: bool = v0 <= 0i32;
            if v3 {
                let mut v4: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                Rc::new(UH2::UH2_Cons(v1.clone(), v4.clone()))
            } else {
                let v6: Rc<UH1> = taken_10(v0, v1.clone());
                let mut v7: Rc<UH1> = skip__11(v0, v1.clone());
                let mut v8: Rc<UH2> = chunks__9(v0, v7.clone());
                Rc::new(UH2::UH2_Cons(v6.clone(), v8.clone()))
            }
        }
    }
}
fn method14(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH0> = method14(v3, v1.clone());
            Rc::new(UH0::UH0_Cons(v2, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method15(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
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
fn method16(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method16(v3, v1.clone());
            Rc::new(UH0::UH0_Cons(v2, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn lookup_path_13(mut v0: Rc<UH1>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: bool, mut v5: bool, mut v6: i32, mut v7: bool) -> Rc<str> {
    let mut v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v9: Rc<UH0> = method14(v0.clone(), v8.clone());
    let v10: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v11: i32 = 0i32;
    let v12: i32 = method15(v10.clone(), v9.clone(), v11);
    let v13: Rc<Vec<Rc<str>>> = Rc::new(v10.borrow().clone());
    let v14: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v13).as_ref().clone()));
    let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let v16: Rc<str> = Rc::<str>::from((*v14.borrow()).join(&*v15));
    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets?ids="); } LIT.with(|lit| lit.clone()) };
    let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v16));
    let mut v21: Rc<str> = if v7 {
        let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&media.fields=type,alt_text"); } LIT.with(|lit| lit.clone()) };
        v19.clone()
    } else {
        let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v20.clone()
    };
    let v22: bool = v6 > 0i32;
    let mut v29: Rc<UH0> = if v22 {
        let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
        let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts.author_id"); } LIT.with(|lit| lit.clone()) };
        let v25: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v26: Rc<UH0> = Rc::new(UH0::UH0_Cons(v24.clone(), v25.clone()));
        Rc::new(UH0::UH0_Cons(v23.clone(), v26.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    };
    let v34: Rc<UH0> = if v7 {
        let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("attachments.media_keys"); } LIT.with(|lit| lit.clone()) };
        let v31: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v30.clone(), v31.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    };
    let v35: Rc<UH0> = method16(v29.clone(), v34.clone());
    let v46: Rc<str> = match &*v35 {
        UH0::UH0_Nil => {
            let v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v36.clone()
        }
        _ => {
            let v37: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            let v38: i32 = 0i32;
            let v39: i32 = method15(v37.clone(), v35.clone(), v38);
            let v40: Rc<Vec<Rc<str>>> = Rc::new(v37.borrow().clone());
            let v41: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v40).as_ref().clone()));
            let v42: Rc<str> = Rc::<str>::from((*v41.borrow()).join(&*v15));
            let v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&expansions="); } LIT.with(|lit| lit.clone()) };
            let v45: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v43, v42)), v21));
            v45.clone()
        }
    };
    let v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&post.fields=created_at,author_id,public_metrics,entities,attachments"); } LIT.with(|lit| lit.clone()) };
    let v49: Rc<str> = Rc::<str>::from(format!("{}{}", v18, Rc::<str>::from(format!("{}{}", v47, v46))));
    v49.clone()
}
fn app_reply_17(mut v0: Rc<str>, mut v1: US0, mut v2: Rc<str>) -> US1 {
    let v3: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v2));
    let mut v9: Rc<str> = match &v1 {
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
        US1::US1_Ok(v17.clone(), v15.clone())
    } else {
        let v19: US2 = US2::US2_Reported(v15.clone());
        US1::US1_Error(v19.clone())
    }
}
fn method12(mut v0: Rc<str>, mut v1: US0, mut v2: i32, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: bool, mut v6: bool, mut v7: i32, mut v8: bool, mut v9: Rc<UH2>, mut v10: Rc<UH3>) -> Rc<UH3> {
    match &*v9 {
        UH2::UH2_Cons(v11, v12) => {
            let v11: Rc<UH1> = v11.clone();
            let v12: Rc<UH2> = v12.clone();
            let v13: Rc<UH3> = method12(v0.clone(), v1.clone(), v2, v3.clone(), v4.clone(), v5, v6, v7, v8, v12, v10.clone());
            let v14: Rc<str> = lookup_path_13(v11, v2, v3, v4, v5, v6, v7, v8);
            let v15: US1 = app_reply_17(v0, v1, v14);
            Rc::new(UH3::UH3_Cons(v15, v13))
        }
        UH2::UH2_Nil => {
            v10
        }
    }
}
fn method19(mut v0: Rc<UH4>, mut v1: Rc<UH4>) -> Rc<UH4> {
    loop {
        match &*v0 {
            UH4::UH4_Cons(v2, v3, v4) => {
                let v2: serde_json::Value = v2.clone();
                let v3: Rc<str> = v3.clone();
                let mut v4: Rc<UH4> = v4.clone();
                let mut v5: Rc<UH4> = Rc::new(UH4::UH4_Cons(v2.clone(), v3.clone(), v1.clone()));
                (v0, v1) = (v4.clone(), v5.clone());
                continue;
            }
            UH4::UH4_Nil => {
                return v1.clone();
            }
        }
    }
}
fn collected_18(mut v0: Rc<UH3>, mut v1: Rc<UH4>) -> US4 {
    loop {
        match &*v0 {
            UH3::UH3_Cons(v5, v6) => {
                let mut v5: US1 = v5.clone();
                let v6: Rc<UH3> = v6.clone();
                match &v5 {
                    US1::US1_Error(v7) => {
                        let mut v7: US2 = v7.clone();
                        return US4::US4_Error(v7.clone());
                    }
                    US1::US1_Ok(v9, v10) => {
                        let mut v9: serde_json::Value = v9.clone();
                        let v10: Rc<str> = v10.clone();
                        let v11: Rc<UH4> = Rc::new(UH4::UH4_Cons(v9.clone(), v10.clone(), v1.clone()));
                        (v0, v1) = (v6.clone(), v11.clone());
                        continue;
                    }
                }
            }
            UH3::UH3_Nil => {
                let v2: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
                let v3: Rc<UH4> = method19(v1.clone(), v2.clone());
                return US4::US4_Ok(v3.clone());
            }
        }
    }
}
fn describe_failure_21(mut v0: US2) -> Rc<str> {
    match &v0 {
        US2::US2_CursorHalted(v5, v6) => {
            let mut v5: Rc<str> = v5.clone();
            let v6: US3 = v6.clone();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v7));
            let mut v29: Rc<str> = match &v6 {
                US3::US3_CursorBudget(v19, v20) => {
                    let v19: Rc<str> = v19.clone();
                    let v20: i32 = *v20;
                    let mut v21: Rc<str> = Rc::<str>::from(format!("{:?}", v20));
                    let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" pages"); } LIT.with(|lit| lit.clone()) };
                    let v23: Rc<str> = Rc::<str>::from(format!("{}{}", v21, v22));
                    let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("stopped after "); } LIT.with(|lit| lit.clone()) };
                    let v25: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v23));
                    let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" (page budget)"); } LIT.with(|lit| lit.clone()) };
                    let v27: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v26));
                    v27.clone()
                }
                US3::US3_CursorRepeated(v9, v10) => {
                    let mut v9: Rc<str> = v9.clone();
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
        US2::US2_NoSuchAccount(v2) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
            let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v2));
            v4.clone()
        }
        US2::US2_Reported(v1) => {
            let mut v1: Rc<str> = v1.clone();
            v1.clone()
        }
    }
}
fn from_24(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let mut v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let mut v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v10.clone());
            continue;
        }
    }
}
fn from_23(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH5>) -> Rc<UH5> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
            let mut v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let mut v9: usize = v8.as_array().map_or(0, Vec::len);
            let v10: i32 = ((v9) as i32);
            let v11: i32 = v10.wrapping_sub(1i32);
            let v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v13: Rc<UH0> = from_24(v8.clone(), v11, v12.clone());
            let v14: Rc<UH5> = Rc::new(UH5::UH5_Cons(v13.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v14.clone());
            continue;
        }
    }
}
fn method25(mut v0: Rc<UH5>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH5::UH5_Cons(v2, v3) => {
            let v2: Rc<UH0> = v2.clone();
            let v3: Rc<UH5> = v3.clone();
            let mut v4: Rc<UH0> = method25(v3, v1.clone());
            method16(v2, v4)
        }
        UH5::UH5_Nil => {
            v1
        }
    }
}
fn method22(mut v0: Rc<UH4>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH4::UH4_Cons(v2, v3, v4) => {
            let v2: serde_json::Value = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH4> = v4.clone();
            let mut v5: Rc<UH1> = method22(v4.clone(), v1.clone());
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v2.get(&*v6).cloned().unwrap_or_default();
            let mut v8: usize = v7.as_array().map_or(0, Vec::len);
            let mut v9: i32 = ((v8) as i32);
            let v10: i32 = v9.wrapping_sub(1i32);
            let v11: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
            let v12: Rc<UH5> = from_23(v7.clone(), v10, v11.clone());
            let v13: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v14: Rc<UH0> = method25(v12.clone(), v13.clone());
            let v15: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v16: Rc<UH1> = method3(v14.clone(), v15.clone());
            method8(v16.clone(), v5.clone())
        }
        UH4::UH4_Nil => {
            v1.clone()
        }
    }
}
fn from_28(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH6>) -> Rc<UH6> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let mut v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let mut v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("username"); } LIT.with(|lit| lit.clone()) };
            let v11: serde_json::Value = v6.get(&*v10).cloned().unwrap_or_default();
            let v12: Rc<str> = Rc::<str>::from(v11.as_str().unwrap_or(""));
            let v13: Rc<UH6> = Rc::new(UH6::UH6_Cons(v9.clone(), v12.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v13.clone());
            continue;
        }
    }
}
fn method29(mut v0: Rc<UH6>, mut v1: Rc<UH6>) -> Rc<UH6> {
    match &*v0 {
        UH6::UH6_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH6> = v4.clone();
            let mut v5: Rc<UH6> = method29(v4, v1.clone());
            let v6: bool = &*v3 != "";
            if v6 {
                Rc::new(UH6::UH6_Cons(v2, v3, v5.clone()))
            } else {
                v5
            }
        }
        UH6::UH6_Nil => {
            v1
        }
    }
}
fn method30(mut v0: Rc<UH6>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH6::UH6_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH6> = v4.clone();
            let mut v5: Rc<UH0> = method30(v4, v1.clone());
            Rc::new(UH0::UH0_Cons(v2, v5))
        }
        UH6::UH6_Nil => {
            v1
        }
    }
}
fn from_31(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("author_id"); } LIT.with(|lit| lit.clone()) };
            let mut v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let mut v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v10.clone());
            continue;
        }
    }
}
fn absorbed_27(mut v0: serde_json::Value, mut v1: Rc<str>, mut v2: Rc<UH0>, mut v3: Rc<UH0>, mut v4: Rc<str>, mut v5: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("includes"); } LIT.with(|lit| lit.clone()) };
    let mut v7: serde_json::Value = v0.get(&*v6).cloned().unwrap_or_default();
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("users"); } LIT.with(|lit| lit.clone()) };
    let mut v9: serde_json::Value = v7.get(&*v8).cloned().unwrap_or_default();
    let v10: usize = v9.as_array().map_or(0, Vec::len);
    let v11: i32 = ((v10) as i32);
    let v12: i32 = v11.wrapping_sub(1i32);
    let v13: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
    let v14: Rc<UH6> = from_28(v9.clone(), v12, v13.clone());
    let v15: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
    let v16: Rc<UH6> = method29(v14.clone(), v15.clone());
    let v17: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v18: Rc<UH0> = method30(v16.clone(), v17.clone());
    let v19: Rc<UH0> = method16(v3.clone(), v18.clone());
    let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
    let mut v21: serde_json::Value = v0.get(&*v20).cloned().unwrap_or_default();
    let v22: usize = v21.as_array().map_or(0, Vec::len);
    let v23: i32 = ((v22) as i32);
    let v24: i32 = v23.wrapping_sub(1i32);
    let v25: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v26: Rc<UH0> = from_31(v21.clone(), v24, v25.clone());
    let v27: serde_json::Value = v0.get(&*v6).cloned().unwrap_or_default();
    let v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts"); } LIT.with(|lit| lit.clone()) };
    let mut v29: serde_json::Value = v27.get(&*v28).cloned().unwrap_or_default();
    let v30: usize = v29.as_array().map_or(0, Vec::len);
    let v31: i32 = ((v30) as i32);
    let v32: i32 = v31.wrapping_sub(1i32);
    let v33: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v34: Rc<UH0> = from_31(v29.clone(), v32, v33.clone());
    let v35: Rc<UH0> = method16(v26.clone(), v34.clone());
    let v36: Rc<UH0> = method16(v2.clone(), v35.clone());
    let v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"role\":\"lookup\",\"author\":\"\",\"doc\":"); } LIT.with(|lit| lit.clone()) };
    let v38: Rc<str> = Rc::<str>::from(format!("{}{}", v37, v1));
    let v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
    let v40: Rc<str> = Rc::<str>::from(format!("{}{}", v38, v39));
    let v41: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v42: Rc<UH0> = Rc::new(UH0::UH0_Cons(v40.clone(), v41.clone()));
    let v43: Rc<UH0> = method16(v5.clone(), v42.clone());
    (v36.clone(), v19.clone(), v4.clone(), v43.clone())
}
fn method26(mut v0: Rc<UH4>, mut v1: Rc<UH0>, mut v2: Rc<UH0>, mut v3: Rc<str>, mut v4: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let (mut v20, mut v21, mut v22, mut v23): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &*v0 {
        UH4::UH4_Cons(v5, v6, v7) => {
            let mut v5: serde_json::Value = v5.clone();
            let v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH4> = v7.clone();
            let (mut v8, mut v9, mut v10, mut v11): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = absorbed_27(v5, v6, v1.clone(), v2.clone(), v3.clone(), v4.clone());
            method26(v7, v8, v9, v10, v11)
        }
        _ => {
            let (mut v16, mut v17, mut v18, mut v19): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &*v0 {
                UH4::UH4_Nil => {
                    (v1, v2, v3, v4)
                }
                _ => unreachable!(),
            };
            (v16, v17, v18, v19)
        }
    };
    (v20, v21, v22, v23)
}
fn deepened_20(mut v0: Rc<str>, mut v1: US0, mut v2: i32, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: bool, mut v6: bool, mut v7: i32, mut v8: bool, mut v9: i32, mut v10: Rc<UH0>, mut v11: Rc<UH0>, mut v12: Rc<str>, mut v13: Rc<UH0>, mut v14: US4) -> (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let (mut v33, mut v34, mut v35, mut v36): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &v14 {
        US4::US4_Error(v15) => {
            let v15: US2 = v15.clone();
            let v16: Rc<str> = describe_failure_21(v15.clone());
            (v10.clone(), v11.clone(), v16.clone(), v13.clone())
        }
        _ => {
            let (mut v29, mut v30, mut v31, mut v32): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &v14 {
                US4::US4_Ok(v17) => {
                    let v17: Rc<UH4> = v17.clone();
                    let v18: i32 = v9.wrapping_add(1i32);
                    let v19: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let v20: Rc<UH1> = method22(v17.clone(), v19.clone());
                    let (mut v21, mut v22, mut v23, mut v24): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = method26(v17.clone(), v10.clone(), v11.clone(), v12.clone(), v13.clone());
                    deepen_4(v0.clone(), v1.clone(), v2, v3.clone(), v4.clone(), v5, v6, v7, v8, v18, v20.clone(), v21.clone(), v22.clone(), v23.clone(), v24.clone())
                }
                _ => unreachable!(),
            };
            (v29.clone(), v30.clone(), v31.clone(), v32.clone())
        }
    };
    (v33.clone(), v34.clone(), v35.clone(), v36.clone())
}
fn deepen_4(mut v0: Rc<str>, mut v1: US0, mut v2: i32, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: bool, mut v6: bool, mut v7: i32, mut v8: bool, mut v9: i32, mut v10: Rc<UH1>, mut v11: Rc<UH0>, mut v12: Rc<UH0>, mut v13: Rc<str>, mut v14: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let v15: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v16: Rc<UH1> = method5(v10.clone(), v15.clone());
    let (mut v32, mut v33, mut v34, mut v35): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &*v16 {
        UH1::UH1_Nil => {
            (v11.clone(), v12.clone(), v13.clone(), v14.clone())
        }
        _ => {
            let v17: bool = v9 >= v7;
            let (mut v28, mut v29, mut v30, mut v31): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = if v17 {
                (v11.clone(), v12.clone(), v13.clone(), v14.clone())
            } else {
                let v18: i32 = 100i32;
                let v19: Rc<UH2> = chunks__9(v18, v16.clone());
                let v20: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
                let mut v21: Rc<UH3> = method12(v0.clone(), v1.clone(), v2, v3.clone(), v4.clone(), v5, v6, v7, v8, v19.clone(), v20.clone());
                let v22: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
                let v23: US4 = collected_18(v21.clone(), v22.clone());
                let (mut v24, mut v25, mut v26, mut v27): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = deepened_20(v0.clone(), v1.clone(), v2, v3.clone(), v4.clone(), v5, v6, v7, v8, v9, v11.clone(), v12.clone(), v13.clone(), v14.clone(), v23.clone());
                (v24.clone(), v25.clone(), v26.clone(), v27.clone())
            };
            (v28.clone(), v29.clone(), v30.clone(), v31.clone())
        }
    };
    (v32.clone(), v33.clone(), v34.clone(), v35.clone())
}
fn closure3(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> bool> {
    Rc::new(move |mut v1: Rc<str>| -> bool {
        let v2: bool = &*v0 == &*v1;
        v2
    })
}
fn method33(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> bool> {
    closure3(v0)
}
fn method34(mut v0: Rc<str>, mut v1: Rc<dyn Fn(Rc<str>) -> bool>, mut v2: Rc<UH0>) -> bool {
    loop {
        match &*v2 {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3.clone();
                let mut v4: Rc<UH0> = v4.clone();
                let mut v5: bool = v1(v3.clone());
                if v5 {
                    return true;
                } else {
                    let v6: Rc<dyn Fn(Rc<str>) -> bool> = method33(v0.clone());
                    (v0, v1, v2) = (v0.clone(), v6.clone(), v4.clone());
                    continue;
                }
            }
            UH0::UH0_Nil => {
                return false;
            }
        }
    }
}
fn method32(mut v0: Rc<UH0>, mut v1: Rc<UH0>, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: Rc<UH0>, mut v5: Rc<UH0>) -> Rc<UH0> {
    match &*v4 {
        UH0::UH0_Cons(v6, v7) => {
            let v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH0> = v7.clone();
            let mut v8: Rc<UH0> = method32(v0, v1.clone(), v2, v3, v7, v5.clone());
            let mut v9: bool = &*v6 != "";
            let v13: bool = if v9 {
                let v10: Rc<dyn Fn(Rc<str>) -> bool> = method33(v6.clone());
                let v11: bool = method34(v6.clone(), v10, v1);
                let v12: bool = v11 == false;
                v12
            } else {
                false
            };
            if v13 {
                Rc::new(UH0::UH0_Cons(v6, v8.clone()))
            } else {
                v8
            }
        }
        UH0::UH0_Nil => {
            v5
        }
    }
}
fn method35(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let mut v4: Rc<dyn Fn(Rc<str>) -> bool> = method33(v2.clone());
                let mut v5: bool = method34(v2.clone(), v4.clone(), v1.clone());
                let mut v9: Rc<UH0> = if v5 {
                    v1.clone()
                } else {
                    let v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let mut v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2.clone(), v6.clone()));
                    method16(v1.clone(), v7.clone())
                };
                (v0, v1) = (v3.clone(), v9.clone());
                continue;
            }
            UH0::UH0_Nil => {
                return v1.clone();
            }
        }
    }
}
fn traced_refs_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: i32, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: bool, mut v9: bool, mut v10: i32, mut v11: bool) -> (Rc<str>, Rc<str>, Rc<str>) {
    let v12: i32 = (v0.clone().len() as i32);
    let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let v14: bool = v0.ends_with(&*v13);
    let v19: Rc<str> = if v14 {
        let v15: i32 = v12.wrapping_sub(1i32);
        let v16: usize = ((0i32) as usize);
        let v17: usize = ((v15) as usize);
        let v18: Rc<str> = Rc::<str>::from(&(v0)[v16..v17]);
        v18.clone()
    } else {
        v0.clone()
    };
    let v20: US0 = US0::US0_BearerToken(v1.clone());
    let mut v21: i32 = 1i32;
    let v22: bool = &*v2 == "";
    let v26: Rc<UH0> = if v22 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_list_1(v24.clone(), v2.clone())
    };
    let v27: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v28: Rc<UH1> = method3(v26.clone(), v27.clone());
    let mut v29: bool = &*v3 == "";
    let v33: Rc<UH0> = if v29 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_list_1(v31.clone(), v3.clone())
    };
    let v34: bool = &*v4 == "";
    let v38: Rc<UH0> = if v34 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_list_1(v36.clone(), v4.clone())
    };
    let v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v40: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let (mut v41, mut v42, mut v43, mut v44): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = deepen_4(v19.clone(), v20.clone(), v5, v6.clone(), v7.clone(), v8, v9, v10, v11, v21, v28.clone(), v33.clone(), v38.clone(), v39.clone(), v40.clone());
    let v45: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v46: i32 = 0i32;
    let v47: i32 = method15(v45.clone(), v44.clone(), v46);
    let v48: Rc<Vec<Rc<str>>> = Rc::new(v45.borrow().clone());
    let v49: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v48).as_ref().clone()));
    let v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let v51: Rc<str> = Rc::<str>::from((*v49.borrow()).join(&*v50));
    let v52: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v53: Rc<UH0> = method32(v41.clone(), v42.clone(), v43.clone(), v44.clone(), v41.clone(), v52.clone());
    let v54: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v55: Rc<UH0> = method35(v53.clone(), v54.clone());
    let v56: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v57: i32 = 0i32;
    let v58: i32 = method15(v56.clone(), v55.clone(), v57);
    let v59: Rc<Vec<Rc<str>>> = Rc::new(v56.borrow().clone());
    let v60: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v59).as_ref().clone()));
    let v61: Rc<str> = Rc::<str>::from((*v60.borrow()).join(&*v50));
    (v51.clone(), v43.clone(), v61.clone())
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, bool) -> (Rc<str>, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, bool) -> (Rc<str>, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: i32, mut v6: bool| -> (Rc<str>, Rc<str>, Rc<str>) {
        let mut v7: i32 = 5i32;
        let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v9: bool = false;
        let v10: bool = false;
        traced_refs_0(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v7, v8.clone(), v8.clone(), v9, v10, v5, v6)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_refs(v0: &str, v1: &str, v2: &str, v3: &str, v4: &str, v5: i32, v6: bool) -> (Rc<str>, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), Rc::<str>::from(v3), Rc::<str>::from(v4), v5, v6)
}
