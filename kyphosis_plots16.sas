data kyphosis; 
input case Kyphosis $ Age Number Start; age2=Age*Age;
y=0; if Kyphosis="present" then y=1; ind=0;
if Start>12 then ind=1;
cards;
1    absent  71      3     5
2    absent 158      3    14
3   present 128      4     5
4    absent   2      5     1
5    absent   1      4    15
6    absent   1      2    16
7    absent  61      2    17
8    absent  37      3    16
9    absent 113      2    16
10  present  59      6    12
11  present  82      5    14
12   absent 148      3    16
13   absent  18      5     2
14   absent   1      4    12
15   absent 168      3    18
16   absent   1      3    16
17   absent  78      6    15
18   absent 175      5    13
19   absent  80      5    16
20   absent  27      4     9
21   absent  22      2    16
22  present 105      6     5
23  present  96      3    12
24   absent 131      2     3
25  present  15      7     2
26   absent   9      5    13
27   absent   8      3     6
28   absent 100      3    14
29   absent   4      3    16
30   absent 151      2    16
31   absent  31      3    16
32   absent 125      2    11
33   absent 130      5    13
34   absent 112      3    16
35   absent 140      5    11
36   absent  93      3    16
37   absent   1      3     9
38  present  52      5     6
39   absent  20      6     9
40  present  91      5    12
41  present  73      5     1
42   absent  35      3    13
43   absent 143      9     3
44   absent  61      4     1
45   absent  97      3    16
46  present 139      3    10
47   absent 136      4    15
48   absent 131      5    13
49  present 121      3     3
50   absent 177      2    14
51   absent  68      5    10
52   absent   9      2    17
53  present 139     10     6
54   absent   2      2    17
55   absent 140      4    15
56   absent  72      5    15
57   absent   2      3    13
58  present 120      5     8
59   absent  51      7     9
60   absent 102      3    13
61  present 130      4     1
62  present 114      7     8
63   absent  81      4     1
64   absent 118      3    16
65   absent 118      4    16
66   absent  17      4    10
67   absent 195      2    17
68   absent 159      4    13
69   absent  18      4    11
70   absent  15      5    16
71   absent 158      5    14
72   absent 127      4    12
73   absent  87      4    16
74   absent 206      4    10
75   absent  11      3    15
76   absent 178      4    15
77  present 157      3    13
78   absent  26      7    13
79   absent 120      2    13
80  present  42      7     6
81   absent  36      4    13
;
/*
proc logistic desc;
model kyphosis=age age*age;
output out=new pred=predicted;
 
proc sort data=new out=new2; by Age;

proc gplot data=new2;
symbol1 i=none color=red value=plus;
symbol2 i=sm0 color=black value=point;
plot  y*Age predicted*Age/overlay;
run;


*/

proc logistic desc data=kyphosis;
model y = Age Number Start/ aggregate scale=none;
output out=ky1 predicted=pre1 xbeta=atx1 resdev=resid1;
title 'Kyphosis Data from Hastie and Tibshirani--Linear in Age';

proc sort data=ky1 out=ky2; by Age;

proc gplot data=ky2; 
symbol1 i=none color=red value=plus; 
symbol2 i=sm70 color=black value=circle;
symbol3 i=sm70 color=blue value=point;
plot  y*Age pre1*Age y*Age/overlay;
run;

proc sort data=ky1 out=ky4; by Start;

proc gplot data=ky4; 
symbol1 i=none color=red value=plus; 
symbol2 i=sm70 color=black value=circle;
symbol3 i=sm70 color=blue value=point;
plot y*Start pre1*Start y*Start /overlay;
run;

proc sort data=ky1 out=ky5; by atx1;

proc gplot data=ky5;
symbol1 i=sm70 color=red value=plus; 
symbol2 i=sm70 color=black value=circle;
plot y*atx1 pre1*atx1/overlay;
run;

proc logistic desc data=kyphosis;
model y = Age  age2 Number Start/ aggregate scale=none;
output out=ky6 predicted=pre2 xbeta=atx2 resdev=resid2;
title 'Kyphosis Data from Hastie and Tibshirani--Quadratic in Age';

proc sort data=ky6 out=ky7; by Age;

proc gplot data=ky7; 
symbol1 i=none color=red value=plus; 
symbol2 i=sm70 color=black value=circle;
symbol3 i=sm70 color=blue value=point;
plot  y*Age pre2*Age y*Age/overlay;
run;

proc sort data=ky6 out=ky8; by Start;

proc gplot data=ky8; 
symbol1 i=none color=red value=plus; 
symbol2 i=sm70 color=black value=circle;
symbol3 i=sm70 color=blue value=point;
plot y*Start pre2*Start y*Start /overlay;
run;

proc sort data=ky6 out=ky9; by atx2;

proc gplot data=ky9;
symbol1 i=sm70 color=red value=plus; 
symbol2 i=sm70 color=black value=circle;
plot y*atx2 pre2*atx2/overlay;
run;

proc logistic desc data=kyphosis;
model y = Age  age2 ind/ aggregate scale=none;
output out=ky10 predicted=pre3 xbeta=atx3 resdev=resid3;
title 'Kyphosis Data--Quadratic in Age, Indicator for Start';

proc sort data=ky10 out=ky11; by Age;

proc gplot data=ky11; 
symbol1 i=none color=red value=plus; 
symbol2 i=sm70 color=black value=circle;
symbol3 i=sm70 color=blue value=point;
plot  y*Age pre3*Age y*Age/overlay;
run;

proc sort data=ky10 out=ky12; by Start;

proc gplot data=ky12;
symbol1 i=none color=red value=plus; 
symbol2 i=sm70 color=black value=circle;
symbol3 i=sm70 color=blue value=point;
plot y*Start pre3*Start y*Start /overlay;
run;

proc sort data=ky10 out=ky13; by atx3;

proc gplot data=ky13;
symbol1 i=sm70 color=red value=plus; 
symbol2 i=sm70 color=black value=circle;
plot y*atx3 pre3*atx3/overlay;
run;

