{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE TypeOperators         #-}

module ACME.PreCure.Types where


-- g': A girl or a group of girls
-- i: A special item or a group of special items
class Transformation g' i' where
  type Style g' i'
  transformedStyle :: g' -> i' -> Style g' i'
  transformationSpeech :: g' -> i' -> [String]


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
  purificationSpeech :: p' -> i' -> [String]


class NonItemPurification p' where
  nonItemPurificationSpeech :: p' -> [String]


-- g: A girl
class Girl g where
  humanName :: g -> String

-- | Represents a 'SpecialItem' @b@ is attached to the 'SpecialItem' @a@.
data a :+: b = a :+: b deriving (Eq, Show)

infixr 1 :+:

-- | Used to define an instance of 'Transformation' or 'Purification' whose
--   speech varies between episodes.
data VaryingBetweenEpisodes ps = ps :< String deriving (Eq, Show)

infixr 1 :<
