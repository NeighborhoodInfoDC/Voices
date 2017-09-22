/**************************************************************************
 Program:  Voices_q16_recode.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  09/19/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Read recoded Q16 data generated by Python program and
create final recoded data set. 

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Voices )

filename fimport "L:\Libraries\Voices\Raw\Q16_recode.csv" lrecl=1000;

proc import out=Q16_recode
    datafile=fimport
    dbms=csv replace;
  datarow=2;
  getnames=yes;
  guessingrows=max;
run;

data Q16_recode_random;

  set Q16_recode;

  where recode not in ( '', 'NOMATCH' );
  
  r = ranuni( -1 );
  
  format _all_ ;
  informat _all_ ;
  
run;

proc sort data=Q16_recode_random;
  by caseid respnum r;
run;

data Q16_recode_unq;

  set Q16_recode_random;
  by caseid respnum;
  
  if first.respnum;
  
  drop r;
  
run;

data Voices_Q16_recode;

  merge
    Q16_recode_unq 
    Voices.VoicesDMVSurvey2017 (keep=caseid weight dov_urban ppethm ppracem ppeducat ppincimp ppage ppgender pprent);
  by caseid;

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

  label
    race = "Respondent's Race/Ethnicity"
    educ = "Respondent's educational attainment"
    income = "Respondent's HH income"
	age = "Respondent's age"
    gender = "Respondent's gender"
    homeown = "Respondent's homeownership status";

  rename recode=Q16_recode;
  
run;

proc format;

  value $Q16_r
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

  value $Q16_r_det
    'TRAFFIC' = "Traffic"
    'TAXES' = "Taxes"
    'TRUMP' = "Donald Trump"
    'PARKING' = "Parking"
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
    'SAFETY' = "Crime"
    'HOUSING' = "Housing"
    'DC' = "Washington, DC"
    'POLITICS' = "Politics"
    'WALKABILITY' = "Walkability"
    'COSTS' = "Cost of living"
    'NOISE' = "Noise"
    'POLICE' = "Police"
    'POLLUTION' = "Pollution"
    'POVERTY' = "Poverty"
    'DRIVERS' = "Drivers"
    'GENTRIFICATION' = "Gentrification"
    'TRASH' = "Trash"
    'DRUGS' = "Drugs"
    'STRESS' = "Stress"
    'CONSTRUCTION' = "Construction"
    'DISCRIMINATION' = "Discrimination"
    'HOMELESSNESS' = "Homelessness"
    'GANGS' = "Gangs"
    'TOURISTS' = "Tourists"
    'MONEY' = "Money"
    'BUGS' = "Bugs"
    'TERROR' = "Terror threats"
    'RATS' = "Rats"
;




%Finalize_data_set( 
  data=Voices_Q16_recode,
  out=Voices_Q16_recode,
  outlib=Voices,
  label="VoicesDMV survey, 2017, Q16 recoded responses",
  sortby=caseid respnum,
  revisions=%str(New file.)
)

proc freq data=Voices_Q16_recode order=freq;
  weight weight;
  tables Q16_recode;  
  format Q16_recode $Q16_r_det.;
run;

** Word cloud export **;

proc summary data=Voices_Q16_recode nway;
  class Q16_recode;
  var weight;
  output out=A sum=;
  format Q16_recode $Q16_r_det.;
run;

%File_info( data=A )

data Word_cloud;

  length Q16_recode $ 20 wc_weight 8;
  
  set A;
  
  wc_weight = round( weight );
  
  keep Q16_recode wc_weight;
  
run;

filename fexport "D:\DCData\Libraries\Voices\Raw\Voices_Q16_recode_wordcloud.txt" lrecl=256;

proc export data=Word_cloud
    outfile=fexport
    dbms=tab replace;

run;

filename fexport clear;

