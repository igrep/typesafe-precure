{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Profiles.MahoGirls
  ( Mirai(..)
  , Miracle(..)

  , Riko(..)
  , Magical(..)

  , Mofurun(..)

  , LinkleStone(..)
  , LinkleStoneDia(..)
  , LinkleStoneRuby(..)
  , LinkleStoneSapphire(..)
  , LinkleStoneTopaz(..)

  , LinkleStick(..)
  ) where

import           Data.List
                   ( intercalate
                   )

import           ACME.PreCure.Types


data Mirai = Mirai deriving (Eq, Show)

data Riko  = Riko deriving (Eq, Show)


instance Girl Mirai where
  humanName _ = "朝日奈みらい"


instance Girl Riko where
  humanName _ = "十六夜リコ"


data Miracle          = Miracle deriving (Eq, Show)
data Miracle_Ruby     = Miracle_Ruby deriving (Eq, Show)
data Miracle_Sapphire = Miracle_Sapphire deriving (Eq, Show)
data Miracle_Topaz    = Miracle_Topaz deriving (Eq, Show)

data Magical          = Magical deriving (Eq, Show)
data Magical_Ruby     = Magical_Ruby deriving (Eq, Show)
data Magical_Sapphire = Magical_Sapphire deriving (Eq, Show)
data Magical_Topaz    = Magical_Topaz deriving (Eq, Show)

data Mofurun ls = Mofurun ls deriving (Eq, Show)


instance Transformed Miracle where
  cureName _ = "キュアミラクル"
  introducesHerselfAs _ = "ふたりの奇跡！キュアミラクル！"
  variation _ = "ダイヤスタイル"


instance Transformed Miracle_Ruby where
  cureName _ = cureName Miracle
  introducesHerselfAs _ = introducesHerselfAs Miracle
  variation _ = "ルビースタイル"


instance Transformed Miracle_Sapphire where
  cureName _ = cureName Miracle
  introducesHerselfAs _ = introducesHerselfAs Miracle
  variation _ = "サファイアスタイル"


instance Transformed Miracle_Topaz where
  cureName _ = cureName Miracle
  introducesHerselfAs _ = introducesHerselfAs Miracle
  variation _ = "トパーズスタイル"


instance Transformed Magical where
  cureName _ = "キュアマジカル"
  introducesHerselfAs _ = "ふたりの魔法！キュアマジカル！"
  variation _ = "ダイヤスタイル"


instance Transformed Magical_Ruby where
  cureName _ = cureName Magical
  introducesHerselfAs _ = introducesHerselfAs Magical
  variation _ = "ルビースタイル"


instance Transformed Magical_Sapphire where
  cureName _ = cureName Magical
  introducesHerselfAs _ = introducesHerselfAs Magical
  variation _ = "サファイアスタイル"


instance Transformed Magical_Topaz where
  cureName _ = cureName Magical
  introducesHerselfAs _ = introducesHerselfAs Magical
  variation _ = "トパーズスタイル"


instance Transformation (Mirai, Riko) (Mofurun LinkleStoneDia) where
  type Style (Mirai, Riko) (Mofurun LinkleStoneDia) = (Miracle, Magical)
  transform _ _ = (Miracle, Magical)
  transformationSpeech _ _ =
    transformationSpeechWith $ linkleStoneName LinkleStoneDia

instance Transformation (Mirai, Riko) (Mofurun LinkleStoneRuby) where
  type Style (Mirai, Riko) (Mofurun LinkleStoneRuby) = (Miracle_Ruby, Magical_Ruby)
  transform _ _ = (Miracle_Ruby, Magical_Ruby)
  transformationSpeech _ _ =
    transformationSpeechWith $ linkleStoneName LinkleStoneRuby

instance Transformation (Mirai, Riko) (Mofurun LinkleStoneSapphire) where
  type Style (Mirai, Riko) (Mofurun LinkleStoneSapphire) = (Miracle_Sapphire, Magical_Sapphire)
  transform _ _ = (Miracle_Sapphire, Magical_Sapphire)
  transformationSpeech _ _ =
    transformationSpeechWith $ linkleStoneName LinkleStoneSapphire

instance Transformation (Mirai, Riko) (Mofurun LinkleStoneTopaz) where
  type Style (Mirai, Riko) (Mofurun LinkleStoneTopaz) = (Miracle_Topaz, Magical_Topaz)
  transform _ _ = (Miracle_Topaz, Magical_Topaz)
  transformationSpeech _ _ =
    transformationSpeechWith $ linkleStoneName LinkleStoneTopaz


class LinkleStone ls where
  linkleStoneName :: ls -> String


data LinkleStoneDia      = LinkleStoneDia deriving (Show, Eq)
data LinkleStoneRuby     = LinkleStoneRuby deriving (Show, Eq)
data LinkleStoneSapphire = LinkleStoneSapphire deriving (Show, Eq)
data LinkleStoneTopaz    = LinkleStoneTopaz deriving (Show, Eq)


instance LinkleStone LinkleStoneDia where
  linkleStoneName _ = "ダイヤ"

instance LinkleStone LinkleStoneRuby where
  linkleStoneName _ = "ルビー"

instance LinkleStone LinkleStoneSapphire where
  linkleStoneName _ = "サファイヤ"

instance LinkleStone LinkleStoneTopaz where
  linkleStoneName _ = "トパーズ"


transformationSpeechWith :: String -> String
transformationSpeechWith lsn =
  intercalate "\n"
    [ "キュアップ・ラパパ！　" ++ lsn ++ "！"
    , "ミラクル・マジカル・ジュエリーレ！"
    , introducesHerselfAs Miracle
    , introducesHerselfAs Magical
    , "魔法つかいプリキュア！！"
    ]


data LinkleStick ls = LinkleStick ls deriving (Eq, Show)


-- https://www.youtube.com/watch?v=QBQfnFOyRS4
instance Purification (Miracle, Magical) (Mofurun LinkleStoneDia, LinkleStick LinkleStoneDia) where
  purificationSpeech _ _ =
    intercalate "\n"
      [ "ダイヤ！永遠の輝きを私達の手に！"
      , "フルフルリンクル！"
      , "プリキュア・ダイヤモンド・エターナル！"
      ]

-- https://www.youtube.com/watch?v=sM7VC9-hCU8
instance Purification (Miracle_Ruby, Magical_Ruby) (Mofurun LinkleStoneRuby, LinkleStick LinkleStoneRuby) where
  purificationSpeech _ _ =
    intercalate "\n"
        [ "リンクルステッキ！"
      , "(モッフー！)"
        , "ルビー！紅の情熱よ私達の手に！"
        , "フルフルリンクル！"
        , "プリキュア・ルビー・パッショナーレ！"
        ]

-- https://www.youtube.com/watch?v=lNUa2Sfa894
instance Purification (Miracle_Sapphire, Magical_Sapphire) (Mofurun LinkleStoneSapphire, LinkleStick LinkleStoneSapphire) where
  purificationSpeech _ _ =
    intercalate "\n"
      [ "リンクルステッキ！"
      , "(モッフー！)"
      , "サファイア！青き知性よ私達の手に！"
      , "フルフルリンクル！"
      , "プリキュア・サファイア・スマーティッシュ！"
      ]

-- https://www.youtube.com/watch?v=uu7V5Fxw8NQ
instance Purification (Miracle_Topaz, Magical_Topaz) (Mofurun LinkleStoneTopaz, LinkleStick LinkleStoneTopaz) where
  purificationSpeech _ _ =
    intercalate "\n"
      [ "リンクルステッキ！"
      , "(モォッフー！モッフッ！)"
      , "トパーズ！金色の希望よ私達の手に！"
      , "フルフルリンクル！"
      , "プリキュア・トパーズ・エスペランサ！"
      ]
