{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.GoPrincess.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.GoPrincess.Words


girls :: [Girl]
girls =
  [ mkGirl ("Haruka" ++ error "Need family name!") girlName_Haruka
  , mkGirl ("Minami" ++ error "Need family name!") girlName_Minami
  , mkGirl ("Kirara" ++ error "Need family name!") girlName_Kirara
  , mkGirl ("Towa" ++ error "Need family name!") girlName_Towa
  ]


transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Flora"
      ""
      cureName_Flora
      ""
      introducesHerselfAs_Flora

  , mkTransformee
      "Cure Mermaid"
      ""
      cureName_Mermaid
      ""
      introducesHerselfAs_Mermaid

  , mkTransformee
      "Cure Twinkle"
      ""
      cureName_Twinkle
      ""
      introducesHerselfAs_Twinkle

  , mkTransformee
      "Cure Scarlet"
      ""
      cureName_Scarlet
      ""
      introducesHerselfAs_Scarlet

  , mkTransformee
      "Cure Flora"
      "Mode Elegant"
      cureName_Flora
      variation_ModeElegant
      "introducesHerselfAs_Flora"

  , mkTransformee
      "Cure Mermaid"
      "Mode Elegant"
      cureName_Mermaid
      variation_ModeElegant
      "introducesHerselfAs_Mermaid"

  , mkTransformee
      "Cure Twinkle"
      "Mode Elegant"
      cureName_Twinkle
      variation_ModeElegant
      "introducesHerselfAs_Twinkle"

  , mkTransformee
      "Cure Scarlet"
      "Mode Elegant"
      cureName_Scarlet
      variation_ModeElegant
      "introducesHerselfAs_Scarlet"

  , mkTransformee
      "Cure Flora"
      "Mode Elegant Royal"
      cureName_Flora
      variation_ModeElegantRoyal
      "introducesHerselfAs_Flora"

  , mkTransformee
      "Cure Mermaid"
      "Mode Elegant Royal"
      cureName_Mermaid
      variation_ModeElegantRoyal
      "introducesHerselfAs_Mermaid"

  , mkTransformee
      "Cure Twinkle"
      "Mode Elegant Royal"
      cureName_Twinkle
      variation_ModeElegantRoyal
      "introducesHerselfAs_Twinkle"

  , mkTransformee
      "Cure Scarlet"
      "Mode Elegant Royal"
      cureName_Scarlet
      variation_ModeElegantRoyal
      "introducesHerselfAs_Scarlet"

  ]


transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CureFlora", "CureMermaid", "CureTwinkle", "CureScarlet"] "Go Princess" "" groupName_GoPrincess ""
  , mkTransformedGroup ["CureFlora_ModeElegantRoyal", "CureMermaid_ModeElegantRoyal", "CureTwinkle_ModeElegantRoyal", "CureScarlet_ModeElegantRoyal"] "Go Princess" "Mode Elegant Royal" groupName_GoPrincess variation_ModeElegantRoyal
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "PrincessPerfume" (error "Specify specialItemNameJa") ["dk"]
  , mkSpecialItem "CrystalPrincessRod" (error "Specify specialItemNameJa") ["dk"]
  , mkSpecialItem "ScarletViolin" (error "Specify specialItemNameJa") ["dk"]
  , mkSpecialItem "MusicPrincessPalace" (error "Specify specialItemNameJa") ["dk"]
  , mkSpecialItem "DressUpKey_Flora" (error "Specify specialItemNameJa") []
  , mkSpecialItem "DressUpKey_Rose" (error "Specify specialItemNameJa") []
  , mkSpecialItem "DressUpKey_Lily" (error "Specify specialItemNameJa") []
  , mkSpecialItem "DressUpKey_Sakura" (error "Specify specialItemNameJa") []
  , mkSpecialItem "DressUpKey_Mermaid" (error "Specify specialItemNameJa") []
  , mkSpecialItem "DressUpKey_Ice" (error "Specify specialItemNameJa") []
  , mkSpecialItem "DressUpKey_Bubble" (error "Specify specialItemNameJa") []
  , mkSpecialItem "DressUpKey_Sango" (error "Specify specialItemNameJa") []
  , mkSpecialItem "DressUpKey_Twinkle" (error "Specify specialItemNameJa") []
  , mkSpecialItem "DressUpKey_Luna" (error "Specify specialItemNameJa") []
  , mkSpecialItem "DressUpKey_ShootingStar" (error "Specify specialItemNameJa") []
  , mkSpecialItem "DressUpKey_Ginga" (error "Specify specialItemNameJa") []
  , mkSpecialItem "DressUpKey_Scarlet" (error "Specify specialItemNameJa") []
  , mkSpecialItem "DressUpKey_Phoenix" (error "Specify specialItemNameJa") []
  , mkSpecialItem "DressUpKey_Hanabi" (error "Specify specialItemNameJa") []
  , mkSpecialItem "DressUpKey_Sun" (error "Specify specialItemNameJa") []
  , mkSpecialItem "RoyalDressUpKey" (error "Specify specialItemNameJa") []
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Haruka"]
      [mkIA "PrincessPerfume" ["DressUpKey_Flora"]]
      ["CureFlora"]
      transformationSpeech_Flora

  , mkTransformation
      ["Minami"]
      [mkIA "PrincessPerfume" ["DressUpKey_Mermaid"]]
      ["CureMermaid"]
      transformationSpeech_Mermaid

  , mkTransformation
      ["Kirara"]
      [mkIA "PrincessPerfume" ["DressUpKey_Twinkle"]]
      ["CureTwinkle"]
      transformationSpeech_Twinkle

  , mkTransformation
      ["Towa"]
      [mkIA "PrincessPerfume" ["DressUpKey_Scarlet"]]
      ["CureScarlet"]
      transformationSpeech_Scarlet

  , mkTransformation
      ["CureFlora"]
      [mkIA "PrincessPerfume" ["DressUpKey_Flora"]]
      ["CureFlora_ModeElegant"]
      transformationSpeech_GoPrincess_ModeElegant

  , mkTransformation
      ["CureMermaid"]
      [mkIA "PrincessPerfume" ["DressUpKey_Mermaid"]]
      ["CureMermaid_ModeElegant"]
      transformationSpeech_GoPrincess_ModeElegant

  , mkTransformation
      ["CureTwinkle"]
      [mkIA "PrincessPerfume" ["DressUpKey_Twinkle"]]
      ["CureTwinkle_ModeElegant"]
      transformationSpeech_GoPrincess_ModeElegant

  , mkTransformation
      ["CureScarlet"]
      [mkIA "PrincessPerfume" ["DressUpKey_Phoenix"]]
      ["CureScarlet_ModeElegant"]
      transformationSpeech_GoPrincess_ModeElegant

  , mkTransformation
      ["Haruka", "Minami", "Kirara"]
      [mkIA "PrincessPerfume" ["DressUpKey_Flora"], mkIA "PrincessPerfume" ["DressUpKey_Mermaid"], mkIA "PrincessPerfume" ["DressUpKey_Twinkle"]]
      ["CureFlora","CureMermaid","CureTwinkle"]
      transformationSpeech_Flora_Mermaid_Twinkle

  , mkTransformation
      ["Haruka", "Minami", "Kirara", "Towa"]
      [mkIA "PrincessPerfume" ["DressUpKey_Flora"], mkIA "PrincessPerfume" ["DressUpKey_Mermaid"], mkIA "PrincessPerfume" ["DressUpKey_Twinkle"], mkIA "PrincessPerfume" ["DressUpKey_Scarlet"]]
      ["CureFlora","CureMermaid","CureTwinkle","CureScarlet"]
      transformationSpeech_GoPrincess

  , mkTransformation
      ["CureFlora", "CureMermaid", "CureTwinkle", "CureScarlet"]
      [mkIA "MusicPrincessPalace" ["RoyalDressUpKey"]]
      ["CureFlora_ModeElegantRoyal","CureMermaid_ModeElegantRoyal","CureTwinkle_ModeElegantRoyal","CureScarlet_ModeElegantRoyal"]
      transformationSpeech_GoPrincess_ModeElegantRoyal

  ]


