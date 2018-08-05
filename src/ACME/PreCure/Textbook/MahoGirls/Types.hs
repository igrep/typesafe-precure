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


data CureMiracle                = CureMiracle deriving (Eq, Show)
data CureMiracle_Ruby           = CureMiracle_Ruby deriving (Eq, Show)
data CureMiracle_Sapphire       = CureMiracle_Sapphire deriving (Eq, Show)
data CureMiracle_Topaz          = CureMiracle_Topaz deriving (Eq, Show)
data CureMiracle_OverTheRainbow = CureMiracle_OverTheRainbow deriving (Eq, Show)
data CureMiracle_Heartful       = CureMiracle_Heartful deriving (Eq, Show)

data CureMagical                = CureMagical deriving (Eq, Show)
data CureMagical_Ruby           = CureMagical_Ruby deriving (Eq, Show)
data CureMagical_Sapphire       = CureMagical_Sapphire deriving (Eq, Show)
data CureMagical_Topaz          = CureMagical_Topaz deriving (Eq, Show)
data CureMagical_OverTheRainbow = CureMagical_OverTheRainbow deriving (Eq, Show)
data CureMagical_Heartful       = CureMagical_Heartful deriving (Eq, Show)

data CureFelice                = CureFelice deriving (Eq, Show)
data CureFelice_OverTheRainbow = CureFelice_OverTheRainbow deriving (Eq, Show)
data CureFelice_Heartful       = CureFelice_Heartful deriving (Eq, Show)

data CureMofurun               = CureMofurun deriving (Eq, Show)
data CureMofurun_Ruby          = CureMofurun_Ruby deriving (Eq, Show)
data CureMofurun_Sapphire      = CureMofurun_Sapphire deriving (Eq, Show)
data CureMofurun_Topaz         = CureMofurun_Topaz deriving (Eq, Show)
data CureMofurun_Heartful      = CureMofurun_Heartful deriving (Eq, Show)

data Mofurun ls = Mofurun ls deriving (Eq, Show)

data LinkleSmarthon ls = LinkleSmarthon ls deriving (Eq, Show)

data RainbowCarriage ls mof = RainbowCarriage ls mof deriving (Eq, Show)

data PreciousBrace = PreciousBrace deriving (Eq, Show)

data MiracleMofurunLight = MiracleMofurunLight deriving (Eq, Show)


data LinkleStoneDia         = LinkleStoneDia deriving (Show, Eq)
data LinkleStoneRuby        = LinkleStoneRuby deriving (Show, Eq)
data LinkleStoneSapphire    = LinkleStoneSapphire deriving (Show, Eq)
data LinkleStoneTopaz       = LinkleStoneTopaz deriving (Show, Eq)
data LinkleStoneEmerald     = LinkleStoneEmerald deriving (Show, Eq)
data LinkleStoneAlexandrite = LinkleStoneAlexandrite deriving (Show, Eq)

data LinkleStoneOfHope   = LinkleStoneOfHope deriving (Show, Eq)
data HeartfulLinkleStone = HeartfulLinkleStone deriving (Show, Eq)

data LinkleStick ls = LinkleStick ls deriving (Eq, Show)
data FlowerEchoWand ls = FlowerEchoWand ls deriving (Eq, Show)

transformedInstance [t| CureMiracle                |] cureName_Miracle introducesHerselfAs_Miracle variation_Dia
transformedInstance [t| CureMiracle_Ruby           |] cureName_Miracle introducesHerselfAs_Miracle variation_Ruby
transformedInstance [t| CureMiracle_Sapphire       |] cureName_Miracle introducesHerselfAs_Miracle variation_Sapphire
transformedInstance [t| CureMiracle_Topaz          |] cureName_Miracle introducesHerselfAs_Miracle variation_Topaz
transformedInstance [t| CureMiracle_OverTheRainbow |] cureName_Miracle introducesHerselfAs_Miracle variation_OverTheRainbow
transformedInstance [t| CureMiracle_Heartful       |] cureName_Miracle introducesHerselfAs_Miracle variation_Heartful

