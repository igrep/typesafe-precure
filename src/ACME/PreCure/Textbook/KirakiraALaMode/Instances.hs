{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module ACME.PreCure.Textbook.KirakiraALaMode.Instances where


import           ACME.PreCure.Types.TH

import           ACME.PreCure.Textbook.KirakiraALaMode.Types
import           ACME.PreCure.Textbook.KirakiraALaMode.Words


transformationInstance [t| Ichika |] [t| SweetsPact UsagiShortcake |] [t| CureWhip |] [| CureWhip |] (cureALaModeDecoration : introducesHerselfAs_CureWhip)
transformationInstance [t| Himari |] [t| SweetsPact RisuPudding |] [t| CureCustard |] [| CureCustard |] (cureALaModeDecoration : introducesHerselfAs_CureCustard)
transformationInstance [t| Aoi |] [t| SweetsPact LionIce |] [t| CureGelato |] [| CureGelato |] (cureALaModeDecoration : introducesHerselfAs_CureGelato)
transformationInstance [t| Yukari |] [t| SweetsPact NekoMacaron |] [t| CureMacaron |] [| CureMacaron |] (cureALaModeDecoration : introducesHerselfAs_CureMacaron)
transformationInstance [t| Akira |] [t| SweetsPact InuChocolate |] [t| CureChocolat |] [| CureChocolat |] (cureALaModeDecoration : introducesHerselfAs_CureChocolat)
