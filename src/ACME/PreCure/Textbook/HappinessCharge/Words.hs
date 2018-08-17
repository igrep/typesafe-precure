{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module ACME.PreCure.Textbook.HappinessCharge.Words where

groupName_HappinessCharge = "ハピネスチャージプリキュア！"

girlName_Megumi = "愛乃 めぐみ"
girlName_Hime   = "白雪 ひめ (ヒメルダ・ウインドウ・キュアクイーン・オブ・ザ・ブルースカイ)"
girlName_Yuko   = "大森 ゆうこ"
girlName_Iona   = "氷川 いおな"

cureName_Lovely   = "キュアラブリー"
cureName_Princess = "キュアプリンセス"
cureName_Honey    = "キュアハニー"
cureName_Fortune  = "キュアフォーチュン"

-- TODO Add more forms of HappinessCharge PreCure
variation_InnocentForm = "イノセントフォーム"

-- https://www.youtube.com/watch?v=gcLBpRlMly8
introducesHerselfAs_Lovely   = "世界に広がる、ビッグな愛！ キュアラブリー！"
introducesHerselfAs_Princess = "天空に舞う、蒼き風！ (ヒュッ！) キュアプリンセス！"
introducesHerselfAs_Honey    = "大地に実る、命の光！ キュアハニー！"
introducesHerselfAs_Fortune  = "夜空に煌めく、希望の星！ キュアフォーチュン！"

kawarunrun = "(かわルンルン！)"
mirrorChange  = "プリキュア！くるりんミラーチェーンジ！"
mirrorChange' = "プリキュア！くるりんミラーチェンジ！"
starSymphony  = "プリキュア！きらりんスターシンフォニー！"

-- https://www.youtube.com/watch?v=yVDBhXPNK5M
transformationSpeech_Lovely   = [kawarunrun, mirrorChange, introducesHerselfAs_Lovely]
transformationSpeech_Princess = [kawarunrun, mirrorChange', introducesHerselfAs_Princess]
transformationSpeech_Honey    = [kawarunrun, mirrorChange, introducesHerselfAs_Honey]
transformationSpeech_Fortune  = [kawarunrun, starSymphony, introducesHerselfAs_Fortune]

transformationSpeech_Lovely_Princess =
    [ kawarunrun
    , mirrorChange
    , introducesHerselfAs_Lovely
    , introducesHerselfAs_Princess
    , "ハピネス注入！幸せチャージ！"
    , "ハピネスチャージプリキュア！"
    ]

-- https://www.youtube.com/watch?v=tlfGXy5Jsvw
transformationSpeech_Lovely_Princess_Honey =
    [ kawarunrun
    , mirrorChange
    , introducesHerselfAs_Lovely
    , introducesHerselfAs_Princess
    , introducesHerselfAs_Honey
    , "ハピネス注入！幸せチャージ！"
    , "ハピネスチャージプリキュア！"
    ]

-- https://www.youtube.com/watch?v=LuNix0VtC5w&list=PLz2Gy-e060c4B5aHpdkjTJOFft5nhBHdl&index=5
transformationSpeech_HappinessCharge =
    [ kawarunrun
    , mirrorChange'
    , starSymphony
    , introducesHerselfAs_Lovely
    , introducesHerselfAs_Princess
    , introducesHerselfAs_Honey
    , introducesHerselfAs_Fortune
    , "ハピネス注入！幸せチャージ！"
    , "ハピネスチャージプリキュア！"
    ]

-- https://www.youtube.com/watch?v=_nHcTw_RBJM
transformationSpeech_HappinessCharge_InnocentForm =
    [ kawarunrun
    , mirrorChange'
    , starSymphony
    , "ハピネスチャージプリキュア！イノセントフォーム！"
    ]


-- https://www.youtube.com/watch?v=zYl0HeAGzG4
purificationSpeech_Lovely =
    [ "愛の光を聖なる力に！"
    , "ラブプリブレス！"
    , "プリキュア！ピンキーラブ・シュート！！"
    , "愛よ、天に返れ！"
    ]

-- https://www.youtube.com/watch?v=kZl2B7OHzjo
purificationSpeech_Princess =
    [ "勇気の光を聖なる力へ！"
    , "ラブプリブレス！"
    , "プリキュア！ブルーハッピー・シュート！！"
    , "勇気よ、天に返れ！"
    ]

-- https://www.youtube.com/watch?v=nvZ-ywR6NGM
purificationSpeech_Honey =
    [ "命の光を聖なる力へ！"
    , "ハニーバトン！"
    , "プリキュア！スパークリングバトンアタック！！"
    , "イエイ！"
    , "命よ、天に返れ！"
    ]

-- https://www.youtube.com/watch?v=vyVRx-G20vI
purificationSpeech_Fortune =
    [ "星の光を聖なる力に！"
    , "フォーチュン・タンバリン！"
    , "プリキュア！スターライト・アセンション！！"
    , "星よ、天に返れ！"
    ]

-- https://www.youtube.com/watch?v=_nHcTw_RBJM
purificationSpeech_HappinessCharge_InnocentForm =
    [ "(集まれ、ハピネスな気持ち！)"
    , "(高まれ、イノセントな思い！)"
    , "輝け！シャイニング・メイク・ドレッサー！"
    , "カタチなき愛求め♪"
    , "確かなその優しさ♪"
    , "色褪せない希望♪"
    , "奏でよう未来へ♪"
    , "勇気のカケラがひとつ♪"
    , "まだ見つからない♪"
    , "だけどきっと♪"
    , "イノセント♪ イノセント♪"
    , "小さな勇気 愛の光り 星の瞬き 尊き命♪"
    , "心を重ねて 響き合うメロディ♪"
    , "プリキュア！ イノセントプリフィケーション！"
    ]
