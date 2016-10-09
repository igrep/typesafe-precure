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
  , LinkleStoneForTransformation(..)
  ) where

import           Data.List
                   ( intercalate
                   )

import           ACME.PreCure.Types


data Mirai          = Mirai deriving (Eq, Show)

data Riko           = Riko deriving (Eq, Show)

instance Girl Mirai where
  humanName _ = "朝日奈みらい"


instance Girl Riko where
  humanName _ = "十六夜リコ"

data Miracle =
  Miracle | Miracle_Ruby | Miracle_Sapphire | Miracle_Topaz deriving (Eq, Show)


data Magical =
  Magical | Magical_Ruby | Magical_Sapphire | Magical_Topaz deriving (Eq, Show)


instance Transformed Miracle where
  cureName _ = "キュアミラクル"
  introducesHerselfAs _ = "ふたりの奇跡！キュアミラクル！"
  variation Miracle          = "ダイヤスタイル"
  variation Miracle_Ruby     = "ルビースタイル"
  variation Miracle_Sapphire = "サファイアスタイル"
  variation Miracle_Topaz    = "トパーズスタイル"


instance Transformed Magical where
  cureName _ = "キュアマジカル"
  introducesHerselfAs _ = "ふたりの魔法！キュアマジカル！"
  variation Magical          = "ダイヤスタイル"
  variation Magical_Ruby     = "ルビースタイル"
  variation Magical_Sapphire = "サファイアスタイル"
  variation Magical_Topaz    = "トパーズスタイル"


instance Transformation (Mirai, Riko) (Mofurun LinkleStoneForTransformation) where
  type Style (Mirai, Riko) (Mofurun LinkleStoneForTransformation) = (Miracle, Magical)
  transform _ (Mofurun LinkleStoneDia) = (Miracle, Magical)
  transform _ (Mofurun LinkleStoneRuby) = (Miracle_Ruby, Magical_Ruby)
  transform _ (Mofurun LinkleStoneSapphire) = (Miracle_Sapphire, Magical_Sapphire)
  transform _ (Mofurun LinkleStoneTopaz) = (Miracle_Topaz, Magical_Topaz)
  transformationSpeech _ (Mofurun ls) =
    intercalate "\n"
      [ "キュアップ・ラパパ！　" ++ linkleStoneName ls ++ "！"
      , "ミラクル・マジカル・ジュエリーレ！"
      , introducesHerselfAs Miracle
      , introducesHerselfAs Magical
      , "魔法つかいプリキュア！！"
      ]


class LinkleStone ls where
  linkleStoneName :: ls -> String


data LinkleStoneForTransformation =
  LinkleStoneDia | LinkleStoneRuby | LinkleStoneSapphire | LinkleStoneTopaz deriving (Show, Eq)


instance LinkleStone LinkleStoneForTransformation where
  linkleStoneName LinkleStoneDia      = "ダイヤ"
  linkleStoneName LinkleStoneRuby     = "ルビー"
  linkleStoneName LinkleStoneSapphire = "サファイア"
  linkleStoneName LinkleStoneTopaz    = "トパーズ"


data Mofurun linkleStone = Mofurun linkleStone deriving (Eq, Show)
