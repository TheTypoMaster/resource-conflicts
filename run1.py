import sys, os

def main() :
    max_test_no = 16
    for test_no in range(1,max_test_no+1):
        cmd = 'python prob_PR.py -e ~/prob-plan-recognition/benchmarks/testl_' + str(test_no) + '.tar.bz2 -G -S' 
        os.system(cmd)

if __name__ == '__main__' :
    main()
 
