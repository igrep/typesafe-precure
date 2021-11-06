{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.TropicalRouge.Profiles where

import           Data.String              (IsString)

import           ACME.PreCure.Index.Types

girls :: [Girl]
girls =
  [ mkGirl "Manatsu Natsuumi" "夏海 まなつ"
  , mkGirl "Sango Suzumura"   "涼村 さんご"
  , mkGirl "Minori Ichinose"  "一之瀬 みのり"
  , mkGirl "Asuka Takizawa"   "滝沢 あすか"
  , mkGirl "Laura"            "ローラ・ラメール"
  ]

transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Summer"
      ""
      "キュアサマー"
      ""
      introducesHerselfAs_CureSummer
  , mkTransformee
      "Cure Coral"
      ""
      "キュアコーラル"
      ""
      introducesHerselfAs_CureCoral
  , mkTransformee
      "Cure Papaya"
      ""
      "キュアパパイア"
      ""
      introducesHerselfAs_CurePapaya
  , mkTransformee
      "Cure Flamingo"
      ""
      "キュアフラミンゴ"
      ""
      introducesHerselfAs_CureFlamingo
  , mkTransformee
      "Cure La Mer"
      ""
      "キュアラメール"
      ""
      introducesHerselfAs_CureLaMer

  , mkTransformee
      "Cure Summer"
      "Mix Tropical Style"
      "キュアサマー"
      "ミックストロピカルスタイル"
      introducesHerselfAs_CureSummer
  , mkTransformee
      "Cure Coral"
      "Mix Tropical Style"
      "キュアコーラル"
      "ミックストロピカルスタイル"
      introducesHerselfAs_CureCoral
  , mkTransformee
      "Cure Papaya"
      "Mix Tropical Style"
      "キュアパパイア"
      "ミックストロピカルスタイル"
      introducesHerselfAs_CurePapaya
  , mkTransformee
      "Cure Flamingo"
      "Mix Tropical Style"
      "キュアフラミンゴ"
      "ミックストロピカルスタイル"
      introducesHerselfAs_CureFlamingo

  , mkTransformee
      "Cure Summer"
      "Excellent Tropical Style"
      "キュアサマー"
      "エクセレン・トロピカルスタイル"
      introducesHerselfAs_CureSummer
  , mkTransformee
      "Cure Coral"
      "Excellent Tropical Style"
      "キュアコーラル"
      "エクセレン・トロピカルスタイル"
      introducesHerselfAs_CureCoral
  , mkTransformee
      "Cure Papaya"
      "Excellent Tropical Style"
      "キュアパパイア"
      "エクセレン・トロピカルスタイル"
      introducesHerselfAs_CurePapaya
  , mkTransformee
      "Cure Flamingo"
      "Excellent Tropical Style"
      "キュアフラミンゴ"
      "エクセレン・トロピカルスタイル"
      introducesHerselfAs_CureFlamingo
  , mkTransformee
      "Cure La Mer"
      "Excellent Tropical Style"
      "キュアラメール"
      "エクセレン・トロピカルスタイル"
      introducesHerselfAs_CureLaMer
  ]

transformedGroups :: [TransformedGroup]
transformedGroups =
  [ mkTransformedGroup groupMembers1 ne "" groupNameJa ""
  , mkTransformedGroup groupMembers2 ne "" groupNameJa ""
  , mkTransformedGroup groupMembers_MixTropical ne "Mix Tropical Style" groupNameJa "ミックストロピカルスタイル"
  , mkTransformedGroup groupMembers_ExcellentTropical ne "Excellent Tropical Style" groupNameJa "エクセレン・トロピカルスタイル"
  ]
 where
  ne = "Tropical-Rouge! PreCure"

groupNameJa :: String
groupNameJa = "トロピカル〜ジュ！プリキュア"

specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Tropical Pact" "トロピカルパクト"
  , mkSpecialItem "Heart Kuru Ring" "ハートクルリング"
  , mkSpecialItem "Mermaid Aqua Pact" "マーメイドアクアパクト"

  , mkSpecialItem "Mermaid Aqua Pot" "マーメイドアクアポット"
  , mkSpecialItem "Heart Rouge Rod" "ハートルージュロッド"
  , mkSpecialItem "Heart Quartet Ring" "ハートカルテットリング"
  , mkSpecialItem "Perfume Shiny Ring" "パフュームシャイニーリング"
  , mkSpecialItem "Mermaid Aqua Brush" "マーメイドアクアブラシ"
  , mkSpecialItem "Tropical Heart Dresser" "トロピカルハートドレッサー"
  , mkSpecialItem "Land Heart Kuru Ring" "ランドハートクルリング"

  , mkSpecialItem "Heart Kuru Ring Cure Summer"   "変身ハートクルリング キュアサマー"
  , mkSpecialItem "Heart Kuru Ring Cure Coral"    "変身ハートクルリング キュアコーラル"
  , mkSpecialItem "Heart Kuru Ring Cure Papaya"   "変身ハートクルリング キュアパパイア"
  , mkSpecialItem "Heart Kuru Ring Cure Flamingo" "変身ハートクルリング キュアフラミンゴ"
  , mkSpecialItem "Heart Kuru Ring Cure La Mer"   "変身ハートクルリング キュアラメール"
  ]

transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Manatsu"]
      [mkIA "TropicalPact" ["HeartKuruRingCureSummer"]]
      ["CureSummer"]
      ( commonTransformationLines
      ++ [cheek, eyes, hair, lip, dress]
      ++ [introducesHerselfAs_CureSummer]
      )
  , mkTransformation
      ["Sango"]
      [mkIA "TropicalPact" ["HeartKuruRingCureCoral"]]
      ["CureCoral"]
      ( commonTransformationLines
      ++ [lip, eyes, hair, cheek, dress]
      ++ [introducesHerselfAs_CureCoral]
      )
  , mkTransformation
      ["Minori"]
      [mkIA "TropicalPact" ["HeartKuruRingCurePapaya"]]
      ["CurePapaya"]
      ( commonTransformationLines
      ++ [cheek, lip, hair, eyes, dress]
      ++ [introducesHerselfAs_CurePapaya]
      )
  , mkTransformation
      ["Asuka"]
      [mkIA "TropicalPact" ["HeartKuruRingCureFlamingo"]]
      ["CureFlamingo"]
      ( commonTransformationLines
      ++ [cheek, eyes, lip, hair, dress]
      ++ [introducesHerselfAs_CureFlamingo]
      )

  , mkTransformation
      ["Laura"]
      [mkIA "MermaidAquaPact" ["HeartKuruRingCureLaMer"]]
      ["CureLaMer"]
      ( commonTransformationLines
      ++ [face, nail, dress]
      ++ [introducesHerselfAs_CureLaMer]
      )

  , mkTransformation
      ["Manatsu", "Sango"]
      [ mkIA "TropicalPact" ["HeartKuruRingCureSummer"]
      , mkIA "TropicalPact" ["HeartKuruRingCureCoral"]
      ]
      ["CureSummer", "CureCoral"]
      ( commonTransformationLines
      ++ [cheek, eyes, hair, lip, dress]
      ++ [introducesHerselfAs_CureSummer]
      ++ [introducesHerselfAs_CureCoral]
      )

  , mkTransformation
      ["Manatsu", "Sango", "Minori"]
      [ mkIA "TropicalPact" ["HeartKuruRingCureSummer"]
      , mkIA "TropicalPact" ["HeartKuruRingCureCoral"]
      , mkIA "TropicalPact" ["HeartKuruRingCurePapaya"]
      ]
      ["CureSummer", "CureCoral", "CurePapaya"]
      ( commonTransformationLines
      ++ [cheek, eyes, hair, lip, dress]
      ++ [introducesHerselfAs_CureSummer]
      ++ [introducesHerselfAs_CureCoral]
      ++ [introducesHerselfAs_CurePapaya]
      )

  , mkTransformation
      girls1
      [ mkIA "TropicalPact" ["HeartKuruRingCureSummer"]
      , mkIA "TropicalPact" ["HeartKuruRingCureCoral"]
      , mkIA "TropicalPact" ["HeartKuruRingCurePapaya"]
      , mkIA "TropicalPact" ["HeartKuruRingCureFlamingo"]
      ]
      groupMembers1
      (transformationSpeech_TropicalRouge "4人そろって！")

  , mkTransformation
      girls2
      [ mkIA "TropicalPact" ["HeartKuruRingCureSummer"]
      , mkIA "TropicalPact" ["HeartKuruRingCureCoral"]
      , mkIA "TropicalPact" ["HeartKuruRingCurePapaya"]
      , mkIA "TropicalPact" ["HeartKuruRingCureFlamingo"]
      , mkIA "MermaidAquaPact" ["HeartKuruRingCureLaMer"]
      ]
      groupMembers2
      (transformationSpeech_TropicalRouge2 "5人そろって！")

  , mkTransformation
      groupMembers1
      [ mkIA "HeartRougeRod" ["HeartQuartetRing"]
      , "HeartRougeRod"
      , "HeartRougeRod"
      , "HeartRougeRod"
      ]
      groupMembers_MixTropical
      [ "ハートカルテットリング！"
      , "飛び出せ！元気なハート！"
      , "やさしいハート！"
      , "かしこいハート！"
      , "燃え立つハート！"
      ]

  , mkTransformation
      groupMembers2
      [ mkIA "TropicalHeartDresser" ["LandHeartKuruRing"]
      ]
      groupMembers_ExcellentTropical
      [ "ランドハートクルリング！"
      , "エクセレン・トロピカルスタイル！"
      ]
  ]


