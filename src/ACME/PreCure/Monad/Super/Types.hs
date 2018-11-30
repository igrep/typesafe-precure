{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeInType #-}
{-# LANGUAGE TypeOperators #-}

module ACME.PreCure.Monad.Super.Types where

import           Data.Extensible
import           Data.Extensible.HList
import           Data.Functor.Identity (Identity(Identity))
import           Data.Kind (Type)
import           Data.Proxy (Proxy(Proxy))
import           Data.Type.Equality (type (==))


type GirlS = Type

type GirlOrPreCureS = Type

type IsTransformedS = Type

-- | key: Girl (before transformed), value: (before / after transformed)
type StatusTable xs = Record (xs :: [Assoc GirlS IsTransformedS])

data HasTransformed :: Bool -> Type where
  HasTransformed    :: HasTransformed 'True
  HasNotTransformed :: HasTransformed 'False

-- | Returns a (not-yet transformed) girl given a transformed PreCure.
--   If a (not-yet transformed) girl is given, returns herself.
type family AsGirl (p :: GirlOrPreCureS) :: GirlS

class IsTransformedOrNot g where
  type IsTransformed (g :: GirlS) :: IsTransformedS
  isTransformed :: g -> HasTransformed b


{-
class HEq (x :: k) (y :: k) (b :: Bool) | x y -> b
instance ((Proxy x == Proxy y) ~ b) => HEq x y b
-}

class HSetIf (b :: Bool) (val :: Type) (kvs :: [Assoc k Type]) where
  type HSetIfResult b val kvs :: [Assoc k Type]
  hSetIf :: Proxy b -> val -> HList (Field Identity) kvs -> HList (Field Identity) (HSetIfResult b val kvs)

instance HSetIf b val '[] where
  type HSetIfResult b val '[] = '[]
  hSetIf _ _ _ = HNil

instance HSetIf 'True  val kvs => HSetIf 'True  val ((k :> x) ': kvs) where
  type HSetIfResult 'True val ((k :> x) ': kvs) = (k :> val) ': HSetIfResult 'True val kvs
  hSetIf b val (HCons x kvs) = (itemAssoc (Proxy :: Proxy k) @= val) `HCons` hSetIf b val kvs

instance HSetIf 'False val kvs => HSetIf 'False val ((k :> x) ': kvs) where
  type HSetIfResult 'False val ((k :> x) ': kvs) = (k :> x) ': HSetIfResult 'False val kvs
  hSetIf b val (HCons x kvs) = x `HCons` hSetIf b val kvs


{-
class HSet (x :: Type) (y :: Type) (xs :: [Assoc Type Type]) (rs :: [Assoc Type Type])
  | x y xs -> rs, x y rs -> xs
 where
  hSet :: x -> y -> HList h xs -> HList h rs

instance HSet x y '[] '[] where
  hSet _x _y _nil = HNil

instance ((x == y) ~ 'True,  HSet x y xs rs) => HSet x y ((x' :> y') ': xs) rs where
  hSet x y (HCons _ tl) = undefined

instance ((x == y) ~ 'False, HSet x y xs rs) => HSet x y ((x' :> y') ': xs) rs where
  hSet x y (HCons hd tl) = hd `HCons` hSet x y tl
-}


{-
class TransformGirl
  (g :: GirlS)
  (xs :: [Assoc GirlS IsTransformedS])
  (ys :: [Assoc GirlS IsTransformedS])
  | g xs -> ys
 where
  transformGirl :: g -> Record xs -> Record ys

instance TransformGirl g '[] where
  type ToTransformed g xs = '[]
  transformGirl _girl _xs = nil

instance
  (EqTy g1 g2 b, TransformGirl g1 xs ys)
  => TransformGirl
    g1
    (g2 :> t ': xs)
    (g >: HasNotTransformed 'True ': TransformGirl g xs)
 where
  transformGirl girl xs =
    itemAssoc (Proxy :: Proxy g) @= HasTransformed <: transformGirl girl left

instance TransformGirl g (g' >: t ': xs) where
  type ToTransformed g xs = g' >: t ': TransformGirl g left
  transformGirl girl xs = x <: transformGirl girl left
-}
