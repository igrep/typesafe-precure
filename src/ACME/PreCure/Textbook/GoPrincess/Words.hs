{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module ACME.PreCure.Textbook.GoPrincess.Words where

groupName_GoPrincess = "Go! プリンセスプリキュア！"

girlName_Haruka = "春野 はるか"
girlName_Minami = "海藤 みなみ"
girlName_Kirara = "天ノ川 きらら"
girlName_Towa   = "紅城 トワ"

cureName_Flora   = "キュアフローラ"
cureName_Mermaid = "キュアマーメイド"
cureName_Twinkle = "キュアトゥインクル"
cureName_Scarlet = "キュアスカーレット"

-- TODO Add more forms of Go! Princess PreCure
variation_ModeElegant = "モードエレガント"
variation_ModeElegantRoyal = "モードエレガント・ロイヤル"

introducesHerselfAs_Flora   = "咲き誇る、花のプリンセス！キュアフローラ！"
introducesHerselfAs_Mermaid = "澄み渡る、海のプリンセス！キュアマーメイド！"
introducesHerselfAs_Twinkle = "きらめく星のプリンセス！キュアトゥインクル！"
introducesHerselfAs_Scarlet = "深紅の炎のプリンセス！キュアスカーレット！"

princessEngage = "プリキュア！プリンセスエンゲージ！"
okakugo  = ["冷たい檻に閉ざされた夢、返していただきますわ！", "お覚悟はよろしくて？"]
-- From Ep. 23
okakugo' = ["冷たい檻に閉ざされた夢、返していただきますわ。", "お覚悟を決めなさい！"]

-- https://www.youtube.com/watch?v=L1DjtwIeQxk
transformationSpeech_Flora   = [princessEngage, introducesHerselfAs_Flora] ++ okakugo
transformationSpeech_Mermaid = [princessEngage, introducesHerselfAs_Mermaid] ++ okakugo
transformationSpeech_Twinkle = [princessEngage, introducesHerselfAs_Twinkle] ++ okakugo
-- https://www.youtube.com/watch?v=AcGs-uEkqHg
transformationSpeech_Scarlet = [princessEngage, introducesHerselfAs_Scarlet] ++ okakugo'

-- https://www.youtube.com/watch?v=3CeAisvfyOw
transformationSpeech_Flora_Mermaid_Twinkle =
    [ princessEngage
    , introducesHerselfAs_Flora
    , introducesHerselfAs_Mermaid
    , introducesHerselfAs_Twinkle
    , "つよく、やさしく、美しく！"
    , "Go! プリンセスプリキュア！"
    ]

-- https://www.youtube.com/watch?v=w3iMzceJc_o
transformationSpeech_GoPrincess =
    [ princessEngage
    , introducesHerselfAs_Flora
    , introducesHerselfAs_Mermaid
    , introducesHerselfAs_Twinkle
    , introducesHerselfAs_Scarlet
    , "つよく、やさしく、美しく！"
    , "Go! プリンセスプリキュア！"
    ]

transformationSpeech_GoPrincess_ModeElegant = ["エクスチェンジ！モードエレガント！"]

-- https://www.youtube.com/watch?v=IPBZXpJBMHU
transformationSpeech_GoPrincess_ModeElegantRoyal = ["モードエレガント・ロイヤル！", "ドレスアップ・ロイヤル！"]


-- https://www.youtube.com/watch?v=L1DjtwIeQxk
purificationSpeech_Flora = ["舞え、花よ！", "プリキュア！ フローラル・トルビヨン！" , "ごきげんよう。"]
purificationSpeech_Flora_Rose = ["ローズ！", "舞え、バラよ！", "プリキュア！ ローズ・トルビヨン！"]
purificationSpeech_Flora_Lily = ["リリィ！", "舞え、ユリよ！", "プリキュア！ リィス・トルビヨン！"]
purificationSpeech_Flora_Sakura = ["サクラ！", "舞え、サクラよ！", "プリキュア！ サクラ・トルビュランス！"]

-- https://www.youtube.com/watch?v=8lfG0iCSVPA
purificationSpeech_Mermaid = ["高鳴れ、海よ！", "プリキュア！ マーメイド・リップル！", "ごきげんよう。"]
purificationSpeech_Mermaid_Ice = ["アイス！", "高鳴れ、氷よ！", "プリキュア！ フローズン・リップル！"]
purificationSpeech_Mermaid_Bubble = ["バブル！", "高鳴れ、泡よ！", "プリキュア！ バブル・リップル！"]
purificationSpeech_Mermaid_Sango = ["サンゴ！", "高鳴れ、珊瑚よ！", "プリキュア！ コーラル・メイルシュトロム！"]

-- https://www.youtube.com/watch?v=p02w5AiO49s
purificationSpeech_Twinkle = ["キラキラ、星よ！", "プリキュア！ トゥインクル・ハミング！", "ごきげんよう。"]
purificationSpeech_Twinkle_Luna = ["ルナ！", "キラキラ、月よ！", "プリキュア！ フルムーン・ハミング！"]
purificationSpeech_Twinkle_ShootingStar = ["シューティングスター！", "キラキラ、流れ星よ！", "プリキュア！ ミーティア・ハミング！"]
purificationSpeech_Twinkle_Ginga = ["ギンガ！", "シャランラ、銀河よ！", "プリキュア！ ギャラクシー・コーラス！"]

-- https://www.youtube.com/watch?v=AcGs-uEkqHg
purificationSpeech_Scarlet_Phoenix =
    [ "スカーレット・バイオリン！フェニックス！"
    , "羽ばたけ炎の翼！"
    , "プリキュア！ フェニックス・ブレイズ！"
    , "ごきげんよう。"
    ]
purificationSpeech_Scarlet = ["たぎれ、炎よ！", "プリキュア！ スカーレット・フレイム！"]
purificationSpeech_Scarlet_Hanabi = ["ハナビ！", "燃えよ、炎よ！", "プリキュア！ スカーレット・イリュージョン！"]
purificationSpeech_Scarlet_Sun = ["サン！", "燃えよ、炎よ！", "プリキュア！ スカーレット・プロミネンス！"]

-- https://www.youtube.com/watch?v=IPBZXpJBMHU
purificationSpeech_GoPrincess_ModeElegantRoyal =
    [ "はっ！"
    , "響け！遙か彼方へ！"
    , "プリキュア！ グラン・プランタン！"
    , "ブルーミング"
    , "ごきげんよう。"
    ]
