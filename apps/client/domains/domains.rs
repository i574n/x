#![allow(unused_mut, unused_variables, unused_imports, unused_parens, unused_braces, unused_assignments, dead_code, non_snake_case, non_camel_case_types, unreachable_code, while_true)]
use std::cell::RefCell;
use std::rc::Rc;
fn is_tld_1(mut v0: Rc<str>) -> bool {
    let v1: Rc<str> = Rc::<str>::from(v0.to_lowercase());
    let v2: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|"); } LIT.with(|lit| lit.clone()) };
    let v4: Rc<str> = Rc::<str>::from(format!("{}{}", Rc::<str>::from(format!("{}{}", v2, v1)), v2));
    let v5: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|aaa|aarp|abb|abbott|abbvie|abc|able|abogado|abudhabi|ac|academy|accenture|accountant|accountants|"); } LIT.with(|lit| lit.clone()) };
    let v6: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("aco|actor|ad|ads|adult|ae|aeg|aero|aetna|af|afl|africa|ag|agakhan|agency|ai|aig|airbus|airforce|"); } LIT.with(|lit| lit.clone()) };
    let v7: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|aaa|aarp|abb|abbott|abbvie|abc|able|abogado|abudhabi|ac|academy|accenture|accountant|accountants|aco|actor|ad|ads|adult|ae|aeg|aero|aetna|af|afl|africa|ag|agakhan|agency|ai|aig|airbus|airforce|"); } LIT.with(|lit| lit.clone()) };
    let v8: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|airtel|akdn|al|alibaba|alipay|allfinanz|allstate|ally|alsace|alstom|am|amazon|americanexpress|"); } LIT.with(|lit| lit.clone()) };
    let v9: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("americanfamily|amex|amfam|amica|amsterdam|analytics|android|anquan|anz|ao|aol|apartments|app|apple|"); } LIT.with(|lit| lit.clone()) };
    let v10: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|airtel|akdn|al|alibaba|alipay|allfinanz|allstate|ally|alsace|alstom|am|amazon|americanexpress|americanfamily|amex|amfam|amica|amsterdam|analytics|android|anquan|anz|ao|aol|apartments|app|apple|"); } LIT.with(|lit| lit.clone()) };
    let v11: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|aq|aquarelle|ar|arab|aramco|archi|army|arpa|art|arte|as|asda|asia|associates|at|athleta|attorney|"); } LIT.with(|lit| lit.clone()) };
    let v12: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("au|auction|audi|audible|audio|auspost|author|auto|autos|aw|aws|ax|axa|az|azure|ba|baby|baidu|"); } LIT.with(|lit| lit.clone()) };
    let v13: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|aq|aquarelle|ar|arab|aramco|archi|army|arpa|art|arte|as|asda|asia|associates|at|athleta|attorney|au|auction|audi|audible|audio|auspost|author|auto|autos|aw|aws|ax|axa|az|azure|ba|baby|baidu|"); } LIT.with(|lit| lit.clone()) };
    let v14: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|banamex|band|bank|bar|barcelona|barclaycard|barclays|barefoot|bargains|baseball|basketball|bauhaus|"); } LIT.with(|lit| lit.clone()) };
    let v15: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("bayern|bb|bbc|bbt|bbva|bcg|bcn|bd|be|beats|beauty|beer|berlin|best|bestbuy|bet|bf|bg|bh|bharti|bi|"); } LIT.with(|lit| lit.clone()) };
    let v16: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|banamex|band|bank|bar|barcelona|barclaycard|barclays|barefoot|bargains|baseball|basketball|bauhaus|bayern|bb|bbc|bbt|bbva|bcg|bcn|bd|be|beats|beauty|beer|berlin|best|bestbuy|bet|bf|bg|bh|bharti|bi|"); } LIT.with(|lit| lit.clone()) };
    let v17: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|bible|bid|bike|bing|bingo|bio|biz|bj|black|blackfriday|blockbuster|blog|bloomberg|blue|bm|bms|bmw|"); } LIT.with(|lit| lit.clone()) };
    let v18: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("bn|bnpparibas|bo|boats|boehringer|bofa|bom|bond|boo|book|booking|bosch|bostik|boston|bot|boutique|"); } LIT.with(|lit| lit.clone()) };
    let v19: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|bible|bid|bike|bing|bingo|bio|biz|bj|black|blackfriday|blockbuster|blog|bloomberg|blue|bm|bms|bmw|bn|bnpparibas|bo|boats|boehringer|bofa|bom|bond|boo|book|booking|bosch|bostik|boston|bot|boutique|"); } LIT.with(|lit| lit.clone()) };
    let v20: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|box|br|bradesco|bridgestone|broadway|broker|brother|brussels|bs|bt|build|builders|business|buy|"); } LIT.with(|lit| lit.clone()) };
    let v21: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("buzz|bv|bw|by|bz|bzh|ca|cab|cafe|cal|call|calvinklein|cam|camera|camp|canon|capetown|capital|"); } LIT.with(|lit| lit.clone()) };
    let v22: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|box|br|bradesco|bridgestone|broadway|broker|brother|brussels|bs|bt|build|builders|business|buy|buzz|bv|bw|by|bz|bzh|ca|cab|cafe|cal|call|calvinklein|cam|camera|camp|canon|capetown|capital|"); } LIT.with(|lit| lit.clone()) };
    let v23: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|capitalone|car|caravan|cards|care|career|careers|cars|casa|case|cash|casino|cat|catering|catholic|"); } LIT.with(|lit| lit.clone()) };
    let v24: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cba|cbn|cbre|cc|cd|center|ceo|cern|cf|cfa|cfd|cg|ch|chanel|channel|charity|chase|chat|cheap|"); } LIT.with(|lit| lit.clone()) };
    let v25: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|capitalone|car|caravan|cards|care|career|careers|cars|casa|case|cash|casino|cat|catering|catholic|cba|cbn|cbre|cc|cd|center|ceo|cern|cf|cfa|cfd|cg|ch|chanel|channel|charity|chase|chat|cheap|"); } LIT.with(|lit| lit.clone()) };
    let v26: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|chintai|christmas|chrome|church|ci|cipriani|circle|cisco|citadel|citi|citic|city|ck|cl|claims|"); } LIT.with(|lit| lit.clone()) };
    let v27: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("cleaning|click|clinic|clinique|clothing|cloud|club|clubmed|cm|cn|co|coach|codes|coffee|college|"); } LIT.with(|lit| lit.clone()) };
    let v28: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|chintai|christmas|chrome|church|ci|cipriani|circle|cisco|citadel|citi|citic|city|ck|cl|claims|cleaning|click|clinic|clinique|clothing|cloud|club|clubmed|cm|cn|co|coach|codes|coffee|college|"); } LIT.with(|lit| lit.clone()) };
    let v29: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|cologne|com|commbank|community|company|compare|computer|comsec|condos|construction|consulting|"); } LIT.with(|lit| lit.clone()) };
    let v30: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("contact|contractors|cooking|cool|coop|corsica|country|coupon|coupons|courses|cpa|cr|credit|"); } LIT.with(|lit| lit.clone()) };
    let v31: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|cologne|com|commbank|community|company|compare|computer|comsec|condos|construction|consulting|contact|contractors|cooking|cool|coop|corsica|country|coupon|coupons|courses|cpa|cr|credit|"); } LIT.with(|lit| lit.clone()) };
    let v32: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|creditcard|creditunion|cricket|crown|crs|cruise|cruises|cu|cuisinella|cv|cw|cx|cy|cymru|cyou|cz|"); } LIT.with(|lit| lit.clone()) };
    let v33: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("dad|dance|data|date|dating|datsun|day|dclk|dds|de|deal|dealer|deals|degree|delivery|dell|deloitte|"); } LIT.with(|lit| lit.clone()) };
    let v34: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|creditcard|creditunion|cricket|crown|crs|cruise|cruises|cu|cuisinella|cv|cw|cx|cy|cymru|cyou|cz|dad|dance|data|date|dating|datsun|day|dclk|dds|de|deal|dealer|deals|degree|delivery|dell|deloitte|"); } LIT.with(|lit| lit.clone()) };
    let v35: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|delta|democrat|dental|dentist|desi|design|dev|dhl|diamonds|diet|digital|direct|directory|discount|"); } LIT.with(|lit| lit.clone()) };
    let v36: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("discover|dish|diy|dj|dk|dm|dnp|do|docs|doctor|dog|domains|dot|download|drive|dtv|dubai|dupont|"); } LIT.with(|lit| lit.clone()) };
    let v37: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|delta|democrat|dental|dentist|desi|design|dev|dhl|diamonds|diet|digital|direct|directory|discount|discover|dish|diy|dj|dk|dm|dnp|do|docs|doctor|dog|domains|dot|download|drive|dtv|dubai|dupont|"); } LIT.with(|lit| lit.clone()) };
    let v38: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|durban|dvag|dvr|dz|earth|eat|ec|eco|edeka|edu|education|ee|eg|email|emerck|energy|engineer|"); } LIT.with(|lit| lit.clone()) };
    let v39: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("engineering|enterprises|epson|equipment|er|ericsson|erni|es|esq|estate|et|eu|eurovision|eus|events|"); } LIT.with(|lit| lit.clone()) };
    let v40: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|durban|dvag|dvr|dz|earth|eat|ec|eco|edeka|edu|education|ee|eg|email|emerck|energy|engineer|engineering|enterprises|epson|equipment|er|ericsson|erni|es|esq|estate|et|eu|eurovision|eus|events|"); } LIT.with(|lit| lit.clone()) };
    let v41: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|exchange|expert|exposed|express|extraspace|fage|fail|fairwinds|faith|family|fan|fans|farm|farmers|"); } LIT.with(|lit| lit.clone()) };
    let v42: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("fashion|fast|fedex|feedback|ferrari|ferrero|fi|fidelity|fido|film|final|finance|financial|fire|"); } LIT.with(|lit| lit.clone()) };
    let v43: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|exchange|expert|exposed|express|extraspace|fage|fail|fairwinds|faith|family|fan|fans|farm|farmers|fashion|fast|fedex|feedback|ferrari|ferrero|fi|fidelity|fido|film|final|finance|financial|fire|"); } LIT.with(|lit| lit.clone()) };
    let v44: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|firestone|firmdale|fish|fishing|fit|fitness|fj|fk|flickr|flights|flir|florist|flowers|fly|fm|fo|"); } LIT.with(|lit| lit.clone()) };
    let v45: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("foo|food|football|ford|forex|forsale|forum|foundation|fox|fr|free|fresenius|frl|frogans|frontier|"); } LIT.with(|lit| lit.clone()) };
    let v46: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|firestone|firmdale|fish|fishing|fit|fitness|fj|fk|flickr|flights|flir|florist|flowers|fly|fm|fo|foo|food|football|ford|forex|forsale|forum|foundation|fox|fr|free|fresenius|frl|frogans|frontier|"); } LIT.with(|lit| lit.clone()) };
    let v47: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|ftr|fujitsu|fun|fund|furniture|futbol|fyi|ga|gal|gallery|gallo|gallup|game|games|gap|garden|gay|gb|"); } LIT.with(|lit| lit.clone()) };
    let v48: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("gbiz|gd|gdn|ge|gea|gent|genting|george|gf|gg|ggee|gh|gi|gift|gifts|gives|giving|gl|glass|gle|"); } LIT.with(|lit| lit.clone()) };
    let v49: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|ftr|fujitsu|fun|fund|furniture|futbol|fyi|ga|gal|gallery|gallo|gallup|game|games|gap|garden|gay|gb|gbiz|gd|gdn|ge|gea|gent|genting|george|gf|gg|ggee|gh|gi|gift|gifts|gives|giving|gl|glass|gle|"); } LIT.with(|lit| lit.clone()) };
    let v50: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|global|globo|gm|gmail|gmbh|gmo|gmx|gn|godaddy|gold|goldpoint|golf|goodyear|goog|google|gop|got|gov|"); } LIT.with(|lit| lit.clone()) };
    let v51: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("gp|gq|gr|grainger|graphics|gratis|green|gripe|grocery|group|gs|gt|gu|gucci|guge|guide|guitars|guru|"); } LIT.with(|lit| lit.clone()) };
    let v52: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|global|globo|gm|gmail|gmbh|gmo|gmx|gn|godaddy|gold|goldpoint|golf|goodyear|goog|google|gop|got|gov|gp|gq|gr|grainger|graphics|gratis|green|gripe|grocery|group|gs|gt|gu|gucci|guge|guide|guitars|guru|"); } LIT.with(|lit| lit.clone()) };
    let v53: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|gw|gy|hair|hamburg|hangout|haus|hbo|hdfc|hdfcbank|health|healthcare|help|helsinki|here|hermes|"); } LIT.with(|lit| lit.clone()) };
    let v54: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("hiphop|hisamitsu|hitachi|hiv|hk|hkt|hm|hn|hockey|holdings|holiday|homedepot|homegoods|homes|"); } LIT.with(|lit| lit.clone()) };
    let v55: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|gw|gy|hair|hamburg|hangout|haus|hbo|hdfc|hdfcbank|health|healthcare|help|helsinki|here|hermes|hiphop|hisamitsu|hitachi|hiv|hk|hkt|hm|hn|hockey|holdings|holiday|homedepot|homegoods|homes|"); } LIT.with(|lit| lit.clone()) };
    let v56: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|homesense|honda|horse|hospital|host|hosting|hot|hotels|hotmail|house|how|hr|hsbc|ht|hu|hughes|"); } LIT.with(|lit| lit.clone()) };
    let v57: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("hyatt|hyundai|ibm|icbc|ice|icu|id|ie|ieee|ifm|ikano|il|im|imamat|imdb|immo|immobilien|in|inc|"); } LIT.with(|lit| lit.clone()) };
    let v58: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|homesense|honda|horse|hospital|host|hosting|hot|hotels|hotmail|house|how|hr|hsbc|ht|hu|hughes|hyatt|hyundai|ibm|icbc|ice|icu|id|ie|ieee|ifm|ikano|il|im|imamat|imdb|immo|immobilien|in|inc|"); } LIT.with(|lit| lit.clone()) };
    let v59: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|industries|infiniti|info|ing|ink|institute|insurance|insure|int|international|intuit|investments|"); } LIT.with(|lit| lit.clone()) };
    let v60: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("io|ipiranga|iq|ir|irish|is|ismaili|ist|istanbul|it|itau|itv|jaguar|java|jcb|je|jeep|jetzt|jewelry|"); } LIT.with(|lit| lit.clone()) };
    let v61: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|industries|infiniti|info|ing|ink|institute|insurance|insure|int|international|intuit|investments|io|ipiranga|iq|ir|irish|is|ismaili|ist|istanbul|it|itau|itv|jaguar|java|jcb|je|jeep|jetzt|jewelry|"); } LIT.with(|lit| lit.clone()) };
    let v62: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|jio|jll|jm|jmp|jnj|jo|jobs|joburg|jot|joy|jp|jpmorgan|jprs|juegos|kaufen|kddi|ke|kerryhotels|"); } LIT.with(|lit| lit.clone()) };
    let v63: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("kerryproperties|kfh|kg|kh|ki|kia|kids|kim|kindle|kitchen|kiwi|km|kn|koeln|komatsu|kosher|kp|kpmg|"); } LIT.with(|lit| lit.clone()) };
    let v64: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|jio|jll|jm|jmp|jnj|jo|jobs|joburg|jot|joy|jp|jpmorgan|jprs|juegos|kaufen|kddi|ke|kerryhotels|kerryproperties|kfh|kg|kh|ki|kia|kids|kim|kindle|kitchen|kiwi|km|kn|koeln|komatsu|kosher|kp|kpmg|"); } LIT.with(|lit| lit.clone()) };
    let v65: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|kpn|kr|krd|kred|kuokgroup|kw|ky|kyoto|kz|la|lacaixa|lamborghini|lamer|land|landrover|lanxess|"); } LIT.with(|lit| lit.clone()) };
    let v66: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("lasalle|lat|latino|latrobe|law|lawyer|lb|lc|lds|lease|leclerc|lefrak|legal|lego|lexus|lgbt|li|lidl|"); } LIT.with(|lit| lit.clone()) };
    let v67: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|kpn|kr|krd|kred|kuokgroup|kw|ky|kyoto|kz|la|lacaixa|lamborghini|lamer|land|landrover|lanxess|lasalle|lat|latino|latrobe|law|lawyer|lb|lc|lds|lease|leclerc|lefrak|legal|lego|lexus|lgbt|li|lidl|"); } LIT.with(|lit| lit.clone()) };
    let v68: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|life|lifeinsurance|lifestyle|lighting|like|lilly|limited|limo|lincoln|link|live|living|lk|llc|llp|"); } LIT.with(|lit| lit.clone()) };
    let v69: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("loan|loans|locker|locus|lol|london|lotte|lotto|love|lpl|lplfinancial|lr|ls|lt|ltd|ltda|lu|lundbeck|"); } LIT.with(|lit| lit.clone()) };
    let v70: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|life|lifeinsurance|lifestyle|lighting|like|lilly|limited|limo|lincoln|link|live|living|lk|llc|llp|loan|loans|locker|locus|lol|london|lotte|lotto|love|lpl|lplfinancial|lr|ls|lt|ltd|ltda|lu|lundbeck|"); } LIT.with(|lit| lit.clone()) };
    let v71: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|luxe|luxury|lv|ly|ma|madrid|maif|maison|makeup|man|management|mango|map|market|marketing|markets|"); } LIT.with(|lit| lit.clone()) };
    let v72: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("marriott|marshalls|mattel|mba|mc|mckinsey|md|me|med|media|meet|melbourne|meme|memorial|men|menu|"); } LIT.with(|lit| lit.clone()) };
    let v73: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|luxe|luxury|lv|ly|ma|madrid|maif|maison|makeup|man|management|mango|map|market|marketing|markets|marriott|marshalls|mattel|mba|mc|mckinsey|md|me|med|media|meet|melbourne|meme|memorial|men|menu|"); } LIT.with(|lit| lit.clone()) };
    let v74: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|merck|merckmsd|mg|mh|miami|microsoft|mil|mini|mint|mit|mitsubishi|mk|ml|mlb|mls|mm|mma|mn|mo|mobi|"); } LIT.with(|lit| lit.clone()) };
    let v75: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("mobile|moda|moe|moi|mom|monash|money|monster|mormon|mortgage|moscow|moto|motorcycles|mov|movie|mp|"); } LIT.with(|lit| lit.clone()) };
    let v76: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|merck|merckmsd|mg|mh|miami|microsoft|mil|mini|mint|mit|mitsubishi|mk|ml|mlb|mls|mm|mma|mn|mo|mobi|mobile|moda|moe|moi|mom|monash|money|monster|mormon|mortgage|moscow|moto|motorcycles|mov|movie|mp|"); } LIT.with(|lit| lit.clone()) };
    let v77: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|mq|mr|ms|msd|mt|mtn|mtr|mu|museum|music|mv|mw|mx|my|mz|na|nab|nagoya|name|navy|nba|nc|ne|nec|net|"); } LIT.with(|lit| lit.clone()) };
    let v78: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("netbank|netflix|network|neustar|new|news|next|nextdirect|nexus|nf|nfl|ng|ngo|nhk|ni|nico|nike|"); } LIT.with(|lit| lit.clone()) };
    let v79: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|mq|mr|ms|msd|mt|mtn|mtr|mu|museum|music|mv|mw|mx|my|mz|na|nab|nagoya|name|navy|nba|nc|ne|nec|net|netbank|netflix|network|neustar|new|news|next|nextdirect|nexus|nf|nfl|ng|ngo|nhk|ni|nico|nike|"); } LIT.with(|lit| lit.clone()) };
    let v80: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|nikon|ninja|nissan|nissay|nl|no|nokia|norton|now|nowruz|nowtv|np|nr|nra|nrw|ntt|nu|nyc|nz|obi|"); } LIT.with(|lit| lit.clone()) };
    let v81: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("observer|office|okinawa|olayan|olayangroup|ollo|om|omega|one|ong|onl|online|ooo|open|oracle|orange|"); } LIT.with(|lit| lit.clone()) };
    let v82: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|nikon|ninja|nissan|nissay|nl|no|nokia|norton|now|nowruz|nowtv|np|nr|nra|nrw|ntt|nu|nyc|nz|obi|observer|office|okinawa|olayan|olayangroup|ollo|om|omega|one|ong|onl|online|ooo|open|oracle|orange|"); } LIT.with(|lit| lit.clone()) };
    let v83: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|org|organic|origins|osaka|otsuka|ott|ovh|pa|page|panasonic|paris|pars|partners|parts|party|pay|"); } LIT.with(|lit| lit.clone()) };
    let v84: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("pccw|pe|pet|pf|pfizer|pg|ph|pharmacy|phd|philips|phone|photo|photography|photos|physio|pics|pictet|"); } LIT.with(|lit| lit.clone()) };
    let v85: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|org|organic|origins|osaka|otsuka|ott|ovh|pa|page|panasonic|paris|pars|partners|parts|party|pay|pccw|pe|pet|pf|pfizer|pg|ph|pharmacy|phd|philips|phone|photo|photography|photos|physio|pics|pictet|"); } LIT.with(|lit| lit.clone()) };
    let v86: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|pictures|pid|pin|ping|pink|pioneer|pizza|pk|pl|place|play|playstation|plumbing|plus|pm|pn|pnc|pohl|"); } LIT.with(|lit| lit.clone()) };
    let v87: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("poker|politie|porn|post|pr|praxi|press|prime|pro|prod|productions|prof|progressive|promo|"); } LIT.with(|lit| lit.clone()) };
    let v88: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|pictures|pid|pin|ping|pink|pioneer|pizza|pk|pl|place|play|playstation|plumbing|plus|pm|pn|pnc|pohl|poker|politie|porn|post|pr|praxi|press|prime|pro|prod|productions|prof|progressive|promo|"); } LIT.with(|lit| lit.clone()) };
    let v89: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|properties|property|protection|pru|prudential|ps|pt|pub|pw|pwc|py|qa|qpon|quebec|quest|racing|"); } LIT.with(|lit| lit.clone()) };
    let v90: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("radio|re|read|realestate|realtor|realty|recipes|red|redumbrella|rehab|reise|reisen|reit|reliance|"); } LIT.with(|lit| lit.clone()) };
    let v91: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|properties|property|protection|pru|prudential|ps|pt|pub|pw|pwc|py|qa|qpon|quebec|quest|racing|radio|re|read|realestate|realtor|realty|recipes|red|redumbrella|rehab|reise|reisen|reit|reliance|"); } LIT.with(|lit| lit.clone()) };
    let v92: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|ren|rent|rentals|repair|report|republican|rest|restaurant|review|reviews|rexroth|rich|richardli|"); } LIT.with(|lit| lit.clone()) };
    let v93: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("ricoh|ril|rio|rip|ro|rocks|rodeo|rogers|room|rs|rsvp|ru|rugby|ruhr|run|rw|rwe|ryukyu|sa|saarland|"); } LIT.with(|lit| lit.clone()) };
    let v94: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|ren|rent|rentals|repair|report|republican|rest|restaurant|review|reviews|rexroth|rich|richardli|ricoh|ril|rio|rip|ro|rocks|rodeo|rogers|room|rs|rsvp|ru|rugby|ruhr|run|rw|rwe|ryukyu|sa|saarland|"); } LIT.with(|lit| lit.clone()) };
    let v95: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|safe|safety|sakura|sale|salon|samsclub|samsung|sandvik|sandvikcoromant|sanofi|sap|sarl|sas|save|"); } LIT.with(|lit| lit.clone()) };
    let v96: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("saxo|sb|sbi|sbs|sc|scb|schaeffler|schmidt|scholarships|school|schule|schwarz|science|scot|sd|se|"); } LIT.with(|lit| lit.clone()) };
    let v97: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|safe|safety|sakura|sale|salon|samsclub|samsung|sandvik|sandvikcoromant|sanofi|sap|sarl|sas|save|saxo|sb|sbi|sbs|sc|scb|schaeffler|schmidt|scholarships|school|schule|schwarz|science|scot|sd|se|"); } LIT.with(|lit| lit.clone()) };
    let v98: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|search|seat|secure|security|seek|select|sener|services|seven|sew|sex|sexy|sfr|sg|sh|shangrila|"); } LIT.with(|lit| lit.clone()) };
    let v99: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("sharp|shell|shia|shiksha|shoes|shop|shopping|shouji|show|si|silk|sina|singles|site|sj|sk|ski|skin|"); } LIT.with(|lit| lit.clone()) };
    let v100: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|search|seat|secure|security|seek|select|sener|services|seven|sew|sex|sexy|sfr|sg|sh|shangrila|sharp|shell|shia|shiksha|shoes|shop|shopping|shouji|show|si|silk|sina|singles|site|sj|sk|ski|skin|"); } LIT.with(|lit| lit.clone()) };
    let v101: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|sky|skype|sl|sling|sm|smart|smile|sn|sncf|so|soccer|social|softbank|software|sohu|solar|solutions|"); } LIT.with(|lit| lit.clone()) };
    let v102: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("song|sony|soy|spa|space|sport|spot|sr|srl|ss|st|stada|staples|star|statebank|statefarm|stc|"); } LIT.with(|lit| lit.clone()) };
    let v103: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|sky|skype|sl|sling|sm|smart|smile|sn|sncf|so|soccer|social|softbank|software|sohu|solar|solutions|song|sony|soy|spa|space|sport|spot|sr|srl|ss|st|stada|staples|star|statebank|statefarm|stc|"); } LIT.with(|lit| lit.clone()) };
    let v104: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|stcgroup|stockholm|storage|store|stream|studio|study|style|su|sucks|supplies|supply|support|surf|"); } LIT.with(|lit| lit.clone()) };
    let v105: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("surgery|suzuki|sv|swatch|swiss|sx|sy|sydney|systems|sz|tab|taipei|talk|taobao|target|tatamotors|"); } LIT.with(|lit| lit.clone()) };
    let v106: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|stcgroup|stockholm|storage|store|stream|studio|study|style|su|sucks|supplies|supply|support|surf|surgery|suzuki|sv|swatch|swiss|sx|sy|sydney|systems|sz|tab|taipei|talk|taobao|target|tatamotors|"); } LIT.with(|lit| lit.clone()) };
    let v107: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|tatar|tattoo|tax|taxi|tc|tci|td|tdk|team|tech|technology|tel|temasek|tennis|teva|tf|tg|th|thd|"); } LIT.with(|lit| lit.clone()) };
    let v108: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("theater|theatre|tiaa|tickets|tienda|tips|tires|tirol|tj|tjmaxx|tjx|tk|tkmaxx|tl|tm|tmall|tn|to|"); } LIT.with(|lit| lit.clone()) };
    let v109: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|tatar|tattoo|tax|taxi|tc|tci|td|tdk|team|tech|technology|tel|temasek|tennis|teva|tf|tg|th|thd|theater|theatre|tiaa|tickets|tienda|tips|tires|tirol|tj|tjmaxx|tjx|tk|tkmaxx|tl|tm|tmall|tn|to|"); } LIT.with(|lit| lit.clone()) };
    let v110: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|today|tokyo|tools|top|toray|toshiba|total|tours|town|toyota|toys|tr|trade|trading|training|travel|"); } LIT.with(|lit| lit.clone()) };
    let v111: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("travelers|travelersinsurance|trust|trv|tt|tube|tui|tunes|tushu|tv|tvs|tw|tz|ua|ubank|ubs|ug|uk|"); } LIT.with(|lit| lit.clone()) };
    let v112: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|today|tokyo|tools|top|toray|toshiba|total|tours|town|toyota|toys|tr|trade|trading|training|travel|travelers|travelersinsurance|trust|trv|tt|tube|tui|tunes|tushu|tv|tvs|tw|tz|ua|ubank|ubs|ug|uk|"); } LIT.with(|lit| lit.clone()) };
    let v113: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|unicom|university|uno|uol|ups|us|uy|uz|va|vacations|vana|vanguard|vc|ve|vegas|ventures|verisign|"); } LIT.with(|lit| lit.clone()) };
    let v114: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("versicherung|vet|vg|vi|viajes|video|vig|viking|villas|vin|vip|virgin|visa|vision|viva|vivo|"); } LIT.with(|lit| lit.clone()) };
    let v115: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|unicom|university|uno|uol|ups|us|uy|uz|va|vacations|vana|vanguard|vc|ve|vegas|ventures|verisign|versicherung|vet|vg|vi|viajes|video|vig|viking|villas|vin|vip|virgin|visa|vision|viva|vivo|"); } LIT.with(|lit| lit.clone()) };
    let v116: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|vlaanderen|vn|vodka|volvo|vote|voting|voto|voyage|vu|wales|walmart|walter|wang|wanggou|watch|"); } LIT.with(|lit| lit.clone()) };
    let v117: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("watches|weather|weatherchannel|web|webcam|weber|website|wed|wedding|weibo|weir|wf|whoswho|wien|"); } LIT.with(|lit| lit.clone()) };
    let v118: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|vlaanderen|vn|vodka|volvo|vote|voting|voto|voyage|vu|wales|walmart|walter|wang|wanggou|watch|watches|weather|weatherchannel|web|webcam|weber|website|wed|wedding|weibo|weir|wf|whoswho|wien|"); } LIT.with(|lit| lit.clone()) };
    let v119: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|wiki|williamhill|win|windows|wine|winners|wme|woodside|work|works|world|wow|ws|wtc|wtf|xbox|xerox|"); } LIT.with(|lit| lit.clone()) };
    let v120: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("xihuan|xin|xxx|xyz|yachts|yahoo|yamaxun|yandex|ye|yodobashi|yoga|yokohama|you|youtube|yt|yun|za|"); } LIT.with(|lit| lit.clone()) };
    let v121: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|wiki|williamhill|win|windows|wine|winners|wme|woodside|work|works|world|wow|ws|wtc|wtf|xbox|xerox|xihuan|xin|xxx|xyz|yachts|yahoo|yamaxun|yandex|ye|yodobashi|yoga|yokohama|you|youtube|yt|yun|za|"); } LIT.with(|lit| lit.clone()) };
    let v122: bool = v7.contains(&*v4);
    if v122 {
        true
    } else {
        let v123: bool = v10.contains(&*v4);
        if v123 {
            true
        } else {
            let v124: bool = v13.contains(&*v4);
            if v124 {
                true
            } else {
                let v125: bool = v16.contains(&*v4);
                if v125 {
                    true
                } else {
                    let v126: bool = v19.contains(&*v4);
                    if v126 {
                        true
                    } else {
                        let v127: bool = v22.contains(&*v4);
                        if v127 {
                            true
                        } else {
                            let v128: bool = v25.contains(&*v4);
                            if v128 {
                                true
                            } else {
                                let v129: bool = v28.contains(&*v4);
                                if v129 {
                                    true
                                } else {
                                    let v130: bool = v31.contains(&*v4);
                                    if v130 {
                                        true
                                    } else {
                                        let v131: bool = v34.contains(&*v4);
                                        if v131 {
                                            true
                                        } else {
                                            let v132: bool = v37.contains(&*v4);
                                            if v132 {
                                                true
                                            } else {
                                                let v133: bool = v40.contains(&*v4);
                                                if v133 {
                                                    true
                                                } else {
                                                    let v134: bool = v43.contains(&*v4);
                                                    if v134 {
                                                        true
                                                    } else {
                                                        let v135: bool = v46.contains(&*v4);
                                                        if v135 {
                                                            true
                                                        } else {
                                                            let v136: bool = v49.contains(&*v4);
                                                            if v136 {
                                                                true
                                                            } else {
                                                                let v137: bool = v52.contains(&*v4);
                                                                if v137 {
                                                                    true
                                                                } else {
                                                                    let v138: bool = v55.contains(&*v4);
                                                                    if v138 {
                                                                        true
                                                                    } else {
                                                                        let v139: bool = v58.contains(&*v4);
                                                                        if v139 {
                                                                            true
                                                                        } else {
                                                                            let v140: bool = v61.contains(&*v4);
                                                                            if v140 {
                                                                                true
                                                                            } else {
                                                                                let v141: bool = v64.contains(&*v4);
                                                                                if v141 {
                                                                                    true
                                                                                } else {
                                                                                    let v142: bool = v67.contains(&*v4);
                                                                                    if v142 {
                                                                                        true
                                                                                    } else {
                                                                                        let v143: bool = v70.contains(&*v4);
                                                                                        if v143 {
                                                                                            true
                                                                                        } else {
                                                                                            let v144: bool = v73.contains(&*v4);
                                                                                            if v144 {
                                                                                                true
                                                                                            } else {
                                                                                                let v145: bool = v76.contains(&*v4);
                                                                                                if v145 {
                                                                                                    true
                                                                                                } else {
                                                                                                    let v146: bool = v79.contains(&*v4);
                                                                                                    if v146 {
                                                                                                        true
                                                                                                    } else {
                                                                                                        let v147: bool = v82.contains(&*v4);
                                                                                                        if v147 {
                                                                                                            true
                                                                                                        } else {
                                                                                                            let v148: bool = v85.contains(&*v4);
                                                                                                            if v148 {
                                                                                                                true
                                                                                                            } else {
                                                                                                                let v149: bool = v88.contains(&*v4);
                                                                                                                if v149 {
                                                                                                                    true
                                                                                                                } else {
                                                                                                                    let v150: bool = v91.contains(&*v4);
                                                                                                                    if v150 {
                                                                                                                        true
                                                                                                                    } else {
                                                                                                                        let v151: bool = v94.contains(&*v4);
                                                                                                                        if v151 {
                                                                                                                            true
                                                                                                                        } else {
                                                                                                                            let v152: bool = v97.contains(&*v4);
                                                                                                                            if v152 {
                                                                                                                                true
                                                                                                                            } else {
                                                                                                                                let v153: bool = v100.contains(&*v4);
                                                                                                                                if v153 {
                                                                                                                                    true
                                                                                                                                } else {
                                                                                                                                    let v154: bool = v103.contains(&*v4);
                                                                                                                                    if v154 {
                                                                                                                                        true
                                                                                                                                    } else {
                                                                                                                                        let v155: bool = v106.contains(&*v4);
                                                                                                                                        if v155 {
                                                                                                                                            true
                                                                                                                                        } else {
                                                                                                                                            let v156: bool = v109.contains(&*v4);
                                                                                                                                            if v156 {
                                                                                                                                                true
                                                                                                                                            } else {
                                                                                                                                                let v157: bool = v112.contains(&*v4);
                                                                                                                                                if v157 {
                                                                                                                                                    true
                                                                                                                                                } else {
                                                                                                                                                    let v158: bool = v115.contains(&*v4);
                                                                                                                                                    if v158 {
                                                                                                                                                        true
                                                                                                                                                    } else {
                                                                                                                                                        let v159: bool = v118.contains(&*v4);
                                                                                                                                                        if v159 {
                                                                                                                                                            true
                                                                                                                                                        } else {
                                                                                                                                                            let v160: bool = v121.contains(&*v4);
                                                                                                                                                            if v160 {
                                                                                                                                                                true
                                                                                                                                                            } else {
                                                                                                                                                                let v161: Rc<str> = { thread_local!{ static LIT: Rc<str> = Rc::<str>::from("|zappos|zara|zero|zip|zm|zone|zuerich|zw|"); } LIT.with(|lit| lit.clone()) };
                                                                                                                                                                let v162: bool = v161.contains(&*v4);
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
fn known_tld_0(mut v0: Rc<str>) -> bool {
    is_tld_1(v0)
}
fn closure0() -> Rc<dyn Fn(Rc<str>) -> bool> {
    thread_local!{ static CLOSURE: Rc<dyn Fn(Rc<str>) -> bool> = Rc::new(move |mut v0: Rc<str>| -> bool {
        known_tld_0(v0.clone())
    }); } CLOSURE.with(|closure| closure.clone())
}
pub fn xc_is_tld(v0: &str) -> bool {
    closure0()(Rc::<str>::from(v0))
}
