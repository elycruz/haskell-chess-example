module Renderer where

import Square (Square( squareAlgebraicId, squareColumn ))
import Data.List (repeat, concat, concatMap, length)
import Control.Monad (join)

-- Characters for building borders of squares and grid

horizChar :: Char
horizChar = '-'

vertChar :: Char
vertChar = '|'

cornerChar :: Char
cornerChar = '+'

leftRightPad :: Int
leftRightPad = 1

algebraicIdLen = 2
additionalChars = 2 -- Left and right borders length

numLinesForHorizSep :: Int
numLinesForHorizSep = (leftRightPad * 2 + algebraicIdLen + additionalChars) * 8

renderBoard :: [[Square]] -> [[Char]]
renderBoard board =
    concat $ map (\row -> [(
            concatMap (\square -> (
                (
                    if (==) (squareColumn square) 'A' then [vertChar]
                    else ""
                ) ++
                (take leftRightPad $ repeat ' ') ++
                (squareAlgebraicId square) ++
                (take leftRightPad $ repeat ' ') ++
                [vertChar]) :: [Char]
            ) row
        ),
        (take numLinesForHorizSep $ repeat horizChar)]
    ) board
