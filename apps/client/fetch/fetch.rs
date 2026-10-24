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
    UH1_Cons(Rc<str>, Rc<str>, Rc<UH1>),
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(Rc<str>, Rc<str>, Rc<UH0>, Rc<UH2>),
}
#[derive(Clone)]
enum US2 {
    US2_HttpStatus(i32, Rc<str>, Rc<str>),
    US2_Transport(Rc<str>, Rc<str>),
    US2_Undecodable(Rc<str>, Rc<str>),
    US2_NoSuchAccount(Rc<str>),
}
#[derive(Clone)]
enum US1 {
    US1_Ok(serde_json::Value, Rc<str>),
    US1_Error(US2),
}
#[derive(Clone)]
enum US3 {
    US3_Ok(serde_json::Value),
    US3_Error(US2),
}
#[derive(Clone)]
enum US4 {
    US4_Ok(Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>),
    US4_Error(Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>),
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
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let mut v6: i32 = v2.find(&*v5).map(|i| i as i32).unwrap_or(-1);
            let mut v7: Rc<str> = Rc::<str>::from(&(v2)[((0i32) as usize)..(((0i32) + (v6)) as usize)]);
            let mut v8: i32 = v6.wrapping_add(1i32);
            let mut v9: i32 = (v2.clone().len() as i32);
            let mut v10: i32 = v9.wrapping_sub(v6);
            let mut v11: i32 = v10.wrapping_sub(1i32);
            let mut v12: Rc<str> = Rc::<str>::from(&(v2)[((v8) as usize)..(((v8) + (v11)) as usize)]);
            Rc::new(UH1::UH1_Cons(v7.clone(), v12.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method5(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method5(v3.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v2.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method6(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method6(v4.clone(), v1.clone(), v2.clone());
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
fn posts_path_4(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: bool, mut v5: bool, mut v6: i32, mut v7: bool) -> Rc<str> {
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users/"); } LIT.with(|lit| lit.clone()) };
    let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v0));
    let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/tweets?max_results="); } LIT.with(|lit| lit.clone()) };
    let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v10));
    let mut v12: Rc<str> = Rc::<str>::from(format!("{:?}", v1));
    let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v12));
    let mut v16: Rc<str> = if v7 {
        let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&media.fields=type,alt_text"); } LIT.with(|lit| lit.clone()) };
        v14.clone()
    } else {
        let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v15.clone()
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
    let mut v30: Rc<UH0> = method5(v24.clone(), v29.clone());
    let mut v38: Rc<str> = match &*v30 {
        UH0::UH0_Nil => {
            let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v31.clone()
        }
        _ => {
            let mut v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v33, mut v34): (Rc<str>, Rc<str>) = method6(v30.clone(), v32.clone(), v32.clone());
            let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&expansions="); } LIT.with(|lit| lit.clone()) };
            let mut v36: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v33));
            let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v16));
            v37.clone()
        }
    };
    let mut v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&post.fields=created_at,author_id,public_metrics,entities,attachments"); } LIT.with(|lit| lit.clone()) };
    let mut v40: Rc<str> = Rc::<str>::from(format!("{}{}", v39, v38));
    let mut v41: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v40));
    let mut v42: bool = v2.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v46: Rc<str> = if v42 {
        let mut v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v43.clone()
    } else {
        let mut v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&start_time="); } LIT.with(|lit| lit.clone()) };
        let mut v45: Rc<str> = Rc::<str>::from(format!("{}{}", v44, v2));
        v45.clone()
    };
    let mut v47: bool = v3.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v51: Rc<str> = if v47 {
        let mut v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v48.clone()
    } else {
        let mut v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&end_time="); } LIT.with(|lit| lit.clone()) };
        let mut v50: Rc<str> = Rc::<str>::from(format!("{}{}", v49, v3));
        v50.clone()
    };
    let mut v52: Rc<str> = Rc::<str>::from(format!("{}{}", v46, v51));
    let mut v53: Rc<str> = Rc::<str>::from(format!("{}{}", v41, v52));
    let mut v60: Rc<str> = if v4 {
        if v5 {
            let mut v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&exclude=replies,retweets"); } LIT.with(|lit| lit.clone()) };
            v54.clone()
        } else {
            let mut v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&exclude=replies"); } LIT.with(|lit| lit.clone()) };
            v55.clone()
        }
    } else {
        if v5 {
            let mut v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&exclude=retweets"); } LIT.with(|lit| lit.clone()) };
            v57.clone()
        } else {
            let mut v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v58.clone()
        }
    };
    let mut v61: Rc<str> = Rc::<str>::from(format!("{}{}", v53, v60));
    v61.clone()
}
fn app_reply_7(mut v0: Rc<str>, mut v1: US0, mut v2: Rc<str>) -> US1 {
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
    let mut v68: US3 = if v12 {
        let mut v13: US2 = US2::US2_Transport(v2.clone(), v11.clone());
        US3::US3_Error(v13.clone())
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
            let mut v53: US2 = US2::US2_HttpStatus(v10, v2.clone(), v52.clone());
            US3::US3_Error(v53.clone())
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
                let mut v63: US2 = US2::US2_Undecodable(v2.clone(), v62.clone());
                US3::US3_Error(v63.clone())
            } else {
                US3::US3_Ok(v55.clone())
            }
        }
    };
    match &v68 {
        US3::US3_Error(v71) => {
            let mut v71: US2 = v71.clone();
            US1::US1_Error(v71.clone())
        }
        US3::US3_Ok(v69) => {
            let mut v69: serde_json::Value = v69.clone();
            US1::US1_Ok(v69.clone(), v11.clone())
        }
    }
}
fn from_10(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
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
fn from_9(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH2>) -> Rc<UH2> {
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
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("author_id"); } LIT.with(|lit| lit.clone()) };
            let mut v10: serde_json::Value = v5.get(&*v9).cloned().unwrap_or_default();
            let mut v11: Rc<str> = Rc::<str>::from(v10.as_str().unwrap_or(""));
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
            let mut v13: serde_json::Value = v5.get(&*v12).cloned().unwrap_or_default();
            let mut v14: i32 = v13.as_array().map_or(0, |a| a.len()) as i32;
            let mut v15: i32 = v14.wrapping_sub(1i32);
            let mut v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v17: Rc<UH0> = from_10(v13.clone(), v15, v16.clone());
            let mut v18: Rc<UH2> = Rc::new(UH2::UH2_Cons(v8.clone(), v11.clone(), v17.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v18.clone());
            continue;
        }
    }
}
fn method11(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4, v5) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH2> = v5.clone();
            let mut v6: Rc<UH2> = method11(v5.clone(), v1.clone());
            Rc::new(UH2::UH2_Cons(v2.clone(), v3.clone(), v4.clone(), v6.clone()))
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn from_12(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
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
            let mut v12: Rc<UH1> = Rc::new(UH1::UH1_Cons(v8.clone(), v11.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v12.clone());
            continue;
        }
    }
}
fn method13(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH1> = v4.clone();
            let mut v5: Rc<UH1> = method13(v4.clone(), v1.clone());
            let mut v6: bool = v3.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            if v6 {
                Rc::new(UH1::UH1_Cons(v2.clone(), v3.clone(), v5.clone()))
            } else {
                v5.clone()
            }
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method14(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH1> = v4.clone();
            let mut v5: Rc<UH0> = method14(v4.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v2.clone(), v5.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn add_primary_8(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: serde_json::Value, mut v3: Rc<str>, mut v4: Rc<UH2>, mut v5: Rc<UH2>, mut v6: Rc<UH0>, mut v7: Rc<UH0>, mut v8: Rc<str>, mut v9: Rc<UH0>) -> (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
    let mut v11: serde_json::Value = v2.get(&*v10).cloned().unwrap_or_default();
    let mut v12: i32 = v11.as_array().map_or(0, |a| a.len()) as i32;
    let mut v13: i32 = v12.wrapping_sub(1i32);
    let mut v14: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let mut v15: Rc<UH2> = from_9(v11.clone(), v13, v14.clone());
    let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"role\":\""); } LIT.with(|lit| lit.clone()) };
    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("primary"); } LIT.with(|lit| lit.clone()) };
    let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"role\":\"primary"); } LIT.with(|lit| lit.clone()) };
    let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\",\"author\":\""); } LIT.with(|lit| lit.clone()) };
    let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"role\":\"primary\",\"author\":\""); } LIT.with(|lit| lit.clone()) };
    let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v1));
    let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\",\"doc\":"); } LIT.with(|lit| lit.clone()) };
    let mut v23: Rc<str> = Rc::<str>::from(format!("{}{}", v21, v22));
    let mut v24: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v3));
    let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
    let mut v26: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v25));
    let mut v27: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v28: Rc<UH0> = Rc::new(UH0::UH0_Cons(v26.clone(), v27.clone()));
    let mut v29: Rc<UH0> = method5(v9.clone(), v28.clone());
    let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
    let mut v31: serde_json::Value = v2.get(&*v30).cloned().unwrap_or_default();
    let mut v32: serde_json::Value = v31.get(0i32 as usize).cloned().unwrap_or_default();
    let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
    let mut v34: serde_json::Value = v32.get(&*v33).cloned().unwrap_or_default();
    let mut v35: Rc<str> = Rc::<str>::from(v34.as_str().unwrap_or(""));
    let mut v36: bool = v35.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v40: Rc<str> = if v36 {
        v35.clone()
    } else {
        let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
        let mut v38: serde_json::Value = v32.get(&*v37).cloned().unwrap_or_default();
        let mut v39: Rc<str> = Rc::<str>::from(v38.as_str().unwrap_or(""));
        v39.clone()
    };
    let (mut v98, mut v99, mut v100, mut v101, mut v102, mut v103): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &*v15 {
        UH2::UH2_Nil => {
            let mut v41: bool = v40.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            if v41 {
                let mut v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("skipped @"); } LIT.with(|lit| lit.clone()) };
                let mut v43: Rc<str> = Rc::<str>::from(format!("{}{}", v42, v1));
                let mut v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                let mut v45: Rc<str> = Rc::<str>::from(format!("{}{}", v43, v44));
                let mut v46: Rc<str> = Rc::<str>::from(format!("{}{}", v45, v40));
                let mut v47: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let mut v48: Rc<UH0> = Rc::new(UH0::UH0_Cons(v46.clone(), v47.clone()));
                let mut v49: Rc<UH0> = method5(v7.clone(), v48.clone());
                (v4.clone(), v5.clone(), v6.clone(), v49.clone(), v8.clone(), v29.clone())
            } else {
                let mut v50: Rc<UH2> = method11(v15.clone(), v4.clone());
                let mut v51: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("includes"); } LIT.with(|lit| lit.clone()) };
                let mut v52: serde_json::Value = v2.get(&*v51).cloned().unwrap_or_default();
                let mut v53: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts"); } LIT.with(|lit| lit.clone()) };
                let mut v54: serde_json::Value = v52.get(&*v53).cloned().unwrap_or_default();
                let mut v55: i32 = v54.as_array().map_or(0, |a| a.len()) as i32;
                let mut v56: i32 = v55.wrapping_sub(1i32);
                let mut v57: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                let mut v58: Rc<UH2> = from_9(v54.clone(), v56, v57.clone());
                let mut v59: Rc<UH2> = method11(v5.clone(), v58.clone());
                let mut v60: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("users"); } LIT.with(|lit| lit.clone()) };
                let mut v61: serde_json::Value = v52.get(&*v60).cloned().unwrap_or_default();
                let mut v62: i32 = v61.as_array().map_or(0, |a| a.len()) as i32;
                let mut v63: i32 = v62.wrapping_sub(1i32);
                let mut v64: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                let mut v65: Rc<UH1> = from_12(v61.clone(), v63, v64.clone());
                let mut v66: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                let mut v67: Rc<UH1> = method13(v65.clone(), v66.clone());
                let mut v68: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let mut v69: Rc<UH0> = method14(v67.clone(), v68.clone());
                let mut v70: Rc<UH0> = method5(v6.clone(), v69.clone());
                (v50.clone(), v59.clone(), v70.clone(), v7.clone(), v8.clone(), v29.clone())
            }
        }
        _ => {
            let mut v77: Rc<UH2> = method11(v15.clone(), v4.clone());
            let mut v78: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("includes"); } LIT.with(|lit| lit.clone()) };
            let mut v79: serde_json::Value = v2.get(&*v78).cloned().unwrap_or_default();
            let mut v80: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts"); } LIT.with(|lit| lit.clone()) };
            let mut v81: serde_json::Value = v79.get(&*v80).cloned().unwrap_or_default();
            let mut v82: i32 = v81.as_array().map_or(0, |a| a.len()) as i32;
            let mut v83: i32 = v82.wrapping_sub(1i32);
            let mut v84: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let mut v85: Rc<UH2> = from_9(v81.clone(), v83, v84.clone());
            let mut v86: Rc<UH2> = method11(v5.clone(), v85.clone());
            let mut v87: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("users"); } LIT.with(|lit| lit.clone()) };
            let mut v88: serde_json::Value = v79.get(&*v87).cloned().unwrap_or_default();
            let mut v89: i32 = v88.as_array().map_or(0, |a| a.len()) as i32;
            let mut v90: i32 = v89.wrapping_sub(1i32);
            let mut v91: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v92: Rc<UH1> = from_12(v88.clone(), v90, v91.clone());
            let mut v93: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v94: Rc<UH1> = method13(v92.clone(), v93.clone());
            let mut v95: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v96: Rc<UH0> = method14(v94.clone(), v95.clone());
            let mut v97: Rc<UH0> = method5(v6.clone(), v96.clone());
            (v77.clone(), v86.clone(), v97.clone(), v7.clone(), v8.clone(), v29.clone())
        }
    };
    (v98.clone(), v99.clone(), v100.clone(), v101.clone(), v102.clone(), v103.clone())
}
fn gather_3(mut v0: Rc<str>, mut v1: US0, mut v2: i32, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: bool, mut v6: bool, mut v7: i32, mut v8: bool, mut v9: Rc<UH1>, mut v10: Rc<UH2>, mut v11: Rc<UH2>, mut v12: Rc<UH0>, mut v13: Rc<UH0>, mut v14: Rc<str>, mut v15: Rc<UH0>) -> (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let (mut v103, mut v104, mut v105, mut v106, mut v107, mut v108): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &*v9 {
        UH1::UH1_Nil => {
            (v10.clone(), v11.clone(), v12.clone(), v13.clone(), v14.clone(), v15.clone())
        }
        _ => {
            let (mut v97, mut v98, mut v99, mut v100, mut v101, mut v102): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &*v9 {
                UH1::UH1_Cons(v16, v17, v18) => {
                    let mut v16: Rc<str> = v16.clone();
                    let mut v17: Rc<str> = v17.clone();
                    let mut v18: Rc<UH1> = v18.clone();
                    let mut v19: Rc<str> = posts_path_4(v16.clone(), v2, v3.clone(), v4.clone(), v5, v6, v7, v8);
                    let mut v20: US1 = app_reply_7(v0.clone(), v1.clone(), v19.clone());
                    let mut v66: US4 = match &v20 {
                        US1::US1_Error(v30) => {
                            let mut v30: US2 = v30.clone();
                            let mut v63: Rc<str> = match &v30 {
                                US2::US2_HttpStatus(v31, v32, v33) => {
                                    let mut v31: i32 = *v31;
                                    let mut v32: Rc<str> = v32.clone();
                                    let mut v33: Rc<str> = v33.clone();
                                    let mut v34: Rc<str> = Rc::<str>::from(format!("{:?}", v31));
                                    let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                                    let mut v36: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v34));
                                    let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                                    let mut v38: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v37));
                                    let mut v39: Rc<str> = Rc::<str>::from(format!("{}{}", v38, v32));
                                    let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                                    let mut v41: Rc<str> = Rc::<str>::from(format!("{}{}", v39, v40));
                                    let mut v42: Rc<str> = Rc::<str>::from(format!("{}{}", v41, v33));
                                    v42.clone()
                                }
                                US2::US2_NoSuchAccount(v57) => {
                                    let mut v57: Rc<str> = v57.clone();
                                    let mut v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
                                    let mut v59: Rc<str> = Rc::<str>::from(format!("{}{}", v58, v57));
                                    v59.clone()
                                }
                                US2::US2_Transport(v43, v44) => {
                                    let mut v43: Rc<str> = v43.clone();
                                    let mut v44: Rc<str> = v44.clone();
                                    let mut v45: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
                                    let mut v46: Rc<str> = Rc::<str>::from(format!("{}{}", v45, v43));
                                    let mut v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                                    let mut v48: Rc<str> = Rc::<str>::from(format!("{}{}", v46, v47));
                                    let mut v49: Rc<str> = Rc::<str>::from(format!("{}{}", v48, v44));
                                    v49.clone()
                                }
                                US2::US2_Undecodable(v50, v51) => {
                                    let mut v50: Rc<str> = v50.clone();
                                    let mut v51: Rc<str> = v51.clone();
                                    let mut v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
                                    let mut v53: Rc<str> = Rc::<str>::from(format!("{}{}", v52, v50));
                                    let mut v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                                    let mut v55: Rc<str> = Rc::<str>::from(format!("{}{}", v53, v54));
                                    let mut v56: Rc<str> = Rc::<str>::from(format!("{}{}", v55, v51));
                                    v56.clone()
                                }
                            };
                            US4::US4_Error(v10.clone(), v11.clone(), v12.clone(), v13.clone(), v63.clone(), v15.clone())
                        }
                        US1::US1_Ok(v21, v22) => {
                            let mut v21: serde_json::Value = v21.clone();
                            let mut v22: Rc<str> = v22.clone();
                            let (mut v23, mut v24, mut v25, mut v26, mut v27, mut v28): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = add_primary_8(v16.clone(), v17.clone(), v21.clone(), v22.clone(), v10.clone(), v11.clone(), v12.clone(), v13.clone(), v14.clone(), v15.clone());
                            US4::US4_Ok(v23.clone(), v24.clone(), v25.clone(), v26.clone(), v27.clone(), v28.clone())
                        }
                    };
                    match &v66 {
                        US4::US4_Ok(v67, v68, v69, v70, v71, v72) => {
                            let mut v67: Rc<UH2> = v67.clone();
                            let mut v68: Rc<UH2> = v68.clone();
                            let mut v69: Rc<UH0> = v69.clone();
                            let mut v70: Rc<UH0> = v70.clone();
                            let mut v71: Rc<str> = v71.clone();
                            let mut v72: Rc<UH0> = v72.clone();
                            gather_3(v0.clone(), v1.clone(), v2, v3.clone(), v4.clone(), v5, v6, v7, v8, v18.clone(), v67.clone(), v68.clone(), v69.clone(), v70.clone(), v71.clone(), v72.clone())
                        }
                        _ => {
                            let (mut v85, mut v86, mut v87, mut v88, mut v89, mut v90): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &v66 {
                                US4::US4_Error(v79, v80, v81, v82, v83, v84) => {
                                    let mut v79: Rc<UH2> = v79.clone();
                                    let mut v80: Rc<UH2> = v80.clone();
                                    let mut v81: Rc<UH0> = v81.clone();
                                    let mut v82: Rc<UH0> = v82.clone();
                                    let mut v83: Rc<str> = v83.clone();
                                    let mut v84: Rc<UH0> = v84.clone();
                                    (v79.clone(), v80.clone(), v81.clone(), v82.clone(), v83.clone(), v84.clone())
                                }
                                _ => unreachable!(),
                            };
                            (v85.clone(), v86.clone(), v87.clone(), v88.clone(), v89.clone(), v90.clone())
                        }
                    }
                }
                _ => unreachable!(),
            };
            (v97.clone(), v98.clone(), v99.clone(), v100.clone(), v101.clone(), v102.clone())
        }
    };
    (v103.clone(), v104.clone(), v105.clone(), v106.clone(), v107.clone(), v108.clone())
}
fn method15(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method15(v4.clone(), v1.clone(), v2.clone());
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v6));
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v5));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
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
fn method16(mut v0: Rc<UH2>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4, v5) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH2> = v5.clone();
            let mut v6: Rc<UH0> = method16(v5.clone(), v1.clone());
            method5(v4.clone(), v6.clone())
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn method17(mut v0: Rc<UH2>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4, v5) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH2> = v5.clone();
            let mut v6: Rc<UH0> = method17(v5.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v3.clone(), v6.clone()))
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn fetched_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: i32, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: bool, mut v7: bool, mut v8: i32, mut v9: bool) -> (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) {
    let mut v10: i32 = (v0.clone().len() as i32);
    let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let mut v12: bool = v0.ends_with(&*v11);
    let mut v15: Rc<str> = if v12 {
        let mut v13: i32 = v10.wrapping_sub(2i32);
        let mut v14: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v13 as i64);
        v14.clone()
    } else {
        v0.clone()
    };
    let mut v16: US0 = US0::US0_BearerToken(v1.clone());
    let mut v17: bool = v2.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v21: Rc<UH0> = if v17 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
        split_on_1(v19.clone(), v2.clone())
    };
    let mut v22: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v23: Rc<UH1> = method2(v21.clone(), v22.clone());
    let mut v24: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let mut v25: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let mut v26: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v27: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v29: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let (mut v30, mut v31, mut v32, mut v33, mut v34, mut v35): (Rc<UH2>, Rc<UH2>, Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = gather_3(v15.clone(), v16.clone(), v3, v4.clone(), v5.clone(), v6, v7, v8, v9, v23.clone(), v24.clone(), v25.clone(), v26.clone(), v27.clone(), v28.clone(), v29.clone());
    let (mut v36, mut v37): (Rc<str>, Rc<str>) = method6(v35.clone(), v28.clone(), v28.clone());
    let (mut v38, mut v39): (Rc<str>, Rc<str>) = method15(v33.clone(), v28.clone(), v28.clone());
    let mut v40: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v41: Rc<UH0> = method16(v30.clone(), v40.clone());
    let (mut v42, mut v43): (Rc<str>, Rc<str>) = method6(v41.clone(), v28.clone(), v28.clone());
    let mut v44: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v45: Rc<UH0> = method17(v31.clone(), v44.clone());
    let (mut v46, mut v47): (Rc<str>, Rc<str>) = method6(v45.clone(), v28.clone(), v28.clone());
    let (mut v48, mut v49): (Rc<str>, Rc<str>) = method6(v32.clone(), v28.clone(), v28.clone());
    (v36.clone(), v38.clone(), v34.clone(), v42.clone(), v46.clone(), v48.clone())
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) -> (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) -> (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: i32, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: bool, mut v7: bool, mut v8: i32, mut v9: bool| -> (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) {
        fetched_0(v0.clone(), v1.clone(), v2.clone(), v3, v4.clone(), v5.clone(), v6, v7, v8, v9)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_fetch(v0: &str, v1: &str, v2: &str, v3: i32, v4: &str, v5: &str, v6: bool, v7: bool, v8: i32, v9: bool) -> (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), v3, Rc::<str>::from(v4), Rc::<str>::from(v5), v6, v7, v8, v9)
}
