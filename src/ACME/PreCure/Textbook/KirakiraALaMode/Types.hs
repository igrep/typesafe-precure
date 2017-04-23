{-# LANGUAGE TemplateHaskell #-}

module ACME.PreCure.Textbook.KirakiraALaMode.Types where

import           ACME.PreCure.Types.TH

import           ACME.PreCure.Textbook.KirakiraALaMode.Words


defineGirl "Ichika" "宇佐美 いちか"
defineGirl "Himari" "有栖川 ひまり"
defineGirl "Aoi" "立神 あおい"
defineGirl "Yukari" "琴爪 ゆかり"
defineGirl "Akira" "剣城 あきら"

defineTransformedDefault "CureWhip" "キュアホイップ" $ concat introducesHerselfAs_CureWhip
defineTransformedDefault "CureCustard" "キュアカスタード" $ concat introducesHerselfAs_CureCustard
defineTransformedDefault "CureGelato" "キュアジェラート" $ concat introducesHerselfAs_CureGelato
defineTransformedDefault "CureMacaron" "キュアマカロン" $ concat introducesHerselfAs_CureMacaron
defineTransformedDefault "CureChocolat" "キュアショコラ" $ concat introducesHerselfAs_CureChocolat

data SweetsPact s = SweetsPact s

define "RabbitShortcake"
define "SquirrelPudding"
define "LionIce"
define "CatMacaron"
define "DogChocolate"

define "CandyRod"
