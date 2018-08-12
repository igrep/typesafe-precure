{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.First.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.First.Words


girls :: [Girl]
girls =
  [ mkGirl ("Nagisa" ++ error "Need family name!") girlName_Nagisa
  , mkGirl ("Honoka" ++ error "Need family name!") girlName_Honoka
  ]


transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Black"
      ""
      cureName_Black
      ""
      introducesHerselfAs_Black

  , mkTransformee
      "Cure White"
      ""
      cureName_White
      ""
      introducesHerselfAs_White

  ]


transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CureBlack", "CureWhite"] "First" "" groupName_First ""
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "CardCommune_Mepple" (error "Specify specialItemNameJa") []
  , mkSpecialItem "CardCommune_Mipple" (error "Specify specialItemNameJa") []
  , mkSpecialItem "RainbowBrace" (error "Specify specialItemNameJa") []
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Nagisa", "Honoka"]
      ["CardCommune_Mepple", "CardCommune_Mipple"]
      ["CureBlack","CureWhite"]
      transformationSpeech_Black_White

  ]


purifications :: [Purification]
purifications =
  [ mkPurification
      ["CureBlack", "CureWhite"]
      ["RainbowBrace"]
      purificationSpeech_Black_White_RainbowStorm

  ]


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ mkNonItemPurification ["CureBlack", "CureWhite"] purificationSpeech_Black_White
  ]


