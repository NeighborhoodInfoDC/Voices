/**************************************************************************
 Program:  Voices_nonopen_recode.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  09/11/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Create Voices_2017_nonopen_recode data set with 
 recodes of non-open questions.

 Modifications:
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Voices )

options mprint symbolgen=y;
%let NUM_LEVELS = 5; 

%let revisions = %str(Fix skipped question recode for Q23, Q24, Q31, and Q60.);

%macro dummies;

  /*
  *2: PPHHHEAD Q11 Q12  Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q27 Q28_1 
      Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10 Q31 Q40  Q42 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k 
      Q44_l Q44_m Q44_n Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i Q55 Q57  Q59 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h 
      Q61_i Q61_j Q62 Q77
  *3: PPRENT income age phy_health ment_health Q17 Q25 Q49 Q51 Q53 Q56 Q58 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h
  *4: PPEDUCAT ppagect4 PPREG4 satisf worth happy anxious Q8 Q10 Q18 Q19  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q24 Q26 Q30_a Q30_b Q32_a 
      Q32_b Q33 Q34 Q43 Q47_a Q47_b Q47_c Q48 Q78
  *5: PPHOUSE PPETHM PPHISPAN race geo Q7 Q9 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i Q22 Q29 Q35_a Q35_b Q35_c Q35_d 
      Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l 
      Q46_m Q46_n Q46_o Q46_p Q50 Q52 Q60 
  *6:  ppracem Q23 Q54 Q79 PPMARIT
  *7: DOV_IDEO DOV_URBAN ppagecat PPWORK
  *8:
  *9:
  *10:Q39A  Q39B Q39C Q39D Q41A Q41B (already recoded)
  *13: DOV_REL1
  *14: PPEDUC 
  */

  *3 categories;
  array var3{*} PPRENT income age phy_health ment_health Q17 Q25 Q49 Q51 Q53 Q56 Q58 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h Q63_i;
  %do j=1 %to 3; 
  array new3_&j. {*} PPRENT_&j. income_&j. age_&j. phy_health_&j. ment_health_&j. Q17_&j. Q25_&j. Q49_&j. Q51_&j. Q53_&j. 
                     Q56_&j. Q58_&j. Q63_a_&j. Q63_b_&j. Q63_c_&j. Q63_d_&j. Q63_e_&j. Q63_f_&j. Q63_g_&j. Q63_h_&j. Q63_i_&j ;
  			do k=1 to dim( var3 );
  				  new3_&j.{k}=0; 
  				  if var3{k}=&j. then new3_&j.{k}=1; 
  				  else if var3{k}=.n then new3_&j.{k}=.n;
  				  else if var3{k} in(. -1) then new3_&j.{k}=.;
        end;
  %end; 
  drop k;

  *4 categories;
  array var4{*} PPEDUCAT ppagect4 satisf worth happy anxious Q8 Q10 Q18 Q19  /*Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f*/ 
  Q24 Q26 Q30_a Q30_b Q32_a Q32_b Q33 Q34 Q43 Q47_a Q47_b Q47_c Q48 Q78 ;
  %do j=1 %to 4; 
  array new4_&j. {*} PPEDUCAT_&j. ppagect4_&j. satisf_&j. worth_&j. happy_&j. anxious_&j. Q8_&j. Q10_&j. Q18_&j. 
                     Q19_&j.  /*Q21_a_&j. Q21_b_&j. Q21_c_&j. Q21_d_&j. Q21_e_&j. Q21_f_&j.*/ Q24_&j. Q26_&j. Q30_a_&j. 
                     Q30_b_&j. Q32_a_&j. Q32_b_&j. Q33_&j. Q34_&j. Q43_&j. Q47_a_&j. Q47_b_&j. Q47_c_&j. Q48_&j. Q78_&j. ;
        do k=1 to dim( var4 );
  				  new4_&j.{k}=0; 
  				  if var4{k}=&j. then new4_&j.{k}=1; 
  				  else if var4{k}=.n then new4_&j.{k}=.n;
  				  else if var4{k} in(. -1) then new4_&j.{k}=.;
        end;
  %end; 
  drop k;

  *5 categories;
  array var5{*} Q3_cat Q4_cat Q5_cat PPHOUSE PPETHM PPHISPAN race geo Q7 Q9 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i 
                Q22 Q29 /*Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l*/ Q36 Q46_a Q46_b Q46_c Q46_d 
                Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q50 Q52 Q60 ;
  %do j=1 %to 5; 
  array new5_&j. {*} Q3_cat_&j. Q4_cat_&j. Q5_cat_&j. PPHOUSE_&j. PPETHM_&j. PPHISPAN_&j. race_&j. geo_&j. Q7_&j. Q9_&j. 
                     Q20_a_&j. Q20_b_&j. Q20_c_&j. Q20_d_&j. Q20_e_&j. Q20_f_&j. Q20_g_&j. Q20_h_&j. Q20_i_&j. Q22_&j. Q29_&j. 
                     /*Q35_a_&j. Q35_b_&j. Q35_c_&j. Q35_d_&j. Q35_e_&j. Q35_f_&j. Q35_g_&j. Q35_h_&j. Q35_i_&j. Q35_j_&j. Q35_k_&j. Q35_l_&j.*/ 
                     Q36_&j. Q46_a_&j. Q46_b_&j. Q46_c_&j. Q46_d_&j. Q46_e_&j. Q46_f_&j. Q46_g_&j. Q46_h_&j. Q46_i_&j. Q46_j_&j. Q46_k_&j. 
                     Q46_l_&j. Q46_m_&j. Q46_n_&j. Q46_o_&j. Q46_p_&j. Q50_&j. Q52_&j. Q60_&j. ; 
        do k=1 to dim( var5 );
  				  new5_&j.{k}=0; 
  				  if var5{k}=&j. then new5_&j.{k}=1; 
  				  else if var5{k}=.n then new5_&j.{k}=.n;
  				  else if var5{k} in(. -1) then new5_&j.{k}=.;
        end;
  %end; 
  drop k;

  *6 categories;
  array var6{*} ppracem Q54 Q79 PPMARIT ;
  %do j=1 %to 6; 
  array new6_&j. {*} ppracem_&j. Q54_&j. Q79_&j. PPMARIT_&j. ; 
        do k=1 to dim( var6 );
  				  new6_&j.{k}=0; 
  				  if var6{k}=&j. then new6_&j.{k}=1; 
  				  else if var6{k}=.n then new6_&j.{k}=.n;
  				  else if var6{k} in(. -1) then new6_&j.{k}=.;
        end;
  %end; 
  drop k;

  *7 categories;
  array var7{*} Q6 DOV_IDEO ppagecat PPWORK ;
  %do j=1 %to 7; 
  array new7_&j. {*} Q6_&j. DOV_IDEO_&j. ppagecat_&j. PPWORK_&j. ; 
        do k=1 to dim( var7 );
  				  new7_&j.{k}=0; 
  				  if var7{k}=&j. then new7_&j.{k}=1; 
  				  else if var7{k}=.n then new7_&j.{k}=.n;
  				  else if var7{k} in(. -1) then new7_&j.{k}=.;
        end;
  %end; 
  drop k;

  *8 categories;
  array var8{*} DOV_URBAN ;
  %do j=1 %to 8; 
  array new8_&j. {*} DOV_URBAN_&j. ; 
        do k=1 to dim( var8 );
  				  new8_&j.{k}=0; 
  				  if var8{k}=&j. then new8_&j.{k}=1; 
  				  else if var8{k} in(. -1) then new8_&j.{k}=.;
        end;
  %end; 
  drop k;

  *13 categories;
  array var13{*} DOV_REL1 ;
  %do j=1 %to 13; 
  array new13_&j. {*} DOV_REL1_&j. ; 
        do k=1 to dim( var13 );
  				  new13_&j.{k}=0; 
  				  if var13{k}=&j. then new13_&j.{k}=1; 
  				  else if var13{k} in(. -1) then new13_&j.{k}=.;
        end;
  %end; 
  drop k;

  *14 categories;
  array var14{*} PPEDUC ;
  %do j=1 %to 14; 
  array new14_&j. {*} PPEDUC_&j. ; 
        do k=1 to dim( var14 );
  				  new14_&j.{k}=0; 
  				  if var14{k}=&j. then new14_&j.{k}=1; 
  				  else if var14{k} in(. -1) then new14_&j.{k}=.;
        end;
  %end; 
  drop k;

