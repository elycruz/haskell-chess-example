module Renderer where

import Square (Square( squareAlgebraicId, squareRenderId, squareColumn, squareRow ))
import Data.List (repeat, concat, concatMap, length, intercalate, intersperse)
import Control.Monad (join)

-- Characters for building borders of squares and grid

horizChar :: Char
horizChar = '-'

vertChar :: Char
vertChar = '|'

cornerChar :: Char
cornerChar = '+'

newLine :: Char
newLine = '\n'

leftRightPad :: Int
leftRightPad = 1

bordersLen :: Int
bordersLen = 2

outerLineSeparator :: Int -> [Char]
outerLineSeparator lineLen = 
    [newLine] ++ (take lineLen $ repeat horizChar) ++ [newLine]

innerLineSeparator  :: Int -> Int -> [Char]
innerLineSeparator lrPad containedCharLen = 
    [newLine, horizChar] ++ (
        intercalate [cornerChar] $
        take 8 $  
        repeat $ take (lrPad * 2 + containedCharLen) $ (repeat horizChar) 
    )
    ++ [horizChar, newLine]

renderBoardPositions :: [[Square]] -> [[Char]]
renderBoardPositions board = 
    let algebraicIdLen = 2

        -- Row separator
        lineSeparator = outerLineSeparator ((leftRightPad * 2 + algebraicIdLen + (div bordersLen 2)) * 8 + 1)
        
        -- Row separator with cell separators;  E.g., "+---+---+---+etc."
        lineSeparator1 = innerLineSeparator leftRightPad algebraicIdLen
    in 
        concatMap (\row -> [
            (
                if (squareRow $ row !! 0) == 8 then lineSeparator
                else ""
            ) ++
            (concatMap (\square -> (
                    (
                        if (squareColumn square) == 'A' then [vertChar]
                        else ""
                    ) ++
                    (take leftRightPad $ repeat ' ') ++
                    (squareAlgebraicId square) ++
                    (take leftRightPad $ repeat ' ') ++
                    [vertChar] ++ 
                    (
                        if (squareColumn square) == 'H' then
                            if (squareRow square) /= 1 then lineSeparator1
                            else lineSeparator
                        else ""
                    )
                    ) :: [Char]
                ) row)
            ]
        ) board

    
renderBoard :: [[Square]] -> [[Char]]
renderBoard board =
    let charToShowLen = 1
        -- Row separator
        lineSeparator = outerLineSeparator ((leftRightPad * 2 + charToShowLen + (div bordersLen 2)) * 8 + 1)
        
        -- Row separator cell separators;  E.g., "+---+---+---+etc."
        lineSeparator1 = innerLineSeparator leftRightPad 1
    in 
        concatMap (\row -> [
            (
                if (squareRow $ row !! 0) == 8 then lineSeparator
                else ""
            ) ++
            (concatMap (\square -> (
                    (
                        if (squareColumn square) == 'A' then [vertChar]
                        else ""
                    ) ++
                    (take leftRightPad $ repeat ' ') ++
                    ([squareRenderId square]) ++
                    (take leftRightPad $ repeat ' ') ++
                    [vertChar] ++ 
                    (
                        if (squareColumn square) == 'H' then
                            if (squareRow square) /= 1 then lineSeparator1
                            else lineSeparator
                        else ""
                    )
                    ) :: [Char]
                ) row)
            ]
        ) board
        