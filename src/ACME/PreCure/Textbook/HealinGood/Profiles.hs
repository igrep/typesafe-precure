{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.HealinGood.Profiles where

import           Data.String              (IsString)

import           ACME.PreCure.Index.Types

girls :: [Girl]
girls =
  [ mkGirl "Nodoka Hanadera" "花寺 のどか"
  , mkGirl "Chiyu Sawaizumi"  "沢泉 ちゆ"
  , mkGirl "Hinata Hiramitsu"  "平光 ひなた"
  ]

transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Grace"
      ""
      "キュアグレース"
      ""
      introducesHerselfAs_CureGrace
  , mkTransformee
      "Cure Fontaine"
      ""
      "キュアフォンテーヌ"
      ""
      introducesHerselfAs_CureFontaine
  , mkTransformee
      "Cure Sparkle"
      ""
      "キュアスパークル"
      ""
      introducesHerselfAs_CureSparkle
  ]

transformedGroups :: [TransformedGroup]
transformedGroups =
    [ mkTransformedGroup groupMembers ne "" nj ""
    ]
  where
    ne = "Healin' Good♡PreCure"
    nj = "ヒーリングっど♥プリキュア "

specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Healing Stick" "ヒーリングステッキ" ["Healing Animal", "Element Bottle"]

  , mkSpecialItem "Rabirin"  "ラビリン" []
  , mkSpecialItem "Pegitan"  "ペギタン" []
  , mkSpecialItem "Nyatoran" "ニャトラン" []

  , mkSpecialItem "Element Bottle Of Flower" "花のエレメントボトル" []
  , mkSpecialItem "Element Bottle Of Water"  "水のエレメントボトル" []
  , mkSpecialItem "Element Bottle Of Light"  "光のエレメントボトル" []
  ]

transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Nodoka"]
      [mkIA "HealingStick" ["Rabirin", "ElementBottleOfFlower"]]
      ["CureGrace"]
      ( startPreCureOperation
      ++ ["（エレメントレベル、上昇ラビ！）"]
      ++ cureTouchKyun
      ++ ["（キュン！）", introducesHerselfAs_CureGrace, "（ラビ！）"]
      )
  , mkTransformation
      ["Chiyu"]
      [mkIA "HealingStick" ["Pegitan", "ElementBottleOfWater"]]
      ["CureFontaine"]
      ( startPreCureOperation
      ++ ["（エレメントレベル、上昇ペェ！）"]
      ++ cureTouchKyun
      ++ ["（キュン！）", introducesHerselfAs_CureFontaine, "（ペェ！）"]
      )
  , mkTransformation
      ["Hinata"]
      [mkIA "HealingStick" ["Nyatoran", "ElementBottleOfLight"]]
      ["CureSparkle"]
      ( startPreCureOperation
      ++ ["（エレメントレベル、上昇にゃあ！）"]
      ++ cureTouchKyun
      ++ ["（キュン！）", introducesHerselfAs_CureSparkle, "（にゃあ！）"]
      )
  , mkTransformation
      ["Nodoka", "Chiyu", "Nodoka"]
      [ mkIA "HealingStick" ["Rabirin", "ElementBottleOfFlower"]
      , mkIA "HealingStick" ["Pegitan", "ElementBottleOfWater"]
      ]
      ["CureGrace", "CureFontaine"]
      ( startPreCureOperation
      ++ ["（エレメントレベル、上昇(ラビ|ペェ)！）"]
      ++ cureTouchKyun
      ++ ["（キュン！）", introducesHerselfAs_CureGrace, "（ラビ！）"]
      ++ ["（キュン！）", introducesHerselfAs_CureFontaine, "（ペェ！）"]
      )
  , mkTransformation
      ["Nodoka", "Chiyu", "Nodoka"]
      [ mkIA "HealingStick" ["Rabirin", "ElementBottleOfFlower"]
      , mkIA "HealingStick" ["Pegitan", "ElementBottleOfWater"]
      , mkIA "HealingStick" ["Nyatoran", "ElementBottleOfLight"]
      ]
      groupMembers
      ( startPreCureOperation
      ++ ["（エレメントレベル、上昇(ラビ|ペェ|にゃあ)！）"]
      ++ cureTouchKyun
      ++ ["（キュン！）", introducesHerselfAs_CureGrace, "（ラビ！）"]
      ++ ["（キュン！）", introducesHerselfAs_CureFontaine, "（ペェ！）"]
      ++ ["（キュン！）", introducesHerselfAs_CureSparkle, "（にゃあ！）"]
      ++ ["地球をお手当て！ヒーリングっど♥プリキュア！"]
      )
  ]
 where
  startPreCureOperation = ["（スタート！）", "プリキュア！オペレーション！"]

  cureTouchKyun = ["キュアタッチ！", "（キュン！）"]


purifications :: [Purification]
purifications =
  [ mkPurification
      ["CureGrace"]
      [mkIA "HealingStick" ["Rabirin", "ElementBottleOfFlower"]]
      [elementCharge, kyun3, healingGauge, "プリキュア！ヒーリング・フラワー！", healinGoodBye, takeCare]

  , mkPurification
      ["CureFontaine"]
      [mkIA "HealingStick" ["Pegitan", "ElementBottleOfWater"]]
      [elementCharge, kyun3, healingGauge, "プリキュア！ヒーリング・ストリーム！", healinGoodBye, takeCare]

  , mkPurification
      ["CureSparkle"]
      [mkIA "HealingStick" ["Nyatoran", "ElementBottleOfLight"]]
      [elementCharge, kyun3, healingGauge, "プリキュア！ヒーリング・フラッシュ！", healinGoodBye, takeCare]
  ]
 where
  elementCharge = "エレメントチャージ！"
  kyun3 = "（キュン！キュン！キュン！）"
  healingGauge = "ヒーリングゲージ、上昇！"
  healinGoodBye = "（ヒーリングッバ～イ）"
  takeCare = "お大事に。"

groupMembers :: IsString s => [s]
groupMembers = ["CureGrace", "CureFontaine", "CureSparkle"]

introducesHerselfAs_CureGrace =
  "重なる二つの花！キュアグレース！"

introducesHerselfAs_CureFontaine =
  "交わる二つの流れ！キュアフォンテーヌ！"

introducesHerselfAs_CureSparkle =
  "溶け合う二つの光！キュアスパークル！"
