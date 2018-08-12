{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.Fresh.Profiles where

import           Data.List (intercalate)

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.Fresh.Words


girls :: [Girl]
girls =
  [ mkGirl "Love Momozono" girlName_Love
  , mkGirl "Miki Aono" girlName_Miki
  , mkGirl "Inori Yamabuki" girlName_Inori
  , mkGirl "Setsuna Higashi" girlName_Setsuna
  ]


transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Peach"
      ""
      cureName_Peach
      ""
      (intercalate "\n" introducesHerselfAs_Peach)

  , mkTransformee
      "Cure Berry"
      ""
      cureName_Berry
      ""
      (intercalate "\n" introducesHerselfAs_Berry)

  , mkTransformee
      "Cure Pine"
      ""
      cureName_Pine
      ""
      (intercalate "\n" introducesHerselfAs_Pine)

  , mkTransformee
      "Cure Passion"
      ""
      cureName_Passion
      ""
      (intercalate "\n" introducesHerselfAs_Passion)
  ]


transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CurePeach", "CureBerry", "CurePine", "CurePassion"] "Fresh" "" groupName_Fresh ""
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Linkrun" "リンクルン" []
  , mkSpecialItem "CureStickPeachRod" "キュアスティック・ピーチロッド" []
  , mkSpecialItem "CureStickBerrySword" "キュアスティック・ベリーソード" []
  , mkSpecialItem "CureStickPineFlute" "キュアスティック・パインフルート"  []
  , mkSpecialItem "PassionHarp" "パッションハープ" []
  , mkSpecialItem "CloverBox" "クローバーボックス" []
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Love"]
      ["Linkrun"]
      ["CurePeach"]
      transformationSpeech_Peach

  , mkTransformation
      ["Miki"]
      ["Linkrun"]
      ["CureBerry"]
      transformationSpeech_Berry

  , mkTransformation
      ["Inori"]
      ["Linkrun"]
      ["CurePine"]
      transformationSpeech_Pine

  , mkTransformation
      ["Setsuna"]
      ["Linkrun"]
      ["CurePassion"]
      transformationSpeech_Passion

  , mkTransformation
      ["Love", "Miki", "Inori", "Setsuna"]
      ["Linkrun"]
      ["CurePeach","CureBerry","CurePine","CurePassion"]
      transformationSpeech_Fresh
  ]


purifications :: [Purification]
purifications =
  [ mkPurification
      ["CurePeach"]
      ["CureStickPeachRod"]
      purificationSpeech_Peach_Fresh

  , mkPurification
      ["CureBerry"]
      ["CureStickBerrySword"]
      purificationSpeech_Berry_Fresh

  , mkPurification
      ["CurePine"]
      ["CureStickPineFlute"]
      purificationSpeech_Pine_Fresh

  , mkPurification
      ["CurePassion"]
      ["PassionHarp"]
      purificationSpeech_Passion

  , mkPurification
      ["CurePeach", "CureBerry", "CurePine", "CurePassion"]
      ["CloverBox"]
      purificationSpeech_Fresh
  ]


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ mkNonItemPurification ["CurePeach"] purificationSpeech_Peach
  , mkNonItemPurification ["CureBerry"] purificationSpeech_Berry
  , mkNonItemPurification ["CurePine"] purificationSpeech_Pine
  ]
