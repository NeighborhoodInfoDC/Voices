/**************************************************************************
 Program:  Voices_q16_recode.sas
 Library:  Voices
 Project:  NeighborhoodInfo DC
 Author:   P. Tatian
 Created:  09/19/17
 Version:  SAS 9.2
 Environment:  Local Windows session (desktop)
 
 Description:  Read recoded Q16 data generated by Python program and
create final recoded data set. 

 Modifications: 10/18/17 LH replaced break var code with standard macro.
 		10-23-17 LH modified recoding from Natural Language Processing
**************************************************************************/

%include "L:\SAS\Inc\StdLocal.sas";

** Define libraries **;
%DCData_lib( Voices )

filename fimport "L:\Libraries\Voices\Raw\Q16_recode.csv" lrecl=1000;

proc import out=Q16_recode
    datafile=fimport
    dbms=csv replace;
  datarow=2;
  getnames=yes;
  guessingrows=max;
run;

data Q16_recode_random;

  set Q16_recode;

  where recode not in ( '', 'NOMATCH' 'LOCATION');
  
  r = ranuni( -1 );
  
  format _all_ ;
  informat _all_ ;
  
run;

proc sort data=Q16_recode_random;
  by caseid respnum r;
run;

data Q16_recode_unq;

  set Q16_recode_random;
  by caseid respnum;
  
  if first.respnum;
  
  drop r;
  
run;

data location;
	
	set Q16_recode;

	where recode='LOCATION';

run;

proc sort data=location;

	by caseid respnum;

data Q16_recode_unq_1 (drop=recode_l);

	merge Q16_recode_unq (in=a)
		  location (in=b keep=caseid respnum recode rename=(recode=recode_l));
	by caseid respnum;

	if recode='' and b=1 then recode=recode_l;

run;
data Voices_Q16_notyetrecoded (where=(respnum=.) drop=entity fuzzratio Q16_recode )
	 Voices_Q16_r1 (where=(respnum=1) drop=Q16_Text2 Q16_Text3 )
	 Voices_Q16_r2 (where=(respnum=2) drop=Q16_Text1 Q16_Text3 )
	 Voices_Q16_r3 (where=(respnum=3) drop=Q16_Text2 Q16_Text1 );

  merge
    Q16_recode_unq_1 
    Voices.VoicesDMVSurvey2017 (keep=caseid Q16_Text1 Q16_Text2 Q16_Text3);
  by caseid;

  rename recode=Q16_recode;
  
run;

proc transpose data=Voices_Q16_notyetrecoded out=Voices_Q16_notyetrecoded_1;

	by caseid;
	var Q16_Text1 Q16_Text2 Q16_Text3; 

run;
data Voices_Q16_notyetrecoded_2 (drop=_name_);

	set Voices_Q16_notyetrecoded_1 (drop=_label_);

	respnum=.;
	if _name_="Q16_Text1" then respnum=1;
	if _name_="Q16_Text2" then respnum=2;
	if _name_="Q16_Text3" then respnum=3;

run; 
data Voices_Q16_toreview;

	set Voices_Q16_r1 (rename=(Q16_Text1=Q16_Text))
		Voices_Q16_r2 (rename=(Q16_Text2=Q16_Text))
		Voices_Q16_r3 (rename=(Q16_Text3=Q16_Text))
		Voices_Q16_notyetrecoded_2(rename=(col1=Q16_Text));

		Q16_text=propcase(Q16_text);

		drop fuzzratio;
