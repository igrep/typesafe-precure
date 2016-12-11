{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Textbook.GoPrincess.Types where


import           ACME.PreCure.Textbook.GoPrincess.Words
import           ACME.PreCure.Types.TH


data Haruka = Haruka deriving (Eq, Show)
data Minami = Minami deriving (Eq, Show)
data Kirara = Kirara deriving (Eq, Show)
data Towa   = Towa deriving (Eq, Show)

girlInstance [t| Haruka |] girlName_Haruka
girlInstance [t| Minami |] girlName_Minami
girlInstance [t| Kirara |] girlName_Kirara
girlInstance [t| Towa |] girlName_Towa

data CureFlora   = CureFlora deriving (Eq, Show)
data CureMermaid = CureMermaid deriving (Eq, Show)
data CureTwinkle = CureTwinkle deriving (Eq, Show)
data CureScarlet = CureScarlet deriving (Eq, Show)

data CureFlora_ModeElegant   = CureFlora_ModeElegant deriving (Eq, Show)
data CureMermaid_ModeElegant = CureMermaid_ModeElegant deriving (Eq, Show)
data CureTwinkle_ModeElegant = CureTwinkle_ModeElegant deriving (Eq, Show)
data CureScarlet_ModeElegant = CureScarlet_ModeElegant deriving (Eq, Show)

data CureFlora_ModeElegantRoyal   = CureFlora_ModeElegantRoyal deriving (Eq, Show)
data CureMermaid_ModeElegantRoyal = CureMermaid_ModeElegantRoyal deriving (Eq, Show)
data CureTwinkle_ModeElegantRoyal = CureTwinkle_ModeElegantRoyal deriving (Eq, Show)
data CureScarlet_ModeElegantRoyal = CureScarlet_ModeElegantRoyal deriving (Eq, Show)

data PrincessPerfume dk = PrincessPerfume dk deriving (Eq, Show)
data CrystalPrincessRod dk = CrystalPrincessRod dk deriving (Eq, Show)
data ScarletViolin dk = ScarletViolin dk deriving (Eq, Show)
data MusicPrincessPalace dk = MusicPrincessPalace dk deriving (Eq, Show)


-- http://prettycure.wikia.com/wiki/Dress_Up_Key
data DressUpKey_Flora   = DressUpKey_Flora deriving (Eq, Show)
data DressUpKey_Rose   = DressUpKey_Rose deriving (Eq, Show)
data DressUpKey_Lily   = DressUpKey_Lily deriving (Eq, Show)
data DressUpKey_Sakura   = DressUpKey_Sakura deriving (Eq, Show)

data DressUpKey_Mermaid = DressUpKey_Mermaid deriving (Eq, Show)
data DressUpKey_Ice = DressUpKey_Ice deriving (Eq, Show)
data DressUpKey_Bubble = DressUpKey_Bubble deriving (Eq, Show)
data DressUpKey_Sango = DressUpKey_Sango deriving (Eq, Show)

data DressUpKey_Twinkle = DressUpKey_Twinkle deriving (Eq, Show)
data DressUpKey_Luna = DressUpKey_Luna deriving (Eq, Show)
data DressUpKey_ShootingStar = DressUpKey_ShootingStar deriving (Eq, Show)
data DressUpKey_Ginga = DressUpKey_Ginga deriving (Eq, Show)

data DressUpKey_Scarlet = DressUpKey_Scarlet deriving (Eq, Show)
data DressUpKey_Phoenix = DressUpKey_Phoenix deriving (Eq, Show)
data DressUpKey_Hanabi = DressUpKey_Hanabi deriving (Eq, Show)
data DressUpKey_Sun = DressUpKey_Sun deriving (Eq, Show)

data RoyalDressUpKey = RoyalDressUpKey deriving (Eq, Show)

transformedInstanceDefault [t| CureFlora |] cureName_Flora introducesHerselfAs_Flora
transformedInstanceDefault [t| CureMermaid |] cureName_Mermaid introducesHerselfAs_Mermaid
transformedInstanceDefault [t| CureTwinkle |] cureName_Twinkle introducesHerselfAs_Twinkle
transformedInstanceDefault [t| CureScarlet |] cureName_Scarlet introducesHerselfAs_Scarlet

transformedInstance [t| CureFlora_ModeElegant |] cureName_Flora introducesHerselfAs_Flora variation_ModeElegant
transformedInstance [t| CureMermaid_ModeElegant |] cureName_Mermaid introducesHerselfAs_Mermaid variation_ModeElegant
transformedInstance [t| CureTwinkle_ModeElegant |] cureName_Twinkle introducesHerselfAs_Twinkle variation_ModeElegant
transformedInstance [t| CureScarlet_ModeElegant |] cureName_Scarlet introducesHerselfAs_Scarlet variation_ModeElegant

transformedInstance [t| CureFlora_ModeElegantRoyal |] cureName_Flora introducesHerselfAs_Flora variation_ModeElegantRoyal
transformedInstance [t| CureMermaid_ModeElegantRoyal |] cureName_Mermaid introducesHerselfAs_Mermaid variation_ModeElegantRoyal
transformedInstance [t| CureTwinkle_ModeElegantRoyal |] cureName_Twinkle introducesHerselfAs_Twinkle variation_ModeElegantRoyal
transformedInstance [t| CureScarlet_ModeElegantRoyal |] cureName_Scarlet introducesHerselfAs_Scarlet variation_ModeElegantRoyal

transformedGroupInstanceDefault
  [t| (CureFlora, CureMermaid, CureTwinkle, CureScarlet) |]
  groupName_GoPrincess

transformedGroupInstance
  [t| (CureFlora_ModeElegantRoyal, CureMermaid_ModeElegantRoyal, CureTwinkle_ModeElegantRoyal, CureScarlet_ModeElegantRoyal) |]
  groupName_GoPrincess
  variation_ModeElegantRoyal

transformationInstance [t| Haruka |] [t| PrincessPerfume DressUpKey_Flora |] [t| CureFlora |] [| CureFlora |] transformationSpeech_Flora
transformationInstance [t| Minami |] [t| PrincessPerfume DressUpKey_Mermaid |] [t| CureMermaid |] [| CureMermaid |] transformationSpeech_Mermaid
transformationInstance [t| Kirara |] [t| PrincessPerfume DressUpKey_Twinkle |] [t| CureTwinkle |] [| CureTwinkle |] transformationSpeech_Twinkle
transformationInstance [t| Towa |] [t| PrincessPerfume DressUpKey_Scarlet |] [t| CureScarlet |] [| CureScarlet |] transformationSpeech_Scarlet

transformationInstance [t| CureFlora |] [t| PrincessPerfume DressUpKey_Flora |] [t| CureFlora_ModeElegant |] [| CureFlora_ModeElegant |] transformationSpeech_GoPrincess_ModeElegant
transformationInstance [t| CureMermaid |] [t| PrincessPerfume DressUpKey_Mermaid |] [t| CureMermaid_ModeElegant |] [| CureMermaid_ModeElegant |] transformationSpeech_GoPrincess_ModeElegant
transformationInstance [t| CureTwinkle |] [t| PrincessPerfume DressUpKey_Twinkle |] [t| CureTwinkle_ModeElegant |] [| CureTwinkle_ModeElegant |] transformationSpeech_GoPrincess_ModeElegant
transformationInstance [t| CureScarlet |] [t| PrincessPerfume DressUpKey_Phoenix |] [t| CureScarlet_ModeElegant |] [| CureScarlet_ModeElegant |] transformationSpeech_GoPrincess_ModeElegant

transformationInstance
  [t| (Haruka, Minami, Kirara) |]
  [t| (PrincessPerfume DressUpKey_Flora, PrincessPerfume DressUpKey_Mermaid, PrincessPerfume DressUpKey_Twinkle) |]
  [t| (CureFlora, CureMermaid, CureTwinkle) |]
  [| (CureFlora, CureMermaid, CureTwinkle) |]
  transformationSpeech_Flora_Mermaid_Twinkle

transformationInstance
  [t| (Haruka, Minami, Kirara, Towa) |]
  [t| (PrincessPerfume DressUpKey_Flora, PrincessPerfume DressUpKey_Mermaid, PrincessPerfume DressUpKey_Twinkle, PrincessPerfume DressUpKey_Scarlet) |]
  [t| (CureFlora, CureMermaid, CureTwinkle, CureScarlet) |]
  [| (CureFlora, CureMermaid, CureTwinkle, CureScarlet) |]
  transformationSpeech_GoPrincess

transformationInstance
  [t| (CureFlora, CureMermaid, CureTwinkle, CureScarlet) |]
  [t| (MusicPrincessPalace RoyalDressUpKey) |]
  [t| (CureFlora_ModeElegantRoyal, CureMermaid_ModeElegantRoyal, CureTwinkle_ModeElegantRoyal, CureScarlet_ModeElegantRoyal) |]
  [| (CureFlora_ModeElegantRoyal, CureMermaid_ModeElegantRoyal, CureTwinkle_ModeElegantRoyal, CureScarlet_ModeElegantRoyal) |]
  transformationSpeech_GoPrincess_ModeElegantRoyal

nonItemPurificationInstance [t| CureFlora_ModeElegant |] purificationSpeech_Flora
purificationInstance [t| CureFlora |] [t| CrystalPrincessRod DressUpKey_Rose |] purificationSpeech_Flora_Rose
purificationInstance [t| CureFlora |] [t| CrystalPrincessRod DressUpKey_Lily |] purificationSpeech_Flora_Lily
purificationInstance [t| CureFlora |] [t| MusicPrincessPalace DressUpKey_Sakura |] purificationSpeech_Flora_Sakura

nonItemPurificationInstance [t| CureMermaid_ModeElegant |] purificationSpeech_Mermaid
purificationInstance [t| CureMermaid |] [t| CrystalPrincessRod DressUpKey_Ice |] purificationSpeech_Mermaid_Ice
purificationInstance [t| CureMermaid |] [t| CrystalPrincessRod DressUpKey_Bubble |] purificationSpeech_Mermaid_Bubble
purificationInstance [t| CureMermaid |] [t| MusicPrincessPalace DressUpKey_Sango |] purificationSpeech_Mermaid_Sango

nonItemPurificationInstance [t| CureTwinkle_ModeElegant |] purificationSpeech_Twinkle
purificationInstance [t| CureTwinkle |] [t| CrystalPrincessRod DressUpKey_Luna |] purificationSpeech_Twinkle_Luna
purificationInstance [t| CureTwinkle |] [t| CrystalPrincessRod DressUpKey_ShootingStar |] purificationSpeech_Twinkle_ShootingStar
purificationInstance [t| CureTwinkle |] [t| MusicPrincessPalace DressUpKey_Ginga |] purificationSpeech_Twinkle_Ginga

purificationInstance [t| CureScarlet_ModeElegant |] [t| ScarletViolin DressUpKey_Phoenix |] purificationSpeech_Scarlet_Phoenix
purificationInstance [t| CureScarlet |] [t| ScarletViolin DressUpKey_Scarlet |] purificationSpeech_Scarlet
purificationInstance [t| CureScarlet |] [t| ScarletViolin DressUpKey_Hanabi |] purificationSpeech_Scarlet_Hanabi
purificationInstance [t| CureScarlet |] [t| MusicPrincessPalace DressUpKey_Sun |] purificationSpeech_Scarlet_Sun

purificationInstance
  [t| (CureFlora_ModeElegantRoyal, CureMermaid_ModeElegantRoyal, CureTwinkle_ModeElegantRoyal, CureScarlet_ModeElegantRoyal) |]
  [t| (MusicPrincessPalace RoyalDressUpKey) |]
  purificationSpeech_GoPrincess_ModeElegantRoyal
