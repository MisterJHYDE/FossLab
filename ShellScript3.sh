#!/bin/bash
#Menu Driven Calculator
#hey 2nd time
echo "Calculator"
while :
do
	echo -n "Enter two numbers: "
	read NUMBER1
	read NUMBER2
	
	echo "1:Addition"
	echo "2:Subtraction"
	echo "3:Multiplication"
	echo "4:Division"
	echo "5:Modulus"
	echo "^C to Exit"
	echo -n "Enter: "
	read INPUT_CHOICE

	case $INPUT_CHOICE in
		1)
			echo -n "Sum: "$((NUMBER1 + NUMBER2))  ;;
		2)
			echo -n "Difference: "$((NUMBER1 - NUMBER2))  ;;
		3)
			echo -n "Product: "$((NUMBER1*NUMBER2))  ;;
		4)
			if [ "$NUMBER2" == 0 ]
			then
				echo -n "Invalid Number"
			else
				echo -n "Quotient: "$((NUMBER1/NUMBER2))
			fi
			;;
		5)
			echo -n "Modulus: "$((NUMBER1%NUMBER2))  ;;	
	esac
	echo
done	
