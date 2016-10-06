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
      (transform (Mirai, Riko) (Mofurun LinkleStoneDia)) `shouldBe` (Cure Miracle, Cure Magical)