%mend dummies; 

/*Import CSV recode file for other responses and save as SAS file*/
proc import datafile= 'L:\Libraries\Voices\Data\Voices_other_response_recodes.csv' replace
out = Voices_other_response_recodes
dbms = CSV;
guessingrows = MAX;
run;

/*sort data proir to merging*/
Proc sort data=Voices_other_response_recodes out=Voices_other_response_recodes_1;
	By caseid;
run; 

Proc sort data=Voices.VoicesDMVSurvey2017 (drop=q1 q1_refused q2 q2_refused q15_: q16_:) out=Voices_2017_nonopen_recode_0;
	By caseid;
run; 

/*Merge open ended other recode*/
data Voices_2017_nonopen_recode_1;
	merge 
	  Voices_2017_nonopen_recode_0 
	  Voices_other_response_recodes;
	by caseid;
	
    informat _all_ ;

	/*Label added variables*/
   label Q28_11 = "n. Military or job transfer/relocation";
   label Q63_i = "Respondent's age";
	
    format caseid ;
   format     Q20_a Q20_A.;
   format     Q20_b Q20_B.;
   format     Q20_c Q20_C.;
   format     Q20_d Q20_D.;
   format     Q20_e Q20_E.;
   format     Q20_f Q20_F.;
   format     Q20_g Q20_G.;
   format     Q20_h Q20_H.;
   format     Q20_i Q20_I.;
   format     Q23_1 Q23_1F.;
   format     Q23_2 Q23_2F.;
   format     Q23_3 Q23_3F.;
   format     Q23_4 Q23_4F.;
   format     Q23_5 Q23_5F.;
   format     Q23_6 Q23_6F.;
   format Q23_Refused Q23_REFUSED.;
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
   format    Q28_11 Q28_10F.;
   format Q28_Refused Q28_REFUSED.;
   format     Q63_a Q63_A.;
   format     Q63_b Q63_B.;
   format     Q63_c Q63_C.;
   format     Q63_d Q63_D.;
   format     Q63_e Q63_E.;
   format     Q63_f Q63_F.;
   format     Q63_g Q63_G.;
   format     Q63_h Q63_H.;
   format     Q63_i Q63_H.;
   format       Q79 Q79F.;

