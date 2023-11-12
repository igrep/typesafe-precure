{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.SoaringSky.Profiles where

-- import           Data.String              (IsString, fromString)

import           ACME.PreCure.Index.Types

girls :: [Girl]
girls =
  [ mkGirl "Sora Harewataru" "ソラ・ハレワタール"
  , mkGirl "Mashiro Nijigaoka" "虹ヶ丘 ましろ"
  , mkGirl "Tsubasa Yuunagi" "夕凪 ツバサ"
  , mkGirl "Ageha Hijiri" "聖 あげは"
  , mkGirl "Ellee" "エル"
  ]

transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Sky"
      ""
      "キュアスカイ"
      ""
      introducesHerselfAs_Sky
  , mkTransformee
      "Cure Prism"
      ""
      "キュアプリズム"
      ""
      introducesHerselfAs_Prism
  , mkTransformee
      "Cure Wing"
      ""
      "キュアウィング"
      ""
      introducesHerselfAs_Wing
  , mkTransformee
      "Cure Butterfly"
      ""
      "キュアバタフライ"
      ""
      introducesHerselfAs_Butterfly
  , mkTransformee
      "Cure Majesty"
      ""
      "キュアマジェスティ"
      ""
      introducesHerselfAs_Majesty
  ]

transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CureSky", "CurePrism", "CureWing", "CureButterfly", "CureMajesty"] ne "" nj ""
  ]
 where
  ne = "Soaring Sky! Pretty Cure"
  nj = "ひろがるスカイ！プリキュア"

specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Sky Mirage" "スカイミラージュ"

  , mkSpecialItem "Sky Tone Sky" "スカイトーン スカイ"
  , mkSpecialItem "Sky Tone Prism" "スカイトーン プリズム"
  , mkSpecialItem "Sky Tone Wing" "スカイトーン ウィング"
  , mkSpecialItem "Sky Tone Butterfly" "スカイトーン バタフライ"
  , mkSpecialItem "Sky Tone Cure Majesty" "スカイトーン キュアマジェスティ"

  , mkSpecialItem "Sky Tone W Shining" "スカイトーン Wシャイニング"
  , mkSpecialItem "Sky Tone W Flying" "スカイトーン Wフライング"

  , mkSpecialItem "Mix Palette" "ミックスパレット"
  -- Ref. https://prettycure.fandom.com/wiki/Majestic_Chroniclon
  , mkSpecialItem "Majestic Chroniclon" "マジェスティクルニクルン"
  ]

transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Sora"]
      [mkIA "SkyMirage" ["SkyToneSky"]]
      ["CureSky"]
      ( skyMirageToneConnect
      ++ hirogaruChange "スカイ！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++ [introducesHerselfAs_Sky]
      )
  , mkTransformation
      ["Mashiro"]
      [mkIA "SkyMirage" ["SkyTonePrism"]]
      ["CurePrism"]
      ( skyMirageToneConnect
      ++ hirogaruChange "プリズム！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++ [introducesHerselfAs_Prism]
      )
  , mkTransformation
      ["Tsubasa"]
      [mkIA "SkyMirage" ["SkyToneWing"]]
      ["CureWing"]
      ( skyMirageToneConnect
      ++ hirogaruChange "ウィング！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++ [introducesHerselfAs_Wing]
      )
  , mkTransformation
      ["Ageha"]
      [mkIA "SkyMirage" ["SkyToneButterfly"]]
      ["CureButterfly"]
      ( skyMirageToneConnect
      ++ hirogaruChange "バタフライ！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++ [introducesHerselfAs_Butterfly]
      )
  , mkTransformation
      ["Ellee"]
      [mkIA "SkyMirage" ["SkyToneCureMajesty"]]
      ["CureMajesty"]
      ( skyMirageToneConnect
      ++ hirogaruChange "マジェスティ！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++ [introducesHerselfAs_Majesty]
      )

  , mkTransformation
      ["Sora", "Mashiro"]
      [mkIA "SkyMirage" ["SkyToneSky"], mkIA "SkyMirage" ["SkyTonePrism"]]
      ["CureSky", "CurePrism"]
      ( skyMirageToneConnect
      ++ hirogaruChange "スカイ！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++
        [ introducesHerselfAs_Sky
        , introducesHerselfAs_Prism
        ]
      ++ readyGoHirogaruSkyPreCure
      )

  , mkTransformation
      ["Sora", "Mashiro", "Tsubasa"]
      [ mkIA "SkyMirage" ["SkyToneSky"]
      , mkIA "SkyMirage" ["SkyTonePrism"]
      , mkIA "SkyMirage" ["SkyToneWing"]
      ]
      ["CureSky", "CurePrism", "CureWing"]
      ( skyMirageToneConnect
      ++ hirogaruChange "スカイ！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++
        [ introducesHerselfAs_Sky
        , introducesHerselfAs_Prism
        , introducesHerselfAs_Wing
        ]
      ++ readyGoHirogaruSkyPreCure
      )

  , mkTransformation
      ["Sora", "Mashiro", "Tsubasa", "Ageha"]
      [ mkIA "SkyMirage" ["SkyToneSky"]
      , mkIA "SkyMirage" ["SkyTonePrism"]
      , mkIA "SkyMirage" ["SkyToneWing"]
      , mkIA "SkyMirage" ["SkyToneButterfly"]
      ]
      ["CureSky", "CurePrism", "CureWing", "CureButterfly"]
      ( skyMirageToneConnect
      ++ hirogaruChange "スカイ！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++
        [ introducesHerselfAs_Sky
        , introducesHerselfAs_Prism
        , introducesHerselfAs_Wing
        , introducesHerselfAs_Butterfly
        ]
      ++ readyGoHirogaruSkyPreCure
      )

  , mkTransformation
      ["Mashiro", "Sora", "Tsubasa"]
      [ mkIA "SkyMirage" ["SkyTonePrism"]
      , mkIA "SkyMirage" ["SkyToneSky"]
      , mkIA "SkyMirage" ["SkyToneWing"]
      ]
      ["CurePrism", "CureSky", "CureWing"]
      ( skyMirageToneConnect
      ++ hirogaruChange "プリズム！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++
        [ introducesHerselfAs_Sky
        , introducesHerselfAs_Prism
        , introducesHerselfAs_Wing
        ]
      ++ readyGoHirogaruSkyPreCure
      )

  , mkTransformation
      ["Mashiro", "Sora", "Tsubasa", "Ageha"]
      [ mkIA "SkyMirage" ["SkyTonePrism"]
      , mkIA "SkyMirage" ["SkyToneSky"]
      , mkIA "SkyMirage" ["SkyToneWing"]
      , mkIA "SkyMirage" ["SkyToneButterfly"]
      ]
      ["CurePrism", "CureSky", "CureWing", "CureButterfly"]
      ( skyMirageToneConnect
      ++ hirogaruChange "プリズム！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++
        [ introducesHerselfAs_Sky
        , introducesHerselfAs_Prism
        , introducesHerselfAs_Wing
        , introducesHerselfAs_Butterfly
        ]
      ++ readyGoHirogaruSkyPreCure
      )

  , mkTransformation
      ["Tsubasa", "Mashiro"]
      [ mkIA "SkyMirage" ["SkyToneWing"]
      , mkIA "SkyMirage" ["SkyTonePrism"]
      ]
      ["CureWing", "CurePrism"]
      ( skyMirageToneConnect
      ++ hirogaruChange "ウィング！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++
        [ introducesHerselfAs_Prism
        , introducesHerselfAs_Wing
        ]
      )

  , mkTransformation
      ["Tsubasa", "Sora", "Mashiro"]
      [ mkIA "SkyMirage" ["SkyToneWing"]
      , mkIA "SkyMirage" ["SkyToneSky"]
      , mkIA "SkyMirage" ["SkyTonePrism"]
      ]
      ["CureWing", "CurePrism", "CureSky"]
      ( skyMirageToneConnect
      ++ hirogaruChange "ウィング！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++
        [ introducesHerselfAs_Sky
        , introducesHerselfAs_Prism
        , introducesHerselfAs_Wing
        ]
      ++ readyGoHirogaruSkyPreCure
      )

  , mkTransformation
      ["Tsubasa", "Sora", "Mashiro", "Ageha"]
      [ mkIA "SkyMirage" ["SkyToneWing"]
      , mkIA "SkyMirage" ["SkyToneSky"]
      , mkIA "SkyMirage" ["SkyTonePrism"]
      , mkIA "SkyMirage" ["SkyToneButterfly"]
      ]
      ["CureWing", "CurePrism", "CureSky", "CureButterfly"]
      ( skyMirageToneConnect
      ++ hirogaruChange "ウィング！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++
        [ introducesHerselfAs_Sky
        , introducesHerselfAs_Prism
        , introducesHerselfAs_Wing
        , introducesHerselfAs_Butterfly
        ]
      ++ readyGoHirogaruSkyPreCure
      )

  , mkTransformation
      ["Sora", "Mashiro", "Tsubasa", "Ageha", "Ellee"]
      [ mkIA "SkyMirage" ["SkyToneSky"]
      , mkIA "SkyMirage" ["SkyTonePrism"]
      , mkIA "SkyMirage" ["SkyToneWing"]
      , mkIA "SkyMirage" ["SkyToneButterfly"]
      , mkIA "SkyMirage" ["SkyToneCureMajesty"]
      ]
      ["CureSky", "CurePrism", "CureWing", "CureButterfly", "CureMajesty"]
      ( skyMirageToneConnect
      ++ hirogaruChange "スカイ！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++
        [ introducesHerselfAs_Sky
        , introducesHerselfAs_Prism
        , introducesHerselfAs_Wing
        , introducesHerselfAs_Butterfly
        , introducesHerselfAs_Majesty
        ]
      ++ readyGoHirogaruSkyPreCure
      )

  , mkTransformation
      ["Mashiro", "Sora", "Tsubasa", "Ageha", "Ellee"]
      [ mkIA "SkyMirage" ["SkyTonePrism"]
      , mkIA "SkyMirage" ["SkyToneSky"]
      , mkIA "SkyMirage" ["SkyToneWing"]
      , mkIA "SkyMirage" ["SkyToneButterfly"]
      , mkIA "SkyMirage" ["SkyToneCureMajesty"]
      ]
      ["CurePrism", "CureSky", "CureWing", "CureButterfly", "CureMajesty"]
      ( skyMirageToneConnect
      ++ hirogaruChange "プリズム！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++
        [ introducesHerselfAs_Sky
        , introducesHerselfAs_Prism
        , introducesHerselfAs_Wing
        , introducesHerselfAs_Butterfly
        , introducesHerselfAs_Majesty
        ]
      ++ readyGoHirogaruSkyPreCure
      )

  , mkTransformation
      ["Tsubasa", "Sora", "Mashiro", "Ageha", "Ellee"]
      [ mkIA "SkyMirage" ["SkyToneWing"]
      , mkIA "SkyMirage" ["SkyToneSky"]
      , mkIA "SkyMirage" ["SkyTonePrism"]
      , mkIA "SkyMirage" ["SkyToneButterfly"]
      , mkIA "SkyMirage" ["SkyToneCureMajesty"]
      ]
      ["CureWing", "CureSky", "CurePrism", "CureButterfly", "CureMajesty"]
      ( skyMirageToneConnect
      ++ hirogaruChange "ウィング！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++
        [ introducesHerselfAs_Sky
        , introducesHerselfAs_Prism
        , introducesHerselfAs_Wing
        , introducesHerselfAs_Butterfly
        , introducesHerselfAs_Majesty
        ]
      ++ readyGoHirogaruSkyPreCure
      )

  , mkTransformation
      ["Ageha", "Sora", "Mashiro", "Tsubasa", "Ellee"]
      [ mkIA "SkyMirage" ["SkyToneButterfly"]
      , mkIA "SkyMirage" ["SkyToneSky"]
      , mkIA "SkyMirage" ["SkyTonePrism"]
      , mkIA "SkyMirage" ["SkyToneWing"]
      , mkIA "SkyMirage" ["SkyToneCureMajesty"]
      ]
      ["CureButterfly", "CureSky", "CurePrism", "CureWing", "CureMajesty"]
      ( skyMirageToneConnect
      ++ hirogaruChange "バタフライ！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++
        [ introducesHerselfAs_Sky
        , introducesHerselfAs_Prism
        , introducesHerselfAs_Wing
        , introducesHerselfAs_Butterfly
        , introducesHerselfAs_Majesty
        ]
      ++ readyGoHirogaruSkyPreCure
      )

  , mkTransformation
      ["Ellee", "Sora", "Mashiro", "Tsubasa", "Ageha"]
      [ mkIA "SkyMirage" ["SkyToneCureMajesty"]
      , mkIA "SkyMirage" ["SkyToneSky"]
      , mkIA "SkyMirage" ["SkyTonePrism"]
      , mkIA "SkyMirage" ["SkyToneWing"]
      , mkIA "SkyMirage" ["SkyToneButterfly"]
      ]
      ["CureMajesty", "CureSky", "CurePrism", "CureWing", "CureButterfly"]
      ( skyMirageToneConnect
      ++ hirogaruChange "マジェスティ！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++
        [ introducesHerselfAs_Sky
        , introducesHerselfAs_Prism
        , introducesHerselfAs_Wing
        , introducesHerselfAs_Butterfly
        , introducesHerselfAs_Majesty
        ]
      ++ readyGoHirogaruSkyPreCure
      )

  , mkTransformation
      ["Ageha", "Tsubasa"]
      [ mkIA "SkyMirage" ["SkyToneButterfly"]
      , mkIA "SkyMirage" ["SkyToneWing"]
      ]
      ["CureButterfly", "CureWing"]
      ( skyMirageToneConnect
      ++ hirogaruChange "バタフライ！"
      ++ kiramekiHopSawayakaStepHarebareJump
      ++
        [ introducesHerselfAs_Wing
        , introducesHerselfAs_Butterfly
        ]
      )
  ]
 where
  skyMirageToneConnect :: [String]
  skyMirageToneConnect = ["スカイミラージュ！", "トーンコネクト！"]

  hirogaruChange :: String -> [String]
  hirogaruChange s = ["ひろがるチェンジ！", s]

  kiramekiHopSawayakaStepHarebareJump :: [String]
  kiramekiHopSawayakaStepHarebareJump =
    ["きらめきHOP！", "さわやかSTEP！", "はればれJUMP！"]

  readyGoHirogaruSkyPreCure :: [String]
  readyGoHirogaruSkyPreCure = ["Ready...", "Go!", "ひろがるスカイ！プリキュア！"]


