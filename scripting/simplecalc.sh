#! /bin/bash
clear
sum=0
i="y"

while [ $i = "y" ]; do
	echo -e "\nEnter a number : "
	read n1
	echo "Enter second number : "
	read n2

	echo -e "\n1. Addition"
	echo "2. Subtraction"
	echo "3. Multiplication"
	echo "4. Division"
	echo -e "\nEnter your choice : "
	read ch
	case $ch in
		1)
			sum=$(expr $n1 + $n2)
			echo "Sum = "$sum
			;;
		2)
			sum=$(expr $n1 - $n2)
			echo "Diff = "$sum
			;;
		3)
			sum=$(expr $n1 \* $n2)
			echo "Mul = "$sum
			;;
		4)
			sum=$(expr $n1 / $n2)
			echo "Div = "$sum
			;;
		*) echo -e "\nInvalid choice" ;;
	esac
	echo -e "\nDo u want to continue (y/n)) ?"
	read i
	if [ $i != "y" ]; then
		exit
	fi
done
