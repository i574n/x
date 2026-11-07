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
    UH1_Cons(Rc<str>, i32, Rc<UH1>),
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(i32, Rc<UH2>),
}
fn method3(mut v0: Option<char>) -> Option<char> {
    v0
}
fn closure1() -> Rc<dyn Fn((char)) -> u32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((char)) -> u32> = Rc::new(move |mut v0: (char)| -> u32 {
        let v1: char = (v0);
        let v2: u32 = u32::from(v1);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method4(mut v0: Option<u32>) -> Option<u32> {
    v0
}
fn closure2() -> Rc<dyn Fn((u32)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((u32)) -> i32> = Rc::new(move |mut v0: (u32)| -> i32 {
        let v1: u32 = (v0);
        let v2: i32 = (v1 as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method5(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure3() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method6(mut v0: Rc<Vec<char>>, mut v1: i32, mut v2: i32, mut v3: Rc<UH2>) -> Rc<UH2> {
    loop {
        let v4: bool = v2 >= v1;
        if v4 {
            return v3;
        } else {
            let v5: usize = ((v2) as usize);
            let v6: char = (v0)[v5].clone();
            let v7: i32 = v2.wrapping_add(1i32);
            let mut v8: u32 = u32::from(v6);
            let v9: i32 = (v8 as i32);
            let v10: Rc<UH2> = Rc::new(UH2::UH2_Cons(v9, v3));
            (v2, v3) = (v7, v10);
            continue;
        }
    }
}
fn method7(mut v0: Rc<UH2>, mut v1: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH2::UH2_Cons(v2, v3) => {
                let v2: i32 = v2;
                let v3: Rc<UH2> = v3;
                let v4: bool = v2 <= 4351i32;
                let mut v8: bool = if v4 {
                    true
                } else {
                    let v5: bool = v2 >= 8192i32;
                    if v5 {
                        let v6: bool = v2 <= 8205i32;
                        v6
                    } else {
                        false
                    }
                };
                let mut v12: bool = if v8 {
                    true
                } else {
                    let v9: bool = v2 >= 8208i32;
                    if v9 {
                        let v10: bool = v2 <= 8223i32;
                        v10
                    } else {
                        false
                    }
                };
                let v16: bool = if v12 {
                    true
                } else {
                    let v13: bool = v2 >= 8242i32;
                    if v13 {
                        let v14: bool = v2 <= 8247i32;
                        v14
                    } else {
                        false
                    }
                };
                let v17: i32 = if v16 {
                    1i32
                } else {
                    2i32
                };
                let v18: i32 = v1.wrapping_add(v17);
                (v0, v1) = (v3, v18);
                continue;
            }
            UH2::UH2_Nil => {
                return v1;
            }
        }
    }
}
fn method2(mut v0: US0, mut v1: Rc<UH0>, mut v2: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v1) {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3;
            let v4: Rc<UH0> = v4;
            let v5: Rc<UH1> = method2(v0.clone(), v4, v2);
            let (mut v90, mut v91): (Rc<str>, i32) = match &v0 {
                US0::US0_OnX => {
                    let v6: Option<char> = (&*v3).chars().next();
                    let v7: Option<char> = method3(v6);
                    let mut v8: Rc<dyn Fn((char)) -> u32> = closure1();
                    let v9: Option<u32> = v7.map(|x| v8(x));
                    let v10: Option<u32> = method4(v9);
                    let mut v11: Rc<dyn Fn((u32)) -> i32> = closure2();
                    let mut v12: Option<i32> = v10.map(|x| v11(x));
                    let v14: i32 = 0i32.clone();
                    let v15: i32 = v12.unwrap_or(v14);
                    let v16: usize = (&*v3).chars().count();
                    let v17: i32 = ((v16) as i32);
                    let v18: bool = v17 > 1i32;
                    let v68: bool = if v18 {
                        let v19: bool = v15 >= 126976i32;
                        let v47: bool = if v19 {
                            true
                        } else {
                            let v20: Option<char> = char::from_u32(65039u32);
                            let v22: char = v20.unwrap();
                            let v23: Rc<str> = Rc::<str>::from(format!("{}", v22));
                            let v24: Option<usize> = v3.find(&*v23);
                            let v25: Option<usize> = method5(v24);
                            let mut v26: Rc<dyn Fn((usize)) -> i32> = closure3();
                            let mut v27: Option<i32> = v25.map(|x| v26(x));
                            let v29: i32 = v27.unwrap_or(-1i32);
                            let v30: bool = v29 >= 0i32;
                            if v30 {
                                let v31: bool = v15 >= 8192i32;
                                let v33: bool = if v31 {
                                    let v32: bool = v15 <= 11263i32;
                                    v32
                                } else {
                                    false
                                };
                                let v35: bool = if v33 {
                                    true
                                } else {
                                    let v34: bool = v15 == 169i32;
                                    v34
                                };
                                let v37: bool = if v35 {
                                    true
                                } else {
                                    let v36: bool = v15 == 174i32;
                                    v36
                                };
                                let v39: bool = if v37 {
                                    true
                                } else {
                                    let v38: bool = v15 == 12336i32;
                                    v38
                                };
                                let v41: bool = if v39 {
                                    true
                                } else {
                                    let v40: bool = v15 == 12349i32;
                                    v40
                                };
                                let v43: bool = if v41 {
                                    true
                                } else {
                                    let v42: bool = v15 == 12951i32;
                                    v42
                                };
                                if v43 {
                                    true
                                } else {
                                    let v44: bool = v15 == 12953i32;
                                    v44
                                }
                            } else {
                                false
                            }
                        };
                        if v47 {
                            true
                        } else {
                            let v48: Option<char> = char::from_u32(8419u32);
                            let v50: char = v48.unwrap();
                            let v51: Rc<str> = Rc::<str>::from(format!("{}", v50));
                            let v52: Option<usize> = v3.find(&*v51);
                            let v53: Option<usize> = method5(v52);
                            let mut v54: Rc<dyn Fn((usize)) -> i32> = closure3();
                            let mut v55: Option<i32> = v53.map(|x| v54(x));
                            let v57: i32 = v55.unwrap_or(-1i32);
                            let v58: bool = v57 >= 0i32;
                            if v58 {
                                let v59: bool = v15 == 35i32;
                                let v61: bool = if v59 {
                                    true
                                } else {
                                    let v60: bool = v15 == 42i32;
                                    v60
                                };
                                if v61 {
                                    true
                                } else {
                                    let v62: bool = v15 >= 48i32;
                                    if v62 {
                                        let v63: bool = v15 <= 57i32;
                                        v63
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
                    let v78: i32 = if v68 {
                        2i32
                    } else {
                        let v69: Rc<Vec<char>> = Rc::new((&*v3).chars().collect());
                        let v70: Rc<Vec<char>> = Rc::new((v69).as_ref().iter().rev().cloned().collect::<Vec<_>>());
                        let v71: usize = (v70).len();
                        let v72: i32 = ((v71) as i32);
                        let v73: i32 = 0i32;
                        let v74: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                        let v75: Rc<UH2> = method6(v70, v72, v73, v74);
                        let v76: i32 = 0i32;
                        method7(v75, v76)
                    };
                    (v3, v78)
                }
                _ => {
                    let (mut v88, mut v89): (Rc<str>, i32) = match &v0 {
                        US0::US0_OnMastodon => {
                            (v3, 1i32)
                        }
                        _ => {
                            let (mut v86, mut v87): (Rc<str>, i32) = match v0 {
                                US0::US0_OnBluesky(v79, v80) => {
                                    let v79: Rc<str> = v79;
                                    let v80: Rc<str> = v80;
                                    let v81: i32 = (v3.clone().len() as i32);
                                    let v82: i32 = v81.wrapping_add(9i32);
                                    let v83: i32 = v82.wrapping_div(10i32);
                                    let v84: bool = v83 < 1i32;
                                    let v85: i32 = if v84 {
                                        1i32
                                    } else {
                                        v83
                                    };
                                    (v3, v85)
                                }
                                _ => unreachable!(),
                            };
                            (v86, v87)
                        }
                    };
                    (v88, v89)
                }
            };
            Rc::new(UH1::UH1_Cons(v90, v91, v5))
        }
        UH0::UH0_Nil => {
            v2
        }
    }
}
fn method8(mut v0: Rc<Vec<Rc<str>>>, mut v1: i32, mut v2: i32, mut v3: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v4: bool = v2 >= v1;
        if v4 {
            return v3;
        } else {
            let v5: usize = ((v2) as usize);
            let v6: Rc<str> = (v0)[v5].clone();
            let v7: i32 = v2.wrapping_add(1i32);
            let mut v8: Rc<UH0> = Rc::new(UH0::UH0_Cons(v6, v3));
            (v2, v3) = (v7, v8);
            continue;
        }
    }
}
fn method10(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
                let v4: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2, v1));
                (v0, v1) = (v3, v4);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn glued_9(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
                match &*v3 {
                    UH0::UH0_Cons(v4, v5) => {
                        let v4: Rc<str> = v4.clone();
                        let v5: Rc<UH0> = v5.clone();
                        let v6: Option<char> = char::from_u32(8203u32);
                        let mut v8: char = v6.unwrap();
                        let v9: Rc<str> = Rc::<str>::from(format!("{}", v8));
                        let v10: bool = &*v2 == &*v9;
                        if v10 {
                            let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v4));
                            let mut v12: Rc<UH0> = Rc::new(UH0::UH0_Cons(v11, v1));
                            (v0, v1) = (v5, v12);
                            continue;
                        } else {
                            let v14: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2, v1));
                            (v0, v1) = (v3, v14);
                            continue;
                        }
                    }
                    _ => {
                        let v17: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2, v1));
                        (v0, v1) = (v3, v17);
                        continue;
                    }
                }
            }
            UH0::UH0_Nil => {
                let v20: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                return method10(v1, v20);
            }
        }
    }
}
fn units_on_1(mut v0: US0, mut v1: Rc<str>) -> Rc<UH1> {
    let v29: Rc<UH0> = match &v0 {
        US0::US0_OnBluesky(v18, v19) => {
            let v18: Rc<str> = v18.clone();
            let v19: Rc<str> = v19.clone();
            let v20: Rc<Vec<Rc<str>>> = Rc::new(unicode_segmentation::UnicodeSegmentation::graphemes(&*v1, true).map(Rc::<str>::from).collect());
            let v21: Rc<Vec<Rc<str>>> = Rc::new((v20).as_ref().iter().rev().cloned().collect::<Vec<_>>());
            let v22: usize = (v21).len();
            let v23: i32 = ((v22) as i32);
            let v24: i32 = 0i32;
            let v25: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            method8(v21, v23, v24, v25)
        }
        US0::US0_OnMastodon => {
            let mut v11: Rc<Vec<Rc<str>>> = Rc::new(unicode_segmentation::UnicodeSegmentation::graphemes(&*v1, true).map(Rc::<str>::from).collect());
            let mut v12: Rc<Vec<Rc<str>>> = Rc::new((v11).as_ref().iter().rev().cloned().collect::<Vec<_>>());
            let v13: usize = (v12).len();
            let v14: i32 = ((v13) as i32);
            let v15: i32 = 0i32;
            let v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            method8(v12, v14, v15, v16)
        }
        US0::US0_OnX => {
            let v2: Rc<Vec<Rc<str>>> = Rc::new(unicode_segmentation::UnicodeSegmentation::graphemes(&*v1, true).map(Rc::<str>::from).collect());
            let v3: Rc<Vec<Rc<str>>> = Rc::new((v2).as_ref().iter().rev().cloned().collect::<Vec<_>>());
            let v4: usize = (v3).len();
            let v5: i32 = ((v4) as i32);
            let v6: i32 = 0i32;
            let v7: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v8: Rc<UH0> = method8(v3, v5, v6, v7);
            let v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            glued_9(v8, v9)
        }
    };
    let v30: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    method2(v0, v29, v30)
}
fn method12(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH1::UH1_Cons(v2, v3, v4) => {
                let v2: Rc<str> = v2;
                let v3: i32 = v3;
                let v4: Rc<UH1> = v4;
                let v5: Rc<UH1> = Rc::new(UH1::UH1_Cons(v2, v3, v1));
                (v0, v1) = (v4, v5);
                continue;
            }
            UH1::UH1_Nil => {
                return v1;
            }
        }
    }
}
fn led_by_13(mut v0: Rc<str>, mut v1: i32, mut v2: Rc<UH1>) -> bool {
    loop {
        let v3: i32 = (v0.clone().len() as i32);
        let v4: bool = v1 >= v3;
        if v4 {
            return true;
        } else {
            match Rc::unwrap_or_clone(v2) {
                UH1::UH1_Cons(v5, v6, v7) => {
                    let v5: Rc<str> = v5;
                    let v6: i32 = v6;
                    let v7: Rc<UH1> = v7;
                    let mut v8: usize = ((v1) as usize);
                    let v9: i32 = v1.wrapping_add(1i32);
                    let v10: usize = ((v9) as usize);
                    let mut v11: Rc<str> = Rc::<str>::from(&(v0)[v8..v10]);
                    let mut v12: bool = &*v5 == &*v11;
                    if v12 {
                        (v1, v2) = (v9, v7);
                        continue;
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
}
fn closure4() -> Rc<dyn Fn(i32) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(i32) -> bool> = Rc::new(move |mut v0: i32| -> bool {
        let v1: bool = v0 >= 9i32;
        let v3: bool = if v1 {
            let v2: bool = v0 <= 13i32;
            v2
        } else {
            false
        };
        let v5: bool = if v3 {
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
            let mut v8: bool = v0 == 160i32;
            v8
        };
        let mut v11: bool = if v9 {
            true
        } else {
            let v10: bool = v0 == 5760i32;
            v10
        };
        let v15: bool = if v11 {
            true
        } else {
            let mut v12: bool = v0 >= 8192i32;
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
        let mut v26: bool = v25 == false;
        v26
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method15() -> Rc<dyn Fn(i32) -> bool> {
    closure4()
}
fn method16(mut v0: Rc<dyn Fn(i32) -> bool>, mut v1: Rc<UH2>) -> bool {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH2::UH2_Cons(v2, v3) => {
                let v2: i32 = v2;
                let v3: Rc<UH2> = v3;
                let v4: bool = v0(v2);
                if v4 {
                    return true;
                } else {
                    let v5: Rc<dyn Fn(i32) -> bool> = method15();
                    (v0, v1) = (v5, v3);
                    continue;
                }
            }
            UH2::UH2_Nil => {
                return false;
            }
        }
    }
}
fn link_length_14(mut v0: Rc<UH1>, mut v1: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH1::UH1_Cons(v2, v3, v4) => {
                let v2: Rc<str> = v2;
                let v3: i32 = v3;
                let v4: Rc<UH1> = v4;
                let v5: Rc<Vec<char>> = Rc::new((&*v2).chars().collect());
                let v6: Rc<Vec<char>> = Rc::new((v5).as_ref().iter().rev().cloned().collect::<Vec<_>>());
                let v7: usize = (v6).len();
                let mut v8: i32 = ((v7) as i32);
                let v9: i32 = 0i32;
                let v10: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                let mut v11: Rc<UH2> = method6(v6, v8, v9, v10);
                let mut v12: Rc<dyn Fn(i32) -> bool> = method15();
                let v13: bool = method16(v12, v11);
                let v14: bool = v13 == false;
                let v15: bool = v14 == false;
                if v15 {
                    let v16: i32 = v1.wrapping_add(1i32);
                    (v0, v1) = (v4, v16);
                    continue;
                } else {
                    return v1;
                }
            }
            _ => {
                return v1;
            }
        }
    }
}
fn linked_11(mut v0: Rc<UH1>, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v5, v6, v7) => {
                let v5: Rc<str> = v5.clone();
                let v6: i32 = *v6;
                let v7: Rc<UH1> = v7.clone();
                let mut v8: bool = v1 > 0i32;
                let v21: i32 = if v8 {
                    let v9: i32 = v1.wrapping_sub(1i32);
                    v9
                } else {
                    let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("http://"); } LIT.with(|lit| lit.clone()) };
                    let mut v11: i32 = 0i32;
                    let mut v12: bool = led_by_13(v10, v11, v0.clone());
                    let v16: bool = if v12 {
                        true
                    } else {
                        let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://"); } LIT.with(|lit| lit.clone()) };
                        let v14: i32 = 0i32;
                        led_by_13(v13, v14, v0.clone())
                    };
                    if v16 {
                        let v17: i32 = 0i32;
                        let v18: i32 = link_length_14(v0.clone(), v17);
                        let v19: i32 = v18.wrapping_sub(1i32);
                        v19
                    } else {
                        0i32
                    }
                };
                let (mut v31, mut v32): (Rc<str>, i32) = if v8 {
                    (v5, 0i32)
                } else {
                    let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("http://"); } LIT.with(|lit| lit.clone()) };
                    let v23: i32 = 0i32;
                    let v24: bool = led_by_13(v22, v23, v0.clone());
                    let v28: bool = if v24 {
                        true
                    } else {
                        let v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://"); } LIT.with(|lit| lit.clone()) };
                        let mut v26: i32 = 0i32;
                        led_by_13(v25, v26, v0)
                    };
                    let (mut v29, mut v30): (Rc<str>, i32) = if v28 {
                        (v5, 23i32)
                    } else {
                        (v5, v6)
                    };
                    (v29, v30)
                };
                let v33: Rc<UH1> = Rc::new(UH1::UH1_Cons(v31, v32, v2));
                (v0, v1, v2) = (v7, v21, v33);
                continue;
            }
            UH1::UH1_Nil => {
                let v3: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                return method12(v2, v3);
            }
        }
    }
}
fn method17(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2;
            let v3: i32 = v3;
            let v4: Rc<UH1> = v4;
            let v5: Rc<UH0> = method17(v4, v1);
            let v6: Rc<str> = Rc::<str>::from(serde_json::json!({"glyph": &*v2, "weight": v3}).to_string());
            Rc::new(UH0::UH0_Cons(v6, v5))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method18(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3;
                let v4: Rc<UH0> = v4;
                v0.borrow_mut().push(v3);
                let v5: i32 = v2.wrapping_add(1i32);
                (v1, v2) = (v4, v5);
                continue;
            }
            UH0::UH0_Nil => {
                return v2;
            }
        }
    }
}
fn units_json_0(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<str> {
    let v2: bool = &*v0 == "mastodon";
    let v9: US0 = if v2 {
        US0::US0_OnMastodon
    } else {
        let v4: bool = &*v0 == "bluesky";
        if v4 {
            let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            US0::US0_OnBluesky(v5.clone(), v5)
        } else {
            US0::US0_OnX
        }
    };
    let v10: Rc<str> = Rc::<str>::from(unicode_normalization::UnicodeNormalization::nfc(&*v1).collect::<String>());
    let mut v11: Rc<UH1> = units_on_1(v9.clone(), v10);
    let v22: Rc<UH1> = match v9 {
        US0::US0_OnBluesky(v18, v19) => {
            let v18: Rc<str> = v18;
            let v19: Rc<str> = v19;
            v11
        }
        US0::US0_OnMastodon => {
            let v15: i32 = 0i32;
            let v16: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            linked_11(v11, v15, v16)
        }
        US0::US0_OnX => {
            let mut v12: i32 = 0i32;
            let v13: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            linked_11(v11, v12, v13)
        }
    };
    let v23: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v24: Rc<UH0> = method17(v22, v23);
    let v25: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let mut v26: i32 = 0i32;
    let mut v27: i32 = method18(v25.clone(), v24, v26);
    let v28: Rc<Vec<Rc<str>>> = Rc::new(v25.borrow().clone());
    let v29: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v28).as_ref().clone()));
    let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let v31: Rc<str> = Rc::<str>::from((*v29.borrow()).join(&*v30));
    let v32: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) }, v31));
    let v33: Rc<str> = Rc::<str>::from(format!("{}{}", v32, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) }));
    v33
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>| -> Rc<str> {
        units_json_0(v0, v1)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method20(mut v0: Rc<UH1>, mut v1: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH1::UH1_Cons(v2, v3, v4) => {
                let v2: Rc<str> = v2;
                let v3: i32 = v3;
                let v4: Rc<UH1> = v4;
                let v5: i32 = v1.wrapping_add(v3);
                (v0, v1) = (v4, v5);
                continue;
            }
            UH1::UH1_Nil => {
                return v1;
            }
        }
    }
}
fn weight_named_19(mut v0: Rc<str>, mut v1: Rc<str>) -> i32 {
    let v2: bool = &*v0 == "mastodon";
    let v9: US0 = if v2 {
        US0::US0_OnMastodon
    } else {
        let v4: bool = &*v0 == "bluesky";
        if v4 {
            let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            US0::US0_OnBluesky(v5.clone(), v5)
        } else {
            US0::US0_OnX
        }
    };
    let v10: Rc<UH1> = units_on_1(v9.clone(), v1);
    let v21: Rc<UH1> = match v9 {
        US0::US0_OnBluesky(v17, v18) => {
            let v17: Rc<str> = v17;
            let v18: Rc<str> = v18;
            v10
        }
        US0::US0_OnMastodon => {
            let v14: i32 = 0i32;
            let v15: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            linked_11(v10, v14, v15)
        }
        US0::US0_OnX => {
            let mut v11: i32 = 0i32;
            let mut v12: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            linked_11(v10, v11, v12)
        }
    };
    let v22: i32 = 0i32;
    method20(v21, v22)
}
fn closure5() -> Rc<dyn Fn(Rc<str>, Rc<str>) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>) -> i32> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>| -> i32 {
        weight_named_19(v0, v1)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_units(v0: &str, v1: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1))
}
pub fn xc_weight(v0: &str, v1: &str) -> i32 {
    closure5()(Rc::<str>::from(v0), Rc::<str>::from(v1))
}
