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
pub struct Mut0 { pub l0: i32, pub l1: Rc<UH0> }
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
fn method2(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
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
fn method3(mut v0: i32, mut v1: &Rc<RefCell<Mut0>>) -> bool {
    let v2: i32 = v1.borrow().l0;
    let v3: bool = v2 < v0;
    v3
}
fn split_list_1(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let v2: i32 = (v0.clone().len() as i32);
    let v3: bool = v2 == 0i32;
    if v3 {
        let v4: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1, v4))
    } else {
        let v6: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(v1.split(&*v0).map(|x| Rc::<str>::from(x)).collect::<Vec<Rc<str>>>()));
        let mut v7: i32 = (v6.clone().borrow().len() as i32);
        let mut v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v9: Rc<RefCell<Mut0>> = Rc::new(RefCell::new(Mut0 { l0: 0i32, l1: v8 }));
        while method3(v7, &v9) {
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
        method2(v16, v17)
    }
}
fn method4(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH0> = v3;
            let v4: Rc<UH1> = method4(v3, v1);
            Rc::new(UH1::UH1_Cons(v2, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn closure1(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> bool> {
    Rc::new(move |mut v1: Rc<str>| -> bool {
        let v2: bool = &*v0 == &*v1;
        v2
    })
}
fn method7(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> bool> {
    closure1(v0)
}
fn method8(mut v0: Rc<str>, mut v1: Rc<dyn Fn(Rc<str>) -> bool>, mut v2: Rc<UH1>) -> bool {
    loop {
        match Rc::unwrap_or_clone(v2) {
            UH1::UH1_Cons(v3, v4) => {
                let v3: Rc<str> = v3;
                let v4: Rc<UH1> = v4;
                let v5: bool = v1(v3);
                if v5 {
                    return true;
                } else {
                    let v6: Rc<dyn Fn(Rc<str>) -> bool> = method7(v0.clone());
                    (v1, v2) = (v6, v4);
                    continue;
                }
            }
            UH1::UH1_Nil => {
                return false;
            }
        }
    }
}
fn method9(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH1> = v3;
            let v4: Rc<UH1> = method9(v3, v1);
            Rc::new(UH1::UH1_Cons(v2, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method6(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let v3: Rc<UH1> = v3;
                let v4: Rc<dyn Fn(Rc<str>) -> bool> = method7(v2.clone());
                let v5: bool = method8(v2.clone(), v4, v1.clone());
                let mut v9: Rc<UH1> = if v5 {
                    v1
                } else {
                    let v6: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let mut v7: Rc<UH1> = Rc::new(UH1::UH1_Cons(v2, v6));
                    method9(v1, v7)
                };
                (v0, v1) = (v3, v9);
                continue;
            }
            UH1::UH1_Nil => {
                return v1;
            }
        }
    }
}
fn taken_11(mut v0: i32, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v1) {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH1> = v3;
            let v4: bool = v0 > 0i32;
            if v4 {
                let v5: i32 = v0.wrapping_sub(1i32);
                let v6: Rc<UH1> = taken_11(v5, v3);
                Rc::new(UH1::UH1_Cons(v2, v6))
            } else {
                { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
            }
        }
        _ => {
            { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
        }
    }
}
fn skip__12(mut v0: i32, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v1 {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH1> = v3.clone();
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
fn chunks__10(mut v0: i32, mut v1: Rc<UH1>) -> Rc<UH2> {
    match &*v1 {
        UH1::UH1_Nil => {
            { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
        }
        _ => {
            let v3: bool = v0 <= 0i32;
            if v3 {
                let v4: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                Rc::new(UH2::UH2_Cons(v1, v4))
            } else {
                let v6: Rc<UH1> = taken_11(v0, v1.clone());
                let mut v7: Rc<UH1> = skip__12(v0, v1);
                let mut v8: Rc<UH2> = chunks__10(v0, v7);
                Rc::new(UH2::UH2_Cons(v6, v8))
            }
        }
    }
}
fn method15(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH1> = v3;
            let v4: Rc<UH0> = method15(v3, v1);
            Rc::new(UH0::UH0_Cons(v2, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method16(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
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
fn method17(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH0> = v3;
            let v4: Rc<UH0> = method17(v3, v1);
            Rc::new(UH0::UH0_Cons(v2, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn lookup_path_14(mut v0: Rc<UH1>, mut v1: i32, mut v2: &Rc<str>, mut v3: &Rc<str>, mut v4: bool, mut v5: bool, mut v6: i32, mut v7: bool) -> Rc<str> {
    let mut v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v9: Rc<UH0> = method15(v0, v8);
    let v10: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v11: i32 = 0i32;
    let v12: i32 = method16(v10.clone(), v9, v11);
    let v13: Rc<Vec<Rc<str>>> = Rc::new(v10.borrow().clone());
    let v14: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v13).as_ref().clone()));
    let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let v16: Rc<str> = Rc::<str>::from((*v14.borrow()).join(&*v15));
    let v17: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets?ids="); } LIT.with(|lit| lit.clone()) }, v16));
    let v20: Rc<str> = if v7 {
        let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&media.fields=type,alt_text"); } LIT.with(|lit| lit.clone()) };
        v18
    } else {
        let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v19
    };
    let mut v21: bool = v6 > 0i32;
    let v28: Rc<UH0> = if v21 {
        let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
        let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts.author_id"); } LIT.with(|lit| lit.clone()) };
        let v24: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v25: Rc<UH0> = Rc::new(UH0::UH0_Cons(v23, v24));
        Rc::new(UH0::UH0_Cons(v22, v25))
    } else {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    };
    let v33: Rc<UH0> = if v7 {
        let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("attachments.media_keys"); } LIT.with(|lit| lit.clone()) };
        let v30: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v29, v30))
    } else {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    };
    let v34: Rc<UH0> = method17(v28, v33);
    let v44: Rc<str> = match &*v34 {
        UH0::UH0_Nil => {
            let v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v35
        }
        _ => {
            let v36: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            let v37: i32 = 0i32;
            let v38: i32 = method16(v36.clone(), v34, v37);
            let v39: Rc<Vec<Rc<str>>> = Rc::new(v36.borrow().clone());
            let v40: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v39).as_ref().clone()));
            let v41: Rc<str> = Rc::<str>::from((*v40.borrow()).join(&*v15));
            let v42: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&expansions="); } LIT.with(|lit| lit.clone()) }, v41));
            let v43: Rc<str> = Rc::<str>::from(format!("{}{}", v42, v20));
            v43
        }
    };
    let v45: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&post.fields=created_at,author_id,public_metrics,entities,attachments"); } LIT.with(|lit| lit.clone()) }, v44));
    let v46: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v45));
    v46
}
fn app_reply_18(mut v0: Rc<str>, mut v1: US0, mut v2: Rc<str>) -> US1 {
    let v3: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v2.clone()));
    let mut v8: Rc<str> = match v1 {
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
        US1::US1_Ok(v16, v14)
    } else {
        let v18: US2 = US2::US2_Reported(v14);
        US1::US1_Error(v18)
    }
}
fn method13(mut v0: Rc<str>, mut v1: US0, mut v2: i32, mut v3: &Rc<str>, mut v4: &Rc<str>, mut v5: bool, mut v6: bool, mut v7: i32, mut v8: bool, mut v9: Rc<UH2>, mut v10: Rc<UH3>) -> Rc<UH3> {
    match Rc::unwrap_or_clone(v9) {
        UH2::UH2_Cons(v11, v12) => {
            let v11: Rc<UH1> = v11;
            let v12: Rc<UH2> = v12;
            let v13: Rc<UH3> = method13(v0.clone(), v1.clone(), v2, v3, v4, v5, v6, v7, v8, v12, v10);
            let v14: Rc<str> = lookup_path_14(v11, v2, v3, v4, v5, v6, v7, v8);
            let v15: US1 = app_reply_18(v0, v1, v14);
            Rc::new(UH3::UH3_Cons(v15, v13))
        }
        UH2::UH2_Nil => {
            v10
        }
    }
}
fn method20(mut v0: Rc<UH4>, mut v1: Rc<UH4>) -> Rc<UH4> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH4::UH4_Cons(v2, v3, v4) => {
                let v2: serde_json::Value = v2;
                let v3: Rc<str> = v3;
                let v4: Rc<UH4> = v4;
                let v5: Rc<UH4> = Rc::new(UH4::UH4_Cons(v2, v3, v1));
                (v0, v1) = (v4, v5);
                continue;
            }
            UH4::UH4_Nil => {
                return v1;
            }
        }
    }
}
fn collected_19(mut v0: Rc<UH3>, mut v1: Rc<UH4>) -> US4 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH3::UH3_Cons(v5, v6) => {
                let v5: US1 = v5;
                let v6: Rc<UH3> = v6;
                match v5 {
                    US1::US1_Error(v7) => {
                        let mut v7: US2 = v7;
                        return US4::US4_Error(v7);
                    }
                    US1::US1_Ok(v9, v10) => {
                        let mut v9: serde_json::Value = v9;
                        let v10: Rc<str> = v10;
                        let v11: Rc<UH4> = Rc::new(UH4::UH4_Cons(v9, v10, v1));
                        (v0, v1) = (v6, v11);
                        continue;
                    }
                }
            }
            UH3::UH3_Nil => {
                let v2: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
                let v3: Rc<UH4> = method20(v1, v2);
                return US4::US4_Ok(v3);
            }
        }
    }
}
fn describe_failure_22(mut v0: US2) -> Rc<str> {
    match v0 {
        US2::US2_CursorHalted(v4, v5) => {
            let v4: Rc<str> = v4;
            let v5: US3 = v5;
            let v6: Rc<str> = Rc::<str>::from(format!("{}{}", v4, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) }));
            let mut v21: Rc<str> = match v5 {
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
                    let mut v8: i32 = v8;
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
            let mut v1: Rc<str> = v1;
            v1
        }
    }
}
fn from_25(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2;
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let mut v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let mut v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9, v2));
            (v1, v2) = (v4, v10);
            continue;
        }
    }
}
fn from_24(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH5>) -> Rc<UH5> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2;
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
            let mut v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let mut v9: usize = v8.as_array().map_or(0, Vec::len);
            let v10: i32 = ((v9) as i32);
            let v11: i32 = v10.wrapping_sub(1i32);
            let v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v13: Rc<UH0> = from_25(v8, v11, v12);
            let v14: Rc<UH5> = Rc::new(UH5::UH5_Cons(v13, v2));
            (v1, v2) = (v4, v14);
            continue;
        }
    }
}
fn method26(mut v0: Rc<UH5>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH5::UH5_Cons(v2, v3) => {
            let v2: Rc<UH0> = v2;
            let v3: Rc<UH5> = v3;
            let v4: Rc<UH0> = method26(v3, v1);
            method17(v2, v4)
        }
        UH5::UH5_Nil => {
            v1
        }
    }
}
fn method23(mut v0: Rc<UH4>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH4::UH4_Cons(v2, v3, v4) => {
            let v2: serde_json::Value = v2;
            let v3: Rc<str> = v3;
            let v4: Rc<UH4> = v4;
            let v5: Rc<UH1> = method23(v4, v1);
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v2.get(&*v6).cloned().unwrap_or_default();
            let mut v8: usize = v7.as_array().map_or(0, Vec::len);
            let mut v9: i32 = ((v8) as i32);
            let v10: i32 = v9.wrapping_sub(1i32);
            let v11: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
            let v12: Rc<UH5> = from_24(v7, v10, v11);
            let v13: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v14: Rc<UH0> = method26(v12, v13);
            let v15: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v16: Rc<UH1> = method4(v14, v15);
            method9(v16, v5)
        }
        UH4::UH4_Nil => {
            v1
        }
    }
}
fn from_29(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH6>) -> Rc<UH6> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2;
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let mut v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let mut v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("username"); } LIT.with(|lit| lit.clone()) };
            let v11: serde_json::Value = v6.get(&*v10).cloned().unwrap_or_default();
            let v12: Rc<str> = Rc::<str>::from(v11.as_str().unwrap_or(""));
            let v13: Rc<UH6> = Rc::new(UH6::UH6_Cons(v9, v12, v2));
            (v1, v2) = (v4, v13);
            continue;
        }
    }
}
fn method30(mut v0: Rc<UH6>, mut v1: Rc<UH6>) -> Rc<UH6> {
    match Rc::unwrap_or_clone(v0) {
        UH6::UH6_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2;
            let v3: Rc<str> = v3;
            let v4: Rc<UH6> = v4;
            let v5: Rc<UH6> = method30(v4, v1);
            let v6: bool = &*v3 != "";
            if v6 {
                Rc::new(UH6::UH6_Cons(v2, v3, v5))
            } else {
                v5
            }
        }
        UH6::UH6_Nil => {
            v1
        }
    }
}
fn method31(mut v0: Rc<UH6>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH6::UH6_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2;
            let v3: Rc<str> = v3;
            let v4: Rc<UH6> = v4;
            let v5: Rc<UH0> = method31(v4, v1);
            Rc::new(UH0::UH0_Cons(v2, v5))
        }
        UH6::UH6_Nil => {
            v1
        }
    }
}
fn from_32(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2;
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("author_id"); } LIT.with(|lit| lit.clone()) };
            let mut v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let mut v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9, v2));
            (v1, v2) = (v4, v10);
            continue;
        }
    }
}
fn absorbed_28(mut v0: serde_json::Value, mut v1: Rc<str>, mut v2: Rc<UH0>, mut v3: Rc<UH0>, mut v4: Rc<str>, mut v5: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("includes"); } LIT.with(|lit| lit.clone()) };
    let mut v7: serde_json::Value = v0.get(&*v6).cloned().unwrap_or_default();
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("users"); } LIT.with(|lit| lit.clone()) };
    let mut v9: serde_json::Value = v7.get(&*v8).cloned().unwrap_or_default();
    let v10: usize = v9.as_array().map_or(0, Vec::len);
    let v11: i32 = ((v10) as i32);
    let v12: i32 = v11.wrapping_sub(1i32);
    let v13: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
    let v14: Rc<UH6> = from_29(v9, v12, v13);
    let v15: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
    let v16: Rc<UH6> = method30(v14, v15);
    let v17: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v18: Rc<UH0> = method31(v16, v17);
    let v19: Rc<UH0> = method17(v3, v18);
    let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
    let mut v21: serde_json::Value = v0.get(&*v20).cloned().unwrap_or_default();
    let v22: usize = v21.as_array().map_or(0, Vec::len);
    let v23: i32 = ((v22) as i32);
    let v24: i32 = v23.wrapping_sub(1i32);
    let v25: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v26: Rc<UH0> = from_32(v21, v24, v25);
    let v27: serde_json::Value = v0.get(&*v6).cloned().unwrap_or_default();
    let v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts"); } LIT.with(|lit| lit.clone()) };
    let mut v29: serde_json::Value = v27.get(&*v28).cloned().unwrap_or_default();
    let v30: usize = v29.as_array().map_or(0, Vec::len);
    let v31: i32 = ((v30) as i32);
    let v32: i32 = v31.wrapping_sub(1i32);
    let v33: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v34: Rc<UH0> = from_32(v29, v32, v33);
    let v35: Rc<UH0> = method17(v26, v34);
    let v36: Rc<UH0> = method17(v2, v35);
    let v37: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"role\":\"lookup\",\"author\":\"\",\"doc\":"); } LIT.with(|lit| lit.clone()) }, v1));
    let v38: Rc<str> = Rc::<str>::from(format!("{}{}", v37, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) }));
    let v39: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v40: Rc<UH0> = Rc::new(UH0::UH0_Cons(v38, v39));
    let v41: Rc<UH0> = method17(v5, v40);
    (v36, v19, v4, v41)
}
fn method27(mut v0: Rc<UH4>, mut v1: Rc<UH0>, mut v2: Rc<UH0>, mut v3: Rc<str>, mut v4: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let (mut v20, mut v21, mut v22, mut v23): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &*v0 {
        UH4::UH4_Cons(v5, v6, v7) => {
            let v5: serde_json::Value = v5.clone();
            let v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH4> = v7.clone();
            let (mut v8, mut v9, mut v10, mut v11): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = absorbed_28(v5, v6, v1, v2, v3, v4);
            method27(v7, v8, v9, v10, v11)
        }
        _ => {
            let (mut v16, mut v17, mut v18, mut v19): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match Rc::unwrap_or_clone(v0) {
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
fn deepened_21(mut v0: Rc<str>, mut v1: US0, mut v2: i32, mut v3: &Rc<str>, mut v4: &Rc<str>, mut v5: bool, mut v6: bool, mut v7: i32, mut v8: bool, mut v9: i32, mut v10: Rc<UH0>, mut v11: Rc<UH0>, mut v12: Rc<str>, mut v13: Rc<UH0>, mut v14: US4) -> (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let (mut v33, mut v34, mut v35, mut v36): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &v14 {
        US4::US4_Error(v15) => {
            let v15: US2 = v15.clone();
            let v16: Rc<str> = describe_failure_22(v15);
            (v10, v11, v16, v13)
        }
        _ => {
            let (mut v29, mut v30, mut v31, mut v32): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match v14 {
                US4::US4_Ok(v17) => {
                    let v17: Rc<UH4> = v17;
                    let v18: i32 = v9.wrapping_add(1i32);
                    let v19: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let v20: Rc<UH1> = method23(v17.clone(), v19);
                    let (mut v21, mut v22, mut v23, mut v24): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = method27(v17, v10, v11, v12, v13);
                    deepen_5(v0, v1, v2, v3, v4, v5, v6, v7, v8, v18, v20, v21, v22, v23, v24)
                }
                _ => unreachable!(),
            };
            (v29, v30, v31, v32)
        }
    };
    (v33, v34, v35, v36)
}
fn deepen_5(mut v0: Rc<str>, mut v1: US0, mut v2: i32, mut v3: &Rc<str>, mut v4: &Rc<str>, mut v5: bool, mut v6: bool, mut v7: i32, mut v8: bool, mut v9: i32, mut v10: Rc<UH1>, mut v11: Rc<UH0>, mut v12: Rc<UH0>, mut v13: Rc<str>, mut v14: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let v15: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v16: Rc<UH1> = method6(v10, v15);
    let (mut v32, mut v33, mut v34, mut v35): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &*v16 {
        UH1::UH1_Nil => {
            (v11, v12, v13, v14)
        }
        _ => {
            let v17: bool = v9 >= v7;
            let (mut v28, mut v29, mut v30, mut v31): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = if v17 {
                (v11, v12, v13, v14)
            } else {
                let v18: i32 = 100i32;
                let v19: Rc<UH2> = chunks__10(v18, v16);
                let v20: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
                let mut v21: Rc<UH3> = method13(v0.clone(), v1.clone(), v2, v3, v4, v5, v6, v7, v8, v19, v20);
                let v22: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
                let v23: US4 = collected_19(v21, v22);
                let (mut v24, mut v25, mut v26, mut v27): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = deepened_21(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v11, v12, v13, v14, v23);
                (v24, v25, v26, v27)
            };
            (v28, v29, v30, v31)
        }
    };
    (v32, v33, v34, v35)
}
fn closure2(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> bool> {
    Rc::new(move |mut v1: Rc<str>| -> bool {
        let v2: bool = &*v0 == &*v1;
        v2
    })
}
fn method34(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> bool> {
    closure2(v0)
}
fn method35(mut v0: Rc<str>, mut v1: Rc<dyn Fn(Rc<str>) -> bool>, mut v2: Rc<UH0>) -> bool {
    loop {
        match Rc::unwrap_or_clone(v2) {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3;
                let v4: Rc<UH0> = v4;
                let v5: bool = v1(v3);
                if v5 {
                    return true;
                } else {
                    let v6: Rc<dyn Fn(Rc<str>) -> bool> = method34(v0.clone());
                    (v1, v2) = (v6, v4);
                    continue;
                }
            }
            UH0::UH0_Nil => {
                return false;
            }
        }
    }
}
fn method33(mut v0: &Rc<UH0>, mut v1: Rc<UH0>, mut v2: &Rc<str>, mut v3: &Rc<UH0>, mut v4: Rc<UH0>, mut v5: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v4) {
        UH0::UH0_Cons(v6, v7) => {
            let v6: Rc<str> = v6;
            let mut v7: Rc<UH0> = v7;
            let mut v8: Rc<UH0> = method33(v0, v1.clone(), v2, v3, v7, v5);
            let mut v9: bool = &*v6 != "";
            let v13: bool = if v9 {
                let v10: Rc<dyn Fn(Rc<str>) -> bool> = method34(v6.clone());
                let v11: bool = method35(v6.clone(), v10, v1);
                let v12: bool = v11 == false;
                v12
            } else {
                false
            };
            if v13 {
                Rc::new(UH0::UH0_Cons(v6, v8))
            } else {
                v8
            }
        }
        UH0::UH0_Nil => {
            v5
        }
    }
}
fn method36(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
                let v4: Rc<dyn Fn(Rc<str>) -> bool> = method34(v2.clone());
                let v5: bool = method35(v2.clone(), v4, v1.clone());
                let mut v9: Rc<UH0> = if v5 {
                    v1
                } else {
                    let v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let mut v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2, v6));
                    method17(v1, v7)
                };
                (v0, v1) = (v3, v9);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
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
        v18
    } else {
        v0
    };
    let v20: US0 = US0::US0_BearerToken(v1);
    let mut v21: i32 = 1i32;
    let v22: bool = &*v2 == "";
    let v26: Rc<UH0> = if v22 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_list_1(v24, v2)
    };
    let v27: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v28: Rc<UH1> = method4(v26, v27);
    let mut v29: bool = &*v3 == "";
    let v33: Rc<UH0> = if v29 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_list_1(v31, v3)
    };
    let v34: bool = &*v4 == "";
    let v38: Rc<UH0> = if v34 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_list_1(v36, v4)
    };
    let v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v40: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let (mut v41, mut v42, mut v43, mut v44): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = deepen_5(v19, v20, v5, &v6, &v7, v8, v9, v10, v11, v21, v28, v33, v38, v39, v40);
    let v45: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v46: i32 = 0i32;
    let v47: i32 = method16(v45.clone(), v44.clone(), v46);
    let v48: Rc<Vec<Rc<str>>> = Rc::new(v45.borrow().clone());
    let v49: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v48).as_ref().clone()));
    let v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let v51: Rc<str> = Rc::<str>::from((*v49.borrow()).join(&*v50));
    let v52: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v53: Rc<UH0> = method33(&v41, v42, &v43, &v44, v41.clone(), v52);
    let v54: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v55: Rc<UH0> = method36(v53, v54);
    let v56: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v57: i32 = 0i32;
    let v58: i32 = method16(v56.clone(), v55, v57);
    let v59: Rc<Vec<Rc<str>>> = Rc::new(v56.borrow().clone());
    let v60: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v59).as_ref().clone()));
    let v61: Rc<str> = Rc::<str>::from((*v60.borrow()).join(&*v50));
    (v51, v43, v61)
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, bool) -> (Rc<str>, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, bool) -> (Rc<str>, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: i32, mut v6: bool| -> (Rc<str>, Rc<str>, Rc<str>) {
        let mut v7: i32 = 5i32;
        let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v9: bool = false;
        let v10: bool = false;
        traced_refs_0(v0, v1, v2, v3, v4, v7, v8.clone(), v8.clone(), v9, v10, v5, v6)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_refs(v0: &str, v1: &str, v2: &str, v3: &str, v4: &str, v5: i32, v6: bool) -> (Rc<str>, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), Rc::<str>::from(v3), Rc::<str>::from(v4), v5, v6)
}
pub type SpiralShape_652accfc6a8d = Mut0;
