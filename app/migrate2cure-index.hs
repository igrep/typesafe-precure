{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE RecordWildCards   #-}

import           Control.Applicative           (optional, (<|>))
import           Control.Monad                 (guard, mapM_, void)
import qualified Data.Attoparsec.Text          as A
import           Data.Char                     (isUpper)
import           Data.List                     (break)
import           Data.Maybe                    (isJust, mapMaybe)
import           Data.Monoid                   (mconcat, (<>))
import qualified Data.String.Here.Interpolated as HI
import qualified Data.Text                     as T
import qualified Data.Text.IO                  as T
import qualified Data.Text.Lazy                as TL
import qualified Data.Text.Lazy.Builder        as TL
import qualified Data.Text.Lazy.IO             as TL
import qualified System.Directory              as D
import qualified System.FilePath               as F
import qualified Text.Parser.Substring         as PS

import           ACME.PreCure.Index.Types

import           Debug.NoTrace


main :: IO ()
main = do
  targetDirNames <-
    filter (\path -> notYetMigrated path && isDirectory path)
    <$> D.listDirectory targetRoot
  genTypesHs targetDirNames
  putStrLn "\n\n----------------------------------------------------\n"
  genProfilesHs targetDirNames


targetRoot :: FilePath
targetRoot = "src/ACME/PreCure/Textbook/"


genTypesHs :: [String] -> IO ()
genTypesHs = mapM_ (T.putStr . typeHsFromSeriesName)

genProfilesHs :: [FilePath] -> IO ()
genProfilesHs = mapM_ $ \seriesName -> do
  let seriesRoot = targetRoot ++ seriesName
  putStrLn $ "\n-- " ++ seriesRoot ++ " --"
  TL.putStr . buildProfileHs seriesName . classify . parseAll =<< T.readFile (seriesRoot ++ "/Types.hs")


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

    {-# ANN module girls #-}
    $(declareGirls girls)

    {-# ANN module transformees #-}
    $(declareTransformees transformees)

    {-# ANN module transformedGroups #-}
    $(declareTransformedGroups transformedGroups)

    {-# ANN module specialItems #-}
    $(declareSpecialItems specialItems)

    {-# ANN module transformations #-}
    $(declareTransformations transformations)

    {-# ANN module purifications #-}
    $(declarePurifications purifications)

    {-# ANN module nonItemPurifications #-}
    $(declarePurifications nonItemPurifications)
  |]


--------------------------------------------------- classifier and builder


buildProfileHs :: String -> Index -> TL.Text
buildProfileHs seriesName Index {..} = TL.toLazyText $ mconcat
  [ profilesHsHeader
  , sourceOfGirls indexGirls
  , sourceOfTransformees indexTransformees
  , sourceOfTransformedGroups indexTransformedGroups
  , sourceOfSpecialItems indexSpecialItems
  , sourceOfTransformations indexTransformations
  , sourceOfPurifications indexPurifications
  , sourceOfNonItemPurifications indexNonItemPurifications
  ]

 where
  profilesHsHeader = TL.fromLazyText $ TL.unlines
    [ "{-# OPTIONS_GHC -fno-warn-missing-signatures #-}"
    , "{-# LANGUAGE OverloadedStrings #-}"
    , ""
    , "module ACME.PreCure.Textbook.Hugtto.Profiles where"
    , ""
    , "import           ACME.PreCure.Index.Types"
    , "import           ACME.PreCure.Textbook." <> TL.pack seriesName <> ".Words"
    , ""
    , ""
    ]

  sourceOfGirls girls = mconcat
    ["girls :: [Girl]\n", "girls =\n", toMultiLineText (map toMkGirl girls), "\n", "\n"]

  toMkGirl Girl {..} = "mkGirl " <> TL.pack girlNameEn <> " " <> TL.pack girlNameJa

  sourceOfTransformees transformees = mconcat
    ["transformees :: [Transformee]\n", "transformees =\n", toMultiLineText (map toMkTransformee transformees), "\n", "\n"]

  toMkTransformee Transformee {..} = TL.unlines
    [ "mkTransformee"
    , "      " <> TL.pack transformedNameEn
    , "      " <> TL.pack transformedVariationEn
    , "      " <> TL.pack transformedNameJa
    , "      " <> TL.pack transformedVariationJa
    , "      " <> TL.pack transformedIntroducesHerselfAs
    ]

  sourceOfTransformedGroups transformedGroups = mconcat
    ["transformedGroups :: [TransformedGroup]\n", "transformedGroups =\n", toMultiLineText (map toMkTransformedGroup transformedGroups), "\n", "\n"]

  toMkTransformedGroup TransformedGroup {..} = TL.intercalate " "
    [ "mkTransformedGroup"
    , "[" <> TL.intercalate ", " (map (TL.pack . show) transformedGroupTransformerIds) <> "]"
    , TL.pack transformedGroupNameEn
    , TL.pack transformedGroupVariationEn
    , TL.pack transformedGroupNameJa
    , TL.pack transformedGroupVariationJa
    ]

  sourceOfSpecialItems specialItems = mconcat
    ["specialItems :: [SpecialItem]\n", "specialItems =\n", toMultiLineText (map toMkSpecialItem specialItems), "\n", "\n"]

  toMkSpecialItem SpecialItem {..} = TL.intercalate " "
    [ "mkSpecialItem"
    , TL.pack specialItemNameEn
    , TL.pack specialItemNameJa
    , "[" <> TL.intercalate ", " (map TL.pack specialItemAttachments) <> "]"
    ]

  sourceOfTransformations transformations = mconcat
    ["transformations :: [Transformation]\n", "transformations =\n", toMultiLineText (map toMkTransformation transformations), "\n", "\n"]

  toMkTransformation Transformation {..} = TL.unlines
    [ "mkTransformation"
    , "      [" <> TL.intercalate ", " (map toMkIa transformationTransformers) <> "]"
    , "      [" <> TL.intercalate ", " (map toMkIa transformationSpecialItems) <> "]"
    , "      "  <> TL.pack (show transformationTransformees)
    , "      "  <> TL.pack (head transformationSpeech)
    --                     ^ The collected transformationSpeech-es should have only one element
    --                       to refer the variable name of transformationSpeech
    ]

  sourceOfPurifications purifications = mconcat
    ["purifications :: [Purification]\n", "purifications =\n", toMultiLineText (map toMkPurification purifications), "\n", "\n"]

  toMkPurification Purification {..} = TL.unlines
    [ "mkPurification"
    , "      [" <> TL.intercalate ", " (map toMkIa purificationPurifiers) <> "]"
    , "      [" <> TL.intercalate ", " (map toMkIa purificationSpecialItems) <> "]"
    , "      "  <> TL.pack (head purificationSpeech)
    --                     ^ The collected purificationSpeech-es should have only one element
    --                       to refer the variable name of purificationSpeech
    ]

  sourceOfNonItemPurifications nonItemPurifications = mconcat
    ["nonItemPurifications :: [NonItemPurification]\n", "nonItemPurifications =\n", toMultiLineText (map toMkNonItemPurification nonItemPurifications), "\n", "\n"]

  toMkNonItemPurification NonItemPurification {..} = TL.intercalate " "
    ["mkNonItemPurification"
    , "[" <> TL.intercalate ", " (map toMkIa nonItemPurificationPurifiers) <> "]"
    , TL.pack (head nonItemPurificationSpeech)
    --         ^ The collected nonItemPurificationSpeech-es should have only one element
    --           to refer the variable name of nonItemPurificationSpeech
    ]

  toMultiLineText ts = TL.fromLazyText $ "  [ " <> TL.intercalate "\n  , " ts <> "\n  ]\n"

  toMkIa (IdAttachments i []) = TL.pack $ show i
  toMkIa (IdAttachments i as) = "mkIA " <> TL.pack (show i) <> " [" <> TL.intercalate ", " (map toMkIa as) <> "]"


classify :: [Aux] -> Index
classify auxs = index { indexSpecialItems = selectSpecialItems index specialItems }
 where
  (index, specialItems) = foldr f (mkIndex [] [] [] [] [] [] [], []) auxs
  f (AS sd) (idx, sds)  = (idx, sd : sds)
  f (AG g) (idx, sds)   = (idx { indexGirls = g : indexGirls idx }, sds)
  f (AT t) (idx, sds)   = (idx { indexTransformees = t : indexTransformees idx }, sds)
  f (ATG tg) (idx, sds) = (idx { indexTransformedGroups = tg : indexTransformedGroups idx }, sds)
  f (ATN t) (idx, sds)  = (idx { indexTransformations = t : indexTransformations idx }, sds)
  f (AP p) (idx, sds)   = (idx { indexPurifications = p : indexPurifications idx }, sds)
  f (ANP np) (idx, sds) = (idx { indexNonItemPurifications = np : indexNonItemPurifications idx }, sds)

  selectSpecialItems :: Index -> [SingletonData] -> [SpecialItem]
  selectSpecialItems Index {..} = mapMaybe $ \SingletonData {..} -> do
    guard $ all (\Girl {..} -> dataName /= girlId) indexGirls
    guard $ all (\Transformee {..} -> dataName /= transformedId) indexTransformees

    return $ SpecialItem
      dataName
      (filter (/= ' ') $ splitBeforeUpper dataName)
      "(error \"Specify specialItemNameJa\")"
      typeArgs

--------------------------------------------------- parsers

type Expression = String

data Aux =
    AS SingletonData
  | AG Girl
  | AT Transformee
  | ATG TransformedGroup
  | ATN Transformation
  | AP Purification
  | ANP NonItemPurification
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
  <|>  pPurification
  <|>  pNonItemPurification


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
  transformationTransformees <- pNames
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


pPurification :: A.Parser Aux
pPurification = do
  void $ A.string "purificationInstance"
  A.skipSpace

  beginQQ "t"
  purificationPurifiers <- pIdAttachmentss
  endQQ
  A.skipSpace

  beginQQ "t"
  purificationSpecialItems <- pIdAttachmentss
  endQQ
  A.skipSpace

  purificationSpeech <- (: []) <$> pName

  pure $ AP Purification {..}


pNonItemPurification :: A.Parser Aux
pNonItemPurification = do
  void $ A.string "nonItemPurificationInstance"
  A.skipSpace

  beginQQ "t"
  nonItemPurificationPurifiers <- pIdAttachmentss
  endQQ
  A.skipSpace

  nonItemPurificationSpeech <- (: []) <$> pName

  pure $ ANP NonItemPurification {..}


dropPrefix :: Expression -> Expression
dropPrefix = tail . dropWhile (/= '_')


pNameTuple :: A.Parser [String]
pNameTuple = pTupleOf pName


pNames :: A.Parser [String]
pNames = pNameTuple <|> ((: []) <$> pName)


pIdAttachmentss :: A.Parser [IdAttachments]
pIdAttachmentss = pTupleOf pIdAttachments <|> ((: []) <$> pIdAttachments)


-- NOTE: Incorrect precedence of IdAttachments:
--       Can't properly parse "RainbowCarriage LinkleStoneAlexandrite (Mofurun LinkleStoneAlexandrite)".
--       So fix the place after generating.
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
