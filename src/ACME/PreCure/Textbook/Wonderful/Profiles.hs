{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.Wonderful.Profiles where

-- import           Data.String              (IsString, fromString)

import           ACME.PreCure.Index.Types

girls :: [Girl]
girls =
  [ mkGirl "Komugi Inukai" "犬飼 こむぎ"
  , mkGirl "Iroha Inukai" "犬飼 いろは"
  , mkGirl "Yuki Nekoyashiki" "猫屋敷 ユキ"
  , mkGirl "Mayu Nekoyashiki" "猫屋敷 まゆ"
  ]

transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Wonderful"
      ""
      "キュアワンダフル"
      ""
      introducesHerselfAs_Wonderful
  , mkTransformee
      "Cure Friendy"
      ""
      "キュアフレンディ"
      ""
      introducesHerselfAs_Friendy
  , mkTransformee
      "Cure Nyammy"
      ""
      "キュアニャミー"
      ""
      introducesHerselfAs_Nyammy
  , mkTransformee
      "Cure Lillian"
      ""
      "キュアリリアン"
      ""
      introducesHerselfAs_Lillian
  ]

transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CureWonderful", "CureFriendy"] neW "" groupNameWonderful ""
  , mkTransformedGroup ["CureNyammy", "CureLillian"] neN "" groupNameNyanderful ""
  ]
 where
  neW = "Wonderful! Pretty Cure"
  neN = "Nyanderful! Pretty Cure"

specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Wonderful Pact" "ワンダフルパクト"
  , mkSpecialItem "Shiny Cats Pact" "シャイニーキャッツパクト"

  , mkSpecialItem "Friendly Tact" "フレンドリータクト"
  , mkSpecialItem "Amity Ribbon Tambourine" "アミティーリボンタンバリン"

  , mkSpecialItem "Kirarin Rabbit" "キラリンウサギ"
  , mkSpecialItem "Kirarin Penguin" "キラリンペンギン"
  , mkSpecialItem "Kirarin Lion" "キラリンライオン"
  , mkSpecialItem "Kirarin Bear" "キラリンベアー"
  , mkSpecialItem "Kirarin Fawn" "キラリンコジカ"
  , mkSpecialItem "Kirarin Hamster" "キラリンハムスター"
  , mkSpecialItem "Kirarin Fox" "キラリンキツネ"
  , mkSpecialItem "Kirarin Panda" "キラリンパンダ"
  ]

transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Komugi"]
      ["WonderfulPact"]
      ["CureWonderful"]
      [ wonderfulPact
      , preCureMyEvolution
      , threeTwoOne
      , introducesHerselfAs_Wonderful
      ]
  , mkTransformation
      ["Iroha"]
      ["WonderfulPact"]
      ["CureFriendy"]
      [ wonderfulPact
      , preCureMyEvolution
      , threeTwoOne
      , introducesHerselfAs_Friendy
      ]
  , mkTransformation
      ["Yuki"]
      ["ShinyCatsPact"]
      ["CureNyammy"]
      [ shinyCatsPact
      , preCureMyEvolution
      , hoppeNiKirameki
      , ripWaCuteNi
      , introducesHerselfAs_Nyammy
      ]
  , mkTransformation
      ["Mayu"]
      ["ShinyCatsPact"]
      ["CureLillian"]
      [ shinyCatsPact
      , preCureMyEvolution
      , memotoNiKirameki
      , ripWaCuteNi
      , introducesHerselfAs_Lillian
      ]

  , mkTransformation
      ["Komugi", "Iroha"]
      ["WonderfulPact", "WonderfulPact"]
      ["CureWonderful", "CureFriendy"]
      [ wonderfulPact
      , preCureMyEvolution
      , threeTwoOne
      , introducesHerselfAs_Wonderful
      , introducesHerselfAs_Friendy
      , "せーのっ！"
      , groupNameWonderful
      ]

  , mkTransformation
      ["Yuki", "Mayu"]
      ["ShinyCatsPact", "ShinyCatsPact"]
      ["CureLillian", "CureNyammy"]
      [ shinyCatsPact
      , preCureMyEvolution
      , memotoNiKirameki
      , ripWaCuteNi
      , introducesHerselfAs_Nyammy
      , introducesHerselfAs_Lillian
      , groupNameNyanderful
      ]
  ]
 where
  wonderfulPact :: String
  wonderfulPact = "ワンダフルパクト！"

  shinyCatsPact :: String
  shinyCatsPact = "シャイニーキャッツパクト！"

  preCureMyEvolution :: String
  preCureMyEvolution = "プリキュア！マイ・エボリューション！"

  threeTwoOne :: String
  threeTwoOne = "スリー！ツー！ワン！"

  memotoNiKirameki :: String
  memotoNiKirameki = "目元にきらめき！"

  hoppeNiKirameki :: String
  hoppeNiKirameki = "ほっぺにきらめき"

  ripWaCuteNi :: String
  ripWaCuteNi = "リップはキュートに！"


