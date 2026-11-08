#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
fn string_concat(parts: &[&str]) -> Rc<str> {
    let mut joined = Rc::<[u8]>::new_uninit_slice(parts.iter().map(|part| part.len()).sum());
    let bytes = Rc::get_mut(&mut joined).unwrap().as_mut_ptr() as *mut u8;
    let mut at = 0;
    for part in parts {
        unsafe { std::ptr::copy_nonoverlapping(part.as_ptr(), bytes.add(at), part.len()) };
        at += part.len();
    }
    unsafe { Rc::from_raw(Rc::into_raw(joined.assume_init()) as *const str) }
}
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
#[derive(Clone)]
enum US1 {
    US1_Accounts(Rc<UH0>),
    US1_FollowingOf(Rc<str>),
}
#[derive(Clone)]
enum US2 {
    US2_AtMost(i32),
    US2_AllFollowing,
}
#[derive(Clone)]
enum US3 {
    US3_ReadThread(Rc<str>),
    US3_PostThread(Rc<str>),
    US3_PreviewThread(Rc<str>),
    US3_PreviewThreads(Rc<UH0>),
    US3_CensusThreads(Rc<UH0>),
    US3_Events(Rc<UH0>),
    US3_DeleteThread(Rc<str>),
    US3_ResumeThread(Rc<str>, Rc<str>),
}
#[derive(Clone)]
enum US0 {
    US0_ShowTimeline(US1, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool, bool),
    US0_PublishPost(Rc<str>),
    US0_RemovePost(Rc<str>),
    US0_RefreshToken(Rc<str>),
    US0_OnThread(US3),
    US0_ShowHelp,
    US0_Rejected(Rc<str>),
}
fn method2(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
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
fn delimited_3(mut v0: Rc<str>, mut v1: Rc<UH0>) -> Rc<str> {
    let mut v2: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v3: i32 = 0i32;
    let v4: i32 = method2(v2.clone(), v1, v3);
    let v5: Rc<Vec<Rc<str>>> = Rc::new(v2.borrow().clone());
    let v6: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v5).as_ref().clone()));
    let v7: Rc<str> = Rc::<str>::from((*v6.borrow()).join(&*v0));
    v7
}
fn fields_of_1(mut v0: US0) -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
    let (mut v88, mut v89, mut v90, mut v91, mut v92, mut v93, mut v94, mut v95, mut v96, mut v97, mut v98, mut v99, mut v100, mut v101, mut v102): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match &v0 {
        US0::US0_ShowTimeline(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12) => {
            let v1: US1 = v1.clone();
            let mut v2: i32 = *v2;
            let v3: i32 = *v3;
            let v4: i32 = *v4;
            let v5: US2 = v5.clone();
            let v6: Rc<str> = v6.clone();
            let v7: Rc<str> = v7.clone();
            let v8: bool = *v8;
            let v9: bool = *v9;
            let v10: i32 = *v10;
            let v11: bool = *v11;
            let v12: bool = *v12;
            let v15: i32 = match v5 {
                US2::US2_AllFollowing => {
                    -1i32
                }
                US2::US2_AtMost(v13) => {
                    let v13: i32 = v13;
                    v13
                }
            };
            let (mut v31, mut v32, mut v33, mut v34, mut v35, mut v36): (bool, Rc<str>, i32, i32, i32, i32) = match &v1 {
                US1::US1_Accounts(v16) => {
                    let v16: Rc<UH0> = v16.clone();
                    let v17: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                    let v18: i32 = 0i32;
                    let v19: i32 = method2(v17.clone(), v16, v18);
                    let v20: Rc<Vec<Rc<str>>> = Rc::new(v17.borrow().clone());
                    let v21: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v20).as_ref().clone()));
                    let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                    let v23: Rc<str> = Rc::<str>::from((*v21.borrow()).join(&*v22));
                    (false, v23, v2, v3, v4, v15)
                }
                _ => {
                    let (mut v25, mut v26, mut v27, mut v28, mut v29, mut v30): (bool, Rc<str>, i32, i32, i32, i32) = match v1 {
                        US1::US1_FollowingOf(v24) => {
                            let v24: Rc<str> = v24;
                            (true, v24, v2, v3, v4, v15)
                        }
                        _ => unreachable!(),
                    };
                    (v25, v26, v27, v28, v29, v30)
                }
            };
            let v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (0i32, v37, v31, v32, v33, v34, v35, v36, v6, v7, v8, v9, v10, v11, v12)
        }
        _ => {
            let (mut v85, mut v86): (i32, Rc<str>) = match v0 {
                US0::US0_OnThread(v42) => {
                    let v42: US3 = v42;
                    match v42 {
                        US3::US3_CensusThreads(v54) => {
                            let v54: Rc<UH0> = v54;
                            let v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                            let v56: Rc<str> = delimited_3(v55, v54);
                            (12i32, v56)
                        }
                        US3::US3_DeleteThread(v49) => {
                            let v49: Rc<str> = v49;
                            (9i32, v49)
                        }
                        US3::US3_Events(v57) => {
                            let v57: Rc<UH0> = v57;
                            let v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                            let v59: Rc<str> = delimited_3(v58, v57);
                            (13i32, v59)
                        }
                        US3::US3_PostThread(v44) => {
                            let v44: Rc<str> = v44;
                            (7i32, v44)
                        }
                        US3::US3_PreviewThread(v45) => {
                            let v45: Rc<str> = v45;
                            (8i32, v45)
                        }
                        US3::US3_PreviewThreads(v46) => {
                            let v46: Rc<UH0> = v46;
                            let v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                            let v48: Rc<str> = delimited_3(v47, v46);
                            (11i32, v48)
                        }
                        US3::US3_ReadThread(v43) => {
                            let v43: Rc<str> = v43;
                            (6i32, v43)
                        }
                        US3::US3_ResumeThread(v50, v51) => {
                            let v50: Rc<str> = v50;
                            let v51: Rc<str> = v51;
                            let v53: Rc<str> = string_concat(&[&*v50, "\n", &*v51]);
                            (10i32, v53)
                        }
                    }
                }
                US0::US0_PublishPost(v38) => {
                    let v38: Rc<str> = v38;
                    (1i32, v38)
                }
                US0::US0_RefreshToken(v41) => {
                    let v41: Rc<str> = v41;
                    (5i32, v41)
                }
                US0::US0_Rejected(v40) => {
                    let v40: Rc<str> = v40;
                    (4i32, v40)
                }
                US0::US0_RemovePost(v39) => {
                    let v39: Rc<str> = v39;
                    (2i32, v39)
                }
                _ => {
                    let v76: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    (3i32, v76)
                }
            };
            let v87: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v85, v86, false, v87.clone(), 5i32, 20i32, 0i32, 20i32, v87.clone(), v87, false, false, 0i32, false, false)
        }
    };
    (v88, v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102)
}
fn command_line_argument_count_4() -> i32 {
    let mut v0: usize = std::env::args().count();
    let v1: i32 = ((v0) as i32);
    let mut v2: i32 = v1.wrapping_sub(1i32);
    v2
}
fn command_line_argument_6(mut v0: i32) -> Rc<str> {
    let v1: i32 = v0.wrapping_add(1i32);
    let mut v2: usize = ((v1) as usize);
    let v3: Rc<str> = Rc::<str>::from(std::env::args().nth(v2).unwrap_or_default());
    v3
}
fn from_5(mut v0: i32, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v2: bool = v0 < 0i32;
        if v2 {
            return v1;
        } else {
            let v3: i32 = v0.wrapping_sub(1i32);
            let v4: Rc<str> = command_line_argument_6(v0);
            let v5: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4, v1));
            (v0, v1) = (v3, v5);
            continue;
        }
    }
}
fn method7(mut v0: Rc<UH0>, mut v1: bool) -> bool {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
                let v9: bool = if v1 {
                    true
                } else {
                    let v4: bool = &*v2 == "--help";
                    let v6: bool = if v4 {
                        true
                    } else {
                        let v5: bool = &*v2 == "-h";
                        v5
                    };
                    if v6 {
                        true
                    } else {
                        let v7: bool = &*v2 == "help";
                        v7
                    }
                };
                (v0, v1) = (v3, v9);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn one_value_10(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<dyn Fn(Rc<str>) -> US0>) -> US0 {
    match Rc::unwrap_or_clone(v1) {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3;
            let v4: Rc<UH0> = v4;
            match Rc::unwrap_or_clone(v4) {
                UH0::UH0_Nil => {
                    let v5: bool = &*v3 != "";
                    if v5 {
                        v2(v3)
                    } else {
                        let v7: Rc<str> = string_concat(&[&*v0, " takes exactly one argument"]);
                        US0::US0_Rejected(v7)
                    }
                }
                _ => {
                    let v10: Rc<str> = string_concat(&[&*v0, " takes exactly one argument"]);
                    US0::US0_Rejected(v10)
                }
            }
        }
        _ => {
            let v13: Rc<str> = string_concat(&[&*v0, " takes exactly one argument"]);
            US0::US0_Rejected(v13)
        }
    }
}
fn closure1() -> Rc<dyn Fn(Rc<str>) -> US0> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> US0> = Rc::new(move |mut v0: Rc<str>| -> US0 {
        let v1: US3 = US3::US3_PostThread(v0);
        US0::US0_OnThread(v1)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure2() -> Rc<dyn Fn(Rc<str>) -> US0> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> US0> = Rc::new(move |mut v0: Rc<str>| -> US0 {
        let v1: US3 = US3::US3_DeleteThread(v0);
        US0::US0_OnThread(v1)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn thread_command_12(mut v0: Rc<str>, mut v1: Rc<UH0>) -> US0 {
    let mut v2: bool = &*v0 == "post-thread";
    if v2 {
        match &*v1 {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3.clone();
                let v4: Rc<UH0> = v4.clone();
                match Rc::unwrap_or_clone(v4) {
                    UH0::UH0_Cons(v5, v6) => {
                        let v5: Rc<str> = v5;
                        let v6: Rc<UH0> = v6;
                        match &*v6 {
                            UH0::UH0_Cons(v7, v8) => {
                                let v7: Rc<str> = v7.clone();
                                let v8: Rc<UH0> = v8.clone();
                                match Rc::unwrap_or_clone(v8) {
                                    UH0::UH0_Nil => {
                                        let v9: bool = &*v3 == "--resume";
                                        if v9 {
                                            let v10: US3 = US3::US3_ResumeThread(v5, v7);
                                            US0::US0_OnThread(v10)
                                        } else {
                                            let v12: bool = &*v3 == "--dry-run";
                                            if v12 {
                                                let v13: Rc<UH0> = Rc::new(UH0::UH0_Cons(v5, v6));
                                                let v14: US3 = US3::US3_PreviewThreads(v13);
                                                US0::US0_OnThread(v14)
                                            } else {
                                                let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post-thread"); } LIT.with(|lit| lit.clone()) };
                                                let v17: Rc<dyn Fn(Rc<str>) -> US0> = closure1();
                                                one_value_10(v16, v1, v17)
                                            }
                                        }
                                    }
                                    _ => {
                                        let v21: bool = &*v3 == "--dry-run";
                                        if v21 {
                                            let v22: Rc<UH0> = Rc::new(UH0::UH0_Cons(v5, v6));
                                            let v23: US3 = US3::US3_PreviewThreads(v22);
                                            US0::US0_OnThread(v23)
                                        } else {
                                            let v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post-thread"); } LIT.with(|lit| lit.clone()) };
                                            let v26: Rc<dyn Fn(Rc<str>) -> US0> = closure1();
                                            one_value_10(v25, v1, v26)
                                        }
                                    }
                                }
                            }
                            _ => {
                                let v30: bool = &*v3 == "--dry-run";
                                if v30 {
                                    match Rc::unwrap_or_clone(v6) {
                                        UH0::UH0_Nil => {
                                            let v31: US3 = US3::US3_PreviewThread(v5);
                                            US0::US0_OnThread(v31)
                                        }
                                        _ => unreachable!(),
                                    }
                                } else {
                                    let v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post-thread"); } LIT.with(|lit| lit.clone()) };
                                    let v35: Rc<dyn Fn(Rc<str>) -> US0> = closure1();
                                    one_value_10(v34, v1, v35)
                                }
                            }
                        }
                    }
                    _ => {
                        let v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post-thread"); } LIT.with(|lit| lit.clone()) };
                        let v40: Rc<dyn Fn(Rc<str>) -> US0> = closure1();
                        one_value_10(v39, v1, v40)
                    }
                }
            }
            _ => {
                let v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post-thread"); } LIT.with(|lit| lit.clone()) };
                let v44: Rc<dyn Fn(Rc<str>) -> US0> = closure1();
                one_value_10(v43, v1, v44)
            }
        }
    } else {
        let v47: bool = &*v0 == "delete-thread";
        if v47 {
            let v48: Rc<dyn Fn(Rc<str>) -> US0> = closure2();
            one_value_10(v0, v1, v48)
        } else {
            let v50: bool = &*v0 == "events";
            if v50 {
                match Rc::unwrap_or_clone(v1) {
                    UH0::UH0_Cons(v51, v52) => {
                        let v51: Rc<str> = v51;
                        let v52: Rc<UH0> = v52;
                        let v53: bool = &*v51 == "publish";
                        let v55: bool = if v53 {
                            true
                        } else {
                            let v54: bool = &*v51 == "finish";
                            v54
                        };
                        let v57: bool = if v55 {
                            true
                        } else {
                            let v56: bool = &*v51 == "count";
                            v56
                        };
                        if v57 {
                            let v58: Rc<UH0> = Rc::new(UH0::UH0_Cons(v51, v52));
                            let v59: US3 = US3::US3_Events(v58);
                            US0::US0_OnThread(v59)
                        } else {
                            let v61: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("events takes publish, finish or count"); } LIT.with(|lit| lit.clone()) };
                            US0::US0_Rejected(v61)
                        }
                    }
                    _ => {
                        let v64: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("events takes publish, finish or count"); } LIT.with(|lit| lit.clone()) };
                        US0::US0_Rejected(v64)
                    }
                }
            } else {
                let v68: Rc<str> = string_concat(&["unknown command ", &*v0, "; try: xc timeline"]);
                US0::US0_Rejected(v68)
            }
        }
    }
}
fn closure3() -> Rc<dyn Fn(Rc<str>) -> US0> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> US0> = Rc::new(move |mut v0: Rc<str>| -> US0 {
        US0::US0_RefreshToken(v0)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure4() -> Rc<dyn Fn(Rc<str>) -> US0> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> US0> = Rc::new(move |mut v0: Rc<str>| -> US0 {
        let v1: US3 = US3::US3_ReadThread(v0);
        US0::US0_OnThread(v1)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn other_command_11(mut v0: Rc<str>, mut v1: Rc<UH0>) -> US0 {
    let mut v2: bool = &*v0 == "refresh";
    if v2 {
        let v3: Rc<dyn Fn(Rc<str>) -> US0> = closure3();
        one_value_10(v0, v1, v3)
    } else {
        let v5: bool = &*v0 == "thread";
        if v5 {
            let v6: Rc<dyn Fn(Rc<str>) -> US0> = closure4();
            one_value_10(v0, v1, v6)
        } else {
            let v8: bool = &*v0 == "postable";
            if v8 {
                match Rc::unwrap_or_clone(v1) {
                    UH0::UH0_Cons(v9, v10) => {
                        let v9: Rc<str> = v9;
                        let v10: Rc<UH0> = v10;
                        match Rc::unwrap_or_clone(v10) {
                            UH0::UH0_Cons(v11, v12) => {
                                let v11: Rc<str> = v11;
                                let v12: Rc<UH0> = v12;
                                let v13: bool = &*v9 == "census";
                                if v13 {
                                    let v14: Rc<UH0> = Rc::new(UH0::UH0_Cons(v11, v12));
                                    let v15: US3 = US3::US3_CensusThreads(v14);
                                    US0::US0_OnThread(v15)
                                } else {
                                    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("postable takes census FILE..."); } LIT.with(|lit| lit.clone()) };
                                    US0::US0_Rejected(v17)
                                }
                            }
                            _ => {
                                let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("postable takes census FILE..."); } LIT.with(|lit| lit.clone()) };
                                US0::US0_Rejected(v20)
                            }
                        }
                    }
                    _ => {
                        let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("postable takes census FILE..."); } LIT.with(|lit| lit.clone()) };
                        US0::US0_Rejected(v23)
                    }
                }
            } else {
                thread_command_12(v0, v1)
            }
        }
    }
}
fn closure5() -> Rc<dyn Fn(Rc<str>) -> US0> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> US0> = Rc::new(move |mut v0: Rc<str>| -> US0 {
        US0::US0_PublishPost(v0)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure6() -> Rc<dyn Fn(Rc<str>) -> US0> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> US0> = Rc::new(move |mut v0: Rc<str>| -> US0 {
        US0::US0_RemovePost(v0)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn write_command_9(mut v0: Rc<str>, mut v1: Rc<UH0>) -> US0 {
    let mut v2: bool = &*v0 == "post";
    if v2 {
        let v3: Rc<dyn Fn(Rc<str>) -> US0> = closure5();
        one_value_10(v0, v1, v3)
    } else {
        let v5: bool = &*v0 == "delete";
        if v5 {
            let v6: Rc<dyn Fn(Rc<str>) -> US0> = closure6();
            one_value_10(v0, v1, v6)
        } else {
            other_command_11(v0, v1)
        }
    }
}
fn parse_writes_8(mut v0: Rc<UH0>) -> US0 {
    match &*v0 {
        UH0::UH0_Cons(v1, v2) => {
            let v1: Rc<str> = v1.clone();
            let mut v2: Rc<UH0> = v2.clone();
            let v3: bool = false;
            let v4: bool = method7(v0, v3);
            let v5: bool = v4 == false;
            if v5 {
                write_command_9(v1, v2)
            } else {
                US0::US0_ShowHelp
            }
        }
        _ => {
            US0::US0_ShowHelp
        }
    }
}
fn parsed_fields_0() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
    let mut v0: i32 = command_line_argument_count_4();
    let v1: i32 = v0.wrapping_sub(1i32);
    let mut v2: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v3: Rc<UH0> = from_5(v1, v2);
    let (mut v73, mut v74, mut v75, mut v76, mut v77, mut v78, mut v79, mut v80, mut v81, mut v82, mut v83, mut v84, mut v85, mut v86, mut v87): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match &*v3 {
        UH0::UH0_Cons(v4, v5) => {
            let v4: Rc<str> = v4.clone();
            let v5: Rc<UH0> = v5.clone();
            let v6: bool = &*v4 == "timeline";
            let v10: bool = if v6 {
                let v7: bool = false;
                let v8: bool = method7(v3.clone(), v7);
                let v9: bool = v8 == false;
                v9
            } else {
                false
            };
            if v10 {
                let (mut v11, mut v12, mut v13, mut v14, mut v15, mut v16, mut v17, mut v18, mut v19, mut v20, mut v21, mut v22, mut v23, mut v24, mut v25): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = xc_timeline::xc_timeline_fields();
                (v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25)
            } else {
                let v26: US0 = parse_writes_8(v3);
                let (mut v27, mut v28, mut v29, mut v30, mut v31, mut v32, mut v33, mut v34, mut v35, mut v36, mut v37, mut v38, mut v39, mut v40, mut v41): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = fields_of_1(v26);
                (v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41)
            }
        }
        _ => {
            let v57: US0 = parse_writes_8(v3);
            let (mut v58, mut v59, mut v60, mut v61, mut v62, mut v63, mut v64, mut v65, mut v66, mut v67, mut v68, mut v69, mut v70, mut v71, mut v72): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = fields_of_1(v57);
            (v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72)
        }
    };
    (v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84, v85, v86, v87)
}
fn closure0() -> Rc<dyn Fn() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool)> = Rc::new(move || -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
        let (mut v0, mut v1, mut v2, mut v3, mut v4, mut v5, mut v6, mut v7, mut v8, mut v9, mut v10, mut v11, mut v12, mut v13, mut v14): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = parsed_fields_0();
        (v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure7() -> Rc<dyn Fn() -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn() -> Rc<str>> = Rc::new(move || -> Rc<str> {
        let mut v0: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n       xc timeline [options] [--max-following N|all] --following USERNAME\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)\n       xc refresh ENV_FILE   renew X_OAUTH2_ACCESS_TOKEN in ENV_FILE with X_OAUTH2_REFRESH_TOKEN\n       xc thread ID          the program a thread of framed posts (CELL k/n) carries\n       xc post-thread [--dry-run] FILE   post FILE as such a thread (user credentials)\n       xc post-thread --resume ROOT_ID FILE   finish a half-posted thread of FILE after its last post\n       xc post-thread --dry-run FILE...   preview each FILE's thread after a '=== FILE' line\n       xc postable census FILE...   a row of cells and posts per FILE, then their total\n       xc delete-thread ID   delete your posts of that thread (user credentials)\nenv:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n       --per-account N   posts shown per account, 1..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n       --start-time DATE posts at or after DATE (YYYY-MM-DD, local midnight, or YYYY-MM-DDTHH:MM:SSZ)\n       --end-time DATE   posts before DATE\n       --all            replies too (hidden by default, like a profile's Posts tab)\n       --no-reposts      hide reposts; --originals hides replies and reposts\n       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n       --hints           media alt text and url titles under each post\n       --json            one JSON object per entry (JSON Lines) instead of text\n       --max-following N accounts followed by USERNAME to include, or all (default 20)"); } LIT.with(|lit| lit.clone()) };
        v0
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_parse_os_args() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
    closure0()()
}
pub fn xc_usage() -> Rc<str> {
    closure7()()
}
