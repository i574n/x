#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
#[derive(Clone)]
enum US0 {
    US0_OnX,
    US0_OnMastodon,
    US0_OnBluesky(Rc<str>, Rc<str>),
}
#[derive(Clone)]
enum US3 {
    US3_CursorRepeated(Rc<str>, i32),
    US3_CursorBudget(Rc<str>, i32),
}
#[derive(Clone)]
enum US2 {
    US2_Reported(Rc<str>),
    US2_NoSuchAccount(Rc<str>),
    US2_CursorHalted(Rc<str>, US3),
}
#[derive(Clone)]
enum US1 {
    US1_Ok(serde_json::Value, Rc<str>),
    US1_Error(US2),
}
#[derive(Clone)]
enum US4 {
    US4_BearerToken(Rc<str>),
    US4_Signed(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>),
    US4_Anonymous,
}
#[derive(Clone)]
enum US5 {
    US5_Fresh(Rc<str>),
    US5_Answer(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>),
    US5_Removal(Rc<str>),
}
#[derive(Clone)]
enum US6 {
    US6_Read,
    US6_Write(Rc<str>),
    US6_Remove,
}
#[derive(Clone)]
enum US7 {
    US7_BearerToken(Rc<str>),
    US7_Anonymous,
}
fn iso_of_1(mut v0: i32) -> Rc<str> {
    let v1: i32 = v0.wrapping_div(86400i32);
    let v2: i64 = (v1 as i64);
    let v3: i64 = v2.wrapping_add(719468i64);
    let v4: i64 = v3.wrapping_div(146097i64);
    let mut v5: i64 = v3.wrapping_rem(146097i64);
    let v6: bool = v5 != 0i64;
    let v8: bool = if v6 {
        let v7: bool = v3 < 0i64;
        v7
    } else {
        false
    };
    let v10: i64 = if v8 {
        let v9: i64 = v4.wrapping_sub(1i64);
        v9
    } else {
        v4
    };
    let v11: i64 = v10.wrapping_mul(146097i64);
    let v12: i64 = v3.wrapping_sub(v11);
    let v13: i64 = v12.wrapping_div(1460i64);
    let v14: i64 = v12.wrapping_sub(v13);
    let v15: i64 = v12.wrapping_div(36524i64);
    let v16: i64 = v14.wrapping_add(v15);
    let v17: i64 = v12.wrapping_div(146096i64);
    let v18: i64 = v16.wrapping_sub(v17);
    let v19: i64 = v18.wrapping_div(365i64);
    let v20: i64 = 365i64.wrapping_mul(v19);
    let v21: i64 = v19.wrapping_div(4i64);
    let v22: i64 = v20.wrapping_add(v21);
    let v23: i64 = v19.wrapping_div(100i64);
    let v24: i64 = v22.wrapping_sub(v23);
    let v25: i64 = v12.wrapping_sub(v24);
    let v26: i64 = 5i64.wrapping_mul(v25);
    let v27: i64 = v26.wrapping_add(2i64);
    let v28: i64 = v27.wrapping_div(153i64);
    let v29: bool = v28 < 10i64;
    let v32: i64 = if v29 {
        let v30: i64 = v28.wrapping_add(3i64);
        v30
    } else {
        let v31: i64 = v28.wrapping_sub(9i64);
        v31
    };
    let v33: i64 = 153i64.wrapping_mul(v28);
    let v34: i64 = v33.wrapping_add(2i64);
    let v35: i64 = v34.wrapping_div(5i64);
    let v36: i64 = v25.wrapping_sub(v35);
    let v37: i64 = v36.wrapping_add(1i64);
    let v38: i64 = v10.wrapping_mul(400i64);
    let v39: i64 = v19.wrapping_add(v38);
    let v40: bool = v32 <= 2i64;
    let v41: i64 = if v40 {
        1i64
    } else {
        0i64
    };
    let v42: i64 = v39.wrapping_add(v41);
    let v43: i32 = (v42 as i32);
    let v44: i32 = (v32 as i32);
    let v45: i32 = (v37 as i32);
    let v46: Rc<str> = Rc::<str>::from((v43).to_string());
    let v47: Rc<str> = Rc::<str>::from(format!("{}{}", v46, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("-"); } LIT.with(|lit| lit.clone()) }));
    let v48: bool = v44 < 10i32;
    let v52: Rc<str> = if v48 {
        let v49: Rc<str> = Rc::<str>::from((v44).to_string());
        let v50: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0"); } LIT.with(|lit| lit.clone()) }, v49));
        v50
    } else {
        let v51: Rc<str> = Rc::<str>::from((v44).to_string());
        v51
    };
    let v53: Rc<str> = Rc::<str>::from(format!("{}{}", v47, v52));
    let v54: Rc<str> = Rc::<str>::from(format!("{}{}", v53, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("-"); } LIT.with(|lit| lit.clone()) }));
    let v55: bool = v45 < 10i32;
    let mut v59: Rc<str> = if v55 {
        let v56: Rc<str> = Rc::<str>::from((v45).to_string());
        let v57: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0"); } LIT.with(|lit| lit.clone()) }, v56));
        v57
    } else {
        let v58: Rc<str> = Rc::<str>::from((v45).to_string());
        v58
    };
    let v60: Rc<str> = Rc::<str>::from(format!("{}{}", v54, v59));
    let v61: Rc<str> = Rc::<str>::from(format!("{}{}", v60, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("T"); } LIT.with(|lit| lit.clone()) }));
    let v62: i32 = v0.wrapping_rem(86400i32);
    let mut v63: i32 = v62.wrapping_div(3600i32);
    let mut v64: bool = v63 < 10i32;
    let v68: Rc<str> = if v64 {
        let v65: Rc<str> = Rc::<str>::from((v63).to_string());
        let v66: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0"); } LIT.with(|lit| lit.clone()) }, v65));
        v66
    } else {
        let v67: Rc<str> = Rc::<str>::from((v63).to_string());
        v67
    };
    let v69: Rc<str> = Rc::<str>::from(format!("{}{}", v68, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) }));
    let v70: i32 = v62.wrapping_rem(3600i32);
    let v71: i32 = v70.wrapping_div(60i32);
    let v72: bool = v71 < 10i32;
    let v76: Rc<str> = if v72 {
        let v73: Rc<str> = Rc::<str>::from((v71).to_string());
        let v74: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0"); } LIT.with(|lit| lit.clone()) }, v73));
        v74
    } else {
        let v75: Rc<str> = Rc::<str>::from((v71).to_string());
        v75
    };
    let v77: Rc<str> = Rc::<str>::from(format!("{}{}", v69, v76));
    let v78: Rc<str> = Rc::<str>::from(format!("{}{}", v77, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) }));
    let v79: i32 = v62.wrapping_rem(60i32);
    let v80: bool = v79 < 10i32;
    let v84: Rc<str> = if v80 {
        let v81: Rc<str> = Rc::<str>::from((v79).to_string());
        let v82: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0"); } LIT.with(|lit| lit.clone()) }, v81));
        v82
    } else {
        let v83: Rc<str> = Rc::<str>::from((v79).to_string());
        v83
    };
    let v85: Rc<str> = Rc::<str>::from(format!("{}{}", v78, v84));
    let v86: Rc<str> = Rc::<str>::from(format!("{}{}", v61, v85));
    let v87: Rc<str> = Rc::<str>::from(format!("{}{}", v86, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Z"); } LIT.with(|lit| lit.clone()) }));
    v87
}
fn method3(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure1() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn outgoing_verb_2(mut v0: US0, mut v1: US5) -> US6 {
    match v0 {
        US0::US0_OnBluesky(v36, v37) => {
            let v36: Rc<str> = v36;
            let v37: Rc<str> = v37;
            match v1 {
                US5::US5_Answer(v44, v45, v46, v47, v48, v49, v50) => {
                    let v44: Rc<str> = v44;
                    let v45: Rc<str> = v45;
                    let v46: Rc<str> = v46;
                    let v47: Rc<str> = v47;
                    let v48: Rc<str> = v48;
                    let v49: Rc<str> = v49;
                    let v50: Rc<str> = v50;
                    let v51: serde_json::Value = serde_json::json!({"uri": &*v45, "cid": &*v47});
                    let v52: serde_json::Value = serde_json::json!({"uri": &*v48, "cid": &*v50});
                    let v53: serde_json::Value = serde_json::json!({"root": v51, "parent": v52});
                    let v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("$type"); } LIT.with(|lit| lit.clone()) };
                    let v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("app.bsky.feed.post"); } LIT.with(|lit| lit.clone()) };
                    let v56: serde_json::Value = serde_json::json!({(&*v54): &*v55, "text": &*v44, "createdAt": &*v37, "reply": v53});
                    let v57: Rc<str> = Rc::<str>::from(serde_json::json!({"repo": &*v36, "collection": &*v55, "record": v56}).to_string());
                    US6::US6_Write(v57)
                }
                US5::US5_Fresh(v38) => {
                    let v38: Rc<str> = v38;
                    let v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("$type"); } LIT.with(|lit| lit.clone()) };
                    let v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("app.bsky.feed.post"); } LIT.with(|lit| lit.clone()) };
                    let v41: serde_json::Value = serde_json::json!({(&*v39): &*v40, "text": &*v38, "createdAt": &*v37});
                    let v42: Rc<str> = Rc::<str>::from(serde_json::json!({"repo": &*v36, "collection": &*v40, "record": v41}).to_string());
                    US6::US6_Write(v42)
                }
                US5::US5_Removal(v59) => {
                    let mut v59: Rc<str> = v59;
                    let v60: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
                    let v61: Option<usize> = v59.rfind(&*v60);
                    let v62: Option<usize> = method3(v61);
                    let mut v63: Rc<dyn Fn((usize)) -> i32> = closure1();
                    let mut v64: Option<i32> = v62.map(|x| v63(x));
                    let v66: i32 = v64.unwrap_or(-1i32);
                    let v67: i32 = v66.wrapping_add(1i32);
                    let v68: i32 = (v59.clone().len() as i32);
                    let v69: i32 = v68.wrapping_sub(v67);
                    let v70: usize = ((v67) as usize);
                    let v71: i32 = v67.wrapping_add(v69);
                    let v72: usize = ((v71) as usize);
                    let v73: Rc<str> = Rc::<str>::from(&(v59)[v70..v72]);
                    let v74: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("app.bsky.feed.post"); } LIT.with(|lit| lit.clone()) };
                    let v75: Rc<str> = Rc::<str>::from(serde_json::json!({"repo": &*v36, "collection": &*v74, "rkey": &*v73}).to_string());
                    US6::US6_Write(v75)
                }
            }
        }
        US0::US0_OnMastodon => {
            match v1 {
                US5::US5_Answer(v22, v23, v24, v25, v26, v27, v28) => {
                    let v22: Rc<str> = v22;
                    let v23: Rc<str> = v23;
                    let v24: Rc<str> = v24;
                    let v25: Rc<str> = v25;
                    let v26: Rc<str> = v26;
                    let v27: Rc<str> = v27;
                    let v28: Rc<str> = v28;
                    let v29: Rc<str> = Rc::<str>::from(serde_json::json!({"status": &*v22, "in_reply_to_id": &*v26}).to_string());
                    US6::US6_Write(v29)
                }
                US5::US5_Fresh(v19) => {
                    let v19: Rc<str> = v19;
                    let v20: Rc<str> = Rc::<str>::from(serde_json::json!({"status": &*v19}).to_string());
                    US6::US6_Write(v20)
                }
                US5::US5_Removal(v31) => {
                    let v31: Rc<str> = v31;
                    US6::US6_Remove
                }
            }
        }
        US0::US0_OnX => {
            match v1 {
                US5::US5_Answer(v5, v6, v7, v8, v9, v10, v11) => {
                    let mut v5: Rc<str> = v5;
                    let v6: Rc<str> = v6;
                    let v7: Rc<str> = v7;
                    let v8: Rc<str> = v8;
                    let v9: Rc<str> = v9;
                    let v10: Rc<str> = v10;
                    let v11: Rc<str> = v11;
                    let v12: Rc<str> = Rc::<str>::from(serde_json::json!({"text": &*v5, "reply": {"in_reply_to_tweet_id": &*v9}}).to_string());
                    US6::US6_Write(v12)
                }
                US5::US5_Fresh(v2) => {
                    let v2: Rc<str> = v2;
                    let v3: Rc<str> = Rc::<str>::from(serde_json::json!({"text": &*v2}).to_string());
                    US6::US6_Write(v3)
                }
                US5::US5_Removal(v14) => {
                    let v14: Rc<str> = v14;
                    US6::US6_Remove
                }
            }
        }
    }
}
fn outgoing_path_4(mut v0: US0, mut v1: US5) -> Rc<str> {
    match v0 {
        US0::US0_OnBluesky(v10, v11) => {
            let v10: Rc<str> = v10;
            let v11: Rc<str> = v11;
            match v1 {
                US5::US5_Removal(v12) => {
                    let v12: Rc<str> = v12;
                    let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/xrpc/com.atproto.repo.deleteRecord"); } LIT.with(|lit| lit.clone()) };
                    v13
                }
                _ => {
                    let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/xrpc/com.atproto.repo.createRecord"); } LIT.with(|lit| lit.clone()) };
                    v14
                }
            }
        }
        US0::US0_OnMastodon => {
            match v1 {
                US5::US5_Removal(v6) => {
                    let v6: Rc<str> = v6;
                    let v7: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/api/v1/statuses/"); } LIT.with(|lit| lit.clone()) }, v6));
                    v7
                }
                _ => {
                    let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/api/v1/statuses"); } LIT.with(|lit| lit.clone()) };
                    v8
                }
            }
        }
        US0::US0_OnX => {
            match v1 {
                US5::US5_Removal(v2) => {
                    let v2: Rc<str> = v2;
                    let v3: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/"); } LIT.with(|lit| lit.clone()) }, v2));
                    v3
                }
                _ => {
                    let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets"); } LIT.with(|lit| lit.clone()) };
                    v4
                }
            }
        }
    }
}
fn raw_reply_5(mut v0: Rc<str>, mut v1: US4, mut v2: US6, mut v3: Rc<str>) -> US1 {
    let v4: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v3.clone()));
    let v11: Rc<str> = match &v2 {
        US6::US6_Read => {
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("GET"); } LIT.with(|lit| lit.clone()) };
            v5
        }
        US6::US6_Remove => {
            let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("DELETE"); } LIT.with(|lit| lit.clone()) };
            v8
        }
        US6::US6_Write(v6) => {
            let v6: Rc<str> = v6.clone();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("POST"); } LIT.with(|lit| lit.clone()) };
            v7
        }
    };
    let v24: Rc<str> = match v1 {
        US4::US4_Anonymous => {
            let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v21
        }
        US4::US4_BearerToken(v12) => {
            let v12: Rc<str> = v12;
            let v13: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) }, v12));
            v13
        }
        US4::US4_Signed(v14, v15, v16, v17, v18, v19) => {
            let v14: Rc<str> = v14;
            let v15: Rc<str> = v15;
            let v16: Rc<str> = v16;
            let v17: Rc<str> = v17;
            let v18: Rc<str> = v18;
            let v19: Rc<str> = v19;
            let v20: Rc<str> = xc_net::xc_oauth1_header(&*v14, &*v15, &*v16, &*v17, &*v11, &*v4, &*v18, &*v19);
            v20
        }
    };
    let v27: Rc<str> = match v2 {
        US6::US6_Write(v25) => {
            let v25: Rc<str> = v25;
            v25
        }
        _ => {
            let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v26
        }
    };
    let (mut v28, mut v29): (i32, Rc<str>) = xc_net::xc_send(&*v11, &*v4, &*v24, &*v27);
    let (mut v30, mut v31): (i32, Rc<str>) = xc_api::xc_classified(&*v3, v28, &*v29);
    let v32: bool = v30 == 0i32;
    if v32 {
        let v33: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v31).unwrap_or_default();
        US1::US1_Ok(v33, v31)
    } else {
        let v35: US2 = US2::US2_Reported(v31);
        US1::US1_Error(v35)
    }
}
fn answered_on_0(mut v0: Rc<str>, mut v1: Rc<str>) -> (US0, US1) {
    let v2: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v0).unwrap_or_default();
    let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("who"); } LIT.with(|lit| lit.clone()) };
    let v4: serde_json::Value = v2.get(&*v3).cloned().unwrap_or_default();
    let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("clock"); } LIT.with(|lit| lit.clone()) };
    let v6: serde_json::Value = v2.get(&*v5).cloned().unwrap_or_default();
    let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("name"); } LIT.with(|lit| lit.clone()) };
    let v8: serde_json::Value = v4.get(&*v7).cloned().unwrap_or_default();
    let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
    let v10: bool = &*v9 == "bluesky";
    let (mut v92, mut v93, mut v94): (US0, Rc<str>, US4) = if v10 {
        let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("repo"); } LIT.with(|lit| lit.clone()) };
        let v12: serde_json::Value = v4.get(&*v11).cloned().unwrap_or_default();
        let v13: Rc<str> = Rc::<str>::from(v12.as_str().unwrap_or(""));
        let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("seconds"); } LIT.with(|lit| lit.clone()) };
        let v15: serde_json::Value = v6.get(&*v14).cloned().unwrap_or_default();
        let v16: Rc<str> = Rc::<str>::from(v15.as_str().unwrap_or(""));
        let v17: i32 = i32::from_str_radix(&*(v16), 10u32).unwrap();
        let v18: Rc<str> = iso_of_1(v17);
        let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("base"); } LIT.with(|lit| lit.clone()) };
        let v20: serde_json::Value = v4.get(&*v19).cloned().unwrap_or_default();
        let v21: Rc<str> = Rc::<str>::from(v20.as_str().unwrap_or(""));
        let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("token"); } LIT.with(|lit| lit.clone()) };
        let v23: serde_json::Value = v4.get(&*v22).cloned().unwrap_or_default();
        let v24: Rc<str> = Rc::<str>::from(v23.as_str().unwrap_or(""));
        let v25: i32 = (v21.clone().len() as i32);
        let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
        let v27: bool = v21.ends_with(&*v26);
        let v32: Rc<str> = if v27 {
            let v28: i32 = v25.wrapping_sub(1i32);
            let v29: usize = ((0i32) as usize);
            let v30: usize = ((v28) as usize);
            let v31: Rc<str> = Rc::<str>::from(&(v21)[v29..v30]);
            v31
        } else {
            v21
        };
        let v33: US0 = US0::US0_OnBluesky(v13, v18);
        let v34: US4 = US4::US4_BearerToken(v24);
        (v33, v32, v34)
    } else {
        let v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("keys"); } LIT.with(|lit| lit.clone()) };
        let v36: serde_json::Value = v2.get(&*v35).cloned().unwrap_or_default();
        let v37: serde_json::Value = v4.get(&*v7).cloned().unwrap_or_default();
        let v38: Rc<str> = Rc::<str>::from(v37.as_str().unwrap_or(""));
        let v39: bool = &*v38 == "mastodon";
        let v46: US0 = if v39 {
            US0::US0_OnMastodon
        } else {
            let v41: bool = &*v38 == "bluesky";
            if v41 {
                let v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                US0::US0_OnBluesky(v42.clone(), v42)
            } else {
                US0::US0_OnX
            }
        };
        let v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("base"); } LIT.with(|lit| lit.clone()) };
        let v48: serde_json::Value = v4.get(&*v47).cloned().unwrap_or_default();
        let v49: Rc<str> = Rc::<str>::from(v48.as_str().unwrap_or(""));
        let v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("token"); } LIT.with(|lit| lit.clone()) };
        let v51: serde_json::Value = v4.get(&*v50).cloned().unwrap_or_default();
        let v52: Rc<str> = Rc::<str>::from(v51.as_str().unwrap_or(""));
        let v53: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("nonce"); } LIT.with(|lit| lit.clone()) };
        let v54: serde_json::Value = v6.get(&*v53).cloned().unwrap_or_default();
        let v55: Rc<str> = Rc::<str>::from(v54.as_str().unwrap_or(""));
        let v56: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("stamp"); } LIT.with(|lit| lit.clone()) };
        let v57: serde_json::Value = v6.get(&*v56).cloned().unwrap_or_default();
        let v58: Rc<str> = Rc::<str>::from(v57.as_str().unwrap_or(""));
        let mut v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("ck"); } LIT.with(|lit| lit.clone()) };
        let v60: serde_json::Value = v36.get(&*v59).cloned().unwrap_or_default();
        let v61: Rc<str> = Rc::<str>::from(v60.as_str().unwrap_or(""));
        let v62: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cs"); } LIT.with(|lit| lit.clone()) };
        let mut v63: serde_json::Value = v36.get(&*v62).cloned().unwrap_or_default();
        let mut v64: Rc<str> = Rc::<str>::from(v63.as_str().unwrap_or(""));
        let v65: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("t"); } LIT.with(|lit| lit.clone()) };
        let v66: serde_json::Value = v36.get(&*v65).cloned().unwrap_or_default();
        let v67: Rc<str> = Rc::<str>::from(v66.as_str().unwrap_or(""));
        let v68: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("ts"); } LIT.with(|lit| lit.clone()) };
        let v69: serde_json::Value = v36.get(&*v68).cloned().unwrap_or_default();
        let v70: Rc<str> = Rc::<str>::from(v69.as_str().unwrap_or(""));
        let v71: bool = &*v52 != "";
        let (mut v90, mut v91): (Rc<str>, US4) = if v71 {
            let v72: i32 = (v49.clone().len() as i32);
            let v73: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
            let v74: bool = v49.ends_with(&*v73);
            let v79: Rc<str> = if v74 {
                let v75: i32 = v72.wrapping_sub(1i32);
                let v76: usize = ((0i32) as usize);
                let v77: usize = ((v75) as usize);
                let v78: Rc<str> = Rc::<str>::from(&(v49)[v76..v77]);
                v78
            } else {
                v49
            };
            let v80: US4 = US4::US4_BearerToken(v52);
            (v79, v80)
        } else {
            let v81: i32 = (v49.clone().len() as i32);
            let v82: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
            let v83: bool = v49.ends_with(&*v82);
            let v88: Rc<str> = if v83 {
                let v84: i32 = v81.wrapping_sub(1i32);
                let v85: usize = ((0i32) as usize);
                let v86: usize = ((v84) as usize);
                let v87: Rc<str> = Rc::<str>::from(&(v49)[v85..v86]);
                v87
            } else {
                v49
            };
            let v89: US4 = US4::US4_Signed(v61, v64, v67, v70, v55, v58);
            (v88, v89)
        };
        (v46, v90, v91)
    };
    let v95: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v1).unwrap_or_default();
    let v96: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("kind"); } LIT.with(|lit| lit.clone()) };
    let v97: serde_json::Value = v95.get(&*v96).cloned().unwrap_or_default();
    let v98: Rc<str> = Rc::<str>::from(v97.as_str().unwrap_or(""));
    let v99: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
    let v100: serde_json::Value = v95.get(&*v99).cloned().unwrap_or_default();
    let v101: Rc<str> = Rc::<str>::from(v100.as_str().unwrap_or(""));
    let v102: bool = &*v98 == "removal";
    let v123: US5 = if v102 {
        US5::US5_Removal(v101)
    } else {
        let v104: bool = &*v98 == "answer";
        if v104 {
            let v105: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("root"); } LIT.with(|lit| lit.clone()) };
            let v106: serde_json::Value = v95.get(&*v105).cloned().unwrap_or_default();
            let v107: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let v108: serde_json::Value = v106.get(&*v107).cloned().unwrap_or_default();
            let v109: Rc<str> = Rc::<str>::from(v108.as_str().unwrap_or(""));
            let v110: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cid"); } LIT.with(|lit| lit.clone()) };
            let v111: serde_json::Value = v106.get(&*v110).cloned().unwrap_or_default();
            let v112: Rc<str> = Rc::<str>::from(v111.as_str().unwrap_or(""));
            let v113: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("parent"); } LIT.with(|lit| lit.clone()) };
            let v114: serde_json::Value = v95.get(&*v113).cloned().unwrap_or_default();
            let v115: serde_json::Value = v114.get(&*v107).cloned().unwrap_or_default();
            let v116: Rc<str> = Rc::<str>::from(v115.as_str().unwrap_or(""));
            let v117: serde_json::Value = v114.get(&*v110).cloned().unwrap_or_default();
            let v118: Rc<str> = Rc::<str>::from(v117.as_str().unwrap_or(""));
            let v119: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            US5::US5_Answer(v101, v109, v119.clone(), v112, v116, v119, v118)
        } else {
            US5::US5_Fresh(v101)
        }
    };
    let v124: US6 = outgoing_verb_2(v92.clone(), v123.clone());
    let v125: Rc<str> = outgoing_path_4(v92.clone(), v123);
    let v126: US1 = raw_reply_5(v93, v94, v124, v125);
    (v92, v126)
}
fn describe_failure_6(mut v0: US2) -> Rc<str> {
    match v0 {
        US2::US2_CursorHalted(v4, v5) => {
            let v4: Rc<str> = v4;
            let mut v5: US3 = v5;
            let v6: Rc<str> = Rc::<str>::from(format!("{}{}", v4, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) }));
            let v21: Rc<str> = match v5 {
                US3::US3_CursorBudget(v14, v15) => {
                    let v14: Rc<str> = v14;
                    let v15: i32 = v15;
                    let v16: Rc<str> = Rc::<str>::from((v15).to_string());
                    let v17: Rc<str> = Rc::<str>::from(format!("{}{}", v16, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" pages"); } LIT.with(|lit| lit.clone()) }));
                    let v18: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("stopped after "); } LIT.with(|lit| lit.clone()) }, v17));
                    let v19: Rc<str> = Rc::<str>::from(format!("{}{}", v18, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" (page budget)"); } LIT.with(|lit| lit.clone()) }));
                    v19
                }
                US3::US3_CursorRepeated(v7, v8) => {
                    let v7: Rc<str> = v7;
                    let v8: i32 = v8;
                    let v9: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("the API repeated cursor "); } LIT.with(|lit| lit.clone()) }, v7));
                    let v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" after "); } LIT.with(|lit| lit.clone()) }));
                    let v11: Rc<str> = Rc::<str>::from((v8).to_string());
                    let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" pages"); } LIT.with(|lit| lit.clone()) }));
                    let v13: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v12));
                    v13
                }
            };
            let v22: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v21));
            v22
        }
        US2::US2_NoSuchAccount(v2) => {
            let v2: Rc<str> = v2;
            let v3: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) }, v2));
            v3
        }
        US2::US2_Reported(v1) => {
            let v1: Rc<str> = v1;
            v1
        }
    }
}
fn created_on_7(mut v0: US0, mut v1: serde_json::Value) -> (Rc<str>, Rc<str>, Rc<str>) {
    match v0 {
        US0::US0_OnBluesky(v18, v19) => {
            let v18: Rc<str> = v18;
            let v19: Rc<str> = v19;
            let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("uri"); } LIT.with(|lit| lit.clone()) };
            let v21: serde_json::Value = v1.get(&*v20).cloned().unwrap_or_default();
            let v22: Rc<str> = Rc::<str>::from(v21.as_str().unwrap_or(""));
            let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cid"); } LIT.with(|lit| lit.clone()) };
            let v24: serde_json::Value = v1.get(&*v23).cloned().unwrap_or_default();
            let v25: Rc<str> = Rc::<str>::from(v24.as_str().unwrap_or(""));
            let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v22, v26, v25)
        }
        US0::US0_OnMastodon => {
            let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let v12: serde_json::Value = v1.get(&*v11).cloned().unwrap_or_default();
            let v13: Rc<str> = Rc::<str>::from(v12.as_str().unwrap_or(""));
            let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("content"); } LIT.with(|lit| lit.clone()) };
            let v15: serde_json::Value = v1.get(&*v14).cloned().unwrap_or_default();
            let v16: Rc<str> = Rc::<str>::from(v15.as_str().unwrap_or(""));
            let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v13, v16, v17)
        }
        US0::US0_OnX => {
            let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let v3: serde_json::Value = v1.get(&*v2).cloned().unwrap_or_default();
            let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let mut v5: serde_json::Value = v3.get(&*v4).cloned().unwrap_or_default();
            let v6: Rc<str> = Rc::<str>::from(v5.as_str().unwrap_or(""));
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v3.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v6, v9, v10)
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>| -> (i32, Rc<str>, Rc<str>, Rc<str>) {
        let (mut v2, mut v3): (US0, US1) = answered_on_0(v0, v1);
        match v3 {
            US1::US1_Error(v10) => {
                let v10: US2 = v10;
                let v11: Rc<str> = describe_failure_6(v10);
                let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (4i32, v12.clone(), v12.clone(), v11)
            }
            US1::US1_Ok(v4, v5) => {
                let v4: serde_json::Value = v4;
                let mut v5: Rc<str> = v5;
                let (mut v6, mut v7, mut v8): (Rc<str>, Rc<str>, Rc<str>) = created_on_7(v2, v4);
                let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (0i32, v6, v8, v9)
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn deleted_on_8(mut v0: US0, mut v1: serde_json::Value) -> bool {
    match v0 {
        US0::US0_OnBluesky(v11, v12) => {
            let v11: Rc<str> = v11;
            let v12: Rc<str> = v12;
            true
        }
        US0::US0_OnMastodon => {
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let v8: serde_json::Value = v1.get(&*v7).cloned().unwrap_or_default();
            let v9: Rc<str> = Rc::<str>::from(v8.as_str().unwrap_or(""));
            let v10: bool = &*v9 != "";
            v10
        }
        US0::US0_OnX => {
            let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let v3: serde_json::Value = v1.get(&*v2).cloned().unwrap_or_default();
            let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("deleted"); } LIT.with(|lit| lit.clone()) };
            let mut v5: serde_json::Value = v3.get(&*v4).cloned().unwrap_or_default();
            let v6: bool = v5.as_bool().unwrap_or(false);
            v6
        }
    }
}
fn closure2() -> Rc<dyn Fn(Rc<str>, Rc<str>) -> (i32, bool, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>) -> (i32, bool, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>| -> (i32, bool, Rc<str>) {
        let (mut v2, mut v3): (US0, US1) = answered_on_0(v0, v1);
        match v3 {
            US1::US1_Error(v8) => {
                let v8: US2 = v8;
                let v9: Rc<str> = describe_failure_6(v8);
                (4i32, false, v9)
            }
            US1::US1_Ok(v4, v5) => {
                let v4: serde_json::Value = v4;
                let mut v5: Rc<str> = v5;
                let v6: bool = deleted_on_8(v2, v4);
                let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (0i32, v6, v7)
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn raw_reply_9(mut v0: Rc<str>, mut v1: US7, mut v2: US6, mut v3: Rc<str>) -> US1 {
    let v4: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v3.clone()));
    let v11: Rc<str> = match &v2 {
        US6::US6_Read => {
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("GET"); } LIT.with(|lit| lit.clone()) };
            v5
        }
        US6::US6_Remove => {
            let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("DELETE"); } LIT.with(|lit| lit.clone()) };
            v8
        }
        US6::US6_Write(v6) => {
            let v6: Rc<str> = v6.clone();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("POST"); } LIT.with(|lit| lit.clone()) };
            v7
        }
    };
    let v16: Rc<str> = match v1 {
        US7::US7_Anonymous => {
            let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v14
        }
        US7::US7_BearerToken(v12) => {
            let v12: Rc<str> = v12;
            let v13: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) }, v12));
            v13
        }
    };
    let v19: Rc<str> = match v2 {
        US6::US6_Write(v17) => {
            let v17: Rc<str> = v17;
            v17
        }
        _ => {
            let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v18
        }
    };
    let (mut v20, mut v21): (i32, Rc<str>) = xc_net::xc_send(&*v11, &*v4, &*v16, &*v19);
    let (mut v22, mut v23): (i32, Rc<str>) = xc_api::xc_classified(&*v3, v20, &*v21);
    let v24: bool = v22 == 0i32;
    if v24 {
        let v25: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v23).unwrap_or_default();
        US1::US1_Ok(v25, v23)
    } else {
        let v27: US2 = US2::US2_Reported(v23);
        US1::US1_Error(v27)
    }
}
fn closure3() -> Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>| -> (i32, Rc<str>, Rc<str>, Rc<str>) {
        let v3: i32 = (v0.clone().len() as i32);
        let v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
        let mut v5: bool = v0.ends_with(&*v4);
        let v10: Rc<str> = if v5 {
            let v6: i32 = v3.wrapping_sub(1i32);
            let v7: usize = ((0i32) as usize);
            let v8: usize = ((v6) as usize);
            let v9: Rc<str> = Rc::<str>::from(&(v0)[v7..v8]);
            v9
        } else {
            v0
        };
        let v11: US7 = US7::US7_Anonymous;
        let v12: Rc<str> = Rc::<str>::from(serde_json::json!({"identifier": &*v1, "password": &*v2}).to_string());
        let v13: US6 = US6::US6_Write(v12);
        let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/xrpc/com.atproto.server.createSession"); } LIT.with(|lit| lit.clone()) };
        let v15: US1 = raw_reply_9(v10, v11, v13, v14);
        match v15 {
            US1::US1_Error(v25) => {
                let v25: US2 = v25;
                let v26: Rc<str> = describe_failure_6(v25);
                let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (4i32, v27.clone(), v27.clone(), v26)
            }
            US1::US1_Ok(v16, v17) => {
                let v16: serde_json::Value = v16;
                let v17: Rc<str> = v17;
                let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("accessJwt"); } LIT.with(|lit| lit.clone()) };
                let v19: serde_json::Value = v16.get(&*v18).cloned().unwrap_or_default();
                let v20: Rc<str> = Rc::<str>::from(v19.as_str().unwrap_or(""));
                let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("did"); } LIT.with(|lit| lit.clone()) };
                let v22: serde_json::Value = v16.get(&*v21).cloned().unwrap_or_default();
                let v23: Rc<str> = Rc::<str>::from(v22.as_str().unwrap_or(""));
                let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (0i32, v20, v23, v24)
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_create(v0: &str, v1: &str) -> (i32, Rc<str>, Rc<str>, Rc<str>) {
    closure0()(Rc::<str>::from(v0), Rc::<str>::from(v1))
}
pub fn xc_delete(v0: &str, v1: &str) -> (i32, bool, Rc<str>) {
    closure2()(Rc::<str>::from(v0), Rc::<str>::from(v1))
}
pub fn xc_session(v0: &str, v1: &str, v2: &str) -> (i32, Rc<str>, Rc<str>, Rc<str>) {
    closure3()(Rc::<str>::from(v0), Rc::<str>::from(v1), Rc::<str>::from(v2))
}
