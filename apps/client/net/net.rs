#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
static XC_REQUESTS: std::sync::atomic::AtomicU32 = std::sync::atomic::AtomicU32::new(0);
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
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<str>, Rc<UH1>),
}
fn exchange_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>) -> (i32, Rc<str>) {
    let v4: u32 = XC_REQUESTS.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let mut v5: bool = &*v0 == "POST";
    let (mut v45, mut v46): (i32, Rc<str>) = if v5 {
        let mut v6: ureq::RequestBuilder<ureq::typestate::WithBody> = ureq::post(&*v1).header("Authorization", &*v2).header("Content-Type", "application/json");
        let v7: ureq::RequestBuilder<ureq::typestate::WithBody> = v6.config().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(30))).build();
        let mut v8: Result<ureq::http::Response<ureq::Body>, ureq::Error> = ureq::RequestBuilder::send(v7, &*v3);
        let v9: bool = v8.is_ok();
        if v9 {
            let mut v10: ureq::http::Response<ureq::Body> = v8.unwrap();
            let mut v11: u16 = v10.status().as_u16();
            let v12: i32 = (v11 as i32);
            let mut v13: Rc<str> = Rc::<str>::from(v10.body_mut().read_to_string().unwrap_or_default());
            (v12, v13)
        } else {
            let v14: ureq::Error = v8.unwrap_err();
            let mut v15: Rc<str> = Rc::<str>::from(v14.to_string());
            (0i32, v15)
        }
    } else {
        let v18: bool = &*v0 == "DELETE";
        if v18 {
            let mut v19: ureq::RequestBuilder<ureq::typestate::WithoutBody> = ureq::delete(&*v1).header("Authorization", &*v2);
            let v20: ureq::RequestBuilder<ureq::typestate::WithoutBody> = v19.config().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(30))).build();
            let mut v21: Result<ureq::http::Response<ureq::Body>, ureq::Error> = ureq::RequestBuilder::call(v20);
            let v22: bool = v21.is_ok();
            if v22 {
                let mut v23: ureq::http::Response<ureq::Body> = v21.unwrap();
                let v24: u16 = v23.status().as_u16();
                let v25: i32 = (v24 as i32);
                let v26: Rc<str> = Rc::<str>::from(v23.body_mut().read_to_string().unwrap_or_default());
                (v25, v26)
            } else {
                let v27: ureq::Error = v21.unwrap_err();
                let v28: Rc<str> = Rc::<str>::from(v27.to_string());
                (0i32, v28)
            }
        } else {
            let mut v31: ureq::RequestBuilder<ureq::typestate::WithoutBody> = ureq::get(&*v1).header("Authorization", &*v2);
            let v32: ureq::RequestBuilder<ureq::typestate::WithoutBody> = v31.config().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(30))).build();
            let mut v33: Result<ureq::http::Response<ureq::Body>, ureq::Error> = ureq::RequestBuilder::call(v32);
            let v34: bool = v33.is_ok();
            if v34 {
                let mut v35: ureq::http::Response<ureq::Body> = v33.unwrap();
                let v36: u16 = v35.status().as_u16();
                let v37: i32 = (v36 as i32);
                let v38: Rc<str> = Rc::<str>::from(v35.body_mut().read_to_string().unwrap_or_default());
                (v37, v38)
            } else {
                let v39: ureq::Error = v33.unwrap_err();
                let v40: Rc<str> = Rc::<str>::from(v39.to_string());
                (0i32, v40)
            }
        }
    };
    (v45, v46)
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>| -> (i32, Rc<str>) {
        exchange_0(v0.clone(), v1.clone(), v2.clone(), v3.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method3(mut v0: Rc<Vec<u8>>, mut v1: i32, mut v2: i32, mut v3: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v4: bool = v2 >= v1;
        if v4 {
            return v3.clone();
        } else {
            let mut v5: u8 = (v0)[v2 as usize].clone();
            let mut v6: i32 = v2.wrapping_add(1i32);
            let v7: bool = v5 >= 48u8;
            let v9: bool = if v7 {
                let mut v8: bool = v5 <= 57u8;
                v8
            } else {
                false
            };
            let mut v13: bool = if v9 {
                true
            } else {
                let mut v10: bool = v5 >= 65u8;
                if v10 {
                    let mut v11: bool = v5 <= 90u8;
                    v11
                } else {
                    false
                }
            };
            let v17: bool = if v13 {
                true
            } else {
                let v14: bool = v5 >= 97u8;
                if v14 {
                    let mut v15: bool = v5 <= 122u8;
                    v15
                } else {
                    false
                }
            };
            let mut v19: bool = if v17 {
                true
            } else {
                let v18: bool = v5 == 45u8;
                v18
            };
            let mut v21: bool = if v19 {
                true
            } else {
                let v20: bool = v5 == 46u8;
                v20
            };
            let mut v23: bool = if v21 {
                true
            } else {
                let v22: bool = v5 == 95u8;
                v22
            };
            let v25: bool = if v23 {
                true
            } else {
                let v24: bool = v5 == 126u8;
                v24
            };
            let v41: Rc<str> = if v25 {
                let v26: i32 = (v5 as i32);
                let v27: i32 = v26.wrapping_sub(32i32);
                let v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ"); } LIT.with(|lit| lit.clone()) };
                let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"); } LIT.with(|lit| lit.clone()) };
                let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"); } LIT.with(|lit| lit.clone()) };
                let mut v31: Rc<str> = string_slice(&v30.clone(), v27 as i64, v27 as i64);
                v31.clone()
            } else {
                let v32: u8 = v5.wrapping_shr((4i32) as u32);
                let mut v33: i32 = (v32 as i32);
                let v34: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789ABCDEF"); } LIT.with(|lit| lit.clone()) }, v33 as i64, v33 as i64);
                let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("%"); } LIT.with(|lit| lit.clone()) };
                let v36: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v34));
                let v37: u8 = v5 & 15u8;
                let v38: i32 = (v37 as i32);
                let v39: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789ABCDEF"); } LIT.with(|lit| lit.clone()) }, v38 as i64, v38 as i64);
                let v40: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v39));
                v40.clone()
            };
            let v42: Rc<UH0> = Rc::new(UH0::UH0_Cons(v41.clone(), v3.clone()));
            (v0, v1, v2, v3) = (v0.clone(), v1, v6, v42.clone());
            continue;
        }
    }
}
fn method4(mut v0: Rc<UH0>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
                let v4: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v1));
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH0::UH0_Nil => {
                return v1.clone();
            }
        }
    }
}
fn oauth1_inserted_5(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<UH1>) -> Rc<UH1> {
    match &*v2 {
        UH1::UH1_Cons(v3, v4, v5) => {
            let mut v3: Rc<str> = v3.clone();
            let v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH1> = v5.clone();
            let mut v6: bool = &*v3 != &*v0;
            let v17: bool = if v6 {
                let v7: bool = &*v3 < &*v0;
                let mut v10: i32 = if v7 {
                    -1i32
                } else {
                    let mut v8: bool = &*v3 > &*v0;
                    if v8 {
                        1i32
                    } else {
                        0i32
                    }
                };
                let mut v11: bool = v10 == -1i32;
                v11
            } else {
                let v12: bool = &*v4 < &*v1;
                let mut v15: i32 = if v12 {
                    -1i32
                } else {
                    let mut v13: bool = &*v4 > &*v1;
                    if v13 {
                        1i32
                    } else {
                        0i32
                    }
                };
                let v16: bool = v15 == -1i32;
                v16
            };
            if v17 {
                let v18: Rc<UH1> = oauth1_inserted_5(v0.clone(), v1.clone(), v5);
                Rc::new(UH1::UH1_Cons(v3, v4, v18))
            } else {
                Rc::new(UH1::UH1_Cons(v0.clone(), v1.clone(), v2.clone()))
            }
        }
        _ => {
            Rc::new(UH1::UH1_Cons(v0, v1, v2))
        }
    }
}
fn method6(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let v4: Rc<UH1> = v4.clone();
            let mut v5: Rc<UH0> = method6(v4, v1.clone());
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("="); } LIT.with(|lit| lit.clone()) };
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v2, v6)), v3));
            Rc::new(UH0::UH0_Cons(v8, v5))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method7(mut v0: Rc<UH0>, mut v1: Rc<str>, mut v2: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v12, mut v13): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let v4: Rc<UH0> = v4.clone();
            let (mut v5, mut v6): (Rc<str>, Rc<str>) = method7(v4, v1.clone(), v2.clone());
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v3, v6)), v5));
            let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&"); } LIT.with(|lit| lit.clone()) };
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
fn oauth_header_2(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>) -> Rc<str> {
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&"); } LIT.with(|lit| lit.clone()) };
    let v9: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v8));
    let mut v10: Rc<Vec<u8>> = Rc::new(v5.bytes().collect());
    let mut v11: i32 = (v10).len() as i32;
    let v12: i32 = 0i32;
    let mut v13: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v14: Rc<UH0> = method3(v10, v11, v12, v13);
    let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v16: Rc<str> = method4(v14, v15.clone());
    let v18: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v9, v16)), v8));
    let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_version"); } LIT.with(|lit| lit.clone()) };
    let v20: Rc<Vec<u8>> = Rc::new(v19.bytes().collect());
    let mut v21: i32 = (v20).len() as i32;
    let v22: i32 = 0i32;
    let mut v23: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v24: Rc<UH0> = method3(v20, v21, v22, v23);
    let v25: Rc<str> = method4(v24, v15.clone());
    let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("1.0"); } LIT.with(|lit| lit.clone()) };
    let v27: Rc<Vec<u8>> = Rc::new(v26.bytes().collect());
    let v28: i32 = (v27).len() as i32;
    let v29: i32 = 0i32;
    let v30: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v31: Rc<UH0> = method3(v27, v28, v29, v30);
    let v32: Rc<str> = method4(v31, v15.clone());
    let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_token"); } LIT.with(|lit| lit.clone()) };
    let v34: Rc<Vec<u8>> = Rc::new(v33.bytes().collect());
    let mut v35: i32 = (v34).len() as i32;
    let v36: i32 = 0i32;
    let v37: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v38: Rc<UH0> = method3(v34, v35, v36, v37);
    let v39: Rc<str> = method4(v38, v15.clone());
    let v40: Rc<Vec<u8>> = Rc::new(v2.bytes().collect());
    let v41: i32 = (v40).len() as i32;
    let v42: i32 = 0i32;
    let v43: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v44: Rc<UH0> = method3(v40, v41, v42, v43);
    let v45: Rc<str> = method4(v44, v15.clone());
    let v46: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_timestamp"); } LIT.with(|lit| lit.clone()) };
    let v47: Rc<Vec<u8>> = Rc::new(v46.bytes().collect());
    let v48: i32 = (v47).len() as i32;
    let v49: i32 = 0i32;
    let v50: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v51: Rc<UH0> = method3(v47, v48, v49, v50);
    let v52: Rc<str> = method4(v51, v15.clone());
    let v53: Rc<Vec<u8>> = Rc::new(v7.bytes().collect());
    let v54: i32 = (v53).len() as i32;
    let v55: i32 = 0i32;
    let v56: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v57: Rc<UH0> = method3(v53, v54, v55, v56);
    let v58: Rc<str> = method4(v57, v15.clone());
    let v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_signature_method"); } LIT.with(|lit| lit.clone()) };
    let v60: Rc<Vec<u8>> = Rc::new(v59.bytes().collect());
    let v61: i32 = (v60).len() as i32;
    let v62: i32 = 0i32;
    let v63: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v64: Rc<UH0> = method3(v60, v61, v62, v63);
    let v65: Rc<str> = method4(v64, v15.clone());
    let v66: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("HMAC-SHA1"); } LIT.with(|lit| lit.clone()) };
    let v67: Rc<Vec<u8>> = Rc::new(v66.bytes().collect());
    let v68: i32 = (v67).len() as i32;
    let v69: i32 = 0i32;
    let v70: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v71: Rc<UH0> = method3(v67, v68, v69, v70);
    let v72: Rc<str> = method4(v71, v15.clone());
    let v73: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_nonce"); } LIT.with(|lit| lit.clone()) };
    let v74: Rc<Vec<u8>> = Rc::new(v73.bytes().collect());
    let v75: i32 = (v74).len() as i32;
    let v76: i32 = 0i32;
    let v77: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v78: Rc<UH0> = method3(v74, v75, v76, v77);
    let v79: Rc<str> = method4(v78, v15.clone());
    let v80: Rc<Vec<u8>> = Rc::new(v6.bytes().collect());
    let v81: i32 = (v80).len() as i32;
    let v82: i32 = 0i32;
    let v83: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v84: Rc<UH0> = method3(v80, v81, v82, v83);
    let v85: Rc<str> = method4(v84, v15.clone());
    let v86: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_consumer_key"); } LIT.with(|lit| lit.clone()) };
    let v87: Rc<Vec<u8>> = Rc::new(v86.bytes().collect());
    let v88: i32 = (v87).len() as i32;
    let v89: i32 = 0i32;
    let v90: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v91: Rc<UH0> = method3(v87, v88, v89, v90);
    let v92: Rc<str> = method4(v91, v15.clone());
    let v93: Rc<Vec<u8>> = Rc::new(v0.bytes().collect());
    let v94: i32 = (v93).len() as i32;
    let v95: i32 = 0i32;
    let v96: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v97: Rc<UH0> = method3(v93, v94, v95, v96);
    let v98: Rc<str> = method4(v97, v15.clone());
    let v99: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v100: Rc<UH1> = oauth1_inserted_5(v92, v98, v99);
    let v101: Rc<UH1> = oauth1_inserted_5(v79, v85, v100);
    let v102: Rc<UH1> = oauth1_inserted_5(v65, v72, v101);
    let v103: Rc<UH1> = oauth1_inserted_5(v52, v58, v102);
    let v104: Rc<UH1> = oauth1_inserted_5(v39, v45, v103);
    let v105: Rc<UH1> = oauth1_inserted_5(v25, v32, v104);
    let v106: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v107: Rc<UH0> = method6(v105, v106);
    let (mut v108, mut v109): (Rc<str>, Rc<str>) = method7(v107, v15.clone(), v15.clone());
    let v110: Rc<Vec<u8>> = Rc::new(v108.bytes().collect());
    let v111: i32 = (v110).len() as i32;
    let v112: i32 = 0i32;
    let v113: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v114: Rc<UH0> = method3(v110, v111, v112, v113);
    let v115: Rc<str> = method4(v114, v15.clone());
    let v116: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v115));
    let v117: Rc<Vec<u8>> = Rc::new(v1.bytes().collect());
    let v118: i32 = (v117).len() as i32;
    let v119: i32 = 0i32;
    let v120: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v121: Rc<UH0> = method3(v117, v118, v119, v120);
    let v122: Rc<str> = method4(v121, v15.clone());
    let v123: Rc<str> = Rc::<str>::from(format!("{}{}", v122, v8));
    let v124: Rc<Vec<u8>> = Rc::new(v3.bytes().collect());
    let v125: i32 = (v124).len() as i32;
    let v126: i32 = 0i32;
    let v127: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v128: Rc<UH0> = method3(v124, v125, v126, v127);
    let v129: Rc<str> = method4(v128, v15.clone());
    let v130: Rc<str> = Rc::<str>::from(format!("{}{}", v123, v129));
    let mut v131: hmac::Hmac<sha1::Sha1> = <hmac::Hmac<sha1::Sha1> as hmac::KeyInit>::new_from_slice(v130.as_bytes()).unwrap();
    let v133: bool = true; // 1;
    let mut v131 = v131;
    hmac::Mac::update(&mut v131, v116.as_bytes());
    let v135: hmac::digest::Output<hmac::Hmac<sha1::Sha1>> = hmac::Mac::finalize(v131).into_bytes();
    let v136: Rc<str> = Rc::<str>::from(base64::Engine::encode(&base64::engine::general_purpose::STANDARD, v135));
    let v137: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_signature"); } LIT.with(|lit| lit.clone()) };
    let v138: Rc<Vec<u8>> = Rc::new(v137.bytes().collect());
    let v139: i32 = (v138).len() as i32;
    let v140: i32 = 0i32;
    let v141: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v142: Rc<UH0> = method3(v138, v139, v140, v141);
    let v143: Rc<str> = method4(v142, v15.clone());
    let v144: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("=\""); } LIT.with(|lit| lit.clone()) };
    let v145: Rc<str> = Rc::<str>::from(format!("{}{}", v143, v144));
    let v146: Rc<Vec<u8>> = Rc::new(v136.bytes().collect());
    let v147: i32 = (v146).len() as i32;
    let v148: i32 = 0i32;
    let v149: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v150: Rc<UH0> = method3(v146, v147, v148, v149);
    let v151: Rc<str> = method4(v150, v15.clone());
    let v152: Rc<str> = Rc::<str>::from(format!("{}{}", v145, v151));
    let v153: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) };
    let v154: Rc<str> = Rc::<str>::from(format!("{}{}", v152, v153));
    let v155: Rc<Vec<u8>> = Rc::new(v19.bytes().collect());
    let v156: i32 = (v155).len() as i32;
    let v157: i32 = 0i32;
    let v158: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v159: Rc<UH0> = method3(v155, v156, v157, v158);
    let v160: Rc<str> = method4(v159, v15.clone());
    let v161: Rc<str> = Rc::<str>::from(format!("{}{}", v160, v144));
    let v162: Rc<Vec<u8>> = Rc::new(v26.bytes().collect());
    let v163: i32 = (v162).len() as i32;
    let v164: i32 = 0i32;
    let v165: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v166: Rc<UH0> = method3(v162, v163, v164, v165);
    let v167: Rc<str> = method4(v166, v15.clone());
    let v169: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v161, v167)), v153));
    let v170: Rc<Vec<u8>> = Rc::new(v33.bytes().collect());
    let v171: i32 = (v170).len() as i32;
    let v172: i32 = 0i32;
    let v173: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v174: Rc<UH0> = method3(v170, v171, v172, v173);
    let v175: Rc<str> = method4(v174, v15.clone());
    let v176: Rc<str> = Rc::<str>::from(format!("{}{}", v175, v144));
    let v177: Rc<Vec<u8>> = Rc::new(v2.bytes().collect());
    let v178: i32 = (v177).len() as i32;
    let v179: i32 = 0i32;
    let v180: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v181: Rc<UH0> = method3(v177, v178, v179, v180);
    let v182: Rc<str> = method4(v181, v15.clone());
    let v184: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v176, v182)), v153));
    let v185: Rc<Vec<u8>> = Rc::new(v46.bytes().collect());
    let v186: i32 = (v185).len() as i32;
    let v187: i32 = 0i32;
    let v188: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v189: Rc<UH0> = method3(v185, v186, v187, v188);
    let v190: Rc<str> = method4(v189, v15.clone());
    let v191: Rc<str> = Rc::<str>::from(format!("{}{}", v190, v144));
    let v192: Rc<Vec<u8>> = Rc::new(v7.bytes().collect());
    let v193: i32 = (v192).len() as i32;
    let v194: i32 = 0i32;
    let v195: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v196: Rc<UH0> = method3(v192, v193, v194, v195);
    let v197: Rc<str> = method4(v196, v15.clone());
    let v199: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v191, v197)), v153));
    let v200: Rc<Vec<u8>> = Rc::new(v59.bytes().collect());
    let v201: i32 = (v200).len() as i32;
    let v202: i32 = 0i32;
    let v203: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v204: Rc<UH0> = method3(v200, v201, v202, v203);
    let v205: Rc<str> = method4(v204, v15.clone());
    let v206: Rc<str> = Rc::<str>::from(format!("{}{}", v205, v144));
    let v207: Rc<Vec<u8>> = Rc::new(v66.bytes().collect());
    let v208: i32 = (v207).len() as i32;
    let v209: i32 = 0i32;
    let v210: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v211: Rc<UH0> = method3(v207, v208, v209, v210);
    let v212: Rc<str> = method4(v211, v15.clone());
    let v214: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v206, v212)), v153));
    let v215: Rc<Vec<u8>> = Rc::new(v73.bytes().collect());
    let v216: i32 = (v215).len() as i32;
    let v217: i32 = 0i32;
    let v218: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v219: Rc<UH0> = method3(v215, v216, v217, v218);
    let v220: Rc<str> = method4(v219, v15.clone());
    let v221: Rc<str> = Rc::<str>::from(format!("{}{}", v220, v144));
    let v222: Rc<Vec<u8>> = Rc::new(v6.bytes().collect());
    let v223: i32 = (v222).len() as i32;
    let v224: i32 = 0i32;
    let v225: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v226: Rc<UH0> = method3(v222, v223, v224, v225);
    let v227: Rc<str> = method4(v226, v15.clone());
    let v229: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v221, v227)), v153));
    let v230: Rc<Vec<u8>> = Rc::new(v86.bytes().collect());
    let v231: i32 = (v230).len() as i32;
    let v232: i32 = 0i32;
    let v233: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v234: Rc<UH0> = method3(v230, v231, v232, v233);
    let v235: Rc<str> = method4(v234, v15.clone());
    let v236: Rc<str> = Rc::<str>::from(format!("{}{}", v235, v144));
    let v237: Rc<Vec<u8>> = Rc::new(v0.bytes().collect());
    let v238: i32 = (v237).len() as i32;
    let v239: i32 = 0i32;
    let v240: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v241: Rc<UH0> = method3(v237, v238, v239, v240);
    let v242: Rc<str> = method4(v241, v15.clone());
    let v244: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v236, v242)), v153));
    let v246: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v154, v15)), v15));
    let v247: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", "); } LIT.with(|lit| lit.clone()) };
    let v249: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v169, v247)), v246));
    let v251: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v184, v247)), v249));
    let v253: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v199, v247)), v251));
    let v255: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v214, v247)), v253));
    let v257: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v229, v247)), v255));
    let v259: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v244, v247)), v257));
    let v260: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("OAuth "); } LIT.with(|lit| lit.clone()) };
    let v261: Rc<str> = Rc::<str>::from(format!("{}{}", v260, v259));
    v261
}
fn signed_header_1(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>) -> Rc<str> {
    oauth_header_2(v0, v1, v2, v3, v4, v5, v6, v7)
}
fn closure1() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>| -> Rc<str> {
        signed_header_1(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure2() -> Rc<dyn Fn() -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn() -> i32> = Rc::new(move || -> i32 {
        let mut v0: u32 = XC_REQUESTS.load(std::sync::atomic::Ordering::Relaxed);
        let mut v1: i32 = (v0 as i32);
        v1
    }); } CLOSURE.with(|closure| closure.clone())
}
fn form_exchange_8(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>) -> (i32, Rc<str>) {
    let v4: u32 = XC_REQUESTS.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
    let v7: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v1, v5)), v2));
    let mut v8: Rc<str> = Rc::<str>::from(base64::Engine::encode(&base64::engine::general_purpose::STANDARD, (v7).as_bytes()));
    let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Basic "); } LIT.with(|lit| lit.clone()) };
    let mut v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v8));
    let mut v11: ureq::RequestBuilder<ureq::typestate::WithBody> = ureq::post(&*v0).header("Authorization", &*v10).header("Content-Type", "application/x-www-form-urlencoded");
    let v12: ureq::RequestBuilder<ureq::typestate::WithBody> = v11.config().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(30))).build();
    let mut v13: Result<ureq::http::Response<ureq::Body>, ureq::Error> = ureq::RequestBuilder::send(v12, &*v3);
    let v14: bool = v13.is_ok();
    let (mut v21, mut v22): (i32, Rc<str>) = if v14 {
        let mut v15: ureq::http::Response<ureq::Body> = v13.unwrap();
        let v16: u16 = v15.status().as_u16();
        let v17: i32 = (v16 as i32);
        let v18: Rc<str> = Rc::<str>::from(v15.body_mut().read_to_string().unwrap_or_default());
        (v17, v18)
    } else {
        let mut v19: ureq::Error = v13.unwrap_err();
        let v20: Rc<str> = Rc::<str>::from(v19.to_string());
        (0i32, v20)
    };
    (v21, v22)
}
fn closure3() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>| -> (i32, Rc<str>) {
        form_exchange_8(v0.clone(), v1.clone(), v2.clone(), v3.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure4() -> Rc<dyn Fn() -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn() -> Rc<str>> = Rc::new(move || -> Rc<str> {
        let mut v0: std::time::SystemTime = std::time::SystemTime::now();
        let mut v1: std::time::Duration = v0.duration_since(std::time::UNIX_EPOCH).unwrap_or_default();
        let v2: u64 = v1.as_secs();
        let mut v3: u64 = v2.wrapping_mul(1000000u64);
        let v4: u32 = v1.subsec_micros();
        let mut v5: u64 = (v4 as u64);
        let mut v6: u64 = v3.wrapping_add(v5);
        let v7: Rc<str> = Rc::<str>::from(format!("{:?}", v6));
        let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("-"); } LIT.with(|lit| lit.clone()) };
        let v9: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v8));
        let mut v10: u32 = std::process::id();
        let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v9, Rc::<str>::from(format!("{:?}", v10))));
        let mut v13: Rc<str> = Rc::<str>::from(<sha1::Sha1 as sha1::Digest>::digest(v12.as_bytes()).iter().map(|b| format!("{:02x}", b)).collect::<String>());
        v13.clone()
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure5() -> Rc<dyn Fn() -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn() -> Rc<str>> = Rc::new(move || -> Rc<str> {
        let mut v0: std::time::SystemTime = std::time::SystemTime::now();
        let mut v1: std::time::Duration = v0.duration_since(std::time::UNIX_EPOCH).unwrap_or_default();
        let v2: u64 = v1.as_secs();
        let mut v3: Rc<str> = Rc::<str>::from(format!("{:?}", v2));
        v3.clone()
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure6() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        let mut v1: Option<jiff::Timestamp> = v0.parse::<jiff::Timestamp>().ok();
        let v2: bool = v1.is_some();
        if v2 {
            let mut v3: jiff::Timestamp = v1.unwrap();
            let v4: jiff::tz::TimeZone = jiff::tz::TimeZone::system();
            let mut v5: jiff::Zoned = v3.to_zoned(v4);
            let mut v6: Rc<str> = Rc::<str>::from(v5.strftime("%Y-%m-%d %H:%M").to_string());
            v6.clone()
        } else {
            v0.clone()
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure7() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        let mut v1: Option<jiff::Zoned> = v0.parse::<jiff::civil::Date>().ok().and_then(|d| d.to_zoned(jiff::tz::TimeZone::system()).ok());
        let v2: Rc<str> = v1.map_or({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, |x| Rc::<str>::from(x.timestamp().strftime("%Y-%m-%dT%H:%M:%SZ").to_string()));
        v2.clone()
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_send(v0: &str, v1: &str, v2: &str, v3: &str) -> (i32, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), Rc::<str>::from(v3))
}
pub fn xc_oauth1_header(v0: &str, v1: &str, v2: &str, v3: &str, v4: &str, v5: &str, v6: &str, v7: &str) -> Rc<str> {
    closure1()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), Rc::<str>::from(v3), Rc::<str>::from(v4), Rc::<str>::from(v5), Rc::<str>::from(v6), Rc::<str>::from(v7))
}
pub fn xc_requests() -> i32 {
    closure2()()
}
pub fn xc_post_form(v0: &str, v1: &str, v2: &str, v3: &str) -> (i32, Rc<str>) {
    closure3()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), Rc::<str>::from(v3))
}
pub fn xc_fresh_nonce() -> Rc<str> {
    closure4()()
}
pub fn xc_unix_seconds() -> Rc<str> {
    closure5()()
}
pub fn xc_local_minute(v0: &str) -> Rc<str> {
    closure6()(Rc::<str>::from(v0))
}
pub fn xc_local_midnight(v0: &str) -> Rc<str> {
    closure7()(Rc::<str>::from(v0))
}
