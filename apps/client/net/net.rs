#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<str>, Rc<str>, Rc<UH0>),
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
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<UH1>),
}
impl UH1 {
    fn tag(&self) -> i32 {
        match self {
            UH1::UH1_Nil => 0,
            UH1::UH1_Cons(..) => 1,
        }
    }
}
impl Default for UH1 {
    fn default() -> Self {
        UH1::UH1_Nil
    }
}
fn exchange_0(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>) -> (i32, Rc<str>) {
    let mut v4: bool = v0.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("POST"); } LIT.with(|lit| lit.clone()) };
    let mut v16: (u16, std::rc::Rc<str>) = if v4 {
        let mut v5: ureq::RequestBuilder<ureq::typestate::WithBody> = ureq::post(&*v1).header("Authorization", &*v2).header("Content-Type", "application/json");
        let mut v6: ureq::RequestBuilder<ureq::typestate::WithBody> = v5.config().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(30))).build();
        let mut v7: (u16, std::rc::Rc<str>) = match ureq::RequestBuilder::send(v6, &*v3) { Ok(mut r) => (r.status().as_u16(), Rc::<str>::from(r.body_mut().read_to_string().unwrap_or_default())), Err(e) => (0u16, Rc::<str>::from(e.to_string())) };
        v7.clone()
    } else {
        let mut v8: bool = v0.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("DELETE"); } LIT.with(|lit| lit.clone()) };
        if v8 {
            let mut v9: ureq::RequestBuilder<ureq::typestate::WithoutBody> = ureq::delete(&*v1).header("Authorization", &*v2);
            let mut v10: ureq::RequestBuilder<ureq::typestate::WithoutBody> = v9.config().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(30))).build();
            let mut v11: (u16, std::rc::Rc<str>) = match ureq::RequestBuilder::call(v10) { Ok(mut r) => (r.status().as_u16(), Rc::<str>::from(r.body_mut().read_to_string().unwrap_or_default())), Err(e) => (0u16, Rc::<str>::from(e.to_string())) };
            v11.clone()
        } else {
            let mut v12: ureq::RequestBuilder<ureq::typestate::WithoutBody> = ureq::get(&*v1).header("Authorization", &*v2);
            let mut v13: ureq::RequestBuilder<ureq::typestate::WithoutBody> = v12.config().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(30))).build();
            let mut v14: (u16, std::rc::Rc<str>) = match ureq::RequestBuilder::call(v13) { Ok(mut r) => (r.status().as_u16(), Rc::<str>::from(r.body_mut().read_to_string().unwrap_or_default())), Err(e) => (0u16, Rc::<str>::from(e.to_string())) };
            v14.clone()
        }
    };
    let mut v17: i32 = v16.0 as i32;
    let mut v18: Rc<str> = v16.1.clone();
    (v17, v18.clone())
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>| -> (i32, Rc<str>) {
        exchange_0(v0.clone(), v1.clone(), v2.clone(), v3.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn insert_sorted_3(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<UH0>) -> Rc<UH0> {
    match &*v2 {
        UH0::UH0_Cons(v3, v4, v5) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH0> = v5.clone();
            let mut v6: bool = v3.clone() == v0.clone();
            let mut v7: bool = v6 != true;
            let mut v18: bool = if v7 {
                let mut v8: bool = v3.clone() < v0.clone();
                let mut v11: i32 = if v8 {
                    -1i32
                } else {
                    let mut v9: bool = v3.clone() > v0.clone();
                    if v9 {
                        1i32
                    } else {
                        0i32
                    }
                };
                let mut v12: bool = v11 == -1i32;
                v12
            } else {
                let mut v13: bool = v4.clone() < v1.clone();
                let mut v16: i32 = if v13 {
                    -1i32
                } else {
                    let mut v14: bool = v4.clone() > v1.clone();
                    if v14 {
                        1i32
                    } else {
                        0i32
                    }
                };
                let mut v17: bool = v16 == -1i32;
                v17
            };
            if v18 {
                let mut v19: Rc<UH0> = insert_sorted_3(v0.clone(), v1.clone(), v5.clone());
                Rc::new(UH0::UH0_Cons(v3.clone(), v4.clone(), v19.clone()))
            } else {
                Rc::new(UH0::UH0_Cons(v0.clone(), v1.clone(), v2.clone()))
            }
        }
        _ => {
            Rc::new(UH0::UH0_Cons(v0.clone(), v1.clone(), v2.clone()))
        }
    }
}
fn method4(mut v0: Rc<UH0>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH1> = method4(v4.clone(), v1.clone());
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("="); } LIT.with(|lit| lit.clone()) };
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v6));
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v3));
            Rc::new(UH1::UH1_Cons(v8.clone(), v5.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method5(mut v0: Rc<UH1>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH1::UH1_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH1> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method5(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&"); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH1::UH1_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn oauth_header_2(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>) -> Rc<str> {
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&"); } LIT.with(|lit| lit.clone()) };
    let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v4, v8));
    let mut v10: Rc<str> = Rc::<str>::from(v5.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v10));
    let mut v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v8));
    let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_version"); } LIT.with(|lit| lit.clone()) };
    let mut v14: Rc<str> = Rc::<str>::from(v13.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("1.0"); } LIT.with(|lit| lit.clone()) };
    let mut v16: Rc<str> = Rc::<str>::from(v15.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_token"); } LIT.with(|lit| lit.clone()) };
    let mut v18: Rc<str> = Rc::<str>::from(v17.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v19: Rc<str> = Rc::<str>::from(v2.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_timestamp"); } LIT.with(|lit| lit.clone()) };
    let mut v21: Rc<str> = Rc::<str>::from(v20.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v22: Rc<str> = Rc::<str>::from(v7.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_signature_method"); } LIT.with(|lit| lit.clone()) };
    let mut v24: Rc<str> = Rc::<str>::from(v23.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("HMAC-SHA1"); } LIT.with(|lit| lit.clone()) };
    let mut v26: Rc<str> = Rc::<str>::from(v25.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_nonce"); } LIT.with(|lit| lit.clone()) };
    let mut v28: Rc<str> = Rc::<str>::from(v27.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v29: Rc<str> = Rc::<str>::from(v6.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_consumer_key"); } LIT.with(|lit| lit.clone()) };
    let mut v31: Rc<str> = Rc::<str>::from(v30.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v32: Rc<str> = Rc::<str>::from(v0.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v33: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v34: Rc<UH0> = insert_sorted_3(v31.clone(), v32.clone(), v33.clone());
    let mut v35: Rc<UH0> = insert_sorted_3(v28.clone(), v29.clone(), v34.clone());
    let mut v36: Rc<UH0> = insert_sorted_3(v24.clone(), v26.clone(), v35.clone());
    let mut v37: Rc<UH0> = insert_sorted_3(v21.clone(), v22.clone(), v36.clone());
    let mut v38: Rc<UH0> = insert_sorted_3(v18.clone(), v19.clone(), v37.clone());
    let mut v39: Rc<UH0> = insert_sorted_3(v14.clone(), v16.clone(), v38.clone());
    let mut v40: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v41: Rc<UH1> = method4(v39.clone(), v40.clone());
    let mut v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v43, mut v44): (Rc<str>, Rc<str>) = method5(v41.clone(), v42.clone());
    let mut v45: Rc<str> = Rc::<str>::from(v43.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v46: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v45));
    let mut v47: Rc<str> = Rc::<str>::from(v1.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v48: Rc<str> = Rc::<str>::from(format!("{}{}", v47, v8));
    let mut v49: Rc<str> = Rc::<str>::from(v3.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v50: Rc<str> = Rc::<str>::from(format!("{}{}", v48, v49));
    let mut v51: Vec<u8> = { let mut m = <hmac::Hmac<sha1::Sha1> as hmac::KeyInit>::new_from_slice(v50.as_bytes()).unwrap(); hmac::Mac::update(&mut m, v46.as_bytes()); hmac::Mac::finalize(m).into_bytes().to_vec() };
    let mut v52: Rc<str> = Rc::<str>::from(base64::Engine::encode(&base64::engine::general_purpose::STANDARD, &v51));
    let mut v53: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("oauth_signature"); } LIT.with(|lit| lit.clone()) };
    let mut v54: Rc<str> = Rc::<str>::from(v53.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("=\""); } LIT.with(|lit| lit.clone()) };
    let mut v56: Rc<str> = Rc::<str>::from(format!("{}{}", v54, v55));
    let mut v57: Rc<str> = Rc::<str>::from(v52.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v58: Rc<str> = Rc::<str>::from(format!("{}{}", v56, v57));
    let mut v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\""); } LIT.with(|lit| lit.clone()) };
    let mut v60: Rc<str> = Rc::<str>::from(format!("{}{}", v58, v59));
    let mut v61: Rc<str> = Rc::<str>::from(v13.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v62: Rc<str> = Rc::<str>::from(format!("{}{}", v61, v55));
    let mut v63: Rc<str> = Rc::<str>::from(v15.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v64: Rc<str> = Rc::<str>::from(format!("{}{}", v62, v63));
    let mut v65: Rc<str> = Rc::<str>::from(format!("{}{}", v64, v59));
    let mut v66: Rc<str> = Rc::<str>::from(v17.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v67: Rc<str> = Rc::<str>::from(format!("{}{}", v66, v55));
    let mut v68: Rc<str> = Rc::<str>::from(v2.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v69: Rc<str> = Rc::<str>::from(format!("{}{}", v67, v68));
    let mut v70: Rc<str> = Rc::<str>::from(format!("{}{}", v69, v59));
    let mut v71: Rc<str> = Rc::<str>::from(v20.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v72: Rc<str> = Rc::<str>::from(format!("{}{}", v71, v55));
    let mut v73: Rc<str> = Rc::<str>::from(v7.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v74: Rc<str> = Rc::<str>::from(format!("{}{}", v72, v73));
    let mut v75: Rc<str> = Rc::<str>::from(format!("{}{}", v74, v59));
    let mut v76: Rc<str> = Rc::<str>::from(v23.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v77: Rc<str> = Rc::<str>::from(format!("{}{}", v76, v55));
    let mut v78: Rc<str> = Rc::<str>::from(v25.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v79: Rc<str> = Rc::<str>::from(format!("{}{}", v77, v78));
    let mut v80: Rc<str> = Rc::<str>::from(format!("{}{}", v79, v59));
    let mut v81: Rc<str> = Rc::<str>::from(v27.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v82: Rc<str> = Rc::<str>::from(format!("{}{}", v81, v55));
    let mut v83: Rc<str> = Rc::<str>::from(v6.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v84: Rc<str> = Rc::<str>::from(format!("{}{}", v82, v83));
    let mut v85: Rc<str> = Rc::<str>::from(format!("{}{}", v84, v59));
    let mut v86: Rc<str> = Rc::<str>::from(v30.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v87: Rc<str> = Rc::<str>::from(format!("{}{}", v86, v55));
    let mut v88: Rc<str> = Rc::<str>::from(v0.bytes().map(|b| if b.is_ascii_alphanumeric() || b"-._~".contains(&b) { (b as char).to_string() } else { format!("%{:02X}", b) }).collect::<String>());
    let mut v89: Rc<str> = Rc::<str>::from(format!("{}{}", v87, v88));
    let mut v90: Rc<str> = Rc::<str>::from(format!("{}{}", v89, v59));
    let mut v91: Rc<str> = Rc::<str>::from(format!("{}{}", v60, v42));
    let mut v92: Rc<str> = Rc::<str>::from(format!("{}{}", v91, v42));
    let mut v93: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", "); } LIT.with(|lit| lit.clone()) };
    let mut v94: Rc<str> = Rc::<str>::from(format!("{}{}", v65, v93));
    let mut v95: Rc<str> = Rc::<str>::from(format!("{}{}", v94, v92));
    let mut v96: Rc<str> = Rc::<str>::from(format!("{}{}", v70, v93));
    let mut v97: Rc<str> = Rc::<str>::from(format!("{}{}", v96, v95));
    let mut v98: Rc<str> = Rc::<str>::from(format!("{}{}", v75, v93));
    let mut v99: Rc<str> = Rc::<str>::from(format!("{}{}", v98, v97));
    let mut v100: Rc<str> = Rc::<str>::from(format!("{}{}", v80, v93));
    let mut v101: Rc<str> = Rc::<str>::from(format!("{}{}", v100, v99));
    let mut v102: Rc<str> = Rc::<str>::from(format!("{}{}", v85, v93));
    let mut v103: Rc<str> = Rc::<str>::from(format!("{}{}", v102, v101));
    let mut v104: Rc<str> = Rc::<str>::from(format!("{}{}", v90, v93));
    let mut v105: Rc<str> = Rc::<str>::from(format!("{}{}", v104, v103));
    let mut v106: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("OAuth "); } LIT.with(|lit| lit.clone()) };
    let mut v107: Rc<str> = Rc::<str>::from(format!("{}{}", v106, v105));
    v107.clone()
}
fn signed_header_1(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>) -> Rc<str> {
    oauth_header_2(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone())
}
fn closure1() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>| -> Rc<str> {
        signed_header_1(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure2() -> Rc<dyn Fn() -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn() -> Rc<str>> = Rc::new(move || -> Rc<str> {
        let mut v0: Rc<str> = Rc::<str>::from(format!("{}-{}", std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).unwrap().as_nanos(), std::process::id()));
        let mut v1: Rc<str> = Rc::<str>::from(<sha1::Sha1 as sha1::Digest>::digest(v0.as_bytes()).iter().map(|b| format!("{:02x}", b)).collect::<String>());
        v1.clone()
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure3() -> Rc<dyn Fn() -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn() -> Rc<str>> = Rc::new(move || -> Rc<str> {
        let mut v0: Rc<str> = Rc::<str>::from(std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).unwrap().as_secs().to_string());
        v0.clone()
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure4() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        let mut v1: Option<jiff::Timestamp> = v0.parse::<jiff::Timestamp>().ok();
        let mut v2: Rc<str> = v1.map_or(v0.clone(), |x| Rc::<str>::from(x.to_zoned(jiff::tz::TimeZone::system()).strftime("%Y-%m-%d %H:%M").to_string()));
        v2.clone()
    }); } CLOSURE.with(|closure| closure.clone())
}
fn closure5() -> Rc<dyn Fn(Rc<str>) -> Rc<str>> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> Rc<str>> = Rc::new(move |mut v0: Rc<str>| -> Rc<str> {
        let mut v1: Option<jiff::Zoned> = v0.parse::<jiff::civil::Date>().ok().and_then(|d| d.to_zoned(jiff::tz::TimeZone::system()).ok());
        let mut v2: Rc<str> = v1.map_or({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, |x| Rc::<str>::from(x.timestamp().strftime("%Y-%m-%dT%H:%M:%SZ").to_string()));
        v2.clone()
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_send(v0: &str, v1: &str, v2: &str, v3: &str) -> (i32, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), Rc::<str>::from(v3))
}
pub fn xc_oauth1_header(v0: &str, v1: &str, v2: &str, v3: &str, v4: &str, v5: &str, v6: &str, v7: &str) -> Rc<str> {
    closure1()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), Rc::<str>::from(v3), Rc::<str>::from(v4), Rc::<str>::from(v5), Rc::<str>::from(v6), Rc::<str>::from(v7))
}
pub fn xc_fresh_nonce() -> Rc<str> {
    closure2()()
}
pub fn xc_unix_seconds() -> Rc<str> {
    closure3()()
}
pub fn xc_local_minute(v0: &str) -> Rc<str> {
    closure4()(Rc::<str>::from(v0))
}
pub fn xc_local_midnight(v0: &str) -> Rc<str> {
    closure5()(Rc::<str>::from(v0))
}
