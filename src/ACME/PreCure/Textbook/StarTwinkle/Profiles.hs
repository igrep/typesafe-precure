{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.StarTwinkle.Profiles where

import           Data.String (IsString)

import           ACME.PreCure.Index.Types

girls :: [Girl]
girls =
  [ mkGirl "Hikaru Hoshina" "星奈 ひかる"
  , mkGirl "Lala Hagoromo"  "羽衣 ララ"
  , mkGirl "Elena Amamiya"  "天宮 えれな"
  , mkGirl "Madoka Kaguya"  "香久矢 まどか"
  ]

transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Star"
      ""
      "キュアスター"
      ""
      introducesHerselfAs_CureStar
  , mkTransformee
      "Cure Milky"
      ""
      "キュアミルキー"
      ""
      introducesHerselfAs_CureMilky
  , mkTransformee
      "Cure Soleil"
      ""
      "キュアソレイユ"
      ""
      introducesHerselfAs_CureSoleil
  , mkTransformee
      "Cure Selene"
      ""
      "キュアセレーネ"
      ""
      introducesHerselfAs_CureSelene
  ]

transformedGroups :: [TransformedGroup]
transformedGroups = [mkTransformedGroup groupMembers ne "" nj ""]
  where
    ne = "StarTwinkle☆ PreCure"
    nj = "スター☆トゥインクルプリキュア"

specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Star Color Pendant" "スターカラーペンダント" ["Star Color Pen"]
  , mkSpecialItem "Star Color Pen Cure Star"   "スターカラーペン キュアスター" []
  , mkSpecialItem "Star Color Pen Cure Milky"  "スターカラーペン キュアミルキー" []
  , mkSpecialItem "Star Color Pen Cure Soleil" "スターカラーペン キュアソレイユ" []
  , mkSpecialItem "Star Color Pen Cure Selene" "スターカラーペン キュアセレーネ" []
  , mkSpecialItem "Star Color Pen Taurus"      "スターカラーペン おうし座" []
  , mkSpecialItem "Star Color Pen Leo"         "スターカラーペン しし座" []
  , mkSpecialItem "Star Color Pen Libra"       "スターカラーペン てんびん座" []
  , mkSpecialItem "Star Color Pen Capricorn"   "スターカラーペン やぎ座" []
  ]

transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Hikaru"]
      [mkIA "StarColorPendant" ["StarColorPenCureStar"]]
      ["CureStar"]
      (starColorPendantColorCharge ++
       transformationSong ++ [introducesHerselfAs_CureStar])
  , mkTransformation
      ["Lala"]
      [mkIA "StarColorPendant" ["StarColorPenCureMilky"]]
      ["CureMilky"]
      (starColorPendantColorCharge ++
       transformationSong ++ [introducesHerselfAs_CureMilky])
  , mkTransformation
      ["Elena"]
      [mkIA "StarColorPendant" ["StarColorPenCureSoleil"]]
      ["CureSoleil"]
      (starColorPendantColorCharge ++
       transformationSong ++ [introducesHerselfAs_CureSoleil])
  , mkTransformation
      ["Madoka"]
      [ mkIA "StarColorPendant" ["StarColorPenCureSelene"]
      ]
      ["CureSelene"]
      (starColorPendantColorCharge ++
       transformationSong ++ [introducesHerselfAs_CureSelene])
  , mkTransformation
      ["Hikaru", "Lala", "Elena", "Madoka"]
      [ mkIA "StarColorPendant" ["StarColorPenCureStar"]
      , mkIA "StarColorPendant" ["StarColorPenCureMilky"]
      , mkIA "StarColorPendant" ["StarColorPenCureSoleil"]
      , mkIA "StarColorPendant" ["StarColorPenCureSelene"]
      ]
      ["CureStar", "CureMilky", "CureSoleil", "CureSelene"]
      (starColorPendantColorCharge ++
       transformationSong ++
       [ introducesHerselfAs_CureStar
       , introducesHerselfAs_CureMilky
       , introducesHerselfAs_CureSoleil
       , introducesHerselfAs_CureSelene
       , "スター☆トゥインクルプリキュア！"
       ]
      )
  ]

purifications :: [Purification]
purifications =
  [ mkPurification
      ["CureStar"]
      [mkIA "StarColorPendant" ["StarColorPenTaurus"]]
      ["プリキュア！", "おうし座！", "スター・パンチ！"]
  , mkPurification
      ["CureMilky"]
      [mkIA "StarColorPendant" ["StarColorPenLeo"]]
      ["プリキュア！", "しし座！", "ミルキー・ショック！"]
  ]


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ mkNonItemPurification ["CureStar"]   ["プリキュア！", "スター・パンチ！"]
  , mkNonItemPurification ["CureMilky"]  ["プリキュア！", "ミルキー・ショック！"]
  , mkNonItemPurification ["CureSoleil"] ["プリキュア！", "ソレイユ・シュート！"]
  , mkNonItemPurification ["CureSelene"] ["プリキュア！", "セレーネ・アロー！"]
  ]

groupMembers :: IsString s => [s]
groupMembers =
  ["CureStar", "CureMilky", "CureSoleil", "CureSelene"]

starColorPendantColorCharge = ["スターカラーペンダント！", "カラーチャージ！"]

transformationSong =
  [ "きーらーめーくー♪"
  , "ほーしーの力でー♪"
  , "あこがーれのー♪"
  , "わーたーし描くよー♪"
  , "トゥインクル♪トゥインクルプリキュア♪"
  , "トゥインクル♪トゥインクルプリキュア♪"
  , "トゥインクル♪トゥインクルプリキュア♪"
  , "スター☆トゥインクル♪"
  , "スター☆トゥインクルプリキュアー♪ ああー♪"
  ]

introducesHerselfAs_CureStar =
  "宇宙に輝くー！キラキラ星！キュアスター！"

introducesHerselfAs_CureMilky =
  "天にあまねくー！ミルキーウェイ！キュアミルキー！"

introducesHerselfAs_CureSoleil =
  "宇宙を照らす！灼熱の、きらめき！キュアソレイユ！"

introducesHerselfAs_CureSelene =
  "夜空に輝く！神秘の、月あかり！キュアセレーネ！"
