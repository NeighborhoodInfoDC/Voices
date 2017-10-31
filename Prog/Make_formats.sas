/**************************************************************************
 Program:  Make_formats.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  09/19/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Make standard formats for Voices 2017 survey.

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
    1 = 'Very low (0-1)'  
    2 = 'Low (2-3)'
    3 = 'Medium (4-5)'
    4 = 'High (6-10)';
	value income_six
    1 = '$0-25K'  
    2 = '$25-50K'
    3 = '$50-75K'
    4 = '$75-100K'
	5 = '$100-150K'
    6 = '$150K+';
	value children
	0 = 'No children'
	1 = 'Children';
run;

proc catalog catalog=Voices.Formats;
  contents;
quit;

