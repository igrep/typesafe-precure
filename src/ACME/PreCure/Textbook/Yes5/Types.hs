{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Textbook.Yes5.Types where


import           ACME.PreCure.Textbook.Yes5.Words
import           ACME.PreCure.Types.TH


data Nozomi  = Nozomi deriving (Eq, Show)
data Rin     = Rin deriving (Eq, Show)
data Urara   = Urara deriving (Eq, Show)
data Komachi = Komachi deriving (Eq, Show)
data Karen   = Karen deriving (Eq, Show)

girlInstance [t| Nozomi |] girlName_Nozomi
girlInstance [t| Rin |] girlName_Rin
girlInstance [t| Urara |] girlName_Urara
girlInstance [t| Komachi |] girlName_Komachi
girlInstance [t| Karen |] girlName_Karen

data CureDream    = CureDream deriving (Eq, Show)
data CureRouge    = CureRouge deriving (Eq, Show)
data CureLemonade = CureLemonade deriving (Eq, Show)
data CureMint     = CureMint deriving (Eq, Show)
data CureAqua     = CureAqua deriving (Eq, Show)

data PinkyCatch = PinkyCatch deriving (Eq, Show)

data DreamTorch       = DreamTorch deriving (Eq, Show)
data RougeTact        = RougeTact deriving (Eq, Show)
data LemonadeCastanet = LemonadeCastanet deriving (Eq, Show)
data MintLeaf         = MintLeaf deriving (Eq, Show)
data AquaRibbon       = AquaRibbon deriving (Eq, Show)

transformedInstanceDefault [t| CureDream |] cureName_Dream introducesHerselfAs_Dream
transformedInstanceDefault [t| CureRouge |] cureName_Rouge introducesHerselfAs_Rouge
transformedInstanceDefault [t| CureLemonade |] cureName_Lemonade introducesHerselfAs_Lemonade
transformedInstanceDefault [t| CureMint |] cureName_Mint introducesHerselfAs_Mint
transformedInstanceDefault [t| CureAqua |] cureName_Aqua introducesHerselfAs_Aqua

transformedGroupInstanceDefault
  [t| (CureDream, CureRouge, CureLemonade, CureMint, CureAqua) |]
  groupName_Yes5

transformationInstance [t| Nozomi |] [t| PinkyCatch |] [t| CureDream |] [| CureDream |] transformationSpeech_Dream
transformationInstance [t| Rin |] [t| PinkyCatch |] [t| CureRouge |] [| CureRouge |] transformationSpeech_Rouge
transformationInstance [t| Urara |] [t| PinkyCatch |] [t| CureLemonade |] [| CureLemonade |] transformationSpeech_Lemonade
transformationInstance [t| Komachi |] [t| PinkyCatch |] [t| CureMint |] [| CureMint |] transformationSpeech_Mint
transformationInstance [t| Karen |] [t| PinkyCatch |] [t| CureAqua |] [| CureAqua |] transformationSpeech_Aqua

transformationInstance
  [t| (Nozomi, Rin, Urara, Komachi, Karen) |]
  [t| PinkyCatch |]
  [t| (CureDream, CureRouge, CureLemonade, CureMint, CureAqua) |]
  [| (CureDream, CureRouge, CureLemonade, CureMint, CureAqua) |]
  transformationSpeech_Yes5

purificationInstance [t| CureDream |] [t| PinkyCatch |] purificationSpeech_Dream
purificationInstance [t| CureRouge |] [t| PinkyCatch |] purificationSpeech_Rouge
purificationInstance [t| CureLemonade |] [t| PinkyCatch |] purificationSpeech_Lemonade
purificationInstance [t| CureMint |] [t| PinkyCatch |] purificationSpeech_Mint
purificationInstance [t| CureAqua |] [t| PinkyCatch |] purificationSpeech_Aqua

purificationInstance [t| CureDream |] [t| DreamTorch |] purificationSpeech_Dream_Crystal_Shoot
purificationInstance [t| CureRouge |] [t| RougeTact |] purificationSpeech_Rouge_Burning
purificationInstance [t| CureLemonade |] [t| LemonadeCastanet |] purificationSpeech_Lemonade_Shining
purificationInstance [t| CureMint |] [t| MintLeaf |] purificationSpeech_Mint_Shield
purificationInstance [t| CureAqua |] [t| AquaRibbon |] purificationSpeech_Aqua_Tornado

purificationInstance
  [t| (CureDream, CureRouge, CureLemonade, CureMint, CureAqua) |]
  [t| (DreamTorch, RougeTact, LemonadeCastanet, MintLeaf, AquaRibbon) |]
  purificationSpeech_Yes5
