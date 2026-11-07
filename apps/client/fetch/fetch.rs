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
    UH1_Cons(Rc<str>, Rc<str>, Rc<UH1>),
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(Rc<str>, Rc<str>, Rc<UH0>, Rc<UH2>),
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
enum US4 {
    US4_Ok(Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>),
    US4_Error(Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>),
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
        let v7: i32 = (v6.clone().borrow().len() as i32);
        let mut v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v9: Rc<RefCell<Mut0>> = Rc::new(RefCell::new(Mut0 { l0: 0i32, l1: v8 }));
        while method3(v7, &v9) {
            let v11: i32 = v9.borrow().l0;
            let mut v12: Rc<UH0> = v9.borrow().l1.clone();
            let v13: Rc<str> = v6.borrow()[v11 as usize].clone();
            let mut v14: i32 = v11.wrapping_add(1i32);
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
fn method5(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure1() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method4(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH0> = v3;
            let v4: Rc<UH1> = method4(v3, v1);
            let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let v6: Option<usize> = v2.find(&*v5);
            let v7: Option<usize> = method5(v6);
            let mut v8: Rc<dyn Fn((usize)) -> i32> = closure1();
            let mut v9: Option<i32> = v7.map(|x| v8(x));
            let v11: i32 = v9.unwrap_or(-1i32);
            let mut v12: usize = ((0i32) as usize);
            let v13: usize = ((v11) as usize);
            let mut v14: Rc<str> = Rc::<str>::from(&(v2)[v12..v13]);
            let v15: i32 = v11.wrapping_add(1i32);
            let v16: i32 = (v2.clone().len() as i32);
            let v17: i32 = v16.wrapping_sub(v11);
            let v18: i32 = v17.wrapping_sub(1i32);
            let v19: usize = ((v15) as usize);
            let v20: i32 = v15.wrapping_add(v18);
            let v21: usize = ((v20) as usize);
            let v22: Rc<str> = Rc::<str>::from(&(v2)[v19..v21]);
            Rc::new(UH1::UH1_Cons(v14, v22, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method8(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH0> = v3;
            let v4: Rc<UH0> = method8(v3, v1);
            Rc::new(UH0::UH0_Cons(v2, v4))
        }
        UH0::UH0_Nil => {
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
fn posts_path_7(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: bool, mut v5: bool, mut v6: i32, mut v7: bool) -> Rc<str> {
    let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users/"); } LIT.with(|lit| lit.clone()) }, v0));
    let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/tweets?max_results="); } LIT.with(|lit| lit.clone()) }));
    let v10: bool = v1 < 5i32;
    let v11: i32 = if v10 {
        5i32
    } else {
        v1
    };
    let mut v12: Rc<str> = Rc::<str>::from((v11).to_string());
    let v13: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v12));
    let v16: Rc<str> = if v7 {
        let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&media.fields=type,alt_text"); } LIT.with(|lit| lit.clone()) };
        v14
    } else {
        let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v15
    };
    let v17: bool = v6 > 0i32;
    let v24: Rc<UH0> = if v17 {
        let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
        let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts.author_id"); } LIT.with(|lit| lit.clone()) };
        let v20: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v21: Rc<UH0> = Rc::new(UH0::UH0_Cons(v19, v20));
        Rc::new(UH0::UH0_Cons(v18, v21))
    } else {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    };
    let v29: Rc<UH0> = if v7 {
        let v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("attachments.media_keys"); } LIT.with(|lit| lit.clone()) };
        let v26: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v25, v26))
    } else {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    };
    let v30: Rc<UH0> = method8(v24, v29);
    let v41: Rc<str> = match &*v30 {
        UH0::UH0_Nil => {
            let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v31
        }
        _ => {
            let v32: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            let v33: i32 = 0i32;
            let v34: i32 = method9(v32.clone(), v30, v33);
            let v35: Rc<Vec<Rc<str>>> = Rc::new(v32.borrow().clone());
            let v36: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v35).as_ref().clone()));
            let v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let v38: Rc<str> = Rc::<str>::from((*v36.borrow()).join(&*v37));
            let v39: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&expansions="); } LIT.with(|lit| lit.clone()) }, v38));
            let v40: Rc<str> = Rc::<str>::from(format!("{}{}", v39, v16));
            v40
        }
    };
    let v42: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&post.fields=created_at,author_id,public_metrics,entities,attachments"); } LIT.with(|lit| lit.clone()) }, v41));
    let v43: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v42));
    let v44: bool = &*v2 == "";
    let v47: Rc<str> = if v44 {
        let v45: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v45
    } else {
        let v46: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&start_time="); } LIT.with(|lit| lit.clone()) }, v2));
        v46
    };
    let v48: bool = &*v3 == "";
    let v51: Rc<str> = if v48 {
        let v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v49
    } else {
        let v50: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&end_time="); } LIT.with(|lit| lit.clone()) }, v3));
        v50
    };
    let mut v52: Rc<str> = Rc::<str>::from(format!("{}{}", v47, v51));
    let v53: Rc<str> = Rc::<str>::from(format!("{}{}", v43, v52));
    let mut v60: Rc<str> = if v4 {
        if v5 {
            let v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&exclude=replies,retweets"); } LIT.with(|lit| lit.clone()) };
            v54
        } else {
            let v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&exclude=replies"); } LIT.with(|lit| lit.clone()) };
            v55
        }
    } else {
        if v5 {
            let v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&exclude=retweets"); } LIT.with(|lit| lit.clone()) };
            v57
        } else {
            let v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v58
        }
    };
    let v61: Rc<str> = Rc::<str>::from(format!("{}{}", v53, v60));
    v61
}
fn app_reply_10(mut v0: Rc<str>, mut v1: US0, mut v2: Rc<str>) -> US1 {
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
fn describe_failure_11(mut v0: US2) -> Rc<str> {
    match v0 {
        US2::US2_CursorHalted(v4, v5) => {
            let v4: Rc<str> = v4;
            let v5: US3 = v5;
            let v6: Rc<str> = Rc::<str>::from(format!("{}{}", v4, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) }));
            let v21: Rc<str> = match v5 {
                US3::US3_CursorBudget(v14, v15) => {
                    let mut v14: Rc<str> = v14;
                    let v15: i32 = v15;
                    let v16: Rc<str> = Rc::<str>::from((v15).to_string());
                    let v17: Rc<str> = Rc::<str>::from(format!("{}{}", v16, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" pages"); } LIT.with(|lit| lit.clone()) }));
                    let v18: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("stopped after "); } LIT.with(|lit| lit.clone()) }, v17));
                    let v19: Rc<str> = Rc::<str>::from(format!("{}{}", v18, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" (page budget)"); } LIT.with(|lit| lit.clone()) }));
                    v19
                }
                US3::US3_CursorRepeated(v7, v8) => {
                    let v7: Rc<str> = v7;
                    let mut v8: i32 = v8;
                    let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("the API repeated cursor "); } LIT.with(|lit| lit.clone()) }, v7));
                    let v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" after "); } LIT.with(|lit| lit.clone()) }));
                    let v11: Rc<str> = Rc::<str>::from((v8).to_string());
                    let mut v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" pages"); } LIT.with(|lit| lit.clone()) }));
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
fn from_14(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2;
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let mut v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let mut v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9, v2));
            (v1, v2) = (v4, v10);
            continue;
        }
    }
}
fn from_13(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH2>) -> Rc<UH2> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2;
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let mut v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let mut v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("author_id"); } LIT.with(|lit| lit.clone()) };
            let v11: serde_json::Value = v6.get(&*v10).cloned().unwrap_or_default();
            let mut v12: Rc<str> = Rc::<str>::from(v11.as_str().unwrap_or(""));
            let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
            let mut v14: serde_json::Value = v6.get(&*v13).cloned().unwrap_or_default();
            let v15: usize = v14.as_array().map_or(0, Vec::len);
            let v16: i32 = ((v15) as i32);
            let v17: i32 = v16.wrapping_sub(1i32);
            let v18: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v19: Rc<UH0> = from_14(v14, v17, v18);
            let v20: Rc<UH2> = Rc::new(UH2::UH2_Cons(v9, v12, v19, v2));
            (v1, v2) = (v4, v20);
            continue;
        }
    }
}
fn taken_15(mut v0: i32, mut v1: Rc<UH2>) -> Rc<UH2> {
    match Rc::unwrap_or_clone(v1) {
        UH2::UH2_Cons(v2, v3, v4, v5) => {
            let v2: Rc<str> = v2;
            let v3: Rc<str> = v3;
            let v4: Rc<UH0> = v4;
            let v5: Rc<UH2> = v5;
            let v6: bool = v0 > 0i32;
            if v6 {
                let v7: i32 = v0.wrapping_sub(1i32);
                let mut v8: Rc<UH2> = taken_15(v7, v5);
                Rc::new(UH2::UH2_Cons(v2, v3, v4, v8))
            } else {
                { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
            }
        }
        _ => {
            { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
        }
    }
}
fn method16(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match Rc::unwrap_or_clone(v0) {
        UH2::UH2_Cons(v2, v3, v4, v5) => {
            let v2: Rc<str> = v2;
            let v3: Rc<str> = v3;
            let v4: Rc<UH0> = v4;
            let v5: Rc<UH2> = v5;
            let v6: Rc<UH2> = method16(v5, v1);
            Rc::new(UH2::UH2_Cons(v2, v3, v4, v6))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn from_17(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2;
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let mut v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let mut v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("username"); } LIT.with(|lit| lit.clone()) };
            let v11: serde_json::Value = v6.get(&*v10).cloned().unwrap_or_default();
            let mut v12: Rc<str> = Rc::<str>::from(v11.as_str().unwrap_or(""));
            let v13: Rc<UH1> = Rc::new(UH1::UH1_Cons(v9, v12, v2));
            (v1, v2) = (v4, v13);
            continue;
        }
    }
}
fn method18(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2;
            let v3: Rc<str> = v3;
            let v4: Rc<UH1> = v4;
            let v5: Rc<UH1> = method18(v4, v1);
            let v6: bool = &*v3 != "";
            if v6 {
                Rc::new(UH1::UH1_Cons(v2, v3, v5))
            } else {
                v5
            }
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method19(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2;
            let v3: Rc<str> = v3;
            let v4: Rc<UH1> = v4;
            let v5: Rc<UH0> = method19(v4, v1);
            Rc::new(UH0::UH0_Cons(v2, v5))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn add_primary_12(mut v0: &Rc<str>, mut v1: Rc<str>, mut v2: i32, mut v3: serde_json::Value, mut v4: Rc<str>, mut v5: Rc<UH2>, mut v6: Rc<UH2>, mut v7: Rc<UH0>, mut v8: Rc<UH0>, mut v9: Rc<str>, mut v10: Rc<UH0>) -> (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
    let mut v12: serde_json::Value = v3.get(&*v11).cloned().unwrap_or_default();
    let v13: usize = v12.as_array().map_or(0, Vec::len);
    let mut v14: i32 = ((v13) as i32);
    let v15: i32 = v14.wrapping_sub(1i32);
    let v16: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let v17: Rc<UH2> = from_13(v12, v15, v16);
    let v18: Rc<UH2> = taken_15(v2, v17);
    let v19: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"role\":\"primary\",\"author\":\""); } LIT.with(|lit| lit.clone()) }, v1.clone()));
    let v20: Rc<str> = Rc::<str>::from(format!("{}{}", v19, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\",\"keep\":"); } LIT.with(|lit| lit.clone()) }));
    let v21: Rc<str> = Rc::<str>::from((v2).to_string());
    let v22: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v21));
    let v23: Rc<str> = Rc::<str>::from(format!("{}{}", v22, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"doc\":"); } LIT.with(|lit| lit.clone()) }));
    let v24: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v4));
    let v25: Rc<str> = Rc::<str>::from(format!("{}{}", v24, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) }));
    let v26: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v27: Rc<UH0> = Rc::new(UH0::UH0_Cons(v25, v26));
    let v28: Rc<UH0> = method8(v10, v27);
    let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
    let v30: serde_json::Value = v3.get(&*v29).cloned().unwrap_or_default();
    let v31: usize = ((0i32) as usize);
    let v32: serde_json::Value = v30.get(v31).cloned().unwrap_or_default();
    let v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
    let v34: serde_json::Value = v32.get(&*v33).cloned().unwrap_or_default();
    let v35: Rc<str> = Rc::<str>::from(v34.as_str().unwrap_or(""));
    let v36: bool = &*v35 != "";
    let v40: Rc<str> = if v36 {
        v35
    } else {
        let v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
        let v38: serde_json::Value = v32.get(&*v37).cloned().unwrap_or_default();
        let v39: Rc<str> = Rc::<str>::from(v38.as_str().unwrap_or(""));
        v39
    };
    let (mut v100, mut v101, mut v102, mut v103, mut v104, mut v105): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &*v18 {
        UH2::UH2_Nil => {
            let v41: bool = &*v40 != "";
            if v41 {
                let v42: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("skipped @"); } LIT.with(|lit| lit.clone()) }, v1));
                let v43: Rc<str> = Rc::<str>::from(format!("{}{}", v42, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) }));
                let v44: Rc<str> = Rc::<str>::from(format!("{}{}", v43, v40));
                let v45: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let v46: Rc<UH0> = Rc::new(UH0::UH0_Cons(v44, v45));
                let v47: Rc<UH0> = method8(v8, v46);
                (v5, v6, v7, v47, v9, v28)
            } else {
                let v48: Rc<UH2> = method16(v18, v5);
                let v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("includes"); } LIT.with(|lit| lit.clone()) };
                let v50: serde_json::Value = v3.get(&*v49).cloned().unwrap_or_default();
                let v51: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts"); } LIT.with(|lit| lit.clone()) };
                let mut v52: serde_json::Value = v50.get(&*v51).cloned().unwrap_or_default();
                let v53: usize = v52.as_array().map_or(0, Vec::len);
                let v54: i32 = ((v53) as i32);
                let v55: i32 = v54.wrapping_sub(1i32);
                let v56: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                let v57: Rc<UH2> = from_13(v52, v55, v56);
                let v58: Rc<UH2> = method16(v6, v57);
                let v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("users"); } LIT.with(|lit| lit.clone()) };
                let mut v60: serde_json::Value = v50.get(&*v59).cloned().unwrap_or_default();
                let v61: usize = v60.as_array().map_or(0, Vec::len);
                let v62: i32 = ((v61) as i32);
                let v63: i32 = v62.wrapping_sub(1i32);
                let v64: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                let v65: Rc<UH1> = from_17(v60, v63, v64);
                let v66: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                let v67: Rc<UH1> = method18(v65, v66);
                let v68: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let v69: Rc<UH0> = method19(v67, v68);
                let v70: Rc<UH0> = method8(v7, v69);
                (v48, v58, v70, v8, v9, v28)
            }
        }
        _ => {
            let v77: Rc<UH2> = method16(v18, v5);
            let v78: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("includes"); } LIT.with(|lit| lit.clone()) };
            let v79: serde_json::Value = v3.get(&*v78).cloned().unwrap_or_default();
            let v80: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts"); } LIT.with(|lit| lit.clone()) };
            let mut v81: serde_json::Value = v79.get(&*v80).cloned().unwrap_or_default();
            let v82: usize = v81.as_array().map_or(0, Vec::len);
            let v83: i32 = ((v82) as i32);
            let v84: i32 = v83.wrapping_sub(1i32);
            let v85: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let v86: Rc<UH2> = from_13(v81, v84, v85);
            let v87: Rc<UH2> = method16(v6, v86);
            let v88: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("users"); } LIT.with(|lit| lit.clone()) };
            let mut v89: serde_json::Value = v79.get(&*v88).cloned().unwrap_or_default();
            let v90: usize = v89.as_array().map_or(0, Vec::len);
            let v91: i32 = ((v90) as i32);
            let v92: i32 = v91.wrapping_sub(1i32);
            let v93: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v94: Rc<UH1> = from_17(v89, v92, v93);
            let v95: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v96: Rc<UH1> = method18(v94, v95);
            let v97: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v98: Rc<UH0> = method19(v96, v97);
            let v99: Rc<UH0> = method8(v7, v98);
            (v77, v87, v99, v8, v9, v28)
        }
    };
    (v100, v101, v102, v103, v104, v105)
}
fn gather_6(mut v0: Rc<str>, mut v1: US0, mut v2: i32, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: bool, mut v6: bool, mut v7: i32, mut v8: bool, mut v9: Rc<UH1>, mut v10: Rc<UH2>, mut v11: Rc<UH2>, mut v12: Rc<UH0>, mut v13: Rc<UH0>, mut v14: Rc<str>, mut v15: Rc<UH0>) -> (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let (mut v71, mut v72, mut v73, mut v74, mut v75, mut v76): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &*v9 {
        UH1::UH1_Nil => {
            (v10, v11, v12, v13, v14, v15)
        }
        _ => {
            let (mut v65, mut v66, mut v67, mut v68, mut v69, mut v70): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match Rc::unwrap_or_clone(v9) {
                UH1::UH1_Cons(v16, v17, v18) => {
                    let v16: Rc<str> = v16;
                    let v17: Rc<str> = v17;
                    let v18: Rc<UH1> = v18;
                    let v19: Rc<str> = posts_path_7(v16.clone(), v2, v3.clone(), v4.clone(), v5, v6, v7, v8);
                    let v20: US1 = app_reply_10(v0.clone(), v1.clone(), v19);
                    let v34: US4 = match v20 {
                        US1::US1_Error(v30) => {
                            let v30: US2 = v30;
                            let v31: Rc<str> = describe_failure_11(v30);
                            US4::US4_Error(v10, v11, v12, v13, v31, v15)
                        }
                        US1::US1_Ok(v21, v22) => {
                            let v21: serde_json::Value = v21;
                            let v22: Rc<str> = v22;
                            let (mut v23, mut v24, mut v25, mut v26, mut v27, mut v28): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = add_primary_12(&v16, v17, v2, v21, v22, v10, v11, v12, v13, v14, v15);
                            US4::US4_Ok(v23, v24, v25, v26, v27, v28)
                        }
                    };
                    match &v34 {
                        US4::US4_Ok(v35, v36, v37, v38, v39, v40) => {
                            let v35: Rc<UH2> = v35.clone();
                            let v36: Rc<UH2> = v36.clone();
                            let v37: Rc<UH0> = v37.clone();
                            let v38: Rc<UH0> = v38.clone();
                            let v39: Rc<str> = v39.clone();
                            let v40: Rc<UH0> = v40.clone();
                            gather_6(v0, v1, v2, v3, v4, v5, v6, v7, v8, v18, v35, v36, v37, v38, v39, v40)
                        }
                        _ => {
                            let (mut v53, mut v54, mut v55, mut v56, mut v57, mut v58): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match v34 {
                                US4::US4_Error(v47, v48, v49, v50, v51, v52) => {
                                    let v47: Rc<UH2> = v47;
                                    let v48: Rc<UH2> = v48;
                                    let v49: Rc<UH0> = v49;
                                    let v50: Rc<UH0> = v50;
                                    let v51: Rc<str> = v51;
                                    let mut v52: Rc<UH0> = v52;
                                    (v47, v48, v49, v50, v51, v52)
                                }
                                _ => unreachable!(),
                            };
                            (v53, v54, v55, v56, v57, v58)
                        }
                    }
                }
                _ => unreachable!(),
            };
            (v65, v66, v67, v68, v69, v70)
        }
    };
    (v71, v72, v73, v74, v75, v76)
}
fn method20(mut v0: Rc<UH2>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH2::UH2_Cons(v2, v3, v4, v5) => {
            let v2: Rc<str> = v2;
            let v3: Rc<str> = v3;
            let v4: Rc<UH0> = v4;
            let v5: Rc<UH2> = v5;
            let v6: Rc<UH0> = method20(v5, v1);
            method8(v4, v6)
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn method21(mut v0: Rc<UH2>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH2::UH2_Cons(v2, v3, v4, v5) => {
            let v2: Rc<str> = v2;
            let v3: Rc<str> = v3;
            let v4: Rc<UH0> = v4;
            let v5: Rc<UH2> = v5;
            let v6: Rc<UH0> = method21(v5, v1);
            Rc::new(UH0::UH0_Cons(v3, v6))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn fetched_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: i32, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: bool, mut v7: bool, mut v8: i32, mut v9: bool) -> (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) {
    let v10: i32 = (v0.clone().len() as i32);
    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let mut v12: bool = v0.ends_with(&*v11);
    let v17: Rc<str> = if v12 {
        let v13: i32 = v10.wrapping_sub(1i32);
        let mut v14: usize = ((0i32) as usize);
        let v15: usize = ((v13) as usize);
        let v16: Rc<str> = Rc::<str>::from(&(v0)[v14..v15]);
        v16
    } else {
        v0
    };
    let v18: US0 = US0::US0_BearerToken(v1);
    let v19: bool = &*v2 == "";
    let v23: Rc<UH0> = if v19 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
        split_list_1(v21, v2)
    };
    let v24: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v25: Rc<UH1> = method4(v23, v24);
    let v26: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let v27: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let v28: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v29: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v31: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let (mut v32, mut v33, mut v34, mut v35, mut v36, mut v37): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = gather_6(v17, v18, v3, v4, v5, v6, v7, v8, v9, v25, v26, v27, v28, v29, v30, v31);
    let v38: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v39: i32 = 0i32;
    let v40: i32 = method9(v38.clone(), v37, v39);
    let v41: Rc<Vec<Rc<str>>> = Rc::new(v38.borrow().clone());
    let v42: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v41).as_ref().clone()));
    let v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let v44: Rc<str> = Rc::<str>::from((*v42.borrow()).join(&*v43));
    let v45: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v46: i32 = 0i32;
    let v47: i32 = method9(v45.clone(), v35, v46);
    let v48: Rc<Vec<Rc<str>>> = Rc::new(v45.borrow().clone());
    let v49: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v48).as_ref().clone()));
    let v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let v51: Rc<str> = Rc::<str>::from((*v49.borrow()).join(&*v50));
    let mut v52: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v53: Rc<UH0> = method20(v32, v52);
    let v54: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v55: i32 = 0i32;
    let v56: i32 = method9(v54.clone(), v53, v55);
    let v57: Rc<Vec<Rc<str>>> = Rc::new(v54.borrow().clone());
    let v58: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v57).as_ref().clone()));
    let v59: Rc<str> = Rc::<str>::from((*v58.borrow()).join(&*v43));
    let mut v60: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v61: Rc<UH0> = method21(v33, v60);
    let v62: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v63: i32 = 0i32;
    let v64: i32 = method9(v62.clone(), v61, v63);
    let v65: Rc<Vec<Rc<str>>> = Rc::new(v62.borrow().clone());
    let v66: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v65).as_ref().clone()));
    let v67: Rc<str> = Rc::<str>::from((*v66.borrow()).join(&*v43));
    let v68: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v69: i32 = 0i32;
    let v70: i32 = method9(v68.clone(), v34, v69);
    let v71: Rc<Vec<Rc<str>>> = Rc::new(v68.borrow().clone());
    let v72: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v71).as_ref().clone()));
    let v73: Rc<str> = Rc::<str>::from((*v72.borrow()).join(&*v43));
    (v44, v51, v36, v59, v67, v73)
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) -> (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) -> (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: i32, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: bool, mut v7: bool, mut v8: i32, mut v9: bool| -> (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) {
        fetched_0(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_fetch(v0: &str, v1: &str, v2: &str, v3: i32, v4: &str, v5: &str, v6: bool, v7: bool, v8: i32, v9: bool) -> (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), v3, Rc::<str>::from(v4), Rc::<str>::from(v5), v6, v7, v8, v9)
}
pub type SpiralShape_652accfc6a8d = Mut0;
