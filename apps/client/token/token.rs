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
            let mut v5: usize = ((v2) as usize);
            let v6: u8 = (v0)[v5].clone();
            let v7: i32 = v2.wrapping_add(1i32);
            let v8: bool = v6 >= 48u8;
            let v10: bool = if v8 {
                let v9: bool = v6 <= 57u8;
                v9
            } else {
                false
            };
            let v14: bool = if v10 {
                true
            } else {
                let v11: bool = v6 >= 65u8;
                if v11 {
                    let v12: bool = v6 <= 90u8;
                    v12
                } else {
                    false
                }
            };
            let v18: bool = if v14 {
                true
            } else {
                let v15: bool = v6 >= 97u8;
                if v15 {
                    let v16: bool = v6 <= 122u8;
                    v16
                } else {
                    false
                }
            };
            let v20: bool = if v18 {
                true
            } else {
                let v19: bool = v6 == 45u8;
                v19
            };
            let v22: bool = if v20 {
                true
            } else {
                let v21: bool = v6 == 46u8;
                v21
            };
            let v24: bool = if v22 {
                true
            } else {
                let v23: bool = v6 == 95u8;
                v23
            };
            let v26: bool = if v24 {
                true
            } else {
                let v25: bool = v6 == 126u8;
                v25
            };
            let v42: Rc<str> = if v26 {
                let v27: i32 = (v6 as i32);
                let v28: i32 = v27.wrapping_sub(32i32);
                let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ"); } LIT.with(|lit| lit.clone()) };
                let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"); } LIT.with(|lit| lit.clone()) };
                let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"); } LIT.with(|lit| lit.clone()) };
                let v32: Rc<str> = string_slice(&v31.clone(), v28 as i64, v28 as i64);
                v32.clone()
            } else {
                let v33: u8 = v6.wrapping_shr((4i32) as u32);
                let v34: i32 = (v33 as i32);
                let v35: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789ABCDEF"); } LIT.with(|lit| lit.clone()) }, v34 as i64, v34 as i64);
                let v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("%"); } LIT.with(|lit| lit.clone()) };
                let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v35));
                let v38: u8 = v6 & 15u8;
                let v39: i32 = (v38 as i32);
                let v40: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789ABCDEF"); } LIT.with(|lit| lit.clone()) }, v39 as i64, v39 as i64);
                let v41: Rc<str> = Rc::<str>::from(format!("{}{}", v37, v40));
                v41.clone()
            };
            let v43: Rc<UH0> = Rc::new(UH0::UH0_Cons(v42.clone(), v3.clone()));
            (v0, v1, v2, v3) = (v0.clone(), v1, v7, v43.clone());
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
fn split_list_4(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let v2: Option<usize> = v1.find(&*v0);
    let v3: Option<usize> = method5(v2.clone());
    let mut v4: Rc<dyn Fn((usize)) -> i32> = closure1();
    let mut v5: Option<i32> = v3.map(|x| v4(x));
    let v7: i32 = v5.unwrap_or(-1i32);
    let v8: i32 = (v0.clone().len() as i32);
    let v9: bool = v7 < 0i32;
    let v11: bool = if v9 {
        true
    } else {
        let v10: bool = v8 == 0i32;
        v10
    };
    if v11 {
        let v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1.clone(), v12.clone()))
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
        let v25: Rc<UH0> = split_list_4(v0.clone(), v24.clone());
        Rc::new(UH0::UH0_Cons(v16.clone(), v25.clone()))
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
            let mut v5: Rc<UH0> = method9(v0.clone(), v4.clone(), v2.clone());
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
            let v7: bool = v3.ends_with(&*v6);
            let v9: Rc<str> = if v7 {
                v6.clone()
            } else {
                let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v8.clone()
            };
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
            let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("="); } LIT.with(|lit| lit.clone()) };
            let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN="); } LIT.with(|lit| lit.clone()) };
            let v13: bool = v3.starts_with(&*v12);
            let v17: Rc<str> = if v13 {
                let v16: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v10, v11)), v0)), v9));
                v16.clone()
            } else {
                v3.clone()
            };
            Rc::new(UH0::UH0_Cons(v17.clone(), v5.clone()))
        }
        UH0::UH0_Nil => {
            v2.clone()
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
            let mut v5: Rc<UH0> = method13(v0.clone(), v4.clone(), v2.clone());
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
            let v7: bool = v3.ends_with(&*v6);
            let v9: Rc<str> = if v7 {
                v6.clone()
            } else {
                let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v8.clone()
            };
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN"); } LIT.with(|lit| lit.clone()) };
            let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("="); } LIT.with(|lit| lit.clone()) };
            let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN="); } LIT.with(|lit| lit.clone()) };
            let v13: bool = v3.starts_with(&*v12);
            let v17: Rc<str> = if v13 {
                let v16: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v10, v11)), v0)), v9));
                v16.clone()
            } else {
                v3.clone()
            };
            Rc::new(UH0::UH0_Cons(v17.clone(), v5.clone()))
        }
        UH0::UH0_Nil => {
            v2.clone()
        }
    }
}
fn method14(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3.clone();
                let mut v4: Rc<UH0> = v4.clone();
                v0.borrow_mut().push(v3);
                let mut v5: i32 = v2.wrapping_add(1i32);
                (v0, v1, v2) = (v0.clone(), v4.clone(), v5);
                continue;
            }
            UH0::UH0_Nil => {
                return v2;
            }
        }
    }
}
fn rewritten_3(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>) -> Rc<str> {
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let mut v5: Rc<UH0> = split_list_4(v4.clone(), v0.clone());
    let v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v7: Rc<UH0> = method6(v5.clone(), v6.clone());
    let v14: Rc<UH0> = match &*v7 {
        UH0::UH0_Cons(v8, v9) => {
            let v8: Rc<str> = v8.clone();
            let v9: Rc<UH0> = v9.clone();
            let v10: bool = "" == &*v8;
            if v10 {
                let v11: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                method6(v9.clone(), v11.clone())
            } else {
                v5.clone()
            }
        }
        _ => {
            v5.clone()
        }
    };
    let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("="); } LIT.with(|lit| lit.clone()) };
    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN="); } LIT.with(|lit| lit.clone()) };
    let v18: Rc<dyn Fn(Rc<str>) -> bool> = method7(v17.clone());
    let v19: bool = method8(v17.clone(), v18.clone(), v14.clone());
    let v33: Rc<UH0> = if v19 {
        let v20: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        method9(v1.clone(), v14.clone(), v20.clone())
    } else {
        let v23: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v15, v16)), v1));
        let v24: Rc<dyn Fn(Rc<str>) -> bool> = method10();
        let v25: bool = method11(v24.clone(), v14.clone());
        let v28: Rc<str> = if v25 {
            let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
            v26.clone()
        } else {
            let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v27.clone()
        };
        let v29: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v28));
        let v30: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v31: Rc<UH0> = Rc::new(UH0::UH0_Cons(v29.clone(), v30.clone()));
        method12(v14.clone(), v31.clone())
    };
    let v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN="); } LIT.with(|lit| lit.clone()) };
    let v36: Rc<dyn Fn(Rc<str>) -> bool> = method7(v35.clone());
    let mut v37: bool = method8(v35.clone(), v36.clone(), v33.clone());
    let v51: Rc<UH0> = if v37 {
        let v38: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        method13(v2.clone(), v33.clone(), v38.clone())
    } else {
        let v41: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v34, v16)), v2));
        let v42: Rc<dyn Fn(Rc<str>) -> bool> = method10();
        let v43: bool = method11(v42.clone(), v33.clone());
        let v46: Rc<str> = if v43 {
            let v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
            v44.clone()
        } else {
            let v45: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v45.clone()
        };
        let v47: Rc<str> = Rc::<str>::from(format!("{}{}", v41, v46));
        let v48: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v49: Rc<UH0> = Rc::new(UH0::UH0_Cons(v47.clone(), v48.clone()));
        method12(v33.clone(), v49.clone())
    };
    let v52: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v53: i32 = 0i32;
    let mut v54: i32 = method14(v52.clone(), v51.clone(), v53);
    let v55: Rc<Vec<Rc<str>>> = Rc::new(v52.borrow().clone());
    let mut v56: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v55).as_ref().clone()));
    let mut v57: Rc<str> = Rc::<str>::from((*v56.borrow()).join(&*v4));
    let v58: Rc<str> = Rc::<str>::from(format!("{}{}", v57, v4));
    v58.clone()
}
fn refreshed_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>) -> (i32, Rc<str>) {
    let mut v5: std::io::Result<String> = std::fs::read_to_string(&*v4);
    let v6: bool = v5.is_ok();
    if v6 {
        let v7: Rc<str> = Rc::<str>::from(v5.as_deref().unwrap_or(""));
        let v8: Rc<Vec<u8>> = Rc::new(v3.bytes().collect());
        let v9: usize = (v8).len();
        let v10: i32 = ((v9) as i32);
        let v11: i32 = 0i32;
        let v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v13: Rc<UH0> = method1(v8.clone(), v10, v11, v12.clone());
        let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let v15: Rc<str> = method2(v13.clone(), v14.clone());
        let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("grant_type=refresh_token&refresh_token="); } LIT.with(|lit| lit.clone()) };
        let v17: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v15));
        let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&client_id="); } LIT.with(|lit| lit.clone()) };
        let v19: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v18));
        let v20: Rc<Vec<u8>> = Rc::new(v1.bytes().collect());
        let v21: usize = (v20).len();
        let v22: i32 = ((v21) as i32);
        let v23: i32 = 0i32;
        let v24: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v25: Rc<UH0> = method1(v20.clone(), v22, v23, v24.clone());
        let v26: Rc<str> = method2(v25.clone(), v14.clone());
        let v27: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v26));
        let v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/oauth2/token"); } LIT.with(|lit| lit.clone()) };
        let v29: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v28));
        let (mut v30, mut v31): (i32, Rc<str>) = xc_net::xc_post_form(&*v29, &*v1, &*v2, &*v27);
        let v32: bool = v30 >= 200i32;
        let v34: bool = if v32 {
            let v33: bool = v30 < 300i32;
            v33
        } else {
            false
        };
        if v34 {
            let v35: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v31).unwrap_or_default();
            let v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("expires_in"); } LIT.with(|lit| lit.clone()) };
            let mut v37: serde_json::Value = v35.get(&*v36).cloned().unwrap_or_default();
            let v38: i64 = v37.as_i64().unwrap_or(0);
            let v39: i32 = (v38 as i32);
            let v40: Rc<str> = Rc::<str>::from(format!("{:?}", v39));
            let v41: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("access_token"); } LIT.with(|lit| lit.clone()) };
            let v42: serde_json::Value = v35.get(&*v41).cloned().unwrap_or_default();
            let v43: Rc<str> = Rc::<str>::from(v42.as_str().unwrap_or(""));
            let v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("refresh_token"); } LIT.with(|lit| lit.clone()) };
            let v45: serde_json::Value = v35.get(&*v44).cloned().unwrap_or_default();
            let v46: Rc<str> = Rc::<str>::from(v45.as_str().unwrap_or(""));
            let v47: bool = &*v43 == "";
            let v49: bool = if v47 {
                true
            } else {
                let v48: bool = &*v46 == "";
                v48
            };
            if v49 {
                let v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("the token reply had no access_token or refresh_token"); } LIT.with(|lit| lit.clone()) };
                (4i32, v50.clone())
            } else {
                let v51: Rc<str> = rewritten_3(v7.clone(), v43.clone(), v46.clone(), v40.clone());
                let v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(".tmp"); } LIT.with(|lit| lit.clone()) };
                let v53: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v52));
                let mut v54: std::io::Result<std::fs::File> = std::fs::File::create(&*v53);
                let v55: bool = v54.is_ok();
                let v62: bool = if v55 {
                    let mut v56: std::fs::File = v54.unwrap();
                    let mut v57: std::io::Result<()> = std::io::Write::write_all(&mut v56, (v51).as_bytes());
                    let v58: bool = v57.is_ok();
                    if v58 {
                        let mut v59: std::io::Result<()> = v56.sync_all();
                        let v60: bool = v59.is_ok();
                        v60
                    } else {
                        false
                    }
                } else {
                    false
                };
                let v65: bool = if v62 {
                    let v63: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v52));
                    let v64: bool = std::fs::rename(&*v63, &*v4).is_ok();
                    v64
                } else {
                    false
                };
                if v65 {
                    let v66: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("renewed X_OAUTH2_ACCESS_TOKEN and X_OAUTH2_REFRESH_TOKEN in "); } LIT.with(|lit| lit.clone()) };
                    let v67: Rc<str> = Rc::<str>::from(format!("{}{}", v66, v4));
                    let v68: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; the access token expires in "); } LIT.with(|lit| lit.clone()) };
                    let v70: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v67, v68)), v40));
                    let v71: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" s"); } LIT.with(|lit| lit.clone()) };
                    let v72: Rc<str> = Rc::<str>::from(format!("{}{}", v70, v71));
                    (0i32, v72.clone())
                } else {
                    let v73: Rc<str> = rewritten_3(v7.clone(), v43.clone(), v46.clone(), v40.clone());
                    let v74: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(".renewed"); } LIT.with(|lit| lit.clone()) };
                    let v75: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v74));
                    let mut v76: std::io::Result<std::fs::File> = std::fs::File::create(&*v75);
                    let v77: bool = v76.is_ok();
                    let v84: bool = if v77 {
                        let mut v78: std::fs::File = v76.unwrap();
                        let mut v79: std::io::Result<()> = std::io::Write::write_all(&mut v78, (v73).as_bytes());
                        let v80: bool = v79.is_ok();
                        if v80 {
                            let mut v81: std::io::Result<()> = v78.sync_all();
                            let v82: bool = v81.is_ok();
                            v82
                        } else {
                            false
                        }
                    } else {
                        false
                    };
                    let v102: Rc<str> = if v84 {
                        let v85: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not replace "); } LIT.with(|lit| lit.clone()) };
                        let v86: Rc<str> = Rc::<str>::from(format!("{}{}", v85, v4));
                        let v87: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; the renewed tokens are in "); } LIT.with(|lit| lit.clone()) };
                        let v88: Rc<str> = Rc::<str>::from(format!("{}{}", v86, v87));
                        let v90: Rc<str> = Rc::<str>::from(format!("{}{}", v88, Rc::<str>::from(format!("{}{}", v4, v74))));
                        let v91: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", move it over "); } LIT.with(|lit| lit.clone()) };
                        let v93: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v90, v91)), v4));
                        v93.clone()
                    } else {
                        let v94: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not write "); } LIT.with(|lit| lit.clone()) };
                        let v95: Rc<str> = Rc::<str>::from(format!("{}{}", v94, v4));
                        let v96: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" or "); } LIT.with(|lit| lit.clone()) };
                        let v97: Rc<str> = Rc::<str>::from(format!("{}{}", v95, v96));
                        let v99: Rc<str> = Rc::<str>::from(format!("{}{}", v97, Rc::<str>::from(format!("{}{}", v4, v74))));
                        let v100: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; the renewed refresh token is lost, authorize again"); } LIT.with(|lit| lit.clone()) };
                        let v101: Rc<str> = Rc::<str>::from(format!("{}{}", v99, v100));
                        v101.clone()
                    };
                    (4i32, v102.clone())
                }
            }
        } else {
            let v107: bool = v30 == 0i32;
            let v133: Rc<str> = if v107 {
                let v108: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cannot reach "); } LIT.with(|lit| lit.clone()) };
                let v109: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cannot reach /2/oauth2/token"); } LIT.with(|lit| lit.clone()) };
                let v110: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                let v112: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v109, v110)), v31));
                v112.clone()
            } else {
                let v113: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v31).unwrap_or_default();
                let v114: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("error_description"); } LIT.with(|lit| lit.clone()) };
                let v115: serde_json::Value = v113.get(&*v114).cloned().unwrap_or_default();
                let v116: Rc<str> = Rc::<str>::from(v115.as_str().unwrap_or(""));
                let v117: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("error"); } LIT.with(|lit| lit.clone()) };
                let v118: serde_json::Value = v113.get(&*v117).cloned().unwrap_or_default();
                let v119: Rc<str> = Rc::<str>::from(v118.as_str().unwrap_or(""));
                let v120: bool = &*v116 != "";
                let v123: Rc<str> = if v120 {
                    v116.clone()
                } else {
                    let v121: bool = &*v119 != "";
                    if v121 {
                        v119.clone()
                    } else {
                        v31.clone()
                    }
                };
                let v124: Rc<str> = Rc::<str>::from(format!("{:?}", v30));
                let v125: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                let v126: Rc<str> = Rc::<str>::from(format!("{}{}", v125, v124));
                let v127: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                let v129: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v126, v127)), v28));
                let v130: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                let v132: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v129, v130)), v123));
                v132.clone()
            };
            (4i32, v133.clone())
        }
    } else {
        let v136: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cannot read "); } LIT.with(|lit| lit.clone()) };
        let v137: Rc<str> = Rc::<str>::from(format!("{}{}", v136, v4));
        (3i32, v137.clone())
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
