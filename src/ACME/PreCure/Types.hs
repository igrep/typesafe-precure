{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Types where


-- g': A girl or a group of girls
-- i: A special item or a group of special items
class Transformation g' i' where
  type Style g' i'
  transform :: g' -> i' -> Style g' i'
  transformationSpeech :: g' -> i' -> String


class Transformed t where
  cureName :: t -> String
  introducesHerselfAs :: t -> String
  variation :: t -> String
  variation _ = ""


class TransformedGroup ts where
  groupName :: ts -> String
  groupVariation :: ts -> String
  groupVariation _ = ""


-- p': A (transformed) precure or a group of precures
class Purification p' i' where
  purificationSpeech :: p' -> i' -> String


-- g: A girl
class Girl g where
  humanName :: g -> String