purifications :: [Purification]
purifications =
  [ mkPurification
      ["CureFlora"]
      [mkIA "CrystalPrincessRod" ["DressUpKey_Rose"]]
      purificationSpeech_Flora_Rose

  , mkPurification
      ["CureFlora"]
      [mkIA "CrystalPrincessRod" ["DressUpKey_Lily"]]
      purificationSpeech_Flora_Lily

  , mkPurification
      ["CureFlora"]
      [mkIA "MusicPrincessPalace" ["DressUpKey_Sakura"]]
      purificationSpeech_Flora_Sakura

  , mkPurification
      ["CureMermaid"]
      [mkIA "CrystalPrincessRod" ["DressUpKey_Ice"]]
      purificationSpeech_Mermaid_Ice

  , mkPurification
      ["CureMermaid"]
      [mkIA "CrystalPrincessRod" ["DressUpKey_Bubble"]]
      purificationSpeech_Mermaid_Bubble

  , mkPurification
      ["CureMermaid"]
      [mkIA "MusicPrincessPalace" ["DressUpKey_Sango"]]
      purificationSpeech_Mermaid_Sango

  , mkPurification
      ["CureTwinkle"]
      [mkIA "CrystalPrincessRod" ["DressUpKey_Luna"]]
      purificationSpeech_Twinkle_Luna

  , mkPurification
      ["CureTwinkle"]
      [mkIA "CrystalPrincessRod" ["DressUpKey_ShootingStar"]]
      purificationSpeech_Twinkle_ShootingStar

  , mkPurification
      ["CureTwinkle"]
      [mkIA "MusicPrincessPalace" ["DressUpKey_Ginga"]]
      purificationSpeech_Twinkle_Ginga

  , mkPurification
      ["CureScarlet_ModeElegant"]
      [mkIA "ScarletViolin" ["DressUpKey_Phoenix"]]
      purificationSpeech_Scarlet_Phoenix

  , mkPurification
      ["CureScarlet"]
      [mkIA "ScarletViolin" ["DressUpKey_Scarlet"]]
      purificationSpeech_Scarlet

  , mkPurification
      ["CureScarlet"]
      [mkIA "ScarletViolin" ["DressUpKey_Hanabi"]]
      purificationSpeech_Scarlet_Hanabi

  , mkPurification
      ["CureScarlet"]
      [mkIA "MusicPrincessPalace" ["DressUpKey_Sun"]]
      purificationSpeech_Scarlet_Sun

  , mkPurification
      ["CureFlora_ModeElegantRoyal", "CureMermaid_ModeElegantRoyal", "CureTwinkle_ModeElegantRoyal", "CureScarlet_ModeElegantRoyal"]
      [mkIA "MusicPrincessPalace" ["RoyalDressUpKey"]]
      purificationSpeech_GoPrincess_ModeElegantRoyal

  ]


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ mkNonItemPurification ["CureFlora_ModeElegant"] purificationSpeech_Flora
  , mkNonItemPurification ["CureMermaid_ModeElegant"] purificationSpeech_Mermaid
  , mkNonItemPurification ["CureTwinkle_ModeElegant"] purificationSpeech_Twinkle
  ]


