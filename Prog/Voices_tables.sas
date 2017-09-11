/**************************************************************************
 Program:  Voices_tables.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  09/11/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Create VoicesDMV survey tables.

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Voices )

proc format;
  value region
    1 = 'Washington Area';
  value geo
    1 = 'DC'  
    2 = 'Prince George''s Co'  
    3 = 'Montgomery Co'  
    4 = 'Fairfax Co'  
    5 = 'Other NoVA';
    

data VoicesDMVSurvey2017_recode;

  set Voices.VoicesDMVSurvey2017 (OBS=100000);  ** Make the OBS= value smaller for testing **;

  retain total 1 region 1;
  
  format region region.;
  
  ** Reporting areas **;
  
  select ( dov_urban );
    when ( 5, 6, 7, 8 ) geo = 5;
    otherwise geo = dov_urban;
  end;
  
  format geo geo.;
  
  ** Recode questions 3, 4, 5 **;

  array a{*} q3_: q4_: q5_:;

  do i = 1 to dim( a );
    if a{i} = -1 then a{i} = .r;
  end;

  Q3_Years_months_recode = Q3_years + ( Q3_months / 12 );
  Q4_Years_months_recode = Q4_years + ( Q5_months / 12 );
  Q5_Years_months_recode = Q5_years + ( Q5_months / 12 );

  label
    Q3_Years_months_recode = "How long have you lived in the Washington area? (years, recode)"
    Q4_Years_months_recode = "How long have you lived in [dov_urban]? (years, recode)"
    Q5_Years_months_recode = "How long have you lived in your current home? (years, recode)";

  ** Recode questions with 1,2 response codes **;

  array v12{*} Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8;

  do i = 1 to dim( v12 );
  
    select ( v12{i} );
      when ( 1 ) v12{i} = 1;
      when ( 2 ) v12{i} = 0;
      when ( -1 ) v12{i} = .;
    end;
    
  end;

  drop i;
  
run;


** Create data sets with design effect corrections **;

data DEFF_region;

  input region deff;

  datalines;
  1 1.422
  ;

run;

data DEFF_geo;

  input geo deff;
  
  datalines;
  1 1.323
  2 1.595
  3 1.397
  4 1.416
  5 1.276
  ;

run;


** Macros for table creation **;

/** Macro Make_one_table - Start Definition **/

%macro Make_one_table( fmt=percent10.1, col=, var=, text= );

  proc tabulate data=Voices_means_se format=&fmt noseps missing;
    class &col type;
    var &var;
    table 
      /** Rows **/
      &var,
      /** Columns **/
      &col=' ' * sum=' ' * type=' '
      /box = &text
    ;
  run;

%mend Make_one_table;

/** End Macro Definition **/


/** Macro Make_all_tables - Start Definition **/

%macro Make_all_tables( col=, title= );

  ** List all of the variables to be used in the tables here **;

  %let full_var_list = 
    Q3_Years_months_recode Q4_Years_months_recode Q5_Years_months_recode
    Q13:
  ;

  proc summary data=VoicesDMVSurvey2017_recode nway;
    class &col;
    var &full_var_list;
    weight weight;
    output out=Voices_means (drop=_type_ _freq_) mean=;
  run;

  proc summary data=VoicesDMVSurvey2017_recode nway;
    class &col;
    var &full_var_list;
    output out=Voices_se (drop=_type_ _freq_) stderr=;
  run;

  data Voices_se_deff;

    merge Voices_se deff_&col;
    by &col;
    
    array a{*} &full_var_list;
    
    do i = 1 to dim( a );
      a{i} = a{i} * deff;
    end;
    
    drop i;
    
  run;

  data Voices_means_se;

    set Voices_means (in=mean) Voices_se_deff;
    by &col;
    
    if mean then type = 'Mean';
    else type = 'SE';
    
  run;

  %fdate()

  options orientation=landscape;
  options nodate nonumber;

  ods rtf file="&_dcdata_default_path\Voices\Prog\Voices_tables_&col..rtf" style=Pearl;
  ods listing close;
  
  title1 "VoicesDMV Survey: &title";

  footnote1 height=9pt "Prepared by NeighborhoodInfo DC (www.NeighborhoodInfoDC.org), &fdate..";
  footnote2 height=9pt j=r '{Page}\~{\field{\*\fldinst{\pard\b\i0\chcbpat8\qc\f1\fs19\cf1{PAGE }\cf0\chcbpat0}}}';

  %Make_one_table( 
    col=&col, 
    fmt=comma10.1,
    var=Q3_Years_months_recode Q4_Years_months_recode Q5_Years_months_recode, 
    text="How long have you lived in..." 
  )

  %Make_one_table( 
    col=&col, 
    var=Q13:, 
    text="Q13. Have you, yourself, done any of the following in the last 12 months?" 
  )

  ods rtf close;
  ods listing;
  
  title1;
  footnote1;

%mend Make_all_tables;

/** End Macro Definition **/


** Create tables **;

%Make_all_tables( col=region, title=Tables for Entire Region )
%Make_all_tables( col=geo, title=Tables by Jurisdiction )