run;
%let list='TRAFFIC' 'TAXES' 'PARKING' 'ENTERTAINMENT' 'FOOD' 'CULTURE' 'MUSEUMS' 'MONUMENTS' 'PERFORM' 'ARTS' 'SPORTS' 'NIGHTLIFE' 'JOBS' 'PEOPLE' 'LOCATION' 'DIVERSITY'
		  'TRANSPORTATION' 'BUS' 'METRO' 'AIRPORTS' 'NATURE' 'COMMUNITY' 'SCHOOLS' 'WEATHER' 'LIFE' 'FAMILY' 'SHOPPING' 'SERVICES' 'CAPITAL' 'ECONOMY' 'NOTHING' 'SAFETY'
		  'HOUSING' 'DC' 'POLITICS' 'TRUMP' 'WALKABILITY' 'COSTS' 'NOISE' 'POLICE' 'POLLUTION' 'POVERTY' 'DRIVERS' 'GENTRIFICATION' 'TRASH' 'DRUGS' 'STRESS' 'CONSTRUCTION' 
		  'DISCRIMINATION' 'HOMELESSNESS' 'GANGS' 'TOURISTS' 'MONEY' 'BUGS' 'TERROR' 'RATS' '';

%macro printlist;

%do i=1 %to 57;
%let var=%scan(&list,&i.," ");

proc freq data=Voices_Q16_toreview;
tables Q16_Text ;
where  Q16_recode=&var.;
Title2 "Coded as &var"; 

run;
%end; 

title2; 
%mend;

%printlist;

