/**************************************************************************
 Program:  Voice_q21.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  07/20/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Question 21: rating scale.

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Voices )

*options obs=100;

data VoicesDMVSurvey2017;

  set Voices.VoicesDMVSurvey2017;

  retain total 1;

  array q21{*} Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f;
  array sq21{*} sQ21_a sQ21_b sQ21_c sQ21_d sQ21_e sQ21_f;
  array dq21{6,4} 
    dQ21_a1 dQ21_a2 dQ21_a3 dQ21_a4 
    dQ21_b1 dQ21_b2 dQ21_b3 dQ21_b4 
    dQ21_c1 dQ21_c2 dQ21_c3 dQ21_c4 
    dQ21_d1 dQ21_d2 dQ21_d3 dQ21_d4 
    dQ21_e1 dQ21_e2 dQ21_e3 dQ21_e4 
    dQ21_f1 dQ21_f2 dQ21_f3 dQ21_f4 ;

  do i = 1 to dim( q21 );
   
    if q21{i} = -1 then do;
     
      q21{i} = .;
       
    end;
    else do;
   
      sq21{i} = 4 - q21{i};
       
      do j = 1 to 4;
      
        if q21{i} = j then dq21{i,j} = 1;
        else dq21{i,j} = 0;
        
      end;
      
    end;
   
  end;
  
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

  keep caseid weight q21_: sq21_: dq21_:;

run;

options nolabel;

proc means data=VoicesDMVSurvey2017 n sum mean min max;
  var q21_: sq21_: dq21_:;
run;

options label;

/*
proc print data=VoicesDMVSurvey2017;
  var q21_f sq21_f dq21_f: ;
run;
*/


/** Macro qsplit - Start Definition **/

%macro qsplit( q );

  proc summary data=VoicesDMVSurvey2017;
    var sq21_&q dq21_&q: /weight=weight;
    output out=Q21&q (drop=_type_ _freq_)
      n(sq21_&q)=N
      mean(sq21_&q dq21_&q:)=sQ21 dQ21_1-dQ21_4;
  run;

%mend qsplit;

/** End Macro Definition **/

%qsplit( a )
%qsplit( b )
%qsplit( c )
%qsplit( d )
%qsplit( e )
%qsplit( f )

data Q21sum;

  set
    Q21a (in=inA)
    Q21b (in=inB)
    Q21c (in=inC)
    Q21d (in=inD)
    Q21e (in=inE)
    Q21f (in=inF)
  ;
  
  if inA then Question = 'A';
  else if inB then Question = 'B';
  else if inC then Question = 'C';
  else if inD then Question = 'D';
  else if inE then Question = 'E';
  else if inF then Question = 'F';
  
  total_check = sum( of dQ21_1-dQ21_4 );

run;

proc sort data=Q21sum;
  by sQ21;

proc format;
  value $q21g
    'A' = "As a place to raise children"
    'B' = "Availability of goods/services"
    'C' = "Overall quality of public schools"
    'D' = "Availability of good jobs"
    'E' = "Availability of arts/cultural opportunities"
    'F' = "Access to transportation options";
    

proc print data=Q21sum;
  id question;
  format question $q21g.;
run;


** Question 21 **;

ods html body="&_dcdata_default_path\Voices\Prog\Voices_q21.html" style=Default;

proc print data=Q21sum label;
  id question;
  var dQ21_4 dQ21_3 dQ21_2 dQ21_1;
  format question $q21g.;
  label 
    Question = "Q21. How would you rate these aspects of life in the place where you live?"
    dQ21_4 = 'Poor'
    dQ21_3 = 'Fair'
    dQ21_2 = 'Good'
    dQ21_1 = 'Excellent';
run;

ods html close;
