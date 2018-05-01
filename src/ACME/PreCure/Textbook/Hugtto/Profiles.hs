{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.Hugtto.Profiles where

import           ACME.PreCure.Index.Types


girlsHugtto :: [Girl]
girlsHugtto =
  [ mkGirl "Hana Nono" "野乃 はな"
  , mkGirl "Saaya Yakushiji" "薬師寺 さあや"
  , mkGirl "Homare Kagayaki" "輝木 ほまれ"
  ]


transformeesHugtto :: [Transformee]
transformeesHugtto =
  [ mkTransformee "Cure Yell" "" "キュアエール" "" (concat introducesHerselfAs_CureYell)
  , mkTransformee "Cure Ange" "" "キュアアンジュ" "" (concat introducesHerselfAs_CureAnge)
  , mkTransformee "Cure Etoile" "" "キュアエトワール" "" (concat introducesHerselfAs_CureEtoile)
  ]


transformedGroupsHugtto :: [TransformedGroup]
transformedGroupsHugtto =
  [mkTransformedGroup ne "" nj ""]
  where
    ne = "Hugtto PreCure"
    nj = "HUGっと！プリキュア"


specialItemsHugtto :: [SpecialItem]
specialItemsHugtto =
  [ mkSpecialItem "Pre Heart" "プリハート" ["Mirai Crystal"]
  , mkSpecialItem "Mirai Crystal Pink"   "ミライクリスタル・ピンク"    []
  , mkSpecialItem "Mirai Crystal Blue"   "ミライクリスタル・ブルー"    []
  , mkSpecialItem "Mirai Crystal Yellow" "ミライクリスタル・イエロー"  []
  , mkSpecialItem "Melody Sword" "メロディソード" ["Mirai Crystal"]
  , mkSpecialItem "Mirai Crystal Rose"   "ミライクリスタル・ローズ"    []
  , mkSpecialItem "Mirai Crystal Navy"   "ミライクリスタル・ネイビー"  []
  , mkSpecialItem "Mirai Crystal Orange" "ミライクリスタル・オレンジ"  []
  , mkSpecialItem "Mirai Crystal White"  "ミライクリスタル・ホワイト"  []
  ]


transformationsHugtto :: [Transformation]
transformationsHugtto =
      [ mkTransformation
          ["Hana"]
          [mkIA "PreHeart" ["MiraiCrystalPink"]]
          ["CureYell"]
          (miraiCrystalHeartKiratto ++ hagyoogyoogyoooo ++ introducesHerselfAs_CureYell)
      , mkTransformation
          ["Saaya"]
          [mkIA "PreHeart" ["MiraiCrystalBlue"]]
          ["CureAnge"]
          (miraiCrystalHeartKiratto ++ hagyoogyoogyoooo ++ introducesHerselfAs_CureAnge)
      , mkTransformation
          ["Homare"]
          [mkIA "PreHeart" ["MiraiCrystalYellow"]]
          ["CureEtoile"]
          (miraiCrystalHeartKiratto ++ hagyoogyoogyoooo ++ introducesHerselfAs_CureEtoile)
      , mkTransformation
          ["Hana", "Saaya", "Homare"]
          [mkIA "PreHeart" ["MiraiCrystalPink"], mkIA "PreHeart" ["MiraiCrystalBlue"], mkIA "PreHeart" ["MiraiCrystalYellow"]]
          ["CureYell", "CureAnge", "CureEtoile"]
          (miraiCrystalHeartKiratto ++ replicate 3 hagyoo ++ introducesHerselfAs_CureYell ++ [last introducesHerselfAs_CureAnge, last introducesHerselfAs_CureEtoile])
      ]


purificationsHugtto :: [Purification]
purificationsHugtto =
  [ mkPurification ["CureYell"]   [mkIA "PreHeart" ["MiraiCrystalPink"]]   ["フレフレ！", "ハート・フォー・ユー！"]
  , mkPurification ["CureAnge"]   [mkIA "PreHeart" ["MiraiCrystalBlue"]]   ["フレフレ！", "ハート・フェザー！"]
  , mkPurification ["CureEtoile"] [mkIA "PreHeart" ["MiraiCrystalYellow"]] ["フレフレ！", "ハート・スター！"]
  -- TODO: Aliases for Yell Tact, Ange Harp, Etoile Flute
  -- https://www.youtube.com/watch?v=u3d_3aovyL8
  , mkPurification ["CureYell"]   [mkIA "MelodySword" ["MiraiCrystalRose"]]   ["フラワーシュート!"]
  , mkPurification ["CureAnge"]   [mkIA "MelodySword" ["MiraiCrystalNavy"]]   ["フェザーブラスト!"]
  , mkPurification ["CureEtoile"] [mkIA "MelodySword" ["MiraiCrystalOrange"]] ["スタースラッシュ！"]
  , mkPurification
      ["CureYell", "CureAnge", "CureEtoile"]
      [mkIA "MelodySword" ["MiraiCrystalRose"], mkIA "MelodySword" ["MiraiCrystalNavy"], mkIA "MelodySword" ["MiraiCrystalOrange"]]
      [ "ミライクリスタル！"
      , "エールタクト！"
      , "アンジュハープ！"
      , "エトワールフルート！"
      , "心のトゲトゲ、飛んでいけ〜！"
      , "プリキュア・トリニティコンサート！"
      , "HUGっとプリキュア！エール・フォー・ユー！"
      ]
  ]


miraiCrystalHeartKiratto = ["ミライクリスタル！", "ハートキラっと！"]
hagyoo = "は～ぎゅ～～！"
hagyoogyoogyoooo = [hagyoo, "ぎゅ～！", "ぎゅ～～！"]
kagayakuMiraiWoDakishimete = "輝く未来をー、抱きしめて！"

introducesHerselfAs_CureYell   = [kagayakuMiraiWoDakishimete, "みんなを応援！元気のプリキュア！キュアエール！"]
introducesHerselfAs_CureAnge   = [kagayakuMiraiWoDakishimete, "みんなを癒す！知恵のプリキュア！キュアアンジュ！"]
introducesHerselfAs_CureEtoile = [kagayakuMiraiWoDakishimete, "みんな輝け！力のプリキュア！キュアエトワール！"]
