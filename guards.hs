-- patterns are for making sure a value conforms to some form, set of rules and deconstructing
-- guards are like asserts, check weighthether something is True/False 
tP = (1.0, 94.0)
tPL = [(1.0,5.0), (140.0, 12.0), (563.0, 74.0), (97.0, 11.0)]

bmiTell :: (RealFloat a) => a -> String -- takes one input
bmiTell bmi -- NOTE THERE IS NO = here! and a tab for each guard is the norm, convention
    | bmi <= 18.5 = "You're underweight, you emo, you!" -- like a big if/else tree
    | bmi <= 25.0 = "Youre normal. Supposedly. As if."       -- except much more readable
    | bmi <= 30.0 = "You're fat. Lose some weight."     -- if all guards == False, goes to next pattern
    | otherwise   = "Man the harpoon gun!"              -- the equivalent of the else or finally catch all

bmiTell2 :: (RealFloat a) => a -> a -> String -- takes 2 inputs
bmiTell2 weight height -- again, note no =, this version takes 2 inputs to work
    | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"
    | weight / height ^ 2 <= 25.0 = "You're normal. Supposedly. As if."
    | weight / height ^ 2 <= 30.0 = "You're fat. Lose some weight."
    | otherwise         = "Man the harpoon gun!"

-- this version saves us the stupidity of typig weight / height ^ 2 more than once
bmiTell3 :: (RealFloat a) => a -> a -> String
bmiTell3 weight height 
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're normal. Supposedly. As if."
    | bmi <= 30.0 = "You're fat. Lose some weight."
    | otherwise   = "Man the harpoon gun!"
    where bmi = weight / height ^ 2 -- where defines  

-- this version is easier to read 
bmiTell4 :: (RealFloat a) => a -> a -> String
bmiTell4 weight height
    | bmi <= thin = "You're underweight, you emo, you!"
    | bmi <= avg  = "You're normal. Supposedly. As if."
    | bmi <= fat  = "You're fat. Lose some weight."
    | otherwise   = "Man the harpoon gun!"
    where bmi = weight / height ^ 2
          (thin, avg, fat) =(18.5, 25.0, 30.0)


max' :: (Ord a) => a -> a -> a 
max' a b 
    | a > b = a
    | otherwise = b 

-- same function written inline style
maxInline :: (Ord a) => a -> a -> a
maxInline a b | a > b = a | otherwise = b

compare' :: (Ord a) => a -> a -> Ordering
a `compare'` b -- infix style
    | a > b     = GT -- from the Ord type!
    | a == b    = EQ -- greater than, equal and less than!
    | otherwise = LT 


initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname

-- version without where
initials2 :: String -> String -> String
initials2 firstname lastname =[head firstname] ++ ". " ++[head lastname] ++ ". " 

-- takes in a list of height/weight tuples and returns BMIs
calcBmis :: (RealFloat a) => [(a, a)] -> [a] -- must be RealFloats, takes in list of tuples, returns list
calcBmis list = [bmi w h | (w, h) <- list] -- list comprehension, formula below, (w, h) taken from list 
    where bmi weight height = weight / height ^ 2
