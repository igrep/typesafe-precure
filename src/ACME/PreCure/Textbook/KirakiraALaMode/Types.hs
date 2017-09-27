{-# LANGUAGE TemplateHaskell #-}

module ACME.PreCure.Textbook.KirakiraALaMode.Types where

import           ACME.PreCure.Types.TH

import           ACME.PreCure.Textbook.KirakiraALaMode.Profiles

{-# ANN module girls #-}
$(declareGirls girls)

{-# ANN module transformeds #-}
$(declareTransformeds transformeds)

{-# ANN module specialItems #-}
$(declareSpecialItems specialItems)
