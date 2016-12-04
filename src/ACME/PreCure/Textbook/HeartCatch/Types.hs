{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Textbook.HeartCatch.Types where


import           ACME.PreCure.Textbook.HeartCatch.Words
import           ACME.PreCure.Types.TH


data Tsubomi = Tsubomi deriving (Eq, Show)
data Erika   = Erika deriving (Eq, Show)
data Itsuki  = Itsuki deriving (Eq, Show)
data Yuri    = Yuri deriving (Eq, Show)

girlInstance [t| Tsubomi |] girlName_Tsubomi
girlInstance [t| Erika |] girlName_Erika
girlInstance [t| Itsuki |] girlName_Itsuki
girlInstance [t| Yuri |] girlName_Yuri

data CureBlossom   = CureBlossom deriving (Eq, Show)
data CureMarine    = CureMarine deriving (Eq, Show)
data CureSunshine  = CureSunshine deriving (Eq, Show)
data CureMoonlight = CureMoonlight deriving (Eq, Show)

data SuperCureBlossom   = SuperCureBlossom deriving (Eq, Show)
data SuperCureMarine    = SuperCureMarine deriving (Eq, Show)
data SuperCureSunshine  = SuperCureSunshine deriving (Eq, Show)
data SuperCureMoonlight = SuperCureMoonlight deriving (Eq, Show)

data HeartPerfume hs = HeartPerfume hs deriving (Eq, Show)
data ShinyPerfume hs = ShinyPerfume hs deriving (Eq, Show)
data HeartPot hs = HeartPot hs deriving (Eq, Show)

-- TODO: Use distinct name for each heart seed?
data HeartSeed = HeartSeed deriving (Eq, Show)

data BlossomTakt     = BlossomTakt deriving (Eq, Show)
data MarineTakt      = MarineTakt deriving (Eq, Show)
data ShinyTambourine = ShinyTambourine deriving (Eq, Show)
data MoonTakt        = MoonTakt deriving (Eq, Show)

data HeartCatchMirage sps = HeartCatchMirage sps deriving (Eq, Show)

data SuperPreCureSeed = SuperPreCureSeed deriving (Eq, Show)

transformedInstanceDefault [t| CureBlossom |] cureName_Blossom introducesHerselfAs_Blossom
transformedInstanceDefault [t| CureMarine |] cureName_Marine introducesHerselfAs_Marine
transformedInstanceDefault [t| CureSunshine |] cureName_Sunshine introducesHerselfAs_Sunshine
transformedInstanceDefault [t| CureMoonlight |] cureName_Moonlight introducesHerselfAs_Moonlight

transformedInstance [t| SuperCureBlossom |] cureName_Blossom introducesHerselfAs_Blossom variation_SuperBlossom
transformedInstance [t| SuperCureMarine |] cureName_Marine introducesHerselfAs_Marine variation_SuperMarine
transformedInstance [t| SuperCureSunshine |] cureName_Sunshine introducesHerselfAs_Sunshine variation_SuperSunshine
transformedInstance [t| SuperCureMoonlight |] cureName_Moonlight introducesHerselfAs_Moonlight variation_SuperMoonlight

transformedGroupInstanceDefault
  [t| (CureBlossom, CureMarine, CureSunshine, CureMoonlight) |]
  groupName_HeartCatch

transformedGroupInstance
  [t| (SuperCureBlossom, SuperCureMarine, SuperCureSunshine, SuperCureMoonlight) |]
  groupName_HeartCatch
  variation_SuperSilhouette

transformationInstance [t| Tsubomi |] [t| HeartPerfume HeartSeed |] [t| CureBlossom |] [| CureBlossom |] transformationSpeech_Blossom
transformationInstance [t| Erika |] [t| HeartPerfume HeartSeed |] [t| CureMarine |] [| CureMarine |] transformationSpeech_Marine
transformationInstance [t| Itsuki |] [t| ShinyPerfume HeartSeed |] [t| CureSunshine |] [| CureSunshine |] transformationSpeech_Sunshine
transformationInstance [t| Yuri |] [t| HeartPot HeartSeed |] [t| CureMoonlight |] [| CureMoonlight |] transformationSpeech_Moonlight

transformationInstance
  [t| (Tsubomi, Erika, Itsuki, Yuri) |]
  [t| (HeartPerfume HeartSeed, HeartPerfume HeartSeed, ShinyPerfume HeartSeed, HeartPot HeartSeed) |]
  [t| (CureBlossom, CureMarine, CureSunshine, CureMoonlight) |]
  [| (CureBlossom, CureMarine, CureSunshine, CureMoonlight) |]
  transformationSpeech_HeartCatch

transformationInstance
  [t| (CureBlossom, CureMarine, CureSunshine, CureMoonlight) |]
  [t| HeartCatchMirage SuperPreCureSeed |]
  [t| (SuperCureBlossom, SuperCureMarine, SuperCureSunshine, SuperCureMoonlight) |]
  [| (SuperCureBlossom, SuperCureMarine, SuperCureSunshine, SuperCureMoonlight) |]
  transformationSpeech_HeartCatch_SuperSilhouette

purificationInstance [t| CureBlossom |] [t| BlossomTakt |] purificationSpeech_Blossom
purificationInstance [t| CureMarine |] [t| MarineTakt |] purificationSpeech_Marine
purificationInstance [t| CureSunshine |] [t| ShinyTambourine |] purificationSpeech_Sunshine
purificationInstance [t| CureMoonlight |] [t| MoonTakt |] purificationSpeech_Moonlight

purificationInstance
  [t| (CureBlossom, CureMarine, CureSunshine, CureMoonlight) |]
  [t| HeartCatchMirage SuperPreCureSeed |]
  purificationSpeech_HeartCatch_SuperSilhouette
