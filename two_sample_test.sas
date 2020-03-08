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