transformationSpeech_TropicalRouge :: String -> [String]
transformationSpeech_TropicalRouge catchCopy =
  commonTransformationLines
  ++ [cheek, eyes, hair, lip, dress]
  ++ [introducesHerselfAs_CureSummer]
  ++ [introducesHerselfAs_CureCoral]
  ++ [introducesHerselfAs_CurePapaya]
  ++ [introducesHerselfAs_CureFlamingo]
  ++ ["はーっ！", catchCopy, groupNameJa ++ "！"]


transformationSpeech_TropicalRouge2 :: String -> [String]
transformationSpeech_TropicalRouge2 catchCopy =
  commonTransformationLines
  ++ [cheek, eyes, hair, lip, nail, dress]
  ++ [introducesHerselfAs_CureSummer]
  ++ [introducesHerselfAs_CureCoral]
  ++ [introducesHerselfAs_CurePapaya]
  ++ [introducesHerselfAs_CureFlamingo]
  ++ [introducesHerselfAs_CureLaMer]
  ++ ["はーっ！", catchCopy, groupNameJa ++ "！"]


girls1 :: IsString s => [s]
girls1 = ["Manatsu", "Sango", "Minori", "Asuka"]

girls2 :: IsString s => [s]
girls2 = girls1 ++ ["Laura"]

cheek, eyes, hair, lip, dress, face, nail :: String
cheek = "チーク！"
eyes = "アイズ！"
hair = "ヘアー！"
lip = "リップ！"
dress = "ドレス！"
face = "フェイス！"
nail = "ネイル！"

commonTransformationLines :: [String]
commonTransformationLines = ["プリキュア！トロピカルチェンジ！", "レッツメイク！キャッチ！"]

mermaidAquaPotWith :: String -> [String]
mermaidAquaPotWith color =
  if null color
    then [mermaidAquaPot, yarukiPowerComeback]
    else [mermaidAquaPot ++ "サーチ！", color ++ "！", yarukiPowerComeback]
 where
  mermaidAquaPot = "マーメイドアクアポット！"
  yarukiPowerComeback = "やる気パワー、カムバック！"


