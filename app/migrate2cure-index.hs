{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE RecordWildCards   #-}

import           Control.Applicative ((<|>))
import           Control.Monad                 (mapM_, void)
import qualified Data.Attoparsec.Text          as A
import qualified Data.String.Here.Interpolated as HI
import qualified Data.Text                     as T
import qualified Data.Text.IO                  as T
import qualified System.Directory              as D
import qualified System.FilePath               as F
import qualified Text.Parser.Substring         as PS

import           ACME.PreCure.Index.Types

import           Debug.NoTrace


main :: IO ()
main = do
  let targetRoot = "src/ACME/PreCure/Textbook/"
  targetDirNames <-
    filter (\path -> notYetMigrated path && isDirectory path)
    <$> D.listDirectory targetRoot
  genTypesHs targetDirNames
  putStrLn "\n\n----------------------------------------------------\n"
  genProfilesHs (map (targetRoot ++) targetDirNames)


genTypesHs :: [FilePath] -> IO ()
genTypesHs = mapM_ (T.putStr . typeHsFromSeriesName)

genProfilesHs :: [FilePath] -> IO ()
genProfilesHs = mapM_ $ \seriesRoot -> do
  putStrLn $ "\n-- " ++ seriesRoot ++ " --"
  mapM_ print . parseAll =<< T.readFile (seriesRoot ++ "/Types.hs")


parseAll :: T.Text -> [Aux]
parseAll content =
  case A.feed (A.parse (PS.matchAll pAux) content) "" of
      A.Done _ girls -> girls
      other -> error $ "Not done: " ++ show other


-- | Use to reject already migrated series
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


--------------------------------------------------- parsers

type Expression = String

data Aux =
    AS SingletonData
  | AG Girl
  deriving (Eq, Show)

data SingletonData = SingletonData
  { dataName :: !Expression
  , typeArgs :: ![Expression]
  } deriving (Eq, Show)


pName :: A.Parser Expression
pName =
  A.many1' $ A.satisfy (\c -> c == '_' || ('A' <= c && c <= 'Z') || ('a' <= c && c <= 'z'))


quote :: String -> Expression
quote s = "\"" ++ s ++ "\""


pAux :: A.Parser Aux
pAux = pSingletonData <|> pGirlInstance


pSingletonData :: A.Parser Aux
pSingletonData = do
  void $ A.string "data "
  dataName <- pName
  typeArgs <- A.many' (A.char ' ' >> pName)
  pure $ AS SingletonData {..}


pGirlInstance :: A.Parser Aux
pGirlInstance = do
  void $ A.string "girlInstance [t|"
  A.skipSpace
  traceM "DEBUG: girlInstance"

  girlId <- quote <$> pName
  let girlNameEn = girlId ++ " ++ error \"Need family name!\""
  traceM "DEBUG: girlId"

  A.skipSpace
  void $ A.string "|]"
  A.skipSpace

  girlNameJa <- pName
  traceM "DEBUG: girlNameJa"

  pure $ AG Girl {..}
