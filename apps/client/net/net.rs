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
                let mut v16: ureq::Error = v10.unwrap_err();
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
                    let mut v16: bool = v6 <= 122u8;
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
            let v42: Rc<str> = if v26 {
                let v27: i32 = (v6 as i32);
                let v28: i32 = v27.wrapping_sub(32i32);
                let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ"); } LIT.with(|lit| lit.clone()) };
                let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"); } LIT.with(|lit| lit.clone()) };
                let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"); } LIT.with(|lit| lit.clone()) };
                let v32: Rc<str> = string_slice(&v31, v28 as i64, v28 as i64);
                v32
            } else {
                let v33: u8 = v6.wrapping_shr((4i32) as u32);
                let v34: i32 = (v33 as i32);
                let mut v35: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789ABCDEF"); } LIT.with(|lit| lit.clone()) }, v34 as i64, v34 as i64);
                let v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("%"); } LIT.with(|lit| lit.clone()) };
                let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v35));
                let v38: u8 = v6 & 15u8;
                let mut v39: i32 = (v38 as i32);
                let v40: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789ABCDEF"); } LIT.with(|lit| lit.clone()) }, v39 as i64, v39 as i64);
                let v41: Rc<str> = Rc::<str>::from(format!("{}{}", v37, v40));
                v41
            };
            let v43: Rc<UH0> = Rc::new(UH0::UH0_Cons(v42, v3));
            (v2, v3) = (v7, v43);
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
                let mut v16: bool = v15 == -1i32;
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
            let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("="); } LIT.with(|lit| lit.clone()) };
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v2, v6)), v3));
            Rc::new(UH0::UH0_Cons(v8, v5))
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
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&"); } LIT.with(|lit| lit.clone()) };
    let v9: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v8));
    let mut v10: Rc<Vec<u8>> = Rc::new(v5.bytes().collect());
    let v11: usize = (v10).len();
    let mut v12: i32 = ((v11) as i32);
    let v13: i32 = 0i32;
    let mut v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v15: Rc<UH0> = method3(v10, v12, v13, v14);
    let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let v17: Rc<str> = method4(v15, v16.clone());
    let v19: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v9, v17)), v8));
    let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_version"); } LIT.with(|lit| lit.clone()) };
    let v21: Rc<Vec<u8>> = Rc::new(v20.bytes().collect());
    let mut v22: usize = (v21).len();
    let v23: i32 = ((v22) as i32);
    let mut v24: i32 = 0i32;
    let v25: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v26: Rc<UH0> = method3(v21, v23, v24, v25);
    let v27: Rc<str> = method4(v26, v16.clone());
    let v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("1.0"); } LIT.with(|lit| lit.clone()) };
    let v29: Rc<Vec<u8>> = Rc::new(v28.bytes().collect());
    let v30: usize = (v29).len();
    let v31: i32 = ((v30) as i32);
    let v32: i32 = 0i32;
    let v33: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v34: Rc<UH0> = method3(v29, v31, v32, v33);
    let mut v35: Rc<str> = method4(v34, v16.clone());
    let v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_token"); } LIT.with(|lit| lit.clone()) };
    let mut v37: Rc<Vec<u8>> = Rc::new(v36.bytes().collect());
    let v38: usize = (v37).len();
    let mut v39: i32 = ((v38) as i32);
    let v40: i32 = 0i32;
    let v41: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v42: Rc<UH0> = method3(v37, v39, v40, v41);
    let v43: Rc<str> = method4(v42, v16.clone());
    let v44: Rc<Vec<u8>> = Rc::new(v2.bytes().collect());
    let v45: usize = (v44).len();
    let v46: i32 = ((v45) as i32);
    let mut v47: i32 = 0i32;
    let v48: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v49: Rc<UH0> = method3(v44, v46, v47, v48);
    let v50: Rc<str> = method4(v49, v16.clone());
    let mut v51: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_timestamp"); } LIT.with(|lit| lit.clone()) };
    let v52: Rc<Vec<u8>> = Rc::new(v51.bytes().collect());
    let v53: usize = (v52).len();
    let v54: i32 = ((v53) as i32);
    let v55: i32 = 0i32;
    let v56: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v57: Rc<UH0> = method3(v52, v54, v55, v56);
    let v58: Rc<str> = method4(v57, v16.clone());
    let v59: Rc<Vec<u8>> = Rc::new(v7.bytes().collect());
    let v60: usize = (v59).len();
    let v61: i32 = ((v60) as i32);
    let v62: i32 = 0i32;
    let v63: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v64: Rc<UH0> = method3(v59, v61, v62, v63);
    let v65: Rc<str> = method4(v64, v16.clone());
    let v66: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_signature_method"); } LIT.with(|lit| lit.clone()) };
    let v67: Rc<Vec<u8>> = Rc::new(v66.bytes().collect());
    let v68: usize = (v67).len();
    let v69: i32 = ((v68) as i32);
    let v70: i32 = 0i32;
    let v71: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v72: Rc<UH0> = method3(v67, v69, v70, v71);
    let v73: Rc<str> = method4(v72, v16.clone());
    let v74: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("HMAC-SHA1"); } LIT.with(|lit| lit.clone()) };
    let v75: Rc<Vec<u8>> = Rc::new(v74.bytes().collect());
    let v76: usize = (v75).len();
    let v77: i32 = ((v76) as i32);
    let v78: i32 = 0i32;
    let v79: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v80: Rc<UH0> = method3(v75, v77, v78, v79);
    let v81: Rc<str> = method4(v80, v16.clone());
    let v82: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_nonce"); } LIT.with(|lit| lit.clone()) };
    let v83: Rc<Vec<u8>> = Rc::new(v82.bytes().collect());
    let v84: usize = (v83).len();
    let v85: i32 = ((v84) as i32);
    let v86: i32 = 0i32;
    let v87: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v88: Rc<UH0> = method3(v83, v85, v86, v87);
    let v89: Rc<str> = method4(v88, v16.clone());
    let v90: Rc<Vec<u8>> = Rc::new(v6.bytes().collect());
    let v91: usize = (v90).len();
    let v92: i32 = ((v91) as i32);
    let v93: i32 = 0i32;
    let v94: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v95: Rc<UH0> = method3(v90, v92, v93, v94);
    let v96: Rc<str> = method4(v95, v16.clone());
    let v97: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_consumer_key"); } LIT.with(|lit| lit.clone()) };
    let v98: Rc<Vec<u8>> = Rc::new(v97.bytes().collect());
    let v99: usize = (v98).len();
    let v100: i32 = ((v99) as i32);
    let v101: i32 = 0i32;
    let v102: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v103: Rc<UH0> = method3(v98, v100, v101, v102);
    let v104: Rc<str> = method4(v103, v16.clone());
    let v105: Rc<Vec<u8>> = Rc::new(v0.bytes().collect());
    let v106: usize = (v105).len();
    let v107: i32 = ((v106) as i32);
    let v108: i32 = 0i32;
    let v109: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v110: Rc<UH0> = method3(v105, v107, v108, v109);
    let v111: Rc<str> = method4(v110, v16.clone());
    let v112: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v113: Rc<UH1> = oauth1_inserted_5(v104, v111, v112);
    let v114: Rc<UH1> = oauth1_inserted_5(v89, v96, v113);
    let v115: Rc<UH1> = oauth1_inserted_5(v73, v81, v114);
    let v116: Rc<UH1> = oauth1_inserted_5(v58, v65, v115);
    let v117: Rc<UH1> = oauth1_inserted_5(v43, v50, v116);
    let v118: Rc<UH1> = oauth1_inserted_5(v27, v35, v117);
    let v119: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v120: Rc<UH0> = method6(v118, v119);
    let v121: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v122: i32 = 0i32;
    let v123: i32 = method7(v121.clone(), v120, v122);
    let v124: Rc<Vec<Rc<str>>> = Rc::new(v121.borrow().clone());
    let v125: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v124).as_ref().clone()));
    let v126: Rc<str> = Rc::<str>::from((*v125.borrow()).join(&*v8));
    let v127: Rc<Vec<u8>> = Rc::new(v126.bytes().collect());
    let v128: usize = (v127).len();
    let v129: i32 = ((v128) as i32);
    let v130: i32 = 0i32;
    let v131: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v132: Rc<UH0> = method3(v127, v129, v130, v131);
    let v133: Rc<str> = method4(v132, v16.clone());
    let v134: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v133));
    let v135: Rc<Vec<u8>> = Rc::new(v1.bytes().collect());
    let v136: usize = (v135).len();
    let v137: i32 = ((v136) as i32);
    let v138: i32 = 0i32;
    let v139: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v140: Rc<UH0> = method3(v135, v137, v138, v139);
    let v141: Rc<str> = method4(v140, v16.clone());
    let v142: Rc<str> = Rc::<str>::from(format!("{}{}", v141, v8));
    let v143: Rc<Vec<u8>> = Rc::new(v3.bytes().collect());
    let v144: usize = (v143).len();
    let v145: i32 = ((v144) as i32);
    let v146: i32 = 0i32;
    let v147: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v148: Rc<UH0> = method3(v143, v145, v146, v147);
    let v149: Rc<str> = method4(v148, v16.clone());
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
    let v164: Rc<str> = method4(v163, v16.clone());
    let v165: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("=\""); } LIT.with(|lit| lit.clone()) };
    let v166: Rc<str> = Rc::<str>::from(format!("{}{}", v164, v165));
    let v167: Rc<Vec<u8>> = Rc::new(v156.bytes().collect());
    let v168: usize = (v167).len();
    let v169: i32 = ((v168) as i32);
    let v170: i32 = 0i32;
    let v171: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v172: Rc<UH0> = method3(v167, v169, v170, v171);
    let v173: Rc<str> = method4(v172, v16.clone());
    let v174: Rc<str> = Rc::<str>::from(format!("{}{}", v166, v173));
    let v175: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) };
    let v176: Rc<str> = Rc::<str>::from(format!("{}{}", v174, v175));
    let v177: Rc<Vec<u8>> = Rc::new(v20.bytes().collect());
    let v178: usize = (v177).len();
    let v179: i32 = ((v178) as i32);
    let v180: i32 = 0i32;
    let v181: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v182: Rc<UH0> = method3(v177, v179, v180, v181);
    let v183: Rc<str> = method4(v182, v16.clone());
    let v184: Rc<str> = Rc::<str>::from(format!("{}{}", v183, v165));
    let v185: Rc<Vec<u8>> = Rc::new(v28.bytes().collect());
    let v186: usize = (v185).len();
    let v187: i32 = ((v186) as i32);
    let v188: i32 = 0i32;
    let v189: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v190: Rc<UH0> = method3(v185, v187, v188, v189);
    let v191: Rc<str> = method4(v190, v16.clone());
    let v193: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v184, v191)), v175));
    let v194: Rc<Vec<u8>> = Rc::new(v36.bytes().collect());
    let v195: usize = (v194).len();
    let v196: i32 = ((v195) as i32);
    let v197: i32 = 0i32;
    let v198: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v199: Rc<UH0> = method3(v194, v196, v197, v198);
    let v200: Rc<str> = method4(v199, v16.clone());
    let v201: Rc<str> = Rc::<str>::from(format!("{}{}", v200, v165));
    let v202: Rc<Vec<u8>> = Rc::new(v2.bytes().collect());
    let v203: usize = (v202).len();
    let v204: i32 = ((v203) as i32);
    let v205: i32 = 0i32;
    let v206: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v207: Rc<UH0> = method3(v202, v204, v205, v206);
    let v208: Rc<str> = method4(v207, v16.clone());
    let v210: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v201, v208)), v175));
    let v211: Rc<Vec<u8>> = Rc::new(v51.bytes().collect());
    let v212: usize = (v211).len();
    let v213: i32 = ((v212) as i32);
    let v214: i32 = 0i32;
    let v215: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v216: Rc<UH0> = method3(v211, v213, v214, v215);
    let v217: Rc<str> = method4(v216, v16.clone());
    let v218: Rc<str> = Rc::<str>::from(format!("{}{}", v217, v165));
    let v219: Rc<Vec<u8>> = Rc::new(v7.bytes().collect());
    let v220: usize = (v219).len();
    let v221: i32 = ((v220) as i32);
    let v222: i32 = 0i32;
    let v223: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v224: Rc<UH0> = method3(v219, v221, v222, v223);
    let v225: Rc<str> = method4(v224, v16.clone());
    let v227: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v218, v225)), v175));
    let v228: Rc<Vec<u8>> = Rc::new(v66.bytes().collect());
    let v229: usize = (v228).len();
    let v230: i32 = ((v229) as i32);
    let v231: i32 = 0i32;
    let v232: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v233: Rc<UH0> = method3(v228, v230, v231, v232);
    let v234: Rc<str> = method4(v233, v16.clone());
    let v235: Rc<str> = Rc::<str>::from(format!("{}{}", v234, v165));
    let v236: Rc<Vec<u8>> = Rc::new(v74.bytes().collect());
    let v237: usize = (v236).len();
    let v238: i32 = ((v237) as i32);
    let v239: i32 = 0i32;
    let v240: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v241: Rc<UH0> = method3(v236, v238, v239, v240);
    let v242: Rc<str> = method4(v241, v16.clone());
    let v244: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v235, v242)), v175));
    let v245: Rc<Vec<u8>> = Rc::new(v82.bytes().collect());
    let v246: usize = (v245).len();
    let v247: i32 = ((v246) as i32);
    let v248: i32 = 0i32;
    let v249: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v250: Rc<UH0> = method3(v245, v247, v248, v249);
    let v251: Rc<str> = method4(v250, v16.clone());
    let v252: Rc<str> = Rc::<str>::from(format!("{}{}", v251, v165));
    let v253: Rc<Vec<u8>> = Rc::new(v6.bytes().collect());
    let v254: usize = (v253).len();
    let v255: i32 = ((v254) as i32);
    let v256: i32 = 0i32;
    let v257: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v258: Rc<UH0> = method3(v253, v255, v256, v257);
    let v259: Rc<str> = method4(v258, v16.clone());
    let v261: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v252, v259)), v175));
    let v262: Rc<Vec<u8>> = Rc::new(v97.bytes().collect());
    let v263: usize = (v262).len();
    let v264: i32 = ((v263) as i32);
    let v265: i32 = 0i32;
    let v266: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v267: Rc<UH0> = method3(v262, v264, v265, v266);
    let v268: Rc<str> = method4(v267, v16.clone());
    let v269: Rc<str> = Rc::<str>::from(format!("{}{}", v268, v165));
    let v270: Rc<Vec<u8>> = Rc::new(v0.bytes().collect());
    let v271: usize = (v270).len();
    let v272: i32 = ((v271) as i32);
    let v273: i32 = 0i32;
    let v274: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v275: Rc<UH0> = method3(v270, v272, v273, v274);
    let v276: Rc<str> = method4(v275, v16);
    let v278: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v269, v276)), v175));
    let mut v279: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    v279.borrow_mut().push(v278);
    v279.borrow_mut().push(v261);
    v279.borrow_mut().push(v244);
    v279.borrow_mut().push(v227);
    v279.borrow_mut().push(v210);
    v279.borrow_mut().push(v193);
    v279.borrow_mut().push(v176);
    let v280: Rc<Vec<Rc<str>>> = Rc::new(v279.borrow().clone());
    let v281: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v280).as_ref().clone()));
    let v282: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", "); } LIT.with(|lit| lit.clone()) };
    let v283: Rc<str> = Rc::<str>::from((*v281.borrow()).join(&*v282));
    let v284: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("OAuth "); } LIT.with(|lit| lit.clone()) };
    let v285: Rc<str> = Rc::<str>::from(format!("{}{}", v284, v283));
    v285
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
    let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
    let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v1, v6)), v2));
    let v9: Rc<str> = Rc::<str>::from(base64::Engine::encode(&base64::prelude::BASE64_STANDARD, (v8).as_bytes()));
    let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Basic "); } LIT.with(|lit| lit.clone()) };
    let v11: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v9));
    let mut v12: ureq::RequestBuilder<ureq::typestate::WithBody> = ureq::post(&*v0).header("Authorization", &*v11).header("Content-Type", "application/x-www-form-urlencoded");
    let v13: ureq::RequestBuilder<ureq::typestate::WithBody> = v12.config().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(30))).build();
    let mut v14: Result<ureq::http::Response<ureq::Body>, ureq::Error> = ureq::RequestBuilder::send(v13, &*v3);
    let v15: bool = v14.is_ok();
    let (mut v22, mut v23): (i32, Rc<str>) = if v15 {
        let mut v16: ureq::http::Response<ureq::Body> = v14.unwrap();
        let v17: u16 = v16.status().as_u16();
        let v18: i32 = (v17 as i32);
        let v19: Rc<str> = Rc::<str>::from(v16.body_mut().read_to_string().unwrap_or_default());
        (v18, v19)
    } else {
        let mut v20: ureq::Error = v14.unwrap_err();
        let v21: Rc<str> = Rc::<str>::from(v20.to_string());
        (0i32, v21)
    };
    (v22, v23)
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
            let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v3, Rc::<str>::from(format!("{}{}", v11, v12))));
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
        let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("-"); } LIT.with(|lit| lit.clone()) };
        let mut v10: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v9));
        let v11: u64 = process_id_9();
        let mut v12: Rc<str> = Rc::<str>::from((v11).to_string());
        let v13: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v12));
        let mut v14: Rc<RefCell<Vec<u8>>> = Rc::new(RefCell::new(<sha1::Sha1 as sha1::Digest>::digest(v13.as_bytes()).to_vec()));
        let v15: i32 = (v14.clone().borrow().len() as i32);
        let mut v16: i32 = 0i32;
        let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        go_10(v14, v15, v16, v17)
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
