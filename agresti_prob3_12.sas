data wafers;
input trt $ imp_count z;
cards;
A 8	0
A 7	0
A 6	0
A 6	0
A 3	0
A 4	1
A 7	1
A 2	1
A 3	1
A 4	1
B 9	0
B 9	0
B 8	0
B 14 0
B 8	0
B 13 1
B 11 1
B 5	1
B 7	1
B 6	1
;
proc genmod data=wafers;
class trt (ref='A')/param=ref;
model imp_count = trt z / dist=p link=log;
run;
