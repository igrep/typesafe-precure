{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module ACME.PreCure.Textbook.SplashStar.Words where

import           Data.List (intercalate)


groupName_SplashStar = "ふたりはプリキュア Splash Star"

girlName_Saki = "日向咲"
girlName_Mai  = "美翔舞"

cureName_Bloom = "キュアブルーム"
cureName_Egret = "キュアイーグレット"

cureName_Bright = "キュアブライト"
cureName_Windy  = "キュアウィンディ"

variation_Bright_Windy = "（キュアブルーム・キュアウィンディ）"

introducesHerselfAs_Bloom = "輝く金の花！ キュアブルーム！" 
introducesHerselfAs_Egret = "煌めく銀の翼！ キュアイーグレット！" 

introducesHerselfAs_Bright = "天空に満ちる月！ キュアブライト！" 
introducesHerselfAs_Windy  = "大地に薫る風！ キュアウィンディ！" 

-- https://www.youtube.com/watch?v=BNfpwV-sPJU
transformationSpeech_Bloom_Egret =
  intercalate "\n"
    [ "デュアル・スピリチュアル・パワー！"
    , "花開け大地に！"
    , "羽ばたけ空に！"
    , introducesHerselfAs_Bloom
    , introducesHerselfAs_Egret
    , "ふたりはプリキュア！"
    , "聖なる泉を汚す者よ！"
    , "阿漕な真似はお止めなさい！"
    ]


-- https://www.youtube.com/watch?v=5RMeQZzksuQ
transformationSpeech_Bright_Windy =
  intercalate "\n"
    [ "デュアル・スピリチュアル・パワー！"
    , "未来を照らし!"
    , "勇気を運べ!"
    , introducesHerselfAs_Bright
    , introducesHerselfAs_Windy
    , "ふたりはプリキュア！"
    , "聖なる泉を汚す者よ！"
    , "阿漕な真似はお止めなさい！"
    ]

purificationSpeech_Bloom_Egret =
  intercalate "\n"
    [ "大地の精霊よ"
    , "大空の精霊よ"
    , "今、プリキュアと共に！"
    , "奇跡の力を解き放て！"
    , "プリキュア　ツインストリーム・スプラッシュ！！"
    ]
