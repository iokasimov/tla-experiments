------------------------------------------- MODULE hanoi -------------------------------------------

EXTENDS Integers, Sequences

VARIABLES towers

Init == towers = << <<1, 2, 3>>, <<>>, <<>> >>

Movable (source, target) == Len (towers[source]) > 0
	/\ IF Len (towers[target]) = 0 THEN TRUE ELSE towers[source][1] < towers[target][1]

Move (source, target) == towers' =
	[towers EXCEPT ![source] = Tail (towers[source]), ![target] = <<towers[source][1]>> \o towers[target]]

Try (source, target) == Movable (source, target) /\ Move (source, target)

Next == \E source, target \in DOMAIN towers:
	source /= target /\ Try (source, target)

Specification == Init /\ [][Next]_<<towers>>

Solution == towers[3] /= <<1,2,3>>

====================================================================================================
