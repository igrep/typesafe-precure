{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module ACME.PreCure.Textbook.KirakiraALaMode.Instances where


import           ACME.PreCure.Types.TH

import           ACME.PreCure.Textbook.KirakiraALaMode.Types

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
