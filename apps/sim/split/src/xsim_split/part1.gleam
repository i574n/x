import gleam/bit_array
import gleam/dynamic.{type Dynamic}
import gleam/erlang/atom
import gleam/int
import gleam/list
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_split/types.{type SpiralArrayStore, type SpiralArray, type SpiralRefCell, type SpiralRef, type ListString, type Uh1, type Us1, ListStringCons, ListStringNil, SpiralArray, SpiralRef, Uh1Cons, Uh1Nil, Us1None, Us1Some}

@ external(erlang, "unicode", "characters_to_binary")
pub fn unicode_erlang_characters_to_binary(chars: List(Int)) -> String

@external(erlang, "string", "find")
pub fn spiral_sm_find_trailing(text: String, search: String, direction: atom.Atom) -> Dynamic


@external(erlang, "gleam_stdlib", "identity")
pub fn spiral_sm_coerce(value: a) -> b

@ external(erlang, "unicode", "characters_to_nfc_binary")
pub fn unicode_erlang_nfc(s: String) -> String

pub fn spiral_string_length(text: String) -> Int {
  bit_array.byte_size(bit_array.from_string(text))
}


pub fn spiral_wrap_signed(value: Int, bits: Int) -> Int {
  let half = int.bitwise_shift_left(1, bits - 1)
  int.bitwise_and(value + half, int.bitwise_shift_left(1, bits) - 1) - half
}





@external(erlang, "gleam_stdlib", "identity")
pub fn spiral_string_of_checked_bytes(bytes: BitArray) -> String {
  case bit_array.to_string(bytes) {
    Ok(text) -> text
    Error(_) -> panic as "spiral string slice: splits a character"
  }
}


pub fn spiral_string_starts_character(bytes: BitArray, at: Int) -> Bool {
  case bit_array.slice(bytes, at, 1) {
    Ok(<<lead>>) -> lead < 128 || lead >= 192
    _ -> True
  }
}


pub fn spiral_string_slice(text: String, from: Int, to: Int) -> String {
  let bytes = bit_array.from_string(text)
  let length = bit_array.byte_size(bytes)
  case from < 0 || from > length || to < from - 1 || to >= length {
    True -> panic as "spiral string slice: out of range"
    False ->
      case to < from {
        True -> ""
        False ->
          case spiral_string_starts_character(bytes, from) && spiral_string_starts_character(bytes, to + 1) {
            False -> panic as "spiral string slice: splits a character"
            True ->
              case bit_array.slice(bytes, from, to - from + 1) {
                Ok(part) -> spiral_string_of_checked_bytes(part)
                Error(_) -> panic as "spiral string slice: out of range"
              }
          }
      }
  }
}


@external(erlang, "xsim_split_ffi", "array_new")
@external(javascript, "./xsim_split_ffi.mjs", "array_new")
pub fn spiral_array_store_new(size: Int, fill: a) -> SpiralArrayStore(a)


@external(erlang, "xsim_split_ffi", "array_get")
@external(javascript, "./xsim_split_ffi.mjs", "array_get")
pub fn spiral_array_store_get(store: SpiralArrayStore(a), i: Int) -> a


@external(erlang, "xsim_split_ffi", "array_set")
@external(javascript, "./xsim_split_ffi.mjs", "array_set")
pub fn spiral_array_store_set(store: SpiralArrayStore(a), i: Int, value: a) -> Nil


pub fn spiral_array_create(size: Int) -> SpiralArray(a) {
  SpiralArray(store: spiral_array_store_new(size, option.None), size: size)
}



pub fn spiral_array_set(xs: SpiralArray(a), i: Int, value: a) -> Nil {
  case i >= 0 && i < xs.size {
    True -> spiral_array_store_set(xs.store, i, option.Some(value))
    False -> panic as "spiral array: index out of bounds"
  }
}


pub fn spiral_array_from_list(values: List(a)) -> SpiralArray(a) {
  let xs = spiral_array_create(list.length(values))
  let _ = list.index_map(values, fn(x, i) { spiral_array_set(xs, i, x) })
  xs
}



pub fn spiral_array_get(xs: SpiralArray(a), i: Int) -> a {
  case i >= 0 && i < xs.size {
    True ->
      case spiral_array_store_get(xs.store, i) {
        option.Some(x) -> x
        option.None -> panic as "spiral array: read of an element that was never set"
      }
    False -> panic as "spiral array: index out of bounds"
  }
}


@external(erlang, "xsim_split_ffi", "ref_new")
@external(javascript, "./xsim_split_ffi.mjs", "ref_new")
pub fn spiral_ref_cell_new(value: a) -> SpiralRefCell(a)


