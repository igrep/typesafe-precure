{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module ACME.PreCure.Textbook.HealinGood where

import           ACME.PreCure.Types.TH

import           ACME.PreCure.Textbook.HealinGood.Profiles

{-# ANN module girls #-}
$(declareGirls girls)

{-# ANN module transformees #-}
$(declareTransformees transformees)

{-# ANN module transformedGroups #-}
$(declareTransformedGroups transformedGroups)

{-# ANN module specialItems #-}
$(declareSpecialItems2 specialItems)

{-# ANN module transformations #-}
$(declareTransformations2 transformations)

{-# ANN module purifications #-}
$(declarePurifications2 purifications)
