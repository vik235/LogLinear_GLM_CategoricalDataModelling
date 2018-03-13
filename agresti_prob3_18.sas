data soccer;
input team attendance arrests;
datalines;

1 404 308
2 286 197
3 443 184
4 169 149
5 222 132
6 150 126
7 321 110
8 189 101
9 258 99
10 223 81
11 211 79
12 215 78
13 108 68
14 210 67
15 224 60
16 211 57
17 168 55
18 185 44
19 158 38
20 429 35
21 226 29
22 150 20
23 148 19
proc genmod; model arrests = attendance / dist=poisson link=identity noint;
output out=data1 predicted=pre;

proc sort data=data1 out=data2; by attendance;

proc gplot data=data2;
symbol1 i=none color=red value=plus;
symbol2 i=sm50 color=black value=circle;
plot arrests*attendance pre*attendance/overlay;
run;
