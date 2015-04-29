import sys, os
cmd = 'rm -rf *.log report.txt *.res *.csv *.res.* *.pddl *.dat prob-*-PR'
os.system(cmd)

def main() :
	outstream = open( 'plotPRobs.m', 'w' )
	outstream.write("clc, clear all, close all\n\nprobs = [\n")
	outstream.close()
	
	max_test_no = len(os.listdir(os.getcwd()+'/benchmarks/sendtoexp/'))
    	for test_no in range(1,max_test_no+1):
		print "\n **** test no: " + str(test_no) + " **** \n\n"
 		cmd      = 'python prob_PR.py -e ~/prob-plan-recognition/benchmarks/sendtoexp/test_' + str(test_no) + '.tar.bz2 -G -S' 
       		os.system(cmd)
		instream = open('flag.txt','r')
        	curr = instream.read()
        	instream.close()
		outstream = open( 'plotPRobs.m', 'a' )
		outstream.write(str(curr[1:len(curr)-1]) + ';\n')
		outstream.close()
	
	outstream = open( 'plotPRobs.m', 'a' )
	outstream.write("];\n\nfor i = 1:size(probs,1)\n\tprobs(i,:) = probs(i,:)/sum(probs(i,:));\nend\n\nbar(1:1:length(probs(:,1)),probs,'stacked')\naxis([1 " + str(max_test_no) + " 0 1])\n")
	outstream.close()

if __name__ == '__main__' :
    main()
 
