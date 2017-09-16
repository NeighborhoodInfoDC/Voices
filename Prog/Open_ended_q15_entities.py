# Open_ended_q15_entities.py
# Test use of Google Natural Language Processing for parsing open-ended responses to 
# VoicesDMV survey, question 15. 
#
# P. Tatian

import csv
import time
from google.cloud import language
from google.cloud.language import enums
from google.cloud.language import types


class cDatrow:

    def __init__(self, caseid, text ):
        self.caseid = caseid
        self.text = text

class cPlacealtitem:

    def __init__(self, label, alt):
        self.label = label
        self.alt = alt        

# Input and output files
# inFile = 'L:\Libraries\Voices\Raw\Q15.csv'
# outFile = 'L:\Libraries\Voices\Raw\Q15_recode.csv'

inFile = 'C:\DCData\Libraries\Voices\Raw\Q15.csv'
outFile = 'C:\DCData\Libraries\Voices\Raw\Q15_entities.csv'

# Time program execution
start_time = time.time()

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

# Use Google NLP to extract key entities from each response

with open(outFile, 'w', newline='') as csvfile:

    fieldnames = [ 'caseid', 'respnum', 'entity' ]
    
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()

    caseidHold = 0
    respnum = 0
        
    for d in Mydat:

        if caseidHold == d.caseid:
            respnum = respnum + 1
        else:
            respnum = 1
            caseidHold = d.caseid

        print( "Processing caseid #", d.caseid, " resp #", respnum )
        # print( d.text )

        time.sleep(0.1) # 0.1 seconds delay to avoid Google NLP quota
                
        document = language.types.Document(
            content=d.text,
            type='PLAIN_TEXT',
        )
        
        response = client.analyze_entities(
            document=document,
            encoding_type='UTF32',
        )

        for entity in response.entities:

            row = { 'caseid': d.caseid, 'respnum': respnum, 'entity': entity.name }

            writer.writerow( row )
            # print( row )

print("--- %s minutes ---" % ((time.time() - start_time)/60))
