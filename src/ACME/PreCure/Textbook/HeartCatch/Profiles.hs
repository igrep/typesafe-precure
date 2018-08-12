{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.HeartCatch.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.HeartCatch.Words


girls :: [Girl]
girls =
  [ mkGirl "Tsubomi Hanasaki" girlName_Tsubomi
  , mkGirl "Erika Kurumi" girlName_Erika
  , mkGirl "Itsuki Myodoin" girlName_Itsuki
  , mkGirl "Yuri Tsukikage" girlName_Yuri
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
  [ mkSpecialItem "Heart Perfume" "ココロパフューム" ["PreCureSeed"]
  , mkSpecialItem "Shiny Perfume" "シャイニーパフューム" ["PreCureSeed"]
  , mkSpecialItem "Heart Pot" "ココロポット" ["PreCureSeed"]
  , mkSpecialItem "PreCure Seed" "プリキュアの種" []
  , mkSpecialItem "Blossom Takt" "ブロッサムタクト" []
  , mkSpecialItem "Marine Takt" "マリンタクト" []
  , mkSpecialItem "Shiny Tambourine" "シャイニータンバリン" []
  , mkSpecialItem "Moon Takt" "ムーンタクト" []
  , mkSpecialItem "Heart Catch Mirage" "ハートキャッチミラージュ" ["SuperPreCureSeed"]
  , mkSpecialItem "Super PreCure Seed" "スーパープリキュアの種" []
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Tsubomi"]
      [mkIA "HeartPerfume" ["PreCureSeed"]]
      ["CureBlossom"]
      transformationSpeech_Blossom

  , mkTransformation
      ["Erika"]
      [mkIA "HeartPerfume" ["PreCureSeed"]]
      ["CureMarine"]
      transformationSpeech_Marine

  , mkTransformation
      ["Itsuki"]
      [mkIA "ShinyPerfume" ["PreCureSeed"]]
      ["CureSunshine"]
      transformationSpeech_Sunshine

  , mkTransformation
      ["Yuri"]
      [mkIA "HeartPot" ["PreCureSeed"]]
      ["CureMoonlight"]
      transformationSpeech_Moonlight

  , mkTransformation
      ["Tsubomi", "Erika", "Itsuki", "Yuri"]
      [mkIA "HeartPerfume" ["PreCureSeed"], mkIA "HeartPerfume" ["PreCureSeed"], mkIA "ShinyPerfume" ["PreCureSeed"], mkIA "HeartPot" ["PreCureSeed"]]
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
