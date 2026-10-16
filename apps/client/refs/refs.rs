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
impl US0 {
    fn tag(&self) -> i32 {
        match self {
            US0::US0_BearerToken(..) => 0,
            US0::US0_Signed(..) => 1,
        }
    }
}
impl Default for US0 {
    fn default() -> Self {
        US0::US0_BearerToken({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
impl UH0 {
    fn tag(&self) -> i32 {
        match self {
            UH0::UH0_Nil => 0,
            UH0::UH0_Cons(..) => 1,
        }
    }
}
impl Default for UH0 {
    fn default() -> Self {
        UH0::UH0_Nil
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
#[derive(Clone)]
enum US3 {
    US3_HttpStatus(i32, Rc<str>, Rc<str>),
    US3_Transport(Rc<str>, Rc<str>),
    US3_Undecodable(Rc<str>, Rc<str>),
    US3_NoSuchAccount(Rc<str>),
}
impl US3 {
    fn tag(&self) -> i32 {
        match self {
            US3::US3_HttpStatus(..) => 0,
            US3::US3_Transport(..) => 1,
            US3::US3_Undecodable(..) => 2,
            US3::US3_NoSuchAccount(..) => 3,
        }
    }
}
impl Default for US3 {
    fn default() -> Self {
        US3::US3_HttpStatus(<i32>::default(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
#[derive(Clone)]
enum US2 {
    US2_Ok(serde_json::Value, Rc<str>),
    US2_Error(US3),
}
impl US2 {
    fn tag(&self) -> i32 {
        match self {
            US2::US2_Ok(..) => 0,
            US2::US2_Error(..) => 1,
        }
    }
}
#[derive(Clone)]
enum US4 {
    US4_Ok(serde_json::Value),
    US4_Error(US3),
}
impl US4 {
    fn tag(&self) -> i32 {
        match self {
            US4::US4_Ok(..) => 0,
            US4::US4_Error(..) => 1,
        }
    }
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<UH0>, Rc<UH1>),
}
impl UH1 {
    fn tag(&self) -> i32 {
        match self {
            UH1::UH1_Nil => 0,
            UH1::UH1_Cons(..) => 1,
        }
    }
}
impl Default for UH1 {
    fn default() -> Self {
        UH1::UH1_Nil
    }
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(Rc<str>, Rc<str>, Rc<UH2>),
}
impl UH2 {
    fn tag(&self) -> i32 {
        match self {
            UH2::UH2_Nil => 0,
            UH2::UH2_Cons(..) => 1,
        }
    }
}
impl Default for UH2 {
    fn default() -> Self {
        UH2::UH2_Nil
    }
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
fn method4(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: US1) -> US1 {
    match &*v1 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: US1 = method4(v0.clone(), v4.clone(), v2.clone());
            let mut v6: bool = v0.clone() == v3.clone();
            if v6 {
                US1::US1_Some(v3.clone())
            } else {
                v5.clone()
            }
        }
        UH0::UH0_Nil => {
            v2.clone()
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
fn method3(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
                let mut v4: US1 = US1::US1_None;
                let mut v5: US1 = method4(v2.clone(), v1.clone(), v4.clone());
                let mut v8: bool = match &v5 {
                    US1::US1_None => {
                        false
                    }
                    US1::US1_Some(v6) => {
                        let mut v6: Rc<str> = v6.clone();
                        true
                    }
                };
                let mut v12: Rc<UH0> = if v8 {
                    v1.clone()
                } else {
                    let mut v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let mut v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2.clone(), v9.clone()));
                    method5(v1.clone(), v10.clone())
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
fn go_6(mut v0: i32, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v1 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: bool = v0 > 0i32;
            if v4 {
                let mut v5: i32 = v0.wrapping_sub(1i32);
                let mut v6: Rc<UH0> = go_6(v5, v3.clone());
                Rc::new(UH0::UH0_Cons(v2.clone(), v6.clone()))
            } else {
                { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
            }
        }
        _ => {
            { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
        }
    }
}
fn method8(mut v0: Rc<UH0>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method8(v3.clone(), v1.clone());
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
fn lookup_path_7(mut v0: Rc<UH0>, mut v1: i32, mut v2: Rc<str>, mut v3: bool, mut v4: bool, mut v5: i32, mut v6: bool) -> Rc<str> {
    let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v8, mut v9): (Rc<str>, Rc<str>) = method8(v0.clone(), v7.clone());
    let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets?ids="); } LIT.with(|lit| lit.clone()) };
    let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v8));
    let mut v13: Rc<str> = if v6 {
        let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&media.fields=type,alt_text"); } LIT.with(|lit| lit.clone()) };
        v12.clone()
    } else {
        v7.clone()
    };
    let mut v14: bool = v5 > 0i32;
    let mut v21: Rc<UH0> = if v14 {
        let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
        let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts.author_id"); } LIT.with(|lit| lit.clone()) };
        let mut v17: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v18: Rc<UH0> = Rc::new(UH0::UH0_Cons(v16.clone(), v17.clone()));
        Rc::new(UH0::UH0_Cons(v15.clone(), v18.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    };
    let mut v26: Rc<UH0> = if v6 {
        let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("attachments.media_keys"); } LIT.with(|lit| lit.clone()) };
        let mut v23: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v22.clone(), v23.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    };
    let mut v27: Rc<UH0> = method5(v21.clone(), v26.clone());
    let mut v33: Rc<str> = match &*v27 {
        UH0::UH0_Nil => {
            v7.clone()
        }
        _ => {
            let (mut v28, mut v29): (Rc<str>, Rc<str>) = method8(v27.clone(), v7.clone());
            let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&expansions="); } LIT.with(|lit| lit.clone()) };
            let mut v31: Rc<str> = Rc::<str>::from(format!("{}{}", v30, v28));
            let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v31, v13));
            v32.clone()
        }
    };
    let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&post.fields=created_at,author_id,entities,attachments"); } LIT.with(|lit| lit.clone()) };
    let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v33));
    let mut v36: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v35));
    v36.clone()
}
fn app_reply_9(mut v0: Rc<str>, mut v1: US0, mut v2: Rc<str>) -> US2 {
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
    let mut v78: US4 = if v20 {
        let mut v21: US3 = US3::US3_Transport(v2.clone(), v19.clone());
        US4::US4_Error(v21.clone())
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
            let mut v62: Rc<str> = if v41 {
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
                        let mut v54: i32 = (v53.clone().len() as i32);
                        let mut v55: bool = v54 <= 300i32;
                        if v55 {
                            v53.clone()
                        } else {
                            let mut v56: Rc<str> = string_slice(&v53.clone(), 0i32 as i64, 299i32 as i64);
                            let mut v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("..."); } LIT.with(|lit| lit.clone()) };
                            let mut v58: Rc<str> = Rc::<str>::from(format!("{}{}", v56, v57));
                            v58.clone()
                        }
                    }
                }
            };
            let mut v63: US3 = US3::US3_HttpStatus(v18, v2.clone(), v62.clone());
            US4::US4_Error(v63.clone())
        } else {
            let mut v65: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v19).unwrap_or_default();
            let mut v66: bool = v65.is_null();
            if v66 {
                let mut v67: i32 = (v19.clone().len() as i32);
                let mut v68: bool = v67 <= 300i32;
                let mut v72: Rc<str> = if v68 {
                    v19.clone()
                } else {
                    let mut v69: Rc<str> = string_slice(&v19.clone(), 0i32 as i64, 299i32 as i64);
                    let mut v70: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("..."); } LIT.with(|lit| lit.clone()) };
                    let mut v71: Rc<str> = Rc::<str>::from(format!("{}{}", v69, v70));
                    v71.clone()
                };
                let mut v73: US3 = US3::US3_Undecodable(v2.clone(), v72.clone());
                US4::US4_Error(v73.clone())
            } else {
                US4::US4_Ok(v65.clone())
            }
        }
    };
    match &v78 {
        US4::US4_Error(v81) => {
            let mut v81: US3 = v81.clone();
            US2::US2_Error(v81.clone())
        }
        US4::US4_Ok(v79) => {
            let mut v79: serde_json::Value = v79.clone();
            US2::US2_Ok(v79.clone(), v19.clone())
        }
    }
}
fn from_12(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
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
fn from_11(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
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
            let mut v11: Rc<UH0> = from_12(v7.clone(), v9, v10.clone());
            let mut v12: Rc<UH1> = Rc::new(UH1::UH1_Cons(v11.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v12.clone());
            continue;
        }
    }
}
fn method13(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<UH0> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH0> = method13(v3.clone(), v1.clone());
            method5(v2.clone(), v4.clone())
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn from_15(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH2>) -> Rc<UH2> {
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
            let mut v12: Rc<UH2> = Rc::new(UH2::UH2_Cons(v8.clone(), v11.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v12.clone());
            continue;
        }
    }
}
fn method16(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH2> = method16(v4.clone(), v1.clone());
            let mut v6: bool = v3.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v7: bool = v6 != true;
            if v7 {
                Rc::new(UH2::UH2_Cons(v2.clone(), v3.clone(), v5.clone()))
            } else {
                v5.clone()
            }
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn method17(mut v0: Rc<UH2>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH0> = method17(v4.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v2.clone(), v5.clone()))
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn from_18(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
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
fn absorbed_14(mut v0: serde_json::Value, mut v1: Rc<str>, mut v2: Rc<UH0>, mut v3: Rc<UH0>, mut v4: Rc<str>, mut v5: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("includes"); } LIT.with(|lit| lit.clone()) };
    let mut v7: serde_json::Value = v0.get(&*v6).cloned().unwrap_or_default();
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("users"); } LIT.with(|lit| lit.clone()) };
    let mut v9: serde_json::Value = v7.get(&*v8).cloned().unwrap_or_default();
    let mut v10: i32 = v9.as_array().map_or(0, |a| a.len()) as i32;
    let mut v11: i32 = v10.wrapping_sub(1i32);
    let mut v12: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let mut v13: Rc<UH2> = from_15(v9.clone(), v11, v12.clone());
    let mut v14: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let mut v15: Rc<UH2> = method16(v13.clone(), v14.clone());
    let mut v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v17: Rc<UH0> = method17(v15.clone(), v16.clone());
    let mut v18: Rc<UH0> = method5(v3.clone(), v17.clone());
    let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
    let mut v20: serde_json::Value = v0.get(&*v19).cloned().unwrap_or_default();
    let mut v21: i32 = v20.as_array().map_or(0, |a| a.len()) as i32;
    let mut v22: i32 = v21.wrapping_sub(1i32);
    let mut v23: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v24: Rc<UH0> = from_18(v20.clone(), v22, v23.clone());
    let mut v25: serde_json::Value = v0.get(&*v6).cloned().unwrap_or_default();
    let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts"); } LIT.with(|lit| lit.clone()) };
    let mut v27: serde_json::Value = v25.get(&*v26).cloned().unwrap_or_default();
    let mut v28: i32 = v27.as_array().map_or(0, |a| a.len()) as i32;
    let mut v29: i32 = v28.wrapping_sub(1i32);
    let mut v30: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v31: Rc<UH0> = from_18(v27.clone(), v29, v30.clone());
    let mut v32: Rc<UH0> = method5(v24.clone(), v31.clone());
    let mut v33: Rc<UH0> = method5(v2.clone(), v32.clone());
    let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"role\":\"lookup\",\"author\":\"\",\"doc\":"); } LIT.with(|lit| lit.clone()) };
    let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v1));
    let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
    let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v36));
    let mut v38: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v39: Rc<UH0> = Rc::new(UH0::UH0_Cons(v37.clone(), v38.clone()));
    let mut v40: Rc<UH0> = method5(v5.clone(), v39.clone());
    (v33.clone(), v18.clone(), v4.clone(), v40.clone())
}
fn deepened_10(mut v0: Rc<str>, mut v1: US0, mut v2: i32, mut v3: Rc<str>, mut v4: bool, mut v5: bool, mut v6: i32, mut v7: bool, mut v8: i32, mut v9: Rc<UH0>, mut v10: Rc<UH0>, mut v11: Rc<str>, mut v12: Rc<UH0>, mut v13: US2) -> (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let (mut v71, mut v72, mut v73, mut v74): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &v13 {
        US2::US2_Error(v14) => {
            let mut v14: US3 = v14.clone();
            let mut v47: Rc<str> = match &v14 {
                US3::US3_HttpStatus(v15, v16, v17) => {
                    let mut v15: i32 = *v15;
                    let mut v16: Rc<str> = v16.clone();
                    let mut v17: Rc<str> = v17.clone();
                    let mut v18: Rc<str> = Rc::<str>::from(format!("{:?}", v15));
                    let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                    let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v18));
                    let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                    let mut v22: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v21));
                    let mut v23: Rc<str> = Rc::<str>::from(format!("{}{}", v22, v16));
                    let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v25: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v24));
                    let mut v26: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v17));
                    v26.clone()
                }
                US3::US3_NoSuchAccount(v41) => {
                    let mut v41: Rc<str> = v41.clone();
                    let mut v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
                    let mut v43: Rc<str> = Rc::<str>::from(format!("{}{}", v42, v41));
                    v43.clone()
                }
                US3::US3_Transport(v27, v28) => {
                    let mut v27: Rc<str> = v27.clone();
                    let mut v28: Rc<str> = v28.clone();
                    let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
                    let mut v30: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v27));
                    let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v30, v31));
                    let mut v33: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v28));
                    v33.clone()
                }
                US3::US3_Undecodable(v34, v35) => {
                    let mut v34: Rc<str> = v34.clone();
                    let mut v35: Rc<str> = v35.clone();
                    let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
                    let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v34));
                    let mut v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                    let mut v39: Rc<str> = Rc::<str>::from(format!("{}{}", v37, v38));
                    let mut v40: Rc<str> = Rc::<str>::from(format!("{}{}", v39, v35));
                    v40.clone()
                }
            };
            (v9.clone(), v10.clone(), v47.clone(), v12.clone())
        }
        _ => {
            let (mut v67, mut v68, mut v69, mut v70): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &v13 {
                US2::US2_Ok(v48, v49) => {
                    let mut v48: serde_json::Value = v48.clone();
                    let mut v49: Rc<str> = v49.clone();
                    let mut v50: i32 = v8.wrapping_add(1i32);
                    let mut v51: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
                    let mut v52: serde_json::Value = v48.get(&*v51).cloned().unwrap_or_default();
                    let mut v53: i32 = v52.as_array().map_or(0, |a| a.len()) as i32;
                    let mut v54: i32 = v53.wrapping_sub(1i32);
                    let mut v55: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let mut v56: Rc<UH1> = from_11(v52.clone(), v54, v55.clone());
                    let mut v57: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let mut v58: Rc<UH0> = method13(v56.clone(), v57.clone());
                    let (mut v59, mut v60, mut v61, mut v62): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = absorbed_14(v48.clone(), v49.clone(), v9.clone(), v10.clone(), v11.clone(), v12.clone());
                    deepen_2(v0.clone(), v1.clone(), v2, v3.clone(), v4, v5, v6, v7, v50, v58.clone(), v59.clone(), v60.clone(), v61.clone(), v62.clone())
                }
                _ => unreachable!(),
            };
            (v67.clone(), v68.clone(), v69.clone(), v70.clone())
        }
    };
    (v71.clone(), v72.clone(), v73.clone(), v74.clone())
}
fn deepen_2(mut v0: Rc<str>, mut v1: US0, mut v2: i32, mut v3: Rc<str>, mut v4: bool, mut v5: bool, mut v6: i32, mut v7: bool, mut v8: i32, mut v9: Rc<UH0>, mut v10: Rc<UH0>, mut v11: Rc<UH0>, mut v12: Rc<str>, mut v13: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let mut v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v15: Rc<UH0> = method3(v9.clone(), v14.clone());
    let (mut v29, mut v30, mut v31, mut v32): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = match &*v15 {
        UH0::UH0_Nil => {
            (v10.clone(), v11.clone(), v12.clone(), v13.clone())
        }
        _ => {
            let mut v16: bool = v8 >= v6;
            let (mut v25, mut v26, mut v27, mut v28): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = if v16 {
                (v10.clone(), v11.clone(), v12.clone(), v13.clone())
            } else {
                let mut v17: i32 = 100i32;
                let mut v18: Rc<UH0> = go_6(v17, v15.clone());
                let mut v19: Rc<str> = lookup_path_7(v18.clone(), v2, v3.clone(), v4, v5, v6, v7);
                let mut v20: US2 = app_reply_9(v0.clone(), v1.clone(), v19.clone());
                let (mut v21, mut v22, mut v23, mut v24): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = deepened_10(v0.clone(), v1.clone(), v2, v3.clone(), v4, v5, v6, v7, v8, v10.clone(), v11.clone(), v12.clone(), v13.clone(), v20.clone());
                (v21.clone(), v22.clone(), v23.clone(), v24.clone())
            };
            (v25.clone(), v26.clone(), v27.clone(), v28.clone())
        }
    };
    (v29.clone(), v30.clone(), v31.clone(), v32.clone())
}
fn method20(mut v0: Rc<UH0>, mut v1: Rc<UH0>, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: Rc<UH0>, mut v5: Rc<UH0>) -> Rc<UH0> {
    match &*v4 {
        UH0::UH0_Cons(v6, v7) => {
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH0> = v7.clone();
            let mut v8: Rc<UH0> = method20(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v7.clone(), v5.clone());
            let mut v9: bool = v6.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v10: bool = v9 != true;
            let mut v17: bool = if v10 {
                let mut v11: US1 = US1::US1_None;
                let mut v12: US1 = method4(v6.clone(), v1.clone(), v11.clone());
                let mut v15: bool = match &v12 {
                    US1::US1_None => {
                        false
                    }
                    US1::US1_Some(v13) => {
                        let mut v13: Rc<str> = v13.clone();
                        true
                    }
                };
                let mut v16: bool = v15 == false;
                v16
            } else {
                false
            };
            if v17 {
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
fn method19(mut v0: Rc<UH0>, mut v1: Rc<UH0>, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v5, v6) => {
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH0> = v6.clone();
            let mut v7: Rc<UH0> = method20(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v6.clone(), v4.clone());
            let mut v8: bool = v5.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v9: bool = v8 != true;
            let mut v16: bool = if v9 {
                let mut v10: US1 = US1::US1_None;
                let mut v11: US1 = method4(v5.clone(), v1.clone(), v10.clone());
                let mut v14: bool = match &v11 {
                    US1::US1_None => {
                        false
                    }
                    US1::US1_Some(v12) => {
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
                Rc::new(UH0::UH0_Cons(v5.clone(), v7.clone()))
            } else {
                v7.clone()
            }
        }
        UH0::UH0_Nil => {
            v4.clone()
        }
    }
}
fn traced_refs_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: i32, mut v6: Rc<str>, mut v7: bool, mut v8: bool, mut v9: i32, mut v10: bool) -> (Rc<str>, Rc<str>, Rc<str>) {
    let mut v11: i32 = (v0.clone().len() as i32);
    let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let mut v13: bool = v0.ends_with(&*v12);
    let mut v16: Rc<str> = if v13 {
        let mut v14: i32 = v11.wrapping_sub(2i32);
        let mut v15: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v14 as i64);
        v15.clone()
    } else {
        v0.clone()
    };
    let mut v17: US0 = US0::US0_BearerToken(v1.clone());
    let mut v18: i32 = 1i32;
    let mut v19: bool = v2.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v23: Rc<UH0> = if v19 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_on_1(v21.clone(), v2.clone())
    };
    let mut v24: bool = v3.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v28: Rc<UH0> = if v24 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_on_1(v26.clone(), v3.clone())
    };
    let mut v29: bool = v4.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v33: Rc<UH0> = if v29 {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
        split_on_1(v31.clone(), v4.clone())
    };
    let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v35: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let (mut v36, mut v37, mut v38, mut v39): (Rc<UH0>, Rc<UH0>, Rc<str>, Rc<UH0>) = deepen_2(v16.clone(), v17.clone(), v5, v6.clone(), v7, v8, v9, v10, v18, v23.clone(), v28.clone(), v33.clone(), v34.clone(), v35.clone());
    let (mut v40, mut v41): (Rc<str>, Rc<str>) = method8(v39.clone(), v34.clone());
    let mut v42: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v43: Rc<UH0> = method19(v36.clone(), v37.clone(), v38.clone(), v39.clone(), v42.clone());
    let mut v44: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v45: Rc<UH0> = method3(v43.clone(), v44.clone());
    let (mut v46, mut v47): (Rc<str>, Rc<str>) = method8(v45.clone(), v34.clone());
    (v40.clone(), v38.clone(), v46.clone())
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, bool) -> (Rc<str>, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, bool) -> (Rc<str>, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: i32, mut v6: bool| -> (Rc<str>, Rc<str>, Rc<str>) {
        let mut v7: i32 = 5i32;
        let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v9: bool = false;
        let mut v10: bool = false;
        traced_refs_0(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v7, v8.clone(), v9, v10, v5, v6)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_refs(v0: &str, v1: &str, v2: &str, v3: &str, v4: &str, v5: i32, v6: bool) -> (Rc<str>, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), Rc::<str>::from(v3), Rc::<str>::from(v4), v5, v6)
}
