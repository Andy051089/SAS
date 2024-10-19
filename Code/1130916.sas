/*第一個程式作業*/
data case; 
input Sub_Num $ 1-2 Sex $ 4 Exam1 6-7 Exam2 9-10 HW_Grade $ 12;
datalines;
12 M 80 84 A
07 M 85 89 A
04 F 90 86 B
20 M 82 85 B
25 F 94 94 A
14 F 88 84 C
22 M 72 85 A
15 F 98 75 B
11 F 84 62 B
16 M 80 78 C
21 M 95 93 A
18 F 83 78 B
;
/*qrange = IQR*/
proc univariate data = case;
var Exam1 Exam2;
run;

proc univariate data = case;
class Sex;
var Exam1 Exam2;
run;
/*使用PROC SUMMARY 不加PRINT不會印出來
proc summary data = case std mean median qrange print;
class Sex;
var Exam1 Exam2;
output out = summary;(把結果存進summary)
run;
*/
data output;
input Sex $ 1-13 Mean_sd $ 15-26 Median_IQR $ 29-40;
datalines;
Overall Exam1 85.92(7.43)   84.50(11.00)
Exam2         82.75(8.69)    84.50(9.50)
M Exam1       82.33(7.55)   81.00(5.00)
Exam2         85.67(5.05)   85.00(5.00)
F Exam1       89.50(5.79)   89.00(10.00)
Exam2         79.83(10.96)  81.00(11.00)
;

/*第二個程式作業*/
data mistake;
input id $ 1-3 town $ 5-7 region $ 9-10 year 12-13 budget 15-16 voter 18-22;
datalines;
001 040 05 04 22 12345
002 030 06 05 20 15555
004 040 33 03 30 14556
004 040 33 03 30 14556
004 040 33 03 30 14556
004 040 33 03 30 14556
;
proc means data = mistake n std mean;
var year budget voter;
run;
