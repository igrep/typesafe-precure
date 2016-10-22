{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Profiles.MahoGirls
  ( Mirai(..)
  , Miracle(..)

  , Riko(..)
  , Magical(..)

  , Mofurun(..)

  , LinkleStone(..)
  , LinkleStoneDia(..)
  , LinkleStoneRuby(..)
  , LinkleStoneSapphire(..)
  , LinkleStoneTopaz(..)

  , LinkleStick(..)
  ) where

import           ACME.PreCure.Textbook.MahoGirls
import           ACME.PreCure.Types.TH


data Mirai = Mirai deriving (Eq, Show)

data Riko  = Riko deriving (Eq, Show)


$(girlInstance [t| Mirai |] girlName_Mirai)
$(girlInstance [t| Riko  |] girlName_Riko)


data Miracle          = Miracle deriving (Eq, Show)
data Miracle_Ruby     = Miracle_Ruby deriving (Eq, Show)
data Miracle_Sapphire = Miracle_Sapphire deriving (Eq, Show)
data Miracle_Topaz    = Miracle_Topaz deriving (Eq, Show)

data Magical          = Magical deriving (Eq, Show)
data Magical_Ruby     = Magical_Ruby deriving (Eq, Show)
data Magical_Sapphire = Magical_Sapphire deriving (Eq, Show)
data Magical_Topaz    = Magical_Topaz deriving (Eq, Show)

data Mofurun ls = Mofurun ls deriving (Eq, Show)

class LinkleStone ls where
  linkleStoneName :: ls -> String


data LinkleStoneDia      = LinkleStoneDia deriving (Show, Eq)
data LinkleStoneRuby     = LinkleStoneRuby deriving (Show, Eq)
data LinkleStoneSapphire = LinkleStoneSapphire deriving (Show, Eq)
data LinkleStoneTopaz    = LinkleStoneTopaz deriving (Show, Eq)

instance LinkleStone LinkleStoneDia where
  linkleStoneName _ = linkleStoneName_Dia

instance LinkleStone LinkleStoneRuby where
  linkleStoneName _ = linkleStoneName_Ruby

instance LinkleStone LinkleStoneSapphire where
  linkleStoneName _ = linkleStoneName_Sapphire

instance LinkleStone LinkleStoneTopaz where
  linkleStoneName _ = linkleStoneName_Topaz


data LinkleStick ls = LinkleStick ls deriving (Eq, Show)

transformedInstance [t| Miracle          |] cureName_Miracle introducesHerselfAs_Miracle variation_Dia
transformedInstance [t| Miracle_Ruby     |] cureName_Miracle introducesHerselfAs_Miracle variation_Ruby
transformedInstance [t| Miracle_Sapphire |] cureName_Miracle introducesHerselfAs_Miracle variation_Sapphire
transformedInstance [t| Miracle_Topaz    |] cureName_Miracle introducesHerselfAs_Miracle variation_Topaz

transformedInstance [t| Magical          |] cureName_Magical introducesHerselfAs_Magical variation_Dia
transformedInstance [t| Magical_Ruby     |] cureName_Magical introducesHerselfAs_Magical variation_Ruby
transformedInstance [t| Magical_Sapphire |] cureName_Magical introducesHerselfAs_Magical variation_Sapphire
transformedInstance [t| Magical_Topaz    |] cureName_Magical introducesHerselfAs_Magical variation_Topaz

transformationInstance
  [t| (Mirai, Riko) |]
  [t| (Mofurun LinkleStoneDia) |]
  [t| (Miracle, Magical) |]
  [| (Miracle, Magical) |]
  transformationSpeech_Miracle_Magical

transformationInstance
  [t| (Mirai, Riko) |]
  [t| (Mofurun LinkleStoneRuby) |]
  [t| (Miracle_Ruby, Magical_Ruby) |]
  [| (Miracle_Ruby, Magical_Ruby) |]
  transformationSpeech_Miracle_Magical_Ruby

transformationInstance
  [t| (Mirai, Riko) |]
  [t| (Mofurun LinkleStoneSapphire) |]
  [t| (Miracle_Sapphire, Magical_Sapphire) |]
  [| (Miracle_Sapphire, Magical_Sapphire) |]
  transformationSpeech_Miracle_Magical_Sapphire

transformationInstance
  [t| (Mirai, Riko) |]
  [t| (Mofurun LinkleStoneTopaz) |]
  [t| (Miracle_Topaz, Magical_Topaz) |]
  [| (Miracle_Topaz, Magical_Topaz) |]
  transformationSpeech_Miracle_Magical_Topaz


purificationInstance
  [t| (Miracle, Magical) |]
  [t| (Mofurun LinkleStoneDia, LinkleStick LinkleStoneDia) |]
  purificationSpeech_Miracle_Magical

purificationInstance
  [t| (Miracle_Ruby, Magical_Ruby) |]
  [t| (Mofurun LinkleStoneRuby, LinkleStick LinkleStoneRuby) |]
  purificationSpeech_Miracle_Magical_Ruby

purificationInstance
  [t| (Miracle_Sapphire, Magical_Sapphire) |]
  [t| (Mofurun LinkleStoneSapphire, LinkleStick LinkleStoneSapphire) |]
  purificationSpeech_Miracle_Magical_Sapphire

purificationInstance
  [t| (Miracle_Topaz, Magical_Topaz) |]
  [t| (Mofurun LinkleStoneTopaz, LinkleStick LinkleStoneTopaz) |]
  purificationSpeech_Miracle_Magical_Topaz
