module ACME.PreCure.Types.Internal
  ( Profile(..)
  ) where


data Profile =
  Profile
    { humanName           :: String
    , cureName            :: String
    , transformtionSpeech :: String
    , attackSpeech        :: String
    }
