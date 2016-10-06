{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Profiles.MahoGirls
  ( Mirai(..)
  , Miracle(..)

  , Riko(..)
  , Magical(..)

  , Mofurun(..)
  , LinkleStoneDia(..)
  ) where


import           ACME.PreCure.Types
import qualified ACME.PreCure.Types.Transformed as T


data Mirai          = Mirai deriving (Eq, Show)

data Riko           = Riko deriving (Eq, Show)

instance Girl Mirai where
  humanName _ = "朝日奈みらい"


instance Girl Riko where
  humanName _ = "十六夜リコ"

data Miracle = Miracle deriving (Eq, Show)
data Magical = Magical deriving (Eq, Show)


instance T.Transformed Miracle where
  cureName _ = "キュアミラクル"
  transformtionSpeech _ = "ふたりの奇跡！キュアミラクル！"


instance T.Transformed Magical where
  cureName _ = "キュアマジカル"
  transformtionSpeech _ = "ふたりの魔法！キュアマジカル！"


instance Transformation (Mirai, Riko) (Mofurun LinkleStoneDia) where
  type Style (Mirai, Riko) (Mofurun LinkleStoneDia) = (Cure, Cure)
  transform _ _ = (Cure Miracle, Cure Magical)


data Mofurun linkleStone = Mofurun linkleStone deriving (Eq, Show)

data LinkleStoneDia = LinkleStoneDia deriving (Eq, Show)
