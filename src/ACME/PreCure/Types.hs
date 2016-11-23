{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE FlexibleInstances #-}
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


data PreCure =
  forall p. (Transformed p) => Cure p


instance Show PreCure where
  show (Cure p) =
    let v =
          if null $ variation p
            then ""
            else " (" ++ variation p ++ ")"
    in
      (cureName p) ++ v


instance Eq PreCure where
  (Cure p) == (Cure q) =
    (cureName p) == (cureName q) && (variation p) == (variation q)


instance Transformed PreCure where
  cureName (Cure p) = cureName p
  introducesHerselfAs (Cure p) = introducesHerselfAs p
  variation (Cure p) = variation p


instance {-# OVERLAPPABLE #-} TransformedGroup (t1, t2) where
  groupName _ = "プリキュア"


instance {-# OVERLAPPABLE #-} TransformedGroup (t1, t2, t3) where
  groupName _ = "プリキュア"


instance {-# OVERLAPPABLE #-} TransformedGroup (PreCure, PreCure) where
  groupName (Cure p1, Cure p2) = groupName (p1, p2)


instance {-# OVERLAPPABLE #-} TransformedGroup (PreCure, PreCure, PreCure) where
  groupName (Cure p1, Cure p2, Cure p3) = groupName (p1, p2, p3)

-- TODO: Enumerate all stars. Use HList?
