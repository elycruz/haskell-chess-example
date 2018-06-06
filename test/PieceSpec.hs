module PieceSpec (spec) where

import Test.Hspec
import Test.QuickCheck
import Control.Exception (evaluate)
import Control.Monad (liftM)
import Data.Maybe (isNothing)
import Data.List

import Piece (
  Piece, PieceType, renderNotesAndPieceTypes, fromRenderNote,
  pieceRenderId, pieceType
  )
import RenderNotation (validRenderNotes, validPieceRenderNotes)
import Data.Char (isLower, toLower, toUpper, isAlpha)
import Data.List

mixedCaseRenderNotes :: [Char]
mixedCaseRenderNotes = (validPieceRenderNotes ++ map toUpper validPieceRenderNotes)

spec :: Spec
spec = do
  describe "renderNotesAndPieceTypes" $ do
    it "all keys of notes map should be lowercase" $ do
      (all (\(renderNote, _) -> isLower renderNote) renderNotesAndPieceTypes) `shouldBe` True

    it "should contain all the same render-notes as Piece.validPieceRenderNotes" $ do
      (all (\(rn1, (rn2, _)) -> rn1 == rn2) $
        zip validPieceRenderNotes renderNotesAndPieceTypes) `shouldBe` True

  describe "fromRenderNote" $ do
    it "should return a piece for valid piece notes (piece should also contain said piece note)" $ do
      (all (\(maybePiece, (_renderNote, _pieceType)) ->
        maybe False (`const` False) $ liftM (\piece ->
            if (pieceRenderId piece) == _renderNote &&
            (pieceType piece) == _pieceType then True else False
          ) maybePiece
        ) $
        zip
          (fmap fromRenderNote validPieceRenderNotes)
          renderNotesAndPieceTypes
        )
      `shouldBe` True

    it "should return a `Nothing` for invalid render notes" $ do
      (all isNothing $ fmap fromRenderNote $
        (['A'..'Z'] ++ ['a'..'z']) \\ mixedCaseRenderNotes
        )
      `shouldBe` True

