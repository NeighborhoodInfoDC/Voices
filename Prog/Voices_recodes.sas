/**************************************************************************
 Program:  Voice_open_ended.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   C. Hedman
 Created:  09/11/17
 Version:  SAS 9.4
 Environment:  Local Windows session (desktop)
 
 Description:  Q13. Multiple choice with recoding.

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Voices )


proc format;
  value region
    1 = 'Washington Area';
  value geo
    1 = 'DC'  
    2 = 'Prince George''s Co'  
    3 = 'Montgomery Co'  
    4 = 'Fairfax Co'  
    5 = 'Other NoVA';
	value race
    1 = 'N.H. white'  
    2 = 'N.H. black'  
    3 = 'Hispanic'  
    4 = 'N.H. Asian or P.I.'  
    5 = 'N.H. other';
	value educ
    0 = 'Less than Bachelors'  
    1 = 'Bachelors or higher';
	value income
    1 = '$0 - $50K'  
    2 = '$50 - $100K'
    3 = '$100K+';
	value age
    1 = '18-34'  
    2 = '35-64'
    3 = '65+';
	value gender
    0 = 'Male'  
    1 = 'Female';
	value homeown
    0 = 'Homeowner'  
    1 = 'Not homeowner';
	value Q3_cat
    1 = '0-5'  
    2 = '5-10'
    3 = '10-20'  
    4 = '20-40'
    5 = '40+';
	value Q4_cat
    1 = '0-5'  
    2 = '5-10'
    3 = '10-20'  
    4 = '20-40'
    5 = '40+';
	value Q5_cat
    1 = '0-1'  
    2 = '1-2'
    3 = '2-5'  
    4 = '5-10'
    5 = '10+';
	value phy_health
    1 = '0 days'  
    2 = '1-13 days'
    3 = '14-30 days';
	value ment_health
    1 = '0 days'  
    2 = '1-13 days'
    3 = '14-30 days';
	value satisf
    1 = 'Low (0-4)'  
    2 = 'Medium (5-6)'
    3 = 'High (7-8)'
    4 = 'Very high (9-10)';
	value worth
    1 = 'Low (0-4)'  
    2 = 'Medium (5-6)'
    3 = 'High (7-8)'
    4 = 'Very high (9-10)';
	value happy
    1 = 'Low (0-4)'  
    2 = 'Medium (5-6)'
    3 = 'High (7-8)'
    4 = 'Very high (9-10)';
	value anxious
    1 = 'Low (0-1)'  
    2 = 'Medium (2-3)'
    3 = 'High (4-5)'
    4 = 'Very high (6-10)';
	value thriving
    0 = 'Not thriving'  
    1 = 'Thriving';
	value suffering
    0 = 'Not suffering'  
    1 = 'Suffering';
	value struggling
    0 = 'Struggling'  
    1 = 'Struggling';

data VoicesDMVSurvey2017;

  set Voices.VoicesDMVSurvey2017;

  retain total 1;

  race =.;
  IF (PPETHM=1) THEN race = 1;
  IF (PPETHM=2) THEN race = 2;
  IF (PPETHM=4) THEN race = 3;
  IF (ppracem=4) or (ppracem=5) THEN race = 4;
  IF (PPETHM=3) or (PPETHM=5) THEN race = 5;

  educ =.;
  IF (PPEDUCAT=1) or(PPEDUCAT=2) or (PPEDUCAT=3) THEN educ = 0;
  IF (PPEDUCAT=4) THEN educ =1;

  income =.;
  IF (1 <= PPINCIMP <= 11) THEN income = 1;
  IF (12 <= PPINCIMP <= 15) THEN income = 2;
  IF (16 <= PPINCIMP <= 21) THEN income = 3;

  age =.;
  IF (18 <= PPAGE <= 34) THEN age = 1;
  IF (35 <= PPAGE <= 64) THEN age = 2;
  IF (PPAGE >= 65) THEN age = 3;

  gender =.;
  IF (PPGENDER=1) THEN gender = 0;
  IF (PPGENDER=2) THEN gender = 1;

  homeown =.;
  IF (PPRENT=1) THEN homeown = 0;
  IF (PPRENT=2) or (PPRENT=3) THEN homeown = 1;

  geo =.;
  IF (dov_urban=1) THEN geo = 1;
  IF (dov_urban=2) THEN geo = 2;
  IF (dov_urban=3) THEN geo = 3;
  IF (dov_urban=4) THEN geo = 4;
  IF (dov_urban=5) or (dov_urban=6) or (dov_urban=7) or (dov_urban=8) THEN geo = 5;

  label
    race = "Respondent's Race/Ethnicity"
    educ = "Respondent's educational attainment"
    income = "Respondent's HH income"
	age = "Respondent's age"
    gender = "Respondent's gender"
    homeown = "Respondent's homeownership status";

  **Q13_count =.;


  **Q14_count =.;

  Q3_total = Q3_years + ( Q3_months / 12 );
  Q4_total = Q4_years + ( Q5_months / 12 );
  Q5_total = Q5_years + ( Q5_months / 12 );

  label
    Q3_total = "How long have you lived in the Washington area? (years, recode)"
    Q4_total = "How long have you lived in [dov_urban]? (years, recode)"
	Q5_total = "How long have you lived in your current home? (years, recode)";

  Q3_cat =.;
  IF (0 <= Q3_total <= 5) THEN Q3_cat = 1;
  IF (5 < Q3_total <= 10) THEN Q3_cat = 2;
  IF (10 < Q3_total <= 20) THEN Q3_cat = 3;
  IF (20 < Q3_total <= 40) THEN Q3_cat = 4;
  IF (Q3_total > 40) THEN Q3_cat = 5;

  Q4_cat =.;
  IF (0 <= Q4_total <= 5) THEN Q4_cat = 1;
  IF (5 < Q4_total <= 10) THEN Q4_cat = 2;
  IF (10 < Q4_total <= 20) THEN Q4_cat = 3;
  IF (20 < Q4_total <= 40) THEN Q4_cat = 4;
  IF (Q4_total > 40) THEN Q4_cat = 5;
 
  Q5_cat =.;
  IF (0 <= Q5_total <= 1) THEN Q5_cat = 1;
  IF (1 < Q5_total <= 2) THEN Q5_cat = 2;
  IF (2 < Q5_total <= 5) THEN Q5_cat = 3;
  IF (5 < Q5_total <= 10) THEN Q5_cat = 4;
  IF (Q5_total > 10) THEN Q5_cat = 5;
 
  label
    Q3_cat = "Category: How long (years) have you lived in the Washington area?"
    Q4_cat = "Category: How long (years) have you lived in [county/place]?"
	Q5_cat = "Category: How long (years) have you lived in your current home?";

  phy_health =.;
  IF (Q37=0) THEN phy_health = 1;
  IF (1 < Q37 <= 13) THEN phy_health = 2;
  IF (14 < Q37 <= 30) THEN phy_health = 3;

  ment_health =.;
  IF (Q38=0) THEN ment_health = 1;
  IF (1 < Q38 <= 13) THEN ment_health = 2;
  IF (14 < Q38 <= 30) THEN ment_health = 3;

  label
    phy_health = "Count of days in last 30 days when physical health not good"
    ment_health = "Count of days in last 30 days when mental health was not good";

  satisf =.;
  IF (0 <= Q39A <= 4) THEN satisf = 1;
  IF (Q39A=5) or (Q39A=6) THEN satisf = 2;
  IF (Q39A=7) or (Q39A=8) THEN satisf = 3;
  IF (Q39A=9) or (Q39A=10) THEN satisf = 4;

  worth =.;
  IF (0 <= Q39B <= 4) THEN worth = 1;
  IF (Q39B=5) or (Q39B=6) THEN worth = 2;
  IF (Q39B=7) or (Q39B=8) THEN worth = 3;
  IF (Q39B=9) or (Q39B=10) THEN worth = 4;

  happy =.;
  IF (0 <= Q39C <= 4) THEN happy = 1;
  IF (Q39C=5) or (Q39C=6) THEN happy = 2;
  IF (Q39C=7) or (Q39C=8) THEN happy = 3;
  IF (Q39C=9) or (Q39C=10) THEN happy = 4;

  anxious =.;
  IF (Q39D=0) or (Q39D=1) THEN anxious = 1;
  IF (Q39D=2) or (Q39D=3) THEN anxious = 2;
  IF (Q39D=4) or (Q39D=5) THEN anxious = 3;
  IF (Q39D=6) or (Q39D=7) or (Q39D=8) or (Q39D=9) or (Q39D=10) THEN anxious = 4;

  label
    satisf = "Overall, how satisfied are you with your life nowadays?"
    worth = "...do you feel the things you do in your life are worthwhile?"
	happy = "Overall, how happy did you feel yesterday?"
	anxious = "Overall, how anxious did you feel yesterday?";

  thriving =.;
  IF (Q41A!=.) and (Q41B!=.) THEN thriving = 0;
  IF (Q41A>=7) and (Q41B>=8) THEN thriving = 1;

  suffering =.;
  IF (Q41A!=.) and (Q41B!=.) THEN suffering = 0;
  IF (Q41A<=4) and (Q41B<=4) THEN suffering = 1;

  struggling =.;
  IF (Q41A!=.) and (Q41B!=.) THEN struggling = 0;
  IF (thriving=0) and (suffering=0) THEN struggling = 1;

  label
    thriving = "Respondent is thriving (self evaluation)"
    suffering = "Respondent is suffering (self evaluation)" 
	struggling = "Respondent is struggling (self evaluation)";

run;
