{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module ACME.PreCure.Textbook.Fresh.Words where


groupName_Fresh = "フレッシュプリキュア！"

girlName_Love    = "桃園ラブ"
girlName_Miki    = "蒼乃美希"
girlName_Inori   = "山吹祈里"
girlName_Setsuna = "東せつな"

cureName_Peach   = "キュアピーチ"
cureName_Berry   = "キュアベリー"
cureName_Pine    = "キュアパイン"
cureName_Passion = "キュアパッション"

introducesHerselfAs_Peach   = ["ピンクのハートは愛ある印！", "もぎたてフレッシュ、キュアピーチ！"]
introducesHerselfAs_Berry   = ["ブルーのハートは希望の印！", "つみたてフレッシュ、キュアベリー！"]
introducesHerselfAs_Pine    = ["イエローハートは祈りの印！", "とれたてフレッシュ、キュアパイン！"]
introducesHerselfAs_Passion = ["真っ赤なハートは幸せの証！", "うれたてフレッシュ、キュアパッション！"]

beatUp = "チェインジ！プリキュア・ビートアップ！"

-- https://www.youtube.com/watch?v=IljAwH4jzFU
-- https://www.youtube.com/watch?v=XRAQPWccIZk
transformationSpeech_Peach   = [beatUp] ++ introducesHerselfAs_Peach
transformationSpeech_Berry   = [beatUp] ++ introducesHerselfAs_Berry
transformationSpeech_Pine    = [beatUp] ++ introducesHerselfAs_Pine
transformationSpeech_Passion = [beatUp] ++ introducesHerselfAs_Passion

-- https://www.youtube.com/watch?v=t8sKE4SrEkU
transformationSpeech_Fresh =
  [beatUp]
    ++ introducesHerselfAs_Peach
    ++ introducesHerselfAs_Berry
    ++ introducesHerselfAs_Pine
    ++ introducesHerselfAs_Passion
    ++ ["レッツ・プリキュア！"]

-- https://www.youtube.com/watch?v=m0vnBI60VZ4
purificationSpeech_Peach   = ["悪いの悪いの飛んでいけ！", "プリキュア！ラブ・サンシャイン！"]
purificationSpeech_Berry   = ["悪いの悪いの飛んでいけ！", "プリキュア！エスポワール・シャワー！"]
purificationSpeech_Pine    = ["悪いの悪いの飛んでいけ！", "プリキュア！ヒーリング・プレアー！"]

purificationSpeech_Peach_Fresh =
    [ "届け！愛のメロディ！"
    , "キュアスティック・ピーチロッド！"
    , "悪いの悪いの飛んでいけ！"
    , "プリキュア！ラブサンシャイン・フレッシュ！"
    ]
purificationSpeech_Berry_Fresh =
    [ "響け！希望のリズム！"
    , "キュアスティック・ベリーソード！"
    , "悪いの悪いの飛んでいけ！"
    , "プリキュア！エスポワールシャワー・フレッシュ！"
    ]

-- https://www.youtube.com/watch?v=ILDYtMvlW9g
purificationSpeech_Pine_Fresh =
    [ "癒せ！祈りのハーモニー！"
    , "キュアスティック・パインフルート！"
    , "悪いの悪いの飛んでいけ！"
    , "プリキュア！ヒーリングプレアー・フレッシュ！"
    ]

-- https://www.youtube.com/watch?v=ec990NE_ooU
purificationSpeech_Passion =
    [ "歌え！幸せのラプソディ、パッションハープ！"
    , "吹き荒れよ、幸せの嵐！"
    , "プリキュア！ハピネス・ハリケーン！"
    ]

-- https://www.youtube.com/watch?v=y8_ogPmNCV8
purificationSpeech_Fresh =
    [ "クローバーボックスよ、私達に力を貸して！"
    , "プリキュア・フォーメーション！レディー・ゴー!"
    , "ハピネスリーフ、セット！"
    , "パイン！"
    , "プラスワン、プレアーリーフ！"
    , "ベリー！"
    , "プラスワン、エスポワールリーフ！"
    , "ピーチ！"
    , "プラスワン、ラブリーリーフ！"
    , "ラッキークローバー・グランドフィナーレ！"
    ]
