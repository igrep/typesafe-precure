{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.KirakiraALaMode.Profiles where

import           ACME.PreCure.Index.Types


girls :: [Girl]
girls =
  [ mkGirl "Ichika Usami" "宇佐美 いちか"
  , mkGirl "Himari Arisugawa" "有栖川 ひまり"
  , mkGirl "Aoi Tategami" "立神 あおい"
  , mkGirl "Yukari Kotozume" "琴爪 ゆかり"
  , mkGirl "Akira Kenjo" "剣城 あきら"
  ]


transformees :: [Transformee]
transformees =
  [ mkTransformee "Cure Whip" "キュアホイップ" (concat introducesHerselfAs_CureWhip) ""
  , mkTransformee "Cure Custard" "キュアカスタード" (concat introducesHerselfAs_CureCustard) ""
  , mkTransformee "Cure Gelato" "キュアジェラート" (concat introducesHerselfAs_CureGelato) ""
  , mkTransformee "Cure Macaron" "キュアマカロン" (concat introducesHerselfAs_CureMacaron) ""
  , mkTransformee "Cure Chocolat" "キュアショコラ" (concat introducesHerselfAs_CureChocolat) ""
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Sweets Pact"      "スイーツパクト"       ["Animal Sweets"]
  , mkSpecialItem "Rabbit Shortcake" "うさぎショートケーキ" []
  , mkSpecialItem "Squirrel Pudding" "りすプリン"           []
  , mkSpecialItem "Lion Ice"         "らいおんアイス"       []
  , mkSpecialItem "Cat Macaron"      "ねこマカロン"         []
  , mkSpecialItem "Dog Chocolate"    "いぬチョコレート"     []
  , mkSpecialItem "Candy Rod"        "キャンディロッド"     []
  ]


transformations :: [Transformation]
transformations =
      [ mkTransformation ["Ichika"] [mkIA "SweetsPact" ["RabbitShortcake"]] ["CureWhip"]     (cureALaModeDecoration : introducesHerselfAs_CureWhip)
      , mkTransformation ["Himari"] [mkIA "SweetsPact" ["SquirrelPudding"]] ["CureCustard"]  (cureALaModeDecoration : introducesHerselfAs_CureCustard)
      , mkTransformation ["Aoi"]    [mkIA "SweetsPact" ["LionIce"]]         ["CureGelato"]   (cureALaModeDecoration : introducesHerselfAs_CureGelato)
      , mkTransformation ["Yukari"] [mkIA "SweetsPact" ["CatMacaron"]]      ["CureMacaron"]  (cureALaModeDecoration : introducesHerselfAs_CureMacaron)
      , mkTransformation ["Akira"]  [mkIA "SweetsPact" ["DogChocolate"]]    ["CureChocolat"] (cureALaModeDecoration : introducesHerselfAs_CureChocolat)
      , mkTransformation
          ["Ichika", "Himari", "Aoi", "Yukari", "Akira"]
          [mkIA "SweetsPact" ["RabbitShortcake"], mkIA "SweetsPact" ["SquirrelPudding"], mkIA "SweetsPact" ["LionIce"], mkIA "SweetsPact" ["CatMacaron"], mkIA "SweetsPact" ["DogChocolate"]]
          ["CureWhip", "CureCustard", "CureGelato", "CureMacaron", "CureChocolat"]
          (kirakiraALaModeTransformationSpeechFeaturing introducesHerselfAs_CureWhip)
      , mkTransformation
          ["Himari", "Ichika", "Aoi", "Yukari", "Akira"]
          [mkIA "SweetsPact" ["SquirrelPudding"], mkIA "SweetsPact" ["RabbitShortcake"], mkIA "SweetsPact" ["LionIce"], mkIA "SweetsPact" ["CatMacaron"], mkIA "SweetsPact" ["DogChocolate"]]
          ["CureCustard", "CureWhip", "CureGelato", "CureMacaron", "CureChocolat"]
          (kirakiraALaModeTransformationSpeechFeaturing introducesHerselfAs_CureCustard)
      , mkTransformation
          ["Aoi", "Ichika", "Himari", "Yukari", "Akira"]
          [mkIA "SweetsPact" ["LionIce"], mkIA "SweetsPact" ["RabbitShortcake"], mkIA "SweetsPact" ["SquirrelPudding"], mkIA "SweetsPact" ["CatMacaron"], mkIA "SweetsPact" ["DogChocolate"]]
          ["CureGelato", "CureWhip", "CureCustard", "CureMacaron", "CureChocolat"]
          (kirakiraALaModeTransformationSpeechFeaturing introducesHerselfAs_CureGelato)
      , mkTransformation
          ["Yukari", "Ichika", "Himari", "Aoi", "Akira"]
          [mkIA "SweetsPact" ["CatMacaron"], mkIA "SweetsPact" ["RabbitShortcake"], mkIA "SweetsPact" ["SquirrelPudding"], mkIA "SweetsPact" ["LionIce"], mkIA "SweetsPact" ["DogChocolate"]]
          ["CureMacaron", "CureWhip", "CureCustard", "CureGelato", "CureChocolat"]
          (kirakiraALaModeTransformationSpeechFeaturing introducesHerselfAs_CureMacaron)
      , mkTransformation
          ["Akira", "Ichika", "Himari", "Aoi", "Yukari"]
          [mkIA "SweetsPact" ["DogChocolate"], mkIA "SweetsPact" ["RabbitShortcake"], mkIA "SweetsPact" ["SquirrelPudding"], mkIA "SweetsPact" ["LionIce"], mkIA "SweetsPact" ["CatMacaron"]]
          ["CureChocolat", "CureWhip", "CureCustard", "CureGelato", "CureMacaron"]
          (kirakiraALaModeTransformationSpeechFeaturing introducesHerselfAs_CureChocolat)
      , mkTransformation
          ["Ichika", "Himari", "Aoi"]
          [mkIA "SweetsPact" ["RabbitShortcake"], mkIA "SweetsPact" ["SquirrelPudding"], mkIA "SweetsPact" ["LionIce"]]
          ["CureWhip", "CureCustard", "CureGelato"]
          ( kirakiraALaModeTransformationSpeechOf
              [ introducesHerselfAs_CureWhip
              , introducesHerselfAs_CureCustard
              , introducesHerselfAs_CureGelato
              ]
          )
      , mkTransformation
          ["Ichika", "Himari", "Aoi", "Yukari"]
          [mkIA "SweetsPact" ["RabbitShortcake"], mkIA "SweetsPact" ["SquirrelPudding"], mkIA "SweetsPact" ["LionIce"], mkIA "SweetsPact" ["CatMacaron"]]
          ["CureWhip", "CureCustard", "CureGelato", "CureMacaron"]
          ( kirakiraALaModeTransformationSpeechOf
              [ introducesHerselfAs_CureWhip
              , introducesHerselfAs_CureCustard
              , introducesHerselfAs_CureGelato
              , introducesHerselfAs_CureMacaron
              ]
          )
      , mkTransformation
          ["Yukari", "Akira"]
          [mkIA "SweetsPact" ["CatMacaron"], mkIA "SweetsPact" ["DogChocolate"]]
          ["CureMacaron", "CureChocolat"]
          ( kirakiraALaModeTransformationSpeechOf
              [ introducesHerselfAs_CureMacaron
              , introducesHerselfAs_CureChocolat
              ]
          )
      ]


groupName_KirakiraALaMode = "キラキラ☆プリキュアアラモード"

cureALaModeDecoration = "キュアラモード・デコレーション！"

introducesHerselfAs_CureWhip     = ["ショートケーキ！", "元気と笑顔を！", "レッツ・ラ・まぜまぜ！", "キュアホイップ！できあがり！"]
introducesHerselfAs_CureCustard  = ["プリン！", "知性と勇気を！", "レッツ・ラ・まぜまぜ！", "キュアカスタード！できあがり！"]
introducesHerselfAs_CureGelato   = ["アイス！", "自由と情熱を！", "レッツ・ラ・まぜまぜ！", "キュアジェラート！できあがり！"]
introducesHerselfAs_CureMacaron  = ["マカロン！", "美しさとトキメキを！", "レッツ・ラ・まぜまぜ！", "キュアマカロン！できあがり！"]
introducesHerselfAs_CureChocolat = ["チョコレート！", "強さと愛を！", "レッツ・ラ・まぜまぜ！", "キュアショコラ！できあがり！"]

kirakiraALaModeTransformationSpeechOf :: [[String]] -> [String]
kirakiraALaModeTransformationSpeechOf [] = error "No transforamation speech given!"
kirakiraALaModeTransformationSpeechOf al@(first:_) =
  cureALaModeDecoration : init first ++ map last al

kirakiraALaModeTransformationSpeechFeaturing :: [String] -> [String]
kirakiraALaModeTransformationSpeechFeaturing first =
  cureALaModeDecoration : init first ++ allDekiagari ++ [groupName_KirakiraALaMode ++ "！"]
  where
    allDekiagari = map last
      [ introducesHerselfAs_CureWhip
      , introducesHerselfAs_CureCustard
      , introducesHerselfAs_CureGelato
      , introducesHerselfAs_CureMacaron
      , introducesHerselfAs_CureChocolat
      ]
