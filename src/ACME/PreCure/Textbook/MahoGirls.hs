{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module ACME.PreCure.Textbook.MahoGirls where

import           Data.List
                   ( intercalate
                   )


girlName_Mirai = "朝日奈みらい"
girlName_Riko  = "十六夜リコ"

cureName_Miracle = "キュアミラクル"
cureName_Magical = "キュアマジカル"

introducesHerselfAs_Miracle = "ふたりの奇跡！キュアミラクル！" 
introducesHerselfAs_Magical = "ふたりの魔法！キュアマジカル！" 

variation_Dia = "ダイヤスタイル"
variation_Ruby = "ルビースタイル"
variation_Sapphire = "サファイアスタイル"
variation_Topaz = "トパーズスタイル"

linkleStoneName_Dia = "ダイヤ"
linkleStoneName_Ruby = "ルビー"
linkleStoneName_Sapphire = "サファイヤ"
linkleStoneName_Topaz = "トパーズ"


transformationSpeechWith_Miracle_Magical :: String -> String
transformationSpeechWith_Miracle_Magical lsn =
  intercalate "\n"
    [ "キュアップ・ラパパ！　" ++ lsn ++ "！"
    , "ミラクル・マジカル・ジュエリーレ！"
    , introducesHerselfAs_Miracle
    , introducesHerselfAs_Magical
    , "魔法つかいプリキュア！！"
    ]

transformationSpeech_Miracle_Magical =
  transformationSpeechWith_Miracle_Magical linkleStoneName_Dia
transformationSpeech_Miracle_Magical_Ruby =
  transformationSpeechWith_Miracle_Magical linkleStoneName_Ruby
transformationSpeech_Miracle_Magical_Sapphire =
  transformationSpeechWith_Miracle_Magical linkleStoneName_Sapphire
transformationSpeech_Miracle_Magical_Topaz =
  transformationSpeechWith_Miracle_Magical linkleStoneName_Topaz


-- https://www.youtube.com/watch?v=QBQfnFOyRS4
purificationSpeech_Miracle_Magical =
  intercalate "\n"
    [ "ダイヤ！永遠の輝きを私達の手に！"
    , "フルフルリンクル！"
    , "プリキュア・ダイヤモンド・エターナル！"
    ]

-- https://www.youtube.com/watch?v=sM7VC9-hCU8
purificationSpeech_Miracle_Magical_Ruby =
  intercalate "\n"
    [ "リンクルステッキ！"
    , "(モッフー！)"
    , "ルビー！紅の情熱よ私達の手に！"
    , "フルフルリンクル！"
    , "プリキュア・ルビー・パッショナーレ！"
    ]

-- https://www.youtube.com/watch?v=lNUa2Sfa894
purificationSpeech_Miracle_Magical_Sapphire =
  intercalate "\n"
    [ "リンクルステッキ！"
    , "(モッフー！)"
    , "サファイア！青き知性よ私達の手に！"
    , "フルフルリンクル！"
    , "プリキュア・サファイア・スマーティッシュ！"
    ]

-- https://www.youtube.com/watch?v=uu7V5Fxw8NQ
purificationSpeech_Miracle_Magical_Topaz =
  intercalate "\n"
    [ "リンクルステッキ！"
    , "(モォッフー！モッフッ！)"
    , "トパーズ！金色の希望よ私達の手に！"
    , "フルフルリンクル！"
    , "プリキュア・トパーズ・エスペランサ！"
    ]
