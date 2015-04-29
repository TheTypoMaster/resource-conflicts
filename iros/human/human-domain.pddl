(define
	(domain grounded-ACTION)
	(:requirements :strips :action-costs)
	(:predicates
		( AT_HUMAN_HALL1 )
		( AT_HUMAN_HALL2 )
		( AT_HUMAN_ROOM2 )
		( HAS_MEDKIT_HUMAN )
		( HAS_HUMAN_MK1 )
		( DELIVERED_HUMAN_MK1_ROOM1 )
		( LOC_HAS_MEDKIT_ROOM1 )
		( AT_MK1_ROOM1 )
		( DELIVERED_HUMAN_MK1_HALL1 )
		( LOC_HAS_MEDKIT_HALL1 )
		( AT_MK1_HALL1 )
		( DELIVERED_HUMAN_MK1_HALL2 )
		( LOC_HAS_MEDKIT_HALL2 )
		( AT_MK1_HALL2 )
		( DELIVERED_HUMAN_MK1_ROOM2 )
		( LOC_HAS_MEDKIT_ROOM2 )
		( CONDUCTED_TRIAGE_HUMAN_ROOM1 )
		( CONDUCTED_TRIAGE_HUMAN_HALL1 )
		( CONDUCTED_TRIAGE_HUMAN_HALL2 )
		( CONDUCTED_TRIAGE_HUMAN_ROOM2 )
		( AT_HUMAN_HALL3 )
		( DELIVERED_HUMAN_MK1_HALL3 )
		( LOC_HAS_MEDKIT_HALL3 )
		( AT_MK1_HALL3 )
		( CONDUCTED_TRIAGE_HUMAN_HALL3 )
		( AT_HUMAN_HALL4 )
		( AT_HUMAN_ROOM4 )
		( AT_HUMAN_ROOM3 )
		( HAS_HUMAN_MK2 )
		( DELIVERED_HUMAN_MK1_ROOM3 )
		( LOC_HAS_MEDKIT_ROOM3 )
		( AT_MK1_ROOM3 )
		( DELIVERED_HUMAN_MK1_HALL4 )
		( LOC_HAS_MEDKIT_HALL4 )
		( AT_MK1_HALL4 )
		( DELIVERED_HUMAN_MK1_ROOM4 )
		( LOC_HAS_MEDKIT_ROOM4 )
		( AT_MK1_ROOM4 )
		( DELIVERED_HUMAN_MK2_ROOM3 )
		( DELIVERED_HUMAN_MK2_HALL4 )
		( AT_MK2_HALL4 )
		( DELIVERED_HUMAN_MK2_ROOM1 )
		( AT_MK2_ROOM1 )
		( DELIVERED_HUMAN_MK2_ROOM4 )
		( AT_MK2_ROOM4 )
		( DELIVERED_HUMAN_MK2_HALL1 )
		( AT_MK2_HALL1 )
		( DELIVERED_HUMAN_MK2_HALL2 )
		( AT_MK2_HALL2 )
		( DELIVERED_HUMAN_MK2_HALL3 )
		( AT_MK2_HALL3 )
		( DELIVERED_HUMAN_MK2_ROOM2 )
		( AT_MK2_ROOM2 )
		( CONDUCTED_TRIAGE_HUMAN_ROOM3 )
		( CONDUCTED_TRIAGE_HUMAN_HALL4 )
		( CONDUCTED_TRIAGE_HUMAN_ROOM4 )
		( AT_HUMAN_HALL5 )
		( AT_HUMAN_ROOM5 )
		( DELIVERED_HUMAN_MK1_HALL5 )
		( LOC_HAS_MEDKIT_HALL5 )
		( AT_MK1_HALL5 )
		( DELIVERED_HUMAN_MK1_ROOM5 )
		( LOC_HAS_MEDKIT_ROOM5 )
		( AT_MK1_ROOM5 )
		( DELIVERED_HUMAN_MK2_HALL5 )
		( AT_MK2_HALL5 )
		( DELIVERED_HUMAN_MK2_ROOM5 )
		( AT_MK2_ROOM5 )
		( CONDUCTED_TRIAGE_HUMAN_HALL5 )
		( CONDUCTED_TRIAGE_HUMAN_ROOM5 )
		( AT_MK2_ROOM3 )
		( AT_MK1_ROOM2 )
		( AT_HUMAN_ROOM1 )
	) 
	(:functions (total-cost))
	(:action NOOP
		:parameters ()
		:precondition
		(and
		)
		:effect
		(and
		)
	)
	(:action MOVE_HUMAN_ROOM1_HALL1
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_ROOM1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_HALL1 )
			(not ( AT_HUMAN_ROOM1 ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK2_ROOM5
		:parameters ()
		:precondition
		(and
			( AT_MK2_ROOM5 )
			( AT_HUMAN_ROOM5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK2 )
			(not ( AT_MK2_ROOM5 ))
			(not ( LOC_HAS_MEDKIT_ROOM5 ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK2_HALL5
		:parameters ()
		:precondition
		(and
			( AT_MK2_HALL5 )
			( AT_HUMAN_HALL5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK2 )
			(not ( AT_MK2_HALL5 ))
			(not ( LOC_HAS_MEDKIT_HALL5 ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK1_ROOM5
		:parameters ()
		:precondition
		(and
			( AT_MK1_ROOM5 )
			( AT_HUMAN_ROOM5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK1 )
			(not ( AT_MK1_ROOM5 ))
			(not ( LOC_HAS_MEDKIT_ROOM5 ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK1_HALL5
		:parameters ()
		:precondition
		(and
			( AT_MK1_HALL5 )
			( AT_HUMAN_HALL5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK1 )
			(not ( AT_MK1_HALL5 ))
			(not ( LOC_HAS_MEDKIT_HALL5 ))
		)
	)
	(:action MOVE_HUMAN_ROOM5_HALL5
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_ROOM5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_HALL5 )
			(not ( AT_HUMAN_ROOM5 ))
		)
	)
	(:action CONDUCT_TRIAGE_HUMAN_ROOM5
		:parameters ()
		:precondition
		(and
			( HAS_MEDKIT_HUMAN )
			( AT_HUMAN_ROOM5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CONDUCTED_TRIAGE_HUMAN_ROOM5 )
		)
	)
	(:action CONDUCT_TRIAGE_HUMAN_HALL5
		:parameters ()
		:precondition
		(and
			( HAS_MEDKIT_HUMAN )
			( AT_HUMAN_HALL5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CONDUCTED_TRIAGE_HUMAN_HALL5 )
		)
	)
	(:action DROP_OFF_HUMAN_MK2_ROOM5
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK2 )
			( AT_HUMAN_ROOM5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK2_ROOM5 )
			( LOC_HAS_MEDKIT_ROOM5 )
			( AT_MK2_ROOM5 )
			(not ( HAS_HUMAN_MK2 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action DROP_OFF_HUMAN_MK2_HALL5
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK2 )
			( AT_HUMAN_HALL5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK2_HALL5 )
			( LOC_HAS_MEDKIT_HALL5 )
			( AT_MK2_HALL5 )
			(not ( HAS_HUMAN_MK2 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action DROP_OFF_HUMAN_MK1_ROOM5
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK1 )
			( AT_HUMAN_ROOM5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK1_ROOM5 )
			( LOC_HAS_MEDKIT_ROOM5 )
			( AT_MK1_ROOM5 )
			(not ( HAS_HUMAN_MK1 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action DROP_OFF_HUMAN_MK1_HALL5
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK1 )
			( AT_HUMAN_HALL5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK1_HALL5 )
			( LOC_HAS_MEDKIT_HALL5 )
			( AT_MK1_HALL5 )
			(not ( HAS_HUMAN_MK1 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK2_ROOM2
		:parameters ()
		:precondition
		(and
			( AT_MK2_ROOM2 )
			( AT_HUMAN_ROOM2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK2 )
			(not ( AT_MK2_ROOM2 ))
			(not ( LOC_HAS_MEDKIT_ROOM2 ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK2_HALL3
		:parameters ()
		:precondition
		(and
			( AT_MK2_HALL3 )
			( AT_HUMAN_HALL3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK2 )
			(not ( AT_MK2_HALL3 ))
			(not ( LOC_HAS_MEDKIT_HALL3 ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK2_HALL2
		:parameters ()
		:precondition
		(and
			( AT_MK2_HALL2 )
			( AT_HUMAN_HALL2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK2 )
			(not ( AT_MK2_HALL2 ))
			(not ( LOC_HAS_MEDKIT_HALL2 ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK2_HALL1
		:parameters ()
		:precondition
		(and
			( AT_MK2_HALL1 )
			( AT_HUMAN_HALL1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK2 )
			(not ( AT_MK2_HALL1 ))
			(not ( LOC_HAS_MEDKIT_HALL1 ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK2_ROOM4
		:parameters ()
		:precondition
		(and
			( AT_MK2_ROOM4 )
			( AT_HUMAN_ROOM4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK2 )
			(not ( AT_MK2_ROOM4 ))
			(not ( LOC_HAS_MEDKIT_ROOM4 ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK2_ROOM1
		:parameters ()
		:precondition
		(and
			( AT_MK2_ROOM1 )
			( AT_HUMAN_ROOM1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK2 )
			(not ( AT_MK2_ROOM1 ))
			(not ( LOC_HAS_MEDKIT_ROOM1 ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK2_HALL4
		:parameters ()
		:precondition
		(and
			( AT_MK2_HALL4 )
			( AT_HUMAN_HALL4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK2 )
			(not ( AT_MK2_HALL4 ))
			(not ( LOC_HAS_MEDKIT_HALL4 ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK1_ROOM4
		:parameters ()
		:precondition
		(and
			( AT_MK1_ROOM4 )
			( AT_HUMAN_ROOM4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK1 )
			(not ( AT_MK1_ROOM4 ))
			(not ( LOC_HAS_MEDKIT_ROOM4 ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK1_HALL4
		:parameters ()
		:precondition
		(and
			( AT_MK1_HALL4 )
			( AT_HUMAN_HALL4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK1 )
			(not ( AT_MK1_HALL4 ))
			(not ( LOC_HAS_MEDKIT_HALL4 ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK1_ROOM3
		:parameters ()
		:precondition
		(and
			( AT_MK1_ROOM3 )
			( AT_HUMAN_ROOM3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK1 )
			(not ( AT_MK1_ROOM3 ))
			(not ( LOC_HAS_MEDKIT_ROOM3 ))
		)
	)
	(:action MOVE_REVERSE_HUMAN_HALL5_HALL4
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_HALL5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_HALL4 )
			(not ( AT_HUMAN_HALL5 ))
		)
	)
	(:action MOVE_REVERSE_HUMAN_HALL5_ROOM5
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_HALL5 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_ROOM5 )
			(not ( AT_HUMAN_HALL5 ))
		)
	)
	(:action MOVE_HUMAN_HALL4_HALL5
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_HALL4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_HALL5 )
			(not ( AT_HUMAN_HALL4 ))
		)
	)
	(:action MOVE_HUMAN_ROOM3_ROOM4
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_ROOM3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_ROOM4 )
			(not ( AT_HUMAN_ROOM3 ))
		)
	)
	(:action MOVE_HUMAN_ROOM4_HALL4
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_ROOM4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_HALL4 )
			(not ( AT_HUMAN_ROOM4 ))
		)
	)
	(:action CONDUCT_TRIAGE_HUMAN_ROOM4
		:parameters ()
		:precondition
		(and
			( HAS_MEDKIT_HUMAN )
			( AT_HUMAN_ROOM4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CONDUCTED_TRIAGE_HUMAN_ROOM4 )
		)
	)
	(:action CONDUCT_TRIAGE_HUMAN_HALL4
		:parameters ()
		:precondition
		(and
			( HAS_MEDKIT_HUMAN )
			( AT_HUMAN_HALL4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CONDUCTED_TRIAGE_HUMAN_HALL4 )
		)
	)
	(:action CONDUCT_TRIAGE_HUMAN_ROOM3
		:parameters ()
		:precondition
		(and
			( HAS_MEDKIT_HUMAN )
			( AT_HUMAN_ROOM3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CONDUCTED_TRIAGE_HUMAN_ROOM3 )
		)
	)
	(:action DROP_OFF_HUMAN_MK2_ROOM2
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK2 )
			( AT_HUMAN_ROOM2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK2_ROOM2 )
			( LOC_HAS_MEDKIT_ROOM2 )
			( AT_MK2_ROOM2 )
			(not ( HAS_HUMAN_MK2 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action DROP_OFF_HUMAN_MK2_HALL3
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK2 )
			( AT_HUMAN_HALL3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK2_HALL3 )
			( LOC_HAS_MEDKIT_HALL3 )
			( AT_MK2_HALL3 )
			(not ( HAS_HUMAN_MK2 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action DROP_OFF_HUMAN_MK2_HALL2
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK2 )
			( AT_HUMAN_HALL2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK2_HALL2 )
			( LOC_HAS_MEDKIT_HALL2 )
			( AT_MK2_HALL2 )
			(not ( HAS_HUMAN_MK2 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action DROP_OFF_HUMAN_MK2_HALL1
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK2 )
			( AT_HUMAN_HALL1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK2_HALL1 )
			( LOC_HAS_MEDKIT_HALL1 )
			( AT_MK2_HALL1 )
			(not ( HAS_HUMAN_MK2 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action DROP_OFF_HUMAN_MK2_ROOM4
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK2 )
			( AT_HUMAN_ROOM4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK2_ROOM4 )
			( LOC_HAS_MEDKIT_ROOM4 )
			( AT_MK2_ROOM4 )
			(not ( HAS_HUMAN_MK2 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action DROP_OFF_HUMAN_MK2_ROOM1
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK2 )
			( AT_HUMAN_ROOM1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK2_ROOM1 )
			( LOC_HAS_MEDKIT_ROOM1 )
			( AT_MK2_ROOM1 )
			(not ( HAS_HUMAN_MK2 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action DROP_OFF_HUMAN_MK2_HALL4
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK2 )
			( AT_HUMAN_HALL4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK2_HALL4 )
			( LOC_HAS_MEDKIT_HALL4 )
			( AT_MK2_HALL4 )
			(not ( HAS_HUMAN_MK2 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action DROP_OFF_HUMAN_MK2_ROOM3
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK2 )
			( AT_HUMAN_ROOM3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK2_ROOM3 )
			( LOC_HAS_MEDKIT_ROOM3 )
			( AT_MK2_ROOM3 )
			(not ( HAS_HUMAN_MK2 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action DROP_OFF_HUMAN_MK1_ROOM4
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK1 )
			( AT_HUMAN_ROOM4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK1_ROOM4 )
			( LOC_HAS_MEDKIT_ROOM4 )
			( AT_MK1_ROOM4 )
			(not ( HAS_HUMAN_MK1 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action DROP_OFF_HUMAN_MK1_HALL4
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK1 )
			( AT_HUMAN_HALL4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK1_HALL4 )
			( LOC_HAS_MEDKIT_HALL4 )
			( AT_MK1_HALL4 )
			(not ( HAS_HUMAN_MK1 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action DROP_OFF_HUMAN_MK1_ROOM3
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK1 )
			( AT_HUMAN_ROOM3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK1_ROOM3 )
			( LOC_HAS_MEDKIT_ROOM3 )
			( AT_MK1_ROOM3 )
			(not ( HAS_HUMAN_MK1 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK2_ROOM3
		:parameters ()
		:precondition
		(and
			( AT_MK2_ROOM3 )
			( AT_HUMAN_ROOM3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK2 )
			(not ( AT_MK2_ROOM3 ))
			(not ( LOC_HAS_MEDKIT_ROOM3 ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK1_HALL3
		:parameters ()
		:precondition
		(and
			( AT_MK1_HALL3 )
			( AT_HUMAN_HALL3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK1 )
			(not ( AT_MK1_HALL3 ))
			(not ( LOC_HAS_MEDKIT_HALL3 ))
		)
	)
	(:action MOVE_REVERSE_HUMAN_HALL4_HALL3
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_HALL4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_HALL3 )
			(not ( AT_HUMAN_HALL4 ))
		)
	)
	(:action MOVE_REVERSE_HUMAN_ROOM4_ROOM3
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_ROOM4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_ROOM3 )
			(not ( AT_HUMAN_ROOM4 ))
		)
	)
	(:action MOVE_REVERSE_HUMAN_HALL4_ROOM4
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_HALL4 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_ROOM4 )
			(not ( AT_HUMAN_HALL4 ))
		)
	)
	(:action MOVE_HUMAN_HALL3_HALL4
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_HALL3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_HALL4 )
			(not ( AT_HUMAN_HALL3 ))
		)
	)
	(:action CONDUCT_TRIAGE_HUMAN_HALL3
		:parameters ()
		:precondition
		(and
			( HAS_MEDKIT_HUMAN )
			( AT_HUMAN_HALL3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CONDUCTED_TRIAGE_HUMAN_HALL3 )
		)
	)
	(:action DROP_OFF_HUMAN_MK1_HALL3
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK1 )
			( AT_HUMAN_HALL3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK1_HALL3 )
			( LOC_HAS_MEDKIT_HALL3 )
			( AT_MK1_HALL3 )
			(not ( HAS_HUMAN_MK1 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK1_HALL2
		:parameters ()
		:precondition
		(and
			( AT_MK1_HALL2 )
			( AT_HUMAN_HALL2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK1 )
			(not ( AT_MK1_HALL2 ))
			(not ( LOC_HAS_MEDKIT_HALL2 ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK1_HALL1
		:parameters ()
		:precondition
		(and
			( AT_MK1_HALL1 )
			( AT_HUMAN_HALL1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK1 )
			(not ( AT_MK1_HALL1 ))
			(not ( LOC_HAS_MEDKIT_HALL1 ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK1_ROOM1
		:parameters ()
		:precondition
		(and
			( AT_MK1_ROOM1 )
			( AT_HUMAN_ROOM1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK1 )
			(not ( AT_MK1_ROOM1 ))
			(not ( LOC_HAS_MEDKIT_ROOM1 ))
		)
	)
	(:action MOVE_REVERSE_HUMAN_HALL3_HALL2
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_HALL3 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_HALL2 )
			(not ( AT_HUMAN_HALL3 ))
		)
	)
	(:action MOVE_HUMAN_HALL2_HALL3
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_HALL2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_HALL3 )
			(not ( AT_HUMAN_HALL2 ))
		)
	)
	(:action MOVE_HUMAN_ROOM2_HALL2
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_ROOM2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_HALL2 )
			(not ( AT_HUMAN_ROOM2 ))
		)
	)
	(:action CONDUCT_TRIAGE_HUMAN_ROOM2
		:parameters ()
		:precondition
		(and
			( HAS_MEDKIT_HUMAN )
			( AT_HUMAN_ROOM2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CONDUCTED_TRIAGE_HUMAN_ROOM2 )
		)
	)
	(:action CONDUCT_TRIAGE_HUMAN_HALL2
		:parameters ()
		:precondition
		(and
			( HAS_MEDKIT_HUMAN )
			( AT_HUMAN_HALL2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CONDUCTED_TRIAGE_HUMAN_HALL2 )
		)
	)
	(:action CONDUCT_TRIAGE_HUMAN_HALL1
		:parameters ()
		:precondition
		(and
			( HAS_MEDKIT_HUMAN )
			( AT_HUMAN_HALL1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CONDUCTED_TRIAGE_HUMAN_HALL1 )
		)
	)
	(:action CONDUCT_TRIAGE_HUMAN_ROOM1
		:parameters ()
		:precondition
		(and
			( HAS_MEDKIT_HUMAN )
			( AT_HUMAN_ROOM1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( CONDUCTED_TRIAGE_HUMAN_ROOM1 )
		)
	)
	(:action DROP_OFF_HUMAN_MK1_ROOM2
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK1 )
			( AT_HUMAN_ROOM2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK1_ROOM2 )
			( LOC_HAS_MEDKIT_ROOM2 )
			( AT_MK1_ROOM2 )
			(not ( HAS_HUMAN_MK1 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action DROP_OFF_HUMAN_MK1_HALL2
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK1 )
			( AT_HUMAN_HALL2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK1_HALL2 )
			( LOC_HAS_MEDKIT_HALL2 )
			( AT_MK1_HALL2 )
			(not ( HAS_HUMAN_MK1 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action DROP_OFF_HUMAN_MK1_HALL1
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK1 )
			( AT_HUMAN_HALL1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK1_HALL1 )
			( LOC_HAS_MEDKIT_HALL1 )
			( AT_MK1_HALL1 )
			(not ( HAS_HUMAN_MK1 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action DROP_OFF_HUMAN_MK1_ROOM1
		:parameters ()
		:precondition
		(and
			( HAS_HUMAN_MK1 )
			( AT_HUMAN_ROOM1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( DELIVERED_HUMAN_MK1_ROOM1 )
			( LOC_HAS_MEDKIT_ROOM1 )
			( AT_MK1_ROOM1 )
			(not ( HAS_HUMAN_MK1 ))
			(not ( HAS_MEDKIT_HUMAN ))
		)
	)
	(:action PICK_UP_MEDKIT_HUMAN_MK1_ROOM2
		:parameters ()
		:precondition
		(and
			( AT_MK1_ROOM2 )
			( AT_HUMAN_ROOM2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( HAS_MEDKIT_HUMAN )
			( HAS_HUMAN_MK1 )
			(not ( AT_MK1_ROOM2 ))
			(not ( LOC_HAS_MEDKIT_ROOM2 ))
		)
	)
	(:action MOVE_REVERSE_HUMAN_HALL2_HALL1
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_HALL2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_HALL1 )
			(not ( AT_HUMAN_HALL2 ))
		)
	)
	(:action MOVE_REVERSE_HUMAN_HALL2_ROOM2
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_HALL2 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_ROOM2 )
			(not ( AT_HUMAN_HALL2 ))
		)
	)
	(:action MOVE_HUMAN_HALL1_HALL2
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_HALL1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_HALL2 )
			(not ( AT_HUMAN_HALL1 ))
		)
	)
	(:action MOVE_REVERSE_HUMAN_HALL1_ROOM1
		:parameters ()
		:precondition
		(and
			( AT_HUMAN_HALL1 )
		)
		:effect
		(and
			(increase (total-cost) 1)
			( AT_HUMAN_ROOM1 )
			(not ( AT_HUMAN_HALL1 ))
		)
	)

)
