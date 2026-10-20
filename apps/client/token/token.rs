#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
#[derive(Clone)]
enum US0 {
    US0_Some(Rc<str>),
    US0_None,
}
fn split_on_2(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
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
        let mut v12: Rc<UH0> = split_on_2(v0.clone(), v11.clone());
        Rc::new(UH0::UH0_Cons(v6.clone(), v12.clone()))
    }
}
fn method3(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
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
fn method4(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: US0) -> US0 {
    match &*v1 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: US0 = method4(v0.clone(), v4.clone(), v2.clone());
            let mut v6: bool = v3.starts_with(&*v0);
            if v6 {
                US0::US0_Some(v3.clone())
            } else {
                v5.clone()
            }
        }
        UH0::UH0_Nil => {
            v2.clone()
        }
    }
}
fn method5(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> Rc<UH0> {
    match &*v1 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH0> = method5(v0.clone(), v4.clone(), v2.clone());
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
            let mut v7: bool = v3.ends_with(&*v6);
            let mut v9: Rc<str> = if v7 {
                v6.clone()
            } else {
                let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v8.clone()
            };
            let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
            let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("="); } LIT.with(|lit| lit.clone()) };
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN="); } LIT.with(|lit| lit.clone()) };
            let mut v13: bool = v3.starts_with(&*v12);
            let mut v17: Rc<str> = if v13 {
                let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN="); } LIT.with(|lit| lit.clone()) };
                let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v0));
                let mut v16: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v9));
                v16.clone()
            } else {
                v3.clone()
            };
            Rc::new(UH0::UH0_Cons(v17.clone(), v5.clone()))
        }
        UH0::UH0_Nil => {
            v2.clone()
        }
    }
}
fn method6(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method6(v3.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v2.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method7(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> Rc<UH0> {
    match &*v1 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH0> = method7(v0.clone(), v4.clone(), v2.clone());
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
            let mut v7: bool = v3.ends_with(&*v6);
            let mut v9: Rc<str> = if v7 {
                v6.clone()
            } else {
                let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v8.clone()
            };
            let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN"); } LIT.with(|lit| lit.clone()) };
            let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("="); } LIT.with(|lit| lit.clone()) };
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN="); } LIT.with(|lit| lit.clone()) };
            let mut v13: bool = v3.starts_with(&*v12);
            let mut v17: Rc<str> = if v13 {
                let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN="); } LIT.with(|lit| lit.clone()) };
                let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v0));
                let mut v16: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v9));
                v16.clone()
            } else {
                v3.clone()
            };
            Rc::new(UH0::UH0_Cons(v17.clone(), v5.clone()))
        }
        UH0::UH0_Nil => {
            v2.clone()
        }
    }
}
fn method8(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method8(v4.clone(), v1.clone(), v2.clone());
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
fn rewritten_1(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>) -> Rc<str> {
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let mut v5: Rc<UH0> = split_on_2(v4.clone(), v0.clone());
    let mut v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v7: Rc<UH0> = method3(v5.clone(), v6.clone());
    let mut v14: Rc<UH0> = match &*v7 {
        UH0::UH0_Cons(v8, v9) => {
            let mut v8: Rc<str> = v8.clone();
            let mut v9: Rc<UH0> = v9.clone();
            let mut v10: bool = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) } == v8.clone();
            if v10 {
                let mut v11: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                method3(v9.clone(), v11.clone())
            } else {
                v5.clone()
            }
        }
        _ => {
            v5.clone()
        }
    };
    let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("="); } LIT.with(|lit| lit.clone()) };
    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN="); } LIT.with(|lit| lit.clone()) };
    let mut v18: US0 = US0::US0_None;
    let mut v19: US0 = method4(v17.clone(), v14.clone(), v18.clone());
    let mut v22: bool = match &v19 {
        US0::US0_None => {
            false
        }
        US0::US0_Some(v20) => {
            let mut v20: Rc<str> = v20.clone();
            true
        }
    };
    let mut v30: Rc<UH0> = if v22 {
        let mut v23: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        method5(v1.clone(), v14.clone(), v23.clone())
    } else {
        let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN="); } LIT.with(|lit| lit.clone()) };
        let mut v26: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v1));
        let mut v27: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v28: Rc<UH0> = Rc::new(UH0::UH0_Cons(v26.clone(), v27.clone()));
        method6(v14.clone(), v28.clone())
    };
    let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let mut v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN="); } LIT.with(|lit| lit.clone()) };
    let mut v33: US0 = US0::US0_None;
    let mut v34: US0 = method4(v32.clone(), v30.clone(), v33.clone());
    let mut v37: bool = match &v34 {
        US0::US0_None => {
            false
        }
        US0::US0_Some(v35) => {
            let mut v35: Rc<str> = v35.clone();
            true
        }
    };
    let mut v45: Rc<UH0> = if v37 {
        let mut v38: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        method7(v2.clone(), v30.clone(), v38.clone())
    } else {
        let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN="); } LIT.with(|lit| lit.clone()) };
        let mut v41: Rc<str> = Rc::<str>::from(format!("{}{}", v40, v2));
        let mut v42: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v43: Rc<UH0> = Rc::new(UH0::UH0_Cons(v41.clone(), v42.clone()));
        method6(v30.clone(), v43.clone())
    };
    let mut v46: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v47, mut v48): (Rc<str>, Rc<str>) = method8(v45.clone(), v46.clone(), v46.clone());
    let mut v49: Rc<str> = Rc::<str>::from(format!("{}{}", v47, v4));
    v49.clone()
}
fn refreshed_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>) -> (i32, Rc<str>) {
    let mut v5: std::io::Result<String> = std::fs::read_to_string(&*v4);
    let mut v6: bool = v5.is_ok();
    let mut v7: bool = v6 == false;
    if v7 {
        let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cannot read "); } LIT.with(|lit| lit.clone()) };
        let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v4));
        (3i32, v9.clone())
    } else {
        let mut v10: Rc<str> = Rc::<str>::from(v5.as_deref().unwrap_or(""));
        let mut v11: Rc<str> = Rc::<str>::from(v3.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
        let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("grant_type=refresh_token&refresh_token="); } LIT.with(|lit| lit.clone()) };
        let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v11));
        let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&client_id="); } LIT.with(|lit| lit.clone()) };
        let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v14));
        let mut v16: Rc<str> = Rc::<str>::from(v1.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
        let mut v17: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v16));
        let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/oauth2/token"); } LIT.with(|lit| lit.clone()) };
        let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v18));
        let (mut v20, mut v21): (i32, Rc<str>) = xc_net::xc_post_form(&*v19, &*v1, &*v2, &*v17);
        let mut v22: bool = v20 >= 200i32;
        let mut v24: bool = if v22 {
            let mut v23: bool = v20 < 300i32;
            v23
        } else {
            false
        };
        if v24 {
            let mut v25: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v21).unwrap_or_default();
            let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("expires_in"); } LIT.with(|lit| lit.clone()) };
            let mut v27: serde_json::Value = v25.get(&*v26).cloned().unwrap_or_default();
            let mut v28: i32 = v27.as_i64().unwrap_or(0) as i32;
            let mut v29: Rc<str> = Rc::<str>::from(format!("{:?}", v28));
            let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("access_token"); } LIT.with(|lit| lit.clone()) };
            let mut v31: serde_json::Value = v25.get(&*v30).cloned().unwrap_or_default();
            let mut v32: Rc<str> = Rc::<str>::from(v31.as_str().unwrap_or(""));
            let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("refresh_token"); } LIT.with(|lit| lit.clone()) };
            let mut v34: serde_json::Value = v25.get(&*v33).cloned().unwrap_or_default();
            let mut v35: Rc<str> = Rc::<str>::from(v34.as_str().unwrap_or(""));
            let mut v36: bool = v32.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v38: bool = if v36 {
                true
            } else {
                let mut v37: bool = v35.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v37
            };
            if v38 {
                let mut v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("the token reply had no access_token or refresh_token"); } LIT.with(|lit| lit.clone()) };
                (4i32, v39.clone())
            } else {
                let mut v40: Rc<str> = rewritten_1(v10.clone(), v32.clone(), v35.clone(), v29.clone());
                let mut v41: bool = std::fs::write(&*v4, (v40).as_bytes()).is_ok();
                if v41 {
                    let mut v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("renewed X_OAUTH2_ACCESS_TOKEN and X_OAUTH2_REFRESH_TOKEN in "); } LIT.with(|lit| lit.clone()) };
                    let mut v43: Rc<str> = Rc::<str>::from(format!("{}{}", v42, v4));
                    let mut v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; the access token expires in "); } LIT.with(|lit| lit.clone()) };
                    let mut v45: Rc<str> = Rc::<str>::from(format!("{}{}", v43, v44));
                    let mut v46: Rc<str> = Rc::<str>::from(format!("{}{}", v45, v29));
                    let mut v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" s"); } LIT.with(|lit| lit.clone()) };
                    let mut v48: Rc<str> = Rc::<str>::from(format!("{}{}", v46, v47));
                    (0i32, v48.clone())
                } else {
                    let mut v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not write "); } LIT.with(|lit| lit.clone()) };
                    let mut v50: Rc<str> = Rc::<str>::from(format!("{}{}", v49, v4));
                    (4i32, v50.clone())
                }
            }
        } else {
            let mut v55: bool = v20 == 0i32;
            if v55 {
                let mut v56: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cannot reach "); } LIT.with(|lit| lit.clone()) };
                let mut v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cannot reach /2/oauth2/token"); } LIT.with(|lit| lit.clone()) };
                let mut v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                let mut v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cannot reach /2/oauth2/token: "); } LIT.with(|lit| lit.clone()) };
                let mut v60: Rc<str> = Rc::<str>::from(format!("{}{}", v59, v21));
                (4i32, v60.clone())
            } else {
                let mut v61: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v21).unwrap_or_default();
                let mut v62: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("error_description"); } LIT.with(|lit| lit.clone()) };
                let mut v63: serde_json::Value = v61.get(&*v62).cloned().unwrap_or_default();
                let mut v64: Rc<str> = Rc::<str>::from(v63.as_str().unwrap_or(""));
                let mut v65: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("error"); } LIT.with(|lit| lit.clone()) };
                let mut v66: serde_json::Value = v61.get(&*v65).cloned().unwrap_or_default();
                let mut v67: Rc<str> = Rc::<str>::from(v66.as_str().unwrap_or(""));
                let mut v68: bool = v64.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v71: Rc<str> = if v68 {
                    v64.clone()
                } else {
                    let mut v69: bool = v67.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    if v69 {
                        v67.clone()
                    } else {
                        v21.clone()
                    }
                };
                let mut v72: Rc<str> = Rc::<str>::from(format!("{:?}", v20));
                let mut v73: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                let mut v74: Rc<str> = Rc::<str>::from(format!("{}{}", v73, v72));
                let mut v75: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                let mut v76: Rc<str> = Rc::<str>::from(format!("{}{}", v74, v75));
                let mut v77: Rc<str> = Rc::<str>::from(format!("{}{}", v76, v18));
                let mut v78: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                let mut v79: Rc<str> = Rc::<str>::from(format!("{}{}", v77, v78));
                let mut v80: Rc<str> = Rc::<str>::from(format!("{}{}", v79, v71));
                (4i32, v80.clone())
            }
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>| -> (i32, Rc<str>) {
        refreshed_0(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_refresh(v0: &str, v1: &str, v2: &str, v3: &str, v4: &str) -> (i32, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), Rc::<str>::from(v3), Rc::<str>::from(v4))
}
