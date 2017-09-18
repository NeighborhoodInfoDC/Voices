# Open_ended_q15_recode.py
# Recode open-ended responses
# VoicesDMV survey, question 15. 
#
# P. Tatian

import csv
import time
from fuzzywuzzy import fuzz


class cDatrow:

    def __init__(self, caseid, respnum, text ):
        self.caseid = caseid
        self.respnum = respnum
        self.text = text

class cTopicaltitem:

    def __init__(self, label, alt):
        self.label = label
        self.alt = alt        

# Input and output files
# inFile = 'L:\Libraries\Voices\Raw\Q15_entities.csv'
# outFile = 'L:\Libraries\Voices\Raw\Q15_recode.csv'

inFile = 'C:\DCData\Libraries\Voices\Raw\Q15_entities.csv'
outFile = 'C:\DCData\Libraries\Voices\Raw\Q15_recode.csv'

# Define place name alternates
Topicalt = [
    cTopicaltitem( "NOMATCH",
                   [ "THINGS", "OPPORTUNITY", "CENTER", "CENTERS", "SPOTS", "SORTS",
                     "LOT", "LOTS", "IDK", "NA", "N/A" ] ),
    cTopicaltitem( "PEOPLE",
                   [ "PEOPLE", "POPULATION", "WOMEN", "MEN", "EDUCATION LEVEL", "POPULACE", "RESIDENTS" ] ),
    cTopicaltitem( "CULTURE",
                   [ "CULTURE", "MUSEUM", "MUSEUMS", "MUSUEMS", "HISTORY", "MONUMENTS", "ARTS", "ART",
                     "MUSIC", "SMITHSONIAN", "WHITE HOUSE", "SIGHTS", "SIGHTSEEING",
                     "THEATER", "THEATRE", "THEATERS", "KENNEDY CENTER", "ART GALLERIES",
                     "FESTIVALS", "TOURIST ATTRACTIONS", "LANDMARKS",
                     "NATIONAL MALL", "MUSIC VENUES", "TOURIST ATTRACTIONS",
                     "TOURISM", "CULTURE EVENTS", "GALLERIES", "PERFORMANCES",
                     "ACCESS MUSEUMS", "AFRICAN AMERICAN MUSEUM", "AIR & SPACE",
                     "ART GALLERY", "ART GALLERYS", "ART INDUSTRY", "ART MUSEUM", 
                     "ART MUSEUMS", "ART OPPORTUNITIES", "ART RESOURCES", 
                     "ARTS AND ENTERTAINMENT", "ARTS CULTURE", "ARTS ENTERTAINMENT MUSEUMS", 
                     "ARTS SCENE", "ARTS/ CULTURE", "CHERISHED MONUMENTS", "CONCERTS",
                     "CULTERAL", "CULTERS", "CULTIRE", "CULTURAL ACTIVITIES", "CULTURAL CENTER", 
                     "CULTURALS", "CULTURE  MUSEUMS", "CULTURE ACTIVITIES", "CULTURE AVAILABILTY", 
                     "CULTURE AWARENESS OPPORTUNITIES", "CULTURE RANGE", "CULTURY", "CULTUTES",
                     "DANCE", "DANCE SCHOOLS", "HISTORICAL", "SMITHSONIAN INSTITUTION", "ZOO" ] ),
    cTopicaltitem( "ENTERTAINMENT",
                   [ "ENTERTAINMENT", "FOOD", "FOODS", "ACTIVITIES", "RESTAURANTS",
                     "EVENTS", "NIGHTLIFE", "NIGHT LIFE", "SPORTS", "DINING",
                     "FUN", "SPORTS TEAMS", "TEAMS", "RECREATION", "BARS",
                     "ENTERTAINMENT OPTIONS", "FOOD CHOICES", "RESTAURANT SCENE",
                     "BASEBALL", "FOOTBALL", "HOCKEY", "REDSKINS", "WIZARDS", "LEISURE ACTIVITIES",
                     "RESTAURANT CHOICES", "DINING OPTIONS", "FOOD SCENE", "FOOD PLACES",
                     "FOOD VARIETY", "AMUSEMENT PARKS", "AMUSEMENTS",
                     "BAR SCENE", "BASEBALL PARK", "BASEBALL TEAM", "BEER", "BEER OPTIONS",
                     "CITY NIGHT LIFE", "CUISINE", "CUISINE CHOICES", "CUISINES",
                     "DINING  RANGE", "DINING CHOICES", "DINING OPPORTUNITIES", "DINING SCENE", "DINING/ENTER TAINMENT",
                     "SEAFOOD", "ENTERTAINMENT CHOICES",
                     "RESTARAUNTS", "RESTAURANT OPTIONS", "RESTAURANT VARIETY", "RESTERAUNTS", "RESTUARANTS", "RESTURANT" ] ),
    cTopicaltitem( "LOCATION",
                   [ "LOCATION", "ACCESS", "ACESS", "ACCESSIBILITY", "ACESSABILITY", 
                     "PROXIMITY", "COAST", "EAST COAST", "BALTIMORE", "CITY ACCESSIBILITY",
                     "CLOSENESS TO DC", "CLOSETOEVERYTHING", "COMMUTE DISTANCE", "CLOSENESS" ] ),
    cTopicaltitem( "JOBS",
                   [ "JOBS", "JOB", "JOB OPPORTUNITIES", "JOB OPPORTUNITY", "CAREER",
                     "JOB MARKET", "JOB AVAILABILITY", "JOB SECURITY", "WORK",
                     "EMPLOYMENT", "EMPLOYMENT OPPORTUNITIES", "WORK OPPORTUNITIES",
                     "SALARY", "NETWORKING", "UNEMPLOYMENT", "CAREER OPPORTUNITIES", "CAREER OPPORTUNITY",
                     "DEFENSE JOBS", "EMPLOYMENT OPPORTUNITY", "GOVERNMENT JOBS", "SALARIES", "WAGES" ] ),
    cTopicaltitem( "TRANSPORTATION",
                   [ "TRANSPORTATION", "AIRPORTS", "METRO", "TRANSIT", "COMMUTE",
                     "TRAFFIC", "TRANSPORT", "PUBLIC TRANSIT", "ROADS",
                     "TRANSPORTATION OPTIONS", "BUSES", "SUBWAY SYSTEM",
                     "AIRLINE HUB", "AIRPORT ACCESSIBILTY", "AIRPORT SELECTION",
                     "AMTRAK", "AREA BUS", "BUS", "BUS SERVICE", "BUSSES", "WMATA", "CAR" ] ),
    cTopicaltitem( "WALKABILITY", [ "WALKABILITY", "WALKING DISTANCE", "WALKABLE", "WALKING" ] ),
    cTopicaltitem( "SCHOOLS",
                   [ "SCHOOLS", "SCHOOL", "EDUCATION", "SCHOOL SYSTEM",
                     "UNIVERSITIES", "COLLEGE", "COLLEGES", "EDUCATION SYSTEM", "EDUCATION OPPORTUNITIES" ] ),
    cTopicaltitem( "WEATHER", [ "WEATHER", "SEASONS", "WINTERS", "SNOW", "CLIMATE" ] ),
    cTopicaltitem( "SHOPPING",
                   [ "SHOPPING", "STORES", "STORE", "SHOPS", "SHOPPING CENTERS",
                     "SHOPPING MALLS", "CLOTHES", "CLOTHING", "MALLS", "RETAIL", "SHOPPING OPTIONS" ] ),
    cTopicaltitem( "COMMUNITY",
                   [ "COMMUNITY", "NEIGHBORHOODS", "NEIGHBORS", "CLUBS", "CHURCH",
                     "CHURCHES", "BLACK COMMUNITY", "CHURCH COMMUNITY", "CHURCH FAMILY",
                     "COMMUNITY CENTERS", "COMMUNITY FEEL", "COMMUNITY FEELING", 
                     "COMMUNITY SERVICES", "COMMUNITY SUPPORT", "FRIEND", "FRIENDS" ] ),
    cTopicaltitem( "NOTHING", [ "NOTHING", "NONE" ] ),
    cTopicaltitem( "CAPITAL",
                   [ "CAPITAL", "CAPITOL", "GOVERNMENT",
                     "NATIONS CAPITAL", "POWER", "CAPITAL CITY", "CONGRESS", "PRESIDENT" ] ),
    cTopicaltitem( "LIFE",
                   [ "LIFE", "CITY LIFE", "ATMOSPHERE", "LIVING", "FRIENDLINESS",
                     "CITY FEEL", "DENSITY", "VIBRANCY", "PARTIES", 
                     "CITY CULTURE", "CITY ENVIROMENT", "CITY LIVING", "CITY POPULATION", 
                     "CITY SETTINGS", "LIFESTYLE", "LIFESTYLES", "LIFE STYLE", "CLEANLINESS", "COMFORT",
                     "CONVENIENCE", "CONVIENCE", "MARIJUANA", "MARIJUANA LAWS" ] ),
    cTopicaltitem( "NATURE",
                   [ "NATURE", "PARKS", "MOUNTAINS", "SCENERY",
                     "BEACHES", "BEACH", "OCEAN", "SPACE", "TREES", "WATER", "GREEN",
                     "POTOMAC RIVER", "GREENERY", "HIKING", "LANDSCAPE", "TRAILS",
                     "BIKE TRAILS", "CHESAPEAKE BAY", "LAKES", "PARKS AND REC",
                     "ROCK CREEK PARK", "BEAUTIFUL RIVER", "BEAUTIFUL SCENIC AREAS",
                     "BIKE", "BIKE PATHS", "BIKING", "BIKING TRAILS", "CHERRY BLOSSEMS", "CHERRY BLOSSOMS",
                     "COUNTRYSIDE", "GREEN SPACES", "RIVERS", "SCENARY" ] ),
    cTopicaltitem( "ECONOMY", 
                   [ "ECONOMY", "MONEY", "WEALTH", "BUSINESS", "BUSINESS CENTER", "BUSINESS OPPORTUNITIES", "BUSINESSES",
                     "INCOME" ] ),
    cTopicaltitem( "SERVICES",
                   [ "SERVICES", "AMENITIES", "HEALTH CARE", "HEALTHCARE", "HOSPITALS",
                     "LIBRARIES", "DOCTORS", "GROCERY STORES", "CITY AMENITIES", "CITY RESOURCES",
                     "DOCTOR AVAILABILITY", "CARE" ] ),
    cTopicaltitem( "SAFETY", [ "SAFETY", "SAFE", "SECURITY", "CRIME", "CRIME RATE" ] ),
    cTopicaltitem( "HOUSING", [ "HOUSING", "HOMES", "HOME PRICES", "APARTMENT", "APARTMENTS", "HOUSES", "RENT" ] ),    
    cTopicaltitem( "FAMILY",
                   [ "FAMILY", "CHILDREN", "FAMILY MEMBERS", "HUSBAND", "SON", "DAUGHTER", "GRANDCHILDREN", "GRANDCHILD",
                     "RELATIVES" ] ),
    cTopicaltitem( "DC", [ "DC", "WASHINGTON DC" ] ),
    cTopicaltitem( "COSTS", [ "PRICE", "PRICES", "COST", "COST OF LIVING" ] ),
    cTopicaltitem( "POLITICS", [ "PROGRESSIVE", "PROGRESSIVE AREA", "PROGRESSIVE COMMUNITY", "POLITICS", "DEMOCRATS", "LIBERAL" ] ),
    cTopicaltitem( "DIVERSITY",
                   [ "DIVERSITY", "CULTURES", "COMMUNITIES", "MELTING POT", "RACES",
                     "COSMOPOLITAN", "COSMOPOLITANISM", "MULTICULTURALISM", "MULTICULTURE",
                     "COMMUNITY DIVERSITY", "BILINGUALS", "CULTURE VARIETY", "CULTURE/DIVERSITY",
                     "DIVERESTRY", "LGBTQ" ] )
]

