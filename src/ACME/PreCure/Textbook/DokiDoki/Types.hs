{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Textbook.DokiDoki.Types where


import           ACME.PreCure.Textbook.DokiDoki.Words
import           ACME.PreCure.Types.TH


data Mana   = Mana deriving (Eq, Show)
data Rikka  = Rikka deriving (Eq, Show)
data Alice  = Alice deriving (Eq, Show)
data Makoto = Makoto deriving (Eq, Show)
data Aguri  = Aguri deriving (Eq, Show)

girlInstance [t| Mana |] girlName_Mana
girlInstance [t| Rikka |] girlName_Rikka
girlInstance [t| Alice |] girlName_Alice
girlInstance [t| Makoto |] girlName_Makoto
girlInstance [t| Aguri |] girlName_Aguri

data CureHeart   = CureHeart deriving (Eq, Show)
data CureDiamond = CureDiamond deriving (Eq, Show)
data CureRosetta = CureRosetta deriving (Eq, Show)
data CureSword   = CureSword deriving (Eq, Show)
data CureAce     = CureAce deriving (Eq, Show)

data LovelyCommune_Sharuru cl = LovelyCommune_Sharuru cl deriving (Eq, Show)
data LovelyCommune_Raquel cl  = LovelyCommune_Raquel cl deriving (Eq, Show)
data LovelyCommune_Lance cl   = LovelyCommune_Lance cl deriving (Eq, Show)
data LovelyCommune_Davi cl    = LovelyCommune_Davi cl deriving (Eq, Show)
data LoveEyesPalette cl       = LoveEyesPalette cl deriving (Eq, Show)

-- TODO: Define each distinct cure loveads type?
data CureLoveads = CureLoveads deriving (Eq, Show)

data LoveKissRouge = LoveKissRouge deriving (Eq, Show)

data MagicalLovelyHarp cl = MagicalLovelyHarp cl deriving (Eq, Show)

transformedInstanceDefault [t| CureHeart |] cureName_Heart introducesHerselfAs_Heart
transformedInstanceDefault [t| CureDiamond |] cureName_Diamond introducesHerselfAs_Diamond
transformedInstanceDefault [t| CureRosetta |] cureName_Rosetta introducesHerselfAs_Rosetta
transformedInstanceDefault [t| CureSword |] cureName_Sword introducesHerselfAs_Sword
transformedInstanceDefault [t| CureAce |] cureName_Ace introducesHerselfAs_Ace

transformedGroupInstanceDefault
  [t| (CureHeart, CureDiamond, CureRosetta, CureSword, CureAce) |]
  groupName_Dokidoki

transformationInstance [t| Mana |] [t| LovelyCommune_Sharuru CureLoveads |] [t| CureHeart |] [| CureHeart |] transformationSpeech_Heart
transformationInstance [t| Rikka |] [t| LovelyCommune_Raquel CureLoveads |] [t| CureDiamond |] [| CureDiamond |] transformationSpeech_Diamond
transformationInstance [t| Alice |] [t| LovelyCommune_Lance CureLoveads |] [t| CureRosetta |] [| CureRosetta |] transformationSpeech_Rosetta
transformationInstance [t| Makoto |] [t| LovelyCommune_Davi CureLoveads |] [t| CureSword |] [| CureSword |] transformationSpeech_Sword
transformationInstance [t| Aguri |] [t| LoveEyesPalette CureLoveads |] [t| CureAce |] [| CureAce |] transformationSpeech_Ace

transformationInstance
  [t| (Mana, Rikka, Alice, Makoto) |]
  [t|
    ( LovelyCommune_Sharuru CureLoveads
    , LovelyCommune_Raquel CureLoveads
    , LovelyCommune_Lance CureLoveads
    , LovelyCommune_Davi CureLoveads
    )
  |]
  [t| (CureHeart, CureDiamond, CureRosetta, CureSword) |]
  [| (CureHeart, CureDiamond, CureRosetta, CureSword) |]
  transformationSpeech_Dokidoki_Heart_Diamond_Rosetta_Sword

transformationInstance
  [t| (Mana, Rikka, Alice, Makoto, Aguri) |]
  [t|
    ( LovelyCommune_Sharuru CureLoveads
    , LovelyCommune_Raquel CureLoveads
    , LovelyCommune_Lance CureLoveads
    , LovelyCommune_Davi CureLoveads
    , LoveEyesPalette CureLoveads
    )
  |]
  [t| (CureHeart, CureDiamond, CureRosetta, CureSword, CureAce) |]
  [| (CureHeart, CureDiamond, CureRosetta, CureSword, CureAce) |]
  transformationSpeech_Dokidoki

purificationInstance [t| CureHeart |] [t| LovelyCommune_Sharuru CureLoveads |] purificationSpeech_Heart
purificationInstance [t| CureDiamond |] [t| LovelyCommune_Raquel CureLoveads |] purificationSpeech_Diamond
purificationInstance [t| CureRosetta |] [t| LovelyCommune_Lance CureLoveads |] purificationSpeech_Rosetta
purificationInstance [t| CureSword |] [t| LovelyCommune_Davi CureLoveads |] purificationSpeech_Sword
purificationInstance [t| CureAce |] [t| LoveKissRouge |] purificationSpeech_Ace

purificationInstance
  [t| (CureHeart, CureDiamond, CureRosetta, CureSword, CureAce) |]
  [t| MagicalLovelyHarp CureLoveads |]
  purificationSpeech_Dokidoki
