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
enum US3 {
    US3_ShowTimeline(US4, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool, bool),
    US3_PublishPost(Rc<str>),
    US3_RemovePost(Rc<str>),
    US3_RefreshToken(Rc<str>),
    US3_ReadThread(Rc<str>),
    US3_ShowHelp,
    US3_Rejected(Rc<str>),
}
#[derive(Clone)]
enum US5 {
    US5_Ok(Rc<UH0>, US1, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool, bool),
    US5_Error(Rc<str>),
}
#[derive(Clone)]
enum US7 {
    US7_NoReplies,
    US7_NoReposts,
    US7_Originals,
    US7_Hints,
    US7_Json,
}
#[derive(Clone)]
enum US8 {
    US8_PerAccount,
    US8_Limit,
    US8_PerAuthor,
    US8_MaxFollowing,
    US8_Following,
    US8_StartTime,
    US8_EndTime,
    US8_Depth,
}
#[derive(Clone)]
enum US6 {
    US6_Switched(US7),
    US6_Valued(US8),
    US6_Plain,
}
fn from_1(mut v0: i32, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v2: bool = v0 < 1i32;
        if v2 {
            return v1.clone();
        } else {
            let mut v3: i32 = v0.wrapping_sub(1i32);
            let mut v4: Rc<str> = Rc::<str>::from(std::env::args().nth(v0 as usize).unwrap_or_default());
            let mut v5: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v1.clone()));
            (v0, v1) = (v3, v5.clone());
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
        let mut v2: bool = v1.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        if v2 {
            US1::US1_None
        } else {
            US1::US1_Some(v1.clone())
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure3() -> Rc<dyn Fn(Rc<str>) -> US1> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> US1> = Rc::new(move |mut v0: Rc<str>| -> US1 {
        let mut v1: Rc<str> = xc_checks::xc_username(&*v0);
        let mut v2: bool = v1.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        if v2 {
            US1::US1_None
        } else {
            US1::US1_Some(v1.clone())
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn with_username_5(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: Rc<str>, mut v4: Rc<UH0>, mut v5: US1, mut v6: i32, mut v7: i32, mut v8: i32, mut v9: US2, mut v10: Rc<str>, mut v11: Rc<str>, mut v12: bool, mut v13: bool, mut v14: i32, mut v15: bool, mut v16: bool) -> US5 {
    let mut v17: US1 = v2(v3.clone());
    let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("-"); } LIT.with(|lit| lit.clone()) };
    let mut v19: bool = v3.starts_with(&*v18);
    if v19 {
        let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unknown option "); } LIT.with(|lit| lit.clone()) };
        let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v3));
        US5::US5_Error(v21.clone())
    } else {
        match &v17 {
            US1::US1_None => {
                let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not an X username: '"); } LIT.with(|lit| lit.clone()) };
                let mut v27: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v3));
                let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
                let mut v29: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v28));
                US5::US5_Error(v29.clone())
            }
            US1::US1_Some(v23) => {
                let mut v23: Rc<str> = v23.clone();
                let mut v24: Rc<UH0> = Rc::new(UH0::UH0_Cons(v23.clone(), v4.clone()));
                US5::US5_Ok(v24.clone(), v5.clone(), v6, v7, v8, v9.clone(), v10.clone(), v11.clone(), v12, v13, v14, v15, v16)
            }
        }
    }
}
fn apply_switch_6(mut v0: US7, mut v1: Rc<UH0>, mut v2: US1, mut v3: i32, mut v4: i32, mut v5: i32, mut v6: US2, mut v7: Rc<str>, mut v8: Rc<str>, mut v9: bool, mut v10: bool, mut v11: i32, mut v12: bool, mut v13: bool) -> US5 {
    match &v0 {
        US7::US7_Hints => {
            US5::US5_Ok(v1.clone(), v2.clone(), v3, v4, v5, v6.clone(), v7.clone(), v8.clone(), v9, v10, v11, true, v13)
        }
        US7::US7_Json => {
            US5::US5_Ok(v1.clone(), v2.clone(), v3, v4, v5, v6.clone(), v7.clone(), v8.clone(), v9, v10, v11, v12, true)
        }
        _ => {
            let (mut v20, mut v21, mut v22, mut v23): (Rc<str>, Rc<str>, bool, bool) = match &v0 {
                US7::US7_NoReplies => {
                    (v7.clone(), v8.clone(), true, v10)
                }
                _ => {
                    let (mut v16, mut v17, mut v18, mut v19): (Rc<str>, Rc<str>, bool, bool) = match &v0 {
                        US7::US7_NoReposts => {
                            (v7.clone(), v8.clone(), v9, true)
                        }
                        _ => {
                            (v7.clone(), v8.clone(), true, true)
                        }
                    };
                    (v16.clone(), v17.clone(), v18, v19)
                }
            };
            US5::US5_Ok(v1.clone(), v2.clone(), v3, v4, v5, v6.clone(), v20.clone(), v21.clone(), v22, v23, v11, v12, v13)
        }
    }
}
fn with_date_8(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: US8, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<UH0>, mut v7: US1, mut v8: i32, mut v9: i32, mut v10: i32, mut v11: US2, mut v12: Rc<str>, mut v13: Rc<str>, mut v14: bool, mut v15: bool, mut v16: i32, mut v17: bool, mut v18: bool) -> US5 {
    let mut v19: US1 = v1(v5.clone());
    match &v19 {
        US1::US1_None => {
            let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" expects YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ, got '"); } LIT.with(|lit| lit.clone()) };
            let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v20));
            let mut v22: Rc<str> = Rc::<str>::from(format!("{}{}", v21, v5));
            let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
            let mut v24: Rc<str> = Rc::<str>::from(format!("{}{}", v22, v23));
            US5::US5_Error(v24.clone())
        }
        US1::US1_Some(v26) => {
            let mut v26: Rc<str> = v26.clone();
            let (mut v27, mut v28, mut v29, mut v30): (Rc<str>, Rc<str>, bool, bool) = match &v3 {
                US8::US8_StartTime => {
                    (v26.clone(), v13.clone(), v14, v15)
                }
                _ => {
                    (v12.clone(), v26.clone(), v14, v15)
                }
            };
            US5::US5_Ok(v6.clone(), v7.clone(), v8, v9, v10, v11.clone(), v27.clone(), v28.clone(), v29, v30, v16, v17, v18)
        }
    }
}
fn with_following_9(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: Rc<str>, mut v4: Rc<UH0>, mut v5: US1, mut v6: i32, mut v7: i32, mut v8: i32, mut v9: US2, mut v10: Rc<str>, mut v11: Rc<str>, mut v12: bool, mut v13: bool, mut v14: i32, mut v15: bool, mut v16: bool) -> US5 {
    let mut v17: US1 = v2(v3.clone());
    match &v17 {
        US1::US1_None => {
            let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not an X username: '"); } LIT.with(|lit| lit.clone()) };
            let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v3));
            let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
            let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v20));
            US5::US5_Error(v21.clone())
        }
        US1::US1_Some(v23) => {
            let mut v23: Rc<str> = v23.clone();
            match &v5 {
                US1::US1_None => {
                    let mut v27: US1 = US1::US1_Some(v23.clone());
                    US5::US5_Ok(v4.clone(), v27.clone(), v6, v7, v8, v9.clone(), v10.clone(), v11.clone(), v12, v13, v14, v15, v16)
                }
                US1::US1_Some(v24) => {
                    let mut v24: Rc<str> = v24.clone();
                    let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--following given twice"); } LIT.with(|lit| lit.clone()) };
                    US5::US5_Error(v25.clone())
                }
            }
        }
    }
}
fn bounded_10(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: US8, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<UH0>, mut v7: US1, mut v8: i32, mut v9: i32, mut v10: i32, mut v11: US2, mut v12: Rc<str>, mut v13: Rc<str>, mut v14: bool, mut v15: bool, mut v16: i32, mut v17: bool, mut v18: bool) -> US5 {
    let (mut v21, mut v22): (i32, i32) = match &v3 {
        US8::US8_Depth => {
            (0i32, 3i32)
        }
        US8::US8_PerAccount => {
            (5i32, 100i32)
        }
        _ => {
            (1i32, 100000i32)
        }
    };
    let mut v23: US0 = v0(v5.clone());
    match &v23 {
        US0::US0_Some(v24) => {
            let mut v24: i32 = *v24;
            let mut v25: bool = v24 >= v21;
            let mut v27: bool = if v25 {
                let mut v26: bool = v24 <= v22;
                v26
            } else {
                false
            };
            if v27 {
                let (mut v68, mut v69, mut v70, mut v71, mut v72, mut v73, mut v74, mut v75, mut v76, mut v77, mut v78, mut v79, mut v80): (Rc<UH0>, US1, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match &v3 {
                    US8::US8_PerAccount => {
                        (v6.clone(), v7.clone(), v24, v9, v10, v11.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17, v18)
                    }
                    _ => {
                        let (mut v55, mut v56, mut v57, mut v58, mut v59, mut v60, mut v61, mut v62, mut v63, mut v64, mut v65, mut v66, mut v67): (Rc<UH0>, US1, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match &v3 {
                            US8::US8_Limit => {
                                (v6.clone(), v7.clone(), v8, v24, v10, v11.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17, v18)
                            }
                            _ => {
                                let (mut v42, mut v43, mut v44, mut v45, mut v46, mut v47, mut v48, mut v49, mut v50, mut v51, mut v52, mut v53, mut v54): (Rc<UH0>, US1, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match &v3 {
                                    US8::US8_PerAuthor => {
                                        (v6.clone(), v7.clone(), v8, v9, v24, v11.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17, v18)
                                    }
                                    _ => {
                                        let (mut v29, mut v30, mut v31, mut v32, mut v33, mut v34, mut v35, mut v36, mut v37, mut v38, mut v39, mut v40, mut v41): (Rc<UH0>, US1, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match &v3 {
                                            US8::US8_Depth => {
                                                (v6.clone(), v7.clone(), v8, v9, v10, v11.clone(), v12.clone(), v13.clone(), v14, v15, v24, v17, v18)
                                            }
                                            _ => {
                                                let mut v28: US2 = US2::US2_AtMost(v24);
                                                (v6.clone(), v7.clone(), v8, v9, v10, v28.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17, v18)
                                            }
                                        };
                                        (v29.clone(), v30.clone(), v31, v32, v33, v34.clone(), v35.clone(), v36.clone(), v37, v38, v39, v40, v41)
                                    }
                                };
                                (v42.clone(), v43.clone(), v44, v45, v46, v47.clone(), v48.clone(), v49.clone(), v50, v51, v52, v53, v54)
                            }
                        };
                        (v55.clone(), v56.clone(), v57, v58, v59, v60.clone(), v61.clone(), v62.clone(), v63, v64, v65, v66, v67)
                    }
                };
                US5::US5_Ok(v68.clone(), v69.clone(), v70, v71, v72, v73.clone(), v74.clone(), v75.clone(), v76, v77, v78, v79, v80)
            } else {
                let mut v82: Rc<str> = Rc::<str>::from(format!("{:?}", v21));
                let mut v83: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" to "); } LIT.with(|lit| lit.clone()) };
                let mut v84: Rc<str> = Rc::<str>::from(format!("{}{}", v82, v83));
                let mut v85: Rc<str> = Rc::<str>::from(format!("{:?}", v22));
                let mut v86: Rc<str> = Rc::<str>::from(format!("{}{}", v84, v85));
                let mut v87: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" expects a number from "); } LIT.with(|lit| lit.clone()) };
                let mut v88: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v87));
                let mut v89: Rc<str> = Rc::<str>::from(format!("{}{}", v88, v86));
                let mut v90: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", got '"); } LIT.with(|lit| lit.clone()) };
                let mut v91: Rc<str> = Rc::<str>::from(format!("{}{}", v89, v90));
                let mut v92: Rc<str> = Rc::<str>::from(format!("{}{}", v91, v5));
                let mut v93: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
                let mut v94: Rc<str> = Rc::<str>::from(format!("{}{}", v92, v93));
                US5::US5_Error(v94.clone())
            }
        }
        _ => {
            let mut v97: Rc<str> = Rc::<str>::from(format!("{:?}", v21));
            let mut v98: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" to "); } LIT.with(|lit| lit.clone()) };
            let mut v99: Rc<str> = Rc::<str>::from(format!("{}{}", v97, v98));
            let mut v100: Rc<str> = Rc::<str>::from(format!("{:?}", v22));
            let mut v101: Rc<str> = Rc::<str>::from(format!("{}{}", v99, v100));
            let mut v102: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" expects a number from "); } LIT.with(|lit| lit.clone()) };
            let mut v103: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v102));
            let mut v104: Rc<str> = Rc::<str>::from(format!("{}{}", v103, v101));
            let mut v105: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", got '"); } LIT.with(|lit| lit.clone()) };
            let mut v106: Rc<str> = Rc::<str>::from(format!("{}{}", v104, v105));
            let mut v107: Rc<str> = Rc::<str>::from(format!("{}{}", v106, v5));
            let mut v108: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
            let mut v109: Rc<str> = Rc::<str>::from(format!("{}{}", v107, v108));
            US5::US5_Error(v109.clone())
        }
    }
}
fn apply_flag_7(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: US8, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<UH0>, mut v7: US1, mut v8: i32, mut v9: i32, mut v10: i32, mut v11: US2, mut v12: Rc<str>, mut v13: Rc<str>, mut v14: bool, mut v15: bool, mut v16: i32, mut v17: bool, mut v18: bool) -> US5 {
    match &v3 {
        US8::US8_EndTime => {
            with_date_8(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17, v18)
        }
        US8::US8_Following => {
            with_following_9(v0.clone(), v1.clone(), v2.clone(), v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17, v18)
        }
        US8::US8_MaxFollowing => {
            let mut v22: bool = v5.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("all"); } LIT.with(|lit| lit.clone()) };
            if v22 {
                let mut v23: US2 = US2::US2_AllFollowing;
                US5::US5_Ok(v6.clone(), v7.clone(), v8, v9, v10, v23.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17, v18)
            } else {
                bounded_10(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17, v18)
            }
        }
        US8::US8_StartTime => {
            with_date_8(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17, v18)
        }
        _ => {
            bounded_10(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17, v18)
        }
    }
}
fn advance_4(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: Rc<UH0>, mut v4: US1, mut v5: i32, mut v6: i32, mut v7: i32, mut v8: US2, mut v9: Rc<str>, mut v10: Rc<str>, mut v11: bool, mut v12: bool, mut v13: i32, mut v14: bool, mut v15: bool, mut v16: Rc<str>, mut v17: Rc<UH0>) -> (US5, Rc<UH0>) {
    let mut v18: bool = v16.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--no-replies"); } LIT.with(|lit| lit.clone()) };
    let mut v70: US6 = if v18 {
        let mut v19: US7 = US7::US7_NoReplies;
        US6::US6_Switched(v19.clone())
    } else {
        let mut v21: bool = v16.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--no-reposts"); } LIT.with(|lit| lit.clone()) };
        if v21 {
            let mut v22: US7 = US7::US7_NoReposts;
            US6::US6_Switched(v22.clone())
        } else {
            let mut v24: bool = v16.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--originals"); } LIT.with(|lit| lit.clone()) };
            if v24 {
                let mut v25: US7 = US7::US7_Originals;
                US6::US6_Switched(v25.clone())
            } else {
                let mut v27: bool = v16.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--hints"); } LIT.with(|lit| lit.clone()) };
                if v27 {
                    let mut v28: US7 = US7::US7_Hints;
                    US6::US6_Switched(v28.clone())
                } else {
                    let mut v30: bool = v16.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--json"); } LIT.with(|lit| lit.clone()) };
                    if v30 {
                        let mut v31: US7 = US7::US7_Json;
                        US6::US6_Switched(v31.clone())
                    } else {
                        let mut v33: bool = v16.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--per-account"); } LIT.with(|lit| lit.clone()) };
                        if v33 {
                            let mut v34: US8 = US8::US8_PerAccount;
                            US6::US6_Valued(v34.clone())
                        } else {
                            let mut v36: bool = v16.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--limit"); } LIT.with(|lit| lit.clone()) };
                            if v36 {
                                let mut v37: US8 = US8::US8_Limit;
                                US6::US6_Valued(v37.clone())
                            } else {
                                let mut v39: bool = v16.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--per-author"); } LIT.with(|lit| lit.clone()) };
                                if v39 {
                                    let mut v40: US8 = US8::US8_PerAuthor;
                                    US6::US6_Valued(v40.clone())
                                } else {
                                    let mut v42: bool = v16.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--depth"); } LIT.with(|lit| lit.clone()) };
                                    if v42 {
                                        let mut v43: US8 = US8::US8_Depth;
                                        US6::US6_Valued(v43.clone())
                                    } else {
                                        let mut v45: bool = v16.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--max-following"); } LIT.with(|lit| lit.clone()) };
                                        if v45 {
                                            let mut v46: US8 = US8::US8_MaxFollowing;
                                            US6::US6_Valued(v46.clone())
                                        } else {
                                            let mut v48: bool = v16.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--following"); } LIT.with(|lit| lit.clone()) };
                                            if v48 {
                                                let mut v49: US8 = US8::US8_Following;
                                                US6::US6_Valued(v49.clone())
                                            } else {
                                                let mut v51: bool = v16.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--start-time"); } LIT.with(|lit| lit.clone()) };
                                                if v51 {
                                                    let mut v52: US8 = US8::US8_StartTime;
                                                    US6::US6_Valued(v52.clone())
                                                } else {
                                                    let mut v54: bool = v16.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--end-time"); } LIT.with(|lit| lit.clone()) };
                                                    if v54 {
                                                        let mut v55: US8 = US8::US8_EndTime;
                                                        US6::US6_Valued(v55.clone())
                                                    } else {
                                                        US6::US6_Plain
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
    match &v70 {
        US6::US6_Plain => {
            let mut v85: US5 = with_username_5(v0.clone(), v1.clone(), v2.clone(), v16.clone(), v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14, v15);
            (v85.clone(), v17.clone())
        }
        US6::US6_Switched(v71) => {
            let mut v71: US7 = v71.clone();
            let mut v72: US5 = apply_switch_6(v71.clone(), v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14, v15);
            (v72.clone(), v17.clone())
        }
        US6::US6_Valued(v73) => {
            let mut v73: US8 = v73.clone();
            match &*v17 {
                UH0::UH0_Cons(v78, v79) => {
                    let mut v78: Rc<str> = v78.clone();
                    let mut v79: Rc<UH0> = v79.clone();
                    let mut v80: US5 = apply_flag_7(v0.clone(), v1.clone(), v2.clone(), v73.clone(), v16.clone(), v78.clone(), v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14, v15);
                    (v80.clone(), v79.clone())
                }
                UH0::UH0_Nil => {
                    let mut v74: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" needs a value"); } LIT.with(|lit| lit.clone()) };
                    let mut v75: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v74));
                    let mut v76: US5 = US5::US5_Error(v75.clone());
                    let mut v77: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    (v76.clone(), v77.clone())
                }
            }
        }
    }
}
fn method13(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
                let mut v4: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2.clone(), v1.clone()));
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH0::UH0_Nil => {
                return v1.clone();
            }
        }
    }
}
fn finish_12(mut v0: Rc<UH0>, mut v1: US1, mut v2: i32, mut v3: i32, mut v4: i32, mut v5: US2, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: bool, mut v9: bool, mut v10: i32, mut v11: bool, mut v12: bool) -> US3 {
    let mut v13: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v14: Rc<UH0> = method13(v0.clone(), v13.clone());
    match &v1 {
        US1::US1_None => {
            match &*v14 {
                UH0::UH0_Nil => {
                    let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("name at least one account, or --following USERNAME"); } LIT.with(|lit| lit.clone()) };
                    US3::US3_Rejected(v21.clone())
                }
                _ => {
                    let mut v23: US4 = US4::US4_Accounts(v14.clone());
                    US3::US3_ShowTimeline(v23.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11, v12)
                }
            }
        }
        US1::US1_Some(v15) => {
            let mut v15: Rc<str> = v15.clone();
            match &*v14 {
                UH0::UH0_Nil => {
                    let mut v16: US4 = US4::US4_FollowingOf(v15.clone());
                    US3::US3_ShowTimeline(v16.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11, v12)
                }
                _ => {
                    let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--following takes one account and no other usernames"); } LIT.with(|lit| lit.clone()) };
                    US3::US3_Rejected(v18.clone())
                }
            }
        }
    }
}
fn method14(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
                let mut v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3.clone(), v4);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn capped_11(mut v0: Rc<UH0>, mut v1: US1, mut v2: i32, mut v3: i32, mut v4: i32, mut v5: US2, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: bool, mut v9: bool, mut v10: i32, mut v11: bool, mut v12: bool) -> US3 {
    let mut v13: i32 = 0i32;
    let mut v14: i32 = method14(v0.clone(), v13);
    let mut v15: bool = v14 > 100i32;
    if v15 {
        let mut v16: Rc<str> = Rc::<str>::from(format!("{:?}", 100i32));
        let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("at most "); } LIT.with(|lit| lit.clone()) };
        let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v16));
        let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" accounts per run"); } LIT.with(|lit| lit.clone()) };
        let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v19));
        US3::US3_Rejected(v20.clone())
    } else {
        finish_12(v0.clone(), v1.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11, v12)
    }
}
fn parse_from_3(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: Rc<UH0>, mut v4: US1, mut v5: i32, mut v6: i32, mut v7: i32, mut v8: US2, mut v9: Rc<str>, mut v10: Rc<str>, mut v11: bool, mut v12: bool, mut v13: i32, mut v14: bool, mut v15: bool, mut v16: Rc<UH0>) -> US3 {
    loop {
        match &*v16 {
            UH0::UH0_Cons(v18, v19) => {
                let mut v18: Rc<str> = v18.clone();
                let mut v19: Rc<UH0> = v19.clone();
                let (mut v20, mut v21): (US5, Rc<UH0>) = advance_4(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14, v15, v18.clone(), v19.clone());
                match &v20 {
                    US5::US5_Error(v36) => {
                        let mut v36: Rc<str> = v36.clone();
                        return US3::US3_Rejected(v36.clone());
                    }
                    US5::US5_Ok(v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32, v33, v34) => {
                        let mut v22: Rc<UH0> = v22.clone();
                        let mut v23: US1 = v23.clone();
                        let mut v24: i32 = *v24;
                        let mut v25: i32 = *v25;
                        let mut v26: i32 = *v26;
                        let mut v27: US2 = v27.clone();
                        let mut v28: Rc<str> = v28.clone();
                        let mut v29: Rc<str> = v29.clone();
                        let mut v30: bool = *v30;
                        let mut v31: bool = *v31;
                        let mut v32: i32 = *v32;
                        let mut v33: bool = *v33;
                        let mut v34: bool = *v34;
                        (v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16) = (v0.clone(), v1.clone(), v2.clone(), v22.clone(), v23.clone(), v24, v25, v26, v27.clone(), v28.clone(), v29.clone(), v30, v31, v32, v33, v34, v21.clone());
                        continue;
                    }
                }
            }
            UH0::UH0_Nil => {
                return capped_11(v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14, v15);
            }
        }
    }
}
fn method15(mut v0: Rc<UH0>, mut v1: bool) -> bool {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
                let mut v9: bool = if v1 {
                    true
                } else {
                    let mut v4: bool = v2.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--help"); } LIT.with(|lit| lit.clone()) };
                    let mut v6: bool = if v4 {
                        true
                    } else {
                        let mut v5: bool = v2.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("-h"); } LIT.with(|lit| lit.clone()) };
                        v5
                    };
                    if v6 {
                        true
                    } else {
                        let mut v7: bool = v2.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("help"); } LIT.with(|lit| lit.clone()) };
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
fn parse_args_with_2(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: Rc<UH0>, mut v4: US1, mut v5: i32, mut v6: i32, mut v7: i32, mut v8: US2, mut v9: Rc<str>, mut v10: Rc<str>, mut v11: bool, mut v12: bool, mut v13: i32, mut v14: bool, mut v15: bool, mut v16: Rc<UH0>) -> US3 {
    match &*v16 {
        UH0::UH0_Cons(v17, v18) => {
            let mut v17: Rc<str> = v17.clone();
            let mut v18: Rc<UH0> = v18.clone();
            let mut v19: bool = false;
            let mut v20: bool = method15(v16.clone(), v19);
            let mut v21: bool = v20 == false;
            if v21 {
                let mut v22: bool = v17.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("timeline"); } LIT.with(|lit| lit.clone()) };
                if v22 {
                    parse_from_3(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14, v15, v18.clone())
                } else {
                    let mut v24: bool = v17.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post"); } LIT.with(|lit| lit.clone()) };
                    if v24 {
                        match &*v18 {
                            UH0::UH0_Cons(v25, v26) => {
                                let mut v25: Rc<str> = v25.clone();
                                let mut v26: Rc<UH0> = v26.clone();
                                match &*v26 {
                                    UH0::UH0_Nil => {
                                        let mut v27: bool = v25.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                                        let mut v28: bool = v27 != true;
                                        if v28 {
                                            US3::US3_PublishPost(v25.clone())
                                        } else {
                                            let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                            let mut v31: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v30));
                                            US3::US3_Rejected(v31.clone())
                                        }
                                    }
                                    _ => {
                                        let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                        let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v34));
                                        US3::US3_Rejected(v35.clone())
                                    }
                                }
                            }
                            _ => {
                                let mut v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                let mut v39: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v38));
                                US3::US3_Rejected(v39.clone())
                            }
                        }
                    } else {
                        let mut v42: bool = v17.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("delete"); } LIT.with(|lit| lit.clone()) };
                        if v42 {
                            match &*v18 {
                                UH0::UH0_Cons(v43, v44) => {
                                    let mut v43: Rc<str> = v43.clone();
                                    let mut v44: Rc<UH0> = v44.clone();
                                    match &*v44 {
                                        UH0::UH0_Nil => {
                                            let mut v45: bool = v43.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                                            let mut v46: bool = v45 != true;
                                            if v46 {
                                                US3::US3_RemovePost(v43.clone())
                                            } else {
                                                let mut v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                                let mut v49: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v48));
                                                US3::US3_Rejected(v49.clone())
                                            }
                                        }
                                        _ => {
                                            let mut v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                            let mut v53: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v52));
                                            US3::US3_Rejected(v53.clone())
                                        }
                                    }
                                }
                                _ => {
                                    let mut v56: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                    let mut v57: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v56));
                                    US3::US3_Rejected(v57.clone())
                                }
                            }
                        } else {
                            let mut v60: bool = v17.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("refresh"); } LIT.with(|lit| lit.clone()) };
                            if v60 {
                                match &*v18 {
                                    UH0::UH0_Cons(v61, v62) => {
                                        let mut v61: Rc<str> = v61.clone();
                                        let mut v62: Rc<UH0> = v62.clone();
                                        match &*v62 {
                                            UH0::UH0_Nil => {
                                                let mut v63: bool = v61.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                                                let mut v64: bool = v63 != true;
                                                if v64 {
                                                    US3::US3_RefreshToken(v61.clone())
                                                } else {
                                                    let mut v66: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                                    let mut v67: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v66));
                                                    US3::US3_Rejected(v67.clone())
                                                }
                                            }
                                            _ => {
                                                let mut v70: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                                let mut v71: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v70));
                                                US3::US3_Rejected(v71.clone())
                                            }
                                        }
                                    }
                                    _ => {
                                        let mut v74: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                        let mut v75: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v74));
                                        US3::US3_Rejected(v75.clone())
                                    }
                                }
                            } else {
                                let mut v78: bool = v17.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("thread"); } LIT.with(|lit| lit.clone()) };
                                if v78 {
                                    match &*v18 {
                                        UH0::UH0_Cons(v79, v80) => {
                                            let mut v79: Rc<str> = v79.clone();
                                            let mut v80: Rc<UH0> = v80.clone();
                                            match &*v80 {
                                                UH0::UH0_Nil => {
                                                    let mut v81: bool = v79.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                                                    let mut v82: bool = v81 != true;
                                                    if v82 {
                                                        US3::US3_ReadThread(v79.clone())
                                                    } else {
                                                        let mut v84: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                                        let mut v85: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v84));
                                                        US3::US3_Rejected(v85.clone())
                                                    }
                                                }
                                                _ => {
                                                    let mut v88: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                                    let mut v89: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v88));
                                                    US3::US3_Rejected(v89.clone())
                                                }
                                            }
                                        }
                                        _ => {
                                            let mut v92: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                            let mut v93: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v92));
                                            US3::US3_Rejected(v93.clone())
                                        }
                                    }
                                } else {
                                    let mut v96: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unknown command "); } LIT.with(|lit| lit.clone()) };
                                    let mut v97: Rc<str> = Rc::<str>::from(format!("{}{}", v96, v17));
                                    let mut v98: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; try: xc timeline"); } LIT.with(|lit| lit.clone()) };
                                    let mut v99: Rc<str> = Rc::<str>::from(format!("{}{}", v97, v98));
                                    US3::US3_Rejected(v99.clone())
                                }
                            }
                        }
                    }
                }
            } else {
                US3::US3_ShowHelp
            }
        }
        _ => {
            US3::US3_ShowHelp
        }
    }
}
fn method17(mut v0: Rc<UH0>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method17(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn fields_of_16(mut v0: US3) -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
    let (mut v69, mut v70, mut v71, mut v72, mut v73, mut v74, mut v75, mut v76, mut v77, mut v78, mut v79, mut v80, mut v81, mut v82, mut v83): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match &v0 {
        US3::US3_ShowTimeline(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12) => {
            let mut v1: US4 = v1.clone();
            let mut v2: i32 = *v2;
            let mut v3: i32 = *v3;
            let mut v4: i32 = *v4;
            let mut v5: US2 = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = v7.clone();
            let mut v8: bool = *v8;
            let mut v9: bool = *v9;
            let mut v10: i32 = *v10;
            let mut v11: bool = *v11;
            let mut v12: bool = *v12;
            let mut v15: i32 = match &v5 {
                US2::US2_AllFollowing => {
                    -1i32
                }
                US2::US2_AtMost(v13) => {
                    let mut v13: i32 = *v13;
                    v13
                }
            };
            match &v1 {
                US4::US4_Accounts(v16) => {
                    let mut v16: Rc<UH0> = v16.clone();
                    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let (mut v18, mut v19): (Rc<str>, Rc<str>) = method17(v16.clone(), v17.clone());
                    (0i32, v17.clone(), false, v18.clone(), v2, v3, v4, v15, v6.clone(), v7.clone(), v8, v9, v10, v11, v12)
                }
                _ => {
                    let (mut v22, mut v23, mut v24, mut v25, mut v26, mut v27, mut v28, mut v29, mut v30, mut v31, mut v32, mut v33, mut v34, mut v35, mut v36): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = match &v1 {
                        US4::US4_FollowingOf(v20) => {
                            let mut v20: Rc<str> = v20.clone();
                            let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                            (0i32, v21.clone(), true, v20.clone(), v2, v3, v4, v15, v6.clone(), v7.clone(), v8, v9, v10, v11, v12)
                        }
                        _ => unreachable!(),
                    };
                    (v22, v23.clone(), v24, v25.clone(), v26, v27, v28, v29, v30.clone(), v31.clone(), v32, v33, v34, v35, v36)
                }
            }
        }
        _ => {
            let (mut v66, mut v67): (i32, Rc<str>) = match &v0 {
                US3::US3_PublishPost(v52) => {
                    let mut v52: Rc<str> = v52.clone();
                    (1i32, v52.clone())
                }
                US3::US3_ReadThread(v56) => {
                    let mut v56: Rc<str> = v56.clone();
                    (6i32, v56.clone())
                }
                US3::US3_RefreshToken(v55) => {
                    let mut v55: Rc<str> = v55.clone();
                    (5i32, v55.clone())
                }
                US3::US3_Rejected(v54) => {
                    let mut v54: Rc<str> = v54.clone();
                    (4i32, v54.clone())
                }
                US3::US3_RemovePost(v53) => {
                    let mut v53: Rc<str> = v53.clone();
                    (2i32, v53.clone())
                }
                _ => {
                    let mut v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    (3i32, v57.clone())
                }
            };
            let mut v68: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v66, v67.clone(), false, v68.clone(), 5i32, 20i32, 0i32, 20i32, v68.clone(), v68.clone(), false, false, 0i32, false, false)
        }
    };
    (v69, v70.clone(), v71, v72.clone(), v73, v74, v75, v76, v77.clone(), v78.clone(), v79, v80, v81, v82, v83)
}
fn parsed_fields_0() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
    let mut v0: i32 = std::env::args().count() as i32;
    let mut v1: i32 = v0.wrapping_sub(1i32);
    let mut v2: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v3: Rc<UH0> = from_1(v1, v2.clone());
    let mut v4: Rc<dyn Fn(Rc<str>) -> US0> = closure1();
    let mut v5: Rc<dyn Fn(Rc<str>) -> US1> = closure2();
    let mut v6: Rc<dyn Fn(Rc<str>) -> US1> = closure3();
    let mut v7: Rc<str> = Rc::<str>::from(String::new());
    let mut v8: Rc<str> = Rc::<str>::from(String::new());
    let mut v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v10: US1 = US1::US1_None;
    let mut v11: i32 = 5i32;
    let mut v12: i32 = 20i32;
    let mut v13: i32 = 0i32;
    let mut v14: i32 = 20i32;
    let mut v15: US2 = US2::US2_AtMost(v14);
    let mut v16: bool = false;
    let mut v17: bool = false;
    let mut v18: i32 = 0i32;
    let mut v19: bool = false;
    let mut v20: bool = false;
    let mut v21: US3 = parse_args_with_2(v4.clone(), v5.clone(), v6.clone(), v9.clone(), v10.clone(), v11, v12, v13, v15.clone(), v7.clone(), v8.clone(), v16, v17, v18, v19, v20, v3.clone());
    let (mut v22, mut v23, mut v24, mut v25, mut v26, mut v27, mut v28, mut v29, mut v30, mut v31, mut v32, mut v33, mut v34, mut v35, mut v36): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = fields_of_16(v21.clone());
    (v22, v23.clone(), v24, v25.clone(), v26, v27, v28, v29, v30.clone(), v31.clone(), v32, v33, v34, v35, v36)
}
fn closure0() -> Rc<dyn Fn() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool)> = Rc::new(move || -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
        let (mut v0, mut v1, mut v2, mut v3, mut v4, mut v5, mut v6, mut v7, mut v8, mut v9, mut v10, mut v11, mut v12, mut v13, mut v14): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = parsed_fields_0();
        (v0, v1.clone(), v2, v3.clone(), v4, v5, v6, v7, v8.clone(), v9.clone(), v10, v11, v12, v13, v14)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure4() -> Rc<dyn Fn() -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn() -> Rc<str>> = Rc::new(move || -> Rc<str> {
        let mut v0: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-account N   posts fetched per account, 5..100 (default 5)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --limit N         timeline entries shown (default 20)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-author N    entries shown per author (default all)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --start-time DATE posts at or after DATE (YYYY-MM-DD, local midnight, or YYYY-MM-DDTHH:MM:SSZ)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --end-time DATE   posts before DATE\n"); } LIT.with(|lit| lit.clone()) };
        let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --start-time DATE posts at or after DATE (YYYY-MM-DD, local midnight, or YYYY-MM-DDTHH:MM:SSZ)\n       --end-time DATE   posts before DATE\n"); } LIT.with(|lit| lit.clone()) };
        let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --no-replies, --no-reposts, --originals (both)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --start-time DATE posts at or after DATE (YYYY-MM-DD, local midnight, or YYYY-MM-DDTHH:MM:SSZ)\n       --end-time DATE   posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n       --start-time DATE posts at or after DATE (YYYY-MM-DD, local midnight, or YYYY-MM-DDTHH:MM:SSZ)\n       --end-time DATE   posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --hints           media alt text and url titles under each post\n"); } LIT.with(|lit| lit.clone()) };
        let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n       --hints           media alt text and url titles under each post\n"); } LIT.with(|lit| lit.clone()) };
        let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --json            one JSON object per entry (JSON Lines) instead of text\n"); } LIT.with(|lit| lit.clone()) };
        let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n       --hints           media alt text and url titles under each post\n       --json            one JSON object per entry (JSON Lines) instead of text\n"); } LIT.with(|lit| lit.clone()) };
        let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n"); } LIT.with(|lit| lit.clone()) };
        let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc timeline [options] [--max-following N|all] --following USERNAME\n"); } LIT.with(|lit| lit.clone()) };
        let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n       xc timeline [options] [--max-following N|all] --following USERNAME\n"); } LIT.with(|lit| lit.clone()) };
        let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc refresh ENV_FILE   renew X_OAUTH2_ACCESS_TOKEN in ENV_FILE with X_OAUTH2_REFRESH_TOKEN\n"); } LIT.with(|lit| lit.clone()) };
        let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)\n       xc refresh ENV_FILE   renew X_OAUTH2_ACCESS_TOKEN in ENV_FILE with X_OAUTH2_REFRESH_TOKEN\n"); } LIT.with(|lit| lit.clone()) };
        let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n       xc timeline [options] [--max-following N|all] --following USERNAME\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)\n       xc refresh ENV_FILE   renew X_OAUTH2_ACCESS_TOKEN in ENV_FILE with X_OAUTH2_REFRESH_TOKEN\n"); } LIT.with(|lit| lit.clone()) };
        let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc thread ID          the program a thread of framed posts (CELL k/n) carries\n"); } LIT.with(|lit| lit.clone()) };
        let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n       xc timeline [options] [--max-following N|all] --following USERNAME\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)\n       xc refresh ENV_FILE   renew X_OAUTH2_ACCESS_TOKEN in ENV_FILE with X_OAUTH2_REFRESH_TOKEN\n       xc thread ID          the program a thread of framed posts (CELL k/n) carries\n"); } LIT.with(|lit| lit.clone()) };
        let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("env:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n       xc timeline [options] [--max-following N|all] --following USERNAME\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)\n       xc refresh ENV_FILE   renew X_OAUTH2_ACCESS_TOKEN in ENV_FILE with X_OAUTH2_REFRESH_TOKEN\n       xc thread ID          the program a thread of framed posts (CELL k/n) carries\nenv:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n       xc timeline [options] [--max-following N|all] --following USERNAME\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)\n       xc refresh ENV_FILE   renew X_OAUTH2_ACCESS_TOKEN in ENV_FILE with X_OAUTH2_REFRESH_TOKEN\n       xc thread ID          the program a thread of framed posts (CELL k/n) carries\nenv:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n       --start-time DATE posts at or after DATE (YYYY-MM-DD, local midnight, or YYYY-MM-DDTHH:MM:SSZ)\n       --end-time DATE   posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n       xc timeline [options] [--max-following N|all] --following USERNAME\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)\n       xc refresh ENV_FILE   renew X_OAUTH2_ACCESS_TOKEN in ENV_FILE with X_OAUTH2_REFRESH_TOKEN\n       xc thread ID          the program a thread of framed posts (CELL k/n) carries\nenv:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n       --start-time DATE posts at or after DATE (YYYY-MM-DD, local midnight, or YYYY-MM-DDTHH:MM:SSZ)\n       --end-time DATE   posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n       --hints           media alt text and url titles under each post\n       --json            one JSON object per entry (JSON Lines) instead of text\n"); } LIT.with(|lit| lit.clone()) };
        let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --max-following N accounts followed by USERNAME to include, or all (default 20)"); } LIT.with(|lit| lit.clone()) };
        let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n       xc timeline [options] [--max-following N|all] --following USERNAME\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)\n       xc refresh ENV_FILE   renew X_OAUTH2_ACCESS_TOKEN in ENV_FILE with X_OAUTH2_REFRESH_TOKEN\n       xc thread ID          the program a thread of framed posts (CELL k/n) carries\nenv:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n       --start-time DATE posts at or after DATE (YYYY-MM-DD, local midnight, or YYYY-MM-DDTHH:MM:SSZ)\n       --end-time DATE   posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n       --hints           media alt text and url titles under each post\n       --json            one JSON object per entry (JSON Lines) instead of text\n       --max-following N accounts followed by USERNAME to include, or all (default 20)"); } LIT.with(|lit| lit.clone()) };
        v30.clone()
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_parse_os_args() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) {
    closure0()()
}
pub fn xc_usage() -> Rc<str> {
    closure4()()
}
