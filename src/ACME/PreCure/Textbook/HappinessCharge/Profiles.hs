{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.HappinessCharge.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.HappinessCharge.Words


girls :: [Girl]
girls =
  [ mkGirl ("Megumi" ++ error "Need family name!") girlName_Megumi
  , mkGirl ("Hime" ++ error "Need family name!") girlName_Hime
  , mkGirl ("Yuko" ++ error "Need family name!") girlName_Yuko
  , mkGirl ("Iona" ++ error "Need family name!") girlName_Iona
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
      "introducesHerselfAs_Lovely"

  , mkTransformee
      "Cure Princess"
      "Innocent Form"
      cureName_Princess
      variation_InnocentForm
      "introducesHerselfAs_Princess"

  , mkTransformee
      "Cure Honey"
      "Innocent Form"
      cureName_Honey
      variation_InnocentForm
      "introducesHerselfAs_Honey"

  , mkTransformee
      "Cure Fortune"
      "Innocent Form"
      cureName_Fortune
      variation_InnocentForm
      "introducesHerselfAs_Fortune"

  ]


transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CureLovely", "CurePrincess", "CureHoney", "CureFortune"] "Happiness Charge" "" groupName_HappinessCharge ""
  , mkTransformedGroup ["CureLovely_InnocentForm", "CurePrincess_InnocentForm", "CureHoney_InnocentForm", "CureFortune_InnocentForm"] "Happiness Charge" "Innocent Form" groupName_HappinessCharge variation_InnocentForm
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "PreChanMirror" (error "Specify specialItemNameJa") ["pc"]
  , mkSpecialItem "FortunePiano" (error "Specify specialItemNameJa") ["pc"]
  , mkSpecialItem "PreCard_Lovely" (error "Specify specialItemNameJa") []
  , mkSpecialItem "PreCard_Princess" (error "Specify specialItemNameJa") []
  , mkSpecialItem "PreCard_Honey" (error "Specify specialItemNameJa") []
  , mkSpecialItem "PreCard_Fortune" (error "Specify specialItemNameJa") []
  , mkSpecialItem "PreCard_Lovely_InnocentForm" (error "Specify specialItemNameJa") []
  , mkSpecialItem "PreCard_Princess_InnocentForm" (error "Specify specialItemNameJa") []
  , mkSpecialItem "PreCard_Honey_InnocentForm" (error "Specify specialItemNameJa") []
  , mkSpecialItem "PreCard_Fortune_InnocentForm" (error "Specify specialItemNameJa") []
  , mkSpecialItem "LovePreBrace" (error "Specify specialItemNameJa") []
  , mkSpecialItem "TripleDanceHoneyBaton" (error "Specify specialItemNameJa") []
  , mkSpecialItem "FortuneTambourine" (error "Specify specialItemNameJa") []
  , mkSpecialItem "ShiningMakeDresser" (error "Specify specialItemNameJa") []
  , mkSpecialItem "InnocentHarmonyMic" (error "Specify specialItemNameJa") []
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Megumi"]
      [mkIA "PreChanMirror" ["PreCard_Lovely"]]
      ["CureLovely"]
      transformationSpeech_Lovely

  , mkTransformation
      ["Hime"]
      [mkIA "PreChanMirror" ["PreCard_Princess"]]
      ["CurePrincess"]
      transformationSpeech_Princess

  , mkTransformation
      ["Yuko"]
      [mkIA "PreChanMirror" ["PreCard_Honey"]]
      ["CureHoney"]
      transformationSpeech_Honey

  , mkTransformation
      ["Iona"]
      [mkIA "FortunePiano" ["PreCard_Fortune"]]
      ["CureFortune"]
      transformationSpeech_Fortune

  , mkTransformation
      ["Megumi", "Hime"]
      [mkIA "PreChanMirror" ["PreCard_Lovely"], mkIA "PreChanMirror" ["PreCard_Princess"]]
      ["CureLovely","CurePrincess"]
      transformationSpeech_Lovely_Princess

  , mkTransformation
      ["Megumi", "Hime", "Yuko"]
      [mkIA "PreChanMirror" ["PreCard_Lovely"], mkIA "PreChanMirror" ["PreCard_Princess"], mkIA "PreChanMirror" ["PreCard_Honey"]]
      ["CureLovely","CurePrincess","CureHoney"]
      transformationSpeech_Lovely_Princess_Honey

  , mkTransformation
      ["Megumi", "Hime", "Yuko", "Iona"]
      [mkIA "PreChanMirror" ["PreCard_Lovely"], mkIA "PreChanMirror" ["PreCard_Princess"], mkIA "PreChanMirror" ["PreCard_Honey"], mkIA "FortunePiano" ["PreCard_Fortune"]]
      ["CureLovely","CurePrincess","CureHoney","CureFortune"]
      transformationSpeech_HappinessCharge

  , mkTransformation
      ["CureLovely", "CurePrincess", "CureHoney", "CureFortune"]
      [mkIA "PreChanMirror" ["PreCard_Lovely_InnocentForm"], mkIA "PreChanMirror" ["PreCard_Princess_InnocentForm"], mkIA "PreChanMirror" ["PreCard_Honey_InnocentForm"], mkIA "FortunePiano" ["PreCard_Fortune_InnocentForm"]]
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


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ 
  ]


