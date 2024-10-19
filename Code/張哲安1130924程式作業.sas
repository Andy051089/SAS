proc means data = df mean std median qrange maxdec = 2;
class CVD;
var Age Waist SBP DBP;
run;

proc freq data = df;
table CVD*Gender CVD*Drinking CVD*smoking CVD*history;
run;

data cvd0;
input name_1 $ 1-5 mean_sd $ 7-19 Median_IQR $ 21-34  name_2 $ 36-45 count_0 $ 47-61 count_1 $  63-76;
label name_1 = '跑计(硈尿)'
		mean_sd = 'mean∮sd'
		Median_IQR = 'Median(IQR)'
		name_2 = '跑计(摸)'
		count_0 = '"0"计(κだゑ)'
		count_1 = '"1"计(κだゑ)';
list;
datalines;
Age   45.57∮13.43   44.00(18.00)    Gender     36826(62.97%)  21652(37.03%)
Waist 77.90∮10.61   77.00(15.00)    Drinking   43538(76.16%)  13632(23.84%)
SBP   122.32∮20.30  120.00(26.00)   smoking    41629(72.42%)  15854(27.58%)
DBP   77.74∮11.89   76.50(15.50)    history    55772(95.37%)  2706(4.63%)
;

data cvd1;
input name_1 $ 1-5 mean_sd $ 7-19 Median_IQR $ 21-34  name_2 $ 36-45 count_0 $ 47-59 count_1 $  61-73;
label name_1 = '跑计(硈尿)'
		mean_sd = 'mean∮sd'
		Median_IQR = 'Median(IQR)'
		name_2 = '跑计(摸)'
		count_0 = '"0"计(κだゑ)'
		count_1 = '"1"计(κだゑ)';
list;
datalines;
Age   58.96∮12.40   60.00(19.00)   Gender     3612(60.09%)  2399(39.91%)
Waist 82.70∮10.37   82.00(14.50)   Drinking   4525(77.66%)  1302(22.34%)
SBP   132.56∮23.39  130.50(31.50)  smoking    4166(71.30%)  1677(28.70%)
DBP   81.25∮12.35   80.00(16.00)   history    5806(96.59%)  205(3.41%)
;

proc print data = cvd0 label;
title 'CVD=0';
run;
proc print data = cvd1 label;
title 'CVD=1';
run;
