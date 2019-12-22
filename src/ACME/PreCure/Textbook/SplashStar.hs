{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE UndecidableInstances  #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module ACME.PreCure.Textbook.SplashStar where

import           ACME.PreCure.Types.TH

import           ACME.PreCure.Textbook.SplashStar.Profiles

{-# ANN module girls #-}
$(declareGirls girls)

{-# ANN module transformees #-}
$(declareTransformees transformees)

{-# ANN module transformedGroups #-}
$(declareTransformedGroups transformedGroups)

{-# ANN module specialItems #-}
$(declareSpecialItems specialItems)

{-# ANN module transformations #-}
{-# ANN module nonItemPurifications #-}
$( do
  (ts, pcgm) <- declareTransformations transformations
  nps <- declareNonItemPurifications pcgm nonItemPurifications
  return $ ts ++ nps
  )
