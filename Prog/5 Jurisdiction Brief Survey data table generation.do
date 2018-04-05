clear
set more off
log using "D:\DCDATA\Libraries\Voices\Prog\5 Jurisdiction Brief Survey data table generation.log", replace 

/* *****************************************************************************
* 
* Program: 5 Jurisdiction Brief Survey data table generation.do
* Library: Voices 
* Project: VoicesDMV 5 jurisdictional briefs
* Author: Yipeng Su
* Created: 4/2/2018
* Version: Stata/MP 15
* Environment: Windows:
* Description: create tables for 5 jurisdictional briefs for DC, PG, MoCo, Fairfax Co, and NoVa
*
* Modifications: 

* *****************************************************************************/

di c(current_date)
di c(current_time)

global data "D:\DCDATA\Libraries\Voices\data\voices_2017_nonopen_recode_replicateweighted"
global tables "D:\DCDATA\Libraries\Voices\Prog"
global section1 "Q9_table"
global section2 "Q52_table Q55_table Q57_table Q27_table Q28_1_table Q28_4_table"
global section3 "Q42_table Q44_a_table Q44_b_table Q44_c_table Q44_i_table Q49_table"
global section4 "Q22_table"

use "${data}.dta", clear

/** recode question variables
*Q9
gen Q9_table = "Extremely likely" if Q9==1
replace Q9_table = "Likely" if Q9==2
replace Q9_table = "Neither likely nor unlikely" if Q9==3
replace Q9_table = "Unlikely" if Q9==4
replace Q9_table = "Not at all likely" if Q9==5
replace Q9_table = "Refused" if Q9==-1

*Q52
gen Q52_table= "Living comfortably" if Q52==1
replace Q52_table= "Doing alright" if Q52==2
replace Q52_table= "Just getting by" if Q52==3
replace Q52_table= "Finding it difficult" if Q52==4
replace Q52_table= "Finding it very difficult" if Q52==5
replace Q52_table= "Refused" if Q52==-1

*Q55
gen Q55_table = "Yes" if Q55==1
replace Q55_table = "No" if Q55==0
replace Q55_table = "Refused" if Q55==-1

*Q57_table 
gen Q57_table = "Yes" if Q57==1
replace Q57_table = "No" if Q57==0
replace Q57_table = "Refused" if Q57==-1

*Q27_table 
gen Q27_table = "Yes" if Q27==1
replace Q27_table = "No" if Q27==0
replace Q27_table = "Refused" if Q27==-1

*Q28_1_table 
gen Q28_1_table = "Yes" if Q28_1==1
replace Q28_1_table = "No" if Q28_1==0
replace Q28_1_table ="" if Q28_1==.n

*Q28_4_table
gen Q28_4_table = "Yes" if Q28_4==1
replace Q28_4_table = "No" if Q28_4==0
replace Q28_4_table ="" if Q28_4==.n

*Q42_table 
gen Q42_table = "Yes" if Q42==1
replace Q42_table = "No" if Q42==0
replace Q42_table = "Refused" if Q42==.

*Q44_a_table 
gen Q44_a_table = "Yes" if Q44_a==1
replace Q44_a_table = "No" if Q44_a==0
replace Q44_a_table = "Refused" if Q44_a==.
replace Q44_a_table ="" if Q44_a==.n

*Q44_b_table 
gen Q44_b_table = "Yes" if Q44_b==1
replace Q44_b_table = "No" if Q44_b==0
replace Q44_b_table = "Refused" if Q44_b==.
replace Q44_b_table ="" if Q44_b==.n

*Q44_c_table 
gen Q44_c_table = "Yes" if Q44_c==1
replace Q44_c_table = "No" if Q44_c==0
replace Q44_c_table = "Refused" if Q44_c==.
replace Q44_c_table ="" if Q44_c==.n

*Q44_i_table 
gen Q44_i_table = "Yes" if Q44_i==1
replace Q44_i_table = "No" if Q44_i==0
replace Q44_i_table = "Refused" if Q44_i==.
replace Q44_i_table ="" if Q44_i==.n

*Q49_table
gen Q49_table = "Less favorably" if Q49==1
replace Q49_table = "More favorably" if Q49==2
replace Q49_table = "Equally" if Q49==3
replace Q49_table = "Refused" if Q49==-1

*Q22_table
gen Q22_table= "Never" if Q22==1
replace Q22_table= "At least once a year" if Q22==2
replace Q22_table= "At least once every couple of months" if Q22==3
replace Q22_table= "At least once a month" if Q22==4
replace Q22_table= "At least several times a month" if Q22==5
replace Q22_table= "Refused" if Q22==-1

**Gen Geography (alt)
gen Jurisdictions = "Washington DC" if geo ==1
replace Jurisdictions = "Prince George's County" if geo ==2
replace Jurisdictions = "Montgomery County" if geo ==3
replace Jurisdictions = "Fairfax County" if geo ==4 | geo ==7 |geo ==8 ****this is not correct
replace Jurisdictions = "Northern VA" if geo ==5 | geo ==6
*/

