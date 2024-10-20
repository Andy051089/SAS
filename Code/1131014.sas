proc import out = cvd
datafile = 'C:\研究所\1131\統計分析與軟體實作\講義\CVD_All.csv'
dbms = csv replace;
getnames = yes;
datarow = 2;
run;

data cvd1;
set cvd;
where gender = 1;
run;

/*第一題*/

proc format;
value agegroupfmt 0 = '青'                               
                  1 = '中'
                  2 = '老';
value CVDfmt 0 = '沒有心血管疾病'
             1 = '有心血管疾病';
run;

data cvd2;
set cvd1;
if age = . then agegroup = .;
else if age < 45 then agegroup = 0;
else if 45 <= age < 70 then agegroup = 1;
else agegroup = 2;
format agegroup agegroupfmt.;
run;

/*第二題*/

proc freq data = cvd2;
table agegroup * CVD;
label CVD = '有無心血管疾病' agegroup = '年齡群';
format CVD CVDfmt.;
run;

proc freq data = cvd2;
table agegroup * CVD  / chisq expected;
label CVD = '有無心血管疾病' agegroup = '年齡群';
format CVD CVDfmt.;
run;