@external(erlang, "xsim_split_ffi", "ref_get")
@external(javascript, "./xsim_split_ffi.mjs", "ref_get")
pub fn spiral_ref_cell_get(cell: SpiralRefCell(a)) -> a


@external(erlang, "xsim_split_ffi", "ref_set")
@external(javascript, "./xsim_split_ffi.mjs", "ref_set")
pub fn spiral_ref_cell_set(cell: SpiralRefCell(a), value: a) -> Nil


pub fn spiral_ref_new(value: a) -> SpiralRef(a) {
  SpiralRef(cell: spiral_ref_cell_new(value))
}


pub fn spiral_ref_get(reference: SpiralRef(a)) -> a {
  spiral_ref_cell_get(reference.cell)
}


pub fn spiral_ref_set(reference: SpiralRef(a), value: a) -> Nil {
  spiral_ref_cell_set(reference.cell, value)
}


pub fn is_tld_1(v0: String) -> Bool {
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

pub fn closure1(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        is_tld_1(v0)
    }
}

pub fn closure2(capt: Nil) -> fn(Int) -> Int {
    fn (v0) {
        spiral_wrap_signed(v0, 32)
    }
}

pub fn ascii_of_7(v0: String) -> Int {
    let v1 = v0 == ""
    case v1 {
        True -> 0
        False -> {
            let v2 = spiral_string_length(v0)
            let v3 = v2 == 1
            case v3 {
                True -> {
                    let v4 = option.from_result(result.map(list.first(string.to_utf_codepoints(v0)), string.utf_codepoint_to_int))
                    let v5 = closure2(Nil)
                    let v6 = v4 |> option.map(v5)
                    v6 |> option.unwrap(0)
                }
                False -> 256
            }
        }
    }
}

pub fn ascii_letter_6(v0: String) -> Bool {
    let v1 = ascii_of_7(v0)
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

pub fn label_glyph_5(v0: String) -> Bool {
    let v1 = ascii_letter_6(v0)
    let v6 =
        case v1 {
            True -> True
            False -> {
                let v2 = ascii_of_7(v0)
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

pub fn run_glyph_4(v0: String) -> Bool {
    let v1 = label_glyph_5(v0)
    case v1 {
        True -> True
        False -> {
            v0 == "."
        }
    }
}

pub fn method10(v0: ListString, v1: ListString) -> ListString {
    case v0  {
        ListStringCons(v2, v3) -> {
            let v4 = ListStringCons(v2, v1)
            method10(v3, v4)
        }
        ListStringNil -> v1
    }
}

pub fn run_of_9(v0: ListString, v1: ListString) -> #(ListString, ListString) {
    case v0  {
        ListStringCons(v2, v3) -> {
            let v4 = run_glyph_4(v2)
            case v4 {
                True -> {
                    let v5 = ListStringCons(v2, v1)
                    run_of_9(v3, v5)
                }
                False -> {
                    let v9 = method10(v1, ListStringNil)
                    #(v9, v0)
                }
            }
        }
        _ -> {
            let v13 = method10(v1, ListStringNil)
            #(v13, v0)
        }
    }
}

pub fn method12(v0: ListString, v1: String) -> String {
    case v0  {
        ListStringCons(v2, v3) -> method12(v3, v2)
        ListStringNil -> v1
    }
}

pub fn last_or_11(v0: String, v1: ListString) -> String {
    method12(v1, v0)
}

pub fn run_piece_8(v0: String, v1: ListString) -> #(String, ListString, String, ListString) {
    let #(v3, v4) = run_of_9(v1, ListStringNil)
    let v5 = last_or_11(v0, v3)
    #(v5, v4, v0, v3)
}

pub fn method13(v0: Uh1, v1: Uh1) -> Uh1 {
    case v0  {
        Uh1Cons(v2, v3, v4) -> {
            let v5 = Uh1Cons(v2, v3, v1)
            method13(v4, v5)
        }
        Uh1Nil -> v1
    }
}

pub fn pieces_from_3(v0: String, v1: ListString, v2: Uh1) -> Uh1 {
    case v1  {
        ListStringCons(v3, v4) -> {
            let v5 = run_glyph_4(v3)
            case v5 {
                True -> {
                    let #(v6, v7, v8, v9) = run_piece_8(v0, v1)
                    let v10 = Uh1Cons(v8, v9, v2)
                    pieces_from_3(v6, v7, v10)
                }
                False -> {
                    let v13 = ListStringCons(v3, ListStringNil)
                    let v14 = Uh1Cons(v0, v13, v2)
                    pieces_from_3(v3, v4, v14)
                }
            }
        }
        ListStringNil -> {
            method13(v2, Uh1Nil)
        }
    }
}

pub fn blocks_domain_16(v0: String) -> Bool {
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
            let v4 = ascii_of_7(v0)
            v4 > 127
        }
    }
}

