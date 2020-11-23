{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.HealinGood.Profiles where

import           Data.String              (IsString, fromString)

import           ACME.PreCure.Index.Types

girls :: [Girl]
girls =
  [ mkGirl "Nodoka Hanadera" "花寺 のどか"
  , mkGirl "Chiyu Sawaizumi"  "沢泉 ちゆ"
  , mkGirl "Hinata Hiramitsu"  "平光 ひなた"
  , mkGirl "Asumi Fuurin"  "風鈴アスミ"
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
  , mkTransformee
      "Cure Earth"
      ""
      "キュアアース"
      ""
      introducesHerselfAs_CureEarth

  , mkTransformee
      "Cure Grace"
      "Special Healin'Good Style"
      "キュアグレース"
      "スペシャルヒーリングっどスタイル"
      introducesHerselfAs_CureGrace
  , mkTransformee
      "Cure Fontaine"
      "Special Healin'Good Style"
      "キュアフォンテーヌ"
      "スペシャルヒーリングっどスタイル"
      introducesHerselfAs_CureFontaine
  , mkTransformee
      "Cure Sparkle"
      "Special Healin'Good Style"
      "キュアスパークル"
      "スペシャルヒーリングっどスタイル"
      introducesHerselfAs_CureSparkle
  , mkTransformee
      "Cure Earth"
      "Special Healin'Good Style"
      "キュアアース"
      "スペシャルヒーリングっどスタイル"
      introducesHerselfAs_CureEarth
  ]

transformedGroups :: [TransformedGroup]
transformedGroups =
    [ mkTransformedGroup groupMembers1 ne "" nj ""
    , mkTransformedGroup groupMembers2 ne "" nj ""
    , mkTransformedGroup groupMembers3 ne "Special Healin'Good Style" nj "スペシャルヒーリングっどスタイル"
    ]
  where
    ne = "Healin'Good♡PreCure"
    nj = "ヒーリングっど♥プリキュア "

specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Healing Stick" "ヒーリングステッキ" ["Healing Animal", "Element Bottle"]
  , mkSpecialItem "Earth Windy Harp" "アースウィンディハープ" []

  , mkSpecialItem "Rabirin"  "ラビリン" []
  , mkSpecialItem "Pegitan"  "ペギタン" []
  , mkSpecialItem "Nyatoran" "ニャトラン" []
  , mkSpecialItem "Latte" "ラテ" ["Element Bottle"]

  , mkSpecialItem "Element Bottle Of Flower"    "花のエレメントボトル" []
  , mkSpecialItem "Element Bottle Of Water"     "水のエレメントボトル" []
  , mkSpecialItem "Element Bottle Of Light"     "光のエレメントボトル" []
  , mkSpecialItem "Element Bottle Of Fruit"     "実りのエレメントボトル" []
  , mkSpecialItem "Element Bottle Of Ice"       "氷のエレメントボトル" []
  , mkSpecialItem "Element Bottle Of Lightning" "雷のエレメントボトル" []
  , mkSpecialItem "Element Bottle Of Leaf"      "葉っぱのエレメントボトル" []
  , mkSpecialItem "Element Bottle Of Rain"      "雨のエレメントボトル" []
  , mkSpecialItem "Element Bottle Of Fire"      "火のエレメントボトル" []
  , mkSpecialItem "Element Bottle Of Wind"      "風のエレメントボトル" []

  , mkSpecialItem "Miracle Healing Bottle"  "ミラクルヒーリングボトル" []

  , mkSpecialItem "Special Healin'Good Bottle" "スペシャル・ヒーリングっどボトル" []
  , mkSpecialItem "Healin'Good Arrow" "ヒーリングっどアロー"
      [ "Special Healin'Good Bottle"
      , "Rabirin", "Pegitan", "Nyatoran", "Latte"
      ]
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
      ["Asumi"]
      ["EarthWindyHarp", mkIA "Latte" ["ElementBottleOfWind"]]
      ["CureSparkle"]
      ( startPreCureOperation
      ++ ["（エレメントレベル、上昇ラテ！）"]
      ++ cureTouchKyun
      ++ [introducesHerselfAs_CureEarth, "（ワン！）"]
      )
  , mkTransformation
      ["Nodoka", "Chiyu"]
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
      ["Nodoka", "Hinata", "Asumi"]
      [ mkIA "HealingStick" ["Rabirin", "ElementBottleOfFlower"]
      , mkIA "HealingStick" ["Nyatoran", "ElementBottleOfLight"]
      , "EarthWindyHarp"
      , mkIA "Latte" ["ElementBottleOfWind"]
      ]
      ["CureGrace", "CureSparkle", "CureEarth"]
      ( startPreCureOperation
      ++ ["（エレメントレベル、上昇(ラビ|にゃあ|ラテ)！）"]
      ++ cureTouchKyun
      ++ ["（キュン！）", introducesHerselfAs_CureGrace, "（ラビ！）"]
      ++ ["（キュン！）", introducesHerselfAs_CureSparkle, "（にゃあ！）"]
      ++ [introducesHerselfAs_CureEarth, "（ワン！）"]
      )
  , mkTransformation
      girls1
      items1
      groupMembers1
      ( startPreCureOperation
      ++ ["（エレメントレベル、上昇(ラビ|ペェ|にゃあ)！）"]
      ++ cureTouchKyun
      ++ ["（キュン！）", introducesHerselfAs_CureGrace, "（ラビ！）"]
      ++ ["（キュン！）", introducesHerselfAs_CureFontaine, "（ペェ！）"]
      ++ ["（キュン！）", introducesHerselfAs_CureSparkle, "（にゃあ！）"]
      ++ takeCareOfEarth
      )
  , mkTransformation
      (girls1 ++ ["Asumi"])
      ( items1
      ++ ["EarthWindyHarp", mkIA "Latte" ["ElementBottleOfWind"]]
      )
      groupMembers2
      ( untilIntroductions1
      ++ startPreCureOperation
      ++ ["（エレメントレベル、上昇ラテ！）"]
      ++ cureTouchKyun
      ++ [introducesHerselfAs_CureEarth, "（ワン！）"]
      ++ takeCareOfEarth
      )
  , mkTransformation
      groupMembers2
      [ mkIA "Healin'GoodArrow"
          [ "SpecialHealin'GoodBottle"
          , "Rabirin"
          , "Pegitan"
          , "Nyatoran"
          , mkIA "Latte" ["SpecialHealin'GoodBottle"]
          ]
      ]
      groupMembers3
      [ "（わふー！）"
      , "ヒーリングっどアロー！"
      , "ヒーリングアニマルパワー、全開！"
      , "（キュン！）"
      , "アメイジングお手当て、準備OK！"
      ]
  ]
 where
  startPreCureOperation = ["（スタート！）", "プリキュア！オペレーション！"]
  cureTouchKyun = ["キュアタッチ！", "（キュン！）"]
  girls1 = ["Nodoka", "Chiyu", "Hinata"]
  items1 =
    [ mkIA "HealingStick" ["Rabirin", "ElementBottleOfFlower"]
    , mkIA "HealingStick" ["Pegitan", "ElementBottleOfWater"]
    , mkIA "HealingStick" ["Nyatoran", "ElementBottleOfLight"]
    ]
  untilIntroductions1 =
    ( startPreCureOperation
    ++ ["（エレメントレベル、上昇(ラビ|ペェ|にゃあ)！）"]
    ++ cureTouchKyun
    ++ ["（キュン！）", introducesHerselfAs_CureGrace, "（ラビ！）"]
    ++ ["（キュン！）", introducesHerselfAs_CureFontaine, "（ペェ！）"]
    ++ ["（キュン！）", introducesHerselfAs_CureSparkle, "（にゃあ！）"]
    )
  takeCareOfEarth = ["地球をお手当て！ヒーリングっど♥プリキュア！"]


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

  , mkPurification
      ["CureGrace"]
      [mkIA "HealingStick" ["Rabirin", "ElementBottleOfFruit"]]
      ["実りのエレメント！", "はぁーっ！"]

  , mkPurification
      ["CureFontaine"]
      [mkIA "HealingStick" ["Pegitan", "ElementBottleOfIce"]]
      ["氷のエレメント！", "はぁーっ！"]

  , mkPurification
      ["CureSparkle"]
      [mkIA "HealingStick" ["Nyatoran", "ElementBottleOfLightning"]]
      ["雷のエレメント！", "はぁーっ！"]

  , mkPurification
      ["CureGrace"]
      [mkIA "HealingStick" ["Rabirin", "ElementBottleOfLeaf"]]
      ["葉っぱのエレメント！", "はぁーっ！"]

  , mkPurification
      ["CureFontaine"]
      [mkIA "HealingStick" ["Pegitan", "ElementBottleOfRain"]]
      ["雨のエレメント！", "はぁーっ！"]

  , mkPurification
      ["CureSparkle"]
      [mkIA "HealingStick" ["Nyatoran", "ElementBottleOfFire"]]
      ["火のエレメント！", "はぁーっ！"]

  , mkPurification
      ["CureEarth"]
      ["EarthWindyHarp", "ElementBottleOfWind"]
      [ "アースウィンディハープ！"
      , elementCharge
      , "舞い上がれ、癒やしの風！"
      , "プリキュア！ヒーリング・ハリケーン！"
      , healinGoodBye
      , takeCare
      ]

  , mkPurification
      groupMembers1
      [ mkIA "HealingStick" ["Rabirin", "MiracleHealingBottle"]
      , mkIA "HealingStick" ["Pegitan", "MiracleHealingBottle"]
      , mkIA "HealingStick" ["Nyatoran", "MiracleHealingBottle"]
      ]
      [ "トリプルハートチャージ"
      , "届け！癒やしの！パワー！"
      , "プリキュア！ヒーリング・オアシス！"
      , healinGoodBye
      , takeCare
      ]

  , mkPurification
      groupMembers3
      [ mkIA "Healin'GoodArrow"
          [ "SpecialHealin'GoodBottle"
          , "Rabirin"
          , "Pegitan"
          , "Nyatoran"
          , mkIA "Latte" ["SpecialHealin'GoodBottle"]
          ]
      ]
      [ "（OK！）"
      , "プリキュア・ファイナル・ヒーリングっどシャワー！"
      , healinGoodBye
      , takeCare
      , "（わふー！）"
      ]
  ]

 where
  elementCharge = "エレメントチャージ！"
  kyun3 = "（キュン！キュン！キュン！）"
  healingGauge = "ヒーリングゲージ、上昇！"
  healinGoodBye = "（ヒーリングッバ～イ）"
  takeCare = "お大事に。"

groupMembers1 :: IsString s => [s]
groupMembers1 = map fromString groupMembers1'

groupMembers2 :: IsString s => [s]
groupMembers2 = map fromString groupMembers2'

groupMembers1' :: [String]
groupMembers1' = ["CureGrace", "CureFontaine", "CureSparkle"]

groupMembers2' :: [String]
groupMembers2' = groupMembers1 ++ ["CureEarth"]

groupMembers3 :: IsString s => [s]
groupMembers3 = map (fromString . (++ "_SpecialHealin'GoodStyle")) groupMembers2'

introducesHerselfAs_CureGrace =
  "重なる二つの花！キュアグレース！"

introducesHerselfAs_CureFontaine =
  "交わる二つの流れ！キュアフォンテーヌ！"

introducesHerselfAs_CureSparkle =
  "溶け合う二つの光！キュアスパークル！"

introducesHerselfAs_CureEarth =
  "時を経てつながる、二つの風！キュアアース！"
