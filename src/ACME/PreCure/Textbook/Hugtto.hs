{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module ACME.PreCure.Textbook.Hugtto where

import           ACME.PreCure.Types.TH

import           ACME.PreCure.Textbook.Hugtto.Profiles

{-# ANN module girlsHugtto #-}
$(declareGirls girlsHugtto)

{-# ANN module transformeesHugtto #-}
$(declareTransformees transformeesHugtto)

{-# ANN module transformedGroupsHugtto #-}
$(declareTransformedGroups transformedGroupsHugtto)

{-# ANN module specialItemsHugtto #-}
$(declareSpecialItems specialItemsHugtto)

{-# ANN module transformationsHugtto #-}
$(declareTransformations transformationsHugtto)

{-# ANN module purificationsHugtto #-}
$(declarePurifications purificationsHugtto)
