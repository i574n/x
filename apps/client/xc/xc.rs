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
    let v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
    let v2: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v0));
    eprintln!("{}", v2);
    4i32
}
fn referenced_docs_4(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: i32, mut v9: Rc<str>, mut v10: Rc<str>, mut v11: bool, mut v12: bool, mut v13: i32, mut v14: bool) -> (Rc<str>, Rc<str>) {
    let v15: bool = &*v4 != "";
    let v17: bool = if v15 {
        true
    } else {
        let v16: bool = v13 == 0i32;
        v16
    };
    if v17 {
        (v2.clone(), v4.clone())
    } else {
        let (mut v18, mut v19, mut v20): (Rc<str>, Rc<str>, Rc<str>) = xc_refs::xc_refs(&*v0, &*v1, &*v5, &*v6, &*v7, v13, v14);
        let mut v21: bool = &*v18 == "";
        let v27: Rc<str> = if v21 {
            v2.clone()
        } else {
            let v22: bool = &*v2 == "";
            if v22 {
                v18.clone()
            } else {
                let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                let v25: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v2, v23)), v18));
                v25.clone()
            }
        };
        let v28: bool = &*v19 != "";
        let v30: bool = if v28 {
            true
        } else {
            let v29: bool = &*v20 == "";
            v29
        };
        if v30 {
            (v27.clone(), v19.clone())
        } else {
            let (mut v31, mut v32, mut v33): (i32, Rc<str>, Rc<str>) = xc_users::xc_users_by_ids(&*v0, &*v1, &*v20);
            let v34: bool = v31 == 0i32;
            if v34 {
                let v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",{\"role\":\"users\",\"author\":\"\",\"doc\":"); } LIT.with(|lit| lit.clone()) };
                let v36: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v32));
                let v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
                let v39: Rc<str> = Rc::<str>::from(format!("{}{}", v27, Rc::<str>::from(format!("{}{}", v36, v37))));
                let v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
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
    let v28: bool = &*v3 == "";
    let v34: Rc<str> = if v28 {
        v21.clone()
    } else {
        let v29: bool = &*v21 == "";
        if v29 {
            v3.clone()
        } else {
            let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            let v32: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v3, v30)), v21));
            v32.clone()
        }
    };
    let v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
    let v36: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v26));
    let v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
    let v38: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v37));
    let v39: Rc<str> = xc_digest::xc_digest(&*v38);
    let (mut v44, mut v45): (Rc<str>, i32) = if v19 {
        let (mut v40, mut v41): (Rc<str>, i32) = xc_jsonl::xc_jsonl(&*v39, v10, v11, v17);
        (v40.clone(), v41)
    } else {
        let (mut v42, mut v43): (Rc<str>, i32) = xc_view::xc_view(&*v39, v10, v11, v17, v18);
        (v42.clone(), v43)
    };
    let v47: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v35, v26)), v37));
    let v48: i32 = xc_api::xc_posts_read(&*v47);
    let v49: Rc<str> = Rc::<str>::from(format!("{:?}", v48));
    let v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", "); } LIT.with(|lit| lit.clone()) };
    let v51: Rc<str> = Rc::<str>::from(format!("{}{}", v50, v49));
    let v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" posts read, "); } LIT.with(|lit| lit.clone()) };
    let v53: Rc<str> = Rc::<str>::from(format!("{}{}", v51, v52));
    let v55: Rc<str> = Rc::<str>::from(format!("{}{}", v53, Rc::<str>::from(format!("{:?}", v45))));
    let v56: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" shown"); } LIT.with(|lit| lit.clone()) };
    let v57: Rc<str> = Rc::<str>::from(format!("{}{}", v55, v56));
    let v58: i32 = xc_net::xc_requests();
    let v59: Rc<str> = Rc::<str>::from(format!("{:?}", v58));
    let v60: bool = v58 == 1i32;
    let v63: Rc<str> = if v60 {
        let v61: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" API request"); } LIT.with(|lit| lit.clone()) };
        v61.clone()
    } else {
        let v62: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" API requests"); } LIT.with(|lit| lit.clone()) };
        v62.clone()
    };
    let v64: Rc<str> = Rc::<str>::from(format!("{}{}", v59, v63));
    let v65: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
    let v67: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v65, v64)), v57));
    eprintln!("{}", v67);
    let v68: bool = &*v34 != "";
    if v68 {
        let v69: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
        let v70: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\nxc: "); } LIT.with(|lit| lit.clone()) };
        let v71: Rc<str> = Rc::<str>::from(v34.replace(&*v69, &*v70));
        let v72: Rc<str> = Rc::<str>::from(format!("{}{}", v65, v71));
        eprintln!("{}", v72);
        ()
    };
    let v73: bool = &*v27 == "";
    let v75: bool = if v73 {
        let v74: bool = v45 == 0i32;
        v74
    } else {
        false
    };
    if v75 {
        let v76: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: no posts matched"); } LIT.with(|lit| lit.clone()) };
        eprintln!("{}", v76);
        ()
    };
    let v77: bool = &*v44 != "";
    if v77 {
        println!("{}", v44);
        ()
    };
    if v73 {
        0i32
    } else {
        let v78: bool = v45 == 0i32;
        if v78 {
            failed_2(v27.clone())
        } else {
            let v80: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("stopped early, showing what was read before: "); } LIT.with(|lit| lit.clone()) };
            let v81: Rc<str> = Rc::<str>::from(format!("{}{}", v80, v27));
            failed_2(v81.clone())
        }
    }
}
fn get_environment_variable_6(mut v0: Rc<str>) -> Rc<str> {
    let v1: Rc<str> = Rc::<str>::from(std::env::var(&*v0).unwrap_or_default());
    v1
}
fn method7(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> i32 {
    loop {
        let v3: bool = v2 >= v1;
        if v3 {
            return v1;
        } else {
            let mut v4: u8 = v0.clone().as_bytes()[v2 as usize];
            let mut v5: bool = v4 == b' ';
            let v11: bool = if v5 {
                true
            } else {
                let mut v6: bool = v4 == b'\t';
                if v6 {
                    true
                } else {
                    let v7: bool = v4 == b'\r';
                    if v7 {
                        true
                    } else {
                        let v8: bool = v4 == b'\n';
                        v8
                    }
                }
            };
            if v11 {
                let v12: i32 = v2.wrapping_add(1i32);
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
        let v2: bool = v1 <= 0i32;
        if v2 {
            return -1i32;
        } else {
            let v3: i32 = v1.wrapping_sub(1i32);
            let mut v4: u8 = v0.clone().as_bytes()[v3 as usize];
            let mut v5: bool = v4 == b' ';
            let v11: bool = if v5 {
                true
            } else {
                let mut v6: bool = v4 == b'\t';
                if v6 {
                    true
                } else {
                    let v7: bool = v4 == b'\r';
                    if v7 {
                        true
                    } else {
                        let v8: bool = v4 == b'\n';
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
    let v2: Rc<str> = get_environment_variable_6(v0);
    let v3: i32 = (v2.clone().len() as i32);
    let mut v4: i32 = 0i32;
    let mut v5: i32 = method7(v2.clone(), v3, v4);
    let mut v6: i32 = v3.wrapping_sub(1i32);
    let v7: Rc<str> = string_slice(&v2, v5 as i64, v6 as i64);
    let v8: i32 = (v7.clone().len() as i32);
    let v9: i32 = method8(v7.clone(), v8);
    let v10: Rc<str> = string_slice(&v7, 0i32 as i64, v9 as i64);
    let v11: bool = &*v10 == "";
    if v11 {
        v1
    } else {
        v10
    }
}
fn method10(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure0() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn split_list_11(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let v2: Option<usize> = v1.find(&*v0);
    let v3: Option<usize> = method10(v2.clone());
    let mut v4: Rc<dyn Fn((usize)) -> i32> = closure0();
    let mut v5: Option<i32> = v3.map(|x| v4(x));
    let v7: i32 = v5.unwrap_or(-1i32);
    let v8: i32 = (v0.clone().len() as i32);
    let v9: bool = v7 < 0i32;
    let v11: bool = if v9 {
        true
    } else {
        let v10: bool = v8 == 0i32;
        v10
    };
    if v11 {
        let v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1.clone(), v12.clone()))
    } else {
        let v14: usize = ((0i32) as usize);
        let v15: usize = ((v7) as usize);
        let v16: Rc<str> = Rc::<str>::from(&(v1)[v14..v15]);
        let v17: i32 = v7.wrapping_add(v8);
        let v18: i32 = (v1.clone().len() as i32);
        let v19: i32 = v18.wrapping_sub(v7);
        let mut v20: i32 = v19.wrapping_sub(v8);
        let mut v21: usize = ((v17) as usize);
        let v22: i32 = v17.wrapping_add(v20);
        let v23: usize = ((v22) as usize);
        let v24: Rc<str> = Rc::<str>::from(&(v1)[v21..v23]);
        let v25: Rc<UH0> = split_list_11(v0.clone(), v24.clone());
        Rc::new(UH0::UH0_Cons(v16.clone(), v25.clone()))
    }
}
fn method12(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
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
    let v8: bool = v4 != 0i32;
    let (mut v66, mut v67, mut v68): (Rc<str>, Rc<str>, Rc<str>) = if v8 {
        let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        (v9.clone(), v9.clone(), v7.clone())
    } else {
        let v10: bool = &*v5 == "";
        let (mut v63, mut v64, mut v65): (Rc<str>, Rc<str>, Rc<str>) = if v10 {
            let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", @"); } LIT.with(|lit| lit.clone()) };
            let v13: Rc<str> = Rc::<str>::from(v2.replace(&*v11, &*v12));
            let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
            let v15: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v13));
            let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v16.clone(), v16.clone(), v15.clone())
        } else {
            let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let v18: Option<usize> = v5.find(&*v17);
            let v19: Option<usize> = method10(v18.clone());
            let mut v20: Rc<dyn Fn((usize)) -> i32> = closure0();
            let mut v21: Option<i32> = v19.map(|x| v20(x));
            let v23: i32 = v21.unwrap_or(-1i32);
            let v24: usize = ((0i32) as usize);
            let v25: usize = ((v23) as usize);
            let v26: Rc<str> = Rc::<str>::from(&(v5)[v24..v25]);
            let v27: i32 = v23.wrapping_add(1i32);
            let v28: i32 = (v5.clone().len() as i32);
            let v29: i32 = v28.wrapping_sub(v23);
            let v30: i32 = v29.wrapping_sub(1i32);
            let v31: usize = ((v27) as usize);
            let v32: i32 = v27.wrapping_add(v30);
            let v33: usize = ((v32) as usize);
            let v34: Rc<str> = Rc::<str>::from(&(v5)[v31..v33]);
            let (mut v35, mut v36, mut v37): (i32, Rc<str>, Rc<str>) = xc_users::xc_users_followed(&*v0, &*v1, &*v26, v3);
            let v38: bool = v35 != 0i32;
            let (mut v60, mut v61, mut v62): (Rc<str>, Rc<str>, Rc<str>) = if v38 {
                let v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (v39.clone(), v39.clone(), v37.clone())
            } else {
                let v40: bool = &*v36 == "";
                let v44: Rc<str> = if v40 {
                    v5.clone()
                } else {
                    let v41: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                    let v43: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v5, v41)), v36));
                    v43.clone()
                };
                let v48: Rc<UH0> = if v40 {
                    { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
                } else {
                    let v46: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                    split_list_11(v46.clone(), v36.clone())
                };
                let v49: i32 = 0i32;
                let v50: i32 = method12(v48.clone(), v49);
                let v51: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("home timeline of @"); } LIT.with(|lit| lit.clone()) };
                let v52: Rc<str> = Rc::<str>::from(format!("{}{}", v51, v34));
                let v53: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" from "); } LIT.with(|lit| lit.clone()) };
                let v54: Rc<str> = Rc::<str>::from(format!("{}{}", v52, v53));
                let v56: Rc<str> = Rc::<str>::from(format!("{}{}", v54, Rc::<str>::from(format!("{:?}", v50))));
                let v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" followed accounts"); } LIT.with(|lit| lit.clone()) };
                let v58: Rc<str> = Rc::<str>::from(format!("{}{}", v56, v57));
                let v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (v44.clone(), v58.clone(), v59.clone())
            };
            (v60.clone(), v61.clone(), v62.clone())
        };
        (v63.clone(), v64.clone(), v65.clone())
    };
    (v66.clone(), v67.clone(), v68.clone())
}
fn method14(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method14(v3.clone(), v1.clone());
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", @"); } LIT.with(|lit| lit.clone()) };
            let v7: Rc<str> = Rc::<str>::from(v2.replace(&*v5, &*v6));
            let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
            let v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v7));
            Rc::new(UH0::UH0_Cons(v9.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method15(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
    loop {
        match &*v1 {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3.clone();
                let mut v4: Rc<UH0> = v4.clone();
                v0.borrow_mut().push(v3);
                let mut v5: i32 = v2.wrapping_add(1i32);
                (v0, v1, v2) = (v0.clone(), v4.clone(), v5);
                continue;
            }
            UH0::UH0_Nil => {
                return v2;
            }
        }
    }
}
fn account_plan_13(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>, Rc<str>) {
    let (mut v3, mut v4, mut v5, mut v6): (i32, Rc<str>, Rc<str>, Rc<str>) = xc_users::xc_users_named(&*v0, &*v1, &*v2);
    let v7: bool = v3 != 0i32;
    let (mut v34, mut v35, mut v36): (Rc<str>, Rc<str>, Rc<str>) = if v7 {
        let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        (v8.clone(), v8.clone(), v6.clone())
    } else {
        let v9: bool = &*v4 == "";
        let (mut v31, mut v32, mut v33): (Rc<str>, Rc<str>, Rc<str>) = if v9 {
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", @"); } LIT.with(|lit| lit.clone()) };
            let v12: Rc<str> = Rc::<str>::from(v5.replace(&*v10, &*v11));
            let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
            let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v12));
            let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v15.clone(), v15.clone(), v14.clone())
        } else {
            let v16: bool = &*v5 == "";
            let mut v20: Rc<UH0> = if v16 {
                { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
            } else {
                let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                split_list_11(v18.clone(), v5.clone())
            };
            let mut v21: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v22: Rc<UH0> = method14(v20.clone(), v21.clone());
            let v23: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            let v24: i32 = 0i32;
            let v25: i32 = method15(v23.clone(), v22.clone(), v24);
            let v26: Rc<Vec<Rc<str>>> = Rc::new(v23.borrow().clone());
            let v27: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v26).as_ref().clone()));
            let v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            let v29: Rc<str> = Rc::<str>::from((*v27.borrow()).join(&*v28));
            let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v4.clone(), v29.clone(), v30.clone())
        };
        (v31.clone(), v32.clone(), v33.clone())
    };
    (v34.clone(), v35.clone(), v36.clone())
}
fn run_timeline_0(mut v0: i32, mut v1: Rc<str>, mut v2: bool, mut v3: Rc<str>, mut v4: i32, mut v5: i32, mut v6: i32, mut v7: i32, mut v8: Rc<str>, mut v9: Rc<str>, mut v10: bool, mut v11: bool, mut v12: i32, mut v13: bool, mut v14: bool) -> i32 {
    let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
    let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
    let v17: Rc<str> = env_or_5(v15.clone(), v16.clone());
    let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_BEARER_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v20: Rc<str> = env_or_5(v18.clone(), v19.clone());
    let mut v21: bool = &*v20 == "";
    if v21 {
        missing_bearer_1()
    } else {
        let (mut v29, mut v30, mut v31): (Rc<str>, Rc<str>, Rc<str>) = if v2 {
            let (mut v23, mut v24, mut v25): (Rc<str>, Rc<str>, Rc<str>) = home_plan_9(v17.clone(), v20.clone(), v3.clone(), v7);
            (v23.clone(), v24.clone(), v25.clone())
        } else {
            let (mut v26, mut v27, mut v28): (Rc<str>, Rc<str>, Rc<str>) = account_plan_13(v17.clone(), v20.clone(), v3.clone());
            (v26.clone(), v27.clone(), v28.clone())
        };
        let v32: bool = &*v31 != "";
        if v32 {
            failed_2(v31.clone())
        } else {
            shown_timeline_3(v17.clone(), v20.clone(), v29.clone(), v30.clone(), v31.clone(), v0, v1.clone(), v2, v3.clone(), v4, v5, v6, v7, v8.clone(), v9.clone(), v10, v11, v12, v13, v14)
        }
    }
}
fn reported_17(mut v0: i32, mut v1: Rc<str>) -> i32 {
    let v2: bool = v0 == 0i32;
    if v2 {
        println!("{}", v1);
        ()
    } else {
        let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
        let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v1));
        eprintln!("{}", v4);
        ()
    };
    v0
}
fn run_refresh_16(mut v0: Rc<str>) -> i32 {
    let v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_CLIENT_ID"); } LIT.with(|lit| lit.clone()) };
    let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v3: Rc<str> = env_or_5(v1.clone(), v2.clone());
    let mut v4: bool = &*v3 != "";
    let v8: bool = if v4 {
        let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_CLIENT_SECRET"); } LIT.with(|lit| lit.clone()) };
        let mut v6: Rc<str> = env_or_5(v5.clone(), v2.clone());
        let v7: bool = &*v6 != "";
        v7
    } else {
        false
    };
    let v12: bool = if v8 {
        let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN"); } LIT.with(|lit| lit.clone()) };
        let v10: Rc<str> = env_or_5(v9.clone(), v2.clone());
        let v11: bool = &*v10 != "";
        v11
    } else {
        false
    };
    if v12 {
        let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
        let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
        let v15: Rc<str> = env_or_5(v13.clone(), v14.clone());
        let v16: Rc<str> = env_or_5(v1.clone(), v2.clone());
        let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_CLIENT_SECRET"); } LIT.with(|lit| lit.clone()) };
        let v18: Rc<str> = env_or_5(v17.clone(), v2.clone());
        let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN"); } LIT.with(|lit| lit.clone()) };
        let mut v20: Rc<str> = env_or_5(v19.clone(), v2.clone());
        let (mut v21, mut v22): (i32, Rc<str>) = xc_token::xc_refresh(&*v15, &*v16, &*v18, &*v20, &*v0);
        reported_17(v21, v22.clone())
    } else {
        let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: refresh needs X_OAUTH2_CLIENT_ID, X_OAUTH2_CLIENT_SECRET and X_OAUTH2_REFRESH_TOKEN"); } LIT.with(|lit| lit.clone()) };
        eprintln!("{}", v24);
        3i32
    }
}
fn run_thread_18(mut v0: Rc<str>) -> i32 {
    let v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
    let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
    let v3: Rc<str> = env_or_5(v1.clone(), v2.clone());
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_BEARER_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v6: Rc<str> = env_or_5(v4.clone(), v5.clone());
    let v7: bool = &*v6 == "";
    if v7 {
        missing_bearer_1()
    } else {
        let (mut v9, mut v10, mut v11): (i32, Rc<str>, Rc<str>) = xc_thread::xc_thread_pages(&*v3, &*v6, &*v0);
        let v12: bool = v9 == 0i32;
        let (mut v16, mut v17, mut v18): (i32, Rc<str>, Rc<str>) = if v12 {
            let (mut v13, mut v14, mut v15): (i32, Rc<str>, Rc<str>) = xc_assemble::xc_assemble(&xc_locate::xc_locate(&*v10));
            (v13, v14.clone(), v15.clone())
        } else {
            (v9, v5.clone(), v11.clone())
        };
        let v19: bool = &*v18 != "";
        if v19 {
            let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\nxc: "); } LIT.with(|lit| lit.clone()) };
            let v22: Rc<str> = Rc::<str>::from(v18.replace(&*v20, &*v21));
            let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
            let v24: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v22));
            eprintln!("{}", v24);
            ()
        };
        let v25: bool = &*v17 != "";
        if v25 {
            println!("{}", v17);
            ()
        };
        let v26: i32 = xc_net::xc_requests();
        let v27: Rc<str> = Rc::<str>::from(format!("{:?}", v26));
        let v28: bool = v26 == 1i32;
        let v31: Rc<str> = if v28 {
            let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" API request"); } LIT.with(|lit| lit.clone()) };
            v29.clone()
        } else {
            let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" API requests"); } LIT.with(|lit| lit.clone()) };
            v30.clone()
        };
        let v32: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v31));
        let v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
        let v35: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v33, v32)), v5));
        eprintln!("{}", v35);
        v16
    }
}
fn run_write_20(mut v0: i32, mut v1: Rc<str>) -> i32 {
    let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_CONSUMER_KEY"); } LIT.with(|lit| lit.clone()) };
    let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v4: Rc<str> = env_or_5(v2.clone(), v3.clone());
    let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_CONSUMER_SECRET"); } LIT.with(|lit| lit.clone()) };
    let mut v6: Rc<str> = env_or_5(v5.clone(), v3.clone());
    let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH1_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let v8: Rc<str> = env_or_5(v7.clone(), v3.clone());
    let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH1_ACCESS_TOKEN_SECRET"); } LIT.with(|lit| lit.clone()) };
    let v10: Rc<str> = env_or_5(v9.clone(), v3.clone());
    let v11: bool = &*v4 != "";
    let v13: bool = if v11 {
        let v12: bool = &*v6 != "";
        v12
    } else {
        false
    };
    let v15: bool = if v13 {
        let v14: bool = &*v8 != "";
        v14
    } else {
        false
    };
    let v17: bool = if v15 {
        let v16: bool = &*v10 != "";
        v16
    } else {
        false
    };
    let v22: bool = if v17 {
        let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_SITE"); } LIT.with(|lit| lit.clone()) };
        let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("x"); } LIT.with(|lit| lit.clone()) };
        let mut v20: Rc<str> = env_or_5(v18.clone(), v19.clone());
        let mut v21: bool = &*v20 != "mastodon";
        v21
    } else {
        false
    };
    let (mut v31, mut v32, mut v33, mut v34, mut v35): (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) = if v22 {
        (v4.clone(), v6.clone(), v8.clone(), v10.clone(), v3.clone())
    } else {
        let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_SITE"); } LIT.with(|lit| lit.clone()) };
        let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("x"); } LIT.with(|lit| lit.clone()) };
        let v25: Rc<str> = env_or_5(v23.clone(), v24.clone());
        let v26: bool = &*v25 == "mastodon";
        let v29: Rc<str> = if v26 {
            let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("MASTODON_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
            v27.clone()
        } else {
            let v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
            v28.clone()
        };
        let v30: Rc<str> = env_or_5(v29.clone(), v3.clone());
        (v4.clone(), v6.clone(), v8.clone(), v10.clone(), v30.clone())
    };
    let v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_SITE"); } LIT.with(|lit| lit.clone()) };
    let v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("x"); } LIT.with(|lit| lit.clone()) };
    let v38: Rc<str> = env_or_5(v36.clone(), v37.clone());
    let v39: bool = &*v38 == "x";
    let v42: bool = if v39 {
        true
    } else {
        let v40: Rc<str> = env_or_5(v36.clone(), v37.clone());
        let v41: bool = &*v40 == "mastodon";
        v41
    };
    let v45: bool = if v42 {
        true
    } else {
        let v43: Rc<str> = env_or_5(v36.clone(), v37.clone());
        let v44: bool = &*v43 == "bluesky";
        v44
    };
    let v46: bool = v45 == false;
    if v46 {
        let v47: Rc<str> = env_or_5(v36.clone(), v37.clone());
        let v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: XC_SITE must be x, mastodon or bluesky, got "); } LIT.with(|lit| lit.clone()) };
        let v49: Rc<str> = Rc::<str>::from(format!("{}{}", v48, v47));
        eprintln!("{}", v49);
        2i32
    } else {
        let v50: Rc<str> = env_or_5(v36.clone(), v37.clone());
        let v51: bool = &*v50 == "bluesky";
        let v65: bool = if v51 {
            let v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("BLUESKY_APP_PASSWORD"); } LIT.with(|lit| lit.clone()) };
            let v53: Rc<str> = env_or_5(v52.clone(), v3.clone());
            let v54: bool = &*v53 == "";
            v54
        } else {
            let v55: bool = &*v31 != "";
            let v57: bool = if v55 {
                let v56: bool = &*v32 != "";
                v56
            } else {
                false
            };
            let v59: bool = if v57 {
                let v58: bool = &*v33 != "";
                v58
            } else {
                false
            };
            let v61: bool = if v59 {
                let v60: bool = &*v34 != "";
                v60
            } else {
                false
            };
            let v62: bool = v61 == false;
            if v62 {
                let v63: bool = &*v35 == "";
                v63
            } else {
                false
            }
        };
        if v65 {
            let v66: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: posting needs user credentials: X_CONSUMER_KEY, X_CONSUMER_SECRET, X_OAUTH1_ACCESS_TOKEN and"); } LIT.with(|lit| lit.clone()) };
            eprintln!("{}", v66);
            let v67: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("    X_OAUTH1_ACCESS_TOKEN_SECRET (OAuth 1.0a, never expire), or X_OAUTH2_ACCESS_TOKEN (OAuth 2.0, 2 hours)"); } LIT.with(|lit| lit.clone()) };
            eprintln!("{}", v67);
            3i32
        } else {
            let v68: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_OAUTH1_NONCE"); } LIT.with(|lit| lit.clone()) };
            let v69: Rc<str> = xc_net::xc_fresh_nonce();
            let v70: Rc<str> = env_or_5(v68.clone(), v69.clone());
            let v71: Rc<str> = env_or_5(v36.clone(), v37.clone());
            let v72: bool = &*v71 == "mastodon";
            let v84: Rc<str> = if v72 {
                let v73: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("MASTODON_BASE_URL"); } LIT.with(|lit| lit.clone()) };
                env_or_5(v73.clone(), v3.clone())
            } else {
                let v75: Rc<str> = env_or_5(v36.clone(), v37.clone());
                let v76: bool = &*v75 == "bluesky";
                if v76 {
                    let v77: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("BLUESKY_BASE_URL"); } LIT.with(|lit| lit.clone()) };
                    let v78: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://bsky.social"); } LIT.with(|lit| lit.clone()) };
                    env_or_5(v77.clone(), v78.clone())
                } else {
                    let v80: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
                    let v81: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
                    env_or_5(v80.clone(), v81.clone())
                }
            };
            let v85: Rc<str> = env_or_5(v36.clone(), v37.clone());
            let v86: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_OAUTH1_TIMESTAMP"); } LIT.with(|lit| lit.clone()) };
            let v87: Rc<str> = xc_net::xc_unix_seconds();
            let v88: Rc<str> = env_or_5(v86.clone(), v87.clone());
            let (mut v89, mut v90): (i32, Rc<str>) = xc_write::xc_write(&*v84, &*v35, &*v31, &*v32, &*v33, &*v34, &*v70, &*v88, v0, &*v1, &*v85);
            reported_17(v89, v90.clone())
        }
    }
}
fn run_delete_thread_19(mut v0: Rc<str>) -> i32 {
    let v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
    let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
    let v3: Rc<str> = env_or_5(v1.clone(), v2.clone());
    let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_BEARER_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v6: Rc<str> = env_or_5(v4.clone(), v5.clone());
    let v7: bool = &*v6 == "";
    if v7 {
        missing_bearer_1()
    } else {
        let (mut v9, mut v10, mut v11): (i32, Rc<str>, Rc<str>) = xc_thread::xc_thread_ids(&*v3, &*v6, &*v0);
        let v12: bool = v9 != 0i32;
        if v12 {
            failed_2(v11.clone())
        } else {
            let v14: i32 = 9i32;
            run_write_20(v14, v10.clone())
        }
    }
}
fn file_exists_22(mut v0: Rc<str>) -> bool {
    let v2: &str = &*v0;
    let mut v4: std::string::String = String::from(v2);
    let mut v6: std::path::PathBuf = std::path::PathBuf::from(v4);
    let v8: bool = v6.exists();
    if v8 {
        let v10: bool = v6.is_file();
        v10
    } else {
        false
    }
}
fn method23(mut v0: Vec<u8>) -> Vec<u8> {
    v0
}
fn run_resume_thread_21(mut v0: Rc<str>) -> i32 {
    let v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let v2: Option<usize> = v0.find(&*v1);
    let v3: Option<usize> = method10(v2.clone());
    let mut v4: Rc<dyn Fn((usize)) -> i32> = closure0();
    let mut v5: Option<i32> = v3.map(|x| v4(x));
    let v7: i32 = v5.unwrap_or(-1i32);
    let v8: usize = ((0i32) as usize);
    let v9: usize = ((v7) as usize);
    let v10: Rc<str> = Rc::<str>::from(&(v0)[v8..v9]);
    let v11: i32 = v7.wrapping_add(1i32);
    let v12: i32 = (v0.clone().len() as i32);
    let v13: i32 = v12.wrapping_sub(v11);
    let v14: usize = ((v11) as usize);
    let v15: i32 = v11.wrapping_add(v13);
    let v16: usize = ((v15) as usize);
    let v17: Rc<str> = Rc::<str>::from(&(v0)[v14..v16]);
    let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
    let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
    let mut v20: Rc<str> = env_or_5(v18.clone(), v19.clone());
    let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_BEARER_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v23: Rc<str> = env_or_5(v21.clone(), v22.clone());
    let v24: bool = file_exists_22(v17.clone());
    let v25: bool = v24 == false;
    if v25 {
        let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no such file "); } LIT.with(|lit| lit.clone()) };
        let v27: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v17));
        failed_2(v27.clone())
    } else {
        let v29: bool = &*v23 == "";
        if v29 {
            missing_bearer_1()
        } else {
            let (mut v31, mut v32, mut v33): (i32, Rc<str>, Rc<str>) = xc_chain::xc_chain(&*v20, &*v23, &*v10);
            let v34: bool = v31 != 0i32;
            if v34 {
                failed_2(v33.clone())
            } else {
                let v36: i32 = 10i32;
                let v38: Result<Vec<u8>, std::io::Error> = std::fs::read(&*v17);
                let v40: Vec<u8> = v38.unwrap();
                let v41: Vec<u8> = method23(v40.clone());
                let v43: Result<std::string::String, std::string::FromUtf8Error> = std::string::String::from_utf8(v41);
                let v45: std::string::String = v43.unwrap();
                let v47: Rc<str> = Rc::<str>::from(String::as_str(&v45));
                let v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_SITE"); } LIT.with(|lit| lit.clone()) };
                let v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("x"); } LIT.with(|lit| lit.clone()) };
                let v50: Rc<str> = env_or_5(v48.clone(), v49.clone());
                let v51: Rc<str> = xc_frames::xc_frames(&*v50, &*v47);
                let v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"planned\":"); } LIT.with(|lit| lit.clone()) };
                let v53: Rc<str> = Rc::<str>::from(format!("{}{}", v52, v51));
                let v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"found\":"); } LIT.with(|lit| lit.clone()) };
                let v56: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v53, v54)), v32));
                let v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
                let v58: Rc<str> = Rc::<str>::from(format!("{}{}", v56, v57));
                run_write_20(v36, v58.clone())
            }
        }
    }
}
fn run_post_thread_25(mut v0: bool, mut v1: Rc<str>) -> i32 {
    let v2: bool = file_exists_22(v1.clone());
    let v3: bool = v2 == false;
    if v3 {
        let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no such file "); } LIT.with(|lit| lit.clone()) };
        let mut v5: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v1));
        failed_2(v5.clone())
    } else {
        if v0 {
            let v8: Result<Vec<u8>, std::io::Error> = std::fs::read(&*v1);
            let v10: Vec<u8> = v8.unwrap();
            let v11: Vec<u8> = method23(v10.clone());
            let v13: Result<std::string::String, std::string::FromUtf8Error> = std::string::String::from_utf8(v11);
            let v15: std::string::String = v13.unwrap();
            let v17: Rc<str> = Rc::<str>::from(String::as_str(&v15));
            let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_SITE"); } LIT.with(|lit| lit.clone()) };
            let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("x"); } LIT.with(|lit| lit.clone()) };
            let mut v20: Rc<str> = env_or_5(v18.clone(), v19.clone());
            let mut v21: Rc<str> = xc_preview::xc_preview(&*v20, &*v17);
            println!("{}", v21);
            0i32
        } else {
            let v22: i32 = 7i32;
            let v24: Result<Vec<u8>, std::io::Error> = std::fs::read(&*v1);
            let v26: Vec<u8> = v24.unwrap();
            let v27: Vec<u8> = method23(v26.clone());
            let v29: Result<std::string::String, std::string::FromUtf8Error> = std::string::String::from_utf8(v27);
            let v31: std::string::String = v29.unwrap();
            let v33: Rc<str> = Rc::<str>::from(String::as_str(&v31));
            let v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_SITE"); } LIT.with(|lit| lit.clone()) };
            let v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("x"); } LIT.with(|lit| lit.clone()) };
            let v36: Rc<str> = env_or_5(v34.clone(), v35.clone());
            let v37: Rc<str> = xc_frames::xc_frames(&*v36, &*v33);
            run_write_20(v22, v37.clone())
        }
    }
}
fn method24(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH0> = v3.clone();
                let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("=== "); } LIT.with(|lit| lit.clone()) };
                let mut v5: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v2));
                println!("{}", v5);
                let mut v6: bool = true;
                let v7: i32 = run_post_thread_25(v6, v2.clone());
                let v8: bool = v7 > v1;
                let v9: i32 = if v8 {
                    v7
                } else {
                    v1
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
fn spiral_main() -> i32 {
    let (mut v0, mut v1, mut v2, mut v3, mut v4, mut v5, mut v6, mut v7, mut v8, mut v9, mut v10, mut v11, mut v12, mut v13, mut v14): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool, bool) = xc_args::xc_parse_os_args();
    let v15: bool = v0 == 0i32;
    if v15 {
        run_timeline_0(v0, v1.clone(), v2, v3.clone(), v4, v5, v6, v7, v8.clone(), v9.clone(), v10, v11, v12, v13, v14)
    } else {
        let v17: bool = v0 == 3i32;
        if v17 {
            let v18: Rc<str> = xc_args::xc_usage();
            println!("{}", v18);
            0i32
        } else {
            let v19: bool = v0 == 4i32;
            if v19 {
                let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
                let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v1));
                eprintln!("{}", v21);
                let v22: Rc<str> = xc_args::xc_usage();
                eprintln!("{}", v22);
                2i32
            } else {
                let v23: bool = v0 == 5i32;
                if v23 {
                    run_refresh_16(v1.clone())
                } else {
                    let v25: bool = v0 >= 6i32;
                    if v25 {
                        let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_SITE"); } LIT.with(|lit| lit.clone()) };
                        let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("x"); } LIT.with(|lit| lit.clone()) };
                        let v28: Rc<str> = env_or_5(v26.clone(), v27.clone());
                        let v29: bool = v0 == 9i32;
                        let v31: bool = if v29 {
                            true
                        } else {
                            let v30: bool = v0 == 10i32;
                            v30
                        };
                        let v33: bool = if v31 {
                            let v32: bool = &*v28 != "x";
                            v32
                        } else {
                            false
                        };
                        if v33 {
                            let v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: delete-thread and --resume read threads through X's API, which needs XC_SITE=x, not "); } LIT.with(|lit| lit.clone()) };
                            let v35: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v28));
                            eprintln!("{}", v35);
                            2i32
                        } else {
                            let v36: bool = v0 == 6i32;
                            if v36 {
                                run_thread_18(v1.clone())
                            } else {
                                if v29 {
                                    run_delete_thread_19(v1.clone())
                                } else {
                                    let v39: bool = v0 == 10i32;
                                    if v39 {
                                        run_resume_thread_21(v1.clone())
                                    } else {
                                        let v41: bool = v0 == 11i32;
                                        if v41 {
                                            let v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                                            let v43: Rc<UH0> = split_list_11(v42.clone(), v1.clone());
                                            let v44: i32 = 0i32;
                                            method24(v43.clone(), v44)
                                        } else {
                                            let v46: bool = v0 == 8i32;
                                            run_post_thread_25(v46, v1.clone())
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        run_write_20(v0, v1.clone())
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
