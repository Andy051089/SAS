/*第一題*/
filename cvd 'C:/研究所/1131/統計分析與軟體實作/講義/CVD_All.csv';

data cvd;
infile cvd dsd firstobs = 2;
Input ID CVD age gender waist SBP DBP GLU HDL drinking	history	smoking smoking_level;
run;

data cvd1;
set cvd (firstobs = 20 obs = 3000 keep = age waist smoking);
run;

/*第二題*/
proc means data = cvd1 q1 p50 q3 maxdec = 2;
var age;
run;

data cvd2;
set cvd1;
if age = . then agegroup = .;
else if age <= 36 then agegroup = 0;
else if 36 < age <= 42 then agegroup = 1;
else if 42 < age <= 51 then agegroup = 2;
else agegroup = 3;
run;

proc means data = cvd2 mean std median qrange maxdec = 2;
class agegroup;
var waist;
run;

proc format;
value smokingfmt 0 = '沒抽菸'
                              1 = '有抽菸';
value agegroupfmt 0 = '36歲以下'
                               1 = '37歲至42歲'
                               2 = '43歲至51歲'
                               3 = '52歲以上';
run;

data ans;
input agegroup 1 mean_sd $ 3-14 median_IQR $ 16-27;
label mean_sd = 'mean±sd' median_IQR = 'median(IQR)';
format agegroup agegroupfmt.;
datalines;
0 73.65±10.45 72.00(13.00)
1 76.26±9.98  74.50(14.00)
2 77.81±9.59  76.25(13.00)
3 83.06±9.71  83.00(13.00)
;
run;

proc print data = ans label;
run;

proc univariate data = cvd2 normal;
class agegroup;
var waist;
ods select TestsForNormality;
run;

/*第三題*/
proc freq data = cvd2;
table agegroup*smoking;
label smoking = '有無抽菸' agegroup = '年齡分組';
format smoking smokingfmt. agegroup agegroupfmt.;
run;
