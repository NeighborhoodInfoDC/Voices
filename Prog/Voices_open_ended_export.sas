/**************************************************************************
 Program:  Voices_open_ended_export.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  09/14/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Export all open-ended responses to CSV files for
further processing.

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Voices )

title1;
footnote1;

ods csvall body="L:\Libraries\Voices\Raw\Q1.csv";
ods listing close;

proc print data=Voices.VoicesDMVSurvey2017;
  id caseid;
  var q1;

run;

ods csvall close;
ods listing;

