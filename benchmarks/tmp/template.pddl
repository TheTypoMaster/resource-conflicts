(define (problem hellway) 
(:domain ACTION)

(:objects
	robot - agent
	hall1 hall2 room1 room2 hall3 hall4 hall5 room4 - location
	bxl - box
	mkeast mkwest - medkit
)

(:init
	(at robot hall5)
	(at mkeast room1)
	(at mkwest room4)
	(connected room1 hall1)
	(connected hall1 hall2)
	(connected hall2 hall3)
	(connected hall3 hall4)
	(connected hall4 hall5)
	(connected hall5 hall6)
	(connected hall6 hall7)
	(connected room2 hall2)
	(connected room3 hall4)
	(connected room3 hall5)
	(connected room4 hall6)
	(connected room5 hall6)
)

(:goal (and  
	<HYPOTHESIS>
))

)

