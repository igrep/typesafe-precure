module ACME.PreCureSpec
  ( main
  , spec
  ) where


import           Test.Hspec

import           ACME.PreCure


main :: IO ()
main = hspec spec


spec :: Spec
spec = do
  let specialForm = (Miracle_OverTheRainbow, Magical_OverTheRainbow, Felice_OverTheRainbow)
      cureSpecialForm = (Cure Miracle_OverTheRainbow, Cure Magical_OverTheRainbow, Cure Felice_OverTheRainbow)

  describe "transform" $ do
    it "returns transformed precure" $ do
      (transform (Mirai, Liko) (Mofurun LinkleStoneDia)) `shouldBe` (Miracle, Magical)

    it "some precures can transform into special form" $ do
      (transform (Miracle, Magical, Felice) (Mofurun LinkleStoneAlexandrite, LinkleSmarthon LinkleStoneAlexandrite)) `shouldBe` specialForm

  describe "transformationSpeech" $ do
    it "returns group transformation speech of the pair" $ do
      (transformationSpeech (Mirai, Liko) (Mofurun LinkleStoneDia)) `shouldBe` "キュアップ・ラパパ！　ダイヤ！\nミラクル・マジカル・ジュエリーレ！\nふたりの奇跡！キュアミラクル！\nふたりの魔法！キュアマジカル！\n魔法つかいプリキュア！！"

    it "returns group transformation speech with alexandrite" $ do
      (transformationSpeech (Miracle, Magical, Felice) (Mofurun LinkleStoneAlexandrite, LinkleSmarthon LinkleStoneAlexandrite)) `shouldBe` "キュアップ・ラパパ！　アレキサンドライト！\n魔法つかいプリキュア！　オーバー・ザ・レインボー！"

  describe "purificationSpeech" $ do
    it "returns purification speech" $ do
      (purificationSpeech (Miracle, Magical) (Mofurun LinkleStoneDia, LinkleStick LinkleStoneDia)) `shouldBe` "ダイヤ！永遠の輝きを私達の手に！\nフルフルリンクル！\nプリキュア！ダイヤモンド・エターナル！"

  describe "TransformedGroup" $ do
    describe "Magical, Miracle, and Felice" $ do
      it "are PreCure" $ do
        (groupMembers :: (Miracle, Magical, Felice)) `shouldBe` (Miracle, Magical, Felice)

      it "are Maho Girls PreCure" $ do
        groupName (Miracle, Magical, Felice) `shouldBe` "魔法つかいプリキュア！"

      it "Their variation is dia style" $ do
        groupVariation (Miracle, Magical, Felice) `shouldBe` "ダイヤスタイル"

    describe "Magical, Miracle, and Felice (special form)" $ do
      it "are PreCure" $ do
        (groupMembers :: (Miracle_OverTheRainbow, Magical_OverTheRainbow, Felice_OverTheRainbow)) `shouldBe` specialForm

      it "are Maho Girls PreCure" $ do
        groupName specialForm `shouldBe` "魔法つかいプリキュア！"

      it "Their variation is over the raibow style" $ do
        groupVariation specialForm `shouldBe` "オーバー・ザ・レインボー"

    describe "Cure Magical, Cure Miracle, and Cure Felice" $ do
      it "are Maho Girls PreCure" $ do
        groupName (Cure Miracle, Cure Magical, Cure Felice) `shouldBe` "魔法つかいプリキュア！"

      it "Their variation is dia style" $ do
        groupVariation (Cure Miracle, Cure Magical, Cure Felice) `shouldBe` "ダイヤスタイル"

    describe "Cure Magical, Cure Miracle, and Cure Felice (special form)" $ do
      it "are Maho Girls PreCure" $ do
        groupName cureSpecialForm `shouldBe` "魔法つかいプリキュア！"

      it "Their variation is over the raibow style" $ do
        groupVariation cureSpecialForm `shouldBe` "オーバー・ザ・レインボー"
