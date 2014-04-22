-- Learn You a Haskell Chapter 3

-- Haskell can figure out what type things are, usually
-- types are capital

-- we are giving type declaration here
-- keepsUppercase maps from string to string
-- only returns the letters that are CAPS

keepUppercase :: [Char] -> [Char]
keepUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

-- here we seperate parameters with ->
-- note no distinction b.w params and return type

addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- can always type :t function to see what ghci thinks are the types
-- works with functions as well as expressions

-- Int is bounded
-- Integer is not but less efficient

factorial :: Integer -> Integer
factorial n = product [1..n]

circumference :: Float -> Float  
circumference r = 2 * pi * r  

circumference' :: Double -> Double
circumference' r = 2 * pi * r 

-- :t head outputs:
-- head :: [a] -> a

-- a is lowercase, can't be a type 
-- it is a type variable, of any type 
-- can write super general functions if don't require specific behaviors
-- functions like this are called polymorphic 
-- head takes any type returns one el of that type

-- :t fst 
-- returned first elem in tuple, remember?
-- fst :: (a,b) -> a 
-- is also polymorphic

-- TYPECLASSES 101
-- TC defines some sort of behavior
-- type part of a TC means it implements behaviors of the TC
-- like java interfaces but better 

-- :t (==) -- () are required for infix functions, ones where arguments are either side
-- examples of infix functions: +,-,*,/
-- can call infix functions like regular functions like so:
-- (+) 1 3 4 5
-- 13
-- OK, back on topic
-- (==) :: (Eq a) => a -> a -> Bool
-- to left of => is 'class constraint'
-- above reads like this: equality takes any 2 values of the same type and returns a Bool

-- :t (elem) -- takes 2 args, checks if first (char/int) is inside the second
-- (Eq a) => a -> [a] -> Bool

-- Eq is the most basic subclass, almost all types (except IO) and functions are
-- members of Eq. Eq implements == and /= 
	-- 5 == 5 
	-- True
	-- 5 /= 5
	-- False
	-- "Bagels" == "Bagels"
	-- True

-- Ord is for types with an ordering, 
-- supports >,<,<=,>=,==, subset of Eq
-- generally does not work on functions, good for types though

-- Show supports show function which presents type (not function, generally) as string
-- Read takes a string and returns type that is member of Read
-- :t read
-- read :: (Read a) => String -> a 
-- gives error if only feed 1 value, ex read "4" as opposed to read "4" + 4
-- Haskell is statically typed, it must know all the types before eval/compile
	-- unsure what type to return, + implies integer for example

-- read "4" :: Int 
-- 5 
	-- this would fix it
	-- this is called explicit type annotation

	-- read "5" :: Float
	-- 5.0

-- Enum typeclass members are sequentially ordered, can be enumed and used in list ranges
	-- also because they are ordered, they 
	-- support 'succ' and 'pred' functions

-- Bounded members have an upper and a lower bound
	-- minBound :: Int
	-- -2147483648
	-- :t minBound
	-- Bounded a => a

-- Num have the property of acting like numbers
-- includes Int, Integer, Float, Double
-- Num requires be in Show and Eq
-- Integral includes whole numbers only, Int, Integer
-- Floating includes Float and Double

-- :t(*) shows us that it accepts all numbers
-- (*) :: (Num a) => a -> a -> a 

-- 5 :: Int * 6 :: Integer will error
-- 5 * 6 :: returns an Integer

-- function fromIntegral :: (Num b, Integral a) => a -> b
-- reads as takes an integral a and turns it into a Num, b	




