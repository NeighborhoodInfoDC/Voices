clear
set more off

*log using "L:\Libraries\Voices\Prog\survey data table generation.log", replace 
log using "D:\DCDATA\Libraries\Voices\Prog\open ended other recode.log", replace 

/* *****************************************************************************
* Program: open ended other recode.do
* Library: Voices 
* Project: VoicesDMV 2017
* Author: CARL HEDMAN
* Created: 10/9/2017
* Version: Stata/MP 15
* Environment: Windows:
* Description: 
*
* Modifications: 
*/

/*
**create data files for recode
foreach x in Q20_Text Q23_Text Q28_Text Q44_Text Q45_Text Q61_Text Q63_Text Q79_Text{
use "L:\Libraries\Voices\Raw\UrbanInstitute_VoicesDMVSurvey2017_Client_08292017\UrbanInstitue_VoicesDMVSurvey2017_Client_STATA_Formatted.dta", clear 
keep `x'
keep if `x' !=" "
export excel using "L:\Libraries\Voices\Raw\ `x'.xls", firstrow(variables) replace
}
*/

use "L:\Libraries\Voices\Raw\UrbanInstitute_VoicesDMVSurvey2017_Client_08292017\UrbanInstitue_VoicesDMVSurvey2017_Client_STATA_Formatted.dta", clear 

**Q20 recode
replace Q20_f = Q20_i if Q20_Text =="Aggressive Drivers" & Q20_f==1
replace Q20_f = Q20_i  if Q20_Text =="Accidents" & Q20_f==1
replace Q20_f = Q20_i if Q20_Text =="Washington drivers" & Q20_f==1
replace Q20_f = Q20_i if Q20_Text =="People her seem to (including myself) limit where they go and when becauseof poor public transit, crowded roads, etc." & Q20_f==1
replace Q20_f = Q20_i if Q20_Text =="incosiderate drivers" & Q20_f==1
replace Q20_f = Q20_i if Q20_Text =="accident" & Q20_f==1
replace Q20_f = Q20_i if Q20_Text =="Accidents" & Q20_f==1
replace Q20_f = Q20_i if Q20_Text =="stupid drivers" & Q20_f==1
replace Q20_a = Q20_i if Q20_Text =="Metro reliability" & Q20_a==1
replace Q20_f = Q20_i if Q20_Text =="beltway" & Q20_f==1
replace Q20_a = Q20_i if Q20_Text =="Metro Problems" & Q20_a==1
replace Q20_f = Q20_i if Q20_Text =="Gridlock" & Q20_f==1
replace Q20_a = Q20_i if Q20_Text =="Metro problems" & Q20_a==1
replace Q20_f = Q20_i if Q20_Text =="accident" & Q20_f==1
replace Q20_a = Q20_i if Q20_Text =="Metro SafeTrack" & Q20_a==1
replace Q20_a = Q20_i if Q20_Text =="Problems with Metro" & Q20_a==1
replace Q20_g = Q20_i if Q20_Text =="Sidewalks are damaged" & Q20_g==1
replace Q20_g = Q20_i if Q20_Text =="Road work/closures" & Q20_g==1
replace Q20_f = Q20_i if Q20_Text =="accidents" & Q20_f==1
replace Q20_a = Q20_i if Q20_Text =="Safetrack" & Q20_a==1
replace Q20_a = Q20_i if Q20_Text =="Metro problems" & Q20_a==1
replace Q20_g = Q20_i if Q20_Text =="Road closures" & Q20_g==1
replace Q20_g = Q20_i if Q20_Text =="road closures" & Q20_g==1
replace Q20_a = Q20_i if Q20_Text =="Metro" & Q20_a==1
replace Q20_a = Q20_i if Q20_Text =="Metro Problems" & Q20_a==1
replace Q20_f = Q20_i if Q20_Text =="Road closures due to public events, demonstrations, etc." & Q20_f==1
replace Q20_f = Q20_i if Q20_Text =="Unskilledlled drivers" & Q20_f==1
replace Q20_a = Q20_i if Q20_Text =="metro shutdown" & Q20_a==1
replace Q20_a = Q20_i if Q20_Text =="Metro unavailable" & Q20_a==1
replace Q20_a = Q20_i if Q20_Text =="public transportation delayed or stations closed, construction" & Q20_a==1
replace Q20_f = Q20_i if Q20_Text =="Poor drivers! Do not follow the traffic laws!" & Q20_f==1
replace Q20_a = Q20_i if Q20_Text =="Unreliability of Metro" & Q20_a==1
replace Q20_g = Q20_i if Q20_Text =="If there isn't road work on the major highways, there are local roads being torn up and not properly repaired." & Q20_g==1
replace Q20_f = Q20_i if Q20_Text =="bad roadway design for the area" & Q20_f==1
replace Q20_a = Q20_i if Q20_Text =="Subway breakdowns and closures" & Q20_a==1
replace Q20_a = Q20_i if Q20_Text =="metro rails improvements" & Q20_a==1
replace Q20_a = Q20_i if Q20_Text =="Bad metro system" & Q20_a==1
replace Q20_g = Q20_i if Q20_Text =="Blocked streets" & Q20_g==1
replace Q20_g = Q20_i if Q20_Text =="road closures" & Q20_g==1
replace Q20_a = Q20_i if Q20_Text =="Metro repairs" & Q20_a==1
replace Q20_a = Q20_i if Q20_Text =="Pubic transportation was totally unreliable" & Q20_a==1
replace Q20_a = Q20_i if Q20_Text =="Metro rail" & Q20_a==1
replace Q20_a = Q20_i if Q20_Text =="public transportation unreliable" & Q20_a==1
replace Q20_a = Q20_i if Q20_Text =="Careless incidents caused because of poor systems or operation of rails buses etc" & Q20_a==1
replace Q20_a = Q20_i if Q20_Text =="no metro stop" & Q20_a==1
replace Q20_a = Q20_i if Q20_Text =="Metro" & Q20_a==1

