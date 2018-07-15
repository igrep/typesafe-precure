{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.Hugtto.Profiles where

import ACME.PreCure.Index.Types

girlsHugtto :: [Girl]
girlsHugtto =
  [ mkGirl "Hana Nono" "野乃 はな"
  , mkGirl "Saaya Yakushiji" "薬師寺 さあや"
  , mkGirl "Homare Kagayaki" "輝木 ほまれ"
  , mkGirl "Emiru Aisaki" "愛崎 えみる"
  , mkGirl "Ruru Amour" "ルールー・アムール"
  ]

transformeesHugtto :: [Transformee]
transformeesHugtto =
  [ mkTransformee
      "Cure Yell"
      ""
      "キュアエール"
      ""
      (concat introducesHerselfAs_CureYell)
  , mkTransformee
      "Cure Ange"
      ""
      "キュアアンジュ"
      ""
      (concat introducesHerselfAs_CureAnge)
  , mkTransformee
      "Cure Etoile"
      ""
      "キュアエトワール"
      ""
      (concat introducesHerselfAs_CureEtoile)
  , mkTransformee
      "Cure Macherie"
      ""
      "キュアマシェリ"
      ""
      (concat introducesHerselfAs_CureMacherie)
  , mkTransformee
      "Cure Amour"
      ""
      "キュアアムール"
      ""
      (concat introducesHerselfAs_CureAmour)
  ]

transformedGroupsHugtto :: [TransformedGroup]
transformedGroupsHugtto = [mkTransformedGroup ne "" nj ""]
  where
    ne = "Hugtto PreCure"
    nj = "HUGっと！プリキュア"

specialItemsHugtto :: [SpecialItem]
specialItemsHugtto =
  [ mkSpecialItem "Pre Heart" "プリハート" ["Mirai Crystal"]
  , mkSpecialItem "Mirai Crystal Pink" "ミライクリスタル・ピンク" []
  , mkSpecialItem "Mirai Crystal Blue" "ミライクリスタル・ブルー" []
  , mkSpecialItem "Mirai Crystal Yellow" "ミライクリスタル・イエロー" []

  , mkSpecialItem "Melody Sword" "メロディソード" ["Mirai Crystal"]
  , mkSpecialItem "Mirai Crystal Rose" "ミライクリスタル・ローズ" []
  , mkSpecialItem "Mirai Crystal Navy" "ミライクリスタル・ネイビー" []
  , mkSpecialItem "Mirai Crystal Orange" "ミライクリスタル・オレンジ" []
  , mkSpecialItem "Mirai Crystal White" "ミライクリスタル・ホワイト" []

  , mkSpecialItem "Twin Love Guitar" "ツインラブギター" ["Mirai Crystal"]
  , mkSpecialItem "Mirai Crystal Red" "ミライクリスタル・レッド" []
  , mkSpecialItem "Mirai Crystal Purple" "ミライクリスタル・パープル" []
  , mkSpecialItem "Mirai Crystal Rouge" "ミライクリスタル・ルージュ" []
  , mkSpecialItem "Mirai Crystal Violet" "ミライクリスタル・バイオレット" []
  ]

transformationsHugtto :: [Transformation]
transformationsHugtto =
  [ mkTransformation
      ["Hana"]
      [mkIA "PreHeart" ["MiraiCrystalPink"]]
      ["CureYell"]
      (miraiCrystalHeartKiratto ++
       hagyoogyoogyoooo ++ introducesHerselfAs_CureYell)
  , mkTransformation
      ["Saaya"]
      [mkIA "PreHeart" ["MiraiCrystalBlue"]]
      ["CureAnge"]
      (miraiCrystalHeartKiratto ++
       hagyoogyoogyoooo ++ introducesHerselfAs_CureAnge)
  , mkTransformation
      ["Homare"]
      [mkIA "PreHeart" ["MiraiCrystalYellow"]]
      ["CureEtoile"]
      (miraiCrystalHeartKiratto ++
       hagyoogyoogyoooo ++ introducesHerselfAs_CureEtoile)
  , mkTransformation
      ["Hana", "Saaya", "Homare"]
      [ mkIA "PreHeart" ["MiraiCrystalPink"]
      , mkIA "PreHeart" ["MiraiCrystalBlue"]
      , mkIA "PreHeart" ["MiraiCrystalYellow"]
      ]
      ["CureYell", "CureAnge", "CureEtoile"]
      (miraiCrystalHeartKiratto ++
       replicate 3 hagyoo ++
       introducesHerselfAs_CureYell ++
       [last introducesHerselfAs_CureAnge, last introducesHerselfAs_CureEtoile])
  , mkTransformation
      ["Emiru", "Ruru"]
      [ mkIA "PreHeart" ["MiraiCrystalRed"]
      , mkIA "PreHeart" ["MiraiCrystalPurple"]
      ]
      ["CureMacherie", "CureAmour"]
      ( miraiCrystal2HeartKiratto ++
        [hagyoo, gyoo, gyoo] ++
        introducesHerselfAs_CureMacherie_CureAmour
      )
  , mkTransformation -- https://www.youtube.com/watch?v=YPH8UGe4OvA
      ["Hana", "Saaya", "Homare", "Emiru", "Ruru"]
      [ mkIA "PreHeart" ["MiraiCrystalPink"]
      , mkIA "PreHeart" ["MiraiCrystalBlue"]
      , mkIA "PreHeart" ["MiraiCrystalYellow"]
      , mkIA "PreHeart" ["MiraiCrystalRed"]
      , mkIA "PreHeart" ["MiraiCrystalPurple"]
      ]
      ["CureYell", "CureAnge", "CureEtoile", "CureMacherie", "CureAmour"]
      (miraiCrystalHeartKiratto ++ miraiCrystal2HeartKiratto ++
       replicate 2 hagyoo ++
       replicate 3 gyoo ++
       introducesHerselfAs_CureYell ++
       [ last introducesHerselfAs_CureAnge
       , last introducesHerselfAs_CureEtoile
       , last introducesHerselfAs_CureMacherie_CureAmour
       , "HUGっと！プリキュア！"
       ])
  ]

purificationsHugtto :: [Purification]
purificationsHugtto =
  [ mkPurification
      ["CureYell"]
      [mkIA "PreHeart" ["MiraiCrystalPink"]]
      ["フレフレ！", "ハート・フォー・ユー！"]
  , mkPurification
      ["CureAnge"]
      [mkIA "PreHeart" ["MiraiCrystalBlue"]]
      ["フレフレ！", "ハート・フェザー！"]
  , mkPurification
      ["CureEtoile"]
      [mkIA "PreHeart" ["MiraiCrystalYellow"]]
      ["フレフレ！", "ハート・スター！"]
  , mkPurification
      ["CureEtoile"]
      [mkIA "MelodySword" ["MiraiCrystalOrange"]]
      ["スタースラッシュ！"]
  , mkPurification
      ["CureMacherie"]
      [mkIA "PreHeart" ["MiraiCrystalRed"]]
      ["Are you ready?", "フレフレ！ハート・ソング！"]
  , mkPurification
      ["CureAmour"]
      [mkIA "PreHeart" ["MiraiCrystalPurple"]]
      ["行きます！", "フレフレ！ハート・ダンス！"]
  -- TODO: Aliases for Yell Tact, Ange Harp, Etoile Flute, Macherie Bazooka, Amour Arrow
  -- https://www.youtube.com/watch?v=u3d_3aovyL8
  , mkPurification
      ["CureYell"]
      [mkIA "MelodySword" ["MiraiCrystalRose"]]
      ["フラワーシュート!"]
  , mkPurification
      ["CureAnge"]
      [mkIA "MelodySword" ["MiraiCrystalNavy"]]
      ["フェザーブラスト!"]
  , mkPurification
      ["CureMacherie"]
      [mkIA "TwinLoveGuitar" ["MiraiCrystalRouge"]]
      ["マシェリポップン!"]
  , mkPurification
      ["CureAmour"]
      [mkIA "TwinLoveGuitar" ["MiraiCrystalViolet"]]
      ["アムールロックンロール!"]
  , mkPurification
      ["CureYell", "CureAnge", "CureEtoile"]
      [ mkIA "MelodySword" ["MiraiCrystalRose"]
      , mkIA "MelodySword" ["MiraiCrystalNavy"]
      , mkIA "MelodySword" ["MiraiCrystalOrange"]
      ]
      [ "ミライクリスタル！"
      , "エールタクト！"
      , "アンジュハープ！"
      , "エトワールフルート！"
      , "心のトゲトゲ、飛んでいけ〜！"
      , "プリキュア・トリニティコンサート！"
      , "HUGっとプリキュア！エール・フォー・ユー！"
      ]
  , mkPurification
      ["CureMacherie", "CureAmour"]
      [ mkIA "TwinLoveGuitar" ["MiraiCrystalRouge"]
      , mkIA "TwinLoveGuitar" ["MiraiCrystalViolet"]
      ]
      [ "ツインラブギター！ミライクリスタル！"
      , "Are you ready?"
      , "行くのです！"
      , "届け！私たちの、愛の歌！"
      , "心のトゲトゲ！"
      , "ズッキュン打ち抜く！"
      , "ツインラブ・ロックビート！"
      , "愛してる！"
      , "Thank you!"
      ]
  ]

miraiCrystalHeartKiratto = ["ミライクリスタル！", "ハートキラっと！"]
miraiCrystal2HeartKiratto = head miraiCrystalHeartKiratto : miraiCrystalHeartKiratto

gyoo = "ぎゅ～！"

hagyoo = "は～ぎゅ～～！"

hagyoogyoogyoooo = [hagyoo, gyoo, "ぎゅ～～！"]

kagayakuMiraiWoDakishimete = "輝く未来をー、抱きしめて！"

introducesHerselfAs_CureYell =
  [kagayakuMiraiWoDakishimete, "みんなを応援！元気のプリキュア！キュアエール！"]

introducesHerselfAs_CureAnge =
  [kagayakuMiraiWoDakishimete, "みんなを癒す！知恵のプリキュア！キュアアンジュ！"]

introducesHerselfAs_CureEtoile =
  [kagayakuMiraiWoDakishimete, "みんな輝け！力のプリキュア！キュアエトワール！"]

introducesHerselfAs_CureMacherie =
  [kagayakuMiraiWoDakishimete, "みんな大好き！愛のプリキュア！キュアマシェリ！"]

introducesHerselfAs_CureAmour =
  [kagayakuMiraiWoDakishimete, "みんな大好き！愛のプリキュア！キュアアムール！"]

introducesHerselfAs_CureMacherie_CureAmour =
  [kagayakuMiraiWoDakishimete, "みんな大好き！愛のプリキュア！キュアマシェリ！キュアアムール！"]
