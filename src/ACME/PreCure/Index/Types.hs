{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DeriveDataTypeable #-}

module ACME.PreCure.Index.Types where

import           Data.Aeson
                   ( ToJSON
                   )
import           Data.Data
                   ( Data
                   )

import           GHC.Generics (Generic)


-- | Pair of the Girl data type name and their name
data Girl =
  Girl { girlId :: String, girlName :: String }
    deriving (Eq, Show, Generic, Data)


instance ToJSON Girl
