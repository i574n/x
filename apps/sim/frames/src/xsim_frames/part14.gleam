import gleam/erlang/atom
import gleam/erlang/process
import gleam/int
import gleam/list
import gleam/option
import gleam/otp/actor
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Us70, type Uh31, Uh31Cons, Uh31Nil, Uh3Cons, Uh3Nil, Us3None, Us3Some, Us72Error, Us72Ok, Us73Closed, Us73Failed, Us73Refused, Us73TimedOut, Us74Error, Us74Ok, Us75Error, Us75Ok, Us76Error, Us76Ok}
import xsim_frames/part1.{count_of_text_10, erlang_term_apply, erlang_term_coerce, erlang_term_tuple, method18, method4, spiral_string_length, spiral_string_slice, spiral_wrap_signed, split_list_2}
import xsim_frames/part13.{closure86}
import xsim_frames/part2.{concat_balanced_22}
import xsim_frames/part3.{method58, method59}

pub fn closure85(capt: #(process.Subject(Us70))) -> fn(Int) -> Uh3 {
    fn (v1) {
        let #(v0) = capt
        let v3 = atom.create("Elixir.Spiral.Cells.CompilerDaemon")
        let v5 = atom.create("port")
        let v6 = []
        let v7 = erlang_term_apply(v3, v5, v6)
        let v8 = erlang_term_coerce(v7)
        let v9 = erlang_term_coerce(1)
        let v10 = erlang_term_coerce(0)
        let v11 = erlang_term_coerce(0)
        let v12 = erlang_term_coerce(127)
        let v13 = []
        let v14 = [v9, ..v13]
        let v15 = [v10, ..v14]
        let v16 = [v11, ..v15]
        let v17 = [v12, ..v16]
        let v18 = erlang_term_tuple(v17)
        let v19 = erlang_term_coerce(v8)
        let v21 = atom.create("binary")
        let v22 = erlang_term_coerce(v21)
        let v24 = atom.create("line")
        let v25 = erlang_term_coerce(v24)
        let v27 = atom.create("packet")
        let v28 = erlang_term_coerce(v27)
        let v29 = []
        let v30 = [v25, ..v29]
        let v31 = [v28, ..v30]
        let v32 = erlang_term_tuple(v31)
        let v34 = atom.create("false")
        let v35 = erlang_term_coerce(v34)
        let v37 = atom.create("active")
        let v38 = erlang_term_coerce(v37)
        let v39 = []
        let v40 = [v35, ..v39]
        let v41 = [v38, ..v40]
        let v42 = erlang_term_tuple(v41)
        let v43 = erlang_term_coerce(8000000)
        let v45 = atom.create("packet_size")
        let v46 = erlang_term_coerce(v45)
        let v47 = []
        let v48 = [v43, ..v47]
        let v49 = [v46, ..v48]
        let v50 = erlang_term_tuple(v49)
        let v51 = []
        let v52 = [v50, ..v51]
        let v53 = [v42, ..v52]
        let v54 = [v32, ..v53]
        let v55 = [v22, ..v54]
        let v56 = erlang_term_coerce(v55)
        let v57 = erlang_term_coerce(1000)
        let v58 = "gen_tcp"
        let v59 = atom.create(v58)
        let v61 = atom.create("connect")
        let v62 = []
        let v63 = [v57, ..v62]
        let v64 = [v56, ..v63]
        let v65 = [v19, ..v64]
        let v66 = [v18, ..v65]
        let v67 = erlang_term_apply(v59, v61, v66)
        let v68 = erlang_term_coerce(1)
        let v69 = "erlang"
        let v70 = atom.create(v69)
        let v71 = "element"
        let v72 = atom.create(v71)
        let v73 = []
        let v74 = [v67, ..v73]
        let v75 = [v68, ..v74]
        let v76 = erlang_term_apply(v70, v72, v75)
        let v77 = "ok"
        let v78 = atom.create(v77)
        let v79 = erlang_term_coerce(v78)
        let v80 = v76 == v79
        let v117 =
            case v80 {
                True -> {
                    let v81 = erlang_term_coerce(2)
                    let v82 = atom.create(v69)
                    let v83 = atom.create(v71)
                    let v84 = []
                    let v85 = [v67, ..v84]
                    let v86 = [v81, ..v85]
                    let v87 = erlang_term_apply(v82, v83, v86)
                    Us72Ok(v87)
                }
                False -> {
                    let v89 = erlang_term_coerce(2)
                    let v90 = atom.create(v69)
                    let v91 = atom.create(v71)
                    let v92 = []
                    let v93 = [v67, ..v92]
                    let v94 = [v89, ..v93]
                    let v95 = erlang_term_apply(v90, v91, v94)
                    let v97 = atom.create("econnrefused")
                    let v98 = erlang_term_coerce(v97)
                    let v99 = v95 == v98
                    let v115 =
                        case v99 {
                            True -> Us73Refused
                            False -> {
                                let v102 = atom.create("timeout")
                                let v103 = erlang_term_coerce(v102)
                                let v104 = v95 == v103
                                case v104 {
                                    True -> Us73TimedOut
                                    False -> {
                                        let v107 = atom.create("closed")
                                        let v108 = erlang_term_coerce(v107)
                                        let v109 = v95 == v108
                                        case v109 {
                                            True -> Us73Closed
                                            False -> {
                                                let v111 = string.inspect(v95)
                                                Us73Failed(v111)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    Us72Error(v115)
                }
            }
        let v123 =
            case v117  {
                Us72Error(v120) -> Us74Error(v120)
                Us72Ok(v118) -> Us74Ok(v118)
            }
        let v252 =
            case v123  {
                Us74Error(v249) -> {
                    ""
                }
                Us74Ok(v124) -> {
                    let v126 = erlang_term_coerce("hello\n")
                    let v127 = atom.create(v58)
                    let v129 = atom.create("send")
                    let v130 = []
                    let v131 = [v126, ..v130]
                    let v132 = [v124, ..v131]
                    let v133 = erlang_term_apply(v127, v129, v132)
                    let v134 = atom.create(v77)
                    let v135 = erlang_term_coerce(v134)
                    let v136 = v133 == v135
                    let _v166 =
                        case v136 {
                            True -> Us75Ok
                            False -> {
                                let v138 = erlang_term_coerce(2)
                                let v139 = atom.create(v69)
                                let v140 = atom.create(v71)
                                let v141 = []
                                let v142 = [v133, ..v141]
                                let v143 = [v138, ..v142]
                                let v144 = erlang_term_apply(v139, v140, v143)
                                let v146 = atom.create("econnrefused")
                                let v147 = erlang_term_coerce(v146)
                                let v148 = v144 == v147
                                let v164 =
                                    case v148 {
                                        True -> Us73Refused
                                        False -> {
                                            let v151 = atom.create("timeout")
                                            let v152 = erlang_term_coerce(v151)
                                            let v153 = v144 == v152
                                            case v153 {
                                                True -> Us73TimedOut
                                                False -> {
                                                    let v156 = atom.create("closed")
                                                    let v157 = erlang_term_coerce(v156)
                                                    let v158 = v144 == v157
                                                    case v158 {
                                                        True -> Us73Closed
                                                        False -> {
                                                            let v160 = string.inspect(v144)
                                                            Us73Failed(v160)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                Us75Error(v164)
                            }
                        }
                    let v167 = erlang_term_coerce(0)
                    let v168 = erlang_term_coerce(2000)
                    let v169 = atom.create(v58)
                    let v171 = atom.create("recv")
                    let v172 = []
                    let v173 = [v168, ..v172]
                    let v174 = [v167, ..v173]
                    let v175 = [v124, ..v174]
                    let v176 = erlang_term_apply(v169, v171, v175)
                    let v177 = erlang_term_coerce(1)
                    let v178 = atom.create(v69)
                    let v179 = atom.create(v71)
                    let v180 = []
                    let v181 = [v176, ..v180]
                    let v182 = [v177, ..v181]
                    let v183 = erlang_term_apply(v178, v179, v182)
                    let v184 = atom.create(v77)
                    let v185 = erlang_term_coerce(v184)
                    let v186 = v183 == v185
                    let v223 =
                        case v186 {
                            True -> {
                                let v187 = erlang_term_coerce(2)
                                let v188 = atom.create(v69)
                                let v189 = atom.create(v71)
                                let v190 = []
                                let v191 = [v176, ..v190]
                                let v192 = [v187, ..v191]
                                let v193 = erlang_term_apply(v188, v189, v192)
                                Us72Ok(v193)
                            }
                            False -> {
                                let v195 = erlang_term_coerce(2)
                                let v196 = atom.create(v69)
                                let v197 = atom.create(v71)
                                let v198 = []
                                let v199 = [v176, ..v198]
                                let v200 = [v195, ..v199]
                                let v201 = erlang_term_apply(v196, v197, v200)
                                let v203 = atom.create("econnrefused")
                                let v204 = erlang_term_coerce(v203)
                                let v205 = v201 == v204
                                let v221 =
                                    case v205 {
                                        True -> Us73Refused
                                        False -> {
                                            let v208 = atom.create("timeout")
                                            let v209 = erlang_term_coerce(v208)
                                            let v210 = v201 == v209
                                            case v210 {
                                                True -> Us73TimedOut
                                                False -> {
                                                    let v213 = atom.create("closed")
                                                    let v214 = erlang_term_coerce(v213)
                                                    let v215 = v201 == v214
                                                    case v215 {
                                                        True -> Us73Closed
                                                        False -> {
                                                            let v217 = string.inspect(v201)
                                                            Us73Failed(v217)
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                Us72Error(v221)
                            }
                        }
                    let v237 =
                        case v223  {
                            Us72Error(v234) -> Us76Error(v234)
                            Us72Ok(v224) -> {
                                let v226 = atom.create("string")
                                let v228 = atom.create("trim")
                                let v229 = []
                                let v230 = [v224, ..v229]
                                let v231 = erlang_term_apply(v226, v228, v230)
                                let v232 = erlang_term_coerce(v231)
                                Us76Ok(v232)
                            }
                        }
                    let v238 = atom.create(v58)
                    let v240 = atom.create("close")
                    let v241 = []
                    let v242 = [v124, ..v241]
                    let _v243 = erlang_term_apply(v238, v240, v242)
                    case v237  {
                        Us76Error(v245) -> {
                            ""
                        }
                        Us76Ok(v244) -> v244
                    }
                }
            }
        let v253 = spiral_string_length(v252)
        let v255 = method58(v252, v253, 0)
        let v256 = spiral_wrap_signed(v253 - 1, 32)
        let v257 = spiral_string_slice(v252, v255, v256)
        let v258 = spiral_string_length(v257)
        let v259 = method59(v257, v258)
        let v260 = spiral_string_slice(v257, 0, v259)
        let v261 = v260 == ""
        let v265 =
            case v261 {
                True -> Uh3Nil
                False -> {
                    split_list_2("\t", v260)
                }
            }
        let v281 =
            case v265  {
                Uh3Cons(v266, v267) -> {
                    case v267  {
                        Uh3Cons(v268, v269) -> {
                            case v269  {
                                Uh3Cons(v270, v271) -> {
                                    let v272 = v266 == "spiral-cells"
                                    case v272 {
                                        True -> count_of_text_10(v270)
                                        False -> Us3None
                                    }
                                }
                                _ -> Us3None
                            }
                        }
                        _ -> Us3None
                    }
                }
                _ -> Us3None
            }
        let v286 =
            case v281  {
                Us3None -> {
                    ""
                }
                Us3Some(v282) -> {
                    int.to_string(v282)
                }
            }
        let v287 = closure86(Nil)
        let #(v288, v289, v290, v291) = actor.call(v0, 10000, v287)
        let v292 = { "  daemon pid=" } <> { v286 }
        let v293 = { v292 } <> { " " }
        let v294 = int.to_string(v291)
        let v295 = { "peak_mb=" } <> { v294 }
        let v296 = { v295 } <> { " last_mb=" }
        let v297 = int.to_string(v289)
        let v298 = { v296 } <> { v297 }
        let v299 = int.to_string(v290)
        let v300 = { " procs=" } <> { v299 }
        let v301 = { v300 } <> { " samples=" }
        let v302 = int.to_string(v288)
        let v303 = { v301 } <> { v302 }
        let v304 = { v298 } <> { v303 }
        let v305 = { v293 } <> { v304 }
        let v306 = { v305 } <> { " cumulative_after_schedule=" }
        let v307 = int.to_string(v1)
        let v308 = { v306 } <> { v307 }
        Uh3Cons(v308, Uh3Nil)
    }
}

pub fn closure87(capt: Nil) -> fn(Int) -> Uh3 {
    fn (v0) {
        Uh3Nil
    }
}

pub fn closure88(capt: #(fn(Int) -> Uh3, fn(Int) -> Uh3)) -> fn(Int) -> Uh3 {
    fn (v2) {
        let #(v0, v1) = capt
        let v3 = v0(v2)
        let v4 = v1(v2)
        method18(v3, v4)
    }
}

pub fn closure89(capt: Nil) -> fn(Nil) -> Int {
    fn (dom) {
        let v1 = atom.create("total")
        let v2 = erlang_term_coerce(v1)
        let v3 = "erlang"
        let v4 = atom.create(v3)
        let v6 = atom.create("memory")
        let v7 = []
        let v8 = [v2, ..v7]
        let v9 = erlang_term_apply(v4, v6, v8)
        let v10 = erlang_term_coerce(1048576)
        let v11 = atom.create(v3)
        let v13 = atom.create("div")
        let v14 = []
        let v15 = [v10, ..v14]
        let v16 = [v9, ..v15]
        let v17 = erlang_term_apply(v11, v13, v16)
        erlang_term_coerce(v17)
    }
}

pub fn closure90(capt: Nil) -> fn(Nil) -> Int {
    fn (dom) {
        let v1 = atom.create("millisecond")
        let v2 = erlang_term_coerce(v1)
        let v4 = atom.create("erlang")
        let v6 = atom.create("monotonic_time")
        let v7 = []
        let v8 = [v2, ..v7]
        let v9 = erlang_term_apply(v4, v6, v8)
        let v10 = erlang_term_coerce(v9)
        spiral_wrap_signed(v10, 32)
    }
}

pub fn is_tld_312(v0: String) -> Bool {
    let v1 = v0 |> string.lowercase
    let v2 = { "|" } <> { v1 }
    let v3 = { v2 } <> { "|" }
    let v5 = "|aaa|aarp|abb|abbott|abbvie|abc|able|abogado|abudhabi|ac|academy|accenture|accountant|accountants|aco|actor|ad|ads|adult|ae|aeg|aero|aetna|af|afl|africa|ag|agakhan|agency|ai|aig|airbus|airforce|" |> string.contains(v3)
    case v5 {
        True -> True
        False -> {
            let v7 = "|airtel|akdn|al|alibaba|alipay|allfinanz|allstate|ally|alsace|alstom|am|amazon|americanexpress|americanfamily|amex|amfam|amica|amsterdam|analytics|android|anquan|anz|ao|aol|apartments|app|apple|" |> string.contains(v3)
            case v7 {
                True -> True
                False -> {
                    let v9 = "|aq|aquarelle|ar|arab|aramco|archi|army|arpa|art|arte|as|asda|asia|associates|at|athleta|attorney|au|auction|audi|audible|audio|auspost|author|auto|autos|aw|aws|ax|axa|az|azure|ba|baby|baidu|" |> string.contains(v3)
                    case v9 {
                        True -> True
                        False -> {
                            let v11 = "|banamex|band|bank|bar|barcelona|barclaycard|barclays|barefoot|bargains|baseball|basketball|bauhaus|bayern|bb|bbc|bbt|bbva|bcg|bcn|bd|be|beats|beauty|beer|berlin|best|bestbuy|bet|bf|bg|bh|bharti|bi|" |> string.contains(v3)
                            case v11 {
                                True -> True
                                False -> {
                                    let v13 = "|bible|bid|bike|bing|bingo|bio|biz|bj|black|blackfriday|blockbuster|blog|bloomberg|blue|bm|bms|bmw|bn|bnpparibas|bo|boats|boehringer|bofa|bom|bond|boo|book|booking|bosch|bostik|boston|bot|boutique|" |> string.contains(v3)
                                    case v13 {
                                        True -> True
                                        False -> {
                                            let v15 = "|box|br|bradesco|bridgestone|broadway|broker|brother|brussels|bs|bt|build|builders|business|buy|buzz|bv|bw|by|bz|bzh|ca|cab|cafe|cal|call|calvinklein|cam|camera|camp|canon|capetown|capital|" |> string.contains(v3)
                                            case v15 {
                                                True -> True
                                                False -> {
                                                    let v17 = "|capitalone|car|caravan|cards|care|career|careers|cars|casa|case|cash|casino|cat|catering|catholic|cba|cbn|cbre|cc|cd|center|ceo|cern|cf|cfa|cfd|cg|ch|chanel|channel|charity|chase|chat|cheap|" |> string.contains(v3)
                                                    case v17 {
                                                        True -> True
                                                        False -> {
                                                            let v19 = "|chintai|christmas|chrome|church|ci|cipriani|circle|cisco|citadel|citi|citic|city|ck|cl|claims|cleaning|click|clinic|clinique|clothing|cloud|club|clubmed|cm|cn|co|coach|codes|coffee|college|" |> string.contains(v3)
                                                            case v19 {
                                                                True -> True
                                                                False -> {
                                                                    let v21 = "|cologne|com|commbank|community|company|compare|computer|comsec|condos|construction|consulting|contact|contractors|cooking|cool|coop|corsica|country|coupon|coupons|courses|cpa|cr|credit|" |> string.contains(v3)
                                                                    case v21 {
                                                                        True -> True
                                                                        False -> {
                                                                            let v23 = "|creditcard|creditunion|cricket|crown|crs|cruise|cruises|cu|cuisinella|cv|cw|cx|cy|cymru|cyou|cz|dad|dance|data|date|dating|datsun|day|dclk|dds|de|deal|dealer|deals|degree|delivery|dell|deloitte|" |> string.contains(v3)
                                                                            case v23 {
                                                                                True -> True
                                                                                False -> {
                                                                                    let v25 = "|delta|democrat|dental|dentist|desi|design|dev|dhl|diamonds|diet|digital|direct|directory|discount|discover|dish|diy|dj|dk|dm|dnp|do|docs|doctor|dog|domains|dot|download|drive|dtv|dubai|dupont|" |> string.contains(v3)
                                                                                    case v25 {
                                                                                        True -> True
                                                                                        False -> {
                                                                                            let v27 = "|durban|dvag|dvr|dz|earth|eat|ec|eco|edeka|edu|education|ee|eg|email|emerck|energy|engineer|engineering|enterprises|epson|equipment|er|ericsson|erni|es|esq|estate|et|eu|eurovision|eus|events|" |> string.contains(v3)
                                                                                            case v27 {
                                                                                                True -> True
                                                                                                False -> {
                                                                                                    let v29 = "|exchange|expert|exposed|express|extraspace|fage|fail|fairwinds|faith|family|fan|fans|farm|farmers|fashion|fast|fedex|feedback|ferrari|ferrero|fi|fidelity|fido|film|final|finance|financial|fire|" |> string.contains(v3)
                                                                                                    case v29 {
                                                                                                        True -> True
                                                                                                        False -> {
                                                                                                            let v31 = "|firestone|firmdale|fish|fishing|fit|fitness|fj|fk|flickr|flights|flir|florist|flowers|fly|fm|fo|foo|food|football|ford|forex|forsale|forum|foundation|fox|fr|free|fresenius|frl|frogans|frontier|" |> string.contains(v3)
                                                                                                            case v31 {
                                                                                                                True -> True
                                                                                                                False -> {
                                                                                                                    let v33 = "|ftr|fujitsu|fun|fund|furniture|futbol|fyi|ga|gal|gallery|gallo|gallup|game|games|gap|garden|gay|gb|gbiz|gd|gdn|ge|gea|gent|genting|george|gf|gg|ggee|gh|gi|gift|gifts|gives|giving|gl|glass|gle|" |> string.contains(v3)
                                                                                                                    case v33 {
                                                                                                                        True -> True
                                                                                                                        False -> {
                                                                                                                            let v35 = "|global|globo|gm|gmail|gmbh|gmo|gmx|gn|godaddy|gold|goldpoint|golf|goodyear|goog|google|gop|got|gov|gp|gq|gr|grainger|graphics|gratis|green|gripe|grocery|group|gs|gt|gu|gucci|guge|guide|guitars|guru|" |> string.contains(v3)
                                                                                                                            case v35 {
                                                                                                                                True -> True
                                                                                                                                False -> {
                                                                                                                                    let v37 = "|gw|gy|hair|hamburg|hangout|haus|hbo|hdfc|hdfcbank|health|healthcare|help|helsinki|here|hermes|hiphop|hisamitsu|hitachi|hiv|hk|hkt|hm|hn|hockey|holdings|holiday|homedepot|homegoods|homes|" |> string.contains(v3)
                                                                                                                                    case v37 {
                                                                                                                                        True -> True
                                                                                                                                        False -> {
                                                                                                                                            let v39 = "|homesense|honda|horse|hospital|host|hosting|hot|hotels|hotmail|house|how|hr|hsbc|ht|hu|hughes|hyatt|hyundai|ibm|icbc|ice|icu|id|ie|ieee|ifm|ikano|il|im|imamat|imdb|immo|immobilien|in|inc|" |> string.contains(v3)
                                                                                                                                            case v39 {
                                                                                                                                                True -> True
                                                                                                                                                False -> {
                                                                                                                                                    let v41 = "|industries|infiniti|info|ing|ink|institute|insurance|insure|int|international|intuit|investments|io|ipiranga|iq|ir|irish|is|ismaili|ist|istanbul|it|itau|itv|jaguar|java|jcb|je|jeep|jetzt|jewelry|" |> string.contains(v3)
                                                                                                                                                    case v41 {
                                                                                                                                                        True -> True
                                                                                                                                                        False -> {
                                                                                                                                                            let v43 = "|jio|jll|jm|jmp|jnj|jo|jobs|joburg|jot|joy|jp|jpmorgan|jprs|juegos|kaufen|kddi|ke|kerryhotels|kerryproperties|kfh|kg|kh|ki|kia|kids|kim|kindle|kitchen|kiwi|km|kn|koeln|komatsu|kosher|kp|kpmg|" |> string.contains(v3)
                                                                                                                                                            case v43 {
                                                                                                                                                                True -> True
                                                                                                                                                                False -> {
                                                                                                                                                                    let v45 = "|kpn|kr|krd|kred|kuokgroup|kw|ky|kyoto|kz|la|lacaixa|lamborghini|lamer|land|landrover|lanxess|lasalle|lat|latino|latrobe|law|lawyer|lb|lc|lds|lease|leclerc|lefrak|legal|lego|lexus|lgbt|li|lidl|" |> string.contains(v3)
                                                                                                                                                                    case v45 {
                                                                                                                                                                        True -> True
                                                                                                                                                                        False -> {
                                                                                                                                                                            let v47 = "|life|lifeinsurance|lifestyle|lighting|like|lilly|limited|limo|lincoln|link|live|living|lk|llc|llp|loan|loans|locker|locus|lol|london|lotte|lotto|love|lpl|lplfinancial|lr|ls|lt|ltd|ltda|lu|lundbeck|" |> string.contains(v3)
                                                                                                                                                                            case v47 {
                                                                                                                                                                                True -> True
                                                                                                                                                                                False -> {
                                                                                                                                                                                    let v49 = "|luxe|luxury|lv|ly|ma|madrid|maif|maison|makeup|man|management|mango|map|market|marketing|markets|marriott|marshalls|mattel|mba|mc|mckinsey|md|me|med|media|meet|melbourne|meme|memorial|men|menu|" |> string.contains(v3)
                                                                                                                                                                                    case v49 {
                                                                                                                                                                                        True -> True
                                                                                                                                                                                        False -> {
                                                                                                                                                                                            let v51 = "|merck|merckmsd|mg|mh|miami|microsoft|mil|mini|mint|mit|mitsubishi|mk|ml|mlb|mls|mm|mma|mn|mo|mobi|mobile|moda|moe|moi|mom|monash|money|monster|mormon|mortgage|moscow|moto|motorcycles|mov|movie|mp|" |> string.contains(v3)
                                                                                                                                                                                            case v51 {
                                                                                                                                                                                                True -> True
                                                                                                                                                                                                False -> {
                                                                                                                                                                                                    let v53 = "|mq|mr|ms|msd|mt|mtn|mtr|mu|museum|music|mv|mw|mx|my|mz|na|nab|nagoya|name|navy|nba|nc|ne|nec|net|netbank|netflix|network|neustar|new|news|next|nextdirect|nexus|nf|nfl|ng|ngo|nhk|ni|nico|nike|" |> string.contains(v3)
                                                                                                                                                                                                    case v53 {
                                                                                                                                                                                                        True -> True
                                                                                                                                                                                                        False -> {
                                                                                                                                                                                                            let v55 = "|nikon|ninja|nissan|nissay|nl|no|nokia|norton|now|nowruz|nowtv|np|nr|nra|nrw|ntt|nu|nyc|nz|obi|observer|office|okinawa|olayan|olayangroup|ollo|om|omega|one|ong|onl|online|ooo|open|oracle|orange|" |> string.contains(v3)
                                                                                                                                                                                                            case v55 {
                                                                                                                                                                                                                True -> True
                                                                                                                                                                                                                False -> {
                                                                                                                                                                                                                    let v57 = "|org|organic|origins|osaka|otsuka|ott|ovh|pa|page|panasonic|paris|pars|partners|parts|party|pay|pccw|pe|pet|pf|pfizer|pg|ph|pharmacy|phd|philips|phone|photo|photography|photos|physio|pics|pictet|" |> string.contains(v3)
                                                                                                                                                                                                                    case v57 {
                                                                                                                                                                                                                        True -> True
                                                                                                                                                                                                                        False -> {
                                                                                                                                                                                                                            let v59 = "|pictures|pid|pin|ping|pink|pioneer|pizza|pk|pl|place|play|playstation|plumbing|plus|pm|pn|pnc|pohl|poker|politie|porn|post|pr|praxi|press|prime|pro|prod|productions|prof|progressive|promo|" |> string.contains(v3)
                                                                                                                                                                                                                            case v59 {
                                                                                                                                                                                                                                True -> True
                                                                                                                                                                                                                                False -> {
                                                                                                                                                                                                                                    let v61 = "|properties|property|protection|pru|prudential|ps|pt|pub|pw|pwc|py|qa|qpon|quebec|quest|racing|radio|re|read|realestate|realtor|realty|recipes|red|redumbrella|rehab|reise|reisen|reit|reliance|" |> string.contains(v3)
                                                                                                                                                                                                                                    case v61 {
                                                                                                                                                                                                                                        True -> True
                                                                                                                                                                                                                                        False -> {
                                                                                                                                                                                                                                            let v63 = "|ren|rent|rentals|repair|report|republican|rest|restaurant|review|reviews|rexroth|rich|richardli|ricoh|ril|rio|rip|ro|rocks|rodeo|rogers|room|rs|rsvp|ru|rugby|ruhr|run|rw|rwe|ryukyu|sa|saarland|" |> string.contains(v3)
                                                                                                                                                                                                                                            case v63 {
                                                                                                                                                                                                                                                True -> True
                                                                                                                                                                                                                                                False -> {
                                                                                                                                                                                                                                                    let v65 = "|safe|safety|sakura|sale|salon|samsclub|samsung|sandvik|sandvikcoromant|sanofi|sap|sarl|sas|save|saxo|sb|sbi|sbs|sc|scb|schaeffler|schmidt|scholarships|school|schule|schwarz|science|scot|sd|se|" |> string.contains(v3)
                                                                                                                                                                                                                                                    case v65 {
                                                                                                                                                                                                                                                        True -> True
                                                                                                                                                                                                                                                        False -> {
                                                                                                                                                                                                                                                            let v67 = "|search|seat|secure|security|seek|select|sener|services|seven|sew|sex|sexy|sfr|sg|sh|shangrila|sharp|shell|shia|shiksha|shoes|shop|shopping|shouji|show|si|silk|sina|singles|site|sj|sk|ski|skin|" |> string.contains(v3)
                                                                                                                                                                                                                                                            case v67 {
                                                                                                                                                                                                                                                                True -> True
                                                                                                                                                                                                                                                                False -> {
                                                                                                                                                                                                                                                                    let v69 = "|sky|skype|sl|sling|sm|smart|smile|sn|sncf|so|soccer|social|softbank|software|sohu|solar|solutions|song|sony|soy|spa|space|sport|spot|sr|srl|ss|st|stada|staples|star|statebank|statefarm|stc|" |> string.contains(v3)
                                                                                                                                                                                                                                                                    case v69 {
                                                                                                                                                                                                                                                                        True -> True
                                                                                                                                                                                                                                                                        False -> {
                                                                                                                                                                                                                                                                            let v71 = "|stcgroup|stockholm|storage|store|stream|studio|study|style|su|sucks|supplies|supply|support|surf|surgery|suzuki|sv|swatch|swiss|sx|sy|sydney|systems|sz|tab|taipei|talk|taobao|target|tatamotors|" |> string.contains(v3)
                                                                                                                                                                                                                                                                            case v71 {
                                                                                                                                                                                                                                                                                True -> True
                                                                                                                                                                                                                                                                                False -> {
                                                                                                                                                                                                                                                                                    let v73 = "|tatar|tattoo|tax|taxi|tc|tci|td|tdk|team|tech|technology|tel|temasek|tennis|teva|tf|tg|th|thd|theater|theatre|tiaa|tickets|tienda|tips|tires|tirol|tj|tjmaxx|tjx|tk|tkmaxx|tl|tm|tmall|tn|to|" |> string.contains(v3)
                                                                                                                                                                                                                                                                                    case v73 {
                                                                                                                                                                                                                                                                                        True -> True
                                                                                                                                                                                                                                                                                        False -> {
                                                                                                                                                                                                                                                                                            let v75 = "|today|tokyo|tools|top|toray|toshiba|total|tours|town|toyota|toys|tr|trade|trading|training|travel|travelers|travelersinsurance|trust|trv|tt|tube|tui|tunes|tushu|tv|tvs|tw|tz|ua|ubank|ubs|ug|uk|" |> string.contains(v3)
                                                                                                                                                                                                                                                                                            case v75 {
                                                                                                                                                                                                                                                                                                True -> True
                                                                                                                                                                                                                                                                                                False -> {
                                                                                                                                                                                                                                                                                                    let v77 = "|unicom|university|uno|uol|ups|us|uy|uz|va|vacations|vana|vanguard|vc|ve|vegas|ventures|verisign|versicherung|vet|vg|vi|viajes|video|vig|viking|villas|vin|vip|virgin|visa|vision|viva|vivo|" |> string.contains(v3)
                                                                                                                                                                                                                                                                                                    case v77 {
                                                                                                                                                                                                                                                                                                        True -> True
                                                                                                                                                                                                                                                                                                        False -> {
                                                                                                                                                                                                                                                                                                            let v79 = "|vlaanderen|vn|vodka|volvo|vote|voting|voto|voyage|vu|wales|walmart|walter|wang|wanggou|watch|watches|weather|weatherchannel|web|webcam|weber|website|wed|wedding|weibo|weir|wf|whoswho|wien|" |> string.contains(v3)
                                                                                                                                                                                                                                                                                                            case v79 {
                                                                                                                                                                                                                                                                                                                True -> True
                                                                                                                                                                                                                                                                                                                False -> {
                                                                                                                                                                                                                                                                                                                    let v81 = "|wiki|williamhill|win|windows|wine|winners|wme|woodside|work|works|world|wow|ws|wtc|wtf|xbox|xerox|xihuan|xin|xxx|xyz|yachts|yahoo|yamaxun|yandex|ye|yodobashi|yoga|yokohama|you|youtube|yt|yun|za|" |> string.contains(v3)
                                                                                                                                                                                                                                                                                                                    case v81 {
                                                                                                                                                                                                                                                                                                                        True -> True
                                                                                                                                                                                                                                                                                                                        False -> {
                                                                                                                                                                                                                                                                                                                            "|zappos|zara|zero|zip|zm|zone|zuerich|zw|" |> string.contains(v3)
                                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                                }
                                                                                                                                                                                                                                            }
                                                                                                                                                                                                                                        }
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                }
                                                                                                                                                                                                                            }
                                                                                                                                                                                                                        }
                                                                                                                                                                                                                    }
                                                                                                                                                                                                                }
                                                                                                                                                                                                            }
                                                                                                                                                                                                        }
                                                                                                                                                                                                    }
                                                                                                                                                                                                }
                                                                                                                                                                                            }
                                                                                                                                                                                        }
                                                                                                                                                                                    }
                                                                                                                                                                                }
                                                                                                                                                                            }
                                                                                                                                                                        }
                                                                                                                                                                    }
                                                                                                                                                                }
                                                                                                                                                            }
                                                                                                                                                        }
                                                                                                                                                    }
                                                                                                                                                }
                                                                                                                                            }
                                                                                                                                        }
                                                                                                                                    }
                                                                                                                                }
                                                                                                                            }
                                                                                                                        }
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

pub fn closure94(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        is_tld_312(v0)
    }
}

pub fn closure95(capt: Nil) -> fn(Int) -> Int {
    fn (v0) {
        spiral_wrap_signed(v0, 32)
    }
}

pub fn ascii_of_318(v0: String) -> Int {
    let v1 = v0 == ""
    case v1 {
        True -> 0
        False -> {
            let v2 = spiral_string_length(v0)
            let v3 = v2 == 1
            case v3 {
                True -> {
                    let v4 = option.from_result(result.map(list.first(string.to_utf_codepoints(v0)), string.utf_codepoint_to_int))
                    let v5 = closure95(Nil)
                    let v6 = v4 |> option.map(v5)
                    v6 |> option.unwrap(0)
                }
                False -> 256
            }
        }
    }
}

pub fn ascii_letter_317(v0: String) -> Bool {
    let v1 = ascii_of_318(v0)
    let v2 = v1 >= 65
    let v4 =
        case v2 {
            True -> {
                v1 <= 90
            }
            False -> False
        }
    case v4 {
        True -> True
        False -> {
            let v5 = v1 >= 97
            case v5 {
                True -> {
                    v1 <= 122
                }
                False -> False
            }
        }
    }
}

pub fn label_glyph_316(v0: String) -> Bool {
    let v1 = ascii_letter_317(v0)
    let v6 =
        case v1 {
            True -> True
            False -> {
                let v2 = ascii_of_318(v0)
                let v3 = v2 >= 48
                case v3 {
                    True -> {
                        v2 <= 57
                    }
                    False -> False
                }
            }
        }
    let v8 =
        case v6 {
            True -> True
            False -> {
                v0 == "_"
            }
        }
    case v8 {
        True -> True
        False -> {
            v0 == "-"
        }
    }
}

pub fn run_glyph_315(v0: String) -> Bool {
    let v1 = label_glyph_316(v0)
    case v1 {
        True -> True
        False -> {
            v0 == "."
        }
    }
}

pub fn run_of_320(v0: Uh3, v1: Uh3) -> #(Uh3, Uh3) {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = run_glyph_315(v2)
            case v4 {
                True -> {
                    let v5 = Uh3Cons(v2, v1)
                    run_of_320(v3, v5)
                }
                False -> {
                    let v9 = method4(v1, Uh3Nil)
                    #(v9, v0)
                }
            }
        }
        _ -> {
            let v13 = method4(v1, Uh3Nil)
            #(v13, v0)
        }
    }
}

pub fn method322(v0: Uh3, v1: String) -> String {
    case v0  {
        Uh3Cons(v2, v3) -> method322(v3, v2)
        Uh3Nil -> v1
    }
}

pub fn last_or_321(v0: String, v1: Uh3) -> String {
    method322(v1, v0)
}

pub fn run_piece_319(v0: String, v1: Uh3) -> #(String, Uh3, String, Uh3) {
    let #(v3, v4) = run_of_320(v1, Uh3Nil)
    let v5 = last_or_321(v0, v3)
    #(v5, v4, v0, v3)
}

pub fn method323(v0: Uh31, v1: Uh31) -> Uh31 {
    case v0  {
        Uh31Cons(v2, v3, v4) -> {
            let v5 = Uh31Cons(v2, v3, v1)
            method323(v4, v5)
        }
        Uh31Nil -> v1
    }
}

pub fn pieces_from_314(v0: String, v1: Uh3, v2: Uh31) -> Uh31 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = run_glyph_315(v3)
            case v5 {
                True -> {
                    let #(v6, v7, v8, v9) = run_piece_319(v0, v1)
                    let v10 = Uh31Cons(v8, v9, v2)
                    pieces_from_314(v6, v7, v10)
                }
                False -> {
                    let v13 = Uh3Cons(v3, Uh3Nil)
                    let v14 = Uh31Cons(v0, v13, v2)
                    pieces_from_314(v3, v4, v14)
                }
            }
        }
        Uh3Nil -> {
            method323(v2, Uh31Nil)
        }
    }
}

pub fn blocks_domain_326(v0: String) -> Bool {
    let v1 = v0 == "@"
    let v3 =
        case v1 {
            True -> True
            False -> {
                v0 == "/"
            }
        }
    case v3 {
        True -> True
        False -> {
            let v4 = ascii_of_318(v0)
            v4 > 127
        }
    }
}

pub fn after_label_329(v0: Uh3) -> Bool {
    case v0  {
        Uh3Cons(v1, v2) -> label_glyph_316(v1)
        Uh3Nil -> False
    }
}

pub fn letters_after_331(v0: Uh3, v1: Uh3) -> #(String, Bool) {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = ascii_letter_317(v2)
            case v4 {
                True -> {
                    let v5 = Uh3Cons(v2, v1)
                    letters_after_331(v3, v5)
                }
                False -> {
                    let v9 = method4(v1, Uh3Nil)
                    let v11 = concat_balanced_22("", v9)
                    let v12 = v2 == "."
                    #(v11, v12)
                }
            }
        }
        Uh3Nil -> {
            let v16 = method4(v1, Uh3Nil)
            let v18 = concat_balanced_22("", v16)
            #(v18, True)
        }
    }
}

pub fn label_before_332(v0: Uh3, v1: Uh3) -> String {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = label_glyph_316(v2)
            case v4 {
                True -> {
                    let v5 = Uh3Cons(v2, v1)
                    label_before_332(v3, v5)
                }
                False -> {
                    concat_balanced_22("", v1)
                }
            }
        }
        _ -> {
            concat_balanced_22("", v1)
        }
    }
}

pub fn tld_ok_333(v0: fn(String) -> Bool, v1: String, v2: String) -> Bool {
    let v3 = spiral_string_length(v2)
    let v4 = v3 >= 2
    let v6 =
        case v4 {
            True -> {
                v3 <= 63
            }
            False -> False
        }
    let v8 =
        case v6 {
            True -> v0(v2)
            False -> False
        }
    case v8 {
        True -> {
            let v9 = v3 != 2
            case v9 {
                True -> True
                False -> {
                    let v10 = spiral_string_length(v1)
                    v10 > 2
                }
            }
        }
        False -> False
    }
}

pub fn linked_dot_330(v0: fn(String) -> Bool, v1: Uh3, v2: Uh3) -> Bool {
    let #(v4, v5) = letters_after_331(v2, Uh3Nil)
    let v7 = label_before_332(v1, Uh3Nil)
    case v5 {
        True -> {
            let v8 = tld_ok_333(v0, v7, v4)
            case v8 {
                True -> True
                False -> {
                    let v9 = v7 == "t"
                    case v9 {
                        True -> {
                            v4 == "co"
                        }
                        False -> False
                    }
                }
            }
        }
        False -> False
    }
}

pub fn defusable_328(v0: fn(String) -> Bool, v1: Uh3, v2: String, v3: Uh3) -> Bool {
    let v4 = v2 == "."
    let v6 =
        case v4 {
            True -> after_label_329(v1)
            False -> False
        }
    case v6 {
        True -> linked_dot_330(v0, v1, v3)
        False -> False
    }
}
