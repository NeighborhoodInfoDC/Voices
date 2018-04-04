version 14              // Set Version number for backward compatibility
set more off            // Disable partitioned output
clear all               // Start with a clean slate
set linesize 120        // Line size limit to make output more readable
macro drop _all         // clear all macros
capture log close       // Close existing log files
set trace off			// Disable debugger
set matsize 11000		// Define matrix size 
set maxvar 32767, perm  // Define max variables
set scheme s1color, perm //Define color scheme for graphs
log using "D:\DCDATA\Libraries\Voices\Prog\Merge replicate weights with voices_2017_nonopen_recode.log", replace 
*****************************************************************************
* 
* Program: 5 jurisdictional comparison tables.do
* Library: Voices 
* Project: VoicesDMV 5 jurisdictional briefs
* Author: Yipeng Su
* Created: 4/3/2018
* Version: Stata/MP 15
* Environment: Windows:
* Description: 
*
* Modifications: 

**------------------------------------------------------------------------------
* Directories
**------------------------------------------------------------------------------
global surveytdata "L:\Libraries\Voices\Data\voices_2017_nonopen_recode"
global repweights "L:\Libraries\Voices\Raw\VoicesDMVSurvey2017_replicatewts"
global dodir "`D:\DCDATA\Libraries\Voices\Prog"
global project "D:\DCDATA\Libraries\Voices"
global output "D:\DCDATA\Libraries\Voices\Data"

global time : di %tcCCYYNNDD!_HHMMSS clock("`c(current_date)'`c(current_time)'","DMYhms")
global date: display %td_CCYYNNDD date(c(current_date), "DMY")


**-------------------------------------

**------------------------------------------------------------------------------
* Merge voices_2017_nonopen_recode with VoicesDMVSurvey2017_replicatewts
**------------------------------------------------------------------------------
use "${surveytdata}.dta", clear
merge 1:1 CaseID using "${repweights}.dta"
sort CaseID 
cd "${output}"
save voices_2017_nonopen_recode_replicateweighted.dta, replace

**------------------------------------------------------------------------------
*Save
**------------------------------------------------------------------------------
capture log close
