pub type SpiralArrayKey


pub type SpiralArray(a) {
  SpiralArray(key: SpiralArrayKey, size: Int)
}


pub type SpiralRef(a) {
  SpiralRef(key: SpiralArrayKey)
}


pub type ListString {
    ListStringNil
    ListStringCons(String, ListString)
}

pub type Us0 {
    Us0OnX
    Us0OnMastodon
    Us0OnBluesky(f2i0 : String, f2i1 : String)
}

pub type Uh1 {
    Uh1Nil
    Uh1Cons(String, ListString, Uh1)
}

pub type Us1 {
    Us1Some(f0i0 : String)
    Us1None
}

pub type Uh2 {
    Uh2Nil
    Uh2Cons(String, Int, Uh2)
}

pub type Uh3 {
    Uh3Nil
    Uh3Cons(Int, Uh3)
}

pub type Mut0 { Mut0(l0 : Int, l1 : ListString) }

pub type Uh4 {
    Uh4Nil
    Uh4Cons(ListString, Uh4)
}
