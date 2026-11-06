#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;

pub fn spiral_json_quote(s: &str) -> std::rc::Rc<str> {
    let (q, b) = (char::from(34u8), char::from(92u8));
    let mut out = String::from(q);
    for c in s.chars() {
        match c as u32 {
            34 | 92 => { out.push(b); out.push(c); }
            n @ (8 | 9 | 10 | 12 | 13) => { out.push(b); out.push(char::from(b"btn_fr"[(n - 8) as usize])); }
            n if n < 32 => out.push_str(&format!("{b}u{n:04x}")),
            _ => out.push(c),
        }
    }
    out.push(q);
    std::rc::Rc::from(out.as_str())
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
pub struct Mut0 { pub l0: i32, pub l1: Rc<UH0> }
#[derive(Clone)]
enum US0 {
    US0_Some(i32),
    US0_None,
}
fn method1(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
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
fn method2(mut v0: i32, mut v1: &Rc<RefCell<Mut0>>) -> bool {
    let mut v2: i32 = v1.borrow().l0;
    let v3: bool = v2 < v0;
    v3
}
fn split_list_0(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH0> {
    let mut v2: i32 = (v0.clone().len() as i32);
    let v3: bool = v2 == 0i32;
    if v3 {
        let v4: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH0::UH0_Cons(v1, v4))
    } else {
        let v6: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(v1.split(&*v0).map(|x| Rc::<str>::from(x)).collect::<Vec<Rc<str>>>()));
        let v7: i32 = (v6.clone().borrow().len() as i32);
        let v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v9: Rc<RefCell<Mut0>> = Rc::new(RefCell::new(Mut0 { l0: 0i32, l1: v8 }));
        while method2(v7, &v9) {
            let mut v11: i32 = v9.borrow().l0;
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
        method1(v16, v17)
    }
}
fn method5(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure1() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let mut v1: usize = (v0);
        let mut v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn digits_4(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> US0 {
    loop {
        let v3: i32 = (v0.clone().len() as i32);
        let v4: bool = v1 >= v3;
        if v4 {
            return US0::US0_Some(v2);
        } else {
            let v6: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789"); } LIT.with(|lit| lit.clone()) };
            let v8: Option<usize> = v7.find(&*v6);
            let mut v9: Option<usize> = method5(v8);
            let mut v10: Rc<dyn Fn((usize)) -> i32> = closure1();
            let mut v11: Option<i32> = v9.map(|x| v10(x));
            let v13: i32 = v11.unwrap_or(-1i32);
            let v14: bool = v13 < 0i32;
            let v16: bool = if v14 {
                true
            } else {
                let v15: bool = v2 > 100000000i32;
                v15
            };
            if v16 {
                return US0::US0_None;
            } else {
                let v18: i32 = v1.wrapping_add(1i32);
                let v19: i32 = v2.wrapping_mul(10i32);
                let v20: i32 = v19.wrapping_add(v13);
                (v1, v2) = (v18, v20);
                continue;
            }
        }
    }
}
fn count_of_text_3(mut v0: Rc<str>) -> US0 {
    let mut v1: bool = &*v0 == "";
    let v24: bool = if v1 {
        true
    } else {
        let mut v2: Rc<str> = Rc::<str>::from((0i32).to_string());
        let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let v4: Rc<str> = Rc::<str>::from(v0.replace(&*v2, &*v3));
        let v5: Rc<str> = Rc::<str>::from((1i32).to_string());
        let v6: Rc<str> = Rc::<str>::from(v4.replace(&*v5, &*v3));
        let v7: Rc<str> = Rc::<str>::from((2i32).to_string());
        let v8: Rc<str> = Rc::<str>::from(v6.replace(&*v7, &*v3));
        let mut v9: Rc<str> = Rc::<str>::from((3i32).to_string());
        let mut v10: Rc<str> = Rc::<str>::from(v8.replace(&*v9, &*v3));
        let mut v11: Rc<str> = Rc::<str>::from((4i32).to_string());
        let v12: Rc<str> = Rc::<str>::from(v10.replace(&*v11, &*v3));
        let v13: Rc<str> = Rc::<str>::from((5i32).to_string());
        let v14: Rc<str> = Rc::<str>::from(v12.replace(&*v13, &*v3));
        let v15: Rc<str> = Rc::<str>::from((6i32).to_string());
        let v16: Rc<str> = Rc::<str>::from(v14.replace(&*v15, &*v3));
        let v17: Rc<str> = Rc::<str>::from((7i32).to_string());
        let v18: Rc<str> = Rc::<str>::from(v16.replace(&*v17, &*v3));
        let v19: Rc<str> = Rc::<str>::from((8i32).to_string());
        let v20: Rc<str> = Rc::<str>::from(v18.replace(&*v19, &*v3));
        let v21: Rc<str> = Rc::<str>::from((9i32).to_string());
        let v22: Rc<str> = Rc::<str>::from(v20.replace(&*v21, &*v3));
        let v23: bool = &*v22 != "";
        v23
    };
    if v24 {
        US0::US0_None
    } else {
        let v26: i32 = 0i32;
        let v27: i32 = 0i32;
        digits_4(v0, v26, v27)
    }
}
fn get_environment_variable_6(mut v0: Rc<str>) -> Rc<str> {
    let mut v1: Rc<str> = Rc::<str>::from(std::env::var(&*v0).unwrap_or_default());
    v1
}
fn method7(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> i32 {
    loop {
        let v3: bool = v2 >= v1;
        if v3 {
            return v1;
        } else {
            let v4: u8 = v0.clone().as_bytes()[v2 as usize];
            let v5: bool = v4 == b' ';
            let mut v11: bool = if v5 {
                true
            } else {
                let v6: bool = v4 == b'\t';
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
fn method8(mut v0: Rc<str>, mut v1: i32) -> i32 {
    loop {
        let mut v2: bool = v1 <= 0i32;
        if v2 {
            return -1i32;
        } else {
            let v3: i32 = v1.wrapping_sub(1i32);
            let v4: u8 = v0.clone().as_bytes()[v3 as usize];
            let v5: bool = v4 == b' ';
            let mut v11: bool = if v5 {
                true
            } else {
                let v6: bool = v4 == b'\t';
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
fn method9(mut v0: Vec<u8>) -> Vec<u8> {
    v0
}
fn method11(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2;
            let v3: Rc<UH0> = v3;
            let v4: Rc<UH0> = method11(v3, v1);
            let v5: Rc<str> = Rc::<str>::from(base64::Engine::decode(&base64::prelude::BASE64_STANDARD, (&*v2).as_bytes()).ok().and_then(|b| String::from_utf8(b).ok()).unwrap_or_default());
            Rc::new(UH0::UH0_Cons(v5, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method12(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match Rc::unwrap_or_clone(v0) {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2;
            let v3: Rc<UH0> = v3;
            let v4: Rc<UH0> = method12(v3, v1);
            Rc::new(UH0::UH0_Cons(v2, v4))
        }
        UH0::UH0_Nil => {
            v1
        }
    }
}
fn method13(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
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
fn payloads_from_10(mut v0: ureq::Agent, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: i32, mut v4: Rc<UH0>) -> Rc<UH0> {
    loop {
        let v5: Rc<str> = Rc::<str>::from(format!("{}{}", v1.clone(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/streams/x/topics/run-progress/messages"); } LIT.with(|lit| lit.clone()) }));
        let v6: Rc<str> = Rc::<str>::from((v3).to_string());
        let v7: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("?consumer_id=1&partition_id=0&kind=offset&value="); } LIT.with(|lit| lit.clone()) }, v6));
        let v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&count=1000&auto_commit=false"); } LIT.with(|lit| lit.clone()) }));
        let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v8));
        let mut v10: Result<ureq::http::Response<ureq::Body>, ureq::Error> = v0.get(&*v9).header("Authorization", &*v2).call();
        let mut v11: Rc<str> = Rc::<str>::from(v10.ok().and_then(|mut r| r.body_mut().read_to_string().ok()).unwrap_or_default());
        let v12: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v11).unwrap_or_default();
        let v13: Rc<str> = Rc::<str>::from(v12["messages"].as_array().map(|m| m.iter().filter_map(|x| x["payload"].as_str()).collect::<Vec<_>>().join("
")).unwrap_or_default());
        let v14: bool = &*v13 == "";
        let v18: Rc<UH0> = if v14 {
            { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
        } else {
            let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            split_list_0(v16, v13)
        };
        let v19: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v20: Rc<UH0> = method11(v18, v19);
        let v21: Rc<UH0> = method12(v4, v20.clone());
        let v22: i32 = 0i32;
        let v23: i32 = method13(v20, v22);
        let v24: bool = v23 < 1000i32;
        if v24 {
            return v21;
        } else {
            let v25: i32 = v3.wrapping_add(1000i32);
            (v3, v4) = (v25, v21);
            continue;
        }
    }
}
fn method14(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: bool) -> bool {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3;
                let v4: Rc<UH0> = v4;
                let v13: bool = if v2 {
                    true
                } else {
                    let v5: Rc<str> = spiral_json_quote(&*v0);
                    let v6: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"run\":"); } LIT.with(|lit| lit.clone()) }, v5));
                    let v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) }));
                    let v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"kind\":"); } LIT.with(|lit| lit.clone()) }));
                    let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("finished"); } LIT.with(|lit| lit.clone()) };
                    let mut v10: Rc<str> = spiral_json_quote(&*v9);
                    let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v10));
                    let v12: bool = v3.starts_with(&*v11);
                    v12
                };
                (v1, v2) = (v4, v13);
                continue;
            }
            UH0::UH0_Nil => {
                return v2;
            }
        }
    }
}
fn method15(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<str> = v3;
                let v4: Rc<UH0> = v4;
                let v5: Rc<str> = spiral_json_quote(&*v0);
                let v6: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"run\":"); } LIT.with(|lit| lit.clone()) }, v5));
                let v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) }));
                let v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"kind\":"); } LIT.with(|lit| lit.clone()) }));
                let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("step"); } LIT.with(|lit| lit.clone()) };
                let mut v10: Rc<str> = spiral_json_quote(&*v9);
                let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v10));
                let v12: bool = v3.starts_with(&*v11);
                let v13: i32 = if v12 {
                    1i32
                } else {
                    0i32
                };
                let v14: i32 = v2.wrapping_add(v13);
                (v1, v2) = (v4, v14);
                continue;
            }
            UH0::UH0_Nil => {
                return v2;
            }
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        let mut v1: bool = &*v0 == "";
        let v5: Rc<UH0> = if v1 {
            { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
        } else {
            let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            split_list_0(v3, v0)
        };
        match Rc::unwrap_or_clone(v5) {
            UH0::UH0_Cons(v6, v7) => {
                let v6: Rc<str> = v6;
                let v7: Rc<UH0> = v7;
                match Rc::unwrap_or_clone(v7) {
                    UH0::UH0_Cons(v8, v9) => {
                        let v8: Rc<str> = v8;
                        let mut v9: Rc<UH0> = v9;
                        match Rc::unwrap_or_clone(v9) {
                            UH0::UH0_Cons(v10, v11) => {
                                let mut v10: Rc<str> = v10;
                                let mut v11: Rc<UH0> = v11;
                                match Rc::unwrap_or_clone(v11) {
                                    UH0::UH0_Cons(v104, v105) => {
                                        let v104: Rc<str> = v104;
                                        let v105: Rc<UH0> = v105;
                                        match Rc::unwrap_or_clone(v105) {
                                            UH0::UH0_Nil => {
                                                let v106: bool = &*v6 == "finish";
                                                if v106 {
                                                    let v107: US0 = count_of_text_3(v10);
                                                    let v110: i32 = match v107 {
                                                        US0::US0_None => {
                                                            0i32
                                                        }
                                                        US0::US0_Some(v108) => {
                                                            let v108: i32 = v108;
                                                            v108
                                                        }
                                                    };
                                                    let v111: US0 = count_of_text_3(v104);
                                                    let v114: i32 = match v111 {
                                                        US0::US0_None => {
                                                            0i32
                                                        }
                                                        US0::US0_Some(v112) => {
                                                            let v112: i32 = v112;
                                                            v112
                                                        }
                                                    };
                                                    let v115: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_CA_FILE"); } LIT.with(|lit| lit.clone()) };
                                                    let v116: Rc<str> = get_environment_variable_6(v115);
                                                    let v117: i32 = (v116.clone().len() as i32);
                                                    let v118: i32 = 0i32;
                                                    let v119: i32 = method7(v116.clone(), v117, v118);
                                                    let v120: i32 = v117.wrapping_sub(1i32);
                                                    let v121: Rc<str> = string_slice(&v116, v119 as i64, v120 as i64);
                                                    let v122: i32 = (v121.clone().len() as i32);
                                                    let v123: i32 = method8(v121.clone(), v122);
                                                    let v124: Rc<str> = string_slice(&v121, 0i32 as i64, v123 as i64);
                                                    let v126: Result<Vec<u8>, std::io::Error> = std::fs::read(&*v124);
                                                    let v128: Vec<u8> = v126.unwrap();
                                                    let v129: Vec<u8> = method9(v128);
                                                    let v131: Result<std::string::String, std::string::FromUtf8Error> = std::string::String::from_utf8(v129);
                                                    let v133: std::string::String = v131.unwrap();
                                                    let v135: Rc<str> = Rc::<str>::from(String::as_str(&v133));
                                                    let v136: ureq::tls::TlsConfig = ureq::tls::TlsConfig::builder().root_certs(ureq::tls::Certificate::from_pem((&*v135).as_bytes()).ok().into()).build();
                                                    let mut v137: ureq::Agent = ureq::Agent::config_builder().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(10))).tls_config(v136).build().into();
                                                    let v138: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_URL"); } LIT.with(|lit| lit.clone()) };
                                                    let v139: Rc<str> = get_environment_variable_6(v138);
                                                    let v140: i32 = (v139.clone().len() as i32);
                                                    let v141: i32 = 0i32;
                                                    let v142: i32 = method7(v139.clone(), v140, v141);
                                                    let v143: i32 = v140.wrapping_sub(1i32);
                                                    let v144: Rc<str> = string_slice(&v139, v142 as i64, v143 as i64);
                                                    let v145: i32 = (v144.clone().len() as i32);
                                                    let v146: i32 = method8(v144.clone(), v145);
                                                    let v147: Rc<str> = string_slice(&v144, 0i32 as i64, v146 as i64);
                                                    let v148: Rc<str> = Rc::<str>::from(format!("{}{}", v147.clone(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/users/login"); } LIT.with(|lit| lit.clone()) }));
                                                    let mut v149: ureq::RequestBuilder<ureq::typestate::WithBody> = v137.post(&*v148).header("Content-Type", "application/json");
                                                    let v150: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_USERNAME"); } LIT.with(|lit| lit.clone()) };
                                                    let v151: Rc<str> = get_environment_variable_6(v150);
                                                    let v152: i32 = (v151.clone().len() as i32);
                                                    let v153: i32 = 0i32;
                                                    let v154: i32 = method7(v151.clone(), v152, v153);
                                                    let v155: i32 = v152.wrapping_sub(1i32);
                                                    let v156: Rc<str> = string_slice(&v151, v154 as i64, v155 as i64);
                                                    let v157: i32 = (v156.clone().len() as i32);
                                                    let v158: i32 = method8(v156.clone(), v157);
                                                    let v159: Rc<str> = string_slice(&v156, 0i32 as i64, v158 as i64);
                                                    let v160: Rc<str> = spiral_json_quote(&*v159);
                                                    let v161: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"username\":"); } LIT.with(|lit| lit.clone()) }, v160));
                                                    let v162: Rc<str> = Rc::<str>::from(format!("{}{}", v161, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"password\":"); } LIT.with(|lit| lit.clone()) }));
                                                    let v163: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_PASSWORD"); } LIT.with(|lit| lit.clone()) };
                                                    let v164: Rc<str> = get_environment_variable_6(v163);
                                                    let v165: i32 = (v164.clone().len() as i32);
                                                    let v166: i32 = 0i32;
                                                    let v167: i32 = method7(v164.clone(), v165, v166);
                                                    let v168: i32 = v165.wrapping_sub(1i32);
                                                    let v169: Rc<str> = string_slice(&v164, v167 as i64, v168 as i64);
                                                    let v170: i32 = (v169.clone().len() as i32);
                                                    let v171: i32 = method8(v169.clone(), v170);
                                                    let v172: Rc<str> = string_slice(&v169, 0i32 as i64, v171 as i64);
                                                    let v173: Rc<str> = spiral_json_quote(&*v172);
                                                    let v174: Rc<str> = Rc::<str>::from(format!("{}{}", v162, v173));
                                                    let v175: Rc<str> = Rc::<str>::from(format!("{}{}", v174, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) }));
                                                    let mut v176: Result<ureq::http::Response<ureq::Body>, ureq::Error> = v149.send(&*v175);
                                                    let v177: Rc<str> = Rc::<str>::from(v176.ok().and_then(|mut r| r.body_mut().read_to_string().ok()).unwrap_or_default());
                                                    let v178: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v177).unwrap_or_default();
                                                    let v179: Rc<str> = Rc::<str>::from(v178["access_token"]["token"].as_str().unwrap_or(""));
                                                    let v180: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) }, v179));
                                                    let v181: Rc<str> = Rc::<str>::from(format!("{}{}", v147, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/streams/x/topics/run-progress/messages"); } LIT.with(|lit| lit.clone()) }));
                                                    let mut v182: ureq::RequestBuilder<ureq::typestate::WithBody> = v137.post(&*v181).header("Content-Type", "application/json");
                                                    let mut v183: ureq::RequestBuilder<ureq::typestate::WithBody> = v182.header("Authorization", &*v180);
                                                    let v184: Rc<str> = spiral_json_quote(&*v8);
                                                    let v185: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"run\":"); } LIT.with(|lit| lit.clone()) }, v184));
                                                    let v186: Rc<str> = Rc::<str>::from(format!("{}{}", v185, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) }));
                                                    let v187: Rc<str> = Rc::<str>::from(format!("{}{}", v186, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"kind\":"); } LIT.with(|lit| lit.clone()) }));
                                                    let v188: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("finished"); } LIT.with(|lit| lit.clone()) };
                                                    let v189: Rc<str> = spiral_json_quote(&*v188);
                                                    let v190: Rc<str> = Rc::<str>::from(format!("{}{}", v187, v189));
                                                    let v191: Rc<str> = Rc::<str>::from((v110).to_string());
                                                    let v192: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"steps\":"); } LIT.with(|lit| lit.clone()) }, v191));
                                                    let v193: Rc<str> = Rc::<str>::from(format!("{}{}", v192, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"failures\":"); } LIT.with(|lit| lit.clone()) }));
                                                    let v194: Rc<str> = Rc::<str>::from((v114).to_string());
                                                    let v195: Rc<str> = Rc::<str>::from(format!("{}{}", v193, v194));
                                                    let v196: Rc<str> = Rc::<str>::from(format!("{}{}", v195, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) }));
                                                    let v197: Rc<str> = Rc::<str>::from(format!("{}{}", v190, v196));
                                                    let v198: Rc<str> = Rc::<str>::from(base64::Engine::encode(&base64::prelude::BASE64_STANDARD, (&*v197).as_bytes()));
                                                    let v199: Rc<str> = spiral_json_quote(&*v198);
                                                    let v200: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"partitioning\":{\"kind\":\"partition_id\",\"value\":\"AAAAAA==\"},\"messages\":[{\"id\":0,\"payload\":"); } LIT.with(|lit| lit.clone()) }, v199));
                                                    let v201: Rc<str> = Rc::<str>::from(format!("{}{}", v200, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}]}"); } LIT.with(|lit| lit.clone()) }));
                                                    let v202: Result<ureq::http::Response<ureq::Body>, ureq::Error> = v183.send(&*v201);
                                                    let v203: u16 = v202.map(|r| r.status().as_u16()).unwrap_or(0);
                                                    let v204: i32 = (v203 as i32);
                                                    let v205: Rc<str> = Rc::<str>::from((v204).to_string());
                                                    let v206: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("published "); } LIT.with(|lit| lit.clone()) }, v205));
                                                    v206
                                                } else {
                                                    let v207: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("events: bad arguments"); } LIT.with(|lit| lit.clone()) };
                                                    v207
                                                }
                                            }
                                            _ => {
                                                let v209: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("events: bad arguments"); } LIT.with(|lit| lit.clone()) };
                                                v209
                                            }
                                        }
                                    }
                                    UH0::UH0_Nil => {
                                        let v12: bool = &*v6 == "publish";
                                        if v12 {
                                            let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_CA_FILE"); } LIT.with(|lit| lit.clone()) };
                                            let v14: Rc<str> = get_environment_variable_6(v13);
                                            let v15: i32 = (v14.clone().len() as i32);
                                            let v16: i32 = 0i32;
                                            let v17: i32 = method7(v14.clone(), v15, v16);
                                            let v18: i32 = v15.wrapping_sub(1i32);
                                            let v19: Rc<str> = string_slice(&v14, v17 as i64, v18 as i64);
                                            let v20: i32 = (v19.clone().len() as i32);
                                            let v21: i32 = method8(v19.clone(), v20);
                                            let v22: Rc<str> = string_slice(&v19, 0i32 as i64, v21 as i64);
                                            let v24: Result<Vec<u8>, std::io::Error> = std::fs::read(&*v22);
                                            let v26: Vec<u8> = v24.unwrap();
                                            let v27: Vec<u8> = method9(v26);
                                            let v29: Result<std::string::String, std::string::FromUtf8Error> = std::string::String::from_utf8(v27);
                                            let v31: std::string::String = v29.unwrap();
                                            let v33: Rc<str> = Rc::<str>::from(String::as_str(&v31));
                                            let v34: ureq::tls::TlsConfig = ureq::tls::TlsConfig::builder().root_certs(ureq::tls::Certificate::from_pem((&*v33).as_bytes()).ok().into()).build();
                                            let mut v35: ureq::Agent = ureq::Agent::config_builder().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(10))).tls_config(v34).build().into();
                                            let v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_URL"); } LIT.with(|lit| lit.clone()) };
                                            let v37: Rc<str> = get_environment_variable_6(v36);
                                            let v38: i32 = (v37.clone().len() as i32);
                                            let v39: i32 = 0i32;
                                            let v40: i32 = method7(v37.clone(), v38, v39);
                                            let v41: i32 = v38.wrapping_sub(1i32);
                                            let v42: Rc<str> = string_slice(&v37, v40 as i64, v41 as i64);
                                            let v43: i32 = (v42.clone().len() as i32);
                                            let v44: i32 = method8(v42.clone(), v43);
                                            let v45: Rc<str> = string_slice(&v42, 0i32 as i64, v44 as i64);
                                            let v46: Rc<str> = Rc::<str>::from(format!("{}{}", v45.clone(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/users/login"); } LIT.with(|lit| lit.clone()) }));
                                            let mut v47: ureq::RequestBuilder<ureq::typestate::WithBody> = v35.post(&*v46).header("Content-Type", "application/json");
                                            let v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_USERNAME"); } LIT.with(|lit| lit.clone()) };
                                            let v49: Rc<str> = get_environment_variable_6(v48);
                                            let v50: i32 = (v49.clone().len() as i32);
                                            let v51: i32 = 0i32;
                                            let v52: i32 = method7(v49.clone(), v50, v51);
                                            let v53: i32 = v50.wrapping_sub(1i32);
                                            let v54: Rc<str> = string_slice(&v49, v52 as i64, v53 as i64);
                                            let v55: i32 = (v54.clone().len() as i32);
                                            let v56: i32 = method8(v54.clone(), v55);
                                            let v57: Rc<str> = string_slice(&v54, 0i32 as i64, v56 as i64);
                                            let v58: Rc<str> = spiral_json_quote(&*v57);
                                            let v59: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"username\":"); } LIT.with(|lit| lit.clone()) }, v58));
                                            let v60: Rc<str> = Rc::<str>::from(format!("{}{}", v59, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"password\":"); } LIT.with(|lit| lit.clone()) }));
                                            let v61: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_PASSWORD"); } LIT.with(|lit| lit.clone()) };
                                            let v62: Rc<str> = get_environment_variable_6(v61);
                                            let v63: i32 = (v62.clone().len() as i32);
                                            let v64: i32 = 0i32;
                                            let v65: i32 = method7(v62.clone(), v63, v64);
                                            let v66: i32 = v63.wrapping_sub(1i32);
                                            let v67: Rc<str> = string_slice(&v62, v65 as i64, v66 as i64);
                                            let v68: i32 = (v67.clone().len() as i32);
                                            let v69: i32 = method8(v67.clone(), v68);
                                            let v70: Rc<str> = string_slice(&v67, 0i32 as i64, v69 as i64);
                                            let v71: Rc<str> = spiral_json_quote(&*v70);
                                            let v72: Rc<str> = Rc::<str>::from(format!("{}{}", v60, v71));
                                            let v73: Rc<str> = Rc::<str>::from(format!("{}{}", v72, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) }));
                                            let mut v74: Result<ureq::http::Response<ureq::Body>, ureq::Error> = v47.send(&*v73);
                                            let v75: Rc<str> = Rc::<str>::from(v74.ok().and_then(|mut r| r.body_mut().read_to_string().ok()).unwrap_or_default());
                                            let v76: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v75).unwrap_or_default();
                                            let v77: Rc<str> = Rc::<str>::from(v76["access_token"]["token"].as_str().unwrap_or(""));
                                            let v78: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) }, v77));
                                            let v79: Rc<str> = Rc::<str>::from(format!("{}{}", v45, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/streams/x/topics/run-progress/messages"); } LIT.with(|lit| lit.clone()) }));
                                            let mut v80: ureq::RequestBuilder<ureq::typestate::WithBody> = v35.post(&*v79).header("Content-Type", "application/json");
                                            let mut v81: ureq::RequestBuilder<ureq::typestate::WithBody> = v80.header("Authorization", &*v78);
                                            let v82: Rc<str> = spiral_json_quote(&*v8);
                                            let v83: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"run\":"); } LIT.with(|lit| lit.clone()) }, v82));
                                            let v84: Rc<str> = Rc::<str>::from(format!("{}{}", v83, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) }));
                                            let v85: Rc<str> = Rc::<str>::from(format!("{}{}", v84, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"kind\":"); } LIT.with(|lit| lit.clone()) }));
                                            let v86: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("step"); } LIT.with(|lit| lit.clone()) };
                                            let v87: Rc<str> = spiral_json_quote(&*v86);
                                            let v88: Rc<str> = Rc::<str>::from(format!("{}{}", v85, v87));
                                            let v89: Rc<str> = spiral_json_quote(&*v10);
                                            let v90: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"line\":"); } LIT.with(|lit| lit.clone()) }, v89));
                                            let v91: Rc<str> = Rc::<str>::from(format!("{}{}", v90, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) }));
                                            let v92: Rc<str> = Rc::<str>::from(format!("{}{}", v88, v91));
                                            let v93: Rc<str> = Rc::<str>::from(base64::Engine::encode(&base64::prelude::BASE64_STANDARD, (&*v92).as_bytes()));
                                            let v94: Rc<str> = spiral_json_quote(&*v93);
                                            let v95: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"partitioning\":{\"kind\":\"partition_id\",\"value\":\"AAAAAA==\"},\"messages\":[{\"id\":0,\"payload\":"); } LIT.with(|lit| lit.clone()) }, v94));
                                            let v96: Rc<str> = Rc::<str>::from(format!("{}{}", v95, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}]}"); } LIT.with(|lit| lit.clone()) }));
                                            let v97: Result<ureq::http::Response<ureq::Body>, ureq::Error> = v81.send(&*v96);
                                            let v98: u16 = v97.map(|r| r.status().as_u16()).unwrap_or(0);
                                            let v99: i32 = (v98 as i32);
                                            let v100: Rc<str> = Rc::<str>::from((v99).to_string());
                                            let v101: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("published "); } LIT.with(|lit| lit.clone()) }, v100));
                                            v101
                                        } else {
                                            let v102: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("events: bad arguments"); } LIT.with(|lit| lit.clone()) };
                                            v102
                                        }
                                    }
                                }
                            }
                            UH0::UH0_Nil => {
                                let v213: bool = &*v6 == "count";
                                if v213 {
                                    let v214: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_CA_FILE"); } LIT.with(|lit| lit.clone()) };
                                    let v215: Rc<str> = get_environment_variable_6(v214);
                                    let v216: i32 = (v215.clone().len() as i32);
                                    let v217: i32 = 0i32;
                                    let v218: i32 = method7(v215.clone(), v216, v217);
                                    let v219: i32 = v216.wrapping_sub(1i32);
                                    let v220: Rc<str> = string_slice(&v215, v218 as i64, v219 as i64);
                                    let v221: i32 = (v220.clone().len() as i32);
                                    let v222: i32 = method8(v220.clone(), v221);
                                    let v223: Rc<str> = string_slice(&v220, 0i32 as i64, v222 as i64);
                                    let v225: Result<Vec<u8>, std::io::Error> = std::fs::read(&*v223);
                                    let v227: Vec<u8> = v225.unwrap();
                                    let v228: Vec<u8> = method9(v227);
                                    let v230: Result<std::string::String, std::string::FromUtf8Error> = std::string::String::from_utf8(v228);
                                    let v232: std::string::String = v230.unwrap();
                                    let v234: Rc<str> = Rc::<str>::from(String::as_str(&v232));
                                    let v235: ureq::tls::TlsConfig = ureq::tls::TlsConfig::builder().root_certs(ureq::tls::Certificate::from_pem((&*v234).as_bytes()).ok().into()).build();
                                    let mut v236: ureq::Agent = ureq::Agent::config_builder().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(10))).tls_config(v235).build().into();
                                    let v237: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_URL"); } LIT.with(|lit| lit.clone()) };
                                    let v238: Rc<str> = get_environment_variable_6(v237);
                                    let v239: i32 = (v238.clone().len() as i32);
                                    let v240: i32 = 0i32;
                                    let v241: i32 = method7(v238.clone(), v239, v240);
                                    let v242: i32 = v239.wrapping_sub(1i32);
                                    let v243: Rc<str> = string_slice(&v238, v241 as i64, v242 as i64);
                                    let v244: i32 = (v243.clone().len() as i32);
                                    let v245: i32 = method8(v243.clone(), v244);
                                    let v246: Rc<str> = string_slice(&v243, 0i32 as i64, v245 as i64);
                                    let v247: Rc<str> = Rc::<str>::from(format!("{}{}", v246.clone(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/users/login"); } LIT.with(|lit| lit.clone()) }));
                                    let mut v248: ureq::RequestBuilder<ureq::typestate::WithBody> = v236.post(&*v247).header("Content-Type", "application/json");
                                    let v249: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_USERNAME"); } LIT.with(|lit| lit.clone()) };
                                    let v250: Rc<str> = get_environment_variable_6(v249);
                                    let v251: i32 = (v250.clone().len() as i32);
                                    let v252: i32 = 0i32;
                                    let v253: i32 = method7(v250.clone(), v251, v252);
                                    let v254: i32 = v251.wrapping_sub(1i32);
                                    let v255: Rc<str> = string_slice(&v250, v253 as i64, v254 as i64);
                                    let v256: i32 = (v255.clone().len() as i32);
                                    let v257: i32 = method8(v255.clone(), v256);
                                    let v258: Rc<str> = string_slice(&v255, 0i32 as i64, v257 as i64);
                                    let v259: Rc<str> = spiral_json_quote(&*v258);
                                    let v260: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"username\":"); } LIT.with(|lit| lit.clone()) }, v259));
                                    let v261: Rc<str> = Rc::<str>::from(format!("{}{}", v260, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"password\":"); } LIT.with(|lit| lit.clone()) }));
                                    let v262: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_PASSWORD"); } LIT.with(|lit| lit.clone()) };
                                    let v263: Rc<str> = get_environment_variable_6(v262);
                                    let v264: i32 = (v263.clone().len() as i32);
                                    let v265: i32 = 0i32;
                                    let v266: i32 = method7(v263.clone(), v264, v265);
                                    let v267: i32 = v264.wrapping_sub(1i32);
                                    let v268: Rc<str> = string_slice(&v263, v266 as i64, v267 as i64);
                                    let v269: i32 = (v268.clone().len() as i32);
                                    let v270: i32 = method8(v268.clone(), v269);
                                    let v271: Rc<str> = string_slice(&v268, 0i32 as i64, v270 as i64);
                                    let v272: Rc<str> = spiral_json_quote(&*v271);
                                    let v273: Rc<str> = Rc::<str>::from(format!("{}{}", v261, v272));
                                    let v274: Rc<str> = Rc::<str>::from(format!("{}{}", v273, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) }));
                                    let mut v275: Result<ureq::http::Response<ureq::Body>, ureq::Error> = v248.send(&*v274);
                                    let v276: Rc<str> = Rc::<str>::from(v275.ok().and_then(|mut r| r.body_mut().read_to_string().ok()).unwrap_or_default());
                                    let v277: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v276).unwrap_or_default();
                                    let v278: Rc<str> = Rc::<str>::from(v277["access_token"]["token"].as_str().unwrap_or(""));
                                    let v279: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) }, v278));
                                    let v280: i32 = 0i32;
                                    let v281: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                                    let v282: Rc<UH0> = payloads_from_10(v236, v246, v279, v280, v281);
                                    let v283: bool = false;
                                    let v284: bool = method14(v8.clone(), v282.clone(), v283);
                                    let v287: Rc<str> = if v284 {
                                        let v285: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", finished"); } LIT.with(|lit| lit.clone()) };
                                        v285
                                    } else {
                                        let v286: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                                        v286
                                    };
                                    let v288: i32 = 0i32;
                                    let v289: i32 = method15(v8, v282, v288);
                                    let v290: Rc<str> = Rc::<str>::from((v289).to_string());
                                    let v291: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("counted "); } LIT.with(|lit| lit.clone()) }, v290));
                                    let v292: Rc<str> = Rc::<str>::from(format!("{}{}", v291, v287));
                                    v292
                                } else {
                                    let v293: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("events: bad arguments"); } LIT.with(|lit| lit.clone()) };
                                    v293
                                }
                            }
                        }
                    }
                    _ => {
                        let v297: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("events: bad arguments"); } LIT.with(|lit| lit.clone()) };
                        v297
                    }
                }
            }
            _ => {
                let v299: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("events: bad arguments"); } LIT.with(|lit| lit.clone()) };
                v299
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_events(v0: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0))
}
pub type SpiralShape_652accfc6a8d = Mut0;