purifications :: [Purification]
purifications =
  [ mkPurification
      ["CureSummer"]
      ["HeartRougeRod"]
      [heartRougeRod, "プリキュア！おてんとサマー・ストライク！", victory]

  , mkPurification
      ["CureCoral"]
      ["HeartRougeRod"]
      [heartRougeRod, "プリキュア！もこもこコーラルディフュージョン！", victory]

  , mkPurification
      ["CurePapaya"]
      ["HeartRougeRod"]
      [heartRougeRod, "ぷわーん！", "プリキュア！ぱんぱかパパイアショット！", victory]

  , mkPurification
      ["CureFlamingo"]
      ["HeartRougeRod"]
      [heartRougeRod, "プリキュア！ぶっとびフラミンゴ・スマッシュ！", victory]

  , mkPurification
      ["CureLaMer"]
      ["MermaidAquaPact"]
      ["プリキュア！くるくるラメールストリーム！", victory]

  , mkPurification
      groupMembers_MixTropical
      [ mkIA "HeartRougeRod" ["HeartQuartetRing"]
      , "HeartRougeRod"
      , "HeartRougeRod"
      , "HeartRougeRod"
      ]
      [ "ハートドキドキ！ドッキング！"
      , "プリキュア！ミックストロピカル！"
      , victory
      ]

  , mkPurification
      ["CureLaMer"]
      [mkIA "MermaidAquaPact" ["PerfumeShinyRing", "MermaidAquaBrush"]]
      ["パフュームシャイニーリング！", "シャボンフォーム！", "アクアチャージ！", "プリキュア！ オーシャンバブルシャワー！", victory]

  , mkPurification
      groupMembers_ExcellentTropical
      [ mkIA "TropicalHeartDresser" ["LandHeartKuruRing"]
      ]
      [ "5つの力！大地を照らせ！"
      , "（ぱおーん！）"
      , "プリキュア・ランドビートダイナミック！"
      , victory
      ]

  , mkPurification
      ["Laura"]
      ["MermaidAquaPot"]
      (mermaidAquaPotWith "")

  , mkPurification
      ["CureLaMer"]
      ["MermaidAquaPot"]
      (mermaidAquaPotWith "")
  ]

 where
  heartRougeRod = "ハートルージュロッド！"
  victory = "ビクトリー！"

groupMembers1 :: IsString s => [s]
groupMembers1 = ["CureSummer", "CureCoral", "CurePapaya", "CureFlamingo"]

groupMembers2 :: IsString s => [s]
groupMembers2 = groupMembers1 ++ ["CureLaMer"]

groupMembers_MixTropical :: IsString s => [s]
groupMembers_MixTropical = ["CureSummer_MixTropicalStyle", "CureCoral_MixTropicalStyle", "CurePapaya_MixTropicalStyle", "CureFlamingo_MixTropicalStyle"]

groupMembers_ExcellentTropical :: IsString s => [s]
groupMembers_ExcellentTropical = ["CureSummer_ExcellentTropicalStyle", "CureCoral_ExcellentTropicalStyle", "CurePapaya_ExcellentTropicalStyle", "CureFlamingo_ExcellentTropicalStyle", "CureLaMer_ExcellentTropicalStyle"]

introducesHerselfAs_CureSummer =
  "ときめく常夏！キュアサマー！"

introducesHerselfAs_CureCoral =
  "きらめく宝石！キュアコーラル！"

introducesHerselfAs_CurePapaya =
  "ひらめく果実（フルーツ）！キュアパパイア！"

introducesHerselfAs_CureFlamingo =
  "はためく翼！キュアフラミンゴ！"

introducesHerselfAs_CureLaMer =
  "ゆらめく大海原（オーシャン）！キュアラメール！"
