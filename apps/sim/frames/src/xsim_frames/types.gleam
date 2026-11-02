import gleam/dict
import gleam/dynamic.{type Dynamic}
import gleam/erlang/process
import gleam/option

pub type SpiralHashKind {
  Sha256
}

pub type SpiralArrayStore(a)


pub type SpiralArray(a) {
  SpiralArray(store: SpiralArrayStore(option.Option(a)), size: Int)
}


pub type SpiralRefCell(a)


pub type SpiralRef(a) {
  SpiralRef(cell: SpiralRefCell(a))
}


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

pub type Mut0 { Mut0(l0 : Int, l1 : Uh3) }

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
    Us2Some(f0i0 : String)
    Us2None
}

pub type Us3 {
    Us3Some(f0i0 : Int)
    Us3None
}

pub type Us4 {
    Us4Some(f0i0 : String, f0i1 : Us0)
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
    Us13BreakingEditsFail
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
    Uh9Cons(String, Us2, String, Uh9)
}

pub type Us17 {
    Us17Posted(f0i0 : String, f0i1 : Us2, f0i2 : String)
    Us17Framed(f1i0 : String, f1i1 : Us2, f1i2 : Int, f1i3 : Int, f1i4 : String)
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
    Us20Some(f0i0 : String, f0i1 : Us2, f0i2 : String)
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
    Uh19Cons(String, Us2, Uh3, Bool, Uh19)
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

pub type Us29 {
    Us29FakeExecutor
    Us29LeakingExecutor
    Us29CellsExecutor
}

pub type Us30 {
    Us30NoEviction
    Us30EvictNow
    Us30EvictAfter(f2i0 : Int)
}

pub type Us31 {
    Us31Some(f0i0 : Uh3, f0i1 : String, f0i2 : Int, f0i3 : Int, f0i4 : Int, f0i5 : String, f0i6 : Bool, f0i7 : Int, f0i8 : Int, f0i9 : Int, f0i10 : Int, f0i11 : Int, f0i12 : String, f0i13 : String, f0i14 : Us29, f0i15 : Int, f0i16 : Us30, f0i17 : Int, f0i18 : Bool, f0i19 : Bool)
    Us31None
}

pub type Us32 {
    Us32Some(f0i0 : Us29, f0i1 : Int, f0i2 : Us30, f0i3 : Int, f0i4 : Bool, f0i5 : Bool)
    Us32None
}

pub type Us33 {
    Us33Ok(f0i0 : Uh3, f0i1 : String, f0i2 : Int, f0i3 : Int, f0i4 : Int, f0i5 : String, f0i6 : Bool, f0i7 : Int, f0i8 : Int, f0i9 : Int, f0i10 : Int, f0i11 : Int, f0i12 : String, f0i13 : String, f0i14 : Us29, f0i15 : Int, f0i16 : Us30, f0i17 : Int, f0i18 : Bool, f0i19 : Bool)
    Us33Error(f1i0 : String)
}

pub type Us34 {
    Us34Some(f0i0 : Uh3, f0i1 : String, f0i2 : Int, f0i3 : Int, f0i4 : Int, f0i5 : String, f0i6 : Bool)
    Us34None
}

pub type Us36 {
    Us36RunParsed(f0i0 : Uh3, f0i1 : String, f0i2 : Int, f0i3 : Int, f0i4 : Int, f0i5 : String, f0i6 : Bool, f0i7 : Int, f0i8 : Int, f0i9 : Int, f0i10 : Int, f0i11 : Int, f0i12 : String, f0i13 : String, f0i14 : Us29, f0i15 : Int, f0i16 : Us30, f0i17 : Int, f0i18 : Bool, f0i19 : Bool)
    Us36RunRejected(f1i0 : String)
}

pub type Us35 {
    Us35Some(f0i0 : Us36)
    Us35None
}

pub type Us37 {
    Us37CorpusCells
    Us37CorpusBreaking
    Us37CorpusChurn
}

pub type Us38 {
    Us38Some(f0i0 : Us37)
    Us38None
}

pub type Us39 {
    Us39ScheduleSeed
    Us39ScheduleUsers
    Us39ScheduleEdits
    Us39ScheduleRounds
}

pub type Us40 {
    Us40Some(f0i0 : Us39)
    Us40None
}

pub type Us41 {
    Us41Some(f0i0 : Int, f0i1 : Int, f0i2 : Int, f0i3 : Int, f0i4 : Int, f0i5 : String, f0i6 : String)
    Us41None
}

pub type Us42 {
    Us42RunnerConcurrency
    Us42RunnerPace
    Us42RunnerGrace
}

pub type Us43 {
    Us43Some(f0i0 : Us42)
    Us43None
}

pub type Us44 {
    Us44Some(f0i0 : Us29)
    Us44None
}

pub type Us45 {
    Us45Done
    Us45Erred
    Us45Crashed
}

pub type Us46 {
    Us46StartTask(f0i0 : String, f0i1 : Uh3)
    Us46CancelTask(f1i0 : String)
}

pub type Uh28 {
    Uh28Nil
    Uh28Cons(Us46, Uh28)
}

pub type Us47 {
    Us47Applied(f0i0 : dict.Dict(Int, Nil), f0i1 : Uh15, f0i2 : dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), f0i3 : dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), f0i4 : dict.Dict(String, String), f0i5 : dict.Dict(String, Uh3), f0i6 : dict.Dict(String, dict.Dict(String, Nil)), f0i7 : dict.Dict(String, #(Int, Bool)), f0i8 : dict.Dict(String, Nil), f0i9 : Int, f0i10 : Int, f0i11 : Int, f0i12 : Int)
    Us47Waiting
}

pub type Us48 {
    Us48Ok(f0i0 : dict.Dict(Int, #(Int, Int, String)), f0i1 : Int)
    Us48Error
}

pub type Us49 {
    Us49Some(f0i0 : dict.Dict(Int, #(Int, Int, String)), f0i1 : Int)
    Us49None
}

pub type Us50 {
    Us50Ok(f0i0 : Int, f0i1 : Int, f0i2 : String)
    Us50Error
}

pub type Us51 {
    Us51Some(f0i0 : Int, f0i1 : Int, f0i2 : String)
    Us51None
}

pub type Us52 {
    Us52Ok(f0i0 : Uh3)
    Us52Error
}

pub type Us53 {
    Us53Some(f0i0 : Uh3)
    Us53None
}

pub type Us54 {
    Us54Ok(f0i0 : Us2, f0i1 : dict.Dict(Int, String), f0i2 : Bool)
    Us54Error
}

pub type Us55 {
    Us55Some(f0i0 : Us2, f0i1 : dict.Dict(Int, String), f0i2 : Bool)
    Us55None
}

pub type Us56 {
    Us56Ok(f0i0 : String)
    Us56Error
}

pub type Us57 {
    Us57Ok(f0i0 : Int, f0i1 : Bool)
    Us57Error
}

pub type Us58 {
    Us58Some(f0i0 : Int, f0i1 : Bool)
    Us58None
}

pub type Us59 {
    Us59Ok(f0i0 : dict.Dict(String, Nil))
    Us59Error
}

pub type Us60 {
    Us60Some(f0i0 : dict.Dict(String, Nil))
    Us60None
}

pub type Us61 {
    Us61Ok(f0i0 : Int)
    Us61Error
}

pub type Us62 {
    Us62Ok(f0i0 : process.Pid)
    Us62Error
}

pub type Us63 {
    Us63Some(f0i0 : process.Pid)
    Us63None
}

pub type Us64 {
    Us64Some(f0i0 : String, f0i1 : process.Pid, f0i2 : Us45, f0i3 : String)
    Us64None
}

pub type Us65 {
    Us65Got(f0i0 : String, f0i1 : process.Pid, f0i2 : Us45, f0i3 : String)
    Us65TimedOut
}

pub type Us66 {
    Us66Ok(f0i0 : Us45, f0i1 : String)
    Us66Error
}

pub type Us67 {
    Us67Some(f0i0 : Us45, f0i1 : String)
    Us67None
}

pub type Uh29 {
    Uh29Nil
    Uh29Cons(Dynamic, Uh29)
}

pub type Us68 {
    Us68Swap(f0i0 : String, f0i1 : process.Subject(String))
}

pub type Us69 {
    Us69Some(f0i0 : process.Subject(Us68))
    Us69None
}

pub type Us70 {
    Us70Tick
    Us70Peak(f1i0 : process.Subject(#(Int, Int, Int, Int)))
}

pub type Us71 {
    Us71GrowingText(f0i0 : fn(Nil) -> String)
    Us71FreshLine(f1i0 : fn(Nil) -> String)
}

pub type Us72 {
    Us72Some(f0i0 : Dynamic)
    Us72None
}

pub type Us73 {
    Us73Some(f0i0 : Int, f0i1 : Int)
    Us73None
}

pub type Us74 {
    Us74Some(f0i0 : process.Subject(Us70))
    Us74None
}

pub type Us75 {
    Us75OnX
    Us75OnMastodon
    Us75OnBluesky(f2i0 : String, f2i1 : String)
}

pub type Uh30 {
    Uh30Nil
    Uh30Cons(String, Uh3, Uh30)
}

pub type Uh31 {
    Uh31Nil
    Uh31Cons(String, Int, Uh31)
}

pub type Uh32 {
    Uh32Nil
    Uh32Cons(String, dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, Uh6, Uh32)
}

pub type Us76 {
    Us76Ok(f0i0 : BitArray)
    Us76Error(f1i0 : Dynamic)
}

pub type Us77 {
    Us77Ok(f0i0 : String, f0i1 : Us45, f0i2 : String)
    Us77Error
}

pub type Us78 {
    Us78Some(f0i0 : String, f0i1 : Us45, f0i2 : String)
    Us78None
}

pub type Uh33 {
    Uh33Nil
    Uh33Cons(String, Us45, String, Uh33)
}

pub type Us79 {
    Us79Some(f0i0 : String, f0i1 : Us45, f0i2 : String)
    Us79None
}

pub type Uh34 {
    Uh34Nil
    Uh34Cons(dict.Dict(Int, Nil), Uh15, dict.Dict(String, #(dict.Dict(Int, #(Int, Int, String)), Int)), dict.Dict(String, #(Us2, dict.Dict(Int, String), Bool)), dict.Dict(String, String), dict.Dict(String, Uh3), dict.Dict(String, dict.Dict(String, Nil)), dict.Dict(String, #(Int, Bool)), dict.Dict(String, Nil), Int, Int, Int, Int, dict.Dict(String, Uh3), Uh3, dict.Dict(String, #(Us45, String)), dict.Dict(String, Int), dict.Dict(String, String), dict.Dict(String, String), dict.Dict(String, Int), Int, dict.Dict(String, Int), dict.Dict(String, Int), dict.Dict(String, Int), Int, Int, Int, Int, Int, dict.Dict(String, #(String, Us45, String)), Bool, Bool, Us30, Bool, Int, Uh28, Uh34)
}

pub type Uh35 {
    Uh35Nil
    Uh35Cons(Uh6, Uh35)
}

pub type Us80 {
    Us80Some(f0i0 : String, f0i1 : Int, f0i2 : Int, f0i3 : Int, f0i4 : Int, f0i5 : String, f0i6 : Int, f0i7 : Bool, f0i8 : String, f0i9 : String)
    Us80None
}

pub type Us81 {
    Us81Ok(f0i0 : String, f0i1 : Int, f0i2 : Int, f0i3 : Int, f0i4 : Int, f0i5 : String, f0i6 : Int, f0i7 : Bool, f0i8 : String, f0i9 : String)
    Us81Error(f1i0 : String)
}

pub type Us82 {
    Us82EventsCells
    Us82EventsSeed
    Us82EventsUsers
    Us82EventsEdits
}

pub type Us83 {
    Us83Some(f0i0 : Us82)
    Us83None
}

pub type Us84 {
    Us84Some(f0i0 : String, f0i1 : String, f0i2 : String, f0i3 : Int, f0i4 : Int, f0i5 : Int, f0i6 : String, f0i7 : Int, f0i8 : String, f0i9 : String, f0i10 : Int, f0i11 : Int, f0i12 : String)
    Us84None
}

pub type Us85 {
    Us85Ok(f0i0 : String, f0i1 : String, f0i2 : String, f0i3 : Int, f0i4 : Int, f0i5 : Int, f0i6 : String, f0i7 : Int, f0i8 : String, f0i9 : String, f0i10 : Int, f0i11 : Int, f0i12 : String)
    Us85Error(f1i0 : String)
}

pub type Us86 {
    Us86Some(f0i0 : String, f0i1 : String)
    Us86None
}

pub type Us87 {
    Us87Ok(f0i0 : String, f0i1 : String)
    Us87Error(f1i0 : String)
}

pub type Us88 {
    Us88Some(f0i0 : String, f0i1 : String, f0i2 : String)
    Us88None
}

pub type Us89 {
    Us89Ok(f0i0 : String, f0i1 : String, f0i2 : String)
    Us89Error(f1i0 : String)
}

pub type Us90 {
    Us90Some(f0i0 : String, f0i1 : Int)
    Us90None
}

pub type Us91 {
    Us91Ok(f0i0 : String, f0i1 : Int)
    Us91Error(f1i0 : String)
}

pub type Uh36 {
    Uh36Nil
    Uh36Cons(String, String, Uh36)
}

pub type Uh37 {
    Uh37Nil
    Uh37Cons(Uh29, Uh37)
}

pub type Us92 {
    Us92AppBearer
}

pub type Uh38 {
    Uh38Nil
    Uh38Cons(String, Dynamic, Uh38)
}

pub type Us93 {
    Us93UsersBy
    Us93UsersByIds
    Us93Following(f2i0 : Dynamic)
    Us93Timeline(f3i0 : Dynamic)
    Us93Lookup
    Us93Single(f5i0 : String)
    Us93SearchRecent
    Us93SearchAll
    Us93Elsewhere
}

pub type Us94 {
    Us94Ok(f0i0 : Dynamic)
    Us94Error
}

pub type Uh39 {
    Uh39Nil
    Uh39Cons(Int, String, Uh39)
}

pub type Uh40 {
    Uh40Nil
    Uh40Cons(Uh38, Uh40)
}

pub type Us95 {
    Us95UserBearer
    Us95OAuth1User
}

pub type Us96 {
    Us96ClientBasic
}

pub type Us97 {
    Us97Unauthenticated
}