run;


data Voices_2017_nonopen_recode_4 ;

  set Voices_2017_nonopen_recode_1;
  
  %Make_break_vars_2017()

  ** Assign special missing value .N to non-applicable (skipped) question responses **;

  if q22 not in ( 1 ) then do;
    array q23{*} q23_1-q23_6;
    do i = 1 to dim( q23 );
      q23{i} = .n;
    end;
  end;
  
  if q22 not in ( 2, 3, 4, 5 ) then q24 = .n;
  
  if q25 not in ( 1, 2 ) then q26 = .n;

  if q27 not in ( 1 ) then do;
    array q28{*} q28_1-q28_11;
    do i = 1 to dim( q28 );
      q28{i} = .n;
    end;
    q29 = .n;
  end;
  
  if dov_urban not in ( 2, 3, 4, 5 ) then q31 = .n;

  if q31 not in ( 1 ) then do;
    q32_a = .n;
    q32_b = .n;
  end;

  if q42 not in ( 1 ) then do;

    q43 = .n;
    
    array q44_45{*} q44_a--q44_n q45_a--q45_i;
    
    do i = 1 to dim( q44_45 );
      q44_45{i} = .n;
    end;
    
  end;

  if q55 not in ( 1 ) then q56 = .n;

  if q57 not in ( 1 ) then q58 = .n;

  if q59 not in ( 1 ) then do;
  
    q60 = .n;

    array q61{*} q61_a--q61_j;
    
    do i = 1 to dim( q61 );
      q61{i} = .n;
    end;
    
  end;

  if q59 not in ( 2 ) then q62 = .n;

  if q62 not in ( 1 ) then do;

    array q63{*} q63_a--q63_h;
    
    do i = 1 to dim( q63 );
      q63{i} = .n;
    end;
    
  end;

  if q77 not in ( 2 ) then q78 = .n;

  ** Activity count vars (Q13 & Q14) **;

  Q13_count =0;
   array q13{8} Q13_1-Q13_8;
 	do j=1 to 8;
    	if q13{j}=1 then Q13_count=Q13_count+1; 
     end;
  IF (Q13_1=-1) and (Q13_2=-1) and (Q13_3=-1) and (Q13_4=-1) and (Q13_5=-1) and (Q13_6=-1) and (Q13_7=-1) and (Q13_8=-1) THEN Q13_count = .;


  Q14_count =0;
     array q14{10} Q14_1-Q14_10;
  do j=1 to 10;
    if q14{j}=1 then Q14_count=Q14_count+1; 
    end;
  IF (Q14_1=-1) and (Q14_2=-1) and (Q14_3=-1) and (Q14_4=-1) and (Q14_5=-1) and (Q14_6=-1) and (Q14_7=-1) and (Q14_8=-1) and (Q14_9=-1) and (Q14_10=-1) THEN Q14_count = .;
