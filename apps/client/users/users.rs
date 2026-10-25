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
    let mut v7: Rc<str> = match &v1 {
        US0::US0_BearerToken(v4) => {
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) };
            let v6: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v4));
            v6
        }
    };
    let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("GET"); } LIT.with(|lit| lit.clone()) };
    let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v10, mut v11): (i32, Rc<str>) = xc_net::xc_send(&*v8, &*v3, &*v7, &*v9);
    let (mut v12, mut v13): (i32, Rc<str>) = xc_api::xc_classified(&*v2, v10, &*v11);
    let v14: bool = v12 == 0i32;
    if v14 {
        let v15: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v13).unwrap_or_default();
        US4::US4_Ok(v15, v13.clone())
    } else {
        let v17: US2 = US2::US2_Reported(v13);
        US4::US4_Error(v17)
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
fn go_6(mut v0: i32, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v1 {
        UH0::UH0_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: bool = v0 > 0i32;
            if v5 {
                let v6: i32 = v0.wrapping_sub(1i32);
                let mut v7: Rc<UH0> = go_6(v6, v4);
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
                let mut v24: Rc<str> = v24.clone();
                let v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
                let mut v26: serde_json::Value = v23.get(&*v25).cloned().unwrap_or_default();
                let v27: usize = v26.as_array().map_or(0, Vec::len);
                let v28: i32 = ((v27) as i32);
                let v29: i32 = v28.wrapping_sub(1i32);
                let v30: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let mut v31: Rc<UH0> = from_4(v26.clone(), v29, v30.clone());
                let v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("meta"); } LIT.with(|lit| lit.clone()) };
                let v33: serde_json::Value = v23.get(&*v32).cloned().unwrap_or_default();
                let v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("next_token"); } LIT.with(|lit| lit.clone()) };
                let v35: serde_json::Value = v33.get(&*v34).cloned().unwrap_or_default();
                let v36: Rc<str> = Rc::<str>::from(v35.as_str().unwrap_or(""));
                let v37: Rc<UH0> = method5(v5.clone(), v31.clone());
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
                    let v44: Rc<UH0> = go_6(v3, v37.clone());
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
                    let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("stopped after "); } LIT.with(|lit| lit.clone()) };
                    let v25: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v23));
                    let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" (page budget)"); } LIT.with(|lit| lit.clone()) };
                    let v27: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v26));
                    v27
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
                    v18
                }
            };
            let v30: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v29));
            v30
        }
        US2::US2_NoSuchAccount(v2) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
            let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v2));
            v4
        }
        US2::US2_Reported(v1) => {
            let v1: Rc<str> = v1.clone();
            v1
        }
    }
}
fn method8(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH1> = method8(v4, v1.clone());
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v2, v6)), v3));
            Rc::new(UH1::UH1_Cons(v8, v5))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method9(mut v0: Rc<UH1>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH1::UH1_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH1> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method9(v4, v1.clone(), v2.clone());
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v3, v6)), v5));
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            (v8, v9)
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v0 {
                UH1::UH1_Nil => {
                    (v1, v2)
                }
                _ => unreachable!(),
            };
            (v10, v11)
        }
    };
    (v12, v13)
}
fn followed_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: i32) -> (i32, Rc<str>, Rc<str>) {
    let mut v4: i32 = (v0.clone().len() as i32);
    let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let v6: bool = v0.ends_with(&*v5);
    let v9: Rc<str> = if v6 {
        let mut v7: i32 = v4.wrapping_sub(2i32);
        let v8: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v7 as i64);
        v8
    } else {
        v0
    };
    let v10: US0 = US0::US0_BearerToken(v1);
    let v11: bool = v3 < 0i32;
    let v12: i32 = if v11 {
        201i32
    } else {
        v3
    };
    let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v15: US1 = pages_1(v9, v10, v2, v12, v13.clone(), v14);
    if v11 {
        match &v15 {
            US1::US1_Error(v32) => {
                let v32: US2 = v32.clone();
                let v33: Rc<str> = describe_failure_7(v32);
                (4i32, v13.clone(), v33)
            }
            US1::US1_Ok(v16) => {
                let v16: Rc<UH0> = v16.clone();
                let v17: i32 = 0i32;
                let v18: i32 = method2(v16.clone(), v17);
                let v19: bool = v18 > 200i32;
                if v19 {
                    let v20: Rc<str> = Rc::<str>::from(format!("{:?}", 200i32));
                    let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--max-following all would read more than "); } LIT.with(|lit| lit.clone()) };
                    let v22: Rc<str> = Rc::<str>::from(format!("{}{}", v21, v20));
                    let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" timelines; pass a number to confirm"); } LIT.with(|lit| lit.clone()) };
                    let mut v24: Rc<str> = Rc::<str>::from(format!("{}{}", v22, v23));
                    (4i32, v13.clone(), v24)
                } else {
                    let v25: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let mut v26: Rc<UH1> = method8(v16, v25);
                    let (mut v27, mut v28): (Rc<str>, Rc<str>) = method9(v26, v13.clone(), v13.clone());
                    (0i32, v27, v13.clone())
                }
            }
        }
    } else {
        match &v15 {
            US1::US1_Error(v45) => {
                let v45: US2 = v45.clone();
                let v46: Rc<str> = describe_failure_7(v45);
                (4i32, v13.clone(), v46)
            }
            US1::US1_Ok(v40) => {
                let v40: Rc<UH0> = v40.clone();
                let v41: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                let v42: Rc<UH1> = method8(v40, v41);
                let (mut v43, mut v44): (Rc<str>, Rc<str>) = method9(v42, v13.clone(), v13.clone());
                (0i32, v43, v13)
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
fn split_on_11(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH1> {
    let v2: Option<usize> = v1.find(&*v0);
    let v3: Option<usize> = method12(v2);
    let mut v4: Rc<dyn Fn((usize)) -> i32> = closure2();
    let mut v5: Option<i32> = v3.map(|x| v4(x));
    let mut v7: i32 = v5.unwrap_or(-1i32);
    let v8: bool = v7 < 0i32;
    if v8 {
        let v9: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH1::UH1_Cons(v1.clone(), v9))
    } else {
        let v11: usize = ((0i32) as usize);
        let v12: usize = ((v7) as usize);
        let v13: Rc<str> = Rc::<str>::from(&(v1)[v11..v12]);
        let v14: i32 = v7.wrapping_add(1i32);
        let v15: i32 = (v1.clone().len() as i32);
        let v16: i32 = v15.wrapping_sub(v7);
        let v17: i32 = v16.wrapping_sub(1i32);
        let v18: usize = ((v14) as usize);
        let v19: i32 = v14.wrapping_add(v17);
        let v20: usize = ((v19) as usize);
        let v21: Rc<str> = Rc::<str>::from(&(v1)[v18..v20]);
        let v22: Rc<UH1> = split_on_11(v0, v21);
        Rc::new(UH1::UH1_Cons(v13, v22))
    }
}
fn method13(mut v0: Rc<UH1>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH1::UH1_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH1> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method13(v4, v1.clone(), v2.clone());
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v3, v6)), v5));
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            (v8, v9)
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v0 {
                UH1::UH1_Nil => {
                    (v1, v2)
                }
                _ => unreachable!(),
            };
            (v10, v11)
        }
    };
    (v12, v13)
}
fn from_14(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
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
    let v8: Rc<str> = if v5 {
        let v6: i32 = v3.wrapping_sub(2i32);
        let mut v7: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v6 as i64);
        v7
    } else {
        v0
    };
    let v9: bool = &*v2 == "";
    let v13: Rc<UH1> = if v9 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_on_11(v11, v2)
    };
    let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v15, mut v16): (Rc<str>, Rc<str>) = method13(v13, v14.clone(), v14.clone());
    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users/by?usernames="); } LIT.with(|lit| lit.clone()) };
    let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v15));
    let v19: US0 = US0::US0_BearerToken(v1);
    let v20: US4 = app_reply_3(v8, v19, v18);
    match &v20 {
        US4::US4_Error(v43) => {
            let v43: US2 = v43.clone();
            let v44: Rc<str> = describe_failure_7(v43);
            (4i32, v14.clone(), v14.clone(), v44)
        }
        US4::US4_Ok(v21, v22) => {
            let v21: serde_json::Value = v21.clone();
            let v22: Rc<str> = v22.clone();
            let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v24: serde_json::Value = v21.get(&*v23).cloned().unwrap_or_default();
            let v25: usize = v24.as_array().map_or(0, Vec::len);
            let mut v26: i32 = ((v25) as i32);
            let v27: i32 = v26.wrapping_sub(1i32);
            let v28: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v29: Rc<UH0> = from_4(v24, v27, v28);
            let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
            let mut v31: serde_json::Value = v21.get(&*v30).cloned().unwrap_or_default();
            let v32: usize = v31.as_array().map_or(0, Vec::len);
            let v33: i32 = ((v32) as i32);
            let v34: i32 = v33.wrapping_sub(1i32);
            let v35: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v36: Rc<UH1> = from_14(v31, v34, v35);
            let v37: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v38: Rc<UH1> = method8(v29, v37);
            let (mut v39, mut v40): (Rc<str>, Rc<str>) = method9(v38, v14.clone(), v14.clone());
            let (mut v41, mut v42): (Rc<str>, Rc<str>) = method13(v36, v14.clone(), v14.clone());
            (0i32, v39, v41, v14)
        }
    }
}
fn closure1() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>, Rc<str>) {
        named_10(v0.clone(), v1.clone(), v2.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method16(mut v0: Rc<UH1>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH2> = method16(v3, v1.clone());
            Rc::new(UH2::UH2_Cons(v2, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn go_18(mut v0: i32, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v1 {
        UH2::UH2_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH2> = v3.clone();
            let mut v4: bool = v0 > 0i32;
            if v4 {
                let mut v5: i32 = v0.wrapping_sub(1i32);
                let v6: Rc<UH2> = go_18(v5, v3);
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
fn after_first_19(mut v0: i32, mut v1: Rc<UH2>) -> Rc<UH2> {
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
fn chunked_17(mut v0: i32, mut v1: Rc<UH2>) -> Rc<UH3> {
    match &*v1 {
        UH2::UH2_Nil => {
            { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) }
        }
        _ => {
            let v3: Rc<UH2> = go_18(v0, v1.clone());
            let mut v4: Rc<UH2> = after_first_19(v0, v1);
            let mut v5: Rc<UH3> = chunked_17(v0, v4);
            Rc::new(UH3::UH3_Cons(v3, v5))
        }
    }
}
fn method21(mut v0: Rc<UH2>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH2> = v3.clone();
            let mut v4: Rc<UH1> = method21(v3, v1.clone());
            Rc::new(UH1::UH1_Cons(v2, v4))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn method20(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<UH3>, mut v3: Rc<UH4>) -> Rc<UH4> {
    match &*v2 {
        UH3::UH3_Cons(v4, v5) => {
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH3> = v5.clone();
            let v6: Rc<UH4> = method20(v0.clone(), v1.clone(), v5, v3.clone());
            let mut v7: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v8: Rc<UH1> = method21(v4, v7);
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = method13(v8, v9.clone(), v9);
            let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users?ids="); } LIT.with(|lit| lit.clone()) };
            let v13: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v10));
            let v14: US0 = US0::US0_BearerToken(v1);
            let v15: US4 = app_reply_3(v0, v14, v13);
            Rc::new(UH4::UH4_Cons(v15, v6))
        }
        UH3::UH3_Nil => {
            v3
        }
    }
}
fn method23(mut v0: Rc<UH5>, mut v1: Rc<UH5>) -> Rc<UH5> {
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
fn all_got_22(mut v0: Rc<UH4>, mut v1: Rc<UH5>) -> US5 {
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
                let v3: Rc<UH5> = method23(v1.clone(), v2.clone());
                return US5::US5_Ok(v3.clone());
            }
        }
    }
}
fn method24(mut v0: Rc<UH5>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH5::UH5_Cons(v2, v3, v4) => {
            let v2: serde_json::Value = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH5> = v4.clone();
            let mut v5: Rc<UH1> = method24(v4, v1.clone());
            Rc::new(UH1::UH1_Cons(v3, v5))
        }
        UH5::UH5_Nil => {
            v1
        }
    }
}
fn method26(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method26(v3, v1.clone());
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
fn method25(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method25(v3, v1.clone());
            let mut v5: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v2).unwrap_or_default();
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let v8: usize = v7.as_array().map_or(0, Vec::len);
            let v9: i32 = ((v8) as i32);
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
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method28(v3, v1.clone());
            let mut v5: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v2).unwrap_or_default();
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let v8: usize = v7.as_array().map_or(0, Vec::len);
            let v9: i32 = ((v8) as i32);
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
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let mut v5: bool = v0.ends_with(&*v4);
    let v8: Rc<str> = if v5 {
        let v6: i32 = v3.wrapping_sub(2i32);
        let mut v7: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v6 as i64);
        v7
    } else {
        v0
    };
    let v9: i32 = 100i32;
    let v10: bool = &*v2 == "";
    let v14: Rc<UH1> = if v10 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_on_11(v12, v2)
    };
    let v15: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let v16: Rc<UH2> = method16(v14, v15);
    let v17: Rc<UH3> = chunked_17(v9, v16);
    let v18: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let v19: Rc<UH4> = method20(v8, v1, v17, v18);
    let v20: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
    let v21: US5 = all_got_22(v19, v20);
    match &v21 {
        US5::US5_Error(v61) => {
            let v61: US2 = v61.clone();
            let v62: Rc<str> = describe_failure_7(v61);
            let v63: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (4i32, v63, v62)
        }
        US5::US5_Ok(v22) => {
            let v22: Rc<UH5> = v22.clone();
            let v23: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v24: Rc<UH1> = method24(v22, v23);
            let v25: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v26: Rc<UH1> = method25(v24.clone(), v25);
            let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v28, mut v29): (Rc<str>, Rc<str>) = method13(v26, v27.clone(), v27.clone());
            let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
            let mut v31: Rc<str> = Rc::<str>::from(format!("{}{}", v30, v28));
            let v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
            let v33: Rc<str> = Rc::<str>::from(format!("{}{}", v31, v32));
            let v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) };
            let v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let v37: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v34, v35)), v34));
            let v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let v40: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v37, v38)), v33));
            let v41: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v42: Rc<UH1> = method28(v24, v41);
            let (mut v43, mut v44): (Rc<str>, Rc<str>) = method13(v42, v27.clone(), v27.clone());
            let v46: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v30, v43)), v32));
            let v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
            let v53: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v34, v47)), v34)), v38)), v46)), v27)), v27));
            let v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let v56: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v40, v54)), v53));
            let v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{"); } LIT.with(|lit| lit.clone()) };
            let v58: Rc<str> = Rc::<str>::from(format!("{}{}", v57, v56));
            let v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
            let v60: Rc<str> = Rc::<str>::from(format!("{}{}", v58, v59));
            (0i32, v60, v27)
        }
    }
}
fn closure3() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>) {
        by_ids_15(v0.clone(), v1.clone(), v2.clone())
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
