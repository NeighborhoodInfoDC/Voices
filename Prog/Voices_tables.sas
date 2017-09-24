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

** Macros for table creation **;

/** Macro Make_one_table - Start Definition **/

%macro Make_one_table( fmt=npercent., col=, var=, text=, data=Voices_means_se, typefmt=$coltype_pct. );

  title2 height=9pt " ";
  title3 height=9pt &text;

  proc tabulate data=&data format=&fmt noseps missing order=data;
    class &col;
    class type / preloadfmt;
    var &var;
    table 
      /** Rows **/
      &var,
      /** Columns **/
      &col=' ' * sum=' ' * type=' '
    ;
    format type &typefmt;
  run;
  
  title2;

%mend Make_one_table;

/** End Macro Definition **/


/** Macro Make_all_tables - Start Definition **/

%macro Make_all_tables( col=, title= );

  ** List all of the variables to be used in the tables here **;

  %let full_var_list = 
    Q3_Years_months_recode Q4_Years_months_recode Q5_Years_months_recode Q3_cat_: Q4_cat_: Q5_cat_:
    Q6_: Q7_: Q8_: Q9_: Q10_: Q11 Q12 Q13_: Q14_: Q17_: Q18_: Q19_: Q20_:  dQ21_: Q22_: Q23_: Q24_: 
	Q25_: Q26_: Q27 Q28_: Q29_: Q30_: Q31 Q32_: Q33_: Q34_: dQ35_: Q36_: phy_health_: ment_health_: 
	satisf_: worth_: happy_: anxious_: Q39a Q39b Q39c Q39d Q40 Q41a Q41b thriving suffering struggling Q42 Q43_: Q44_: 
	Q45_: Q46_: Q47_: Q48_: Q49_: Q50_: Q51_: Q52_: Q53_: Q54_: Q55 Q56_: Q57 Q58_: Q59 Q60_: Q61_: 
	Q62 Q63_: Q77 Q78_: Q79_: DOV_REL1_: DOV_REL1_: PPEDUC_: DOV_IDEO_: DOV_URBAN_: ppagecat_: PPWORK_: 
	PPRENT_: PPEDUCAT_: ppagect4_: PPHOUSE_: PPETHM_: PPHISPAN_: ppracem_: PPMARIT_: DOV_IDEO_: 
	ppagecat_: PPWORK_: race_:  
  ;

  proc summary data=Voices.Voices_2017_nonopen_recode nway;
    class &col;
    var &full_var_list;
    weight weight;
    output out=Voices_means (drop=_type_ _freq_) mean=;
  run;

  proc summary data=Voices.Voices_2017_nonopen_recode nway;
    class &col;
    var &full_var_list;
    output out=Voices_se (drop=_type_ _freq_) stderr=;
  run;

  data Voices_se_deff;

    merge Voices_se deff_&col;
    by &col;
    
    array a{*} &full_var_list;
    
    do i = 1 to dim( a );
      a{i} = a{i} * deff*(1.645); *changed to 90% confidence interval;
    end;
    
    drop i;
    
  run;

  data Voices_means_se;

    set Voices_means (in=mean) Voices_se_deff;
    by &col;
    
    if mean then type = 'Mean';
    else type = 'CI'; *changed from SE;
    
  run;

  %fdate()

  options orientation=landscape;
  options nodate nonumber;

  ods rtf file="&_dcdata_default_path\Voices\Prog\Voices_tables_&col..rtf" style=Styles.Voices_style_rtf
      bodytitle toc_data;
      
  ods listing close;
  
  title1 "VoicesDMV Survey: &title";

  footnote1 height=9pt "Prepared by NeighborhoodInfo DC (www.NeighborhoodInfoDC.org), &fdate..";

  %Make_one_table( 
    col=&col, 
    fmt=comma10.1,
    typefmt=$coltype_mean.,
    var=Q3_Years_months_recode Q4_Years_months_recode Q5_Years_months_recode, 
    text="Q3-Q5. How long have you lived in..." 
  )

  %Make_one_table( 
    col=&col, 
    var=Q3_cat_:, 
    text="Q3. How long have you lived in the Washington area?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q4_cat_:, 
    text="Q4. How long have you lived in [city/county]?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q5_cat_:, 
    text="Q5. How long have you lived in your current home?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q6_:, 
    text="Q6. How often do you talk to or visit with your immediate neighbors?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q7_:, 
    text="Q7. In the place that you live, how much do you feel like you fit in?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q8_:, 
    text="Q8. How would you rate the Washington area in general as a place to live?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q9_:, 
    text="Q9. How likely are you to recommend [City/County]to a friend or co-worker as a place to live?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q10_:, 
    text="Q10. If you had the choice of where to live, would you rather…" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q11, 
    text="Q11. In the next 12 months, are you likely to move away from the area where you live?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q12, 
    text="Q12. Are you registered to vote?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q13_1-Q13_8, 
    text="Q13. Have you, yourself, done any of the following in the last 12 months?" 
  )

  %Make_one_table( 
    col=&col, 
	fmt=comma10.1,
    typefmt=$coltype_mean.,
    var=Q13_count,
    text="Q13. Count: Have you, yourself, done any of the following in the last 12 months?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q14_1-Q14_10, 
    text="Q14. Could you tell me whether you are a member of each type?" 
  )
 
  %Make_one_table( 
    col=&col, 
	fmt=comma10.1,
    typefmt=$coltype_mean.,
    var=Q14_count,
    text="Q14. Count: Could you tell me whether you are a member of each type?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q17_:, 
    text="Q17. ...do you think living conditions in the Washington area will be better than they are today, worse, or about the same as today?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q18_:, 
    text="Q18. ...Would you say: very safe, somewhat safe, not very safe, or not safe at all?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q19_:, 
    text="Q19. How safe do you feel the place where you live is for children?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q20_a_: Q20_b_: Q20_c_: Q20_d_: Q20_e_: Q20_f_: Q20_g_: Q20_h_: Q20_i_: , 
    text="Q20. In the past year, how often have you had trouble getting to where you need to go because:" 
  )

  %Make_one_table( 
    col=&col, 
    var=dQ21:, 
    text="Q21. How would you rate these aspects of life in the place where you live?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q22_:, 
    text="Q22. How often do you use services provided by nongovernmental, nonprofit organizations?" 
  )

