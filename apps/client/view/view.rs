#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<UH1>),
}
#[derive(Clone)]
enum US0 {
    US0_Quoted,
    US0_RepliedTo,
    US0_Reposted,
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(US0, Rc<str>, Rc<UH2>),
}
pub struct Heap0 { pub l0: Rc<str>, pub l1: Rc<str>, pub l2: Rc<str>, pub l3: Rc<str>, pub l4: Rc<str>, pub l5: Rc<str>, pub l6: Rc<str>, pub l7: Rc<UH1>, pub l8: Rc<UH2> }
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<Heap0>, Rc<UH0>),
}
pub struct Mut0 { pub l0: i32, pub l1: Rc<UH1> }
#[derive(Clone)]
enum UH3 {
    UH3_Nil,
    UH3_Cons(Rc<str>, Rc<Heap0>, Rc<UH3>),
}
#[derive(Clone)]
enum US1 {
    US1_Some(Rc<str>),
    US1_None,
}
#[derive(Clone)]
enum US2 {
    US2_Some(Rc<Heap0>),
    US2_None,
}
#[derive(Clone)]
enum UH4 {
    UH4_Nil,
    UH4_Cons(i32, Rc<UH4>),
}
fn method3(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let mut v3: Rc<UH1> = v3;
                let v4: Rc<UH1> = Rc::new(UH1::UH1_Cons(v2, v1));
                (v0, v1) = (v3, v4);
                continue;
            }
            UH1::UH1_Nil => {
                return v1;
            }
        }
    }
}
fn method4(mut v0: i32, mut v1: &Rc<RefCell<Mut0>>) -> bool {
    let v2: i32 = v1.borrow().l0;
    let mut v3: bool = v2 < v0;
    v3
}
fn split_list_2(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH1> {
    let v2: i32 = (v0.clone().len() as i32);
    let mut v3: bool = v2 == 0i32;
    if v3 {
        let v4: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH1::UH1_Cons(v1, v4))
    } else {
        let v6: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(v1.split(&*v0).map(|x| Rc::<str>::from(x)).collect::<Vec<Rc<str>>>()));
        let v7: i32 = (v6.clone().borrow().len() as i32);
        let mut v8: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let mut v9: Rc<RefCell<Mut0>> = Rc::new(RefCell::new(Mut0 { l0: 0i32, l1: v8 }));
        while method4(v7, &v9) {
            let v11: i32 = v9.borrow().l0;
            let v12: Rc<UH1> = v9.borrow().l1.clone();
            let v13: Rc<str> = v6.borrow()[v11 as usize].clone();
            let v14: i32 = v11.wrapping_add(1i32);
            let v15: Rc<UH1> = Rc::new(UH1::UH1_Cons(v13, v12));
            v9.borrow_mut().l0 = v14;
            v9.borrow_mut().l1 = v15;
            ()
        };
        let v16: Rc<UH1> = v9.borrow().l1.clone();
        let v17: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        method3(v16, v17)
    }
}
fn method6(mut v0: Rc<UH3>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match Rc::unwrap_or_clone(v0) {
        UH3::UH3_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2;
            let mut v3: Rc<Heap0> = v3;
            let v4: Rc<UH3> = v4;
            let v5: Rc<UH3> = method6(v4, v1);
            Rc::new(UH3::UH3_Cons(v2, v3, v5))
        }
        UH3::UH3_Nil => {
            v1
        }
    }
}
fn method8(mut v0: Rc<UH1>, mut v1: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let mut v3: Rc<UH1> = v3;
                let v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3, v4);
                continue;
            }
            UH1::UH1_Nil => {
                return v1;
            }
        }
    }
}
fn field_at_9(mut v0: i32, mut v1: Rc<UH1>) -> Rc<str> {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let mut v3: Rc<UH1> = v3;
                let v4: bool = v0 == 0i32;
                if v4 {
                    return v2;
                } else {
                    let v5: i32 = v0.wrapping_sub(1i32);
                    (v0, v1) = (v5, v3);
                    continue;
                }
            }
            UH1::UH1_Nil => {
                let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                return v8;
            }
        }
    }
}
fn fields_after_10(mut v0: i32, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v1 {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH1> = v3.clone();
                let v4: bool = v0 > 0i32;
                if v4 {
                    let v5: i32 = v0.wrapping_sub(1i32);
                    (v0, v1) = (v5, v3);
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
fn method12(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match Rc::unwrap_or_clone(v0) {
        UH2::UH2_Cons(v2, v3, v4) => {
            let v2: US0 = v2;
            let mut v3: Rc<str> = v3;
            let v4: Rc<UH2> = v4;
            let v5: Rc<UH2> = method12(v4, v1);
            Rc::new(UH2::UH2_Cons(v2, v3, v5))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn method13(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure1() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let mut v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method11(mut v0: Rc<UH1>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let mut v3: Rc<UH1> = v3;
            let v4: Rc<UH2> = method11(v3, v1);
            let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let v6: Option<usize> = v2.find(&*v5);
            let v7: Option<usize> = method13(v6);
            let mut v8: Rc<dyn Fn((usize)) -> i32> = closure1();
            let mut v9: Option<i32> = v7.map(|x| v8(x));
            let v11: i32 = v9.unwrap_or(-1i32);
            let v12: bool = v11 < 0i32;
            let v43: Rc<UH2> = if v12 {
                { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
            } else {
                let v14: usize = ((0i32) as usize);
                let v15: usize = ((v11) as usize);
                let v16: Rc<str> = Rc::<str>::from(&(v2)[v14..v15]);
                let v17: i32 = v11.wrapping_add(1i32);
                let v18: i32 = (v2.clone().len() as i32);
                let v19: i32 = v18.wrapping_sub(v11);
                let v20: i32 = v19.wrapping_sub(1i32);
                let v21: usize = ((v17) as usize);
                let v22: i32 = v17.wrapping_add(v20);
                let v23: usize = ((v22) as usize);
                let v24: Rc<str> = Rc::<str>::from(&(v2)[v21..v23]);
                let v25: bool = &*v16 == "quoted";
                if v25 {
                    let v26: US0 = US0::US0_Quoted;
                    let v27: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    Rc::new(UH2::UH2_Cons(v26, v24, v27))
                } else {
                    let v29: bool = &*v16 == "replied_to";
                    if v29 {
                        let v30: US0 = US0::US0_RepliedTo;
                        let v31: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                        Rc::new(UH2::UH2_Cons(v30, v24, v31))
                    } else {
                        let v33: bool = &*v16 == "reposted";
                        let v35: bool = if v33 {
                            true
                        } else {
                            let v34: bool = &*v16 == "retweeted";
                            v34
                        };
                        if v35 {
                            let v36: US0 = US0::US0_Reposted;
                            let v37: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                            Rc::new(UH2::UH2_Cons(v36, v24, v37))
                        } else {
                            { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
                        }
                    }
                }
            };
            method12(v43, v4)
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn entry_of_line_7(mut v0: Rc<str>) -> Rc<UH3> {
    let mut v1: bool = &*v0 == "";
    let v5: Rc<UH1> = if v1 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
        split_list_2(v3, v0)
    };
    let v6: i32 = 0i32;
    let v7: i32 = method8(v5.clone(), v6);
    let mut v8: bool = v7 < 9i32;
    if v8 {
        { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v10: i32 = 0i32;
        let v11: Rc<str> = field_at_9(v10, v5.clone());
        let v12: i32 = 1i32;
        let v13: Rc<str> = field_at_9(v12, v5.clone());
        let v14: i32 = 2i32;
        let v15: Rc<str> = field_at_9(v14, v5.clone());
        let v16: i32 = 3i32;
        let v17: Rc<str> = field_at_9(v16, v5.clone());
        let v18: i32 = 5i32;
        let v19: Rc<str> = field_at_9(v18, v5.clone());
        let v20: i32 = 6i32;
        let v21: Rc<str> = field_at_9(v20, v5.clone());
        let v22: i32 = 7i32;
        let v23: Rc<str> = field_at_9(v22, v5.clone());
        let v24: i32 = 8i32;
        let v25: Rc<str> = field_at_9(v24, v5.clone());
        let v26: i32 = 9i32;
        let v27: Rc<UH1> = fields_after_10(v26, v5.clone());
        let v28: i32 = 4i32;
        let v29: Rc<str> = field_at_9(v28, v5);
        let v30: bool = &*v29 == "";
        let v34: Rc<UH1> = if v30 {
            { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
        } else {
            let v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            split_list_2(v32, v29)
        };
        let v35: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
        let v36: Rc<UH2> = method11(v34, v35);
        let v37: Rc<Heap0> = Rc::new(Heap0 { l0: v13, l1: v15, l2: v17, l3: v19, l4: v21, l5: v23, l6: v25, l7: v27, l8: v36 });
        let v38: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH3::UH3_Cons(v11, v37, v38))
    }
}
fn method5(mut v0: Rc<UH1>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let mut v3: Rc<UH1> = v3;
            let v4: Rc<UH3> = method5(v3, v1);
            let v5: Rc<UH3> = entry_of_line_7(v2);
            method6(v5, v4)
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method14(mut v0: Rc<UH3>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>) {
    let (mut v15, mut v16): (Rc<UH0>, Rc<UH0>) = match &*v0 {
        UH3::UH3_Cons(v3, v4, v5) => {
            let mut v3: Rc<str> = v3.clone();
            let v4: Rc<Heap0> = v4.clone();
            let v5: Rc<UH3> = v5.clone();
            let v6: bool = &*v3 == "p";
            let (mut v9, mut v10): (Rc<UH0>, Rc<UH0>) = if v6 {
                let v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4, v1));
                (v7, v2)
            } else {
                let mut v8: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4, v2));
                (v1, v8)
            };
            method14(v5, v9, v10)
        }
        _ => {
            let (mut v13, mut v14): (Rc<UH0>, Rc<UH0>) = match Rc::unwrap_or_clone(v0) {
                UH3::UH3_Nil => {
                    (v1, v2)
                }
                _ => unreachable!(),
            };
            (v13, v14)
        }
    };
    (v15, v16)
}
fn method15(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<Heap0> = v2;
                let mut v3: Rc<UH0> = v3;
                let v4: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2, v1));
                (v0, v1) = (v3, v4);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn digest_of_1(mut v0: Rc<str>) -> (Rc<UH0>, Rc<UH0>) {
    let mut v1: bool = &*v0 == "";
    let v5: Rc<UH1> = if v1 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
        split_list_2(v3, v0)
    };
    let v6: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let v7: Rc<UH3> = method5(v5, v6);
    let mut v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let (mut v10, mut v11): (Rc<UH0>, Rc<UH0>) = method14(v7, v8, v9);
    let v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v13: Rc<UH0> = method15(v10, v12);
    let v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v15: Rc<UH0> = method15(v11, v14);
    (v13, v15)
}
fn closure2() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        let mut v1: Rc<str> = xc_net::xc_local_minute(&*v0);
        v1
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method17(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let mut v3: Rc<UH1> = v3;
            let v4: Rc<UH1> = method17(v3, v1);
            Rc::new(UH1::UH1_Cons(v2, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method19(mut v0: Rc<str>, mut v1: Rc<UH0>) -> US2 {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH0::UH0_Cons(v3, v4) => {
                let mut v3: Rc<Heap0> = v3;
                let v4: Rc<UH0> = v4;
                let v5: Rc<str> = v3.l0.clone();
                let v6: bool = &*v5 == &*v0;
                if v6 {
                    return US2::US2_Some(v3);
                } else {
                    v1 = v4;
                    continue;
                }
            }
            UH0::UH0_Nil => {
                return US2::US2_None;
            }
        }
    }
}
fn quantity_22(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> Rc<str> {
    let mut v3: Rc<str> = Rc::<str>::from(format!("{}{}", v0.clone(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) }));
    let v4: bool = &*v0 == "1";
    let v5: Rc<str> = if v4 {
        v1
    } else {
        v2
    };
    let v6: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v5));
    v6
}
fn metrics_text_21(mut v0: &Rc<Heap0>) -> Rc<str> {
    let mut v1: Rc<str> = v0.l4.clone();
    let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reply"); } LIT.with(|lit| lit.clone()) };
    let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replies"); } LIT.with(|lit| lit.clone()) };
    let v4: Rc<str> = quantity_22(v1, v2, v3);
    let v5: Rc<str> = v0.l5.clone();
    let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("repost"); } LIT.with(|lit| lit.clone()) };
    let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposts"); } LIT.with(|lit| lit.clone()) };
    let mut v8: Rc<str> = quantity_22(v5, v6, v7);
    let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  ["); } LIT.with(|lit| lit.clone()) }, v4));
    let v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", "); } LIT.with(|lit| lit.clone()) }));
    let v11: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v8));
    let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", "); } LIT.with(|lit| lit.clone()) }));
    let v13: Rc<str> = v0.l6.clone();
    let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("like"); } LIT.with(|lit| lit.clone()) };
    let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("likes"); } LIT.with(|lit| lit.clone()) };
    let v16: Rc<str> = quantity_22(v13, v14, v15);
    let v17: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v16));
    let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) }));
    v18
}
fn render_post_20(mut v0: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v1: &Rc<Heap0>) -> Rc<str> {
    let v2: Rc<str> = v1.l2.clone();
    let mut v3: Rc<str> = v0(v2);
    let v4: Rc<str> = Rc::<str>::from(format!("{}{}", v3, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  @"); } LIT.with(|lit| lit.clone()) }));
    let v5: Rc<str> = v1.l1.clone();
    let v6: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v5));
    let v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  "); } LIT.with(|lit| lit.clone()) }));
    let mut v8: Rc<str> = v1.l3.clone();
    let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v8));
    let v10: Rc<str> = metrics_text_21(v1);
    let v11: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v10));
    v11
}
fn method26(mut v0: Rc<UH4>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH4::UH4_Cons(v2, v3) => {
                let v2: i32 = v2;
                let mut v3: Rc<UH4> = v3;
                let v4: Rc<str> = Rc::<str>::from(format!("{}{}", v1, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  "); } LIT.with(|lit| lit.clone()) }));
                (v0, v1) = (v3, v4);
                continue;
            }
            UH4::UH4_Nil => {
                return v1;
            }
        }
    }
}
fn method27(mut v0: i32, mut v1: i32) -> Rc<UH4> {
    let v2: bool = v1 < v0;
    if v2 {
        let mut v3: i32 = v1.wrapping_add(1i32);
        let v4: Rc<UH4> = method27(v0, v3);
        Rc::new(UH4::UH4_Cons(v1, v4))
    } else {
        { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) }
    }
}
fn indent_25(mut v0: i32) -> Rc<str> {
    let mut v1: i32 = 0i32;
    let v2: Rc<UH4> = method27(v0, v1);
    let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    method26(v2, v3)
}
fn method24(mut v0: i32, mut v1: Rc<UH1>, mut v2: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v1) {
        UH1::UH1_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3;
            let v4: Rc<UH1> = v4;
            let v5: Rc<UH1> = method24(v0, v4, v2);
            let v6: Rc<str> = indent_25(v0);
            let v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v3));
            Rc::new(UH1::UH1_Cons(v7, v5))
        }
        UH1::UH1_Nil => {
            v2
        }
    }
}
fn ref_line_30(mut v0: i32, mut v1: US0, mut v2: &Rc<Heap0>) -> Rc<str> {
    let mut v3: Rc<str> = indent_25(v0);
    let v4: Rc<str> = Rc::<str>::from(format!("{}{}", v3, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("> "); } LIT.with(|lit| lit.clone()) }));
    let v10: Rc<str> = match v1 {
        US0::US0_Quoted => {
            let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
            v5
        }
        US0::US0_RepliedTo => {
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replied to"); } LIT.with(|lit| lit.clone()) };
            v6
        }
        US0::US0_Reposted => {
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposted"); } LIT.with(|lit| lit.clone()) };
            v7
        }
    };
    let v11: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v10));
    let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" @"); } LIT.with(|lit| lit.clone()) }));
    let v13: Rc<str> = v2.l1.clone();
    let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v13));
    let v15: Rc<str> = Rc::<str>::from(format!("{}{}", v14, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) }));
    let v16: Rc<str> = v2.l3.clone();
    let v17: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v16));
    let v18: Rc<str> = metrics_text_21(v2);
    let v19: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v18));
    v19
}
fn ref_lines_29(mut v0: Rc<UH0>, mut v1: i32, mut v2: bool, mut v3: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v4: i32, mut v5: US0, mut v6: Rc<str>) -> Rc<UH1> {
    let v7: US2 = method19(v6.clone(), v0.clone());
    match v7 {
        US2::US2_None => {
            let v13: i32 = v4.wrapping_add(1i32);
            let v14: Rc<str> = indent_25(v13);
            let v15: Rc<str> = Rc::<str>::from(format!("{}{}", v14, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("> "); } LIT.with(|lit| lit.clone()) }));
            let v21: Rc<str> = match v5 {
                US0::US0_Quoted => {
                    let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
                    v16
                }
                US0::US0_RepliedTo => {
                    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replied to"); } LIT.with(|lit| lit.clone()) };
                    v17
                }
                US0::US0_Reposted => {
                    let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposted"); } LIT.with(|lit| lit.clone()) };
                    v18
                }
            };
            let v22: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v21));
            let v23: Rc<str> = Rc::<str>::from(format!("{}{}", v22, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" a post not loaded ("); } LIT.with(|lit| lit.clone()) }));
            let v24: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v6));
            let v25: Rc<str> = Rc::<str>::from(format!("{}{}", v24, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(")"); } LIT.with(|lit| lit.clone()) }));
            let v26: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            Rc::new(UH1::UH1_Cons(v25, v26))
        }
        US2::US2_Some(v8) => {
            let mut v8: Rc<Heap0> = v8;
            let mut v9: i32 = v4.wrapping_add(1i32);
            let v10: Rc<str> = ref_line_30(v9, v5, &v8);
            let v11: Rc<UH1> = post_lines_23(v0, v1, v2, v3, v9, &v8);
            Rc::new(UH1::UH1_Cons(v10, v11))
        }
    }
}
fn method28(mut v0: Rc<UH0>, mut v1: i32, mut v2: bool, mut v3: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v4: i32, mut v5: Rc<UH2>, mut v6: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v5) {
        UH2::UH2_Cons(v7, v8, v9) => {
            let v7: US0 = v7;
            let mut v8: Rc<str> = v8;
            let mut v9: Rc<UH2> = v9;
            let v10: Rc<UH1> = method28(v0.clone(), v1, v2, v3.clone(), v4, v9, v6);
            let v11: Rc<UH1> = ref_lines_29(v0, v1, v2, v3, v4, v7, v8);
            method17(v11, v10)
        }
        UH2::UH2_Nil => {
            v6
        }
    }
}
fn post_lines_23(mut v0: Rc<UH0>, mut v1: i32, mut v2: bool, mut v3: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v4: i32, mut v5: &Rc<Heap0>) -> Rc<UH1> {
    let v11: Rc<UH1> = if v2 {
        let v6: i32 = v4.wrapping_add(1i32);
        let v7: Rc<UH1> = v5.l7.clone();
        let mut v8: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        method24(v6, v7, v8)
    } else {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    };
    let v12: bool = v4 >= v1;
    if v12 {
        v11
    } else {
        let v13: Rc<UH2> = v5.l8.clone();
        let v14: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let v15: Rc<UH1> = method28(v0, v1, v2, v3, v4, v13, v14);
        method17(v11, v15)
    }
}
fn entry_lines_18(mut v0: Rc<UH0>, mut v1: i32, mut v2: bool, mut v3: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v4: &Rc<Heap0>) -> Rc<UH1> {
    let v5: Rc<UH2> = v4.l8.clone();
    let v15: US1 = match Rc::unwrap_or_clone(v5) {
        UH2::UH2_Cons(v6, v7, v8) => {
            let v6: US0 = v6;
            let v7: Rc<str> = v7;
            let mut v8: Rc<UH2> = v8;
            match Rc::unwrap_or_clone(v8) {
                UH2::UH2_Nil => {
                    match v6 {
                        US0::US0_Reposted => {
                            US1::US1_Some(v7)
                        }
                        _ => {
                            US1::US1_None
                        }
                    }
                }
                _ => {
                    US1::US1_None
                }
            }
        }
        _ => {
            US1::US1_None
        }
    };
    let v22: US2 = match v15 {
        US1::US1_Some(v16) => {
            let v16: Rc<str> = v16;
            let v17: bool = v1 > 0i32;
            if v17 {
                method19(v16, v0.clone())
            } else {
                US2::US2_None
            }
        }
        _ => {
            US2::US2_None
        }
    };
    match v22 {
        US2::US2_None => {
            let v40: Rc<str> = render_post_20(v3.clone(), v4);
            let v41: i32 = 0i32;
            let v42: Rc<UH1> = post_lines_23(v0, v1, v2, v3, v41, v4);
            Rc::new(UH1::UH1_Cons(v40, v42))
        }
        US2::US2_Some(v23) => {
            let v23: Rc<Heap0> = v23;
            let v24: Rc<str> = v4.l2.clone();
            let v25: Rc<str> = v3(v24);
            let v26: Rc<str> = Rc::<str>::from(format!("{}{}", v25, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  @"); } LIT.with(|lit| lit.clone()) }));
            let v27: Rc<str> = v4.l1.clone();
            let v28: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v27));
            let v29: Rc<str> = Rc::<str>::from(format!("{}{}", v28, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  reposted @"); } LIT.with(|lit| lit.clone()) }));
            let v30: Rc<str> = v23.l1.clone();
            let v31: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v30));
            let v32: Rc<str> = Rc::<str>::from(format!("{}{}", v31, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) }));
            let v33: Rc<str> = v23.l3.clone();
            let v34: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v33));
            let v35: Rc<str> = metrics_text_21(&v23);
            let v36: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v35));
            let v37: i32 = 0i32;
            let v38: Rc<UH1> = post_lines_23(v0, v1, v2, v3, v37, &v23);
            Rc::new(UH1::UH1_Cons(v36, v38))
        }
    }
}
fn method16(mut v0: Rc<UH0>, mut v1: i32, mut v2: bool, mut v3: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v4: Rc<UH0>, mut v5: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v4) {
        UH0::UH0_Cons(v6, v7) => {
            let v6: Rc<Heap0> = v6;
            let v7: Rc<UH0> = v7;
            let mut v8: Rc<UH1> = method16(v0.clone(), v1, v2, v3.clone(), v7, v5);
            let mut v9: Rc<UH1> = entry_lines_18(v0, v1, v2, v3, &v6);
            method17(v9, v8)
        }
        UH0::UH0_Nil => {
            v5
        }
    }
}
fn method31(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH1>, mut v2: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH1::UH1_Cons(v3, v4) => {
                let mut v3: Rc<str> = v3;
                let v4: Rc<UH1> = v4;
                v0.borrow_mut().push(v3);
                let v5: i32 = v2.wrapping_add(1i32);
                (v1, v2) = (v4, v5);
                continue;
            }
            UH1::UH1_Nil => {
                return v2;
            }
        }
    }
}
fn method32(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<Heap0> = v2;
                let mut v3: Rc<UH0> = v3;
                let v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3, v4);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn rendered_0(mut v0: Rc<str>, mut v1: i32, mut v2: i32, mut v3: i32, mut v4: bool) -> (Rc<str>, i32) {
    let v5: Rc<str> = xc_select::xc_select(&*v0, v1, v2);
    let (mut v6, mut v7): (Rc<UH0>, Rc<UH0>) = digest_of_1(v5);
    let mut v8: Rc<dyn Fn(Rc<str>) -> Rc<str>> = closure2();
    let mut v9: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v10: Rc<UH1> = method16(v7, v3, v4, v8, v6.clone(), v9);
    let v11: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v12: i32 = 0i32;
    let v13: i32 = method31(v11.clone(), v10, v12);
    let v14: Rc<Vec<Rc<str>>> = Rc::new(v11.borrow().clone());
    let v15: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v14).as_ref().clone()));
    let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let v17: Rc<str> = Rc::<str>::from((*v15.borrow()).join(&*v16));
    let v18: i32 = 0i32;
    let v19: i32 = method32(v6, v18);
    (v17, v19)
}
fn closure0() -> Rc<dyn Fn(Rc<str>, i32, i32, i32, bool) -> (Rc<str>, i32)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32, i32, i32, bool) -> (Rc<str>, i32)> = Rc::new(move |mut v0: Rc<str>, mut v1: i32, mut v2: i32, mut v3: i32, mut v4: bool| -> (Rc<str>, i32) {
        rendered_0(v0, v1, v2, v3, v4)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_view(v0: &str, v1: i32, v2: i32, v3: i32, v4: bool) -> (Rc<str>, i32) {
    closure0()(Rc::<str>::from(v0), v1, v2, v3, v4)
}
pub type SpiralShape_bc41c7d2dc72 = Heap0;
pub type SpiralShape_accbf6de6842 = Mut0;
