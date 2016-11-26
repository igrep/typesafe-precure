{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Textbook.First.Types where

import           ACME.PreCure.Textbook.First.Words
import           ACME.PreCure.Types.TH


data Nagisa = Nagisa deriving (Eq, Show)
data Honoka = Honoka deriving (Eq, Show)

$(girlInstance [t| Nagisa  |] girlName_Nagisa)
$(girlInstance [t| Honoka  |] girlName_Honoka)

data CureBlack = CureBlack deriving (Eq, Show)
data CureWhite = CureWhite deriving (Eq, Show)

data CardCommune_Mepple = CardCommune_Mepple deriving (Eq, Show)
data CardCommune_Mipple = CardCommune_Mipple deriving (Eq, Show)

data RainbowBrace = RainbowBrace deriving (Eq, Show)

transformedInstanceDefault [t| CureBlack |] cureName_Black introducesHerselfAs_Black
transformedInstanceDefault [t| CureWhite |] cureName_White introducesHerselfAs_White

transformedGroupInstanceDefault
  [t| (CureBlack, CureWhite) |]
  groupName_First

transformationInstance
  [t| (Nagisa, Honoka) |]
  [t| (CardCommune_Mepple, CardCommune_Mipple) |]
  [t| (CureBlack, CureWhite) |]
  [| (CureBlack, CureWhite) |]
  transformationSpeech_Black_White

nonItemPurificationInstance
  [t| (CureBlack, CureWhite) |]
  purificationSpeech_Black_White

purificationInstance
  [t| (CureBlack, CureWhite) |]
  [t| RainbowBrace |]
  purificationSpeech_Black_White_RainbowStorm
