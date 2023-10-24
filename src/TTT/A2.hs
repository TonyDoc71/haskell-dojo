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

formatLine = undefined

-- Q#08

isMoveInBounds = undefined

-- Q#09

stringToMove = undefined

-- Q#10

replaceSquareInRow = undefined