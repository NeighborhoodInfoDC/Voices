/**************************************************************************
 Program:  Create_deff_2017.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  09/23/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Create design effect correction files for Voices 2017
survey.

 Modifications:
**************************************************************************/


/** Macro Create_deff_2017 - Start Definition **/

%macro Create_deff_2017( var= );

  filename cdeff  "&_dcdata_r_path\Voices\Raw\Deff_&var._2017.txt" lrecl=256;

  ** Create data sets with design effect corrections **;

  data DEFF_&var;
  
    infile cdeff stopover;

    input &var deff;

  run;
  
  filename cdeff clear;
  
  proc print data=deff_&var;
    id &var;
  run;

%mend Create_deff_2017;

/** End Macro Definition **/

