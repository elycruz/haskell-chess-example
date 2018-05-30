module Board where

import Data.Char (isUpper, toLower)
import RenderNotation (RenderNotation)
import Square (Square)

type Board = [Square]   -- Parsed in from 'render-notation'
type BoardRows = [RenderNotation]
type ShownBoard = String    -- Shown via 'show'

boardColumnIds :: [Char]
boardColumnIds = ['A'..'H']

boardRowIds :: [Int]
boardRowIds = [1..8]

squaresMultiplier :: Int
squaresMultiplier = 8

emptySquareRenderId :: Char
emptySquareRenderId = '.'

defaultShownBoard :: RenderNotation
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

fromRenderNotation :: RenderNotation -> Board
fromRenderNotation renderNotation = undefined

toRenderNotation :: Board -> RenderNotation
toRenderNotation board = undefined

toShownBoard :: Board -> ShownBoard
toShownBoard board = undefined

renderBoard :: Board -> ShownBoard
renderBoard = undefined
