{-# LANGUAGE TemplateHaskell #-}

module ACME.PreCure.Types.TH
        ( define

        , declareGirls
        , declareTransformees
        , declareSpecialItems
        , declareTransformations

        , girlInstance
        , transformedInstance
        , transformedInstanceDefault
        , transformedGroupInstance
        , transformedGroupInstanceDefault
        , transformationInstance

        , purificationInstance
        , nonItemPurificationInstance
        ) where


import           ACME.PreCure.Types
import qualified ACME.PreCure.Index.Types as Index

import           Data.Char
                   ( toLower
                   )
import           Language.Haskell.TH
                   ( Name
                   , DecQ
                   , DecsQ
                   , ExpQ
                   , TypeQ
                   , Type(VarT, ConT, TupleT)
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
                   , plainTV
                   )
import           Language.Haskell.TH.Compat.Data
                   ( dataD'
                   )
import           Language.Haskell.TH.Compat.Strict
                   ( isStrict
                   )
import           TH.Utilities
                   ( appsT
                   )


-- Add type argument names
singletonDataD :: Name -> [Name] -> DecQ
singletonDataD name tyVarNames =
  dataD' (cxt []) name (map plainTV tyVarNames) [normalC name $ map toTypeVar tyVarNames] [''Show, ''Eq]


define :: String -> DecsQ
define string = defineWithTypeVars string []


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


declareTransformees :: [Index.Transformee] -> DecsQ
declareTransformees = fmap concat . mapM d
  where
    d (Index.Transformee n _e j intro vari) = do
      let name = mkName n
      defineWith name $ transformedInstance (conT name) j intro vari


declareSpecialItems :: [Index.SpecialItem] -> DecsQ
declareSpecialItems = fmap concat . mapM d
  where
    d (Index.SpecialItem n _e _j as) = do
      let aNames = map (firstLower . concat . words) as
      defineWithTypeVars n aNames


declareTransformations :: [Index.Transformation] -> DecsQ
declareTransformations = fmap concat . mapM d
  where
    d (Index.Transformation tas ias ds s) = do
      transformationInstance
        (tupleTFromIdAttachments tas)
        (tupleTFromIdAttachments ias)
        (tupleT $ map mkName ds)
        (tupleE $ map mkName ds)
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


transformedInstanceDefault :: TypeQ -> String -> String -> DecsQ
transformedInstanceDefault typeq cureN intro =
  [d|
    instance Transformed $(typeq) where
      cureName _ = $(stringE cureN)
      introducesHerselfAs _ = $(stringE intro)
  |]


transformedGroupInstanceDefault :: TypeQ -> String -> DecsQ
transformedGroupInstanceDefault typeq groupN =
  [d|
    instance TransformedGroup $(typeq) where
      groupName _ = $(stringE groupN)
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
    toAppT :: Index.IdAttachments -> Type
    toAppT (Index.IdAttachments i ias) = appsT (ConT $ mkName i) $ map toAppT ias


tupleT :: [Name] -> TypeQ
tupleT ns = tupleTBy ConT ns


tupleTBy :: (a -> Type) -> [a] -> TypeQ
tupleTBy f ns = return $ appsT (TupleT (length ns)) (map f ns)


tupleE :: [Name] -> ExpQ
tupleE = tupE . map conE


firstLower :: String -> String
firstLower (x:xs) = toLower x : xs
firstLower _ = error "firstLower: Assertion failed: empty string"
