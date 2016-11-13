{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Textbook.MahoGirls.Types where

import           ACME.PreCure.Textbook.MahoGirls.Words
import           ACME.PreCure.Types.TH


data Mirai  = Mirai deriving (Eq, Show)
-- According to the Ep. 40, Liko spells "Liko" instead of "Riko"
data Liko   = Liko deriving (Eq, Show)
data Kotoha = Kotoha deriving (Eq, Show)


$(girlInstance [t| Mirai  |] girlName_Mirai)
$(girlInstance [t| Liko   |] girlName_Liko)
$(girlInstance [t| Kotoha |] girlName_Kotoha)


data Miracle                = Miracle deriving (Eq, Show)
data Miracle_Ruby           = Miracle_Ruby deriving (Eq, Show)
data Miracle_Sapphire       = Miracle_Sapphire deriving (Eq, Show)
data Miracle_Topaz          = Miracle_Topaz deriving (Eq, Show)
data Miracle_OverTheRainbow = Miracle_OverTheRainbow deriving (Eq, Show)
data Miracle_Heartful       = Miracle_Heartful deriving (Eq, Show)

data Magical                = Magical deriving (Eq, Show)
data Magical_Ruby           = Magical_Ruby deriving (Eq, Show)
data Magical_Sapphire       = Magical_Sapphire deriving (Eq, Show)
data Magical_Topaz          = Magical_Topaz deriving (Eq, Show)
data Magical_OverTheRainbow = Magical_OverTheRainbow deriving (Eq, Show)
data Magical_Heartful       = Magical_Heartful deriving (Eq, Show)

data Felice                = Felice deriving (Eq, Show)
data Felice_OverTheRainbow = Felice_OverTheRainbow deriving (Eq, Show)
data Felice_Heartful       = Felice_Heartful deriving (Eq, Show)

data Mofurun ls = Mofurun ls deriving (Eq, Show)

data LinkleSmarthon ls = LinkleSmarthon ls deriving (Eq, Show)

data RainbowCarriage ls mof = RainbowCarriage ls mof deriving (Eq, Show)

data PreciousBrace = PreciousBrace deriving (Eq, Show)

data MiracleMofurunLight = MiracleMofurunLight deriving (Eq, Show)

class LinkleStone ls where
  linkleStoneName :: ls -> String


data LinkleStoneDia         = LinkleStoneDia deriving (Show, Eq)
data LinkleStoneRuby        = LinkleStoneRuby deriving (Show, Eq)
data LinkleStoneSapphire    = LinkleStoneSapphire deriving (Show, Eq)
data LinkleStoneTopaz       = LinkleStoneTopaz deriving (Show, Eq)
data LinkleStoneEmerald     = LinkleStoneEmerald deriving (Show, Eq)
data LinkleStoneAlexandrite = LinkleStoneAlexandrite deriving (Show, Eq)

data LinkleStoneOfHope   = LinkleStoneOfHope deriving (Show, Eq)
data HeartfulLinkleStone = HeartfulLinkleStone deriving (Show, Eq)

instance LinkleStone LinkleStoneDia          where linkleStoneName _ = linkleStoneName_Dia
instance LinkleStone LinkleStoneRuby         where linkleStoneName _ = linkleStoneName_Ruby
instance LinkleStone LinkleStoneSapphire     where linkleStoneName _ = linkleStoneName_Sapphire
instance LinkleStone LinkleStoneTopaz        where linkleStoneName _ = linkleStoneName_Topaz
instance LinkleStone LinkleStoneEmerald      where linkleStoneName _ = linkleStoneName_Emerald
instance LinkleStone LinkleStoneAlexandrite  where linkleStoneName _ = linkleStoneName_Alexandrite

instance LinkleStone LinkleStoneOfHope   where linkleStoneName _ = linkleStoneName_OfHope
instance LinkleStone HeartfulLinkleStone where linkleStoneName _ = linkleStoneName_Heartful


data LinkleStick ls = LinkleStick ls deriving (Eq, Show)
data FlowerEchoWand ls = FlowerEchoWand ls deriving (Eq, Show)

transformedInstance [t| Miracle          |] cureName_Miracle introducesHerselfAs_Miracle variation_Dia
transformedInstance [t| Miracle_Ruby     |] cureName_Miracle introducesHerselfAs_Miracle variation_Ruby
transformedInstance [t| Miracle_Sapphire |] cureName_Miracle introducesHerselfAs_Miracle variation_Sapphire
transformedInstance [t| Miracle_Topaz    |] cureName_Miracle introducesHerselfAs_Miracle variation_Topaz

transformedInstance [t| Magical          |] cureName_Magical introducesHerselfAs_Magical variation_Dia
transformedInstance [t| Magical_Ruby     |] cureName_Magical introducesHerselfAs_Magical variation_Ruby
transformedInstance [t| Magical_Sapphire |] cureName_Magical introducesHerselfAs_Magical variation_Sapphire
transformedInstance [t| Magical_Topaz    |] cureName_Magical introducesHerselfAs_Magical variation_Topaz

transformedInstanceDefault [t| Felice |] cureName_Felice introducesHerselfAs_Felice

transformedInstance
  [t| Mofurun LinkleStoneOfHope |]
  cureName_Mofurun
  introducesHerselfAs_Mofurun
  variation_Dia

transformedInstance
  [t| Mofurun (LinkleStoneOfHope, LinkleStoneRuby) |]
  cureName_Mofurun
  introducesHerselfAs_Mofurun
  variation_Ruby

transformedInstance
  [t| Mofurun (LinkleStoneOfHope, LinkleStoneSapphire) |]
  cureName_Mofurun
  introducesHerselfAs_Mofurun
  variation_Sapphire

transformedInstance
  [t| Mofurun (LinkleStoneOfHope, LinkleStoneTopaz) |]
  cureName_Mofurun
  introducesHerselfAs_Mofurun
  variation_Topaz

transformedGroupInstance
  [t| (Miracle, Magical) |]
  [| (Miracle, Magical) |]
  groupName_MahoGirls
  variation_Dia

transformedGroupInstance
  [t| (Miracle_Ruby, Magical_Ruby) |]
  [| (Miracle_Ruby, Magical_Ruby) |]
  groupName_MahoGirls
  variation_Ruby

transformedGroupInstance
  [t| (Miracle_Sapphire, Magical_Sapphire) |]
  [| (Miracle_Sapphire, Magical_Sapphire) |]
  groupName_MahoGirls
  variation_Sapphire

transformedGroupInstance
  [t| (Miracle_Topaz, Magical_Topaz) |]
  [| (Miracle_Topaz, Magical_Topaz) |]
  groupName_MahoGirls
  variation_Topaz

transformedGroupInstance
  [t| (Miracle, Magical, Felice) |]
  [| (Miracle, Magical, Felice) |]
  groupName_MahoGirls
  variation_Dia

transformedGroupInstance
  [t| (Miracle_Ruby, Magical_Ruby, Felice) |]
  [| (Miracle_Ruby, Magical_Ruby, Felice) |]
  groupName_MahoGirls
  variation_Ruby

transformedGroupInstance
  [t| (Miracle_Sapphire, Magical_Sapphire, Felice) |]
  [| (Miracle_Sapphire, Magical_Sapphire, Felice) |]
  groupName_MahoGirls
  variation_Sapphire

transformedGroupInstance
  [t| (Miracle_Topaz, Magical_Topaz, Felice) |]
  [| (Miracle_Topaz, Magical_Topaz, Felice) |]
  groupName_MahoGirls
  variation_Topaz

transformedGroupInstance
  [t| (Miracle, Magical, Felice, Mofurun LinkleStoneOfHope) |]
  [| (Miracle, Magical, Felice, Mofurun LinkleStoneOfHope) |]
  groupName_MahoGirls
  variation_Dia

transformedGroupInstance
  [t| (Miracle_Ruby, Magical_Ruby, Felice, Mofurun (LinkleStoneOfHope, LinkleStoneRuby)) |]
  [| (Miracle_Ruby, Magical_Ruby, Felice, Mofurun (LinkleStoneOfHope, LinkleStoneRuby)) |]
  groupName_MahoGirls
  variation_Ruby

transformedGroupInstance
  [t| (Miracle_Sapphire, Magical_Sapphire, Felice, Mofurun (LinkleStoneOfHope, LinkleStoneSapphire)) |]
  [| (Miracle_Sapphire, Magical_Sapphire, Felice, Mofurun (LinkleStoneOfHope, LinkleStoneSapphire)) |]
  groupName_MahoGirls
  variation_Sapphire

transformedGroupInstance
  [t| (Miracle_Topaz, Magical_Topaz, Felice, Mofurun (LinkleStoneOfHope, LinkleStoneTopaz)) |]
  [| (Miracle_Topaz, Magical_Topaz, Felice, Mofurun (LinkleStoneOfHope, LinkleStoneTopaz)) |]
  groupName_MahoGirls
  variation_Topaz

transformedGroupInstance
  [t| (Miracle_OverTheRainbow, Magical_OverTheRainbow, Felice_OverTheRainbow) |]
  [| (Miracle_OverTheRainbow, Magical_OverTheRainbow, Felice_OverTheRainbow) |]
  groupName_MahoGirls
  variation_OverTheRainbow

-- TODO: Add purification instance after watching the movie again
transformedGroupInstance
  [t| (Miracle_Heartful, Magical_Heartful, Felice_Heartful, Mofurun HeartfulLinkleStone) |]
  [| (Miracle_Heartful, Magical_Heartful, Felice_Heartful, Mofurun HeartfulLinkleStone) |]
  groupName_MahoGirls
  variation_Heartful

transformationInstance
  [t| (Mirai, Liko) |]
  [t| (Mofurun LinkleStoneDia) |]
  [t| (Miracle, Magical) |]
  [| (Miracle, Magical) |]
  transformationSpeech_Miracle_Magical

transformationInstance
  [t| (Mirai, Liko) |]
  [t| (Mofurun LinkleStoneRuby) |]
  [t| (Miracle_Ruby, Magical_Ruby) |]
  [| (Miracle_Ruby, Magical_Ruby) |]
  transformationSpeech_Miracle_Magical_Ruby

transformationInstance
  [t| (Mirai, Liko) |]
  [t| (Mofurun LinkleStoneSapphire) |]
  [t| (Miracle_Sapphire, Magical_Sapphire) |]
  [| (Miracle_Sapphire, Magical_Sapphire) |]
  transformationSpeech_Miracle_Magical_Sapphire

transformationInstance
  [t| (Mirai, Liko) |]
  [t| (Mofurun LinkleStoneTopaz) |]
  [t| (Miracle_Topaz, Magical_Topaz) |]
  [| (Miracle_Topaz, Magical_Topaz) |]
  transformationSpeech_Miracle_Magical_Topaz

transformationInstance
  [t| Kotoha |]
  [t| (LinkleSmarthon LinkleStoneEmerald) |]
  [t| Felice |]
  [| Felice |]
  transformationSpeech_Felice

transformationInstance
  [t| (Mirai, Liko, Kotoha) |]
  [t| (Mofurun LinkleStoneDia, LinkleSmarthon LinkleStoneEmerald) |]
  [t| (Miracle, Magical, Felice) |]
  [| (Miracle, Magical, Felice) |]
  transformationSpeech_MahoGirls

transformationInstance
  [t| (Mirai, Liko, Kotoha) |]
  [t| (Mofurun LinkleStoneRuby, LinkleSmarthon LinkleStoneEmerald) |]
  [t| (Miracle_Ruby, Magical_Ruby, Felice) |]
  [| (Miracle_Ruby, Magical_Ruby, Felice) |]
  transformationSpeech_MahoGirls_Ruby

transformationInstance
  [t| (Mirai, Liko, Kotoha) |]
  [t| (Mofurun LinkleStoneSapphire, LinkleSmarthon LinkleStoneEmerald) |]
  [t| (Miracle_Sapphire, Magical_Sapphire, Felice) |]
  [| (Miracle_Sapphire, Magical_Sapphire, Felice) |]
  transformationSpeech_MahoGirls_Sapphire

transformationInstance
  [t| (Mirai, Liko, Kotoha) |]
  [t| (Mofurun LinkleStoneTopaz, LinkleSmarthon LinkleStoneEmerald) |]
  [t| (Miracle_Topaz, Magical_Topaz, Felice) |]
  [| (Miracle_Topaz, Magical_Topaz, Felice) |]
  transformationSpeech_MahoGirls_Topaz


transformationInstance
  [t| (Miracle, Magical, Felice) |]
  [t| (Mofurun LinkleStoneAlexandrite, LinkleSmarthon LinkleStoneAlexandrite) |]
  [t| (Miracle_OverTheRainbow, Magical_OverTheRainbow, Felice_OverTheRainbow) |]
  [| (Miracle_OverTheRainbow, Magical_OverTheRainbow, Felice_OverTheRainbow) |]
  transformationSpeech_MahoGirls_OverTheRainbow

transformationInstance
  [t| (Miracle_Ruby, Magical_Ruby, Felice) |]
  [t| (Mofurun LinkleStoneAlexandrite, LinkleSmarthon LinkleStoneAlexandrite) |]
  [t| (Miracle_OverTheRainbow, Magical_OverTheRainbow, Felice_OverTheRainbow) |]
  [| (Miracle_OverTheRainbow, Magical_OverTheRainbow, Felice_OverTheRainbow) |]
  transformationSpeech_MahoGirls_OverTheRainbow

transformationInstance
  [t| (Miracle_Sapphire, Magical_Sapphire, Felice) |]
  [t| (Mofurun LinkleStoneAlexandrite, LinkleSmarthon LinkleStoneAlexandrite) |]
  [t| (Miracle_OverTheRainbow, Magical_OverTheRainbow, Felice_OverTheRainbow) |]
  [| (Miracle_OverTheRainbow, Magical_OverTheRainbow, Felice_OverTheRainbow) |]
  transformationSpeech_MahoGirls_OverTheRainbow

transformationInstance
  [t| (Miracle_Topaz, Magical_Topaz, Felice) |]
  [t| (Mofurun LinkleStoneAlexandrite, LinkleSmarthon LinkleStoneAlexandrite) |]
  [t| (Miracle_OverTheRainbow, Magical_OverTheRainbow, Felice_OverTheRainbow) |]
  [| (Miracle_OverTheRainbow, Magical_OverTheRainbow, Felice_OverTheRainbow) |]
  transformationSpeech_MahoGirls_OverTheRainbow

-- TODO: Use Cure Mofurun value instead of raw Mofurun?
transformationInstance
  [t| Mofurun LinkleStoneOfHope |]
  [t| MiracleMofurunLight |]
  [t| Mofurun LinkleStoneOfHope |]
  [| Mofurun LinkleStoneOfHope |]
  transformationSpeech_Mofurun


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

purificationInstance
  [t| Felice |]
  [t| FlowerEchoWand LinkleStoneEmerald |]
  purificationSpeech_Felice

purificationInstance
  [t| (Miracle_OverTheRainbow, Magical_OverTheRainbow, Felice_OverTheRainbow) |]
  [t| (RainbowCarriage LinkleStoneAlexandrite (Mofurun LinkleStoneAlexandrite), PreciousBrace) |]
  purificationSpeech_MahoGirls_extreme_rainbow
