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
  let specialForm = (CureMiracle_OverTheRainbow, CureMagical_OverTheRainbow, CureFelice_OverTheRainbow)

  describe "transform" $ do
    it "returns transformed precure" $ do
      (transform (Mirai, Liko) (Mofurun LinkleStoneDia)) `shouldBe` (CureMiracle, CureMagical)

    it "some precures can transform into special form" $ do
      (transform (CureMiracle, CureMagical, CureFelice) (Mofurun LinkleStoneAlexandrite, LinkleSmarthon LinkleStoneAlexandrite)) `shouldBe` specialForm

  describe "transformationSpeech" $ do
    it "returns group transformation speech of the pair" $ do
      (transformationSpeech (Mirai, Liko) (Mofurun LinkleStoneDia)) `shouldBe` "キュアップ・ラパパ！　ダイヤ！\nミラクル・マジカル・ジュエリーレ！\nふたりの奇跡！キュアミラクル！\nふたりの魔法！キュアマジカル！\n魔法つかいプリキュア！！"

    it "returns group transformation speech with alexandrite" $ do
      (transformationSpeech (CureMiracle, CureMagical, CureFelice) (Mofurun LinkleStoneAlexandrite, LinkleSmarthon LinkleStoneAlexandrite)) `shouldBe` "キュアップ・ラパパ！　アレキサンドライト！\n魔法つかいプリキュア！　オーバー・ザ・レインボー！"

  describe "purificationSpeech" $ do
    it "returns purification speech" $ do
      (purificationSpeech (CureMiracle, CureMagical) (Mofurun LinkleStoneDia, LinkleStick LinkleStoneDia)) `shouldBe` "ダイヤ！永遠の輝きを私達の手に！\nフルフルリンクル！\nプリキュア！ダイヤモンド・エターナル！"

  describe "TransformedGroup" $ do
    describe "CureMagical, CureMiracle, and CureFelice" $ do
      it "are Maho Girls PreCure" $ do
        groupName (CureMiracle, CureMagical, CureFelice) `shouldBe` "魔法つかいプリキュア！"

      it "Their variation is dia style" $ do
        groupVariation (CureMiracle, CureMagical, CureFelice) `shouldBe` "ダイヤスタイル"

    describe "CureMagical, CureMiracle, and CureFelice (special form)" $ do
      it "are Maho Girls PreCure" $ do
        groupName specialForm `shouldBe` "魔法つかいプリキュア！"

      it "Their variation is over the raibow style" $ do
        groupVariation specialForm `shouldBe` "オーバー・ザ・レインボー"