data Voices_Q16_newrecode (drop=metro traffic housing commute transpo life trump costs many rude fast homeless poverty safety politics);
	
	set Voices_Q16_toreview;


	housing=index(Q16_text,"Cost Of Home"); *was costs;
	housing=housing+index(Q16_text,"Cost Of Hous"); *was costs;
	housing=housing+index(Q16_text,"Cost Of Apartm"); *was costs;
	if Q16_Text in("Cost Of Living - Rent Is Too High" "Cost Of Rent" "Cost Of Residence" "Prices Of Homes" "Price Of Houses" "Property And Cost Of Living Are High"
					"Very High Cost Of Housin") then housing=1;

	traffic=traffic+index(Q16_text,"Congested Roads"); 
	traffic=traffic+index(Q16_text,"Conjestion Roads"); 
	traffic=traffic+index(Q16_text,"Crowded Roads"); 
	traffic=traffic+index(Q16_text,"Roads Are Too Crowded"); 
	traffic=traffic+index(Q16_text,"Roads Are Getting More Crowded"); 
	traffic=traffic+index(Q16_text,"Roads Not Designed To Handle"); 
	traffic=traffic+index(Q16_text,"Congestion In Trying To"); 
		if Q16_text in("Gridlock" "Growing Gridlock, Traffic-Wise" "Heavy Beltway Traffic" "Highways" "Traffic Is A Nightmare" "Transport Congestion" "Nosy Traffic") then traffic=1; 

	commute=index(Q16_text,"Commute To Work"); *was jobs;
	commute=commute+index(Q16_text,"Commutes");
		if Q16_text in("Commute Times" "Commuting" "Commute Times" "Commute" "Comute" "Costly Commute" "Daily Commute" "The Commute") then commute=1; 

	transpo=index(Q16_text,"Public Transit");
	if Q16_text in("Bad Public Transportation" "Cost Of Public Transportation" "Dismal Public Transportation" "Mass Transit" "Transit" "Cabs" "Streets Need Work") then transpo=1;

	metro=index(Q16_text,"Metro/Transportation");
	metro=metro+index(Q16_text,"Metro Rail And Bus");
	metro=metro+index(Q16_text,"Wmata Metro Is The Worst");
	if Q16_text in("Dc Metro Service" "Metro Service" "Unreliable Metro Service" "Dc Metro Hours" "Metro System" "Poor Metro System" "Poorly Maintained Subway"
					"Expensive Transportation System (Metro)") then metro=1;


	life=index(Q16_text,"Focus On Careers"); *was jobs;
	life=life+index(Q16_text,"Transient"); *mostly was people;
	life=life+index(Q16_text,"Transience"); *mostly was people;
	if Q16_Text in("Extremely Performance Driven" "People Too Focused On Work" "People Work Too Much" "The Competitve/Money-Grubbing Nature" "Transitory Nature"
					"Too Much Emphasis On Career And Difficult To Raise A Family" "No One Stays In The Area For Long" "Overly Competitive" "The Competitive Culture"
					"Social Culture" "Culture" "City Is Being Whitewashed, Losing Its Black Culture." "We Are All Too Focused On Our Careers") then life=1;


	costs=index(Q16_text,"Cost Of Food"); *was food; 
	costs=costs+index(Q16_text,"Price Of Food"); *was food;
	costs=costs+index(Q16_text,"Cost Of Many"); 
	costs=costs+index(Q16_text,"Price Of Recreation");
	costs=costs+index(Q16_text,"Expensive City");
	if Q16_text in("High Price for Food/Utilities/Gas" "Restaurant Too Expensive" "Expensive Entertainment" "Declining Standard Of Living" "Declining Standard Of Life"
					"High Cost Of Service" "Costly" "Everything Is Expensive" "Everything Is Ridiculously Expensive" "Expensive" "Expensive Area" "Expensive!" "It's Very Expensive" 
					"Its Expensive" "Little Bit Expensive" "Too Expensive" "Very Expensive" "Rent Money") then costs=1;

	if Q16_text in("Current White House Occupants" "That Orange Cheeto In The White House" "The Guy In The White House"
					"People In Oval Office" "Poisonous Atmosphere Of Current Administration" "Our Present First Family" "President Chump" "President Trump" "The Current President"
					"The Current President And Political Status" "Trump Is President") then trump=1;

	*new code-  too many people;
	many=index(Q16_text,"A Lot Of People");
	many=many+index(Q16_text,"Amount Of People");
	many=many+index(Q16_text,"Becoming Overcrowded");
	many=many+index(Q16_text,"High Population");
	many=many+index(Q16_text,"Population Density");
	many=many+index(Q16_text,"Large Population");
	many=many+index(Q16_text,"Over Population");
	many=many+index(Q16_text,"Over-Population");
	many=many+index(Q16_text,"Overcrowding");
	many=many+index(Q16_text,"Overpopulation");
	many=many+index(Q16_text,"Overdevelopment");
	if Q16_text in("Congestion And Crowd" "Congestion Of People" "Congestion/Crowds" "Crowdiness" "Crowdness" "Lots Of People"
				"Number Of People" "So Many People" "Too Many People" "Too Many People Everywhere" "Too Many People In One Place" "Too Many People Per Capita" "Too Many People."
				"Too Much People At Times" "Tooany People" "Close Living Proximity To Everyone Else" "Density" "Close Living Quarters" "Congested" "Crowded" "Crowding" "Overcrowded"
				"To Crowded" "Too Crowded" "Too Many Buildings In Dc" "Congestion; Increasing Development" "Over Development" "Too Much Development" "Too Much New Construction Everywhere"
				"Overbuilding" "Congestion - Too Many Houses Being Built" "Congestion And Over Development" "To Many Houses" "Too Many Apartment Buildings" "Very Crowded With People And Homes"
				"Too Crowed, Congested With Rude People") then many=1;

	*I left "Crowds" as people?...thought of those as more time specific? - like crowds of tourists?";

	*new code - not friendly/rude; 
	rude=index(Q16_text,"Rude");
	rude=rude+index(Q16_text,"Rudeness");
	rude=rude+index(Q16_text,"Disrespectful People");
	rude=rude+index(Q16_text,"Unfriendly People");
	rude=rude+index(Q16_text,"Mean People");
	rude=rude+index(Q16_text,"People Are Mean");
	rude=rude+index(Q16_text,"People Are Unfriendly");
	rude=rude+index(Q16_text,"People Aren't Friendly");
	rude=rude+index(Q16_text,"People Aren't As Nice");
	rude=rude+index(Q16_text,"People Aren't Nice");
	rude=rude+index(Q16_text,"People Aren't Very Friendly");
	rude=rude+index(Q16_text,"Unfriendliness");
	if Q16_text in("People Stare" "Less Friendlyness" "People Are Not Friendly" "Ill-Tempered People" "People Not To Friendly"
					"Some Of The People Are Not As Friendly" "The People Could Be Nicer." "Unfriendly And Aggressive People" "Not Friendly" "Unfriendly" "Unfriendly To Stangers"
					"(Bad)attitudes And General Unfriendlyness Of Locals") then rude=1;

	*new code - fast pace life;
	fast=index(Q16_text,"Are Very Rushed");
	fast=fast+index(Q16_text,"Fast Pace");
 	fast=fast+index(Q16_text,"Fast-Paced");
	fast=fast+index(Q16_text,"Pace Of Life");
	fast=fast+index(Q16_text,"Hectic");
	fast=fast+index(Q16_text,"Hectic");
	if Q16_text in("Lack Of Time To Live A Life" "Fast Speed Of Life" "Busy" "Busy-Ness" "Its Busy" "Very Busy" "People Are Busy") then fast=1;

	homeless=index(Q16_text,"Homeless");
	if Q16_text="People Living Shelters" Then homeless=1;
	
	poverty=index(Q16_text,"Could Be More Equitable");
	poverty=poverty+index(Q16_text,"Large Disparity Between The Wealthiest");
	poverty=poverty+index(Q16_text,"The Wide Disparity From Neighborhood");
	if Q16_text in("Poor People" "Too Many People Living Under The Goverment Funds" "Class Divisions" "Poor" "Poor Areas" "The Vast Economic Differences In Various Parts Of The Area"
					"Poor Living Conditions East Of The River") then poverty=1;

	safety=index(Q16_text,"People Getting Killed");
	safety=safety+index(Q16_text,"People To Own Weapons");
	safety=safety+index(Q16_text,"Crime In Neighborhoods");
	safety=safety+index(Q16_text,"Danger Of Some Neighborhoods");
	safety=safety+index(Q16_text,"Dangerous Neighborhoods");
	safety=safety+index(Q16_text,"Children Are Being Abducted");
	safety=safety+index(Q16_text,"Neighborhood Violence");
	safety=safety+index(Q16_text,"Crime In Pg County");
	safety=safety+index(Q16_text,"Violence In The Dc Area");
	if Q16_text in("Dangerous" "Gun" "Gunshots" "Have A Little Problem With Thieves" "Not Safe" "Robbing" "Thug Fights" "Too Many Fights" "Too Many Kills" "Vilonce" 
					"You Can Easily Feel Unsafe Depending Where You Are") then safety=1;

	politics=index(Q16_text,"Proximity To Political Stuff");
	politics=politics+index(Q16_text,"Political Diversity");
	politics=politics+index(Q16_text,"Proximity to Idiots In Dc/Far");
	if Q16_text in("Political Climate" "Political Atmosphere" "Political Noise" "Everybody Is Political" "It's A Slimy, Political City" "It's Very Conservative" "Politically Focused"
					"Too Political" "Too Political At Times" "Political Culture" "People Are Too Political" "Political" "Politically-Focused") then politics=1;

	if metro > 0 then Q16_recode='METRO';
	else if housing > 0 then Q16_recode='HOUSING';
	else if commute > 0 then Q16_recode='COMMUTE';
	else if traffic > 0 then Q16_recode='TRAFFIC';
	else if transpo > 0 then Q16_recode='TRANSPORTATION';
	else if life > 0 then Q16_recode='LIFE';
	else if COSTS > 0 then Q16_recode='COSTS';
	else if TRUMP > 0 then Q16_recode='TRUMP';
	else if poverty > 0 then Q16_recode='POVERTY';
	else if homeless > 0 then Q16_recode='HOMELESSNESS';
	else if safety > 0 then Q16_recode='SAFETY';
	else if politics > 0 then Q16_recode='POLITICS';
	else if many > 0 then Q16_recode='MANY';
	else if rude > 0 then Q16_recode='RUDE';
	else if fast > 0 then Q16_recode='FAST';

	If Q16_Text in("Everyone" "Cars Running Into Each Other Due To A Lack Of Civility" "Girls" "Poeple" "Some Kids") then Q16_recode="PEOPLE"; *was traffic;

	if Q16_Text in("Bad Rap It Gets From National Politics" "Focus On Federal Politics" "National Politics" 
					"Local And National Politics Get Mixed Up" "National Politics Now" "Disfunction Of Congress And White House"
					"Inactive Congressional People" "Lack Of Voting Rights For Dc" "Congressional Medling In Dc's Local Government" 
					"Proximity To Idiots In Dc/Far Removed From The Rest Of The Country In Terms Of Issues") then Q16_recode='CAPITAL';

	if Q16_text in("Would Be Difficult To Evacuate In Certain Events" "National Security") then Q16_recode='TERROR';

	if Q16_text in("Late Night Events" "No Real Nightlife For Average People" "Clubs Close Early" "Hard To Find Clubs To Party At") then Q16_recode="NIGHTLIFE";

	if Q16_text in("The Inability To Drive To The Many Monuments In The Area Due To Lack Of Parking.") then Q16_recode='PARKING';

	if Q16_text in("Bad Trasffif/Rude Agressive Drivers" "People Don't Drive Well" "People Can't Drive" "Driving") then Q16_recode='DRIVERS';

	if Q16_text in("Lack Of Things To Do For Young People" "To Many Youth With Nothing To Do") then Q16_recode='ENTERTAINMENT'; *was people, was nothinh;

	if Q16_text in("People Stressing" "The Closer To The City The More Stressed The People" "Stressful Lifestyle" "Stressful" "Busy-Ness And High Stress Of People Living Here"
					) then Q16_recode='STRESS';

	if Q16_text in("Starbucks Far Away From Resident Areas For People With No Car") then Q16_recode='SHOPPING';

	if Q16_text in("Housing/School Segregation (Lack Of Diversity In Individual Communities)!" "People Are Racist" "Racist People" "Racist Black People"
		"Poorer Communities Are Lumped Together" "Increasing Segregation By Income" "Overtly Racist" "Somewhat Segregated") then Q16_recode='DISCRIMINATION';

	if Q16_text in("Less Wakable Communities" "Sidewalks") then Q16_recode='WALKABILITY';

	if Q16_text in("Limited Communities With Good Schools" "Poor Education For Children" "Public Schools In Dc Need Further Improvement" "Schools Are Not Great The Closer You Get To Dc"
					"Poor Schools In D.C.") then Q16_recode='SCHOOLS';

	if Q16_text in("Messed Up Communities") then Q16_recode='COMMUNITY';

	if Q16_text in("Not Enough Commercial Diversity") then Q16_recode='ECONOMY';

	if Q16_text in("Car/Vehicle Tax" "High Taxes (Property And Income)" "Taxes In Dc Proper" "Too Much Laws In Place To Generate Money For The Government"
					"Taxes On House For Things We Don't Use") then Q16_recode="TAXES";

	if Q16_text in("Lack Of Cleanlines" "Dirty") then Q16_recode="TRASH";

	if Q16_text in("Gang" "Gang Activity" "Gang Violence" "Gang Violence, Crime" "Gangs And Crime") then Q16_recode="GANGS";

	if Q16_text in("Tourism From D.C." "Tourist Downtown When Trying To Get To/From Work") then Q16_recode="TOURISTS";

	if Q16_text in("Polution Caused By Construction In Reston") then Q16_recode='POLLUTION';

	if Q16_text in("Distance From Major Tourist Attractions" "Close To The Nsa" "Hard To Travel" "Convenience" ) then Q16_recode='LOCATION';

	if Q16_text in("Bad Bus Roues" "The Metro Bus System") then Q16_recode="BUS";

	if Q16_text in("Cold" "It Gets Really Cold At Times" "Rainy" "Very Humid In The Summer") then Q16_recode="WEATHER";

	if Q16_text in("Drug") then Q16_recode="DRUGS";

	if Q16_text in("Garbage Truck Comes During The Night" "To Loud" "Too Loud" "In Dc, Noise From Vip Escort Vehicles") then Q16_recode="NOISE";

	if Q16_text in("Low Emergency Response Time" "Vehicle Inspection Standards. Dishonest Mechanics Take Advantage Of This System And Con People Out Of Their Money."
					"Red Tape With Government(Local And Federal)") then Q16_recode="SERVICES";

	if Q16_text in("Not A Lot Of Asians" "Too Many/Different Cultures") then Q16_recode="DIVERSITY";

	if Q16_text in("Not Close For Outdoor Stuff" "Lack Of Beach Access" "No Close Beach Access") then Q16_recode="NATURE";

	if Q16_text in("No Good Asian Food In Dc, Only In Virginia") then Q16_recode="FOOD";

	if Q16_text in("Cleanliness" "The D, M, And The V Seem To Have Trouble Getting Things Done For The Region As A Whole, To Say Nothing Of The Not Nova") then Q16_recode='';
	
