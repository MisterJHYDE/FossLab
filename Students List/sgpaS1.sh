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
	    *'MA101'*)
	    	credit=4	;;	    
	    *'PH100'*)
		credit=4	;;
	    *'BE110'*)
    		credit=3	;;
	    *'BE10105'*)
    		credit=3	;;
	    *'BE103'*)
    		credit=3	;;		    
    	    *'EE100'*)
	    	credit=3	;;
    	    *'PH110'*)
    		credit=1	;;
	    *'EE110'*)
    		credit=1	;;
	    *)
		credit=0	;;
	esac		

	sgpa=$(expr "$sgpa+$add*$credit" | bc -l);
    done

    sgpa=$(expr "scale=3; $sgpa/22"|bc -l); 
    echo -e "${line:0:3} $sgpa" >> Files/ResultCSS1N.txt	
done < Files/CSS1.txt 
	
