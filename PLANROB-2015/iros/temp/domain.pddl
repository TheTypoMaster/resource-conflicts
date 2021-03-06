(define (domain ACTION)

(:requirements :strips :typing :equality)

(:types location locatable - object
		agent box - locatable
		robot commander - agent
		medkit - box
)

(:predicates 		(at ?lc - locatable ?loc - location)
	     		(connected ?from - location ?to - location)
		     	(has_met ?a1 - agent ?a2 - agent ?loc - location)
		     	(has ?a - agent ?bx - box)
		     	(conducted_triage ?a - agent ?loc - location)
		     	(delivered ?a - agent ?mk - medkit ?loc - location)
		     	(has_medkit ?a - agent)
		     	(loc_has_medkit ?loc - location)
)

(:action pick_up_medkit 
	:parameters (?a - agent ?bx - medkit ?loc - location)
	:precondition (and (at ?a ?loc) (at ?bx ?loc))
	:effect		(and (not (at ?bx ?loc)) (not (loc_has_medkit ?loc)) (has_medkit ?a) (has ?a ?bx))
) 	    	 

(:action drop_off 
	:parameters (?a - agent ?bx - medkit ?loc - location)
	:precondition (and (at ?a ?loc) (has ?a ?bx))
	:effect		(and (not (has ?a ?bx)) (not (has_medkit ?a)) (delivered ?a ?bx ?loc) (loc_has_medkit ?loc) (at ?bx ?loc))
)

(:action conduct_triage
	:parameters (?a - agent ?loc - location)
	:precondition (and (at ?a ?loc) (has_medkit ?a))
	:effect 	(and (conducted_triage ?a ?loc))
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

)
