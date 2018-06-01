import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)

import RenderNotation (
    RenderNote,
    validRenderNotes,
    validPieceRenderNotes,
    isValidPieceRenderNote,
    isValidRenderNote
    )
import Data.Char (isLower, toUpper, isAlpha)
import Data.List

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

    describe "isValidRenderNote" $ do
      it "Should return `true` when character passed in is a valid render note (case insensitive)" $
        (all isValidRenderNote $ (validRenderNotes ++ (map toUpper validRenderNotes))) `shouldBe` True

      it "Should return `false` when character passed in is an invalid render note (case insensitive)" $
          (all (not . isValidRenderNote) $ (
            (['A'..'Z'] ++ ['a'..'z']) \\
            filter isAlpha (validRenderNotes ++ (map toUpper validRenderNotes))
          ))
            `shouldBe` True

    describe "validPieceRenderNotes" $ do
      it "Should only contain lowercase characters" $
        all isLower validPieceRenderNotes `shouldBe` True

    describe "isValidPieceRenderNote" $ do
      it "Should return `true` when character passed in is a valid render note (case insensitive)" $
        (all isValidPieceRenderNote $ (validPieceRenderNotes ++ (map toUpper validPieceRenderNotes))) `shouldBe` True

      it "Should return `false` when character passed in is an invalid render note (case insensitive)" $
          (all (not . isValidPieceRenderNote) $ (
            (['A'..'Z'] ++ ['a'..'z']) \\
            (validPieceRenderNotes ++ (map toUpper validPieceRenderNotes))
          ))
            `shouldBe` True
