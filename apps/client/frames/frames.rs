#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<UH0>, Rc<UH1>),
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(i32, Rc<UH2>),
}
fn from_0(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
            let v8: Rc<UH0> = Rc::new(UH0::UH0_Cons(v7.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v8.clone());
            continue;
        }
    }
}
fn closure2(mut v0: Rc<str>, mut v1: i32) -> Rc<dyn Fn(Rc<str>) -> Rc<UH0>> {
    Rc::new(move |mut v2: Rc<str>| -> Rc<UH0> {
        let mut v3: Rc<str> = xc_posted::xc_posted_text(&*v0, &*v2);
        let v4: Rc<str> = xc_chunks::xc_cell_chunks(&*v0, v1, &*v3);
        let mut v5: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v4).unwrap_or_default();
        let v6: usize = v5.as_array().map_or(0, Vec::len);
        let v7: i32 = ((v6) as i32);
        let v8: i32 = v7.wrapping_sub(1i32);
        let v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        from_0(v5.clone(), v8, v9.clone())
    })
}
fn closure1(mut v0: Rc<str>) -> Rc<dyn Fn(i32) -> Rc<dyn Fn(Rc<str>) -> Rc<UH0>>> {
    Rc::new(move |mut v1: i32| -> Rc<dyn Fn(Rc<str>) -> Rc<UH0>> {
        closure2(v0.clone(), v1)
    })
}
fn closure3(mut v0: Rc<str>) -> Rc<dyn Fn(Rc<str>) -> i32> {
    Rc::new(move |mut v1: Rc<str>| -> i32 {
        let v2: i32 = xc_weights::xc_weight(&*v0, &*v1);
        v2
    })
}
fn method5(mut v0: Rc<Vec<Rc<str>>>, mut v1: i32, mut v2: i32, mut v3: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v4: bool = v2 >= v1;
        if v4 {
            return v3.clone();
        } else {
            let mut v5: Rc<str> = (v0)[v2 as usize].clone();
            let v6: i32 = v2.wrapping_add(1i32);
            let v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v5.clone(), v3.clone()));
            (v0, v1, v2, v3) = (v0.clone(), v1, v6, v7.clone());
            continue;
        }
    }
}
fn method6(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
                let v4: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2.clone(), v1.clone()));
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH0::UH0_Nil => {
                return v1.clone();
            }
        }
    }
}
fn method8(mut v0: Rc<Vec<char>>, mut v1: i32, mut v2: i32, mut v3: Rc<UH2>) -> Rc<UH2> {
    loop {
        let v4: bool = v2 >= v1;
        if v4 {
            return v3.clone();
        } else {
            let mut v5: char = (v0)[v2 as usize].clone();
            let v6: i32 = v2.wrapping_add(1i32);
            let v7: u32 = u32::from(v5);
            let v8: i32 = (v7 as i32);
            let v9: Rc<UH2> = Rc::new(UH2::UH2_Cons(v8, v3.clone()));
            (v0, v1, v2, v3) = (v0.clone(), v1, v6, v9.clone());
            continue;
        }
    }
}
fn closure4() -> Rc<dyn Fn(i32) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(i32) -> bool> = Rc::new(move |mut v0: i32| -> bool {
        let v1: bool = v0 >= 9i32;
        let mut v3: bool = if v1 {
            let v2: bool = v0 <= 13i32;
            v2
        } else {
            false
        };
        let mut v5: bool = if v3 {
            true
        } else {
            let v4: bool = v0 == 32i32;
            v4
        };
        let v7: bool = if v5 {
            true
        } else {
            let v6: bool = v0 == 133i32;
            v6
        };
        let v9: bool = if v7 {
            true
        } else {
            let v8: bool = v0 == 160i32;
            v8
        };
        let v11: bool = if v9 {
            true
        } else {
            let v10: bool = v0 == 5760i32;
            v10
        };
        let v15: bool = if v11 {
            true
        } else {
            let v12: bool = v0 >= 8192i32;
            if v12 {
                let v13: bool = v0 <= 8202i32;
                v13
            } else {
                false
            }
        };
        let v17: bool = if v15 {
            true
        } else {
            let v16: bool = v0 == 8232i32;
            v16
        };
        let v19: bool = if v17 {
            true
        } else {
            let v18: bool = v0 == 8233i32;
            v18
        };
        let v21: bool = if v19 {
            true
        } else {
            let v20: bool = v0 == 8239i32;
            v20
        };
        let v23: bool = if v21 {
            true
        } else {
            let v22: bool = v0 == 8287i32;
            v22
        };
        let v25: bool = if v23 {
            true
        } else {
            let v24: bool = v0 == 12288i32;
            v24
        };
        let v26: bool = v25 == false;
        v26
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method9() -> Rc<dyn Fn(i32) -> bool> {
    closure4()
}
fn method10(mut v0: Rc<dyn Fn(i32) -> bool>, mut v1: Rc<UH2>) -> bool {
    loop {
        match &*v1 {
            UH2::UH2_Cons(v2, v3) => {
                let v2: i32 = *v2;
                let mut v3: Rc<UH2> = v3.clone();
                let v4: bool = v0(v2);
                if v4 {
                    return true;
                } else {
                    let mut v5: Rc<dyn Fn(i32) -> bool> = method9();
                    (v0, v1) = (v5.clone(), v3.clone());
                    continue;
                }
            }
            UH2::UH2_Nil => {
                return false;
            }
        }
    }
}
fn without_blank_tail_7(mut v0: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v1, v2) => {
                let v1: Rc<str> = v1.clone();
                let v2: Rc<UH0> = v2.clone();
                let mut v3: Rc<Vec<char>> = Rc::new((&*v1).chars().collect());
                let v4: Rc<Vec<char>> = Rc::new({ let mut v = (v3).as_ref().clone(); v.reverse(); v });
                let mut v5: i32 = (v4).len() as i32;
                let v6: i32 = 0i32;
                let v7: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                let v8: Rc<UH2> = method8(v4.clone(), v5, v6, v7.clone());
                let v9: Rc<dyn Fn(i32) -> bool> = method9();
                let v10: bool = method10(v9.clone(), v8.clone());
                let v11: bool = v10 == false;
                if v11 {
                    v0 = v2.clone();
                    continue;
                } else {
                    return v0.clone();
                }
            }
            _ => {
                return v0.clone();
            }
        }
    }
}
fn method11(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method11(v4.clone(), v1.clone(), v2.clone());
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v3, v6)), v5));
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
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
fn numbered_4(mut v0: Rc<str>, mut v1: i32, mut v2: i32, mut v3: Rc<UH0>, mut v4: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v3 {
            UH0::UH0_Cons(v7, v8) => {
                let v7: Rc<str> = v7.clone();
                let v8: Rc<UH0> = v8.clone();
                let v9: i32 = v2.wrapping_add(1i32);
                let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
                let v11: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v10));
                let v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, Rc::<str>::from(format!("{:?}", v2))));
                let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
                let v15: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v14));
                let v17: Rc<str> = Rc::<str>::from(format!("{}{}", v15, Rc::<str>::from(format!("{:?}", v1))));
                let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                let v20: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v17, v18)), v7));
                let v21: Rc<Vec<Rc<str>>> = Rc::new(unicode_segmentation::UnicodeSegmentation::graphemes(&*v20, true).map(Rc::<str>::from).collect());
                let v22: Rc<Vec<Rc<str>>> = Rc::new({ let mut v = (v21).as_ref().clone(); v.reverse(); v });
                let v23: i32 = (v22).len() as i32;
                let v24: i32 = 0i32;
                let v25: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let v26: Rc<UH0> = method5(v22.clone(), v23, v24, v25.clone());
                let v27: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let v28: Rc<UH0> = method6(v26.clone(), v27.clone());
                let v29: Rc<UH0> = without_blank_tail_7(v28.clone());
                let v30: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let v31: Rc<UH0> = method6(v29.clone(), v30.clone());
                let v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let (mut v33, mut v34): (Rc<str>, Rc<str>) = method11(v31.clone(), v32.clone(), v32.clone());
                let v35: Rc<UH0> = Rc::new(UH0::UH0_Cons(v33.clone(), v4.clone()));
                (v0, v1, v2, v3, v4) = (v0.clone(), v1, v9, v8.clone(), v35.clone());
                continue;
            }
            UH0::UH0_Nil => {
                let mut v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                return method6(v4.clone(), v5.clone());
            }
        }
    }
}
fn method12(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
                let v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3.clone(), v4);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn cell_posts_by_3(mut v0: Rc<dyn Fn(i32) -> Rc<dyn Fn(Rc<str>) -> Rc<UH0>>>, mut v1: i32, mut v2: Rc<str>) -> Rc<UH0> {
    let mut v3: Rc<dyn Fn(Rc<str>) -> Rc<UH0>> = v0(v1);
    let v4: Rc<UH0> = v3(v2.clone());
    let v8: Rc<UH0> = match &*v4 {
        UH0::UH0_Nil => {
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            Rc::new(UH0::UH0_Cons(v5.clone(), v6.clone()))
        }
        _ => {
            v4.clone()
        }
    };
    let v9: Rc<str> = Rc::<str>::from(format!("{:?}", v1));
    let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("c"); } LIT.with(|lit| lit.clone()) };
    let v11: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v9));
    let v12: i32 = 0i32;
    let v13: i32 = method12(v8.clone(), v12);
    let v14: i32 = 1i32;
    let v15: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    numbered_4(v11.clone(), v13, v14, v8.clone(), v15.clone())
}
fn method13(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<UH0> = v2.clone();
                let mut v3: Rc<UH1> = v3.clone();
                let v4: Rc<UH1> = Rc::new(UH1::UH1_Cons(v2.clone(), v1.clone()));
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH1::UH1_Nil => {
                return v1.clone();
            }
        }
    }
}
fn method15(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let v4: Rc<UH0> = method15(v3, v1.clone());
            Rc::new(UH0::UH0_Cons(v2, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method14(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<UH0> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let v4: Rc<UH0> = method14(v3, v1.clone());
            method15(v2, v4)
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn thread_by_2(mut v0: Rc<dyn Fn(i32) -> Rc<dyn Fn(Rc<str>) -> Rc<UH0>>>, mut v1: i32, mut v2: Rc<UH0>, mut v3: Rc<UH1>) -> Rc<UH0> {
    loop {
        match &*v2 {
            UH0::UH0_Cons(v8, v9) => {
                let v8: Rc<str> = v8.clone();
                let v9: Rc<UH0> = v9.clone();
                let v10: i32 = v1.wrapping_add(1i32);
                let v11: Rc<UH0> = cell_posts_by_3(v0.clone(), v1, v8.clone());
                let v12: Rc<UH1> = Rc::new(UH1::UH1_Cons(v11.clone(), v3.clone()));
                (v0, v1, v2, v3) = (v0.clone(), v10, v9.clone(), v12.clone());
                continue;
            }
            UH0::UH0_Nil => {
                let v4: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                let mut v5: Rc<UH1> = method13(v3.clone(), v4.clone());
                let v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                return method14(v5.clone(), v6.clone());
            }
        }
    }
}
fn method16(mut v0: Rc<dyn Fn(Rc<str>) -> i32>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> Rc<UH0> {
    match &*v1 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH0> = method16(v0.clone(), v4, v2.clone());
            let v6: i32 = v0(v3.clone());
            let v7: Rc<str> = Rc::<str>::from(serde_json::json!({"text": &*v3, "weight": v6}).to_string());
            Rc::new(UH0::UH0_Cons(v7, v5))
        }
        UH0::UH0_Nil => {
            v2
        }
    }
}
fn method17(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method17(v4.clone(), v1.clone(), v2.clone());
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v3, v6)), v5));
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
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
fn framed_by_1(mut v0: Rc<dyn Fn(i32) -> Rc<dyn Fn(Rc<str>) -> Rc<UH0>>>, mut v1: Rc<dyn Fn(Rc<str>) -> i32>, mut v2: Rc<UH0>) -> Rc<str> {
    let mut v3: i32 = 1i32;
    let v4: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v5: Rc<UH0> = thread_by_2(v0.clone(), v3, v2.clone(), v4.clone());
    let v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v7: Rc<UH0> = method16(v1.clone(), v5.clone(), v6.clone());
    let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v9, mut v10): (Rc<str>, Rc<str>) = method17(v7.clone(), v8.clone(), v8.clone());
    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
    let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v9));
    let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
    let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v13));
    v14.clone()
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>| -> Rc<str> {
        let v2: Rc<dyn Fn(i32) -> Rc<dyn Fn(Rc<str>) -> Rc<UH0>>> = closure1(v0.clone());
        let mut v3: Rc<dyn Fn(Rc<str>) -> i32> = closure3(v0.clone());
        let v4: Rc<str> = xc_cells::xc_file_cells(&*v1);
        let mut v5: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v4).unwrap_or_default();
        let v6: usize = v5.as_array().map_or(0, Vec::len);
        let v7: i32 = ((v6) as i32);
        let v8: i32 = v7.wrapping_sub(1i32);
        let v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v10: Rc<UH0> = from_0(v5.clone(), v8, v9.clone());
        framed_by_1(v2.clone(), v3.clone(), v10.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_frames(v0: &str, v1: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1))
}
