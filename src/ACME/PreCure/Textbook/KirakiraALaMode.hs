{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE UndecidableInstances  #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module ACME.PreCure.Textbook.KirakiraALaMode where

import           ACME.PreCure.Types.TH

import           ACME.PreCure.Textbook.KirakiraALaMode.Profiles

{-# ANN module girlsKirakiraALaMode #-}
$(declareGirls girlsKirakiraALaMode)

{-# ANN module transformeesKirakiraALaMode #-}
$(declareTransformees transformeesKirakiraALaMode)

{-# ANN module transformedGroupsKirakiraALaMode #-}
$(declareTransformedGroups transformedGroupsKirakiraALaMode)

{-# ANN module specialItemsKirakiraALaMode #-}
$(declareSpecialItems specialItemsKirakiraALaMode)

{-# ANN module transformationsKirakiraALaMode #-}
{-# ANN module purificationsKirakiraALaMode #-}
$( do
  (ts, pcgm) <- declareTransformations transformationsKirakiraALaMode
  ps <- declarePurifications pcgm purificationsKirakiraALaMode
  return $ ts ++ ps
  )
