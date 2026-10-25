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
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v10.clone());
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
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let mut v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3.clone(), v4);
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
                match &*v2 {
                    UH0::UH0_Cons(v5, v6) => {
                        let v5: Rc<str> = v5.clone();
                        let v6: Rc<UH0> = v6.clone();
                        let v7: bool = &*v3 == &*v5;
                        if v7 {
                            let v8: i32 = v0.wrapping_add(1i32);
                            (v0, v1, v2) = (v8, v4.clone(), v6.clone());
                            continue;
                        } else {
                            let v10: i32 = v0.wrapping_add(1i32);
                            let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                            let v12: Option<usize> = v3.find(&*v11);
                            let v13: Option<usize> = method3(v12.clone());
                            let mut v14: Rc<dyn Fn((usize)) -> i32> = closure1();
                            let mut v15: Option<i32> = v13.map(|x| v14(x));
                            let v17: i32 = v15.unwrap_or(-1i32);
                            let v18: bool = v17 < 0i32;
                            let v22: Rc<str> = if v18 {
                                v3.clone()
                            } else {
                                let v19: usize = ((0i32) as usize);
                                let v20: usize = ((v17) as usize);
                                let v21: Rc<str> = Rc::<str>::from(&(v3)[v19..v20]);
                                v21.clone()
                            };
                            let v23: Option<usize> = v5.find(&*v11);
                            let v24: Option<usize> = method3(v23.clone());
                            let mut v25: Option<i32> = v24.map(|x| v14(x));
                            let v27: i32 = v25.unwrap_or(-1i32);
                            let v28: bool = v27 < 0i32;
                            let v32: Rc<str> = if v28 {
                                v5.clone()
                            } else {
                                let v29: usize = ((0i32) as usize);
                                let v30: usize = ((v27) as usize);
                                let v31: Rc<str> = Rc::<str>::from(&(v5)[v29..v30]);
                                v31.clone()
                            };
                            return US0::US0_PostDiffers(v10, v22.clone(), v32.clone());
                        }
                    }
                    UH0::UH0_Nil => {
                        return US0::US0_ResumeAfter(v0, v1.clone());
                    }
                }
            }
            _ => {
                match &*v2 {
                    UH0::UH0_Nil => {
                        return US0::US0_ResumeAfter(v0, v1.clone());
                    }
                    _ => {
                        let v39: i32 = 0i32;
                        let v40: i32 = method4(v2.clone(), v39);
                        let v41: i32 = v0.wrapping_add(v40);
                        return US0::US0_MorePostedThanPlanned(v41);
                    }
                }
            }
        }
    }
}
fn method5(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method5(v3, v1.clone());
            let v5: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v2).to_string());
            Rc::new(UH0::UH0_Cons(v5, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method6(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method6(v4, v1.clone(), v2.clone());
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v3, v6)), v5));
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            (v8, v9)
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1, v2)
                }
                _ => unreachable!(),
            };
            (v10, v11)
        }
    };
    (v12, v13)
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
                let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let (mut v24, mut v25): (Rc<str>, Rc<str>) = method6(v22, v23.clone(), v23);
                let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
                let v27: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v24));
                let v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
                let v29: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v28));
                (0i32, v18, v29)
            } else {
                let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no posted thread found before the resume point; nothing posted"); } LIT.with(|lit| lit.clone()) };
                (4i32, 0i32, v30)
            }
        }
        _ => {
            let v60: Rc<str> = match &v17 {
                US0::US0_MorePostedThanPlanned(v53) => {
                    let v53: i32 = *v53;
                    let v54: Rc<str> = Rc::<str>::from(format!("{:?}", v53));
                    let v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("the thread already has "); } LIT.with(|lit| lit.clone()) };
                    let v56: Rc<str> = Rc::<str>::from(format!("{}{}", v55, v54));
                    let v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" posts, more than the file plans; nothing posted"); } LIT.with(|lit| lit.clone()) };
                    let v58: Rc<str> = Rc::<str>::from(format!("{}{}", v56, v57));
                    v58
                }
                US0::US0_PostDiffers(v34, v35, v36) => {
                    let v34: i32 = *v34;
                    let v35: Rc<str> = v35.clone();
                    let v36: Rc<str> = v36.clone();
                    let v37: Rc<str> = Rc::<str>::from(format!("{:?}", v34));
                    let v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post "); } LIT.with(|lit| lit.clone()) };
                    let v39: Rc<str> = Rc::<str>::from(format!("{}{}", v38, v37));
                    let v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" of the thread differs from post "); } LIT.with(|lit| lit.clone()) };
                    let v42: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v39, v40)), v37));
                    let v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" of the file"); } LIT.with(|lit| lit.clone()) };
                    let v44: Rc<str> = Rc::<str>::from(format!("{}{}", v42, v43));
                    let v45: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" (found '"); } LIT.with(|lit| lit.clone()) };
                    let v47: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v44, v45)), v36));
                    let v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("', planned '"); } LIT.with(|lit| lit.clone()) };
                    let v50: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v47, v48)), v35));
                    let v51: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'); nothing posted"); } LIT.with(|lit| lit.clone()) };
                    let v52: Rc<str> = Rc::<str>::from(format!("{}{}", v50, v51));
                    v52
                }
                _ => unreachable!(),
            };
            (4i32, 0i32, v60)
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> (i32, i32, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> (i32, i32, Rc<str>)> = Rc::new(move |mut v0: Rc<str>| -> (i32, i32, Rc<str>) {
        resume_plan_of_0(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_resume_plan(v0: &str) -> (i32, i32, Rc<str>) {
    closure0()(Rc::<str>::from(v0))
}
