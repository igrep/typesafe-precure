{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module ACME.PreCure.Textbook.First.Words where

import           Data.List (intercalate)


groupName_First = "ふたりはプリキュア"

girlName_Nagisa = "美墨なぎさ"
girlName_Honoka = "雪城ほのか"

cureName_Black = "キュアブラック"
cureName_White = "キュアホワイト"

introducesHerselfAs_Black = "光の使者、キュアブラック！" 
introducesHerselfAs_White = "光の使者、キュアホワイト！" 


transformationSpeech_Black_White =
  intercalate "\n"
    [ "デュアル・オーロラ・ウェイブ！！"
    , introducesHerselfAs_Black
    , introducesHerselfAs_White
    , "ふたりはプリキュア！"
    , "闇の力のしもべ達よ！"
    , "とっととお家に帰りなさい！"
    ]


purificationSpeech_Black_White =
  intercalate "\n"
    [ "ブラックサンダー！"
    , "ホワイトサンダー！"
    , "プリキュアの美しき魂が！"
    , "邪悪な心を打ち砕く！"
    , "プリキュア・マーブル・スクリュー！！"
    ]

-- https://www.youtube.com/watch?v=jTaon2204i4
purificationSpeech_Black_White_RainbowStorm =
  intercalate "\n"
    [ "希望の力よ！光の意思よ！"
    , "未来に向かって、突き進め！"
    , "プリキュア・レインボー・ストーム！！"
    ]
