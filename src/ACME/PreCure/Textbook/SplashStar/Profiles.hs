{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.SplashStar.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.SplashStar.Words


girls :: [Girl]
girls =
  [ mkGirl "Saki Hyuga" girlName_Saki
  , mkGirl "Mai Misho" girlName_Mai
  ]


transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Bloom"
      ""
      cureName_Bloom
      ""
      introducesHerselfAs_Bloom

  , mkTransformee
      "Cure Egret"
      ""
      cureName_Egret
      ""
      introducesHerselfAs_Egret

  , mkTransformee
      "Cure Bright"
      ""
      cureName_Bright
      ""
      introducesHerselfAs_Bright

  , mkTransformee
      "Cure Windy"
      ""
      cureName_Windy
      ""
      introducesHerselfAs_Windy
  ]


transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CureBloom", "CureEgret"] "Futari wa PreCure Splash Star" "" groupName_SplashStar ""
  , mkTransformedGroup ["CureBright", "CureWindy"] "Futari wa PreCure Splash Star" "(Cure Bloom, Cure Windy)" groupName_SplashStar variation_Bright_Windy
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Mix Commune Flappy" "ミックスコミューン（フラッピ）"
  , mkSpecialItem "Mix Commune Choppy" "ミックスコミューン（チョッピ）"
  , mkSpecialItem "Crystal Commune Flappy" "クリスタルコミューン（フラッピ）"
  , mkSpecialItem "Crystal Commune Choppy" "クリスタルコミューン（チョッピ）"
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Saki", "Mai"]
      ["MixCommuneFlappy", "MixCommuneChoppy"]
      ["CureBloom","CureEgret"]
      transformationSpeech_Bloom_Egret

  , mkTransformation
      ["Saki", "Mai"]
      ["CrystalCommuneFlappy", "CrystalCommuneChoppy"]
      ["CureBright","CureWindy"]
      transformationSpeech_Bright_Windy
  ]


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ mkNonItemPurification ["CureBloom", "CureEgret"] purificationSpeech_Bloom_Egret
  ]
