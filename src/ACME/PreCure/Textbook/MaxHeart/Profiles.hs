{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.MaxHeart.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.First.Words
import           ACME.PreCure.Textbook.MaxHeart.Words


girls :: [Girl]
girls =
  [ mkGirl "Hikari Kujou" girlName_Hikari
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
  [ mkSpecialItem "Heartful Commune Mepple" "ハートフルコミューン（メップル）" []
  , mkSpecialItem "Heartful Commune Mipple" "ハートフルコミューン（ミップル）" []
  , mkSpecialItem "TouchCommune_Porun" "タッチコミューン（ポルン）" []
  , mkSpecialItem "Sparkle Brace" "スパークルブレス" []
  , mkSpecialItem "Heartiel Baton" "ハーティエルバトン" []
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Nagisa", "Honoka"]
      ["HeartfulCommuneMepple", "HeartfulCommuneMipple"]
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
