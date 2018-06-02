module RenderNotation where

import Data.Char (toLower)

type RenderNote = Char -- Render notation symbol
type RenderNotation = [RenderNote]

-- 'p' - Pawn, 'b' - Bishop, etc..
validRenderNotes :: [RenderNote]
validRenderNotes = "pnbrqk."

-- All except last char ('.')
validPieceRenderNotes :: [RenderNote]
validPieceRenderNotes = init validRenderNotes

isValidRenderNote :: RenderNote -> Bool
isValidRenderNote x = elem (toLower x) validRenderNotes

isValidPieceRenderNote :: RenderNote -> Bool
isValidPieceRenderNote x = elem (toLower x) validPieceRenderNotes

-- Translations of symbols in `validRenderNotes`
-- 'p' - Pawn
-- 'n' - Knight
-- 'b' - Bishop
-- 'r' - Rook
-- 'q' - Queen
-- 'k' - King