pub fn after_label_19(v0: ListString) -> Bool {
    case v0  {
        ListStringCons(v1, v2) -> label_glyph_5(v1)
        ListStringNil -> False
    }
}

pub fn concat_pass_23(v0: String, v1: ListString, v2: ListString) -> ListString {
    case v1  {
        ListStringCons(v3, v4) -> {
            case v4  {
                ListStringCons(v5, v6) -> {
                    let v7 = { v3 } <> { v0 }
                    let v8 = { v7 } <> { v5 }
                    let v9 = ListStringCons(v8, v2)
                    concat_pass_23(v0, v6, v9)
                }
                ListStringNil -> {
                    let v12 = ListStringCons(v3, ListStringNil)
                    method10(v2, v12)
                }
            }
        }
        ListStringNil -> {
            method10(v2, ListStringNil)
        }
    }
}

pub fn concat_balanced_22(v0: String, v1: ListString) -> String {
    case v1  {
        ListStringCons(v3, v4) -> {
            case v4  {
                ListStringNil -> v3
                _ -> {
                    let v6 = concat_pass_23(v0, v1, ListStringNil)
                    concat_balanced_22(v0, v6)
                }
            }
        }
        ListStringNil -> {
            ""
        }
    }
}

pub fn letters_after_21(v0: ListString, v1: ListString) -> #(String, Bool) {
    case v0  {
        ListStringCons(v2, v3) -> {
            let v4 = ascii_letter_6(v2)
            case v4 {
                True -> {
                    let v5 = ListStringCons(v2, v1)
                    letters_after_21(v3, v5)
                }
                False -> {
                    let v9 = method10(v1, ListStringNil)
                    let v11 = concat_balanced_22("", v9)
                    let v12 = v2 == "."
                    #(v11, v12)
                }
            }
        }
        ListStringNil -> {
            let v16 = method10(v1, ListStringNil)
            let v18 = concat_balanced_22("", v16)
            #(v18, True)
        }
    }
}

