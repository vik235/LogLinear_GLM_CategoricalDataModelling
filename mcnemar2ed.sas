options nocenter nodate ps=60 ls=90;
*SAS program for the data in Table 10.1;
data paired1; input q1 $ q2$ count @@;
cards;
yes yes 227 yes no 132
 no yes  107  no no 678




 
data matched1;
input case occasion response count ;
datalines;
  1  1 1  227     
 1  0 1  227      
 2  1 1  132      
 2  0 0  132 
 3  1 0  107      
 3  0 1  107      
 4  1 0  678      
 4  0 0  678
 ;



proc nlmixed data=matched1 qpoints=200; 
  eta = alpha + beta*occasion + u;  p = exp(eta)/(1 + exp(eta));
  model  response ~ binary(p);
  random u ~ normal(0, sigma*sigma) subject = case;
  replicate count;
title 'Analysis of Opinion Data Using NLMIXED';
run;
data longway1; 
keep pair survey1 event;
 set paired1; retain tcount 0;
 do i=1 to count;
   pair=i+tcount;
   if q1="yes" then do;
   survey1=1; event=0; output;
   end;
   if q2="yes" then do;
   survey1=0; event=0; output;
   end;
   if q1="no" then do;
   survey1=1; event=1; output;
   end;
   if q2="no" then do;
   survey1=0; event=1; output;
   end;
  end;
  tcount=tcount+count;

proc glimmix data=longway1 method = quad( QPOINTS=200);
class survey1;
model event(desc)=survey1/solution dist=binary link=logit;
random intercept/subject=pair;
title 'Analysis of Opinion Data Using GLIMMIX';
run;
data matched2;
input case occasion response count ;
datalines;
 1  1 1  794     
 1  0 1  794      
 2  1 1  150      
 2  0 0  150 
 3  1 0   86      
 3  0 1   86      
 4  1 0  570      
 4  0 0  570

proc nlmixed data=matched2 qpoints=200;
  eta = alpha + beta*occasion + u;  p = exp(eta)/(1 + exp(eta));
  model  response ~ binary(p);
  random u ~ normal(0, sigma*sigma) subject = case;
  replicate count;
  title 'Analysis of Prime Minister Data using NLMIXED';
run; 
data paired2; input approve1 $ approve2$ count @@;
cards;
yes yes 794 yes no 150
 no yes  86  no no 570

data longway2; keep pair survey1 event;
 set paired2; retain tcount 0;
 do i=1 to count;
   pair=i+tcount;
   if approve1="yes" then do;
   survey1=1; event=0; output;
   end;
   if approve2="yes" then do;
   survey1=0; event=0; output;
   end;
   if approve1="no" then do;
   survey1=1; event=1; output;
   end;
   if approve2="no" then do;
   survey1=0; event=1; output;
   end;
  end;
  tcount=tcount+count;

proc glimmix data=longway2 method = quad( QPOINTS=200) or;
class survey1;
model event (desc)=survey1/solution dist=binary link=logit;
random intercept/subject=pair;
title 'Analysis of Prime Minister Data using GLIMMIX';
run;


