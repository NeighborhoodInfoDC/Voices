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
                     "LOT", "LOTS" ] ),
    cTopicaltitem( "PEOPLE",
                   [ "PEOPLE", "POPULATION", "WOMEN", "MEN", "EDUCATION LEVEL" ] ),
    cTopicaltitem( "CULTURE",
                   [ "CULTURE", "MUSEUM", "MUSEUMS", "HISTORY", "MONUMENTS", "ARTS", "ART",
                     "MUSIC", "SMITHSONIAN", "WHITE HOUSE", "SIGHTS", "SIGHTSEEING",
                     "THEATER", "THEATRE", "THEATERS", "KENNEDY CENTER", "ART GALLERIES",
                     "FESTIVALS", "TOURIST ATTRACTIONS", "LANDMARKS",
                     "NATIONAL MALL", "MUSIC VENUES", "TOURIST ATTRACTIONS",
                     "TOURISM", "CULTURE EVENTS", "GALLERIES", "PERFORMANCES" ] ),
    cTopicaltitem( "ENTERTAINMENT",
                   [ "ENTERTAINMENT", "FOOD", "FOODS", "ACTIVITIES", "RESTAURANTS",
                     "EVENTS", "NIGHTLIFE", "NIGHT LIFE", "SPORTS", "DINING",
                     "FUN", "SPORTS TEAMS", "TEAMS", "RECREATION", "BARS",
                     "ENTERTAINMENT OPTIONS", "FOOD CHOICES", "RESTAURANT SCENE",
                     "BASEBALL", "FOOTBALL", "HOCKEY", "REDSKINS", "LEISURE ACTIVITIES",
                     "RESTAURANT CHOICES", "DINING OPTIONS", "FOOD SCENE", "FOOD PLACES",
                     "FOOD VARIETY" ] ),
    cTopicaltitem( "LOCATION",
                   [ "LOCATION", "ACCESS", "ACCESSIBILITY", "PROXIMITY", "COAST",
                     "EAST COAST" ] ),
    cTopicaltitem( "JOBS",
                   [ "JOBS", "JOB", "JOB OPPORTUNITIES", "JOB OPPORTUNITY",
                     "JOB MARKET", "JOB AVAILABILITY", "JOB SECURITY", "WORK",
                     "EMPLOYMENT", "EMPLOYMENT OPPORTUNITIES", "WORK OPPORTUNITIES",
                     "SALARY", "NETWORKING", "UNEMPLOYMENT" ] ),
    cTopicaltitem( "TRANSPORTATION",
                   [ "TRANSPORTATION", "AIRPORTS", "METRO", "TRANSIT", "COMMUTE",
                     "TRAFFIC", "TRANSPORT", "PUBLIC TRANSIT", "ROADS",
                     "TRANSPORTATION OPTIONS", "BUSES", "SUBWAY SYSTEM" ] ),
    cTopicaltitem( "WALKABILITY", [ "WALKABILITY", "WALKING DISTANCE", "WALKABLE" ] ),
    cTopicaltitem( "SCHOOLS",
                   [ "SCHOOLS", "SCHOOL", "EDUCATION", "SCHOOL SYSTEM",
                     "UNIVERSITIES", "COLLEGE", "COLLEGES", "EDUCATION SYSTEM" ] ),
    cTopicaltitem( "WEATHER", [ "WEATHER", "SEASONS", "WINTERS", "SNOW" ] ),
    cTopicaltitem( "SHOPPING",
                   [ "SHOPPING", "STORES", "STORE", "SHOPS", "SHOPPING CENTERS",
                     "SHOPPING MALLS" ] ),
    cTopicaltitem( "COMMUNITY",
                   [ "COMMUNITY", "NEIGHBORHOODS", "NEIGHBORS", "CLUBS", "CHURCH",
                     "CHURCHES" ] ),
    cTopicaltitem( "NOTHING", [ "NOTHING", "NONE" ] ),
    cTopicaltitem( "CAPITAL",
                   [ "CAPITAL", "CAPITOL", "POLITICS", "GOVERNMENT",
                     "NATIONS CAPITAL", "POWER", "CAPITAL CITY", "CONGRESS" ] ),
    cTopicaltitem( "LIFE",
                   [ "LIFE", "CITY LIFE", "ATMOSPHERE", "LIVING", "FRIENDLINESS",
                     "CITY FEEL", "DENSITY", "VIBRANCY", "PARTIES" ] ),    
    cTopicaltitem( "NATURE",
                   [ "NATURE", "PARKS", "MOUNTAINS", "SCENERY",
                     "BEACHES", "BEACH", "OCEAN", "SPACE", "TREES", "WATER", "GREEN",
                     "POTOMAC RIVER", "GREENERY", "HIKING", "LANDSCAPE", "TRAILS",
                     "BIKE TRAILS", "CHESAPEAKE BAY", "LAKES", "PARKS AND REC",
                     "ROCK CREEK PARK" ] ),
    cTopicaltitem( "ECONOMY", [ "ECONOMY", "MONEY", "WEALTH" ] ),
    cTopicaltitem( "SERVICES",
                   [ "SERVICES", "AMENITIES", "HEALTH CARE", "HEALTHCARE", "HOSPITALS",
                     "LIBRARIES", "DOCTORS", "GROCERY STORES" ] ),
    cTopicaltitem( "SAFETY", [ "SAFETY", "SAFE", "SECURITY", "CRIME", "CRIME RATE" ] ),
    cTopicaltitem( "HOUSING", [ "HOUSING", "HOMES", "HOME PRICES" ] ),    
    cTopicaltitem( "FAMILY",
                   [ "FAMILY", "CHILDREN", "FAMILY MEMBERS", "HUSBAND", "SON" ] ),
    cTopicaltitem( "DC", [ "DC", "WASHINGTON DC" ] ),
    cTopicaltitem( "COSTS", [ "PRICE", "PRICES" ] ),
    cTopicaltitem( "DIVERSITY",
                   [ "DIVERSITY", "CULTURES", "COMMUNITIES", "MELTING POT", "RACES",
                     "COSMOPOLITAN", "COSMOPOLITANISM", "MULTICULTURALISM", "MULTICULTURE",
                     "COMMUNITY DIVERSITY" ] )
]

for x in Topicalt:
    print( x.label, x.alt )

# Minimum ratio for successful fuzzy match
FUZZMATCHMIN = 92

# Time program execution
start_time = time.time()

# Translate table to strip out punctuation 
trantab = str.maketrans( "", "", ".'-" )

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

        print( "Processing caseid #", d.caseid )
                
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
