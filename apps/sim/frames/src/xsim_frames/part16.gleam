import gleam/bit_array
import gleam/list
import gleam/option
import gleam/pair
import gleam/result
import gleam/string
import xsim_frames/types.{type Uh3, type Uh30, Uh30Cons, Uh30Nil, Uh3Cons, Uh3Nil, Us2None, Us2Some}
import xsim_frames/part1.{closure1, method4, spiral_string_length, spiral_wrap_signed, unicode_erlang_characters_to_binary}
import xsim_frames/part2.{concat_balanced_22, method18}

pub fn is_tld_310(v0: String) -> Bool {
    let v1 = v0 |> string.lowercase
    let v2 = "|"
    let v3 = v2 <> v1 
    let v4 = v3 <> v2 
    let v5 = "|aaa|aarp|abb|abbott|abbvie|abc|able|abogado|abudhabi|ac|academy|accenture|accountant|accountants|"
    let v6 = "aco|actor|ad|ads|adult|ae|aeg|aero|aetna|af|afl|africa|ag|agakhan|agency|ai|aig|airbus|airforce|"
    let v7 = v5 <> v6 
    let v8 = "|airtel|akdn|al|alibaba|alipay|allfinanz|allstate|ally|alsace|alstom|am|amazon|americanexpress|"
    let v9 = "americanfamily|amex|amfam|amica|amsterdam|analytics|android|anquan|anz|ao|aol|apartments|app|apple|"
    let v10 = v8 <> v9 
    let v11 = "|aq|aquarelle|ar|arab|aramco|archi|army|arpa|art|arte|as|asda|asia|associates|at|athleta|attorney|"
    let v12 = "au|auction|audi|audible|audio|auspost|author|auto|autos|aw|aws|ax|axa|az|azure|ba|baby|baidu|"
    let v13 = v11 <> v12 
    let v14 = "|banamex|band|bank|bar|barcelona|barclaycard|barclays|barefoot|bargains|baseball|basketball|bauhaus|"
    let v15 = "bayern|bb|bbc|bbt|bbva|bcg|bcn|bd|be|beats|beauty|beer|berlin|best|bestbuy|bet|bf|bg|bh|bharti|bi|"
    let v16 = v14 <> v15 
    let v17 = "|bible|bid|bike|bing|bingo|bio|biz|bj|black|blackfriday|blockbuster|blog|bloomberg|blue|bm|bms|bmw|"
    let v18 = "bn|bnpparibas|bo|boats|boehringer|bofa|bom|bond|boo|book|booking|bosch|bostik|boston|bot|boutique|"
    let v19 = v17 <> v18 
    let v20 = "|box|br|bradesco|bridgestone|broadway|broker|brother|brussels|bs|bt|build|builders|business|buy|"
    let v21 = "buzz|bv|bw|by|bz|bzh|ca|cab|cafe|cal|call|calvinklein|cam|camera|camp|canon|capetown|capital|"
    let v22 = v20 <> v21 
    let v23 = "|capitalone|car|caravan|cards|care|career|careers|cars|casa|case|cash|casino|cat|catering|catholic|"
    let v24 = "cba|cbn|cbre|cc|cd|center|ceo|cern|cf|cfa|cfd|cg|ch|chanel|channel|charity|chase|chat|cheap|"
    let v25 = v23 <> v24 
    let v26 = "|chintai|christmas|chrome|church|ci|cipriani|circle|cisco|citadel|citi|citic|city|ck|cl|claims|"
    let v27 = "cleaning|click|clinic|clinique|clothing|cloud|club|clubmed|cm|cn|co|coach|codes|coffee|college|"
    let v28 = v26 <> v27 
    let v29 = "|cologne|com|commbank|community|company|compare|computer|comsec|condos|construction|consulting|"
    let v30 = "contact|contractors|cooking|cool|coop|corsica|country|coupon|coupons|courses|cpa|cr|credit|"
    let v31 = v29 <> v30 
    let v32 = "|creditcard|creditunion|cricket|crown|crs|cruise|cruises|cu|cuisinella|cv|cw|cx|cy|cymru|cyou|cz|"
    let v33 = "dad|dance|data|date|dating|datsun|day|dclk|dds|de|deal|dealer|deals|degree|delivery|dell|deloitte|"
    let v34 = v32 <> v33 
    let v35 = "|delta|democrat|dental|dentist|desi|design|dev|dhl|diamonds|diet|digital|direct|directory|discount|"
    let v36 = "discover|dish|diy|dj|dk|dm|dnp|do|docs|doctor|dog|domains|dot|download|drive|dtv|dubai|dupont|"
    let v37 = v35 <> v36 
    let v38 = "|durban|dvag|dvr|dz|earth|eat|ec|eco|edeka|edu|education|ee|eg|email|emerck|energy|engineer|"
    let v39 = "engineering|enterprises|epson|equipment|er|ericsson|erni|es|esq|estate|et|eu|eurovision|eus|events|"
    let v40 = v38 <> v39 
    let v41 = "|exchange|expert|exposed|express|extraspace|fage|fail|fairwinds|faith|family|fan|fans|farm|farmers|"
    let v42 = "fashion|fast|fedex|feedback|ferrari|ferrero|fi|fidelity|fido|film|final|finance|financial|fire|"
    let v43 = v41 <> v42 
    let v44 = "|firestone|firmdale|fish|fishing|fit|fitness|fj|fk|flickr|flights|flir|florist|flowers|fly|fm|fo|"
    let v45 = "foo|food|football|ford|forex|forsale|forum|foundation|fox|fr|free|fresenius|frl|frogans|frontier|"
    let v46 = v44 <> v45 
    let v47 = "|ftr|fujitsu|fun|fund|furniture|futbol|fyi|ga|gal|gallery|gallo|gallup|game|games|gap|garden|gay|gb|"
    let v48 = "gbiz|gd|gdn|ge|gea|gent|genting|george|gf|gg|ggee|gh|gi|gift|gifts|gives|giving|gl|glass|gle|"
    let v49 = v47 <> v48 
    let v50 = "|global|globo|gm|gmail|gmbh|gmo|gmx|gn|godaddy|gold|goldpoint|golf|goodyear|goog|google|gop|got|gov|"
    let v51 = "gp|gq|gr|grainger|graphics|gratis|green|gripe|grocery|group|gs|gt|gu|gucci|guge|guide|guitars|guru|"
    let v52 = v50 <> v51 
    let v53 = "|gw|gy|hair|hamburg|hangout|haus|hbo|hdfc|hdfcbank|health|healthcare|help|helsinki|here|hermes|"
    let v54 = "hiphop|hisamitsu|hitachi|hiv|hk|hkt|hm|hn|hockey|holdings|holiday|homedepot|homegoods|homes|"
    let v55 = v53 <> v54 
    let v56 = "|homesense|honda|horse|hospital|host|hosting|hot|hotels|hotmail|house|how|hr|hsbc|ht|hu|hughes|"
    let v57 = "hyatt|hyundai|ibm|icbc|ice|icu|id|ie|ieee|ifm|ikano|il|im|imamat|imdb|immo|immobilien|in|inc|"
    let v58 = v56 <> v57 
    let v59 = "|industries|infiniti|info|ing|ink|institute|insurance|insure|int|international|intuit|investments|"
    let v60 = "io|ipiranga|iq|ir|irish|is|ismaili|ist|istanbul|it|itau|itv|jaguar|java|jcb|je|jeep|jetzt|jewelry|"
    let v61 = v59 <> v60 
    let v62 = "|jio|jll|jm|jmp|jnj|jo|jobs|joburg|jot|joy|jp|jpmorgan|jprs|juegos|kaufen|kddi|ke|kerryhotels|"
    let v63 = "kerryproperties|kfh|kg|kh|ki|kia|kids|kim|kindle|kitchen|kiwi|km|kn|koeln|komatsu|kosher|kp|kpmg|"
    let v64 = v62 <> v63 
    let v65 = "|kpn|kr|krd|kred|kuokgroup|kw|ky|kyoto|kz|la|lacaixa|lamborghini|lamer|land|landrover|lanxess|"
    let v66 = "lasalle|lat|latino|latrobe|law|lawyer|lb|lc|lds|lease|leclerc|lefrak|legal|lego|lexus|lgbt|li|lidl|"
    let v67 = v65 <> v66 
    let v68 = "|life|lifeinsurance|lifestyle|lighting|like|lilly|limited|limo|lincoln|link|live|living|lk|llc|llp|"
    let v69 = "loan|loans|locker|locus|lol|london|lotte|lotto|love|lpl|lplfinancial|lr|ls|lt|ltd|ltda|lu|lundbeck|"
    let v70 = v68 <> v69 
    let v71 = "|luxe|luxury|lv|ly|ma|madrid|maif|maison|makeup|man|management|mango|map|market|marketing|markets|"
    let v72 = "marriott|marshalls|mattel|mba|mc|mckinsey|md|me|med|media|meet|melbourne|meme|memorial|men|menu|"
    let v73 = v71 <> v72 
    let v74 = "|merck|merckmsd|mg|mh|miami|microsoft|mil|mini|mint|mit|mitsubishi|mk|ml|mlb|mls|mm|mma|mn|mo|mobi|"
    let v75 = "mobile|moda|moe|moi|mom|monash|money|monster|mormon|mortgage|moscow|moto|motorcycles|mov|movie|mp|"
    let v76 = v74 <> v75 
    let v77 = "|mq|mr|ms|msd|mt|mtn|mtr|mu|museum|music|mv|mw|mx|my|mz|na|nab|nagoya|name|navy|nba|nc|ne|nec|net|"
    let v78 = "netbank|netflix|network|neustar|new|news|next|nextdirect|nexus|nf|nfl|ng|ngo|nhk|ni|nico|nike|"
    let v79 = v77 <> v78 
    let v80 = "|nikon|ninja|nissan|nissay|nl|no|nokia|norton|now|nowruz|nowtv|np|nr|nra|nrw|ntt|nu|nyc|nz|obi|"
    let v81 = "observer|office|okinawa|olayan|olayangroup|ollo|om|omega|one|ong|onl|online|ooo|open|oracle|orange|"
    let v82 = v80 <> v81 
    let v83 = "|org|organic|origins|osaka|otsuka|ott|ovh|pa|page|panasonic|paris|pars|partners|parts|party|pay|"
    let v84 = "pccw|pe|pet|pf|pfizer|pg|ph|pharmacy|phd|philips|phone|photo|photography|photos|physio|pics|pictet|"
    let v85 = v83 <> v84 
    let v86 = "|pictures|pid|pin|ping|pink|pioneer|pizza|pk|pl|place|play|playstation|plumbing|plus|pm|pn|pnc|pohl|"
    let v87 = "poker|politie|porn|post|pr|praxi|press|prime|pro|prod|productions|prof|progressive|promo|"
    let v88 = v86 <> v87 
    let v89 = "|properties|property|protection|pru|prudential|ps|pt|pub|pw|pwc|py|qa|qpon|quebec|quest|racing|"
    let v90 = "radio|re|read|realestate|realtor|realty|recipes|red|redumbrella|rehab|reise|reisen|reit|reliance|"
    let v91 = v89 <> v90 
    let v92 = "|ren|rent|rentals|repair|report|republican|rest|restaurant|review|reviews|rexroth|rich|richardli|"
    let v93 = "ricoh|ril|rio|rip|ro|rocks|rodeo|rogers|room|rs|rsvp|ru|rugby|ruhr|run|rw|rwe|ryukyu|sa|saarland|"
    let v94 = v92 <> v93 
    let v95 = "|safe|safety|sakura|sale|salon|samsclub|samsung|sandvik|sandvikcoromant|sanofi|sap|sarl|sas|save|"
    let v96 = "saxo|sb|sbi|sbs|sc|scb|schaeffler|schmidt|scholarships|school|schule|schwarz|science|scot|sd|se|"
    let v97 = v95 <> v96 
    let v98 = "|search|seat|secure|security|seek|select|sener|services|seven|sew|sex|sexy|sfr|sg|sh|shangrila|"
    let v99 = "sharp|shell|shia|shiksha|shoes|shop|shopping|shouji|show|si|silk|sina|singles|site|sj|sk|ski|skin|"
    let v100 = v98 <> v99 
    let v101 = "|sky|skype|sl|sling|sm|smart|smile|sn|sncf|so|soccer|social|softbank|software|sohu|solar|solutions|"
    let v102 = "song|sony|soy|spa|space|sport|spot|sr|srl|ss|st|stada|staples|star|statebank|statefarm|stc|"
    let v103 = v101 <> v102 
    let v104 = "|stcgroup|stockholm|storage|store|stream|studio|study|style|su|sucks|supplies|supply|support|surf|"
    let v105 = "surgery|suzuki|sv|swatch|swiss|sx|sy|sydney|systems|sz|tab|taipei|talk|taobao|target|tatamotors|"
    let v106 = v104 <> v105 
    let v107 = "|tatar|tattoo|tax|taxi|tc|tci|td|tdk|team|tech|technology|tel|temasek|tennis|teva|tf|tg|th|thd|"
    let v108 = "theater|theatre|tiaa|tickets|tienda|tips|tires|tirol|tj|tjmaxx|tjx|tk|tkmaxx|tl|tm|tmall|tn|to|"
    let v109 = v107 <> v108 
    let v110 = "|today|tokyo|tools|top|toray|toshiba|total|tours|town|toyota|toys|tr|trade|trading|training|travel|"
    let v111 = "travelers|travelersinsurance|trust|trv|tt|tube|tui|tunes|tushu|tv|tvs|tw|tz|ua|ubank|ubs|ug|uk|"
    let v112 = v110 <> v111 
    let v113 = "|unicom|university|uno|uol|ups|us|uy|uz|va|vacations|vana|vanguard|vc|ve|vegas|ventures|verisign|"
    let v114 = "versicherung|vet|vg|vi|viajes|video|vig|viking|villas|vin|vip|virgin|visa|vision|viva|vivo|"
    let v115 = v113 <> v114 
    let v116 = "|vlaanderen|vn|vodka|volvo|vote|voting|voto|voyage|vu|wales|walmart|walter|wang|wanggou|watch|"
    let v117 = "watches|weather|weatherchannel|web|webcam|weber|website|wed|wedding|weibo|weir|wf|whoswho|wien|"
    let v118 = v116 <> v117 
    let v119 = "|wiki|williamhill|win|windows|wine|winners|wme|woodside|work|works|world|wow|ws|wtc|wtf|xbox|xerox|"
    let v120 = "xihuan|xin|xxx|xyz|yachts|yahoo|yamaxun|yandex|ye|yodobashi|yoga|yokohama|you|youtube|yt|yun|za|"
    let v121 = v119 <> v120 
    let v122 = v7 |> string.contains(v4)
    case v122 {
        True -> True
        False -> {
            let v123 = v10 |> string.contains(v4)
            case v123 {
                True -> True
                False -> {
                    let v124 = v13 |> string.contains(v4)
                    case v124 {
                        True -> True
                        False -> {
                            let v125 = v16 |> string.contains(v4)
                            case v125 {
                                True -> True
                                False -> {
                                    let v126 = v19 |> string.contains(v4)
                                    case v126 {
                                        True -> True
                                        False -> {
                                            let v127 = v22 |> string.contains(v4)
                                            case v127 {
                                                True -> True
                                                False -> {
                                                    let v128 = v25 |> string.contains(v4)
                                                    case v128 {
                                                        True -> True
                                                        False -> {
                                                            let v129 = v28 |> string.contains(v4)
                                                            case v129 {
                                                                True -> True
                                                                False -> {
                                                                    let v130 = v31 |> string.contains(v4)
                                                                    case v130 {
                                                                        True -> True
                                                                        False -> {
                                                                            let v131 = v34 |> string.contains(v4)
                                                                            case v131 {
                                                                                True -> True
                                                                                False -> {
                                                                                    let v132 = v37 |> string.contains(v4)
                                                                                    case v132 {
                                                                                        True -> True
                                                                                        False -> {
                                                                                            let v133 = v40 |> string.contains(v4)
                                                                                            case v133 {
                                                                                                True -> True
                                                                                                False -> {
                                                                                                    let v134 = v43 |> string.contains(v4)
                                                                                                    case v134 {
                                                                                                        True -> True
                                                                                                        False -> {
                                                                                                            let v135 = v46 |> string.contains(v4)
                                                                                                            case v135 {
                                                                                                                True -> True
                                                                                                                False -> {
                                                                                                                    let v136 = v49 |> string.contains(v4)
                                                                                                                    case v136 {
                                                                                                                        True -> True
                                                                                                                        False -> {
                                                                                                                            let v137 = v52 |> string.contains(v4)
                                                                                                                            case v137 {
                                                                                                                                True -> True
                                                                                                                                False -> {
                                                                                                                                    let v138 = v55 |> string.contains(v4)
                                                                                                                                    case v138 {
                                                                                                                                        True -> True
                                                                                                                                        False -> {
                                                                                                                                            let v139 = v58 |> string.contains(v4)
                                                                                                                                            case v139 {
                                                                                                                                                True -> True
                                                                                                                                                False -> {
                                                                                                                                                    let v140 = v61 |> string.contains(v4)
                                                                                                                                                    case v140 {
                                                                                                                                                        True -> True
                                                                                                                                                        False -> {
                                                                                                                                                            let v141 = v64 |> string.contains(v4)
                                                                                                                                                            case v141 {
                                                                                                                                                                True -> True
                                                                                                                                                                False -> {
                                                                                                                                                                    let v142 = v67 |> string.contains(v4)
                                                                                                                                                                    case v142 {
                                                                                                                                                                        True -> True
                                                                                                                                                                        False -> {
                                                                                                                                                                            let v143 = v70 |> string.contains(v4)
                                                                                                                                                                            case v143 {
                                                                                                                                                                                True -> True
                                                                                                                                                                                False -> {
                                                                                                                                                                                    let v144 = v73 |> string.contains(v4)
                                                                                                                                                                                    case v144 {
                                                                                                                                                                                        True -> True
                                                                                                                                                                                        False -> {
                                                                                                                                                                                            let v145 = v76 |> string.contains(v4)
                                                                                                                                                                                            case v145 {
                                                                                                                                                                                                True -> True
                                                                                                                                                                                                False -> {
                                                                                                                                                                                                    let v146 = v79 |> string.contains(v4)
                                                                                                                                                                                                    case v146 {
                                                                                                                                                                                                        True -> True
                                                                                                                                                                                                        False -> {
                                                                                                                                                                                                            let v147 = v82 |> string.contains(v4)
                                                                                                                                                                                                            case v147 {
                                                                                                                                                                                                                True -> True
                                                                                                                                                                                                                False -> {
                                                                                                                                                                                                                    let v148 = v85 |> string.contains(v4)
                                                                                                                                                                                                                    case v148 {
                                                                                                                                                                                                                        True -> True
                                                                                                                                                                                                                        False -> {
                                                                                                                                                                                                                            let v149 = v88 |> string.contains(v4)
                                                                                                                                                                                                                            case v149 {
                                                                                                                                                                                                                                True -> True
                                                                                                                                                                                                                                False -> {
                                                                                                                                                                                                                                    let v150 = v91 |> string.contains(v4)
                                                                                                                                                                                                                                    case v150 {
                                                                                                                                                                                                                                        True -> True
                                                                                                                                                                                                                                        False -> {
                                                                                                                                                                                                                                            let v151 = v94 |> string.contains(v4)
                                                                                                                                                                                                                                            case v151 {
                                                                                                                                                                                                                                                True -> True
                                                                                                                                                                                                                                                False -> {
                                                                                                                                                                                                                                                    let v152 = v97 |> string.contains(v4)
                                                                                                                                                                                                                                                    case v152 {
                                                                                                                                                                                                                                                        True -> True
                                                                                                                                                                                                                                                        False -> {
                                                                                                                                                                                                                                                            let v153 = v100 |> string.contains(v4)
                                                                                                                                                                                                                                                            case v153 {
                                                                                                                                                                                                                                                                True -> True
                                                                                                                                                                                                                                                                False -> {
                                                                                                                                                                                                                                                                    let v154 = v103 |> string.contains(v4)
                                                                                                                                                                                                                                                                    case v154 {
                                                                                                                                                                                                                                                                        True -> True
                                                                                                                                                                                                                                                                        False -> {
                                                                                                                                                                                                                                                                            let v155 = v106 |> string.contains(v4)
                                                                                                                                                                                                                                                                            case v155 {
                                                                                                                                                                                                                                                                                True -> True
                                                                                                                                                                                                                                                                                False -> {
                                                                                                                                                                                                                                                                                    let v156 = v109 |> string.contains(v4)
                                                                                                                                                                                                                                                                                    case v156 {
                                                                                                                                                                                                                                                                                        True -> True
                                                                                                                                                                                                                                                                                        False -> {
                                                                                                                                                                                                                                                                                            let v157 = v112 |> string.contains(v4)
                                                                                                                                                                                                                                                                                            case v157 {
                                                                                                                                                                                                                                                                                                True -> True
                                                                                                                                                                                                                                                                                                False -> {
                                                                                                                                                                                                                                                                                                    let v158 = v115 |> string.contains(v4)
                                                                                                                                                                                                                                                                                                    case v158 {
                                                                                                                                                                                                                                                                                                        True -> True
                                                                                                                                                                                                                                                                                                        False -> {
                                                                                                                                                                                                                                                                                                            let v159 = v118 |> string.contains(v4)
                                                                                                                                                                                                                                                                                                            case v159 {
                                                                                                                                                                                                                                                                                                                True -> True
                                                                                                                                                                                                                                                                                                                False -> {
                                                                                                                                                                                                                                                                                                                    let v160 = v121 |> string.contains(v4)
                                                                                                                                                                                                                                                                                                                    case v160 {
                                                                                                                                                                                                                                                                                                                        True -> True
                                                                                                                                                                                                                                                                                                                        False -> {
                                                                                                                                                                                                                                                                                                                            let v161 = "|zappos|zara|zero|zip|zm|zone|zuerich|zw|"
                                                                                                                                                                                                                                                                                                                            let v162 = v161 |> string.contains(v4)
                                                                                                                                                                                                                                                                                                                            v162
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
        is_tld_310(v0)
    }
}

pub fn closure95(capt: Nil) -> fn(Int) -> Int {
    fn (v0) {
        let v1 = spiral_wrap_signed(v0, 32)
        v1
    }
}

pub fn ascii_of_316(v0: String) -> Int {
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
                    let v7 = v6 |> option.unwrap(0)
                    v7
                }
                False -> 256
            }
        }
    }
}

pub fn ascii_letter_315(v0: String) -> Bool {
    let v1 = ascii_of_316(v0)
    let v2 = v1 >= 65
    let v4 =
        case v2 {
            True -> {
                let v3 = v1 <= 90
                v3
            }
            False -> False
        }
    case v4 {
        True -> True
        False -> {
            let v5 = v1 >= 97
            case v5 {
                True -> {
                    let v6 = v1 <= 122
                    v6
                }
                False -> False
            }
        }
    }
}

pub fn label_glyph_314(v0: String) -> Bool {
    let v1 = ascii_letter_315(v0)
    let v6 =
        case v1 {
            True -> True
            False -> {
                let v2 = ascii_of_316(v0)
                let v3 = v2 >= 48
                case v3 {
                    True -> {
                        let v4 = v2 <= 57
                        v4
                    }
                    False -> False
                }
            }
        }
    let v8 =
        case v6 {
            True -> True
            False -> {
                let v7 = v0 == "_"
                v7
            }
        }
    case v8 {
        True -> True
        False -> {
            let v9 = v0 == "-"
            v9
        }
    }
}

pub fn run_glyph_313(v0: String) -> Bool {
    let v1 = label_glyph_314(v0)
    case v1 {
        True -> True
        False -> {
            let v2 = v0 == "."
            v2
        }
    }
}

pub fn run_of_318(v0: Uh3, v1: Uh3) -> #(Uh3, Uh3) {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = run_glyph_313(v2)
            case v4 {
                True -> {
                    let v5 = Uh3Cons(v2, v1)
                    run_of_318(v3, v5)
                }
                False -> {
                    let v8 = Uh3Nil
                    let v9 = method4(v1, v8)
                    #(v9, v0)
                }
            }
        }
        _ -> {
            let v12 = Uh3Nil
            let v13 = method4(v1, v12)
            #(v13, v0)
        }
    }
}

pub fn method320(v0: Uh3, v1: String) -> String {
    case v0  {
        Uh3Cons(v2, v3) -> method320(v3, v2)
        Uh3Nil -> v1
    }
}

pub fn last_or_319(v0: String, v1: Uh3) -> String {
    method320(v1, v0)
}

pub fn run_piece_317(v0: String, v1: Uh3) -> #(String, Uh3, String, Uh3) {
    let v2 = Uh3Nil
    let #(v3, v4) = run_of_318(v1, v2)
    let v5 = last_or_319(v0, v3)
    #(v5, v4, v0, v3)
}

pub fn method321(v0: Uh30, v1: Uh30) -> Uh30 {
    case v0  {
        Uh30Cons(v2, v3, v4) -> {
            let v5 = Uh30Cons(v2, v3, v1)
            method321(v4, v5)
        }
        Uh30Nil -> v1
    }
}

pub fn pieces_from_312(v0: String, v1: Uh3, v2: Uh30) -> Uh30 {
    case v1  {
        Uh3Cons(v3, v4) -> {
            let v5 = run_glyph_313(v3)
            case v5 {
                True -> {
                    let #(v6, v7, v8, v9) = run_piece_317(v0, v1)
                    let v10 = Uh30Cons(v8, v9, v2)
                    pieces_from_312(v6, v7, v10)
                }
                False -> {
                    let v12 = Uh3Nil
                    let v13 = Uh3Cons(v3, v12)
                    let v14 = Uh30Cons(v0, v13, v2)
                    pieces_from_312(v3, v4, v14)
                }
            }
        }
        Uh3Nil -> {
            let v17 = Uh30Nil
            method321(v2, v17)
        }
    }
}

pub fn blocks_domain_324(v0: String) -> Bool {
    let v1 = v0 == "@"
    let v3 =
        case v1 {
            True -> True
            False -> {
                let v2 = v0 == "/"
                v2
            }
        }
    case v3 {
        True -> True
        False -> {
            let v4 = ascii_of_316(v0)
            let v5 = v4 > 127
            v5
        }
    }
}

pub fn after_label_327(v0: Uh3) -> Bool {
    case v0  {
        Uh3Cons(v1, v2) -> label_glyph_314(v1)
        Uh3Nil -> False
    }
}

pub fn letters_after_329(v0: Uh3, v1: Uh3) -> #(String, Bool) {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = ascii_letter_315(v2)
            case v4 {
                True -> {
                    let v5 = Uh3Cons(v2, v1)
                    letters_after_329(v3, v5)
                }
                False -> {
                    let v8 = Uh3Nil
                    let v9 = method4(v1, v8)
                    let v10 = ""
                    let v11 = concat_balanced_22(v10, v9)
                    let v12 = v2 == "."
                    #(v11, v12)
                }
            }
        }
        Uh3Nil -> {
            let v15 = Uh3Nil
            let v16 = method4(v1, v15)
            let v17 = ""
            let v18 = concat_balanced_22(v17, v16)
            #(v18, True)
        }
    }
}

pub fn label_before_330(v0: Uh3, v1: Uh3) -> String {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = label_glyph_314(v2)
            case v4 {
                True -> {
                    let v5 = Uh3Cons(v2, v1)
                    label_before_330(v3, v5)
                }
                False -> {
                    let v7 = ""
                    concat_balanced_22(v7, v1)
                }
            }
        }
        _ -> {
            let v10 = ""
            concat_balanced_22(v10, v1)
        }
    }
}

pub fn tld_ok_331(v0: fn(String) -> Bool, v1: String, v2: String) -> Bool {
    let v3 = spiral_string_length(v2)
    let v4 = v3 >= 2
    let v6 =
        case v4 {
            True -> {
                let v5 = v3 <= 63
                v5
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
                    let v11 = v10 > 2
                    v11
                }
            }
        }
        False -> False
    }
}

pub fn linked_dot_328(v0: fn(String) -> Bool, v1: Uh3, v2: Uh3) -> Bool {
    let v3 = Uh3Nil
    let #(v4, v5) = letters_after_329(v2, v3)
    let v6 = Uh3Nil
    let v7 = label_before_330(v1, v6)
    case v5 {
        True -> {
            let v8 = tld_ok_331(v0, v7, v4)
            case v8 {
                True -> True
                False -> {
                    let v9 = v7 == "t"
                    case v9 {
                        True -> {
                            let v10 = v4 == "co"
                            v10
                        }
                        False -> False
                    }
                }
            }
        }
        False -> False
    }
}

pub fn defusable_326(v0: fn(String) -> Bool, v1: Uh3, v2: String, v3: Uh3) -> Bool {
    let v4 = v2 == "."
    let v6 =
        case v4 {
            True -> after_label_327(v1)
            False -> False
        }
    case v6 {
        True -> linked_dot_328(v0, v1, v3)
        False -> False
    }
}

pub fn defused_run_325(v0: fn(String) -> Bool, v1: Uh3, v2: Uh3, v3: Uh3) -> Uh3 {
    case v2  {
        Uh3Cons(v4, v5) -> {
            let v6 = Uh3Cons(v4, v1)
            let v7 = defusable_326(v0, v1, v4, v5)
            let v10 =
                case v7 {
                    True -> {
                        let v8 = unicode_erlang_characters_to_binary([8203])
                        Uh3Cons(v8, v3)
                    }
                    False -> v3
                }
            let v11 = Uh3Cons(v4, v10)
            defused_run_325(v0, v6, v5, v11)
        }
        Uh3Nil -> {
            let v13 = Uh3Nil
            method4(v3, v13)
        }
    }
}

pub fn run_text_323(v0: fn(String) -> Bool, v1: String, v2: Uh3) -> Uh3 {
    let v3 = blocks_domain_324(v1)
    case v3 {
        True -> v2
        False -> {
            let v4 = Uh3Nil
            let v5 = Uh3Nil
            defused_run_325(v0, v4, v2, v5)
        }
    }
}

pub fn method322(v0: fn(String) -> Bool, v1: Uh30, v2: Uh3) -> Uh3 {
    case v1  {
        Uh30Cons(v3, v4, v5) -> {
            let v6 = method322(v0, v5, v2)
            let v7 = run_text_323(v0, v3, v4)
            method18(v7, v6)
        }
        Uh30Nil -> v2
    }
}

pub fn defused_dots_by_311(v0: fn(String) -> Bool, v1: String) -> String {
    let v2 = ""
    let v3 = string.to_graphemes(v1)
    let v4 = v3 |> list.reverse
    let v5 = Uh3Nil
    let listm_fold = v4 |> list.fold (v5, fn (acc, x) {
    let v6 = x
    let v7 = acc
    let v8 = Uh3Cons(v6, v7)
    v8
    })
    let v9 = listm_fold
    let v10 = Uh30Nil
    let v11 = pieces_from_312(v2, v9, v10)
    let v12 = Uh3Nil
    let v13 = method322(v0, v11, v12)
    concat_balanced_22(v2, v13)
}

pub fn word_glyph_337(v0: String) -> Bool {
    let v1 = label_glyph_314(v0)
    case v1 {
        True -> {
            let v2 = v0 != "-"
            v2
        }
        False -> False
    }
}

pub fn word_length_336(v0: Uh3, v1: Int) -> #(Int, Uh3) {
    case v0  {
        Uh3Cons(v2, v3) -> {
            let v4 = word_glyph_337(v2)
            case v4 {
                True -> {
                    let v5 = spiral_wrap_signed(v1 + 1, 32)
                    word_length_336(v3, v5)
                }
                False -> #(v1, v0)
            }
        }
        _ -> #(v1, v0)
    }
}

pub fn mention_quiet_338(v0: String) -> Bool {
    let v1 = word_glyph_337(v0)
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
                                    let v5 = "!#$%&*@"
                                    let v6 = option.from_result(result.map(string.split_once(v5, v0), pair.first))
                                    let v7 = closure1(Nil)
                                    let v8 = v6 |> option.map(v7)
                                    let v9 = Us2None
                                    let v10 = v8 |> option.unwrap(v9)
                                    case v10  {
                                        Us2None -> -1
                                        Us2Some(v11) -> {
                                            let v12 = bit_array.byte_size(bit_array.from_string(v11))
                                            v12
                                        }
                                    }
                                }
                            }
                        let v16 = v15 >= 0
                        v16
                    }
                    False -> False
                }
            }
        }
    let v20 =
        case v18 {
            True -> True
            False -> {
                let v19 = v0 == "＠"
                v19
            }
        }
    let v21 = v20 == False
    v21
}

pub fn rt_letters_340(v0: String, v1: String) -> Bool {
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
                            let v5 = "tT"
                            let v6 = option.from_result(result.map(string.split_once(v5, v0), pair.first))
                            let v7 = closure1(Nil)
                            let v8 = v6 |> option.map(v7)
                            let v9 = Us2None
                            let v10 = v8 |> option.unwrap(v9)
                            case v10  {
                                Us2None -> -1
                                Us2Some(v11) -> {
                                    let v12 = bit_array.byte_size(bit_array.from_string(v11))
                                    v12
                                }
                            }
                        }
                    }
                let v16 = v15 >= 0
                v16
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
                                let v21 = "rR"
                                let v22 = option.from_result(result.map(string.split_once(v21, v1), pair.first))
                                let v23 = closure1(Nil)
                                let v24 = v22 |> option.map(v23)
                                let v25 = Us2None
                                let v26 = v24 |> option.unwrap(v25)
                                case v26  {
                                    Us2None -> -1
                                    Us2Some(v27) -> {
                                        let v28 = bit_array.byte_size(bit_array.from_string(v27))
                                        v28
                                    }
                                }
                            }
                        }
                    let v32 = v31 >= 0
                    v32
                }
                False -> False
            }
        }
        False -> False
    }
}

pub fn closure96(capt: Nil) -> fn(String) -> Bool {
    fn (v0) {
        let v1 = label_glyph_314(v0)
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
                                    let v5 = "+~."
                                    let v6 = option.from_result(result.map(string.split_once(v5, v0), pair.first))
                                    let v7 = closure1(Nil)
                                    let v8 = v6 |> option.map(v7)
                                    let v9 = Us2None
                                    let v10 = v8 |> option.unwrap(v9)
                                    case v10  {
                                        Us2None -> -1
                                        Us2Some(v11) -> {
                                            let v12 = bit_array.byte_size(bit_array.from_string(v11))
                                            v12
                                        }
                                    }
                                }
                            }
                        let v16 = v15 >= 0
                        v16
                    }
                    False -> False
                }
            }
        }
    }
}
