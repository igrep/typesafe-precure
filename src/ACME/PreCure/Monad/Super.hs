{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE RebindableSyntax           #-}
{-# LANGUAGE ScopedTypeVariables        #-}
{-# LANGUAGE TypeInType                 #-}
{-# LANGUAGE TypeOperators              #-}
{-# OPTIONS_GHC -fno-warn-simplifiable-class-constraints #-}


module ACME.PreCure.Monad.Super
  ( PreCureM
  , EpisodeConfig(lineIntervalMicroSec)
  , defaultEpisodeConfig
  , enter
  , (Core.>>)
  , (Core.>>=)
  , ifThenElse
  , module Prelude

  , say
  , speak
  , transform
  , purify
  , purifyWithoutItem

  , runPreCureMonad
  , composeEpisode
  , printEpisodeWith
  , printEpisode
  , hPrintEpisodeWith
  , hPrintEpisode

  , GirlS
  , GirlOrPreCureS
  , IsTransformedS
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
import           Data.Monoid                     ((<>))
import           Data.Proxy                      (Proxy (Proxy))
import qualified System.IO                       as IO

import           ACME.PreCure.Monad.Super.Core   hiding ((>>), (>>=))
import qualified ACME.PreCure.Monad.Super.Core   as Core
import           ACME.PreCure.Monad.Config
import           ACME.PreCure.Types

import           Prelude                         hiding ((>>), (>>=))
import qualified Prelude


newtype PreCureM i j a =
  PreCureM
  { runPreCureM
      :: IxStateT (Writer (DList.DList String)) i j a
  } deriving (IxFunctor, IxPointed, IxApplicative, IxMonad)


-- TODO: Support girls in tuple
enter
  :: forall girlOrPreCure xs
   . IsTransformedOrNot girlOrPreCure
  => girlOrPreCure -> PreCureM (StatusTable xs) (StatusTable (AsGirl girlOrPreCure >: HasTransformed (IsTransformed girlOrPreCure) ': xs)) ()
enter girlOrPreCure = PreCureM $ imodify (itemAssoc (Proxy :: Proxy (AsGirl girlOrPreCure)) @= isTransformed girlOrPreCure <:)


-- TODO: Support precures in tuple
transform
  :: forall girlOrPreCure item xs.
    ( Transformation girlOrPreCure item
    , Associate girlOrPreCure (HasTransformed 'False) xs
    , PSet girlOrPreCure (HasTransformed 'True) xs
    )
  => girlOrPreCure -> item -> PreCureM (StatusTable xs) (StatusTable (PSetResult girlOrPreCure (HasTransformed 'True) xs)) ()
transform girlOrPreCure item = do
  speak $ transformationSpeech girlOrPreCure item
  PreCureM $ imodify $ pSet (Proxy :: Proxy girlOrPreCure) HasTransformed
 where
  {-# INLINE (>>) #-}
  (>>) :: forall m i j k a b. IxMonad m => m i j a -> m j k b -> m i k b
  (>>) = (Core.>>)


-- TODO: Support precures in tuple
purify
  :: (Purification preCure item, Associate (AsGirl preCure) (HasTransformed 'True) xs)
  => preCure -> item -> PreCureM (StatusTable xs) (StatusTable xs) ()
purify preCure =
  speak . purificationSpeech preCure


purifyWithoutItem
  :: (NonItemPurification preCure, Associate (AsGirl preCure) (HasTransformed 'True) xs)
  => preCure -> PreCureM (StatusTable xs) (StatusTable xs) ()
purifyWithoutItem =
  speak . nonItemPurificationSpeech


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
