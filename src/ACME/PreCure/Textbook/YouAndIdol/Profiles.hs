{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.YouAndIdol.Profiles where

import           Data.String              (IsString)

import           ACME.PreCure.Index.Types

girls :: [Girl]
girls =
  [ mkGirl "Uta Sakura" "咲良 うた"
  , mkGirl "Nana Aokaze" "蒼風 なな"
  , mkGirl "Kokoro Shigure" "紫雨 こころ"
  , mkGirl "Purirun" "プリルン"
  , mkGirl "Meroron" "メロロン"
  ]

transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Idol"
      ""
      "キュアアイドル"
      ""
      introducesHerselfAs_Idol
  , mkTransformee
      "Cure Wink"
      ""
      "キュアウインク"
      ""
      introducesHerselfAs_Wink
  , mkTransformee
      "Cure KyunKyun"
      ""
      "キュアキュンキュン"
      ""
      introducesHerselfAs_KyunKyun
  , mkTransformee
      "Cure Zukyoon"
      ""
      "キュアズキューン"
      ""
      introducesHerselfAs_Zukyoon
  , mkTransformee
      "Cure Kiss"
      ""
      "キュアキッス"
      ""
      introducesHerselfAs_Kiss
  ]

transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup ["CureIdol", "CureWink", "CureKyunKyun"] "Idol PreCure" "" groupNameIdolPreCure ""
  , mkTransformedGroup ["CureZukyoon", "CureKiss"] "Zukyoon Kiss" "" groupNameZukyoonKiss ""
  ]

specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Idol Heart Brooch" "アイドルハートブローチ"
  , mkSpecialItem "PreCure Ribbon Cure Idol" "プリキュアリボン（キュアアイドル）"
  , mkSpecialItem "PreCure Ribbon Cure Wink" "プリキュアリボン（キュアウインク）"
  , mkSpecialItem "PreCure Ribbon Cure KyunKyun" "プリキュアリボン（キュアキュンキュン）"
  , mkSpecialItem "PreCure Ribbon Cure Zukyoon" "プリキュアリボン（キュアズキューン）"
  , mkSpecialItem "PreCure Ribbon Cure Kiss" "プリキュアリボン（キュアキッス）"
  , mkSpecialItem "Idol Heart Incom" "アイドルハートインカム"

  , mkSpecialItem "Heart Kirari Lock Shiny Pink" "ハートキラリロック（シャイニーピンク）"
  , mkSpecialItem "Heart Kirari Lock Vivid Pink" "ハートキラリロック（ビビッドピンク）"
  , mkSpecialItem "Kira Kira Show Time Mic" "キラキラショータイムマイク"

  , mkSpecialItem "Kirakkiran Ribbon Baton" "キラッキランリボンバトン"
  ]