purifications :: [Purification]
purifications =
  [ mkPurification
      ["CureWonderful"]
      ["FriendlyTact", "KirarinPenguin"]
      [ friendlyTact
      , wanWanWonderful
      , helpKirarinAnimal
      , "ペンギン！"
      ]
  , mkPurification
      ["CureWonderful"]
      ["FriendlyTact", "KirarinLion"]
      [ friendlyTact
      , wanWanWonderful
      , helpKirarinAnimal
      , "ライオン！"
      ]
  , mkPurification
      ["CureWonderful"]
      ["FriendlyTact", "KirarinBear"]
      [ friendlyTact
      , wanWanWonderful
      , helpKirarinAnimal
      , "ベアー！"
      ]

  , mkPurification
      ["CureFriendy"]
      ["FriendlyTact", "KirarinRabbit"]
      [ friendlyTact
      , fureFureFriendy
      , helpKirarinAnimal
      , "ウサギ！"
      ]
  , mkPurification
      ["CureFriendy"]
      ["FriendlyTact", "KirarinPenguin"]
      [ friendlyTact
      , fureFureFriendy
      , helpKirarinAnimal
      , "ペンギン！"
      ]
  , mkPurification
      ["CureFriendy"]
      ["FriendlyTact", "KirarinLion"]
      [ friendlyTact
      , fureFureFriendy
      , helpKirarinAnimal
      , "ライオン！"
      ]
  , mkPurification
      ["CureFriendy"]
      ["FriendlyTact", "KirarinFawn"]
      [ friendlyTact
      , fureFureFriendy
      , helpKirarinAnimal
      , "コジカ！"
      ]

  , mkPurification
      ["CureNyammy"]
      ["AmityRibbonTambourine", "KirarinFox"]
      [ amityRibbonTambourine
      , nyanNyanNyammy
      , helpKirarinAnimal
      , "キツネ！"
      ]

  , mkPurification
      ["CureNyammy"]
      ["AmityRibbonTambourine", "KirarinPanda"]
      [ amityRibbonTambourine
      , nyanNyanNyammy
      , helpKirarinAnimal
      , "パンダ！"
      ]

  , mkPurification
      ["CureWonderful", "CureFriendy"]
      [ "FriendlyTact"
      , "FriendlyTact"
      ]
      [ friendlyTact
      , "ワンダフルをきみに！"
      , "ワン！ワン！わ～ん！"
      , "ガルガルなこころ、とんでけ～！"
      , "プリキュア！フレンドリベラーレ！"
      ]
  , mkPurification
      ["CureNyammy", "CureLillian"]
      [ "AmityRibbonTambourine"
      , "AmityRibbonTambourine"
      ]
      [ amityRibbonTambourine
      , "ニャンダフルをあなたに！"
      , "ニャン！ドゥ！トロワ！"
      , "ガルガルなこころ、さようなら！"
      , "プリキュア！アミティールミエール！"
      ]
  ]
 where
  friendlyTact :: String
  friendlyTact = "フレンドリータクト！"

  amityRibbonTambourine :: String
  amityRibbonTambourine = "アミティーリボンタンバリン！"

  helpKirarinAnimal :: String
  helpKirarinAnimal = "ヘルプ！キラリンアニマル！"

  fureFureFriendy :: String
  fureFureFriendy = "フレ！フレ！フレンディ！"

  wanWanWonderful :: String
  wanWanWonderful = "ワン！ワン！ワンダフル！"

  nyanNyanNyammy :: String
  nyanNyanNyammy = "ニャン ニャン ニャミー！"


introducesHerselfAs_Wonderful :: String
introducesHerselfAs_Wonderful = "みんな大好き素敵な世界！キュアワンダフル！一緒に遊ぼ♪"

introducesHerselfAs_Friendy :: String
introducesHerselfAs_Friendy = "みんなの笑顔で彩る世界！キュアフレンディ！あなたの声をきかせて。"

introducesHerselfAs_Nyammy :: String
introducesHerselfAs_Nyammy = "気高くかわいくきらめく世界！キュアニャミー！仕方ない、構ってあげる。"

introducesHerselfAs_Lillian :: String
introducesHerselfAs_Lillian = "結んで紡いでつながる世界！キュアリリアン！こわくない、こわくない。"

groupNameWonderful :: String
groupNameWonderful = "わんだふるぷりきゅあ！"

groupNameNyanderful :: String
groupNameNyanderful = "ニャンダフルプリキュア！"
