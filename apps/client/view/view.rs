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
    UH0_Cons(serde_json::Value, Rc<UH0>),
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
enum US0 {
    US0_Quoted,
    US0_RepliedTo,
    US0_Reposted,
}
impl US0 {
    fn tag(&self) -> i32 {
        match self {
            US0::US0_Quoted => 0,
            US0::US0_RepliedTo => 1,
            US0::US0_Reposted => 2,
        }
    }
}
impl Default for US0 {
    fn default() -> Self {
        US0::US0_Quoted
    }
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(US0, Rc<str>, Rc<UH2>),
}
impl UH2 {
    fn tag(&self) -> i32 {
        match self {
            UH2::UH2_Nil => 0,
            UH2::UH2_Cons(..) => 1,
        }
    }
}
impl Default for UH2 {
    fn default() -> Self {
        UH2::UH2_Nil
    }
}
#[derive(Clone)]
enum UH3 {
    UH3_Nil,
    UH3_Cons(Rc<str>, Rc<str>, Rc<str>, Rc<UH3>),
}
impl UH3 {
    fn tag(&self) -> i32 {
        match self {
            UH3::UH3_Nil => 0,
            UH3::UH3_Cons(..) => 1,
        }
    }
}
impl Default for UH3 {
    fn default() -> Self {
        UH3::UH3_Nil
    }
}
#[derive(Clone)]
enum UH4 {
    UH4_Nil,
    UH4_Cons(Rc<str>, Rc<UH4>),
}
impl UH4 {
    fn tag(&self) -> i32 {
        match self {
            UH4::UH4_Nil => 0,
            UH4::UH4_Cons(..) => 1,
        }
    }
}
impl Default for UH4 {
    fn default() -> Self {
        UH4::UH4_Nil
    }
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, Rc<UH4>, Rc<UH1>),
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
#[derive(Clone)]
enum UH5 {
    UH5_Nil,
    UH5_Cons(Rc<str>, Rc<str>, Rc<str>, Rc<UH5>),
}
impl UH5 {
    fn tag(&self) -> i32 {
        match self {
            UH5::UH5_Nil => 0,
            UH5::UH5_Cons(..) => 1,
        }
    }
}
impl Default for UH5 {
    fn default() -> Self {
        UH5::UH5_Nil
    }
}
#[derive(Clone)]
enum UH6 {
    UH6_Nil,
    UH6_Cons(Rc<str>, Rc<str>, Rc<UH6>),
}
impl UH6 {
    fn tag(&self) -> i32 {
        match self {
            UH6::UH6_Nil => 0,
            UH6::UH6_Cons(..) => 1,
        }
    }
}
impl Default for UH6 {
    fn default() -> Self {
        UH6::UH6_Nil
    }
}
#[derive(Clone)]
enum UH7 {
    UH7_Nil,
    UH7_Cons(Rc<UH2>, Rc<UH7>),
}
impl UH7 {
    fn tag(&self) -> i32 {
        match self {
            UH7::UH7_Nil => 0,
            UH7::UH7_Cons(..) => 1,
        }
    }
}
impl Default for UH7 {
    fn default() -> Self {
        UH7::UH7_Nil
    }
}
#[derive(Clone)]
enum US1 {
    US1_Some(US0),
    US1_None,
}
impl US1 {
    fn tag(&self) -> i32 {
        match self {
            US1::US1_Some(..) => 0,
            US1::US1_None => 1,
        }
    }
}
impl Default for US1 {
    fn default() -> Self {
        US1::US1_Some(<US0>::default())
    }
}
#[derive(Clone)]
enum US2 {
    US2_Some(Rc<str>),
    US2_None,
}
impl US2 {
    fn tag(&self) -> i32 {
        match self {
            US2::US2_Some(..) => 0,
            US2::US2_None => 1,
        }
    }
}
impl Default for US2 {
    fn default() -> Self {
        US2::US2_Some({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
#[derive(Clone)]
enum UH8 {
    UH8_Nil,
    UH8_Cons(Rc<str>, i32, Rc<UH8>),
}
impl UH8 {
    fn tag(&self) -> i32 {
        match self {
            UH8::UH8_Nil => 0,
            UH8::UH8_Cons(..) => 1,
        }
    }
}
impl Default for UH8 {
    fn default() -> Self {
        UH8::UH8_Nil
    }
}
#[derive(Clone)]
enum US3 {
    US3_Some(Rc<str>, i32),
    US3_None,
}
impl US3 {
    fn tag(&self) -> i32 {
        match self {
            US3::US3_Some(..) => 0,
            US3::US3_None => 1,
        }
    }
}
impl Default for US3 {
    fn default() -> Self {
        US3::US3_Some({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, <i32>::default())
    }
}
#[derive(Clone)]
enum US4 {
    US4_Some(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, Rc<UH4>),
    US4_None,
}
impl US4 {
    fn tag(&self) -> i32 {
        match self {
            US4::US4_Some(..) => 0,
            US4::US4_None => 1,
        }
    }
}
impl Default for US4 {
    fn default() -> Self {
        US4::US4_Some({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, <Rc<UH2>>::default(), <Rc<UH3>>::default(), <Rc<UH4>>::default())
    }
}
#[derive(Clone)]
enum UH9 {
    UH9_Nil,
    UH9_Cons(i32, Rc<UH9>),
}
impl UH9 {
    fn tag(&self) -> i32 {
        match self {
            UH9::UH9_Nil => 0,
            UH9::UH9_Cons(..) => 1,
        }
    }
}
impl Default for UH9 {
    fn default() -> Self {
        UH9::UH9_Nil
    }
}
#[derive(Clone)]
enum US5 {
    US5_Some(Rc<str>, Rc<str>, Rc<str>),
    US5_None,
}
impl US5 {
    fn tag(&self) -> i32 {
        match self {
            US5::US5_Some(..) => 0,
            US5::US5_None => 1,
        }
    }
}
impl Default for US5 {
    fn default() -> Self {
        US5::US5_Some({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
#[derive(Clone)]
enum US6 {
    US6_Some(Rc<str>, Rc<str>),
    US6_None,
}
impl US6 {
    fn tag(&self) -> i32 {
        match self {
            US6::US6_Some(..) => 0,
            US6::US6_None => 1,
        }
    }
}
impl Default for US6 {
    fn default() -> Self {
        US6::US6_Some({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
fn from_1(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<UH0> = Rc::new(UH0::UH0_Cons(v5.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v6.clone());
            continue;
        }
    }
}
fn from_7(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH7>) -> Rc<UH7> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("type"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: Rc<str> = Rc::<str>::from(v7.as_str().unwrap_or(""));
            let mut v9: bool = v8.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
            let mut v23: US1 = if v9 {
                let mut v10: US0 = US0::US0_Quoted;
                US1::US1_Some(v10.clone())
            } else {
                let mut v12: bool = v8.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replied_to"); } LIT.with(|lit| lit.clone()) };
                if v12 {
                    let mut v13: US0 = US0::US0_RepliedTo;
                    US1::US1_Some(v13.clone())
                } else {
                    let mut v15: bool = v8.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposted"); } LIT.with(|lit| lit.clone()) };
                    let mut v17: bool = if v15 {
                        true
                    } else {
                        let mut v16: bool = v8.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("retweeted"); } LIT.with(|lit| lit.clone()) };
                        v16
                    };
                    if v17 {
                        let mut v18: US0 = US0::US0_Reposted;
                        US1::US1_Some(v18.clone())
                    } else {
                        US1::US1_None
                    }
                }
            };
            let mut v32: Rc<UH2> = match &v23 {
                US1::US1_None => {
                    { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
                }
                US1::US1_Some(v24) => {
                    let mut v24: US0 = v24.clone();
                    let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
                    let mut v26: serde_json::Value = v5.get(&*v25).cloned().unwrap_or_default();
                    let mut v27: Rc<str> = Rc::<str>::from(v26.as_str().unwrap_or(""));
                    let mut v28: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    Rc::new(UH2::UH2_Cons(v24.clone(), v27.clone(), v28.clone()))
                }
            };
            let mut v33: Rc<UH7> = Rc::new(UH7::UH7_Cons(v32.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v33.clone());
            continue;
        }
    }
}
fn method9(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let mut v2: US0 = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH2> = method9(v4.clone(), v1.clone());
            Rc::new(UH2::UH2_Cons(v2.clone(), v3.clone(), v5.clone()))
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn method8(mut v0: Rc<UH7>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH7::UH7_Cons(v2, v3) => {
            let mut v2: Rc<UH2> = v2.clone();
            let mut v3: Rc<UH7> = v3.clone();
            let mut v4: Rc<UH2> = method8(v3.clone(), v1.clone());
            method9(v2.clone(), v4.clone())
        }
        UH7::UH7_Nil => {
            v1.clone()
        }
    }
}
fn from_10(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH3>) -> Rc<UH3> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("url"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: Rc<str> = Rc::<str>::from(v7.as_str().unwrap_or(""));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("expanded_url"); } LIT.with(|lit| lit.clone()) };
            let mut v10: serde_json::Value = v5.get(&*v9).cloned().unwrap_or_default();
            let mut v11: Rc<str> = Rc::<str>::from(v10.as_str().unwrap_or(""));
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
            let mut v13: serde_json::Value = v5.get(&*v12).cloned().unwrap_or_default();
            let mut v14: Rc<str> = Rc::<str>::from(v13.as_str().unwrap_or(""));
            let mut v15: Rc<UH3> = Rc::new(UH3::UH3_Cons(v8.clone(), v11.clone(), v14.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v15.clone());
            continue;
        }
    }
}
fn from_11(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH4>) -> Rc<UH4> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = Rc::<str>::from(v5.as_str().unwrap_or(""));
            let mut v7: Rc<UH4> = Rc::new(UH4::UH4_Cons(v6.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v7.clone());
            continue;
        }
    }
}
fn post_by_6(mut v0: Rc<str>, mut v1: serde_json::Value) -> (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, Rc<UH4>) {
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
    let mut v3: serde_json::Value = v1.get(&*v2).cloned().unwrap_or_default();
    let mut v4: Rc<str> = Rc::<str>::from(v3.as_str().unwrap_or(""));
    let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("author_id"); } LIT.with(|lit| lit.clone()) };
    let mut v6: serde_json::Value = v1.get(&*v5).cloned().unwrap_or_default();
    let mut v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("created_at"); } LIT.with(|lit| lit.clone()) };
    let mut v9: serde_json::Value = v1.get(&*v8).cloned().unwrap_or_default();
    let mut v10: Rc<str> = Rc::<str>::from(v9.as_str().unwrap_or(""));
    let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
    let mut v12: serde_json::Value = v1.get(&*v11).cloned().unwrap_or_default();
    let mut v13: Rc<str> = Rc::<str>::from(v12.as_str().unwrap_or(""));
    let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
    let mut v15: serde_json::Value = v1.get(&*v14).cloned().unwrap_or_default();
    let mut v16: i32 = v15.as_array().map_or(0, |a| a.len()) as i32;
    let mut v17: i32 = v16.wrapping_sub(1i32);
    let mut v18: Rc<UH7> = { thread_local!{ static CASE: Rc<UH7> = Rc::new(UH7::UH7_Nil); } CASE.with(|case| case.clone()) };
    let mut v19: Rc<UH7> = from_7(v15.clone(), v17, v18.clone());
    let mut v20: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let mut v21: Rc<UH2> = method8(v19.clone(), v20.clone());
    let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("entities"); } LIT.with(|lit| lit.clone()) };
    let mut v23: serde_json::Value = v1.get(&*v22).cloned().unwrap_or_default();
    let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("urls"); } LIT.with(|lit| lit.clone()) };
    let mut v25: serde_json::Value = v23.get(&*v24).cloned().unwrap_or_default();
    let mut v26: i32 = v25.as_array().map_or(0, |a| a.len()) as i32;
    let mut v27: i32 = v26.wrapping_sub(1i32);
    let mut v28: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let mut v29: Rc<UH3> = from_10(v25.clone(), v27, v28.clone());
    let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("attachments"); } LIT.with(|lit| lit.clone()) };
    let mut v31: serde_json::Value = v1.get(&*v30).cloned().unwrap_or_default();
    let mut v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("media_keys"); } LIT.with(|lit| lit.clone()) };
    let mut v33: serde_json::Value = v31.get(&*v32).cloned().unwrap_or_default();
    let mut v34: i32 = v33.as_array().map_or(0, |a| a.len()) as i32;
    let mut v35: i32 = v34.wrapping_sub(1i32);
    let mut v36: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v37: Rc<UH4> = from_11(v33.clone(), v35, v36.clone());
    (v4.clone(), v7.clone(), v0.clone(), v10.clone(), v13.clone(), v21.clone(), v29.clone(), v37.clone())
}
fn from_5(mut v0: Rc<str>, mut v1: serde_json::Value, mut v2: i32, mut v3: Rc<UH1>) -> Rc<UH1> {
    loop {
        let mut v4: bool = v2 < 0i32;
        if v4 {
            return v3.clone();
        } else {
            let mut v5: i32 = v2.wrapping_sub(1i32);
            let mut v6: serde_json::Value = v1.get(v2 as usize).cloned().unwrap_or_default();
            let (mut v7, mut v8, mut v9, mut v10, mut v11, mut v12, mut v13, mut v14): (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<UH2>, Rc<UH3>, Rc<UH4>) = post_by_6(v0.clone(), v6.clone());
            let mut v15: Rc<UH1> = Rc::new(UH1::UH1_Cons(v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v12.clone(), v13.clone(), v14.clone(), v3.clone()));
            (v0, v1, v2, v3) = (v0.clone(), v1.clone(), v5, v15.clone());
            continue;
        }
    }
}
fn method12(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH2> = v7.clone();
            let mut v8: Rc<UH3> = v8.clone();
            let mut v9: Rc<UH4> = v9.clone();
            let mut v10: Rc<UH1> = v10.clone();
            let mut v11: Rc<UH1> = method12(v10.clone(), v1.clone());
            Rc::new(UH1::UH1_Cons(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v11.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn from_13(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH5>) -> Rc<UH5> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("media_key"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: Rc<str> = Rc::<str>::from(v7.as_str().unwrap_or(""));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("type"); } LIT.with(|lit| lit.clone()) };
            let mut v10: serde_json::Value = v5.get(&*v9).cloned().unwrap_or_default();
            let mut v11: Rc<str> = Rc::<str>::from(v10.as_str().unwrap_or(""));
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("alt_text"); } LIT.with(|lit| lit.clone()) };
            let mut v13: serde_json::Value = v5.get(&*v12).cloned().unwrap_or_default();
            let mut v14: Rc<str> = Rc::<str>::from(v13.as_str().unwrap_or(""));
            let mut v15: Rc<UH5> = Rc::new(UH5::UH5_Cons(v8.clone(), v11.clone(), v14.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v15.clone());
            continue;
        }
    }
}
fn from_14(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH6>) -> Rc<UH6> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: Rc<str> = Rc::<str>::from(v7.as_str().unwrap_or(""));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("username"); } LIT.with(|lit| lit.clone()) };
            let mut v10: serde_json::Value = v5.get(&*v9).cloned().unwrap_or_default();
            let mut v11: Rc<str> = Rc::<str>::from(v10.as_str().unwrap_or(""));
            let mut v12: Rc<UH6> = Rc::new(UH6::UH6_Cons(v8.clone(), v11.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v12.clone());
            continue;
        }
    }
}
fn method15(mut v0: Rc<UH6>, mut v1: Rc<UH6>) -> Rc<UH6> {
    match &*v0 {
        UH6::UH6_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH6> = v4.clone();
            let mut v5: Rc<UH6> = method15(v4.clone(), v1.clone());
            let mut v6: bool = v3.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v7: bool = v6 != true;
            if v7 {
                Rc::new(UH6::UH6_Cons(v2.clone(), v3.clone(), v5.clone()))
            } else {
                v5.clone()
            }
        }
        UH6::UH6_Nil => {
            v1.clone()
        }
    }
}
fn posts_of_doc_4(mut v0: Rc<str>, mut v1: serde_json::Value) -> (Rc<UH1>, Rc<UH5>, Rc<UH6>, Rc<UH1>, Rc<str>) {
    let mut v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
    let mut v3: serde_json::Value = v1.get(&*v2).cloned().unwrap_or_default();
    let mut v4: i32 = v3.as_array().map_or(0, |a| a.len()) as i32;
    let mut v5: i32 = v4.wrapping_sub(1i32);
    let mut v6: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v7: Rc<UH1> = from_5(v0.clone(), v3.clone(), v5, v6.clone());
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("includes"); } LIT.with(|lit| lit.clone()) };
    let mut v9: serde_json::Value = v1.get(&*v8).cloned().unwrap_or_default();
    let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts"); } LIT.with(|lit| lit.clone()) };
    let mut v11: serde_json::Value = v9.get(&*v10).cloned().unwrap_or_default();
    let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v13: i32 = v11.as_array().map_or(0, |a| a.len()) as i32;
    let mut v14: i32 = v13.wrapping_sub(1i32);
    let mut v15: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v16: Rc<UH1> = from_5(v12.clone(), v11.clone(), v14, v15.clone());
    let mut v17: Rc<UH1> = method12(v7.clone(), v16.clone());
    let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("media"); } LIT.with(|lit| lit.clone()) };
    let mut v19: serde_json::Value = v9.get(&*v18).cloned().unwrap_or_default();
    let mut v20: i32 = v19.as_array().map_or(0, |a| a.len()) as i32;
    let mut v21: i32 = v20.wrapping_sub(1i32);
    let mut v22: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
    let mut v23: Rc<UH5> = from_13(v19.clone(), v21, v22.clone());
    let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("users"); } LIT.with(|lit| lit.clone()) };
    let mut v25: serde_json::Value = v9.get(&*v24).cloned().unwrap_or_default();
    let mut v26: i32 = v25.as_array().map_or(0, |a| a.len()) as i32;
    let mut v27: i32 = v26.wrapping_sub(1i32);
    let mut v28: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
    let mut v29: Rc<UH6> = from_14(v25.clone(), v27, v28.clone());
    let mut v30: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
    let mut v31: Rc<UH6> = method15(v29.clone(), v30.clone());
    let mut v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
    let mut v33: serde_json::Value = v1.get(&*v32).cloned().unwrap_or_default();
    let mut v34: serde_json::Value = v33.get(0i32 as usize).cloned().unwrap_or_default();
    let mut v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
    let mut v36: serde_json::Value = v34.get(&*v35).cloned().unwrap_or_default();
    let mut v37: Rc<str> = Rc::<str>::from(v36.as_str().unwrap_or(""));
    let mut v38: bool = v37.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v39: bool = v38 != true;
    let mut v43: Rc<str> = if v39 {
        v37.clone()
    } else {
        let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
        let mut v41: serde_json::Value = v34.get(&*v40).cloned().unwrap_or_default();
        let mut v42: Rc<str> = Rc::<str>::from(v41.as_str().unwrap_or(""));
        v42.clone()
    };
    (v17.clone(), v23.clone(), v31.clone(), v7.clone(), v43.clone())
}
fn method16(mut v0: Rc<UH5>, mut v1: Rc<UH5>) -> Rc<UH5> {
    match &*v0 {
        UH5::UH5_Cons(v2, v3, v4, v5) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH5> = v5.clone();
            let mut v6: Rc<UH5> = method16(v5.clone(), v1.clone());
            Rc::new(UH5::UH5_Cons(v2.clone(), v3.clone(), v4.clone(), v6.clone()))
        }
        UH5::UH5_Nil => {
            v1.clone()
        }
    }
}
fn method17(mut v0: Rc<UH6>, mut v1: Rc<UH6>) -> Rc<UH6> {
    match &*v0 {
        UH6::UH6_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH6> = v4.clone();
            let mut v5: Rc<UH6> = method17(v4.clone(), v1.clone());
            Rc::new(UH6::UH6_Cons(v2.clone(), v3.clone(), v5.clone()))
        }
        UH6::UH6_Nil => {
            v1.clone()
        }
    }
}
fn method18(mut v0: Rc<UH1>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH2> = v7.clone();
            let mut v8: Rc<UH3> = v8.clone();
            let mut v9: Rc<UH4> = v9.clone();
            let mut v10: Rc<UH1> = v10.clone();
            let mut v11: Rc<UH4> = method18(v10.clone(), v1.clone());
            Rc::new(UH4::UH4_Cons(v2.clone(), v11.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method20(mut v0: Rc<str>, mut v1: Rc<UH4>, mut v2: US2) -> US2 {
    match &*v1 {
        UH4::UH4_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH4> = v4.clone();
            let mut v5: US2 = method20(v0.clone(), v4.clone(), v2.clone());
            let mut v6: bool = v0.clone() == v3.clone();
            if v6 {
                US2::US2_Some(v3.clone())
            } else {
                v5.clone()
            }
        }
        UH4::UH4_Nil => {
            v2.clone()
        }
    }
}
fn method19(mut v0: Rc<UH4>, mut v1: Rc<UH1>, mut v2: Rc<UH1>) -> Rc<UH1> {
    match &*v1 {
        UH1::UH1_Cons(v3, v4, v5, v6, v7, v8, v9, v10, v11) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<UH2> = v8.clone();
            let mut v9: Rc<UH3> = v9.clone();
            let mut v10: Rc<UH4> = v10.clone();
            let mut v11: Rc<UH1> = v11.clone();
            let mut v12: Rc<UH1> = method19(v0.clone(), v11.clone(), v2.clone());
            let mut v13: US2 = US2::US2_None;
            let mut v14: US2 = method20(v3.clone(), v0.clone(), v13.clone());
            let mut v17: bool = match &v14 {
                US2::US2_None => {
                    false
                }
                US2::US2_Some(v15) => {
                    let mut v15: Rc<str> = v15.clone();
                    true
                }
            };
            let mut v18: bool = v17 == false;
            if v18 {
                Rc::new(UH1::UH1_Cons(v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v12.clone()))
            } else {
                v12.clone()
            }
        }
        UH1::UH1_Nil => {
            v2.clone()
        }
    }
}
fn from_21(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH4>) -> Rc<UH4> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("value"); } LIT.with(|lit| lit.clone()) };
            let mut v7: serde_json::Value = v5.get(&*v6).cloned().unwrap_or_default();
            let mut v8: Rc<str> = Rc::<str>::from(v7.as_str().unwrap_or(""));
            let mut v9: Rc<UH4> = Rc::new(UH4::UH4_Cons(v8.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v9.clone());
            continue;
        }
    }
}
fn absorb_entry_3(mut v0: Rc<UH1>, mut v1: Rc<UH1>, mut v2: Rc<UH5>, mut v3: Rc<UH6>, mut v4: serde_json::Value) -> (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) {
    let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("role"); } LIT.with(|lit| lit.clone()) };
    let mut v6: serde_json::Value = v4.get(&*v5).cloned().unwrap_or_default();
    let mut v7: Rc<str> = Rc::<str>::from(v6.as_str().unwrap_or(""));
    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("doc"); } LIT.with(|lit| lit.clone()) };
    let mut v9: serde_json::Value = v4.get(&*v8).cloned().unwrap_or_default();
    let mut v10: bool = v7.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("primary"); } LIT.with(|lit| lit.clone()) };
    let (mut v54, mut v55, mut v56, mut v57): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = if v10 {
        let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("author"); } LIT.with(|lit| lit.clone()) };
        let mut v12: serde_json::Value = v4.get(&*v11).cloned().unwrap_or_default();
        let mut v13: Rc<str> = Rc::<str>::from(v12.as_str().unwrap_or(""));
        let (mut v14, mut v15, mut v16, mut v17, mut v18): (Rc<UH1>, Rc<UH5>, Rc<UH6>, Rc<UH1>, Rc<str>) = posts_of_doc_4(v13.clone(), v9.clone());
        let mut v19: Rc<UH1> = method12(v17.clone(), v0.clone());
        let mut v20: Rc<UH1> = method12(v1.clone(), v14.clone());
        let mut v21: Rc<UH5> = method16(v2.clone(), v15.clone());
        let mut v22: Rc<UH6> = method17(v3.clone(), v16.clone());
        (v19.clone(), v20.clone(), v21.clone(), v22.clone())
    } else {
        let mut v23: bool = v7.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("lookup"); } LIT.with(|lit| lit.clone()) };
        let (mut v50, mut v51, mut v52, mut v53): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = if v23 {
            let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v25, mut v26, mut v27, mut v28, mut v29): (Rc<UH1>, Rc<UH5>, Rc<UH6>, Rc<UH1>, Rc<str>) = posts_of_doc_4(v24.clone(), v9.clone());
            let mut v30: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
            let mut v31: Rc<UH4> = method18(v25.clone(), v30.clone());
            let mut v32: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            let mut v33: Rc<UH1> = method19(v31.clone(), v1.clone(), v32.clone());
            let mut v34: Rc<UH1> = method12(v25.clone(), v33.clone());
            let mut v35: Rc<UH5> = method16(v26.clone(), v2.clone());
            let mut v36: Rc<UH6> = method17(v27.clone(), v3.clone());
            (v0.clone(), v34.clone(), v35.clone(), v36.clone())
        } else {
            let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v38: serde_json::Value = v9.get(&*v37).cloned().unwrap_or_default();
            let mut v39: i32 = v38.as_array().map_or(0, |a| a.len()) as i32;
            let mut v40: i32 = v39.wrapping_sub(1i32);
            let mut v41: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
            let mut v42: Rc<UH6> = from_14(v38.clone(), v40, v41.clone());
            let mut v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
            let mut v44: serde_json::Value = v9.get(&*v43).cloned().unwrap_or_default();
            let mut v45: i32 = v44.as_array().map_or(0, |a| a.len()) as i32;
            let mut v46: i32 = v45.wrapping_sub(1i32);
            let mut v47: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
            let mut v48: Rc<UH4> = from_21(v44.clone(), v46, v47.clone());
            let mut v49: Rc<UH6> = method17(v3.clone(), v42.clone());
            (v0.clone(), v1.clone(), v2.clone(), v49.clone())
        };
        (v50.clone(), v51.clone(), v52.clone(), v53.clone())
    };
    (v54.clone(), v55.clone(), v56.clone(), v57.clone())
}
fn method2(mut v0: Rc<UH0>, mut v1: Rc<UH1>, mut v2: Rc<UH1>, mut v3: Rc<UH5>, mut v4: Rc<UH6>) -> (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) {
    let (mut v19, mut v20, mut v21, mut v22): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = match &*v0 {
        UH0::UH0_Cons(v5, v6) => {
            let mut v5: serde_json::Value = v5.clone();
            let mut v6: Rc<UH0> = v6.clone();
            let (mut v7, mut v8, mut v9, mut v10): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = absorb_entry_3(v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone());
            method2(v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone())
        }
        _ => {
            let (mut v15, mut v16, mut v17, mut v18): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1.clone(), v2.clone(), v3.clone(), v4.clone())
                }
                _ => unreachable!(),
            };
            (v15.clone(), v16.clone(), v17.clone(), v18.clone())
        }
    };
    (v19.clone(), v20.clone(), v21.clone(), v22.clone())
}
fn go_23(mut v0: i32, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v1 {
        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH2> = v7.clone();
            let mut v8: Rc<UH3> = v8.clone();
            let mut v9: Rc<UH4> = v9.clone();
            let mut v10: Rc<UH1> = v10.clone();
            let mut v11: bool = v0 > 0i32;
            if v11 {
                let mut v12: i32 = v0.wrapping_sub(1i32);
                let mut v13: Rc<UH1> = go_23(v12, v10.clone());
                Rc::new(UH1::UH1_Cons(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v13.clone()))
            } else {
                { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
            }
        }
        _ => {
            { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
        }
    }
}
fn merge_newest_25(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Nil => {
            v1.clone()
        }
        _ => {
            match &*v1 {
                UH1::UH1_Nil => {
                    v0.clone()
                }
                _ => {
                    match &*v0 {
                        UH1::UH1_Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10) => {
                            let mut v2: Rc<str> = v2.clone();
                            let mut v3: Rc<str> = v3.clone();
                            let mut v4: Rc<str> = v4.clone();
                            let mut v5: Rc<str> = v5.clone();
                            let mut v6: Rc<str> = v6.clone();
                            let mut v7: Rc<UH2> = v7.clone();
                            let mut v8: Rc<UH3> = v8.clone();
                            let mut v9: Rc<UH4> = v9.clone();
                            let mut v10: Rc<UH1> = v10.clone();
                            match &*v1 {
                                UH1::UH1_Cons(v11, v12, v13, v14, v15, v16, v17, v18, v19) => {
                                    let mut v11: Rc<str> = v11.clone();
                                    let mut v12: Rc<str> = v12.clone();
                                    let mut v13: Rc<str> = v13.clone();
                                    let mut v14: Rc<str> = v14.clone();
                                    let mut v15: Rc<str> = v15.clone();
                                    let mut v16: Rc<UH2> = v16.clone();
                                    let mut v17: Rc<UH3> = v17.clone();
                                    let mut v18: Rc<UH4> = v18.clone();
                                    let mut v19: Rc<UH1> = v19.clone();
                                    let mut v20: i32 = (v5.clone().len() as i32);
                                    let mut v21: bool = v20 < 19i32;
                                    let mut v23: Rc<str> = if v21 {
                                        v5.clone()
                                    } else {
                                        let mut v22: Rc<str> = string_slice(&v5.clone(), 0i32 as i64, 18i32 as i64);
                                        v22.clone()
                                    };
                                    let mut v24: i32 = (v14.clone().len() as i32);
                                    let mut v25: bool = v24 < 19i32;
                                    let mut v27: Rc<str> = if v25 {
                                        v14.clone()
                                    } else {
                                        let mut v26: Rc<str> = string_slice(&v14.clone(), 0i32 as i64, 18i32 as i64);
                                        v26.clone()
                                    };
                                    let mut v28: bool = v23.clone() == v27.clone();
                                    let mut v29: bool = v28 != true;
                                    let mut v46: bool = if v29 {
                                        let mut v30: bool = v23.clone() < v27.clone();
                                        let mut v33: i32 = if v30 {
                                            -1i32
                                        } else {
                                            let mut v31: bool = v23.clone() > v27.clone();
                                            if v31 {
                                                1i32
                                            } else {
                                                0i32
                                            }
                                        };
                                        let mut v34: bool = v33 == 1i32;
                                        v34
                                    } else {
                                        let mut v35: i32 = (v2.clone().len() as i32);
                                        let mut v36: i32 = (v11.clone().len() as i32);
                                        let mut v37: bool = v35 == v36;
                                        let mut v38: bool = v37 != true;
                                        if v38 {
                                            let mut v39: bool = v35 > v36;
                                            v39
                                        } else {
                                            let mut v40: bool = v2.clone() < v11.clone();
                                            let mut v43: i32 = if v40 {
                                                -1i32
                                            } else {
                                                let mut v41: bool = v2.clone() > v11.clone();
                                                if v41 {
                                                    1i32
                                                } else {
                                                    0i32
                                                }
                                            };
                                            let mut v44: bool = v43 == 1i32;
                                            v44
                                        }
                                    };
                                    if v46 {
                                        let mut v47: Rc<UH1> = merge_newest_25(v10.clone(), v1.clone());
                                        Rc::new(UH1::UH1_Cons(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v47.clone()))
                                    } else {
                                        let mut v49: Rc<UH1> = merge_newest_25(v0.clone(), v19.clone());
                                        Rc::new(UH1::UH1_Cons(v11.clone(), v12.clone(), v13.clone(), v14.clone(), v15.clone(), v16.clone(), v17.clone(), v18.clone(), v49.clone()))
                                    }
                                }
                                _ => unreachable!(),
                            }
                        }
                        _ => unreachable!(),
                    }
                }
            }
        }
    }
}
fn halves_26(mut v0: Rc<UH1>) -> (Rc<UH1>, Rc<UH1>) {
    match &*v0 {
        UH1::UH1_Cons(v1, v2, v3, v4, v5, v6, v7, v8, v9) => {
            let mut v1: Rc<str> = v1.clone();
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH2> = v6.clone();
            let mut v7: Rc<UH3> = v7.clone();
            let mut v8: Rc<UH4> = v8.clone();
            let mut v9: Rc<UH1> = v9.clone();
            match &*v9 {
                UH1::UH1_Cons(v10, v11, v12, v13, v14, v15, v16, v17, v18) => {
                    let mut v10: Rc<str> = v10.clone();
                    let mut v11: Rc<str> = v11.clone();
                    let mut v12: Rc<str> = v12.clone();
                    let mut v13: Rc<str> = v13.clone();
                    let mut v14: Rc<str> = v14.clone();
                    let mut v15: Rc<UH2> = v15.clone();
                    let mut v16: Rc<UH3> = v16.clone();
                    let mut v17: Rc<UH4> = v17.clone();
                    let mut v18: Rc<UH1> = v18.clone();
                    let (mut v19, mut v20): (Rc<UH1>, Rc<UH1>) = halves_26(v18.clone());
                    let mut v21: Rc<UH1> = Rc::new(UH1::UH1_Cons(v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v19.clone()));
                    let mut v22: Rc<UH1> = Rc::new(UH1::UH1_Cons(v10.clone(), v11.clone(), v12.clone(), v13.clone(), v14.clone(), v15.clone(), v16.clone(), v17.clone(), v20.clone()));
                    (v21.clone(), v22.clone())
                }
                _ => {
                    let mut v23: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
                    (v0.clone(), v23.clone())
                }
            }
        }
        _ => {
            let mut v26: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
            (v0.clone(), v26.clone())
        }
    }
}
fn newest_first_24(mut v0: Rc<UH1>) -> Rc<UH1> {
    match &*v0 {
        UH1::UH1_Cons(v1, v2, v3, v4, v5, v6, v7, v8, v9) => {
            let mut v1: Rc<str> = v1.clone();
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH2> = v6.clone();
            let mut v7: Rc<UH3> = v7.clone();
            let mut v8: Rc<UH4> = v8.clone();
            let mut v9: Rc<UH1> = v9.clone();
            match &*v9 {
                UH1::UH1_Nil => {
                    v0.clone()
                }
                _ => {
                    let (mut v10, mut v11): (Rc<UH1>, Rc<UH1>) = halves_26(v0.clone());
                    let mut v12: Rc<UH1> = newest_first_24(v10.clone());
                    let mut v13: Rc<UH1> = newest_first_24(v11.clone());
                    merge_newest_25(v12.clone(), v13.clone())
                }
            }
        }
        UH1::UH1_Nil => {
            v0.clone()
        }
    }
}
fn method28(mut v0: Rc<str>, mut v1: Rc<UH8>, mut v2: US3) -> US3 {
    match &*v1 {
        UH8::UH8_Cons(v3, v4, v5) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: i32 = *v4;
            let mut v5: Rc<UH8> = v5.clone();
            let mut v6: US3 = method28(v0.clone(), v5.clone(), v2.clone());
            let mut v7: bool = v3.clone() == v0.clone();
            if v7 {
                US3::US3_Some(v3.clone(), v4)
            } else {
                v6.clone()
            }
        }
        UH8::UH8_Nil => {
            v2.clone()
        }
    }
}
fn method29(mut v0: Rc<str>, mut v1: Rc<UH8>, mut v2: Rc<UH8>) -> Rc<UH8> {
    match &*v1 {
        UH8::UH8_Cons(v3, v4, v5) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: i32 = *v4;
            let mut v5: Rc<UH8> = v5.clone();
            let mut v6: Rc<UH8> = method29(v0.clone(), v5.clone(), v2.clone());
            let mut v7: bool = v3.clone() == v0.clone();
            let mut v8: bool = v7 != true;
            if v8 {
                Rc::new(UH8::UH8_Cons(v3.clone(), v4, v6.clone()))
            } else {
                v6.clone()
            }
        }
        UH8::UH8_Nil => {
            v2.clone()
        }
    }
}
fn method27(mut v0: i32, mut v1: Rc<UH1>, mut v2: Rc<UH8>, mut v3: Rc<UH1>) -> (Rc<UH8>, Rc<UH1>) {
    let (mut v37, mut v38): (Rc<UH8>, Rc<UH1>) = match &*v1 {
        UH1::UH1_Cons(v4, v5, v6, v7, v8, v9, v10, v11, v12) => {
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<str> = v8.clone();
            let mut v9: Rc<UH2> = v9.clone();
            let mut v10: Rc<UH3> = v10.clone();
            let mut v11: Rc<UH4> = v11.clone();
            let mut v12: Rc<UH1> = v12.clone();
            let mut v13: US3 = US3::US3_None;
            let mut v14: US3 = method28(v6.clone(), v2.clone(), v13.clone());
            let mut v18: i32 = match &v14 {
                US3::US3_None => {
                    0i32
                }
                US3::US3_Some(v15, v16) => {
                    let mut v15: Rc<str> = v15.clone();
                    let mut v16: i32 = *v16;
                    v16
                }
            };
            let mut v19: bool = v18 >= v0;
            let (mut v31, mut v32): (Rc<UH8>, Rc<UH1>) = if v19 {
                (v2.clone(), v3.clone())
            } else {
                let mut v20: US3 = US3::US3_None;
                let mut v21: US3 = method28(v6.clone(), v2.clone(), v20.clone());
                let mut v25: i32 = match &v21 {
                    US3::US3_None => {
                        0i32
                    }
                    US3::US3_Some(v22, v23) => {
                        let mut v22: Rc<str> = v22.clone();
                        let mut v23: i32 = *v23;
                        v23
                    }
                };
                let mut v26: i32 = v25.wrapping_add(1i32);
                let mut v27: Rc<UH8> = { thread_local!{ static CASE: Rc<UH8> = Rc::new(UH8::UH8_Nil); } CASE.with(|case| case.clone()) };
                let mut v28: Rc<UH8> = method29(v6.clone(), v2.clone(), v27.clone());
                let mut v29: Rc<UH8> = Rc::new(UH8::UH8_Cons(v6.clone(), v26, v28.clone()));
                let mut v30: Rc<UH1> = Rc::new(UH1::UH1_Cons(v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v3.clone()));
                (v29.clone(), v30.clone())
            };
            method27(v0, v12.clone(), v31.clone(), v32.clone())
        }
        _ => {
            let (mut v35, mut v36): (Rc<UH8>, Rc<UH1>) = match &*v1 {
                UH1::UH1_Nil => {
                    (v2.clone(), v3.clone())
                }
                _ => unreachable!(),
            };
            (v35.clone(), v36.clone())
        }
    };
    (v37.clone(), v38.clone())
}
fn method30(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<str> = v3.clone();
                let mut v4: Rc<str> = v4.clone();
                let mut v5: Rc<str> = v5.clone();
                let mut v6: Rc<str> = v6.clone();
                let mut v7: Rc<UH2> = v7.clone();
                let mut v8: Rc<UH3> = v8.clone();
                let mut v9: Rc<UH4> = v9.clone();
                let mut v10: Rc<UH1> = v10.clone();
                let mut v11: Rc<UH1> = Rc::new(UH1::UH1_Cons(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v1.clone()));
                (v0, v1) = (v10.clone(), v11.clone());
                continue;
            }
            UH1::UH1_Nil => {
                return v1.clone();
            }
        }
    }
}
fn selected_22(mut v0: i32, mut v1: i32, mut v2: Rc<UH1>) -> Rc<UH1> {
    let mut v3: Rc<UH1> = newest_first_24(v2.clone());
    let mut v4: bool = v1 <= 0i32;
    let mut v11: Rc<UH1> = if v4 {
        v3.clone()
    } else {
        let mut v5: Rc<UH8> = { thread_local!{ static CASE: Rc<UH8> = Rc::new(UH8::UH8_Nil); } CASE.with(|case| case.clone()) };
        let mut v6: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let (mut v7, mut v8): (Rc<UH8>, Rc<UH1>) = method27(v1, v3.clone(), v5.clone(), v6.clone());
        let mut v9: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        method30(v8.clone(), v9.clone())
    };
    go_23(v0, v11.clone())
}
fn method32(mut v0: Rc<UH4>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH4::UH4_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH4> = v3.clone();
            let mut v4: Rc<UH4> = method32(v3.clone(), v1.clone());
            Rc::new(UH4::UH4_Cons(v2.clone(), v4.clone()))
        }
        UH4::UH4_Nil => {
            v1.clone()
        }
    }
}
fn method34(mut v0: Rc<str>, mut v1: Rc<UH1>, mut v2: US4) -> US4 {
    match &*v1 {
        UH1::UH1_Cons(v3, v4, v5, v6, v7, v8, v9, v10, v11) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<UH2> = v8.clone();
            let mut v9: Rc<UH3> = v9.clone();
            let mut v10: Rc<UH4> = v10.clone();
            let mut v11: Rc<UH1> = v11.clone();
            let mut v12: US4 = method34(v0.clone(), v11.clone(), v2.clone());
            let mut v13: bool = v3.clone() == v0.clone();
            if v13 {
                US4::US4_Some(v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone())
            } else {
                v12.clone()
            }
        }
        UH1::UH1_Nil => {
            v2.clone()
        }
    }
}
fn method37(mut v0: Rc<UH3>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match &*v0 {
            UH3::UH3_Cons(v2, v3, v4, v5) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<str> = v3.clone();
                let mut v4: Rc<str> = v4.clone();
                let mut v5: Rc<UH3> = v5.clone();
                let mut v6: bool = v3.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v8: Rc<str> = if v6 {
                    v1.clone()
                } else {
                    let mut v7: Rc<str> = Rc::<str>::from(v1.replace(&*v2, &*v3));
                    v7.clone()
                };
                (v0, v1) = (v5.clone(), v8.clone());
                continue;
            }
            UH3::UH3_Nil => {
                return v1.clone();
            }
        }
    }
}
fn shown_text_36(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<UH2>, mut v6: Rc<UH3>, mut v7: Rc<UH4>) -> Rc<str> {
    let mut v8: Rc<str> = method37(v6.clone(), v4.clone());
    let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
    let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
    let mut v11: Rc<str> = Rc::<str>::from(v8.replace(&*v9, &*v10));
    let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let mut v13: Rc<str> = Rc::<str>::from(v11.replace(&*v12, &*v10));
    let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
    let mut v15: Rc<str> = Rc::<str>::from(v13.replace(&*v14, &*v10));
    v15.clone()
}
fn render_post_35(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<UH2>, mut v6: Rc<UH3>, mut v7: Rc<UH4>) -> Rc<str> {
    let mut v8: i32 = (v3.clone().len() as i32);
    let mut v9: bool = v8 < 16i32;
    let mut v15: Rc<str> = if v9 {
        v3.clone()
    } else {
        let mut v10: Rc<str> = string_slice(&v3.clone(), 0i32 as i64, 9i32 as i64);
        let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
        let mut v12: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v11));
        let mut v13: Rc<str> = string_slice(&v3.clone(), 11i32 as i64, 15i32 as i64);
        let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v13));
        v14.clone()
    };
    let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  @"); } LIT.with(|lit| lit.clone()) };
    let mut v17: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v16));
    let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v2));
    let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  "); } LIT.with(|lit| lit.clone()) };
    let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v19));
    let mut v21: Rc<str> = shown_text_36(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone());
    let mut v22: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v21));
    v22.clone()
}
fn method41(mut v0: i32, mut v1: i32) -> Rc<UH9> {
    let mut v2: bool = v1 < v0;
    if v2 {
        let mut v3: i32 = v1.wrapping_add(1i32);
        let mut v4: Rc<UH9> = method41(v0, v3);
        Rc::new(UH9::UH9_Cons(v1, v4.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH9> = Rc::new(UH9::UH9_Nil); } CASE.with(|case| case.clone()) }
    }
}
fn method42(mut v0: Rc<UH9>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match &*v0 {
            UH9::UH9_Cons(v2, v3) => {
                let mut v2: i32 = *v2;
                let mut v3: Rc<UH9> = v3.clone();
                let mut v4: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  "); } LIT.with(|lit| lit.clone()) };
                let mut v5: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v4));
                (v0, v1) = (v3.clone(), v5.clone());
                continue;
            }
            UH9::UH9_Nil => {
                return v1.clone();
            }
        }
    }
}
fn method40(mut v0: i32, mut v1: Rc<UH4>, mut v2: Rc<UH4>) -> Rc<UH4> {
    match &*v1 {
        UH4::UH4_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH4> = v4.clone();
            let mut v5: Rc<UH4> = method40(v0, v4.clone(), v2.clone());
            let mut v6: i32 = 0i32;
            let mut v7: Rc<UH9> = method41(v0, v6);
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v9: Rc<str> = method42(v7.clone(), v8.clone());
            let mut v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v3));
            Rc::new(UH4::UH4_Cons(v10.clone(), v5.clone()))
        }
        UH4::UH4_Nil => {
            v2.clone()
        }
    }
}
fn method44(mut v0: Rc<str>, mut v1: Rc<UH5>, mut v2: US5) -> US5 {
    match &*v1 {
        UH5::UH5_Cons(v3, v4, v5, v6) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH5> = v6.clone();
            let mut v7: US5 = method44(v0.clone(), v6.clone(), v2.clone());
            let mut v8: bool = v3.clone() == v0.clone();
            if v8 {
                US5::US5_Some(v3.clone(), v4.clone(), v5.clone())
            } else {
                v7.clone()
            }
        }
        UH5::UH5_Nil => {
            v2.clone()
        }
    }
}
fn method43(mut v0: Rc<UH1>, mut v1: Rc<UH5>, mut v2: Rc<UH6>, mut v3: Rc<UH4>, mut v4: Rc<UH4>) -> Rc<UH4> {
    match &*v3 {
        UH4::UH4_Cons(v5, v6) => {
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH4> = v6.clone();
            let mut v7: Rc<UH4> = method43(v0.clone(), v1.clone(), v2.clone(), v6.clone(), v4.clone());
            let mut v8: US5 = US5::US5_None;
            let mut v9: US5 = method44(v5.clone(), v1.clone(), v8.clone());
            let mut v34: Rc<str> = match &v9 {
                US5::US5_None => {
                    let mut v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("[media]"); } LIT.with(|lit| lit.clone()) };
                    v32.clone()
                }
                US5::US5_Some(v10, v11, v12) => {
                    let mut v10: Rc<str> = v10.clone();
                    let mut v11: Rc<str> = v11.clone();
                    let mut v12: Rc<str> = v12.clone();
                    let mut v13: bool = v12.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let mut v14: bool = v13 != true;
                    if v14 {
                        let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
                        let mut v16: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v11));
                        let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("] "); } LIT.with(|lit| lit.clone()) };
                        let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v17));
                        let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
                        let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
                        let mut v21: Rc<str> = Rc::<str>::from(v12.replace(&*v19, &*v20));
                        let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                        let mut v23: Rc<str> = Rc::<str>::from(v21.replace(&*v22, &*v20));
                        let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
                        let mut v25: Rc<str> = Rc::<str>::from(v23.replace(&*v24, &*v20));
                        let mut v26: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v25));
                        v26.clone()
                    } else {
                        let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) };
                        let mut v28: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v11));
                        let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) };
                        let mut v30: Rc<str> = Rc::<str>::from(format!("{}{}", v28, v29));
                        v30.clone()
                    }
                }
            };
            Rc::new(UH4::UH4_Cons(v34.clone(), v7.clone()))
        }
        UH4::UH4_Nil => {
            v4.clone()
        }
    }
}
fn method45(mut v0: Rc<UH3>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3, v4, v5) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH3> = v5.clone();
            let mut v6: Rc<UH3> = method45(v5.clone(), v1.clone());
            let mut v7: bool = v4.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v8: bool = v7 != true;
            if v8 {
                Rc::new(UH3::UH3_Cons(v2.clone(), v3.clone(), v4.clone(), v6.clone()))
            } else {
                v6.clone()
            }
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn method46(mut v0: Rc<UH3>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3, v4, v5) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH3> = v5.clone();
            let mut v6: Rc<UH4> = method46(v5.clone(), v1.clone());
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
            let mut v9: Rc<str> = Rc::<str>::from(v4.replace(&*v7, &*v8));
            let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            let mut v11: Rc<str> = Rc::<str>::from(v9.replace(&*v10, &*v8));
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
            let mut v13: Rc<str> = Rc::<str>::from(v11.replace(&*v12, &*v8));
            let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("[link] "); } LIT.with(|lit| lit.clone()) };
            let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v13));
            Rc::new(UH4::UH4_Cons(v15.clone(), v6.clone()))
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn hint_lines_39(mut v0: Rc<UH1>, mut v1: Rc<UH5>, mut v2: Rc<UH6>, mut v3: i32, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: Rc<str>, mut v9: Rc<UH2>, mut v10: Rc<UH3>, mut v11: Rc<UH4>) -> Rc<UH4> {
    let mut v12: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v13: Rc<UH4> = method43(v0.clone(), v1.clone(), v2.clone(), v11.clone(), v12.clone());
    let mut v14: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let mut v15: Rc<UH3> = method45(v10.clone(), v14.clone());
    let mut v16: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v17: Rc<UH4> = method46(v15.clone(), v16.clone());
    let mut v18: Rc<UH4> = method32(v13.clone(), v17.clone());
    let mut v19: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    method40(v3, v18.clone(), v19.clone())
}
fn method50(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<UH2>, mut v6: Rc<UH3>, mut v7: Rc<UH4>, mut v8: Rc<UH6>, mut v9: US6) -> US6 {
    match &*v8 {
        UH6::UH6_Cons(v10, v11, v12) => {
            let mut v10: Rc<str> = v10.clone();
            let mut v11: Rc<str> = v11.clone();
            let mut v12: Rc<UH6> = v12.clone();
            let mut v13: US6 = method50(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v12.clone(), v9.clone());
            let mut v14: bool = v10.clone() == v1.clone();
            if v14 {
                US6::US6_Some(v10.clone(), v11.clone())
            } else {
                v13.clone()
            }
        }
        UH6::UH6_Nil => {
            v9.clone()
        }
    }
}
fn ref_line_49(mut v0: Rc<UH1>, mut v1: Rc<UH5>, mut v2: Rc<UH6>, mut v3: i32, mut v4: US0, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: Rc<str>, mut v9: Rc<str>, mut v10: Rc<UH2>, mut v11: Rc<UH3>, mut v12: Rc<UH4>) -> Rc<str> {
    let mut v13: i32 = 0i32;
    let mut v14: Rc<UH9> = method41(v3, v13);
    let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v16: Rc<str> = method42(v14.clone(), v15.clone());
    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("> "); } LIT.with(|lit| lit.clone()) };
    let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v17));
    let mut v24: Rc<str> = match &v4 {
        US0::US0_Quoted => {
            let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
            v19.clone()
        }
        US0::US0_RepliedTo => {
            let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replying to"); } LIT.with(|lit| lit.clone()) };
            v20.clone()
        }
        US0::US0_Reposted => {
            let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposted"); } LIT.with(|lit| lit.clone()) };
            v21.clone()
        }
    };
    let mut v25: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v24));
    let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" @"); } LIT.with(|lit| lit.clone()) };
    let mut v27: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v26));
    let mut v28: bool = v7.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v29: bool = v28 != true;
    let mut v38: Rc<str> = if v29 {
        v7.clone()
    } else {
        let mut v30: US6 = US6::US6_None;
        let mut v31: US6 = method50(v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v12.clone(), v2.clone(), v30.clone());
        match &v31 {
            US6::US6_None => {
                let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("user "); } LIT.with(|lit| lit.clone()) };
                let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v6));
                v35.clone()
            }
            US6::US6_Some(v32, v33) => {
                let mut v32: Rc<str> = v32.clone();
                let mut v33: Rc<str> = v33.clone();
                v33.clone()
            }
        }
    };
    let mut v39: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v38));
    let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
    let mut v41: Rc<str> = Rc::<str>::from(format!("{}{}", v39, v40));
    let mut v42: Rc<str> = shown_text_36(v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v12.clone());
    let mut v43: Rc<str> = Rc::<str>::from(format!("{}{}", v41, v42));
    v43.clone()
}
fn ref_lines_48(mut v0: Rc<UH1>, mut v1: Rc<UH5>, mut v2: Rc<UH6>, mut v3: i32, mut v4: bool, mut v5: i32, mut v6: US0, mut v7: Rc<str>) -> Rc<UH4> {
    let mut v8: US4 = US4::US4_None;
    let mut v9: US4 = method34(v7.clone(), v0.clone(), v8.clone());
    match &v9 {
        US4::US4_None => {
            let mut v22: i32 = v5.wrapping_add(1i32);
            let mut v23: i32 = 0i32;
            let mut v24: Rc<UH9> = method41(v22, v23);
            let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v26: Rc<str> = method42(v24.clone(), v25.clone());
            let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("> "); } LIT.with(|lit| lit.clone()) };
            let mut v28: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v27));
            let mut v34: Rc<str> = match &v6 {
                US0::US0_Quoted => {
                    let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
                    v29.clone()
                }
                US0::US0_RepliedTo => {
                    let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replying to"); } LIT.with(|lit| lit.clone()) };
                    v30.clone()
                }
                US0::US0_Reposted => {
                    let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposted"); } LIT.with(|lit| lit.clone()) };
                    v31.clone()
                }
            };
            let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v28, v34));
            let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" a post not loaded ("); } LIT.with(|lit| lit.clone()) };
            let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v36));
            let mut v38: Rc<str> = Rc::<str>::from(format!("{}{}", v37, v7));
            let mut v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(")"); } LIT.with(|lit| lit.clone()) };
            let mut v40: Rc<str> = Rc::<str>::from(format!("{}{}", v38, v39));
            let mut v41: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
            Rc::new(UH4::UH4_Cons(v40.clone(), v41.clone()))
        }
        US4::US4_Some(v10, v11, v12, v13, v14, v15, v16, v17) => {
            let mut v10: Rc<str> = v10.clone();
            let mut v11: Rc<str> = v11.clone();
            let mut v12: Rc<str> = v12.clone();
            let mut v13: Rc<str> = v13.clone();
            let mut v14: Rc<str> = v14.clone();
            let mut v15: Rc<UH2> = v15.clone();
            let mut v16: Rc<UH3> = v16.clone();
            let mut v17: Rc<UH4> = v17.clone();
            let mut v18: i32 = v5.wrapping_add(1i32);
            let mut v19: Rc<str> = ref_line_49(v0.clone(), v1.clone(), v2.clone(), v18, v6.clone(), v10.clone(), v11.clone(), v12.clone(), v13.clone(), v14.clone(), v15.clone(), v16.clone(), v17.clone());
            let mut v20: Rc<UH4> = post_lines_38(v0.clone(), v1.clone(), v2.clone(), v3, v4, v18, v10.clone(), v11.clone(), v12.clone(), v13.clone(), v14.clone(), v15.clone(), v16.clone(), v17.clone());
            Rc::new(UH4::UH4_Cons(v19.clone(), v20.clone()))
        }
    }
}
fn method47(mut v0: Rc<UH1>, mut v1: Rc<UH5>, mut v2: Rc<UH6>, mut v3: i32, mut v4: bool, mut v5: i32, mut v6: Rc<UH2>, mut v7: Rc<UH4>) -> Rc<UH4> {
    match &*v6 {
        UH2::UH2_Cons(v8, v9, v10) => {
            let mut v8: US0 = v8.clone();
            let mut v9: Rc<str> = v9.clone();
            let mut v10: Rc<UH2> = v10.clone();
            let mut v11: Rc<UH4> = method47(v0.clone(), v1.clone(), v2.clone(), v3, v4, v5, v10.clone(), v7.clone());
            let mut v12: Rc<UH4> = ref_lines_48(v0.clone(), v1.clone(), v2.clone(), v3, v4, v5, v8.clone(), v9.clone());
            method32(v12.clone(), v11.clone())
        }
        UH2::UH2_Nil => {
            v7.clone()
        }
    }
}
fn post_lines_38(mut v0: Rc<UH1>, mut v1: Rc<UH5>, mut v2: Rc<UH6>, mut v3: i32, mut v4: bool, mut v5: i32, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: Rc<str>, mut v9: Rc<str>, mut v10: Rc<str>, mut v11: Rc<UH2>, mut v12: Rc<UH3>, mut v13: Rc<UH4>) -> Rc<UH4> {
    let mut v17: Rc<UH4> = if v4 {
        let mut v14: i32 = v5.wrapping_add(1i32);
        hint_lines_39(v0.clone(), v1.clone(), v2.clone(), v14, v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v12.clone(), v13.clone())
    } else {
        { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) }
    };
    let mut v18: bool = v5 >= v3;
    if v18 {
        v17.clone()
    } else {
        let mut v19: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
        let mut v20: Rc<UH4> = method47(v0.clone(), v1.clone(), v2.clone(), v3, v4, v5, v11.clone(), v19.clone());
        method32(v17.clone(), v20.clone())
    }
}
fn entry_lines_33(mut v0: Rc<UH1>, mut v1: Rc<UH5>, mut v2: Rc<UH6>, mut v3: i32, mut v4: bool, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: Rc<str>, mut v9: Rc<str>, mut v10: Rc<UH2>, mut v11: Rc<UH3>, mut v12: Rc<UH4>) -> Rc<UH4> {
    let mut v22: US2 = match &*v10 {
        UH2::UH2_Cons(v13, v14, v15) => {
            let mut v13: US0 = v13.clone();
            let mut v14: Rc<str> = v14.clone();
            let mut v15: Rc<UH2> = v15.clone();
            match &*v15 {
                UH2::UH2_Nil => {
                    match &v13 {
                        US0::US0_Reposted => {
                            US2::US2_Some(v14.clone())
                        }
                        _ => {
                            US2::US2_None
                        }
                    }
                }
                _ => {
                    US2::US2_None
                }
            }
        }
        _ => {
            US2::US2_None
        }
    };
    let mut v30: US4 = match &v22 {
        US2::US2_Some(v23) => {
            let mut v23: Rc<str> = v23.clone();
            let mut v24: bool = v3 > 0i32;
            if v24 {
                let mut v25: US4 = US4::US4_None;
                method34(v23.clone(), v0.clone(), v25.clone())
            } else {
                US4::US4_None
            }
        }
        _ => {
            US4::US4_None
        }
    };
    match &v30 {
        US4::US4_None => {
            let mut v71: Rc<str> = render_post_35(v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v12.clone());
            let mut v72: i32 = 0i32;
            let mut v73: Rc<UH4> = post_lines_38(v0.clone(), v1.clone(), v2.clone(), v3, v4, v72, v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v12.clone());
            Rc::new(UH4::UH4_Cons(v71.clone(), v73.clone()))
        }
        US4::US4_Some(v31, v32, v33, v34, v35, v36, v37, v38) => {
            let mut v31: Rc<str> = v31.clone();
            let mut v32: Rc<str> = v32.clone();
            let mut v33: Rc<str> = v33.clone();
            let mut v34: Rc<str> = v34.clone();
            let mut v35: Rc<str> = v35.clone();
            let mut v36: Rc<UH2> = v36.clone();
            let mut v37: Rc<UH3> = v37.clone();
            let mut v38: Rc<UH4> = v38.clone();
            let mut v39: i32 = (v8.clone().len() as i32);
            let mut v40: bool = v39 < 16i32;
            let mut v46: Rc<str> = if v40 {
                v8.clone()
            } else {
                let mut v41: Rc<str> = string_slice(&v8.clone(), 0i32 as i64, 9i32 as i64);
                let mut v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
                let mut v43: Rc<str> = Rc::<str>::from(format!("{}{}", v41, v42));
                let mut v44: Rc<str> = string_slice(&v8.clone(), 11i32 as i64, 15i32 as i64);
                let mut v45: Rc<str> = Rc::<str>::from(format!("{}{}", v43, v44));
                v45.clone()
            };
            let mut v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  @"); } LIT.with(|lit| lit.clone()) };
            let mut v48: Rc<str> = Rc::<str>::from(format!("{}{}", v46, v47));
            let mut v49: Rc<str> = Rc::<str>::from(format!("{}{}", v48, v7));
            let mut v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("  reposted @"); } LIT.with(|lit| lit.clone()) };
            let mut v51: Rc<str> = Rc::<str>::from(format!("{}{}", v49, v50));
            let mut v52: bool = v33.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v53: bool = v52 != true;
            let mut v62: Rc<str> = if v53 {
                v33.clone()
            } else {
                let mut v54: US6 = US6::US6_None;
                let mut v55: US6 = method50(v31.clone(), v32.clone(), v33.clone(), v34.clone(), v35.clone(), v36.clone(), v37.clone(), v38.clone(), v2.clone(), v54.clone());
                match &v55 {
                    US6::US6_None => {
                        let mut v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("user "); } LIT.with(|lit| lit.clone()) };
                        let mut v59: Rc<str> = Rc::<str>::from(format!("{}{}", v58, v32));
                        v59.clone()
                    }
                    US6::US6_Some(v56, v57) => {
                        let mut v56: Rc<str> = v56.clone();
                        let mut v57: Rc<str> = v57.clone();
                        v57.clone()
                    }
                }
            };
            let mut v63: Rc<str> = Rc::<str>::from(format!("{}{}", v51, v62));
            let mut v64: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let mut v65: Rc<str> = Rc::<str>::from(format!("{}{}", v63, v64));
            let mut v66: Rc<str> = shown_text_36(v31.clone(), v32.clone(), v33.clone(), v34.clone(), v35.clone(), v36.clone(), v37.clone(), v38.clone());
            let mut v67: Rc<str> = Rc::<str>::from(format!("{}{}", v65, v66));
            let mut v68: i32 = 0i32;
            let mut v69: Rc<UH4> = post_lines_38(v0.clone(), v1.clone(), v2.clone(), v3, v4, v68, v31.clone(), v32.clone(), v33.clone(), v34.clone(), v35.clone(), v36.clone(), v37.clone(), v38.clone());
            Rc::new(UH4::UH4_Cons(v67.clone(), v69.clone()))
        }
    }
}
fn method31(mut v0: Rc<UH1>, mut v1: Rc<UH5>, mut v2: Rc<UH6>, mut v3: i32, mut v4: bool, mut v5: Rc<UH1>, mut v6: Rc<UH4>) -> Rc<UH4> {
    match &*v5 {
        UH1::UH1_Cons(v7, v8, v9, v10, v11, v12, v13, v14, v15) => {
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<str> = v8.clone();
            let mut v9: Rc<str> = v9.clone();
            let mut v10: Rc<str> = v10.clone();
            let mut v11: Rc<str> = v11.clone();
            let mut v12: Rc<UH2> = v12.clone();
            let mut v13: Rc<UH3> = v13.clone();
            let mut v14: Rc<UH4> = v14.clone();
            let mut v15: Rc<UH1> = v15.clone();
            let mut v16: Rc<UH4> = method31(v0.clone(), v1.clone(), v2.clone(), v3, v4, v15.clone(), v6.clone());
            let mut v17: Rc<UH4> = entry_lines_33(v0.clone(), v1.clone(), v2.clone(), v3, v4, v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v12.clone(), v13.clone(), v14.clone());
            method32(v17.clone(), v16.clone())
        }
        UH1::UH1_Nil => {
            v6.clone()
        }
    }
}
fn method51(mut v0: Rc<UH4>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH4::UH4_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH4> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method51(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH4::UH4_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn method52(mut v0: Rc<UH1>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH1::UH1_Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<str> = v3.clone();
                let mut v4: Rc<str> = v4.clone();
                let mut v5: Rc<str> = v5.clone();
                let mut v6: Rc<str> = v6.clone();
                let mut v7: Rc<UH2> = v7.clone();
                let mut v8: Rc<UH3> = v8.clone();
                let mut v9: Rc<UH4> = v9.clone();
                let mut v10: Rc<UH1> = v10.clone();
                let mut v11: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v10.clone(), v11);
                continue;
            }
            UH1::UH1_Nil => {
                return v1;
            }
        }
    }
}
fn rendered_0(mut v0: Rc<str>, mut v1: i32, mut v2: i32, mut v3: i32, mut v4: bool) -> (Rc<str>, i32) {
    let mut v5: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v0).unwrap_or_default();
    let mut v6: i32 = v5.as_array().map_or(0, |a| a.len()) as i32;
    let mut v7: i32 = v6.wrapping_sub(1i32);
    let mut v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v9: Rc<UH0> = from_1(v5.clone(), v7, v8.clone());
    let mut v10: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v11: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v12: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
    let mut v13: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
    let (mut v14, mut v15, mut v16, mut v17): (Rc<UH1>, Rc<UH1>, Rc<UH5>, Rc<UH6>) = method2(v9.clone(), v10.clone(), v11.clone(), v12.clone(), v13.clone());
    let mut v18: Rc<UH1> = selected_22(v1, v2, v14.clone());
    let mut v19: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v20: Rc<UH4> = method31(v15.clone(), v16.clone(), v17.clone(), v3, v4, v18.clone(), v19.clone());
    let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v22, mut v23): (Rc<str>, Rc<str>) = method51(v20.clone(), v21.clone());
    let mut v24: i32 = 0i32;
    let mut v25: i32 = method52(v18.clone(), v24);
    (v22.clone(), v25)
}
fn closure0() -> Rc<dyn Fn(Rc<str>, i32, i32, i32, bool) -> (Rc<str>, i32)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32, i32, i32, bool) -> (Rc<str>, i32)> = Rc::new(move |mut v0: Rc<str>, mut v1: i32, mut v2: i32, mut v3: i32, mut v4: bool| -> (Rc<str>, i32) {
        rendered_0(v0.clone(), v1, v2, v3, v4)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_view(v0: &str, v1: i32, v2: i32, v3: i32, v4: bool) -> (Rc<str>, i32) {
    closure0()(Rc::<str>::from(v0), v1, v2, v3, v4)
}