replace Q20_i = . if Q20_Text =="na"
replace Q20_i = . if Q20_Text =="hyhhhhh"
replace Q20_i = . if Q20_Text =="no"
replace Q20_i = . if Q20_Text =="none"
replace Q20_i = . if Q20_Text =="N/A"
replace Q20_i = . if Q20_Text =="None"

**recode other to be never
replace Q20_i= 1 if Q20_Text =="Aggressive Drivers" & Q20_f==1
replace Q20_i= 1  if Q20_Text =="Accidents" & Q20_f==1
replace Q20_i= 1 if Q20_Text =="Washington drivers" & Q20_f==1
replace Q20_i= 1 if Q20_Text =="People her seem to (including myself) limit where they go and when becauseof poor public transit, crowded roads, etc." & Q20_f==1
replace Q20_i= 1 if Q20_Text =="incosiderate drivers" & Q20_f==1
replace Q20_i= 1 if Q20_Text =="accident" & Q20_f==1
replace Q20_i= 1 if Q20_Text =="Accidents" & Q20_f==1
replace Q20_i= 1 if Q20_Text =="stupid drivers" & Q20_f==1
replace Q20_i= 1 if Q20_Text =="Metro reliability" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="beltway" & Q20_f==1
replace Q20_i= 1 if Q20_Text =="Metro Problems" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="Gridlock" & Q20_f==1
replace Q20_i= 1 if Q20_Text =="Metro problems" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="accident" & Q20_f==1
replace Q20_i= 1 if Q20_Text =="Metro SafeTrack" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="Problems with Metro" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="Sidewalks are damaged" & Q20_g==1
replace Q20_i= 1 if Q20_Text =="Road work/closures" & Q20_g==1
replace Q20_i= 1 if Q20_Text =="accidents" & Q20_f==1
replace Q20_i= 1 if Q20_Text =="Safetrack" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="Metro problems" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="Road closures" & Q20_g==1
replace Q20_i= 1 if Q20_Text =="road closures" & Q20_g==1
replace Q20_i= 1 if Q20_Text =="Metro" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="Metro Problems" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="Road closures due to public events, demonstrations, etc." & Q20_f==1
replace Q20_i= 1 if Q20_Text =="Unskilledlled drivers" & Q20_f==1
replace Q20_i= 1 if Q20_Text =="metro shutdown" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="Metro unavailable" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="public transportation delayed or stations closed, construction" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="Poor drivers! Do not follow the traffic laws!" & Q20_f==1
replace Q20_i= 1 if Q20_Text =="Unreliability of Metro" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="If there isn't road work on the major highways, there are local roads being torn up and not properly repaired." & Q20_g==1
replace Q20_i= 1 if Q20_Text =="bad roadway design for the area" & Q20_f==1
replace Q20_i= 1 if Q20_Text =="Subway breakdowns and closures" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="metro rails improvements" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="Bad metro system" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="Blocked streets" & Q20_g==1
replace Q20_i= 1 if Q20_Text =="road closures" & Q20_g==1
replace Q20_i= 1 if Q20_Text =="Metro repairs" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="Pubic transportation was totally unreliable" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="Metro rail" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="public transportation unreliable" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="Careless incidents caused because of poor systems or operation of rails buses etc" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="no metro stop" & Q20_a==1
replace Q20_i= 1 if Q20_Text =="Metro" & Q20_a==1


