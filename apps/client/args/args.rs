#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
impl UH0 {
    fn tag(&self) -> i32 {
        match self {
            UH0::UH0_Nil => 0,
            UH0::UH0_Cons(..) => 1,
        }
    }
}
impl Default for UH0 {
    fn default() -> Self {
        UH0::UH0_Nil
    }
}
#[derive(Clone)]
enum US0 {
    US0_Some(i32),
    US0_None,
}
impl US0 {
    fn tag(&self) -> i32 {
        match self {
            US0::US0_Some(..) => 0,
            US0::US0_None => 1,
        }
    }
}
impl Default for US0 {
    fn default() -> Self {
        US0::US0_Some(<i32>::default())
    }
}
#[derive(Clone)]
enum US1 {
    US1_Some(Rc<str>),
    US1_None,
}
impl US1 {
    fn tag(&self) -> i32 {
        match self {
            US1::US1_Some(..) => 0,
            US1::US1_None => 1,
        }
    }
}
impl Default for US1 {
    fn default() -> Self {
        US1::US1_Some({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
#[derive(Clone)]
enum US2 {
    US2_AtMost(i32),
    US2_AllFollowing,
}
impl US2 {
    fn tag(&self) -> i32 {
        match self {
            US2::US2_AtMost(..) => 0,
            US2::US2_AllFollowing => 1,
        }
    }
}
impl Default for US2 {
    fn default() -> Self {
        US2::US2_AtMost(<i32>::default())
    }
}
#[derive(Clone)]
enum US4 {
    US4_Accounts(Rc<UH0>),
    US4_FollowingOf(Rc<str>),
}
impl US4 {
    fn tag(&self) -> i32 {
        match self {
            US4::US4_Accounts(..) => 0,
            US4::US4_FollowingOf(..) => 1,
        }
    }
}
impl Default for US4 {
    fn default() -> Self {
        US4::US4_Accounts(<Rc<UH0>>::default())
    }
}
#[derive(Clone)]
enum US3 {
    US3_ShowTimeline(US4, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool),
    US3_PublishPost(Rc<str>),
    US3_RemovePost(Rc<str>),
    US3_ShowHelp,
    US3_Rejected(Rc<str>),
}
impl US3 {
    fn tag(&self) -> i32 {
        match self {
            US3::US3_ShowTimeline(..) => 0,
            US3::US3_PublishPost(..) => 1,
            US3::US3_RemovePost(..) => 2,
            US3::US3_ShowHelp => 3,
            US3::US3_Rejected(..) => 4,
        }
    }
}
impl Default for US3 {
    fn default() -> Self {
        US3::US3_ShowTimeline(<US4>::default(), <i32>::default(), <i32>::default(), <i32>::default(), <US2>::default(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, <bool>::default(), <bool>::default(), <i32>::default(), <bool>::default())
    }
}
#[derive(Clone)]
enum US5 {
    US5_Ok(Rc<UH0>, US1, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool),
    US5_Error(Rc<str>),
}
impl US5 {
    fn tag(&self) -> i32 {
        match self {
            US5::US5_Ok(..) => 0,
            US5::US5_Error(..) => 1,
        }
    }
}
impl Default for US5 {
    fn default() -> Self {
        US5::US5_Ok(<Rc<UH0>>::default(), <US1>::default(), <i32>::default(), <i32>::default(), <i32>::default(), <US2>::default(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, <bool>::default(), <bool>::default(), <i32>::default(), <bool>::default())
    }
}
#[derive(Clone)]
enum US7 {
    US7_NoReplies,
    US7_NoReposts,
    US7_Originals,
    US7_Hints,
}
impl US7 {
    fn tag(&self) -> i32 {
        match self {
            US7::US7_NoReplies => 0,
            US7::US7_NoReposts => 1,
            US7::US7_Originals => 2,
            US7::US7_Hints => 3,
        }
    }
}
impl Default for US7 {
    fn default() -> Self {
        US7::US7_NoReplies
    }
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
impl US8 {
    fn tag(&self) -> i32 {
        match self {
            US8::US8_PerAccount => 0,
            US8::US8_Limit => 1,
            US8::US8_PerAuthor => 2,
            US8::US8_MaxFollowing => 3,
            US8::US8_Following => 4,
            US8::US8_StartTime => 5,
            US8::US8_EndTime => 6,
            US8::US8_Depth => 7,
        }
    }
}
impl Default for US8 {
    fn default() -> Self {
        US8::US8_PerAccount
    }
}
#[derive(Clone)]
enum US6 {
    US6_Switched(US7),
    US6_Valued(US8),
    US6_Plain,
}
impl US6 {
    fn tag(&self) -> i32 {
        match self {
            US6::US6_Switched(..) => 0,
            US6::US6_Valued(..) => 1,
            US6::US6_Plain => 2,
        }
    }
}
impl Default for US6 {
    fn default() -> Self {
        US6::US6_Switched(<US7>::default())
    }
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
fn with_username_5(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: Rc<str>, mut v4: Rc<UH0>, mut v5: US1, mut v6: i32, mut v7: i32, mut v8: i32, mut v9: US2, mut v10: Rc<str>, mut v11: Rc<str>, mut v12: bool, mut v13: bool, mut v14: i32, mut v15: bool) -> US5 {
    let mut v16: US1 = v2(v3.clone());
    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("-"); } LIT.with(|lit| lit.clone()) };
    let mut v18: bool = v3.starts_with(&*v17);
    if v18 {
        let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unknown option "); } LIT.with(|lit| lit.clone()) };
        let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v3));
        US5::US5_Error(v20.clone())
    } else {
        match &v16 {
            US1::US1_None => {
                let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not an X username: '"); } LIT.with(|lit| lit.clone()) };
                let mut v26: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v3));
                let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
                let mut v28: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v27));
                US5::US5_Error(v28.clone())
            }
            US1::US1_Some(v22) => {
                let mut v22: Rc<str> = v22.clone();
                let mut v23: Rc<UH0> = Rc::new(UH0::UH0_Cons(v22.clone(), v4.clone()));
                US5::US5_Ok(v23.clone(), v5.clone(), v6, v7, v8, v9.clone(), v10.clone(), v11.clone(), v12, v13, v14, v15)
            }
        }
    }
}
fn apply_switch_6(mut v0: US7, mut v1: Rc<UH0>, mut v2: US1, mut v3: i32, mut v4: i32, mut v5: i32, mut v6: US2, mut v7: Rc<str>, mut v8: Rc<str>, mut v9: bool, mut v10: bool, mut v11: i32, mut v12: bool) -> US5 {
    match &v0 {
        US7::US7_Hints => {
            US5::US5_Ok(v1.clone(), v2.clone(), v3, v4, v5, v6.clone(), v7.clone(), v8.clone(), v9, v10, v11, true)
        }
        _ => {
            let (mut v18, mut v19, mut v20, mut v21): (Rc<str>, Rc<str>, bool, bool) = match &v0 {
                US7::US7_NoReplies => {
                    (v7.clone(), v8.clone(), true, v10)
                }
                _ => {
                    let (mut v14, mut v15, mut v16, mut v17): (Rc<str>, Rc<str>, bool, bool) = match &v0 {
                        US7::US7_NoReposts => {
                            (v7.clone(), v8.clone(), v9, true)
                        }
                        _ => {
                            (v7.clone(), v8.clone(), true, true)
                        }
                    };
                    (v14.clone(), v15.clone(), v16, v17)
                }
            };
            US5::US5_Ok(v1.clone(), v2.clone(), v3, v4, v5, v6.clone(), v18.clone(), v19.clone(), v20, v21, v11, v12)
        }
    }
}
fn with_date_8(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: US8, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<UH0>, mut v7: US1, mut v8: i32, mut v9: i32, mut v10: i32, mut v11: US2, mut v12: Rc<str>, mut v13: Rc<str>, mut v14: bool, mut v15: bool, mut v16: i32, mut v17: bool) -> US5 {
    let mut v18: US1 = v1(v5.clone());
    match &v18 {
        US1::US1_None => {
            let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" expects YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ, got '"); } LIT.with(|lit| lit.clone()) };
            let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v19));
            let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v5));
            let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
            let mut v23: Rc<str> = Rc::<str>::from(format!("{}{}", v21, v22));
            US5::US5_Error(v23.clone())
        }
        US1::US1_Some(v25) => {
            let mut v25: Rc<str> = v25.clone();
            let (mut v26, mut v27, mut v28, mut v29): (Rc<str>, Rc<str>, bool, bool) = match &v3 {
                US8::US8_StartTime => {
                    (v25.clone(), v13.clone(), v14, v15)
                }
                _ => {
                    (v12.clone(), v25.clone(), v14, v15)
                }
            };
            US5::US5_Ok(v6.clone(), v7.clone(), v8, v9, v10, v11.clone(), v26.clone(), v27.clone(), v28, v29, v16, v17)
        }
    }
}
fn with_following_9(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: Rc<str>, mut v4: Rc<UH0>, mut v5: US1, mut v6: i32, mut v7: i32, mut v8: i32, mut v9: US2, mut v10: Rc<str>, mut v11: Rc<str>, mut v12: bool, mut v13: bool, mut v14: i32, mut v15: bool) -> US5 {
    let mut v16: US1 = v2(v3.clone());
    match &v16 {
        US1::US1_None => {
            let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not an X username: '"); } LIT.with(|lit| lit.clone()) };
            let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v3));
            let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
            let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v19));
            US5::US5_Error(v20.clone())
        }
        US1::US1_Some(v22) => {
            let mut v22: Rc<str> = v22.clone();
            match &v5 {
                US1::US1_None => {
                    let mut v26: US1 = US1::US1_Some(v22.clone());
                    US5::US5_Ok(v4.clone(), v26.clone(), v6, v7, v8, v9.clone(), v10.clone(), v11.clone(), v12, v13, v14, v15)
                }
                US1::US1_Some(v23) => {
                    let mut v23: Rc<str> = v23.clone();
                    let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--following given twice"); } LIT.with(|lit| lit.clone()) };
                    US5::US5_Error(v24.clone())
                }
            }
        }
    }
}
fn bounded_10(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: US8, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<UH0>, mut v7: US1, mut v8: i32, mut v9: i32, mut v10: i32, mut v11: US2, mut v12: Rc<str>, mut v13: Rc<str>, mut v14: bool, mut v15: bool, mut v16: i32, mut v17: bool) -> US5 {
    let (mut v20, mut v21): (i32, i32) = match &v3 {
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
    let mut v22: US0 = v0(v5.clone());
    match &v22 {
        US0::US0_Some(v23) => {
            let mut v23: i32 = *v23;
            let mut v24: bool = v23 >= v20;
            let mut v26: bool = if v24 {
                let mut v25: bool = v23 <= v21;
                v25
            } else {
                false
            };
            if v26 {
                let (mut v64, mut v65, mut v66, mut v67, mut v68, mut v69, mut v70, mut v71, mut v72, mut v73, mut v74, mut v75): (Rc<UH0>, US1, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v3 {
                    US8::US8_PerAccount => {
                        (v6.clone(), v7.clone(), v23, v9, v10, v11.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17)
                    }
                    _ => {
                        let (mut v52, mut v53, mut v54, mut v55, mut v56, mut v57, mut v58, mut v59, mut v60, mut v61, mut v62, mut v63): (Rc<UH0>, US1, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v3 {
                            US8::US8_Limit => {
                                (v6.clone(), v7.clone(), v8, v23, v10, v11.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17)
                            }
                            _ => {
                                let (mut v40, mut v41, mut v42, mut v43, mut v44, mut v45, mut v46, mut v47, mut v48, mut v49, mut v50, mut v51): (Rc<UH0>, US1, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v3 {
                                    US8::US8_PerAuthor => {
                                        (v6.clone(), v7.clone(), v8, v9, v23, v11.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17)
                                    }
                                    _ => {
                                        let (mut v28, mut v29, mut v30, mut v31, mut v32, mut v33, mut v34, mut v35, mut v36, mut v37, mut v38, mut v39): (Rc<UH0>, US1, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v3 {
                                            US8::US8_Depth => {
                                                (v6.clone(), v7.clone(), v8, v9, v10, v11.clone(), v12.clone(), v13.clone(), v14, v15, v23, v17)
                                            }
                                            _ => {
                                                let mut v27: US2 = US2::US2_AtMost(v23);
                                                (v6.clone(), v7.clone(), v8, v9, v10, v27.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17)
                                            }
                                        };
                                        (v28.clone(), v29.clone(), v30, v31, v32, v33.clone(), v34.clone(), v35.clone(), v36, v37, v38, v39)
                                    }
                                };
                                (v40.clone(), v41.clone(), v42, v43, v44, v45.clone(), v46.clone(), v47.clone(), v48, v49, v50, v51)
                            }
                        };
                        (v52.clone(), v53.clone(), v54, v55, v56, v57.clone(), v58.clone(), v59.clone(), v60, v61, v62, v63)
                    }
                };
                US5::US5_Ok(v64.clone(), v65.clone(), v66, v67, v68, v69.clone(), v70.clone(), v71.clone(), v72, v73, v74, v75)
            } else {
                let mut v77: Rc<str> = Rc::<str>::from(format!("{:?}", v20));
                let mut v78: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" to "); } LIT.with(|lit| lit.clone()) };
                let mut v79: Rc<str> = Rc::<str>::from(format!("{}{}", v77, v78));
                let mut v80: Rc<str> = Rc::<str>::from(format!("{:?}", v21));
                let mut v81: Rc<str> = Rc::<str>::from(format!("{}{}", v79, v80));
                let mut v82: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" expects a number from "); } LIT.with(|lit| lit.clone()) };
                let mut v83: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v82));
                let mut v84: Rc<str> = Rc::<str>::from(format!("{}{}", v83, v81));
                let mut v85: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", got '"); } LIT.with(|lit| lit.clone()) };
                let mut v86: Rc<str> = Rc::<str>::from(format!("{}{}", v84, v85));
                let mut v87: Rc<str> = Rc::<str>::from(format!("{}{}", v86, v5));
                let mut v88: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
                let mut v89: Rc<str> = Rc::<str>::from(format!("{}{}", v87, v88));
                US5::US5_Error(v89.clone())
            }
        }
        _ => {
            let mut v92: Rc<str> = Rc::<str>::from(format!("{:?}", v20));
            let mut v93: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" to "); } LIT.with(|lit| lit.clone()) };
            let mut v94: Rc<str> = Rc::<str>::from(format!("{}{}", v92, v93));
            let mut v95: Rc<str> = Rc::<str>::from(format!("{:?}", v21));
            let mut v96: Rc<str> = Rc::<str>::from(format!("{}{}", v94, v95));
            let mut v97: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" expects a number from "); } LIT.with(|lit| lit.clone()) };
            let mut v98: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v97));
            let mut v99: Rc<str> = Rc::<str>::from(format!("{}{}", v98, v96));
            let mut v100: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", got '"); } LIT.with(|lit| lit.clone()) };
            let mut v101: Rc<str> = Rc::<str>::from(format!("{}{}", v99, v100));
            let mut v102: Rc<str> = Rc::<str>::from(format!("{}{}", v101, v5));
            let mut v103: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
            let mut v104: Rc<str> = Rc::<str>::from(format!("{}{}", v102, v103));
            US5::US5_Error(v104.clone())
        }
    }
}
fn apply_flag_7(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: US8, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<UH0>, mut v7: US1, mut v8: i32, mut v9: i32, mut v10: i32, mut v11: US2, mut v12: Rc<str>, mut v13: Rc<str>, mut v14: bool, mut v15: bool, mut v16: i32, mut v17: bool) -> US5 {
    match &v3 {
        US8::US8_EndTime => {
            with_date_8(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17)
        }
        US8::US8_Following => {
            with_following_9(v0.clone(), v1.clone(), v2.clone(), v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17)
        }
        US8::US8_MaxFollowing => {
            let mut v21: bool = v5.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("all"); } LIT.with(|lit| lit.clone()) };
            if v21 {
                let mut v22: US2 = US2::US2_AllFollowing;
                US5::US5_Ok(v6.clone(), v7.clone(), v8, v9, v10, v22.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17)
            } else {
                bounded_10(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17)
            }
        }
        US8::US8_StartTime => {
            with_date_8(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17)
        }
        _ => {
            bounded_10(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11.clone(), v12.clone(), v13.clone(), v14, v15, v16, v17)
        }
    }
}
fn advance_4(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: Rc<UH0>, mut v4: US1, mut v5: i32, mut v6: i32, mut v7: i32, mut v8: US2, mut v9: Rc<str>, mut v10: Rc<str>, mut v11: bool, mut v12: bool, mut v13: i32, mut v14: bool, mut v15: Rc<str>, mut v16: Rc<UH0>) -> (US5, Rc<UH0>) {
    let mut v17: bool = v15.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--no-replies"); } LIT.with(|lit| lit.clone()) };
    let mut v65: US6 = if v17 {
        let mut v18: US7 = US7::US7_NoReplies;
        US6::US6_Switched(v18.clone())
    } else {
        let mut v20: bool = v15.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--no-reposts"); } LIT.with(|lit| lit.clone()) };
        if v20 {
            let mut v21: US7 = US7::US7_NoReposts;
            US6::US6_Switched(v21.clone())
        } else {
            let mut v23: bool = v15.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--originals"); } LIT.with(|lit| lit.clone()) };
            if v23 {
                let mut v24: US7 = US7::US7_Originals;
                US6::US6_Switched(v24.clone())
            } else {
                let mut v26: bool = v15.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--hints"); } LIT.with(|lit| lit.clone()) };
                if v26 {
                    let mut v27: US7 = US7::US7_Hints;
                    US6::US6_Switched(v27.clone())
                } else {
                    let mut v29: bool = v15.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--per-account"); } LIT.with(|lit| lit.clone()) };
                    if v29 {
                        let mut v30: US8 = US8::US8_PerAccount;
                        US6::US6_Valued(v30.clone())
                    } else {
                        let mut v32: bool = v15.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--limit"); } LIT.with(|lit| lit.clone()) };
                        if v32 {
                            let mut v33: US8 = US8::US8_Limit;
                            US6::US6_Valued(v33.clone())
                        } else {
                            let mut v35: bool = v15.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--per-author"); } LIT.with(|lit| lit.clone()) };
                            if v35 {
                                let mut v36: US8 = US8::US8_PerAuthor;
                                US6::US6_Valued(v36.clone())
                            } else {
                                let mut v38: bool = v15.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--depth"); } LIT.with(|lit| lit.clone()) };
                                if v38 {
                                    let mut v39: US8 = US8::US8_Depth;
                                    US6::US6_Valued(v39.clone())
                                } else {
                                    let mut v41: bool = v15.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--max-following"); } LIT.with(|lit| lit.clone()) };
                                    if v41 {
                                        let mut v42: US8 = US8::US8_MaxFollowing;
                                        US6::US6_Valued(v42.clone())
                                    } else {
                                        let mut v44: bool = v15.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--following"); } LIT.with(|lit| lit.clone()) };
                                        if v44 {
                                            let mut v45: US8 = US8::US8_Following;
                                            US6::US6_Valued(v45.clone())
                                        } else {
                                            let mut v47: bool = v15.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--start-time"); } LIT.with(|lit| lit.clone()) };
                                            if v47 {
                                                let mut v48: US8 = US8::US8_StartTime;
                                                US6::US6_Valued(v48.clone())
                                            } else {
                                                let mut v50: bool = v15.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--end-time"); } LIT.with(|lit| lit.clone()) };
                                                if v50 {
                                                    let mut v51: US8 = US8::US8_EndTime;
                                                    US6::US6_Valued(v51.clone())
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
    };
    match &v65 {
        US6::US6_Plain => {
            let mut v80: US5 = with_username_5(v0.clone(), v1.clone(), v2.clone(), v15.clone(), v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14);
            (v80.clone(), v16.clone())
        }
        US6::US6_Switched(v66) => {
            let mut v66: US7 = v66.clone();
            let mut v67: US5 = apply_switch_6(v66.clone(), v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14);
            (v67.clone(), v16.clone())
        }
        US6::US6_Valued(v68) => {
            let mut v68: US8 = v68.clone();
            match &*v16 {
                UH0::UH0_Cons(v73, v74) => {
                    let mut v73: Rc<str> = v73.clone();
                    let mut v74: Rc<UH0> = v74.clone();
                    let mut v75: US5 = apply_flag_7(v0.clone(), v1.clone(), v2.clone(), v68.clone(), v15.clone(), v73.clone(), v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14);
                    (v75.clone(), v74.clone())
                }
                UH0::UH0_Nil => {
                    let mut v69: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" needs a value"); } LIT.with(|lit| lit.clone()) };
                    let mut v70: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v69));
                    let mut v71: US5 = US5::US5_Error(v70.clone());
                    let mut v72: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    (v71.clone(), v72.clone())
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
fn finish_12(mut v0: Rc<UH0>, mut v1: US1, mut v2: i32, mut v3: i32, mut v4: i32, mut v5: US2, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: bool, mut v9: bool, mut v10: i32, mut v11: bool) -> US3 {
    let mut v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v13: Rc<UH0> = method13(v0.clone(), v12.clone());
    match &v1 {
        US1::US1_None => {
            match &*v13 {
                UH0::UH0_Nil => {
                    let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("name at least one account, or --following USERNAME"); } LIT.with(|lit| lit.clone()) };
                    US3::US3_Rejected(v20.clone())
                }
                _ => {
                    let mut v22: US4 = US4::US4_Accounts(v13.clone());
                    US3::US3_ShowTimeline(v22.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11)
                }
            }
        }
        US1::US1_Some(v14) => {
            let mut v14: Rc<str> = v14.clone();
            match &*v13 {
                UH0::UH0_Nil => {
                    let mut v15: US4 = US4::US4_FollowingOf(v14.clone());
                    US3::US3_ShowTimeline(v15.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11)
                }
                _ => {
                    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--following takes one account and no other usernames"); } LIT.with(|lit| lit.clone()) };
                    US3::US3_Rejected(v17.clone())
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
fn capped_11(mut v0: Rc<UH0>, mut v1: US1, mut v2: i32, mut v3: i32, mut v4: i32, mut v5: US2, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: bool, mut v9: bool, mut v10: i32, mut v11: bool) -> US3 {
    let mut v12: i32 = 0i32;
    let mut v13: i32 = method14(v0.clone(), v12);
    let mut v14: bool = v13 > 100i32;
    if v14 {
        let mut v15: Rc<str> = Rc::<str>::from(format!("{:?}", 100i32));
        let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("at most "); } LIT.with(|lit| lit.clone()) };
        let mut v17: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v15));
        let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" accounts per run"); } LIT.with(|lit| lit.clone()) };
        let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v18));
        US3::US3_Rejected(v19.clone())
    } else {
        finish_12(v0.clone(), v1.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11)
    }
}
fn parse_from_3(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: Rc<UH0>, mut v4: US1, mut v5: i32, mut v6: i32, mut v7: i32, mut v8: US2, mut v9: Rc<str>, mut v10: Rc<str>, mut v11: bool, mut v12: bool, mut v13: i32, mut v14: bool, mut v15: Rc<UH0>) -> US3 {
    loop {
        match &*v15 {
            UH0::UH0_Cons(v17, v18) => {
                let mut v17: Rc<str> = v17.clone();
                let mut v18: Rc<UH0> = v18.clone();
                let (mut v19, mut v20): (US5, Rc<UH0>) = advance_4(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14, v17.clone(), v18.clone());
                match &v19 {
                    US5::US5_Error(v34) => {
                        let mut v34: Rc<str> = v34.clone();
                        return US3::US3_Rejected(v34.clone());
                    }
                    US5::US5_Ok(v21, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32) => {
                        let mut v21: Rc<UH0> = v21.clone();
                        let mut v22: US1 = v22.clone();
                        let mut v23: i32 = *v23;
                        let mut v24: i32 = *v24;
                        let mut v25: i32 = *v25;
                        let mut v26: US2 = v26.clone();
                        let mut v27: Rc<str> = v27.clone();
                        let mut v28: Rc<str> = v28.clone();
                        let mut v29: bool = *v29;
                        let mut v30: bool = *v30;
                        let mut v31: i32 = *v31;
                        let mut v32: bool = *v32;
                        (v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15) = (v0.clone(), v1.clone(), v2.clone(), v21.clone(), v22.clone(), v23, v24, v25, v26.clone(), v27.clone(), v28.clone(), v29, v30, v31, v32, v20.clone());
                        continue;
                    }
                }
            }
            UH0::UH0_Nil => {
                return capped_11(v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14);
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
fn parse_args_with_2(mut v0: Rc<dyn Fn(Rc<str>) -> US0>, mut v1: Rc<dyn Fn(Rc<str>) -> US1>, mut v2: Rc<dyn Fn(Rc<str>) -> US1>, mut v3: Rc<UH0>, mut v4: US1, mut v5: i32, mut v6: i32, mut v7: i32, mut v8: US2, mut v9: Rc<str>, mut v10: Rc<str>, mut v11: bool, mut v12: bool, mut v13: i32, mut v14: bool, mut v15: Rc<UH0>) -> US3 {
    match &*v15 {
        UH0::UH0_Cons(v16, v17) => {
            let mut v16: Rc<str> = v16.clone();
            let mut v17: Rc<UH0> = v17.clone();
            let mut v18: bool = false;
            let mut v19: bool = method15(v15.clone(), v18);
            let mut v20: bool = v19 == false;
            if v20 {
                let mut v21: bool = v16.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("timeline"); } LIT.with(|lit| lit.clone()) };
                if v21 {
                    parse_from_3(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14, v17.clone())
                } else {
                    let mut v23: bool = v16.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post"); } LIT.with(|lit| lit.clone()) };
                    if v23 {
                        match &*v17 {
                            UH0::UH0_Cons(v24, v25) => {
                                let mut v24: Rc<str> = v24.clone();
                                let mut v25: Rc<UH0> = v25.clone();
                                match &*v25 {
                                    UH0::UH0_Nil => {
                                        let mut v26: bool = v24.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                                        let mut v27: bool = v26 != true;
                                        if v27 {
                                            US3::US3_PublishPost(v24.clone())
                                        } else {
                                            let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                            let mut v30: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v29));
                                            US3::US3_Rejected(v30.clone())
                                        }
                                    }
                                    _ => {
                                        let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                        let mut v34: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v33));
                                        US3::US3_Rejected(v34.clone())
                                    }
                                }
                            }
                            _ => {
                                let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                let mut v38: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v37));
                                US3::US3_Rejected(v38.clone())
                            }
                        }
                    } else {
                        let mut v41: bool = v16.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("delete"); } LIT.with(|lit| lit.clone()) };
                        if v41 {
                            match &*v17 {
                                UH0::UH0_Cons(v42, v43) => {
                                    let mut v42: Rc<str> = v42.clone();
                                    let mut v43: Rc<UH0> = v43.clone();
                                    match &*v43 {
                                        UH0::UH0_Nil => {
                                            let mut v44: bool = v42.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                                            let mut v45: bool = v44 != true;
                                            if v45 {
                                                US3::US3_RemovePost(v42.clone())
                                            } else {
                                                let mut v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                                let mut v48: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v47));
                                                US3::US3_Rejected(v48.clone())
                                            }
                                        }
                                        _ => {
                                            let mut v51: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                            let mut v52: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v51));
                                            US3::US3_Rejected(v52.clone())
                                        }
                                    }
                                }
                                _ => {
                                    let mut v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                    let mut v56: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v55));
                                    US3::US3_Rejected(v56.clone())
                                }
                            }
                        } else {
                            let mut v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unknown command "); } LIT.with(|lit| lit.clone()) };
                            let mut v60: Rc<str> = Rc::<str>::from(format!("{}{}", v59, v16));
                            let mut v61: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; try: xc timeline"); } LIT.with(|lit| lit.clone()) };
                            let mut v62: Rc<str> = Rc::<str>::from(format!("{}{}", v60, v61));
                            US3::US3_Rejected(v62.clone())
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
fn fields_of_16(mut v0: US3) -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) {
    let (mut v112, mut v113, mut v114, mut v115, mut v116, mut v117, mut v118, mut v119, mut v120, mut v121, mut v122, mut v123, mut v124, mut v125): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v0 {
        US3::US3_ShowTimeline(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11) => {
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
            let mut v14: i32 = match &v5 {
                US2::US2_AllFollowing => {
                    -1i32
                }
                US2::US2_AtMost(v12) => {
                    let mut v12: i32 = *v12;
                    v12
                }
            };
            match &v1 {
                US4::US4_Accounts(v15) => {
                    let mut v15: Rc<UH0> = v15.clone();
                    let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let (mut v17, mut v18): (Rc<str>, Rc<str>) = method17(v15.clone(), v16.clone());
                    (0i32, v16.clone(), false, v17.clone(), v2, v3, v4, v14, v6.clone(), v7.clone(), v8, v9, v10, v11)
                }
                _ => {
                    let (mut v21, mut v22, mut v23, mut v24, mut v25, mut v26, mut v27, mut v28, mut v29, mut v30, mut v31, mut v32, mut v33, mut v34): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v1 {
                        US4::US4_FollowingOf(v19) => {
                            let mut v19: Rc<str> = v19.clone();
                            let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                            (0i32, v20.clone(), true, v19.clone(), v2, v3, v4, v14, v6.clone(), v7.clone(), v8, v9, v10, v11)
                        }
                        _ => unreachable!(),
                    };
                    (v21, v22.clone(), v23, v24.clone(), v25, v26, v27, v28, v29.clone(), v30.clone(), v31, v32, v33, v34)
                }
            }
        }
        _ => {
            let (mut v98, mut v99, mut v100, mut v101, mut v102, mut v103, mut v104, mut v105, mut v106, mut v107, mut v108, mut v109, mut v110, mut v111): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v0 {
                US3::US3_PublishPost(v49) => {
                    let mut v49: Rc<str> = v49.clone();
                    let mut v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    (1i32, v49.clone(), false, v50.clone(), 5i32, 20i32, 0i32, 20i32, v50.clone(), v50.clone(), false, false, 0i32, false)
                }
                _ => {
                    let (mut v84, mut v85, mut v86, mut v87, mut v88, mut v89, mut v90, mut v91, mut v92, mut v93, mut v94, mut v95, mut v96, mut v97): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v0 {
                        US3::US3_RemovePost(v51) => {
                            let mut v51: Rc<str> = v51.clone();
                            let mut v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                            (2i32, v51.clone(), false, v52.clone(), 5i32, 20i32, 0i32, 20i32, v52.clone(), v52.clone(), false, false, 0i32, false)
                        }
                        _ => {
                            let (mut v70, mut v71, mut v72, mut v73, mut v74, mut v75, mut v76, mut v77, mut v78, mut v79, mut v80, mut v81, mut v82, mut v83): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v0 {
                                US3::US3_ShowHelp => {
                                    let mut v53: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                                    (3i32, v53.clone(), false, v53.clone(), 5i32, 20i32, 0i32, 20i32, v53.clone(), v53.clone(), false, false, 0i32, false)
                                }
                                _ => {
                                    let (mut v56, mut v57, mut v58, mut v59, mut v60, mut v61, mut v62, mut v63, mut v64, mut v65, mut v66, mut v67, mut v68, mut v69): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v0 {
                                        US3::US3_Rejected(v54) => {
                                            let mut v54: Rc<str> = v54.clone();
                                            let mut v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                                            (4i32, v54.clone(), false, v55.clone(), 5i32, 20i32, 0i32, 20i32, v55.clone(), v55.clone(), false, false, 0i32, false)
                                        }
                                        _ => unreachable!(),
                                    };
                                    (v56, v57.clone(), v58, v59.clone(), v60, v61, v62, v63, v64.clone(), v65.clone(), v66, v67, v68, v69)
                                }
                            };
                            (v70, v71.clone(), v72, v73.clone(), v74, v75, v76, v77, v78.clone(), v79.clone(), v80, v81, v82, v83)
                        }
                    };
                    (v84, v85.clone(), v86, v87.clone(), v88, v89, v90, v91, v92.clone(), v93.clone(), v94, v95, v96, v97)
                }
            };
            (v98, v99.clone(), v100, v101.clone(), v102, v103, v104, v105, v106.clone(), v107.clone(), v108, v109, v110, v111)
        }
    };
    (v112, v113.clone(), v114, v115.clone(), v116, v117, v118, v119, v120.clone(), v121.clone(), v122, v123, v124, v125)
}
fn parsed_fields_0() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) {
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
    let mut v20: US3 = parse_args_with_2(v4.clone(), v5.clone(), v6.clone(), v9.clone(), v10.clone(), v11, v12, v13, v15.clone(), v7.clone(), v8.clone(), v16, v17, v18, v19, v3.clone());
    let (mut v21, mut v22, mut v23, mut v24, mut v25, mut v26, mut v27, mut v28, mut v29, mut v30, mut v31, mut v32, mut v33, mut v34): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) = fields_of_16(v20.clone());
    (v21, v22.clone(), v23, v24.clone(), v25, v26, v27, v28, v29.clone(), v30.clone(), v31, v32, v33, v34)
}
fn closure0() -> Rc<dyn Fn() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool)> = Rc::new(move || -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) {
        let (mut v0, mut v1, mut v2, mut v3, mut v4, mut v5, mut v6, mut v7, mut v8, mut v9, mut v10, mut v11, mut v12, mut v13): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) = parsed_fields_0();
        (v0, v1.clone(), v2, v3.clone(), v4, v5, v6, v7, v8.clone(), v9.clone(), v10, v11, v12, v13)
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
        let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n"); } LIT.with(|lit| lit.clone()) };
        let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc timeline [options] [--max-following N|all] --following USERNAME\n"); } LIT.with(|lit| lit.clone()) };
        let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n       xc timeline [options] [--max-following N|all] --following USERNAME\n"); } LIT.with(|lit| lit.clone()) };
        let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n       xc timeline [options] [--max-following N|all] --following USERNAME\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("env:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n       xc timeline [options] [--max-following N|all] --following USERNAME\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)\nenv:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n       xc timeline [options] [--max-following N|all] --following USERNAME\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)\nenv:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n       --start-time DATE posts at or after DATE (YYYY-MM-DD, local midnight, or YYYY-MM-DDTHH:MM:SSZ)\n       --end-time DATE   posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n"); } LIT.with(|lit| lit.clone()) };
        let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --hints           media alt text and url titles under each post\n"); } LIT.with(|lit| lit.clone()) };
        let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n       --hints           media alt text and url titles under each post\n"); } LIT.with(|lit| lit.clone()) };
        let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n       xc timeline [options] [--max-following N|all] --following USERNAME\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)\nenv:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n       --start-time DATE posts at or after DATE (YYYY-MM-DD, local midnight, or YYYY-MM-DDTHH:MM:SSZ)\n       --end-time DATE   posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n       --hints           media alt text and url titles under each post\n"); } LIT.with(|lit| lit.clone()) };
        let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --max-following N accounts followed by USERNAME to include, or all (default 20)"); } LIT.with(|lit| lit.clone()) };
        let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] USERNAME...\n       xc timeline [options] [--max-following N|all] --following USERNAME\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_OAUTH2_ACCESS_TOKEN)\nenv:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n       --start-time DATE posts at or after DATE (YYYY-MM-DD, local midnight, or YYYY-MM-DDTHH:MM:SSZ)\n       --end-time DATE   posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n       --hints           media alt text and url titles under each post\n       --max-following N accounts followed by USERNAME to include, or all (default 20)"); } LIT.with(|lit| lit.clone()) };
        v24.clone()
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_parse_os_args() -> (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) {
    closure0()()
}
pub fn xc_usage() -> Rc<str> {
    closure4()()
}
