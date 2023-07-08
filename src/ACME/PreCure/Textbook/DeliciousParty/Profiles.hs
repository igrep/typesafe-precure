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
  , mkGirl "Amane Kasai"  "菓彩 あまね"
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
  , mkTransformee
      "Cure Finale"
      ""
      "キュアフィナーレ"
      ""
      introducesHerselfAs_CureFinale

  , mkTransformee
      "Cure Precious"
      "Party Up Style"
      "キュアプレシャス"
      "パーティアップスタイル"
      introducesHerselfAs_CurePrecious
  , mkTransformee
      "Cure Spicy"
      "Party Up Style"
      "キュアスパイシー"
      "パーティアップスタイル"
      introducesHerselfAs_CureSpicy
  , mkTransformee
      "Cure Yum-Yum"
      "Party Up Style"
      "キュアヤムヤム"
      "パーティアップスタイル"
      introducesHerselfAs_CureYumYum
  , mkTransformee
      "Cure Finale"
      "Party Up Style"
      "キュアフィナーレ"
      "パーティアップスタイル"
      introducesHerselfAs_CureFinale
  ]

transformedGroups :: [TransformedGroup]
transformedGroups =
    [ mkTransformedGroup groupMembers1 ne "" nj ""
    , mkTransformedGroup groupMembers2 ne "Party Up Style" nj "パーティアップスタイル"
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

  , mkSpecialItem "Heart Fruits Pendant" "ハートフルーツペンダント"
  , mkSpecialItem "Creamy Fleuret" "クリーミーフルーレ"

  , mkSpecialItem "Heart Juicy Mixer"  "ハートジューシーミキサー"

  , mkSpecialItem "Party Up Ring"  "パーティーアップリング"
  , mkSpecialItem "Party Candle Tact"  "パーティーキャンドルタクト"
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
      ["Amane"]
      ["HeartFruitsPendant"]
      ["CureFinale"]
      ( preCureDeliciouStan'ByPartyGo
      ++ fruitsFabulousOrder
      ++ [sharin'Energy]
      ++ toppingBrilliantShineMore
      ++ [introducesHerselfAs_CureFinale]
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

  , mkTransformation
      girls2
      items2
      groupMembers2
      ( preCureDeliciouStan'ByPartyGo
      ++ nigiNigiKomeKomeHeartWoKomeKome
      ++ openPamPamSandPamPam
      ++ kuruKuruMemMemMiracleMemMem
      ++ fruitsFabulousOrder
      ++ [sharin'Energy]
      ++ [kome_, tasty, wonton]
      ++ toppingBrilliantShineMore
      ++ [komeKome, pamPam, memMem]
      ++ [introducesHerselfAs_CurePrecious, introducesHerselfAs_CureSpicy, introducesHerselfAs_CureYumYum, introducesHerselfAs_CureFinale]
      ++ ["デリシャスパーティ♡プリキュア！"]
      )

  , mkTransformation
      groupMembers2
      itemsLightMyDelicious
      groupMembers_PartyUp
      [ "（コメコメの力をみんなに！）"
      , "パーティキャンドルタクト！"
      , "笑顔のパワー！"
      , "分け合うパワー！"
      , "情熱のパワー！"
      , "正義のパワー！"
      , "（プリキュア・パーティアップ！）"
      ]
  ]
 where
  preCureDeliciouStan'ByPartyGo = ["プリキュア！デリシャスタンバイ！", "パーティーゴー！"]

  nigiNigiKomeKomeHeartWoKomeKome = ["にぎにぎ！", komeKome, "ハートを！", komeKome]
  openPamPamSandPamPam = ["オープン！", pamPam, "サンド！", pamPam]
  kuruKuruMemMemMiracleMemMem = ["クルクル！", memMem, "ミラクル！", memMem]
  fruitsFabulousOrder = ["フルーツ！", "ファビュラス・オーダー！"]
  toppingBrilliantShineMore = ["トッピング！", "ブリリアント！", "シャインモア！"]

  sharin'Energy = "シェアリンエナジー！"

  komeKome = "（コメコメ！）"
  pamPam = "（パムパム！）"
  memMem = "（メンメン！！）"

  kome_ = "（コメー！）"
  tasty = "（テイスティー！）"
  wonton = "（ワンターン！）"

  girls1 = ["Yui", "Kokone", "Ran"]
  girls2 = girls1 ++ ["Amane"]
  items1 = ["KomeKome", "PamPam", "MemMem"]
  items2 = items1 ++ ["HeartFruitsPendant"]


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

  --, mkPurification
  --["CureFinale"]
  --["CreamyFleuret"]
  --[ "プリキュア！フィナーレブーケ！"
  --]

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
      ["CureFinale"]
      ["CreamyFleuret"]
      ( [ "クリーミーフルーレ！"
        , "ブルーミン・ダンシンフルーツ！"
        , "プリキュア！デリシャスフィナーレ・ファンファーレ！"
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

  , mkPurification
      groupMembers_PartyUp
      itemsLightMyDelicious
      ( [ "心をひとつに！"
        , "プリキュア！ライト・マイ・デリシャス！"
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

groupMembers2 :: IsString s => [s]
groupMembers2 = map fromString groupMembers2'

groupMembers1' :: [String]
groupMembers1' = ["CurePrecious", "CureSpicy", "CureYumYum"]

groupMembers2' :: [String]
groupMembers2' = groupMembers1' ++ ["CureFinale"]

groupMembers_PartyUp :: IsString s => [s]
groupMembers_PartyUp = map (fromString . (++ "_PartyUpStyle")) groupMembers2'


itemsLightMyDelicious :: [IdAttachments]
itemsLightMyDelicious = "KomeKome" : concat (replicate 4 ["PartyUpRing", "PartyCandleTact"])


introducesHerselfAs_CurePrecious =
  "あつあつごはんで、みなぎるパワー！キュアプレシャス！おいしい笑顔で満たしてあげる！"

introducesHerselfAs_CureSpicy =
  "ふわふわサンドde心にスパイス！キュアスパイシー！分け合うおいしさ、焼きつけるわ！"

introducesHerselfAs_CureYumYum =
  "きらめくヌードル・エモーション！キュアヤムヤム！おいしいの独り占め、ゆるさないよ！"

introducesHerselfAs_CureFinale =
  "ジェントルに、ゴージャスに！咲き誇るスウィートネス！キュアフィナーレ！食卓の最後を、このわたしが飾ろう。"
