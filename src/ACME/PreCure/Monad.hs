{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE GADTs #-}

module ACME.PreCure.Monad
  ( PreCureMonad
  , EpisodeConfig(lineIntervalMicroSec)
  , defaultEpisodeConfig
  , speak
  , say
  , runPreCureMonad
  , composeEpisode
  , printEpisode
  , printEpisodeWith
  , hPrintEpisode
  , hPrintEpisodeWith
  , transform
  , purify
  , purifyWithoutItem
  ) where


import qualified Control.Arrow as Arrow
import qualified Control.Concurrent as Concurrent
import qualified Control.Monad as Monad
import           Control.Monad.Skeleton
                   ( Skeleton
                   , MonadView((:>>=), Return)
                   , bone
                   , debone
                   )
import qualified Data.DList as DList
import           Data.Monoid ((<>))
import qualified System.IO as IO

import           ACME.PreCure.Types


data PreCureMonadBase x where
  Speak :: [String] -> PreCureMonadBase ()


type PreCureMonad = Skeleton PreCureMonadBase


newtype EpisodeConfig =
  EpisodeConfig
    { lineIntervalMicroSec :: Int }


defaultEpisodeConfig :: EpisodeConfig
defaultEpisodeConfig =
  EpisodeConfig $ 1 * 1000 * 1000


speak :: [String] -> PreCureMonad ()
speak =
  bone . Speak


say :: String -> PreCureMonad ()
say =
  speak . (:[])


composeEpisode :: PreCureMonad a -> [String]
composeEpisode =
  snd . runPreCureMonad


runPreCureMonad :: PreCureMonad a -> (a, [String])
runPreCureMonad =
    Arrow.second DList.toList . runPreCureMonadD


runPreCureMonadD :: PreCureMonad a -> (a, DList.DList String)
runPreCureMonadD a =
  case debone a of
       Speak ss :>>= k ->
         let (x, ss') = runPreCureMonadD $ k ()
         in
           (x, DList.fromList ss <> ss')
       Return x -> (x, DList.empty)


printEpisode :: PreCureMonad a -> IO ()
printEpisode =
  printEpisodeWith defaultEpisodeConfig


hPrintEpisode :: IO.Handle -> PreCureMonad a -> IO ()
hPrintEpisode =
  flip hPrintEpisodeWith defaultEpisodeConfig


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
