{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE TypeOperators         #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module ACME.PreCure.Textbook.DokiDoki
  ( module ACME.PreCure.Textbook.DokiDoki.Types
  ) where

import           ACME.PreCure.Types

import           ACME.PreCure.Textbook.DokiDoki.Profiles
import           ACME.PreCure.Textbook.DokiDoki.Types
import           ACME.PreCure.Textbook.DokiDoki.Words

{-# ANN module girls #-}

{-# ANN module transformees #-}

{-# ANN module transformedGroups #-}

{-# ANN module specialItems #-}

{-# ANN module transformations #-}

{-# ANN module purifications #-}

instance Transformation
  (VaryingBetweenEpisodes Mana)
  (LovelyCommuneSharuru :+: CureLoveads)
 where
  type Style (VaryingBetweenEpisodes Mana) (LovelyCommuneSharuru :+: CureLoveads) = CureHeart
  transformedStyle _ _ = CureHeart
  transformationSpeech (_mana :< jikochuSan) _ = transformationSpeech_Heart_against jikochuSan


instance Transformation
  (VaryingBetweenEpisodes (Mana, Rikka, Alice, Makoto))
  ( LovelyCommuneSharuru :+: CureLoveads
  , LovelyCommuneRaquel :+: CureLoveads
  , LovelyCommuneLance :+: CureLoveads
  , LovelyCommuneDavi :+: CureLoveads
  )
 where
  type Style
    (VaryingBetweenEpisodes (Mana, Rikka, Alice, Makoto))
    ( LovelyCommuneSharuru :+: CureLoveads
    , LovelyCommuneRaquel :+: CureLoveads
    , LovelyCommuneLance :+: CureLoveads
    , LovelyCommuneDavi :+: CureLoveads
    ) = (CureHeart, CureDiamond, CureRosetta, CureSword)
  transformedStyle _ _ = (CureHeart, CureDiamond, CureRosetta, CureSword)
  transformationSpeech (_gs :< jikochuSan) _ = transformationSpeech_Dokidoki_Heart_Diamond_Rosetta_Sword_against jikochuSan


instance Transformation
  (VaryingBetweenEpisodes (Mana, Rikka, Alice, Makoto, Aguri))
  ( LovelyCommuneSharuru :+: CureLoveads
  , LovelyCommuneRaquel :+: CureLoveads
  , LovelyCommuneLance :+: CureLoveads
  , LovelyCommuneDavi :+: CureLoveads
  , LoveEyesPalette :+: CureLoveads
  )
 where
  type Style
    (VaryingBetweenEpisodes (Mana, Rikka, Alice, Makoto, Aguri))
    ( LovelyCommuneSharuru :+: CureLoveads
    , LovelyCommuneRaquel :+: CureLoveads
    , LovelyCommuneLance :+: CureLoveads
    , LovelyCommuneDavi :+: CureLoveads
    , LoveEyesPalette :+: CureLoveads
    ) = (CureHeart, CureDiamond, CureRosetta, CureSword, CureAce)
  transformedStyle _ _ = (CureHeart, CureDiamond, CureRosetta, CureSword, CureAce)
  transformationSpeech (_gs :< jikochuSan) _ = transformationSpeech_Dokidoki_against jikochuSan
