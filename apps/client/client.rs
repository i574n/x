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
    UH0_Cons(Rc<str>, Rc<UH0>),
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
enum US1 {
    US1_Accounts(Rc<UH0>),
    US1_FollowingOf(Rc<str>),
}
impl US1 {
    fn tag(&self) -> i32 {
        match self {
            US1::US1_Accounts(..) => 0,
            US1::US1_FollowingOf(..) => 1,
        }
    }
}
impl Default for US1 {
    fn default() -> Self {
        US1::US1_Accounts(<Rc<UH0>>::default())
    }
}
#[derive(Clone)]
enum US2 {
    US2_AtMost(i32),
    US2_AllFollowing,
}
impl US2 {
    fn tag(&self) -> i32 {
        match self {
            US2::US2_AtMost(..) => 0,
            US2::US2_AllFollowing => 1,
        }
    }
}
impl Default for US2 {
    fn default() -> Self {
        US2::US2_AtMost(<i32>::default())
    }
}
#[derive(Clone)]
enum US0 {
    US0_ShowTimeline(US1, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool),
    US0_PublishPost(Rc<str>),
    US0_RemovePost(Rc<str>),
    US0_ShowHelp,
    US0_Rejected(Rc<str>),
}
impl US0 {
    fn tag(&self) -> i32 {
        match self {
            US0::US0_ShowTimeline(..) => 0,
            US0::US0_PublishPost(..) => 1,
            US0::US0_RemovePost(..) => 2,
            US0::US0_ShowHelp => 3,
            US0::US0_Rejected(..) => 4,
        }
    }
}
impl Default for US0 {
    fn default() -> Self {
        US0::US0_ShowTimeline(<US1>::default(), <i32>::default(), <i32>::default(), <i32>::default(), <US2>::default(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, <bool>::default(), <bool>::default(), <i32>::default(), <bool>::default())
    }
}
#[derive(Clone)]
enum US3 {
    US3_Some(Rc<str>),
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
        US3::US3_Some({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
#[derive(Clone)]
enum US4 {
    US4_Ok(Rc<UH0>, US3, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool),
    US4_Error(Rc<str>),
}
impl US4 {
    fn tag(&self) -> i32 {
        match self {
            US4::US4_Ok(..) => 0,
            US4::US4_Error(..) => 1,
        }
    }
}
impl Default for US4 {
    fn default() -> Self {
        US4::US4_Ok(<Rc<UH0>>::default(), <US3>::default(), <i32>::default(), <i32>::default(), <i32>::default(), <US2>::default(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, <bool>::default(), <bool>::default(), <i32>::default(), <bool>::default())
    }
}
#[derive(Clone)]
enum US6 {
    US6_NoReplies,
    US6_NoReposts,
    US6_Originals,
    US6_Hints,
}
impl US6 {
    fn tag(&self) -> i32 {
        match self {
            US6::US6_NoReplies => 0,
            US6::US6_NoReposts => 1,
            US6::US6_Originals => 2,
            US6::US6_Hints => 3,
        }
    }
}
impl Default for US6 {
    fn default() -> Self {
        US6::US6_NoReplies
    }
}
#[derive(Clone)]
enum US5 {
    US5_Some(US6),
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
        US5::US5_Some(<US6>::default())
    }
}
#[derive(Clone)]
enum US8 {
    US8_PerAccount,
    US8_Limit,
    US8_PerAuthor,
    US8_MaxFollowing,
    US8_Following,
    US8_Since,
    US8_Until,
    US8_Depth,
}
impl US8 {
    fn tag(&self) -> i32 {
        match self {
            US8::US8_PerAccount => 0,
            US8::US8_Limit => 1,
            US8::US8_PerAuthor => 2,
            US8::US8_MaxFollowing => 3,
            US8::US8_Following => 4,
            US8::US8_Since => 5,
            US8::US8_Until => 6,
            US8::US8_Depth => 7,
        }
    }
}
impl Default for US8 {
    fn default() -> Self {
        US8::US8_PerAccount
    }
}
#[derive(Clone)]
enum US7 {
    US7_Some(Rc<str>, US8),
    US7_None,
}
impl US7 {
    fn tag(&self) -> i32 {
        match self {
            US7::US7_Some(..) => 0,
            US7::US7_None => 1,
        }
    }
}
impl Default for US7 {
    fn default() -> Self {
        US7::US7_Some({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, <US8>::default())
    }
}
#[derive(Clone)]
enum US9 {
    US9_Some(US8),
    US9_None,
}
impl US9 {
    fn tag(&self) -> i32 {
        match self {
            US9::US9_Some(..) => 0,
            US9::US9_None => 1,
        }
    }
}
impl Default for US9 {
    fn default() -> Self {
        US9::US9_Some(<US8>::default())
    }
}
#[derive(Clone)]
enum US10 {
    US10_Switched(US6),
    US10_Valued(US8),
    US10_Plain,
}
impl US10 {
    fn tag(&self) -> i32 {
        match self {
            US10::US10_Switched(..) => 0,
            US10::US10_Valued(..) => 1,
            US10::US10_Plain => 2,
        }
    }
}
impl Default for US10 {
    fn default() -> Self {
        US10::US10_Switched(<US6>::default())
    }
}
#[derive(Clone)]
enum US11 {
    US11_Ok(i32),
    US11_Error(Rc<str>),
}
impl US11 {
    fn tag(&self) -> i32 {
        match self {
            US11::US11_Ok(..) => 0,
            US11::US11_Error(..) => 1,
        }
    }
}
impl Default for US11 {
    fn default() -> Self {
        US11::US11_Ok(<i32>::default())
    }
}
#[derive(Clone)]
enum US12 {
    US12_Some(i32),
    US12_None,
}
impl US12 {
    fn tag(&self) -> i32 {
        match self {
            US12::US12_Some(..) => 0,
            US12::US12_None => 1,
        }
    }
}
impl Default for US12 {
    fn default() -> Self {
        US12::US12_Some(<i32>::default())
    }
}
#[derive(Clone)]
enum US13 {
    US13_Shown,
    US13_ShownHelp,
    US13_BadUsage,
    US13_NoKey,
    US13_ApiFailed,
}
impl US13 {
    fn tag(&self) -> i32 {
        match self {
            US13::US13_Shown => 0,
            US13::US13_ShownHelp => 1,
            US13::US13_BadUsage => 2,
            US13::US13_NoKey => 3,
            US13::US13_ApiFailed => 4,
        }
    }
}
impl Default for US13 {
    fn default() -> Self {
        US13::US13_Shown
    }
}
#[derive(Clone)]
enum US14 {
    US14_HttpStatus(i32, Rc<str>, Rc<str>),
    US14_Transport(Rc<str>, Rc<str>),
    US14_Undecodable(Rc<str>, Rc<str>),
    US14_NoSuchAccount(Rc<str>),
}
impl US14 {
    fn tag(&self) -> i32 {
        match self {
            US14::US14_HttpStatus(..) => 0,
            US14::US14_Transport(..) => 1,
            US14::US14_Undecodable(..) => 2,
            US14::US14_NoSuchAccount(..) => 3,
        }
    }
}
impl Default for US14 {
    fn default() -> Self {
        US14::US14_HttpStatus(<i32>::default(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
#[derive(Clone)]
enum US15 {
    US15_Some(US14),
    US15_None,
}
impl US15 {
    fn tag(&self) -> i32 {
        match self {
            US15::US15_Some(..) => 0,
            US15::US15_None => 1,
        }
    }
}
impl Default for US15 {
    fn default() -> Self {
        US15::US15_Some(<US14>::default())
    }
}
#[derive(Clone)]
enum US16 {
    US16_BearerToken(Rc<str>),
    US16_Signed(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>),
}
impl US16 {
    fn tag(&self) -> i32 {
        match self {
            US16::US16_BearerToken(..) => 0,
            US16::US16_Signed(..) => 1,
        }
    }
}
impl Default for US16 {
    fn default() -> Self {
        US16::US16_BearerToken({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
#[derive(Clone)]
enum US17 {
    US17_CreatePost(Rc<str>),
}
impl US17 {
    fn tag(&self) -> i32 {
        match self {
            US17::US17_CreatePost(..) => 0,
        }
    }
}
impl Default for US17 {
    fn default() -> Self {
        US17::US17_CreatePost({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
#[derive(Clone)]
enum US18 {
    US18_Ok(Rc<str>, Rc<str>),
    US18_Error(US14),
}
impl US18 {
    fn tag(&self) -> i32 {
        match self {
            US18::US18_Ok(..) => 0,
            US18::US18_Error(..) => 1,
        }
    }
}
impl Default for US18 {
    fn default() -> Self {
        US18::US18_Ok({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
#[derive(Clone)]
enum US19 {
    US19_Read,
    US19_Write(Rc<str>),
    US19_Remove,
}
impl US19 {
    fn tag(&self) -> i32 {
        match self {
            US19::US19_Read => 0,
            US19::US19_Write(..) => 1,
            US19::US19_Remove => 2,
        }
    }
}
impl Default for US19 {
    fn default() -> Self {
        US19::US19_Read
    }
}
#[derive(Clone)]
enum US20 {
    US20_Ok(serde_json::Value),
    US20_Error(US14),
}
impl US20 {
    fn tag(&self) -> i32 {
        match self {
            US20::US20_Ok(..) => 0,
            US20::US20_Error(..) => 1,
        }
    }
}
#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<str>, Rc<UH1>),
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
enum US21 {
    US21_DeletePost(Rc<str>),
}
impl US21 {
    fn tag(&self) -> i32 {
        match self {
            US21::US21_DeletePost(..) => 1,
        }
    }
}
impl Default for US21 {
    fn default() -> Self {
        US21::US21_DeletePost({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
#[derive(Clone)]
enum US22 {
    US22_Ok(bool),
    US22_Error(US14),
}
impl US22 {
    fn tag(&self) -> i32 {
        match self {
            US22::US22_Ok(..) => 0,
            US22::US22_Error(..) => 1,
        }
    }
}
impl Default for US22 {
    fn default() -> Self {
        US22::US22_Ok(<bool>::default())
    }
}
#[derive(Clone)]
enum US23 {
    US23_Ok(Rc<UH0>, Rc<UH0>, US15),
    US23_Error(US14),
}
impl US23 {
    fn tag(&self) -> i32 {
        match self {
            US23::US23_Ok(..) => 0,
            US23::US23_Error(..) => 1,
        }
    }
}
impl Default for US23 {
    fn default() -> Self {
        US23::US23_Ok(<Rc<UH0>>::default(), <Rc<UH0>>::default(), <US15>::default())
    }
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(Rc<str>, Rc<str>, Rc<UH2>),
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
enum US24 {
    US24_Quoted,
    US24_RepliedTo,
    US24_Reposted,
}
impl US24 {
    fn tag(&self) -> i32 {
        match self {
            US24::US24_Quoted => 0,
            US24::US24_RepliedTo => 1,
            US24::US24_Reposted => 2,
        }
    }
}
impl Default for US24 {
    fn default() -> Self {
        US24::US24_Quoted
    }
}
#[derive(Clone)]
enum UH4 {
    UH4_Nil,
    UH4_Cons(US24, Rc<str>, Rc<UH4>),
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
enum UH3 {
    UH3_Nil,
    UH3_Cons(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<UH4>, Rc<UH5>, Rc<UH0>, Rc<UH3>),
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
enum UH6 {
    UH6_Nil,
    UH6_Cons(Rc<str>, Rc<str>, Rc<str>, Rc<UH6>),
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
enum US25 {
    US25_PostsOf(Rc<str>, Rc<str>, i32, Rc<str>, Rc<str>, bool, bool, i32, bool),
    US25_PostsById(Rc<UH0>, i32, Rc<str>, Rc<str>, bool, bool, i32, bool),
}
impl US25 {
    fn tag(&self) -> i32 {
        match self {
            US25::US25_PostsOf(..) => 3,
            US25::US25_PostsById(..) => 4,
        }
    }
}
impl Default for US25 {
    fn default() -> Self {
        US25::US25_PostsOf({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, <i32>::default(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, <bool>::default(), <bool>::default(), <i32>::default(), <bool>::default())
    }
}
#[derive(Clone)]
enum US26 {
    US26_Ok(Rc<UH3>, Rc<UH6>, Rc<UH2>, Rc<UH3>, Rc<str>),
    US26_Error(US14),
}
impl US26 {
    fn tag(&self) -> i32 {
        match self {
            US26::US26_Ok(..) => 0,
            US26::US26_Error(..) => 1,
        }
    }
}
impl Default for US26 {
    fn default() -> Self {
        US26::US26_Ok(<Rc<UH3>>::default(), <Rc<UH6>>::default(), <Rc<UH2>>::default(), <Rc<UH3>>::default(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
#[derive(Clone)]
enum UH7 {
    UH7_Nil,
    UH7_Cons(Rc<UH4>, Rc<UH7>),
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
enum US27 {
    US27_Some(US24),
    US27_None,
}
impl US27 {
    fn tag(&self) -> i32 {
        match self {
            US27::US27_Some(..) => 0,
            US27::US27_None => 1,
        }
    }
}
impl Default for US27 {
    fn default() -> Self {
        US27::US27_Some(<US24>::default())
    }
}
#[derive(Clone)]
enum US28 {
    US28_Ok(Rc<UH3>, Rc<UH6>, Rc<UH2>),
    US28_Error(US14),
}
impl US28 {
    fn tag(&self) -> i32 {
        match self {
            US28::US28_Ok(..) => 0,
            US28::US28_Error(..) => 1,
        }
    }
}
impl Default for US28 {
    fn default() -> Self {
        US28::US28_Ok(<Rc<UH3>>::default(), <Rc<UH6>>::default(), <Rc<UH2>>::default())
    }
}
#[derive(Clone)]
enum US29 {
    US29_Some(Rc<str>, Rc<str>),
    US29_None,
}
impl US29 {
    fn tag(&self) -> i32 {
        match self {
            US29::US29_Some(..) => 0,
            US29::US29_None => 1,
        }
    }
}
impl Default for US29 {
    fn default() -> Self {
        US29::US29_Some({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
#[derive(Clone)]
enum US30 {
    US30_UsersNamed(Rc<UH0>),
    US30_UsersById(Rc<UH0>),
}
impl US30 {
    fn tag(&self) -> i32 {
        match self {
            US30::US30_UsersNamed(..) => 0,
            US30::US30_UsersById(..) => 1,
        }
    }
}
impl Default for US30 {
    fn default() -> Self {
        US30::US30_UsersNamed(<Rc<UH0>>::default())
    }
}
#[derive(Clone)]
enum US31 {
    US31_Ok(Rc<UH2>, Rc<UH0>),
    US31_Error(US14),
}
impl US31 {
    fn tag(&self) -> i32 {
        match self {
            US31::US31_Ok(..) => 0,
            US31::US31_Error(..) => 1,
        }
    }
}
impl Default for US31 {
    fn default() -> Self {
        US31::US31_Ok(<Rc<UH2>>::default(), <Rc<UH0>>::default())
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
enum US32 {
    US32_Some(Rc<str>, i32),
    US32_None,
}
impl US32 {
    fn tag(&self) -> i32 {
        match self {
            US32::US32_Some(..) => 0,
            US32::US32_None => 1,
        }
    }
}
impl Default for US32 {
    fn default() -> Self {
        US32::US32_Some({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, <i32>::default())
    }
}
#[derive(Clone)]
enum US33 {
    US33_Some(Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<UH4>, Rc<UH5>, Rc<UH0>),
    US33_None,
}
impl US33 {
    fn tag(&self) -> i32 {
        match self {
            US33::US33_Some(..) => 0,
            US33::US33_None => 1,
        }
    }
}
impl Default for US33 {
    fn default() -> Self {
        US33::US33_Some({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, <Rc<UH4>>::default(), <Rc<UH5>>::default(), <Rc<UH0>>::default())
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
enum US34 {
    US34_Some(Rc<str>, Rc<str>, Rc<str>),
    US34_None,
}
impl US34 {
    fn tag(&self) -> i32 {
        match self {
            US34::US34_Some(..) => 0,
            US34::US34_None => 1,
        }
    }
}
impl Default for US34 {
    fn default() -> Self {
        US34::US34_Some({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
#[derive(Clone)]
enum US35 {
    US35_Ok(Rc<str>, Rc<str>),
    US35_Error(US14),
}
impl US35 {
    fn tag(&self) -> i32 {
        match self {
            US35::US35_Ok(..) => 0,
            US35::US35_Error(..) => 1,
        }
    }
}
impl Default for US35 {
    fn default() -> Self {
        US35::US35_Ok({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
#[derive(Clone)]
enum US36 {
    US36_Ok(Rc<UH2>),
    US36_Error(US14),
}
impl US36 {
    fn tag(&self) -> i32 {
        match self {
            US36::US36_Ok(..) => 0,
            US36::US36_Error(..) => 1,
        }
    }
}
impl Default for US36 {
    fn default() -> Self {
        US36::US36_Ok(<Rc<UH2>>::default())
    }
}
#[derive(Clone)]
enum US37 {
    US37_FollowedBy(Rc<str>, i32, Rc<str>),
}
impl US37 {
    fn tag(&self) -> i32 {
        match self {
            US37::US37_FollowedBy(..) => 2,
        }
    }
}
impl Default for US37 {
    fn default() -> Self {
        US37::US37_FollowedBy({ thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) }, <i32>::default(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
#[derive(Clone)]
enum US38 {
    US38_Ok(Rc<UH2>, Rc<str>),
    US38_Error(US14),
}
impl US38 {
    fn tag(&self) -> i32 {
        match self {
            US38::US38_Ok(..) => 0,
            US38::US38_Error(..) => 1,
        }
    }
}
impl Default for US38 {
    fn default() -> Self {
        US38::US38_Ok(<Rc<UH2>>::default(), { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) })
    }
}
fn from_0(mut v0: i32, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v2: bool = v0 < 1i32;
        if v2 {
            return v1.clone();
        } else {
            let mut v3: i32 = v0.wrapping_sub(1i32);
            let mut v4: Rc<str> = Rc::<str>::from(std::env::args().nth(v0 as usize).unwrap_or_default());
            let mut v5: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4.clone(), v1.clone()));
            (v0, v1) = (v3, v5.clone());
            continue;
        }
    }
}
fn ok_7(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> bool {
    loop {
        let mut v3: bool = v2 >= v1;
        if v3 {
            return true;
        } else {
            let mut v4: Rc<str> = string_slice(&v0.clone(), v2 as i64, v2 as i64);
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_"); } LIT.with(|lit| lit.clone()) };
            let mut v6: bool = v5.contains(&*v4);
            if v6 {
                let mut v7: i32 = v2.wrapping_add(1i32);
                (v0, v1, v2) = (v0.clone(), v1, v7);
                continue;
            } else {
                return false;
            }
        }
    }
}
fn handle_chars_6(mut v0: Rc<str>) -> bool {
    let mut v1: i32 = (v0.clone().len() as i32);
    let mut v2: bool = v1 >= 1i32;
    let mut v4: bool = if v2 {
        let mut v3: bool = v1 <= 15i32;
        v3
    } else {
        false
    };
    if v4 {
        let mut v5: i32 = 0i32;
        ok_7(v0.clone(), v1, v5)
    } else {
        false
    }
}
fn with_handle_5(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: US3, mut v3: i32, mut v4: i32, mut v5: i32, mut v6: US2, mut v7: Rc<str>, mut v8: Rc<str>, mut v9: bool, mut v10: bool, mut v11: i32, mut v12: bool) -> US4 {
    let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("@"); } LIT.with(|lit| lit.clone()) };
    let mut v14: bool = v0.starts_with(&*v13);
    let mut v18: Rc<str> = if v14 {
        let mut v15: i32 = (v0.clone().len() as i32);
        let mut v16: i32 = v15.wrapping_sub(1i32);
        let mut v17: Rc<str> = string_slice(&v0.clone(), 1i32 as i64, v16 as i64);
        v17.clone()
    } else {
        v0.clone()
    };
    let mut v19: bool = handle_chars_6(v18.clone());
    let mut v22: US3 = if v19 {
        US3::US3_Some(v18.clone())
    } else {
        US3::US3_None
    };
    let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("-"); } LIT.with(|lit| lit.clone()) };
    let mut v24: bool = v0.starts_with(&*v23);
    if v24 {
        let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unknown option "); } LIT.with(|lit| lit.clone()) };
        let mut v26: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v0));
        US4::US4_Error(v26.clone())
    } else {
        match &v22 {
            US3::US3_None => {
                let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not an X handle: '"); } LIT.with(|lit| lit.clone()) };
                let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v31, v0));
                let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
                let mut v34: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v33));
                US4::US4_Error(v34.clone())
            }
            US3::US3_Some(v28) => {
                let mut v28: Rc<str> = v28.clone();
                let mut v29: Rc<UH0> = Rc::new(UH0::UH0_Cons(v28.clone(), v1.clone()));
                US4::US4_Ok(v29.clone(), v2.clone(), v3, v4, v5, v6.clone(), v7.clone(), v8.clone(), v9, v10, v11, v12)
            }
        }
    }
}
fn apply_switch_8(mut v0: US6, mut v1: Rc<UH0>, mut v2: US3, mut v3: i32, mut v4: i32, mut v5: i32, mut v6: US2, mut v7: Rc<str>, mut v8: Rc<str>, mut v9: bool, mut v10: bool, mut v11: i32, mut v12: bool) -> (Rc<UH0>, US3, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) {
    let (mut v21, mut v22, mut v23, mut v24, mut v25, mut v26, mut v27, mut v28, mut v29, mut v30, mut v31, mut v32): (Rc<UH0>, US3, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v0 {
        US6::US6_Hints => {
            (v1.clone(), v2.clone(), v3, v4, v5, v6.clone(), v7.clone(), v8.clone(), v9, v10, v11, true)
        }
        _ => {
            let (mut v17, mut v18, mut v19, mut v20): (Rc<str>, Rc<str>, bool, bool) = match &v0 {
                US6::US6_NoReplies => {
                    (v7.clone(), v8.clone(), true, v10)
                }
                _ => {
                    let (mut v13, mut v14, mut v15, mut v16): (Rc<str>, Rc<str>, bool, bool) = match &v0 {
                        US6::US6_NoReposts => {
                            (v7.clone(), v8.clone(), v9, true)
                        }
                        _ => {
                            (v7.clone(), v8.clone(), true, true)
                        }
                    };
                    (v13.clone(), v14.clone(), v15, v16)
                }
            };
            (v1.clone(), v2.clone(), v3, v4, v5, v6.clone(), v17.clone(), v18.clone(), v19, v20, v11, v12)
        }
    };
    (v21.clone(), v22.clone(), v23, v24, v25, v26.clone(), v27.clone(), v28.clone(), v29, v30, v31, v32)
}
fn with_following_10(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: US3, mut v3: i32, mut v4: i32, mut v5: i32, mut v6: US2, mut v7: Rc<str>, mut v8: Rc<str>, mut v9: bool, mut v10: bool, mut v11: i32, mut v12: bool) -> US4 {
    let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("@"); } LIT.with(|lit| lit.clone()) };
    let mut v14: bool = v0.starts_with(&*v13);
    let mut v18: Rc<str> = if v14 {
        let mut v15: i32 = (v0.clone().len() as i32);
        let mut v16: i32 = v15.wrapping_sub(1i32);
        let mut v17: Rc<str> = string_slice(&v0.clone(), 1i32 as i64, v16 as i64);
        v17.clone()
    } else {
        v0.clone()
    };
    let mut v19: bool = handle_chars_6(v18.clone());
    let mut v22: US3 = if v19 {
        US3::US3_Some(v18.clone())
    } else {
        US3::US3_None
    };
    match &v22 {
        US3::US3_None => {
            let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not an X handle: '"); } LIT.with(|lit| lit.clone()) };
            let mut v24: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v0));
            let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
            let mut v26: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v25));
            US4::US4_Error(v26.clone())
        }
        US3::US3_Some(v28) => {
            let mut v28: Rc<str> = v28.clone();
            match &v2 {
                US3::US3_None => {
                    let mut v32: US3 = US3::US3_Some(v28.clone());
                    US4::US4_Ok(v1.clone(), v32.clone(), v3, v4, v5, v6.clone(), v7.clone(), v8.clone(), v9, v10, v11, v12)
                }
                US3::US3_Some(v29) => {
                    let mut v29: Rc<str> = v29.clone();
                    let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--following given twice"); } LIT.with(|lit| lit.clone()) };
                    US4::US4_Error(v30.clone())
                }
            }
        }
    }
}
fn go_12(mut v0: Rc<str>, mut v1: i32) -> bool {
    loop {
        let mut v2: bool = v1 >= 10i32;
        if v2 {
            return true;
        } else {
            let mut v3: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("9999-99-99"); } LIT.with(|lit| lit.clone()) }, v1 as i64, v1 as i64);
            let mut v4: bool = v3.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("9"); } LIT.with(|lit| lit.clone()) };
            let mut v11: bool = if v4 {
                let mut v5: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
                let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789"); } LIT.with(|lit| lit.clone()) };
                let mut v7: i32 = v6.find(&*v5).map(|i| i as i32).unwrap_or(-1);
                let mut v8: bool = v7 >= 0i32;
                v8
            } else {
                let mut v9: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
                let mut v10: bool = v3.clone() == v9.clone();
                v10
            };
            if v11 {
                let mut v12: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v0.clone(), v12);
                continue;
            } else {
                return false;
            }
        }
    }
}
fn go_13(mut v0: Rc<str>, mut v1: i32) -> bool {
    loop {
        let mut v2: bool = v1 >= 20i32;
        if v2 {
            return true;
        } else {
            let mut v3: Rc<str> = string_slice(&{ thread_local!{ static LIT: Rc<str> = Rc::<str>::from("9999-99-99T99:99:99Z"); } LIT.with(|lit| lit.clone()) }, v1 as i64, v1 as i64);
            let mut v4: bool = v3.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("9"); } LIT.with(|lit| lit.clone()) };
            let mut v11: bool = if v4 {
                let mut v5: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
                let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789"); } LIT.with(|lit| lit.clone()) };
                let mut v7: i32 = v6.find(&*v5).map(|i| i as i32).unwrap_or(-1);
                let mut v8: bool = v7 >= 0i32;
                v8
            } else {
                let mut v9: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
                let mut v10: bool = v3.clone() == v9.clone();
                v10
            };
            if v11 {
                let mut v12: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v0.clone(), v12);
                continue;
            } else {
                return false;
            }
        }
    }
}
fn with_date_11(mut v0: US8, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: US3, mut v5: i32, mut v6: i32, mut v7: i32, mut v8: US2, mut v9: Rc<str>, mut v10: Rc<str>, mut v11: bool, mut v12: bool, mut v13: i32, mut v14: bool) -> US4 {
    let mut v15: i32 = (v2.clone().len() as i32);
    let mut v16: bool = v15 == 10i32;
    let mut v19: bool = if v16 {
        let mut v17: i32 = 0i32;
        go_12(v2.clone(), v17)
    } else {
        false
    };
    let mut v30: US3 = if v19 {
        let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("T00:00:00Z"); } LIT.with(|lit| lit.clone()) };
        let mut v21: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v20));
        US3::US3_Some(v21.clone())
    } else {
        let mut v23: bool = v15 == 20i32;
        let mut v26: bool = if v23 {
            let mut v24: i32 = 0i32;
            go_13(v2.clone(), v24)
        } else {
            false
        };
        if v26 {
            US3::US3_Some(v2.clone())
        } else {
            US3::US3_None
        }
    };
    match &v30 {
        US3::US3_None => {
            let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" expects YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ, got '"); } LIT.with(|lit| lit.clone()) };
            let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v31));
            let mut v33: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v2));
            let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
            let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v33, v34));
            US4::US4_Error(v35.clone())
        }
        US3::US3_Some(v37) => {
            let mut v37: Rc<str> = v37.clone();
            let (mut v38, mut v39, mut v40, mut v41): (Rc<str>, Rc<str>, bool, bool) = match &v0 {
                US8::US8_Since => {
                    (v37.clone(), v10.clone(), v11, v12)
                }
                _ => {
                    (v9.clone(), v37.clone(), v11, v12)
                }
            };
            US4::US4_Ok(v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v38.clone(), v39.clone(), v40, v41, v13, v14)
        }
    }
}
fn digits_15(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> US12 {
    loop {
        let mut v3: i32 = (v0.clone().len() as i32);
        let mut v4: bool = v1 >= v3;
        if v4 {
            return US12::US12_Some(v2);
        } else {
            let mut v6: Rc<str> = string_slice(&v0.clone(), v1 as i64, v1 as i64);
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("0123456789"); } LIT.with(|lit| lit.clone()) };
            let mut v8: i32 = v7.find(&*v6).map(|i| i as i32).unwrap_or(-1);
            let mut v9: bool = v8 < 0i32;
            let mut v11: bool = if v9 {
                true
            } else {
                let mut v10: bool = v2 > 100000000i32;
                v10
            };
            if v11 {
                return US12::US12_None;
            } else {
                let mut v13: i32 = v1.wrapping_add(1i32);
                let mut v14: i32 = v2.wrapping_mul(10i32);
                let mut v15: i32 = v14.wrapping_add(v8);
                (v0, v1, v2) = (v0.clone(), v13, v15);
                continue;
            }
        }
    }
}
fn bounded_14(mut v0: US8, mut v1: Rc<str>, mut v2: Rc<str>) -> US11 {
    let (mut v5, mut v6): (i32, i32) = match &v0 {
        US8::US8_Depth => {
            (0i32, 3i32)
        }
        US8::US8_PerAccount => {
            (5i32, 100i32)
        }
        _ => {
            (1i32, 100000i32)
        }
    };
    let mut v7: bool = v2.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v12: US12 = if v7 {
        US12::US12_None
    } else {
        let mut v9: i32 = 0i32;
        let mut v10: i32 = 0i32;
        digits_15(v2.clone(), v9, v10)
    };
    match &v12 {
        US12::US12_Some(v13) => {
            let mut v13: i32 = *v13;
            let mut v14: bool = v13 >= v5;
            let mut v16: bool = if v14 {
                let mut v15: bool = v13 <= v6;
                v15
            } else {
                false
            };
            if v16 {
                US11::US11_Ok(v13)
            } else {
                let mut v18: Rc<str> = Rc::<str>::from(format!("{:?}", v5));
                let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" to "); } LIT.with(|lit| lit.clone()) };
                let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v19));
                let mut v21: Rc<str> = Rc::<str>::from(format!("{:?}", v6));
                let mut v22: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v21));
                let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" expects a number from "); } LIT.with(|lit| lit.clone()) };
                let mut v24: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v23));
                let mut v25: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v22));
                let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", got '"); } LIT.with(|lit| lit.clone()) };
                let mut v27: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v26));
                let mut v28: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v2));
                let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
                let mut v30: Rc<str> = Rc::<str>::from(format!("{}{}", v28, v29));
                US11::US11_Error(v30.clone())
            }
        }
        _ => {
            let mut v33: Rc<str> = Rc::<str>::from(format!("{:?}", v5));
            let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" to "); } LIT.with(|lit| lit.clone()) };
            let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v33, v34));
            let mut v36: Rc<str> = Rc::<str>::from(format!("{:?}", v6));
            let mut v37: Rc<str> = Rc::<str>::from(format!("{}{}", v35, v36));
            let mut v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" expects a number from "); } LIT.with(|lit| lit.clone()) };
            let mut v39: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v38));
            let mut v40: Rc<str> = Rc::<str>::from(format!("{}{}", v39, v37));
            let mut v41: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", got '"); } LIT.with(|lit| lit.clone()) };
            let mut v42: Rc<str> = Rc::<str>::from(format!("{}{}", v40, v41));
            let mut v43: Rc<str> = Rc::<str>::from(format!("{}{}", v42, v2));
            let mut v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
            let mut v45: Rc<str> = Rc::<str>::from(format!("{}{}", v43, v44));
            US11::US11_Error(v45.clone())
        }
    }
}
fn apply_flag_9(mut v0: US8, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: US3, mut v5: i32, mut v6: i32, mut v7: i32, mut v8: US2, mut v9: Rc<str>, mut v10: Rc<str>, mut v11: bool, mut v12: bool, mut v13: i32, mut v14: bool) -> US4 {
    match &v0 {
        US8::US8_Following => {
            with_following_10(v2.clone(), v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14)
        }
        US8::US8_MaxFollowing => {
            let mut v18: bool = v2.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("all"); } LIT.with(|lit| lit.clone()) };
            if v18 {
                let mut v19: US2 = US2::US2_AllFollowing;
                US4::US4_Ok(v3.clone(), v4.clone(), v5, v6, v7, v19.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14)
            } else {
                let mut v21: US11 = bounded_14(v0.clone(), v1.clone(), v2.clone());
                match &v21 {
                    US11::US11_Error(v25) => {
                        let mut v25: Rc<str> = v25.clone();
                        US4::US4_Error(v25.clone())
                    }
                    US11::US11_Ok(v22) => {
                        let mut v22: i32 = *v22;
                        let mut v23: US2 = US2::US2_AtMost(v22);
                        US4::US4_Ok(v3.clone(), v4.clone(), v5, v6, v7, v23.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14)
                    }
                }
            }
        }
        US8::US8_Since => {
            with_date_11(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14)
        }
        US8::US8_Until => {
            with_date_11(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14)
        }
        _ => {
            let mut v30: US11 = bounded_14(v0.clone(), v1.clone(), v2.clone());
            match &v30 {
                US11::US11_Error(v81) => {
                    let mut v81: Rc<str> = v81.clone();
                    US4::US4_Error(v81.clone())
                }
                US11::US11_Ok(v31) => {
                    let mut v31: i32 = *v31;
                    let (mut v68, mut v69, mut v70, mut v71, mut v72, mut v73, mut v74, mut v75, mut v76, mut v77, mut v78, mut v79): (Rc<UH0>, US3, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v0 {
                        US8::US8_PerAccount => {
                            (v3.clone(), v4.clone(), v31, v6, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14)
                        }
                        _ => {
                            let (mut v56, mut v57, mut v58, mut v59, mut v60, mut v61, mut v62, mut v63, mut v64, mut v65, mut v66, mut v67): (Rc<UH0>, US3, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v0 {
                                US8::US8_Limit => {
                                    (v3.clone(), v4.clone(), v5, v31, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14)
                                }
                                _ => {
                                    let (mut v44, mut v45, mut v46, mut v47, mut v48, mut v49, mut v50, mut v51, mut v52, mut v53, mut v54, mut v55): (Rc<UH0>, US3, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v0 {
                                        US8::US8_PerAuthor => {
                                            (v3.clone(), v4.clone(), v5, v6, v31, v8.clone(), v9.clone(), v10.clone(), v11, v12, v13, v14)
                                        }
                                        _ => {
                                            let (mut v32, mut v33, mut v34, mut v35, mut v36, mut v37, mut v38, mut v39, mut v40, mut v41, mut v42, mut v43): (Rc<UH0>, US3, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v0 {
                                                US8::US8_Depth => {
                                                    (v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10.clone(), v11, v12, v31, v14)
                                                }
                                                _ => unreachable!(),
                                            };
                                            (v32.clone(), v33.clone(), v34, v35, v36, v37.clone(), v38.clone(), v39.clone(), v40, v41, v42, v43)
                                        }
                                    };
                                    (v44.clone(), v45.clone(), v46, v47, v48, v49.clone(), v50.clone(), v51.clone(), v52, v53, v54, v55)
                                }
                            };
                            (v56.clone(), v57.clone(), v58, v59, v60, v61.clone(), v62.clone(), v63.clone(), v64, v65, v66, v67)
                        }
                    };
                    US4::US4_Ok(v68.clone(), v69.clone(), v70, v71, v72, v73.clone(), v74.clone(), v75.clone(), v76, v77, v78, v79)
                }
            }
        }
    }
}
fn advance_4(mut v0: Rc<UH0>, mut v1: US3, mut v2: i32, mut v3: i32, mut v4: i32, mut v5: US2, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: bool, mut v9: bool, mut v10: i32, mut v11: bool, mut v12: Rc<str>, mut v13: Rc<UH0>) -> (US4, Rc<UH0>) {
    let mut v14: bool = v12.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--no-replies"); } LIT.with(|lit| lit.clone()) };
    let mut v30: US5 = if v14 {
        let mut v15: US6 = US6::US6_NoReplies;
        US5::US5_Some(v15.clone())
    } else {
        let mut v17: bool = v12.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--no-reposts"); } LIT.with(|lit| lit.clone()) };
        if v17 {
            let mut v18: US6 = US6::US6_NoReposts;
            US5::US5_Some(v18.clone())
        } else {
            let mut v20: bool = v12.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--originals"); } LIT.with(|lit| lit.clone()) };
            if v20 {
                let mut v21: US6 = US6::US6_Originals;
                US5::US5_Some(v21.clone())
            } else {
                let mut v23: bool = v12.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--hints"); } LIT.with(|lit| lit.clone()) };
                if v23 {
                    let mut v24: US6 = US6::US6_Hints;
                    US5::US5_Some(v24.clone())
                } else {
                    US5::US5_None
                }
            }
        }
    };
    let mut v31: bool = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--until"); } LIT.with(|lit| lit.clone()) } == v12.clone();
    let mut v36: US7 = if v31 {
        let mut v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--until"); } LIT.with(|lit| lit.clone()) };
        let mut v33: US8 = US8::US8_Until;
        US7::US7_Some(v32.clone(), v33.clone())
    } else {
        US7::US7_None
    };
    let mut v37: bool = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--since"); } LIT.with(|lit| lit.clone()) } == v12.clone();
    let mut v41: US7 = if v37 {
        let mut v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--since"); } LIT.with(|lit| lit.clone()) };
        let mut v39: US8 = US8::US8_Since;
        US7::US7_Some(v38.clone(), v39.clone())
    } else {
        v36.clone()
    };
    let mut v42: bool = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--following"); } LIT.with(|lit| lit.clone()) } == v12.clone();
    let mut v46: US7 = if v42 {
        let mut v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--following"); } LIT.with(|lit| lit.clone()) };
        let mut v44: US8 = US8::US8_Following;
        US7::US7_Some(v43.clone(), v44.clone())
    } else {
        v41.clone()
    };
    let mut v47: bool = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--max-following"); } LIT.with(|lit| lit.clone()) } == v12.clone();
    let mut v51: US7 = if v47 {
        let mut v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--max-following"); } LIT.with(|lit| lit.clone()) };
        let mut v49: US8 = US8::US8_MaxFollowing;
        US7::US7_Some(v48.clone(), v49.clone())
    } else {
        v46.clone()
    };
    let mut v52: bool = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--depth"); } LIT.with(|lit| lit.clone()) } == v12.clone();
    let mut v56: US7 = if v52 {
        let mut v53: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--depth"); } LIT.with(|lit| lit.clone()) };
        let mut v54: US8 = US8::US8_Depth;
        US7::US7_Some(v53.clone(), v54.clone())
    } else {
        v51.clone()
    };
    let mut v57: bool = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--per-author"); } LIT.with(|lit| lit.clone()) } == v12.clone();
    let mut v61: US7 = if v57 {
        let mut v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--per-author"); } LIT.with(|lit| lit.clone()) };
        let mut v59: US8 = US8::US8_PerAuthor;
        US7::US7_Some(v58.clone(), v59.clone())
    } else {
        v56.clone()
    };
    let mut v62: bool = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--limit"); } LIT.with(|lit| lit.clone()) } == v12.clone();
    let mut v66: US7 = if v62 {
        let mut v63: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--limit"); } LIT.with(|lit| lit.clone()) };
        let mut v64: US8 = US8::US8_Limit;
        US7::US7_Some(v63.clone(), v64.clone())
    } else {
        v61.clone()
    };
    let mut v67: bool = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--per-account"); } LIT.with(|lit| lit.clone()) } == v12.clone();
    let mut v71: US7 = if v67 {
        let mut v68: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--per-account"); } LIT.with(|lit| lit.clone()) };
        let mut v69: US8 = US8::US8_PerAccount;
        US7::US7_Some(v68.clone(), v69.clone())
    } else {
        v66.clone()
    };
    let mut v77: US9 = match &v71 {
        US7::US7_None => {
            US9::US9_None
        }
        US7::US7_Some(v72, v73) => {
            let mut v72: Rc<str> = v72.clone();
            let mut v73: US8 = v73.clone();
            US9::US9_Some(v73.clone())
        }
    };
    let mut v84: US10 = match &v30 {
        US5::US5_Some(v78) => {
            let mut v78: US6 = v78.clone();
            US10::US10_Switched(v78.clone())
        }
        _ => {
            match &v77 {
                US9::US9_Some(v80) => {
                    let mut v80: US8 = v80.clone();
                    US10::US10_Valued(v80.clone())
                }
                _ => {
                    US10::US10_Plain
                }
            }
        }
    };
    match &v84 {
        US10::US10_Plain => {
            let mut v111: US4 = with_handle_5(v12.clone(), v0.clone(), v1.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11);
            (v111.clone(), v13.clone())
        }
        US10::US10_Switched(v85) => {
            let mut v85: US6 = v85.clone();
            let (mut v86, mut v87, mut v88, mut v89, mut v90, mut v91, mut v92, mut v93, mut v94, mut v95, mut v96, mut v97): (Rc<UH0>, US3, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) = apply_switch_8(v85.clone(), v0.clone(), v1.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11);
            let mut v98: US4 = US4::US4_Ok(v86.clone(), v87.clone(), v88, v89, v90, v91.clone(), v92.clone(), v93.clone(), v94, v95, v96, v97);
            (v98.clone(), v13.clone())
        }
        US10::US10_Valued(v99) => {
            let mut v99: US8 = v99.clone();
            match &*v13 {
                UH0::UH0_Cons(v104, v105) => {
                    let mut v104: Rc<str> = v104.clone();
                    let mut v105: Rc<UH0> = v105.clone();
                    let mut v106: US4 = apply_flag_9(v99.clone(), v12.clone(), v104.clone(), v0.clone(), v1.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11);
                    (v106.clone(), v105.clone())
                }
                UH0::UH0_Nil => {
                    let mut v100: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" needs a value"); } LIT.with(|lit| lit.clone()) };
                    let mut v101: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v100));
                    let mut v102: US4 = US4::US4_Error(v101.clone());
                    let mut v103: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    (v102.clone(), v103.clone())
                }
            }
        }
    }
}
fn method18(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
                let mut v4: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2.clone(), v1.clone()));
                (v0, v1) = (v3.clone(), v4.clone());
                continue;
            }
            UH0::UH0_Nil => {
                return v1.clone();
            }
        }
    }
}
fn finish_17(mut v0: Rc<UH0>, mut v1: US3, mut v2: i32, mut v3: i32, mut v4: i32, mut v5: US2, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: bool, mut v9: bool, mut v10: i32, mut v11: bool) -> US0 {
    let mut v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v13: Rc<UH0> = method18(v0.clone(), v12.clone());
    match &v1 {
        US3::US3_None => {
            match &*v13 {
                UH0::UH0_Nil => {
                    let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("name at least one account, or --following HANDLE"); } LIT.with(|lit| lit.clone()) };
                    US0::US0_Rejected(v20.clone())
                }
                _ => {
                    let mut v22: US1 = US1::US1_Accounts(v13.clone());
                    US0::US0_ShowTimeline(v22.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11)
                }
            }
        }
        US3::US3_Some(v14) => {
            let mut v14: Rc<str> = v14.clone();
            match &*v13 {
                UH0::UH0_Nil => {
                    let mut v15: US1 = US1::US1_FollowingOf(v14.clone());
                    US0::US0_ShowTimeline(v15.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11)
                }
                _ => {
                    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--following takes one account and no other handles"); } LIT.with(|lit| lit.clone()) };
                    US0::US0_Rejected(v17.clone())
                }
            }
        }
    }
}
fn method19(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
                let mut v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3.clone(), v4);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn capped_16(mut v0: Rc<UH0>, mut v1: US3, mut v2: i32, mut v3: i32, mut v4: i32, mut v5: US2, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: bool, mut v9: bool, mut v10: i32, mut v11: bool) -> US0 {
    let mut v12: i32 = 0i32;
    let mut v13: i32 = method19(v0.clone(), v12);
    let mut v14: bool = v13 > 100i32;
    if v14 {
        let mut v15: Rc<str> = Rc::<str>::from(format!("{:?}", 100i32));
        let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("at most "); } LIT.with(|lit| lit.clone()) };
        let mut v17: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v15));
        let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" accounts per run"); } LIT.with(|lit| lit.clone()) };
        let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v17, v18));
        US0::US0_Rejected(v19.clone())
    } else {
        finish_17(v0.clone(), v1.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11)
    }
}
fn parse_from_3(mut v0: Rc<UH0>, mut v1: US3, mut v2: i32, mut v3: i32, mut v4: i32, mut v5: US2, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: bool, mut v9: bool, mut v10: i32, mut v11: bool, mut v12: Rc<UH0>) -> US0 {
    loop {
        match &*v12 {
            UH0::UH0_Cons(v14, v15) => {
                let mut v14: Rc<str> = v14.clone();
                let mut v15: Rc<UH0> = v15.clone();
                let (mut v16, mut v17): (US4, Rc<UH0>) = advance_4(v0.clone(), v1.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11, v14.clone(), v15.clone());
                match &v16 {
                    US4::US4_Error(v31) => {
                        let mut v31: Rc<str> = v31.clone();
                        return US0::US0_Rejected(v31.clone());
                    }
                    US4::US4_Ok(v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29) => {
                        let mut v18: Rc<UH0> = v18.clone();
                        let mut v19: US3 = v19.clone();
                        let mut v20: i32 = *v20;
                        let mut v21: i32 = *v21;
                        let mut v22: i32 = *v22;
                        let mut v23: US2 = v23.clone();
                        let mut v24: Rc<str> = v24.clone();
                        let mut v25: Rc<str> = v25.clone();
                        let mut v26: bool = *v26;
                        let mut v27: bool = *v27;
                        let mut v28: i32 = *v28;
                        let mut v29: bool = *v29;
                        (v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12) = (v18.clone(), v19.clone(), v20, v21, v22, v23.clone(), v24.clone(), v25.clone(), v26, v27, v28, v29, v17.clone());
                        continue;
                    }
                }
            }
            UH0::UH0_Nil => {
                return capped_16(v0.clone(), v1.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11);
            }
        }
    }
}
fn finish_21(mut v0: Rc<UH0>, mut v1: US3, mut v2: i32, mut v3: i32, mut v4: i32, mut v5: US2, mut v6: Rc<str>, mut v7: bool, mut v8: bool, mut v9: i32, mut v10: bool) -> US0 {
    let mut v11: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v12: Rc<UH0> = method18(v0.clone(), v11.clone());
    match &v1 {
        US3::US3_None => {
            match &*v12 {
                UH0::UH0_Nil => {
                    let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("name at least one account, or --following HANDLE"); } LIT.with(|lit| lit.clone()) };
                    US0::US0_Rejected(v19.clone())
                }
                _ => {
                    let mut v21: US1 = US1::US1_Accounts(v12.clone());
                    US0::US0_ShowTimeline(v21.clone(), v2, v3, v4, v5.clone(), v6.clone(), v6.clone(), v7, v8, v9, v10)
                }
            }
        }
        US3::US3_Some(v13) => {
            let mut v13: Rc<str> = v13.clone();
            match &*v12 {
                UH0::UH0_Nil => {
                    let mut v14: US1 = US1::US1_FollowingOf(v13.clone());
                    US0::US0_ShowTimeline(v14.clone(), v2, v3, v4, v5.clone(), v6.clone(), v6.clone(), v7, v8, v9, v10)
                }
                _ => {
                    let mut v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--following takes one account and no other handles"); } LIT.with(|lit| lit.clone()) };
                    US0::US0_Rejected(v16.clone())
                }
            }
        }
    }
}
fn capped_20(mut v0: Rc<UH0>, mut v1: US3, mut v2: i32, mut v3: i32, mut v4: i32, mut v5: US2, mut v6: Rc<str>, mut v7: bool, mut v8: bool, mut v9: i32, mut v10: bool) -> US0 {
    let mut v11: i32 = 0i32;
    let mut v12: i32 = method19(v0.clone(), v11);
    let mut v13: bool = v12 > 100i32;
    if v13 {
        let mut v14: Rc<str> = Rc::<str>::from(format!("{:?}", 100i32));
        let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("at most "); } LIT.with(|lit| lit.clone()) };
        let mut v16: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v14));
        let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" accounts per run"); } LIT.with(|lit| lit.clone()) };
        let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v17));
        US0::US0_Rejected(v18.clone())
    } else {
        finish_21(v0.clone(), v1.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7, v8, v9, v10)
    }
}
fn with_handle_23(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: US3, mut v3: i32, mut v4: i32, mut v5: i32, mut v6: US2, mut v7: Rc<str>, mut v8: bool, mut v9: bool, mut v10: i32, mut v11: bool) -> US4 {
    let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("@"); } LIT.with(|lit| lit.clone()) };
    let mut v13: bool = v0.starts_with(&*v12);
    let mut v17: Rc<str> = if v13 {
        let mut v14: i32 = (v0.clone().len() as i32);
        let mut v15: i32 = v14.wrapping_sub(1i32);
        let mut v16: Rc<str> = string_slice(&v0.clone(), 1i32 as i64, v15 as i64);
        v16.clone()
    } else {
        v0.clone()
    };
    let mut v18: bool = handle_chars_6(v17.clone());
    let mut v21: US3 = if v18 {
        US3::US3_Some(v17.clone())
    } else {
        US3::US3_None
    };
    let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("-"); } LIT.with(|lit| lit.clone()) };
    let mut v23: bool = v0.starts_with(&*v22);
    if v23 {
        let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unknown option "); } LIT.with(|lit| lit.clone()) };
        let mut v25: Rc<str> = Rc::<str>::from(format!("{}{}", v24, v0));
        US4::US4_Error(v25.clone())
    } else {
        match &v21 {
            US3::US3_None => {
                let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not an X handle: '"); } LIT.with(|lit| lit.clone()) };
                let mut v31: Rc<str> = Rc::<str>::from(format!("{}{}", v30, v0));
                let mut v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
                let mut v33: Rc<str> = Rc::<str>::from(format!("{}{}", v31, v32));
                US4::US4_Error(v33.clone())
            }
            US3::US3_Some(v27) => {
                let mut v27: Rc<str> = v27.clone();
                let mut v28: Rc<UH0> = Rc::new(UH0::UH0_Cons(v27.clone(), v1.clone()));
                US4::US4_Ok(v28.clone(), v2.clone(), v3, v4, v5, v6.clone(), v7.clone(), v7.clone(), v8, v9, v10, v11)
            }
        }
    }
}
fn apply_switch_24(mut v0: US6, mut v1: Rc<UH0>, mut v2: US3, mut v3: i32, mut v4: i32, mut v5: i32, mut v6: US2, mut v7: Rc<str>, mut v8: bool, mut v9: bool, mut v10: i32, mut v11: bool) -> (Rc<UH0>, US3, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) {
    let (mut v20, mut v21, mut v22, mut v23, mut v24, mut v25, mut v26, mut v27, mut v28, mut v29, mut v30, mut v31): (Rc<UH0>, US3, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v0 {
        US6::US6_Hints => {
            (v1.clone(), v2.clone(), v3, v4, v5, v6.clone(), v7.clone(), v7.clone(), v8, v9, v10, true)
        }
        _ => {
            let (mut v16, mut v17, mut v18, mut v19): (Rc<str>, Rc<str>, bool, bool) = match &v0 {
                US6::US6_NoReplies => {
                    (v7.clone(), v7.clone(), true, v9)
                }
                _ => {
                    let (mut v12, mut v13, mut v14, mut v15): (Rc<str>, Rc<str>, bool, bool) = match &v0 {
                        US6::US6_NoReposts => {
                            (v7.clone(), v7.clone(), v8, true)
                        }
                        _ => {
                            (v7.clone(), v7.clone(), true, true)
                        }
                    };
                    (v12.clone(), v13.clone(), v14, v15)
                }
            };
            (v1.clone(), v2.clone(), v3, v4, v5, v6.clone(), v16.clone(), v17.clone(), v18, v19, v10, v11)
        }
    };
    (v20.clone(), v21.clone(), v22, v23, v24, v25.clone(), v26.clone(), v27.clone(), v28, v29, v30, v31)
}
fn with_following_26(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: US3, mut v3: i32, mut v4: i32, mut v5: i32, mut v6: US2, mut v7: Rc<str>, mut v8: bool, mut v9: bool, mut v10: i32, mut v11: bool) -> US4 {
    let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("@"); } LIT.with(|lit| lit.clone()) };
    let mut v13: bool = v0.starts_with(&*v12);
    let mut v17: Rc<str> = if v13 {
        let mut v14: i32 = (v0.clone().len() as i32);
        let mut v15: i32 = v14.wrapping_sub(1i32);
        let mut v16: Rc<str> = string_slice(&v0.clone(), 1i32 as i64, v15 as i64);
        v16.clone()
    } else {
        v0.clone()
    };
    let mut v18: bool = handle_chars_6(v17.clone());
    let mut v21: US3 = if v18 {
        US3::US3_Some(v17.clone())
    } else {
        US3::US3_None
    };
    match &v21 {
        US3::US3_None => {
            let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not an X handle: '"); } LIT.with(|lit| lit.clone()) };
            let mut v23: Rc<str> = Rc::<str>::from(format!("{}{}", v22, v0));
            let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
            let mut v25: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v24));
            US4::US4_Error(v25.clone())
        }
        US3::US3_Some(v27) => {
            let mut v27: Rc<str> = v27.clone();
            match &v2 {
                US3::US3_None => {
                    let mut v31: US3 = US3::US3_Some(v27.clone());
                    US4::US4_Ok(v1.clone(), v31.clone(), v3, v4, v5, v6.clone(), v7.clone(), v7.clone(), v8, v9, v10, v11)
                }
                US3::US3_Some(v28) => {
                    let mut v28: Rc<str> = v28.clone();
                    let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--following given twice"); } LIT.with(|lit| lit.clone()) };
                    US4::US4_Error(v29.clone())
                }
            }
        }
    }
}
fn with_date_27(mut v0: US8, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: US3, mut v5: i32, mut v6: i32, mut v7: i32, mut v8: US2, mut v9: Rc<str>, mut v10: bool, mut v11: bool, mut v12: i32, mut v13: bool) -> US4 {
    let mut v14: i32 = (v2.clone().len() as i32);
    let mut v15: bool = v14 == 10i32;
    let mut v18: bool = if v15 {
        let mut v16: i32 = 0i32;
        go_12(v2.clone(), v16)
    } else {
        false
    };
    let mut v29: US3 = if v18 {
        let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("T00:00:00Z"); } LIT.with(|lit| lit.clone()) };
        let mut v20: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v19));
        US3::US3_Some(v20.clone())
    } else {
        let mut v22: bool = v14 == 20i32;
        let mut v25: bool = if v22 {
            let mut v23: i32 = 0i32;
            go_13(v2.clone(), v23)
        } else {
            false
        };
        if v25 {
            US3::US3_Some(v2.clone())
        } else {
            US3::US3_None
        }
    };
    match &v29 {
        US3::US3_None => {
            let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" expects YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ, got '"); } LIT.with(|lit| lit.clone()) };
            let mut v31: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v30));
            let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v31, v2));
            let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("'"); } LIT.with(|lit| lit.clone()) };
            let mut v34: Rc<str> = Rc::<str>::from(format!("{}{}", v32, v33));
            US4::US4_Error(v34.clone())
        }
        US3::US3_Some(v36) => {
            let mut v36: Rc<str> = v36.clone();
            let (mut v37, mut v38, mut v39, mut v40): (Rc<str>, Rc<str>, bool, bool) = match &v0 {
                US8::US8_Since => {
                    (v36.clone(), v9.clone(), v10, v11)
                }
                _ => {
                    (v9.clone(), v36.clone(), v10, v11)
                }
            };
            US4::US4_Ok(v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v37.clone(), v38.clone(), v39, v40, v12, v13)
        }
    }
}
fn apply_flag_25(mut v0: US8, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<UH0>, mut v4: US3, mut v5: i32, mut v6: i32, mut v7: i32, mut v8: US2, mut v9: Rc<str>, mut v10: bool, mut v11: bool, mut v12: i32, mut v13: bool) -> US4 {
    match &v0 {
        US8::US8_Following => {
            with_following_26(v2.clone(), v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10, v11, v12, v13)
        }
        US8::US8_MaxFollowing => {
            let mut v17: bool = v2.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("all"); } LIT.with(|lit| lit.clone()) };
            if v17 {
                let mut v18: US2 = US2::US2_AllFollowing;
                US4::US4_Ok(v3.clone(), v4.clone(), v5, v6, v7, v18.clone(), v9.clone(), v9.clone(), v10, v11, v12, v13)
            } else {
                let mut v20: US11 = bounded_14(v0.clone(), v1.clone(), v2.clone());
                match &v20 {
                    US11::US11_Error(v24) => {
                        let mut v24: Rc<str> = v24.clone();
                        US4::US4_Error(v24.clone())
                    }
                    US11::US11_Ok(v21) => {
                        let mut v21: i32 = *v21;
                        let mut v22: US2 = US2::US2_AtMost(v21);
                        US4::US4_Ok(v3.clone(), v4.clone(), v5, v6, v7, v22.clone(), v9.clone(), v9.clone(), v10, v11, v12, v13)
                    }
                }
            }
        }
        US8::US8_Since => {
            with_date_27(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10, v11, v12, v13)
        }
        US8::US8_Until => {
            with_date_27(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v10, v11, v12, v13)
        }
        _ => {
            let mut v29: US11 = bounded_14(v0.clone(), v1.clone(), v2.clone());
            match &v29 {
                US11::US11_Error(v80) => {
                    let mut v80: Rc<str> = v80.clone();
                    US4::US4_Error(v80.clone())
                }
                US11::US11_Ok(v30) => {
                    let mut v30: i32 = *v30;
                    let (mut v67, mut v68, mut v69, mut v70, mut v71, mut v72, mut v73, mut v74, mut v75, mut v76, mut v77, mut v78): (Rc<UH0>, US3, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v0 {
                        US8::US8_PerAccount => {
                            (v3.clone(), v4.clone(), v30, v6, v7, v8.clone(), v9.clone(), v9.clone(), v10, v11, v12, v13)
                        }
                        _ => {
                            let (mut v55, mut v56, mut v57, mut v58, mut v59, mut v60, mut v61, mut v62, mut v63, mut v64, mut v65, mut v66): (Rc<UH0>, US3, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v0 {
                                US8::US8_Limit => {
                                    (v3.clone(), v4.clone(), v5, v30, v7, v8.clone(), v9.clone(), v9.clone(), v10, v11, v12, v13)
                                }
                                _ => {
                                    let (mut v43, mut v44, mut v45, mut v46, mut v47, mut v48, mut v49, mut v50, mut v51, mut v52, mut v53, mut v54): (Rc<UH0>, US3, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v0 {
                                        US8::US8_PerAuthor => {
                                            (v3.clone(), v4.clone(), v5, v6, v30, v8.clone(), v9.clone(), v9.clone(), v10, v11, v12, v13)
                                        }
                                        _ => {
                                            let (mut v31, mut v32, mut v33, mut v34, mut v35, mut v36, mut v37, mut v38, mut v39, mut v40, mut v41, mut v42): (Rc<UH0>, US3, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) = match &v0 {
                                                US8::US8_Depth => {
                                                    (v3.clone(), v4.clone(), v5, v6, v7, v8.clone(), v9.clone(), v9.clone(), v10, v11, v30, v13)
                                                }
                                                _ => unreachable!(),
                                            };
                                            (v31.clone(), v32.clone(), v33, v34, v35, v36.clone(), v37.clone(), v38.clone(), v39, v40, v41, v42)
                                        }
                                    };
                                    (v43.clone(), v44.clone(), v45, v46, v47, v48.clone(), v49.clone(), v50.clone(), v51, v52, v53, v54)
                                }
                            };
                            (v55.clone(), v56.clone(), v57, v58, v59, v60.clone(), v61.clone(), v62.clone(), v63, v64, v65, v66)
                        }
                    };
                    US4::US4_Ok(v67.clone(), v68.clone(), v69, v70, v71, v72.clone(), v73.clone(), v74.clone(), v75, v76, v77, v78)
                }
            }
        }
    }
}
fn advance_22(mut v0: Rc<UH0>, mut v1: US3, mut v2: i32, mut v3: i32, mut v4: i32, mut v5: US2, mut v6: Rc<str>, mut v7: bool, mut v8: bool, mut v9: i32, mut v10: bool, mut v11: Rc<str>, mut v12: Rc<UH0>) -> (US4, Rc<UH0>) {
    let mut v13: bool = v11.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--no-replies"); } LIT.with(|lit| lit.clone()) };
    let mut v29: US5 = if v13 {
        let mut v14: US6 = US6::US6_NoReplies;
        US5::US5_Some(v14.clone())
    } else {
        let mut v16: bool = v11.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--no-reposts"); } LIT.with(|lit| lit.clone()) };
        if v16 {
            let mut v17: US6 = US6::US6_NoReposts;
            US5::US5_Some(v17.clone())
        } else {
            let mut v19: bool = v11.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--originals"); } LIT.with(|lit| lit.clone()) };
            if v19 {
                let mut v20: US6 = US6::US6_Originals;
                US5::US5_Some(v20.clone())
            } else {
                let mut v22: bool = v11.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--hints"); } LIT.with(|lit| lit.clone()) };
                if v22 {
                    let mut v23: US6 = US6::US6_Hints;
                    US5::US5_Some(v23.clone())
                } else {
                    US5::US5_None
                }
            }
        }
    };
    let mut v30: bool = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--until"); } LIT.with(|lit| lit.clone()) } == v11.clone();
    let mut v35: US7 = if v30 {
        let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--until"); } LIT.with(|lit| lit.clone()) };
        let mut v32: US8 = US8::US8_Until;
        US7::US7_Some(v31.clone(), v32.clone())
    } else {
        US7::US7_None
    };
    let mut v36: bool = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--since"); } LIT.with(|lit| lit.clone()) } == v11.clone();
    let mut v40: US7 = if v36 {
        let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--since"); } LIT.with(|lit| lit.clone()) };
        let mut v38: US8 = US8::US8_Since;
        US7::US7_Some(v37.clone(), v38.clone())
    } else {
        v35.clone()
    };
    let mut v41: bool = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--following"); } LIT.with(|lit| lit.clone()) } == v11.clone();
    let mut v45: US7 = if v41 {
        let mut v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--following"); } LIT.with(|lit| lit.clone()) };
        let mut v43: US8 = US8::US8_Following;
        US7::US7_Some(v42.clone(), v43.clone())
    } else {
        v40.clone()
    };
    let mut v46: bool = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--max-following"); } LIT.with(|lit| lit.clone()) } == v11.clone();
    let mut v50: US7 = if v46 {
        let mut v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--max-following"); } LIT.with(|lit| lit.clone()) };
        let mut v48: US8 = US8::US8_MaxFollowing;
        US7::US7_Some(v47.clone(), v48.clone())
    } else {
        v45.clone()
    };
    let mut v51: bool = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--depth"); } LIT.with(|lit| lit.clone()) } == v11.clone();
    let mut v55: US7 = if v51 {
        let mut v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--depth"); } LIT.with(|lit| lit.clone()) };
        let mut v53: US8 = US8::US8_Depth;
        US7::US7_Some(v52.clone(), v53.clone())
    } else {
        v50.clone()
    };
    let mut v56: bool = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--per-author"); } LIT.with(|lit| lit.clone()) } == v11.clone();
    let mut v60: US7 = if v56 {
        let mut v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--per-author"); } LIT.with(|lit| lit.clone()) };
        let mut v58: US8 = US8::US8_PerAuthor;
        US7::US7_Some(v57.clone(), v58.clone())
    } else {
        v55.clone()
    };
    let mut v61: bool = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--limit"); } LIT.with(|lit| lit.clone()) } == v11.clone();
    let mut v65: US7 = if v61 {
        let mut v62: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--limit"); } LIT.with(|lit| lit.clone()) };
        let mut v63: US8 = US8::US8_Limit;
        US7::US7_Some(v62.clone(), v63.clone())
    } else {
        v60.clone()
    };
    let mut v66: bool = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--per-account"); } LIT.with(|lit| lit.clone()) } == v11.clone();
    let mut v70: US7 = if v66 {
        let mut v67: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--per-account"); } LIT.with(|lit| lit.clone()) };
        let mut v68: US8 = US8::US8_PerAccount;
        US7::US7_Some(v67.clone(), v68.clone())
    } else {
        v65.clone()
    };
    let mut v76: US9 = match &v70 {
        US7::US7_None => {
            US9::US9_None
        }
        US7::US7_Some(v71, v72) => {
            let mut v71: Rc<str> = v71.clone();
            let mut v72: US8 = v72.clone();
            US9::US9_Some(v72.clone())
        }
    };
    let mut v83: US10 = match &v29 {
        US5::US5_Some(v77) => {
            let mut v77: US6 = v77.clone();
            US10::US10_Switched(v77.clone())
        }
        _ => {
            match &v76 {
                US9::US9_Some(v79) => {
                    let mut v79: US8 = v79.clone();
                    US10::US10_Valued(v79.clone())
                }
                _ => {
                    US10::US10_Plain
                }
            }
        }
    };
    match &v83 {
        US10::US10_Plain => {
            let mut v110: US4 = with_handle_23(v11.clone(), v0.clone(), v1.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7, v8, v9, v10);
            (v110.clone(), v12.clone())
        }
        US10::US10_Switched(v84) => {
            let mut v84: US6 = v84.clone();
            let (mut v85, mut v86, mut v87, mut v88, mut v89, mut v90, mut v91, mut v92, mut v93, mut v94, mut v95, mut v96): (Rc<UH0>, US3, i32, i32, i32, US2, Rc<str>, Rc<str>, bool, bool, i32, bool) = apply_switch_24(v84.clone(), v0.clone(), v1.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7, v8, v9, v10);
            let mut v97: US4 = US4::US4_Ok(v85.clone(), v86.clone(), v87, v88, v89, v90.clone(), v91.clone(), v92.clone(), v93, v94, v95, v96);
            (v97.clone(), v12.clone())
        }
        US10::US10_Valued(v98) => {
            let mut v98: US8 = v98.clone();
            match &*v12 {
                UH0::UH0_Cons(v103, v104) => {
                    let mut v103: Rc<str> = v103.clone();
                    let mut v104: Rc<UH0> = v104.clone();
                    let mut v105: US4 = apply_flag_25(v98.clone(), v11.clone(), v103.clone(), v0.clone(), v1.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7, v8, v9, v10);
                    (v105.clone(), v104.clone())
                }
                UH0::UH0_Nil => {
                    let mut v99: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" needs a value"); } LIT.with(|lit| lit.clone()) };
                    let mut v100: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v99));
                    let mut v101: US4 = US4::US4_Error(v100.clone());
                    let mut v102: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    (v101.clone(), v102.clone())
                }
            }
        }
    }
}
fn parse_from_2(mut v0: Rc<UH0>, mut v1: US3, mut v2: i32, mut v3: i32, mut v4: i32, mut v5: US2, mut v6: Rc<str>, mut v7: bool, mut v8: bool, mut v9: i32, mut v10: bool, mut v11: Rc<UH0>) -> US0 {
    match &*v11 {
        UH0::UH0_Cons(v13, v14) => {
            let mut v13: Rc<str> = v13.clone();
            let mut v14: Rc<UH0> = v14.clone();
            let (mut v15, mut v16): (US4, Rc<UH0>) = advance_22(v0.clone(), v1.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7, v8, v9, v10, v13.clone(), v14.clone());
            match &v15 {
                US4::US4_Error(v30) => {
                    let mut v30: Rc<str> = v30.clone();
                    US0::US0_Rejected(v30.clone())
                }
                US4::US4_Ok(v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28) => {
                    let mut v17: Rc<UH0> = v17.clone();
                    let mut v18: US3 = v18.clone();
                    let mut v19: i32 = *v19;
                    let mut v20: i32 = *v20;
                    let mut v21: i32 = *v21;
                    let mut v22: US2 = v22.clone();
                    let mut v23: Rc<str> = v23.clone();
                    let mut v24: Rc<str> = v24.clone();
                    let mut v25: bool = *v25;
                    let mut v26: bool = *v26;
                    let mut v27: i32 = *v27;
                    let mut v28: bool = *v28;
                    parse_from_3(v17.clone(), v18.clone(), v19, v20, v21, v22.clone(), v23.clone(), v24.clone(), v25, v26, v27, v28, v16.clone())
                }
            }
        }
        UH0::UH0_Nil => {
            capped_20(v0.clone(), v1.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7, v8, v9, v10)
        }
    }
}
fn method28(mut v0: Rc<UH0>, mut v1: bool) -> bool {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
                let mut v9: bool = if v1 {
                    true
                } else {
                    let mut v4: bool = v2.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("--help"); } LIT.with(|lit| lit.clone()) };
                    let mut v6: bool = if v4 {
                        true
                    } else {
                        let mut v5: bool = v2.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("-h"); } LIT.with(|lit| lit.clone()) };
                        v5
                    };
                    if v6 {
                        true
                    } else {
                        let mut v7: bool = v2.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("help"); } LIT.with(|lit| lit.clone()) };
                        v7
                    }
                };
                (v0, v1) = (v3.clone(), v9);
                continue;
            }
            UH0::UH0_Nil => {
                return v1;
            }
        }
    }
}
fn parse_args_1(mut v0: Rc<UH0>) -> US0 {
    match &*v0 {
        UH0::UH0_Cons(v1, v2) => {
            let mut v1: Rc<str> = v1.clone();
            let mut v2: Rc<UH0> = v2.clone();
            let mut v3: bool = false;
            let mut v4: bool = method28(v0.clone(), v3);
            let mut v5: bool = v4 == false;
            if v5 {
                let mut v6: bool = v1.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("timeline"); } LIT.with(|lit| lit.clone()) };
                if v6 {
                    let mut v7: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let mut v8: US3 = US3::US3_None;
                    let mut v9: i32 = 5i32;
                    let mut v10: i32 = 20i32;
                    let mut v11: i32 = 0i32;
                    let mut v12: i32 = 20i32;
                    let mut v13: US2 = US2::US2_AtMost(v12);
                    let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let mut v15: bool = false;
                    let mut v16: bool = false;
                    let mut v17: i32 = 0i32;
                    let mut v18: bool = false;
                    parse_from_2(v7.clone(), v8.clone(), v9, v10, v11, v13.clone(), v14.clone(), v15, v16, v17, v18, v2.clone())
                } else {
                    let mut v20: bool = v1.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("post"); } LIT.with(|lit| lit.clone()) };
                    if v20 {
                        match &*v2 {
                            UH0::UH0_Cons(v21, v22) => {
                                let mut v21: Rc<str> = v21.clone();
                                let mut v22: Rc<UH0> = v22.clone();
                                match &*v22 {
                                    UH0::UH0_Nil => {
                                        let mut v23: bool = v21.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                                        let mut v24: bool = v23 != true;
                                        if v24 {
                                            US0::US0_PublishPost(v21.clone())
                                        } else {
                                            let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                            let mut v27: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v26));
                                            US0::US0_Rejected(v27.clone())
                                        }
                                    }
                                    _ => {
                                        let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                        let mut v31: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v30));
                                        US0::US0_Rejected(v31.clone())
                                    }
                                }
                            }
                            _ => {
                                let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v34));
                                US0::US0_Rejected(v35.clone())
                            }
                        }
                    } else {
                        let mut v38: bool = v1.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("delete"); } LIT.with(|lit| lit.clone()) };
                        if v38 {
                            match &*v2 {
                                UH0::UH0_Cons(v39, v40) => {
                                    let mut v39: Rc<str> = v39.clone();
                                    let mut v40: Rc<UH0> = v40.clone();
                                    match &*v40 {
                                        UH0::UH0_Nil => {
                                            let mut v41: bool = v39.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                                            let mut v42: bool = v41 != true;
                                            if v42 {
                                                US0::US0_RemovePost(v39.clone())
                                            } else {
                                                let mut v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                                let mut v45: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v44));
                                                US0::US0_Rejected(v45.clone())
                                            }
                                        }
                                        _ => {
                                            let mut v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                            let mut v49: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v48));
                                            US0::US0_Rejected(v49.clone())
                                        }
                                    }
                                }
                                _ => {
                                    let mut v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" takes exactly one argument"); } LIT.with(|lit| lit.clone()) };
                                    let mut v53: Rc<str> = Rc::<str>::from(format!("{}{}", v1, v52));
                                    US0::US0_Rejected(v53.clone())
                                }
                            }
                        } else {
                            let mut v56: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unknown command "); } LIT.with(|lit| lit.clone()) };
                            let mut v57: Rc<str> = Rc::<str>::from(format!("{}{}", v56, v1));
                            let mut v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("; try: xc timeline"); } LIT.with(|lit| lit.clone()) };
                            let mut v59: Rc<str> = Rc::<str>::from(format!("{}{}", v57, v58));
                            US0::US0_Rejected(v59.clone())
                        }
                    }
                }
            } else {
                US0::US0_ShowHelp
            }
        }
        _ => {
            US0::US0_ShowHelp
        }
    }
}
fn failed_30(mut v0: US14) -> US13 {
    let mut v33: Rc<str> = match &v0 {
        US14::US14_HttpStatus(v1, v2, v3) => {
            let mut v1: i32 = *v1;
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = Rc::<str>::from(format!("{:?}", v1));
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v4));
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v7));
            let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v2));
            let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v10));
            let mut v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v3));
            v12.clone()
        }
        US14::US14_NoSuchAccount(v27) => {
            let mut v27: Rc<str> = v27.clone();
            let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
            let mut v29: Rc<str> = Rc::<str>::from(format!("{}{}", v28, v27));
            v29.clone()
        }
        US14::US14_Transport(v13, v14) => {
            let mut v13: Rc<str> = v13.clone();
            let mut v14: Rc<str> = v14.clone();
            let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
            let mut v16: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v13));
            let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v17));
            let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v14));
            v19.clone()
        }
        US14::US14_Undecodable(v20, v21) => {
            let mut v20: Rc<str> = v20.clone();
            let mut v21: Rc<str> = v21.clone();
            let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
            let mut v23: Rc<str> = Rc::<str>::from(format!("{}{}", v22, v20));
            let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let mut v25: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v24));
            let mut v26: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v21));
            v26.clone()
        }
    };
    let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
    let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v33));
    eprintln!("{}", v35);
    US13::US13_ApiFailed
}
fn failed_after_32(mut v0: US14) -> US13 {
    let mut v33: Rc<str> = match &v0 {
        US14::US14_HttpStatus(v1, v2, v3) => {
            let mut v1: i32 = *v1;
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = Rc::<str>::from(format!("{:?}", v1));
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X API answered "); } LIT.with(|lit| lit.clone()) };
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v4));
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" for "); } LIT.with(|lit| lit.clone()) };
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v7));
            let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v2));
            let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let mut v11: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v10));
            let mut v12: Rc<str> = Rc::<str>::from(format!("{}{}", v11, v3));
            v12.clone()
        }
        US14::US14_NoSuchAccount(v27) => {
            let mut v27: Rc<str> = v27.clone();
            let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
            let mut v29: Rc<str> = Rc::<str>::from(format!("{}{}", v28, v27));
            v29.clone()
        }
        US14::US14_Transport(v13, v14) => {
            let mut v13: Rc<str> = v13.clone();
            let mut v14: Rc<str> = v14.clone();
            let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("could not reach the X API for "); } LIT.with(|lit| lit.clone()) };
            let mut v16: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v13));
            let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v17));
            let mut v19: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v14));
            v19.clone()
        }
        US14::US14_Undecodable(v20, v21) => {
            let mut v20: Rc<str> = v20.clone();
            let mut v21: Rc<str> = v21.clone();
            let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("unexpected X API reply for "); } LIT.with(|lit| lit.clone()) };
            let mut v23: Rc<str> = Rc::<str>::from(format!("{}{}", v22, v20));
            let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let mut v25: Rc<str> = Rc::<str>::from(format!("{}{}", v23, v24));
            let mut v26: Rc<str> = Rc::<str>::from(format!("{}{}", v25, v21));
            v26.clone()
        }
    };
    let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: stopped early, showing what was read before: "); } LIT.with(|lit| lit.clone()) };
    let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v33));
    eprintln!("{}", v35);
    US13::US13_ApiFailed
}
fn method33(mut v0: Rc<UH0>) -> () {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v1, v2) => {
                let mut v1: Rc<str> = v1.clone();
                let mut v2: Rc<UH0> = v2.clone();
                let mut v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
                let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", v3, v1));
                eprintln!("{}", v4);
                v0 = v2.clone();
                continue;
            }
            UH0::UH0_Nil => {
                return ();
            }
        }
        return ();
    }
}
fn method34(mut v0: Rc<UH0>) -> () {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v1, v2) => {
                let mut v1: Rc<str> = v1.clone();
                let mut v2: Rc<UH0> = v2.clone();
                println!("{}", v1);
                v0 = v2.clone();
                continue;
            }
            UH0::UH0_Nil => {
                return ();
            }
        }
        return ();
    }
}
fn show_31(mut v0: Rc<UH0>, mut v1: Rc<UH0>, mut v2: US15) -> US13 {
    method33(v1.clone());
    method34(v0.clone());
    match &v2 {
        US15::US15_None => {
            US13::US13_Shown
        }
        US15::US15_Some(v3) => {
            let mut v3: US14 = v3.clone();
            match &*v0 {
                UH0::UH0_Nil => {
                    failed_30(v3.clone())
                }
                _ => {
                    failed_after_32(v3.clone())
                }
            }
        }
    }
}
fn get_environment_variable_35(mut v0: Rc<str>) -> Rc<str> {
    let mut v1: Rc<str> = Rc::<str>::from(std::env::var(&*v0).unwrap_or_default());
    v1.clone()
}
fn method36(mut v0: Rc<str>, mut v1: i32, mut v2: i32) -> i32 {
    loop {
        let mut v3: bool = v2 >= v1;
        if v3 {
            return v1;
        } else {
            let mut v4: u8 = v0.clone().as_bytes()[v2 as usize];
            let mut v5: bool = v4 == b' ';
            let mut v11: bool = if v5 {
                true
            } else {
                let mut v6: bool = v4 == b'\t';
                if v6 {
                    true
                } else {
                    let mut v7: bool = v4 == b'\r';
                    if v7 {
                        true
                    } else {
                        let mut v8: bool = v4 == b'\n';
                        v8
                    }
                }
            };
            if v11 {
                let mut v12: i32 = v2.wrapping_add(1i32);
                (v0, v1, v2) = (v0.clone(), v1, v12);
                continue;
            } else {
                return v2;
            }
        }
    }
}
fn method37(mut v0: Rc<str>, mut v1: i32) -> i32 {
    loop {
        let mut v2: bool = v1 <= 0i32;
        if v2 {
            return -1i32;
        } else {
            let mut v3: i32 = v1.wrapping_sub(1i32);
            let mut v4: u8 = v0.clone().as_bytes()[v3 as usize];
            let mut v5: bool = v4 == b' ';
            let mut v11: bool = if v5 {
                true
            } else {
                let mut v6: bool = v4 == b'\t';
                if v6 {
                    true
                } else {
                    let mut v7: bool = v4 == b'\r';
                    if v7 {
                        true
                    } else {
                        let mut v8: bool = v4 == b'\n';
                        v8
                    }
                }
            };
            if v11 {
                (v0, v1) = (v0.clone(), v3);
                continue;
            } else {
                return v3;
            }
        }
    }
}
fn insert_sorted_41(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<UH1>) -> Rc<UH1> {
    match &*v2 {
        UH1::UH1_Cons(v3, v4, v5) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH1> = v5.clone();
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
                let mut v19: Rc<UH1> = insert_sorted_41(v0.clone(), v1.clone(), v5.clone());
                Rc::new(UH1::UH1_Cons(v3.clone(), v4.clone(), v19.clone()))
            } else {
                Rc::new(UH1::UH1_Cons(v0.clone(), v1.clone(), v2.clone()))
            }
        }
        _ => {
            Rc::new(UH1::UH1_Cons(v0.clone(), v1.clone(), v2.clone()))
        }
    }
}
fn method42(mut v0: Rc<UH1>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH1::UH1_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH1> = v4.clone();
            let mut v5: Rc<UH0> = method42(v4.clone(), v1.clone());
            let mut v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("="); } LIT.with(|lit| lit.clone()) };
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v6));
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v3));
            Rc::new(UH0::UH0_Cons(v8.clone(), v5.clone()))
        }
        UH1::UH1_Nil => {
            v1.clone()
        }
    }
}
fn method43(mut v0: Rc<UH0>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method43(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&"); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn oauth_header_40(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>) -> Rc<str> {
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
    let mut v33: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let mut v34: Rc<UH1> = insert_sorted_41(v31.clone(), v32.clone(), v33.clone());
    let mut v35: Rc<UH1> = insert_sorted_41(v28.clone(), v29.clone(), v34.clone());
    let mut v36: Rc<UH1> = insert_sorted_41(v24.clone(), v26.clone(), v35.clone());
    let mut v37: Rc<UH1> = insert_sorted_41(v21.clone(), v22.clone(), v36.clone());
    let mut v38: Rc<UH1> = insert_sorted_41(v18.clone(), v19.clone(), v37.clone());
    let mut v39: Rc<UH1> = insert_sorted_41(v14.clone(), v16.clone(), v38.clone());
    let mut v40: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v41: Rc<UH0> = method42(v39.clone(), v40.clone());
    let mut v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let (mut v43, mut v44): (Rc<str>, Rc<str>) = method43(v41.clone(), v42.clone());
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
fn reply_json_39(mut v0: Rc<str>, mut v1: US16, mut v2: US19, mut v3: Rc<str>) -> US20 {
    let mut v4: Rc<str> = Rc::<str>::from(format!("{}{}", v0, v3));
    let mut v11: Rc<str> = match &v2 {
        US19::US19_Read => {
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("GET"); } LIT.with(|lit| lit.clone()) };
            v5.clone()
        }
        US19::US19_Remove => {
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("DELETE"); } LIT.with(|lit| lit.clone()) };
            v8.clone()
        }
        US19::US19_Write(v6) => {
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("POST"); } LIT.with(|lit| lit.clone()) };
            v7.clone()
        }
    };
    let mut v23: Rc<str> = match &v1 {
        US16::US16_BearerToken(v12) => {
            let mut v12: Rc<str> = v12.clone();
            let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("Bearer "); } LIT.with(|lit| lit.clone()) };
            let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v12));
            v14.clone()
        }
        US16::US16_Signed(v15, v16, v17, v18, v19, v20) => {
            let mut v15: Rc<str> = v15.clone();
            let mut v16: Rc<str> = v16.clone();
            let mut v17: Rc<str> = v17.clone();
            let mut v18: Rc<str> = v18.clone();
            let mut v19: Rc<str> = v19.clone();
            let mut v20: Rc<str> = v20.clone();
            oauth_header_40(v15.clone(), v16.clone(), v17.clone(), v18.clone(), v11.clone(), v4.clone(), v19.clone(), v20.clone())
        }
    };
    let mut v36: (u16, std::rc::Rc<str>) = match &v2 {
        US19::US19_Read => {
            let mut v24: ureq::RequestBuilder<ureq::typestate::WithoutBody> = ureq::get(&*v4).header("Authorization", &*v23);
            let mut v25: ureq::RequestBuilder<ureq::typestate::WithoutBody> = v24.config().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(30))).build();
            let mut v26: (u16, std::rc::Rc<str>) = match ureq::RequestBuilder::call(v25) { Ok(mut r) => (r.status().as_u16(), Rc::<str>::from(r.body_mut().read_to_string().unwrap_or_default())), Err(e) => (0u16, Rc::<str>::from(e.to_string())) };
            v26.clone()
        }
        US19::US19_Remove => {
            let mut v27: ureq::RequestBuilder<ureq::typestate::WithoutBody> = ureq::delete(&*v4).header("Authorization", &*v23);
            let mut v28: ureq::RequestBuilder<ureq::typestate::WithoutBody> = v27.config().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(30))).build();
            let mut v29: (u16, std::rc::Rc<str>) = match ureq::RequestBuilder::call(v28) { Ok(mut r) => (r.status().as_u16(), Rc::<str>::from(r.body_mut().read_to_string().unwrap_or_default())), Err(e) => (0u16, Rc::<str>::from(e.to_string())) };
            v29.clone()
        }
        US19::US19_Write(v30) => {
            let mut v30: Rc<str> = v30.clone();
            let mut v31: ureq::RequestBuilder<ureq::typestate::WithBody> = ureq::post(&*v4).header("Authorization", &*v23).header("Content-Type", "application/json");
            let mut v32: ureq::RequestBuilder<ureq::typestate::WithBody> = v31.config().http_status_as_error(false).timeout_global(Some(std::time::Duration::from_secs(30))).build();
            let mut v33: (u16, std::rc::Rc<str>) = match ureq::RequestBuilder::send(v32, &*v30) { Ok(mut r) => (r.status().as_u16(), Rc::<str>::from(r.body_mut().read_to_string().unwrap_or_default())), Err(e) => (0u16, Rc::<str>::from(e.to_string())) };
            v33.clone()
        }
    };
    let mut v37: i32 = v36.0 as i32;
    let mut v38: Rc<str> = v36.1.clone();
    let mut v39: bool = v37 == 0i32;
    if v39 {
        let mut v40: US14 = US14::US14_Transport(v3.clone(), v38.clone());
        US20::US20_Error(v40.clone())
    } else {
        let mut v42: bool = v37 >= 200i32;
        let mut v44: bool = if v42 {
            let mut v43: bool = v37 < 300i32;
            v43
        } else {
            false
        };
        let mut v45: bool = v44 == false;
        if v45 {
            let mut v46: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v38).unwrap_or_default();
            let mut v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
            let mut v48: serde_json::Value = v46.get(&*v47).cloned().unwrap_or_default();
            let mut v49: Rc<str> = Rc::<str>::from(v48.as_str().unwrap_or(""));
            let mut v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
            let mut v51: serde_json::Value = v46.get(&*v50).cloned().unwrap_or_default();
            let mut v52: Rc<str> = Rc::<str>::from(v51.as_str().unwrap_or(""));
            let mut v53: bool = v49.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v54: bool = v53 != true;
            let mut v57: bool = if v54 {
                let mut v55: bool = v52.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v56: bool = v55 != true;
                v56
            } else {
                false
            };
            let mut v60: bool = if v57 {
                let mut v58: bool = v49.clone() == v52.clone();
                let mut v59: bool = v58 != true;
                v59
            } else {
                false
            };
            let mut v81: Rc<str> = if v60 {
                let mut v61: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                let mut v62: Rc<str> = Rc::<str>::from(format!("{}{}", v49, v61));
                let mut v63: Rc<str> = Rc::<str>::from(format!("{}{}", v62, v52));
                v63.clone()
            } else {
                let mut v64: bool = v52.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v65: bool = v64 != true;
                if v65 {
                    v52.clone()
                } else {
                    if v54 {
                        v49.clone()
                    } else {
                        let mut v66: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
                        let mut v67: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
                        let mut v68: Rc<str> = Rc::<str>::from(v38.replace(&*v66, &*v67));
                        let mut v69: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
                        let mut v70: Rc<str> = Rc::<str>::from(v68.replace(&*v69, &*v67));
                        let mut v71: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
                        let mut v72: Rc<str> = Rc::<str>::from(v70.replace(&*v71, &*v67));
                        let mut v73: i32 = (v72.clone().len() as i32);
                        let mut v74: bool = v73 <= 300i32;
                        if v74 {
                            v72.clone()
                        } else {
                            let mut v75: Rc<str> = string_slice(&v72.clone(), 0i32 as i64, 299i32 as i64);
                            let mut v76: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("..."); } LIT.with(|lit| lit.clone()) };
                            let mut v77: Rc<str> = Rc::<str>::from(format!("{}{}", v75, v76));
                            v77.clone()
                        }
                    }
                }
            };
            let mut v82: US14 = US14::US14_HttpStatus(v37, v3.clone(), v81.clone());
            US20::US20_Error(v82.clone())
        } else {
            let mut v84: serde_json::Value = serde_json::from_str::<serde_json::Value>(&*v38).unwrap_or_default();
            let mut v85: bool = v84.is_null();
            if v85 {
                let mut v86: i32 = (v38.clone().len() as i32);
                let mut v87: bool = v86 <= 300i32;
                let mut v91: Rc<str> = if v87 {
                    v38.clone()
                } else {
                    let mut v88: Rc<str> = string_slice(&v38.clone(), 0i32 as i64, 299i32 as i64);
                    let mut v89: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("..."); } LIT.with(|lit| lit.clone()) };
                    let mut v90: Rc<str> = Rc::<str>::from(format!("{}{}", v88, v89));
                    v90.clone()
                };
                let mut v92: US14 = US14::US14_Undecodable(v3.clone(), v91.clone());
                US20::US20_Error(v92.clone())
            } else {
                US20::US20_Ok(v84.clone())
            }
        }
    }
}
fn send_write_38(mut v0: Rc<str>, mut v1: US16, mut v2: US17) -> US18 {
    let mut v6: US19 = match &v2 {
        US17::US17_CreatePost(v3) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = Rc::<str>::from(serde_json::json!({"text": &*v3}).to_string());
            US19::US19_Write(v4.clone())
        }
    };
    let mut v9: Rc<str> = match &v2 {
        US17::US17_CreatePost(v7) => {
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets"); } LIT.with(|lit| lit.clone()) };
            v8.clone()
        }
    };
    let mut v10: US20 = reply_json_39(v0.clone(), v1.clone(), v6.clone(), v9.clone());
    match &v10 {
        US20::US20_Error(v24) => {
            let mut v24: US14 = v24.clone();
            US18::US18_Error(v24.clone())
        }
        US20::US20_Ok(v11) => {
            let mut v11: serde_json::Value = v11.clone();
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v13: serde_json::Value = v11.get(&*v12).cloned().unwrap_or_default();
            let (mut v21, mut v22): (Rc<str>, Rc<str>) = match &v2 {
                US17::US17_CreatePost(v14) => {
                    let mut v14: Rc<str> = v14.clone();
                    let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
                    let mut v16: serde_json::Value = v13.get(&*v15).cloned().unwrap_or_default();
                    let mut v17: Rc<str> = Rc::<str>::from(v16.as_str().unwrap_or(""));
                    let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("text"); } LIT.with(|lit| lit.clone()) };
                    let mut v19: serde_json::Value = v13.get(&*v18).cloned().unwrap_or_default();
                    let mut v20: Rc<str> = Rc::<str>::from(v19.as_str().unwrap_or(""));
                    (v17.clone(), v20.clone())
                }
            };
            US18::US18_Ok(v21.clone(), v22.clone())
        }
    }
}
fn send_write_44(mut v0: Rc<str>, mut v1: US16, mut v2: US21) -> US22 {
    let mut v5: US19 = match &v2 {
        US21::US21_DeletePost(v3) => {
            let mut v3: Rc<str> = v3.clone();
            US19::US19_Remove
        }
    };
    let mut v9: Rc<str> = match &v2 {
        US21::US21_DeletePost(v6) => {
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets/"); } LIT.with(|lit| lit.clone()) };
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v6));
            v8.clone()
        }
    };
    let mut v10: US20 = reply_json_39(v0.clone(), v1.clone(), v5.clone(), v9.clone());
    match &v10 {
        US20::US20_Error(v20) => {
            let mut v20: US14 = v20.clone();
            US22::US22_Error(v20.clone())
        }
        US20::US20_Ok(v11) => {
            let mut v11: serde_json::Value = v11.clone();
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
            let mut v13: serde_json::Value = v11.get(&*v12).cloned().unwrap_or_default();
            let mut v18: bool = match &v2 {
                US21::US21_DeletePost(v14) => {
                    let mut v14: Rc<str> = v14.clone();
                    let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("deleted"); } LIT.with(|lit| lit.clone()) };
                    let mut v16: serde_json::Value = v13.get(&*v15).cloned().unwrap_or_default();
                    let mut v17: bool = v16.as_bool().unwrap_or(false);
                    v17
                }
            };
            US22::US22_Ok(v18)
        }
    }
}
fn method49(mut v0: Rc<UH0>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method49(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn method50(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method50(v3.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v2.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn from_53(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH7>) -> Rc<UH7> {
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
            let mut v23: US27 = if v9 {
                let mut v10: US24 = US24::US24_Quoted;
                US27::US27_Some(v10.clone())
            } else {
                let mut v12: bool = v8.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replied_to"); } LIT.with(|lit| lit.clone()) };
                if v12 {
                    let mut v13: US24 = US24::US24_RepliedTo;
                    US27::US27_Some(v13.clone())
                } else {
                    let mut v15: bool = v8.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposted"); } LIT.with(|lit| lit.clone()) };
                    let mut v17: bool = if v15 {
                        true
                    } else {
                        let mut v16: bool = v8.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("retweeted"); } LIT.with(|lit| lit.clone()) };
                        v16
                    };
                    if v17 {
                        let mut v18: US24 = US24::US24_Reposted;
                        US27::US27_Some(v18.clone())
                    } else {
                        US27::US27_None
                    }
                }
            };
            let mut v32: Rc<UH4> = match &v23 {
                US27::US27_None => {
                    { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) }
                }
                US27::US27_Some(v24) => {
                    let mut v24: US24 = v24.clone();
                    let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("id"); } LIT.with(|lit| lit.clone()) };
                    let mut v26: serde_json::Value = v5.get(&*v25).cloned().unwrap_or_default();
                    let mut v27: Rc<str> = Rc::<str>::from(v26.as_str().unwrap_or(""));
                    let mut v28: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
                    Rc::new(UH4::UH4_Cons(v24.clone(), v27.clone(), v28.clone()))
                }
            };
            let mut v33: Rc<UH7> = Rc::new(UH7::UH7_Cons(v32.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v33.clone());
            continue;
        }
    }
}
fn method55(mut v0: Rc<UH4>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH4::UH4_Cons(v2, v3, v4) => {
            let mut v2: US24 = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH4> = v4.clone();
            let mut v5: Rc<UH4> = method55(v4.clone(), v1.clone());
            Rc::new(UH4::UH4_Cons(v2.clone(), v3.clone(), v5.clone()))
        }
        UH4::UH4_Nil => {
            v1.clone()
        }
    }
}
fn method54(mut v0: Rc<UH7>, mut v1: Rc<UH4>) -> Rc<UH4> {
    match &*v0 {
        UH7::UH7_Cons(v2, v3) => {
            let mut v2: Rc<UH4> = v2.clone();
            let mut v3: Rc<UH7> = v3.clone();
            let mut v4: Rc<UH4> = method54(v3.clone(), v1.clone());
            method55(v2.clone(), v4.clone())
        }
        UH7::UH7_Nil => {
            v1.clone()
        }
    }
}
fn from_56(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH5>) -> Rc<UH5> {
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
            let mut v15: Rc<UH5> = Rc::new(UH5::UH5_Cons(v8.clone(), v11.clone(), v14.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v15.clone());
            continue;
        }
    }
}
fn from_57(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
    loop {
        let mut v3: bool = v1 < 0i32;
        if v3 {
            return v2.clone();
        } else {
            let mut v4: i32 = v1.wrapping_sub(1i32);
            let mut v5: serde_json::Value = v0.get(v1 as usize).cloned().unwrap_or_default();
            let mut v6: Rc<str> = Rc::<str>::from(v5.as_str().unwrap_or(""));
            let mut v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v6.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v7.clone());
            continue;
        }
    }
}
fn post_by_52(mut v0: Rc<str>, mut v1: serde_json::Value) -> (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<UH4>, Rc<UH5>, Rc<UH0>) {
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
    let mut v19: Rc<UH7> = from_53(v15.clone(), v17, v18.clone());
    let mut v20: Rc<UH4> = { thread_local!{ static CASE: Rc<UH4> = Rc::new(UH4::UH4_Nil); } CASE.with(|case| case.clone()) };
    let mut v21: Rc<UH4> = method54(v19.clone(), v20.clone());
    let mut v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("entities"); } LIT.with(|lit| lit.clone()) };
    let mut v23: serde_json::Value = v1.get(&*v22).cloned().unwrap_or_default();
    let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("urls"); } LIT.with(|lit| lit.clone()) };
    let mut v25: serde_json::Value = v23.get(&*v24).cloned().unwrap_or_default();
    let mut v26: i32 = v25.as_array().map_or(0, |a| a.len()) as i32;
    let mut v27: i32 = v26.wrapping_sub(1i32);
    let mut v28: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
    let mut v29: Rc<UH5> = from_56(v25.clone(), v27, v28.clone());
    let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("attachments"); } LIT.with(|lit| lit.clone()) };
    let mut v31: serde_json::Value = v1.get(&*v30).cloned().unwrap_or_default();
    let mut v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("media_keys"); } LIT.with(|lit| lit.clone()) };
    let mut v33: serde_json::Value = v31.get(&*v32).cloned().unwrap_or_default();
    let mut v34: i32 = v33.as_array().map_or(0, |a| a.len()) as i32;
    let mut v35: i32 = v34.wrapping_sub(1i32);
    let mut v36: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v37: Rc<UH0> = from_57(v33.clone(), v35, v36.clone());
    (v4.clone(), v7.clone(), v0.clone(), v10.clone(), v13.clone(), v21.clone(), v29.clone(), v37.clone())
}
fn from_51(mut v0: Rc<str>, mut v1: serde_json::Value, mut v2: i32, mut v3: Rc<UH3>) -> Rc<UH3> {
    loop {
        let mut v4: bool = v2 < 0i32;
        if v4 {
            return v3.clone();
        } else {
            let mut v5: i32 = v2.wrapping_sub(1i32);
            let mut v6: serde_json::Value = v1.get(v2 as usize).cloned().unwrap_or_default();
            let (mut v7, mut v8, mut v9, mut v10, mut v11, mut v12, mut v13, mut v14): (Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<str>, Rc<UH4>, Rc<UH5>, Rc<UH0>) = post_by_52(v0.clone(), v6.clone());
            let mut v15: Rc<UH3> = Rc::new(UH3::UH3_Cons(v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v12.clone(), v13.clone(), v14.clone(), v3.clone()));
            (v0, v1, v2, v3) = (v0.clone(), v1.clone(), v5, v15.clone());
            continue;
        }
    }
}
fn method58(mut v0: Rc<UH3>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH4> = v7.clone();
            let mut v8: Rc<UH5> = v8.clone();
            let mut v9: Rc<UH0> = v9.clone();
            let mut v10: Rc<UH3> = v10.clone();
            let mut v11: Rc<UH3> = method58(v10.clone(), v1.clone());
            Rc::new(UH3::UH3_Cons(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v11.clone()))
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn from_59(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH6>) -> Rc<UH6> {
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
            let mut v15: Rc<UH6> = Rc::new(UH6::UH6_Cons(v8.clone(), v11.clone(), v14.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v15.clone());
            continue;
        }
    }
}
fn from_60(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH2>) -> Rc<UH2> {
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
            let mut v12: Rc<UH2> = Rc::new(UH2::UH2_Cons(v8.clone(), v11.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v12.clone());
            continue;
        }
    }
}
fn method61(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH2> = method61(v4.clone(), v1.clone());
            let mut v6: bool = v3.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v7: bool = v6 != true;
            if v7 {
                Rc::new(UH2::UH2_Cons(v2.clone(), v3.clone(), v5.clone()))
            } else {
                v5.clone()
            }
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn send_48(mut v0: Rc<str>, mut v1: US16, mut v2: US25) -> US26 {
    let mut v3: US19 = US19::US19_Read;
    let mut v106: Rc<str> = match &v2 {
        US25::US25_PostsById(v67, v68, v69, v70, v71, v72, v73, v74) => {
            let mut v67: Rc<UH0> = v67.clone();
            let mut v68: i32 = *v68;
            let mut v69: Rc<str> = v69.clone();
            let mut v70: Rc<str> = v70.clone();
            let mut v71: bool = *v71;
            let mut v72: bool = *v72;
            let mut v73: i32 = *v73;
            let mut v74: bool = *v74;
            let mut v75: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v76, mut v77): (Rc<str>, Rc<str>) = method49(v67.clone(), v75.clone());
            let mut v78: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/tweets?ids="); } LIT.with(|lit| lit.clone()) };
            let mut v79: Rc<str> = Rc::<str>::from(format!("{}{}", v78, v76));
            let mut v81: Rc<str> = if v74 {
                let mut v80: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&media.fields=type,alt_text"); } LIT.with(|lit| lit.clone()) };
                v80.clone()
            } else {
                v75.clone()
            };
            let mut v82: bool = v73 > 0i32;
            let mut v89: Rc<UH0> = if v82 {
                let mut v83: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
                let mut v84: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts.author_id"); } LIT.with(|lit| lit.clone()) };
                let mut v85: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let mut v86: Rc<UH0> = Rc::new(UH0::UH0_Cons(v84.clone(), v85.clone()));
                Rc::new(UH0::UH0_Cons(v83.clone(), v86.clone()))
            } else {
                { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
            };
            let mut v94: Rc<UH0> = if v74 {
                let mut v90: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("attachments.media_keys"); } LIT.with(|lit| lit.clone()) };
                let mut v91: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                Rc::new(UH0::UH0_Cons(v90.clone(), v91.clone()))
            } else {
                { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
            };
            let mut v95: Rc<UH0> = method50(v89.clone(), v94.clone());
            let mut v101: Rc<str> = match &*v95 {
                UH0::UH0_Nil => {
                    v75.clone()
                }
                _ => {
                    let (mut v96, mut v97): (Rc<str>, Rc<str>) = method49(v95.clone(), v75.clone());
                    let mut v98: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&expansions="); } LIT.with(|lit| lit.clone()) };
                    let mut v99: Rc<str> = Rc::<str>::from(format!("{}{}", v98, v96));
                    let mut v100: Rc<str> = Rc::<str>::from(format!("{}{}", v99, v81));
                    v100.clone()
                }
            };
            let mut v102: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&post.fields=created_at,author_id,entities,attachments"); } LIT.with(|lit| lit.clone()) };
            let mut v103: Rc<str> = Rc::<str>::from(format!("{}{}", v102, v101));
            let mut v104: Rc<str> = Rc::<str>::from(format!("{}{}", v79, v103));
            v104.clone()
        }
        US25::US25_PostsOf(v4, v5, v6, v7, v8, v9, v10, v11, v12) => {
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: i32 = *v6;
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<str> = v8.clone();
            let mut v9: bool = *v9;
            let mut v10: bool = *v10;
            let mut v11: i32 = *v11;
            let mut v12: bool = *v12;
            let mut v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users/"); } LIT.with(|lit| lit.clone()) };
            let mut v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, v4));
            let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/tweets?max_results="); } LIT.with(|lit| lit.clone()) };
            let mut v16: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v15));
            let mut v17: Rc<str> = Rc::<str>::from(format!("{:?}", v6));
            let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v17));
            let mut v21: Rc<str> = if v12 {
                let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&media.fields=type,alt_text"); } LIT.with(|lit| lit.clone()) };
                v19.clone()
            } else {
                let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v20.clone()
            };
            let mut v22: bool = v11 > 0i32;
            let mut v29: Rc<UH0> = if v22 {
                let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts"); } LIT.with(|lit| lit.clone()) };
                let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("referenced_posts.author_id"); } LIT.with(|lit| lit.clone()) };
                let mut v25: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                let mut v26: Rc<UH0> = Rc::new(UH0::UH0_Cons(v24.clone(), v25.clone()));
                Rc::new(UH0::UH0_Cons(v23.clone(), v26.clone()))
            } else {
                { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
            };
            let mut v34: Rc<UH0> = if v12 {
                let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("attachments.media_keys"); } LIT.with(|lit| lit.clone()) };
                let mut v31: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                Rc::new(UH0::UH0_Cons(v30.clone(), v31.clone()))
            } else {
                { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
            };
            let mut v35: Rc<UH0> = method50(v29.clone(), v34.clone());
            let mut v43: Rc<str> = match &*v35 {
                UH0::UH0_Nil => {
                    let mut v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    v36.clone()
                }
                _ => {
                    let mut v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let (mut v38, mut v39): (Rc<str>, Rc<str>) = method49(v35.clone(), v37.clone());
                    let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&expansions="); } LIT.with(|lit| lit.clone()) };
                    let mut v41: Rc<str> = Rc::<str>::from(format!("{}{}", v40, v38));
                    let mut v42: Rc<str> = Rc::<str>::from(format!("{}{}", v41, v21));
                    v42.clone()
                }
            };
            let mut v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&post.fields=created_at,author_id,entities,attachments"); } LIT.with(|lit| lit.clone()) };
            let mut v45: Rc<str> = Rc::<str>::from(format!("{}{}", v44, v43));
            let mut v46: Rc<str> = Rc::<str>::from(format!("{}{}", v18, v45));
            let mut v47: bool = v7.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v51: Rc<str> = if v47 {
                let mut v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v48.clone()
            } else {
                let mut v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&start_time="); } LIT.with(|lit| lit.clone()) };
                let mut v50: Rc<str> = Rc::<str>::from(format!("{}{}", v49, v7));
                v50.clone()
            };
            let mut v52: bool = v8.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v56: Rc<str> = if v52 {
                let mut v53: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v53.clone()
            } else {
                let mut v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&end_time="); } LIT.with(|lit| lit.clone()) };
                let mut v55: Rc<str> = Rc::<str>::from(format!("{}{}", v54, v8));
                v55.clone()
            };
            let mut v57: Rc<str> = Rc::<str>::from(format!("{}{}", v51, v56));
            let mut v58: Rc<str> = Rc::<str>::from(format!("{}{}", v46, v57));
            let mut v65: Rc<str> = if v9 {
                if v10 {
                    let mut v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&exclude=replies,retweets"); } LIT.with(|lit| lit.clone()) };
                    v59.clone()
                } else {
                    let mut v60: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&exclude=replies"); } LIT.with(|lit| lit.clone()) };
                    v60.clone()
                }
            } else {
                if v10 {
                    let mut v62: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&exclude=retweets"); } LIT.with(|lit| lit.clone()) };
                    v62.clone()
                } else {
                    let mut v63: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    v63.clone()
                }
            };
            let mut v66: Rc<str> = Rc::<str>::from(format!("{}{}", v58, v65));
            v66.clone()
        }
    };
    let mut v107: US20 = reply_json_39(v0.clone(), v1.clone(), v3.clone(), v106.clone());
    match &v107 {
        US20::US20_Error(v221) => {
            let mut v221: US14 = v221.clone();
            US26::US26_Error(v221.clone())
        }
        US20::US20_Ok(v108) => {
            let mut v108: serde_json::Value = v108.clone();
            let (mut v215, mut v216, mut v217, mut v218, mut v219): (Rc<UH3>, Rc<UH6>, Rc<UH2>, Rc<UH3>, Rc<str>) = match &v2 {
                US25::US25_PostsById(v160, v161, v162, v163, v164, v165, v166, v167) => {
                    let mut v160: Rc<UH0> = v160.clone();
                    let mut v161: i32 = *v161;
                    let mut v162: Rc<str> = v162.clone();
                    let mut v163: Rc<str> = v163.clone();
                    let mut v164: bool = *v164;
                    let mut v165: bool = *v165;
                    let mut v166: i32 = *v166;
                    let mut v167: bool = *v167;
                    let mut v168: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
                    let mut v169: serde_json::Value = v108.get(&*v168).cloned().unwrap_or_default();
                    let mut v170: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let mut v171: i32 = v169.as_array().map_or(0, |a| a.len()) as i32;
                    let mut v172: i32 = v171.wrapping_sub(1i32);
                    let mut v173: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
                    let mut v174: Rc<UH3> = from_51(v170.clone(), v169.clone(), v172, v173.clone());
                    let mut v175: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("includes"); } LIT.with(|lit| lit.clone()) };
                    let mut v176: serde_json::Value = v108.get(&*v175).cloned().unwrap_or_default();
                    let mut v177: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts"); } LIT.with(|lit| lit.clone()) };
                    let mut v178: serde_json::Value = v176.get(&*v177).cloned().unwrap_or_default();
                    let mut v179: i32 = v178.as_array().map_or(0, |a| a.len()) as i32;
                    let mut v180: i32 = v179.wrapping_sub(1i32);
                    let mut v181: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
                    let mut v182: Rc<UH3> = from_51(v170.clone(), v178.clone(), v180, v181.clone());
                    let mut v183: Rc<UH3> = method58(v174.clone(), v182.clone());
                    let mut v184: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("media"); } LIT.with(|lit| lit.clone()) };
                    let mut v185: serde_json::Value = v176.get(&*v184).cloned().unwrap_or_default();
                    let mut v186: i32 = v185.as_array().map_or(0, |a| a.len()) as i32;
                    let mut v187: i32 = v186.wrapping_sub(1i32);
                    let mut v188: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
                    let mut v189: Rc<UH6> = from_59(v185.clone(), v187, v188.clone());
                    let mut v190: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("users"); } LIT.with(|lit| lit.clone()) };
                    let mut v191: serde_json::Value = v176.get(&*v190).cloned().unwrap_or_default();
                    let mut v192: i32 = v191.as_array().map_or(0, |a| a.len()) as i32;
                    let mut v193: i32 = v192.wrapping_sub(1i32);
                    let mut v194: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let mut v195: Rc<UH2> = from_60(v191.clone(), v193, v194.clone());
                    let mut v196: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let mut v197: Rc<UH2> = method61(v195.clone(), v196.clone());
                    let mut v198: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
                    let mut v199: serde_json::Value = v108.get(&*v198).cloned().unwrap_or_default();
                    let mut v200: serde_json::Value = v199.get(0i32 as usize).cloned().unwrap_or_default();
                    let mut v201: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
                    let mut v202: serde_json::Value = v200.get(&*v201).cloned().unwrap_or_default();
                    let mut v203: Rc<str> = Rc::<str>::from(v202.as_str().unwrap_or(""));
                    let mut v204: bool = v203.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let mut v205: bool = v204 != true;
                    let mut v209: Rc<str> = if v205 {
                        v203.clone()
                    } else {
                        let mut v206: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
                        let mut v207: serde_json::Value = v200.get(&*v206).cloned().unwrap_or_default();
                        let mut v208: Rc<str> = Rc::<str>::from(v207.as_str().unwrap_or(""));
                        v208.clone()
                    };
                    (v183.clone(), v189.clone(), v197.clone(), v174.clone(), v209.clone())
                }
                US25::US25_PostsOf(v109, v110, v111, v112, v113, v114, v115, v116, v117) => {
                    let mut v109: Rc<str> = v109.clone();
                    let mut v110: Rc<str> = v110.clone();
                    let mut v111: i32 = *v111;
                    let mut v112: Rc<str> = v112.clone();
                    let mut v113: Rc<str> = v113.clone();
                    let mut v114: bool = *v114;
                    let mut v115: bool = *v115;
                    let mut v116: i32 = *v116;
                    let mut v117: bool = *v117;
                    let mut v118: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
                    let mut v119: serde_json::Value = v108.get(&*v118).cloned().unwrap_or_default();
                    let mut v120: i32 = v119.as_array().map_or(0, |a| a.len()) as i32;
                    let mut v121: i32 = v120.wrapping_sub(1i32);
                    let mut v122: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
                    let mut v123: Rc<UH3> = from_51(v110.clone(), v119.clone(), v121, v122.clone());
                    let mut v124: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("includes"); } LIT.with(|lit| lit.clone()) };
                    let mut v125: serde_json::Value = v108.get(&*v124).cloned().unwrap_or_default();
                    let mut v126: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posts"); } LIT.with(|lit| lit.clone()) };
                    let mut v127: serde_json::Value = v125.get(&*v126).cloned().unwrap_or_default();
                    let mut v128: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let mut v129: i32 = v127.as_array().map_or(0, |a| a.len()) as i32;
                    let mut v130: i32 = v129.wrapping_sub(1i32);
                    let mut v131: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
                    let mut v132: Rc<UH3> = from_51(v128.clone(), v127.clone(), v130, v131.clone());
                    let mut v133: Rc<UH3> = method58(v123.clone(), v132.clone());
                    let mut v134: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("media"); } LIT.with(|lit| lit.clone()) };
                    let mut v135: serde_json::Value = v125.get(&*v134).cloned().unwrap_or_default();
                    let mut v136: i32 = v135.as_array().map_or(0, |a| a.len()) as i32;
                    let mut v137: i32 = v136.wrapping_sub(1i32);
                    let mut v138: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
                    let mut v139: Rc<UH6> = from_59(v135.clone(), v137, v138.clone());
                    let mut v140: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("users"); } LIT.with(|lit| lit.clone()) };
                    let mut v141: serde_json::Value = v125.get(&*v140).cloned().unwrap_or_default();
                    let mut v142: i32 = v141.as_array().map_or(0, |a| a.len()) as i32;
                    let mut v143: i32 = v142.wrapping_sub(1i32);
                    let mut v144: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let mut v145: Rc<UH2> = from_60(v141.clone(), v143, v144.clone());
                    let mut v146: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let mut v147: Rc<UH2> = method61(v145.clone(), v146.clone());
                    let mut v148: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
                    let mut v149: serde_json::Value = v108.get(&*v148).cloned().unwrap_or_default();
                    let mut v150: serde_json::Value = v149.get(0i32 as usize).cloned().unwrap_or_default();
                    let mut v151: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("detail"); } LIT.with(|lit| lit.clone()) };
                    let mut v152: serde_json::Value = v150.get(&*v151).cloned().unwrap_or_default();
                    let mut v153: Rc<str> = Rc::<str>::from(v152.as_str().unwrap_or(""));
                    let mut v154: bool = v153.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let mut v155: bool = v154 != true;
                    let mut v159: Rc<str> = if v155 {
                        v153.clone()
                    } else {
                        let mut v156: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("title"); } LIT.with(|lit| lit.clone()) };
                        let mut v157: serde_json::Value = v150.get(&*v156).cloned().unwrap_or_default();
                        let mut v158: Rc<str> = Rc::<str>::from(v157.as_str().unwrap_or(""));
                        v158.clone()
                    };
                    (v133.clone(), v139.clone(), v147.clone(), v123.clone(), v159.clone())
                }
            };
            US26::US26_Ok(v215.clone(), v216.clone(), v217.clone(), v218.clone(), v219.clone())
        }
    }
}
fn method62(mut v0: Rc<UH6>, mut v1: Rc<UH6>) -> Rc<UH6> {
    match &*v0 {
        UH6::UH6_Cons(v2, v3, v4, v5) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH6> = v5.clone();
            let mut v6: Rc<UH6> = method62(v5.clone(), v1.clone());
            Rc::new(UH6::UH6_Cons(v2.clone(), v3.clone(), v4.clone(), v6.clone()))
        }
        UH6::UH6_Nil => {
            v1.clone()
        }
    }
}
fn method63(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v0 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: Rc<UH2> = method63(v4.clone(), v1.clone());
            Rc::new(UH2::UH2_Cons(v2.clone(), v3.clone(), v5.clone()))
        }
        UH2::UH2_Nil => {
            v1.clone()
        }
    }
}
fn gather_47(mut v0: Rc<str>, mut v1: US16, mut v2: i32, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: bool, mut v6: bool, mut v7: i32, mut v8: bool, mut v9: Rc<UH2>, mut v10: Rc<UH3>, mut v11: Rc<UH3>, mut v12: Rc<UH6>, mut v13: Rc<UH2>, mut v14: Rc<UH0>, mut v15: US15) -> (Rc<UH3>, Rc<UH3>, Rc<UH6>, Rc<UH2>, Rc<UH0>, US15) {
    let (mut v82, mut v83, mut v84, mut v85, mut v86, mut v87): (Rc<UH3>, Rc<UH3>, Rc<UH6>, Rc<UH2>, Rc<UH0>, US15) = match &*v9 {
        UH2::UH2_Nil => {
            (v10.clone(), v11.clone(), v12.clone(), v13.clone(), v14.clone(), v15.clone())
        }
        _ => {
            let (mut v76, mut v77, mut v78, mut v79, mut v80, mut v81): (Rc<UH3>, Rc<UH3>, Rc<UH6>, Rc<UH2>, Rc<UH0>, US15) = match &*v9 {
                UH2::UH2_Cons(v16, v17, v18) => {
                    let mut v16: Rc<str> = v16.clone();
                    let mut v17: Rc<str> = v17.clone();
                    let mut v18: Rc<UH2> = v18.clone();
                    let mut v19: US25 = US25::US25_PostsOf(v16.clone(), v17.clone(), v2, v3.clone(), v4.clone(), v5, v6, v7, v8);
                    let mut v20: US26 = send_48(v0.clone(), v1.clone(), v19.clone());
                    match &v20 {
                        US26::US26_Ok(v21, v22, v23, v24, v25) => {
                            let mut v21: Rc<UH3> = v21.clone();
                            let mut v22: Rc<UH6> = v22.clone();
                            let mut v23: Rc<UH2> = v23.clone();
                            let mut v24: Rc<UH3> = v24.clone();
                            let mut v25: Rc<str> = v25.clone();
                            let (mut v50, mut v51, mut v52, mut v53, mut v54, mut v55): (Rc<UH3>, Rc<UH3>, Rc<UH6>, Rc<UH2>, Rc<UH0>, US15) = match &*v24 {
                                UH3::UH3_Nil => {
                                    let mut v26: bool = v25.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                                    let mut v27: bool = v26 != true;
                                    if v27 {
                                        let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("skipped @"); } LIT.with(|lit| lit.clone()) };
                                        let mut v29: Rc<str> = Rc::<str>::from(format!("{}{}", v28, v17));
                                        let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
                                        let mut v31: Rc<str> = Rc::<str>::from(format!("{}{}", v29, v30));
                                        let mut v32: Rc<str> = Rc::<str>::from(format!("{}{}", v31, v25));
                                        let mut v33: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                                        let mut v34: Rc<UH0> = Rc::new(UH0::UH0_Cons(v32.clone(), v33.clone()));
                                        let mut v35: Rc<UH0> = method50(v14.clone(), v34.clone());
                                        (v10.clone(), v11.clone(), v12.clone(), v13.clone(), v35.clone(), v15.clone())
                                    } else {
                                        let mut v36: Rc<UH3> = method58(v24.clone(), v10.clone());
                                        let mut v37: Rc<UH3> = method58(v11.clone(), v21.clone());
                                        let mut v38: Rc<UH6> = method62(v12.clone(), v22.clone());
                                        let mut v39: Rc<UH2> = method63(v13.clone(), v23.clone());
                                        (v36.clone(), v37.clone(), v38.clone(), v39.clone(), v14.clone(), v15.clone())
                                    }
                                }
                                _ => {
                                    let mut v46: Rc<UH3> = method58(v24.clone(), v10.clone());
                                    let mut v47: Rc<UH3> = method58(v11.clone(), v21.clone());
                                    let mut v48: Rc<UH6> = method62(v12.clone(), v22.clone());
                                    let mut v49: Rc<UH2> = method63(v13.clone(), v23.clone());
                                    (v46.clone(), v47.clone(), v48.clone(), v49.clone(), v14.clone(), v15.clone())
                                }
                            };
                            gather_47(v0.clone(), v1.clone(), v2, v3.clone(), v4.clone(), v5, v6, v7, v8, v18.clone(), v50.clone(), v51.clone(), v52.clone(), v53.clone(), v54.clone(), v55.clone())
                        }
                        _ => {
                            let (mut v64, mut v65, mut v66, mut v67, mut v68, mut v69): (Rc<UH3>, Rc<UH3>, Rc<UH6>, Rc<UH2>, Rc<UH0>, US15) = match &v20 {
                                US26::US26_Error(v62) => {
                                    let mut v62: US14 = v62.clone();
                                    let mut v63: US15 = US15::US15_Some(v62.clone());
                                    (v10.clone(), v11.clone(), v12.clone(), v13.clone(), v14.clone(), v63.clone())
                                }
                                _ => unreachable!(),
                            };
                            (v64.clone(), v65.clone(), v66.clone(), v67.clone(), v68.clone(), v69.clone())
                        }
                    }
                }
                _ => unreachable!(),
            };
            (v76.clone(), v77.clone(), v78.clone(), v79.clone(), v80.clone(), v81.clone())
        }
    };
    (v82.clone(), v83.clone(), v84.clone(), v85.clone(), v86.clone(), v87.clone())
}
fn method65(mut v0: Rc<UH4>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH4::UH4_Cons(v2, v3, v4) => {
            let mut v2: US24 = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH4> = v4.clone();
            let mut v5: Rc<UH0> = method65(v4.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v3.clone(), v5.clone()))
        }
        UH4::UH4_Nil => {
            v1.clone()
        }
    }
}
fn method64(mut v0: Rc<UH3>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH4> = v7.clone();
            let mut v8: Rc<UH5> = v8.clone();
            let mut v9: Rc<UH0> = v9.clone();
            let mut v10: Rc<UH3> = v10.clone();
            let mut v11: Rc<UH0> = method64(v10.clone(), v1.clone());
            let mut v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v13: Rc<UH0> = method65(v7.clone(), v12.clone());
            method50(v13.clone(), v11.clone())
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn method68(mut v0: Rc<UH3>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH4> = v7.clone();
            let mut v8: Rc<UH5> = v8.clone();
            let mut v9: Rc<UH0> = v9.clone();
            let mut v10: Rc<UH3> = v10.clone();
            let mut v11: Rc<UH0> = method68(v10.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v2.clone(), v11.clone()))
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn method70(mut v0: Rc<str>, mut v1: Rc<UH0>, mut v2: US3) -> US3 {
    match &*v1 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: US3 = method70(v0.clone(), v4.clone(), v2.clone());
            let mut v6: bool = v0.clone() == v3.clone();
            if v6 {
                US3::US3_Some(v3.clone())
            } else {
                v5.clone()
            }
        }
        UH0::UH0_Nil => {
            v2.clone()
        }
    }
}
fn method69(mut v0: Rc<UH0>, mut v1: Rc<UH3>, mut v2: Rc<UH3>) -> Rc<UH3> {
    match &*v1 {
        UH3::UH3_Cons(v3, v4, v5, v6, v7, v8, v9, v10, v11) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<UH4> = v8.clone();
            let mut v9: Rc<UH5> = v9.clone();
            let mut v10: Rc<UH0> = v10.clone();
            let mut v11: Rc<UH3> = v11.clone();
            let mut v12: Rc<UH3> = method69(v0.clone(), v11.clone(), v2.clone());
            let mut v13: US3 = US3::US3_None;
            let mut v14: US3 = method70(v3.clone(), v0.clone(), v13.clone());
            let mut v17: bool = match &v14 {
                US3::US3_None => {
                    false
                }
                US3::US3_Some(v15) => {
                    let mut v15: Rc<str> = v15.clone();
                    true
                }
            };
            let mut v18: bool = v17 == false;
            if v18 {
                Rc::new(UH3::UH3_Cons(v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v12.clone()))
            } else {
                v12.clone()
            }
        }
        UH3::UH3_Nil => {
            v2.clone()
        }
    }
}
fn method71(mut v0: Rc<UH0>, mut v1: Rc<UH3>, mut v2: Rc<UH3>) -> Rc<UH3> {
    match &*v1 {
        UH3::UH3_Cons(v3, v4, v5, v6, v7, v8, v9, v10, v11) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<UH4> = v8.clone();
            let mut v9: Rc<UH5> = v9.clone();
            let mut v10: Rc<UH0> = v10.clone();
            let mut v11: Rc<UH3> = v11.clone();
            let mut v12: Rc<UH3> = method71(v0.clone(), v11.clone(), v2.clone());
            let mut v13: US3 = US3::US3_None;
            let mut v14: US3 = method70(v3.clone(), v0.clone(), v13.clone());
            let mut v17: bool = match &v14 {
                US3::US3_None => {
                    false
                }
                US3::US3_Some(v15) => {
                    let mut v15: Rc<str> = v15.clone();
                    true
                }
            };
            if v17 {
                Rc::new(UH3::UH3_Cons(v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v12.clone()))
            } else {
                v12.clone()
            }
        }
        UH3::UH3_Nil => {
            v2.clone()
        }
    }
}
fn deeper_67(mut v0: Rc<str>, mut v1: US16, mut v2: i32, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: bool, mut v6: bool, mut v7: i32, mut v8: bool, mut v9: i32, mut v10: Rc<UH0>, mut v11: Rc<UH3>, mut v12: Rc<UH6>, mut v13: Rc<UH2>, mut v14: Rc<UH3>, mut v15: Rc<UH6>, mut v16: Rc<UH2>, mut v17: Rc<UH3>, mut v18: Rc<str>) -> US28 {
    let mut v19: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v20: Rc<UH0> = method68(v14.clone(), v19.clone());
    let mut v21: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let mut v22: Rc<UH3> = method69(v20.clone(), v11.clone(), v21.clone());
    let mut v23: Rc<UH3> = method58(v14.clone(), v22.clone());
    let mut v24: Rc<UH6> = method62(v15.clone(), v12.clone());
    let mut v25: Rc<UH2> = method63(v16.clone(), v13.clone());
    let mut v26: i32 = v9.wrapping_add(1i32);
    let mut v27: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let mut v28: Rc<UH3> = method71(v10.clone(), v23.clone(), v27.clone());
    let mut v29: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v30: Rc<UH0> = method64(v28.clone(), v29.clone());
    deepen_66(v0.clone(), v1.clone(), v2, v3.clone(), v4.clone(), v5, v6, v7, v8, v26, v30.clone(), v23.clone(), v24.clone(), v25.clone())
}
fn method72(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match &*v0 {
            UH0::UH0_Cons(v2, v3) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<UH0> = v3.clone();
                let mut v4: US3 = US3::US3_None;
                let mut v5: US3 = method70(v2.clone(), v1.clone(), v4.clone());
                let mut v8: bool = match &v5 {
                    US3::US3_None => {
                        false
                    }
                    US3::US3_Some(v6) => {
                        let mut v6: Rc<str> = v6.clone();
                        true
                    }
                };
                let mut v12: Rc<UH0> = if v8 {
                    v1.clone()
                } else {
                    let mut v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let mut v10: Rc<UH0> = Rc::new(UH0::UH0_Cons(v2.clone(), v9.clone()));
                    method50(v1.clone(), v10.clone())
                };
                (v0, v1) = (v3.clone(), v12.clone());
                continue;
            }
            UH0::UH0_Nil => {
                return v1.clone();
            }
        }
    }
}
fn go_73(mut v0: i32, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v1 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: bool = v0 > 0i32;
            if v4 {
                let mut v5: i32 = v0.wrapping_sub(1i32);
                let mut v6: Rc<UH0> = go_73(v5, v3.clone());
                Rc::new(UH0::UH0_Cons(v2.clone(), v6.clone()))
            } else {
                { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
            }
        }
        _ => {
            { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
        }
    }
}
fn deepen_66(mut v0: Rc<str>, mut v1: US16, mut v2: i32, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: bool, mut v6: bool, mut v7: i32, mut v8: bool, mut v9: i32, mut v10: Rc<UH0>, mut v11: Rc<UH3>, mut v12: Rc<UH6>, mut v13: Rc<UH2>) -> US28 {
    let mut v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v15: Rc<UH0> = method72(v10.clone(), v14.clone());
    match &*v15 {
        UH0::UH0_Nil => {
            US28::US28_Ok(v11.clone(), v12.clone(), v13.clone())
        }
        _ => {
            let mut v17: bool = v9 >= v7;
            if v17 {
                US28::US28_Ok(v11.clone(), v12.clone(), v13.clone())
            } else {
                let mut v19: i32 = 100i32;
                let mut v20: Rc<UH0> = go_73(v19, v15.clone());
                let mut v21: US25 = US25::US25_PostsById(v20.clone(), v2, v3.clone(), v4.clone(), v5, v6, v7, v8);
                let mut v22: US26 = send_48(v0.clone(), v1.clone(), v21.clone());
                match &v22 {
                    US26::US26_Error(v29) => {
                        let mut v29: US14 = v29.clone();
                        US28::US28_Error(v29.clone())
                    }
                    US26::US26_Ok(v23, v24, v25, v26, v27) => {
                        let mut v23: Rc<UH3> = v23.clone();
                        let mut v24: Rc<UH6> = v24.clone();
                        let mut v25: Rc<UH2> = v25.clone();
                        let mut v26: Rc<UH3> = v26.clone();
                        let mut v27: Rc<str> = v27.clone();
                        deeper_67(v0.clone(), v1.clone(), v2, v3.clone(), v4.clone(), v5, v6, v7, v8, v9, v15.clone(), v11.clone(), v12.clone(), v13.clone(), v23.clone(), v24.clone(), v25.clone(), v26.clone(), v27.clone())
                    }
                }
            }
        }
    }
}
fn method76(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<UH4>, mut v6: Rc<UH5>, mut v7: Rc<UH0>, mut v8: Rc<UH2>, mut v9: US29) -> US29 {
    match &*v8 {
        UH2::UH2_Cons(v10, v11, v12) => {
            let mut v10: Rc<str> = v10.clone();
            let mut v11: Rc<str> = v11.clone();
            let mut v12: Rc<UH2> = v12.clone();
            let mut v13: US29 = method76(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v12.clone(), v9.clone());
            let mut v14: bool = v10.clone() == v1.clone();
            if v14 {
                US29::US29_Some(v10.clone(), v11.clone())
            } else {
                v13.clone()
            }
        }
        UH2::UH2_Nil => {
            v9.clone()
        }
    }
}
fn method75(mut v0: Rc<UH3>, mut v1: Rc<UH6>, mut v2: Rc<UH2>, mut v3: Rc<UH3>, mut v4: Rc<UH3>) -> Rc<UH3> {
    match &*v3 {
        UH3::UH3_Cons(v5, v6, v7, v8, v9, v10, v11, v12, v13) => {
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<str> = v8.clone();
            let mut v9: Rc<str> = v9.clone();
            let mut v10: Rc<UH4> = v10.clone();
            let mut v11: Rc<UH5> = v11.clone();
            let mut v12: Rc<UH0> = v12.clone();
            let mut v13: Rc<UH3> = v13.clone();
            let mut v14: Rc<UH3> = method75(v0.clone(), v1.clone(), v2.clone(), v13.clone(), v4.clone());
            let mut v15: bool = v7.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v23: bool = if v15 {
                let mut v16: US29 = US29::US29_None;
                let mut v17: US29 = method76(v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v12.clone(), v2.clone(), v16.clone());
                let mut v21: bool = match &v17 {
                    US29::US29_None => {
                        false
                    }
                    US29::US29_Some(v18, v19) => {
                        let mut v18: Rc<str> = v18.clone();
                        let mut v19: Rc<str> = v19.clone();
                        true
                    }
                };
                let mut v22: bool = v21 == false;
                v22
            } else {
                false
            };
            if v23 {
                Rc::new(UH3::UH3_Cons(v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v12.clone(), v14.clone()))
            } else {
                v14.clone()
            }
        }
        UH3::UH3_Nil => {
            v4.clone()
        }
    }
}
fn method74(mut v0: Rc<UH3>, mut v1: Rc<UH6>, mut v2: Rc<UH2>, mut v3: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH3::UH3_Cons(v4, v5, v6, v7, v8, v9, v10, v11, v12) => {
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<str> = v8.clone();
            let mut v9: Rc<UH4> = v9.clone();
            let mut v10: Rc<UH5> = v10.clone();
            let mut v11: Rc<UH0> = v11.clone();
            let mut v12: Rc<UH3> = v12.clone();
            let mut v13: Rc<UH3> = method75(v0.clone(), v1.clone(), v2.clone(), v12.clone(), v3.clone());
            let mut v14: bool = v6.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v22: bool = if v14 {
                let mut v15: US29 = US29::US29_None;
                let mut v16: US29 = method76(v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v2.clone(), v15.clone());
                let mut v20: bool = match &v16 {
                    US29::US29_None => {
                        false
                    }
                    US29::US29_Some(v17, v18) => {
                        let mut v17: Rc<str> = v17.clone();
                        let mut v18: Rc<str> = v18.clone();
                        true
                    }
                };
                let mut v21: bool = v20 == false;
                v21
            } else {
                false
            };
            if v22 {
                Rc::new(UH3::UH3_Cons(v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v13.clone()))
            } else {
                v13.clone()
            }
        }
        UH3::UH3_Nil => {
            v3.clone()
        }
    }
}
fn method77(mut v0: Rc<UH3>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH3::UH3_Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH4> = v7.clone();
            let mut v8: Rc<UH5> = v8.clone();
            let mut v9: Rc<UH0> = v9.clone();
            let mut v10: Rc<UH3> = v10.clone();
            let mut v11: Rc<UH0> = method77(v10.clone(), v1.clone());
            Rc::new(UH0::UH0_Cons(v3.clone(), v11.clone()))
        }
        UH3::UH3_Nil => {
            v1.clone()
        }
    }
}
fn from_79(mut v0: serde_json::Value, mut v1: i32, mut v2: Rc<UH0>) -> Rc<UH0> {
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
            let mut v9: Rc<UH0> = Rc::new(UH0::UH0_Cons(v8.clone(), v2.clone()));
            (v0, v1, v2) = (v0.clone(), v4, v9.clone());
            continue;
        }
    }
}
fn send_78(mut v0: Rc<str>, mut v1: US16, mut v2: US30) -> US31 {
    let mut v3: US19 = US19::US19_Read;
    let mut v17: Rc<str> = match &v2 {
        US30::US30_UsersById(v10) => {
            let mut v10: Rc<UH0> = v10.clone();
            let mut v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v12, mut v13): (Rc<str>, Rc<str>) = method49(v10.clone(), v11.clone());
            let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users?ids="); } LIT.with(|lit| lit.clone()) };
            let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v12));
            v15.clone()
        }
        US30::US30_UsersNamed(v4) => {
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let (mut v6, mut v7): (Rc<str>, Rc<str>) = method49(v4.clone(), v5.clone());
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users/by?usernames="); } LIT.with(|lit| lit.clone()) };
            let mut v9: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v6));
            v9.clone()
        }
    };
    let mut v18: US20 = reply_json_39(v0.clone(), v1.clone(), v3.clone(), v17.clone());
    match &v18 {
        US20::US20_Error(v51) => {
            let mut v51: US14 = v51.clone();
            US31::US31_Error(v51.clone())
        }
        US20::US20_Ok(v19) => {
            let mut v19: serde_json::Value = v19.clone();
            let (mut v48, mut v49): (Rc<UH2>, Rc<UH0>) = match &v2 {
                US30::US30_UsersById(v33) => {
                    let mut v33: Rc<UH0> = v33.clone();
                    let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
                    let mut v35: serde_json::Value = v19.get(&*v34).cloned().unwrap_or_default();
                    let mut v36: i32 = v35.as_array().map_or(0, |a| a.len()) as i32;
                    let mut v37: i32 = v36.wrapping_sub(1i32);
                    let mut v38: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let mut v39: Rc<UH2> = from_60(v35.clone(), v37, v38.clone());
                    let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
                    let mut v41: serde_json::Value = v19.get(&*v40).cloned().unwrap_or_default();
                    let mut v42: i32 = v41.as_array().map_or(0, |a| a.len()) as i32;
                    let mut v43: i32 = v42.wrapping_sub(1i32);
                    let mut v44: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let mut v45: Rc<UH0> = from_79(v41.clone(), v43, v44.clone());
                    (v39.clone(), v45.clone())
                }
                US30::US30_UsersNamed(v20) => {
                    let mut v20: Rc<UH0> = v20.clone();
                    let mut v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
                    let mut v22: serde_json::Value = v19.get(&*v21).cloned().unwrap_or_default();
                    let mut v23: i32 = v22.as_array().map_or(0, |a| a.len()) as i32;
                    let mut v24: i32 = v23.wrapping_sub(1i32);
                    let mut v25: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let mut v26: Rc<UH2> = from_60(v22.clone(), v24, v25.clone());
                    let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("errors"); } LIT.with(|lit| lit.clone()) };
                    let mut v28: serde_json::Value = v19.get(&*v27).cloned().unwrap_or_default();
                    let mut v29: i32 = v28.as_array().map_or(0, |a| a.len()) as i32;
                    let mut v30: i32 = v29.wrapping_sub(1i32);
                    let mut v31: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let mut v32: Rc<UH0> = from_79(v28.clone(), v30, v31.clone());
                    (v26.clone(), v32.clone())
                }
            };
            US31::US31_Ok(v48.clone(), v49.clone())
        }
    }
}
fn go_82(mut v0: i32, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v1 {
        UH3::UH3_Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<UH4> = v7.clone();
            let mut v8: Rc<UH5> = v8.clone();
            let mut v9: Rc<UH0> = v9.clone();
            let mut v10: Rc<UH3> = v10.clone();
            let mut v11: bool = v0 > 0i32;
            if v11 {
                let mut v12: i32 = v0.wrapping_sub(1i32);
                let mut v13: Rc<UH3> = go_82(v12, v10.clone());
                Rc::new(UH3::UH3_Cons(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v13.clone()))
            } else {
                { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) }
            }
        }
        _ => {
            { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) }
        }
    }
}
fn merge_newest_84(mut v0: Rc<UH3>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH3::UH3_Nil => {
            v1.clone()
        }
        _ => {
            match &*v1 {
                UH3::UH3_Nil => {
                    v0.clone()
                }
                _ => {
                    match &*v0 {
                        UH3::UH3_Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10) => {
                            let mut v2: Rc<str> = v2.clone();
                            let mut v3: Rc<str> = v3.clone();
                            let mut v4: Rc<str> = v4.clone();
                            let mut v5: Rc<str> = v5.clone();
                            let mut v6: Rc<str> = v6.clone();
                            let mut v7: Rc<UH4> = v7.clone();
                            let mut v8: Rc<UH5> = v8.clone();
                            let mut v9: Rc<UH0> = v9.clone();
                            let mut v10: Rc<UH3> = v10.clone();
                            match &*v1 {
                                UH3::UH3_Cons(v11, v12, v13, v14, v15, v16, v17, v18, v19) => {
                                    let mut v11: Rc<str> = v11.clone();
                                    let mut v12: Rc<str> = v12.clone();
                                    let mut v13: Rc<str> = v13.clone();
                                    let mut v14: Rc<str> = v14.clone();
                                    let mut v15: Rc<str> = v15.clone();
                                    let mut v16: Rc<UH4> = v16.clone();
                                    let mut v17: Rc<UH5> = v17.clone();
                                    let mut v18: Rc<UH0> = v18.clone();
                                    let mut v19: Rc<UH3> = v19.clone();
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
                                        let mut v47: Rc<UH3> = merge_newest_84(v10.clone(), v1.clone());
                                        Rc::new(UH3::UH3_Cons(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v47.clone()))
                                    } else {
                                        let mut v49: Rc<UH3> = merge_newest_84(v0.clone(), v19.clone());
                                        Rc::new(UH3::UH3_Cons(v11.clone(), v12.clone(), v13.clone(), v14.clone(), v15.clone(), v16.clone(), v17.clone(), v18.clone(), v49.clone()))
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
fn halves_85(mut v0: Rc<UH3>) -> (Rc<UH3>, Rc<UH3>) {
    match &*v0 {
        UH3::UH3_Cons(v1, v2, v3, v4, v5, v6, v7, v8, v9) => {
            let mut v1: Rc<str> = v1.clone();
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH4> = v6.clone();
            let mut v7: Rc<UH5> = v7.clone();
            let mut v8: Rc<UH0> = v8.clone();
            let mut v9: Rc<UH3> = v9.clone();
            match &*v9 {
                UH3::UH3_Cons(v10, v11, v12, v13, v14, v15, v16, v17, v18) => {
                    let mut v10: Rc<str> = v10.clone();
                    let mut v11: Rc<str> = v11.clone();
                    let mut v12: Rc<str> = v12.clone();
                    let mut v13: Rc<str> = v13.clone();
                    let mut v14: Rc<str> = v14.clone();
                    let mut v15: Rc<UH4> = v15.clone();
                    let mut v16: Rc<UH5> = v16.clone();
                    let mut v17: Rc<UH0> = v17.clone();
                    let mut v18: Rc<UH3> = v18.clone();
                    let (mut v19, mut v20): (Rc<UH3>, Rc<UH3>) = halves_85(v18.clone());
                    let mut v21: Rc<UH3> = Rc::new(UH3::UH3_Cons(v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v19.clone()));
                    let mut v22: Rc<UH3> = Rc::new(UH3::UH3_Cons(v10.clone(), v11.clone(), v12.clone(), v13.clone(), v14.clone(), v15.clone(), v16.clone(), v17.clone(), v20.clone()));
                    (v21.clone(), v22.clone())
                }
                _ => {
                    let mut v23: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
                    (v0.clone(), v23.clone())
                }
            }
        }
        _ => {
            let mut v26: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
            (v0.clone(), v26.clone())
        }
    }
}
fn newest_first_83(mut v0: Rc<UH3>) -> Rc<UH3> {
    match &*v0 {
        UH3::UH3_Cons(v1, v2, v3, v4, v5, v6, v7, v8, v9) => {
            let mut v1: Rc<str> = v1.clone();
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH4> = v6.clone();
            let mut v7: Rc<UH5> = v7.clone();
            let mut v8: Rc<UH0> = v8.clone();
            let mut v9: Rc<UH3> = v9.clone();
            match &*v9 {
                UH3::UH3_Nil => {
                    v0.clone()
                }
                _ => {
                    let (mut v10, mut v11): (Rc<UH3>, Rc<UH3>) = halves_85(v0.clone());
                    let mut v12: Rc<UH3> = newest_first_83(v10.clone());
                    let mut v13: Rc<UH3> = newest_first_83(v11.clone());
                    merge_newest_84(v12.clone(), v13.clone())
                }
            }
        }
        UH3::UH3_Nil => {
            v0.clone()
        }
    }
}
fn method87(mut v0: Rc<str>, mut v1: Rc<UH8>, mut v2: US32) -> US32 {
    match &*v1 {
        UH8::UH8_Cons(v3, v4, v5) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: i32 = *v4;
            let mut v5: Rc<UH8> = v5.clone();
            let mut v6: US32 = method87(v0.clone(), v5.clone(), v2.clone());
            let mut v7: bool = v3.clone() == v0.clone();
            if v7 {
                US32::US32_Some(v3.clone(), v4)
            } else {
                v6.clone()
            }
        }
        UH8::UH8_Nil => {
            v2.clone()
        }
    }
}
fn method88(mut v0: Rc<str>, mut v1: Rc<UH8>, mut v2: Rc<UH8>) -> Rc<UH8> {
    match &*v1 {
        UH8::UH8_Cons(v3, v4, v5) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: i32 = *v4;
            let mut v5: Rc<UH8> = v5.clone();
            let mut v6: Rc<UH8> = method88(v0.clone(), v5.clone(), v2.clone());
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
fn method86(mut v0: i32, mut v1: Rc<UH3>, mut v2: Rc<UH8>, mut v3: Rc<UH3>) -> (Rc<UH8>, Rc<UH3>) {
    let (mut v37, mut v38): (Rc<UH8>, Rc<UH3>) = match &*v1 {
        UH3::UH3_Cons(v4, v5, v6, v7, v8, v9, v10, v11, v12) => {
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<str> = v8.clone();
            let mut v9: Rc<UH4> = v9.clone();
            let mut v10: Rc<UH5> = v10.clone();
            let mut v11: Rc<UH0> = v11.clone();
            let mut v12: Rc<UH3> = v12.clone();
            let mut v13: US32 = US32::US32_None;
            let mut v14: US32 = method87(v6.clone(), v2.clone(), v13.clone());
            let mut v18: i32 = match &v14 {
                US32::US32_None => {
                    0i32
                }
                US32::US32_Some(v15, v16) => {
                    let mut v15: Rc<str> = v15.clone();
                    let mut v16: i32 = *v16;
                    v16
                }
            };
            let mut v19: bool = v18 >= v0;
            let (mut v31, mut v32): (Rc<UH8>, Rc<UH3>) = if v19 {
                (v2.clone(), v3.clone())
            } else {
                let mut v20: US32 = US32::US32_None;
                let mut v21: US32 = method87(v6.clone(), v2.clone(), v20.clone());
                let mut v25: i32 = match &v21 {
                    US32::US32_None => {
                        0i32
                    }
                    US32::US32_Some(v22, v23) => {
                        let mut v22: Rc<str> = v22.clone();
                        let mut v23: i32 = *v23;
                        v23
                    }
                };
                let mut v26: i32 = v25.wrapping_add(1i32);
                let mut v27: Rc<UH8> = { thread_local!{ static CASE: Rc<UH8> = Rc::new(UH8::UH8_Nil); } CASE.with(|case| case.clone()) };
                let mut v28: Rc<UH8> = method88(v6.clone(), v2.clone(), v27.clone());
                let mut v29: Rc<UH8> = Rc::new(UH8::UH8_Cons(v6.clone(), v26, v28.clone()));
                let mut v30: Rc<UH3> = Rc::new(UH3::UH3_Cons(v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v3.clone()));
                (v29.clone(), v30.clone())
            };
            method86(v0, v12.clone(), v31.clone(), v32.clone())
        }
        _ => {
            let (mut v35, mut v36): (Rc<UH8>, Rc<UH3>) = match &*v1 {
                UH3::UH3_Nil => {
                    (v2.clone(), v3.clone())
                }
                _ => unreachable!(),
            };
            (v35.clone(), v36.clone())
        }
    };
    (v37.clone(), v38.clone())
}
fn method89(mut v0: Rc<UH3>, mut v1: Rc<UH3>) -> Rc<UH3> {
    loop {
        match &*v0 {
            UH3::UH3_Cons(v2, v3, v4, v5, v6, v7, v8, v9, v10) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<str> = v3.clone();
                let mut v4: Rc<str> = v4.clone();
                let mut v5: Rc<str> = v5.clone();
                let mut v6: Rc<str> = v6.clone();
                let mut v7: Rc<UH4> = v7.clone();
                let mut v8: Rc<UH5> = v8.clone();
                let mut v9: Rc<UH0> = v9.clone();
                let mut v10: Rc<UH3> = v10.clone();
                let mut v11: Rc<UH3> = Rc::new(UH3::UH3_Cons(v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v1.clone()));
                (v0, v1) = (v10.clone(), v11.clone());
                continue;
            }
            UH3::UH3_Nil => {
                return v1.clone();
            }
        }
    }
}
fn selected_81(mut v0: i32, mut v1: i32, mut v2: Rc<UH3>) -> Rc<UH3> {
    let mut v3: Rc<UH3> = newest_first_83(v2.clone());
    let mut v4: bool = v1 <= 0i32;
    let mut v11: Rc<UH3> = if v4 {
        v3.clone()
    } else {
        let mut v5: Rc<UH8> = { thread_local!{ static CASE: Rc<UH8> = Rc::new(UH8::UH8_Nil); } CASE.with(|case| case.clone()) };
        let mut v6: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
        let (mut v7, mut v8): (Rc<UH8>, Rc<UH3>) = method86(v1, v3.clone(), v5.clone(), v6.clone());
        let mut v9: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
        method89(v8.clone(), v9.clone())
    };
    go_82(v0, v11.clone())
}
fn method92(mut v0: Rc<str>, mut v1: Rc<UH3>, mut v2: US33) -> US33 {
    match &*v1 {
        UH3::UH3_Cons(v3, v4, v5, v6, v7, v8, v9, v10, v11) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<UH4> = v8.clone();
            let mut v9: Rc<UH5> = v9.clone();
            let mut v10: Rc<UH0> = v10.clone();
            let mut v11: Rc<UH3> = v11.clone();
            let mut v12: US33 = method92(v0.clone(), v11.clone(), v2.clone());
            let mut v13: bool = v3.clone() == v0.clone();
            if v13 {
                US33::US33_Some(v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone())
            } else {
                v12.clone()
            }
        }
        UH3::UH3_Nil => {
            v2.clone()
        }
    }
}
fn method95(mut v0: Rc<UH5>, mut v1: Rc<str>) -> Rc<str> {
    loop {
        match &*v0 {
            UH5::UH5_Cons(v2, v3, v4, v5) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<str> = v3.clone();
                let mut v4: Rc<str> = v4.clone();
                let mut v5: Rc<UH5> = v5.clone();
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
            UH5::UH5_Nil => {
                return v1.clone();
            }
        }
    }
}
fn shown_text_94(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<UH4>, mut v6: Rc<UH5>, mut v7: Rc<UH0>) -> Rc<str> {
    let mut v8: Rc<str> = method95(v6.clone(), v4.clone());
    let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
    let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
    let mut v11: Rc<str> = Rc::<str>::from(v8.replace(&*v9, &*v10));
    let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let mut v13: Rc<str> = Rc::<str>::from(v11.replace(&*v12, &*v10));
    let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
    let mut v15: Rc<str> = Rc::<str>::from(v13.replace(&*v14, &*v10));
    v15.clone()
}
fn render_post_93(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<UH4>, mut v6: Rc<UH5>, mut v7: Rc<UH0>) -> Rc<str> {
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
    let mut v21: Rc<str> = shown_text_94(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone());
    let mut v22: Rc<str> = Rc::<str>::from(format!("{}{}", v20, v21));
    v22.clone()
}
fn method99(mut v0: i32, mut v1: i32) -> Rc<UH9> {
    let mut v2: bool = v1 < v0;
    if v2 {
        let mut v3: i32 = v1.wrapping_add(1i32);
        let mut v4: Rc<UH9> = method99(v0, v3);
        Rc::new(UH9::UH9_Cons(v1, v4.clone()))
    } else {
        { thread_local!{ static CASE: Rc<UH9> = Rc::new(UH9::UH9_Nil); } CASE.with(|case| case.clone()) }
    }
}
fn method100(mut v0: Rc<UH9>, mut v1: Rc<str>) -> Rc<str> {
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
fn method98(mut v0: i32, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> Rc<UH0> {
    match &*v1 {
        UH0::UH0_Cons(v3, v4) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH0> = v4.clone();
            let mut v5: Rc<UH0> = method98(v0, v4.clone(), v2.clone());
            let mut v6: i32 = 0i32;
            let mut v7: Rc<UH9> = method99(v0, v6);
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v9: Rc<str> = method100(v7.clone(), v8.clone());
            let mut v10: Rc<str> = Rc::<str>::from(format!("{}{}", v9, v3));
            Rc::new(UH0::UH0_Cons(v10.clone(), v5.clone()))
        }
        UH0::UH0_Nil => {
            v2.clone()
        }
    }
}
fn method102(mut v0: Rc<str>, mut v1: Rc<UH6>, mut v2: US34) -> US34 {
    match &*v1 {
        UH6::UH6_Cons(v3, v4, v5, v6) => {
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH6> = v6.clone();
            let mut v7: US34 = method102(v0.clone(), v6.clone(), v2.clone());
            let mut v8: bool = v3.clone() == v0.clone();
            if v8 {
                US34::US34_Some(v3.clone(), v4.clone(), v5.clone())
            } else {
                v7.clone()
            }
        }
        UH6::UH6_Nil => {
            v2.clone()
        }
    }
}
fn method101(mut v0: Rc<UH3>, mut v1: Rc<UH6>, mut v2: Rc<UH2>, mut v3: Rc<UH0>, mut v4: Rc<UH0>) -> Rc<UH0> {
    match &*v3 {
        UH0::UH0_Cons(v5, v6) => {
            let mut v5: Rc<str> = v5.clone();
            let mut v6: Rc<UH0> = v6.clone();
            let mut v7: Rc<UH0> = method101(v0.clone(), v1.clone(), v2.clone(), v6.clone(), v4.clone());
            let mut v8: US34 = US34::US34_None;
            let mut v9: US34 = method102(v5.clone(), v1.clone(), v8.clone());
            let mut v34: Rc<str> = match &v9 {
                US34::US34_None => {
                    let mut v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("[media]"); } LIT.with(|lit| lit.clone()) };
                    v32.clone()
                }
                US34::US34_Some(v10, v11, v12) => {
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
            Rc::new(UH0::UH0_Cons(v34.clone(), v7.clone()))
        }
        UH0::UH0_Nil => {
            v4.clone()
        }
    }
}
fn method103(mut v0: Rc<UH5>, mut v1: Rc<UH5>) -> Rc<UH5> {
    match &*v0 {
        UH5::UH5_Cons(v2, v3, v4, v5) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH5> = v5.clone();
            let mut v6: Rc<UH5> = method103(v5.clone(), v1.clone());
            let mut v7: bool = v4.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v8: bool = v7 != true;
            if v8 {
                Rc::new(UH5::UH5_Cons(v2.clone(), v3.clone(), v4.clone(), v6.clone()))
            } else {
                v6.clone()
            }
        }
        UH5::UH5_Nil => {
            v1.clone()
        }
    }
}
fn method104(mut v0: Rc<UH5>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH5::UH5_Cons(v2, v3, v4, v5) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<str> = v4.clone();
            let mut v5: Rc<UH5> = v5.clone();
            let mut v6: Rc<UH0> = method104(v5.clone(), v1.clone());
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r\n"); } LIT.with(|lit| lit.clone()) };
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" "); } LIT.with(|lit| lit.clone()) };
            let mut v9: Rc<str> = Rc::<str>::from(v4.replace(&*v7, &*v8));
            let mut v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
            let mut v11: Rc<str> = Rc::<str>::from(v9.replace(&*v10, &*v8));
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\r"); } LIT.with(|lit| lit.clone()) };
            let mut v13: Rc<str> = Rc::<str>::from(v11.replace(&*v12, &*v8));
            let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("[link] "); } LIT.with(|lit| lit.clone()) };
            let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v13));
            Rc::new(UH0::UH0_Cons(v15.clone(), v6.clone()))
        }
        UH5::UH5_Nil => {
            v1.clone()
        }
    }
}
fn hint_lines_97(mut v0: Rc<UH3>, mut v1: Rc<UH6>, mut v2: Rc<UH2>, mut v3: i32, mut v4: Rc<str>, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: Rc<str>, mut v9: Rc<UH4>, mut v10: Rc<UH5>, mut v11: Rc<UH0>) -> Rc<UH0> {
    let mut v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v13: Rc<UH0> = method101(v0.clone(), v1.clone(), v2.clone(), v11.clone(), v12.clone());
    let mut v14: Rc<UH5> = { thread_local!{ static CASE: Rc<UH5> = Rc::new(UH5::UH5_Nil); } CASE.with(|case| case.clone()) };
    let mut v15: Rc<UH5> = method103(v10.clone(), v14.clone());
    let mut v16: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v17: Rc<UH0> = method104(v15.clone(), v16.clone());
    let mut v18: Rc<UH0> = method50(v13.clone(), v17.clone());
    let mut v19: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    method98(v3, v18.clone(), v19.clone())
}
fn method108(mut v0: Rc<str>, mut v1: Rc<str>, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: Rc<str>, mut v5: Rc<UH4>, mut v6: Rc<UH5>, mut v7: Rc<UH0>, mut v8: Rc<UH2>, mut v9: US29) -> US29 {
    match &*v8 {
        UH2::UH2_Cons(v10, v11, v12) => {
            let mut v10: Rc<str> = v10.clone();
            let mut v11: Rc<str> = v11.clone();
            let mut v12: Rc<UH2> = v12.clone();
            let mut v13: US29 = method108(v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4.clone(), v5.clone(), v6.clone(), v7.clone(), v12.clone(), v9.clone());
            let mut v14: bool = v10.clone() == v1.clone();
            if v14 {
                US29::US29_Some(v10.clone(), v11.clone())
            } else {
                v13.clone()
            }
        }
        UH2::UH2_Nil => {
            v9.clone()
        }
    }
}
fn ref_line_107(mut v0: Rc<UH3>, mut v1: Rc<UH6>, mut v2: Rc<UH2>, mut v3: i32, mut v4: US24, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: Rc<str>, mut v9: Rc<str>, mut v10: Rc<UH4>, mut v11: Rc<UH5>, mut v12: Rc<UH0>) -> Rc<str> {
    let mut v13: i32 = 0i32;
    let mut v14: Rc<UH9> = method99(v3, v13);
    let mut v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
    let mut v16: Rc<str> = method100(v14.clone(), v15.clone());
    let mut v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("> "); } LIT.with(|lit| lit.clone()) };
    let mut v18: Rc<str> = Rc::<str>::from(format!("{}{}", v16, v17));
    let mut v24: Rc<str> = match &v4 {
        US24::US24_Quoted => {
            let mut v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
            v19.clone()
        }
        US24::US24_RepliedTo => {
            let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replying to"); } LIT.with(|lit| lit.clone()) };
            v20.clone()
        }
        US24::US24_Reposted => {
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
        let mut v30: US29 = US29::US29_None;
        let mut v31: US29 = method108(v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v12.clone(), v2.clone(), v30.clone());
        match &v31 {
            US29::US29_None => {
                let mut v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("user "); } LIT.with(|lit| lit.clone()) };
                let mut v35: Rc<str> = Rc::<str>::from(format!("{}{}", v34, v6));
                v35.clone()
            }
            US29::US29_Some(v32, v33) => {
                let mut v32: Rc<str> = v32.clone();
                let mut v33: Rc<str> = v33.clone();
                v33.clone()
            }
        }
    };
    let mut v39: Rc<str> = Rc::<str>::from(format!("{}{}", v27, v38));
    let mut v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
    let mut v41: Rc<str> = Rc::<str>::from(format!("{}{}", v39, v40));
    let mut v42: Rc<str> = shown_text_94(v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v12.clone());
    let mut v43: Rc<str> = Rc::<str>::from(format!("{}{}", v41, v42));
    v43.clone()
}
fn ref_lines_106(mut v0: Rc<UH3>, mut v1: Rc<UH6>, mut v2: Rc<UH2>, mut v3: i32, mut v4: bool, mut v5: i32, mut v6: US24, mut v7: Rc<str>) -> Rc<UH0> {
    let mut v8: US33 = US33::US33_None;
    let mut v9: US33 = method92(v7.clone(), v0.clone(), v8.clone());
    match &v9 {
        US33::US33_None => {
            let mut v22: i32 = v5.wrapping_add(1i32);
            let mut v23: i32 = 0i32;
            let mut v24: Rc<UH9> = method99(v22, v23);
            let mut v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v26: Rc<str> = method100(v24.clone(), v25.clone());
            let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("> "); } LIT.with(|lit| lit.clone()) };
            let mut v28: Rc<str> = Rc::<str>::from(format!("{}{}", v26, v27));
            let mut v34: Rc<str> = match &v6 {
                US24::US24_Quoted => {
                    let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
                    v29.clone()
                }
                US24::US24_RepliedTo => {
                    let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replying to"); } LIT.with(|lit| lit.clone()) };
                    v30.clone()
                }
                US24::US24_Reposted => {
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
            let mut v41: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            Rc::new(UH0::UH0_Cons(v40.clone(), v41.clone()))
        }
        US33::US33_Some(v10, v11, v12, v13, v14, v15, v16, v17) => {
            let mut v10: Rc<str> = v10.clone();
            let mut v11: Rc<str> = v11.clone();
            let mut v12: Rc<str> = v12.clone();
            let mut v13: Rc<str> = v13.clone();
            let mut v14: Rc<str> = v14.clone();
            let mut v15: Rc<UH4> = v15.clone();
            let mut v16: Rc<UH5> = v16.clone();
            let mut v17: Rc<UH0> = v17.clone();
            let mut v18: i32 = v5.wrapping_add(1i32);
            let mut v19: Rc<str> = ref_line_107(v0.clone(), v1.clone(), v2.clone(), v18, v6.clone(), v10.clone(), v11.clone(), v12.clone(), v13.clone(), v14.clone(), v15.clone(), v16.clone(), v17.clone());
            let mut v20: Rc<UH0> = post_lines_96(v0.clone(), v1.clone(), v2.clone(), v3, v4, v18, v10.clone(), v11.clone(), v12.clone(), v13.clone(), v14.clone(), v15.clone(), v16.clone(), v17.clone());
            Rc::new(UH0::UH0_Cons(v19.clone(), v20.clone()))
        }
    }
}
fn method105(mut v0: Rc<UH3>, mut v1: Rc<UH6>, mut v2: Rc<UH2>, mut v3: i32, mut v4: bool, mut v5: i32, mut v6: Rc<UH4>, mut v7: Rc<UH0>) -> Rc<UH0> {
    match &*v6 {
        UH4::UH4_Cons(v8, v9, v10) => {
            let mut v8: US24 = v8.clone();
            let mut v9: Rc<str> = v9.clone();
            let mut v10: Rc<UH4> = v10.clone();
            let mut v11: Rc<UH0> = method105(v0.clone(), v1.clone(), v2.clone(), v3, v4, v5, v10.clone(), v7.clone());
            let mut v12: Rc<UH0> = ref_lines_106(v0.clone(), v1.clone(), v2.clone(), v3, v4, v5, v8.clone(), v9.clone());
            method50(v12.clone(), v11.clone())
        }
        UH4::UH4_Nil => {
            v7.clone()
        }
    }
}
fn post_lines_96(mut v0: Rc<UH3>, mut v1: Rc<UH6>, mut v2: Rc<UH2>, mut v3: i32, mut v4: bool, mut v5: i32, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: Rc<str>, mut v9: Rc<str>, mut v10: Rc<str>, mut v11: Rc<UH4>, mut v12: Rc<UH5>, mut v13: Rc<UH0>) -> Rc<UH0> {
    let mut v17: Rc<UH0> = if v4 {
        let mut v14: i32 = v5.wrapping_add(1i32);
        hint_lines_97(v0.clone(), v1.clone(), v2.clone(), v14, v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v12.clone(), v13.clone())
    } else {
        { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
    };
    let mut v18: bool = v5 >= v3;
    if v18 {
        v17.clone()
    } else {
        let mut v19: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
        let mut v20: Rc<UH0> = method105(v0.clone(), v1.clone(), v2.clone(), v3, v4, v5, v11.clone(), v19.clone());
        method50(v17.clone(), v20.clone())
    }
}
fn entry_lines_91(mut v0: Rc<UH3>, mut v1: Rc<UH6>, mut v2: Rc<UH2>, mut v3: i32, mut v4: bool, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: Rc<str>, mut v8: Rc<str>, mut v9: Rc<str>, mut v10: Rc<UH4>, mut v11: Rc<UH5>, mut v12: Rc<UH0>) -> Rc<UH0> {
    let mut v22: US3 = match &*v10 {
        UH4::UH4_Cons(v13, v14, v15) => {
            let mut v13: US24 = v13.clone();
            let mut v14: Rc<str> = v14.clone();
            let mut v15: Rc<UH4> = v15.clone();
            match &*v15 {
                UH4::UH4_Nil => {
                    match &v13 {
                        US24::US24_Reposted => {
                            US3::US3_Some(v14.clone())
                        }
                        _ => {
                            US3::US3_None
                        }
                    }
                }
                _ => {
                    US3::US3_None
                }
            }
        }
        _ => {
            US3::US3_None
        }
    };
    let mut v30: US33 = match &v22 {
        US3::US3_Some(v23) => {
            let mut v23: Rc<str> = v23.clone();
            let mut v24: bool = v3 > 0i32;
            if v24 {
                let mut v25: US33 = US33::US33_None;
                method92(v23.clone(), v0.clone(), v25.clone())
            } else {
                US33::US33_None
            }
        }
        _ => {
            US33::US33_None
        }
    };
    match &v30 {
        US33::US33_None => {
            let mut v71: Rc<str> = render_post_93(v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v12.clone());
            let mut v72: i32 = 0i32;
            let mut v73: Rc<UH0> = post_lines_96(v0.clone(), v1.clone(), v2.clone(), v3, v4, v72, v5.clone(), v6.clone(), v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v12.clone());
            Rc::new(UH0::UH0_Cons(v71.clone(), v73.clone()))
        }
        US33::US33_Some(v31, v32, v33, v34, v35, v36, v37, v38) => {
            let mut v31: Rc<str> = v31.clone();
            let mut v32: Rc<str> = v32.clone();
            let mut v33: Rc<str> = v33.clone();
            let mut v34: Rc<str> = v34.clone();
            let mut v35: Rc<str> = v35.clone();
            let mut v36: Rc<UH4> = v36.clone();
            let mut v37: Rc<UH5> = v37.clone();
            let mut v38: Rc<UH0> = v38.clone();
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
                let mut v54: US29 = US29::US29_None;
                let mut v55: US29 = method108(v31.clone(), v32.clone(), v33.clone(), v34.clone(), v35.clone(), v36.clone(), v37.clone(), v38.clone(), v2.clone(), v54.clone());
                match &v55 {
                    US29::US29_None => {
                        let mut v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("user "); } LIT.with(|lit| lit.clone()) };
                        let mut v59: Rc<str> = Rc::<str>::from(format!("{}{}", v58, v32));
                        v59.clone()
                    }
                    US29::US29_Some(v56, v57) => {
                        let mut v56: Rc<str> = v56.clone();
                        let mut v57: Rc<str> = v57.clone();
                        v57.clone()
                    }
                }
            };
            let mut v63: Rc<str> = Rc::<str>::from(format!("{}{}", v51, v62));
            let mut v64: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(": "); } LIT.with(|lit| lit.clone()) };
            let mut v65: Rc<str> = Rc::<str>::from(format!("{}{}", v63, v64));
            let mut v66: Rc<str> = shown_text_94(v31.clone(), v32.clone(), v33.clone(), v34.clone(), v35.clone(), v36.clone(), v37.clone(), v38.clone());
            let mut v67: Rc<str> = Rc::<str>::from(format!("{}{}", v65, v66));
            let mut v68: i32 = 0i32;
            let mut v69: Rc<UH0> = post_lines_96(v0.clone(), v1.clone(), v2.clone(), v3, v4, v68, v31.clone(), v32.clone(), v33.clone(), v34.clone(), v35.clone(), v36.clone(), v37.clone(), v38.clone());
            Rc::new(UH0::UH0_Cons(v67.clone(), v69.clone()))
        }
    }
}
fn method90(mut v0: Rc<UH3>, mut v1: Rc<UH6>, mut v2: Rc<UH2>, mut v3: i32, mut v4: bool, mut v5: Rc<UH3>, mut v6: Rc<UH0>) -> Rc<UH0> {
    match &*v5 {
        UH3::UH3_Cons(v7, v8, v9, v10, v11, v12, v13, v14, v15) => {
            let mut v7: Rc<str> = v7.clone();
            let mut v8: Rc<str> = v8.clone();
            let mut v9: Rc<str> = v9.clone();
            let mut v10: Rc<str> = v10.clone();
            let mut v11: Rc<str> = v11.clone();
            let mut v12: Rc<UH4> = v12.clone();
            let mut v13: Rc<UH5> = v13.clone();
            let mut v14: Rc<UH0> = v14.clone();
            let mut v15: Rc<UH3> = v15.clone();
            let mut v16: Rc<UH0> = method90(v0.clone(), v1.clone(), v2.clone(), v3, v4, v15.clone(), v6.clone());
            let mut v17: Rc<UH0> = entry_lines_91(v0.clone(), v1.clone(), v2.clone(), v3, v4, v7.clone(), v8.clone(), v9.clone(), v10.clone(), v11.clone(), v12.clone(), v13.clone(), v14.clone());
            method50(v17.clone(), v16.clone())
        }
        UH3::UH3_Nil => {
            v6.clone()
        }
    }
}
fn rendered_80(mut v0: US1, mut v1: i32, mut v2: i32, mut v3: i32, mut v4: US2, mut v5: Rc<str>, mut v6: Rc<str>, mut v7: bool, mut v8: bool, mut v9: i32, mut v10: bool, mut v11: Rc<UH3>, mut v12: Rc<UH3>, mut v13: Rc<UH6>, mut v14: Rc<UH2>, mut v15: Rc<UH0>, mut v16: US15) -> (Rc<UH0>, Rc<UH0>, US15) {
    let mut v17: Rc<UH3> = selected_81(v2, v3, v11.clone());
    let mut v26: Rc<UH0> = match &v16 {
        US15::US15_None => {
            match &*v17 {
                UH3::UH3_Nil => {
                    let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no posts matched"); } LIT.with(|lit| lit.clone()) };
                    let mut v21: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    Rc::new(UH0::UH0_Cons(v20.clone(), v21.clone()))
                }
                _ => {
                    { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
                }
            }
        }
        US15::US15_Some(v18) => {
            let mut v18: US14 = v18.clone();
            { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) }
        }
    };
    let mut v27: Rc<UH0> = method50(v15.clone(), v26.clone());
    let mut v28: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v29: Rc<UH0> = method90(v12.clone(), v13.clone(), v14.clone(), v9, v10, v17.clone(), v28.clone());
    (v29.clone(), v27.clone(), v16.clone())
}
fn view_of_46(mut v0: Rc<str>, mut v1: US16, mut v2: US1, mut v3: i32, mut v4: i32, mut v5: i32, mut v6: US2, mut v7: Rc<str>, mut v8: Rc<str>, mut v9: bool, mut v10: bool, mut v11: i32, mut v12: bool, mut v13: Rc<UH2>, mut v14: Rc<UH0>) -> US23 {
    let mut v15: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let mut v16: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let mut v17: Rc<UH6> = { thread_local!{ static CASE: Rc<UH6> = Rc::new(UH6::UH6_Nil); } CASE.with(|case| case.clone()) };
    let mut v18: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
    let mut v19: US15 = US15::US15_None;
    let (mut v20, mut v21, mut v22, mut v23, mut v24, mut v25): (Rc<UH3>, Rc<UH3>, Rc<UH6>, Rc<UH2>, Rc<UH0>, US15) = gather_47(v0.clone(), v1.clone(), v3, v7.clone(), v8.clone(), v9, v10, v11, v12, v13.clone(), v15.clone(), v16.clone(), v17.clone(), v18.clone(), v14.clone(), v19.clone());
    let mut v28: bool = match &v25 {
        US15::US15_None => {
            false
        }
        US15::US15_Some(v26) => {
            let mut v26: US14 = v26.clone();
            true
        }
    };
    let (mut v84, mut v85, mut v86, mut v87, mut v88, mut v89): (Rc<UH3>, Rc<UH3>, Rc<UH6>, Rc<UH2>, Rc<UH0>, US15) = if v28 {
        (v20.clone(), v21.clone(), v22.clone(), v23.clone(), v24.clone(), v25.clone())
    } else {
        let mut v29: bool = v11 == 0i32;
        let (mut v78, mut v79, mut v80, mut v81, mut v82, mut v83): (Rc<UH3>, Rc<UH3>, Rc<UH6>, Rc<UH2>, Rc<UH0>, US15) = if v29 {
            (v20.clone(), v21.clone(), v22.clone(), v23.clone(), v24.clone(), v25.clone())
        } else {
            let mut v30: i32 = 1i32;
            let mut v31: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v32: Rc<UH0> = method64(v20.clone(), v31.clone());
            let mut v33: US28 = deepen_66(v0.clone(), v1.clone(), v3, v7.clone(), v8.clone(), v9, v10, v11, v12, v30, v32.clone(), v21.clone(), v22.clone(), v23.clone());
            let mut v60: US28 = match &v33 {
                US28::US28_Error(v57) => {
                    let mut v57: US14 = v57.clone();
                    US28::US28_Error(v57.clone())
                }
                US28::US28_Ok(v34, v35, v36) => {
                    let mut v34: Rc<UH3> = v34.clone();
                    let mut v35: Rc<UH6> = v35.clone();
                    let mut v36: Rc<UH2> = v36.clone();
                    let mut v37: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
                    let mut v38: Rc<UH3> = method74(v34.clone(), v35.clone(), v36.clone(), v37.clone());
                    let mut v39: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let mut v40: Rc<UH0> = method77(v38.clone(), v39.clone());
                    let mut v41: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                    let mut v42: Rc<UH0> = method72(v40.clone(), v41.clone());
                    match &*v42 {
                        UH0::UH0_Nil => {
                            US28::US28_Ok(v34.clone(), v35.clone(), v36.clone())
                        }
                        _ => {
                            let mut v44: i32 = 100i32;
                            let mut v45: Rc<UH0> = go_73(v44, v42.clone());
                            let mut v46: US30 = US30::US30_UsersById(v45.clone());
                            let mut v47: US31 = send_78(v0.clone(), v1.clone(), v46.clone());
                            match &v47 {
                                US31::US31_Error(v52) => {
                                    let mut v52: US14 = v52.clone();
                                    US28::US28_Error(v52.clone())
                                }
                                US31::US31_Ok(v48, v49) => {
                                    let mut v48: Rc<UH2> = v48.clone();
                                    let mut v49: Rc<UH0> = v49.clone();
                                    let mut v50: Rc<UH2> = method63(v36.clone(), v48.clone());
                                    US28::US28_Ok(v34.clone(), v35.clone(), v50.clone())
                                }
                            }
                        }
                    }
                }
            };
            let (mut v72, mut v73, mut v74, mut v75, mut v76, mut v77): (Rc<UH3>, Rc<UH3>, Rc<UH6>, Rc<UH2>, Rc<UH0>, US15) = match &v60 {
                US28::US28_Ok(v61, v62, v63) => {
                    let mut v61: Rc<UH3> = v61.clone();
                    let mut v62: Rc<UH6> = v62.clone();
                    let mut v63: Rc<UH2> = v63.clone();
                    (v20.clone(), v61.clone(), v62.clone(), v63.clone(), v24.clone(), v25.clone())
                }
                _ => {
                    let (mut v66, mut v67, mut v68, mut v69, mut v70, mut v71): (Rc<UH3>, Rc<UH3>, Rc<UH6>, Rc<UH2>, Rc<UH0>, US15) = match &v60 {
                        US28::US28_Error(v64) => {
                            let mut v64: US14 = v64.clone();
                            let mut v65: US15 = US15::US15_Some(v64.clone());
                            (v20.clone(), v21.clone(), v22.clone(), v23.clone(), v24.clone(), v65.clone())
                        }
                        _ => unreachable!(),
                    };
                    (v66.clone(), v67.clone(), v68.clone(), v69.clone(), v70.clone(), v71.clone())
                }
            };
            (v72.clone(), v73.clone(), v74.clone(), v75.clone(), v76.clone(), v77.clone())
        };
        (v78.clone(), v79.clone(), v80.clone(), v81.clone(), v82.clone(), v83.clone())
    };
    let (mut v90, mut v91, mut v92): (Rc<UH0>, Rc<UH0>, US15) = rendered_80(v2.clone(), v3, v4, v5, v6.clone(), v7.clone(), v8.clone(), v9, v10, v11, v12, v84.clone(), v85.clone(), v86.clone(), v87.clone(), v88.clone(), v89.clone());
    US23::US23_Ok(v90.clone(), v91.clone(), v92.clone())
}
fn method109(mut v0: Rc<UH0>, mut v1: Rc<str>) -> (Rc<str>, Rc<str>) {
    let (mut v11, mut v12): (Rc<str>, Rc<str>) = match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let (mut v4, mut v5): (Rc<str>, Rc<str>) = method109(v3.clone(), v1.clone());
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v2, v5));
            let mut v7: Rc<str> = Rc::<str>::from(format!("{}{}", v6, v4));
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(", @"); } LIT.with(|lit| lit.clone()) };
            (v7.clone(), v8.clone())
        }
        _ => {
            let (mut v9, mut v10): (Rc<str>, Rc<str>) = match &*v0 {
                UH0::UH0_Nil => {
                    (v1.clone(), v1.clone())
                }
                _ => unreachable!(),
            };
            (v9.clone(), v10.clone())
        }
    };
    (v11.clone(), v12.clone())
}
fn method110(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    match &*v0 {
        UH0::UH0_Cons(v2, v3) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<UH0> = v3.clone();
            let mut v4: Rc<UH0> = method110(v3.clone(), v1.clone());
            let mut v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("no X account @"); } LIT.with(|lit| lit.clone()) };
            let mut v6: Rc<str> = Rc::<str>::from(format!("{}{}", v5, v2));
            Rc::new(UH0::UH0_Cons(v6.clone(), v4.clone()))
        }
        UH0::UH0_Nil => {
            v1.clone()
        }
    }
}
fn method112(mut v0: Rc<UH2>, mut v1: i32) -> i32 {
    loop {
        match &*v0 {
            UH2::UH2_Cons(v2, v3, v4) => {
                let mut v2: Rc<str> = v2.clone();
                let mut v3: Rc<str> = v3.clone();
                let mut v4: Rc<UH2> = v4.clone();
                let mut v5: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v4.clone(), v5);
                continue;
            }
            UH2::UH2_Nil => {
                return v1;
            }
        }
    }
}
fn send_113(mut v0: Rc<str>, mut v1: US16, mut v2: US37) -> US38 {
    let mut v3: US19 = US19::US19_Read;
    let mut v18: Rc<str> = match &v2 {
        US37::US37_FollowedBy(v4, v5, v6) => {
            let mut v4: Rc<str> = v4.clone();
            let mut v5: i32 = *v5;
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/2/users/"); } LIT.with(|lit| lit.clone()) };
            let mut v8: Rc<str> = Rc::<str>::from(format!("{}{}", v7, v4));
            let mut v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/following?max_results="); } LIT.with(|lit| lit.clone()) };
            let mut v10: Rc<str> = Rc::<str>::from(format!("{}{}", v8, v9));
            let mut v11: Rc<str> = Rc::<str>::from(format!("{:?}", v5));
            let mut v12: Rc<str> = Rc::<str>::from(format!("{}{}", v10, v11));
            let mut v13: bool = v6.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            if v13 {
                v12.clone()
            } else {
                let mut v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("&pagination_token="); } LIT.with(|lit| lit.clone()) };
                let mut v15: Rc<str> = Rc::<str>::from(format!("{}{}", v12, v14));
                let mut v16: Rc<str> = Rc::<str>::from(format!("{}{}", v15, v6));
                v16.clone()
            }
        }
    };
    let mut v19: US20 = reply_json_39(v0.clone(), v1.clone(), v3.clone(), v18.clone());
    match &v19 {
        US20::US20_Error(v38) => {
            let mut v38: US14 = v38.clone();
            US38::US38_Error(v38.clone())
        }
        US20::US20_Ok(v20) => {
            let mut v20: serde_json::Value = v20.clone();
            let (mut v35, mut v36): (Rc<UH2>, Rc<str>) = match &v2 {
                US37::US37_FollowedBy(v21, v22, v23) => {
                    let mut v21: Rc<str> = v21.clone();
                    let mut v22: i32 = *v22;
                    let mut v23: Rc<str> = v23.clone();
                    let mut v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("data"); } LIT.with(|lit| lit.clone()) };
                    let mut v25: serde_json::Value = v20.get(&*v24).cloned().unwrap_or_default();
                    let mut v26: i32 = v25.as_array().map_or(0, |a| a.len()) as i32;
                    let mut v27: i32 = v26.wrapping_sub(1i32);
                    let mut v28: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let mut v29: Rc<UH2> = from_60(v25.clone(), v27, v28.clone());
                    let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("meta"); } LIT.with(|lit| lit.clone()) };
                    let mut v31: serde_json::Value = v20.get(&*v30).cloned().unwrap_or_default();
                    let mut v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("next_token"); } LIT.with(|lit| lit.clone()) };
                    let mut v33: serde_json::Value = v31.get(&*v32).cloned().unwrap_or_default();
                    let mut v34: Rc<str> = Rc::<str>::from(v33.as_str().unwrap_or(""));
                    (v29.clone(), v34.clone())
                }
            };
            US38::US38_Ok(v35.clone(), v36.clone())
        }
    }
}
fn go_114(mut v0: i32, mut v1: Rc<UH2>) -> Rc<UH2> {
    match &*v1 {
        UH2::UH2_Cons(v2, v3, v4) => {
            let mut v2: Rc<str> = v2.clone();
            let mut v3: Rc<str> = v3.clone();
            let mut v4: Rc<UH2> = v4.clone();
            let mut v5: bool = v0 > 0i32;
            if v5 {
                let mut v6: i32 = v0.wrapping_sub(1i32);
                let mut v7: Rc<UH2> = go_114(v6, v4.clone());
                Rc::new(UH2::UH2_Cons(v2.clone(), v3.clone(), v7.clone()))
            } else {
                { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
            }
        }
        _ => {
            { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
        }
    }
}
fn pages_111(mut v0: Rc<str>, mut v1: US16, mut v2: Rc<str>, mut v3: Rc<str>, mut v4: i32, mut v5: Rc<str>, mut v6: Rc<UH2>) -> US36 {
    loop {
        let mut v7: i32 = 0i32;
        let mut v8: i32 = method112(v6.clone(), v7);
        let mut v9: i32 = v4.wrapping_sub(v8);
        let mut v10: bool = v9 < 1000i32;
        let mut v11: i32 = if v10 {
            v9
        } else {
            1000i32
        };
        let mut v12: US37 = US37::US37_FollowedBy(v2.clone(), v11, v5.clone());
        let mut v13: US38 = send_113(v0.clone(), v1.clone(), v12.clone());
        match &v13 {
            US38::US38_Error(v27) => {
                let mut v27: US14 = v27.clone();
                return US36::US36_Error(v27.clone());
            }
            US38::US38_Ok(v14, v15) => {
                let mut v14: Rc<UH2> = v14.clone();
                let mut v15: Rc<str> = v15.clone();
                let mut v16: Rc<UH2> = method63(v6.clone(), v14.clone());
                let mut v17: i32 = 0i32;
                let mut v18: i32 = method112(v16.clone(), v17);
                let mut v19: bool = v18 >= v4;
                let mut v21: Rc<str> = if v19 {
                    let mut v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    v20.clone()
                } else {
                    v15.clone()
                };
                let mut v22: bool = v21.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                if v22 {
                    let mut v23: Rc<UH2> = go_114(v4, v16.clone());
                    return US36::US36_Ok(v23.clone());
                } else {
                    (v0, v1, v2, v3, v4, v5, v6) = (v0.clone(), v1.clone(), v2.clone(), v3.clone(), v4, v21.clone(), v16.clone());
                    continue;
                }
            }
        }
    }
}
fn timeline_of_45(mut v0: Rc<str>, mut v1: US16, mut v2: US1, mut v3: i32, mut v4: i32, mut v5: i32, mut v6: US2, mut v7: Rc<str>, mut v8: Rc<str>, mut v9: bool, mut v10: bool, mut v11: i32, mut v12: bool) -> US23 {
    match &v2 {
        US1::US1_Accounts(v13) => {
            let mut v13: Rc<UH0> = v13.clone();
            let mut v14: US30 = US30::US30_UsersNamed(v13.clone());
            let mut v15: US31 = send_78(v0.clone(), v1.clone(), v14.clone());
            match &v15 {
                US31::US31_Error(v27) => {
                    let mut v27: US14 = v27.clone();
                    US23::US23_Error(v27.clone())
                }
                US31::US31_Ok(v16, v17) => {
                    let mut v16: Rc<UH2> = v16.clone();
                    let mut v17: Rc<UH0> = v17.clone();
                    match &*v16 {
                        UH2::UH2_Nil => {
                            let mut v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                            let (mut v19, mut v20): (Rc<str>, Rc<str>) = method109(v17.clone(), v18.clone());
                            let mut v21: US14 = US14::US14_NoSuchAccount(v19.clone());
                            US23::US23_Error(v21.clone())
                        }
                        _ => {
                            let mut v23: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                            let mut v24: Rc<UH0> = method110(v17.clone(), v23.clone());
                            view_of_46(v0.clone(), v1.clone(), v2.clone(), v3, v4, v5, v6.clone(), v7.clone(), v8.clone(), v9, v10, v11, v12, v16.clone(), v24.clone())
                        }
                    }
                }
            }
        }
        US1::US1_FollowingOf(v31) => {
            let mut v31: Rc<str> = v31.clone();
            let mut v32: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
            let mut v33: Rc<UH0> = Rc::new(UH0::UH0_Cons(v31.clone(), v32.clone()));
            let mut v34: US30 = US30::US30_UsersNamed(v33.clone());
            let mut v35: US31 = send_78(v0.clone(), v1.clone(), v34.clone());
            let mut v49: US35 = match &v35 {
                US31::US31_Error(v46) => {
                    let mut v46: US14 = v46.clone();
                    US35::US35_Error(v46.clone())
                }
                US31::US31_Ok(v36, v37) => {
                    let mut v36: Rc<UH2> = v36.clone();
                    let mut v37: Rc<UH0> = v37.clone();
                    match &*v36 {
                        UH2::UH2_Cons(v38, v39, v40) => {
                            let mut v38: Rc<str> = v38.clone();
                            let mut v39: Rc<str> = v39.clone();
                            let mut v40: Rc<UH2> = v40.clone();
                            US35::US35_Ok(v38.clone(), v39.clone())
                        }
                        UH2::UH2_Nil => {
                            let mut v42: US14 = US14::US14_NoSuchAccount(v31.clone());
                            US35::US35_Error(v42.clone())
                        }
                    }
                }
            };
            match &v49 {
                US35::US35_Error(v77) => {
                    let mut v77: US14 = v77.clone();
                    US23::US23_Error(v77.clone())
                }
                US35::US35_Ok(v50, v51) => {
                    let mut v50: Rc<str> = v50.clone();
                    let mut v51: Rc<str> = v51.clone();
                    let mut v54: i32 = match &v6 {
                        US2::US2_AllFollowing => {
                            2147483647i32
                        }
                        US2::US2_AtMost(v52) => {
                            let mut v52: i32 = *v52;
                            v52
                        }
                    };
                    let mut v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let mut v56: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    let mut v57: US36 = pages_111(v0.clone(), v1.clone(), v50.clone(), v51.clone(), v54, v55.clone(), v56.clone());
                    match &v57 {
                        US36::US36_Error(v73) => {
                            let mut v73: US14 = v73.clone();
                            US23::US23_Error(v73.clone())
                        }
                        US36::US36_Ok(v58) => {
                            let mut v58: Rc<UH2> = v58.clone();
                            let mut v59: Rc<UH2> = Rc::new(UH2::UH2_Cons(v50.clone(), v51.clone(), v58.clone()));
                            let mut v60: i32 = 0i32;
                            let mut v61: i32 = method112(v58.clone(), v60);
                            let mut v62: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("home timeline of @"); } LIT.with(|lit| lit.clone()) };
                            let mut v63: Rc<str> = Rc::<str>::from(format!("{}{}", v62, v51));
                            let mut v64: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" from "); } LIT.with(|lit| lit.clone()) };
                            let mut v65: Rc<str> = Rc::<str>::from(format!("{}{}", v63, v64));
                            let mut v66: Rc<str> = Rc::<str>::from(format!("{:?}", v61));
                            let mut v67: Rc<str> = Rc::<str>::from(format!("{}{}", v65, v66));
                            let mut v68: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" followed accounts"); } LIT.with(|lit| lit.clone()) };
                            let mut v69: Rc<str> = Rc::<str>::from(format!("{}{}", v67, v68));
                            let mut v70: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
                            let mut v71: Rc<UH0> = Rc::new(UH0::UH0_Cons(v69.clone(), v70.clone()));
                            view_of_46(v0.clone(), v1.clone(), v2.clone(), v3, v4, v5, v6.clone(), v7.clone(), v8.clone(), v9, v10, v11, v12, v59.clone(), v71.clone())
                        }
                    }
                }
            }
        }
    }
}
fn outcome_of_29(mut v0: US0) -> US13 {
    match &v0 {
        US0::US0_PublishPost(v63) => {
            let mut v63: Rc<str> = v63.clone();
            let mut v64: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_CONSUMER_KEY"); } LIT.with(|lit| lit.clone()) };
            let mut v65: Rc<str> = get_environment_variable_35(v64.clone());
            let mut v66: i32 = (v65.clone().len() as i32);
            let mut v67: i32 = 0i32;
            let mut v68: i32 = method36(v65.clone(), v66, v67);
            let mut v69: i32 = v66.wrapping_sub(1i32);
            let mut v70: Rc<str> = string_slice(&v65.clone(), v68 as i64, v69 as i64);
            let mut v71: i32 = (v70.clone().len() as i32);
            let mut v72: i32 = method37(v70.clone(), v71);
            let mut v73: Rc<str> = string_slice(&v70.clone(), 0i32 as i64, v72 as i64);
            let mut v74: bool = v73.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v76: Rc<str> = if v74 {
                let mut v75: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v75.clone()
            } else {
                v73.clone()
            };
            let mut v77: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_CONSUMER_SECRET"); } LIT.with(|lit| lit.clone()) };
            let mut v78: Rc<str> = get_environment_variable_35(v77.clone());
            let mut v79: i32 = (v78.clone().len() as i32);
            let mut v80: i32 = 0i32;
            let mut v81: i32 = method36(v78.clone(), v79, v80);
            let mut v82: i32 = v79.wrapping_sub(1i32);
            let mut v83: Rc<str> = string_slice(&v78.clone(), v81 as i64, v82 as i64);
            let mut v84: i32 = (v83.clone().len() as i32);
            let mut v85: i32 = method37(v83.clone(), v84);
            let mut v86: Rc<str> = string_slice(&v83.clone(), 0i32 as i64, v85 as i64);
            let mut v87: bool = v86.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v89: Rc<str> = if v87 {
                let mut v88: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v88.clone()
            } else {
                v86.clone()
            };
            let mut v90: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH1_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
            let mut v91: Rc<str> = get_environment_variable_35(v90.clone());
            let mut v92: i32 = (v91.clone().len() as i32);
            let mut v93: i32 = 0i32;
            let mut v94: i32 = method36(v91.clone(), v92, v93);
            let mut v95: i32 = v92.wrapping_sub(1i32);
            let mut v96: Rc<str> = string_slice(&v91.clone(), v94 as i64, v95 as i64);
            let mut v97: i32 = (v96.clone().len() as i32);
            let mut v98: i32 = method37(v96.clone(), v97);
            let mut v99: Rc<str> = string_slice(&v96.clone(), 0i32 as i64, v98 as i64);
            let mut v100: bool = v99.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v102: Rc<str> = if v100 {
                let mut v101: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v101.clone()
            } else {
                v99.clone()
            };
            let mut v103: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH1_ACCESS_TOKEN_SECRET"); } LIT.with(|lit| lit.clone()) };
            let mut v104: Rc<str> = get_environment_variable_35(v103.clone());
            let mut v105: i32 = (v104.clone().len() as i32);
            let mut v106: i32 = 0i32;
            let mut v107: i32 = method36(v104.clone(), v105, v106);
            let mut v108: i32 = v105.wrapping_sub(1i32);
            let mut v109: Rc<str> = string_slice(&v104.clone(), v107 as i64, v108 as i64);
            let mut v110: i32 = (v109.clone().len() as i32);
            let mut v111: i32 = method37(v109.clone(), v110);
            let mut v112: Rc<str> = string_slice(&v109.clone(), 0i32 as i64, v111 as i64);
            let mut v113: bool = v112.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v115: Rc<str> = if v113 {
                let mut v114: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v114.clone()
            } else {
                v112.clone()
            };
            let mut v116: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_USER_TOKEN"); } LIT.with(|lit| lit.clone()) };
            let mut v117: Rc<str> = get_environment_variable_35(v116.clone());
            let mut v118: i32 = (v117.clone().len() as i32);
            let mut v119: i32 = 0i32;
            let mut v120: i32 = method36(v117.clone(), v118, v119);
            let mut v121: i32 = v118.wrapping_sub(1i32);
            let mut v122: Rc<str> = string_slice(&v117.clone(), v120 as i64, v121 as i64);
            let mut v123: i32 = (v122.clone().len() as i32);
            let mut v124: i32 = method37(v122.clone(), v123);
            let mut v125: Rc<str> = string_slice(&v122.clone(), 0i32 as i64, v124 as i64);
            let mut v126: bool = v125.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v128: Rc<str> = if v126 {
                let mut v127: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v127.clone()
            } else {
                v125.clone()
            };
            let mut v129: bool = v76.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v130: bool = v129 != true;
            let mut v133: bool = if v130 {
                let mut v131: bool = v89.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v132: bool = v131 != true;
                v132
            } else {
                false
            };
            let mut v136: bool = if v133 {
                let mut v134: bool = v102.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v135: bool = v134 != true;
                v135
            } else {
                false
            };
            let mut v139: bool = if v136 {
                let mut v137: bool = v115.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v138: bool = v137 != true;
                v138
            } else {
                false
            };
            if v139 {
                let mut v140: Rc<str> = Rc::<str>::from(format!("{}-{}", std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).unwrap().as_nanos(), std::process::id()));
                let mut v141: Rc<str> = Rc::<str>::from(<sha1::Sha1 as sha1::Digest>::digest(v140.as_bytes()).iter().map(|b| format!("{:02x}", b)).collect::<String>());
                let mut v142: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_OAUTH1_NONCE"); } LIT.with(|lit| lit.clone()) };
                let mut v143: Rc<str> = get_environment_variable_35(v142.clone());
                let mut v144: i32 = (v143.clone().len() as i32);
                let mut v145: i32 = 0i32;
                let mut v146: i32 = method36(v143.clone(), v144, v145);
                let mut v147: i32 = v144.wrapping_sub(1i32);
                let mut v148: Rc<str> = string_slice(&v143.clone(), v146 as i64, v147 as i64);
                let mut v149: i32 = (v148.clone().len() as i32);
                let mut v150: i32 = method37(v148.clone(), v149);
                let mut v151: Rc<str> = string_slice(&v148.clone(), 0i32 as i64, v150 as i64);
                let mut v152: bool = v151.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v153: Rc<str> = if v152 {
                    v141.clone()
                } else {
                    v151.clone()
                };
                let mut v154: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
                let mut v155: Rc<str> = get_environment_variable_35(v154.clone());
                let mut v156: i32 = (v155.clone().len() as i32);
                let mut v157: i32 = 0i32;
                let mut v158: i32 = method36(v155.clone(), v156, v157);
                let mut v159: i32 = v156.wrapping_sub(1i32);
                let mut v160: Rc<str> = string_slice(&v155.clone(), v158 as i64, v159 as i64);
                let mut v161: i32 = (v160.clone().len() as i32);
                let mut v162: i32 = method37(v160.clone(), v161);
                let mut v163: Rc<str> = string_slice(&v160.clone(), 0i32 as i64, v162 as i64);
                let mut v164: bool = v163.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v166: Rc<str> = if v164 {
                    let mut v165: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
                    v165.clone()
                } else {
                    v163.clone()
                };
                let mut v167: Rc<str> = Rc::<str>::from(std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).unwrap().as_secs().to_string());
                let mut v168: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_OAUTH1_TIMESTAMP"); } LIT.with(|lit| lit.clone()) };
                let mut v169: Rc<str> = get_environment_variable_35(v168.clone());
                let mut v170: i32 = (v169.clone().len() as i32);
                let mut v171: i32 = 0i32;
                let mut v172: i32 = method36(v169.clone(), v170, v171);
                let mut v173: i32 = v170.wrapping_sub(1i32);
                let mut v174: Rc<str> = string_slice(&v169.clone(), v172 as i64, v173 as i64);
                let mut v175: i32 = (v174.clone().len() as i32);
                let mut v176: i32 = method37(v174.clone(), v175);
                let mut v177: Rc<str> = string_slice(&v174.clone(), 0i32 as i64, v176 as i64);
                let mut v178: bool = v177.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v179: Rc<str> = if v178 {
                    v167.clone()
                } else {
                    v177.clone()
                };
                let mut v180: i32 = (v166.clone().len() as i32);
                let mut v181: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
                let mut v182: bool = v166.ends_with(&*v181);
                let mut v185: Rc<str> = if v182 {
                    let mut v183: i32 = v180.wrapping_sub(2i32);
                    let mut v184: Rc<str> = string_slice(&v166.clone(), 0i32 as i64, v183 as i64);
                    v184.clone()
                } else {
                    v166.clone()
                };
                let mut v186: US16 = US16::US16_Signed(v76.clone(), v89.clone(), v102.clone(), v115.clone(), v153.clone(), v179.clone());
                let mut v187: US17 = US17::US17_CreatePost(v63.clone());
                let mut v188: US18 = send_write_38(v185.clone(), v186.clone(), v187.clone());
                match &v188 {
                    US18::US18_Error(v194) => {
                        let mut v194: US14 = v194.clone();
                        failed_30(v194.clone())
                    }
                    US18::US18_Ok(v189, v190) => {
                        let mut v189: Rc<str> = v189.clone();
                        let mut v190: Rc<str> = v190.clone();
                        let mut v191: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posted "); } LIT.with(|lit| lit.clone()) };
                        let mut v192: Rc<str> = Rc::<str>::from(format!("{}{}", v191, v189));
                        println!("{}", v192);
                        US13::US13_Shown
                    }
                }
            } else {
                let mut v198: bool = v128.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v199: bool = v198 != true;
                if v199 {
                    let mut v200: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
                    let mut v201: Rc<str> = get_environment_variable_35(v200.clone());
                    let mut v202: i32 = (v201.clone().len() as i32);
                    let mut v203: i32 = 0i32;
                    let mut v204: i32 = method36(v201.clone(), v202, v203);
                    let mut v205: i32 = v202.wrapping_sub(1i32);
                    let mut v206: Rc<str> = string_slice(&v201.clone(), v204 as i64, v205 as i64);
                    let mut v207: i32 = (v206.clone().len() as i32);
                    let mut v208: i32 = method37(v206.clone(), v207);
                    let mut v209: Rc<str> = string_slice(&v206.clone(), 0i32 as i64, v208 as i64);
                    let mut v210: bool = v209.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let mut v212: Rc<str> = if v210 {
                        let mut v211: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
                        v211.clone()
                    } else {
                        v209.clone()
                    };
                    let mut v213: i32 = (v212.clone().len() as i32);
                    let mut v214: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
                    let mut v215: bool = v212.ends_with(&*v214);
                    let mut v218: Rc<str> = if v215 {
                        let mut v216: i32 = v213.wrapping_sub(2i32);
                        let mut v217: Rc<str> = string_slice(&v212.clone(), 0i32 as i64, v216 as i64);
                        v217.clone()
                    } else {
                        v212.clone()
                    };
                    let mut v219: US16 = US16::US16_BearerToken(v128.clone());
                    let mut v220: US17 = US17::US17_CreatePost(v63.clone());
                    let mut v221: US18 = send_write_38(v218.clone(), v219.clone(), v220.clone());
                    match &v221 {
                        US18::US18_Error(v227) => {
                            let mut v227: US14 = v227.clone();
                            failed_30(v227.clone())
                        }
                        US18::US18_Ok(v222, v223) => {
                            let mut v222: Rc<str> = v222.clone();
                            let mut v223: Rc<str> = v223.clone();
                            let mut v224: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("posted "); } LIT.with(|lit| lit.clone()) };
                            let mut v225: Rc<str> = Rc::<str>::from(format!("{}{}", v224, v222));
                            println!("{}", v225);
                            US13::US13_Shown
                        }
                    }
                } else {
                    let mut v231: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: posting needs user credentials: X_CONSUMER_KEY, X_CONSUMER_SECRET, X_OAUTH1_ACCESS_TOKEN and"); } LIT.with(|lit| lit.clone()) };
                    eprintln!("{}", v231);
                    let mut v232: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("    X_OAUTH1_ACCESS_TOKEN_SECRET (OAuth 1.0a, never expire), or X_USER_TOKEN (OAuth 2.0, 2 hours)"); } LIT.with(|lit| lit.clone()) };
                    eprintln!("{}", v232);
                    US13::US13_NoKey
                }
            }
        }
        US0::US0_Rejected(v415) => {
            let mut v415: Rc<str> = v415.clone();
            let mut v416: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
            let mut v417: Rc<str> = Rc::<str>::from(format!("{}{}", v416, v415));
            eprintln!("{}", v417);
            let mut v418: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-account N   posts fetched per account, 5..100 (default 5)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v419: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --limit N         timeline entries shown (default 20)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v420: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v421: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-author N    entries shown per author (default all)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v422: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v423: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --since DATE      posts at or after DATE (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v424: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --until DATE      posts before DATE\n"); } LIT.with(|lit| lit.clone()) };
            let mut v425: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --since DATE      posts at or after DATE (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ)\n       --until DATE      posts before DATE\n"); } LIT.with(|lit| lit.clone()) };
            let mut v426: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --no-replies, --no-reposts, --originals (both)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v427: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --since DATE      posts at or after DATE (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ)\n       --until DATE      posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v428: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n       --since DATE      posts at or after DATE (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ)\n       --until DATE      posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v429: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] HANDLE...\n"); } LIT.with(|lit| lit.clone()) };
            let mut v430: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc timeline [options] [--max-following N|all] --following HANDLE\n"); } LIT.with(|lit| lit.clone()) };
            let mut v431: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] HANDLE...\n       xc timeline [options] [--max-following N|all] --following HANDLE\n"); } LIT.with(|lit| lit.clone()) };
            let mut v432: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_USER_TOKEN)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v433: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] HANDLE...\n       xc timeline [options] [--max-following N|all] --following HANDLE\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_USER_TOKEN)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v434: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("env:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v435: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] HANDLE...\n       xc timeline [options] [--max-following N|all] --following HANDLE\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_USER_TOKEN)\nenv:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v436: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] HANDLE...\n       xc timeline [options] [--max-following N|all] --following HANDLE\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_USER_TOKEN)\nenv:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n       --since DATE      posts at or after DATE (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ)\n       --until DATE      posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v437: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v438: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --hints           media and link titles under each post\n"); } LIT.with(|lit| lit.clone()) };
            let mut v439: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n       --hints           media and link titles under each post\n"); } LIT.with(|lit| lit.clone()) };
            let mut v440: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] HANDLE...\n       xc timeline [options] [--max-following N|all] --following HANDLE\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_USER_TOKEN)\nenv:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n       --since DATE      posts at or after DATE (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ)\n       --until DATE      posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n       --hints           media and link titles under each post\n"); } LIT.with(|lit| lit.clone()) };
            let mut v441: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --max-following N accounts followed by HANDLE to include, or all (default 20)"); } LIT.with(|lit| lit.clone()) };
            let mut v442: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] HANDLE...\n       xc timeline [options] [--max-following N|all] --following HANDLE\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_USER_TOKEN)\nenv:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n       --since DATE      posts at or after DATE (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ)\n       --until DATE      posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n       --hints           media and link titles under each post\n       --max-following N accounts followed by HANDLE to include, or all (default 20)"); } LIT.with(|lit| lit.clone()) };
            eprintln!("{}", v442);
            US13::US13_BadUsage
        }
        US0::US0_RemovePost(v236) => {
            let mut v236: Rc<str> = v236.clone();
            let mut v237: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_CONSUMER_KEY"); } LIT.with(|lit| lit.clone()) };
            let mut v238: Rc<str> = get_environment_variable_35(v237.clone());
            let mut v239: i32 = (v238.clone().len() as i32);
            let mut v240: i32 = 0i32;
            let mut v241: i32 = method36(v238.clone(), v239, v240);
            let mut v242: i32 = v239.wrapping_sub(1i32);
            let mut v243: Rc<str> = string_slice(&v238.clone(), v241 as i64, v242 as i64);
            let mut v244: i32 = (v243.clone().len() as i32);
            let mut v245: i32 = method37(v243.clone(), v244);
            let mut v246: Rc<str> = string_slice(&v243.clone(), 0i32 as i64, v245 as i64);
            let mut v247: bool = v246.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v249: Rc<str> = if v247 {
                let mut v248: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v248.clone()
            } else {
                v246.clone()
            };
            let mut v250: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_CONSUMER_SECRET"); } LIT.with(|lit| lit.clone()) };
            let mut v251: Rc<str> = get_environment_variable_35(v250.clone());
            let mut v252: i32 = (v251.clone().len() as i32);
            let mut v253: i32 = 0i32;
            let mut v254: i32 = method36(v251.clone(), v252, v253);
            let mut v255: i32 = v252.wrapping_sub(1i32);
            let mut v256: Rc<str> = string_slice(&v251.clone(), v254 as i64, v255 as i64);
            let mut v257: i32 = (v256.clone().len() as i32);
            let mut v258: i32 = method37(v256.clone(), v257);
            let mut v259: Rc<str> = string_slice(&v256.clone(), 0i32 as i64, v258 as i64);
            let mut v260: bool = v259.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v262: Rc<str> = if v260 {
                let mut v261: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v261.clone()
            } else {
                v259.clone()
            };
            let mut v263: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH1_ACCESS_TOKEN"); } LIT.with(|lit| lit.clone()) };
            let mut v264: Rc<str> = get_environment_variable_35(v263.clone());
            let mut v265: i32 = (v264.clone().len() as i32);
            let mut v266: i32 = 0i32;
            let mut v267: i32 = method36(v264.clone(), v265, v266);
            let mut v268: i32 = v265.wrapping_sub(1i32);
            let mut v269: Rc<str> = string_slice(&v264.clone(), v267 as i64, v268 as i64);
            let mut v270: i32 = (v269.clone().len() as i32);
            let mut v271: i32 = method37(v269.clone(), v270);
            let mut v272: Rc<str> = string_slice(&v269.clone(), 0i32 as i64, v271 as i64);
            let mut v273: bool = v272.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v275: Rc<str> = if v273 {
                let mut v274: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v274.clone()
            } else {
                v272.clone()
            };
            let mut v276: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_OAUTH1_ACCESS_TOKEN_SECRET"); } LIT.with(|lit| lit.clone()) };
            let mut v277: Rc<str> = get_environment_variable_35(v276.clone());
            let mut v278: i32 = (v277.clone().len() as i32);
            let mut v279: i32 = 0i32;
            let mut v280: i32 = method36(v277.clone(), v278, v279);
            let mut v281: i32 = v278.wrapping_sub(1i32);
            let mut v282: Rc<str> = string_slice(&v277.clone(), v280 as i64, v281 as i64);
            let mut v283: i32 = (v282.clone().len() as i32);
            let mut v284: i32 = method37(v282.clone(), v283);
            let mut v285: Rc<str> = string_slice(&v282.clone(), 0i32 as i64, v284 as i64);
            let mut v286: bool = v285.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v288: Rc<str> = if v286 {
                let mut v287: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v287.clone()
            } else {
                v285.clone()
            };
            let mut v289: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_USER_TOKEN"); } LIT.with(|lit| lit.clone()) };
            let mut v290: Rc<str> = get_environment_variable_35(v289.clone());
            let mut v291: i32 = (v290.clone().len() as i32);
            let mut v292: i32 = 0i32;
            let mut v293: i32 = method36(v290.clone(), v291, v292);
            let mut v294: i32 = v291.wrapping_sub(1i32);
            let mut v295: Rc<str> = string_slice(&v290.clone(), v293 as i64, v294 as i64);
            let mut v296: i32 = (v295.clone().len() as i32);
            let mut v297: i32 = method37(v295.clone(), v296);
            let mut v298: Rc<str> = string_slice(&v295.clone(), 0i32 as i64, v297 as i64);
            let mut v299: bool = v298.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v301: Rc<str> = if v299 {
                let mut v300: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v300.clone()
            } else {
                v298.clone()
            };
            let mut v302: bool = v249.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v303: bool = v302 != true;
            let mut v306: bool = if v303 {
                let mut v304: bool = v262.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v305: bool = v304 != true;
                v305
            } else {
                false
            };
            let mut v309: bool = if v306 {
                let mut v307: bool = v275.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v308: bool = v307 != true;
                v308
            } else {
                false
            };
            let mut v312: bool = if v309 {
                let mut v310: bool = v288.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v311: bool = v310 != true;
                v311
            } else {
                false
            };
            if v312 {
                let mut v313: Rc<str> = Rc::<str>::from(format!("{}-{}", std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).unwrap().as_nanos(), std::process::id()));
                let mut v314: Rc<str> = Rc::<str>::from(<sha1::Sha1 as sha1::Digest>::digest(v313.as_bytes()).iter().map(|b| format!("{:02x}", b)).collect::<String>());
                let mut v315: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_OAUTH1_NONCE"); } LIT.with(|lit| lit.clone()) };
                let mut v316: Rc<str> = get_environment_variable_35(v315.clone());
                let mut v317: i32 = (v316.clone().len() as i32);
                let mut v318: i32 = 0i32;
                let mut v319: i32 = method36(v316.clone(), v317, v318);
                let mut v320: i32 = v317.wrapping_sub(1i32);
                let mut v321: Rc<str> = string_slice(&v316.clone(), v319 as i64, v320 as i64);
                let mut v322: i32 = (v321.clone().len() as i32);
                let mut v323: i32 = method37(v321.clone(), v322);
                let mut v324: Rc<str> = string_slice(&v321.clone(), 0i32 as i64, v323 as i64);
                let mut v325: bool = v324.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v326: Rc<str> = if v325 {
                    v314.clone()
                } else {
                    v324.clone()
                };
                let mut v327: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
                let mut v328: Rc<str> = get_environment_variable_35(v327.clone());
                let mut v329: i32 = (v328.clone().len() as i32);
                let mut v330: i32 = 0i32;
                let mut v331: i32 = method36(v328.clone(), v329, v330);
                let mut v332: i32 = v329.wrapping_sub(1i32);
                let mut v333: Rc<str> = string_slice(&v328.clone(), v331 as i64, v332 as i64);
                let mut v334: i32 = (v333.clone().len() as i32);
                let mut v335: i32 = method37(v333.clone(), v334);
                let mut v336: Rc<str> = string_slice(&v333.clone(), 0i32 as i64, v335 as i64);
                let mut v337: bool = v336.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v339: Rc<str> = if v337 {
                    let mut v338: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
                    v338.clone()
                } else {
                    v336.clone()
                };
                let mut v340: Rc<str> = Rc::<str>::from(std::time::SystemTime::now().duration_since(std::time::UNIX_EPOCH).unwrap().as_secs().to_string());
                let mut v341: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("XC_OAUTH1_TIMESTAMP"); } LIT.with(|lit| lit.clone()) };
                let mut v342: Rc<str> = get_environment_variable_35(v341.clone());
                let mut v343: i32 = (v342.clone().len() as i32);
                let mut v344: i32 = 0i32;
                let mut v345: i32 = method36(v342.clone(), v343, v344);
                let mut v346: i32 = v343.wrapping_sub(1i32);
                let mut v347: Rc<str> = string_slice(&v342.clone(), v345 as i64, v346 as i64);
                let mut v348: i32 = (v347.clone().len() as i32);
                let mut v349: i32 = method37(v347.clone(), v348);
                let mut v350: Rc<str> = string_slice(&v347.clone(), 0i32 as i64, v349 as i64);
                let mut v351: bool = v350.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v352: Rc<str> = if v351 {
                    v340.clone()
                } else {
                    v350.clone()
                };
                let mut v353: i32 = (v339.clone().len() as i32);
                let mut v354: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
                let mut v355: bool = v339.ends_with(&*v354);
                let mut v358: Rc<str> = if v355 {
                    let mut v356: i32 = v353.wrapping_sub(2i32);
                    let mut v357: Rc<str> = string_slice(&v339.clone(), 0i32 as i64, v356 as i64);
                    v357.clone()
                } else {
                    v339.clone()
                };
                let mut v359: US16 = US16::US16_Signed(v249.clone(), v262.clone(), v275.clone(), v288.clone(), v326.clone(), v352.clone());
                let mut v360: US21 = US21::US21_DeletePost(v236.clone());
                let mut v361: US22 = send_write_44(v358.clone(), v359.clone(), v360.clone());
                match &v361 {
                    US22::US22_Error(v370) => {
                        let mut v370: US14 = v370.clone();
                        failed_30(v370.clone())
                    }
                    US22::US22_Ok(v362) => {
                        let mut v362: bool = *v362;
                        let mut v365: Rc<str> = if v362 {
                            let mut v363: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("deleted "); } LIT.with(|lit| lit.clone()) };
                            v363.clone()
                        } else {
                            let mut v364: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not deleted "); } LIT.with(|lit| lit.clone()) };
                            v364.clone()
                        };
                        let mut v366: Rc<str> = Rc::<str>::from(format!("{}{}", v365, v236));
                        println!("{}", v366);
                        if v362 {
                            US13::US13_Shown
                        } else {
                            US13::US13_ApiFailed
                        }
                    }
                }
            } else {
                let mut v374: bool = v301.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v375: bool = v374 != true;
                if v375 {
                    let mut v376: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
                    let mut v377: Rc<str> = get_environment_variable_35(v376.clone());
                    let mut v378: i32 = (v377.clone().len() as i32);
                    let mut v379: i32 = 0i32;
                    let mut v380: i32 = method36(v377.clone(), v378, v379);
                    let mut v381: i32 = v378.wrapping_sub(1i32);
                    let mut v382: Rc<str> = string_slice(&v377.clone(), v380 as i64, v381 as i64);
                    let mut v383: i32 = (v382.clone().len() as i32);
                    let mut v384: i32 = method37(v382.clone(), v383);
                    let mut v385: Rc<str> = string_slice(&v382.clone(), 0i32 as i64, v384 as i64);
                    let mut v386: bool = v385.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                    let mut v388: Rc<str> = if v386 {
                        let mut v387: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
                        v387.clone()
                    } else {
                        v385.clone()
                    };
                    let mut v389: i32 = (v388.clone().len() as i32);
                    let mut v390: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
                    let mut v391: bool = v388.ends_with(&*v390);
                    let mut v394: Rc<str> = if v391 {
                        let mut v392: i32 = v389.wrapping_sub(2i32);
                        let mut v393: Rc<str> = string_slice(&v388.clone(), 0i32 as i64, v392 as i64);
                        v393.clone()
                    } else {
                        v388.clone()
                    };
                    let mut v395: US16 = US16::US16_BearerToken(v301.clone());
                    let mut v396: US21 = US21::US21_DeletePost(v236.clone());
                    let mut v397: US22 = send_write_44(v394.clone(), v395.clone(), v396.clone());
                    match &v397 {
                        US22::US22_Error(v406) => {
                            let mut v406: US14 = v406.clone();
                            failed_30(v406.clone())
                        }
                        US22::US22_Ok(v398) => {
                            let mut v398: bool = *v398;
                            let mut v401: Rc<str> = if v398 {
                                let mut v399: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("deleted "); } LIT.with(|lit| lit.clone()) };
                                v399.clone()
                            } else {
                                let mut v400: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("not deleted "); } LIT.with(|lit| lit.clone()) };
                                v400.clone()
                            };
                            let mut v402: Rc<str> = Rc::<str>::from(format!("{}{}", v401, v236));
                            println!("{}", v402);
                            if v398 {
                                US13::US13_Shown
                            } else {
                                US13::US13_ApiFailed
                            }
                        }
                    }
                } else {
                    let mut v410: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: posting needs user credentials: X_CONSUMER_KEY, X_CONSUMER_SECRET, X_OAUTH1_ACCESS_TOKEN and"); } LIT.with(|lit| lit.clone()) };
                    eprintln!("{}", v410);
                    let mut v411: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("    X_OAUTH1_ACCESS_TOKEN_SECRET (OAuth 1.0a, never expire), or X_USER_TOKEN (OAuth 2.0, 2 hours)"); } LIT.with(|lit| lit.clone()) };
                    eprintln!("{}", v411);
                    US13::US13_NoKey
                }
            }
        }
        US0::US0_ShowHelp => {
            let mut v444: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-account N   posts fetched per account, 5..100 (default 5)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v445: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --limit N         timeline entries shown (default 20)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v446: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v447: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-author N    entries shown per author (default all)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v448: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v449: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --since DATE      posts at or after DATE (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v450: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --until DATE      posts before DATE\n"); } LIT.with(|lit| lit.clone()) };
            let mut v451: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --since DATE      posts at or after DATE (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ)\n       --until DATE      posts before DATE\n"); } LIT.with(|lit| lit.clone()) };
            let mut v452: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --no-replies, --no-reposts, --originals (both)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v453: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --since DATE      posts at or after DATE (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ)\n       --until DATE      posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v454: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n       --since DATE      posts at or after DATE (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ)\n       --until DATE      posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v455: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] HANDLE...\n"); } LIT.with(|lit| lit.clone()) };
            let mut v456: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc timeline [options] [--max-following N|all] --following HANDLE\n"); } LIT.with(|lit| lit.clone()) };
            let mut v457: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] HANDLE...\n       xc timeline [options] [--max-following N|all] --following HANDLE\n"); } LIT.with(|lit| lit.clone()) };
            let mut v458: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_USER_TOKEN)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v459: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] HANDLE...\n       xc timeline [options] [--max-following N|all] --following HANDLE\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_USER_TOKEN)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v460: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("env:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v461: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] HANDLE...\n       xc timeline [options] [--max-following N|all] --following HANDLE\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_USER_TOKEN)\nenv:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v462: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] HANDLE...\n       xc timeline [options] [--max-following N|all] --following HANDLE\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_USER_TOKEN)\nenv:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n       --since DATE      posts at or after DATE (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ)\n       --until DATE      posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v463: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n"); } LIT.with(|lit| lit.clone()) };
            let mut v464: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --hints           media and link titles under each post\n"); } LIT.with(|lit| lit.clone()) };
            let mut v465: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n       --hints           media and link titles under each post\n"); } LIT.with(|lit| lit.clone()) };
            let mut v466: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] HANDLE...\n       xc timeline [options] [--max-following N|all] --following HANDLE\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_USER_TOKEN)\nenv:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n       --since DATE      posts at or after DATE (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ)\n       --until DATE      posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n       --hints           media and link titles under each post\n"); } LIT.with(|lit| lit.clone()) };
            let mut v467: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("       --max-following N accounts followed by HANDLE to include, or all (default 20)"); } LIT.with(|lit| lit.clone()) };
            let mut v468: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("usage: xc timeline [options] HANDLE...\n       xc timeline [options] [--max-following N|all] --following HANDLE\n       xc post TEXT | xc delete ID   (user credentials: OAuth 1.0a keys or X_USER_TOKEN)\nenv:   X_BEARER_TOKEN (required), X_API_BASE_URL (default https://api.x.com)\n       --per-account N   posts fetched per account, 5..100 (default 5)\n       --limit N         timeline entries shown (default 20)\n       --per-author N    entries shown per author (default all)\n       --since DATE      posts at or after DATE (YYYY-MM-DD or YYYY-MM-DDTHH:MM:SSZ)\n       --until DATE      posts before DATE\n       --no-replies, --no-reposts, --originals (both)\n       --depth N         referenced posts (quoted, replied to, reposted), 0..3 (default 0)\n       --hints           media and link titles under each post\n       --max-following N accounts followed by HANDLE to include, or all (default 20)"); } LIT.with(|lit| lit.clone()) };
            println!("{}", v468);
            US13::US13_ShownHelp
        }
        US0::US0_ShowTimeline(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11) => {
            let mut v1: US1 = v1.clone();
            let mut v2: i32 = *v2;
            let mut v3: i32 = *v3;
            let mut v4: i32 = *v4;
            let mut v5: US2 = v5.clone();
            let mut v6: Rc<str> = v6.clone();
            let mut v7: Rc<str> = v7.clone();
            let mut v8: bool = *v8;
            let mut v9: bool = *v9;
            let mut v10: i32 = *v10;
            let mut v11: bool = *v11;
            let mut v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_BEARER_TOKEN"); } LIT.with(|lit| lit.clone()) };
            let mut v13: Rc<str> = get_environment_variable_35(v12.clone());
            let mut v14: i32 = (v13.clone().len() as i32);
            let mut v15: i32 = 0i32;
            let mut v16: i32 = method36(v13.clone(), v14, v15);
            let mut v17: i32 = v14.wrapping_sub(1i32);
            let mut v18: Rc<str> = string_slice(&v13.clone(), v16 as i64, v17 as i64);
            let mut v19: i32 = (v18.clone().len() as i32);
            let mut v20: i32 = method37(v18.clone(), v19);
            let mut v21: Rc<str> = string_slice(&v18.clone(), 0i32 as i64, v20 as i64);
            let mut v22: bool = v21.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v24: Rc<str> = if v22 {
                let mut v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                v23.clone()
            } else {
                v21.clone()
            };
            let mut v25: bool = v24.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            if v25 {
                let mut v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: "); } LIT.with(|lit| lit.clone()) };
                let mut v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: X_BEARER_TOKEN"); } LIT.with(|lit| lit.clone()) };
                let mut v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(" is not set; "); } LIT.with(|lit| lit.clone()) };
                let mut v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: X_BEARER_TOKEN is not set; "); } LIT.with(|lit| lit.clone()) };
                let mut v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("generate the app's bearer token at https://console.x.com"); } LIT.with(|lit| lit.clone()) };
                let mut v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xc: X_BEARER_TOKEN is not set; generate the app's bearer token at https://console.x.com"); } LIT.with(|lit| lit.clone()) };
                eprintln!("{}", v31);
                US13::US13_NoKey
            } else {
                let mut v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("X_API_BASE_URL"); } LIT.with(|lit| lit.clone()) };
                let mut v34: Rc<str> = get_environment_variable_35(v33.clone());
                let mut v35: i32 = (v34.clone().len() as i32);
                let mut v36: i32 = 0i32;
                let mut v37: i32 = method36(v34.clone(), v35, v36);
                let mut v38: i32 = v35.wrapping_sub(1i32);
                let mut v39: Rc<str> = string_slice(&v34.clone(), v37 as i64, v38 as i64);
                let mut v40: i32 = (v39.clone().len() as i32);
                let mut v41: i32 = method37(v39.clone(), v40);
                let mut v42: Rc<str> = string_slice(&v39.clone(), 0i32 as i64, v41 as i64);
                let mut v43: bool = v42.clone() == { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                let mut v45: Rc<str> = if v43 {
                    let mut v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("https://api.x.com"); } LIT.with(|lit| lit.clone()) };
                    v44.clone()
                } else {
                    v42.clone()
                };
                let mut v46: i32 = (v45.clone().len() as i32);
                let mut v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("/"); } LIT.with(|lit| lit.clone()) };
                let mut v48: bool = v45.ends_with(&*v47);
                let mut v51: Rc<str> = if v48 {
                    let mut v49: i32 = v46.wrapping_sub(2i32);
                    let mut v50: Rc<str> = string_slice(&v45.clone(), 0i32 as i64, v49 as i64);
                    v50.clone()
                } else {
                    v45.clone()
                };
                let mut v52: US16 = US16::US16_BearerToken(v24.clone());
                let mut v53: US23 = timeline_of_45(v51.clone(), v52.clone(), v1.clone(), v2, v3, v4, v5.clone(), v6.clone(), v7.clone(), v8, v9, v10, v11);
                match &v53 {
                    US23::US23_Error(v58) => {
                        let mut v58: US14 = v58.clone();
                        failed_30(v58.clone())
                    }
                    US23::US23_Ok(v54, v55, v56) => {
                        let mut v54: Rc<UH0> = v54.clone();
                        let mut v55: Rc<UH0> = v55.clone();
                        let mut v56: US15 = v56.clone();
                        show_31(v54.clone(), v55.clone(), v56.clone())
                    }
                }
            }
        }
    }
}
fn spiral_main() -> i32 {
    let mut v0: i32 = std::env::args().count() as i32;
    let mut v1: i32 = v0.wrapping_sub(1i32);
    let mut v2: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v3: Rc<UH0> = from_0(v1, v2.clone());
    let mut v4: US0 = parse_args_1(v3.clone());
    let mut v5: US13 = outcome_of_29(v4.clone());
    match &v5 {
        US13::US13_ApiFailed => {
            4i32
        }
        US13::US13_BadUsage => {
            2i32
        }
        US13::US13_NoKey => {
            3i32
        }
        US13::US13_Shown => {
            0i32
        }
        US13::US13_ShownHelp => {
            0i32
        }
    }
}
fn main() { #[cfg(target_arch = "wasm32")] { spiral_main(); return; }
    let main = std::thread::Builder::new().stack_size(1 << 30).spawn(spiral_main).unwrap();
    std::process::exit(match main.join() { Ok(code) => code, Err(_) => 101 });
}
