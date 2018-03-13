data smoking;
input agegroup $ smoke $ total cases; logtotal=log(total); deathrate=cases*1000/total;
if smoke='yes' then smokenum=1; if smoke='no' then smokenum=0;
datalines;
35-44 no 18793 2
35-44 yes 52407 32
45-54 no 10673 12
45-54 yes 43248 104
55-64 no 5710 28
55-64 yes 28612 206
65-74 no 2585 28
65-74 yes 12663 186
75-84 no 1462 31
75-84 yes 5317 102 
;
proc print; 
run;
