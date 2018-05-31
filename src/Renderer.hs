module Renderer where

import Square (Square( squareAlgebraicId, squareColumn, squareRow ))
import Data.List (repeat, concat, concatMap, length, intercalate)
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
numLinesForHorizSep = (leftRightPad * 2 + algebraicIdLen) * 8 + 7

lineSeparator :: [Char]
lineSeparator = ((['+']++) $ (++['+', '\n']) $ (take (numLinesForHorizSep)) $ repeat horizChar)

renderBoardPositions :: [[Square]] -> [[Char]]
renderBoardPositions board = concatMap (\row -> [
        (if ((1 ==) $ squareRow $ (!!) row 0) then lineSeparator else ""),
        (concatMap (\square -> (
                (
                    if (==) (squareColumn square) 'A' then [vertChar]
                    else ""
                ) ++
                (take leftRightPad $ repeat ' ') ++
                (squareAlgebraicId square) ++
                (take leftRightPad $ repeat ' ') ++
                [vertChar] ++
                (
                    if (==) (squareColumn square) 'H' then ['\n']
                    else ""
                )) :: [Char]
            ) row),
        lineSeparator]
    ) board
