/**************************************************************************
 Program:  Q16_entities_freq.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  09/16/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Frequency for Q16 key entities.

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Voices )

filename fimport "L:\Libraries\Voices\Raw\Q16_entities.csv" lrecl=1000;

proc import out=Q16_entities
    datafile=fimport
    dbms=csv replace;
  datarow=2;
  getnames=yes;
  guessingrows=max;

run;

proc freq data=Q16_entities order=freq;
  tables entity;
run;
