
clear
set more off
log using "D:\DCDATA\Libraries\Voices\Prog\Q1 and Q2 recode.log", replace 

/* *****************************************************************************
* 
* Program: Q1 and Q2 recode.do
* Library: Voices 
* Project: VoicesDMV 2017
* Author: CARL HEDMAN
* Created: 10/6/2017
* Version: Stata/MP 15
* Environment: Windows:
* Description: 
*
*Modifications: 10/31/17 LH - replace raw recodes in Excel with PAT versions
*/
**Use raw open eneded file
use "L:\Libraries\Voices\Raw\Q1.DTA", clear
rename CaseID caseid
/*there is a blank row in Q1.DTA - dropping row*/ 
drop if caseid=="" 
destring caseid, replace

**Merge recode dataset
**"Q1_recode CGH.dta" is the STATA version of "Q1_recode CGH.xls", a munaul recode dataset produced in Excel
**"Q1_recode CGH_PAT" is the STATA version of "Q1_recode CGH_PAT.xlsx" a manual recode dataset produced in Excel and updates "Q1_recode CGH"
merge 1:m caseid using "L:\Libraries\Voices\Raw\Q1_recode CGH_PAT.dta"

**replace X with 1, missing with 0
foreach m in dc mc pg fc nv md va dmv ot{
replace `m' = "1" if `m'=="X" |`m'=="x" 
replace `m' = "0" if `m'==""
destring `m', replace
}

**collaspe recode to 1,0 for each recode category
collapse (max) dc mc pg fc nv md va dmv ot, by(caseid)

save "L:\Libraries\Voices\Raw\Q1_recode values.dta", replace

**Merge back to original raw file
use "L:\Libraries\Voices\Raw\Q1.DTA", clear
rename CaseID caseid
destring caseid, replace
merge 1:1 caseid using "L:\Libraries\Voices\Raw\Q1_recode values.dta", keep(match)

**recode multiple response types. 
replace va = 0 if nv==1 & va==1
replace va = 0 if fc==1 & va==1
replace md = 0 if pg==1 & md==1
replace md = 0 if mc==1 & md==1
**replace DC/DMV
replace dc = 0 if dc==1 & dmv==1
drop _merge


gen total_list = dc + mc + pg + fc + nv + md + va + dmv + ot
gen multi = 1 if total_list >= 2 
replace multi = 0 if total_list==0 | total_list==1 

list caseid Q1 if total_list==0
replace dmv=1 if total_list==0 & inlist(Q1,"Here","here","Here.","Here, basically.","From here.","From here","local","locally","im from here !!!")
replace dmv=1 if total_list==0 & inlist(Q1,"from here","born and raised here","around here","i was born here.","I'm from here","I'm local")
replace dmv=1 if total_list==0 & inlist(Q1,"Right here","Local","I've lived here for the past 25+ years."," I'm from here","I would say i am a local guy.")
replace dmv=1 if total_list==0 & inlist(Q1,"I was born here.",`"`i"m a local'"')
replace pg=1 if total_list==0 & inlist(Q1,"pg","pg county")
replace dc=1 if total_list==0 & inlist(Q1,"Se dc",".D.C.","2125 32nd","SE", "southeast","I'm from southeast")
replace mc=1 if total_list==0 & inlist(Q1,"silver spring","Silver spring", "Silver spring moe")
replace ot=1 if total_list==0 & inlist(Q1,"not from here", "north carolina","international","i grew up in onio","all over from a military family","Various places, depending on the time.","Philly","Out of state")
replace ot=1 if total_list==0 & inlist(Q1,"Not from here","Not from here.","Lots of different places.", "I'm from out of state.","From everywhere, in a military family","A variety of places.","All over","All over.")
replace ot=1 if total_list==0 & inlist(Q1,"What year?  (I have been a military dependent for most of my life)","everywhere","I would tell them that I'm from everywhere because my family is military.")
replace ot=1 if total_list==0 & inlist(Q1,"no where","Nowhere in particular.","Everywhere and no where.","Earth","Lots of different places.", "I'm from the states", "all over as I grew up in a military family.") 
replace nv=1 if total_list==0 & inlist(Q1,"falls church","Old town")
replace ot=1 if total_list==0 & caseid==538 /*"I would say I am from somewhere other than here. I am not from the area, I came years ago on a whim and have been forced to stay here ever since. I have no roots her.."*/
replace dmv=1 if total_list==0 & caseid==2284 /*i"m a local*/

