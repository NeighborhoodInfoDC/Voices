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
out = Voices_2017_q1_q2_recode
dbms = CSV
;

run;

data Voices_2017_q1_q2_recode;
set Voices_2017_q1_q2_recode;

  label
    Q1_1 = "Q1 1. Washington, DC"
    Q1_2 = "Q1 2. Montgomery County or place within"
	Q1_3 = "Q1 3. Prince George's County or place within"
    Q1_4 = "Q1 4. Fairfax County or place within"
    Q1_5 = "Q1 5. Northern Virigina area outside Fairfax County"
	Q1_6 = "Q1 6. Maryland, no specific place inside region"
    Q1_7 = "Q1 7. Viriginia, no specific place inside region"
    Q1_8 = "Q1 8. DMV, Washington region, Washington area, Washington suburbs"
	Q1_9 = "Q1 9. Place outside the region"
    Q1_10 = "Q1 10. Multiple categories listed"
    Q1_11 = "Q1 11. No place identified"

    Q2_1 = "Q2 1. Washington, DC"
    Q2_2 = "Q2 2. Montgomery County or place within"
	Q2_3 = "Q2 3. Prince George's County or place within"
    Q2_4 = "Q2 4. Fairfax County or place within"
    Q2_5 = "Q2 5. Northern Virigina area outside Fairfax County"
	Q2_6 = "Q2 6. Maryland, no specific place inside region"
    Q2_7 = "Q2 7. Viriginia, no specific place inside region"
    Q2_8 = "Q2 8. DMV, Washington region, Washington area, Washington suburbs"
	Q2_9 = "Q2 9. Place outside the region"
    Q2_10 = "Q2 10. Multiple categories listed"
    Q2_11 = "Q2 11. No place identified";

run;


%Finalize_data_set( 
  data=Voices_2017_q1_q2_recode,
  out=Voices_2017_q1_q2_recode,
  outlib=Voices,
  label="VoicesDMV 2017 survey, questions Q1 and Q2, recode",
  sortby=caseid,
  revisions=%str(New file.)
)
