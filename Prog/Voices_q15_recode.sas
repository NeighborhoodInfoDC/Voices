/**************************************************************************
 Program:  Voices_q15_recode.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  09/19/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Read recoded Q15 data generated by Python program and
create final recoded data set. 

 Modifications: 10-18-17 LH replaced break vars code with standard macro. 
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Voices )

filename fimport "L:\Libraries\Voices\Raw\Q15_recode.csv" lrecl=1000;

proc import out=Q15_recode
    datafile=fimport
    dbms=csv replace;
  datarow=2;
  getnames=yes;
  guessingrows=max;
run;

data Q15_recode_random;

  set Q15_recode;

  where recode not in ( '', 'NOMATCH' );
  
  r = ranuni( -1 );
  
  format _all_ ;
  informat _all_ ;
  
run;

proc sort data=Q15_recode_random;
  by caseid respnum r;
run;

data Q15_recode_unq;

  set Q15_recode_random;
  by caseid respnum;
  
  if first.respnum;
  
  drop r;
  
run;

data Voices_Q15_recode;

  merge
    Q15_recode_unq 
    Voices.VoicesDMVSurvey2017 (keep=caseid weight dov_urban ppethm ppracem ppeducat ppincimp ppage ppgender pprent);
  by caseid;

   %make_break_vars_2017; 

  rename recode=Q15_recode;
  
run;

proc format;

  value $Q15_r
    'ENTERTAINMENT' = "Food and entertainment options"
    'CULTURE' = "Culture and history"
    'JOBS' = "Jobs and career opportunities"
    'PEOPLE' = "Types of people who live here"
    'LOCATION' = "Location and accessibility"
    'DIVERSITY' = "Diversity"
    'TRANSPORTATION' = "Transportation options"
    'NATURE' = "Natural environment"
    'COMMUNITY' = "Community"
    'SCHOOLS' = "Schools and educational institutions"
    'WEATHER' = "Climate and weather"
    'LIFE' = "Lifestyle"
    'FAMILY' = "Family in area"
    'SHOPPING' = "Shopping options"
    'SERVICES' = "Services and amenities"
    'CAPITAL' = "It's the nation's capital"
    'ECONOMY' = "Economy"
    'NOTHING' = "Nothing"
    'SAFETY' = "Crime and safety"
    'HOUSING' = "Housing"
    'DC' = "Washington, DC"
    'POLITICS' = "Political culture"
    'WALKABILITY' = "Walkability"
    'COSTS' = "Cost of living";

  value $Q15_r_det
    'ENTERTAINMENT' = "Entertainment"
    'FOOD' = "Food"
    'CULTURE' = "Culture"
    'MUSEUMS' = "Museums"
    'MONUMENTS' = "Monuments"
    'PERFORM' = "Performing arts"
    'ARTS' = "Arts"
    'SPORTS' = "Sports"
    'NIGHTLIFE' = "Nightlife"
    'JOBS' = "Jobs"
    'PEOPLE' = "People"
    'LOCATION' = "Location"
    'DIVERSITY' = "Diversity"
    'TRANSPORTATION', 'BUS' = "Transportation"
    'METRO' = "Metro"
    'AIRPORTS' = "Airports"    
    'NATURE' = "Nature"
    'COMMUNITY' = "Community"
    'SCHOOLS' = "Schools"
    'WEATHER' = "Weather"
    'LIFE' = "Lifestyle"
    'FAMILY' = "Family"
    'SHOPPING' = "Shopping"
    'SERVICES' = "Services"
    'CAPITAL' = "Nation's capital"
    'ECONOMY' = "Economy"
    'NOTHING' = "Nothing"
    'SAFETY' = "Crime & safety"
    'HOUSING' = "Housing"
    'DC' = "Washington, DC"
    'POLITICS' = "Political culture"
    'WALKABILITY' = "Walkability"
    'COSTS' = "Cost of living";



%Finalize_data_set( 
  data=Voices_Q15_recode,
  out=Voices_Q15_recode,
  outlib=Voices,
  label="VoicesDMV survey, 2017, Q15 recoded responses",
  sortby=caseid respnum,
  revisions=%str(New file.)
)

proc freq data=Voices_Q15_recode order=freq;
  weight weight;
  tables Q15_recode;  
  format Q15_recode $Q15_r_det.;
run;

** Word cloud export **;

proc summary data=Voices_Q15_recode nway;
  class Q15_recode;
  var weight;
  output out=A sum=;
  format Q15_recode $Q15_r_det.;
run;

%File_info( data=A )

data Word_cloud;

  length Q15_recode $ 20 wc_weight 8;
  
  set A;
  
  wc_weight = round( weight );
  
  keep Q15_recode wc_weight;
  
run;

filename fexport "D:\DCData\Libraries\Voices\Raw\Voices_q15_recode_wordcloud.txt" lrecl=256;

proc export data=Word_cloud
    outfile=fexport
    dbms=tab replace;

run;

filename fexport clear;

