{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module ACME.PreCure.Textbook.KirakiraALaMode.Types where

import           ACME.PreCure.Types.TH

import           ACME.PreCure.Textbook.KirakiraALaMode.Profiles

{-# ANN module girls #-}
$(declareGirls girls)

{-# ANN module transformees #-}
$(declareTransformees transformees)

{-# ANN module specialItems #-}
$(declareSpecialItems specialItems)

{-# ANN module transformations #-}
$(declareTransformations transformations)

{-# ANN module purifications #-}
$(declarePurifications purifications)
