module Main where

import Data.List (intercalate)
import Board (fromRenderNotation, defaultShownBoard)
import Renderer (renderBoardPositions)

main :: IO ()
main = do
    putStrLn "\nBoard Positions"
    putStr $ concat $ renderBoardPositions
        $ fromRenderNotation defaultShownBoard
    return ()
