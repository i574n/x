#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
fn spiral_process_counter_add(name: &str, n: u64) -> u64 {
    use std::collections::HashMap;
    use std::sync::Mutex;
    static COUNTERS: Mutex<Option<HashMap<String, u64>>> = Mutex::new(None);
    let mut guard = COUNTERS.lock().unwrap();
    let total = guard.get_or_insert_with(HashMap::new).entry(name.to_string()).or_insert(0);
    *total += n;
    *total
}
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
    let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc_requests"); } LIT.with(|lit| lit.clone()) };
    let mut v5: u64 = spiral_process_counter_add(&*v4, 1u64);
    let v6: bool = &*v0 == "POST";
    let (mut v61, mut v62): (i32, Rc<str>) = if v6 {
        let mut v7: bool = &*v2 == "";
        if v7 {
            let mut v8: ureq::RequestBuilder<ureq::typestate::WithBody> = ureq::post(&*v1).header("Content-Type", "application/json");
            let v9: ureq::RequestBuilder<ureq::typestate::WithBody> = v8.config().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(30))).build();
            let mut v10: Result<ureq::http::Response<ureq::Body>, ureq::Error> = ureq::RequestBuilder::send(v9, &*v3);
            let v11: bool = v10.is_ok();
            if v11 {
                let mut v12: ureq::http::Response<ureq::Body> = v10.unwrap();
                let v13: u16 = v12.status().as_u16();
                let mut v14: i32 = (v13 as i32);
                let v15: Rc<str> = Rc::<str>::from(v12.body_mut().read_to_string().unwrap_or_default());
                (v14, v15)
            } else {
                let v16: ureq::Error = v10.unwrap_err();
                let v17: Rc<str> = Rc::<str>::from(v16.to_string());
                (0i32, v17)
            }
        } else {
            let mut v20: ureq::RequestBuilder<ureq::typestate::WithBody> = ureq::post(&*v1).header("Authorization", &*v2).header("Content-Type", "application/json");
            let v21: ureq::RequestBuilder<ureq::typestate::WithBody> = v20.config().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(30))).build();
            let mut v22: Result<ureq::http::Response<ureq::Body>, ureq::Error> = ureq::RequestBuilder::send(v21, &*v3);
            let v23: bool = v22.is_ok();
            if v23 {
                let mut v24: ureq::http::Response<ureq::Body> = v22.unwrap();
                let v25: u16 = v24.status().as_u16();
                let v26: i32 = (v25 as i32);
                let v27: Rc<str> = Rc::<str>::from(v24.body_mut().read_to_string().unwrap_or_default());
                (v26, v27)
            } else {
                let v28: ureq::Error = v22.unwrap_err();
                let v29: Rc<str> = Rc::<str>::from(v28.to_string());
                (0i32, v29)
            }
        }
    } else {
        let v34: bool = &*v0 == "DELETE";
        if v34 {
            let mut v35: ureq::RequestBuilder<ureq::typestate::WithoutBody> = ureq::delete(&*v1).header("Authorization", &*v2);
            let v36: ureq::RequestBuilder<ureq::typestate::WithoutBody> = v35.config().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(30))).build();
            let mut v37: Result<ureq::http::Response<ureq::Body>, ureq::Error> = ureq::RequestBuilder::call(v36);
            let v38: bool = v37.is_ok();
            if v38 {
                let mut v39: ureq::http::Response<ureq::Body> = v37.unwrap();
                let v40: u16 = v39.status().as_u16();
                let v41: i32 = (v40 as i32);
                let v42: Rc<str> = Rc::<str>::from(v39.body_mut().read_to_string().unwrap_or_default());
                (v41, v42)
            } else {
                let v43: ureq::Error = v37.unwrap_err();
                let v44: Rc<str> = Rc::<str>::from(v43.to_string());
                (0i32, v44)
            }
        } else {
            let mut v47: ureq::RequestBuilder<ureq::typestate::WithoutBody> = ureq::get(&*v1).header("Authorization", &*v2);
            let v48: ureq::RequestBuilder<ureq::typestate::WithoutBody> = v47.config().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(30))).build();
            let mut v49: Result<ureq::http::Response<ureq::Body>, ureq::Error> = ureq::RequestBuilder::call(v48);
            let v50: bool = v49.is_ok();
            if v50 {
                let mut v51: ureq::http::Response<ureq::Body> = v49.unwrap();
                let v52: u16 = v51.status().as_u16();
                let v53: i32 = (v52 as i32);
                let v54: Rc<str> = Rc::<str>::from(v51.body_mut().read_to_string().unwrap_or_default());
                (v53, v54)
            } else {
                let v55: ureq::Error = v49.unwrap_err();
                let v56: Rc<str> = Rc::<str>::from(v55.to_string());
                (0i32, v56)
            }
        }
    };
    (v61, v62)
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>| -> (i32, Rc<str>) {
        exchange_0(v0, v1, v2, v3)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method3(mut v0: Rc<Vec<u8>>, mut v1: i32, mut v2: i32, mut v3: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v4: bool = v2 >= v1;
        if v4 {
            return v3;
        } else {
            let mut v5: usize = ((v2) as usize);
            let v6: u8 = (v0)[v5].clone();
            let mut v7: i32 = v2.wrapping_add(1i32);
            let mut v8: bool = v6 >= 48u8;
            let mut v10: bool = if v8 {
                let v9: bool = v6 <= 57u8;
                v9
            } else {
                false
            };
            let mut v14: bool = if v10 {
                true
            } else {
                let v11: bool = v6 >= 65u8;
                if v11 {
                    let mut v12: bool = v6 <= 90u8;
                    v12
                } else {
                    false
                }
            };
            let v18: bool = if v14 {
                true
            } else {
                let v15: bool = v6 >= 97u8;
                if v15 {
                    let v16: bool = v6 <= 122u8;
                    v16
                } else {
                    false
                }
            };
            let mut v20: bool = if v18 {
                true
            } else {
                let v19: bool = v6 == 45u8;
                v19
            };
            let mut v22: bool = if v20 {
                true
            } else {
                let v21: bool = v6 == 46u8;
                v21
            };
            let mut v24: bool = if v22 {
                true
            } else {
                let v23: bool = v6 == 95u8;
                v23
            };
            let v26: bool = if v24 {
                true
            } else {
                let v25: bool = v6 == 126u8;
                v25
            };
            let v38: Rc<str> = if v26 {
                let v27: i32 = (v6 as i32);
                let v28: i32 = v27.wrapping_sub(32i32);
                let v29: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"); } LIT.with(|lit| lit.clone()) }, v28 as i64, v28 as i64);
                v29
            } else {
                let v30: u8 = v6.wrapping_shr((4i32) as u32);
                let v31: i32 = (v30 as i32);
                let v32: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789ABCDEF"); } LIT.with(|lit| lit.clone()) }, v31 as i64, v31 as i64);
                let v33: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("%"); } LIT.with(|lit| lit.clone()) }, v32));
                let v34: u8 = v6 & 15u8;
                let mut v35: i32 = (v34 as i32);
                let v36: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789ABCDEF"); } LIT.with(|lit| lit.clone()) }, v35 as i64, v35 as i64);
                let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v33, v36));
                v37
            };
            let mut v39: Rc<UH0> = Rc::new(UH0::UH0_Cons(v38, v3));
            (v2, v3) = (v7, v39);
            continue;
        }
    }
}
fn method4(mut v0: Rc<UH0>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let mut v3: Rc<UH0> = v3;
                let v4: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v1));
                (v0, v1) = (v3, v4);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
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
            let v6: bool = &*v3 != &*v0;
            let v17: bool = if v6 {
                let mut v7: bool = &*v3 < &*v0;
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
                let v11: bool = v10 == -1i32;
                v11
            } else {
                let mut v12: bool = &*v4 < &*v1;
                let v15: i32 = if v12 {
                    -1i32
                } else {
                    let v13: bool = &*v4 > &*v1;
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
                let v18: Rc<UH1> = oauth1_inserted_5(v0, v1, v5);
                Rc::new(UH1::UH1_Cons(v3, v4, v18))
            } else {
                Rc::new(UH1::UH1_Cons(v0, v1, v2))
            }
        }
        _ => {
            Rc::new(UH1::UH1_Cons(v0, v1, v2))
        }
    }
}
fn method6(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2;
            let mut v3: Rc<str> = v3;
            let v4: Rc<UH1> = v4;
            let mut v5: Rc<UH0> = method6(v4, v1);
            let v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("="); } LIT.with(|lit| lit.clone()) }));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v3));
            Rc::new(UH0::UH0_Cons(v7, v5))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method7(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH0::UH0_Cons(v3, v4) => {
                let mut v3: Rc<str> = v3;
                let v4: Rc<UH0> = v4;
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
fn oauth_header_2(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>) -> Rc<str> {
    let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v4, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&"); } LIT.with(|lit| lit.clone()) }));
    let v9: Rc<Vec<u8>> = Rc::new(v5.bytes().collect());
    let mut v10: usize = (v9).len();
    let v11: i32 = ((v10) as i32);
    let mut v12: i32 = 0i32;
    let v13: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v14: Rc<UH0> = method3(v9, v11, v12, v13);
    let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v16: Rc<str> = method4(v14, v15.clone());
    let v17: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v16));
    let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&"); } LIT.with(|lit| lit.clone()) }));
    let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_version"); } LIT.with(|lit| lit.clone()) };
    let mut v20: Rc<Vec<u8>> = Rc::new(v19.bytes().collect());
    let v21: usize = (v20).len();
    let mut v22: i32 = ((v21) as i32);
    let v23: i32 = 0i32;
    let mut v24: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v25: Rc<UH0> = method3(v20, v22, v23, v24);
    let v26: Rc<str> = method4(v25, v15.clone());
    let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("1.0"); } LIT.with(|lit| lit.clone()) };
    let v28: Rc<Vec<u8>> = Rc::new(v27.bytes().collect());
    let v29: usize = (v28).len();
    let v30: i32 = ((v29) as i32);
    let v31: i32 = 0i32;
    let v32: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v33: Rc<UH0> = method3(v28, v30, v31, v32);
    let v34: Rc<str> = method4(v33, v15.clone());
    let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_token"); } LIT.with(|lit| lit.clone()) };
    let v36: Rc<Vec<u8>> = Rc::new(v35.bytes().collect());
    let mut v37: usize = (v36).len();
    let v38: i32 = ((v37) as i32);
    let mut v39: i32 = 0i32;
    let v40: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v41: Rc<UH0> = method3(v36, v38, v39, v40);
    let v42: Rc<str> = method4(v41, v15.clone());
    let v43: Rc<Vec<u8>> = Rc::new(v2.bytes().collect());
    let v44: usize = (v43).len();
    let v45: i32 = ((v44) as i32);
    let v46: i32 = 0i32;
    let mut v47: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v48: Rc<UH0> = method3(v43, v45, v46, v47);
    let mut v49: Rc<str> = method4(v48, v15.clone());
    let v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_timestamp"); } LIT.with(|lit| lit.clone()) };
    let mut v51: Rc<Vec<u8>> = Rc::new(v50.bytes().collect());
    let v52: usize = (v51).len();
    let v53: i32 = ((v52) as i32);
    let v54: i32 = 0i32;
    let v55: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v56: Rc<UH0> = method3(v51, v53, v54, v55);
    let v57: Rc<str> = method4(v56, v15.clone());
    let v58: Rc<Vec<u8>> = Rc::new(v7.bytes().collect());
    let v59: usize = (v58).len();
    let v60: i32 = ((v59) as i32);
    let v61: i32 = 0i32;
    let v62: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v63: Rc<UH0> = method3(v58, v60, v61, v62);
    let v64: Rc<str> = method4(v63, v15.clone());
    let v65: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_signature_method"); } LIT.with(|lit| lit.clone()) };
    let v66: Rc<Vec<u8>> = Rc::new(v65.bytes().collect());
    let v67: usize = (v66).len();
    let v68: i32 = ((v67) as i32);
    let v69: i32 = 0i32;
    let v70: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v71: Rc<UH0> = method3(v66, v68, v69, v70);
    let v72: Rc<str> = method4(v71, v15.clone());
    let v73: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("HMAC-SHA1"); } LIT.with(|lit| lit.clone()) };
    let v74: Rc<Vec<u8>> = Rc::new(v73.bytes().collect());
    let v75: usize = (v74).len();
    let v76: i32 = ((v75) as i32);
    let v77: i32 = 0i32;
    let v78: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v79: Rc<UH0> = method3(v74, v76, v77, v78);
    let v80: Rc<str> = method4(v79, v15.clone());
    let v81: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_nonce"); } LIT.with(|lit| lit.clone()) };
    let v82: Rc<Vec<u8>> = Rc::new(v81.bytes().collect());
    let v83: usize = (v82).len();
    let v84: i32 = ((v83) as i32);
    let v85: i32 = 0i32;
    let v86: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v87: Rc<UH0> = method3(v82, v84, v85, v86);
    let v88: Rc<str> = method4(v87, v15.clone());
    let v89: Rc<Vec<u8>> = Rc::new(v6.bytes().collect());
    let v90: usize = (v89).len();
    let v91: i32 = ((v90) as i32);
    let v92: i32 = 0i32;
    let v93: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v94: Rc<UH0> = method3(v89, v91, v92, v93);
    let v95: Rc<str> = method4(v94, v15.clone());
    let v96: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_consumer_key"); } LIT.with(|lit| lit.clone()) };
    let v97: Rc<Vec<u8>> = Rc::new(v96.bytes().collect());
    let v98: usize = (v97).len();
    let v99: i32 = ((v98) as i32);
    let v100: i32 = 0i32;
    let v101: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v102: Rc<UH0> = method3(v97, v99, v100, v101);
    let v103: Rc<str> = method4(v102, v15.clone());
    let v104: Rc<Vec<u8>> = Rc::new(v0.bytes().collect());
    let v105: usize = (v104).len();
    let v106: i32 = ((v105) as i32);
    let v107: i32 = 0i32;
    let v108: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v109: Rc<UH0> = method3(v104, v106, v107, v108);
    let v110: Rc<str> = method4(v109, v15.clone());
    let v111: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v112: Rc<UH1> = oauth1_inserted_5(v103, v110, v111);
    let v113: Rc<UH1> = oauth1_inserted_5(v88, v95, v112);
    let v114: Rc<UH1> = oauth1_inserted_5(v72, v80, v113);
    let v115: Rc<UH1> = oauth1_inserted_5(v57, v64, v114);
    let v116: Rc<UH1> = oauth1_inserted_5(v42, v49, v115);
    let v117: Rc<UH1> = oauth1_inserted_5(v26, v34, v116);
    let v118: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v119: Rc<UH0> = method6(v117, v118);
    let v120: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v121: i32 = 0i32;
    let v122: i32 = method7(v120.clone(), v119, v121);
    let v123: Rc<Vec<Rc<str>>> = Rc::new(v120.borrow().clone());
    let v124: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v123).as_ref().clone()));
    let v125: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&"); } LIT.with(|lit| lit.clone()) };
    let v126: Rc<str> = Rc::<str>::from((*v124.borrow()).join(&*v125));
    let v127: Rc<Vec<u8>> = Rc::new(v126.bytes().collect());
    let v128: usize = (v127).len();
    let v129: i32 = ((v128) as i32);
    let v130: i32 = 0i32;
    let v131: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v132: Rc<UH0> = method3(v127, v129, v130, v131);
    let v133: Rc<str> = method4(v132, v15.clone());
    let v134: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v133));
    let v135: Rc<Vec<u8>> = Rc::new(v1.bytes().collect());
    let v136: usize = (v135).len();
    let v137: i32 = ((v136) as i32);
    let v138: i32 = 0i32;
    let v139: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v140: Rc<UH0> = method3(v135, v137, v138, v139);
    let v141: Rc<str> = method4(v140, v15.clone());
    let v142: Rc<str> = Rc::<str>::from(format!("{}{}", v141, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&"); } LIT.with(|lit| lit.clone()) }));
    let v143: Rc<Vec<u8>> = Rc::new(v3.bytes().collect());
    let v144: usize = (v143).len();
    let v145: i32 = ((v144) as i32);
    let v146: i32 = 0i32;
    let v147: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v148: Rc<UH0> = method3(v143, v145, v146, v147);
    let v149: Rc<str> = method4(v148, v15.clone());
    let v150: Rc<str> = Rc::<str>::from(format!("{}{}", v142, v149));
    let mut v151: hmac::Hmac<sha1::Sha1> = <hmac::Hmac<sha1::Sha1> as hmac::KeyInit>::new_from_slice(v150.as_bytes()).unwrap();
    let v153: bool = true; // 1;
    let mut v151 = v151;
    hmac::Mac::update(&mut v151, v134.as_bytes());
    let v155: hmac::digest::Output<hmac::Hmac<sha1::Sha1>> = hmac::Mac::finalize(v151).into_bytes();
    let v156: Rc<str> = Rc::<str>::from(base64::Engine::encode(&base64::engine::general_purpose::STANDARD, v155));
    let v157: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_signature"); } LIT.with(|lit| lit.clone()) };
    let v158: Rc<Vec<u8>> = Rc::new(v157.bytes().collect());
    let v159: usize = (v158).len();
    let v160: i32 = ((v159) as i32);
    let v161: i32 = 0i32;
    let v162: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v163: Rc<UH0> = method3(v158, v160, v161, v162);
    let v164: Rc<str> = method4(v163, v15.clone());
    let v165: Rc<str> = Rc::<str>::from(format!("{}{}", v164, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("=\""); } LIT.with(|lit| lit.clone()) }));
    let v166: Rc<Vec<u8>> = Rc::new(v156.bytes().collect());
    let v167: usize = (v166).len();
    let v168: i32 = ((v167) as i32);
    let v169: i32 = 0i32;
    let v170: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v171: Rc<UH0> = method3(v166, v168, v169, v170);
    let v172: Rc<str> = method4(v171, v15.clone());
    let v173: Rc<str> = Rc::<str>::from(format!("{}{}", v165, v172));
    let v174: Rc<str> = Rc::<str>::from(format!("{}{}", v173, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) }));
    let v175: Rc<Vec<u8>> = Rc::new(v19.bytes().collect());
    let v176: usize = (v175).len();
    let v177: i32 = ((v176) as i32);
    let v178: i32 = 0i32;
    let v179: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v180: Rc<UH0> = method3(v175, v177, v178, v179);
    let v181: Rc<str> = method4(v180, v15.clone());
    let v182: Rc<str> = Rc::<str>::from(format!("{}{}", v181, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("=\""); } LIT.with(|lit| lit.clone()) }));
    let v183: Rc<Vec<u8>> = Rc::new(v27.bytes().collect());
    let v184: usize = (v183).len();
    let v185: i32 = ((v184) as i32);
    let v186: i32 = 0i32;
    let v187: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v188: Rc<UH0> = method3(v183, v185, v186, v187);
    let v189: Rc<str> = method4(v188, v15.clone());
    let v190: Rc<str> = Rc::<str>::from(format!("{}{}", v182, v189));
    let v191: Rc<str> = Rc::<str>::from(format!("{}{}", v190, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) }));
    let v192: Rc<Vec<u8>> = Rc::new(v35.bytes().collect());
    let v193: usize = (v192).len();
    let v194: i32 = ((v193) as i32);
    let v195: i32 = 0i32;
    let v196: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v197: Rc<UH0> = method3(v192, v194, v195, v196);
    let v198: Rc<str> = method4(v197, v15.clone());
    let v199: Rc<str> = Rc::<str>::from(format!("{}{}", v198, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("=\""); } LIT.with(|lit| lit.clone()) }));
    let v200: Rc<Vec<u8>> = Rc::new(v2.bytes().collect());
    let v201: usize = (v200).len();
    let v202: i32 = ((v201) as i32);
    let v203: i32 = 0i32;
    let v204: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v205: Rc<UH0> = method3(v200, v202, v203, v204);
    let v206: Rc<str> = method4(v205, v15.clone());
    let v207: Rc<str> = Rc::<str>::from(format!("{}{}", v199, v206));
    let v208: Rc<str> = Rc::<str>::from(format!("{}{}", v207, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) }));
    let v209: Rc<Vec<u8>> = Rc::new(v50.bytes().collect());
    let v210: usize = (v209).len();
    let v211: i32 = ((v210) as i32);
    let v212: i32 = 0i32;
    let v213: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v214: Rc<UH0> = method3(v209, v211, v212, v213);
    let v215: Rc<str> = method4(v214, v15.clone());
    let v216: Rc<str> = Rc::<str>::from(format!("{}{}", v215, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("=\""); } LIT.with(|lit| lit.clone()) }));
    let v217: Rc<Vec<u8>> = Rc::new(v7.bytes().collect());
    let v218: usize = (v217).len();
    let v219: i32 = ((v218) as i32);
    let v220: i32 = 0i32;
    let v221: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v222: Rc<UH0> = method3(v217, v219, v220, v221);
    let v223: Rc<str> = method4(v222, v15.clone());
    let v224: Rc<str> = Rc::<str>::from(format!("{}{}", v216, v223));
    let v225: Rc<str> = Rc::<str>::from(format!("{}{}", v224, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) }));
    let v226: Rc<Vec<u8>> = Rc::new(v65.bytes().collect());
    let v227: usize = (v226).len();
    let v228: i32 = ((v227) as i32);
    let v229: i32 = 0i32;
    let v230: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v231: Rc<UH0> = method3(v226, v228, v229, v230);
    let v232: Rc<str> = method4(v231, v15.clone());
    let v233: Rc<str> = Rc::<str>::from(format!("{}{}", v232, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("=\""); } LIT.with(|lit| lit.clone()) }));
    let v234: Rc<Vec<u8>> = Rc::new(v73.bytes().collect());
    let v235: usize = (v234).len();
    let v236: i32 = ((v235) as i32);
    let v237: i32 = 0i32;
    let v238: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v239: Rc<UH0> = method3(v234, v236, v237, v238);
    let v240: Rc<str> = method4(v239, v15.clone());
    let v241: Rc<str> = Rc::<str>::from(format!("{}{}", v233, v240));
    let v242: Rc<str> = Rc::<str>::from(format!("{}{}", v241, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) }));
    let v243: Rc<Vec<u8>> = Rc::new(v81.bytes().collect());
    let v244: usize = (v243).len();
    let v245: i32 = ((v244) as i32);
    let v246: i32 = 0i32;
    let v247: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v248: Rc<UH0> = method3(v243, v245, v246, v247);
    let v249: Rc<str> = method4(v248, v15.clone());
    let v250: Rc<str> = Rc::<str>::from(format!("{}{}", v249, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("=\""); } LIT.with(|lit| lit.clone()) }));
    let v251: Rc<Vec<u8>> = Rc::new(v6.bytes().collect());
    let v252: usize = (v251).len();
    let v253: i32 = ((v252) as i32);
    let v254: i32 = 0i32;
    let v255: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v256: Rc<UH0> = method3(v251, v253, v254, v255);
    let v257: Rc<str> = method4(v256, v15.clone());
    let v258: Rc<str> = Rc::<str>::from(format!("{}{}", v250, v257));
    let v259: Rc<str> = Rc::<str>::from(format!("{}{}", v258, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) }));
    let v260: Rc<Vec<u8>> = Rc::new(v96.bytes().collect());
    let v261: usize = (v260).len();
    let v262: i32 = ((v261) as i32);
    let v263: i32 = 0i32;
    let v264: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v265: Rc<UH0> = method3(v260, v262, v263, v264);
    let v266: Rc<str> = method4(v265, v15.clone());
    let v267: Rc<str> = Rc::<str>::from(format!("{}{}", v266, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("=\""); } LIT.with(|lit| lit.clone()) }));
    let v268: Rc<Vec<u8>> = Rc::new(v0.bytes().collect());
    let v269: usize = (v268).len();
    let v270: i32 = ((v269) as i32);
    let v271: i32 = 0i32;
    let v272: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v273: Rc<UH0> = method3(v268, v270, v271, v272);
    let v274: Rc<str> = method4(v273, v15);
    let v275: Rc<str> = Rc::<str>::from(format!("{}{}", v267, v274));
    let v276: Rc<str> = Rc::<str>::from(format!("{}{}", v275, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) }));
    let mut v277: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    v277.borrow_mut().push(v276);
    v277.borrow_mut().push(v259);
    v277.borrow_mut().push(v242);
    v277.borrow_mut().push(v225);
    v277.borrow_mut().push(v208);
    v277.borrow_mut().push(v191);
    v277.borrow_mut().push(v174);
    let v278: Rc<Vec<Rc<str>>> = Rc::new(v277.borrow().clone());
    let v279: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v278).as_ref().clone()));
    let v280: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", "); } LIT.with(|lit| lit.clone()) };
    let v281: Rc<str> = Rc::<str>::from((*v279.borrow()).join(&*v280));
    let v282: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("OAuth "); } LIT.with(|lit| lit.clone()) }, v281));
    v282
}
fn signed_header_1(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>) -> Rc<str> {
    oauth_header_2(v0, v1, v2, v3, v4, v5, v6, v7)
}
fn closure1() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>| -> Rc<str> {
        signed_header_1(v0, v1, v2, v3, v4, v5, v6, v7)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure2() -> Rc<dyn Fn() -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn() -> i32> = Rc::new(move || -> i32 {
        let mut v0: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc_requests"); } LIT.with(|lit| lit.clone()) };
        let mut v1: u64 = spiral_process_counter_add(&*v0, 0u64);
        let v2: i32 = (v1 as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn form_exchange_8(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>) -> (i32, Rc<str>) {
    let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc_requests"); } LIT.with(|lit| lit.clone()) };
    let mut v5: u64 = spiral_process_counter_add(&*v4, 1u64);
    let v6: Rc<str> = Rc::<str>::from(format!("{}{}", v1, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) }));
    let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v2));
    let mut v8: Rc<str> = Rc::<str>::from(base64::Engine::encode(&base64::prelude::BASE64_STANDARD, (v7).as_bytes()));
    let v9: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Basic "); } LIT.with(|lit| lit.clone()) }, v8));
    let mut v10: ureq::RequestBuilder<ureq::typestate::WithBody> = ureq::post(&*v0).header("Authorization", &*v9).header("Content-Type", "application/x-www-form-urlencoded");
    let v11: ureq::RequestBuilder<ureq::typestate::WithBody> = v10.config().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(30))).build();
    let mut v12: Result<ureq::http::Response<ureq::Body>, ureq::Error> = ureq::RequestBuilder::send(v11, &*v3);
    let v13: bool = v12.is_ok();
    let (mut v20, mut v21): (i32, Rc<str>) = if v13 {
        let mut v14: ureq::http::Response<ureq::Body> = v12.unwrap();
        let v15: u16 = v14.status().as_u16();
        let v16: i32 = (v15 as i32);
        let v17: Rc<str> = Rc::<str>::from(v14.body_mut().read_to_string().unwrap_or_default());
        (v16, v17)
    } else {
        let v18: ureq::Error = v12.unwrap_err();
        let v19: Rc<str> = Rc::<str>::from(v18.to_string());
        (0i32, v19)
    };
    (v20, v21)
}
fn closure3() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>| -> (i32, Rc<str>) {
        form_exchange_8(v0, v1, v2, v3)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn process_id_9() -> u64 {
    let mut v0: u32 = std::process::id();
    let mut v1: u64 = (v0 as u64);
    v1
}
fn go_10(mut v0: Rc<RefCell<Vec<u8>>>, mut v1: i32, mut v2: i32, mut v3: Rc<str>) -> Rc<str> {
    loop {
        let v4: bool = v2 >= v1;
        if v4 {
            return v3;
        } else {
            let mut v5: i32 = v2.wrapping_add(1i32);
            let v6: u8 = v0.borrow()[v2 as usize];
            let mut v7: u8 = v6.wrapping_shr((4i32) as u32);
            let mut v8: i32 = (v7 as i32);
            let v9: u8 = v6 & 15u8;
            let mut v10: i32 = (v9 as i32);
            let v11: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789abcdef"); } LIT.with(|lit| lit.clone()) }, v8 as i64, v8 as i64);
            let mut v12: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789abcdef"); } LIT.with(|lit| lit.clone()) }, v10 as i64, v10 as i64);
            let v13: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v12));
            let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v13));
            (v2, v3) = (v5, v14);
            continue;
        }
    }
}
fn closure4() -> Rc<dyn Fn() -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn() -> Rc<str>> = Rc::new(move || -> Rc<str> {
        let mut v0: std::time::SystemTime = std::time::SystemTime::now();
        let mut v1: std::time::Duration = v0.duration_since(std::time::UNIX_EPOCH).unwrap_or_default();
        let v2: u64 = v1.as_secs();
        let mut v3: u64 = v2.wrapping_mul(1000000000u64);
        let v4: u32 = v1.subsec_nanos();
        let mut v5: u64 = (v4 as u64);
        let v6: u64 = v3.wrapping_add(v5);
        let mut v7: u64 = v6.wrapping_div(1000u64);
        let mut v8: Rc<str> = Rc::<str>::from((v7).to_string());
        let v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("-"); } LIT.with(|lit| lit.clone()) }));
        let mut v10: u64 = process_id_9();
        let v11: Rc<str> = Rc::<str>::from((v10).to_string());
        let mut v12: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v11));
        let v13: Rc<RefCell<Vec<u8>>> = Rc::new(RefCell::new(<sha1::Sha1 as sha1::Digest>::digest(v12.as_bytes()).to_vec()));
        let mut v14: i32 = (v13.clone().borrow().len() as i32);
        let v15: i32 = 0i32;
        let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        go_10(v13, v14, v15, v16)
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure5() -> Rc<dyn Fn() -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn() -> Rc<str>> = Rc::new(move || -> Rc<str> {
        let mut v0: std::time::SystemTime = std::time::SystemTime::now();
        let mut v1: std::time::Duration = v0.duration_since(std::time::UNIX_EPOCH).unwrap_or_default();
        let v2: u64 = v1.as_secs();
        let mut v3: u64 = v2.wrapping_mul(1000u64);
        let v4: u32 = v1.subsec_nanos();
        let mut v5: u64 = (v4 as u64);
        let v6: u64 = v5.wrapping_div(1000000u64);
        let mut v7: u64 = v3.wrapping_add(v6);
        let mut v8: u64 = v7.wrapping_div(1000u64);
        let v9: Rc<str> = Rc::<str>::from((v8).to_string());
        v9
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
            let v6: Rc<str> = Rc::<str>::from(v5.strftime("%Y-%m-%d %H:%M").to_string());
            v6
        } else {
            v0
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure7() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        let mut v1: Option<jiff::civil::Date> = v0.parse::<jiff::civil::Date>().ok();
        let v2: bool = v1.is_some();
        if v2 {
            let mut v3: jiff::civil::Date = v1.unwrap();
            let v4: jiff::tz::TimeZone = jiff::tz::TimeZone::system();
            let mut v5: Option<jiff::Zoned> = v3.to_zoned(v4).ok();
            let v6: bool = v5.is_some();
            if v6 {
                let mut v7: jiff::Zoned = v5.clone().unwrap();
                let mut v8: Rc<str> = Rc::<str>::from(v7.timestamp().strftime("%Y-%m-%dT%H:%M:%SZ").to_string());
                v8
            } else {
                let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v9
            }
        } else {
            let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v11
        }
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
