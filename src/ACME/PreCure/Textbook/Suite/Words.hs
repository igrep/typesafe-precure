{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module ACME.PreCure.Textbook.Suite.Words where

groupName_Suite = "ハートキャッチプリキュア！"

girlName_Hibiki = "北条 響"
girlName_Kanade = "南野 奏"
girlName_Ellen  = "黒川 エレン"
girlName_Ako    = "調辺 アコ"


cureName_Melody = "キュアメロディ"
cureName_Rhythm = "キュアリズム"
cureName_Beat   = "キュアビート"
cureName_Muse   = "キュアミューズ"

-- https://www.youtube.com/watch?v=gcLBpRlMly8
introducesHerselfAs_Melody = "爪弾くは荒ぶる調べ！ キュアメロディー！"
introducesHerselfAs_Rhythm = "爪弾くはたおやかな調べ！ キュアリズム！"
introducesHerselfAs_Beat   = "爪弾くは魂の調べ！ キュアビート！"
introducesHerselfAs_Muse   = "爪弾くは女神の調べ！ キュアミューズ！"


modulation = "レッツプレイ！ プリキュア・モジュレーション！"

-- http://prettycure.wikia.com/wiki/Pretty_Cure#Suite_Pretty_Cure.E2.99.AA
resonateSuiteOfN :: Int -> String
resonateSuiteOfN n =
  "届け！" ++ show n ++ "人の組曲！ スイートプリキュア！"

-- https://www.youtube.com/watch?v=Awj263rFma0
transformationSpeech_Melody_Rhythm =
  [ modulation
  , introducesHerselfAs_Melody
  , introducesHerselfAs_Rhythm
  , resonateSuiteOfN 2
  ]
-- https://www.youtube.com/watch?v=pys-olfeXL8
transformationSpeech_Beat = [modulation, introducesHerselfAs_Beat]
-- https://www.youtube.com/watch?v=Cw7ds_UsCyA
transformationSpeech_Muse = [modulation, introducesHerselfAs_Muse]

-- https://www.youtube.com/watch?v=163dGbTWh3g
transformationSpeech_Melody_Rhythm_Beat =
  [ modulation
  , introducesHerselfAs_Melody
  , introducesHerselfAs_Rhythm
  , introducesHerselfAs_Beat
  , resonateSuiteOfN 3
  ]

-- https://www.youtube.com/watch?v=Y-9PB0D6_Lc
transformationSpeech_Suite =
  [ modulation
  , introducesHerselfAs_Melody
  , introducesHerselfAs_Rhythm
  , introducesHerselfAs_Beat
  , introducesHerselfAs_Muse
  , resonateSuiteOfN 4
  ]


-- https://www.youtube.com/watch?v=H5idj3Cp894
purificationSpeech_Melody =
  [ "(ミミ～！)"
  , "奏でましょう、奇跡のメロディー！ミラクル・ベルティエ！"
  , "おいで、ミリー！"
  , "(ミミ～！)"
  , "翔けめぐれ、トーンのリング！"
  , "プリキュア！ミュージックロンド！"
  , "三拍子！１、２、３"
  , "フィナーレ！"
  ]

-- https://www.youtube.com/watch?v=dmzuSVxB5vE
purificationSpeech_Rhythm =
  [ "(ファファ～！)"
  , "刻みましょう、大いなるリズム！ファンタスティック・ベルティエ！"
  , "おいで、ファリー！"
  , "(ファファ～！)"
  , "翔けめぐれ、トーンのリング！"
  , "プリキュア！ミュージックロンド！"
  , "三拍子！１、２、３"
  , "フィナーレ！"
  ]

-- https://www.youtube.com/watch?v=al6LzdWpfZU
purificationSpeech_Beat =
  [ "(ソソッ)"
  , "弾き鳴らせ、愛の魂！ラブギターロッド！"
  , "おいで、ソリー！"
  , "(ソソッ)"
  , "チェンジ！ソウルロッド！"
  , "翔けめぐれ、トーンのリング！"
  , "プリキュア！ハートフル・ビート・ロック！"
  , "三拍子！１、２、３"
  , "フィナーレ！"
  ]

-- https://www.youtube.com/watch?v=19MEQ1VcIOo
purificationSpeech_Muse =
  [ "おいで、シリー！"
  , "(シシ～)"
  , "「シ」の音符の、シャイニングメロディ！"
  , "プリキュア！スパーリング・シャワー！！"
  , "三拍子！１、２、３"
  , "フィナーレ！"
  ]

-- https://www.youtube.com/watch?v=QHjkhUVEaeY
purificationSpeech_Suite =
  [ "いでよ、すべての音の源よ！"
  , "届けましょう、希望のシンフォニー！"
  , "プリキュア！スイートセッションアンサンブル！"
  , "クレッシェンド！！"
  , "フィナーレ！"
  ]