**Q23 recode
replace Q23_2 = 1 if Q23_Text == "I don't know what I don't know."
replace Q23_2 = 1 if Q23_Text == "dont know any"
replace Q23_1 = 1 if Q23_Text == "At the moment I am not in need of any services"
replace Q23_2 = 1 if Q23_Text == "i dont know the services where are they"
replace Q23_2 = 1 if Q23_Text == "im not sure what service i would need that a nonprofit would provide"
replace Q23_1 = 1 if Q23_Text == "Not in need at this time"
replace Q23_1 = 1 if Q23_Text == "No Time for this"
replace Q23_1 = 1 if Q23_Text == "Don't need any at this time"
replace Q23_2 = 1 if Q23_Text == "don't know what they are"
replace Q23_1 = 1 if Q23_Text == "Not really looking for support from those services (will be in the future though while in school)"
replace Q23_2 = 1 if Q23_Text == "I don't know what services nonprofits provide that I may need"
replace Q23_2 = 1 if Q23_Text == "Don't know about them"
replace Q23_5 = 1 if Q23_Text == "Doesn't fit with work schedule"
replace Q23_1 = 1 if Q23_Text == "self reliant"

replace Q23_6 = 0 if Q23_Text == "I don't know what I don't know."
replace Q23_6 = 0 if Q23_Text == "dont know any"
replace Q23_6 = 0 if Q23_Text == "At the moment I am not in need of any services"
replace Q23_6 = 0 if Q23_Text == "i dont know the services where are they"
replace Q23_6 = 0 if Q23_Text == "im not sure what service i would need that a nonprofit would provide"
replace Q23_6 = 0 if Q23_Text == "Not in need at this time"
replace Q23_6 = 0 if Q23_Text == "No Time for this"
replace Q23_6 = 0 if Q23_Text == "Don't need any at this time"
replace Q23_6 = 0 if Q23_Text == "don't know what they are"
replace Q23_6 = 0 if Q23_Text == "Not really looking for support from those services (will be in the future though while in school)"
replace Q23_6 = 0 if Q23_Text == "I don't know what services nonprofits provide that I may need"
replace Q23_6 = 0 if Q23_Text == "Don't know about them"
replace Q23_6 = 0 if Q23_Text == "Doesn't fit with work schedule"
replace Q23_6 = 0 if Q23_Text == "self reliant"

replace Q23_6 = . if Q23_Text == "I don't entirely understand what you're asking"
replace Q23_6 = . if Q23_Text == "I am not sure what services you are speaking of"
replace Q23_6 = . if Q23_Text == "not sure what the question is referring to"
replace Q23_6 = . if Q23_Text == "Idk"
replace Q23_6 = . if Q23_Text == "Dnk"
replace Q23_6 = . if Q23_Text == "Unsure?"
replace Q23_6 = . if Q23_Text == "not sure"
replace Q23_6 = . if Q23_Text == "I do not know what services you are referring to"
replace Q23_6 = . if Q23_Text == "don't understand the question"
replace Q23_6 = . if Q23_Text == "not sure what you're asking"
replace Q23_6 = . if Q23_Text == "Not sure what you're referring to."


**Q28
gen Q28_11 = 0
label var Q28_11 "Military or job transfer/relocation"

