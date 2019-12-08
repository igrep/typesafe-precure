module ACME.PreCureSpec
  ( main
  , spec
  ) where


import           Test.Hspec

import           ACME.PreCure
import           ACME.PreCure.Monad


main :: IO ()
main = hspec spec


spec :: Spec
spec = do
  let specialForm = (CureMiracle_OverTheRainbow, CureMagical_OverTheRainbow, CureFelice_OverTheRainbow)

  describe "transformedStyle" $ do
    it "returns transformed precure" $
      transformedStyle (Mirai, Liko) (Mofurun LinkleStoneDia) `shouldBe` (CureMiracle, CureMagical)

    it "some precures can transform into special form" $
      transformedStyle (CureMiracle, CureMagical, CureFelice) (Mofurun LinkleStoneAlexandrite, LinkleSmarthon LinkleStoneAlexandrite) `shouldBe` specialForm

  describe "transformationSpeech" $ do
    it "returns group transformation speech of the pair" $
      transformationSpeech (Mirai, Liko) (Mofurun LinkleStoneDia) `shouldBe` ["キュアップ・ラパパ！　ダイヤ！", "ミラクル・マジカル・ジュエリーレ！", "ふたりの奇跡！キュアミラクル！", "ふたりの魔法！キュアマジカル！", "魔法つかいプリキュア！！"]

    it "returns group transformation speech with alexandrite" $
      transformationSpeech (CureMiracle, CureMagical, CureFelice) (Mofurun LinkleStoneAlexandrite, LinkleSmarthon LinkleStoneAlexandrite) `shouldBe` ["キュアップ・ラパパ！　アレキサンドライト！", "魔法つかいプリキュア！　オーバー・ザ・レインボー！"]

  describe "purificationSpeech" $
    it "returns purification speech" $
      purificationSpeech (CureMiracle, CureMagical) (Mofurun LinkleStoneDia, LinkleStick LinkleStoneDia) `shouldBe` ["ダイヤ！永遠の輝きを私達の手に！", "フルフルリンクル！", "プリキュア！ダイヤモンド・エターナル！"]

  describe "TransformedGroup" $ do
    describe "CureMagical, CureMiracle, and CureFelice" $ do
      it "are Maho Girls PreCure" $
        groupName (CureMiracle, CureMagical, CureFelice) `shouldBe` "魔法つかいプリキュア！"

      it "Their variation is dia style" $
        groupVariation (CureMiracle, CureMagical, CureFelice) `shouldBe` "ダイヤスタイル"

    describe "CureMagical, CureMiracle, and CureFelice (special form)" $ do
      it "are Maho Girls PreCure" $
        groupName specialForm `shouldBe` "魔法つかいプリキュア！"

      it "Their variation is over the raibow style" $
        groupVariation specialForm `shouldBe` "オーバー・ザ・レインボー"

  let action = do
        (CureBlack, CureWhite) <- transform (Nagisa, Honoka) (CardCommuneMepple, CardCommuneMipple)
        purifyWithoutItem (CureBlack, CureWhite)
        purify (CureBlack, CureWhite) RainbowBracelets

  describe "composeEpisode" $
    it "returns accumulated lines" $ do
      let actual = composeEpisode action
          expected =
              transformationSpeech (Nagisa, Honoka) (CardCommuneMepple, CardCommuneMipple)
                ++ nonItemPurificationSpeech (CureBlack, CureWhite)
                ++ purificationSpeech (CureBlack, CureWhite) RainbowBracelets
      actual `shouldBe` expected

  describe "printEpisodeWith" $
    it "prints lines by line" $
      printEpisodeWith (defaultEpisodeConfig { lineIntervalMicroSec = 300 * 1000 }) action
