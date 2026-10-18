#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
fn string_slice(value: &str, from: i64, to: i64) -> Rc<str> {
    let bytes = value.as_bytes();
    let length = bytes.len() as i64;
    if from < 0 || from > length || to < from - 1 || to >= length { std::process::abort(); }
    if to < from { return { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }; }
    if (bytes[from as usize] & 0xC0) == 0x80 || (to + 1 < length && (bytes[(to + 1) as usize] & 0xC0) == 0x80) { std::process::exit(3); }
    let slice = &bytes[from as usize..(to + 1) as usize];
    match std::str::from_utf8(slice) { Ok(text) => Rc::<str>::from(text), Err(error) => Rc::<str>::from(std::str::from_utf8(&slice[..error.valid_up_to()]).unwrap_or("")) }
}
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
#[derive(Clone)]
enum US2 {
    US2_Some(Rc<str>),
    US2_None,
}
#[derive(Clone)]
enum US3 {
    US3_Some(Rc<Heap0>),
    US3_None,
}
#[derive(Clone)]
enum UH5 {
    UH5_Nil,
    UH5_Cons(i32, Rc<UH5>),
}
fn split_on_2(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH1> {
    let mut v2: i32 = v1.find(&*v0).map(|i| i as i32).unwrap_or(-1);
    let mut v3: bool = v2 < 0i32;
    if v3 {
        let mut v4: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH1::UH1_Cons(v1.clone(), v4.clone()))
    } else {
        let mut v6: Rc<str> = Rc::<str>::from(&(v1)[((0i32) as usize)..(((0i32) + (v2)) as usize)]);
        let mut v7: i32 = v2.wrapping_add(1i32);
        let mut v8: i32 = (v1.clone().len() as i32);
        let mut v9: i32 = v8.wrapping_sub(v2);
        let mut v10: i32 = v9.wrapping_sub(1i32);
        let mut v11: Rc<str> = Rc::<str>::from(&(v1)[((v7) as usize)..(((v7) + (v10)) as usize)]);
        let mut v12: Rc<UH1> = split_on_2(v0.clone(), v11.clone());
        Rc::new(UH1::UH1_Cons(v6.clone(), v12.clone()))
    }
}
fn method4(mut v0: Rc<UH3>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<Heap0> = v3.clone();
            let mut v4: Rc<UH3> = v4.clone();
            let mut v5: Rc<UH3> = method4(v4.clone(), v1.clone());
            Rc::new(UH3::UH3_Cons(v2.clone(), v3.clone(), v5.clone()))
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn method6(mut v0: Rc<UH1>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
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
fn field_at_7(mut v0: i32, mut v1: Rc<UH1>) -> Rc<str> {
    loop {
        match &*v1 {
            UH1::UH1_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
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
fn fields_after_8(mut v0: i32, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v1 {
            UH1::UH1_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
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
fn method10(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let mut v2: US0 = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH2> = method10(v4.clone(), v1.clone());
            Rc::new(UH2::UH2_Cons(v2.clone(), v3.clone(), v5.clone()))
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn method9(mut v0: Rc<UH1>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH2> = method9(v3.clone(), v1.clone());
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let mut v6: i32 = v2.find(&*v5).map(|i| i as i32).unwrap_or(-1);
            let mut v7: bool = v6 < 0i32;
            let mut v33: Rc<UH2> = if v7 {
                { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
            } else {
                let mut v9: Rc<str> = Rc::<str>::from(&(v2)[((0i32) as usize)..(((0i32) + (v6)) as usize)]);
                let mut v10: i32 = v6.wrapping_add(1i32);
                let mut v11: i32 = (v2.clone().len() as i32);
                let mut v12: i32 = v11.wrapping_sub(v6);
                let mut v13: i32 = v12.wrapping_sub(1i32);
                let mut v14: Rc<str> = Rc::<str>::from(&(v2)[((v10) as usize)..(((v10) + (v13)) as usize)]);
                let mut v15: bool = v9.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
                if v15 {
                    let mut v16: US0 = US0::US0_Quoted;
                    let mut v17: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    Rc::new(UH2::UH2_Cons(v16.clone(), v14.clone(), v17.clone()))
                } else {
                    let mut v19: bool = v9.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replied_to"); } LIT.with(|lit| lit.clone()) };
                    if v19 {
                        let mut v20: US0 = US0::US0_RepliedTo;
                        let mut v21: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                        Rc::new(UH2::UH2_Cons(v20.clone(), v14.clone(), v21.clone()))
                    } else {
                        let mut v23: bool = v9.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposted"); } LIT.with(|lit| lit.clone()) };
                        let mut v25: bool = if v23 {
                            true
                        } else {
                            let mut v24: bool = v9.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("retweeted"); } LIT.with(|lit| lit.clone()) };
                            v24
                        };
                        if v25 {
                            let mut v26: US0 = US0::US0_Reposted;
                            let mut v27: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                            Rc::new(UH2::UH2_Cons(v26.clone(), v14.clone(), v27.clone()))
                        } else {
                            { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
                        }
                    }
                }
            };
            method10(v33.clone(), v4.clone())
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn entry_of_line_5(mut v0: Rc<str>) -> Rc<UH3> {
    let mut v1: bool = v0.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v5: Rc<UH1> = if v1 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
        split_on_2(v3.clone(), v0.clone())
    };
    let mut v6: i32 = 0i32;
    let mut v7: i32 = method6(v5.clone(), v6);
    let mut v8: bool = v7 < 9i32;
    if v8 {
        { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v10: i32 = 0i32;
        let mut v11: Rc<str> = field_at_7(v10, v5.clone());
        let mut v12: i32 = 1i32;
        let mut v13: Rc<str> = field_at_7(v12, v5.clone());
        let mut v14: i32 = 2i32;
        let mut v15: Rc<str> = field_at_7(v14, v5.clone());
        let mut v16: i32 = 3i32;
        let mut v17: Rc<str> = field_at_7(v16, v5.clone());
        let mut v18: i32 = 5i32;
        let mut v19: Rc<str> = field_at_7(v18, v5.clone());
        let mut v20: i32 = 6i32;
        let mut v21: Rc<str> = field_at_7(v20, v5.clone());
        let mut v22: i32 = 7i32;
        let mut v23: Rc<str> = field_at_7(v22, v5.clone());
        let mut v24: i32 = 8i32;
        let mut v25: Rc<str> = field_at_7(v24, v5.clone());
        let mut v26: i32 = 9i32;
        let mut v27: Rc<UH1> = fields_after_8(v26, v5.clone());
        let mut v28: i32 = 4i32;
        let mut v29: Rc<str> = field_at_7(v28, v5.clone());
        let mut v30: bool = v29.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v34: Rc<UH1> = if v30 {
            { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
        } else {
            let mut v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            split_on_2(v32.clone(), v29.clone())
        };
        let mut v35: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
        let mut v36: Rc<UH2> = method9(v34.clone(), v35.clone());
        let mut v37: Rc<Heap0> = Rc::new(Heap0 { l0: v13.clone(), l1: v15.clone(), l2: v17.clone(), l3: v19.clone(), l4: v21.clone(), l5: v23.clone(), l6: v25.clone(), l7: v27.clone(), l8: v36.clone() });
        let mut v38: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH3::UH3_Cons(v11.clone(), v37.clone(), v38.clone()))
    }
}
fn method3(mut v0: Rc<UH1>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH3> = method3(v3.clone(), v1.clone());
            let mut v5: Rc<UH3> = entry_of_line_5(v2.clone());
            method4(v5.clone(), v4.clone())
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method11(mut v0: Rc<UH3>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>) {
    let (mut v15, mut v16): (Rc<UH0>, Rc<UH0>) = match &*v0 {
        UH3::UH3_Cons(v3, v4, v5) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<Heap0> = v4.clone();
            let mut v5: Rc<UH3> = v5.clone();
            let mut v6: bool = v3.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("p"); } LIT.with(|lit| lit.clone()) };
            let (mut v9, mut v10): (Rc<UH0>, Rc<UH0>) = if v6 {
                let mut v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v1.clone()));
                (v7.clone(), v2.clone())
            } else {
                let mut v8: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v2.clone()));
                (v1.clone(), v8.clone())
            };
            method11(v5.clone(), v9.clone(), v10.clone())
        }
        _ => {
            let (mut v13, mut v14): (Rc<UH0>, Rc<UH0>) = match &*v0 {
                UH3::UH3_Nil => {
                    (v1.clone(), v2.clone())
                }
                _ => unreachable!(),
            };
            (v13.clone(), v14.clone())
        }
    };
    (v15.clone(), v16.clone())
}
fn method12(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<Heap0> = v2.clone();
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
    let mut v1: bool = v0.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v5: Rc<UH1> = if v1 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
        split_on_2(v3.clone(), v0.clone())
    };
    let mut v6: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let mut v7: Rc<UH3> = method3(v5.clone(), v6.clone());
    let mut v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let (mut v10, mut v11): (Rc<UH0>, Rc<UH0>) = method11(v7.clone(), v8.clone(), v9.clone());
    let mut v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v13: Rc<UH0> = method12(v10.clone(), v12.clone());
    let mut v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v15: Rc<UH0> = method12(v11.clone(), v14.clone());
    (v13.clone(), v15.clone())
}
fn go_14(mut v0: i32, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v1 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<Heap0> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: bool = v0 > 0i32;
            if v4 {
                let mut v5: i32 = v0.wrapping_sub(1i32);
                let mut v6: Rc<UH0> = go_14(v5, v3.clone());
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
fn merge_newest_16(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<Heap0> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            match &*v1 {
                UH0::UH0_Cons(v4, v5) => {
                    let mut v4: Rc<Heap0> = v4.clone();
                    let mut v5: Rc<UH0> = v5.clone();
                    let mut v6: Rc<str> = v2.l2.clone();
                    let mut v7: i32 = (v6.clone().len() as i32);
                    let mut v8: bool = v7 < 19i32;
                    let mut v10: Rc<str> = if v8 {
                        v6.clone()
                    } else {
                        let mut v9: Rc<str> = string_slice(&v6.clone(), 0i32 as i64, 18i32 as i64);
                        v9.clone()
                    };
                    let mut v11: Rc<str> = v4.l2.clone();
                    let mut v12: i32 = (v11.clone().len() as i32);
                    let mut v13: bool = v12 < 19i32;
                    let mut v15: Rc<str> = if v13 {
                        v11.clone()
                    } else {
                        let mut v14: Rc<str> = string_slice(&v11.clone(), 0i32 as i64, 18i32 as i64);
                        v14.clone()
                    };
                    let mut v16: bool = v10.clone() == v15.clone();
                    let mut v17: bool = v16 != true;
                    let mut v36: bool = if v17 {
                        let mut v18: bool = v10.clone() < v15.clone();
                        let mut v21: i32 = if v18 {
                            -1i32
                        } else {
                            let mut v19: bool = v10.clone() > v15.clone();
                            if v19 {
                                1i32
                            } else {
                                0i32
                            }
                        };
                        let mut v22: bool = v21 == 1i32;
                        v22
                    } else {
                        let mut v23: Rc<str> = v2.l0.clone();
                        let mut v24: Rc<str> = v4.l0.clone();
                        let mut v25: i32 = (v23.clone().len() as i32);
                        let mut v26: i32 = (v24.clone().len() as i32);
                        let mut v27: bool = v25 == v26;
                        let mut v28: bool = v27 != true;
                        if v28 {
                            let mut v29: bool = v25 > v26;
                            v29
                        } else {
                            let mut v30: bool = v23.clone() < v24.clone();
                            let mut v33: i32 = if v30 {
                                -1i32
                            } else {
                                let mut v31: bool = v23.clone() > v24.clone();
                                if v31 {
                                    1i32
                                } else {
                                    0i32
                                }
                            };
                            let mut v34: bool = v33 == 1i32;
                            v34
                        }
                    };
                    if v36 {
                        let mut v37: Rc<UH0> = merge_newest_16(v3.clone(), v1.clone());
                        Rc::new(UH0::UH0_Cons(v2.clone(), v37.clone()))
                    } else {
                        let mut v39: Rc<UH0> = merge_newest_16(v0.clone(), v5.clone());
                        Rc::new(UH0::UH0_Cons(v4.clone(), v39.clone()))
                    }
                }
                UH0::UH0_Nil => {
                    v0.clone()
                }
            }
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn halves_17(mut v0: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>) {
    match &*v0 {
        UH0::UH0_Cons(v1, v2) => {
            let mut v1: Rc<Heap0> = v1.clone();
            let mut v2: Rc<UH0> = v2.clone();
            match &*v2 {
                UH0::UH0_Cons(v3, v4) => {
                    let mut v3: Rc<Heap0> = v3.clone();
                    let mut v4: Rc<UH0> = v4.clone();
                    let (mut v5, mut v6): (Rc<UH0>, Rc<UH0>) = halves_17(v4.clone());
                    let mut v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v1.clone(), v5.clone()));
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
            let mut v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            (v0.clone(), v12.clone())
        }
    }
}
fn newest_first_15(mut v0: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v1, v2) => {
            let mut v1: Rc<Heap0> = v1.clone();
            let mut v2: Rc<UH0> = v2.clone();
            match &*v2 {
                UH0::UH0_Nil => {
                    v0.clone()
                }
                _ => {
                    let (mut v3, mut v4): (Rc<UH0>, Rc<UH0>) = halves_17(v0.clone());
                    let mut v5: Rc<UH0> = newest_first_15(v3.clone());
                    let mut v6: Rc<UH0> = newest_first_15(v4.clone());
                    merge_newest_16(v5.clone(), v6.clone())
                }
            }
        }
        UH0::UH0_Nil => {
            v0.clone()
        }
    }
}
fn method19(mut v0: Rc<str>, mut v1: Rc<UH4>, mut v2: US1) -> US1 {
    match &*v1 {
        UH4::UH4_Cons(v3, v4, v5) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: i32 = *v4;
            let mut v5: Rc<UH4> = v5.clone();
            let mut v6: US1 = method19(v0.clone(), v5.clone(), v2.clone());
            let mut v7: bool = v3.clone() == v0.clone();
            if v7 {
                US1::US1_Some(v3.clone(), v4)
            } else {
                v6.clone()
            }
        }
        UH4::UH4_Nil => {
            v2.clone()
        }
    }
}
fn method20(mut v0: Rc<str>, mut v1: Rc<UH4>, mut v2: Rc<UH4>) -> Rc<UH4> {
    match &*v1 {
        UH4::UH4_Cons(v3, v4, v5) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: i32 = *v4;
            let mut v5: Rc<UH4> = v5.clone();
            let mut v6: Rc<UH4> = method20(v0.clone(), v5.clone(), v2.clone());
            let mut v7: bool = v3.clone() == v0.clone();
            let mut v8: bool = v7 != true;
            if v8 {
                Rc::new(UH4::UH4_Cons(v3.clone(), v4, v6.clone()))
            } else {
                v6.clone()
            }
        }
        UH4::UH4_Nil => {
            v2.clone()
        }
    }
}
fn method18(mut v0: i32, mut v1: Rc<UH0>, mut v2: Rc<UH4>, mut v3: Rc<UH0>) -> (Rc<UH4>, Rc<UH0>) {
    let (mut v32, mut v33): (Rc<UH4>, Rc<UH0>) = match &*v1 {
        UH0::UH0_Cons(v4, v5) => {
            let mut v4: Rc<Heap0> = v4.clone();
            let mut v5: Rc<UH0> = v5.clone();
            let mut v6: Rc<str> = v4.l1.clone();
            let mut v7: US1 = US1::US1_None;
            let mut v8: US1 = method19(v6.clone(), v2.clone(), v7.clone());
            let mut v12: i32 = match &v8 {
                US1::US1_None => {
                    0i32
                }
                US1::US1_Some(v9, v10) => {
                    let mut v9: Rc<str> = v9.clone();
                    let mut v10: i32 = *v10;
                    v10
                }
            };
            let mut v13: bool = v12 >= v0;
            let (mut v26, mut v27): (Rc<UH4>, Rc<UH0>) = if v13 {
                (v2.clone(), v3.clone())
            } else {
                let mut v14: Rc<str> = v4.l1.clone();
                let mut v15: US1 = US1::US1_None;
                let mut v16: US1 = method19(v14.clone(), v2.clone(), v15.clone());
                let mut v20: i32 = match &v16 {
                    US1::US1_None => {
                        0i32
                    }
                    US1::US1_Some(v17, v18) => {
                        let mut v17: Rc<str> = v17.clone();
                        let mut v18: i32 = *v18;
                        v18
                    }
                };
                let mut v21: i32 = v20.wrapping_add(1i32);
                let mut v22: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
                let mut v23: Rc<UH4> = method20(v14.clone(), v2.clone(), v22.clone());
                let mut v24: Rc<UH4> = Rc::new(UH4::UH4_Cons(v14.clone(), v21, v23.clone()));
                let mut v25: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v3.clone()));
                (v24.clone(), v25.clone())
            };
            method18(v0, v5.clone(), v26.clone(), v27.clone())
        }
        _ => {
            let (mut v30, mut v31): (Rc<UH4>, Rc<UH0>) = match &*v1 {
                UH0::UH0_Nil => {
                    (v2.clone(), v3.clone())
                }
                _ => unreachable!(),
            };
            (v30.clone(), v31.clone())
        }
    };
    (v32.clone(), v33.clone())
}
fn selected_13(mut v0: i32, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    let mut v3: Rc<UH0> = newest_first_15(v2.clone());
    let mut v4: bool = v1 <= 0i32;
    let mut v11: Rc<UH0> = if v4 {
        v3.clone()
    } else {
        let mut v5: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
        let mut v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let (mut v7, mut v8): (Rc<UH4>, Rc<UH0>) = method18(v1, v3.clone(), v5.clone(), v6.clone());
        let mut v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        method12(v8.clone(), v9.clone())
    };
    go_14(v0, v11.clone())
}
fn closure1() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        let mut v1: Rc<str> = xc_net::xc_local_minute(&*v0);
        v1.clone()
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method22(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method22(v3.clone(), v1.clone());
            Rc::new(UH1::UH1_Cons(v2.clone(), v4.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method24(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: US3) -> US3 {
    match &*v1 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<Heap0> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: US3 = method24(v0.clone(), v4.clone(), v2.clone());
            let mut v6: Rc<str> = v3.l0.clone();
            let mut v7: bool = v6.clone() == v0.clone();
            if v7 {
                US3::US3_Some(v3.clone())
            } else {
                v5.clone()
            }
        }
        UH0::UH0_Nil => {
            v2.clone()
        }
    }
}
fn quantity_27(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> Rc<str> {
    let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
    let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v3));
    let mut v5: bool = v0.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("1"); } LIT.with(|lit| lit.clone()) };
    let mut v6: Rc<str> = if v5 {
        v1.clone()
    } else {
        v2.clone()
    };
    let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v6));
    v7.clone()
}
fn metrics_text_26(mut v0: Rc<Heap0>) -> Rc<str> {
    let mut v1: Rc<str> = v0.l4.clone();
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reply"); } LIT.with(|lit| lit.clone()) };
    let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replies"); } LIT.with(|lit| lit.clone()) };
    let mut v4: Rc<str> = quantity_27(v1.clone(), v2.clone(), v3.clone());
    let mut v5: Rc<str> = v0.l5.clone();
    let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("repost"); } LIT.with(|lit| lit.clone()) };
    let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposts"); } LIT.with(|lit| lit.clone()) };
    let mut v8: Rc<str> = quantity_27(v5.clone(), v6.clone(), v7.clone());
    let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  ["); } LIT.with(|lit| lit.clone()) };
    let mut v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v4));
    let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", "); } LIT.with(|lit| lit.clone()) };
    let mut v12: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v11));
    let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v8));
    let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v11));
    let mut v15: Rc<str> = v0.l6.clone();
    let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("like"); } LIT.with(|lit| lit.clone()) };
    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("likes"); } LIT.with(|lit| lit.clone()) };
    let mut v18: Rc<str> = quantity_27(v15.clone(), v16.clone(), v17.clone());
    let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v18));
    let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
    let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v20));
    v21.clone()
}
fn render_post_25(mut v0: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v1: Rc<Heap0>) -> Rc<str> {
    let mut v2: Rc<str> = v1.l2.clone();
    let mut v3: Rc<str> = v0(v2.clone());
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  @"); } LIT.with(|lit| lit.clone()) };
    let mut v5: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v4));
    let mut v6: Rc<str> = v1.l1.clone();
    let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v6));
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  "); } LIT.with(|lit| lit.clone()) };
    let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v8));
    let mut v10: Rc<str> = v1.l3.clone();
    let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v10));
    let mut v12: Rc<str> = metrics_text_26(v1.clone());
    let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v12));
    v13.clone()
}
fn method31(mut v0: Rc<UH5>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match &*v0 {
            UH5::UH5_Cons(v2, v3) => {
                let mut v2: i32 = *v2;
                let mut v3: Rc<UH5> = v3.clone();
                let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  "); } LIT.with(|lit| lit.clone()) };
                let mut v5: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v4));
                (v0, v1) = (v3.clone(), v5.clone());
                continue;
            }
            UH5::UH5_Nil => {
                return v1.clone();
            }
        }
    }
}
fn method32(mut v0: i32, mut v1: i32) -> Rc<UH5> {
    let mut v2: bool = v1 < v0;
    if v2 {
        let mut v3: i32 = v1.wrapping_add(1i32);
        let mut v4: Rc<UH5> = method32(v0, v3);
        Rc::new(UH5::UH5_Cons(v1, v4.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) }
    }
}
fn indent_30(mut v0: i32) -> Rc<str> {
    let mut v1: i32 = 0i32;
    let mut v2: Rc<UH5> = method32(v0, v1);
    let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    method31(v2.clone(), v3.clone())
}
fn method29(mut v0: i32, mut v1: Rc<UH1>, mut v2: Rc<UH1>) -> Rc<UH1> {
    match &*v1 {
        UH1::UH1_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH1> = v4.clone();
            let mut v5: Rc<UH1> = method29(v0, v4.clone(), v2.clone());
            let mut v6: Rc<str> = indent_30(v0);
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v3));
            Rc::new(UH1::UH1_Cons(v7.clone(), v5.clone()))
        }
        UH1::UH1_Nil => {
            v2.clone()
        }
    }
}
fn ref_line_35(mut v0: i32, mut v1: US0, mut v2: Rc<Heap0>) -> Rc<str> {
    let mut v3: Rc<str> = indent_30(v0);
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("> "); } LIT.with(|lit| lit.clone()) };
    let mut v5: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v4));
    let mut v11: Rc<str> = match &v1 {
        US0::US0_Quoted => {
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
            v6.clone()
        }
        US0::US0_RepliedTo => {
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replied to"); } LIT.with(|lit| lit.clone()) };
            v7.clone()
        }
        US0::US0_Reposted => {
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposted"); } LIT.with(|lit| lit.clone()) };
            v8.clone()
        }
    };
    let mut v12: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v11));
    let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" @"); } LIT.with(|lit| lit.clone()) };
    let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v13));
    let mut v15: Rc<str> = v2.l1.clone();
    let mut v16: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v15));
    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
    let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v17));
    let mut v19: Rc<str> = v2.l3.clone();
    let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v19));
    let mut v21: Rc<str> = metrics_text_26(v2.clone());
    let mut v22: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v21));
    v22.clone()
}
fn ref_lines_34(mut v0: Rc<UH0>, mut v1: i32, mut v2: bool, mut v3: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v4: i32, mut v5: US0, mut v6: Rc<str>) -> Rc<UH1> {
    let mut v7: US3 = US3::US3_None;
    let mut v8: US3 = method24(v6.clone(), v0.clone(), v7.clone());
    match &v8 {
        US3::US3_None => {
            let mut v14: i32 = v4.wrapping_add(1i32);
            let mut v15: Rc<str> = indent_30(v14);
            let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("> "); } LIT.with(|lit| lit.clone()) };
            let mut v17: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v16));
            let mut v23: Rc<str> = match &v5 {
                US0::US0_Quoted => {
                    let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
                    v18.clone()
                }
                US0::US0_RepliedTo => {
                    let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replied to"); } LIT.with(|lit| lit.clone()) };
                    v19.clone()
                }
                US0::US0_Reposted => {
                    let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposted"); } LIT.with(|lit| lit.clone()) };
                    v20.clone()
                }
            };
            let mut v24: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v23));
            let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" a post not loaded ("); } LIT.with(|lit| lit.clone()) };
            let mut v26: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v25));
            let mut v27: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v6));
            let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(")"); } LIT.with(|lit| lit.clone()) };
            let mut v29: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v28));
            let mut v30: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            Rc::new(UH1::UH1_Cons(v29.clone(), v30.clone()))
        }
        US3::US3_Some(v9) => {
            let mut v9: Rc<Heap0> = v9.clone();
            let mut v10: i32 = v4.wrapping_add(1i32);
            let mut v11: Rc<str> = ref_line_35(v10, v5.clone(), v9.clone());
            let mut v12: Rc<UH1> = post_lines_28(v0.clone(), v1, v2, v3.clone(), v10, v9.clone());
            Rc::new(UH1::UH1_Cons(v11.clone(), v12.clone()))
        }
    }
}
fn method33(mut v0: Rc<UH0>, mut v1: i32, mut v2: bool, mut v3: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v4: i32, mut v5: Rc<UH2>, mut v6: Rc<UH1>) -> Rc<UH1> {
    match &*v5 {
        UH2::UH2_Cons(v7, v8, v9) => {
            let mut v7: US0 = v7.clone();
            let mut v8: Rc<str> = v8.clone();
            let mut v9: Rc<UH2> = v9.clone();
            let mut v10: Rc<UH1> = method33(v0.clone(), v1, v2, v3.clone(), v4, v9.clone(), v6.clone());
            let mut v11: Rc<UH1> = ref_lines_34(v0.clone(), v1, v2, v3.clone(), v4, v7.clone(), v8.clone());
            method22(v11.clone(), v10.clone())
        }
        UH2::UH2_Nil => {
            v6.clone()
        }
    }
}
fn post_lines_28(mut v0: Rc<UH0>, mut v1: i32, mut v2: bool, mut v3: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v4: i32, mut v5: Rc<Heap0>) -> Rc<UH1> {
    let mut v11: Rc<UH1> = if v2 {
        let mut v6: i32 = v4.wrapping_add(1i32);
        let mut v7: Rc<UH1> = v5.l7.clone();
        let mut v8: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        method29(v6, v7.clone(), v8.clone())
    } else {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    };
    let mut v12: bool = v4 >= v1;
    if v12 {
        v11.clone()
    } else {
        let mut v13: Rc<UH2> = v5.l8.clone();
        let mut v14: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let mut v15: Rc<UH1> = method33(v0.clone(), v1, v2, v3.clone(), v4, v13.clone(), v14.clone());
        method22(v11.clone(), v15.clone())
    }
}
fn entry_lines_23(mut v0: Rc<UH0>, mut v1: i32, mut v2: bool, mut v3: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v4: Rc<Heap0>) -> Rc<UH1> {
    let mut v5: Rc<UH2> = v4.l8.clone();
    let mut v15: US2 = match &*v5 {
        UH2::UH2_Cons(v6, v7, v8) => {
            let mut v6: US0 = v6.clone();
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<UH2> = v8.clone();
            match &*v8 {
                UH2::UH2_Nil => {
                    match &v6 {
                        US0::US0_Reposted => {
                            US2::US2_Some(v7.clone())
                        }
                        _ => {
                            US2::US2_None
                        }
                    }
                }
                _ => {
                    US2::US2_None
                }
            }
        }
        _ => {
            US2::US2_None
        }
    };
    let mut v23: US3 = match &v15 {
        US2::US2_Some(v16) => {
            let mut v16: Rc<str> = v16.clone();
            let mut v17: bool = v1 > 0i32;
            if v17 {
                let mut v18: US3 = US3::US3_None;
                method24(v16.clone(), v0.clone(), v18.clone())
            } else {
                US3::US3_None
            }
        }
        _ => {
            US3::US3_None
        }
    };
    match &v23 {
        US3::US3_None => {
            let mut v44: Rc<str> = render_post_25(v3.clone(), v4.clone());
            let mut v45: i32 = 0i32;
            let mut v46: Rc<UH1> = post_lines_28(v0.clone(), v1, v2, v3.clone(), v45, v4.clone());
            Rc::new(UH1::UH1_Cons(v44.clone(), v46.clone()))
        }
        US3::US3_Some(v24) => {
            let mut v24: Rc<Heap0> = v24.clone();
            let mut v25: Rc<str> = v4.l2.clone();
            let mut v26: Rc<str> = v3(v25.clone());
            let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  @"); } LIT.with(|lit| lit.clone()) };
            let mut v28: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v27));
            let mut v29: Rc<str> = v4.l1.clone();
            let mut v30: Rc<str> = Rc::<str>::from(format!("{}{}", v28, v29));
            let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  reposted @"); } LIT.with(|lit| lit.clone()) };
            let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v30, v31));
            let mut v33: Rc<str> = v24.l1.clone();
            let mut v34: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v33));
            let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let mut v36: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v35));
            let mut v37: Rc<str> = v24.l3.clone();
            let mut v38: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v37));
            let mut v39: Rc<str> = metrics_text_26(v24.clone());
            let mut v40: Rc<str> = Rc::<str>::from(format!("{}{}", v38, v39));
            let mut v41: i32 = 0i32;
            let mut v42: Rc<UH1> = post_lines_28(v0.clone(), v1, v2, v3.clone(), v41, v24.clone());
            Rc::new(UH1::UH1_Cons(v40.clone(), v42.clone()))
        }
    }
}
fn method21(mut v0: Rc<UH0>, mut v1: i32, mut v2: bool, mut v3: Rc<dyn Fn(Rc<str>) -> Rc<str>>, mut v4: Rc<UH0>, mut v5: Rc<UH1>) -> Rc<UH1> {
    match &*v4 {
        UH0::UH0_Cons(v6, v7) => {
            let mut v6: Rc<Heap0> = v6.clone();
            let mut v7: Rc<UH0> = v7.clone();
            let mut v8: Rc<UH1> = method21(v0.clone(), v1, v2, v3.clone(), v7.clone(), v5.clone());
            let mut v9: Rc<UH1> = entry_lines_23(v0.clone(), v1, v2, v3.clone(), v6.clone());
            method22(v9.clone(), v8.clone())
        }
        UH0::UH0_Nil => {
            v5.clone()
        }
    }
}
fn method36(mut v0: Rc<UH1>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method36(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH1::UH1_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn method37(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
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
fn rendered_0(mut v0: Rc<str>, mut v1: i32, mut v2: i32, mut v3: i32, mut v4: bool) -> (Rc<str>, i32) {
    let (mut v5, mut v6): (Rc<UH0>, Rc<UH0>) = digest_of_1(v0.clone());
    let mut v7: Rc<UH0> = selected_13(v1, v2, v5.clone());
    let mut v8: Rc<dyn Fn(Rc<str>) -> Rc<str>> = closure1();
    let mut v9: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v10: Rc<UH1> = method21(v6.clone(), v3, v4, v8.clone(), v7.clone(), v9.clone());
    let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = method36(v10.clone(), v11.clone());
    let mut v14: i32 = 0i32;
    let mut v15: i32 = method37(v7.clone(), v14);
    (v12.clone(), v15)
}
fn closure0() -> Rc<dyn Fn(Rc<str>, i32, i32, i32, bool) -> (Rc<str>, i32)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32, i32, i32, bool) -> (Rc<str>, i32)> = Rc::new(move |mut v0: Rc<str>, mut v1: i32, mut v2: i32, mut v3: i32, mut v4: bool| -> (Rc<str>, i32) {
        rendered_0(v0.clone(), v1, v2, v3, v4)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_view(v0: &str, v1: i32, v2: i32, v3: i32, v4: bool) -> (Rc<str>, i32) {
    closure0()(Rc::<str>::from(v0), v1, v2, v3, v4)
}
