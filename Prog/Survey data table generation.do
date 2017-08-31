/* *****************************************************************************
* 
* PROGRAM WRITTEN AND EXECUTED BY CARL HEDMAN, 8/2017

* *****************************************************************************/

clear
set more off

global data "L:\Libraries\Voices\Raw\UrbanInstitute_VoicesDMVSurvey2017_Client_08292017\"
global tables "L:\Libraries\Voices\Tables\"
**global varlist Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPMSACAT PPREG4 ppreg9 PPRENT PPSTATEN PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK

** Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q14_Text Q15_Text1 Q15_Text2 Q15_Text3 Q15_Text1_Refused Q15_Text2_Refused Q15_Text3_Refused Q16_Text1 Q16_Text2 Q16_Text3 Q16_Text1_Refused Q16_Text2_Refused Q16_Text3_Refused Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i Q20_Text Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6 Q23_Refused Q23_Text Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10 Q28_Refused Q28_Text Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n Q44_Text Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i Q45_Text Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j Q61_Text Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h Q63_Text Q77 Q78 Q79 Q79_Text student DeviceType QZIP DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPMSACAT PPREG4 ppreg9 PPRENT PPSTATEN PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK
** no text entry: Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPMSACAT PPREG4 ppreg9 PPRENT PPSTATEN PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK

use "${data}UrbanInstitue_VoicesDMVSurvey2017_Client_STATA.dta", clear

**race
gen race = "N.H. white" if PPETHM ==1
replace race = "N.H. black" if PPETHM ==2
replace race = "N.H. other" if PPETHM ==3 | PPETHM ==5
replace race = "N.H. Asian or P.I." if ppracem == 4 | ppracem== 5
replace race = "Hispanic" if PPETHM ==4

**Education
gen educ = "Less than Bachelor's" if PPEDUCAT ==1 | PPEDUCAT ==2 | PPEDUCAT ==3
replace educ = "Bachelor's or higher" if PPEDUCAT ==4

**Income - AMI - is $110K  = $0-50, 50-100, 100+
gen income = "$0 - $50K" if PPINCIMP ==1 | PPINCIMP ==2 | PPINCIMP ==3 | PPINCIMP ==4 | PPINCIMP ==5 | PPINCIMP ==6 | PPINCIMP ==7 | PPINCIMP ==8 | PPINCIMP ==9 | PPINCIMP ==10 | PPINCIMP ==11
replace income = "$50 - $100K" if PPINCIMP ==12 | PPINCIMP ==13 | PPINCIMP ==14 | PPINCIMP ==15
replace income = "$100K+" if PPINCIMP ==16 | PPINCIMP ==17 | PPINCIMP ==18 | PPINCIMP ==19 | PPINCIMP ==20 | PPINCIMP ==21

**Age
gen age = "18-34" if PPAGE >=18 & PPAGE <=34
replace age = "35-64" if PPAGE >=35 & PPAGE <=64
replace age = "65+" if PPAGE >=65

**Homeowner
gen homeown = "Homeowner" if PPRENT ==1
replace homeown = "Not homeowner" if PPRENT ==2 | PPRENT ==3

**Geography (alt)
gen geo = "Washington DC" if dov_urban ==1
replace geo = "Prince George's County" if dov_urban ==2
replace geo = "Montgomery County" if dov_urban ==3
replace geo = "Fairfax County" if dov_urban ==4 
replace geo = "Northern VA" if dov_urban ==5 | dov_urban ==6 | dov_urban ==7 |dov_urban ==8

**Geography (alt)
gen geo2 = "Washington DC" if dov_urban ==1
replace geo2 = "Prince George's County" if dov_urban ==2
replace geo2 = "Montgomery County" if dov_urban ==3
replace geo2 = "Fairfax County" if dov_urban ==4 | dov_urban ==7 |dov_urban ==8
replace geo2 = "Northern VA" if dov_urban ==5 | dov_urban ==6

**change refused to missing
foreach x in Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPMSACAT PPREG4 ppreg9 PPRENT PPSTATEN PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK{
replace `x' = . if `x' ==-1
}

svyset [pw=weight]

