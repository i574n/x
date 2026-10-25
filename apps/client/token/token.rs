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
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
fn method1(mut v0: Rc<Vec<u8>>, mut v1: i32, mut v2: i32, mut v3: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v4: bool = v2 >= v1;
        if v4 {
            return v3.clone();
        } else {
            let mut v5: u8 = (v0)[v2 as usize].clone();
            let v6: i32 = v2.wrapping_add(1i32);
            let v7: bool = v5 >= 48u8;
            let v9: bool = if v7 {
                let v8: bool = v5 <= 57u8;
                v8
            } else {
                false
            };
            let v13: bool = if v9 {
                true
            } else {
                let v10: bool = v5 >= 65u8;
                if v10 {
                    let v11: bool = v5 <= 90u8;
                    v11
                } else {
                    false
                }
            };
            let v17: bool = if v13 {
                true
            } else {
                let v14: bool = v5 >= 97u8;
                if v14 {
                    let v15: bool = v5 <= 122u8;
                    v15
                } else {
                    false
                }
            };
            let v19: bool = if v17 {
                true
            } else {
                let v18: bool = v5 == 45u8;
                v18
            };
            let v21: bool = if v19 {
                true
            } else {
                let v20: bool = v5 == 46u8;
                v20
            };
            let v23: bool = if v21 {
                true
            } else {
                let v22: bool = v5 == 95u8;
                v22
            };
            let v25: bool = if v23 {
                true
            } else {
                let v24: bool = v5 == 126u8;
                v24
            };
            let v41: Rc<str> = if v25 {
                let v26: i32 = (v5 as i32);
                let v27: i32 = v26.wrapping_sub(32i32);
                let v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ"); } LIT.with(|lit| lit.clone()) };
                let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"); } LIT.with(|lit| lit.clone()) };
                let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"); } LIT.with(|lit| lit.clone()) };
                let v31: Rc<str> = string_slice(&v30.clone(), v27 as i64, v27 as i64);
                v31.clone()
            } else {
                let v32: u8 = v5.wrapping_shr((4i32) as u32);
                let v33: i32 = (v32 as i32);
                let v34: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789ABCDEF"); } LIT.with(|lit| lit.clone()) }, v33 as i64, v33 as i64);
                let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("%"); } LIT.with(|lit| lit.clone()) };
                let v36: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v34));
                let v37: u8 = v5 & 15u8;
                let v38: i32 = (v37 as i32);
                let v39: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789ABCDEF"); } LIT.with(|lit| lit.clone()) }, v38 as i64, v38 as i64);
                let v40: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v39));
                v40.clone()
            };
            let v42: Rc<UH0> = Rc::new(UH0::UH0_Cons(v41.clone(), v3.clone()));
            (v0, v1, v2, v3) = (v0.clone(), v1, v6, v42.clone());
            continue;
        }
    }
}
fn method2(mut v0: Rc<UH0>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v1));
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH0::UH0_Nil => {
                return v1.clone();
            }
        }
    }
}
fn method5(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure1() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let mut v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn split_on_4(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let v2: Option<usize> = v1.find(&*v0);
    let v3: Option<usize> = method5(v2);
    let mut v4: Rc<dyn Fn((usize)) -> i32> = closure1();
    let mut v5: Option<i32> = v3.map(|x| v4(x));
    let v7: i32 = v5.unwrap_or(-1i32);
    let v8: bool = v7 < 0i32;
    if v8 {
        let v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1.clone(), v9))
    } else {
        let v11: usize = ((0i32) as usize);
        let v12: usize = ((v7) as usize);
        let v13: Rc<str> = Rc::<str>::from(&(v1)[v11..v12]);
        let v14: i32 = v7.wrapping_add(1i32);
        let v15: i32 = (v1.clone().len() as i32);
        let v16: i32 = v15.wrapping_sub(v7);
        let v17: i32 = v16.wrapping_sub(1i32);
        let v18: usize = ((v14) as usize);
        let v19: i32 = v14.wrapping_add(v17);
        let v20: usize = ((v19) as usize);
        let v21: Rc<str> = Rc::<str>::from(&(v1)[v18..v20]);
        let v22: Rc<UH0> = split_on_4(v0, v21);
        Rc::new(UH0::UH0_Cons(v13, v22))
    }
}
fn method6(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
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
fn closure2(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> bool> {
    Rc::new(move |mut v1: Rc<str>| -> bool {
        let v2: bool = v1.starts_with(&*v0);
        v2
    })
}
fn method7(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> bool> {
    closure2(v0)
}
fn method8(mut v0: Rc<str>, mut v1: Rc<dyn Fn(Rc<str>) -> bool>, mut v2: Rc<UH0>) -> bool {
    loop {
        match &*v2 {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3.clone();
                let mut v4: Rc<UH0> = v4.clone();
                let mut v5: bool = v1(v3.clone());
                if v5 {
                    return true;
                } else {
                    let v6: Rc<dyn Fn(Rc<str>) -> bool> = method7(v0.clone());
                    (v0, v1, v2) = (v0.clone(), v6.clone(), v4.clone());
                    continue;
                }
            }
            UH0::UH0_Nil => {
                return false;
            }
        }
    }
}
fn method9(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> Rc<UH0> {
    match &*v1 {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH0> = method9(v0.clone(), v4, v2.clone());
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
            let v7: bool = v3.ends_with(&*v6);
            let v9: Rc<str> = if v7 {
                v6
            } else {
                let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v8
            };
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
            let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("="); } LIT.with(|lit| lit.clone()) };
            let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN="); } LIT.with(|lit| lit.clone()) };
            let v13: bool = v3.starts_with(&*v12);
            let v17: Rc<str> = if v13 {
                let v16: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v10, v11)), v0)), v9));
                v16
            } else {
                v3
            };
            Rc::new(UH0::UH0_Cons(v17, v5))
        }
        UH0::UH0_Nil => {
            v2
        }
    }
}
fn closure3() -> Rc<dyn Fn(Rc<str>) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> bool> = Rc::new(move |mut v0: Rc<str>| -> bool {
        let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
        let v2: bool = v0.ends_with(&*v1);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method10() -> Rc<dyn Fn(Rc<str>) -> bool> {
    closure3()
}
fn method11(mut v0: Rc<dyn Fn(Rc<str>) -> bool>, mut v1: Rc<UH0>) -> bool {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let mut v4: bool = v0(v2.clone());
                if v4 {
                    return true;
                } else {
                    let mut v5: Rc<dyn Fn(Rc<str>) -> bool> = method10();
                    (v0, v1) = (v5.clone(), v3.clone());
                    continue;
                }
            }
            UH0::UH0_Nil => {
                return false;
            }
        }
    }
}
fn method12(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method12(v3, v1.clone());
            Rc::new(UH0::UH0_Cons(v2, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method13(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> Rc<UH0> {
    match &*v1 {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH0> = method13(v0.clone(), v4, v2.clone());
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
            let v7: bool = v3.ends_with(&*v6);
            let v9: Rc<str> = if v7 {
                v6
            } else {
                let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v8
            };
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN"); } LIT.with(|lit| lit.clone()) };
            let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("="); } LIT.with(|lit| lit.clone()) };
            let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN="); } LIT.with(|lit| lit.clone()) };
            let v13: bool = v3.starts_with(&*v12);
            let v17: Rc<str> = if v13 {
                let v16: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v10, v11)), v0)), v9));
                v16
            } else {
                v3
            };
            Rc::new(UH0::UH0_Cons(v17, v5))
        }
        UH0::UH0_Nil => {
            v2
        }
    }
}
fn method14(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method14(v4, v1.clone(), v2.clone());
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v3, v6)), v5));
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            (v8, v9)
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1, v2)
                }
                _ => unreachable!(),
            };
            (v10, v11)
        }
    };
    (v12, v13)
}
fn rewritten_3(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>) -> Rc<str> {
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let mut v5: Rc<UH0> = split_on_4(v4.clone(), v0);
    let v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v7: Rc<UH0> = method6(v5.clone(), v6);
    let v14: Rc<UH0> = match &*v7 {
        UH0::UH0_Cons(v8, v9) => {
            let v8: Rc<str> = v8.clone();
            let v9: Rc<UH0> = v9.clone();
            let v10: bool = "" == &*v8;
            if v10 {
                let v11: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                method6(v9, v11)
            } else {
                v5.clone()
            }
        }
        _ => {
            v5
        }
    };
    let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("="); } LIT.with(|lit| lit.clone()) };
    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN="); } LIT.with(|lit| lit.clone()) };
    let v18: Rc<dyn Fn(Rc<str>) -> bool> = method7(v17.clone());
    let v19: bool = method8(v17, v18, v14.clone());
    let v33: Rc<UH0> = if v19 {
        let v20: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        method9(v1.clone(), v14.clone(), v20)
    } else {
        let v23: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v15, v16)), v1));
        let v24: Rc<dyn Fn(Rc<str>) -> bool> = method10();
        let v25: bool = method11(v24, v14.clone());
        let v28: Rc<str> = if v25 {
            let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
            v26
        } else {
            let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v27
        };
        let v29: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v28));
        let v30: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v31: Rc<UH0> = Rc::new(UH0::UH0_Cons(v29, v30));
        method12(v14, v31)
    };
    let v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN="); } LIT.with(|lit| lit.clone()) };
    let v36: Rc<dyn Fn(Rc<str>) -> bool> = method7(v35.clone());
    let v37: bool = method8(v35, v36, v33.clone());
    let v51: Rc<UH0> = if v37 {
        let v38: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        method13(v2.clone(), v33.clone(), v38)
    } else {
        let v41: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v34, v16)), v2));
        let v42: Rc<dyn Fn(Rc<str>) -> bool> = method10();
        let v43: bool = method11(v42, v33.clone());
        let v46: Rc<str> = if v43 {
            let v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
            v44
        } else {
            let v45: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v45
        };
        let v47: Rc<str> = Rc::<str>::from(format!("{}{}", v41, v46));
        let v48: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v49: Rc<UH0> = Rc::new(UH0::UH0_Cons(v47, v48));
        method12(v33, v49)
    };
    let mut v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v53, mut v54): (Rc<str>, Rc<str>) = method14(v51, v52.clone(), v52);
    let mut v55: Rc<str> = Rc::<str>::from(format!("{}{}", v53, v4));
    v55
}
fn refreshed_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>) -> (i32, Rc<str>) {
    let mut v5: std::io::Result<String> = std::fs::read_to_string(&*v4);
    let v6: bool = v5.is_ok();
    if v6 {
        let v7: Rc<str> = Rc::<str>::from(v5.as_deref().unwrap_or(""));
        let v8: Rc<Vec<u8>> = Rc::new(v3.bytes().collect());
        let v9: i32 = (v8).len() as i32;
        let v10: i32 = 0i32;
        let v11: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v12: Rc<UH0> = method1(v8.clone(), v9, v10, v11.clone());
        let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let v14: Rc<str> = method2(v12.clone(), v13.clone());
        let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("grant_type=refresh_token&refresh_token="); } LIT.with(|lit| lit.clone()) };
        let v16: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v14));
        let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&client_id="); } LIT.with(|lit| lit.clone()) };
        let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v17));
        let v19: Rc<Vec<u8>> = Rc::new(v1.bytes().collect());
        let v20: i32 = (v19).len() as i32;
        let v21: i32 = 0i32;
        let v22: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v23: Rc<UH0> = method1(v19.clone(), v20, v21, v22.clone());
        let v24: Rc<str> = method2(v23.clone(), v13.clone());
        let v25: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v24));
        let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/oauth2/token"); } LIT.with(|lit| lit.clone()) };
        let v27: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v26));
        let (mut v28, mut v29): (i32, Rc<str>) = xc_net::xc_post_form(&*v27, &*v1, &*v2, &*v25);
        let v30: bool = v28 >= 200i32;
        let v32: bool = if v30 {
            let v31: bool = v28 < 300i32;
            v31
        } else {
            false
        };
        if v32 {
            let v33: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v29).unwrap_or_default();
            let v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("expires_in"); } LIT.with(|lit| lit.clone()) };
            let mut v35: serde_json::Value = v33.get(&*v34).cloned().unwrap_or_default();
            let v36: i64 = v35.as_i64().unwrap_or(0);
            let v37: i32 = (v36 as i32);
            let v38: Rc<str> = Rc::<str>::from(format!("{:?}", v37));
            let v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("access_token"); } LIT.with(|lit| lit.clone()) };
            let v40: serde_json::Value = v33.get(&*v39).cloned().unwrap_or_default();
            let v41: Rc<str> = Rc::<str>::from(v40.as_str().unwrap_or(""));
            let v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("refresh_token"); } LIT.with(|lit| lit.clone()) };
            let v43: serde_json::Value = v33.get(&*v42).cloned().unwrap_or_default();
            let v44: Rc<str> = Rc::<str>::from(v43.as_str().unwrap_or(""));
            let v45: bool = &*v41 == "";
            let v47: bool = if v45 {
                true
            } else {
                let v46: bool = &*v44 == "";
                v46
            };
            if v47 {
                let v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("the token reply had no access_token or refresh_token"); } LIT.with(|lit| lit.clone()) };
                (4i32, v48.clone())
            } else {
                let v49: Rc<str> = rewritten_3(v7.clone(), v41.clone(), v44.clone(), v38.clone());
                let v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(".tmp"); } LIT.with(|lit| lit.clone()) };
                let v51: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v50));
                let mut v52: std::io::Result<std::fs::File> = std::fs::File::create(&*v51);
                let v53: bool = v52.is_ok();
                let v60: bool = if v53 {
                    let mut v54: std::fs::File = v52.unwrap();
                    let mut v55: std::io::Result<()> = std::io::Write::write_all(&mut v54, (v49).as_bytes());
                    let v56: bool = v55.is_ok();
                    if v56 {
                        let mut v57: std::io::Result<()> = v54.sync_all();
                        let v58: bool = v57.is_ok();
                        v58
                    } else {
                        false
                    }
                } else {
                    false
                };
                let v63: bool = if v60 {
                    let v61: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v50));
                    let v62: bool = std::fs::rename(&*v61, &*v4).is_ok();
                    v62
                } else {
                    false
                };
                if v63 {
                    let v64: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("renewed X_OAUTH2_ACCESS_TOKEN and X_OAUTH2_REFRESH_TOKEN in "); } LIT.with(|lit| lit.clone()) };
                    let v65: Rc<str> = Rc::<str>::from(format!("{}{}", v64, v4));
                    let v66: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; the access token expires in "); } LIT.with(|lit| lit.clone()) };
                    let v68: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v65, v66)), v38));
                    let v69: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" s"); } LIT.with(|lit| lit.clone()) };
                    let v70: Rc<str> = Rc::<str>::from(format!("{}{}", v68, v69));
                    (0i32, v70.clone())
                } else {
                    let v71: Rc<str> = rewritten_3(v7.clone(), v41.clone(), v44.clone(), v38.clone());
                    let v72: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(".renewed"); } LIT.with(|lit| lit.clone()) };
                    let v73: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v72));
                    let mut v74: std::io::Result<std::fs::File> = std::fs::File::create(&*v73);
                    let v75: bool = v74.is_ok();
                    let v82: bool = if v75 {
                        let mut v76: std::fs::File = v74.unwrap();
                        let mut v77: std::io::Result<()> = std::io::Write::write_all(&mut v76, (v71).as_bytes());
                        let v78: bool = v77.is_ok();
                        if v78 {
                            let mut v79: std::io::Result<()> = v76.sync_all();
                            let v80: bool = v79.is_ok();
                            v80
                        } else {
                            false
                        }
                    } else {
                        false
                    };
                    let v100: Rc<str> = if v82 {
                        let v83: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not replace "); } LIT.with(|lit| lit.clone()) };
                        let v84: Rc<str> = Rc::<str>::from(format!("{}{}", v83, v4));
                        let v85: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; the renewed tokens are in "); } LIT.with(|lit| lit.clone()) };
                        let v86: Rc<str> = Rc::<str>::from(format!("{}{}", v84, v85));
                        let v88: Rc<str> = Rc::<str>::from(format!("{}{}", v86, Rc::<str>::from(format!("{}{}", v4, v72))));
                        let v89: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", move it over "); } LIT.with(|lit| lit.clone()) };
                        let v91: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v88, v89)), v4));
                        v91.clone()
                    } else {
                        let v92: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not write "); } LIT.with(|lit| lit.clone()) };
                        let v93: Rc<str> = Rc::<str>::from(format!("{}{}", v92, v4));
                        let v94: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" or "); } LIT.with(|lit| lit.clone()) };
                        let v95: Rc<str> = Rc::<str>::from(format!("{}{}", v93, v94));
                        let v97: Rc<str> = Rc::<str>::from(format!("{}{}", v95, Rc::<str>::from(format!("{}{}", v4, v72))));
                        let v98: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; the renewed refresh token is lost, authorize again"); } LIT.with(|lit| lit.clone()) };
                        let v99: Rc<str> = Rc::<str>::from(format!("{}{}", v97, v98));
                        v99.clone()
                    };
                    (4i32, v100.clone())
                }
            }
        } else {
            let v105: bool = v28 == 0i32;
            let v131: Rc<str> = if v105 {
                let v106: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cannot reach "); } LIT.with(|lit| lit.clone()) };
                let v107: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cannot reach /2/oauth2/token"); } LIT.with(|lit| lit.clone()) };
                let v108: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                let v110: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v107, v108)), v29));
                v110.clone()
            } else {
                let v111: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v29).unwrap_or_default();
                let v112: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("error_description"); } LIT.with(|lit| lit.clone()) };
                let v113: serde_json::Value = v111.get(&*v112).cloned().unwrap_or_default();
                let v114: Rc<str> = Rc::<str>::from(v113.as_str().unwrap_or(""));
                let v115: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("error"); } LIT.with(|lit| lit.clone()) };
                let v116: serde_json::Value = v111.get(&*v115).cloned().unwrap_or_default();
                let v117: Rc<str> = Rc::<str>::from(v116.as_str().unwrap_or(""));
                let v118: bool = &*v114 != "";
                let v121: Rc<str> = if v118 {
                    v114.clone()
                } else {
                    let v119: bool = &*v117 != "";
                    if v119 {
                        v117.clone()
                    } else {
                        v29.clone()
                    }
                };
                let v122: Rc<str> = Rc::<str>::from(format!("{:?}", v28));
                let v123: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                let v124: Rc<str> = Rc::<str>::from(format!("{}{}", v123, v122));
                let v125: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                let v127: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v124, v125)), v26));
                let v128: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                let v130: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v127, v128)), v121));
                v130.clone()
            };
            (4i32, v131.clone())
        }
    } else {
        let v134: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cannot read "); } LIT.with(|lit| lit.clone()) };
        let v135: Rc<str> = Rc::<str>::from(format!("{}{}", v134, v4));
        (3i32, v135.clone())
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>| -> (i32, Rc<str>) {
        refreshed_0(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_refresh(v0: &str, v1: &str, v2: &str, v3: &str, v4: &str) -> (i32, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), Rc::<str>::from(v3), Rc::<str>::from(v4))
}
