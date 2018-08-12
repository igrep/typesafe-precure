{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.Yes5GoGo.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.Yes5.Words
import           ACME.PreCure.Textbook.Yes5GoGo.Words


girls :: [Girl]
girls =
  [ mkGirl ("Kurumi" ++ error "Need family name!") girlName_Kurumi
  ]


transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Milky Rose"
      ""
      cureName_MilkyRose
      ""
      introducesHerselfAs_MilkyRose

  ]


transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CureDream", "CureRouge", "CureLemonade", "CureMint", "CureAqua", "MilkyRose"] "Yes5 Go Go" "" groupName_Yes5GoGo ""
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "CureMo" (error "Specify specialItemNameJa") []
  , mkSpecialItem "MilkyPalette" (error "Specify specialItemNameJa") []
  , mkSpecialItem "CrystalFlourez" (error "Specify specialItemNameJa") []
  , mkSpecialItem "FireFlourez" (error "Specify specialItemNameJa") []
  , mkSpecialItem "ShiningFlourez" (error "Specify specialItemNameJa") []
  , mkSpecialItem "ProtectFlourez" (error "Specify specialItemNameJa") []
  , mkSpecialItem "TornadoFlourez" (error "Specify specialItemNameJa") []
  , mkSpecialItem "MilkyMirror" (error "Specify specialItemNameJa") []
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Nozomi"]
      ["CureMo"]
      ["CureDream"]
      transformationSpeech_Dream

  , mkTransformation
      ["Rin"]
      ["CureMo"]
      ["CureRouge"]
      transformationSpeech_Rouge

  , mkTransformation
      ["Urara"]
      ["CureMo"]
      ["CureLemonade"]
      transformationSpeech_Lemonade

  , mkTransformation
      ["Komachi"]
      ["CureMo"]
      ["CureMint"]
      transformationSpeech_Mint

  , mkTransformation
      ["Karen"]
      ["CureMo"]
      ["CureAqua"]
      transformationSpeech_Aqua

  , mkTransformation
      ["Kurumi"]
      ["MilkyPalette"]
      ["MilkyRose"]
      transformationSpeech_MilkyRose

  , mkTransformation
      ["Nozomi", "Rin", "Urara", "Komachi", "Karen"]
      ["CureMo"]
      ["CureDream","CureRouge","CureLemonade","CureMint","CureAqua"]
      transformationSpeech_Yes5

  , mkTransformation
      ["Nozomi", "Rin", "Urara", "Komachi", "Karen", "Kurumi"]
      ["CureMo", "MilkyPalette"]
      ["CureDream","CureRouge","CureLemonade","CureMint","CureAqua","MilkyRose"]
      transformationSpeech_Yes5GoGo

  ]


purifications :: [Purification]
purifications =
  [ mkPurification
      ["MilkyRose"]
      ["MilkyPalette"]
      purificationSpeech_MilkyRose

  , mkPurification
      ["MilkyRose"]
      ["MilkyMirror"]
      purificationSpeech_MilkyRose_Metal

  , mkPurification
      ["CureDream", "CureRouge", "CureLemonade", "CureMint", "CureAqua"]
      ["CrystalFlourez", "FireFlourez", "ShiningFlourez", "ProtectFlourez", "TornadoFlourez"]
      purificationSpeech_Yes5GoGo

  ]


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ mkNonItemPurification ["CureDream"] purificationSpeech_Dream_GoGo
  , mkNonItemPurification ["CureRouge"] purificationSpeech_Rouge_GoGo
  , mkNonItemPurification ["CureLemonade"] purificationSpeech_Lemonade_GoGo
  , mkNonItemPurification ["CureMint"] purificationSpeech_Mint_GoGo
  , mkNonItemPurification ["CureAqua"] purificationSpeech_Aqua_GoGo
  ]


