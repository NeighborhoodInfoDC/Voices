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

    def __init__(self, caseid, text, matches ):
        self.caseid = caseid
        self.text = text
        self.dc = matches

class cPlacemapitem:

    def __init__(self, label, alt):
        self.label = label
        self.alt = alt

class cPlacematchitem:

    def __init__(self, label):
        self.label = label
        self.found = False

Placemap = [
    cPlacemapitem( "DC", [ "DC", "WASHINGTON DC" ] ),
    cPlacemapitem( "PG", [ "PG", "PRINCE GEORGES" ] ),
    cPlacemapitem( "MC", [ "MONTGOMERY COUNTY" ] )
]

for x in Placemap:
    print( x.label, x.alt )

Placematch = [
    cPlacematchitem( "DC" ),
    cPlacematchitem( "PG" ),
    cPlacematchitem( "MC" )
]

for x in Placematch:
    print( x.label, x.found )


Mydat = []

with open('L:\Libraries\Voices\Raw\Q1dat_10obs.csv', newline='') as f:
    dialect = 'excel'
    reader = csv.reader(f)
    next(reader)    # Skip header row
    for row in reader:
        Datrow = cDatrow(row[0],row[1],Placematch)
        Mydat.append(Datrow)
        # print(row[1])
        # Mydat.caseid.append(row[0])
        # Mydat.text.append(row[1])

# Instantiates a Google language services client
client = language.LanguageServiceClient()

# Translate table to strip out punctuation 
trantab = str.maketrans( "", "", ".'" )

for d in Mydat:

    print( '-'*30 )
    print( d.caseid, d.text )
            
    document = language.types.Document(
        content=d.text,
        type='PLAIN_TEXT',
    )
    
    response = client.analyze_entities(
        document=document,
        encoding_type='UTF32',
    )

    for entity in response.entities:
        print(entity.type, entity.name, fuzz.ratio( str.upper(entity.name).translate(trantab), "DC") )
 
        
    
    # print( d.caseid, d.text, d.dc )
    # print( response.entities )

