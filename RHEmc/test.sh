#!/bin/bash


./RHEmc \
    -g adr.txt \
    -p simulatedphenos/pheno_1.txt \
    -k 50 -jn 100 \
    -o out1.txt \
    -annot annot.txt

# ../RHEmc -g adr.txt -c sample.cov -p sample.pheno.plink -k 100 -jn 100  -o newout.txt -annot sample.annot.txt
