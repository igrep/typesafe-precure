{-# LANGUAGE TemplateHaskell #-}

module ACME.PreCure.Types.TH where


import           ACME.PreCure.Types

import           Language.Haskell.TH.Lib
                   ( DecsQ
                   , ExpQ
                   , TypeQ
                   , stringE
                   )


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


transformationInstance :: TypeQ -> TypeQ -> TypeQ -> ExpQ -> String -> DecsQ
transformationInstance g' i' p' pvalue' speech =
  [d|
    instance Transformation $(g') $(i') where
      type Style $(g') $(i') = $(p')
      transform _ _ = $(pvalue')
      transformationSpeech _ _ = $(stringE speech)
  |]


purificationInstance :: TypeQ -> TypeQ -> String -> DecsQ
purificationInstance p' i' speech =
  [d|
    instance Purification $(p') $(i') where
      purificationSpeech _ _ = $(stringE speech)
  |]


nonItemPurificationInstance :: TypeQ -> String -> DecsQ
nonItemPurificationInstance p' speech =
  [d|
    instance NonItemPurification $(p') where
      nonItemPurificationSpeech _ = $(stringE speech)
  |]
