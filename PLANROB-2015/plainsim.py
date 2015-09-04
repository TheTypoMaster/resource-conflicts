import sys, os

def find_conflicts():
        return False


if __name__ == '__main__' :
        
        robot_domain   = 'iros/robot/robot_domain.pddl'
        robot_problem  = 'iros/robot/robot_problem.pddl'

        cmd = '~/FASTDOWNWARD/src/translate/translate.py ' + str(robot_domain) + ' ' + str(robot_problem)
        os.system(cmd) 
        cmd = '~/FASTDOWNWARD/src/preprocess/preprocess < output.sas'
        os.system(cmd) 
        cmd = '~/FASTDOWNWARD/src/fast-downward.py --plan-file robot_plan.dat output --search "astar(lmcut())"'
        os.system(cmd) 

        human_domain   = 'iros/human/human_domain.pddl'
        human_problem  = 'iros/human/human_problem.pddl'

        cmd = '~/FASTDOWNWARD/src/translate/translate.py ' + str(human_domain) + ' ' + str(human_problem)
        os.system(cmd) 
        cmd = '~/FASTDOWNWARD/src/preprocess/preprocess < output.sas'
        os.system(cmd) 
        cmd = '~/FASTDOWNWARD/src/fast-downward.py --plan-file human_plan.dat output --search "astar(lmcut())"'
        os.system(cmd) 


