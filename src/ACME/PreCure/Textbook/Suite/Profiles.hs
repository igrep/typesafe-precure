{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.Suite.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.Suite.Words


girls :: [Girl]
girls =
  [ mkGirl "Hibiki Hojo" girlName_Hibiki
  , mkGirl "Kanade Minamino" girlName_Kanade
  , mkGirl "Ellen Kurokawa" girlName_Ellen
  , mkGirl "Ako Shirabe" girlName_Ako
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
  [ mkTransformedGroup ["CureMelody", "CureRhythm", "CureBeat", "CureMuse"] "Suite PreCure♪" "" groupName_Suite ""
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Cure Modules" "キュアモジューレ"
  , mkSpecialItem "Dory" "ドリー"
  , mkSpecialItem "Rery" "レリー"
  , mkSpecialItem "Miry" "ミリー"
  , mkSpecialItem "Fary" "ファリー"
  , mkSpecialItem "Sory" "ソリー"
  , mkSpecialItem "Lary" "ラリー"
  , mkSpecialItem "Tiry" "シリー"
  , mkSpecialItem "Dodory" "ドドリー"
  , mkSpecialItem "Miracle Belltier" "ミラクルベルティエ"
  , mkSpecialItem "Fantastic Belltier" "ファンタスティックベルティエ"
  , mkSpecialItem "Love Guitar Rod" "ラブギターロッド"
  , mkSpecialItem "Healing Chest" "ヒーリングチェスト"
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