/**Create mutually exclusive categories
foreach n in dc mc pg fc nv md va dmv ot{
replace `n' = 0 if multi==1
}*/


drop total_list
gen total_list = dc + mc + pg + fc + nv + md + va + dmv + ot + multi

gen no_resp = 1 if total_list==0
replace no_resp = 0 if total_list>=1  

foreach n in dc mc pg fc nv md va dmv ot multi no_resp{
replace `n' = . if Q1==""
}

foreach m in dc mc pg fc nv md va dmv ot multi no_resp{
sum `m'
}

**relabel variables to follow data labeling conventions
rename dc Q1_1
rename mc Q1_2
rename pg Q1_3
rename fc Q1_4
rename nv Q1_5
rename md Q1_6
rename va Q1_7
rename dmv Q1_8
rename ot Q1_9
rename multi Q1_10
rename no_resp Q1_11


**save final file
save "L:\Libraries\Voices\Raw\Q1_recode final.dta", replace
**export excel using "L:\Libraries\Voices\Raw\Q1_recode final.xls", firstrow(variables) replace

***Q2 recode***
**Use raw open eneded file
use "L:\Libraries\Voices\Raw\Q2.DTA", clear
rename CaseID caseid
/*there is a blank row in Q2.DTA - dropping row*/ 
drop if caseid=="" 
destring caseid, replace

**Merge recode dataset
**"Q2_recode CGH.dta" is the STATA version of "Q2_recode CGH.xls", a munaul recode dataset produced in Excel
**"Q2_recode CGH_PAT.dta" is the STATA version of "Q2_recode CGH_PAT.xlsx", a manual recode dataset produced in Excel and update of "Q2_recode CGH"
merge 1:m caseid using "L:\Libraries\Voices\Raw\Q2_recode CGH_PAT.dta"

**replace X with 1, missing with 0
foreach m in dc mc pg fc nv md va dmv ot{
replace `m' = "1" if `m'=="X" |`m'=="x" 
replace `m' = "0" if `m'==""
destring `m', replace
}
**collaspe recode to 1,0 for each recode category
collapse (max) dc mc pg fc nv md va dmv ot, by(caseid)

save "L:\Libraries\Voices\Raw\Q2_recode values.dta", replace

**Merge back to original raw file

use "L:\Libraries\Voices\Raw\Q2.DTA", clear
rename CaseID caseid
destring caseid, replace
merge 1:1 caseid using "L:\Libraries\Voices\Raw\Q2_recode values.dta", keep(match)

**recode multiple response types. 
replace va = 0 if nv==1 & va==1
replace va = 0 if fc==1 & va==1
replace md = 0 if pg==1 & md==1
replace md = 0 if mc==1 & md==1
**replace DC/DMV
replace dc = 0 if dc==1 & dmv==1
drop _merge

foreach m in dc mc pg fc nv md va dmv ot{
foreach n in dc mc pg fc nv md va dmv ot{
tab `m' `n'
}
}

gen total_list = dc + mc + pg + fc + nv + md + va + dmv + ot

list caseid Q2 if total_list==0
/*merge back in Q1 for those who said "same"*/
merge 1:1 caseid using "L:\Libraries\Voices\Raw\Q1_recode final.dta", keep(match)

