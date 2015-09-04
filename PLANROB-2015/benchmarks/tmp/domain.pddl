(define (domain ACTION)

(:requirements :strips :typing :equality)

(:types location locatable - object
	agent box - locatable
	robot commander - agent
	medkit - box
)

(:predicates 	(at ?lc - locatable ?loc - location)
	     	(connected ?from - location ?to - location)
		(has_met ?a1 - agent ?a2 - agent ?loc - location)
		(has ?a - agent ?bx - box)
		(delivered ?a - agent ?mk - medkit ?loc - location)
		(has_medkit ?a - agent)
		(loc_has_medkit ?loc - location)
)


(:action pick_up_medkit 
	:parameters (?a - agent ?bx - medkit ?loc - location)
	:precondition (and (at ?a ?loc) (at ?bx ?loc))
	:effect		(and (not (at ?bx ?loc)) (not (loc_has_medkit ?loc)) (has_medkit ?a) (has ?a ?bx))
) 	    	 

(:action hand_over 
	:parameters (?a1 ?a2 - agent ?bx - medkit ?loc - location) 
	:precondition (and (has ?a1 ?bx) (has_medkit ?a1) (at ?a1 ?loc) (at ?a2 ?loc))
	:effect		(and (not (has ?a1 ?bx)) (not (has_medkit ?a1)) (has_medkit ?a2) (has ?a2 ?bx))
)

(:action drop_off 
	:parameters (?a - agent ?bx - medkit ?loc - location)
	:precondition (and (at ?a ?loc) (has ?a ?bx) (at ?a ?loc))
	:effect		(and (not (has ?a ?bx)) (not (has_medkit ?a)) (delivered ?a ?bx ?loc) (loc_has_medkit ?loc) (at ?bx ?loc))
)

(:action move 
	:parameters (?a - agent ?from ?to - location)
	:precondition (and (at ?a ?from) (connected ?from ?to))
	:effect    (and (not (at ?a ?from)) (at ?a ?to))
)

(:action move_reverse 
	:parameters (?a - agent ?from ?to - location)
	:precondition (and (at ?a ?from) (connected ?to ?from))
	:effect    (and (not (at ?a ?from)) (at ?a ?to))
)

(:action meet
	:parameters (?a1 ?a2 - agent ?loc - location)
	:precondition (and (at ?a1 ?loc) (at ?a2 ?loc))
	:effect    (and (has_met ?a1 ?a2 ?loc))
)

)
