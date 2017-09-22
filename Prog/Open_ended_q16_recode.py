# Open_ended_q16_recode.py
# Recode open-ended responses
# VoicesDMV survey, question 16. 
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
inFile = 'L:\Libraries\Voices\Raw\Q16_entities.csv'
outFile = 'L:\Libraries\Voices\Raw\Q16_recode.csv'

# inFile = 'C:\DCData\Libraries\Voices\Raw\Q16_entities.csv'
# outFile = 'C:\DCData\Libraries\Voices\Raw\Q16_recode.csv'

# Define topic name alternates
Topicalt = [
    cTopicaltitem( "NOMATCH",
                   [ "THINGS", "OPPORTUNITY", "CENTER", "CENTERS", "SPOTS", "SORTS",
                     "LOT", "LOTS", "IDK", "NA", "N/A", "LACK", "AREA", "CITY",
                     "GOVERNMENT" ] ),

    cTopicaltitem( "TRAFFIC",
                   [ "TRAFFIC", "TRAFIC", "CONGESTION", "TRAFFIC CONGESTION", "RUSH HOUR",
                     "RUSH HOUR TRAFFIC", "COMMUTE", "CARS", "COSUGESTION", "INCESSANT CONGESTION",
                     "LOT TRAFFIC", "ROAD CONGESTION", "ROAD CONJESTION", "ROAD TRAFFIC",
                     "RUSH HOUR CONGESTION", "RUSHOUR", "TRAFFIC  HIGHWAY GRIDLOCK", "TRAFFIC DENSITY",
                     "TRAFFIC GRIDLOCL", "TRAFFIC ISSUES", "TRAFFIC JAMS", "TRAFFIC LIGHTS", "TRAFFIC PLANS",
                     "TRAFFIC PROBLEMS", "TRAFFIC TRAFGIC", "TRAFFIC WORST", "TRAFFIC/PARKING" ] ),
    
    cTopicaltitem( "COSTS",
                   [ "COSTS" "PRICE", "PRICES", "COST", "COST OF LIVING", "LIVING", "EXPENSE", "EXPENSES",
                     "HIGH COST OF LIVING", "COST LIVING", "COST OF LIVING EXPENSIVE",
                     "EXPENSICVE", "EXPENSIVNESS", "EXSPENSIVE", "FOOD COST", "FOOD COSTS", "FOOD PRICES",
                     "GAS PRICES", "LIVING COSTS", "LIVING EXPENSES", "STORES PRICES" ] ),

    cTopicaltitem( "SAFETY",
                   [ "SAFETY", "SAFE", "SECURITY", "CRIME", "CRIME RATE", "VIOLENCE", "CRIMES", "KILLING",
                     "DANGER", "GUNS", "GUN VIOLENCE", "CRIME DOWNTOWN", "CRIME IN DC", "CRIME INCIDENTS",
                     "CRIME SHOOTING", "CRIME/GANG ACTIVITY", "CRIMINALITY", "DEATH", "DEATH RATE", "DEATHS",
                     "FATALITIES", "GANG", "GANG ACTIVITY", "GANG VIOLENCE", "LAWBRAKERS",
                     "MURDER", "MURDER RATE", "NEIGHBORHOOD VIOLENCE", "ROBBERY", "ROBBERIES",
                     "STREET HARASSMENT", "STREET VIOLENCE", "UNSAFE ENVIRONMENT AT TIMES", "YOUTH CRIME" ] ),

    cTopicaltitem( "PEOPLE",
                   [ "PEOPLE", "POPULATION", "WOMEN", "MEN", "EDUCATION LEVEL", "POPULACE", "RESIDENTS",
                     "OVERPOPULATION", "OVERCROWDING", "POPULATION DENSITY", 
                     "CREEPY PEOPLE", "CROWDS", "CROWD", "CROWDINESS", "CROWDNESS", "FOLKS", "PERSONALITIES",
                     "RUDE", "RUDENESS", "SNOBBERY", "SNOBINESS", "SNOBS", "SNOBS", "UNFRIENDLYNESS" ] ),
    
    cTopicaltitem( "POLITICS",
                   [ "POLITICS", "PROGRESSIVE", "PROGRESSIVE AREA", "PROGRESSIVE COMMUNITY", "DEMOCRATS", "LIBERAL",
                     "POLITICIANS", "REPUBLICANS", "REBUBLICANS", "GOP", "LIBERAL DEMOCRATS", "LIBERALNESS",
                     "POLITICS OVERLOAD" ] ),
    
    cTopicaltitem( "TAXES",
                   [ "TAXES", "TAX", "INCOME TAX", "PROPERTY TAX", "PROPERTY TAXES", "PUNATIVE TAXATION",
                     "REAL ESTATE TAXES", "SALES TAX", "SALES TAXES", "STATE TAX",
                     "TAX HIGH", "TAX RATE", "AXATION WITHOUT REPRESENTATION", "TAXE", "TAXES  PROPERTY" ] ),

    cTopicaltitem( "NOTHING", [ "NOTHING", "NONE" ] ),

    cTopicaltitem( "HOUSING",
                   [ "HOUSING", "HOMES", "HOME PRICES", "APARTMENT", "APARTMENTS", "HOUSES", "RENT",
                     "HOUSING COSTS", "APARTMENT BUILDINGS", "APARTMENT PRICES", "APARTMENT UNITS",
                     "HOUSE PRICE", "HOUSE PRICES", "HOUSE", "HOUSING EXPENSE", "HOUSING LACK",
                     "HOUSING PRICE", "HOUSING PRICES", "HOUSING PRICING", "LIVING  RENT",
                     "LIVING HOME",
                     "PROPERTY COST", "PROPERTY PRICES", "PROPERTY VALUES",
                     "REAL ESTATE", "REAL ESTATE COST", "REAL ESTATE COSTS", "REAL ESTATE PRICES", "REAL ESTATE VALUE",
                     "RENT COST", "RENT PRICES", "RENTAL", "RENTAL COST", "RENTAL COSTS", "RENTAL MARKET",
                     "RENTAL PRICES", "RENTAL RATES", "RENTS" ] ),    

    cTopicaltitem( "WEATHER",
                   [ "WEATHER", "SEASONS", "WINTERS", "SNOW", "CLIMATE", "HUMIDITY", "HEAT",
                     "SUMMERS", "SUMMER HEAT", "SUMMER WEATHER", "EXTREME WEATHER", "HUMID",
                     "RAIN", "SNOW PLACE", "SUMMER HUMIDITY", "SUMMERTIME HEAT", "SUMMERTIME HUMIDITY",
                     "TEMPERATURE EXTREMES", "WEATHER - HEAT", "WEATHER PATTERNS", "WINTER WEATHER" ] ),

    cTopicaltitem( "DRIVERS",
                   [ "DRIVERS", "ROAD RAGE", "WOMEN DRIVERS" ] ),

    cTopicaltitem( "POLLUTION",
                   [ "POLLUTION", "AIR", "AIR POLLUTION", "AIR QUALITY", "SMOG" ] ),

    cTopicaltitem( "TRANSPORTATION",
                   [ "TRANSPORTATION", "TRANSPORT", "ROADS",
                     "TRANSPORTATION OPTIONS", "AMTRAK", "CAR", "POTHOLES",
                     "ROAD CONDITIONS", "ROAD CONSTRUCTION", "ROAD MAINTENANCE",
                     "TRAIN", "TRAIN SERVICE", "TRAINS",
                     "TRANSPORTATION ACCESS", "TRANSPORTATION COSTS", "TRANSPORTATION FEES", "TRANSPORTATION INFRASTRUCTURE",
                     "TRANSPORTATION ISSUES", "TRANSPORTATION LIMITATIONS", "TRANSPORTATION SERVICES", "TRANSPORTATION SYSTEM" ] ),
    cTopicaltitem( "METRO",
                   [ "METRO", "TRANSIT", "PUBLIC TRANSIT", "SUBWAY SYSTEM", "WMATA",
                     "BAD PUBLIC TRANSPORTATION", "METRO FIRES", "METRO NOW", "METRO RAIL SYSTEM", "METRORAIL",
                     "PUBLIC TRANSPORTATION" ] ),
    cTopicaltitem( "BUS",
                   [ "BUSES", "AREA BUS", "BUS", "BUS SERVICE", "BUSSES" ] ),
    cTopicaltitem( "AIRPORTS",
                   [ "AIRPORTS", "AIRLINE HUB", "AIRPORT ACCESSIBILTY", "AIRPORT SELECTION" ] ),
                     
    cTopicaltitem( "PARKING",
                   [ "PARKING", "PARKING AREAS", "PARKING AVAILABILITY", "PARKING FEES", "PARKING ISSUES",
                     "PARKING LOTS", "PARKING RESTRICTION", "PARKING SPACES" ] ),

    cTopicaltitem( "TRUMP",
                   [ "TRUMP", "DONALD TRUMP", "TRUMP HOTEL", "TRUMP KIDS", "TRUMP SUPPORTERS", "TRUMPS" ] ),

    cTopicaltitem( "NOISE",
                   [ "NOISE" ] ),

    cTopicaltitem( "GENTRIFICATION",
                   [ "GENTRIFICATION", "GENETRIFACATION", "GENTFRICATION", "PREDATORY GENTRIFICATION" ] ),

    cTopicaltitem( "POVERTY",
                   [ "POVERTY", "DISPARITIES", "DISPARITY", "INCOME DISPARITY", "INCOME INEQUALITY",
                     "INEQUALITY" ] ),

    cTopicaltitem( "DRUGS",
                   [ "DRUGS" ] ),

    cTopicaltitem( "POLICE",
                   [ "POLICE", "COPS", "LAW ENFORCEMENT", "POLICE BRUTALITY", "POLICE DEPARTMENT" ] ),

    cTopicaltitem( "TOURISTS",
                   [ "TOURISTS", "TOURISM", "TOURIST", "TOURIST AREA", "TOURIST ATTRACTIONS", "TOURIST DOWNTOWN", "TOURIST SEASON" ] ),

    cTopicaltitem( "TRASH",
                   [ "TRASH", "FILTH", "LITTER", "LITTERING" ] ),

    cTopicaltitem( "GANGS",
                   [ "GANGS" ] ),

    cTopicaltitem( "STRESS",
                   [ "STRESS", "PACE", "STRESS LEVEL", "STRESS LEVELS" ] ),

    cTopicaltitem( "RATS",
                   [ "RATS" ] ),

    cTopicaltitem( "CONSTRUCTION",
                   [ "CONSTRUCTION", "CONSTRUCTION NOISE", "DEVELOPMENT", "OVERDEVELOPMENT" ] ),

    cTopicaltitem( "HOMELESSNESS",
                   [ "HOMELESSNESS", "HOMELESS", "HOMELESS POPULATION", "HOMELESS PROBLEM", "HOMELESS SHELTERS" ] ),

    cTopicaltitem( "MONEY",
                   [ "MONEY" ] ),

    cTopicaltitem( "DISCRIMINATION",
                   [ "DISCRIMATION", "DISCRIMINATION", "PREJUDICE", "RACE RELATIONS", "RACIAL DIVISION", "RACISM",
                     "SEGREGATION", "STEREOTYPES" ] ),

    cTopicaltitem( "BUGS",
                   [ "BUGS", "INSECTS", "MOSQUITOS" ] ),

    cTopicaltitem( "TERROR",
                   [ "TERROR TARGET", "TERRORISM", "TERRORIST", "TERRORIST THREAT", "TERRORISTS", "TERRORISTS THREATS", "TERRORORISM THREAT" ] ),

    cTopicaltitem( "CULTURE",
                   [ "CULTURE", "FESTIVALS", "CULTURE EVENTS", 
                     "CULTERAL", "CULTERS", "CULTIRE", "CULTURAL ACTIVITIES", "CULTURAL CENTER", 
                     "CULTURALS", "CULTURE  MUSEUMS", "CULTURE ACTIVITIES", "CULTURE AVAILABILTY", 
                     "CULTURE AWARENESS OPPORTUNITIES", "CULTURE RANGE", "CULTURY", "CULTUTES" ] ),
    cTopicaltitem( "MUSEUMS", 
                   [ "MUSEUM", "MUSEUMS", "MUSUEMS", "SMITHSONIAN", "ACCESS MUSEUMS", 
                     "AFRICAN AMERICAN MUSEUM", "AIR & SPACE", "SMITHSONIAN INSTITUTION", "ZOO", "MEUSEMS" ] ),
    cTopicaltitem( "ARTS", 
                   [ "ARTS", "ART", "ART GALLERIES", "GALLERIES", "ART GALLERY", "ART GALLERYS", "ART INDUSTRY", "ART MUSEUM", 
                     "ART MUSEUMS", "ART OPPORTUNITIES", "ART RESOURCES", 
                     "ARTS AND ENTERTAINMENT", "ARTS CULTURE", "ARTS ENTERTAINMENT MUSEUMS", 
                     "ARTS SCENE", "ARTS/ CULTURE" ] ),
    cTopicaltitem( "PERFORM", 
                   [ "MUSIC", "THEATER", "THEATRE", "THEATERS", "KENNEDY CENTER", 
                     "MUSIC VENUES", "PERFORMANCES", "CONCERTS", "DANCE", "DANCE SCHOOLS",
                     "MUSIC SCENE" ] ),
    cTopicaltitem( "MONUMENTS", 
                   [ "HISTORY", "MONUMENTS", "WHITE HOUSE", "SIGHTS", "SIGHTSEEING",
                     "LANDMARKS", "NATIONAL MALL", 
                     "CHERISHED MONUMENTS", "HISTORICAL" ] ),

    cTopicaltitem( "ENTERTAINMENT",
                   [ "ENTERTAINMENT", "ACTIVITIES", "EVENTS", "FUN", "RECREATION", 
                     "ENTERTAINMENT OPTIONS", "LEISURE ACTIVITIES", "AMUSEMENT PARKS", "AMUSEMENTS",
                     "ENTERTAINMENT CHOICES" ] ),
    cTopicaltitem( "FOOD",
                   [ "FOOD", "FOODS", "RESTAURANTS", "DINING", "FOOD CHOICES", "RESTAURANT SCENE",
                     "RESTAURANT CHOICES", "DINING OPTIONS", "FOOD SCENE", "FOOD PLACES",
                     "FOOD VARIETY", "CUISINE", "CUISINE CHOICES", "CUISINES", "DINING  RANGE", 
                     "DINING CHOICES", "DINING OPPORTUNITIES", "DINING SCENE", "DINING/ENTER TAINMENT",
                     "SEAFOOD", "RESTARAUNTS", "RESTAURANT OPTIONS", "RESTAURANT VARIETY", 
                     "RESTERAUNTS", "RESTUARANTS", "RESTURANT", "BEER", "BEER OPTIONS", "PIZZA",
                     "FOOD OPTIONS" ] ),
    cTopicaltitem( "SPORTS",
                   [ "SPORTS", "SPORTS TEAMS", "TEAMS", "BASEBALL", "FOOTBALL", "HOCKEY", "REDSKINS", 
                     "WIZARDS", "BASEBALL PARK", "BASEBALL TEAM" ] ),
    cTopicaltitem( "NIGHTLIFE",
                   [ "NIGHTLIFE", "NIGHT LIFE", "BARS", "BAR SCENE", "CITY NIGHT LIFE" ] ), 
                   
    cTopicaltitem( "LOCATION",
                   [ "LOCATION", "ACCESS", "ACESS", "ACCESSIBILITY", "ACESSABILITY", 
                     "PROXIMITY", "COAST", "EAST COAST", "BALTIMORE", "CITY ACCESSIBILITY",
                     "CLOSETOEVERYTHING", "COMMUTE DISTANCE", "CLOSENESS", "BEACH ACCESS" ] ),
    cTopicaltitem( "JOBS",
                   [ "JOBS", "JOB", "JOB OPPORTUNITIES", "JOB OPPORTUNITY", "CAREER",
                     "JOB MARKET", "JOB AVAILABILITY", "JOB SECURITY", "WORK",
                     "EMPLOYMENT", "EMPLOYMENT OPPORTUNITIES", "WORK OPPORTUNITIES",
                     "SALARY", "NETWORKING", "UNEMPLOYMENT", "CAREER OPPORTUNITIES", "CAREER OPPORTUNITY",
                     "DEFENSE JOBS", "EMPLOYMENT OPPORTUNITY", "GOVERNMENT JOBS", "SALARIES", "WAGES", "PAY" ] ),

    cTopicaltitem( "WALKABILITY", [ "WALKABILITY", "WALKING DISTANCE", "WALKABLE", "WALKING" ] ),

    cTopicaltitem( "SCHOOLS",
                   [ "SCHOOLS", "SCHOOL", "EDUCATION", "SCHOOL SYSTEM",
                     "UNIVERSITIES", "COLLEGE", "COLLEGES", "EDUCATION SYSTEM", "EDUCATION OPPORTUNITIES",
                     "SCHOOL POLICIES", "SCHOOL QUALITY", "SCHOOLING" ] ),

    cTopicaltitem( "SHOPPING",
                   [ "SHOPPING", "STORES", "STORE", "SHOPS", "SHOPPING CENTERS",
                     "SHOPPING MALLS", "CLOTHES", "CLOTHING", "MALLS", "RETAIL", "SHOPPING OPTIONS",
                     "RETAIL SHOPPING", "RETAIL STORES" ] ),

    cTopicaltitem( "COMMUNITY",
                   [ "COMMUNITY", "NEIGHBORHOODS", "NEIGHBORS", "CLUBS", "CHURCH",
                     "CHURCHES", "BLACK COMMUNITY", "CHURCH COMMUNITY", "CHURCH FAMILY",
                     "COMMUNITY CENTERS", "COMMUNITY FEEL", "COMMUNITY FEELING", 
                     "COMMUNITY SERVICES", "COMMUNITY SUPPORT", "FRIEND", "FRIENDS", "GHETTO" ] ),

    cTopicaltitem( "CAPITAL",
                   [ "CAPITAL", "CAPITOL", "GOVERNMENT", "SENATE", 
                     "NATIONS CAPITAL", "POWER", "CAPITAL CITY", "CONGRESS", "PRESIDENT",
                     "PROTESTORS", "PROTESTS" ] ),

    cTopicaltitem( "LIFE",
                   [ "LIFE", "CITY LIFE", "ATMOSPHERE", "LIVING", "FRIENDLINESS",
                     "CITY FEEL", "DENSITY", "VIBRANCY", "PARTIES", 
                     "CITY CULTURE", "CITY ENVIROMENT", "CITY LIVING", "CITY POPULATION", 
                     "CITY SETTINGS", "LIFESTYLE", "LIFESTYLES", "LIFE STYLE", "CLEANLINESS", "COMFORT",
                     "CONVENIENCE", "CONVIENCE", "MARIJUANA", "MARIJUANA LAWS", 
                     "LIVING CONDITIONS", "SQUARE DC CULTURE" ] ),

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
                     "INCOME", "MINIMUM WAGE", "UNEMPLOYMENT RATE" ] ),

    cTopicaltitem( "SERVICES",
                   [ "SERVICES", "AMENITIES", "HEALTH CARE", "HEALTHCARE", "HOSPITALS",
                     "LIBRARIES", "DOCTORS", "GROCERY STORES", "CITY AMENITIES", "CITY RESOURCES",
                     "DOCTOR AVAILABILITY", "CARE", "SNOW PREPAREDNESS", "SNOW REMOVAL" ] ),

    cTopicaltitem( "FAMILY",
                   [ "FAMILY", "CHILDREN", "FAMILY MEMBERS", "HUSBAND", "SON", "DAUGHTER", "GRANDCHILDREN", "GRANDCHILD",
                     "RELATIVES" ] ),

    cTopicaltitem( "DC", [ "DC", "WASHINGTON DC", "CLOSENESS TO DC" ] ),

    cTopicaltitem( "DIVERSITY",
                   [ "DIVERSITY", "CULTURES", "COMMUNITIES", "MELTING POT", "RACES",
                     "COSMOPOLITAN", "COSMOPOLITANISM", "MULTICULTURALISM", "MULTICULTURE",
                     "COMMUNITY DIVERSITY", "BILINGUALS", "CULTURE VARIETY", "CULTURE/DIVERSITY",
                     "DIVERESTRY", "LGBTQ", "FOREIGNERS", "FOREINGERS", "GAYS",
                     "BLACKS", "WHITES", "CRACKAS",
                     "ILLEGALS", "IMIGRANTS", "IMMIGRANTS", "IMMIGRATION", "INCCURAGING ILLEGALS",
                     "INMIGRANTS", "MUSLIMS" ] )
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

    fieldnames = [ 'caseid', 'respnum', 'entity', 'recode', 'fuzzratio' ]
    
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()
        
    for d in Mydat:

        # print( '-'*30 )
        # print( d.text )

        print( "Processing caseid #", d.caseid, "respnum #", d.respnum )
                
        matches = { 'caseid': d.caseid, 'respnum': d.respnum, 'entity': d.text, 'recode': '', 'fuzzratio': None }

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
