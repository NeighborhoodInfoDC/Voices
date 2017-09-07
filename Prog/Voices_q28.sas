/**************************************************************************
 Program:  Voice_q28.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  07/20/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Q28. Multiple choice.

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Voices )

data VoicesDMVSurvey2017;

  set Voices.VoicesDMVSurvey2017;
  
  where q27 = 1 and Q28_refused = 0;  ** Know someone who had to move and answered Q28 **;

  retain total 1;
  
  keep weight total Q28_: ;

run;



** Question 28 **;

ods html body="&_dcdata_default_path\Voices\Prog\Voices_Q28.html" style=Default;

proc tabulate data=VoicesDMVSurvey2017 format=comma10.2 noseps missing;
  var Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10 total;
  weight weight;
    table 
    /** Rows **/
    Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10,
    /** Columns **/
    pctsum<total>
    / box="Q28. Why did this person have to move?"
  ;
  label
    Q28_1 = "Couldn't afford where they were living"
    Q28_2 = "Personal/family illness" 
    Q28_3 = "Divorce/separation"
    Q28_4 = "Lost their job"
    Q28_5 = "Landlord told them to leave"
    Q28_6 = "House/apt in foreclosure"
    Q28_7 = "House/apt redeveloped/demolished"
    Q28_8 = "House/apt damaged by fire/disaster"
    Q28_9 = "Other reason"
    Q28_10 = "Don't know"
    ;
run;

ods html close;
