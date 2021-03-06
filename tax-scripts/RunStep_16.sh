#!/bin/bash

# This is a sourceable bash script that runs step 16 of the workflow.  
# Clean-up step: intermediate files will be deleted, and all other files 
# will be sorted into 4 folders: analysis, data, databases, scripts.
# RRR 2/11/16

# Make sure you're really done before deleting stuff.
# This leaves everything you'd need to re-analyze from the beginning,
# But removes things you'd need to re-analyze from the middle.

# command line syntax:
# ./RunStep_16.sh otus custom general

# ---- Receive input from terminal arguments --------------------------------------------------------------------------------------------

otus=$1
custom=$2
general=$3

printf "Running TaxAss step 16 (folder cleanup!).\n"
printf "\notu filenames: $otus.fasta and $otus.abund\n"
printf "custom database filenames: $custom.fasta and $custom.taxonomy\n"
printf "general database filenames: $general.fasta and $general.taxonomy\n"

# ---- What sparks joy? -----------------------------------------------------------------------------------------------------------------
# 16
rm ${custom}.db.* ${custom}.8mer ${custom}.${custom}* ${custom}.tree* ${general}.8mer ${general}.${general}* ${general}.tree* *wang* mothur.*.logfile ${otus}.${custom}.blast* ids* ${otus}.below*.fasta ${otus}.above*.fasta ${otus}.[0-9][0-9].taxonomy ${otus}.[0-9][0-9][0-9].taxonomy ${otus}.${general}.taxonomy ${otus}.${custom}.taxonomy ${otus}.${custom}.[0-9]* ${custom}.${general}* *pvalues total* final*names
mkdir scripts ; mv *.py *.R *.sh *.md scripts
mkdir analysis ; mv conflicts* *.txt *.Rmd *.html *.xlsx plots analysis
mkdir data ; mv ${otus}* *.rds data
mkdir databases ; mv *.taxonomy *.fasta databases

printf 'All Done! \n \a'
sleep .1; printf '\a'; sleep .1; printf '\a'; sleep .1; printf '\a'; sleep .1; printf '\a'; sleep .1; printf '\a'; 

exit 0