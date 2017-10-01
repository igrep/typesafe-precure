{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -fno-warn-unused-top-binds #-}

module ACME.PreCure.Index.Types
  ( Girl(Girl)
  , Transformed(Transformed)
  , SpecialItem(SpecialItem)
  , IdAttachments(IdAttachments)
  , Transformation(Transformation)
  , Index
  , mkGirl
  , mkTransformed
  , mkSpecialItem
  , mkIA
  , mkTransformation
  , mkIndex
  ) where

import           Data.Aeson
                   ( ToJSON
                   , toJSON
                   , object
                   , (.=)
                   )
import           Data.Data
                   ( Data
                   )
import           Data.String
                   ( IsString
                   , fromString
                   )

import           ACME.PreCure.Index.Lib


-- | Pair of the Girl data type name and their name
data Girl =
  Girl { girlId :: String, girlNameEn :: String, girlNameJa :: String }
    deriving (Eq, Show, Data)

$(deriveToJsonWithoutTypeNamePrefix ''Girl)

mkGirl :: String -> String -> Girl
mkGirl ne = Girl (head $ words ne) ne


-- TODO: rename into Transformees
data Transformed =
  Transformed
    { transformedId :: String
    , transformedNameEn :: String
    , transformedNameJa :: String
    , transformedIntroducesHerselfAs :: String
    , transformedVariation :: String
    } deriving (Eq, Show, Data)

$(deriveToJsonWithoutTypeNamePrefix ''Transformed)

mkTransformed :: String -> String -> String -> String -> Transformed
mkTransformed ne = Transformed (concat $ words ne) ne


data SpecialItem =
  SpecialItem
    { specialItemId :: String
    , specialItemNameEn :: String
    , specialItemNameJa :: String
    , specialItemAttachments :: [String]
    } deriving (Eq, Show, Data)

$(deriveToJsonWithoutTypeNamePrefix ''SpecialItem)

mkSpecialItem :: String -> String -> [String] -> SpecialItem
mkSpecialItem ne = SpecialItem (concat $ words ne) ne


data IdAttachments =
  IdAttachments
    { idAttachementsI :: String
    , idAttachementsA :: [IdAttachments]
    } deriving (Eq, Show, Data)

instance ToJSON IdAttachments where
  toJSON (IdAttachments i []) = toJSON i
  toJSON (IdAttachments i a) =
    object ["i" .= toJSON i, "a" .= toJSON a]

instance IsString IdAttachments where
  fromString s = mkIA s []


mkIA :: String -> [IdAttachments] -> IdAttachments
mkIA = IdAttachments


data Transformation =
  Transformation
    { transformationTransformers :: [IdAttachments]
    , transformationSpecialItems :: [IdAttachments]
    , transformationTransformeds :: [String]
    , transformationTransformationSpeech :: [String]
    } deriving (Eq, Show, Data)

$(deriveToJsonWithoutTypeNamePrefix ''Transformation)

mkTransformation :: [IdAttachments] -> [IdAttachments] -> [String] -> [String] -> Transformation
mkTransformation = Transformation


data Index =
  Index
    { indexGirls :: [Girl]
    , indexTransformeds :: [Transformed]
    , indexSpecialItems :: [SpecialItem]
    , indexTransformations :: [Transformation]
    } deriving (Eq, Show)

$(deriveToJsonWithoutTypeNamePrefix ''Index)

mkIndex :: [Girl] -> [Transformed] -> [SpecialItem] -> [Transformation] -> Index
mkIndex = Index
