*      These data come from  Hosmer and Lemeshow (2000) Applied Logistic
 Regression: Second Edition.  These data are copyrighted by John Wiley &
 Sons Inc. and must be acknowledged and used accordingly. You should run the
 SAS program umaru16.sas to create the data set, "sasuser.uis";

;
proc logistic des data=sasuser.uis; model dfree=age ndrgtx ivhx_2 ivhx_3 race treat site 
/lackfit aggregate scale=none;
title 'Main Effects Model with Logistic';
run;
proc genmod des data=sasuser.uis; model dfree=age ndrgtx ivhx_2 ivhx_3 race treat site 
/dist=bin link=logit type3;
title 'Main Effects Model with Genmod';
run;

proc logistic des data=sasuser.uis; model dfree=age ndrgfp1 ndrgfp2 ivhx_2 ivhx_3 race treat site
/lackfit aggregate scale=none;
title 'Main Effects Model replacing NDRGTX';
run;

proc logistic des data=sasuser.uis; model dfree=age ndrgfp1 ndrgfp2 ivhx_2 ivhx_3 race treat site age*treat
/lackfit aggregate scale=none;
title 'Model with age*treat interaction';
run;

proc logistic des data=sasuser.uis; model dfree=age ndrgtx ivhx_2 ivhx_3 race treat site  age*ndrgtx
/lackfit aggregate scale=none;
title 'Model with  age*ndrgtx Interaction';
run;

proc logistic des data=sasuser.uis; model dfree=age ndrgfp1 ndrgfp2 ivhx_2 ivhx_3 race treat site
race*site/lackfit aggregate scale=none;
title 'Model with  race*site Interaction';
run;

proc logistic des data=sasuser.uis; model dfree=age ndrgfp1 ndrgfp2 ivhx_2 ivhx_3 race treat site  age*ndrgfp1
/lackfit aggregate scale=none;
title 'Model with  age*ndrgfp1 Interaction';
run;

proc logistic des data=sasuser.uis; model dfree=age ndrgfp1 ndrgfp2 ivhx_2 ivhx_3 race treat site  age*ndrgfp2
/lackfit aggregate scale=none;
title 'Model with  age*ndrgfp2 Interaction';
run;

proc logistic des data=sasuser.uis; model dfree=age ndrgfp1 ndrgfp2 ivhx_2 ivhx_3 race treat site  age*ndrgfp1 age*ndrgfp2
/lackfit aggregate scale=none;
title 'Model with  age*ndrgfp1 age*ndrgfp2 Interaction';
run;

proc logistic des data=sasuser.uis; model dfree=age ndrgfp1 ndrgfp2 ivhx_2 ivhx_3 race treat site age*treat age*ndrgfp1
race*site/lackfit aggregate scale=none;
title 'Model with  3 added Interactions';
run;

proc logistic des data=sasuser.uis; model dfree=age ndrgfp1 ndrgfp2 ivhx_2 ivhx_3 race treat site  age*ndrgfp1
race*site/lackfit aggregate scale=none;
title 'Model with  2 added Interactions';
run;



/*proc logistic des data=sasuser.uis; model dfree=age ndrgfp1 ndrgfp2 ivhx_2 ivhx_3 race treat site 
	age*ndrgfp1 age*ndrgfp2 age*ivhx_2 age*ivhx_3 age*race age*treat age*site ndrgfp1*ndrgfp2 ndrgfp1*ivhx_2
ndrgfp1*race ndrgfp1*treat ndrgfp1*site ndrgfp2*ivhx_2 ndrgfp2*race ndrgfp2*treat ndrgfp2*site
ivhx_2*ivhx_3 ivhx_2*race ivhx_2*treat ivhx_2*site ivhx_3*race ivhx_3*treat ivhx_3*site
race*treat race*site treat*site/selection=forward slentry=0.15 start=8;
    title 'Forward Selection with All 2-Way Interactions'; run;

proc logistic des data=sasuser.uis; model dfree=age ndrgfp1 ndrgfp2 ivhx_2 ivhx_3 race treat site 
	age*ndrgfp1 age*ndrgfp2 age*ivhx_2 age*ivhx_3 age*race age*treat age*site ndrgfp1*ndrgfp2 ndrgfp1*ivhx_2
ndrgfp1*race ndrgfp1*treat ndrgfp1*site ndrgfp2*ivhx_2 ndrgfp2*race ndrgfp2*treat ndrgfp2*site
ivhx_2*ivhx_3 ivhx_2*race ivhx_2*treat ivhx_2*site ivhx_3*race ivhx_3*treat ivhx_3*site
race*treat race*site treat*site/selection=backward slstay=0.15 include=8;
title 'Backward Elimination with All 2-Way Interactions'; run;

proc logistic des data=sasuser.uis; model dfree=age ndrgfp1 ndrgfp2 ivhx_2 ivhx_3 race treat site 
	age*ndrgfp1 age*ndrgfp2 age*ivhx_2 age*ivhx_3 age*race age*treat age*site ndrgfp1*ndrgfp2 ndrgfp1*ivhx_2
ndrgfp1*race ndrgfp1*treat ndrgfp1*site ndrgfp2*ivhx_2 ndrgfp2*race ndrgfp2*treat ndrgfp2*site
ivhx_2*ivhx_3 ivhx_2*race ivhx_2*treat ivhx_2*site ivhx_3*race ivhx_3*treat ivhx_3*site
race*treat race*site treat*site/selection=stepwise slentry=0.15 slstay=0.20 include=8;
title 'Stepwise Selection with All 2-Way Interactions'; run;

proc logistic des data=sasuser.uis; model dfree=age ndrgfp1 ndrgfp2 ivhx_2 ivhx_3 race treat site 
	age*ndrgfp1 age*ndrgfp2 age*ivhx_2 age*ivhx_3 age*race age*treat age*site ndrgfp1*ndrgfp2 ndrgfp1*ivhx_2
ndrgfp1*race ndrgfp1*treat ndrgfp1*site ndrgfp2*ivhx_2 ndrgfp2*race ndrgfp2*treat ndrgfp2*site
ivhx_2*ivhx_3 ivhx_2*race ivhx_2*treat ivhx_2*site ivhx_3*race ivhx_3*treat ivhx_3*site
race*treat race*site treat*site/selection=score best=4 include=8;
title 'All Possible Regressions with All 2-Way Interactions'; run;

proc logistic des data=sasuser.uis; model dfree=age ndrgfp1 ndrgfp2 ivhx_2 ivhx_3 race treat site 
	age*ndrgfp1 age*ndrgfp2 age*ivhx_2 age*ivhx_3 age*race age*treat age*site ndrgfp1*ndrgfp2 ndrgfp1*ivhx_2
ndrgfp1*race ndrgfp1*treat ndrgfp1*site ndrgfp2*ivhx_2 ndrgfp2*race ndrgfp2*treat ndrgfp2*site
ivhx_2*ivhx_3 ivhx_2*race ivhx_2*treat ivhx_2*site ivhx_3*race ivhx_3*treat ivhx_3*site
race*treat race*site treat*site/selection=forward slentry=0.15;
    title 'Forward Selection with All 2-Way Interactions'; run;
*/
run;

