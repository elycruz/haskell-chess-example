module Piece where

import Data.Char (isUpper, toLower)
import RenderNotation (RenderNoteId, isValidPieceRenderNote)

data PieceType = Pawn | Knight | Bishop | Rook | Queen | King deriving Show

data PieceColor = White | Black deriving Show

data Piece = Piece {
    pieceColor :: PieceColor,
    pieceType :: PieceType,
    pieceRenderId :: RenderNoteId
}
    deriving Show

renderNoteIdsAndPieceTypes :: [(RenderNoteId, PieceType)]
renderNoteIdsAndPieceTypes = [
    ('p', Pawn),
    ('n', Knight),
    ('b', Bishop),
    ('r', Rook),
    ('q', Queen),
    ('k', King)
    ]

isValidPieceId :: RenderNoteId -> Bool
isValidPieceId = isValidPieceRenderNote

getColorFromRenderNoteId :: RenderNoteId -> PieceColor
getColorFromRenderNoteId rId = if isUpper rId then Black else White

getPieceTypeByRenderNoteId :: RenderNoteId -> Maybe PieceType
getPieceTypeByRenderNoteId rId = lookup (toLower rId) renderNoteIdsAndPieceTypes

fromRenderNoteId :: RenderNoteId -> Maybe Piece
fromRenderNoteId rId =
    if ((isValidPieceId rId) == False) then Nothing
    else maybe
        Nothing
        (\_pieceType -> Just $ Piece{
            pieceColor=(getColorFromRenderNoteId rId),
            pieceType=_pieceType,
            pieceRenderId=rId
        })
        (getPieceTypeByRenderNoteId rId)

toRenderNoteId :: Maybe Piece -> RenderNoteId
toRenderNoteId maybePiece =
    maybe '.' (\piece -> pieceRenderId piece) maybePiece
