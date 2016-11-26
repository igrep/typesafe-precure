{-# OPTIONS_GHC -fno-warn-orphans #-}

{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Textbook.Yes5GoGo.Types where


import           ACME.PreCure.Textbook.Yes5GoGo.Words
import           ACME.PreCure.Textbook.Yes5
import           ACME.PreCure.Types.TH

data Kurumi = Kurumi deriving (Eq, Show)

girlInstance [t| Kurumi |] girlName_Kurumi

data MilkyRose = MilkyRose deriving (Eq, Show)

data CureMo = CureMo deriving (Eq, Show)
data MilkyPalette = MilkyPalette deriving (Eq, Show)

data CrystalFlourez = CrystalFlourez deriving (Eq, Show)
data FireFlourez    = FireFlourez deriving (Eq, Show)
data ShiningFlourez = ShiningFlourez deriving (Eq, Show)
data ProtectFlourez = ProtectFlourez deriving (Eq, Show)
data TornadoFlourez = TornadoFlourez deriving (Eq, Show)
data MilkyMirror    = MilkyMirror deriving (Eq, Show)

transformedGroupInstanceDefault
  [t| (CureDream, CureRouge, CureLemonade, CureMint, CureAqua, MilkyRose) |]
  groupName_Yes5GoGo

transformationInstance [t| Nozomi |] [t| CureMo |] [t| CureDream |] [| CureDream |] transformationSpeech_Dream
transformationInstance [t| Rin |] [t| CureMo |] [t| CureRouge |] [| CureRouge |] transformationSpeech_Rouge
transformationInstance [t| Urara |] [t| CureMo |] [t| CureLemonade |] [| CureLemonade |] transformationSpeech_Lemonade
transformationInstance [t| Komachi |] [t| CureMo |] [t| CureMint |] [| CureMint |] transformationSpeech_Mint
transformationInstance [t| Karen |] [t| CureMo |] [t| CureAqua |] [| CureAqua |] transformationSpeech_Aqua
transformationInstance [t| Kurumi |] [t| MilkyPalette |] [t| MilkyRose |] [| MilkyRose |] transformationSpeech_MilkyRose

transformationInstance
  [t| (Nozomi, Rin, Urara, Komachi, Karen) |]
  [t| CureMo |]
  [t| (CureDream, CureRouge, CureLemonade, CureMint, CureAqua) |]
  [| (CureDream, CureRouge, CureLemonade, CureMint, CureAqua) |]
  transformationSpeech_Yes5

transformationInstance
  [t| (Nozomi, Rin, Urara, Komachi, Karen, Kurumi) |]
  [t| (CureMo, MilkyPalette) |]
  [t| (CureDream, CureRouge, CureLemonade, CureMint, CureAqua, MilkyRose) |]
  [| (CureDream, CureRouge, CureLemonade, CureMint, CureAqua, MilkyRose) |]
  transformationSpeech_Yes5GoGo

-- https://www.youtube.com/watch?v=bypPLRhJQCk
nonItemPurificationInstance [t| CureDream |] purificationSpeech_Dream_GoGo
nonItemPurificationInstance [t| CureRouge |] purificationSpeech_Rouge_GoGo
nonItemPurificationInstance [t| CureLemonade |] purificationSpeech_Lemonade_GoGo
nonItemPurificationInstance [t| CureMint |] purificationSpeech_Mint_GoGo
nonItemPurificationInstance [t| CureAqua |] purificationSpeech_Aqua_GoGo

purificationInstance [t| MilkyRose |] [t| MilkyPalette |] purificationSpeech_MilkyRose
purificationInstance [t| MilkyRose |] [t| MilkyMirror |] purificationSpeech_MilkyRose_Metal

purificationInstance
  [t| (CureDream, CureRouge, CureLemonade, CureMint, CureAqua) |]
  [t| (CrystalFlourez, FireFlourez, ShiningFlourez, ProtectFlourez, TornadoFlourez) |]
  purificationSpeech_Yes5GoGo
