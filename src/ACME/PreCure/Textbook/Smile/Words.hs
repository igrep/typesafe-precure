{-# OPTIONS_GHC -fno-warn-missing-signatures #-}

module ACME.PreCure.Textbook.Smile.Words where


groupName_Smile = "スマイルプリキュア！"

girlName_Miyuki = "星空 みゆき"
girlName_Akane  = "日野 あかね"
girlName_Yayoi  = "黄瀬 やよい"
girlName_Nao    = "緑川 なお"
girlName_Reika  = "青木 れいか"

cureName_Happy  = "キュアハッピー"
cureName_Sunny  = "キュアサニー"
cureName_Peace  = "キュアピース"
cureName_March  = "キュアマーチ"
cureName_Beauty = "キュアビューティー"

introducesHerselfAs_Happy  = "キラキラ輝く未来の光！ キュアハッピー！"
introducesHerselfAs_Sunny  = "太陽サンサン熱血パワー！ キュアサニー！"
introducesHerselfAs_Peace  = "ピカピカピカリン、ジャンケンポン！ キュアピース！"
introducesHerselfAs_March  = "勇気リンリン、直球勝負！ キュアマーチ！"
introducesHerselfAs_Beauty = "しんしんと降り積もる清き心！ キュアビューティ！"

smileCharge = ["(レディ？)", "プリキュア！スマイルチャージ！"]

-- https://www.youtube.com/watch?v=5kh14uGcgCs
transformationSpeech_Happy =
  smileCharge ++ ["(ゴー！ゴー！レッツ・ゴー！ハッピー！！)", introducesHerselfAs_Happy]
transformationSpeech_Sunny =
  smileCharge ++ ["(ゴー！ゴー！レッツ・ゴー！サニー！！)", introducesHerselfAs_Sunny]
transformationSpeech_Peace =
  smileCharge ++ ["(ゴー！ゴー！レッツ・ゴー！ピース！！)", introducesHerselfAs_Peace]
transformationSpeech_March =
  smileCharge ++ ["(ゴー！ゴー！レッツ・ゴー！マーチ！！)", introducesHerselfAs_March]
transformationSpeech_Beauty =
  smileCharge ++ ["(ゴー！ゴー！レッツ・ゴー！ビューティー！！)", introducesHerselfAs_Beauty]

-- https://www.youtube.com/watch?v=Guo_fReC6Gk
transformationSpeech_Smile =
    smileCharge
      ++ ["(ゴー！ゴー！レッツ・ゴー！)"]
      ++
        [ introducesHerselfAs_Happy
        , introducesHerselfAs_Sunny
        , introducesHerselfAs_Peace
        , introducesHerselfAs_March
        , introducesHerselfAs_Beauty
        ]
          ++ ["5つの光が導く未来！" , "輝け！スマイルプリキュア！"]

purificationSpeech_Happy  = ["プリキュア！ハッピー・シャワー！"]
purificationSpeech_Sunny  = ["プリキュア！サニー・ファイヤー！"]
-- https://www.youtube.com/watch?v=zbpEU6ma6Q0
purificationSpeech_Peace  = ["プリキュア！ピース・サンダー！"]
purificationSpeech_March  = ["プリキュア！マーチ・シュート！"]
purificationSpeech_Beauty = ["プリキュア！ビューティー・ブリザード！"]

variation_Smile_Princess = "プリキュア・プリンセス・フォーム"

variation_Happy_Princess  = "プリンセスハッピー"
variation_Sunny_Princess  = "プリンセスサニー"
variation_Peace_Princess  = "プリンセスピース"
variation_March_Princess  = "プリンセスマーチ"
variation_Beauty_Princess = "プリンセスビューティー" 

introducesHerselfAs_Happy_Princess = variation_Happy_Princess ++ "！"
introducesHerselfAs_Sunny_Princess = variation_Sunny_Princess ++ "！"
introducesHerselfAs_Peace_Princess = variation_Peace_Princess ++ "！"
introducesHerselfAs_March_Princess = variation_March_Princess ++ "！"
introducesHerselfAs_Beauty_Princess = variation_Beauty_Princess ++ "！"

transformationSpeech_Smile_Princess =
    [ "ペガサスよ！私たちに力を！"
    , introducesHerselfAs_Happy_Princess
    , introducesHerselfAs_Sunny_Princess
    , introducesHerselfAs_Peace_Princess
    , introducesHerselfAs_March_Princess
    , introducesHerselfAs_Beauty_Princess
    , "プリキュア・プリンセス・フォーム！"
    ]

-- https://www.youtube.com/watch?v=RK-vbzvShwE
purificationSpeech_Smile =
    [ "開け、ロイヤルクロック！"
    , "(みんなの力を1つにするクル！)"
    , "届け、希望の光！"
    , "はばたけ！光り輝く未来へ！"
    , "プリキュア！ロイヤル・レインボー・バースト！"
    , "輝け！ハッピースマイル！"
    ]
