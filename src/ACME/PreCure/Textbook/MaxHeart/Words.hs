{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module ACME.PreCure.Textbook.MaxHeart.Words where

import           Data.List (intercalate)

import           ACME.PreCure.Textbook.First.Words


groupName_MaxHeart = "ふたりはプリキュア Max Heart"

girlName_Hikari = "九条ひかり"

cureName_Luminous = "シャイニールミナス"

introducesHerselfAs_Luminous = "輝く命、シャイニールミナス！" 

variation_MaxHeart = "Max Heart"

transformationSpeech_Luminous =
  intercalate "\n"
    [ "ルミナス・シャイニングストリーム！"
    , introducesHerselfAs_Luminous
    , "光の心と光の意志、すべてを一つにするために！"
    ]


purificationSpeech_Black_White_Max =
  purificationSpeech_Black_White ++ "\nマックス！！"


purificationSpeech_Luminous =
  intercalate "\n"
    [ "光の意志よ！私に勇気を！希望と力を！！"
    , "ルミナス・ハーティエル・アンクション！"
    ]
