module Square where

import Piece (Piece)
import RenderNotation (RenderNoteId, validRenderNotation)

type SquareColumn = Int -- Board column - one of [1..8]
type SquareRow = Char -- Board row - one of [A..H]

data SquareColor = SquareBlack | SquareWhite deriving Show

data Square = Square {
    squareColumn :: SquareColumn,
    squareRow :: SquareRow,
    squareOccupier :: Maybe Piece,
    squareColor :: SquareColor,
    squareRenderId :: RenderNoteId,  -- One of 'pbknqr.'
    squareAlgebraicId :: [Char] -- Algebraic notation for square;  E.g. 'A1, B2, E7, etc.'
}
    deriving Show

squareFromRenderNoteId :: RenderNoteId -> SquareColumn -> SquareRow -> SquareColor -> Square
squareFromRenderNoteId renderNoteId col row sqColor = undefined
