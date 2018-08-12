{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.Fresh.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.Fresh.Words


girls :: [Girl]
girls =
  [ mkGirl ("Love" ++ error "Need family name!") girlName_Love
  , mkGirl ("Miki" ++ error "Need family name!") girlName_Miki
  , mkGirl ("Inori" ++ error "Need family name!") girlName_Inori
  , mkGirl ("Setsuna" ++ error "Need family name!") girlName_Setsuna
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
  [ mkSpecialItem "Linkrun" (error "Specify specialItemNameJa") []
  , mkSpecialItem "CureStickPeachRod" (error "Specify specialItemNameJa") []
  , mkSpecialItem "CureStickBerrySword" (error "Specify specialItemNameJa") []
  , mkSpecialItem "CureStickPineFlute" (error "Specify specialItemNameJa") []
  , mkSpecialItem "PassionHarp" (error "Specify specialItemNameJa") []
  , mkSpecialItem "CloverBox" (error "Specify specialItemNameJa") []
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


