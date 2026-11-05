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
struct Mut0 { l0: i32, l1: Rc<UH0> }
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
            let mut v13: Rc<str> = v6.borrow()[v11 as usize].clone();
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
            let mut v13: i32 = v11.unwrap_or(-1i32);
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
        let mut v13: Rc<str> = Rc::<str>::from((5i32).to_string());
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
        let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/streams/x/topics/run-progress/messages"); } LIT.with(|lit| lit.clone()) };
        let v6: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v5));
        let v7: Rc<str> = Rc::<str>::from((v3).to_string());
        let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("?consumer_id=1&partition_id=0&kind=offset&value="); } LIT.with(|lit| lit.clone()) };
        let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v7));
        let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&count=1000&auto_commit=false"); } LIT.with(|lit| lit.clone()) };
        let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v6, Rc::<str>::from(format!("{}{}", v9, v10))));
        let mut v13: Result<ureq::http::Response<ureq::Body>, ureq::Error> = v0.get(&*v12).header("Authorization", &*v2).call();
        let v14: Rc<str> = Rc::<str>::from(v13.ok().and_then(|mut r| r.body_mut().read_to_string().ok()).unwrap_or_default());
        let v15: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v14).unwrap_or_default();
        let v16: Rc<str> = Rc::<str>::from(v15["messages"].as_array().map(|m| m.iter().filter_map(|x| x["payload"].as_str()).collect::<Vec<_>>().join("
")).unwrap_or_default());
        let v17: bool = &*v16 == "";
        let v21: Rc<UH0> = if v17 {
            { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
        } else {
            let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            split_list_0(v19, v16)
        };
        let v22: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let v23: Rc<UH0> = method11(v21, v22);
        let v24: Rc<UH0> = method12(v4, v23.clone());
        let v25: i32 = 0i32;
        let v26: i32 = method13(v23, v25);
        let v27: bool = v26 < 1000i32;
        if v27 {
            return v24;
        } else {
            let v28: i32 = v3.wrapping_add(1000i32);
            (v3, v4) = (v28, v24);
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
                let v16: bool = if v2 {
                    true
                } else {
                    let v5: Rc<str> = spiral_json_quote(&*v0);
                    let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"run\":"); } LIT.with(|lit| lit.clone()) };
                    let v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v5));
                    let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                    let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v8));
                    let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"kind\":"); } LIT.with(|lit| lit.clone()) };
                    let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v10));
                    let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("finished"); } LIT.with(|lit| lit.clone()) };
                    let mut v13: Rc<str> = spiral_json_quote(&*v12);
                    let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v13));
                    let v15: bool = v3.starts_with(&*v14);
                    v15
                };
                (v1, v2) = (v4, v16);
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
                let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"run\":"); } LIT.with(|lit| lit.clone()) };
                let v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v5));
                let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v8));
                let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"kind\":"); } LIT.with(|lit| lit.clone()) };
                let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v10));
                let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("step"); } LIT.with(|lit| lit.clone()) };
                let mut v13: Rc<str> = spiral_json_quote(&*v12);
                let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v13));
                let v15: bool = v3.starts_with(&*v14);
                let v16: i32 = if v15 {
                    1i32
                } else {
                    0i32
                };
                let v17: i32 = v2.wrapping_add(v16);
                (v1, v2) = (v4, v17);
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
                                    UH0::UH0_Cons(v121, v122) => {
                                        let v121: Rc<str> = v121;
                                        let v122: Rc<UH0> = v122;
                                        match Rc::unwrap_or_clone(v122) {
                                            UH0::UH0_Nil => {
                                                let v123: bool = &*v6 == "finish";
                                                if v123 {
                                                    let v124: US0 = count_of_text_3(v10);
                                                    let v127: i32 = match v124 {
                                                        US0::US0_None => {
                                                            0i32
                                                        }
                                                        US0::US0_Some(v125) => {
                                                            let v125: i32 = v125;
                                                            v125
                                                        }
                                                    };
                                                    let v128: US0 = count_of_text_3(v121);
                                                    let v131: i32 = match v128 {
                                                        US0::US0_None => {
                                                            0i32
                                                        }
                                                        US0::US0_Some(v129) => {
                                                            let v129: i32 = v129;
                                                            v129
                                                        }
                                                    };
                                                    let v132: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_CA_FILE"); } LIT.with(|lit| lit.clone()) };
                                                    let v133: Rc<str> = get_environment_variable_6(v132);
                                                    let v134: i32 = (v133.clone().len() as i32);
                                                    let v135: i32 = 0i32;
                                                    let v136: i32 = method7(v133.clone(), v134, v135);
                                                    let v137: i32 = v134.wrapping_sub(1i32);
                                                    let v138: Rc<str> = string_slice(&v133, v136 as i64, v137 as i64);
                                                    let v139: i32 = (v138.clone().len() as i32);
                                                    let v140: i32 = method8(v138.clone(), v139);
                                                    let v141: Rc<str> = string_slice(&v138, 0i32 as i64, v140 as i64);
                                                    let v143: Result<Vec<u8>, std::io::Error> = std::fs::read(&*v141);
                                                    let v145: Vec<u8> = v143.unwrap();
                                                    let v146: Vec<u8> = method9(v145);
                                                    let v148: Result<std::string::String, std::string::FromUtf8Error> = std::string::String::from_utf8(v146);
                                                    let v150: std::string::String = v148.unwrap();
                                                    let v152: Rc<str> = Rc::<str>::from(String::as_str(&v150));
                                                    let v153: ureq::tls::TlsConfig = ureq::tls::TlsConfig::builder().root_certs(ureq::tls::Certificate::from_pem((&*v152).as_bytes()).ok().into()).build();
                                                    let mut v154: ureq::Agent = ureq::Agent::config_builder().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(10))).tls_config(v153).build().into();
                                                    let v155: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_URL"); } LIT.with(|lit| lit.clone()) };
                                                    let v156: Rc<str> = get_environment_variable_6(v155);
                                                    let v157: i32 = (v156.clone().len() as i32);
                                                    let v158: i32 = 0i32;
                                                    let v159: i32 = method7(v156.clone(), v157, v158);
                                                    let v160: i32 = v157.wrapping_sub(1i32);
                                                    let v161: Rc<str> = string_slice(&v156, v159 as i64, v160 as i64);
                                                    let v162: i32 = (v161.clone().len() as i32);
                                                    let v163: i32 = method8(v161.clone(), v162);
                                                    let v164: Rc<str> = string_slice(&v161, 0i32 as i64, v163 as i64);
                                                    let v165: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/users/login"); } LIT.with(|lit| lit.clone()) };
                                                    let v166: Rc<str> = Rc::<str>::from(format!("{}{}", v164, v165));
                                                    let mut v167: ureq::RequestBuilder<ureq::typestate::WithBody> = v154.post(&*v166).header("Content-Type", "application/json");
                                                    let v168: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_USERNAME"); } LIT.with(|lit| lit.clone()) };
                                                    let v169: Rc<str> = get_environment_variable_6(v168);
                                                    let v170: i32 = (v169.clone().len() as i32);
                                                    let v171: i32 = 0i32;
                                                    let v172: i32 = method7(v169.clone(), v170, v171);
                                                    let v173: i32 = v170.wrapping_sub(1i32);
                                                    let v174: Rc<str> = string_slice(&v169, v172 as i64, v173 as i64);
                                                    let v175: i32 = (v174.clone().len() as i32);
                                                    let v176: i32 = method8(v174.clone(), v175);
                                                    let v177: Rc<str> = string_slice(&v174, 0i32 as i64, v176 as i64);
                                                    let v178: Rc<str> = spiral_json_quote(&*v177);
                                                    let v179: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"username\":"); } LIT.with(|lit| lit.clone()) };
                                                    let v180: Rc<str> = Rc::<str>::from(format!("{}{}", v179, v178));
                                                    let v181: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"password\":"); } LIT.with(|lit| lit.clone()) };
                                                    let v182: Rc<str> = Rc::<str>::from(format!("{}{}", v180, v181));
                                                    let v183: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_PASSWORD"); } LIT.with(|lit| lit.clone()) };
                                                    let v184: Rc<str> = get_environment_variable_6(v183);
                                                    let v185: i32 = (v184.clone().len() as i32);
                                                    let v186: i32 = 0i32;
                                                    let v187: i32 = method7(v184.clone(), v185, v186);
                                                    let v188: i32 = v185.wrapping_sub(1i32);
                                                    let v189: Rc<str> = string_slice(&v184, v187 as i64, v188 as i64);
                                                    let v190: i32 = (v189.clone().len() as i32);
                                                    let v191: i32 = method8(v189.clone(), v190);
                                                    let v192: Rc<str> = string_slice(&v189, 0i32 as i64, v191 as i64);
                                                    let v193: Rc<str> = spiral_json_quote(&*v192);
                                                    let v194: Rc<str> = Rc::<str>::from(format!("{}{}", v182, v193));
                                                    let v195: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
                                                    let v196: Rc<str> = Rc::<str>::from(format!("{}{}", v194, v195));
                                                    let mut v197: Result<ureq::http::Response<ureq::Body>, ureq::Error> = v167.send(&*v196);
                                                    let v198: Rc<str> = Rc::<str>::from(v197.ok().and_then(|mut r| r.body_mut().read_to_string().ok()).unwrap_or_default());
                                                    let v199: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v198).unwrap_or_default();
                                                    let v200: Rc<str> = Rc::<str>::from(v199["access_token"]["token"].as_str().unwrap_or(""));
                                                    let v201: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) };
                                                    let v202: Rc<str> = Rc::<str>::from(format!("{}{}", v201, v200));
                                                    let v203: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/streams/x/topics/run-progress/messages"); } LIT.with(|lit| lit.clone()) };
                                                    let v204: Rc<str> = Rc::<str>::from(format!("{}{}", v164, v203));
                                                    let mut v205: ureq::RequestBuilder<ureq::typestate::WithBody> = v154.post(&*v204).header("Content-Type", "application/json");
                                                    let mut v206: ureq::RequestBuilder<ureq::typestate::WithBody> = v205.header("Authorization", &*v202);
                                                    let v207: Rc<str> = spiral_json_quote(&*v8);
                                                    let v208: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"run\":"); } LIT.with(|lit| lit.clone()) };
                                                    let v209: Rc<str> = Rc::<str>::from(format!("{}{}", v208, v207));
                                                    let v210: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                                                    let v211: Rc<str> = Rc::<str>::from(format!("{}{}", v209, v210));
                                                    let v212: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"kind\":"); } LIT.with(|lit| lit.clone()) };
                                                    let v213: Rc<str> = Rc::<str>::from(format!("{}{}", v211, v212));
                                                    let v214: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("finished"); } LIT.with(|lit| lit.clone()) };
                                                    let v215: Rc<str> = spiral_json_quote(&*v214);
                                                    let v216: Rc<str> = Rc::<str>::from(format!("{}{}", v213, v215));
                                                    let v217: Rc<str> = Rc::<str>::from((v127).to_string());
                                                    let v218: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"steps\":"); } LIT.with(|lit| lit.clone()) };
                                                    let v219: Rc<str> = Rc::<str>::from(format!("{}{}", v218, v217));
                                                    let v220: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"failures\":"); } LIT.with(|lit| lit.clone()) };
                                                    let v221: Rc<str> = Rc::<str>::from(format!("{}{}", v219, v220));
                                                    let v222: Rc<str> = Rc::<str>::from((v131).to_string());
                                                    let v225: Rc<str> = Rc::<str>::from(format!("{}{}", v216, Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v221, v222)), v195))));
                                                    let v226: Rc<str> = Rc::<str>::from(base64::Engine::encode(&base64::prelude::BASE64_STANDARD, (&*v225).as_bytes()));
                                                    let v227: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"partitioning\":"); } LIT.with(|lit| lit.clone()) };
                                                    let v228: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"kind\":\"partition_id\",\"value\":\"AAAAAA==\"}"); } LIT.with(|lit| lit.clone()) };
                                                    let v229: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"partitioning\":{\"kind\":\"partition_id\",\"value\":\"AAAAAA==\"}"); } LIT.with(|lit| lit.clone()) };
                                                    let v230: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"messages\":[{\"id\":0,\"payload\":"); } LIT.with(|lit| lit.clone()) };
                                                    let v231: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"partitioning\":{\"kind\":\"partition_id\",\"value\":\"AAAAAA==\"},\"messages\":[{\"id\":0,\"payload\":"); } LIT.with(|lit| lit.clone()) };
                                                    let v232: Rc<str> = spiral_json_quote(&*v226);
                                                    let v233: Rc<str> = Rc::<str>::from(format!("{}{}", v231, v232));
                                                    let v234: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}]}"); } LIT.with(|lit| lit.clone()) };
                                                    let v235: Rc<str> = Rc::<str>::from(format!("{}{}", v233, v234));
                                                    let v236: Result<ureq::http::Response<ureq::Body>, ureq::Error> = v206.send(&*v235);
                                                    let v237: u16 = v236.map(|r| r.status().as_u16()).unwrap_or(0);
                                                    let v238: i32 = (v237 as i32);
                                                    let v239: Rc<str> = Rc::<str>::from((v238).to_string());
                                                    let v240: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("published "); } LIT.with(|lit| lit.clone()) };
                                                    let v241: Rc<str> = Rc::<str>::from(format!("{}{}", v240, v239));
                                                    v241
                                                } else {
                                                    let v242: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("events: bad arguments"); } LIT.with(|lit| lit.clone()) };
                                                    v242
                                                }
                                            }
                                            _ => {
                                                let v244: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("events: bad arguments"); } LIT.with(|lit| lit.clone()) };
                                                v244
                                            }
                                        }
                                    }
                                    UH0::UH0_Nil => {
                                        let v12: bool = &*v6 == "publish";
                                        if v12 {
                                            let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_CA_FILE"); } LIT.with(|lit| lit.clone()) };
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
                                            let v46: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/users/login"); } LIT.with(|lit| lit.clone()) };
                                            let v47: Rc<str> = Rc::<str>::from(format!("{}{}", v45, v46));
                                            let mut v48: ureq::RequestBuilder<ureq::typestate::WithBody> = v35.post(&*v47).header("Content-Type", "application/json");
                                            let v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_USERNAME"); } LIT.with(|lit| lit.clone()) };
                                            let v50: Rc<str> = get_environment_variable_6(v49);
                                            let v51: i32 = (v50.clone().len() as i32);
                                            let v52: i32 = 0i32;
                                            let v53: i32 = method7(v50.clone(), v51, v52);
                                            let v54: i32 = v51.wrapping_sub(1i32);
                                            let v55: Rc<str> = string_slice(&v50, v53 as i64, v54 as i64);
                                            let v56: i32 = (v55.clone().len() as i32);
                                            let v57: i32 = method8(v55.clone(), v56);
                                            let v58: Rc<str> = string_slice(&v55, 0i32 as i64, v57 as i64);
                                            let v59: Rc<str> = spiral_json_quote(&*v58);
                                            let v60: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"username\":"); } LIT.with(|lit| lit.clone()) };
                                            let v61: Rc<str> = Rc::<str>::from(format!("{}{}", v60, v59));
                                            let v62: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"password\":"); } LIT.with(|lit| lit.clone()) };
                                            let v63: Rc<str> = Rc::<str>::from(format!("{}{}", v61, v62));
                                            let v64: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_PASSWORD"); } LIT.with(|lit| lit.clone()) };
                                            let v65: Rc<str> = get_environment_variable_6(v64);
                                            let v66: i32 = (v65.clone().len() as i32);
                                            let v67: i32 = 0i32;
                                            let v68: i32 = method7(v65.clone(), v66, v67);
                                            let v69: i32 = v66.wrapping_sub(1i32);
                                            let v70: Rc<str> = string_slice(&v65, v68 as i64, v69 as i64);
                                            let v71: i32 = (v70.clone().len() as i32);
                                            let v72: i32 = method8(v70.clone(), v71);
                                            let v73: Rc<str> = string_slice(&v70, 0i32 as i64, v72 as i64);
                                            let v74: Rc<str> = spiral_json_quote(&*v73);
                                            let v75: Rc<str> = Rc::<str>::from(format!("{}{}", v63, v74));
                                            let v76: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
                                            let v77: Rc<str> = Rc::<str>::from(format!("{}{}", v75, v76));
                                            let mut v78: Result<ureq::http::Response<ureq::Body>, ureq::Error> = v48.send(&*v77);
                                            let v79: Rc<str> = Rc::<str>::from(v78.ok().and_then(|mut r| r.body_mut().read_to_string().ok()).unwrap_or_default());
                                            let v80: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v79).unwrap_or_default();
                                            let v81: Rc<str> = Rc::<str>::from(v80["access_token"]["token"].as_str().unwrap_or(""));
                                            let v82: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) };
                                            let v83: Rc<str> = Rc::<str>::from(format!("{}{}", v82, v81));
                                            let v84: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/streams/x/topics/run-progress/messages"); } LIT.with(|lit| lit.clone()) };
                                            let v85: Rc<str> = Rc::<str>::from(format!("{}{}", v45, v84));
                                            let mut v86: ureq::RequestBuilder<ureq::typestate::WithBody> = v35.post(&*v85).header("Content-Type", "application/json");
                                            let mut v87: ureq::RequestBuilder<ureq::typestate::WithBody> = v86.header("Authorization", &*v83);
                                            let v88: Rc<str> = spiral_json_quote(&*v8);
                                            let v89: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"run\":"); } LIT.with(|lit| lit.clone()) };
                                            let v90: Rc<str> = Rc::<str>::from(format!("{}{}", v89, v88));
                                            let v91: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
                                            let v92: Rc<str> = Rc::<str>::from(format!("{}{}", v90, v91));
                                            let v93: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"kind\":"); } LIT.with(|lit| lit.clone()) };
                                            let v94: Rc<str> = Rc::<str>::from(format!("{}{}", v92, v93));
                                            let v95: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("step"); } LIT.with(|lit| lit.clone()) };
                                            let v96: Rc<str> = spiral_json_quote(&*v95);
                                            let v97: Rc<str> = Rc::<str>::from(format!("{}{}", v94, v96));
                                            let v98: Rc<str> = spiral_json_quote(&*v10);
                                            let v99: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"line\":"); } LIT.with(|lit| lit.clone()) };
                                            let v102: Rc<str> = Rc::<str>::from(format!("{}{}", v97, Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v99, v98)), v76))));
                                            let v103: Rc<str> = Rc::<str>::from(base64::Engine::encode(&base64::prelude::BASE64_STANDARD, (&*v102).as_bytes()));
                                            let v104: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"partitioning\":"); } LIT.with(|lit| lit.clone()) };
                                            let v105: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"kind\":\"partition_id\",\"value\":\"AAAAAA==\"}"); } LIT.with(|lit| lit.clone()) };
                                            let v106: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"partitioning\":{\"kind\":\"partition_id\",\"value\":\"AAAAAA==\"}"); } LIT.with(|lit| lit.clone()) };
                                            let v107: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"messages\":[{\"id\":0,\"payload\":"); } LIT.with(|lit| lit.clone()) };
                                            let v108: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"partitioning\":{\"kind\":\"partition_id\",\"value\":\"AAAAAA==\"},\"messages\":[{\"id\":0,\"payload\":"); } LIT.with(|lit| lit.clone()) };
                                            let v109: Rc<str> = spiral_json_quote(&*v103);
                                            let v110: Rc<str> = Rc::<str>::from(format!("{}{}", v108, v109));
                                            let v111: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}]}"); } LIT.with(|lit| lit.clone()) };
                                            let v112: Rc<str> = Rc::<str>::from(format!("{}{}", v110, v111));
                                            let v113: Result<ureq::http::Response<ureq::Body>, ureq::Error> = v87.send(&*v112);
                                            let v114: u16 = v113.map(|r| r.status().as_u16()).unwrap_or(0);
                                            let v115: i32 = (v114 as i32);
                                            let v116: Rc<str> = Rc::<str>::from((v115).to_string());
                                            let v117: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("published "); } LIT.with(|lit| lit.clone()) };
                                            let v118: Rc<str> = Rc::<str>::from(format!("{}{}", v117, v116));
                                            v118
                                        } else {
                                            let v119: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("events: bad arguments"); } LIT.with(|lit| lit.clone()) };
                                            v119
                                        }
                                    }
                                }
                            }
                            UH0::UH0_Nil => {
                                let v248: bool = &*v6 == "count";
                                if v248 {
                                    let v249: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_CA_FILE"); } LIT.with(|lit| lit.clone()) };
                                    let v250: Rc<str> = get_environment_variable_6(v249);
                                    let v251: i32 = (v250.clone().len() as i32);
                                    let v252: i32 = 0i32;
                                    let v253: i32 = method7(v250.clone(), v251, v252);
                                    let v254: i32 = v251.wrapping_sub(1i32);
                                    let v255: Rc<str> = string_slice(&v250, v253 as i64, v254 as i64);
                                    let v256: i32 = (v255.clone().len() as i32);
                                    let v257: i32 = method8(v255.clone(), v256);
                                    let v258: Rc<str> = string_slice(&v255, 0i32 as i64, v257 as i64);
                                    let v260: Result<Vec<u8>, std::io::Error> = std::fs::read(&*v258);
                                    let v262: Vec<u8> = v260.unwrap();
                                    let v263: Vec<u8> = method9(v262);
                                    let v265: Result<std::string::String, std::string::FromUtf8Error> = std::string::String::from_utf8(v263);
                                    let v267: std::string::String = v265.unwrap();
                                    let v269: Rc<str> = Rc::<str>::from(String::as_str(&v267));
                                    let v270: ureq::tls::TlsConfig = ureq::tls::TlsConfig::builder().root_certs(ureq::tls::Certificate::from_pem((&*v269).as_bytes()).ok().into()).build();
                                    let mut v271: ureq::Agent = ureq::Agent::config_builder().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(10))).tls_config(v270).build().into();
                                    let v272: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_URL"); } LIT.with(|lit| lit.clone()) };
                                    let v273: Rc<str> = get_environment_variable_6(v272);
                                    let v274: i32 = (v273.clone().len() as i32);
                                    let v275: i32 = 0i32;
                                    let v276: i32 = method7(v273.clone(), v274, v275);
                                    let v277: i32 = v274.wrapping_sub(1i32);
                                    let v278: Rc<str> = string_slice(&v273, v276 as i64, v277 as i64);
                                    let v279: i32 = (v278.clone().len() as i32);
                                    let v280: i32 = method8(v278.clone(), v279);
                                    let v281: Rc<str> = string_slice(&v278, 0i32 as i64, v280 as i64);
                                    let v282: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/users/login"); } LIT.with(|lit| lit.clone()) };
                                    let v283: Rc<str> = Rc::<str>::from(format!("{}{}", v281, v282));
                                    let mut v284: ureq::RequestBuilder<ureq::typestate::WithBody> = v271.post(&*v283).header("Content-Type", "application/json");
                                    let v285: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_USERNAME"); } LIT.with(|lit| lit.clone()) };
                                    let v286: Rc<str> = get_environment_variable_6(v285);
                                    let v287: i32 = (v286.clone().len() as i32);
                                    let v288: i32 = 0i32;
                                    let v289: i32 = method7(v286.clone(), v287, v288);
                                    let v290: i32 = v287.wrapping_sub(1i32);
                                    let v291: Rc<str> = string_slice(&v286, v289 as i64, v290 as i64);
                                    let v292: i32 = (v291.clone().len() as i32);
                                    let v293: i32 = method8(v291.clone(), v292);
                                    let v294: Rc<str> = string_slice(&v291, 0i32 as i64, v293 as i64);
                                    let v295: Rc<str> = spiral_json_quote(&*v294);
                                    let v296: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"username\":"); } LIT.with(|lit| lit.clone()) };
                                    let v297: Rc<str> = Rc::<str>::from(format!("{}{}", v296, v295));
                                    let v298: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"password\":"); } LIT.with(|lit| lit.clone()) };
                                    let v299: Rc<str> = Rc::<str>::from(format!("{}{}", v297, v298));
                                    let v300: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("IGGY_PASSWORD"); } LIT.with(|lit| lit.clone()) };
                                    let v301: Rc<str> = get_environment_variable_6(v300);
                                    let v302: i32 = (v301.clone().len() as i32);
                                    let v303: i32 = 0i32;
                                    let v304: i32 = method7(v301.clone(), v302, v303);
                                    let v305: i32 = v302.wrapping_sub(1i32);
                                    let v306: Rc<str> = string_slice(&v301, v304 as i64, v305 as i64);
                                    let v307: i32 = (v306.clone().len() as i32);
                                    let v308: i32 = method8(v306.clone(), v307);
                                    let v309: Rc<str> = string_slice(&v306, 0i32 as i64, v308 as i64);
                                    let v310: Rc<str> = spiral_json_quote(&*v309);
                                    let v311: Rc<str> = Rc::<str>::from(format!("{}{}", v299, v310));
                                    let v312: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) };
                                    let v313: Rc<str> = Rc::<str>::from(format!("{}{}", v311, v312));
                                    let mut v314: Result<ureq::http::Response<ureq::Body>, ureq::Error> = v284.send(&*v313);
                                    let v315: Rc<str> = Rc::<str>::from(v314.ok().and_then(|mut r| r.body_mut().read_to_string().ok()).unwrap_or_default());
                                    let v316: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v315).unwrap_or_default();
                                    let v317: Rc<str> = Rc::<str>::from(v316["access_token"]["token"].as_str().unwrap_or(""));
                                    let v318: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) };
                                    let v319: Rc<str> = Rc::<str>::from(format!("{}{}", v318, v317));
                                    let v320: i32 = 0i32;
                                    let v321: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                                    let v322: Rc<UH0> = payloads_from_10(v271, v281, v319, v320, v321);
                                    let v323: bool = false;
                                    let v324: bool = method14(v8.clone(), v322.clone(), v323);
                                    let v327: Rc<str> = if v324 {
                                        let v325: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", finished"); } LIT.with(|lit| lit.clone()) };
                                        v325
                                    } else {
                                        let v326: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                                        v326
                                    };
                                    let v328: i32 = 0i32;
                                    let v329: i32 = method15(v8, v322, v328);
                                    let v330: Rc<str> = Rc::<str>::from((v329).to_string());
                                    let v331: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("counted "); } LIT.with(|lit| lit.clone()) };
                                    let v333: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v331, v330)), v327));
                                    v333
                                } else {
                                    let v334: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("events: bad arguments"); } LIT.with(|lit| lit.clone()) };
                                    v334
                                }
                            }
                        }
                    }
                    _ => {
                        let v338: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("events: bad arguments"); } LIT.with(|lit| lit.clone()) };
                        v338
                    }
                }
            }
            _ => {
                let v340: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("events: bad arguments"); } LIT.with(|lit| lit.clone()) };
                v340
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_events(v0: &str) -> Rc<str> {
    closure0()(Rc::<str>::from(v0))
}
