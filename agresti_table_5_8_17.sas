
data table5_8;
input race $ month $  c1-c2;
count=c1; resp='yes'; output;
count=c2; resp='no'; output; drop c1-c2; 
cards;
black july 0 7
black august 0 7
black sept 0 8
white july 4 16	
white august 4 13
white sept 2 13
;
proc freq order=data; weight count;
tables race*resp/chisq;
exact or; 
title 'Table 5.8, collapsed over months';
run;

proc logistic desc; freq count;	class race/param=ref;
model resp=race;
exact race/estimate=both onesided;
title 'Table 5.8 in Agresti, race as predictor';
run;
proc freq order=data; weight count;
tables month*race*resp/chisq cmh;
exact eqor comor mhchi;
title 'Table 5.8 as a three-way table';
run;

proc logistic desc; freq count;
class race month;
model resp=race month;
title "Logistic regression for homogeneous association model";




proc logistic desc; freq count;
class race month/param=ref;
model resp=race month ;
exact race month/estimate=both onesided;
title "Exact logistic regression for homogeneous association model";


run;
/*proc logistic desc; freq count;
class race month/param=ref;
model resp=race month race*month;
exact race month race*month/estimate=both;*/
