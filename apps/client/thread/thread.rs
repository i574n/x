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
    US4_Ok(Rc<str>, Rc<str>, Rc<str>, Rc<str>),
    US4_Error(US2),
}
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
#[derive(Clone)]
enum US5 {
    US5_Ok(Rc<UH0>),
    US5_Error(US2),
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(Rc<str>, Rc<str>, Rc<str>, Rc<UH2>),
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<str>, Rc<UH0>, Rc<UH2>, Rc<str>, Rc<UH1>),
}
fn app_reply_1(mut v0: Rc<str>, mut v1: US0, mut v2: Rc<str>) -> US1 {
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
fn method4(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method4(v3.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v2.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn paged_3(mut v0: Rc<str>, mut v1: US0, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<UH0>) -> US5 {
    loop {
        let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/search/all?query=conversation_id%3A"); } LIT.with(|lit| lit.clone()) };
        let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v2));
        let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("%20from%3A"); } LIT.with(|lit| lit.clone()) };
        let mut v10: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v9));
        let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v3));
        let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&start_time="); } LIT.with(|lit| lit.clone()) };
        let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v12));
        let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v4));
        let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&max_results=100&post.fields=conversation_id,entities,referenced_posts"); } LIT.with(|lit| lit.clone()) };
        let mut v16: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v15));
        let mut v17: bool = v5.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v21: Rc<str> = if v17 {
            v16.clone()
        } else {
            let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&next_token="); } LIT.with(|lit| lit.clone()) };
            let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v18));
            let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v5));
            v20.clone()
        };
        let mut v22: US1 = app_reply_1(v0.clone(), v1.clone(), v21.clone());
        match &v22 {
            US1::US1_Error(v37) => {
                let mut v37: US2 = v37.clone();
                return US5::US5_Error(v37.clone());
            }
            US1::US1_Ok(v23, v24) => {
                let mut v23: serde_json::Value = v23.clone();
                let mut v24: Rc<str> = v24.clone();
                let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("meta"); } LIT.with(|lit| lit.clone()) };
                let mut v26: serde_json::Value = v23.get(&*v25).cloned().unwrap_or_default();
                let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("next_token"); } LIT.with(|lit| lit.clone()) };
                let mut v28: serde_json::Value = v26.get(&*v27).cloned().unwrap_or_default();
                let mut v29: Rc<str> = Rc::<str>::from(v28.as_str().unwrap_or(""));
                let mut v30: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let mut v31: Rc<UH0> = Rc::new(UH0::UH0_Cons(v24.clone(), v30.clone()));
                let mut v32: Rc<UH0> = method4(v6.clone(), v31.clone());
                let mut v33: bool = v29.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                if v33 {
                    return US5::US5_Ok(v32.clone());
                } else {
                    (v0, v1, v2, v3, v4, v5, v6) = (v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v29.clone(), v32.clone());
                    continue;
                }
            }
        }
    }
}
fn rooted_2(mut v0: Rc<str>, mut v1: US0, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>) -> US5 {
    let mut v7: i32 = (v5.clone().len() as i32);
    let mut v8: bool = v7 < 19i32;
    let mut v12: Rc<str> = if v8 {
        v5.clone()
    } else {
        let mut v9: Rc<str> = Rc::<str>::from(&(v5)[((0i32) as usize)..(((0i32) + (19i32)) as usize)]);
        let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Z"); } LIT.with(|lit| lit.clone()) };
        let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v10));
        v11.clone()
    };
    let mut v13: bool = v3.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    if v13 {
        let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v15: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        paged_3(v0.clone(), v1.clone(), v3.clone(), v4.clone(), v12.clone(), v14.clone(), v15.clone())
    } else {
        let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/"); } LIT.with(|lit| lit.clone()) };
        let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v2));
        let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("?post.fields=conversation_id,author_id,created_at"); } LIT.with(|lit| lit.clone()) };
        let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v19));
        let mut v21: US2 = US2::US2_HttpStatus(404i32, v20.clone(), v6.clone());
        US5::US5_Error(v21.clone())
    }
}
fn method5(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method5(v4.clone(), v1.clone(), v2.clone());
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
fn pages_of_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> (i32, Rc<str>, Rc<str>) {
    let mut v3: i32 = (v0.clone().len() as i32);
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let mut v5: bool = v0.ends_with(&*v4);
    let mut v8: Rc<str> = if v5 {
        let mut v6: i32 = v3.wrapping_sub(2i32);
        let mut v7: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v6 as i64);
        v7.clone()
    } else {
        v0.clone()
    };
    let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/"); } LIT.with(|lit| lit.clone()) };
    let mut v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v2));
    let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("?post.fields=conversation_id,author_id,created_at"); } LIT.with(|lit| lit.clone()) };
    let mut v12: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v11));
    let mut v13: US0 = US0::US0_BearerToken(v1.clone());
    let mut v14: US1 = app_reply_1(v8.clone(), v13.clone(), v12.clone());
    let mut v43: US4 = match &v14 {
        US1::US1_Error(v40) => {
            let mut v40: US2 = v40.clone();
            US4::US4_Error(v40.clone())
        }
        US1::US1_Ok(v15, v16) => {
            let mut v15: serde_json::Value = v15.clone();
            let mut v16: Rc<str> = v16.clone();
            let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v18: serde_json::Value = v15.get(&*v17).cloned().unwrap_or_default();
            let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("conversation_id"); } LIT.with(|lit| lit.clone()) };
            let mut v20: serde_json::Value = v18.get(&*v19).cloned().unwrap_or_default();
            let mut v21: Rc<str> = Rc::<str>::from(v20.as_str().unwrap_or(""));
            let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("author_id"); } LIT.with(|lit| lit.clone()) };
            let mut v23: serde_json::Value = v18.get(&*v22).cloned().unwrap_or_default();
            let mut v24: Rc<str> = Rc::<str>::from(v23.as_str().unwrap_or(""));
            let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("created_at"); } LIT.with(|lit| lit.clone()) };
            let mut v26: serde_json::Value = v18.get(&*v25).cloned().unwrap_or_default();
            let mut v27: Rc<str> = Rc::<str>::from(v26.as_str().unwrap_or(""));
            let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
            let mut v29: serde_json::Value = v15.get(&*v28).cloned().unwrap_or_default();
            let mut v30: serde_json::Value = v29.get(0i32 as usize).cloned().unwrap_or_default();
            let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
            let mut v32: serde_json::Value = v30.get(&*v31).cloned().unwrap_or_default();
            let mut v33: Rc<str> = Rc::<str>::from(v32.as_str().unwrap_or(""));
            let mut v34: bool = v33.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v38: Rc<str> = if v34 {
                v33.clone()
            } else {
                let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
                let mut v36: serde_json::Value = v30.get(&*v35).cloned().unwrap_or_default();
                let mut v37: Rc<str> = Rc::<str>::from(v36.as_str().unwrap_or(""));
                v37.clone()
            };
            US4::US4_Ok(v21.clone(), v24.clone(), v27.clone(), v38.clone())
        }
    };
    let mut v44: US0 = US0::US0_BearerToken(v1.clone());
    let mut v53: US5 = match &v43 {
        US4::US4_Error(v50) => {
            let mut v50: US2 = v50.clone();
            US5::US5_Error(v50.clone())
        }
        US4::US4_Ok(v45, v46, v47, v48) => {
            let mut v45: Rc<str> = v45.clone();
            let mut v46: Rc<str> = v46.clone();
            let mut v47: Rc<str> = v47.clone();
            let mut v48: Rc<str> = v48.clone();
            rooted_2(v8.clone(), v44.clone(), v2.clone(), v45.clone(), v46.clone(), v47.clone(), v48.clone())
        }
    };
    match &v53 {
        US5::US5_Error(v62) => {
            let mut v62: US2 = v62.clone();
            let mut v95: Rc<str> = match &v62 {
                US2::US2_HttpStatus(v63, v64, v65) => {
                    let mut v63: i32 = *v63;
                    let mut v64: Rc<str> = v64.clone();
                    let mut v65: Rc<str> = v65.clone();
                    let mut v66: Rc<str> = Rc::<str>::from(format!("{:?}", v63));
                    let mut v67: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                    let mut v68: Rc<str> = Rc::<str>::from(format!("{}{}", v67, v66));
                    let mut v69: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                    let mut v70: Rc<str> = Rc::<str>::from(format!("{}{}", v68, v69));
                    let mut v71: Rc<str> = Rc::<str>::from(format!("{}{}", v70, v64));
                    let mut v72: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v73: Rc<str> = Rc::<str>::from(format!("{}{}", v71, v72));
                    let mut v74: Rc<str> = Rc::<str>::from(format!("{}{}", v73, v65));
                    v74.clone()
                }
                US2::US2_NoSuchAccount(v89) => {
                    let mut v89: Rc<str> = v89.clone();
                    let mut v90: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
                    let mut v91: Rc<str> = Rc::<str>::from(format!("{}{}", v90, v89));
                    v91.clone()
                }
                US2::US2_Transport(v75, v76) => {
                    let mut v75: Rc<str> = v75.clone();
                    let mut v76: Rc<str> = v76.clone();
                    let mut v77: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
                    let mut v78: Rc<str> = Rc::<str>::from(format!("{}{}", v77, v75));
                    let mut v79: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v80: Rc<str> = Rc::<str>::from(format!("{}{}", v78, v79));
                    let mut v81: Rc<str> = Rc::<str>::from(format!("{}{}", v80, v76));
                    v81.clone()
                }
                US2::US2_Undecodable(v82, v83) => {
                    let mut v82: Rc<str> = v82.clone();
                    let mut v83: Rc<str> = v83.clone();
                    let mut v84: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
                    let mut v85: Rc<str> = Rc::<str>::from(format!("{}{}", v84, v82));
                    let mut v86: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v87: Rc<str> = Rc::<str>::from(format!("{}{}", v85, v86));
                    let mut v88: Rc<str> = Rc::<str>::from(format!("{}{}", v87, v83));
                    v88.clone()
                }
            };
            let mut v96: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (4i32, v96.clone(), v95.clone())
        }
        US5::US5_Ok(v54) => {
            let mut v54: Rc<UH0> = v54.clone();
            let mut v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v56, mut v57): (Rc<str>, Rc<str>) = method5(v54.clone(), v55.clone(), v55.clone());
            let mut v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
            let mut v59: Rc<str> = Rc::<str>::from(format!("{}{}", v58, v56));
            let mut v60: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
            let mut v61: Rc<str> = Rc::<str>::from(format!("{}{}", v59, v60));
            (0i32, v61.clone(), v55.clone())
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>) {
        pages_of_0(v0.clone(), v1.clone(), v2.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn from_9(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
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
fn from_10(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH2>) -> Rc<UH2> {
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
fn from_8(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
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
            let mut v17: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v18: Rc<UH0> = from_9(v14.clone(), v16, v17.clone());
            let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("entities"); } LIT.with(|lit| lit.clone()) };
            let mut v20: serde_json::Value = v5.get(&*v19).cloned().unwrap_or_default();
            let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("urls"); } LIT.with(|lit| lit.clone()) };
            let mut v22: serde_json::Value = v20.get(&*v21).cloned().unwrap_or_default();
            let mut v23: i32 = v22.as_array().map_or(0, |a| a.len()) as i32;
            let mut v24: i32 = v23.wrapping_sub(1i32);
            let mut v25: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let mut v26: Rc<UH2> = from_10(v22.clone(), v24, v25.clone());
            let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
            let mut v28: serde_json::Value = v5.get(&*v27).cloned().unwrap_or_default();
            let mut v29: Rc<str> = Rc::<str>::from(v28.as_array().and_then(|a| a.iter().find(|r| r["type"] == "replied_to")).and_then(|r| r["id"].as_str()).unwrap_or(""));
            let mut v30: Rc<UH1> = Rc::new(UH1::UH1_Cons(v8.clone(), v12.clone(), v18.clone(), v26.clone(), v29.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v30.clone());
            continue;
        }
    }
}
fn method12(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
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
fn method11(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH2> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH1> = v7.clone();
            let mut v8: Rc<UH1> = method11(v7.clone(), v1.clone());
            let mut v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v10: Rc<UH0> = method12(v4.clone(), v9.clone());
            let mut v15: bool = match &*v10 {
                UH0::UH0_Cons(v11, v12) => {
                    let mut v11: Rc<str> = v11.clone();
                    let mut v12: Rc<UH0> = v12.clone();
                    let mut v13: bool = v11.clone() == v2.clone();
                    v13
                }
                UH0::UH0_Nil => {
                    true
                }
            };
            if v15 {
                Rc::new(UH1::UH1_Cons(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v8.clone()))
            } else {
                v8.clone()
            }
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method13(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH2> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH1> = v7.clone();
            let mut v8: Rc<UH0> = method13(v7.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v2.clone(), v8.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method7(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method7(v3.clone(), v1.clone());
            let mut v5: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v2).unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: i32 = v7.as_array().map_or(0, |a| a.len()) as i32;
            let mut v9: i32 = v8.wrapping_sub(1i32);
            let mut v10: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v11: Rc<UH1> = from_8(v7.clone(), v9, v10.clone());
            let mut v12: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v13: Rc<UH1> = method11(v11.clone(), v12.clone());
            let mut v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v15: Rc<UH0> = method13(v13.clone(), v14.clone());
            method4(v15.clone(), v4.clone())
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method14(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method14(v4.clone(), v1.clone(), v2.clone());
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
fn ids_of_6(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> (i32, Rc<str>, Rc<str>) {
    let mut v3: i32 = (v0.clone().len() as i32);
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let mut v5: bool = v0.ends_with(&*v4);
    let mut v8: Rc<str> = if v5 {
        let mut v6: i32 = v3.wrapping_sub(2i32);
        let mut v7: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v6 as i64);
        v7.clone()
    } else {
        v0.clone()
    };
    let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/"); } LIT.with(|lit| lit.clone()) };
    let mut v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v2));
    let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("?post.fields=conversation_id,author_id,created_at"); } LIT.with(|lit| lit.clone()) };
    let mut v12: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v11));
    let mut v13: US0 = US0::US0_BearerToken(v1.clone());
    let mut v14: US1 = app_reply_1(v8.clone(), v13.clone(), v12.clone());
    let mut v43: US4 = match &v14 {
        US1::US1_Error(v40) => {
            let mut v40: US2 = v40.clone();
            US4::US4_Error(v40.clone())
        }
        US1::US1_Ok(v15, v16) => {
            let mut v15: serde_json::Value = v15.clone();
            let mut v16: Rc<str> = v16.clone();
            let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v18: serde_json::Value = v15.get(&*v17).cloned().unwrap_or_default();
            let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("conversation_id"); } LIT.with(|lit| lit.clone()) };
            let mut v20: serde_json::Value = v18.get(&*v19).cloned().unwrap_or_default();
            let mut v21: Rc<str> = Rc::<str>::from(v20.as_str().unwrap_or(""));
            let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("author_id"); } LIT.with(|lit| lit.clone()) };
            let mut v23: serde_json::Value = v18.get(&*v22).cloned().unwrap_or_default();
            let mut v24: Rc<str> = Rc::<str>::from(v23.as_str().unwrap_or(""));
            let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("created_at"); } LIT.with(|lit| lit.clone()) };
            let mut v26: serde_json::Value = v18.get(&*v25).cloned().unwrap_or_default();
            let mut v27: Rc<str> = Rc::<str>::from(v26.as_str().unwrap_or(""));
            let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
            let mut v29: serde_json::Value = v15.get(&*v28).cloned().unwrap_or_default();
            let mut v30: serde_json::Value = v29.get(0i32 as usize).cloned().unwrap_or_default();
            let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
            let mut v32: serde_json::Value = v30.get(&*v31).cloned().unwrap_or_default();
            let mut v33: Rc<str> = Rc::<str>::from(v32.as_str().unwrap_or(""));
            let mut v34: bool = v33.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v38: Rc<str> = if v34 {
                v33.clone()
            } else {
                let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
                let mut v36: serde_json::Value = v30.get(&*v35).cloned().unwrap_or_default();
                let mut v37: Rc<str> = Rc::<str>::from(v36.as_str().unwrap_or(""));
                v37.clone()
            };
            US4::US4_Ok(v21.clone(), v24.clone(), v27.clone(), v38.clone())
        }
    };
    let mut v44: US0 = US0::US0_BearerToken(v1.clone());
    let mut v53: US5 = match &v43 {
        US4::US4_Error(v50) => {
            let mut v50: US2 = v50.clone();
            US5::US5_Error(v50.clone())
        }
        US4::US4_Ok(v45, v46, v47, v48) => {
            let mut v45: Rc<str> = v45.clone();
            let mut v46: Rc<str> = v46.clone();
            let mut v47: Rc<str> = v47.clone();
            let mut v48: Rc<str> = v48.clone();
            rooted_2(v8.clone(), v44.clone(), v2.clone(), v45.clone(), v46.clone(), v47.clone(), v48.clone())
        }
    };
    match &v53 {
        US5::US5_Error(v60) => {
            let mut v60: US2 = v60.clone();
            let mut v93: Rc<str> = match &v60 {
                US2::US2_HttpStatus(v61, v62, v63) => {
                    let mut v61: i32 = *v61;
                    let mut v62: Rc<str> = v62.clone();
                    let mut v63: Rc<str> = v63.clone();
                    let mut v64: Rc<str> = Rc::<str>::from(format!("{:?}", v61));
                    let mut v65: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                    let mut v66: Rc<str> = Rc::<str>::from(format!("{}{}", v65, v64));
                    let mut v67: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                    let mut v68: Rc<str> = Rc::<str>::from(format!("{}{}", v66, v67));
                    let mut v69: Rc<str> = Rc::<str>::from(format!("{}{}", v68, v62));
                    let mut v70: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v71: Rc<str> = Rc::<str>::from(format!("{}{}", v69, v70));
                    let mut v72: Rc<str> = Rc::<str>::from(format!("{}{}", v71, v63));
                    v72.clone()
                }
                US2::US2_NoSuchAccount(v87) => {
                    let mut v87: Rc<str> = v87.clone();
                    let mut v88: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
                    let mut v89: Rc<str> = Rc::<str>::from(format!("{}{}", v88, v87));
                    v89.clone()
                }
                US2::US2_Transport(v73, v74) => {
                    let mut v73: Rc<str> = v73.clone();
                    let mut v74: Rc<str> = v74.clone();
                    let mut v75: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
                    let mut v76: Rc<str> = Rc::<str>::from(format!("{}{}", v75, v73));
                    let mut v77: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v78: Rc<str> = Rc::<str>::from(format!("{}{}", v76, v77));
                    let mut v79: Rc<str> = Rc::<str>::from(format!("{}{}", v78, v74));
                    v79.clone()
                }
                US2::US2_Undecodable(v80, v81) => {
                    let mut v80: Rc<str> = v80.clone();
                    let mut v81: Rc<str> = v81.clone();
                    let mut v82: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
                    let mut v83: Rc<str> = Rc::<str>::from(format!("{}{}", v82, v80));
                    let mut v84: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v85: Rc<str> = Rc::<str>::from(format!("{}{}", v83, v84));
                    let mut v86: Rc<str> = Rc::<str>::from(format!("{}{}", v85, v81));
                    v86.clone()
                }
            };
            let mut v94: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (4i32, v94.clone(), v93.clone())
        }
        US5::US5_Ok(v54) => {
            let mut v54: Rc<UH0> = v54.clone();
            let mut v55: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v56: Rc<UH0> = method7(v54.clone(), v55.clone());
            let mut v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v58, mut v59): (Rc<str>, Rc<str>) = method14(v56.clone(), v57.clone(), v57.clone());
            (0i32, v58.clone(), v57.clone())
        }
    }
}
fn closure1() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>) {
        ids_of_6(v0.clone(), v1.clone(), v2.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_thread_pages(v0: &str, v1: &str, v2: &str) -> (i32, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2))
}
pub fn xc_thread_ids(v0: &str, v1: &str, v2: &str) -> (i32, Rc<str>, Rc<str>) {
    closure1()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2))
}
