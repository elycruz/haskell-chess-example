module Main where

import Chess (renderBoard, fromRenderNotation, defaultShownBoard)

main :: IO ()
main = do
    putStr $ renderBoard $ fromRenderNotation defaultShownBoard
    return ()