******YIPENG _ RECODE the next section USING NUMERIC VARIABLES - as in the Q39A_7Plus

*section 1
gen Q39A_7plus = 1 if Q39A>=7
replace Q39A_7plus = 0 if Q39A<7
replace Q39A_7plus = . if Q39A==-1
label var Q39A_7plus "Rating of Life Satisfaction Higher Than 7"


gen Q21_a_goodplus = 1 if Q21_a<=2
replace Q21_a_goodplus =0 if Q21_a>=3
replace Q21_a_goodplus =. if Q21_a==-1
label var Q21_a_goodplus "Good or Excellent Place to Raise Children"

gen Q21_b_goodplus =1 if Q21_b<=2
replace Q21_b_goodplus =0 if Q21_b>=3
replace Q21_b_goodplus =. if Q21_b==-1
label var Q21_b_goodplus "The availability of the goods and services that meet your needs is good or excellent"

gen Q21_c_goodplus =1 if Q21_c<=2
replace Q21_c_goodplus =0 if Q21_c>=3
replace Q21_c_goodplus =. if Q21_c==-1
label var Q21_c_goodplus "The overall quality of public schools is good or excellent"

gen Q21_d_goodplus =1 if Q21_d<=2
replace Q21_d_goodplus =0 if Q21_d>=3
replace Q21_d_goodplus =. if Q21_d==-1
label var Q21_d_goodplus "The availability of good jobs is good or excellent"

gen Q21_e_goodplus =1 if Q21_e<=2
replace Q21_e_goodplus =0 if Q21_e>=3
replace Q21_e_goodplus =. if Q21_e==-1
label var Q21_e_goodplus "The availability of arts and cultural opportunities is good or excellent"

gen Q21_f_goodplus =1 if Q21_f<=2
replace Q21_f_goodplus =0 if Q21_f>=3
replace Q21_f_goodplus =. if Q21_f==-1
label var Q21_f_goodplus "Access to transportation options is good or excellent"

label define GE 1 "Good or Excellent" 0 "Fair or Poor", replace
label values Q21_a_goodplus Q21_b_goodplus Q21_c_goodplus Q21_d_goodplus Q21_e_goodplus Q21_f_goodplus GE

*section 2
gen Q54_lessthan2 = "Less than 2 months" if Q54 ==1| Q54==2
replace Q54_lessthan2 = "More than 2 months" if Q54>2
replace Q54_lessthan2= "Refused" if Q43==-1
label var Q54_lessthan2 "Could continue to live as today for less than 2 months if lost all current sources of income"

*section 3
gen Q47_c_goodplus = "Good or Excellent" if Q47_c == 1| Q47_c == 2
replace Q47_c_goodplus = "Fair or Poor or Refuse" if Q47_c >2
replace Q47_c_goodplus = "Refused" if Q47_c ==-1
label var Q47_c_goodplus "The relations among different racial or ethnic group at where I live is good or excellent"

