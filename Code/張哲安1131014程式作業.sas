proc import out = cvd
datafile = 'C:\��s��\1131\�έp���R�P�n���@\���q\CVD_All.csv'
dbms = csv replace;
getnames = yes;
datarow = 2;
run;

data cvd1;
set cvd;
where gender = 1;
run;

/*�Ĥ@�D*/

proc format;
value agegroupfmt 0 = '�C'
                               1 = '��'
							   2 = '��';
value CVDfmt 0 = '�S���ߦ�ޯe�f'
                        1 = '���ߦ�ޯe�f';
run;

data cvd2;
set cvd1;
if age = . then agegroup = .;
else if age < 45 then agegroup = 0;
else if 45 <= age < 70 then agegroup = 1;
else agegroup = 2;
format agegroup agegroupfmt.;
run;

/*�ĤG�D*/

proc freq data = cvd2;
table agegroup * CVD;
label CVD = '���L�ߦ�ޯe�f' agegroup = '�~�ָs';
format CVD CVDfmt.;
run;

proc freq data = cvd2;
table agegroup * CVD  / chisq expected;
label CVD = '���L�ߦ�ޯe�f' agegroup = '�~�ָs';
format CVD CVDfmt.;
run;
