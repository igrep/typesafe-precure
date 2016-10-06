{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Types where
  {-( Cure(..)-}
  {-, PreCure-}
  {-) where-}


import qualified ACME.PreCure.Types.Transformed as T


-- g': A girl or a group of girls
-- i: A special item or a group of special items
class Transformation g' i' where
  type Style g' i'
  transform :: g' -> i' -> Style g' i'


-- g: A girl
class Girl g where
  humanName :: g -> String


data Cure =
  forall p. (T.Transformed p) => Cure p


instance Show Cure where
  show (Cure p) =
    (T.cureName p) ++ " (" ++ (T.variation p) ++ ")"


instance Eq Cure where
  (Cure p) == (Cure q) =
    (T.cureName p) == (T.cureName q) && (T.variation p) == (T.variation q)


{-
data TransformationStyle =
  forall g' i'. (Transformation g' i') => TransformationStyle g' i'
-}

cureName :: Cure -> String
cureName (Cure p) = T.cureName p


transformtionSpeech :: Cure -> String
transformtionSpeech (Cure p) = T.transformtionSpeech p


{-attackSpeech :: Cure -> String-}
{-attackSpeech (Cure p) = T.attackSpeech p-}


{-
with :: (Transformation g' i') => g' -> i' -> TransformationStyle
with =
  TransformationStyle
-}

{-
transformtionSpeech $ (Mirai, Riko) `with` (Mofurun, LinkleStoneDia))
-}