replace Q28_11 =1 if Q28_Text=="military orders"
replace Q28_11 =1 if Q28_Text=="Job relocation"
replace Q28_11 =1 if Q28_Text=="Moved for work"
replace Q28_11 =1 if Q28_Text=="job relocation"
replace Q28_11 =1 if Q28_Text=="Military"
replace Q28_11 =1 if Q28_Text=="Military"
replace Q28_11 =1 if Q28_Text=="Work"
replace Q28_11 =1 if Q28_Text=="Got a new job"
replace Q28_11 =1 if Q28_Text=="Military"
replace Q28_11 =1 if Q28_Text=="New Job"
replace Q28_11 =1 if Q28_Text=="Military"
replace Q28_11 =1 if Q28_Text=="to follow a job/school"
replace Q28_11 =1 if Q28_Text=="parents got a job elsewhere"
replace Q28_11 =1 if Q28_Text=="Job reassignment"
replace Q28_11 =1 if Q28_Text=="military orders"
replace Q28_11 =1 if Q28_Text=="job relocation"
replace Q28_11 =1 if Q28_Text=="military"
replace Q28_11 =1 if Q28_Text=="New job"
replace Q28_11 =1 if Q28_Text=="Military transfer out of the area"
replace Q28_11 =1 if Q28_Text=="military"
replace Q28_11 =1 if Q28_Text=="new job in another location"
replace Q28_11 =1 if Q28_Text=="military orders"
replace Q28_11 =1 if Q28_Text=="Job change"
replace Q28_11 =1 if Q28_Text=="Better Job"
replace Q28_11 =1 if Q28_Text=="army"
replace Q28_11 =1 if Q28_Text=="Military orders"
replace Q28_11 =1 if Q28_Text=="Job transfer"
replace Q28_11 =1 if Q28_Text=="military families"
replace Q28_11 =1 if Q28_Text=="Military reassignment"
replace Q28_11 =1 if Q28_Text=="job relocation"
replace Q28_11 =1 if Q28_Text=="New job"
replace Q28_11 =1 if Q28_Text=="Job Transfer or Retirement"
replace Q28_1 =1 if Q28_Text=="DC is too expensive and didn't offer jobs"
replace Q28_11 =1 if Q28_Text=="Job"
replace Q28_11 =1 if Q28_Text=="Military"
replace Q28_5 =1 if Q28_Text=="eviction"
replace Q28_8 =1 if Q28_Text=="devastating fire destroyed residence"
replace Q28_11 =1 if Q28_Text=="Job relocation"
replace Q28_11 =1 if Q28_Text=="Military reassignment"
replace Q28_11 =1 if Q28_Text=="Changed jobs"
replace Q28_11 =1 if Q28_Text=="New job put of state"
replace Q28_11 =1 if Q28_Text=="New Job"
replace Q28_7 =1 if Q28_Text=="Home sold by owner"
replace Q28_11 =1 if Q28_Text=="better job"
replace Q28_11 =1 if Q28_Text=="Military transfer"
replace Q28_11 =1 if Q28_Text=="military"
replace Q28_11 =1 if Q28_Text=="Transfer"
replace Q28_11 =1 if Q28_Text=="job relocation"
replace Q28_11 =1 if Q28_Text=="Job transfer"
replace Q28_7 =1 if Q28_Text=="Landlord sold property"
replace Q28_11 =1 if Q28_Text=="Reassigned"
replace Q28_7 =1 if Q28_Text=="Short sale of home"
replace Q28_11 =1 if Q28_Text=="Transferred in their company"
replace Q28_11 =1 if Q28_Text=="job relocated them"
replace Q28_11 =1 if Q28_Text=="Work"
replace Q28_11 =1 if Q28_Text=="Military transferred them"
replace Q28_6 =1 if Q28_Text=="foreclosure"
replace Q28_11 =1 if Q28_Text=="Employment"
replace Q28_11 =1 if Q28_Text=="Army"
replace Q28_1 =1 if Q28_Text=="Area is too expensive"
replace Q28_11 =1 if Q28_Text=="job offer elsewhere"
replace Q28_11 =1 if Q28_Text=="military"
replace Q28_1 =1 if Q28_Text=="To expisive to live in."
replace Q28_11 =1 if Q28_Text=="new job assignment"
replace Q28_11 =1 if Q28_Text=="Relocated by their job"
replace Q28_11 =1 if Q28_Text=="mandatory work replacement"
replace Q28_11 =1 if Q28_Text=="Military move"
replace Q28_11 =1 if Q28_Text=="Military assignment"
replace Q28_11 =1 if Q28_Text=="Career"
replace Q28_11 =1 if Q28_Text=="new job relocation"
replace Q28_11 =1 if Q28_Text=="Military"
replace Q28_11 =1 if Q28_Text=="got new job"
replace Q28_11 =1 if Q28_Text=="company transfer"
replace Q28_11 =1 if Q28_Text=="Military"
replace Q28_11 =1 if Q28_Text=="Got a job in another state"
replace Q28_11 =1 if Q28_Text=="New job"

