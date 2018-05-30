module RenderNotation where

import Data.Char (toLower)

type RenderNote = Char -- Render notation symbol
type RenderNoteId = RenderNote -- Alias for notation symbol
type RenderNotation = [RenderNoteId]

-- 'p' - Pawn, 'b' - Bishop, etc..
validRenderNotation :: [RenderNote]
validRenderNotation = "pnbrqk."

-- All except last char ('.')
validPieceRenderNotation :: [RenderNote]
validPieceRenderNotation = init validRenderNotation

isValidRenderNote :: RenderNote -> Bool
isValidRenderNote x = elem (toLower x) validRenderNotation

isValidPieceRenderNote :: RenderNote -> Bool
isValidPieceRenderNote x = elem (toLower x) validPieceRenderNotation

-- Translations of symbols in `validRenderNotation`
-- 'p' - Pawn
-- 'n' - Knight
-- 'b' - Bishop
-- 'r' - Rook
-- 'q' - Queen
-- 'k' - King
