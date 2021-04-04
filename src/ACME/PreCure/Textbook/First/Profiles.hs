{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.First.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.First.Words


girls :: [Girl]
girls =
  [ mkGirl "Nagisa Misumi" girlName_Nagisa
  , mkGirl "Honoka Yukishiro" girlName_Honoka
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
  [ mkTransformedGroup ["CureBlack", "CureWhite"] "Futari wa PreCure" "" groupName_First ""
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Card Commune Mepple" "カードコミューン（メップル）"
  , mkSpecialItem "Card Commune Mipple" "カードコミューン（ミップル）"
  , mkSpecialItem "Rainbow Bracelets" "レインボーブレス"
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Nagisa", "Honoka"]
      ["CardCommuneMepple", "CardCommuneMipple"]
      ["CureBlack","CureWhite"]
      transformationSpeech_Black_White
  ]


purifications :: [Purification]
purifications =
  [ mkPurification
      ["CureBlack", "CureWhite"]
      ["RainbowBracelets"]
      purificationSpeech_Black_White_RainbowStorm
  ]


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ mkNonItemPurification ["CureBlack", "CureWhite"] purificationSpeech_Black_White
  ]