replace Q28_9 = 0 if Q28_Text=="military orders"
replace Q28_9 = 0 if Q28_Text=="Job relocation"
replace Q28_9 = 0 if Q28_Text=="Moved for work"
replace Q28_9 = 0 if Q28_Text=="job relocation"
replace Q28_9 = 0 if Q28_Text=="Military"
replace Q28_9 = 0 if Q28_Text=="Military"
replace Q28_9 = 0 if Q28_Text=="Work"
replace Q28_9 = 0 if Q28_Text=="Got a new job"
replace Q28_9 = 0 if Q28_Text=="Military"
replace Q28_9 = 0 if Q28_Text=="New Job"
replace Q28_9 = 0 if Q28_Text=="Military"
replace Q28_9 = 0 if Q28_Text=="to follow a job/school"
replace Q28_9 = 0 if Q28_Text=="parents got a job elsewhere"
replace Q28_9 = 0 if Q28_Text=="Job reassignment"
replace Q28_9 = 0 if Q28_Text=="military orders"
replace Q28_9 = 0 if Q28_Text=="job relocation"
replace Q28_9 = 0 if Q28_Text=="military"
replace Q28_9 = 0 if Q28_Text=="New job"
replace Q28_9 = 0 if Q28_Text=="Military transfer out of the area"
replace Q28_9 = 0 if Q28_Text=="military"
replace Q28_9 = 0 if Q28_Text=="new job in another location"
replace Q28_9 = 0 if Q28_Text=="military orders"
replace Q28_9 = 0 if Q28_Text=="Job change"
replace Q28_9 = 0 if Q28_Text=="Better Job"
replace Q28_9 = 0 if Q28_Text=="army"
replace Q28_9 = 0 if Q28_Text=="Military orders"
replace Q28_9 = 0 if Q28_Text=="Job transfer"
replace Q28_9 = 0 if Q28_Text=="military families"
replace Q28_9 = 0 if Q28_Text=="Military reassignment"
replace Q28_9 = 0 if Q28_Text=="job relocation"
replace Q28_9 = 0 if Q28_Text=="New job"
replace Q28_9 = 0 if Q28_Text=="Job Transfer or Retirement"
replace Q28_9 = 0 if Q28_Text=="DC is too expensive and didn't offer jobs"
replace Q28_9 = 0 if Q28_Text=="Job"
replace Q28_9 = 0 if Q28_Text=="Military"
replace Q28_9 = 0 if Q28_Text=="eviction"
replace Q28_9 = 0 if Q28_Text=="devastating fire destroyed residence"
replace Q28_9 = 0 if Q28_Text=="Job relocation"
replace Q28_9 = 0 if Q28_Text=="Military reassignment"
replace Q28_9 = 0 if Q28_Text=="Changed jobs"
replace Q28_9 = 0 if Q28_Text=="New job put of state"
replace Q28_9 = 0 if Q28_Text=="New Job"
replace Q28_9 = 0 if Q28_Text=="Home sold by owner"
replace Q28_9 = 0 if Q28_Text=="better job"
replace Q28_9 = 0 if Q28_Text=="Military transfer"
replace Q28_9 = 0 if Q28_Text=="military"
replace Q28_9 = 0 if Q28_Text=="Transfer"
replace Q28_9 = 0 if Q28_Text=="job relocation"
replace Q28_9 = 0 if Q28_Text=="Job transfer"
replace Q28_9 = 0 if Q28_Text=="Landlord sold property"
replace Q28_9 = 0 if Q28_Text=="Reassigned"
replace Q28_9 = 0 if Q28_Text=="Short sale of home"
replace Q28_9 = 0 if Q28_Text=="Transferred in their company"
replace Q28_9 = 0 if Q28_Text=="job relocated them"
replace Q28_9 = 0 if Q28_Text=="Work"
replace Q28_9 = 0 if Q28_Text=="Military transferred them"
replace Q28_9 = 0 if Q28_Text=="foreclosure"
replace Q28_9 = 0 if Q28_Text=="Employment"
replace Q28_9 = 0 if Q28_Text=="Army"
replace Q28_9 = 0 if Q28_Text=="Area is too expensive"
replace Q28_9 = 0 if Q28_Text=="job offer elsewhere"
replace Q28_9 = 0 if Q28_Text=="military"
replace Q28_9 = 0 if Q28_Text=="To expisive to live in."
replace Q28_9 = 0 if Q28_Text=="new job assignment"
replace Q28_9 = 0 if Q28_Text=="Relocated by their job"
replace Q28_9 = 0 if Q28_Text=="mandatory work replacement"
replace Q28_9 = 0 if Q28_Text=="Military move"
replace Q28_9 = 0 if Q28_Text=="Military assignment"
replace Q28_9 = 0 if Q28_Text=="Career"
replace Q28_9 = 0 if Q28_Text=="new job relocation"
replace Q28_9 = 0 if Q28_Text=="Military"
replace Q28_9 = 0 if Q28_Text=="got new job"
replace Q28_9 = 0 if Q28_Text=="company transfer"
replace Q28_9 = 0 if Q28_Text=="Military"
replace Q28_9 = 0 if Q28_Text=="Got a job in another state"
replace Q28_9 = 0 if Q28_Text=="New job"

