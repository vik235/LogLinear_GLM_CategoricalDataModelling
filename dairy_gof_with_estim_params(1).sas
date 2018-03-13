data a; 
input f; 
do i=1 to f; 
 y=_n_; output; 
end;
cards;
30
63
63
;
proc nlmixed data=a;
  parms theta=.5;
  p1=theta**2;
  p2=theta*(1-theta);
  p3=(1-theta);
  if      y=1 then p=p1;
  else if y=2 then p=p2;
  else             p=p3;
  /* make sure p is a valid probability value */
  p = (p>0 and p<=1)*p + (p<=0)*1e-8 + (p>1);
  loglik = log(p);
  model y ~ general(loglik);
  estimate 'p1' theta**2;
  estimate 'p2' theta*(1-theta);
  estimate 'p3' 1-theta;
  title "Use NL mixed to find the mle of theta";
  run;

* Use the estimates found above as the estimated cell probabilities in the test below;

proc freq data=a;
table y / chisq(df=-1 testp=(.24401 .24996 .50602) lrtest);
run;
