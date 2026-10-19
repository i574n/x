#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<UH1>),
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(Rc<str>, Rc<str>, Rc<str>, Rc<UH2>),
}
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<str>, Rc<UH1>, Rc<UH2>, Rc<str>, Rc<UH0>),
}
struct Heap0 { l0: Rc<str>, l1: i32, l2: i32, l3: Rc<str>, l4: Rc<str>, l5: Rc<str> }
#[derive(Clone)]
enum UH3 {
    UH3_Nil,
    UH3_Cons(Rc<Heap0>, Rc<UH3>),
}
#[derive(Clone)]
enum UH4 {
    UH4_Nil,
    UH4_Cons(Rc<str>, i32, Rc<str>, Rc<UH3>, Rc<UH4>),
}
#[derive(Clone)]
enum UH5 {
    UH5_Nil,
    UH5_Cons(i32, Rc<UH5>),
}
#[derive(Clone)]
enum US0 {
    US0_Some(Rc<str>),
    US0_None,
}
fn from_2(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = Rc::<str>::from(v5.as_str().unwrap_or(""));
            let mut v7: Rc<UH1> = Rc::new(UH1::UH1_Cons(v6.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v7.clone());
            continue;
        }
    }
}
fn from_3(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH2>) -> Rc<UH2> {
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
fn from_1(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
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
            let mut v17: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v18: Rc<UH1> = from_2(v14.clone(), v16, v17.clone());
            let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("entities"); } LIT.with(|lit| lit.clone()) };
            let mut v20: serde_json::Value = v5.get(&*v19).cloned().unwrap_or_default();
            let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("urls"); } LIT.with(|lit| lit.clone()) };
            let mut v22: serde_json::Value = v20.get(&*v21).cloned().unwrap_or_default();
            let mut v23: i32 = v22.as_array().map_or(0, |a| a.len()) as i32;
            let mut v24: i32 = v23.wrapping_sub(1i32);
            let mut v25: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let mut v26: Rc<UH2> = from_3(v22.clone(), v24, v25.clone());
            let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
            let mut v28: serde_json::Value = v5.get(&*v27).cloned().unwrap_or_default();
            let mut v29: Rc<str> = Rc::<str>::from(v28.as_array().and_then(|a| a.iter().find(|r| r["type"] == "replied_to")).and_then(|r| r["id"].as_str()).unwrap_or(""));
            let mut v30: Rc<UH0> = Rc::new(UH0::UH0_Cons(v8.clone(), v12.clone(), v18.clone(), v26.clone(), v29.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v30.clone());
            continue;
        }
    }
}
fn method6(mut v0: Rc<UH3>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3) => {
            let mut v2: Rc<Heap0> = v2.clone();
            let mut v3: Rc<UH3> = v3.clone();
            let mut v4: Rc<UH3> = method6(v3.clone(), v1.clone());
            Rc::new(UH3::UH3_Cons(v2.clone(), v4.clone()))
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn method8(mut v0: Rc<UH2>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match &*v0 {
            UH2::UH2_Cons(v2, v3, v4, v5) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<str> = v3.clone();
                let mut v4: Rc<str> = v4.clone();
                let mut v5: Rc<UH2> = v5.clone();
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
            UH2::UH2_Nil => {
                return v1.clone();
            }
        }
    }
}
fn method9(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH1> = v3.clone();
                let mut v4: Rc<UH1> = Rc::new(UH1::UH1_Cons(v2.clone(), v1.clone()));
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH1::UH1_Nil => {
                return v1.clone();
            }
        }
    }
}
fn frames_of_7(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<UH1>, mut v3: Rc<UH2>, mut v4: Rc<str>) -> Rc<UH3> {
    let mut v5: Rc<str> = method8(v3.clone(), v1.clone());
    let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let mut v7: i32 = v5.find(&*v6).map(|i| i as i32).unwrap_or(-1);
    let mut v8: bool = v7 < 0i32;
    let mut v10: i32 = if v8 {
        let mut v9: i32 = (v5.clone().len() as i32);
        v9
    } else {
        v7
    };
    let mut v11: Rc<str> = Rc::<str>::from(&(v5)[((0i32) as usize)..(((0i32) + (v10)) as usize)]);
    let mut v12: Rc<str> = Rc::<str>::from((&*v11).split(32u8 as char).nth(1i32 as usize).unwrap_or(""));
    let mut v13: i32 = (&*v12).split(47u8 as char).nth(0i32 as usize).and_then(|x| x.parse::<i32>().ok()).unwrap_or(0);
    let mut v14: i32 = (&*v12).split(47u8 as char).nth(1i32 as usize).and_then(|x| x.parse::<i32>().ok()).unwrap_or(0);
    let mut v15: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v16: Rc<UH1> = method9(v2.clone(), v15.clone());
    let mut v20: Rc<str> = match &*v16 {
        UH1::UH1_Cons(v17, v18) => {
            let mut v17: Rc<str> = v17.clone();
            let mut v18: Rc<UH1> = v18.clone();
            v17.clone()
        }
        UH1::UH1_Nil => {
            v0.clone()
        }
    };
    let mut v21: bool = v20.clone() == v0.clone();
    let mut v24: bool = if v21 {
        let mut v22: i32 = (&*v11).split(32u8 as char).count() as i32;
        let mut v23: bool = v22 == 2i32;
        v23
    } else {
        false
    };
    let mut v28: bool = if v24 {
        let mut v25: Rc<str> = Rc::<str>::from((&*v11).split(32u8 as char).nth(1i32 as usize).unwrap_or(""));
        let mut v26: i32 = (&*v25).split(47u8 as char).count() as i32;
        let mut v27: bool = v26 == 2i32;
        v27
    } else {
        false
    };
    let mut v30: bool = if v28 {
        let mut v29: bool = v13 >= 1i32;
        v29
    } else {
        false
    };
    let mut v32: bool = if v30 {
        let mut v31: bool = v13 <= v14;
        v31
    } else {
        false
    };
    if v32 {
        let mut v33: Rc<str> = Rc::<str>::from((&*v11).split(32u8 as char).nth(0i32 as usize).unwrap_or(""));
        let mut v43: Rc<str> = if v8 {
            let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v34.clone()
        } else {
            let mut v35: i32 = v7.wrapping_add(1i32);
            let mut v36: i32 = (v5.clone().len() as i32);
            let mut v37: i32 = v36.wrapping_sub(v7);
            let mut v38: i32 = v37.wrapping_sub(1i32);
            let mut v39: Rc<str> = Rc::<str>::from(&(v5)[((v35) as usize)..(((v35) + (v38)) as usize)]);
            let mut v40: Rc<str> = Rc::<str>::from(char::from_u32(0x200B).unwrap().to_string() + ".");
            let mut v41: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("."); } LIT.with(|lit| lit.clone()) };
            let mut v42: Rc<str> = Rc::<str>::from(v39.replace(&*v40, &*v41));
            v42.clone()
        };
        let mut v47: Rc<str> = match &*v2 {
            UH1::UH1_Cons(v44, v45) => {
                let mut v44: Rc<str> = v44.clone();
                let mut v45: Rc<UH1> = v45.clone();
                v44.clone()
            }
            UH1::UH1_Nil => {
                v0.clone()
            }
        };
        let mut v48: Rc<Heap0> = Rc::new(Heap0 { l0: v33.clone(), l1: v13, l2: v14, l3: v43.clone(), l4: v47.clone(), l5: v4.clone() });
        let mut v49: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH3::UH3_Cons(v48.clone(), v49.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) }
    }
}
fn method5(mut v0: Rc<UH0>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3, v4, v5, v6, v7) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH1> = v4.clone();
            let mut v5: Rc<UH2> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH0> = v7.clone();
            let mut v8: Rc<UH3> = method5(v7.clone(), v1.clone());
            let mut v9: Rc<UH3> = frames_of_7(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone());
            method6(v9.clone(), v8.clone())
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn grouped_11(mut v0: Rc<UH4>, mut v1: Rc<Heap0>) -> Rc<UH4> {
    match &*v0 {
        UH4::UH4_Cons(v2, v3, v4, v5, v6) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: i32 = *v3;
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH3> = v5.clone();
            let mut v6: Rc<UH4> = v6.clone();
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
                let mut v27: Rc<UH3> = Rc::new(UH3::UH3_Cons(v1.clone(), v5.clone()));
                Rc::new(UH4::UH4_Cons(v2.clone(), v26, v22.clone(), v27.clone(), v6.clone()))
            } else {
                let mut v29: Rc<UH4> = grouped_11(v6.clone(), v1.clone());
                Rc::new(UH4::UH4_Cons(v2.clone(), v3, v4.clone(), v5.clone(), v29.clone()))
            }
        }
        UH4::UH4_Nil => {
            let mut v32: Rc<str> = v1.l0.clone();
            let mut v33: i32 = v1.l2.clone();
            let mut v34: Rc<str> = v1.l4.clone();
            let mut v35: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
            let mut v36: Rc<UH3> = Rc::new(UH3::UH3_Cons(v1.clone(), v35.clone()));
            let mut v37: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
            Rc::new(UH4::UH4_Cons(v32.clone(), v33, v34.clone(), v36.clone(), v37.clone()))
        }
    }
}
fn method10(mut v0: Rc<UH3>, mut v1: Rc<UH4>) -> Rc<UH4> {
    loop {
        match &*v0 {
            UH3::UH3_Cons(v2, v3) => {
                let mut v2: Rc<Heap0> = v2.clone();
                let mut v3: Rc<UH3> = v3.clone();
                let mut v4: Rc<UH4> = grouped_11(v1.clone(), v2.clone());
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH3::UH3_Nil => {
                return v1.clone();
            }
        }
    }
}
fn placed_13(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH3>, mut v4: Rc<UH4>) -> Rc<UH4> {
    match &*v4 {
        UH4::UH4_Cons(v5, v6, v7, v8, v9) => {
            let mut v5: Rc<str> = v5.clone();
            let mut v6: i32 = *v6;
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<UH3> = v8.clone();
            let mut v9: Rc<UH4> = v9.clone();
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
                let mut v21: Rc<UH4> = placed_13(v0.clone(), v1, v2.clone(), v3.clone(), v9.clone());
                Rc::new(UH4::UH4_Cons(v5.clone(), v6, v7.clone(), v8.clone(), v21.clone()))
            } else {
                Rc::new(UH4::UH4_Cons(v0.clone(), v1, v2.clone(), v3.clone(), v4.clone()))
            }
        }
        _ => {
            Rc::new(UH4::UH4_Cons(v0.clone(), v1, v2.clone(), v3.clone(), v4.clone()))
        }
    }
}
fn method12(mut v0: Rc<UH4>, mut v1: Rc<UH4>) -> Rc<UH4> {
    loop {
        match &*v0 {
            UH4::UH4_Cons(v2, v3, v4, v5, v6) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: i32 = *v3;
                let mut v4: Rc<str> = v4.clone();
                let mut v5: Rc<UH3> = v5.clone();
                let mut v6: Rc<UH4> = v6.clone();
                let mut v7: Rc<UH4> = placed_13(v2.clone(), v3, v4.clone(), v5.clone(), v1.clone());
                (v0, v1) = (v6.clone(), v7.clone());
                continue;
            }
            UH4::UH4_Nil => {
                return v1.clone();
            }
        }
    }
}
fn method15(mut v0: i32, mut v1: i32) -> Rc<UH5> {
    let mut v2: bool = v1 < v0;
    if v2 {
        let mut v3: i32 = v1.wrapping_add(1i32);
        let mut v4: Rc<UH5> = method15(v0, v3);
        Rc::new(UH5::UH5_Cons(v3, v4.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) }
    }
}
fn method18(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH3>, mut v4: i32, mut v5: Rc<UH3>, mut v6: Rc<UH3>) -> Rc<UH3> {
    match &*v5 {
        UH3::UH3_Cons(v7, v8) => {
            let mut v7: Rc<Heap0> = v7.clone();
            let mut v8: Rc<UH3> = v8.clone();
            let mut v9: Rc<UH3> = method18(v0.clone(), v1, v2.clone(), v3.clone(), v4, v8.clone(), v6.clone());
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
                Rc::new(UH3::UH3_Cons(v7.clone(), v9.clone()))
            } else {
                v9.clone()
            }
        }
        UH3::UH3_Nil => {
            v6.clone()
        }
    }
}
fn method17(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH3>, mut v4: i32, mut v5: Rc<UH3>) -> Rc<UH3> {
    match &*v3 {
        UH3::UH3_Cons(v6, v7) => {
            let mut v6: Rc<Heap0> = v6.clone();
            let mut v7: Rc<UH3> = v7.clone();
            let mut v8: Rc<UH3> = method18(v0.clone(), v1, v2.clone(), v3.clone(), v4, v7.clone(), v5.clone());
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
                Rc::new(UH3::UH3_Cons(v6.clone(), v8.clone()))
            } else {
                v8.clone()
            }
        }
        UH3::UH3_Nil => {
            v5.clone()
        }
    }
}
fn method19(mut v0: Rc<UH3>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH3::UH3_Cons(v2, v3) => {
                let mut v2: Rc<Heap0> = v2.clone();
                let mut v3: Rc<UH3> = v3.clone();
                let mut v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3.clone(), v4);
                continue;
            }
            UH3::UH3_Nil => {
                return v1;
            }
        }
    }
}
fn method16(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH3>, mut v4: Rc<UH5>, mut v5: Rc<UH5>) -> Rc<UH5> {
    match &*v4 {
        UH5::UH5_Cons(v6, v7) => {
            let mut v6: i32 = *v6;
            let mut v7: Rc<UH5> = v7.clone();
            let mut v8: Rc<UH5> = method16(v0.clone(), v1, v2.clone(), v3.clone(), v7.clone(), v5.clone());
            let mut v9: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
            let mut v10: Rc<UH3> = method17(v0.clone(), v1, v2.clone(), v3.clone(), v6, v9.clone());
            let mut v11: i32 = 0i32;
            let mut v12: i32 = method19(v10.clone(), v11);
            let mut v13: bool = v12 == 1i32;
            let mut v14: bool = v13 != true;
            if v14 {
                Rc::new(UH5::UH5_Cons(v6, v8.clone()))
            } else {
                v8.clone()
            }
        }
        UH5::UH5_Nil => {
            v5.clone()
        }
    }
}
fn method21(mut v0: Rc<UH3>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3) => {
            let mut v2: Rc<Heap0> = v2.clone();
            let mut v3: Rc<UH3> = v3.clone();
            let mut v4: Rc<UH1> = method21(v3.clone(), v1.clone());
            let mut v5: Rc<str> = v2.l3.clone();
            Rc::new(UH1::UH1_Cons(v5.clone(), v4.clone()))
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn method22(mut v0: Rc<UH1>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method22(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH1::UH1_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn method20(mut v0: i32, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<UH3>, mut v4: i32) -> Rc<UH1> {
    let mut v5: bool = v4 < v0;
    if v5 {
        let mut v6: i32 = v4.wrapping_add(1i32);
        let mut v7: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
        let mut v8: Rc<UH3> = method17(v1.clone(), v0, v2.clone(), v3.clone(), v6, v7.clone());
        let mut v9: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let mut v10: Rc<UH1> = method21(v8.clone(), v9.clone());
        let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let (mut v12, mut v13): (Rc<str>, Rc<str>) = method22(v10.clone(), v11.clone());
        let mut v14: Rc<UH1> = method20(v0, v1.clone(), v2.clone(), v3.clone(), v6);
        Rc::new(UH1::UH1_Cons(v12.clone(), v14.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    }
}
fn method23(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let mut v4: Rc<UH1> = method23(v3.clone(), v1.clone());
            Rc::new(UH1::UH1_Cons(v2.clone(), v4.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method24(mut v0: Rc<UH5>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH5::UH5_Cons(v2, v3) => {
            let mut v2: i32 = *v2;
            let mut v3: Rc<UH5> = v3.clone();
            let mut v4: Rc<UH1> = method24(v3.clone(), v1.clone());
            let mut v5: Rc<str> = Rc::<str>::from(format!("{:?}", v2));
            Rc::new(UH1::UH1_Cons(v5.clone(), v4.clone()))
        }
        UH5::UH5_Nil => {
            v1.clone()
        }
    }
}
fn method25(mut v0: Rc<UH1>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method25(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", "); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH1::UH1_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn method14(mut v0: Rc<UH4>, mut v1: Rc<UH1>, mut v2: Rc<UH1>) -> (Rc<UH1>, Rc<UH1>) {
    let (mut v47, mut v48): (Rc<UH1>, Rc<UH1>) = match &*v0 {
        UH4::UH4_Cons(v3, v4, v5, v6, v7) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: i32 = *v4;
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH3> = v6.clone();
            let mut v7: Rc<UH4> = v7.clone();
            let mut v8: i32 = 0i32;
            let mut v9: Rc<UH5> = method15(v4, v8);
            let mut v10: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
            let mut v11: Rc<UH5> = method16(v3.clone(), v4, v5.clone(), v6.clone(), v9.clone(), v10.clone());
            let (mut v41, mut v42): (Rc<UH1>, Rc<UH1>) = match &*v11 {
                UH5::UH5_Nil => {
                    let mut v12: i32 = 0i32;
                    let mut v13: Rc<UH1> = method20(v4, v3.clone(), v5.clone(), v6.clone(), v12);
                    let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let (mut v15, mut v16): (Rc<str>, Rc<str>) = method22(v13.clone(), v14.clone());
                    let mut v17: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let mut v18: Rc<UH1> = Rc::new(UH1::UH1_Cons(v15.clone(), v17.clone()));
                    let mut v19: Rc<UH1> = method23(v1.clone(), v18.clone());
                    (v19.clone(), v2.clone())
                }
                _ => {
                    let mut v20: i32 = 0i32;
                    let mut v21: Rc<UH5> = method15(v4, v20);
                    let mut v22: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
                    let mut v23: Rc<UH5> = method16(v3.clone(), v4, v5.clone(), v6.clone(), v21.clone(), v22.clone());
                    let mut v24: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let mut v25: Rc<UH1> = method24(v23.clone(), v24.clone());
                    let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let (mut v27, mut v28): (Rc<str>, Rc<str>) = method25(v25.clone(), v26.clone());
                    let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cell "); } LIT.with(|lit| lit.clone()) };
                    let mut v30: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v3));
                    let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" is missing frame "); } LIT.with(|lit| lit.clone()) };
                    let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v30, v31));
                    let mut v33: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v27));
                    let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" of "); } LIT.with(|lit| lit.clone()) };
                    let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v33, v34));
                    let mut v36: Rc<str> = Rc::<str>::from(format!("{:?}", v4));
                    let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v36));
                    let mut v38: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    let mut v39: Rc<UH1> = Rc::new(UH1::UH1_Cons(v37.clone(), v38.clone()));
                    let mut v40: Rc<UH1> = method23(v2.clone(), v39.clone());
                    (v1.clone(), v40.clone())
                }
            };
            method14(v7.clone(), v41.clone(), v42.clone())
        }
        _ => {
            let (mut v45, mut v46): (Rc<UH1>, Rc<UH1>) = match &*v0 {
                UH4::UH4_Nil => {
                    (v1.clone(), v2.clone())
                }
                _ => unreachable!(),
            };
            (v45.clone(), v46.clone())
        }
    };
    (v47.clone(), v48.clone())
}
fn method26(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3, v4, v5, v6, v7) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH1> = v4.clone();
            let mut v5: Rc<UH2> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH0> = v7.clone();
            let mut v8: Rc<UH1> = method26(v7.clone(), v1.clone());
            let mut v9: Rc<UH1> = method23(v4.clone(), v8.clone());
            Rc::new(UH1::UH1_Cons(v2.clone(), v9.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method29(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH3>, mut v4: Rc<UH3>, mut v5: Rc<UH3>) -> Rc<UH3> {
    match &*v4 {
        UH3::UH3_Cons(v6, v7) => {
            let mut v6: Rc<Heap0> = v6.clone();
            let mut v7: Rc<UH3> = v7.clone();
            let mut v8: Rc<UH3> = method29(v0.clone(), v1, v2.clone(), v3.clone(), v7.clone(), v5.clone());
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
                Rc::new(UH3::UH3_Cons(v6.clone(), v8.clone()))
            } else {
                v8.clone()
            }
        }
        UH3::UH3_Nil => {
            v5.clone()
        }
    }
}
fn method28(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH3>, mut v4: Rc<UH3>) -> Rc<UH3> {
    match &*v3 {
        UH3::UH3_Cons(v5, v6) => {
            let mut v5: Rc<Heap0> = v5.clone();
            let mut v6: Rc<UH3> = v6.clone();
            let mut v7: Rc<UH3> = method29(v0.clone(), v1, v2.clone(), v3.clone(), v6.clone(), v4.clone());
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
                Rc::new(UH3::UH3_Cons(v5.clone(), v7.clone()))
            } else {
                v7.clone()
            }
        }
        UH3::UH3_Nil => {
            v4.clone()
        }
    }
}
fn method31(mut v0: Rc<Heap0>, mut v1: Rc<UH1>, mut v2: US0) -> US0 {
    match &*v1 {
        UH1::UH1_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH1> = v4.clone();
            let mut v5: US0 = method31(v0.clone(), v4.clone(), v2.clone());
            let mut v6: Rc<str> = v0.l5.clone();
            let mut v7: bool = v3.clone() == v6.clone();
            if v7 {
                US0::US0_Some(v3.clone())
            } else {
                v5.clone()
            }
        }
        UH1::UH1_Nil => {
            v2.clone()
        }
    }
}
fn method30(mut v0: Rc<UH1>, mut v1: Rc<UH3>, mut v2: Rc<UH3>) -> Rc<UH3> {
    match &*v1 {
        UH3::UH3_Cons(v3, v4) => {
            let mut v3: Rc<Heap0> = v3.clone();
            let mut v4: Rc<UH3> = v4.clone();
            let mut v5: Rc<UH3> = method30(v0.clone(), v4.clone(), v2.clone());
            let mut v6: Rc<str> = v3.l5.clone();
            let mut v7: bool = v6.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v8: bool = v7 != true;
            let mut v15: bool = if v8 {
                let mut v9: US0 = US0::US0_None;
                let mut v10: US0 = method31(v3.clone(), v0.clone(), v9.clone());
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
                Rc::new(UH3::UH3_Cons(v3.clone(), v5.clone()))
            } else {
                v5.clone()
            }
        }
        UH3::UH3_Nil => {
            v2.clone()
        }
    }
}
fn method32(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>, mut v3: Rc<UH3>, mut v4: Rc<UH3>, mut v5: Rc<UH1>) -> Rc<UH1> {
    match &*v4 {
        UH3::UH3_Cons(v6, v7) => {
            let mut v6: Rc<Heap0> = v6.clone();
            let mut v7: Rc<UH3> = v7.clone();
            let mut v8: Rc<UH1> = method32(v0.clone(), v1, v2.clone(), v3.clone(), v7.clone(), v5.clone());
            let mut v9: Rc<str> = v6.l5.clone();
            let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cell "); } LIT.with(|lit| lit.clone()) };
            let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v0));
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" replies to "); } LIT.with(|lit| lit.clone()) };
            let mut v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v12));
            let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v9));
            let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", which is not in the thread: posts before it are missing"); } LIT.with(|lit| lit.clone()) };
            let mut v16: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v15));
            Rc::new(UH1::UH1_Cons(v16.clone(), v8.clone()))
        }
        UH3::UH3_Nil => {
            v5.clone()
        }
    }
}
fn method27(mut v0: Rc<UH1>, mut v1: Rc<UH4>, mut v2: Rc<UH1>) -> Rc<UH1> {
    match &*v1 {
        UH4::UH4_Cons(v3, v4, v5, v6, v7) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: i32 = *v4;
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH3> = v6.clone();
            let mut v7: Rc<UH4> = v7.clone();
            let mut v8: Rc<UH1> = method27(v0.clone(), v7.clone(), v2.clone());
            let mut v9: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
            let mut v10: Rc<UH3> = method28(v3.clone(), v4, v5.clone(), v6.clone(), v9.clone());
            let mut v11: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
            let mut v12: Rc<UH3> = method30(v0.clone(), v10.clone(), v11.clone());
            let mut v13: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v14: Rc<UH1> = method32(v3.clone(), v4, v5.clone(), v6.clone(), v12.clone(), v13.clone());
            method23(v14.clone(), v8.clone())
        }
        UH4::UH4_Nil => {
            v2.clone()
        }
    }
}
fn assembled_4(mut v0: Rc<UH0>) -> (Rc<UH1>, Rc<UH1>) {
    let mut v1: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let mut v2: Rc<UH3> = method5(v0.clone(), v1.clone());
    let mut v3: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v4: Rc<UH4> = method10(v2.clone(), v3.clone());
    let mut v5: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v6: Rc<UH4> = method12(v4.clone(), v5.clone());
    let mut v7: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v8: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let (mut v9, mut v10): (Rc<UH1>, Rc<UH1>) = method14(v6.clone(), v7.clone(), v8.clone());
    let mut v11: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v12: Rc<UH1> = method26(v0.clone(), v11.clone());
    let mut v22: Rc<UH1> = match &*v6 {
        UH4::UH4_Cons(v13, v14, v15, v16, v17) => {
            let mut v13: Rc<str> = v13.clone();
            let mut v14: i32 = *v14;
            let mut v15: Rc<str> = v15.clone();
            let mut v16: Rc<UH3> = v16.clone();
            let mut v17: Rc<UH4> = v17.clone();
            let mut v18: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            method27(v12.clone(), v17.clone(), v18.clone())
        }
        UH4::UH4_Nil => {
            { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
        }
    };
    let mut v23: Rc<UH1> = method23(v10.clone(), v22.clone());
    (v9.clone(), v23.clone())
}
fn method33(mut v0: Rc<UH1>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method33(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n\n"); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH1::UH1_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn method34(mut v0: Rc<UH1>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method34(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH1::UH1_Nil => {
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
    let mut v2: serde_json::Value = serde_json::Value::from((v1).as_array().map(|ps| ps.iter().flat_map(|p| p["data"].as_array().cloned().unwrap_or_default()).collect::<Vec<_>>()).unwrap_or_default());
    let mut v3: i32 = v2.as_array().map_or(0, |a| a.len()) as i32;
    let mut v4: i32 = v3.wrapping_sub(1i32);
    let mut v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v6: Rc<UH0> = from_1(v2.clone(), v4, v5.clone());
    let (mut v7, mut v8): (Rc<UH1>, Rc<UH1>) = assembled_4(v6.clone());
    let mut v9: i32 = match &*v8 {
        UH1::UH1_Nil => {
            0i32
        }
        _ => {
            4i32
        }
    };
    let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = method33(v7.clone(), v10.clone());
    let (mut v13, mut v14): (Rc<str>, Rc<str>) = method34(v8.clone(), v10.clone());
    (v9, v11.clone(), v13.clone())
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> (i32, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> (i32, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>| -> (i32, Rc<str>, Rc<str>) {
        assembled_of_0(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_assemble(v0: &str) -> (i32, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0))
}
