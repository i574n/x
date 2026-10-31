#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum US0 {
    US0_Some(Rc<str>),
    US0_None,
}
struct Heap0 { l0: Rc<str>, l1: i32, l2: i32, l3: Rc<str>, l4: Rc<str>, l5: US0 }
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<Heap0>, Rc<UH0>),
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<UH1>),
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(Rc<str>, Rc<UH2>),
}
#[derive(Clone)]
enum UH4 {
    UH4_Nil,
    UH4_Cons(i32, Rc<UH4>),
}
#[derive(Clone)]
enum US1 {
    US1_MissingFrames(Rc<str>, Rc<UH4>, i32),
    US1_ReplyGap(Rc<str>, Rc<str>),
}
#[derive(Clone)]
enum UH3 {
    UH3_Nil,
    UH3_Cons(US1, Rc<UH3>),
}
#[derive(Clone)]
enum UH5 {
    UH5_Nil,
    UH5_Cons(Rc<str>, i32, Rc<str>, Rc<UH0>, Rc<UH5>),
}
#[derive(Clone)]
enum US2 {
    US2_Whole(Rc<str>),
    US2_Holed(US1),
}
fn from_1(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cell"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("k"); } LIT.with(|lit| lit.clone()) };
            let mut v11: serde_json::Value = v6.get(&*v10).cloned().unwrap_or_default();
            let v12: i64 = v11.as_i64().unwrap_or(0);
            let v13: i32 = (v12 as i32);
            let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("n"); } LIT.with(|lit| lit.clone()) };
            let mut v15: serde_json::Value = v6.get(&*v14).cloned().unwrap_or_default();
            let v16: i64 = v15.as_i64().unwrap_or(0);
            let v17: i32 = (v16 as i32);
            let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("body"); } LIT.with(|lit| lit.clone()) };
            let v19: serde_json::Value = v6.get(&*v18).cloned().unwrap_or_default();
            let v20: Rc<str> = Rc::<str>::from(v19.as_str().unwrap_or(""));
            let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("original"); } LIT.with(|lit| lit.clone()) };
            let v22: serde_json::Value = v6.get(&*v21).cloned().unwrap_or_default();
            let v23: Rc<str> = Rc::<str>::from(v22.as_str().unwrap_or(""));
            let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("parent"); } LIT.with(|lit| lit.clone()) };
            let v25: serde_json::Value = v6.get(&*v24).cloned().unwrap_or_default();
            let v26: Rc<str> = Rc::<str>::from(v25.as_str().unwrap_or(""));
            let v27: bool = &*v26 == "";
            let v30: US0 = if v27 {
                US0::US0_None
            } else {
                US0::US0_Some(v26.clone())
            };
            let v31: Rc<Heap0> = Rc::new(Heap0 { l0: v9.clone(), l1: v13, l2: v17, l3: v20.clone(), l4: v23.clone(), l5: v30.clone() });
            let v32: Rc<UH0> = Rc::new(UH0::UH0_Cons(v31.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v32.clone());
            continue;
        }
    }
}
fn from_2(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
            let v8: Rc<UH1> = Rc::new(UH1::UH1_Cons(v7.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v8.clone());
            continue;
        }
    }
}
fn method3(mut v0: Rc<UH1>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let v4: Rc<UH2> = method3(v3, v1.clone());
            Rc::new(UH2::UH2_Cons(v2, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn grouped_6(mut v0: Rc<UH5>, mut v1: Rc<Heap0>) -> Rc<UH5> {
    match &*v0 {
        UH5::UH5_Cons(v2, v3, v4, v5, v6) => {
            let v2: Rc<str> = v2.clone();
            let mut v3: i32 = *v3;
            let v4: Rc<str> = v4.clone();
            let v5: Rc<UH0> = v5.clone();
            let v6: Rc<UH5> = v6.clone();
            let v7: Rc<str> = v1.l0.clone();
            let v8: bool = &*v2 == &*v7;
            if v8 {
                let v9: Rc<str> = v1.l4.clone();
                let mut v10: i32 = (v4.clone().len() as i32);
                let mut v11: i32 = (v9.clone().len() as i32);
                let v12: bool = v10 != v11;
                let v19: bool = if v12 {
                    let v13: bool = v10 > v11;
                    v13
                } else {
                    let v14: bool = &*v4 < &*v9;
                    let v17: i32 = if v14 {
                        -1i32
                    } else {
                        let mut v15: bool = &*v4 > &*v9;
                        if v15 {
                            1i32
                        } else {
                            0i32
                        }
                    };
                    let v18: bool = v17 == 1i32;
                    v18
                };
                let v21: Rc<str> = if v19 {
                    let v20: Rc<str> = v1.l4.clone();
                    v20.clone()
                } else {
                    v4.clone()
                };
                let v22: i32 = v1.l2.clone();
                let v23: bool = v22 > v3;
                let v25: i32 = if v23 {
                    let v24: i32 = v1.l2.clone();
                    v24
                } else {
                    v3
                };
                let v26: Rc<UH0> = Rc::new(UH0::UH0_Cons(v1.clone(), v5.clone()));
                Rc::new(UH5::UH5_Cons(v2.clone(), v25, v21.clone(), v26.clone(), v6.clone()))
            } else {
                let v28: Rc<UH5> = grouped_6(v6.clone(), v1.clone());
                Rc::new(UH5::UH5_Cons(v2.clone(), v3, v4.clone(), v5.clone(), v28.clone()))
            }
        }
        UH5::UH5_Nil => {
            let v31: Rc<str> = v1.l0.clone();
            let v32: i32 = v1.l2.clone();
            let v33: Rc<str> = v1.l4.clone();
            let v34: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v35: Rc<UH0> = Rc::new(UH0::UH0_Cons(v1.clone(), v34.clone()));
            let v36: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
            Rc::new(UH5::UH5_Cons(v31.clone(), v32, v33.clone(), v35.clone(), v36.clone()))
        }
    }
}
fn method5(mut v0: Rc<UH0>, mut v1: Rc<UH5>) -> Rc<UH5> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<Heap0> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
                let v4: Rc<UH5> = grouped_6(v1.clone(), v2.clone());
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH0::UH0_Nil => {
                return v1.clone();
            }
        }
    }
}
fn placed_8(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: Rc<UH5>) -> Rc<UH5> {
    match &*v4 {
        UH5::UH5_Cons(v5, v6, v7, v8, v9) => {
            let v5: Rc<str> = v5.clone();
            let v6: i32 = *v6;
            let v7: Rc<str> = v7.clone();
            let v8: Rc<UH0> = v8.clone();
            let v9: Rc<UH5> = v9.clone();
            let mut v10: i32 = (v2.clone().len() as i32);
            let mut v11: i32 = (v7.clone().len() as i32);
            let v12: bool = v10 != v11;
            let v19: bool = if v12 {
                let v13: bool = v10 > v11;
                v13
            } else {
                let v14: bool = &*v2 < &*v7;
                let v17: i32 = if v14 {
                    -1i32
                } else {
                    let mut v15: bool = &*v2 > &*v7;
                    if v15 {
                        1i32
                    } else {
                        0i32
                    }
                };
                let v18: bool = v17 == 1i32;
                v18
            };
            if v19 {
                let v20: Rc<UH5> = placed_8(v0.clone(), v1, v2.clone(), v3.clone(), v9);
                Rc::new(UH5::UH5_Cons(v5, v6, v7, v8, v20))
            } else {
                Rc::new(UH5::UH5_Cons(v0.clone(), v1, v2.clone(), v3.clone(), v4.clone()))
            }
        }
        _ => {
            Rc::new(UH5::UH5_Cons(v0, v1, v2, v3, v4))
        }
    }
}
fn method7(mut v0: Rc<UH5>, mut v1: Rc<UH5>) -> Rc<UH5> {
    loop {
        match &*v0 {
            UH5::UH5_Cons(v2, v3, v4, v5, v6) => {
                let v2: Rc<str> = v2.clone();
                let mut v3: i32 = *v3;
                let v4: Rc<str> = v4.clone();
                let v5: Rc<UH0> = v5.clone();
                let v6: Rc<UH5> = v6.clone();
                let v7: Rc<UH5> = placed_8(v2.clone(), v3, v4.clone(), v5.clone(), v1.clone());
                (v0, v1) = (v6.clone(), v7.clone());
                continue;
            }
            UH5::UH5_Nil => {
                return v1.clone();
            }
        }
    }
}
fn method10(mut v0: i32, mut v1: i32) -> Rc<UH4> {
    let v2: bool = v1 < v0;
    if v2 {
        let mut v3: i32 = v1.wrapping_add(1i32);
        let v4: Rc<UH4> = method10(v0, v3);
        Rc::new(UH4::UH4_Cons(v3, v4.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) }
    }
}
fn method12(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: i32, mut v5: Rc<UH0>, mut v6: Rc<UH0>) -> Rc<UH0> {
    match &*v5 {
        UH0::UH0_Cons(v7, v8) => {
            let v7: Rc<Heap0> = v7.clone();
            let v8: Rc<UH0> = v8.clone();
            let v9: Rc<UH0> = method12(v0, v1, v2, v3, v4, v8, v6.clone());
            let mut v10: i32 = v7.l1.clone();
            let mut v11: bool = v10 == v4;
            let v14: bool = if v11 {
                let v12: i32 = v7.l2.clone();
                let v13: bool = v12 == v1;
                v13
            } else {
                false
            };
            if v14 {
                Rc::new(UH0::UH0_Cons(v7, v9.clone()))
            } else {
                v9
            }
        }
        UH0::UH0_Nil => {
            v6
        }
    }
}
fn method13(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<Heap0> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
                let v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3.clone(), v4);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn method11(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: Rc<UH4>, mut v5: Rc<UH4>) -> Rc<UH4> {
    match &*v4 {
        UH4::UH4_Cons(v6, v7) => {
            let v6: i32 = *v6;
            let v7: Rc<UH4> = v7.clone();
            let v8: Rc<UH4> = method11(v0.clone(), v1, v2.clone(), v3.clone(), v7.clone(), v5.clone());
            let v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v10: Rc<UH0> = method12(v0.clone(), v1, v2.clone(), v3.clone(), v6, v3.clone(), v9.clone());
            let mut v11: i32 = 0i32;
            let v12: i32 = method13(v10.clone(), v11);
            let v13: bool = v12 != 1i32;
            if v13 {
                Rc::new(UH4::UH4_Cons(v6, v8.clone()))
            } else {
                v8.clone()
            }
        }
        UH4::UH4_Nil => {
            v5.clone()
        }
    }
}
fn method15(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<Heap0> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let v4: Rc<UH1> = method15(v3, v1.clone());
            let v5: Rc<str> = v2.l3.clone();
            Rc::new(UH1::UH1_Cons(v5, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method17(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH1>, mut v2: i32) -> i32 {
    loop {
        match &*v1 {
            UH1::UH1_Cons(v3, v4) => {
                let mut v3: Rc<str> = v3.clone();
                let v4: Rc<UH1> = v4.clone();
                v0.borrow_mut().push(v3);
                let v5: i32 = v2.wrapping_add(1i32);
                (v0, v1, v2) = (v0.clone(), v4.clone(), v5);
                continue;
            }
            UH1::UH1_Nil => {
                return v2;
            }
        }
    }
}
fn delimited_16(mut v0: Rc<str>, mut v1: Rc<UH1>) -> Rc<str> {
    let v2: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let mut v3: i32 = 0i32;
    let v4: i32 = method17(v2.clone(), v1, v3);
    let v5: Rc<Vec<Rc<str>>> = Rc::new(v2.borrow().clone());
    let v6: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v5).as_ref().clone()));
    let v7: Rc<str> = Rc::<str>::from((*v6.borrow()).join(&*v0));
    v7
}
fn method14(mut v0: i32, mut v1: Rc<str>, mut v2: i32, mut v3: Rc<str>, mut v4: Rc<UH0>, mut v5: i32) -> Rc<UH1> {
    let v6: bool = v5 < v0;
    if v6 {
        let v7: i32 = v5.wrapping_add(1i32);
        let v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v9: Rc<UH0> = method12(v1.clone(), v2, v3.clone(), v4.clone(), v7, v4.clone(), v8.clone());
        let mut v10: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let mut v11: Rc<UH1> = method15(v9.clone(), v10.clone());
        let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let v13: Rc<str> = delimited_16(v12.clone(), v11.clone());
        let v14: Rc<UH1> = method14(v0, v1.clone(), v2, v3.clone(), v4.clone(), v7);
        Rc::new(UH1::UH1_Cons(v13.clone(), v14.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    }
}
fn method18(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let v4: Rc<UH1> = method18(v3, v1.clone());
            Rc::new(UH1::UH1_Cons(v2, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method19(mut v0: Rc<UH3>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3) => {
            let v2: US1 = v2.clone();
            let mut v3: Rc<UH3> = v3.clone();
            let v4: Rc<UH3> = method19(v3, v1.clone());
            Rc::new(UH3::UH3_Cons(v2, v4))
        }
        UH3::UH3_Nil => {
            v1
        }
    }
}
fn method9(mut v0: Rc<UH5>, mut v1: Rc<UH1>, mut v2: Rc<UH3>) -> (Rc<UH1>, Rc<UH3>) {
    let (mut v36, mut v37): (Rc<UH1>, Rc<UH3>) = match &*v0 {
        UH5::UH5_Cons(v3, v4, v5, v6, v7) => {
            let mut v3: Rc<str> = v3.clone();
            let v4: i32 = *v4;
            let v5: Rc<str> = v5.clone();
            let v6: Rc<UH0> = v6.clone();
            let v7: Rc<UH5> = v7.clone();
            let v8: i32 = 0i32;
            let v9: Rc<UH4> = method10(v4, v8);
            let mut v10: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
            let mut v11: Rc<UH4> = method11(v3.clone(), v4, v5.clone(), v6.clone(), v9.clone(), v10.clone());
            let v19: US2 = match &*v11 {
                UH4::UH4_Nil => {
                    let v12: i32 = 0i32;
                    let v13: Rc<UH1> = method14(v4, v3.clone(), v4, v5.clone(), v6.clone(), v12);
                    let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let mut v15: Rc<str> = delimited_16(v14.clone(), v13.clone());
                    US2::US2_Whole(v15.clone())
                }
                _ => {
                    let v17: US1 = US1::US1_MissingFrames(v3.clone(), v11.clone(), v4);
                    US2::US2_Holed(v17.clone())
                }
            };
            let (mut v30, mut v31): (Rc<UH1>, Rc<UH3>) = match &v19 {
                US2::US2_Whole(v20) => {
                    let v20: Rc<str> = v20.clone();
                    let v21: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let v22: Rc<UH1> = Rc::new(UH1::UH1_Cons(v20.clone(), v21.clone()));
                    let v23: Rc<UH1> = method18(v1.clone(), v22.clone());
                    (v23.clone(), v2.clone())
                }
                _ => {
                    let (mut v28, mut v29): (Rc<UH1>, Rc<UH3>) = match &v19 {
                        US2::US2_Holed(v24) => {
                            let v24: US1 = v24.clone();
                            let v25: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
                            let v26: Rc<UH3> = Rc::new(UH3::UH3_Cons(v24.clone(), v25.clone()));
                            let v27: Rc<UH3> = method19(v2.clone(), v26.clone());
                            (v1.clone(), v27.clone())
                        }
                        _ => unreachable!(),
                    };
                    (v28.clone(), v29.clone())
                }
            };
            method9(v7.clone(), v30.clone(), v31.clone())
        }
        _ => {
            let (mut v34, mut v35): (Rc<UH1>, Rc<UH3>) = match &*v0 {
                UH5::UH5_Nil => {
                    (v1.clone(), v2.clone())
                }
                _ => unreachable!(),
            };
            (v34.clone(), v35.clone())
        }
    };
    (v36.clone(), v37.clone())
}
fn method21(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: Rc<UH0>, mut v5: Rc<UH0>) -> Rc<UH0> {
    match &*v4 {
        UH0::UH0_Cons(v6, v7) => {
            let v6: Rc<Heap0> = v6.clone();
            let v7: Rc<UH0> = v7.clone();
            let v8: Rc<UH0> = method21(v0, v1, v2, v3, v7, v5.clone());
            let v9: i32 = v6.l1.clone();
            let mut v10: bool = v9 == 1i32;
            let v13: bool = if v10 {
                let mut v11: i32 = v6.l2.clone();
                let v12: bool = v11 == v1;
                v12
            } else {
                false
            };
            if v13 {
                Rc::new(UH0::UH0_Cons(v6, v8.clone()))
            } else {
                v8
            }
        }
        UH0::UH0_Nil => {
            v5
        }
    }
}
fn method23(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH2> = v3.clone();
            let v4: Rc<UH2> = method23(v3, v1.clone());
            Rc::new(UH2::UH2_Cons(v2, v4))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn closure1(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> bool> {
    Rc::new(move |mut v1: Rc<str>| -> bool {
        let v2: bool = &*v0 == &*v1;
        v2
    })
}
fn method24(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> bool> {
    closure1(v0)
}
fn method25(mut v0: Rc<str>, mut v1: Rc<dyn Fn(Rc<str>) -> bool>, mut v2: Rc<UH2>) -> bool {
    loop {
        match &*v2 {
            UH2::UH2_Cons(v3, v4) => {
                let mut v3: Rc<str> = v3.clone();
                let v4: Rc<UH2> = v4.clone();
                let v5: bool = v1(v3.clone());
                if v5 {
                    return true;
                } else {
                    let v6: Rc<dyn Fn(Rc<str>) -> bool> = method24(v0.clone());
                    (v0, v1, v2) = (v0.clone(), v6.clone(), v4.clone());
                    continue;
                }
            }
            UH2::UH2_Nil => {
                return false;
            }
        }
    }
}
fn method22(mut v0: Rc<UH2>, mut v1: Rc<UH0>, mut v2: Rc<UH2>) -> Rc<UH2> {
    match &*v1 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<Heap0> = v3.clone();
            let v4: Rc<UH0> = v4.clone();
            let v5: Rc<UH2> = method22(v0.clone(), v4.clone(), v2.clone());
            let v6: US0 = v3.l5.clone();
            let v16: Rc<UH2> = match &v6 {
                US0::US0_Some(v7) => {
                    let v7: Rc<str> = v7.clone();
                    let v8: Rc<dyn Fn(Rc<str>) -> bool> = method24(v7.clone());
                    let v9: bool = method25(v7.clone(), v8.clone(), v0.clone());
                    let mut v10: bool = v9 == false;
                    if v10 {
                        let mut v11: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                        Rc::new(UH2::UH2_Cons(v7.clone(), v11.clone()))
                    } else {
                        { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
                    }
                }
                _ => {
                    { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
                }
            };
            method23(v16.clone(), v5.clone())
        }
        UH0::UH0_Nil => {
            v2.clone()
        }
    }
}
fn method26(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: Rc<UH2>, mut v5: Rc<UH3>) -> Rc<UH3> {
    match &*v4 {
        UH2::UH2_Cons(v6, v7) => {
            let v6: Rc<str> = v6.clone();
            let v7: Rc<UH2> = v7.clone();
            let v8: Rc<UH3> = method26(v0.clone(), v1, v2, v3, v7, v5.clone());
            let v9: US1 = US1::US1_ReplyGap(v0, v6);
            Rc::new(UH3::UH3_Cons(v9, v8))
        }
        UH2::UH2_Nil => {
            v5
        }
    }
}
fn method20(mut v0: Rc<UH2>, mut v1: Rc<UH5>, mut v2: Rc<UH3>) -> Rc<UH3> {
    match &*v1 {
        UH5::UH5_Cons(v3, v4, v5, v6, v7) => {
            let mut v3: Rc<str> = v3.clone();
            let v4: i32 = *v4;
            let v5: Rc<str> = v5.clone();
            let v6: Rc<UH0> = v6.clone();
            let v7: Rc<UH5> = v7.clone();
            let v8: Rc<UH3> = method20(v0.clone(), v7.clone(), v2.clone());
            let v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v10: Rc<UH0> = method21(v3.clone(), v4, v5.clone(), v6.clone(), v6.clone(), v9.clone());
            let mut v11: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let v12: Rc<UH2> = method22(v0.clone(), v10.clone(), v11.clone());
            let v13: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
            let v14: Rc<UH3> = method26(v3.clone(), v4, v5.clone(), v6.clone(), v12.clone(), v13.clone());
            method19(v14.clone(), v8.clone())
        }
        UH5::UH5_Nil => {
            v2.clone()
        }
    }
}
fn assembled_4(mut v0: Rc<UH0>, mut v1: Rc<UH2>) -> (Rc<UH1>, Rc<UH3>) {
    let v2: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
    let mut v3: Rc<UH5> = method5(v0.clone(), v2.clone());
    let v4: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
    let v5: Rc<UH5> = method7(v3.clone(), v4.clone());
    let v6: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v7: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let (mut v8, mut v9): (Rc<UH1>, Rc<UH3>) = method9(v5.clone(), v6.clone(), v7.clone());
    let v19: Rc<UH3> = match &*v5 {
        UH5::UH5_Cons(v10, v11, v12, v13, v14) => {
            let mut v10: Rc<str> = v10.clone();
            let mut v11: i32 = *v11;
            let v12: Rc<str> = v12.clone();
            let v13: Rc<UH0> = v13.clone();
            let v14: Rc<UH5> = v14.clone();
            let mut v15: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
            method20(v1.clone(), v14.clone(), v15.clone())
        }
        UH5::UH5_Nil => {
            { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) }
        }
    };
    let v20: Rc<UH3> = method19(v9.clone(), v19.clone());
    (v8.clone(), v20.clone())
}
fn method28(mut v0: Rc<UH4>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH4::UH4_Cons(v2, v3) => {
            let v2: i32 = *v2;
            let mut v3: Rc<UH4> = v3.clone();
            let v4: Rc<UH1> = method28(v3, v1.clone());
            let v5: Rc<str> = Rc::<str>::from(format!("{:?}", v2));
            Rc::new(UH1::UH1_Cons(v5, v4))
        }
        UH4::UH4_Nil => {
            v1
        }
    }
}
fn method27(mut v0: Rc<UH3>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3) => {
            let v2: US1 = v2.clone();
            let mut v3: Rc<UH3> = v3.clone();
            let v4: Rc<UH1> = method27(v3.clone(), v1.clone());
            let v31: Rc<str> = match &v2 {
                US1::US1_MissingFrames(v5, v6, v7) => {
                    let v5: Rc<str> = v5.clone();
                    let v6: Rc<UH4> = v6.clone();
                    let v7: i32 = *v7;
                    let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cell "); } LIT.with(|lit| lit.clone()) };
                    let v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v5));
                    let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" is missing frame "); } LIT.with(|lit| lit.clone()) };
                    let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v10));
                    let v12: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let v13: Rc<UH1> = method28(v6.clone(), v12.clone());
                    let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", "); } LIT.with(|lit| lit.clone()) };
                    let mut v15: Rc<str> = delimited_16(v14.clone(), v13.clone());
                    let v16: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v15));
                    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" of "); } LIT.with(|lit| lit.clone()) };
                    let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v17));
                    let v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, Rc::<str>::from(format!("{:?}", v7))));
                    v20.clone()
                }
                US1::US1_ReplyGap(v21, v22) => {
                    let v21: Rc<str> = v21.clone();
                    let v22: Rc<str> = v22.clone();
                    let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cell "); } LIT.with(|lit| lit.clone()) };
                    let v24: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v21));
                    let v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" replies to "); } LIT.with(|lit| lit.clone()) };
                    let v27: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v24, v25)), v22));
                    let v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", which is not in the thread: posts before it are missing"); } LIT.with(|lit| lit.clone()) };
                    let v29: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v28));
                    v29.clone()
                }
            };
            Rc::new(UH1::UH1_Cons(v31.clone(), v4.clone()))
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn assembled_of_0(mut v0: Rc<str>) -> (i32, Rc<str>, Rc<str>) {
    let mut v1: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v0).unwrap_or_default();
    let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("frames"); } LIT.with(|lit| lit.clone()) };
    let mut v3: serde_json::Value = v1.get(&*v2).cloned().unwrap_or_default();
    let v4: usize = v3.as_array().map_or(0, Vec::len);
    let v5: i32 = ((v4) as i32);
    let v6: i32 = v5.wrapping_sub(1i32);
    let v7: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v8: Rc<UH0> = from_1(v3.clone(), v6, v7.clone());
    let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("known"); } LIT.with(|lit| lit.clone()) };
    let mut v10: serde_json::Value = v1.get(&*v9).cloned().unwrap_or_default();
    let mut v11: usize = v10.as_array().map_or(0, Vec::len);
    let v12: i32 = ((v11) as i32);
    let v13: i32 = v12.wrapping_sub(1i32);
    let v14: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v15: Rc<UH1> = from_2(v10.clone(), v13, v14.clone());
    let v16: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let v17: Rc<UH2> = method3(v15.clone(), v16.clone());
    let (mut v18, mut v19): (Rc<UH1>, Rc<UH3>) = assembled_4(v8.clone(), v17.clone());
    let v20: i32 = match &*v19 {
        UH3::UH3_Nil => {
            0i32
        }
        _ => {
            4i32
        }
    };
    let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n\n"); } LIT.with(|lit| lit.clone()) };
    let v22: Rc<str> = delimited_16(v21.clone(), v18.clone());
    let v23: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v24: Rc<UH1> = method27(v19.clone(), v23.clone());
    let v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let v26: Rc<str> = delimited_16(v25.clone(), v24.clone());
    (v20, v22.clone(), v26.clone())
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>| -> (i32, Rc<str>, Rc<str>) {
        assembled_of_0(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_assemble(v0: &str) -> (i32, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0))
}