pub fn label_before_24(v0: ListString, v1: ListString) -> String {
    case v0  {
        ListStringCons(v2, v3) -> {
            let v4 = label_glyph_5(v2)
            case v4 {
                True -> {
                    let v5 = ListStringCons(v2, v1)
                    label_before_24(v3, v5)
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

pub fn tld_ok_25(v0: fn(String) -> Bool, v1: String, v2: String) -> Bool {
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

pub fn linked_dot_20(v0: fn(String) -> Bool, v1: ListString, v2: ListString) -> Bool {
    let #(v4, v5) = letters_after_21(v2, ListStringNil)
    let v7 = label_before_24(v1, ListStringNil)
    case v5 {
        True -> {
            let v8 = tld_ok_25(v0, v7, v4)
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

pub fn defusable_18(v0: fn(String) -> Bool, v1: ListString, v2: String, v3: ListString) -> Bool {
    let v4 = v2 == "."
    let v6 =
        case v4 {
            True -> after_label_19(v1)
            False -> False
        }
    case v6 {
        True -> linked_dot_20(v0, v1, v3)
        False -> False
    }
}

pub fn defused_run_17(v0: fn(String) -> Bool, v1: ListString, v2: ListString, v3: ListString) -> ListString {
    case v2  {
        ListStringCons(v4, v5) -> {
            let v6 = ListStringCons(v4, v1)
            let v7 = defusable_18(v0, v1, v4, v5)
            let v10 =
                case v7 {
                    True -> {
                        let v8 = unicode_erlang_characters_to_binary([8203])
                        ListStringCons(v8, v3)
                    }
                    False -> v3
                }
            let v11 = ListStringCons(v4, v10)
            defused_run_17(v0, v6, v5, v11)
        }
        ListStringNil -> {
            method10(v3, ListStringNil)
        }
    }
}

pub fn run_text_15(v0: fn(String) -> Bool, v1: String, v2: ListString) -> ListString {
    let v3 = blocks_domain_16(v1)
    case v3 {
        True -> v2
        False -> {
            defused_run_17(v0, ListStringNil, v2, ListStringNil)
        }
    }
}

pub fn method26(v0: ListString, v1: ListString) -> ListString {
    case v0  {
        ListStringCons(v2, v3) -> {
            let v4 = method26(v3, v1)
            ListStringCons(v2, v4)
        }
        ListStringNil -> v1
    }
}

pub fn method14(v0: fn(String) -> Bool, v1: Uh1, v2: ListString) -> ListString {
    case v1  {
        Uh1Cons(v3, v4, v5) -> {
            let v6 = method14(v0, v5, v2)
            let v7 = run_text_15(v0, v3, v4)
            method26(v7, v6)
        }
        Uh1Nil -> v2
    }
}

pub fn defused_dots_by_2(v0: fn(String) -> Bool, v1: String) -> String {
    let v2 = ""
    let v3 = string.to_graphemes(v1)
    let v4 = v3 |> list.reverse
    let listm_fold = v4 |> list.fold (ListStringNil, fn (acc, x) {
    let v6 = x
    let v7 = acc
    ListStringCons(v6, v7)
    })
    let v9 = listm_fold
    let v11 = pieces_from_3(v2, v9, Uh1Nil)
    let v13 = method14(v0, v11, ListStringNil)
    concat_balanced_22(v2, v13)
}

pub fn word_glyph_32(v0: String) -> Bool {
    let v1 = label_glyph_5(v0)
    case v1 {
        True -> {
            v0 != "-"
        }
        False -> False
    }
}

pub fn word_length_31(v0: ListString, v1: Int) -> #(Int, ListString) {
    case v0  {
        ListStringCons(v2, v3) -> {
            let v4 = word_glyph_32(v2)
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v1 + 1, 32)
                    word_length_31(v3, v5)
                }
                False -> #(v1, v0)
            }
        }
        _ -> #(v1, v0)
    }
}

pub fn closure3(capt: Nil) -> fn(String) -> Us1 {
    fn (v0) {
        Us1Some(v0)
    }
}

pub fn mention_quiet_33(v0: String) -> Bool {
    let v1 = word_glyph_32(v0)
    let v18 =
        case v1 {
            True -> True
            False -> {
                let v2 = spiral_string_length(v0)
                let v3 = v2 == 1
                case v3 {
                    True -> {
                        let v4 = v0 == ""
                        let v15 =
                            case v4 {
                                True -> 0
                                False -> {
                                    let v6 = option.from_result(result.map(string.split_once("!#$%&*@", v0), pair.first))
                                    let v7 = closure3(Nil)
                                    let v8 = v6 |> option.map(v7)
                                    let v10 = v8 |> option.unwrap(Us1None)
                                    case v10  {
                                        Us1None -> -1
                                        Us1Some(v11) -> {
                                            bit_array.byte_size(bit_array.from_string(v11))
                                        }
                                    }
                                }
                            }
                        v15 >= 0
                    }
                    False -> False
                }
            }
        }
    let v20 =
        case v18 {
            True -> True
            False -> {
                v0 == "＠"
            }
        }
    v20 == False
}

pub fn rt_letters_35(v0: String, v1: String) -> Bool {
    let v2 = spiral_string_length(v0)
    let v3 = v2 == 1
    let v17 =
        case v3 {
            True -> {
                let v4 = v0 == ""
                let v15 =
                    case v4 {
                        True -> 0
                        False -> {
                            let v6 = option.from_result(result.map(string.split_once("tT", v0), pair.first))
                            let v7 = closure3(Nil)
                            let v8 = v6 |> option.map(v7)
                            let v10 = v8 |> option.unwrap(Us1None)
                            case v10  {
                                Us1None -> -1
                                Us1Some(v11) -> {
                                    bit_array.byte_size(bit_array.from_string(v11))
                                }
                            }
                        }
                    }
                v15 >= 0
            }
            False -> False
        }
    case v17 {
        True -> {
            let v18 = spiral_string_length(v1)
            let v19 = v18 == 1
            case v19 {
                True -> {
                    let v20 = v1 == ""
                    let v31 =
                        case v20 {
                            True -> 0
                            False -> {
                                let v22 = option.from_result(result.map(string.split_once("rR", v1), pair.first))
                                let v23 = closure3(Nil)
                                let v24 = v22 |> option.map(v23)
                                let v26 = v24 |> option.unwrap(Us1None)
                                case v26  {
                                    Us1None -> -1
                                    Us1Some(v27) -> {
                                        bit_array.byte_size(bit_array.from_string(v27))
                                    }
                                }
                            }
                        }
                    v31 >= 0
                }
                False -> False
            }
        }
        False -> False
    }
}
