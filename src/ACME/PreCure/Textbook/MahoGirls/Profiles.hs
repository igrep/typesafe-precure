{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.MahoGirls.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.MahoGirls.Words


girls :: [Girl]
girls =
  [ mkGirl ("Mirai" ++ error "Need family name!") girlName_Mirai
  , mkGirl ("Liko" ++ error "Need family name!") girlName_Liko
  , mkGirl ("Kotoha" ++ error "Need family name!") girlName_Kotoha
  ]


transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Miracle"
      ""
      cureName_Miracle
      variation_Dia
      "introducesHerselfAs_Miracle"

  , mkTransformee
      "Cure Miracle"
      "Ruby"
      cureName_Miracle
      variation_Ruby
      "introducesHerselfAs_Miracle"

  , mkTransformee
      "Cure Miracle"
      "Sapphire"
      cureName_Miracle
      variation_Sapphire
      "introducesHerselfAs_Miracle"

  , mkTransformee
      "Cure Miracle"
      "Topaz"
      cureName_Miracle
      variation_Topaz
      "introducesHerselfAs_Miracle"

  , mkTransformee
      "Cure Miracle"
      "Over The Rainbow"
      cureName_Miracle
      variation_OverTheRainbow
      "introducesHerselfAs_Miracle"

  , mkTransformee
      "Cure Miracle"
      "Heartful"
      cureName_Miracle
      variation_Heartful
      "introducesHerselfAs_Miracle"

  , mkTransformee
      "Cure Magical"
      ""
      cureName_Magical
      variation_Dia
      "introducesHerselfAs_Magical"

  , mkTransformee
      "Cure Magical"
      "Ruby"
      cureName_Magical
      variation_Ruby
      "introducesHerselfAs_Magical"

  , mkTransformee
      "Cure Magical"
      "Sapphire"
      cureName_Magical
      variation_Sapphire
      "introducesHerselfAs_Magical"

  , mkTransformee
      "Cure Magical"
      "Topaz"
      cureName_Magical
      variation_Topaz
      "introducesHerselfAs_Magical"

  , mkTransformee
      "Cure Magical"
      "Over The Rainbow"
      cureName_Magical
      variation_OverTheRainbow
      "introducesHerselfAs_Magical"

  , mkTransformee
      "Cure Magical"
      "Heartful"
      cureName_Magical
      variation_Heartful
      "introducesHerselfAs_Magical"

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
      "introducesHerselfAs_Felice"

  , mkTransformee
      "Cure Felice"
      "Heartful"
      cureName_Felice
      variation_Heartful
      "introducesHerselfAs_Felice"

  , mkTransformee
      "Cure Mofurun"
      ""
      cureName_Mofurun
      variation_Dia
      "introducesHerselfAs_Mofurun"

  , mkTransformee
      "Cure Mofurun"
      "Ruby"
      cureName_Mofurun
      variation_Ruby
      "introducesHerselfAs_Mofurun"

  , mkTransformee
      "Cure Mofurun"
      "Sapphire"
      cureName_Mofurun
      variation_Sapphire
      "introducesHerselfAs_Mofurun"

  , mkTransformee
      "Cure Mofurun"
      "Topaz"
      cureName_Mofurun
      variation_Topaz
      "introducesHerselfAs_Mofurun"

  , mkTransformee
      "Cure Mofurun"
      "Heartful"
      cureName_Mofurun
      variation_Heartful
      "introducesHerselfAs_Mofurun"

  ]


transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CureMiracle", "CureMagical"] "Maho Girls" "Dia" groupName_MahoGirls variation_Dia
  , mkTransformedGroup ["CureMiracle_Ruby", "CureMagical_Ruby"] "Maho Girls" "Ruby" groupName_MahoGirls variation_Ruby
  , mkTransformedGroup ["CureMiracle_Sapphire", "CureMagical_Sapphire"] "Maho Girls" "Sapphire" groupName_MahoGirls variation_Sapphire
  , mkTransformedGroup ["CureMiracle_Topaz", "CureMagical_Topaz"] "Maho Girls" "Topaz" groupName_MahoGirls variation_Topaz
  , mkTransformedGroup ["CureMiracle", "CureMagical", "CureFelice"] "Maho Girls" "Dia" groupName_MahoGirls variation_Dia
  , mkTransformedGroup ["CureMiracle_Ruby", "CureMagical_Ruby", "CureFelice"] "Maho Girls" "Ruby" groupName_MahoGirls variation_Ruby
  , mkTransformedGroup ["CureMiracle_Sapphire", "CureMagical_Sapphire", "CureFelice"] "Maho Girls" "Sapphire" groupName_MahoGirls variation_Sapphire
  , mkTransformedGroup ["CureMiracle_Topaz", "CureMagical_Topaz", "CureFelice"] "Maho Girls" "Topaz" groupName_MahoGirls variation_Topaz
  , mkTransformedGroup ["CureMiracle", "CureMagical", "CureFelice", "CureMofurun"] "Maho Girls" "Dia" groupName_MahoGirls variation_Dia
  , mkTransformedGroup ["CureMiracle_Ruby", "CureMagical_Ruby", "CureFelice", "CureMofurun_Ruby"] "Maho Girls" "Ruby" groupName_MahoGirls variation_Ruby
  , mkTransformedGroup ["CureMiracle_Sapphire", "CureMagical_Sapphire", "CureFelice", "CureMofurun_Sapphire"] "Maho Girls" "Sapphire" groupName_MahoGirls variation_Sapphire
  , mkTransformedGroup ["CureMiracle_Topaz", "CureMagical_Topaz", "CureFelice", "CureMofurun_Topaz"] "Maho Girls" "Topaz" groupName_MahoGirls variation_Topaz
  , mkTransformedGroup ["CureMiracle_OverTheRainbow", "CureMagical_OverTheRainbow", "CureFelice_OverTheRainbow"] "Maho Girls" "Over The Rainbow" groupName_MahoGirls variation_OverTheRainbow
  , mkTransformedGroup ["CureMiracle_Heartful", "CureMagical_Heartful", "CureFelice_Heartful", "CureMofurun_Heartful"] "Maho Girls" "Heartful" groupName_MahoGirls variation_Heartful
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Mofurun" (error "Specify specialItemNameJa") ["ls"]
  , mkSpecialItem "LinkleSmarthon" (error "Specify specialItemNameJa") ["ls"]
  , mkSpecialItem "RainbowCarriage" (error "Specify specialItemNameJa") ["ls", "mof"]
  , mkSpecialItem "PreciousBrace" (error "Specify specialItemNameJa") []
  , mkSpecialItem "MiracleMofurunLight" (error "Specify specialItemNameJa") []
  , mkSpecialItem "LinkleStoneDia" (error "Specify specialItemNameJa") []
  , mkSpecialItem "LinkleStoneRuby" (error "Specify specialItemNameJa") []
  , mkSpecialItem "LinkleStoneSapphire" (error "Specify specialItemNameJa") []
  , mkSpecialItem "LinkleStoneTopaz" (error "Specify specialItemNameJa") []
  , mkSpecialItem "LinkleStoneEmerald" (error "Specify specialItemNameJa") []
  , mkSpecialItem "LinkleStoneAlexandrite" (error "Specify specialItemNameJa") []
  , mkSpecialItem "LinkleStoneOfHope" (error "Specify specialItemNameJa") []
  , mkSpecialItem "HeartfulLinkleStone" (error "Specify specialItemNameJa") []
  , mkSpecialItem "LinkleStick" (error "Specify specialItemNameJa") ["ls"]
  , mkSpecialItem "FlowerEchoWand" (error "Specify specialItemNameJa") ["ls"]
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
      [mkIA "Mofurun" ["LinkleStoneOfHope"]]
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
      [mkIA "RainbowCarriage" [mkIA "LinkleStoneAlexandrite" [mkIA "Mofurun" ["LinkleStoneAlexandrite"]]], "PreciousBrace"]
      purificationSpeech_MahoGirls_extreme_rainbow

  ]


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ 
  ]