drop j;

  label
    Q13_count = "Count of civic engagement activities(0-8)"
    Q14_count = "Count of civic org memberships (0-10)";

  phy_health =.;
  IF (Q37=0) THEN phy_health = 1;
  IF (1 < Q37 <= 13) THEN phy_health = 2;
  IF (14 < Q37 <= 30) THEN phy_health = 3;
  format phy_health phy_health.;

  ment_health =.;
  IF (Q38=0) THEN ment_health = 1;
  IF (1 < Q38 <= 13) THEN ment_health = 2;
  IF (14 < Q38 <= 30) THEN ment_health = 3;
  format ment_health ment_health.;

  label
    phy_health = "Count of days in last 30 days when physical health not good"
    ment_health = "Count of days in last 30 days when mental health was not good";

  satisf =.;
  IF (0 <= Q39A <= 4) THEN satisf = 1;
  IF (Q39A=5) or (Q39A=6) THEN satisf = 2;
  IF (Q39A=7) or (Q39A=8) THEN satisf = 3;
  IF (Q39A=9) or (Q39A=10) THEN satisf = 4;

  worth =.;
  IF (0 <= Q39B <= 4) THEN worth = 1;
  IF (Q39B=5) or (Q39B=6) THEN worth = 2;
  IF (Q39B=7) or (Q39B=8) THEN worth = 3;
  IF (Q39B=9) or (Q39B=10) THEN worth = 4;

  happy =.;
  IF (0 <= Q39C <= 4) THEN happy = 1;
  IF (Q39C=5) or (Q39C=6) THEN happy = 2;
  IF (Q39C=7) or (Q39C=8) THEN happy = 3;
  IF (Q39C=9) or (Q39C=10) THEN happy = 4;

  anxious =.;
  IF (Q39D=0) or (Q39D=1) THEN anxious = 1;
  IF (Q39D=2) or (Q39D=3) THEN anxious = 2;
  IF (Q39D=4) or (Q39D=5) THEN anxious = 3;
  IF (Q39D=6) or (Q39D=7) or (Q39D=8) or (Q39D=9) or (Q39D=10) THEN anxious = 4;

format anxious anxious. happy happy. worth worth. satisf satisf.;

  label
    satisf = "Overall, how satisfied are you with your life nowadays?"
    worth = "...do you feel the things you do in your life are worthwhile?"
	happy = "Overall, how happy did you feel yesterday?"
	anxious = "Overall, how anxious did you feel yesterday?";

  thriving =.;
  IF (Q41A~=.) and (Q41B~=.) THEN thriving = 0;
  IF (Q41A>=7) and (Q41B>=8) THEN thriving = 1;
 
  suffering =.;
  IF (Q41A~=.) and (Q41B~=.) THEN suffering = 0;
  IF (Q41A<=4) and (Q41B<=4) THEN suffering = 1;

  struggling =.;
  IF (Q41A~=.) and (Q41B~=.) THEN struggling = 0;
  IF (thriving=0) and (suffering=0) THEN struggling = 1;

  label 
    thriving = "Respondent is thriving (self evaluation)"
    suffering = "Respondent is suffering (self evaluation)" 
	struggling = "Respondent is struggling (self evaluation)";

