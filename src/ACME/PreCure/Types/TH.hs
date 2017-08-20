{-# LANGUAGE TemplateHaskell #-}

module ACME.PreCure.Types.TH
        ( define
        , defineGirl
        , defineTransformed
        , defineTransformedDefault

        , declareGirlsOf

        , girlInstance
        , transformedInstance
        , transformedInstanceDefault
        , transformedGroupInstance
        , transformedGroupInstanceDefault
        , transformationInstance

        , purificationInstance
        , nonItemPurificationInstance

        -- * Re-export of TH functions which should be used with the other functions in this module
        , thisModule
        ) where


import           ACME.PreCure.Types

import           Language.Haskell.TH
                   ( Name
                   , Dec(SigD)
                   , DecQ
                   , DecsQ
                   , ExpQ
                   , TypeQ
                   , conT
                   , cxt
                   , listE
                   , mkName
                   , normalB
                   , normalC
                   , stringE
                   , thisModule
                   , valD
                   , varP
                   )
import           Language.Haskell.TH.Compat.Data
                   ( dataD'
                   )
import           Language.Haskell.TH.Syntax
                   ( ModName(..)
                   , Module(..)
                   )

import           Language.Haskell.TH.Lift
                   ( lift
                   )
import           Instances.TH.Lift ()

import           Data.Char
                   ( toLower
                   )
import           Data.List.Split
                   ( splitOn
                   )
import           Data.Map
                   ( Map
                   )
import qualified Data.Map as Map


singletonDataD :: Name -> DecQ
singletonDataD name =
  dataD' (cxt []) name [] [normalC name []] [''Show, ''Eq]


define :: String -> DecsQ
define string = (:[]) <$> singletonDataD (mkName string)


defineWith :: Name -> DecsQ -> DecsQ
defineWith name decsq = (:) <$> singletonDataD name <*> decsq


defineGirl :: String -> String -> DecsQ
defineGirl string humanN = do
  let name = mkName string
  defineWith name $ girlInstance (conT name) humanN


-- | Declare data types with their Girl instances from the type names and
-- girl names,
-- Then save the given girl names in the toplevel variable named as
-- "<shortModuleName>_girlNames" to reuse in CureIndex.
declareGirlsOf
  :: [(String, String)] -- ^ Pairs of the Girl data type name and its humanName
  -> Module -- ^ Target module. This should always given from thisModule
  -> DecsQ
declareGirlsOf typeNameAndGirlNames (Module _pkgName (ModName name)) = do
  let varName = mkName $ toVarName name ++ "_girlNames"
  memoSigD <- SigD varName <$> [t| Map String String |]
  memoD <-
    valD
      (varP varName)
      (normalB [| $(lift $ Map.fromList typeNameAndGirlNames) |])
      []
  dataAndInstanceD <- concat <$> mapM (uncurry defineGirl) typeNameAndGirlNames
  return $ memoSigD : memoD : dataAndInstanceD


defineTransformed :: String -> String -> String -> String -> DecsQ
defineTransformed string cureN intro vari = do
  let name = mkName string
  defineWith name $ transformedInstance (conT name) cureN intro vari


defineTransformedDefault :: String -> String -> String -> DecsQ
defineTransformedDefault string cureN intro = defineTransformed string cureN intro ""


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


toVarName :: String -> String
toVarName modFullName =
  case removeCommonModuleNameParts modFullName of
      (hd : tl) -> toLower hd : tl
      [] -> error "toVarName: Assertion failed: empty variable name."


removeCommonModuleNameParts :: String -> String
removeCommonModuleNameParts modFullName =
  let filteredParts =
        filter (not . (`elem` commonModuleNameParts)) $ splitOn "." modFullName
      commonModuleNameParts =
        ["ACME", "PreCure", "Textbook", "Types", "Words", "Instances"]
  in
    case filteredParts of
        [n] -> n
        other ->
          error
            $ "removeCommonModuleNameParts: Assertion failed: the filteredParts must have only one element. But actually:"
              ++ show other
