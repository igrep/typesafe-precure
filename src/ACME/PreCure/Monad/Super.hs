{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses      #-}
{-# LANGUAGE RebindableSyntax           #-}
{-# LANGUAGE ScopedTypeVariables        #-}
{-# LANGUAGE TypeFamilies               #-}
{-# LANGUAGE TypeInType                 #-}
{-# LANGUAGE TypeOperators              #-}
{-# OPTIONS_GHC -fno-warn-simplifiable-class-constraints #-}


module ACME.PreCure.Monad.Super
  ( PreCureM (PreCureM)
  , EpisodeConfig(lineIntervalMicroSec)
  , defaultEpisodeConfig

  , EnterAction
  , EnterActionResult
  , enter

  , TransformAction
  , TransformActionConstraint
  , TransformActionResult
  , transform

  , PurifyAction
  , PurifyActionConstraint
  , purify

  , PurifyWithoutItemAction
  , PurifyWithoutItemActionConstraint
  , purifyWithoutItem

  , (Core.>>)
  , (Core.>>=)
  , ifThenElse
  , module Prelude

  , say
  , speak

  , runPreCureMonad
  , composeEpisode
  , printEpisodeWith
  , printEpisode
  , hPrintEpisodeWith
  , hPrintEpisode

  , GirlKind
  , GirlOrPreCureKind
  , IsTransformedKind
  , StatusTable
  , HasTransformed (..)
  , AsGirl
  , IsTransformedOrNot (..)
  ) where


import qualified Control.Concurrent              as Concurrent
import           Control.Monad.Indexed
import           Control.Monad.Indexed.State
import           Control.Monad.Indexed.Trans
import           Control.Monad.Trans.Writer.Lazy
import qualified Data.DList                      as DList
import           Data.Extensible                 hiding (item)
import           Data.Foldable                   (for_)
import           Data.Kind                       (Constraint)
import           Data.Monoid                     ((<>))
import qualified System.IO                       as IO

import           ACME.PreCure.Monad.Config
import           ACME.PreCure.Monad.Super.Core   hiding ((>>), (>>=))
import qualified ACME.PreCure.Monad.Super.Core   as Core
import           ACME.PreCure.Types

import           Prelude                         hiding ((>>), (>>=))
import qualified Prelude


newtype PreCureM i j a =
  PreCureM
  { runPreCureM
      :: IxStateT (Writer (DList.DList String)) i j a
  } deriving (IxFunctor, IxPointed, IxApplicative, IxMonad)


class EnterAction girlOrPreCure where
  type EnterActionResult girlOrPreCure :: StatusTableKind
  enter :: girlOrPreCure -> PreCureM (StatusTable xs) (StatusTable (EnterActionResult girlOrPreCure ++ xs)) ()


class Transformation girlOrPreCure item => TransformAction girlOrPreCure item xs where
  type TransformActionConstraint girlOrPreCure xs :: Constraint
  type TransformActionResult girlOrPreCure xs :: StatusTableKind
  transform
    :: TransformActionConstraint girlOrPreCure xs
    => girlOrPreCure -> item -> PreCureM (StatusTable xs) (StatusTable (TransformActionResult girlOrPreCure xs)) ()


class Purification preCure item => PurifyAction preCure item xs where
  type PurifyActionConstraint preCure xs :: Constraint
  purify
    :: PurifyActionConstraint preCure xs
    => preCure -> item -> PreCureM (StatusTable xs) (StatusTable xs) ()


class NonItemPurification preCure => PurifyWithoutItemAction preCure xs where
  type PurifyWithoutItemActionConstraint preCure xs :: Constraint
  purifyWithoutItem
    :: PurifyWithoutItemActionConstraint preCure xs
    => preCure -> PreCureM (StatusTable xs) (StatusTable xs) ()


{-
purify
  :: (Purification preCure item, Lookup xs (AsGirl preCure) (HasTransformed 'True))
  => preCure -> item -> PreCureM (StatusTable xs) (StatusTable xs) ()
purify preCure =
  speak . purificationSpeech preCure


purifyWithoutItem
  :: (NonItemPurification preCure, Lookup xs (AsGirl preCure) (HasTransformed 'True))
  => preCure -> PreCureM (StatusTable xs) (StatusTable xs) ()
purifyWithoutItem =
  speak . nonItemPurificationSpeech
-}


speak :: [String] -> PreCureM i i ()
speak = PreCureM . ilift . tell . DList.fromList


say :: String -> PreCureM i i ()
say = PreCureM . ilift . tell . DList.singleton


composeEpisode :: PreCureM (StatusTable '[]) (StatusTable xs) a -> [String]
composeEpisode =
  snd . runPreCureMonad


runPreCureMonad :: PreCureM (StatusTable '[]) (StatusTable xs) a -> (a, [String])
runPreCureMonad act =
  let ((x, _), ss) = runWriter $ (`runIxStateT` nil) $ runPreCureM act
  in (x, DList.toList ss)


printEpisode :: PreCureM (StatusTable '[]) (StatusTable xs) a -> IO ()
printEpisode =
  printEpisodeWith defaultEpisodeConfig


hPrintEpisode :: IO.Handle -> PreCureM (StatusTable '[]) (StatusTable xs) a -> IO ()
hPrintEpisode =
  flip hPrintEpisodeWith defaultEpisodeConfig


printEpisodeWith :: EpisodeConfig -> PreCureM (StatusTable '[]) (StatusTable xs) a -> IO ()
printEpisodeWith =
  hPrintEpisodeWith IO.stdout


hPrintEpisodeWith :: IO.Handle -> EpisodeConfig -> PreCureM (StatusTable '[]) (StatusTable xs) a -> IO ()
hPrintEpisodeWith h cfg a = do
  let interval = lineIntervalMicroSec cfg
  for_ (composeEpisode a) $ \s -> do
    IO.hPutStrLn h s
    IO.hFlush h
    Concurrent.threadDelay interval
 where
  {-# INLINE (>>) #-}
  (>>) :: Monad m => m a -> m b -> m b
  (>>) = (Prelude.>>)
