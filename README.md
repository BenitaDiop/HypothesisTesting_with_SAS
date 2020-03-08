# Hypothesis Testing On SAS 

Hypothesis testing in the context of multivariate data is more complex then in ordinary univariate case. The number of parameters may be staggering and in statistics is vital to be able to make solid inference about a population, to test our inference we use a method know as hypothesis testing. In hypothesis testing, we use our sample statisitcs to support or discredit a prior hypothesis, or speculation, about the true value of the population parameter.  

************
<br/>
<br/>

<img src"https://user-images.githubusercontent.com/45861503/76169512-34315d00-6136-11ea-972f-e70798fcaa99.png" align="center">

![image](https://user-images.githubusercontent.com/45861503/76169457-84f48600-6135-11ea-907b-03c792809c0f.png)

```SAS
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
```




<br/>


**********
**********


DATA TABLE        |    SAS SUMMARY OUTPUT
:-----------------------:|:--------------------------:
![image](https://user-images.githubusercontent.com/45861503/76158013-001e5380-60c6-11ea-8fbb-6ac8f12a7b6a.png)|![image](https://user-images.githubusercontent.com/45861503/76158081-c0a43700-60c6-11ea-9e09-866a0caa2701.png)




```SAS
DM "output;clear;log;clear";
    title "Lubischew 1962";
    DM "output;clear;log;clear";
Options pagesize=45 linesize=80 PageNo=1 NoDate;
OPTIONS FORMCHAR="|----|+|---+=|-/\<>*"; 
	*To make your document display correctly without SAS Monospace font;
Title1 "Homework Question 5.11";
ODS HTML body=    "ta5_1-body.html" 
         contents="ta5_1-contents.html" 
         frame=   "ta5_1-frame.html" 
         page=    "ta5_1-page.html"
         headtext="<title>Inference about a Mean Vector</title>"
         anchor="ta5_1";
	title "5.16";
Data Beetles;
 flea+1;
 Input y1-y4;
 Label 	y1="Prothorax"
        y2="Elytra"
        y3="2nd Antenna Joint"
        y4="3rd Antenna Joint";
        
DataLines;
 189 245 137 163
 192 260 132 217
 217 276 141 192
 221 299 142 213
 171 239 128 158
 192 262 147 173
 213 278 136 201
 192 255 128 185
 170 244 128 192
 201 276 146 186
 195 242 128 192
 205 263 147 192
 180 252 121 167
 192 283 138 183
 200 294 138 188
 192 277 150 177
 200 287 136 173
 181 255 146 183
 192 287 141 198
 181 305 184 209
 158 237 133 188
 184 300 166 231
 171 273 162 213
 181 297 163 224
 181 308 160 223
 177 301 166 221
 198 308 141 197
 180 286 146 214
 177 299 171 192
 176 317 166 213
 192 312 166 209
 176 285 141 200
 169 287 162 214
 164 265 147 192
 181 308 157 204
 192 276 154 209
 181 278 149 235
 175 271 140 192
 197 303 170 205
;

Proc Print DATA=Beetles; Id Flea; run;
title "Descriptive Statistics Beetle Data";
PROC IML;
  USE Beetles;
  READ ALL VAR {y1 y2 y3 y4} INTO X;
  X1 = X[1:19,];
  X2 = X[20:39,];
  RESET PRINT;
  N1 = NROW(X1);
  N2 = NROW(X2);
  X1BAR = 1/N1*X1`*J(N1,1);
  X2BAR = 1/N2*X2`*J(N2,1);
  S1 = 1/(N1-1)*X1`*(I(N1)-1/N1*J(N1))*X1; 
  S2 = 1/(N2-1)*X2`*(I(N2)-1/N2*J(N2))*X2;    
  Spl = 1/(N1+N2-2)*((N1-1)*S1+(N2-1)*S2);     
  T2 = N1*N2/(N1+N2)*(X1BAR-X2BAR)`*INV(Spl)*(X1BAR-X2BAR);
RUN;
```

<br/>

**********************************
***************************


```SAS
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

```
