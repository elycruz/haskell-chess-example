import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

import RenderNotation (validRenderNotes, validPieceRenderNotes)
import Data.Char (isLower)

main :: IO ()
main = hspec $ do
  describe "Prelude.head" $ do
    it "returns the first element of a list" $ do
      head [23 ..] `shouldBe` (23 :: Int)

    it "returns the first element of an *arbitrary* list" $
      property $ \x xs -> head (x:xs) == (x :: Int)

    it "throws an exception if used with an empty list" $ do
      evaluate (head []) `shouldThrow` anyException

  describe "RenderNotation" $ do

    describe "validRenderNotes" $ do
        it "Should only contain lowercase characters (except for last character)" $
          and [
            (==) (last validRenderNotes) '.',
            (all isLower $ init validRenderNotes)
            ] `shouldBe` True

    describe "validPieceRenderNotes" $ do
        it "Should only contain lowercase characters" $
          all isLower validPieceRenderNotes `shouldBe` True


    describe "validPieceRenderNotes" $ do
        it "Should only contain lowercase characters" $
          all isLower validPieceRenderNotes `shouldBe` True
