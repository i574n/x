#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
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
fn command_line_argument_count_1() -> i32 {
    let mut v0: usize = std::env::args().count();
    let v1: i32 = ((v0) as i32);
    let mut v2: i32 = v1.wrapping_sub(1i32);
    v2
}
fn command_line_argument_3(mut v0: i32) -> Rc<str> {
    let v1: i32 = v0.wrapping_add(1i32);
    let mut v2: usize = ((v1) as usize);
    let v3: Rc<str> = Rc::<str>::from(std::env::args().nth(v2).unwrap_or_default());
    v3
}
fn from_2(mut v0: i32, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v2: bool = v0 < 0i32;
        if v2 {
            return v1;
        } else {
            let v3: i32 = v0.wrapping_sub(1i32);
            let v4: Rc<str> = command_line_argument_3(v0);
            let v5: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4, v1));
            (v0, v1) = (v3, v5);
            continue;
        }
    }
}
fn method4(mut v0: Rc<UH0>, mut v1: bool) -> bool {
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
fn one_value_7(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<dyn Fn(Rc<str>) -> US0>) -> US0 {
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
                        let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                        let v8: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v7));
                        US0::US0_Rejected(v8)
                    }
                }
                _ => {
                    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                    let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v11));
                    US0::US0_Rejected(v12)
                }
            }
        }
        _ => {
            let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
            let v16: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v15));
            US0::US0_Rejected(v16)
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
fn thread_command_9(mut v0: Rc<str>, mut v1: Rc<UH0>) -> US0 {
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
                                                one_value_7(v16, v1, v17)
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
                                            one_value_7(v25, v1, v26)
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
                                    one_value_7(v34, v1, v35)
                                }
                            }
                        }
                    }
                    _ => {
                        let v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post-thread"); } LIT.with(|lit| lit.clone()) };
                        let v40: Rc<dyn Fn(Rc<str>) -> US0> = closure1();
                        one_value_7(v39, v1, v40)
                    }
                }
            }
            _ => {
                let v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post-thread"); } LIT.with(|lit| lit.clone()) };
                let v44: Rc<dyn Fn(Rc<str>) -> US0> = closure1();
                one_value_7(v43, v1, v44)
            }
        }
    } else {
        let v47: bool = &*v0 == "delete-thread";
        if v47 {
            let v48: Rc<dyn Fn(Rc<str>) -> US0> = closure2();
            one_value_7(v0, v1, v48)
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
                let v67: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unknown command "); } LIT.with(|lit| lit.clone()) };
                let v68: Rc<str> = Rc::<str>::from(format!("{}{}", v67, v0));
                let v69: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; try: xc timeline"); } LIT.with(|lit| lit.clone()) };
                let v70: Rc<str> = Rc::<str>::from(format!("{}{}", v68, v69));
                US0::US0_Rejected(v70)
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
fn other_command_8(mut v0: Rc<str>, mut v1: Rc<UH0>) -> US0 {
    let mut v2: bool = &*v0 == "refresh";
    if v2 {
        let v3: Rc<dyn Fn(Rc<str>) -> US0> = closure3();
        one_value_7(v0, v1, v3)
    } else {
        let v5: bool = &*v0 == "thread";
        if v5 {
            let v6: Rc<dyn Fn(Rc<str>) -> US0> = closure4();
            one_value_7(v0, v1, v6)
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
                thread_command_9(v0, v1)
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
fn write_command_6(mut v0: Rc<str>, mut v1: Rc<UH0>) -> US0 {
    let mut v2: bool = &*v0 == "post";
    if v2 {
        let v3: Rc<dyn Fn(Rc<str>) -> US0> = closure5();
        one_value_7(v0, v1, v3)
    } else {
        let v5: bool = &*v0 == "delete";
        if v5 {
            let v6: Rc<dyn Fn(Rc<str>) -> US0> = closure6();
            one_value_7(v0, v1, v6)
        } else {
            other_command_8(v0, v1)
        }
    }
}
fn parse_writes_5(mut v0: Rc<UH0>) -> US0 {
    match &*v0 {
        UH0::UH0_Cons(v1, v2) => {
            let v1: Rc<str> = v1.clone();
            let mut v2: Rc<UH0> = v2.clone();
            let v3: bool = false;
            let v4: bool = method4(v0, v3);
            let v5: bool = v4 == false;
            if v5 {
                write_command_6(v1, v2)
            } else {
                US0::US0_ShowHelp
            }
        }
        _ => {
            US0::US0_ShowHelp
        }
    }
}
fn method11(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
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
fn delimited_12(mut v0: Rc<str>, mut v1: Rc<UH0>) -> Rc<str> {
    let mut v2: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v3: i32 = 0i32;
    let v4: i32 = method11(v2.clone(), v1, v3);
    let v5: Rc<Vec<Rc<str>>> = Rc::new(v2.borrow().clone());
    let v6: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v5).as_ref().clone()));
    let v7: Rc<str> = Rc::<str>::from((*v6.borrow()).join(&*v0));
    v7
}
fn fields_of_10(mut v0: US0) -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
    let (mut v89, mut v90, mut v91, mut v92, mut v93, mut v94, mut v95, mut v96, mut v97, mut v98, mut v99, mut v100, mut v101, mut v102, mut v103): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match &v0 {
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
                    let v19: i32 = method11(v17.clone(), v16, v18);
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
            let (mut v86, mut v87): (i32, Rc<str>) = match v0 {
                US0::US0_OnThread(v42) => {
                    let v42: US3 = v42;
                    match v42 {
                        US3::US3_CensusThreads(v55) => {
                            let v55: Rc<UH0> = v55;
                            let v56: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                            let v57: Rc<str> = delimited_12(v56, v55);
                            (12i32, v57)
                        }
                        US3::US3_DeleteThread(v49) => {
                            let v49: Rc<str> = v49;
                            (9i32, v49)
                        }
                        US3::US3_Events(v58) => {
                            let v58: Rc<UH0> = v58;
                            let v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                            let v60: Rc<str> = delimited_12(v59, v58);
                            (13i32, v60)
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
                            let v48: Rc<str> = delimited_12(v47, v46);
                            (11i32, v48)
                        }
                        US3::US3_ReadThread(v43) => {
                            let v43: Rc<str> = v43;
                            (6i32, v43)
                        }
                        US3::US3_ResumeThread(v50, v51) => {
                            let v50: Rc<str> = v50;
                            let v51: Rc<str> = v51;
                            let v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                            let v54: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v50, v52)), v51));
                            (10i32, v54)
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
                    let v77: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    (3i32, v77)
                }
            };
            let v88: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v86, v87, false, v88.clone(), 5i32, 20i32, 0i32, 20i32, v88.clone(), v88, false, false, 0i32, false, false)
        }
    };
    (v89, v90, v91, v92, v93, v94, v95, v96, v97, v98, v99, v100, v101, v102, v103)
}
fn parsed_fields_0() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
    let mut v0: i32 = command_line_argument_count_1();
    let v1: i32 = v0.wrapping_sub(1i32);
    let mut v2: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v3: Rc<UH0> = from_2(v1, v2);
    let (mut v73, mut v74, mut v75, mut v76, mut v77, mut v78, mut v79, mut v80, mut v81, mut v82, mut v83, mut v84, mut v85, mut v86, mut v87): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match &*v3 {
        UH0::UH0_Cons(v4, v5) => {
            let v4: Rc<str> = v4.clone();
            let v5: Rc<UH0> = v5.clone();
            let v6: bool = &*v4 == "timeline";
            let v10: bool = if v6 {
                let v7: bool = false;
                let v8: bool = method4(v3.clone(), v7);
                let v9: bool = v8 == false;
                v9
            } else {
                false
            };
            if v10 {
                let (mut v11, mut v12, mut v13, mut v14, mut v15, mut v16, mut v17, mut v18, mut v19, mut v20, mut v21, mut v22, mut v23, mut v24, mut v25): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = xc_timeline::xc_timeline_fields();
                (v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25)
            } else {
                let v26: US0 = parse_writes_5(v3);
                let (mut v27, mut v28, mut v29, mut v30, mut v31, mut v32, mut v33, mut v34, mut v35, mut v36, mut v37, mut v38, mut v39, mut v40, mut v41): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = fields_of_10(v26);
                (v27, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41)
            }
        }
        _ => {
            let v57: US0 = parse_writes_5(v3);
            let (mut v58, mut v59, mut v60, mut v61, mut v62, mut v63, mut v64, mut v65, mut v66, mut v67, mut v68, mut v69, mut v70, mut v71, mut v72): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = fields_of_10(v57);
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
        let mut v0: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-account N   posts shown per account, 1..100 (default 5)\n"); } LIT.with(|lit| lit.clone()) };
        let v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --limit N         timeline entries shown (default 20)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-account N   posts shown per account, 1..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n"); } LIT.with(|lit| lit.clone()) };
        let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-author N    entries shown per author (default all)\n"); } LIT.with(|lit| lit.clone()) };
        let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-account N   posts shown per account, 1..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n"); } LIT.with(|lit| lit.clone()) };
        let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --start-time DATE posts at or after DATE (YYYY-MM-DD, local midnight, or YYYY-MM-DDTHH:MM:SSZ)\n"); } LIT.with(|lit| lit.clone()) };
        let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --end-time DATE   posts before DATE\n"); } LIT.with(|lit| lit.clone()) };
        let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --start-time DATE posts at or after DATE (YYYY-MM-DD, local midnight, or YYYY-MM-DDTHH:MM:SSZ)\n       --end-time DATE   posts before DATE\n"); } LIT.with(|lit| lit.clone()) };
        let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --no-replies, --no-reposts, --originals (both)\n"); } LIT.with(|lit| lit.clone()) };
        let v10: Rc<str> = Rc::<str>::from(format!("{}{}", v4, Rc::<str>::from(format!("{}{}", v7, v8))));
        let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n"); } LIT.with(|lit| lit.clone()) };
        let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --hints           media alt text and url titles under each post\n"); } LIT.with(|lit| lit.clone()) };
        let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n       --hints           media alt text and url titles under each post\n"); } LIT.with(|lit| lit.clone()) };
        let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --json            one JSON object per entry (JSON Lines) instead of text\n"); } LIT.with(|lit| lit.clone()) };
        let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n       --hints           media alt text and url titles under each post\n       --json            one JSON object per entry (JSON Lines) instead of text\n"); } LIT.with(|lit| lit.clone()) };
        let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n"); } LIT.with(|lit| lit.clone()) };
        let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc timeline [options] [--max-following N|all] --following USERNAME\n"); } LIT.with(|lit| lit.clone()) };
        let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n       xc timeline [options] [--max-following N|all] --following USERNAME\n"); } LIT.with(|lit| lit.clone()) };
        let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)\n"); } LIT.with(|lit| lit.clone()) };
        let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc refresh ENV_FILE   renew X_OAUTH2_ACCESS_TOKEN in ENV_FILE with X_OAUTH2_REFRESH_TOKEN\n"); } LIT.with(|lit| lit.clone()) };
        let v22: Rc<str> = Rc::<str>::from(format!("{}{}", v18, Rc::<str>::from(format!("{}{}", v19, v20))));
        let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc thread ID          the program a thread of framed posts (CELL k/n) carries\n"); } LIT.with(|lit| lit.clone()) };
        let v24: Rc<str> = Rc::<str>::from(format!("{}{}", v22, v23));
        let v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc post-thread [--dry-run] FILE   post FILE as such a thread (user credentials)\n"); } LIT.with(|lit| lit.clone()) };
        let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc post-thread --resume ROOT_ID FILE   finish a half-posted thread of FILE after its last post\n"); } LIT.with(|lit| lit.clone()) };
        let v28: Rc<str> = Rc::<str>::from(format!("{}{}", v24, Rc::<str>::from(format!("{}{}", v25, v26))));
        let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc post-thread --dry-run FILE...   preview each FILE's thread after a '=== FILE' line\n"); } LIT.with(|lit| lit.clone()) };
        let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc postable census FILE...   a row of cells and posts per FILE, then their total\n"); } LIT.with(|lit| lit.clone()) };
        let v32: Rc<str> = Rc::<str>::from(format!("{}{}", v28, Rc::<str>::from(format!("{}{}", v29, v30))));
        let v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc delete-thread ID   delete your posts of that thread (user credentials)\n"); } LIT.with(|lit| lit.clone()) };
        let v34: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v33));
        let v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("env:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n"); } LIT.with(|lit| lit.clone()) };
        let v38: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v34, v35)), v10)), v15));
        let v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --max-following N accounts followed by USERNAME to include, or all (default 20)"); } LIT.with(|lit| lit.clone()) };
        let v40: Rc<str> = Rc::<str>::from(format!("{}{}", v38, v39));
        v40
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_parse_os_args() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
    closure0()()
}
pub fn xc_usage() -> Rc<str> {
    closure7()()
}
