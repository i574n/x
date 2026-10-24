#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<UH0>, Rc<UH1>),
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(Rc<str>, i32, Rc<UH2>),
}
fn method2(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
                let mut v4: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2.clone(), v1.clone()));
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH0::UH0_Nil => {
                return v1.clone();
            }
        }
    }
}
fn split_on_3(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let mut v2: i32 = v1.find(&*v0).map(|i| i as i32).unwrap_or(-1);
    let mut v3: bool = v2 < 0i32;
    if v3 {
        let mut v4: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1.clone(), v4.clone()))
    } else {
        let mut v6: Rc<str> = Rc::<str>::from(&(v1)[((0i32) as usize)..(((0i32) + (v2)) as usize)]);
        let mut v7: i32 = v2.wrapping_add(1i32);
        let mut v8: i32 = (v1.clone().len() as i32);
        let mut v9: i32 = v8.wrapping_sub(v2);
        let mut v10: i32 = v9.wrapping_sub(1i32);
        let mut v11: Rc<str> = Rc::<str>::from(&(v1)[((v7) as usize)..(((v7) + (v10)) as usize)]);
        let mut v12: Rc<UH0> = split_on_3(v0.clone(), v11.clone());
        Rc::new(UH0::UH0_Cons(v6.clone(), v12.clone()))
    }
}
fn method6(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method6(v4.clone(), v1.clone(), v2.clone());
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v6));
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v5));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
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
fn graphemes_from_7(mut v0: Rc<str>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v2: i32 = unicode_segmentation::UnicodeSegmentation::graphemes(&*v0, true).next().map_or(0, |g| g.len()) as i32;
        let mut v3: bool = v2 == 0i32;
        if v3 {
            let mut v4: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            return method2(v1.clone(), v4.clone());
        } else {
            let mut v6: i32 = (v0.clone().len() as i32);
            let mut v7: i32 = v6.wrapping_sub(v2);
            let mut v8: Rc<str> = Rc::<str>::from(&(v0)[((v2) as usize)..(((v2) + (v7)) as usize)]);
            let mut v9: Rc<str> = Rc::<str>::from(&(v0)[((0i32) as usize)..(((0i32) + (v2)) as usize)]);
            let mut v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9.clone(), v1.clone()));
            (v0, v1) = (v8.clone(), v10.clone());
            continue;
        }
    }
}
fn without_blank_tail_8(mut v0: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v1, v2) => {
                let mut v1: Rc<str> = v1.clone();
                let mut v2: Rc<UH0> = v2.clone();
                let mut v3: bool = (&*v1).trim().is_empty();
                if v3 {
                    v0 = v2.clone();
                    continue;
                } else {
                    return v0.clone();
                }
            }
            _ => {
                return v0.clone();
            }
        }
    }
}
fn method9(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method9(v4.clone(), v1.clone(), v2.clone());
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v6));
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v5));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
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
fn with_blanks_10(mut v0: i32, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v2: bool = v0 <= 0i32;
        if v2 {
            return v1.clone();
        } else {
            let mut v3: i32 = v0.wrapping_sub(1i32);
            let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v5: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v1.clone()));
            (v0, v1) = (v3, v5.clone());
            continue;
        }
    }
}
fn step_5(mut v0: Rc<UH0>, mut v1: Rc<UH0>, mut v2: i32, mut v3: bool, mut v4: Rc<str>) -> (Rc<UH0>, Rc<UH0>, i32, bool) {
    let mut v5: bool = v4.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v41, mut v42, mut v43, mut v44): (Rc<UH0>, Rc<UH0>, i32, bool) = if v5 {
        let mut v6: i32 = v2.wrapping_add(1i32);
        (v0.clone(), v1.clone(), v6, v3)
    } else {
        let mut v7: bool = v2 > 0i32;
        let mut v8: bool = v7 && v3;
        let mut v15: bool = if v8 {
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
            let mut v10: bool = v4.starts_with(&*v9);
            let mut v13: bool = if v10 {
                true
            } else {
                let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
                let mut v12: bool = v4.starts_with(&*v11);
                v12
            };
            let mut v14: bool = v13 == false;
            v14
        } else {
            false
        };
        let (mut v37, mut v38, mut v39, mut v40): (Rc<UH0>, Rc<UH0>, i32, bool) = if v15 {
            let mut v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v17: Rc<UH0> = method2(v1.clone(), v16.clone());
            let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v19, mut v20): (Rc<str>, Rc<str>) = method6(v17.clone(), v18.clone(), v18.clone());
            let mut v21: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v22: Rc<UH0> = graphemes_from_7(v19.clone(), v21.clone());
            let mut v23: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v24: Rc<UH0> = method2(v22.clone(), v23.clone());
            let mut v25: Rc<UH0> = without_blank_tail_8(v24.clone());
            let mut v26: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v27: Rc<UH0> = method2(v25.clone(), v26.clone());
            let (mut v28, mut v29): (Rc<str>, Rc<str>) = method9(v27.clone(), v18.clone(), v18.clone());
            let mut v30: i32 = v2.wrapping_sub(1i32);
            let mut v31: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v32: Rc<UH0> = with_blanks_10(v30, v31.clone());
            let mut v33: Rc<UH0> = Rc::new(UH0::UH0_Cons(v28.clone(), v0.clone()));
            let mut v34: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v32.clone()));
            (v33.clone(), v34.clone(), 0i32, true)
        } else {
            let mut v35: Rc<UH0> = with_blanks_10(v2, v1.clone());
            let mut v36: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v35.clone()));
            (v0.clone(), v36.clone(), 0i32, true)
        };
        (v37.clone(), v38.clone(), v39, v40)
    };
    (v41.clone(), v42.clone(), v43, v44)
}
fn method4(mut v0: Rc<UH0>, mut v1: Rc<UH0>, mut v2: Rc<UH0>, mut v3: i32, mut v4: bool) -> (Rc<UH0>, Rc<UH0>, i32, bool) {
    let (mut v19, mut v20, mut v21, mut v22): (Rc<UH0>, Rc<UH0>, i32, bool) = match &*v0 {
        UH0::UH0_Cons(v5, v6) => {
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH0> = v6.clone();
            let (mut v7, mut v8, mut v9, mut v10): (Rc<UH0>, Rc<UH0>, i32, bool) = step_5(v1.clone(), v2.clone(), v3, v4, v5.clone());
            method4(v6.clone(), v7.clone(), v8.clone(), v9, v10)
        }
        _ => {
            let (mut v15, mut v16, mut v17, mut v18): (Rc<UH0>, Rc<UH0>, i32, bool) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1.clone(), v2.clone(), v3, v4)
                }
                _ => unreachable!(),
            };
            (v15.clone(), v16.clone(), v17, v18)
        }
    };
    (v19.clone(), v20.clone(), v21, v22)
}
fn file_cells_1(mut v0: Rc<str>) -> Rc<UH0> {
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let mut v3: Rc<str> = Rc::<str>::from(v0.replace(&*v1, &*v2));
    let mut v4: bool = v3.ends_with(&*v2);
    let mut v8: Rc<str> = if v4 {
        let mut v5: i32 = (v3.clone().len() as i32);
        let mut v6: i32 = v5.wrapping_sub(1i32);
        let mut v7: Rc<str> = Rc::<str>::from(&(v3)[((0i32) as usize)..(((0i32) + (v6)) as usize)]);
        v7.clone()
    } else {
        v3.clone()
    };
    let mut v9: bool = v8.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    if v9 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v11: Rc<UH0> = split_on_3(v2.clone(), v8.clone());
        let mut v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v13: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v14: i32 = 0i32;
        let mut v15: bool = false;
        let (mut v16, mut v17, mut v18, mut v19): (Rc<UH0>, Rc<UH0>, i32, bool) = method4(v11.clone(), v12.clone(), v13.clone(), v14, v15);
        let mut v20: Rc<UH0> = with_blanks_10(v18, v17.clone());
        let mut v21: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v22: Rc<UH0> = method2(v20.clone(), v21.clone());
        let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let (mut v24, mut v25): (Rc<str>, Rc<str>) = method6(v22.clone(), v23.clone(), v23.clone());
        let mut v26: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v27: Rc<UH0> = graphemes_from_7(v24.clone(), v26.clone());
        let mut v28: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v29: Rc<UH0> = method2(v27.clone(), v28.clone());
        let mut v30: Rc<UH0> = without_blank_tail_8(v29.clone());
        let mut v31: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v32: Rc<UH0> = method2(v30.clone(), v31.clone());
        let (mut v33, mut v34): (Rc<str>, Rc<str>) = method9(v32.clone(), v23.clone(), v23.clone());
        let mut v35: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v36: Rc<UH0> = Rc::new(UH0::UH0_Cons(v33.clone(), v35.clone()));
        method2(v16.clone(), v36.clone())
    }
}
fn numbered_13(mut v0: Rc<str>, mut v1: i32, mut v2: i32, mut v3: Rc<UH0>, mut v4: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v3 {
            UH0::UH0_Cons(v7, v8) => {
                let mut v7: Rc<str> = v7.clone();
                let mut v8: Rc<UH0> = v8.clone();
                let mut v9: i32 = v2.wrapping_add(1i32);
                let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
                let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v10));
                let mut v12: Rc<str> = Rc::<str>::from(format!("{:?}", v2));
                let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v12));
                let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
                let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v14));
                let mut v16: Rc<str> = Rc::<str>::from(format!("{:?}", v1));
                let mut v17: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v16));
                let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v18));
                let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v7));
                let mut v21: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let mut v22: Rc<UH0> = graphemes_from_7(v20.clone(), v21.clone());
                let mut v23: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let mut v24: Rc<UH0> = method2(v22.clone(), v23.clone());
                let mut v25: Rc<UH0> = without_blank_tail_8(v24.clone());
                let mut v26: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let mut v27: Rc<UH0> = method2(v25.clone(), v26.clone());
                let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let (mut v29, mut v30): (Rc<str>, Rc<str>) = method9(v27.clone(), v28.clone(), v28.clone());
                let mut v31: Rc<UH0> = Rc::new(UH0::UH0_Cons(v29.clone(), v4.clone()));
                (v0, v1, v2, v3, v4) = (v0.clone(), v1, v9, v8.clone(), v31.clone());
                continue;
            }
            UH0::UH0_Nil => {
                let mut v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                return method2(v4.clone(), v5.clone());
            }
        }
    }
}
fn closure1() -> Rc<dyn Fn(Rc<str>, i32) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32) -> bool> = Rc::new(move |mut v0: Rc<str>, mut v1: i32| -> bool {
        let mut v2: bool = (&*v0).trim().is_empty();
        let mut v3: bool = v2 == false;
        v3
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method19(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    loop {
        match &*v0 {
            UH2::UH2_Cons(v2, v3, v4) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: i32 = *v3;
                let mut v4: Rc<UH2> = v4.clone();
                let mut v5: Rc<UH2> = Rc::new(UH2::UH2_Cons(v2.clone(), v3, v1.clone()));
                (v0, v1) = (v4.clone(), v5.clone());
                continue;
            }
            UH2::UH2_Nil => {
                return v1.clone();
            }
        }
    }
}
fn taken_while_18(mut v0: Rc<dyn Fn(Rc<str>, i32) -> bool>, mut v1: Rc<UH2>, mut v2: Rc<UH2>) -> (Rc<UH2>, Rc<UH2>) {
    loop {
        match &*v1 {
            UH2::UH2_Cons(v3, v4, v5) => {
                let mut v3: Rc<str> = v3.clone();
                let mut v4: i32 = *v4;
                let mut v5: Rc<UH2> = v5.clone();
                let mut v6: bool = v0(v3.clone(), v4);
                if v6 {
                    let mut v7: Rc<UH2> = Rc::new(UH2::UH2_Cons(v3.clone(), v4, v2.clone()));
                    (v0, v1, v2) = (v0.clone(), v5.clone(), v7.clone());
                    continue;
                } else {
                    let mut v10: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let mut v11: Rc<UH2> = method19(v2.clone(), v10.clone());
                    return (v11.clone(), v1.clone());
                }
            }
            _ => {
                let mut v14: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                let mut v15: Rc<UH2> = method19(v2.clone(), v14.clone());
                return (v15.clone(), v1.clone());
            }
        }
    }
}
fn closure2() -> Rc<dyn Fn(Rc<str>, i32) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32) -> bool> = Rc::new(move |mut v0: Rc<str>, mut v1: i32| -> bool {
        let mut v2: bool = (&*v0).trim().is_empty();
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method20(mut v0: Rc<UH2>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH2::UH2_Cons(v2, v3, v4) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: i32 = *v3;
                let mut v4: Rc<UH2> = v4.clone();
                let mut v5: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v4.clone(), v5);
                continue;
            }
            UH2::UH2_Nil => {
                return v1;
            }
        }
    }
}
fn method21(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: i32 = *v3;
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH2> = method21(v4.clone(), v1.clone());
            Rc::new(UH2::UH2_Cons(v2.clone(), v3, v5.clone()))
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn split_point_17(mut v0: Rc<UH2>) -> (Rc<UH2>, Rc<UH2>) {
    let mut v1: Rc<dyn Fn(Rc<str>, i32) -> bool> = closure1();
    let mut v2: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let (mut v3, mut v4): (Rc<UH2>, Rc<UH2>) = taken_while_18(v1.clone(), v0.clone(), v2.clone());
    let mut v5: Rc<dyn Fn(Rc<str>, i32) -> bool> = closure2();
    let mut v6: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let (mut v7, mut v8): (Rc<UH2>, Rc<UH2>) = taken_while_18(v5.clone(), v4.clone(), v6.clone());
    let mut v9: bool = match &*v8 {
        UH2::UH2_Nil => {
            false
        }
        _ => {
            true
        }
    };
    let mut v16: bool = if v9 {
        let mut v10: i32 = 0i32;
        let mut v11: i32 = method20(v3.clone(), v10);
        let mut v12: i32 = 0i32;
        let mut v13: i32 = method20(v7.clone(), v12);
        let mut v14: i32 = v11.wrapping_add(v13);
        let mut v15: bool = v14 <= 60i32;
        v15
    } else {
        false
    };
    if v16 {
        let mut v17: Rc<UH2> = method21(v3.clone(), v7.clone());
        (v17.clone(), v8.clone())
    } else {
        let mut v18: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
        let (mut v19, mut v20): (Rc<UH2>, Rc<UH2>) = taken_while_18(v5.clone(), v0.clone(), v18.clone());
        let mut v21: bool = match &*v20 {
            UH2::UH2_Nil => {
                false
            }
            _ => {
                true
            }
        };
        if v21 {
            (v19.clone(), v20.clone())
        } else {
            let mut v22: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            (v22.clone(), v0.clone())
        }
    }
}
fn method22(mut v0: Rc<UH2>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: i32 = *v3;
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH0> = method22(v4.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v2.clone(), v5.clone()))
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn chunk_16(mut v0: i32, mut v1: Rc<UH2>, mut v2: Rc<UH2>, mut v3: i32, mut v4: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v1 {
            UH2::UH2_Cons(v16, v17, v18) => {
                let mut v16: Rc<str> = v16.clone();
                let mut v17: i32 = *v17;
                let mut v18: Rc<UH2> = v18.clone();
                let mut v19: i32 = v3.wrapping_add(v17);
                let mut v20: bool = v19 <= v0;
                let mut v23: bool = if v20 {
                    true
                } else {
                    let mut v21: bool = match &*v2 {
                        UH2::UH2_Nil => {
                            false
                        }
                        _ => {
                            true
                        }
                    };
                    let mut v22: bool = v21 == false;
                    v22
                };
                if v23 {
                    let mut v24: Rc<UH2> = Rc::new(UH2::UH2_Cons(v16.clone(), v17, v2.clone()));
                    (v0, v1, v2, v3, v4) = (v0, v18.clone(), v24.clone(), v19, v4.clone());
                    continue;
                } else {
                    let (mut v26, mut v27): (Rc<UH2>, Rc<UH2>) = split_point_17(v2.clone());
                    let mut v28: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let mut v29: Rc<UH2> = method19(v26.clone(), v28.clone());
                    let mut v30: Rc<UH2> = method21(v29.clone(), v1.clone());
                    let mut v39: Rc<UH0> = match &*v27 {
                        UH2::UH2_Nil => {
                            v4.clone()
                        }
                        _ => {
                            let mut v31: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                            let mut v32: Rc<UH2> = method19(v27.clone(), v31.clone());
                            let mut v33: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                            let mut v34: Rc<UH0> = method22(v32.clone(), v33.clone());
                            let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                            let (mut v36, mut v37): (Rc<str>, Rc<str>) = method9(v34.clone(), v35.clone(), v35.clone());
                            Rc::new(UH0::UH0_Cons(v36.clone(), v4.clone()))
                        }
                    };
                    let mut v40: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let mut v41: i32 = 0i32;
                    (v0, v1, v2, v3, v4) = (v0, v30.clone(), v40.clone(), v41, v39.clone());
                    continue;
                }
            }
            UH2::UH2_Nil => {
                let mut v13: Rc<UH0> = match &*v2 {
                    UH2::UH2_Nil => {
                        v4.clone()
                    }
                    _ => {
                        let mut v5: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                        let mut v6: Rc<UH2> = method19(v2.clone(), v5.clone());
                        let mut v7: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                        let mut v8: Rc<UH0> = method22(v6.clone(), v7.clone());
                        let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                        let (mut v10, mut v11): (Rc<str>, Rc<str>) = method9(v8.clone(), v9.clone(), v9.clone());
                        Rc::new(UH0::UH0_Cons(v10.clone(), v4.clone()))
                    }
                };
                let mut v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                return method2(v13.clone(), v14.clone());
            }
        }
    }
}
fn method23(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
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
fn chunks_of_15(mut v0: i32, mut v1: Rc<str>, mut v2: Rc<UH2>, mut v3: i32) -> Rc<UH0> {
    loop {
        let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
        let mut v5: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v4));
        let mut v6: Rc<str> = Rc::<str>::from(format!("{:?}", v3));
        let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v6));
        let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
        let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v8));
        let mut v10: Rc<str> = Rc::<str>::from(format!("{:?}", v3));
        let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v10));
        let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
        let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v12));
        let mut v14: i32 = (&*v13).chars().map(|c| match c as u32 { 0..=4351 | 8192..=8205 | 8208..=8223 | 8242..=8247 => 1, _ => 2 }).sum::<i32>();
        let mut v15: i32 = v0.wrapping_sub(v14);
        let mut v16: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
        let mut v17: i32 = 0i32;
        let mut v18: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v19: Rc<UH0> = chunk_16(v15, v2.clone(), v16.clone(), v17, v18.clone());
        let mut v20: i32 = 0i32;
        let mut v21: i32 = method23(v19.clone(), v20);
        let mut v22: Rc<str> = Rc::<str>::from(format!("{:?}", v21));
        let mut v23: i32 = (v22.clone().len() as i32);
        let mut v24: Rc<str> = Rc::<str>::from(format!("{:?}", v3));
        let mut v25: i32 = (v24.clone().len() as i32);
        let mut v26: bool = v23 > v25;
        if v26 {
            (v0, v1, v2, v3) = (v0, v1.clone(), v2.clone(), v21);
            continue;
        } else {
            return v19.clone();
        }
    }
}
fn defused_25(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<UH2>) -> Rc<UH2> {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v5, v6) => {
                let mut v5: Rc<str> = v5.clone();
                let mut v6: Rc<UH0> = v6.clone();
                let mut v11: Rc<str> = match &*v6 {
                    UH0::UH0_Cons(v7, v8) => {
                        let mut v7: Rc<str> = v7.clone();
                        let mut v8: Rc<UH0> = v8.clone();
                        v7.clone()
                    }
                    UH0::UH0_Nil => {
                        let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                        v9.clone()
                    }
                };
                let mut v12: bool = v5.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("."); } LIT.with(|lit| lit.clone()) };
                let mut v21: bool = if v12 {
                    let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"); } LIT.with(|lit| lit.clone()) };
                    let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789_-"); } LIT.with(|lit| lit.clone()) };
                    let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-"); } LIT.with(|lit| lit.clone()) };
                    let mut v16: i32 = (v0.clone().len() as i32);
                    let mut v17: bool = v16 == 1i32;
                    if v17 {
                        let mut v18: i32 = v15.find(&*v0).map(|i| i as i32).unwrap_or(-1);
                        let mut v19: bool = v18 >= 0i32;
                        v19
                    } else {
                        false
                    }
                } else {
                    false
                };
                let mut v28: bool = if v21 {
                    let mut v22: i32 = (v11.clone().len() as i32);
                    let mut v23: bool = v22 == 1i32;
                    if v23 {
                        let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"); } LIT.with(|lit| lit.clone()) };
                        let mut v25: i32 = v24.find(&*v11).map(|i| i as i32).unwrap_or(-1);
                        let mut v26: bool = v25 >= 0i32;
                        v26
                    } else {
                        false
                    }
                } else {
                    false
                };
                let (mut v36, mut v37): (Rc<str>, i32) = if v28 {
                    let mut v29: Rc<str> = Rc::<str>::from(char::from_u32(8203i32 as u32).map(|c| c.to_string()).unwrap_or_default());
                    let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("."); } LIT.with(|lit| lit.clone()) };
                    let mut v31: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v30));
                    let mut v32: Rc<str> = Rc::<str>::from(char::from_u32(8203i32 as u32).map(|c| c.to_string()).unwrap_or_default());
                    let mut v33: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v30));
                    let mut v34: i32 = (&*v33).chars().map(|c| match c as u32 { 0..=4351 | 8192..=8205 | 8208..=8223 | 8242..=8247 => 1, _ => 2 }).sum::<i32>();
                    (v31.clone(), v34)
                } else {
                    let mut v35: i32 = (&*v5).chars().map(|c| match c as u32 { 0..=4351 | 8192..=8205 | 8208..=8223 | 8242..=8247 => 1, _ => 2 }).sum::<i32>();
                    (v5.clone(), v35)
                };
                let mut v38: Rc<UH2> = Rc::new(UH2::UH2_Cons(v36.clone(), v37, v2.clone()));
                (v0, v1, v2) = (v5.clone(), v6.clone(), v38.clone());
                continue;
            }
            UH0::UH0_Nil => {
                let mut v3: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                return method19(v2.clone(), v3.clone());
            }
        }
    }
}
fn units_of_24(mut v0: Rc<str>) -> Rc<UH2> {
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v2: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v3: Rc<UH0> = graphemes_from_7(v0.clone(), v2.clone());
    let mut v4: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    defused_25(v1.clone(), v3.clone(), v4.clone())
}
fn split_cell_14(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>) -> Rc<UH0> {
    let mut v3: Rc<str> = Rc::<str>::from(unicode_normalization::UnicodeNormalization::nfc(&*v2).collect::<String>());
    let mut v4: Rc<UH2> = units_of_24(v3.clone());
    let mut v5: i32 = 9i32;
    chunks_of_15(v1, v0.clone(), v4.clone(), v5)
}
fn cell_posts_12(mut v0: i32, mut v1: Rc<str>) -> Rc<UH0> {
    let mut v2: Rc<str> = Rc::<str>::from(format!("{:?}", v0));
    let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("c"); } LIT.with(|lit| lit.clone()) };
    let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v2));
    let mut v5: i32 = 280i32;
    let mut v6: Rc<UH0> = split_cell_14(v4.clone(), v5, v1.clone());
    let mut v10: Rc<UH0> = match &*v6 {
        UH0::UH0_Nil => {
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            Rc::new(UH0::UH0_Cons(v7.clone(), v8.clone()))
        }
        _ => {
            v6.clone()
        }
    };
    let mut v11: Rc<str> = Rc::<str>::from(format!("{:?}", v0));
    let mut v12: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v11));
    let mut v13: i32 = 0i32;
    let mut v14: i32 = method23(v10.clone(), v13);
    let mut v15: i32 = 1i32;
    let mut v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    numbered_13(v12.clone(), v14, v15, v10.clone(), v16.clone())
}
fn method26(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v2, v3) => {
                let mut v2: Rc<UH0> = v2.clone();
                let mut v3: Rc<UH1> = v3.clone();
                let mut v4: Rc<UH1> = Rc::new(UH1::UH1_Cons(v2.clone(), v1.clone()));
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH1::UH1_Nil => {
                return v1.clone();
            }
        }
    }
}
fn method28(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method28(v3.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v2.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method27(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<UH0> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH0> = method27(v3.clone(), v1.clone());
            method28(v2.clone(), v4.clone())
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn thread_of_11(mut v0: i32, mut v1: Rc<UH0>, mut v2: Rc<UH1>) -> Rc<UH0> {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v7, v8) => {
                let mut v7: Rc<str> = v7.clone();
                let mut v8: Rc<UH0> = v8.clone();
                let mut v9: i32 = v0.wrapping_add(1i32);
                let mut v10: Rc<UH0> = cell_posts_12(v0, v7.clone());
                let mut v11: Rc<UH1> = Rc::new(UH1::UH1_Cons(v10.clone(), v2.clone()));
                (v0, v1, v2) = (v9, v8.clone(), v11.clone());
                continue;
            }
            UH0::UH0_Nil => {
                let mut v3: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                let mut v4: Rc<UH1> = method26(v2.clone(), v3.clone());
                let mut v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                return method27(v4.clone(), v5.clone());
            }
        }
    }
}
fn method30(mut v0: Rc<UH2>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH2::UH2_Cons(v2, v3, v4) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: i32 = *v3;
                let mut v4: Rc<UH2> = v4.clone();
                let mut v5: i32 = v1.wrapping_add(v3);
                (v0, v1) = (v4.clone(), v5);
                continue;
            }
            UH2::UH2_Nil => {
                return v1;
            }
        }
    }
}
fn method29(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method29(v3.clone(), v1.clone());
            let mut v5: Rc<UH2> = units_of_24(v2.clone());
            let mut v6: i32 = 0i32;
            let mut v7: i32 = method30(v5.clone(), v6);
            let mut v8: Rc<str> = Rc::<str>::from(serde_json::json!({"text": &*v2, "weight": v7}).to_string());
            Rc::new(UH0::UH0_Cons(v8.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method31(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method31(v4.clone(), v1.clone(), v2.clone());
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v6));
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v5));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
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
fn framed_json_0(mut v0: Rc<str>) -> Rc<str> {
    let mut v1: i32 = 1i32;
    let mut v2: Rc<UH0> = file_cells_1(v0.clone());
    let mut v3: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v4: Rc<UH0> = thread_of_11(v1, v2.clone(), v3.clone());
    let mut v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v6: Rc<UH0> = method29(v4.clone(), v5.clone());
    let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v8, mut v9): (Rc<str>, Rc<str>) = method31(v6.clone(), v7.clone(), v7.clone());
    let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
    let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v8));
    let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
    let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v12));
    v13.clone()
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        framed_json_0(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn previews_33(mut v0: i32, mut v1: i32, mut v2: Rc<UH0>, mut v3: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v2 {
            UH0::UH0_Cons(v6, v7) => {
                let mut v6: Rc<str> = v6.clone();
                let mut v7: Rc<UH0> = v7.clone();
                let mut v8: i32 = v1.wrapping_add(1i32);
                let mut v9: Rc<str> = Rc::<str>::from(format!("{:?}", v1));
                let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--- post "); } LIT.with(|lit| lit.clone()) };
                let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v9));
                let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" of "); } LIT.with(|lit| lit.clone()) };
                let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v12));
                let mut v14: Rc<str> = Rc::<str>::from(format!("{:?}", v0));
                let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v14));
                let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", weight "); } LIT.with(|lit| lit.clone()) };
                let mut v17: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v16));
                let mut v18: Rc<UH2> = units_of_24(v6.clone());
                let mut v19: i32 = 0i32;
                let mut v20: i32 = method30(v18.clone(), v19);
                let mut v21: Rc<str> = Rc::<str>::from(format!("{:?}", v20));
                let mut v22: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v21));
                let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                let mut v24: Rc<str> = Rc::<str>::from(format!("{}{}", v22, v23));
                let mut v25: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v6));
                let mut v26: Rc<UH0> = Rc::new(UH0::UH0_Cons(v25.clone(), v3.clone()));
                (v0, v1, v2, v3) = (v0, v8, v7.clone(), v26.clone());
                continue;
            }
            UH0::UH0_Nil => {
                let mut v4: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                return method2(v3.clone(), v4.clone());
            }
        }
    }
}
fn preview_32(mut v0: Rc<str>) -> Rc<str> {
    let mut v1: i32 = 1i32;
    let mut v2: Rc<UH0> = file_cells_1(v0.clone());
    let mut v3: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v4: Rc<UH0> = thread_of_11(v1, v2.clone(), v3.clone());
    let mut v5: i32 = 0i32;
    let mut v6: i32 = method23(v4.clone(), v5);
    let mut v7: i32 = 1i32;
    let mut v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v9: Rc<UH0> = previews_33(v6, v7, v4.clone(), v8.clone());
    let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = method6(v9.clone(), v10.clone(), v10.clone());
    let mut v13: Rc<str> = Rc::<str>::from(format!("{:?}", v6));
    let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n--- "); } LIT.with(|lit| lit.clone()) };
    let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v13));
    let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" posts, "); } LIT.with(|lit| lit.clone()) };
    let mut v17: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v16));
    let mut v18: i32 = v6.wrapping_mul(15i32);
    let mut v19: i32 = v18.wrapping_rem(1000i32);
    let mut v20: bool = v19 < 10i32;
    let mut v25: Rc<str> = if v20 {
        let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("00"); } LIT.with(|lit| lit.clone()) };
        v21.clone()
    } else {
        let mut v22: bool = v19 < 100i32;
        if v22 {
            let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0"); } LIT.with(|lit| lit.clone()) };
            v23.clone()
        } else {
            v10.clone()
        }
    };
    let mut v26: i32 = v18.wrapping_div(1000i32);
    let mut v27: Rc<str> = Rc::<str>::from(format!("{:?}", v26));
    let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("$"); } LIT.with(|lit| lit.clone()) };
    let mut v29: Rc<str> = Rc::<str>::from(format!("{}{}", v28, v27));
    let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("."); } LIT.with(|lit| lit.clone()) };
    let mut v31: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v30));
    let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v31, v25));
    let mut v33: Rc<str> = Rc::<str>::from(format!("{:?}", v19));
    let mut v34: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v33));
    let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v34));
    let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" to create"); } LIT.with(|lit| lit.clone()) };
    let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v36));
    let mut v38: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v37));
    v38.clone()
}
fn closure3() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        preview_32(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_frames(v0: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0))
}
pub fn xc_preview(v0: &str) -> Rc<str> {
    closure3()(Rc::<str>::from(v0))
}
