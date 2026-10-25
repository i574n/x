#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, i32, Rc<UH0>),
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<UH1>),
}
fn from_1(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("weight"); } LIT.with(|lit| lit.clone()) };
            let mut v11: serde_json::Value = v6.get(&*v10).cloned().unwrap_or_default();
            let v12: i64 = v11.as_i64().unwrap_or(0);
            let v13: i32 = (v12 as i32);
            let v14: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9.clone(), v13, v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v14.clone());
            continue;
        }
    }
}
fn method2(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3, v4) => {
                let mut v2: Rc<str> = v2.clone();
                let v3: i32 = *v3;
                let v4: Rc<UH0> = v4.clone();
                let v5: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v4.clone(), v5);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn method4(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let v3: Rc<UH1> = v3.clone();
                let v4: Rc<UH1> = Rc::new(UH1::UH1_Cons(v2.clone(), v1.clone()));
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH1::UH1_Nil => {
                return v1.clone();
            }
        }
    }
}
fn previews_3(mut v0: i32, mut v1: i32, mut v2: Rc<UH0>, mut v3: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v2 {
            UH0::UH0_Cons(v6, v7, v8) => {
                let v6: Rc<str> = v6.clone();
                let v7: i32 = *v7;
                let v8: Rc<UH0> = v8.clone();
                let v9: i32 = v1.wrapping_add(1i32);
                let v10: Rc<str> = Rc::<str>::from(format!("{:?}", v1));
                let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--- post "); } LIT.with(|lit| lit.clone()) };
                let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v10));
                let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" of "); } LIT.with(|lit| lit.clone()) };
                let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v13));
                let v16: Rc<str> = Rc::<str>::from(format!("{}{}", v14, Rc::<str>::from(format!("{:?}", v0))));
                let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", weight "); } LIT.with(|lit| lit.clone()) };
                let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v17));
                let v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, Rc::<str>::from(format!("{:?}", v7))));
                let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                let v23: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v20, v21)), v6));
                let v24: Rc<UH1> = Rc::new(UH1::UH1_Cons(v23.clone(), v3.clone()));
                (v0, v1, v2, v3) = (v0, v9, v8.clone(), v24.clone());
                continue;
            }
            UH0::UH0_Nil => {
                let v4: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                return method4(v3.clone(), v4.clone());
            }
        }
    }
}
fn method5(mut v0: Rc<UH1>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH1::UH1_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let v4: Rc<UH1> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method5(v4, v1.clone(), v2.clone());
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
fn preview_0(mut v0: Rc<str>) -> Rc<str> {
    let v1: Rc<str> = xc_frames::xc_frames(&*v0);
    let mut v2: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v1).unwrap_or_default();
    let v3: usize = v2.as_array().map_or(0, Vec::len);
    let v4: i32 = ((v3) as i32);
    let v5: i32 = v4.wrapping_sub(1i32);
    let v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v7: Rc<UH0> = from_1(v2, v5, v6);
    let v8: i32 = 0i32;
    let v9: i32 = method2(v7.clone(), v8);
    let v10: i32 = 1i32;
    let mut v11: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v12: Rc<UH1> = previews_3(v9, v10, v7, v11);
    let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v14, mut v15): (Rc<str>, Rc<str>) = method5(v12, v13.clone(), v13.clone());
    let v16: Rc<str> = Rc::<str>::from(format!("{:?}", v9));
    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n--- "); } LIT.with(|lit| lit.clone()) };
    let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v16));
    let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" posts, "); } LIT.with(|lit| lit.clone()) };
    let v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v19));
    let v21: i32 = v9.wrapping_mul(15i32);
    let v22: i32 = v21.wrapping_rem(1000i32);
    let v23: bool = v22 < 10i32;
    let v28: Rc<str> = if v23 {
        let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("00"); } LIT.with(|lit| lit.clone()) };
        v24
    } else {
        let v25: bool = v22 < 100i32;
        if v25 {
            let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0"); } LIT.with(|lit| lit.clone()) };
            v26
        } else {
            v13
        }
    };
    let v29: i32 = v21.wrapping_div(1000i32);
    let v30: Rc<str> = Rc::<str>::from(format!("{:?}", v29));
    let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("$"); } LIT.with(|lit| lit.clone()) };
    let v32: Rc<str> = Rc::<str>::from(format!("{}{}", v31, v30));
    let v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("."); } LIT.with(|lit| lit.clone()) };
    let v35: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v32, v33)), v28));
    let v38: Rc<str> = Rc::<str>::from(format!("{}{}", v20, Rc::<str>::from(format!("{}{}", v35, Rc::<str>::from(format!("{:?}", v22))))));
    let v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" to create"); } LIT.with(|lit| lit.clone()) };
    let v41: Rc<str> = Rc::<str>::from(format!("{}{}", v14, Rc::<str>::from(format!("{}{}", v38, v39))));
    v41
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        preview_0(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_preview(v0: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0))
}
