/* *****************************************************************************
* 
* PROGRAM WRITTEN AND EXECUTED BY CARL HEDMAN, 8/2017

* *****************************************************************************/

clear
set more off

log using "L:\Libraries\Voices\Prog\survey data table generation.log", replace 

global data "L:\Libraries\Voices\Raw\UrbanInstitute_VoicesDMVSurvey2017_Client_08292017\"
global tables "L:\Libraries\Voices\Tables\"
global varlist "Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPRENT PPSTATEN PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK"
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

**Geography
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

**Recode to match CDC BRFSS breaks 0, 1-13 days, 14-30 days
gen phy_health = "Zero days" if Q37==0
replace phy_health = "1-13 days" if Q37>=1 & Q37<=13
replace phy_health = "14-30 days" if Q37>=14 & Q37<=30
label var phy_health "Count of days in last 30 days when physical health not good"

gen ment_health = "Zero days" if Q38==0
replace ment_health = "1-13 days" if Q38>=1 & Q38<=13
replace ment_health = "14-30 days" if Q38>=14 & Q38<=30
label var ment_health "Count of days in last 30 days when mental health was not good"

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

gen anxious = "Very low (0-1)" if Q39D==0 | Q39D==1
replace anxious = "Medium (5-6)" if Q39D==2 | Q39D==3
replace anxious = "High (7-8)" if Q39D==4 | Q39D==5
replace anxious = "Very high (9-10)" if Q39D>=6 & Q39D<=10
label var anxious "Overall, how anxious did you feel yesterday?"

gen ladder_now = "Suffering (0-4)" if Q41A>=0 & Q41A<=4
replace ladder_now = "Struggling  (5-6)" if Q41A==5 & Q41A==6
replace ladder_now = "Thriving  (7-10)" if Q41A>=7 & Q41A<=10
label var ladder_now "On which step of the ladder... do you stand at this time?"

gen ladder_5yr = "Suffering (0-4)" if Q41B>=0 & Q41B<=4
replace ladder_5yr = "Struggling  (5-7)" if Q41B>=5 & Q41B<=7
replace ladder_5yr = "Thriving  (8-10)" if Q41B>=8 & Q41B<=10
label var ladder_5yr "On which step do you think you will stand about 5 years from now?"


svyset [pw=weight]

save "${data}UrbanInstitue_VoicesDMVSurvey2017_Client_STATA_Formatted.dta", replace
set more off

**Create tables
**All
tabout Q6 using "${tables}tables all.xls", replace  c(col  se) svy percent pop npos(row) f(3p)

foreach x in "${varlist}" {
tabout `x' using "${tables}tables all.xls", append  c(col  se) svy percent pop npos(row) f(3p)
}
**County totals
tabout Q6 geo using "${tables}tables geographies.xls", replace  c(col  se) svy percent pop npos(row) f(3p)

foreach x in "${varlist}" {
tabout `x' geo using "${tables}tables geographies.xls", append  c(col  se) svy percent pop npos(row) f(3p)
}

**Gender
tabout Q6 PPGENDER [aw=weight] using "${tables}tables gender.xls", replace  c(col  se) svy percent pop npos(row) f(3p)

foreach x in "${varlist}" {
tabout `x' PPGENDER [aw=weight] using "${tables}tables gender.xls", append  c(col  se) svy percent pop npos(row) f(3p)
}

**Race
tabout Q6 race [aw=weight] using "${tables}tables race.xls", replace  c(col  se) svy percent pop npos(row) f(3p)

foreach x in "${varlist}" {
tabout `x' race [aw=weight] using "${tables}tables race.xls", append  c(col  se) svy percent pop npos(row) f(3p)
}

**Education
tabout Q6 educ [aw=weight] using "${tables}tables education.xls", replace  c(col  se) svy percent pop npos(row) f(3p)

foreach x in "${varlist}" {
tabout `x' educ [aw=weight] using "${tables}tables education.xls", append  c(col  se) svy percent pop npos(row) f(3p)
}
**Income
tabout Q6 income [aw=weight] using "${tables}tables income.xls", replace  c(col  se) svy percent pop npos(row) f(3p)

foreach x in "${varlist}" {
tabout `x' income [aw=weight] using "${tables}tables income.xls", append  c(col  se) svy percent pop npos(row) f(3p)
}
**Age
tabout Q6 age [aw=weight] using "${tables}tables age.xls", replace  c(col  se) svy percent pop npos(row) f(3p)

foreach x in "${varlist}" {
tabout `x' age [aw=weight] using "${tables}tables age.xls", append  c(col  se) svy percent pop npos(row) f(3p)
}
**Homeowner
tabout Q6 homeown [aw=weight] using "${tables}tables homeowner.xls", replace  c(col  se) svy percent pop npos(row) f(3p)

foreach x in "${varlist}" {
tabout `x' homeown [aw=weight] using "${tables}tables homeowner.xls", append  c(col  se) svy percent pop npos(row) f(3p)
}


