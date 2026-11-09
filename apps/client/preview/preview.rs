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
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2;
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
            let v14: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9, v13, v2));
            (v1, v2) = (v4, v14);
            continue;
        }
    }
}
fn method2(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3, v4) => {
                let v2: Rc<str> = v2;
                let mut v3: i32 = v3;
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
fn method4(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let mut v3: Rc<UH1> = v3;
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
fn previews_3(mut v0: i32, mut v1: i32, mut v2: Rc<UH0>, mut v3: Rc<UH1>) -> Rc<UH1> {
    loop {
        match Rc::unwrap_or_clone(v2) {
            UH0::UH0_Cons(v6, v7, v8) => {
                let v6: Rc<str> = v6;
                let v7: i32 = v7;
                let v8: Rc<UH0> = v8;
                let v9: i32 = v1.wrapping_add(1i32);
                let v10: Rc<str> = Rc::<str>::from((v1).to_string());
                let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--- post "); } LIT.with(|lit| lit.clone()) }, v10));
                let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" of "); } LIT.with(|lit| lit.clone()) }));
                let v13: Rc<str> = Rc::<str>::from((v0).to_string());
                let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v13));
                let v15: Rc<str> = Rc::<str>::from(format!("{}{}", v14, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", weight "); } LIT.with(|lit| lit.clone()) }));
                let v16: Rc<str> = Rc::<str>::from((v7).to_string());
                let v17: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v16));
                let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) }));
                let v19: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v6));
                let v20: Rc<UH1> = Rc::new(UH1::UH1_Cons(v19, v3));
                (v1, v2, v3) = (v9, v8, v20);
                continue;
            }
            UH0::UH0_Nil => {
                let v4: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                return method4(v3, v4);
            }
        }
    }
}
fn method5(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH1>, mut v2: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH1::UH1_Cons(v3, v4) => {
                let mut v3: Rc<str> = v3;
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
fn preview_0(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<str> {
    let v2: Rc<str> = xc_frames::xc_frames(&*v0, &*v1);
    let mut v3: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v2).unwrap_or_default();
    let v4: usize = v3.as_array().map_or(0, Vec::len);
    let v5: i32 = ((v4) as i32);
    let v6: i32 = v5.wrapping_sub(1i32);
    let v7: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v8: Rc<UH0> = from_1(v3, v6, v7);
    let v9: i32 = 0i32;
    let v10: i32 = method2(v8.clone(), v9);
    let mut v11: i32 = 1i32;
    let v12: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v13: Rc<UH1> = previews_3(v10, v11, v8, v12);
    let v14: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v15: i32 = 0i32;
    let v16: i32 = method5(v14.clone(), v13, v15);
    let v17: Rc<Vec<Rc<str>>> = Rc::new(v14.borrow().clone());
    let v18: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v17).as_ref().clone()));
    let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let v20: Rc<str> = Rc::<str>::from((*v18.borrow()).join(&*v19));
    let v21: Rc<str> = Rc::<str>::from((v10).to_string());
    let v22: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n--- "); } LIT.with(|lit| lit.clone()) }, v21));
    let v23: Rc<str> = Rc::<str>::from(format!("{}{}", v22, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" posts"); } LIT.with(|lit| lit.clone()) }));
    let v24: bool = &*v0 == "x";
    let v44: Rc<str> = if v24 {
        let v25: i32 = v10.wrapping_mul(15i32);
        let v26: i32 = v25.wrapping_rem(1000i32);
        let v27: bool = v26 < 10i32;
        let v33: Rc<str> = if v27 {
            let v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("00"); } LIT.with(|lit| lit.clone()) };
            v28
        } else {
            let v29: bool = v26 < 100i32;
            if v29 {
                let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0"); } LIT.with(|lit| lit.clone()) };
                v30
            } else {
                let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v31
            }
        };
        let v34: i32 = v25.wrapping_div(1000i32);
        let v35: Rc<str> = Rc::<str>::from((v34).to_string());
        let v36: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("$"); } LIT.with(|lit| lit.clone()) }, v35));
        let v37: Rc<str> = Rc::<str>::from(format!("{}{}", v36, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("."); } LIT.with(|lit| lit.clone()) }));
        let v38: Rc<str> = Rc::<str>::from(format!("{}{}", v37, v33));
        let v39: Rc<str> = Rc::<str>::from((v26).to_string());
        let v40: Rc<str> = Rc::<str>::from(format!("{}{}", v38, v39));
        let v41: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", "); } LIT.with(|lit| lit.clone()) }, v40));
        let v42: Rc<str> = Rc::<str>::from(format!("{}{}", v41, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" to create"); } LIT.with(|lit| lit.clone()) }));
        v42
    } else {
        let v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v43
    };
    let v45: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v44));
    let v46: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v45));
    v46
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>| -> Rc<str> {
        preview_0(v0, v1)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_preview(v0: &str, v1: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1))
}
