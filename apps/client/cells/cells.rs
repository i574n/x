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
    UH1_Cons(i32, Rc<UH1>),
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
fn split_list_3(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let v2: Option<usize> = v1.find(&*v0);
    let v3: Option<usize> = method4(v2.clone());
    let mut v4: Rc<dyn Fn((usize)) -> i32> = closure1();
    let mut v5: Option<i32> = v3.map(|x| v4(x));
    let v7: i32 = v5.unwrap_or(-1i32);
    let v8: i32 = (v0.clone().len() as i32);
    let v9: bool = v7 < 0i32;
    let v11: bool = if v9 {
        true
    } else {
        let v10: bool = v8 == 0i32;
        v10
    };
    if v11 {
        let v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1.clone(), v12.clone()))
    } else {
        let v14: usize = ((0i32) as usize);
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
        let v25: Rc<UH0> = split_list_3(v0.clone(), v24.clone());
        Rc::new(UH0::UH0_Cons(v16.clone(), v25.clone()))
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
fn method8(mut v0: Rc<Vec<Rc<str>>>, mut v1: i32, mut v2: i32, mut v3: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v4: bool = v2 >= v1;
        if v4 {
            return v3.clone();
        } else {
            let mut v5: usize = ((v2) as usize);
            let v6: Rc<str> = (v0)[v5].clone();
            let v7: i32 = v2.wrapping_add(1i32);
            let v8: Rc<UH0> = Rc::new(UH0::UH0_Cons(v6.clone(), v3.clone()));
            (v0, v1, v2, v3) = (v0.clone(), v1, v7, v8.clone());
            continue;
        }
    }
}
fn method10(mut v0: Rc<Vec<char>>, mut v1: i32, mut v2: i32, mut v3: Rc<UH1>) -> Rc<UH1> {
    loop {
        let mut v4: bool = v2 >= v1;
        if v4 {
            return v3.clone();
        } else {
            let mut v5: usize = ((v2) as usize);
            let v6: char = (v0)[v5].clone();
            let v7: i32 = v2.wrapping_add(1i32);
            let v8: u32 = u32::from(v6);
            let v9: i32 = (v8 as i32);
            let v10: Rc<UH1> = Rc::new(UH1::UH1_Cons(v9, v3.clone()));
            (v0, v1, v2, v3) = (v0.clone(), v1, v7, v10.clone());
            continue;
        }
    }
}
fn closure2() -> Rc<dyn Fn(i32) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(i32) -> bool> = Rc::new(move |mut v0: i32| -> bool {
        let v1: bool = v0 >= 9i32;
        let v3: bool = if v1 {
            let v2: bool = v0 <= 13i32;
            v2
        } else {
            false
        };
        let mut v5: bool = if v3 {
            true
        } else {
            let mut v4: bool = v0 == 32i32;
            v4
        };
        let v7: bool = if v5 {
            true
        } else {
            let v6: bool = v0 == 133i32;
            v6
        };
        let v9: bool = if v7 {
            true
        } else {
            let v8: bool = v0 == 160i32;
            v8
        };
        let v11: bool = if v9 {
            true
        } else {
            let v10: bool = v0 == 5760i32;
            v10
        };
        let v15: bool = if v11 {
            true
        } else {
            let v12: bool = v0 >= 8192i32;
            if v12 {
                let v13: bool = v0 <= 8202i32;
                v13
            } else {
                false
            }
        };
        let v17: bool = if v15 {
            true
        } else {
            let v16: bool = v0 == 8232i32;
            v16
        };
        let v19: bool = if v17 {
            true
        } else {
            let v18: bool = v0 == 8233i32;
            v18
        };
        let v21: bool = if v19 {
            true
        } else {
            let v20: bool = v0 == 8239i32;
            v20
        };
        let v23: bool = if v21 {
            true
        } else {
            let v22: bool = v0 == 8287i32;
            v22
        };
        let v25: bool = if v23 {
            true
        } else {
            let v24: bool = v0 == 12288i32;
            v24
        };
        let v26: bool = v25 == false;
        v26
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method11() -> Rc<dyn Fn(i32) -> bool> {
    closure2()
}
fn method12(mut v0: Rc<dyn Fn(i32) -> bool>, mut v1: Rc<UH1>) -> bool {
    loop {
        match &*v1 {
            UH1::UH1_Cons(v2, v3) => {
                let v2: i32 = *v2;
                let v3: Rc<UH1> = v3.clone();
                let mut v4: bool = v0(v2);
                if v4 {
                    return true;
                } else {
                    let mut v5: Rc<dyn Fn(i32) -> bool> = method11();
                    (v0, v1) = (v5.clone(), v3.clone());
                    continue;
                }
            }
            UH1::UH1_Nil => {
                return false;
            }
        }
    }
}
fn blank_tail_length_9(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let mut v4: Rc<Vec<char>> = Rc::new((&*v2).chars().collect());
                let mut v5: Rc<Vec<char>> = Rc::new((v4).as_ref().iter().rev().cloned().collect::<Vec<_>>());
                let v6: usize = (v5).len();
                let v7: i32 = ((v6) as i32);
                let v8: i32 = 0i32;
                let v9: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                let v10: Rc<UH1> = method10(v5.clone(), v7, v8, v9.clone());
                let v11: Rc<dyn Fn(i32) -> bool> = method11();
                let v12: bool = method12(v11.clone(), v10.clone());
                let v13: bool = v12 == false;
                if v13 {
                    let v14: i32 = (v2.clone().len() as i32);
                    let v15: i32 = v1.wrapping_add(v14);
                    (v0, v1) = (v3.clone(), v15);
                    continue;
                } else {
                    return v1;
                }
            }
            _ => {
                return v1;
            }
        }
    }
}
fn with_blanks_13(mut v0: i32, mut v1: Rc<UH0>) -> Rc<UH0> {
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
    let (mut v52, mut v53, mut v54, mut v55): (Rc<UH0>, Rc<UH0>, i32, bool) = if v5 {
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
        let (mut v48, mut v49, mut v50, mut v51): (Rc<UH0>, Rc<UH0>, i32, bool) = if v15 {
            let v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v17: Rc<UH0> = method2(v1.clone(), v16.clone());
            let v18: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            let v19: i32 = 0i32;
            let v20: i32 = method7(v18.clone(), v17.clone(), v19);
            let v21: Rc<Vec<Rc<str>>> = Rc::new(v18.borrow().clone());
            let v22: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v21).as_ref().clone()));
            let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            let v24: Rc<str> = Rc::<str>::from((*v22.borrow()).join(&*v23));
            let v25: i32 = (v24.clone().len() as i32);
            let v26: Rc<Vec<Rc<str>>> = Rc::new(unicode_segmentation::UnicodeSegmentation::graphemes(&*v24, true).map(Rc::<str>::from).collect());
            let v27: Rc<Vec<Rc<str>>> = Rc::new((v26).as_ref().iter().rev().cloned().collect::<Vec<_>>());
            let v28: usize = (v27).len();
            let v29: i32 = ((v28) as i32);
            let v30: i32 = 0i32;
            let v31: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v32: Rc<UH0> = method8(v27.clone(), v29, v30, v31.clone());
            let v33: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v34: Rc<UH0> = method2(v32.clone(), v33.clone());
            let v35: i32 = 0i32;
            let v36: i32 = blank_tail_length_9(v34.clone(), v35);
            let v37: i32 = v25.wrapping_sub(v36);
            let v38: usize = ((0i32) as usize);
            let v39: usize = ((v37) as usize);
            let v40: Rc<str> = Rc::<str>::from(&(v24)[v38..v39]);
            let v41: i32 = v2.wrapping_sub(1i32);
            let v42: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v43: Rc<UH0> = with_blanks_13(v41, v42.clone());
            let v44: Rc<UH0> = Rc::new(UH0::UH0_Cons(v40.clone(), v0.clone()));
            let v45: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v43.clone()));
            (v44.clone(), v45.clone(), 0i32, true)
        } else {
            let v46: Rc<UH0> = with_blanks_13(v2, v1.clone());
            let v47: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v46.clone()));
            (v0.clone(), v47.clone(), 0i32, true)
        };
        (v48.clone(), v49.clone(), v50, v51)
    };
    (v52.clone(), v53.clone(), v54, v55)
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
        v9.clone()
    } else {
        v3.clone()
    };
    let v11: bool = &*v10 == "";
    if v11 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v13: Rc<UH0> = split_list_3(v2.clone(), v10.clone());
        let v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v15: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v16: i32 = 0i32;
        let v17: bool = false;
        let (mut v18, mut v19, mut v20, mut v21): (Rc<UH0>, Rc<UH0>, i32, bool) = method5(v13.clone(), v14.clone(), v15.clone(), v16, v17);
        let v22: Rc<UH0> = with_blanks_13(v20, v19.clone());
        let v23: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v24: Rc<UH0> = method2(v22.clone(), v23.clone());
        let v25: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
        let v26: i32 = 0i32;
        let v27: i32 = method7(v25.clone(), v24.clone(), v26);
        let v28: Rc<Vec<Rc<str>>> = Rc::new(v25.borrow().clone());
        let v29: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v28).as_ref().clone()));
        let v30: Rc<str> = Rc::<str>::from((*v29.borrow()).join(&*v2));
        let v31: i32 = (v30.clone().len() as i32);
        let v32: Rc<Vec<Rc<str>>> = Rc::new(unicode_segmentation::UnicodeSegmentation::graphemes(&*v30, true).map(Rc::<str>::from).collect());
        let v33: Rc<Vec<Rc<str>>> = Rc::new((v32).as_ref().iter().rev().cloned().collect::<Vec<_>>());
        let v34: usize = (v33).len();
        let v35: i32 = ((v34) as i32);
        let v36: i32 = 0i32;
        let v37: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v38: Rc<UH0> = method8(v33.clone(), v35, v36, v37.clone());
        let v39: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v40: Rc<UH0> = method2(v38.clone(), v39.clone());
        let v41: i32 = 0i32;
        let v42: i32 = blank_tail_length_9(v40.clone(), v41);
        let v43: i32 = v31.wrapping_sub(v42);
        let v44: usize = ((0i32) as usize);
        let v45: usize = ((v43) as usize);
        let v46: Rc<str> = Rc::<str>::from(&(v30)[v44..v45]);
        let v47: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v48: Rc<UH0> = Rc::new(UH0::UH0_Cons(v46.clone(), v47.clone()));
        method2(v18.clone(), v48.clone())
    }
}
fn method14(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method14(v3, v1.clone());
            let mut v5: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v2).to_string());
            Rc::new(UH0::UH0_Cons(v5, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn cells_json_0(mut v0: Rc<str>) -> Rc<str> {
    let v1: Rc<UH0> = file_cells_1(v0.clone());
    let v2: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v3: Rc<UH0> = method14(v1.clone(), v2.clone());
    let mut v4: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let mut v5: i32 = 0i32;
    let v6: i32 = method7(v4.clone(), v3.clone(), v5);
    let v7: Rc<Vec<Rc<str>>> = Rc::new(v4.borrow().clone());
    let v8: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v7).as_ref().clone()));
    let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let v10: Rc<str> = Rc::<str>::from((*v8.borrow()).join(&*v9));
    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
    let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v10));
    let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
    let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v13));
    v14.clone()
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        cells_json_0(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_file_cells(v0: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0))
}
