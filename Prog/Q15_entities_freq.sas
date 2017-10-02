/**************************************************************************
 Program:  Q15_entities_freq.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  09/16/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Frequency for Q15 key entities.

 Modifications:
**************************************************************************/

/*%include "L:\SAS\Inc\StdLocal.sas";*/
%include "C:\DCData\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Voices )

filename fimport "C:\DCData\Libraries\Voices\Raw\Q15_entities.csv" lrecl=1000;

proc import out=Q15_entities
    datafile=fimport
    dbms=csv replace;
  datarow=2;
  getnames=yes;

run;

proc freq data=Q15_entities order=freq;
  tables entity;
run;