purifications :: [Purification]
purifications =
  [ mkPurification
      ["CureSky", "CurePrism"]
      [ mkIA "SkyMirage" ["SkyToneWShining"]
      , mkIA "SkyMirage" ["SkyToneWShining"]
      ]
      [ "スカイブルー！"
      , "プリズムホワイト！"
      , "プリキュア！アップドラフト・シャイニング！"
      , "（スミキッタ～）"
      ]
  , mkPurification
      ["CureWing", "CureButterfly"]
      [ mkIA "MixPalette" ["SkyToneWFlying"]
      ]
      [ "すべての色を1つに！"
      , "ミックスパレット！"
      , "レッド！"
      , "イエロー！"
      , "ブルー！"
      , "ホワイト！"
      , "まぜまぜカラーチャージ！"
      , "プリキュア！タイタニック・レインボー！"
      , "アタック！"
      , "（スミキッタ～）"
      ]
  , mkPurification
      ["CureSky", "CurePrism", "CureWing", "CureButterfly"]
      ["MajesticChroniclon"]
      [ "マジェスティクルニクルン！"
      , "ひろがる世界にテイクオフ！"
      , "プリキュア！マジェスティック・ハレーション！"
      , "（スミキッタ～）"
      ]
  ]


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ mkNonItemPurification ["CureSky"] ["ヒ〜ロ〜ガ〜ル〜", "スカイパーンチ！", "はぁー！"]
  , mkNonItemPurification ["CurePrism"] ["ヒ〜ロ〜ガ〜ル〜", "プリズムショット！"]
  , mkNonItemPurification ["CureWing"] ["ひろがる！", "ウィングアターック！"]
  , mkNonItemPurification ["CureButterfly"] ["ひろがる！", "バタフライプレス！"]
  ]


introducesHerselfAs_Sky :: String
introducesHerselfAs_Sky = "無限にひろがる青い空！キュアスカイ！"

introducesHerselfAs_Prism :: String
introducesHerselfAs_Prism = "ふわりひろがる優しい光！キュアプリズム！"

introducesHerselfAs_Wing :: String
introducesHerselfAs_Wing = "天高くひろがる勇気！キュアウィング！"

introducesHerselfAs_Butterfly :: String
introducesHerselfAs_Butterfly = "アゲてひろがるワンダホー！キュアバタフライ！"

introducesHerselfAs_Majesty :: String
introducesHerselfAs_Majesty = "降り立つ気高き神秘！キュアマジェスティ！"
