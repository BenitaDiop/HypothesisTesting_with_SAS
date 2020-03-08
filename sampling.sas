DM "output;clear;log;clear";
Options pagesize=45 linesize=80 PageNo=1 NoDate;
OPTIONS FORMCHAR="|----|+|---+=|-/\<>*"; 
Title1 "Homework Question 5.11";
ODS HTML body=    "ta5_1-body.html" 
         contents="ta5_1-contents.html" 
         frame=   "ta5_1-frame.html" 
         page=    "ta5_1-page.html"
         headtext="<title>Inference about a Mean Vector</title>"
         anchor="ta5_1";
    title "5.11";
Data Q5_11;
 Sample+1;
 Input Y1-Y2;
 Label 	Y1="Sample Mean One"
        X2="Sample Mean Two";
DataLines;
  3  10 
  6  12
  5  14
  10  9    
;

Proc Print DATA=Q5_11; Id Sample; run;    

title "Multivariate Descriptive Statistics";
Proc IML;
        Use Q5_11;
        Read ALL var{Y1 Y2} into Y; N=NROW(Y); P=NCOL(Y);
        close Q5_11;
        One=SHAPE(1,N,1);
        MeanVec=(One`*Y)/N;
        M=REPEAT(MeanVec,N,1); 
        Sigma=(Y-M)`*(Y-M)/(N-1);
        print MeanVec, Sigma; 
        InvS=inv(Sigma);
        mu0={6 11}; *Ho: mu=[6, 11] Ha: mu ne [6, 11];
        T2=N*(MeanVec-mu0)*invS*(MeanVec-mu0)`; 
        CriticalF=(((N-1)*P)/(N-P))*FINV(0.9, P, N-P); 
        F=(N-P)/((N-1)*P)*T2;
        pval=1-ProbF(F,P,(N-P));
        print T2 CriticalF pval;
run;