
proc format; value id3fmt 1='L' 3='M' 5='C';
             value id5fmt 1,-1='very liberal' 2,-2='liberal' 3,-3='moderate' 
                          4,-4='conservative' 5,-5='very conservative';
             value parfmt 0,2='Republican' 1='Democratic'; 
data ideology;
input party ideology c1 c2 @@;
 if (ideology >=4) then do;
     LMC=5; liberal=0; LorM=0; end;
 else if (ideology=3) then do;
     LMC=3; liberal=0; LorM=1; end;
 else do;
     LMC=1; liberal=1; LorM=1;
	 end;
 nideolog=ideology; * numerical (unformated) ideology;
 format LMC id3fmt. party parfmt. ideology id5fmt.;
 gender='F'; count=c1; output;
 gender='M'; count=c2; output;
 drop c1 c2;
cards;


1 1 44 36   1 2 47 34   1 3 118 53   1 4 23 18   1 5 32 23
0 1 18 12   0 2 28 18   0 3 86 62   0 4 39 45   0 5 48 51

;

	proc logistic data=ideology order=internal; freq count;class party/param=ref;
	model nideolog = party/aggregate scale=none;
	output out=pred_i predprobs=i;    
	title 'POM with party for 5 categories with proc logistic (MLE)';
run;

proc sort data=pred_i; by party;
data pred_i; set pred_i; by party;
	if first.party;
	
run;
data pred_i;
    set pred_i;
    format ip_1-ip_5 7.5;
run;
proc print data=pred_i; var party ip_1-ip_5;
title 'Predicted probabilities for POM';
run; 


proc logistic data=ideology order=internal; freq count;class party/param=ref;
	model nideolog = party/aggregate scale=none link=alogit;
	output out=pred_a predprobs=i;    
	title 'Adjacent Categories Model with party for 5 categories with proc logistic (MLE)';
run;

proc sort data=pred_a; by party;
data pred_a; set pred_a; by party;
	if first.party;
	
run;
data pred_a;
    set pred_a;
    format ip_1-ip_5 7.5;
run;
proc print data=pred_a; var party ip_1-ip_5;
title 'Predicted probabilites for the adjacent categories model';
run; 

proc freq data=ideology; weight count;
tables party*ideology/nopercent nocol nofreq;
title 'Observed row percents by party';
run;

