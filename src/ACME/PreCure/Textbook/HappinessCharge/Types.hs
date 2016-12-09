{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Textbook.HappinessCharge.Types where


import           ACME.PreCure.Textbook.HappinessCharge.Words
import           ACME.PreCure.Types.TH


data Megumi = Megumi deriving (Eq, Show)
data Hime   = Hime deriving (Eq, Show)
data Yuko   = Yuko deriving (Eq, Show)
data Iona   = Iona deriving (Eq, Show)

girlInstance [t| Megumi |] girlName_Megumi
girlInstance [t| Hime |] girlName_Hime
girlInstance [t| Yuko |] girlName_Yuko
girlInstance [t| Iona |] girlName_Iona

data CureLovely   = CureLovely deriving (Eq, Show)
data CurePrincess = CurePrincess deriving (Eq, Show)
data CureHoney    = CureHoney deriving (Eq, Show)
data CureFortune  = CureFortune deriving (Eq, Show)

data CureLovely_InnocentForm   = CureLovely_InnocentForm deriving (Eq, Show)
data CurePrincess_InnocentForm = CurePrincess_InnocentForm deriving (Eq, Show)
data CureHoney_InnocentForm    = CureHoney_InnocentForm deriving (Eq, Show)
data CureFortune_InnocentForm  = CureFortune_InnocentForm deriving (Eq, Show)

data PreChanMirror pc = PreChanMirror pc deriving (Eq, Show)
data FortunePiano pc = FortunePiano pc deriving (Eq, Show)

-- TODO: Make more PreCards
data PreCard_Lovely   = PreCard_Lovely deriving (Eq, Show)
data PreCard_Princess = PreCard_Princess deriving (Eq, Show)
data PreCard_Honey    = PreCard_Honey deriving (Eq, Show)
data PreCard_Fortune  = PreCard_Fortune deriving (Eq, Show)

data PreCard_Lovely_InnocentForm   = PreCard_Lovely_InnocentForm deriving (Eq, Show)
data PreCard_Princess_InnocentForm = PreCard_Princess_InnocentForm deriving (Eq, Show)
data PreCard_Honey_InnocentForm    = PreCard_Honey_InnocentForm deriving (Eq, Show)
data PreCard_Fortune_InnocentForm  = PreCard_Fortune_InnocentForm deriving (Eq, Show)

data LovePreBrace = LovePreBrace deriving (Eq, Show)
data TripleDanceHoneyBaton = TripleDanceHoneyBaton deriving (Eq, Show)
data FortuneTambourine = FortuneTambourine deriving (Eq, Show)

data ShiningMakeDresser = ShiningMakeDresser deriving (Eq, Show)
data InnocentHarmonyMic = InnocentHarmonyMic deriving (Eq, Show)

transformedInstanceDefault [t| CureLovely |] cureName_Lovely introducesHerselfAs_Lovely
transformedInstanceDefault [t| CurePrincess |] cureName_Princess introducesHerselfAs_Princess
transformedInstanceDefault [t| CureHoney |] cureName_Honey introducesHerselfAs_Honey
transformedInstanceDefault [t| CureFortune |] cureName_Fortune introducesHerselfAs_Fortune

transformedInstance [t| CureLovely_InnocentForm |] cureName_Lovely introducesHerselfAs_Lovely variation_InnocentForm
transformedInstance [t| CurePrincess_InnocentForm |] cureName_Princess introducesHerselfAs_Princess variation_InnocentForm
transformedInstance [t| CureHoney_InnocentForm |] cureName_Honey introducesHerselfAs_Honey variation_InnocentForm
transformedInstance [t| CureFortune_InnocentForm |] cureName_Fortune introducesHerselfAs_Fortune variation_InnocentForm

transformedGroupInstanceDefault
  [t| (CureLovely, CurePrincess, CureHoney, CureFortune) |]
  groupName_HappinessCharge

transformedGroupInstance
  [t| (CureLovely_InnocentForm, CurePrincess_InnocentForm, CureHoney_InnocentForm, CureFortune_InnocentForm) |]
  groupName_HappinessCharge
  variation_InnocentForm

transformationInstance [t| Megumi |] [t| PreChanMirror PreCard_Lovely |] [t| CureLovely |] [| CureLovely |] transformationSpeech_Lovely
transformationInstance [t| Hime |] [t| PreChanMirror PreCard_Princess |] [t| CurePrincess |] [| CurePrincess |] transformationSpeech_Princess
transformationInstance [t| Yuko |] [t| PreChanMirror PreCard_Honey |] [t| CureHoney |] [| CureHoney |] transformationSpeech_Honey
transformationInstance [t| Iona |] [t| FortunePiano PreCard_Fortune |] [t| CureFortune |] [| CureFortune |] transformationSpeech_Fortune

transformationInstance
  [t| (Megumi, Hime) |]
  [t| (PreChanMirror PreCard_Lovely, PreChanMirror PreCard_Princess) |]
  [t| (CureLovely, CurePrincess) |]
  [| (CureLovely, CurePrincess) |]
  transformationSpeech_Lovely_Princess

transformationInstance
  [t| (Megumi, Hime, Yuko) |]
  [t| (PreChanMirror PreCard_Lovely, PreChanMirror PreCard_Princess, PreChanMirror PreCard_Honey) |]
  [t| (CureLovely, CurePrincess, CureHoney) |]
  [| (CureLovely, CurePrincess, CureHoney) |]
  transformationSpeech_Lovely_Princess_Honey

transformationInstance
  [t| (Megumi, Hime, Yuko, Iona) |]
  [t| (PreChanMirror PreCard_Lovely, PreChanMirror PreCard_Princess, PreChanMirror PreCard_Honey, FortunePiano PreCard_Fortune) |]
  [t| (CureLovely, CurePrincess, CureHoney, CureFortune) |]
  [| (CureLovely, CurePrincess, CureHoney, CureFortune) |]
  transformationSpeech_HappinessCharge

transformationInstance
  [t| (CureLovely, CurePrincess, CureHoney, CureFortune) |]
  [t| (PreChanMirror PreCard_Lovely_InnocentForm, PreChanMirror PreCard_Princess_InnocentForm, PreChanMirror PreCard_Honey_InnocentForm, FortunePiano PreCard_Fortune_InnocentForm) |]
  [t| (CureLovely_InnocentForm, CurePrincess_InnocentForm, CureHoney_InnocentForm, CureFortune_InnocentForm) |]
  [| (CureLovely_InnocentForm, CurePrincess_InnocentForm, CureHoney_InnocentForm, CureFortune_InnocentForm) |]
  transformationSpeech_HappinessCharge_InnocentForm

purificationInstance [t| CureLovely |] [t| LovePreBrace |] purificationSpeech_Lovely
purificationInstance [t| CurePrincess |] [t| LovePreBrace |] purificationSpeech_Princess
purificationInstance [t| CureHoney |] [t| TripleDanceHoneyBaton |] purificationSpeech_Honey
purificationInstance [t| CureFortune |] [t| FortuneTambourine |] purificationSpeech_Fortune

purificationInstance
  [t| (CureLovely_InnocentForm, CurePrincess_InnocentForm, CureHoney_InnocentForm, CureFortune_InnocentForm) |]
  [t| (ShiningMakeDresser, InnocentHarmonyMic) |]
  purificationSpeech_HappinessCharge_InnocentForm
