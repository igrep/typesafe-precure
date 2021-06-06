{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE TypeOperators         #-}
{-# OPTIONS_GHC -fno-warn-orphans  #-}

module ACME.PreCure.Textbook.TropicalRouge
  ( module ACME.PreCure.Textbook.TropicalRouge.Types
  ) where

import           ACME.PreCure.Types

import           ACME.PreCure.Textbook.TropicalRouge.Profiles
import           ACME.PreCure.Textbook.TropicalRouge.Types

{-# ANN module girls #-}

{-# ANN module transformees #-}

{-# ANN module transformedGroups #-}

{-# ANN module specialItems #-}

{-# ANN module transformations #-}

{-# ANN module purifications #-}


instance Transformation
  (VaryingBetweenEpisodes (Manatsu, Sango, Minori, Asuka))
  (TropicalPact :+: HeartKuruRingCureSummer, TropicalPact :+: HeartKuruRingCureCoral, TropicalPact :+: HeartKuruRingCurePapaya, TropicalPact :+: HeartKuruRingCureFlamingo)
 where
  type Style
    (VaryingBetweenEpisodes (Manatsu, Sango, Minori, Asuka))
    (TropicalPact :+: HeartKuruRingCureSummer, TropicalPact :+: HeartKuruRingCureCoral, TropicalPact :+: HeartKuruRingCurePapaya, TropicalPact :+: HeartKuruRingCureFlamingo)
    = (CureSummer, CureCoral, CurePapaya, CureFlamingo)
  transformedStyle _ _ = (CureSummer, CureCoral, CurePapaya, CureFlamingo)
  transformationSpeech (_ps :< catchCopy) _i = transformationSpeech_TropicalRouge catchCopy


instance Purification
  (VaryingBetweenEpisodes Laura)
  MermaidAquaPot
 where
  purificationSpeech (_laura :< color) _mermaidAquaPot = mermaidAquaPotWith color
