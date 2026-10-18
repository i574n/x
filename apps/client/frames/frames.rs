#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, i32, Rc<UH1>),
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(i32, Rc<UH2>),
}
fn method2(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
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
fn split_on_3(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let mut v2: i32 = v1.find(&*v0).map(|i| i as i32).unwrap_or(-1);
    let mut v3: bool = v2 < 0i32;
    if v3 {
        let mut v4: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1.clone(), v4.clone()))
    } else {
        let mut v6: Rc<str> = Rc::<str>::from(&(v1)[((0i32) as usize)..(((0i32) + (v2)) as usize)]);
        let mut v7: i32 = v2.wrapping_add(1i32);
        let mut v8: i32 = (v1.clone().len() as i32);
        let mut v9: i32 = v8.wrapping_sub(v2);
        let mut v10: i32 = v9.wrapping_sub(1i32);
        let mut v11: Rc<str> = Rc::<str>::from(&(v1)[((v7) as usize)..(((v7) + (v10)) as usize)]);
        let mut v12: Rc<UH0> = split_on_3(v0.clone(), v11.clone());
        Rc::new(UH0::UH0_Cons(v6.clone(), v12.clone()))
    }
}
fn method6(mut v0: Rc<UH0>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method6(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn with_blanks_7(mut v0: i32, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v2: bool = v0 <= 0i32;
        if v2 {
            return v1.clone();
        } else {
            let mut v3: i32 = v0.wrapping_sub(1i32);
            let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v5: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v1.clone()));
            (v0, v1) = (v3, v5.clone());
            continue;
        }
    }
}
fn step_5(mut v0: Rc<UH0>, mut v1: Rc<UH0>, mut v2: i32, mut v3: bool, mut v4: Rc<str>) -> (Rc<UH0>, Rc<UH0>, i32, bool) {
    let mut v5: bool = v4.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v33, mut v34, mut v35, mut v36): (Rc<UH0>, Rc<UH0>, i32, bool) = if v5 {
        let mut v6: i32 = v2.wrapping_add(1i32);
        (v0.clone(), v1.clone(), v6, v3)
    } else {
        let mut v7: bool = v2 > 0i32;
        let mut v8: bool = v7 && v3;
        let mut v15: bool = if v8 {
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
            let mut v10: bool = v4.starts_with(&*v9);
            let mut v13: bool = if v10 {
                true
            } else {
                let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
                let mut v12: bool = v4.starts_with(&*v11);
                v12
            };
            let mut v14: bool = v13 == false;
            v14
        } else {
            false
        };
        let (mut v29, mut v30, mut v31, mut v32): (Rc<UH0>, Rc<UH0>, i32, bool) = if v15 {
            let mut v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v17: Rc<UH0> = method2(v1.clone(), v16.clone());
            let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v19, mut v20): (Rc<str>, Rc<str>) = method6(v17.clone(), v18.clone());
            let mut v21: Rc<str> = Rc::<str>::from((&*v19).trim_end());
            let mut v22: i32 = v2.wrapping_sub(1i32);
            let mut v23: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v24: Rc<UH0> = with_blanks_7(v22, v23.clone());
            let mut v25: Rc<UH0> = Rc::new(UH0::UH0_Cons(v21.clone(), v0.clone()));
            let mut v26: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v24.clone()));
            (v25.clone(), v26.clone(), 0i32, true)
        } else {
            let mut v27: Rc<UH0> = with_blanks_7(v2, v1.clone());
            let mut v28: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v27.clone()));
            (v0.clone(), v28.clone(), 0i32, true)
        };
        (v29.clone(), v30.clone(), v31, v32)
    };
    (v33.clone(), v34.clone(), v35, v36)
}
fn method4(mut v0: Rc<UH0>, mut v1: Rc<UH0>, mut v2: Rc<UH0>, mut v3: i32, mut v4: bool) -> (Rc<UH0>, Rc<UH0>, i32, bool) {
    let (mut v19, mut v20, mut v21, mut v22): (Rc<UH0>, Rc<UH0>, i32, bool) = match &*v0 {
        UH0::UH0_Cons(v5, v6) => {
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH0> = v6.clone();
            let (mut v7, mut v8, mut v9, mut v10): (Rc<UH0>, Rc<UH0>, i32, bool) = step_5(v1.clone(), v2.clone(), v3, v4, v5.clone());
            method4(v6.clone(), v7.clone(), v8.clone(), v9, v10)
        }
        _ => {
            let (mut v15, mut v16, mut v17, mut v18): (Rc<UH0>, Rc<UH0>, i32, bool) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1.clone(), v2.clone(), v3, v4)
                }
                _ => unreachable!(),
            };
            (v15.clone(), v16.clone(), v17, v18)
        }
    };
    (v19.clone(), v20.clone(), v21, v22)
}
fn file_cells_1(mut v0: Rc<str>) -> Rc<UH0> {
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let mut v3: Rc<str> = Rc::<str>::from(v0.replace(&*v1, &*v2));
    let mut v4: bool = v3.ends_with(&*v2);
    let mut v8: Rc<str> = if v4 {
        let mut v5: i32 = (&*v3).len() as i32;
        let mut v6: i32 = v5.wrapping_sub(1i32);
        let mut v7: Rc<str> = Rc::<str>::from(&(&*v3)[0i32 as usize..v6 as usize]);
        v7.clone()
    } else {
        v3.clone()
    };
    let mut v9: bool = v8.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    if v9 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v11: Rc<UH0> = split_on_3(v2.clone(), v8.clone());
        let mut v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v13: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v14: i32 = 0i32;
        let mut v15: bool = false;
        let (mut v16, mut v17, mut v18, mut v19): (Rc<UH0>, Rc<UH0>, i32, bool) = method4(v11.clone(), v12.clone(), v13.clone(), v14, v15);
        let mut v20: Rc<UH0> = with_blanks_7(v18, v17.clone());
        let mut v21: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v22: Rc<UH0> = method2(v20.clone(), v21.clone());
        let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let (mut v24, mut v25): (Rc<str>, Rc<str>) = method6(v22.clone(), v23.clone());
        let mut v26: Rc<str> = Rc::<str>::from((&*v24).trim_end());
        let mut v27: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v28: Rc<UH0> = Rc::new(UH0::UH0_Cons(v26.clone(), v27.clone()));
        method2(v16.clone(), v28.clone())
    }
}
fn numbered_10(mut v0: Rc<str>, mut v1: i32, mut v2: i32, mut v3: Rc<UH0>, mut v4: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v3 {
            UH0::UH0_Cons(v7, v8) => {
                let mut v7: Rc<str> = v7.clone();
                let mut v8: Rc<UH0> = v8.clone();
                let mut v9: i32 = v2.wrapping_add(1i32);
                let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
                let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v10));
                let mut v12: Rc<str> = Rc::<str>::from(format!("{:?}", v2));
                let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v12));
                let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
                let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v14));
                let mut v16: Rc<str> = Rc::<str>::from(format!("{:?}", v1));
                let mut v17: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v16));
                let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v18));
                let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v7));
                let mut v21: Rc<str> = Rc::<str>::from((&*v20).trim_end());
                let mut v22: Rc<UH0> = Rc::new(UH0::UH0_Cons(v21.clone(), v4.clone()));
                (v0, v1, v2, v3, v4) = (v0.clone(), v1, v9, v8.clone(), v22.clone());
                continue;
            }
            UH0::UH0_Nil => {
                let mut v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                return method2(v4.clone(), v5.clone());
            }
        }
    }
}
fn method13(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: i32 = *v3;
            let mut v4: Rc<UH1> = v4.clone();
            let mut v5: Rc<UH1> = method13(v4.clone(), v1.clone());
            Rc::new(UH1::UH1_Cons(v2.clone(), v3, v5.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn from_14(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = Rc::<str>::from(v5.as_str().unwrap_or(""));
            let mut v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v6.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v7.clone());
            continue;
        }
    }
}
fn from_16(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH2>) -> Rc<UH2> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: i32 = v5.as_i64().unwrap_or(0) as i32;
            let mut v7: Rc<UH2> = Rc::new(UH2::UH2_Cons(v6, v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v7.clone());
            continue;
        }
    }
}
fn method17(mut v0: Rc<UH2>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH2::UH2_Cons(v2, v3) => {
                let mut v2: i32 = *v2;
                let mut v3: Rc<UH2> = v3.clone();
                let mut v4: bool = v2 <= 4351i32;
                let mut v8: bool = if v4 {
                    true
                } else {
                    let mut v5: bool = v2 >= 8192i32;
                    if v5 {
                        let mut v6: bool = v2 <= 8205i32;
                        v6
                    } else {
                        false
                    }
                };
                let mut v12: bool = if v8 {
                    true
                } else {
                    let mut v9: bool = v2 >= 8208i32;
                    if v9 {
                        let mut v10: bool = v2 <= 8223i32;
                        v10
                    } else {
                        false
                    }
                };
                let mut v16: bool = if v12 {
                    true
                } else {
                    let mut v13: bool = v2 >= 8242i32;
                    if v13 {
                        let mut v14: bool = v2 <= 8247i32;
                        v14
                    } else {
                        false
                    }
                };
                let mut v17: i32 = if v16 {
                    1i32
                } else {
                    2i32
                };
                let mut v18: i32 = v1.wrapping_add(v17);
                (v0, v1) = (v3.clone(), v18);
                continue;
            }
            UH2::UH2_Nil => {
                return v1;
            }
        }
    }
}
fn method15(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH1> = method15(v3.clone(), v1.clone());
            let mut v5: serde_json::Value = serde_json::Value::from((&*v2).chars().map(|c| c as i64).collect::<Vec<_>>());
            let mut v6: i32 = v5.as_array().map_or(0, |a| a.len()) as i32;
            let mut v7: i32 = v6.wrapping_sub(1i32);
            let mut v8: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let mut v9: Rc<UH2> = from_16(v5.clone(), v7, v8.clone());
            let mut v10: i32 = 0i32;
            let mut v11: i32 = method17(v9.clone(), v10);
            Rc::new(UH1::UH1_Cons(v2.clone(), v11, v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn walk_12(mut v0: Rc<str>, mut v1: serde_json::Value, mut v2: i32, mut v3: i32, mut v4: Rc<UH1>) -> Rc<UH1> {
    loop {
        let mut v5: i32 = v1.as_array().map_or(0, |a| a.len()) as i32;
        let mut v6: bool = v2 >= v5;
        if v6 {
            let mut v7: i32 = (&*v0).len() as i32;
            let mut v8: Rc<str> = Rc::<str>::from(&(&*v0)[v3 as usize..v7 as usize]);
            let mut v9: serde_json::Value = serde_json::Value::from(unicode_segmentation::UnicodeSegmentation::graphemes(&*v8, true).collect::<Vec<_>>());
            let mut v10: i32 = v9.as_array().map_or(0, |a| a.len()) as i32;
            let mut v11: i32 = v10.wrapping_sub(1i32);
            let mut v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v13: Rc<UH0> = from_14(v9.clone(), v11, v12.clone());
            let mut v14: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v15: Rc<UH1> = method15(v13.clone(), v14.clone());
            return method13(v4.clone(), v15.clone());
        } else {
            let mut v17: serde_json::Value = v1.get(v2 as usize).cloned().unwrap_or_default();
            let mut v18: serde_json::Value = v17.get(0i32 as usize).cloned().unwrap_or_default();
            let mut v19: i32 = v18.as_i64().unwrap_or(0) as i32;
            let mut v20: serde_json::Value = v17.get(1i32 as usize).cloned().unwrap_or_default();
            let mut v21: i32 = v20.as_i64().unwrap_or(0) as i32;
            let mut v22: Rc<str> = Rc::<str>::from(&(&*v0)[v19 as usize..v21 as usize]);
            let mut v23: serde_json::Value = v17.get(2i32 as usize).cloned().unwrap_or_default();
            let mut v24: Rc<str> = Rc::<str>::from(v23.as_str().unwrap_or(""));
            let mut v25: Rc<str> = Rc::<str>::from((&*v24).to_lowercase());
            let mut v26: bool = include_str!("tlds.txt").lines().any(|l| l == &*v25);
            let mut v46: bool = if v26 {
                let mut v27: Rc<str> = Rc::<str>::from((&*v22).to_lowercase());
                let mut v28: bool = v27.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("t.co"); } LIT.with(|lit| lit.clone()) };
                let mut v32: bool = if v28 {
                    true
                } else {
                    let mut v29: i32 = (&*v25).chars().count() as i32;
                    let mut v30: bool = v29 == 2i32;
                    let mut v31: bool = v30 != true;
                    v31
                };
                if v32 {
                    true
                } else {
                    let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("."); } LIT.with(|lit| lit.clone()) };
                    let mut v34: Rc<UH0> = split_on_3(v33.clone(), v22.clone());
                    let mut v35: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let mut v36: Rc<UH0> = method2(v34.clone(), v35.clone());
                    let mut v43: i32 = match &*v36 {
                        UH0::UH0_Cons(v37, v38) => {
                            let mut v37: Rc<str> = v37.clone();
                            let mut v38: Rc<UH0> = v38.clone();
                            match &*v38 {
                                UH0::UH0_Cons(v39, v40) => {
                                    let mut v39: Rc<str> = v39.clone();
                                    let mut v40: Rc<UH0> = v40.clone();
                                    let mut v41: i32 = (&*v39).chars().count() as i32;
                                    v41
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
                    let mut v44: bool = v43 > 2i32;
                    v44
                }
            } else {
                false
            };
            if v46 {
                let mut v47: i32 = v2.wrapping_add(1i32);
                let mut v48: Rc<str> = Rc::<str>::from(&(&*v0)[v3 as usize..v19 as usize]);
                let mut v49: serde_json::Value = serde_json::Value::from(unicode_segmentation::UnicodeSegmentation::graphemes(&*v48, true).collect::<Vec<_>>());
                let mut v50: i32 = v49.as_array().map_or(0, |a| a.len()) as i32;
                let mut v51: i32 = v50.wrapping_sub(1i32);
                let mut v52: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let mut v53: Rc<UH0> = from_14(v49.clone(), v51, v52.clone());
                let mut v54: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                let mut v55: Rc<UH1> = method15(v53.clone(), v54.clone());
                let mut v56: i32 = 23i32;
                let mut v57: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                let mut v58: Rc<UH1> = Rc::new(UH1::UH1_Cons(v22.clone(), v56, v57.clone()));
                let mut v59: Rc<UH1> = method13(v55.clone(), v58.clone());
                let mut v60: Rc<UH1> = method13(v4.clone(), v59.clone());
                (v0, v1, v2, v3, v4) = (v0.clone(), v1.clone(), v47, v21, v60.clone());
                continue;
            } else {
                let mut v62: i32 = v2.wrapping_add(1i32);
                (v0, v1, v2, v3, v4) = (v0.clone(), v1.clone(), v62, v3, v4.clone());
                continue;
            }
        }
    }
}
fn units_of_11(mut v0: Rc<str>) -> Rc<UH1> {
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("(?<![\\p{L}\\p{N}@\\-_./])(?:[A-Za-z0-9](?:[A-Za-z0-9\\-_]*[A-Za-z0-9])?\\.)+([A-Za-z]{2,63})(?![\\p{L}\\p{N}_\\-])"); } LIT.with(|lit| lit.clone()) };
    let mut v2: fancy_regex::Regex = fancy_regex::Regex::new(&*v1).unwrap();
    let mut v3: serde_json::Value = serde_json::Value::from((v2).captures_iter(&*v0).filter_map(|c| c.ok()).map(|c| serde_json::json!([c.get(0).map_or(0, |m| m.start()), c.get(0).map_or(0, |m| m.end()), c.get(1).map_or("", |m| m.as_str())])).collect::<Vec<_>>());
    let mut v4: i32 = 0i32;
    let mut v5: i32 = 0i32;
    let mut v6: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    walk_12(v0.clone(), v3.clone(), v4, v5, v6.clone())
}
fn closure1() -> Rc<dyn Fn(Rc<str>, i32) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32) -> bool> = Rc::new(move |mut v0: Rc<str>, mut v1: i32| -> bool {
        let mut v2: bool = (&*v0).trim().is_empty();
        let mut v3: bool = v2 == false;
        v3
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method22(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v2, v3, v4) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: i32 = *v3;
                let mut v4: Rc<UH1> = v4.clone();
                let mut v5: Rc<UH1> = Rc::new(UH1::UH1_Cons(v2.clone(), v3, v1.clone()));
                (v0, v1) = (v4.clone(), v5.clone());
                continue;
            }
            UH1::UH1_Nil => {
                return v1.clone();
            }
        }
    }
}
fn taken_while_21(mut v0: Rc<dyn Fn(Rc<str>, i32) -> bool>, mut v1: Rc<UH1>, mut v2: Rc<UH1>) -> (Rc<UH1>, Rc<UH1>) {
    loop {
        match &*v1 {
            UH1::UH1_Cons(v3, v4, v5) => {
                let mut v3: Rc<str> = v3.clone();
                let mut v4: i32 = *v4;
                let mut v5: Rc<UH1> = v5.clone();
                let mut v6: bool = v0(v3.clone(), v4);
                if v6 {
                    let mut v7: Rc<UH1> = Rc::new(UH1::UH1_Cons(v3.clone(), v4, v2.clone()));
                    (v0, v1, v2) = (v0.clone(), v5.clone(), v7.clone());
                    continue;
                } else {
                    let mut v10: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let mut v11: Rc<UH1> = method22(v2.clone(), v10.clone());
                    return (v11.clone(), v1.clone());
                }
            }
            _ => {
                let mut v14: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                let mut v15: Rc<UH1> = method22(v2.clone(), v14.clone());
                return (v15.clone(), v1.clone());
            }
        }
    }
}
fn closure2() -> Rc<dyn Fn(Rc<str>, i32) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32) -> bool> = Rc::new(move |mut v0: Rc<str>, mut v1: i32| -> bool {
        let mut v2: bool = (&*v0).trim().is_empty();
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method23(mut v0: Rc<UH1>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v2, v3, v4) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: i32 = *v3;
                let mut v4: Rc<UH1> = v4.clone();
                let mut v5: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v4.clone(), v5);
                continue;
            }
            UH1::UH1_Nil => {
                return v1;
            }
        }
    }
}
fn cut_20(mut v0: Rc<UH1>) -> (Rc<UH1>, Rc<UH1>) {
    let mut v1: Rc<dyn Fn(Rc<str>, i32) -> bool> = closure1();
    let mut v2: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let (mut v3, mut v4): (Rc<UH1>, Rc<UH1>) = taken_while_21(v1.clone(), v0.clone(), v2.clone());
    let mut v5: Rc<dyn Fn(Rc<str>, i32) -> bool> = closure2();
    let mut v6: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let (mut v7, mut v8): (Rc<UH1>, Rc<UH1>) = taken_while_21(v5.clone(), v4.clone(), v6.clone());
    let mut v9: bool = match &*v8 {
        UH1::UH1_Nil => {
            false
        }
        _ => {
            true
        }
    };
    let mut v16: bool = if v9 {
        let mut v10: i32 = 0i32;
        let mut v11: i32 = method23(v3.clone(), v10);
        let mut v12: i32 = 0i32;
        let mut v13: i32 = method23(v7.clone(), v12);
        let mut v14: i32 = v11.wrapping_add(v13);
        let mut v15: bool = v14 <= 60i32;
        v15
    } else {
        false
    };
    if v16 {
        let mut v17: Rc<UH1> = method13(v3.clone(), v7.clone());
        (v17.clone(), v8.clone())
    } else {
        let mut v18: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let (mut v19, mut v20): (Rc<UH1>, Rc<UH1>) = taken_while_21(v5.clone(), v0.clone(), v18.clone());
        let mut v21: bool = match &*v20 {
            UH1::UH1_Nil => {
                false
            }
            _ => {
                true
            }
        };
        if v21 {
            (v19.clone(), v20.clone())
        } else {
            let mut v22: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            (v22.clone(), v0.clone())
        }
    }
}
fn method24(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: i32 = *v3;
            let mut v4: Rc<UH1> = v4.clone();
            let mut v5: Rc<UH0> = method24(v4.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v2.clone(), v5.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method25(mut v0: Rc<UH0>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method25(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn chunk_19(mut v0: i32, mut v1: Rc<UH1>, mut v2: Rc<UH1>, mut v3: i32, mut v4: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v1 {
            UH1::UH1_Cons(v16, v17, v18) => {
                let mut v16: Rc<str> = v16.clone();
                let mut v17: i32 = *v17;
                let mut v18: Rc<UH1> = v18.clone();
                let mut v19: i32 = v3.wrapping_add(v17);
                let mut v20: bool = v19 > v0;
                let mut v22: bool = if v20 {
                    match &*v2 {
                        UH1::UH1_Nil => {
                            false
                        }
                        _ => {
                            true
                        }
                    }
                } else {
                    false
                };
                if v22 {
                    let (mut v23, mut v24): (Rc<UH1>, Rc<UH1>) = cut_20(v2.clone());
                    let mut v25: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let mut v26: Rc<UH1> = method22(v23.clone(), v25.clone());
                    let mut v27: Rc<UH1> = method13(v26.clone(), v1.clone());
                    let mut v28: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let mut v29: i32 = 0i32;
                    let mut v38: Rc<UH0> = match &*v24 {
                        UH1::UH1_Nil => {
                            v4.clone()
                        }
                        _ => {
                            let mut v30: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                            let mut v31: Rc<UH1> = method22(v24.clone(), v30.clone());
                            let mut v32: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                            let mut v33: Rc<UH0> = method24(v31.clone(), v32.clone());
                            let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                            let (mut v35, mut v36): (Rc<str>, Rc<str>) = method25(v33.clone(), v34.clone());
                            Rc::new(UH0::UH0_Cons(v35.clone(), v4.clone()))
                        }
                    };
                    (v0, v1, v2, v3, v4) = (v0, v27.clone(), v28.clone(), v29, v38.clone());
                    continue;
                } else {
                    let mut v40: Rc<UH1> = Rc::new(UH1::UH1_Cons(v16.clone(), v17, v2.clone()));
                    (v0, v1, v2, v3, v4) = (v0, v18.clone(), v40.clone(), v19, v4.clone());
                    continue;
                }
            }
            UH1::UH1_Nil => {
                let mut v13: Rc<UH0> = match &*v2 {
                    UH1::UH1_Nil => {
                        v4.clone()
                    }
                    _ => {
                        let mut v5: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                        let mut v6: Rc<UH1> = method22(v2.clone(), v5.clone());
                        let mut v7: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                        let mut v8: Rc<UH0> = method24(v6.clone(), v7.clone());
                        let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                        let (mut v10, mut v11): (Rc<str>, Rc<str>) = method25(v8.clone(), v9.clone());
                        Rc::new(UH0::UH0_Cons(v10.clone(), v4.clone()))
                    }
                };
                let mut v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                return method2(v13.clone(), v14.clone());
            }
        }
    }
}
fn method26(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
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
fn chunks_of_18(mut v0: Rc<str>, mut v1: Rc<UH1>, mut v2: i32) -> Rc<UH0> {
    loop {
        let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
        let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v3));
        let mut v5: Rc<str> = Rc::<str>::from(format!("{:?}", v2));
        let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v5));
        let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
        let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v7));
        let mut v9: Rc<str> = Rc::<str>::from(format!("{:?}", v2));
        let mut v10: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v9));
        let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
        let mut v12: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v11));
        let mut v13: serde_json::Value = serde_json::Value::from((&*v12).chars().map(|c| c as i64).collect::<Vec<_>>());
        let mut v14: i32 = v13.as_array().map_or(0, |a| a.len()) as i32;
        let mut v15: i32 = v14.wrapping_sub(1i32);
        let mut v16: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
        let mut v17: Rc<UH2> = from_16(v13.clone(), v15, v16.clone());
        let mut v18: i32 = 0i32;
        let mut v19: i32 = method17(v17.clone(), v18);
        let mut v20: i32 = 280i32.wrapping_sub(v19);
        let mut v21: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let mut v22: i32 = 0i32;
        let mut v23: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v24: Rc<UH0> = chunk_19(v20, v1.clone(), v21.clone(), v22, v23.clone());
        let mut v25: i32 = 0i32;
        let mut v26: i32 = method26(v24.clone(), v25);
        let mut v27: Rc<str> = Rc::<str>::from(format!("{:?}", v26));
        let mut v28: i32 = (&*v27).chars().count() as i32;
        let mut v29: Rc<str> = Rc::<str>::from(format!("{:?}", v2));
        let mut v30: i32 = (&*v29).chars().count() as i32;
        let mut v31: bool = v28 > v30;
        if v31 {
            (v0, v1, v2) = (v0.clone(), v1.clone(), v26);
            continue;
        } else {
            return v24.clone();
        }
    }
}
fn cell_posts_9(mut v0: i32, mut v1: Rc<str>) -> Rc<UH0> {
    let mut v2: Rc<str> = Rc::<str>::from(format!("{:?}", v0));
    let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("c"); } LIT.with(|lit| lit.clone()) };
    let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v2));
    let mut v5: Rc<str> = Rc::<str>::from(unicode_normalization::UnicodeNormalization::nfc(&*v1).collect::<String>());
    let mut v6: Rc<UH1> = units_of_11(v5.clone());
    let mut v7: i32 = 99i32;
    let mut v8: Rc<UH0> = chunks_of_18(v4.clone(), v6.clone(), v7);
    let mut v12: Rc<UH0> = match &*v8 {
        UH0::UH0_Nil => {
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v10: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            Rc::new(UH0::UH0_Cons(v9.clone(), v10.clone()))
        }
        _ => {
            v8.clone()
        }
    };
    let mut v13: i32 = 0i32;
    let mut v14: i32 = method26(v12.clone(), v13);
    let mut v15: i32 = 1i32;
    let mut v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    numbered_10(v4.clone(), v14, v15, v12.clone(), v16.clone())
}
fn method27(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method27(v3.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v2.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn thread_of_8(mut v0: i32, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v3, v4) => {
                let mut v3: Rc<str> = v3.clone();
                let mut v4: Rc<UH0> = v4.clone();
                let mut v5: i32 = v0.wrapping_add(1i32);
                let mut v6: Rc<UH0> = cell_posts_9(v0, v3.clone());
                let mut v7: Rc<UH0> = method27(v2.clone(), v6.clone());
                (v0, v1, v2) = (v5, v4.clone(), v7.clone());
                continue;
            }
            UH0::UH0_Nil => {
                return v2.clone();
            }
        }
    }
}
fn method29(mut v0: Rc<UH1>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v2, v3, v4) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: i32 = *v3;
                let mut v4: Rc<UH1> = v4.clone();
                let mut v5: i32 = v1.wrapping_add(v3);
                (v0, v1) = (v4.clone(), v5);
                continue;
            }
            UH1::UH1_Nil => {
                return v1;
            }
        }
    }
}
fn method28(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method28(v3.clone(), v1.clone());
            let mut v5: Rc<UH1> = units_of_11(v2.clone());
            let mut v6: i32 = 0i32;
            let mut v7: i32 = method29(v5.clone(), v6);
            let mut v8: Rc<str> = Rc::<str>::from(serde_json::json!({"text": &*v2, "weight": v7}).to_string());
            Rc::new(UH0::UH0_Cons(v8.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method30(mut v0: Rc<UH0>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method30(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn framed_json_0(mut v0: Rc<str>) -> Rc<str> {
    let mut v1: i32 = 1i32;
    let mut v2: Rc<UH0> = file_cells_1(v0.clone());
    let mut v3: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v4: Rc<UH0> = thread_of_8(v1, v2.clone(), v3.clone());
    let mut v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v6: Rc<UH0> = method28(v4.clone(), v5.clone());
    let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v8, mut v9): (Rc<str>, Rc<str>) = method30(v6.clone(), v7.clone());
    let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
    let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v8));
    let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
    let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v12));
    v13.clone()
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        framed_json_0(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn previews_32(mut v0: i32, mut v1: i32, mut v2: Rc<UH0>, mut v3: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v2 {
            UH0::UH0_Cons(v6, v7) => {
                let mut v6: Rc<str> = v6.clone();
                let mut v7: Rc<UH0> = v7.clone();
                let mut v8: i32 = v1.wrapping_add(1i32);
                let mut v9: Rc<str> = Rc::<str>::from(format!("{:?}", v1));
                let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--- post "); } LIT.with(|lit| lit.clone()) };
                let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v9));
                let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" of "); } LIT.with(|lit| lit.clone()) };
                let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v12));
                let mut v14: Rc<str> = Rc::<str>::from(format!("{:?}", v0));
                let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v14));
                let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", weight "); } LIT.with(|lit| lit.clone()) };
                let mut v17: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v16));
                let mut v18: Rc<UH1> = units_of_11(v6.clone());
                let mut v19: i32 = 0i32;
                let mut v20: i32 = method29(v18.clone(), v19);
                let mut v21: Rc<str> = Rc::<str>::from(format!("{:?}", v20));
                let mut v22: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v21));
                let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                let mut v24: Rc<str> = Rc::<str>::from(format!("{}{}", v22, v23));
                let mut v25: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v6));
                let mut v26: Rc<UH0> = Rc::new(UH0::UH0_Cons(v25.clone(), v3.clone()));
                (v0, v1, v2, v3) = (v0, v8, v7.clone(), v26.clone());
                continue;
            }
            UH0::UH0_Nil => {
                let mut v4: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                return method2(v3.clone(), v4.clone());
            }
        }
    }
}
fn preview_31(mut v0: Rc<str>) -> Rc<str> {
    let mut v1: i32 = 1i32;
    let mut v2: Rc<UH0> = file_cells_1(v0.clone());
    let mut v3: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v4: Rc<UH0> = thread_of_8(v1, v2.clone(), v3.clone());
    let mut v5: i32 = 0i32;
    let mut v6: i32 = method26(v4.clone(), v5);
    let mut v7: i32 = v6.wrapping_mul(15i32);
    let mut v8: i32 = v7.wrapping_rem(1000i32);
    let mut v9: bool = v8 < 10i32;
    let mut v15: Rc<str> = if v9 {
        let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("00"); } LIT.with(|lit| lit.clone()) };
        v10.clone()
    } else {
        let mut v11: bool = v8 < 100i32;
        if v11 {
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0"); } LIT.with(|lit| lit.clone()) };
            v12.clone()
        } else {
            let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v13.clone()
        }
    };
    let mut v16: i32 = v7.wrapping_div(1000i32);
    let mut v17: Rc<str> = Rc::<str>::from(format!("{:?}", v16));
    let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("$"); } LIT.with(|lit| lit.clone()) };
    let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v17));
    let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("."); } LIT.with(|lit| lit.clone()) };
    let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v20));
    let mut v22: Rc<str> = Rc::<str>::from(format!("{}{}", v21, v15));
    let mut v23: Rc<str> = Rc::<str>::from(format!("{:?}", v8));
    let mut v24: Rc<str> = Rc::<str>::from(format!("{}{}", v22, v23));
    let mut v25: i32 = 1i32;
    let mut v26: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v27: Rc<UH0> = previews_32(v6, v25, v4.clone(), v26.clone());
    let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v29, mut v30): (Rc<str>, Rc<str>) = method6(v27.clone(), v28.clone());
    let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n--- "); } LIT.with(|lit| lit.clone()) };
    let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v31));
    let mut v33: Rc<str> = Rc::<str>::from(format!("{:?}", v6));
    let mut v34: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v33));
    let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" posts, "); } LIT.with(|lit| lit.clone()) };
    let mut v36: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v35));
    let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v24));
    let mut v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" to create"); } LIT.with(|lit| lit.clone()) };
    let mut v39: Rc<str> = Rc::<str>::from(format!("{}{}", v37, v38));
    v39.clone()
}
fn closure3() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        preview_31(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_frames(v0: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0))
}
pub fn xc_preview(v0: &str) -> Rc<str> {
    closure3()(Rc::<str>::from(v0))
}
