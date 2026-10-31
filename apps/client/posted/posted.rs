#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum US0 {
    US0_OnX,
    US0_OnMastodon,
    US0_OnBluesky(Rc<str>, Rc<str>),
}
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<UH0>, Rc<UH1>),
}
fn closure1() -> Rc<dyn Fn(Rc<str>) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> bool> = Rc::new(move |mut v0: Rc<str>| -> bool {
        let v1: bool = xc_domains::xc_is_tld(&*v0);
        v1
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method2(mut v0: Rc<Vec<Rc<str>>>, mut v1: i32, mut v2: i32, mut v3: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v4: bool = v2 >= v1;
        if v4 {
            return v3.clone();
        } else {
            let v5: usize = ((v2) as usize);
            let mut v6: Rc<str> = (v0)[v5].clone();
            let v7: i32 = v2.wrapping_add(1i32);
            let v8: Rc<UH0> = Rc::new(UH0::UH0_Cons(v6.clone(), v3.clone()));
            (v0, v1, v2, v3) = (v0.clone(), v1, v7, v8.clone());
            continue;
        }
    }
}
fn method8(mut v0: Option<char>) -> Option<char> {
    v0
}
fn closure2() -> Rc<dyn Fn((char)) -> u32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((char)) -> u32> = Rc::new(move |mut v0: (char)| -> u32 {
        let v1: char = (v0);
        let v2: u32 = u32::from(v1);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method9(mut v0: Option<u32>) -> Option<u32> {
    v0
}
fn closure3() -> Rc<dyn Fn((u32)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((u32)) -> i32> = Rc::new(move |mut v0: (u32)| -> i32 {
        let v1: u32 = (v0);
        let v2: i32 = (v1 as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn ascii_of_7(mut v0: Rc<str>) -> i32 {
    let v1: bool = &*v0 == "";
    if v1 {
        0i32
    } else {
        let v2: i32 = (v0.clone().len() as i32);
        let v3: bool = v2 == 1i32;
        if v3 {
            let v4: Option<char> = (&*v0).chars().next();
            let v5: Option<char> = method8(v4.clone());
            let mut v6: Rc<dyn Fn((char)) -> u32> = closure2();
            let v7: Option<u32> = v5.map(|x| v6(x));
            let v8: Option<u32> = method9(v7.clone());
            let mut v9: Rc<dyn Fn((u32)) -> i32> = closure3();
            let mut v10: Option<i32> = v8.map(|x| v9(x));
            let v12: i32 = 0i32.clone();
            let v13: i32 = v10.unwrap_or(v12);
            v13
        } else {
            256i32
        }
    }
}
fn ascii_letter_6(mut v0: Rc<str>) -> bool {
    let v1: i32 = ascii_of_7(v0);
    let v2: bool = v1 >= 65i32;
    let v4: bool = if v2 {
        let v3: bool = v1 <= 90i32;
        v3
    } else {
        false
    };
    if v4 {
        true
    } else {
        let v5: bool = v1 >= 97i32;
        if v5 {
            let mut v6: bool = v1 <= 122i32;
            v6
        } else {
            false
        }
    }
}
fn label_glyph_5(mut v0: Rc<str>) -> bool {
    let v1: bool = ascii_letter_6(v0.clone());
    let mut v6: bool = if v1 {
        true
    } else {
        let v2: i32 = ascii_of_7(v0.clone());
        let v3: bool = v2 >= 48i32;
        if v3 {
            let v4: bool = v2 <= 57i32;
            v4
        } else {
            false
        }
    };
    let v8: bool = if v6 {
        true
    } else {
        let v7: bool = &*v0 == "_";
        v7
    };
    if v8 {
        true
    } else {
        let mut v9: bool = &*v0 == "-";
        v9
    }
}
fn run_glyph_4(mut v0: Rc<str>) -> bool {
    let v1: bool = label_glyph_5(v0.clone());
    if v1 {
        true
    } else {
        let v2: bool = &*v0 == ".";
        v2
    }
}
fn method12(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
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
fn run_of_11(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>) {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let v4: bool = run_glyph_4(v2.clone());
                if v4 {
                    let v5: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2.clone(), v1.clone()));
                    (v0, v1) = (v3.clone(), v5.clone());
                    continue;
                } else {
                    let v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let mut v9: Rc<UH0> = method12(v1.clone(), v8.clone());
                    return (v9.clone(), v0.clone());
                }
            }
            _ => {
                let v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let v13: Rc<UH0> = method12(v1.clone(), v12.clone());
                return (v13.clone(), v0.clone());
            }
        }
    }
}
fn method14(mut v0: Rc<UH0>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                (v0, v1) = (v3.clone(), v2.clone());
                continue;
            }
            UH0::UH0_Nil => {
                return v1.clone();
            }
        }
    }
}
fn last_or_13(mut v0: Rc<str>, mut v1: Rc<UH0>) -> Rc<str> {
    method14(v1, v0)
}
fn run_piece_10(mut v0: Rc<str>, mut v1: Rc<UH0>) -> (Rc<str>, Rc<UH0>, Rc<str>, Rc<UH0>) {
    let v2: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let (mut v3, mut v4): (Rc<UH0>, Rc<UH0>) = run_of_11(v1.clone(), v2.clone());
    let v5: Rc<str> = last_or_13(v0.clone(), v3.clone());
    (v5.clone(), v4.clone(), v0.clone(), v3.clone())
}
fn method15(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v2, v3, v4) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let v4: Rc<UH1> = v4.clone();
                let v5: Rc<UH1> = Rc::new(UH1::UH1_Cons(v2.clone(), v3.clone(), v1.clone()));
                (v0, v1) = (v4.clone(), v5.clone());
                continue;
            }
            UH1::UH1_Nil => {
                return v1.clone();
            }
        }
    }
}
fn pieces_from_3(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3.clone();
                let v4: Rc<UH0> = v4.clone();
                let v5: bool = run_glyph_4(v3.clone());
                if v5 {
                    let (mut v6, mut v7, mut v8, mut v9): (Rc<str>, Rc<UH0>, Rc<str>, Rc<UH0>) = run_piece_10(v0.clone(), v1.clone());
                    let mut v10: Rc<UH1> = Rc::new(UH1::UH1_Cons(v8.clone(), v9.clone(), v2.clone()));
                    (v0, v1, v2) = (v6.clone(), v7.clone(), v10.clone());
                    continue;
                } else {
                    let v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let v13: Rc<UH0> = Rc::new(UH0::UH0_Cons(v3.clone(), v12.clone()));
                    let v14: Rc<UH1> = Rc::new(UH1::UH1_Cons(v0.clone(), v13.clone(), v2.clone()));
                    (v0, v1, v2) = (v3.clone(), v4.clone(), v14.clone());
                    continue;
                }
            }
            UH0::UH0_Nil => {
                let v17: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                return method15(v2.clone(), v17.clone());
            }
        }
    }
}
fn method17(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let v4: Rc<UH0> = method17(v3, v1.clone());
            Rc::new(UH0::UH0_Cons(v2, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method23(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3.clone();
                let v4: Rc<UH0> = v4.clone();
                v0.borrow_mut().push(v3);
                let v5: i32 = v2.wrapping_add(1i32);
                (v0, v1, v2) = (v0.clone(), v4.clone(), v5);
                continue;
            }
            UH0::UH0_Nil => {
                return v2;
            }
        }
    }
}
fn letters_after_22(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> (Rc<str>, bool) {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let v4: bool = ascii_letter_6(v2.clone());
                if v4 {
                    let v5: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2.clone(), v1.clone()));
                    (v0, v1) = (v3.clone(), v5.clone());
                    continue;
                } else {
                    let v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let mut v9: Rc<UH0> = method12(v1.clone(), v8.clone());
                    let mut v10: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                    let v11: i32 = 0i32;
                    let v12: i32 = method23(v10.clone(), v9.clone(), v11);
                    let v13: Rc<Vec<Rc<str>>> = Rc::new(v10.borrow().clone());
                    let v14: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v13).as_ref().clone()));
                    let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let v16: Rc<str> = Rc::<str>::from((*v14.borrow()).join(&*v15));
                    let v17: bool = &*v2 == ".";
                    return (v16.clone(), v17);
                }
            }
            UH0::UH0_Nil => {
                let v20: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let v21: Rc<UH0> = method12(v1.clone(), v20.clone());
                let v22: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                let v23: i32 = 0i32;
                let v24: i32 = method23(v22.clone(), v21.clone(), v23);
                let v25: Rc<Vec<Rc<str>>> = Rc::new(v22.borrow().clone());
                let v26: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v25).as_ref().clone()));
                let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let v28: Rc<str> = Rc::<str>::from((*v26.borrow()).join(&*v27));
                return (v28.clone(), true);
            }
        }
    }
}
fn label_before_24(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<str> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let v4: bool = label_glyph_5(v2.clone());
                if v4 {
                    let v5: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2.clone(), v1.clone()));
                    (v0, v1) = (v3.clone(), v5.clone());
                    continue;
                } else {
                    let v7: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                    let v8: i32 = 0i32;
                    let mut v9: i32 = method23(v7.clone(), v1.clone(), v8);
                    let mut v10: Rc<Vec<Rc<str>>> = Rc::new(v7.borrow().clone());
                    let v11: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v10).as_ref().clone()));
                    let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let v13: Rc<str> = Rc::<str>::from((*v11.borrow()).join(&*v12));
                    return v13.clone();
                }
            }
            _ => {
                let v15: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                let v16: i32 = 0i32;
                let v17: i32 = method23(v15.clone(), v1.clone(), v16);
                let v18: Rc<Vec<Rc<str>>> = Rc::new(v15.borrow().clone());
                let v19: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v18).as_ref().clone()));
                let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let v21: Rc<str> = Rc::<str>::from((*v19.borrow()).join(&*v20));
                return v21.clone();
            }
        }
    }
}
fn tld_ok_25(mut v0: Rc<dyn Fn(Rc<str>) -> bool>, mut v1: Rc<str>, mut v2: Rc<str>) -> bool {
    let v3: i32 = (v2.clone().len() as i32);
    let v4: bool = v3 >= 2i32;
    let mut v6: bool = if v4 {
        let v5: bool = v3 <= 63i32;
        v5
    } else {
        false
    };
    let v8: bool = if v6 {
        v0(v2)
    } else {
        false
    };
    if v8 {
        let mut v9: bool = v3 != 2i32;
        if v9 {
            true
        } else {
            let mut v10: i32 = (v1.len() as i32);
            let v11: bool = v10 > 2i32;
            v11
        }
    } else {
        false
    }
}
fn linked_dot_21(mut v0: Rc<dyn Fn(Rc<str>) -> bool>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> bool {
    let v3: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let (mut v4, mut v5): (Rc<str>, bool) = letters_after_22(v2.clone(), v3.clone());
    let mut v6: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v7: Rc<str> = label_before_24(v1.clone(), v6.clone());
    if v5 {
        let v8: bool = tld_ok_25(v0.clone(), v7.clone(), v4.clone());
        if v8 {
            true
        } else {
            let mut v9: bool = &*v7 == "t";
            if v9 {
                let mut v10: bool = &*v4 == "co";
                v10
            } else {
                false
            }
        }
    } else {
        false
    }
}
fn after_label_26(mut v0: Rc<UH0>) -> bool {
    match &*v0 {
        UH0::UH0_Cons(v1, v2) => {
            let v1: Rc<str> = v1.clone();
            let v2: Rc<UH0> = v2.clone();
            label_glyph_5(v1)
        }
        UH0::UH0_Nil => {
            false
        }
    }
}
fn defusable_20(mut v0: Rc<dyn Fn(Rc<str>) -> bool>, mut v1: Rc<UH0>, mut v2: Rc<str>, mut v3: Rc<UH0>) -> bool {
    let v4: bool = &*v2 == ".";
    let mut v6: bool = if v4 {
        after_label_26(v1.clone())
    } else {
        false
    };
    if v6 {
        linked_dot_21(v0, v1, v3)
    } else {
        false
    }
}
fn defused_run_19(mut v0: Rc<dyn Fn(Rc<str>) -> bool>, mut v1: Rc<UH0>, mut v2: Rc<UH0>, mut v3: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v2 {
            UH0::UH0_Cons(v4, v5) => {
                let v4: Rc<str> = v4.clone();
                let v5: Rc<UH0> = v5.clone();
                let mut v6: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v1.clone()));
                let v7: bool = defusable_20(v0.clone(), v1.clone(), v4.clone(), v5.clone());
                let v13: Rc<UH0> = if v7 {
                    let v8: Option<char> = char::from_u32(8203u32);
                    let mut v10: char = v8.unwrap();
                    let v11: Rc<str> = Rc::<str>::from(format!("{}", v10));
                    Rc::new(UH0::UH0_Cons(v11.clone(), v3.clone()))
                } else {
                    v3.clone()
                };
                let v14: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v13.clone()));
                (v0, v1, v2, v3) = (v0.clone(), v6.clone(), v5.clone(), v14.clone());
                continue;
            }
            UH0::UH0_Nil => {
                let v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                return method12(v3.clone(), v16.clone());
            }
        }
    }
}
fn blocks_domain_27(mut v0: Rc<str>) -> bool {
    let v1: bool = &*v0 == "@";
    let v3: bool = if v1 {
        true
    } else {
        let v2: bool = &*v0 == "/";
        v2
    };
    if v3 {
        true
    } else {
        let v4: i32 = ascii_of_7(v0);
        let v5: bool = v4 > 127i32;
        v5
    }
}
fn run_text_18(mut v0: Rc<dyn Fn(Rc<str>) -> bool>, mut v1: Rc<str>, mut v2: Rc<UH0>) -> Rc<UH0> {
    let v3: bool = blocks_domain_27(v1.clone());
    if v3 {
        v2.clone()
    } else {
        let v4: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v5: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        defused_run_19(v0.clone(), v4.clone(), v2.clone(), v5.clone())
    }
}
fn method16(mut v0: Rc<dyn Fn(Rc<str>) -> bool>, mut v1: Rc<UH1>, mut v2: Rc<UH0>) -> Rc<UH0> {
    match &*v1 {
        UH1::UH1_Cons(v3, v4, v5) => {
            let v3: Rc<str> = v3.clone();
            let v4: Rc<UH0> = v4.clone();
            let v5: Rc<UH1> = v5.clone();
            let mut v6: Rc<UH0> = method16(v0.clone(), v5, v2.clone());
            let v7: Rc<UH0> = run_text_18(v0, v3, v4);
            method17(v7, v6)
        }
        UH1::UH1_Nil => {
            v2
        }
    }
}
fn defused_dots_by_1(mut v0: Rc<dyn Fn(Rc<str>) -> bool>, mut v1: Rc<str>) -> Rc<str> {
    let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v3: Rc<Vec<Rc<str>>> = Rc::new(unicode_segmentation::UnicodeSegmentation::graphemes(&*v1, true).map(Rc::<str>::from).collect());
    let v4: Rc<Vec<Rc<str>>> = Rc::new((v3).as_ref().iter().rev().cloned().collect::<Vec<_>>());
    let v5: usize = (v4).len();
    let mut v6: i32 = ((v5) as i32);
    let v7: i32 = 0i32;
    let v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v9: Rc<UH0> = method2(v4.clone(), v6, v7, v8.clone());
    let mut v10: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v11: Rc<UH1> = pieces_from_3(v2.clone(), v9.clone(), v10.clone());
    let v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v13: Rc<UH0> = method16(v0.clone(), v11.clone(), v12.clone());
    let v14: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v15: i32 = 0i32;
    let v16: i32 = method23(v14.clone(), v13.clone(), v15);
    let v17: Rc<Vec<Rc<str>>> = Rc::new(v14.borrow().clone());
    let v18: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v17).as_ref().clone()));
    let v19: Rc<str> = Rc::<str>::from((*v18.borrow()).join(&*v2));
    v19.clone()
}
fn posted_named_0(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<str> {
    let v2: bool = &*v0 == "mastodon";
    let mut v9: US0 = if v2 {
        US0::US0_OnMastodon
    } else {
        let v4: bool = &*v0 == "bluesky";
        if v4 {
            let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            US0::US0_OnBluesky(v5.clone(), v5.clone())
        } else {
            US0::US0_OnX
        }
    };
    match &v9 {
        US0::US0_OnBluesky(v13, v14) => {
            let v13: Rc<str> = v13.clone();
            let v14: Rc<str> = v14.clone();
            v1.clone()
        }
        US0::US0_OnMastodon => {
            v1.clone()
        }
        US0::US0_OnX => {
            let mut v10: Rc<dyn Fn(Rc<str>) -> bool> = closure1();
            let v11: Rc<str> = defused_dots_by_1(v10.clone(), v1.clone());
            let v12: Rc<str> = xc_entities::xc_defused_entities(&*v11);
            v12.clone()
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>| -> Rc<str> {
        posted_named_0(v0.clone(), v1.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_posted_text(v0: &str, v1: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1))
}
