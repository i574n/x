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
fn referenced_docs_2(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: i32, mut v9: Rc<str>, mut v10: Rc<str>, mut v11: bool, mut v12: bool, mut v13: i32, mut v14: bool) -> (Rc<str>, Rc<str>) {
    let mut v15: bool = v4.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v16: bool = v15 != true;
    let mut v18: bool = if v16 {
        true
    } else {
        let mut v17: bool = v13 == 0i32;
        v17
    };
    if v18 {
        (v2.clone(), v4.clone())
    } else {
        let (mut v19, mut v20, mut v21): (Rc<str>, Rc<str>, Rc<str>) = xc_refs::xc_refs(&*v0, &*v1, &*v5, &*v6, &*v7, v13, v14);
        let mut v22: bool = v19.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v28: Rc<str> = if v22 {
            v2.clone()
        } else {
            let mut v23: bool = v2.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            if v23 {
                v19.clone()
            } else {
                let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                let mut v25: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v24));
                let mut v26: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v19));
                v26.clone()
            }
        };
        let mut v29: bool = v20.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v30: bool = v29 != true;
        let mut v32: bool = if v30 {
            true
        } else {
            let mut v31: bool = v21.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v31
        };
        if v32 {
            (v28.clone(), v20.clone())
        } else {
            let (mut v33, mut v34, mut v35): (i32, Rc<str>, Rc<str>) = xc_users::xc_users_by_ids(&*v0, &*v1, &*v21);
            let mut v36: bool = v33 == 0i32;
            if v36 {
                let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",{\"role\":\"users\",\"author\":\"\",\"doc\":"); } LIT.with(|lit| lit.clone()) };
                let mut v38: Rc<str> = Rc::<str>::from(format!("{}{}", v37, v34));
                let mut v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
                let mut v40: Rc<str> = Rc::<str>::from(format!("{}{}", v38, v39));
                let mut v41: Rc<str> = Rc::<str>::from(format!("{}{}", v28, v40));
                let mut v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (v41.clone(), v42.clone())
            } else {
                (v28.clone(), v35.clone())
            }
        }
    }
}
fn shown_timeline_1(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: i32, mut v6: Rc<str>, mut v7: bool, mut v8: Rc<str>, mut v9: i32, mut v10: i32, mut v11: i32, mut v12: i32, mut v13: Rc<str>, mut v14: Rc<str>, mut v15: bool, mut v16: bool, mut v17: i32, mut v18: bool) -> i32 {
    let (mut v19, mut v20, mut v21, mut v22, mut v23, mut v24): (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) = xc_fetch::xc_fetch(&*v0, &*v1, &*v2, v9, &*v13, &*v14, v15, v16, v17, v18);
    let (mut v25, mut v26): (Rc<str>, Rc<str>) = referenced_docs_2(v0.clone(), v1.clone(), v19.clone(), v20.clone(), v21.clone(), v22.clone(), v23.clone(), v24.clone(), v9, v13.clone(), v14.clone(), v15, v16, v17, v18);
    let mut v27: bool = v3.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v33: Rc<str> = if v27 {
        v20.clone()
    } else {
        let mut v28: bool = v20.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        if v28 {
            v3.clone()
        } else {
            let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            let mut v30: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v29));
            let mut v31: Rc<str> = Rc::<str>::from(format!("{}{}", v30, v20));
            v31.clone()
        }
    };
    let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
    let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v25));
    let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
    let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v36));
    let (mut v38, mut v39): (Rc<str>, i32) = xc_view::xc_view(&*v37, v10, v11, v17, v18);
    let mut v40: bool = v33.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v41: bool = v40 != true;
    if v41 {
        let mut v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
        let mut v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\nxc: "); } LIT.with(|lit| lit.clone()) };
        let mut v44: Rc<str> = Rc::<str>::from(v33.replace(&*v42, &*v43));
        let mut v45: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
        let mut v46: Rc<str> = Rc::<str>::from(format!("{}{}", v45, v44));
        eprintln!("{}", v46);
        ()
    };
    let mut v47: bool = v26.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v49: bool = if v47 {
        let mut v48: bool = v39 == 0i32;
        v48
    } else {
        false
    };
    if v49 {
        let mut v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: no posts matched"); } LIT.with(|lit| lit.clone()) };
        eprintln!("{}", v50);
        ()
    };
    let mut v51: bool = v38.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v52: bool = v51 != true;
    if v52 {
        println!("{}", v38);
        ()
    };
    if v47 {
        0i32
    } else {
        let mut v53: bool = v39 == 0i32;
        if v53 {
            let mut v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
            let mut v55: Rc<str> = Rc::<str>::from(format!("{}{}", v54, v26));
            eprintln!("{}", v55);
            4i32
        } else {
            let mut v56: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("stopped early, showing what was read before: "); } LIT.with(|lit| lit.clone()) };
            let mut v57: Rc<str> = Rc::<str>::from(format!("{}{}", v56, v26));
            let mut v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
            let mut v59: Rc<str> = Rc::<str>::from(format!("{}{}", v58, v57));
            eprintln!("{}", v59);
            4i32
        }
    }
}
fn get_environment_variable_3(mut v0: Rc<str>) -> Rc<str> {
    let mut v1: Rc<str> = Rc::<str>::from(std::env::var(&*v0).unwrap_or_default());
    v1.clone()
}
fn method4(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> i32 {
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
fn method5(mut v0: Rc<str>, mut v1: i32) -> i32 {
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
fn split_on_7(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
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
        let mut v12: Rc<UH0> = split_on_7(v0.clone(), v11.clone());
        Rc::new(UH0::UH0_Cons(v6.clone(), v12.clone()))
    }
}
fn method8(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
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
fn home_plan_6(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: i32) -> (Rc<str>, Rc<str>, Rc<str>) {
    let (mut v4, mut v5, mut v6, mut v7): (i32, Rc<str>, Rc<str>, Rc<str>) = xc_users::xc_users_named(&*v0, &*v1, &*v2);
    let mut v8: bool = v4 == 0i32;
    let mut v9: bool = v8 != true;
    let (mut v58, mut v59, mut v60): (Rc<str>, Rc<str>, Rc<str>) = if v9 {
        let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        (v10.clone(), v10.clone(), v7.clone())
    } else {
        let mut v11: bool = v5.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let (mut v55, mut v56, mut v57): (Rc<str>, Rc<str>, Rc<str>) = if v11 {
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", @"); } LIT.with(|lit| lit.clone()) };
            let mut v14: Rc<str> = Rc::<str>::from(v2.replace(&*v12, &*v13));
            let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
            let mut v16: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v14));
            let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v17.clone(), v17.clone(), v16.clone())
        } else {
            let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let mut v19: i32 = v5.find(&*v18).map(|i| i as i32).unwrap_or(-1);
            let mut v20: Rc<str> = Rc::<str>::from(&(v5)[((0i32) as usize)..(((0i32) + (v19)) as usize)]);
            let mut v21: i32 = v19.wrapping_add(1i32);
            let mut v22: i32 = (v5.clone().len() as i32);
            let mut v23: i32 = v22.wrapping_sub(v19);
            let mut v24: i32 = v23.wrapping_sub(1i32);
            let mut v25: Rc<str> = Rc::<str>::from(&(v5)[((v21) as usize)..(((v21) + (v24)) as usize)]);
            let (mut v26, mut v27, mut v28): (i32, Rc<str>, Rc<str>) = xc_users::xc_users_followed(&*v0, &*v1, &*v20, v3);
            let mut v29: bool = v26 == 0i32;
            let mut v30: bool = v29 != true;
            let (mut v52, mut v53, mut v54): (Rc<str>, Rc<str>, Rc<str>) = if v30 {
                let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (v31.clone(), v31.clone(), v28.clone())
            } else {
                let mut v32: bool = v27.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v36: Rc<str> = if v32 {
                    v5.clone()
                } else {
                    let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                    let mut v34: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v33));
                    let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v27));
                    v35.clone()
                };
                let mut v40: Rc<UH0> = if v32 {
                    { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
                } else {
                    let mut v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                    split_on_7(v38.clone(), v27.clone())
                };
                let mut v41: i32 = 0i32;
                let mut v42: i32 = method8(v40.clone(), v41);
                let mut v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("home timeline of @"); } LIT.with(|lit| lit.clone()) };
                let mut v44: Rc<str> = Rc::<str>::from(format!("{}{}", v43, v25));
                let mut v45: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" from "); } LIT.with(|lit| lit.clone()) };
                let mut v46: Rc<str> = Rc::<str>::from(format!("{}{}", v44, v45));
                let mut v47: Rc<str> = Rc::<str>::from(format!("{:?}", v42));
                let mut v48: Rc<str> = Rc::<str>::from(format!("{}{}", v46, v47));
                let mut v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" followed accounts"); } LIT.with(|lit| lit.clone()) };
                let mut v50: Rc<str> = Rc::<str>::from(format!("{}{}", v48, v49));
                let mut v51: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (v36.clone(), v50.clone(), v51.clone())
            };
            (v52.clone(), v53.clone(), v54.clone())
        };
        (v55.clone(), v56.clone(), v57.clone())
    };
    (v58.clone(), v59.clone(), v60.clone())
}
fn method10(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method10(v3.clone(), v1.clone());
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
fn method11(mut v0: Rc<UH0>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method11(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
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
fn account_plan_9(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>, Rc<str>) {
    let (mut v3, mut v4, mut v5, mut v6): (i32, Rc<str>, Rc<str>, Rc<str>) = xc_users::xc_users_named(&*v0, &*v1, &*v2);
    let mut v7: bool = v3 == 0i32;
    let mut v8: bool = v7 != true;
    let (mut v30, mut v31, mut v32): (Rc<str>, Rc<str>, Rc<str>) = if v8 {
        let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        (v9.clone(), v9.clone(), v6.clone())
    } else {
        let mut v10: bool = v4.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let (mut v27, mut v28, mut v29): (Rc<str>, Rc<str>, Rc<str>) = if v10 {
            let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", @"); } LIT.with(|lit| lit.clone()) };
            let mut v13: Rc<str> = Rc::<str>::from(v5.replace(&*v11, &*v12));
            let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
            let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v13));
            let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v16.clone(), v16.clone(), v15.clone())
        } else {
            let mut v17: bool = v5.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v21: Rc<UH0> = if v17 {
                { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
            } else {
                let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                split_on_7(v19.clone(), v5.clone())
            };
            let mut v22: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v23: Rc<UH0> = method10(v21.clone(), v22.clone());
            let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v25, mut v26): (Rc<str>, Rc<str>) = method11(v23.clone(), v24.clone());
            (v4.clone(), v25.clone(), v24.clone())
        };
        (v27.clone(), v28.clone(), v29.clone())
    };
    (v30.clone(), v31.clone(), v32.clone())
}
fn run_timeline_0(mut v0: i32, mut v1: Rc<str>, mut v2: bool, mut v3: Rc<str>, mut v4: i32, mut v5: i32, mut v6: i32, mut v7: i32, mut v8: Rc<str>, mut v9: Rc<str>, mut v10: bool, mut v11: bool, mut v12: i32, mut v13: bool) -> i32 {
    let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
    let mut v15: Rc<str> = get_environment_variable_3(v14.clone());
    let mut v16: i32 = (v15.clone().len() as i32);
    let mut v17: i32 = 0i32;
    let mut v18: i32 = method4(v15.clone(), v16, v17);
    let mut v19: i32 = v16.wrapping_sub(1i32);
    let mut v20: Rc<str> = string_slice(&v15.clone(), v18 as i64, v19 as i64);
    let mut v21: i32 = (v20.clone().len() as i32);
    let mut v22: i32 = method5(v20.clone(), v21);
    let mut v23: Rc<str> = string_slice(&v20.clone(), 0i32 as i64, v22 as i64);
    let mut v24: bool = v23.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v26: Rc<str> = if v24 {
        let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
        v25.clone()
    } else {
        v23.clone()
    };
    let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_BEARER_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let mut v28: Rc<str> = get_environment_variable_3(v27.clone());
    let mut v29: i32 = (v28.clone().len() as i32);
    let mut v30: i32 = 0i32;
    let mut v31: i32 = method4(v28.clone(), v29, v30);
    let mut v32: i32 = v29.wrapping_sub(1i32);
    let mut v33: Rc<str> = string_slice(&v28.clone(), v31 as i64, v32 as i64);
    let mut v34: i32 = (v33.clone().len() as i32);
    let mut v35: i32 = method5(v33.clone(), v34);
    let mut v36: Rc<str> = string_slice(&v33.clone(), 0i32 as i64, v35 as i64);
    let mut v37: bool = v36.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v39: Rc<str> = if v37 {
        let mut v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v38.clone()
    } else {
        v36.clone()
    };
    let mut v40: bool = v39.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    if v40 {
        let mut v41: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: X_BEARER_TOKEN is not set; generate the app's bearer token at https://console.x.com"); } LIT.with(|lit| lit.clone()) };
        eprintln!("{}", v41);
        3i32
    } else {
        let (mut v48, mut v49, mut v50): (Rc<str>, Rc<str>, Rc<str>) = if v2 {
            let (mut v42, mut v43, mut v44): (Rc<str>, Rc<str>, Rc<str>) = home_plan_6(v26.clone(), v39.clone(), v3.clone(), v7);
            (v42.clone(), v43.clone(), v44.clone())
        } else {
            let (mut v45, mut v46, mut v47): (Rc<str>, Rc<str>, Rc<str>) = account_plan_9(v26.clone(), v39.clone(), v3.clone());
            (v45.clone(), v46.clone(), v47.clone())
        };
        let mut v51: bool = v50.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v52: bool = v51 != true;
        if v52 {
            let mut v53: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
            let mut v54: Rc<str> = Rc::<str>::from(format!("{}{}", v53, v50));
            eprintln!("{}", v54);
            4i32
        } else {
            shown_timeline_1(v26.clone(), v39.clone(), v48.clone(), v49.clone(), v50.clone(), v0, v1.clone(), v2, v3.clone(), v4, v5, v6, v7, v8.clone(), v9.clone(), v10, v11, v12, v13)
        }
    }
}
fn run_write_12(mut v0: i32, mut v1: Rc<str>) -> i32 {
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_CONSUMER_KEY"); } LIT.with(|lit| lit.clone()) };
    let mut v3: Rc<str> = get_environment_variable_3(v2.clone());
    let mut v4: i32 = (v3.clone().len() as i32);
    let mut v5: i32 = 0i32;
    let mut v6: i32 = method4(v3.clone(), v4, v5);
    let mut v7: i32 = v4.wrapping_sub(1i32);
    let mut v8: Rc<str> = string_slice(&v3.clone(), v6 as i64, v7 as i64);
    let mut v9: i32 = (v8.clone().len() as i32);
    let mut v10: i32 = method5(v8.clone(), v9);
    let mut v11: Rc<str> = string_slice(&v8.clone(), 0i32 as i64, v10 as i64);
    let mut v12: bool = v11.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v14: Rc<str> = if v12 {
        let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v13.clone()
    } else {
        v11.clone()
    };
    let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_CONSUMER_SECRET"); } LIT.with(|lit| lit.clone()) };
    let mut v16: Rc<str> = get_environment_variable_3(v15.clone());
    let mut v17: i32 = (v16.clone().len() as i32);
    let mut v18: i32 = 0i32;
    let mut v19: i32 = method4(v16.clone(), v17, v18);
    let mut v20: i32 = v17.wrapping_sub(1i32);
    let mut v21: Rc<str> = string_slice(&v16.clone(), v19 as i64, v20 as i64);
    let mut v22: i32 = (v21.clone().len() as i32);
    let mut v23: i32 = method5(v21.clone(), v22);
    let mut v24: Rc<str> = string_slice(&v21.clone(), 0i32 as i64, v23 as i64);
    let mut v25: bool = v24.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v27: Rc<str> = if v25 {
        let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v26.clone()
    } else {
        v24.clone()
    };
    let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH1_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
    let mut v29: Rc<str> = get_environment_variable_3(v28.clone());
    let mut v30: i32 = (v29.clone().len() as i32);
    let mut v31: i32 = 0i32;
    let mut v32: i32 = method4(v29.clone(), v30, v31);
    let mut v33: i32 = v30.wrapping_sub(1i32);
    let mut v34: Rc<str> = string_slice(&v29.clone(), v32 as i64, v33 as i64);
    let mut v35: i32 = (v34.clone().len() as i32);
    let mut v36: i32 = method5(v34.clone(), v35);
    let mut v37: Rc<str> = string_slice(&v34.clone(), 0i32 as i64, v36 as i64);
    let mut v38: bool = v37.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v40: Rc<str> = if v38 {
        let mut v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v39.clone()
    } else {
        v37.clone()
    };
    let mut v41: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH1_ACCESS_TOKEN_SECRET"); } LIT.with(|lit| lit.clone()) };
    let mut v42: Rc<str> = get_environment_variable_3(v41.clone());
    let mut v43: i32 = (v42.clone().len() as i32);
    let mut v44: i32 = 0i32;
    let mut v45: i32 = method4(v42.clone(), v43, v44);
    let mut v46: i32 = v43.wrapping_sub(1i32);
    let mut v47: Rc<str> = string_slice(&v42.clone(), v45 as i64, v46 as i64);
    let mut v48: i32 = (v47.clone().len() as i32);
    let mut v49: i32 = method5(v47.clone(), v48);
    let mut v50: Rc<str> = string_slice(&v47.clone(), 0i32 as i64, v49 as i64);
    let mut v51: bool = v50.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v53: Rc<str> = if v51 {
        let mut v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v52.clone()
    } else {
        v50.clone()
    };
    let mut v54: bool = v14.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v55: bool = v54 != true;
    let mut v58: bool = if v55 {
        let mut v56: bool = v27.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v57: bool = v56 != true;
        v57
    } else {
        false
    };
    let mut v61: bool = if v58 {
        let mut v59: bool = v40.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v60: bool = v59 != true;
        v60
    } else {
        false
    };
    let mut v64: bool = if v61 {
        let mut v62: bool = v53.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v63: bool = v62 != true;
        v63
    } else {
        false
    };
    let (mut v79, mut v80, mut v81, mut v82, mut v83): (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) = if v64 {
        let mut v65: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        (v14.clone(), v27.clone(), v40.clone(), v53.clone(), v65.clone())
    } else {
        let mut v66: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH2_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
        let mut v67: Rc<str> = get_environment_variable_3(v66.clone());
        let mut v68: i32 = (v67.clone().len() as i32);
        let mut v69: i32 = 0i32;
        let mut v70: i32 = method4(v67.clone(), v68, v69);
        let mut v71: i32 = v68.wrapping_sub(1i32);
        let mut v72: Rc<str> = string_slice(&v67.clone(), v70 as i64, v71 as i64);
        let mut v73: i32 = (v72.clone().len() as i32);
        let mut v74: i32 = method5(v72.clone(), v73);
        let mut v75: Rc<str> = string_slice(&v72.clone(), 0i32 as i64, v74 as i64);
        let mut v76: bool = v75.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v78: Rc<str> = if v76 {
            let mut v77: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v77.clone()
        } else {
            v75.clone()
        };
        (v14.clone(), v27.clone(), v40.clone(), v53.clone(), v78.clone())
    };
    let mut v84: bool = v79.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v85: bool = v84 != true;
    let mut v88: bool = if v85 {
        let mut v86: bool = v80.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v87: bool = v86 != true;
        v87
    } else {
        false
    };
    let mut v91: bool = if v88 {
        let mut v89: bool = v81.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v90: bool = v89 != true;
        v90
    } else {
        false
    };
    let mut v94: bool = if v91 {
        let mut v92: bool = v82.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v93: bool = v92 != true;
        v93
    } else {
        false
    };
    let mut v95: bool = v94 == false;
    let mut v97: bool = if v95 {
        let mut v96: bool = v83.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        v96
    } else {
        false
    };
    if v97 {
        let mut v98: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: posting needs user credentials: X_CONSUMER_KEY, X_CONSUMER_SECRET, X_OAUTH1_ACCESS_TOKEN and"); } LIT.with(|lit| lit.clone()) };
        eprintln!("{}", v98);
        let mut v99: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("    X_OAUTH1_ACCESS_TOKEN_SECRET (OAuth 1.0a, never expire), or X_OAUTH2_ACCESS_TOKEN (OAuth 2.0, 2 hours)"); } LIT.with(|lit| lit.clone()) };
        eprintln!("{}", v99);
        3i32
    } else {
        let mut v100: Rc<str> = xc_net::xc_fresh_nonce();
        let mut v101: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_OAUTH1_NONCE"); } LIT.with(|lit| lit.clone()) };
        let mut v102: Rc<str> = get_environment_variable_3(v101.clone());
        let mut v103: i32 = (v102.clone().len() as i32);
        let mut v104: i32 = 0i32;
        let mut v105: i32 = method4(v102.clone(), v103, v104);
        let mut v106: i32 = v103.wrapping_sub(1i32);
        let mut v107: Rc<str> = string_slice(&v102.clone(), v105 as i64, v106 as i64);
        let mut v108: i32 = (v107.clone().len() as i32);
        let mut v109: i32 = method5(v107.clone(), v108);
        let mut v110: Rc<str> = string_slice(&v107.clone(), 0i32 as i64, v109 as i64);
        let mut v111: bool = v110.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v112: Rc<str> = if v111 {
            v100.clone()
        } else {
            v110.clone()
        };
        let mut v113: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
        let mut v114: Rc<str> = get_environment_variable_3(v113.clone());
        let mut v115: i32 = (v114.clone().len() as i32);
        let mut v116: i32 = 0i32;
        let mut v117: i32 = method4(v114.clone(), v115, v116);
        let mut v118: i32 = v115.wrapping_sub(1i32);
        let mut v119: Rc<str> = string_slice(&v114.clone(), v117 as i64, v118 as i64);
        let mut v120: i32 = (v119.clone().len() as i32);
        let mut v121: i32 = method5(v119.clone(), v120);
        let mut v122: Rc<str> = string_slice(&v119.clone(), 0i32 as i64, v121 as i64);
        let mut v123: bool = v122.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v125: Rc<str> = if v123 {
            let mut v124: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
            v124.clone()
        } else {
            v122.clone()
        };
        let mut v126: Rc<str> = xc_net::xc_unix_seconds();
        let mut v127: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_OAUTH1_TIMESTAMP"); } LIT.with(|lit| lit.clone()) };
        let mut v128: Rc<str> = get_environment_variable_3(v127.clone());
        let mut v129: i32 = (v128.clone().len() as i32);
        let mut v130: i32 = 0i32;
        let mut v131: i32 = method4(v128.clone(), v129, v130);
        let mut v132: i32 = v129.wrapping_sub(1i32);
        let mut v133: Rc<str> = string_slice(&v128.clone(), v131 as i64, v132 as i64);
        let mut v134: i32 = (v133.clone().len() as i32);
        let mut v135: i32 = method5(v133.clone(), v134);
        let mut v136: Rc<str> = string_slice(&v133.clone(), 0i32 as i64, v135 as i64);
        let mut v137: bool = v136.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v138: Rc<str> = if v137 {
            v126.clone()
        } else {
            v136.clone()
        };
        let (mut v139, mut v140): (i32, Rc<str>) = xc_write::xc_write(&*v125, &*v83, &*v79, &*v80, &*v81, &*v82, &*v112, &*v138, v0, &*v1);
        let mut v141: bool = v139 == 0i32;
        if v141 {
            println!("{}", v140);
            ()
        } else {
            let mut v142: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
            let mut v143: Rc<str> = Rc::<str>::from(format!("{}{}", v142, v140));
            eprintln!("{}", v143);
            ()
        };
        v139
    }
}
fn spiral_main() -> i32 {
    let (mut v0, mut v1, mut v2, mut v3, mut v4, mut v5, mut v6, mut v7, mut v8, mut v9, mut v10, mut v11, mut v12, mut v13): (i32, Rc<str>, bool, Rc<str>, i32, i32, i32, i32, Rc<str>, Rc<str>, bool, bool, i32, bool) = xc_args::xc_parse_os_args();
    let mut v14: bool = v0 == 0i32;
    if v14 {
        run_timeline_0(v0, v1.clone(), v2, v3.clone(), v4, v5, v6, v7, v8.clone(), v9.clone(), v10, v11, v12, v13)
    } else {
        let mut v16: bool = v0 == 1i32;
        let mut v18: bool = if v16 {
            true
        } else {
            let mut v17: bool = v0 == 2i32;
            v17
        };
        if v18 {
            run_write_12(v0, v1.clone())
        } else {
            let mut v20: bool = v0 == 4i32;
            if v20 {
                let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
                let mut v22: Rc<str> = Rc::<str>::from(format!("{}{}", v21, v1));
                eprintln!("{}", v22);
                let mut v23: Rc<str> = xc_args::xc_usage();
                eprintln!("{}", v23);
                2i32
            } else {
                let mut v24: Rc<str> = xc_args::xc_usage();
                println!("{}", v24);
                0i32
            }
        }
    }
}
fn main() { #[cfg(target_arch = "wasm32")] { spiral_main(); return; }
    let main = std::thread::Builder::new().stack_size(1 << 30).spawn(spiral_main).unwrap();
    std::process::exit(match main.join() { Ok(code) => code, Err(_) => 101 });
}
