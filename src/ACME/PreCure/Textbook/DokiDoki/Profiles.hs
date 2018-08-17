{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.DokiDoki.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.DokiDoki.Words


girls :: [Girl]
girls =
  [ mkGirl "Mana Aida" girlName_Mana
  , mkGirl "Rikka Hishikawa" girlName_Rikka
  , mkGirl "Alice Yotsuba" girlName_Alice
  , mkGirl "Makoto Kenzaki" girlName_Makoto
  , mkGirl "Aguri Madoka" girlName_Aguri
  ]


transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Heart"
      ""
      cureName_Heart
      ""
      introducesHerselfAs_Heart

  , mkTransformee
      "Cure Diamond"
      ""
      cureName_Diamond
      ""
      introducesHerselfAs_Diamond

  , mkTransformee
      "Cure Rosetta"
      ""
      cureName_Rosetta
      ""
      introducesHerselfAs_Rosetta

  , mkTransformee
      "Cure Sword"
      ""
      cureName_Sword
      ""
      introducesHerselfAs_Sword

  , mkTransformee
      "Cure Ace"
      ""
      cureName_Ace
      ""
      introducesHerselfAs_Ace
  ]


transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CureHeart", "CureDiamond", "CureRosetta", "CureSword", "CureAce"] "DokiDoki! PreCure" "" groupName_Dokidoki ""
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Lovely Commune Sharuru" "ラブリーコミューン（シャルル）" ["Cure Loveads"]
  , mkSpecialItem "Lovely Commune Raquel" "ラブリーコミューン（ラケル）" ["Cure Loveads"]
  , mkSpecialItem "Lovely Commune Lance" "ラブリーコミューン（ランス）" ["Cure Loveads"]
  , mkSpecialItem "Lovely Commune Davi" "ラブリーコミューン（ダビィ）"  ["Cure Loveads"]
  , mkSpecialItem "Love Eyes Palette" "ラブアイズパレット" ["Cure Loveads"]
  , mkSpecialItem "Cure Loveads" "キュアラビーズ" []
  , mkSpecialItem "Love Kiss Rouge" "ラブキッスルージュ" []
  , mkSpecialItem "MagicalLovely Harp" "マジカルラブリーハープ" ["Cure Loveads"]
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Mana"]
      [mkIA "LovelyCommuneSharuru" ["CureLoveads"]]
      ["CureHeart"]
      transformationSpeech_Heart

  , mkTransformation
      ["Rikka"]
      [mkIA "LovelyCommuneRaquel" ["CureLoveads"]]
      ["CureDiamond"]
      transformationSpeech_Diamond

  , mkTransformation
      ["Alice"]
      [mkIA "LovelyCommuneLance" ["CureLoveads"]]
      ["CureRosetta"]
      transformationSpeech_Rosetta

  , mkTransformation
      ["Makoto"]
      [mkIA "LovelyCommuneDavi" ["CureLoveads"]]
      ["CureSword"]
      transformationSpeech_Sword

  , mkTransformation
      ["Aguri"]
      [mkIA "LoveEyesPalette" ["CureLoveads"]]
      ["CureAce"]
      transformationSpeech_Ace

  , mkTransformation
      ["Mana", "Rikka", "Alice", "Makoto"]
      [mkIA "LovelyCommuneSharuru" ["CureLoveads"], mkIA "LovelyCommuneRaquel" ["CureLoveads"], mkIA "LovelyCommuneLance" ["CureLoveads"], mkIA "LovelyCommuneDavi" ["CureLoveads"]]
      ["CureHeart","CureDiamond","CureRosetta","CureSword"]
      transformationSpeech_Dokidoki_Heart_Diamond_Rosetta_Sword

  , mkTransformation
      ["Mana", "Rikka", "Alice", "Makoto", "Aguri"]
      [mkIA "LovelyCommuneSharuru" ["CureLoveads"], mkIA "LovelyCommuneRaquel" ["CureLoveads"], mkIA "LovelyCommuneLance" ["CureLoveads"], mkIA "LovelyCommuneDavi" ["CureLoveads"], mkIA "LoveEyesPalette" ["CureLoveads"]]
      ["CureHeart","CureDiamond","CureRosetta","CureSword","CureAce"]
      transformationSpeech_Dokidoki
  ]


purifications :: [Purification]
purifications =
  [ mkPurification
      ["CureHeart"]
      [mkIA "LovelyCommuneSharuru" ["CureLoveads"]]
      purificationSpeech_Heart

  , mkPurification
      ["CureDiamond"]
      [mkIA "LovelyCommuneRaquel" ["CureLoveads"]]
      purificationSpeech_Diamond

  , mkPurification
      ["CureRosetta"]
      [mkIA "LovelyCommuneLance" ["CureLoveads"]]
      purificationSpeech_Rosetta

  , mkPurification
      ["CureSword"]
      [mkIA "LovelyCommuneDavi" ["CureLoveads"]]
      purificationSpeech_Sword

  , mkPurification
      ["CureAce"]
      ["LoveKissRouge"]
      purificationSpeech_Ace

  , mkPurification
      ["CureHeart", "CureDiamond", "CureRosetta", "CureSword", "CureAce"]
      [mkIA "MagicalLovelyHarp" ["CureLoveads"]]
      purificationSpeech_Dokidoki
  ]
