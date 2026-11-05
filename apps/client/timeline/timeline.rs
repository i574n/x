#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
#[derive(Clone)]
enum US0 {
    US0_Some(i32),
    US0_None,
}
#[derive(Clone)]
enum US1 {
    US1_Some(Rc<str>),
    US1_None,
}
#[derive(Clone)]
enum US2 {
    US2_AtMost(i32),
    US2_AllFollowing,
}
#[derive(Clone)]
enum US4 {
    US4_Accounts(Rc<UH0>),
    US4_FollowingOf(Rc<str>),
}
#[derive(Clone)]
enum US5 {
    US5_ReadThread(Rc<str>),
    US5_PostThread(Rc<str>),
    US5_PreviewThread(Rc<str>),
    US5_PreviewThreads(Rc<UH0>),
    US5_CensusThreads(Rc<UH0>),
    US5_Events(Rc<UH0>),
    US5_DeleteThread(Rc<str>),
    US5_ResumeThread(Rc<str>, Rc<str>),
}
#[derive(Clone)]
enum US3 {
    US3_ShowTimeline(US4, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool, bool),
    US3_PublishPost(Rc<str>),
    US3_RemovePost(Rc<str>),
    US3_RefreshToken(Rc<str>),
    US3_OnThread(US5),
    US3_ShowHelp,
    US3_Rejected(Rc<str>),
}
#[derive(Clone)]
enum US6 {
    US6_Ok(Rc<UH0>, US1, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool, bool),
    US6_Error(Rc<str>),
}
#[derive(Clone)]
enum US8 {
    US8_NoReplies,
    US8_NoReposts,
    US8_Originals,
    US8_Hints,
    US8_Json,
}
#[derive(Clone)]
enum US9 {
    US9_PerAccount,
    US9_Limit,
    US9_PerAuthor,
    US9_MaxFollowing,
    US9_Following,
    US9_StartTime,
    US9_EndTime,
    US9_Depth,
}
#[derive(Clone)]
enum US7 {
    US7_Switched(US8),
    US7_Valued(US9),
    US7_Plain,
}
fn command_line_argument_count_1() -> i32 {
    let mut v0: usize = std::env::args().count();
    let mut v1: i32 = ((v0) as i32);
    let mut v2: i32 = v1.wrapping_sub(1i32);
    v2
}
fn command_line_argument_3(mut v0: i32) -> Rc<str> {
    let mut v1: i32 = v0.wrapping_add(1i32);
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
fn closure1() -> Rc<dyn Fn(Rc<str>) -> US0> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> US0> = Rc::new(move |mut v0: Rc<str>| -> US0 {
        let mut v1: i32 = xc_checks::xc_count(&*v0);
        let mut v2: bool = v1 < 0i32;
        if v2 {
            US0::US0_None
        } else {
            US0::US0_Some(v1)
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure2() -> Rc<dyn Fn(Rc<str>) -> US1> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> US1> = Rc::new(move |mut v0: Rc<str>| -> US1 {
        let mut v1: Rc<str> = xc_checks::xc_date(&*v0);
        let mut v2: bool = &*v1 == "";
        if v2 {
            US1::US1_None
        } else {
            US1::US1_Some(v1)
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure3() -> Rc<dyn Fn(Rc<str>) -> US1> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> US1> = Rc::new(move |mut v0: Rc<str>| -> US1 {
        let mut v1: Rc<str> = xc_checks::xc_username(&*v0);
        let mut v2: bool = &*v1 == "";
        if v2 {
            US1::US1_None
        } else {
            US1::US1_Some(v1)
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method7(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2;
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
fn finish_6(mut v0: Rc<UH0>, mut v1: US1, mut v2: i32, mut v3: i32, mut v4: i32, mut v5: US2, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: bool, mut v9: bool, mut v10: i32, mut v11: bool, mut v12: bool) -> US3 {
    let v13: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v14: Rc<UH0> = method7(v0, v13);
    match v1 {
        US1::US1_None => {
            match &*v14 {
                UH0::UH0_Nil => {
                    let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("name at least one account, or --following USERNAME"); } LIT.with(|lit| lit.clone()) };
                    US3::US3_Rejected(v21)
                }
                _ => {
                    let v23: US4 = US4::US4_Accounts(v14);
                    US3::US3_ShowTimeline(v23, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                }
            }
        }
        US1::US1_Some(v15) => {
            let v15: Rc<str> = v15;
            match Rc::unwrap_or_clone(v14) {
                UH0::UH0_Nil => {
                    let v16: US4 = US4::US4_FollowingOf(v15);
                    US3::US3_ShowTimeline(v16, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
                }
                _ => {
                    let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--following takes one account and no other usernames"); } LIT.with(|lit| lit.clone()) };
                    US3::US3_Rejected(v18)
                }
            }
        }
    }
}
fn method8(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
                let v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3, v4);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn capped_5(mut v0: Rc<UH0>, mut v1: US1, mut v2: i32, mut v3: i32, mut v4: i32, mut v5: US2, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: bool, mut v9: bool, mut v10: i32, mut v11: bool, mut v12: bool) -> US3 {
    let v13: i32 = 0i32;
    let v14: i32 = method8(v0.clone(), v13);
    let v15: bool = v14 > 100i32;
    if v15 {
        let v16: Rc<str> = Rc::<str>::from((100i32).to_string());
        let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("at most "); } LIT.with(|lit| lit.clone()) };
        let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v16));
        let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" accounts per run"); } LIT.with(|lit| lit.clone()) };
        let v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v19));
        US3::US3_Rejected(v20)
    } else {
        finish_6(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12)
    }
}
fn with_username_10(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: Rc<str>, mut v4: Rc<UH0>, mut v5: US1, mut v6: i32, mut v7: i32, mut v8: i32, mut v9: US2, mut v10: Rc<str>, mut v11: Rc<str>, mut v12: bool, mut v13: bool, mut v14: i32, mut v15: bool, mut v16: bool) -> US6 {
    let v17: US1 = v2(v3.clone());
    let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("-"); } LIT.with(|lit| lit.clone()) };
    let v19: bool = v3.starts_with(&*v18);
    if v19 {
        let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unknown option "); } LIT.with(|lit| lit.clone()) };
        let v21: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v3));
        US6::US6_Error(v21)
    } else {
        match v17 {
            US1::US1_None => {
                let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not an X username: '"); } LIT.with(|lit| lit.clone()) };
                let v27: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v3));
                let v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
                let v29: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v28));
                US6::US6_Error(v29)
            }
            US1::US1_Some(v23) => {
                let v23: Rc<str> = v23;
                let v24: Rc<UH0> = Rc::new(UH0::UH0_Cons(v23, v4));
                US6::US6_Ok(v24, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
            }
        }
    }
}
fn apply_switch_11(mut v0: US8, mut v1: Rc<UH0>, mut v2: US1, mut v3: i32, mut v4: i32, mut v5: i32, mut v6: US2, mut v7: Rc<str>, mut v8: Rc<str>, mut v9: bool, mut v10: bool, mut v11: i32, mut v12: bool, mut v13: bool) -> US6 {
    match &v0 {
        US8::US8_Hints => {
            US6::US6_Ok(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, true, v13)
        }
        US8::US8_Json => {
            US6::US6_Ok(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, true)
        }
        _ => {
            let (mut v20, mut v21, mut v22, mut v23): (Rc<str>, Rc<str>, bool, bool) = match &v0 {
                US8::US8_NoReplies => {
                    (v7, v8, true, v10)
                }
                _ => {
                    let (mut v16, mut v17, mut v18, mut v19): (Rc<str>, Rc<str>, bool, bool) = match v0 {
                        US8::US8_NoReposts => {
                            (v7, v8, v9, true)
                        }
                        _ => {
                            (v7, v8, true, true)
                        }
                    };
                    (v16, v17, v18, v19)
                }
            };
            US6::US6_Ok(v1, v2, v3, v4, v5, v6, v20, v21, v22, v23, v11, v12, v13)
        }
    }
}
fn with_date_14(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: US9, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<UH0>, mut v7: US1, mut v8: i32, mut v9: i32, mut v10: i32, mut v11: US2, mut v12: Rc<str>, mut v13: Rc<str>, mut v14: bool, mut v15: bool, mut v16: i32, mut v17: bool, mut v18: bool) -> US6 {
    let v19: US1 = v1(v5.clone());
    match v19 {
        US1::US1_None => {
            let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" expects YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ, got '"); } LIT.with(|lit| lit.clone()) };
            let v22: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v4, v20)), v5));
            let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
            let v24: Rc<str> = Rc::<str>::from(format!("{}{}", v22, v23));
            US6::US6_Error(v24)
        }
        US1::US1_Some(v26) => {
            let v26: Rc<str> = v26;
            let (mut v27, mut v28, mut v29, mut v30): (Rc<str>, Rc<str>, bool, bool) = match v3 {
                US9::US9_StartTime => {
                    (v26, v13, v14, v15)
                }
                _ => {
                    (v12, v26, v14, v15)
                }
            };
            US6::US6_Ok(v6, v7, v8, v9, v10, v11, v27, v28, v29, v30, v16, v17, v18)
        }
    }
}
fn method13(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: US9, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<UH0>, mut v7: US1, mut v8: i32, mut v9: i32, mut v10: i32, mut v11: US2, mut v12: Rc<str>, mut v13: Rc<str>, mut v14: bool, mut v15: bool, mut v16: i32, mut v17: bool, mut v18: bool) -> US6 {
    with_date_14(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
}
fn with_following_15(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: Rc<str>, mut v4: Rc<UH0>, mut v5: US1, mut v6: i32, mut v7: i32, mut v8: i32, mut v9: US2, mut v10: Rc<str>, mut v11: Rc<str>, mut v12: bool, mut v13: bool, mut v14: i32, mut v15: bool, mut v16: bool) -> US6 {
    let v17: US1 = v2(v3.clone());
    match v17 {
        US1::US1_None => {
            let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not an X username: '"); } LIT.with(|lit| lit.clone()) };
            let v19: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v3));
            let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
            let v21: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v20));
            US6::US6_Error(v21)
        }
        US1::US1_Some(v23) => {
            let v23: Rc<str> = v23;
            match v5 {
                US1::US1_None => {
                    let v27: US1 = US1::US1_Some(v23);
                    US6::US6_Ok(v4, v27, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16)
                }
                US1::US1_Some(v24) => {
                    let v24: Rc<str> = v24;
                    let v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--following given twice"); } LIT.with(|lit| lit.clone()) };
                    US6::US6_Error(v25)
                }
            }
        }
    }
}
fn bounded_16(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: US9, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<UH0>, mut v7: US1, mut v8: i32, mut v9: i32, mut v10: i32, mut v11: US2, mut v12: Rc<str>, mut v13: Rc<str>, mut v14: bool, mut v15: bool, mut v16: i32, mut v17: bool, mut v18: bool) -> US6 {
    let (mut v21, mut v22): (i32, i32) = match &v3 {
        US9::US9_Depth => {
            (0i32, 3i32)
        }
        US9::US9_PerAccount => {
            (1i32, 100i32)
        }
        _ => {
            (1i32, 100000i32)
        }
    };
    let v23: US0 = v0(v5.clone());
    match v23 {
        US0::US0_Some(v24) => {
            let v24: i32 = v24;
            let v25: bool = v24 >= v21;
            let v27: bool = if v25 {
                let v26: bool = v24 <= v22;
                v26
            } else {
                false
            };
            if v27 {
                let (mut v68, mut v69, mut v70, mut v71, mut v72, mut v73, mut v74, mut v75, mut v76, mut v77, mut v78, mut v79, mut v80): (Rc<UH0>, US1, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match &v3 {
                    US9::US9_PerAccount => {
                        (v6, v7, v24, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
                    }
                    _ => {
                        let (mut v55, mut v56, mut v57, mut v58, mut v59, mut v60, mut v61, mut v62, mut v63, mut v64, mut v65, mut v66, mut v67): (Rc<UH0>, US1, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match &v3 {
                            US9::US9_Limit => {
                                (v6, v7, v8, v24, v10, v11, v12, v13, v14, v15, v16, v17, v18)
                            }
                            _ => {
                                let (mut v42, mut v43, mut v44, mut v45, mut v46, mut v47, mut v48, mut v49, mut v50, mut v51, mut v52, mut v53, mut v54): (Rc<UH0>, US1, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match &v3 {
                                    US9::US9_PerAuthor => {
                                        (v6, v7, v8, v9, v24, v11, v12, v13, v14, v15, v16, v17, v18)
                                    }
                                    _ => {
                                        let (mut v29, mut v30, mut v31, mut v32, mut v33, mut v34, mut v35, mut v36, mut v37, mut v38, mut v39, mut v40, mut v41): (Rc<UH0>, US1, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match v3 {
                                            US9::US9_Depth => {
                                                (v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v24, v17, v18)
                                            }
                                            _ => {
                                                let v28: US2 = US2::US2_AtMost(v24);
                                                (v6, v7, v8, v9, v10, v28, v12, v13, v14, v15, v16, v17, v18)
                                            }
                                        };
                                        (v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41)
                                    }
                                };
                                (v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52, v53, v54)
                            }
                        };
                        (v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67)
                    }
                };
                US6::US6_Ok(v68, v69, v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80)
            } else {
                let v82: Rc<str> = Rc::<str>::from((v21).to_string());
                let v83: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" to "); } LIT.with(|lit| lit.clone()) };
                let v84: Rc<str> = Rc::<str>::from(format!("{}{}", v82, v83));
                let v85: Rc<str> = Rc::<str>::from((v22).to_string());
                let v86: Rc<str> = Rc::<str>::from(format!("{}{}", v84, v85));
                let v87: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" expects a number from "); } LIT.with(|lit| lit.clone()) };
                let v89: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v4, v87)), v86));
                let v90: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", got '"); } LIT.with(|lit| lit.clone()) };
                let v92: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v89, v90)), v5));
                let v93: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
                let v94: Rc<str> = Rc::<str>::from(format!("{}{}", v92, v93));
                US6::US6_Error(v94)
            }
        }
        _ => {
            let v97: Rc<str> = Rc::<str>::from((v21).to_string());
            let v98: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" to "); } LIT.with(|lit| lit.clone()) };
            let v99: Rc<str> = Rc::<str>::from(format!("{}{}", v97, v98));
            let v100: Rc<str> = Rc::<str>::from((v22).to_string());
            let v101: Rc<str> = Rc::<str>::from(format!("{}{}", v99, v100));
            let v102: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" expects a number from "); } LIT.with(|lit| lit.clone()) };
            let v104: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v4, v102)), v101));
            let v105: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", got '"); } LIT.with(|lit| lit.clone()) };
            let v107: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v104, v105)), v5));
            let v108: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
            let v109: Rc<str> = Rc::<str>::from(format!("{}{}", v107, v108));
            US6::US6_Error(v109)
        }
    }
}
fn apply_flag_12(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: US9, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<UH0>, mut v7: US1, mut v8: i32, mut v9: i32, mut v10: i32, mut v11: US2, mut v12: Rc<str>, mut v13: Rc<str>, mut v14: bool, mut v15: bool, mut v16: i32, mut v17: bool, mut v18: bool) -> US6 {
    match &v3 {
        US9::US9_EndTime => {
            method13(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
        }
        US9::US9_Following => {
            with_following_15(v0, v1, v2, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
        }
        US9::US9_MaxFollowing => {
            let v22: bool = &*v5 == "all";
            if v22 {
                let v23: US2 = US2::US2_AllFollowing;
                US6::US6_Ok(v6, v7, v8, v9, v10, v23, v12, v13, v14, v15, v16, v17, v18)
            } else {
                bounded_16(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
            }
        }
        US9::US9_StartTime => {
            method13(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
        }
        _ => {
            bounded_16(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18)
        }
    }
}
fn advance_9(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: Rc<UH0>, mut v4: US1, mut v5: i32, mut v6: i32, mut v7: i32, mut v8: US2, mut v9: Rc<str>, mut v10: Rc<str>, mut v11: bool, mut v12: bool, mut v13: i32, mut v14: bool, mut v15: bool, mut v16: Rc<str>, mut v17: Rc<UH0>) -> (US6, Rc<UH0>) {
    let v18: bool = &*v16 == "--no-replies";
    let v70: US7 = if v18 {
        let v19: US8 = US8::US8_NoReplies;
        US7::US7_Switched(v19)
    } else {
        let v21: bool = &*v16 == "--no-reposts";
        if v21 {
            let v22: US8 = US8::US8_NoReposts;
            US7::US7_Switched(v22)
        } else {
            let v24: bool = &*v16 == "--originals";
            if v24 {
                let v25: US8 = US8::US8_Originals;
                US7::US7_Switched(v25)
            } else {
                let v27: bool = &*v16 == "--json";
                if v27 {
                    let v28: US8 = US8::US8_Json;
                    US7::US7_Switched(v28)
                } else {
                    let v30: bool = &*v16 == "--hints";
                    if v30 {
                        let v31: US8 = US8::US8_Hints;
                        US7::US7_Switched(v31)
                    } else {
                        let v33: bool = &*v16 == "--per-account";
                        if v33 {
                            let v34: US9 = US9::US9_PerAccount;
                            US7::US7_Valued(v34)
                        } else {
                            let v36: bool = &*v16 == "--limit";
                            if v36 {
                                let v37: US9 = US9::US9_Limit;
                                US7::US7_Valued(v37)
                            } else {
                                let v39: bool = &*v16 == "--per-author";
                                if v39 {
                                    let v40: US9 = US9::US9_PerAuthor;
                                    US7::US7_Valued(v40)
                                } else {
                                    let v42: bool = &*v16 == "--depth";
                                    if v42 {
                                        let v43: US9 = US9::US9_Depth;
                                        US7::US7_Valued(v43)
                                    } else {
                                        let v45: bool = &*v16 == "--max-following";
                                        if v45 {
                                            let v46: US9 = US9::US9_MaxFollowing;
                                            US7::US7_Valued(v46)
                                        } else {
                                            let v48: bool = &*v16 == "--following";
                                            if v48 {
                                                let v49: US9 = US9::US9_Following;
                                                US7::US7_Valued(v49)
                                            } else {
                                                let v51: bool = &*v16 == "--start-time";
                                                if v51 {
                                                    let v52: US9 = US9::US9_StartTime;
                                                    US7::US7_Valued(v52)
                                                } else {
                                                    let v54: bool = &*v16 == "--end-time";
                                                    if v54 {
                                                        let v55: US9 = US9::US9_EndTime;
                                                        US7::US7_Valued(v55)
                                                    } else {
                                                        US7::US7_Plain
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    };
    match v70 {
        US7::US7_Plain => {
            let v85: US6 = with_username_10(v0, v1, v2, v16, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
            (v85, v17)
        }
        US7::US7_Switched(v71) => {
            let v71: US8 = v71;
            let v72: US6 = apply_switch_11(v71, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
            (v72, v17)
        }
        US7::US7_Valued(v73) => {
            let v73: US9 = v73;
            match Rc::unwrap_or_clone(v17) {
                UH0::UH0_Cons(v78, v79) => {
                    let v78: Rc<str> = v78;
                    let v79: Rc<UH0> = v79;
                    let v80: US6 = apply_flag_12(v0, v1, v2, v73, v16, v78, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
                    (v80, v79)
                }
                UH0::UH0_Nil => {
                    let v74: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" needs a value"); } LIT.with(|lit| lit.clone()) };
                    let v75: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v74));
                    let v76: US6 = US6::US6_Error(v75);
                    let v77: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    (v76, v77)
                }
            }
        }
    }
}
fn parse_from_4(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: Rc<UH0>, mut v4: US1, mut v5: i32, mut v6: i32, mut v7: i32, mut v8: US2, mut v9: Rc<str>, mut v10: Rc<str>, mut v11: bool, mut v12: bool, mut v13: i32, mut v14: bool, mut v15: bool, mut v16: Rc<UH0>) -> US3 {
    loop {
        match Rc::unwrap_or_clone(v16) {
            UH0::UH0_Cons(v18, v19) => {
                let v18: Rc<str> = v18;
                let v19: Rc<UH0> = v19;
                let (mut v20, mut v21): (US6, Rc<UH0>) = advance_9(v0.clone(), v1.clone(), v2.clone(), v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v18, v19);
                match v20 {
                    US6::US6_Error(v36) => {
                        let v36: Rc<str> = v36;
                        return US3::US3_Rejected(v36);
                    }
                    US6::US6_Ok(v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34) => {
                        let v22: Rc<UH0> = v22;
                        let v23: US1 = v23;
                        let v24: i32 = v24;
                        let v25: i32 = v25;
                        let v26: i32 = v26;
                        let v27: US2 = v27;
                        let v28: Rc<str> = v28;
                        let v29: Rc<str> = v29;
                        let v30: bool = v30;
                        let v31: bool = v31;
                        let v32: i32 = v32;
                        let v33: bool = v33;
                        let v34: bool = v34;
                        (v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16) = (v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34, v21);
                        continue;
                    }
                }
            }
            UH0::UH0_Nil => {
                return capped_5(v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
            }
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
fn delimited_19(mut v0: Rc<str>, mut v1: Rc<UH0>) -> Rc<str> {
    let mut v2: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v3: i32 = 0i32;
    let v4: i32 = method18(v2.clone(), v1, v3);
    let v5: Rc<Vec<Rc<str>>> = Rc::new(v2.borrow().clone());
    let v6: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v5).as_ref().clone()));
    let v7: Rc<str> = Rc::<str>::from((*v6.borrow()).join(&*v0));
    v7
}
fn fields_of_17(mut v0: US3) -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
    let (mut v89, mut v90, mut v91, mut v92, mut v93, mut v94, mut v95, mut v96, mut v97, mut v98, mut v99, mut v100, mut v101, mut v102, mut v103): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match &v0 {
        US3::US3_ShowTimeline(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12) => {
            let mut v1: US4 = v1.clone();
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
                US4::US4_Accounts(v16) => {
                    let v16: Rc<UH0> = v16.clone();
                    let v17: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
                    let v18: i32 = 0i32;
                    let v19: i32 = method18(v17.clone(), v16, v18);
                    let v20: Rc<Vec<Rc<str>>> = Rc::new(v17.borrow().clone());
                    let v21: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v20).as_ref().clone()));
                    let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                    let v23: Rc<str> = Rc::<str>::from((*v21.borrow()).join(&*v22));
                    (false, v23, v2, v3, v4, v15)
                }
                _ => {
                    let (mut v25, mut v26, mut v27, mut v28, mut v29, mut v30): (bool, Rc<str>, i32, i32, i32, i32) = match v1 {
                        US4::US4_FollowingOf(v24) => {
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
                US3::US3_OnThread(v42) => {
                    let v42: US5 = v42;
                    match v42 {
                        US5::US5_CensusThreads(v55) => {
                            let v55: Rc<UH0> = v55;
                            let v56: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                            let v57: Rc<str> = delimited_19(v56, v55);
                            (12i32, v57)
                        }
                        US5::US5_DeleteThread(v49) => {
                            let v49: Rc<str> = v49;
                            (9i32, v49)
                        }
                        US5::US5_Events(v58) => {
                            let v58: Rc<UH0> = v58;
                            let v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                            let v60: Rc<str> = delimited_19(v59, v58);
                            (13i32, v60)
                        }
                        US5::US5_PostThread(v44) => {
                            let v44: Rc<str> = v44;
                            (7i32, v44)
                        }
                        US5::US5_PreviewThread(v45) => {
                            let v45: Rc<str> = v45;
                            (8i32, v45)
                        }
                        US5::US5_PreviewThreads(v46) => {
                            let v46: Rc<UH0> = v46;
                            let v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                            let v48: Rc<str> = delimited_19(v47, v46);
                            (11i32, v48)
                        }
                        US5::US5_ReadThread(v43) => {
                            let v43: Rc<str> = v43;
                            (6i32, v43)
                        }
                        US5::US5_ResumeThread(v50, v51) => {
                            let v50: Rc<str> = v50;
                            let v51: Rc<str> = v51;
                            let v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                            let v54: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v50, v52)), v51));
                            (10i32, v54)
                        }
                    }
                }
                US3::US3_PublishPost(v38) => {
                    let v38: Rc<str> = v38;
                    (1i32, v38)
                }
                US3::US3_RefreshToken(v41) => {
                    let v41: Rc<str> = v41;
                    (5i32, v41)
                }
                US3::US3_Rejected(v40) => {
                    let v40: Rc<str> = v40;
                    (4i32, v40)
                }
                US3::US3_RemovePost(v39) => {
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
fn timeline_fields_0() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
    let mut v0: i32 = command_line_argument_count_1();
    let mut v1: i32 = v0.wrapping_sub(1i32);
    let mut v2: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v3: Rc<UH0> = from_2(v1, v2);
    let (mut v70, mut v71, mut v72, mut v73, mut v74, mut v75, mut v76, mut v77, mut v78, mut v79, mut v80, mut v81, mut v82, mut v83, mut v84): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match &*v3 {
        UH0::UH0_Cons(v4, v5) => {
            let v4: Rc<str> = v4.clone();
            let v5: Rc<UH0> = v5.clone();
            let v6: Rc<dyn Fn(Rc<str>) -> US0> = closure1();
            let v7: Rc<dyn Fn(Rc<str>) -> US1> = closure2();
            let v8: Rc<dyn Fn(Rc<str>) -> US1> = closure3();
            let v9: Rc<str> = Rc::<str>::from(String::new());
            let v10: Rc<str> = Rc::<str>::from(String::new());
            let v11: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v12: US1 = US1::US1_None;
            let v13: i32 = 5i32;
            let v14: i32 = 20i32;
            let v15: i32 = 0i32;
            let v16: i32 = 20i32;
            let v17: US2 = US2::US2_AtMost(v16);
            let v18: bool = false;
            let v19: bool = false;
            let v20: i32 = 0i32;
            let v21: bool = false;
            let v22: bool = false;
            let v23: US3 = parse_from_4(v6, v7, v8, v11, v12, v13, v14, v15, v17, v9, v10, v18, v19, v20, v21, v22, v5);
            fields_of_17(v23)
        }
        _ => {
            let (mut v55, mut v56, mut v57, mut v58, mut v59, mut v60, mut v61, mut v62, mut v63, mut v64, mut v65, mut v66, mut v67, mut v68, mut v69): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match Rc::unwrap_or_clone(v3) {
                UH0::UH0_Nil => {
                    let v39: US3 = US3::US3_ShowHelp;
                    fields_of_17(v39)
                }
                _ => unreachable!(),
            };
            (v55, v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66, v67, v68, v69)
        }
    };
    (v70, v71, v72, v73, v74, v75, v76, v77, v78, v79, v80, v81, v82, v83, v84)
}
fn closure0() -> Rc<dyn Fn() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool)> = Rc::new(move || -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
        let (mut v0, mut v1, mut v2, mut v3, mut v4, mut v5, mut v6, mut v7, mut v8, mut v9, mut v10, mut v11, mut v12, mut v13, mut v14): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = timeline_fields_0();
        (v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_timeline_fields() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
    closure0()()
}
