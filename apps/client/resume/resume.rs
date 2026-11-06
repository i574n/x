#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
#[derive(Clone)]
enum US0 {
    US0_ResumeAfter(i32, Rc<UH0>),
    US0_PostDiffers(i32, Rc<str>, Rc<str>),
    US0_MorePostedThanPlanned(i32),
}
fn from_1(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2;
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9, v2));
            (v1, v2) = (v4, v10);
            continue;
        }
    }
}
fn method3(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure1() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method4(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
                let mut v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3, v4);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn resume_from_2(mut v0: i32, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> US0 {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3.clone();
                let mut v4: Rc<UH0> = v4.clone();
                match Rc::unwrap_or_clone(v2) {
                    UH0::UH0_Cons(v5, v6) => {
                        let v5: Rc<str> = v5;
                        let v6: Rc<UH0> = v6;
                        let v7: bool = &*v3 == &*v5;
                        if v7 {
                            let v8: i32 = v0.wrapping_add(1i32);
                            (v0, v1, v2) = (v8, v4, v6);
                            continue;
                        } else {
                            let v10: i32 = v0.wrapping_add(1i32);
                            let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                            let v12: Option<usize> = v3.find(&*v11);
                            let v13: Option<usize> = method3(v12);
                            let mut v14: Rc<dyn Fn((usize)) -> i32> = closure1();
                            let mut v15: Option<i32> = v13.map(|x| v14(x));
                            let v17: i32 = v15.unwrap_or(-1i32);
                            let v18: bool = v17 < 0i32;
                            let v22: Rc<str> = if v18 {
                                v3
                            } else {
                                let v19: usize = ((0i32) as usize);
                                let v20: usize = ((v17) as usize);
                                let v21: Rc<str> = Rc::<str>::from(&(v3)[v19..v20]);
                                v21
                            };
                            let v23: Option<usize> = v5.find(&*v11);
                            let v24: Option<usize> = method3(v23);
                            let mut v25: Option<i32> = v24.map(|x| v14(x));
                            let v27: i32 = v25.unwrap_or(-1i32);
                            let v28: bool = v27 < 0i32;
                            let v32: Rc<str> = if v28 {
                                v5
                            } else {
                                let v29: usize = ((0i32) as usize);
                                let v30: usize = ((v27) as usize);
                                let v31: Rc<str> = Rc::<str>::from(&(v5)[v29..v30]);
                                v31
                            };
                            return US0::US0_PostDiffers(v10, v22, v32);
                        }
                    }
                    UH0::UH0_Nil => {
                        return US0::US0_ResumeAfter(v0, v1);
                    }
                }
            }
            _ => {
                match &*v2 {
                    UH0::UH0_Nil => {
                        return US0::US0_ResumeAfter(v0, v1);
                    }
                    _ => {
                        let v39: i32 = 0i32;
                        let v40: i32 = method4(v2, v39);
                        let v41: i32 = v0.wrapping_add(v40);
                        return US0::US0_MorePostedThanPlanned(v41);
                    }
                }
            }
        }
    }
}
fn method5(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH0> = v3;
            let mut v4: Rc<UH0> = method5(v3, v1);
            let v5: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v2).to_string());
            Rc::new(UH0::UH0_Cons(v5, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method6(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3;
                let mut v4: Rc<UH0> = v4;
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
fn resume_plan_of_0(mut v0: Rc<str>) -> (i32, i32, Rc<str>) {
    let v1: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v0).unwrap_or_default();
    let v2: i32 = 0i32;
    let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("planned"); } LIT.with(|lit| lit.clone()) };
    let mut v4: serde_json::Value = v1.get(&*v3).cloned().unwrap_or_default();
    let v5: usize = v4.as_array().map_or(0, Vec::len);
    let v6: i32 = ((v5) as i32);
    let v7: i32 = v6.wrapping_sub(1i32);
    let v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v9: Rc<UH0> = from_1(v4, v7, v8);
    let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("found"); } LIT.with(|lit| lit.clone()) };
    let mut v11: serde_json::Value = v1.get(&*v10).cloned().unwrap_or_default();
    let v12: usize = v11.as_array().map_or(0, Vec::len);
    let v13: i32 = ((v12) as i32);
    let mut v14: i32 = v13.wrapping_sub(1i32);
    let mut v15: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v16: Rc<UH0> = from_1(v11, v14, v15);
    let v17: US0 = resume_from_2(v2, v9, v16);
    match &v17 {
        US0::US0_ResumeAfter(v18, v19) => {
            let v18: i32 = *v18;
            let v19: Rc<UH0> = v19.clone();
            let v20: bool = v18 > 0i32;
            if v20 {
                let v21: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let v22: Rc<UH0> = method5(v19, v21);
                let v23: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                let v24: i32 = 0i32;
                let mut v25: i32 = method6(v23.clone(), v22, v24);
                let v26: Rc<Vec<Rc<str>>> = Rc::new(v23.borrow().clone());
                let v27: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v26).as_ref().clone()));
                let v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                let v29: Rc<str> = Rc::<str>::from((*v27.borrow()).join(&*v28));
                let v30: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) }, v29));
                let v31: Rc<str> = Rc::<str>::from(format!("{}{}", v30, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) }));
                (0i32, v18, v31)
            } else {
                let v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no posted thread found before the resume point; nothing posted"); } LIT.with(|lit| lit.clone()) };
                (4i32, 0i32, v32)
            }
        }
        _ => {
            let v54: Rc<str> = match v17 {
                US0::US0_MorePostedThanPlanned(v49) => {
                    let v49: i32 = v49;
                    let v50: Rc<str> = Rc::<str>::from((v49).to_string());
                    let v51: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("the thread already has "); } LIT.with(|lit| lit.clone()) }, v50));
                    let v52: Rc<str> = Rc::<str>::from(format!("{}{}", v51, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" posts, more than the file plans; nothing posted"); } LIT.with(|lit| lit.clone()) }));
                    v52
                }
                US0::US0_PostDiffers(v36, v37, v38) => {
                    let v36: i32 = v36;
                    let v37: Rc<str> = v37;
                    let v38: Rc<str> = v38;
                    let v39: Rc<str> = Rc::<str>::from((v36).to_string());
                    let v40: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post "); } LIT.with(|lit| lit.clone()) }, v39.clone()));
                    let v41: Rc<str> = Rc::<str>::from(format!("{}{}", v40, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" of the thread differs from post "); } LIT.with(|lit| lit.clone()) }));
                    let v42: Rc<str> = Rc::<str>::from(format!("{}{}", v41, v39));
                    let v43: Rc<str> = Rc::<str>::from(format!("{}{}", v42, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" of the file"); } LIT.with(|lit| lit.clone()) }));
                    let v44: Rc<str> = Rc::<str>::from(format!("{}{}", v43, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" (found '"); } LIT.with(|lit| lit.clone()) }));
                    let v45: Rc<str> = Rc::<str>::from(format!("{}{}", v44, v38));
                    let v46: Rc<str> = Rc::<str>::from(format!("{}{}", v45, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("', planned '"); } LIT.with(|lit| lit.clone()) }));
                    let v47: Rc<str> = Rc::<str>::from(format!("{}{}", v46, v37));
                    let v48: Rc<str> = Rc::<str>::from(format!("{}{}", v47, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'); nothing posted"); } LIT.with(|lit| lit.clone()) }));
                    v48
                }
                _ => unreachable!(),
            };
            (4i32, 0i32, v54)
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> (i32, i32, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> (i32, i32, Rc<str>)> = Rc::new(move |mut v0: Rc<str>| -> (i32, i32, Rc<str>) {
        resume_plan_of_0(v0)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_resume_plan(v0: &str) -> (i32, i32, Rc<str>) {
    closure0()(Rc::<str>::from(v0))
}
