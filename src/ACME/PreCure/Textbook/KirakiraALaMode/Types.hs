{-# LANGUAGE TemplateHaskell #-}

module ACME.PreCure.Textbook.KirakiraALaMode.Types where


import           ACME.PreCure.Types.TH


defineGirl "Ichika" "宇佐美 いちか"

defineTransformedDefault "CureWhip" "キュアホイップ" "元気と笑顔を！レッツ・ラ・まぜまぜ！キュアホイップ！できあがり！"

data SweetsPact s = SweetsPact s

define "UsagiShortcake"
