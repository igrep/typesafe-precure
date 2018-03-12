{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module ACME.PreCure.Textbook.KirakiraALaMode.Types where

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
$(declareTransformations transformationsKirakiraALaMode)

{-# ANN module purificationsKirakiraALaMode #-}
$(declarePurifications purificationsKirakiraALaMode)
