# Open_ended_q2.py
# Test use of Google Natural Language Processing for parsing open-ended responses to 
# VoicesDMV survey, question 2. 
#
# P. Tatian

import csv
import time
from google.cloud import language
from google.cloud.language import enums
from google.cloud.language import types
from fuzzywuzzy import fuzz
# from fuzzywuzzy import process


class cDatrow:

    def __init__(self, caseid, text ):
        self.caseid = caseid
        self.text = text

class cPlacealtitem:

    def __init__(self, label, alt):
        self.label = label
        self.alt = alt        

# Input and output files
inFile = 'L:\Libraries\Voices\Raw\Q2.csv'
outFile = 'L:\Libraries\Voices\Raw\Q2_recode.csv'

# Define place name alternates
Placealt = [
    cPlacealtitem( "DC", [ "DC", "WASHINGTON DC", "DISTRICT OF COLUMBIA" ] ),
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

with open(inFile, newline='') as f:
    reader = csv.reader(f, dialect='excel')
    next(reader)    # Skip header row
    for row in reader:
        if row == []:
            break
        Datrow = cDatrow(row[0],row[1])
        Mydat.append(Datrow)

print( len(Mydat), " input observations read." )

# Check place name matches for each response

with open(outFile, 'w', newline='') as csvfile:

    fieldnames = [ 'caseid', 'entity', 'DC', 'MC', 'PG', 'FC', 'NV', 'OT' ]
    
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()
        
    for d in Mydat:

        # print( '-'*30 )
        # print( d.text )

        print( "Processing caseid #", d.caseid )
        time.sleep(0.1) # 0.1 seconds
                
        document = language.types.Document(
            content=d.text,
            type='PLAIN_TEXT',
        )
        
        response = client.analyze_entities(
            document=document,
            encoding_type='UTF32',
        )

        for entity in response.entities:

            matches = { 'caseid': d.caseid, 'entity': entity.name, "DC": '', "MC": '', "PG": '', "FC": '', "NV": '', "OT": '' }

            foundmatch = False;

            for place in Placealt:
                for alt in place.alt:
                    if fuzz.ratio( str.upper(entity.name).translate(trantab), alt) > 70:
                        matches[place.label] = 'X'
                        foundmatch = True
                        # print( entity.name, " // ", place.label, alt, fuzz.ratio( str.upper(entity.name).translate(trantab), alt) )
                        
            if not foundmatch:
                matches["OT"] = 'X'
                # print( entity.name, " // ", "OT" )

            writer.writerow( matches )
            # print( matches )

    
        
