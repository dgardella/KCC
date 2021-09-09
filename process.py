# -*- coding: latin-1 -*-
# Import libraries
import nltk, re, string, collections , sys
from nltk.util import ngrams # function for making ngrams
from nltk.tokenize import word_tokenize
from tabulate import tabulate
import argparse
import fileinput

# Functions
def count_words(text):
    # do some text cleanup/normalization
    text = text.lower()
    text = text.replace("\n", " ")
    text = text.replace(".","")
    text = text.replace(",","")
    text = text.replace(";","")
    text = text.replace(":","")
    text = text.replace("?"," ")
    text = text.replace("¿"," ")
    text = text.replace("!","")
    text = text.replace("¡","")
    text = text.replace("*","")
    text = text.replace("\"","")
    text = text.replace("\' ","")
    tokenized = text.split()
    ##
    print ('')
    print (' ------------ printing Top 10 -----------  ')
    print ('')
    esBigrams = ngrams(tokenized, 1)
    esBigramFreq = collections.Counter(esBigrams)
    result = esBigramFreq.most_common(10)
    print (tabulate(result,headers=['word ocurrance count', 'Hits'],tablefmt='pretty'))
    print ('--------------------------------------------------')
    print ('')

def process_file(file_name):
    print ('Processing File : ' + file_name)
    try:
        with open(file_name, "r") as file:
            text = file.read()
            count_words(text)
    except IOError:
        print ("ERROR - File : " + file_name + " Is Not accesible") 

# Begin Program
# validate input
# from stdin

if len(sys.argv) > 1:
    # Process file from parameter list
    parser = argparse.ArgumentParser()                                               
    parser.add_argument("--file", "-f", type=str, nargs='+')
    args = parser.parse_args()
    # Process multiple files if required
    for f in args.file:
        process_file(f)
     
else:
    # Process text from stdin
    stdindata = sys.stdin.readlines()
    listToStr = ' '.join(map(str, stdindata))
    text = listToStr
    count_words(text)
