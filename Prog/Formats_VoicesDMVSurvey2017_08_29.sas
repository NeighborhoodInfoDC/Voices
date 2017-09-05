/**************************************************************************
 Program:  Formats_VoicesDMVSurvey2017_08_29.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  07/20/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Create formats for VoicesDMV survey FINAL file.
 Replaces formats created for the soft test file. 
 
 Format code provided by GfK.

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Voices )


proc format library = Voices ;
   value OFFPANEL
      0 = 'KP'  
      1 = 'Opt-in' ;
   value DOV_URBAN
      1 = 'Washington DC'  
      2 = 'Prince George''s County in Maryland'  
      3 = 'Montgomery County in Maryland'  
      4 = 'Fairfax County in Virginia'  
      5 = 'Arlington County'  
      6 = 'Alexandria City'  
      7 = 'Fairfax City'  
      8 = 'Falls Church City' ;
   value Q1_REFUSED
      -1 = 'Refused' ;
   value Q2_REFUSED
      -1 = 'Refused' ;
   value Q3_YEARS
      -1 = 'Refused' ;
   value Q3_MONTHS
      -1 = 'Refused' ;
   value Q4_YEARS
      -1 = 'Refused' ;
   value Q4_MONTHS
      -1 = 'Refused' ;
   value Q5_YEARS
      -1 = 'Refused' ;
   value Q5_MONTHS
      -1 = 'Refused' ;
   value Q6F
      -1 = 'Refused'  
      1 = 'About every day'  
      2 = 'Several times a week'  
      3 = 'Several times a month'  
      4 = 'Once a month'  
      5 = 'Several times a year'  
      6 = 'Once a year or less'  
      7 = 'Never' ;
   value Q7F
      -1 = 'Refused'  
      1 = 'Completely'  
      2 = 'Mostly'  
      3 = 'Somewhat'  
      4 = 'Not really'  
      5 = 'Not at all' ;
   value Q8F
      -1 = 'Refused'  
      1 = 'Excellent'  
      2 = 'Good'  
      3 = 'Fair'  
      4 = 'Poor' ;
   value Q9F
      -1 = 'Refused'  
      1 = 'Extremely likely'  
      2 = 'Likely'  
      3 = 'Neither likely nor unlikely'  
      4 = 'Unlikely'  
      5 = 'Not at all likely' ;
   value Q10F
      1 = 'Stay in your neighborhood'  
      2 = 'Move to another neighborhood in [dov_urban]'  
      3 = 'Move outside [dov_urban] but stay in the Washington area'  
      4 = 'Move outside the Washington area altogether' ;
   value Q11F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q12F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q13_1F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q13_2F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q13_3F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q13_4F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q13_5F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q13_6F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q13_7F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q13_8F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q14_1F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q14_2F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q14_3F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q14_4F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q14_5F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q14_6F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q14_7F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q14_8F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q14_9F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q14_10F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q15_TEXT1_REFUSED
      -1 = 'Refused' ;
   value Q15_TEXT2_REFUSED
      -1 = 'Refused' ;
   value Q15_TEXT3_REFUSED
      -1 = 'Refused' ;
   value Q16_TEXT1_REFUSED
      -1 = 'Refused' ;
   value Q16_TEXT2_REFUSED
      -1 = 'Refused' ;
   value Q16_TEXT3_REFUSED
      -1 = 'Refused' ;
   value Q17F
      -1 = 'Refused'  
      1 = 'Better'  
      2 = 'Worse'  
      3 = 'About the same' ;
   value Q18F
      -1 = 'Refused'  
      1 = 'Very safe'  
      2 = 'Somewhat safe'  
      3 = 'Not very safe'  
      4 = 'Not safe at all' ;
   value Q19F
      -1 = 'Refused'  
      1 = 'Very safe'  
      2 = 'Somewhat safe'  
      3 = 'Not very safe'  
      4 = 'Not safe at all' ;
   value Q20_A
      -1 = 'Refused'  
      1 = 'Never'  
      2 = 'Less than once per month'  
      3 = 'Monthly'  
      4 = 'Weekly'  
      5 = 'Daily' ;
   value Q20_B
      -1 = 'Refused'  
      1 = 'Never'  
      2 = 'Less than once per month'  
      3 = 'Monthly'  
      4 = 'Weekly'  
      5 = 'Daily' ;
   value Q20_C
      -1 = 'Refused'  
      1 = 'Never'  
      2 = 'Less than once per month'  
      3 = 'Monthly'  
      4 = 'Weekly'  
      5 = 'Daily' ;
   value Q20_D
      -1 = 'Refused'  
      1 = 'Never'  
      2 = 'Less than once per month'  
      3 = 'Monthly'  
      4 = 'Weekly'  
      5 = 'Daily' ;
   value Q20_E
      -1 = 'Refused'  
      1 = 'Never'  
      2 = 'Less than once per month'  
      3 = 'Monthly'  
      4 = 'Weekly'  
      5 = 'Daily' ;
   value Q20_F
      -1 = 'Refused'  
      1 = 'Never'  
      2 = 'Less than once per month'  
      3 = 'Monthly'  
      4 = 'Weekly'  
      5 = 'Daily' ;
   value Q20_G
      -1 = 'Refused'  
      1 = 'Never'  
      2 = 'Less than once per month'  
      3 = 'Monthly'  
      4 = 'Weekly'  
      5 = 'Daily' ;
   value Q20_H
      -1 = 'Refused'  
      1 = 'Never'  
      2 = 'Less than once per month'  
      3 = 'Monthly'  
      4 = 'Weekly'  
      5 = 'Daily' ;
   value Q20_I
      -1 = 'Refused'  
      1 = 'Never'  
      2 = 'Less than once per month'  
      3 = 'Monthly'  
      4 = 'Weekly'  
      5 = 'Daily' ;
   value Q21_A
      -1 = 'Refused'  
      1 = 'Excellent'  
      2 = 'Good'  
      3 = 'Fair'  
      4 = 'Poor' ;
   value Q21_B
      -1 = 'Refused'  
      1 = 'Excellent'  
      2 = 'Good'  
      3 = 'Fair'  
      4 = 'Poor' ;
   value Q21_C
      -1 = 'Refused'  
      1 = 'Excellent'  
      2 = 'Good'  
      3 = 'Fair'  
      4 = 'Poor' ;
   value Q21_D
      -1 = 'Refused'  
      1 = 'Excellent'  
      2 = 'Good'  
      3 = 'Fair'  
      4 = 'Poor' ;
   value Q21_E
      -1 = 'Refused'  
      1 = 'Excellent'  
      2 = 'Good'  
      3 = 'Fair'  
      4 = 'Poor' ;
   value Q21_F
      -1 = 'Refused'  
      1 = 'Excellent'  
      2 = 'Good'  
      3 = 'Fair'  
      4 = 'Poor' ;
   value Q22F
      -1 = 'Refused'  
      1 = 'Never'  
      2 = 'At least once a year'  
      3 = 'At least once every couple of months'  
      4 = 'At least once a month'  
      5 = 'At least several times a month' ;
   value Q23_1F
      0 = 'No'  
      1 = 'Yes' ;
   value Q23_2F
      0 = 'No'  
      1 = 'Yes' ;
   value Q23_3F
      0 = 'No'  
      1 = 'Yes' ;
   value Q23_4F
      0 = 'No'  
      1 = 'Yes' ;
   value Q23_5F
      0 = 'No'  
      1 = 'Yes' ;
   value Q23_6F
      0 = 'No'  
      1 = 'Yes' ;
   value Q23_REFUSED
      0 = 'No'  
      1 = 'Yes' ;
   value Q24F
      -1 = 'Refused'  
      1 = 'Very satisfied'  
      2 = 'Somewhat satisfied'  
      3 = 'Somewhat unsatisfied'  
      4 = 'Very unsatisfied' ;
   value Q25F
      -1 = 'Refused'  
      1 = 'Changing a lot'  
      2 = 'Changing a little'  
      3 = 'Not changing much at all' ;
   value Q26F
      -1 = 'Refused'  
      1 = 'Benefit me or people like me'  
      2 = 'Benefit people different than me'  
      3 = 'Generally benefit everyone'  
      4 = 'Generally benefit no one' ;
   value Q27F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q28_1F
      0 = 'No'  
      1 = 'Yes' ;
   value Q28_2F
      0 = 'No'  
      1 = 'Yes' ;
   value Q28_3F
      0 = 'No'  
      1 = 'Yes' ;
   value Q28_4F
      0 = 'No'  
      1 = 'Yes' ;
   value Q28_5F
      0 = 'No'  
      1 = 'Yes' ;
   value Q28_6F
      0 = 'No'  
      1 = 'Yes' ;
   value Q28_7F
      0 = 'No'  
      1 = 'Yes' ;
   value Q28_8F
      0 = 'No'  
      1 = 'Yes' ;
   value Q28_9F
      0 = 'No'  
      1 = 'Yes' ;
   value Q28_10F
      0 = 'No'  
      1 = 'Yes' ;
   value Q28_REFUSED
      0 = 'No'  
      1 = 'Yes' ;
   value Q29F
      1 = 'Somewhere nearby in [dov_urban]'  
      2 = 'Somewhere further away in [dov_urban]'  
      3 = 'To a different city or county in the Washington area'  
      4 = 'Somewhere outside the Washington area'  
      5 = 'Don’t know' ;
   value Q30_A
      -1 = 'Refused'  
      1 = 'Excellent'  
      2 = 'Good'  
      3 = 'Fair'  
      4 = 'Poor' ;
   value Q30_B
      -1 = 'Refused'  
      1 = 'Excellent'  
      2 = 'Good'  
      3 = 'Fair'  
      4 = 'Poor' ;
   value Q31F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q32_A
      -1 = 'Refused'  
      1 = 'Excellent'  
      2 = 'Good'  
      3 = 'Fair'  
      4 = 'Poor' ;
   value Q32_B
      -1 = 'Refused'  
      1 = 'Excellent'  
      2 = 'Good'  
      3 = 'Fair'  
      4 = 'Poor' ;
   value Q33F
      -1 = 'Refused'  
      1 = 'I have great influence over local-government decision-making'  
      2 = 'I have moderate influence'  
      3 = 'I have a little influence'  
      4 = 'I have no influence at all' ;
   value Q34F
      -1 = 'Refused'  
      1 = 'A great deal'  
      2 = 'A fair amount'  
      3 = 'Not very much'  
      4 = 'None at all' ;
   value Q35_A
      -1 = 'Refused'  
      1 = 'Extremely high priority'  
      2 = 'High priority'  
      3 = 'Medium priority'  
      4 = 'Low priority'  
      5 = 'Not a priority at all' ;
   value Q35_B
      -1 = 'Refused'  
      1 = 'Extremely high priority'  
      2 = 'High priority'  
      3 = 'Medium priority'  
      4 = 'Low priority'  
      5 = 'Not a priority at all' ;
   value Q35_C
      -1 = 'Refused'  
      1 = 'Extremely high priority'  
      2 = 'High priority'  
      3 = 'Medium priority'  
      4 = 'Low priority'  
      5 = 'Not a priority at all' ;
   value Q35_D
      -1 = 'Refused'  
      1 = 'Extremely high priority'  
      2 = 'High priority'  
      3 = 'Medium priority'  
      4 = 'Low priority'  
      5 = 'Not a priority at all' ;
   value Q35_E
      -1 = 'Refused'  
      1 = 'Extremely high priority'  
      2 = 'High priority'  
      3 = 'Medium priority'  
      4 = 'Low priority'  
      5 = 'Not a priority at all' ;
   value Q35_F
      -1 = 'Refused'  
      1 = 'Extremely high priority'  
      2 = 'High priority'  
      3 = 'Medium priority'  
      4 = 'Low priority'  
      5 = 'Not a priority at all' ;
   value Q35_G
      -1 = 'Refused'  
      1 = 'Extremely high priority'  
      2 = 'High priority'  
      3 = 'Medium priority'  
      4 = 'Low priority'  
      5 = 'Not a priority at all' ;
   value Q35_H
      -1 = 'Refused'  
      1 = 'Extremely high priority'  
      2 = 'High priority'  
      3 = 'Medium priority'  
      4 = 'Low priority'  
      5 = 'Not a priority at all' ;
   value Q35_I
      -1 = 'Refused'  
      1 = 'Extremely high priority'  
      2 = 'High priority'  
      3 = 'Medium priority'  
      4 = 'Low priority'  
      5 = 'Not a priority at all' ;
   value Q35_J
      -1 = 'Refused'  
      1 = 'Extremely high priority'  
      2 = 'High priority'  
      3 = 'Medium priority'  
      4 = 'Low priority'  
      5 = 'Not a priority at all' ;
   value Q35_K
      -1 = 'Refused'  
      1 = 'Extremely high priority'  
      2 = 'High priority'  
      3 = 'Medium priority'  
      4 = 'Low priority'  
      5 = 'Not a priority at all' ;
   value Q35_L
      -1 = 'Refused'  
      1 = 'Extremely high priority'  
      2 = 'High priority'  
      3 = 'Medium priority'  
      4 = 'Low priority'  
      5 = 'Not a priority at all' ;
   value Q36F
      -1 = 'Refused'  
      1 = 'Excellent'  
      2 = 'Very good'  
      3 = 'Good'  
      4 = 'Fair'  
      5 = 'Poor' ;
   value Q39A
      -1 = 'Refused'  
      0 = '0 – Not at all satisfied'  
      1 = '1'  
      2 = '2'  
      3 = '3'  
      4 = '4'  
      5 = '5'  
      6 = '6'  
      7 = '7'  
      8 = '8'  
      9 = '9'  
      10 = '10 – Completely satisfied' ;
   value Q39B
      -1 = 'Refused'  
      0 = '0 – Not at all worthwhile'  
      1 = '1'  
      2 = '2'  
      3 = '3'  
      4 = '4'  
      5 = '5'  
      6 = '6'  
      7 = '7'  
      8 = '8'  
      9 = '9'  
      10 = '10 – Completely worthwhile' ;
   value Q39C
      -1 = 'Refused'  
      0 = '0 – Not at all happy'  
      1 = '1'  
      2 = '2'  
      3 = '3'  
      4 = '4'  
      5 = '5'  
      6 = '6'  
      7 = '7'  
      8 = '8'  
      9 = '9'  
      10 = '10 – Completely happy' ;
   value Q39D
      -1 = 'Refused'  
      0 = '0 – Not at all anxious'  
      1 = '1'  
      2 = '2'  
      3 = '3'  
      4 = '4'  
      5 = '5'  
      6 = '6'  
      7 = '7'  
      8 = '8'  
      9 = '9'  
      10 = '10 – Completely anxious' ;
   value Q40F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q41A
      -1 = 'Refused'  
      0 = '0 – Worse possible life'  
      1 = '1'  
      2 = '2'  
      3 = '3'  
      4 = '4'  
      5 = '5'  
      6 = '6'  
      7 = '7'  
      8 = '8'  
      9 = '9'  
      10 = '10 – Best possible life' ;
   value Q41B
      -1 = 'Refused'  
      0 = '0 – Worse possible life'  
      1 = '1'  
      2 = '2'  
      3 = '3'  
      4 = '4'  
      5 = '5'  
      6 = '6'  
      7 = '7'  
      8 = '8'  
      9 = '9'  
      10 = '10 – Best possible life' ;
   value Q42F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q43F
      -1 = 'Refused'  
      1 = 'Less than once per month'  
      2 = 'Monthly'  
      3 = 'Weekly'  
      4 = 'Daily' ;
   value Q44_A
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q44_B
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q44_C
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q44_D
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q44_E
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q44_F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q44_G
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q44_H
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q44_I
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q44_J
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q44_K
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q44_L
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q44_M
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q44_N
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q45_A
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q45_B
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q45_C
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q45_D
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q45_E
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q45_F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q45_G
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q45_H
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q45_I
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q46_A
      -1 = 'Refused'  
      1 = 'Very good'  
      2 = 'Good'  
      3 = 'Neither good nor bad'  
      4 = 'Bad'  
      5 = 'Very bad' ;
   value Q46_B
      -1 = 'Refused'  
      1 = 'Very good'  
      2 = 'Good'  
      3 = 'Neither good nor bad'  
      4 = 'Bad'  
      5 = 'Very bad' ;
   value Q46_C
      -1 = 'Refused'  
      1 = 'Very good'  
      2 = 'Good'  
      3 = 'Neither good nor bad'  
      4 = 'Bad'  
      5 = 'Very bad' ;
   value Q46_D
      -1 = 'Refused'  
      1 = 'Very good'  
      2 = 'Good'  
      3 = 'Neither good nor bad'  
      4 = 'Bad'  
      5 = 'Very bad' ;
   value Q46_E
      -1 = 'Refused'  
      1 = 'Very good'  
      2 = 'Good'  
      3 = 'Neither good nor bad'  
      4 = 'Bad'  
      5 = 'Very bad' ;
   value Q46_F
      -1 = 'Refused'  
      1 = 'Very good'  
      2 = 'Good'  
      3 = 'Neither good nor bad'  
      4 = 'Bad'  
      5 = 'Very bad' ;
   value Q46_G
      -1 = 'Refused'  
      1 = 'Very good'  
      2 = 'Good'  
      3 = 'Neither good nor bad'  
      4 = 'Bad'  
      5 = 'Very bad' ;
   value Q46_H
      -1 = 'Refused'  
      1 = 'Very good'  
      2 = 'Good'  
      3 = 'Neither good nor bad'  
      4 = 'Bad'  
      5 = 'Very bad' ;
   value Q46_I
      -1 = 'Refused'  
      1 = 'Very good'  
      2 = 'Good'  
      3 = 'Neither good nor bad'  
      4 = 'Bad'  
      5 = 'Very bad' ;
   value Q46_J
      -1 = 'Refused'  
      1 = 'Very good'  
      2 = 'Good'  
      3 = 'Neither good nor bad'  
      4 = 'Bad'  
      5 = 'Very bad' ;
   value Q46_K
      -1 = 'Refused'  
      1 = 'Very good'  
      2 = 'Good'  
      3 = 'Neither good nor bad'  
      4 = 'Bad'  
      5 = 'Very bad' ;
   value Q46_L
      -1 = 'Refused'  
      1 = 'Very good'  
      2 = 'Good'  
      3 = 'Neither good nor bad'  
      4 = 'Bad'  
      5 = 'Very bad' ;
   value Q46_M
      -1 = 'Refused'  
      1 = 'Very good'  
      2 = 'Good'  
      3 = 'Neither good nor bad'  
      4 = 'Bad'  
      5 = 'Very bad' ;
   value Q46_N
      -1 = 'Refused'  
      1 = 'Very good'  
      2 = 'Good'  
      3 = 'Neither good nor bad'  
      4 = 'Bad'  
      5 = 'Very bad' ;
   value Q46_O
      -1 = 'Refused'  
      1 = 'Very good'  
      2 = 'Good'  
      3 = 'Neither good nor bad'  
      4 = 'Bad'  
      5 = 'Very bad' ;
   value Q46_P
      -1 = 'Refused'  
      1 = 'Very good'  
      2 = 'Good'  
      3 = 'Neither good nor bad'  
      4 = 'Bad'  
      5 = 'Very bad' ;
   value Q47_A
      -1 = 'Refused'  
      1 = 'Excellent'  
      2 = 'Good'  
      3 = 'Fair'  
      4 = 'Poor' ;
   value Q47_B
      -1 = 'Refused'  
      1 = 'Excellent'  
      2 = 'Good'  
      3 = 'Fair'  
      4 = 'Poor' ;
   value Q47_C
      -1 = 'Refused'  
      1 = 'Excellent'  
      2 = 'Good'  
      3 = 'Fair'  
      4 = 'Poor' ;
   value Q48F
      -1 = 'Refused'  
      1 = 'Not at all'  
      2 = 'A little'  
      3 = 'Somewhat'  
      4 = 'A lot' ;
   value Q49F
      -1 = 'Refused'  
      1 = 'Less favorably'  
      2 = 'More favorably'  
      3 = 'Equally' ;
   value Q50F
      -1 = 'Refused'  
      1 = 'Very good'  
      2 = 'Good'  
      3 = 'Neither good nor bad'  
      4 = 'Bad'  
      5 = 'Very bad' ;
   value Q51F
      -1 = 'Refused'  
      1 = 'Getting better'  
      2 = 'Getting worse'  
      3 = 'About the same' ;
   value Q52F
      -1 = 'Refused'  
      1 = 'Living comfortably'  
      2 = 'Doing alright'  
      3 = 'Just getting by'  
      4 = 'Finding it difficult'  
      5 = 'Finding it very difficult' ;
   value Q53F
      -1 = 'Refused'  
      1 = 'I’m better off than my parents were when they were my age'  
      2 = 'I’m worse off than my parents were'  
      3 = 'About the same' ;
   value Q54F
      -1 = 'Refused'  
      1 = 'Less than a month'  
      2 = 'At least 1 month but less than 2'  
      3 = 'At least 2 months but less than 6'  
      4 = 'At least 6 months but less than a year'  
      5 = 'At least a year but less than 2 years'  
      6 = '2 years or more' ;
   value Q55F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q56F
      -1 = 'Refused'  
      1 = 'Almost every month'  
      2 = 'Some months but not every month'  
      3 = 'Only 1 or 2 months' ;
   value Q57F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q58F
      -1 = 'Refused'  
      1 = 'Almost every month'  
      2 = 'Some months but not every month'  
      3 = 'Only 1 or 2 months' ;
   value Q59F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q60F
      -1 = 'Refused'  
      1 = 'Strongly agree'  
      2 = 'Agree'  
      3 = 'Neither agree or disagree'  
      4 = 'Disagree'  
      5 = 'Strongly disagree' ;
   value Q61_A
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q61_B
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q61_C
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q61_D
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q61_E
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q61_F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q61_G
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q61_H
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q61_I
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q61_J
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q62F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q63_A
      -1 = 'Refused'  
      1 = 'Not a barrier'  
      2 = 'Minor barrier'  
      3 = 'Major barrier' ;
   value Q63_B
      -1 = 'Refused'  
      1 = 'Not a barrier'  
      2 = 'Minor barrier'  
      3 = 'Major barrier' ;
   value Q63_C
      -1 = 'Refused'  
      1 = 'Not a barrier'  
      2 = 'Minor barrier'  
      3 = 'Major barrier' ;
   value Q63_D
      -1 = 'Refused'  
      1 = 'Not a barrier'  
      2 = 'Minor barrier'  
      3 = 'Major barrier' ;
   value Q63_E
      -1 = 'Refused'  
      1 = 'Not a barrier'  
      2 = 'Minor barrier'  
      3 = 'Major barrier' ;
   value Q63_F
      -1 = 'Refused'  
      1 = 'Not a barrier'  
      2 = 'Minor barrier'  
      3 = 'Major barrier' ;
   value Q63_G
      -1 = 'Refused'  
      1 = 'Not a barrier'  
      2 = 'Minor barrier'  
      3 = 'Major barrier' ;
   value Q63_H
      -1 = 'Refused'  
      1 = 'Not a barrier'  
      2 = 'Minor barrier'  
      3 = 'Major barrier' ;
   value Q77F
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value Q78F
      -1 = 'Refused'  
      1 = 'A naturalized US citizen'  
      2 = 'A legal permanent resident or green card holder'  
      3 = 'Not a permanent resident but have some other type of visa'  
      4 = 'None of these' ;
   value Q79F
      -1 = 'Refused'  
      1 = 'Heterosexual/straight'  
      2 = 'Gay/lesbian'  
      3 = 'Bisexual'  
      4 = 'Transgender'  
      5 = 'Other sexual orientation (please specify):'  
      6 = 'Questioning or unsure' ;
   value STUDENT
      -1 = 'Refused'  
      1 = 'Yes'  
      2 = 'No' ;
   value DEVICETYPE
      1 = 'iPad'  
      2 = 'iPod'  
      3 = 'iPhone'  
      4 = 'Mac'  
      5 = 'ChromeBook'  
      6 = 'BlackBerry'  
      7 = 'AndroidTablet'  
      8 = 'AndroidPhone'  
      9 = 'TabletOther'  
      10 = 'WinPC'  
      11 = 'WinPhone'  
      12 = 'WinMobileOther'  
      13 = 'WinTouch'  
      14 = 'KindleFireTablet'  
      15 = 'NookTablet'  
      16 = 'others' ;
   value DOV_REL1F
      -1 = 'Refused'  
      1 = 'Catholic'  
      2 = 'Evangelical or Protestant Christian (Baptist, Lutheran, Methodist, Presbyterian, Episcopalian, Pentecostal, Church of Ch'  
      3 = 'Jehovah’s Witness'  
      4 = 'Mormon'  
      5 = 'Jewish'  
      6 = 'Islam/Muslim'  
      7 = 'Orthodox Church (Greek or Russian)'  
      8 = 'Hindu'  
      9 = 'Buddhist'  
      10 = 'Unitarian (Universalist)'  
      11 = 'Other Christian religion'  
      12 = 'Other non-Christian religion'  
      13 = 'No religion, not a believer, atheist, agnostic'  
      14 = 'Refused' ;
   value DOV_IDEO
      -1 = 'Refused'  
      1 = 'Extremely liberal'  
      2 = 'Liberal'  
      3 = 'Slightly liberal'  
      4 = 'Moderate, middle of the road'  
      5 = 'Slightly conservative'  
      6 = 'Conservative'  
      7 = 'Extremely conservative'  
      8 = 'Refused' ;
   value PPRACEM
      -1 = 'Refused'  
      1 = 'White'  
      2 = 'Black or African American'  
      3 = 'American Indian Or Alaska Native'  
      4 = 'Asian'  
      5 = 'Native Hawaiian/Pacific Islander'  
      6 = '2 + Races' ;
   value PPAGE
      -2 = 'Not asked'  
      -1 = 'REFUSED' ;
   value PPAGECAT
      1 = '18-24'  
      2 = '25-34'  
      3 = '35-44'  
      4 = '45-54'  
      5 = '55-64'  
      6 = '65-74'  
      7 = '75+'  
      99 = 'Under 18' ;
   value PPAGECT4F
      1 = '18-29'  
      2 = '30-44'  
      3 = '45-59'  
      4 = '60+'  
      99 = 'Under 18' ;
   value PPEDUC
      -2 = 'Not asked'  
      -1 = 'REFUSED'  
      1 = 'No formal education'  
      2 = '1st, 2nd, 3rd, or 4th grade'  
      3 = '5th or 6th grade'  
      4 = '7th or 8th grade'  
      5 = '9th grade'  
      6 = '10th grade'  
      7 = '11th grade'  
      8 = '12th grade NO DIPLOMA'  
      9 = 'HIGH SCHOOL GRADUATE - high school DIPLOMA or the equivalent (GED)'  
      10 = 'Some college, no degree'  
      11 = 'Associate degree'  
      12 = 'Bachelors degree'  
      13 = 'Masters degree'  
      14 = 'Professional or Doctorate degree' ;
   value PPEDUCAT
      -2 = 'Not asked'  
      -1 = 'REFUSED'  
      1 = 'Less than high school'  
      2 = 'High school'  
      3 = 'Some college'  
      4 = 'Bachelor''s degree or higher' ;
   value PPETHM
      -2 = 'Not asked'  
      -1 = 'REFUSED'  
      1 = 'White, Non-Hispanic'  
      2 = 'Black, Non-Hispanic'  
      3 = 'Other, Non-Hispanic'  
      4 = 'Hispanic'  
      5 = '2+ Races, Non-Hispanic' ;
   value PPGENDER
      -2 = 'Not asked'  
      -1 = 'REFUSED'  
      1 = 'Male'  
      2 = 'Female' ;
   value PPHHHEAD
      -2 = 'Not asked'  
      -1 = 'REFUSED'  
      0 = 'No'  
      1 = 'Yes' ;
   value PPHHSIZE
      -2 = 'Not asked'  
      -1 = 'REFUSED' ;
   value PPHOUSE
      -2 = 'Not asked'  
      -1 = 'REFUSED'  
      1 = 'A one-family house detached from any other house'  
      2 = 'A one-family house attached to one or more houses'  
      3 = 'A building with 2 or more apartments'  
      4 = 'A mobile home'  
      5 = 'Boat, RV, van, etc.' ;
   value PPINCIMP
      -2 = 'Not asked'  
      -1 = 'REFUSED'  
      1 = 'Less than $5,000'  
      2 = '$5,000 to $7,499'  
      3 = '$7,500 to $9,999'  
      4 = '$10,000 to $12,499'  
      5 = '$12,500 to $14,999'  
      6 = '$15,000 to $19,999'  
      7 = '$20,000 to $24,999'  
      8 = '$25,000 to $29,999'  
      9 = '$30,000 to $34,999'  
      10 = '$35,000 to $39,999'  
      11 = '$40,000 to $49,999'  
      12 = '$50,000 to $59,999'  
      13 = '$60,000 to $74,999'  
      14 = '$75,000 to $84,999'  
      15 = '$85,000 to $99,999'  
      16 = '$100,000 to $124,999'  
      17 = '$125,000 to $149,999'  
      18 = '$150,000 to $174,999'  
      19 = '$175,000 to $199,999'  
      20 = '$200,000 to $249,999'  
      21 = '$250,000 or more' ;
   value PPMARIT
      -2 = 'Not asked'  
      -1 = 'REFUSED'  
      1 = 'Married'  
      2 = 'Widowed'  
      3 = 'Divorced'  
      4 = 'Separated'  
      5 = 'Never married'  
      6 = 'Living with partner' ;
   value PPMSACAT
      -2 = 'Not asked'  
      -1 = 'REFUSED'  
      0 = 'Non-Metro'  
      1 = 'Metro' ;
   value PPREG4F
      -2 = 'Not asked'  
      -1 = 'REFUSED'  
      1 = 'Northeast'  
      2 = 'Midwest'  
      3 = 'South'  
      4 = 'West' ;
   value PPREG9F
      1 = 'New England'  
      2 = 'Mid-Atlantic'  
      3 = 'East-North Central'  
      4 = 'West-North Central'  
      5 = 'South Atlantic'  
      6 = 'East-South Central'  
      7 = 'West-South Central'  
      8 = 'Mountain'  
      9 = 'Pacific' ;
   value PPRENT
      -2 = 'Not asked'  
      -1 = 'REFUSED'  
      1 = 'Owned or being bought by you or someone in your household'  
      2 = 'Rented for cash'  
      3 = 'Occupied without payment of cash rent' ;
   value PPSTATEN
      -2 = 'Not asked'  
      -1 = 'REFUSED'  
      11 = 'ME'  
      12 = 'NH'  
      13 = 'VT'  
      14 = 'MA'  
      15 = 'RI'  
      16 = 'CT'  
      21 = 'NY'  
      22 = 'NJ'  
      23 = 'PA'  
      31 = 'OH'  
      32 = 'IN'  
      33 = 'IL'  
      34 = 'MI'  
      35 = 'WI'  
      41 = 'MN'  
      42 = 'IA'  
      43 = 'MO'  
      44 = 'ND'  
      45 = 'SD'  
      46 = 'NE'  
      47 = 'KS'  
      51 = 'DE'  
      52 = 'MD'  
      53 = 'DC'  
      54 = 'VA'  
      55 = 'WV'  
      56 = 'NC'  
      57 = 'SC'  
      58 = 'GA'  
      59 = 'FL'  
      61 = 'KY'  
      62 = 'TN'  
      63 = 'AL'  
      64 = 'MS'  
      71 = 'AR'  
      72 = 'LA'  
      73 = 'OK'  
      74 = 'TX'  
      81 = 'MT'  
      82 = 'ID'  
      83 = 'WY'  
      84 = 'CO'  
      85 = 'NM'  
      86 = 'AZ'  
      87 = 'UT'  
      88 = 'NV'  
      91 = 'WA'  
      92 = 'OR'  
      93 = 'CA'  
      94 = 'AK'  
      95 = 'HI'  
      96 = 'AS'  
      97 = 'GU'  
      98 = 'PR'  
      99 = 'VI' ;
   value PPT01F
      -2 = 'Not asked'  
      -1 = 'REFUSED' ;
   value PPT25F
      -2 = 'Not asked'  
      -1 = 'REFUSED' ;
   value PPT612F
      -2 = 'Not asked'  
      -1 = 'REFUSED' ;
   value PPT1317F
      -2 = 'Not asked'  
      -1 = 'REFUSED' ;
   value PPT18OV
      -2 = 'Not asked'  
      -1 = 'REFUSED' ;
   value PPWORK
      -2 = 'Not asked'  
      -1 = 'REFUSED'  
      1 = 'Working - as a paid employee'  
      2 = 'Working - self-employed'  
      3 = 'Not working - on temporary layoff from a job'  
      4 = 'Not working - looking for work'  
      5 = 'Not working - retired'  
      6 = 'Not working - disabled'  
      7 = 'Not working - other' ;
run;

proc catalog catalog=Voices.Formats;
  contents;
quit;


/****
proc datasets library = Voices ;
modify urbaninstitute_voicesdmvsurvey2017_client;
   format  offpanel OFFPANEL.;
   format dov_urban DOV_URBAN.;
   format Q1_Refused Q1_REFUSED.;
   format Q2_Refused Q2_REFUSED.;
   format  Q3_Years Q3_YEARS.;
   format Q3_Months Q3_MONTHS.;
   format  Q4_Years Q4_YEARS.;
   format Q4_Months Q4_MONTHS.;
   format  Q5_Years Q5_YEARS.;
   format Q5_Months Q5_MONTHS.;
   format        Q6 Q6F.;
   format        Q7 Q7F.;
   format        Q8 Q8F.;
   format        Q9 Q9F.;
   format       Q10 Q10F.;
   format       Q11 Q11F.;
   format       Q12 Q12F.;
   format     Q13_1 Q13_1F.;
   format     Q13_2 Q13_2F.;
   format     Q13_3 Q13_3F.;
   format     Q13_4 Q13_4F.;
   format     Q13_5 Q13_5F.;
   format     Q13_6 Q13_6F.;
   format     Q13_7 Q13_7F.;
   format     Q13_8 Q13_8F.;
   format     Q14_1 Q14_1F.;
   format     Q14_2 Q14_2F.;
   format     Q14_3 Q14_3F.;
   format     Q14_4 Q14_4F.;
   format     Q14_5 Q14_5F.;
   format     Q14_6 Q14_6F.;
   format     Q14_7 Q14_7F.;
   format     Q14_8 Q14_8F.;
   format     Q14_9 Q14_9F.;
   format    Q14_10 Q14_10F.;
   format Q15_Text1_Refused Q15_TEXT1_REFUSED.;
   format Q15_Text2_Refused Q15_TEXT2_REFUSED.;
   format Q15_Text3_Refused Q15_TEXT3_REFUSED.;
   format Q16_Text1_Refused Q16_TEXT1_REFUSED.;
   format Q16_Text2_Refused Q16_TEXT2_REFUSED.;
   format Q16_Text3_Refused Q16_TEXT3_REFUSED.;
   format       Q17 Q17F.;
   format       Q18 Q18F.;
   format       Q19 Q19F.;
   format     Q20_a Q20_A.;
   format     Q20_b Q20_B.;
   format     Q20_c Q20_C.;
   format     Q20_d Q20_D.;
   format     Q20_e Q20_E.;
   format     Q20_f Q20_F.;
   format     Q20_g Q20_G.;
   format     Q20_h Q20_H.;
   format     Q20_i Q20_I.;
   format     Q21_a Q21_A.;
   format     Q21_b Q21_B.;
   format     Q21_c Q21_C.;
   format     Q21_d Q21_D.;
   format     Q21_e Q21_E.;
   format     Q21_f Q21_F.;
   format       Q22 Q22F.;
   format     Q23_1 Q23_1F.;
   format     Q23_2 Q23_2F.;
   format     Q23_3 Q23_3F.;
   format     Q23_4 Q23_4F.;
   format     Q23_5 Q23_5F.;
   format     Q23_6 Q23_6F.;
   format Q23_Refused Q23_REFUSED.;
   format       Q24 Q24F.;
   format       Q25 Q25F.;
   format       Q26 Q26F.;
   format       Q27 Q27F.;
   format     Q28_1 Q28_1F.;
   format     Q28_2 Q28_2F.;
   format     Q28_3 Q28_3F.;
   format     Q28_4 Q28_4F.;
   format     Q28_5 Q28_5F.;
   format     Q28_6 Q28_6F.;
   format     Q28_7 Q28_7F.;
   format     Q28_8 Q28_8F.;
   format     Q28_9 Q28_9F.;
   format    Q28_10 Q28_10F.;
   format Q28_Refused Q28_REFUSED.;
   format       Q29 Q29F.;
   format     Q30_a Q30_A.;
   format     Q30_b Q30_B.;
   format       Q31 Q31F.;
   format     Q32_a Q32_A.;
   format     Q32_b Q32_B.;
   format       Q33 Q33F.;
   format       Q34 Q34F.;
   format     Q35_a Q35_A.;
   format     Q35_b Q35_B.;
   format     Q35_c Q35_C.;
   format     Q35_d Q35_D.;
   format     Q35_e Q35_E.;
   format     Q35_f Q35_F.;
   format     Q35_g Q35_G.;
   format     Q35_h Q35_H.;
   format     Q35_i Q35_I.;
   format     Q35_j Q35_J.;
   format     Q35_k Q35_K.;
   format     Q35_l Q35_L.;
   format       Q36 Q36F.;
   format      Q39A Q39A.;
   format      Q39B Q39B.;
   format      Q39C Q39C.;
   format      Q39D Q39D.;
   format       Q40 Q40F.;
   format      Q41A Q41A.;
   format      Q41B Q41B.;
   format       Q42 Q42F.;
   format       Q43 Q43F.;
   format     Q44_a Q44_A.;
   format     Q44_b Q44_B.;
   format     Q44_c Q44_C.;
   format     Q44_d Q44_D.;
   format     Q44_e Q44_E.;
   format     Q44_f Q44_F.;
   format     Q44_g Q44_G.;
   format     Q44_h Q44_H.;
   format     Q44_i Q44_I.;
   format     Q44_j Q44_J.;
   format     Q44_k Q44_K.;
   format     Q44_l Q44_L.;
   format     Q44_m Q44_M.;
   format     Q44_n Q44_N.;
   format     Q45_a Q45_A.;
   format     Q45_b Q45_B.;
   format     Q45_c Q45_C.;
   format     Q45_d Q45_D.;
   format     Q45_e Q45_E.;
   format     Q45_f Q45_F.;
   format     Q45_g Q45_G.;
   format     Q45_h Q45_H.;
   format     Q45_i Q45_I.;
   format     Q46_a Q46_A.;
   format     Q46_b Q46_B.;
   format     Q46_c Q46_C.;
   format     Q46_d Q46_D.;
   format     Q46_e Q46_E.;
   format     Q46_f Q46_F.;
   format     Q46_g Q46_G.;
   format     Q46_h Q46_H.;
   format     Q46_i Q46_I.;
   format     Q46_j Q46_J.;
   format     Q46_k Q46_K.;
   format     Q46_l Q46_L.;
   format     Q46_m Q46_M.;
   format     Q46_n Q46_N.;
   format     Q46_o Q46_O.;
   format     Q46_p Q46_P.;
   format     Q47_a Q47_A.;
   format     Q47_b Q47_B.;
   format     Q47_c Q47_C.;
   format       Q48 Q48F.;
   format       Q49 Q49F.;
   format       Q50 Q50F.;
   format       Q51 Q51F.;
   format       Q52 Q52F.;
   format       Q53 Q53F.;
   format       Q54 Q54F.;
   format       Q55 Q55F.;
   format       Q56 Q56F.;
   format       Q57 Q57F.;
   format       Q58 Q58F.;
   format       Q59 Q59F.;
   format       Q60 Q60F.;
   format     Q61_a Q61_A.;
   format     Q61_b Q61_B.;
   format     Q61_c Q61_C.;
   format     Q61_d Q61_D.;
   format     Q61_e Q61_E.;
   format     Q61_f Q61_F.;
   format     Q61_g Q61_G.;
   format     Q61_h Q61_H.;
   format     Q61_i Q61_I.;
   format     Q61_j Q61_J.;
   format       Q62 Q62F.;
   format     Q63_a Q63_A.;
   format     Q63_b Q63_B.;
   format     Q63_c Q63_C.;
   format     Q63_d Q63_D.;
   format     Q63_e Q63_E.;
   format     Q63_f Q63_F.;
   format     Q63_g Q63_G.;
   format     Q63_h Q63_H.;
   format       Q77 Q77F.;
   format       Q78 Q78F.;
   format       Q79 Q79F.;
   format   student STUDENT.;
   format DeviceType DEVICETYPE.;
   format  DOV_REL1 DOV_REL1F.;
   format  DOV_IDEO DOV_IDEO.;
   format   ppracem PPRACEM.;
   format     PPAGE PPAGE.;
   format  ppagecat PPAGECAT.;
   format  ppagect4 PPAGECT4F.;
   format    PPEDUC PPEDUC.;
   format  PPEDUCAT PPEDUCAT.;
   format    PPETHM PPETHM.;
   format  PPGENDER PPGENDER.;
   format  PPHHHEAD PPHHHEAD.;
   format  PPHHSIZE PPHHSIZE.;
   format   PPHOUSE PPHOUSE.;
   format  PPINCIMP PPINCIMP.;
   format   PPMARIT PPMARIT.;
   format  PPMSACAT PPMSACAT.;
   format    PPREG4 PPREG4F.;
   format    ppreg9 PPREG9F.;
   format    PPRENT PPRENT.;
   format  PPSTATEN PPSTATEN.;
   format     PPT01 PPT01F.;
   format     PPT25 PPT25F.;
   format    PPT612 PPT612F.;
   format   PPT1317 PPT1317F.;
   format   PPT18OV PPT18OV.;
   format    PPWORK PPWORK.;
quit;
*****/
