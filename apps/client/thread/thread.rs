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
#[derive(Clone)]
enum US1 {
    US1_HttpStatus(i32, Rc<str>, Rc<str>),
    US1_Transport(Rc<str>, Rc<str>),
    US1_Undecodable(Rc<str>, Rc<str>),
    US1_NoSuchAccount(Rc<str>),
}
#[derive(Clone)]
enum US0 {
    US0_Ok(Rc<UH0>),
    US0_Error(US1),
}
#[derive(Clone)]
enum US2 {
    US2_BearerToken(Rc<str>),
}
#[derive(Clone)]
enum US3 {
    US3_Ok(Rc<str>, Rc<str>),
    US3_Error(US1),
}
#[derive(Clone)]
enum US4 {
    US4_Ok(serde_json::Value, Rc<str>),
    US4_Error(US1),
}
#[derive(Clone)]
enum US5 {
    US5_Ok(serde_json::Value),
    US5_Error(US1),
}
#[derive(Clone)]
enum US6 {
    US6_Ok(Rc<str>, Rc<str>, Rc<str>, Rc<str>),
    US6_Error(US1),
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(Rc<str>, Rc<UH2>),
}
#[derive(Clone)]
enum UH3 {
    UH3_Nil,
    UH3_Cons(Rc<str>, Rc<str>, Rc<str>, Rc<UH3>),
}
#[derive(Clone)]
enum US7 {
    US7_Some(Rc<str>),
    US7_None,
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, US7, Rc<UH1>),
}
fn method3(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method3(v3.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v2.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn paged_2(mut v0: Rc<dyn Fn(Rc<str>) -> US3>, mut v1: Rc<str>, mut v2: Rc<UH0>) -> US0 {
    loop {
        let mut v3: US3 = v0(v1.clone());
        match &v3 {
            US3::US3_Error(v13) => {
                let mut v13: US1 = v13.clone();
                return US0::US0_Error(v13.clone());
            }
            US3::US3_Ok(v4, v5) => {
                let mut v4: Rc<str> = v4.clone();
                let mut v5: Rc<str> = v5.clone();
                let mut v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let mut v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v5.clone(), v6.clone()));
                let mut v8: Rc<UH0> = method3(v2.clone(), v7.clone());
                let mut v9: bool = v4.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                if v9 {
                    return US0::US0_Ok(v8.clone());
                } else {
                    (v0, v1, v2) = (v0.clone(), v4.clone(), v8.clone());
                    continue;
                }
            }
        }
    }
}
fn app_reply_4(mut v0: Rc<str>, mut v1: US2, mut v2: Rc<str>) -> US4 {
    let mut v3: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v2));
    let mut v7: Rc<str> = match &v1 {
        US2::US2_BearerToken(v4) => {
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
    let mut v68: US5 = if v12 {
        let mut v13: US1 = US1::US1_Transport(v2.clone(), v11.clone());
        US5::US5_Error(v13.clone())
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
            let mut v53: US1 = US1::US1_HttpStatus(v10, v2.clone(), v52.clone());
            US5::US5_Error(v53.clone())
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
                let mut v63: US1 = US1::US1_Undecodable(v2.clone(), v62.clone());
                US5::US5_Error(v63.clone())
            } else {
                US5::US5_Ok(v55.clone())
            }
        }
    };
    match &v68 {
        US5::US5_Error(v71) => {
            let mut v71: US1 = v71.clone();
            US4::US4_Error(v71.clone())
        }
        US5::US5_Ok(v69) => {
            let mut v69: serde_json::Value = v69.clone();
            US4::US4_Ok(v69.clone(), v11.clone())
        }
    }
}
fn closure1(mut v0: Rc<str>, mut v1: US2, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> US3> {
    Rc::new(move |mut v5: Rc<str>| -> US3 {
        let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/search/all?query=conversation_id%3A"); } LIT.with(|lit| lit.clone()) };
        let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v2));
        let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("%20from%3A"); } LIT.with(|lit| lit.clone()) };
        let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v8));
        let mut v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v3));
        let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&start_time="); } LIT.with(|lit| lit.clone()) };
        let mut v12: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v11));
        let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v4));
        let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&max_results=100&post.fields=conversation_id,entities,referenced_posts"); } LIT.with(|lit| lit.clone()) };
        let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v14));
        let mut v16: bool = v5.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v20: Rc<str> = if v16 {
            v15.clone()
        } else {
            let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&next_token="); } LIT.with(|lit| lit.clone()) };
            let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v17));
            let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v5));
            v19.clone()
        };
        let mut v21: US4 = app_reply_4(v0.clone(), v1.clone(), v20.clone());
        match &v21 {
            US4::US4_Error(v30) => {
                let mut v30: US1 = v30.clone();
                US3::US3_Error(v30.clone())
            }
            US4::US4_Ok(v22, v23) => {
                let mut v22: serde_json::Value = v22.clone();
                let mut v23: Rc<str> = v23.clone();
                let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("meta"); } LIT.with(|lit| lit.clone()) };
                let mut v25: serde_json::Value = v22.get(&*v24).cloned().unwrap_or_default();
                let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("next_token"); } LIT.with(|lit| lit.clone()) };
                let mut v27: serde_json::Value = v25.get(&*v26).cloned().unwrap_or_default();
                let mut v28: Rc<str> = Rc::<str>::from(v27.as_str().unwrap_or(""));
                US3::US3_Ok(v28.clone(), v23.clone())
            }
        }
    })
}
fn rooted_1(mut v0: Rc<str>, mut v1: US2, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>) -> US0 {
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
        let mut v14: Rc<dyn Fn(Rc<str>) -> US3> = closure1(v0.clone(), v1.clone(), v3.clone(), v4.clone(), v12.clone());
        let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        paged_2(v14.clone(), v15.clone(), v16.clone())
    } else {
        let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/"); } LIT.with(|lit| lit.clone()) };
        let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v2));
        let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("?post.fields=conversation_id,author_id,created_at"); } LIT.with(|lit| lit.clone()) };
        let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v20));
        let mut v22: US1 = US1::US1_HttpStatus(404i32, v21.clone(), v6.clone());
        US0::US0_Error(v22.clone())
    }
}
fn thread_bodies_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> US0 {
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
    let mut v13: US2 = US2::US2_BearerToken(v1.clone());
    let mut v14: US4 = app_reply_4(v8.clone(), v13.clone(), v12.clone());
    let mut v43: US6 = match &v14 {
        US4::US4_Error(v40) => {
            let mut v40: US1 = v40.clone();
            US6::US6_Error(v40.clone())
        }
        US4::US4_Ok(v15, v16) => {
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
            US6::US6_Ok(v21.clone(), v24.clone(), v27.clone(), v38.clone())
        }
    };
    let mut v44: US2 = US2::US2_BearerToken(v1.clone());
    match &v43 {
        US6::US6_Error(v50) => {
            let mut v50: US1 = v50.clone();
            US0::US0_Error(v50.clone())
        }
        US6::US6_Ok(v45, v46, v47, v48) => {
            let mut v45: Rc<str> = v45.clone();
            let mut v46: Rc<str> = v46.clone();
            let mut v47: Rc<str> = v47.clone();
            let mut v48: Rc<str> = v48.clone();
            rooted_1(v8.clone(), v44.clone(), v2.clone(), v45.clone(), v46.clone(), v47.clone(), v48.clone())
        }
    }
}
fn method6(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<str>, mut v3: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v1 {
        UH0::UH0_Cons(v4, v5) => {
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH0> = v5.clone();
            let (mut v6, mut v7): (Rc<str>, Rc<str>) = method6(v0.clone(), v5.clone(), v2.clone(), v3.clone());
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v7));
            let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v6));
            (v9.clone(), v0.clone())
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v1 {
                UH0::UH0_Nil => {
                    (v2.clone(), v3.clone())
                }
                _ => unreachable!(),
            };
            (v10.clone(), v11.clone())
        }
    };
    (v12.clone(), v13.clone())
}
fn delimited_5(mut v0: Rc<str>, mut v1: Rc<UH0>) -> Rc<str> {
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v3, mut v4): (Rc<str>, Rc<str>) = method6(v0.clone(), v1.clone(), v2.clone(), v2.clone());
    v3.clone()
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>) {
        let mut v3: US0 = thread_bodies_0(v0.clone(), v1.clone(), v2.clone());
        match &v3 {
            US0::US0_Error(v12) => {
                let mut v12: US1 = v12.clone();
                let mut v45: Rc<str> = match &v12 {
                    US1::US1_HttpStatus(v13, v14, v15) => {
                        let mut v13: i32 = *v13;
                        let mut v14: Rc<str> = v14.clone();
                        let mut v15: Rc<str> = v15.clone();
                        let mut v16: Rc<str> = Rc::<str>::from(format!("{:?}", v13));
                        let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                        let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v16));
                        let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                        let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v19));
                        let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v14));
                        let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v23: Rc<str> = Rc::<str>::from(format!("{}{}", v21, v22));
                        let mut v24: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v15));
                        v24.clone()
                    }
                    US1::US1_NoSuchAccount(v39) => {
                        let mut v39: Rc<str> = v39.clone();
                        let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
                        let mut v41: Rc<str> = Rc::<str>::from(format!("{}{}", v40, v39));
                        v41.clone()
                    }
                    US1::US1_Transport(v25, v26) => {
                        let mut v25: Rc<str> = v25.clone();
                        let mut v26: Rc<str> = v26.clone();
                        let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
                        let mut v28: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v25));
                        let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v30: Rc<str> = Rc::<str>::from(format!("{}{}", v28, v29));
                        let mut v31: Rc<str> = Rc::<str>::from(format!("{}{}", v30, v26));
                        v31.clone()
                    }
                    US1::US1_Undecodable(v32, v33) => {
                        let mut v32: Rc<str> = v32.clone();
                        let mut v33: Rc<str> = v33.clone();
                        let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
                        let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v32));
                        let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v36));
                        let mut v38: Rc<str> = Rc::<str>::from(format!("{}{}", v37, v33));
                        v38.clone()
                    }
                };
                let mut v46: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (4i32, v46.clone(), v45.clone())
            }
            US0::US0_Ok(v4) => {
                let mut v4: Rc<UH0> = v4.clone();
                let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                let mut v6: Rc<str> = delimited_5(v5.clone(), v4.clone());
                let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
                let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v6));
                let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
                let mut v10: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v9));
                let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (0i32, v10.clone(), v11.clone())
            }
        }
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
fn method10(mut v0: Rc<UH0>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH2> = method10(v3.clone(), v1.clone());
            Rc::new(UH2::UH2_Cons(v2.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn from_11(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH3>) -> Rc<UH3> {
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
            let mut v15: Rc<UH3> = Rc::new(UH3::UH3_Cons(v8.clone(), v11.clone(), v14.clone(), v2.clone()));
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
            let mut v19: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let mut v20: Rc<UH2> = method10(v18.clone(), v19.clone());
            let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("entities"); } LIT.with(|lit| lit.clone()) };
            let mut v22: serde_json::Value = v5.get(&*v21).cloned().unwrap_or_default();
            let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("urls"); } LIT.with(|lit| lit.clone()) };
            let mut v24: serde_json::Value = v22.get(&*v23).cloned().unwrap_or_default();
            let mut v25: i32 = v24.as_array().map_or(0, |a| a.len()) as i32;
            let mut v26: i32 = v25.wrapping_sub(1i32);
            let mut v27: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
            let mut v28: Rc<UH3> = from_11(v24.clone(), v26, v27.clone());
            let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
            let mut v30: serde_json::Value = v5.get(&*v29).cloned().unwrap_or_default();
            let mut v31: Rc<str> = Rc::<str>::from(v30.as_array().and_then(|a| a.iter().find(|r| r["type"] == "replied_to")).and_then(|r| r["id"].as_str()).unwrap_or(""));
            let mut v32: bool = v31.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v35: US7 = if v32 {
                US7::US7_None
            } else {
                US7::US7_Some(v31.clone())
            };
            let mut v36: Rc<UH1> = Rc::new(UH1::UH1_Cons(v8.clone(), v12.clone(), v20.clone(), v28.clone(), v35.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v36.clone());
            continue;
        }
    }
}
fn method13(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    loop {
        match &*v0 {
            UH2::UH2_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH2> = v3.clone();
                let mut v4: Rc<UH2> = Rc::new(UH2::UH2_Cons(v2.clone(), v1.clone()));
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH2::UH2_Nil => {
                return v1.clone();
            }
        }
    }
}
fn method12(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH3> = v5.clone();
            let mut v6: US7 = v6.clone();
            let mut v7: Rc<UH1> = v7.clone();
            let mut v8: Rc<UH1> = method12(v7.clone(), v1.clone());
            let mut v9: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let mut v10: Rc<UH2> = method13(v4.clone(), v9.clone());
            let mut v15: bool = match &*v10 {
                UH2::UH2_Cons(v11, v12) => {
                    let mut v11: Rc<str> = v11.clone();
                    let mut v12: Rc<UH2> = v12.clone();
                    let mut v13: bool = v11.clone() == v2.clone();
                    v13
                }
                UH2::UH2_Nil => {
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
fn method14(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH3> = v5.clone();
            let mut v6: US7 = v6.clone();
            let mut v7: Rc<UH1> = v7.clone();
            let mut v8: Rc<UH0> = method14(v7.clone(), v1.clone());
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
            let mut v13: Rc<UH1> = method12(v11.clone(), v12.clone());
            let mut v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v15: Rc<UH0> = method14(v13.clone(), v14.clone());
            method3(v15.clone(), v4.clone())
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn closure2() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>) {
        let mut v3: US0 = thread_bodies_0(v0.clone(), v1.clone(), v2.clone());
        match &v3 {
            US0::US0_Error(v10) => {
                let mut v10: US1 = v10.clone();
                let mut v43: Rc<str> = match &v10 {
                    US1::US1_HttpStatus(v11, v12, v13) => {
                        let mut v11: i32 = *v11;
                        let mut v12: Rc<str> = v12.clone();
                        let mut v13: Rc<str> = v13.clone();
                        let mut v14: Rc<str> = Rc::<str>::from(format!("{:?}", v11));
                        let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                        let mut v16: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v14));
                        let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                        let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v17));
                        let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v12));
                        let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v20));
                        let mut v22: Rc<str> = Rc::<str>::from(format!("{}{}", v21, v13));
                        v22.clone()
                    }
                    US1::US1_NoSuchAccount(v37) => {
                        let mut v37: Rc<str> = v37.clone();
                        let mut v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
                        let mut v39: Rc<str> = Rc::<str>::from(format!("{}{}", v38, v37));
                        v39.clone()
                    }
                    US1::US1_Transport(v23, v24) => {
                        let mut v23: Rc<str> = v23.clone();
                        let mut v24: Rc<str> = v24.clone();
                        let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
                        let mut v26: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v23));
                        let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v28: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v27));
                        let mut v29: Rc<str> = Rc::<str>::from(format!("{}{}", v28, v24));
                        v29.clone()
                    }
                    US1::US1_Undecodable(v30, v31) => {
                        let mut v30: Rc<str> = v30.clone();
                        let mut v31: Rc<str> = v31.clone();
                        let mut v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
                        let mut v33: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v30));
                        let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v33, v34));
                        let mut v36: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v31));
                        v36.clone()
                    }
                };
                let mut v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (4i32, v44.clone(), v43.clone())
            }
            US0::US0_Ok(v4) => {
                let mut v4: Rc<UH0> = v4.clone();
                let mut v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let mut v6: Rc<UH0> = method7(v4.clone(), v5.clone());
                let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                let mut v8: Rc<str> = delimited_5(v7.clone(), v6.clone());
                let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (0i32, v8.clone(), v9.clone())
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_thread_pages(v0: &str, v1: &str, v2: &str) -> (i32, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2))
}
pub fn xc_thread_ids(v0: &str, v1: &str, v2: &str) -> (i32, Rc<str>, Rc<str>) {
    closure2()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2))
}
