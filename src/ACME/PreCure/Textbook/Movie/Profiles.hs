{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.Movie.Profiles where

import           ACME.PreCure.Index.Types
import           ACME.PreCure.Textbook.Movie.Words


girls :: [Girl]
girls =
  [ mkGirl "Ayumi Sakagami" girlName_Ayumi
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


specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Feeling To Be PreCure" "プリキュアになりたいという気持ち" []
  ]


transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Ayumi"]
      ["FeelingToBePreCure"]
      ["CureEcho"]
      transformationSpeech_Echo
  ]


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ mkNonItemPurification ["CureEcho"] purificationSpeech_Echo
  ]
