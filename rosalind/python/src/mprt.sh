#!/bin/bash

./mprt.py > ../output/mprt.txt

sed 's/\[//g' ../output/mprt.txt > ../output/mprt.txt.tmp && 
    mv ../output/mprt.txt.tmp ../output/mprt.txt
sed 's/\]//g' ../output/mprt.txt > ../output/mprt.txt.tmp && 
    mv ../output/mprt.txt.tmp ../output/mprt.txt
sed 's/,//g' ../output/mprt.txt > ../output/mprt.txt.tmp && 
    mv ../output/mprt.txt.tmp ../output/mprt.txt
