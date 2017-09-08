

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
