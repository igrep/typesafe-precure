{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE RecordWildCards   #-}

import           Control.Applicative           (optional, (<|>))
import           Control.Monad                 (mapM_, void)
import qualified Data.Attoparsec.Text          as A
import           Data.Char                     (isUpper)
import           Data.List                     (break)
import           Data.Maybe                    (isJust)
import           Data.Monoid                   ((<>))
import qualified Data.String.Here.Interpolated as HI
import qualified Data.Text                     as T
import qualified Data.Text.IO                  as T
import qualified System.Directory              as D
import qualified System.FilePath               as F
import qualified Text.Parser.Substring         as PS
import           Text.Pretty.Simple            (pPrint)

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
  mapM_ pPrint . parseAll =<< T.readFile (seriesRoot ++ "/Types.hs")


parseAll :: T.Text -> [Aux]
parseAll content =
  case A.feed (A.parse (PS.matchAll pAux) content) "" of
      A.Done _ auxs -> auxs
      other         -> error $ "Not done: " ++ show other


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
  | AT Transformee
  | ATG TransformedGroup
  | ATN Transformation
  deriving (Eq, Show)

data SingletonData = SingletonData
  { dataName :: !Expression
  , typeArgs :: ![Expression]
  } deriving (Eq, Show)


pName :: A.Parser Expression
pName =
  A.many1' $ A.satisfy (\c -> c == '_' || ('A' <= c && c <= 'Z') || ('a' <= c && c <= 'z') || ('0' <= c && c <= '9'))


quote :: String -> Expression
quote s = "\"" ++ s ++ "\""


pAux :: A.Parser Aux
pAux = pSingletonData
  <|>  pGirlInstance
  <|>  pTransformedInstance
  <|>  pTransformedGroupInstance
  <|>  pTransformation


pSingletonData :: A.Parser Aux
pSingletonData = do
  void $ A.string "data "
  dataName <- quote <$> pName
  typeArgs <- A.many' (A.char ' ' >> quote <$> pName)
  pure $ AS SingletonData {..}


pGirlInstance :: A.Parser Aux
pGirlInstance = do
  void $ A.string "girlInstance [t|"
  A.skipSpace

  girlId <- quote <$> pName
  let girlNameEn = girlId ++ " ++ error \"Need family name!\""

  A.skipSpace
  void $ A.string "|]"
  A.skipSpace

  girlNameJa <- pName

  pure $ AG Girl {..}


pTransformedInstance :: A.Parser Aux
pTransformedInstance = do
  void $ A.string "transformedInstance"
  isDefault <- fmap isJust $ optional $ A.string "Default"
  A.skipSpace
  beginQQ "t"

  transformedIdNQ <- pName
  let transformedId = quote transformedIdNQ
      (transformedIdNQNV, transformedVariationEnUS) = break (== '_') transformedIdNQ
      transformedVariationEn = quote $
        case transformedVariationEnUS of
            ('_' : left) -> splitBeforeUpper left
            other        -> other
      transformedNameEn = quote $ splitBeforeUpper transformedIdNQNV

  endQQ

  A.skipSpace
  transformedNameJa <- pName

  A.skipSpace
  (transformedIntroducesHerselfAs, transformedVariationJa) <-
    if isDefault
      then (,) <$> A.manyTill (A.notChar '\n') (A.char '\n') <*> pure (quote "")
      else (,) <$> (quote <$> pName) <*> (A.skipSpace *> pName)

  pure $ AT Transformee {..}


pTransformedGroupInstance :: A.Parser Aux
pTransformedGroupInstance = do
  void $ A.string "transformedGroupInstance"
  isDefault <- fmap isJust $ optional $ A.string "Default"
  A.skipSpace

  beginQQ "t"
  transformedGroupTransformerIds <- pNameTuple
  endQQ

  A.skipSpace
  transformedGroupNameJa <- pName
  let transformedGroupNameEn = quote $ splitBeforeUpper $ dropPrefix transformedGroupNameJa

  (transformedGroupVariationJa, transformedGroupVariationEn) <-
    if isDefault
      then pure (quote "", quote "")
      else do
        A.skipSpace
        vari <- pName
        pure (vari, quote $ splitBeforeUpper $ dropPrefix vari)

  pure $ ATG TransformedGroup {..}


pTransformation :: A.Parser Aux
pTransformation = do
  void $ A.string "transformationInstance"
  A.skipSpace

  beginQQ "t"
  transformationTransformers <- pIdAttachmentss
  endQQ
  A.skipSpace

  beginQQ "t"
  transformationSpecialItems <- pIdAttachmentss
  endQQ
  A.skipSpace

  beginQQ "t"
  transformationTransformees <- map quote <$> pNames
  traceM $ "DEBUG: transformationTransformees <- pNames: " ++ show transformationTransformees
  endQQ
  A.skipSpace

  beginQQ ""
  _ <- pNames
  endQQ
  A.skipSpace

  transformationSpeech <- (: []) <$> pName
  traceM "DEBUG: transformationSpeech"

  pure $ ATN Transformation {..}

dropPrefix :: Expression -> Expression
dropPrefix = tail . dropWhile (/= '_')


pNameTuple :: A.Parser [String]
pNameTuple = pTupleOf pName


pNames :: A.Parser [String]
pNames = pNameTuple <|> ((: []) <$> pName)


pIdAttachmentss :: A.Parser [IdAttachments]
pIdAttachmentss = pTupleOf pIdAttachments <|> ((: []) <$> pIdAttachments)


pIdAttachments :: A.Parser IdAttachments
pIdAttachments = do
  idAttachementsI <- pName
  idAttachementsA <- A.many' (A.skipSpace *> (inParen pIdAttachments <|> pIdAttachments))
  pure IdAttachments {..}


pTupleOf :: A.Parser a -> A.Parser [a]
pTupleOf p = inParen (p `A.sepBy` (optional A.skipSpace *> A.char ',' *> A.skipSpace))


inParen :: A.Parser a -> A.Parser a
inParen p = A.char '(' *> optional A.skipSpace *> p <* optional A.skipSpace <* A.char ')'


splitBeforeUpper :: Expression -> Expression
splitBeforeUpper "" = error "Assertion failure: non empty expression"
splitBeforeUpper (first : left) = first : foldr f "" left
 where
  f c accum =
    if isUpper c
      then ' ' : c : accum
      else c : accum


beginQQ :: T.Text -> A.Parser ()
beginQQ name = do
  void $ A.string $ "[" <> name <> "|"
  A.skipSpace


endQQ :: A.Parser ()
endQQ = do
  A.skipSpace
  void $ A.string "|]"