for x in Topicalt:
    print( x.label, x.alt )

# Minimum ratio for successful fuzzy match
FUZZMATCHMIN = 92

# Time program execution
start_time = time.time()

# Translate table to strip out punctuation 
trantab = str.maketrans( "", "", ".'-+" )

# Read in responses

Mydat = []

with open(inFile, newline='') as f:
    reader = csv.reader(f, dialect='excel')
    next(reader)    # Skip header row
    for row in reader:
        if row == []:
            break
        Datrow = cDatrow(row[0],row[1],row[2])
        Mydat.append(Datrow)

print( len(Mydat), " input observations read." )

# Check place name matches for each response

with open(outFile, 'w', newline='') as csvfile:

    # fieldnames = [ 'caseid', 'entity', 'PEOPLE', 'CULTURE', 'ENTERTAINMENT', 'LOCATION', 'JOBS', 'TRANSPORTATION', 'SCHOOLS', 'WEATHER', 'SHOPPING', 'DIVERSITY' ]
    fieldnames = [ 'caseid', 'entity', 'recode', 'fuzzratio' ]
    
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()
        
    for d in Mydat:

        # print( '-'*30 )
        # print( d.text )

        print( "Processing caseid #", d.caseid, "respnum #", d.respnum )
                
        # matches = { 'caseid': d.caseid, 'entity': d.text, 'PEOPLE': '', 'CULTURE': '', 'ENTERTAINMENT': '', 'LOCATION': '', 'JOBS': '', 'TRANSPORTATION': '', 'SCHOOLS': '', 'WEATHER': '', 'SHOPPING': '', 'DIVERSITY': '' }
        matches = { 'caseid': d.caseid, 'entity': d.text, 'recode': '', 'fuzzratio': None }

        for topic in Topicalt:
            for alt in topic.alt:
                fuzzratio = fuzz.ratio( d.text.translate(trantab), alt)
                if fuzzratio >= FUZZMATCHMIN:
                    matches['recode'] = topic.label
                    matches['fuzzratio'] = fuzzratio
                    # print( d.text, " // ", alt, topic.label, fuzzratio )
                    break
            if matches['recode'] != '':
                break
                    
        writer.writerow( matches )
        # print( matches )

print("--- %s minutes ---" % ((time.time() - start_time)/60))
