module Piece where

import Data.Char (isUpper, toLower)
import RenderNotation (RenderNote, isValidPieceRenderNote)

data PieceType = Pawn | Knight | Bishop | Rook | Queen | King deriving (Show, Eq)

data PieceColor = White | Black deriving (Show, Eq)

data Piece = Piece {
    pieceColor :: PieceColor,
    pieceType :: PieceType,
    pieceRenderId :: RenderNote
}
    deriving Show

renderNotesAndPieceTypes :: [(RenderNote, PieceType)]
renderNotesAndPieceTypes = [
    ('p', Pawn),
    ('n', Knight),
    ('b', Bishop),
    ('r', Rook),
    ('q', Queen),
    ('k', King)
    ]

getColorFromRenderNote :: RenderNote -> PieceColor
getColorFromRenderNote rId = if isUpper rId then Black else White

getPieceTypeByRenderNote :: RenderNote -> Maybe PieceType
getPieceTypeByRenderNote rId = lookup (toLower rId) renderNotesAndPieceTypes

fromRenderNote :: RenderNote -> Maybe Piece
fromRenderNote rId =
    if ((isValidPieceRenderNote rId) == False) then Nothing
    else maybe
        Nothing
        (\_pieceType -> Just $ Piece{
            pieceColor=(getColorFromRenderNote rId),
            pieceType=_pieceType,
            pieceRenderId=rId
        })
        (getPieceTypeByRenderNote rId)

toRenderNote :: Maybe Piece -> RenderNote
toRenderNote maybePiece =  maybe '.' pieceRenderId maybePiece
