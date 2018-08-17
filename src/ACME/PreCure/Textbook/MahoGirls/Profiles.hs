{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.MahoGirls.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.MahoGirls.Words


girls :: [Girl]
girls =
  [ mkGirl "Mirai Asahina" girlName_Mirai
  , mkGirl "Liko Izayoi" girlName_Liko
  , mkGirl "Kotoha Hanami" girlName_Kotoha
  ]


transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Miracle"
      ""
      cureName_Miracle
      variation_Dia
      introducesHerselfAs_Miracle

  , mkTransformee
      "Cure Miracle"
      "Ruby"
      cureName_Miracle
      variation_Ruby
      introducesHerselfAs_Miracle

  , mkTransformee
      "Cure Miracle"
      "Sapphire"
      cureName_Miracle
      variation_Sapphire
      introducesHerselfAs_Miracle

  , mkTransformee
      "Cure Miracle"
      "Topaz"
      cureName_Miracle
      variation_Topaz
      introducesHerselfAs_Miracle

  , mkTransformee
      "Cure Miracle"
      "Over The Rainbow"
      cureName_Miracle
      variation_OverTheRainbow
      introducesHerselfAs_Miracle

  , mkTransformee
      "Cure Miracle"
      "Heartful"
      cureName_Miracle
      variation_Heartful
      introducesHerselfAs_Miracle

  , mkTransformee
      "Cure Magical"
      ""
      cureName_Magical
      variation_Dia
      introducesHerselfAs_Magical

  , mkTransformee
      "Cure Magical"
      "Ruby"
      cureName_Magical
      variation_Ruby
      introducesHerselfAs_Magical

  , mkTransformee
      "Cure Magical"
      "Sapphire"
      cureName_Magical
      variation_Sapphire
      introducesHerselfAs_Magical

  , mkTransformee
      "Cure Magical"
      "Topaz"
      cureName_Magical
      variation_Topaz
      introducesHerselfAs_Magical

  , mkTransformee
      "Cure Magical"
      "Over The Rainbow"
      cureName_Magical
      variation_OverTheRainbow
      introducesHerselfAs_Magical

  , mkTransformee
      "Cure Magical"
      "Heartful"
      cureName_Magical
      variation_Heartful
      introducesHerselfAs_Magical

  , mkTransformee
      "Cure Felice"
      ""
      cureName_Felice
      ""
      introducesHerselfAs_Felice

  , mkTransformee
      "Cure Felice"
      "Over The Rainbow"
      cureName_Felice
      variation_OverTheRainbow
      introducesHerselfAs_Felice

  , mkTransformee
      "Cure Felice"
      "Heartful"
      cureName_Felice
      variation_Heartful
      introducesHerselfAs_Felice

  , mkTransformee
      "Cure Mofurun"
      ""
      cureName_Mofurun
      variation_Dia
      introducesHerselfAs_Mofurun

  , mkTransformee
      "Cure Mofurun"
      "Ruby"
      cureName_Mofurun
      variation_Ruby
      introducesHerselfAs_Mofurun

  , mkTransformee
      "Cure Mofurun"
      "Sapphire"
      cureName_Mofurun
      variation_Sapphire
      introducesHerselfAs_Mofurun

  , mkTransformee
      "Cure Mofurun"
      "Topaz"
      cureName_Mofurun
      variation_Topaz
      introducesHerselfAs_Mofurun

  , mkTransformee
      "Cure Mofurun"
      "Heartful"
      cureName_Mofurun
      variation_Heartful
      introducesHerselfAs_Mofurun
  ]


transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CureMiracle", "CureMagical"] "Maho Girls PreCure!" "Dia Style" groupName_MahoGirls variation_Dia
  , mkTransformedGroup ["CureMiracle_Ruby", "CureMagical_Ruby"] "Maho Girls PreCure!" "Ruby Style" groupName_MahoGirls variation_Ruby
  , mkTransformedGroup ["CureMiracle_Sapphire", "CureMagical_Sapphire"] "Maho Girls PreCure!" "Sapphire Style" groupName_MahoGirls variation_Sapphire
  , mkTransformedGroup ["CureMiracle_Topaz", "CureMagical_Topaz"] "Maho Girls PreCure!" "Topaz Style" groupName_MahoGirls variation_Topaz
  , mkTransformedGroup ["CureMiracle", "CureMagical", "CureFelice"] "Maho Girls PreCure!" "Dia Style" groupName_MahoGirls variation_Dia
  , mkTransformedGroup ["CureMiracle_Ruby", "CureMagical_Ruby", "CureFelice"] "Maho Girls PreCure!" "Ruby Style" groupName_MahoGirls variation_Ruby
  , mkTransformedGroup ["CureMiracle_Sapphire", "CureMagical_Sapphire", "CureFelice"] "Maho Girls PreCure!" "Sapphire Style" groupName_MahoGirls variation_Sapphire
  , mkTransformedGroup ["CureMiracle_Topaz", "CureMagical_Topaz", "CureFelice"] "Maho Girls PreCure!" "Topaz Style" groupName_MahoGirls variation_Topaz
  , mkTransformedGroup ["CureMiracle", "CureMagical", "CureFelice", "CureMofurun"] "Maho Girls PreCure!" "Dia Style" groupName_MahoGirls variation_Dia
  , mkTransformedGroup ["CureMiracle_Ruby", "CureMagical_Ruby", "CureFelice", "CureMofurun_Ruby"] "Maho Girls PreCure!" "Ruby Style" groupName_MahoGirls variation_Ruby
  , mkTransformedGroup ["CureMiracle_Sapphire", "CureMagical_Sapphire", "CureFelice", "CureMofurun_Sapphire"] "Maho Girls PreCure!" "Sapphire Style" groupName_MahoGirls variation_Sapphire
  , mkTransformedGroup ["CureMiracle_Topaz", "CureMagical_Topaz", "CureFelice", "CureMofurun_Topaz"] "Maho Girls PreCure!" "Topaz Style" groupName_MahoGirls variation_Topaz
  , mkTransformedGroup ["CureMiracle_OverTheRainbow", "CureMagical_OverTheRainbow", "CureFelice_OverTheRainbow"] "Maho Girls PreCure!" "Over The Rainbow" groupName_MahoGirls variation_OverTheRainbow
  , mkTransformedGroup ["CureMiracle_Heartful", "CureMagical_Heartful", "CureFelice_Heartful", "CureMofurun_Heartful"] "Maho Girls PreCure!" "Heartful Style" groupName_MahoGirls variation_Heartful
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Mofurun" "モフルン" ["Linkle Stone"]
  , mkSpecialItem "Linkle Smarthon" "リンクルスマホン" ["Linkle Stone"]
  , mkSpecialItem "Rainbow Carriage" "レインボーキャリッジ" ["Linkle Stone", "Mofurun"]
  , mkSpecialItem "Precious Brace" "プレシャスブレス" []
  , mkSpecialItem "Miracle Mofurun Light" "ミラクルモフルンライト" []
  , mkSpecialItem "Linkle Stone Dia" "リンクルストーン・ダイヤ" []
  , mkSpecialItem "Linkle Stone Ruby" "リンクルストーン・ルビー"  []
  , mkSpecialItem "Linkle Stone Sapphire" "リンクルストーン・サファイア"  []
  , mkSpecialItem "Linkle Stone Topaz" "リンクルストーン・トパーズ"  []
  , mkSpecialItem "Linkle Stone Emerald" "リンクルストーン・エメラルド"  []
  , mkSpecialItem "Linkle Stone Alexandrite" "リンクルストーン・アレキサンドライト"  []
  , mkSpecialItem "Mofurun Linkle Stone" "モフルンリンクルストーン"  []
  , mkSpecialItem "Heartful Linkle Stone" "ハートフルリンクルストーン" []
  , mkSpecialItem "Linkle Stick" "リンクルステッキ" ["Linkle Stone"]
  , mkSpecialItem "Flower Echo Wand" "フラワーエコーワンド" ["Linkle Stone"]
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Mirai", "Liko"]
      [mkIA "Mofurun" ["LinkleStoneDia"]]
      ["CureMiracle","CureMagical"]
      transformationSpeech_Miracle_Magical

  , mkTransformation
      ["Mirai", "Liko"]
      [mkIA "Mofurun" ["LinkleStoneRuby"]]
      ["CureMiracle_Ruby","CureMagical_Ruby"]
      transformationSpeech_Miracle_Magical_Ruby

  , mkTransformation
      ["Mirai", "Liko"]
      [mkIA "Mofurun" ["LinkleStoneSapphire"]]
      ["CureMiracle_Sapphire","CureMagical_Sapphire"]
      transformationSpeech_Miracle_Magical_Sapphire

  , mkTransformation
      ["Mirai", "Liko"]
      [mkIA "Mofurun" ["LinkleStoneTopaz"]]
      ["CureMiracle_Topaz","CureMagical_Topaz"]
      transformationSpeech_Miracle_Magical_Topaz

  , mkTransformation
      ["Kotoha"]
      [mkIA "LinkleSmarthon" ["LinkleStoneEmerald"]]
      ["CureFelice"]
      transformationSpeech_Felice

  , mkTransformation
      ["Mirai", "Liko", "Kotoha"]
      [mkIA "Mofurun" ["LinkleStoneDia"], mkIA "LinkleSmarthon" ["LinkleStoneEmerald"]]
      ["CureMiracle","CureMagical","CureFelice"]
      transformationSpeech_MahoGirls

  , mkTransformation
      ["Mirai", "Liko", "Kotoha"]
      [mkIA "Mofurun" ["LinkleStoneRuby"], mkIA "LinkleSmarthon" ["LinkleStoneEmerald"]]
      ["CureMiracle_Ruby","CureMagical_Ruby","CureFelice"]
      transformationSpeech_MahoGirls_Ruby

  , mkTransformation
      ["Mirai", "Liko", "Kotoha"]
      [mkIA "Mofurun" ["LinkleStoneSapphire"], mkIA "LinkleSmarthon" ["LinkleStoneEmerald"]]
      ["CureMiracle_Sapphire","CureMagical_Sapphire","CureFelice"]
      transformationSpeech_MahoGirls_Sapphire

  , mkTransformation
      ["Mirai", "Liko", "Kotoha"]
      [mkIA "Mofurun" ["LinkleStoneTopaz"], mkIA "LinkleSmarthon" ["LinkleStoneEmerald"]]
      ["CureMiracle_Topaz","CureMagical_Topaz","CureFelice"]
      transformationSpeech_MahoGirls_Topaz

  , mkTransformation
      ["CureMiracle", "CureMagical", "CureFelice"]
      [mkIA "Mofurun" ["LinkleStoneAlexandrite"], mkIA "LinkleSmarthon" ["LinkleStoneAlexandrite"]]
      ["CureMiracle_OverTheRainbow","CureMagical_OverTheRainbow","CureFelice_OverTheRainbow"]
      transformationSpeech_MahoGirls_OverTheRainbow

  , mkTransformation
      ["CureMiracle_Ruby", "CureMagical_Ruby", "CureFelice"]
      [mkIA "Mofurun" ["LinkleStoneAlexandrite"], mkIA "LinkleSmarthon" ["LinkleStoneAlexandrite"]]
      ["CureMiracle_OverTheRainbow","CureMagical_OverTheRainbow","CureFelice_OverTheRainbow"]
      transformationSpeech_MahoGirls_OverTheRainbow

  , mkTransformation
      ["CureMiracle_Sapphire", "CureMagical_Sapphire", "CureFelice"]
      [mkIA "Mofurun" ["LinkleStoneAlexandrite"], mkIA "LinkleSmarthon" ["LinkleStoneAlexandrite"]]
      ["CureMiracle_OverTheRainbow","CureMagical_OverTheRainbow","CureFelice_OverTheRainbow"]
      transformationSpeech_MahoGirls_OverTheRainbow

  , mkTransformation
      ["CureMiracle_Topaz", "CureMagical_Topaz", "CureFelice"]
      [mkIA "Mofurun" ["LinkleStoneAlexandrite"], mkIA "LinkleSmarthon" ["LinkleStoneAlexandrite"]]
      ["CureMiracle_OverTheRainbow","CureMagical_OverTheRainbow","CureFelice_OverTheRainbow"]
      transformationSpeech_MahoGirls_OverTheRainbow

  , mkTransformation
      [mkIA "Mofurun" ["MofurunLinkleStone"]]
      ["MiracleMofurunLight"]
      ["CureMofurun"]
      transformationSpeech_Mofurun
  ]


