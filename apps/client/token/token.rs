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
pub struct Mut0 { pub l0: i32, pub l1: Rc<UH0> }
fn method1(mut v0: Rc<Vec<u8>>, mut v1: i32, mut v2: i32, mut v3: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v4: bool = v2 >= v1;
        if v4 {
            return v3;
        } else {
            let mut v5: usize = ((v2) as usize);
            let v6: u8 = (v0)[v5].clone();
            let v7: i32 = v2.wrapping_add(1i32);
            let v8: bool = v6 >= 48u8;
            let v10: bool = if v8 {
                let mut v9: bool = v6 <= 57u8;
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
            let v38: Rc<str> = if v26 {
                let v27: i32 = (v6 as i32);
                let v28: i32 = v27.wrapping_sub(32i32);
                let v29: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"); } LIT.with(|lit| lit.clone()) }, v28 as i64, v28 as i64);
                v29
            } else {
                let v30: u8 = v6.wrapping_shr((4i32) as u32);
                let v31: i32 = (v30 as i32);
                let v32: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789ABCDEF"); } LIT.with(|lit| lit.clone()) }, v31 as i64, v31 as i64);
                let v33: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("%"); } LIT.with(|lit| lit.clone()) }, v32));
                let mut v34: u8 = v6 & 15u8;
                let v35: i32 = (v34 as i32);
                let v36: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789ABCDEF"); } LIT.with(|lit| lit.clone()) }, v35 as i64, v35 as i64);
                let v37: Rc<str> = Rc::<str>::from(format!("{}{}", v33, v36));
                v37
            };
            let v39: Rc<UH0> = Rc::new(UH0::UH0_Cons(v38, v3));
            (v2, v3) = (v7, v39);
            continue;
        }
    }
}
fn method2(mut v0: Rc<UH0>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
                let v4: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v1));
                (v0, v1) = (v3, v4);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn method5(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
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
fn method6(mut v0: i32, mut v1: &Rc<RefCell<Mut0>>) -> bool {
    let v2: i32 = v1.borrow().l0;
    let v3: bool = v2 < v0;
    v3
}
fn split_list_4(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let v2: i32 = (v0.clone().len() as i32);
    let v3: bool = v2 == 0i32;
    if v3 {
        let v4: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1, v4))
    } else {
        let v6: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(v1.split(&*v0).map(|x| Rc::<str>::from(x)).collect::<Vec<Rc<str>>>()));
        let v7: i32 = (v6.clone().borrow().len() as i32);
        let v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v9: Rc<RefCell<Mut0>> = Rc::new(RefCell::new(Mut0 { l0: 0i32, l1: v8 }));
        while method6(v7, &v9) {
            let v11: i32 = v9.borrow().l0;
            let v12: Rc<UH0> = v9.borrow().l1.clone();
            let v13: Rc<str> = v6.borrow()[v11 as usize].clone();
            let v14: i32 = v11.wrapping_add(1i32);
            let v15: Rc<UH0> = Rc::new(UH0::UH0_Cons(v13, v12));
            v9.borrow_mut().l0 = v14;
            v9.borrow_mut().l1 = v15;
            ()
        };
        let v16: Rc<UH0> = v9.borrow().l1.clone();
        let v17: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        method5(v16, v17)
    }
}
fn closure1() -> Rc<dyn Fn(Rc<str>) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> bool> = Rc::new(move |mut v0: Rc<str>| -> bool {
        let v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN="); } LIT.with(|lit| lit.clone()) };
        let v2: bool = v0.starts_with(&*v1);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method7() -> Rc<dyn Fn(Rc<str>) -> bool> {
    closure1()
}
fn method8(mut v0: Rc<dyn Fn(Rc<str>) -> bool>, mut v1: Rc<UH0>) -> bool {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
                let v4: bool = v0(v2);
                if v4 {
                    return true;
                } else {
                    let mut v5: Rc<dyn Fn(Rc<str>) -> bool> = method7();
                    (v0, v1) = (v5, v3);
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
    match Rc::unwrap_or_clone(v1) {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3;
            let v4: Rc<UH0> = v4;
            let mut v5: Rc<UH0> = method9(v0.clone(), v4, v2);
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
            let v7: bool = v3.ends_with(&*v6);
            let mut v9: Rc<str> = if v7 {
                v6
            } else {
                let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v8
            };
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN="); } LIT.with(|lit| lit.clone()) };
            let v11: bool = v3.starts_with(&*v10);
            let v14: Rc<str> = if v11 {
                let v12: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN="); } LIT.with(|lit| lit.clone()) }, v0));
                let v13: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v9));
                v13
            } else {
                v3
            };
            Rc::new(UH0::UH0_Cons(v14, v5))
        }
        UH0::UH0_Nil => {
            v2
        }
    }
}
fn closure2() -> Rc<dyn Fn(Rc<str>) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> bool> = Rc::new(move |mut v0: Rc<str>| -> bool {
        let v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
        let v2: bool = v0.ends_with(&*v1);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method10() -> Rc<dyn Fn(Rc<str>) -> bool> {
    closure2()
}
fn method11(mut v0: Rc<dyn Fn(Rc<str>) -> bool>, mut v1: Rc<UH0>) -> bool {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
                let v4: bool = v0(v2);
                if v4 {
                    return true;
                } else {
                    let mut v5: Rc<dyn Fn(Rc<str>) -> bool> = method10();
                    (v0, v1) = (v5, v3);
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
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH0> = v3;
            let v4: Rc<UH0> = method12(v3, v1);
            Rc::new(UH0::UH0_Cons(v2, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn closure3() -> Rc<dyn Fn(Rc<str>) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> bool> = Rc::new(move |mut v0: Rc<str>| -> bool {
        let v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN="); } LIT.with(|lit| lit.clone()) };
        let v2: bool = v0.starts_with(&*v1);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method13() -> Rc<dyn Fn(Rc<str>) -> bool> {
    closure3()
}
fn method14(mut v0: Rc<dyn Fn(Rc<str>) -> bool>, mut v1: Rc<UH0>) -> bool {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
                let v4: bool = v0(v2);
                if v4 {
                    return true;
                } else {
                    let mut v5: Rc<dyn Fn(Rc<str>) -> bool> = method13();
                    (v0, v1) = (v5, v3);
                    continue;
                }
            }
            UH0::UH0_Nil => {
                return false;
            }
        }
    }
}
fn method15(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v1) {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3;
            let v4: Rc<UH0> = v4;
            let mut v5: Rc<UH0> = method15(v0.clone(), v4, v2);
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
            let v7: bool = v3.ends_with(&*v6);
            let mut v9: Rc<str> = if v7 {
                v6
            } else {
                let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v8
            };
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN="); } LIT.with(|lit| lit.clone()) };
            let v11: bool = v3.starts_with(&*v10);
            let v14: Rc<str> = if v11 {
                let v12: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN="); } LIT.with(|lit| lit.clone()) }, v0));
                let v13: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v9));
                v13
            } else {
                v3
            };
            Rc::new(UH0::UH0_Cons(v14, v5))
        }
        UH0::UH0_Nil => {
            v2
        }
    }
}
fn method16(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3;
                let v4: Rc<UH0> = v4;
                v0.borrow_mut().push(v3);
                let mut v5: i32 = v2.wrapping_add(1i32);
                (v1, v2) = (v4, v5);
                continue;
            }
            UH0::UH0_Nil => {
                return v2;
            }
        }
    }
}
fn rewritten_3(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: &Rc<str>) -> Rc<str> {
    let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let mut v5: Rc<UH0> = split_list_4(v4.clone(), v0);
    let v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v7: Rc<UH0> = method5(v5.clone(), v6);
    let v14: Rc<UH0> = match Rc::unwrap_or_clone(v7) {
        UH0::UH0_Cons(v8, v9) => {
            let v8: Rc<str> = v8;
            let mut v9: Rc<UH0> = v9;
            let v10: bool = "" == &*v8;
            if v10 {
                let v11: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                method5(v9, v11)
            } else {
                v5
            }
        }
        _ => {
            v5
        }
    };
    let v15: Rc<dyn Fn(Rc<str>) -> bool> = method7();
    let v16: bool = method8(v15, v14.clone());
    let v29: Rc<UH0> = if v16 {
        let v17: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        method9(v1, v14, v17)
    } else {
        let v19: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN="); } LIT.with(|lit| lit.clone()) }, v1));
        let v20: Rc<dyn Fn(Rc<str>) -> bool> = method10();
        let v21: bool = method11(v20, v14.clone());
        let v24: Rc<str> = if v21 {
            let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
            v22
        } else {
            let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v23
        };
        let v25: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v24));
        let v26: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v27: Rc<UH0> = Rc::new(UH0::UH0_Cons(v25, v26));
        method12(v14, v27)
    };
    let v30: Rc<dyn Fn(Rc<str>) -> bool> = method13();
    let v31: bool = method14(v30, v29.clone());
    let v44: Rc<UH0> = if v31 {
        let v32: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        method15(v2, v29, v32)
    } else {
        let mut v34: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN="); } LIT.with(|lit| lit.clone()) }, v2));
        let v35: Rc<dyn Fn(Rc<str>) -> bool> = method10();
        let v36: bool = method11(v35, v29.clone());
        let v39: Rc<str> = if v36 {
            let v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
            v37
        } else {
            let v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v38
        };
        let v40: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v39));
        let v41: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v42: Rc<UH0> = Rc::new(UH0::UH0_Cons(v40, v41));
        method12(v29, v42)
    };
    let v45: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v46: i32 = 0i32;
    let v47: i32 = method16(v45.clone(), v44, v46);
    let v48: Rc<Vec<Rc<str>>> = Rc::new(v45.borrow().clone());
    let v49: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v48).as_ref().clone()));
    let mut v50: Rc<str> = Rc::<str>::from((*v49.borrow()).join(&*v4));
    let v51: Rc<str> = Rc::<str>::from(format!("{}{}", v50, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) }));
    v51
}
fn refreshed_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>) -> (i32, Rc<str>) {
    let mut v5: std::io::Result<String> = std::fs::read_to_string(&*v4);
    let v6: bool = v5.is_ok();
    if v6 {
        let v7: Rc<str> = Rc::<str>::from(v5.as_deref().unwrap_or(""));
        let v8: Rc<Vec<u8>> = Rc::new(v3.bytes().collect());
        let mut v9: usize = (v8).len();
        let v10: i32 = ((v9) as i32);
        let v11: i32 = 0i32;
        let v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v13: Rc<UH0> = method1(v8, v10, v11, v12);
        let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let v15: Rc<str> = method2(v13, v14.clone());
        let v16: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("grant_type=refresh_token&refresh_token="); } LIT.with(|lit| lit.clone()) }, v15));
        let v17: Rc<str> = Rc::<str>::from(format!("{}{}", v16, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&client_id="); } LIT.with(|lit| lit.clone()) }));
        let v18: Rc<Vec<u8>> = Rc::new(v1.bytes().collect());
        let v19: usize = (v18).len();
        let v20: i32 = ((v19) as i32);
        let v21: i32 = 0i32;
        let v22: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v23: Rc<UH0> = method1(v18, v20, v21, v22);
        let v24: Rc<str> = method2(v23, v14);
        let v25: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v24));
        let v26: Rc<str> = Rc::<str>::from(format!("{}{}", v0, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/oauth2/token"); } LIT.with(|lit| lit.clone()) }));
        let (mut v27, mut v28): (i32, Rc<str>) = xc_net::xc_post_form(&*v26, &*v1, &*v2, &*v25);
        let v29: bool = v27 >= 200i32;
        let v31: bool = if v29 {
            let v30: bool = v27 < 300i32;
            v30
        } else {
            false
        };
        if v31 {
            let v32: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v28).unwrap_or_default();
            let v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("expires_in"); } LIT.with(|lit| lit.clone()) };
            let mut v34: serde_json::Value = v32.get(&*v33).cloned().unwrap_or_default();
            let v35: i64 = v34.as_i64().unwrap_or(0);
            let v36: i32 = (v35 as i32);
            let v37: Rc<str> = Rc::<str>::from((v36).to_string());
            let v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("access_token"); } LIT.with(|lit| lit.clone()) };
            let v39: serde_json::Value = v32.get(&*v38).cloned().unwrap_or_default();
            let v40: Rc<str> = Rc::<str>::from(v39.as_str().unwrap_or(""));
            let v41: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("refresh_token"); } LIT.with(|lit| lit.clone()) };
            let v42: serde_json::Value = v32.get(&*v41).cloned().unwrap_or_default();
            let v43: Rc<str> = Rc::<str>::from(v42.as_str().unwrap_or(""));
            let v44: bool = &*v40 == "";
            let v46: bool = if v44 {
                true
            } else {
                let v45: bool = &*v43 == "";
                v45
            };
            if v46 {
                let v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("the token reply had no access_token or refresh_token"); } LIT.with(|lit| lit.clone()) };
                (4i32, v47)
            } else {
                let v48: Rc<str> = rewritten_3(v7.clone(), v40.clone(), v43.clone(), &v37);
                let v49: Rc<str> = Rc::<str>::from(format!("{}{}", v4.clone(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(".tmp"); } LIT.with(|lit| lit.clone()) }));
                let mut v50: std::io::Result<std::fs::File> = std::fs::File::create(&*v49);
                let v51: bool = v50.is_ok();
                let v58: bool = if v51 {
                    let mut v52: std::fs::File = v50.unwrap();
                    let mut v53: std::io::Result<()> = std::io::Write::write_all(&mut v52, (v48).as_bytes());
                    let v54: bool = v53.is_ok();
                    if v54 {
                        let mut v55: std::io::Result<()> = v52.sync_all();
                        let v56: bool = v55.is_ok();
                        v56
                    } else {
                        false
                    }
                } else {
                    false
                };
                let v60: bool = if v58 {
                    let v59: bool = std::fs::rename(&*v49, &*v4).is_ok();
                    v59
                } else {
                    false
                };
                if v60 {
                    let v61: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("renewed X_OAUTH2_ACCESS_TOKEN and X_OAUTH2_REFRESH_TOKEN in "); } LIT.with(|lit| lit.clone()) }, v4));
                    let v62: Rc<str> = Rc::<str>::from(format!("{}{}", v61, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; the access token expires in "); } LIT.with(|lit| lit.clone()) }));
                    let v63: Rc<str> = Rc::<str>::from(format!("{}{}", v62, v37));
                    let v64: Rc<str> = Rc::<str>::from(format!("{}{}", v63, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" s"); } LIT.with(|lit| lit.clone()) }));
                    (0i32, v64)
                } else {
                    let v65: Rc<str> = rewritten_3(v7, v40, v43, &v37);
                    let v66: Rc<str> = Rc::<str>::from(format!("{}{}", v4.clone(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(".renewed"); } LIT.with(|lit| lit.clone()) }));
                    let mut v67: std::io::Result<std::fs::File> = std::fs::File::create(&*v66);
                    let v68: bool = v67.is_ok();
                    let v75: bool = if v68 {
                        let mut v69: std::fs::File = v67.unwrap();
                        let mut v70: std::io::Result<()> = std::io::Write::write_all(&mut v69, (v65).as_bytes());
                        let v71: bool = v70.is_ok();
                        if v71 {
                            let mut v72: std::io::Result<()> = v69.sync_all();
                            let v73: bool = v72.is_ok();
                            v73
                        } else {
                            false
                        }
                    } else {
                        false
                    };
                    let v85: Rc<str> = if v75 {
                        let v76: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not replace "); } LIT.with(|lit| lit.clone()) }, v4.clone()));
                        let v77: Rc<str> = Rc::<str>::from(format!("{}{}", v76, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; the renewed tokens are in "); } LIT.with(|lit| lit.clone()) }));
                        let v78: Rc<str> = Rc::<str>::from(format!("{}{}", v77, v66));
                        let v79: Rc<str> = Rc::<str>::from(format!("{}{}", v78, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", move it over "); } LIT.with(|lit| lit.clone()) }));
                        let v80: Rc<str> = Rc::<str>::from(format!("{}{}", v79, v4));
                        v80
                    } else {
                        let v81: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not write "); } LIT.with(|lit| lit.clone()) }, v4));
                        let v82: Rc<str> = Rc::<str>::from(format!("{}{}", v81, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" or "); } LIT.with(|lit| lit.clone()) }));
                        let v83: Rc<str> = Rc::<str>::from(format!("{}{}", v82, v66));
                        let v84: Rc<str> = Rc::<str>::from(format!("{}{}", v83, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; the renewed refresh token is lost, authorize again"); } LIT.with(|lit| lit.clone()) }));
                        v84
                    };
                    (4i32, v85)
                }
            }
        } else {
            let v90: bool = v27 == 0i32;
            let v109: Rc<str> = if v90 {
                let v91: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cannot reach /2/oauth2/token: "); } LIT.with(|lit| lit.clone()) }, v28));
                v91
            } else {
                let v92: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v28).unwrap_or_default();
                let v93: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("error_description"); } LIT.with(|lit| lit.clone()) };
                let v94: serde_json::Value = v92.get(&*v93).cloned().unwrap_or_default();
                let v95: Rc<str> = Rc::<str>::from(v94.as_str().unwrap_or(""));
                let v96: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("error"); } LIT.with(|lit| lit.clone()) };
                let v97: serde_json::Value = v92.get(&*v96).cloned().unwrap_or_default();
                let v98: Rc<str> = Rc::<str>::from(v97.as_str().unwrap_or(""));
                let v99: bool = &*v95 != "";
                let v102: Rc<str> = if v99 {
                    v95
                } else {
                    let v100: bool = &*v98 != "";
                    if v100 {
                        v98
                    } else {
                        v28
                    }
                };
                let v103: Rc<str> = Rc::<str>::from((v27).to_string());
                let v104: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) }, v103));
                let v105: Rc<str> = Rc::<str>::from(format!("{}{}", v104, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) }));
                let v106: Rc<str> = Rc::<str>::from(format!("{}{}", v105, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/oauth2/token"); } LIT.with(|lit| lit.clone()) }));
                let v107: Rc<str> = Rc::<str>::from(format!("{}{}", v106, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) }));
                let v108: Rc<str> = Rc::<str>::from(format!("{}{}", v107, v102));
                v108
            };
            (4i32, v109)
        }
    } else {
        let v112: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cannot read "); } LIT.with(|lit| lit.clone()) }, v4));
        (3i32, v112)
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>| -> (i32, Rc<str>) {
        refreshed_0(v0, v1, v2, v3, v4)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_refresh(v0: &str, v1: &str, v2: &str, v3: &str, v4: &str) -> (i32, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), Rc::<str>::from(v3), Rc::<str>::from(v4))
}
pub type SpiralShape_652accfc6a8d = Mut0;