*section 4 still need to figure out the label part
foreach subquestion in Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l {
gen `subquestion'_highpriorityplus = "High or extremely high priority" if `subquestion'==1|`subquestion'==2
replace `subquestion'_highpriorityplus = "Median, low or no priority at all" if `subquestion'==3| `subquestion'==4|`subquestion'==5
replace `subquestion'_highpriorityplus="Refused" if `subquestion'==-1|`subquestion'==.
}
label var Q35_a_highpriorityplus "Developing parks and open spaces should be high or extremely high priority to local government"
label var Q35_b_highpriorityplus "Maintaining roads, sidewalks, and other basic infrastructure should be high or extremely high priority to local government"
label var Q35_c_highpriorityplus "Making it safer to get around by bicycle should be high or extremely high priority to local government"
label var Q35_d_highpriorityplus "Protecting people from crime should be high or extremely high priority to local government"
label var Q35_e_highpriorityplus "Protecting people from pollution and environmental hazards should be high or extremely high priority to local government"
label var Q35_f_highpriorityplus "Making sure all children get a quality education should be high or extremely high priority to local government"
label var Q35_g_highpriorityplus "Addressing affordable housing should be high or extremely high priority to local government"
label var Q35_h_highpriorityplus "Preventing discrimination should be high or extremely high priority to local government"
label var Q35_i_highpriorityplus "Helping poor people should be high or extremely high priority to local government"
label var Q35_j_highpriorityplus "Helping the homeless should be high or extremely high priority to local government"
label var Q35_k_highpriorityplus "Helping the unemployed should be high or extremely high priority to local government"
label var Q35_l_highpriorityplus "Helping people without health insurance should be high or extremely high priority to local government"


gen Q34_fairplus = "Fair amount or great deal" if Q34==1|Q34==2
replace Q34_fairplus = "Not very much or non at all" if Q34>=3
replace Q34_fairplus = "Refused" if Q34==-1
label var Q34_fairplus "I trust in the local government where I live a fair amount or great deal when it comes to handling local problems"

gen Q33_littleorno ="Little or no influence" if Q33==3|Q33==4
replace Q33_littleorno ="Great or moderate influence" if Q33<=2
replace Q33_littleorno ="Refused" if Q33==-1
label var Q33_littleorno "I have little or no influence at all over local government decision making"

label define GEO 1 "DC" 2 "Prince George's Co" 3 "Montgomery Co" 4 "Fairfax Co" 5 "Other NoVA", replace
svyset [iw=weight], jkrweight(weight_rep1-weight_rep60) vce(linearized)

/*output tables for questions in Section 1: Wellbeing and Satisfaction with DMV*/
tabout Q39A_7plus geo using "${tables}\section1 tables Jurisdictions.xls", replace  c(col se ci) svy percent pop npos(lab) f(2 2) clab(Row_% SE 95%_CI)
tabout Q9 geo using "${tables}\section1 tables Jurisdictions_test.xls", replace c(col se ci) svy percent pop npos(lab) f(2 2) clab(Row_% SE 95%_CI)
tabout Q21_a_goodplus Jurisdictions using "${tables}\section1 tables Jurisdictions.xls", append  c(col se ci) svy percent pop npos(lab) f(2 2) clab(Row_% SE 95%_CI)
tabout Q21_b_goodplus Jurisdictions using "${tables}\section1 tables Jurisdictions.xls", append  c(col se ci) svy percent pop npos(lab) f(2 2) clab(Row_% SE 95%_CI)
tabout Q21_c_goodplus Jurisdictions using "${tables}\section1 tables Jurisdictions.xls", append  c(col se ci) svy percent pop npos(lab) f(2 2) clab(Row_% SE 95%_CI)
tabout Q21_d_goodplus Jurisdictions using "${tables}\section1 tables Jurisdictions.xls", append  c(col se ci) svy percent pop npos(lab) f(2 2) clab(Row_% SE 95%_CI)
tabout Q21_e_goodplus Jurisdictions using "${tables}\section1 tables Jurisdictions.xls", append  c(col se ci) svy percent pop npos(lab) f(2 2) clab(Row_% SE 95%_CI)
tabout Q21_f_goodplus Jurisdictions using "${tables}\section1 tables Jurisdictions.xls", append  c(col se ci) svy percent pop npos(lab) f(2 2) clab(Row_% SE 95%_CI)


/*output tables for questions in Section 2: Economic Security and Inclusion*/
tabout Q54_lessthan2 Jurisdictions using "${tables}\section2 tables Jurisdictions.xls", replace  c(col se ci) svy percent pop npos(lab) f(2 2) clab(Row_% SE 95%_CI)
foreach x in "${section2}"{
tabout `x' Jurisdictions using "${tables}\section2 tables Jurisdictions.xls", append c(col se ci) svy percent pop npos(lab) f(2 2) clab(Row_% SE 95%_CI)
}

/*outut tables for questions in Section 3: Social Inclusion*/
tabout Q47_c_goodplus Jurisdictions using "${tables}\section3 tables Jurisdictions.xls", replace  c(col se ci) svy percent pop npos(lab) f(2 2) clab(Row_% SE 95%_CI)
foreach x in "${section3}"{
tabout `x' Jurisdictions using "${tables}\section3 tables Jurisdictions.xls", append  c(col se ci) svy percent pop npos(lab) f(2 2) clab(Row_% SE 95%_CI)
}


/*output tables for questions in Section 4: Making Change Happen*/
tabout Q35_a_highpriorityplus Jurisdictions using "${tables}\section4 tables Jurisdictions.xls", replace c(col se ci) svy percent pop npos(lab) f(2 2) clab(Row_% SE 95%_CI)
foreach x in Q35_b_highpriorityplus Q35_c_highpriorityplus Q35_d_highpriorityplus Q35_e_highpriorityplus Q35_f_highpriorityplus Q35_g_highpriorityplus Q35_h_highpriorityplus Q35_i_highpriorityplus Q35_j_highpriorityplus Q35_k_highpriorityplus Q35_l_highpriorityplus Q34_fairplus Q33_littleorno Q22_table {
tabout `x' Jurisdictions using "${tables}\section4 tables Jurisdictions.xls", append c(col se ci) svy percent pop npos(lab) f(2 2) clab(Row_% SE 95%_CI)
}


log close
