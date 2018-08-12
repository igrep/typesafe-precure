{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.HeartCatch.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.HeartCatch.Words


girls :: [Girl]
girls =
  [ mkGirl ("Tsubomi" ++ error "Need family name!") girlName_Tsubomi
  , mkGirl ("Erika" ++ error "Need family name!") girlName_Erika
  , mkGirl ("Itsuki" ++ error "Need family name!") girlName_Itsuki
  , mkGirl ("Yuri" ++ error "Need family name!") girlName_Yuri
  ]


transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Blossom"
      ""
      cureName_Blossom
      ""
      introducesHerselfAs_Blossom

  , mkTransformee
      "Cure Marine"
      ""
      cureName_Marine
      ""
      introducesHerselfAs_Marine

  , mkTransformee
      "Cure Sunshine"
      ""
      cureName_Sunshine
      ""
      introducesHerselfAs_Sunshine

  , mkTransformee
      "Cure Moonlight"
      ""
      cureName_Moonlight
      ""
      introducesHerselfAs_Moonlight

  , mkTransformee
      "Super Cure Blossom"
      ""
      cureName_Blossom
      variation_SuperBlossom
      "introducesHerselfAs_Blossom"

  , mkTransformee
      "Super Cure Marine"
      ""
      cureName_Marine
      variation_SuperMarine
      "introducesHerselfAs_Marine"

  , mkTransformee
      "Super Cure Sunshine"
      ""
      cureName_Sunshine
      variation_SuperSunshine
      "introducesHerselfAs_Sunshine"

  , mkTransformee
      "Super Cure Moonlight"
      ""
      cureName_Moonlight
      variation_SuperMoonlight
      "introducesHerselfAs_Moonlight"

  ]


transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CureBlossom", "CureMarine", "CureSunshine", "CureMoonlight"] "Heart Catch" "" groupName_HeartCatch ""
  , mkTransformedGroup ["SuperCureBlossom", "SuperCureMarine", "SuperCureSunshine", "SuperCureMoonlight"] "Heart Catch" "Super Silhouette" groupName_HeartCatch variation_SuperSilhouette
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "HeartPerfume" (error "Specify specialItemNameJa") ["hs"]
  , mkSpecialItem "ShinyPerfume" (error "Specify specialItemNameJa") ["hs"]
  , mkSpecialItem "HeartPot" (error "Specify specialItemNameJa") ["hs"]
  , mkSpecialItem "HeartSeed" (error "Specify specialItemNameJa") []
  , mkSpecialItem "BlossomTakt" (error "Specify specialItemNameJa") []
  , mkSpecialItem "MarineTakt" (error "Specify specialItemNameJa") []
  , mkSpecialItem "ShinyTambourine" (error "Specify specialItemNameJa") []
  , mkSpecialItem "MoonTakt" (error "Specify specialItemNameJa") []
  , mkSpecialItem "HeartCatchMirage" (error "Specify specialItemNameJa") ["sps"]
  , mkSpecialItem "SuperPreCureSeed" (error "Specify specialItemNameJa") []
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Tsubomi"]
      [mkIA "HeartPerfume" ["HeartSeed"]]
      ["CureBlossom"]
      transformationSpeech_Blossom

  , mkTransformation
      ["Erika"]
      [mkIA "HeartPerfume" ["HeartSeed"]]
      ["CureMarine"]
      transformationSpeech_Marine

  , mkTransformation
      ["Itsuki"]
      [mkIA "ShinyPerfume" ["HeartSeed"]]
      ["CureSunshine"]
      transformationSpeech_Sunshine

  , mkTransformation
      ["Yuri"]
      [mkIA "HeartPot" ["HeartSeed"]]
      ["CureMoonlight"]
      transformationSpeech_Moonlight

  , mkTransformation
      ["Tsubomi", "Erika", "Itsuki", "Yuri"]
      [mkIA "HeartPerfume" ["HeartSeed"], mkIA "HeartPerfume" ["HeartSeed"], mkIA "ShinyPerfume" ["HeartSeed"], mkIA "HeartPot" ["HeartSeed"]]
      ["CureBlossom","CureMarine","CureSunshine","CureMoonlight"]
      transformationSpeech_HeartCatch

  , mkTransformation
      ["CureBlossom", "CureMarine", "CureSunshine", "CureMoonlight"]
      [mkIA "HeartCatchMirage" ["SuperPreCureSeed"]]
      ["SuperCureBlossom","SuperCureMarine","SuperCureSunshine","SuperCureMoonlight"]
      transformationSpeech_HeartCatch_SuperSilhouette

  ]


purifications :: [Purification]
purifications =
  [ mkPurification
      ["CureBlossom"]
      ["BlossomTakt"]
      purificationSpeech_Blossom

  , mkPurification
      ["CureMarine"]
      ["MarineTakt"]
      purificationSpeech_Marine

  , mkPurification
      ["CureSunshine"]
      ["ShinyTambourine"]
      purificationSpeech_Sunshine

  , mkPurification
      ["CureMoonlight"]
      ["MoonTakt"]
      purificationSpeech_Moonlight

  , mkPurification
      ["CureBlossom", "CureMarine", "CureSunshine", "CureMoonlight"]
      [mkIA "HeartCatchMirage" ["SuperPreCureSeed"]]
      purificationSpeech_HeartCatch_SuperSilhouette

  ]


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ 
  ]