**tab at the individual geography
foreach y in /*"Washington DC"*/ "Prince George's County" "Montgomery County" "Fairfax County" "Northern VA"{
use "${data}UrbanInstitue_VoicesDMVSurvey2017_Client_STATA_Formatted.dta", clear
keep if geo=="`y'"

**Gender
tabout Q6 PPGENDER [aw=weight] using "${tables}`y' tables gender.xls", replace  c(col  se) svy percent pop npos(row) f(3p)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPRENT PPSTATEN PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK  {
tabout `x' PPGENDER [aw=weight] using "${tables}`y' tables gender.xls", append  c(col  se) svy percent pop npos(row) f(3p)
}

**Race
tabout Q6 race [aw=weight] using "${tables}`y'\tables race.xls", replace  c(col  se) svy percent pop npos(row) f(3p)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPRENT PPSTATEN PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK  {
tabout `x' race [aw=weight] using "${tables}`y'\tables race.xls", append  c(col  se) svy percent pop npos(row) f(3p)
}

**Education
tabout Q6 educ [aw=weight] using "${tables}`y'\tables education.xls", replace  c(col  se) svy percent pop npos(row) f(3p)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPRENT PPSTATEN PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK  {
tabout `x' educ [aw=weight] using "${tables}`y'\tables education.xls", append  c(col  se) svy percent pop npos(row) f(3p)
}
**Income
tabout Q6 income [aw=weight] using "${tables}`y'\tables income.xls", replace  c(col  se) svy percent pop npos(row) f(3p)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPRENT PPSTATEN PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK  {
tabout `x' income [aw=weight] using "${tables}`y'\tables income.xls", append  c(col  se) svy percent pop npos(row) f(3p)
}
**Age
tabout Q6 age [aw=weight] using "${tables}`y'\tables age.xls", replace  c(col  se) svy percent pop npos(row) f(3p)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPRENT PPSTATEN PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK  {
tabout `x' age [aw=weight] using "${tables}`y'\tables age.xls", append  c(col  se) svy percent pop npos(row) f(3p)
}
**Homeowner
tabout Q6 homeown [aw=weight] using "${tables}`y'\tables homeowner.xls", replace  c(col  se) svy percent pop npos(row) f(3p)

foreach x in Q7 Q8 Q9 Q10 Q11 Q12 Q13_1 Q13_2 Q13_3 Q13_4 Q13_5 Q13_6 Q13_7 Q13_8 Q14_1 Q14_2 Q14_3 Q14_4 Q14_5 Q14_6 Q14_7 Q14_8 Q14_9 Q14_10 Q17 Q18 Q19 Q20_a Q20_b Q20_c Q20_d Q20_e Q20_f Q20_g Q20_h Q20_i  Q21_a Q21_b Q21_c Q21_d Q21_e Q21_f Q22 Q23_1 Q23_2 Q23_3 Q23_4 Q23_5 Q23_6   Q24 Q25 Q26 Q27 Q28_1 Q28_2 Q28_3 Q28_4 Q28_5 Q28_6 Q28_7 Q28_8 Q28_9 Q28_10   Q29 Q30_a Q30_b Q31 Q32_a Q32_b Q33 Q34 Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l Q36 Q37 Q38 Q39A Q39B Q39C Q39D Q40 Q41A Q41B Q42 Q43 Q44_a Q44_b Q44_c Q44_d Q44_e Q44_f Q44_g Q44_h Q44_i Q44_j Q44_k Q44_l Q44_m Q44_n  Q45_a Q45_b Q45_c Q45_d Q45_e Q45_f Q45_g Q45_h Q45_i  Q46_a Q46_b Q46_c Q46_d Q46_e Q46_f Q46_g Q46_h Q46_i Q46_j Q46_k Q46_l Q46_m Q46_n Q46_o Q46_p Q47_a Q47_b Q47_c Q48 Q49 Q50 Q51 Q52 Q53 Q54 Q55 Q56 Q57 Q58 Q59 Q60 Q61_a Q61_b Q61_c Q61_d Q61_e Q61_f Q61_g Q61_h Q61_i Q61_j  Q62 Q63_a Q63_b Q63_c Q63_d Q63_e Q63_f Q63_g Q63_h  Q77 Q78 Q79 student DeviceType DOV_REL1 DOV_IDEO ppracem PPAGE ppagecat ppagect4 PPEDUC PPEDUCAT PPETHM PPGENDER PPHHHEAD PPHHSIZE PPHOUSE PPINCIMP PPMARIT PPRENT PPSTATEN PPT01 PPT25 PPT612 PPT1317 PPT18OV PPWORK  {
tabout `x' homeown [aw=weight] using "${tables}`y'\tables homeowner.xls", append  c(col  se) svy percent pop npos(row) f(3p)
}

}

log close 
