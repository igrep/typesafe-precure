{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module ACME.PreCure.Textbook.Yes5.Words where

import           Data.List (intercalate)


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
transformationSpeech_Dream    = metamorphose ++ "\n" ++ introducesHerselfAs_Dream
transformationSpeech_Rouge    = metamorphose ++ "\n" ++ introducesHerselfAs_Rouge
transformationSpeech_Lemonade = metamorphose ++ "\n" ++ introducesHerselfAs_Lemonade
transformationSpeech_Mint     = metamorphose ++ "\n" ++ introducesHerselfAs_Mint
transformationSpeech_Aqua     = metamorphose ++ "\n" ++ introducesHerselfAs_Aqua

-- https://www.youtube.com/watch?v=wxH7h3D31ho
transformationSpeech_Yes5 =
  intercalate "\n"
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
purificationSpeech_Dream    = purificationSpeech_Dream_Common ++ "\nプリキュア！ドリーム・アタック！"
purificationSpeech_Rouge    = purificationSpeech_Rouge_Common ++ "\nプリキュア！ルージュ・ファイヤー！"
purificationSpeech_Lemonade = purificationSpeech_Lemonade_Common ++ "\nプリキュア！レモネード・フラッシュ！"
purificationSpeech_Mint     = purificationSpeech_Mint_Common ++ "\nプリキュア！ミント・プロテクション！"
purificationSpeech_Aqua     = purificationSpeech_Aqua_Common ++ "\nプリキュア！アクア・ストリーム！"

purificationSpeech_Dream_Crystal_Shoot = purificationSpeech_Dream_Common ++ "\nプリキュア！クリスタル・シュート！"
purificationSpeech_Rouge_Burning       = purificationSpeech_Rouge_Common ++ "\nプリキュア！ルージュ・バーニング！"
purificationSpeech_Lemonade_Shining    = purificationSpeech_Lemonade_Common ++ "\nプリキュア！レモネード・シャイニング！"
purificationSpeech_Mint_Shield         = purificationSpeech_Mint_Common ++ "\nプリキュア！ミント・シールド！"
purificationSpeech_Aqua_Tornado        = purificationSpeech_Aqua_Common ++ "\nプリキュア！アクア・トルネード！"

-- https://www.youtube.com/watch?v=wUBVBa6PiVo
purificationSpeech_Yes5 =
  intercalate "\n"
    [ "夢と希望の力とともに！"
    , "5つの光よ！"
    , "今ここに！"
    , "プリキュア！ファイブ・エクスプロージョン！"
    ]
