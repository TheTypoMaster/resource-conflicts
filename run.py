import sys, os

def main() :
    max_test_no = 1
    for test_no in range(1,max_test_no+1):
        cmd = 'python prob_PR.py -e ~/prob-plan-recognition/benchmarks/test_' + str(test_no) + '.tar.bz2 -G -S' 
        os.system(cmd)
        instream = open('flag.txt','r')
        flag = instream.read()
        if flag == 'True':
            print '\n\n Recognized at observation #' + str(test_no)
            break

if __name__ == '__main__' :
    main()
 
