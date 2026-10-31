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
enum US0 {
    US0_Some(i32),
    US0_None,
}
#[derive(Clone)]
enum US1 {
    US1_Some(Rc<str>),
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
fn digits_1(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> US0 {
    loop {
        let v3: i32 = (v0.clone().len() as i32);
        let v4: bool = v1 >= v3;
        if v4 {
            return US0::US0_Some(v2);
        } else {
            let v6: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789"); } LIT.with(|lit| lit.clone()) };
            let v8: Option<usize> = v7.find(&*v6);
            let mut v9: Option<usize> = method2(v8.clone());
            let mut v10: Rc<dyn Fn((usize)) -> i32> = closure1();
            let mut v11: Option<i32> = v9.map(|x| v10(x));
            let v13: i32 = v11.unwrap_or(-1i32);
            let v14: bool = v13 < 0i32;
            let v16: bool = if v14 {
                true
            } else {
                let v15: bool = v2 > 100000000i32;
                v15
            };
            if v16 {
                return US0::US0_None;
            } else {
                let v18: i32 = v1.wrapping_add(1i32);
                let v19: i32 = v2.wrapping_mul(10i32);
                let v20: i32 = v19.wrapping_add(v13);
                (v0, v1, v2) = (v0.clone(), v18, v20);
                continue;
            }
        }
    }
}
fn count_of_text_0(mut v0: Rc<str>) -> US0 {
    let v1: bool = &*v0 == "";
    let v24: bool = if v1 {
        true
    } else {
        let v2: Rc<str> = Rc::<str>::from(format!("{:?}", 0i32));
        let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let v4: Rc<str> = Rc::<str>::from(v0.replace(&*v2, &*v3));
        let v5: Rc<str> = Rc::<str>::from(format!("{:?}", 1i32));
        let v6: Rc<str> = Rc::<str>::from(v4.replace(&*v5, &*v3));
        let v7: Rc<str> = Rc::<str>::from(format!("{:?}", 2i32));
        let v8: Rc<str> = Rc::<str>::from(v6.replace(&*v7, &*v3));
        let mut v9: Rc<str> = Rc::<str>::from(format!("{:?}", 3i32));
        let mut v10: Rc<str> = Rc::<str>::from(v8.replace(&*v9, &*v3));
        let mut v11: Rc<str> = Rc::<str>::from(format!("{:?}", 4i32));
        let v12: Rc<str> = Rc::<str>::from(v10.replace(&*v11, &*v3));
        let v13: Rc<str> = Rc::<str>::from(format!("{:?}", 5i32));
        let v14: Rc<str> = Rc::<str>::from(v12.replace(&*v13, &*v3));
        let v15: Rc<str> = Rc::<str>::from(format!("{:?}", 6i32));
        let v16: Rc<str> = Rc::<str>::from(v14.replace(&*v15, &*v3));
        let v17: Rc<str> = Rc::<str>::from(format!("{:?}", 7i32));
        let v18: Rc<str> = Rc::<str>::from(v16.replace(&*v17, &*v3));
        let v19: Rc<str> = Rc::<str>::from(format!("{:?}", 8i32));
        let v20: Rc<str> = Rc::<str>::from(v18.replace(&*v19, &*v3));
        let v21: Rc<str> = Rc::<str>::from(format!("{:?}", 9i32));
        let v22: Rc<str> = Rc::<str>::from(v20.replace(&*v21, &*v3));
        let v23: bool = &*v22 != "";
        v23
    };
    if v24 {
        US0::US0_None
    } else {
        let v26: i32 = 0i32;
        let v27: i32 = 0i32;
        digits_1(v0.clone(), v26, v27)
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> i32> = Rc::new(move |mut v0: Rc<str>| -> i32 {
        let v1: US0 = count_of_text_0(v0.clone());
        match &v1 {
            US0::US0_None => {
                -1i32
            }
            US0::US0_Some(v2) => {
                let v2: i32 = *v2;
                v2
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn go_3(mut v0: Rc<str>, mut v1: i32) -> bool {
    loop {
        let v2: bool = v1 >= 10i32;
        if v2 {
            return true;
        } else {
            let v3: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("9999-99-99"); } LIT.with(|lit| lit.clone()) }, v1 as i64, v1 as i64);
            let v4: bool = &*v3 == "9";
            let v16: bool = if v4 {
                let v5: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
                let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789"); } LIT.with(|lit| lit.clone()) };
                let v7: Option<usize> = v6.find(&*v5);
                let v8: Option<usize> = method2(v7.clone());
                let mut v9: Rc<dyn Fn((usize)) -> i32> = closure1();
                let mut v10: Option<i32> = v8.map(|x| v9(x));
                let v12: i32 = v10.unwrap_or(-1i32);
                let v13: bool = v12 >= 0i32;
                v13
            } else {
                let v14: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
                let v15: bool = &*v3 == &*v14;
                v15
            };
            if v16 {
                let v17: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v0.clone(), v17);
                continue;
            } else {
                return false;
            }
        }
    }
}
fn go_4(mut v0: Rc<str>, mut v1: i32) -> bool {
    loop {
        let v2: bool = v1 >= 20i32;
        if v2 {
            return true;
        } else {
            let v3: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("9999-99-99T99:99:99Z"); } LIT.with(|lit| lit.clone()) }, v1 as i64, v1 as i64);
            let v4: bool = &*v3 == "9";
            let v16: bool = if v4 {
                let v5: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
                let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789"); } LIT.with(|lit| lit.clone()) };
                let v7: Option<usize> = v6.find(&*v5);
                let v8: Option<usize> = method2(v7.clone());
                let mut v9: Rc<dyn Fn((usize)) -> i32> = closure1();
                let mut v10: Option<i32> = v8.map(|x| v9(x));
                let v12: i32 = v10.unwrap_or(-1i32);
                let v13: bool = v12 >= 0i32;
                v13
            } else {
                let v14: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
                let v15: bool = &*v3 == &*v14;
                v15
            };
            if v16 {
                let v17: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v0.clone(), v17);
                continue;
            } else {
                return false;
            }
        }
    }
}
fn closure2() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        let v1: i32 = (v0.clone().len() as i32);
        let v2: bool = v1 == 10i32;
        let v5: bool = if v2 {
            let v3: i32 = 0i32;
            go_3(v0.clone(), v3)
        } else {
            false
        };
        if v5 {
            let v6: Rc<str> = xc_net::xc_local_midnight(&*v0);
            v6.clone()
        } else {
            let mut v9: bool = if v2 {
                let v7: i32 = 0i32;
                go_3(v0.clone(), v7)
            } else {
                false
            };
            let v20: US1 = if v9 {
                let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("T00:00:00Z"); } LIT.with(|lit| lit.clone()) };
                let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v10));
                US1::US1_Some(v11.clone())
            } else {
                let v13: bool = v1 == 20i32;
                let v16: bool = if v13 {
                    let v14: i32 = 0i32;
                    go_4(v0.clone(), v14)
                } else {
                    false
                };
                if v16 {
                    US1::US1_Some(v0.clone())
                } else {
                    US1::US1_None
                }
            };
            match &v20 {
                US1::US1_None => {
                    let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    v22.clone()
                }
                US1::US1_Some(v21) => {
                    let v21: Rc<str> = v21.clone();
                    v21.clone()
                }
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn ok_6(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> bool {
    loop {
        let v3: bool = v2 >= v1;
        if v3 {
            return true;
        } else {
            let v4: Rc<str> = string_slice(&v0.clone(), v2 as i64, v2 as i64);
            let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_"); } LIT.with(|lit| lit.clone()) };
            let v6: bool = v5.contains(&*v4);
            if v6 {
                let v7: i32 = v2.wrapping_add(1i32);
                (v0, v1, v2) = (v0.clone(), v1, v7);
                continue;
            } else {
                return false;
            }
        }
    }
}
fn username_chars_5(mut v0: Rc<str>) -> bool {
    let v1: i32 = (v0.clone().len() as i32);
    let v2: bool = v1 >= 1i32;
    let v4: bool = if v2 {
        let v3: bool = v1 <= 15i32;
        v3
    } else {
        false
    };
    if v4 {
        let v5: i32 = 0i32;
        ok_6(v0, v1, v5)
    } else {
        false
    }
}
fn closure3() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        let v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("@"); } LIT.with(|lit| lit.clone()) };
        let v2: bool = v0.starts_with(&*v1);
        let mut v9: Rc<str> = if v2 {
            let v3: i32 = (v0.clone().len() as i32);
            let v4: i32 = v3.wrapping_sub(1i32);
            let v5: usize = ((1i32) as usize);
            let v6: i32 = 1i32.wrapping_add(v4);
            let v7: usize = ((v6) as usize);
            let v8: Rc<str> = Rc::<str>::from(&(v0)[v5..v7]);
            v8.clone()
        } else {
            v0.clone()
        };
        let mut v10: bool = username_chars_5(v9.clone());
        let v13: US1 = if v10 {
            US1::US1_Some(v9.clone())
        } else {
            US1::US1_None
        };
        match &v13 {
            US1::US1_None => {
                let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v15.clone()
            }
            US1::US1_Some(v14) => {
                let v14: Rc<str> = v14.clone();
                v14.clone()
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_count(v0: &str) -> i32 {
    closure0()(Rc::<str>::from(v0))
}
pub fn xc_date(v0: &str) -> Rc<str> {
    closure2()(Rc::<str>::from(v0))
}
pub fn xc_username(v0: &str) -> Rc<str> {
    closure3()(Rc::<str>::from(v0))
}