transformedInstance [t| CureMagical                |] cureName_Magical introducesHerselfAs_Magical variation_Dia
transformedInstance [t| CureMagical_Ruby           |] cureName_Magical introducesHerselfAs_Magical variation_Ruby
transformedInstance [t| CureMagical_Sapphire       |] cureName_Magical introducesHerselfAs_Magical variation_Sapphire
transformedInstance [t| CureMagical_Topaz          |] cureName_Magical introducesHerselfAs_Magical variation_Topaz
transformedInstance [t| CureMagical_OverTheRainbow |] cureName_Magical introducesHerselfAs_Magical variation_OverTheRainbow
transformedInstance [t| CureMagical_Heartful       |] cureName_Magical introducesHerselfAs_Magical variation_Heartful

transformedInstanceDefault [t| CureFelice |] cureName_Felice introducesHerselfAs_Felice
transformedInstance [t| CureFelice_OverTheRainbow |] cureName_Felice introducesHerselfAs_Felice variation_OverTheRainbow
transformedInstance [t| CureFelice_Heartful       |] cureName_Felice introducesHerselfAs_Felice variation_Heartful

transformedInstance [t| CureMofurun |] cureName_Mofurun introducesHerselfAs_Mofurun variation_Dia

transformedInstance [t| CureMofurun_Ruby |] cureName_Mofurun introducesHerselfAs_Mofurun variation_Ruby

transformedInstance [t| CureMofurun_Sapphire |] cureName_Mofurun introducesHerselfAs_Mofurun variation_Sapphire

transformedInstance [t| CureMofurun_Topaz |] cureName_Mofurun introducesHerselfAs_Mofurun variation_Topaz

transformedInstance [t| CureMofurun_Heartful |] cureName_Mofurun introducesHerselfAs_Mofurun variation_Heartful

transformedGroupInstance
  [t| (CureMiracle, CureMagical) |]
  groupName_MahoGirls
  variation_Dia

transformedGroupInstance
  [t| (CureMiracle_Ruby, CureMagical_Ruby) |]
  groupName_MahoGirls
  variation_Ruby

transformedGroupInstance
  [t| (CureMiracle_Sapphire, CureMagical_Sapphire) |]
  groupName_MahoGirls
  variation_Sapphire

transformedGroupInstance
  [t| (CureMiracle_Topaz, CureMagical_Topaz) |]
  groupName_MahoGirls
  variation_Topaz

transformedGroupInstance
  [t| (CureMiracle, CureMagical, CureFelice) |]
  groupName_MahoGirls
  variation_Dia

transformedGroupInstance
  [t| (CureMiracle_Ruby, CureMagical_Ruby, CureFelice) |]
  groupName_MahoGirls
  variation_Ruby

transformedGroupInstance
  [t| (CureMiracle_Sapphire, CureMagical_Sapphire, CureFelice) |]
  groupName_MahoGirls
  variation_Sapphire

transformedGroupInstance
  [t| (CureMiracle_Topaz, CureMagical_Topaz, CureFelice) |]
  groupName_MahoGirls
  variation_Topaz

transformedGroupInstance
  [t| (CureMiracle, CureMagical, CureFelice, CureMofurun) |]
  groupName_MahoGirls
  variation_Dia

transformedGroupInstance
  [t| (CureMiracle_Ruby, CureMagical_Ruby, CureFelice, CureMofurun_Ruby) |]
  groupName_MahoGirls
  variation_Ruby

transformedGroupInstance
  [t| (CureMiracle_Sapphire, CureMagical_Sapphire, CureFelice, CureMofurun_Sapphire) |]
  groupName_MahoGirls
  variation_Sapphire

