;    *       These data come from  Hosmer and Lemeshow (2000) Applied Logistic
 Regression: Second Edition.  These data are copyrighted by John Wiley &
 Sons Inc. and must be acknowledged and used accordingly.;
options ls=78 ps=40 nocenter nodate;
data sasuser.mammog; 
input obs me sympt pb hist bse detc; detcd=(detc=3); never=(me=0);
detlik=(detc=2); symptag=(sympt<3);
cards;
        4          1          3         11          0          1          3  
        5          2          4          7          0          1          3  
        1          0          3          7          0          1          2  
        2          0          2         11          0          1          3  
        3          0          3          8          1          1          3  
        6          0          3          7          0          1          3  
        7          2          4          6          0          1          2  
        8          0          4          6          0          1          3  
        9          0          2          6          0          1          3  
       10          1          4          6          0          1          3  
       11          0          4          8          0          1          2  
       12          0          3          6          1          0          3  
       13          0          4          6          0          1          3  
       14          0          1          5          1          1          3  
       15          0          2          8          0          0          2  
       16          0          4         11          0          1          3  
       17          0          3          6          0          1          3  
       18          1          4          5          0          1          3  
       19          0          3         10          0          1          3  
       20          0          3         10          0          1          3  
       21          2          3          5          0          1          3  
       22          0          4          5          0          1          2  
       23          0          1          5          0          1          3  
       24          0          2          8          0          1          2  
       25          1          2          9          1          1          2  
       26          2          4          7          0          1          3  
       27          0          4          7          0          1          2  
       28          0          3         10          0          1          3  
       29          2          3          7          0          1          2  
       30          0          3          7          0          1          3  
       31          1          4          7          0          1          2  
       32          2          2          5          0          1          3  
       33          2          3          8          0          1          3  
       34          0          1          5          0          1          3  
       35          0          2          9          0          1          3  
       36          2          3         11          0          1          3  
       37          1          3          7          0          1          3  
       38          2          3          9          1          1          1  
       39          0          3          5          1          1          3  
       40          1          3          5          1          1          3  
       41          0          2         10          0          0          1  
       42          0          4          5          0          1          3  
       43          0          3          9          0          1          2  
       44          0          2          8          0          1          2  
       45          1          3          9          0          1          3  
       46          0          3          5          0          1          3  
       47          0          3          9          0          1          2  
       48          0          2          9          0          0          1  
       49          0          1         12          0          0          1  
       50          0          4          9          0          1          2  
       51          2          4          5          0          1          3  
       52          0          2          6          0          1          2  
       53          1          4          8          0          1          3  
       54          0          4          7          0          1          3  
       55          2          3          9          0          1          2  
       56          1          4          6          0          1          2  
       57          1          4          6          1          1          2  
       58          0          3         10          0          1          3  
       59          0          2         12          0          1          2  
       60          0          4          6          0          1          3  
       61          0          1          6          0          0          3  
       62          0          3         10          0          1          3  
       63          0          2         12          0          0          3  
       64          2          4          6          0          1          3  
       65          0          2          9          0          1          3  
       66          0          2          9          0          1          3  
       67          0          3          9          0          0          2  
       68          0          4          6          0          1          1  
       69          0          3          8          0          0          3  
       70          0          3          6          0          1          3  
       71          1          4          5          1          1          3  
       72          0          3         10          0          0          3  
       73          0          4          6          0          1          3  
       74          0          1          6          0          1          2  
       75          1          4          5          0          1          3  
       76          1          4          5          0          1          3  
       77          0          2          6          0          1          2  
       78          1          3          5          0          1          2  
       79          0          2          7          0          1          3  
       80          1          1          6          0          0          2  
       81          2          4          7          0          1          3  
       82          1          1          6          0          1          3  
       83          1          4          7          1          0          3  
       84          1          4          6          0          1          3  
       85          0          4          5          0          1          3  
       86          1          3          9          0          1          3  
       87          2          2          6          0          1          3  
       88          0          2         11          0          0          3  
       89          0          4          9          0          0          3  
       90          2          1          9          0          0          1  
       91          0          2          7          0          0          2  
       92          0          3         10          0          1          3  
       93          1          4          8          0          1          3  
       94          1          3          6          0          1          3  
       95          0          3          7          0          1          3  
       96          1          3          8          1          1          3  
       97          0          2         10          0          1          3  
       98          0          3          7          1          1          3  
       99          0          1          9          0          1          3  
      100          2          4          6          0          1          3  
      101          2          4          8          0          1          3  
      102          0          2          8          0          1          3  
      103          0          4          8          0          1          3  
      104          2          4          6          0          1          3  
      105          0          2         10          0          1          2  
      106          2          4          5          0          1          3  
      107          0          4          5          0          1          3  
      108          0          3          5          1          1          3  
      109          1          3          7          0          1          3  
      110          0          3         10          0          1          3  
      111          1          3          5          0          1          3  
      112          2          3          8          0          1          3  
      113          0          3          5          0          1          2  
      114          0          1         13          0          1          1  
      115          0          2          6          0          1          3  
      116          2          4          5          0          0          2  
      117          1          3          6          0          1          3  
      118          0          4          9          0          1          3  
      119          0          1          5          0          1          2  
      120          0          4          6          0          0          3  
      121          1          4         10          0          1          3  
      122          1          4          7          0          1          3  
      123          0          4          7          0          0          3  
      124          2          3          7          0          1          2  
      125          0          4          5          0          1          3  
      126          0          1          5          0          1          3  
      127          2          2          7          1          1          3  
      128          2          3         11          0          1          1  
      129          1          4          6          0          1          3  
      130          0          1          8          0          1          2  
      131          0          3          8          0          1          3  
      132          0          3          9          0          1          3  
      133          2          3          9          1          1          2  
      134          1          4          5          0          1          3  
      135          0          2          7          0          1          3  
      136          0          1         10          0          1          2  
      137          1          3          6          0          1          3  
      138          1          3         10          0          1          3  
      139          1          3          5          0          1          3  
      140          0          4          8          0          0          2  
      141          0          1          9          0          1          2  
      142          0          3          9          0          1          1  
      143          1          4          6          0          1          3  
      144          0          4         11          0          0          3  
      145          0          2          9          0          0          1  
      146          0          3          9          0          1          2  
      147          0          4         12          0          1          2  
      148          0          1         11          0          1          3  
      149          1          3         10          0          1          3  
      150          1          3          9          0          1          3  
      151          0          2          6          0          1          3  
      152          2          3          5          0          1          3  
      153          1          3          7          1          1          3  
      154          1          3          9          0          1          3  
      155          1          4          6          0          1          3  
      156          2          3          8          1          1          3  
      157          0          1          8          0          1          3  
      158          0          4          5          0          1          3  
      159          0          3          8          0          1          3  
      160          0          4          8          0          1          2  
      161          2          1         10          0          1          2  
      162          1          4          9          0          1          3  
      163          0          4         10          0          1          3  
      164          2          4          9          0          1          3  
      165          1          4          6          0          1          3  
      166          0          1          7          0          1          2  
      167          0          3          5          0          0          3  
      168          2          3          5          0          1          3  
      169          2          4          9          0          1          2  
      170          0          3          9          0          1          3  
      171          0          1          5          0          1          3  
      172          2          1          5          0          1          3  
      173          0          4          6          0          1          3  
      174          0          3          6          0          1          3  
      175          1          4          6          0          1          3  
      176          0          3         10          0          0          3  
      177          0          4          6          0          1          3  
      178          1          3          5          1          1          2  
      179          0          2          9          0          0          3  
      180          1          3          7          1          1          3  
      181          0          3         10          0          0          3  
      182          1          3          8          0          1          2  
      183          2          2          7          0          1          2  
      184          0          2          9          0          1          3  
      185          0          3         13          0          1          2  
      186          0          4          6          0          0          3  
      187          0          3          8          0          1          2  
      188          2          3         10          0          0          3  
      189          0          2         10          0          1          2  
      190          0          4         11          0          1          2  
      191          0          4          7          0          1          3  
      192          2          3          8          1          1          3  
      193          2          4         10          0          0          3  
      194          0          3         11          0          1          3  
      195          2          3          9          1          1          2  
      196          1          4          5          1          1          3  
      197          2          3          7          0          1          2  
      198          1          4          7          0          1          3  
      199          0          3          9          0          1          3  
      200          1          3          5          0          1          3  
      201          0          2         10          0          1          2  
      202          1          4          5          0          1          3  
      203          1          3          5          0          1          3  
      204          1          3          9          0          1          2  
      205          0          2          7          0          0          2  
      206          0          1         10          0          1          3  
      207          1          4          5          1          1          3  
      208          0          4          6          0          1          2  
      209          0          3          5          0          1          3  
      210          1          3          7          0          1          3  
      211          1          3          8          0          1          2  
      212          0          2          9          0          1          3  
      213          0          1          6          0          0          2  
      214          0          2         13          1          1          3  
      215          0          2          9          1          1          3  
      216          2          4          7          0          1          3  
      217          0          4          5          0          0          3  
      218          0          1          6          0          1          2  
      219          0          3          8          0          1          3  
      220          1          4          7          0          1          3  
      221          0          3          6          0          1          3  
      222          0          3          5          0          1          3  
      223          1          4          5          0          1          3  
      224          0          3          6          0          1          3  
      225          0          4          9          0          1          2  
      226          1          3          8          0          1          3  
      227          0          3          5          0          1          3  
      228          2          2          8          0          1          3  
      229          1          4          6          1          1          3  
      230          2          4          6          0          1          2  
      231          0          2          8          0          1          2  
      232          2          1         10          0          1          3  
      233          0          2          7          0          1          2  
      234          1          4          5          0          0          3  
      235          1          3          6          1          1          3  
      236          0          2         11          0          1          2  
      237          0          4          5          0          1          3  
      238          0          4          8          0          1          3  
      239          0          2          7          0          1          2  
      240          1          2          7          0          1          3  
      241          0          3         11          1          0          1  
      242          0          1          5          0          1          3  
      243          2          4          5          0          1          3  
      244          1          4          6          0          1          3  
      245          0          1          8          0          0          3  
      246          1          4          5          0          0          3  
      247          2          3          6          1          1          3  
      248          2          4          8          0          1          3  
      249          0          3          6          0          1          3  
      250          0          1         11          0          1          1  
      251          0          3          9          0          1          3  
      252          0          3         10          0          1          3  
      253          0          1          5          0          1          2  
      254          1          3          5          0          1          3  
      255          1          4          5          0          1          3  
      256          2          4          5          1          1          3  
      257          0          4          6          0          1          3  
      258          0          4          7          0          1          3  
      259          1          3         10          0          1          3  
      260          2          3         10          0          0          1  
      261          0          3          8          0          1          3  
      262          0          4          6          0          1          3  
      263          2          4          6          0          1          3  
      264          0          3         10          0          1          3  
      265          0          4          6          0          1          3  
      266          0          2         11          0          0          2  
      267          0          3          9          0          1          1  
      268          0          3          8          0          1          2  
      269          1          2          6          0          1          3  
      270          1          3          9          0          1          3  
      271          1          3          6          1          1          3  
      272          0          2         10          1          1          3  
      273          0          3          7          0          1          2  
      274          1          3          6          0          1          3  
      275          2          3          8          0          1          3  
      276          1          4          5          0          1          3  
      277          0          3         10          0          1          3  
      278          0          4          8          0          1          3  
      279          0          2         11          1          1          1  
      280          0          4          7          0          1          3  
      281          1          3          9          0          1          3  
      282          1          4          7          1          1          3  
      283          0          3          9          0          0          2  
      284          0          2          9          1          1          2  
      285          0          3          6          0          1          3  
      286          0          2          6          0          1          2  
      287          1          4          5          1          1          3  
      288          0          3          5          0          0          3  
      289          0          4         10          0          1          3  
      290          0          2          9          0          1          3  
      291          0          3          6          0          1          3  
      292          0          3          7          0          1          2  
      293          1          2         10          0          1          1  
      294          0          3         10          0          1          3  
      295          0          1          7          0          0          3  
      296          2          4          7          0          1          3  
      297          0          4          6          0          1          3  
      298          0          3         12          0          1          3  
      299          0          3          8          0          0          3  
      300          0          2          8          0          1          2  
      301          0          4          6          0          1          2  
      302          0          3         10          0          0          3  
      303          2          3          5          0          1          3  
      304          0          2         10          0          1          2  
      305          1          4          8          0          0          3  
      306          1          4          5          0          1          3  
      307          0          4         11          0          1          2  
      308          2          2         10          0          1          3  
      309          2          3          5          0          1          3  
      310          2          3          5          0          1          3  
      311          0          3          5          0          1          3  
      312          1          4          6          0          1          3  
      313          0          3          7          0          1          2  
      314          0          3          7          0          1          1  
      315          0          2          6          1          0          2  
      316          1          4          5          0          1          3  
      317          2          4          5          0          1          3  
      318          1          4          7          1          1          2  
      319          0          3         10          0          1          3  
      320          1          4          8          0          1          3  
      321          1          4          8          1          1          3  
      322          0          3          9          0          1          3  
      323          0          2         11          0          0          1  
      324          1          4          5          0          1          3  
      325          0          3         10          0          1          3  
      326          1          4          6          0          1          3  
      327          1          4          5          0          1          3  
      328          0          3         10          0          1          2  
      329          1          3          7          0          1          3  
      330          1          4          6          0          1          3  
      331          0          2         10          0          1          3  
      332          0          2          7          0          1          3  
      333          2          4          6          0          1          2  
      334          2          4          8          0          1          3  
      335          2          4          5          1          1          3  
      336          2          3         10          1          1          3  
      337          0          3          6          0          1          3  
      338          2          4          5          0          1          2  
      339          0          1          9          0          1          3  
      340          0          4          6          0          1          2  
      341          1          3          6          0          1          3  
      342          0          2         10          0          0          2  
      343          0          3          5          0          1          3  
      344          0          3          9          0          0          3  
      345          0          1          8          0          1          2  
      346          0          3          9          0          1          2  
      347          1          4          9          0          1          3  
      348          2          3         10          0          1          3  
      349          0          4         10          0          1          3  
      350          0          3          7          0          1          3  
      351          0          2          6          0          1          3  
      352          1          3          6          0          1          3  
      353          0          2         12          0          1          2  
      354          2          1          7          0          1          3  
      355          0          4          6          0          0          3  
      356          0          1          9          0          1          2  
      357          0          2          8          1          1          3  
      358          0          2         10          0          1          2  
      359          0          4          5          0          1          3  
      360          1          3          6          0          1          3  
      361          2          3          5          0          1          3  
      362          0          2          5          0          1          3  
      363          1          4          9          0          1          3  
      364          0          1         11          0          0          2  
      365          0          3         11          0          1          3  
      366          2          4          8          0          1          3  
      367          0          1         10          0          1          3  
      368          2          4          6          0          1          3  
      369          1          4          5          1          1          3  
      370          0          4         10          0          1          3  
      371          1          4          5          0          1          3  
      372          2          4          6          0          1          3  
      373          1          4          6          0          1          3  
      374          0          3          5          0          1          3  
      375          0          2         11          0          1          2  
      376          1          3         10          0          1          3  
      377          1          4          9          0          1          3  
      378          2          3          6          1          1          3  
      379          0          3          9          0          1          2  
      380          0          2          9          0          1          2  
      381          0          3          9          0          0          3  
      382          2          3          9          0          1          3  
      383          2          3         10          0          1          3  
      384          0          3          9          0          1          3  
      385          2          3         12          0          1          2  
      386          0          1         11          0          1          3  
      387          0          1          5          0          1          2  
      388          1          4          5          0          1          3  
      389          2          4          5          0          1          3  
      390          0          3         17          0          0          2  
      391          1          3          6          0          1          3  
      392          0          2          6          0          1          3  
      393          0          2         10          0          1          2  
      394          1          3          5          0          1          3  
      395          0          3          5          0          1          3  
      396          0          1          5          0          1          2  
      397          0          2         10          0          0          2  
      398          0          4          6          0          1          2  
      399          2          3          6          0          1          2  
      400          0          2          7          0          1          2  
      401          0          2          8          0          0          3  
      402          1          3          9          0          1          3  
      403          1          4          5          0          1          3  
      404          0          2         12          0          1          2  
      405          0          3         10          0          1          2  
      406          2          3          5          0          1          3  
      407          0          3         11          0          1          2  
      408          1          3         10          0          1          2  
      409          0          4          8          0          1          3  
      410          1          4          6          0          1          3  
      411          2          2          6          0          1          3  
      412          0          4          7          0          1          3  
