{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module ACME.PreCure.Textbook.Dokidoki.Words where


groupName_Dokidoki = "ドキドキ！プリキュア"

girlName_Mana   = "相田マナ"
girlName_Rikka  = "菱川六花"
girlName_Alice  = "四葉ありす"
girlName_Makoto = "剣崎真琴"
girlName_Aguri  = "円亜久里"

cureName_Heart   = "キュアハート"
cureName_Diamond = "キュアダイヤモンド"
cureName_Rosetta = "キュアロゼッタ"
cureName_Sword   = "キュアソード"
cureName_Ace     = "キュアエース"

introducesHerselfAs_Heart   = "みなぎる愛！ キュアハート！"
introducesHerselfAs_Diamond = "英知の光！ キュアダイヤモンド！"
introducesHerselfAs_Rosetta = "ひだまりポカポカ、キュアロゼッタ！"
introducesHerselfAs_Sword   = "勇気の刃！ キュアソード！"
introducesHerselfAs_Ace     = "愛の切り札！ キュアエース！"

loveLink = ["プリキュア！ラブリンク！", "(L! O! V! E!)"]
dressUp =  ["プリキュアドレスアップ！" , "(キュピラッパー！)"]

-- https://www.youtube.com/watch?v=aAQDqrN_EZI
transformationSpeech_Heart =
  ["(シャールルーン！)"] ++ loveLink ++ [introducesHerselfAs_Heart, "愛を無くした悲しいジコチューさん、このキュアハートが あなたのドキドキ 取り戻してみせる！"]
-- https://www.youtube.com/watch?v=Y8zh7aYhR5Q
transformationSpeech_Diamond =
  ["(ラケル！)"] ++ loveLink ++ [introducesHerselfAs_Diamond, "人の思いを踏みにじるなんて許せない、このキュアダイヤモンドが あなたの頭を冷やしてあげる！"]
-- https://www.youtube.com/watch?v=ToAhnZ3pVu4
transformationSpeech_Rosetta =
  ["(ラーンスー！)"] ++ loveLink ++ [introducesHerselfAs_Rosetta, "世界を制するのは愛だけです、さぁ、あなたも私と 愛を育んでくださいな"]
-- https://www.youtube.com/watch?v=weIHLwev5ZI
transformationSpeech_Sword =
  ["(ダビィー！)"] ++ loveLink ++ [introducesHerselfAs_Sword, "このキュアソードが 愛の剣で、あなたの野望を断ち切ってみせる！"]
-- https://www.youtube.com/watch?v=OxJI0yUR_GI
transformationSpeech_Ace =
  dressUp ++
    [ introducesHerselfAs_Ace
    , "美しさは正義の証し！"
    , "ウインク一つで、あなたのハートを射抜いて差し上げますわ！"
    ]

-- https://www.youtube.com/watch?v=DD8ylHEydBQ
transformationSpeech_Dokidoki_Heart_Diamond_Rosetta_Sword =
  ["(シャールルーン！)"] ++ loveLink ++
    [ introducesHerselfAs_Heart
    , introducesHerselfAs_Diamond
    , introducesHerselfAs_Rosetta
    , introducesHerselfAs_Sword
    , "響け愛の鼓動！ドキドキプリキュア！"
    ]

-- https://www.youtube.com/watch?v=qtVFBUNNfo4&list=PLz2Gy-e060c4rfoLomOWf9foSxXUGTJer&index=11
transformationSpeech_Dokidoki =
  ["(シャールルーン！)"] ++ loveLink ++ dressUp ++
    [ introducesHerselfAs_Heart
    , introducesHerselfAs_Diamond
    , introducesHerselfAs_Rosetta
    , introducesHerselfAs_Sword
    , introducesHerselfAs_Ace
    , "響け愛の鼓動！ドキドキプリキュア！"
    ]

-- https://www.youtube.com/watch?v=9V17voMJ9vg
purificationSpeech_Heart   = ["あなたに届け！マイ・スイート・ハート！"]
purificationSpeech_Diamond = ["煌めきなさい！トゥインクル・ダイヤモンド！"]
purificationSpeech_Rosetta = ["カッチカチの！ロゼッタ・ウォール！"]
purificationSpeech_Sword   = ["閃け！ホーリー・ソード！"]
-- https://www.youtube.com/watch?v=1BHlgN2abMk
purificationSpeech_Ace     = ["彩れ！ラブ・キッス・ルージュ！", "ときめきなさい！エースショット！", "ばきゅ〜ん！！"]

-- https://www.youtube.com/watch?v=1dcf6X3h13o
purificationSpeech_Dokidoki =
    [ "(キュピラッパー！)"
    , "プリキュア！ロイヤル・ラブリー・ストレート・フラッシュ！"
    ]
