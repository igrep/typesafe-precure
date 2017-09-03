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

$(deriveToJsonWithoutTypeNamePrefix ''Girl)


data Transformed =
  Transformed
    { transformedNameEn :: String
    , transformedNameJa :: String
    , transformedIntroducesHerselfAs :: String
    , transformedVariation :: String
    } deriving (Eq, Show, Data)

$(deriveToJsonWithoutTypeNamePrefix ''Transformed)


data Index =
  Index
    { indexGirls :: [Girl]
    , indexTransformeds :: [Transformed]
    } deriving (Eq, Show)

$(deriveToJsonWithoutTypeNamePrefix ''Index)
