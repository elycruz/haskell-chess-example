module Square where

import Piece (Piece, pieceRenderId, fromRenderNote)
import RenderNotation (RenderNote, validRenderNotes)

type SquareColumn = Char -- Board column - one of [1..8]
type SquareRow = Int -- Board row - one of [A..H]

data SquareColor = SquareBlack | SquareWhite deriving (Show, Eq)

data Square = Square {
    squareColumn :: Char,
    squareRow :: Int,
    squareOccupier :: Maybe Piece,
    squareColor :: SquareColor,
    squareRenderId :: RenderNote,  -- One of 'pbknqr.'
    squareAlgebraicId :: [Char] -- Algebraic notation for square;  E.g. 'A1, B2, E7, etc.'
}
    deriving Show

squareColorByEvenOdd :: Int -> SquareColor -> SquareColor -> SquareColor
squareColorByEvenOdd i a b
    | even i = a
    | otherwise = b

squareFromRenderNote :: RenderNote -> Char -> Int -> SquareColor -> Square
squareFromRenderNote renderNote column row color =
    Square {
        squareColumn = column,
        squareRow = row,
        squareOccupier = piece,
        squareColor = color,
        squareRenderId = maybe '.' pieceRenderId piece,
        squareAlgebraicId = [column] ++ (show row)
        }
    where
        piece = fromRenderNote renderNote
