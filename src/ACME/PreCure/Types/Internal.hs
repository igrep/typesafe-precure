module ACME.PreCure.Types.Internal
  ( Profile(..)
  ) where


data Profile =
  Profile
    { humanName           :: String
    , cureName            :: String
    , transformationSpeech :: String
    , purificationSpeech        :: String
    }