run;
%let list_new='TRAFFIC' 'TAXES' 'PARKING' 'ENTERTAINMENT' 'FOOD' 'CULTURE' 'MUSEUMS' 'MONUMENTS' 'PERFORM' 'ARTS' 'SPORTS' 'NIGHTLIFE' 'JOBS' 'PEOPLE' 'LOCATION' 'DIVERSITY'
		  'TRANSPORTATION' 'BUS' 'METRO' 'AIRPORTS' 'NATURE' 'COMMUNITY' 'SCHOOLS' 'WEATHER' 'LIFE' 'FAMILY' 'SHOPPING' 'SERVICES' 'CAPITAL' 'ECONOMY' 'NOTHING' 'SAFETY'
		  'HOUSING' 'DC' 'POLITICS' 'TRUMP' 'WALKABILITY' 'COSTS' 'NOISE' 'POLICE' 'POLLUTION' 'POVERTY' 'DRIVERS' 'GENTRIFICATION' 'TRASH' 'DRUGS' 'STRESS' 'CONSTRUCTION' 
		  'DISCRIMINATION' 'HOMELESSNESS' 'GANGS' 'TOURISTS' 'MONEY' 'BUGS' 'TERROR' 'RATS' 'FAST' 'MANY' 'RUDE' 'COMMUTE' '';
