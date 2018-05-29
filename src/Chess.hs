module Chess where

import Data.Char (isUpper)

import Control.Monad (join)

type Column = Int

type Row = Char

type OccupierId = Char

type ShownBoard = [String]

type ReadBoard = [Square]

type Board = ReadBoard

data Square = Square { 
    column :: Column, 
    row :: Row,
    occupier :: Maybe Piece,
    color :: Color
}
    deriving Show

data PieceType = Pawn | Knight | Bishop | Rook | Queen | King deriving Show

data Color = White | Black deriving Show

data Piece = Piece Color PieceType OccupierId deriving Show

boxesPerRow :: Int
boxesPerRow = 8

validPieceIds :: String
validPieceIds = "pnbrqk"

emptySquareId :: Char
emptySquareId = '.'

defaultShownBoard :: [String]
defaultShownBoard = [
    "rbnqknbr",
    "pppppppp",
    "........",
    "........",
    "........",
    "........",
    "pppppppp",
    "rbnqknbr"
    ]

oIdAndPieceTypeLookup :: [(Char, PieceType)]
oIdAndPieceTypeLookup = [
    ('p', Pawn),
    ('n', Knight),
    ('b', Bishop),
    ('r', Rook),
    ('q', Queen),
    ('k', King)
    ]

isValidPieceId :: OccupierId -> Bool
isValidPieceId oId = elem oId validPieceIds

getColorFromOId :: OccupierId -> Color
getColorFromOId oId = if isUpper oId then Black else White

getPieceTypeByOId :: OccupierId -> Maybe PieceType
getPieceTypeByOId oId = lookup oId oIdAndPieceTypeLookup 

fromShownBoard :: ShownBoard -> ReadBoard
fromShownBoard = undefined

fromOccupierId :: OccupierId -> Maybe Piece
fromOccupierId oId = 
    if not $ isValidPieceId oId then Nothing
    else 
        maybe Nothing (\x -> Just $ Piece (getColorFromOId oId) x oId) (getPieceTypeByOId oId) 

-- toOccupierId :: Maybe Piece -> Char
-- toOccupierId piece = maybe '.' (fmap \{_ _ _ oId} -> oId) piece

