{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_GHC -fno-warn-unused-top-binds #-}

module ACME.PreCure.Index.Types
  ( Girl(..)
  , Transformee(..)
  , TransformedGroup(..)
  , SpecialItem(..)
  , IdAttachments(..)
  , Transformation(..)
  , Purification(..)
  , NonItemPurification(..)
  , Index(..)
  , mkGirl
  , mkTransformee
  , mkTransformedGroup
  , mkSpecialItem
  , mkIA
  , mkTransformation
  , mkPurification
  , mkNonItemPurification
  , mkIndex
  ) where

import           Data.Aeson
                   ( ToJSON
                   , toJSON
                   , FromJSON
                   , parseJSON
                   , (.=)
                   , (.:)
                   )
import qualified Data.Aeson as Json
import qualified Data.Aeson.Types as Json
import           Data.Aeson.DeriveNoPrefix
                   ( deriveJsonNoTypeNamePrefix
                   )
import           Data.Data
                   ( Data
                   )
import           Data.String
                   ( IsString
                   , fromString
                   )
import qualified Data.Text as T


-- | Pair of the Girl data type name and their name
data Girl =
  Girl { girlId :: String, girlNameEn :: String, girlNameJa :: String }
    deriving (Eq, Show, Data, Ord)

$(deriveJsonNoTypeNamePrefix ''Girl)

mkGirl :: String -> String -> Girl
mkGirl ne = Girl (head $ words ne) ne


typeNamify :: String -> String
typeNamify = concat . words


prefixify :: String -> String
prefixify ve = if null ve then "" else '_' : typeNamify ve


data Transformee =
  Transformee
    { transformedId :: String
    , transformedNameEn :: String
    , transformedVariationEn :: String
    , transformedNameJa :: String
    , transformedVariationJa :: String
    , transformedIntroducesHerselfAs :: String
    } deriving (Eq, Show, Data, Ord)

$(deriveJsonNoTypeNamePrefix ''Transformee)

mkTransformee :: String -> String -> String -> String -> String -> Transformee
mkTransformee ne ve = Transformee (typeNamify ne ++ prefixify ve) ne ve


data TransformedGroup =
  TransformedGroup
    { transformedGroupTransformerIds :: [String]
    , transformedGroupNameEn :: String
    , transformedGroupVariationEn :: String
    , transformedGroupNameJa :: String
    , transformedGroupVariationJa :: String
    } deriving (Eq, Show, Data, Ord)

$(deriveJsonNoTypeNamePrefix ''TransformedGroup)

mkTransformedGroup :: [String] -> String -> String -> String -> String -> TransformedGroup
mkTransformedGroup = TransformedGroup


data SpecialItem =
  SpecialItem
    { specialItemId :: String
    , specialItemNameEn :: String
    , specialItemNameJa :: String
    , specialItemAttachments :: [String]
    } deriving (Eq, Show, Data, Ord)

$(deriveJsonNoTypeNamePrefix ''SpecialItem)

mkSpecialItem :: String -> String -> [String] -> SpecialItem
mkSpecialItem ne = SpecialItem (typeNamify ne) ne


data IdAttachments =
  IdAttachments
    { idAttachementsI :: String
    , idAttachementsA :: [IdAttachments]
    } deriving (Eq, Show, Data, Ord)

instance ToJSON IdAttachments where
  toJSON (IdAttachments i []) = toJSON i
  toJSON (IdAttachments i a) =
    Json.object ["i" .= toJSON i, "a" .= toJSON a]

instance FromJSON IdAttachments where
  parseJSON (Json.String t) = return $ IdAttachments (T.unpack t) []
  parseJSON (Json.Object o) = IdAttachments <$> o .: "i" <*> o .: "a"
  parseJSON other = Json.typeMismatch "IdAttachments" other

instance IsString IdAttachments where
  fromString s = mkIA s []


mkIA :: String -> [IdAttachments] -> IdAttachments
mkIA = IdAttachments


data Transformation =
  Transformation
    { transformationTransformers :: [IdAttachments]
    , transformationSpecialItems :: [IdAttachments]
    , transformationTransformees :: [String]
    , transformationSpeech :: [String]
    } deriving (Eq, Show, Data, Ord)

$(deriveJsonNoTypeNamePrefix ''Transformation)

mkTransformation :: [IdAttachments] -> [IdAttachments] -> [String] -> [String] -> Transformation
mkTransformation = Transformation


data NonItemPurification =
  NonItemPurification
    { nonItemPurificationPurifiers :: [IdAttachments]
    , nonItemPurificationSpeech :: [String]
    } deriving (Eq, Show, Data, Ord)

$(deriveJsonNoTypeNamePrefix ''NonItemPurification)

mkNonItemPurification :: [IdAttachments] -> [String] -> NonItemPurification
mkNonItemPurification = NonItemPurification


data Purification =
  Purification
    { purificationPurifiers :: [IdAttachments]
    , purificationSpecialItems :: [IdAttachments]
    , purificationSpeech :: [String]
    } deriving (Eq, Show, Data, Ord)

$(deriveJsonNoTypeNamePrefix ''Purification)

mkPurification :: [IdAttachments] -> [IdAttachments] -> [String] -> Purification
mkPurification = Purification


data Index =
  Index
    { indexGirls :: [Girl]
    , indexTransformees :: [Transformee]
    , indexTransformedGroups :: [TransformedGroup]
    , indexSpecialItems :: [SpecialItem]
    , indexTransformations :: [Transformation]
    , indexPurifications :: [Purification]
    , indexNonItemPurifications :: [NonItemPurification]
    } deriving (Eq, Show, Ord)

$(deriveJsonNoTypeNamePrefix ''Index)

mkIndex
  :: [Girl]
  -> [Transformee]
  -> [TransformedGroup]
  -> [SpecialItem]
  -> [Transformation]
  -> [Purification]
  -> [NonItemPurification]
  -> Index
mkIndex = Index
