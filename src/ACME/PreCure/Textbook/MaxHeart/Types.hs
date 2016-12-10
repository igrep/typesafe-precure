{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Textbook.MaxHeart.Types where

import           ACME.PreCure.Textbook.First.Words
import           ACME.PreCure.Textbook.First.Types
import           ACME.PreCure.Textbook.MaxHeart.Words
import           ACME.PreCure.Types.TH


data Hikari = Hikari deriving (Eq, Show)

data CureBlack_Max = CureBlack_Max deriving (Eq, Show)
data CureWhite_Max = CureWhite_Max deriving (Eq, Show)

$(girlInstance [t| Hikari |] girlName_Hikari)

data ShinyLuminous = ShinyLuminous deriving (Eq, Show)

data HeartfulCommune_Mepple = HeartfulCommune_Mepple deriving (Eq, Show)
data HeartfulCommune_Mipple = HeartfulCommune_Mipple deriving (Eq, Show)

data TouchCommune_Porun = TouchCommune_Porun deriving (Eq, Show)

data SparkleBrace = SparkleBrace deriving (Eq, Show)

data HeartielBaton = HeartielBaton deriving (Eq, Show)

transformedInstance [t| CureBlack_Max |] cureName_Black introducesHerselfAs_Black variation_MaxHeart
transformedInstance [t| CureWhite_Max |] cureName_White introducesHerselfAs_White variation_MaxHeart

transformedGroupInstanceDefault
  [t| (CureBlack_Max, CureWhite_Max) |]
  groupName_MaxHeart

transformedGroupInstanceDefault
  [t| (CureBlack_Max, CureWhite_Max, ShinyLuminous) |]
  groupName_MaxHeart

transformationInstance
  [t| (Nagisa, Honoka) |]
  [t| (HeartfulCommune_Mepple, HeartfulCommune_Mipple) |]
  [t| (CureBlack_Max, CureWhite_Max) |]
  [| (CureBlack_Max, CureWhite_Max) |]
  transformationSpeech_Black_White

transformationInstance
  [t| Hikari |]
  [t| TouchCommune_Porun |]
  [t| ShinyLuminous |]
  [| ShinyLuminous |]
  transformationSpeech_Luminous

nonItemPurificationInstance
  [t| (CureBlack_Max, CureWhite_Max) |]
  purificationSpeech_Black_White_Max

purificationInstance
  [t| ShinyLuminous |]
  [t| HeartielBaton |]
  purificationSpeech_Luminous

-- TODO: more purifications after confirming the phrases
