module ACME.PreCure.Monad.Config
  ( EpisodeConfig(lineIntervalMicroSec)
  , defaultEpisodeConfig
  ) where


newtype EpisodeConfig = EpisodeConfig { lineIntervalMicroSec :: Int }

defaultEpisodeConfig :: EpisodeConfig
defaultEpisodeConfig = EpisodeConfig $ 1 * 1000 * 1000
