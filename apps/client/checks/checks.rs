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
impl US0 {
    fn tag(&self) -> i32 {
        match self {
            US0::US0_Some(..) => 0,
            US0::US0_None => 1,
        }
    }
}
impl Default for US0 {
    fn default() -> Self {
        US0::US0_Some(<i32>::default())
    }
}
#[derive(Clone)]
enum US1 {
    US1_Some(Rc<str>),
    US1_None,
}
impl US1 {
    fn tag(&self) -> i32 {
        match self {
            US1::US1_Some(..) => 0,
            US1::US1_None => 1,
        }
    }
}
impl Default for US1 {
    fn default() -> Self {
        US1::US1_Some({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
fn digits_0(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> US0 {
    loop {
        let mut v3: i32 = (v0.clone().len() as i32);
        let mut v4: bool = v1 >= v3;
        if v4 {
            return US0::US0_Some(v2);
        } else {
            let mut v6: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789"); } LIT.with(|lit| lit.clone()) };
            let mut v8: i32 = v7.find(&*v6).map(|i| i as i32).unwrap_or(-1);
            let mut v9: bool = v8 < 0i32;
            let mut v11: bool = if v9 {
                true
            } else {
                let mut v10: bool = v2 > 100000000i32;
                v10
            };
            if v11 {
                return US0::US0_None;
            } else {
                let mut v13: i32 = v1.wrapping_add(1i32);
                let mut v14: i32 = v2.wrapping_mul(10i32);
                let mut v15: i32 = v14.wrapping_add(v8);
                (v0, v1, v2) = (v0.clone(), v13, v15);
                continue;
            }
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> i32> = Rc::new(move |mut v0: Rc<str>| -> i32 {
        let mut v1: bool = v0.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v6: US0 = if v1 {
            US0::US0_None
        } else {
            let mut v3: i32 = 0i32;
            let mut v4: i32 = 0i32;
            digits_0(v0.clone(), v3, v4)
        };
        match &v6 {
            US0::US0_None => {
                -1i32
            }
            US0::US0_Some(v7) => {
                let mut v7: i32 = *v7;
                v7
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn go_1(mut v0: Rc<str>, mut v1: i32) -> bool {
    loop {
        let mut v2: bool = v1 >= 10i32;
        if v2 {
            return true;
        } else {
            let mut v3: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("9999-99-99"); } LIT.with(|lit| lit.clone()) }, v1 as i64, v1 as i64);
            let mut v4: bool = v3.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("9"); } LIT.with(|lit| lit.clone()) };
            let mut v11: bool = if v4 {
                let mut v5: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
                let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789"); } LIT.with(|lit| lit.clone()) };
                let mut v7: i32 = v6.find(&*v5).map(|i| i as i32).unwrap_or(-1);
                let mut v8: bool = v7 >= 0i32;
                v8
            } else {
                let mut v9: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
                let mut v10: bool = v3.clone() == v9.clone();
                v10
            };
            if v11 {
                let mut v12: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v0.clone(), v12);
                continue;
            } else {
                return false;
            }
        }
    }
}
fn go_2(mut v0: Rc<str>, mut v1: i32) -> bool {
    loop {
        let mut v2: bool = v1 >= 20i32;
        if v2 {
            return true;
        } else {
            let mut v3: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("9999-99-99T99:99:99Z"); } LIT.with(|lit| lit.clone()) }, v1 as i64, v1 as i64);
            let mut v4: bool = v3.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("9"); } LIT.with(|lit| lit.clone()) };
            let mut v11: bool = if v4 {
                let mut v5: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
                let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789"); } LIT.with(|lit| lit.clone()) };
                let mut v7: i32 = v6.find(&*v5).map(|i| i as i32).unwrap_or(-1);
                let mut v8: bool = v7 >= 0i32;
                v8
            } else {
                let mut v9: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
                let mut v10: bool = v3.clone() == v9.clone();
                v10
            };
            if v11 {
                let mut v12: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v0.clone(), v12);
                continue;
            } else {
                return false;
            }
        }
    }
}
fn closure1() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        let mut v1: i32 = (v0.clone().len() as i32);
        let mut v2: bool = v1 == 10i32;
        let mut v5: bool = if v2 {
            let mut v3: i32 = 0i32;
            go_1(v0.clone(), v3)
        } else {
            false
        };
        if v5 {
            let mut v6: Rc<str> = xc_net::xc_local_midnight(&*v0);
            v6.clone()
        } else {
            let mut v9: bool = if v2 {
                let mut v7: i32 = 0i32;
                go_1(v0.clone(), v7)
            } else {
                false
            };
            let mut v20: US1 = if v9 {
                let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("T00:00:00Z"); } LIT.with(|lit| lit.clone()) };
                let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v10));
                US1::US1_Some(v11.clone())
            } else {
                let mut v13: bool = v1 == 20i32;
                let mut v16: bool = if v13 {
                    let mut v14: i32 = 0i32;
                    go_2(v0.clone(), v14)
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
                    let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    v22.clone()
                }
                US1::US1_Some(v21) => {
                    let mut v21: Rc<str> = v21.clone();
                    v21.clone()
                }
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn ok_4(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> bool {
    loop {
        let mut v3: bool = v2 >= v1;
        if v3 {
            return true;
        } else {
            let mut v4: Rc<str> = string_slice(&v0.clone(), v2 as i64, v2 as i64);
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_"); } LIT.with(|lit| lit.clone()) };
            let mut v6: bool = v5.contains(&*v4);
            if v6 {
                let mut v7: i32 = v2.wrapping_add(1i32);
                (v0, v1, v2) = (v0.clone(), v1, v7);
                continue;
            } else {
                return false;
            }
        }
    }
}
fn username_chars_3(mut v0: Rc<str>) -> bool {
    let mut v1: i32 = (v0.clone().len() as i32);
    let mut v2: bool = v1 >= 1i32;
    let mut v4: bool = if v2 {
        let mut v3: bool = v1 <= 15i32;
        v3
    } else {
        false
    };
    if v4 {
        let mut v5: i32 = 0i32;
        ok_4(v0.clone(), v1, v5)
    } else {
        false
    }
}
fn closure2() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("@"); } LIT.with(|lit| lit.clone()) };
        let mut v2: bool = v0.starts_with(&*v1);
        let mut v6: Rc<str> = if v2 {
            let mut v3: i32 = (v0.clone().len() as i32);
            let mut v4: i32 = v3.wrapping_sub(1i32);
            let mut v5: Rc<str> = string_slice(&v0.clone(), 1i32 as i64, v4 as i64);
            v5.clone()
        } else {
            v0.clone()
        };
        let mut v7: bool = username_chars_3(v6.clone());
        let mut v10: US1 = if v7 {
            US1::US1_Some(v6.clone())
        } else {
            US1::US1_None
        };
        match &v10 {
            US1::US1_None => {
                let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v12.clone()
            }
            US1::US1_Some(v11) => {
                let mut v11: Rc<str> = v11.clone();
                v11.clone()
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_count(v0: &str) -> i32 {
    closure0()(Rc::<str>::from(v0))
}
pub fn xc_date(v0: &str) -> Rc<str> {
    closure1()(Rc::<str>::from(v0))
}
pub fn xc_username(v0: &str) -> Rc<str> {
    closure2()(Rc::<str>::from(v0))
}
