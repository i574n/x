#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
fn string_concat(parts: &[&str]) -> Rc<str> {
    let mut joined = Rc::<[u8]>::new_uninit_slice(parts.iter().map(|part| part.len()).sum());
    let bytes = Rc::get_mut(&mut joined).unwrap().as_mut_ptr() as *mut u8;
    let mut at = 0;
    for part in parts {
        unsafe { std::ptr::copy_nonoverlapping(part.as_ptr(), bytes.add(at), part.len()) };
        at += part.len();
    }
    unsafe { Rc::from_raw(Rc::into_raw(joined.assume_init()) as *const str) }
}
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, i32, Rc<UH0>),
}
#[derive(Clone)]
enum US0 {
    US0_OnX,
    US0_OnMastodon,
    US0_OnBluesky(Rc<str>, Rc<str>),
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<UH1>),
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(i32, Rc<UH2>),
}
fn method5(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH1::UH1_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2;
                let v3: Rc<UH1> = v3;
                let mut v4: Rc<UH1> = Rc::new(UH1::UH1_Cons(v2, v1));
                (v0, v1) = (v3, v4);
                continue;
            }
            UH1::UH1_Nil => {
                return v1;
            }
        }
    }
}
fn method7(mut v0: Rc<Vec<char>>, mut v1: i32, mut v2: i32, mut v3: Rc<UH2>) -> Rc<UH2> {
    loop {
        let mut v4: bool = v2 >= v1;
        if v4 {
            return v3;
        } else {
            let mut v5: usize = ((v2) as usize);
            let v6: char = (v0)[v5].clone();
            let v7: i32 = v2.wrapping_add(1i32);
            let v8: u32 = u32::from(v6);
            let v9: i32 = (v8 as i32);
            let v10: Rc<UH2> = Rc::new(UH2::UH2_Cons(v9, v3));
            (v2, v3) = (v7, v10);
            continue;
        }
    }
}
fn closure2() -> Rc<dyn Fn(i32) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(i32) -> bool> = Rc::new(move |mut v0: i32| -> bool {
        let v1: bool = v0 >= 9i32;
        let v3: bool = if v1 {
            let mut v2: bool = v0 <= 13i32;
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
        let mut v11: bool = if v9 {
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
fn method8() -> Rc<dyn Fn(i32) -> bool> {
    closure2()
}
fn method9(mut v0: Rc<dyn Fn(i32) -> bool>, mut v1: Rc<UH2>) -> bool {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH2::UH2_Cons(v2, v3) => {
                let mut v2: i32 = v2;
                let v3: Rc<UH2> = v3;
                let mut v4: bool = v0(v2);
                if v4 {
                    return true;
                } else {
                    let mut v5: Rc<dyn Fn(i32) -> bool> = method8();
                    (v0, v1) = (v5, v3);
                    continue;
                }
            }
            UH2::UH2_Nil => {
                return false;
            }
        }
    }
}
fn closure1() -> Rc<dyn Fn(Rc<str>, i32) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32) -> bool> = Rc::new(move |mut v0: Rc<str>, mut v1: i32| -> bool {
        let mut v2: Rc<Vec<char>> = Rc::new((&*v0).chars().collect());
        let v3: Rc<Vec<char>> = Rc::new((v2).as_ref().iter().rev().cloned().collect::<Vec<_>>());
        let mut v4: usize = (v3).len();
        let mut v5: i32 = ((v4) as i32);
        let v6: i32 = 0i32;
        let v7: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
        let v8: Rc<UH2> = method7(v3, v5, v6, v7);
        let v9: Rc<dyn Fn(i32) -> bool> = method8();
        let v10: bool = method9(v9, v8);
        let mut v11: bool = v10 == false;
        let v12: bool = v11 == false;
        v12
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method11(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3, v4) => {
                let mut v2: Rc<str> = v2;
                let v3: i32 = v3;
                let mut v4: Rc<UH0> = v4;
                let mut v5: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2, v3, v1));
                (v0, v1) = (v4, v5);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn taken_while_10(mut v0: Rc<dyn Fn(Rc<str>, i32) -> bool>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>) {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v3, v4, v5) => {
                let v3: Rc<str> = v3.clone();
                let mut v4: i32 = *v4;
                let mut v5: Rc<UH0> = v5.clone();
                let v6: bool = v0(v3.clone(), v4);
                if v6 {
                    let v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v3, v4, v2));
                    (v1, v2) = (v5, v7);
                    continue;
                } else {
                    let v10: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let mut v11: Rc<UH0> = method11(v2, v10);
                    return (v11, v1);
                }
            }
            _ => {
                let v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let v15: Rc<UH0> = method11(v2, v14);
                return (v15, v1);
            }
        }
    }
}
fn closure3() -> Rc<dyn Fn(Rc<str>, i32) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32) -> bool> = Rc::new(move |mut v0: Rc<str>, mut v1: i32| -> bool {
        let mut v2: Rc<Vec<char>> = Rc::new((&*v0).chars().collect());
        let v3: Rc<Vec<char>> = Rc::new((v2).as_ref().iter().rev().cloned().collect::<Vec<_>>());
        let mut v4: usize = (v3).len();
        let mut v5: i32 = ((v4) as i32);
        let v6: i32 = 0i32;
        let v7: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
        let v8: Rc<UH2> = method7(v3, v5, v6, v7);
        let v9: Rc<dyn Fn(i32) -> bool> = method8();
        let v10: bool = method9(v9, v8);
        let mut v11: bool = v10 == false;
        v11
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method12(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3, v4) => {
                let mut v2: Rc<str> = v2;
                let v3: i32 = v3;
                let mut v4: Rc<UH0> = v4;
                let mut v5: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v4, v5);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn method13(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2;
            let v3: i32 = v3;
            let mut v4: Rc<UH0> = v4;
            let mut v5: Rc<UH0> = method13(v4, v1);
            Rc::new(UH0::UH0_Cons(v2, v3, v5))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn split_point_6(mut v0: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>) {
    let v1: Rc<dyn Fn(Rc<str>, i32) -> bool> = closure1();
    let mut v2: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let (mut v3, mut v4): (Rc<UH0>, Rc<UH0>) = taken_while_10(v1, v0.clone(), v2);
    let mut v5: Rc<dyn Fn(Rc<str>, i32) -> bool> = closure3();
    let v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let (mut v7, mut v8): (Rc<UH0>, Rc<UH0>) = taken_while_10(v5.clone(), v4, v6);
    let v9: bool = match &*v8 {
        UH0::UH0_Nil => {
            false
        }
        _ => {
            true
        }
    };
    let v16: bool = if v9 {
        let v10: i32 = 0i32;
        let mut v11: i32 = method12(v3.clone(), v10);
        let v12: i32 = 0i32;
        let v13: i32 = method12(v7.clone(), v12);
        let v14: i32 = v11.wrapping_add(v13);
        let v15: bool = v14 <= 60i32;
        v15
    } else {
        false
    };
    if v16 {
        let v17: Rc<UH0> = method13(v3, v7);
        (v17, v8)
    } else {
        let v18: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let (mut v19, mut v20): (Rc<UH0>, Rc<UH0>) = taken_while_10(v5, v0.clone(), v18);
        let v21: bool = match &*v20 {
            UH0::UH0_Nil => {
                false
            }
            _ => {
                true
            }
        };
        if v21 {
            (v19, v20)
        } else {
            let v22: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            (v22, v0)
        }
    }
}
fn method14(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2;
            let v3: i32 = v3;
            let mut v4: Rc<UH0> = v4;
            let mut v5: Rc<UH1> = method14(v4, v1);
            Rc::new(UH1::UH1_Cons(v2, v5))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method15(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH1>, mut v2: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH1::UH1_Cons(v3, v4) => {
                let v3: Rc<str> = v3;
                let mut v4: Rc<UH1> = v4;
                v0.borrow_mut().push(v3);
                let mut v5: i32 = v2.wrapping_add(1i32);
                (v1, v2) = (v4, v5);
                continue;
            }
            UH1::UH1_Nil => {
                return v2;
            }
        }
    }
}
fn chunk_4(mut v0: i32, mut v1: Rc<UH0>, mut v2: Rc<UH0>, mut v3: i32, mut v4: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v20, v21, v22) => {
                let v20: Rc<str> = v20.clone();
                let v21: i32 = *v21;
                let v22: Rc<UH0> = v22.clone();
                let v23: i32 = v3.wrapping_add(v21);
                let v24: bool = v23 <= v0;
                let v27: bool = if v24 {
                    true
                } else {
                    let v25: bool = match &*v2 {
                        UH0::UH0_Nil => {
                            false
                        }
                        _ => {
                            true
                        }
                    };
                    let v26: bool = v25 == false;
                    v26
                };
                if v27 {
                    let v28: Rc<UH0> = Rc::new(UH0::UH0_Cons(v20, v21, v2));
                    (v1, v2, v3) = (v22, v28, v23);
                    continue;
                } else {
                    let (mut v30, mut v31): (Rc<UH0>, Rc<UH0>) = split_point_6(v2);
                    let v32: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let v33: Rc<UH0> = method11(v30, v32);
                    let v34: Rc<UH0> = method13(v33, v1);
                    let v47: Rc<UH1> = match &*v31 {
                        UH0::UH0_Nil => {
                            v4
                        }
                        _ => {
                            let v35: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                            let v36: Rc<UH0> = method11(v31, v35);
                            let v37: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                            let v38: Rc<UH1> = method14(v36, v37);
                            let v39: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                            let v40: i32 = 0i32;
                            let v41: i32 = method15(v39.clone(), v38, v40);
                            let v42: Rc<Vec<Rc<str>>> = Rc::new(v39.borrow().clone());
                            let v43: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v42).as_ref().clone()));
                            let v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                            let v45: Rc<str> = Rc::<str>::from((*v43.borrow()).join(&*v44));
                            Rc::new(UH1::UH1_Cons(v45, v4))
                        }
                    };
                    let v48: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let v49: i32 = 0i32;
                    (v1, v2, v3, v4) = (v34, v48, v49, v47);
                    continue;
                }
            }
            UH0::UH0_Nil => {
                let v17: Rc<UH1> = match &*v2 {
                    UH0::UH0_Nil => {
                        v4
                    }
                    _ => {
                        let mut v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                        let v6: Rc<UH0> = method11(v2, v5);
                        let v7: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                        let v8: Rc<UH1> = method14(v6, v7);
                        let v9: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                        let v10: i32 = 0i32;
                        let mut v11: i32 = method15(v9.clone(), v8, v10);
                        let v12: Rc<Vec<Rc<str>>> = Rc::new(v9.borrow().clone());
                        let v13: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v12).as_ref().clone()));
                        let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                        let v15: Rc<str> = Rc::<str>::from((*v13.borrow()).join(&*v14));
                        Rc::new(UH1::UH1_Cons(v15, v4))
                    }
                };
                let v18: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                return method5(v17, v18);
            }
        }
    }
}
fn method16(mut v0: Rc<UH1>, mut v1: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH1::UH1_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2;
                let v3: Rc<UH1> = v3;
                let mut v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3, v4);
                continue;
            }
            UH1::UH1_Nil => {
                return v1;
            }
        }
    }
}
fn chunks_of_3(mut v0: i32, mut v1: Rc<str>, mut v2: Rc<dyn Fn(Rc<str>) -> i32>, mut v3: Rc<UH0>, mut v4: i32) -> Rc<UH1> {
    loop {
        let v6: Rc<str> = Rc::<str>::from((v4).to_string());
        let v10: Rc<str> = string_concat(&[&*v1, " ", &*v6, "/", &*v6, "\n"]);
        let mut v11: i32 = v2(v10);
        let v12: i32 = v0.wrapping_sub(v11);
        let v13: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v14: i32 = 0i32;
        let v15: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let v16: Rc<UH1> = chunk_4(v12, v3.clone(), v13, v14, v15);
        let v17: i32 = 0i32;
        let v18: i32 = method16(v16.clone(), v17);
        let v19: Rc<str> = Rc::<str>::from((v18).to_string());
        let v20: i32 = (v19.len() as i32);
        let v21: i32 = (v6.len() as i32);
        let v22: bool = v20 > v21;
        if v22 {
            v4 = v18;
            continue;
        } else {
            return v16;
        }
    }
}
fn split_units_2(mut v0: i32, mut v1: Rc<str>, mut v2: Rc<dyn Fn(Rc<str>) -> i32>, mut v3: Rc<UH0>) -> Rc<UH1> {
    let mut v4: i32 = 9i32;
    chunks_of_3(v0, v1, v2, v3, v4)
}
fn method17(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2;
            let v3: Rc<UH1> = v3;
            let mut v4: Rc<UH1> = method17(v3, v1);
            let mut v5: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v2).to_string());
            Rc::new(UH1::UH1_Cons(v5, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn chunks_by_1(mut v0: Rc<dyn Fn(Rc<str>) -> i32>, mut v1: Rc<UH0>, mut v2: US0, mut v3: i32) -> Rc<str> {
    let v8: i32 = match v2 {
        US0::US0_OnBluesky(v4, v5) => {
            let mut v4: Rc<str> = v4;
            let mut v5: Rc<str> = v5;
            300i32
        }
        US0::US0_OnMastodon => {
            500i32
        }
        US0::US0_OnX => {
            280i32
        }
    };
    let v9: Rc<str> = Rc::<str>::from((v3).to_string());
    let v10: Rc<str> = string_concat(&["c", &*v9]);
    let mut v11: Rc<UH1> = split_units_2(v8, v10, v0, v1);
    let v12: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v13: Rc<UH1> = method17(v11, v12);
    let v14: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v15: i32 = 0i32;
    let v16: i32 = method15(v14.clone(), v13, v15);
    let v17: Rc<Vec<Rc<str>>> = Rc::new(v14.borrow().clone());
    let v18: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v17).as_ref().clone()));
    let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let v20: Rc<str> = Rc::<str>::from((*v18.borrow()).join(&*v19));
    let v22: Rc<str> = string_concat(&["[", &*v20, "]"]);
    v22
}
fn closure4(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> i32> {
    Rc::new(move |mut v1: Rc<str>| -> i32 {
        let mut v2: i32 = xc_weights::xc_weight(&*v0, &*v1);
        v2
    })
}
fn from_18(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2;
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("glyph"); } LIT.with(|lit| lit.clone()) };
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
fn chunks_json_0(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>) -> Rc<str> {
    let v3: Rc<dyn Fn(Rc<str>) -> i32> = closure4(v0.clone());
    let mut v4: Rc<str> = xc_weights::xc_units(&*v0, &*v2);
    let mut v5: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v4).unwrap_or_default();
    let v6: usize = v5.as_array().map_or(0, Vec::len);
    let v7: i32 = ((v6) as i32);
    let v8: i32 = v7.wrapping_sub(1i32);
    let v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v10: Rc<UH0> = from_18(v5, v8, v9);
    let mut v11: bool = &*v0 == "mastodon";
    let v18: US0 = if v11 {
        US0::US0_OnMastodon
    } else {
        let v13: bool = &*v0 == "bluesky";
        if v13 {
            let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            US0::US0_OnBluesky(v14.clone(), v14)
        } else {
            US0::US0_OnX
        }
    };
    chunks_by_1(v3, v10, v18, v1)
}
fn closure0() -> Rc<dyn Fn(Rc<str>, i32, Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32, Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>| -> Rc<str> {
        chunks_json_0(v0, v1, v2)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_cell_chunks(v0: &str, v1: i32, v2: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0), v1, Rc::<str>::from(v2))
}
