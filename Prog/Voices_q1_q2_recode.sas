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
proc import datafile= 'L:\Libraries\Voices\Data\Voices_2017_q1_q2_recode.csv'
out = Voices_2017_q1_q2_recode_0
dbms = CSV
;

run;


proc sort data=Voices_2017_q1_q2_recode_0;
	by caseid;

data Voices_2017_q1_q2_recode;
	
	merge 	Voices_2017_q1_q2_recode_0
		Voices.VoicesDMVSurvey2017 (keep=caseid weight dov_urban ppethm ppracem ppeducat ppincimp ppage ppgender pprent PPT01 PPT25 PPT612 PPT1317);
	by caseid;

%make_break_vars_2017;

  label
    Q1_1 = "Place you would tell Washington area person you are from: Washington, DC"
    Q1_2 = "Place you would tell Washington area person you are from: Montgomery County or place within"
	Q1_3 = "Place you would tell Washington area person you are from: Prince George's County or place within"
    Q1_4 = "Place you would tell Washington area person you are from: Fairfax County or place within"
    Q1_5 = "Place you would tell Washington area person you are from: Northern Virigina area outside Fairfax County"
	Q1_6 = "Place you would tell Washington area person you are from: Maryland, no specific place inside region"
    Q1_7 = "Place you would tell Washington area person you are from: Viriginia, no specific place inside region"
    Q1_8 = "Place you would tell Washington area person you are from: DMV, Washington (region, area, suburbs)"
	Q1_9 = "Place you would tell Washington area person you are from: Place outside the region"
    Q1_10 = "Place you would tell Washington area person you are from: Multiple categories listed"
    Q1_11 = "Place you would tell Washington area person you are from: No place identified"

    Q2_1 = "Place you would tell outsider you are from: Washington, DC"
    Q2_2 = "Place you would tell outsider you are from: Montgomery County or place within"
	Q2_3 = "Place you would tell outsider you are from: Prince George's County or place within"
    Q2_4 = "Place you would tell outsider you are from: Fairfax County or place within"
    Q2_5 = "Place you would tell outsider you are from: Northern Virigina area outside Fairfax County"
	Q2_6 = "Place you would tell outsider you are from: Maryland, no specific place inside region"
    Q2_7 = "Place you would tell outsider you are from: Viriginia, no specific place inside region"
    Q2_8 = "Place you would tell outsider you are from: DMV, Washington region, Washington area, Washington suburbs"
	Q2_9 = "Place you would tell outsider you are from: Place outside the region"
    Q2_10 = "Place you would tell outsider you are from: Multiple categories listed"
    Q2_11 = "Place you would tell outsider you are from: No place identified";

run;


%Finalize_data_set( 
  data=Voices_2017_q1_q2_recode,
  out=Voices_2017_q1_q2_recode,
  outlib=Voices,
  label="VoicesDMV 2017 survey, questions Q1 and Q2, recode",
  sortby=caseid,
  revisions=%str(New file.)
)
