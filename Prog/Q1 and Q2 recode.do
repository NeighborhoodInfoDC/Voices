
clear
set more off

*log using "L:\Libraries\Voices\Prog\survey data table generation.log", replace 
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
merge 1:m caseid using "L:\Libraries\Voices\Raw\Q1_recode CGH.dta"

**replace X with 1, missing with 0
foreach m in dc mc pg fc nv md va dmv ot Area city{
replace `m' = "1" if `m'=="X" |`m'=="x" 
replace `m' = "0" if `m'==""
destring `m', replace
}

**collaspe recode to 1,0 for each recode category
collapse (max) dc mc pg fc nv md va dmv ot Area city, by(caseid)

save "L:\Libraries\Voices\Raw\Q1_recode values.dta", replace

**Merge back to original raw file
use "L:\Libraries\Voices\Raw\Q1.DTA", clear
rename CaseID caseid
merge 1:1 caseid using "L:\Libraries\Voices\Raw\Q1_recode values.dta"

**recode multiple response types. 

**save final file
save "L:\Libraries\Voices\Raw\Q1_recode final.dta", replace
export excel using "L:\Libraries\Voices\Raw\Q1_recode final.xls", firstrow(variables) replace

***Q2 recode***
**Use raw open eneded file
use "L:\Libraries\Voices\Raw\Q2.DTA", clear
rename CaseID caseid
merge 1:m caseid using "L:\Libraries\Voices\Raw\Q2_recode CGH.dta"

**replace X with 1, missing with 0
foreach m in dc mc pg fc nv md va dmv ot Area City capital same{
replace `m' = "1" if `m'=="X" |`m'=="x" 
replace `m' = "0" if `m'==""
destring `m', replace
}
**collaspe recode to 1,0 for each recode category
collapse (max) dc mc pg fc nv md va dmv ot Area City capital same, by(caseid)

save "L:\Libraries\Voices\Raw\Q2_recode values.dta", replace

**Merge back to original raw file

use "L:\Libraries\Voices\Raw\Q2.DTA", clear
rename CaseID caseid
merge 1:1 caseid using "L:\Libraries\Voices\Raw\Q2_recode values.dta"

**recode multiple response types. 

**save final file
save "L:\Libraries\Voices\Raw\Q2_recode final.dta", replace
export excel using "L:\Libraries\Voices\Raw\Q2_recode final.xls", firstrow(variables) replace

