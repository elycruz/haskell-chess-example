module Square where

import Piece (toRenderNoteId, Piece, fromRenderNoteId)
import RenderNotation (RenderNoteId, validRenderNotation)

type SquareColumn = Char -- Board column - one of [1..8]
type SquareRow = Int -- Board row - one of [A..H]

data SquareColor = SquareBlack | SquareWhite deriving (Show, Eq)

data Square = Square {
    squareColumn :: Char,
    squareRow :: Int,
    squareOccupier :: Maybe Piece,
    squareColor :: SquareColor,
    squareRenderId :: RenderNoteId,  -- One of 'pbknqr.'
    squareAlgebraicId :: [Char] -- Algebraic notation for square;  E.g. 'A1, B2, E7, etc.'
}
    deriving Show

squareColorByEvenOdd :: Int -> SquareColor -> SquareColor -> SquareColor
squareColorByEvenOdd i a b
    | even i = a
    | otherwise = b

squareFromRenderNoteId :: RenderNoteId -> Char -> Int -> SquareColor -> Square
squareFromRenderNoteId renderNoteId column row color =
    Square {
        squareColumn = column,
        squareRow = row,
        squareOccupier = piece,
        squareColor = color,
        squareRenderId = toRenderNoteId piece,
        squareAlgebraicId = [column] ++ (show row)
        }
    where
        piece = fromRenderNoteId renderNoteId
