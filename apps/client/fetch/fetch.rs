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
fn method2(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure1() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn split_list_1(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let v2: Option<usize> = v1.find(&*v0);
    let v3: Option<usize> = method2(v2.clone());
    let mut v4: Rc<dyn Fn((usize)) -> i32> = closure1();
    let mut v5: Option<i32> = v3.map(|x| v4(x));
    let v7: i32 = v5.unwrap_or(-1i32);
    let mut v8: i32 = (v0.clone().len() as i32);
    let mut v9: bool = v7 < 0i32;
    let v11: bool = if v9 {
        true
    } else {
        let v10: bool = v8 == 0i32;
        v10
    };
    if v11 {
        let mut v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1.clone(), v12.clone()))
    } else {
        let mut v14: usize = ((0i32) as usize);
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
        let v25: Rc<UH0> = split_list_1(v0.clone(), v24.clone());
        Rc::new(UH0::UH0_Cons(v16.clone(), v25.clone()))
    }
}
fn method3(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH1> = method3(v3.clone(), v1.clone());
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let v6: Option<usize> = v2.find(&*v5);
            let v7: Option<usize> = method2(v6.clone());
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
            Rc::new(UH1::UH1_Cons(v14.clone(), v22.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method6(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method6(v3, v1.clone());
            Rc::new(UH0::UH0_Cons(v2, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method7(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
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
fn posts_path_5(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: bool, mut v5: bool, mut v6: i32, mut v7: bool) -> Rc<str> {
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users/"); } LIT.with(|lit| lit.clone()) };
    let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v0));
    let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/tweets?max_results="); } LIT.with(|lit| lit.clone()) };
    let v11: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v10));
    let mut v12: bool = v1 < 5i32;
    let v13: i32 = if v12 {
        5i32
    } else {
        v1
    };
    let v15: Rc<str> = Rc::<str>::from(format!("{}{}", v11, Rc::<str>::from(format!("{:?}", v13))));
    let v18: Rc<str> = if v7 {
        let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&media.fields=type,alt_text"); } LIT.with(|lit| lit.clone()) };
        v16.clone()
    } else {
        let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v17.clone()
    };
    let v19: bool = v6 > 0i32;
    let v26: Rc<UH0> = if v19 {
        let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
        let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts.author_id"); } LIT.with(|lit| lit.clone()) };
        let v22: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v23: Rc<UH0> = Rc::new(UH0::UH0_Cons(v21.clone(), v22.clone()));
        Rc::new(UH0::UH0_Cons(v20.clone(), v23.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    };
    let v31: Rc<UH0> = if v7 {
        let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("attachments.media_keys"); } LIT.with(|lit| lit.clone()) };
        let v28: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v27.clone(), v28.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    };
    let v32: Rc<UH0> = method6(v26.clone(), v31.clone());
    let v44: Rc<str> = match &*v32 {
        UH0::UH0_Nil => {
            let v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v33.clone()
        }
        _ => {
            let v34: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            let v35: i32 = 0i32;
            let v36: i32 = method7(v34.clone(), v32.clone(), v35);
            let v37: Rc<Vec<Rc<str>>> = Rc::new(v34.borrow().clone());
            let v38: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v37).as_ref().clone()));
            let v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let v40: Rc<str> = Rc::<str>::from((*v38.borrow()).join(&*v39));
            let v41: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&expansions="); } LIT.with(|lit| lit.clone()) };
            let v43: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v41, v40)), v18));
            v43.clone()
        }
    };
    let v45: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&post.fields=created_at,author_id,public_metrics,entities,attachments"); } LIT.with(|lit| lit.clone()) };
    let v47: Rc<str> = Rc::<str>::from(format!("{}{}", v15, Rc::<str>::from(format!("{}{}", v45, v44))));
    let v48: bool = &*v2 == "";
    let v52: Rc<str> = if v48 {
        let v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v49.clone()
    } else {
        let v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&start_time="); } LIT.with(|lit| lit.clone()) };
        let v51: Rc<str> = Rc::<str>::from(format!("{}{}", v50, v2));
        v51.clone()
    };
    let v53: bool = &*v3 == "";
    let v57: Rc<str> = if v53 {
        let v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v54.clone()
    } else {
        let v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&end_time="); } LIT.with(|lit| lit.clone()) };
        let v56: Rc<str> = Rc::<str>::from(format!("{}{}", v55, v3));
        v56.clone()
    };
    let v59: Rc<str> = Rc::<str>::from(format!("{}{}", v47, Rc::<str>::from(format!("{}{}", v52, v57))));
    let v66: Rc<str> = if v4 {
        if v5 {
            let v60: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&exclude=replies,retweets"); } LIT.with(|lit| lit.clone()) };
            v60.clone()
        } else {
            let v61: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&exclude=replies"); } LIT.with(|lit| lit.clone()) };
            v61.clone()
        }
    } else {
        if v5 {
            let v63: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&exclude=retweets"); } LIT.with(|lit| lit.clone()) };
            v63.clone()
        } else {
            let v64: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v64.clone()
        }
    };
    let v67: Rc<str> = Rc::<str>::from(format!("{}{}", v59, v66));
    v67.clone()
}
fn app_reply_8(mut v0: Rc<str>, mut v1: US0, mut v2: Rc<str>) -> US1 {
    let v3: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v2));
    let mut v9: Rc<str> = match &v1 {
        US0::US0_Anonymous => {
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
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
fn describe_failure_9(mut v0: US2) -> Rc<str> {
    match &v0 {
        US2::US2_CursorHalted(v5, v6) => {
            let mut v5: Rc<str> = v5.clone();
            let v6: US3 = v6.clone();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v7));
            let v29: Rc<str> = match &v6 {
                US3::US3_CursorBudget(v19, v20) => {
                    let v19: Rc<str> = v19.clone();
                    let v20: i32 = *v20;
                    let v21: Rc<str> = Rc::<str>::from(format!("{:?}", v20));
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
                    let mut v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v9));
                    let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" after "); } LIT.with(|lit| lit.clone()) };
                    let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v13));
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
            let v1: Rc<str> = v1.clone();
            v1.clone()
        }
    }
}
fn from_12(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let mut v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let mut v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v10.clone());
            continue;
        }
    }
}
fn from_11(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH2>) -> Rc<UH2> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
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
            let v19: Rc<UH0> = from_12(v14.clone(), v17, v18.clone());
            let v20: Rc<UH2> = Rc::new(UH2::UH2_Cons(v9.clone(), v12.clone(), v19.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v20.clone());
            continue;
        }
    }
}
fn taken_13(mut v0: i32, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v1 {
        UH2::UH2_Cons(v2, v3, v4, v5) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH2> = v5.clone();
            let v6: bool = v0 > 0i32;
            if v6 {
                let v7: i32 = v0.wrapping_sub(1i32);
                let mut v8: Rc<UH2> = taken_13(v7, v5.clone());
                Rc::new(UH2::UH2_Cons(v2.clone(), v3.clone(), v4.clone(), v8.clone()))
            } else {
                { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
            }
        }
        _ => {
            { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
        }
    }
}
fn method14(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4, v5) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH2> = v5.clone();
            let v6: Rc<UH2> = method14(v5, v1.clone());
            Rc::new(UH2::UH2_Cons(v2, v3, v4, v6))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn from_15(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let mut v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let mut v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("username"); } LIT.with(|lit| lit.clone()) };
            let v11: serde_json::Value = v6.get(&*v10).cloned().unwrap_or_default();
            let mut v12: Rc<str> = Rc::<str>::from(v11.as_str().unwrap_or(""));
            let v13: Rc<UH1> = Rc::new(UH1::UH1_Cons(v9.clone(), v12.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v13.clone());
            continue;
        }
    }
}
fn method16(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH1> = v4.clone();
            let mut v5: Rc<UH1> = method16(v4, v1.clone());
            let v6: bool = &*v3 != "";
            if v6 {
                Rc::new(UH1::UH1_Cons(v2, v3, v5.clone()))
            } else {
                v5
            }
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method17(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH1> = v4.clone();
            let mut v5: Rc<UH0> = method17(v4, v1.clone());
            Rc::new(UH0::UH0_Cons(v2, v5))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn add_primary_10(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: i32, mut v3: serde_json::Value, mut v4: Rc<str>, mut v5: Rc<UH2>, mut v6: Rc<UH2>, mut v7: Rc<UH0>, mut v8: Rc<UH0>, mut v9: Rc<str>, mut v10: Rc<UH0>) -> (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
    let mut v12: serde_json::Value = v3.get(&*v11).cloned().unwrap_or_default();
    let v13: usize = v12.as_array().map_or(0, Vec::len);
    let mut v14: i32 = ((v13) as i32);
    let v15: i32 = v14.wrapping_sub(1i32);
    let v16: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let v17: Rc<UH2> = from_11(v12.clone(), v15, v16.clone());
    let v18: Rc<UH2> = taken_13(v2, v17.clone());
    let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"role\":\""); } LIT.with(|lit| lit.clone()) };
    let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("primary"); } LIT.with(|lit| lit.clone()) };
    let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"role\":\"primary"); } LIT.with(|lit| lit.clone()) };
    let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\",\"author\":\""); } LIT.with(|lit| lit.clone()) };
    let v24: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v21, v22)), v1));
    let v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\",\"keep\":"); } LIT.with(|lit| lit.clone()) };
    let v26: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v25));
    let v28: Rc<str> = Rc::<str>::from(format!("{}{}", v26, Rc::<str>::from(format!("{:?}", v2))));
    let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"doc\":"); } LIT.with(|lit| lit.clone()) };
    let v31: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v28, v29)), v4));
    let v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
    let v33: Rc<str> = Rc::<str>::from(format!("{}{}", v31, v32));
    let v34: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v35: Rc<UH0> = Rc::new(UH0::UH0_Cons(v33.clone(), v34.clone()));
    let v36: Rc<UH0> = method6(v10.clone(), v35.clone());
    let v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
    let v38: serde_json::Value = v3.get(&*v37).cloned().unwrap_or_default();
    let v39: usize = ((0i32) as usize);
    let v40: serde_json::Value = v38.get(v39).cloned().unwrap_or_default();
    let v41: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
    let v42: serde_json::Value = v40.get(&*v41).cloned().unwrap_or_default();
    let v43: Rc<str> = Rc::<str>::from(v42.as_str().unwrap_or(""));
    let v44: bool = &*v43 != "";
    let v48: Rc<str> = if v44 {
        v43.clone()
    } else {
        let v45: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
        let v46: serde_json::Value = v40.get(&*v45).cloned().unwrap_or_default();
        let v47: Rc<str> = Rc::<str>::from(v46.as_str().unwrap_or(""));
        v47.clone()
    };
    let (mut v110, mut v111, mut v112, mut v113, mut v114, mut v115): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &*v18 {
        UH2::UH2_Nil => {
            let v49: bool = &*v48 != "";
            if v49 {
                let v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("skipped @"); } LIT.with(|lit| lit.clone()) };
                let v51: Rc<str> = Rc::<str>::from(format!("{}{}", v50, v1));
                let v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                let v54: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v51, v52)), v48));
                let v55: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let v56: Rc<UH0> = Rc::new(UH0::UH0_Cons(v54.clone(), v55.clone()));
                let v57: Rc<UH0> = method6(v8.clone(), v56.clone());
                (v5.clone(), v6.clone(), v7.clone(), v57.clone(), v9.clone(), v36.clone())
            } else {
                let v58: Rc<UH2> = method14(v18.clone(), v5.clone());
                let v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("includes"); } LIT.with(|lit| lit.clone()) };
                let v60: serde_json::Value = v3.get(&*v59).cloned().unwrap_or_default();
                let v61: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts"); } LIT.with(|lit| lit.clone()) };
                let mut v62: serde_json::Value = v60.get(&*v61).cloned().unwrap_or_default();
                let v63: usize = v62.as_array().map_or(0, Vec::len);
                let v64: i32 = ((v63) as i32);
                let v65: i32 = v64.wrapping_sub(1i32);
                let v66: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                let v67: Rc<UH2> = from_11(v62.clone(), v65, v66.clone());
                let v68: Rc<UH2> = method14(v6.clone(), v67.clone());
                let v69: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("users"); } LIT.with(|lit| lit.clone()) };
                let mut v70: serde_json::Value = v60.get(&*v69).cloned().unwrap_or_default();
                let v71: usize = v70.as_array().map_or(0, Vec::len);
                let v72: i32 = ((v71) as i32);
                let v73: i32 = v72.wrapping_sub(1i32);
                let v74: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                let v75: Rc<UH1> = from_15(v70.clone(), v73, v74.clone());
                let v76: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                let v77: Rc<UH1> = method16(v75.clone(), v76.clone());
                let v78: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let v79: Rc<UH0> = method17(v77.clone(), v78.clone());
                let v80: Rc<UH0> = method6(v7.clone(), v79.clone());
                (v58.clone(), v68.clone(), v80.clone(), v8.clone(), v9.clone(), v36.clone())
            }
        }
        _ => {
            let v87: Rc<UH2> = method14(v18.clone(), v5.clone());
            let v88: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("includes"); } LIT.with(|lit| lit.clone()) };
            let v89: serde_json::Value = v3.get(&*v88).cloned().unwrap_or_default();
            let v90: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts"); } LIT.with(|lit| lit.clone()) };
            let mut v91: serde_json::Value = v89.get(&*v90).cloned().unwrap_or_default();
            let v92: usize = v91.as_array().map_or(0, Vec::len);
            let v93: i32 = ((v92) as i32);
            let v94: i32 = v93.wrapping_sub(1i32);
            let v95: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let v96: Rc<UH2> = from_11(v91.clone(), v94, v95.clone());
            let v97: Rc<UH2> = method14(v6.clone(), v96.clone());
            let v98: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("users"); } LIT.with(|lit| lit.clone()) };
            let mut v99: serde_json::Value = v89.get(&*v98).cloned().unwrap_or_default();
            let v100: usize = v99.as_array().map_or(0, Vec::len);
            let v101: i32 = ((v100) as i32);
            let v102: i32 = v101.wrapping_sub(1i32);
            let v103: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v104: Rc<UH1> = from_15(v99.clone(), v102, v103.clone());
            let v105: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v106: Rc<UH1> = method16(v104.clone(), v105.clone());
            let v107: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v108: Rc<UH0> = method17(v106.clone(), v107.clone());
            let v109: Rc<UH0> = method6(v7.clone(), v108.clone());
            (v87.clone(), v97.clone(), v109.clone(), v8.clone(), v9.clone(), v36.clone())
        }
    };
    (v110.clone(), v111.clone(), v112.clone(), v113.clone(), v114.clone(), v115.clone())
}
fn gather_4(mut v0: Rc<str>, mut v1: US0, mut v2: i32, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: bool, mut v6: bool, mut v7: i32, mut v8: bool, mut v9: Rc<UH1>, mut v10: Rc<UH2>, mut v11: Rc<UH2>, mut v12: Rc<UH0>, mut v13: Rc<UH0>, mut v14: Rc<str>, mut v15: Rc<UH0>) -> (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let (mut v71, mut v72, mut v73, mut v74, mut v75, mut v76): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &*v9 {
        UH1::UH1_Nil => {
            (v10.clone(), v11.clone(), v12.clone(), v13.clone(), v14.clone(), v15.clone())
        }
        _ => {
            let (mut v65, mut v66, mut v67, mut v68, mut v69, mut v70): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &*v9 {
                UH1::UH1_Cons(v16, v17, v18) => {
                    let v16: Rc<str> = v16.clone();
                    let v17: Rc<str> = v17.clone();
                    let v18: Rc<UH1> = v18.clone();
                    let v19: Rc<str> = posts_path_5(v16.clone(), v2, v3.clone(), v4.clone(), v5, v6, v7, v8);
                    let v20: US1 = app_reply_8(v0.clone(), v1.clone(), v19);
                    let v34: US4 = match &v20 {
                        US1::US1_Error(v30) => {
                            let v30: US2 = v30.clone();
                            let v31: Rc<str> = describe_failure_9(v30);
                            US4::US4_Error(v10.clone(), v11.clone(), v12.clone(), v13.clone(), v31, v15.clone())
                        }
                        US1::US1_Ok(v21, v22) => {
                            let v21: serde_json::Value = v21.clone();
                            let v22: Rc<str> = v22.clone();
                            let (mut v23, mut v24, mut v25, mut v26, mut v27, mut v28): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = add_primary_10(v16, v17, v2, v21, v22, v10, v11, v12, v13, v14, v15);
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
                            gather_4(v0, v1, v2, v3, v4, v5, v6, v7, v8, v18, v35, v36, v37, v38, v39, v40)
                        }
                        _ => {
                            let (mut v53, mut v54, mut v55, mut v56, mut v57, mut v58): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &v34 {
                                US4::US4_Error(v47, v48, v49, v50, v51, v52) => {
                                    let v47: Rc<UH2> = v47.clone();
                                    let v48: Rc<UH2> = v48.clone();
                                    let v49: Rc<UH0> = v49.clone();
                                    let v50: Rc<UH0> = v50.clone();
                                    let v51: Rc<str> = v51.clone();
                                    let v52: Rc<UH0> = v52.clone();
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
fn method18(mut v0: Rc<UH2>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4, v5) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH2> = v5.clone();
            let v6: Rc<UH0> = method18(v5, v1.clone());
            method6(v4, v6)
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn method19(mut v0: Rc<UH2>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4, v5) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH2> = v5.clone();
            let v6: Rc<UH0> = method19(v5, v1.clone());
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
        v16.clone()
    } else {
        v0.clone()
    };
    let v18: US0 = US0::US0_BearerToken(v1.clone());
    let v19: bool = &*v2 == "";
    let v23: Rc<UH0> = if v19 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
        split_list_1(v21.clone(), v2.clone())
    };
    let v24: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v25: Rc<UH1> = method3(v23.clone(), v24.clone());
    let v26: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let v27: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let v28: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v29: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v31: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let (mut v32, mut v33, mut v34, mut v35, mut v36, mut v37): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = gather_4(v17.clone(), v18.clone(), v3, v4.clone(), v5.clone(), v6, v7, v8, v9, v25.clone(), v26.clone(), v27.clone(), v28.clone(), v29.clone(), v30.clone(), v31.clone());
    let v38: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v39: i32 = 0i32;
    let v40: i32 = method7(v38.clone(), v37.clone(), v39);
    let v41: Rc<Vec<Rc<str>>> = Rc::new(v38.borrow().clone());
    let v42: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v41).as_ref().clone()));
    let v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let v44: Rc<str> = Rc::<str>::from((*v42.borrow()).join(&*v43));
    let v45: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v46: i32 = 0i32;
    let v47: i32 = method7(v45.clone(), v35.clone(), v46);
    let v48: Rc<Vec<Rc<str>>> = Rc::new(v45.borrow().clone());
    let v49: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v48).as_ref().clone()));
    let v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let v51: Rc<str> = Rc::<str>::from((*v49.borrow()).join(&*v50));
    let v52: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v53: Rc<UH0> = method18(v32.clone(), v52.clone());
    let v54: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v55: i32 = 0i32;
    let v56: i32 = method7(v54.clone(), v53.clone(), v55);
    let v57: Rc<Vec<Rc<str>>> = Rc::new(v54.borrow().clone());
    let v58: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v57).as_ref().clone()));
    let v59: Rc<str> = Rc::<str>::from((*v58.borrow()).join(&*v43));
    let v60: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v61: Rc<UH0> = method19(v33.clone(), v60.clone());
    let mut v62: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v63: i32 = 0i32;
    let v64: i32 = method7(v62.clone(), v61.clone(), v63);
    let v65: Rc<Vec<Rc<str>>> = Rc::new(v62.borrow().clone());
    let v66: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v65).as_ref().clone()));
    let v67: Rc<str> = Rc::<str>::from((*v66.borrow()).join(&*v43));
    let v68: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v69: i32 = 0i32;
    let mut v70: i32 = method7(v68.clone(), v34.clone(), v69);
    let v71: Rc<Vec<Rc<str>>> = Rc::new(v68.borrow().clone());
    let v72: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v71).as_ref().clone()));
    let v73: Rc<str> = Rc::<str>::from((*v72.borrow()).join(&*v43));
    (v44.clone(), v51.clone(), v36.clone(), v59.clone(), v67.clone(), v73.clone())
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) -> (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) -> (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: i32, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: bool, mut v7: bool, mut v8: i32, mut v9: bool| -> (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) {
        fetched_0(v0.clone(), v1.clone(), v2.clone(), v3, v4.clone(), v5.clone(), v6, v7, v8, v9)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_fetch(v0: &str, v1: &str, v2: &str, v3: i32, v4: &str, v5: &str, v6: bool, v7: bool, v8: i32, v9: bool) -> (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), v3, Rc::<str>::from(v4), Rc::<str>::from(v5), v6, v7, v8, v9)
}
