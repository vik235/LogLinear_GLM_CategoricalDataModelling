data hockey; 
input quarter $ count; 
datalines;
Jan-Mar 14
Apr-Jun 6
Jul-Sep	3
Oct-Dec 2
proc freq data=hockey order=data;
weight count;
tables quarter/nocum testp=(25 25 25 25)chisq(lrchisq);
exact chisq lrchisq;
title 'Birthdates on Junior Hockey League Roster';
run;
