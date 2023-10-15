module TTT.A1 where

import Data.Char (toUpper)
import Foreign (toBool)
-- import TTT.A3 (getAllLines)

-- Q#01

_SIZE_ :: Int
_SIZE_ = 3

-- Q#02

_DISPLAY_LOGO_ :: Bool
_DISPLAY_LOGO_ = True

-- Q#03  

convertRowIndex :: Char -> Int
convertRowIndex indexRow = fromEnum (toUpper indexRow) - 65

-- Q#04 may need to change to Char -> Int like above since row column coordinate will probably be A B C

_INVALID_MOVE_ :: (Int,Int)
_INVALID_MOVE_ = (-1 , -1)

-- Q#05

_SEP_ :: [Char]
_SEP_ = ['_','|','_']

-- Q#06

data Square = X | O | Zs
  deriving (Show, Eq)

-- Q#07

data GameState = X_won | O_won | Tie | Still_Playing
  deriving (Show, Eq)


-- Q#08

type Player = Square
type Row = [Square]
type Line = [Square]
type Board = [Row]
type Move = (Int, Int)

-- Q#09

getFirstPlayer :: Bool -> Char
getFirstPlayer t = 
  if t == True
    then 'X'
    else if t == False
      then 'O'
      else 'X'


getFirstPlayer_ :: Bool -> Char
getFirstPlayer_  t
  | t == True = 'X'
  | t == False = 'O'
  | otherwise = 'X'



-- Q#10

showGameState :: GameState -> String
showGameState  t = case t of
  X_won -> "X Won the game!"
  O_won -> "O Won the game!"
  Tie   -> "The game was a tie!"
  Still_Playing    -> "Game in progress"


-- Q#11

switchPlayer :: Player -> Player
switchPlayer  X = O
switchPlayer O = X
switchPlayer Zs = Zs


-- Q#12

showSquare :: Square -> String
showSquare X = "X"
showSquare O = "O"
showSquare Zs = "_"