{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module ACME.PreCure.Textbook.TropicalRouge.Types where

import           ACME.PreCure.Types.TH

import           ACME.PreCure.Textbook.TropicalRouge.Profiles

$(declareGirls girls)

$(declareTransformees transformees)

$(declareTransformedGroups transformedGroups)

$(declareSpecialItems specialItems)

$(declareTransformations transformations)

$(declarePurifications purifications)