%macro printlist_new;

%do i=1 %to 61;
%let var=%scan(&list_new,&i.," ");

proc freq data=Voices_Q16_newrecode;
tables Q16_Text ;
where  Q16_recode=&var.;
Title2 "Coded as &var"; 

run;
%end; 

title2; 
%mend;

%printlist_new;


proc sort data=Voices_Q16_newrecode;
	by caseid;

data Voices_Q16_recode;

	merge Voices_Q16_newrecode (drop=entity)
		  Voices.VoicesDMVSurvey2017 (keep=caseid weight dov_urban ppethm ppracem ppeducat ppincimp ppage ppgender pprent);
	by caseid;

		%make_break_vars_2017;
		
		label respnum="Survey Response Number"
				  Q16_recode="Q16 recoded response categories: 3 worst things about living in Washington area"
				  Q16_text="Q16 actual response: 3 worst things about living in Washington area"
		  ;
run;


proc format;

  value $Q16_r
    'ENTERTAINMENT' = "Food and entertainment options"
    'CULTURE' = "Culture and history"
    'JOBS' = "Jobs and career opportunities"
    'PEOPLE' = "Types of people who live here"
    'LOCATION' = "Location and accessibility"
    'DIVERSITY' = "Diversity"
    'TRANSPORTATION' = "Transportation options"
    'NATURE' = "Natural environment"
    'COMMUNITY' = "Community"
    'SCHOOLS' = "Schools and educational institutions"
    'WEATHER' = "Climate and weather"
    'LIFE' = "Lifestyle"
    'FAMILY' = "Far from family"
    'SHOPPING' = "Shopping options"
    'SERVICES' = "Services and amenities"
    'CAPITAL' = "It's the nation's capital"
    'ECONOMY' = "Economy"
    'NOTHING' = "Nothing"
    'SAFETY' = "Crime and safety"
    'HOUSING' = "Housing"
    'DC' = "Washington, DC"
    'POLITICS' = "Political culture"
    'WALKABILITY' = "Walkability"
    'COSTS' = "Cost of living";

  value $Q16_r_det
    'TRAFFIC' = "Traffic"
    'TAXES' = "Taxes"
    /*'TRUMP' = "Donald Trump"*/
    'PARKING' = "Parking"
    'ENTERTAINMENT','MUSEUMS','MONUMENTS','ARTS','PERFORM','SPORTS','NIGHTLIFE'  = "Arts and entertainment"
    'FOOD' = "Food"
    'CULTURE' = "Culture"
    /*'MUSEUMS' = "Museums"
    'MONUMENTS' = "Monuments"
    'PERFORM' = "Performing arts"
    'ARTS' = "Arts"
    'SPORTS' = "Sports"
    'NIGHTLIFE' = "Nightlife"*/
    'JOBS' = "Jobs"
    'PEOPLE' = "People"
	'MANY' = "Too many people"
	'RUDE' = "Rude and unfriendly"
    'LOCATION' = "Location"
    'DIVERSITY' = "Diversity"
    'TRANSPORTATION', 'BUS' = "Transportation"
    'METRO' = "Metro"
    'AIRPORTS' = "Airports" 
	'COMMUTE' = "Commute" 
    'NATURE' = "Nature"
    'COMMUNITY' = "Community"
    'SCHOOLS' = "Schools"
    'WEATHER' = "Weather"
    'LIFE' = "Lifestyle"
	'FAST' = "Fast-paced"
    'FAMILY' = "Far from family"
    'SHOPPING' = "Shopping"
    'SERVICES' = "Services"
    'CAPITAL' = "Nation's capital"
    'ECONOMY' = "Economy"
    'NOTHING' = "Nothing"
    'SAFETY' = "Crime"
    'HOUSING' = "Housing"
    'DC' = "Washington, DC"
    'POLITICS', 'TRUMP' = "Politics"
    'WALKABILITY' = "Walkability"
    'COSTS' = "Cost of living"
    'NOISE' = "Noise"
    'POLICE' = "Police"
    'POLLUTION' = "Pollution"
    'POVERTY' = "Poverty and inequality"
    'DRIVERS' = "Drivers"
    'GENTRIFICATION' = "Gentrification"
    'TRASH' = "Trash"
    'DRUGS' = "Drugs"
    'STRESS' = "Stress"
    'CONSTRUCTION' = "Construction"
    'DISCRIMINATION' = "Discrimination"
    'HOMELESSNESS' = "Homelessness"
    'GANGS' = "Gangs"
    'TOURISTS' = "Tourists"
    'MONEY' = "Money"
    'BUGS' = "Bugs"
    'TERROR' = "Terror threats"
    'RATS' = "Rats"
