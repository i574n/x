#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
fn method2(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
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
fn method4(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure1() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn split_on_3(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let v2: Option<usize> = v1.find(&*v0);
    let v3: Option<usize> = method4(v2);
    let mut v4: Rc<dyn Fn((usize)) -> i32> = closure1();
    let mut v5: Option<i32> = v3.map(|x| v4(x));
    let v7: i32 = v5.unwrap_or(-1i32);
    let v8: bool = v7 < 0i32;
    if v8 {
        let v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1.clone(), v9))
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
        let v22: Rc<UH0> = split_on_3(v0, v21);
        Rc::new(UH0::UH0_Cons(v13, v22))
    }
}
fn method7(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method7(v4, v1.clone(), v2.clone());
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v3, v6)), v5));
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
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
fn method8(mut v0: Rc<Vec<Rc<str>>>, mut v1: i32, mut v2: i32, mut v3: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v4: bool = v2 >= v1;
        if v4 {
            return v3.clone();
        } else {
            let mut v5: Rc<str> = (v0)[v2 as usize].clone();
            let v6: i32 = v2.wrapping_add(1i32);
            let v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v5.clone(), v3.clone()));
            (v0, v1, v2, v3) = (v0.clone(), v1, v6, v7.clone());
            continue;
        }
    }
}
fn without_blank_tail_9(mut v0: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v1, v2) => {
                let v1: Rc<str> = v1.clone();
                let v2: Rc<UH0> = v2.clone();
                let v3: bool = (&*v1).trim().is_empty();
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
fn method10(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method10(v4, v1.clone(), v2.clone());
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v3, v6)), v5));
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
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
fn with_blanks_11(mut v0: i32, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v2: bool = v0 <= 0i32;
        if v2 {
            return v1.clone();
        } else {
            let v3: i32 = v0.wrapping_sub(1i32);
            let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v5: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v1.clone()));
            (v0, v1) = (v3, v5.clone());
            continue;
        }
    }
}
fn step_6(mut v0: Rc<UH0>, mut v1: Rc<UH0>, mut v2: i32, mut v3: bool, mut v4: Rc<str>) -> (Rc<UH0>, Rc<UH0>, i32, bool) {
    let mut v5: bool = &*v4 == "";
    let (mut v45, mut v46, mut v47, mut v48): (Rc<UH0>, Rc<UH0>, i32, bool) = if v5 {
        let v6: i32 = v2.wrapping_add(1i32);
        (v0.clone(), v1.clone(), v6, v3)
    } else {
        let v7: bool = v2 > 0i32;
        let v8: bool = v7 && v3;
        let v15: bool = if v8 {
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
            let v10: bool = v4.starts_with(&*v9);
            let v13: bool = if v10 {
                true
            } else {
                let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
                let v12: bool = v4.starts_with(&*v11);
                v12
            };
            let v14: bool = v13 == false;
            v14
        } else {
            false
        };
        let (mut v41, mut v42, mut v43, mut v44): (Rc<UH0>, Rc<UH0>, i32, bool) = if v15 {
            let v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v17: Rc<UH0> = method2(v1.clone(), v16);
            let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v19, mut v20): (Rc<str>, Rc<str>) = method7(v17, v18.clone(), v18.clone());
            let v21: Rc<Vec<Rc<str>>> = Rc::new(unicode_segmentation::UnicodeSegmentation::graphemes(&*v19, true).map(Rc::<str>::from).collect());
            let v22: Rc<Vec<Rc<str>>> = Rc::new({ let mut v = (v21).as_ref().clone(); v.reverse(); v });
            let v23: i32 = (v22).len() as i32;
            let v24: i32 = 0i32;
            let v25: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v26: Rc<UH0> = method8(v22, v23, v24, v25);
            let v27: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v28: Rc<UH0> = method2(v26, v27);
            let v29: Rc<UH0> = without_blank_tail_9(v28);
            let v30: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v31: Rc<UH0> = method2(v29, v30);
            let (mut v32, mut v33): (Rc<str>, Rc<str>) = method10(v31, v18.clone(), v18);
            let v34: i32 = v2.wrapping_sub(1i32);
            let v35: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v36: Rc<UH0> = with_blanks_11(v34, v35);
            let v37: Rc<UH0> = Rc::new(UH0::UH0_Cons(v32, v0.clone()));
            let v38: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v36));
            (v37, v38, 0i32, true)
        } else {
            let v39: Rc<UH0> = with_blanks_11(v2, v1);
            let v40: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4, v39));
            (v0, v40, 0i32, true)
        };
        (v41, v42, v43, v44)
    };
    (v45, v46, v47, v48)
}
fn method5(mut v0: Rc<UH0>, mut v1: Rc<UH0>, mut v2: Rc<UH0>, mut v3: i32, mut v4: bool) -> (Rc<UH0>, Rc<UH0>, i32, bool) {
    let (mut v19, mut v20, mut v21, mut v22): (Rc<UH0>, Rc<UH0>, i32, bool) = match &*v0 {
        UH0::UH0_Cons(v5, v6) => {
            let mut v5: Rc<str> = v5.clone();
            let v6: Rc<UH0> = v6.clone();
            let (mut v7, mut v8, mut v9, mut v10): (Rc<UH0>, Rc<UH0>, i32, bool) = step_6(v1.clone(), v2.clone(), v3, v4, v5);
            method5(v6, v7, v8, v9, v10)
        }
        _ => {
            let (mut v15, mut v16, mut v17, mut v18): (Rc<UH0>, Rc<UH0>, i32, bool) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1, v2, v3, v4)
                }
                _ => unreachable!(),
            };
            (v15, v16, v17, v18)
        }
    };
    (v19, v20, v21, v22)
}
fn file_cells_1(mut v0: Rc<str>) -> Rc<UH0> {
    let v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
    let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let v3: Rc<str> = Rc::<str>::from(v0.replace(&*v1, &*v2));
    let mut v4: bool = v3.ends_with(&*v2);
    let v10: Rc<str> = if v4 {
        let mut v5: i32 = (v3.clone().len() as i32);
        let v6: i32 = v5.wrapping_sub(1i32);
        let v7: usize = ((0i32) as usize);
        let v8: usize = ((v6) as usize);
        let v9: Rc<str> = Rc::<str>::from(&(v3)[v7..v8]);
        v9
    } else {
        v3
    };
    let v11: bool = &*v10 == "";
    if v11 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v13: Rc<UH0> = split_on_3(v2, v10);
        let v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v15: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v16: i32 = 0i32;
        let v17: bool = false;
        let (mut v18, mut v19, mut v20, mut v21): (Rc<UH0>, Rc<UH0>, i32, bool) = method5(v13, v14, v15, v16, v17);
        let v22: Rc<UH0> = with_blanks_11(v20, v19);
        let v23: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v24: Rc<UH0> = method2(v22, v23);
        let v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let (mut v26, mut v27): (Rc<str>, Rc<str>) = method7(v24, v25.clone(), v25.clone());
        let v28: Rc<Vec<Rc<str>>> = Rc::new(unicode_segmentation::UnicodeSegmentation::graphemes(&*v26, true).map(Rc::<str>::from).collect());
        let v29: Rc<Vec<Rc<str>>> = Rc::new({ let mut v = (v28).as_ref().clone(); v.reverse(); v });
        let v30: i32 = (v29).len() as i32;
        let v31: i32 = 0i32;
        let v32: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v33: Rc<UH0> = method8(v29, v30, v31, v32);
        let v34: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v35: Rc<UH0> = method2(v33, v34);
        let v36: Rc<UH0> = without_blank_tail_9(v35);
        let v37: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v38: Rc<UH0> = method2(v36, v37);
        let (mut v39, mut v40): (Rc<str>, Rc<str>) = method10(v38, v25.clone(), v25);
        let v41: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v42: Rc<UH0> = Rc::new(UH0::UH0_Cons(v39, v41));
        method2(v18, v42)
    }
}
fn method12(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method12(v3, v1.clone());
            let mut v5: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v2).to_string());
            Rc::new(UH0::UH0_Cons(v5, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method13(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method13(v4, v1.clone(), v2.clone());
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
fn cells_json_0(mut v0: Rc<str>) -> Rc<str> {
    let v1: Rc<UH0> = file_cells_1(v0);
    let v2: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v3: Rc<UH0> = method12(v1, v2);
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v5, mut v6): (Rc<str>, Rc<str>) = method13(v3, v4.clone(), v4);
    let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
    let v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v5));
    let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
    let v10: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v9));
    v10
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        cells_json_0(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_file_cells(v0: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0))
}
