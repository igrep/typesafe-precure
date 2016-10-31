{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module ACME.PreCure.Textbook.MahoGirls where

import           Data.List
                   ( intercalate
                   )


groupName_MahoGirls = "魔法つかいプリキュア！"


girlName_Mirai  = "朝日奈みらい"
girlName_Riko   = "十六夜リコ"
girlName_Kotoha = "花海ことは"

cureName_Miracle = "キュアミラクル"
cureName_Magical = "キュアマジカル"
cureName_Felice  = "キュアフェリーチェ"

introducesHerselfAs_Miracle = "ふたりの奇跡！キュアミラクル！" 
introducesHerselfAs_Magical = "ふたりの魔法！キュアマジカル！" 
introducesHerselfAs_Felice  = "あまねく生命に祝福を！キュアフェリーチェ！" 

variation_Dia = "ダイヤスタイル"
variation_Ruby = "ルビースタイル"
variation_Sapphire = "サファイアスタイル"
variation_Topaz = "トパーズスタイル"
variation_OverTheRainbow = "オーバー・ザ・レインボー"

linkleStoneName_Dia = "ダイヤ"
linkleStoneName_Ruby = "ルビー"
linkleStoneName_Sapphire = "サファイヤ"
linkleStoneName_Topaz = "トパーズ"
linkleStoneName_Emerald = "エメラルド"
linkleStoneName_Alexandrite = "アレキサンドライト"


transformationSpeechWith_Miracle_Magical :: String -> String
transformationSpeechWith_Miracle_Magical lsn =
  intercalate "\n"
    [ "キュアップ・ラパパ！　" ++ lsn ++ "！"
    , "ミラクル・マジカル・ジュエリーレ！"
    , introducesHerselfAs_Miracle
    , introducesHerselfAs_Magical
    , "魔法つかいプリキュア！！"
    ]


-- https://www.youtube.com/watch?v=YUd5IkDjEds
transformationSpeechWith_MahoGirls :: String -> String
transformationSpeechWith_MahoGirls lsn =
  intercalate "\n"
    [ "キュアップ・ラパパ！　" ++ lsn ++ "！"
    , "ミラクル・マジカル・ジュエリーレ！"
    , "エメラルド！"
    , "フェリーチェ・ファンファン・フラワーレ！"
    , introducesHerselfAs_Miracle
    , introducesHerselfAs_Magical
    , introducesHerselfAs_Felice
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

transformationSpeech_MahoGirls =
  transformationSpeechWith_MahoGirls linkleStoneName_Dia
transformationSpeech_MahoGirls_Ruby =
  transformationSpeechWith_MahoGirls linkleStoneName_Ruby
transformationSpeech_MahoGirls_Sapphire =
  transformationSpeechWith_MahoGirls linkleStoneName_Sapphire
transformationSpeech_MahoGirls_Topaz =
  transformationSpeechWith_MahoGirls linkleStoneName_Topaz

transformationSpeech_Felice =
  intercalate "\n"
    [ "キュアップ・ラパパ！　エメラルド！"
    , "フェリーチェ・ファンファン・フラワーレ！"
    , introducesHerselfAs_Felice
    ]

-- https://www.youtube.com/watch?v=BSseiA_pBYI
transformationSpeech_MahoGirls_OverTheRainbow =
  intercalate "\n"
    [ "キュアップ・ラパパ！　アレキサンドライト！"
    , "魔法つかいプリキュア！　オーバー・ザ・レインボー！"
    ]


-- https://www.youtube.com/watch?v=QBQfnFOyRS4
purificationSpeech_Miracle_Magical =
  intercalate "\n"
    [ "ダイヤ！永遠の輝きを私達の手に！"
    , "フルフルリンクル！"
    , "プリキュア！ダイヤモンド・エターナル！"
    ]

-- https://www.youtube.com/watch?v=sM7VC9-hCU8
purificationSpeech_Miracle_Magical_Ruby =
  intercalate "\n"
    [ "リンクルステッキ！"
    , "(モッフー！)"
    , "ルビー！紅の情熱よ私達の手に！"
    , "フルフルリンクル！"
    , "プリキュア！ルビー・パッショナーレ！"
    ]

-- https://www.youtube.com/watch?v=lNUa2Sfa894
purificationSpeech_Miracle_Magical_Sapphire =
  intercalate "\n"
    [ "リンクルステッキ！"
    , "(モッフー！)"
    , "サファイア！青き知性よ私達の手に！"
    , "フルフルリンクル！"
    , "プリキュア！サファイア・スマーティッシュ！"
    ]

-- https://www.youtube.com/watch?v=uu7V5Fxw8NQ
purificationSpeech_Miracle_Magical_Topaz =
  intercalate "\n"
    [ "リンクルステッキ！"
    , "(モォッフー！モッフッ！)"
    , "トパーズ！金色の希望よ私達の手に！"
    , "フルフルリンクル！"
    , "プリキュア！トパーズ・エスペランサ！"
    ]

-- https://www.youtube.com/watch?v=vEWAnGM0-Os
purificationSpeech_Felice =
  intercalate "\n"
    [ "フラワーエコーワンド！"
    , "エメラルド！"
    , "キュアー・アップ！"
    , "（キュアー・アップ！キュアー・アップ！キュアー・アップ！）"
    , "プリキュア！エメラルド・リンカネーション！"
    ]

-- https://www.youtube.com/watch?v=dGaiygaMDUM
purificationSpeech_MahoGirls_extreme_rainbow =
  intercalate "\n"
    [ "（レインボー・キャリッジリターン！ モフッ！）"
    , "(モォッフー！！)"
    , "巡り会う奇跡よ！"
    , "繋がる魔法よ！" 
    , "育まれし幸福（しあわせ）よ！" 
    , "今私たちの手に！"
    , "プレシャスブレス！"
    , "フル・フル・フルフルリンクル！"
    , "プリキュア！エクストリーム・レインボー！"
    ]
