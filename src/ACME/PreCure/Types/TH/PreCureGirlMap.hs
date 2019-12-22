{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module ACME.PreCure.Types.TH.PreCureGirlMap
  ( PreCureGirlMap
  , empty
  , put
  , get
  ) where


import qualified Data.Map.Strict     as M
import           Data.Monoid         (Monoid)
import           Data.Semigroup      (Semigroup)
import           Language.Haskell.TH (Type)


-- | Lookup-table to register which girl transforms into the PreCure,
--   or the special form (or style, as which I call in this repository?)
--   of the PreCure.
--
--   * Key: A PreCure or a special form of the PreCure.
--   * Value: The girl who transforms into the PreCure.
--
newtype PreCureGirlMap =
  PreCureGirlMap (M.Map Type Type)
  deriving (Show, Semigroup, Monoid)


empty :: PreCureGirlMap
empty = PreCureGirlMap M.empty


put :: Type -> Type -> PreCureGirlMap -> PreCureGirlMap
put afterT beforeT ttbl@(PreCureGirlMap tbl) =
  let girlT = get beforeT ttbl
   in PreCureGirlMap $ M.insert afterT girlT tbl


get :: Type -> PreCureGirlMap -> Type
get beforeOrAfter ttbl@(PreCureGirlMap tbl) =
  case M.lookup beforeOrAfter tbl of
      Nothing            -> beforeOrAfter
      Just anotherBefore -> get anotherBefore ttbl
