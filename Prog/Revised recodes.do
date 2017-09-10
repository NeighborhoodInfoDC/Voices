

clear
set more off

*log using "L:\Libraries\Voices\Prog\revised recodes.log", replace 
log using "D:\DCDATA\Libraries\Voices\Prog\revised recodes.log", replace 

/* *****************************************************************************
* 
* Program: Survey data table generation.do
* Library: Voices 
* Project: VoicesDMV 2017
* Author: CARL HEDMAN, Leah Hendey
* Created: 9/1/2017
* Version: Stata/MP 15
* Environment: Windows:
* Description: 
*
* Modifications: 
* *****************************************************************************/

di c(current_date)
di c(current_time)


global data "L:\Libraries\Voices\Raw\UrbanInstitute_VoicesDMVSurvey2017_Client_08292017\"
global tables "L:\Libraries\Voices\Tables\"
global vartab "Q4_cat Q5_cat Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q13_count Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q14_count Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 phy_health Q38 ment_health Q39A satisf Q39B worth Q39C happy Q39D anxious Q40 Q41A ladder_now Q41B ladder_5yr Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPRENT PPSTATEN PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK"
global meantab "Q4_Years Q5_Years Q6 Q7 Q8 Q9 Q10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q24 Q25 Q26 Q30_a Q30_b Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q41A Q41B Q43 Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q56 Q58 Q60 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h Q78 Q79"
global vartabDC "Q4_cat Q5_cat Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q13_count Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q14_count Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 phy_health Q38 ment_health Q39A satisf Q39B worth Q39C happy Q39D anxious Q40 Q41A ladder_now Q41B ladder_5yr Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPRENT PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK"
global vartabGEO "Q4_cat Q5_cat Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q13_count Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q14_count Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 phy_health Q38 ment_health Q39A satisf Q39B worth Q39C happy Q39D anxious Q40 Q41A ladder_now Q41B ladder_5yr Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPRENT PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK"
global meantabDC "Q4_Years Q5_Years Q6 Q7 Q8 Q9 Q10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q24 Q25 Q26 Q30_a Q30_b Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q41A Q41B Q43 Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q56 Q58 Q60 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h Q78 Q79"


** Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q14_Text Q15_Text1 Q15_Text2 Q15_Text3 Q15_Text1_Refused Q15_Text2_Refused Q15_Text3_Refused Q16_Text1 Q16_Text2 Q16_Text3 Q16_Text1_Refused Q16_Text2_Refused Q16_Text3_Refused Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i Q20_Text Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6 Q23_Refused Q23_Text Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10 Q28_Refused Q28_Text Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n Q44_Text Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i Q45_Text Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j Q61_Text Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h Q63_Text Q77 Q78 Q79 Q79_Text student DeviceType QZIP DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPMSACAT PPREG4 ppreg9 PPRENT PPSTATEN PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK
** no text entry: Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPMSACAT PPREG4 ppreg9 PPRENT PPSTATEN PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK

use "${data}UrbanInstitue_VoicesDMVSurvey2017_Client_STATA.dta", clear

**race
gen race = 1 if PPETHM ==1
replace race = 2 if PPETHM ==2
replace race = 3 if PPETHM ==4
replace race = 4 if ppracem == 4 | ppracem== 5
replace race = 5 if PPETHM ==3 | PPETHM ==5
label var race "Respondent's Race/Ethnicity"

*USE TO CREATE VALUE LABELS**
*gen race = "N.H. white" if PPETHM ==1
*replace race = "N.H. black" if PPETHM ==2
*replace race = "Hispanic" if PPETHM ==4
*replace race = "N.H. Asian or P.I." if ppracem == 4 | ppracem== 5
*replace race = "N.H. other" if PPETHM ==3 | PPETHM ==5

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

**gender
gen gender = "Male" if PPGENDER==1
replace gender = "Female" if PPGENDER==2

**Homeowner
gen homeown = "Homeowner" if PPRENT ==1
replace homeown = "Not homeowner" if PPRENT ==2 | PPRENT ==3