save "${data}UrbanInstitue_VoicesDMVSurvey2017_Client_STATA_Formatted.dta", replace
set more off

**Create tables
**All
tabout Q6 using "${tables}tables all.xls", replace  c(col  se) svy percent pop npos(row) f(3p)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPRENT PPSTATEN PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK {
tabout `x' using "${tables}tables all.xls", append  c(col  se) svy percent pop npos(row) f(3p)
}
**County totals
tabout Q6 geo using "${tables}tables geographies.xls", replace  c(col  se) svy percent pop npos(row) f(3p)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPRENT PPSTATEN PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK {
tabout `x' geo using "${tables}tables geographies.xls", append  c(col  se) svy percent pop npos(row) f(3p)
}

**Gender
tabout Q6 PPGENDER [aw=weight] using "${tables}tables gender.xls", replace  c(col ) npos(row)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHO {
tabout `x' PPGENDER [aw=weight] using "${tables}tables gender.xls", append  c(col ) npos(row)
}

**Race
tabout Q6 race [aw=weight] using "${tables}tables race.xls", replace  c(col ) npos(row)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHO {
tabout `x' race [aw=weight] using "${tables}tables race.xls", append  c(col ) npos(row)
}

**Education
tabout Q6 educ [aw=weight] using "${tables}tables education.xls", replace  c(col ) npos(row)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHO {
tabout `x' educ [aw=weight] using "${tables}tables education.xls", append  c(col ) npos(row)
}
**Income
tabout Q6 income [aw=weight] using "${tables}tables income.xls", replace  c(col ) npos(row)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHO {
tabout `x' income [aw=weight] using "${tables}tables income.xls", append  c(col ) npos(row)
}
**Age
tabout Q6 age [aw=weight] using "${tables}tables age.xls", replace  c(col ) npos(row)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHO {
tabout `x' age [aw=weight] using "${tables}tables age.xls", append  c(col ) npos(row)
}
**Homeowner
tabout Q6 homeown [aw=weight] using "${tables}tables homeowner.xls", replace  c(col ) npos(row)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHO {
tabout `x' homeown [aw=weight] using "${tables}tables homeowner.xls", append  c(col ) npos(row)
}


**tab at the individual geography
foreach y in /*"Washington DC"*/ "Prince George's County" "Montgomery County" "Fairfax County" "Northern VA"{
use "${data}UrbanInstitue_VoicesDMVSurvey2017_Client_STATA_Formatted.dta", clear
keep if geo=="`y'"

**Gender
tabout Q6 PPGENDER [aw=weight] using "${tables}`y' tables gender.xls", replace  c(col ) npos(row)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHO {
tabout `x' PPGENDER [aw=weight] using "${tables}`y' tables gender.xls", append  c(col ) npos(row)
}

**Race
tabout Q6 race [aw=weight] using "${tables}`y'\tables race.xls", replace  c(col ) npos(row)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHO {
tabout `x' race [aw=weight] using "${tables}`y'\tables race.xls", append  c(col ) npos(row)
}

**Education
tabout Q6 educ [aw=weight] using "${tables}`y'\tables education.xls", replace  c(col ) npos(row)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHO {
tabout `x' educ [aw=weight] using "${tables}`y'\tables education.xls", append  c(col ) npos(row)
}
**Income
tabout Q6 income [aw=weight] using "${tables}`y'\tables income.xls", replace  c(col ) npos(row)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHO {
tabout `x' income [aw=weight] using "${tables}`y'\tables income.xls", append  c(col ) npos(row)
}
**Age
tabout Q6 age [aw=weight] using "${tables}`y'\tables age.xls", replace  c(col ) npos(row)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHO {
tabout `x' age [aw=weight] using "${tables}`y'\tables age.xls", append  c(col ) npos(row)
}
**Homeowner
tabout Q6 homeown [aw=weight] using "${tables}`y'\tables homeowner.xls", replace  c(col ) npos(row)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHO {
tabout `x' homeown [aw=weight] using "${tables}`y'\tables homeowner.xls", append  c(col ) npos(row)
}

}
