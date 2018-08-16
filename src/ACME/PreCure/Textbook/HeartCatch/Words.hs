{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module ACME.PreCure.Textbook.HeartCatch.Words where

groupName_HeartCatch = "ハートキャッチプリキュア！"

girlName_Tsubomi = "花咲 つぼみ"
girlName_Erika   = "来海 えりか"
girlName_Itsuki  = "明堂院 いつき"
girlName_Yuri    = "月影 ゆり"

cureName_Blossom   = "キュアブロッサム"
cureName_Marine    = "キュアマリン"
cureName_Sunshine  = "キュアサンシャイン"
cureName_Moonlight = "キュアムーンライト"

variation_SuperBlossom   = "スーパーキュアブロッサム"
variation_SuperMarine    = "スーパーキュアマリン"
variation_SuperSunshine  = "スーパーキュアサンシャイン"
variation_SuperMoonlight = "スーパーキュアムーンライト"

variation_SuperSilhouette = "スーパーシルエット"

-- https://www.youtube.com/watch?v=gcLBpRlMly8
introducesHerselfAs_Blossom   = "大地に咲く一輪の花！ キュアブロッサム！"
introducesHerselfAs_Marine    = "海風に揺れる一輪の花！ キュアマリン！"
introducesHerselfAs_Sunshine  = "陽の光浴びる一輪の花！ キュアサンシャイン！"
introducesHerselfAs_Moonlight = "月光に冴える一輪の花！ キュアムーンライト！"

preCureSeed = "(プリキュアの種、いくですぅ！)"
openMyHeart = "プリキュア！オープンマイハート！"

transformationSpeech_Blossom   = [preCureSeed, openMyHeart, introducesHerselfAs_Blossom]
transformationSpeech_Marine    = [preCureSeed, openMyHeart, introducesHerselfAs_Marine]
transformationSpeech_Sunshine  = [preCureSeed, openMyHeart, introducesHerselfAs_Sunshine]
transformationSpeech_Moonlight = [openMyHeart, introducesHerselfAs_Moonlight]

transformationSpeech_HeartCatch =
    [ preCureSeed
    , openMyHeart
    , introducesHerselfAs_Blossom
    , introducesHerselfAs_Marine
    , introducesHerselfAs_Sunshine
    , introducesHerselfAs_Moonlight
    , "ハートキャッチ・プリキュア！"
    ]

-- https://www.youtube.com/watch?v=zpfoddTKS6U
transformationSpeech_HeartCatch_SuperSilhouette =
    [ "鏡よ鏡、プリキュアに力を！"
    , "世界に輝く一面の花！ ハートキャッチプリキュア！ スーパーシルエット！"
    ]


-- https://www.youtube.com/watch?v=zpfoddTKS6U
purificationSpeech_Blossom =
    [ "集まれ、花のパワー！"
    , "ブロッサム・タクト！"
    , "花よ輝け！"
    , "プリキュア！ピンクフォルテウェイブ！！"
    ]

-- https://www.youtube.com/watch?v=-kWxDb4kkpY
purificationSpeech_Marine =
    [ "集まれ、花のパワー！"
    , "マリン・タクト！"
    , "花よ煌めけ！"
    , "プリキュア！ブルーフォルテウェイブ！！"
    ]

-- https://www.youtube.com/watch?v=BOXWBXhj4K4
purificationSpeech_Sunshine =
    [ "集まれ、花のパワー！"
    , "シャイニー・タンバリン！"
    , "花よ、舞い踊れ！"
    , "プリキュア！ゴールドフォルテバースト！！"
    ]

-- https://www.youtube.com/watch?v=bprklJEuUBk
purificationSpeech_Moonlight =
    [ "集まれ、花のパワー！"
    , "ムーン・タクト！"
    , "花よ輝け！"
    , "プリキュア！シルバーフォルテウェイブ！！"
    ]

-- https://www.youtube.com/watch?v=s3Epi7ArY5A
purificationSpeech_HeartCatch_SuperSilhouette =
    [ "花よ、咲き誇れ！"
    , "プリキュア！ハートキャッチ・オーケストラ！！"
    ]
