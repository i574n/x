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
struct Heap0 { l0: Rc<str>, l1: Rc<str>, l2: Rc<str>, l3: Rc<str>, l4: Rc<str>, l5: Rc<str>, l6: Rc<str>, l7: Rc<UH1>, l8: Rc<UH2> }
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<Heap0>, Rc<UH0>),
}
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
fn split_list_2(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH1> {
    let v2: Option<usize> = v1.find(&*v0);
    let mut v3: Option<usize> = method3(v2.clone());
    let mut v4: Rc<dyn Fn((usize)) -> i32> = closure1();
    let mut v5: Option<i32> = v3.map(|x| v4(x));
    let v7: i32 = v5.unwrap_or(-1i32);
    let mut v8: i32 = (v0.clone().len() as i32);
    let mut v9: bool = v7 < 0i32;
    let v11: bool = if v9 {
        true
    } else {
        let v10: bool = v8 == 0i32;
        v10
    };
    if v11 {
        let v12: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH1::UH1_Cons(v1.clone(), v12.clone()))
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
        let v25: Rc<UH1> = split_list_2(v0.clone(), v24.clone());
        Rc::new(UH1::UH1_Cons(v16.clone(), v25.clone()))
    }
}
fn method5(mut v0: Rc<UH3>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2.clone();
            let mut v3: Rc<Heap0> = v3.clone();
            let mut v4: Rc<UH3> = v4.clone();
            let mut v5: Rc<UH3> = method5(v4, v1.clone());
            Rc::new(UH3::UH3_Cons(v2, v3, v5))
        }
        UH3::UH3_Nil => {
            v1
        }
    }
}
fn method7(mut v0: Rc<UH1>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH1> = v3.clone();
                let mut v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3.clone(), v4);
                continue;
            }
            UH1::UH1_Nil => {
                return v1;
            }
        }
    }
}
fn field_at_8(mut v0: i32, mut v1: Rc<UH1>) -> Rc<str> {
    loop {
        match &*v1 {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH1> = v3.clone();
                let mut v4: bool = v0 == 0i32;
                if v4 {
                    return v2.clone();
                } else {
                    let mut v5: i32 = v0.wrapping_sub(1i32);
                    (v0, v1) = (v5, v3.clone());
                    continue;
                }
            }
            UH1::UH1_Nil => {
                let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                return v8.clone();
            }
        }
    }
}
fn fields_after_9(mut v0: i32, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v1 {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH1> = v3.clone();
                let mut v4: bool = v0 > 0i32;
                if v4 {
                    let mut v5: i32 = v0.wrapping_sub(1i32);
                    (v0, v1) = (v5, v3.clone());
                    continue;
                } else {
                    return v1.clone();
                }
            }
            _ => {
                return v1.clone();
            }
        }
    }
}
fn method11(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let v2: US0 = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH2> = method11(v4, v1.clone());
            Rc::new(UH2::UH2_Cons(v2, v3, v5))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn method10(mut v0: Rc<UH1>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH2> = method10(v3.clone(), v1.clone());
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let v6: Option<usize> = v2.find(&*v5);
            let v7: Option<usize> = method3(v6.clone());
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
                    Rc::new(UH2::UH2_Cons(v26.clone(), v24.clone(), v27.clone()))
                } else {
                    let v29: bool = &*v16 == "replied_to";
                    if v29 {
                        let v30: US0 = US0::US0_RepliedTo;
                        let v31: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                        Rc::new(UH2::UH2_Cons(v30.clone(), v24.clone(), v31.clone()))
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
                            Rc::new(UH2::UH2_Cons(v36.clone(), v24.clone(), v37.clone()))
                        } else {
                            { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
                        }
                    }
                }
            };
            method11(v43.clone(), v4.clone())
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn entry_of_line_6(mut v0: Rc<str>) -> Rc<UH3> {
    let v1: bool = &*v0 == "";
    let mut v5: Rc<UH1> = if v1 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
        split_list_2(v3.clone(), v0.clone())
    };
    let v6: i32 = 0i32;
    let v7: i32 = method7(v5.clone(), v6);
    let mut v8: bool = v7 < 9i32;
    if v8 {
        { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v10: i32 = 0i32;
        let v11: Rc<str> = field_at_8(v10, v5.clone());
        let v12: i32 = 1i32;
        let v13: Rc<str> = field_at_8(v12, v5.clone());
        let v14: i32 = 2i32;
        let v15: Rc<str> = field_at_8(v14, v5.clone());
        let v16: i32 = 3i32;
        let v17: Rc<str> = field_at_8(v16, v5.clone());
        let v18: i32 = 5i32;
        let v19: Rc<str> = field_at_8(v18, v5.clone());
        let v20: i32 = 6i32;
        let v21: Rc<str> = field_at_8(v20, v5.clone());
        let v22: i32 = 7i32;
        let v23: Rc<str> = field_at_8(v22, v5.clone());
        let v24: i32 = 8i32;
        let v25: Rc<str> = field_at_8(v24, v5.clone());
        let v26: i32 = 9i32;
        let v27: Rc<UH1> = fields_after_9(v26, v5.clone());
        let v28: i32 = 4i32;
        let v29: Rc<str> = field_at_8(v28, v5.clone());
        let v30: bool = &*v29 == "";
        let v34: Rc<UH1> = if v30 {
            { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
        } else {
            let v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            split_list_2(v32.clone(), v29.clone())
        };
        let v35: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
        let v36: Rc<UH2> = method10(v34.clone(), v35.clone());
        let v37: Rc<Heap0> = Rc::new(Heap0 { l0: v13.clone(), l1: v15.clone(), l2: v17.clone(), l3: v19.clone(), l4: v21.clone(), l5: v23.clone(), l6: v25.clone(), l7: v27.clone(), l8: v36.clone() });
        let v38: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH3::UH3_Cons(v11.clone(), v37.clone(), v38.clone()))
    }
}
fn method4(mut v0: Rc<UH1>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH3> = method4(v3, v1.clone());
            let mut v5: Rc<UH3> = entry_of_line_6(v2);
            method5(v5, v4)
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method12(mut v0: Rc<UH3>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>) {
    let (mut v15, mut v16): (Rc<UH0>, Rc<UH0>) = match &*v0 {
        UH3::UH3_Cons(v3, v4, v5) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<Heap0> = v4.clone();
            let mut v5: Rc<UH3> = v5.clone();
            let v6: bool = &*v3 == "p";
            let (mut v9, mut v10): (Rc<UH0>, Rc<UH0>) = if v6 {
                let v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v1.clone()));
                (v7, v2.clone())
            } else {
                let mut v8: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4, v2.clone()));
                (v1.clone(), v8)
            };
            method12(v5, v9, v10)
        }
        _ => {
            let (mut v13, mut v14): (Rc<UH0>, Rc<UH0>) = match &*v0 {
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
fn method13(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<Heap0> = v2.clone();
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
fn digest_of_1(mut v0: Rc<str>) -> (Rc<UH0>, Rc<UH0>) {
    let v1: bool = &*v0 == "";
    let mut v5: Rc<UH1> = if v1 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
        split_list_2(v3.clone(), v0.clone())
    };
    let v6: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let v7: Rc<UH3> = method4(v5.clone(), v6.clone());
    let mut v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let (mut v10, mut v11): (Rc<UH0>, Rc<UH0>) = method12(v7.clone(), v8.clone(), v9.clone());
    let v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v13: Rc<UH0> = method13(v10.clone(), v12.clone());
    let v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v15: Rc<UH0> = method13(v11.clone(), v14.clone());
    (v13.clone(), v15.clone())
}
fn closure2() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        let v1: Rc<str> = xc_net::xc_local_minute(&*v0);
        v1.clone()
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method15(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method15(v3, v1.clone());
            Rc::new(UH1::UH1_Cons(v2, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method17(mut v0: Rc<str>, mut v1: Rc<UH0>) -> US2 {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v3, v4) => {
                let mut v3: Rc<Heap0> = v3.clone();
                let mut v4: Rc<UH0> = v4.clone();
                let mut v5: Rc<str> = v3.l0.clone();
                let v6: bool = &*v5 == &*v0;
                if v6 {
                    return US2::US2_Some(v3.clone());
                } else {
                    (v0, v1) = (v0.clone(), v4.clone());
                    continue;
                }
            }
            UH0::UH0_Nil => {
                return US2::US2_None;
            }
        }
    }
}
fn quantity_20(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> Rc<str> {
    let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
    let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v3));
    let mut v5: bool = &*v0 == "1";
    let v6: Rc<str> = if v5 {
        v1.clone()
    } else {
        v2.clone()
    };
    let v7: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v6));
    v7.clone()
}
fn metrics_text_19(mut v0: Rc<Heap0>) -> Rc<str> {
    let v1: Rc<str> = v0.l4.clone();
    let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reply"); } LIT.with(|lit| lit.clone()) };
    let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replies"); } LIT.with(|lit| lit.clone()) };
    let mut v4: Rc<str> = quantity_20(v1.clone(), v2.clone(), v3.clone());
    let mut v5: Rc<str> = v0.l5.clone();
    let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("repost"); } LIT.with(|lit| lit.clone()) };
    let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposts"); } LIT.with(|lit| lit.clone()) };
    let mut v8: Rc<str> = quantity_20(v5.clone(), v6.clone(), v7.clone());
    let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  ["); } LIT.with(|lit| lit.clone()) };
    let v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v4));
    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", "); } LIT.with(|lit| lit.clone()) };
    let v14: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v10, v11)), v8)), v11));
    let v15: Rc<str> = v0.l6.clone();
    let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("like"); } LIT.with(|lit| lit.clone()) };
    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("likes"); } LIT.with(|lit| lit.clone()) };
    let v18: Rc<str> = quantity_20(v15.clone(), v16.clone(), v17.clone());
    let v19: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v18));
    let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
    let v21: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v20));
    v21.clone()
}
fn render_post_18(mut v0: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v1: Rc<Heap0>) -> Rc<str> {
    let v2: Rc<str> = v1.l2.clone();
    let mut v3: Rc<str> = v0(v2.clone());
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  @"); } LIT.with(|lit| lit.clone()) };
    let mut v5: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v4));
    let v6: Rc<str> = v1.l1.clone();
    let v7: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v6));
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  "); } LIT.with(|lit| lit.clone()) };
    let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v8));
    let v10: Rc<str> = v1.l3.clone();
    let v11: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v10));
    let v12: Rc<str> = metrics_text_19(v1.clone());
    let v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v12));
    v13.clone()
}
fn method24(mut v0: Rc<UH4>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match &*v0 {
            UH4::UH4_Cons(v2, v3) => {
                let v2: i32 = *v2;
                let mut v3: Rc<UH4> = v3.clone();
                let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  "); } LIT.with(|lit| lit.clone()) };
                let mut v5: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v4));
                (v0, v1) = (v3.clone(), v5.clone());
                continue;
            }
            UH4::UH4_Nil => {
                return v1.clone();
            }
        }
    }
}
fn method25(mut v0: i32, mut v1: i32) -> Rc<UH4> {
    let v2: bool = v1 < v0;
    if v2 {
        let mut v3: i32 = v1.wrapping_add(1i32);
        let mut v4: Rc<UH4> = method25(v0, v3);
        Rc::new(UH4::UH4_Cons(v1, v4.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) }
    }
}
fn indent_23(mut v0: i32) -> Rc<str> {
    let v1: i32 = 0i32;
    let v2: Rc<UH4> = method25(v0, v1);
    let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    method24(v2.clone(), v3.clone())
}
fn method22(mut v0: i32, mut v1: Rc<UH1>, mut v2: Rc<UH1>) -> Rc<UH1> {
    match &*v1 {
        UH1::UH1_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH1> = v4.clone();
            let mut v5: Rc<UH1> = method22(v0, v4, v2.clone());
            let v6: Rc<str> = indent_23(v0);
            let v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v3));
            Rc::new(UH1::UH1_Cons(v7, v5))
        }
        UH1::UH1_Nil => {
            v2
        }
    }
}
fn ref_line_28(mut v0: i32, mut v1: US0, mut v2: Rc<Heap0>) -> Rc<str> {
    let mut v3: Rc<str> = indent_23(v0);
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("> "); } LIT.with(|lit| lit.clone()) };
    let mut v5: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v4));
    let v11: Rc<str> = match &v1 {
        US0::US0_Quoted => {
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
            v6.clone()
        }
        US0::US0_RepliedTo => {
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replied to"); } LIT.with(|lit| lit.clone()) };
            v7.clone()
        }
        US0::US0_Reposted => {
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposted"); } LIT.with(|lit| lit.clone()) };
            v8.clone()
        }
    };
    let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v11));
    let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" @"); } LIT.with(|lit| lit.clone()) };
    let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v13));
    let v15: Rc<str> = v2.l1.clone();
    let v16: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v15));
    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
    let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v17));
    let v19: Rc<str> = v2.l3.clone();
    let v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v19));
    let v21: Rc<str> = metrics_text_19(v2.clone());
    let v22: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v21));
    v22.clone()
}
fn ref_lines_27(mut v0: Rc<UH0>, mut v1: i32, mut v2: bool, mut v3: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v4: i32, mut v5: US0, mut v6: Rc<str>) -> Rc<UH1> {
    let v7: US2 = method17(v6.clone(), v0.clone());
    match &v7 {
        US2::US2_None => {
            let v13: i32 = v4.wrapping_add(1i32);
            let v14: Rc<str> = indent_23(v13);
            let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("> "); } LIT.with(|lit| lit.clone()) };
            let v16: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v15));
            let v22: Rc<str> = match &v5 {
                US0::US0_Quoted => {
                    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
                    v17.clone()
                }
                US0::US0_RepliedTo => {
                    let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replied to"); } LIT.with(|lit| lit.clone()) };
                    v18.clone()
                }
                US0::US0_Reposted => {
                    let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposted"); } LIT.with(|lit| lit.clone()) };
                    v19.clone()
                }
            };
            let v23: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v22));
            let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" a post not loaded ("); } LIT.with(|lit| lit.clone()) };
            let v26: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v23, v24)), v6));
            let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(")"); } LIT.with(|lit| lit.clone()) };
            let v28: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v27));
            let v29: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            Rc::new(UH1::UH1_Cons(v28.clone(), v29.clone()))
        }
        US2::US2_Some(v8) => {
            let mut v8: Rc<Heap0> = v8.clone();
            let mut v9: i32 = v4.wrapping_add(1i32);
            let v10: Rc<str> = ref_line_28(v9, v5.clone(), v8.clone());
            let v11: Rc<UH1> = post_lines_21(v0.clone(), v1, v2, v3.clone(), v9, v8.clone());
            Rc::new(UH1::UH1_Cons(v10.clone(), v11.clone()))
        }
    }
}
fn method26(mut v0: Rc<UH0>, mut v1: i32, mut v2: bool, mut v3: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v4: i32, mut v5: Rc<UH2>, mut v6: Rc<UH1>) -> Rc<UH1> {
    match &*v5 {
        UH2::UH2_Cons(v7, v8, v9) => {
            let v7: US0 = v7.clone();
            let mut v8: Rc<str> = v8.clone();
            let mut v9: Rc<UH2> = v9.clone();
            let v10: Rc<UH1> = method26(v0.clone(), v1, v2, v3.clone(), v4, v9, v6.clone());
            let v11: Rc<UH1> = ref_lines_27(v0, v1, v2, v3, v4, v7, v8);
            method15(v11, v10)
        }
        UH2::UH2_Nil => {
            v6
        }
    }
}
fn post_lines_21(mut v0: Rc<UH0>, mut v1: i32, mut v2: bool, mut v3: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v4: i32, mut v5: Rc<Heap0>) -> Rc<UH1> {
    let v11: Rc<UH1> = if v2 {
        let v6: i32 = v4.wrapping_add(1i32);
        let v7: Rc<UH1> = v5.l7.clone();
        let mut v8: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        method22(v6, v7.clone(), v8.clone())
    } else {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    };
    let v12: bool = v4 >= v1;
    if v12 {
        v11.clone()
    } else {
        let v13: Rc<UH2> = v5.l8.clone();
        let v14: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let v15: Rc<UH1> = method26(v0.clone(), v1, v2, v3.clone(), v4, v13.clone(), v14.clone());
        method15(v11.clone(), v15.clone())
    }
}
fn entry_lines_16(mut v0: Rc<UH0>, mut v1: i32, mut v2: bool, mut v3: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v4: Rc<Heap0>) -> Rc<UH1> {
    let mut v5: Rc<UH2> = v4.l8.clone();
    let v15: US1 = match &*v5 {
        UH2::UH2_Cons(v6, v7, v8) => {
            let v6: US0 = v6.clone();
            let v7: Rc<str> = v7.clone();
            let mut v8: Rc<UH2> = v8.clone();
            match &*v8 {
                UH2::UH2_Nil => {
                    match &v6 {
                        US0::US0_Reposted => {
                            US1::US1_Some(v7.clone())
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
    let v22: US2 = match &v15 {
        US1::US1_Some(v16) => {
            let v16: Rc<str> = v16.clone();
            let v17: bool = v1 > 0i32;
            if v17 {
                method17(v16.clone(), v0.clone())
            } else {
                US2::US2_None
            }
        }
        _ => {
            US2::US2_None
        }
    };
    match &v22 {
        US2::US2_None => {
            let v43: Rc<str> = render_post_18(v3.clone(), v4.clone());
            let v44: i32 = 0i32;
            let v45: Rc<UH1> = post_lines_21(v0.clone(), v1, v2, v3.clone(), v44, v4.clone());
            Rc::new(UH1::UH1_Cons(v43.clone(), v45.clone()))
        }
        US2::US2_Some(v23) => {
            let v23: Rc<Heap0> = v23.clone();
            let v24: Rc<str> = v4.l2.clone();
            let v25: Rc<str> = v3(v24.clone());
            let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  @"); } LIT.with(|lit| lit.clone()) };
            let v27: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v26));
            let v28: Rc<str> = v4.l1.clone();
            let v29: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v28));
            let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  reposted @"); } LIT.with(|lit| lit.clone()) };
            let v31: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v30));
            let v32: Rc<str> = v23.l1.clone();
            let v33: Rc<str> = Rc::<str>::from(format!("{}{}", v31, v32));
            let v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let v35: Rc<str> = Rc::<str>::from(format!("{}{}", v33, v34));
            let v36: Rc<str> = v23.l3.clone();
            let v37: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v36));
            let v38: Rc<str> = metrics_text_19(v23.clone());
            let v39: Rc<str> = Rc::<str>::from(format!("{}{}", v37, v38));
            let v40: i32 = 0i32;
            let v41: Rc<UH1> = post_lines_21(v0.clone(), v1, v2, v3.clone(), v40, v23.clone());
            Rc::new(UH1::UH1_Cons(v39.clone(), v41.clone()))
        }
    }
}
fn method14(mut v0: Rc<UH0>, mut v1: i32, mut v2: bool, mut v3: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v4: Rc<UH0>, mut v5: Rc<UH1>) -> Rc<UH1> {
    match &*v4 {
        UH0::UH0_Cons(v6, v7) => {
            let v6: Rc<Heap0> = v6.clone();
            let v7: Rc<UH0> = v7.clone();
            let mut v8: Rc<UH1> = method14(v0.clone(), v1, v2, v3.clone(), v7, v5.clone());
            let mut v9: Rc<UH1> = entry_lines_16(v0, v1, v2, v3, v6);
            method15(v9, v8)
        }
        UH0::UH0_Nil => {
            v5
        }
    }
}
fn method29(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH1>, mut v2: i32) -> i32 {
    loop {
        match &*v1 {
            UH1::UH1_Cons(v3, v4) => {
                let mut v3: Rc<str> = v3.clone();
                let mut v4: Rc<UH1> = v4.clone();
                v0.borrow_mut().push(v3);
                let mut v5: i32 = v2.wrapping_add(1i32);
                (v0, v1, v2) = (v0.clone(), v4.clone(), v5);
                continue;
            }
            UH1::UH1_Nil => {
                return v2;
            }
        }
    }
}
fn method30(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<Heap0> = v2.clone();
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
fn rendered_0(mut v0: Rc<str>, mut v1: i32, mut v2: i32, mut v3: i32, mut v4: bool) -> (Rc<str>, i32) {
    let mut v5: Rc<str> = xc_select::xc_select(&*v0, v1, v2);
    let (mut v6, mut v7): (Rc<UH0>, Rc<UH0>) = digest_of_1(v5.clone());
    let mut v8: Rc<dyn Fn(Rc<str>) -> Rc<str>> = closure2();
    let mut v9: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v10: Rc<UH1> = method14(v7.clone(), v3, v4, v8.clone(), v6.clone(), v9.clone());
    let v11: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v12: i32 = 0i32;
    let v13: i32 = method29(v11.clone(), v10.clone(), v12);
    let v14: Rc<Vec<Rc<str>>> = Rc::new(v11.borrow().clone());
    let v15: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v14).as_ref().clone()));
    let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let v17: Rc<str> = Rc::<str>::from((*v15.borrow()).join(&*v16));
    let v18: i32 = 0i32;
    let v19: i32 = method30(v6.clone(), v18);
    (v17.clone(), v19)
}
fn closure0() -> Rc<dyn Fn(Rc<str>, i32, i32, i32, bool) -> (Rc<str>, i32)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32, i32, i32, bool) -> (Rc<str>, i32)> = Rc::new(move |mut v0: Rc<str>, mut v1: i32, mut v2: i32, mut v3: i32, mut v4: bool| -> (Rc<str>, i32) {
        rendered_0(v0.clone(), v1, v2, v3, v4)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_view(v0: &str, v1: i32, v2: i32, v3: i32, v4: bool) -> (Rc<str>, i32) {
    closure0()(Rc::<str>::from(v0), v1, v2, v3, v4)
}
