{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE ExplicitNamespaces    #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE GADTs                 #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE PolyKinds             #-}
{-# LANGUAGE ScopedTypeVariables   #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE TypeInType            #-}
{-# LANGUAGE TypeOperators         #-}
{-# LANGUAGE UndecidableInstances  #-}

module ACME.PreCure.Monad.Super.Core
  ( GirlKind
  , GirlOrPreCureKind
  , IsTransformedKind
  , StatusTable
  , StatusTableKind
  , HasTransformed (..)
  , AsGirl
  , IsTransformedOrNot (..)
  , PSet (PSetResult)
  , pSet

  , ifThenElse
  , module Prelude
  , (>>=)
  , (>>)
  ) where

import           Control.Monad.Indexed
import           Data.Extensible
import           Data.Extensible.Product (fromHList, toHList)
import           Data.Functor.Identity   (Identity (Identity))
import           Data.Kind               (Type)
import           Data.Proxy              (Proxy (Proxy))
import           Data.Type.Bool          (type (||))
import           Data.Type.Equality      (type (==))
import           Prelude                 hiding ((>>), (>>=))
import           Type.Membership.HList   (HList (HCons, HNil))


type GirlKind = Type

type GirlOrPreCureKind = Type

type IsTransformedKind = Type

type StatusTableKind = [Assoc GirlKind IsTransformedKind]

-- | key: Girl (before transformed), value: (before / after transformed)
type StatusTable xs = Record (xs :: StatusTableKind)

data HasTransformed :: Bool -> Type where
  HasNotTransformed :: HasTransformed 'False
  HasTransformed    :: HasTransformed 'True

-- | Returns a (not-yet transformed) girl given a transformed PreCure.
--   If a (not-yet transformed) girl is given, returns herself.
-- TODO: Delete
type family AsGirl (p :: GirlOrPreCureKind) :: GirlKind

-- TODO: Delete
class IsTransformedOrNot g where
  type IsTransformed (g :: GirlKind) :: Bool
  isTransformed :: g -> HasTransformed (IsTransformed g)


-- | Type level elem function for tuples.
type family TElem (x :: Type) (xs :: Type) where
  TElem x (y1, y2)                 = x == y1 || x == y2
  TElem x (y1, y2, y3)             = x == y1 || x == y2 || x == y3
  TElem x (y1, y2, y3, y4)         = x == y1 || x == y2 || x == y3 || x == y4
  TElem x (y1, y2, y3, y4, y5)     = x == y1 || x == y2 || x == y3 || x == y4 || x == y5
  TElem x (y1, y2, y3, y4, y5, y6) = x == y1 || x == y2 || x == y3 || x == y4 || x == y5 || x == y6
  TElem x y                        = x == y


class HSwapValIf (b :: Bool) (val1 :: Type) (kv :: Assoc k Type) where
  type HSwapValIfResult b val1 kv :: Assoc k Type
  hSwapValIf :: Proxy b -> val1 -> Field Identity kv -> Field Identity (HSwapValIfResult b val1 kv)

instance HSwapValIf 'True  val1 (k ':> val2) where
  type HSwapValIfResult 'True val1 (k ':> val2) = (k ':> val1)
  hSwapValIf _b val1 _kv = Field (Identity val1)

instance HSwapValIf 'False val1 (k ':> val2) where
  type HSwapValIfResult 'False val1 (k ':> val2) = (k ':> val2)
  hSwapValIf _b _val1 kv = kv


-- | Polymorphic update for 'HList'
class PSet (keys :: k) (val :: Type) (kvs :: [Assoc k Type]) where
  type PSetResult keys val kvs :: [Assoc k Type]
  hPSet :: Proxy keys -> val -> HList (Field Identity) kvs -> HList (Field Identity) (PSetResult keys val kvs)

instance PSet keys val '[] where
  type PSetResult keys val '[] = '[]
  hPSet _keys _val HNil = HNil

instance
  (HSwapValIf (TElem key2 keys) val (key2 ':> oldVal), PSet keys val kvs)
  => PSet keys val ((key2 ':> oldVal) ': kvs)
 where
  type PSetResult keys val ((key2 ':> oldVal) ': kvs) =
    HSwapValIfResult (TElem key2 keys) val (key2 ':> oldVal) ': PSetResult keys val kvs
  hPSet keys val (HCons kv kvs) = hSwapValIf (Proxy :: Proxy (TElem key2 keys)) val kv `HCons` hPSet keys val kvs


-- | Polymorphic update for 'Record'
--   TODO: Type error when key doesn't exist in kvs
{-# INLINE pSet #-}
pSet :: forall key val kvs. PSet key val kvs => Proxy key -> val -> Record kvs -> Record (PSetResult key val kvs)
pSet _key val = fromHList . hPSet (Proxy :: Proxy key) val . toHList


{-# INLINE (>>=) #-}
(>>=) :: forall m i j k a b. IxMonad m => m i j a -> (a -> m j k b) -> m i k b
(>>=) = (>>>=)

{-# INLINE (>>) #-}
(>>) :: forall m i j k a b. IxMonad m => m i j a -> m j k b -> m i k b
(>>) a b = a >>= const b


{-# INLINE ifThenElse #-}
ifThenElse :: Bool -> a -> a -> a
ifThenElse b t f = if b then t else f
