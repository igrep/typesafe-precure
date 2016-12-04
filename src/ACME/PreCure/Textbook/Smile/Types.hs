{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeFamilies #-}

module ACME.PreCure.Textbook.Smile.Types where


import           ACME.PreCure.Textbook.Smile.Words
import           ACME.PreCure.Types.TH


data Miyuki = Miyuki deriving (Eq, Show)
data Akane  = Akane deriving (Eq, Show)
data Yayoi  = Yayoi deriving (Eq, Show)
data Nao    = Nao deriving (Eq, Show)
data Reika  = Reika deriving (Eq, Show)

girlInstance [t| Miyuki |] girlName_Miyuki
girlInstance [t| Akane |] girlName_Akane
girlInstance [t| Yayoi |] girlName_Yayoi
girlInstance [t| Nao |] girlName_Nao
girlInstance [t| Reika |] girlName_Reika

data CureHappy  = CureHappy deriving (Eq, Show)
data CureSunny  = CureSunny deriving (Eq, Show)
data CurePeace  = CurePeace deriving (Eq, Show)
data CureMarch  = CureMarch deriving (Eq, Show)
data CureBeauty = CureBeauty deriving (Eq, Show)

data PrincessHappy  = PrincessHappy deriving (Eq, Show)
data PrincessSunny  = PrincessSunny deriving (Eq, Show)
data PrincessPeace  = PrincessPeace deriving (Eq, Show)
data PrincessMarch  = PrincessMarch deriving (Eq, Show)
data PrincessBeauty = PrincessBeauty deriving (Eq, Show)

data SmilePact cd = SmilePact cd deriving (Eq, Show)
-- TODO: Make distinct decors for each PreCure or purification?
data CureDecors = CureDecors deriving (Eq, Show)

data PrincessCandle cd = PrincessCandle cd deriving (Eq, Show)

data RoyalClock cd = RoyalClock cd deriving (Eq, Show)

transformedInstanceDefault [t| CureHappy |] cureName_Happy introducesHerselfAs_Happy
transformedInstanceDefault [t| CureSunny |] cureName_Sunny introducesHerselfAs_Sunny
transformedInstanceDefault [t| CurePeace |] cureName_Peace introducesHerselfAs_Peace
transformedInstanceDefault [t| CureMarch |] cureName_March introducesHerselfAs_March
transformedInstanceDefault [t| CureBeauty |] cureName_Beauty introducesHerselfAs_Beauty

transformedInstance [t| PrincessHappy |] cureName_Happy introducesHerselfAs_Happy_Princess variation_Happy_Princess
transformedInstance [t| PrincessSunny |] cureName_Sunny introducesHerselfAs_Sunny_Princess variation_Sunny_Princess
transformedInstance [t| PrincessPeace |] cureName_Peace introducesHerselfAs_Peace_Princess variation_Peace_Princess
transformedInstance [t| PrincessMarch |] cureName_March introducesHerselfAs_March_Princess variation_March_Princess
transformedInstance [t| PrincessBeauty |] cureName_Beauty introducesHerselfAs_Beauty_Princess variation_Beauty_Princess

transformedGroupInstanceDefault
  [t| (CureHappy, CureSunny, CurePeace, CureMarch, CureBeauty) |]
  groupName_Smile

transformedGroupInstance
  [t| (PrincessHappy, PrincessSunny, PrincessPeace, PrincessMarch, PrincessBeauty) |]
  groupName_Smile
  variation_Smile_Princess

transformationInstance [t| Miyuki |] [t| SmilePact CureDecors |] [t| CureHappy |] [| CureHappy |] transformationSpeech_Happy
transformationInstance [t| Akane |] [t| SmilePact CureDecors |] [t| CureSunny |] [| CureSunny |] transformationSpeech_Sunny
transformationInstance [t| Yayoi |] [t| SmilePact CureDecors |] [t| CurePeace |] [| CurePeace |] transformationSpeech_Peace
transformationInstance [t| Nao |] [t| SmilePact CureDecors |] [t| CureMarch |] [| CureMarch |] transformationSpeech_March
transformationInstance [t| Reika |] [t| SmilePact CureDecors |] [t| CureBeauty |] [| CureBeauty |] transformationSpeech_Beauty

transformationInstance
  [t| (Miyuki, Akane, Yayoi, Nao, Reika) |]
  [t| SmilePact CureDecors |]
  [t| (CureHappy, CureSunny, CurePeace, CureMarch, CureBeauty) |]
  [| (CureHappy, CureSunny, CurePeace, CureMarch, CureBeauty) |]
  transformationSpeech_Smile

transformationInstance
  [t| (CureHappy, CureSunny, CurePeace, CureMarch, CureBeauty) |]
  [t| PrincessCandle CureDecors |]
  [t| (PrincessHappy, PrincessSunny, PrincessPeace, PrincessMarch, PrincessBeauty) |]
  [| (PrincessHappy, PrincessSunny, PrincessPeace, PrincessMarch, PrincessBeauty) |]
  transformationSpeech_Smile_Princess

purificationInstance [t| CureHappy |] [t| SmilePact CureDecors |] purificationSpeech_Happy
purificationInstance [t| CureSunny |] [t| SmilePact CureDecors |] purificationSpeech_Sunny
purificationInstance [t| CurePeace |] [t| SmilePact CureDecors |] purificationSpeech_Peace
purificationInstance [t| CureMarch |] [t| SmilePact CureDecors |] purificationSpeech_March
purificationInstance [t| CureBeauty |] [t| SmilePact CureDecors |] purificationSpeech_Beauty

purificationInstance
  [t| (PrincessHappy, PrincessSunny, PrincessPeace, PrincessMarch, PrincessBeauty) |]
  [t| RoyalClock CureDecors |]
  purificationSpeech_Smile
