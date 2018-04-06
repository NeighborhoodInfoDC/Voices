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
global section1 "Q9"
global section2 "Q52 Q55 Q57 Q27 Q28_1 Q28_4"
global section3 "Q42 Q44_a Q44_b Q44_c Q44_i Q49"
global section4 "Q22"

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

**label existing questions

*Q55 Q57 Q27
label define foodhousing 1 "Yes" 0 "No" -1 "Refused", replace
label values Q55 foodhousing
label values Q57 foodhousing
label values Q27 foodhousing

*Q42
label define QS42 1 "Yes" 0 "No" , replace
label values Q42 QS42

*Q44_a Q44_b Q44_c Q44_i
label define QS44 1 "Yes" 0 "No" .n "Skipped", replace
label values Q44_a QS44
label values Q44_b QS44
label values Q44_c QS44
label values Q44_i QS44

******YIPENG _ RECODE the next section USING NUMERIC VARIABLES - as in the Q39A_7Plus

*section 1
/*for some reason stata returns the replace is invalid, but it works for other recoding?
gen Q39A_7plus = 1 if Q39A>=7
replace Q39A_7plus = 0 if Q39A<7
replace Q39A_7plus = . if Q39A==-1
label var Q39A_7plus "Rating of Life Satisfaction Higher Than 7"
label define lifesatisfaction 1 "7 or Higher" 0 "Below Seven", -1 "Refused", replace
label values Q39A_7plus lifesatisfaction
*/

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
gen Q54_lessthan2 = 1 if Q54 ==1| Q54==2
replace Q54_lessthan2 = 0 if Q54>2
replace Q54_lessthan2= -1 if Q43==-1
label var Q54_lessthan2 "Could continue to live as today for less than 2 months if lost all current sources of income"

label define lostinc 1 "Less than 2 months" 0 "More than 2 months" -1 "Refused", replace
label values Q54_lessthan2 lostinc

*section 3
gen Q47_c_goodplus = 1 if Q47_c == 1| Q47_c == 2
replace Q47_c_goodplus = 0 if Q47_c >2
replace Q47_c_goodplus = -1 if Q47_c ==-1
label var Q47_c_goodplus "The relations among different racial or ethnic group at where I live is good or excellent"

label define racerelation 1 "Good or Excellent" 0 "Fair or Poor" -1 "Refused", replace
label values Q47_c_goodplus racerelation

*section 4 
foreach subquestion in Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l {
gen `subquestion'_highpriorityplus = 1 if `subquestion'==1|`subquestion'==2
replace `subquestion'_highpriorityplus = 0 if `subquestion'==3| `subquestion'==4|`subquestion'==5
replace `subquestion'_highpriorityplus=-1 if `subquestion'==-1|`subquestion'==.
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
label define priorities 1 "High or extremely high priority" 0 "Median, low or no priority at all" -1 "Refused", replace
foreach subquestion in Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l {
label values `subquestion'_highpriorityplus priorities
}

gen Q34_fairplus = 1 if Q34==1|Q34==2
replace Q34_fairplus = 2 if Q34>=3
replace Q34_fairplus = -1 if Q34==-1
label var Q34_fairplus "I trust in the local government where I live a fair amount or great deal when it comes to handling local problems"
label define QS34 1 "Fair amount or great deal" 2 "Not very much or non at all" -1 "Refused", replace
label values Q34_fairplus QS34

gen Q33_littleorno =1 if Q33==3|Q33==4
replace Q33_littleorno =0  if Q33<=2
replace Q33_littleorno =-1 if Q33==-1
label var Q33_littleorno "I have little or no influence at all over local government decision making"
label define QS33 1 "Little or no influence" 0 "Great or moderate influence" -1 "Refused", replace
label values Q33_littleorno QS33

/*Output tables*/
svyset [iw=weight], jkrweight(weight_rep1-weight_rep60) vce(linearized)

levelsof geo, local(Jurisdictions)




foreach G in `Jurisdictions' {
* when I added a line break for the next line the code stopped working?
svy,vce(jackknife):mean Q9 Q21_a_goodplus Q21_b_goodplus Q21_c_goodplus Q21_d_goodplus Q21_e_goodplus Q21_f_goodplus Q52 Q54_lessthan2 Q55 Q57 Q27 Q28_1 Q28_4 Q47_c_goodplus Q42 Q44_a Q44_b Q44_c Q44_d Q49 Q35_a_highpriorityplus Q35_b_highpriorityplus  Q35_c_highpriorityplus Q35_d_highpriorityplus Q35_e_highpriorityplus Q35_f_highpriorityplus Q35_g_highpriorityplus Q35_h_highpriorityplus  Q35_i_highpriorityplus Q35_j_highpriorityplus Q35_k_highpriorityplus Q35_l_highpriorityplus Q34_fairplus Q33_littleorno  Q22 if geo==`G'
*get mean
mata b=st_matrix("e(b)")'
mata b

mata se=sqrt(diagonal(st_matrix("e(V)")))
mata se


* Send b, se back to stata
mata st_matrix("b",b)
mata st_matrix("se",se) 

*could create another mata var to calculate CI here then output all three


mata res=b,se

*Send the matrix to stata as a variable named result; list the matrix:

mata st_matrix("result",res)
matrix list result

*Then this code writes the matrix result to a spreadsheet in excel:

putexcel set d:\dcdata\libraries\voices\prog\temp\Jurisdiction Tables_test, sheet(`G') modify
putexcel b1=("`G'") /*need to edit for loop*/
putexcel c1=("se")
putexcel b2=matrix(result[.,1..2])

}

mata: mata clear

*for region output on each file

svy,vce(jackknife):mean Q21_a_goodplus Q21_b_goodplus Q21_c_goodplus Q21_d_goodplus Q21_e_goodplus Q21_f_goodplus 

*get mean
mata b=st_matrix("e(b)")'
mata b

mata se=sqrt(diagonal(st_matrix("e(V)")))
mata se

* Send b, se back to stata
mata st_matrix("b",b)
mata st_matrix("se",se) 


mata res=b,se

*Send the matrix to stata as a variable named result; list the matrix:

mata st_matrix("result",res)
matrix list result

*Then this code writes the matrix result to a spreadsheet in excel:

putexcel set d:\dcdata\libraries\voices\prog\temp\Jurisdiction Tables_test, sheet(DMV) modify
putexcel e1=("DMV")
putexcel f1=("se")
putexcel e2=matrix(result[.,1..2])

mata: mata clear


log close
