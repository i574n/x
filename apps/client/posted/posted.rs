#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum US0 {
    US0_OnX,
    US0_OnMastodon,
}
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
fn method1(mut v0: Rc<Vec<Rc<str>>>, mut v1: i32, mut v2: i32, mut v3: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v4: bool = v2 >= v1;
        if v4 {
            return v3.clone();
        } else {
            let v5: Rc<str> = (v0)[v2 as usize].clone();
            let v6: i32 = v2.wrapping_add(1i32);
            let v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v5.clone(), v3.clone()));
            (v0, v1, v2, v3) = (v0.clone(), v1, v6, v7.clone());
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
fn method4(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let v4: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2.clone(), v1.clone()));
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH0::UH0_Nil => {
                return v1.clone();
            }
        }
    }
}
fn dots_posted_2(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3.clone();
                let v4: Rc<UH0> = v4.clone();
                let v5: bool = &*v3 == ".";
                let v19: bool = if v5 {
                    let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"); } LIT.with(|lit| lit.clone()) };
                    let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789_-"); } LIT.with(|lit| lit.clone()) };
                    let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-"); } LIT.with(|lit| lit.clone()) };
                    let v9: i32 = (v0.clone().len() as i32);
                    let v10: bool = v9 == 1i32;
                    if v10 {
                        let v11: Option<usize> = v8.find(&*v0);
                        let v12: Option<usize> = method3(v11.clone());
                        let mut v13: Rc<dyn Fn((usize)) -> i32> = closure1();
                        let mut v14: Option<i32> = v12.map(|x| v13(x));
                        let v16: i32 = v14.unwrap_or(-1i32);
                        let v17: bool = v16 >= 0i32;
                        v17
                    } else {
                        false
                    }
                } else {
                    false
                };
                let v36: bool = if v19 {
                    let v24: Rc<str> = match &*v4 {
                        UH0::UH0_Cons(v20, v21) => {
                            let v20: Rc<str> = v20.clone();
                            let v21: Rc<UH0> = v21.clone();
                            v20.clone()
                        }
                        UH0::UH0_Nil => {
                            let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                            v22.clone()
                        }
                    };
                    let v25: i32 = (v24.clone().len() as i32);
                    let v26: bool = v25 == 1i32;
                    if v26 {
                        let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"); } LIT.with(|lit| lit.clone()) };
                        let v28: Option<usize> = v27.find(&*v24);
                        let v29: Option<usize> = method3(v28.clone());
                        let mut v30: Rc<dyn Fn((usize)) -> i32> = closure1();
                        let mut v31: Option<i32> = v29.map(|x| v30(x));
                        let v33: i32 = v31.unwrap_or(-1i32);
                        let v34: bool = v33 >= 0i32;
                        v34
                    } else {
                        false
                    }
                } else {
                    false
                };
                if v36 {
                    let v37: Option<char> = char::from_u32(8203u32);
                    let v39: char = v37.unwrap();
                    let v40: Rc<str> = Rc::<str>::from(format!("{}", v39));
                    let v41: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("."); } LIT.with(|lit| lit.clone()) };
                    let v42: Rc<str> = Rc::<str>::from(format!("{}{}", v40, v41));
                    let v43: Rc<UH0> = Rc::new(UH0::UH0_Cons(v42.clone(), v2.clone()));
                    (v0, v1, v2) = (v3.clone(), v4.clone(), v43.clone());
                    continue;
                } else {
                    let v45: Rc<UH0> = Rc::new(UH0::UH0_Cons(v3.clone(), v2.clone()));
                    (v0, v1, v2) = (v3.clone(), v4.clone(), v45.clone());
                    continue;
                }
            }
            UH0::UH0_Nil => {
                let v48: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                return method4(v2.clone(), v48.clone());
            }
        }
    }
}
fn method5(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method5(v4.clone(), v1.clone(), v2.clone());
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v3, v6)), v5));
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v8.clone(), v9.clone())
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1.clone(), v2.clone())
                }
                _ => unreachable!(),
            };
            (v10.clone(), v11.clone())
        }
    };
    (v12.clone(), v13.clone())
}
fn posted_named_0(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<str> {
    let v2: bool = &*v0 == "mastodon";
    let v5: US0 = if v2 {
        US0::US0_OnMastodon
    } else {
        US0::US0_OnX
    };
    match &v5 {
        US0::US0_OnMastodon => {
            v1.clone()
        }
        US0::US0_OnX => {
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let v7: Rc<Vec<Rc<str>>> = Rc::new(unicode_segmentation::UnicodeSegmentation::graphemes(&*v1, true).map(Rc::<str>::from).collect());
            let v8: Rc<Vec<Rc<str>>> = Rc::new({ let mut v = (v7).as_ref().clone(); v.reverse(); v });
            let v9: i32 = (v8).len() as i32;
            let v10: i32 = 0i32;
            let v11: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v12: Rc<UH0> = method1(v8.clone(), v9, v10, v11.clone());
            let mut v13: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v14: Rc<UH0> = dots_posted_2(v6.clone(), v12.clone(), v13.clone());
            let (mut v15, mut v16): (Rc<str>, Rc<str>) = method5(v14.clone(), v6.clone(), v6.clone());
            v15.clone()
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>| -> Rc<str> {
        posted_named_0(v0.clone(), v1.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_posted_text(v0: &str, v1: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1))
}
