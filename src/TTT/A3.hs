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

getDiag1 :: [[a]] -> [a]
getDiag1 [] = []
getDiag1 ([]:_) = []
getDiag1 ((x : xs): xss) = x : getDiag1 (map tail xss)


getDiag2 :: [[a]] -> [a]
getDiag2 [] = []
getDiag2 ([]:_) = []
getDiag2 newList 
    | length newList < 3 = [] 
    | length index /= length newList = [] 
    | otherwise = zipWith (\x i -> x !! i) newList index 
  where 
    index = [2, 1, 0] 


getAllLines :: [[a]] -> [[a]]
getAllLines board = rows ++ columbs ++ diagonals
  where
    rows = board
    columbs = transpose board
    diagonals = [getDiag1 board, getDiag2 board]

-- Q#07

putSquare :: Player -> Board -> Move -> Board
putSquare _ [] _ = [] 
putSquare player (row:restRows) (moveRow, moveCol)
  | moveRow == 0 = replaceSquareInRow player moveCol row : restRows
  | otherwise = row : putSquare player restRows (moveRow - 1, moveCol)


-- Q#08

prependRowIndices :: [String] -> [String]
prependRowIndices inputStrings = worker (indexRowStrings inputStrings)
  where
    worker :: [(Char, String)] -> [String]
    worker [] = []  
    worker ((indexChar, str):pairs) = (indexChar : str) : worker pairs



-- Q#09

isWinningLine :: Player -> Line -> Bool
isWinningLine _ [] = False 
isWinningLine player line = worker False line
  where
    worker :: Bool -> Line -> Bool
    worker acc [] = acc 
    worker acc (square:rest)
      | square == player = worker True rest
      | otherwise = False 


-- Q#10

isValidMove :: Board -> Move -> Bool
isValidMove board move
  | not (isMoveInBounds move) = False
  | otherwise = worker board move
  where
    worker :: Board -> Move -> Bool
    worker [] _ = False  -- Base case: empty board
    worker (row:restRows) (moveRow, moveCol)
      | moveRow == 0 = isColEmpty row moveCol && head row == Zs
      | otherwise = worker restRows (moveRow - 1, moveCol)