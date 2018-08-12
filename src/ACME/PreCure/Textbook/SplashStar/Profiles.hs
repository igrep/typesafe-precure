{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.SplashStar.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.SplashStar.Words


girls :: [Girl]
girls =
  [ mkGirl ("Saki" ++ error "Need family name!") girlName_Saki
  , mkGirl ("Mai" ++ error "Need family name!") girlName_Mai
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
  [ mkTransformedGroup ["CureBloom", "CureEgret"] "Splash Star" "" groupName_SplashStar ""
  , mkTransformedGroup ["CureBright", "CureWindy"] "Splash Star" "Bright_ Windy" groupName_SplashStar variation_Bright_Windy
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "MixCommune_Flappy" (error "Specify specialItemNameJa") []
  , mkSpecialItem "MixCommune_Choppy" (error "Specify specialItemNameJa") []
  , mkSpecialItem "CrystalCommune_Flappy" (error "Specify specialItemNameJa") []
  , mkSpecialItem "CrystalCommune_Choppy" (error "Specify specialItemNameJa") []
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Saki", "Mai"]
      ["MixCommune_Flappy", "MixCommune_Choppy"]
      ["CureBloom","CureEgret"]
      transformationSpeech_Bloom_Egret

  , mkTransformation
      ["Saki", "Mai"]
      ["CrystalCommune_Flappy", "CrystalCommune_Choppy"]
      ["CureBright","CureWindy"]
      transformationSpeech_Bright_Windy

  ]


purifications :: [Purification]
purifications =
  [ 
  ]


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ mkNonItemPurification ["CureBloom", "CureEgret"] purificationSpeech_Bloom_Egret
  ]


