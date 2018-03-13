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
proc freq order=data;
weight count;
tables gender*ECG*disease/nocol nopct cmh chisq expected relrisk;
title 'Analysis of disease data using proc freq';

proc genmod data=coronary; class gender ECG disease/param=ref;
model count=disease|gender|ECG @2/dist=p link=log type3;
title 'Model assuming homogeneity to test conditional independence (DG,DE,GE)';
run; 


proc genmod data=coronary; class gender ECG disease/param=ref;
model count=disease|gender|ECG/dist=p link=log type3;
title 'Model with interaction to test homogeneity (DGE)';
run;

proc genmod data=coronary; class gender ECG disease/param=ref;
model count=disease gender ECG/dist=p link=log type3;
title 'Independence model (D,G,E)';
run;


proc genmod data=coronary; class gender ECG disease/param=ref;
model count=disease gender ECG disease*ECG disease*gender/dist=p link=log type3;
title 'Homogeneous association model omitting gender*ECG (DG,DE)';
run;

