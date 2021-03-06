{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module ACME.PreCure.Textbook.First where

import           ACME.PreCure.Types.TH

import           ACME.PreCure.Textbook.First.Profiles

{-# ANN module girls #-}
$(declareGirls girls)

{-# ANN module transformees #-}
$(declareTransformees transformees)

{-# ANN module transformedGroups #-}
$(declareTransformedGroups transformedGroups)

{-# ANN module specialItems #-}
$(declareSpecialItems specialItems)

{-# ANN module transformations #-}
$(declareTransformations transformations)

{-# ANN module purifications #-}
$(declarePurifications purifications)

{-# ANN module nonItemPurifications #-}
$(declareNonItemPurifications nonItemPurifications)
