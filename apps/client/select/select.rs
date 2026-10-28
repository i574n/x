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
enum UH4 {
    UH4_Nil,
    UH4_Cons(Rc<str>, i32, Rc<UH4>),
}
#[derive(Clone)]
enum US1 {
    US1_Some(Rc<str>, i32),
    US1_None,
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
    let v3: Option<usize> = method3(v2.clone());
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
        let mut v21: usize = ((v17) as usize);
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
            let v3: Rc<Heap0> = v3.clone();
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
                let v3: Rc<UH1> = v3.clone();
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
                let v3: Rc<UH1> = v3.clone();
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
                let v3: Rc<UH1> = v3.clone();
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
            let v3: Rc<str> = v3.clone();
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
            let v3: Rc<UH1> = v3.clone();
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
                let mut v21: usize = ((v17) as usize);
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
        let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
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
        let mut v21: Rc<str> = field_at_8(v20, v5.clone());
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
            let v3: Rc<UH1> = v3.clone();
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
            let v3: Rc<str> = v3.clone();
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
fn digest_of_1(mut v0: Rc<str>) -> (Rc<UH0>, Rc<UH0>) {
    let v1: bool = &*v0 == "";
    let mut v5: Rc<UH1> = if v1 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
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
fn taken_15(mut v0: i32, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v1 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<Heap0> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let mut v4: bool = v0 > 0i32;
            if v4 {
                let mut v5: i32 = v0.wrapping_sub(1i32);
                let v6: Rc<UH0> = taken_15(v5, v3.clone());
                Rc::new(UH0::UH0_Cons(v2.clone(), v6.clone()))
            } else {
                { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
            }
        }
        _ => {
            { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
        }
    }
}
fn merge_newest_17(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<Heap0> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            match &*v1 {
                UH0::UH0_Cons(v4, v5) => {
                    let mut v4: Rc<Heap0> = v4.clone();
                    let mut v5: Rc<UH0> = v5.clone();
                    let v6: Rc<str> = v2.l2.clone();
                    let v7: i32 = (v6.clone().len() as i32);
                    let mut v8: bool = v7 < 19i32;
                    let v12: Rc<str> = if v8 {
                        v6.clone()
                    } else {
                        let mut v9: usize = ((0i32) as usize);
                        let v10: usize = ((19i32) as usize);
                        let v11: Rc<str> = Rc::<str>::from(&(v6)[v9..v10]);
                        v11
                    };
                    let v13: Rc<str> = v4.l2.clone();
                    let v14: i32 = (v13.clone().len() as i32);
                    let v15: bool = v14 < 19i32;
                    let v19: Rc<str> = if v15 {
                        v13.clone()
                    } else {
                        let v16: usize = ((0i32) as usize);
                        let v17: usize = ((19i32) as usize);
                        let v18: Rc<str> = Rc::<str>::from(&(v13)[v16..v17]);
                        v18
                    };
                    let v20: bool = &*v12 != &*v19;
                    let v38: bool = if v20 {
                        let mut v21: bool = &*v12 < &*v19;
                        let v24: i32 = if v21 {
                            -1i32
                        } else {
                            let v22: bool = &*v12 > &*v19;
                            if v22 {
                                1i32
                            } else {
                                0i32
                            }
                        };
                        let v25: bool = v24 == 1i32;
                        v25
                    } else {
                        let v26: Rc<str> = v2.l0.clone();
                        let v27: Rc<str> = v4.l0.clone();
                        let v28: i32 = (v26.clone().len() as i32);
                        let v29: i32 = (v27.clone().len() as i32);
                        let v30: bool = v28 != v29;
                        if v30 {
                            let v31: bool = v28 > v29;
                            v31
                        } else {
                            let v32: bool = &*v26 < &*v27;
                            let v35: i32 = if v32 {
                                -1i32
                            } else {
                                let v33: bool = &*v26 > &*v27;
                                if v33 {
                                    1i32
                                } else {
                                    0i32
                                }
                            };
                            let v36: bool = v35 == 1i32;
                            v36
                        }
                    };
                    if v38 {
                        let v39: Rc<UH0> = merge_newest_17(v3, v1.clone());
                        Rc::new(UH0::UH0_Cons(v2, v39))
                    } else {
                        let v41: Rc<UH0> = merge_newest_17(v0.clone(), v5);
                        Rc::new(UH0::UH0_Cons(v4, v41))
                    }
                }
                UH0::UH0_Nil => {
                    v0
                }
            }
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn halves_18(mut v0: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>) {
    match &*v0 {
        UH0::UH0_Cons(v1, v2) => {
            let v1: Rc<Heap0> = v1.clone();
            let v2: Rc<UH0> = v2.clone();
            match &*v2 {
                UH0::UH0_Cons(v3, v4) => {
                    let v3: Rc<Heap0> = v3.clone();
                    let mut v4: Rc<UH0> = v4.clone();
                    let (mut v5, mut v6): (Rc<UH0>, Rc<UH0>) = halves_18(v4.clone());
                    let v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v1.clone(), v5.clone()));
                    let mut v8: Rc<UH0> = Rc::new(UH0::UH0_Cons(v3.clone(), v6.clone()));
                    (v7.clone(), v8.clone())
                }
                _ => {
                    let mut v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    (v0.clone(), v9.clone())
                }
            }
        }
        _ => {
            let v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            (v0.clone(), v12.clone())
        }
    }
}
fn newest_first_16(mut v0: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v1, v2) => {
            let v1: Rc<Heap0> = v1.clone();
            let v2: Rc<UH0> = v2.clone();
            match &*v2 {
                UH0::UH0_Nil => {
                    v0.clone()
                }
                _ => {
                    let (mut v3, mut v4): (Rc<UH0>, Rc<UH0>) = halves_18(v0.clone());
                    let mut v5: Rc<UH0> = newest_first_16(v3);
                    let v6: Rc<UH0> = newest_first_16(v4);
                    merge_newest_17(v5, v6)
                }
            }
        }
        UH0::UH0_Nil => {
            v0
        }
    }
}
fn method20(mut v0: Rc<str>, mut v1: Rc<UH4>) -> US1 {
    loop {
        match &*v1 {
            UH4::UH4_Cons(v3, v4, v5) => {
                let v3: Rc<str> = v3.clone();
                let mut v4: i32 = *v4;
                let mut v5: Rc<UH4> = v5.clone();
                let v6: bool = &*v3 == &*v0;
                if v6 {
                    return US1::US1_Some(v3.clone(), v4);
                } else {
                    (v0, v1) = (v0.clone(), v5.clone());
                    continue;
                }
            }
            UH4::UH4_Nil => {
                return US1::US1_None;
            }
        }
    }
}
fn method21(mut v0: Rc<str>, mut v1: Rc<UH4>, mut v2: Rc<UH4>) -> Rc<UH4> {
    match &*v1 {
        UH4::UH4_Cons(v3, v4, v5) => {
            let v3: Rc<str> = v3.clone();
            let mut v4: i32 = *v4;
            let mut v5: Rc<UH4> = v5.clone();
            let v6: Rc<UH4> = method21(v0.clone(), v5, v2.clone());
            let v7: bool = &*v3 != &*v0;
            if v7 {
                Rc::new(UH4::UH4_Cons(v3, v4, v6.clone()))
            } else {
                v6
            }
        }
        UH4::UH4_Nil => {
            v2
        }
    }
}
fn method19(mut v0: i32, mut v1: Rc<UH0>, mut v2: Rc<UH4>, mut v3: Rc<UH0>) -> (Rc<UH4>, Rc<UH0>) {
    let (mut v30, mut v31): (Rc<UH4>, Rc<UH0>) = match &*v1 {
        UH0::UH0_Cons(v4, v5) => {
            let mut v4: Rc<Heap0> = v4.clone();
            let mut v5: Rc<UH0> = v5.clone();
            let v6: Rc<str> = v4.l1.clone();
            let v7: US1 = method20(v6.clone(), v2.clone());
            let v11: i32 = match &v7 {
                US1::US1_None => {
                    0i32
                }
                US1::US1_Some(v8, v9) => {
                    let mut v8: Rc<str> = v8.clone();
                    let mut v9: i32 = *v9;
                    v9
                }
            };
            let v12: bool = v11 >= v0;
            let (mut v24, mut v25): (Rc<UH4>, Rc<UH0>) = if v12 {
                (v2.clone(), v3.clone())
            } else {
                let v13: Rc<str> = v4.l1.clone();
                let v14: US1 = method20(v13.clone(), v2.clone());
                let v18: i32 = match &v14 {
                    US1::US1_None => {
                        0i32
                    }
                    US1::US1_Some(v15, v16) => {
                        let v15: Rc<str> = v15.clone();
                        let v16: i32 = *v16;
                        v16
                    }
                };
                let v19: i32 = v18.wrapping_add(1i32);
                let v20: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
                let mut v21: Rc<UH4> = method21(v13.clone(), v2.clone(), v20.clone());
                let v22: Rc<UH4> = Rc::new(UH4::UH4_Cons(v13.clone(), v19, v21.clone()));
                let v23: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v3.clone()));
                (v22.clone(), v23.clone())
            };
            method19(v0, v5.clone(), v24.clone(), v25.clone())
        }
        _ => {
            let (mut v28, mut v29): (Rc<UH4>, Rc<UH0>) = match &*v1 {
                UH0::UH0_Nil => {
                    (v2.clone(), v3.clone())
                }
                _ => unreachable!(),
            };
            (v28.clone(), v29.clone())
        }
    };
    (v30.clone(), v31.clone())
}
fn selected_14(mut v0: i32, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    let v3: Rc<UH0> = newest_first_16(v2.clone());
    let mut v4: bool = v1 <= 0i32;
    let v11: Rc<UH0> = if v4 {
        v3.clone()
    } else {
        let mut v5: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
        let v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let (mut v7, mut v8): (Rc<UH4>, Rc<UH0>) = method19(v1, v3.clone(), v5.clone(), v6.clone());
        let mut v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        method13(v8.clone(), v9.clone())
    };
    taken_15(v0, v11.clone())
}
fn method24(mut v0: Rc<UH2>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let v2: US0 = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH1> = method24(v4.clone(), v1.clone());
            let v11: Rc<str> = match &v2 {
                US0::US0_Quoted => {
                    let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
                    v6.clone()
                }
                US0::US0_RepliedTo => {
                    let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replied_to"); } LIT.with(|lit| lit.clone()) };
                    v7.clone()
                }
                US0::US0_Reposted => {
                    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposted"); } LIT.with(|lit| lit.clone()) };
                    v8.clone()
                }
            };
            let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let v14: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v11, v12)), v3));
            Rc::new(UH1::UH1_Cons(v14.clone(), v5.clone()))
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn method25(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH1>, mut v2: i32) -> i32 {
    loop {
        match &*v1 {
            UH1::UH1_Cons(v3, v4) => {
                let v3: Rc<str> = v3.clone();
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
fn entry_line_23(mut v0: Rc<str>, mut v1: Rc<Heap0>) -> Rc<str> {
    let v2: Rc<str> = v1.l0.clone();
    let v3: Rc<str> = v1.l1.clone();
    let mut v4: Rc<str> = v1.l2.clone();
    let mut v5: Rc<UH2> = v1.l8.clone();
    let v6: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v7: Rc<UH1> = method24(v5.clone(), v6.clone());
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let mut v9: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v10: i32 = 0i32;
    let v11: i32 = method25(v9.clone(), v7.clone(), v10);
    let v12: Rc<Vec<Rc<str>>> = Rc::new(v9.borrow().clone());
    let v13: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v12).as_ref().clone()));
    let v14: Rc<str> = Rc::<str>::from((*v13.borrow()).join(&*v8));
    let v15: Rc<str> = v1.l3.clone();
    let v16: Rc<str> = v1.l4.clone();
    let v17: Rc<str> = v1.l5.clone();
    let v18: Rc<str> = v1.l6.clone();
    let v19: Rc<UH1> = v1.l7.clone();
    let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
    let mut v21: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    v21.borrow_mut().push(v0);
    v21.borrow_mut().push(v2);
    v21.borrow_mut().push(v3);
    v21.borrow_mut().push(v4);
    v21.borrow_mut().push(v14);
    v21.borrow_mut().push(v15);
    v21.borrow_mut().push(v16);
    v21.borrow_mut().push(v17);
    v21.borrow_mut().push(v18);
    let v22: i32 = 9i32;
    let v23: i32 = method25(v21.clone(), v19.clone(), v22);
    let v24: Rc<Vec<Rc<str>>> = Rc::new(v21.borrow().clone());
    let v25: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v24).as_ref().clone()));
    let v26: Rc<str> = Rc::<str>::from((*v25.borrow()).join(&*v20));
    v26.clone()
}
fn method22(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<UH1>) -> Rc<UH1> {
    match &*v1 {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<Heap0> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH1> = method22(v0.clone(), v4, v2.clone());
            let v6: Rc<str> = entry_line_23(v0, v3);
            Rc::new(UH1::UH1_Cons(v6, v5))
        }
        UH0::UH0_Nil => {
            v2
        }
    }
}
fn method26(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method26(v3.clone(), v1.clone());
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("r\t"); } LIT.with(|lit| lit.clone()) };
            let v6: bool = v2.starts_with(&*v5);
            if v6 {
                Rc::new(UH1::UH1_Cons(v2.clone(), v4.clone()))
            } else {
                v4.clone()
            }
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method27(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method27(v3, v1.clone());
            Rc::new(UH1::UH1_Cons(v2, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn selected_text_0(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> Rc<str> {
    let (mut v3, mut v4): (Rc<UH0>, Rc<UH0>) = digest_of_1(v0.clone());
    let mut v5: Rc<UH0> = selected_14(v1, v2, v3.clone());
    let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("p"); } LIT.with(|lit| lit.clone()) };
    let v7: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v8: Rc<UH1> = method22(v6.clone(), v5.clone(), v7.clone());
    let mut v9: bool = &*v0 == "";
    let v13: Rc<UH1> = if v9 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
        split_list_2(v11.clone(), v0.clone())
    };
    let v14: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v15: Rc<UH1> = method26(v13.clone(), v14.clone());
    let v16: Rc<UH1> = method27(v8.clone(), v15.clone());
    let v17: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v18: i32 = 0i32;
    let v19: i32 = method25(v17.clone(), v16.clone(), v18);
    let v20: Rc<Vec<Rc<str>>> = Rc::new(v17.borrow().clone());
    let mut v21: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v20).as_ref().clone()));
    let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let v23: Rc<str> = Rc::<str>::from((*v21.borrow()).join(&*v22));
    v23.clone()
}
fn closure0() -> Rc<dyn Fn(Rc<str>, i32, i32) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32, i32) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>, mut v1: i32, mut v2: i32| -> Rc<str> {
        selected_text_0(v0.clone(), v1, v2)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_select(v0: &str, v1: i32, v2: i32) -> Rc<str> {
    closure0()(Rc::<str>::from(v0), v1, v2)
}
