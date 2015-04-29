(define (problem hallway1) (:domain ACTION)
(:objects
	human - agent
	room3 hall4 room1 room4 hall1 hall2 hall3 hall5 room2 room5 - location
	bxl - box
	mk1 mk2 - medkit
)
 
(:init
	(at human room5)                                                             
	(at mk1 room2)
	(at mk2 room3)
	(connected room1 hall1)
	(connected hall1 hall2)
	(connected hall2 hall3)
	(connected hall3 hall4)
	(connected hall4 hall5)
	(connected room2 hall2)
	(connected room3 room4)
	(connected room4 hall4)
	(connected room5 hall5)
	(connected room5 hall1)
)

(:goal (and  
(conducted_triage human room4)
(not (has_medkit human))
))

)

