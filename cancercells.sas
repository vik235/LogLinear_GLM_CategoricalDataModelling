options ls=90 ps=55 nocenter nodate;
data cancer; n=400;
input Occasion	Survived; id=_n_; prop=survived/400;
cards;
1   178
1	193
1	217
2	109
2	112
2	115
3	66
3	75
3	80
4	118
4	125
4	137
5	123
5	146
5	170
6	115
6	130
6	133
7	200
7	189
7	173
8	88
8	76
8	90
9	121
9	124
9	136
;

proc means data=cancer;
var survived prop;
run;

proc genmod; model survived/n= /dist=bin link=logit;
title 'Binomial model using genmod';



proc logistic; model survived/n= /aggregate scale=none;
title 'Binomial model using logistic';

proc genmod; class occasion(ref=last)/param=ref;
model survived/n=occasion/dist=bin link=logit;
output out=out0 pred=predbyfixed;
title 'Binomial model with occasion as a fixed effect';

proc glimmix method=quad(qpoints=20);  class occasion;
model survived/n= occasion/dist=bin link=logit solution;
title 'GLMM for binomial with occasion as fixed effect'; run;
run;

proc glimmix;  class occasion;
model survived/n= /dist=bin link=logit solution;
random 	 intercept/subject=occasion ;
output out=out1 pred(blup ilink)=predicted;
title 'GLMM for binomial with occasion as random effect'; run;

proc nlmixed;
eta=alpha+u;
p = exp(eta)/(1 + exp(eta));
  model  survived ~ binomial(n,p);
  random u  ~ normal(0, sigmasq) subject = id;
  title 'Analysis of glmm with random occasion effect Using NLMIXED';

proc glimmix;  class occasion;
model survived/n= /dist=bin link=logit solution;
random 	 intercept occasion/subject=id ;
title 'GLMM for binomial with id(occasion) as random effect';
output out=out2 pred(blup ilink)=predicted2;
run;

data combined;
merge  out0 out1 out2;
proportion=survived/400;
proc print; var id occasion survived proportion predbyfixed predicted predicted2;
run;
/*
proc glimmix;  class occasion;
model survived/n= /dist=bin link=logit solution ddfm = kr;
random   intercept/subject=id;
run;


proc glimmix method=quad(qpoints=2);  class occasion;
model survived/n= occasion/dist=bin link=logit solution;
random 	 intercept/subject=id(occasion) ;
title 'GLMM for binomial with occasion as fixed effect and random dish effect';	run;

proc glimmix method=rspl;  class occasion;
model survived/n= /dist=bin link=logit solution;
random 	intercept occasion/subject=occasion;
title 'GLMM for binomial with occasion and dish within occasion as random effects';	run; 

proc nlmixed;
eta=alpha+u;
p = exp(eta)/(1 + exp(eta));
  model  survived ~ binomial(n,p);
  random u  ~ normal(0, sigmasq) subject = id;
  title 'Analysis of glmm with random occasion effect Using NLMIXED';

run;
proc sort; by occasion;
proc glimmix method=rspl;  by occasion;
model survived/n= /dist=bin link=logit solution;
*random 	intercept /subject=id;
title 'by occasion GLMM for binomial with  dish within occasion as random effects';	run; 

proc glimmix method=mspl;  class occasion;
model survived/n= /dist=bin link=logit solution;
random 	intercept occasion/subject=_n_;

proc glimmix method=rspl;  class occasion;
model survived/n= /dist=bin link=logit solution;
random 	intercept occasion/subject=_n_;

proc glimmix method=rmpl;  class occasion;
model survived/n= /dist=bin link=logit solution;
random 	intercept occasion/subject=_n_;

proc glimmix method=mmpl;  class occasion;
model survived/n= /dist=bin link=logit solution;
random 	intercept occasion/subject=_n_;
*/
run;
