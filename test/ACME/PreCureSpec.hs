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
  describe "transform" $ do
    it "returns transformed precure" $ do
      (transform (Mirai, Riko) (Mofurun LinkleStoneDia)) `shouldBe` (Miracle, Magical)

  describe "transformationSpeech" $ do
    it "returns group transformation speech of the pair" $ do
      (transformationSpeech (Mirai, Riko) (Mofurun LinkleStoneDia)) `shouldBe` "キュアップ・ラパパ！　ダイヤ！\nミラクル・マジカル・ジュエリーレ！\nふたりの奇跡！キュアミラクル！\nふたりの魔法！キュアマジカル！\n魔法つかいプリキュア！！"

  describe "purificationSpeech" $ do
    it "returns purification speech" $ do
      (purificationSpeech (Miracle, Magical) (Mofurun LinkleStoneDia, LinkleStick LinkleStoneDia)) `shouldBe` "ダイヤ！永遠の輝きを私達の手に！\nフルフルリンクル！\nプリキュア・ダイヤモンド・エターナル！"
