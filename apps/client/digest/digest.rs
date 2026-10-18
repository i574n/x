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
enum US1 {
    US1_Some(Rc<str>),
    US1_None,
}
struct Heap1 { l0: Rc<str>, l1: Rc<str>, l2: Rc<str>, l3: Rc<str>, l4: Rc<str>, l5: Rc<str>, l6: Rc<str>, l7: Rc<UH4>, l8: Rc<UH2> }
#[derive(Clone)]
enum US2 {
    US2_Some(Rc<str>, Rc<str>),
    US2_None,
}
#[derive(Clone)]
enum US3 {
    US3_Some(Rc<str>, Rc<str>, Rc<str>),
    US3_None,
}
fn from_1(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<UH0> = Rc::new(UH0::UH0_Cons(v5.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v6.clone());
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
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("type"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: Rc<str> = Rc::<str>::from(v7.as_str().unwrap_or(""));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let mut v10: serde_json::Value = v5.get(&*v9).cloned().unwrap_or_default();
            let mut v11: Rc<str> = Rc::<str>::from(v10.as_str().unwrap_or(""));
            let mut v12: bool = v8.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
            let mut v29: Rc<UH2> = if v12 {
                let mut v13: US0 = US0::US0_Quoted;
                let mut v14: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                Rc::new(UH2::UH2_Cons(v13.clone(), v11.clone(), v14.clone()))
            } else {
                let mut v16: bool = v8.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replied_to"); } LIT.with(|lit| lit.clone()) };
                if v16 {
                    let mut v17: US0 = US0::US0_RepliedTo;
                    let mut v18: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    Rc::new(UH2::UH2_Cons(v17.clone(), v11.clone(), v18.clone()))
                } else {
                    let mut v20: bool = v8.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposted"); } LIT.with(|lit| lit.clone()) };
                    let mut v22: bool = if v20 {
                        true
                    } else {
                        let mut v21: bool = v8.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("retweeted"); } LIT.with(|lit| lit.clone()) };
                        v21
                    };
                    if v22 {
                        let mut v23: US0 = US0::US0_Reposted;
                        let mut v24: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                        Rc::new(UH2::UH2_Cons(v23.clone(), v11.clone(), v24.clone()))
                    } else {
                        { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
                    }
                }
            };
            let mut v30: Rc<UH7> = Rc::new(UH7::UH7_Cons(v29.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v30.clone());
            continue;
        }
    }
}
fn method9(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let mut v2: US0 = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH2> = method9(v4.clone(), v1.clone());
            Rc::new(UH2::UH2_Cons(v2.clone(), v3.clone(), v5.clone()))
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn method8(mut v0: Rc<UH7>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH7::UH7_Cons(v2, v3) => {
            let mut v2: Rc<UH2> = v2.clone();
            let mut v3: Rc<UH7> = v3.clone();
            let mut v4: Rc<UH2> = method8(v3.clone(), v1.clone());
            method9(v2.clone(), v4.clone())
        }
        UH7::UH7_Nil => {
            v1.clone()
        }
    }
}
fn from_10(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH3>) -> Rc<UH3> {
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
fn from_11(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH4>) -> Rc<UH4> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = Rc::<str>::from(v5.as_str().unwrap_or(""));
            let mut v7: Rc<UH4> = Rc::new(UH4::UH4_Cons(v6.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v7.clone());
            continue;
        }
    }
}
fn post_by_6(mut v0: Rc<str>, mut v1: serde_json::Value) -> Rc<Heap0> {
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
    let mut v3: serde_json::Value = v1.get(&*v2).cloned().unwrap_or_default();
    let mut v4: Rc<str> = Rc::<str>::from(v3.as_str().unwrap_or(""));
    let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("author_id"); } LIT.with(|lit| lit.clone()) };
    let mut v6: serde_json::Value = v1.get(&*v5).cloned().unwrap_or_default();
    let mut v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("created_at"); } LIT.with(|lit| lit.clone()) };
    let mut v9: serde_json::Value = v1.get(&*v8).cloned().unwrap_or_default();
    let mut v10: Rc<str> = Rc::<str>::from(v9.as_str().unwrap_or(""));
    let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
    let mut v12: serde_json::Value = v1.get(&*v11).cloned().unwrap_or_default();
    let mut v13: Rc<str> = Rc::<str>::from(v12.as_str().unwrap_or(""));
    let mut v14: Rc<str> = Rc::<str>::from((&*v13).replace("&lt;", "<").replace("&gt;", ">").replace("&amp;", "&"));
    let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("public_metrics"); } LIT.with(|lit| lit.clone()) };
    let mut v16: serde_json::Value = v1.get(&*v15).cloned().unwrap_or_default();
    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reply_count"); } LIT.with(|lit| lit.clone()) };
    let mut v18: serde_json::Value = v16.get(&*v17).cloned().unwrap_or_default();
    let mut v19: i32 = v18.as_i64().unwrap_or(0) as i32;
    let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("repost_count"); } LIT.with(|lit| lit.clone()) };
    let mut v21: serde_json::Value = v16.get(&*v20).cloned().unwrap_or_default();
    let mut v22: i32 = v21.as_i64().unwrap_or(0) as i32;
    let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("like_count"); } LIT.with(|lit| lit.clone()) };
    let mut v24: serde_json::Value = v16.get(&*v23).cloned().unwrap_or_default();
    let mut v25: i32 = v24.as_i64().unwrap_or(0) as i32;
    let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
    let mut v27: serde_json::Value = v1.get(&*v26).cloned().unwrap_or_default();
    let mut v28: i32 = v27.as_array().map_or(0, |a| a.len()) as i32;
    let mut v29: i32 = v28.wrapping_sub(1i32);
    let mut v30: Rc<UH7> = { thread_local!{ static CASE: Rc<UH7> = Rc::new(UH7::UH7_Nil); } CASE.with(|case| case.clone()) };
    let mut v31: Rc<UH7> = from_7(v27.clone(), v29, v30.clone());
    let mut v32: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let mut v33: Rc<UH2> = method8(v31.clone(), v32.clone());
    let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("entities"); } LIT.with(|lit| lit.clone()) };
    let mut v35: serde_json::Value = v1.get(&*v34).cloned().unwrap_or_default();
    let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("urls"); } LIT.with(|lit| lit.clone()) };
    let mut v37: serde_json::Value = v35.get(&*v36).cloned().unwrap_or_default();
    let mut v38: i32 = v37.as_array().map_or(0, |a| a.len()) as i32;
    let mut v39: i32 = v38.wrapping_sub(1i32);
    let mut v40: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let mut v41: Rc<UH3> = from_10(v37.clone(), v39, v40.clone());
    let mut v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("attachments"); } LIT.with(|lit| lit.clone()) };
    let mut v43: serde_json::Value = v1.get(&*v42).cloned().unwrap_or_default();
    let mut v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("media_keys"); } LIT.with(|lit| lit.clone()) };
    let mut v45: serde_json::Value = v43.get(&*v44).cloned().unwrap_or_default();
    let mut v46: i32 = v45.as_array().map_or(0, |a| a.len()) as i32;
    let mut v47: i32 = v46.wrapping_sub(1i32);
    let mut v48: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v49: Rc<UH4> = from_11(v45.clone(), v47, v48.clone());
    Rc::new(Heap0 { l0: v4.clone(), l1: v7.clone(), l2: v0.clone(), l3: v10.clone(), l4: v14.clone(), l5: v19, l6: v22, l7: v25, l8: v33.clone(), l9: v41.clone(), l10: v49.clone() })
}
fn from_5(mut v0: Rc<str>, mut v1: serde_json::Value, mut v2: i32, mut v3: Rc<UH1>) -> Rc<UH1> {
    loop {
        let mut v4: bool = v2 < 0i32;
        if v4 {
            return v3.clone();
        } else {
            let mut v5: i32 = v2.wrapping_sub(1i32);
            let mut v6: serde_json::Value = v1.get(v2 as usize).cloned().unwrap_or_default();
            let mut v7: Rc<Heap0> = post_by_6(v0.clone(), v6.clone());
            let mut v8: Rc<UH1> = Rc::new(UH1::UH1_Cons(v7.clone(), v3.clone()));
            (v0, v1, v2, v3) = (v0.clone(), v1.clone(), v5, v8.clone());
            continue;
        }
    }
}
fn method12(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<Heap0> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method12(v3.clone(), v1.clone());
            Rc::new(UH1::UH1_Cons(v2.clone(), v4.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn from_13(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH5>) -> Rc<UH5> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("media_key"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: Rc<str> = Rc::<str>::from(v7.as_str().unwrap_or(""));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("type"); } LIT.with(|lit| lit.clone()) };
            let mut v10: serde_json::Value = v5.get(&*v9).cloned().unwrap_or_default();
            let mut v11: Rc<str> = Rc::<str>::from(v10.as_str().unwrap_or(""));
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("alt_text"); } LIT.with(|lit| lit.clone()) };
            let mut v13: serde_json::Value = v5.get(&*v12).cloned().unwrap_or_default();
            let mut v14: Rc<str> = Rc::<str>::from(v13.as_str().unwrap_or(""));
            let mut v15: Rc<UH5> = Rc::new(UH5::UH5_Cons(v8.clone(), v11.clone(), v14.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v15.clone());
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
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: Rc<str> = Rc::<str>::from(v7.as_str().unwrap_or(""));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("username"); } LIT.with(|lit| lit.clone()) };
            let mut v10: serde_json::Value = v5.get(&*v9).cloned().unwrap_or_default();
            let mut v11: Rc<str> = Rc::<str>::from(v10.as_str().unwrap_or(""));
            let mut v12: Rc<UH6> = Rc::new(UH6::UH6_Cons(v8.clone(), v11.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v12.clone());
            continue;
        }
    }
}
fn method15(mut v0: Rc<UH6>, mut v1: Rc<UH6>) -> Rc<UH6> {
    match &*v0 {
        UH6::UH6_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH6> = v4.clone();
            let mut v5: Rc<UH6> = method15(v4.clone(), v1.clone());
            let mut v6: bool = v3.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v7: bool = v6 != true;
            if v7 {
                Rc::new(UH6::UH6_Cons(v2.clone(), v3.clone(), v5.clone()))
            } else {
                v5.clone()
            }
        }
        UH6::UH6_Nil => {
            v1.clone()
        }
    }
}
fn posts_of_doc_4(mut v0: Rc<str>, mut v1: serde_json::Value) -> (Rc<UH1>, Rc<UH5>, Rc<UH6>, Rc<UH1>, Rc<str>) {
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
    let mut v3: serde_json::Value = v1.get(&*v2).cloned().unwrap_or_default();
    let mut v4: i32 = v3.as_array().map_or(0, |a| a.len()) as i32;
    let mut v5: i32 = v4.wrapping_sub(1i32);
    let mut v6: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v7: Rc<UH1> = from_5(v0.clone(), v3.clone(), v5, v6.clone());
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("includes"); } LIT.with(|lit| lit.clone()) };
    let mut v9: serde_json::Value = v1.get(&*v8).cloned().unwrap_or_default();
    let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts"); } LIT.with(|lit| lit.clone()) };
    let mut v11: serde_json::Value = v9.get(&*v10).cloned().unwrap_or_default();
    let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v13: i32 = v11.as_array().map_or(0, |a| a.len()) as i32;
    let mut v14: i32 = v13.wrapping_sub(1i32);
    let mut v15: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v16: Rc<UH1> = from_5(v12.clone(), v11.clone(), v14, v15.clone());
    let mut v17: Rc<UH1> = method12(v7.clone(), v16.clone());
    let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("media"); } LIT.with(|lit| lit.clone()) };
    let mut v19: serde_json::Value = v9.get(&*v18).cloned().unwrap_or_default();
    let mut v20: i32 = v19.as_array().map_or(0, |a| a.len()) as i32;
    let mut v21: i32 = v20.wrapping_sub(1i32);
    let mut v22: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
    let mut v23: Rc<UH5> = from_13(v19.clone(), v21, v22.clone());
    let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("users"); } LIT.with(|lit| lit.clone()) };
    let mut v25: serde_json::Value = v9.get(&*v24).cloned().unwrap_or_default();
    let mut v26: i32 = v25.as_array().map_or(0, |a| a.len()) as i32;
    let mut v27: i32 = v26.wrapping_sub(1i32);
    let mut v28: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
    let mut v29: Rc<UH6> = from_14(v25.clone(), v27, v28.clone());
    let mut v30: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
    let mut v31: Rc<UH6> = method15(v29.clone(), v30.clone());
    let mut v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
    let mut v33: serde_json::Value = v1.get(&*v32).cloned().unwrap_or_default();
    let mut v34: serde_json::Value = v33.get(0i32 as usize).cloned().unwrap_or_default();
    let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
    let mut v36: serde_json::Value = v34.get(&*v35).cloned().unwrap_or_default();
    let mut v37: Rc<str> = Rc::<str>::from(v36.as_str().unwrap_or(""));
    let mut v38: bool = v37.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v39: bool = v38 != true;
    let mut v43: Rc<str> = if v39 {
        v37.clone()
    } else {
        let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
        let mut v41: serde_json::Value = v34.get(&*v40).cloned().unwrap_or_default();
        let mut v42: Rc<str> = Rc::<str>::from(v41.as_str().unwrap_or(""));
        v42.clone()
    };
    (v17.clone(), v23.clone(), v31.clone(), v7.clone(), v43.clone())
}
fn method16(mut v0: Rc<UH5>, mut v1: Rc<UH5>) -> Rc<UH5> {
    match &*v0 {
        UH5::UH5_Cons(v2, v3, v4, v5) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH5> = v5.clone();
            let mut v6: Rc<UH5> = method16(v5.clone(), v1.clone());
            Rc::new(UH5::UH5_Cons(v2.clone(), v3.clone(), v4.clone(), v6.clone()))
        }
        UH5::UH5_Nil => {
            v1.clone()
        }
    }
}
fn method17(mut v0: Rc<UH6>, mut v1: Rc<UH6>) -> Rc<UH6> {
    match &*v0 {
        UH6::UH6_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH6> = v4.clone();
            let mut v5: Rc<UH6> = method17(v4.clone(), v1.clone());
            Rc::new(UH6::UH6_Cons(v2.clone(), v3.clone(), v5.clone()))
        }
        UH6::UH6_Nil => {
            v1.clone()
        }
    }
}
fn method18(mut v0: Rc<UH1>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<Heap0> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH4> = method18(v3.clone(), v1.clone());
            let mut v5: Rc<str> = v2.l0.clone();
            Rc::new(UH4::UH4_Cons(v5.clone(), v4.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method20(mut v0: Rc<str>, mut v1: Rc<UH4>, mut v2: US1) -> US1 {
    match &*v1 {
        UH4::UH4_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH4> = v4.clone();
            let mut v5: US1 = method20(v0.clone(), v4.clone(), v2.clone());
            let mut v6: bool = v0.clone() == v3.clone();
            if v6 {
                US1::US1_Some(v3.clone())
            } else {
                v5.clone()
            }
        }
        UH4::UH4_Nil => {
            v2.clone()
        }
    }
}
fn method19(mut v0: Rc<UH4>, mut v1: Rc<UH1>, mut v2: Rc<UH1>) -> Rc<UH1> {
    match &*v1 {
        UH1::UH1_Cons(v3, v4) => {
            let mut v3: Rc<Heap0> = v3.clone();
            let mut v4: Rc<UH1> = v4.clone();
            let mut v5: Rc<UH1> = method19(v0.clone(), v4.clone(), v2.clone());
            let mut v6: Rc<str> = v3.l0.clone();
            let mut v7: US1 = US1::US1_None;
            let mut v8: US1 = method20(v6.clone(), v0.clone(), v7.clone());
            let mut v11: bool = match &v8 {
                US1::US1_None => {
                    false
                }
                US1::US1_Some(v9) => {
                    let mut v9: Rc<str> = v9.clone();
                    true
                }
            };
            let mut v12: bool = v11 == false;
            if v12 {
                Rc::new(UH1::UH1_Cons(v3.clone(), v5.clone()))
            } else {
                v5.clone()
            }
        }
        UH1::UH1_Nil => {
            v2.clone()
        }
    }
}
fn from_21(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH4>) -> Rc<UH4> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("value"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: Rc<str> = Rc::<str>::from(v7.as_str().unwrap_or(""));
            let mut v9: Rc<UH4> = Rc::new(UH4::UH4_Cons(v8.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v9.clone());
            continue;
        }
    }
}
fn absorb_entry_3(mut v0: Rc<UH1>, mut v1: Rc<UH1>, mut v2: Rc<UH5>, mut v3: Rc<UH6>, mut v4: serde_json::Value) -> (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) {
    let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("role"); } LIT.with(|lit| lit.clone()) };
    let mut v6: serde_json::Value = v4.get(&*v5).cloned().unwrap_or_default();
    let mut v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("doc"); } LIT.with(|lit| lit.clone()) };
    let mut v9: serde_json::Value = v4.get(&*v8).cloned().unwrap_or_default();
    let mut v10: bool = v7.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("primary"); } LIT.with(|lit| lit.clone()) };
    let (mut v54, mut v55, mut v56, mut v57): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = if v10 {
        let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("author"); } LIT.with(|lit| lit.clone()) };
        let mut v12: serde_json::Value = v4.get(&*v11).cloned().unwrap_or_default();
        let mut v13: Rc<str> = Rc::<str>::from(v12.as_str().unwrap_or(""));
        let (mut v14, mut v15, mut v16, mut v17, mut v18): (Rc<UH1>, Rc<UH5>, Rc<UH6>, Rc<UH1>, Rc<str>) = posts_of_doc_4(v13.clone(), v9.clone());
        let mut v19: Rc<UH1> = method12(v17.clone(), v0.clone());
        let mut v20: Rc<UH1> = method12(v1.clone(), v14.clone());
        let mut v21: Rc<UH5> = method16(v2.clone(), v15.clone());
        let mut v22: Rc<UH6> = method17(v3.clone(), v16.clone());
        (v19.clone(), v20.clone(), v21.clone(), v22.clone())
    } else {
        let mut v23: bool = v7.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("lookup"); } LIT.with(|lit| lit.clone()) };
        let (mut v50, mut v51, mut v52, mut v53): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = if v23 {
            let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v25, mut v26, mut v27, mut v28, mut v29): (Rc<UH1>, Rc<UH5>, Rc<UH6>, Rc<UH1>, Rc<str>) = posts_of_doc_4(v24.clone(), v9.clone());
            let mut v30: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
            let mut v31: Rc<UH4> = method18(v25.clone(), v30.clone());
            let mut v32: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v33: Rc<UH1> = method19(v31.clone(), v1.clone(), v32.clone());
            let mut v34: Rc<UH1> = method12(v25.clone(), v33.clone());
            let mut v35: Rc<UH5> = method16(v26.clone(), v2.clone());
            let mut v36: Rc<UH6> = method17(v27.clone(), v3.clone());
            (v0.clone(), v34.clone(), v35.clone(), v36.clone())
        } else {
            let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v38: serde_json::Value = v9.get(&*v37).cloned().unwrap_or_default();
            let mut v39: i32 = v38.as_array().map_or(0, |a| a.len()) as i32;
            let mut v40: i32 = v39.wrapping_sub(1i32);
            let mut v41: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
            let mut v42: Rc<UH6> = from_14(v38.clone(), v40, v41.clone());
            let mut v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
            let mut v44: serde_json::Value = v9.get(&*v43).cloned().unwrap_or_default();
            let mut v45: i32 = v44.as_array().map_or(0, |a| a.len()) as i32;
            let mut v46: i32 = v45.wrapping_sub(1i32);
            let mut v47: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
            let mut v48: Rc<UH4> = from_21(v44.clone(), v46, v47.clone());
            let mut v49: Rc<UH6> = method17(v3.clone(), v42.clone());
            (v0.clone(), v1.clone(), v2.clone(), v49.clone())
        };
        (v50.clone(), v51.clone(), v52.clone(), v53.clone())
    };
    (v54.clone(), v55.clone(), v56.clone(), v57.clone())
}
fn method2(mut v0: Rc<UH0>, mut v1: Rc<UH1>, mut v2: Rc<UH1>, mut v3: Rc<UH5>, mut v4: Rc<UH6>) -> (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) {
    let (mut v19, mut v20, mut v21, mut v22): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = match &*v0 {
        UH0::UH0_Cons(v5, v6) => {
            let mut v5: serde_json::Value = v5.clone();
            let mut v6: Rc<UH0> = v6.clone();
            let (mut v7, mut v8, mut v9, mut v10): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = absorb_entry_3(v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone());
            method2(v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone())
        }
        _ => {
            let (mut v15, mut v16, mut v17, mut v18): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1.clone(), v2.clone(), v3.clone(), v4.clone())
                }
                _ => unreachable!(),
            };
            (v15.clone(), v16.clone(), v17.clone(), v18.clone())
        }
    };
    (v19.clone(), v20.clone(), v21.clone(), v22.clone())
}
fn method24(mut v0: Rc<Heap0>, mut v1: Rc<UH6>, mut v2: US2) -> US2 {
    match &*v1 {
        UH6::UH6_Cons(v3, v4, v5) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH6> = v5.clone();
            let mut v6: US2 = method24(v0.clone(), v5.clone(), v2.clone());
            let mut v7: Rc<str> = v0.l1.clone();
            let mut v8: bool = v3.clone() == v7.clone();
            if v8 {
                US2::US2_Some(v3.clone(), v4.clone())
            } else {
                v6.clone()
            }
        }
        UH6::UH6_Nil => {
            v2.clone()
        }
    }
}
fn method26(mut v0: Rc<UH3>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match &*v0 {
            UH3::UH3_Cons(v2, v3, v4, v5) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<str> = v3.clone();
                let mut v4: Rc<str> = v4.clone();
                let mut v5: Rc<UH3> = v5.clone();
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
            UH3::UH3_Nil => {
                return v1.clone();
            }
        }
    }
}
fn shown_text_25(mut v0: Rc<Heap0>) -> Rc<str> {
    let mut v1: Rc<str> = v0.l4.clone();
    let mut v2: Rc<UH3> = v0.l9.clone();
    let mut v3: Rc<str> = method26(v2.clone(), v1.clone());
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
    let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
    let mut v6: Rc<str> = Rc::<str>::from(v3.replace(&*v4, &*v5));
    let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let mut v8: Rc<str> = Rc::<str>::from(v6.replace(&*v7, &*v5));
    let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
    let mut v10: Rc<str> = Rc::<str>::from(v8.replace(&*v9, &*v5));
    let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
    let mut v12: Rc<str> = Rc::<str>::from(v10.replace(&*v11, &*v5));
    v12.clone()
}
fn method28(mut v0: Rc<str>, mut v1: Rc<UH5>, mut v2: US3) -> US3 {
    match &*v1 {
        UH5::UH5_Cons(v3, v4, v5, v6) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH5> = v6.clone();
            let mut v7: US3 = method28(v0.clone(), v6.clone(), v2.clone());
            let mut v8: bool = v3.clone() == v0.clone();
            if v8 {
                US3::US3_Some(v3.clone(), v4.clone(), v5.clone())
            } else {
                v7.clone()
            }
        }
        UH5::UH5_Nil => {
            v2.clone()
        }
    }
}
fn method27(mut v0: Rc<UH1>, mut v1: Rc<UH5>, mut v2: Rc<UH6>, mut v3: Rc<UH4>, mut v4: Rc<UH4>) -> Rc<UH4> {
    match &*v3 {
        UH4::UH4_Cons(v5, v6) => {
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH4> = v6.clone();
            let mut v7: Rc<UH4> = method27(v0.clone(), v1.clone(), v2.clone(), v6.clone(), v4.clone());
            let mut v8: US3 = US3::US3_None;
            let mut v9: US3 = method28(v5.clone(), v1.clone(), v8.clone());
            let mut v35: Rc<str> = match &v9 {
                US3::US3_None => {
                    let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("[media]"); } LIT.with(|lit| lit.clone()) };
                    v33.clone()
                }
                US3::US3_Some(v10, v11, v12) => {
                    let mut v10: Rc<str> = v10.clone();
                    let mut v11: Rc<str> = v11.clone();
                    let mut v12: Rc<str> = v12.clone();
                    let mut v13: bool = v12.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    if v13 {
                        let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
                        let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v11));
                        let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
                        let mut v17: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v16));
                        v17.clone()
                    } else {
                        let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
                        let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v11));
                        let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("] "); } LIT.with(|lit| lit.clone()) };
                        let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v20));
                        let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
                        let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
                        let mut v24: Rc<str> = Rc::<str>::from(v12.replace(&*v22, &*v23));
                        let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                        let mut v26: Rc<str> = Rc::<str>::from(v24.replace(&*v25, &*v23));
                        let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
                        let mut v28: Rc<str> = Rc::<str>::from(v26.replace(&*v27, &*v23));
                        let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
                        let mut v30: Rc<str> = Rc::<str>::from(v28.replace(&*v29, &*v23));
                        let mut v31: Rc<str> = Rc::<str>::from(format!("{}{}", v21, v30));
                        v31.clone()
                    }
                }
            };
            Rc::new(UH4::UH4_Cons(v35.clone(), v7.clone()))
        }
        UH4::UH4_Nil => {
            v4.clone()
        }
    }
}
fn method29(mut v0: Rc<UH3>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3, v4, v5) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH3> = v5.clone();
            let mut v6: Rc<UH3> = method29(v5.clone(), v1.clone());
            let mut v7: bool = v4.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v8: bool = v7 != true;
            if v8 {
                Rc::new(UH3::UH3_Cons(v2.clone(), v3.clone(), v4.clone(), v6.clone()))
            } else {
                v6.clone()
            }
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn method30(mut v0: Rc<UH3>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3, v4, v5) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH3> = v5.clone();
            let mut v6: Rc<UH4> = method30(v5.clone(), v1.clone());
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
            let mut v9: Rc<str> = Rc::<str>::from(v4.replace(&*v7, &*v8));
            let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            let mut v11: Rc<str> = Rc::<str>::from(v9.replace(&*v10, &*v8));
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
            let mut v13: Rc<str> = Rc::<str>::from(v11.replace(&*v12, &*v8));
            let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
            let mut v15: Rc<str> = Rc::<str>::from(v13.replace(&*v14, &*v8));
            let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("[url] "); } LIT.with(|lit| lit.clone()) };
            let mut v17: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v15));
            Rc::new(UH4::UH4_Cons(v17.clone(), v6.clone()))
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn method31(mut v0: Rc<UH4>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH4::UH4_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH4> = v3.clone();
            let mut v4: Rc<UH4> = method31(v3.clone(), v1.clone());
            Rc::new(UH4::UH4_Cons(v2.clone(), v4.clone()))
        }
        UH4::UH4_Nil => {
            v1.clone()
        }
    }
}
fn entry_of_23(mut v0: Rc<UH1>, mut v1: Rc<UH5>, mut v2: Rc<UH6>, mut v3: Rc<Heap0>) -> Rc<Heap1> {
    let (mut v4, mut v5, mut v6): (i32, i32, i32) = (v3.l5.clone(), v3.l6.clone(), v3.l7.clone());
    let mut v7: Rc<str> = Rc::<str>::from(format!("{:?}", v4));
    let mut v8: Rc<str> = Rc::<str>::from(format!("{:?}", v5));
    let mut v9: Rc<str> = Rc::<str>::from(format!("{:?}", v6));
    let mut v10: Rc<str> = v3.l2.clone();
    let mut v11: bool = v10.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v12: bool = v11 != true;
    let mut v23: Rc<str> = if v12 {
        let mut v13: Rc<str> = v3.l2.clone();
        v13.clone()
    } else {
        let mut v14: US2 = US2::US2_None;
        let mut v15: US2 = method24(v3.clone(), v2.clone(), v14.clone());
        match &v15 {
            US2::US2_None => {
                let mut v18: Rc<str> = v3.l1.clone();
                let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("user "); } LIT.with(|lit| lit.clone()) };
                let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v18));
                v20.clone()
            }
            US2::US2_Some(v16, v17) => {
                let mut v16: Rc<str> = v16.clone();
                let mut v17: Rc<str> = v17.clone();
                v17.clone()
            }
        }
    };
    let mut v24: Rc<str> = v3.l3.clone();
    let mut v25: Rc<str> = shown_text_25(v3.clone());
    let mut v26: Rc<UH4> = v3.l10.clone();
    let mut v27: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v28: Rc<UH4> = method27(v0.clone(), v1.clone(), v2.clone(), v26.clone(), v27.clone());
    let mut v29: Rc<UH3> = v3.l9.clone();
    let mut v30: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let mut v31: Rc<UH3> = method29(v29.clone(), v30.clone());
    let mut v32: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v33: Rc<UH4> = method30(v31.clone(), v32.clone());
    let mut v34: Rc<UH4> = method31(v28.clone(), v33.clone());
    let mut v35: Rc<str> = v3.l0.clone();
    let mut v36: Rc<UH2> = v3.l8.clone();
    Rc::new(Heap1 { l0: v35.clone(), l1: v23.clone(), l2: v24.clone(), l3: v25.clone(), l4: v7.clone(), l5: v8.clone(), l6: v9.clone(), l7: v34.clone(), l8: v36.clone() })
}
fn method33(mut v0: Rc<UH2>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let mut v2: US0 = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH4> = method33(v4.clone(), v1.clone());
            let mut v11: Rc<str> = match &v2 {
                US0::US0_Quoted => {
                    let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
                    v6.clone()
                }
                US0::US0_RepliedTo => {
                    let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replied_to"); } LIT.with(|lit| lit.clone()) };
                    v7.clone()
                }
                US0::US0_Reposted => {
                    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposted"); } LIT.with(|lit| lit.clone()) };
                    v8.clone()
                }
            };
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v12));
            let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v3));
            Rc::new(UH4::UH4_Cons(v14.clone(), v5.clone()))
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn method34(mut v0: Rc<UH4>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH4::UH4_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH4> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method34(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH4::UH4_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn method35(mut v0: Rc<UH4>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH4::UH4_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH4> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method35(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH4::UH4_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn entry_line_32(mut v0: Rc<str>, mut v1: Rc<Heap1>) -> Rc<str> {
    let mut v2: Rc<str> = v1.l0.clone();
    let mut v3: Rc<str> = v1.l1.clone();
    let mut v4: Rc<str> = v1.l2.clone();
    let mut v5: Rc<UH2> = v1.l8.clone();
    let mut v6: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v7: Rc<UH4> = method33(v5.clone(), v6.clone());
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v9, mut v10): (Rc<str>, Rc<str>) = method34(v7.clone(), v8.clone());
    let mut v11: Rc<str> = v1.l3.clone();
    let mut v12: Rc<str> = v1.l4.clone();
    let mut v13: Rc<str> = v1.l5.clone();
    let mut v14: Rc<str> = v1.l6.clone();
    let mut v15: Rc<UH4> = v1.l7.clone();
    let (mut v16, mut v17): (Rc<str>, Rc<str>) = method35(v15.clone(), v8.clone());
    let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v17));
    let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v16));
    let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
    let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v20));
    let mut v22: Rc<str> = Rc::<str>::from(format!("{}{}", v21, v19));
    let mut v23: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v20));
    let mut v24: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v22));
    let mut v25: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v20));
    let mut v26: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v24));
    let mut v27: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v20));
    let mut v28: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v26));
    let mut v29: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v20));
    let mut v30: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v28));
    let mut v31: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v20));
    let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v31, v30));
    let mut v33: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v20));
    let mut v34: Rc<str> = Rc::<str>::from(format!("{}{}", v33, v32));
    let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v20));
    let mut v36: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v34));
    v36.clone()
}
fn method22(mut v0: Rc<UH1>, mut v1: Rc<UH5>, mut v2: Rc<UH6>, mut v3: Rc<str>, mut v4: Rc<UH1>, mut v5: Rc<UH4>) -> Rc<UH4> {
    match &*v4 {
        UH1::UH1_Cons(v6, v7) => {
            let mut v6: Rc<Heap0> = v6.clone();
            let mut v7: Rc<UH1> = v7.clone();
            let mut v8: Rc<UH4> = method22(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v7.clone(), v5.clone());
            let mut v9: Rc<Heap1> = entry_of_23(v0.clone(), v1.clone(), v2.clone(), v6.clone());
            let mut v10: Rc<str> = entry_line_32(v3.clone(), v9.clone());
            Rc::new(UH4::UH4_Cons(v10.clone(), v8.clone()))
        }
        UH1::UH1_Nil => {
            v5.clone()
        }
    }
}
fn method36(mut v0: Rc<UH1>, mut v1: Rc<UH5>, mut v2: Rc<UH6>, mut v3: Rc<str>, mut v4: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH1::UH1_Cons(v5, v6) => {
            let mut v5: Rc<Heap0> = v5.clone();
            let mut v6: Rc<UH1> = v6.clone();
            let mut v7: Rc<UH4> = method22(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v6.clone(), v4.clone());
            let mut v8: Rc<Heap1> = entry_of_23(v0.clone(), v1.clone(), v2.clone(), v5.clone());
            let mut v9: Rc<str> = entry_line_32(v3.clone(), v8.clone());
            Rc::new(UH4::UH4_Cons(v9.clone(), v7.clone()))
        }
        UH1::UH1_Nil => {
            v4.clone()
        }
    }
}
fn method37(mut v0: Rc<UH4>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH4::UH4_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH4> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method37(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH4::UH4_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn digested_0(mut v0: Rc<str>) -> Rc<str> {
    let mut v1: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v0).unwrap_or_default();
    let mut v2: i32 = v1.as_array().map_or(0, |a| a.len()) as i32;
    let mut v3: i32 = v2.wrapping_sub(1i32);
    let mut v4: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v5: Rc<UH0> = from_1(v1.clone(), v3, v4.clone());
    let mut v6: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v7: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v8: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
    let mut v9: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
    let (mut v10, mut v11, mut v12, mut v13): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = method2(v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone());
    let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("p"); } LIT.with(|lit| lit.clone()) };
    let mut v15: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v16: Rc<UH4> = method22(v11.clone(), v12.clone(), v13.clone(), v14.clone(), v10.clone(), v15.clone());
    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("r"); } LIT.with(|lit| lit.clone()) };
    let mut v18: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v19: Rc<UH4> = method36(v11.clone(), v12.clone(), v13.clone(), v17.clone(), v18.clone());
    let mut v20: Rc<UH4> = method31(v16.clone(), v19.clone());
    let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v22, mut v23): (Rc<str>, Rc<str>) = method37(v20.clone(), v21.clone());
    v22.clone()
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        digested_0(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_digest(v0: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0))
}