transformedGroupInstance
  [t| (CureMiracle_Topaz, CureMagical_Topaz, CureFelice, CureMofurun_Topaz) |]
  groupName_MahoGirls
  variation_Topaz

transformedGroupInstance
  [t| (CureMiracle_OverTheRainbow, CureMagical_OverTheRainbow, CureFelice_OverTheRainbow) |]
  groupName_MahoGirls
  variation_OverTheRainbow

-- TODO: Add purification instance after watching the movie again
transformedGroupInstance
  [t| (CureMiracle_Heartful, CureMagical_Heartful, CureFelice_Heartful, CureMofurun_Heartful) |]
  groupName_MahoGirls
  variation_Heartful

transformationInstance
  [t| (Mirai, Liko) |]
  [t| (Mofurun LinkleStoneDia) |]
  [t| (CureMiracle, CureMagical) |]
  [| (CureMiracle, CureMagical) |]
  transformationSpeech_Miracle_Magical

transformationInstance
  [t| (Mirai, Liko) |]
  [t| (Mofurun LinkleStoneRuby) |]
  [t| (CureMiracle_Ruby, CureMagical_Ruby) |]
  [| (CureMiracle_Ruby, CureMagical_Ruby) |]
  transformationSpeech_Miracle_Magical_Ruby

transformationInstance
  [t| (Mirai, Liko) |]
  [t| (Mofurun LinkleStoneSapphire) |]
  [t| (CureMiracle_Sapphire, CureMagical_Sapphire) |]
  [| (CureMiracle_Sapphire, CureMagical_Sapphire) |]
  transformationSpeech_Miracle_Magical_Sapphire

transformationInstance
  [t| (Mirai, Liko) |]
  [t| (Mofurun LinkleStoneTopaz) |]
  [t| (CureMiracle_Topaz, CureMagical_Topaz) |]
  [| (CureMiracle_Topaz, CureMagical_Topaz) |]
  transformationSpeech_Miracle_Magical_Topaz

transformationInstance
  [t| Kotoha |]
  [t| (LinkleSmarthon LinkleStoneEmerald) |]
  [t| CureFelice |]
  [| CureFelice |]
  transformationSpeech_Felice

transformationInstance
  [t| (Mirai, Liko, Kotoha) |]
  [t| (Mofurun LinkleStoneDia, LinkleSmarthon LinkleStoneEmerald) |]
  [t| (CureMiracle, CureMagical, CureFelice) |]
  [| (CureMiracle, CureMagical, CureFelice) |]
  transformationSpeech_MahoGirls

transformationInstance
  [t| (Mirai, Liko, Kotoha) |]
  [t| (Mofurun LinkleStoneRuby, LinkleSmarthon LinkleStoneEmerald) |]
  [t| (CureMiracle_Ruby, CureMagical_Ruby, CureFelice) |]
  [| (CureMiracle_Ruby, CureMagical_Ruby, CureFelice) |]
  transformationSpeech_MahoGirls_Ruby

transformationInstance
  [t| (Mirai, Liko, Kotoha) |]
  [t| (Mofurun LinkleStoneSapphire, LinkleSmarthon LinkleStoneEmerald) |]
  [t| (CureMiracle_Sapphire, CureMagical_Sapphire, CureFelice) |]
  [| (CureMiracle_Sapphire, CureMagical_Sapphire, CureFelice) |]
  transformationSpeech_MahoGirls_Sapphire

transformationInstance
  [t| (Mirai, Liko, Kotoha) |]
  [t| (Mofurun LinkleStoneTopaz, LinkleSmarthon LinkleStoneEmerald) |]
  [t| (CureMiracle_Topaz, CureMagical_Topaz, CureFelice) |]
  [| (CureMiracle_Topaz, CureMagical_Topaz, CureFelice) |]
  transformationSpeech_MahoGirls_Topaz


