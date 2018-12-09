module ACME.PreCure.Index
  ( Girl
    ( girlId
    , girlNameEn
    , girlNameJa
    )
  , Transformee
    ( transformedId
    , transformedNameEn
    , transformedVariationEn
    , transformedNameJa
    , transformedVariationJa
    , transformedIntroducesHerselfAs
    )
  , TransformedGroup
    ( transformedGroupTransformerIds
    , transformedGroupNameEn
    , transformedGroupVariationEn
    , transformedGroupNameJa
    , transformedGroupVariationJa
    )
  , SpecialItem
    ( specialItemId
    , specialItemNameEn
    , specialItemNameJa
    , specialItemAttachments
    )
  , IdAttachments
    ( idAttachementsI
    , idAttachementsA
    )
  , Transformation
    ( transformationTransformers
    , transformationSpecialItems
    , transformationTransformees
    , transformationSpeech
    )
  , Purification
    ( purificationPurifiers
    , purificationSpecialItems
    , purificationSpeech
    )
  , NonItemPurification
    ( nonItemPurificationPurifiers
    , nonItemPurificationSpeech
    )
  , Index
    ( indexGirls
    , indexTransformees
    , indexTransformedGroups
    , indexSpecialItems
    , indexTransformations
    , indexPurifications
    , indexNonItemPurifications
    )
  ) where

import           ACME.PreCure.Index.Types
