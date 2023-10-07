module TTT.A1 where

import Data.Char (toUpper)
import Foreign (toBool)

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

data Square

-- Q#07

data GameState

-- Q#08

-- Q#09

getFirstPlayer = undefined

getFirstPlayer_ = undefined

-- Q#10

showGameState = undefined

-- Q#11

switchPlayer = undefined

-- Q#12

showSquare = undefined