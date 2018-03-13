data sep;
input x y @@;
cards;
0 0 1 0 2 0 3 0 4 0 5 0
5.5 0
6 1 7 1 8 1 9 1 10 1 11 1

proc logistic des;
title 'data with complete separation';
model y =x; exact x/estimate;
run;

proc logistic des;
model y =x/firth clparm=pl; 
exact x/estimate;
run;
