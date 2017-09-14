# Open_ended_q1_test.py
# Test use of Google Natural Language Processing for parsing open-ended responses to 
# VoicesDMV survey, question 1. 
#
# P. Tatian

import csv
from google.cloud import language
from google.cloud.language import enums
from google.cloud.language import types
from fuzzywuzzy import fuzz
# from fuzzywuzzy import process


class cDatrow:

    def __init__(self, caseid, text ):
        self.caseid = caseid
        self.text = text
        self.matches = { "DC": False, "MC": False, "PG": False, "FC": False, "NV": False, "OT": False }

class cPlacealtitem:

    def __init__(self, label, alt):
        self.label = label
        self.alt = alt        

# Define place name alternates
Placealt = [
    cPlacealtitem( "DC", [ "DC", "WASHINGTON DC" ] ),
    cPlacealtitem( "PG", [ "PG", "PRINCE GEORGES" ] ),
    cPlacealtitem( "MC", [ "MONTGOMERY COUNTY" ] ),
    cPlacealtitem( "FC", [ "FAIRFAX COUNTY" ] ),
    cPlacealtitem( "NV", [ "NORTHERN VIRGINA", "NOVA", "ARLINGTON", "ALEXANDRIA" ] )
]

for x in Placealt:
    print( x.label, x.alt )


# Instantiates a Google language services client
client = language.LanguageServiceClient()

# Translate table to strip out punctuation 
trantab = str.maketrans( "", "", ".'" )

# Read in responses

Mydat = []

with open('L:\Libraries\Voices\Raw\Q1dat_10obs.csv', newline='') as f:
    dialect = 'excel'
    reader = csv.reader(f)
    next(reader)    # Skip header row
    for row in reader:
        Datrow = cDatrow(row[0],row[1])
        Mydat.append(Datrow)
        # print(row[1])
        # Mydat.caseid.append(row[0])
        # Mydat.text.append(row[1])

# Check place name matches for each response

for d in Mydat:

    print( '-'*30 )
    print( d.text )
            
    document = language.types.Document(
        content=d.text,
        type='PLAIN_TEXT',
    )
    
    response = client.analyze_entities(
        document=document,
        encoding_type='UTF32',
    )

    for entity in response.entities:

        foundmatch = False;

        for place in Placealt:
            for alt in place.alt:
                if fuzz.ratio( str.upper(entity.name).translate(trantab), alt) > 65:
                    d.matches[place.label] = True
                    foundmatch = True
                    print( entity.name, " // ", place.label, alt, fuzz.ratio( str.upper(entity.name).translate(trantab), alt) )
                    
        if not foundmatch:
            d.matches["OT"] = True
            print( entity.name, " // ", "OT" )

    print( d.caseid, d.matches )

    
        
print( '='*30 )
for d in Mydat:
    print( d.caseid, d.matches )
    
    # print( d.caseid, d.text, d.dc )
    # print( response.entities )