**Geography
gen geo = 1 if dov_urban ==1
replace geo = 2 if dov_urban ==2
replace geo = 3 if dov_urban ==3
replace geo = 4 if dov_urban ==4 
replace geo = 5 if dov_urban ==5 | dov_urban ==6 | dov_urban ==7 |dov_urban ==8
*use to create value labels
*gen geo = "District of Columbia" if dov_urban ==1
*replace geo = "Prince George's County" if dov_urban ==2
*replace geo = "Montgomery County" if dov_urban ==3
*replace geo = "Fairfax County" if dov_urban ==4 
*replace geo = "Northern VA" if dov_urban ==5 | dov_urban ==6 | dov_urban ==7 |dov_urban ==8

**Geography (alt)
gen geo2 = 1 if dov_urban ==1
replace geo2 = 2 if dov_urban ==2
replace geo2 = 3 if dov_urban ==3
replace geo2 = 4 if dov_urban ==4 | dov_urban ==7 |dov_urban ==8
replace geo2 = 5 if dov_urban ==5 | dov_urban ==6
*gen geo2 = "District of Columbia" if dov_urban ==1
*replace geo2 = "Prince George's County" if dov_urban ==2
*replace geo2 = "Montgomery County" if dov_urban ==3
*replace geo2 = "Fairfax County" if dov_urban ==4 | dov_urban ==7 |dov_urban ==8
*replace geo2 = "Northern VA" if dov_urban ==5 | dov_urban ==6

**change refused to missing
foreach x in Q3_Years Q3_Months Q4_Years Q4_Months Q5_Years Q5_Months Q6 Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPMSACAT PPREG4 ppreg9 PPRENT PPSTATEN PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK{
replace `x' = . if `x' ==-1
}

**gen counts for civic engagement
gen Q13_count = 0
forvalues x = 1/8{
replace Q13_count = Q13_count +1 if Q13_`x'==1
}
label var Q13_count "Count of civic engagement activities(0-8)"

**gen counts for civic activities
gen Q14_count = 0
forvalues x = 1/10{
replace Q14_count = Q14_count +1 if Q14_`x'==1
}
label var Q14_count "Count of civic org memberships (0-10)"

**length of time 
gen Q3_total = Q3_Years + (Q3_Months/12)
label var Q3_total "How long (years) have you lived in the Washington area?"

gen Q4_total = Q4_Years + (Q4_Months/12)
label var Q4_total "How long (years) have you lived in [county/place]?"

gen Q5_total = Q5_Years + (Q5_Months/12)
label var Q5_total "How long (years) have you lived in your current home?"

**Round decimal to avoid tabout error -- NOTE: still having issues with this variable displaying in tabout out. used the "QX_Years" for mean as placeholder.
replace Q3_total=round(Q3_total, .01)
replace Q4_total=round(Q4_total, .01)
replace Q5_total=round(Q5_total, .01)

gen Q3_cat = "0-5" if Q3_total>=0 & Q3_total<=5
replace Q3_cat = "5-10" if Q3_total>5 & Q3_total<=10
replace Q3_cat = "10-20" if Q3_total>10 & Q3_total<=20
replace Q3_cat = "20-40" if Q3_total>20 & Q3_total<=40
replace Q3_cat = "40+" if Q3_total>40 & Q3_total!=.
label var Q3_cat "Category: How long (years) have you lived in the Washington area?"

gen Q4_cat = "0-5" if Q4_total>=0 & Q4_total<=5
replace Q4_cat = "5-10" if Q4_total>5 & Q4_total<=10
replace Q4_cat = "10-20" if Q4_total>10 & Q4_total<=20
replace Q4_cat = "20-40" if Q4_total>20 & Q4_total<=40
replace Q4_cat = "40+" if Q4_total>40 & Q4_total!=.
label var Q4_cat "Category: How long (years) have you lived in [county/place]?"

