#!/bin/bash
#CS2600 Project 3
#Ryan Mangilin
echo "Please enter the phonebook file name: "
read phonebook #reads phonebook file name
file=$phonebook
cat $file > temp.txt
temp=temp.txt
while [ TRUE ] #reprompts menu 
do
    echo "(1) List of records in First Name alphabetical order"
    echo "(2) List of records in Last Name alphabetical order"
    echo "(3) List of records in reverse First Name alphabetical order"
    echo "(4) List of records in reverse Last Name alphabetical order"
    echo "(5) Search for a record by Last Name"
    echo "(6) Search for a record by Birthday"
    echo "(7) Insert Record"
    echo "(8) Delete Record"
    echo "(9) Exit"
    echo "Please choose an option (1-9)"
    read i #reads menu input

    if [ $i == 1 ] 
    then
	clear
	sort $file > $temp #sorts and dumps into temp file
	cat $temp #displays the dumped file
	echo " "
	echo "Press Enter to continue"
	read x
    elif [ $i == 2 ]
    then
	clear
	sort -k 2 $file > $temp #sorts by 2nd field and dumps into text file
	cat $temp #displays sorted dump file
	echo " "
        echo "Press Enter to continue"
        read x
    elif [ $i == 3 ]
    then
	clear
	sort -r $file #displays reverse sorted file
	sort -r $file > $temp #sorts in reverse then dumps into text file
	echo " "
	echo "Press Enter to continue"
        read x
    elif [ $i == 4 ]
    then
	clear
	sort -r -k 2 $file > $temp #sorts by 2nd field in reverse then dumps
        cat $temp #displays the contents of temp 
	echo " "
        echo "Press Enter to continue"
        read x
    elif [ $i == 5 ]
    then
	clear
	echo "Enter Last Name: "
	read ln #reads input
	clear
	awk -v var="$ln" -F'[ :]' '$0 ~ var {print $0}' $file #searches for last name
	echo " "
        echo "Press Enter to continue"
	read x
    elif [ $i == 6 ]
    then
	clear
	echo "Enter Birthday (MM/DD/YY): "
	read bd
	clear
	awk -v var="$bd" -F'[ :]' '$0 ~ var {print $0}' $file #searches for birthday
	echo " "
        echo "Press Enter to continue"
	read x
    elif [ $i == 7 ]
    then
        clear
	echo "Enter the First and Last Name(Please Capitalize First and Last Name: "
	read fl
	echo "Enter the Phone Number(###-###-####): "
	read pn
	pnCount=${#pn}
	if [ $pnCount == 12 ] #checks if phone number is in correct format
	then
	    echo "Enter Address and Street: "
	    read ad
	    echo "Enter City: "
	    read cit
	    echo "Enter State Initials and ZIP: "
	    read si
	    echo "Enter Birthday (MM/DD/YY): "
	    read by
	    echo $fl":"$pn":"$pn":"$ad","$cit","$si":"$by >> $temp #appends the given content into temp file
	    sort $temp #sorts file to properly place inserted record
	    echo " "
            echo "Press Enter to continue"
            read x
	else
	    echo "Incorrect phone number paramaters please press enter and try again"
	fi
    elif [ $i == 8 ]
    then
	clear
	echo "Enter the Last Name or Phone Number of record to be deleted: "
	read del
	clear
	sed "/$del/d" $file > $temp #deletes record then dumps to temp
	cat $temp
	echo " "
        echo "Press Enter to continue"
        read x
    elif [ $i == 9 ]
    then
	cat $temp > $file #dumps contents of temp phonebook into phonebook file
	break
    fi
done
