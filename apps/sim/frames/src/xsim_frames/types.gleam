pub type XSplitScope { Global }

pub type Uh0 {
    Uh0Nil
    Uh0Cons(String, String, Bool, String, Uh0)
}

pub type Uh1 {
    Uh1Nil
    Uh1Cons(String, String, Uh1)
}

pub type Uh2 {
    Uh2Nil
    Uh2Cons(String, Int, Uh2)
}

pub type Uh3 {
    Uh3Nil
    Uh3Cons(String, Uh3)
}

pub type Uh4 {
    Uh4Nil
    Uh4Cons(String, Bool, String, Uh4)
}

pub type Us0 {
    Us0Text(f0i0 : String)
    Us0Whole(f1i0 : Int)
    Us0Null
}

pub type Uh5 {
    Uh5Nil
    Uh5Cons(String, Us0, Uh5)
}

pub type Us1 {
    Us1Some(f0i0 : Uh5)
    Us1None
}

pub type Us2 {
    Us2Some(f0i0 : Int)
    Us2None
}

pub type Us3 {
    Us3Some(f0i0 : String, f0i1 : Us0)
    Us3None
}

pub type Us4 {
    Us4Some(f0i0 : String, f0i1 : String)
    Us4None
}

pub type Us5 {
    Us5Some(f0i0 : String, f0i1 : Bool, f0i2 : String)
    Us5None
}

pub type Us6 {
    Us6Held
    Us6Broken(f1i0 : Uh3)
}

pub type Us7 {
    Us7SequentialEquivalence
    Us7NoStaleResults
    Us7OneCompilePerPrefix
    Us7WithdrawnDemandHidden
    Us7UnwantedResultsFreed
}

pub type Uh6 {
    Uh6Nil
    Uh6Cons(Us7, Us6, Uh6)
}

pub type Us8 {
    Us8Some(f0i0 : String, f0i1 : String, f0i2 : Bool, f0i3 : String)
    Us8None
}

pub type Us9 {
    Us9Some(f0i0 : String)
    Us9None
}

pub type Us10 {
    Us10Lurker
    Us10Fickle
    Us10Editor
    Us10Breaker
}

pub type Uh7 {
    Uh7Nil
    Uh7Cons(Us10, Uh7)
}

pub type Us11 {
    Us11Some(f0i0 : Us10)
    Us11None
}

pub type Uh8 {
    Uh8Nil
    Uh8Cons(Uh3, Uh8)
}

pub type Uh9 {
    Uh9Nil
    Uh9Cons(String, Us9, String, Uh9)
}

pub type Us13 {
    Us13Posted(f0i0 : String, f0i1 : Us9, f0i2 : String)
    Us13Framed(f1i0 : String, f1i1 : Us9, f1i2 : Int, f1i3 : Int, f1i4 : String)
}

pub type Us14 {
    Us14Edited(f0i0 : String, f0i1 : String)
    Us14FrameEdited(f1i0 : String, f1i1 : Int, f1i2 : Int, f1i3 : Int, f1i4 : String)
    Us14Deleted(f2i0 : String)
}

pub type Us15 {
    Us15Liked(f0i0 : String, f0i1 : String)
    Us15Unliked(f1i0 : String, f1i1 : String)
}

pub type Us12 {
    Us12Content(f0i0 : Us13)
    Us12Revision(f1i0 : Us14)
    Us12Reaction(f2i0 : Us15)
}

pub type Uh10 {
    Uh10Nil
    Uh10Cons(Us12, Uh10)
}

pub type Uh11 {
    Uh11Nil
    Uh11Cons(Uh9, Uh10, Uh3, Uh11)
}

pub type Uh12 {
    Uh12Nil
    Uh12Cons(String, String, Uh12)
}

pub type Uh13 {
    Uh13Nil
    Uh13Cons(Int, Uh13)
}

pub type Us16 {
    Us16Some(f0i0 : String, f0i1 : Us9, f0i2 : String)
    Us16None
}

pub type Uh14 {
    Uh14Nil
    Uh14Cons(Uh10, Uh14)
}

pub type Uh15 {
    Uh15Nil
    Uh15Cons(Int, Us12, Uh15)
}

pub type Us17 {
    Us17Ok(f0i0 : Uh15)
    Us17Error(f1i0 : String)
}

pub type Us18 {
    Us18Ok(f0i0 : Int, f0i1 : Us12)
    Us18Error(f1i0 : String)
}

pub type Us19 {
    Us19Some(f0i0 : Us12)
    Us19None
}

pub type Uh16 {
    Uh16Nil
    Uh16Cons(Int, Int, Us12, Uh16)
}

pub type Uh17 {
    Uh17Nil
    Uh17Cons(String, Int, Uh17)
}

pub type Uh18 {
    Uh18Nil
    Uh18Cons(String, Int, Uh18)
}

pub type Uh19 {
    Uh19Nil
    Uh19Cons(Int, Int, String, Uh19)
}

pub type Us20 {
    Us20Some(f0i0 : String, f0i1 : Int)
    Us20None
}

pub type Uh20 {
    Uh20Nil
    Uh20Cons(String, Us9, Uh3, Bool, Uh20)
}

pub type Uh21 {
    Uh21Nil
    Uh21Cons(String, Uh3, Uh21)
}

pub type Us21 {
    Us21Some(f0i0 : String, f0i1 : Uh3)
    Us21None
}

pub type Us22 {
    Us22Some(f0i0 : String)
    Us22None
}

pub type Uh22 {
    Uh22Nil
    Uh22Cons(String, Us22, Uh3, Uh22)
}

pub type Us23 {
    Us23Some(f0i0 : String)
    Us23None
}

pub type Uh24 {
    Uh24Nil
    Uh24Cons(String, Int, String, Uh24)
}

pub type Uh23 {
    Uh23Nil
    Uh23Cons(String, String, Int, Int, Us23, Uh24, Uh23)
}

pub type Uh25 {
    Uh25Nil
    Uh25Cons(String, Int, Uh25)
}

pub type Uh26 {
    Uh26Nil
    Uh26Cons(String, String, Uh26)
}

pub type Uh27 {
    Uh27Nil
    Uh27Cons(String, Uh27)
}

pub type Us24 {
    Us24Some(f0i0 : String, f0i1 : String)
    Us24None
}

pub type Us25 {
    Us25Some(f0i0 : String, f0i1 : String, f0i2 : Int, f0i3 : Int, f0i4 : Us23, f0i5 : Uh24)
    Us25None
}

pub type Us26 {
    Us26Some(f0i0 : String, f0i1 : Us22, f0i2 : Uh3)
    Us26None
}

pub type Uh28 {
    Uh28Nil
    Uh28Cons(String, Uh28)
}
