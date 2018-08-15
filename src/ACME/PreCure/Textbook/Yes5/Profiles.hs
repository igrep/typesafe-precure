{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.Yes5.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.Yes5.Words


girls :: [Girl]
girls =
  [ mkGirl "Nozomi Yumehara" girlName_Nozomi
  , mkGirl "Rin Natsuki" girlName_Rin
  , mkGirl "Urara Kasugano" girlName_Urara
  , mkGirl "Komachi Akimoto" girlName_Komachi
  , mkGirl "Karen Minazuki" girlName_Karen
  ]


transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Dream"
      ""
      cureName_Dream
      ""
      introducesHerselfAs_Dream

  , mkTransformee
      "Cure Rouge"
      ""
      cureName_Rouge
      ""
      introducesHerselfAs_Rouge

  , mkTransformee
      "Cure Lemonade"
      ""
      cureName_Lemonade
      ""
      introducesHerselfAs_Lemonade

  , mkTransformee
      "Cure Mint"
      ""
      cureName_Mint
      ""
      introducesHerselfAs_Mint

  , mkTransformee
      "Cure Aqua"
      ""
      cureName_Aqua
      ""
      introducesHerselfAs_Aqua
  ]


transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CureDream", "CureRouge", "CureLemonade", "CureMint", "CureAqua"] "Yes5" "" groupName_Yes5 ""
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Pinky Catch" "ピンキーキャッチュ" []
  , mkSpecialItem "Dream Torch" "ドリーム・トーチ" []
  , mkSpecialItem "Rouge Tact" "ルージュ・タクト" []
  , mkSpecialItem "Lemonade Castanet" "レモネード・カスタネット" []
  , mkSpecialItem "Mint Leaf" "ミント・リーフ" []
  , mkSpecialItem "Aqua Ribbon" "アクア・リボン" []
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Nozomi"]
      ["PinkyCatch"]
      ["CureDream"]
      transformationSpeech_Dream

  , mkTransformation
      ["Rin"]
      ["PinkyCatch"]
      ["CureRouge"]
      transformationSpeech_Rouge

  , mkTransformation
      ["Urara"]
      ["PinkyCatch"]
      ["CureLemonade"]
      transformationSpeech_Lemonade

  , mkTransformation
      ["Komachi"]
      ["PinkyCatch"]
      ["CureMint"]
      transformationSpeech_Mint

  , mkTransformation
      ["Karen"]
      ["PinkyCatch"]
      ["CureAqua"]
      transformationSpeech_Aqua

  , mkTransformation
      ["Nozomi", "Rin", "Urara", "Komachi", "Karen"]
      ["PinkyCatch"]
      ["CureDream","CureRouge","CureLemonade","CureMint","CureAqua"]
      transformationSpeech_Yes5
  ]


purifications :: [Purification]
purifications =
  [ mkPurification
      ["CureDream"]
      ["PinkyCatch"]
      purificationSpeech_Dream

  , mkPurification
      ["CureRouge"]
      ["PinkyCatch"]
      purificationSpeech_Rouge

  , mkPurification
      ["CureLemonade"]
      ["PinkyCatch"]
      purificationSpeech_Lemonade

  , mkPurification
      ["CureMint"]
      ["PinkyCatch"]
      purificationSpeech_Mint

  , mkPurification
      ["CureAqua"]
      ["PinkyCatch"]
      purificationSpeech_Aqua

  , mkPurification
      ["CureDream"]
      ["DreamTorch"]
      purificationSpeech_Dream_Crystal_Shoot

  , mkPurification
      ["CureRouge"]
      ["RougeTact"]
      purificationSpeech_Rouge_Burning

  , mkPurification
      ["CureLemonade"]
      ["LemonadeCastanet"]
      purificationSpeech_Lemonade_Shining

  , mkPurification
      ["CureMint"]
      ["MintLeaf"]
      purificationSpeech_Mint_Shield

  , mkPurification
      ["CureAqua"]
      ["AquaRibbon"]
      purificationSpeech_Aqua_Tornado

  , mkPurification
      ["CureDream", "CureRouge", "CureLemonade", "CureMint", "CureAqua"]
      ["DreamTorch", "RougeTact", "LemonadeCastanet", "MintLeaf", "AquaRibbon"]
      purificationSpeech_Yes5
  ]