;




%Finalize_data_set( 
  data=Voices_Q16_recode,
  out=Voices_Q16_recode,
  outlib=Voices,
  label="VoicesDMV survey, 2017, Q16 recoded responses",
  sortby=caseid respnum,
  revisions=%str(Updated labels.)
)

proc freq data=Voices_Q16_recode order=freq;
  weight weight;
  tables Q16_recode;  
  format Q16_recode $Q16_r_det.;
  title2 'All responses';
run;

proc freq data=Voices_Q16_recode order=freq;
  where respnum = 1;
  weight weight;
  tables Q16_recode;  
  format Q16_recode $Q16_r_det.;
  title2 'First response only';
run;

** Word cloud export **;

proc summary data=Voices_Q16_recode nway;
  class Q16_recode;
  var weight;
  output out=A sum=;
  format Q16_recode $Q16_r_det.;
run;

%File_info( data=A )

data Word_cloud;

  length Q16_recode $ 20 wc_weight 8;
  
  set A;
  
  wc_weight = round( weight );
  
  keep Q16_recode wc_weight;
  
run;

filename fexport "D:\DCData\Libraries\Voices\Raw\Voices_Q16_recode_wordcloud.txt" lrecl=256;

proc export data=Word_cloud
    outfile=fexport
    dbms=tab replace;

run;

filename fexport clear;

