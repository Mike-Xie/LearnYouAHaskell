
--Syntafirst in Functions
-- 4/18

lucky :: (Integral a) => a -> String -- returns a string
lucky 7 = "Lucky Number 7!" -- checks first
lucky f = "Sorry you're not lucky, buddy!" -- falls thru here if not 7

sayMe :: (Integral a) => a -> String
sayMe 1 = "One"
sayMe 2 = "Two"
sayMe 3 = "Three"
sayMe 4 = "Four"
sayMe 5 = "Five"
sayMe f = "Not 1 - 5" -- falls thru here, note putting this at top would break 

factorial :: (Integral a) => a -> a 
factorial 0 = 1 -- always go specific to general, pattern order matters, 
factorial n = n * factorial (n - 1)

charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"
-- note that this breaks when not a, b or c because no catch all 


-- adding vectors without pattern matching
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)

-- and with
addVectors' :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors' (f1, y1) (f2, y2) = (f1 + f2, y1 + y2)

first :: (a, b, c) -> a  -- we can assume 3 different types here, only want a
first (f ,_ ,_) = f -- returns first elem, note that need () for multiple variables

second :: (a, b, c) -> b -- we only want b 
second (_ ,y ,_) = y -- _ means same as in list comprehension, don't care what 
			-- it is inside 

third :: (a, b, c) -> c -- we only want c
third (_ ,_ ,z) = z -- note () required for multiple variables, even if _

threeple = ("eggs", 12, 'a')  
 
rest = [(1,3), (4,3), (4,6), (11, 9), (3,5)]

addTwopleList :: Num t => [(t, t)] -> [t]
addTwopleList rest = [a+b | (a,b) <- rest]

bagel = "bagel"

head' :: [a] -> a
head' [] = error "Does not work on empty list!"
head' (f:rest) = f

tail' :: [a] ->[a]
tail' [] = error "Empty List!"
tail' (f:rest) = rest
--tail' [] = error "Does not work on empty list!" 

init' :: [a] -> [a]
init' [] = error "Does not work on empty list!"
init' [f] = []
init' (f: rest) = f:init' rest

last' :: [a] -> a
last' [f] = f
last' (f:rest) = last' rest 

-- (first:y:_) matches ANY list with more than 2 elements and is not equivalent to [first:y:_]
-- however, (first:[]) is equivalent to [first] and [first,y] is equivalent to (first:y:[])

tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (first:[]) = "The list has one element: " ++ show first 
tell (first:y:[]) = "The list has two elements: " ++ show first ++ " and " ++ show y
tell (first:y:_) = "This list is long. The first two elements are: " ++ show first ++ "and " ++ show y 

length' :: (Num b)  => [a] -> b -- B must be of type Num, we return b from list [a]
length' [] = 0 -- for the empty case
length' (first:rest) = 1 + length' rest -- for all of the rest. Start split into head:tail say return 1 + length of tail.

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (first:rest) = first + sum' rest -- more or less same pattern as length

-- returns the first letter of a string
firstLetter :: String -> String
firstLetter "" = "Empty String LOL!"
firstLetter all@(first:rest) = "The first letter of " ++ all ++ " is " ++ [first]

-- patterns are used to break things up and bind them. @ is used to keep the parts seperate as in above
-- where all@ is used to keep track of the entire thing and parts are first and rest
-- kind of like aliasing really, all refers to first:rest, they are equivalent
-- ++ cannot be used in pattern matching 
