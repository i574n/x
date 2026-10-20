#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
fn string_slice(value: &str, from: i64, to: i64) -> Rc<str> {
    let bytes = value.as_bytes();
    let length = bytes.len() as i64;
    if from < 0 || from > length || to < from - 1 || to >= length { std::process::abort(); }
    if to < from { return { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }; }
    if (bytes[from as usize] & 0xC0) == 0x80 || (to + 1 < length && (bytes[(to + 1) as usize] & 0xC0) == 0x80) { std::process::exit(3); }
    let slice = &bytes[from as usize..(to + 1) as usize];
    match std::str::from_utf8(slice) { Ok(text) => Rc::<str>::from(text), Err(error) => Rc::<str>::from(std::str::from_utf8(&slice[..error.valid_up_to()]).unwrap_or("")) }
}
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<UH0>),
}
fn missing_bearer_1() -> i32 {
    let mut v0: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: X_BEARER_TOKEN is not set; generate the app's bearer token at https://console.x.com"); } LIT.with(|lit| lit.clone()) };
    eprintln!("{}", v0);
    3i32
}
fn failed_2(mut v0: Rc<str>) -> i32 {
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
    let mut v2: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v0));
    eprintln!("{}", v2);
    4i32
}
fn referenced_docs_4(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: i32, mut v9: Rc<str>, mut v10: Rc<str>, mut v11: bool, mut v12: bool, mut v13: i32, mut v14: bool) -> (Rc<str>, Rc<str>) {
    let mut v15: bool = v4.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v17: bool = if v15 {
        true
    } else {
        let mut v16: bool = v13 == 0i32;
        v16
    };
    if v17 {
        (v2.clone(), v4.clone())
    } else {
        let (mut v18, mut v19, mut v20): (Rc<str>, Rc<str>, Rc<str>) = xc_refs::xc_refs(&*v0, &*v1, &*v5, &*v6, &*v7, v13, v14);
        let mut v21: bool = v18.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v27: Rc<str> = if v21 {
            v2.clone()
        } else {
            let mut v22: bool = v2.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            if v22 {
                v18.clone()
            } else {
                let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                let mut v24: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v23));
                let mut v25: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v18));
                v25.clone()
            }
        };
        let mut v28: bool = v19.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v30: bool = if v28 {
            true
        } else {
            let mut v29: bool = v20.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v29
        };
        if v30 {
            (v27.clone(), v19.clone())
        } else {
            let (mut v31, mut v32, mut v33): (i32, Rc<str>, Rc<str>) = xc_users::xc_users_by_ids(&*v0, &*v1, &*v20);
            let mut v34: bool = v31 == 0i32;
            if v34 {
                let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",{\"role\":\"users\",\"author\":\"\",\"doc\":"); } LIT.with(|lit| lit.clone()) };
                let mut v36: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v32));
                let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
                let mut v38: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v37));
                let mut v39: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v38));
                let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (v39.clone(), v40.clone())
            } else {
                (v27.clone(), v33.clone())
            }
        }
    }
}
fn shown_timeline_3(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: i32, mut v6: Rc<str>, mut v7: bool, mut v8: Rc<str>, mut v9: i32, mut v10: i32, mut v11: i32, mut v12: i32, mut v13: Rc<str>, mut v14: Rc<str>, mut v15: bool, mut v16: bool, mut v17: i32, mut v18: bool, mut v19: bool) -> i32 {
    let (mut v20, mut v21, mut v22, mut v23, mut v24, mut v25): (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) = xc_fetch::xc_fetch(&*v0, &*v1, &*v2, v9, &*v13, &*v14, v15, v16, v17, v18);
    let (mut v26, mut v27): (Rc<str>, Rc<str>) = referenced_docs_4(v0.clone(), v1.clone(), v20.clone(), v21.clone(), v22.clone(), v23.clone(), v24.clone(), v25.clone(), v9, v13.clone(), v14.clone(), v15, v16, v17, v18);
    let mut v28: bool = v3.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v34: Rc<str> = if v28 {
        v21.clone()
    } else {
        let mut v29: bool = v21.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        if v29 {
            v3.clone()
        } else {
            let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            let mut v31: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v30));
            let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v31, v21));
            v32.clone()
        }
    };
    let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
    let mut v36: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v26));
    let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
    let mut v38: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v37));
    let mut v39: Rc<str> = xc_digest::xc_digest(&*v38);
    let (mut v44, mut v45): (Rc<str>, i32) = if v19 {
        let (mut v40, mut v41): (Rc<str>, i32) = xc_jsonl::xc_jsonl(&*v39, v10, v11, v17);
        (v40.clone(), v41)
    } else {
        let (mut v42, mut v43): (Rc<str>, i32) = xc_view::xc_view(&*v39, v10, v11, v17, v18);
        (v42.clone(), v43)
    };
    let mut v46: bool = v34.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    if v46 {
        let mut v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
        let mut v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\nxc: "); } LIT.with(|lit| lit.clone()) };
        let mut v49: Rc<str> = Rc::<str>::from(v34.replace(&*v47, &*v48));
        let mut v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
        let mut v51: Rc<str> = Rc::<str>::from(format!("{}{}", v50, v49));
        eprintln!("{}", v51);
        ()
    };
    let mut v52: bool = v27.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v54: bool = if v52 {
        let mut v53: bool = v45 == 0i32;
        v53
    } else {
        false
    };
    if v54 {
        let mut v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: no posts matched"); } LIT.with(|lit| lit.clone()) };
        eprintln!("{}", v55);
        ()
    };
    let mut v56: bool = v44.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    if v56 {
        println!("{}", v44);
        ()
    };
    if v52 {
        0i32
    } else {
        let mut v57: bool = v45 == 0i32;
        if v57 {
            failed_2(v27.clone())
        } else {
            let mut v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("stopped early, showing what was read before: "); } LIT.with(|lit| lit.clone()) };
            let mut v60: Rc<str> = Rc::<str>::from(format!("{}{}", v59, v27));
            failed_2(v60.clone())
        }
    }
}
fn get_environment_variable_6(mut v0: Rc<str>) -> Rc<str> {
    let mut v1: Rc<str> = Rc::<str>::from(std::env::var(&*v0).unwrap_or_default());
    v1.clone()
}
fn method7(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> i32 {
    loop {
        let mut v3: bool = v2 >= v1;
        if v3 {
            return v1;
        } else {
            let mut v4: u8 = v0.clone().as_bytes()[v2 as usize];
            let mut v5: bool = v4 == b' ';
            let mut v11: bool = if v5 {
                true
            } else {
                let mut v6: bool = v4 == b'\t';
                if v6 {
                    true
                } else {
                    let mut v7: bool = v4 == b'\r';
                    if v7 {
                        true
                    } else {
                        let mut v8: bool = v4 == b'\n';
                        v8
                    }
                }
            };
            if v11 {
                let mut v12: i32 = v2.wrapping_add(1i32);
                (v0, v1, v2) = (v0.clone(), v1, v12);
                continue;
            } else {
                return v2;
            }
        }
    }
}
fn method8(mut v0: Rc<str>, mut v1: i32) -> i32 {
    loop {
        let mut v2: bool = v1 <= 0i32;
        if v2 {
            return -1i32;
        } else {
            let mut v3: i32 = v1.wrapping_sub(1i32);
            let mut v4: u8 = v0.clone().as_bytes()[v3 as usize];
            let mut v5: bool = v4 == b' ';
            let mut v11: bool = if v5 {
                true
            } else {
                let mut v6: bool = v4 == b'\t';
                if v6 {
                    true
                } else {
                    let mut v7: bool = v4 == b'\r';
                    if v7 {
                        true
                    } else {
                        let mut v8: bool = v4 == b'\n';
                        v8
                    }
                }
            };
            if v11 {
                (v0, v1) = (v0.clone(), v3);
                continue;
            } else {
                return v3;
            }
        }
    }
}
fn env_or_5(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<str> {
    let mut v2: Rc<str> = get_environment_variable_6(v0.clone());
    let mut v3: i32 = (v2.clone().len() as i32);
    let mut v4: i32 = 0i32;
    let mut v5: i32 = method7(v2.clone(), v3, v4);
    let mut v6: i32 = v3.wrapping_sub(1i32);
    let mut v7: Rc<str> = string_slice(&v2.clone(), v5 as i64, v6 as i64);
    let mut v8: i32 = (v7.clone().len() as i32);
    let mut v9: i32 = method8(v7.clone(), v8);
    let mut v10: Rc<str> = string_slice(&v7.clone(), 0i32 as i64, v9 as i64);
    let mut v11: bool = v10.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    if v11 {
        v1.clone()
    } else {
        v10.clone()
    }
}
fn split_on_10(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let mut v2: i32 = v1.find(&*v0).map(|i| i as i32).unwrap_or(-1);
    let mut v3: bool = v2 < 0i32;
    if v3 {
        let mut v4: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1.clone(), v4.clone()))
    } else {
        let mut v6: Rc<str> = Rc::<str>::from(&(v1)[((0i32) as usize)..(((0i32) + (v2)) as usize)]);
        let mut v7: i32 = v2.wrapping_add(1i32);
        let mut v8: i32 = (v1.clone().len() as i32);
        let mut v9: i32 = v8.wrapping_sub(v2);
        let mut v10: i32 = v9.wrapping_sub(1i32);
        let mut v11: Rc<str> = Rc::<str>::from(&(v1)[((v7) as usize)..(((v7) + (v10)) as usize)]);
        let mut v12: Rc<UH0> = split_on_10(v0.clone(), v11.clone());
        Rc::new(UH0::UH0_Cons(v6.clone(), v12.clone()))
    }
}
fn method11(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
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
fn home_plan_9(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: i32) -> (Rc<str>, Rc<str>, Rc<str>) {
    let (mut v4, mut v5, mut v6, mut v7): (i32, Rc<str>, Rc<str>, Rc<str>) = xc_users::xc_users_named(&*v0, &*v1, &*v2);
    let mut v8: bool = v4 != 0i32;
    let (mut v56, mut v57, mut v58): (Rc<str>, Rc<str>, Rc<str>) = if v8 {
        let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        (v9.clone(), v9.clone(), v7.clone())
    } else {
        let mut v10: bool = v5.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let (mut v53, mut v54, mut v55): (Rc<str>, Rc<str>, Rc<str>) = if v10 {
            let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", @"); } LIT.with(|lit| lit.clone()) };
            let mut v13: Rc<str> = Rc::<str>::from(v2.replace(&*v11, &*v12));
            let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
            let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v13));
            let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v16.clone(), v16.clone(), v15.clone())
        } else {
            let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let mut v18: i32 = v5.find(&*v17).map(|i| i as i32).unwrap_or(-1);
            let mut v19: Rc<str> = Rc::<str>::from(&(v5)[((0i32) as usize)..(((0i32) + (v18)) as usize)]);
            let mut v20: i32 = v18.wrapping_add(1i32);
            let mut v21: i32 = (v5.clone().len() as i32);
            let mut v22: i32 = v21.wrapping_sub(v18);
            let mut v23: i32 = v22.wrapping_sub(1i32);
            let mut v24: Rc<str> = Rc::<str>::from(&(v5)[((v20) as usize)..(((v20) + (v23)) as usize)]);
            let (mut v25, mut v26, mut v27): (i32, Rc<str>, Rc<str>) = xc_users::xc_users_followed(&*v0, &*v1, &*v19, v3);
            let mut v28: bool = v25 != 0i32;
            let (mut v50, mut v51, mut v52): (Rc<str>, Rc<str>, Rc<str>) = if v28 {
                let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (v29.clone(), v29.clone(), v27.clone())
            } else {
                let mut v30: bool = v26.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v34: Rc<str> = if v30 {
                    v5.clone()
                } else {
                    let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                    let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v31));
                    let mut v33: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v26));
                    v33.clone()
                };
                let mut v38: Rc<UH0> = if v30 {
                    { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
                } else {
                    let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                    split_on_10(v36.clone(), v26.clone())
                };
                let mut v39: i32 = 0i32;
                let mut v40: i32 = method11(v38.clone(), v39);
                let mut v41: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("home timeline of @"); } LIT.with(|lit| lit.clone()) };
                let mut v42: Rc<str> = Rc::<str>::from(format!("{}{}", v41, v24));
                let mut v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" from "); } LIT.with(|lit| lit.clone()) };
                let mut v44: Rc<str> = Rc::<str>::from(format!("{}{}", v42, v43));
                let mut v45: Rc<str> = Rc::<str>::from(format!("{:?}", v40));
                let mut v46: Rc<str> = Rc::<str>::from(format!("{}{}", v44, v45));
                let mut v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" followed accounts"); } LIT.with(|lit| lit.clone()) };
                let mut v48: Rc<str> = Rc::<str>::from(format!("{}{}", v46, v47));
                let mut v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (v34.clone(), v48.clone(), v49.clone())
            };
            (v50.clone(), v51.clone(), v52.clone())
        };
        (v53.clone(), v54.clone(), v55.clone())
    };
    (v56.clone(), v57.clone(), v58.clone())
}
fn method13(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method13(v3.clone(), v1.clone());
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", @"); } LIT.with(|lit| lit.clone()) };
            let mut v7: Rc<str> = Rc::<str>::from(v2.replace(&*v5, &*v6));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
            let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v7));
            Rc::new(UH0::UH0_Cons(v9.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method14(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method14(v4.clone(), v1.clone(), v2.clone());
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v6));
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v5));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            (v8.clone(), v9.clone())
        }
        _ => {
            let (mut v10, mut v11): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1.clone(), v2.clone())
                }
                _ => unreachable!(),
            };
            (v10.clone(), v11.clone())
        }
    };
    (v12.clone(), v13.clone())
}
fn account_plan_12(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>, Rc<str>) {
    let (mut v3, mut v4, mut v5, mut v6): (i32, Rc<str>, Rc<str>, Rc<str>) = xc_users::xc_users_named(&*v0, &*v1, &*v2);
    let mut v7: bool = v3 != 0i32;
    let (mut v29, mut v30, mut v31): (Rc<str>, Rc<str>, Rc<str>) = if v7 {
        let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        (v8.clone(), v8.clone(), v6.clone())
    } else {
        let mut v9: bool = v4.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let (mut v26, mut v27, mut v28): (Rc<str>, Rc<str>, Rc<str>) = if v9 {
            let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", @"); } LIT.with(|lit| lit.clone()) };
            let mut v12: Rc<str> = Rc::<str>::from(v5.replace(&*v10, &*v11));
            let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
            let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v12));
            let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v15.clone(), v15.clone(), v14.clone())
        } else {
            let mut v16: bool = v5.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v20: Rc<UH0> = if v16 {
                { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
            } else {
                let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                split_on_10(v18.clone(), v5.clone())
            };
            let mut v21: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v22: Rc<UH0> = method13(v20.clone(), v21.clone());
            let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v24, mut v25): (Rc<str>, Rc<str>) = method14(v22.clone(), v23.clone(), v23.clone());
            (v4.clone(), v24.clone(), v23.clone())
        };
        (v26.clone(), v27.clone(), v28.clone())
    };
    (v29.clone(), v30.clone(), v31.clone())
}
fn run_timeline_0(mut v0: i32, mut v1: Rc<str>, mut v2: bool, mut v3: Rc<str>, mut v4: i32, mut v5: i32, mut v6: i32, mut v7: i32, mut v8: Rc<str>, mut v9: Rc<str>, mut v10: bool, mut v11: bool, mut v12: i32, mut v13: bool, mut v14: bool) -> i32 {
    let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
    let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
    let mut v17: Rc<str> = env_or_5(v15.clone(), v16.clone());
    let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_BEARER_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v20: Rc<str> = env_or_5(v18.clone(), v19.clone());
    let mut v21: bool = v20.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    if v21 {
        missing_bearer_1()
    } else {
        let (mut v29, mut v30, mut v31): (Rc<str>, Rc<str>, Rc<str>) = if v2 {
            let (mut v23, mut v24, mut v25): (Rc<str>, Rc<str>, Rc<str>) = home_plan_9(v17.clone(), v20.clone(), v3.clone(), v7);
            (v23.clone(), v24.clone(), v25.clone())
        } else {
            let (mut v26, mut v27, mut v28): (Rc<str>, Rc<str>, Rc<str>) = account_plan_12(v17.clone(), v20.clone(), v3.clone());
            (v26.clone(), v27.clone(), v28.clone())
        };
        let mut v32: bool = v31.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        if v32 {
            failed_2(v31.clone())
        } else {
            shown_timeline_3(v17.clone(), v20.clone(), v29.clone(), v30.clone(), v31.clone(), v0, v1.clone(), v2, v3.clone(), v4, v5, v6, v7, v8.clone(), v9.clone(), v10, v11, v12, v13, v14)
        }
    }
}
fn reported_16(mut v0: i32, mut v1: Rc<str>) -> i32 {
    let mut v2: bool = v0 == 0i32;
    if v2 {
        println!("{}", v1);
        ()
    } else {
        let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
        let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v1));
        eprintln!("{}", v4);
        ()
    };
    v0
}
fn run_refresh_15(mut v0: Rc<str>) -> i32 {
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_CLIENT_ID"); } LIT.with(|lit| lit.clone()) };
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v3: Rc<str> = env_or_5(v1.clone(), v2.clone());
    let mut v4: bool = v3.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v8: bool = if v4 {
        let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_CLIENT_SECRET"); } LIT.with(|lit| lit.clone()) };
        let mut v6: Rc<str> = env_or_5(v5.clone(), v2.clone());
        let mut v7: bool = v6.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v7
    } else {
        false
    };
    let mut v12: bool = if v8 {
        let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN"); } LIT.with(|lit| lit.clone()) };
        let mut v10: Rc<str> = env_or_5(v9.clone(), v2.clone());
        let mut v11: bool = v10.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v11
    } else {
        false
    };
    if v12 {
        let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
        let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
        let mut v15: Rc<str> = env_or_5(v13.clone(), v14.clone());
        let mut v16: Rc<str> = env_or_5(v1.clone(), v2.clone());
        let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_CLIENT_SECRET"); } LIT.with(|lit| lit.clone()) };
        let mut v18: Rc<str> = env_or_5(v17.clone(), v2.clone());
        let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN"); } LIT.with(|lit| lit.clone()) };
        let mut v20: Rc<str> = env_or_5(v19.clone(), v2.clone());
        let (mut v21, mut v22): (i32, Rc<str>) = xc_token::xc_refresh(&*v15, &*v16, &*v18, &*v20, &*v0);
        reported_16(v21, v22.clone())
    } else {
        let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: refresh needs X_OAUTH2_CLIENT_ID, X_OAUTH2_CLIENT_SECRET and X_OAUTH2_REFRESH_TOKEN"); } LIT.with(|lit| lit.clone()) };
        eprintln!("{}", v24);
        3i32
    }
}
fn run_thread_17(mut v0: Rc<str>) -> i32 {
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
    let mut v3: Rc<str> = env_or_5(v1.clone(), v2.clone());
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_BEARER_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v6: Rc<str> = env_or_5(v4.clone(), v5.clone());
    let mut v7: bool = v6.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    if v7 {
        missing_bearer_1()
    } else {
        let (mut v9, mut v10, mut v11): (i32, Rc<str>, Rc<str>) = xc_thread::xc_thread_pages(&*v3, &*v6, &*v0);
        let mut v12: bool = v9 == 0i32;
        let (mut v16, mut v17, mut v18): (i32, Rc<str>, Rc<str>) = if v12 {
            let (mut v13, mut v14, mut v15): (i32, Rc<str>, Rc<str>) = xc_assemble::xc_assemble(&xc_locate::xc_locate(&*v10));
            (v13, v14.clone(), v15.clone())
        } else {
            (v9, v5.clone(), v11.clone())
        };
        let mut v19: bool = v18.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        if v19 {
            let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\nxc: "); } LIT.with(|lit| lit.clone()) };
            let mut v22: Rc<str> = Rc::<str>::from(v18.replace(&*v20, &*v21));
            let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
            let mut v24: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v22));
            eprintln!("{}", v24);
            ()
        };
        let mut v25: bool = v17.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        if v25 {
            println!("{}", v17);
            ()
        };
        v16
    }
}
fn run_write_19(mut v0: i32, mut v1: Rc<str>) -> i32 {
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_CONSUMER_KEY"); } LIT.with(|lit| lit.clone()) };
    let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v4: Rc<str> = env_or_5(v2.clone(), v3.clone());
    let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_CONSUMER_SECRET"); } LIT.with(|lit| lit.clone()) };
    let mut v6: Rc<str> = env_or_5(v5.clone(), v3.clone());
    let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH1_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let mut v8: Rc<str> = env_or_5(v7.clone(), v3.clone());
    let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH1_ACCESS_TOKEN_SECRET"); } LIT.with(|lit| lit.clone()) };
    let mut v10: Rc<str> = env_or_5(v9.clone(), v3.clone());
    let mut v11: bool = v4.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v13: bool = if v11 {
        let mut v12: bool = v6.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v12
    } else {
        false
    };
    let mut v15: bool = if v13 {
        let mut v14: bool = v8.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v14
    } else {
        false
    };
    let mut v17: bool = if v15 {
        let mut v16: bool = v10.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v16
    } else {
        false
    };
    let (mut v20, mut v21, mut v22, mut v23, mut v24): (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) = if v17 {
        (v4.clone(), v6.clone(), v8.clone(), v10.clone(), v3.clone())
    } else {
        let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
        let mut v19: Rc<str> = env_or_5(v18.clone(), v3.clone());
        (v4.clone(), v6.clone(), v8.clone(), v10.clone(), v19.clone())
    };
    let mut v25: bool = v20.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v27: bool = if v25 {
        let mut v26: bool = v21.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v26
    } else {
        false
    };
    let mut v29: bool = if v27 {
        let mut v28: bool = v22.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v28
    } else {
        false
    };
    let mut v31: bool = if v29 {
        let mut v30: bool = v23.clone() != { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v30
    } else {
        false
    };
    let mut v32: bool = v31 == false;
    let mut v34: bool = if v32 {
        let mut v33: bool = v24.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v33
    } else {
        false
    };
    if v34 {
        let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: posting needs user credentials: X_CONSUMER_KEY, X_CONSUMER_SECRET, X_OAUTH1_ACCESS_TOKEN and"); } LIT.with(|lit| lit.clone()) };
        eprintln!("{}", v35);
        let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("    X_OAUTH1_ACCESS_TOKEN_SECRET (OAuth 1.0a, never expire), or X_OAUTH2_ACCESS_TOKEN (OAuth 2.0, 2 hours)"); } LIT.with(|lit| lit.clone()) };
        eprintln!("{}", v36);
        3i32
    } else {
        let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_OAUTH1_NONCE"); } LIT.with(|lit| lit.clone()) };
        let mut v38: Rc<str> = xc_net::xc_fresh_nonce();
        let mut v39: Rc<str> = env_or_5(v37.clone(), v38.clone());
        let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
        let mut v41: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
        let mut v42: Rc<str> = env_or_5(v40.clone(), v41.clone());
        let mut v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_OAUTH1_TIMESTAMP"); } LIT.with(|lit| lit.clone()) };
        let mut v44: Rc<str> = xc_net::xc_unix_seconds();
        let mut v45: Rc<str> = env_or_5(v43.clone(), v44.clone());
        let (mut v46, mut v47): (i32, Rc<str>) = xc_write::xc_write(&*v42, &*v24, &*v20, &*v21, &*v22, &*v23, &*v39, &*v45, v0, &*v1);
        reported_16(v46, v47.clone())
    }
}
fn run_delete_thread_18(mut v0: Rc<str>) -> i32 {
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
    let mut v3: Rc<str> = env_or_5(v1.clone(), v2.clone());
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_BEARER_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v6: Rc<str> = env_or_5(v4.clone(), v5.clone());
    let mut v7: bool = v6.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    if v7 {
        missing_bearer_1()
    } else {
        let (mut v9, mut v10, mut v11): (i32, Rc<str>, Rc<str>) = xc_thread::xc_thread_ids(&*v3, &*v6, &*v0);
        let mut v12: bool = v9 != 0i32;
        if v12 {
            failed_2(v11.clone())
        } else {
            let mut v14: i32 = 9i32;
            run_write_19(v14, v10.clone())
        }
    }
}
fn run_post_thread_20(mut v0: bool, mut v1: Rc<str>) -> i32 {
    let mut v2: bool = std::path::Path::new(&*v1).is_file();
    let mut v3: bool = v2 == false;
    if v3 {
        let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no such file "); } LIT.with(|lit| lit.clone()) };
        let mut v5: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v1));
        failed_2(v5.clone())
    } else {
        if v0 {
            let mut v7: Rc<str> = Rc::<str>::from(std::fs::read_to_string(&*v1).unwrap_or_default());
            let mut v8: Rc<str> = xc_frames::xc_preview(&*v7);
            println!("{}", v8);
            0i32
        } else {
            let mut v9: i32 = 7i32;
            let mut v10: Rc<str> = Rc::<str>::from(std::fs::read_to_string(&*v1).unwrap_or_default());
            let mut v11: Rc<str> = xc_frames::xc_frames(&*v10);
            run_write_19(v9, v11.clone())
        }
    }
}
fn spiral_main() -> i32 {
    let (mut v0, mut v1, mut v2, mut v3, mut v4, mut v5, mut v6, mut v7, mut v8, mut v9, mut v10, mut v11, mut v12, mut v13, mut v14): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = xc_args::xc_parse_os_args();
    let mut v15: bool = v0 == 0i32;
    if v15 {
        run_timeline_0(v0, v1.clone(), v2, v3.clone(), v4, v5, v6, v7, v8.clone(), v9.clone(), v10, v11, v12, v13, v14)
    } else {
        let mut v17: bool = v0 == 3i32;
        if v17 {
            let mut v18: Rc<str> = xc_args::xc_usage();
            println!("{}", v18);
            0i32
        } else {
            let mut v19: bool = v0 == 4i32;
            if v19 {
                let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
                let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v1));
                eprintln!("{}", v21);
                let mut v22: Rc<str> = xc_args::xc_usage();
                eprintln!("{}", v22);
                2i32
            } else {
                let mut v23: bool = v0 == 5i32;
                if v23 {
                    run_refresh_15(v1.clone())
                } else {
                    let mut v25: bool = v0 >= 6i32;
                    if v25 {
                        let mut v26: bool = v0 == 6i32;
                        if v26 {
                            run_thread_17(v1.clone())
                        } else {
                            let mut v28: bool = v0 == 9i32;
                            if v28 {
                                run_delete_thread_18(v1.clone())
                            } else {
                                let mut v30: bool = v0 == 8i32;
                                run_post_thread_20(v30, v1.clone())
                            }
                        }
                    } else {
                        run_write_19(v0, v1.clone())
                    }
                }
            }
        }
    }
}
fn main() { #[cfg(target_arch = "wasm32")] { spiral_main(); return; }
    let main = std::thread::Builder::new().stack_size(1 << 30).spawn(spiral_main).unwrap();
    std::process::exit(match main.join() { Ok(code) => code, Err(_) => 1 });
}