;

proc logistic desc data=sasuser.mammog; class detc(ref=last) sympt(ref=first)/param=ref;
model me(ref=last)=detc sympt pb hist  bse/link=glogit;
title 'Baseline odds models with original variables using logistic';
run;

proc logistic desc data=sasuser.mammog;
model me(ref=last)=detcd symptag pb hist  bse/link=glogit;
title 'Baseline odds model with dichotomized variables using logistc';
run;

/*
proc catmod data=sasuser.mammog order=data; response logits; direct pb;
model me=detc sympt pb hist  bse/noprofile ;
title 'baseline odds using catmod';
*/

proc logistic desc data=sasuser.mammog; class detc sympt; 
model me=detc sympt pb hist bse;
title 'POM with original variables using logistic';

proc logistic desc data=sasuser.mammog; class detc sympt; 
model me=detcd symptag pb hist bse;
title 'POM with dichotomized variables using logistic';


run;

data mammog2; set sasuser.mammog; if me=1 then me=4;

proc logistic desc data=mammog2; class detc sympt; 
model me=detc sympt pb hist bse;
title 'POM with original predictors using logistic (reordered ME)';

proc logistic desc data=mammog2; class detc sympt; 
model me=detcd symptag pb hist bse;
title 'POM with dichotomized predictors using logistic (reordered ME)';
run;

