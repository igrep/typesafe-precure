{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.DeliciousParty.Profiles where

import           Data.String              (IsString, fromString)

import           ACME.PreCure.Index.Types

girls :: [Girl]
girls =
  [ mkGirl "Yui Nagomi" "和実 ゆい"
  , mkGirl "Kokone Fuwa"  "芙羽 ここね"
  , mkGirl "Ran Hanamichi"  "華満 らん"
  ]

transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Precious"
      ""
      "キュアプレシャス"
      ""
      introducesHerselfAs_CurePrecious
  , mkTransformee
      "Cure Spicy"
      ""
      "キュアスパイシー"
      ""
      introducesHerselfAs_CureSpicy
  , mkTransformee
      "Cure Yum-Yum"
      ""
      "キュアヤムヤム"
      ""
      introducesHerselfAs_CureYumYum
  ]

transformedGroups :: [TransformedGroup]
transformedGroups =
    [ mkTransformedGroup groupMembers1 ne "" nj ""
    ]
  where
    ne = "Delicious Party♡PreCure"
    nj = "デリシャスパーティ♡プリキュア"


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Heart Cure Watch" "ハートキュアウォッチ"

  , mkSpecialItem "Kome-Kome"  "コメコメ"
  , mkSpecialItem "Pam-Pam"  "パムパム"
  , mkSpecialItem "Mem-Mem" "メンメン"

  , mkSpecialItem "Heart Juicy Mixer"  "ハートジューシーミキサー"
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Yui"]
      ["KomeKome"]
      ["CurePrecious"]
      ( "（コメ！）"
      : preCureDeliciouStan'ByPartyGo
      ++ nigiNigiKomeKomeHeartWoKomeKome
      ++ [sharin'Energy, kome_, komeKome, introducesHerselfAs_CurePrecious]
      )
  , mkTransformation
      ["Kokone"]
      ["PamPam"]
      ["CureSpicy"]
      ( "（パム！）"
      : preCureDeliciouStan'ByPartyGo
      ++ openPamPamSandPamPam
      ++ [sharin'Energy, tasty, pamPam, introducesHerselfAs_CureSpicy]
      )
  , mkTransformation
      ["Ran"]
      ["MemMem"]
      ["CureYumYum"]
      ( "（メーン！）"
      : preCureDeliciouStan'ByPartyGo
      ++ kuruKuruMemMemMiracleMemMem
      ++ [sharin'Energy, wonton, memMem, introducesHerselfAs_CureYumYum]
      )

  , mkTransformation
      ["Yui", "Kokone"]
      ["KomeKome", "PamPam"]
      ["CurePrecious", "CureSpicy"]
      ( preCureDeliciouStan'ByPartyGo
      ++ nigiNigiKomeKomeHeartWoKomeKome
      ++ openPamPamSandPamPam
      ++ [sharin'Energy]
      ++ [kome_, tasty]
      ++ [komeKome, pamPam]
      ++ [introducesHerselfAs_CurePrecious, introducesHerselfAs_CureSpicy]
      )

  , mkTransformation
      girls1
      items1
      groupMembers1
      ( preCureDeliciouStan'ByPartyGo
      ++ nigiNigiKomeKomeHeartWoKomeKome
      ++ openPamPamSandPamPam
      ++ kuruKuruMemMemMiracleMemMem
      ++ [sharin'Energy]
      ++ [kome_, tasty, wonton]
      ++ [komeKome, pamPam, memMem]
      ++ [introducesHerselfAs_CurePrecious, introducesHerselfAs_CureSpicy, introducesHerselfAs_CureYumYum]
      ++ ["デリシャスパーティ♡プリキュア！"]
      )
  ]
 where
  preCureDeliciouStan'ByPartyGo = ["プリキュア！デリシャスタンバイ！", "パーティーゴー！"]
  nigiNigiKomeKomeHeartWoKomeKome = ["にぎにぎ！", komeKome, "ハートを！", komeKome]
  openPamPamSandPamPam = ["オープン！", pamPam, "サンド！", pamPam]
  kuruKuruMemMemMiracleMemMem = ["クルクル！", memMem, "ミラクル！", memMem]
  sharin'Energy = "シェアリンエナジー！"

  komeKome = "（コメコメ！）"
  pamPam = "（パムパム！）"
  memMem = "（メンメン！！）"

  kome_ = "（コメー！）"
  tasty = "（テイスティー！）"
  wonton = "（ワンターン！）"

  girls1 = ["Yui", "Kokone", "Ran"]
  items1 = ["KomeKome", "PamPam", "MemMem"]


purifications :: [Purification]
purifications =
  [ mkPurification
      ["CurePrecious"]
      ["HeartCureWatch"]
      ( [ "プリキュア！プレシャストライアングル！"
        , "はぁーっ！かぁーっ！"
        ]
        ++ onakaIppaiGochisosamaDeshita
      )

  , mkPurification
      ["CureSpicy"]
      ["HeartCureWatch"]
      ( [ "プリキュア！スパイシーサークル！"
        , "はぁーっ！たぁーっ！"
        ]
        ++ onakaIppaiGochisosamaDeshita
      )

  , mkPurification
      ["CureYumYum"]
      ["HeartCureWatch"]
      ( [ "プリキュア！ヤムヤムラインズ！"
        , "はぁーっ！かぁーっ！"
        ]
        ++ onakaIppaiGochisosamaDeshita
      )

  , mkPurification
      ["CurePrecious"]
      ["HeartJuicyMixer"]
      ( ["キュアプレシャス！"]
        ++ heartJuicyMixerSharinEnergyMix
        ++
        [ "（コメー！）"
        , "プリキュア！デリシャスプレシャス・ヒート！"
        ]
        ++ onakaIppaiGochisosamaDeshita
      )

  , mkPurification
      ["CureSpicy"]
      ["HeartJuicyMixer"]
      ( ["キュアスパイシー！"]
        ++ heartJuicyMixerSharinEnergyMix
        ++
        [ "（パム！）"
        , "プリキュア！デリシャススパイシー・ベイキン！"
        ]
        ++ onakaIppaiGochisosamaDeshita
      )

  , mkPurification
      ["CureYumYum"]
      ["HeartJuicyMixer"]
      ( ["キュアヤムヤム！"]
        ++ heartJuicyMixerSharinEnergyMix
        ++
        [ "（メーン！）"
        , "プリキュア！デリシャスヤムヤム・ドレイン！"
        ]
        ++ onakaIppaiGochisosamaDeshita
      )

  , mkPurification
      groupMembers1
      (replicate 3 "HeartJuicyMixer")
      ( [ "トリプルミックス！デリシャスチャージ！"
        , "プレシャスフレイバー！"
        , "スパイシーフレイバー！"
        , "ヤムヤムフレイバー！"
        , "プリキュア！ミックスハート・アタック！"
        ]
        ++ onakaIppaiGochisosamaDeshita
      )
  ]
 where
  onakaIppaiGochisosamaDeshita =
    [ "（オナカ、イッパ～イ！）"
    , "ごちそうさまでした！"
    ]
  heartJuicyMixerSharinEnergyMix =
    [ "ハートジューシーミキサー！"
    , "シェアリン！"
    , "エナジー！"
    , "ミックス！"
    ]


groupMembers1 :: IsString s => [s]
groupMembers1 = map fromString groupMembers1'

groupMembers1' :: [String]
groupMembers1' = ["CurePrecious", "CureSpicy", "CureYumYum"]

introducesHerselfAs_CurePrecious =
  "あつあつごはんで、みなぎるパワー！キュアプレシャス！おいしい笑顔で満たしてあげる！"

introducesHerselfAs_CureSpicy =
  "ふわふわサンドde心にスパイス！キュアスパイシー！分け合うおいしさ、焼きつけるわ！"

introducesHerselfAs_CureYumYum =
  "きらめくヌードル・エモーション！キュアヤムヤム！おいしいの独り占め、ゆるさないよ！"
