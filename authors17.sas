/*Authors have distinctive literary styles that serve as a way to identify
them from their writing.  One approach to identification uses frequencies
of usage of words with little contextual meaning.  We will analyze a set
of data for four authors, Jane Austen, Jack London, John Milton, and
William Shakespeare, where  word counts were made from blocks of text by these
authors, each containing 1700 words. The original data had 69 words.  The authors 
found 11 words that loaded highly on the first 3 principal components.  Baseline 
logistic models were fit with Shakespeare as the baseline category using frequencies 
of the 11 words as predictors.  The words "been" and "may" were not useful in the 
multinomial logit model, resulting in the final model with 9 predictors.
           */

proc import out=sasuser.authorship
     datafile="authorship.csv"
     dbms=csv replace;
     getnames=yes;
     datarow=2;
run;

ods graphics off;
title 'Box Plot for Word Counts';
proc boxplot data=sasuser.authorship;
   plot (be had it not on the upon was which)*Author;
run;

/* proc logistic is used for multinomial (nominal) logistic regression using the glogit link    
The predprobs=i option says to save estimated probabilities for each level of the response.    */

proc logistic data=sasuser.authorship;
     model Author= be had it not on the upon was which/link=glogit ;
	 output out=author_out predprobs=i;
run;

/* The classification table is based on the created _FROM_ and _INTO_ variables        */

proc freq data=author_out; 
     tables _FROM_*_INTO_ / nocol norow nopercent;
	 run;

proc logistic data=sasuser.authorship;
     model Author= a all also an and any are as at be been but by can do down even every 
for from had has her his if in it its may more must my no not now of on one only or our should
so some such than the their then there things this to up upon was were what when which who will
with would your/link=glogit selection=forward; run;
	 output out=author_out2 predprobs=i;
run;

proc logistic data=sasuser.authorship;
     model Author=the was to or be all been from/link=glogit ;
	 output out=author_out2 predprobs=i;run;

proc freq data=author_out2; 
     tables _FROM_*_INTO_ / nocol norow nopercent;
	 run;
