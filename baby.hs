doubleMe x = x + x  

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
						then x
						else x*2 + 1

conanO'Brien = "It's me, Conan O'Brien!"

cons x y = x : y

a = [1..100] -- this is a comment