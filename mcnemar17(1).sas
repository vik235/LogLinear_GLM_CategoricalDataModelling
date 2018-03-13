
data paired; input approve1 $ approve2$ count @@;
cards;
yes yes 794 yes no 150
 no yes  86  no no 570
;
proc freq data=paired order=data;
table approve1*approve2/norow nocol agree;
weight count;
title 'Approval Rating Data--McNemars Test';
run;
/*
proc catmod data=paired; weight count;
response marginals;
model approve1*approve2= (1 0, 1 1);
title 'Using catmod to get ci for difference in proportions';
run; 
*/
data marginal;
input y x count;
cards;
1 1 944
0 1 656
1 0 880
0 0 720

proc logistic desc data=marginal; freq count;
model y=x;
title 'Marginal Model using logit link';

proc genmod desc data=marginal; freq count;
model y=x/dist=bin link=identity;
title 'Marginal Model with identity link';
run;

data discord; set paired;
if approve1=approve2 then delete;

proc logistic data=discord desc;
model approve1=; freq count;
contrast 'OR' intercept 1/estimate=exp;
title 'Analysis of Discordant Pairs (Problem 8.28)';
run;

data longway; keep pair survey approve;
 set paired; retain tcount 0;
 do i=1 to count;
   pair=i+tcount;
   if approve1="yes" then do;
   survey=1; approve=1; output;
   end;
   if approve2="yes" then do;
   survey=2; approve=1; output;
   end;
   if approve1="no" then do;
   survey=1; approve=0; output;
   end;
   if approve2="no" then do;
   survey=2; approve=0; output;
   end;
  end;
  tcount=tcount+count;
; 

 proc phreg data=longway nosummary;
 strata pair;
 model approve=survey/ties=DISCRETE RL;
 title 'Analysis as a Clustered Data Set';
run;
 data longway; set longway; approve=1-event; survey1=2-survey1;

run;
 proc freq data=longway;
 table pair*survey*approve/noprint cmh1;
 title 'CMH Test for 2x2x1600 Table';


data longw; set longway; survey=2-survey;
 proc logistic data=longw desc;
 strata pair;
 model approve=survey;
 title 'Analysis as a clustered data set using logistic';
 run;

proc genmod data=longw desc;
class pair;
model approve=survey/dist=bin link=logit;
repeated subject=pair/type=exch;
title 'analysis as a clustered data set using genmod (estimates marginal OR)';
run;

proc genmod data=longway desc;
class pair survey;
model approve=survey/dist=bin link=identity;
repeated subject=pair;
lsmeans survey/diff cl;
title 'analysis as a clustered data set using genmod (estimates diff. in marginal prop.)';
run;
/*
data matched2;
input case occasion response count ;
datalines;
 1  0 1  794     
 1  1 1  794      
 2  0 1  150      
 2  1 0  150 
 3  0 0   86      
 3  1 1   86      
 4  0 0  570      
 4  1 0  570

proc nlmixed data=matched2 qpoints=200;
  eta = alpha + beta*occasion + u;  p = exp(eta)/(1 + exp(eta));
  model  response ~ binary(p);
  random u ~ normal(0, sigma*sigma) subject = case;
  replicate count;
  title 'Analysis of Prime Minister Data using NLMIXED';

proc glimmix  data=longway method = quad( QPOINTS=200);
class survey1;
model event=survey1/solution dist=binary link=logit;
random intercept/subject=pair;
title 'Analysis of Prime Minister Data using GLIMMIX';
run;
*/

data paired2; input approve1 $ approve2$ count m11 m22 m1;
cards;
yes yes 794 1 0 0 
yes no 150  -1 0 1 
 no yes  86  -1 0 1
no no 570   0 1 0
;
proc genmod data=paired2;
model count = m11  m22  m1 /
dist=poi link=identity noint;
title 'Test of Marginal Homogeneity for 2x2 Table';
run;
