{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE TemplateHaskell    #-}
{-# OPTIONS_GHC -fno-warn-unused-top-binds #-}

module ACME.PreCure.Index.Types
  ( Girl(Girl)
  , Transformee(Transformee)
  , TransformedGroup(TransformedGroup)
  , SpecialItem(SpecialItem)
  , IdAttachments(IdAttachments)
  , Transformation(Transformation)
  , Purification(Purification)
  , NonItemPurification(NonItemPurification)
  , Index(Index)
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

import           Data.Aeson             (ToJSON, object, toJSON, (.=))
import           Data.Data              (Data)
import           Data.String            (IsString, fromString)
import           Safe                   (headNote)

import           ACME.PreCure.Index.Lib


-- | Pair of the Girl data type name and their name
data Girl =
  Girl { girlId :: String, girlNameEn :: String, girlNameJa :: String }
    deriving (Eq, Show, Data)

$(deriveToJsonWithoutTypeNamePrefix ''Girl)

mkGirl :: String -> String -> Girl
mkGirl ne = Girl (headNote "Girl's name must be non-empty" $ words ne) ne


typeNamify :: String -> String
typeNamify = concat . words . replaceDashes
 where
  replaceDashes = map (\c -> if c == '-' then ' ' else c)


prefixify :: String -> String
prefixify ve = if null ve then "" else '_' : typeNamify ve


data Transformee =
  Transformee
    { transformedId                  :: String
    , transformedNameEn              :: String
    , transformedVariationEn         :: String
    , transformedNameJa              :: String
    , transformedVariationJa         :: String
    , transformedIntroducesHerselfAs :: String
    } deriving (Eq, Show, Data)

$(deriveToJsonWithoutTypeNamePrefix ''Transformee)

mkTransformee :: String -> String -> String -> String -> String -> Transformee
mkTransformee ne ve = Transformee (typeNamify ne ++ prefixify ve) ne ve


data TransformedGroup =
  TransformedGroup
    { transformedGroupTransformerIds :: [String]
    , transformedGroupNameEn         :: String
    , transformedGroupVariationEn    :: String
    , transformedGroupNameJa         :: String
    , transformedGroupVariationJa    :: String
    } deriving (Eq, Show, Data)

$(deriveToJsonWithoutTypeNamePrefix ''TransformedGroup)

mkTransformedGroup :: [String] -> String -> String -> String -> String -> TransformedGroup
mkTransformedGroup = TransformedGroup


data SpecialItem =
  SpecialItem
    { specialItemId     :: String
    , specialItemNameEn :: String
    , specialItemNameJa :: String
    } deriving (Eq, Show, Data)

$(deriveToJsonWithoutTypeNamePrefix ''SpecialItem)

mkSpecialItem :: String -> String -> SpecialItem
mkSpecialItem ne = SpecialItem (typeNamify ne) ne


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
    , transformationTransformees :: [String]
    , transformationSpeech       :: [String]
    } deriving (Eq, Show, Data)

$(deriveToJsonWithoutTypeNamePrefix ''Transformation)

mkTransformation :: [IdAttachments] -> [IdAttachments] -> [String] -> [String] -> Transformation
mkTransformation = Transformation


data NonItemPurification =
  NonItemPurification
    { nonItemPurificationPurifiers :: [IdAttachments]
    , nonItemPurificationSpeech    :: [String]
    } deriving (Eq, Show, Data)

$(deriveToJsonWithoutTypeNamePrefix ''NonItemPurification)

mkNonItemPurification :: [IdAttachments] -> [String] -> NonItemPurification
mkNonItemPurification = NonItemPurification


data Purification =
  Purification
    { purificationPurifiers    :: [IdAttachments]
    , purificationSpecialItems :: [IdAttachments]
    , purificationSpeech       :: [String]
    } deriving (Eq, Show, Data)

$(deriveToJsonWithoutTypeNamePrefix ''Purification)

mkPurification :: [IdAttachments] -> [IdAttachments] -> [String] -> Purification
mkPurification = Purification


data Index =
  Index
    { indexGirls                :: [Girl]
    , indexTransformees         :: [Transformee]
    , indexTransformedGroups    :: [TransformedGroup]
    , indexSpecialItems         :: [SpecialItem]
    , indexTransformations      :: [Transformation]
    , indexPurifications        :: [Purification]
    , indexNonItemPurifications :: [NonItemPurification]
    } deriving (Eq, Show)

$(deriveToJsonWithoutTypeNamePrefix ''Index)

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
