/**************************************************************************
 Program:  Voices_survey_demographics.sas
 Library:  General
 Project:  NeighborhoodInfo DC
 Author:   C. Hedman
 Created:  09/25/17
 Version:  SAS 9.4
 Environment:  Windows
 
 Description:  Create weighted survey demographic figures for data walk.

 Modifications:
**************************************************************************/


proc freq data=Voices_2017_nonopen_recode;
    tables Geo race educ income_six age gender homeown;
    weight weight;
  run;