**Q44 
replace Q44_j=1 if Q44_Text== "I'm Deaf"
replace Q44_f=1 if Q44_Text== "looks"
replace Q44_f=1 if Q44_Text== "hair"
replace Q44_a=1 if Q44_Text== "Not a minority"
replace Q44_a=1 if Q44_Text== "Being a non-caucasion in majority white company"

replace Q44_n=2 if Q44_Text== "I'm Deaf"
replace Q44_n=2 if Q44_Text== "looks"
replace Q44_n=2 if Q44_Text== "hair"
replace Q44_n=2 if Q44_Text== "Not a minority"
replace Q44_n=2 if Q44_Text== "Being a non-caucasion in majority white company"

replace Q44_n =. if Q44_Text =="na"
replace Q44_n =. if Q44_Text =="No"

**Q45
replace Q45_f = 1 if Q45_Text== "Post office"
replace Q45_f = 1 if Q45_Text== "Law enforcement"
replace Q45_f = 1 if Q45_Text== "The President and the Congress"
replace Q45_c = 1 if Q45_Text== "in school,because i don't speak spanish"
replace Q45_h = 1 if Q45_Text== "in social situations that recognizer only some minorities as subject to discrimination"
replace Q45_h = 1 if Q45_Text== "Comments by people I don't know"
replace Q45_a = 1 if Q45_Text== "Leaders of my condo association"
replace Q45_a = 1 if Q45_Text== "discrimination from other people who live in my condo association"
replace Q45_d = 1 if Q45_Text== "Work environment"

replace Q45_i = 2 if Q45_Text== "Post office"
replace Q45_i = 2 if Q45_Text== "Law enforcement"
replace Q45_i = 2 if Q45_Text== "The President and the Congress"
replace Q45_i = 2 if Q45_Text== "in school,because i don't speak spanish"
replace Q45_i = 2 if Q45_Text== "in social situations that recognizer only some minorities as subject to discrimination"
replace Q45_i = 2 if Q45_Text== "Comments by people I don't know"
replace Q45_i = 2 if Q45_Text== "Leaders of my condo association"
replace Q45_i = 2 if Q45_Text== "discrimination from other people who live in my condo association"
replace Q45_i = 2 if Q45_Text== "Work environment"

