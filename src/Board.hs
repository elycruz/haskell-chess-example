module Board where

import Data.List (genericIndex, lines, unlines)
import Data.Char (isUpper, toLower)
import RenderNotation (RenderNotation)
import Square (
    Square( squareRenderId ),
    SquareColor( SquareWhite, SquareBlack ),
    squareColorByEvenOdd,
    squareFromRenderNote
    )

type Board = [Square]   -- Parsed in from 'render-notation'
type BoardRows = [RenderNotation]
type ShownBoard = String    -- Shown via 'show'

boardColumnIds :: [Char]
boardColumnIds = ['A'..'H']

boardRowIds :: [Int]
boardRowIds = [8,7..1]

squaresMultiplier :: Int
squaresMultiplier = 8

emptySquareRenderId :: Char
emptySquareRenderId = '.'

defaultShownBoard :: String
defaultShownBoard = unlines [
    "RBNQKNBR",
    "PPPPPPPP",
    "........",
    "........",
    "........",
    "........",
    "pppppppp",
    "rbnqknbr"
    ]

fromRenderNotation1 :: String -> Int -> [[Square]]
fromRenderNotation1 renderNoteRows colorToggleModifier =
    map (\(row, rowNum) ->
        map (\(renderNote, colInd) ->
            let squareColor =
                    squareColorByEvenOdd
                        (colInd + rowNum + colorToggleModifier)
                        SquareBlack
                        SquareWhite
            in squareFromRenderNote
                renderNote
                (genericIndex boardColumnIds (colInd - 1))
                rowNum
                squareColor
        ) $ zip row (reverse boardRowIds)
    ) $ zip (lines renderNoteRows) boardRowIds

fromRenderNotation :: String -> [[Square]]
fromRenderNotation renderNotation = fromRenderNotation1 renderNotation 0

toRenderNotation :: [[Square]] -> RenderNotation
toRenderNotation board = unlines $ map (\row -> map squareRenderId row) board

toShownBoard :: Board -> ShownBoard
toShownBoard board = undefined
