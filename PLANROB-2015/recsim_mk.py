#!/usr/bin/python
import sys, os, ast, copy, numpy, glob
import globalVAR, readFiles, resource_plan
import time

def run_on_one_instance(file):

        print file
        cmd = 'rm -rf *.log report.txt agent-*-plan.txt hyp-*-probs_over_time.csv *.res *.soln *.csv *.res.* *.pddl *.dat prob-*-PR'
        os.system(cmd)

	human_file = 'iros/test.tar.bz2'
	cmd = 'python prob_PR.py -e ' + str(human_file) + '> stdout.txt'
        os.system(cmd)

	cmd = 'mkdir -p results && tar -jxvf results.tar.bz2 -C results/ > stdout.txt'
	os.system(cmd)

        hyps = []
	instream = open('results/hyps.dat','r')
        line = instream.readline().strip()
	while line != '':
                line  = line.split(',') 
                hyps.append([ll[ll.find('(')+1:ll.find(')')].strip().replace(' ','_').upper() for ll in line])
                line = instream.readline().strip()
        instream.close()

        instream = open('flag.txt','r')
        curr = ast.literal_eval(instream.read().strip())
        instream.close()
        curr = [float(i)/sum(curr) for i in curr]

        T = 25
        num_kits = 5
        medkits = ['MK1','MK2','MK3','MK4','MK5']
        medkits = medkits[0:num_kits]
        mk_groundings = ['AT_?_ROOM1','AT_?_ROOM2','AT_?_ROOM3','AT_?_ROOM4','AT_?_ROOM5','AT_?_HALL1','AT_?_HALL2','AT_?_HALL3','AT_?_HALL4','AT_?_HALL5']
        globalVAR.resource_profiles_use = {}
        globalVAR.resource_profiles_grnd = {}
        for mk in medkits:
                globalVAR.resource_profiles_use[mk,'IN_USE'] = numpy.zeros(T+1)
                for grnd in mk_groundings:
                        tt = grnd.replace('?',mk)
                        globalVAR.resource_profiles_grnd[tt] = numpy.zeros(T+1)
                        
                
        for idx in range(len(hyps)):
                goal    = hyps[idx]
                #print '\nGoal : ', goal, ' :: probability = ', curr[idx]
                gotodir = 'results/prob-' + str(idx) + '-PR/O/'
                domainFile   = gotodir +  'pr-domain.pddl'
                problemFile  = gotodir + 'pr-problem.pddl'
                readFiles.read_input(domainFile, problemFile,'human') 

                #print '\nPlan: '
                cmd = '~/Desktop/FAST-DOWNWARD/src/translate/translate.py ' + str(domainFile) + ' ' + str(problemFile) + '> stdout.txt'
                os.system(cmd) 
                cmd = '~/Desktop/FAST-DOWNWARD/src/preprocess/preprocess < output.sas > stdout.txt'
                os.system(cmd) 
                cmd = '~/Desktop/FAST-DOWNWARD/src/fast-downward.py --plan-file plan_' + str(idx) + '.dat output --search "astar(lmcut())" > stdout.txt'
                os.system(cmd) 
                planFile = 'plan_' + str(idx) + '.dat'
                instream = open(planFile, 'r')
                current_plan = []
                while True:
                        line = instream.readline().strip()
                        if 'cost' in line:
                                break
                        current_plan.append(line[line.find('(')+1:line.find(')')].strip().replace(' ','_').upper())

                #for action in current_plan:
                #        print action

                temp_profiles_use = {}
                temp_profiles_grnd = {}
                for mk in medkits:

                        temp_profiles_use[mk] = numpy.zeros(T+1)
                        for grnd in mk_groundings:
                                tt = grnd.replace('?',mk)
                                temp_profiles_grnd[tt] = numpy.zeros(T+1)
                                temp_profiles_grnd[tt][0] = globalVAR.initState_human[globalVAR.listOfPredicates_human.index(tt)]*curr[idx]
                                
                        flag = 0
                        for action in current_plan:
                                step = current_plan.index(action)
                                if 'PICK_UP' in action and mk in action:
                                        flag = 1
                                if 'DROP_OFF' in action and mk in action:
                                        flag = 0
                                temp_profiles_use[mk][step] = flag*curr[idx]
                                
                                for grnd in mk_groundings:
                                        tt = grnd.replace('?',mk)
                                        temp_profiles_grnd[tt][step+1] = temp_profiles_grnd[tt][step]
                                
                                if flag == 1:

                                        if 'MOVE' in action:
                                                ext = ''
                                                if 'OBS' in action:
                                                        ext = action.split('_')[-2]
                                                else:
                                                        ext = action.split('_')[-1]
                                                ext = 'AT_' + mk + '_' + ext

                                                for grnd in mk_groundings:
                                                        tt = grnd.replace('?',mk)
                                                        temp_profiles_grnd[tt][step+1] = 0
                                                temp_profiles_grnd[ext][step+1] = flag*curr[idx]

                        for step in range(len(current_plan),T+1):
                                temp_profiles_use[mk][step] = temp_profiles_use[mk][step-1]
                                for grnd in mk_groundings:
                                        tt = grnd.replace('?',mk)
                                        temp_profiles_grnd[tt][step] = temp_profiles_grnd[tt][step-1]
                                                
                for step in range(T+1):
                        for mk in medkits:
                                globalVAR.resource_profiles_use[mk,'IN_USE'][step] += temp_profiles_use[mk][step]
                                for grnd in mk_groundings:
                                        tt = grnd.replace('?',mk)
                                        globalVAR.resource_profiles_grnd[tt][step] += temp_profiles_grnd[tt][step]
                
                                        
        domainFile = 'iros/robot/mk'+str(num_kits)+'/domain.pddl'
        problemFile = 'iros/robot/mk'+str(num_kits)+'/problem.pddl'
        time = [10, 15, 20, 25]
        for tt in time:
                resource_plan.run_ip(domainFile, problemFile, tt)


if __name__ == '__main__' :
        #file = 'iros/test.tar.bz2'
        #run_on_one_instance(file)
        count = 0
        fileList = sorted(glob.glob('prob-plan-generator/test_dom1/*tar*'))
        for file in fileList:
                start = time.time()
                run_on_one_instance(file)
                end = time.time()
                print 'Time Taken:', (end - start), ' sec'
                count += 1
                if count == 10:
                        break
