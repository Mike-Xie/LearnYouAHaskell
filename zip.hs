doubleMe x = x + x 

-- zip takes 2 lists and outputs a tuple, matching same index into pairs
-- naked expression at top level error if we don't assign these expressions to a variable
a = zip [1,2,3,4,5] [5,5,5,5,5]

b = zip [1..5] ["one", "two", "three", "four", "five"]

--zips 2 then stops
d = zip [1..] ["orange", "apple"]

-- keeps zipping until out of elements in 1 list, 6 gets lost here
c = zip [5,3,4,1,6] ["i","am","a","turtle"]

-- returns all permutations of triangles with perimeter xs => a list
triangles xs = [ (a,b,c) | c<- xs, b <- xs, a <- xs]

-- returns the ones that are right triangles
rTriangles xs = [ (a,b,c) | c<- xs, b <- xs, a <- xs, a^2 + b^2 == c^2]

-- returns the ones whom in addition perimeter are more than 15

r15Triangles xs = [ (a,b,c) | c<- xs, b <- xs, a <- xs, a^2 + b^2 == c^2, a+b+c > 15]
