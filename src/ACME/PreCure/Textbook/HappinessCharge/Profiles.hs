{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.HappinessCharge.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.HappinessCharge.Words


girls :: [Girl]
girls =
  [ mkGirl "Megumi Aino" girlName_Megumi
  , mkGirl "Hime Shirayuki (Himelda Window, Cure Queen of the Blue Sky)" girlName_Hime
  , mkGirl "Yuko Omori" girlName_Yuko
  , mkGirl "Iona Hikawa" girlName_Iona
  ]


transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Lovely"
      ""
      cureName_Lovely
      ""
      introducesHerselfAs_Lovely

  , mkTransformee
      "Cure Princess"
      ""
      cureName_Princess
      ""
      introducesHerselfAs_Princess

  , mkTransformee
      "Cure Honey"
      ""
      cureName_Honey
      ""
      introducesHerselfAs_Honey

  , mkTransformee
      "Cure Fortune"
      ""
      cureName_Fortune
      ""
      introducesHerselfAs_Fortune

  , mkTransformee
      "Cure Lovely"
      "Innocent Form"
      cureName_Lovely
      variation_InnocentForm
      introducesHerselfAs_Lovely

  , mkTransformee
      "Cure Princess"
      "Innocent Form"
      cureName_Princess
      variation_InnocentForm
      introducesHerselfAs_Princess

  , mkTransformee
      "Cure Honey"
      "Innocent Form"
      cureName_Honey
      variation_InnocentForm
      introducesHerselfAs_Honey

  , mkTransformee
      "Cure Fortune"
      "Innocent Form"
      cureName_Fortune
      variation_InnocentForm
      introducesHerselfAs_Fortune
  ]


transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CureLovely", "CurePrincess", "CureHoney", "CureFortune"] "HappinessCharge PreCure!" "" groupName_HappinessCharge ""
  , mkTransformedGroup ["CureLovely_InnocentForm", "CurePrincess_InnocentForm", "CureHoney_InnocentForm", "CureFortune_InnocentForm"] "HappinessCharge PreCure!" "Innocent Form" groupName_HappinessCharge variation_InnocentForm
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "PreChan Mirror" "プリチェンミラー"
  , mkSpecialItem "Fortune Piano" "フォーチュンピアノ"
  , mkSpecialItem "PreCard Lovely" "プリカード（ラブリー）"
  , mkSpecialItem "PreCard Princess" "プリカード（プリンセス）"
  , mkSpecialItem "PreCard Honey" "プリカード（ハニー）"
  , mkSpecialItem "PreCard Fortune" "プリカード（フォーチュン）"
  , mkSpecialItem "PreCard Lovely Innocent Form" "プリカード（ラブリー：イノセントフォーム）"
  , mkSpecialItem "PreCard Princess Innocent Form" "プリカード（プリンセス：イノセントフォーム）"
  , mkSpecialItem "PreCard Honey Innocent Form" "プリカード（ハニー：イノセントフォーム）"
  , mkSpecialItem "PreCard Fortune Innocent Form" "プリカード（フォーチュン：イノセントフォーム）"
  , mkSpecialItem "Love Pre Brace" "ラブプリブレス"
  , mkSpecialItem "Triple Dance Honey Baton" "トリプルダンスハニーバトン"
  , mkSpecialItem "Fortune Tambourine" "フォーチュンタンバリン"
  , mkSpecialItem "Shining Make Dresser" "シャイニングメークドレッサー"
  , mkSpecialItem "Innocent Harmony Mic" "イノセントハーモニーマイク"
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Megumi"]
      [mkIA "PreChanMirror" ["PreCardLovely"]]
      ["CureLovely"]
      transformationSpeech_Lovely

  , mkTransformation
      ["Hime"]
      [mkIA "PreChanMirror" ["PreCardPrincess"]]
      ["CurePrincess"]
      transformationSpeech_Princess

  , mkTransformation
      ["Yuko"]
      [mkIA "PreChanMirror" ["PreCardHoney"]]
      ["CureHoney"]
      transformationSpeech_Honey

  , mkTransformation
      ["Iona"]
      [mkIA "FortunePiano" ["PreCardFortune"]]
      ["CureFortune"]
      transformationSpeech_Fortune

  , mkTransformation
      ["Megumi", "Hime"]
      [mkIA "PreChanMirror" ["PreCardLovely"], mkIA "PreChanMirror" ["PreCardPrincess"]]
      ["CureLovely","CurePrincess"]
      transformationSpeech_Lovely_Princess

  , mkTransformation
      ["Megumi", "Hime", "Yuko"]
      [mkIA "PreChanMirror" ["PreCardLovely"], mkIA "PreChanMirror" ["PreCardPrincess"], mkIA "PreChanMirror" ["PreCardHoney"]]
      ["CureLovely","CurePrincess","CureHoney"]
      transformationSpeech_Lovely_Princess_Honey

  , mkTransformation
      ["Megumi", "Hime", "Yuko", "Iona"]
      [mkIA "PreChanMirror" ["PreCardLovely"], mkIA "PreChanMirror" ["PreCardPrincess"], mkIA "PreChanMirror" ["PreCardHoney"], mkIA "FortunePiano" ["PreCardFortune"]]
      ["CureLovely","CurePrincess","CureHoney","CureFortune"]
      transformationSpeech_HappinessCharge

  , mkTransformation
      ["CureLovely", "CurePrincess", "CureHoney", "CureFortune"]
      [mkIA "PreChanMirror" ["PreCardLovelyInnocentForm"], mkIA "PreChanMirror" ["PreCardPrincessInnocentForm"], mkIA "PreChanMirror" ["PreCardHoneyInnocentForm"], mkIA "FortunePiano" ["PreCardFortuneInnocentForm"]]
      ["CureLovely_InnocentForm","CurePrincess_InnocentForm","CureHoney_InnocentForm","CureFortune_InnocentForm"]
      transformationSpeech_HappinessCharge_InnocentForm
  ]


purifications :: [Purification]
purifications =
  [ mkPurification
      ["CureLovely"]
      ["LovePreBrace"]
      purificationSpeech_Lovely

  , mkPurification
      ["CurePrincess"]
      ["LovePreBrace"]
      purificationSpeech_Princess

  , mkPurification
      ["CureHoney"]
      ["TripleDanceHoneyBaton"]
      purificationSpeech_Honey

  , mkPurification
      ["CureFortune"]
      ["FortuneTambourine"]
      purificationSpeech_Fortune

  , mkPurification
      ["CureLovely_InnocentForm", "CurePrincess_InnocentForm", "CureHoney_InnocentForm", "CureFortune_InnocentForm"]
      ["ShiningMakeDresser", "InnocentHarmonyMic"]
      purificationSpeech_HappinessCharge_InnocentForm
  ]
