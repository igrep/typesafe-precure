{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Textbook.Movie.Types where


import           ACME.PreCure.Textbook.Movie.Words
import           ACME.PreCure.Types.TH


data Ayumi = Ayumi deriving (Eq, Show)

girlInstance [t| Ayumi |] girlName_Ayumi

data CureEcho = CureEcho deriving (Eq, Show)

data FeelingToBePreCure = FeelingToBePreCure deriving (Eq, Show)

transformedInstanceDefault [t| CureEcho |] cureName_Echo introducesHerselfAs_Echo
transformationInstance
  [t| Ayumi |]
  [t| FeelingToBePreCure |]
  [t| CureEcho |]
  [| CureEcho |]
  transformationSpeech_Echo

nonItemPurificationInstance [t| CureEcho |] purificationSpeech_Echo
