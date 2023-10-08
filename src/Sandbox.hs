module Sandbox where
import Foreign (IntPtr)
import Text.Read (Lexeme(String))

hello = "Hello World!"

a :: [String]     
a = ["aaa","bbb","ccc","bbb"]
-- in termianl window head b will show the first
-- last will show the last
-- a !! 1   will show the second one
-- a !! 0   wil lshow the first



type Pname = String
type Pid = Int
type Pokemon = (Pname,Pid)

pikachu :: Pokemon
pikachu = ("Picachu", 25)
-- above example of Type Synonyms  ** not creating a new data types Pname Pid & Pokemon 
-- only for easy of reading**


data Trainer = Ash | Misty | Brock
  deriving Show
data Colour  = Red | Green | Blue
  deriving Show
data PokemonTypes = Bulbasaur | Charmander | Squirtle
  deriving Show
--  Bulbsaur will show as Type PokemonTypes if you put :t Bulbasaur into Terminal

b :: Colour 
b = Red

c :: PokemonTypes
c = Squirtle



d :: Float
d = 2.3
-- Float is a data Type for storing decimals

guardsTest :: String -> String
guardsTest e
  | e == "A" = "THE LETTER A"
  | e == "B" = "THE LETTER B"
  | e == "C" = "THE LETTER C"
  | otherwise = "SOME OTHER LETTER"

-- Guards must always evaluate a bool 

f = guardsTest
-- type f "A" into terminal to return "THE LETTER A"

caseExpressionTest :: String -> String
caseExpressionTest g = case g of
  "Q" -> "letter Q"
  "W" -> " letter W"
  _   -> "some other letter"

h = caseExpressionTest
-- type h "A" into terminal to return "some other letter"
-- type caseExpressionTest "W" to retunr "letter W"


caseExpressionBestPractice :: String -> String
caseExpressionBestPractice "A" = "letter A"
caseExpressionBestPractice "B" = "letter B"
caseExpressionBestPractice "C" = "letter C"
caseExpressionBestPractice _   = "some other letter"

i = caseExpressionBestPractice
-- type i "A" into terminal to return "letter A"

conditionalLogicTest j =
  if j == "X"
    then "letter X"
    else if j == "Y"
      then "letter Y"
      else if j == "Z"
        then "letter Z"
        else "some other letter"

k = conditionalLogicTest
-- type k or conditionalLogicTest "X" into terminal to  "letter X"