gen Q5_cat = "0-1" if Q5_total>=0 & Q5_total<=1
replace Q5_cat = "1-2" if Q5_total>1 & Q5_total<=2
replace Q5_cat = "2-5" if Q5_total>2 & Q5_total<=5
replace Q5_cat = "5-10" if Q5_total>5 & Q5_total<=10
replace Q5_cat = "10+" if Q5_total>10 & Q5_total!=.
label var Q5_cat "Category: How long (years) have you lived in your current home?"

**Recode to match CDC BRFSS breaks 0, 1-13 days, 14-30 days
*gen phy_health = "Zero days" if Q37==0
*replace phy_health = "1-13 days" if Q37>=1 & Q37<=13
*replace phy_health = "14-30 days" if Q37>=14 & Q37<=30

gen phy_health = 1 if Q37==0
replace phy_health = 2 if Q37>=1 & Q37<=13
replace phy_health = 3 if Q37>=14 & Q37<=30
label var phy_health "Count of days in last 30 days when physical health not good"

gen ment_health = 1 if Q38==0
replace ment_health = 2 if Q38>=1 & Q38<=13
replace ment_health = 3 if Q38>=14 & Q38<=30
label var ment_health "Count of days in last 30 days when mental health was not good"
*gen ment_health = "Zero days" if Q38==0
*replace ment_health = "1-13 days" if Q38>=1 & Q38<=13
*replace ment_health = "14-30 days" if Q38>=14 & Q38<=30
*label var ment_health "Count of days in last 30 days when mental health was not good"

gen satisf = "Low (0-4)" if Q39A>=0 & Q39A<=4
replace satisf = "Medium (5-6)" if Q39A==5 | Q39A==6
replace satisf = "High (7-8)" if Q39A==7 | Q39A==8
replace satisf = "Very high (9-10)" if Q39A==9 | Q39A==10
label var satisf "Overall, how satisfied are you with your life nowadays?"

gen worth = "Low (0-4)" if Q39B>=0 & Q39B<=4
replace worth = "Medium (5-6)" if Q39B==5 | Q39B==6
replace worth = "High (7-8)" if Q39B==7 | Q39B==8
replace worth = "Very high (9-10)" if Q39B==9 | Q39B==10
label var worth "...do you feel the things you do in your life are worthwhile?"

gen happy = "Low (0-4)" if Q39C>=0 & Q39C<=4
replace happy = "Medium (5-6)" if Q39C==5 | Q39C==6
replace happy = "High (7-8)" if Q39C==7 | Q39C==8
replace happy = "Very high (9-10)" if Q39C==9 | Q39C==10
label var happy "Overall, how happy did you feel yesterday?"

gen anxious = 1 if Q39D==0 | Q39D==1
replace anxious = 2 if Q39D==2 | Q39D==3
replace anxious = 3 if Q39D==4 | Q39D==5
replace anxious = 4 if Q39D>=6 & Q39D<=10
label var anxious "Overall, how anxious did you feel yesterday?"

*gen anxious = "Very low (0-1)" if Q39D==0 | Q39D==1
*replace anxious = "Low (2-3)" if Q39D==2 | Q39D==3
*replace anxious = "Medium (4-5)" if Q39D==4 | Q39D==5
*replace anxious = "High (6-10)" if Q39D>=6 & Q39D<=10

*how gallup used Cantril Self-Anchoring Striving Scale http://www.gallup.com/poll/122453/understanding-gallup-uses-cantril-scale.aspx*
gen thriving=.
replace thriving=0 if Q41A!=. & Q41B !=.
replace thriving=1 if Q41A >=7 & Q41B >=8

gen suffering=.
replace suffering=0 if Q41A!=. & Q41B !=.
replace suffering=1 if Q41A <=4 & Q41B <=4 

gen struggling=.
replace struggling=0 if Q41A!=. & Q41B !=.
replace struggling=1 if suffering==0 & thriving==0
label var thriving "Respondent is thriving (self evaluation)"
label var suffering "Respondent is suffering (self evaluation)" 
label var struggling "Respondent is struggling (self evaluation)" 




