#!/usr/bin/python
from gurobipy import *
import math, sys, os, copy
import readFiles, globalVAR
import time

def print_actions():
    print "\n*** ACTION DESCRIPTIONS ***"
    for action in globalVAR.listOfActions_robot:
        print "\nAction Name: " + action[0]
        print "preconditions: " + str(action[1])
        print "add effects: " + str(action[2])
        print "delete effects: " + str(action[3])
        print "cost: " + str(action[4]) + '\n'

def print_predicates():
    print "*** DOMAIN PREDICATES ***\n"
    for predicate in globalVAR.listOfPredicates:
        print predicate

    print
    print "*** GOAL STATE ***\n"
    print globalVAR.goalState_robot
    print
    print "*** INITIAL STATE ***\n"
    print globalVAR.initState_robot
    print


def print_plan(m, res, T):

    solnList = m.getVars()
    actList = [aa[0] for aa in globalVAR.listOfActions_robot]

    print "\n*** ROBOT PLAN  ***"
    for t in range(1,T):
        for v in solnList:
            if v.X > 0.5 and v.VarName.split('_'+str(t))[0] in actList and v.VarName.split('_')[-1] == str(t):
                print('%g - %s' % (t, v.VarName.split('_'+str(t))[0]))

    print "\n*** PROFILES ***"
    for r in res:
        print
        for t in range(1,T):
            for v in solnList:
                if 'use_' in v.VarName and v.VarName.split('_')[-1] == str(t) and r in v.VarName:
                    if abs(v.X - globalVAR.resource_profiles_use[v.VarName.split('_')[1],'IN_USE'][t]) > 0.1:
                        print "Yo Bro, lay off my meds for time " + str(t) + ' !!!'
                    #print 'time - %g : %s = %g, REAL = %g' %(t, v.VarName, v.X, globalVAR.resource_profiles_use[v.VarName.split('_')[1],'IN_USE'][t])  

def build_resource_action_relations(res):
    res_act = {}
    for r in res:
        ss = 'HAS_ROBOT_' + str(r)
        addList = []
        delList = []
        for a in globalVAR.listOfActions_robot:
            if ss in [addEff for addEff in a[2]]:
                addList.append(a[0])
            elif ss in [delEff for delEff in a[3]]:
                delList.append(a[0])
        res_act[r] = [addList, delList]
        
    return res_act
    
def objective_function(act, var, res, res_use, res_var, var_grnd, switchList, T):
    K = 1000
    expr = 10*quicksum(quicksum(aa[4]*act[aa[0],t] for aa in globalVAR.listOfActions_robot) for t in range(1,T))

    expr += 100*quicksum(quicksum(res_use[r,t]*res_var[r,t] for r in res) for t in range(1,T))
    #expr += 100*quicksum(quicksum(globalVAR.resource_profiles_use[r,'IN_USE'][t]*res_var[r,t] for r in res) for t in range(1,T))

    expr += 0.01*quicksum(quicksum(var[vv,t] for vv in switchList) for t in range(T))
    expr += -20*quicksum(quicksum(globalVAR.resource_profiles_grnd[rg][t]*var_grnd['res_'+rg,t] for rg in switchList) for t in range(T))

    #expr += K*quicksum(quicksum(aa[4]*anti_act[aa[0],t] for aa in globalVAR.listOfActions_robot) for t in range(1,T))
    #expr += K*quicksum(quicksum(aa[4]*human_act[aa[0],t] for aa in globalVAR.listOfActions_human) for t in range(1,T))

    expr += 50*quicksum(quicksum((globalVAR.resource_profiles_use[r,'IN_USE'][t] - res_use[r,t]) for r in res) for t in range(T))

    return expr

