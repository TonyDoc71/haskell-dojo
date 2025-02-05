module TTT.A2 where

import Data.List (intercalate)
import TTT.A1
import Text.Read (readMaybe)
import Control.Applicative (ZipList(ZipList))

-- Q#01    still need to complete??

playerToString :: Player -> String
playerToString X = "X"
playerToString O = "O"
playerToString Zs = "Zs"

promptPlayer player = concat [
  "Player ", playerToString player, "'s Turn: enter a row and column position"
  ]


-- Q#02

_RANGE_ :: [Int]
_RANGE_ = [0..2]

-- Q#03

isDigit :: Char -> Bool
isDigit c = elem c ['0'..'9']


readDigit :: Char -> Int
readDigit c
  | isDigit c = read [c]
  | otherwise = -1

-- Q#04


_EMPTY_ROW_ = replicate _SIZE_ Zs


_EMPTY_BOARD_ = replicate _SIZE_ _EMPTY_ROW_

-- Q#05




--type Board = [[Square]]


isTied :: Board -> Bool
isTied board = all (\row -> all (/= Zs) row) board


_TIED_BOARD_ :: Board
_TIED_BOARD_ = [
    [X, O, O]
  , [O, X, X]
  , [O, X, O]
  ]

-- Q#06


indexRowStrings :: [String] -> [(Char, String)]
indexRowStrings inputStrings = zipWith (\a b -> (a, b)) ['A'..] inputStrings




-- Q#07

formatLine :: [[Char]] -> [Char]
formatLine  x = _SEP_ ++ intercalate _SEP_ x ++ _SEP_



-- Q#08

isMoveInBounds :: (Int,Int) -> Bool
isMoveInBounds (x,y)
     | x < 0 ||  y < 0 = False
     | x < _SIZE_ &&  y < _SIZE_ = True
     | x >= _SIZE_ || y >= _SIZE_ = False


-- Q#09

stringToMove :: String -> Move
stringToMove [] = _INVALID_MOVE_
stringToMove [a,b] 
  | readDigit b >= 4 = _INVALID_MOVE_
  | convertRowIndex a >= 0 && readDigit b >= 1 = (convertRowIndex a, readDigit b)
  | otherwise = _INVALID_MOVE_
stringToMove _ = _INVALID_MOVE_

-- Q#10

replaceSquareInRow :: Player -> Int -> Row -> Row
replaceSquareInRow _ _ [] = [] 
replaceSquareInRow player col row
    | col >= 0 && col < length row =
        let (before, (_:after)) = splitAt col row  
        in before ++ [player] ++ after           
    | otherwise = row  

rsX :: Int -> Row -> Row
rsX = replaceSquareInRow X

rsO :: Int -> Row -> Row
rsO = replaceSquareInRow O