**check table**;
  %Make_one_table( 
    col=&col, 
    var=Q23_:, 
    text="Q23. Why do you never use services provided by nongovernmental, nonprofit organizations?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q24_:, 
    text="Q24. How satisfied are you that the services you receive from nongovernmental, nonprofit organizations meet your needs?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q25_:, 
    text="Q25. When you think about the place where you live now, do you think that it is changing a lot, changing  a little, or not changing much at all? " 
  )

  %Make_one_table( 
    col=&col, 
    var=Q26_:, 
    text="Q26. ...those changes mostly benefit you or people like you, mostly benefit people different than you, generally benefit everyone, or generally benefit no one?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q27, 
    text="Q27. ...move from the place where they lived in [City/County] to somewhere else for a reason other than their own choice?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q28_:, 
    text="Q28. For what reason(s) did this person have to move?..." 
  )

  %Make_one_table( 
    col=&col, 
    var=Q29_:, 
    text="Q29. Do you know where this person moved to?..." 
  )

  %Make_one_table( 
    col=&col, 
    var=Q30_a_1-Q30_a_4 Q30_b_1-Q30_b_4, 
    text="Q30. How would you rate the following in [City/County]?..." 
  )

  %Make_one_table( 
    col=&col, 
    var=Q31, 
    text="Q31. Do you live in a place that has elected city officials, in addition to county officials?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q32_a_1-Q32_a_4 Q32_b_1-Q32_b_4, 
    text="Q32. How would you rate the following in the city where you live?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q33_:, 
    text="Q33. How would you describe your ability to influence local-government decision-making?..." 
  )

  %Make_one_table( 
    col=&col, 
    var=Q34_:, 
    text="Q34. How much trust and confidence do you have in the local government in the place where you live when it comes to handling local problems?" 
  )

  %Make_one_table( 
    col=&col, 
    var=dQ35: , 
    text="Q35. ...priority do you think each of the following should be for the local government in the place where you live?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q36_:, 
    text="Q36. How would you rate your overall health?" 
  )

  %Make_one_table( 
    col=&col, 
    var=phy_health_:, 
    text="Q37. ...for how many days during the past 30 days was your physical health not good?" 
  )

  %Make_one_table( 
    col=&col, 
    var=ment_health_:, 
    text="Q38. ...for how many days during the past 30 days was your mental health not good?" 
  )

  %Make_one_table( 
    col=&col, 
    var=satisf_:, 
    text="Q39A. Overall, how satisfied are you with your life nowadays?" 
  )

  %Make_one_table( 
    col=&col, 
    var=worth_:, 
    text="Q39B. Overall, to what extent do you feel the things you do in your life are worthwhile?" 
  )

  %Make_one_table( 
    col=&col, 
    var=happy_:, 
    text="Q39C. Overall, how happy did you feel yesterday?" 
  )

  %Make_one_table( 
    col=&col, 
    var=anxious_:, 
    text="Q39D. Overall, how anxious did you feel yesterday?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q40, 
    text="Q40. Do you have relatives or friends who you can count on to help you when you need them?" 
  )

  %Make_one_table( 
    col=&col, 
    var=thriving suffering struggling, 
    text="Q41. On which step of the ladder would you say you personally feel you stand at this time/five years from now?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q42, 
    text="Q42. In the past year, have you ever felt discriminated against while in the Washington area?" 
  )
