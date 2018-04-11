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


**label existing questions - no recoding required

*Q55 Q57 Q27 Q42
label define YesNo 1 "Yes" 0 "No", replace
label values Q55 YesNo
label values Q57 YesNo
label values Q27 YesNo
label values Q42 YesNo


*Q44_a Q44_b Q44_c Q44_i
label define QS44 1 "Yes" 0 "No" .n "Skipped", replace
label values Q44_a QS44
label values Q44_b QS44
label values Q44_c QS44
label values Q44_i QS44

****section 1
gen Q39A_7plus = 1 if Q39A>=7
replace Q39A_7plus = 0 if Q39A<7
replace Q39A_7plus = . if Q39A==-1
label var Q39A_7plus "Rating of Life Satisfaction Higher Than 7"
label define lifesatisfaction 1 "7 or Higher" 0 "Below Seven" 
label values Q39A_7plus lifesatisfaction

gen Q9_rectolive=1 if Q9==1|Q9==2
replace Q9_rectolive=0 if Q9==3|Q9==4|Q9==5
replace Q9_rectolive=. if Q9==-1
label var Q9_rectolive "Likely to recommend this Jurisdiction to a friend or co-worker as a place to live"
label define QS9 1 "Extremely likely or likely" 0 "Neither likely nor unlikely, unlikely, not at all likely", replace
label value Q9_rectolive QS9

gen Q10_stay=1 if Q10==1|Q10==2
replace Q10_stay=0 if Q10==3|Q10==4
label var Q10_stay "If I had the choice, I would rather stay in my jurisdiction"
label define QS10 1 "Stay in my jurisdiction" 0 "Move to another jurisdiction", replace
label value Q10_stay QS10

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

*****section 2
gen Q52_comfortable=1 if Q52==1
replace Q52_comfortable=0 if Q52>=2
replace Q52_comfortable=. if Q52==-1
label var Q52_comfortable "How well are you managing financially"
label define QS52 1 "Living comfortably" 0 "Doing alrigh, just getting by, finding it difficult or very difficult", replace
label value Q52_comfortable QS52

gen Q54_lessthan2 = 1 if Q54 ==1| Q54==2
replace Q54_lessthan2 = 0 if Q54>2
replace Q54_lessthan2=. if Q43==-1
label var Q54_lessthan2 "Could continue to live as today for less than 2 months if lost all current sources of income"

label define lostinc 1 "Less than 2 months" 0 "More than 2 months", replace
label values Q54_lessthan2 lostinc

*Q55, Q57 (food and housing insecurity) and Q27, Q28_1, Q28_4 (had to move)- already correctly defined as Yes/No). 

****section 3
gen Q47_c_goodplus = 1 if Q47_c == 1| Q47_c == 2
replace Q47_c_goodplus = 0 if Q47_c >2
replace Q47_c_goodplus =. if Q47_c ==-1
label var Q47_c_goodplus "The relations among different racial or ethnic group at where I live is good or excellent"

label define racerelation 1 "Good or Excellent" 0 "Fair or Poor", replace
label values Q47_c_goodplus racerelation

*Q42 (discrimination) no recode needed
*Q44_a Q44_b Q44_C Q44_i no recode needed - discrimination by...

gen Q49_less=1 if Q49==1
replace Q49_less=0 if Q49==2|Q49==3
replace Q49_less=. if Q49==-1
label var Q49_less "Do you think police in your community treat people of color..."
label define QS49 1 "Less favorably to white people" 0 "Equally or more favorably to white people", replace
label value Q49_less QS49

gen Q49_more=1 if Q49==2
replace Q49_more=0 if Q49==1|Q49==3
replace Q49_more=. if Q49==-1
label var Q49_more "Do you think police in your community treat people of color..."
label define QS49m 1 "More favorably to white people" 0 "Equally or less favorably to white people", replace
label value Q49_more QS49m

gen Q49_eq=1 if Q49==3
replace Q49_eq=0 if Q49==1|Q49==2
replace Q49_eq=. if Q49==-1
label var Q49_eq "Do you think police in your community treat people of color..."
label define QS49e 1 "Equally to white people" 0 "Either more or less favorably to white people", replace
label value Q49_eq QS49e

*****section 4 
foreach subquestion in Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l {
gen `subquestion'_highpriorityplus = 1 if `subquestion'==1|`subquestion'==2
replace `subquestion'_highpriorityplus = 0 if `subquestion'==3| `subquestion'==4|`subquestion'==5
replace `subquestion'_highpriorityplus=. if `subquestion'==-1|`subquestion'==.
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
label define priorities 1 "High or extremely high priority" 0 "Medium, low, or no priority at all", replace
foreach subquestion in Q35_a Q35_b Q35_c Q35_d Q35_e Q35_f Q35_g Q35_h Q35_i Q35_j Q35_k Q35_l {
label values `subquestion'_highpriorityplus priorities
}

