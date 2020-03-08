DM "output;clear;log;clear";
Options pagesize=45 linesize=80 PageNo=1 NoDate;
OPTIONS FORMCHAR="|----|+|---+=|-/\<>*"; 
Title1 "Homework Question 5.22";
ODS HTML body=    "ta5_1-body.html" 
         contents="ta5_1-contents.html" 
         frame=   "ta5_1-frame.html" 
         page=    "ta5_1-page.html"
         headtext="<title>Bronchous Cancer Treatment Study</title>"
         anchor="ta5_22";
    title "Cancer";
Data Cancer;
 Cancer+1;
 Input Y1-Y4;
 Label 	Y1="Admission_Acorbate"
        Y2="Untreatability_Ascorbate"
        Y3="Admissions_Control"
        Y4="Untreatability_Control";
DataLines;
     81  74  72 33
    461 423 134 18
     20  16  84 20
    450 450  98 58
    246  87  48 13
    166 115 142 49
     63  50 113 38
     64  50  90 24
    155 113  30 18
    151  38 260 34
    166 156 116 20
     37  27  87 27
    223 218  69 32
    138 138 100 27
     72  39 315 39
    245 231 188 65 
;

Proc Print DATA=Cancer; Id Cancer; run;
title "Descriptive Statistics Cancer Data";
PROC IML;
  USE Cancer;
  READ ALL VAR{y1 y2} INTO X1;
  READ ALL VAR{y3 y4} INTO X2;
  D = X1 - X2;
  N = NROW(D);
  DBAR = 1/N*D`*J(N,1);
  S = 1/(N-1)*D`*(I(N)-1/N*J(N))*D;
  print DBAR, S;
  InvS=inv(S/N);
  MU={0, 0}; 
  T2=(DBAR-MU)`*invS*(DBAR-MU);
  print T2;
RUN;