transformationInstance
  [t| (CureMiracle, CureMagical, CureFelice) |]
  [t| (Mofurun LinkleStoneAlexandrite, LinkleSmarthon LinkleStoneAlexandrite) |]
  [t| (CureMiracle_OverTheRainbow, CureMagical_OverTheRainbow, CureFelice_OverTheRainbow) |]
  [| (CureMiracle_OverTheRainbow, CureMagical_OverTheRainbow, CureFelice_OverTheRainbow) |]
  transformationSpeech_MahoGirls_OverTheRainbow

transformationInstance
  [t| (CureMiracle_Ruby, CureMagical_Ruby, CureFelice) |]
  [t| (Mofurun LinkleStoneAlexandrite, LinkleSmarthon LinkleStoneAlexandrite) |]
  [t| (CureMiracle_OverTheRainbow, CureMagical_OverTheRainbow, CureFelice_OverTheRainbow) |]
  [| (CureMiracle_OverTheRainbow, CureMagical_OverTheRainbow, CureFelice_OverTheRainbow) |]
  transformationSpeech_MahoGirls_OverTheRainbow

transformationInstance
  [t| (CureMiracle_Sapphire, CureMagical_Sapphire, CureFelice) |]
  [t| (Mofurun LinkleStoneAlexandrite, LinkleSmarthon LinkleStoneAlexandrite) |]
  [t| (CureMiracle_OverTheRainbow, CureMagical_OverTheRainbow, CureFelice_OverTheRainbow) |]
  [| (CureMiracle_OverTheRainbow, CureMagical_OverTheRainbow, CureFelice_OverTheRainbow) |]
  transformationSpeech_MahoGirls_OverTheRainbow

transformationInstance
  [t| (CureMiracle_Topaz, CureMagical_Topaz, CureFelice) |]
  [t| (Mofurun LinkleStoneAlexandrite, LinkleSmarthon LinkleStoneAlexandrite) |]
  [t| (CureMiracle_OverTheRainbow, CureMagical_OverTheRainbow, CureFelice_OverTheRainbow) |]
  [| (CureMiracle_OverTheRainbow, CureMagical_OverTheRainbow, CureFelice_OverTheRainbow) |]
  transformationSpeech_MahoGirls_OverTheRainbow

transformationInstance
  [t| Mofurun LinkleStoneOfHope |]
  [t| MiracleMofurunLight |]
  [t| CureMofurun |]
  [| CureMofurun |]
  transformationSpeech_Mofurun


purificationInstance
  [t| (CureMiracle, CureMagical) |]
  [t| (Mofurun LinkleStoneDia, LinkleStick LinkleStoneDia) |]
  purificationSpeech_Miracle_Magical

purificationInstance
  [t| (CureMiracle_Ruby, CureMagical_Ruby) |]
  [t| (Mofurun LinkleStoneRuby, LinkleStick LinkleStoneRuby) |]
  purificationSpeech_Miracle_Magical_Ruby

purificationInstance
  [t| (CureMiracle_Sapphire, CureMagical_Sapphire) |]
  [t| (Mofurun LinkleStoneSapphire, LinkleStick LinkleStoneSapphire) |]
  purificationSpeech_Miracle_Magical_Sapphire

purificationInstance
  [t| (CureMiracle_Topaz, CureMagical_Topaz) |]
  [t| (Mofurun LinkleStoneTopaz, LinkleStick LinkleStoneTopaz) |]
  purificationSpeech_Miracle_Magical_Topaz

purificationInstance
  [t| CureFelice |]
  [t| FlowerEchoWand LinkleStoneEmerald |]
  purificationSpeech_Felice

purificationInstance
  [t| (CureMiracle_OverTheRainbow, CureMagical_OverTheRainbow, CureFelice_OverTheRainbow) |]
  [t| (RainbowCarriage LinkleStoneAlexandrite (Mofurun LinkleStoneAlexandrite), PreciousBrace) |]
  purificationSpeech_MahoGirls_extreme_rainbow