**look into this**;
  %Make_one_table( 
    col=&col, 
    var=Q43_:, 
    text="Q43. In the past year, how often have you felt discriminated against?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q44_:, 
    text="Q44. For what reasons did you feel discriminated against?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q45_:, 
    text="Q45. In which systems or situations did you experience discrimination?" 
  )

  **look into**;
  %Make_one_table( 
    col=&col, 
    var=Q46_a_1-Q46_a_5 Q46_b_1-Q46_b_5 Q46_c_1-Q46_c_5 Q46_d_1-Q46_d_5 Q46_e_1-Q46_e_5 Q46_f_1-Q46_f_5 Q46_g_1-Q46_g_5 Q46_h_1-Q46_h_5 Q46_i_1-Q46_i_5 Q46_j_1-Q46_j_5 Q46_k_1-Q46_k_5  Q46_l_1-Q46_l_5  Q46_m_1-Q46_m_5  Q46_n_1-Q46_n_5  Q46_o_1-Q46_o_5  Q46_p_1-Q46_p_5, 
    text="Q46. How good is the place where you live for different groups of people?" 
  )

  **look into**;
  %Make_one_table( 
    col=&col, 
    var=Q47_a_: Q47_b_: Q47_c_:, 
    text="Q47. How would you rate the relations among different racial or ethnic groups..." 
  )

  %Make_one_table( 
    col=&col, 
    var=Q48_:, 
    text="Q48. How much is your daily life affected by the fear that you or a loved one would be arrested or questioned by the police?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q49_:, 
    text="Q49. Do you think the police in your community treat people of color less favorably, more favorably, or equally to white people?" 
  )

  **look into**;
  %Make_one_table( 
    col=&col, 
    var=Q50_:, 
    text="Q50. How would you rate the economic conditions in the Washington area today?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q51_:, 
    text="Q51. Do you think the economic conditions in the Washington area are getting better, getting worse, or staying about the same?" 
  )

    **look into**;
  %Make_one_table( 
    col=&col, 
    var=Q52_:, 
    text="Q52. How well would you say you are managing financially these days? Would you say you are…" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q53_:, 
    text="Q53. Think of your parents when they were your age. Would you say you are better off financially than they were?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q54_:, 
    text="Q54. If you lost all your current sources of household income... about how long do you think you could continue to live as you live today? " 
  )

  %Make_one_table( 
    col=&col, 
    var=Q55, 
    text="Q55. Have there been times in the past 12 months when you did not have enough money to buy food that you or your family needed?" 
  )

    **look into**;
  %Make_one_table( 
    col=&col, 
    var=Q56_:, 
    text="Q56. How often in the past 12 months did you not have enough money to buy food that you or your family needed?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q57, 
    text="Q57. ...did not have enough money to pay the rent, mortgage, or utilities for housing for you or your family?" 
  )
    **look into**;
  %Make_one_table( 
    col=&col, 
    var=Q58_:, 
    text="Q58. ...did you not have enough money to pay the rent, mortgage, or utilities for housing for you or your family?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q59, 
    text="Q59. Are you currently working at a paid job?" 
  )
    **look into**;
  %Make_one_table( 
    col=&col, 
    var=Q60_:, 
    text="Q60. How strongly do you agree that your current job or jobs provide you with the income needed to support you and your family?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q61_:, 
    text="Q61. Does your current job(s) offer any of the following benefits?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q62, 
    text="Q62. Are you currently looking for work or do you want to find a job?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q63_a_: Q63_b_: Q63_c_: Q63_d_: Q63_e_: Q63_f_: Q63_g_: Q63_h_:, 
    text="Q63. How important for you are the following as barriers in finding or keeping a good job?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q77, 
    text="Q77. Were you born in the United States?" 
  )
    **look into**;
  %Make_one_table( 
    col=&col, 
    var=Q78_:, 
    text="Q78. [citizenship status] Are you...?" 
  )

  %Make_one_table( 
    col=&col, 
    var=Q79_:, 
    text="Q79. How would you describe your sexual orientation?" 
  )

  %Make_one_table( 
    col=&col, 
    var=DOV_REL1_:, 
    text="Q80. What is your religion?" 
  )

  %Make_one_table( 
    col=&col, 
    var=DOV_IDEO_:, 
    text="Q81. In general, do you think of yourself as…" 
  )

  **add each var**;

  ods rtf close;
  ods listing;
  
  title1;
  footnote1;

