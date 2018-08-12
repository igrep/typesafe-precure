{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.Movie.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.Movie.Words


girls :: [Girl]
girls =
  [ mkGirl ("Ayumi" ++ error "Need family name!") girlName_Ayumi
  ]


transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Echo"
      ""
      cureName_Echo
      ""
      introducesHerselfAs_Echo

  ]


transformedGroups :: [TransformedGroup]
transformedGroups =
  [ 
  ]


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "FeelingToBePreCure" (error "Specify specialItemNameJa") []
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Ayumi"]
      ["FeelingToBePreCure"]
      ["CureEcho"]
      transformationSpeech_Echo

  ]


purifications :: [Purification]
purifications =
  [ 
  ]


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ mkNonItemPurification ["CureEcho"] purificationSpeech_Echo
  ]


