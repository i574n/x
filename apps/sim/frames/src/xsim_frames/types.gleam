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
    Us0Some(f0i0 : String)
    Us0None
}

pub type Us1 {
    Us1Text(f0i0 : String)
    Us1Whole(f1i0 : Int)
    Us1Null
}

pub type Uh5 {
    Uh5Nil
    Uh5Cons(String, Us1, Uh5)
}

pub type Us2 {
    Us2Some(f0i0 : Uh5)
    Us2None
}

pub type Us3 {
    Us3Some(f0i0 : Int)
    Us3None
}

pub type Us4 {
    Us4Some(f0i0 : String, f0i1 : Us1)
    Us4None
}

pub type Us5 {
    Us5Visible
    Us5BrokenId
    Us5Evicting
    Us5Wanted
    Us5Result
}

pub type Us6 {
    Us6Some(f0i0 : Us5)
    Us6None
}

pub type Us7 {
    Us7Started
    Us7Cancelled
    Us7Evicted
}

pub type Us8 {
    Us8Some(f0i0 : Us7)
    Us8None
}

pub type Us10 {
    Us10PlainRow(f0i0 : Us5)
    Us10TallyRow(f1i0 : Us7)
}

pub type Us9 {
    Us9Some(f0i0 : Us10)
    Us9None
}

pub type Us11 {
    Us11Some(f0i0 : String, f0i1 : Bool, f0i2 : String)
    Us11None
}

pub type Us12 {
    Us12Held
    Us12Broken(f1i0 : Uh3)
}

pub type Us13 {
    Us13SequentialEquivalence
    Us13NoStaleResults
    Us13OneCompilePerPrefix
    Us13WithdrawnDemandHidden
    Us13UnwantedResultsFreed
}

pub type Uh6 {
    Uh6Nil
    Uh6Cons(Us13, Us12, Uh6)
}

pub type Us14 {
    Us14Lurker
    Us14Fickle
    Us14Editor
    Us14Breaker
}

pub type Uh7 {
    Uh7Nil
    Uh7Cons(Us14, Uh7)
}

pub type Us15 {
    Us15Some(f0i0 : Us14)
    Us15None
}

pub type Uh8 {
    Uh8Nil
    Uh8Cons(Uh3, Uh8)
}

pub type Uh9 {
    Uh9Nil
    Uh9Cons(String, Us0, String, Uh9)
}

pub type Us17 {
    Us17Posted(f0i0 : String, f0i1 : Us0, f0i2 : String)
    Us17Framed(f1i0 : String, f1i1 : Us0, f1i2 : Int, f1i3 : Int, f1i4 : String)
}

pub type Us18 {
    Us18Edited(f0i0 : String, f0i1 : String)
    Us18FrameEdited(f1i0 : String, f1i1 : Int, f1i2 : Int, f1i3 : Int, f1i4 : String)
    Us18Deleted(f2i0 : String)
}

pub type Us19 {
    Us19Liked(f0i0 : String, f0i1 : String)
    Us19Unliked(f1i0 : String, f1i1 : String)
}

pub type Us16 {
    Us16Content(f0i0 : Us17)
    Us16Revision(f1i0 : Us18)
    Us16Reaction(f2i0 : Us19)
}

pub type Uh10 {
    Uh10Nil
    Uh10Cons(Us16, Uh10)
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

pub type Us20 {
    Us20Some(f0i0 : String, f0i1 : Us0, f0i2 : String)
    Us20None
}

pub type Uh14 {
    Uh14Nil
    Uh14Cons(Uh10, Uh14)
}

pub type Uh15 {
    Uh15Nil
    Uh15Cons(Int, Us16, Uh15)
}

pub type Us21 {
    Us21Ok(f0i0 : Uh15)
    Us21Error(f1i0 : String)
}

pub type Us22 {
    Us22Ok(f0i0 : Int, f0i1 : Us16)
    Us22Error(f1i0 : String)
}

pub type Us23 {
    Us23Some(f0i0 : Us16)
    Us23None
}

pub type Uh16 {
    Uh16Nil
    Uh16Cons(Int, Int, Us16, Uh16)
}

pub type Uh17 {
    Uh17Nil
    Uh17Cons(String, Int, Uh17)
}

pub type Uh18 {
    Uh18Nil
    Uh18Cons(Int, Int, String, Uh18)
}

pub type Us24 {
    Us24Some(f0i0 : String, f0i1 : Int)
    Us24None
}

pub type Uh19 {
    Uh19Nil
    Uh19Cons(String, Us0, Uh3, Bool, Uh19)
}

pub type Uh20 {
    Uh20Nil
    Uh20Cons(String, Uh3, Uh20)
}

pub type Us25 {
    Us25Some(f0i0 : String)
    Us25None
}

pub type Uh21 {
    Uh21Nil
    Uh21Cons(String, Us25, Uh3, Uh21)
}

pub type Us26 {
    Us26Some(f0i0 : String)
    Us26None
}

pub type Uh23 {
    Uh23Nil
    Uh23Cons(String, Int, String, Uh23)
}

pub type Uh22 {
    Uh22Nil
    Uh22Cons(String, String, Int, Int, Us26, Uh23, Uh22)
}

pub type Uh24 {
    Uh24Nil
    Uh24Cons(String, Int, Uh24)
}

pub type Uh25 {
    Uh25Nil
    Uh25Cons(String, String, Uh25)
}

pub type Uh26 {
    Uh26Nil
    Uh26Cons(String, Uh26)
}

pub type Us27 {
    Us27Some(f0i0 : String, f0i1 : String)
    Us27None
}

pub type Us28 {
    Us28Some(f0i0 : String, f0i1 : String, f0i2 : Int, f0i3 : Int, f0i4 : Us26, f0i5 : Uh23)
    Us28None
}

pub type Uh27 {
    Uh27Nil
    Uh27Cons(String, Uh27)
}
