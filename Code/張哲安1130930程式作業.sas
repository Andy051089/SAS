/*�Ĥ@�D*/
libname hw 'C:\��s��\1131\�έp���R�P�n���@\�@�~';

proc import out = hw.cvd1
datafile = 'C:\��s��\1131\�έp���R�P�n���@\���q\CVD_All.csv'
dbms = csv replace;
getnames = yes;
datarow = 2;
run;

data work.cvd2;
set hw.cvd1(keep = CVD age waist SBP DBP smoking firstobs = 2000 obs = 5000);
run;

/*�ĤG�D*/
/*2-1*/
proc format;
value CVDfmt 0 = '�L�ߦ�ޯe�f' 
						1 = '���ߦ�ޯe�f';
value BPfmt 0 = '�L������' 
					 1 = '��������';
run;

data cvd3;
set work.cvd2;
if SBP = . | DBP = . then BP = .;
else if SBP > 120 | DBP > 80 then BP = 1;
else BP = 0;
format CVD CVDfmt. BP BPfmt.;
label BP = '���L������' CVD = '���L�ߦ�ޯe�f';
run;
/*2-2*/
proc freq data = cvd3;
table CVD*BP;
run;
