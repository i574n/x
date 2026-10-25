#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(serde_json::Value, Rc<UH0>),
}
#[derive(Clone)]
enum US0 {
    US0_Quoted,
    US0_RepliedTo,
    US0_Reposted,
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(US0, Rc<str>, Rc<UH2>),
}
#[derive(Clone)]
enum UH3 {
    UH3_Nil,
    UH3_Cons(Rc<str>, Rc<str>, Rc<str>, Rc<UH3>),
}
#[derive(Clone)]
enum UH4 {
    UH4_Nil,
    UH4_Cons(Rc<str>, Rc<UH4>),
}
struct Heap0 { l0: Rc<str>, l1: Rc<str>, l2: Rc<str>, l3: Rc<str>, l4: Rc<str>, l5: i32, l6: i32, l7: i32, l8: Rc<UH2>, l9: Rc<UH3>, l10: Rc<UH4> }
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<Heap0>, Rc<UH1>),
}
#[derive(Clone)]
enum UH5 {
    UH5_Nil,
    UH5_Cons(Rc<str>, Rc<str>, Rc<str>, Rc<UH5>),
}
#[derive(Clone)]
enum UH6 {
    UH6_Nil,
    UH6_Cons(Rc<str>, Rc<str>, Rc<UH6>),
}
#[derive(Clone)]
enum UH7 {
    UH7_Nil,
    UH7_Cons(Rc<UH2>, Rc<UH7>),
}
#[derive(Clone)]
enum UH8 {
    UH8_Nil,
    UH8_Cons(Rc<str>, Rc<UH8>),
}
struct Heap1 { l0: Rc<str>, l1: Rc<str>, l2: Rc<str>, l3: Rc<str>, l4: Rc<str>, l5: Rc<str>, l6: Rc<str>, l7: Rc<UH4>, l8: Rc<UH2> }
#[derive(Clone)]
enum US1 {
    US1_Some(Rc<str>, Rc<str>),
    US1_None,
}
#[derive(Clone)]
enum US2 {
    US2_Some(Rc<str>, Rc<str>, Rc<str>),
    US2_None,
}
fn from_1(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v6.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v7.clone());
            continue;
        }
    }
}
fn from_7(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH7>) -> Rc<UH7> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("type"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let v11: serde_json::Value = v6.get(&*v10).cloned().unwrap_or_default();
            let mut v12: Rc<str> = Rc::<str>::from(v11.as_str().unwrap_or(""));
            let v13: bool = &*v9 == "quoted";
            let mut v30: Rc<UH2> = if v13 {
                let v14: US0 = US0::US0_Quoted;
                let mut v15: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                Rc::new(UH2::UH2_Cons(v14.clone(), v12.clone(), v15.clone()))
            } else {
                let v17: bool = &*v9 == "replied_to";
                if v17 {
                    let v18: US0 = US0::US0_RepliedTo;
                    let v19: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    Rc::new(UH2::UH2_Cons(v18.clone(), v12.clone(), v19.clone()))
                } else {
                    let mut v21: bool = &*v9 == "reposted";
                    let v23: bool = if v21 {
                        true
                    } else {
                        let v22: bool = &*v9 == "retweeted";
                        v22
                    };
                    if v23 {
                        let v24: US0 = US0::US0_Reposted;
                        let v25: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                        Rc::new(UH2::UH2_Cons(v24.clone(), v12.clone(), v25.clone()))
                    } else {
                        { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
                    }
                }
            };
            let v31: Rc<UH7> = Rc::new(UH7::UH7_Cons(v30.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v31.clone());
            continue;
        }
    }
}
fn method9(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let v2: US0 = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let v4: Rc<UH2> = v4.clone();
            let v5: Rc<UH2> = method9(v4, v1.clone());
            Rc::new(UH2::UH2_Cons(v2, v3, v5))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn method8(mut v0: Rc<UH7>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH7::UH7_Cons(v2, v3) => {
            let v2: Rc<UH2> = v2.clone();
            let mut v3: Rc<UH7> = v3.clone();
            let v4: Rc<UH2> = method8(v3, v1.clone());
            method9(v2, v4)
        }
        UH7::UH7_Nil => {
            v1
        }
    }
}
fn from_10(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH3>) -> Rc<UH3> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("url"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("expanded_url"); } LIT.with(|lit| lit.clone()) };
            let v11: serde_json::Value = v6.get(&*v10).cloned().unwrap_or_default();
            let mut v12: Rc<str> = Rc::<str>::from(v11.as_str().unwrap_or(""));
            let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
            let v14: serde_json::Value = v6.get(&*v13).cloned().unwrap_or_default();
            let mut v15: Rc<str> = Rc::<str>::from(v14.as_str().unwrap_or(""));
            let v16: Rc<UH3> = Rc::new(UH3::UH3_Cons(v9.clone(), v12.clone(), v15.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v16.clone());
            continue;
        }
    }
}
fn from_11(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH4>) -> Rc<UH4> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
            let v8: Rc<UH4> = Rc::new(UH4::UH4_Cons(v7.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v8.clone());
            continue;
        }
    }
}
fn post_by_6(mut v0: Rc<str>, mut v1: serde_json::Value) -> Rc<Heap0> {
    let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
    let mut v3: serde_json::Value = v1.get(&*v2).cloned().unwrap_or_default();
    let v4: Rc<str> = Rc::<str>::from(v3.as_str().unwrap_or(""));
    let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("author_id"); } LIT.with(|lit| lit.clone()) };
    let v6: serde_json::Value = v1.get(&*v5).cloned().unwrap_or_default();
    let v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
    let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("created_at"); } LIT.with(|lit| lit.clone()) };
    let v9: serde_json::Value = v1.get(&*v8).cloned().unwrap_or_default();
    let v10: Rc<str> = Rc::<str>::from(v9.as_str().unwrap_or(""));
    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
    let mut v12: serde_json::Value = v1.get(&*v11).cloned().unwrap_or_default();
    let v13: Rc<str> = Rc::<str>::from(v12.as_str().unwrap_or(""));
    let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&lt;"); } LIT.with(|lit| lit.clone()) };
    let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("<"); } LIT.with(|lit| lit.clone()) };
    let v16: Rc<str> = Rc::<str>::from(v13.replace(&*v14, &*v15));
    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&gt;"); } LIT.with(|lit| lit.clone()) };
    let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(">"); } LIT.with(|lit| lit.clone()) };
    let v19: Rc<str> = Rc::<str>::from(v16.replace(&*v17, &*v18));
    let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&amp;"); } LIT.with(|lit| lit.clone()) };
    let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&"); } LIT.with(|lit| lit.clone()) };
    let v22: Rc<str> = Rc::<str>::from(v19.replace(&*v20, &*v21));
    let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("public_metrics"); } LIT.with(|lit| lit.clone()) };
    let v24: serde_json::Value = v1.get(&*v23).cloned().unwrap_or_default();
    let v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reply_count"); } LIT.with(|lit| lit.clone()) };
    let mut v26: serde_json::Value = v24.get(&*v25).cloned().unwrap_or_default();
    let v27: i64 = v26.as_i64().unwrap_or(0);
    let mut v28: i32 = (v27 as i32);
    let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("repost_count"); } LIT.with(|lit| lit.clone()) };
    let mut v30: serde_json::Value = v24.get(&*v29).cloned().unwrap_or_default();
    let v31: i64 = v30.as_i64().unwrap_or(0);
    let v32: i32 = (v31 as i32);
    let v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("like_count"); } LIT.with(|lit| lit.clone()) };
    let mut v34: serde_json::Value = v24.get(&*v33).cloned().unwrap_or_default();
    let v35: i64 = v34.as_i64().unwrap_or(0);
    let v36: i32 = (v35 as i32);
    let v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
    let mut v38: serde_json::Value = v1.get(&*v37).cloned().unwrap_or_default();
    let v39: usize = v38.as_array().map_or(0, Vec::len);
    let v40: i32 = ((v39) as i32);
    let v41: i32 = v40.wrapping_sub(1i32);
    let v42: Rc<UH7> = { thread_local!{ static CASE: Rc<UH7> = Rc::new(UH7::UH7_Nil); } CASE.with(|case| case.clone()) };
    let v43: Rc<UH7> = from_7(v38, v41, v42);
    let v44: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let mut v45: Rc<UH2> = method8(v43, v44);
    let v46: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("entities"); } LIT.with(|lit| lit.clone()) };
    let v47: serde_json::Value = v1.get(&*v46).cloned().unwrap_or_default();
    let v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("urls"); } LIT.with(|lit| lit.clone()) };
    let mut v49: serde_json::Value = v47.get(&*v48).cloned().unwrap_or_default();
    let v50: usize = v49.as_array().map_or(0, Vec::len);
    let v51: i32 = ((v50) as i32);
    let v52: i32 = v51.wrapping_sub(1i32);
    let v53: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let v54: Rc<UH3> = from_10(v49, v52, v53);
    let v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("attachments"); } LIT.with(|lit| lit.clone()) };
    let v56: serde_json::Value = v1.get(&*v55).cloned().unwrap_or_default();
    let v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("media_keys"); } LIT.with(|lit| lit.clone()) };
    let mut v58: serde_json::Value = v56.get(&*v57).cloned().unwrap_or_default();
    let v59: usize = v58.as_array().map_or(0, Vec::len);
    let v60: i32 = ((v59) as i32);
    let v61: i32 = v60.wrapping_sub(1i32);
    let v62: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let v63: Rc<UH4> = from_11(v58, v61, v62);
    Rc::new(Heap0 { l0: v4, l1: v7, l2: v0, l3: v10, l4: v22, l5: v28, l6: v32, l7: v36, l8: v45, l9: v54, l10: v63 })
}
fn from_5(mut v0: Rc<str>, mut v1: serde_json::Value, mut v2: i32, mut v3: Rc<UH1>) -> Rc<UH1> {
    loop {
        let v4: bool = v2 < 0i32;
        if v4 {
            return v3.clone();
        } else {
            let v5: i32 = v2.wrapping_sub(1i32);
            let v6: usize = ((v2) as usize);
            let v7: serde_json::Value = v1.get(v6).cloned().unwrap_or_default();
            let v8: Rc<Heap0> = post_by_6(v0.clone(), v7.clone());
            let v9: Rc<UH1> = Rc::new(UH1::UH1_Cons(v8.clone(), v3.clone()));
            (v0, v1, v2, v3) = (v0.clone(), v1.clone(), v5, v9.clone());
            continue;
        }
    }
}
fn method12(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<Heap0> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let v4: Rc<UH1> = method12(v3, v1.clone());
            Rc::new(UH1::UH1_Cons(v2, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn from_13(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH5>) -> Rc<UH5> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("media_key"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("type"); } LIT.with(|lit| lit.clone()) };
            let v11: serde_json::Value = v6.get(&*v10).cloned().unwrap_or_default();
            let mut v12: Rc<str> = Rc::<str>::from(v11.as_str().unwrap_or(""));
            let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("alt_text"); } LIT.with(|lit| lit.clone()) };
            let v14: serde_json::Value = v6.get(&*v13).cloned().unwrap_or_default();
            let mut v15: Rc<str> = Rc::<str>::from(v14.as_str().unwrap_or(""));
            let v16: Rc<UH5> = Rc::new(UH5::UH5_Cons(v9.clone(), v12.clone(), v15.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v16.clone());
            continue;
        }
    }
}
fn from_14(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH6>) -> Rc<UH6> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("username"); } LIT.with(|lit| lit.clone()) };
            let v11: serde_json::Value = v6.get(&*v10).cloned().unwrap_or_default();
            let mut v12: Rc<str> = Rc::<str>::from(v11.as_str().unwrap_or(""));
            let v13: Rc<UH6> = Rc::new(UH6::UH6_Cons(v9.clone(), v12.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v13.clone());
            continue;
        }
    }
}
fn method15(mut v0: Rc<UH6>, mut v1: Rc<UH6>) -> Rc<UH6> {
    match &*v0 {
        UH6::UH6_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let v4: Rc<UH6> = v4.clone();
            let v5: Rc<UH6> = method15(v4, v1.clone());
            let v6: bool = &*v3 != "";
            if v6 {
                Rc::new(UH6::UH6_Cons(v2, v3, v5.clone()))
            } else {
                v5
            }
        }
        UH6::UH6_Nil => {
            v1
        }
    }
}
fn posts_of_doc_4(mut v0: Rc<str>, mut v1: serde_json::Value) -> (Rc<UH1>, Rc<UH5>, Rc<UH6>, Rc<UH1>, Rc<str>) {
    let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
    let mut v3: serde_json::Value = v1.get(&*v2).cloned().unwrap_or_default();
    let v4: usize = v3.as_array().map_or(0, Vec::len);
    let v5: i32 = ((v4) as i32);
    let v6: i32 = v5.wrapping_sub(1i32);
    let v7: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v8: Rc<UH1> = from_5(v0, v3, v6, v7);
    let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("includes"); } LIT.with(|lit| lit.clone()) };
    let v10: serde_json::Value = v1.get(&*v9).cloned().unwrap_or_default();
    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts"); } LIT.with(|lit| lit.clone()) };
    let mut v12: serde_json::Value = v10.get(&*v11).cloned().unwrap_or_default();
    let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v14: usize = v12.as_array().map_or(0, Vec::len);
    let mut v15: i32 = ((v14) as i32);
    let v16: i32 = v15.wrapping_sub(1i32);
    let v17: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v18: Rc<UH1> = from_5(v13, v12, v16, v17);
    let v19: Rc<UH1> = method12(v8.clone(), v18);
    let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("media"); } LIT.with(|lit| lit.clone()) };
    let mut v21: serde_json::Value = v10.get(&*v20).cloned().unwrap_or_default();
    let v22: usize = v21.as_array().map_or(0, Vec::len);
    let v23: i32 = ((v22) as i32);
    let v24: i32 = v23.wrapping_sub(1i32);
    let v25: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
    let mut v26: Rc<UH5> = from_13(v21, v24, v25);
    let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("users"); } LIT.with(|lit| lit.clone()) };
    let mut v28: serde_json::Value = v10.get(&*v27).cloned().unwrap_or_default();
    let v29: usize = v28.as_array().map_or(0, Vec::len);
    let mut v30: i32 = ((v29) as i32);
    let v31: i32 = v30.wrapping_sub(1i32);
    let v32: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
    let v33: Rc<UH6> = from_14(v28, v31, v32);
    let mut v34: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
    let v35: Rc<UH6> = method15(v33, v34);
    let v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
    let v37: serde_json::Value = v1.get(&*v36).cloned().unwrap_or_default();
    let mut v38: usize = ((0i32) as usize);
    let v39: serde_json::Value = v37.get(v38).cloned().unwrap_or_default();
    let v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
    let v41: serde_json::Value = v39.get(&*v40).cloned().unwrap_or_default();
    let v42: Rc<str> = Rc::<str>::from(v41.as_str().unwrap_or(""));
    let v43: bool = &*v42 != "";
    let v47: Rc<str> = if v43 {
        v42
    } else {
        let v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
        let mut v45: serde_json::Value = v39.get(&*v44).cloned().unwrap_or_default();
        let v46: Rc<str> = Rc::<str>::from(v45.as_str().unwrap_or(""));
        v46
    };
    (v19, v26, v35, v8, v47)
}
fn go_16(mut v0: i32, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v1 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<Heap0> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let v4: bool = v0 > 0i32;
            if v4 {
                let v5: i32 = v0.wrapping_sub(1i32);
                let v6: Rc<UH1> = go_16(v5, v3);
                Rc::new(UH1::UH1_Cons(v2, v6))
            } else {
                { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
            }
        }
        _ => {
            { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
        }
    }
}
fn method18(mut v0: Rc<UH5>, mut v1: Rc<UH5>) -> Rc<UH5> {
    match &*v0 {
        UH5::UH5_Cons(v2, v3, v4, v5) => {
            let v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let v4: Rc<str> = v4.clone();
            let v5: Rc<UH5> = v5.clone();
            let v6: Rc<UH5> = method18(v5, v1.clone());
            Rc::new(UH5::UH5_Cons(v2, v3, v4, v6))
        }
        UH5::UH5_Nil => {
            v1
        }
    }
}
fn method19(mut v0: Rc<UH6>, mut v1: Rc<UH6>) -> Rc<UH6> {
    match &*v0 {
        UH6::UH6_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let v4: Rc<UH6> = v4.clone();
            let v5: Rc<UH6> = method19(v4, v1.clone());
            Rc::new(UH6::UH6_Cons(v2, v3, v5))
        }
        UH6::UH6_Nil => {
            v1
        }
    }
}
fn merge_pools_17(mut v0: Rc<UH1>, mut v1: Rc<UH5>, mut v2: Rc<UH6>, mut v3: Rc<UH1>, mut v4: Rc<UH5>, mut v5: Rc<UH6>) -> (Rc<UH1>, Rc<UH5>, Rc<UH6>) {
    let v6: Rc<UH1> = method12(v0, v3);
    let v7: Rc<UH5> = method18(v1, v4);
    let v8: Rc<UH6> = method19(v2, v5);
    (v6, v7, v8)
}
fn method20(mut v0: Rc<UH1>, mut v1: Rc<UH8>) -> Rc<UH8> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<Heap0> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let v4: Rc<UH8> = method20(v3, v1.clone());
            let v5: Rc<str> = v2.l0.clone();
            Rc::new(UH8::UH8_Cons(v5, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn closure1(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> bool> {
    Rc::new(move |mut v1: Rc<str>| -> bool {
        let v2: bool = &*v0 == &*v1;
        v2
    })
}
fn method22(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> bool> {
    closure1(v0)
}
fn method23(mut v0: Rc<str>, mut v1: Rc<dyn Fn(Rc<str>) -> bool>, mut v2: Rc<UH8>) -> bool {
    loop {
        match &*v2 {
            UH8::UH8_Cons(v3, v4) => {
                let mut v3: Rc<str> = v3.clone();
                let v4: Rc<UH8> = v4.clone();
                let v5: bool = v1(v3.clone());
                if v5 {
                    return true;
                } else {
                    let v6: Rc<dyn Fn(Rc<str>) -> bool> = method22(v0.clone());
                    (v0, v1, v2) = (v0.clone(), v6.clone(), v4.clone());
                    continue;
                }
            }
            UH8::UH8_Nil => {
                return false;
            }
        }
    }
}
fn method21(mut v0: Rc<UH8>, mut v1: Rc<UH1>, mut v2: Rc<UH1>) -> Rc<UH1> {
    match &*v1 {
        UH1::UH1_Cons(v3, v4) => {
            let mut v3: Rc<Heap0> = v3.clone();
            let v4: Rc<UH1> = v4.clone();
            let v5: Rc<UH1> = method21(v0.clone(), v4, v2.clone());
            let v6: Rc<str> = v3.l0.clone();
            let v7: Rc<dyn Fn(Rc<str>) -> bool> = method22(v6.clone());
            let v8: bool = method23(v6, v7, v0);
            let v9: bool = v8 == false;
            if v9 {
                Rc::new(UH1::UH1_Cons(v3, v5.clone()))
            } else {
                v5
            }
        }
        UH1::UH1_Nil => {
            v2
        }
    }
}
fn absorb_entry_3(mut v0: Rc<UH1>, mut v1: Rc<UH1>, mut v2: Rc<UH5>, mut v3: Rc<UH6>, mut v4: serde_json::Value) -> (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) {
    let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("role"); } LIT.with(|lit| lit.clone()) };
    let v6: serde_json::Value = v4.get(&*v5).cloned().unwrap_or_default();
    let v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
    let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("doc"); } LIT.with(|lit| lit.clone()) };
    let v9: serde_json::Value = v4.get(&*v8).cloned().unwrap_or_default();
    let v10: bool = &*v7 == "primary";
    let (mut v56, mut v57, mut v58, mut v59): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = if v10 {
        let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("author"); } LIT.with(|lit| lit.clone()) };
        let mut v12: serde_json::Value = v4.get(&*v11).cloned().unwrap_or_default();
        let v13: Rc<str> = Rc::<str>::from(v12.as_str().unwrap_or(""));
        let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("keep"); } LIT.with(|lit| lit.clone()) };
        let mut v15: serde_json::Value = v4.get(&*v14).cloned().unwrap_or_default();
        let v16: i64 = v15.as_i64().unwrap_or(0);
        let v17: i32 = (v16 as i32);
        let (mut v18, mut v19, mut v20, mut v21, mut v22): (Rc<UH1>, Rc<UH5>, Rc<UH6>, Rc<UH1>, Rc<str>) = posts_of_doc_4(v13, v9.clone());
        let v23: bool = v17 > 0i32;
        let v25: Rc<UH1> = if v23 {
            go_16(v17, v21.clone())
        } else {
            v21
        };
        let mut v26: Rc<UH1> = method12(v25, v0.clone());
        let (mut v27, mut v28, mut v29): (Rc<UH1>, Rc<UH5>, Rc<UH6>) = merge_pools_17(v1.clone(), v2.clone(), v3.clone(), v18, v19, v20);
        (v26, v27, v28, v29)
    } else {
        let mut v30: bool = &*v7 == "lookup";
        let (mut v52, mut v53, mut v54, mut v55): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = if v30 {
            let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v32, mut v33, mut v34, mut v35, mut v36): (Rc<UH1>, Rc<UH5>, Rc<UH6>, Rc<UH1>, Rc<str>) = posts_of_doc_4(v31, v9.clone());
            let v37: Rc<UH8> = { thread_local!{ static CASE: Rc<UH8> = Rc::new(UH8::UH8_Nil); } CASE.with(|case| case.clone()) };
            let mut v38: Rc<UH8> = method20(v32.clone(), v37);
            let v39: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let v40: Rc<UH1> = method21(v38, v1.clone(), v39);
            let (mut v41, mut v42, mut v43): (Rc<UH1>, Rc<UH5>, Rc<UH6>) = merge_pools_17(v32, v33, v34, v40, v2.clone(), v3.clone());
            (v0.clone(), v41, v42, v43)
        } else {
            let v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v45: serde_json::Value = v9.get(&*v44).cloned().unwrap_or_default();
            let v46: usize = v45.as_array().map_or(0, Vec::len);
            let v47: i32 = ((v46) as i32);
            let v48: i32 = v47.wrapping_sub(1i32);
            let mut v49: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
            let v50: Rc<UH6> = from_14(v45, v48, v49);
            let v51: Rc<UH6> = method19(v3, v50);
            (v0, v1, v2, v51)
        };
        (v52, v53, v54, v55)
    };
    (v56, v57, v58, v59)
}
fn method2(mut v0: Rc<UH0>, mut v1: Rc<UH1>, mut v2: Rc<UH1>, mut v3: Rc<UH5>, mut v4: Rc<UH6>) -> (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) {
    let (mut v19, mut v20, mut v21, mut v22): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = match &*v0 {
        UH0::UH0_Cons(v5, v6) => {
            let v5: serde_json::Value = v5.clone();
            let v6: Rc<UH0> = v6.clone();
            let (mut v7, mut v8, mut v9, mut v10): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = absorb_entry_3(v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5);
            method2(v6, v7, v8, v9, v10)
        }
        _ => {
            let (mut v15, mut v16, mut v17, mut v18): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1, v2, v3, v4)
                }
                _ => unreachable!(),
            };
            (v15, v16, v17, v18)
        }
    };
    (v19, v20, v21, v22)
}
fn method27(mut v0: Rc<Heap0>, mut v1: Rc<UH6>) -> US1 {
    loop {
        match &*v1 {
            UH6::UH6_Cons(v3, v4, v5) => {
                let mut v3: Rc<str> = v3.clone();
                let v4: Rc<str> = v4.clone();
                let v5: Rc<UH6> = v5.clone();
                let v6: Rc<str> = v0.l1.clone();
                let v7: bool = &*v3 == &*v6;
                if v7 {
                    return US1::US1_Some(v3.clone(), v4.clone());
                } else {
                    (v0, v1) = (v0.clone(), v5.clone());
                    continue;
                }
            }
            UH6::UH6_Nil => {
                return US1::US1_None;
            }
        }
    }
}
fn single_line_29(mut v0: Rc<str>) -> Rc<str> {
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
    let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
    let mut v3: Rc<str> = Rc::<str>::from(v0.replace(&*v1, &*v2));
    let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let v5: Rc<str> = Rc::<str>::from(v3.replace(&*v4, &*v2));
    let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
    let v7: Rc<str> = Rc::<str>::from(v5.replace(&*v6, &*v2));
    let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
    let v9: Rc<str> = Rc::<str>::from(v7.replace(&*v8, &*v2));
    v9
}
fn method30(mut v0: Rc<UH3>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match &*v0 {
            UH3::UH3_Cons(v2, v3, v4, v5) => {
                let v2: Rc<str> = v2.clone();
                let mut v3: Rc<str> = v3.clone();
                let v4: Rc<str> = v4.clone();
                let v5: Rc<UH3> = v5.clone();
                let v6: bool = &*v3 == "";
                let v8: Rc<str> = if v6 {
                    v1.clone()
                } else {
                    let v7: Rc<str> = Rc::<str>::from(v1.replace(&*v2, &*v3));
                    v7.clone()
                };
                (v0, v1) = (v5.clone(), v8.clone());
                continue;
            }
            UH3::UH3_Nil => {
                return v1.clone();
            }
        }
    }
}
fn shown_text_28(mut v0: Rc<Heap0>) -> Rc<str> {
    let mut v1: Rc<str> = v0.l4.clone();
    let v2: Rc<UH3> = v0.l9.clone();
    let mut v3: Rc<str> = method30(v2, v1);
    single_line_29(v3)
}
fn method32(mut v0: Rc<str>, mut v1: Rc<UH5>) -> US2 {
    loop {
        match &*v1 {
            UH5::UH5_Cons(v3, v4, v5, v6) => {
                let mut v3: Rc<str> = v3.clone();
                let v4: Rc<str> = v4.clone();
                let v5: Rc<str> = v5.clone();
                let v6: Rc<UH5> = v6.clone();
                let v7: bool = &*v3 == &*v0;
                if v7 {
                    return US2::US2_Some(v3.clone(), v4.clone(), v5.clone());
                } else {
                    (v0, v1) = (v0.clone(), v6.clone());
                    continue;
                }
            }
            UH5::UH5_Nil => {
                return US2::US2_None;
            }
        }
    }
}
fn method31(mut v0: Rc<UH1>, mut v1: Rc<UH5>, mut v2: Rc<UH6>, mut v3: Rc<UH4>, mut v4: Rc<UH4>) -> Rc<UH4> {
    match &*v3 {
        UH4::UH4_Cons(v5, v6) => {
            let v5: Rc<str> = v5.clone();
            let v6: Rc<UH4> = v6.clone();
            let v7: Rc<UH4> = method31(v0, v1.clone(), v2, v6, v4.clone());
            let v8: US2 = method32(v5, v1);
            let mut v26: Rc<str> = match &v8 {
                US2::US2_None => {
                    let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("[media]"); } LIT.with(|lit| lit.clone()) };
                    v24
                }
                US2::US2_Some(v9, v10, v11) => {
                    let v9: Rc<str> = v9.clone();
                    let v10: Rc<str> = v10.clone();
                    let v11: Rc<str> = v11.clone();
                    let mut v12: bool = &*v11 == "";
                    if v12 {
                        let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
                        let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v10));
                        let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
                        let v16: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v15));
                        v16
                    } else {
                        let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
                        let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v10));
                        let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("] "); } LIT.with(|lit| lit.clone()) };
                        let v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v19));
                        let mut v21: Rc<str> = single_line_29(v11);
                        let v22: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v21));
                        v22
                    }
                }
            };
            Rc::new(UH4::UH4_Cons(v26, v7))
        }
        UH4::UH4_Nil => {
            v4
        }
    }
}
fn method33(mut v0: Rc<UH3>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3, v4, v5) => {
            let v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let v4: Rc<str> = v4.clone();
            let v5: Rc<UH3> = v5.clone();
            let v6: Rc<UH3> = method33(v5, v1.clone());
            let v7: bool = &*v4 != "";
            if v7 {
                Rc::new(UH3::UH3_Cons(v2, v3, v4, v6.clone()))
            } else {
                v6
            }
        }
        UH3::UH3_Nil => {
            v1
        }
    }
}
fn method34(mut v0: Rc<UH3>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3, v4, v5) => {
            let v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let v4: Rc<str> = v4.clone();
            let v5: Rc<UH3> = v5.clone();
            let v6: Rc<UH4> = method34(v5, v1.clone());
            let v7: Rc<str> = single_line_29(v4);
            let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("[url] "); } LIT.with(|lit| lit.clone()) };
            let v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v7));
            Rc::new(UH4::UH4_Cons(v9, v6))
        }
        UH3::UH3_Nil => {
            v1
        }
    }
}
fn method35(mut v0: Rc<UH4>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH4::UH4_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH4> = v3.clone();
            let v4: Rc<UH4> = method35(v3, v1.clone());
            Rc::new(UH4::UH4_Cons(v2, v4))
        }
        UH4::UH4_Nil => {
            v1
        }
    }
}
fn entry_of_26(mut v0: Rc<UH1>, mut v1: Rc<UH5>, mut v2: Rc<UH6>, mut v3: Rc<Heap0>) -> Rc<Heap1> {
    let (mut v4, mut v5, mut v6): (i32, i32, i32) = (v3.l5.clone(), v3.l6.clone(), v3.l7.clone());
    let v7: Rc<str> = Rc::<str>::from(format!("{:?}", v4));
    let v8: Rc<str> = Rc::<str>::from(format!("{:?}", v5));
    let v9: Rc<str> = Rc::<str>::from(format!("{:?}", v6));
    let v10: Rc<str> = v3.l2.clone();
    let v11: bool = &*v10 != "";
    let mut v21: Rc<str> = if v11 {
        let mut v12: Rc<str> = v3.l2.clone();
        v12
    } else {
        let v13: US1 = method27(v3.clone(), v2.clone());
        match &v13 {
            US1::US1_None => {
                let v16: Rc<str> = v3.l1.clone();
                let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("user "); } LIT.with(|lit| lit.clone()) };
                let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v16));
                v18
            }
            US1::US1_Some(v14, v15) => {
                let v14: Rc<str> = v14.clone();
                let mut v15: Rc<str> = v15.clone();
                v15
            }
        }
    };
    let v22: Rc<str> = v3.l3.clone();
    let v23: Rc<str> = shown_text_28(v3.clone());
    let v24: Rc<UH4> = v3.l10.clone();
    let v25: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v26: Rc<UH4> = method31(v0, v1, v2, v24, v25);
    let v27: Rc<UH3> = v3.l9.clone();
    let mut v28: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let v29: Rc<UH3> = method33(v27, v28);
    let mut v30: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let v31: Rc<UH4> = method34(v29, v30);
    let v32: Rc<UH4> = method35(v26, v31);
    let v33: Rc<str> = v3.l0.clone();
    let mut v34: Rc<UH2> = v3.l8.clone();
    Rc::new(Heap1 { l0: v33, l1: v21, l2: v22, l3: v23, l4: v7, l5: v8, l6: v9, l7: v32, l8: v34 })
}
fn method37(mut v0: Rc<UH2>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let v2: US0 = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let v4: Rc<UH2> = v4.clone();
            let v5: Rc<UH4> = method37(v4, v1.clone());
            let v11: Rc<str> = match &v2 {
                US0::US0_Quoted => {
                    let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
                    v6
                }
                US0::US0_RepliedTo => {
                    let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replied_to"); } LIT.with(|lit| lit.clone()) };
                    v7
                }
                US0::US0_Reposted => {
                    let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposted"); } LIT.with(|lit| lit.clone()) };
                    v8
                }
            };
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let v14: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v11, v12)), v3));
            Rc::new(UH4::UH4_Cons(v14, v5))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn method38(mut v0: Rc<str>, mut v1: Rc<UH4>, mut v2: Rc<str>, mut v3: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v1 {
        UH4::UH4_Cons(v4, v5) => {
            let v4: Rc<str> = v4.clone();
            let v5: Rc<UH4> = v5.clone();
            let (mut v6, mut v7): (Rc<str>, Rc<str>) = method38(v0.clone(), v5, v2.clone(), v3.clone());
            let v9: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v4, v7)), v6));
            (v9, v0)
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v1 {
                UH4::UH4_Nil => {
                    (v2, v3)
                }
                _ => unreachable!(),
            };
            (v10, v11)
        }
    };
    (v12, v13)
}
fn entry_line_36(mut v0: Rc<str>, mut v1: Rc<Heap1>) -> Rc<str> {
    let v2: Rc<str> = v1.l0.clone();
    let mut v3: Rc<str> = v1.l1.clone();
    let v4: Rc<str> = v1.l2.clone();
    let v5: Rc<UH2> = v1.l8.clone();
    let v6: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let v7: Rc<UH4> = method37(v5, v6);
    let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v10, mut v11): (Rc<str>, Rc<str>) = method38(v8, v7, v9.clone(), v9.clone());
    let mut v12: Rc<str> = v1.l3.clone();
    let v13: Rc<str> = v1.l4.clone();
    let v14: Rc<str> = v1.l5.clone();
    let mut v15: Rc<str> = v1.l6.clone();
    let v16: Rc<UH4> = v1.l7.clone();
    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
    let (mut v18, mut v19): (Rc<str>, Rc<str>) = method38(v17.clone(), v16, v9.clone(), v9);
    let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v15, v19)), v18));
    let v23: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v14, v17)), v21));
    let v25: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v13, v17)), v23));
    let v27: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v12, v17)), v25));
    let v29: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v10, v17)), v27));
    let v31: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v4, v17)), v29));
    let v33: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v3, v17)), v31));
    let v35: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v2, v17)), v33));
    let v37: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v0, v17)), v35));
    v37
}
fn method25(mut v0: Rc<UH1>, mut v1: Rc<UH5>, mut v2: Rc<UH6>, mut v3: Rc<str>, mut v4: Rc<UH1>, mut v5: Rc<UH4>) -> Rc<UH4> {
    match &*v4 {
        UH1::UH1_Cons(v6, v7) => {
            let v6: Rc<Heap0> = v6.clone();
            let v7: Rc<UH1> = v7.clone();
            let v8: Rc<UH4> = method25(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v7, v5.clone());
            let v9: Rc<Heap1> = entry_of_26(v0, v1, v2, v6);
            let v10: Rc<str> = entry_line_36(v3, v9);
            Rc::new(UH4::UH4_Cons(v10, v8))
        }
        UH1::UH1_Nil => {
            v5
        }
    }
}
fn entry_lines_of_24(mut v0: Rc<str>, mut v1: Rc<UH1>, mut v2: Rc<UH5>, mut v3: Rc<UH6>, mut v4: Rc<UH1>) -> Rc<UH4> {
    let v5: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    method25(v1, v2, v3, v0, v4, v5)
}
fn digested_0(mut v0: Rc<str>) -> Rc<str> {
    let mut v1: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v0).unwrap_or_default();
    let v2: usize = v1.as_array().map_or(0, Vec::len);
    let mut v3: i32 = ((v2) as i32);
    let v4: i32 = v3.wrapping_sub(1i32);
    let v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v6: Rc<UH0> = from_1(v1, v4, v5);
    let v7: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v8: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v9: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
    let v10: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
    let (mut v11, mut v12, mut v13, mut v14): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = method2(v6, v7, v8, v9, v10);
    let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("p"); } LIT.with(|lit| lit.clone()) };
    let v16: Rc<UH4> = entry_lines_of_24(v15, v12.clone(), v13.clone(), v14.clone(), v11);
    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("r"); } LIT.with(|lit| lit.clone()) };
    let v18: Rc<UH4> = entry_lines_of_24(v17, v12.clone(), v13, v14, v12);
    let v19: Rc<UH4> = method35(v16, v18);
    let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v22, mut v23): (Rc<str>, Rc<str>) = method38(v20, v19, v21.clone(), v21);
    v22
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        digested_0(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_digest(v0: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0))
}