/*list caseid Q2 Q1 if total_list==0*/
replace mc=1 if total_list==0 & inlist(Q2,"silver spring","Silver spring", "Silver spring moe","moco area")
replace ot=1 if total_list==0 & inlist(Q2,"All over","All over.","Everywhere and no where.","I am not from here, i am visiting","I am just vist","Nowhere in particular.")
replace ot=1 if total_list==0 & inlist(Q2,"Originally, the Detroit srea","philly","Same. All over due to military.","all over, from a military family","lots of different places")
replace ot=1 if total_list==0 & inlist(Q2,"not from here", "north carolina","international","i grew up in onio","all over from a military family","Various places, depending on the time.","Philly","Out of state")
replace ot=1 if total_list==0 & inlist(Q2,"Not from here","Not from here.","Lots of different places.", "I'm from out of state.","From everywhere, in a military family","A variety of places.","All over","All over.")
replace ot=1 if total_list==0 & inlist(Q2,"What year?  (I have been a military dependent for most of my life)","everywhere","I would tell them that I'm from everywhere because my family is military.")
replace ot=1 if total_list==0 & inlist(Q2,"no where","Nowhere in particular.","Everywhere and no where.","Earth","Lots of different places.", "I'm from the states", "all over as I grew up in a military family.") 
replace ot=1 if total_list==0 & inlist(Q2,"Non Local","Out of town")
replace dc=1 if total_list==0 & inlist(Q2,"Dc all day","d.c.","southeast","4th st se") 
replace nv=1 if total_list==0 & inlist(Q2,"NE VA")
replace dmv=1 if total_list==0 & inlist(Q2,"here       I am","I've lived here since I was 2 1/2.")
replace dmv=1 if total_list==0 & inlist(Q2,"Here","here","Here.","Here, basically.","From here.","From here","local","locally","im from here !!!")
replace dmv=1 if total_list==0 & inlist(Q2,"from here","born and raised here","around here","i was born here.","I'm from here","I'm local")
replace dmv=1 if total_list==0 & inlist(Q2,"Right here","Local","I've lived here for the past 25+ years."," I'm from here","I would say i am a local guy.")
replace dmv=1 if total_list==0 & inlist(Q2,"I was born here.",`"`i"m a local'"',"i am local from here","I live in the close proximity to the presidential headquarters")

gen same=0
replace same=1 if total_list==0 & inlist(Q2,"I would say the same thing","I would say the same thing as before.","Same","Same as before","Same thing","Same thing as the prior answer.")
replace same=1 if total_list==0 & inlist(Q2,"See my answer to the previous question.","The same thing","The same thing.","i would tell them the same thing.","same")
replace same=1 if total_list==0 & inlist(Q2,"same as previous question","same as prior response","the same thing","I would tell them the same thing that I said from the previous question.")
replace same=1 if total_list==0 & inlist(Q2,"The same thing I said in the last answer.","My answer would not change.  See previous answer.","I respond the same way as I mentioned in the previous answer.")
replace same=1 if total_list==0 & inlist(Q2,"See my answer to the previous question.","I would still say the same thing as my last answer.","The same answer as in the previous question.")
replace same=1 if total_list==0 & caseid==457 /*exactly the same as in the prior answer, since it's a. true and b. ...*/

replace dc=1 if same==1 & Q1_1==1
replace mc=1 if same==1 & Q1_2==1
replace pg=1 if same==1 & Q1_3==1
replace fc=1 if same==1 & Q1_4==1
replace nv=1 if same==1 & Q1_5==1
replace md=1 if same==1 & Q1_6==1
replace va=1 if same==1 & Q1_7==1
replace dmv=1 if same==1 & Q1_8==1
replace ot=1 if same==1 & Q1_9==1

drop total_list 
gen total_list = dc + mc + pg + fc + nv + md + va + dmv + ot

gen multi = 1 if total_list >=2
replace multi = 0 if total_list==0 | total_list==1 
replace multi = 1 if same==1 & Q1_10==1

drop same _merge

/**Create mutually exclusive categories
foreach n in dc mc pg fc nv md va dmv ot{
replace `n' = 0 if multi==1
}*/

drop total_list 
gen total_list = dc + mc + pg + fc + nv + md + va + dmv + ot + multi

gen no_resp = 1 if total_list==0
replace no_resp = 0 if total_list>=1  

foreach n in dc mc pg fc nv md va dmv ot multi no_resp{
replace `n' = . if Q2==""
}

foreach m in dc mc pg fc nv md va dmv ot multi no_resp{
sum `m'
}

**relabel variables to follow data labeling conventions
rename dc Q2_1
rename mc Q2_2
rename pg Q2_3
rename fc Q2_4
rename nv Q2_5
rename md Q2_6
rename va Q2_7
rename dmv Q2_8
rename ot Q2_9
rename multi Q2_10
rename no_resp Q2_11

**save final file
drop Q1 Q2 total_list

save "L:\Libraries\Voices\Raw\Q1_Q2_recode final.dta", replace

export delimited using "L:\Libraries\Voices\Raw\Voices_2017_q1_q2_recode.csv", replace

log close