**Q61
replace Q61_i =1 if Q61_Text =="401k"
replace Q61_i =1 if Q61_Text =="401k"
replace Q61_i =1 if Q61_Text =="401k"
replace Q61_i =1 if Q61_Text =="401K"
replace Q61_i =1 if Q61_Text =="Pension"
replace Q61_i =1 if Q61_Text =="Pension"
replace Q61_i =1 if Q61_Text =="matching contributions, employee purchase program"
replace Q61_i =1 if Q61_Text =="401k"
replace Q61_i =1 if Q61_Text =="Receive pension"
replace Q61_i =1 if Q61_Text =="401K"
replace Q61_i =1 if Q61_Text =="pension"
replace Q61_i =1 if Q61_Text =="401K"

replace Q61_j =2 if Q61_Text =="401k"
replace Q61_j =2 if Q61_Text =="401k"
replace Q61_j =2 if Q61_Text =="401k"
replace Q61_j =2 if Q61_Text =="401K"
replace Q61_j =2 if Q61_Text =="Pension"
replace Q61_j =2 if Q61_Text =="Pension"
replace Q61_j =2 if Q61_Text =="matching contributions, employee purchase program"
replace Q61_j =2 if Q61_Text =="401k"
replace Q61_j =2 if Q61_Text =="Receive pension"
replace Q61_j =2 if Q61_Text =="401K"
replace Q61_j =2 if Q61_Text =="pension"
replace Q61_j =2 if Q61_Text =="401K"

replace Q61_j =. if Q61_Text =="none"
replace Q61_j =. if Q61_Text =="None"
replace Q61_j =. if Q61_Text =="na"

**Q63
gen Q63_i = .
replace Q63_i = Q63_h if Q63_Text =="age"
replace Q63_i = Q63_h if Q63_Text =="age"
replace Q63_i = Q63_h if Q63_Text =="age (~50)"
replace Q63_i = Q63_h if Q63_Text =="Age"
replace Q63_i = Q63_h if Q63_Text =="Age"
replace Q63_i = Q63_h if Q63_Text =="Age"
replace Q63_i = Q63_h if Q63_Text =="my age"
replace Q63_i = Q63_h if Q63_Text =="Age"
replace Q63_i = Q63_h if Q63_Text =="age"
replace Q63_i = Q63_h if Q63_Text =="age"
replace Q63_i = Q63_h if Q63_Text =="ageism"

replace Q63_h = . if Q63_Text =="age"
replace Q63_h = . if Q63_Text =="age"
replace Q63_h = . if Q63_Text =="age (~50)"
replace Q63_h = . if Q63_Text =="Age"
replace Q63_h = . if Q63_Text =="Age"
replace Q63_h = . if Q63_Text =="Age"
replace Q63_h = . if Q63_Text =="my age"
replace Q63_h = . if Q63_Text =="Age"
replace Q63_h = . if Q63_Text =="age"
replace Q63_h = . if Q63_Text =="age"
replace Q63_h = . if Q63_Text =="ageism"

replace Q63_h = . if Q63_Text =="none"


**Q79
replace Q79 = 1 if Q79_Text=="Straight"
replace Q79 = 1 if Q79_Text=="straight"
replace Q79 = . if Q79_Text=="NYOB"
replace Q79 = . if Q79_Text=="Prefer not to answer"
replace Q79 = . if Q79_Text=="why?"
replace Q79 = . if Q79_Text=="choose not to answer"
replace Q79 = . if Q79_Text=="Prefer not to answer"
replace Q79 = . if Q79_Text=="None of your business"
replace Q79 = . if Q79_Text=="None of your damn business"
replace Q79 = . if Q79_Text=="none of your business"
replace Q79 = . if Q79_Text=="Not your business"

**Keep only recode variables, drop text response. 
keep CaseID Q20_* Q23_* Q28_* Q44_* Q45_* Q61_* Q63_* Q79 
drop Q63_Text Q61_Text Q45_Text Q44_Text Q28_Text Q23_Text Q20_Text

**Export recode dataset as CSV file for SAS program
export delimited using "L:\Libraries\Voices\Data\Voices_other_response_recodes.csv", nolabel replace
