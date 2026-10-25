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
enum US0 {
    US0_Some(Rc<str>),
    US0_None,
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, US0, Rc<UH1>),
}
#[derive(Clone)]
enum UH4 {
    UH4_Nil,
    UH4_Cons(Rc<str>, Rc<UH4>),
}
#[derive(Clone)]
enum US1 {
    US1_Some(Rc<str>, i32, i32, Rc<str>),
    US1_None,
}
#[derive(Clone)]
enum US3 {
    US3_NotTwoWords,
    US3_NotAFraction,
    US3_PartOutOfRange,
}
#[derive(Clone)]
enum US2 {
    US2_Ok(Rc<str>, i32, i32),
    US2_Error(US3),
}
#[derive(Clone)]
enum US4 {
    US4_Some(i32),
    US4_None,
}
fn from_1(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let mut v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v6.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v7.clone());
            continue;
        }
    }
}
fn method3(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: serde_json::Value = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method3(v3, v1.clone());
            Rc::new(UH0::UH0_Cons(v2, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method2(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: serde_json::Value = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method2(v3, v1.clone());
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v6: serde_json::Value = v2.get(&*v5).cloned().unwrap_or_default();
            let v7: usize = v6.as_array().map_or(0, Vec::len);
            let v8: i32 = ((v7) as i32);
            let v9: i32 = v8.wrapping_sub(1i32);
            let mut v10: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v11: Rc<UH0> = from_1(v6, v9, v10);
            method3(v11, v4)
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn from_5(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH4>) -> Rc<UH4> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let mut v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
            let v8: Rc<UH4> = Rc::new(UH4::UH4_Cons(v7.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v8.clone());
            continue;
        }
    }
}
fn method6(mut v0: Rc<UH4>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH4::UH4_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH4> = v3.clone();
            let mut v4: Rc<UH2> = method6(v3, v1.clone());
            Rc::new(UH2::UH2_Cons(v2, v4))
        }
        UH4::UH4_Nil => {
            v1
        }
    }
}
fn from_7(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH3>) -> Rc<UH3> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let mut v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("url"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v6.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("expanded_url"); } LIT.with(|lit| lit.clone()) };
            let mut v11: serde_json::Value = v6.get(&*v10).cloned().unwrap_or_default();
            let v12: Rc<str> = Rc::<str>::from(v11.as_str().unwrap_or(""));
            let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
            let v14: serde_json::Value = v6.get(&*v13).cloned().unwrap_or_default();
            let v15: Rc<str> = Rc::<str>::from(v14.as_str().unwrap_or(""));
            let v16: Rc<UH3> = Rc::new(UH3::UH3_Cons(v9.clone(), v12.clone(), v15.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v16.clone());
            continue;
        }
    }
}
fn first_reply_from_8(mut v0: i32, mut v1: serde_json::Value) -> Rc<str> {
    loop {
        let v2: usize = v1.as_array().map_or(0, Vec::len);
        let v3: i32 = ((v2) as i32);
        let mut v4: bool = v0 >= v3;
        if v4 {
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            return v5.clone();
        } else {
            let mut v6: usize = ((v0) as usize);
            let v7: serde_json::Value = v1.get(v6).cloned().unwrap_or_default();
            let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("type"); } LIT.with(|lit| lit.clone()) };
            let v9: serde_json::Value = v7.get(&*v8).cloned().unwrap_or_default();
            let mut v10: Rc<str> = Rc::<str>::from(v9.as_str().unwrap_or(""));
            let mut v11: bool = &*v10 == "replied_to";
            if v11 {
                let v12: usize = ((v0) as usize);
                let v13: serde_json::Value = v1.get(v12).cloned().unwrap_or_default();
                let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
                let v15: serde_json::Value = v13.get(&*v14).cloned().unwrap_or_default();
                let v16: Rc<str> = Rc::<str>::from(v15.as_str().unwrap_or(""));
                return v16.clone();
            } else {
                let v17: i32 = v0.wrapping_add(1i32);
                (v0, v1) = (v17, v1.clone());
                continue;
            }
        }
    }
}
fn method4(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: serde_json::Value = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH1> = method4(v3, v1.clone());
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let mut v6: serde_json::Value = v2.get(&*v5).cloned().unwrap_or_default();
            let v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
            let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
            let v9: serde_json::Value = v2.get(&*v8).cloned().unwrap_or_default();
            let mut v10: Rc<str> = Rc::<str>::from(v9.as_str().unwrap_or(""));
            let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&lt;"); } LIT.with(|lit| lit.clone()) };
            let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("<"); } LIT.with(|lit| lit.clone()) };
            let v13: Rc<str> = Rc::<str>::from(v10.replace(&*v11, &*v12));
            let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&gt;"); } LIT.with(|lit| lit.clone()) };
            let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(">"); } LIT.with(|lit| lit.clone()) };
            let v16: Rc<str> = Rc::<str>::from(v13.replace(&*v14, &*v15));
            let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&amp;"); } LIT.with(|lit| lit.clone()) };
            let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&"); } LIT.with(|lit| lit.clone()) };
            let v19: Rc<str> = Rc::<str>::from(v16.replace(&*v17, &*v18));
            let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("edit_history_post_ids"); } LIT.with(|lit| lit.clone()) };
            let mut v21: serde_json::Value = v2.get(&*v20).cloned().unwrap_or_default();
            let mut v22: usize = v21.as_array().map_or(0, Vec::len);
            let v23: i32 = ((v22) as i32);
            let v24: i32 = v23.wrapping_sub(1i32);
            let v25: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
            let v26: Rc<UH4> = from_5(v21, v24, v25);
            let v27: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let v28: Rc<UH2> = method6(v26, v27);
            let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("entities"); } LIT.with(|lit| lit.clone()) };
            let v30: serde_json::Value = v2.get(&*v29).cloned().unwrap_or_default();
            let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("urls"); } LIT.with(|lit| lit.clone()) };
            let mut v32: serde_json::Value = v30.get(&*v31).cloned().unwrap_or_default();
            let v33: usize = v32.as_array().map_or(0, Vec::len);
            let v34: i32 = ((v33) as i32);
            let v35: i32 = v34.wrapping_sub(1i32);
            let v36: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
            let v37: Rc<UH3> = from_7(v32, v35, v36);
            let v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
            let v39: serde_json::Value = v2.get(&*v38).cloned().unwrap_or_default();
            let v40: i32 = 0i32;
            let v41: Rc<str> = first_reply_from_8(v40, v39);
            let v42: bool = &*v41 == "";
            let v45: US0 = if v42 {
                US0::US0_None
            } else {
                US0::US0_Some(v41)
            };
            Rc::new(UH1::UH1_Cons(v7, v19, v28, v37, v45, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method10(mut v0: Rc<UH4>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH4::UH4_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH4> = v3.clone();
            let mut v4: Rc<UH4> = method10(v3, v1.clone());
            Rc::new(UH4::UH4_Cons(v2, v4))
        }
        UH4::UH4_Nil => {
            v1
        }
    }
}
fn method12(mut v0: Rc<UH3>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match &*v0 {
            UH3::UH3_Cons(v2, v3, v4, v5) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<str> = v3.clone();
                let mut v4: Rc<str> = v4.clone();
                let mut v5: Rc<UH3> = v5.clone();
                let mut v6: bool = &*v3 == "";
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
fn method14(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure1() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let mut v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn digits_18(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> US4 {
    loop {
        let v3: i32 = (v0.clone().len() as i32);
        let mut v4: bool = v1 >= v3;
        if v4 {
            return US4::US4_Some(v2);
        } else {
            let mut v6: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789"); } LIT.with(|lit| lit.clone()) };
            let v8: Option<usize> = v7.find(&*v6);
            let v9: Option<usize> = method14(v8.clone());
            let mut v10: Rc<dyn Fn((usize)) -> i32> = closure1();
            let mut v11: Option<i32> = v9.map(|x| v10(x));
            let v13: i32 = v11.unwrap_or(-1i32);
            let v14: bool = v13 < 0i32;
            let v16: bool = if v14 {
                true
            } else {
                let v15: bool = v2 > 100000000i32;
                v15
            };
            if v16 {
                return US4::US4_None;
            } else {
                let v18: i32 = v1.wrapping_add(1i32);
                let v19: i32 = v2.wrapping_mul(10i32);
                let v20: i32 = v19.wrapping_add(v13);
                (v0, v1, v2) = (v0.clone(), v18, v20);
                continue;
            }
        }
    }
}
fn count_of_text_17(mut v0: Rc<str>) -> US4 {
    let mut v1: bool = &*v0 == "";
    let v24: bool = if v1 {
        true
    } else {
        let v2: Rc<str> = Rc::<str>::from(format!("{:?}", 0i32));
        let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v4: Rc<str> = Rc::<str>::from(v0.replace(&*v2, &*v3));
        let mut v5: Rc<str> = Rc::<str>::from(format!("{:?}", 1i32));
        let mut v6: Rc<str> = Rc::<str>::from(v4.replace(&*v5, &*v3));
        let v7: Rc<str> = Rc::<str>::from(format!("{:?}", 2i32));
        let v8: Rc<str> = Rc::<str>::from(v6.replace(&*v7, &*v3));
        let v9: Rc<str> = Rc::<str>::from(format!("{:?}", 3i32));
        let mut v10: Rc<str> = Rc::<str>::from(v8.replace(&*v9, &*v3));
        let mut v11: Rc<str> = Rc::<str>::from(format!("{:?}", 4i32));
        let v12: Rc<str> = Rc::<str>::from(v10.replace(&*v11, &*v3));
        let v13: Rc<str> = Rc::<str>::from(format!("{:?}", 5i32));
        let v14: Rc<str> = Rc::<str>::from(v12.replace(&*v13, &*v3));
        let v15: Rc<str> = Rc::<str>::from(format!("{:?}", 6i32));
        let v16: Rc<str> = Rc::<str>::from(v14.replace(&*v15, &*v3));
        let v17: Rc<str> = Rc::<str>::from(format!("{:?}", 7i32));
        let v18: Rc<str> = Rc::<str>::from(v16.replace(&*v17, &*v3));
        let v19: Rc<str> = Rc::<str>::from(format!("{:?}", 8i32));
        let v20: Rc<str> = Rc::<str>::from(v18.replace(&*v19, &*v3));
        let mut v21: Rc<str> = Rc::<str>::from(format!("{:?}", 9i32));
        let mut v22: Rc<str> = Rc::<str>::from(v20.replace(&*v21, &*v3));
        let v23: bool = &*v22 != "";
        v23
    };
    if v24 {
        US4::US4_None
    } else {
        let v26: i32 = 0i32;
        let v27: i32 = 0i32;
        digits_18(v0, v26, v27)
    }
}
fn fraction_of_16(mut v0: Rc<str>, mut v1: Rc<str>) -> US2 {
    let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
    let v3: Option<usize> = v1.find(&*v2);
    let mut v4: Option<usize> = method14(v3);
    let mut v5: Rc<dyn Fn((usize)) -> i32> = closure1();
    let mut v6: Option<i32> = v4.map(|x| v5(x));
    let v8: i32 = v6.unwrap_or(-1i32);
    let v9: bool = v8 > 0i32;
    if v9 {
        let mut v10: usize = ((0i32) as usize);
        let mut v11: usize = ((v8) as usize);
        let v12: Rc<str> = Rc::<str>::from(&(v1)[v10..v11]);
        let v13: US4 = count_of_text_17(v12);
        match &v13 {
            US4::US4_None => {
                let v36: US3 = US3::US3_NotAFraction;
                US2::US2_Error(v36)
            }
            US4::US4_Some(v14) => {
                let v14: i32 = *v14;
                let v15: i32 = v8.wrapping_add(1i32);
                let v16: i32 = (v1.clone().len() as i32);
                let v17: i32 = v16.wrapping_sub(v8);
                let v18: i32 = v17.wrapping_sub(1i32);
                let v19: usize = ((v15) as usize);
                let v20: i32 = v15.wrapping_add(v18);
                let mut v21: usize = ((v20) as usize);
                let mut v22: Rc<str> = Rc::<str>::from(&(v1)[v19..v21]);
                let v23: US4 = count_of_text_17(v22);
                match &v23 {
                    US4::US4_None => {
                        let mut v32: US3 = US3::US3_NotAFraction;
                        US2::US2_Error(v32)
                    }
                    US4::US4_Some(v24) => {
                        let v24: i32 = *v24;
                        let v25: bool = v14 >= 1i32;
                        let v27: bool = if v25 {
                            let v26: bool = v14 <= v24;
                            v26
                        } else {
                            false
                        };
                        if v27 {
                            US2::US2_Ok(v0, v14, v24)
                        } else {
                            let v29: US3 = US3::US3_PartOutOfRange;
                            US2::US2_Error(v29)
                        }
                    }
                }
            }
        }
    } else {
        let v40: US3 = US3::US3_NotAFraction;
        US2::US2_Error(v40)
    }
}
fn parsed_15(mut v0: Rc<str>) -> US2 {
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
    let v2: Option<usize> = v0.find(&*v1);
    let v3: Option<usize> = method14(v2);
    let mut v4: Rc<dyn Fn((usize)) -> i32> = closure1();
    let mut v5: Option<i32> = v3.map(|x| v4(x));
    let v7: i32 = v5.unwrap_or(-1i32);
    let v8: bool = v7 > 0i32;
    let v18: Rc<str> = if v8 {
        let v9: i32 = v7.wrapping_add(1i32);
        let mut v10: i32 = (v0.clone().len() as i32);
        let mut v11: i32 = v10.wrapping_sub(v7);
        let v12: i32 = v11.wrapping_sub(1i32);
        let v13: usize = ((v9) as usize);
        let v14: i32 = v9.wrapping_add(v12);
        let v15: usize = ((v14) as usize);
        let v16: Rc<str> = Rc::<str>::from(&(v0)[v13..v15]);
        v16
    } else {
        let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v17
    };
    let v19: bool = v7 <= 0i32;
    let v26: bool = if v19 {
        true
    } else {
        let v20: Option<usize> = v18.find(&*v1);
        let mut v21: Option<usize> = method14(v20);
        let mut v22: Option<i32> = v21.map(|x| v4(x));
        let v24: i32 = v22.unwrap_or(-1i32);
        let v25: bool = v24 >= 0i32;
        v25
    };
    if v26 {
        let v27: US3 = US3::US3_NotTwoWords;
        US2::US2_Error(v27)
    } else {
        let v29: usize = ((0i32) as usize);
        let v30: usize = ((v7) as usize);
        let v31: Rc<str> = Rc::<str>::from(&(v0)[v29..v30]);
        fraction_of_16(v31, v18)
    }
}
fn frame_text_of_13(mut v0: Rc<str>) -> US1 {
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let v2: Option<usize> = v0.find(&*v1);
    let v3: Option<usize> = method14(v2);
    let mut v4: Rc<dyn Fn((usize)) -> i32> = closure1();
    let mut v5: Option<i32> = v3.map(|x| v4(x));
    let v7: i32 = v5.unwrap_or(-1i32);
    let v8: bool = v7 < 0i32;
    let mut v10: i32 = if v8 {
        let v9: i32 = (v0.clone().len() as i32);
        v9
    } else {
        v7
    };
    let mut v11: usize = ((0i32) as usize);
    let v12: usize = ((v10) as usize);
    let v13: Rc<str> = Rc::<str>::from(&(v0)[v11..v12]);
    let v14: US2 = parsed_15(v13);
    match &v14 {
        US2::US2_Error(v36) => {
            let v36: US3 = v36.clone();
            US1::US1_None
        }
        US2::US2_Ok(v15, v16, v17) => {
            let v15: Rc<str> = v15.clone();
            let v16: i32 = *v16;
            let v17: i32 = *v17;
            let v34: Rc<str> = if v8 {
                let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v18
            } else {
                let v19: i32 = v7.wrapping_add(1i32);
                let v20: i32 = (v0.clone().len() as i32);
                let mut v21: i32 = v20.wrapping_sub(v7);
                let mut v22: i32 = v21.wrapping_sub(1i32);
                let v23: usize = ((v19) as usize);
                let v24: i32 = v19.wrapping_add(v22);
                let v25: usize = ((v24) as usize);
                let v26: Rc<str> = Rc::<str>::from(&(v0)[v23..v25]);
                let v27: Option<char> = char::from_u32(8203u32);
                let v29: char = v27.unwrap();
                let v30: Rc<str> = Rc::<str>::from(format!("{}", v29));
                let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("."); } LIT.with(|lit| lit.clone()) };
                let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v30, v31));
                let v33: Rc<str> = Rc::<str>::from(v26.replace(&*v32, &*v31));
                v33
            };
            US1::US1_Some(v15, v16, v17, v34)
        }
    }
}
fn method19(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    loop {
        match &*v0 {
            UH2::UH2_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH2> = v3.clone();
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
fn frames_of_11(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<UH2>, mut v3: Rc<UH3>, mut v4: US0) -> Rc<UH4> {
    let mut v5: Rc<str> = method12(v3, v1);
    let mut v6: US1 = frame_text_of_13(v5);
    match &v6 {
        US1::US1_Some(v7, v8, v9, v10) => {
            let v7: Rc<str> = v7.clone();
            let v8: i32 = *v8;
            let v9: i32 = *v9;
            let mut v10: Rc<str> = v10.clone();
            let mut v11: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            let v12: Rc<UH2> = method19(v2.clone(), v11);
            let v17: bool = match &*v12 {
                UH2::UH2_Cons(v13, v14) => {
                    let v13: Rc<str> = v13.clone();
                    let v14: Rc<UH2> = v14.clone();
                    let v15: bool = &*v13 == &*v0;
                    v15
                }
                UH2::UH2_Nil => {
                    true
                }
            };
            if v17 {
                let mut v21: Rc<str> = match &*v2 {
                    UH2::UH2_Cons(v18, v19) => {
                        let v18: Rc<str> = v18.clone();
                        let v19: Rc<UH2> = v19.clone();
                        v18
                    }
                    UH2::UH2_Nil => {
                        v0
                    }
                };
                let mut v22: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v7).to_string());
                let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) };
                let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cell"); } LIT.with(|lit| lit.clone()) };
                let v26: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v23, v24)), v23));
                let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
                let v29: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v26, v27)), v22));
                let v30: Rc<str> = Rc::<str>::from(format!("{:?}", v8));
                let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("k"); } LIT.with(|lit| lit.clone()) };
                let v35: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v23, v31)), v23)), v27)), v30));
                let v36: Rc<str> = Rc::<str>::from(format!("{:?}", v9));
                let v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("n"); } LIT.with(|lit| lit.clone()) };
                let v41: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v23, v37)), v23)), v27)), v36));
                let v42: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v10).to_string());
                let v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("body"); } LIT.with(|lit| lit.clone()) };
                let v47: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v23, v43)), v23)), v27)), v42));
                let v48: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v21).to_string());
                let v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("original"); } LIT.with(|lit| lit.clone()) };
                let v53: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v23, v49)), v23)), v27)), v48));
                let v57: Rc<str> = match &v4 {
                    US0::US0_None => {
                        let v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                        v55
                    }
                    US0::US0_Some(v54) => {
                        let v54: Rc<str> = v54.clone();
                        v54
                    }
                };
                let v58: Rc<str> = Rc::<str>::from(serde_json::Value::from(&*v57).to_string());
                let v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("parent"); } LIT.with(|lit| lit.clone()) };
                let v63: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v23, v59)), v23)), v27)), v58));
                let v64: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let v66: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v63, v64)), v64));
                let v67: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                let v69: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v53, v67)), v66));
                let v71: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v47, v67)), v69));
                let v73: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v41, v67)), v71));
                let v75: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v35, v67)), v73));
                let v77: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v29, v67)), v75));
                let v78: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{"); } LIT.with(|lit| lit.clone()) };
                let v79: Rc<str> = Rc::<str>::from(format!("{}{}", v78, v77));
                let v80: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
                let v81: Rc<str> = Rc::<str>::from(format!("{}{}", v79, v80));
                let v82: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
                Rc::new(UH4::UH4_Cons(v81, v82))
            } else {
                { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) }
            }
        }
        _ => {
            { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) }
        }
    }
}
fn method9(mut v0: Rc<UH1>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH3> = v5.clone();
            let mut v6: US0 = v6.clone();
            let v7: Rc<UH1> = v7.clone();
            let v8: Rc<UH4> = method9(v7, v1.clone());
            let v9: Rc<UH4> = frames_of_11(v2, v3, v4, v5, v6);
            method10(v9, v8)
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method20(mut v0: Rc<UH4>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH4::UH4_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH4> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method20(v4, v1.clone(), v2.clone());
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v3, v6)), v5));
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            (v8, v9)
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v0 {
                UH4::UH4_Nil => {
                    (v1, v2)
                }
                _ => unreachable!(),
            };
            (v10, v11)
        }
    };
    (v12, v13)
}
fn method22(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH2> = v3.clone();
            let mut v4: Rc<UH2> = method22(v3, v1.clone());
            Rc::new(UH2::UH2_Cons(v2, v4))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn method21(mut v0: Rc<UH1>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH3> = v5.clone();
            let mut v6: US0 = v6.clone();
            let v7: Rc<UH1> = v7.clone();
            let v8: Rc<UH2> = method21(v7, v1.clone());
            let v9: Rc<UH2> = method22(v4, v8);
            Rc::new(UH2::UH2_Cons(v2, v9))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method23(mut v0: Rc<UH2>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH2> = v3.clone();
            let mut v4: Rc<UH4> = method23(v3, v1.clone());
            Rc::new(UH4::UH4_Cons(v2, v4))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn method24(mut v0: Rc<UH4>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH4::UH4_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH4> = v3.clone();
            let mut v4: Rc<UH4> = method24(v3, v1.clone());
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) };
            let v7: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v5, v2)), v5));
            Rc::new(UH4::UH4_Cons(v7, v4))
        }
        UH4::UH4_Nil => {
            v1
        }
    }
}
fn located_0(mut v0: Rc<str>) -> Rc<str> {
    let mut v1: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v0).unwrap_or_default();
    let v2: usize = v1.as_array().map_or(0, Vec::len);
    let v3: i32 = ((v2) as i32);
    let mut v4: i32 = v3.wrapping_sub(1i32);
    let mut v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v6: Rc<UH0> = from_1(v1, v4, v5);
    let v7: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v8: Rc<UH0> = method2(v6, v7);
    let v9: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v10: Rc<UH1> = method4(v8, v9);
    let mut v11: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let v12: Rc<UH4> = method9(v10.clone(), v11);
    let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v14, mut v15): (Rc<str>, Rc<str>) = method20(v12, v13.clone(), v13.clone());
    let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
    let v17: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v14));
    let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
    let v19: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v18));
    let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) };
    let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("frames"); } LIT.with(|lit| lit.clone()) };
    let v23: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v20, v21)), v20));
    let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
    let v26: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v23, v24)), v19));
    let v27: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let v28: Rc<UH2> = method21(v10, v27);
    let v29: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let v30: Rc<UH4> = method23(v28, v29);
    let v31: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v32: Rc<UH4> = method24(v30, v31);
    let (mut v33, mut v34): (Rc<str>, Rc<str>) = method20(v32, v13.clone(), v13.clone());
    let v36: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v16, v33)), v18));
    let v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("known"); } LIT.with(|lit| lit.clone()) };
    let v43: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v20, v37)), v20)), v24)), v36)), v13)), v13));
    let v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let v46: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v26, v44)), v43));
    let v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{"); } LIT.with(|lit| lit.clone()) };
    let v48: Rc<str> = Rc::<str>::from(format!("{}{}", v47, v46));
    let v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
    let v50: Rc<str> = Rc::<str>::from(format!("{}{}", v48, v49));
    v50
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        located_0(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_locate(v0: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0))
}