%mend Make_all_tables;

/** End Macro Definition **/


** Column type format **;

proc format;
  value $coltype_mean (notsorted)
    'Mean' = '\qr Mean'
    'CI' = '\qr +/-';
  value $coltype_pct (notsorted)
    'Mean' = '\qr Pct.'
    'CI' = '\qr +/-';
  picture npercent (round)
    low-high = '0000009.9' (mult=1000);
  value region
    1 = 'Washington\~Area';
run;


** Create data sets with design effect corrections **;

%Create_deff_2017( var=region )
%Create_deff_2017( var=geo )
%Create_deff_2017( var=race )
%Create_deff_2017( var=educ )
%Create_deff_2017( var=income )
%Create_deff_2017( var=age )
%Create_deff_2017( var=gender )
%Create_deff_2017( var=homeown )


** Create tables **;

%Make_all_tables( col=region, title=Tables for Entire Region )
%Make_all_tables( col=geo, title=Tables by Jurisdiction )
%Make_all_tables( col=race, title=Tables by Race )
%Make_all_tables( col=educ, title=Tables by Education )
%Make_all_tables( col=income, title=Tables by Income )
%Make_all_tables( col=age, title=Tables by Age )
%Make_all_tables( col=gender, title=Tables by Gender )
%Make_all_tables( col=homeown, title=Tables by Homeownership Status )

