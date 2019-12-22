{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE ExplicitNamespaces    #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE PolyKinds             #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeFamilies          #-}
{-# LANGUAGE TypeOperators         #-}

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


import qualified ACME.PreCure.Index.Types             as Index
import           ACME.PreCure.Monad.Super
import qualified ACME.PreCure.Monad.Super             as Super
import           ACME.PreCure.Monad.Super.Core        (PSet, PSetResult, pSet)
import           ACME.PreCure.Types
import           ACME.PreCure.Types.TH.PreCureGirlMap (PreCureGirlMap)
import qualified ACME.PreCure.Types.TH.PreCureGirlMap as PreCureGirlMap

import           Control.Monad.Indexed.State          (imodify)
import           Control.Monad.Trans.Accum            (AccumT, add, evalAccumT,
                                                       look)
import           Control.Monad.Trans.Class            (lift)
import           Control.Monad.Trans.State.Strict     (StateT, modify',
                                                       runStateT)
import           Data.Char                            (toLower)
import           Data.Extensible                      (type (>:), Lookup,
                                                       happend, itemAssoc, nil,
                                                       (<:), (@=))
import           Data.Proxy                           (Proxy (Proxy))
import           Language.Haskell.TH                  (Dec, DecQ, DecsQ, ExpQ,
                                                       Name, Q,
                                                       Type (ConT, TupleT, VarT),
                                                       TypeQ, conE, conT, cxt,
                                                       isInstance, listE,
                                                       mkName, normalC, stringE,
                                                       tupE, varT)
import           Language.Haskell.TH.Compat.Data      (dataD')
import           Language.Haskell.TH.Compat.Strict    (isStrict)
import           Language.Haskell.TH.Lib              (StrictTypeQ, plainTV,
                                                       promotedNilT)
import           TH.Utilities                         (appsT, unAppsT)


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


declareTransformations :: [Index.Transformation] -> Q ([Dec], PreCureGirlMap)
declareTransformations itss = do
  (decsss, pcgm) <- evalAccumT (runStateT (mapM d itss) PreCureGirlMap.empty) []
  return (concat $ concat decsss, pcgm)
 where
  d :: Index.Transformation -> StateT PreCureGirlMap (AccumT [Type] Q) [[Dec]]
  d (Index.Transformation tas ias ds s) = do
    let tasType = tupleTFromIdAttachments tas
        iasType = tupleTFromIdAttachments ias
        psType = tupleT ds
    sequenceA
      [ lift . lift $ transformationInstance tasType iasType psType (tupleE ds) s
      , enterActionInstances tasType psType
      , lift . lift $ transformActionInstance tasType iasType
      ]


enterActionInstances :: Type -> Type -> StateT PreCureGirlMap (AccumT [Type] Q) [Dec]
enterActionInstances tasType psType = do
  mapM_ (\(p, t) -> modify' (PreCureGirlMap.put p t)) $ zip (extractTypesFromTuple psType) (extractTypesFromTuple tasType)
  (++)
    <$> lift (declareEnterActionInstance tasType tasType [t| HasTransformed 'False |] [e| HasNotTransformed |])
    <*> lift (declareEnterActionInstance psType tasType [t| HasTransformed 'True |] [e| HasTransformed |])


declareEnterActionInstance :: Type -> Type -> TypeQ -> ExpQ -> AccumT [Type] Q [Dec]
declareEnterActionInstance typeTarget typeKey typeBool valBool = do
  added <- isTypeAdded typeTarget
  defined <- lift $ isInstance ''EnterAction [typeTarget]
  let typeTargetQ = pure typeTarget
  if added || defined
    then return []
    else do
      addType typeTarget
      lift [d|
        instance EnterAction $(typeTargetQ) where
          type EnterActionResult $(typeTargetQ) = $(resultType)
          enter _ = PreCureM $ imodify ($(resultVal) `happend`)
        |]
 where
  typesInTuple = extractTypesFromTuple typeKey

  resultType = foldr consKVT promotedNilT typesInTuple
  consKVT typ lisQ = [t| ($(pure typ) >: $(typeBool)) ': $(lisQ) |]

  resultVal = foldr consKVV [e| nil |] typesInTuple
  consKVV typ lisV = [e| itemAssoc (Proxy :: Proxy $(pure typ)) @= $(valBool) <: $(lisV) |]

  isTypeAdded :: Type -> AccumT [Type] Q Bool
  isTypeAdded typ = elem typ <$> look

  addType :: Type -> AccumT [Type] Q ()
  addType = add . (: [])

  -- > runQ [t| (Bool, Int, Int) |]
  -- AppT (AppT (AppT (TupleT 3) (ConT GHC.Types.Bool)) (ConT GHC.Types.Int)) (ConT GHC.Types.Int)

  -- > runQ $ [t| Maybe Int |]
  -- AppT (ConT GHC.Maybe.Maybe) (ConT GHC.Types.Int)

  -- > runQ $ fmap unAppsT [t| Maybe Int |]
  -- [ConT GHC.Maybe.Maybe,ConT GHC.Types.Int]

  -- > runQ $ fmap unAppsT [t| Bool |]
  -- [ConT GHC.Types.Bool]

  -- > runQ $ fmap unAppsT [t| (Maybe Int, Int, Int) |]
  -- [TupleT 3,AppT (ConT GHC.Maybe.Maybe) (ConT GHC.Types.Int),ConT GHC.Types.Int,ConT GHC.Types.Int]

  -- > runQ $ fmap unAppsT [t| (Int, Char, Bool) |]
  -- [TupleT 3,ConT GHC.Types.Int,ConT GHC.Types.Char,ConT GHC.Types.Bool]


transformActionInstance :: Type -> Type -> DecsQ
transformActionInstance tasType iasType =
  [d|
    instance TransformAction $(tasTypeQ) $(iasTypeQ) xs where
      type TransformActionConstraint $(tasTypeQ) xs = $(constraint $ varT ''xs)
      type TransformActionResult $(tasTypeQ) xs = $(resultType $ varT ''xs)
      transform girlOrPreCure item =
        speak (transformationSpeech girlOrPreCure item)
          Super.>> PreCureM (imodify $(update))
    |]
 where
  tasTypeQ = pure tasType
  iasTypeQ = pure iasType

  constraint xsQ =
    appsTupleT
      . ([t| PSet $(tasTypeQ) (HasTransformed 'True) $(xsQ)|] :)
      . map (mkLookup xsQ)
      $ extractTypesFromTuple tasType
  mkLookup xsQ typ = [t| Lookup $(xsQ) $(pure typ) (HasTransformed 'False) |]

  resultType xsQ = [t| PSetResult $(tasTypeQ) (HasTransformed 'True) $(xsQ) |]

  update = [e| pSet (Proxy :: Proxy $(tasTypeQ)) HasTransformed |]


declarePurifications :: PreCureGirlMap -> [Index.Purification] -> DecsQ
declarePurifications pcgm = fmap concat . mapM d
 where
  d (Index.Purification pas ias s) = do
    let pasType = tupleTFromIdAttachments pas
        iasType = tupleTFromIdAttachments ias
    ps <- purificationInstance pasType iasType s
    pacts <- purifyActionInstance pcgm pasType iasType
    return $ ps ++ pacts


purifyActionInstance :: PreCureGirlMap -> Type -> Type -> DecsQ
purifyActionInstance pcgm pasType iasType = do
  let pasTypeQ = pure pasType
      iasTypeQ = pure iasType
  [d|
    instance PurifyAction $(pasTypeQ) $(iasTypeQ) xs where
      type PurifyActionConstraint $(pasTypeQ) xs = $(constraint $ varT ''xs)
      purify preCure item = speak (purificationSpeech preCure item)
    |]
 where
  constraint xsQ =
    appsTupleT
      . map (mkLookup xsQ)
      $ extractTypesFromTuple pasType
  mkLookup xsQ typ =
    [t| Lookup $(xsQ) $(pure $ PreCureGirlMap.get typ pcgm) (HasTransformed 'True) |]


declareNonItemPurifications :: PreCureGirlMap -> [Index.NonItemPurification] -> DecsQ
declareNonItemPurifications pcgm = fmap concat . mapM d
 where
  d (Index.NonItemPurification pas s) = do
    let pasType = tupleTFromIdAttachments pas
    ps <- nonItemPurificationInstance pasType s
    pacts <- nonItemPurifyActionInstance pcgm pasType
    return $ ps ++ pacts


nonItemPurifyActionInstance :: PreCureGirlMap -> Type -> Q [Dec]
nonItemPurifyActionInstance pcgm pasType = do
  let pasTypeQ = pure pasType
  [d|
    instance PurifyWithoutItemAction $(pasTypeQ) xs where
      type PurifyWithoutItemActionConstraint $(pasTypeQ) xs = $(constraint $ varT ''xs)
      purifyWithoutItem preCure = speak (nonItemPurificationSpeech preCure)
    |]
 where
  constraint xsQ =
    appsTupleT
      . map (mkLookup xsQ)
      $ extractTypesFromTuple pasType
  mkLookup xsQ typ =
    [t| Lookup $(xsQ) $(pure $ PreCureGirlMap.get typ pcgm) (HasTransformed 'True) |]


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


transformedGroupInstance :: Type -> String -> String -> DecsQ
transformedGroupInstance typ groupN vari =
  [d|
    instance TransformedGroup $(pure typ) where
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


transformationInstance :: Type -> Type -> Type -> ExpQ -> [String] -> DecsQ
transformationInstance g' i' p' pvalue' speech =
  [d|
    instance Transformation $(pure g') $(pure i') where
      type Style $(pure g') $(pure i') = $(pure p')
      transformedStyle _ _ = $(pvalue')
      transformationSpeech _ _ = $(listE $ map stringE speech)
  |]


purificationInstance :: Type -> Type -> [String] -> DecsQ
purificationInstance p' i' speech =
  [d|
    instance Purification $(pure p') $(pure i') where
      purificationSpeech _ _ = $(listE $ map stringE speech)
  |]


nonItemPurificationInstance :: Type -> [String] -> DecsQ
nonItemPurificationInstance p' speech =
  [d|
    instance NonItemPurification $(pure p') where
      nonItemPurificationSpeech _ = $(listE $ map stringE speech)
  |]


tupleTFromIdAttachments :: [Index.IdAttachments] -> Type
tupleTFromIdAttachments = tupleTBy toAppT
  where
    toAppT :: Index.IdAttachments -> Type
    toAppT (Index.IdAttachments i ias) = appsT (ConT $ mkName i) $ map toAppT ias


tupleT :: [String] -> Type
tupleT = tupleTBy (ConT . mkName)


tupleTBy :: (a -> Type) -> [a] -> Type
tupleTBy f ns = appsT (TupleT (length ns)) (map f ns)


tupleE :: [String] -> ExpQ
tupleE = tupE . map (conE . mkName)


firstLower :: String -> String
firstLower (x:xs) = toLower x : xs
firstLower _      = error "firstLower: Assertion failed: empty string"


extractTypesFromTuple :: Type -> [Type]
extractTypesFromTuple = dropWhile isTupleT . unAppsT
 where
  isTupleT (TupleT _) = True
  isTupleT _other     = False


appsTupleT :: [Q Type] -> Q Type
appsTupleT tqs = do
  ts <- sequenceA tqs
  return $ appsT (TupleT (length ts)) ts
