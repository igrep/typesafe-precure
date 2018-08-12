{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.Suite.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.Suite.Words


girls :: [Girl]
girls =
  [ mkGirl ("Hibiki" ++ error "Need family name!") girlName_Hibiki
  , mkGirl ("Kanade" ++ error "Need family name!") girlName_Kanade
  , mkGirl ("Ellen" ++ error "Need family name!") girlName_Ellen
  , mkGirl ("Ako" ++ error "Need family name!") girlName_Ako
  ]


transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Melody"
      ""
      cureName_Melody
      ""
      introducesHerselfAs_Melody

  , mkTransformee
      "Cure Rhythm"
      ""
      cureName_Rhythm
      ""
      introducesHerselfAs_Rhythm

  , mkTransformee
      "Cure Beat"
      ""
      cureName_Beat
      ""
      introducesHerselfAs_Beat

  , mkTransformee
      "Cure Muse"
      ""
      cureName_Muse
      ""
      introducesHerselfAs_Muse

  ]


transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CureMelody", "CureRhythm", "CureBeat", "CureMuse"] "Suite" "" groupName_Suite ""
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "CureModules" (error "Specify specialItemNameJa") ["fs"]
  , mkSpecialItem "Dory" (error "Specify specialItemNameJa") []
  , mkSpecialItem "Rery" (error "Specify specialItemNameJa") []
  , mkSpecialItem "Miry" (error "Specify specialItemNameJa") []
  , mkSpecialItem "Fary" (error "Specify specialItemNameJa") []
  , mkSpecialItem "Sory" (error "Specify specialItemNameJa") []
  , mkSpecialItem "Lary" (error "Specify specialItemNameJa") []
  , mkSpecialItem "Tiry" (error "Specify specialItemNameJa") []
  , mkSpecialItem "Dodory" (error "Specify specialItemNameJa") []
  , mkSpecialItem "MiracleBelltier" (error "Specify specialItemNameJa") ["miry"]
  , mkSpecialItem "FantasticBelltier" (error "Specify specialItemNameJa") ["fary"]
  , mkSpecialItem "LoveGuitarRod" (error "Specify specialItemNameJa") ["sory"]
  , mkSpecialItem "HealingChest" (error "Specify specialItemNameJa") []
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Hibiki", "Kanade"]
      [mkIA "CureModules" ["Dory"], mkIA "CureModules" ["Rery"]]
      ["CureMelody","CureRhythm"]
      transformationSpeech_Melody_Rhythm

  , mkTransformation
      ["Ellen"]
      [mkIA "CureModules" ["Lary"]]
      ["CureBeat"]
      transformationSpeech_Beat

  , mkTransformation
      ["Ako"]
      [mkIA "CureModules" ["Dodory"]]
      ["CureMuse"]
      transformationSpeech_Muse

  , mkTransformation
      ["Hibiki", "Kanade", "Ellen"]
      [mkIA "CureModules" ["Dory"], mkIA "CureModules" ["Rery"], mkIA "CureModules" ["Lary"]]
      ["CureMelody","CureRhythm","CureBeat"]
      transformationSpeech_Melody_Rhythm_Beat

  , mkTransformation
      ["Hibiki", "Kanade", "Ellen", "Ako"]
      [mkIA "CureModules" ["Dory"], mkIA "CureModules" ["Rery"], mkIA "CureModules" ["Lary"], mkIA "CureModules" ["Dodory"]]
      ["CureMelody","CureRhythm","CureBeat","CureMuse"]
      transformationSpeech_Suite

  ]


purifications :: [Purification]
purifications =
  [ mkPurification
      ["CureMelody"]
      [mkIA "MiracleBelltier" ["Miry"]]
      purificationSpeech_Melody

  , mkPurification
      ["CureRhythm"]
      [mkIA "FantasticBelltier" ["Fary"]]
      purificationSpeech_Rhythm

  , mkPurification
      ["CureBeat"]
      [mkIA "LoveGuitarRod" ["Sory"]]
      purificationSpeech_Beat

  , mkPurification
      ["CureMuse"]
      [mkIA "CureModules" ["Tiry"]]
      purificationSpeech_Muse

  , mkPurification
      ["CureMelody", "CureRhythm", "CureBeat", "CureMuse"]
      ["HealingChest"]
      purificationSpeech_Suite

  ]


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ 
  ]