transformations :: [Transformation]
transformations =
  [ mkTransformation
    ["Uta"]
    [mkIA "IdolHeartBrooch" ["PreCureRibbonCureIdol"]]
    ["CureIdol"]
    [ preCureLightUp
    , kirakiraDressChangeYeah
    , kimitoYeah
    , isshoniYeah
    , introducesHerselfAs_Idol
    ]

  , mkTransformation
    ["Nana"]
    [mkIA "IdolHeartBrooch" ["PreCureRibbonCureWink"]]
    ["CureWink"]
    winkTransformationSpeech

  , mkTransformation
    ["Kokoro"]
    [mkIA "IdolHeartBrooch" ["PreCureRibbonCureKyunKyun"]]
    ["CureKyunKyun"]
    [ preCureLightUp
    , kirakiraDressChangeYeah
    , kimitoYeah
    , isshoniYeah
    , introducesHerselfAs_KyunKyun
    ]

  , mkTransformation
    ["Uta", "Nana", "Kokoro"]
    [ mkIA "IdolHeartBrooch" ["PreCureRibbonCureIdol"]
    , mkIA "IdolHeartBrooch" ["PreCureRibbonCureWink"]
    , mkIA "IdolHeartBrooch" ["PreCureRibbonCureKyunKyun"]
    ]
    ["CureIdol", "CureWink", "CureKyunKyun"]
    [ preCureLightUp
    , kirakiraDressChangeYeah
    , kimitoYeah
    , isshoniYeah
    , introducesHerselfAs_Idol
    , introducesHerselfAs_Wink
    , introducesHerselfAs_KyunKyun
    , weAreYouAndIdolPreCure
    ]

  , mkTransformation
    ["Purirun", "Meroron"]
    [ mkIA "KiraKiraShowTimeMic" ["PreCureRibbonCureZukyoon"]
    , mkIA "KiraKiraShowTimeMic" ["PreCureRibbonCureKiss"]
    ]
    ["CureZukyoon", "CureKiss"]
    [ preCureLightUp
    , kirakiraShowTimeYeah
    , kimitoYeah
    , isshoniYeah
    , introducesHerselfAs_Zukyoon
    , introducesHerselfAs_Kiss
    ]

  , mkTransformation
    ["Uta", "Nana", "Kokoro", "Purirun", "Meroron"]
    [ mkIA "IdolHeartBrooch" ["PreCureRibbonCureIdol"]
    , mkIA "IdolHeartBrooch" ["PreCureRibbonCureWink"]
    , mkIA "IdolHeartBrooch" ["PreCureRibbonCureKyunKyun"]
    , mkIA "KiraKiraShowTimeMic" ["PreCureRibbonCureZukyoon"]
    , mkIA "KiraKiraShowTimeMic" ["PreCureRibbonCureKiss"]
    ]
    ["CureIdol", "CureWink", "CureKyunKyun"]
    [ preCureLightUp
    , kirakiraDressChange
    , kirakiraShowTime
    , yeah
    , kimitoYeah
    , isshoniYeah
    , introducesHerselfAs_Idol
    , introducesHerselfAs_Wink
    , introducesHerselfAs_KyunKyun
    , introducesHerselfAs_Zukyoon
    , introducesHerselfAs_Kiss
    , weAreYouAndIdolPreCure
    ]

  , mkTransformation
    ["Meroron", "Nana"]
    [ mkIA "KiraKiraShowTimeMic" ["PreCureRibbonCureKiss"]
    , mkIA "IdolHeartBrooch" ["PreCureRibbonCureWink"]
    ]
    ["CureZukyoon", "CureKiss"]
    ( [ preCureLightUp
      , kirakiraShowTimeYeah
      , kimitoYeah
      , isshoniYeah
      , introducesHerselfAs_Zukyoon
      ] ++ winkTransformationSpeech
    )
  ]
 where
  preCureLightUp :: String
  preCureLightUp = "プリキュア、ライトアップ！"

  kirakiraDressChangeYeah :: String
  kirakiraDressChangeYeah = kirakiraDressChange ++ " " ++ yeah

  kirakiraShowTimeYeah :: String
  kirakiraShowTimeYeah = kirakiraShowTime ++ " " ++ yeah

  kimitoYeah :: String
  kimitoYeah = "キミと～！" ++ " " ++ yeah

  isshoniYeah :: String
  isshoniYeah = "一緒に～！" ++ " " ++ yeah

  weAreYouAndIdolPreCure :: String
  weAreYouAndIdolPreCure = "ウィアー！キミとアイドルプリキュア！"

  kirakiraDressChange :: String
  kirakiraDressChange = "キラキラ、ドレスチェンジ！"

  kirakiraShowTime :: String
  kirakiraShowTime = "キラキラ、ショータイム！"

  yeah :: String
  yeah = "YEAH！"

  winkTransformationSpeech :: [String]
  winkTransformationSpeech =
    [ preCureLightUp
    , kirakiraDressChangeYeah
    , kimitoYeah
    , isshoniYeah
    , introducesHerselfAs_Wink
    ]


groupMembers :: IsString s => [s]
groupMembers = ["CureIdol", "CureWink", "CureKyunKyun", "CureZukyoon", "CureKiss"]


