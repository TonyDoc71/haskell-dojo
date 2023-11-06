module TTT.A3 where

import Data.List (transpose)
import TTT.A1
import TTT.A2

-- Q#01

showInts :: [Int] -> [String]
showInts  [] = []
showInts (x:xs) = show x : showInts xs

_HEADER_ :: [Char]
_HEADER_  = " " ++ formatLine (showInts _RANGE_)

-- Q#02

showSquares :: [Square] -> [String]
showSquares [] = []
showSquares (x:xs) = playerToString x : showSquares xs

-- Q#03

formatRows :: [[Square]] -> [[Char]]
formatRows [] = []
formatRows (fr:frs) = combine fr : formatRows frs where 
  combine = formatLine . showSquares

-- Q#04

isColEmpty :: Row -> Int -> Bool
isColEmpty [] _ = False
isColEmpty (x:_) 0 = squareEmpty x
isColEmpty (_:xs) col = isColEmpty xs (col - 1)

squareEmpty :: Square -> Bool
squareEmpty Zs = True
squareEmpty _ = False


-- Q#05

dropFirstCol :: [[a]] -> [[a]]
dropFirstCol  df = [tail newList | newList <- df]

dropLastCol :: [[a]] -> [[a]]
dropLastCol dl = [init newList | newList <- dl]

-- Q#06

getDiag1 = undefined

getDiag2 = undefined

getAllLines = undefined

-- Q#07

putSquare = undefined

-- Q#08

prependRowIndices = undefined

-- Q#09

isWinningLine_ = undefined

-- Q#10

isValidMove = undefined