gen Q34_fairplus = 1 if Q34==1|Q34==2
replace Q34_fairplus = 0 if Q34>=3
replace Q34_fairplus =. if Q34==-1
label var Q34_fairplus "I trust in the local government where I live a fair amount or great deal when it comes to handling local problems"
label define QS34 1 "Fair amount or great deal" 2 "Not very much or non at all", replace
label values Q34_fairplus QS34

gen Q33_littleorno =1 if Q33==3|Q33==4
replace Q33_littleorno =0  if Q33<=2
replace Q33_littleorno =. if Q33==-1
label var Q33_littleorno "I have little or no influence at all over local government decision making"
label define QS33 1 "Little or no influence" 0 "Great or moderate influence", replace
label values Q33_littleorno QS33

gen Q22_onceayear=1 if Q22==2|Q22==3|Q22==4
replace  Q22_onceayear=0 if Q22==1
replace Q22_onceayear=. if Q22==-1
label var Q22_onceayear "Use services provided by nonprofits at least once a year"
label define QS22 1 "At least once a year" 0 "Never", replace
label value Q22_onceayear QS22



/*Output tables for each Jurisdiction*/
svyset [iw=weight], jkrweight(weight_rep1-weight_rep60) vce(linearized)

levelsof geo, local(Jurisdictions)


foreach G in `Jurisdictions' {


di "means for geo=`G'" 

*start to put result at row 2
local r=2

	foreach var in Q39A_7plus Q9_rectolive Q10_stay Q21_a_goodplus Q21_b_goodplus Q21_c_goodplus Q21_d_goodplus Q21_e_goodplus Q21_f_goodplus Q52_comfortable Q54_lessthan2 Q55 Q57 Q27 Q28_1 Q28_4 Q47_c_goodplus Q42 Q44_a Q44_b Q44_c Q44_i Q49_less Q49_more Q49_eq Q35_a_highpriorityplus Q35_b_highpriorityplus  Q35_c_highpriorityplus Q35_d_highpriorityplus Q35_e_highpriorityplus Q35_f_highpriorityplus Q35_g_highpriorityplus Q35_h_highpriorityplus  Q35_i_highpriorityplus Q35_j_highpriorityplus Q35_k_highpriorityplus Q35_l_highpriorityplus Q34_fairplus Q33_littleorno  Q22_onceayear{
	svy, subpop(if geo==`G') vce(jackknife):mean `var' 
	*get mean
	mata b=st_matrix("e(b)")'
	mata b

	mata se=sqrt(diagonal(st_matrix("e(V)")))
	mata se

	* Send b, se back to stata
	mata st_matrix("b",b)
	mata st_matrix("se",se) 

	*could create another mata var to calculate CI here then output all three
	*add n's 
	mata n=st_matrix("e(_N)")'
	mata n

	mata res=b,se, n

	*Send the matrix to stata as a variable named result; list the matrix:

	mata st_matrix("result",res)
	matrix list result

	*Then this code writes the matrix result to a spreadsheet in excel:
	* add new column for Ns - 
	putexcel set d:\dcdata\libraries\voices\prog\Jurisdiction_Tables, sheet(`G') modify
	putexcel b1=("`G'")
	putexcel c1=("SE")
	putexcel d1=("#N")
	putexcel b`r'=matrix(result[.,1..3])
	local r=`r'+1
	}
}

mata: mata clear

*for region output on each file
local r=2
foreach var in Q39A_7plus Q9_rectolive Q10_stay Q21_a_goodplus Q21_b_goodplus Q21_c_goodplus Q21_d_goodplus Q21_e_goodplus Q21_f_goodplus Q52_comfortable Q54_lessthan2 Q55 Q57 Q27 Q28_1 Q28_4 Q47_c_goodplus Q42 Q44_a Q44_b Q44_c Q44_i Q49_less Q49_more Q49_eq Q35_a_highpriorityplus Q35_b_highpriorityplus  Q35_c_highpriorityplus Q35_d_highpriorityplus Q35_e_highpriorityplus Q35_f_highpriorityplus Q35_g_highpriorityplus Q35_h_highpriorityplus  Q35_i_highpriorityplus Q35_j_highpriorityplus Q35_k_highpriorityplus Q35_l_highpriorityplus Q34_fairplus Q33_littleorno Q22_onceayear {

svy,vce(jackknife):mean `var'

*get mean
mata b=st_matrix("e(b)")'
mata b

mata se=sqrt(diagonal(st_matrix("e(V)")))
mata se

* Send b, se back to stata
mata st_matrix("b",b)
mata st_matrix("se",se) 

*add n's 
mata n=st_matrix("e(_N)")'
mata n

mata res=b,se, n

*Send the matrix to stata as a variable named result; list the matrix:

mata st_matrix("result",res)
matrix list result

*Then this code writes the matrix result to a spreadsheet in excel:
* add new column for Ns - 

putexcel set d:\dcdata\libraries\voices\prog\Jurisdiction_Tables, sheet(DMV) modify
putexcel b1=("DMV")
putexcel c1=("SE")
putexcel d1=("#N")
putexcel b`r'=matrix(result[.,1..3])
local r=`r'+1
}
mata: mata clear


log close
