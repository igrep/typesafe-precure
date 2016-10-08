module ACME.PreCureSpec
  ( main
  , spec
  ) where


import           Test.Hspec

import           ACME.PreCure
import qualified ACME.PreCure.Types.Transformed as T


main :: IO ()
main = hspec spec


spec :: Spec
spec = do
  describe "transform" $ do
    it "returns transformed precure" $ do
      (transform (Mirai, Riko) (Mofurun LinkleStoneDia)) `shouldBe` (Miracle, Magical)

  describe "transformationSpeech" $ do
    it "returns group transformation speech of the pair" $ do
      (T.transformationSpeech $ transform (Mirai, Riko) (Mofurun LinkleStoneDia)) `shouldBe` "キュアップ・ラパパ！　ダイヤ！\nミラクル・マジカル・ジュエリーレ！\nふたりの奇跡！キュアミラクル！\nふたりの魔法！キュアマジカル！\n魔法つかいプリキュア！！"
