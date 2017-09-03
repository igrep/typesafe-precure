{-# LANGUAGE TemplateHaskell #-}

module ACME.PreCure.Types.TH
        ( define
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
        ) where


import           ACME.PreCure.Types
import qualified ACME.PreCure.Index.Types as Index

import           Language.Haskell.TH
                   ( Name
                   , DecQ
                   , DecsQ
                   , ExpQ
                   , TypeQ
                   , conT
                   , cxt
                   , listE
                   , mkName
                   , normalC
                   , stringE
                   )
import           Language.Haskell.TH.Compat.Data
                   ( dataD'
                   )


singletonDataD :: Name -> DecQ
singletonDataD name =
  dataD' (cxt []) name [] [normalC name []] [''Show, ''Eq]


define :: String -> DecsQ
define string = (:[]) <$> singletonDataD (mkName string)


defineWith :: Name -> DecsQ -> DecsQ
defineWith name decsq = (:) <$> singletonDataD name <*> decsq


-- | Declare data types with their Girl instances from the type names and girl names.
declareGirlsOf :: [Index.Girl] -> DecsQ
declareGirlsOf = fmap concat . mapM d
  where
    d (Index.Girl i n) = do
      let name = mkName $ head $ words i
      defineWith name $ girlInstance (conT name) n


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
