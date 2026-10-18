#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(serde_json::Value, Rc<UH0>),
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
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, Rc<str>, Rc<UH1>),
}
struct Heap0 { l0: Rc<str>, l1: i32, l2: i32, l3: Rc<str>, l4: Rc<str>, l5: Rc<str> }
#[derive(Clone)]
enum UH4 {
    UH4_Nil,
    UH4_Cons(Rc<Heap0>, Rc<UH4>),
}
#[derive(Clone)]
enum UH5 {
    UH5_Nil,
    UH5_Cons(Rc<str>, i32, Rc<str>, Rc<UH4>, Rc<UH5>),
}
#[derive(Clone)]
enum UH6 {
    UH6_Nil,
    UH6_Cons(i32, Rc<UH6>),
}
#[derive(Clone)]
enum US0 {
    US0_Some(Rc<str>),
    US0_None,
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
fn method3(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH3> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH1> = v7.clone();
            let mut v8: Rc<UH1> = method3(v7.clone(), v1.clone());
            Rc::new(UH1::UH1_Cons(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v8.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn from_5(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH2>) -> Rc<UH2> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = Rc::<str>::from(v5.as_str().unwrap_or(""));
            let mut v7: Rc<UH2> = Rc::new(UH2::UH2_Cons(v6.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v7.clone());
            continue;
        }
    }
}
fn from_6(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH3>) -> Rc<UH3> {
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
fn from_4(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
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
            let mut v17: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let mut v18: Rc<UH2> = from_5(v14.clone(), v16, v17.clone());
            let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("entities"); } LIT.with(|lit| lit.clone()) };
            let mut v20: serde_json::Value = v5.get(&*v19).cloned().unwrap_or_default();
            let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("urls"); } LIT.with(|lit| lit.clone()) };
            let mut v22: serde_json::Value = v20.get(&*v21).cloned().unwrap_or_default();
            let mut v23: i32 = v22.as_array().map_or(0, |a| a.len()) as i32;
            let mut v24: i32 = v23.wrapping_sub(1i32);
            let mut v25: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
            let mut v26: Rc<UH3> = from_6(v22.clone(), v24, v25.clone());
            let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
            let mut v28: serde_json::Value = v5.get(&*v27).cloned().unwrap_or_default();
            let mut v29: Rc<str> = Rc::<str>::from(v28.as_array().and_then(|a| a.iter().find(|r| r["type"] == "replied_to")).and_then(|r| r["id"].as_str()).unwrap_or(""));
            let mut v30: Rc<UH1> = Rc::new(UH1::UH1_Cons(v8.clone(), v12.clone(), v18.clone(), v26.clone(), v29.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v30.clone());
            continue;
        }
    }
}
fn method2(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: serde_json::Value = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH1> = method2(v3.clone(), v1.clone());
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v6: serde_json::Value = v2.get(&*v5).cloned().unwrap_or_default();
            let mut v7: i32 = v6.as_array().map_or(0, |a| a.len()) as i32;
            let mut v8: i32 = v7.wrapping_sub(1i32);
            let mut v9: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v10: Rc<UH1> = from_4(v6.clone(), v8, v9.clone());
            method3(v10.clone(), v4.clone())
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method9(mut v0: Rc<UH4>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH4::UH4_Cons(v2, v3) => {
            let mut v2: Rc<Heap0> = v2.clone();
            let mut v3: Rc<UH4> = v3.clone();
            let mut v4: Rc<UH4> = method9(v3.clone(), v1.clone());
            Rc::new(UH4::UH4_Cons(v2.clone(), v4.clone()))
        }
        UH4::UH4_Nil => {
            v1.clone()
        }
    }
}
fn method11(mut v0: Rc<UH3>, mut v1: Rc<str>) -> Rc<str> {
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
fn split_on_12(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH2> {
    let mut v2: i32 = v1.find(&*v0).map(|i| i as i32).unwrap_or(-1);
    let mut v3: bool = v2 < 0i32;
    if v3 {
        let mut v4: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH2::UH2_Cons(v1.clone(), v4.clone()))
    } else {
        let mut v6: Rc<str> = Rc::<str>::from(&(v1)[((0i32) as usize)..(((0i32) + (v2)) as usize)]);
        let mut v7: i32 = v2.wrapping_add(1i32);
        let mut v8: i32 = (v1.clone().len() as i32);
        let mut v9: i32 = v8.wrapping_sub(v2);
        let mut v10: i32 = v9.wrapping_sub(1i32);
        let mut v11: Rc<str> = Rc::<str>::from(&(v1)[((v7) as usize)..(((v7) + (v10)) as usize)]);
        let mut v12: Rc<UH2> = split_on_12(v0.clone(), v11.clone());
        Rc::new(UH2::UH2_Cons(v6.clone(), v12.clone()))
    }
}
fn field_at_13(mut v0: i32, mut v1: Rc<UH2>) -> Rc<str> {
    loop {
        match &*v1 {
            UH2::UH2_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH2> = v3.clone();
                let mut v4: bool = v0 == 0i32;
                if v4 {
                    return v2.clone();
                } else {
                    let mut v5: i32 = v0.wrapping_sub(1i32);
                    (v0, v1) = (v5, v3.clone());
                    continue;
                }
            }
            UH2::UH2_Nil => {
                let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                return v8.clone();
            }
        }
    }
}
fn method14(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
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
fn method15(mut v0: Rc<UH2>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH2::UH2_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH2> = v3.clone();
                let mut v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3.clone(), v4);
                continue;
            }
            UH2::UH2_Nil => {
                return v1;
            }
        }
    }
}
fn frames_of_10(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<UH2>, mut v3: Rc<UH3>, mut v4: Rc<str>) -> Rc<UH4> {
    let mut v5: Rc<str> = method11(v3.clone(), v1.clone());
    let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let mut v7: i32 = v5.find(&*v6).map(|i| i as i32).unwrap_or(-1);
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
    let mut v9: bool = v7 < 0i32;
    let mut v11: i32 = if v9 {
        let mut v10: i32 = (v5.clone().len() as i32);
        v10
    } else {
        v7
    };
    let mut v12: Rc<str> = Rc::<str>::from(&(v5)[((0i32) as usize)..(((0i32) + (v11)) as usize)]);
    let mut v13: Rc<UH2> = split_on_12(v8.clone(), v12.clone());
    let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let mut v15: i32 = 1i32;
    let mut v16: Rc<str> = field_at_13(v15, v13.clone());
    let mut v17: Rc<UH2> = split_on_12(v14.clone(), v16.clone());
    let mut v18: i32 = 0i32;
    let mut v19: Rc<str> = field_at_13(v18, v17.clone());
    let mut v20: i32 = (&*v19).parse::<i32>().unwrap_or(0);
    let mut v21: i32 = 1i32;
    let mut v22: Rc<str> = field_at_13(v21, v17.clone());
    let mut v23: i32 = (&*v22).parse::<i32>().unwrap_or(0);
    let mut v24: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let mut v25: Rc<UH2> = method14(v2.clone(), v24.clone());
    let mut v29: Rc<str> = match &*v25 {
        UH2::UH2_Cons(v26, v27) => {
            let mut v26: Rc<str> = v26.clone();
            let mut v27: Rc<UH2> = v27.clone();
            v26.clone()
        }
        UH2::UH2_Nil => {
            v0.clone()
        }
    };
    let mut v30: bool = v29.clone() == v0.clone();
    let mut v34: bool = if v30 {
        let mut v31: i32 = 0i32;
        let mut v32: i32 = method15(v13.clone(), v31);
        let mut v33: bool = v32 == 2i32;
        v33
    } else {
        false
    };
    let mut v36: bool = if v34 {
        let mut v35: bool = v20 >= 1i32;
        v35
    } else {
        false
    };
    let mut v38: bool = if v36 {
        let mut v37: bool = v20 <= v23;
        v37
    } else {
        false
    };
    if v38 {
        let mut v48: Rc<str> = if v9 {
            let mut v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v39.clone()
        } else {
            let mut v40: i32 = v7.wrapping_add(1i32);
            let mut v41: i32 = (v5.clone().len() as i32);
            let mut v42: i32 = v41.wrapping_sub(v7);
            let mut v43: i32 = v42.wrapping_sub(1i32);
            let mut v44: Rc<str> = Rc::<str>::from(&(v5)[((v40) as usize)..(((v40) + (v43)) as usize)]);
            let mut v45: Rc<str> = Rc::<str>::from(char::from_u32(0x200B).unwrap().to_string() + ".");
            let mut v46: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("."); } LIT.with(|lit| lit.clone()) };
            let mut v47: Rc<str> = Rc::<str>::from(v44.replace(&*v45, &*v46));
            v47.clone()
        };
        let mut v49: i32 = 0i32;
        let mut v50: Rc<str> = field_at_13(v49, v13.clone());
        let mut v54: Rc<str> = match &*v2 {
            UH2::UH2_Cons(v51, v52) => {
                let mut v51: Rc<str> = v51.clone();
                let mut v52: Rc<UH2> = v52.clone();
                v51.clone()
            }
            UH2::UH2_Nil => {
                v0.clone()
            }
        };
        let mut v55: Rc<Heap0> = Rc::new(Heap0 { l0: v50.clone(), l1: v20, l2: v23, l3: v48.clone(), l4: v54.clone(), l5: v4.clone() });
        let mut v56: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH4::UH4_Cons(v55.clone(), v56.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) }
    }
}
fn method8(mut v0: Rc<UH1>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH3> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH1> = v7.clone();
            let mut v8: Rc<UH4> = method8(v7.clone(), v1.clone());
            let mut v9: Rc<UH4> = frames_of_10(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone());
            method9(v9.clone(), v8.clone())
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn grouped_17(mut v0: Rc<UH5>, mut v1: Rc<Heap0>) -> Rc<UH5> {
    match &*v0 {
        UH5::UH5_Cons(v2, v3, v4, v5, v6) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: i32 = *v3;
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH4> = v5.clone();
            let mut v6: Rc<UH5> = v6.clone();
            let mut v7: Rc<str> = v1.l0.clone();
            let mut v8: bool = v2.clone() == v7.clone();
            if v8 {
                let mut v9: Rc<str> = v1.l4.clone();
                let mut v10: i32 = (v4.clone().len() as i32);
                let mut v11: i32 = (v9.clone().len() as i32);
                let mut v12: bool = v10 == v11;
                let mut v13: bool = v12 != true;
                let mut v20: bool = if v13 {
                    let mut v14: bool = v10 > v11;
                    v14
                } else {
                    let mut v15: bool = v4.clone() < v9.clone();
                    let mut v18: i32 = if v15 {
                        -1i32
                    } else {
                        let mut v16: bool = v4.clone() > v9.clone();
                        if v16 {
                            1i32
                        } else {
                            0i32
                        }
                    };
                    let mut v19: bool = v18 == 1i32;
                    v19
                };
                let mut v22: Rc<str> = if v20 {
                    let mut v21: Rc<str> = v1.l4.clone();
                    v21.clone()
                } else {
                    v4.clone()
                };
                let mut v23: i32 = v1.l2.clone();
                let mut v24: bool = v23 > v3;
                let mut v26: i32 = if v24 {
                    let mut v25: i32 = v1.l2.clone();
                    v25
                } else {
                    v3
                };
                let mut v27: Rc<UH4> = Rc::new(UH4::UH4_Cons(v1.clone(), v5.clone()));
                Rc::new(UH5::UH5_Cons(v2.clone(), v26, v22.clone(), v27.clone(), v6.clone()))
            } else {
                let mut v29: Rc<UH5> = grouped_17(v6.clone(), v1.clone());
                Rc::new(UH5::UH5_Cons(v2.clone(), v3, v4.clone(), v5.clone(), v29.clone()))
            }
        }
        UH5::UH5_Nil => {
            let mut v32: Rc<str> = v1.l0.clone();
            let mut v33: i32 = v1.l2.clone();
            let mut v34: Rc<str> = v1.l4.clone();
            let mut v35: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
            let mut v36: Rc<UH4> = Rc::new(UH4::UH4_Cons(v1.clone(), v35.clone()));
            let mut v37: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
            Rc::new(UH5::UH5_Cons(v32.clone(), v33, v34.clone(), v36.clone(), v37.clone()))
        }
    }
}
fn method16(mut v0: Rc<UH4>, mut v1: Rc<UH5>) -> Rc<UH5> {
    loop {
        match &*v0 {
            UH4::UH4_Cons(v2, v3) => {
                let mut v2: Rc<Heap0> = v2.clone();
                let mut v3: Rc<UH4> = v3.clone();
                let mut v4: Rc<UH5> = grouped_17(v1.clone(), v2.clone());
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH4::UH4_Nil => {
                return v1.clone();
            }
        }
    }
}
fn placed_19(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH4>, mut v4: Rc<UH5>) -> Rc<UH5> {
    match &*v4 {
        UH5::UH5_Cons(v5, v6, v7, v8, v9) => {
            let mut v5: Rc<str> = v5.clone();
            let mut v6: i32 = *v6;
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<UH4> = v8.clone();
            let mut v9: Rc<UH5> = v9.clone();
            let mut v10: i32 = (v2.clone().len() as i32);
            let mut v11: i32 = (v7.clone().len() as i32);
            let mut v12: bool = v10 == v11;
            let mut v13: bool = v12 != true;
            let mut v20: bool = if v13 {
                let mut v14: bool = v10 > v11;
                v14
            } else {
                let mut v15: bool = v2.clone() < v7.clone();
                let mut v18: i32 = if v15 {
                    -1i32
                } else {
                    let mut v16: bool = v2.clone() > v7.clone();
                    if v16 {
                        1i32
                    } else {
                        0i32
                    }
                };
                let mut v19: bool = v18 == 1i32;
                v19
            };
            if v20 {
                let mut v21: Rc<UH5> = placed_19(v0.clone(), v1, v2.clone(), v3.clone(), v9.clone());
                Rc::new(UH5::UH5_Cons(v5.clone(), v6, v7.clone(), v8.clone(), v21.clone()))
            } else {
                Rc::new(UH5::UH5_Cons(v0.clone(), v1, v2.clone(), v3.clone(), v4.clone()))
            }
        }
        _ => {
            Rc::new(UH5::UH5_Cons(v0.clone(), v1, v2.clone(), v3.clone(), v4.clone()))
        }
    }
}
fn method18(mut v0: Rc<UH5>, mut v1: Rc<UH5>) -> Rc<UH5> {
    loop {
        match &*v0 {
            UH5::UH5_Cons(v2, v3, v4, v5, v6) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: i32 = *v3;
                let mut v4: Rc<str> = v4.clone();
                let mut v5: Rc<UH4> = v5.clone();
                let mut v6: Rc<UH5> = v6.clone();
                let mut v7: Rc<UH5> = placed_19(v2.clone(), v3, v4.clone(), v5.clone(), v1.clone());
                (v0, v1) = (v6.clone(), v7.clone());
                continue;
            }
            UH5::UH5_Nil => {
                return v1.clone();
            }
        }
    }
}
fn method21(mut v0: i32, mut v1: i32) -> Rc<UH6> {
    let mut v2: bool = v1 < v0;
    if v2 {
        let mut v3: i32 = v1.wrapping_add(1i32);
        let mut v4: Rc<UH6> = method21(v0, v3);
        Rc::new(UH6::UH6_Cons(v3, v4.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) }
    }
}
fn method24(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH4>, mut v4: i32, mut v5: Rc<UH4>, mut v6: Rc<UH4>) -> Rc<UH4> {
    match &*v5 {
        UH4::UH4_Cons(v7, v8) => {
            let mut v7: Rc<Heap0> = v7.clone();
            let mut v8: Rc<UH4> = v8.clone();
            let mut v9: Rc<UH4> = method24(v0.clone(), v1, v2.clone(), v3.clone(), v4, v8.clone(), v6.clone());
            let mut v10: i32 = v7.l1.clone();
            let mut v11: bool = v10 == v4;
            let mut v14: bool = if v11 {
                let mut v12: i32 = v7.l2.clone();
                let mut v13: bool = v12 == v1;
                v13
            } else {
                false
            };
            if v14 {
                Rc::new(UH4::UH4_Cons(v7.clone(), v9.clone()))
            } else {
                v9.clone()
            }
        }
        UH4::UH4_Nil => {
            v6.clone()
        }
    }
}
fn method23(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH4>, mut v4: i32, mut v5: Rc<UH4>) -> Rc<UH4> {
    match &*v3 {
        UH4::UH4_Cons(v6, v7) => {
            let mut v6: Rc<Heap0> = v6.clone();
            let mut v7: Rc<UH4> = v7.clone();
            let mut v8: Rc<UH4> = method24(v0.clone(), v1, v2.clone(), v3.clone(), v4, v7.clone(), v5.clone());
            let mut v9: i32 = v6.l1.clone();
            let mut v10: bool = v9 == v4;
            let mut v13: bool = if v10 {
                let mut v11: i32 = v6.l2.clone();
                let mut v12: bool = v11 == v1;
                v12
            } else {
                false
            };
            if v13 {
                Rc::new(UH4::UH4_Cons(v6.clone(), v8.clone()))
            } else {
                v8.clone()
            }
        }
        UH4::UH4_Nil => {
            v5.clone()
        }
    }
}
fn method25(mut v0: Rc<UH4>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH4::UH4_Cons(v2, v3) => {
                let mut v2: Rc<Heap0> = v2.clone();
                let mut v3: Rc<UH4> = v3.clone();
                let mut v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3.clone(), v4);
                continue;
            }
            UH4::UH4_Nil => {
                return v1;
            }
        }
    }
}
fn method22(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH4>, mut v4: Rc<UH6>, mut v5: Rc<UH6>) -> Rc<UH6> {
    match &*v4 {
        UH6::UH6_Cons(v6, v7) => {
            let mut v6: i32 = *v6;
            let mut v7: Rc<UH6> = v7.clone();
            let mut v8: Rc<UH6> = method22(v0.clone(), v1, v2.clone(), v3.clone(), v7.clone(), v5.clone());
            let mut v9: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
            let mut v10: Rc<UH4> = method23(v0.clone(), v1, v2.clone(), v3.clone(), v6, v9.clone());
            let mut v11: i32 = 0i32;
            let mut v12: i32 = method25(v10.clone(), v11);
            let mut v13: bool = v12 == 1i32;
            let mut v14: bool = v13 != true;
            if v14 {
                Rc::new(UH6::UH6_Cons(v6, v8.clone()))
            } else {
                v8.clone()
            }
        }
        UH6::UH6_Nil => {
            v5.clone()
        }
    }
}
fn method27(mut v0: Rc<UH4>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH4::UH4_Cons(v2, v3) => {
            let mut v2: Rc<Heap0> = v2.clone();
            let mut v3: Rc<UH4> = v3.clone();
            let mut v4: Rc<UH2> = method27(v3.clone(), v1.clone());
            let mut v5: Rc<str> = v2.l3.clone();
            Rc::new(UH2::UH2_Cons(v5.clone(), v4.clone()))
        }
        UH4::UH4_Nil => {
            v1.clone()
        }
    }
}
fn method28(mut v0: Rc<UH2>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH2::UH2_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH2> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method28(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH2::UH2_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn method26(mut v0: i32, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<UH4>, mut v4: i32) -> Rc<UH2> {
    let mut v5: bool = v4 < v0;
    if v5 {
        let mut v6: i32 = v4.wrapping_add(1i32);
        let mut v7: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
        let mut v8: Rc<UH4> = method23(v1.clone(), v0, v2.clone(), v3.clone(), v6, v7.clone());
        let mut v9: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
        let mut v10: Rc<UH2> = method27(v8.clone(), v9.clone());
        let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let (mut v12, mut v13): (Rc<str>, Rc<str>) = method28(v10.clone(), v11.clone());
        let mut v14: Rc<UH2> = method26(v0, v1.clone(), v2.clone(), v3.clone(), v6);
        Rc::new(UH2::UH2_Cons(v12.clone(), v14.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
    }
}
fn method29(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH2> = v3.clone();
            let mut v4: Rc<UH2> = method29(v3.clone(), v1.clone());
            Rc::new(UH2::UH2_Cons(v2.clone(), v4.clone()))
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn method30(mut v0: Rc<UH6>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH6::UH6_Cons(v2, v3) => {
            let mut v2: i32 = *v2;
            let mut v3: Rc<UH6> = v3.clone();
            let mut v4: Rc<UH2> = method30(v3.clone(), v1.clone());
            let mut v5: Rc<str> = Rc::<str>::from(format!("{:?}", v2));
            Rc::new(UH2::UH2_Cons(v5.clone(), v4.clone()))
        }
        UH6::UH6_Nil => {
            v1.clone()
        }
    }
}
fn method31(mut v0: Rc<UH2>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH2::UH2_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH2> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method31(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", "); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH2::UH2_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn method20(mut v0: Rc<UH5>, mut v1: Rc<UH2>, mut v2: Rc<UH2>) -> (Rc<UH2>, Rc<UH2>) {
    let (mut v47, mut v48): (Rc<UH2>, Rc<UH2>) = match &*v0 {
        UH5::UH5_Cons(v3, v4, v5, v6, v7) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: i32 = *v4;
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH4> = v6.clone();
            let mut v7: Rc<UH5> = v7.clone();
            let mut v8: i32 = 0i32;
            let mut v9: Rc<UH6> = method21(v4, v8);
            let mut v10: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
            let mut v11: Rc<UH6> = method22(v3.clone(), v4, v5.clone(), v6.clone(), v9.clone(), v10.clone());
            let (mut v41, mut v42): (Rc<UH2>, Rc<UH2>) = match &*v11 {
                UH6::UH6_Nil => {
                    let mut v12: i32 = 0i32;
                    let mut v13: Rc<UH2> = method26(v4, v3.clone(), v5.clone(), v6.clone(), v12);
                    let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let (mut v15, mut v16): (Rc<str>, Rc<str>) = method28(v13.clone(), v14.clone());
                    let mut v17: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let mut v18: Rc<UH2> = Rc::new(UH2::UH2_Cons(v15.clone(), v17.clone()));
                    let mut v19: Rc<UH2> = method29(v1.clone(), v18.clone());
                    (v19.clone(), v2.clone())
                }
                _ => {
                    let mut v20: i32 = 0i32;
                    let mut v21: Rc<UH6> = method21(v4, v20);
                    let mut v22: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
                    let mut v23: Rc<UH6> = method22(v3.clone(), v4, v5.clone(), v6.clone(), v21.clone(), v22.clone());
                    let mut v24: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let mut v25: Rc<UH2> = method30(v23.clone(), v24.clone());
                    let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let (mut v27, mut v28): (Rc<str>, Rc<str>) = method31(v25.clone(), v26.clone());
                    let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cell "); } LIT.with(|lit| lit.clone()) };
                    let mut v30: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v3));
                    let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" is missing frame "); } LIT.with(|lit| lit.clone()) };
                    let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v30, v31));
                    let mut v33: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v27));
                    let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" of "); } LIT.with(|lit| lit.clone()) };
                    let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v33, v34));
                    let mut v36: Rc<str> = Rc::<str>::from(format!("{:?}", v4));
                    let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v36));
                    let mut v38: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let mut v39: Rc<UH2> = Rc::new(UH2::UH2_Cons(v37.clone(), v38.clone()));
                    let mut v40: Rc<UH2> = method29(v2.clone(), v39.clone());
                    (v1.clone(), v40.clone())
                }
            };
            method20(v7.clone(), v41.clone(), v42.clone())
        }
        _ => {
            let (mut v45, mut v46): (Rc<UH2>, Rc<UH2>) = match &*v0 {
                UH5::UH5_Nil => {
                    (v1.clone(), v2.clone())
                }
                _ => unreachable!(),
            };
            (v45.clone(), v46.clone())
        }
    };
    (v47.clone(), v48.clone())
}
fn method32(mut v0: Rc<UH1>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH3> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH1> = v7.clone();
            let mut v8: Rc<UH2> = method32(v7.clone(), v1.clone());
            let mut v9: Rc<UH2> = method29(v4.clone(), v8.clone());
            Rc::new(UH2::UH2_Cons(v2.clone(), v9.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method35(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH4>, mut v4: Rc<UH4>, mut v5: Rc<UH4>) -> Rc<UH4> {
    match &*v4 {
        UH4::UH4_Cons(v6, v7) => {
            let mut v6: Rc<Heap0> = v6.clone();
            let mut v7: Rc<UH4> = v7.clone();
            let mut v8: Rc<UH4> = method35(v0.clone(), v1, v2.clone(), v3.clone(), v7.clone(), v5.clone());
            let mut v9: i32 = v6.l1.clone();
            let mut v10: bool = v9 == 1i32;
            let mut v13: bool = if v10 {
                let mut v11: i32 = v6.l2.clone();
                let mut v12: bool = v11 == v1;
                v12
            } else {
                false
            };
            if v13 {
                Rc::new(UH4::UH4_Cons(v6.clone(), v8.clone()))
            } else {
                v8.clone()
            }
        }
        UH4::UH4_Nil => {
            v5.clone()
        }
    }
}
fn method34(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH4>, mut v4: Rc<UH4>) -> Rc<UH4> {
    match &*v3 {
        UH4::UH4_Cons(v5, v6) => {
            let mut v5: Rc<Heap0> = v5.clone();
            let mut v6: Rc<UH4> = v6.clone();
            let mut v7: Rc<UH4> = method35(v0.clone(), v1, v2.clone(), v3.clone(), v6.clone(), v4.clone());
            let mut v8: i32 = v5.l1.clone();
            let mut v9: bool = v8 == 1i32;
            let mut v12: bool = if v9 {
                let mut v10: i32 = v5.l2.clone();
                let mut v11: bool = v10 == v1;
                v11
            } else {
                false
            };
            if v12 {
                Rc::new(UH4::UH4_Cons(v5.clone(), v7.clone()))
            } else {
                v7.clone()
            }
        }
        UH4::UH4_Nil => {
            v4.clone()
        }
    }
}
fn method37(mut v0: Rc<Heap0>, mut v1: Rc<UH2>, mut v2: US0) -> US0 {
    match &*v1 {
        UH2::UH2_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: US0 = method37(v0.clone(), v4.clone(), v2.clone());
            let mut v6: Rc<str> = v0.l5.clone();
            let mut v7: bool = v3.clone() == v6.clone();
            if v7 {
                US0::US0_Some(v3.clone())
            } else {
                v5.clone()
            }
        }
        UH2::UH2_Nil => {
            v2.clone()
        }
    }
}
fn method36(mut v0: Rc<UH2>, mut v1: Rc<UH4>, mut v2: Rc<UH4>) -> Rc<UH4> {
    match &*v1 {
        UH4::UH4_Cons(v3, v4) => {
            let mut v3: Rc<Heap0> = v3.clone();
            let mut v4: Rc<UH4> = v4.clone();
            let mut v5: Rc<UH4> = method36(v0.clone(), v4.clone(), v2.clone());
            let mut v6: Rc<str> = v3.l5.clone();
            let mut v7: bool = v6.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v8: bool = v7 != true;
            let mut v15: bool = if v8 {
                let mut v9: US0 = US0::US0_None;
                let mut v10: US0 = method37(v3.clone(), v0.clone(), v9.clone());
                let mut v13: bool = match &v10 {
                    US0::US0_None => {
                        false
                    }
                    US0::US0_Some(v11) => {
                        let mut v11: Rc<str> = v11.clone();
                        true
                    }
                };
                let mut v14: bool = v13 == false;
                v14
            } else {
                false
            };
            if v15 {
                Rc::new(UH4::UH4_Cons(v3.clone(), v5.clone()))
            } else {
                v5.clone()
            }
        }
        UH4::UH4_Nil => {
            v2.clone()
        }
    }
}
fn method38(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH4>, mut v4: Rc<UH4>, mut v5: Rc<UH2>) -> Rc<UH2> {
    match &*v4 {
        UH4::UH4_Cons(v6, v7) => {
            let mut v6: Rc<Heap0> = v6.clone();
            let mut v7: Rc<UH4> = v7.clone();
            let mut v8: Rc<UH2> = method38(v0.clone(), v1, v2.clone(), v3.clone(), v7.clone(), v5.clone());
            let mut v9: Rc<str> = v6.l5.clone();
            let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cell "); } LIT.with(|lit| lit.clone()) };
            let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v0));
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" replies to "); } LIT.with(|lit| lit.clone()) };
            let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v12));
            let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v9));
            let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", which is not in the thread: posts before it are missing"); } LIT.with(|lit| lit.clone()) };
            let mut v16: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v15));
            Rc::new(UH2::UH2_Cons(v16.clone(), v8.clone()))
        }
        UH4::UH4_Nil => {
            v5.clone()
        }
    }
}
fn method33(mut v0: Rc<UH2>, mut v1: Rc<UH5>, mut v2: Rc<UH2>) -> Rc<UH2> {
    match &*v1 {
        UH5::UH5_Cons(v3, v4, v5, v6, v7) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: i32 = *v4;
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH4> = v6.clone();
            let mut v7: Rc<UH5> = v7.clone();
            let mut v8: Rc<UH2> = method33(v0.clone(), v7.clone(), v2.clone());
            let mut v9: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
            let mut v10: Rc<UH4> = method34(v3.clone(), v4, v5.clone(), v6.clone(), v9.clone());
            let mut v11: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
            let mut v12: Rc<UH4> = method36(v0.clone(), v10.clone(), v11.clone());
            let mut v13: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let mut v14: Rc<UH2> = method38(v3.clone(), v4, v5.clone(), v6.clone(), v12.clone(), v13.clone());
            method29(v14.clone(), v8.clone())
        }
        UH5::UH5_Nil => {
            v2.clone()
        }
    }
}
fn assembled_7(mut v0: Rc<UH1>) -> (Rc<UH2>, Rc<UH2>) {
    let mut v1: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v2: Rc<UH4> = method8(v0.clone(), v1.clone());
    let mut v3: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
    let mut v4: Rc<UH5> = method16(v2.clone(), v3.clone());
    let mut v5: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
    let mut v6: Rc<UH5> = method18(v4.clone(), v5.clone());
    let mut v7: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let mut v8: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let (mut v9, mut v10): (Rc<UH2>, Rc<UH2>) = method20(v6.clone(), v7.clone(), v8.clone());
    let mut v11: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let mut v12: Rc<UH2> = method32(v0.clone(), v11.clone());
    let mut v22: Rc<UH2> = match &*v6 {
        UH5::UH5_Cons(v13, v14, v15, v16, v17) => {
            let mut v13: Rc<str> = v13.clone();
            let mut v14: i32 = *v14;
            let mut v15: Rc<str> = v15.clone();
            let mut v16: Rc<UH4> = v16.clone();
            let mut v17: Rc<UH5> = v17.clone();
            let mut v18: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            method33(v12.clone(), v17.clone(), v18.clone())
        }
        UH5::UH5_Nil => {
            { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
        }
    };
    let mut v23: Rc<UH2> = method29(v10.clone(), v22.clone());
    (v9.clone(), v23.clone())
}
fn method39(mut v0: Rc<UH2>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH2::UH2_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH2> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method39(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n\n"); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH2::UH2_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn method40(mut v0: Rc<UH2>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH2::UH2_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH2> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method40(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH2::UH2_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn assembled_of_0(mut v0: Rc<str>) -> (i32, Rc<str>, Rc<str>) {
    let mut v1: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v0).unwrap_or_default();
    let mut v2: i32 = v1.as_array().map_or(0, |a| a.len()) as i32;
    let mut v3: i32 = v2.wrapping_sub(1i32);
    let mut v4: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v5: Rc<UH0> = from_1(v1.clone(), v3, v4.clone());
    let mut v6: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v7: Rc<UH1> = method2(v5.clone(), v6.clone());
    let (mut v8, mut v9): (Rc<UH2>, Rc<UH2>) = assembled_7(v7.clone());
    let mut v10: i32 = match &*v9 {
        UH2::UH2_Nil => {
            0i32
        }
        _ => {
            4i32
        }
    };
    let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = method39(v8.clone(), v11.clone());
    let (mut v14, mut v15): (Rc<str>, Rc<str>) = method40(v9.clone(), v11.clone());
    (v10, v12.clone(), v14.clone())
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>| -> (i32, Rc<str>, Rc<str>) {
        assembled_of_0(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_assemble(v0: &str) -> (i32, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0))
}
