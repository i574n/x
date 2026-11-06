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
#[derive(Clone)]
enum US1 {
    US1_NotTwoWords,
    US1_NotAFraction,
    US1_PartOutOfRange,
}
#[derive(Clone)]
enum US0 {
    US0_Ok(Rc<str>, i32, i32),
    US0_Error(US1),
}
#[derive(Clone)]
enum US2 {
    US2_Some(i32),
    US2_None,
}
#[derive(Clone)]
enum US3 {
    US3_Hand,
    US3_Generated,
    US3_Data,
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, i32, i32, i32, Rc<UH1>),
}
fn method1(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
                let mut v4: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2, v1));
                (v0, v1) = (v3, v4);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn method2(mut v0: i32, mut v1: &Rc<RefCell<Mut0>>) -> bool {
    let v2: i32 = v1.borrow().l0;
    let v3: bool = v2 < v0;
    v3
}
fn split_list_0(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let v2: i32 = (v0.clone().len() as i32);
    let v3: bool = v2 == 0i32;
    if v3 {
        let mut v4: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1, v4))
    } else {
        let mut v6: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(v1.split(&*v0).map(|x| Rc::<str>::from(x)).collect::<Vec<Rc<str>>>()));
        let v7: i32 = (v6.clone().borrow().len() as i32);
        let v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v9: Rc<RefCell<Mut0>> = Rc::new(RefCell::new(Mut0 { l0: 0i32, l1: v8 }));
        while method2(v7, &v9) {
            let mut v11: i32 = v9.borrow().l0;
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
        method1(v16, v17)
    }
}
fn file_exists_4(mut v0: Rc<str>) -> bool {
    let v2: &str = &*v0;
    let mut v4: std::string::String = String::from(v2);
    let mut v6: std::path::PathBuf = std::path::PathBuf::from(v4);
    let v8: bool = v6.exists();
    if v8 {
        let mut v10: bool = v6.is_file();
        v10
    } else {
        false
    }
}
fn method5(mut v0: Vec<u8>) -> Vec<u8> {
    v0
}
fn method9(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure1() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn digits_11(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> US2 {
    loop {
        let v3: i32 = (v0.clone().len() as i32);
        let mut v4: bool = v1 >= v3;
        if v4 {
            return US2::US2_Some(v2);
        } else {
            let mut v6: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789"); } LIT.with(|lit| lit.clone()) };
            let v8: Option<usize> = v7.find(&*v6);
            let mut v9: Option<usize> = method9(v8);
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
                return US2::US2_None;
            } else {
                let v18: i32 = v1.wrapping_add(1i32);
                let v19: i32 = v2.wrapping_mul(10i32);
                let v20: i32 = v19.wrapping_add(v13);
                (v1, v2) = (v18, v20);
                continue;
            }
        }
    }
}
fn count_of_text_10(mut v0: Rc<str>) -> US2 {
    let v1: bool = &*v0 == "";
    let v24: bool = if v1 {
        true
    } else {
        let v2: Rc<str> = Rc::<str>::from((0i32).to_string());
        let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v4: Rc<str> = Rc::<str>::from(v0.replace(&*v2, &*v3));
        let mut v5: Rc<str> = Rc::<str>::from((1i32).to_string());
        let mut v6: Rc<str> = Rc::<str>::from(v4.replace(&*v5, &*v3));
        let v7: Rc<str> = Rc::<str>::from((2i32).to_string());
        let v8: Rc<str> = Rc::<str>::from(v6.replace(&*v7, &*v3));
        let mut v9: Rc<str> = Rc::<str>::from((3i32).to_string());
        let mut v10: Rc<str> = Rc::<str>::from(v8.replace(&*v9, &*v3));
        let mut v11: Rc<str> = Rc::<str>::from((4i32).to_string());
        let v12: Rc<str> = Rc::<str>::from(v10.replace(&*v11, &*v3));
        let v13: Rc<str> = Rc::<str>::from((5i32).to_string());
        let v14: Rc<str> = Rc::<str>::from(v12.replace(&*v13, &*v3));
        let v15: Rc<str> = Rc::<str>::from((6i32).to_string());
        let v16: Rc<str> = Rc::<str>::from(v14.replace(&*v15, &*v3));
        let v17: Rc<str> = Rc::<str>::from((7i32).to_string());
        let v18: Rc<str> = Rc::<str>::from(v16.replace(&*v17, &*v3));
        let v19: Rc<str> = Rc::<str>::from((8i32).to_string());
        let v20: Rc<str> = Rc::<str>::from(v18.replace(&*v19, &*v3));
        let v21: Rc<str> = Rc::<str>::from((9i32).to_string());
        let mut v22: Rc<str> = Rc::<str>::from(v20.replace(&*v21, &*v3));
        let v23: bool = &*v22 != "";
        v23
    };
    if v24 {
        US2::US2_None
    } else {
        let v26: i32 = 0i32;
        let v27: i32 = 0i32;
        digits_11(v0, v26, v27)
    }
}
fn fraction_of_8(mut v0: Rc<str>, mut v1: Rc<str>) -> US0 {
    let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let v3: Option<usize> = v1.find(&*v2);
    let mut v4: Option<usize> = method9(v3);
    let mut v5: Rc<dyn Fn((usize)) -> i32> = closure1();
    let mut v6: Option<i32> = v4.map(|x| v5(x));
    let v8: i32 = v6.unwrap_or(-1i32);
    let mut v9: bool = v8 > 0i32;
    if v9 {
        let mut v10: usize = ((0i32) as usize);
        let mut v11: usize = ((v8) as usize);
        let v12: Rc<str> = Rc::<str>::from(&(v1)[v10..v11]);
        let v13: US2 = count_of_text_10(v12);
        match v13 {
            US2::US2_None => {
                let v36: US1 = US1::US1_NotAFraction;
                US0::US0_Error(v36)
            }
            US2::US2_Some(v14) => {
                let v14: i32 = v14;
                let v15: i32 = v8.wrapping_add(1i32);
                let v16: i32 = (v1.clone().len() as i32);
                let v17: i32 = v16.wrapping_sub(v8);
                let v18: i32 = v17.wrapping_sub(1i32);
                let v19: usize = ((v15) as usize);
                let v20: i32 = v15.wrapping_add(v18);
                let v21: usize = ((v20) as usize);
                let mut v22: Rc<str> = Rc::<str>::from(&(v1)[v19..v21]);
                let v23: US2 = count_of_text_10(v22);
                match v23 {
                    US2::US2_None => {
                        let v32: US1 = US1::US1_NotAFraction;
                        US0::US0_Error(v32)
                    }
                    US2::US2_Some(v24) => {
                        let v24: i32 = v24;
                        let v25: bool = v14 >= 1i32;
                        let v27: bool = if v25 {
                            let v26: bool = v14 <= v24;
                            v26
                        } else {
                            false
                        };
                        if v27 {
                            US0::US0_Ok(v0, v14, v24)
                        } else {
                            let v29: US1 = US1::US1_PartOutOfRange;
                            US0::US0_Error(v29)
                        }
                    }
                }
            }
        }
    } else {
        let v40: US1 = US1::US1_NotAFraction;
        US0::US0_Error(v40)
    }
}
fn parsed_7(mut v0: Rc<str>) -> US0 {
    let v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
    let v2: Option<usize> = v0.find(&*v1);
    let v3: Option<usize> = method9(v2);
    let mut v4: Rc<dyn Fn((usize)) -> i32> = closure1();
    let mut v5: Option<i32> = v3.map(|x| v4(x));
    let v7: i32 = v5.unwrap_or(-1i32);
    let v8: bool = v7 > 0i32;
    let v18: Rc<str> = if v8 {
        let mut v9: i32 = v7.wrapping_add(1i32);
        let mut v10: i32 = (v0.clone().len() as i32);
        let mut v11: i32 = v10.wrapping_sub(v7);
        let v12: i32 = v11.wrapping_sub(1i32);
        let v13: usize = ((v9) as usize);
        let v14: i32 = v9.wrapping_add(v12);
        let v15: usize = ((v14) as usize);
        let v16: Rc<str> = Rc::<str>::from(&(v0)[v13..v15]);
        v16
    } else {
        let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v17
    };
    let v19: bool = v7 <= 0i32;
    let v26: bool = if v19 {
        true
    } else {
        let v20: Option<usize> = v18.find(&*v1);
        let v21: Option<usize> = method9(v20);
        let mut v22: Option<i32> = v21.map(|x| v4(x));
        let v24: i32 = v22.unwrap_or(-1i32);
        let v25: bool = v24 >= 0i32;
        v25
    };
    if v26 {
        let v27: US1 = US1::US1_NotTwoWords;
        US0::US0_Error(v27)
    } else {
        let v29: usize = ((0i32) as usize);
        let v30: usize = ((v7) as usize);
        let v31: Rc<str> = Rc::<str>::from(&(v0)[v29..v30]);
        fraction_of_8(v31, v18)
    }
}
fn method6(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: i32, mut v3: i32, mut v4: i32) -> (Rc<str>, i32, i32, i32) {
    let (mut v36, mut v37, mut v38, mut v39): (Rc<str>, i32, i32, i32) = match &*v0 {
        UH0::UH0_Cons(v5, v6) => {
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH0> = v6.clone();
            let v7: US0 = parsed_7(v5);
            let (mut v24, mut v25, mut v26, mut v27): (Rc<str>, i32, i32, i32) = match &v7 {
                US0::US0_Ok(v8, v9, v10) => {
                    let v8: Rc<str> = v8.clone();
                    let mut v9: i32 = *v9;
                    let mut v10: i32 = *v10;
                    let mut v11: bool = v9 == 1i32;
                    let v13: bool = if v11 {
                        let v12: bool = v10 > 1i32;
                        v12
                    } else {
                        false
                    };
                    let v14: i32 = if v13 {
                        1i32
                    } else {
                        0i32
                    };
                    let v15: i32 = v4.wrapping_add(1i32);
                    let v16: i32 = if v11 {
                        1i32
                    } else {
                        0i32
                    };
                    let v17: i32 = v2.wrapping_add(v16);
                    let v18: i32 = v3.wrapping_add(v14);
                    (v1, v17, v18, v15)
                }
                _ => {
                    let (mut v20, mut v21, mut v22, mut v23): (Rc<str>, i32, i32, i32) = match v7 {
                        US0::US0_Error(v19) => {
                            let v19: US1 = v19;
                            (v1, v2, v3, v4)
                        }
                        _ => unreachable!(),
                    };
                    (v20, v21, v22, v23)
                }
            };
            method6(v6, v24, v25, v26, v27)
        }
        _ => {
            let (mut v32, mut v33, mut v34, mut v35): (Rc<str>, i32, i32, i32) = match Rc::unwrap_or_clone(v0) {
                UH0::UH0_Nil => {
                    (v1, v2, v3, v4)
                }
                _ => unreachable!(),
            };
            (v32, v33, v34, v35)
        }
    };
    (v36, v37, v38, v39)
}
fn method3(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3;
                let mut v4: Rc<UH0> = v4;
                let mut v5: bool = file_exists_4(v3.clone());
                let v67: Rc<UH0> = if v5 {
                    let v7: Result<Vec<u8>, std::io::Error> = std::fs::read(&*v3);
                    let mut v9: Vec<u8> = v7.unwrap();
                    let mut v10: Vec<u8> = method5(v9);
                    let v12: Result<std::string::String, std::string::FromUtf8Error> = std::string::String::from_utf8(v10);
                    let v14: std::string::String = v12.unwrap();
                    let v16: Rc<str> = Rc::<str>::from(String::as_str(&v14));
                    let v17: Rc<str> = xc_preview::xc_preview(&*v0, &*v16);
                    let v18: bool = &*v17 == "";
                    let mut v22: Rc<UH0> = if v18 {
                        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
                    } else {
                        let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                        split_list_0(v20, v17)
                    };
                    let v23: i32 = 0i32;
                    let v24: i32 = 0i32;
                    let v25: i32 = 0i32;
                    let (mut v26, mut v27, mut v28, mut v29): (Rc<str>, i32, i32, i32) = method6(v22, v3, v23, v24, v25);
                    let v30: Rc<str> = Rc::<str>::from((v27).to_string());
                    let v31: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" cells="); } LIT.with(|lit| lit.clone()) }, v30));
                    let v32: Rc<str> = Rc::<str>::from((v28).to_string());
                    let v33: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" spilled="); } LIT.with(|lit| lit.clone()) }, v32));
                    let v34: Rc<str> = Rc::<str>::from(format!("{}{}", v31, v33));
                    let v35: Rc<str> = Rc::<str>::from((v29).to_string());
                    let v36: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" posts="); } LIT.with(|lit| lit.clone()) }, v35));
                    let v37: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v36));
                    let mut v38: Rc<str> = Rc::<str>::from(format!("{}{}", v26.clone(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" class="); } LIT.with(|lit| lit.clone()) }));
                    let v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\\"); } LIT.with(|lit| lit.clone()) };
                    let v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
                    let v41: Rc<str> = Rc::<str>::from(v26.replace(&*v39, &*v40));
                    let v42: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) }, v41));
                    let v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/generated/"); } LIT.with(|lit| lit.clone()) };
                    let v44: bool = v42.contains(&*v43);
                    let v57: US3 = if v44 {
                        US3::US3_Generated
                    } else {
                        let v46: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/state/"); } LIT.with(|lit| lit.clone()) };
                        let v47: bool = v42.contains(&*v46);
                        let v50: bool = if v47 {
                            true
                        } else {
                            let v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/tmp/"); } LIT.with(|lit| lit.clone()) };
                            let v49: bool = v42.contains(&*v48);
                            v49
                        };
                        let v53: bool = if v50 {
                            true
                        } else {
                            let v51: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/results/"); } LIT.with(|lit| lit.clone()) };
                            let v52: bool = v42.contains(&*v51);
                            v52
                        };
                        if v53 {
                            US3::US3_Data
                        } else {
                            US3::US3_Hand
                        }
                    };
                    let v63: Rc<str> = match v57 {
                        US3::US3_Data => {
                            let v60: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
                            v60
                        }
                        US3::US3_Generated => {
                            let v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("generated"); } LIT.with(|lit| lit.clone()) };
                            v59
                        }
                        US3::US3_Hand => {
                            let v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("hand"); } LIT.with(|lit| lit.clone()) };
                            v58
                        }
                    };
                    let v64: Rc<str> = Rc::<str>::from(format!("{}{}", v38, v63));
                    let v65: Rc<str> = Rc::<str>::from(format!("{}{}", v64, v37));
                    Rc::new(UH0::UH0_Cons(v65, v2))
                } else {
                    v2
                };
                (v1, v2) = (v4, v67);
                continue;
            }
            UH0::UH0_Nil => {
                return v2;
            }
        }
    }
}
fn method12(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH0> = v3;
            let mut v4: Rc<UH0> = method12(v3, v1);
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" class=data "); } LIT.with(|lit| lit.clone()) };
            let mut v6: bool = v2.contains(&*v5);
            if v6 {
                Rc::new(UH0::UH0_Cons(v2, v4))
            } else {
                v4
            }
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method13(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH0> = v3;
            let mut v4: Rc<UH1> = method13(v3, v1);
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
            let mut v6: Rc<UH0> = split_list_0(v5, v2.clone());
            let v7: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v8: Rc<UH0> = method1(v6, v7);
            let (mut v60, mut v61, mut v62, mut v63): (Rc<str>, i32, i32, i32) = match Rc::unwrap_or_clone(v8) {
                UH0::UH0_Cons(v9, v10) => {
                    let mut v9: Rc<str> = v9;
                    let mut v10: Rc<UH0> = v10;
                    match Rc::unwrap_or_clone(v10) {
                        UH0::UH0_Cons(v11, v12) => {
                            let mut v11: Rc<str> = v11;
                            let v12: Rc<UH0> = v12;
                            match Rc::unwrap_or_clone(v12) {
                                UH0::UH0_Cons(v13, v14) => {
                                    let v13: Rc<str> = v13;
                                    let v14: Rc<UH0> = v14;
                                    let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("="); } LIT.with(|lit| lit.clone()) };
                                    let v16: Rc<UH0> = split_list_0(v15.clone(), v13);
                                    let v27: i32 = match Rc::unwrap_or_clone(v16) {
                                        UH0::UH0_Cons(v17, v18) => {
                                            let v17: Rc<str> = v17;
                                            let v18: Rc<UH0> = v18;
                                            match Rc::unwrap_or_clone(v18) {
                                                UH0::UH0_Cons(v19, v20) => {
                                                    let v19: Rc<str> = v19;
                                                    let v20: Rc<UH0> = v20;
                                                    match Rc::unwrap_or_clone(v20) {
                                                        UH0::UH0_Nil => {
                                                            let v21: US2 = count_of_text_10(v19);
                                                            match v21 {
                                                                US2::US2_None => {
                                                                    0i32
                                                                }
                                                                US2::US2_Some(v22) => {
                                                                    let mut v22: i32 = v22;
                                                                    v22
                                                                }
                                                            }
                                                        }
                                                        _ => {
                                                            0i32
                                                        }
                                                    }
                                                }
                                                _ => {
                                                    0i32
                                                }
                                            }
                                        }
                                        _ => {
                                            0i32
                                        }
                                    };
                                    let v28: Rc<UH0> = split_list_0(v15.clone(), v11);
                                    let v39: i32 = match Rc::unwrap_or_clone(v28) {
                                        UH0::UH0_Cons(v29, v30) => {
                                            let v29: Rc<str> = v29;
                                            let v30: Rc<UH0> = v30;
                                            match Rc::unwrap_or_clone(v30) {
                                                UH0::UH0_Cons(v31, v32) => {
                                                    let v31: Rc<str> = v31;
                                                    let v32: Rc<UH0> = v32;
                                                    match Rc::unwrap_or_clone(v32) {
                                                        UH0::UH0_Nil => {
                                                            let v33: US2 = count_of_text_10(v31);
                                                            match v33 {
                                                                US2::US2_None => {
                                                                    0i32
                                                                }
                                                                US2::US2_Some(v34) => {
                                                                    let v34: i32 = v34;
                                                                    v34
                                                                }
                                                            }
                                                        }
                                                        _ => {
                                                            0i32
                                                        }
                                                    }
                                                }
                                                _ => {
                                                    0i32
                                                }
                                            }
                                        }
                                        _ => {
                                            0i32
                                        }
                                    };
                                    let v40: Rc<UH0> = split_list_0(v15, v9);
                                    let v51: i32 = match Rc::unwrap_or_clone(v40) {
                                        UH0::UH0_Cons(v41, v42) => {
                                            let v41: Rc<str> = v41;
                                            let v42: Rc<UH0> = v42;
                                            match Rc::unwrap_or_clone(v42) {
                                                UH0::UH0_Cons(v43, v44) => {
                                                    let v43: Rc<str> = v43;
                                                    let v44: Rc<UH0> = v44;
                                                    match Rc::unwrap_or_clone(v44) {
                                                        UH0::UH0_Nil => {
                                                            let v45: US2 = count_of_text_10(v43);
                                                            match v45 {
                                                                US2::US2_None => {
                                                                    0i32
                                                                }
                                                                US2::US2_Some(v46) => {
                                                                    let v46: i32 = v46;
                                                                    v46
                                                                }
                                                            }
                                                        }
                                                        _ => {
                                                            0i32
                                                        }
                                                    }
                                                }
                                                _ => {
                                                    0i32
                                                }
                                            }
                                        }
                                        _ => {
                                            0i32
                                        }
                                    };
                                    (v2, v27, v39, v51)
                                }
                                _ => {
                                    (v2, 0i32, 0i32, 0i32)
                                }
                            }
                        }
                        _ => {
                            (v2, 0i32, 0i32, 0i32)
                        }
                    }
                }
                _ => {
                    (v2, 0i32, 0i32, 0i32)
                }
            };
            Rc::new(UH1::UH1_Cons(v60, v61, v62, v63, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method14(mut v0: Rc<UH1>, mut v1: Rc<str>, mut v2: i32, mut v3: i32, mut v4: i32, mut v5: i32, mut v6: i32) -> (Rc<str>, i32, i32, i32, i32, i32) {
    let (mut v31, mut v32, mut v33, mut v34, mut v35, mut v36): (Rc<str>, i32, i32, i32, i32, i32) = match &*v0 {
        UH1::UH1_Cons(v7, v8, v9, v10, v11) => {
            let v7: Rc<str> = v7.clone();
            let v8: i32 = *v8;
            let mut v9: i32 = *v9;
            let mut v10: i32 = *v10;
            let mut v11: Rc<UH1> = v11.clone();
            let v12: i32 = v4.wrapping_add(v8);
            let v13: i32 = v5.wrapping_add(v9);
            let v14: i32 = v6.wrapping_add(v10);
            let v15: i32 = v2.wrapping_add(1i32);
            let v16: bool = v9 == 0i32;
            let v17: i32 = if v16 {
                1i32
            } else {
                0i32
            };
            let v18: i32 = v3.wrapping_add(v17);
            method14(v11, v1, v15, v18, v12, v13, v14)
        }
        _ => {
            let (mut v25, mut v26, mut v27, mut v28, mut v29, mut v30): (Rc<str>, i32, i32, i32, i32, i32) = match Rc::unwrap_or_clone(v0) {
                UH1::UH1_Nil => {
                    (v1, v2, v3, v4, v5, v6)
                }
                _ => unreachable!(),
            };
            (v25, v26, v27, v28, v29, v30)
        }
    };
    (v31, v32, v33, v34, v35, v36)
}
fn method15(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH0> = v3;
            let mut v4: Rc<UH0> = method15(v3, v1);
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" class=generated "); } LIT.with(|lit| lit.clone()) };
            let mut v6: bool = v2.contains(&*v5);
            if v6 {
                Rc::new(UH0::UH0_Cons(v2, v4))
            } else {
                v4
            }
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method16(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH0> = v3;
            let mut v4: Rc<UH0> = method16(v3, v1);
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" class=hand "); } LIT.with(|lit| lit.clone()) };
            let mut v6: bool = v2.contains(&*v5);
            if v6 {
                Rc::new(UH0::UH0_Cons(v2, v4))
            } else {
                v4
            }
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method17(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3;
                let mut v4: Rc<UH0> = v4;
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
fn method18(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH0> = v3;
            let mut v4: Rc<UH0> = method18(v3, v1);
            Rc::new(UH0::UH0_Cons(v2, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>| -> Rc<str> {
        let v2: bool = &*v1 == "";
        let mut v6: Rc<UH0> = if v2 {
            { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
        } else {
            let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            split_list_0(v4, v1)
        };
        let v7: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v8: Rc<UH0> = method3(v0, v6, v7);
        let mut v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v10: Rc<UH0> = method1(v8, v9);
        let mut v11: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v12: Rc<UH0> = method12(v10.clone(), v11);
        let v13: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let v14: Rc<UH1> = method13(v12, v13);
        let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
        let v16: i32 = 0i32;
        let v17: i32 = 0i32;
        let v18: i32 = 0i32;
        let v19: i32 = 0i32;
        let v20: i32 = 0i32;
        let (mut v21, mut v22, mut v23, mut v24, mut v25, mut v26): (Rc<str>, i32, i32, i32, i32, i32) = method14(v14, v15, v16, v17, v18, v19, v20);
        let v27: Rc<str> = Rc::<str>::from(format!("{}{}", v21, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) }));
        let v28: Rc<str> = Rc::<str>::from((v22).to_string());
        let v29: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("files "); } LIT.with(|lit| lit.clone()) }, v28));
        let v30: Rc<str> = Rc::<str>::from((v23).to_string());
        let v31: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("files with every cell in one post "); } LIT.with(|lit| lit.clone()) }, v30));
        let v32: Rc<str> = Rc::<str>::from((v24).to_string());
        let v33: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cells "); } LIT.with(|lit| lit.clone()) }, v32));
        let v34: Rc<str> = Rc::<str>::from((v25).to_string());
        let v35: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cells over one post "); } LIT.with(|lit| lit.clone()) }, v34));
        let v36: Rc<str> = Rc::<str>::from((v26).to_string());
        let v37: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts "); } LIT.with(|lit| lit.clone()) }, v36));
        let mut v38: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
        v38.borrow_mut().push(v29);
        v38.borrow_mut().push(v31);
        v38.borrow_mut().push(v33);
        v38.borrow_mut().push(v35);
        v38.borrow_mut().push(v37);
        let v39: Rc<Vec<Rc<str>>> = Rc::new(v38.borrow().clone());
        let v40: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v39).as_ref().clone()));
        let v41: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", "); } LIT.with(|lit| lit.clone()) };
        let v42: Rc<str> = Rc::<str>::from((*v40.borrow()).join(&*v41));
        let v43: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v42));
        let v44: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v45: Rc<UH0> = method15(v10.clone(), v44);
        let v46: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let v47: Rc<UH1> = method13(v45, v46);
        let v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("generated"); } LIT.with(|lit| lit.clone()) };
        let v49: i32 = 0i32;
        let v50: i32 = 0i32;
        let v51: i32 = 0i32;
        let v52: i32 = 0i32;
        let v53: i32 = 0i32;
        let (mut v54, mut v55, mut v56, mut v57, mut v58, mut v59): (Rc<str>, i32, i32, i32, i32, i32) = method14(v47, v48, v49, v50, v51, v52, v53);
        let v60: Rc<str> = Rc::<str>::from(format!("{}{}", v54, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) }));
        let v61: Rc<str> = Rc::<str>::from((v55).to_string());
        let v62: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("files "); } LIT.with(|lit| lit.clone()) }, v61));
        let v63: Rc<str> = Rc::<str>::from((v56).to_string());
        let v64: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("files with every cell in one post "); } LIT.with(|lit| lit.clone()) }, v63));
        let v65: Rc<str> = Rc::<str>::from((v57).to_string());
        let v66: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cells "); } LIT.with(|lit| lit.clone()) }, v65));
        let v67: Rc<str> = Rc::<str>::from((v58).to_string());
        let v68: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cells over one post "); } LIT.with(|lit| lit.clone()) }, v67));
        let v69: Rc<str> = Rc::<str>::from((v59).to_string());
        let v70: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts "); } LIT.with(|lit| lit.clone()) }, v69));
        let mut v71: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
        v71.borrow_mut().push(v62);
        v71.borrow_mut().push(v64);
        v71.borrow_mut().push(v66);
        v71.borrow_mut().push(v68);
        v71.borrow_mut().push(v70);
        let v72: Rc<Vec<Rc<str>>> = Rc::new(v71.borrow().clone());
        let v73: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v72).as_ref().clone()));
        let v74: Rc<str> = Rc::<str>::from((*v73.borrow()).join(&*v41));
        let v75: Rc<str> = Rc::<str>::from(format!("{}{}", v60, v74));
        let v76: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v77: Rc<UH0> = method16(v10.clone(), v76);
        let v78: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let v79: Rc<UH1> = method13(v77, v78);
        let v80: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("hand"); } LIT.with(|lit| lit.clone()) };
        let v81: i32 = 0i32;
        let v82: i32 = 0i32;
        let v83: i32 = 0i32;
        let v84: i32 = 0i32;
        let v85: i32 = 0i32;
        let (mut v86, mut v87, mut v88, mut v89, mut v90, mut v91): (Rc<str>, i32, i32, i32, i32, i32) = method14(v79, v80, v81, v82, v83, v84, v85);
        let v92: Rc<str> = Rc::<str>::from(format!("{}{}", v86, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) }));
        let v93: Rc<str> = Rc::<str>::from((v87).to_string());
        let v94: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("files "); } LIT.with(|lit| lit.clone()) }, v93));
        let v95: Rc<str> = Rc::<str>::from((v88).to_string());
        let v96: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("files with every cell in one post "); } LIT.with(|lit| lit.clone()) }, v95));
        let v97: Rc<str> = Rc::<str>::from((v89).to_string());
        let v98: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cells "); } LIT.with(|lit| lit.clone()) }, v97));
        let v99: Rc<str> = Rc::<str>::from((v90).to_string());
        let v100: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cells over one post "); } LIT.with(|lit| lit.clone()) }, v99));
        let v101: Rc<str> = Rc::<str>::from((v91).to_string());
        let v102: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts "); } LIT.with(|lit| lit.clone()) }, v101));
        let mut v103: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
        v103.borrow_mut().push(v94);
        v103.borrow_mut().push(v96);
        v103.borrow_mut().push(v98);
        v103.borrow_mut().push(v100);
        v103.borrow_mut().push(v102);
        let v104: Rc<Vec<Rc<str>>> = Rc::new(v103.borrow().clone());
        let v105: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v104).as_ref().clone()));
        let v106: Rc<str> = Rc::<str>::from((*v105.borrow()).join(&*v41));
        let v107: Rc<str> = Rc::<str>::from(format!("{}{}", v92, v106));
        let v108: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
        let v109: i32 = 0i32;
        let v110: i32 = method17(v108.clone(), v10.clone(), v109);
        let v111: Rc<Vec<Rc<str>>> = Rc::new(v108.borrow().clone());
        let v112: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v111).as_ref().clone()));
        let v113: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
        let v114: Rc<str> = Rc::<str>::from((*v112.borrow()).join(&*v113));
        let v115: bool = &*v114 == "";
        let v118: Rc<UH0> = if v115 {
            { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
        } else {
            split_list_0(v113.clone(), v114)
        };
        let v119: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let v120: Rc<UH1> = method13(v118, v119);
        let v121: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("total"); } LIT.with(|lit| lit.clone()) };
        let v122: i32 = 0i32;
        let v123: i32 = 0i32;
        let v124: i32 = 0i32;
        let v125: i32 = 0i32;
        let v126: i32 = 0i32;
        let (mut v127, mut v128, mut v129, mut v130, mut v131, mut v132): (Rc<str>, i32, i32, i32, i32, i32) = method14(v120, v121, v122, v123, v124, v125, v126);
        let v133: Rc<str> = Rc::<str>::from(format!("{}{}", v127, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) }));
        let v134: Rc<str> = Rc::<str>::from((v128).to_string());
        let v135: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("files "); } LIT.with(|lit| lit.clone()) }, v134));
        let v136: Rc<str> = Rc::<str>::from((v129).to_string());
        let v137: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("files with every cell in one post "); } LIT.with(|lit| lit.clone()) }, v136));
        let v138: Rc<str> = Rc::<str>::from((v130).to_string());
        let v139: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cells "); } LIT.with(|lit| lit.clone()) }, v138));
        let v140: Rc<str> = Rc::<str>::from((v131).to_string());
        let v141: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cells over one post "); } LIT.with(|lit| lit.clone()) }, v140));
        let v142: Rc<str> = Rc::<str>::from((v132).to_string());
        let v143: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts "); } LIT.with(|lit| lit.clone()) }, v142));
        let mut v144: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
        v144.borrow_mut().push(v135);
        v144.borrow_mut().push(v137);
        v144.borrow_mut().push(v139);
        v144.borrow_mut().push(v141);
        v144.borrow_mut().push(v143);
        let v145: Rc<Vec<Rc<str>>> = Rc::new(v144.borrow().clone());
        let v146: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v145).as_ref().clone()));
        let v147: Rc<str> = Rc::<str>::from((*v146.borrow()).join(&*v41));
        let v148: Rc<str> = Rc::<str>::from(format!("{}{}", v133, v147));
        let v149: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v150: Rc<UH0> = Rc::new(UH0::UH0_Cons(v148, v149));
        let v151: Rc<UH0> = Rc::new(UH0::UH0_Cons(v43, v150));
        let v152: Rc<UH0> = Rc::new(UH0::UH0_Cons(v75, v151));
        let v153: Rc<UH0> = Rc::new(UH0::UH0_Cons(v107, v152));
        let v154: Rc<UH0> = method18(v10, v153);
        let v155: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
        let v156: i32 = 0i32;
        let v157: i32 = method17(v155.clone(), v154, v156);
        let v158: Rc<Vec<Rc<str>>> = Rc::new(v155.borrow().clone());
        let v159: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v158).as_ref().clone()));
        let v160: Rc<str> = Rc::<str>::from((*v159.borrow()).join(&*v113));
        v160
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_census_files(v0: &str, v1: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1))
}
pub type SpiralShape_652accfc6a8d = Mut0;
