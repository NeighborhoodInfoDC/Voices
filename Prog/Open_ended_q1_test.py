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

    def __init__(self):
        self.caseid = []
        self.text = []
        self.dc = []

Mydat = []

with open('C:\DCData\Libraries\Voices\Raw\Q1dat_100obs.csv', newline='') as f:
    dialect = 'excel'
    reader = csv.reader(f)
    next(reader)    # Skip header row
    for row in reader:
        Datrow = cDatrow()
        Datrow.caseid = row[0]
        Datrow.text = row[1]
        Mydat.append(Datrow)
        # print(row[1])
        # Mydat.caseid.append(row[0])
        # Mydat.text.append(row[1])

# Instantiates a Google language services client
client = language.LanguageServiceClient()

# Translate table to strip out punctuation 
trantab = str.maketrans( "", "", "." )

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
        if 1: # entity.type == 2 or entity.type == 1 or entity.type == 7:
            # print(entity.type, entity.name, fuzz.ratio( str.upper(entity.name).translate(trantab), "DC") )
            print("    ", entity.type, entity.name )
        
        
    
    # print( d.caseid, d.text, d.dc )
    # print( response.entities )

