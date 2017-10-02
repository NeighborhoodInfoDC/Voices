clear
set more off

*log using "L:\Libraries\Voices\Prog\test prog for means.log", replace 
log using "D:\DCDATA\Libraries\Voices\Prog\test prog for means.log", replace 

/* *****************************************************************************
* 
* Program: Test Prog for Means.do
* Library: Voices 
* Project: VoicesDMV 2017
* Author: Leah Hendey
* Created: 9/10/2017
* Version: Stata/MP 15
* Environment: Windows
* Description: 
*
* Modifications: 
* *****************************************************************************/

di c(current_date)
di c(current_time)

global raw "L:\Libraries\Voices\Raw\UrbanInstitute_VoicesDMVSurvey2017_Client_08292017\"
global voices_l "D:\DCDATA\Libraries\Voices\Data\"
global voices_r "L:\Libraries\Voices\Data\"

use "${voices_l}Voices_2017_Formatted.dta", clear

global varlist "Q41A Q41B thriving suffering struggling"

mean $varlist [aweight=weightpop], over(geo)

* Pull down e(b), e(V); take square root of the diagonal of e(V).  Transpose e(b) because it was a row vector originally and I’m
* creating se as a column vector.

mata b=st_matrix("e(b)")'
mata b

*rerun means to get unweighted variance 
mean $varlist , over(geo)
mata se=sqrt(diagonal(st_matrix("e(V)")))
mata se

* create matrix with DEFF for geography
mata g=(1.323\1.595\1.397\1.416\1.276)
mata g
mata d=(g\g\g\g\g)
mata d

mata t=se:*d
mata t

****figure out how to get var list and over list into matrix
*foreach y in $varlist(
*	mata v_`y'= ("`y'",1\"`y'",2\"`y'",3\"`y'",4\"`y'",5)
*}

		
* Send b, se, and t back to stata
mata st_matrix("b",b)
mata st_matrix("se",se)
mata st_matrix("t",t)


mata res=b,se,t

*Send the matrix to stata as a variable named result; list the matrix:

mata st_matrix("result",res)
matrix list result

*Then this code writes the matrix result to a spreadsheet in excel:

putexcel set d:\dcdata\libraries\voices\prog\temp\test, sheet(testsheet) modify
putexcel b1=("b")
putexcel c1=("se")
putexcel d1=("t")
putexcel b2=matrix(result[.,1..3])

mata: mata clear

