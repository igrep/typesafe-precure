{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.GoPrincess.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.GoPrincess.Words


girls :: [Girl]
girls =
  [ mkGirl "Haruka Haruno" girlName_Haruka
  , mkGirl "Minami Kaido" girlName_Minami
  , mkGirl "Kirara Amanogawa" girlName_Kirara
  , mkGirl "Towa Akagi" girlName_Towa
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
  [ mkTransformedGroup ["CureFlora", "CureMermaid", "CureTwinkle", "CureScarlet"] "Go! Princess PreCure" "" groupName_GoPrincess ""
  , mkTransformedGroup ["CureFlora_ModeElegantRoyal", "CureMermaid_ModeElegantRoyal", "CureTwinkle_ModeElegantRoyal", "CureScarlet_ModeElegantRoyal"] "Go! Princess PreCure" "Mode Elegant Royal" groupName_GoPrincess variation_ModeElegantRoyal
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Princess Perfume" "プリンセスパフューム" ["DressUpKey"]
  , mkSpecialItem "Crystal Princess Rod" "クリスタルプリンセスロッド" ["DressUpKey"]
  , mkSpecialItem "Scarlet Violin" "スカーレットバイオリン" ["DressUpKey"]
  , mkSpecialItem "Music Princess Palace" "ミュージックプリンセスパレス" ["DressUpKey"]
  , mkSpecialItem "Dress Up Key Flora" "ドレスアップキー・フローラ" []
  , mkSpecialItem "Dress Up Key Rose" "ドレスアップキー・ローズ"  []
  , mkSpecialItem "Dress Up Key Lily" "ドレスアップキー・リリィ"  []
  , mkSpecialItem "Dress Up Key Sakura" "ドレスアップキー・サクラ"  []
  , mkSpecialItem "Dress Up Key Mermaid" "ドレスアップキー・マーメイド"  []
  , mkSpecialItem "Dress Up Key Ice" "ドレスアップキー・アイス"  []
  , mkSpecialItem "Dress Up Key Bubble" "ドレスアップキー・バブル"  []
  , mkSpecialItem "Dress Up Key Sango" "ドレスアップキー・サンゴ"  []
  , mkSpecialItem "Dress Up Key Twinkle" "ドレスアップキー・トゥインクル"  []
  , mkSpecialItem "Dress Up Key Luna" "ドレスアップキー・ルナ"   []
  , mkSpecialItem "Dress Up Key ShootingStar" "ドレスアップキー・シューティングスター" []
  , mkSpecialItem "Dress Up Key Ginga" "ドレスアップキー・ギンガ" []
  , mkSpecialItem "Dress Up Key Scarlet" "ドレスアップキー・スカーレット" []
  , mkSpecialItem "Dress Up Key Phoenix" "ドレスアップキー・フェニックス" []
  , mkSpecialItem "Dress Up Key Hanabi" "ドレスアップキー・ハナビ" []
  , mkSpecialItem "Dress Up Key Sun" "ドレスアップキー・サン" []
  , mkSpecialItem "Royal Dress Up Key" "ロイヤルドレスアップキー" []
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Haruka"]
      [mkIA "PrincessPerfume" ["DressUpKeyFlora"]]
      ["CureFlora"]
      transformationSpeech_Flora

  , mkTransformation
      ["Minami"]
      [mkIA "PrincessPerfume" ["DressUpKeyMermaid"]]
      ["CureMermaid"]
      transformationSpeech_Mermaid

  , mkTransformation
      ["Kirara"]
      [mkIA "PrincessPerfume" ["DressUpKeyTwinkle"]]
      ["CureTwinkle"]
      transformationSpeech_Twinkle

  , mkTransformation
      ["Towa"]
      [mkIA "PrincessPerfume" ["DressUpKeyScarlet"]]
      ["CureScarlet"]
      transformationSpeech_Scarlet

  , mkTransformation
      ["CureFlora"]
      [mkIA "PrincessPerfume" ["DressUpKeyFlora"]]
      ["CureFlora_ModeElegant"]
      transformationSpeech_GoPrincess_ModeElegant

  , mkTransformation
      ["CureMermaid"]
      [mkIA "PrincessPerfume" ["DressUpKeyMermaid"]]
      ["CureMermaid_ModeElegant"]
      transformationSpeech_GoPrincess_ModeElegant

  , mkTransformation
      ["CureTwinkle"]
      [mkIA "PrincessPerfume" ["DressUpKeyTwinkle"]]
      ["CureTwinkle_ModeElegant"]
      transformationSpeech_GoPrincess_ModeElegant

  , mkTransformation
      ["CureScarlet"]
      [mkIA "PrincessPerfume" ["DressUpKeyPhoenix"]]
      ["CureScarlet_ModeElegant"]
      transformationSpeech_GoPrincess_ModeElegant

  , mkTransformation
      ["Haruka", "Minami", "Kirara"]
      [mkIA "PrincessPerfume" ["DressUpKeyFlora"], mkIA "PrincessPerfume" ["DressUpKeyMermaid"], mkIA "PrincessPerfume" ["DressUpKeyTwinkle"]]
      ["CureFlora","CureMermaid","CureTwinkle"]
      transformationSpeech_Flora_Mermaid_Twinkle

  , mkTransformation
      ["Haruka", "Minami", "Kirara", "Towa"]
      [mkIA "PrincessPerfume" ["DressUpKeyFlora"], mkIA "PrincessPerfume" ["DressUpKeyMermaid"], mkIA "PrincessPerfume" ["DressUpKeyTwinkle"], mkIA "PrincessPerfume" ["DressUpKeyScarlet"]]
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
      [mkIA "CrystalPrincessRod" ["DressUpKeyRose"]]
      purificationSpeech_Flora_Rose

  , mkPurification
      ["CureFlora"]
      [mkIA "CrystalPrincessRod" ["DressUpKeyLily"]]
      purificationSpeech_Flora_Lily

  , mkPurification
      ["CureFlora"]
      [mkIA "MusicPrincessPalace" ["DressUpKeySakura"]]
      purificationSpeech_Flora_Sakura

  , mkPurification
      ["CureMermaid"]
      [mkIA "CrystalPrincessRod" ["DressUpKeyIce"]]
      purificationSpeech_Mermaid_Ice

  , mkPurification
      ["CureMermaid"]
      [mkIA "CrystalPrincessRod" ["DressUpKeyBubble"]]
      purificationSpeech_Mermaid_Bubble

  , mkPurification
      ["CureMermaid"]
      [mkIA "MusicPrincessPalace" ["DressUpKeySango"]]
      purificationSpeech_Mermaid_Sango

  , mkPurification
      ["CureTwinkle"]
      [mkIA "CrystalPrincessRod" ["DressUpKeyLuna"]]
      purificationSpeech_Twinkle_Luna

  , mkPurification
      ["CureTwinkle"]
      [mkIA "CrystalPrincessRod" ["DressUpKeyShootingStar"]]
      purificationSpeech_Twinkle_ShootingStar

  , mkPurification
      ["CureTwinkle"]
      [mkIA "MusicPrincessPalace" ["DressUpKeyGinga"]]
      purificationSpeech_Twinkle_Ginga

  , mkPurification
      ["CureScarlet_ModeElegant"]
      [mkIA "ScarletViolin" ["DressUpKeyPhoenix"]]
      purificationSpeech_Scarlet_Phoenix

  , mkPurification
      ["CureScarlet"]
      [mkIA "ScarletViolin" ["DressUpKeyScarlet"]]
      purificationSpeech_Scarlet

  , mkPurification
      ["CureScarlet"]
      [mkIA "ScarletViolin" ["DressUpKeyHanabi"]]
      purificationSpeech_Scarlet_Hanabi

  , mkPurification
      ["CureScarlet"]
      [mkIA "MusicPrincessPalace" ["DressUpKeySun"]]
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
