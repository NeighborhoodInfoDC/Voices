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


** Questions 1 and 2 **;

/** Macro Export_q - Start Definition **/

%macro Export_q( qvar );

  %let qvar = %upcase( &qvar );

  title1;
  footnote1;

  ods csvall body="L:\Libraries\Voices\Raw\&qvar..csv";
  ods listing close;

  proc print data=Voices.VoicesDMVSurvey2017;
    id caseid;
    var &qvar;

  run;

  ods csvall close;
  ods listing;

%mend Export_q;

/** End Macro Definition **/

%Export_q( Q1 )
%Export_q( Q2 )


** Questions 15 and 16 **;

/** Macro Export_qm - Start Definition **/

%macro Export_qm( q );

  %let q = %upcase( &q );

  data Voices_&q;
  
    set Voices.VoicesDMVSurvey2017 (keep=caseid &q:);
    
    length Q_id $ 8 &Q $ 1024;
    
    if &q._text1_refused ~= -1 and &Q._text1 ~= "" then do;
      Q_id = "&Q..1";
      &Q = compbl( &Q._text1 );
      output;
    end;
        
    if &q._text2_refused ~= -1 and &Q._text2 ~= "" then do;
      Q_id = "&Q..2";
      &Q = compbl( &Q._text2 );
      output;
    end;
        
    if &q._text3_refused ~= -1 and &Q._text3 ~= "" then do;
      Q_id = "&Q..3";
      &Q = compbl( &Q._text3 );
      output;
    end;
        
    keep caseid Q_id &Q;
    
  run;
  
  
  title1;
  footnote1;

  ods csvall body="L:\Libraries\Voices\Raw\&q..csv";
  ods listing close;

  proc print data=Voices_&q;
    id caseid;
    var &q;

  run;

  ods csvall close;
  ods listing;


%mend Export_qm;

/** End Macro Definition **/


%Export_qm( Q15 )
%Export_qm( Q16 )


