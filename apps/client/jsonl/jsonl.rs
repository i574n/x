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
    US2_Some(Rc<Heap0>),
    US2_None,
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
fn method23(mut v0: Rc<UH2>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let mut v2: US0 = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH1> = method23(v4.clone(), v1.clone());
            let mut v11: Rc<str> = match &v2 {
                US0::US0_Quoted => {
                    let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
                    v6.clone()
                }
                US0::US0_RepliedTo => {
                    let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replied_to"); } LIT.with(|lit| lit.clone()) };
                    v7.clone()
                }
                US0::US0_Reposted => {
                    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposted"); } LIT.with(|lit| lit.clone()) };
                    v8.clone()
                }
            };
            let mut v12: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v11).to_string());
            let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"type\":"); } LIT.with(|lit| lit.clone()) };
            let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v12));
            let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"id\":"); } LIT.with(|lit| lit.clone()) };
            let mut v16: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v15));
            let mut v17: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v3).to_string());
            let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v17));
            let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
            let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v19));
            Rc::new(UH1::UH1_Cons(v20.clone(), v5.clone()))
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn method24(mut v0: Rc<UH1>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method24(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
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
fn method25(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method25(v3.clone(), v1.clone());
            let mut v5: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v2).to_string());
            Rc::new(UH1::UH1_Cons(v5.clone(), v4.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn entry_json_22(mut v0: i32, mut v1: Rc<str>, mut v2: Rc<Heap0>) -> Rc<str> {
    let mut v3: Rc<UH2> = v2.l8.clone();
    let mut v4: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v5: Rc<UH1> = method23(v3.clone(), v4.clone());
    let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v7, mut v8): (Rc<str>, Rc<str>) = method24(v5.clone(), v6.clone());
    let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
    let mut v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v7));
    let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
    let mut v12: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v11));
    let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) };
    let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("refs"); } LIT.with(|lit| lit.clone()) };
    let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"refs"); } LIT.with(|lit| lit.clone()) };
    let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\":"); } LIT.with(|lit| lit.clone()) };
    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"refs\":"); } LIT.with(|lit| lit.clone()) };
    let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v12));
    let mut v19: Rc<UH1> = v2.l7.clone();
    let mut v20: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v21: Rc<UH1> = method25(v19.clone(), v20.clone());
    let (mut v22, mut v23): (Rc<str>, Rc<str>) = method24(v21.clone(), v6.clone());
    let mut v24: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v22));
    let mut v25: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v11));
    let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("hints"); } LIT.with(|lit| lit.clone()) };
    let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"hints"); } LIT.with(|lit| lit.clone()) };
    let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"hints\":"); } LIT.with(|lit| lit.clone()) };
    let mut v29: Rc<str> = Rc::<str>::from(format!("{}{}", v28, v25));
    let mut v30: Rc<str> = Rc::<str>::from(format!("{:?}", v0));
    let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("level"); } LIT.with(|lit| lit.clone()) };
    let mut v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"level"); } LIT.with(|lit| lit.clone()) };
    let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"level\":"); } LIT.with(|lit| lit.clone()) };
    let mut v34: Rc<str> = Rc::<str>::from(format!("{}{}", v33, v30));
    let mut v35: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v1).to_string());
    let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("via"); } LIT.with(|lit| lit.clone()) };
    let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"via"); } LIT.with(|lit| lit.clone()) };
    let mut v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"via\":"); } LIT.with(|lit| lit.clone()) };
    let mut v39: Rc<str> = Rc::<str>::from(format!("{}{}", v38, v35));
    let mut v40: Rc<str> = v2.l0.clone();
    let mut v41: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v40).to_string());
    let mut v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
    let mut v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"id"); } LIT.with(|lit| lit.clone()) };
    let mut v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"id\":"); } LIT.with(|lit| lit.clone()) };
    let mut v45: Rc<str> = Rc::<str>::from(format!("{}{}", v44, v41));
    let mut v46: Rc<str> = v2.l1.clone();
    let mut v47: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v46).to_string());
    let mut v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("username"); } LIT.with(|lit| lit.clone()) };
    let mut v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"username"); } LIT.with(|lit| lit.clone()) };
    let mut v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"username\":"); } LIT.with(|lit| lit.clone()) };
    let mut v51: Rc<str> = Rc::<str>::from(format!("{}{}", v50, v47));
    let mut v52: Rc<str> = v2.l2.clone();
    let mut v53: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v52).to_string());
    let mut v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("created_at"); } LIT.with(|lit| lit.clone()) };
    let mut v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"created_at"); } LIT.with(|lit| lit.clone()) };
    let mut v56: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"created_at\":"); } LIT.with(|lit| lit.clone()) };
    let mut v57: Rc<str> = Rc::<str>::from(format!("{}{}", v56, v53));
    let mut v58: Rc<str> = v2.l3.clone();
    let mut v59: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v58).to_string());
    let mut v60: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
    let mut v61: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"text"); } LIT.with(|lit| lit.clone()) };
    let mut v62: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"text\":"); } LIT.with(|lit| lit.clone()) };
    let mut v63: Rc<str> = Rc::<str>::from(format!("{}{}", v62, v59));
    let mut v64: Rc<str> = v2.l4.clone();
    let mut v65: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reply_count"); } LIT.with(|lit| lit.clone()) };
    let mut v66: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"reply_count"); } LIT.with(|lit| lit.clone()) };
    let mut v67: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"reply_count\":"); } LIT.with(|lit| lit.clone()) };
    let mut v68: Rc<str> = Rc::<str>::from(format!("{}{}", v67, v64));
    let mut v69: Rc<str> = v2.l5.clone();
    let mut v70: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("repost_count"); } LIT.with(|lit| lit.clone()) };
    let mut v71: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"repost_count"); } LIT.with(|lit| lit.clone()) };
    let mut v72: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"repost_count\":"); } LIT.with(|lit| lit.clone()) };
    let mut v73: Rc<str> = Rc::<str>::from(format!("{}{}", v72, v69));
    let mut v74: Rc<str> = v2.l6.clone();
    let mut v75: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("like_count"); } LIT.with(|lit| lit.clone()) };
    let mut v76: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"like_count"); } LIT.with(|lit| lit.clone()) };
    let mut v77: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"like_count\":"); } LIT.with(|lit| lit.clone()) };
    let mut v78: Rc<str> = Rc::<str>::from(format!("{}{}", v77, v74));
    let mut v79: Rc<str> = Rc::<str>::from(format!("{}{}", v39, v6));
    let mut v80: Rc<str> = Rc::<str>::from(format!("{}{}", v79, v6));
    let mut v81: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let mut v82: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v81));
    let mut v83: Rc<str> = Rc::<str>::from(format!("{}{}", v82, v80));
    let mut v84: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v81));
    let mut v85: Rc<str> = Rc::<str>::from(format!("{}{}", v84, v83));
    let mut v86: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v81));
    let mut v87: Rc<str> = Rc::<str>::from(format!("{}{}", v86, v85));
    let mut v88: Rc<str> = Rc::<str>::from(format!("{}{}", v78, v81));
    let mut v89: Rc<str> = Rc::<str>::from(format!("{}{}", v88, v87));
    let mut v90: Rc<str> = Rc::<str>::from(format!("{}{}", v73, v81));
    let mut v91: Rc<str> = Rc::<str>::from(format!("{}{}", v90, v89));
    let mut v92: Rc<str> = Rc::<str>::from(format!("{}{}", v68, v81));
    let mut v93: Rc<str> = Rc::<str>::from(format!("{}{}", v92, v91));
    let mut v94: Rc<str> = Rc::<str>::from(format!("{}{}", v63, v81));
    let mut v95: Rc<str> = Rc::<str>::from(format!("{}{}", v94, v93));
    let mut v96: Rc<str> = Rc::<str>::from(format!("{}{}", v57, v81));
    let mut v97: Rc<str> = Rc::<str>::from(format!("{}{}", v96, v95));
    let mut v98: Rc<str> = Rc::<str>::from(format!("{}{}", v51, v81));
    let mut v99: Rc<str> = Rc::<str>::from(format!("{}{}", v98, v97));
    let mut v100: Rc<str> = Rc::<str>::from(format!("{}{}", v45, v81));
    let mut v101: Rc<str> = Rc::<str>::from(format!("{}{}", v100, v99));
    let mut v102: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{"); } LIT.with(|lit| lit.clone()) };
    let mut v103: Rc<str> = Rc::<str>::from(format!("{}{}", v102, v101));
    let mut v104: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
    let mut v105: Rc<str> = Rc::<str>::from(format!("{}{}", v103, v104));
    v105.clone()
}
fn method28(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method28(v3.clone(), v1.clone());
            Rc::new(UH1::UH1_Cons(v2.clone(), v4.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method30(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: US2) -> US2 {
    match &*v1 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<Heap0> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: US2 = method30(v0.clone(), v4.clone(), v2.clone());
            let mut v6: Rc<str> = v3.l0.clone();
            let mut v7: bool = v6.clone() == v0.clone();
            if v7 {
                US2::US2_Some(v3.clone())
            } else {
                v5.clone()
            }
        }
        UH0::UH0_Nil => {
            v2.clone()
        }
    }
}
fn reference_json_29(mut v0: Rc<UH0>, mut v1: i32, mut v2: i32, mut v3: Rc<Heap0>, mut v4: US0, mut v5: Rc<str>) -> Rc<UH1> {
    let mut v6: US2 = US2::US2_None;
    let mut v7: US2 = method30(v5.clone(), v0.clone(), v6.clone());
    match &v7 {
        US2::US2_None => {
            { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
        }
        US2::US2_Some(v8) => {
            let mut v8: Rc<Heap0> = v8.clone();
            let mut v9: i32 = v2.wrapping_add(1i32);
            let mut v10: Rc<str> = v3.l0.clone();
            let mut v11: Rc<str> = entry_json_22(v9, v10.clone(), v8.clone());
            let mut v12: Rc<UH1> = referenced_json_26(v0.clone(), v1, v9, v8.clone());
            Rc::new(UH1::UH1_Cons(v11.clone(), v12.clone()))
        }
    }
}
fn method27(mut v0: Rc<UH0>, mut v1: i32, mut v2: i32, mut v3: Rc<Heap0>, mut v4: Rc<UH2>, mut v5: Rc<UH1>) -> Rc<UH1> {
    match &*v4 {
        UH2::UH2_Cons(v6, v7, v8) => {
            let mut v6: US0 = v6.clone();
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<UH2> = v8.clone();
            let mut v9: Rc<UH1> = method27(v0.clone(), v1, v2, v3.clone(), v8.clone(), v5.clone());
            let mut v10: Rc<UH1> = reference_json_29(v0.clone(), v1, v2, v3.clone(), v6.clone(), v7.clone());
            method28(v10.clone(), v9.clone())
        }
        UH2::UH2_Nil => {
            v5.clone()
        }
    }
}
fn referenced_json_26(mut v0: Rc<UH0>, mut v1: i32, mut v2: i32, mut v3: Rc<Heap0>) -> Rc<UH1> {
    let mut v4: bool = v2 >= v1;
    if v4 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v6: Rc<UH2> = v3.l8.clone();
        let mut v7: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        method27(v0.clone(), v1, v2, v3.clone(), v6.clone(), v7.clone())
    }
}
fn method21(mut v0: Rc<UH0>, mut v1: i32, mut v2: Rc<UH0>, mut v3: Rc<UH1>) -> Rc<UH1> {
    match &*v2 {
        UH0::UH0_Cons(v4, v5) => {
            let mut v4: Rc<Heap0> = v4.clone();
            let mut v5: Rc<UH0> = v5.clone();
            let mut v6: Rc<UH1> = method21(v0.clone(), v1, v5.clone(), v3.clone());
            let mut v7: i32 = 0i32;
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v9: Rc<str> = entry_json_22(v7, v8.clone(), v4.clone());
            let mut v10: i32 = 0i32;
            let mut v11: Rc<UH1> = referenced_json_26(v0.clone(), v1, v10, v4.clone());
            let mut v12: Rc<UH1> = method28(v11.clone(), v6.clone());
            Rc::new(UH1::UH1_Cons(v9.clone(), v12.clone()))
        }
        UH0::UH0_Nil => {
            v3.clone()
        }
    }
}
fn method31(mut v0: Rc<UH1>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method31(v3.clone(), v1.clone());
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
fn method32(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
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
fn json_lines_0(mut v0: Rc<str>, mut v1: i32, mut v2: i32, mut v3: i32) -> (Rc<str>, i32) {
    let (mut v4, mut v5): (Rc<UH0>, Rc<UH0>) = digest_of_1(v0.clone());
    let mut v6: Rc<UH0> = selected_13(v1, v2, v4.clone());
    let mut v7: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v8: Rc<UH1> = method21(v5.clone(), v3, v6.clone(), v7.clone());
    let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v10, mut v11): (Rc<str>, Rc<str>) = method31(v8.clone(), v9.clone());
    let mut v12: i32 = 0i32;
    let mut v13: i32 = method32(v6.clone(), v12);
    (v10.clone(), v13)
}
fn closure0() -> Rc<dyn Fn(Rc<str>, i32, i32, i32) -> (Rc<str>, i32)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32, i32, i32) -> (Rc<str>, i32)> = Rc::new(move |mut v0: Rc<str>, mut v1: i32, mut v2: i32, mut v3: i32| -> (Rc<str>, i32) {
        json_lines_0(v0.clone(), v1, v2, v3)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_jsonl(v0: &str, v1: i32, v2: i32, v3: i32) -> (Rc<str>, i32) {
    closure0()(Rc::<str>::from(v0), v1, v2, v3)
}
