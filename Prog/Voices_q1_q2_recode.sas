/**************************************************************************
 Program:  Voices_q1_q2_recode.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   C. Hedman
 Created:  10/11/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Create Voices_2017_nonopen_recode data set with 
 recodes of non-open questions.

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Voices )


proc import datafile= 'L:\Libraries\Voices\Data\Voices_2017_q1_q2_recode.csv'
out = Voices_2017_q1_q2_recode
dbms = CSV
;

run;

data Voices_2017_q1_q2_recode;
set Voices_2017_q1_q2_recode;

  label
    Q1_1 = "Washington, DC"
    Q1_2 = "Montgomery County or place within"
	Q1_3 = "Prince George's County or place within"
    Q1_4 = "Fairfax County or place within"
    Q1_5 = "Northern Virigina area outside Fairfax County"
	Q1_6 = "Maryland, no specific place inside region"
    Q1_7 = "Viriginia, no specific place inside region"
    Q1_8 = "DMV, Washington region, Washington area, Washington suburbs"
	Q1_9 = "Place outside the region"
    Q1_10 = "Multiple categories listed"
    Q1_11 = "No place identified"

    Q2_1 = "Washington, DC"
    Q2_2 = "Montgomery County or place within"
	Q2_3 = "Prince George's County or place within"
    Q2_4 = "Fairfax County or place within"
    Q2_5 = "Northern Virigina area outside Fairfax County"
	Q2_6 = "Maryland, no specific place inside region"
    Q2_7 = "Viriginia, no specific place inside region"
    Q2_8 = "DMV, Washington region, Washington area, Washington suburbs"
	Q2_9 = "Place outside the region"
    Q2_10 = "Multiple categories listed"
    Q2_11 = "No place identified";

run;


%Finalize_data_set( 
  data=Voices_2017_q1_q2_recode,
  out=Voices_2017_q1_q2_recode,
  outlib=Voices,
  label="VoicesDMV 2017 survey, questions Q1 and Q2, recode",
  sortby=caseid,
  revisions=%str(New file.)
)
