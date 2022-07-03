{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeOperators #-}

module ACME.PreCure.Types.TH
        ( declareGirls
        , declareTransformees
        , declareTransformedGroups
        , declareSpecialItems
        , declareTransformations
        , declarePurifications
        , declareNonItemPurifications
        ) where


import           ACME.PreCure.Types
import qualified ACME.PreCure.Index.Types as Index

import           Language.Haskell.TH
                   ( Name
                   , DecQ
                   , DecsQ
                   , ExpQ
                   , TypeQ
                   , Type(VarT)
                   , conE
                   , conT
                   , cxt
                   , listE
                   , mkName
                   , normalC
                   , stringE
                   , tupE
                   )
import           Language.Haskell.TH.Lib
                   ( StrictTypeQ
                   , appT
                   , plainTV
                   , tupleT
                   )
import           Language.Haskell.TH.Compat.Data
                   ( dataD'
                   )
import           Language.Haskell.TH.Compat.Strict
                   ( isStrict
                   )


-- Add type argument names
singletonDataD :: Name -> [Name] -> DecQ
singletonDataD name tyVarNames =
  dataD' (cxt []) name (map plainTV tyVarNames) [normalC name $ map toTypeVar tyVarNames] [''Show, ''Eq]


defineWithTypeVars :: String -> [String] -> DecsQ
defineWithTypeVars string strings =
  (: []) <$> singletonDataD (mkName string) (map mkName strings)


toTypeVar :: Name -> StrictTypeQ
toTypeVar name = return (isStrict, VarT name)


defineWith :: Name -> DecsQ -> DecsQ
defineWith name decsq = (:) <$> singletonDataD name [] <*> decsq


-- | Declare data types with their Girl instances from the type names and girl names.
declareGirls :: [Index.Girl] -> DecsQ
declareGirls = fmap concat . mapM d
  where
    d (Index.Girl n _e j) = do
      let name = mkName n
      defineWith name $ girlInstance (conT name) j


declareTransformedGroups :: [Index.TransformedGroup] -> DecsQ
declareTransformedGroups = fmap concat . mapM d
  where
    d (Index.TransformedGroup ts _e _ve j vj) =
      transformedGroupInstance (tupleTFromList ts) j vj


declareTransformees :: [Index.Transformee] -> DecsQ
declareTransformees = fmap concat . mapM d
  where
    d (Index.Transformee n _ne _ve j vj intro) = do
      let name = mkName n
      defineWith name $ transformedInstance (conT name) j intro vj


declareSpecialItems :: [Index.SpecialItem] -> DecsQ
declareSpecialItems = fmap concat . mapM d
  where
    d (Index.SpecialItem n _e _j) = defineWithTypeVars n []


declareTransformations :: [Index.Transformation] -> DecsQ
declareTransformations = fmap concat . mapM d
  where
    d (Index.Transformation tas ias ds s) =
      transformationInstance
        (plusTFromIdAttachments tas)
        (plusTFromIdAttachments ias)
        (tupleTFromList ds)
        (tupleE ds)
        s


declarePurifications :: [Index.Purification] -> DecsQ
declarePurifications = fmap concat . mapM d
  where
    d (Index.Purification pas ias s) =
      purificationInstance
        (plusTFromIdAttachments pas)
        (plusTFromIdAttachments ias)
        s


declareNonItemPurifications :: [Index.NonItemPurification] -> DecsQ
declareNonItemPurifications = fmap concat . mapM d
  where
    d (Index.NonItemPurification pas s) =
      nonItemPurificationInstance
        (tupleTFromIdAttachments pas)
        s


girlInstance :: TypeQ -> String -> DecsQ
girlInstance typeq humanN =
  [d|
    instance Girl $(typeq) where
      humanName _ = $(stringE humanN)
  |]


transformedInstance :: TypeQ -> String -> String -> String -> DecsQ
transformedInstance typeq cureN intro vari =
  [d|
    instance Transformed $(typeq) where
      cureName _ = $(stringE cureN)
      introducesHerselfAs _ = $(stringE intro)
      variation _ = $(stringE vari)
  |]


transformedGroupInstance :: TypeQ -> String -> String -> DecsQ
transformedGroupInstance typeq groupN vari =
  [d|
    instance TransformedGroup $(typeq) where
      groupName _ = $(stringE groupN)
      groupVariation _ = $(stringE vari)
  |]


transformationInstance :: TypeQ -> TypeQ -> TypeQ -> ExpQ -> [String] -> DecsQ
transformationInstance g' i' p' pvalue' speech =
  [d|
    instance Transformation $(g') $(i') where
      type Style $(g') $(i') = $(p')
      transformedStyle _ _ = $(pvalue')
      transformationSpeech _ _ = $(listE $ map stringE speech)
  |]


purificationInstance :: TypeQ -> TypeQ -> [String] -> DecsQ
purificationInstance p' i' speech =
  [d|
    instance Purification $(p') $(i') where
      purificationSpeech _ _ = $(listE $ map stringE speech)
  |]


nonItemPurificationInstance :: TypeQ -> [String] -> DecsQ
nonItemPurificationInstance p' speech =
  [d|
    instance NonItemPurification $(p') where
      nonItemPurificationSpeech _ = $(listE $ map stringE speech)
  |]


tupleTFromIdAttachments :: [Index.IdAttachments] -> TypeQ
tupleTFromIdAttachments = tupleTBy toAppT
  where
    toAppT :: Index.IdAttachments -> TypeQ
    toAppT (Index.IdAttachments i ias) = foldl appT (conT $ mkName i) $ map toAppT ias


plusTFromIdAttachments :: [Index.IdAttachments] -> TypeQ
plusTFromIdAttachments = tupleTBy toPlusT
  where
    toPlusT :: Index.IdAttachments -> TypeQ
    toPlusT (Index.IdAttachments i ias) =
      if null ias
        then conT (mkName i)
        else [t| $(conT (mkName i)) :+: $(tupleTBy toPlusT ias) |]


tupleTFromList :: [String] -> TypeQ
tupleTFromList = tupleTBy (conT . mkName)


tupleTBy :: (a -> TypeQ) -> [a] -> TypeQ
-- Avoid generating `Unit`. See https://gitlab.haskell.org/ghc/ghc/-/issues/18622 for details.
tupleTBy f [n] = f n
tupleTBy f ns = foldl appT (tupleT (length ns)) (map f ns)


tupleE :: [String] -> ExpQ
tupleE [name] = conE $ mkName name
tupleE names  = tupE $ map (conE . mkName) names
