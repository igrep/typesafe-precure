{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module ACME.PreCure.Textbook.KirakiraALaMode.Instances where


import           ACME.PreCure.Types.TH

import           ACME.PreCure.Textbook.KirakiraALaMode.Types
-- import           ACME.PreCure.Textbook.KirakiraALaMode.Words


transformationInstance
  [t| Ichika |]
  [t| SweetsPact UsagiShortcake |]
  [t| CureWhip |]
  [| CureWhip |]
  ["元気と笑顔を！" , "レッツ・ラ・まぜまぜ！" , "キュアホイップ！できあがり！"]
