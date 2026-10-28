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
    US1_Some(Rc<Heap0>),
    US1_None,
}
fn method2(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure1() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn split_list_1(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH1> {
    let v2: Option<usize> = v1.find(&*v0);
    let v3: Option<usize> = method2(v2.clone());
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
        let v25: Rc<UH1> = split_list_1(v0.clone(), v24.clone());
        Rc::new(UH1::UH1_Cons(v16.clone(), v25.clone()))
    }
}
fn method4(mut v0: Rc<UH3>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<Heap0> = v3.clone();
            let mut v4: Rc<UH3> = v4.clone();
            let mut v5: Rc<UH3> = method4(v4, v1.clone());
            Rc::new(UH3::UH3_Cons(v2, v3, v5))
        }
        UH3::UH3_Nil => {
            v1
        }
    }
}
fn method6(mut v0: Rc<UH1>, mut v1: i32) -> i32 {
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
fn field_at_7(mut v0: i32, mut v1: Rc<UH1>) -> Rc<str> {
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
fn fields_after_8(mut v0: i32, mut v1: Rc<UH1>) -> Rc<UH1> {
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
fn method10(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let v2: US0 = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH2> = method10(v4, v1.clone());
            Rc::new(UH2::UH2_Cons(v2, v3, v5))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn method9(mut v0: Rc<UH1>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH2> = method9(v3.clone(), v1.clone());
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let v6: Option<usize> = v2.find(&*v5);
            let v7: Option<usize> = method2(v6.clone());
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
            method10(v43.clone(), v4.clone())
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn entry_of_line_5(mut v0: Rc<str>) -> Rc<UH3> {
    let v1: bool = &*v0 == "";
    let mut v5: Rc<UH1> = if v1 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
        split_list_1(v3.clone(), v0.clone())
    };
    let v6: i32 = 0i32;
    let v7: i32 = method6(v5.clone(), v6);
    let mut v8: bool = v7 < 9i32;
    if v8 {
        { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v10: i32 = 0i32;
        let v11: Rc<str> = field_at_7(v10, v5.clone());
        let v12: i32 = 1i32;
        let v13: Rc<str> = field_at_7(v12, v5.clone());
        let v14: i32 = 2i32;
        let v15: Rc<str> = field_at_7(v14, v5.clone());
        let v16: i32 = 3i32;
        let v17: Rc<str> = field_at_7(v16, v5.clone());
        let v18: i32 = 5i32;
        let v19: Rc<str> = field_at_7(v18, v5.clone());
        let v20: i32 = 6i32;
        let v21: Rc<str> = field_at_7(v20, v5.clone());
        let v22: i32 = 7i32;
        let v23: Rc<str> = field_at_7(v22, v5.clone());
        let v24: i32 = 8i32;
        let v25: Rc<str> = field_at_7(v24, v5.clone());
        let v26: i32 = 9i32;
        let v27: Rc<UH1> = fields_after_8(v26, v5.clone());
        let v28: i32 = 4i32;
        let v29: Rc<str> = field_at_7(v28, v5.clone());
        let v30: bool = &*v29 == "";
        let v34: Rc<UH1> = if v30 {
            { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
        } else {
            let v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            split_list_1(v32.clone(), v29.clone())
        };
        let v35: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
        let v36: Rc<UH2> = method9(v34.clone(), v35.clone());
        let v37: Rc<Heap0> = Rc::new(Heap0 { l0: v13.clone(), l1: v15.clone(), l2: v17.clone(), l3: v19.clone(), l4: v21.clone(), l5: v23.clone(), l6: v25.clone(), l7: v27.clone(), l8: v36.clone() });
        let v38: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH3::UH3_Cons(v11.clone(), v37.clone(), v38.clone()))
    }
}
fn method3(mut v0: Rc<UH1>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH3> = method3(v3, v1.clone());
            let mut v5: Rc<UH3> = entry_of_line_5(v2);
            method4(v5, v4)
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method11(mut v0: Rc<UH3>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>) {
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
            method11(v5, v9, v10)
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
fn method12(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
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
fn digest_of_0(mut v0: Rc<str>) -> (Rc<UH0>, Rc<UH0>) {
    let v1: bool = &*v0 == "";
    let mut v5: Rc<UH1> = if v1 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
        split_list_1(v3.clone(), v0.clone())
    };
    let v6: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let v7: Rc<UH3> = method3(v5.clone(), v6.clone());
    let mut v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let (mut v10, mut v11): (Rc<UH0>, Rc<UH0>) = method11(v7.clone(), v8.clone(), v9.clone());
    let v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v13: Rc<UH0> = method12(v10.clone(), v12.clone());
    let v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v15: Rc<UH0> = method12(v11.clone(), v14.clone());
    (v13.clone(), v15.clone())
}
fn method16(mut v0: Rc<UH2>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let v2: US0 = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH1> = method16(v4.clone(), v1.clone());
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
            let v12: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v11).to_string());
            let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"type\":"); } LIT.with(|lit| lit.clone()) };
            let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v12));
            let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"id\":"); } LIT.with(|lit| lit.clone()) };
            let v16: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v15));
            let v17: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v3).to_string());
            let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v17));
            let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
            let v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v19));
            Rc::new(UH1::UH1_Cons(v20.clone(), v5.clone()))
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn method17(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH1>, mut v2: i32) -> i32 {
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
fn method18(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method18(v3, v1.clone());
            let mut v5: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v2).to_string());
            Rc::new(UH1::UH1_Cons(v5, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn entry_json_15(mut v0: i32, mut v1: Rc<str>, mut v2: Rc<Heap0>) -> Rc<str> {
    let v3: Rc<UH2> = v2.l8.clone();
    let mut v4: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v5: Rc<UH1> = method16(v3.clone(), v4.clone());
    let v6: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v7: i32 = 0i32;
    let mut v8: i32 = method17(v6.clone(), v5.clone(), v7);
    let mut v9: Rc<Vec<Rc<str>>> = Rc::new(v6.borrow().clone());
    let v10: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v9).as_ref().clone()));
    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let v12: Rc<str> = Rc::<str>::from((*v10.borrow()).join(&*v11));
    let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
    let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v12));
    let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
    let v16: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v15));
    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) };
    let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("refs"); } LIT.with(|lit| lit.clone()) };
    let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"refs"); } LIT.with(|lit| lit.clone()) };
    let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\":"); } LIT.with(|lit| lit.clone()) };
    let v22: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v19, v20)), v16));
    let v23: Rc<UH1> = v2.l7.clone();
    let v24: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v25: Rc<UH1> = method18(v23.clone(), v24.clone());
    let v26: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v27: i32 = 0i32;
    let v28: i32 = method17(v26.clone(), v25.clone(), v27);
    let v29: Rc<Vec<Rc<str>>> = Rc::new(v26.borrow().clone());
    let v30: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v29).as_ref().clone()));
    let v31: Rc<str> = Rc::<str>::from((*v30.borrow()).join(&*v11));
    let v33: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v13, v31)), v15));
    let v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("hints"); } LIT.with(|lit| lit.clone()) };
    let v37: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v17, v34)), v20)), v33));
    let v38: Rc<str> = Rc::<str>::from(format!("{:?}", v0));
    let v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("level"); } LIT.with(|lit| lit.clone()) };
    let v42: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v17, v39)), v20)), v38));
    let v43: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v1).to_string());
    let v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("via"); } LIT.with(|lit| lit.clone()) };
    let v47: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v17, v44)), v20)), v43));
    let v48: Rc<str> = v2.l0.clone();
    let v49: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v48).to_string());
    let v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
    let v53: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v17, v50)), v20)), v49));
    let v54: Rc<str> = v2.l1.clone();
    let v55: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v54).to_string());
    let v56: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("username"); } LIT.with(|lit| lit.clone()) };
    let v59: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v17, v56)), v20)), v55));
    let v60: Rc<str> = v2.l2.clone();
    let v61: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v60).to_string());
    let v62: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("created_at"); } LIT.with(|lit| lit.clone()) };
    let v65: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v17, v62)), v20)), v61));
    let v66: Rc<str> = v2.l3.clone();
    let v67: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v66).to_string());
    let v68: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
    let v71: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v17, v68)), v20)), v67));
    let v72: Rc<str> = v2.l4.clone();
    let v73: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reply_count"); } LIT.with(|lit| lit.clone()) };
    let v76: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v17, v73)), v20)), v72));
    let v77: Rc<str> = v2.l5.clone();
    let v78: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("repost_count"); } LIT.with(|lit| lit.clone()) };
    let v81: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v17, v78)), v20)), v77));
    let v82: Rc<str> = v2.l6.clone();
    let v83: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("like_count"); } LIT.with(|lit| lit.clone()) };
    let v86: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v17, v83)), v20)), v82));
    let mut v87: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    v87.borrow_mut().push(v53);
    v87.borrow_mut().push(v59);
    v87.borrow_mut().push(v65);
    v87.borrow_mut().push(v71);
    v87.borrow_mut().push(v76);
    v87.borrow_mut().push(v81);
    v87.borrow_mut().push(v86);
    v87.borrow_mut().push(v22);
    v87.borrow_mut().push(v37);
    v87.borrow_mut().push(v42);
    v87.borrow_mut().push(v47);
    let v88: Rc<Vec<Rc<str>>> = Rc::new(v87.borrow().clone());
    let v89: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v88).as_ref().clone()));
    let v90: Rc<str> = Rc::<str>::from((*v89.borrow()).join(&*v11));
    let v91: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{"); } LIT.with(|lit| lit.clone()) };
    let v92: Rc<str> = Rc::<str>::from(format!("{}{}", v91, v90));
    let v93: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
    let v94: Rc<str> = Rc::<str>::from(format!("{}{}", v92, v93));
    v94.clone()
}
fn method21(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method21(v3, v1.clone());
            Rc::new(UH1::UH1_Cons(v2, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method23(mut v0: Rc<str>, mut v1: Rc<UH0>) -> US1 {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<Heap0> = v3.clone();
                let mut v4: Rc<UH0> = v4.clone();
                let mut v5: Rc<str> = v3.l0.clone();
                let v6: bool = &*v5 == &*v0;
                if v6 {
                    return US1::US1_Some(v3.clone());
                } else {
                    (v0, v1) = (v0.clone(), v4.clone());
                    continue;
                }
            }
            UH0::UH0_Nil => {
                return US1::US1_None;
            }
        }
    }
}
fn reference_json_22(mut v0: Rc<UH0>, mut v1: i32, mut v2: i32, mut v3: Rc<Heap0>, mut v4: US0, mut v5: Rc<str>) -> Rc<UH1> {
    let v6: US1 = method23(v5.clone(), v0.clone());
    match &v6 {
        US1::US1_None => {
            { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
        }
        US1::US1_Some(v7) => {
            let v7: Rc<Heap0> = v7.clone();
            let mut v8: i32 = v2.wrapping_add(1i32);
            let mut v9: Rc<str> = v3.l0.clone();
            let v10: Rc<str> = entry_json_15(v8, v9.clone(), v7.clone());
            let v11: Rc<UH1> = referenced_json_19(v0.clone(), v1, v8, v7.clone());
            Rc::new(UH1::UH1_Cons(v10.clone(), v11.clone()))
        }
    }
}
fn method20(mut v0: Rc<UH0>, mut v1: i32, mut v2: i32, mut v3: Rc<Heap0>, mut v4: Rc<UH2>, mut v5: Rc<UH1>) -> Rc<UH1> {
    match &*v4 {
        UH2::UH2_Cons(v6, v7, v8) => {
            let v6: US0 = v6.clone();
            let v7: Rc<str> = v7.clone();
            let mut v8: Rc<UH2> = v8.clone();
            let mut v9: Rc<UH1> = method20(v0.clone(), v1, v2, v3.clone(), v8, v5.clone());
            let v10: Rc<UH1> = reference_json_22(v0, v1, v2, v3, v6, v7);
            method21(v10, v9)
        }
        UH2::UH2_Nil => {
            v5
        }
    }
}
fn referenced_json_19(mut v0: Rc<UH0>, mut v1: i32, mut v2: i32, mut v3: Rc<Heap0>) -> Rc<UH1> {
    let mut v4: bool = v2 >= v1;
    if v4 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v6: Rc<UH2> = v3.l8.clone();
        let v7: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        method20(v0.clone(), v1, v2, v3.clone(), v6.clone(), v7.clone())
    }
}
fn method14(mut v0: Rc<UH0>, mut v1: i32, mut v2: Rc<UH0>, mut v3: Rc<UH1>) -> Rc<UH1> {
    match &*v2 {
        UH0::UH0_Cons(v4, v5) => {
            let mut v4: Rc<Heap0> = v4.clone();
            let mut v5: Rc<UH0> = v5.clone();
            let v6: Rc<UH1> = method14(v0.clone(), v1, v5.clone(), v3.clone());
            let v7: i32 = 0i32;
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v9: Rc<str> = entry_json_15(v7, v8.clone(), v4.clone());
            let v10: i32 = 0i32;
            let v11: Rc<UH1> = referenced_json_19(v0.clone(), v1, v10, v4.clone());
            let v12: Rc<UH1> = method21(v11.clone(), v6.clone());
            Rc::new(UH1::UH1_Cons(v9.clone(), v12.clone()))
        }
        UH0::UH0_Nil => {
            v3.clone()
        }
    }
}
fn method24(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<Heap0> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
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
fn rendered_json_13(mut v0: Rc<UH0>, mut v1: Rc<UH0>, mut v2: i32) -> (Rc<str>, i32) {
    let v3: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v4: Rc<UH1> = method14(v1.clone(), v2, v0.clone(), v3.clone());
    let mut v5: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v6: i32 = 0i32;
    let v7: i32 = method17(v5.clone(), v4.clone(), v6);
    let mut v8: Rc<Vec<Rc<str>>> = Rc::new(v5.borrow().clone());
    let mut v9: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v8).as_ref().clone()));
    let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let v11: Rc<str> = Rc::<str>::from((*v9.borrow()).join(&*v10));
    let v12: i32 = 0i32;
    let v13: i32 = method24(v0.clone(), v12);
    (v11.clone(), v13)
}
fn closure0() -> Rc<dyn Fn(Rc<str>, i32, i32, i32) -> (Rc<str>, i32)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32, i32, i32) -> (Rc<str>, i32)> = Rc::new(move |mut v0: Rc<str>, mut v1: i32, mut v2: i32, mut v3: i32| -> (Rc<str>, i32) {
        let mut v4: Rc<str> = xc_select::xc_select(&*v0, v1, v2);
        let (mut v5, mut v6): (Rc<UH0>, Rc<UH0>) = digest_of_0(v4.clone());
        rendered_json_13(v5.clone(), v6.clone(), v3)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_jsonl(v0: &str, v1: i32, v2: i32, v3: i32) -> (Rc<str>, i32) {
    closure0()(Rc::<str>::from(v0), v1, v2, v3)
}
