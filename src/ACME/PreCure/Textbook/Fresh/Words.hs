{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module ACME.PreCure.Textbook.Fresh.Words where

import           Data.List (intercalate)


groupName_Fresh = "フレッシュプリキュア！"

girlName_Love    = "桃園ラブ"
girlName_Miki    = "蒼乃美希"
girlName_Inori   = "山吹祈里"
girlName_Setsuna = "東せつな"

cureName_Peach   = "キュアピーチ"
cureName_Berry   = "キュアベリー"
cureName_Pine    = "キュアパイン"
cureName_Passion = "キュアパッション"

introducesHerselfAs_Peach   = "ピンクのハートは愛ある印！\nもぎたてフレッシュ、キュアピーチ！"
introducesHerselfAs_Berry   = "ブルーのハートは希望の印！\nつみたてフレッシュ、キュアベリー！"
introducesHerselfAs_Pine    = "イエローハートは祈りの印！\nとれたてフレッシュ、キュアパイン！"
introducesHerselfAs_Passion = "真っ赤なハートは幸せの証！\nうれたてフレッシュ、キュアパッション！"

beatUp = "チェインジ！プリキュア・ビートアップ！"

-- https://www.youtube.com/watch?v=IljAwH4jzFU
-- https://www.youtube.com/watch?v=XRAQPWccIZk
transformationSpeech_Peach   = beatUp ++ "\n" ++ introducesHerselfAs_Peach
transformationSpeech_Berry   = beatUp ++ "\n" ++ introducesHerselfAs_Berry
transformationSpeech_Pine    = beatUp ++ "\n" ++ introducesHerselfAs_Pine
transformationSpeech_Passion = beatUp ++ "\n" ++ introducesHerselfAs_Passion

-- https://www.youtube.com/watch?v=t8sKE4SrEkU
transformationSpeech_Fresh =
  intercalate "\n"
    [ beatUp
    , introducesHerselfAs_Peach
    , introducesHerselfAs_Berry
    , introducesHerselfAs_Pine
    , introducesHerselfAs_Passion
    , "レッツ・プリキュア！"
    ]

-- https://www.youtube.com/watch?v=m0vnBI60VZ4
purificationSpeech_Peach   = "悪いの悪いの飛んでいけ！\nプリキュア！ラブ・サンシャイン！"
purificationSpeech_Berry   = "悪いの悪いの飛んでいけ！\nプリキュア！エスポワール・シャワー！"
purificationSpeech_Pine    = "悪いの悪いの飛んでいけ！\nプリキュア！ヒーリング・プレアー！"

purificationSpeech_Peach_Fresh =
  intercalate "\n"
    [ "届け！愛のメロディ！"
    , "キュアスティック・ピーチロッド！"
    , "悪いの悪いの飛んでいけ！"
    , "プリキュア！ラブサンシャイン・フレッシュ！"
    ]
purificationSpeech_Berry_Fresh =
  intercalate "\n"
    [ "響け！希望のリズム！"
    , "キュアスティック・ベリーソード！"
    , "悪いの悪いの飛んでいけ！"
    , "プリキュア！エスポワールシャワー・フレッシュ！"
    ]

-- https://www.youtube.com/watch?v=ILDYtMvlW9g
purificationSpeech_Pine_Fresh =
  intercalate "\n"
    [ "癒せ！祈りのハーモニー！"
    , "キュアスティック・パインフルート！"
    , "悪いの悪いの飛んでいけ！"
    , "プリキュア！ヒーリングプレアー・フレッシュ！"
    ]

-- https://www.youtube.com/watch?v=ec990NE_ooU
purificationSpeech_Passion =
  intercalate "\n"
    [ "歌え！幸せのラプソディ、パッションハープ！"
    , "吹き荒れよ、幸せの嵐！"
    , "プリキュア！ハピネス・ハリケーン！"
    ]

-- https://www.youtube.com/watch?v=y8_ogPmNCV8
purificationSpeech_Fresh =
  intercalate "\n"
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