def run_ip(domainFile, problemFile, T):
    
    print '\nReading domain and problem files...'
    readFiles.read_input(domainFile, problemFile,'robot') 

    #print_actions()
    #print_predicates()

    start = time.time()
    print 'Building model...'
    # parameters #
    res = ['MK1','MK2']
    res_grnd = ['AT_MK1_','AT_MK2_']

    print 'Building resource-action lists...'
    res_act = build_resource_action_relations(res)

    # Model #
    m = Model("resourceplan")
    
    # Optimization criterion  #
    m.modelSense = GRB.MINIMIZE

    print 'Adding variables...'
    # define variables - y_a_t  #
    var = {}
    var_grnd = {}
    switchList = []
    for vv in globalVAR.listOfPredicates_robot:
        for t in range(T):
            var[vv,t] = m.addVar(vtype=GRB.BINARY, name=str(vv) + '_%s' % (str(t)))
            if True in [rg in vv for rg in res_grnd]:
                var_grnd['res_'+vv,t] = m.addVar(vtype=GRB.BINARY, name='res_' + str(vv) + '_%s' % (str(t)))
                if vv not in switchList:
                    switchList.append(vv)
                    
    # define variables - x_a_t  #
    act = {}  
    for aa in globalVAR.listOfActions_robot:
        for t in range(1,T):
            act[aa[0],t] = m.addVar(vtype=GRB.BINARY, name=str(aa[0]) + '_%s' % (str(t)))
    
    # define variables - g_mk?_t #
    res_var = {}
    res_use = {}
    for r in res:
        for t in range(T):
           res_var[r,t] = m.addVar(vtype=GRB.BINARY, name=str(r) + '_%s' % (str(t)))
           res_use[r,t] = m.addVar(vtype=GRB.CONTINUOUS, name='use_' + str(r) + '_%s' % (str(t)))

    # Update model with variables #
    m.update()
    
    print 'Adding constraints...'
    for r in res:
        for t in range(T):
            m.addConstr(res_use[r,t] <= globalVAR.resource_profiles_use[r,'IN_USE'][t])

    # define constraints - initial state #
    for vv in globalVAR.listOfPredicates_robot:
        if True not in [pp in vv for pp in res_grnd]:
            m.addConstr(var[vv,0] == globalVAR.initState_robot[globalVAR.listOfPredicates_robot.index(vv)])
        else:
            m.addConstr(var[vv,0] == 0)

    for r in res:
        m.addConstr(res_var[r,0] == 0)

    # define constraints - goal state #
    for vv in globalVAR.listOfPredicates_robot:
        if globalVAR.goalState_robot[globalVAR.listOfPredicates_robot.index(vv)] != -1:
            m.addConstr(var[vv,T-1] == globalVAR.goalState_robot[globalVAR.listOfPredicates_robot.index(vv)])

    # define constraints - preconditions #
    for t in range(1,T):
        for aa in globalVAR.listOfActions_robot:
            for precondition in aa[1]:
                if True not in [pp in precondition for pp in res_grnd]:
                    m.addConstr(act[aa[0],t] <= var[precondition,t-1])                    
                else:
                    m.addConstr(var_grnd['res_'+precondition,t-1] == act[aa[0],t])
                    #m.addConstr(var[precondition,T-1] >= var_grnd['res_'+precondition,t-1])

    for switch in switchList:
        m.addConstr(var_grnd['res_'+switch,T-1] == 0)

    # define constraints - add effects #
    for t in range(1,T):
        for vv in globalVAR.listOfPredicates_robot:
            tempList1 = []
            tempList2 = []
            for aa in globalVAR.listOfActions_robot:
                if vv in aa[2]:
                    tempList1.append(aa[0])
                if vv in aa[3]:
                    tempList2.append(aa[0])
            m.addConstr(var[vv,t] == quicksum(act[aa,t] for aa in tempList1) + (1-quicksum(act[aa,t] for aa in tempList1)-quicksum(act[aa,t] for aa in tempList2))*var[vv,t-1])
            m.addConstr(var[vv,t] <= quicksum(act[aa,t] for aa in tempList1) + (1-quicksum(act[aa,t] for aa in tempList1))*var[vv,t-1])
            #m.addConstr(var[vv,t] <= 1-quicksum(act[aa,t] for aa in tempList2))

    # define constraints - no concurrency #
    for t in range(1,T):
        m.addConstr(quicksum(act[aa[0],t] for aa in globalVAR.listOfActions_robot) == 1)

    # define constraints - no repetitions #
    for r in res:
        m.addConstr(quicksum(quicksum(act[aa,t] for aa in res_act[r][0]) for t in range(1,T)) <= 1)  

    # define constraints - resource profiles #
    m.update()
    for t in range(1,T):
        for r in res:
            m.addConstr(res_var[r,t] == quicksum(act[aa,t] for aa in res_act[r][0]) + (1-quicksum(act[aa,t] for aa in res_act[r][0]) - quicksum(act[aa,t] for aa in res_act[r][1]))*res_var[r,t-1])
            #m.addConstr(res_var[r,t] <= quicksum(act[aa,t] for aa in res_act[r][0]))
    
    #for t in range(1,T):
        #m.addConstr(quicksum(var[vv,t] for vv in switchList) == 1)
    
    for t in range(T):
        for rg in switchList:
            m.addConstr(globalVAR.resource_profiles_grnd[rg][t]*var_grnd['res_'+rg,t] + (1-var_grnd['res_'+rg,t]) >= 0.001)
    
    # set optimization objective function #
    m.setObjective(objective_function(act, var, res, res_use, res_var, var_grnd, switchList, T))

    # optimize #
    print "Optimizing..."
    m.params.OutputFlag = 0
    m.optimize()
    end = time.time()
    
    # print solution #
    status = m.status
    if status == GRB.INF_OR_UNBD or status == GRB.INFEASIBLE:
        print 'duh'
    else:
        print_plan(m, res, T)
        print '\nTime Taken:', (end - start), ' sec'
        print('Obj: %g' % m.ObjVal)
    
#    soln = m.getVars()
#    for v in soln:
#        if 'res_' in v.varName and v.X > 0.5:
#            print v.varName, v.X


if __name__ == '__main__':
    domainFile = 'iros/robot/domain.pddl'
    problemFile = 'iros/robot/problem.pddl'
    T = 7
    run_ip(domainFile, problemFile, T)


