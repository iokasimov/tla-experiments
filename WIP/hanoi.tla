------------------------------------------- MODULE hanoi -------------------------------------------

EXTENDS Integers, Sequences

VARIABLES towers

Init == towers = << <<1, 2, 3>>, <<>>, <<>> >>

Movable (source, target) == Len (towers[source]) > 0
	/\ (Len (towers[target]) = 0 \/ Head (towers[source]) < Head (towers[target]))

Move (source, target) == Movable (source, target)
	/\ towers' = ???

Next == \E source, target \in DOMAIN towers:
	source /= target /\ Move (source, target)

Specification == Init /\ [][Next]_<<towers>>

Solution == towers[3] /= <<1,2,3>>

====================================================================================================
