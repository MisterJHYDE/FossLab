#!/bin/bash

while read line
do
    sgpa=0
    for var in $line
    do
        case $var in
            *'(O)'*) 
                add=10	   ;;
            *'(A+)'*)
                add=9  	   ;;
            *'(A)'*) 
               add=8.5    ;;
            *'(B+)'*)
               add=8      ;;
            *'(B)'*)
                add=7      ;;
            *'(C)'*)
                add=6      ;;
            *'(P)'*)
                add=5      ;;
            *)
                add=0	   ;; 
        esac             
	
	case $var in
	    *'CY100'*)
	    	credit=4	;;	    
	    *'BE100'*)
		credit=4	;;
	    *'EC100'*)
    		credit=3	;;
	    *'CY110'*)
    		credit=1	;;
	    *'EC110'*)
    		credit=1	;;		    
    	    *'MA102'*)
	    	credit=4	;;
    	    *'BE102'*)
    		credit=3	;;
	    *'CS100'*)
    		credit=3	;;
	    *)
		credit=0	;;
	esac		

	sgpa=$(expr "$sgpa+$add*$credit" | bc -l);
    done
    sgpa=$(expr "scale=3; $sgpa/23"|bc -l); 
    echo -e "${line:0:3} $sgpa" >> Files/ResultCSS2N.txt	
done < Files/CSS2.txt 
	
