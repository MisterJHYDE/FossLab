#!/bin/bash

# Results Folder Contains The Downloaded S1 and S2 Results
pdftotext Results/Result_S1.pdf -layout
pdftotext Results/Result_S2.pdf -layout

mkdir Files

grep -A2 MDL16CS Results/Result_S1.txt > Files/MDLS1.txt
grep -A1 MDL16CS Results/Result_S2.txt > Files/MDLS2.txt

cat Files/MDLS1.txt | tr -s "[:space:]" ' ' > Files/LongListedS1.txt
cat Files/MDLS2.txt | tr -s "[:space:]" ' ' > Files/LongListedS2.txt

sed 's/MDL16CS/\n/g' Files/LongListedS1.txt > Files/S1.txt
sed 's/MDL16CS/\n/g' Files/LongListedS2.txt > Files/S2.txt  
awk 'NF' Files/S1.txt > Files/CSS1.txt
awk 'NF' Files/S2.txt > Files/CSS2.txt

./sgpaS1.sh
./sgpaS2.sh

join Files/ResultCSS1N.txt Files/ResultCSS2N.txt >> Files/ResultCS.txt
./cgpa.sh

curl http://14.139.184.212/ask/c4b/c4b.txt >> Files/StudentNames.txt 

awk '$1<"62" {print $6}' Files/StudentNames.txt >> Files/CSB.txt
awk '{print "MDL16CS"$0}' Files/CgpaCS.txt >> Files/CGPA.txt
join Files/CGPA.txt Files/CSB.txt >> Files/CSBResults.txt

awk "NR>1&&NR<63"'{print $1, $2$3$4, $5, $6, $7 , $8, $9, "\t"}' Files/StudentNames.txt >> Files/TEMPSTUDENTLIST.txt
join -o 1.1 1.2 1.3 1.4 2.2 2.3 2.4 1.5 1.6 1.7 -1 4 -2 1 Files/TEMPSTUDENTLIST.txt Files/CGPA.txt >> CSBStudentList.txt

sed -i '1 i\No Roll-No  Reg-No  Adm-No    S1    S2    CGPA  Name' CSBStudentList.txt

rm -rf Files







