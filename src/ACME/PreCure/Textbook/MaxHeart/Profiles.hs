{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.MaxHeart.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.First.Words
import           ACME.PreCure.Textbook.MaxHeart.Words


girls :: [Girl]
girls =
  [ mkGirl ("Hikari" ++ error "Need family name!") girlName_Hikari
  ]


transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Black"
      "Max"
      cureName_Black
      variation_MaxHeart
      "introducesHerselfAs_Black"

  , mkTransformee
      "Cure White"
      "Max"
      cureName_White
      variation_MaxHeart
      "introducesHerselfAs_White"

  , mkTransformee
      "Shiny Luminous"
      ""
      cureName_Luminous
      ""
      introducesHerselfAs_Luminous

  ]


transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CureBlack_Max", "CureWhite_Max"] "Max Heart" "" groupName_MaxHeart ""
  , mkTransformedGroup ["CureBlack_Max", "CureWhite_Max", "ShinyLuminous"] "Max Heart" "" groupName_MaxHeart ""
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "HeartfulCommune_Mepple" (error "Specify specialItemNameJa") []
  , mkSpecialItem "HeartfulCommune_Mipple" (error "Specify specialItemNameJa") []
  , mkSpecialItem "TouchCommune_Porun" (error "Specify specialItemNameJa") []
  , mkSpecialItem "SparkleBrace" (error "Specify specialItemNameJa") []
  , mkSpecialItem "HeartielBaton" (error "Specify specialItemNameJa") []
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Nagisa", "Honoka"]
      ["HeartfulCommune_Mepple", "HeartfulCommune_Mipple"]
      ["CureBlack_Max","CureWhite_Max"]
      transformationSpeech_Black_White

  , mkTransformation
      ["Hikari"]
      ["TouchCommune_Porun"]
      ["ShinyLuminous"]
      transformationSpeech_Luminous

  ]


purifications :: [Purification]
purifications =
  [ mkPurification
      ["ShinyLuminous"]
      ["HeartielBaton"]
      purificationSpeech_Luminous

  ]


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ mkNonItemPurification ["CureBlack_Max", "CureWhite_Max"] purificationSpeech_Black_White_Max
  ]


