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
    let v2: i32 = v1.wrapping_add(719468i32);
    let v3: bool = v2 >= 0i32;
    let mut v5: i32 = if v3 {
        v2
    } else {
        let v4: i32 = v2.wrapping_sub(146096i32);
        v4
    };
    let v6: i32 = v5.wrapping_div(146097i32);
    let v7: i32 = v6.wrapping_mul(146097i32);
    let v8: i32 = v2.wrapping_sub(v7);
    let v9: i32 = v8.wrapping_div(1460i32);
    let v10: i32 = v8.wrapping_sub(v9);
    let v11: i32 = v8.wrapping_div(36524i32);
    let v12: i32 = v10.wrapping_add(v11);
    let v13: i32 = v8.wrapping_div(146096i32);
    let v14: i32 = v12.wrapping_sub(v13);
    let v15: i32 = v14.wrapping_div(365i32);
    let v16: i32 = 365i32.wrapping_mul(v15);
    let v17: i32 = v15.wrapping_div(4i32);
    let v18: i32 = v16.wrapping_add(v17);
    let v19: i32 = v15.wrapping_div(100i32);
    let v20: i32 = v18.wrapping_sub(v19);
    let v21: i32 = v8.wrapping_sub(v20);
    let v22: i32 = 5i32.wrapping_mul(v21);
    let v23: i32 = v22.wrapping_add(2i32);
    let v24: i32 = v23.wrapping_div(153i32);
    let v25: bool = v24 < 10i32;
    let v28: i32 = if v25 {
        let v26: i32 = v24.wrapping_add(3i32);
        v26
    } else {
        let v27: i32 = v24.wrapping_sub(9i32);
        v27
    };
    let v29: i32 = 153i32.wrapping_mul(v24);
    let v30: i32 = v29.wrapping_add(2i32);
    let v31: i32 = v30.wrapping_div(5i32);
    let v32: i32 = v21.wrapping_sub(v31);
    let v33: i32 = v32.wrapping_add(1i32);
    let v34: i32 = v6.wrapping_mul(400i32);
    let v35: i32 = v15.wrapping_add(v34);
    let v36: bool = v28 <= 2i32;
    let v37: i32 = if v36 {
        1i32
    } else {
        0i32
    };
    let v38: i32 = v35.wrapping_add(v37);
    let v39: Rc<str> = Rc::<str>::from(format!("{:?}", v38));
    let v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("-"); } LIT.with(|lit| lit.clone()) };
    let v41: Rc<str> = Rc::<str>::from(format!("{}{}", v39, v40));
    let v42: bool = v28 < 10i32;
    let v47: Rc<str> = if v42 {
        let v43: Rc<str> = Rc::<str>::from(format!("{:?}", v28));
        let v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0"); } LIT.with(|lit| lit.clone()) };
        let v45: Rc<str> = Rc::<str>::from(format!("{}{}", v44, v43));
        v45.clone()
    } else {
        let v46: Rc<str> = Rc::<str>::from(format!("{:?}", v28));
        v46.clone()
    };
    let v49: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v41, v47)), v40));
    let v50: bool = v33 < 10i32;
    let v55: Rc<str> = if v50 {
        let v51: Rc<str> = Rc::<str>::from(format!("{:?}", v33));
        let v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0"); } LIT.with(|lit| lit.clone()) };
        let v53: Rc<str> = Rc::<str>::from(format!("{}{}", v52, v51));
        v53.clone()
    } else {
        let v54: Rc<str> = Rc::<str>::from(format!("{:?}", v33));
        v54.clone()
    };
    let v56: Rc<str> = Rc::<str>::from(format!("{}{}", v49, v55));
    let v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("T"); } LIT.with(|lit| lit.clone()) };
    let v58: Rc<str> = Rc::<str>::from(format!("{}{}", v56, v57));
    let v59: i32 = v0.wrapping_rem(86400i32);
    let v60: i32 = v59.wrapping_div(3600i32);
    let v61: bool = v60 < 10i32;
    let v66: Rc<str> = if v61 {
        let v62: Rc<str> = Rc::<str>::from(format!("{:?}", v60));
        let mut v63: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0"); } LIT.with(|lit| lit.clone()) };
        let v64: Rc<str> = Rc::<str>::from(format!("{}{}", v63, v62));
        v64.clone()
    } else {
        let v65: Rc<str> = Rc::<str>::from(format!("{:?}", v60));
        v65.clone()
    };
    let mut v67: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
    let mut v68: Rc<str> = Rc::<str>::from(format!("{}{}", v66, v67));
    let v69: i32 = v59.wrapping_rem(3600i32);
    let v70: i32 = v69.wrapping_div(60i32);
    let v71: bool = v70 < 10i32;
    let v76: Rc<str> = if v71 {
        let v72: Rc<str> = Rc::<str>::from(format!("{:?}", v70));
        let v73: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0"); } LIT.with(|lit| lit.clone()) };
        let v74: Rc<str> = Rc::<str>::from(format!("{}{}", v73, v72));
        v74.clone()
    } else {
        let v75: Rc<str> = Rc::<str>::from(format!("{:?}", v70));
        v75.clone()
    };
    let v78: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v68, v76)), v67));
    let v79: i32 = v59.wrapping_rem(60i32);
    let v80: bool = v79 < 10i32;
    let v85: Rc<str> = if v80 {
        let v81: Rc<str> = Rc::<str>::from(format!("{:?}", v79));
        let v82: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0"); } LIT.with(|lit| lit.clone()) };
        let v83: Rc<str> = Rc::<str>::from(format!("{}{}", v82, v81));
        v83.clone()
    } else {
        let v84: Rc<str> = Rc::<str>::from(format!("{:?}", v79));
        v84.clone()
    };
    let v87: Rc<str> = Rc::<str>::from(format!("{}{}", v58, Rc::<str>::from(format!("{}{}", v78, v85))));
    let v88: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Z"); } LIT.with(|lit| lit.clone()) };
    let v89: Rc<str> = Rc::<str>::from(format!("{}{}", v87, v88));
    v89.clone()
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
    match &v0 {
        US0::US0_OnBluesky(v36, v37) => {
            let v36: Rc<str> = v36.clone();
            let v37: Rc<str> = v37.clone();
            match &v1 {
                US5::US5_Answer(v46, v47, v48, v49, v50, v51, v52) => {
                    let v46: Rc<str> = v46.clone();
                    let v47: Rc<str> = v47.clone();
                    let v48: Rc<str> = v48.clone();
                    let v49: Rc<str> = v49.clone();
                    let v50: Rc<str> = v50.clone();
                    let v51: Rc<str> = v51.clone();
                    let v52: Rc<str> = v52.clone();
                    let v53: serde_json::Value = serde_json::json!({"uri": &*v47, "cid": &*v49});
                    let v54: serde_json::Value = serde_json::json!({"uri": &*v50, "cid": &*v52});
                    let v55: serde_json::Value = serde_json::json!({"root": v53, "parent": v54});
                    let v56: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("$"); } LIT.with(|lit| lit.clone()) };
                    let v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("type"); } LIT.with(|lit| lit.clone()) };
                    let v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("$type"); } LIT.with(|lit| lit.clone()) };
                    let v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("app.bsky.feed.post"); } LIT.with(|lit| lit.clone()) };
                    let v60: serde_json::Value = serde_json::json!({(&*v58): &*v59, "text": &*v46, "createdAt": &*v37, "reply": v55});
                    let v61: Rc<str> = Rc::<str>::from(serde_json::json!({"repo": &*v36, "collection": &*v59, "record": v60}).to_string());
                    US6::US6_Write(v61.clone())
                }
                US5::US5_Fresh(v38) => {
                    let v38: Rc<str> = v38.clone();
                    let v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("$"); } LIT.with(|lit| lit.clone()) };
                    let v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("type"); } LIT.with(|lit| lit.clone()) };
                    let v41: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("$type"); } LIT.with(|lit| lit.clone()) };
                    let v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("app.bsky.feed.post"); } LIT.with(|lit| lit.clone()) };
                    let v43: serde_json::Value = serde_json::json!({(&*v41): &*v42, "text": &*v38, "createdAt": &*v37});
                    let v44: Rc<str> = Rc::<str>::from(serde_json::json!({"repo": &*v36, "collection": &*v42, "record": v43}).to_string());
                    US6::US6_Write(v44.clone())
                }
                US5::US5_Removal(v63) => {
                    let mut v63: Rc<str> = v63.clone();
                    let v64: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
                    let v65: Option<usize> = v63.rfind(&*v64);
                    let v66: Option<usize> = method3(v65.clone());
                    let mut v67: Rc<dyn Fn((usize)) -> i32> = closure1();
                    let mut v68: Option<i32> = v66.map(|x| v67(x));
                    let v70: i32 = v68.unwrap_or(-1i32);
                    let v71: i32 = v70.wrapping_add(1i32);
                    let v72: i32 = (v63.clone().len() as i32);
                    let v73: i32 = v72.wrapping_sub(v71);
                    let v74: usize = ((v71) as usize);
                    let v75: i32 = v71.wrapping_add(v73);
                    let v76: usize = ((v75) as usize);
                    let v77: Rc<str> = Rc::<str>::from(&(v63)[v74..v76]);
                    let v78: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("app.bsky.feed.post"); } LIT.with(|lit| lit.clone()) };
                    let v79: Rc<str> = Rc::<str>::from(serde_json::json!({"repo": &*v36, "collection": &*v78, "rkey": &*v77}).to_string());
                    US6::US6_Write(v79.clone())
                }
            }
        }
        US0::US0_OnMastodon => {
            match &v1 {
                US5::US5_Answer(v22, v23, v24, v25, v26, v27, v28) => {
                    let v22: Rc<str> = v22.clone();
                    let v23: Rc<str> = v23.clone();
                    let v24: Rc<str> = v24.clone();
                    let v25: Rc<str> = v25.clone();
                    let v26: Rc<str> = v26.clone();
                    let v27: Rc<str> = v27.clone();
                    let v28: Rc<str> = v28.clone();
                    let v29: Rc<str> = Rc::<str>::from(serde_json::json!({"status": &*v22, "in_reply_to_id": &*v26}).to_string());
                    US6::US6_Write(v29.clone())
                }
                US5::US5_Fresh(v19) => {
                    let v19: Rc<str> = v19.clone();
                    let v20: Rc<str> = Rc::<str>::from(serde_json::json!({"status": &*v19}).to_string());
                    US6::US6_Write(v20.clone())
                }
                US5::US5_Removal(v31) => {
                    let v31: Rc<str> = v31.clone();
                    US6::US6_Remove
                }
            }
        }
        US0::US0_OnX => {
            match &v1 {
                US5::US5_Answer(v5, v6, v7, v8, v9, v10, v11) => {
                    let mut v5: Rc<str> = v5.clone();
                    let v6: Rc<str> = v6.clone();
                    let v7: Rc<str> = v7.clone();
                    let v8: Rc<str> = v8.clone();
                    let v9: Rc<str> = v9.clone();
                    let v10: Rc<str> = v10.clone();
                    let v11: Rc<str> = v11.clone();
                    let v12: Rc<str> = Rc::<str>::from(serde_json::json!({"text": &*v5, "reply": {"in_reply_to_tweet_id": &*v9}}).to_string());
                    US6::US6_Write(v12.clone())
                }
                US5::US5_Fresh(v2) => {
                    let v2: Rc<str> = v2.clone();
                    let v3: Rc<str> = Rc::<str>::from(serde_json::json!({"text": &*v2}).to_string());
                    US6::US6_Write(v3.clone())
                }
                US5::US5_Removal(v14) => {
                    let v14: Rc<str> = v14.clone();
                    US6::US6_Remove
                }
            }
        }
    }
}
fn outgoing_path_4(mut v0: US0, mut v1: US5) -> Rc<str> {
    match &v0 {
        US0::US0_OnBluesky(v12, v13) => {
            let v12: Rc<str> = v12.clone();
            let v13: Rc<str> = v13.clone();
            match &v1 {
                US5::US5_Removal(v14) => {
                    let v14: Rc<str> = v14.clone();
                    let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/xrpc/com.atproto.repo.deleteRecord"); } LIT.with(|lit| lit.clone()) };
                    v15.clone()
                }
                _ => {
                    let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/xrpc/com.atproto.repo.createRecord"); } LIT.with(|lit| lit.clone()) };
                    v16.clone()
                }
            }
        }
        US0::US0_OnMastodon => {
            match &v1 {
                US5::US5_Removal(v7) => {
                    let v7: Rc<str> = v7.clone();
                    let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/api/v1/statuses/"); } LIT.with(|lit| lit.clone()) };
                    let v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v7));
                    v9.clone()
                }
                _ => {
                    let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/api/v1/statuses"); } LIT.with(|lit| lit.clone()) };
                    v10.clone()
                }
            }
        }
        US0::US0_OnX => {
            match &v1 {
                US5::US5_Removal(v2) => {
                    let v2: Rc<str> = v2.clone();
                    let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/"); } LIT.with(|lit| lit.clone()) };
                    let v4: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v2));
                    v4.clone()
                }
                _ => {
                    let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets"); } LIT.with(|lit| lit.clone()) };
                    v5.clone()
                }
            }
        }
    }
}
fn raw_reply_5(mut v0: Rc<str>, mut v1: US4, mut v2: US6, mut v3: Rc<str>) -> US1 {
    let v4: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v3));
    let v11: Rc<str> = match &v2 {
        US6::US6_Read => {
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("GET"); } LIT.with(|lit| lit.clone()) };
            v5.clone()
        }
        US6::US6_Remove => {
            let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("DELETE"); } LIT.with(|lit| lit.clone()) };
            v8.clone()
        }
        US6::US6_Write(v6) => {
            let v6: Rc<str> = v6.clone();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("POST"); } LIT.with(|lit| lit.clone()) };
            v7.clone()
        }
    };
    let v25: Rc<str> = match &v1 {
        US4::US4_Anonymous => {
            let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v22.clone()
        }
        US4::US4_BearerToken(v12) => {
            let v12: Rc<str> = v12.clone();
            let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) };
            let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v12));
            v14.clone()
        }
        US4::US4_Signed(v15, v16, v17, v18, v19, v20) => {
            let v15: Rc<str> = v15.clone();
            let v16: Rc<str> = v16.clone();
            let v17: Rc<str> = v17.clone();
            let v18: Rc<str> = v18.clone();
            let v19: Rc<str> = v19.clone();
            let v20: Rc<str> = v20.clone();
            let v21: Rc<str> = xc_net::xc_oauth1_header(&*v15, &*v16, &*v17, &*v18, &*v11, &*v4, &*v19, &*v20);
            v21.clone()
        }
    };
    let v28: Rc<str> = match &v2 {
        US6::US6_Write(v26) => {
            let v26: Rc<str> = v26.clone();
            v26.clone()
        }
        _ => {
            let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v27.clone()
        }
    };
    let (mut v29, mut v30): (i32, Rc<str>) = xc_net::xc_send(&*v11, &*v4, &*v25, &*v28);
    let (mut v31, mut v32): (i32, Rc<str>) = xc_api::xc_classified(&*v3, v29, &*v30);
    let v33: bool = v31 == 0i32;
    if v33 {
        let v34: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v32).unwrap_or_default();
        US1::US1_Ok(v34.clone(), v32.clone())
    } else {
        let v36: US2 = US2::US2_Reported(v32.clone());
        US1::US1_Error(v36.clone())
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
            v31.clone()
        } else {
            v21.clone()
        };
        let v33: US0 = US0::US0_OnBluesky(v13.clone(), v18.clone());
        let v34: US4 = US4::US4_BearerToken(v24.clone());
        (v33.clone(), v32.clone(), v34.clone())
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
                US0::US0_OnBluesky(v42.clone(), v42.clone())
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
        let v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("ck"); } LIT.with(|lit| lit.clone()) };
        let v60: serde_json::Value = v36.get(&*v59).cloned().unwrap_or_default();
        let v61: Rc<str> = Rc::<str>::from(v60.as_str().unwrap_or(""));
        let v62: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cs"); } LIT.with(|lit| lit.clone()) };
        let mut v63: serde_json::Value = v36.get(&*v62).cloned().unwrap_or_default();
        let v64: Rc<str> = Rc::<str>::from(v63.as_str().unwrap_or(""));
        let v65: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("t"); } LIT.with(|lit| lit.clone()) };
        let v66: serde_json::Value = v36.get(&*v65).cloned().unwrap_or_default();
        let mut v67: Rc<str> = Rc::<str>::from(v66.as_str().unwrap_or(""));
        let mut v68: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("ts"); } LIT.with(|lit| lit.clone()) };
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
                v78.clone()
            } else {
                v49.clone()
            };
            let v80: US4 = US4::US4_BearerToken(v52.clone());
            (v79.clone(), v80.clone())
        } else {
            let v81: i32 = (v49.clone().len() as i32);
            let v82: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
            let v83: bool = v49.ends_with(&*v82);
            let v88: Rc<str> = if v83 {
                let v84: i32 = v81.wrapping_sub(1i32);
                let v85: usize = ((0i32) as usize);
                let v86: usize = ((v84) as usize);
                let v87: Rc<str> = Rc::<str>::from(&(v49)[v85..v86]);
                v87.clone()
            } else {
                v49.clone()
            };
            let v89: US4 = US4::US4_Signed(v61.clone(), v64.clone(), v67.clone(), v70.clone(), v55.clone(), v58.clone());
            (v88.clone(), v89.clone())
        };
        (v46.clone(), v90.clone(), v91.clone())
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
        US5::US5_Removal(v101.clone())
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
            US5::US5_Answer(v101.clone(), v109.clone(), v119.clone(), v112.clone(), v116.clone(), v119.clone(), v118.clone())
        } else {
            US5::US5_Fresh(v101.clone())
        }
    };
    let v124: US6 = outgoing_verb_2(v92.clone(), v123.clone());
    let v125: Rc<str> = outgoing_path_4(v92.clone(), v123.clone());
    let v126: US1 = raw_reply_5(v93.clone(), v94.clone(), v124.clone(), v125.clone());
    (v92.clone(), v126.clone())
}
fn describe_failure_6(mut v0: US2) -> Rc<str> {
    match &v0 {
        US2::US2_CursorHalted(v5, v6) => {
            let mut v5: Rc<str> = v5.clone();
            let v6: US3 = v6.clone();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let v8: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v7));
            let v29: Rc<str> = match &v6 {
                US3::US3_CursorBudget(v19, v20) => {
                    let v19: Rc<str> = v19.clone();
                    let v20: i32 = *v20;
                    let v21: Rc<str> = Rc::<str>::from(format!("{:?}", v20));
                    let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" pages"); } LIT.with(|lit| lit.clone()) };
                    let v23: Rc<str> = Rc::<str>::from(format!("{}{}", v21, v22));
                    let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("stopped after "); } LIT.with(|lit| lit.clone()) };
                    let v25: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v23));
                    let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" (page budget)"); } LIT.with(|lit| lit.clone()) };
                    let v27: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v26));
                    v27.clone()
                }
                US3::US3_CursorRepeated(v9, v10) => {
                    let v9: Rc<str> = v9.clone();
                    let v10: i32 = *v10;
                    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("the API repeated cursor "); } LIT.with(|lit| lit.clone()) };
                    let v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v9));
                    let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" after "); } LIT.with(|lit| lit.clone()) };
                    let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v13));
                    let v15: Rc<str> = Rc::<str>::from(format!("{:?}", v10));
                    let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" pages"); } LIT.with(|lit| lit.clone()) };
                    let v18: Rc<str> = Rc::<str>::from(format!("{}{}", v14, Rc::<str>::from(format!("{}{}", v15, v16))));
                    v18.clone()
                }
            };
            let v30: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v29));
            v30.clone()
        }
        US2::US2_NoSuchAccount(v2) => {
            let v2: Rc<str> = v2.clone();
            let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
            let v4: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v2));
            v4.clone()
        }
        US2::US2_Reported(v1) => {
            let v1: Rc<str> = v1.clone();
            v1.clone()
        }
    }
}
fn created_on_7(mut v0: US0, mut v1: serde_json::Value) -> (Rc<str>, Rc<str>, Rc<str>) {
    match &v0 {
        US0::US0_OnBluesky(v18, v19) => {
            let v18: Rc<str> = v18.clone();
            let v19: Rc<str> = v19.clone();
            let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("uri"); } LIT.with(|lit| lit.clone()) };
            let v21: serde_json::Value = v1.get(&*v20).cloned().unwrap_or_default();
            let v22: Rc<str> = Rc::<str>::from(v21.as_str().unwrap_or(""));
            let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cid"); } LIT.with(|lit| lit.clone()) };
            let v24: serde_json::Value = v1.get(&*v23).cloned().unwrap_or_default();
            let v25: Rc<str> = Rc::<str>::from(v24.as_str().unwrap_or(""));
            let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v22.clone(), v26.clone(), v25.clone())
        }
        US0::US0_OnMastodon => {
            let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let v12: serde_json::Value = v1.get(&*v11).cloned().unwrap_or_default();
            let v13: Rc<str> = Rc::<str>::from(v12.as_str().unwrap_or(""));
            let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("content"); } LIT.with(|lit| lit.clone()) };
            let v15: serde_json::Value = v1.get(&*v14).cloned().unwrap_or_default();
            let v16: Rc<str> = Rc::<str>::from(v15.as_str().unwrap_or(""));
            let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            (v13.clone(), v16.clone(), v17.clone())
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
            (v6.clone(), v9.clone(), v10.clone())
        }
    }
}
fn closure0() -> Rc<dyn Fn(Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>, Rc<str>)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, Rc<str>) -> (i32, Rc<str>, Rc<str>, Rc<str>)> = Rc::new(move |mut v0: Rc<str>, mut v1: Rc<str>| -> (i32, Rc<str>, Rc<str>, Rc<str>) {
        let (mut v2, mut v3): (US0, US1) = answered_on_0(v0.clone(), v1.clone());
        match &v3 {
            US1::US1_Error(v10) => {
                let v10: US2 = v10.clone();
                let v11: Rc<str> = describe_failure_6(v10.clone());
                let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (4i32, v12.clone(), v12.clone(), v11.clone())
            }
            US1::US1_Ok(v4, v5) => {
                let v4: serde_json::Value = v4.clone();
                let mut v5: Rc<str> = v5.clone();
                let (mut v6, mut v7, mut v8): (Rc<str>, Rc<str>, Rc<str>) = created_on_7(v2.clone(), v4.clone());
                let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (0i32, v6.clone(), v8.clone(), v9.clone())
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn deleted_on_8(mut v0: US0, mut v1: serde_json::Value) -> bool {
    match &v0 {
        US0::US0_OnBluesky(v11, v12) => {
            let v11: Rc<str> = v11.clone();
            let v12: Rc<str> = v12.clone();
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
        let (mut v2, mut v3): (US0, US1) = answered_on_0(v0.clone(), v1.clone());
        match &v3 {
            US1::US1_Error(v8) => {
                let v8: US2 = v8.clone();
                let v9: Rc<str> = describe_failure_6(v8.clone());
                (4i32, false, v9.clone())
            }
            US1::US1_Ok(v4, v5) => {
                let v4: serde_json::Value = v4.clone();
                let mut v5: Rc<str> = v5.clone();
                let v6: bool = deleted_on_8(v2.clone(), v4.clone());
                let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (0i32, v6, v7.clone())
            }
        }
    }); } CLOSURE.with(|closure| closure.clone())
}
fn raw_reply_9(mut v0: Rc<str>, mut v1: US7, mut v2: US6, mut v3: Rc<str>) -> US1 {
    let v4: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v3));
    let v11: Rc<str> = match &v2 {
        US6::US6_Read => {
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("GET"); } LIT.with(|lit| lit.clone()) };
            v5.clone()
        }
        US6::US6_Remove => {
            let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("DELETE"); } LIT.with(|lit| lit.clone()) };
            v8.clone()
        }
        US6::US6_Write(v6) => {
            let v6: Rc<str> = v6.clone();
            let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("POST"); } LIT.with(|lit| lit.clone()) };
            v7.clone()
        }
    };
    let v17: Rc<str> = match &v1 {
        US7::US7_Anonymous => {
            let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v15.clone()
        }
        US7::US7_BearerToken(v12) => {
            let v12: Rc<str> = v12.clone();
            let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) };
            let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v12));
            v14.clone()
        }
    };
    let v20: Rc<str> = match &v2 {
        US6::US6_Write(v18) => {
            let v18: Rc<str> = v18.clone();
            v18.clone()
        }
        _ => {
            let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            v19.clone()
        }
    };
    let (mut v21, mut v22): (i32, Rc<str>) = xc_net::xc_send(&*v11, &*v4, &*v17, &*v20);
    let (mut v23, mut v24): (i32, Rc<str>) = xc_api::xc_classified(&*v3, v21, &*v22);
    let v25: bool = v23 == 0i32;
    if v25 {
        let v26: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v24).unwrap_or_default();
        US1::US1_Ok(v26.clone(), v24.clone())
    } else {
        let v28: US2 = US2::US2_Reported(v24.clone());
        US1::US1_Error(v28.clone())
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
            v9.clone()
        } else {
            v0.clone()
        };
        let v11: US7 = US7::US7_Anonymous;
        let v12: Rc<str> = Rc::<str>::from(serde_json::json!({"identifier": &*v1, "password": &*v2}).to_string());
        let v13: US6 = US6::US6_Write(v12.clone());
        let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/xrpc/com.atproto.server.createSession"); } LIT.with(|lit| lit.clone()) };
        let v15: US1 = raw_reply_9(v10.clone(), v11.clone(), v13.clone(), v14.clone());
        match &v15 {
            US1::US1_Error(v25) => {
                let v25: US2 = v25.clone();
                let v26: Rc<str> = describe_failure_6(v25.clone());
                let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (4i32, v27.clone(), v27.clone(), v26.clone())
            }
            US1::US1_Ok(v16, v17) => {
                let v16: serde_json::Value = v16.clone();
                let v17: Rc<str> = v17.clone();
                let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("accessJwt"); } LIT.with(|lit| lit.clone()) };
                let v19: serde_json::Value = v16.get(&*v18).cloned().unwrap_or_default();
                let v20: Rc<str> = Rc::<str>::from(v19.as_str().unwrap_or(""));
                let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("did"); } LIT.with(|lit| lit.clone()) };
                let v22: serde_json::Value = v16.get(&*v21).cloned().unwrap_or_default();
                let v23: Rc<str> = Rc::<str>::from(v22.as_str().unwrap_or(""));
                let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                (0i32, v20.clone(), v23.clone(), v24.clone())
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
