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
enum US0 {
    US0_BearerToken(Rc<str>),
    US0_Signed(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>),
}
#[derive(Clone)]
enum US1 {
    US1_CreatePost(Rc<str>),
}
#[derive(Clone)]
enum US3 {
    US3_HttpStatus(i32, Rc<str>, Rc<str>),
    US3_Transport(Rc<str>, Rc<str>),
    US3_Undecodable(Rc<str>, Rc<str>),
    US3_NoSuchAccount(Rc<str>),
}
#[derive(Clone)]
enum US2 {
    US2_Ok(Rc<str>, Rc<str>),
    US2_Error(US3),
}
#[derive(Clone)]
enum US4 {
    US4_Read,
    US4_Write(Rc<str>),
    US4_Remove,
}
#[derive(Clone)]
enum US5 {
    US5_Ok(serde_json::Value, Rc<str>),
    US5_Error(US3),
}
#[derive(Clone)]
enum US6 {
    US6_Ok(serde_json::Value),
    US6_Error(US3),
}
#[derive(Clone)]
enum US7 {
    US7_DeletePost(Rc<str>),
}
#[derive(Clone)]
enum US8 {
    US8_Ok(bool),
    US8_Error(US3),
}
fn raw_reply_2(mut v0: Rc<str>, mut v1: US0, mut v2: US4, mut v3: Rc<str>) -> US5 {
    let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v3));
    let mut v11: Rc<str> = match &v2 {
        US4::US4_Read => {
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("GET"); } LIT.with(|lit| lit.clone()) };
            v5.clone()
        }
        US4::US4_Remove => {
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("DELETE"); } LIT.with(|lit| lit.clone()) };
            v8.clone()
        }
        US4::US4_Write(v6) => {
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("POST"); } LIT.with(|lit| lit.clone()) };
            v7.clone()
        }
    };
    let mut v23: Rc<str> = match &v1 {
        US0::US0_BearerToken(v12) => {
            let mut v12: Rc<str> = v12.clone();
            let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) };
            let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v12));
            v14.clone()
        }
        US0::US0_Signed(v15, v16, v17, v18, v19, v20) => {
            let mut v15: Rc<str> = v15.clone();
            let mut v16: Rc<str> = v16.clone();
            let mut v17: Rc<str> = v17.clone();
            let mut v18: Rc<str> = v18.clone();
            let mut v19: Rc<str> = v19.clone();
            let mut v20: Rc<str> = v20.clone();
            let mut v21: Rc<str> = xc_net::xc_oauth1_header(&*v15, &*v16, &*v17, &*v18, &*v11, &*v4, &*v19, &*v20);
            v21.clone()
        }
    };
    let mut v26: Rc<str> = match &v2 {
        US4::US4_Write(v24) => {
            let mut v24: Rc<str> = v24.clone();
            v24.clone()
        }
        _ => {
            let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v25.clone()
        }
    };
    let (mut v27, mut v28): (i32, Rc<str>) = xc_net::xc_send(&*v11, &*v4, &*v23, &*v26);
    let mut v29: bool = v27 == 0i32;
    let mut v89: US6 = if v29 {
        let mut v30: US3 = US3::US3_Transport(v3.clone(), v28.clone());
        US6::US6_Error(v30.clone())
    } else {
        let mut v32: bool = v27 >= 200i32;
        let mut v34: bool = if v32 {
            let mut v33: bool = v27 < 300i32;
            v33
        } else {
            false
        };
        let mut v35: bool = v34 == false;
        if v35 {
            let mut v36: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v28).unwrap_or_default();
            let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
            let mut v38: serde_json::Value = v36.get(&*v37).cloned().unwrap_or_default();
            let mut v39: Rc<str> = Rc::<str>::from(v38.as_str().unwrap_or(""));
            let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
            let mut v41: serde_json::Value = v36.get(&*v40).cloned().unwrap_or_default();
            let mut v42: Rc<str> = Rc::<str>::from(v41.as_str().unwrap_or(""));
            let mut v43: bool = v39.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v44: bool = v43 != true;
            let mut v47: bool = if v44 {
                let mut v45: bool = v42.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v46: bool = v45 != true;
                v46
            } else {
                false
            };
            let mut v50: bool = if v47 {
                let mut v48: bool = v39.clone() == v42.clone();
                let mut v49: bool = v48 != true;
                v49
            } else {
                false
            };
            let mut v73: Rc<str> = if v50 {
                let mut v51: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                let mut v52: Rc<str> = Rc::<str>::from(format!("{}{}", v39, v51));
                let mut v53: Rc<str> = Rc::<str>::from(format!("{}{}", v52, v42));
                v53.clone()
            } else {
                let mut v54: bool = v42.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v55: bool = v54 != true;
                if v55 {
                    v42.clone()
                } else {
                    if v44 {
                        v39.clone()
                    } else {
                        let mut v56: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
                        let mut v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
                        let mut v58: Rc<str> = Rc::<str>::from(v28.replace(&*v56, &*v57));
                        let mut v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                        let mut v60: Rc<str> = Rc::<str>::from(v58.replace(&*v59, &*v57));
                        let mut v61: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
                        let mut v62: Rc<str> = Rc::<str>::from(v60.replace(&*v61, &*v57));
                        let mut v63: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
                        let mut v64: Rc<str> = Rc::<str>::from(v62.replace(&*v63, &*v57));
                        let mut v65: i32 = (v64.clone().len() as i32);
                        let mut v66: bool = v65 <= 300i32;
                        if v66 {
                            v64.clone()
                        } else {
                            let mut v67: Rc<str> = string_slice(&v64.clone(), 0i32 as i64, 299i32 as i64);
                            let mut v68: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("..."); } LIT.with(|lit| lit.clone()) };
                            let mut v69: Rc<str> = Rc::<str>::from(format!("{}{}", v67, v68));
                            v69.clone()
                        }
                    }
                }
            };
            let mut v74: US3 = US3::US3_HttpStatus(v27, v3.clone(), v73.clone());
            US6::US6_Error(v74.clone())
        } else {
            let mut v76: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v28).unwrap_or_default();
            let mut v77: bool = v76.is_null();
            if v77 {
                let mut v78: i32 = (v28.clone().len() as i32);
                let mut v79: bool = v78 <= 300i32;
                let mut v83: Rc<str> = if v79 {
                    v28.clone()
                } else {
                    let mut v80: Rc<str> = string_slice(&v28.clone(), 0i32 as i64, 299i32 as i64);
                    let mut v81: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("..."); } LIT.with(|lit| lit.clone()) };
                    let mut v82: Rc<str> = Rc::<str>::from(format!("{}{}", v80, v81));
                    v82.clone()
                };
                let mut v84: US3 = US3::US3_Undecodable(v3.clone(), v83.clone());
                US6::US6_Error(v84.clone())
            } else {
                US6::US6_Ok(v76.clone())
            }
        }
    };
    match &v89 {
        US6::US6_Error(v92) => {
            let mut v92: US3 = v92.clone();
            US5::US5_Error(v92.clone())
        }
        US6::US6_Ok(v90) => {
            let mut v90: serde_json::Value = v90.clone();
            US5::US5_Ok(v90.clone(), v28.clone())
        }
    }
}
fn send_write_1(mut v0: Rc<str>, mut v1: US0, mut v2: US1) -> US2 {
    let mut v6: US4 = match &v2 {
        US1::US1_CreatePost(v3) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = Rc::<str>::from(serde_json::json!({"text": &*v3}).to_string());
            US4::US4_Write(v4.clone())
        }
    };
    let mut v9: Rc<str> = match &v2 {
        US1::US1_CreatePost(v7) => {
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets"); } LIT.with(|lit| lit.clone()) };
            v8.clone()
        }
    };
    let mut v10: US5 = raw_reply_2(v0.clone(), v1.clone(), v6.clone(), v9.clone());
    match &v10 {
        US5::US5_Error(v25) => {
            let mut v25: US3 = v25.clone();
            US2::US2_Error(v25.clone())
        }
        US5::US5_Ok(v11, v12) => {
            let mut v11: serde_json::Value = v11.clone();
            let mut v12: Rc<str> = v12.clone();
            let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v14: serde_json::Value = v11.get(&*v13).cloned().unwrap_or_default();
            let (mut v22, mut v23): (Rc<str>, Rc<str>) = match &v2 {
                US1::US1_CreatePost(v15) => {
                    let mut v15: Rc<str> = v15.clone();
                    let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
                    let mut v17: serde_json::Value = v14.get(&*v16).cloned().unwrap_or_default();
                    let mut v18: Rc<str> = Rc::<str>::from(v17.as_str().unwrap_or(""));
                    let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
                    let mut v20: serde_json::Value = v14.get(&*v19).cloned().unwrap_or_default();
                    let mut v21: Rc<str> = Rc::<str>::from(v20.as_str().unwrap_or(""));
                    (v18.clone(), v21.clone())
                }
            };
            US2::US2_Ok(v22.clone(), v23.clone())
        }
    }
}
fn send_write_3(mut v0: Rc<str>, mut v1: US0, mut v2: US7) -> US8 {
    let mut v5: US4 = match &v2 {
        US7::US7_DeletePost(v3) => {
            let mut v3: Rc<str> = v3.clone();
            US4::US4_Remove
        }
    };
    let mut v9: Rc<str> = match &v2 {
        US7::US7_DeletePost(v6) => {
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/"); } LIT.with(|lit| lit.clone()) };
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v6));
            v8.clone()
        }
    };
    let mut v10: US5 = raw_reply_2(v0.clone(), v1.clone(), v5.clone(), v9.clone());
    match &v10 {
        US5::US5_Error(v21) => {
            let mut v21: US3 = v21.clone();
            US8::US8_Error(v21.clone())
        }
        US5::US5_Ok(v11, v12) => {
            let mut v11: serde_json::Value = v11.clone();
            let mut v12: Rc<str> = v12.clone();
            let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v14: serde_json::Value = v11.get(&*v13).cloned().unwrap_or_default();
            let mut v19: bool = match &v2 {
                US7::US7_DeletePost(v15) => {
                    let mut v15: Rc<str> = v15.clone();
                    let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("deleted"); } LIT.with(|lit| lit.clone()) };
                    let mut v17: serde_json::Value = v14.get(&*v16).cloned().unwrap_or_default();
                    let mut v18: bool = v17.as_bool().unwrap_or(false);
                    v18
                }
            };
            US8::US8_Ok(v19)
        }
    }
}
fn write_0(mut v0: Rc<str>, mut v1: US0, mut v2: i32, mut v3: Rc<str>) -> (i32, Rc<str>) {
    let mut v4: bool = v2 == 1i32;
    if v4 {
        let mut v5: US1 = US1::US1_CreatePost(v3.clone());
        let mut v6: US2 = send_write_1(v0.clone(), v1.clone(), v5.clone());
        match &v6 {
            US2::US2_Error(v11) => {
                let mut v11: US3 = v11.clone();
                let mut v44: Rc<str> = match &v11 {
                    US3::US3_HttpStatus(v12, v13, v14) => {
                        let mut v12: i32 = *v12;
                        let mut v13: Rc<str> = v13.clone();
                        let mut v14: Rc<str> = v14.clone();
                        let mut v15: Rc<str> = Rc::<str>::from(format!("{:?}", v12));
                        let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                        let mut v17: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v15));
                        let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                        let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v18));
                        let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v19, v13));
                        let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v22: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v21));
                        let mut v23: Rc<str> = Rc::<str>::from(format!("{}{}", v22, v14));
                        v23.clone()
                    }
                    US3::US3_NoSuchAccount(v38) => {
                        let mut v38: Rc<str> = v38.clone();
                        let mut v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
                        let mut v40: Rc<str> = Rc::<str>::from(format!("{}{}", v39, v38));
                        v40.clone()
                    }
                    US3::US3_Transport(v24, v25) => {
                        let mut v24: Rc<str> = v24.clone();
                        let mut v25: Rc<str> = v25.clone();
                        let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
                        let mut v27: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v24));
                        let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v29: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v28));
                        let mut v30: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v25));
                        v30.clone()
                    }
                    US3::US3_Undecodable(v31, v32) => {
                        let mut v31: Rc<str> = v31.clone();
                        let mut v32: Rc<str> = v32.clone();
                        let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
                        let mut v34: Rc<str> = Rc::<str>::from(format!("{}{}", v33, v31));
                        let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v36: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v35));
                        let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v36, v32));
                        v37.clone()
                    }
                };
                (4i32, v44.clone())
            }
            US2::US2_Ok(v7, v8) => {
                let mut v7: Rc<str> = v7.clone();
                let mut v8: Rc<str> = v8.clone();
                let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posted "); } LIT.with(|lit| lit.clone()) };
                let mut v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v7));
                (0i32, v10.clone())
            }
        }
    } else {
        let mut v49: US7 = US7::US7_DeletePost(v3.clone());
        let mut v50: US8 = send_write_3(v0.clone(), v1.clone(), v49.clone());
        match &v50 {
            US8::US8_Error(v58) => {
                let mut v58: US3 = v58.clone();
                let mut v91: Rc<str> = match &v58 {
                    US3::US3_HttpStatus(v59, v60, v61) => {
                        let mut v59: i32 = *v59;
                        let mut v60: Rc<str> = v60.clone();
                        let mut v61: Rc<str> = v61.clone();
                        let mut v62: Rc<str> = Rc::<str>::from(format!("{:?}", v59));
                        let mut v63: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
                        let mut v64: Rc<str> = Rc::<str>::from(format!("{}{}", v63, v62));
                        let mut v65: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
                        let mut v66: Rc<str> = Rc::<str>::from(format!("{}{}", v64, v65));
                        let mut v67: Rc<str> = Rc::<str>::from(format!("{}{}", v66, v60));
                        let mut v68: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v69: Rc<str> = Rc::<str>::from(format!("{}{}", v67, v68));
                        let mut v70: Rc<str> = Rc::<str>::from(format!("{}{}", v69, v61));
                        v70.clone()
                    }
                    US3::US3_NoSuchAccount(v85) => {
                        let mut v85: Rc<str> = v85.clone();
                        let mut v86: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
                        let mut v87: Rc<str> = Rc::<str>::from(format!("{}{}", v86, v85));
                        v87.clone()
                    }
                    US3::US3_Transport(v71, v72) => {
                        let mut v71: Rc<str> = v71.clone();
                        let mut v72: Rc<str> = v72.clone();
                        let mut v73: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
                        let mut v74: Rc<str> = Rc::<str>::from(format!("{}{}", v73, v71));
                        let mut v75: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v76: Rc<str> = Rc::<str>::from(format!("{}{}", v74, v75));
                        let mut v77: Rc<str> = Rc::<str>::from(format!("{}{}", v76, v72));
                        v77.clone()
                    }
                    US3::US3_Undecodable(v78, v79) => {
                        let mut v78: Rc<str> = v78.clone();
                        let mut v79: Rc<str> = v79.clone();
                        let mut v80: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
                        let mut v81: Rc<str> = Rc::<str>::from(format!("{}{}", v80, v78));
                        let mut v82: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                        let mut v83: Rc<str> = Rc::<str>::from(format!("{}{}", v81, v82));
                        let mut v84: Rc<str> = Rc::<str>::from(format!("{}{}", v83, v79));
                        v84.clone()
                    }
                };
                (4i32, v91.clone())
            }
            US8::US8_Ok(v51) => {
                let mut v51: bool = *v51;
                if v51 {
                    let mut v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("deleted "); } LIT.with(|lit| lit.clone()) };
                    let mut v53: Rc<str> = Rc::<str>::from(format!("{}{}", v52, v3));
                    (0i32, v53.clone())
                } else {
                    let mut v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not deleted "); } LIT.with(|lit| lit.clone()) };
                    let mut v55: Rc<str> = Rc::<str>::from(format!("{}{}", v54, v3));
                    (4i32, v55.clone())
                }
            }
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, Rc<str>) -> (i32, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, i32, Rc<str>) -> (i32, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: i32, mut v9: Rc<str>| -> (i32, Rc<str>) {
        let mut v10: bool = v1.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
        let mut v11: bool = v10 != true;
        let (mut v26, mut v27): (Rc<str>, US0) = if v11 {
            let mut v12: i32 = (v0.clone().len() as i32);
            let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
            let mut v14: bool = v0.ends_with(&*v13);
            let mut v17: Rc<str> = if v14 {
                let mut v15: i32 = v12.wrapping_sub(2i32);
                let mut v16: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v15 as i64);
                v16.clone()
            } else {
                v0.clone()
            };
            let mut v18: US0 = US0::US0_BearerToken(v1.clone());
            (v17.clone(), v18.clone())
        } else {
            let mut v19: i32 = (v0.clone().len() as i32);
            let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
            let mut v21: bool = v0.ends_with(&*v20);
            let mut v24: Rc<str> = if v21 {
                let mut v22: i32 = v19.wrapping_sub(2i32);
                let mut v23: Rc<str> = string_slice(&v0.clone(), 0i32 as i64, v22 as i64);
                v23.clone()
            } else {
                v0.clone()
            };
            let mut v25: US0 = US0::US0_Signed(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone());
            (v24.clone(), v25.clone())
        };
        write_0(v26.clone(), v27.clone(), v8, v9.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_write(v0: &str, v1: &str, v2: &str, v3: &str, v4: &str, v5: &str, v6: &str, v7: &str, v8: i32, v9: &str) -> (i32, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2), Rc::<str>::from(v3), Rc::<str>::from(v4), Rc::<str>::from(v5), Rc::<str>::from(v6), Rc::<str>::from(v7), v8, Rc::<str>::from(v9))
}
