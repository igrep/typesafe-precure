{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module ACME.PreCure.Monad
  ( PreCureMonad
  , EpisodeConfig(lineIntervalMicroSec)
  , defaultEpisodeConfig
  , speak
  , say
  , runPreCureMonad
  , execPreCureMonad
  , composeEpisode
  , printEpisode
  , printEpisodeWith
  , hPrintEpisode
  , hPrintEpisodeWith
  , transform
  , purify
  , purifyWithoutItem
  ) where


import qualified Control.Arrow                  as Arrow
import qualified Control.Concurrent             as Concurrent
import qualified Control.Monad                  as Monad
import           Control.Monad.Trans.Writer.CPS (Writer, execWriter, runWriter, tell)
import qualified Data.DList                     as DList
import qualified System.IO                      as IO

import           ACME.PreCure.Types


newtype PreCureMonad a =
  PreCureMonad { runPreCureMonadD :: Writer (DList.DList String) a }
  deriving (Functor, Applicative, Monad)


newtype EpisodeConfig =
  EpisodeConfig
    { lineIntervalMicroSec :: Int }


defaultEpisodeConfig :: EpisodeConfig
defaultEpisodeConfig =
  EpisodeConfig $ 1 * 1000 * 1000


speak :: [String] -> PreCureMonad ()
speak =
  PreCureMonad . tell . DList.fromList


say :: String -> PreCureMonad ()
say =
  PreCureMonad . tell . DList.singleton


composeEpisode :: PreCureMonad a -> [String]
composeEpisode =
  execPreCureMonad


runPreCureMonad :: PreCureMonad a -> (a, [String])
runPreCureMonad =
  Arrow.second DList.toList . runWriter . runPreCureMonadD

execPreCureMonad :: PreCureMonad a -> [String]
execPreCureMonad =
  DList.toList . execWriter . runPreCureMonadD


printEpisode :: PreCureMonad a -> IO ()
printEpisode =
  printEpisodeWith defaultEpisodeConfig


hPrintEpisode :: IO.Handle -> PreCureMonad a -> IO ()
hPrintEpisode =
  (`hPrintEpisodeWith` defaultEpisodeConfig)


printEpisodeWith :: EpisodeConfig -> PreCureMonad a -> IO ()
printEpisodeWith =
  hPrintEpisodeWith IO.stdout


hPrintEpisodeWith :: IO.Handle -> EpisodeConfig -> PreCureMonad a -> IO ()
hPrintEpisodeWith h cfg a = do
  let interval = lineIntervalMicroSec cfg
  Monad.forM_ (composeEpisode a) $ \s -> do
    IO.hPutStrLn h s
    IO.hFlush h
    Concurrent.threadDelay interval


transform :: (Transformation g' i') => g' -> i' -> PreCureMonad (Style g' i')
transform g i = do
  speak $ transformationSpeech g i
  return $ transformedStyle g i


purify
  :: (Purification p' i')
  => p' -> i' -> PreCureMonad ()
purify p =
  speak . purificationSpeech p


purifyWithoutItem
  :: (NonItemPurification p')
  => p' -> PreCureMonad ()
purifyWithoutItem =
  speak . nonItemPurificationSpeech
