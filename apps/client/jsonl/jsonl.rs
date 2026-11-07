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

#[derive(Clone)]
enum UH1 {
    UH1_Nil,
    UH1_Cons(Rc<str>, Rc<UH1>),
}
#[derive(Clone)]
enum US0 {
    US0_Quoted,
    US0_RepliedTo,
    US0_Reposted,
}
#[derive(Clone)]
enum UH2 {
    UH2_Nil,
    UH2_Cons(US0, Rc<str>, Rc<UH2>),
}
pub struct Heap0 { pub l0: Rc<str>, pub l1: Rc<str>, pub l2: Rc<str>, pub l3: Rc<str>, pub l4: Rc<str>, pub l5: Rc<str>, pub l6: Rc<str>, pub l7: Rc<UH1>, pub l8: Rc<UH2> }
#[derive(Clone)]
enum UH0 {
    UH0_Nil,
    UH0_Cons(Rc<Heap0>, Rc<UH0>),
}
pub struct Mut0 { pub l0: i32, pub l1: Rc<UH1> }
#[derive(Clone)]
enum UH3 {
    UH3_Nil,
    UH3_Cons(Rc<str>, Rc<Heap0>, Rc<UH3>),
}
#[derive(Clone)]
enum US1 {
    US1_Some(Rc<Heap0>),
    US1_None,
}
fn method2(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let v3: Rc<UH1> = v3;
                let v4: Rc<UH1> = Rc::new(UH1::UH1_Cons(v2, v1));
                (v0, v1) = (v3, v4);
                continue;
            }
            UH1::UH1_Nil => {
                return v1;
            }
        }
    }
}
fn method3(mut v0: i32, mut v1: &Rc<RefCell<Mut0>>) -> bool {
    let v2: i32 = v1.borrow().l0;
    let v3: bool = v2 < v0;
    v3
}
fn split_list_1(mut v0: Rc<str>, mut v1: Rc<str>) -> Rc<UH1> {
    let v2: i32 = (v0.clone().len() as i32);
    let v3: bool = v2 == 0i32;
    if v3 {
        let v4: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH1::UH1_Cons(v1, v4))
    } else {
        let v6: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(v1.split(&*v0).map(|x| Rc::<str>::from(x)).collect::<Vec<Rc<str>>>()));
        let v7: i32 = (v6.clone().borrow().len() as i32);
        let mut v8: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        let mut v9: Rc<RefCell<Mut0>> = Rc::new(RefCell::new(Mut0 { l0: 0i32, l1: v8 }));
        while method3(v7, &v9) {
            let v11: i32 = v9.borrow().l0;
            let v12: Rc<UH1> = v9.borrow().l1.clone();
            let v13: Rc<str> = v6.borrow()[v11 as usize].clone();
            let v14: i32 = v11.wrapping_add(1i32);
            let v15: Rc<UH1> = Rc::new(UH1::UH1_Cons(v13, v12));
            v9.borrow_mut().l0 = v14;
            v9.borrow_mut().l1 = v15;
            ()
        };
        let v16: Rc<UH1> = v9.borrow().l1.clone();
        let v17: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        method2(v16, v17)
    }
}
fn method5(mut v0: Rc<UH3>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match Rc::unwrap_or_clone(v0) {
        UH3::UH3_Cons(v2, v3, v4) => {
            let v2: Rc<str> = v2;
            let v3: Rc<Heap0> = v3;
            let v4: Rc<UH3> = v4;
            let v5: Rc<UH3> = method5(v4, v1);
            Rc::new(UH3::UH3_Cons(v2, v3, v5))
        }
        UH3::UH3_Nil => {
            v1
        }
    }
}
fn method7(mut v0: Rc<UH1>, mut v1: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let v3: Rc<UH1> = v3;
                let v4: i32 = v1.wrapping_add(1i32);
                (v0, v1) = (v3, v4);
                continue;
            }
            UH1::UH1_Nil => {
                return v1;
            }
        }
    }
}
fn field_at_8(mut v0: i32, mut v1: Rc<UH1>) -> Rc<str> {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<str> = v2;
                let v3: Rc<UH1> = v3;
                let v4: bool = v0 == 0i32;
                if v4 {
                    return v2;
                } else {
                    let v5: i32 = v0.wrapping_sub(1i32);
                    (v0, v1) = (v5, v3);
                    continue;
                }
            }
            UH1::UH1_Nil => {
                let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
                return v8;
            }
        }
    }
}
fn fields_after_9(mut v0: i32, mut v1: Rc<UH1>) -> Rc<UH1> {
    loop {
        match &*v1 {
            UH1::UH1_Cons(v2, v3) => {
                let v2: Rc<str> = v2.clone();
                let v3: Rc<UH1> = v3.clone();
                let v4: bool = v0 > 0i32;
                if v4 {
                    let v5: i32 = v0.wrapping_sub(1i32);
                    (v0, v1) = (v5, v3);
                    continue;
                } else {
                    return v1;
                }
            }
            _ => {
                return v1;
            }
        }
    }
}
fn method11(mut v0: Rc<UH2>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match Rc::unwrap_or_clone(v0) {
        UH2::UH2_Cons(v2, v3, v4) => {
            let v2: US0 = v2;
            let v3: Rc<str> = v3;
            let v4: Rc<UH2> = v4;
            let v5: Rc<UH2> = method11(v4, v1);
            Rc::new(UH2::UH2_Cons(v2, v3, v5))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn method12(mut v0: Option<usize>) -> Option<usize> {
    v0
}
fn closure1() -> Rc<dyn Fn((usize)) -> i32> {
    thread_local!{ static CLOSURE: Rc<dyn Fn((usize)) -> i32> = Rc::new(move |mut v0: (usize)| -> i32 {
        let mut v1: usize = (v0);
        let v2: i32 = ((v1) as i32);
        v2
    }); } CLOSURE.with(|closure| closure.clone())
}
fn method10(mut v0: Rc<UH1>, mut v1: Rc<UH2>) -> Rc<UH2> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH1> = v3;
            let v4: Rc<UH2> = method10(v3, v1);
            let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(":"); } LIT.with(|lit| lit.clone()) };
            let v6: Option<usize> = v2.find(&*v5);
            let v7: Option<usize> = method12(v6);
            let mut v8: Rc<dyn Fn((usize)) -> i32> = closure1();
            let mut v9: Option<i32> = v7.map(|x| v8(x));
            let v11: i32 = v9.unwrap_or(-1i32);
            let v12: bool = v11 < 0i32;
            let v43: Rc<UH2> = if v12 {
                { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
            } else {
                let v14: usize = ((0i32) as usize);
                let v15: usize = ((v11) as usize);
                let v16: Rc<str> = Rc::<str>::from(&(v2)[v14..v15]);
                let v17: i32 = v11.wrapping_add(1i32);
                let v18: i32 = (v2.clone().len() as i32);
                let v19: i32 = v18.wrapping_sub(v11);
                let v20: i32 = v19.wrapping_sub(1i32);
                let v21: usize = ((v17) as usize);
                let v22: i32 = v17.wrapping_add(v20);
                let v23: usize = ((v22) as usize);
                let v24: Rc<str> = Rc::<str>::from(&(v2)[v21..v23]);
                let v25: bool = &*v16 == "quoted";
                if v25 {
                    let v26: US0 = US0::US0_Quoted;
                    let v27: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                    Rc::new(UH2::UH2_Cons(v26, v24, v27))
                } else {
                    let v29: bool = &*v16 == "replied_to";
                    if v29 {
                        let v30: US0 = US0::US0_RepliedTo;
                        let v31: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                        Rc::new(UH2::UH2_Cons(v30, v24, v31))
                    } else {
                        let v33: bool = &*v16 == "reposted";
                        let v35: bool = if v33 {
                            true
                        } else {
                            let v34: bool = &*v16 == "retweeted";
                            v34
                        };
                        if v35 {
                            let v36: US0 = US0::US0_Reposted;
                            let v37: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
                            Rc::new(UH2::UH2_Cons(v36, v24, v37))
                        } else {
                            { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) }
                        }
                    }
                }
            };
            method11(v43, v4)
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn entry_of_line_6(mut v0: Rc<str>) -> Rc<UH3> {
    let mut v1: bool = &*v0 == "";
    let v5: Rc<UH1> = if v1 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\t"); } LIT.with(|lit| lit.clone()) };
        split_list_1(v3, v0)
    };
    let v6: i32 = 0i32;
    let v7: i32 = method7(v5.clone(), v6);
    let mut v8: bool = v7 < 9i32;
    if v8 {
        { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v10: i32 = 0i32;
        let v11: Rc<str> = field_at_8(v10, v5.clone());
        let v12: i32 = 1i32;
        let v13: Rc<str> = field_at_8(v12, v5.clone());
        let v14: i32 = 2i32;
        let v15: Rc<str> = field_at_8(v14, v5.clone());
        let v16: i32 = 3i32;
        let v17: Rc<str> = field_at_8(v16, v5.clone());
        let v18: i32 = 5i32;
        let v19: Rc<str> = field_at_8(v18, v5.clone());
        let v20: i32 = 6i32;
        let v21: Rc<str> = field_at_8(v20, v5.clone());
        let v22: i32 = 7i32;
        let v23: Rc<str> = field_at_8(v22, v5.clone());
        let v24: i32 = 8i32;
        let v25: Rc<str> = field_at_8(v24, v5.clone());
        let v26: i32 = 9i32;
        let v27: Rc<UH1> = fields_after_9(v26, v5.clone());
        let v28: i32 = 4i32;
        let v29: Rc<str> = field_at_8(v28, v5);
        let v30: bool = &*v29 == "";
        let v34: Rc<UH1> = if v30 {
            { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
        } else {
            let v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
            split_list_1(v32, v29)
        };
        let v35: Rc<UH2> = { thread_local!{ static CASE: Rc<UH2> = Rc::new(UH2::UH2_Nil); } CASE.with(|case| case.clone()) };
        let v36: Rc<UH2> = method10(v34, v35);
        let v37: Rc<Heap0> = Rc::new(Heap0 { l0: v13, l1: v15, l2: v17, l3: v19, l4: v21, l5: v23, l6: v25, l7: v27, l8: v36 });
        let v38: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
        Rc::new(UH3::UH3_Cons(v11, v37, v38))
    }
}
fn method4(mut v0: Rc<UH1>, mut v1: Rc<UH3>) -> Rc<UH3> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH1> = v3;
            let v4: Rc<UH3> = method4(v3, v1);
            let v5: Rc<UH3> = entry_of_line_6(v2);
            method5(v5, v4)
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method13(mut v0: Rc<UH3>, mut v1: Rc<UH0>, mut v2: Rc<UH0>) -> (Rc<UH0>, Rc<UH0>) {
    let (mut v15, mut v16): (Rc<UH0>, Rc<UH0>) = match &*v0 {
        UH3::UH3_Cons(v3, v4, v5) => {
            let v3: Rc<str> = v3.clone();
            let v4: Rc<Heap0> = v4.clone();
            let v5: Rc<UH3> = v5.clone();
            let v6: bool = &*v3 == "p";
            let (mut v9, mut v10): (Rc<UH0>, Rc<UH0>) = if v6 {
                let v7: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4, v1));
                (v7, v2)
            } else {
                let mut v8: Rc<UH0> = Rc::new(UH0::UH0_Cons(v4, v2));
                (v1, v8)
            };
            method13(v5, v9, v10)
        }
        _ => {
            let (mut v13, mut v14): (Rc<UH0>, Rc<UH0>) = match Rc::unwrap_or_clone(v0) {
                UH3::UH3_Nil => {
                    (v1, v2)
                }
                _ => unreachable!(),
            };
            (v13, v14)
        }
    };
    (v15, v16)
}
fn method14(mut v0: Rc<UH0>, mut v1: Rc<UH0>) -> Rc<UH0> {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<Heap0> = v2;
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
fn digest_of_0(mut v0: Rc<str>) -> (Rc<UH0>, Rc<UH0>) {
    let mut v1: bool = &*v0 == "";
    let v5: Rc<UH1> = if v1 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v3: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
        split_list_1(v3, v0)
    };
    let v6: Rc<UH3> = { thread_local!{ static CASE: Rc<UH3> = Rc::new(UH3::UH3_Nil); } CASE.with(|case| case.clone()) };
    let v7: Rc<UH3> = method4(v5, v6);
    let mut v8: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let mut v9: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let (mut v10, mut v11): (Rc<UH0>, Rc<UH0>) = method13(v7, v8, v9);
    let v12: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v13: Rc<UH0> = method14(v10, v12);
    let v14: Rc<UH0> = { thread_local!{ static CASE: Rc<UH0> = Rc::new(UH0::UH0_Nil); } CASE.with(|case| case.clone()) };
    let v15: Rc<UH0> = method14(v11, v14);
    (v13, v15)
}
fn method18(mut v0: Rc<UH2>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH2::UH2_Cons(v2, v3, v4) => {
            let v2: US0 = v2;
            let v3: Rc<str> = v3;
            let v4: Rc<UH2> = v4;
            let v5: Rc<UH1> = method18(v4, v1);
            let v11: Rc<str> = match v2 {
                US0::US0_Quoted => {
                    let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("quoted"); } LIT.with(|lit| lit.clone()) };
                    v6
                }
                US0::US0_RepliedTo => {
                    let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("replied_to"); } LIT.with(|lit| lit.clone()) };
                    v7
                }
                US0::US0_Reposted => {
                    let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("reposted"); } LIT.with(|lit| lit.clone()) };
                    v8
                }
            };
            let v12: Rc<str> = spiral_json_quote(&*v11);
            let v13: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{\"type\":"); } LIT.with(|lit| lit.clone()) }, v12));
            let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(",\"id\":"); } LIT.with(|lit| lit.clone()) }));
            let v15: Rc<str> = spiral_json_quote(&*v3);
            let v16: Rc<str> = Rc::<str>::from(format!("{}{}", v14, v15));
            let v17: Rc<str> = Rc::<str>::from(format!("{}{}", v16, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) }));
            Rc::new(UH1::UH1_Cons(v17, v5))
        }
        UH2::UH2_Nil => {
            v1
        }
    }
}
fn method19(mut v0: Rc<RefCell<Vec<Rc<str>>>>, mut v1: Rc<UH1>, mut v2: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH1::UH1_Cons(v3, v4) => {
                let v3: Rc<str> = v3;
                let v4: Rc<UH1> = v4;
                v0.borrow_mut().push(v3);
                let v5: i32 = v2.wrapping_add(1i32);
                (v1, v2) = (v4, v5);
                continue;
            }
            UH1::UH1_Nil => {
                return v2;
            }
        }
    }
}
fn method20(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH1> = v3;
            let v4: Rc<UH1> = method20(v3, v1);
            let v5: Rc<str> = spiral_json_quote(&*v2);
            Rc::new(UH1::UH1_Cons(v5, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn entry_json_17(mut v0: i32, mut v1: Rc<str>, mut v2: &Rc<Heap0>) -> Rc<str> {
    let v3: Rc<UH2> = v2.l8.clone();
    let v4: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v5: Rc<UH1> = method18(v3, v4);
    let v6: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v7: i32 = 0i32;
    let mut v8: i32 = method19(v6.clone(), v5, v7);
    let mut v9: Rc<Vec<Rc<str>>> = Rc::new(v6.borrow().clone());
    let v10: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v9).as_ref().clone()));
    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(","); } LIT.with(|lit| lit.clone()) };
    let v12: Rc<str> = Rc::<str>::from((*v10.borrow()).join(&*v11));
    let v13: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) }, v12));
    let v14: Rc<str> = Rc::<str>::from(format!("{}{}", v13, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) }));
    let v15: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"refs\":"); } LIT.with(|lit| lit.clone()) }, v14));
    let v16: Rc<UH1> = v2.l7.clone();
    let v17: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v18: Rc<UH1> = method20(v16, v17);
    let v19: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v20: i32 = 0i32;
    let v21: i32 = method19(v19.clone(), v18, v20);
    let v22: Rc<Vec<Rc<str>>> = Rc::new(v19.borrow().clone());
    let v23: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v22).as_ref().clone()));
    let v24: Rc<str> = Rc::<str>::from((*v23.borrow()).join(&*v11));
    let v25: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("["); } LIT.with(|lit| lit.clone()) }, v24));
    let v26: Rc<str> = Rc::<str>::from(format!("{}{}", v25, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("]"); } LIT.with(|lit| lit.clone()) }));
    let v27: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"hints\":"); } LIT.with(|lit| lit.clone()) }, v26));
    let v28: Rc<str> = Rc::<str>::from((v0).to_string());
    let v29: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"level\":"); } LIT.with(|lit| lit.clone()) }, v28));
    let v30: Rc<str> = spiral_json_quote(&*v1);
    let v31: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"via\":"); } LIT.with(|lit| lit.clone()) }, v30));
    let v32: Rc<str> = v2.l0.clone();
    let v33: Rc<str> = spiral_json_quote(&*v32);
    let v34: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"id\":"); } LIT.with(|lit| lit.clone()) }, v33));
    let v35: Rc<str> = v2.l1.clone();
    let v36: Rc<str> = spiral_json_quote(&*v35);
    let v37: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"username\":"); } LIT.with(|lit| lit.clone()) }, v36));
    let v38: Rc<str> = v2.l2.clone();
    let v39: Rc<str> = spiral_json_quote(&*v38);
    let v40: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"created_at\":"); } LIT.with(|lit| lit.clone()) }, v39));
    let v41: Rc<str> = v2.l3.clone();
    let v42: Rc<str> = spiral_json_quote(&*v41);
    let v43: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"text\":"); } LIT.with(|lit| lit.clone()) }, v42));
    let v44: Rc<str> = v2.l4.clone();
    let v45: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"reply_count\":"); } LIT.with(|lit| lit.clone()) }, v44));
    let v46: Rc<str> = v2.l5.clone();
    let v47: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"repost_count\":"); } LIT.with(|lit| lit.clone()) }, v46));
    let v48: Rc<str> = v2.l6.clone();
    let v49: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\"like_count\":"); } LIT.with(|lit| lit.clone()) }, v48));
    let mut v50: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    v50.borrow_mut().push(v34);
    v50.borrow_mut().push(v37);
    v50.borrow_mut().push(v40);
    v50.borrow_mut().push(v43);
    v50.borrow_mut().push(v45);
    v50.borrow_mut().push(v47);
    v50.borrow_mut().push(v49);
    v50.borrow_mut().push(v15);
    v50.borrow_mut().push(v27);
    v50.borrow_mut().push(v29);
    v50.borrow_mut().push(v31);
    let v51: Rc<Vec<Rc<str>>> = Rc::new(v50.borrow().clone());
    let v52: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v51).as_ref().clone()));
    let v53: Rc<str> = Rc::<str>::from((*v52.borrow()).join(&*v11));
    let v54: Rc<str> = Rc::<str>::from(format!("{}{}", { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("{"); } LIT.with(|lit| lit.clone()) }, v53));
    let v55: Rc<str> = Rc::<str>::from(format!("{}{}", v54, { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("}"); } LIT.with(|lit| lit.clone()) }));
    v55
}
fn method23(mut v0: Rc<UH1>, mut v1: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v0) {
        UH1::UH1_Cons(v2, v3) => {
            let v2: Rc<str> = v2;
            let v3: Rc<UH1> = v3;
            let v4: Rc<UH1> = method23(v3, v1);
            Rc::new(UH1::UH1_Cons(v2, v4))
        }
        UH1::UH1_Nil => {
            v1
        }
    }
}
fn method25(mut v0: Rc<str>, mut v1: Rc<UH0>) -> US1 {
    loop {
        match Rc::unwrap_or_clone(v1) {
            UH0::UH0_Cons(v3, v4) => {
                let v3: Rc<Heap0> = v3;
                let v4: Rc<UH0> = v4;
                let v5: Rc<str> = v3.l0.clone();
                let v6: bool = &*v5 == &*v0;
                if v6 {
                    return US1::US1_Some(v3);
                } else {
                    v1 = v4;
                    continue;
                }
            }
            UH0::UH0_Nil => {
                return US1::US1_None;
            }
        }
    }
}
fn reference_json_24(mut v0: Rc<UH0>, mut v1: i32, mut v2: i32, mut v3: &Rc<Heap0>, mut v4: US0, mut v5: Rc<str>) -> Rc<UH1> {
    let v6: US1 = method25(v5, v0.clone());
    match v6 {
        US1::US1_None => {
            { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
        }
        US1::US1_Some(v7) => {
            let v7: Rc<Heap0> = v7;
            let mut v8: i32 = v2.wrapping_add(1i32);
            let mut v9: Rc<str> = v3.l0.clone();
            let v10: Rc<str> = entry_json_17(v8, v9, &v7);
            let v11: Rc<UH1> = referenced_json_21(v0, v1, v8, &v7);
            Rc::new(UH1::UH1_Cons(v10, v11))
        }
    }
}
fn method22(mut v0: Rc<UH0>, mut v1: i32, mut v2: i32, mut v3: &Rc<Heap0>, mut v4: Rc<UH2>, mut v5: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v4) {
        UH2::UH2_Cons(v6, v7, v8) => {
            let v6: US0 = v6;
            let v7: Rc<str> = v7;
            let mut v8: Rc<UH2> = v8;
            let mut v9: Rc<UH1> = method22(v0.clone(), v1, v2, v3, v8, v5);
            let v10: Rc<UH1> = reference_json_24(v0, v1, v2, v3, v6, v7);
            method23(v10, v9)
        }
        UH2::UH2_Nil => {
            v5
        }
    }
}
fn referenced_json_21(mut v0: Rc<UH0>, mut v1: i32, mut v2: i32, mut v3: &Rc<Heap0>) -> Rc<UH1> {
    let v4: bool = v2 >= v1;
    if v4 {
        { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) }
    } else {
        let v6: Rc<UH2> = v3.l8.clone();
        let v7: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
        method22(v0, v1, v2, v3, v6, v7)
    }
}
fn method16(mut v0: Rc<UH0>, mut v1: i32, mut v2: Rc<UH0>, mut v3: Rc<UH1>) -> Rc<UH1> {
    match Rc::unwrap_or_clone(v2) {
        UH0::UH0_Cons(v4, v5) => {
            let v4: Rc<Heap0> = v4;
            let v5: Rc<UH0> = v5;
            let v6: Rc<UH1> = method16(v0.clone(), v1, v5, v3);
            let v7: i32 = 0i32;
            let mut v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from(""); } LIT.with(|lit| lit.clone()) };
            let mut v9: Rc<str> = entry_json_17(v7, v8, &v4);
            let v10: i32 = 0i32;
            let v11: Rc<UH1> = referenced_json_21(v0, v1, v10, &v4);
            let v12: Rc<UH1> = method23(v11, v6);
            Rc::new(UH1::UH1_Cons(v9, v12))
        }
        UH0::UH0_Nil => {
            v3
        }
    }
}
fn method26(mut v0: Rc<UH0>, mut v1: i32) -> i32 {
    loop {
        match Rc::unwrap_or_clone(v0) {
            UH0::UH0_Cons(v2, v3) => {
                let v2: Rc<Heap0> = v2;
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
fn rendered_json_15(mut v0: Rc<UH0>, mut v1: Rc<UH0>, mut v2: i32) -> (Rc<str>, i32) {
    let v3: Rc<UH1> = { thread_local!{ static CASE: Rc<UH1> = Rc::new(UH1::UH1_Nil); } CASE.with(|case| case.clone()) };
    let v4: Rc<UH1> = method16(v1, v2, v0.clone(), v3);
    let v5: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new(Vec::new()));
    let v6: i32 = 0i32;
    let v7: i32 = method19(v5.clone(), v4, v6);
    let mut v8: Rc<Vec<Rc<str>>> = Rc::new(v5.borrow().clone());
    let mut v9: Rc<RefCell<Vec<Rc<str>>>> = Rc::new(RefCell::new((v8).as_ref().clone()));
    let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("\n"); } LIT.with(|lit| lit.clone()) };
    let v11: Rc<str> = Rc::<str>::from((*v9.borrow()).join(&*v10));
    let v12: i32 = 0i32;
    let v13: i32 = method26(v0, v12);
    (v11, v13)
}
fn closure0() -> Rc<dyn Fn(Rc<str>, i32, i32, i32) -> (Rc<str>, i32)> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>, i32, i32, i32) -> (Rc<str>, i32)> = Rc::new(move |mut v0: Rc<str>, mut v1: i32, mut v2: i32, mut v3: i32| -> (Rc<str>, i32) {
        let v4: Rc<str> = xc_select::xc_select(&*v0, v1, v2);
        let (mut v5, mut v6): (Rc<UH0>, Rc<UH0>) = digest_of_0(v4);
        rendered_json_15(v5, v6, v3)
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_jsonl(v0: &str, v1: i32, v2: i32, v3: i32) -> (Rc<str>, i32) {
    closure0()(Rc::<str>::from(v0), v1, v2, v3)
}
pub type SpiralShape_bc41c7d2dc72 = Heap0;
pub type SpiralShape_accbf6de6842 = Mut0;
