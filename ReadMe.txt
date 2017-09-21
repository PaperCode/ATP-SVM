==============================================================
0,This is the experimental code for the following paper:
"Support Vector Machine Classifier with Asymmetrical Truncated Pinball Loss"
Authors: Xin Shen, Ruizhi Zhou,  Lingfeng Niu, and Ran He
==============================================================
1, The code comprises of two parts: the first one is modified based on LIBSVM to implement the nonlinear ATP-SVM, the second one is modified based on LIBLINEAR to implement linear ATP-SVM.
Citations:
[1] Chih-Chung Chang and Chih-Jen Lin, LIBSVM : a library for support vector machines. ACM Transactions on Intelligent Systems and Technology, 2:27:1--27:27, 2011. Software available at http://www.csie.ntu.edu.tw/~cjlin/libsvm
[2] R.-E. Fan, K.-W. Chang, C.-J. Hsieh, X.-R. Wang, and C.-J. Lin.LIBLINEAR: A Library for Large Linear Classification, Journal of
Machine Learning Research 9(2008), 1871-1874. Software available at http://www.csie.ntu.edu.tw/~cjlin/liblinear
==============================================================
2, For the nonlinear ATP-SVM, most command line options are the same with LIBSVM 3.2.1, except the following ones: 
-s 5: denotes our method;
-y: Set hyper-parameter s in the paper;
-u: Set hyper-parameter t in the paper;
-i: Set hyper-parameter $\tau$ in the paper;
-o: Set the termination accuracy of CCCP iterations;
-e: Set the termination accuracy of inner decomposition method;
Usage demo:(Linux command)
./svm-train -s 5 -h 0 -g 0.125 -c 64 -y 1.2 -u -1 -i 0.5 -o 0.0001 australian
CCCP outer optimization finished, #number of outer iters = 6
Percentage of SVs:54.250000  
The training time is 0.072746

./svm-predict australian.t australian.model australian.t.predict
Accuracy = 87.931% (255/290) (classification)
==============================================================
2, For the linear ATP-SVM, most command line options are the same with LIBSVM 3.2.1, except the following ones): 
The usage is the same with LIBLINEAR except that
-s 8: denotes our method;
-a: denotes hyper-parameter 's';
-t: denotes hyper-parameter 't';
-u: denotes hyper-parameter 'tau';
Note: the meanings of parameters 's' and 't' are a bit different from the paper. The formulas to transform between them are:
s'=s-1
t'=1-t
s and t are the hyper-parameters used in the paper, s' and t' are the hyper-parameters used to set in the solver.
Usage demo:(Linux command)
./train -s 8 -c 1 -a 0.1 -t 2 -u 0.5 real-sim
CCCP outer optimization finished, #outer iter = 5
Percentage of SVs:40.290000  
Training Time:0.070596 seconds.

./predict real-sim.t real-sim.model output
Accuracy = 95.9% (4795/5000)
