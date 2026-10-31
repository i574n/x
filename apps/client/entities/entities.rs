#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
fn method2(mut v0: Rc<Vec<Rc<str>>>, mut v1: i32, mut v2: i32, mut v3: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v4: bool = v2 >= v1;
        if v4 {
            return v3.clone();
        } else {
            let v5: usize = ((v2) as usize);
            let mut v6: Rc<str> = (v0)[v5].clone();
            let mut v7: i32 = v2.wrapping_add(1i32);
            let mut v8: Rc<UH0> = Rc::new(UH0::UH0_Cons(v6.clone(), v3.clone()));
            (v0, v1, v2, v3) = (v0.clone(), v1, v7, v8.clone());
            continue;
        }
    }
}
fn method9(mut v0: Option<char>) -> Option<char> {
    v0
}
fn closure1() -> Rc<dyn Fn((char)) -> u32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((char)) -> u32> = Rc::new(move |mut v0: (char)| -> u32 {
        let v1: char = (v0);
        let v2: u32 = u32::from(v1);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method10(mut v0: Option<u32>) -> Option<u32> {
    v0
}
fn closure2() -> Rc<dyn Fn((u32)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((u32)) -> i32> = Rc::new(move |mut v0: (u32)| -> i32 {
        let v1: u32 = (v0);
        let v2: i32 = (v1 as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn ascii_of_8(mut v0: Rc<str>) -> i32 {
    let v1: bool = &*v0 == "";
    if v1 {
        0i32
    } else {
        let v2: i32 = (v0.clone().len() as i32);
        let v3: bool = v2 == 1i32;
        if v3 {
            let v4: Option<char> = (&*v0).chars().next();
            let v5: Option<char> = method9(v4.clone());
            let mut v6: Rc<dyn Fn((char)) -> u32> = closure1();
            let mut v7: Option<u32> = v5.map(|x| v6(x));
            let mut v8: Option<u32> = method10(v7.clone());
            let mut v9: Rc<dyn Fn((u32)) -> i32> = closure2();
            let mut v10: Option<i32> = v8.map(|x| v9(x));
            let v12: i32 = 0i32.clone();
            let v13: i32 = v10.unwrap_or(v12);
            v13
        } else {
            256i32
        }
    }
}
fn ascii_letter_7(mut v0: Rc<str>) -> bool {
    let v1: i32 = ascii_of_8(v0);
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
fn letters_length_6(mut v0: Rc<UH0>, mut v1: i32) -> (i32, Rc<UH0>) {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let v4: bool = ascii_letter_7(v2.clone());
                if v4 {
                    let v5: i32 = v1.wrapping_add(1i32);
                    (v0, v1) = (v3.clone(), v5);
                    continue;
                } else {
                    return (v1, v0.clone());
                }
            }
            _ => {
                return (v1, v0.clone());
            }
        }
    }
}
fn label_glyph_13(mut v0: Rc<str>) -> bool {
    let v1: bool = ascii_letter_7(v0.clone());
    let mut v6: bool = if v1 {
        true
    } else {
        let v2: i32 = ascii_of_8(v0.clone());
        let v3: bool = v2 >= 48i32;
        if v3 {
            let v4: bool = v2 <= 57i32;
            v4
        } else {
            false
        }
    };
    let mut v8: bool = if v6 {
        true
    } else {
        let mut v7: bool = &*v0 == "_";
        v7
    };
    if v8 {
        true
    } else {
        let mut v9: bool = &*v0 == "-";
        v9
    }
}
fn word_glyph_12(mut v0: Rc<str>) -> bool {
    let v1: bool = label_glyph_13(v0.clone());
    if v1 {
        let v2: bool = &*v0 != "-";
        v2
    } else {
        false
    }
}
fn wide_letter_14(mut v0: Rc<str>) -> bool {
    let v1: bool = ascii_letter_7(v0.clone());
    if v1 {
        true
    } else {
        let v2: i32 = ascii_of_8(v0);
        let v3: bool = v2 > 127i32;
        v3
    }
}
fn cash_quiet_11(mut v0: Rc<str>) -> bool {
    let v1: bool = word_glyph_12(v0.clone());
    let v3: bool = if v1 {
        true
    } else {
        wide_letter_14(v0.clone())
    };
    let v5: bool = if v3 {
        true
    } else {
        let v4: bool = &*v0 == "$";
        v4
    };
    let mut v6: bool = v5 == false;
    v6
}
fn closure3() -> Rc<dyn Fn(Rc<str>) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> bool> = Rc::new(move |mut v0: Rc<str>| -> bool {
        let v1: bool = word_glyph_12(v0.clone());
        if v1 {
            true
        } else {
            wide_letter_14(v0.clone())
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn suffix_ok_15(mut v0: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v1, v2) => {
            let v1: Rc<str> = v1.clone();
            let v2: Rc<UH0> = v2.clone();
            let v3: bool = &*v1 == ".";
            let v5: bool = if v3 {
                true
            } else {
                let v4: bool = &*v1 == "_";
                v4
            };
            if v5 {
                let mut v6: i32 = 0i32;
                let (mut v7, mut v8): (i32, Rc<UH0>) = letters_length_6(v2, v6);
                let mut v9: bool = v7 >= 1i32;
                let v11: bool = if v9 {
                    let mut v10: bool = v7 <= 2i32;
                    v10
                } else {
                    false
                };
                if v11 {
                    v8
                } else {
                    v0.clone()
                }
            } else {
                v0.clone()
            }
        }
        _ => {
            v0
        }
    }
}
fn first_is_16(mut v0: Rc<dyn Fn(Rc<str>) -> bool>, mut v1: Rc<UH0>) -> bool {
    match &*v1 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            v0(v2)
        }
        UH0::UH0_Nil => {
            false
        }
    }
}
fn cashtag_after_5(mut v0: Rc<str>, mut v1: Rc<UH0>) -> bool {
    let v2: i32 = 0i32;
    let (mut v3, mut v4): (i32, Rc<UH0>) = letters_length_6(v1, v2);
    let v5: bool = cash_quiet_11(v0);
    let mut v7: bool = if v5 {
        let mut v6: bool = v3 >= 1i32;
        v6
    } else {
        false
    };
    let mut v9: bool = if v7 {
        let mut v8: bool = v3 <= 6i32;
        v8
    } else {
        false
    };
    if v9 {
        let mut v10: Rc<dyn Fn(Rc<str>) -> bool> = closure3();
        let v11: Rc<UH0> = suffix_ok_15(v4);
        let v12: bool = first_is_16(v10, v11);
        let v13: bool = v12 == false;
        v13
    } else {
        false
    }
}
fn word_length_18(mut v0: Rc<UH0>, mut v1: i32) -> (i32, Rc<UH0>) {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let v4: bool = word_glyph_12(v2.clone());
                if v4 {
                    let v5: i32 = v1.wrapping_add(1i32);
                    (v0, v1) = (v3.clone(), v5);
                    continue;
                } else {
                    return (v1, v0.clone());
                }
            }
            _ => {
                return (v1, v0.clone());
            }
        }
    }
}
fn method20(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure4() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn mention_quiet_19(mut v0: Rc<str>) -> bool {
    let v1: bool = word_glyph_12(v0.clone());
    let v13: bool = if v1 {
        true
    } else {
        let v2: i32 = (v0.clone().len() as i32);
        let v3: bool = v2 == 1i32;
        if v3 {
            let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("!#$%&*@"); } LIT.with(|lit| lit.clone()) };
            let v5: Option<usize> = v4.find(&*v0);
            let mut v6: Option<usize> = method20(v5.clone());
            let mut v7: Rc<dyn Fn((usize)) -> i32> = closure4();
            let mut v8: Option<i32> = v6.map(|x| v7(x));
            let mut v10: i32 = v8.unwrap_or(-1i32);
            let v11: bool = v10 >= 0i32;
            v11
        } else {
            false
        }
    };
    let v15: bool = if v13 {
        true
    } else {
        let v14: bool = &*v0 == "＠";
        v14
    };
    let v16: bool = v15 == false;
    v16
}
fn closure5() -> Rc<dyn Fn(Rc<str>) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> bool> = Rc::new(move |mut v0: Rc<str>| -> bool {
        let v1: bool = label_glyph_13(v0.clone());
        if v1 {
            true
        } else {
            let v2: i32 = (v0.clone().len() as i32);
            let v3: bool = v2 == 1i32;
            if v3 {
                let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("+~."); } LIT.with(|lit| lit.clone()) };
                let v5: Option<usize> = v4.find(&*v0);
                let mut v6: Option<usize> = method20(v5.clone());
                let mut v7: Rc<dyn Fn((usize)) -> i32> = closure4();
                let mut v8: Option<i32> = v6.map(|x| v7(x));
                let mut v10: i32 = v8.unwrap_or(-1i32);
                let v11: bool = v10 >= 0i32;
                v11
            } else {
                false
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn rt_boundary_22(mut v0: Rc<UH0>) -> bool {
    let v1: Rc<dyn Fn(Rc<str>) -> bool> = closure5();
    let v2: bool = first_is_16(v1, v0);
    let v3: bool = v2 == false;
    v3
}
fn rt_letters_23(mut v0: Rc<str>, mut v1: Rc<str>) -> bool {
    let v2: i32 = (v0.clone().len() as i32);
    let v3: bool = v2 == 1i32;
    let v12: bool = if v3 {
        let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("tT"); } LIT.with(|lit| lit.clone()) };
        let v5: Option<usize> = v4.find(&*v0);
        let mut v6: Option<usize> = method20(v5.clone());
        let mut v7: Rc<dyn Fn((usize)) -> i32> = closure4();
        let mut v8: Option<i32> = v6.map(|x| v7(x));
        let mut v10: i32 = v8.unwrap_or(-1i32);
        let v11: bool = v10 >= 0i32;
        v11
    } else {
        false
    };
    if v12 {
        let v13: i32 = (v1.clone().len() as i32);
        let v14: bool = v13 == 1i32;
        if v14 {
            let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("rR"); } LIT.with(|lit| lit.clone()) };
            let v16: Option<usize> = v15.find(&*v1);
            let v17: Option<usize> = method20(v16.clone());
            let mut v18: Rc<dyn Fn((usize)) -> i32> = closure4();
            let mut v19: Option<i32> = v17.map(|x| v18(x));
            let v21: i32 = v19.unwrap_or(-1i32);
            let v22: bool = v21 >= 0i32;
            v22
        } else {
            false
        }
    } else {
        false
    }
}
fn rt_before_21(mut v0: Rc<UH0>) -> bool {
    match &*v0 {
        UH0::UH0_Cons(v1, v2) => {
            let v1: Rc<str> = v1.clone();
            let v2: Rc<UH0> = v2.clone();
            match &*v2 {
                UH0::UH0_Cons(v3, v4) => {
                    let v3: Rc<str> = v3.clone();
                    let v4: Rc<UH0> = v4.clone();
                    match &*v4 {
                        UH0::UH0_Cons(v5, v6) => {
                            let v5: Rc<str> = v5.clone();
                            let mut v6: Rc<UH0> = v6.clone();
                            let mut v7: bool = &*v1 == ":";
                            let mut v9: bool = if v7 {
                                rt_letters_23(v3.clone(), v5)
                            } else {
                                false
                            };
                            if v9 {
                                rt_boundary_22(v6)
                            } else {
                                let v11: bool = rt_letters_23(v1.clone(), v3.clone());
                                if v11 {
                                    rt_boundary_22(v4.clone())
                                } else {
                                    false
                                }
                            }
                        }
                        _ => {
                            let v15: bool = rt_letters_23(v1, v3);
                            if v15 {
                                rt_boundary_22(v4)
                            } else {
                                false
                            }
                        }
                    }
                }
                _ => {
                    false
                }
            }
        }
        _ => {
            false
        }
    }
}
fn closure6() -> Rc<dyn Fn(Rc<str>) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> bool> = Rc::new(move |mut v0: Rc<str>| -> bool {
        let v1: bool = word_glyph_12(v0.clone());
        if v1 {
            true
        } else {
            let v2: bool = &*v0 == "@";
            v2
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn mention_after_17(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> bool {
    let v3: i32 = 0i32;
    let (mut v4, mut v5): (i32, Rc<UH0>) = word_length_18(v2, v3);
    let mut v6: bool = mention_quiet_19(v0);
    let mut v8: bool = if v6 {
        true
    } else {
        rt_before_21(v1)
    };
    let mut v10: bool = if v8 {
        let mut v9: bool = v4 >= 1i32;
        v9
    } else {
        false
    };
    let v12: bool = if v10 {
        let v11: bool = v4 <= 15i32;
        v11
    } else {
        false
    };
    if v12 {
        let v13: Rc<dyn Fn(Rc<str>) -> bool> = closure6();
        let v14: bool = first_is_16(v13, v5);
        let v15: bool = v14 == false;
        v15
    } else {
        false
    }
}
fn tag_has_letter_25(mut v0: Rc<UH0>) -> bool {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v1, v2) => {
                let v1: Rc<str> = v1.clone();
                let v2: Rc<UH0> = v2.clone();
                let v3: bool = word_glyph_12(v1.clone());
                let v5: bool = if v3 {
                    true
                } else {
                    wide_letter_14(v1.clone())
                };
                if v5 {
                    let mut v6: bool = wide_letter_14(v1.clone());
                    if v6 {
                        return true;
                    } else {
                        v0 = v2.clone();
                        continue;
                    }
                } else {
                    return false;
                }
            }
            _ => {
                return false;
            }
        }
    }
}
fn hashtag_after_24(mut v0: Rc<str>, mut v1: Rc<UH0>) -> bool {
    let v2: bool = word_glyph_12(v0.clone());
    let v4: bool = if v2 {
        true
    } else {
        let v3: bool = &*v0 == "&";
        v3
    };
    let mut v6: bool = if v4 {
        true
    } else {
        let v5: bool = &*v0 == "#";
        v5
    };
    let mut v7: bool = v6 == false;
    if v7 {
        tag_has_letter_25(v1)
    } else {
        false
    }
}
fn tags_4(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<str>, mut v3: Rc<UH0>) -> bool {
    let v4: bool = &*v2 == "@";
    let mut v6: bool = if v4 {
        mention_after_17(v0.clone(), v1, v3.clone())
    } else {
        false
    };
    let mut v10: bool = if v6 {
        true
    } else {
        let mut v7: bool = &*v2 == "#";
        if v7 {
            hashtag_after_24(v0.clone(), v3.clone())
        } else {
            false
        }
    };
    if v10 {
        true
    } else {
        let v11: bool = &*v2 == "$";
        if v11 {
            cashtag_after_5(v0, v3)
        } else {
            false
        }
    }
}
fn method26(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
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
fn entities_from_3(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3.clone();
                let v4: Rc<UH0> = v4.clone();
                let v5: bool = tags_4(v0.clone(), v2.clone(), v3.clone(), v4.clone());
                if v5 {
                    let mut v6: Option<char> = char::from_u32(8203u32);
                    let mut v8: char = v6.unwrap();
                    let mut v9: Rc<str> = Rc::<str>::from(format!("{}", v8));
                    let mut v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v3.clone(), v2.clone()));
                    let v11: Rc<UH0> = Rc::new(UH0::UH0_Cons(v9.clone(), v10.clone()));
                    (v0, v1, v2) = (v3.clone(), v4.clone(), v11.clone());
                    continue;
                } else {
                    let v13: Rc<UH0> = Rc::new(UH0::UH0_Cons(v3.clone(), v2.clone()));
                    (v0, v1, v2) = (v3.clone(), v4.clone(), v13.clone());
                    continue;
                }
            }
            UH0::UH0_Nil => {
                let v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                return method26(v2.clone(), v16.clone());
            }
        }
    }
}
fn method27(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
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
fn defused_entities_1(mut v0: Rc<str>) -> Rc<str> {
    let v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v2: Rc<Vec<Rc<str>>> = Rc::new(unicode_segmentation::UnicodeSegmentation::graphemes(&*v0, true).map(Rc::<str>::from).collect());
    let v3: Rc<Vec<Rc<str>>> = Rc::new((v2).as_ref().iter().rev().cloned().collect::<Vec<_>>());
    let v4: usize = (v3).len();
    let v5: i32 = ((v4) as i32);
    let mut v6: i32 = 0i32;
    let mut v7: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v8: Rc<UH0> = method2(v3.clone(), v5, v6, v7.clone());
    let mut v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v10: Rc<UH0> = entities_from_3(v1.clone(), v8.clone(), v9.clone());
    let v11: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v12: i32 = 0i32;
    let v13: i32 = method27(v11.clone(), v10.clone(), v12);
    let v14: Rc<Vec<Rc<str>>> = Rc::new(v11.borrow().clone());
    let v15: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v14).as_ref().clone()));
    let v16: Rc<str> = Rc::<str>::from((*v15.borrow()).join(&*v1));
    v16.clone()
}
fn tags_defused_0(mut v0: Rc<str>) -> Rc<str> {
    defused_entities_1(v0)
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        tags_defused_0(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_defused_entities(v0: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0))
}
