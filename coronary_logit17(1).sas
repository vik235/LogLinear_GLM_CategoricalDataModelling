* The following data are based on a study of coronary artery disease (Koch et al. 1985).  
Investigators were interested in whether electrocardiogram (ECG) measurement was 
associated with disease status.  Gender was thought to be associated with disease status, 
so investigators post-stratified the data into male and female groups.  There was also i
interest in examining the odds ratios.;

data coronary;
input gender $ ECG $ disease $ count;
cards;
female <0.1  yes 4
female <0.1  no 11
female >=0.1 yes 8
female >=0.1 no 10
male   <0.1  yes 9
male   <0.1  no  9
male   >=0.1 yes 21
male   >=0.1 no   6
;
run;
proc freq order=data;
weight count;
tables gender*ECG*disease/nocol nopct cmh chisq expected relrisk;
title 'Analysis of disease data using proc freq';
run;

* param ref gets dummy variable parametrization ;
proc logistic desc; freq count; class gender ECG/param=ref;
model disease= gender ECG/scale=none aggregate lackfit;
title 'Model assuming homogeneity to test conditional independence';
run; 

*This hard sets the reference level;
proc logistic desc; freq count; class gender(ref=first) ECG/param=ref;
model disease= gender ECG/scale=none aggregate lackfit;
title 'Model assuming homogeneity to test conditional independence';
run;

*Above 2 will fit the same model with different references;

*Below is an interaction model. Alternativel gender | ECG which includes main effects and interaction b, all of them separated by a |;
proc logistic desc data=coronary; freq count; class gender ECG;
model disease=gender ECG gender*ECG/scale=none aggregate lackfit;
title 'Model with interaction to test homogeneity';
run;

proc logistic desc data=coronary; freq count; class gender;
model disease=gender/aggregate scale=none;
title 'model with gender only with aggregate';
run;


proc logistic desc data=coronary; freq count; class gender;
model disease=gender/aggregate=(gender ECG) scale=none;
title 'model with gender only with aggregate=(gender ECG)';
run;

proc logistic desc data=coronary; freq count; class ECG;
model disease=ECG/aggregate=(gender ECG) scale=none;
title 'model with ECG only with aggregate=(gender ECG)';
run;

proc logistic desc data=coronary; freq count; class ECG;
model disease=/aggregate=(gender ECG) scale=none;
title 'model with intercept only with aggregate=(gender ECG)';
run;

data coronary2;
input gender $ ECG $ cases total;
cards;
female <0.1 4 15
female >=0.1 8 18
male   <0.1  9 18
male   >=0.1 21 27
male   >=0.1 6
;

proc logistic desc; class gender(ref=first) ECG/param=ref;
model cases/total= gender ECG/scale=none aggregate lackfit;
title 'Model assuming homogeneity to test conditional independence';
run;


proc logistic desc; class gender(ref=first) ECG/param=ref;
model cases/total= gender|ECG/scale=none aggregate lackfit;
title 'Model to test homogeneity ';
run;
