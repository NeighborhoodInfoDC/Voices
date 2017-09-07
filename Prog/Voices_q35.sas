/**************************************************************************
 Program:  Voice_Q35.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  07/20/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Q35. Rating scale

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Voices )

*options obs=100;

%let NUM_LEVELS = 5;

data VoicesDMVSurvey2017;

  set Voices.VoicesDMVSurvey2017;

  retain total 1;

  array Q35{*} Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l;
  array sQ35{*} sQ35_a sQ35_b sQ35_c sQ35_d sQ35_e sQ35_f sQ35_g sQ35_h sQ35_i sQ35_j sQ35_k sQ35_l;
  array dQ35{12,&NUM_LEVELS} 
    dQ35_a1 dQ35_a2 dQ35_a3 dQ35_a4 dQ35_a5 
    dQ35_b1 dQ35_b2 dQ35_b3 dQ35_b4 dQ35_b5
    dQ35_c1 dQ35_c2 dQ35_c3 dQ35_c4 dQ35_c5
    dQ35_d1 dQ35_d2 dQ35_d3 dQ35_d4 dQ35_d5
    dQ35_e1 dQ35_e2 dQ35_e3 dQ35_e4 dQ35_e5
    dQ35_f1 dQ35_f2 dQ35_f3 dQ35_f4 dQ35_f5
    dQ35_g1 dQ35_g2 dQ35_g3 dQ35_g4 dQ35_g5
    dQ35_h1 dQ35_h2 dQ35_h3 dQ35_h4 dQ35_h5
    dQ35_i1 dQ35_i2 dQ35_i3 dQ35_i4 dQ35_i5
    dQ35_j1 dQ35_j2 dQ35_j3 dQ35_j4 dQ35_j5
    dQ35_k1 dQ35_k2 dQ35_k3 dQ35_k4 dQ35_k5
    dQ35_l1 dQ35_l2 dQ35_l3 dQ35_l4 dQ35_l5
    ;

  do i = 1 to dim( Q35 );
   
    if Q35{i} = -1 then do;
     
      Q35{i} = .;
       
    end;
    else do;
   
      sQ35{i} = &NUM_LEVELS - Q35{i};
       
      do j = 1 to &NUM_LEVELS;
      
        if Q35{i} = j then dQ35{i,j} = 1;
        else dQ35{i,j} = 0;
        
      end;
      
    end;
   
  end;

   format     Q35_a Q35_A.;
   format     Q35_b Q35_B.;
   format     Q35_c Q35_C.;
   format     Q35_d Q35_D.;
   format     Q35_e Q35_E.;
   format     Q35_f Q35_F.;
   format     Q35_g Q35_G.;
   format     Q35_h Q35_H.;
   format     Q35_i Q35_I.;
   format     Q35_j Q35_J.;
   format     Q35_k Q35_K.;
   format     Q35_l Q35_L.;

  keep caseid weight Q35_: sQ35_: dQ35_:;

run;

options nolabel;

proc means data=VoicesDMVSurvey2017 n sum mean min max;
  var Q35_: sQ35_: dQ35_:;
run;

options label;

/*
proc print data=VoicesDMVSurvey2017;
  var Q35_f sQ35_f dQ35_f: ;
run;
*/


/** Macro qsplit - Start Definition **/

%macro qsplit( q );

  proc summary data=VoicesDMVSurvey2017;
    var sQ35_&q dQ35_&q: /weight=weight;
    output out=Q35&q (drop=_type_ _freq_)
      n(sQ35_&q)=N
      mean(sQ35_&q dQ35_&q:)=sQ35 dQ35_1-dQ35_&NUM_LEVELS;
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
%qsplit( j )
%qsplit( k )
%qsplit( l )

data Q35sum;

  set
    Q35a (in=inA)
    Q35b (in=inB)
    Q35c (in=inC)
    Q35d (in=inD)
    Q35e (in=inE)
    Q35f (in=inF)
    Q35g (in=inG)
    Q35h (in=inH)
    Q35i (in=inI)
    Q35j (in=inJ)
    Q35k (in=inK)
    Q35l (in=inL)
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
  else if inJ then Question = 'J';
  else if inK then Question = 'K';
  else if inL then Question = 'L';
  
  total_check = sum( of dQ35_1-dQ35_&NUM_LEVELS );

run;

proc sort data=Q35sum;
  by sQ35;

proc format;
  value $Q35g
    'A' = "Developing parks and open spaces"
    'B' = "Maintaining roads, sidewalks, infrastructure"
    'C' = "Making it safer to get around by bicycle"
    'D' = "Protecting people from crime"
    'E' = "Protecting people from pollution/env. hazards"
    'F' = "Making sure all children get quality education"
    'G' = "Addressing affordable housing"
    'H' = "Preventing discrimination"
    'I' = "Helping poor people"
    'J' = "Helping the homeless"
    'K' = "Helping the unemployed"
    'L' = "Helping people without health insurance"
  ;
    

proc print data=Q35sum;
  id question;
  format question $Q35g.;
run;


** Question 33 **;

ods html body="&_dcdata_default_path\Voices\Prog\Voices_Q35.html" style=Default;

proc print data=Q35sum label;
  id question;
  var dQ35_5 dQ35_4 dQ35_3 dQ35_2 dQ35_1;
  format question $Q35g.;
  label 
    Question = "Q35. How much of a priority should the following be for local government?"
    dQ35_5 = 'Not a priority'
    dQ35_4 = 'Low'
    dQ35_3 = 'Medium'
    dQ35_2 = 'High'
    dQ35_1 = 'Extremely high';
run;

ods html close;
