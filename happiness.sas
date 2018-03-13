
proc import out=happy
     datafile="happy.csv"
     dbms=csv replace;
     getnames=yes;
     datarow=2;
run;

ods graphics on;
proc genmod data=happy; class race;
model happy = trauma race / dist=multinomial link=clogit lrci type3;
effectplot slicefit;
title "Proportional Odds Model using genmod";
run;
proc logistic data=happy plots=effect(at(race=all)); class race;
model happy = trauma race ;
title "Proportional Odds Model using logistic" ;
run; 

proc logistic data=happy plots=all; class race(ref="0")/param=ref;
model happy = trauma race;
run;
ods graphics off;
run;

proc logistic data=happy; 
model happy = trauma race;
title "Proportional Odds Model using indicator variable for race";
run;

proc means data=happy; run;

proc logistic data=happy; *class race;
model happy = trauma race/link=alogit aggregate scale=none;
title "Adjacent Categories Model using logistic";
run;
