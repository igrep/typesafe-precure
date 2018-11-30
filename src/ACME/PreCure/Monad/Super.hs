{-# LANGUAGE DataKinds #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE TypeInType #-}
{-# LANGUAGE TypeOperators #-}


module ACME.PreCure.Monad.Super
  ( PreCureM
  , EpisodeConfig(lineIntervalMicroSec)
  , defaultEpisodeConfig
  , enter
  , (>>)
  , (>>=)
  , ifThenElse
  , module Prelude
  ) where


import qualified Control.Arrow as Arrow
import qualified Control.Concurrent as Concurrent
import           Control.Monad.Indexed.State
import           Control.Monad.Indexed
import           Control.Monad.Trans.Writer.Lazy
import qualified Data.DList as DList
import           Data.Extensible
import           Data.Foldable (for_)
import           Data.Monoid ((<>))
import qualified System.IO as IO

import           ACME.PreCure.Types
import           ACME.PreCure.Monad.Super.Types

import           Prelude hiding ((>>), (>>=))


newtype PreCureM i j a =
  PreCureM
  { runPreCureM
      :: IxStateT (Writer (DList.DList String)) i j a
  } deriving (IxFunctor, IxPointed, IxApplicative, IxMonad)


enter
  :: IsTransformedOrNot g
  => g -> PreCureM (StatusTable xs) (StatusTable (AsGirl g >: IsTransformed g ': xs)) ()
enter = undefined


transform
  :: (Transformation g i , Associate g (HasTransformed 'False) xs , TransformGirl g xs)
  => g -> i -> PreCureM (StatusTable xs) (StatusTable (ToTransformed g xs)) ()
transform g i = do
  speak $ transformationSpeech g i
  ireturn $ transformedStyle g i


purify
  :: (Purification p i, Associate (AsGirl p) (HasTransformed 'True) xs)
  => p -> i -> PreCureM (StatusTable xs) (StatusTable xs) ()
purify p =
  speak . purificationSpeech p


purifyWithoutItem
  :: (NonItemPurification p, Associate (AsGirl p) (HasTransformed 'True) xs)
  => p -> PreCureM (StatusTable xs) (StatusTable xs) ()
purifyWithoutItem =
  speak . nonItemPurificationSpeech


-- TODO: Refactor: split out common functions
newtype EpisodeConfig = EpisodeConfig { lineIntervalMicroSec :: Int }

defaultEpisodeConfig :: EpisodeConfig
defaultEpisodeConfig = EpisodeConfig $ 1 * 1000 * 1000


speak :: [String] -> PreCureM i i ()
speak = PreCureM . tell . DList.fromList


say :: String -> PreCureM i i ()
say = PreCureM . tell . DList.singleton


composeEpisode :: PreCureM i j a -> [String]
composeEpisode =
  snd . runPreCureMonad


runPreCureMonad :: PreCureM i j a -> (a, [String])
runPreCureMonad =
  Arrow.second DList.toList . runPreCureM


printEpisode :: PreCureM i j a -> IO ()
printEpisode =
  printEpisodeWith defaultEpisodeConfig


hPrintEpisode :: IO.Handle -> PreCureM i j a -> IO ()
hPrintEpisode =
  flip hPrintEpisodeWith defaultEpisodeConfig


printEpisodeWith :: EpisodeConfig -> PreCureM i j a -> IO ()
printEpisodeWith =
  hPrintEpisodeWith IO.stdout


hPrintEpisodeWith :: IO.Handle -> EpisodeConfig -> PreCureM i j a -> IO ()
hPrintEpisodeWith h cfg a = do
  let interval = lineIntervalMicroSec cfg
  for_ (composeEpisode a) $ \s -> do
    IO.hPutStrLn h s
    IO.hFlush h
    Concurrent.threadDelay interval


{-# INLINE (>>=) #-}
(>>=) :: IxMonad m => m i j a -> (a -> m j k b) -> m i k b
(>>=) = (>>>=)


{-# INLINE (>>) #-}
(>>) :: IxMonad m => m i j a -> m j k b -> m i k b
(>>) a b = a >>= const b


{-# INLINE ifThenElse #-}
ifThenElse :: Bool -> a -> a -> a
ifThenElse b t f = if b then t else f
