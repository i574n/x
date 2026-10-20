#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
struct Heap0 { l0: Rc<str>, l1: i32, l2: i32, l3: Rc<str>, l4: Rc<str>, l5: Rc<str> }
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
enum UH3 {
    UH3_Nil,
    UH3_Cons(i32, Rc<UH3>),
}
#[derive(Clone)]
enum US0 {
    US0_MissingFrames(Rc<str>, Rc<UH3>, i32),
    US0_ReplyGap(Rc<str>, Rc<str>),
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(US0, Rc<UH2>),
}
#[derive(Clone)]
enum UH4 {
    UH4_Nil,
    UH4_Cons(Rc<str>, i32, Rc<str>, Rc<UH0>, Rc<UH4>),
}
#[derive(Clone)]
enum US1 {
    US1_Whole(Rc<str>),
    US1_Holed(US0),
}
#[derive(Clone)]
enum US2 {
    US2_Some(Rc<str>),
    US2_None,
}
fn from_1(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cell"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: Rc<str> = Rc::<str>::from(v7.as_str().unwrap_or(""));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("k"); } LIT.with(|lit| lit.clone()) };
            let mut v10: serde_json::Value = v5.get(&*v9).cloned().unwrap_or_default();
            let mut v11: i32 = v10.as_i64().unwrap_or(0) as i32;
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("n"); } LIT.with(|lit| lit.clone()) };
            let mut v13: serde_json::Value = v5.get(&*v12).cloned().unwrap_or_default();
            let mut v14: i32 = v13.as_i64().unwrap_or(0) as i32;
            let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("body"); } LIT.with(|lit| lit.clone()) };
            let mut v16: serde_json::Value = v5.get(&*v15).cloned().unwrap_or_default();
            let mut v17: Rc<str> = Rc::<str>::from(v16.as_str().unwrap_or(""));
            let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("original"); } LIT.with(|lit| lit.clone()) };
            let mut v19: serde_json::Value = v5.get(&*v18).cloned().unwrap_or_default();
            let mut v20: Rc<str> = Rc::<str>::from(v19.as_str().unwrap_or(""));
            let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("parent"); } LIT.with(|lit| lit.clone()) };
            let mut v22: serde_json::Value = v5.get(&*v21).cloned().unwrap_or_default();
            let mut v23: Rc<str> = Rc::<str>::from(v22.as_str().unwrap_or(""));
            let mut v24: Rc<Heap0> = Rc::new(Heap0 { l0: v8.clone(), l1: v11, l2: v14, l3: v17.clone(), l4: v20.clone(), l5: v23.clone() });
            let mut v25: Rc<UH0> = Rc::new(UH0::UH0_Cons(v24.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v25.clone());
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
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = Rc::<str>::from(v5.as_str().unwrap_or(""));
            let mut v7: Rc<UH1> = Rc::new(UH1::UH1_Cons(v6.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v7.clone());
            continue;
        }
    }
}
fn grouped_5(mut v0: Rc<UH4>, mut v1: Rc<Heap0>) -> Rc<UH4> {
    match &*v0 {
        UH4::UH4_Cons(v2, v3, v4, v5, v6) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: i32 = *v3;
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH0> = v5.clone();
            let mut v6: Rc<UH4> = v6.clone();
            let mut v7: Rc<str> = v1.l0.clone();
            let mut v8: bool = v2.clone() == v7.clone();
            if v8 {
                let mut v9: Rc<str> = v1.l4.clone();
                let mut v10: i32 = (v4.clone().len() as i32);
                let mut v11: i32 = (v9.clone().len() as i32);
                let mut v12: bool = v10 != v11;
                let mut v19: bool = if v12 {
                    let mut v13: bool = v10 > v11;
                    v13
                } else {
                    let mut v14: bool = v4.clone() < v9.clone();
                    let mut v17: i32 = if v14 {
                        -1i32
                    } else {
                        let mut v15: bool = v4.clone() > v9.clone();
                        if v15 {
                            1i32
                        } else {
                            0i32
                        }
                    };
                    let mut v18: bool = v17 == 1i32;
                    v18
                };
                let mut v21: Rc<str> = if v19 {
                    let mut v20: Rc<str> = v1.l4.clone();
                    v20.clone()
                } else {
                    v4.clone()
                };
                let mut v22: i32 = v1.l2.clone();
                let mut v23: bool = v22 > v3;
                let mut v25: i32 = if v23 {
                    let mut v24: i32 = v1.l2.clone();
                    v24
                } else {
                    v3
                };
                let mut v26: Rc<UH0> = Rc::new(UH0::UH0_Cons(v1.clone(), v5.clone()));
                Rc::new(UH4::UH4_Cons(v2.clone(), v25, v21.clone(), v26.clone(), v6.clone()))
            } else {
                let mut v28: Rc<UH4> = grouped_5(v6.clone(), v1.clone());
                Rc::new(UH4::UH4_Cons(v2.clone(), v3, v4.clone(), v5.clone(), v28.clone()))
            }
        }
        UH4::UH4_Nil => {
            let mut v31: Rc<str> = v1.l0.clone();
            let mut v32: i32 = v1.l2.clone();
            let mut v33: Rc<str> = v1.l4.clone();
            let mut v34: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v35: Rc<UH0> = Rc::new(UH0::UH0_Cons(v1.clone(), v34.clone()));
            let mut v36: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
            Rc::new(UH4::UH4_Cons(v31.clone(), v32, v33.clone(), v35.clone(), v36.clone()))
        }
    }
}
fn method4(mut v0: Rc<UH0>, mut v1: Rc<UH4>) -> Rc<UH4> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<Heap0> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
                let mut v4: Rc<UH4> = grouped_5(v1.clone(), v2.clone());
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH0::UH0_Nil => {
                return v1.clone();
            }
        }
    }
}
fn placed_7(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: Rc<UH4>) -> Rc<UH4> {
    match &*v4 {
        UH4::UH4_Cons(v5, v6, v7, v8, v9) => {
            let mut v5: Rc<str> = v5.clone();
            let mut v6: i32 = *v6;
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<UH0> = v8.clone();
            let mut v9: Rc<UH4> = v9.clone();
            let mut v10: i32 = (v2.clone().len() as i32);
            let mut v11: i32 = (v7.clone().len() as i32);
            let mut v12: bool = v10 != v11;
            let mut v19: bool = if v12 {
                let mut v13: bool = v10 > v11;
                v13
            } else {
                let mut v14: bool = v2.clone() < v7.clone();
                let mut v17: i32 = if v14 {
                    -1i32
                } else {
                    let mut v15: bool = v2.clone() > v7.clone();
                    if v15 {
                        1i32
                    } else {
                        0i32
                    }
                };
                let mut v18: bool = v17 == 1i32;
                v18
            };
            if v19 {
                let mut v20: Rc<UH4> = placed_7(v0.clone(), v1, v2.clone(), v3.clone(), v9.clone());
                Rc::new(UH4::UH4_Cons(v5.clone(), v6, v7.clone(), v8.clone(), v20.clone()))
            } else {
                Rc::new(UH4::UH4_Cons(v0.clone(), v1, v2.clone(), v3.clone(), v4.clone()))
            }
        }
        _ => {
            Rc::new(UH4::UH4_Cons(v0.clone(), v1, v2.clone(), v3.clone(), v4.clone()))
        }
    }
}
fn method6(mut v0: Rc<UH4>, mut v1: Rc<UH4>) -> Rc<UH4> {
    loop {
        match &*v0 {
            UH4::UH4_Cons(v2, v3, v4, v5, v6) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: i32 = *v3;
                let mut v4: Rc<str> = v4.clone();
                let mut v5: Rc<UH0> = v5.clone();
                let mut v6: Rc<UH4> = v6.clone();
                let mut v7: Rc<UH4> = placed_7(v2.clone(), v3, v4.clone(), v5.clone(), v1.clone());
                (v0, v1) = (v6.clone(), v7.clone());
                continue;
            }
            UH4::UH4_Nil => {
                return v1.clone();
            }
        }
    }
}
fn method9(mut v0: i32, mut v1: i32) -> Rc<UH3> {
    let mut v2: bool = v1 < v0;
    if v2 {
        let mut v3: i32 = v1.wrapping_add(1i32);
        let mut v4: Rc<UH3> = method9(v0, v3);
        Rc::new(UH3::UH3_Cons(v3, v4.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) }
    }
}
fn method11(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: i32, mut v5: Rc<UH0>, mut v6: Rc<UH0>) -> Rc<UH0> {
    match &*v5 {
        UH0::UH0_Cons(v7, v8) => {
            let mut v7: Rc<Heap0> = v7.clone();
            let mut v8: Rc<UH0> = v8.clone();
            let mut v9: Rc<UH0> = method11(v0.clone(), v1, v2.clone(), v3.clone(), v4, v8.clone(), v6.clone());
            let mut v10: i32 = v7.l1.clone();
            let mut v11: bool = v10 == v4;
            let mut v14: bool = if v11 {
                let mut v12: i32 = v7.l2.clone();
                let mut v13: bool = v12 == v1;
                v13
            } else {
                false
            };
            if v14 {
                Rc::new(UH0::UH0_Cons(v7.clone(), v9.clone()))
            } else {
                v9.clone()
            }
        }
        UH0::UH0_Nil => {
            v6.clone()
        }
    }
}
fn method12(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<Heap0> = v2.clone();
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
fn method10(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: Rc<UH3>, mut v5: Rc<UH3>) -> Rc<UH3> {
    match &*v4 {
        UH3::UH3_Cons(v6, v7) => {
            let mut v6: i32 = *v6;
            let mut v7: Rc<UH3> = v7.clone();
            let mut v8: Rc<UH3> = method10(v0.clone(), v1, v2.clone(), v3.clone(), v7.clone(), v5.clone());
            let mut v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v10: Rc<UH0> = method11(v0.clone(), v1, v2.clone(), v3.clone(), v6, v3.clone(), v9.clone());
            let mut v11: i32 = 0i32;
            let mut v12: i32 = method12(v10.clone(), v11);
            let mut v13: bool = v12 != 1i32;
            if v13 {
                Rc::new(UH3::UH3_Cons(v6, v8.clone()))
            } else {
                v8.clone()
            }
        }
        UH3::UH3_Nil => {
            v5.clone()
        }
    }
}
fn method14(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<Heap0> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH1> = method14(v3.clone(), v1.clone());
            let mut v5: Rc<str> = v2.l3.clone();
            Rc::new(UH1::UH1_Cons(v5.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method16(mut v0: Rc<str>, mut v1: Rc<UH1>, mut v2: Rc<str>, mut v3: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v1 {
        UH1::UH1_Cons(v4, v5) => {
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH1> = v5.clone();
            let (mut v6, mut v7): (Rc<str>, Rc<str>) = method16(v0.clone(), v5.clone(), v2.clone(), v3.clone());
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v7));
            let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v6));
            (v9.clone(), v0.clone())
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v1 {
                UH1::UH1_Nil => {
                    (v2.clone(), v3.clone())
                }
                _ => unreachable!(),
            };
            (v10.clone(), v11.clone())
        }
    };
    (v12.clone(), v13.clone())
}
fn delimited_15(mut v0: Rc<str>, mut v1: Rc<UH1>) -> Rc<str> {
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v3, mut v4): (Rc<str>, Rc<str>) = method16(v0.clone(), v1.clone(), v2.clone(), v2.clone());
    v3.clone()
}
fn method13(mut v0: i32, mut v1: Rc<str>, mut v2: i32, mut v3: Rc<str>, mut v4: Rc<UH0>, mut v5: i32) -> Rc<UH1> {
    let mut v6: bool = v5 < v0;
    if v6 {
        let mut v7: i32 = v5.wrapping_add(1i32);
        let mut v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v9: Rc<UH0> = method11(v1.clone(), v2, v3.clone(), v4.clone(), v7, v4.clone(), v8.clone());
        let mut v10: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let mut v11: Rc<UH1> = method14(v9.clone(), v10.clone());
        let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v13: Rc<str> = delimited_15(v12.clone(), v11.clone());
        let mut v14: Rc<UH1> = method13(v0, v1.clone(), v2, v3.clone(), v4.clone(), v7);
        Rc::new(UH1::UH1_Cons(v13.clone(), v14.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    }
}
fn method17(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method17(v3.clone(), v1.clone());
            Rc::new(UH1::UH1_Cons(v2.clone(), v4.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method18(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3) => {
            let mut v2: US0 = v2.clone();
            let mut v3: Rc<UH2> = v3.clone();
            let mut v4: Rc<UH2> = method18(v3.clone(), v1.clone());
            Rc::new(UH2::UH2_Cons(v2.clone(), v4.clone()))
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn method8(mut v0: Rc<UH4>, mut v1: Rc<UH1>, mut v2: Rc<UH2>) -> (Rc<UH1>, Rc<UH2>) {
    let (mut v36, mut v37): (Rc<UH1>, Rc<UH2>) = match &*v0 {
        UH4::UH4_Cons(v3, v4, v5, v6, v7) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: i32 = *v4;
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH0> = v6.clone();
            let mut v7: Rc<UH4> = v7.clone();
            let mut v8: i32 = 0i32;
            let mut v9: Rc<UH3> = method9(v4, v8);
            let mut v10: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
            let mut v11: Rc<UH3> = method10(v3.clone(), v4, v5.clone(), v6.clone(), v9.clone(), v10.clone());
            let mut v19: US1 = match &*v11 {
                UH3::UH3_Nil => {
                    let mut v12: i32 = 0i32;
                    let mut v13: Rc<UH1> = method13(v4, v3.clone(), v4, v5.clone(), v6.clone(), v12);
                    let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let mut v15: Rc<str> = delimited_15(v14.clone(), v13.clone());
                    US1::US1_Whole(v15.clone())
                }
                _ => {
                    let mut v17: US0 = US0::US0_MissingFrames(v3.clone(), v11.clone(), v4);
                    US1::US1_Holed(v17.clone())
                }
            };
            let (mut v30, mut v31): (Rc<UH1>, Rc<UH2>) = match &v19 {
                US1::US1_Whole(v20) => {
                    let mut v20: Rc<str> = v20.clone();
                    let mut v21: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let mut v22: Rc<UH1> = Rc::new(UH1::UH1_Cons(v20.clone(), v21.clone()));
                    let mut v23: Rc<UH1> = method17(v1.clone(), v22.clone());
                    (v23.clone(), v2.clone())
                }
                _ => {
                    let (mut v28, mut v29): (Rc<UH1>, Rc<UH2>) = match &v19 {
                        US1::US1_Holed(v24) => {
                            let mut v24: US0 = v24.clone();
                            let mut v25: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                            let mut v26: Rc<UH2> = Rc::new(UH2::UH2_Cons(v24.clone(), v25.clone()));
                            let mut v27: Rc<UH2> = method18(v2.clone(), v26.clone());
                            (v1.clone(), v27.clone())
                        }
                        _ => unreachable!(),
                    };
                    (v28.clone(), v29.clone())
                }
            };
            method8(v7.clone(), v30.clone(), v31.clone())
        }
        _ => {
            let (mut v34, mut v35): (Rc<UH1>, Rc<UH2>) = match &*v0 {
                UH4::UH4_Nil => {
                    (v1.clone(), v2.clone())
                }
                _ => unreachable!(),
            };
            (v34.clone(), v35.clone())
        }
    };
    (v36.clone(), v37.clone())
}
fn method20(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: Rc<UH0>, mut v5: Rc<UH0>) -> Rc<UH0> {
    match &*v4 {
        UH0::UH0_Cons(v6, v7) => {
            let mut v6: Rc<Heap0> = v6.clone();
            let mut v7: Rc<UH0> = v7.clone();
            let mut v8: Rc<UH0> = method20(v0.clone(), v1, v2.clone(), v3.clone(), v7.clone(), v5.clone());
            let mut v9: i32 = v6.l1.clone();
            let mut v10: bool = v9 == 1i32;
            let mut v13: bool = if v10 {
                let mut v11: i32 = v6.l2.clone();
                let mut v12: bool = v11 == v1;
                v12
            } else {
                false
            };
            if v13 {
                Rc::new(UH0::UH0_Cons(v6.clone(), v8.clone()))
            } else {
                v8.clone()
            }
        }
        UH0::UH0_Nil => {
            v5.clone()
        }
    }
}
fn method22(mut v0: Rc<Heap0>, mut v1: Rc<UH1>, mut v2: US2) -> US2 {
    match &*v1 {
        UH1::UH1_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH1> = v4.clone();
            let mut v5: US2 = method22(v0.clone(), v4.clone(), v2.clone());
            let mut v6: Rc<str> = v0.l5.clone();
            let mut v7: bool = v3.clone() == v6.clone();
            if v7 {
                US2::US2_Some(v3.clone())
            } else {
                v5.clone()
            }
        }
        UH1::UH1_Nil => {
            v2.clone()
        }
    }
}
fn method21(mut v0: Rc<UH1>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> Rc<UH0> {
    match &*v1 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<Heap0> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH0> = method21(v0.clone(), v4.clone(), v2.clone());
            let mut v6: Rc<str> = v3.l5.clone();
            let mut v7: bool = v6.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v14: bool = if v7 {
                let mut v8: US2 = US2::US2_None;
                let mut v9: US2 = method22(v3.clone(), v0.clone(), v8.clone());
                let mut v12: bool = match &v9 {
                    US2::US2_None => {
                        false
                    }
                    US2::US2_Some(v10) => {
                        let mut v10: Rc<str> = v10.clone();
                        true
                    }
                };
                let mut v13: bool = v12 == false;
                v13
            } else {
                false
            };
            if v14 {
                Rc::new(UH0::UH0_Cons(v3.clone(), v5.clone()))
            } else {
                v5.clone()
            }
        }
        UH0::UH0_Nil => {
            v2.clone()
        }
    }
}
fn method23(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: Rc<UH0>, mut v5: Rc<UH2>) -> Rc<UH2> {
    match &*v4 {
        UH0::UH0_Cons(v6, v7) => {
            let mut v6: Rc<Heap0> = v6.clone();
            let mut v7: Rc<UH0> = v7.clone();
            let mut v8: Rc<UH2> = method23(v0.clone(), v1, v2.clone(), v3.clone(), v7.clone(), v5.clone());
            let mut v9: Rc<str> = v6.l5.clone();
            let mut v10: US0 = US0::US0_ReplyGap(v0.clone(), v9.clone());
            Rc::new(UH2::UH2_Cons(v10.clone(), v8.clone()))
        }
        UH0::UH0_Nil => {
            v5.clone()
        }
    }
}
fn method19(mut v0: Rc<UH1>, mut v1: Rc<UH4>, mut v2: Rc<UH2>) -> Rc<UH2> {
    match &*v1 {
        UH4::UH4_Cons(v3, v4, v5, v6, v7) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: i32 = *v4;
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH0> = v6.clone();
            let mut v7: Rc<UH4> = v7.clone();
            let mut v8: Rc<UH2> = method19(v0.clone(), v7.clone(), v2.clone());
            let mut v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v10: Rc<UH0> = method20(v3.clone(), v4, v5.clone(), v6.clone(), v6.clone(), v9.clone());
            let mut v11: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v12: Rc<UH0> = method21(v0.clone(), v10.clone(), v11.clone());
            let mut v13: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let mut v14: Rc<UH2> = method23(v3.clone(), v4, v5.clone(), v6.clone(), v12.clone(), v13.clone());
            method18(v14.clone(), v8.clone())
        }
        UH4::UH4_Nil => {
            v2.clone()
        }
    }
}
fn assembled_3(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> (Rc<UH1>, Rc<UH2>) {
    let mut v2: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v3: Rc<UH4> = method4(v0.clone(), v2.clone());
    let mut v4: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v5: Rc<UH4> = method6(v3.clone(), v4.clone());
    let mut v6: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v7: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let (mut v8, mut v9): (Rc<UH1>, Rc<UH2>) = method8(v5.clone(), v6.clone(), v7.clone());
    let mut v19: Rc<UH2> = match &*v5 {
        UH4::UH4_Cons(v10, v11, v12, v13, v14) => {
            let mut v10: Rc<str> = v10.clone();
            let mut v11: i32 = *v11;
            let mut v12: Rc<str> = v12.clone();
            let mut v13: Rc<UH0> = v13.clone();
            let mut v14: Rc<UH4> = v14.clone();
            let mut v15: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            method19(v1.clone(), v14.clone(), v15.clone())
        }
        UH4::UH4_Nil => {
            { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
        }
    };
    let mut v20: Rc<UH2> = method18(v9.clone(), v19.clone());
    (v8.clone(), v20.clone())
}
fn method25(mut v0: Rc<UH3>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3) => {
            let mut v2: i32 = *v2;
            let mut v3: Rc<UH3> = v3.clone();
            let mut v4: Rc<UH1> = method25(v3.clone(), v1.clone());
            let mut v5: Rc<str> = Rc::<str>::from(format!("{:?}", v2));
            Rc::new(UH1::UH1_Cons(v5.clone(), v4.clone()))
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn method24(mut v0: Rc<UH2>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3) => {
            let mut v2: US0 = v2.clone();
            let mut v3: Rc<UH2> = v3.clone();
            let mut v4: Rc<UH1> = method24(v3.clone(), v1.clone());
            let mut v31: Rc<str> = match &v2 {
                US0::US0_MissingFrames(v5, v6, v7) => {
                    let mut v5: Rc<str> = v5.clone();
                    let mut v6: Rc<UH3> = v6.clone();
                    let mut v7: i32 = *v7;
                    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cell "); } LIT.with(|lit| lit.clone()) };
                    let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v5));
                    let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" is missing frame "); } LIT.with(|lit| lit.clone()) };
                    let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v10));
                    let mut v12: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let mut v13: Rc<UH1> = method25(v6.clone(), v12.clone());
                    let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", "); } LIT.with(|lit| lit.clone()) };
                    let mut v15: Rc<str> = delimited_15(v14.clone(), v13.clone());
                    let mut v16: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v15));
                    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" of "); } LIT.with(|lit| lit.clone()) };
                    let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v17));
                    let mut v19: Rc<str> = Rc::<str>::from(format!("{:?}", v7));
                    let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v19));
                    v20.clone()
                }
                US0::US0_ReplyGap(v21, v22) => {
                    let mut v21: Rc<str> = v21.clone();
                    let mut v22: Rc<str> = v22.clone();
                    let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cell "); } LIT.with(|lit| lit.clone()) };
                    let mut v24: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v21));
                    let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" replies to "); } LIT.with(|lit| lit.clone()) };
                    let mut v26: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v25));
                    let mut v27: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v22));
                    let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", which is not in the thread: posts before it are missing"); } LIT.with(|lit| lit.clone()) };
                    let mut v29: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v28));
                    v29.clone()
                }
            };
            Rc::new(UH1::UH1_Cons(v31.clone(), v4.clone()))
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn assembled_of_0(mut v0: Rc<str>) -> (i32, Rc<str>, Rc<str>) {
    let mut v1: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v0).unwrap_or_default();
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("frames"); } LIT.with(|lit| lit.clone()) };
    let mut v3: serde_json::Value = v1.get(&*v2).cloned().unwrap_or_default();
    let mut v4: i32 = v3.as_array().map_or(0, |a| a.len()) as i32;
    let mut v5: i32 = v4.wrapping_sub(1i32);
    let mut v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v7: Rc<UH0> = from_1(v3.clone(), v5, v6.clone());
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("known"); } LIT.with(|lit| lit.clone()) };
    let mut v9: serde_json::Value = v1.get(&*v8).cloned().unwrap_or_default();
    let mut v10: i32 = v9.as_array().map_or(0, |a| a.len()) as i32;
    let mut v11: i32 = v10.wrapping_sub(1i32);
    let mut v12: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v13: Rc<UH1> = from_2(v9.clone(), v11, v12.clone());
    let (mut v14, mut v15): (Rc<UH1>, Rc<UH2>) = assembled_3(v7.clone(), v13.clone());
    let mut v16: i32 = match &*v15 {
        UH2::UH2_Nil => {
            0i32
        }
        _ => {
            4i32
        }
    };
    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n\n"); } LIT.with(|lit| lit.clone()) };
    let mut v18: Rc<str> = delimited_15(v17.clone(), v14.clone());
    let mut v19: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v20: Rc<UH1> = method24(v15.clone(), v19.clone());
    let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let mut v22: Rc<str> = delimited_15(v21.clone(), v20.clone());
    (v16, v18.clone(), v22.clone())
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>| -> (i32, Rc<str>, Rc<str>) {
        assembled_of_0(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_assemble(v0: &str) -> (i32, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0))
}
