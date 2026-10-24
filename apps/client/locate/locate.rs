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
enum UH2 {
    UH2_Nil,
    UH2_Cons(Rc<str>, Rc<str>, Rc<str>, Rc<UH2>),
}
#[derive(Clone)]
enum US0 {
    US0_Some(Rc<str>),
    US0_None,
}
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<str>, Rc<UH1>, Rc<UH2>, US0, Rc<UH0>),
}
#[derive(Clone)]
enum UH3 {
    UH3_Nil,
    UH3_Cons(Rc<str>, Rc<UH3>),
}
#[derive(Clone)]
enum US1 {
    US1_Some(Rc<str>, i32, i32, Rc<str>),
    US1_None,
}
#[derive(Clone)]
enum US3 {
    US3_NotTwoWords,
    US3_NotAFraction,
    US3_PartOutOfRange,
}
#[derive(Clone)]
enum US2 {
    US2_Ok(Rc<str>, i32, i32),
    US2_Error(US3),
}
#[derive(Clone)]
enum US4 {
    US4_Some(i32),
    US4_None,
}
fn from_2(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH3>) -> Rc<UH3> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = Rc::<str>::from(v5.as_str().unwrap_or(""));
            let mut v7: Rc<UH3> = Rc::new(UH3::UH3_Cons(v6.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v7.clone());
            continue;
        }
    }
}
fn method3(mut v0: Rc<UH3>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH3> = v3.clone();
            let mut v4: Rc<UH1> = method3(v3.clone(), v1.clone());
            Rc::new(UH1::UH1_Cons(v2.clone(), v4.clone()))
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn from_4(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH2>) -> Rc<UH2> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("url"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: Rc<str> = Rc::<str>::from(v7.as_str().unwrap_or(""));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("expanded_url"); } LIT.with(|lit| lit.clone()) };
            let mut v10: serde_json::Value = v5.get(&*v9).cloned().unwrap_or_default();
            let mut v11: Rc<str> = Rc::<str>::from(v10.as_str().unwrap_or(""));
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
            let mut v13: serde_json::Value = v5.get(&*v12).cloned().unwrap_or_default();
            let mut v14: Rc<str> = Rc::<str>::from(v13.as_str().unwrap_or(""));
            let mut v15: Rc<UH2> = Rc::new(UH2::UH2_Cons(v8.clone(), v11.clone(), v14.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v15.clone());
            continue;
        }
    }
}
fn from_1(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: Rc<str> = Rc::<str>::from(v7.as_str().unwrap_or(""));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
            let mut v10: serde_json::Value = v5.get(&*v9).cloned().unwrap_or_default();
            let mut v11: Rc<str> = Rc::<str>::from(v10.as_str().unwrap_or(""));
            let mut v12: Rc<str> = Rc::<str>::from((&*v11).replace("&lt;", "<").replace("&gt;", ">").replace("&amp;", "&"));
            let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("edit_history_post_ids"); } LIT.with(|lit| lit.clone()) };
            let mut v14: serde_json::Value = v5.get(&*v13).cloned().unwrap_or_default();
            let mut v15: i32 = v14.as_array().map_or(0, |a| a.len()) as i32;
            let mut v16: i32 = v15.wrapping_sub(1i32);
            let mut v17: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
            let mut v18: Rc<UH3> = from_2(v14.clone(), v16, v17.clone());
            let mut v19: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v20: Rc<UH1> = method3(v18.clone(), v19.clone());
            let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("entities"); } LIT.with(|lit| lit.clone()) };
            let mut v22: serde_json::Value = v5.get(&*v21).cloned().unwrap_or_default();
            let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("urls"); } LIT.with(|lit| lit.clone()) };
            let mut v24: serde_json::Value = v22.get(&*v23).cloned().unwrap_or_default();
            let mut v25: i32 = v24.as_array().map_or(0, |a| a.len()) as i32;
            let mut v26: i32 = v25.wrapping_sub(1i32);
            let mut v27: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let mut v28: Rc<UH2> = from_4(v24.clone(), v26, v27.clone());
            let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
            let mut v30: serde_json::Value = v5.get(&*v29).cloned().unwrap_or_default();
            let mut v31: Rc<str> = Rc::<str>::from(v30.as_array().and_then(|a| a.iter().find(|r| r["type"] == "replied_to")).and_then(|r| r["id"].as_str()).unwrap_or(""));
            let mut v32: bool = v31.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v35: US0 = if v32 {
                US0::US0_None
            } else {
                US0::US0_Some(v31.clone())
            };
            let mut v36: Rc<UH0> = Rc::new(UH0::UH0_Cons(v8.clone(), v12.clone(), v20.clone(), v28.clone(), v35.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v36.clone());
            continue;
        }
    }
}
fn method6(mut v0: Rc<UH3>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH3> = v3.clone();
            let mut v4: Rc<UH3> = method6(v3.clone(), v1.clone());
            Rc::new(UH3::UH3_Cons(v2.clone(), v4.clone()))
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn method8(mut v0: Rc<UH2>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match &*v0 {
            UH2::UH2_Cons(v2, v3, v4, v5) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<str> = v3.clone();
                let mut v4: Rc<str> = v4.clone();
                let mut v5: Rc<UH2> = v5.clone();
                let mut v6: bool = v3.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v8: Rc<str> = if v6 {
                    v1.clone()
                } else {
                    let mut v7: Rc<str> = Rc::<str>::from(v1.replace(&*v2, &*v3));
                    v7.clone()
                };
                (v0, v1) = (v5.clone(), v8.clone());
                continue;
            }
            UH2::UH2_Nil => {
                return v1.clone();
            }
        }
    }
}
fn digits_13(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> US4 {
    loop {
        let mut v3: i32 = (v0.clone().len() as i32);
        let mut v4: bool = v1 >= v3;
        if v4 {
            return US4::US4_Some(v2);
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
                return US4::US4_None;
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
fn count_of_text_12(mut v0: Rc<str>) -> US4 {
    let mut v1: bool = v0.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v24: bool = if v1 {
        true
    } else {
        let mut v2: Rc<str> = Rc::<str>::from(format!("{:?}", 0i32));
        let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v4: Rc<str> = Rc::<str>::from(v0.replace(&*v2, &*v3));
        let mut v5: Rc<str> = Rc::<str>::from(format!("{:?}", 1i32));
        let mut v6: Rc<str> = Rc::<str>::from(v4.replace(&*v5, &*v3));
        let mut v7: Rc<str> = Rc::<str>::from(format!("{:?}", 2i32));
        let mut v8: Rc<str> = Rc::<str>::from(v6.replace(&*v7, &*v3));
        let mut v9: Rc<str> = Rc::<str>::from(format!("{:?}", 3i32));
        let mut v10: Rc<str> = Rc::<str>::from(v8.replace(&*v9, &*v3));
        let mut v11: Rc<str> = Rc::<str>::from(format!("{:?}", 4i32));
        let mut v12: Rc<str> = Rc::<str>::from(v10.replace(&*v11, &*v3));
        let mut v13: Rc<str> = Rc::<str>::from(format!("{:?}", 5i32));
        let mut v14: Rc<str> = Rc::<str>::from(v12.replace(&*v13, &*v3));
        let mut v15: Rc<str> = Rc::<str>::from(format!("{:?}", 6i32));
        let mut v16: Rc<str> = Rc::<str>::from(v14.replace(&*v15, &*v3));
        let mut v17: Rc<str> = Rc::<str>::from(format!("{:?}", 7i32));
        let mut v18: Rc<str> = Rc::<str>::from(v16.replace(&*v17, &*v3));
        let mut v19: Rc<str> = Rc::<str>::from(format!("{:?}", 8i32));
        let mut v20: Rc<str> = Rc::<str>::from(v18.replace(&*v19, &*v3));
        let mut v21: Rc<str> = Rc::<str>::from(format!("{:?}", 9i32));
        let mut v22: Rc<str> = Rc::<str>::from(v20.replace(&*v21, &*v3));
        let mut v23: bool = v22.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v23
    };
    if v24 {
        US4::US4_None
    } else {
        let mut v26: i32 = 0i32;
        let mut v27: i32 = 0i32;
        digits_13(v0.clone(), v26, v27)
    }
}
fn fraction_of_11(mut v0: Rc<str>, mut v1: Rc<str>) -> US2 {
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let mut v3: i32 = v1.find(&*v2).map(|i| i as i32).unwrap_or(-1);
    let mut v4: bool = v3 > 0i32;
    if v4 {
        let mut v5: Rc<str> = Rc::<str>::from(&(v1)[((0i32) as usize)..(((0i32) + (v3)) as usize)]);
        let mut v6: US4 = count_of_text_12(v5.clone());
        match &v6 {
            US4::US4_None => {
                let mut v26: US3 = US3::US3_NotAFraction;
                US2::US2_Error(v26.clone())
            }
            US4::US4_Some(v7) => {
                let mut v7: i32 = *v7;
                let mut v8: i32 = v3.wrapping_add(1i32);
                let mut v9: i32 = (v1.clone().len() as i32);
                let mut v10: i32 = v9.wrapping_sub(v3);
                let mut v11: i32 = v10.wrapping_sub(1i32);
                let mut v12: Rc<str> = Rc::<str>::from(&(v1)[((v8) as usize)..(((v8) + (v11)) as usize)]);
                let mut v13: US4 = count_of_text_12(v12.clone());
                match &v13 {
                    US4::US4_None => {
                        let mut v22: US3 = US3::US3_NotAFraction;
                        US2::US2_Error(v22.clone())
                    }
                    US4::US4_Some(v14) => {
                        let mut v14: i32 = *v14;
                        let mut v15: bool = v7 >= 1i32;
                        let mut v17: bool = if v15 {
                            let mut v16: bool = v7 <= v14;
                            v16
                        } else {
                            false
                        };
                        if v17 {
                            US2::US2_Ok(v0.clone(), v7, v14)
                        } else {
                            let mut v19: US3 = US3::US3_PartOutOfRange;
                            US2::US2_Error(v19.clone())
                        }
                    }
                }
            }
        }
    } else {
        let mut v30: US3 = US3::US3_NotAFraction;
        US2::US2_Error(v30.clone())
    }
}
fn parsed_10(mut v0: Rc<str>) -> US2 {
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
    let mut v2: i32 = v0.find(&*v1).map(|i| i as i32).unwrap_or(-1);
    let mut v3: bool = v2 > 0i32;
    let mut v10: Rc<str> = if v3 {
        let mut v4: i32 = v2.wrapping_add(1i32);
        let mut v5: i32 = (v0.clone().len() as i32);
        let mut v6: i32 = v5.wrapping_sub(v2);
        let mut v7: i32 = v6.wrapping_sub(1i32);
        let mut v8: Rc<str> = Rc::<str>::from(&(v0)[((v4) as usize)..(((v4) + (v7)) as usize)]);
        v8.clone()
    } else {
        let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v9.clone()
    };
    let mut v11: bool = v2 <= 0i32;
    let mut v14: bool = if v11 {
        true
    } else {
        let mut v12: i32 = v10.find(&*v1).map(|i| i as i32).unwrap_or(-1);
        let mut v13: bool = v12 >= 0i32;
        v13
    };
    if v14 {
        let mut v15: US3 = US3::US3_NotTwoWords;
        US2::US2_Error(v15.clone())
    } else {
        let mut v17: Rc<str> = Rc::<str>::from(&(v0)[((0i32) as usize)..(((0i32) + (v2)) as usize)]);
        fraction_of_11(v17.clone(), v10.clone())
    }
}
fn frame_text_of_9(mut v0: Rc<str>) -> US1 {
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let mut v2: i32 = v0.find(&*v1).map(|i| i as i32).unwrap_or(-1);
    let mut v3: bool = v2 < 0i32;
    let mut v5: i32 = if v3 {
        let mut v4: i32 = (v0.clone().len() as i32);
        v4
    } else {
        v2
    };
    let mut v6: Rc<str> = Rc::<str>::from(&(v0)[((0i32) as usize)..(((0i32) + (v5)) as usize)]);
    let mut v7: US2 = parsed_10(v6.clone());
    match &v7 {
        US2::US2_Error(v23) => {
            let mut v23: US3 = v23.clone();
            US1::US1_None
        }
        US2::US2_Ok(v8, v9, v10) => {
            let mut v8: Rc<str> = v8.clone();
            let mut v9: i32 = *v9;
            let mut v10: i32 = *v10;
            let mut v21: Rc<str> = if v3 {
                let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v11.clone()
            } else {
                let mut v12: i32 = v2.wrapping_add(1i32);
                let mut v13: i32 = (v0.clone().len() as i32);
                let mut v14: i32 = v13.wrapping_sub(v2);
                let mut v15: i32 = v14.wrapping_sub(1i32);
                let mut v16: Rc<str> = Rc::<str>::from(&(v0)[((v12) as usize)..(((v12) + (v15)) as usize)]);
                let mut v17: Rc<str> = Rc::<str>::from(char::from_u32(8203i32 as u32).map(|c| c.to_string()).unwrap_or_default());
                let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("."); } LIT.with(|lit| lit.clone()) };
                let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v18));
                let mut v20: Rc<str> = Rc::<str>::from(v16.replace(&*v19, &*v18));
                v20.clone()
            };
            US1::US1_Some(v8.clone(), v9, v10, v21.clone())
        }
    }
}
fn method14(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH1> = v3.clone();
                let mut v4: Rc<UH1> = Rc::new(UH1::UH1_Cons(v2.clone(), v1.clone()));
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH1::UH1_Nil => {
                return v1.clone();
            }
        }
    }
}
fn frames_of_7(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<UH1>, mut v3: Rc<UH2>, mut v4: US0) -> Rc<UH3> {
    let mut v5: Rc<str> = method8(v3.clone(), v1.clone());
    let mut v6: US1 = frame_text_of_9(v5.clone());
    match &v6 {
        US1::US1_Some(v7, v8, v9, v10) => {
            let mut v7: Rc<str> = v7.clone();
            let mut v8: i32 = *v8;
            let mut v9: i32 = *v9;
            let mut v10: Rc<str> = v10.clone();
            let mut v11: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v12: Rc<UH1> = method14(v2.clone(), v11.clone());
            let mut v17: bool = match &*v12 {
                UH1::UH1_Cons(v13, v14) => {
                    let mut v13: Rc<str> = v13.clone();
                    let mut v14: Rc<UH1> = v14.clone();
                    let mut v15: bool = v13.clone() == v0.clone();
                    v15
                }
                UH1::UH1_Nil => {
                    true
                }
            };
            if v17 {
                let mut v21: Rc<str> = match &*v2 {
                    UH1::UH1_Cons(v18, v19) => {
                        let mut v18: Rc<str> = v18.clone();
                        let mut v19: Rc<UH1> = v19.clone();
                        v18.clone()
                    }
                    UH1::UH1_Nil => {
                        v0.clone()
                    }
                };
                let mut v22: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v7).to_string());
                let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) };
                let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cell"); } LIT.with(|lit| lit.clone()) };
                let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"cell"); } LIT.with(|lit| lit.clone()) };
                let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"cell\""); } LIT.with(|lit| lit.clone()) };
                let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
                let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"cell\":"); } LIT.with(|lit| lit.clone()) };
                let mut v29: Rc<str> = Rc::<str>::from(format!("{}{}", v28, v22));
                let mut v30: Rc<str> = Rc::<str>::from(format!("{:?}", v8));
                let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("k"); } LIT.with(|lit| lit.clone()) };
                let mut v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"k"); } LIT.with(|lit| lit.clone()) };
                let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"k\""); } LIT.with(|lit| lit.clone()) };
                let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"k\":"); } LIT.with(|lit| lit.clone()) };
                let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v30));
                let mut v36: Rc<str> = Rc::<str>::from(format!("{:?}", v9));
                let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("n"); } LIT.with(|lit| lit.clone()) };
                let mut v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"n"); } LIT.with(|lit| lit.clone()) };
                let mut v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"n\""); } LIT.with(|lit| lit.clone()) };
                let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"n\":"); } LIT.with(|lit| lit.clone()) };
                let mut v41: Rc<str> = Rc::<str>::from(format!("{}{}", v40, v36));
                let mut v42: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v10).to_string());
                let mut v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("body"); } LIT.with(|lit| lit.clone()) };
                let mut v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"body"); } LIT.with(|lit| lit.clone()) };
                let mut v45: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"body\""); } LIT.with(|lit| lit.clone()) };
                let mut v46: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"body\":"); } LIT.with(|lit| lit.clone()) };
                let mut v47: Rc<str> = Rc::<str>::from(format!("{}{}", v46, v42));
                let mut v48: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v21).to_string());
                let mut v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("original"); } LIT.with(|lit| lit.clone()) };
                let mut v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"original"); } LIT.with(|lit| lit.clone()) };
                let mut v51: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"original\""); } LIT.with(|lit| lit.clone()) };
                let mut v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"original\":"); } LIT.with(|lit| lit.clone()) };
                let mut v53: Rc<str> = Rc::<str>::from(format!("{}{}", v52, v48));
                let mut v57: Rc<str> = match &v4 {
                    US0::US0_None => {
                        let mut v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                        v55.clone()
                    }
                    US0::US0_Some(v54) => {
                        let mut v54: Rc<str> = v54.clone();
                        v54.clone()
                    }
                };
                let mut v58: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v57).to_string());
                let mut v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("parent"); } LIT.with(|lit| lit.clone()) };
                let mut v60: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"parent"); } LIT.with(|lit| lit.clone()) };
                let mut v61: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"parent\""); } LIT.with(|lit| lit.clone()) };
                let mut v62: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"parent\":"); } LIT.with(|lit| lit.clone()) };
                let mut v63: Rc<str> = Rc::<str>::from(format!("{}{}", v62, v58));
                let mut v64: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v65: Rc<str> = Rc::<str>::from(format!("{}{}", v63, v64));
                let mut v66: Rc<str> = Rc::<str>::from(format!("{}{}", v65, v64));
                let mut v67: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                let mut v68: Rc<str> = Rc::<str>::from(format!("{}{}", v53, v67));
                let mut v69: Rc<str> = Rc::<str>::from(format!("{}{}", v68, v66));
                let mut v70: Rc<str> = Rc::<str>::from(format!("{}{}", v47, v67));
                let mut v71: Rc<str> = Rc::<str>::from(format!("{}{}", v70, v69));
                let mut v72: Rc<str> = Rc::<str>::from(format!("{}{}", v41, v67));
                let mut v73: Rc<str> = Rc::<str>::from(format!("{}{}", v72, v71));
                let mut v74: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v67));
                let mut v75: Rc<str> = Rc::<str>::from(format!("{}{}", v74, v73));
                let mut v76: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v67));
                let mut v77: Rc<str> = Rc::<str>::from(format!("{}{}", v76, v75));
                let mut v78: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{"); } LIT.with(|lit| lit.clone()) };
                let mut v79: Rc<str> = Rc::<str>::from(format!("{}{}", v78, v77));
                let mut v80: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
                let mut v81: Rc<str> = Rc::<str>::from(format!("{}{}", v79, v80));
                let mut v82: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
                Rc::new(UH3::UH3_Cons(v81.clone(), v82.clone()))
            } else {
                { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) }
            }
        }
        _ => {
            { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) }
        }
    }
}
fn method5(mut v0: Rc<UH0>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3, v4, v5, v6, v7) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH1> = v4.clone();
            let mut v5: Rc<UH2> = v5.clone();
            let mut v6: US0 = v6.clone();
            let mut v7: Rc<UH0> = v7.clone();
            let mut v8: Rc<UH3> = method5(v7.clone(), v1.clone());
            let mut v9: Rc<UH3> = frames_of_7(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone());
            method6(v9.clone(), v8.clone())
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method15(mut v0: Rc<UH3>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH3::UH3_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH3> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method15(v4.clone(), v1.clone(), v2.clone());
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v6));
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v5));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            (v8.clone(), v9.clone())
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v0 {
                UH3::UH3_Nil => {
                    (v1.clone(), v2.clone())
                }
                _ => unreachable!(),
            };
            (v10.clone(), v11.clone())
        }
    };
    (v12.clone(), v13.clone())
}
fn method17(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method17(v3.clone(), v1.clone());
            Rc::new(UH1::UH1_Cons(v2.clone(), v4.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method16(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3, v4, v5, v6, v7) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH1> = v4.clone();
            let mut v5: Rc<UH2> = v5.clone();
            let mut v6: US0 = v6.clone();
            let mut v7: Rc<UH0> = v7.clone();
            let mut v8: Rc<UH1> = method16(v7.clone(), v1.clone());
            let mut v9: Rc<UH1> = method17(v4.clone(), v8.clone());
            Rc::new(UH1::UH1_Cons(v2.clone(), v9.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method18(mut v0: Rc<UH1>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH3> = method18(v3.clone(), v1.clone());
            Rc::new(UH3::UH3_Cons(v2.clone(), v4.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method19(mut v0: Rc<UH3>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH3> = v3.clone();
            let mut v4: Rc<UH3> = method19(v3.clone(), v1.clone());
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) };
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v2));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v5));
            Rc::new(UH3::UH3_Cons(v7.clone(), v4.clone()))
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn located_0(mut v0: Rc<str>) -> Rc<str> {
    let mut v1: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v0).unwrap_or_default();
    let mut v2: serde_json::Value = serde_json::Value::from((v1).as_array().map(|ps| ps.iter().flat_map(|p| p["data"].as_array().cloned().unwrap_or_default()).collect::<Vec<_>>()).unwrap_or_default());
    let mut v3: i32 = v2.as_array().map_or(0, |a| a.len()) as i32;
    let mut v4: i32 = v3.wrapping_sub(1i32);
    let mut v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v6: Rc<UH0> = from_1(v2.clone(), v4, v5.clone());
    let mut v7: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let mut v8: Rc<UH3> = method5(v6.clone(), v7.clone());
    let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v10, mut v11): (Rc<str>, Rc<str>) = method15(v8.clone(), v9.clone(), v9.clone());
    let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
    let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v10));
    let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
    let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v14));
    let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) };
    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("frames"); } LIT.with(|lit| lit.clone()) };
    let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"frames"); } LIT.with(|lit| lit.clone()) };
    let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"frames\""); } LIT.with(|lit| lit.clone()) };
    let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
    let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"frames\":"); } LIT.with(|lit| lit.clone()) };
    let mut v22: Rc<str> = Rc::<str>::from(format!("{}{}", v21, v15));
    let mut v23: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v24: Rc<UH1> = method16(v6.clone(), v23.clone());
    let mut v25: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let mut v26: Rc<UH3> = method18(v24.clone(), v25.clone());
    let mut v27: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let mut v28: Rc<UH3> = method19(v26.clone(), v27.clone());
    let (mut v29, mut v30): (Rc<str>, Rc<str>) = method15(v28.clone(), v9.clone(), v9.clone());
    let mut v31: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v29));
    let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v31, v14));
    let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("known"); } LIT.with(|lit| lit.clone()) };
    let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"known"); } LIT.with(|lit| lit.clone()) };
    let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"known\""); } LIT.with(|lit| lit.clone()) };
    let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"known\":"); } LIT.with(|lit| lit.clone()) };
    let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v32));
    let mut v38: Rc<str> = Rc::<str>::from(format!("{}{}", v37, v9));
    let mut v39: Rc<str> = Rc::<str>::from(format!("{}{}", v38, v9));
    let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let mut v41: Rc<str> = Rc::<str>::from(format!("{}{}", v22, v40));
    let mut v42: Rc<str> = Rc::<str>::from(format!("{}{}", v41, v39));
    let mut v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{"); } LIT.with(|lit| lit.clone()) };
    let mut v44: Rc<str> = Rc::<str>::from(format!("{}{}", v43, v42));
    let mut v45: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
    let mut v46: Rc<str> = Rc::<str>::from(format!("{}{}", v44, v45));
    v46.clone()
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        located_0(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_locate(v0: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0))
}