** six income categories for demographic profile**;
  income_six =.; 
  IF (1 <= PPINCIMP <= 7) THEN income_six = 1;
  IF (8 <= PPINCIMP <= 11) THEN income_six = 2;
  IF (PPINCIMP =12) or (PPINCIMP =13) THEN income_six = 3;
  IF (PPINCIMP =14) or (PPINCIMP =15)   THEN income_six = 4;
  IF (PPINCIMP =16) or (PPINCIMP =17)   THEN income_six = 5;
  IF (18 <= PPINCIMP <= 21)  THEN income_six = 6;

  label 
    income_six = "Respondent household income recode(6 category)";

  ** Recode questions 3, 4, 5 **;

  array a3{*} q3_: q4_: q5_:;

  do i = 1 to dim( a3 );
    if a3{i} = -1 then a3{i} = .r;
  end;
  drop i;

  Q3_Years_months_recode = Q3_years + ( Q3_months / 12 );
  Q4_Years_months_recode = Q4_years + ( Q5_months / 12 );
  Q5_Years_months_recode = Q5_years + ( Q5_months / 12 );

  label
    Q3_Years_months_recode = 'How long have you lived in the Washington area? (years, recode)'
    Q4_Years_months_recode = 'How long have you lived in [city/county]? (years, recode)'
    Q5_Years_months_recode = 'How long have you lived in your current home? (years, recode)';

 Q3_cat =.;
  IF (0 <= Q3_Years_months_recode <= 5) THEN Q3_cat = 1;
  IF (5 < Q3_Years_months_recode <= 10) THEN Q3_cat = 2;
  IF (10 < Q3_Years_months_recode <= 20) THEN Q3_cat = 3;
  IF (20 < Q3_Years_months_recode <= 40) THEN Q3_cat = 4;
  IF (Q3_Years_months_recode > 40) THEN Q3_cat = 5;
  format Q3_cat Q3_cat.;

  Q4_cat =.;
  IF (0 <= Q4_Years_months_recode <= 5) THEN Q4_cat = 1;
  IF (5 < Q4_Years_months_recode <= 10) THEN Q4_cat = 2;
  IF (10 < Q4_Years_months_recode <= 20) THEN Q4_cat = 3;
  IF (20 < Q4_Years_months_recode <= 40) THEN Q4_cat = 4;
  IF (Q4_Years_months_recode > 40) THEN Q4_cat = 5;
  format Q4_cat Q4_cat.;
 
  Q5_cat =.;
  IF (0 <= Q5_Years_months_recode <= 1) THEN Q5_cat = 1;
  IF (1 < Q5_Years_months_recode <= 2) THEN Q5_cat = 2;
  IF (2 < Q5_Years_months_recode <= 5) THEN Q5_cat = 3;
  IF (5 < Q5_Years_months_recode <= 10) THEN Q5_cat = 4;
  IF (Q5_Years_months_recode > 10) THEN Q5_cat = 5;
  format Q5_cat Q5_cat.;
 
  label
    Q3_cat = "Category: How long (years) have you lived in the Washington area?"
    Q4_cat = "Category: How long (years) have you lived in [county/place]?"
	Q5_cat = "Category: How long (years) have you lived in your current home?";

  ** Recode questions with 1,2,-1 response codes **;

  array v12{*} Q11 Q12  Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 
               Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q27 Q31 Q40  Q42 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f 
               Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f 
               Q45_g Q45_h Q45_i Q55 Q57  Q59 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i 
               Q61_j Q62 Q77;

  do i = 1 to dim( v12 );
  
    select ( v12{i} );
      when ( .n ) v12{i} = .n;
      when ( 1 ) v12{i} = 1;
      when ( 2 ) v12{i} = 0;
      when ( -1 ) v12{i} = .;
	  otherwise;
    end;
    
  end;
  
  format Q11 Q12  Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 
               Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q27 Q31 Q40  Q42 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f 
               Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f 
               Q45_g Q45_h Q45_i Q55 Q57  Q59 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i 
               Q61_j Q62 Q77
    dyesno.;

  drop i;

