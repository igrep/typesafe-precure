{-# LANGUAGE QuasiQuotes #-}

import           Control.Monad                 (mapM_)
import qualified Data.String.Here.Interpolated as HI
import qualified Data.Text                     as T
import qualified Data.Text.IO                  as T
import qualified System.Directory              as D
import qualified System.FilePath               as F


main :: IO ()
main = genTypesHs


genTypesHs :: IO ()
genTypesHs =
  ( mapM_ (T.putStr . typeHsFromSeriesName)
    . filter (\path -> notYetMigrated path && isDirectory path) -- Except for already migrated series
    )
    =<< D.listDirectory "src/ACME/PreCure/Textbook/"


notYetMigrated :: FilePath -> Bool
notYetMigrated = not . (`elem` ["Hugtto", "KirakiraALaMode"])


isDirectory :: FilePath -> Bool
isDirectory = null . F.takeExtension


typeHsFromSeriesName :: FilePath -> T.Text
typeHsFromSeriesName seriesName = T.unlines $ map (T.strip . T.pack) $ lines src
 where
  src = [HI.iTrim|
    {-# LANGUAGE FlexibleInstances #-}
    {-# LANGUAGE MultiParamTypeClasses #-}
    {-# LANGUAGE TypeFamilies #-}
    {-# LANGUAGE TemplateHaskell #-}
    {-# OPTIONS_GHC -fno-warn-orphans #-}

    module ACME.PreCure.Textbook.${seriesName}.Types where

    import           ACME.PreCure.Types.TH

    import           ACME.PreCure.Textbook.${seriesName}.Profiles

    {-# ANN module girls${seriesName} #-}
    $(declareGirls girls${seriesName})

    {-# ANN module transformees${seriesName} #-}
    $(declareTransformees transformees${seriesName})

    {-# ANN module transformedGroups${seriesName} #-}
    $(declareTransformedGroups transformedGroups${seriesName})

    {-# ANN module specialItems${seriesName} #-}
    $(declareSpecialItems specialItems${seriesName})

    {-# ANN module transformations${seriesName} #-}
    $(declareTransformations transformations${seriesName})

    {-# ANN module purifications${seriesName} #-}
    $(declarePurifications purifications${seriesName})
  |]
