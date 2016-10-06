module ACME.PreCure.Types.Transformed
  ( Transformed(..)
  ) where


class Transformed t where
  cureName :: t -> String
  transformtionSpeech :: t -> String
  -- attackSpeech :: t -> String
  variation :: t -> String
  variation _ = ""