**Peter's recodes;
  array Q35{*} Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l;
  array sQ35{*} sQ35_a sQ35_b sQ35_c sQ35_d sQ35_e sQ35_f sQ35_g sQ35_h sQ35_i sQ35_j sQ35_k sQ35_l;
  array dQ35{12,&NUM_LEVELS} 
    dQ35_a1 dQ35_a2 dQ35_a3 dQ35_a4 dQ35_a5 
    dQ35_b1 dQ35_b2 dQ35_b3 dQ35_b4 dQ35_b5
    dQ35_c1 dQ35_c2 dQ35_c3 dQ35_c4 dQ35_c5
    dQ35_d1 dQ35_d2 dQ35_d3 dQ35_d4 dQ35_d5
    dQ35_e1 dQ35_e2 dQ35_e3 dQ35_e4 dQ35_e5
    dQ35_f1 dQ35_f2 dQ35_f3 dQ35_f4 dQ35_f5
    dQ35_g1 dQ35_g2 dQ35_g3 dQ35_g4 dQ35_g5
    dQ35_h1 dQ35_h2 dQ35_h3 dQ35_h4 dQ35_h5
    dQ35_i1 dQ35_i2 dQ35_i3 dQ35_i4 dQ35_i5
    dQ35_j1 dQ35_j2 dQ35_j3 dQ35_j4 dQ35_j5
    dQ35_k1 dQ35_k2 dQ35_k3 dQ35_k4 dQ35_k5
    dQ35_l1 dQ35_l2 dQ35_l3 dQ35_l4 dQ35_l5
    ;

  do i = 1 to dim( Q35 );
   
    if Q35{i} = -1 then do;
     
      Q35{i} = .;
       
    end;
    else do;
   
      sQ35{i} = &NUM_LEVELS - Q35{i};
       
      do j = 1 to &NUM_LEVELS;
      
        if Q35{i} = j then dQ35{i,j} = 1;
        else dQ35{i,j} = 0;
        
      end;
      
    end;   
  end;

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

/*drop the sQ35_: estimation values*/
drop sQ35_:;
  *keep caseid weight Q35_: sQ35_: dQ35_:;

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
   format     Q21_a Q21_A.;
   format     Q21_b Q21_B.;
   format     Q21_c Q21_C.;
   format     Q21_d Q21_D.;
   format     Q21_e Q21_E.;
   format     Q21_f Q21_F.;

/*drop the sQ21_: estimation values*/
drop sQ21_:;

  *keep caseid weight q21_: sq21_: dq21_:;

/*recode 2 response to 0,1. Q28_X already recoded

array a{*} Q11 Q12  Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 
           Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q27 Q31 Q40  Q42 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f 
           Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f 
           Q45_g Q45_h Q45_i Q55 Q57  Q59 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i 
           Q61_j Q62 Q77;           
  do i = 1 to dim( a );
   if a{i} = -1 then a{i} = .r;
   else if a{i} = 1 then a{i} = 0;
   else if a{i} = 2 then a{i} = 2; 
end; 

run;
*/

run;


data Voices_2017_nonopen_recode;
set Voices_2017_nonopen_recode_4;

%dummies; 

%Labels_var_2017()

drop Q14_Text Q23_Text Q23_Refused Q28_Refused Q28_Text Q20_Text Q44_Text Q45_Text Q61_Text Q63_Text Q79_Text; 
run;


** Compare changes in current and new version of data set **;

proc compare base=Voices.Voices_2017_nonopen_recode compare=Voices_2017_nonopen_recode listall maxprint=(40,32000);
  id caseid;
run;


%Finalize_data_set( 
  data=Voices_2017_nonopen_recode,
  out=Voices_2017_nonopen_recode,
  outlib=Voices,
  label="VoicesDMV 2017 survey, non-open questions, recode",
  sortby=caseid,
  revisions=&revisions,
  restrictions=Confidential,
  printobs=0,
  freqvars=Geo Race Educ Income Age Gender Homeown 
  q22 q23_1-q23_6 q24 q24_1-q24_4 q25 q26 q27 q28_1-q28_11 q29 dov_urban q31 q32_a q32_b q42 q43 q44_a--q44_n q45_a--q45_i q55 q56 q57 q58 
  q59 q60 q60_1-q60_5 q61_a--q61_j q62 q63_a--q63_h q63_i q77 q78
)


