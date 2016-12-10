module ACME.PreCureSpec
  ( main
  , spec
  ) where


import           Test.Hspec

import           ACME.PreCure
import           ACME.PreCure.Textbook.First.Words


main :: IO ()
main = hspec spec


spec :: Spec
spec = do
  let specialForm = (CureMiracle_OverTheRainbow, CureMagical_OverTheRainbow, CureFelice_OverTheRainbow)

  describe "transformedStyle" $ do
    it "returns transformed precure" $ do
      (transformedStyle (Mirai, Liko) (Mofurun LinkleStoneDia)) `shouldBe` (CureMiracle, CureMagical)

    it "some precures can transform into special form" $ do
      (transformedStyle (CureMiracle, CureMagical, CureFelice) (Mofurun LinkleStoneAlexandrite, LinkleSmarthon LinkleStoneAlexandrite)) `shouldBe` specialForm

  describe "transformationSpeech" $ do
    it "returns group transformation speech of the pair" $ do
      (transformationSpeech (Mirai, Liko) (Mofurun LinkleStoneDia)) `shouldBe` ["キュアップ・ラパパ！　ダイヤ！", "ミラクル・マジカル・ジュエリーレ！", "ふたりの奇跡！キュアミラクル！", "ふたりの魔法！キュアマジカル！", "魔法つかいプリキュア！！"]

    it "returns group transformation speech with alexandrite" $ do
      (transformationSpeech (CureMiracle, CureMagical, CureFelice) (Mofurun LinkleStoneAlexandrite, LinkleSmarthon LinkleStoneAlexandrite)) `shouldBe` ["キュアップ・ラパパ！　アレキサンドライト！", "魔法つかいプリキュア！　オーバー・ザ・レインボー！"]

  describe "purificationSpeech" $ do
    it "returns purification speech" $ do
      (purificationSpeech (CureMiracle, CureMagical) (Mofurun LinkleStoneDia, LinkleStick LinkleStoneDia)) `shouldBe` ["ダイヤ！永遠の輝きを私達の手に！", "フルフルリンクル！", "プリキュア！ダイヤモンド・エターナル！"]

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

  let action = do
        transform (Nagisa, Honoka) (CardCommune_Mepple, CardCommune_Mipple) $ \(CureBlack, CureWhite) -> do
          purifyWithoutItem (CureBlack, CureWhite)
          purify (CureBlack, CureWhite) RainbowBrace

  describe "composeEpisode" $ do
    it "returns accumulated lines" $ do
      let actual = composeEpisode action
          expected =
              transformationSpeech_Black_White
                ++ purificationSpeech_Black_White
                ++ purificationSpeech_Black_White_RainbowStorm
      actual `shouldBe` expected

  describe "printEpisodeWith" $ do
    it "prints lines by line" $ do
      printEpisodeWith (defaultEpisodeConfig { lineIntervalMicroSec = 300 * 1000 }) action
