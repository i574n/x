#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[global_allocator] static XC_ALLOC: mimalloc::MiMalloc = mimalloc::MiMalloc;
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
struct Mut0 { l0: i32, l1: Rc<UH0> }
fn missing_bearer_1() -> i32 {
    let mut v0: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: X_BEARER_TOKEN is not set; generate the app's bearer token at https://console.x.com"); } LIT.with(|lit| lit.clone()) };
    eprintln!("{}", v0);
    3i32
}
fn failed_2(mut v0: Rc<str>) -> i32 {
    let mut v1: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) }, v0));
    eprintln!("{}", v1);
    4i32
}
fn referenced_docs_4(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: &Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: i32, mut v9: &Rc<str>, mut v10: &Rc<str>, mut v11: bool, mut v12: bool, mut v13: i32, mut v14: bool) -> (Rc<str>, Rc<str>) {
    let v15: bool = &*v4 != "";
    let v17: bool = if v15 {
        true
    } else {
        let v16: bool = v13 == 0i32;
        v16
    };
    if v17 {
        (v2, v4)
    } else {
        let (mut v18, mut v19, mut v20): (Rc<str>, Rc<str>, Rc<str>) = xc_refs::xc_refs(&*v0, &*v1, &*v5, &*v6, &*v7, v13, v14);
        let v21: bool = &*v18 == "";
        let v26: Rc<str> = if v21 {
            v2
        } else {
            let v22: bool = &*v2 == "";
            if v22 {
                v18
            } else {
                let v23: Rc<str> = Rc::<str>::from(format!("{}{}", v2, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) }));
                let v24: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v18));
                v24
            }
        };
        let v27: bool = &*v19 != "";
        let v29: bool = if v27 {
            true
        } else {
            let v28: bool = &*v20 == "";
            v28
        };
        if v29 {
            (v26, v19)
        } else {
            let (mut v30, mut v31, mut v32): (i32, Rc<str>, Rc<str>) = xc_users::xc_users_by_ids(&*v0, &*v1, &*v20);
            let v33: bool = v30 == 0i32;
            if v33 {
                let v34: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",{\"role\":\"users\",\"author\":\"\",\"doc\":"); } LIT.with(|lit| lit.clone()) }, v31));
                let v35: Rc<str> = Rc::<str>::from(format!("{}{}", v34, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) }));
                let v36: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v35));
                let v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (v36, v37)
            } else {
                (v26, v32)
            }
        }
    }
}
fn shown_timeline_3(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: i32, mut v6: Rc<str>, mut v7: bool, mut v8: Rc<str>, mut v9: i32, mut v10: i32, mut v11: i32, mut v12: i32, mut v13: Rc<str>, mut v14: Rc<str>, mut v15: bool, mut v16: bool, mut v17: i32, mut v18: bool, mut v19: bool) -> i32 {
    let (mut v20, mut v21, mut v22, mut v23, mut v24, mut v25): (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) = xc_fetch::xc_fetch(&*v0, &*v1, &*v2, v9, &*v13, &*v14, v15, v16, v17, v18);
    let (mut v26, mut v27): (Rc<str>, Rc<str>) = referenced_docs_4(v0, v1, v20, &v21, v22, v23, v24, v25, v9, &v13, &v14, v15, v16, v17, v18);
    let v28: bool = &*v3 == "";
    let v33: Rc<str> = if v28 {
        v21
    } else {
        let v29: bool = &*v21 == "";
        if v29 {
            v3
        } else {
            let v30: Rc<str> = Rc::<str>::from(format!("{}{}", v3, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) }));
            let v31: Rc<str> = Rc::<str>::from(format!("{}{}", v30, v21));
            v31
        }
    };
    let v34: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) }, v26));
    let v35: Rc<str> = Rc::<str>::from(format!("{}{}", v34, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) }));
    let v36: Rc<str> = xc_digest::xc_digest(&*v35);
    let (mut v41, mut v42): (Rc<str>, i32) = if v19 {
        let (mut v37, mut v38): (Rc<str>, i32) = xc_jsonl::xc_jsonl(&*v36, v10, v11, v17);
        (v37, v38)
    } else {
        let (mut v39, mut v40): (Rc<str>, i32) = xc_view::xc_view(&*v36, v10, v11, v17, v18);
        (v39, v40)
    };
    let v43: i32 = xc_api::xc_posts_read(&*v35);
    let v44: Rc<str> = Rc::<str>::from((v43).to_string());
    let v45: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", "); } LIT.with(|lit| lit.clone()) }, v44));
    let v46: Rc<str> = Rc::<str>::from(format!("{}{}", v45, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" posts read, "); } LIT.with(|lit| lit.clone()) }));
    let v47: Rc<str> = Rc::<str>::from((v42).to_string());
    let v48: Rc<str> = Rc::<str>::from(format!("{}{}", v46, v47));
    let v49: Rc<str> = Rc::<str>::from(format!("{}{}", v48, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" shown"); } LIT.with(|lit| lit.clone()) }));
    let v50: i32 = xc_net::xc_requests();
    let v51: Rc<str> = Rc::<str>::from((v50).to_string());
    let v52: bool = v50 == 1i32;
    let v55: Rc<str> = if v52 {
        let v53: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" API request"); } LIT.with(|lit| lit.clone()) };
        v53
    } else {
        let v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" API requests"); } LIT.with(|lit| lit.clone()) };
        v54
    };
    let v56: Rc<str> = Rc::<str>::from(format!("{}{}", v51, v55));
    let v57: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) }, v56));
    let v58: Rc<str> = Rc::<str>::from(format!("{}{}", v57, v49));
    eprintln!("{}", v58);
    let v59: bool = &*v33 != "";
    if v59 {
        let v60: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
        let v61: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\nxc: "); } LIT.with(|lit| lit.clone()) };
        let v62: Rc<str> = Rc::<str>::from(v33.replace(&*v60, &*v61));
        let v63: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) }, v62));
        eprintln!("{}", v63);
        ()
    };
    let v64: bool = &*v27 == "";
    let v66: bool = if v64 {
        let v65: bool = v42 == 0i32;
        v65
    } else {
        false
    };
    if v66 {
        let v67: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: no posts matched"); } LIT.with(|lit| lit.clone()) };
        eprintln!("{}", v67);
        ()
    };
    let v68: bool = &*v41 != "";
    if v68 {
        println!("{}", v41);
        ()
    };
    if v64 {
        0i32
    } else {
        let v69: bool = v42 == 0i32;
        if v69 {
            failed_2(v27)
        } else {
            let v71: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("stopped early, showing what was read before: "); } LIT.with(|lit| lit.clone()) }, v27));
            failed_2(v71)
        }
    }
}
fn get_environment_variable_7(mut v0: Rc<str>) -> Rc<str> {
    let mut v1: Rc<str> = Rc::<str>::from(std::env::var(&*v0).unwrap_or_default());
    v1
}
fn method8(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> i32 {
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
                v2 = v12;
                continue;
            } else {
                return v2;
            }
        }
    }
}
fn method9(mut v0: Rc<str>, mut v1: i32) -> i32 {
    loop {
        let mut v2: bool = v1 <= 0i32;
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
                v1 = v3;
                continue;
            } else {
                return v3;
            }
        }
    }
}
fn env_or_6(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<str> {
    let mut v2: Rc<str> = get_environment_variable_7(v0);
    let v3: i32 = (v2.clone().len() as i32);
    let mut v4: i32 = 0i32;
    let mut v5: i32 = method8(v2.clone(), v3, v4);
    let mut v6: i32 = v3.wrapping_sub(1i32);
    let v7: Rc<str> = string_slice(&v2, v5 as i64, v6 as i64);
    let v8: i32 = (v7.clone().len() as i32);
    let mut v9: i32 = method9(v7.clone(), v8);
    let v10: Rc<str> = string_slice(&v7, 0i32 as i64, v9 as i64);
    let v11: bool = &*v10 == "";
    if v11 {
        v1
    } else {
        v10
    }
}
fn base_url_5() -> Rc<str> {
    let mut v0: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
    env_or_6(v0, v1)
}
fn method11(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure0() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let mut v1: usize = (v0);
        let mut v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method13(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
                let mut v4: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2, v1));
                (v0, v1) = (v3, v4);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn method14(mut v0: i32, mut v1: &Rc<RefCell<Mut0>>) -> bool {
    let mut v2: i32 = v1.borrow().l0;
    let v3: bool = v2 < v0;
    v3
}
fn split_list_12(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let mut v2: i32 = (v0.clone().len() as i32);
    let v3: bool = v2 == 0i32;
    if v3 {
        let mut v4: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1, v4))
    } else {
        let mut v6: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(v1.split(&*v0).map(|x| Rc::<str>::from(x)).collect::<Vec<Rc<str>>>()));
        let v7: i32 = (v6.clone().borrow().len() as i32);
        let v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v9: Rc<RefCell<Mut0>> = Rc::new(RefCell::new(Mut0 { l0: 0i32, l1: v8 }));
        while method14(v7, &v9) {
            let v11: i32 = v9.borrow().l0;
            let v12: Rc<UH0> = v9.borrow().l1.clone();
            let v13: Rc<str> = v6.borrow()[v11 as usize].clone();
            let v14: i32 = v11.wrapping_add(1i32);
            let v15: Rc<UH0> = Rc::new(UH0::UH0_Cons(v13, v12));
            v9.borrow_mut().l0 = v14;
            v9.borrow_mut().l1 = v15;
            ()
        };
        let v16: Rc<UH0> = v9.borrow().l1.clone();
        let v17: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        method13(v16, v17)
    }
}
fn method15(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
                let mut v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3, v4);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn home_plan_10(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: i32) -> (Rc<str>, Rc<str>, Rc<str>) {
    let (mut v4, mut v5, mut v6, mut v7): (i32, Rc<str>, Rc<str>, Rc<str>) = xc_users::xc_users_named(&*v0, &*v1, &*v2);
    let v8: bool = v4 != 0i32;
    let (mut v61, mut v62, mut v63): (Rc<str>, Rc<str>, Rc<str>) = if v8 {
        let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        (v9.clone(), v9.clone(), v7)
    } else {
        let v10: bool = &*v5 == "";
        let (mut v58, mut v59, mut v60): (Rc<str>, Rc<str>, Rc<str>) = if v10 {
            let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", @"); } LIT.with(|lit| lit.clone()) };
            let v13: Rc<str> = Rc::<str>::from(v2.replace(&*v11, &*v12));
            let v14: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) }, v13));
            let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v15.clone(), v15.clone(), v14)
        } else {
            let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let v17: Option<usize> = v5.find(&*v16);
            let v18: Option<usize> = method11(v17);
            let mut v19: Rc<dyn Fn((usize)) -> i32> = closure0();
            let mut v20: Option<i32> = v18.map(|x| v19(x));
            let v22: i32 = v20.unwrap_or(-1i32);
            let v23: usize = ((0i32) as usize);
            let v24: usize = ((v22) as usize);
            let v25: Rc<str> = Rc::<str>::from(&(v5)[v23..v24]);
            let v26: i32 = v22.wrapping_add(1i32);
            let v27: i32 = (v5.clone().len() as i32);
            let v28: i32 = v27.wrapping_sub(v22);
            let v29: i32 = v28.wrapping_sub(1i32);
            let v30: usize = ((v26) as usize);
            let v31: i32 = v26.wrapping_add(v29);
            let v32: usize = ((v31) as usize);
            let v33: Rc<str> = Rc::<str>::from(&(v5)[v30..v32]);
            let (mut v34, mut v35, mut v36): (i32, Rc<str>, Rc<str>) = xc_users::xc_users_followed(&*v0, &*v1, &*v25, v3);
            let v37: bool = v34 != 0i32;
            let (mut v55, mut v56, mut v57): (Rc<str>, Rc<str>, Rc<str>) = if v37 {
                let v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (v38.clone(), v38.clone(), v36)
            } else {
                let v39: bool = &*v35 == "";
                let v42: Rc<str> = if v39 {
                    v5
                } else {
                    let v40: Rc<str> = Rc::<str>::from(format!("{}{}", v5, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) }));
                    let v41: Rc<str> = Rc::<str>::from(format!("{}{}", v40, v35.clone()));
                    v41
                };
                let v46: Rc<UH0> = if v39 {
                    { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
                } else {
                    let v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                    split_list_12(v44, v35)
                };
                let v47: i32 = 0i32;
                let v48: i32 = method15(v46, v47);
                let v49: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("home timeline of @"); } LIT.with(|lit| lit.clone()) }, v33));
                let v50: Rc<str> = Rc::<str>::from(format!("{}{}", v49, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" from "); } LIT.with(|lit| lit.clone()) }));
                let v51: Rc<str> = Rc::<str>::from((v48).to_string());
                let v52: Rc<str> = Rc::<str>::from(format!("{}{}", v50, v51));
                let v53: Rc<str> = Rc::<str>::from(format!("{}{}", v52, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" followed accounts"); } LIT.with(|lit| lit.clone()) }));
                let v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (v42, v53, v54)
            };
            (v55, v56, v57)
        };
        (v58, v59, v60)
    };
    (v61, v62, v63)
}
fn method17(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2;
            let v3: Rc<UH0> = v3;
            let mut v4: Rc<UH0> = method17(v3, v1);
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", @"); } LIT.with(|lit| lit.clone()) };
            let v7: Rc<str> = Rc::<str>::from(v2.replace(&*v5, &*v6));
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) }, v7));
            Rc::new(UH0::UH0_Cons(v8, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method18(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3;
                let mut v4: Rc<UH0> = v4;
                v0.borrow_mut().push(v3);
                let mut v5: i32 = v2.wrapping_add(1i32);
                (v1, v2) = (v4, v5);
                continue;
            }
            UH0::UH0_Nil => {
                return v2;
            }
        }
    }
}
fn account_plan_16(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>, Rc<str>) {
    let (mut v3, mut v4, mut v5, mut v6): (i32, Rc<str>, Rc<str>, Rc<str>) = xc_users::xc_users_named(&*v0, &*v1, &*v2);
    let v7: bool = v3 != 0i32;
    let (mut v33, mut v34, mut v35): (Rc<str>, Rc<str>, Rc<str>) = if v7 {
        let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        (v8.clone(), v8, v6)
    } else {
        let mut v9: bool = &*v4 == "";
        let (mut v30, mut v31, mut v32): (Rc<str>, Rc<str>, Rc<str>) = if v9 {
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", @"); } LIT.with(|lit| lit.clone()) };
            let v12: Rc<str> = Rc::<str>::from(v5.replace(&*v10, &*v11));
            let v13: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) }, v12));
            let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v14.clone(), v14, v13)
        } else {
            let v15: bool = &*v5 == "";
            let mut v19: Rc<UH0> = if v15 {
                { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
            } else {
                let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                split_list_12(v17, v5)
            };
            let mut v20: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let v21: Rc<UH0> = method17(v19, v20);
            let v22: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
            let v23: i32 = 0i32;
            let v24: i32 = method18(v22.clone(), v21, v23);
            let v25: Rc<Vec<Rc<str>>> = Rc::new(v22.borrow().clone());
            let v26: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v25).as_ref().clone()));
            let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            let v28: Rc<str> = Rc::<str>::from((*v26.borrow()).join(&*v27));
            let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v4, v28, v29)
        };
        (v30, v31, v32)
    };
    (v33, v34, v35)
}
fn run_timeline_0(mut v0: i32, mut v1: Rc<str>, mut v2: bool, mut v3: Rc<str>, mut v4: i32, mut v5: i32, mut v6: i32, mut v7: i32, mut v8: Rc<str>, mut v9: Rc<str>, mut v10: bool, mut v11: bool, mut v12: i32, mut v13: bool, mut v14: bool) -> i32 {
    let v15: Rc<str> = base_url_5();
    let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_BEARER_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v18: Rc<str> = env_or_6(v16, v17);
    let mut v19: bool = &*v18 == "";
    if v19 {
        missing_bearer_1()
    } else {
        let (mut v27, mut v28, mut v29): (Rc<str>, Rc<str>, Rc<str>) = if v2 {
            let (mut v21, mut v22, mut v23): (Rc<str>, Rc<str>, Rc<str>) = home_plan_10(v15.clone(), v18.clone(), v3.clone(), v7);
            (v21, v22, v23)
        } else {
            let (mut v24, mut v25, mut v26): (Rc<str>, Rc<str>, Rc<str>) = account_plan_16(v15.clone(), v18.clone(), v3.clone());
            (v24, v25, v26)
        };
        let v30: bool = &*v29 != "";
        if v30 {
            failed_2(v29)
        } else {
            shown_timeline_3(v15, v18, v27, v28, v29, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
        }
    }
}
fn reported_20(mut v0: i32, mut v1: Rc<str>) -> i32 {
    let mut v2: bool = v0 == 0i32;
    if v2 {
        println!("{}", v1);
        ()
    } else {
        let v3: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) }, v1));
        eprintln!("{}", v3);
        ()
    };
    v0
}
fn run_refresh_19(mut v0: Rc<str>) -> i32 {
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_CLIENT_ID"); } LIT.with(|lit| lit.clone()) };
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v3: Rc<str> = env_or_6(v1.clone(), v2.clone());
    let mut v4: bool = &*v3 != "";
    let v8: bool = if v4 {
        let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_CLIENT_SECRET"); } LIT.with(|lit| lit.clone()) };
        let mut v6: Rc<str> = env_or_6(v5, v2.clone());
        let v7: bool = &*v6 != "";
        v7
    } else {
        false
    };
    let v12: bool = if v8 {
        let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN"); } LIT.with(|lit| lit.clone()) };
        let v10: Rc<str> = env_or_6(v9, v2.clone());
        let v11: bool = &*v10 != "";
        v11
    } else {
        false
    };
    if v12 {
        let v13: Rc<str> = base_url_5();
        let v14: Rc<str> = env_or_6(v1, v2.clone());
        let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_CLIENT_SECRET"); } LIT.with(|lit| lit.clone()) };
        let v16: Rc<str> = env_or_6(v15, v2.clone());
        let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_REFRESH_TOKEN"); } LIT.with(|lit| lit.clone()) };
        let v18: Rc<str> = env_or_6(v17, v2);
        let (mut v19, mut v20): (i32, Rc<str>) = xc_token::xc_refresh(&*v13, &*v14, &*v16, &*v18, &*v0);
        reported_20(v19, v20)
    } else {
        let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: refresh needs X_OAUTH2_CLIENT_ID, X_OAUTH2_CLIENT_SECRET and X_OAUTH2_REFRESH_TOKEN"); } LIT.with(|lit| lit.clone()) };
        eprintln!("{}", v22);
        3i32
    }
}
fn platform_name_21() -> Rc<str> {
    let mut v0: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_SITE"); } LIT.with(|lit| lit.clone()) };
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("x"); } LIT.with(|lit| lit.clone()) };
    env_or_6(v0, v1)
}
fn run_thread_22(mut v0: Rc<str>) -> i32 {
    let mut v1: Rc<str> = base_url_5();
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_BEARER_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v4: Rc<str> = env_or_6(v2, v3.clone());
    let mut v5: bool = &*v4 == "";
    if v5 {
        missing_bearer_1()
    } else {
        let (mut v7, mut v8, mut v9): (i32, Rc<str>, Rc<str>) = xc_thread::xc_thread_pages(&*v1, &*v4, &*v0);
        let v10: bool = v7 == 0i32;
        let (mut v14, mut v15, mut v16): (i32, Rc<str>, Rc<str>) = if v10 {
            let (mut v11, mut v12, mut v13): (i32, Rc<str>, Rc<str>) = xc_assemble::xc_assemble(&xc_locate::xc_locate(&*v8));
            (v11, v12, v13)
        } else {
            (v7, v3, v9)
        };
        let v17: bool = &*v16 != "";
        if v17 {
            let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\nxc: "); } LIT.with(|lit| lit.clone()) };
            let mut v20: Rc<str> = Rc::<str>::from(v16.replace(&*v18, &*v19));
            let v21: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) }, v20));
            eprintln!("{}", v21);
            ()
        };
        let v22: bool = &*v15 != "";
        if v22 {
            println!("{}", v15);
            ()
        };
        let v23: i32 = xc_net::xc_requests();
        let v24: Rc<str> = Rc::<str>::from((v23).to_string());
        let v25: bool = v23 == 1i32;
        let v28: Rc<str> = if v25 {
            let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" API request"); } LIT.with(|lit| lit.clone()) };
            v26
        } else {
            let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" API requests"); } LIT.with(|lit| lit.clone()) };
            v27
        };
        let v29: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v28));
        let v30: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) }, v29));
        let v31: Rc<str> = Rc::<str>::from(format!("{}{}", v30, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }));
        eprintln!("{}", v31);
        v14
    }
}
fn signed_25(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: &Rc<str>) -> bool {
    let mut v5: bool = &*v0 != "";
    let v7: bool = if v5 {
        let mut v6: bool = &*v1 != "";
        v6
    } else {
        false
    };
    let mut v9: bool = if v7 {
        let v8: bool = &*v2 != "";
        v8
    } else {
        false
    };
    if v9 {
        let v10: bool = &*v3 != "";
        v10
    } else {
        false
    }
}
fn run_write_24(mut v0: i32, mut v1: Rc<str>) -> i32 {
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_CONSUMER_KEY"); } LIT.with(|lit| lit.clone()) };
    let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v4: Rc<str> = env_or_6(v2, v3.clone());
    let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_CONSUMER_SECRET"); } LIT.with(|lit| lit.clone()) };
    let mut v6: Rc<str> = env_or_6(v5, v3.clone());
    let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH1_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let v8: Rc<str> = env_or_6(v7, v3.clone());
    let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH1_ACCESS_TOKEN_SECRET"); } LIT.with(|lit| lit.clone()) };
    let v10: Rc<str> = env_or_6(v9, v3.clone());
    let v11: bool = signed_25(v4.clone(), v6.clone(), v8.clone(), v10.clone(), &v3);
    let v14: bool = if v11 {
        let v12: Rc<str> = platform_name_21();
        let v13: bool = &*v12 != "mastodon";
        v13
    } else {
        false
    };
    let (mut v21, mut v22, mut v23, mut v24, mut v25): (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) = if v14 {
        (v4, v6, v8, v10, v3.clone())
    } else {
        let v15: Rc<str> = platform_name_21();
        let v16: bool = &*v15 == "mastodon";
        let mut v19: Rc<str> = if v16 {
            let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("MASTODON_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
            v17
        } else {
            let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
            v18
        };
        let mut v20: Rc<str> = env_or_6(v19, v3.clone());
        (v4, v6, v8, v10, v20)
    };
    let v26: Rc<str> = platform_name_21();
    let v27: bool = &*v26 == "x";
    let v30: bool = if v27 {
        true
    } else {
        let v28: Rc<str> = platform_name_21();
        let v29: bool = &*v28 == "mastodon";
        v29
    };
    let v33: bool = if v30 {
        true
    } else {
        let v31: Rc<str> = platform_name_21();
        let v32: bool = &*v31 == "bluesky";
        v32
    };
    let v34: bool = v33 == false;
    if v34 {
        let v35: Rc<str> = platform_name_21();
        let v36: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: XC_SITE must be x, mastodon or bluesky, got "); } LIT.with(|lit| lit.clone()) }, v35));
        eprintln!("{}", v36);
        2i32
    } else {
        let v37: Rc<str> = platform_name_21();
        let v38: bool = &*v37 == "bluesky";
        let v46: bool = if v38 {
            let v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("BLUESKY_APP_PASSWORD"); } LIT.with(|lit| lit.clone()) };
            let v40: Rc<str> = env_or_6(v39, v3.clone());
            let v41: bool = &*v40 == "";
            v41
        } else {
            let v42: bool = signed_25(v21.clone(), v22.clone(), v23.clone(), v24.clone(), &v25);
            let v43: bool = v42 == false;
            if v43 {
                let v44: bool = &*v25 == "";
                v44
            } else {
                false
            }
        };
        if v46 {
            let v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: posting needs user credentials: X_CONSUMER_KEY, X_CONSUMER_SECRET, X_OAUTH1_ACCESS_TOKEN and"); } LIT.with(|lit| lit.clone()) };
            eprintln!("{}", v47);
            let v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("    X_OAUTH1_ACCESS_TOKEN_SECRET (OAuth 1.0a, never expire), or X_OAUTH2_ACCESS_TOKEN (OAuth 2.0, 2 hours)"); } LIT.with(|lit| lit.clone()) };
            eprintln!("{}", v48);
            3i32
        } else {
            let v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_OAUTH1_NONCE"); } LIT.with(|lit| lit.clone()) };
            let v50: Rc<str> = xc_net::xc_fresh_nonce();
            let v51: Rc<str> = env_or_6(v49, v50);
            let v52: Rc<str> = platform_name_21();
            let v53: bool = &*v52 == "mastodon";
            let v63: Rc<str> = if v53 {
                let v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("MASTODON_BASE_URL"); } LIT.with(|lit| lit.clone()) };
                env_or_6(v54, v3)
            } else {
                let v56: Rc<str> = platform_name_21();
                let v57: bool = &*v56 == "bluesky";
                if v57 {
                    let v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("BLUESKY_BASE_URL"); } LIT.with(|lit| lit.clone()) };
                    let v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://bsky.social"); } LIT.with(|lit| lit.clone()) };
                    env_or_6(v58, v59)
                } else {
                    base_url_5()
                }
            };
            let v64: Rc<str> = platform_name_21();
            let v65: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_OAUTH1_TIMESTAMP"); } LIT.with(|lit| lit.clone()) };
            let v66: Rc<str> = xc_net::xc_unix_seconds();
            let v67: Rc<str> = env_or_6(v65, v66);
            let (mut v68, mut v69): (i32, Rc<str>) = xc_write::xc_write(&*v63, &*v25, &*v21, &*v22, &*v23, &*v24, &*v51, &*v67, v0, &*v1, &*v64);
            reported_20(v68, v69)
        }
    }
}
fn run_delete_thread_23(mut v0: Rc<str>) -> i32 {
    let mut v1: Rc<str> = base_url_5();
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_BEARER_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v4: Rc<str> = env_or_6(v2, v3);
    let mut v5: bool = &*v4 == "";
    if v5 {
        missing_bearer_1()
    } else {
        let (mut v7, mut v8, mut v9): (i32, Rc<str>, Rc<str>) = xc_thread::xc_thread_ids(&*v1, &*v4, &*v0);
        let v10: bool = v7 != 0i32;
        if v10 {
            failed_2(v9)
        } else {
            let v12: i32 = 9i32;
            run_write_24(v12, v8)
        }
    }
}
fn file_exists_27(mut v0: Rc<str>) -> bool {
    let mut v2: &str = &*v0;
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
fn method28(mut v0: Vec<u8>) -> Vec<u8> {
    v0
}
fn run_resume_thread_26(mut v0: Rc<str>) -> i32 {
    let mut v1: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let mut v2: Option<usize> = v0.find(&*v1);
    let v3: Option<usize> = method11(v2);
    let mut v4: Rc<dyn Fn((usize)) -> i32> = closure0();
    let mut v5: Option<i32> = v3.map(|x| v4(x));
    let v7: i32 = v5.unwrap_or(-1i32);
    let v8: usize = ((0i32) as usize);
    let mut v9: usize = ((v7) as usize);
    let v10: Rc<str> = Rc::<str>::from(&(v0)[v8..v9]);
    let v11: i32 = v7.wrapping_add(1i32);
    let v12: i32 = (v0.clone().len() as i32);
    let v13: i32 = v12.wrapping_sub(v11);
    let v14: usize = ((v11) as usize);
    let v15: i32 = v11.wrapping_add(v13);
    let v16: usize = ((v15) as usize);
    let v17: Rc<str> = Rc::<str>::from(&(v0)[v14..v16]);
    let v18: Rc<str> = base_url_5();
    let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_BEARER_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v21: Rc<str> = env_or_6(v19, v20);
    let v22: bool = file_exists_27(v17.clone());
    let v23: bool = v22 == false;
    if v23 {
        let v24: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no such file "); } LIT.with(|lit| lit.clone()) }, v17));
        failed_2(v24)
    } else {
        let v26: bool = &*v21 == "";
        if v26 {
            missing_bearer_1()
        } else {
            let (mut v28, mut v29, mut v30): (i32, Rc<str>, Rc<str>) = xc_chain::xc_chain(&*v18, &*v21, &*v10);
            let v31: bool = v28 != 0i32;
            if v31 {
                failed_2(v30)
            } else {
                let v33: i32 = 10i32;
                let v35: Result<Vec<u8>, std::io::Error> = std::fs::read(&*v17);
                let v37: Vec<u8> = v35.unwrap();
                let v38: Vec<u8> = method28(v37);
                let v40: Result<std::string::String, std::string::FromUtf8Error> = std::string::String::from_utf8(v38);
                let v42: std::string::String = v40.unwrap();
                let v44: Rc<str> = Rc::<str>::from(String::as_str(&v42));
                let v45: Rc<str> = platform_name_21();
                let v46: Rc<str> = xc_frames::xc_frames(&*v45, &*v44);
                let v47: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"planned\":"); } LIT.with(|lit| lit.clone()) }, v46));
                let v48: Rc<str> = Rc::<str>::from(format!("{}{}", v47, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"found\":"); } LIT.with(|lit| lit.clone()) }));
                let v49: Rc<str> = Rc::<str>::from(format!("{}{}", v48, v29));
                let v50: Rc<str> = Rc::<str>::from(format!("{}{}", v49, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) }));
                run_write_24(v33, v50)
            }
        }
    }
}
fn run_post_thread_30(mut v0: bool, mut v1: Rc<str>) -> i32 {
    let mut v2: bool = file_exists_27(v1.clone());
    let v3: bool = v2 == false;
    if v3 {
        let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no such file "); } LIT.with(|lit| lit.clone()) }, v1));
        failed_2(v4)
    } else {
        if v0 {
            let v7: Result<Vec<u8>, std::io::Error> = std::fs::read(&*v1);
            let mut v9: Vec<u8> = v7.unwrap();
            let v10: Vec<u8> = method28(v9);
            let v12: Result<std::string::String, std::string::FromUtf8Error> = std::string::String::from_utf8(v10);
            let v14: std::string::String = v12.unwrap();
            let v16: Rc<str> = Rc::<str>::from(String::as_str(&v14));
            let v17: Rc<str> = platform_name_21();
            let v18: Rc<str> = xc_preview::xc_preview(&*v17, &*v16);
            println!("{}", v18);
            0i32
        } else {
            let mut v19: i32 = 7i32;
            let v21: Result<Vec<u8>, std::io::Error> = std::fs::read(&*v1);
            let v23: Vec<u8> = v21.unwrap();
            let v24: Vec<u8> = method28(v23);
            let v26: Result<std::string::String, std::string::FromUtf8Error> = std::string::String::from_utf8(v24);
            let v28: std::string::String = v26.unwrap();
            let v30: Rc<str> = Rc::<str>::from(String::as_str(&v28));
            let v31: Rc<str> = platform_name_21();
            let v32: Rc<str> = xc_frames::xc_frames(&*v31, &*v30);
            run_write_24(v19, v32)
        }
    }
}
fn method29(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2;
                let v3: Rc<UH0> = v3;
                let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("=== "); } LIT.with(|lit| lit.clone()) }, v2.clone()));
                println!("{}", v4);
                let mut v5: bool = true;
                let mut v6: i32 = run_post_thread_30(v5, v2);
                let v7: bool = v6 > v1;
                let v8: i32 = if v7 {
                    v6
                } else {
                    v1
                };
                (v0, v1) = (v3, v8);
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
        run_timeline_0(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14)
    } else {
        let v17: bool = v0 == 3i32;
        if v17 {
            let v18: Rc<str> = xc_args::xc_usage();
            println!("{}", v18);
            0i32
        } else {
            let mut v19: bool = v0 == 4i32;
            if v19 {
                let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) }, v1));
                eprintln!("{}", v20);
                let v21: Rc<str> = xc_args::xc_usage();
                eprintln!("{}", v21);
                2i32
            } else {
                let v22: bool = v0 == 5i32;
                if v22 {
                    run_refresh_19(v1)
                } else {
                    let v24: bool = v0 >= 6i32;
                    if v24 {
                        let v25: Rc<str> = platform_name_21();
                        let v26: bool = v0 == 9i32;
                        let v28: bool = if v26 {
                            true
                        } else {
                            let v27: bool = v0 == 10i32;
                            v27
                        };
                        let v30: bool = if v28 {
                            let v29: bool = &*v25 != "x";
                            v29
                        } else {
                            false
                        };
                        if v30 {
                            let v31: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: delete-thread and --resume read threads through X's API, which needs XC_SITE=x, not "); } LIT.with(|lit| lit.clone()) }, v25));
                            eprintln!("{}", v31);
                            2i32
                        } else {
                            let v32: bool = v0 == 6i32;
                            if v32 {
                                run_thread_22(v1)
                            } else {
                                if v26 {
                                    run_delete_thread_23(v1)
                                } else {
                                    let v35: bool = v0 == 10i32;
                                    if v35 {
                                        run_resume_thread_26(v1)
                                    } else {
                                        let v37: bool = v0 == 11i32;
                                        if v37 {
                                            let v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                                            let v39: Rc<UH0> = split_list_12(v38, v1);
                                            let v40: i32 = 0i32;
                                            method29(v39, v40)
                                        } else {
                                            let v42: bool = v0 == 12i32;
                                            if v42 {
                                                let v43: Rc<str> = platform_name_21();
                                                let v44: Rc<str> = xc_census::xc_census_files(&*v43, &*v1);
                                                println!("{}", v44);
                                                0i32
                                            } else {
                                                let v45: bool = v0 == 13i32;
                                                if v45 {
                                                    let v46: Rc<str> = xc_events::xc_events(&*v1);
                                                    println!("{}", v46);
                                                    0i32
                                                } else {
                                                    let v47: bool = v0 == 8i32;
                                                    run_post_thread_30(v47, v1)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        run_write_24(v0, v1)
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
