{-# LANGUAGE TemplateHaskell #-}

module ACME.PreCure.Types.TH
        ( declareGirls
        , declareTransformees
        , declareTransformedGroups
        , declareSpecialItems
        , declareTransformations
        , declarePurifications
        , declareNonItemPurifications

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
import           ACME.PreCure.Monad.Super.Core

import           Control.Monad.Trans.Accum
                   ( AccumT
                   , add
                   , evalAccumT
                   , look
                   )
import           Control.Monad.Trans.Class
                   ( lift
                   )
import           Data.Char
                   ( toLower
                   )
import           Language.Haskell.TH
                   ( Name
                   , Dec
                   , DecQ
                   , DecsQ
                   , ExpQ
                   , Q
                   , TypeQ
                   , Type(VarT, ConT, TupleT)
                   , conE
                   , conT
                   , cxt
                   , listE
                   , lookupTypeName
                   , mkName
                   , normalC
                   , isInstance
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
      transformedGroupInstance (tupleT ts) j vj


declareTransformees :: [Index.Transformee] -> DecsQ
declareTransformees = fmap concat . mapM d
  where
    d (Index.Transformee n _ne _ve j vj intro) = do
      let name = mkName n
      defineWith name $ transformedInstance (conT name) j intro vj


declareSpecialItems :: [Index.SpecialItem] -> DecsQ
declareSpecialItems = fmap concat . mapM d
  where
    d (Index.SpecialItem n _e _j as) = do
      let aNames = map (firstLower . concat . words) as
      defineWithTypeVars n aNames


declareTransformations :: [Index.Transformation] -> DecsQ
declareTransformations = fmap concat . (`evalAccumT` []) . mapM d
  where
    d (Index.Transformation tas ias ds s) = do
      tis <- lift $ transformationInstance
        (tupleTFromIdAttachments tas)
        (tupleTFromIdAttachments ias)
        (tupleT ds)
        (tupleE ds)
        s
      (tis ++) <$> declareIsTransformedOrNot (zip tas ds)

declareIsTransformedOrNot :: [(Index.IdAttachments, String)] -> AccumT [Type] Q [Dec]
declareIsTransformedOrNot = fmap concat . mapM (uncurry d)
  where
    d :: Index.IdAttachments -> String -> AccumT [Type] Q [Dec]
    d beforeTransformed afterTransformed = do
      typFalse <- lift typeqFalse
      defined1 <- lift $ isInstance ''IsTransformedOrNot [typFalse]
      added1 <- isTypeAdded typFalse
      ds1 <-
        if defined1 || added1
          then
            return []
          else do
            addType typFalse
            lift
              [d|
                type instance AsGirl $(typeqFalse) = $(typeqFalse)

                instance IsTransformedOrNot $(typeqFalse) where
                  type IsTransformed $(typeqFalse) = 'False
                  isTransformed _ = HasNotTransformed
              |]

      typTrue <- lift typeqTrue
      defined2 <- lift $ isInstance ''IsTransformedOrNot [typTrue]
      added2 <- isTypeAdded typTrue
      ds2 <-
        if defined2 || added2
          then
            return []
          else do
            addType typTrue
            lift
              [d|

                type instance AsGirl $(typeqTrue) = $(typeqFalse)

                instance IsTransformedOrNot $(typeqTrue) where
                  type IsTransformed $(typeqTrue) = 'True
                  isTransformed _ = HasTransformed
              |]
      return $ ds1 ++ ds2
      where
        getTypeFromStringName strName =
          maybe
            (error $ "Assertion Failure: " ++ show strName ++ " is not declared yet!")
            ConT
            <$> lookupTypeName strName
        typeqFalse = idAttachmentsToTypeQ beforeTransformed
        typeqTrue  = getTypeFromStringName afterTransformed

        idAttachmentsToTypeQ (Index.IdAttachments i ias) =
          appsT <$> getTypeFromStringName i <*> mapM idAttachmentsToTypeQ ias

        isTypeAdded :: Type -> AccumT [Type] Q Bool
        isTypeAdded typ = elem typ <$> look

        addType :: Type -> AccumT [Type] Q ()
        addType = add . (: [])


declarePurifications :: [Index.Purification] -> DecsQ
declarePurifications = fmap concat . mapM d
  where
    d (Index.Purification pas ias s) =
      purificationInstance
        (tupleTFromIdAttachments pas)
        (tupleTFromIdAttachments ias)
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


tupleT :: [String] -> TypeQ
tupleT ns = tupleTBy (ConT . mkName) ns


tupleTBy :: (a -> Type) -> [a] -> TypeQ
tupleTBy f ns = return $ appsT (TupleT (length ns)) (map f ns)


tupleE :: [String] -> ExpQ
tupleE = tupE . map (conE . mkName)


firstLower :: String -> String
firstLower (x:xs) = toLower x : xs
firstLower _ = error "firstLower: Assertion failed: empty string"
