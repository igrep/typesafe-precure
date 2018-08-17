{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.Smile.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.Smile.Words


girls :: [Girl]
girls =
  [ mkGirl "Miyuki Hoshizora" girlName_Miyuki
  , mkGirl "Akane Hino" girlName_Akane
  , mkGirl "Yayoi Kise" girlName_Yayoi
  , mkGirl "Nao Midorikawa" girlName_Nao
  , mkGirl "Reika Aoki" girlName_Reika
  ]


transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Happy"
      ""
      cureName_Happy
      ""
      introducesHerselfAs_Happy

  , mkTransformee
      "Cure Sunny"
      ""
      cureName_Sunny
      ""
      introducesHerselfAs_Sunny

  , mkTransformee
      "Cure Peace"
      ""
      cureName_Peace
      ""
      introducesHerselfAs_Peace

  , mkTransformee
      "Cure March"
      ""
      cureName_March
      ""
      introducesHerselfAs_March

  , mkTransformee
      "Cure Beauty"
      ""
      cureName_Beauty
      ""
      introducesHerselfAs_Beauty

  , mkTransformee
      "Princess Happy"
      ""
      cureName_Happy
      variation_Happy_Princess
      "introducesHerselfAs_Happy_Princess"

  , mkTransformee
      "Princess Sunny"
      ""
      cureName_Sunny
      variation_Sunny_Princess
      "introducesHerselfAs_Sunny_Princess"

  , mkTransformee
      "Princess Peace"
      ""
      cureName_Peace
      variation_Peace_Princess
      "introducesHerselfAs_Peace_Princess"

  , mkTransformee
      "Princess March"
      ""
      cureName_March
      variation_March_Princess
      "introducesHerselfAs_March_Princess"

  , mkTransformee
      "Princess Beauty"
      ""
      cureName_Beauty
      variation_Beauty_Princess
      "introducesHerselfAs_Beauty_Princess"
  ]


transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CureHappy", "CureSunny", "CurePeace", "CureMarch", "CureBeauty"] "Smile PreCure!" "" groupName_Smile ""
  , mkTransformedGroup ["PrincessHappy", "PrincessSunny", "PrincessPeace", "PrincessMarch", "PrincessBeauty"] "Smile PreCure!" "PreCure Princess Form" groupName_Smile variation_Smile_Princess
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Smile Pact" "スマイルパクト" ["CureDecors"]
  , mkSpecialItem "Cure Decors" "キュアデコル" []
  , mkSpecialItem "Princess Candle" "プリンセスキャンドル" ["CureDecors"]
  , mkSpecialItem "Royal Clock" "ロイヤルクロック" ["CureDecors"]
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Miyuki"]
      [mkIA "SmilePact" ["CureDecors"]]
      ["CureHappy"]
      transformationSpeech_Happy

  , mkTransformation
      ["Akane"]
      [mkIA "SmilePact" ["CureDecors"]]
      ["CureSunny"]
      transformationSpeech_Sunny

  , mkTransformation
      ["Yayoi"]
      [mkIA "SmilePact" ["CureDecors"]]
      ["CurePeace"]
      transformationSpeech_Peace

  , mkTransformation
      ["Nao"]
      [mkIA "SmilePact" ["CureDecors"]]
      ["CureMarch"]
      transformationSpeech_March

  , mkTransformation
      ["Reika"]
      [mkIA "SmilePact" ["CureDecors"]]
      ["CureBeauty"]
      transformationSpeech_Beauty

  , mkTransformation
      ["Miyuki", "Akane", "Yayoi", "Nao", "Reika"]
      [mkIA "SmilePact" ["CureDecors"]]
      ["CureHappy","CureSunny","CurePeace","CureMarch","CureBeauty"]
      transformationSpeech_Smile

  , mkTransformation
      ["CureHappy", "CureSunny", "CurePeace", "CureMarch", "CureBeauty"]
      [mkIA "PrincessCandle" ["CureDecors"]]
      ["PrincessHappy","PrincessSunny","PrincessPeace","PrincessMarch","PrincessBeauty"]
      transformationSpeech_Smile_Princess

  ]


purifications :: [Purification]
purifications =
  [ mkPurification
      ["CureHappy"]
      [mkIA "SmilePact" ["CureDecors"]]
      purificationSpeech_Happy

  , mkPurification
      ["CureSunny"]
      [mkIA "SmilePact" ["CureDecors"]]
      purificationSpeech_Sunny

  , mkPurification
      ["CurePeace"]
      [mkIA "SmilePact" ["CureDecors"]]
      purificationSpeech_Peace

  , mkPurification
      ["CureMarch"]
      [mkIA "SmilePact" ["CureDecors"]]
      purificationSpeech_March

  , mkPurification
      ["CureBeauty"]
      [mkIA "SmilePact" ["CureDecors"]]
      purificationSpeech_Beauty

  , mkPurification
      ["PrincessHappy", "PrincessSunny", "PrincessPeace", "PrincessMarch", "PrincessBeauty"]
      [mkIA "RoyalClock" ["CureDecors"]]
      purificationSpeech_Smile

  ]


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ 
  ]


