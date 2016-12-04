{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module ACME.PreCure.Textbook.Yes5.Words where


groupName_Yes5 = "Yes! プリキュア 5"

girlName_Nozomi  = "夢原のぞみ"
girlName_Rin     = "夏木りん"
girlName_Urara   = "春日野うらら"
girlName_Komachi = "秋元こまち"
girlName_Karen   = "水無月かれん"

cureName_Dream    = "キュアドリーム"
cureName_Rouge    = "キュアルージュ"
cureName_Lemonade = "キュアレモネード"
cureName_Mint     = "キュアミント"
cureName_Aqua     = "キュアアクア"

introducesHerselfAs_Dream    = "大いなる希望の力、キュアドリーム！"
introducesHerselfAs_Rouge    = "情熱の赤い炎、キュアルージュ！"
introducesHerselfAs_Lemonade = "はじけるレモンの香り、キュアレモネード！"
introducesHerselfAs_Mint     = "安らぎの緑の大地、キュアミント！"
introducesHerselfAs_Aqua     = "知性の青き泉、キュアアクア！"

metamorphose = "プリキュア！メタモルフォーゼ！"

-- https://www.youtube.com/watch?v=exafSi98n2g
transformationSpeech_Dream    = [metamorphose, introducesHerselfAs_Dream]
transformationSpeech_Rouge    = [metamorphose, introducesHerselfAs_Rouge]
transformationSpeech_Lemonade = [metamorphose, introducesHerselfAs_Lemonade]
transformationSpeech_Mint     = [metamorphose, introducesHerselfAs_Mint]
transformationSpeech_Aqua     = [metamorphose, introducesHerselfAs_Aqua]

-- https://www.youtube.com/watch?v=wxH7h3D31ho
transformationSpeech_Yes5 =
    [ metamorphose
    , introducesHerselfAs_Dream
    , introducesHerselfAs_Rouge
    , introducesHerselfAs_Lemonade
    , introducesHerselfAs_Mint
    , introducesHerselfAs_Aqua
    , "希望の力と未来の光！"
    , "華麗に羽ばたく5つの心！"
    , "Yes！プリキュア5！"
    ]

purificationSpeech_Dream_Common    = "夢見る乙女の底力、受けてみなさい！"
purificationSpeech_Rouge_Common    = "純情乙女の炎の力、受けてみなさい！"
purificationSpeech_Lemonade_Common = "輝く乙女のはじける力、受けてみなさい！"
purificationSpeech_Mint_Common     = "大地を揺るがす乙女の怒り、受けてみなさい！"
purificationSpeech_Aqua_Common     = "岩をも砕く乙女の激流、受けてみなさい！"

-- https://www.youtube.com/watch?v=bypPLRhJQCk
purificationSpeech_Dream    = [purificationSpeech_Dream_Common, "プリキュア！ドリーム・アタック！"]
purificationSpeech_Rouge    = [purificationSpeech_Rouge_Common, "プリキュア！ルージュ・ファイヤー！"]
purificationSpeech_Lemonade = [purificationSpeech_Lemonade_Common, "プリキュア！レモネード・フラッシュ！"]
purificationSpeech_Mint     = [purificationSpeech_Mint_Common, "プリキュア！ミント・プロテクション！"]
purificationSpeech_Aqua     = [purificationSpeech_Aqua_Common, "プリキュア！アクア・ストリーム！"]

purificationSpeech_Dream_Crystal_Shoot = [purificationSpeech_Dream_Common, "プリキュア！クリスタル・シュート！"]
purificationSpeech_Rouge_Burning       = [purificationSpeech_Rouge_Common, "プリキュア！ルージュ・バーニング！"]
purificationSpeech_Lemonade_Shining    = [purificationSpeech_Lemonade_Common, "プリキュア！レモネード・シャイニング！"]
purificationSpeech_Mint_Shield         = [purificationSpeech_Mint_Common, "プリキュア！ミント・シールド！"]
purificationSpeech_Aqua_Tornado        = [purificationSpeech_Aqua_Common, "プリキュア！アクア・トルネード！"]

-- https://www.youtube.com/watch?v=wUBVBa6PiVo
purificationSpeech_Yes5 =
    [ "夢と希望の力とともに！"
    , "5つの光よ！"
    , "今ここに！"
    , "プリキュア！ファイブ・エクスプロージョン！"
    ]
