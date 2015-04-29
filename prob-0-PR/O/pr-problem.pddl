(define
	(problem grounded-HALLWAY1)
	(:domain grounded-ACTION)
	(:init
		(= (total-cost) 0)
		( NOT-HAS_MEDKIT_HUMAN )
		( AT_MK2_ROOM3 )
		( AT_MK1_ROOM2 )
		( AT_HUMAN_ROOM5 )
		( NOT_EXPLAINED_MOVE_HUMAN_ROOM5_HALL5_1 )
		( NOT_EXPLAINED_MOVE_REVERSE_HUMAN_HALL5_HALL4_1 )
		( NOT_EXPLAINED_MOVE_REVERSE_HUMAN_HALL4_ROOM4_1 )
		( NOT_EXPLAINED_MOVE_REVERSE_HUMAN_ROOM4_ROOM3_1 )
		( NOT_EXPLAINED_PICK_UP_MEDKIT_HUMAN_MK2_ROOM3_1 )
		( NOT_EXPLAINED_FULL_OBS_SEQUENCE )
	)
	(:goal
		(and 
		( NOT-HAS_MEDKIT_HUMAN )
		( CONDUCTED_TRIAGE_HUMAN_ROOM1 )
		( EXPLAINED_FULL_OBS_SEQUENCE )
		)
	)
	(:metric minimize (total-cost))

)