{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.Hugtto.Profiles where

import           Data.String              (IsString)

import           ACME.PreCure.Index.Types

girlsHugtto :: [Girl]
girlsHugtto =
  [ mkGirl "Hana Nono" "野乃 はな"
  , mkGirl "Saaya Yakushiji" "薬師寺 さあや"
  , mkGirl "Homare Kagayaki" "輝木 ほまれ"
  , mkGirl "Emiru Aisaki" "愛崎 えみる"
  , mkGirl "Ruru Amour" "ルールー・アムール"
  , mkGirl "Hugtan" "はぐたん"
  , mkGirl "Anri Wakamiya" "若宮アンリ"
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

  , mkTransformee
      "Cure Infini"
      ""
      "キュアアンフィニ"
      ""
      (concat introducesHerselfAs_CureInfini)

  , mkTransformee
      "Cure Yell"
      cheerfulStyleEn
      "キュアエール"
      cheerfulStyle
      (concat introducesHerselfAs_CureYell)
  , mkTransformee
      "Cure Ange"
      cheerfulStyleEn
      "キュアアンジュ"
      cheerfulStyle
      (concat introducesHerselfAs_CureAnge)
  , mkTransformee
      "Cure Etoile"
      cheerfulStyleEn
      "キュアエトワール"
      cheerfulStyle
      (concat introducesHerselfAs_CureEtoile)
  , mkTransformee
      "Cure Macherie"
      cheerfulStyleEn
      "キュアマシェリ"
      cheerfulStyle
      (concat introducesHerselfAs_CureMacherie)
  , mkTransformee
      "Cure Amour"
      cheerfulStyleEn
      "キュアアムール"
      cheerfulStyle
      (concat introducesHerselfAs_CureAmour)

  , mkTransformee
      "Hugtan"
      cheerfulStyleEn
      "はぐたん"
      cheerfulStyle
      ""

  , mkTransformee
      "Cure Yell"
      motherHeartStyleEn
      "キュアエール"
      motherHeartStyle
      (concat introducesHerselfAs_CureYell)
  , mkTransformee
      "Cure Ange"
      motherHeartStyleEn
      "キュアアンジュ"
      motherHeartStyle
      (concat introducesHerselfAs_CureAnge)
  , mkTransformee
      "Cure Etoile"
      motherHeartStyleEn
      "キュアエトワール"
      motherHeartStyle
      (concat introducesHerselfAs_CureEtoile)
  , mkTransformee
      "Cure Macherie"
      motherHeartStyleEn
      "キュアマシェリ"
      motherHeartStyle
      (concat introducesHerselfAs_CureMacherie)
  , mkTransformee
      "Cure Amour"
      motherHeartStyleEn
      "キュアアムール"
      motherHeartStyle
      (concat introducesHerselfAs_CureAmour)

  , mkTransformee
      "Hugtan"
      motherHeartStyleEn
      "はぐたん"
      motherHeartStyle
      ""
  ]

transformedGroupsHugtto :: [TransformedGroup]
transformedGroupsHugtto = [mkTransformedGroup groupMembers_Hugtto ne "" nj ""]
  where
    ne = "Hugtto! PreCure"
    nj = "HUGっと！プリキュア"

specialItemsHugtto :: [SpecialItem]
specialItemsHugtto =
  [ mkSpecialItem "Pre Heart" "プリハート"
  , mkSpecialItem "Mirai Crystal Pink" "ミライクリスタル・ピンク"
  , mkSpecialItem "Mirai Crystal Blue" "ミライクリスタル・ブルー"
  , mkSpecialItem "Mirai Crystal Yellow" "ミライクリスタル・イエロー"

  , mkSpecialItem "Melody Sword" "メロディソード"
  , mkSpecialItem "Mirai Crystal Rose" "ミライクリスタル・ローズ"
  , mkSpecialItem "Mirai Crystal Navy" "ミライクリスタル・ネイビー"
  , mkSpecialItem "Mirai Crystal Orange" "ミライクリスタル・オレンジ"
  , mkSpecialItem "Mirai Crystal White" "ミライクリスタル・ホワイト"

  , mkSpecialItem "Twin Love Guitar" "ツインラブギター"
  , mkSpecialItem "Mirai Crystal Red" "ミライクリスタル・レッド"
  , mkSpecialItem "Mirai Crystal Purple" "ミライクリスタル・パープル"
  , mkSpecialItem "Mirai Crystal Rouge" "ミライクリスタル・ルージュ"
  , mkSpecialItem "Mirai Crystal Violet" "ミライクリスタル・バイオレット"

  , mkSpecialItem "Mirai Pad" "ミライパッド"
  , mkSpecialItem "Mirai Crystal Cheerful" "ミライクリスタル・チアフル"
  , mkSpecialItem "Mirai Crystal Mother Heart" "ミライクリスタル・マザーハート"
  , mkSpecialItem "Memorial Cure Clock" "メモリアルキュアクロック"

  , mkSpecialItem "Miracle By Mirai Brace" "ミライブレスが起こした奇跡"
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
      groupMembers_Hugtto
      (miraiCrystalHeartKiratto ++ miraiCrystal2HeartKiratto ++
       replicate 2 hagyoo ++
       replicate 3 gyoo ++
       introducesHerselfAs_CureYell ++
       [ last introducesHerselfAs_CureAnge
       , last introducesHerselfAs_CureEtoile
       , last introducesHerselfAs_CureMacherie_CureAmour
       , "HUGっと！プリキュア！"
       ])

  , mkTransformation -- https://www.youtube.com/watch?v=Dr8SVNTNbJ8
      (groupMembers_Hugtto ++ ["Hugtan"])
      [mkIA "MemorialCureClock" [mkIA "MiraiPad" ["MiraiCrystalCheerful"]]]
      groupMembers_Hugtto_Cheerful
      [ "メモリアルキュアクロック・チアフル！"
      , "ミライパッド！オープン！"
      , "プリキュア！チアフルスタイル！"
      ]

  , mkTransformation -- https://www.youtube.com/watch?v=Dr8SVNTNbJ8
      (groupMembers_Hugtto ++ ["Hugtan"])
      [mkIA "MemorialCureClock" [mkIA "MiraiPad" ["MiraiCrystalMotherHeart"]]]
      groupMembers_Hugtto_MotherHeart
      [ "メモリアルキュアクロック・マザーハート！"
      , "ミライパッド！オープン！"
      , "HUGっとプリキュア！今ここに！"
      ]

  , mkTransformation -- https://www.youtube.com/watch?v=6PDxRppZhPY
      ["Anri"]
      ["MiracleByMiraiBrace"]
      ["CureInfini"]
      (
        [ "なんでもできる！なんでもなれる！"
        , "悲しいときも、迷うときも！"
        , "みんなを励まし、未来へ輝け！"
        , "そうだ、それが、プリキュアだ！"
        ] ++ introducesHerselfAs_CureInfini
        )
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
  , mkPurification
      groupMembers_Hugtto_Cheerful
      [mkIA "MemorialCureClock" [mkIA "MiraiPad" ["MiraiCrystalCheerful"]]]
      [ "メモリアルパワー・フルチャージ！"
      , "プリキュア！チアフルアターック！"
      , "はぎゅ！"
      ]
  , mkPurification -- https://www.youtube.com/watch?v=U-3-CtWiGaM
      groupMembers_Hugtto_MotherHeart
      [mkIA "MemorialCureClock" [mkIA "MiraiPad" ["MiraiCrystalMotherHeart"]]]
      [ "ワン・フォー・オール！"
      , "オール・フォー・ワン！"
      , "ウィー・アー！"
      , "プリー・キュアー！"
      , "明日に、エールを！"
      , "ゴーファイ！"
      , "みんなでトゥモロー！"
      , "あったかい...。"
      ]
  ]

groupMembers_Hugtto :: IsString s => [s]
groupMembers_Hugtto =
  ["CureYell", "CureAnge", "CureEtoile", "CureMacherie", "CureAmour"]

groupMembers_Hugtto_Cheerful :: IsString s => [s]
groupMembers_Hugtto_Cheerful =
  ["CureYell_CheerfulStyle", "CureAnge_CheerfulStyle", "CureEtoile_CheerfulStyle", "CureMacherie_CheerfulStyle", "CureAmour_CheerfulStyle", "Hugtan_CheerfulStyle"]

groupMembers_Hugtto_MotherHeart :: IsString s => [s]
groupMembers_Hugtto_MotherHeart =
  ["CureYell_MotherHeartStyle", "CureAnge_MotherHeartStyle", "CureEtoile_MotherHeartStyle", "CureMacherie_MotherHeartStyle", "CureAmour_MotherHeartStyle", "Hugtan_MotherHeartStyle"]

miraiCrystal = "ミライクリスタル！" 

miraiCrystalHeartKiratto = [miraiCrystal, "ハートキラっと！"]
miraiCrystal2HeartKiratto = miraiCrystal : miraiCrystalHeartKiratto

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

introducesHerselfAs_CureInfini = ["キュアアンフィニ！", "それが僕の名前かな。"]

cheerfulStyleEn = "Cheerful Style"

cheerfulStyle = "チアフルスタイル"

motherHeartStyleEn = "Mother Heart Style"

motherHeartStyle = "マザーハートスタイル"
