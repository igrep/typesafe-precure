{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE OverloadedStrings #-}

module ACME.PreCure.Textbook.StarTwinkle.Profiles where

import           Data.String (IsString)

import           ACME.PreCure.Index.Types

girls :: [Girl]
girls =
  [ mkGirl "Hikaru Hoshina" "星奈 ひかる"
  , mkGirl "Lala Hagoromo"  "羽衣 ララ"
  , mkGirl "Elena Amamiya"  "天宮 えれな"
  , mkGirl "Madoka Kaguya"  "香久矢 まどか"
  , mkGirl "Yuni"           "ユニ"
  ]

transformees :: [Transformee]
transformees =
  [ mkTransformee
      "Cure Star"
      ""
      "キュアスター"
      ""
      introducesHerselfAs_CureStar
  , mkTransformee
      "Cure Milky"
      ""
      "キュアミルキー"
      ""
      introducesHerselfAs_CureMilky
  , mkTransformee
      "Cure Soleil"
      ""
      "キュアソレイユ"
      ""
      introducesHerselfAs_CureSoleil
  , mkTransformee
      "Cure Selene"
      ""
      "キュアセレーネ"
      ""
      introducesHerselfAs_CureSelene
  , mkTransformee
      "Cure Cosmo"
      ""
      "キュアコスモ"
      ""
      introducesHerselfAs_CureCosmo
  , mkTransformee
      "Cure Star"
      twinkleStyleEn
      "キュアスター"
      twinkleStyle
      introducesHerselfAs_CureStar
  , mkTransformee
      "Cure Milky"
      twinkleStyleEn
      "キュアミルキー"
      twinkleStyle
      introducesHerselfAs_CureMilky
  , mkTransformee
      "Cure Soleil"
      twinkleStyleEn
      "キュアソレイユ"
      twinkleStyle
      introducesHerselfAs_CureSoleil
  , mkTransformee
      "Cure Selene"
      twinkleStyleEn
      "キュアセレーネ"
      twinkleStyle
      introducesHerselfAs_CureSelene
  , mkTransformee
      "Cure Cosmo"
      twinkleStyleEn
      "キュアコスモ"
      twinkleStyle
      introducesHerselfAs_CureCosmo
  ]

transformedGroups :: [TransformedGroup]
transformedGroups =
    [ mkTransformedGroup groupMembers1 ne "" nj ""
    , mkTransformedGroup groupMembers2 ne "" nj ""
    , mkTransformedGroup groupMembersTwinkleStyle ne twinkleStyleEn nj twinkleStyle
    ]
  where
    ne = "StarTwinkle☆ PreCure"
    nj = "スター☆トゥインクルプリキュア"

specialItems :: [SpecialItem]
specialItems =
  [ mkSpecialItem "Star Color Pendant" "スターカラーペンダント" ["Star Color Pen"]
  , mkSpecialItem "Star Color Pen Cure Star"   "スターカラーペン キュアスター" []
  , mkSpecialItem "Star Color Pen Cure Milky"  "スターカラーペン キュアミルキー" []
  , mkSpecialItem "Star Color Pen Cure Soleil" "スターカラーペン キュアソレイユ" []
  , mkSpecialItem "Star Color Pen Cure Selene" "スターカラーペン キュアセレーネ" []
  , mkSpecialItem "Star Color Pen Cure Cosmo"  "スターカラーペン キュアコスモ" []
  , mkSpecialItem "Star Color Pen Taurus"      "スターカラーペン おうし座" []
  , mkSpecialItem "Star Color Pen Leo"         "スターカラーペン しし座" []
  , mkSpecialItem "Star Color Pen Libra"       "スターカラーペン てんびん座" []
  , mkSpecialItem "Star Color Pen Scorpius"    "スターカラーペン さそり座" []
  , mkSpecialItem "Star Color Pen Capricorn"   "スターカラーペン やぎ座" []
  , mkSpecialItem "Star Color Pen Scorpio"     "スターカラーペン さそり座" []
  , mkSpecialItem "Star Color Pen Sagittarius" "スターカラーペン いて座" []
  , mkSpecialItem "Star Color Pen Virgo"       "スターカラーペン おとめ座" []
  , mkSpecialItem "Star Color Pen Gemini"      "スターカラーペン ふたご座" []
  , mkSpecialItem "Star Color Pen Aries"       "スターカラーペン おひつじ座" []
  , mkSpecialItem "Star Color Pen Aquarius"    "スターカラーペン みずがめ座" []

  , mkSpecialItem "Twinkle Stick" "トゥインクルステッキ" []

  , mkSpecialItem "Rainbow Perfume" "レインボーパフューム" ["Star Color Pen"]

  , mkSpecialItem "Shiny Twinkle Pen" "シャイニートゥインクルペン" []
  ]

transformations :: [Transformation]
transformations =
  [ mkTransformation
      ["Hikaru"]
      [mkIA "StarColorPendant" ["StarColorPenCureStar"]]
      ["CureStar"]
      (starColorPendantColorCharge ++
       transformationSong ++ [introducesHerselfAs_CureStar])
  , mkTransformation
      ["Lala"]
      [mkIA "StarColorPendant" ["StarColorPenCureMilky"]]
      ["CureMilky"]
      (starColorPendantColorCharge ++
       transformationSong ++ [introducesHerselfAs_CureMilky])
  , mkTransformation
      ["Elena"]
      [mkIA "StarColorPendant" ["StarColorPenCureSoleil"]]
      ["CureSoleil"]
      (starColorPendantColorCharge ++
       transformationSong ++ [introducesHerselfAs_CureSoleil])
  , mkTransformation
      ["Madoka"]
      [ mkIA "StarColorPendant" ["StarColorPenCureSelene"]
      ]
      ["CureSelene"]
      (starColorPendantColorCharge ++
       transformationSong ++ [introducesHerselfAs_CureSelene])
  , mkTransformation
      ["Yuni"]
      [ mkIA "StarColorPendant" ["StarColorPenCureCosmo"]
      ]
      ["CureSelene"]
      (starColorPendantColorCharge ++
       transformationSong ++ [introducesHerselfAs_CureCosmo])
  , mkTransformation
      ["Hikaru", "Lala", "Elena", "Madoka"]
      [ mkIA "StarColorPendant" ["StarColorPenCureStar"]
      , mkIA "StarColorPendant" ["StarColorPenCureMilky"]
      , mkIA "StarColorPendant" ["StarColorPenCureSoleil"]
      , mkIA "StarColorPendant" ["StarColorPenCureSelene"]
      ]
      groupMembers1
      (starColorPendantColorCharge ++
       transformationSong ++
       [ introducesHerselfAs_CureStar
       , introducesHerselfAs_CureMilky
       , introducesHerselfAs_CureSoleil
       , introducesHerselfAs_CureSelene
       , "スター☆トゥインクルプリキュア！"
       ]
      )
  , mkTransformation
      ["Hikaru", "Lala", "Elena", "Madoka", "Yuni"]
      [ mkIA "StarColorPendant" ["StarColorPenCureStar"]
      , mkIA "StarColorPendant" ["StarColorPenCureMilky"]
      , mkIA "StarColorPendant" ["StarColorPenCureSoleil"]
      , mkIA "StarColorPendant" ["StarColorPenCureSelene"]
      , mkIA "StarColorPendant" ["StarColorPenCureCosmo"]
      ]
      groupMembers2
      (starColorPendantColorCharge ++
       transformationSong ++
       [ introducesHerselfAs_CureStar
       , introducesHerselfAs_CureMilky
       , introducesHerselfAs_CureSoleil
       , introducesHerselfAs_CureSelene
       , introducesHerselfAs_CureCosmo
       , "スター☆トゥインクルプリキュア！"
       ]
      )
  , mkTransformation
      groupMembers2
      ["ShinyTwinklePen"]
      groupMembersTwinkleStyle
      [ "みんなの思い！重ねるフワ〜！"
      , "シャイニートゥインクルペン！"
      , "声を重ねるフワ！"
      , "キラキラ〜！"
      , "トゥインクル！"
      , "キラキラ〜！"
      , "トゥインクル！"
      , "フゥゥワ～～！"
      , "イマジネーションの輝き！なりたい自分に！"
      ]
  ]

purifications :: [Purification]
purifications =
  [ mkPurification
      ["CureStar"]
      [mkIA "StarColorPendant" ["StarColorPenTaurus"]]
      ["プリキュア！", "おうし座！", "スター・パンチ！"]
  , mkPurification
      ["CureStar"]
      [mkIA "StarColorPendant" ["StarColorPenAries"]]
      ["プリキュア！", "おひつじ座！", "スター・パンチ！"]

  , mkPurification
      ["CureMilky"]
      [mkIA "StarColorPendant" ["StarColorPenLeo"]]
      ["プリキュア！", "しし座！", "ミルキー・ショック！"]
  , mkPurification
      ["CureMilky"]
      [mkIA "StarColorPendant" ["StarColorPenGemini"]]
      ["プリキュア！", "ふたご座！", "ミルキー・ショック！"]

  , mkPurification
      ["CureSoleil"]
      [mkIA "StarColorPendant" ["StarColorPenLibra"]]
      ["プリキュア！", "てんびん座！", "ソレイユ・シュート！"]
  , mkPurification
      ["CureSoleil"]
      [mkIA "StarColorPendant" ["StarColorPenScorpius"]]
      ["プリキュア！", "さそり座！", "ソレイユ・シュート！"]
  , mkPurification
      ["CureSoleil"]
      [mkIA "StarColorPendant" ["StarColorPenVirgo"]]
      ["プリキュア！", "おとめ座！", "ソレイユ・シュート！"]

  , mkPurification
      ["CureSelene"]
      [mkIA "StarColorPendant" ["StarColorPenCapricorn"]]
      ["プリキュア！", "やぎ座！", "セレーネ・アロー！"]
  , mkPurification
      ["CureSelene"]
      [mkIA "StarColorPendant" ["StarColorPenSagittarius"]]
      ["プリキュア！", "いて座！", "セレーネ・アロー！"]
  , mkPurification
      ["CureSelene"]
      [mkIA "StarColorPendant" ["StarColorPenAquarius"]]
      ["プリキュア！", "みずがめ座！", "セレーネ・アロー！"]

  , mkPurification
      groupMembers1
      ["TwinkleStick"]
      [ "宇宙（そら）に輝け！イマジネーションの力！"
      , "トゥインクルステッキ！"
      , "スター☆トゥインクル！"
      , "ミルキー☆トゥインクル！"
      , "ソレイユ☆トゥインクル！"
      , "セレーネ☆トゥインクル！"
      , "四つの輝きを！今、一つに！"
      , "プリキュア！サザンクロス・ショット！"
      ]

  , mkPurification ["CureCosmo"] [mkIA "RainbowPerfume" ["StarColorPenTaurus"]] $ rainbowPerfumeOfConstellation "おうし"
  , mkPurification ["CureCosmo"] [mkIA "RainbowPerfume" ["StarColorPenAries"]] $ rainbowPerfumeOfConstellation "おひつじ"
  , mkPurification ["CureCosmo"] [mkIA "RainbowPerfume" ["StarColorPenLeo"]] $ rainbowPerfumeOfConstellation "しし"
  , mkPurification ["CureCosmo"] [mkIA "RainbowPerfume" ["StarColorPenGemini"]] $ rainbowPerfumeOfConstellation "ふたご"
  , mkPurification ["CureCosmo"] [mkIA "RainbowPerfume" ["StarColorPenLibra"]] $ rainbowPerfumeOfConstellation "てんびん"
  , mkPurification ["CureCosmo"] [mkIA "RainbowPerfume" ["StarColorPenScorpius"]] $ rainbowPerfumeOfConstellation "さそり"
  , mkPurification ["CureCosmo"] [mkIA "RainbowPerfume" ["StarColorPenVirgo"]] $ rainbowPerfumeOfConstellation "おとめ"
  , mkPurification ["CureCosmo"] [mkIA "RainbowPerfume" ["StarColorPenCapricorn"]] $ rainbowPerfumeOfConstellation "やぎ"
  , mkPurification ["CureCosmo"] [mkIA "RainbowPerfume" ["StarColorPenSagittarius"]] $ rainbowPerfumeOfConstellation "いて"
  , mkPurification ["CureCosmo"] [mkIA "RainbowPerfume" ["StarColorPenAquarius"]] $ rainbowPerfumeOfConstellation "みずがめ"

  , mkPurification
      groupMembersTwinkleStyle
      ["ShinyTwinklePen"]
      [ "星の力～！輝くフゥワ〜！"
      , "思いを重ねて！"
      , "プリキュア！スタートゥインクル・イマジネーション！"
      ]
  ]


nonItemPurifications :: [NonItemPurification]
nonItemPurifications =
  [ mkNonItemPurification ["CureStar"]   ["プリキュア！", "スター・パンチ！"]
  , mkNonItemPurification ["CureMilky"]  ["プリキュア！", "ミルキー・ショック！"]
  , mkNonItemPurification ["CureSoleil"] ["プリキュア！", "ソレイユ・シュート！"]
  , mkNonItemPurification ["CureSelene"] ["プリキュア！", "セレーネ・アロー！"]
  , mkNonItemPurification ["CureCosmo"]  ["プリキュア！", "コスモ・シャイニング！"]
  ]

groupMembers1 :: IsString s => [s]
groupMembers1 = ["CureStar", "CureMilky", "CureSoleil", "CureSelene"]

groupMembers2 :: IsString s => [s]
groupMembers2 = groupMembers1 ++ ["CureCosmo"]

groupMembersTwinkleStyle :: IsString s => [s]
groupMembersTwinkleStyle = ["CureStar_TwinkleStyle", "CureMilky_TwinkleStyle", "CureSoleil_TwinkleStyle", "CureSelene_TwinkleStyle", "CureCosmo_TwinkleStyle"]

starColorPendantColorCharge = ["スターカラーペンダント！", "カラーチャージ！"]

transformationSong =
  [ "きーらーめーくー♪"
  , "ほーしーの力でー♪"
  , "あこがーれのー♪"
  , "わーたーし描くよー♪"
  , "トゥインクル♪トゥインクルプリキュア♪"
  , "トゥインクル♪トゥインクルプリキュア♪"
  , "トゥインクル♪トゥインクルプリキュア♪"
  , "スター☆トゥインクル♪"
  , "スター☆トゥインクルプリキュアー♪ ああー♪"
  ]

introducesHerselfAs_CureStar =
  "宇宙に輝くー！キラキラ星！キュアスター！"

introducesHerselfAs_CureMilky =
  "天にあまねくー！ミルキーウェイ！キュアミルキー！"

introducesHerselfAs_CureSoleil =
  "宇宙を照らす！灼熱の、きらめき！キュアソレイユ！"

introducesHerselfAs_CureSelene =
  "夜空に輝く！神秘の、月あかり！キュアセレーネ！"

introducesHerselfAs_CureCosmo =
  "銀河に光る！虹色の、スペクトル！キュアコスモ！"

rainbowPerfumeOfConstellation constellation =
  [ "レインボーパフューム！行くニャン♡"
  , "プリンセススターカラーペン！" ++ constellation ++ "座！"
  , "クルクルチャージ！"
  , "プリキュア！レインボー・スプラッシュ！"
  ]

twinkleStyleEn = "Twinkle Style"

twinkleStyle = "トゥインクルスタイル"
