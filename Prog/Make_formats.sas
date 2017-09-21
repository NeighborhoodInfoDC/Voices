/**************************************************************************
 Program:  Make_formats.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  09/19/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Make standard formats for Voices survey.

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Voices )

proc format library=Voices;
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
    0 = 'Not homeowner'  
    1 = 'Homeowner';

run;
