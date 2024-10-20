/*第一題*/
libname hw 'C:\研究所\1131\統計分析與軟體實作\作業';

proc import out = hw.cvd1
datafile = 'C:\研究所\1131\統計分析與軟體實作\講義\CVD_All.csv'
dbms = csv replace;
getnames = yes;
datarow = 2;
run;

data work.cvd2;
set hw.cvd1(keep = CVD age waist SBP DBP smoking firstobs = 2000 obs = 5000);
run;

/*第二題*/
/*2-1*/
proc format;
value CVDfmt 0 = '無心血管疾病' 
	     1 = '有心血管疾病';
value BPfmt 0 = '無高血壓' 
	    1 = '有高血壓';
run;

data cvd3;
set work.cvd2;
if SBP = . | DBP = . then BP = .;
else if SBP > 120 | DBP > 80 then BP = 1;
else BP = 0;
format CVD CVDfmt. BP BPfmt.;
label BP = '有無高血壓' CVD = '有無心血管疾病';
run;
/*2-2*/
proc freq data = cvd3;
table CVD*BP;
run;
