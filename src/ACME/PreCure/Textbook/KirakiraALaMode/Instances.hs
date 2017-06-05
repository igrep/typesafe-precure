{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module ACME.PreCure.Textbook.KirakiraALaMode.Instances where


import           ACME.PreCure.Types.TH

import           ACME.PreCure.Textbook.KirakiraALaMode.Types
import           ACME.PreCure.Textbook.KirakiraALaMode.Words


transformationInstance [t| Ichika |] [t| SweetsPact RabbitShortcake |] [t| CureWhip |] [| CureWhip |] (cureALaModeDecoration : introducesHerselfAs_CureWhip)
transformationInstance [t| Himari |] [t| SweetsPact SquirrelPudding |] [t| CureCustard |] [| CureCustard |] (cureALaModeDecoration : introducesHerselfAs_CureCustard)
transformationInstance [t| Aoi |] [t| SweetsPact LionIce |] [t| CureGelato |] [| CureGelato |] (cureALaModeDecoration : introducesHerselfAs_CureGelato)
transformationInstance [t| Yukari |] [t| SweetsPact CatMacaron |] [t| CureMacaron |] [| CureMacaron |] (cureALaModeDecoration : introducesHerselfAs_CureMacaron)
transformationInstance [t| Akira |] [t| SweetsPact DogChocolate |] [t| CureChocolat |] [| CureChocolat |] (cureALaModeDecoration : introducesHerselfAs_CureChocolat)

transformationInstance
  [t| (Ichika, Himari, Aoi, Yukari, Akira) |]
  [t| (SweetsPact RabbitShortcake, SweetsPact SquirrelPudding, SweetsPact LionIce, SweetsPact CatMacaron, SweetsPact DogChocolate) |]
  [t| (CureWhip, CureCustard, CureGelato, CureMacaron, CureChocolat) |]
  [| (CureWhip, CureCustard, CureGelato, CureMacaron, CureChocolat) |]
  (kirakiraALaModeTransformationSpeechFeaturing introducesHerselfAs_CureWhip)

transformationInstance
  [t| (Himari, Ichika, Aoi, Yukari, Akira) |]
  [t| (SweetsPact SquirrelPudding, SweetsPact RabbitShortcake, SweetsPact LionIce, SweetsPact CatMacaron, SweetsPact DogChocolate) |]
  [t| (CureCustard, CureWhip, CureGelato, CureMacaron, CureChocolat) |]
  [| (CureCustard, CureWhip, CureGelato, CureMacaron, CureChocolat) |]
  (kirakiraALaModeTransformationSpeechFeaturing introducesHerselfAs_CureCustard)

transformationInstance
  [t| (Aoi, Ichika, Himari, Yukari, Akira) |]
  [t| (SweetsPact LionIce, SweetsPact RabbitShortcake, SweetsPact SquirrelPudding, SweetsPact CatMacaron, SweetsPact DogChocolate) |]
  [t| (CureGelato, CureWhip, CureCustard, CureMacaron, CureChocolat) |]
  [| (CureGelato, CureWhip, CureCustard, CureMacaron, CureChocolat) |]
  (kirakiraALaModeTransformationSpeechFeaturing introducesHerselfAs_CureGelato)

transformationInstance
  [t| (Yukari, Ichika, Himari, Aoi, Akira) |]
  [t| (SweetsPact CatMacaron, SweetsPact RabbitShortcake, SweetsPact SquirrelPudding, SweetsPact LionIce, SweetsPact DogChocolate) |]
  [t| (CureMacaron, CureWhip, CureCustard, CureGelato, CureChocolat) |]
  [| (CureMacaron, CureWhip, CureCustard, CureGelato, CureChocolat) |]
  (kirakiraALaModeTransformationSpeechFeaturing introducesHerselfAs_CureMacaron)

transformationInstance
  [t| (Akira, Ichika, Himari, Aoi, Yukari) |]
  [t| (SweetsPact DogChocolate, SweetsPact RabbitShortcake, SweetsPact SquirrelPudding, SweetsPact LionIce, SweetsPact CatMacaron) |]
  [t| (CureChocolat, CureWhip, CureCustard, CureGelato, CureMacaron) |]
  [| (CureChocolat, CureWhip, CureCustard, CureGelato, CureMacaron) |]
  (kirakiraALaModeTransformationSpeechFeaturing introducesHerselfAs_CureChocolat)

transformationInstance
  [t| (Ichika, Himari, Aoi) |]
  [t| (SweetsPact RabbitShortcake, SweetsPact SquirrelPudding, SweetsPact LionIce) |]
  [t| (CureWhip, CureCustard, CureGelato) |]
  [| (CureWhip, CureCustard, CureGelato) |]
  ( kirakiraALaModeTransformationSpeechOf
      [ introducesHerselfAs_CureWhip
      , introducesHerselfAs_CureCustard
      , introducesHerselfAs_CureGelato
      ]
  )

transformationInstance
  [t| (Ichika, Himari, Aoi, Yukari) |]
  [t| (SweetsPact RabbitShortcake, SweetsPact SquirrelPudding, SweetsPact LionIce, SweetsPact CatMacaron) |]
  [t| (CureWhip, CureCustard, CureGelato, CureMacaron) |]
  [| (CureWhip, CureCustard, CureGelato, CureMacaron) |]
  ( kirakiraALaModeTransformationSpeechOf
      [ introducesHerselfAs_CureWhip
      , introducesHerselfAs_CureCustard
      , introducesHerselfAs_CureGelato
      , introducesHerselfAs_CureMacaron
      ]
  )

transformationInstance
  [t| (Yukari, Akira) |]
  [t| (SweetsPact CatMacaron, SweetsPact DogChocolate) |]
  [t| (CureMacaron, CureChocolat) |]
  [| (CureMacaron, CureChocolat) |]
  ( kirakiraALaModeTransformationSpeechOf
      [ introducesHerselfAs_CureMacaron
      , introducesHerselfAs_CureChocolat
      ]
  )

purificationInstance [t| CureWhip |]     [t| CandyRod |] ["キラキラキラルン！", "ホイップ・デコレーション！"]
purificationInstance [t| CureCustard |]  [t| CandyRod |] ["キラキラキラルン！", "カスタード・イリュージョン！"]
purificationInstance [t| CureGelato |]   [t| CandyRod |] ["キラキラキラルン！", "ジェラート・シェイク！"]
purificationInstance [t| CureMacaron |]  [t| CandyRod |] ["キラキラキラルン！", "マカロン・ジュリエンヌ！", "にゃーお♥"]
purificationInstance [t| CureChocolat |] [t| CandyRod |] ["キラキラキラルン！", "ショコラ・アロマーゼ！"]

purificationInstance
  [t| (CureWhip, CureCustard, CureGelato, CureMacaron, CureChocolat) |]
  [t| CandyRod |]
  [ "キャンディーロッド！"
  , "キラキラキラル・フルチャージ！"
  , "スイー・ツー・ワンダフル・アラモード！"
  ]
