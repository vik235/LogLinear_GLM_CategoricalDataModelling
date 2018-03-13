
data nbawest;
input winner $ loser $ symm count @@;
cards;
gs sa 1 1 gs ho 2 3 gs la 3 4  gs ut 4 2 gs oc 5 4  gs me  6 2  gs po 7 4 
sa gs 1 2  sa ho 8 3 sa la 9 1 sa ut 10 2 sa oc 11 2 sa me 12 2 sa po 13 2
ho gs 2 1 ho sa 8 1 ho la 14 2 ho ut 15 1 ho oc 16 3 ho me 17 2 ho po 18 2
la gs 3 0 la sa 9 3 la ho 14 1 la ut 19 3 la oc 20 2 la me 21 3 la po 22 3
ut gs 4 1 ut sa 10 2 ut ho 15 2 ut la 19 1 ut oc 23 1 ut me 24 1 ut po 25 2
oc gs 5 0 oc sa 11 1 oc ho 16 1 oc la 20 2 oc ut 23 3 oc me 26 3 oc po 27 1
me gs 6 2 me sa 12 2 me ho 17 2 me la 21 1 me ut 24 3 me oc 26 1 me po 28 1
po gs 7 0 po sa 13 2 po ho 18 1 po la 22 0 po ut 25 2 po oc 27 3 po me 28 2
;

proc freq data=nbawest order=data; weight count;
tables winner*loser/norow nocol nopct;
run;

proc genmod data=nbawest; class symm winner(ref="po") loser/param=ref; 
model count=symm winner /dist=poi link=log type3;
title 'Bradley-Terry model using quasi-symmetry model';
run; 


data nbawest2; input win n gs sa ho la ut oc me po;
cards;
1 3 1 -1 0 0 0 0 0 0
3 4 1 0 -1 0 0 0 0 0
4 4 1 0 0 -1 0 0 0 0
2 3 1 0 0 0 -1 0 0 0
4 4 1 0 0 0 0 -1 0 0
2 4 1 0 0 0 0 0 -1 0
4 4 1 0 0 0 0 0 0 -1
3 4 0 1 -1 0 0 0 0 0 
1 4 0 1 0 -1 0 0 0 0
2 4 0 1 0 0 -1 0 0 0
2 3 0 1 0 0 0 -1 0 0 
2 4 0 1 0 0 0 0 -1 0
2 4 0 1 0 0 0 0 0 -1
2 3 0 0 1 -1 0 0 0 0
1 3 0 0 1 0 -1 0 0 0
3 4 0 0 1 0 0 -1 0 0
2 4 0 0 1 0 0 0 -1 0
2 3 0 0 1 0 0 0 0 -1
3 4 0 0 0 1 -1 0 0 0
2 4 0 0 0 1 0 -1 0 0
3 4 0 0 0 1 0 0 -1 0
3 3 0 0 0 1 0 0 0 -1
1 4 0 0 0 0 1 -1 0 0
1 4 0 0 0 0 1 0 -1 0
2 4 0 0 0 0 1 0 0 -1
3 4 0 0 0 0 0 1 -1 0
1 4 0 0 0 0 0 1 0 -1
1 3 0 0 0 0 0 0 1 -1
;
proc genmod data=nbawest2;
model win/n= gs sa ho la ut oc me po/dist=bin link=logit noint covb;
title 'Bradley-Terry Model using logistic regression';

run;
