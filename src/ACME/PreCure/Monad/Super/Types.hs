{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE PolyKinds #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeInType #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE UndecidableInstances #-}

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

class HSwapValIf (b :: Bool) (val1 :: Type) (kv :: Assoc k Type) where
  type HSwapValIfResult b val1 kv :: Assoc k Type
  hSwapValIf :: Proxy b -> val1 -> Field Identity kv -> Field Identity (HSwapValIfResult b val1 kv)

instance HSwapValIf 'True  val1 (k ':> val2) where
  type HSwapValIfResult 'True val1 (k ':> val2) = (k ':> val1)
  hSwapValIf _b val1 _kv = Field (Identity val1)

instance HSwapValIf 'False val1 (k ':> val2) where
  type HSwapValIfResult 'False val1 (k ':> val2) = (k ':> val2)
  hSwapValIf _b _val1 kv = kv


class HSet (key :: k) (val :: Type) (kvs :: [Assoc k Type]) where
  type HSetResult key val kvs :: [Assoc k Type]
  hSet :: Proxy key -> val -> HList (Field Identity) kvs -> HList (Field Identity) (HSetResult key val kvs)

instance HSet key val '[] where
  type HSetResult key val '[] = '[]
  hSet _key _val HNil = HNil

instance
  (HSwapValIf (key1 == key2) val (key2 ':> oldVal), HSet key1 val kvs)
  => HSet key1 val ((key2 ':> oldVal) ': kvs)
 where
  type HSetResult key1 val ((key2 ':> oldVal) ': kvs) =
    HSwapValIfResult (key1 == key2) val (key2 ':> oldVal) ': HSetResult key1 val kvs
  hSet key1 val (HCons kv kvs) = hSwapValIf (Proxy :: Proxy (key1 == key2)) val kv `HCons` hSet key1 val kvs


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
