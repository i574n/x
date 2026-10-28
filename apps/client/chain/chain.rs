#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(serde_json::Value, Rc<UH0>),
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
enum US0 {
    US0_Some(Rc<str>),
    US0_None,
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, US0, Rc<UH1>),
}
#[derive(Clone)]
enum UH4 {
    UH4_Nil,
    UH4_Cons(Rc<str>, Rc<UH4>),
}
#[derive(Clone)]
enum US1 {
    US1_ChainRead(Rc<UH1>),
    US1_ChainBranches(Rc<str>),
    US1_ChainRoots(Rc<str>),
    US1_ChainMissing,
}
fn from_0(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let mut v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v6.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v7.clone());
            continue;
        }
    }
}
fn method2(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let v4: Rc<UH2> = v4.clone();
            let v5: Rc<UH3> = v5.clone();
            let mut v6: US0 = v6.clone();
            let mut v7: Rc<UH1> = v7.clone();
            let v8: Rc<UH1> = method2(v7, v1.clone());
            Rc::new(UH1::UH1_Cons(v2, v3, v4, v5, v6, v8))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn from_4(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH4>) -> Rc<UH4> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let mut v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let mut v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
            let v8: Rc<UH4> = Rc::new(UH4::UH4_Cons(v7.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v8.clone());
            continue;
        }
    }
}
fn method5(mut v0: Rc<UH4>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH4::UH4_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH4> = v3.clone();
            let v4: Rc<UH2> = method5(v3, v1.clone());
            Rc::new(UH2::UH2_Cons(v2, v4))
        }
        UH4::UH4_Nil => {
            v1
        }
    }
}
fn from_6(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH3>) -> Rc<UH3> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let mut v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
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
fn first_reply_from_7(mut v0: i32, mut v1: serde_json::Value) -> Rc<str> {
    loop {
        let v2: usize = v1.as_array().map_or(0, Vec::len);
        let v3: i32 = ((v2) as i32);
        let v4: bool = v0 >= v3;
        if v4 {
            let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            return v5.clone();
        } else {
            let mut v6: usize = ((v0) as usize);
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
fn from_3(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let mut v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
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
            let mut v24: usize = v23.as_array().map_or(0, Vec::len);
            let v25: i32 = ((v24) as i32);
            let v26: i32 = v25.wrapping_sub(1i32);
            let v27: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
            let v28: Rc<UH4> = from_4(v23.clone(), v26, v27.clone());
            let v29: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let v30: Rc<UH2> = method5(v28.clone(), v29.clone());
            let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("entities"); } LIT.with(|lit| lit.clone()) };
            let v32: serde_json::Value = v6.get(&*v31).cloned().unwrap_or_default();
            let v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("urls"); } LIT.with(|lit| lit.clone()) };
            let mut v34: serde_json::Value = v32.get(&*v33).cloned().unwrap_or_default();
            let v35: usize = v34.as_array().map_or(0, Vec::len);
            let v36: i32 = ((v35) as i32);
            let v37: i32 = v36.wrapping_sub(1i32);
            let v38: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
            let v39: Rc<UH3> = from_6(v34.clone(), v37, v38.clone());
            let v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
            let v41: serde_json::Value = v6.get(&*v40).cloned().unwrap_or_default();
            let v42: i32 = 0i32;
            let v43: Rc<str> = first_reply_from_7(v42, v41.clone());
            let v44: bool = &*v43 == "";
            let v47: US0 = if v44 {
                US0::US0_None
            } else {
                US0::US0_Some(v43.clone())
            };
            let v48: Rc<UH1> = Rc::new(UH1::UH1_Cons(v9.clone(), v21.clone(), v30.clone(), v39.clone(), v47.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v48.clone());
            continue;
        }
    }
}
fn method1(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: serde_json::Value = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let v4: Rc<UH1> = method1(v3.clone(), v1.clone());
            let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v6: serde_json::Value = v2.get(&*v5).cloned().unwrap_or_default();
            let mut v7: usize = v6.as_array().map_or(0, Vec::len);
            let v8: i32 = ((v7) as i32);
            let v9: i32 = v8.wrapping_sub(1i32);
            let v10: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v11: Rc<UH1> = from_3(v6.clone(), v9, v10.clone());
            method2(v11.clone(), v4.clone())
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method9(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    loop {
        match &*v0 {
            UH2::UH2_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
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
fn method8(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let v4: Rc<UH2> = v4.clone();
            let v5: Rc<UH3> = v5.clone();
            let mut v6: US0 = v6.clone();
            let mut v7: Rc<UH1> = v7.clone();
            let v8: Rc<UH1> = method8(v7.clone(), v1.clone());
            let v9: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let v10: Rc<UH2> = method9(v4.clone(), v9.clone());
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
fn closure1(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, US0) -> bool> {
    Rc::new(move |mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<UH2>, mut v4: Rc<UH3>, mut v5: US0| -> bool {
        let mut v6: bool = &*v1 == &*v0;
        v6
    })
}
fn method11(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, US0) -> bool> {
    closure1(v0)
}
fn method12(mut v0: Rc<str>, mut v1: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, US0) -> bool>, mut v2: Rc<UH1>) -> bool {
    loop {
        match &*v2 {
            UH1::UH1_Cons(v3, v4, v5, v6, v7, v8) => {
                let v3: Rc<str> = v3.clone();
                let v4: Rc<str> = v4.clone();
                let v5: Rc<UH2> = v5.clone();
                let mut v6: Rc<UH3> = v6.clone();
                let mut v7: US0 = v7.clone();
                let v8: Rc<UH1> = v8.clone();
                let v9: bool = v1(v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone());
                if v9 {
                    return true;
                } else {
                    let v10: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, US0) -> bool> = method11(v0.clone());
                    (v0, v1, v2) = (v0.clone(), v10.clone(), v8.clone());
                    continue;
                }
            }
            UH1::UH1_Nil => {
                return false;
            }
        }
    }
}
fn method10(mut v0: Rc<UH1>, mut v1: Rc<UH1>, mut v2: Rc<UH1>) -> Rc<UH1> {
    match &*v1 {
        UH1::UH1_Cons(v3, v4, v5, v6, v7, v8) => {
            let v3: Rc<str> = v3.clone();
            let v4: Rc<str> = v4.clone();
            let v5: Rc<UH2> = v5.clone();
            let mut v6: Rc<UH3> = v6.clone();
            let mut v7: US0 = v7.clone();
            let v8: Rc<UH1> = v8.clone();
            let v9: Rc<UH1> = method10(v0.clone(), v8, v2.clone());
            let v15: bool = match &v7 {
                US0::US0_None => {
                    true
                }
                US0::US0_Some(v10) => {
                    let v10: Rc<str> = v10.clone();
                    let v11: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, US0) -> bool> = method11(v10.clone());
                    let v12: bool = method12(v10, v11, v0);
                    let v13: bool = v12 == false;
                    v13
                }
            };
            if v15 {
                Rc::new(UH1::UH1_Cons(v3, v4, v5, v6, v7, v9.clone()))
            } else {
                v9
            }
        }
        UH1::UH1_Nil => {
            v2
        }
    }
}
fn closure2(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, US0) -> bool> {
    Rc::new(move |mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<UH2>, mut v4: Rc<UH3>, mut v5: US0| -> bool {
        let mut v6: bool = &*v1 == &*v0;
        v6
    })
}
fn method13(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, US0) -> bool> {
    closure2(v0)
}
fn method14(mut v0: Rc<str>, mut v1: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, US0) -> bool>, mut v2: Rc<UH1>) -> bool {
    loop {
        match &*v2 {
            UH1::UH1_Cons(v3, v4, v5, v6, v7, v8) => {
                let v3: Rc<str> = v3.clone();
                let v4: Rc<str> = v4.clone();
                let v5: Rc<UH2> = v5.clone();
                let mut v6: Rc<UH3> = v6.clone();
                let mut v7: US0 = v7.clone();
                let v8: Rc<UH1> = v8.clone();
                let v9: bool = v1(v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone());
                if v9 {
                    return true;
                } else {
                    let v10: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, US0) -> bool> = method13(v0.clone());
                    (v0, v1, v2) = (v0.clone(), v10.clone(), v8.clone());
                    continue;
                }
            }
            UH1::UH1_Nil => {
                return false;
            }
        }
    }
}
fn method16(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<UH2>, mut v3: Rc<UH3>, mut v4: US0, mut v5: Rc<UH1>, mut v6: Rc<UH1>) -> Rc<UH1> {
    match &*v5 {
        UH1::UH1_Cons(v7, v8, v9, v10, v11, v12) => {
            let mut v7: Rc<str> = v7.clone();
            let v8: Rc<str> = v8.clone();
            let v9: Rc<UH2> = v9.clone();
            let v10: Rc<UH3> = v10.clone();
            let v11: US0 = v11.clone();
            let v12: Rc<UH1> = v12.clone();
            let v13: Rc<UH1> = method16(v0.clone(), v1, v2, v3, v4, v12, v6.clone());
            let v17: bool = match &v11 {
                US0::US0_None => {
                    false
                }
                US0::US0_Some(v14) => {
                    let v14: Rc<str> = v14.clone();
                    let v15: bool = &*v14 == &*v0;
                    v15
                }
            };
            if v17 {
                Rc::new(UH1::UH1_Cons(v7, v8, v9, v10, v11, v13.clone()))
            } else {
                v13
            }
        }
        UH1::UH1_Nil => {
            v6
        }
    }
}
fn method17(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v2, v3, v4, v5, v6, v7) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<str> = v3.clone();
                let v4: Rc<UH2> = v4.clone();
                let v5: Rc<UH3> = v5.clone();
                let mut v6: US0 = v6.clone();
                let mut v7: Rc<UH1> = v7.clone();
                let v8: Rc<UH1> = Rc::new(UH1::UH1_Cons(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v1.clone()));
                (v0, v1) = (v7.clone(), v8.clone());
                continue;
            }
            UH1::UH1_Nil => {
                return v1.clone();
            }
        }
    }
}
fn chain_from_15(mut v0: Rc<UH1>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<UH2>, mut v4: Rc<UH3>, mut v5: US0, mut v6: Rc<UH1>) -> US1 {
    loop {
        let mut v7: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let v8: Rc<UH1> = method16(v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v0.clone(), v7.clone());
        match &*v8 {
            UH1::UH1_Cons(v12, v13, v14, v15, v16, v17) => {
                let v12: Rc<str> = v12.clone();
                let v13: Rc<str> = v13.clone();
                let v14: Rc<UH2> = v14.clone();
                let v15: Rc<UH3> = v15.clone();
                let v16: US0 = v16.clone();
                let v17: Rc<UH1> = v17.clone();
                match &*v17 {
                    UH1::UH1_Nil => {
                        let v18: Rc<UH1> = Rc::new(UH1::UH1_Cons(v12.clone(), v13.clone(), v14.clone(), v15.clone(), v16.clone(), v6.clone()));
                        (v0, v1, v2, v3, v4, v5, v6) = (v0.clone(), v12.clone(), v13.clone(), v14.clone(), v15.clone(), v16.clone(), v18.clone());
                        continue;
                    }
                    _ => {
                        return US1::US1_ChainBranches(v1.clone());
                    }
                }
            }
            UH1::UH1_Nil => {
                let v9: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                let v10: Rc<UH1> = method17(v6.clone(), v9.clone());
                return US1::US1_ChainRead(v10.clone());
            }
        }
    }
}
fn method18(mut v0: Rc<UH1>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let v4: Rc<UH2> = v4.clone();
            let v5: Rc<UH3> = v5.clone();
            let mut v6: US0 = v6.clone();
            let mut v7: Rc<UH1> = v7.clone();
            let v8: Rc<UH4> = method18(v7.clone(), v1.clone());
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) };
            let v11: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v9, v2)), v9));
            let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let v14: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v9, v12)), v9));
            let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let v17: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v14, v15)), v11));
            let v18: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v3).to_string());
            let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
            let mut v23: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v9, v19)), v9)), v15)), v18));
            let mut v24: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            v24.borrow_mut().push(v17);
            v24.borrow_mut().push(v23);
            let v25: Rc<Vec<Rc<str>>> = Rc::new(v24.borrow().clone());
            let v26: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v25).as_ref().clone()));
            let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let v28: Rc<str> = Rc::<str>::from((*v26.borrow()).join(&*v27));
            let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{"); } LIT.with(|lit| lit.clone()) };
            let v30: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v28));
            let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
            let v32: Rc<str> = Rc::<str>::from(format!("{}{}", v30, v31));
            Rc::new(UH4::UH4_Cons(v32.clone(), v8.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method19(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH4>, mut v2: i32) -> i32 {
    loop {
        match &*v1 {
            UH4::UH4_Cons(v3, v4) => {
                let v3: Rc<str> = v3.clone();
                let v4: Rc<UH4> = v4.clone();
                v0.borrow_mut().push(v3);
                let v5: i32 = v2.wrapping_add(1i32);
                (v0, v1, v2) = (v0.clone(), v4.clone(), v5);
                continue;
            }
            UH4::UH4_Nil => {
                return v2;
            }
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>) {
        let (mut v3, mut v4, mut v5): (i32, Rc<str>, Rc<str>) = xc_thread::xc_thread_pages(&*v0, &*v1, &*v2);
        let mut v6: bool = v3 == 0i32;
        if v6 {
            let mut v7: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v4).unwrap_or_default();
            let v8: usize = v7.as_array().map_or(0, Vec::len);
            let v9: i32 = ((v8) as i32);
            let v10: i32 = v9.wrapping_sub(1i32);
            let v11: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v12: Rc<UH0> = from_0(v7.clone(), v10, v11.clone());
            let v13: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v14: Rc<UH1> = method1(v12.clone(), v13.clone());
            let v15: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v16: Rc<UH1> = method8(v14.clone(), v15.clone());
            let v17: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v18: Rc<UH1> = method10(v16.clone(), v16.clone(), v17.clone());
            let v50: US1 = match &*v18 {
                UH1::UH1_Cons(v19, v20, v21, v22, v23, v24) => {
                    let v19: Rc<str> = v19.clone();
                    let v20: Rc<str> = v20.clone();
                    let v21: Rc<UH2> = v21.clone();
                    let v22: Rc<UH3> = v22.clone();
                    let mut v23: US0 = v23.clone();
                    let mut v24: Rc<UH1> = v24.clone();
                    match &*v24 {
                        UH1::UH1_Cons(v28, v29, v30, v31, v32, v33) => {
                            let v28: Rc<str> = v28.clone();
                            let v29: Rc<str> = v29.clone();
                            let v30: Rc<UH2> = v30.clone();
                            let v31: Rc<UH3> = v31.clone();
                            let v32: US0 = v32.clone();
                            let v33: Rc<UH1> = v33.clone();
                            let v39: bool = match &v23 {
                                US0::US0_None => {
                                    false
                                }
                                US0::US0_Some(v34) => {
                                    let mut v34: Rc<str> = v34.clone();
                                    let v35: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, US0) -> bool> = method13(v34.clone());
                                    let v36: bool = method14(v34.clone(), v35.clone(), v16.clone());
                                    let v37: bool = v36 == false;
                                    v37
                                }
                            };
                            let v40: Rc<str> = if v39 {
                                v19.clone()
                            } else {
                                v28.clone()
                            };
                            US1::US1_ChainRoots(v40.clone())
                        }
                        UH1::UH1_Nil => {
                            let v25: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                            let v26: Rc<UH1> = Rc::new(UH1::UH1_Cons(v19.clone(), v20.clone(), v21.clone(), v22.clone(), v23.clone(), v25.clone()));
                            chain_from_15(v16.clone(), v19.clone(), v20.clone(), v21.clone(), v22.clone(), v23.clone(), v26.clone())
                        }
                    }
                }
                UH1::UH1_Nil => {
                    US1::US1_ChainMissing
                }
            };
            match &v50 {
                US1::US1_ChainRead(v51) => {
                    let v51: Rc<UH1> = v51.clone();
                    let v52: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
                    let v53: Rc<UH4> = method18(v51.clone(), v52.clone());
                    let v54: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                    let v55: i32 = 0i32;
                    let v56: i32 = method19(v54.clone(), v53.clone(), v55);
                    let v57: Rc<Vec<Rc<str>>> = Rc::new(v54.borrow().clone());
                    let v58: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v57).as_ref().clone()));
                    let v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                    let v60: Rc<str> = Rc::<str>::from((*v58.borrow()).join(&*v59));
                    let v61: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
                    let v62: Rc<str> = Rc::<str>::from(format!("{}{}", v61, v60));
                    let v63: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
                    let v64: Rc<str> = Rc::<str>::from(format!("{}{}", v62, v63));
                    let v65: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    (0i32, v64.clone(), v65.clone())
                }
                _ => {
                    let v78: Rc<str> = match &v50 {
                        US1::US1_ChainBranches(v66) => {
                            let v66: Rc<str> = v66.clone();
                            let v67: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("the thread branches after post "); } LIT.with(|lit| lit.clone()) };
                            let v68: Rc<str> = Rc::<str>::from(format!("{}{}", v67, v66));
                            let v69: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; --resume needs one chain of replies"); } LIT.with(|lit| lit.clone()) };
                            let v70: Rc<str> = Rc::<str>::from(format!("{}{}", v68, v69));
                            v70.clone()
                        }
                        US1::US1_ChainRoots(v71) => {
                            let v71: Rc<str> = v71.clone();
                            let v72: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post "); } LIT.with(|lit| lit.clone()) };
                            let v73: Rc<str> = Rc::<str>::from(format!("{}{}", v72, v71));
                            let v74: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" replies to a post outside the thread's chain (an edited or deleted post?); --resume needs one unbroken chain"); } LIT.with(|lit| lit.clone()) };
                            let v75: Rc<str> = Rc::<str>::from(format!("{}{}", v73, v74));
                            v75.clone()
                        }
                        _ => {
                            let v76: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no posts of that thread found"); } LIT.with(|lit| lit.clone()) };
                            v76.clone()
                        }
                    };
                    let v79: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    (4i32, v79.clone(), v78.clone())
                }
            }
        } else {
            let v83: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v3, v83.clone(), v5.clone())
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_chain(v0: &str, v1: &str, v2: &str) -> (i32, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2))
}
