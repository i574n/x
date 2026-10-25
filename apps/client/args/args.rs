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
    let v0: usize = std::env::args().count();
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
            return v1.clone();
        } else {
            let v3: i32 = v0.wrapping_sub(1i32);
            let v4: Rc<str> = command_line_argument_3(v0);
            let v5: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v1.clone()));
            (v0, v1) = (v3, v5.clone());
            continue;
        }
    }
}
fn method4(mut v0: Rc<UH0>, mut v1: bool) -> bool {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
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
                (v0, v1) = (v3.clone(), v9);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn one_value_7(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: Rc<dyn Fn(Rc<str>) -> US0>) -> US0 {
    match &*v1 {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let v4: Rc<UH0> = v4.clone();
            match &*v4 {
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
        let v1: US3 = US3::US3_PostThread(v0.clone());
        US0::US0_OnThread(v1.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure2() -> Rc<dyn Fn(Rc<str>) -> US0> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> US0> = Rc::new(move |mut v0: Rc<str>| -> US0 {
        let v1: US3 = US3::US3_DeleteThread(v0.clone());
        US0::US0_OnThread(v1.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn thread_command_9(mut v0: Rc<str>, mut v1: Rc<UH0>) -> US0 {
    let mut v2: bool = &*v0 == "post-thread";
    if v2 {
        match &*v1 {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3.clone();
                let v4: Rc<UH0> = v4.clone();
                match &*v4 {
                    UH0::UH0_Cons(v5, v6) => {
                        let v5: Rc<str> = v5.clone();
                        let v6: Rc<UH0> = v6.clone();
                        match &*v6 {
                            UH0::UH0_Cons(v7, v8) => {
                                let v7: Rc<str> = v7.clone();
                                let v8: Rc<UH0> = v8.clone();
                                match &*v8 {
                                    UH0::UH0_Nil => {
                                        let v9: bool = &*v3 == "--resume";
                                        if v9 {
                                            let v10: US3 = US3::US3_ResumeThread(v5.clone(), v7);
                                            US0::US0_OnThread(v10)
                                        } else {
                                            let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post-thread"); } LIT.with(|lit| lit.clone()) };
                                            let v13: Rc<dyn Fn(Rc<str>) -> US0> = closure1();
                                            one_value_7(v12, v1.clone(), v13)
                                        }
                                    }
                                    _ => {
                                        let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post-thread"); } LIT.with(|lit| lit.clone()) };
                                        let v17: Rc<dyn Fn(Rc<str>) -> US0> = closure1();
                                        one_value_7(v16, v1.clone(), v17)
                                    }
                                }
                            }
                            UH0::UH0_Nil => {
                                let v20: bool = &*v3 == "--dry-run";
                                if v20 {
                                    let v21: US3 = US3::US3_PreviewThread(v5);
                                    US0::US0_OnThread(v21)
                                } else {
                                    let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post-thread"); } LIT.with(|lit| lit.clone()) };
                                    let v24: Rc<dyn Fn(Rc<str>) -> US0> = closure1();
                                    one_value_7(v23, v1.clone(), v24)
                                }
                            }
                        }
                    }
                    _ => {
                        let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post-thread"); } LIT.with(|lit| lit.clone()) };
                        let v30: Rc<dyn Fn(Rc<str>) -> US0> = closure1();
                        one_value_7(v29, v1.clone(), v30)
                    }
                }
            }
            _ => {
                let v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post-thread"); } LIT.with(|lit| lit.clone()) };
                let v34: Rc<dyn Fn(Rc<str>) -> US0> = closure1();
                one_value_7(v33, v1.clone(), v34)
            }
        }
    } else {
        let v37: bool = &*v0 == "delete-thread";
        if v37 {
            let v38: Rc<dyn Fn(Rc<str>) -> US0> = closure2();
            one_value_7(v0.clone(), v1, v38)
        } else {
            let v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unknown command "); } LIT.with(|lit| lit.clone()) };
            let v41: Rc<str> = Rc::<str>::from(format!("{}{}", v40, v0));
            let v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; try: xc timeline"); } LIT.with(|lit| lit.clone()) };
            let v43: Rc<str> = Rc::<str>::from(format!("{}{}", v41, v42));
            US0::US0_Rejected(v43)
        }
    }
}
fn closure3() -> Rc<dyn Fn(Rc<str>) -> US0> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> US0> = Rc::new(move |mut v0: Rc<str>| -> US0 {
        US0::US0_RefreshToken(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure4() -> Rc<dyn Fn(Rc<str>) -> US0> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> US0> = Rc::new(move |mut v0: Rc<str>| -> US0 {
        let v1: US3 = US3::US3_ReadThread(v0.clone());
        US0::US0_OnThread(v1.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn other_command_8(mut v0: Rc<str>, mut v1: Rc<UH0>) -> US0 {
    let mut v2: bool = &*v0 == "refresh";
    if v2 {
        let v3: Rc<dyn Fn(Rc<str>) -> US0> = closure3();
        one_value_7(v0.clone(), v1.clone(), v3)
    } else {
        let v5: bool = &*v0 == "thread";
        if v5 {
            let v6: Rc<dyn Fn(Rc<str>) -> US0> = closure4();
            one_value_7(v0.clone(), v1.clone(), v6)
        } else {
            thread_command_9(v0, v1)
        }
    }
}
fn closure5() -> Rc<dyn Fn(Rc<str>) -> US0> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> US0> = Rc::new(move |mut v0: Rc<str>| -> US0 {
        US0::US0_PublishPost(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure6() -> Rc<dyn Fn(Rc<str>) -> US0> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> US0> = Rc::new(move |mut v0: Rc<str>| -> US0 {
        US0::US0_RemovePost(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn write_command_6(mut v0: Rc<str>, mut v1: Rc<UH0>) -> US0 {
    let mut v2: bool = &*v0 == "post";
    if v2 {
        let v3: Rc<dyn Fn(Rc<str>) -> US0> = closure5();
        one_value_7(v0.clone(), v1.clone(), v3)
    } else {
        let v5: bool = &*v0 == "delete";
        if v5 {
            let v6: Rc<dyn Fn(Rc<str>) -> US0> = closure6();
            one_value_7(v0.clone(), v1.clone(), v6)
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
fn method11(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let v3: Rc<str> = v3.clone();
            let v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method11(v4, v1.clone(), v2.clone());
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
fn fields_of_10(mut v0: US0) -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
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
            let v15: i32 = match &v5 {
                US2::US2_AllFollowing => {
                    -1i32
                }
                US2::US2_AtMost(v13) => {
                    let v13: i32 = *v13;
                    v13
                }
            };
            match &v1 {
                US1::US1_Accounts(v16) => {
                    let v16: Rc<UH0> = v16.clone();
                    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let (mut v18, mut v19): (Rc<str>, Rc<str>) = method11(v16, v17.clone(), v17.clone());
                    (0i32, v17, false, v18, v2, v3, v4, v15, v6.clone(), v7.clone(), v8, v9, v10, v11, v12)
                }
                _ => {
                    let (mut v22, mut v23, mut v24, mut v25, mut v26, mut v27, mut v28, mut v29, mut v30, mut v31, mut v32, mut v33, mut v34, mut v35, mut v36): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match &v1 {
                        US1::US1_FollowingOf(v20) => {
                            let v20: Rc<str> = v20.clone();
                            let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                            (0i32, v21, true, v20, v2, v3, v4, v15, v6, v7, v8, v9, v10, v11, v12)
                        }
                        _ => unreachable!(),
                    };
                    (v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v35, v36)
                }
            }
        }
        _ => {
            let (mut v85, mut v86): (i32, Rc<str>) = match &v0 {
                US0::US0_OnThread(v56) => {
                    let v56: US3 = v56.clone();
                    match &v56 {
                        US3::US3_DeleteThread(v60) => {
                            let v60: Rc<str> = v60.clone();
                            (9i32, v60)
                        }
                        US3::US3_PostThread(v58) => {
                            let v58: Rc<str> = v58.clone();
                            (7i32, v58)
                        }
                        US3::US3_PreviewThread(v59) => {
                            let v59: Rc<str> = v59.clone();
                            (8i32, v59)
                        }
                        US3::US3_ReadThread(v57) => {
                            let v57: Rc<str> = v57.clone();
                            (6i32, v57)
                        }
                        US3::US3_ResumeThread(v61, v62) => {
                            let v61: Rc<str> = v61.clone();
                            let v62: Rc<str> = v62.clone();
                            let v63: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                            let v65: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v61, v63)), v62));
                            (10i32, v65)
                        }
                    }
                }
                US0::US0_PublishPost(v52) => {
                    let v52: Rc<str> = v52.clone();
                    (1i32, v52)
                }
                US0::US0_RefreshToken(v55) => {
                    let v55: Rc<str> = v55.clone();
                    (5i32, v55)
                }
                US0::US0_Rejected(v54) => {
                    let v54: Rc<str> = v54.clone();
                    (4i32, v54)
                }
                US0::US0_RemovePost(v53) => {
                    let v53: Rc<str> = v53.clone();
                    (2i32, v53)
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
fn parsed_fields_0() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
    let v0: i32 = command_line_argument_count_1();
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
                let v26: US0 = parse_writes_5(v3.clone());
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
        (v0, v1.clone(), v2, v3.clone(), v4, v5, v6, v7, v8.clone(), v9.clone(), v10, v11, v12, v13, v14)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure7() -> Rc<dyn Fn() -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn() -> Rc<str>> = Rc::new(move || -> Rc<str> {
        let v0: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-account N   posts shown per account, 1..100 (default 5)\n"); } LIT.with(|lit| lit.clone()) };
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
        let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc delete-thread ID   delete your posts of that thread (user credentials)\n"); } LIT.with(|lit| lit.clone()) };
        let v30: Rc<str> = Rc::<str>::from(format!("{}{}", v28, v29));
        let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("env:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n"); } LIT.with(|lit| lit.clone()) };
        let v34: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v30, v31)), v10)), v15));
        let v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --max-following N accounts followed by USERNAME to include, or all (default 20)"); } LIT.with(|lit| lit.clone()) };
        let v36: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v35));
        v36.clone()
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_parse_os_args() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
    closure0()()
}
pub fn xc_usage() -> Rc<str> {
    closure7()()
}
