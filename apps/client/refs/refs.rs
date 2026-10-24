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
    US0_BearerToken(Rc<str>),
}
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<UH1>),
}
#[derive(Clone)]
enum US1 {
    US1_Some(Rc<str>),
    US1_None,
}
#[derive(Clone)]
enum US3 {
    US3_HttpStatus(i32, Rc<str>, Rc<str>),
    US3_Transport(Rc<str>, Rc<str>),
    US3_Undecodable(Rc<str>, Rc<str>),
    US3_NoSuchAccount(Rc<str>),
}
#[derive(Clone)]
enum US2 {
    US2_Ok(serde_json::Value, Rc<str>),
    US2_Error(US3),
}
#[derive(Clone)]
enum US4 {
    US4_Ok(serde_json::Value),
    US4_Error(US3),
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(Rc<UH0>, Rc<UH2>),
}
#[derive(Clone)]
enum UH3 {
    UH3_Nil,
    UH3_Cons(Rc<str>, Rc<str>, Rc<UH3>),
}
#[derive(Clone)]
enum US5 {
    US5_Some(Rc<str>),
    US5_None,
}
fn split_on_1(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
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
        let mut v12: Rc<UH0> = split_on_1(v0.clone(), v11.clone());
        Rc::new(UH0::UH0_Cons(v6.clone(), v12.clone()))
    }
}
fn method2(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH1> = method2(v3.clone(), v1.clone());
            Rc::new(UH1::UH1_Cons(v2.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method5(mut v0: Rc<str>, mut v1: Rc<UH1>, mut v2: US1) -> US1 {
    match &*v1 {
        UH1::UH1_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH1> = v4.clone();
            let mut v5: US1 = method5(v0.clone(), v4.clone(), v2.clone());
            let mut v6: bool = v0.clone() == v3.clone();
            if v6 {
                US1::US1_Some(v3.clone())
            } else {
                v5.clone()
            }
        }
        UH1::UH1_Nil => {
            v2.clone()
        }
    }
}
fn method6(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method6(v3.clone(), v1.clone());
            Rc::new(UH1::UH1_Cons(v2.clone(), v4.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method4(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH1> = v3.clone();
                let mut v4: US1 = US1::US1_None;
                let mut v5: US1 = method5(v2.clone(), v1.clone(), v4.clone());
                let mut v8: bool = match &v5 {
                    US1::US1_None => {
                        false
                    }
                    US1::US1_Some(v6) => {
                        let mut v6: Rc<str> = v6.clone();
                        true
                    }
                };
                let mut v12: Rc<UH1> = if v8 {
                    v1.clone()
                } else {
                    let mut v9: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let mut v10: Rc<UH1> = Rc::new(UH1::UH1_Cons(v2.clone(), v9.clone()));
                    method6(v1.clone(), v10.clone())
                };
                (v0, v1) = (v3.clone(), v12.clone());
                continue;
            }
            UH1::UH1_Nil => {
                return v1.clone();
            }
        }
    }
}
fn go_7(mut v0: i32, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v1 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: bool = v0 > 0i32;
            if v4 {
                let mut v5: i32 = v0.wrapping_sub(1i32);
                let mut v6: Rc<UH1> = go_7(v5, v3.clone());
                Rc::new(UH1::UH1_Cons(v2.clone(), v6.clone()))
            } else {
                { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
            }
        }
        _ => {
            { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
        }
    }
}
fn method9(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH0> = method9(v3.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v2.clone(), v4.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method10(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method10(v4.clone(), v1.clone(), v2.clone());
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v6));
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v5));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            (v8.clone(), v9.clone())
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1.clone(), v2.clone())
                }
                _ => unreachable!(),
            };
            (v10.clone(), v11.clone())
        }
    };
    (v12.clone(), v13.clone())
}
fn method11(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method11(v3.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v2.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn lookup_path_8(mut v0: Rc<UH1>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: bool, mut v5: bool, mut v6: i32, mut v7: bool) -> Rc<str> {
    let mut v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v9: Rc<UH0> = method9(v0.clone(), v8.clone());
    let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = method10(v9.clone(), v10.clone(), v10.clone());
    let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets?ids="); } LIT.with(|lit| lit.clone()) };
    let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v11));
    let mut v16: Rc<str> = if v7 {
        let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&media.fields=type,alt_text"); } LIT.with(|lit| lit.clone()) };
        v15.clone()
    } else {
        v10.clone()
    };
    let mut v17: bool = v6 > 0i32;
    let mut v24: Rc<UH0> = if v17 {
        let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
        let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts.author_id"); } LIT.with(|lit| lit.clone()) };
        let mut v20: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v21: Rc<UH0> = Rc::new(UH0::UH0_Cons(v19.clone(), v20.clone()));
        Rc::new(UH0::UH0_Cons(v18.clone(), v21.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    };
    let mut v29: Rc<UH0> = if v7 {
        let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("attachments.media_keys"); } LIT.with(|lit| lit.clone()) };
        let mut v26: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v25.clone(), v26.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    };
    let mut v30: Rc<UH0> = method11(v24.clone(), v29.clone());
    let mut v36: Rc<str> = match &*v30 {
        UH0::UH0_Nil => {
            v10.clone()
        }
        _ => {
            let (mut v31, mut v32): (Rc<str>, Rc<str>) = method10(v30.clone(), v10.clone(), v10.clone());
            let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&expansions="); } LIT.with(|lit| lit.clone()) };
            let mut v34: Rc<str> = Rc::<str>::from(format!("{}{}", v33, v31));
            let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v16));
            v35.clone()
        }
    };
    let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&post.fields=created_at,author_id,public_metrics,entities,attachments"); } LIT.with(|lit| lit.clone()) };
    let mut v38: Rc<str> = Rc::<str>::from(format!("{}{}", v37, v36));
    let mut v39: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v38));
    v39.clone()
}
fn app_reply_12(mut v0: Rc<str>, mut v1: US0, mut v2: Rc<str>) -> US2 {
    let mut v3: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v2));
    let mut v7: Rc<str> = match &v1 {
        US0::US0_BearerToken(v4) => {
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) };
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v4));
            v6.clone()
        }
    };
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("GET"); } LIT.with(|lit| lit.clone()) };
    let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v10, mut v11): (i32, Rc<str>) = xc_net::xc_send(&*v8, &*v3, &*v7, &*v9);
    let mut v12: bool = v10 == 0i32;
    let mut v68: US4 = if v12 {
        let mut v13: US3 = US3::US3_Transport(v2.clone(), v11.clone());
        US4::US4_Error(v13.clone())
    } else {
        let mut v15: bool = v10 >= 200i32;
        let mut v17: bool = if v15 {
            let mut v16: bool = v10 < 300i32;
            v16
        } else {
            false
        };
        let mut v18: bool = v17 == false;
        if v18 {
            let mut v19: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v11).unwrap_or_default();
            let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
            let mut v21: serde_json::Value = v19.get(&*v20).cloned().unwrap_or_default();
            let mut v22: Rc<str> = Rc::<str>::from(v21.as_str().unwrap_or(""));
            let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
            let mut v24: serde_json::Value = v19.get(&*v23).cloned().unwrap_or_default();
            let mut v25: Rc<str> = Rc::<str>::from(v24.as_str().unwrap_or(""));
            let mut v26: bool = v22.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v28: bool = if v26 {
                let mut v27: bool = v25.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v27
            } else {
                false
            };
            let mut v30: bool = if v28 {
                let mut v29: bool = v22.clone() != v25.clone();
                v29
            } else {
                false
            };
            let mut v52: Rc<str> = if v30 {
                let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v22, v31));
                let mut v33: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v25));
                v33.clone()
            } else {
                let mut v34: bool = v25.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                if v34 {
                    v25.clone()
                } else {
                    if v26 {
                        v22.clone()
                    } else {
                        let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
                        let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
                        let mut v37: Rc<str> = Rc::<str>::from(v11.replace(&*v35, &*v36));
                        let mut v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                        let mut v39: Rc<str> = Rc::<str>::from(v37.replace(&*v38, &*v36));
                        let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
                        let mut v41: Rc<str> = Rc::<str>::from(v39.replace(&*v40, &*v36));
                        let mut v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
                        let mut v43: Rc<str> = Rc::<str>::from(v41.replace(&*v42, &*v36));
                        let mut v44: i32 = (v43.clone().len() as i32);
                        let mut v45: bool = v44 <= 300i32;
                        if v45 {
                            v43.clone()
                        } else {
                            let mut v46: Rc<str> = string_slice(&v43.clone(), 0i32 as i64, 299i32 as i64);
                            let mut v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("..."); } LIT.with(|lit| lit.clone()) };
                            let mut v48: Rc<str> = Rc::<str>::from(format!("{}{}", v46, v47));
                            v48.clone()
                        }
                    }
                }
            };
            let mut v53: US3 = US3::US3_HttpStatus(v10, v2.clone(), v52.clone());
            US4::US4_Error(v53.clone())
        } else {
            let mut v55: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v11).unwrap_or_default();
            let mut v56: bool = v55.is_null();
            if v56 {
                let mut v57: i32 = (v11.clone().len() as i32);
                let mut v58: bool = v57 <= 300i32;
                let mut v62: Rc<str> = if v58 {
                    v11.clone()
                } else {
                    let mut v59: Rc<str> = string_slice(&v11.clone(), 0i32 as i64, 299i32 as i64);
                    let mut v60: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("..."); } LIT.with(|lit| lit.clone()) };
                    let mut v61: Rc<str> = Rc::<str>::from(format!("{}{}", v59, v60));
                    v61.clone()
                };
                let mut v63: US3 = US3::US3_Undecodable(v2.clone(), v62.clone());
                US4::US4_Error(v63.clone())
            } else {
                US4::US4_Ok(v55.clone())
            }
        }
    };
    match &v68 {
        US4::US4_Error(v71) => {
            let mut v71: US3 = v71.clone();
            US2::US2_Error(v71.clone())
        }
        US4::US4_Ok(v69) => {
            let mut v69: serde_json::Value = v69.clone();
            US2::US2_Ok(v69.clone(), v11.clone())
        }
    }
}
fn from_15(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
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
            let mut v9: Rc<UH0> = Rc::new(UH0::UH0_Cons(v8.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v9.clone());
            continue;
        }
    }
}
fn from_14(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH2>) -> Rc<UH2> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: i32 = v7.as_array().map_or(0, |a| a.len()) as i32;
            let mut v9: i32 = v8.wrapping_sub(1i32);
            let mut v10: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v11: Rc<UH0> = from_15(v7.clone(), v9, v10.clone());
            let mut v12: Rc<UH2> = Rc::new(UH2::UH2_Cons(v11.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v12.clone());
            continue;
        }
    }
}
fn method16(mut v0: Rc<UH2>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3) => {
            let mut v2: Rc<UH0> = v2.clone();
            let mut v3: Rc<UH2> = v3.clone();
            let mut v4: Rc<UH0> = method16(v3.clone(), v1.clone());
            method11(v2.clone(), v4.clone())
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn from_18(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH3>) -> Rc<UH3> {
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
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("username"); } LIT.with(|lit| lit.clone()) };
            let mut v10: serde_json::Value = v5.get(&*v9).cloned().unwrap_or_default();
            let mut v11: Rc<str> = Rc::<str>::from(v10.as_str().unwrap_or(""));
            let mut v12: Rc<UH3> = Rc::new(UH3::UH3_Cons(v8.clone(), v11.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v12.clone());
            continue;
        }
    }
}
fn method19(mut v0: Rc<UH3>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH3> = v4.clone();
            let mut v5: Rc<UH3> = method19(v4.clone(), v1.clone());
            let mut v6: bool = v3.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            if v6 {
                Rc::new(UH3::UH3_Cons(v2.clone(), v3.clone(), v5.clone()))
            } else {
                v5.clone()
            }
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn method20(mut v0: Rc<UH3>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH3> = v4.clone();
            let mut v5: Rc<UH0> = method20(v4.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v2.clone(), v5.clone()))
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn from_21(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("author_id"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: Rc<str> = Rc::<str>::from(v7.as_str().unwrap_or(""));
            let mut v9: Rc<UH0> = Rc::new(UH0::UH0_Cons(v8.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v9.clone());
            continue;
        }
    }
}
fn absorbed_17(mut v0: serde_json::Value, mut v1: Rc<str>, mut v2: Rc<UH0>, mut v3: Rc<UH0>, mut v4: Rc<str>, mut v5: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("includes"); } LIT.with(|lit| lit.clone()) };
    let mut v7: serde_json::Value = v0.get(&*v6).cloned().unwrap_or_default();
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("users"); } LIT.with(|lit| lit.clone()) };
    let mut v9: serde_json::Value = v7.get(&*v8).cloned().unwrap_or_default();
    let mut v10: i32 = v9.as_array().map_or(0, |a| a.len()) as i32;
    let mut v11: i32 = v10.wrapping_sub(1i32);
    let mut v12: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let mut v13: Rc<UH3> = from_18(v9.clone(), v11, v12.clone());
    let mut v14: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let mut v15: Rc<UH3> = method19(v13.clone(), v14.clone());
    let mut v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v17: Rc<UH0> = method20(v15.clone(), v16.clone());
    let mut v18: Rc<UH0> = method11(v3.clone(), v17.clone());
    let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
    let mut v20: serde_json::Value = v0.get(&*v19).cloned().unwrap_or_default();
    let mut v21: i32 = v20.as_array().map_or(0, |a| a.len()) as i32;
    let mut v22: i32 = v21.wrapping_sub(1i32);
    let mut v23: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v24: Rc<UH0> = from_21(v20.clone(), v22, v23.clone());
    let mut v25: serde_json::Value = v0.get(&*v6).cloned().unwrap_or_default();
    let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts"); } LIT.with(|lit| lit.clone()) };
    let mut v27: serde_json::Value = v25.get(&*v26).cloned().unwrap_or_default();
    let mut v28: i32 = v27.as_array().map_or(0, |a| a.len()) as i32;
    let mut v29: i32 = v28.wrapping_sub(1i32);
    let mut v30: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v31: Rc<UH0> = from_21(v27.clone(), v29, v30.clone());
    let mut v32: Rc<UH0> = method11(v24.clone(), v31.clone());
    let mut v33: Rc<UH0> = method11(v2.clone(), v32.clone());
    let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"role\":\"lookup\",\"author\":\"\",\"doc\":"); } LIT.with(|lit| lit.clone()) };
    let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v1));
    let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
    let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v36));
    let mut v38: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v39: Rc<UH0> = Rc::new(UH0::UH0_Cons(v37.clone(), v38.clone()));
    let mut v40: Rc<UH0> = method11(v5.clone(), v39.clone());
    (v33.clone(), v18.clone(), v4.clone(), v40.clone())
}
fn deepened_13(mut v0: Rc<str>, mut v1: US0, mut v2: i32, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: bool, mut v6: bool, mut v7: i32, mut v8: bool, mut v9: i32, mut v10: Rc<UH0>, mut v11: Rc<UH0>, mut v12: Rc<str>, mut v13: Rc<UH0>, mut v14: US2) -> (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let (mut v74, mut v75, mut v76, mut v77): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &v14 {
        US2::US2_Error(v15) => {
            let mut v15: US3 = v15.clone();
            let mut v48: Rc<str> = match &v15 {
                US3::US3_HttpStatus(v16, v17, v18) => {
                    let mut v16: i32 = *v16;
                    let mut v17: Rc<str> = v17.clone();
                    let mut v18: Rc<str> = v18.clone();
                    let mut v19: Rc<str> = Rc::<str>::from(format!("{:?}", v16));
                    let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                    let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v19));
                    let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                    let mut v23: Rc<str> = Rc::<str>::from(format!("{}{}", v21, v22));
                    let mut v24: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v17));
                    let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v26: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v25));
                    let mut v27: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v18));
                    v27.clone()
                }
                US3::US3_NoSuchAccount(v42) => {
                    let mut v42: Rc<str> = v42.clone();
                    let mut v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
                    let mut v44: Rc<str> = Rc::<str>::from(format!("{}{}", v43, v42));
                    v44.clone()
                }
                US3::US3_Transport(v28, v29) => {
                    let mut v28: Rc<str> = v28.clone();
                    let mut v29: Rc<str> = v29.clone();
                    let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
                    let mut v31: Rc<str> = Rc::<str>::from(format!("{}{}", v30, v28));
                    let mut v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v33: Rc<str> = Rc::<str>::from(format!("{}{}", v31, v32));
                    let mut v34: Rc<str> = Rc::<str>::from(format!("{}{}", v33, v29));
                    v34.clone()
                }
                US3::US3_Undecodable(v35, v36) => {
                    let mut v35: Rc<str> = v35.clone();
                    let mut v36: Rc<str> = v36.clone();
                    let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
                    let mut v38: Rc<str> = Rc::<str>::from(format!("{}{}", v37, v35));
                    let mut v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v40: Rc<str> = Rc::<str>::from(format!("{}{}", v38, v39));
                    let mut v41: Rc<str> = Rc::<str>::from(format!("{}{}", v40, v36));
                    v41.clone()
                }
            };
            (v10.clone(), v11.clone(), v48.clone(), v13.clone())
        }
        _ => {
            let (mut v70, mut v71, mut v72, mut v73): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &v14 {
                US2::US2_Ok(v49, v50) => {
                    let mut v49: serde_json::Value = v49.clone();
                    let mut v50: Rc<str> = v50.clone();
                    let mut v51: i32 = v9.wrapping_add(1i32);
                    let mut v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
                    let mut v53: serde_json::Value = v49.get(&*v52).cloned().unwrap_or_default();
                    let mut v54: i32 = v53.as_array().map_or(0, |a| a.len()) as i32;
                    let mut v55: i32 = v54.wrapping_sub(1i32);
                    let mut v56: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let mut v57: Rc<UH2> = from_14(v53.clone(), v55, v56.clone());
                    let mut v58: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let mut v59: Rc<UH0> = method16(v57.clone(), v58.clone());
                    let mut v60: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let mut v61: Rc<UH1> = method2(v59.clone(), v60.clone());
                    let (mut v62, mut v63, mut v64, mut v65): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = absorbed_17(v49.clone(), v50.clone(), v10.clone(), v11.clone(), v12.clone(), v13.clone());
                    deepen_3(v0.clone(), v1.clone(), v2, v3.clone(), v4.clone(), v5, v6, v7, v8, v51, v61.clone(), v62.clone(), v63.clone(), v64.clone(), v65.clone())
                }
                _ => unreachable!(),
            };
            (v70.clone(), v71.clone(), v72.clone(), v73.clone())
        }
    };
    (v74.clone(), v75.clone(), v76.clone(), v77.clone())
}
fn deepen_3(mut v0: Rc<str>, mut v1: US0, mut v2: i32, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: bool, mut v6: bool, mut v7: i32, mut v8: bool, mut v9: i32, mut v10: Rc<UH1>, mut v11: Rc<UH0>, mut v12: Rc<UH0>, mut v13: Rc<str>, mut v14: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let mut v15: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v16: Rc<UH1> = method4(v10.clone(), v15.clone());
    let (mut v30, mut v31, mut v32, mut v33): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &*v16 {
        UH1::UH1_Nil => {
            (v11.clone(), v12.clone(), v13.clone(), v14.clone())
        }
        _ => {
            let mut v17: bool = v9 >= v7;
            let (mut v26, mut v27, mut v28, mut v29): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = if v17 {
                (v11.clone(), v12.clone(), v13.clone(), v14.clone())
            } else {
                let mut v18: i32 = 100i32;
                let mut v19: Rc<UH1> = go_7(v18, v16.clone());
                let mut v20: Rc<str> = lookup_path_8(v19.clone(), v2, v3.clone(), v4.clone(), v5, v6, v7, v8);
                let mut v21: US2 = app_reply_12(v0.clone(), v1.clone(), v20.clone());
                let (mut v22, mut v23, mut v24, mut v25): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = deepened_13(v0.clone(), v1.clone(), v2, v3.clone(), v4.clone(), v5, v6, v7, v8, v9, v11.clone(), v12.clone(), v13.clone(), v14.clone(), v21.clone());
                (v22.clone(), v23.clone(), v24.clone(), v25.clone())
            };
            (v26.clone(), v27.clone(), v28.clone(), v29.clone())
        }
    };
    (v30.clone(), v31.clone(), v32.clone(), v33.clone())
}
fn method23(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: US5) -> US5 {
    match &*v1 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: US5 = method23(v0.clone(), v4.clone(), v2.clone());
            let mut v6: bool = v0.clone() == v3.clone();
            if v6 {
                US5::US5_Some(v3.clone())
            } else {
                v5.clone()
            }
        }
        UH0::UH0_Nil => {
            v2.clone()
        }
    }
}
fn method22(mut v0: Rc<UH0>, mut v1: Rc<UH0>, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: Rc<UH0>, mut v5: Rc<UH0>) -> Rc<UH0> {
    match &*v4 {
        UH0::UH0_Cons(v6, v7) => {
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH0> = v7.clone();
            let mut v8: Rc<UH0> = method22(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v7.clone(), v5.clone());
            let mut v9: bool = v6.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v16: bool = if v9 {
                let mut v10: US5 = US5::US5_None;
                let mut v11: US5 = method23(v6.clone(), v1.clone(), v10.clone());
                let mut v14: bool = match &v11 {
                    US5::US5_None => {
                        false
                    }
                    US5::US5_Some(v12) => {
                        let mut v12: Rc<str> = v12.clone();
                        true
                    }
                };
                let mut v15: bool = v14 == false;
                v15
            } else {
                false
            };
            if v16 {
                Rc::new(UH0::UH0_Cons(v6.clone(), v8.clone()))
            } else {
                v8.clone()
            }
        }
        UH0::UH0_Nil => {
            v5.clone()
        }
    }
}
fn method24(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
                let mut v4: US5 = US5::US5_None;
                let mut v5: US5 = method23(v2.clone(), v1.clone(), v4.clone());
                let mut v8: bool = match &v5 {
                    US5::US5_None => {
                        false
                    }
                    US5::US5_Some(v6) => {
                        let mut v6: Rc<str> = v6.clone();
                        true
                    }
                };
                let mut v12: Rc<UH0> = if v8 {
                    v1.clone()
                } else {
                    let mut v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let mut v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2.clone(), v9.clone()));
                    method11(v1.clone(), v10.clone())
                };
                (v0, v1) = (v3.clone(), v12.clone());
                continue;
            }
            UH0::UH0_Nil => {
                return v1.clone();
            }
        }
    }
}
fn traced_refs_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: i32, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: bool, mut v9: bool, mut v10: i32, mut v11: bool) -> (Rc<str>, Rc<str>, Rc<str>) {
    let mut v12: i32 = (v0.clone().len() as i32);
    let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let mut v14: bool = v0.ends_with(&*v13);
    let mut v17: Rc<str> = if v14 {
        let mut v15: i32 = v12.wrapping_sub(2i32);
        let mut v16: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v15 as i64);
        v16.clone()
    } else {
        v0.clone()
    };
    let mut v18: US0 = US0::US0_BearerToken(v1.clone());
    let mut v19: i32 = 1i32;
    let mut v20: bool = v2.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v24: Rc<UH0> = if v20 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_on_1(v22.clone(), v2.clone())
    };
    let mut v25: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v26: Rc<UH1> = method2(v24.clone(), v25.clone());
    let mut v27: bool = v3.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v31: Rc<UH0> = if v27 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_on_1(v29.clone(), v3.clone())
    };
    let mut v32: bool = v4.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v36: Rc<UH0> = if v32 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_on_1(v34.clone(), v4.clone())
    };
    let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v38: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let (mut v39, mut v40, mut v41, mut v42): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = deepen_3(v17.clone(), v18.clone(), v5, v6.clone(), v7.clone(), v8, v9, v10, v11, v19, v26.clone(), v31.clone(), v36.clone(), v37.clone(), v38.clone());
    let (mut v43, mut v44): (Rc<str>, Rc<str>) = method10(v42.clone(), v37.clone(), v37.clone());
    let mut v45: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v46: Rc<UH0> = method22(v39.clone(), v40.clone(), v41.clone(), v42.clone(), v39.clone(), v45.clone());
    let mut v47: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v48: Rc<UH0> = method24(v46.clone(), v47.clone());
    let (mut v49, mut v50): (Rc<str>, Rc<str>) = method10(v48.clone(), v37.clone(), v37.clone());
    (v43.clone(), v41.clone(), v49.clone())
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, bool) -> (Rc<str>, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, bool) -> (Rc<str>, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: i32, mut v6: bool| -> (Rc<str>, Rc<str>, Rc<str>) {
        let mut v7: i32 = 5i32;
        let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v9: bool = false;
        let mut v10: bool = false;
        traced_refs_0(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v7, v8.clone(), v8.clone(), v9, v10, v5, v6)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_refs(v0: &str, v1: &str, v2: &str, v3: &str, v4: &str, v5: i32, v6: bool) -> (Rc<str>, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), Rc::<str>::from(v3), Rc::<str>::from(v4), v5, v6)
}
