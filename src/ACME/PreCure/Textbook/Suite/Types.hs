{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Textbook.Suite.Types where


import           ACME.PreCure.Textbook.Suite.Words
import           ACME.PreCure.Types.TH


data Hibiki = Hibiki deriving (Eq, Show)
data Kanade = Kanade deriving (Eq, Show)
data Ellen  = Ellen deriving (Eq, Show)
data Ako    = Ako deriving (Eq, Show)

girlInstance [t| Hibiki |] girlName_Hibiki
girlInstance [t| Kanade |] girlName_Kanade
girlInstance [t| Ellen |] girlName_Ellen
girlInstance [t| Ako |] girlName_Ako

data CureMelody = CureMelody deriving (Eq, Show)
data CureRhythm = CureRhythm deriving (Eq, Show)
data CureBeat   = CureBeat deriving (Eq, Show)
data CureMuse   = CureMuse deriving (Eq, Show)

data CureModules fs = CureModules fs deriving (Eq, Show)

data Dory = Dory deriving (Eq, Show)
data Rery = Rery deriving (Eq, Show)
data Miry = Miry deriving (Eq, Show)
data Fary = Fary deriving (Eq, Show)
data Sory = Sory deriving (Eq, Show)
data Lary = Lary deriving (Eq, Show)
data Tiry = Tiry deriving (Eq, Show)
data Dodory = Dodory deriving (Eq, Show)

data MiracleBelltier miry   = MiracleBelltier miry deriving (Eq, Show)
data FantasticBelltier fary = FantasticBelltier fary deriving (Eq, Show)
data LoveGuitarRod sory = LoveGuitarRod sory deriving (Eq, Show)

data HealingChest = HealingChest deriving (Eq, Show)

transformedInstanceDefault [t| CureMelody |] cureName_Melody introducesHerselfAs_Melody
transformedInstanceDefault [t| CureRhythm |] cureName_Rhythm introducesHerselfAs_Rhythm
transformedInstanceDefault [t| CureBeat |] cureName_Beat introducesHerselfAs_Beat
transformedInstanceDefault [t| CureMuse |] cureName_Muse introducesHerselfAs_Muse

transformedGroupInstanceDefault
  [t| (CureMelody, CureRhythm, CureBeat, CureMuse) |]
  groupName_Suite

transformationInstance
  [t| (Hibiki, Kanade) |]
  [t| (CureModules Dory, CureModules Rery) |]
  [t| (CureMelody, CureRhythm) |]
  [| (CureMelody, CureRhythm) |]
  transformationSpeech_Melody_Rhythm
transformationInstance [t| Ellen |] [t| CureModules Lary |] [t| CureBeat |] [| CureBeat |] transformationSpeech_Beat
transformationInstance [t| Ako |] [t| CureModules Dodory |] [t| CureMuse |] [| CureMuse |] transformationSpeech_Muse

transformationInstance
  [t| (Hibiki, Kanade, Ellen) |]
  [t| (CureModules Dory, CureModules Rery, CureModules Lary) |]
  [t| (CureMelody, CureRhythm, CureBeat) |]
  [| (CureMelody, CureRhythm, CureBeat) |]
  transformationSpeech_Melody_Rhythm_Beat

transformationInstance
  [t| (Hibiki, Kanade, Ellen, Ako) |]
  [t| (CureModules Dory, CureModules Rery, CureModules Lary, CureModules Dodory) |]
  [t| (CureMelody, CureRhythm, CureBeat, CureMuse) |]
  [| (CureMelody, CureRhythm, CureBeat, CureMuse) |]
  transformationSpeech_Suite

purificationInstance [t| CureMelody |] [t| MiracleBelltier Miry |] purificationSpeech_Melody
purificationInstance [t| CureRhythm |] [t| FantasticBelltier Fary |] purificationSpeech_Rhythm
purificationInstance [t| CureBeat |] [t| LoveGuitarRod Sory |] purificationSpeech_Beat
purificationInstance [t| CureMuse |] [t| CureModules Tiry |] purificationSpeech_Muse

purificationInstance
  [t| (CureMelody, CureRhythm, CureBeat, CureMuse) |]
  [t| HealingChest |]
  purificationSpeech_Suite
