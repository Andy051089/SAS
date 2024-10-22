/*手動建資料*/
data case; 
input Sub_Num $ 1-2 Sex $ 4 Exam1 6-7 Exam2 9-10 HW_Grade $ 12;
list;
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
/*data後接資料名子
input輸入colname，若col內容為文字加$。再加佔的格數。
list在建立資料時顯示對應格子。
資料打在datalines後*/

/*引入資料*/
proc import out = cvd
datafile = 'C:\CVD_All.csv'
dbms = csv replace;
getnames = yes; 
datarow = 2; 
run;
/*out = 引入資料後的名子
datafile = 檔案位置
dbms = 如果已經有相同名子的資料覆蓋過去
getname = csv中有colname
datarow有colname，從第2行開始讀*/

filename cvd 'C:/CVD_All.csv'; 
data cvd;
infile cvd dsd firstobs = 2;
Input ID CVD;
run;
/*filename接設定檔案名子及位置
data接引入資料後的名子
infile使用filename設定名子，dsd為csv是','隔資料，Firstobs為2跳過colname
infile引入方式input要把所有colname都打上*/

libname hw 'C:\'; 
proc import out = hw.cvd1
datafile = 'C:\CVD_All.csv'
/*原本都是存在work暫存檔
libname設定永久檔名子及位置
第一次一樣import，之後要用就data set方式*/
