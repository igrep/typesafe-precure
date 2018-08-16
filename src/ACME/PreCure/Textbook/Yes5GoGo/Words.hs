{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module ACME.PreCure.Textbook.Yes5GoGo.Words where

import           ACME.PreCure.Textbook.Yes5.Words


groupName_Yes5GoGo = "Yes! プリキュア 5 GoGo!"

girlName_Kurumi = "美々野 くるみ"

cureName_MilkyRose = "ミルキィローズ"

introducesHerselfAs_MilkyRose = "青いバラは秘密のしるし！ ミルキィローズ！"

transformationSpeech_MilkyRose =
  ["スカイローズ・トランスレイト！", introducesHerselfAs_MilkyRose]

-- https://www.youtube.com/watch?v=cVEE_yXU0mM
transformationSpeech_Yes5GoGo =
  transformationSpeech_Yes5 ++ transformationSpeech_MilkyRose

purificationSpeech_Dream_GoGo =
  [purificationSpeech_Dream_Common, "プリキュア！シューティング・スター！"]
purificationSpeech_Rouge_GoGo =
  [purificationSpeech_Rouge_Common, "プリキュア！ファイヤー・ストライク！"]
purificationSpeech_Lemonade_GoGo =
  [purificationSpeech_Lemonade_Common, "プリキュア！プリズム・チェーン！"]
purificationSpeech_Mint_GoGo =
  [purificationSpeech_Mint_Common, "プリキュア！エメラルド・ソーサー！"]
purificationSpeech_Aqua_GoGo =
  [purificationSpeech_Aqua_Common, "プリキュア！サファイヤ・アロー！"]

purificationSpeech_MilkyRose =
    [ "邪悪な力を包み込む"
    , "バラの吹雪を咲かせましょう！"
    , "ミルキィローズ・ブリザード！"
    ]

purificationSpeech_MilkyRose_Metal =
    [ "邪悪な力を包み込む"
    , "煌くバラを咲かせましょう！"
    , "ミルキィローズ・メタル・ブリザード！"
    ]

-- https://www.youtube.com/watch?v=fC2tM3jOMeE
purificationSpeech_Yes5GoGo =
    [ "クリスタルフルーレ！希望の光！"
    , "ファイヤーフルーレ！情熱の光！"
    , "プロテクトフルーレ！安らぎの光！"
    , "トルネードフルーレ！知性の光！"
    , "5つの光に！"
    , "勇気をのせて！"
    , "プリキュア！レインボー・ローズ・エクスプロージョン！"
    , "行け！"
    ]
