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
    US0_Signed(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>),
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
fn app_reply_1(mut v0: Rc<str>, mut v1: US0, mut v2: Rc<str>) -> US1 {
    let mut v3: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v2));
    let mut v15: Rc<str> = match &v1 {
        US0::US0_BearerToken(v4) => {
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) };
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v4));
            v6.clone()
        }
        US0::US0_Signed(v7, v8, v9, v10, v11, v12) => {
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<str> = v8.clone();
            let mut v9: Rc<str> = v9.clone();
            let mut v10: Rc<str> = v10.clone();
            let mut v11: Rc<str> = v11.clone();
            let mut v12: Rc<str> = v12.clone();
            let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v13.clone()
        }
    };
    let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("GET"); } LIT.with(|lit| lit.clone()) };
    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v18, mut v19): (i32, Rc<str>) = xc_net::xc_send(&*v16, &*v3, &*v15, &*v17);
    let mut v20: bool = v18 == 0i32;
    let mut v80: US3 = if v20 {
        let mut v21: US2 = US2::US2_Transport(v2.clone(), v19.clone());
        US3::US3_Error(v21.clone())
    } else {
        let mut v23: bool = v18 >= 200i32;
        let mut v25: bool = if v23 {
            let mut v24: bool = v18 < 300i32;
            v24
        } else {
            false
        };
        let mut v26: bool = v25 == false;
        if v26 {
            let mut v27: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v19).unwrap_or_default();
            let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
            let mut v29: serde_json::Value = v27.get(&*v28).cloned().unwrap_or_default();
            let mut v30: Rc<str> = Rc::<str>::from(v29.as_str().unwrap_or(""));
            let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
            let mut v32: serde_json::Value = v27.get(&*v31).cloned().unwrap_or_default();
            let mut v33: Rc<str> = Rc::<str>::from(v32.as_str().unwrap_or(""));
            let mut v34: bool = v30.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v35: bool = v34 != true;
            let mut v38: bool = if v35 {
                let mut v36: bool = v33.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v37: bool = v36 != true;
                v37
            } else {
                false
            };
            let mut v41: bool = if v38 {
                let mut v39: bool = v30.clone() == v33.clone();
                let mut v40: bool = v39 != true;
                v40
            } else {
                false
            };
            let mut v64: Rc<str> = if v41 {
                let mut v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                let mut v43: Rc<str> = Rc::<str>::from(format!("{}{}", v30, v42));
                let mut v44: Rc<str> = Rc::<str>::from(format!("{}{}", v43, v33));
                v44.clone()
            } else {
                let mut v45: bool = v33.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v46: bool = v45 != true;
                if v46 {
                    v33.clone()
                } else {
                    if v35 {
                        v30.clone()
                    } else {
                        let mut v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
                        let mut v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
                        let mut v49: Rc<str> = Rc::<str>::from(v19.replace(&*v47, &*v48));
                        let mut v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                        let mut v51: Rc<str> = Rc::<str>::from(v49.replace(&*v50, &*v48));
                        let mut v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
                        let mut v53: Rc<str> = Rc::<str>::from(v51.replace(&*v52, &*v48));
                        let mut v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
                        let mut v55: Rc<str> = Rc::<str>::from(v53.replace(&*v54, &*v48));
                        let mut v56: i32 = (v55.clone().len() as i32);
                        let mut v57: bool = v56 <= 300i32;
                        if v57 {
                            v55.clone()
                        } else {
                            let mut v58: Rc<str> = string_slice(&v55.clone(), 0i32 as i64, 299i32 as i64);
                            let mut v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("..."); } LIT.with(|lit| lit.clone()) };
                            let mut v60: Rc<str> = Rc::<str>::from(format!("{}{}", v58, v59));
                            v60.clone()
                        }
                    }
                }
            };
            let mut v65: US2 = US2::US2_HttpStatus(v18, v2.clone(), v64.clone());
            US3::US3_Error(v65.clone())
        } else {
            let mut v67: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v19).unwrap_or_default();
            let mut v68: bool = v67.is_null();
            if v68 {
                let mut v69: i32 = (v19.clone().len() as i32);
                let mut v70: bool = v69 <= 300i32;
                let mut v74: Rc<str> = if v70 {
                    v19.clone()
                } else {
                    let mut v71: Rc<str> = string_slice(&v19.clone(), 0i32 as i64, 299i32 as i64);
                    let mut v72: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("..."); } LIT.with(|lit| lit.clone()) };
                    let mut v73: Rc<str> = Rc::<str>::from(format!("{}{}", v71, v72));
                    v73.clone()
                };
                let mut v75: US2 = US2::US2_Undecodable(v2.clone(), v74.clone());
                US3::US3_Error(v75.clone())
            } else {
                US3::US3_Ok(v67.clone())
            }
        }
    };
    match &v80 {
        US3::US3_Error(v83) => {
            let mut v83: US2 = v83.clone();
            US1::US1_Error(v83.clone())
        }
        US3::US3_Ok(v81) => {
            let mut v81: serde_json::Value = v81.clone();
            US1::US1_Ok(v81.clone(), v19.clone())
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
    let mut v13: bool = v3.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v14: bool = v13 != true;
    if v14 {
        let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        paged_3(v0.clone(), v1.clone(), v3.clone(), v4.clone(), v12.clone(), v15.clone(), v16.clone())
    } else {
        let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/"); } LIT.with(|lit| lit.clone()) };
        let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v2));
        let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("?post.fields=conversation_id,author_id,created_at"); } LIT.with(|lit| lit.clone()) };
        let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v20));
        let mut v22: US2 = US2::US2_HttpStatus(404i32, v21.clone(), v6.clone());
        US5::US5_Error(v22.clone())
    }
}
fn method5(mut v0: Rc<UH0>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method5(v3.clone(), v1.clone());
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
    let mut v44: US4 = match &v14 {
        US1::US1_Error(v41) => {
            let mut v41: US2 = v41.clone();
            US4::US4_Error(v41.clone())
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
            let mut v34: bool = v33.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v35: bool = v34 != true;
            let mut v39: Rc<str> = if v35 {
                v33.clone()
            } else {
                let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
                let mut v37: serde_json::Value = v30.get(&*v36).cloned().unwrap_or_default();
                let mut v38: Rc<str> = Rc::<str>::from(v37.as_str().unwrap_or(""));
                v38.clone()
            };
            US4::US4_Ok(v21.clone(), v24.clone(), v27.clone(), v39.clone())
        }
    };
    let mut v45: US0 = US0::US0_BearerToken(v1.clone());
    let mut v54: US5 = match &v44 {
        US4::US4_Error(v51) => {
            let mut v51: US2 = v51.clone();
            US5::US5_Error(v51.clone())
        }
        US4::US4_Ok(v46, v47, v48, v49) => {
            let mut v46: Rc<str> = v46.clone();
            let mut v47: Rc<str> = v47.clone();
            let mut v48: Rc<str> = v48.clone();
            let mut v49: Rc<str> = v49.clone();
            rooted_2(v8.clone(), v45.clone(), v2.clone(), v46.clone(), v47.clone(), v48.clone(), v49.clone())
        }
    };
    match &v54 {
        US5::US5_Error(v63) => {
            let mut v63: US2 = v63.clone();
            let mut v96: Rc<str> = match &v63 {
                US2::US2_HttpStatus(v64, v65, v66) => {
                    let mut v64: i32 = *v64;
                    let mut v65: Rc<str> = v65.clone();
                    let mut v66: Rc<str> = v66.clone();
                    let mut v67: Rc<str> = Rc::<str>::from(format!("{:?}", v64));
                    let mut v68: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                    let mut v69: Rc<str> = Rc::<str>::from(format!("{}{}", v68, v67));
                    let mut v70: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                    let mut v71: Rc<str> = Rc::<str>::from(format!("{}{}", v69, v70));
                    let mut v72: Rc<str> = Rc::<str>::from(format!("{}{}", v71, v65));
                    let mut v73: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v74: Rc<str> = Rc::<str>::from(format!("{}{}", v72, v73));
                    let mut v75: Rc<str> = Rc::<str>::from(format!("{}{}", v74, v66));
                    v75.clone()
                }
                US2::US2_NoSuchAccount(v90) => {
                    let mut v90: Rc<str> = v90.clone();
                    let mut v91: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
                    let mut v92: Rc<str> = Rc::<str>::from(format!("{}{}", v91, v90));
                    v92.clone()
                }
                US2::US2_Transport(v76, v77) => {
                    let mut v76: Rc<str> = v76.clone();
                    let mut v77: Rc<str> = v77.clone();
                    let mut v78: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
                    let mut v79: Rc<str> = Rc::<str>::from(format!("{}{}", v78, v76));
                    let mut v80: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v81: Rc<str> = Rc::<str>::from(format!("{}{}", v79, v80));
                    let mut v82: Rc<str> = Rc::<str>::from(format!("{}{}", v81, v77));
                    v82.clone()
                }
                US2::US2_Undecodable(v83, v84) => {
                    let mut v83: Rc<str> = v83.clone();
                    let mut v84: Rc<str> = v84.clone();
                    let mut v85: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
                    let mut v86: Rc<str> = Rc::<str>::from(format!("{}{}", v85, v83));
                    let mut v87: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v88: Rc<str> = Rc::<str>::from(format!("{}{}", v86, v87));
                    let mut v89: Rc<str> = Rc::<str>::from(format!("{}{}", v88, v84));
                    v89.clone()
                }
            };
            let mut v97: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (4i32, v97.clone(), v96.clone())
        }
        US5::US5_Ok(v55) => {
            let mut v55: Rc<UH0> = v55.clone();
            let mut v56: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v57, mut v58): (Rc<str>, Rc<str>) = method5(v55.clone(), v56.clone());
            let mut v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
            let mut v60: Rc<str> = Rc::<str>::from(format!("{}{}", v59, v57));
            let mut v61: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
            let mut v62: Rc<str> = Rc::<str>::from(format!("{}{}", v60, v61));
            (0i32, v62.clone(), v56.clone())
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>) {
        pages_of_0(v0.clone(), v1.clone(), v2.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_thread_pages(v0: &str, v1: &str, v2: &str) -> (i32, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2))
}
