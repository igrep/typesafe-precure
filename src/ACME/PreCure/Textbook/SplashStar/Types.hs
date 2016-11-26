{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Textbook.SplashStar.Types where


import           ACME.PreCure.Textbook.SplashStar.Words
import           ACME.PreCure.Types.TH

data Saki = Saki deriving (Eq, Show)
data Mai = Mai deriving (Eq, Show)

$(girlInstance [t| Saki |] girlName_Saki)
$(girlInstance [t| Mai |] girlName_Mai)

data CureBloom = CureBloom deriving (Eq, Show)
data CureEgret = CureEgret deriving (Eq, Show)

data MixCommune_Flappy = MixCommune_Flappy deriving (Eq, Show)
data MixCommune_Choppy = MixCommune_Choppy deriving (Eq, Show)

data CureBright = CureBright deriving (Eq, Show)
data CureWindy  = CureWindy deriving (Eq, Show)

data CrystalCommune_Flappy = CrystalCommune_Flappy deriving (Eq, Show)
data CrystalCommune_Choppy = CrystalCommune_Choppy deriving (Eq, Show)

transformedInstanceDefault [t| CureBloom |] cureName_Bloom introducesHerselfAs_Bloom
transformedInstanceDefault [t| CureEgret |] cureName_Egret introducesHerselfAs_Egret

transformedInstanceDefault [t| CureBright |] cureName_Bright introducesHerselfAs_Bright
transformedInstanceDefault [t| CureWindy  |] cureName_Windy  introducesHerselfAs_Windy

transformedGroupInstanceDefault
  [t| (CureBloom, CureEgret) |]
  groupName_SplashStar

transformedGroupInstance
  [t| (CureBright, CureWindy) |]
  groupName_SplashStar
  variation_Bright_Windy

transformationInstance
  [t| (Saki, Mai) |]
  [t| (MixCommune_Flappy, MixCommune_Choppy) |]
  [t| (CureBloom, CureEgret) |]
  [| (CureBloom, CureEgret) |]
  transformationSpeech_Bloom_Egret

transformationInstance
  [t| (Saki, Mai) |]
  [t| (CrystalCommune_Flappy, CrystalCommune_Choppy) |]
  [t| (CureBright, CureWindy) |]
  [| (CureBright, CureWindy) |]
  transformationSpeech_Bright_Windy

nonItemPurificationInstance
  [t| (CureBloom, CureEgret) |]
  purificationSpeech_Bloom_Egret

-- TODO: more purifications after confirming the phrases
