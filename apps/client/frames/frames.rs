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
    UH2_Cons(Rc<str>, i32, Rc<UH2>),
}
fn from_0(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let v4: i32 = v1.wrapping_sub(1i32);
            let v5: usize = ((v1) as usize);
            let v6: serde_json::Value = v0.get(v5).cloned().unwrap_or_default();
            let v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
            let v8: Rc<UH0> = Rc::new(UH0::UH0_Cons(v7.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v8.clone());
            continue;
        }
    }
}
fn method5(mut v0: Rc<Vec<Rc<str>>>, mut v1: i32, mut v2: i32, mut v3: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v4: bool = v2 >= v1;
        if v4 {
            return v3.clone();
        } else {
            let v5: Rc<str> = (v0)[v2 as usize].clone();
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
                let mut v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
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
fn without_blank_tail_7(mut v0: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v1, v2) => {
                let v1: Rc<str> = v1.clone();
                let mut v2: Rc<UH0> = v2.clone();
                let v3: bool = (&*v1).trim().is_empty();
                if v3 {
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
fn method8(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method8(v4, v1.clone(), v2.clone());
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v3, v6)), v5));
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v8, v9)
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1, v2)
                }
                _ => unreachable!(),
            };
            (v10, v11)
        }
    };
    (v12, v13)
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
                let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v17, v18)), v7));
                let mut v21: Rc<Vec<Rc<str>>> = Rc::new(unicode_segmentation::UnicodeSegmentation::graphemes(&*v20, true).map(Rc::<str>::from).collect());
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
                let mut v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let (mut v33, mut v34): (Rc<str>, Rc<str>) = method8(v31.clone(), v32.clone(), v32.clone());
                let v35: Rc<UH0> = Rc::new(UH0::UH0_Cons(v33.clone(), v4.clone()));
                (v0, v1, v2, v3, v4) = (v0.clone(), v1, v9, v8.clone(), v35.clone());
                continue;
            }
            UH0::UH0_Nil => {
                let v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                return method6(v4.clone(), v5.clone());
            }
        }
    }
}
fn closure1() -> Rc<dyn Fn(Rc<str>, i32) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32) -> bool> = Rc::new(move |mut v0: Rc<str>, mut v1: i32| -> bool {
        let mut v2: bool = (&*v0).trim().is_empty();
        let v3: bool = v2 == false;
        v3
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method14(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    loop {
        match &*v0 {
            UH2::UH2_Cons(v2, v3, v4) => {
                let mut v2: Rc<str> = v2.clone();
                let v3: i32 = *v3;
                let v4: Rc<UH2> = v4.clone();
                let v5: Rc<UH2> = Rc::new(UH2::UH2_Cons(v2.clone(), v3, v1.clone()));
                (v0, v1) = (v4.clone(), v5.clone());
                continue;
            }
            UH2::UH2_Nil => {
                return v1.clone();
            }
        }
    }
}
fn taken_while_13(mut v0: Rc<dyn Fn(Rc<str>, i32) -> bool>, mut v1: Rc<UH2>, mut v2: Rc<UH2>) -> (Rc<UH2>, Rc<UH2>) {
    loop {
        match &*v1 {
            UH2::UH2_Cons(v3, v4, v5) => {
                let v3: Rc<str> = v3.clone();
                let v4: i32 = *v4;
                let v5: Rc<UH2> = v5.clone();
                let v6: bool = v0(v3.clone(), v4);
                if v6 {
                    let v7: Rc<UH2> = Rc::new(UH2::UH2_Cons(v3.clone(), v4, v2.clone()));
                    (v0, v1, v2) = (v0.clone(), v5.clone(), v7.clone());
                    continue;
                } else {
                    let v10: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let v11: Rc<UH2> = method14(v2.clone(), v10.clone());
                    return (v11.clone(), v1.clone());
                }
            }
            _ => {
                let v14: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                let v15: Rc<UH2> = method14(v2.clone(), v14.clone());
                return (v15.clone(), v1.clone());
            }
        }
    }
}
fn closure2() -> Rc<dyn Fn(Rc<str>, i32) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32) -> bool> = Rc::new(move |mut v0: Rc<str>, mut v1: i32| -> bool {
        let mut v2: bool = (&*v0).trim().is_empty();
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method15(mut v0: Rc<UH2>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH2::UH2_Cons(v2, v3, v4) => {
                let mut v2: Rc<str> = v2.clone();
                let v3: i32 = *v3;
                let v4: Rc<UH2> = v4.clone();
                let v5: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v4.clone(), v5);
                continue;
            }
            UH2::UH2_Nil => {
                return v1;
            }
        }
    }
}
fn method16(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let v3: i32 = *v3;
            let v4: Rc<UH2> = v4.clone();
            let v5: Rc<UH2> = method16(v4, v1.clone());
            Rc::new(UH2::UH2_Cons(v2, v3, v5))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn split_point_12(mut v0: Rc<UH2>) -> (Rc<UH2>, Rc<UH2>) {
    let v1: Rc<dyn Fn(Rc<str>, i32) -> bool> = closure1();
    let mut v2: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let (mut v3, mut v4): (Rc<UH2>, Rc<UH2>) = taken_while_13(v1, v0.clone(), v2);
    let v5: Rc<dyn Fn(Rc<str>, i32) -> bool> = closure2();
    let v6: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let (mut v7, mut v8): (Rc<UH2>, Rc<UH2>) = taken_while_13(v5.clone(), v4, v6);
    let v9: bool = match &*v8 {
        UH2::UH2_Nil => {
            false
        }
        _ => {
            true
        }
    };
    let v16: bool = if v9 {
        let v10: i32 = 0i32;
        let v11: i32 = method15(v3.clone(), v10);
        let v12: i32 = 0i32;
        let v13: i32 = method15(v7.clone(), v12);
        let v14: i32 = v11.wrapping_add(v13);
        let v15: bool = v14 <= 60i32;
        v15
    } else {
        false
    };
    if v16 {
        let v17: Rc<UH2> = method16(v3, v7);
        (v17, v8)
    } else {
        let v18: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
        let (mut v19, mut v20): (Rc<UH2>, Rc<UH2>) = taken_while_13(v5, v0.clone(), v18);
        let mut v21: bool = match &*v20 {
            UH2::UH2_Nil => {
                false
            }
            _ => {
                true
            }
        };
        if v21 {
            (v19, v20)
        } else {
            let v22: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
            (v22, v0)
        }
    }
}
fn method17(mut v0: Rc<UH2>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let v3: i32 = *v3;
            let v4: Rc<UH2> = v4.clone();
            let v5: Rc<UH0> = method17(v4, v1.clone());
            Rc::new(UH0::UH0_Cons(v2, v5))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn chunk_11(mut v0: i32, mut v1: Rc<UH2>, mut v2: Rc<UH2>, mut v3: i32, mut v4: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v1 {
            UH2::UH2_Cons(v16, v17, v18) => {
                let v16: Rc<str> = v16.clone();
                let v17: i32 = *v17;
                let v18: Rc<UH2> = v18.clone();
                let v19: i32 = v3.wrapping_add(v17);
                let mut v20: bool = v19 <= v0;
                let v23: bool = if v20 {
                    true
                } else {
                    let mut v21: bool = match &*v2 {
                        UH2::UH2_Nil => {
                            false
                        }
                        _ => {
                            true
                        }
                    };
                    let v22: bool = v21 == false;
                    v22
                };
                if v23 {
                    let v24: Rc<UH2> = Rc::new(UH2::UH2_Cons(v16.clone(), v17, v2.clone()));
                    (v0, v1, v2, v3, v4) = (v0, v18.clone(), v24.clone(), v19, v4.clone());
                    continue;
                } else {
                    let (mut v26, mut v27): (Rc<UH2>, Rc<UH2>) = split_point_12(v2.clone());
                    let v28: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let v29: Rc<UH2> = method14(v26.clone(), v28.clone());
                    let v30: Rc<UH2> = method16(v29.clone(), v1.clone());
                    let v39: Rc<UH0> = match &*v27 {
                        UH2::UH2_Nil => {
                            v4.clone()
                        }
                        _ => {
                            let v31: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                            let mut v32: Rc<UH2> = method14(v27.clone(), v31.clone());
                            let mut v33: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                            let v34: Rc<UH0> = method17(v32.clone(), v33.clone());
                            let v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                            let (mut v36, mut v37): (Rc<str>, Rc<str>) = method8(v34.clone(), v35.clone(), v35.clone());
                            Rc::new(UH0::UH0_Cons(v36.clone(), v4.clone()))
                        }
                    };
                    let v40: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let v41: i32 = 0i32;
                    (v0, v1, v2, v3, v4) = (v0, v30.clone(), v40.clone(), v41, v39.clone());
                    continue;
                }
            }
            UH2::UH2_Nil => {
                let v13: Rc<UH0> = match &*v2 {
                    UH2::UH2_Nil => {
                        v4.clone()
                    }
                    _ => {
                        let v5: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                        let v6: Rc<UH2> = method14(v2.clone(), v5.clone());
                        let v7: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                        let v8: Rc<UH0> = method17(v6.clone(), v7.clone());
                        let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                        let (mut v10, mut v11): (Rc<str>, Rc<str>) = method8(v8.clone(), v9.clone(), v9.clone());
                        Rc::new(UH0::UH0_Cons(v10.clone(), v4.clone()))
                    }
                };
                let v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                return method6(v13.clone(), v14.clone());
            }
        }
    }
}
fn method18(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
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
fn chunks_of_10(mut v0: i32, mut v1: Rc<str>, mut v2: Rc<UH2>, mut v3: i32) -> Rc<UH0> {
    loop {
        let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
        let v5: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v4));
        let v7: Rc<str> = Rc::<str>::from(format!("{}{}", v5, Rc::<str>::from(format!("{:?}", v3))));
        let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
        let v9: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v8));
        let v11: Rc<str> = Rc::<str>::from(format!("{}{}", v9, Rc::<str>::from(format!("{:?}", v3))));
        let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
        let v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v12));
        let v14: i32 = (&*v13).chars().map(|c| match c as u32 { 0..=4351 | 8192..=8205 | 8208..=8223 | 8242..=8247 => 1, _ => 2 }).sum::<i32>();
        let v15: i32 = v0.wrapping_sub(v14);
        let v16: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
        let v17: i32 = 0i32;
        let v18: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v19: Rc<UH0> = chunk_11(v15, v2.clone(), v16.clone(), v17, v18.clone());
        let mut v20: i32 = 0i32;
        let mut v21: i32 = method18(v19.clone(), v20);
        let v22: Rc<str> = Rc::<str>::from(format!("{:?}", v21));
        let v23: i32 = (v22.clone().len() as i32);
        let v24: Rc<str> = Rc::<str>::from(format!("{:?}", v3));
        let v25: i32 = (v24.clone().len() as i32);
        let v26: bool = v23 > v25;
        if v26 {
            (v0, v1, v2, v3) = (v0, v1.clone(), v2.clone(), v21);
            continue;
        } else {
            return v19.clone();
        }
    }
}
fn method21(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure3() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let v1: usize = (v0);
        let mut v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method22(mut v0: Option<char>) -> Option<char> {
    v0
}
fn closure4() -> Rc<dyn Fn((char)) -> u32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((char)) -> u32> = Rc::new(move |mut v0: (char)| -> u32 {
        let v1: char = (v0);
        let mut v2: u32 = u32::from(v1);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method23(mut v0: Option<u32>) -> Option<u32> {
    v0
}
fn closure5() -> Rc<dyn Fn((u32)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((u32)) -> i32> = Rc::new(move |mut v0: (u32)| -> i32 {
        let v1: u32 = (v0);
        let mut v2: i32 = (v1 as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn defused_20(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<UH2>) -> Rc<UH2> {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v5, v6) => {
                let v5: Rc<str> = v5.clone();
                let v6: Rc<UH0> = v6.clone();
                let v11: Rc<str> = match &*v6 {
                    UH0::UH0_Cons(v7, v8) => {
                        let v7: Rc<str> = v7.clone();
                        let v8: Rc<UH0> = v8.clone();
                        v7.clone()
                    }
                    UH0::UH0_Nil => {
                        let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                        v9.clone()
                    }
                };
                let v12: bool = &*v5 == ".";
                let v26: bool = if v12 {
                    let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"); } LIT.with(|lit| lit.clone()) };
                    let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789_-"); } LIT.with(|lit| lit.clone()) };
                    let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-"); } LIT.with(|lit| lit.clone()) };
                    let v16: i32 = (v0.clone().len() as i32);
                    let v17: bool = v16 == 1i32;
                    if v17 {
                        let v18: Option<usize> = v15.find(&*v0);
                        let v19: Option<usize> = method21(v18.clone());
                        let mut v20: Rc<dyn Fn((usize)) -> i32> = closure3();
                        let mut v21: Option<i32> = v19.map(|x| v20(x));
                        let v23: i32 = v21.unwrap_or(-1i32);
                        let v24: bool = v23 >= 0i32;
                        v24
                    } else {
                        false
                    }
                } else {
                    false
                };
                let v38: bool = if v26 {
                    let v27: i32 = (v11.clone().len() as i32);
                    let v28: bool = v27 == 1i32;
                    if v28 {
                        let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"); } LIT.with(|lit| lit.clone()) };
                        let v30: Option<usize> = v29.find(&*v11);
                        let v31: Option<usize> = method21(v30.clone());
                        let mut v32: Rc<dyn Fn((usize)) -> i32> = closure3();
                        let mut v33: Option<i32> = v31.map(|x| v32(x));
                        let v35: i32 = v33.unwrap_or(-1i32);
                        let v36: bool = v35 >= 0i32;
                        v36
                    } else {
                        false
                    }
                } else {
                    false
                };
                let (mut v116, mut v117): (Rc<str>, i32) = if v38 {
                    let v39: Option<char> = char::from_u32(8203u32);
                    let v41: char = v39.unwrap();
                    let v42: Rc<str> = Rc::<str>::from(format!("{}", v41));
                    let v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("."); } LIT.with(|lit| lit.clone()) };
                    let v44: Rc<str> = Rc::<str>::from(format!("{}{}", v42, v43));
                    let v45: Option<char> = char::from_u32(8203u32);
                    let v47: char = v45.unwrap();
                    let v49: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}", v47)), v43));
                    let v50: i32 = (&*v49).chars().map(|c| match c as u32 { 0..=4351 | 8192..=8205 | 8208..=8223 | 8242..=8247 => 1, _ => 2 }).sum::<i32>();
                    (v44.clone(), v50)
                } else {
                    let v51: Option<char> = (&*v5).chars().next();
                    let v52: Option<char> = method22(v51.clone());
                    let mut v53: Rc<dyn Fn((char)) -> u32> = closure4();
                    let v54: Option<u32> = v52.map(|x| v53(x));
                    let v55: Option<u32> = method23(v54.clone());
                    let mut v56: Rc<dyn Fn((u32)) -> i32> = closure5();
                    let mut v57: Option<i32> = v55.map(|x| v56(x));
                    let v59: i32 = 0i32.clone();
                    let v60: i32 = v57.unwrap_or(v59);
                    let v61: usize = (&*v5).chars().count();
                    let v62: i32 = ((v61) as i32);
                    let v63: bool = v62 > 1i32;
                    let v113: bool = if v63 {
                        let v64: bool = v60 >= 126976i32;
                        let v92: bool = if v64 {
                            true
                        } else {
                            let v65: Option<char> = char::from_u32(65039u32);
                            let v67: char = v65.unwrap();
                            let v68: Rc<str> = Rc::<str>::from(format!("{}", v67));
                            let v69: Option<usize> = v5.find(&*v68);
                            let v70: Option<usize> = method21(v69.clone());
                            let mut v71: Rc<dyn Fn((usize)) -> i32> = closure3();
                            let mut v72: Option<i32> = v70.map(|x| v71(x));
                            let v74: i32 = v72.unwrap_or(-1i32);
                            let v75: bool = v74 >= 0i32;
                            if v75 {
                                let v76: bool = v60 >= 8192i32;
                                let v78: bool = if v76 {
                                    let v77: bool = v60 <= 11263i32;
                                    v77
                                } else {
                                    false
                                };
                                let v80: bool = if v78 {
                                    true
                                } else {
                                    let v79: bool = v60 == 169i32;
                                    v79
                                };
                                let v82: bool = if v80 {
                                    true
                                } else {
                                    let v81: bool = v60 == 174i32;
                                    v81
                                };
                                let v84: bool = if v82 {
                                    true
                                } else {
                                    let v83: bool = v60 == 12336i32;
                                    v83
                                };
                                let v86: bool = if v84 {
                                    true
                                } else {
                                    let v85: bool = v60 == 12349i32;
                                    v85
                                };
                                let v88: bool = if v86 {
                                    true
                                } else {
                                    let v87: bool = v60 == 12951i32;
                                    v87
                                };
                                if v88 {
                                    true
                                } else {
                                    let v89: bool = v60 == 12953i32;
                                    v89
                                }
                            } else {
                                false
                            }
                        };
                        if v92 {
                            true
                        } else {
                            let v93: Option<char> = char::from_u32(8419u32);
                            let v95: char = v93.unwrap();
                            let v96: Rc<str> = Rc::<str>::from(format!("{}", v95));
                            let v97: Option<usize> = v5.find(&*v96);
                            let v98: Option<usize> = method21(v97.clone());
                            let mut v99: Rc<dyn Fn((usize)) -> i32> = closure3();
                            let mut v100: Option<i32> = v98.map(|x| v99(x));
                            let v102: i32 = v100.unwrap_or(-1i32);
                            let v103: bool = v102 >= 0i32;
                            if v103 {
                                let v104: bool = v60 == 35i32;
                                let v106: bool = if v104 {
                                    true
                                } else {
                                    let v105: bool = v60 == 42i32;
                                    v105
                                };
                                if v106 {
                                    true
                                } else {
                                    let v107: bool = v60 >= 48i32;
                                    if v107 {
                                        let v108: bool = v60 <= 57i32;
                                        v108
                                    } else {
                                        false
                                    }
                                }
                            } else {
                                false
                            }
                        }
                    } else {
                        false
                    };
                    let v115: i32 = if v113 {
                        2i32
                    } else {
                        let v114: i32 = (&*v5).chars().map(|c| match c as u32 { 0..=4351 | 8192..=8205 | 8208..=8223 | 8242..=8247 => 1, _ => 2 }).sum::<i32>();
                        v114
                    };
                    (v5.clone(), v115)
                };
                let v118: Rc<UH2> = Rc::new(UH2::UH2_Cons(v116.clone(), v117, v2.clone()));
                (v0, v1, v2) = (v5.clone(), v6.clone(), v118.clone());
                continue;
            }
            UH0::UH0_Nil => {
                let v3: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                return method14(v2.clone(), v3.clone());
            }
        }
    }
}
fn units_of_19(mut v0: Rc<str>) -> Rc<UH2> {
    let v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v2: Rc<Vec<Rc<str>>> = Rc::new(unicode_segmentation::UnicodeSegmentation::graphemes(&*v0, true).map(Rc::<str>::from).collect());
    let v3: Rc<Vec<Rc<str>>> = Rc::new({ let mut v = (v2).as_ref().clone(); v.reverse(); v });
    let v4: i32 = (v3).len() as i32;
    let v5: i32 = 0i32;
    let v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v7: Rc<UH0> = method5(v3, v4, v5, v6);
    let v8: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    defused_20(v1, v7, v8)
}
fn split_cell_9(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<str>) -> Rc<UH0> {
    let v3: Rc<str> = Rc::<str>::from(unicode_normalization::UnicodeNormalization::nfc(&*v2).collect::<String>());
    let v4: Rc<UH2> = units_of_19(v3);
    let v5: i32 = 9i32;
    chunks_of_10(v1, v0, v4, v5)
}
fn cell_posts_3(mut v0: i32, mut v1: Rc<str>) -> Rc<UH0> {
    let mut v2: Rc<str> = Rc::<str>::from(format!("{:?}", v0));
    let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("c"); } LIT.with(|lit| lit.clone()) };
    let v4: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v2));
    let v5: i32 = 280i32;
    let v6: Rc<UH0> = split_cell_9(v4, v5, v1);
    let v10: Rc<UH0> = match &*v6 {
        UH0::UH0_Nil => {
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            Rc::new(UH0::UH0_Cons(v7, v8))
        }
        _ => {
            v6
        }
    };
    let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v3, Rc::<str>::from(format!("{:?}", v0))));
    let v13: i32 = 0i32;
    let v14: i32 = method18(v10.clone(), v13);
    let v15: i32 = 1i32;
    let v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    numbered_4(v12, v14, v15, v10, v16)
}
fn method24(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v2, v3) => {
                let mut v2: Rc<UH0> = v2.clone();
                let v3: Rc<UH1> = v3.clone();
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
fn method26(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let v4: Rc<UH0> = method26(v3, v1.clone());
            Rc::new(UH0::UH0_Cons(v2, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method25(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<UH0> = v2.clone();
            let v3: Rc<UH1> = v3.clone();
            let v4: Rc<UH0> = method25(v3, v1.clone());
            method26(v2, v4)
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn thread_of_2(mut v0: i32, mut v1: Rc<UH0>, mut v2: Rc<UH1>) -> Rc<UH0> {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v7, v8) => {
                let v7: Rc<str> = v7.clone();
                let v8: Rc<UH0> = v8.clone();
                let v9: i32 = v0.wrapping_add(1i32);
                let v10: Rc<UH0> = cell_posts_3(v0, v7.clone());
                let v11: Rc<UH1> = Rc::new(UH1::UH1_Cons(v10.clone(), v2.clone()));
                (v0, v1, v2) = (v9, v8.clone(), v11.clone());
                continue;
            }
            UH0::UH0_Nil => {
                let v3: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                let v4: Rc<UH1> = method24(v2.clone(), v3.clone());
                let v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                return method25(v4.clone(), v5.clone());
            }
        }
    }
}
fn method28(mut v0: Rc<UH2>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH2::UH2_Cons(v2, v3, v4) => {
                let mut v2: Rc<str> = v2.clone();
                let v3: i32 = *v3;
                let v4: Rc<UH2> = v4.clone();
                let v5: i32 = v1.wrapping_add(v3);
                (v0, v1) = (v4.clone(), v5);
                continue;
            }
            UH2::UH2_Nil => {
                return v1;
            }
        }
    }
}
fn method27(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let v4: Rc<UH0> = method27(v3, v1.clone());
            let v5: Rc<UH2> = units_of_19(v2.clone());
            let v6: i32 = 0i32;
            let v7: i32 = method28(v5, v6);
            let v8: Rc<str> = Rc::<str>::from(serde_json::json!({"text": &*v2, "weight": v7}).to_string());
            Rc::new(UH0::UH0_Cons(v8, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method29(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method29(v4, v1.clone(), v2.clone());
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v3, v6)), v5));
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            (v8, v9)
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1, v2)
                }
                _ => unreachable!(),
            };
            (v10, v11)
        }
    };
    (v12, v13)
}
fn framed_of_cells_1(mut v0: Rc<UH0>) -> Rc<str> {
    let v1: i32 = 1i32;
    let mut v2: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v3: Rc<UH0> = thread_of_2(v1, v0, v2);
    let v4: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v5: Rc<UH0> = method27(v3, v4);
    let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v7, mut v8): (Rc<str>, Rc<str>) = method29(v5, v6.clone(), v6);
    let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
    let v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v7));
    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
    let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v11));
    v12
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        let v1: Rc<str> = xc_cells::xc_file_cells(&*v0);
        let mut v2: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v1).unwrap_or_default();
        let v3: usize = v2.as_array().map_or(0, Vec::len);
        let v4: i32 = ((v3) as i32);
        let v5: i32 = v4.wrapping_sub(1i32);
        let v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v7: Rc<UH0> = from_0(v2.clone(), v5, v6.clone());
        framed_of_cells_1(v7.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_frames(v0: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0))
}
