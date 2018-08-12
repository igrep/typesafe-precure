{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.Dokidoki.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.Dokidoki.Words


girls :: [Girl]
girls =
  [ mkGirl ("Mana" ++ error "Need family name!") girlName_Mana
  , mkGirl ("Rikka" ++ error "Need family name!") girlName_Rikka
  , mkGirl ("Alice" ++ error "Need family name!") girlName_Alice
  , mkGirl ("Makoto" ++ error "Need family name!") girlName_Makoto
  , mkGirl ("Aguri" ++ error "Need family name!") girlName_Aguri
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
  [ mkTransformedGroup ["CureHeart", "CureDiamond", "CureRosetta", "CureSword", "CureAce"] "Dokidoki" "" groupName_Dokidoki ""
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "LovelyCommune_Sharuru" (error "Specify specialItemNameJa") ["cl"]
  , mkSpecialItem "LovelyCommune_Raquel" (error "Specify specialItemNameJa") ["cl"]
  , mkSpecialItem "LovelyCommune_Lance" (error "Specify specialItemNameJa") ["cl"]
  , mkSpecialItem "LovelyCommune_Davi" (error "Specify specialItemNameJa") ["cl"]
  , mkSpecialItem "LoveEyesPalette" (error "Specify specialItemNameJa") ["cl"]
  , mkSpecialItem "CureLoveads" (error "Specify specialItemNameJa") []
  , mkSpecialItem "LoveKissRouge" (error "Specify specialItemNameJa") []
  , mkSpecialItem "MagicalLovelyHarp" (error "Specify specialItemNameJa") ["cl"]
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Mana"]
      [mkIA "LovelyCommune_Sharuru" ["CureLoveads"]]
      ["CureHeart"]
      transformationSpeech_Heart

  , mkTransformation
      ["Rikka"]
      [mkIA "LovelyCommune_Raquel" ["CureLoveads"]]
      ["CureDiamond"]
      transformationSpeech_Diamond

  , mkTransformation
      ["Alice"]
      [mkIA "LovelyCommune_Lance" ["CureLoveads"]]
      ["CureRosetta"]
      transformationSpeech_Rosetta

  , mkTransformation
      ["Makoto"]
      [mkIA "LovelyCommune_Davi" ["CureLoveads"]]
      ["CureSword"]
      transformationSpeech_Sword

  , mkTransformation
      ["Aguri"]
      [mkIA "LoveEyesPalette" ["CureLoveads"]]
      ["CureAce"]
      transformationSpeech_Ace

  , mkTransformation
      ["Mana", "Rikka", "Alice", "Makoto"]
      [mkIA "LovelyCommune_Sharuru" ["CureLoveads"], mkIA "LovelyCommune_Raquel" ["CureLoveads"], mkIA "LovelyCommune_Lance" ["CureLoveads"], mkIA "LovelyCommune_Davi" ["CureLoveads"]]
      ["CureHeart","CureDiamond","CureRosetta","CureSword"]
      transformationSpeech_Dokidoki_Heart_Diamond_Rosetta_Sword

  , mkTransformation
      ["Mana", "Rikka", "Alice", "Makoto", "Aguri"]
      [mkIA "LovelyCommune_Sharuru" ["CureLoveads"], mkIA "LovelyCommune_Raquel" ["CureLoveads"], mkIA "LovelyCommune_Lance" ["CureLoveads"], mkIA "LovelyCommune_Davi" ["CureLoveads"], mkIA "LoveEyesPalette" ["CureLoveads"]]
      ["CureHeart","CureDiamond","CureRosetta","CureSword","CureAce"]
      transformationSpeech_Dokidoki

  ]


purifications :: [Purification]
purifications =
  [ mkPurification
      ["CureHeart"]
      [mkIA "LovelyCommune_Sharuru" ["CureLoveads"]]
      purificationSpeech_Heart

  , mkPurification
      ["CureDiamond"]
      [mkIA "LovelyCommune_Raquel" ["CureLoveads"]]
      purificationSpeech_Diamond

  , mkPurification
      ["CureRosetta"]
      [mkIA "LovelyCommune_Lance" ["CureLoveads"]]
      purificationSpeech_Rosetta

  , mkPurification
      ["CureSword"]
      [mkIA "LovelyCommune_Davi" ["CureLoveads"]]
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


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ 
  ]


