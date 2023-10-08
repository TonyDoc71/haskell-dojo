module Sandbox where
import Foreign (IntPtr)

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

