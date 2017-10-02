/**************************************************************************
 Program:  Voice_Q20.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  07/20/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Q20. Rating scale

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Voices )

*options obs=100;

%let NUM_LEVELS = 5;

data VoicesDMVSurvey2017;

  set Voices.VoicesDMVSurvey2017;
  
  ***where dov_urban = 1;   ** District of Columbia **;

  retain total 1;

  array Q20{*} Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i;
  array sQ20{*} sQ20_a sQ20_b sQ20_c sQ20_d sQ20_e sQ20_f sQ20_g sQ20_h sQ20_i;
  array dQ20{9,&NUM_LEVELS} 
    dQ20_a1 dQ20_a2 dQ20_a3 dQ20_a4 dQ20_a5 
    dQ20_b1 dQ20_b2 dQ20_b3 dQ20_b4 dQ20_b5
    dQ20_c1 dQ20_c2 dQ20_c3 dQ20_c4 dQ20_c5
    dQ20_d1 dQ20_d2 dQ20_d3 dQ20_d4 dQ20_d5
    dQ20_e1 dQ20_e2 dQ20_e3 dQ20_e4 dQ20_e5
    dQ20_f1 dQ20_f2 dQ20_f3 dQ20_f4 dQ20_f5
    dQ20_g1 dQ20_g2 dQ20_g3 dQ20_g4 dQ20_g5
    dQ20_h1 dQ20_h2 dQ20_h3 dQ20_h4 dQ20_h5
    dQ20_i1 dQ20_i2 dQ20_i3 dQ20_i4 dQ20_i5
    ;

  do i = 1 to dim( Q20 );
   
    if Q20{i} = -1 then do;
     
      Q20{i} = .;
       
    end;
    else do;
   
      sQ20{i} = Q20{i};
       
      do j = 1 to &NUM_LEVELS;
      
        if Q20{i} = j then dQ20{i,j} = 1;
        else dQ20{i,j} = 0;
        
      end;
      
    end;
   
  end;

   format     Q20_a Q20_A.;
   format     Q20_b Q20_B.;
   format     Q20_c Q20_C.;
   format     Q20_d Q20_D.;
   format     Q20_e Q20_E.;
   format     Q20_f Q20_F.;
   format     Q20_g Q20_G.;
   format     Q20_h Q20_H.;
   format     Q20_i Q20_I.;

  keep caseid weight Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i sQ20_: dQ20_:;

run;

options nolabel;

proc means data=VoicesDMVSurvey2017 n sum mean min max;
  var Q20_: sQ20_: dQ20_:;
run;

options label;

/*
proc print data=VoicesDMVSurvey2017;
  var Q20_f sQ20_f dQ20_f: ;
run;
*/


/** Macro qsplit - Start Definition **/

%macro qsplit( q );

  proc summary data=VoicesDMVSurvey2017;
    var sQ20_&q dQ20_&q: /weight=weight;
    output out=Q20&q (drop=_type_ _freq_)
      n(sQ20_&q)=N
      mean(sQ20_&q dQ20_&q:)=sQ20 dQ20_1-dQ20_&NUM_LEVELS;
  run;

%mend qsplit;

/** End Macro Definition **/

%qsplit( a )
%qsplit( b )
%qsplit( c )
%qsplit( d )
%qsplit( e )
%qsplit( f )
%qsplit( g )
%qsplit( h )
%qsplit( i )

data Q20sum;

  set
    Q20a (in=inA)
    Q20b (in=inB)
    Q20c (in=inC)
    Q20d (in=inD)
    Q20e (in=inE)
    Q20f (in=inF)
    Q20g (in=inG)
    Q20h (in=inH)
    Q20i (in=inI)
  ;
  
  if inA then Question = 'A';
  else if inB then Question = 'B';
  else if inC then Question = 'C';
  else if inD then Question = 'D';
  else if inE then Question = 'E';
  else if inF then Question = 'F';
  else if inG then Question = 'G';
  else if inH then Question = 'H';
  else if inI then Question = 'I';
  
  total_check = sum( of dQ20_1-dQ20_&NUM_LEVELS );

run;

proc sort data=Q20sum;
  by sQ20;

proc format;
  value $Q20g
    'A' = "Public transit inconvenient"
    'B' = "Couldn't afford public transit"
    'C' = "Didn't have a car"
    'D' = "Didn't have money for gas"
    'E' = "Didn't have money to fix car"
    'F' = "Traffic"
    'G' = "Construction"
    'H' = "Poor roads"
    'I' = "Other reason"
  ;
    

proc print data=Q20sum;
  id question;
  format question $Q20g.;
run;


** Question 33 **;

ods html body="&_dcdata_default_path\Voices\Prog\Voices_Q20.html" style=Default;

proc print data=Q20sum label;
  id question;
  var dQ20_1 dQ20_2 dQ20_3 dQ20_4 dQ20_5;
  format question $Q20g.;
  label 
    Question = "Q20. In the past year, how often have you had trouble getting to where you need to go because:"
    dQ20_5 = 'Daily'
    dQ20_4 = 'Weekly'
    dQ20_3 = 'Monthly'
    dQ20_2 = 'Less than once per month'
    dQ20_1 = 'Never';
run;

ods html close;
