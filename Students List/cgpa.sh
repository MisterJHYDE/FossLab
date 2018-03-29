#!/bin/bash
while read line
do
    cgpa=0
    for var in ${line:4:15}
    do
        cgpa=$(expr "scale=3; $cgpa+$var" | bc -l);
    done
    cgpa=$(expr "scale=3; $cgpa*0.5" | bc -l);
    echo $line $cgpa >> Files/CgpaCS.txt
done < Files/ResultCS.txt