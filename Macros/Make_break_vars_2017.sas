/**************************************************************************
 Program:  Make_break_vars_2017.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  09/23/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Autocall macro to make 2017 Voices survey break
 variables. 
 
   Total
   Region
   Geo
   Race
   Educ
   Income
   Age
   Gender
   Homeown

 Modifications:
**************************************************************************/

/** Macro Make_break_vars_2017 - Start Definition **/

%macro Make_break_vars_2017(  );

  retain total 1 region 1;
  
  format region region. geo geo.;
  
  ** Reporting areas **;
  
  select ( dov_urban );
    when ( 5, 6, 7, 8 ) geo = 5;
    otherwise geo = dov_urban;
  end;
  
  
  race =.;
  IF (PPETHM=1) THEN race = 1;
  IF (PPETHM=2) THEN race = 2;
  IF (PPETHM=4) THEN race = 3;
  if race=. and PPETHM=3 and PPRACEM in(4, 5) then race = 4; *keeping Asian/PI only if also Non-Hispanic Other;
  if race=. and PPETHM in (3, 5) then race=5; *all other non-Hispanic other and non-Hispanic 2+ race.; 
   
  format race race.;

  educ =.;
  IF (PPEDUCAT=1) or(PPEDUCAT=2) or (PPEDUCAT=3) THEN educ = 0;
  IF (PPEDUCAT=4) THEN educ =1;
  format educ educ.;

  income =.;
  IF (1 <= PPINCIMP <= 11) THEN income = 1;
  IF (12 <= PPINCIMP <= 15) THEN income = 2;
  IF (16 <= PPINCIMP <= 21) THEN income = 3;
  format income income.;

  age =.;
  IF (18 <= PPAGE <= 34) THEN age = 1;
  IF (35 <= PPAGE <= 64) THEN age = 2;
  IF (PPAGE >= 65) THEN age = 3;
  format age age.;

  gender =.;
  IF (PPGENDER=1) THEN gender = 0;
  IF (PPGENDER=2) THEN gender = 1;
  format gender gender.;

  homeown =.;
  IF (PPRENT=2) or (PPRENT=3)  THEN homeown = 0;
  IF (PPRENT=1) THEN homeown = 1;
  format homeown homeown.;

  children=.;
  IF (PPT01=0) or (PPT25=0) or (PPT612=0) or (PPT1317=0) THEN children = 0;
  IF (PPT01>=1) or (PPT25>=1) or (PPT612>=1) or (PPT1317>=1) THEN children = 1;
  format children children.;

/*
  geo =.;
  IF (dov_urban=1) THEN geo = 1;
  IF (dov_urban=2) THEN geo = 2;
  IF (dov_urban=3) THEN geo = 3;
  IF (dov_urban=4) THEN geo = 4;
  IF (dov_urban=5) or (dov_urban=6) or (dov_urban=7) or (dov_urban=8) THEN geo = 5;
*/
  label
    total = "Unweighted sample count"
    region = "Washington area"
    race = "Respondent's Race/Ethnicity"
    educ = "Respondent's educational attainment"
    income = "Respondent's HH income"
	age = "Respondent's age"
    gender = "Respondent's gender"
    homeown = "Respondent's homeownership status"
    children = "Children present in respondent's household";

%mend Make_break_vars_2017;

/** End Macro Definition **/