purifications :: [Purification]
purifications =
  [ mkPurification
      ["CureMiracle", "CureMagical"]
      [mkIA "Mofurun" ["LinkleStoneDia"], mkIA "LinkleStick" ["LinkleStoneDia"]]
      purificationSpeech_Miracle_Magical

  , mkPurification
      ["CureMiracle_Ruby", "CureMagical_Ruby"]
      [mkIA "Mofurun" ["LinkleStoneRuby"], mkIA "LinkleStick" ["LinkleStoneRuby"]]
      purificationSpeech_Miracle_Magical_Ruby

  , mkPurification
      ["CureMiracle_Sapphire", "CureMagical_Sapphire"]
      [mkIA "Mofurun" ["LinkleStoneSapphire"], mkIA "LinkleStick" ["LinkleStoneSapphire"]]
      purificationSpeech_Miracle_Magical_Sapphire

  , mkPurification
      ["CureMiracle_Topaz", "CureMagical_Topaz"]
      [mkIA "Mofurun" ["LinkleStoneTopaz"], mkIA "LinkleStick" ["LinkleStoneTopaz"]]
      purificationSpeech_Miracle_Magical_Topaz

  , mkPurification
      ["CureFelice"]
      [mkIA "FlowerEchoWand" ["LinkleStoneEmerald"]]
      purificationSpeech_Felice

  , mkPurification
      ["CureMiracle_OverTheRainbow", "CureMagical_OverTheRainbow", "CureFelice_OverTheRainbow"]
      [mkIA "RainbowCarriage" ["LinkleStoneAlexandrite", mkIA "Mofurun" ["LinkleStoneAlexandrite"]], "PreciousBrace"]
      purificationSpeech_MahoGirls_extreme_rainbow
  ]
