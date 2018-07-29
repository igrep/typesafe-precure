{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Textbook.Fresh.Types where

import           Data.List
                   ( intercalate
                   )


import           ACME.PreCure.Textbook.Fresh.Words
import           ACME.PreCure.Types.TH


data Love    = Love deriving (Eq, Show)
data Miki    = Miki deriving (Eq, Show)
data Inori   = Inori deriving (Eq, Show)
data Setsuna = Setsuna deriving (Eq, Show)

girlInstance [t| Love |] girlName_Love
girlInstance [t| Miki |] girlName_Miki
girlInstance [t| Inori |] girlName_Inori
girlInstance [t| Setsuna |] girlName_Setsuna

data CurePeach   = CurePeach deriving (Eq, Show)
data CureBerry   = CureBerry deriving (Eq, Show)
data CurePine    = CurePine deriving (Eq, Show)
data CurePassion = CurePassion deriving (Eq, Show)

data Linkrun = Linkrun deriving (Eq, Show)

data CureStickPeachRod = CureStickPeachRod deriving (Eq, Show)
data CureStickBerrySword = CureStickBerrySword deriving (Eq, Show)
data CureStickPineFlute = CureStickPineFlute deriving (Eq, Show)
data PassionHarp = PassionHarp deriving (Eq, Show)

data CloverBox = CloverBox deriving (Eq, Show)

transformedInstanceDefault [t| CurePeach |] cureName_Peach (intercalate "\n" introducesHerselfAs_Peach)
transformedInstanceDefault [t| CureBerry |] cureName_Berry (intercalate "\n" introducesHerselfAs_Berry)
transformedInstanceDefault [t| CurePine |] cureName_Pine (intercalate "\n" introducesHerselfAs_Pine)
transformedInstanceDefault [t| CurePassion |] cureName_Passion (intercalate "\n" introducesHerselfAs_Passion)

transformedGroupInstanceDefault
  [t| (CurePeach, CureBerry, CurePine, CurePassion) |]
  groupName_Fresh

transformationInstance [t| Love |] [t| Linkrun |] [t| CurePeach |] [| CurePeach |] transformationSpeech_Peach
transformationInstance [t| Miki |] [t| Linkrun |] [t| CureBerry |] [| CureBerry |] transformationSpeech_Berry
transformationInstance [t| Inori |] [t| Linkrun |] [t| CurePine |] [| CurePine |] transformationSpeech_Pine
transformationInstance [t| Setsuna |] [t| Linkrun |] [t| CurePassion |] [| CurePassion |] transformationSpeech_Passion

transformationInstance
  [t| (Love, Miki, Inori, Setsuna) |]
  [t| Linkrun |]
  [t| (CurePeach, CureBerry, CurePine, CurePassion) |]
  [| (CurePeach, CureBerry, CurePine, CurePassion) |]
  transformationSpeech_Fresh

nonItemPurificationInstance [t| CurePeach |] purificationSpeech_Peach
nonItemPurificationInstance [t| CureBerry |] purificationSpeech_Berry
nonItemPurificationInstance [t| CurePine |] purificationSpeech_Pine

purificationInstance [t| CurePeach |] [t| CureStickPeachRod |] purificationSpeech_Peach_Fresh
purificationInstance [t| CureBerry |] [t| CureStickBerrySword |] purificationSpeech_Berry_Fresh
purificationInstance [t| CurePine |] [t| CureStickPineFlute |] purificationSpeech_Pine_Fresh
purificationInstance [t| CurePassion |] [t| PassionHarp |] purificationSpeech_Passion

purificationInstance
  [t| (CurePeach, CureBerry, CurePine, CurePassion) |]
  [t| CloverBox |]
  purificationSpeech_Fresh
