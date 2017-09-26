{-# LANGUAGE TemplateHaskell #-}

module ACME.PreCure.Textbook.KirakiraALaMode.Types where

import           ACME.PreCure.Types.TH

import           ACME.PreCure.Textbook.KirakiraALaMode.Profiles

{-# ANN module girls #-}
$(declareGirlsOf girls)

{-# ANN module transformeds #-}
$(declareTransformedsOf transformeds)

{-# ANN module specialItems #-}
$(declareSpecialItemsOf specialItems)