purifications :: [Purification]
purifications =
  [ mkPurification
    ["CureIdol"]
    [mkIA "IdolHeartBrooch" ["PreCureRibbonCureIdol"]]
    ["アイドルグータッチ！"]
  , mkPurification
    ["CureWink"]
    [mkIA "IdolHeartBrooch" ["PreCureRibbonCureWink"]]
    ["ウインクバリア！"]
  , mkPurification
    ["CureKyunKyun"]
    [mkIA "IdolHeartBrooch" ["PreCureRibbonCureKyunKyun"]]
    ["キュンキュンレーザー！"]

  , mkPurification
    ["CureIdol"]
    ["IdolHeartIncom"]
    [ climaxHasWatashi
    , "もり上がっていくよー！"
    , "キミのハートに とびっきり元気をあげるね"
    , "ゼッタイ！ (ゼッタイ！) アイドル！ (アイドル！)"
    , "ドキドキが止まらない！"
    , "急接近！笑顔のユニゾン 応えてほしいなっ サンキュー"
    , "最高のステージで キミと歌を咲かそう"
    , "プリキュア！アイドルスマイリング！"
    , kiraKiratta
    ]
  , mkPurification
    ["CureWink"]
    ["IdolHeartIncom"]
    [ climaxHasWatashi
    , "聴いてください。"
    , "きらめきへ踏み出そう 受け取った勇気つないで"
    , "まばたきの数だけ 五線譜に焼きつけていく"
    , "出会えたキミへと奏でたい"
    , "いつまでも鳴り止まないメロディー"
    , "プリキュア！ウインククレッシェンド！"
    , kiraKiratta
    ]
  , mkPurification
    ["CureKyunKyun"]
    ["IdolHeartIncom"]
    [ climaxHasWatashi
    , "準備はOKー!?"
    , "ねえキミも！"
    , "かわいーな (キュンキュン) かっこいーな (キュンキュン)"
    , "完全同意にアガるテンションコーレスプリーズ (イェイ☆)"
    , "とびきりキュンキュン響かせて踊ろっ (Let's dance！！)"
    , "もう1回 (キュンキュン) アンコール (キュンキュン)"
    , "完全ダイスキハイなステップがナンバーワン"
    , "もっと夢中になれるね"
    , "こころビート YES！！ キュンキュン♪"
    , "プリキュア！キュンキュンビート！"
    , kiraKiratta
    ]

  , mkPurification
    ["CureIdol", "CureWink", "CureKyunKyun"]
    ["IdolHeartIncom", "IdolHeartIncom", "IdolHeartIncom"]
    [ "ウー、レッツゴー！"
    , "Try Try Trio Dreams"
    , "Let's Sing Let's Swing Let's Dance Let's Bound"
    , "Let's Smile Let's Fly"
    , "ハートを上げてくよ！"
    , "Sing! 音符に夢乗せて キミ、あなたのもとへ For You"
    , "もっともっと 輝き合えるね みんな キラッキラン"
    , "瞳水晶(スクリーン)に いつだって 笑顔映し合おう Promise"
    , "キミがいるからパワー 生まれるよ、今日も"
    , "Try Try Trio Dreams"
    , "プリキュア！ハイエモーション！"
    , kiraKiratta
    ]

  , mkPurification
    ["CureZukyoon"]
    ["HeartKirariLockShinyPink"]
    ["ズキューンバズーカー！"]
  , mkPurification
    ["CureKiss"]
    ["HeartKirariLockVividPink"]
    ["ちゅっ", "キッスショック！"]

  , mkPurification
    ["CureZukyoon", "CureKiss"]
    [ mkIA "KiraKiraShowTimeMic" ["PreCureRibbonCureZukyoon"]
    , mkIA "KiraKiraShowTimeMic" ["PreCureRibbonCureKiss"]
    ]
    [ "ふたりの誓い、いま輝け！"
    , "取り戻したい 光の世界"
    , "その笑顔 勇気 涙 夢"
    , "希望の兆し"
    , "キミと明日を 願うチカラで"
    , "生まれる 私たちのハーモニー"
    , "響け"
    , "プリキュア！ズキューンキッスディスティニー！"
    , kiraKiratta
    ]

  , mkPurification
    ["CureIdol", "CureWink", "CureKyunKyun", "CureZukyoon", "CureKiss"]
    ["KirakkiranRibbonBaton"]
    [ "感じて You and I キズナリボン"
    , "クライマックスはわたしたち！"
    , "かさなるオモイの強さを 歌にのせて"
    , "届けにきたよ Sing for you 照らしてみせる"
    , "あふれるオモイを残らず 伝えるんだ"
    , "どんな時でも You and I"
    , "わたしとキミを結ぶ キズナ・Sing-a・リボン"
    , "プリキュア！キラッキラン・フォー・ユー！"
    , kiraKiratta
    ]
  ]
 where
  climaxHasWatashi :: String
  climaxHasWatashi = "クライマックスはわたし！"
  kiraKiratta :: String
  kiraKiratta = "（キラキラッタ～）"


introducesHerselfAs_Idol :: String
introducesHerselfAs_Idol = "キミと歌う、ハートのキラキラ！ 笑顔ニッコリ、キュアアイドル！"

introducesHerselfAs_Wink :: String
introducesHerselfAs_Wink = "キミと瞬く、ハートの勇気！ お目目パッチン、キュアウインク！"

introducesHerselfAs_KyunKyun :: String
introducesHerselfAs_KyunKyun = "キミと踊る、ハートのリズム！ 心キュンキュン、キュアキュンキュン！"

introducesHerselfAs_Zukyoon :: String
introducesHerselfAs_Zukyoon = "ハートをプリっとロックオン！ キミとズッキュン、キュアズキューン！"

introducesHerselfAs_Kiss :: String
introducesHerselfAs_Kiss = "ハートをメロっとひとりじめ！ キミと口づけ、キュアキッス！"

youAndIdolPreCure :: String
youAndIdolPreCure = "キミとアイドルプリキュア♪"

groupNameIdolPreCure :: String
groupNameIdolPreCure = "アイドルプリキュア"

groupNameZukyoonKiss :: String
groupNameZukyoonKiss = "ズキューン・キッス"
