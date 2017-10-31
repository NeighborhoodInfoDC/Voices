/**************************************************************************
 Program:  Voices_q1_q2_recode.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   C. Hedman
 Created:  10/11/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Create recode dataset for for Q1 and Q2 open ended responses.
 The program utilizes the "Voices_2017_q1_q2_recode.csv" dataset created
 by STATA program "Q1 and Q2 recode.do"

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Voices )

/*Import Q1 and Q2 recode CVS file created from output of STATA program 
 "Q1 and Q2 recode.do"*/
proc import datafile= 'L:\Libraries\Voices\Raw\Voices_2017_q1_q2_recode.csv'
out = Voices_2017_q1_q2_recode_0
dbms = CSV
;

run;


proc sort data=Voices_2017_q1_q2_recode_0;
  by caseid;

data Voices_2017_q1_q2_recode;
  
  merge
    Voices_2017_q1_q2_recode_0
    Voices.VoicesDMVSurvey2017 (keep=caseid q1 q2 q1_refused q2_refused weight dov_urban ppethm ppracem ppeducat ppincimp ppage ppgender pprent PPT01 PPT25 PPT612 PPT1317);
  by caseid;

  %make_break_vars_2017;

  ** Code refused to answer as missing values **;
  
  array a_Q1{*} Q1_1-Q1_11;
  
  if Q1_refused = -1 then do;
    
    do i = 1 to dim( a_Q1 );
      a_Q1{i} = .;
    end;
    
  end;

  array a_Q2{*} Q2_1-Q2_11;
  
  if Q2_refused = -1 then do;
    
    do i = 1 to dim( a_Q2 );
      a_Q2{i} = .;
    end;
    
  end;
  
  ** Create unique response dummies uQ1_: **;
  
  array uQ1_1to11{*} uQ1_1-uQ1_11;
  
  do i = 1 to dim( a_Q1 );
  
    uQ1_1to11{i} = a_Q1{i};
    
  end;

  array uQ1_1to9{*} uQ1_1-uQ1_9;
  
  if sum( of Q1_1-Q1_9 ) > 1 then do;
 
    do i = 1 to dim( uQ1_1to9 );
      uQ1_1to9{i} = 0;
    end;
  
  end;
  
  ** Create unique response dummies uQ2_: **;
  
  array uQ2_1to11{*} uQ2_1-uQ2_11;
  
  do i = 1 to dim( a_Q2 );
  
    uQ2_1to11{i} = a_Q2{i};
    
  end;

  array uQ2_1to9{*} uQ2_1-uQ2_9;
  
  if sum( of Q2_1-Q2_9 ) > 1 then do;
 
    do i = 1 to dim( uQ2_1to9 );
      uQ2_1to9{i} = 0;
    end;
  
  end;
  
  ** Create response dummies for location relative to where person lives rQ1_: **;
  
  array rQ1{*} rQ1_same rQ1_dc rQ1_oth_juris rQ1_dmv rQ1_md rQ1_va rQ1_out rQ1_mult rQ1_none;
  
  if not missing( Q1_1 ) then do;

    do i = 1 to dim( rQ1 );
      rQ1{i} = 0;
    end;
    
    if Q1_11 = 1 then rQ1_none = 1;
    else if Q1_10 = 1 then rQ1_mult = 1;
    else if 
      ( dov_urban = 1 and Q1_1 = 1 ) or
      ( dov_urban = 2 and Q1_3 = 1 ) or
      ( dov_urban = 3 and Q1_2 = 1 ) or 
      ( dov_urban = 4 and Q1_4 = 1 ) or 
      ( dov_urban in ( 5, 6, 7, 8 ) and Q1_5 = 1 ) then rQ1_same = 1;
    else if Q1_1 = 1 then rQ1_dc = 1;
    else if sum( of Q1_2-Q1_5 ) > 0 then rQ1_oth_juris = 1;
    else if Q1_8 = 1 then rQ1_dmv = 1;
    else if Q1_6 = 1 then rQ1_md = 1;
    else if Q1_7 = 1 then rQ1_va = 1;
    else if Q1_9 = 1 then rQ1_out = 1;
    else if Q1_11 = 1 then rQ1_none = 1;
    
  end;

  ** Create response dummies for location relative to where person lives rQ2_: **;
  
  array rQ2{*} rQ2_same rQ2_dc rQ2_oth_juris rQ2_dmv rQ2_md rQ2_va rQ2_out rQ2_mult rQ2_none;
  
  if not missing( Q2_1 ) then do;

    do i = 1 to dim( rQ2 );
      rQ2{i} = 0;
    end;
    
    if Q2_11 = 1 then rQ2_none = 1;
    else if Q2_10 = 1 then rQ2_mult = 1;
    else if 
      ( dov_urban = 1 and Q2_1 = 1 ) or
      ( dov_urban = 2 and Q2_3 = 1 ) or
      ( dov_urban = 3 and Q2_2 = 1 ) or 
      ( dov_urban = 4 and Q2_4 = 1 ) or 
      ( dov_urban in ( 5, 6, 7, 8 ) and Q2_5 = 1 ) then rQ2_same = 1;
    else if Q2_1 = 1 then rQ2_dc = 1;
    else if sum( of Q2_2-Q2_5 ) > 0 then rQ2_oth_juris = 1;
    else if Q2_8 = 1 then rQ2_dmv = 1;
    else if Q2_6 = 1 then rQ2_md = 1;
    else if Q2_7 = 1 then rQ2_va = 1;
    else if Q2_9 = 1 then rQ2_out = 1;
    else if Q2_11 = 1 then rQ2_none = 1;
    
  end;

  label
    Q1_1 = "Place you would tell Washington area person you are from: Washington, DC (multiple resp)"
    Q1_2 = "Place you would tell Washington area person you are from: Montgomery County or place within (multiple resp)"
    Q1_3 = "Place you would tell Washington area person you are from: Prince Georges County or place within (multiple resp)"
    Q1_4 = "Place you would tell Washington area person you are from: Fairfax County or place within (multiple resp)"
    Q1_5 = "Place you would tell Washington area person you are from: Northern Virginia area outside Fairfax County (multiple resp)"
    Q1_6 = "Place you would tell Washington area person you are from: Maryland, no specific place inside region (multiple resp)"
    Q1_7 = "Place you would tell Washington area person you are from: Virginia, no specific place inside region (multiple resp)"
    Q1_8 = "Place you would tell Washington area person you are from: DMV, Washington (region, area, suburbs) (multiple resp)"
    Q1_9 = "Place you would tell Washington area person you are from: Place outside the region (multiple resp)"
    Q1_10 = "Place you would tell Washington area person you are from: Multiple categories listed (multiple resp)"
    Q1_11 = "Place you would tell Washington area person you are from: No place identified (multiple resp)"

    Q2_1 = "Place you would tell outsider you are from: Washington, DC (multiple resp)"
    Q2_2 = "Place you would tell outsider you are from: Montgomery County or place within (multiple resp)"
    Q2_3 = "Place you would tell outsider you are from: Prince Georges County or place within (multiple resp)"
    Q2_4 = "Place you would tell outsider you are from: Fairfax County or place within (multiple resp)"
    Q2_5 = "Place you would tell outsider you are from: Northern Virginia area outside Fairfax County (multiple resp)"
    Q2_6 = "Place you would tell outsider you are from: Maryland, no specific place inside region (multiple resp)"
    Q2_7 = "Place you would tell outsider you are from: Virginia, no specific place inside region (multiple resp)"
    Q2_8 = "Place you would tell outsider you are from: DMV, Washington region, Washington area, Washington suburbs (multiple resp)"
    Q2_9 = "Place you would tell outsider you are from: Place outside the region (multiple resp)"
    Q2_10 = "Place you would tell outsider you are from: Multiple categories listed (multiple resp)"
    Q2_11 = "Place you would tell outsider you are from: No place identified (multiple resp)"

    uQ1_1 = "Place you would tell Washington area person you are from: Washington, DC (unique resp)"
    uQ1_2 = "Place you would tell Washington area person you are from: Montgomery County or place within (unique resp)"
    uQ1_3 = "Place you would tell Washington area person you are from: Prince Georges County or place within (unique resp)"
    uQ1_4 = "Place you would tell Washington area person you are from: Fairfax County or place within (unique resp)"
    uQ1_5 = "Place you would tell Washington area person you are from: Northern Virginia area outside Fairfax County (unique resp)"
    uQ1_6 = "Place you would tell Washington area person you are from: Maryland, no specific place inside region (unique resp)"
    uQ1_7 = "Place you would tell Washington area person you are from: Virginia, no specific place inside region (unique resp)"
    uQ1_8 = "Place you would tell Washington area person you are from: DMV, Washington (region, area, suburbs) (unique resp)"
    uQ1_9 = "Place you would tell Washington area person you are from: Place outside the region (unique resp)"
    uQ1_10 = "Place you would tell Washington area person you are from: Multiple categories listed (unique resp)"
    uQ1_11 = "Place you would tell Washington area person you are from: No place identified (unique resp)"

    uQ2_1 = "Place you would tell outsider you are from: Washington, DC (unique resp)"
    uQ2_2 = "Place you would tell outsider you are from: Montgomery County or place within (unique resp)"
    uQ2_3 = "Place you would tell outsider you are from: Prince Georges County or place within (unique resp)"
    uQ2_4 = "Place you would tell outsider you are from: Fairfax County or place within (unique resp)"
    uQ2_5 = "Place you would tell outsider you are from: Northern Virginia area outside Fairfax County (unique resp)"
    uQ2_6 = "Place you would tell outsider you are from: Maryland, no specific place inside region (unique resp)"
    uQ2_7 = "Place you would tell outsider you are from: Virginia, no specific place inside region (unique resp)"
    uQ2_8 = "Place you would tell outsider you are from: DMV, Washington region, Washington area, Washington suburbs (unique resp)"
    uQ2_9 = "Place you would tell outsider you are from: Place outside the region (unique resp)"
    uQ2_10 = "Place you would tell outsider you are from: Multiple categories listed (unique resp)"
    uQ2_11 = "Place you would tell outsider you are from: No place identified (unique resp)"

    rQ1_none = "Place you would tell Washington area person you are from: No place identified"
    rQ1_mult = "Place you would tell Washington area person you are from: Multiple places given"
    rQ1_same = "Place you would tell Washington area person you are from: Same jurisdiction as where person lives"
    rQ1_dc = "Place you would tell Washington area person you are from: Washington, DC (non-DC residents only)"
    rQ1_oth_juris = "Place you would tell Washington area person you are from: Different jurisdiction than where person lives (other than DC)"
    rQ1_dmv = "Place you would tell Washington area person you are from: DMV, Washington region, Washington area, Washington suburbs"
    rQ1_md = "Place you would tell Washington area person you are from: Maryland, no specific place inside region"
    rQ1_va = "Place you would tell Washington area person you are from: Virginia, no specific place inside region"
    rQ1_out = "Place you would tell Washington area person you are from: Place outside the region"
    
    rQ2_none = "Place you would tell outsider you are from: No place identified"
    rQ2_mult = "Place you would tell outsider you are from: Multiple places given"
    rQ2_same = "Place you would tell outsider you are from: Same jurisdiction as where person lives"
    rQ2_dc = "Place you would tell outsider you are from: Washington, DC (non-DC residents only)"
    rQ2_oth_juris = "Place you would tell outsider you are from: Different jurisdiction than where person lives (other than DC)"
    rQ2_dmv = "Place you would tell outsider you are from: DMV, Washington region, Washington area, Washington suburbs"
    rQ2_md = "Place you would tell outsider you are from: Maryland, no specific place inside region"
    rQ2_va = "Place you would tell outsider you are from: Virginia, no specific place inside region"
    rQ2_out = "Place you would tell outsider you are from: Place outside the region"

  ;

  format caseid Q1_1-Q1_11 Q2_1-Q2_11;
  informat caseid Q1_1-Q1_11 Q2_1-Q2_11;
  
  drop i;
  
run;


%Finalize_data_set( 
  data=Voices_2017_q1_q2_recode,
  out=Voices_2017_q1_q2_recode,
  outlib=Voices,
  label="VoicesDMV 2017 survey, questions Q1 and Q2, recode",
  sortby=caseid,
  freqvars=Q1_refused Q2_refused,
  revisions=%str(Added children in household break variable.)
)

ods listing close;

ods csvall body="&_dcdata_default_path\Voices\Raw\Voices_q1_final_recode_review.csv";

proc print data=Voices_2017_q1_q2_recode;
  id caseid;
  var dov_urban Q1 Q1_1-Q1_11 uQ1_1-uQ1_11 rQ1_:;
run;

ods csvall close;

ods csvall body="&_dcdata_default_path\Voices\Raw\Voices_q2_final_recode_review.csv";

proc print data=Voices_2017_q1_q2_recode;
  id caseid;
  var dov_urban Q2 Q2_1-Q2_11 uQ2_1-uQ2_11 rQ2_:;
run;

ods csvall close;

ods listing;
