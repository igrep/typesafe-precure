{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE TemplateHaskell #-}

module ACME.PreCure.Index.Types where

import           Data.Data
                   ( Data
                   )

import           ACME.PreCure.Index.Lib


-- | Pair of the Girl data type name and their name
data Girl =
  Girl { girlNameEn :: String, girlNameJa :: String }
    deriving (Eq, Show, Data)

deriveToJsonWithoutTypeNamePrefix ''Girl
