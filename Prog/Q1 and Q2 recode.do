
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
* Modifications: 
*/
**Use raw open eneded file
use "L:\Libraries\Voices\Raw\Q1.DTA", clear
rename CaseID caseid

**Merge recode dataset
**"Q1_recode CGH.dta" is the STATA version of "Q1_recode CGH.xls", a munaul recode dataset produced in Excel
merge 1:m caseid using "L:\Libraries\Voices\Raw\Q1_recode CGH.dta"

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
merge 1:1 caseid using "L:\Libraries\Voices\Raw\Q1_recode values.dta"

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
gen multi = 1 if total_list==2 | total_list==3
replace multi = 0 if total_list==0 | total_list==1 
gen no_resp = 1 if total_list==0
replace no_resp = 0 if total_list>=1 

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

**Merge recode dataset
**"Q2_recode CGH.dta" is the STATA version of "Q2_recode CGH.xls", a munaul recode dataset produced in Excel
merge 1:m caseid using "L:\Libraries\Voices\Raw\Q2_recode CGH.dta"

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
merge 1:1 caseid using "L:\Libraries\Voices\Raw\Q2_recode values.dta"

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
gen multi = 1 if total_list==2 | total_list==3
replace multi = 0 if total_list==0 | total_list==1 
gen no_resp = 1 if total_list==0
replace no_resp = 0 if total_list>=1 

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
save "L:\Libraries\Voices\Raw\Q2_recode final.dta", replace
**export excel using "L:\Libraries\Voices\Raw\Q2_recode final.xls", firstrow(variables) replace

**create CVS file to merge with SAS program
use "L:\Libraries\Voices\Raw\Q1_recode final.DTA", clear
merge 1:1 caseid using "L:\Libraries\Voices\Raw\Q2_recode final.dta", keepusing(Q2_1 Q2_2 Q2_3 Q2_4 Q2_5 Q2_6 Q2_7 Q2_8 Q2_9 Q2_10 Q2_11) nogenerate
drop total_list Q1

**drop missing value
drop if caseid==""
export delimited using "L:\Libraries\Voices\Data\Voices_2017_q1_q2_recode.csv", replace
